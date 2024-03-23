{
  description = "Flake templates for creating new projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, }: {

    templates.base = {
      path = templates/base-with-flake;
      description = "Basic project configs and files with flake";
      welcomeText = builtins.readFile templates/base-with-flake/README.md;
    };

    templates.python-poetry = {
      path = templates/python-poetry;
      description = "Poetry project config with nix integration";
      welcomeText = builtins.readFile templates/python-poetry/README.md;
    };

    templates.default = self.templates.base;

    devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
      packages = [
        nixpkgs.legacyPackages.x86_64-linux.pre-commit
        (nixpkgs.legacyPackages.x86_64-linux.writeShellApplication {
          name = "update_templates";
          runtimeInputs = with nixpkgs.legacyPackages.x86_64-linux; [ bash coreutils ];
          text = builtins.readFile ./common/_update.sh;
        })
      ];
    };
  };
}
