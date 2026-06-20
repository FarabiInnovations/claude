---
name: explainability-layer
description: Enforces that every feature making a business decision includes an explainability layer. Use when building, reviewing, or planning any feature that involves business logic, rules, scoring, filtering, ranking, or automated decisions.
---

# Design Rule: Explainability Layer

Whenever a feature involving business rules or logic is being discussed, designed, or built — proactively raise explainability as a first-class concern. Do not wait for implementation. Surface it in the conversation before any code is written.

Every feature that makes a business decision MUST include an explainability layer that records:

1. **What was decided** — the outcome or result
2. **Which rules applied** — the criteria, thresholds, weights, or logic that drove the decision
3. **Why** — the reasoning chain connecting inputs to the outcome

## When This Applies

Activate whenever the conversation involves:
- Defining or refining business rules (eligibility, pricing, approvals, routing, access control)
- Designing a feature that scores, ranks, filters, or classifies items
- Automating a decision that a human currently makes or will act on
- Describing logic with conditions, thresholds, or weights
- Discussing what should happen "when X is true" or "if Y meets Z"

This includes early-stage discussions, not just implementation. If business logic is being talked about, explainability belongs in that conversation.

## What To Raise During Discussion

When business rules come up, ask or surface:
- "How will someone know why this decision was made?"
- "Where will this decision be visible to the user or an operator?"
- "What does an audit trail look like for this?"
- "If this decision is wrong, how will someone investigate it?"

These questions shape the design before code exists. Answers inform what the explainability layer needs to surface.

## What To Build

The explainability layer ships WITH the feature — not after it. The pull request includes both the business logic and the layer that makes it visible.

The form does not matter — it can be:
- A tab or panel in the UI
- An admin view or dashboard
- An API endpoint
- A structured log
- A report or scorecard
- A decision audit trail

What matters is that it EXISTS and that building it is NOT optional.

## How To Implement

When generating code for a business decision feature:

1. **Define the decision structure** — create a schema/type for the decision record (inputs, rules applied, intermediate results, final outcome, timestamp)
2. **Capture at decision time** — populate the decision record as the logic runs, not after the fact
3. **Store it** — persist decision records so they can be queried, audited, and reviewed
4. **Surface it** — provide a way for humans to inspect any individual decision and understand exactly how it was reached

## Example Pattern

```
Decision Record:
  - decision_id: unique identifier
  - timestamp: when the decision was made
  - input: what was evaluated (e.g., application, request, order)
  - rules_applied: [{rule, criteria, result, weight}]
  - intermediate_scores: [{dimension, score, reasoning}]
  - final_outcome: the decision (e.g., score: 82, rank: 3, status: approved)
  - explanation: human-readable summary of why
```

## Enforcement

- When discussing a feature: identify the decisions it makes and ask how they will be explained — before design is finalized
- When planning: design the explainability layer upfront alongside the business logic
- When reviewing code: reject PRs that implement business decisions without a corresponding explainability layer
- When writing prompts for LLM-driven decisions: always require structured reasoning output alongside the decision
