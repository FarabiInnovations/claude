#!/bin/bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Installing Farabi Claude config..."

mkdir -p "$CLAUDE_DIR/commands" "$CLAUDE_DIR/skills" "$CLAUDE_DIR/agents"

# Commands
for f in "$REPO_DIR/commands/"*.md; do
  ln -sf "$f" "$CLAUDE_DIR/commands/$(basename "$f")"
  echo "  linked command: $(basename "$f")"
done

# Skills
for d in "$REPO_DIR/skills/"/*/; do
  ln -sf "$d" "$CLAUDE_DIR/skills/$(basename "$d")"
  echo "  linked skill: $(basename "$d")"
done

# Agents
for f in "$REPO_DIR/agents/"*.md; do
  ln -sf "$f" "$CLAUDE_DIR/agents/$(basename "$f")"
  echo "  linked agent: $(basename "$f")"
done

echo ""
echo "Done. Run /reload-skills in Claude Code to pick up new commands and skills."
