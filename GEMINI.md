# Unfair.d Emacs Configuration

A modular, high-performance Emacs 30.1+ configuration optimized for AI-assisted development, modern workflows, and extreme responsiveness.

## Project Overview

This configuration is built with a "modular-first" philosophy, separating core engine logic from user-specific tweaks. It is "AI-native," featuring deep integration with Large Language Models (LLMs) and prioritizes startup speed through aggressive performance tuning and benchmarking.

- **Core Technologies:** Emacs 30.1, TypeScript (via Tree-sitter), Org Mode (manual build), `gptel` (LLM client).
- **Architecture:**
    - `early-init.el`: Handles pre-initialization, suppresses `package-initialize`, and optimizes early startup.
    - `init.el`: The central hub that orchestrates the loading of over 80+ modular units from `lisp/`.
    - `lisp/`: Contains core functional modules (`init-*.el`) for UI, version control, and language support.
    - `user-lisp/`: The primary directory for user-specific extensions and overrides (e.g., `init-01-gptel.el`). Modules are loaded automatically by `init-local.el` in numeric order.
    - `site-lisp/`: Legacy or manually managed third-party libraries and local overrides.

## AI & LLM Integration

The configuration is built to be a powerhouse for AI-assisted coding, centered around `gptel` and the **Model Context Protocol (MCP)**.

- **Backends:** Native support for Google Gemini (Pro/Flash), Anthropic (Claude), and OpenAI (GPT-4/5).
- **Tools & Completion:** Integrated with `gptel-fn-complete` for AI-powered completions and `gptel-aibo` for interactive suggestions.
- **Python optimization:** Uses `lazy-ruff` for high-performance Python linting and formatting.
- **Secure Key Management:** API keys are automatically retrieved via Emacs' `auth-source` (targeting `~/.authinfo.gpg` or `~/.authinfo`).

### AI Setup

Add your API keys to your authinfo file to enable seamless integration:

```text
machine api.openai.com login apikey password <YOUR_OPENAI_KEY>
machine api.anthropic.com login apikey password <YOUR_ANTHROPIC_KEY>
machine generativelanguage.googleapis.com login apikey password <YOUR_GEMINI_KEY>
```

## Performance & Benchmarking

Speed is a first-class citizen in this configuration.

- **Benchmarking:** Every `require` call is tracked. Use `M-x sanityinc/require-times` to see a detailed breakdown of package load times.
- **GCMH:** The Garbage Collector Magic Hack is used to minimize GC pauses during interaction while allowing high throughput during idle times.
- **Tuned I/O:** `read-process-output-max` and other I/O parameters are tuned for fast communication with LSPs and LLMs.

## Building and Running

### Startup & Validation
- **Standard Start:** Launch `emacs`.
- **Batch Validation:** Run the provided test script to ensure a clean startup without warnings or errors:
  ```bash
  ./test-startup.sh
  ```
- **Manual Org Mode:** This config expects a manual Org Mode installation at `~/git/org-mode/lisp`.

### Tree-sitter
Language grammars are managed via `init-treesitter.el`, which automatically remaps standard modes to their `-ts-mode` counterparts when grammars are detected in `~/.emacs.d/tree-sitter`.

## Development Conventions

- **Modularity:** Use the `user-lisp/` directory for personal tweaks. Files named `init-[0-9][0-9]-*.el` will be loaded automatically.
- **Lexical Binding:** All `.el` files MUST use `lexical-binding: t`.
- **Versioning:** This project uses `release-please` and follows [Conventional Commits](https://www.conventionalcommits.org/).
- **Automation:** GitHub Actions handle continuous integration, testing the configuration across multiple environments.
