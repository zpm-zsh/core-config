#!/usr/bin/env zsh
WORDCHARS='*?_[]~=&;!#$%^(){}<>:.-'
SAVEHIST=1000

setopt append_history
setopt autocd
setopt braceccl
setopt combining_chars
setopt correct
setopt inc_append_history
setopt interactive_comments
setopt multios
setopt nobeep
setopt nocaseglob
setopt nocheckjobs
setopt nohup
setopt numericglobsort

unsetopt clobber
unsetopt bg_nice

zstyle ':completion:*:processes' command 'NOCOLORS=1 ps -U $USER|sed "/ps/d"'
zstyle ':completion:*:processes' insert-ids menu yes select
zstyle ':completion:*:processes-names' command 'NOCOLORS=1 ps xho command|sed "s/://g"'
zstyle ':completion:*:processes' sort false

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle '*' single-ignored show
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*:messages' format '%d'

zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:zcompile:*' ignored-patterns '(*~|*.zwc)'

zstyle ':completion:*:warnings' format "%{${c[red]}${c[bold]}%}No matches for:%{${c[yellow]}${c[bold]}%} %d"

if [[ "$CLICOLOR" != '0' ]]; then
  zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=36=31'
fi

zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path "${TMPDIR:-/tmp}/zsh-${UID}"

zmodload zsh/complist

bindkey -e

bindkey '^R' history-incremental-search-backward

bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history

bindkey '^[OH' beginning-of-line
bindkey '^[[H' beginning-of-line

bindkey '^[OF'  end-of-line
bindkey '^[[F'  end-of-line

bindkey '^[[1;5C' forward-word
bindkey '^[[C' forward-word

bindkey '^[[1;5D' backward-word
bindkey '^[[D' backward-word

bindkey '^[[C' forward-char
bindkey '^[[D' backward-char

bindkey '^?' backward-delete-char

bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char

bindkey '^[[3;5~' delete-word

bindkey '^H' backward-kill-word

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

bindkey -M menuselect ' ' accept-and-menu-complete

# CD
alias tmp='cd $(mktemp -d)'
alias cdo='cd -'
alias -- -='cd -'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# EDITOR 
export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

# HISTORY
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=5000

setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify

unsetopt extended_history

# PATH
appendpath "${HOME}/.bin"
appendpath "${HOME}/.local/bin"

