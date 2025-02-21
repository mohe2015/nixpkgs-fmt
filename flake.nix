{
  description = "nixpkgs-fmt";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.naersk.url = "github:nmattia/naersk";
  inputs.naersk.inputs.nixpkgs.follows = "nixpkgs";
  inputs.fenix.url = "github:nix-community/fenix";
  inputs.fenix.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, naersk, fenix, flake-utils }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import ./. { inherit system inputs; }; in
      {
        defaultPackage = pkgs.nixpkgs-fmt;
        legacyPackages = pkgs;
        devShell = pkgs.devShell;
      }
    );
}
