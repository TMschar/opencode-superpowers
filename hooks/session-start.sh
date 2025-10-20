#!/usr/bin/env bash
# SessionStart hook for superpowers plugin

set -euo pipefail

# Determine plugin root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Check if legacy skills directory exists and build warning
warning_message=""
legacy_skills_dir="${HOME}/.config/superpowers/skills"
if [ -d "$legacy_skills_dir" ]; then
    warning_message="\n\n<important-reminder>IN YOUR FIRST REPLY AFTER SEEING THIS MESSAGE YOU MUST TELL THE USER:⚠️ **WARNING:** Superpowers now uses opencode's skills system. Custom skills in ~/.config/superpowers/skills will not be read. Move custom skills to ~/.opencode/skills instead. To make this message go away, remove ~/.config/superpowers/skills</important-reminder>"
fi

# Read using-superpowers content
using_superpowers_content=$(cat "${PLUGIN_ROOT}/skills/using-superpowers/SKILL.md" 2>&1 || echo "Error reading using-superpowers skill")

# Build JSON output using jq for robust escaping
jq -n \
  --arg content "$using_superpowers_content" \
  --arg warning "$warning_message" \
  '{
    "hookSpecificOutput": {
      "hookEventName": "SessionStart",
      "additionalContext": "<EXTREMELY_IMPORTANT>\nYou have superpowers.\n\n**The content below is from skills/using-superpowers/SKILL.md - your introduction to using skills:**\n\n\($content)\n\n\($warning)\n</EXTREMELY_IMPORTANT>"
    }
  }'

exit 0
