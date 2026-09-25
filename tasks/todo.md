# Next steps (in order): mozmorris.co.uk

Updated 25 Sep 2026. Owner tags: [Moz] = decisions or access only you have · [Moz+agent] = you drive, agent verifies · [agent] = fully headless.

## 0. Claude Code ready state (25 Sep 2026)

- [x] **[agent] Toolchain tested in a scratch copy**: `npm install` works, `npm run build` fails on Node 22 (`lessons.md`).
- [x] **[agent] Live hosting checked**: nginx on AWS, not GitHub Pages (`lessons.md`).
- [x] **[agent] `CLAUDE.md`, `tasks/todo.md`, `lessons.md`, `decisions.md`, `debt.md` written** on branch `claude-code-setup`.
- [x] **[Moz] Review and merge `claude-code-setup`** (merged to `master` as `946110c`, branch deleted).

## 1. Before any rebuild work

- [x] **[agent] Found the deploy target**: `miab-new:/home/user-data/www/default/` on the Mail-in-a-Box, confirmed by sha256 match with the live page (`lessons.md`, `CLAUDE.md` rule 2).
- [ ] **[Moz+agent] Prove the upload command** on the first deploy (rsync with sudo on the remote end and the right ownership), then add a `deploy` npm script. Take a copy of the current `www/default/` into the scratchpad first as the rollback.
- [x] **[agent] GitHub Pages disabled** (25 Sep 2026, `gh api -X DELETE .../pages`; `has_pages` now `false`).
- [x] **[agent] Dependabot PRs #1 and #2 closed and their branches deleted** (25 Sep 2026; they bumped the toolchain being removed).

## 2. The new single page (Moz Morris Ltd)

- [x] **[Moz] Content brief** (done 25 Sep 2026: `docs/design-brief.md`, prototype approved, D4 and D5): what the business does and for whom, services, contact route, and which Companies House facts appear on the page (name, number, place of registration and registered office are required on a company website; see `docs/design-brief.md` section 6). Draft brief: `docs/design-brief.md`. Source: https://find-and-update.company-information.service.gov.uk/company/09049340
- [x] **[Moz+agent] Settle D3** in `decisions.md`: no build vs a dart-sass npm script.
- [ ] **[Moz+agent] Create `work@mozmorris.co.uk`** on the Mail-in-a-Box (mailbox or alias) and send a test message before the page goes live.
- [x] **[agent] Build the page** (25 Sep 2026, branch `new-page`) on a branch, from `docs/design-brief.md` and the approved prototype: semantic HTML, responsive, filled-in meta description, no jQuery, Bootstrap or Modernizr. Keep `CNAME`, `robots.txt`, `404.html` and `favicon.ico` (or replace them on purpose).
- [x] **[agent] Remove the old toolchain** (25 Sep 2026, branch `new-page`): gulp, bower, Ruby Sass config, `test/`, `app/.htaccess` (Apache config; removed from the live web root 25 Sep 2026 and must not come back), `.bowerrc`, `.yo-rc.json`, `.jshintrc`, and the `package-lock.json` they need. Update `CLAUDE.md` Structure and Commands, and clear the items from `debt.md`.
- [ ] **[Moz+agent] Verify**: view at phone and desktop widths, check HTML validity, then deploy to `miab-new:/home/user-data/www/default/` and confirm with `curl -sI` that `last-modified` has moved past 19 Oct 2020.
- [x] **[agent] Open Graph image** (25 Sep 2026: `app/og.png`, source `docs/og-image.html`) (1200x630, the question and first answer line in the page style) so shared links preview properly; the brief asks for one and the page has none yet.
- [ ] **[Moz] Review and merge `new-page`**, then deploy (items above).
