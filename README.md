# NvData — Opinionated Neovim for Data‑Centric Devs

*A lightweight fork of [NvChad](https://github.com/NvChad/NvChad) tuned for Rust, TypeScript, YAML and day‑to‑day data engineering.*

---

## ✨ Feature Highlights

| Area                     | Goodies                                                                                     |
| ------------------------ | -------------------------------------------------------------------------------------------- |
| **Language Servers**     | `rust_analyzer`, `ts_ls`, `yamlls`, `pyright`, `lua_ls`, `html`, `cssls`                     |
| **Formatting / Linting** | [`conform.nvim`](https://github.com/stevearc/conform.nvim) – optional *format‑on‑save*       |
| **Completion + AI**      | `nvim‑cmp`, `crates.nvim` (Cargo smarts), **GitHub Copilot** on `Ctrl‑L`                     |
| **Fuzzy Find / Git**     | Telescope (`Leader f f`, `Leader f g`), Neogit, Diffview                                     |
| **Treesitter**           | Grammar for `vim lua yaml rust typescript tsx html css`                                      |
| **Package Manager**      | Mason + mason‑lspconfig → one command for all LSPs & tools                                   |
| **QoL Tweaks**           | Inlay hints auto‑enabled, split nav `Ctrl‑h/j/k/l`, universal **Leader q** cleanup           |
| **Markdown**             | Preview (`Leader m g`), Cheatsheet (`Leader c h`)                                            |


---

## 🚀 Quick Start

```bash
# 1. Grab the config
git clone https://github.com/spread-ai/nvdata ~/.config/nvim

# 2. First launch – installs plugins
nvim +'Lazy sync' +qa

# 3. Pull language servers & formatters
nvim +MasonInstallAll +qa
```

> **Prereqs:** Neovim ≥ 0.9, Git, Node 16+, Rust toolchain.

### Recommended extras

```bash
# Live‑grep for Telescope
cargo install ripgrep
```

---

## 🕹 Keymap Cheat‑Sheet

| Action                                   | Keys                |
| ---------------------------------------- | ------------------- |
| **Leader**                               | **Space**           |
| File tree toggle                         | `Ctrl‑n`            |
| Telescope — Find files / Live grep       | `Leader f f / f g`  |
| Buffer next / prev                       | `Tab / Shift‑Tab`   |
| Split nav                                | `Ctrl‑h/j/k/l`      |
| **Close loclist / quickfix / term**      | `Leader q`          |
| Hover diagnostic (full)                  | `K`                 |
| Diagnostic list                          | `Leader d l`        |
| Copilot accept (insert)                  | `Ctrl‑l`            |
| Cheatsheet popup                         | `Leader c h`        |
| markdown preview                         | `Leader m g`        |
| Git integration                          | `Leader g g`              |

*Enable format‑on‑save by uncommenting `event = "BufWritePre"` in `plugins/conform.lua`.*

---

## 🖥  Terminal + Fonts (optional)

1. **Alacritty**

   ```bash
   brew install alacritty
   git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
   ```

2. **Nerd Fonts**

   Download *SourceCodePro Nerd Font* and set it in `~/.config/alacritty/alacritty.toml`:

   ```toml
   [general]
   import = ["~/.config/alacritty/themes/themes/tokyo-night.toml"]

   [font]
   normal = { family = "SauceCodePro Nerd Font Mono" }
   ```

---

## 🧰 tmux Booster

```bash
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Minimal `~/.tmux.conf`:

```bash
set -g mouse on
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'erikw/tmux-powerline'
set -g @plugin 'tmux-plugins/tmux-resurrect'

run '~/.tmux/plugins/tpm/tpm'
```

Check `scripts/tmux-session.sh` for a project launcher with editor, auth‑mock, Redis & Neo4j panes.

---

## 🔄 Updating

```bash
cd ~/.config/nvim
git pull
nvim +Lazy\ sync +qa
nvim +MasonUpdate +qa
```

---

## 🩹 Troubleshooting

| Symptom                                           | Fix                            |
| ------------------------------------------------- | ------------------------------ |
| `updated_registries nil` error on launch          | `:Lazy sync` for patched Mason |
| LSP not attaching                                 | `:MasonInstallAll` then `:LspInfo` |
| Copilot clashes with Tab                          | Tab is disabled → use `Ctrl‑l` |

---

## License

MIT © 2025 SPREAD
