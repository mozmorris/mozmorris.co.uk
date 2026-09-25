# Debt: mozmorris.co.uk

Opened 25 Sep 2026. Items here are known, accepted for now, and dated; move one to `todo.md` when it gets an owner and a date. Most of this list disappears with the rebuild (D3 in `decisions.md`).

- **Broken build toolchain.** gulp 3 fails on Node 22; Ruby Sass, gulp and bower are not installed. The site cannot be rebuilt from source today (`lessons.md`).
- **Deprecated front-end dependencies.** jQuery 1.11, Bootstrap Sass 3.1 and Modernizr 2.6 via bower. The page uses the Bootstrap grid only; `main.js` is empty.
- **Placeholder test suite.** `test/` is the Yeoman Mocha scaffold with its own `bower.json`; it tests nothing.
- **Stale page content.** Copy dates from 2014 to 2020 ("Web Developer", project links) and does not describe Moz Morris Ltd. `<meta name="description">` is empty.
- **36 Dependabot alerts on `master`** (2 critical, 16 high, 15 moderate, 3 low, as of 25 Sep 2026), all in the build toolchain, none in the served static files. Dependabot may open new PRs until the toolchain is removed; close them the same way.
- **No scripted deploy.** The site lives in `/home/user-data/www/default/` on the Mail-in-a-Box (`miab-new`), last updated 19 Oct 2020 by a manual copy from the Mac. There is no deploy script, and the exact upload command (sudo, ownership) is unproven.
- **Leftover scaffold config.** `.bowerrc`, `.yo-rc.json`, `.jshintrc`.
