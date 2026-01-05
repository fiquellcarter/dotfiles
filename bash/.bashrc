# Theming and pager
export BAT_THEME="base16"
export MANPAGER="nvim +Man!"

# History: append-only, clean, large
shopt -s histappend

export HISTCONTROL=ignoreboth
export HISTSIZE=32768
export HISTFILESIZE="$HISTSIZE"

# Vi everywhere
set -o vi

# Forgiving completion
bind "set completion-ignore-case on"

# Personal binaries first
if [[ -d "$HOME/.bin" ]]; then
    export PATH="$HOME/.bin:$PATH"
fi

if [[ -d "$HOME/.config/composer/vendor/bin" ]]; then
    export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi

# SSH agent should just work
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

# Vibes
rave

# Muscle-memory aliases
alias c="rave"
alias v="nvim"
alias q="exit"

alias ff="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"
alias ls="eza --all --icons=always --group-directories-first"
alias lt="eza --tree --all --icons=always --group-directories-first"

alias lg="lazygit"
alias ld="lazydocker"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Tools that redefine the shell
eval "$(fzf --bash)"
eval "$(mise activate bash)"
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(try init ~/programming/tries)"
