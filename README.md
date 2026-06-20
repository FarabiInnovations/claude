# claude

Claude Code configuration for Farabi Innovations — agents, commands, and skills that encode how we build software.

## Install

```bash
git clone https://github.com/FarabiInnovations/claude.git ~/.farabi-claude
cd ~/.farabi-claude
./install.sh
```

Then run `/reload-skills` inside Claude Code to activate everything.

`install.sh` uses symlinks — a `git pull` is all it takes to stay current.

---

## Agents

Agents are specialized sub-models invoked automatically when the task fits. Each one has a focused system prompt, a defined scope, and knows when to step in.

### `system-architect`
Plans and reviews architecture **before** implementation begins. Invoked whenever a feature touches multiple layers, requires a data flow decision, or involves a non-trivial refactor. Produces a step-by-step design, identifies critical files, and surfaces trade-offs before a line of code is written. Prevents the most expensive class of mistake: building the wrong thing correctly.

**Triggers automatically when you say things like:**
- "I want to add a notification system..."
- "Should we use Redis or in-memory caching?"
- "We need to refactor the stock accumulation logic..."

---

### `data-analyst`
Handles anything involving data evaluation, scoring, matching, or statistical analysis. Entity matching, deduplication, threshold tuning, precision/recall trade-offs, exploratory data analysis, anomaly detection, clustering — if data needs to be scored, ranked, matched, predicted, or profiled, this agent runs it.

**Triggers automatically when you say things like:**
- "What's the right threshold for our matching pipeline?"
- "Tell me what this collection looks like..."
- "We're getting bad matches — help improve accuracy..."

---

## Skills

Skills are enforced design rules that activate when the task calls for them. They don't just advise — they shape what gets built.

### `explainability-layer`
Every feature that makes a business decision must ship with an explainability layer. This skill enforces that rule.

When you build something that scores, ranks, filters, routes, or applies business logic — the explainability layer ships in the same PR. It can be a UI tab, an API endpoint, a structured log, an admin panel, or an audit trail. The form doesn't matter. What matters is that a human can inspect any decision and understand exactly how it was reached: **what was decided, which rules applied, and why.**

This skill activates when building or reviewing features involving eligibility gates, pricing logic, automated approvals, matching pipelines, or any logic a human will act on.

### `spec-first`
Enforces spec-before-implementation discipline. Before writing code for a new feature, checks if a spec exists; if not, generates a pre-filled template and blocks implementation until it's written.

Invoke with `/spec-first` at the start of any new feature. It searches your `specs/` directory (configurable via `SPEC_DIR` in `CLAUDE.md`) and either surfaces the relevant constraints from the existing spec or produces a template to fill out first. Pairs with `explainability-layer`: spec-first captures the *what and why* before coding; explainability-layer surfaces the *decisions the running code makes*.

---

## Commands

Slash commands that run common workflows.

### `/gitac [message]`
Stages changed files, generates a commit message from the diff (focused on *why*, not *what*), and commits. Pass a message to override the generated one.

### `/gitacpl [message]`
Everything `/gitac` does, then pushes to the current branch and monitors the CI pipeline — polling every ~60s and reporting pass or fail when the run completes.
