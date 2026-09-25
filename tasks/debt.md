# Debt: mozmorris.co.uk

Items here are known, accepted for now, and dated; move one to `todo.md` when it gets an owner and a date. The old toolchain debt (gulp 3, bower, Ruby Sass, jQuery/Bootstrap/Modernizr, placeholder tests, scaffold config, Dependabot alerts) was cleared on 25 Sep 2026 with D6.

- **Live site is still the 2014 page** until `new-page` is merged and deployed. Its copy dates from 2014 to 2020 and its meta description is empty.
- **No scripted deploy.** The site lives in `/home/user-data/www/default/` on the Mail-in-a-Box (`miab-new`), last updated 19 Oct 2020 by a manual copy from the Mac. The exact upload command (sudo, ownership) is unproven.
- **Subset fonts under the OFL** (25 Sep 2026). Newsreader and IBM Plex Sans were instanced and subset for the web. Both are SIL Open Font License. Subsetting counts as modifying under the OFL, and whether a modified font may keep a Reserved Font Name (IBM Plex reserves "Plex") is a grey area; web subsets like Google Fonts' own commonly keep the names. Not checked against each font's licence file. Add the licence texts to `app/fonts/` and rename the families in `@font-face` if this ever matters.
- **Stale live leftovers.** The live web root still holds the 2020 `fonts/` and `styles/` directories; clear them on the first deploy of the new page.
