{
  inputs,
  pkgs,
  system,
  ...
}: let
  mkHost = {
    hostPath,
  }:
    pkgs.lib.nixosSystem {
      inherit system pkgs;
      specialArgs = { inherit inputs; };
      modules = [hostPath];
    };
in {
  usbguard = mkHost {
    hostPath = ./usbguard;
  };
}
