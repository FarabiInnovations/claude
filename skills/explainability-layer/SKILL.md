---
name: explainability-layer
description: Enforces that every feature making a business decision includes an explainability layer. Use when building, reviewing, or planning any feature that involves business logic, rules, scoring, filtering, ranking, or automated decisions.
---

# Design Rule: Explainability Layer

Every feature that makes a business decision MUST include an explainability layer that records:

1. **What was decided** — the outcome or result
2. **Which rules applied** — the criteria, thresholds, weights, or logic that drove the decision
3. **Why** — the reasoning chain connecting inputs to the outcome

## When This Applies

Any time you build a feature that:
- Scores, ranks, or filters items (resumes, quotes, candidates, products)
- Applies business rules (eligibility, pricing, approval, routing)
- Makes automated decisions that a human will act on
- Transforms input into a recommendation

## What To Build

The explainability layer ships WITH the feature, not after it. The pull request includes both the business logic and the layer that makes it visible.

The form does not matter — it can be:
- A tab in the UI
- An admin panel
- An API endpoint
- A structured log
- A report or scorecard
- A decision audit trail

What matters is that it EXISTS and that building it is NOT optional.

## How To Implement

When generating code for a business decision feature:

1. **Define the decision structure** — create a schema/type for the decision record (inputs, rules applied, intermediate results, final outcome, timestamp)
2. **Capture at decision time** — as the logic runs, populate the decision record at each step, not after the fact
3. **Store it** — persist decision records so they can be queried, audited, and reviewed
4. **Surface it** — provide a way for humans to inspect any individual decision and understand exactly how it was reached

## Example Pattern

```
Decision Record:
  - decision_id: unique identifier
  - timestamp: when the decision was made
  - input: what was evaluated (e.g., resume, quote request)
  - rules_applied: [{rule, criteria, result, weight}]
  - intermediate_scores: [{dimension, score, reasoning}]
  - final_outcome: the decision (e.g., score: 82, rank: 3, status: approved)
  - explanation: human-readable summary of why
```

## Enforcement

- When planning a feature: identify the decisions it makes and design the explainability layer upfront
- When reviewing code: reject PRs that implement business decisions without a corresponding explainability layer
- When writing prompts for LLM-driven decisions: always require structured reasoning output alongside the decision
