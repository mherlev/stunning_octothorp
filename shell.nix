{ pkgs ? import <nixpkgs> {} }: let
  hugo-theme = builtins.fetchTarball {
    name = "hugo-theme-m10c";
    url = "https://github.com/athul/archie/archive/a3a574f7e90fdbc55c11feb1a7e9f31d34012494.tar.gz";
    sha256 = "02zlzd5p1ri2k005g7lrz0k5cp2y7wl634f3w5l3lnvl25icdab2";
  };
in
  pkgs.mkShellNoCC {
    packages = [
      pkgs.git
      pkgs.hugo
      pkgs.just
    ];

    shellHook = ''
      mkdir -p themes
      ln -snf "${hugo-theme}" themes/archie
      '';
  }
