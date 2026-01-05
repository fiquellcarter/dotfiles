export BAT_THEME="base16"
export MANPAGER="nvim +Man!"

# Enable vi-style command line editing
set -o vi

set completion-ignore-case on

# Ensure command hashing is off for mise
set +h

# History control
shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=32768
HISTFILESIZE="$HISTSIZE"

# Add personal bin directory
if [[ -d "$HOME/.bin" ]]; then
    export PATH="$HOME/.bin:$PATH"
fi

# Add Composer global binaries
if [[ -d "$HOME/.config/composer/vendor/bin" ]]; then
    export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

zd() {
    if [[ $# -eq 0 ]]; then
        builtin cd ~ && return
    elif [[ -d "$1" ]]; then
        builtin cd "$1" && return
    else
        z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
    fi
}

# Path to GitHub SSH key
SSH_KEY="$HOME/.ssh/github_fiquellcarter"

# Function to start ssh-agent and add key
start_ssh_agent() {
    eval "$(ssh-agent -s)" &>/dev/null

    if [[ -f "$SSH_KEY" ]]; then
        ssh-add "$SSH_KEY" &>/dev/null
    fi
}

# Start agent if needed
if [[ -z "$SSH_AUTH_SOCK" ]] || ! ssh-add -l &>/dev/null; then
    start_ssh_agent
fi

# Show rave effect on new terminal
rave

# Quick shortcuts
alias c="rave"
alias v="nvim"
alias q="exit"

alias cd="zd"

# Eza (modern ls) aliases
alias ls="eza -all --icons=always --group-directories-first"
alias lt="eza --tree --all --icons=always --group-directories-first"

# Git & Docker TUI
alias lg="lazygit"
alias ld="lazydocker"

if command -v mise &>/dev/null; then
    eval "$(mise activate bash)"
fi

if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

if command -v try &>/dev/null; then
    eval "$(try init ~/Programming/Probe)"
fi

if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

if command -v fzf &>/dev/null; then
    if [[ -f "/usr/share/fzf/completion.bash" ]]; then
        source "/usr/share/fzf/completion.bash"
    fi

    if [[ -f "/usr/share/fzf/key-bindings.bash" ]]; then
        source "/usr/share/fzf/key-bindings.bash"
    fi
fi
