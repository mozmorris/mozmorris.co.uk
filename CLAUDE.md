# mozmorris.co.uk: project instructions

This repo is the source for **mozmorris.co.uk**, the single-page site for **Moz Morris Ltd** (company 09049340, incorporated 21 May 2014, SIC 62012 business and domestic software development). The current page is a 2014 Yeoman/gulp build last deployed 19 Oct 2020. The next piece of work is a new single page that reflects the business.

`tasks/lessons.md` is THIS project's verified lesson file (read at session start; append when a lesson is earned). `tasks/todo.md` tracks next steps. `tasks/decisions.md` records choices and why. `tasks/debt.md` holds known, accepted debt.

## Hard rules

1. **The build is broken on modern Node.** `npm run build` fails on Node 22 with `ReferenceError: primordials is not defined` (gulp 3 via `vinyl-fs` → old `graceful-fs`). Verified 25 Sep 2026. Do not "fix" it by pinning an ancient Node or patching `graceful-fs`; the toolchain is being replaced (see `tasks/decisions.md`). Never claim a change is built or deployed without showing the output.
2. **The live site is served by the Mail-in-a-Box server, not GitHub Pages.** `mozmorris.co.uk` resolves to 18.134.77.81, the Elastic IP of Moz's Mail-in-a-Box (v76, SSH alias `miab-new`; see `../mailinabox/`). Its nginx serves `/home/user-data/www/default/`, whose `index.html` is byte-identical to the live page (sha256 match, 25 Sep 2026). Deploying means copying the built files into that directory. That box is PRODUCTION MAIL AND DNS for mozmorris.co.uk and earthview.co.uk: touch only `/home/user-data/www/default/`, never install anything there, and never use the `miab-old-DEAD-do-not-use` SSH alias (it points at the same live IP with the old key). A push to `master` changes nothing live; GitHub Pages was disabled on 25 Sep 2026; do not re-enable it.
3. **`dist/` is a build artifact.** Gitignored since the "Delete dist" commit; never commit it. `app/CNAME` is copied into `dist/` by the `extras` task.
4. **Temporary scripts and scratch builds go in the session scratchpad, not the tree.** `git status` before any `git add -A`. No secrets, ever.
5. **Work on a branch, not `master`.**
6. **Business facts come from Companies House, not memory.** Company name, number, registered office and SIC code are public record at https://find-and-update.company-information.service.gov.uk/company/09049340. Re-read it before putting any of them on the page.

## Markdown conventions

**No em dashes, anywhere.** Not in docs, commit messages, page copy, or code comments. Rewrite around them: a period and a new sentence, a colon, a comma, a semicolon, or parentheses. No double-hyphen substitutes either.

**No hard line-wrapping in .md files.** Write each paragraph (or list item) as one long line and let editors soft-wrap. Code blocks and tables are exempt.

## Structure

```
app/index.html          the page (Bootstrap 3 grid, content inline)
app/styles/main.scss    styles; compiled by Ruby Sass (end-of-life)
app/scripts/main.js     empty
app/CNAME, .htaccess, 404.html, robots.txt, favicon.ico
bower.json              jQuery 1.11, Bootstrap Sass 3.1, Modernizr 2.6
gulpfile.js             gulp 3 pipeline: styles → uncss → useref/minify → dist/
test/                   Yeoman Mocha placeholder; tests nothing
```

The `build` script is `gulp && gulp critical`: the second step inlines critical CSS into `dist/index.html` (the live page carries it inline).

## Testing

There are no real tests. Check a change by building it and viewing the output in a browser at phone and desktop widths. Until the toolchain is replaced, the only reliable check is viewing `app/index.html` directly (unstyled, since the Sass is not compiled).

## Commands

```bash
npm install          # works on Node 22 (1400 packages, deprecation warnings)
npm run build        # BROKEN on Node 22: primordials is not defined
npm run watch        # BROKEN: same gulp 3 failure
bower install        # bower is not installed; bower itself is deprecated

# Inspect the live web root (read-only, safe)
ssh miab-new 'ls -la /home/user-data/www/default/'
curl -sI https://mozmorris.co.uk | grep -i last-modified
```

The upload command is not settled: the web root is owned by `user-data`, and the SSH user is `ubuntu`, so a plain `rsync` will likely need `--rsync-path="sudo rsync"` and `--chown=user-data:user-data`. Prove it on the first deploy and record it here and in `tasks/lessons.md`.
