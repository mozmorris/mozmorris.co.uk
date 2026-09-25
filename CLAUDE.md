# mozmorris.co.uk: project instructions

This repo is the source for **mozmorris.co.uk**, the single-page site for **Moz Morris Ltd** (company 09049340, incorporated 21 May 2014, SIC 62012 business and domestic software development). The live page is still the 2014 Yeoman/gulp build last deployed 19 Oct 2020. Its replacement (the question-and-answer page in `docs/design-brief.md`) is plain files in `app/` with no build step (D3).

`tasks/lessons.md` is THIS project's verified lesson file (read at session start; append when a lesson is earned). `tasks/todo.md` tracks next steps. `tasks/decisions.md` records choices and why. `tasks/debt.md` holds known, accepted debt.

## Hard rules

1. **There is no build step (D3, 25 Sep 2026).** `app/` is the site exactly as served. Do not add a bundler, preprocessor or npm toolchain without a new decision in `tasks/decisions.md`. Never claim a change is deployed without showing the output.
2. **The live site is served by the Mail-in-a-Box server, not GitHub Pages.** `mozmorris.co.uk` resolves to 18.134.77.81, the Elastic IP of Moz's Mail-in-a-Box (v76, SSH alias `miab-new`; see `../mailinabox/`). Its nginx serves `/home/user-data/www/default/`, whose `index.html` is byte-identical to the live page (sha256 match, 25 Sep 2026). Deploying means copying the contents of `app/` into that directory. That box is PRODUCTION MAIL AND DNS for mozmorris.co.uk and earthview.co.uk: touch only `/home/user-data/www/default/`, never install anything there, and never use the `miab-old-DEAD-do-not-use` SSH alias (it points at the same live IP with the old key). A push to `master` changes nothing live; GitHub Pages was disabled on 25 Sep 2026; do not re-enable it.
3. **`app/` is what gets deployed, all of it.** Keep anything that should not be public out of `app/`. `app/CNAME` is a leftover from GitHub Pages and harmless on nginx.
4. **Temporary scripts and scratch builds go in the session scratchpad, not the tree.** `git status` before any `git add -A`. No secrets, ever.
5. **Work on a branch, not `master`.**
6. **Business facts come from Companies House, not memory.** Company name, number, registered office and SIC code are public record at https://find-and-update.company-information.service.gov.uk/company/09049340. Re-read it before putting any of them on the page.

## Markdown conventions

**No em dashes, anywhere.** Not in docs, commit messages, page copy, or code comments. Rewrite around them: a period and a new sentence, a colon, a comma, a semicolon, or parentheses. No double-hyphen substitutes either.

**No hard line-wrapping in .md files.** Write each paragraph (or list item) as one long line and let editors soft-wrap. Code blocks and tables are exempt.

## Structure

```
app/index.html          the page: HTML, inline CSS and JS, JSON-LD
app/404.html            not-found page in the same style
app/fonts/              Newsreader and IBM Plex Sans, self-hosted woff2, trimmed to the weights used
app/CNAME, robots.txt, favicon.ico
app/og.png              1200x630 share image
docs/design-brief.md    the approved design brief
docs/og-image.html      source for og.png, with the command to regenerate it
```

The page plays a one-time intro (question types in, answer streams). The finished state is in the HTML, so it reads correctly with JS off, under `prefers-reduced-motion`, and to crawlers. `localStorage` key `mm-seen` skips the intro on return visits; clear it to see the intro again.

## Testing

There are no automated tests. Check a change by serving `app/` and viewing it in a browser at phone (390px) and desktop widths, in dark and light modes, with the intro both playing and skipped. Validate with `npx html-validate` (only the lowercase-doctype style rule fires). Timers crawl in a hidden browser tab, so an automated check of the intro in a background tab runs about 20 times slower than real.

## Commands

```bash
python3 -m http.server --directory app 8000   # preview at http://localhost:8000

# Inspect the live web root (read-only, safe)
ssh miab-new 'ls -la /home/user-data/www/default/'
curl -sI https://mozmorris.co.uk | grep -i last-modified
```

The upload command is not settled: the web root is owned by `user-data`, and the SSH user is `ubuntu`, so a plain `rsync` will likely need `--rsync-path="sudo -n rsync"` (passwordless sudo works for `ubuntu`, verified 25 Sep 2026) and `--chown=user-data:user-data`. Prove it on the first deploy and record it here and in `tasks/lessons.md`.
