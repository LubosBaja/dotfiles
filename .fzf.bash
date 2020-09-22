# Setup fzf
# ---------
if [[ ! "$PATH" == */home/lubos/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/lubos/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/lubos/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/lubos/.fzf/shell/key-bindings.bash"
