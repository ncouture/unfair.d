# Unfair.d Emacs Configuration

A modular, high-performance Emacs 30.1+ configuration optimized for AI-assisted development and modern workflows.

## Project Overview

This configuration is built with a "modular-first" philosophy, separating core engine logic from user-specific tweaks. It features deep integration with Large Language Models (LLMs) and prioritizes startup speed and stability.

- **Core Technologies:** Emacs 30.1, TypeScript (via Tree-sitter), Org Mode (manual build), `gptel` (LLM client).
- **Architecture:**
    - `early-init.el`: Handles pre-initialization, including suppressing `package-initialize` and setting up early `load-path` for Org Mode.
    - `init.el`: Main entry point that orchestrates the loading of modules from `lisp/`.
    - `lisp/`: Contains core functional modules (`init-*.el`).
    - `user-lisp/`: Reserved for personal extensions and overrides.
    - `site-lisp/`: Legacy or manually managed third-party libraries.

## AI & LLM Integration

The configuration is "AI-native," centered around `gptel` and the **Model Context Protocol (MCP)**.

- **Backends:** Supports OpenAI, Anthropic, and Google Gemini.
- **MCP Hub:** Integrated support for MCP servers (e.g., filesystem, fetch) to provide tools to the LLM.
- **Secure Key Management:** API keys are managed via Emacs' `auth-source`.

### AI Setup

Add your API keys to `~/.authinfo.gpg` (encrypted) or `~/.authinfo`:

```text
machine api.openai.com login apikey password <YOUR_OPENAI_KEY>
machine api.anthropic.com login apikey password <YOUR_ANTHROPIC_KEY>
machine generativelanguage.googleapis.com login apikey password <YOUR_GEMINI_KEY>
```

## Building and Running

### Startup & Validation
- **Standard Start:** Launch `emacs`.
- **Batch Validation:** Run the provided test script to ensure a clean startup without warnings or errors:
  ```bash
  ./test-startup.sh
  ```
- **Benchmarking:** Startup time is measured and reported via the `init-benchmarking` module.

### Dependencies
- **Manual Org Mode:** This config expects a manual Org Mode installation at `~/git/org-mode/lisp`.
- **Tree-sitter:** Language grammars are managed via `init-treesitter.el`. Ensure grammars are installed using `M-x treesit-install-language-grammar`.

## Development Conventions

- **Modularity:** Do not add configuration directly to `init.el`. Instead, create or modify a module in `lisp/` or use `user-lisp/` for personal tweaks.
- **Lexical Binding:** All `.el` files must use `lexical-binding: t`.
- **Package Management:** Use `require-package` or `maybe-require-package` (from `init-elpa.el`) to declare dependencies.
- **Hooks:** Prefer `after-init-hook` for logic that depends on packages being fully loaded.
- **Versioning:** This project uses `release-please`. Ensure commit messages follow the [Conventional Commits](https://www.conventionalcommits.org/) specification for automated changelog and version updates.
