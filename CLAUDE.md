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
└── ...                # Add entries as the project grows
```

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
