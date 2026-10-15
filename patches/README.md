# Carried patches

Patch files here are applied by downstream consumers — mainly `ryan4yin/nix-config` — instead of
fetching a merge request diff that upstream can rewrite at any time. These files carry no build
entry, so the package set and its CI are unaffected.

| Patch | Upstream source | Remove when |
| --- | --- | --- |
| `openrgb-colorful-argb.patch` | `CalcProgrammer1/OpenRGB` merge request !3543 | An OpenRGB release carries the Colorful ARGB controller |

The same removal condition is recorded in nix-config's `WORKAROUNDS.md` (WA-035), which points back
here. Apply a patch against OpenRGB 1.0 or newer: it needs APIs (`DetectionManager`, `Shutdown`)
that 1.0rc3 lacks.
