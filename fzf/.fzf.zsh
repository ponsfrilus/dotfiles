# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nborboen/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
# source "/home/nborboen/.fzf/shell/key-bindings.zsh"
