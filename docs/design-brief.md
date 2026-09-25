# Design brief: mozmorris.co.uk

Draft 1, 25 Sep 2026. Status: approved by Moz, 25 Sep 2026.

## 1. The problem

The live page is a 2014 freelancer page ("Moz Morris - Web Developer") with project links from 2013 to 2015, an empty meta description and no mention of the company. The web has filled that gap badly. Asked "Who is Moz Morris Ltd?", an assistant found the right facts at Companies House but also found ZoomInfo filing the company under **Construction**, linked to mozmorris.co.uk. The site should be the source that settles the question, for people and for machines.

## 2. Goals

1. A visitor learns in one screen who Moz Morris Ltd is, what it does, and how to get in touch.
2. Search engines, aggregators and AI assistants can read the same answer: plain HTML, a real meta description, and structured data that ties the site to company 09049340.
3. The company meets its website disclosure duty (section 6).
4. The page is cheap to keep current: one HTML file, no toolchain to rot (see D3 in `tasks/decisions.md`).

## 3. Audiences

- **Prospective clients and agencies** checking out the company before or after a conversation. They want what, for whom, and how to reach you.
- **Machines**: Google, LinkedIn previews, ZoomInfo-style scrapers, and assistants answering "who is Moz Morris Ltd?". They want text in the HTML, not in a script or an image.
- **Suppliers and officials** (banks, accountants, HMRC) confirming the company is real. They want name, number and registered office.

## 4. Concept: the page answers the question

Confirmed by Moz, 25 Sep 2026 (D4).

The screenshots you shared show the idea: a question, "Who is Moz Morris Ltd?", and a calm, well-set answer with its sources cited. The page takes that shape. It opens with a greeting line, the question in a bubble on the right, and the answer below as readable serif prose, with small source chips (Companies House, GitHub) where a fact comes from.

It works because it is honest: every sentence is one the company stands behind, and the facts link to the public record.

**What it borrows** from the screenshots:

- A warm near-black background, off-white text, generous line height, a single accent colour.
- Serif for the answer, a quiet sans for the interface parts (question bubble, chips, footer).
- The rhythm of a conversation: question, short pause, answer, sources.
- Optionally, a status line before the answer in the spirit of "Clarifying which company likely manages the payroll", written by us and with a sense of humour (for example "Checking Companies House").

**What it must not borrow.** The page is Moz Morris Ltd's, not a Claude screenshot:

- No Claude asterisk or any Anthropic mark, no "Claude" or model names ("Opus 5.5 Medium"), no model picker, microphone, voice or Chat/Cowork controls, and no "Claude is AI and can make mistakes" footer. A composer is fine as a generic pattern; it holds our question and our follow-up buttons, styled in our palette.
- No Anthropic typefaces; use open fonts (section 7).
- The accent is not Claude's coral (section 7).

Why: using another company's marks and interface on a company website invites a trademark problem and makes visitors think they are looking at a Claude product. The idea is the conversation, not the brand.

## 5. Behaviour

Revised 25 Sep 2026: Moz asked for the page to feel as if the visitor is asking the question themselves. Prototype: https://claude.ai/artifact/UqHKk1wQ8fvTLjLTMUKb8H

1. **Greeting**: a day-aware line centred above an empty composer ("Happy Friday" at weekends and on Fridays, otherwise good morning, afternoon or evening).
2. **The question types itself** into the composer ("Who is Moz Morris Ltd?"), then sends: the greeting goes, the question becomes a bubble at the top, the composer drops to the bottom and clears.
3. **Status line** with pulsing ochre dots, "Checking Companies House", for about a second; it settles to "Checked Companies House".
4. **The answer streams in** word by word; the Companies House chip arrives as one unit.
5. **Follow-ups**: the composer then shows "Ask another question" with buttons (What does SignalForge do? What does Adaptive do? Where is the company registered? How do I get in touch?). Each opens a pre-written answer the same way. The composer never has a free-text field the visitor can type into, because nothing would answer it.
6. A small "Replay" link in the footer runs the sequence again.

Rules:

- **All content is in the HTML** at rest: the first question and answer as real markup (`h1` for the question). With JavaScript off, or for a scraper, the page reads as a question followed by its answer. Follow-up answers must also be crawlable in the final build (for example as real sections the script collapses), not only in a `<template>`.
- Skipped entirely under `prefers-reduced-motion`: the page renders in its finished state. The build should also skip it on return visits.
- Time to a readable answer: about 4 s with the animation. Acceptable because it only runs once and the finished state is available instantly without motion.
- **It must not pass as Claude or any real assistant** (section 4): no mark, no assistant name, no model picker, no AI disclaimer footer. The disclosure footer with the company's name makes clear whose page it is.

## 6. Content

### Company facts (checked against Companies House, 25 Sep 2026)

| Field | Value |
|---|---|
| Registered name | MOZ MORRIS LTD |
| Company number | 09049340 |
| Registered in | England and Wales |
| Registered office | 59 Bath Street, Southampton, Hampshire, SO14 6GR |
| Incorporated | 21 May 2014 |
| Nature of business | SIC 62012, business and domestic software development |
| Source | https://find-and-update.company-information.service.gov.uk/company/09049340 |

Re-read the register at build time (CLAUDE.md rule 6).

**Disclosure duty.** The Company, Limited Liability Partnership and Business (Names and Trading Disclosures) Regulations 2015 require a company's website to show its registered name, registered number, part of the UK where it is registered, and registered office address. So the registered office is required, not optional; `tasks/todo.md` section 2 says otherwise and should be corrected. These go in a small footer line: "Moz Morris Ltd. Registered in England and Wales, company 09049340. Registered office: 59 Bath Street, Southampton, SO14 6GR."

### The answer (draft copy, 25 Sep 2026)

Inputs from Moz, 25 Sep 2026: based in London; currently a developer at Adaptive and CTO at Signal Forge; no project or client list; links to LinkedIn and GitHub. Draft:

> **Who is Moz Morris Ltd?**
>
> Moz Morris Ltd is a software development company based in London, founded by Moz Morris in May 2014. `[Companies House]`
>
> Moz is currently a developer at [Adaptive](https://weareadaptive.com/) and CTO at [SignalForge](https://signalforge.uk/).
>
> For work enquiries, email work@mozmorris.co.uk. Moz is also on [LinkedIn](https://www.linkedin.com/in/mozmorris) and [GitHub](https://github.com/MozMorris).

Notes on the copy:

- Third person, because the page answers a question about the company. The source chip after paragraph 1 links to the Companies House record.
- London is where the company works from. The registered office (Southampton) appears only in the disclosure footer, so the two do not look contradictory.
- The 2013 to 2015 project list and client list come off the page, along with the Twitter and mozmorris.com links.
- **Contact**: email only, `work@mozmorris.co.uk`. No phone number. Before deploy, confirm the address exists on the Mail-in-a-Box (mailbox or alias) and a test message arrives.
- Links (25 Sep 2026): SignalForge `https://signalforge.uk/` (from Moz). Adaptive `https://weareadaptive.com/` (Adaptive Financial Consulting, London; found by search, confirmed by Moz). LinkedIn `https://www.linkedin.com/in/mozmorris` (search result titled "Moz Morris - SignalForge"). GitHub `https://github.com/MozMorris` (from the current page).
- "SignalForge" is one word, as the company's own site and Moz's LinkedIn headline write it.
- Status line before the answer: "Checking Companies House".

### Metadata

- `<title>`: "Moz Morris Ltd: software development, London".
- `<meta name="description">`: "Moz Morris Ltd is a London software development company, founded by Moz Morris in 2014. Company 09049340."
- Open Graph title, description and image, so a shared link previews properly.
- JSON-LD `Organization` with `name`, `legalName` ("MOZ MORRIS LTD"), `url`, `email`, `address` (registered office), `areaServed` or `location` London, `foundingDate` ("2014-05-21"), `founder` (a `Person`, Moz Morris, with `sameAs` LinkedIn and GitHub), and `identifier` set to the company number, with `sameAs` pointing at the Companies House record. This is what gives aggregators and assistants a machine-readable answer.

## 7. Visual language

- **Colour**: warm near-black ground (around `#1c1b19`), off-white text (around `#ece9e2`), muted secondary text, one accent for links and chips. Accent: **ochre**, `#d9a854` on the dark ground and `#875c12` on the light ground (Moz, 25 Sep 2026, chosen from side-by-side mockups against deep teal and chalk green). Both pass WCAG AA for text: 7.9:1 on `#1c1b19`, 5.1:1 on `#f2efe8`. Other tokens from the mockup: dark ground `#1c1b19`, ink `#ece9e2`, muted `#a19d94`, bubble `#2a2925`, rule `#34322d`; light ground `#f2efe8`, ink `#23211d`, muted `#6b665d`, bubble `#e4dfd4`, rule `#d8d2c6`.
- **Light mode**: the same tokens inverted to a warm paper ground, following `prefers-color-scheme`.
- **Type**: Newsreader for the answer and greeting, IBM Plex Sans for interface parts (Moz, 25 Sep 2026, from the mockups). Self-hosted `woff2`, subset to Latin, at most two families and three files.
- **Layout**: one centred column, about 40em wide, 16px side gutter on phones. The question bubble is right-aligned; the answer is left-aligned full column width. Footer disclosure in small secondary text.
- **Logo**: none (Moz, 25 Sep 2026).

## 8. Technical constraints

- One `index.html` with inline or one linked CSS file; decide D3 (no build vs dart-sass) once the design is final. Current lean: no build.
- No jQuery, Bootstrap, Modernizr, web font loader or Google Analytics (the `UA-` property stopped collecting in 2023). No analytics of any kind (Moz, 25 Sep 2026); so no cookie banner either.
- Page weight under 100 KB including fonts. No third-party requests.
- Accessible: real headings, colour contrast AA in both themes, visible focus, works at 200% zoom.
- Keep `CNAME`, `robots.txt`, `favicon.ico` and a matching `404.html`; the favicon may be redrawn in the new accent.
- Deploy target unchanged: `miab-new:/home/user-data/www/default/` (CLAUDE.md rule 2).

## 9. Out of scope

A blog, multiple pages, a CMS, a free-text ask-box or any live AI answering, a contact form.

## 10. Open questions for Moz

1. ~~Concept~~: settled 25 Sep 2026, question and answer (D4 in `tasks/decisions.md`).
2. ~~Answer copy~~: drafted and linked (section 6).
3. ~~Contact~~: `work@mozmorris.co.uk`, email only.
4. ~~Accent~~: ochre.
5. ~~Analytics~~: none.
