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

**Unfair.d** is built to be extended without touching core files in `lisp/`.

### The Recommended Way: `user-lisp/`
To add your own tools, languages, or personal tweaks:
1.  Create a file in the `user-lisp/` directory (e.g., `user-lisp/init-my-config.el`).
2.  Add your configuration and ensure it ends with `(provide 'init-my-config)`.
3.  Any file matching the pattern `init-*.el` in `user-lisp/` will be **automatically loaded** by `site-lisp/init-local.el` after the main configuration.

### Important: Avoid `init-local.el`
While Emacs allows creating a personal `init-local.el`, we strongly recommend **avoiding this**.
- Custom libraries in `user-lisp/` provide better organization.
- Overwriting `init-local.el` may disable the automatic loading of your `user-lisp/` modules.
- If you cannot achieve a specific customization via `user-lisp/`, please **open an issue** tagged as a bug so we can assist you.

Pull requests are always welcome!

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
