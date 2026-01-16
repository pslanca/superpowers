# THE_LAW.md Integration for Superpowers

This fork of [obra/superpowers](https://github.com/obra/superpowers) integrates **THE_LAW.md governance framework** into all subagent-driven development workflows.

## What Changed

All subagent prompts in `skills/subagent-driven-development/` have been modified to enforce THE_LAW.md 4-phase response structure:

1. **implementer-prompt.md** - Implementer subagents now receive THE_LAW.md preamble enforcing 4-phase structure
2. **spec-reviewer-prompt.md** - Spec reviewers follow THE_LAW.md constraints
3. **code-quality-reviewer-prompt.md** - Code quality reviewers operate under THE_LAW.md with 4-phase audit reporting

## Why This Matters

**Original Superpowers problem:** Subagent workflows follow TDD + review discipline, but lack structural governance. Subagents can drift, over-promise, or invent facts.

**THE_LAW.md solution:** Every response—from implementer to reviewer—follows strict 4-phase structure:
- Extracted Truth: facts, constraints, decisions, missing info
- Plan: what will be done and why
- Answer: execute the plan
- Audit: verify 4-phase compliance, no invented facts, no governance echo

This prevents:
- Subagents inventing facts not in spec/requirements
- Context loss between reviewers and implementer
- Vague or non-committal responses
- Circular reasoning or goalpost-moving

## How to Use

When dispatching implementer subagents:

```
[Original Superpowers flow] + [THE_LAW enforcement in prompts]
↓
Implementer responds with 4-phase structure
↓
Spec reviewer uses 4-phase structure to verify
↓
Code quality reviewer uses 4-phase structure for final assessment
↓
All responses are auditable, traceable, fact-based
```

## Integration Points

### Implementer Prompt (`implementer-prompt.md`)
- Lines 8-40: THE_LAW.md preamble defining 4-phase structure
- Subagent must use 4-phase structure in every response
- Task description, context, questions, and self-review follow THE_LAW constraints

### Spec Reviewer Prompt (`spec-reviewer-prompt.md`)
- Lines 8-39: THE_LAW.md preamble for reviewers
- Spec reviewer MUST verify code, not trust implementer report (already enforced in Superpowers)
- 4-phase audit ensures compliance verdicts are fact-based

### Code Quality Reviewer Note (`code-quality-reviewer-prompt.md`)
- Lines 9, 21-25: THE_LAW.md integration note
- Delegates to `superpowers:code-reviewer` but adds 4-phase instruction
- Code quality assessment must follow THE_LAW structure

## Compatibility

**Upstream:** This fork maintains compatibility with [obra/superpowers](https://github.com/obra/superpowers) main branch.

To sync with upstream:
```bash
git fetch upstream
git merge upstream/main
```

**Conflicts expected:** Only in subagent-driven-development prompt files (our THE_LAW modifications will conflict with upstream changes). Resolve by re-applying THE_LAW preambles to updated prompts.

## Testing THE_LAW Integration

### Quick Test
1. Use `superpowers:subagent-driven-development` skill normally
2. Inspect subagent responses—should include 4-phase structure
3. Verify spec reviewer enforces THE_LAW constraints
4. Verify code quality reviewer includes THE_LAW audit

### Validation Checklist
- [ ] Implementer response starts with "Extracted Truth"
- [ ] Implementer Plan includes constraint mapping
- [ ] Implementer Audit field is non-empty
- [ ] Spec reviewer Verdict is explicit (✅ or ❌ + facts)
- [ ] Code quality reviewer Assessment includes 4-phase audit
- [ ] No invented facts across all three subagent responses
- [ ] All responses reference specific code locations (file:line)

## Future Work

**Potential enhancements:**
1. Create `superpowers:the-law-enforced-subagent-development` as separate skill option (non-breaking)
2. Add automated validation of 4-phase structure adherence
3. Create `THE_LAW.md` reference file in repo root
4. Add hooks for session startup to load governance context
5. Create integration tests validating 4-phase structure across subagent responses

## License

This fork is MIT-licensed (original: Copyright 2025 Jesse Vincent).
THE_LAW.md integration (Copyright 2026 Pedro Lança) also licensed under MIT.

---

**Upstream:** https://github.com/obra/superpowers
**Fork maintainer:** Pedro Lança
**Last updated:** 2026-01-16
