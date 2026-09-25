# Decisions: mozmorris.co.uk

Each entry: the choice, the date, and why. Supersede an entry by adding a new one that names it; don't edit history.

## D1. Docs first, rebuild later (25 Sep 2026)

This round makes the repo Claude Code ready (`CLAUDE.md` and `tasks/`) and changes no site code. **Why:** the build is broken and the deploy route is unrecorded, so any code change now could not be built or shipped with evidence. The rebuild is the next piece of work, tracked in `todo.md`.

## D2. The new site stays a single page (25 Sep 2026)

Moz: the replacement is one page that reflects the business (Moz Morris Ltd, 09049340). **Why:** rules out a static-site generator (Astro, Eleventy) as overhead for one page.

## D3. Replace the toolchain rather than revive it (25 Sep 2026, PROPOSED)

Proposed direction for the rebuild: drop gulp 3, bower, Ruby Sass, uncss and the Yeoman test scaffold; use plain HTML plus either hand-written CSS (no build) or dart-sass run from an npm script. **Why:** gulp 3 cannot load on Node 22 (`lessons.md`), Ruby Sass is end-of-life, bower is deprecated, and a single page needs none of them. Reviving the old pipeline means pinning a Node version from 2019. **Open:** no build at all vs a dart-sass script; decide when the page design is known.

## D4. The page is a question and its answer (25 Sep 2026)

Moz confirmed the concept in `docs/design-brief.md` section 4: the page presents "Who is Moz Morris Ltd?" and a sourced, serif-set answer, borrowing the conversational shape and warm dark style of a chat interface but none of Claude's or Anthropic's marks, names, interface or fonts. **Why:** the question is the one people and AI assistants are already asking (and answering wrongly, e.g. ZoomInfo's "Construction"), so the page settles it directly; the brand exclusion avoids trademark trouble and visitors mistaking the page for a Claude product.

## D5. The visitor appears to ask the question (25 Sep 2026)

Refines D4. Moz asked for the page to feel as if the visitor is running an assistant (the reason for the three Claude screenshots). The page plays a one-time sequence: day-aware greeting, the question types itself into a composer and sends, a status line, the answer streams in, then follow-up questions as buttons with pre-written answers. Prototype approved by Moz: https://claude.ai/artifact/UqHKk1wQ8fvTLjLTMUKb8H (details in `docs/design-brief.md` section 5). **Why:** the feeling comes from the choreography, so it needs none of Claude's marks or interface; a page that passed as a real assistant would present the company's own copy as an independent AI's verdict. No free-text input, because nothing would answer it.

## D6. No build step (25 Sep 2026, settles D3)

The new page is hand-written HTML with inline CSS and JS in `app/`, deployed as is. gulp, bower, Ruby Sass, the Yeoman test scaffold, `package.json` and `package-lock.json` are removed. **Why:** one page of about 15 KB needs no preprocessing; with no toolchain there is nothing to rot and no Dependabot alerts. Moz agreed to start the build on this basis. Fonts were trimmed once with fonttools (instanced to the weights used, subset to Latin) in a scratch venv; redo that by hand if the fonts ever change, rather than adding a pipeline.
