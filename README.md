# Unfair.d: A Modular Emacs Configuration for the AI Era

[![CI](https://github.com/ncouture/unfair.d/actions/workflows/test.yml/badge.svg)](https://github.com/ncouture/unfair.d/actions)

**Unfair.d** is a high-performance, modular Emacs configuration designed for modern developers who want a "fair advantage." Forked from the legendary configuration by [Steve Purcell (@SanityInc)](https://github.com/purcell/emacs.d), this setup maintains its battle-tested stability while pivoting toward **deep AI integration** and **modular extensibility**.

---

## 🚀 Key Philosophy

1.  **AI-First Workflow**: Built-in support for Model Context Protocol (MCP), Gemini, OpenAI, and Anthropic via `gptel` and custom AI modules.
2.  **Modular by Design**: Every feature is a self-contained module in `lisp/`. Disable or add new functionality without touching the core logic.
3.  **Modern Defaults**: Fast, pretty, and productive. Uses `vertico`, `corfu`, `eglot`, and `treesitter` for a cutting-edge experience.
4.  **Org-Mode Powered**: Leverage the most powerful system for organization and documentation, pre-configured for productivity.

---

## 🧠 AI Integration

This configuration is optimized for AI-assisted coding and exploration:
- **`gptel` Support**: Seamless interaction with LLMs directly within Emacs buffers.
- **MCP (Model Context Protocol)**: Support for MCP servers to give your LLMs access to tools and your local filesystem.
- **Multi-Backend**: Pre-configured for Google Gemini, OpenAI, and Anthropic (just add your API keys).

---

## 🛠 Features & Languages

Inheriting the strengths of Steve Purcell's config, **Unfair.d** provides exceptional support for:

*   **Languages**: Haskell, Ruby, Typescript/Javascript, Rust, Python, Clojure, Go, and more.
*   **Web**: HTML/CSS (SCSS/LESS), HAML, Markdown, YAML, JSON.
*   **Tools**:
    *   `Magit`: The best Git interface ever made.
    *   `Dired`: Enhanced directory management.
    *   `Projectile`: Quick project-wide navigation.
    *   `Eglot`: Lightweight, built-in LSP client.
    *   `Vertico/Consult/Corfu`: A modern, responsive completion stack.


---

## 🏗 Modular Extensibility

Adding your own logic is easy. **Unfair.d** is built to be extended:

### 1. The Easy Way (init-local.el)
Create `~/.emacs.d/lisp/init-local.el`. Anything in this file will be loaded last.
```el
;; Load your personal libraries (stored in [user-lisp](./user-lisp/)) here
(setq-default display-line-numbers-type 'relative)
(provide 'init-local)
```

### 2. The Modular Way
Want to add a new tool or language?
1. Create `lisp/init-my-cool-feature.el`.
2. Add your config and `(provide 'init-my-cool-feature)`.
3. Add `(require 'init-my-cool-feature)` to your `init-local.el` or fork and add it to `init.el`.

---

## 📥 Installation

1.  **Backup your old config**:
    ```bash
    mv ~/.emacs.d ~/.emacs.d.bak
    ```
2.  **Clone Unfair.d**:
    ```bash
    git clone https://github.com/ncouture/unfair.d.git ~/.emacs.d
    ```
3.  **Launch Emacs**:
    Packages will be automatically downloaded and installed on the first run.

### API Keys for AI
For full AI functionality, place your keys in the following files (or customize `lisp/init-gptel.el`):
- `~/.ssh/apiKeys/gemini.key`
- `~/.ssh/apiKeys/openai.key`
- `~/.ssh/apiKeys/anthropic.key`

---

## 🔄 Updates

Stay up to date with `git pull`. To update packages:
1. `M-x package-list-packages`
2. Press `U`, then `x`.

---

## 🙏 Credits

This project is a fork of [Steve Purcell's emacs.d](https://github.com/purcell/emacs.d). We owe a massive debt of gratitude to Steve for his 20+ years of maintenance and excellent architectural decisions that made this modular fork possible.

---

*Hacked with ❤️ by Nicolas Couture and contributors.*
