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
- [Inspiration](#inspiration)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

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

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/CanRau/asdf-ni/graphs/contributors)!

# Inspiration

The following plugins were of great help understanding how to get asdf-ni working

- [asdf-pnpm](https://github.com/jonathanmorley/asdf-pnpm)
- [asdf-golang](https://github.com/asdf-community/asdf-golang)

# License

See [LICENSE](LICENSE) © ['CanRau'](https://github.com/CanRau/)
