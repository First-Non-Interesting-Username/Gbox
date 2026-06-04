# Contributing to Gbox

Thanks for your interest in contributing! Here's how to get started.

## Development Setup

1. Fork and clone the repository
2. Install [buildah](https://github.com/containers/buildah) for building and testing images locally (This step is not neccessary with devcontainers or devenv)

## Making Changes

### Containerfile

The main image definition is in `Containerfile.gbox`. It uses a multi-stage build.

### Files

Additional configuration files live under `files/` and are copied into the image at build time.

### Workflows

CI/CD is defined in `.github/workflows/`. Changes to workflows should be tested by triggering the workflow on your fork.

## Building Locally

```bash
# Plasma variant
buildah build --target gbox-plasma -f Containerfile.gbox -t gbox:local .

# GNOME variant
buildah build --target gbox-gnome -f Containerfile.gbox -t gbox:local .
```

## Pull Requests

- Keep changes focused and scoped to a single concern
- Test the build locally before submitting
- Describe what changed and why in your PR description

## License

By contributing, you agree that your contributions will be licensed under the GPL-3.0 license. Note that portions of this project are derived from Universal Blue's steambox project and are used under the Apache 2.0 license — see [NOTICE](./NOTICE) for details.
