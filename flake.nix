{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zmk-nix = {
      url = "github:lilyinstarlight/zmk-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zmk-nix }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.${system}.default = zmk-nix.legacyPackages.${system}.buildSplitKeyboard {
        name = "sofle-j-firmware";
        src = ./.;
        board = "eyelash_sofle_%PART%";
        parts = [ "left" "right" ];
        config = "config";
        shield = "nice_view";
        enableZmkStudio = true;
        zephyrDepsHash = "sha256-ZmKPuUqiW+780GWpPDidDapQeQ+QVo4eyTWMDRlT+Yw=";
      };

      devShells.${system}.default = zmk-nix.devShells.${system}.default.overrideAttrs (oldAttrs: {
        nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [
          pkgs.gnumake
          pkgs.keymap-drawer
        ];
      });
    };
}
