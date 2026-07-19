# Setup fzf
# ---------
if [[ ! "$PATH" == */home/allan/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/allan/fzf/bin"
fi

source <(fzf --zsh)
