# Debt: mozmorris.co.uk

Items here are known, accepted for now, and dated; move one to `todo.md` when it gets an owner and a date. The old toolchain debt (gulp 3, bower, Ruby Sass, jQuery/Bootstrap/Modernizr, placeholder tests, scaffold config, Dependabot alerts) was cleared on 25 Sep 2026 with D6.

- **Subset fonts under the OFL** (25 Sep 2026). Newsreader and IBM Plex Sans were instanced and subset for the web. Both are SIL Open Font License. Subsetting counts as modifying under the OFL, and whether a modified font may keep a Reserved Font Name (IBM Plex reserves "Plex") is a grey area; web subsets like Google Fonts' own commonly keep the names. Not checked against each font's licence file. Add the licence texts to `app/fonts/` and rename the families in `@font-face` if this ever matters.
- **nginx does not use `404.html`** (25 Sep 2026). A missing path returns nginx's plain "404 Not Found" page. The 2020 site behaved the same. Fixing it means custom nginx config on the Mail-in-a-Box, which is outside the one directory this repo may touch (CLAUDE.md rule 2); leave it unless Moz decides otherwise.
- **`.woff2` is served as `application/octet-stream`** (25 Sep 2026), not `font/woff2`. Chrome loads the fonts anyway (checked on the live site). Same nginx-config limit as above.
