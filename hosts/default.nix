{
  inputs,
  pkgs,
  system,
  nixpkgs,
  ...
}: let
  mkHost = {
    hostPath,
  }:
    nixpkgs.lib.nixosSystem {
      inherit system pkgs;
      specialArgs = { inherit inputs; };
      modules = [hostPath];
    };
in {
  usbguard = mkHost {
    hostPath = ./usbguard;
  };
}
