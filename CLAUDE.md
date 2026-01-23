# Superpowers

## Purpose
Complete software development workflow for coding agents - composable skills that trigger automatically.

## Architecture
```
superpowers/
├── skills/           # Composable workflow skills
├── commands/         # CLI commands
├── hooks/            # Event-driven automation
├── agents/           # Subagent definitions
├── lib/              # Shared utilities
└── tests/            # Test suite
```

## Key Features
- Auto-spec extraction from conversations
- TDD-first implementation plans
- Subagent-driven development
- YAGNI/DRY enforcement

## Installation
```bash
# Claude Code
/plugin marketplace add obra/superpowers-marketplace
/plugin install superpowers@superpowers-marketplace
```

## Related Memory
Search: `search_memory("superpowers", "skills", "workflow")`

## Decisions
- Auto-triggering skills: No manual invocation needed
- Subagent-driven: Parallel autonomous work on tasks
