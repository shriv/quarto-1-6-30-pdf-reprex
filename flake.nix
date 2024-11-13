{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfreePredicate =
            pkg:
            builtins.elem (pkgs.lib.getName pkg) [
              "positron-bin"
            ];
        };
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            quarto
            positron-bin
			texliveSmall
			texlivePackages.latexmk
          ];
        };
      }
    );
}