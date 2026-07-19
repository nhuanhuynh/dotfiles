# 🖥️ Dotfiles

Personal configuration files for Ubuntu development environment.

## 📋 Contents

- **🪟 nvim/** — Neovim configuration (lazy.nvim, LSP, treesitter)
- **🖨️ wezterm/** — WezTerm terminal emulator config
- **🐚 shell/** — Zsh, Bash, fzf, and Powerlevel10k configs
- **📌 tmux/** — Tmux config files
- **✨ oh-my-zsh-custom/** — Oh My Zsh plugins and themes

## 🚀 Installation

Clone and run setup script:

```bash
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles
chmod +x setup.sh
./setup.sh
```

The script will backup existing configs and create symlinks.

## 📝 Notes

- Requires: git, zsh, tmux, neovim, wezterm
- `.tmux/` repo should be cloned separately from https://github.com/gpakosz/.tmux
- Neovim requires: nodejs, ripgrep, fd

