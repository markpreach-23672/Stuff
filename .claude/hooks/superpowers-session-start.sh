#!/usr/bin/env bash
# SessionStart hook: injects the superpowers:using-superpowers skill into
# session context. Adapted from obra/superpowers' hooks/session-start,
# vendored under .claude/skills/ since /plugin install isn't available here.
# Reads from a project-relative path instead of ${CLAUDE_PLUGIN_ROOT}.

set -euo pipefail

SKILL_PATH="${CLAUDE_PROJECT_DIR}/.claude/skills/using-superpowers/SKILL.md"
using_superpowers_content=$(cat "${SKILL_PATH}" 2>&1 || echo "Error reading using-superpowers skill")

escape_for_json() {
    local s="$1"
    s="${s//\\/\\\\}"
    s="${s//\"/\\\"}"
    s="${s//$'\n'/\\n}"
    s="${s//$'\r'/\\r}"
    s="${s//$'\t'/\\t}"
    printf '%s' "$s"
}

using_superpowers_escaped=$(escape_for_json "$using_superpowers_content")
session_context="<EXTREMELY_IMPORTANT>\nYou have superpowers.\n\n**Below is the full content of your 'superpowers:using-superpowers' skill - your introduction to using skills. For all other skills, use the 'Skill' tool:**\n\n${using_superpowers_escaped}\n</EXTREMELY_IMPORTANT>"

printf '{\n  "hookSpecificOutput": {\n    "hookEventName": "SessionStart",\n    "additionalContext": "%s"\n  }\n}\n' "$session_context"

exit 0
