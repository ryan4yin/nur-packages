# Ryan Yin's Nix User Repository

**My personal [NUR](https://github.com/nix-community/NUR) repository**

![Build and populate cache](https://github.com/ryan4yin/nur-packages/workflows/Build%20and%20populate%20cache/badge.svg)

[![Cachix Cache](https://img.shields.io/badge/cachix-ryan4yin-blue.svg)](https://ryan4yin.cachix.org)


## Notes for myself

1. Add your packages to the [pkgs](./pkgs) directory and to
   [default.nix](./default.nix)
   * Remember to mark the broken packages as `broken = true;` in the `meta`
     attribute, or travis (and consequently caching) will fail!
   * Library functions, modules and overlays go in the respective directories
2. [Add yourself to NUR](https://github.com/nix-community/NUR#how-to-add-your-own-repository)
