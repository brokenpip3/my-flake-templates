# My flake templates

These are my super opinionated flake templates that will contain a common ground of general utils files.

## Common files

Each template will contain by default:

- [`gitignore`](./common/files/.gitignore)
- [`git-commit-template`](./common/files/.git-commit-template)
- [`.pre-commit-config.yaml`](./common/files/.pre-commit-config.yaml)
- [`taskfile`](./common/files/taskfile.yaml)
- [`.envrc`](./common/files/.envrc)
- [`.editorconfig`](./common/files/.editorconfig)
- [`.dependabot`](./common/files/.github/dependabot.yaml)
- some GitHub actions:
  - [`pre-commit` check with flake](./common/files/.github/workflows/ci-pre-commit.yaml)
  - TBD

## Templates

### Basic with flake

This template will initialize the repo with a simple flake with a minimal devshell to run the CI.

```bash
nix flake init -t github:brokenpip3/my-flake-templates#base
```

### Python Poetry

This flake template is designed to package applications using poetry2nix.

```bash
nix flake init -t github:brokenpip3/my-flake-templates#python-poetry
```

### Golang gomod

TBD, not yet completed

```bash
nix flake init -t github:brokenpip3/my-flake-templates#golang-gomod
```

### Terraform

TBD
