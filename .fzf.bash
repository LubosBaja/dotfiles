# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lubos/.fzf/bin* ]]; then
  export PATH="$PATH:/home/lubos/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lubos/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/lubos/.fzf/shell/key-bindings.bash"

# Show hidden files
export FZF_DEFAULT_COMMAND='find . -path "*/\.git/*" -prune -o -path "*/\.dotfiles/*" -prune -o -type f -printf "%P\\n" 2>&1 | grep -v "Permission denied" '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
