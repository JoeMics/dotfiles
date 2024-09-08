# figlet -cf lean "Welcome"
fastfetch

# Set neovim as default editor if possible
if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

alias fucking="sudo"
alias nvimconf="cd ~/.config/nvim/ && $EDITOR"
