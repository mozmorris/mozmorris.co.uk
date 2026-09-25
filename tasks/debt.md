# Debt: mozmorris.co.uk

Opened 25 Sep 2026. Items here are known, accepted for now, and dated; move one to `todo.md` when it gets an owner and a date. Most of this list disappears with the rebuild (D3 in `decisions.md`).

- **Broken build toolchain.** gulp 3 fails on Node 22; Ruby Sass, gulp and bower are not installed. The site cannot be rebuilt from source today (`lessons.md`).
- **Deprecated front-end dependencies.** jQuery 1.11, Bootstrap Sass 3.1 and Modernizr 2.6 via bower. The page uses the Bootstrap grid only; `main.js` is empty.
- **Placeholder test suite.** `test/` is the Yeoman Mocha scaffold with its own `bower.json`; it tests nothing.
- **Stale page content.** Copy dates from 2014 to 2020 ("Web Developer", project links) and does not describe Moz Morris Ltd. `<meta name="description">` is empty.
- **Two open dependabot branches** (`dependabot/npm_and_yarn/brace-expansion-1.1.12`, `dependabot/npm_and_yarn/multi-98a25fdd5c`) against a toolchain that is being removed.
- **GitHub Pages enabled on `master` root** with no purpose: it is not the live site and would publish source files, not `dist/`.
- **No scripted deploy.** The site lives in `/home/user-data/www/default/` on the Mail-in-a-Box (`miab-new`), last updated 19 Oct 2020 by a manual copy from the Mac. There is no deploy script, and the exact upload command (sudo, ownership) is unproven.
- **Junk in the live web root.** `https://mozmorris.co.uk/.DS_Store` returns 200 (it lists directory filenames; checked 25 Sep 2026). The 29 KB Apache `.htaccess` returns 403 and does nothing, since the box runs nginx.
- **Leftover scaffold config.** `.bowerrc`, `.yo-rc.json`, `.jshintrc`.
