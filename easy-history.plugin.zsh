
# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# Command history configuration
setopt hist_ignore_dups     # ignore duplication command history list
setopt HIST_IGNORE_SPACE
setopt share_history        # share command history data
setopt inc_append_history

HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

function history-select() {
    BUFFER=`history -n 1 | fzf`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N history-select
bindkey "^@" history-select
