{ pkgs, ... }: {
  packages = with pkgs [ 
    buildah
    shellcheck
  ];
}