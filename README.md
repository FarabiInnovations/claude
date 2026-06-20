# claude

Claude Code configuration for Farabi Innovations — agents, commands, and skills.

## Install

```bash
git clone https://github.com/FarabiInnovations/claude.git ~/.farabi-claude
cd ~/.farabi-claude
./install.sh
```

Then run `/reload-skills` inside Claude Code.

## What's included

### Commands
| Command | Description |
|---|---|
| `/gitac` | Stage and commit with an auto-generated message |
| `/gitacpl` | Stage, commit, push, and monitor CI until complete |

### Skills
| Skill | Description |
|---|---|
| `explainability-layer` | Enforces that every feature making a business decision includes an explainability layer |

### Agents
| Agent | Description |
|---|---|
| `system-architect` | Plan and review architecture before implementation |
| `product-manager` | Define requirements, user stories, and business rules |
| `data-analyst` | Data analysis, scoring, matching, and statistical evaluation |

## How it works

`install.sh` creates symlinks from `~/.claude/` to this repo, so pulling updates is all it takes to stay current.
