#!/usr/bin/env bash
# Derive profile/ images from assets/rotary-sorell.png (the club logo as
# downloaded from Rotary's Brand Center, on a transparent field). Re-run after
# replacing the source; commit the outputs with the change. Needs ImageMagick 7
# (`magick`).
#
# logo-light.png — the logo trimmed to its artwork, for GitHub's light theme.
# logo-dark.png  — the same with the blue wordmark and name turned white, the
#                  gold wheel unchanged: Rotary's version for dark backgrounds,
#                  for GitHub's dark theme.
# avatar.png     — the whole logo centred on a white 500x500 square, for the
#                  organisation's profile picture (uploaded by hand). Rotary
#                  never lets the wheel stand alone as the club's logo.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
src="${root}/assets/rotary-sorell.png"
out="${root}/profile"

command -v magick >/dev/null || { echo "magick not found — install ImageMagick 7" >&2; exit 1; }

magick "$src" -trim +repage -strip "${out}/logo-light.png"

magick "${out}/logo-light.png" -channel RGB -fx 'b>=r ? 1 : u' +channel \
  -strip "${out}/logo-dark.png"

magick "${out}/logo-light.png" -resize 440x \
  -background white -gravity center -extent 500x500 -alpha remove -alpha off \
  -strip "${out}/avatar.png"

magick identify -format '%f %wx%h\n' "${out}/logo-light.png" "${out}/logo-dark.png" "${out}/avatar.png"
