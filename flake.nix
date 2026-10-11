{
  description = "Online documentation for UAVs@Berkeley";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: {
        # `nix build` to build static site to ./result
        default = pkgs.stdenvNoCC.mkDerivation {
          pname = "uav-docs";
          version = self.shortRev or self.dirtyShortRev or "dev";

          src = pkgs.lib.fileset.toSource {
            root = ./.;
            fileset = pkgs.lib.fileset.unions [
              ./docs
              ./mkdocs.yml
            ];
          };

          nativeBuildInputs = [ pkgs.zensical ];

          buildPhase = ''
            runHook preBuild
            export HOME=$TMPDIR
            zensical build --clean
            runHook postBuild
          '';

          installPhase = ''
            runHook preInstall
            cp -r site $out
            runHook postInstall
          '';
        };
      });

      apps = forAllSystems (pkgs: {
        # `nix run` for dev server
        default = {
          type = "app";
          program = "${pkgs.writeShellScript "uav-docs-serve" ''
            exec ${pkgs.lib.getExe pkgs.zensical} serve "$@"
          ''}";
        };
      });

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShellNoCC {
          packages = [ pkgs.zensical ];
        };
      });

      formatter = forAllSystems (pkgs: pkgs.nixfmt);
    };
}
