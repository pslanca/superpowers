#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
SKILLS_SRC="$REPO_ROOT/skills"
SKILLS_DEST="$HOME/.claude/skills"

echo "Deploying skills from superpowers to ~/.claude/skills/"
echo ""

mkdir -p "$SKILLS_DEST"

# Validate all skills have required frontmatter
errors=0
for skill_dir in "$SKILLS_SRC"/*/; do
    skill_name=$(basename "$skill_dir")
    skill_file="$skill_dir/SKILL.md"

    if [[ ! -f "$skill_file" ]]; then
        echo "ERROR: $skill_name missing SKILL.md"
        errors=$((errors + 1))
        continue
    fi

    if ! grep -q "^name:" "$skill_file"; then
        echo "ERROR: $skill_name missing 'name' in frontmatter"
        errors=$((errors + 1))
    fi
done

if [[ $errors -gt 0 ]]; then
    echo ""
    echo "Found $errors validation error(s). Fix before deploying."
    exit 1
fi

# Deploy each skill
deployed=0
for skill_dir in "$SKILLS_SRC"/*/; do
    skill_name=$(basename "$skill_dir")
    skill_file="$skill_dir/SKILL.md"
    dest_dir="$SKILLS_DEST/$skill_name"

    mkdir -p "$dest_dir"
    ln -sf "$skill_file" "$dest_dir/skill.md"

    # Symlink references directory if it exists
    if [[ -d "$skill_dir/references" ]]; then
        rm -rf "$dest_dir/references"
        ln -sfn "$skill_dir/references" "$dest_dir/references"
    fi

    # Copy scripts directory if it exists
    if [[ -d "$skill_dir/scripts" ]]; then
        rsync -a --delete "$skill_dir/scripts/" "$dest_dir/scripts/"
    fi

    echo "  ✓ $skill_name"
    deployed=$((deployed + 1))
done

echo ""
echo "Deployed $deployed skills successfully."
