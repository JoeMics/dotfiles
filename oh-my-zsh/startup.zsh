figlet -cf lean "Welcome"
fastfetch

# Set neovim as default editor if possible
if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim"
else
    export EDITOR="vim"
fi

alias fucking="sudo"

# Config file editing
alias nvimconf="cd ~/.config/nvim/ && $EDITOR"
alias tmuxconf="$EDITOR ~/dotfiles/.tmux.conf"
alias editorconfig="$EDITOR ~/dotfiles/.editorconfig"
alias zshconf="$EDITOR ~/dotfiles/oh-my-zsh/startup.zsh"

# For Fedora KDE
alias o="dolphin . &"

# BCCRC specific scripts
alias moloncstart="$HOME/dotfiles/scripts/start_atlas-fe.sh"
