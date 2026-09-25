# Decisions: mozmorris.co.uk

Each entry: the choice, the date, and why. Supersede an entry by adding a new one that names it; don't edit history.

## D1. Docs first, rebuild later (25 Sep 2026)

This round makes the repo Claude Code ready (`CLAUDE.md` and `tasks/`) and changes no site code. **Why:** the build is broken and the deploy route is unrecorded, so any code change now could not be built or shipped with evidence. The rebuild is the next piece of work, tracked in `todo.md`.

## D2. The new site stays a single page (25 Sep 2026)

Moz: the replacement is one page that reflects the business (Moz Morris Ltd, 09049340). **Why:** rules out a static-site generator (Astro, Eleventy) as overhead for one page.

## D3. Replace the toolchain rather than revive it (25 Sep 2026, PROPOSED)

Proposed direction for the rebuild: drop gulp 3, bower, Ruby Sass, uncss and the Yeoman test scaffold; use plain HTML plus either hand-written CSS (no build) or dart-sass run from an npm script. **Why:** gulp 3 cannot load on Node 22 (`lessons.md`), Ruby Sass is end-of-life, bower is deprecated, and a single page needs none of them. Reviving the old pipeline means pinning a Node version from 2019. **Open:** no build at all vs a dart-sass script; decide when the page design is known.
