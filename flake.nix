{
  description = "convert INI to JSON";

  outputs = { self, nixpkgs, ... }: {

    overlays.ini2json = import ./overlay.nix;
    overlay = self.overlays.ini2json;

    packages.x86_64-linux.ini2json = ( import nixpkgs {
      sys = "x86_64-linux";
      overlays = [self.overlay];
    } ).ini2json;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.ini2json;

    nixosModule = { pkgs, ... }: { nixpkgs.overlays = [self.overlay]; };
    nixosModules.ini2json = self.nixosModule;

  };
}
