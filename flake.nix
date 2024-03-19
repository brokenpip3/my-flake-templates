{
  description = "Template flake for creating new projects";

  inputs = {
      nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: {

    templates.base = {
      path = templates/base-with-flake;
      description = "Basic project configs and files with flake";
      welcomeText = ''
        #
        ## Intended usage
        This template will inizialized the repo with a simple flake with a minimal devshell to run the ci.

        ## More info
        - [Template repo](https://github.com/brokenpip3/my-flakes-templates)
      '';
    };

    templates.python-poetry = {
      path = templates/python-poetry;
      description = "Basic project configs and files without flake";
      welcomeText = ''
        # Python poetry flake template
        ## Using this Flake

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

        ## More details

        - [poetry2nix](https://github.com/nix-community/poetry2nix)
      '';
    };

    templates.default = self.templates.base;

    devShell.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [
            (nixpkgs.legacyPackages.x86_64-linux.writeShellApplication {
              name = "update_templates";
              runtimeInputs = with nixpkgs.legacyPackages.x86_64-linux; [ bash coreutils ];
              text = builtins.readFile ./common/_update.sh;
            })
      ];
    };
  };
}
