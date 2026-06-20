---
name: spec-first
description: Enforces spec-before-implementation discipline. Checks if a spec exists for the feature you're about to build; if not, generates a template and blocks implementation until it's filled out.
---

# Spec-First

When this skill is invoked, follow these steps exactly.

## Step 1 — Understand what's being built

Ask the user: **"What feature or change are you about to implement?"** (Skip this if they already described it in the same message as the skill invocation.)

## Step 2 — Find the spec directory

Look for specs in this order:
1. A `SPEC_DIR` entry in `CLAUDE.md` (e.g. `SPEC_DIR: specs/`)
2. A `specs/` directory in the project root
3. A `docs/` directory
4. An `adr/` or `decisions/` directory

If none exist, the project has no spec convention yet — treat that as "no spec found."

## Step 3 — Search for a relevant spec

Search the spec directory for files whose name or content is relevant to the described feature. Use file names, headings, and first paragraphs. Cast a wide net — a feature about "customer matching" might live in a file called `entity-resolution.md`.

## Step 4a — Spec found

Read the spec file. Extract and surface:
- **Decision**: what was decided and why
- **Constraints & invariants**: what must always be true
- **Out of scope**: what was explicitly excluded
- **Open questions**: anything still unresolved

Present these as a brief bulleted list under the heading **"Spec found — constraints to respect:"** and then proceed with implementation.

## Step 4b — No spec found

**Do not write any implementation code.** Instead:

1. Say: *"No spec found for this feature. Write the spec first — here's a template:"*
2. Generate the template below, pre-filled with everything you already know about the feature from the conversation.
3. Tell the user where to save it: `specs/<kebab-case-feature-name>.md` (or the configured `SPEC_DIR`).
4. Wait for the user to confirm the spec is written before proceeding.

### Spec template

```markdown
# [Feature Name]

## Problem
[What problem does this solve? Who is affected, and what breaks today without this?]

## Decision
[What are we building, and why this approach over the obvious alternatives?]

## Constraints & invariants
[What must always be true after this ships? List hard edges, not preferences.]

## Out of scope
[What are we explicitly NOT doing in this iteration?]

## Open questions
[What's still unresolved? Who needs to decide?]
```

## Step 5 — Skip handling

If the user says they want to skip writing a spec, ask once:

> "Skipping means there's no shared record of the design decisions — are you sure?"

If they confirm, note *"Proceeding without a spec — consider writing one after."* and continue. Do not ask again.

## Notes for open-source use

- Configure the spec directory by adding `SPEC_DIR: <path>` to your `CLAUDE.md`.
- Works with any format: Markdown specs, ADRs, product briefs, or technical design docs.
- Pair with the `explainability-layer` skill: spec-first ensures the *what and why* is captured before coding; explainability-layer ensures the *decisions the code makes* are surfaced at runtime.
