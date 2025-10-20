# Superpowers

Give your AI coding agent superpowers with a comprehensive library of proven techniques, patterns, and workflows.

Works with [OpenCode](https://opencode.ai).

## What You Get

- **Testing Skills** - TDD, async testing, anti-patterns
- **Debugging Skills** - Systematic debugging, root cause tracing, verification
- **Collaboration Skills** - Brainstorming, planning, code review, parallel agents
- **Development Skills** - Git worktrees, finishing branches, subagent workflows
- **Meta Skills** - Creating, testing, and sharing skills

Plus:
- **6 Specialized Agents** - `tdd`, `brainstorm`, `debug`, `planner`, `review`, `verify`
- **2 Primary Modes** - `build` (full capabilities) and `plan` (read-only analysis)
- **Consistent Workflows** - Systematic approaches to common engineering tasks

## Learn More

Read the introduction: [Superpowers for OpenCode](https://blog.fsck.com/2025/10/09/superpowers/)

## Installation

### As a Plugin

Install as an OpenCode plugin:

```bash
# Globally
cp -r . ~/.config/opencode/plugins/superpowers

# Or project-specific
mkdir -p .opencode/plugins
cp -r . .opencode/plugins/superpowers
```

Then restart OpenCode. The agents and skills will be available automatically.

### Available Agents

Invoke agents using the `@` mention syntax:

- **`@tdd`** - Write tests first, implement minimal code to pass tests
- **`@brainstorm`** - Refine ideas into designs through Socratic questioning
- **`@debug`** - Find root cause of issues before proposing fixes
- **`@planner`** - Create detailed implementation plans with task breakdown
- **`@review`** - Thorough code review for quality, security, and maintainability
- **`@verify`** - Verify work is complete using defense-in-depth validation

### Examples

```
@brainstorm I want to add real-time notifications to my app
@tdd Help me implement a retry function with exponential backoff
@debug This API call is failing intermittently
@planner Create a plan to refactor our database queries for performance
@review Please review this authentication module
@verify Is the payment processing feature complete and tested?
```

## What's Inside

### Skills Library

**Testing** (`skills/`)
- **test-driven-development** - RED-GREEN-REFACTOR cycle
- **condition-based-waiting** - Async test patterns
- **testing-anti-patterns** - Common pitfalls to avoid

**Debugging** (`skills/`)
- **systematic-debugging** - 4-phase root cause process
- **root-cause-tracing** - Find the real problem
- **verification-before-completion** - Ensure it's actually fixed
- **defense-in-depth** - Multiple validation layers

**Collaboration** (`skills/`)
- **brainstorming** - Socratic design refinement
- **writing-plans** - Detailed implementation plans
- **executing-plans** - Batch execution with checkpoints
- **dispatching-parallel-agents** - Concurrent subagent workflows
- **requesting-code-review** - Pre-review checklist
- **receiving-code-review** - Responding to feedback
- **using-git-worktrees** - Parallel development branches
- **finishing-a-development-branch** - Merge/PR decision workflow
- **subagent-driven-development** - Fast iteration with quality gates

**Meta** (`skills/`)
- **writing-skills** - Create new skills following best practices
- **sharing-skills** - Contribute skills back via branch and PR
- **testing-skills-with-subagents** - Validate skill quality
- **using-superpowers** - Introduction to the skills system

## How It Works

OpenCode automatically discovers the `.opencode/` configuration and makes agents available. Agents are specialized AI assistants configured with specific tool access and instructions:

- **2 Primary Modes** - `build` for development and `plan` for analysis
- **6 Subagents** - Specialized agents for specific tasks like TDD, debugging, and code review
- **Skills Library** - Large collection of proven patterns and workflows
- **Automatic Discovery** - Agents read from `.opencode/agent/` directory
- **Plugin System** - Hooks in `hooks/` extend OpenCode behavior

## Philosophy

- **Test-Driven Development** - Write tests first, always
- **Systematic over ad-hoc** - Process over guessing
- **Complexity reduction** - Simplicity as primary goal
- **Evidence over claims** - Verify before declaring success
- **Domain over implementation** - Work at problem level, not solution level

## Contributing

Skills live directly in this repository. To contribute:

1. Fork the repository
2. Create a branch for your skill
3. Follow the `writing-skills` skill for creating new skills
4. Use the `testing-skills-with-subagents` skill to validate quality
5. Submit a PR

See `skills/meta/writing-skills/SKILL.md` for the complete guide.

## Updating

Update your copy of Superpowers by pulling from the repository:

```bash
git pull origin main
```

## Support

- **Issues**: https://github.com/sst/superpowers/issues
- **OpenCode**: https://opencode.ai
