{
  description = "lawful-conversions";

  inputs = {
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, pre-commit-hooks }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        packageName = "lawful-conversions";
        pkgs = nixpkgs.legacyPackages.${system};
        haskellPackages = pkgs.haskellPackages.override {
          overrides = self: super: { };
        };
      in
      {
        defaultPackage = self.packages.${system}.${packageName};
        packages.${packageName} =
          haskellPackages.callCabal2nix packageName self { };

        checks = {
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              hlint.enable = true;
              hpack.enable = true;
              ormolu.enable = true;
              nixpkgs-fmt.enable = true;
            };
          };
        };

        devShells.default = pkgs.haskellPackages.shellFor rec {
          inherit (self.checks.${system}.pre-commit-check) shellHook;

          packages = p: [ self.packages.${system}.${packageName} ];

          buildInputs = with pkgs; [
            ghciwatch
            haskellPackages.cabal-install
            haskellPackages.ghcid
            haskellPackages.haskell-language-server
            haskellPackages.hspec-discover
            haskellPackages.ormolu
            hpack
            zlib
          ];

          # Ensure that libz.so and other libraries are available to TH
          # splices, cabal repl, etc.
          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
        };
      });
}

