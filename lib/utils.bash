#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/antfu/ni"
REGISTRY_URL="https://registry.npmjs.org/@antfu/ni"
TOOL_NAME="ni"
TOOL_TEST="ni --help"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if ni is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

# list_github_tags() {
# 	git ls-remote --tags --refs "$GH_REPO" |
# 		grep -o 'refs/tags/.*' | cut -d/ -f3- |
# 		sed 's/^v//' # NOTE: You might want to adapt this sed to remove non-version strings from tags
# }

list_all_versions() {
	curl --silent --fail --show-error --location ${REGISTRY_URL} |
		grep -Eo '"version":"[^"]+"' |
		cut -d\" -f4 |
		sort_versions |
		xargs echo
}

get_latest_version() {
	curl --silent --fail --show-error --location ${REGISTRY_URL} |
		grep -Eo '"latest":"[^"]+"' |
		cut -d\" -f4 |
		xargs echo
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"

	url="${REGISTRY_URL}/-/ni-${ASDF_INSTALL_VERSION}.tgz"

	echo "* Downloading $TOOL_NAME release $version..."
	# echo "\n\n$filename\n\n"
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
	# tar xzf - --strip-components=1 --no-same-owner -C "$filename"
	# echo "\n\nfilename\n\n"
	# echo $(ls -lah $install_path)
	# echo "\n\nfilename\n\n"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"
		cp -r "$ASDF_DOWNLOAD_PATH/bin"/* "$install_path"

		# chmod +x "$install_path/bin/*"
		find "$install_path" -type f -exec chmod +x {} \;

		# printf "\n\ninstall_path $install_path\n\n"
		# echo $(ls -l $install_path)
		for f in "$install_path"/*; do
			# echo "File -> $f"
			# ln -sf $(echo $f |sed -e 's/.mjs//') $f
			mv "$f" $(echo "$f" | sed -e 's/.mjs//')
		done

		# printf "\n\n"
		# find "$install_path" -type f -exec echo '{}' \;
		# ls -l $install_path
		# printf "\n\ninstall_path\n\n"

		# printf "\n\nASDF_DOWNLOAD_PATH $ASDF_DOWNLOAD_PATH\n\n"
		# # echo $(ls -l $ASDF_DOWNLOAD_PATH)
		# for f in "$ASDF_DOWNLOAD_PATH/"; do
		# 	echo "File -> $f"
		# done
		# printf "\n\nASDF_DOWNLOAD_PATH\n\n"

		local tool_cmd
		tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"

		# echo "\n\ntool_cmd $tool_cmd\n\n"

		test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
