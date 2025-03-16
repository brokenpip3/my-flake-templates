# My python app

`<change-me>`

## Notes

### Using this Flake

This flake is designed to package applications using poetry2nix. Follow these steps to use this flake:

1. Add the script in the pyproject.toml file of your project:

```toml
[tool.poetry.scripts]
app = "src.myfile:main"
```

* `src` is the source directory of your python files
* `myfile` it's the file where the main function is
* `main` name of the main function

2. Run `nix develop` to set up the development environment with the necessary dependencies.
3. Run `poetry install`
4. Write you application and add the dependencies each time with `poetry add <name>`
5. Run `nix run` or `nix build` to build and run this application using nix

### More details

- [poetry2nix](https://github.com/nix-community/poetry2nix)

### Template

This repo has been inizialized with:

```bash
nix flake init -t github:brokenpip3/my-flake-templates#python-poetry
```
