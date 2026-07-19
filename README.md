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
git clone git@github.com:nhuanhuynh/dotfiles.git
cd dotfiles
chmod +x setup.sh
./setup.sh
```

After setup, create `~/.zshrc.local` for machine-specific secrets:

```bash
cat > ~/.zshrc.local << 'SECRETS'
# Local secrets and machine-specific configs (not committed to git)
export GEMINI_API_KEY="your-api-key-here"
SECRETS
```

The script will backup existing configs and create symlinks.

## 📝 Notes

- Requires: git, zsh, tmux, neovim, wezterm
- `.tmux/` repo should be cloned separately from https://github.com/gpakosz/.tmux
- Neovim requires: nodejs, ripgrep, fd
- Secrets in `~/.zshrc.local` are automatically sourced and not committed to git

