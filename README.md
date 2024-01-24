<div align="center">

# asdf-ni [![Build](https://github.com/CanRau/asdf-ni/actions/workflows/build.yml/badge.svg)](https://github.com/CanRau/asdf-ni/actions/workflows/build.yml) [![Lint](https://github.com/CanRau/asdf-ni/actions/workflows/lint.yml/badge.svg)](https://github.com/CanRau/asdf-ni/actions/workflows/lint.yml)

[ni](https://github.com/antfu/ni) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [asdf-ni ](#asdf-ni--)
- [Contents](#contents)
- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add ni
# or
asdf plugin add ni https://github.com/CanRau/asdf-ni.git
```

ni:

```shell
# Show all installable versions
asdf list-all ni

# Install specific version
asdf install ni latest

# Set a version globally (on your ~/.tool-versions file)
asdf global ni latest

# Now ni commands are available
ni --help
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/CanRau/asdf-ni/graphs/contributors)!

# License

See [LICENSE](LICENSE) © ['CanRau'](https://github.com/CanRau/)
