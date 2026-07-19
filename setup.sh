#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Check dependencies
echo "🔍 Checking dependencies..."
MISSING=()
for cmd in git zsh tmux nvim wezterm; do
    if ! command -v "$cmd" &> /dev/null; then
        MISSING+=("$cmd")
        echo "  ❌ Missing: $cmd"
    else
        echo "  ✓ Found: $cmd"
    fi
done

if [ ${#MISSING[@]} -gt 0 ]; then
    echo ""
    echo "⚠️  Missing dependencies. Install them:"
    echo ""
    echo "On Ubuntu/Debian:"
    echo "  sudo apt update"
    echo "  sudo apt install ${MISSING[@]}"
    echo ""
    echo "Then run this script again."
    exit 1
fi

echo ""

link() {
    local src="$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"

    if [ -L "$dst" ]; then
        echo "  ✓ Already linked: $dst"
        return
    elif [ -e "$dst" ]; then
        mkdir -p "$BACKUP_DIR"
        mv "$dst" "$BACKUP_DIR/"
        echo "  ✓ Backed up: $dst → $BACKUP_DIR/"
    fi

    ln -s "$src" "$dst"
    echo "  ✓ Linked: $dst"
}

echo "🔗 Setting up dotfiles..."
echo ""

echo "📁 Linking ~/.config entries"
link "$DOTFILES_DIR/nvim"    "$HOME/.config/nvim"
link "$DOTFILES_DIR/wezterm" "$HOME/.config/wezterm"

echo ""
echo "🐚 Linking shell dotfiles"
link "$DOTFILES_DIR/shell/.zshrc"        "$HOME/.zshrc"
link "$DOTFILES_DIR/shell/.bashrc"       "$HOME/.bashrc"
link "$DOTFILES_DIR/shell/.bash_aliases" "$HOME/.bash_aliases"
link "$DOTFILES_DIR/shell/.fzf.bash"     "$HOME/.fzf.bash"
link "$DOTFILES_DIR/shell/.fzf.zsh"      "$HOME/.fzf.zsh"
link "$DOTFILES_DIR/shell/.p10k.zsh"     "$HOME/.p10k.zsh"
link "$DOTFILES_DIR/shell/.profile"      "$HOME/.profile"

echo ""
echo "📌 Linking tmux config"
link "$DOTFILES_DIR/tmux/.tmux.conf"       "$HOME/.tmux/.tmux.conf"
link "$DOTFILES_DIR/tmux/.tmux.conf.local" "$HOME/.tmux.conf.local"

echo ""
echo "✨ Linking Oh My Zsh custom plugins/themes"
OMZ_CUSTOM="$HOME/.oh-my-zsh/custom"
link "$DOTFILES_DIR/oh-my-zsh-custom/plugins/zsh-autosuggestions"     "$OMZ_CUSTOM/plugins/zsh-autosuggestions"
link "$DOTFILES_DIR/oh-my-zsh-custom/plugins/zsh-syntax-highlighting" "$OMZ_CUSTOM/plugins/zsh-syntax-highlighting"
link "$DOTFILES_DIR/oh-my-zsh-custom/themes/powerlevel10k"            "$OMZ_CUSTOM/themes/powerlevel10k"

echo ""
echo "✅ Done! Restart shell or run: source ~/.zshrc"
if [ -d "$BACKUP_DIR" ]; then
    echo "💾 Old files backed up to: $BACKUP_DIR"
fi
