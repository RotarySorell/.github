#!/usr/bin/env bash
# Derive profile/ images from assets/rotary-club-sorell.png (the club signature
# as issued by Rotary's Brand Center). Re-run after replacing the source;
# commit the outputs with the change. Needs ImageMagick 7 (`magick`).
#
# logo-light.png — the signature on a transparent background, for GitHub's
#                  light theme. White is converted to transparency by colour
#                  distance (not a hard cut-out), so the wheel's teeth don't
#                  fringe on a dark page.
# logo-dark.png  — the same with the blue wordmark turned white, for GitHub's
#                  dark theme; the gold wheel keeps its colour.
# avatar.png     — the Rotary wheel alone, centred on a white 500x500 square,
#                  for the organisation's profile picture (uploaded by hand).
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
src="${root}/assets/rotary-club-sorell.png"
out="${root}/profile"

command -v magick >/dev/null || { echo "magick not found — install ImageMagick 7" >&2; exit 1; }

magick "$src" -trim +repage -alpha off -write mpr:C \
  -fx '1-min(min(r,g),b)' -write mpr:A +delete \
  mpr:C mpr:A -fx 'v.r<0.004 ? 0 : (u-(1-v.r))/v.r' \
  mpr:A -alpha off -compose CopyOpacity -composite \
  -strip "${out}/logo-light.png"

magick "${out}/logo-light.png" -channel RGB -fx 'b>=r ? 1 : u' +channel \
  -strip "${out}/logo-dark.png"

wheel="$(magick "$src" -alpha off -fx '(r>0.6 && b<0.45) ? 1 : 0' -trim -format '%wx%h%X%Y' info:)"
magick "$src" -alpha off -crop "$wheel" +repage -resize 400x400 \
  -background white -gravity center -extent 500x500 \
  -strip "${out}/avatar.png"

magick identify -format '%f %wx%h\n' "${out}/logo-light.png" "${out}/logo-dark.png" "${out}/avatar.png"
