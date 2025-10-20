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
  local target_dir="${HOME}/.config/opencode/plugins/superpowers"
  
  mkdir -p "$(dirname "$target_dir")"
  
  if [ -d "$target_dir" ]; then
    echo "⚠️  Superpowers already installed at $target_dir"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      echo "Installation cancelled."
      return 1
    fi
    rm -rf "$target_dir"
  fi
  
  cp -r "$SUPERPOWERS_SOURCE" "$target_dir"
  echo "✓ Superpowers installed globally to $target_dir"
  echo ""
  echo "Next steps:"
  echo "  1. Restart OpenCode"
  echo "  2. Skills and agents will be automatically available"
}

install_project() {
  if [ ! -d ".git" ]; then
    echo "Error: Not in a git repository root"
    return 1
  fi
  
  local target_dir=".opencode/plugins/superpowers"
  
  mkdir -p "$(dirname "$target_dir")"
  
  if [ -d "$target_dir" ]; then
    echo "⚠️  Superpowers already installed at $target_dir"
    read -p "Overwrite? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
      echo "Installation cancelled."
      return 1
    fi
    rm -rf "$target_dir"
  fi
  
  cp -r "$SUPERPOWERS_SOURCE" "$target_dir"
  echo "✓ Superpowers installed to $target_dir"
  echo ""
  echo "Next steps:"
  echo "  1. Restart OpenCode in this project"
  echo "  2. Skills and agents will be automatically available"
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
