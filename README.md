# .github

The public profile of the Rotary Club of Sorell's GitHub organisation,
[github.com/RotarySorell](https://github.com/RotarySorell).
`profile/README.md` is what visitors see on the organisation page.

## Changing it

Edit `profile/README.md` and commit. GitHub shows the change on the
organisation page as soon as it arrives.

The club's details here — meetings, contact, projects — are copied from the
club website's `site/llms.txt` (repo `website`). When they change there,
change them here too.

To undo a change: revert the commit.

## Images

`assets/rotary-club-sorell.png` is the club signature, Rotary International's
mark, used under the club's entitlement from Rotary's Brand Center. Everything
in `profile/` that ends in `.png` is made from it by `tools/build-images.sh`
(needs ImageMagick 7): run it after replacing the source, then commit
everything.

- `logo-light.png` / `logo-dark.png` — the page header. GitHub shows the one
  that suits the viewer's light or dark theme.
- `avatar.png` — the organisation's profile picture. GitHub has no way to set
  it except by hand: go to github.com/RotarySorell → **Settings** → **Profile
  picture** → **Upload new picture**, choose the file, then **Set new profile
  picture**.

This repository must stay **public** on GitHub, or the profile disappears.
The members-only profile is the separate `.github-private` repository.
