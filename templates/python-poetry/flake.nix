{
  description = "Application packaged using poetry2nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, poetry2nix, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        inherit (poetry2nix.lib.mkPoetry2Nix { inherit pkgs; }) mkPoetryApplication;
      in
      {
        # nix fmt formatter
        formatter = nixpkgs.legacyPackages.${system}.nixpkgs-fmt;

        packages = {
          myapp = mkPoetryApplication { projectDir = ./.; };
          default = self.packages.${system}.myapp;
        };

        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.myapp ];
          packages = with pkgs; [
            poetry
            python3
            pre-commit
            ruff
          ];
          PYTHONDONTWRITEBYTECODE = 1;
          POETRY_VIRTUALENVS_IN_PROJECT = 1;
        };
      });
}
