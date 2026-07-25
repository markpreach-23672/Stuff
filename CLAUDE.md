# CLAUDE.md

This file provides guidance for AI assistants (Claude Code and similar tools) working in this
repository. Update it as the project evolves.

## Repository Overview

- **GitHub**: `markpreach-23672/Stuff`
- **Purpose**: TBD — fill in as the project takes shape
- **Language / Stack**: TBD

## Git Workflow

### Branches
- Feature work goes on descriptive branches: `claude/<short-description>-<id>` or `<topic>/<short-description>`
- Never push directly to `main` without explicit permission from the user
- Always push with the upstream flag: `git push -u origin <branch-name>`

### Commits
- Use the imperative mood for subject lines: "Add login page", not "Added login page"
- Keep subject lines under 72 characters
- Reference relevant issue or context in the body when helpful

### Destructive Operations
Always confirm with the user before running:
- `git reset --hard`, `git push --force`, `git clean -f`
- Deleting branches or overwriting uncommitted work

## Development Setup

_No stack has been chosen yet. Add setup instructions here once the project is initialized._

```
# Example (update with real commands):
# npm install
# python -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt
```

## Project Structure

_To be documented as files are added. Update this section whenever the directory layout changes._

```
Stuff/
├── CLAUDE.md          # This file
├── .claude/skills/    # Vendored skill bundles (see below), some symlinked from .agents/skills/
├── .agents/skills/    # Skill sources installed via `npx skills add` (taste-skill bundle)
├── skills-lock.json   # Provenance/hashes for skills installed via `npx skills add`
└── ...                # Add entries as the project grows
```

## Skills

`/plugin` marketplace commands aren't available in this environment (confirmed for both
`nextlevelbuilder/ui-ux-pro-max-skill` and `anthropics/skills`), so skill bundles are added to
this repo directly instead of installed as plugins.

### ui-ux-pro-max

The [ui-ux-pro-max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) skill bundle (MIT
licensed) is vendored under `.claude/skills/`. It provides seven skills — `ui-ux-pro-max`,
`design-system`, `brand`, `design`, `slides`, `banner-design`, and `ui-styling` — covering UI
styles, color palettes, typography, charts, and UX guidelines across common frontend stacks.
See `.claude/skills/LICENSE` for licensing.

### taste-skill (frontend design taste)

Installed via `npx skills add https://github.com/Leonxlnx/taste-skill`, which pulled all 13
skills bundled in that repo into `.agents/skills/` and symlinked them into `.claude/skills/`
for Claude Code. Provenance and content hashes are tracked in `skills-lock.json`. These are
plain-text design/prompt-engineering guides — no scripts or binaries:

- `brandkit` — premium brand-kit image generation (logo systems, identity decks)
- `design-taste-frontend` — anti-slop frontend skill for landing pages/portfolios/redesigns (v2)
- `design-taste-frontend-v1` — original v1 of the above, kept for backward compatibility
- `full-output-enforcement` — enforces complete, unabridged code generation
- `gpt-taste` — UX/UI and GSAP motion engineering with layout randomization
- `high-end-visual-design` — agency-level fonts, spacing, shadows, and animation defaults
- `image-to-code` — generates design reference images first, then implements to match
- `imagegen-frontend-mobile` — premium mobile app screen concept image generation
- `imagegen-frontend-web` — per-section premium website design reference image generation
- `industrial-brutalist-ui` — Swiss/military-terminal-inspired brutalist interface style
- `minimalist-ui` — clean editorial, warm monochrome, flat bento-grid interface style
- `redesign-existing-projects` — audits and upgrades existing UIs without breaking functionality
- `stitch-design-taste` — generates `DESIGN.md` files for Google Stitch screen generation

### document-skills and example-skills (anthropics/skills)

`/plugin install document-skills@anthropic-agent-skills` and
`/plugin install example-skills@anthropic-agent-skills` aren't available in this environment
either, so both plugins' skill directories were vendored directly from
[anthropics/skills](https://github.com/anthropics/skills) under `.claude/skills/`. Each skill
carries its own `LICENSE.txt`.

**document-skills** — document processing:
- `xlsx` — read, edit, create, and format Excel spreadsheets
- `docx` — read, edit, create, and format Word documents
- `pptx` — read, edit, create, and format PowerPoint presentations
- `pdf` — extract, merge, split, watermark, and fill PDF files

**example-skills** — general-purpose examples:
- `algorithmic-art` — generative/algorithmic art creation
- `brand-guidelines` — apply and enforce brand style guides
- `canvas-design` — canvas-based visual design
- `doc-coauthoring` — collaborative document authoring
- `frontend-design` — responsive web/app UI design (viewport-adaptive, not fixed-canvas)
- `internal-comms` — internal communications drafting
- `mcp-builder` — building MCP servers
- `skill-creator` — creating and refining Claude skills
- `slack-gif-creator` — generating GIFs for Slack
- `theme-factory` — visual theme generation
- `web-artifacts-builder` — building web-based artifacts
- `webapp-testing` — testing web applications

## Key Conventions for AI Assistants

### File Editing
- **Always read a file before editing it** — never modify code you haven't seen
- Prefer editing existing files over creating new ones
- Only create new files when strictly required by the task

### Code Quality
- Do not add comments, docstrings, or type annotations to code you did not change
- Do not add error handling for scenarios that cannot happen
- Do not introduce speculative abstractions, helpers, or utilities for hypothetical future use
- Three similar lines of code is better than a premature abstraction

### Security
- Never introduce command injection, SQL injection, XSS, or other OWASP Top 10 vulnerabilities
- Validate input only at system boundaries (user input, external APIs)
- Never commit secrets, credentials, or `.env` files

### Scope
- Only implement what was asked — no bonus features, refactors, or "improvements"
- Match the scope of your actions exactly to what was requested

## Testing

_No test framework configured yet. Add testing instructions here once one is set up._

```
# Example (update with real commands):
# npm test
# pytest
```

## Keeping This File Current

Update this file whenever:
- A language, framework, or major dependency is added
- Build, test, or run commands are established
- New architectural patterns or conventions are adopted
- The project structure changes significantly
