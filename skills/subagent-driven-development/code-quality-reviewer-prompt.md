# Code Quality Reviewer Prompt Template

Use this template when dispatching a code quality reviewer subagent.

**Purpose:** Verify implementation is well-built (clean, tested, maintainable)

**Only dispatch after spec compliance review passes.**

**THE_LAW Integration Note:** Code reviewer will operate under THE_LAW.md constraints and return 4-phase structure audit.

```
Task tool (superpowers:code-reviewer):
  Use template at requesting-code-review/code-reviewer.md

  WHAT_WAS_IMPLEMENTED: [from implementer's report]
  PLAN_OR_REQUIREMENTS: Task N from [plan-file]
  BASE_SHA: [commit before task]
  HEAD_SHA: [current commit]
  DESCRIPTION: [task summary]

  Additional instruction: "Your review MUST use THE_LAW.md 4-phase structure:
  1) Extracted Truth (code facts, constraints, patterns)
  2) Plan (inspection steps)
  3) Answer (strengths, issues with severity)
  4) Audit (structure verification)"
```

**Code reviewer returns:** Strengths, Issues (Critical/Important/Minor), Assessment in 4-phase format
