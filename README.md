<div align="center">

# asdf-purty ![Build](https://github.com/nsaunders/asdf-purty/workflows/Build/badge.svg) ![Lint](https://github.com/nsaunders/asdf-purty/workflows/Lint/badge.svg)

[purty](https://gitlab.com/joneshf/purty) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Dependencies

The only dependencies are `bash`, `curl`, and `tar`.

# Install

Plugin:

```shell
asdf plugin-add purty
# or
asdf plugin-add https://github.com/nsaunders/asdf-purty.git
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
