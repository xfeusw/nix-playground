{
  description = "Nix playground";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
  {
    self,
    nixpkgs,
    flake-utils,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = import ./hosts {
      inherit
        inputs
        pkgs
        system
        nixpkgs
        ;
    };
  };
}
