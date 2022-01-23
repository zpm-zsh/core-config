#!/usr/bin/env zsh
WORDCHARS='*?_[]~=&;!#$%^(){}<>:.-'

setopt append_history
setopt auto_cd
setopt auto_pushd           # push the old directory onto the stack on cd.
setopt auto_remove_slash
setopt bang_hist
setopt braceccl
setopt cdable_vars          # change directory to a path stored in a variable.
setopt chase_links
setopt combining_chars
setopt correct
setopt extended_glob        # use extended globbing syntax.
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt interactive_comments
setopt multios
setopt multios              # write to multiple descriptors.
setopt no_beep
setopt no_checkjobs
setopt no_hup
setopt numericglobsort
setopt pushd_ignore_dups    # do not store duplicates in the stack.
setopt pushd_silent         # do not print the directory stack after pushd or popd.
setopt pushd_to_home        # push to home directory when no argument is given.

unsetopt bg_nice
unsetopt clobber
unsetopt extended_history
unsetopt rm_star_silent

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

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=36=31'

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

bindkey '^[OF' end-of-line
bindkey '^[[F' end-of-line

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

bindkey -M menuselect ' ' accept-and-menu-complete

# CD
alias tmp='cd $(mktemp -d)'
alias -- -='cd -'

# HISTORY
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000

# PATH
prependpath "${HOME}/.bin"
prependpath "${HOME}/.local/bin"
