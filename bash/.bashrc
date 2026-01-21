# Environment variables
export BAT_THEME="Catppuccin Mocha"
export EDITOR=nvim
export MANPAGER="nvim +Man!"
export HISTCONTROL=ignoreboth
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE

# Shell configuration
bind "set completion-ignore-case on"
set -o vi
shopt -s histappend

# PATH configuration
if [[ -d "$HOME/.bin" ]]; then
    export PATH="$HOME/.bin:$PATH"
fi

if [[ -d "$HOME/.config/composer/vendor/bin" ]]; then
    export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

# SSH configuration
SSH_KEY="$HOME/.ssh/github_fiquellcarter"

start_ssh_agent() {
    eval "$(ssh-agent -s)" &>/dev/null

    if [[ -f "$SSH_KEY" ]]; then
        ssh-add "$SSH_KEY" &>/dev/null
    fi
}

if [[ -z "$SSH_AUTH_SOCK" ]] || ! ssh-add -l &>/dev/null; then
    start_ssh_agent
fi

# Startup
rave

# Muscle-memory aliases
alias c="rave"
alias v="nvim"
alias q="exit"

alias ff="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias ls="eza --all --icons=always --group-directories-first"
alias lt="eza --tree --all --icons=always --group-directories-first"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --amend --no-edit"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log --all --decorate --graph --oneline"
alias gpl="git pull"
alias gps="git push"
alias gr="git rebase"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gs="git status --short --branch"

# CLI tools initialization
eval "$(fzf --bash)"
eval "$(mise activate bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(try init ~/programming/tries)"
