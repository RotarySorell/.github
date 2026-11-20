---
type: guide
links:
  - rel: see-also
    to: README.md
---

# .github — notes for the next agent

The public profile of the RotarySorell GitHub organisation: `profile/README.md` is what
visitors see on github.com/RotarySorell. It is the one club repo that is public on GitHub, and
it must stay public or the profile disappears.

## Layout

- `profile/README.md`: the profile text.
- `assets/rotary-sorell.png`: the Brand Center club logo, the single source for the images.
- `tools/build-images.sh` (needs ImageMagick 7, `magick`) derives `profile/logo-light.png`,
  `profile/logo-dark.png` and `profile/avatar.png` from it. Run it after replacing the source
  and commit the outputs.

## Rules

- The club's details (meetings, contact, projects) are copied from
  https://rotarysorell.org.au/llms.txt, made from `src/data/club.js` in `rotary/website`. When
  that changes, change the profile to match.
- `avatar.png` is uploaded by hand in the GitHub organisation's settings; nothing deploys it.
- Main-only. The push mirror publishes it.

## Footguns

- The repo is public, so every line must pass the leak audit: no member, machine or
  administrator detail.
