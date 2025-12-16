# Exit if not interactive
[[ $- != *i* ]] && return

# Load Omarchy defaults
[[ -f "$HOME/.local/share/omarchy/default/bash/rc" ]] && source "$HOME/.local/share/omarchy/default/bash/rc"

# PATH additions
[[ -d "$HOME/.bin" ]] && export PATH="$HOME/.bin:$PATH"
[[ -d "$HOME/.config/composer/vendor/bin" ]] && export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# SSH key path
SSH_KEY="$HOME/.ssh/github_fiquellcarter"

# Start agent and load key
start_ssh_agent() {
    eval "$(ssh-agent -s)" &>/dev/null
    [[ -f "$SSH_KEY" ]] && ssh-add "$SSH_KEY" &>/dev/null
}

# Ensure agent has a key
[[ -z "$SSH_AUTH_SOCK" ]] || ! ssh-add -l &>/dev/null && start_ssh_agent

# eza aliases
alias ls="eza --icons=always --group-directories-first"
alias lsa="ls -a"
alias lt="eza --tree --icons=always --group-directories-first"
alias lta="lt -a"
