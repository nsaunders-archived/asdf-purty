<div align="center">

# asdf-purty ![Build](https://github.com/nsaunders/asdf-purty/workflows/Build/badge.svg) ![Lint](https://github.com/nsaunders/asdf-purty/workflows/Lint/badge.svg)

[purty](https://gitlab.com/joneshf/purty) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add purty
# or
asdf plugin add https://github.com/nsaunders/asdf-purty.git
```

purty:

```shell
# Show all installable versions
asdf list-all purty

# Install specific version
asdf install purty latest

# Set a version globally (on your ~/.tool-versions file)
asdf global purty latest

# Now purty commands are available
purty
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/nsaunders/asdf-purty/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Nick Saunders](https://github.com/nsaunders/)
