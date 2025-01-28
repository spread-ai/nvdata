# NvData config for data team
- Forked from NvChad's Neovim config

## Installation

Hint: Run all commands prefixed with colon ':' from within nvim


0. Brew install neovim
1. Clone this repo to your `~/.config/nvim` directory
2. Run `:MasonInstallAll` to install all plugins
3. Install `ripgrep` for telescope to work properly - `cargo install ripgrep`
4. Install rust-analyzer: `rustup component add rust-analyzer`
5. Install typescript language server: `:MasonInstall typescript-language-server`

## Usage-hints
- Copilot auto-complete is on <C>-l
- leader is Space
- cheat sheet is leader+ch
- Tree is <C>+n 

## Using alacritty and correct term fonts
- Install alacritty
  - `brew install alacritty`
- Install nerd fonts
  - https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/SourceCodePro.zip
- Get alacritty themes:
```bash
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```
- Set alacritty font to a nerd fonts font:
.config/alacritty/alacritty.toml
```toml
[general]
import = ["~/.config/alacritty/themes/themes/tokyo-night.toml"]
live_config_reload = true

[font]
normal = { family= "SauceCodePro Nerd Font Mono" }
```

## Projecting like a boss with tmux
- Brew install tmux
- Make a project-like script that opens up a tmux session with the right windows and panes
- install TPM: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Example ~/.tmux.conf
- Installs TPM, sensible, powerline and tmux-resurrect
- Mouse is on
```bash
set -g mouse on
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'erikw/tmux-powerline'
set -g @plugin 'tmux-plugins/tmux-resurrect'

run '~/.tmux/plugins/tpm/tpm'
```


### Example gql2service config

```bash
#!/bin/bash

SESSION_NAME="gql2service"

# Check if the session already exists
tmux has-session -t $SESSION_NAME 2>/dev/null

if [ $? != 0 ]; then
    # Create a new session
    tmux new-session -d -s $SESSION_NAME -n editor

    # Window 1: Open nvim in gql2service folder
    tmux send-keys -t $SESSION_NAME:0 "cd ~/path/to/gql2service && nvim" C-m

    # Window 2: Run authmock
    tmux new-window -t $SESSION_NAME -n authmock
    tmux send-keys -t $SESSION_NAME:1 "cd ~/path/to/gql2service && ./authmock" C-m

    # Window 3: Start Docker Redis
    tmux new-window -t $SESSION_NAME -n redis
    tmux send-keys -t $SESSION_NAME:2 "cd ~/path/to/gql2service && docker run --rm -d --name redis redis:latest" C-m

    # Window 4: Start Docker Neo4j if not running
    tmux new-window -t $SESSION_NAME -n neo4j
    tmux send-keys -t $SESSION_NAME:3 "if ! docker ps | grep -q neo4j; then docker run --rm -d --name neo4j neo4j:latest; fi" C-m
fi

# Attach to the session
tmux attach -t $SESSION_NAME
```
