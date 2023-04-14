{
  description = "ctdbase brick for BioBricks.ai";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };
  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      with import nixpkgs { inherit system; };
      let R-pkgs = with rPackages; [ arrow fs purrr rvest vroom ];
      in {
        devShells.default =
          mkShell { buildInputs = [ arrow-cpp R ] ++ R-pkgs; };
      });
}
