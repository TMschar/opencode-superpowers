#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
SUPERPOWERS_SOURCE="$SCRIPT_DIR"

print_help() {
  cat << 'EOF'
Install Superpowers for OpenCode

Usage: ./install.sh [OPTIONS]

Options:
  --global      Install globally to ~/.config/opencode/plugins/superpowers
  --project     Install to .opencode/plugins/superpowers (current project)
  --help        Show this help message

If no option is provided, defaults to global installation.

Examples:
  ./install.sh                 # Install globally
  ./install.sh --global        # Install globally
  ./install.sh --project       # Install to current project
EOF
}

install_global() {
  local plugin_dir="${HOME}/.config/opencode/plugins/superpowers"
  local agent_dir="${HOME}/.config/opencode/agent"
  
  mkdir -p "$(dirname "$plugin_dir")"
  mkdir -p "$agent_dir"
  
  if [ -d "$plugin_dir" ]; then
    echo "⚠️  Superpowers already installed at $plugin_dir"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      echo "Installation cancelled."
      return 1
    fi
    rm -rf "$plugin_dir"
  fi
  
  cp -r "$SUPERPOWERS_SOURCE" "$plugin_dir"
  
  cp "$plugin_dir/.opencode/agent"/* "$agent_dir/"
  
  echo "✓ Superpowers installed globally"
  echo "  - Plugin: $plugin_dir"
  echo "  - Agents: $agent_dir"
  echo ""
  echo "Next steps:"
  echo "  1. Restart OpenCode"
  echo "  2. Agents (@tdd, @brainstorm, @debug, @planner, @review, @verify) will be available"
}

install_project() {
  if [ ! -d ".git" ]; then
    echo "Error: Not in a git repository root"
    return 1
  fi
  
  local plugin_dir=".opencode/plugins/superpowers"
  
  mkdir -p "$(dirname "$plugin_dir")"
  
  if [ -d "$plugin_dir" ]; then
    echo "⚠️  Superpowers already installed at $plugin_dir"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      echo "Installation cancelled."
      return 1
    fi
    rm -rf "$plugin_dir"
  fi
  
  cp -r "$SUPERPOWERS_SOURCE" "$plugin_dir"
  
  mkdir -p ".opencode/agent"
  cp "$plugin_dir/.opencode/agent"/* ".opencode/agent/"
  
  echo "✓ Superpowers installed to project"
  echo "  - Plugin: $plugin_dir"
  echo "  - Agents: .opencode/agent/"
  echo ""
  echo "Next steps:"
  echo "  1. Restart OpenCode in this project"
  echo "  2. Agents (@tdd, @brainstorm, @debug, @planner, @review, @verify) will be available"
}

main() {
  local mode="global"
  
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --global)
        mode="global"
        shift
        ;;
      --project)
        mode="project"
        shift
        ;;
      --help)
        print_help
        return 0
        ;;
      *)
        echo "Unknown option: $1"
        print_help
        return 1
        ;;
    esac
  done
  
  case "$mode" in
    global)
      install_global
      ;;
    project)
      install_project
      ;;
  esac
}

main "$@"
