#!/usr/bin/env zsh
WORDCHARS='*?_[]~=&;!#$%^(){}<>:.-'

setopt appendhistory
setopt autocd
setopt autopushd           # push the old directory onto the stack on cd.
setopt autoremoveslash
setopt banghist
setopt braceccl
setopt cdablevars          # change directory to a path stored in a variable.
setopt chaselinks
setopt combiningchars
setopt correct
setopt extendedglob        # use extended globbing syntax.
setopt histexpiredupsfirst
setopt histfindnodups
setopt histignorealldups
setopt histignoredups
setopt histignorespace
setopt histreduceblanks
setopt histsavenodups
setopt histverify
setopt incappendhistory
setopt interactivecomments
setopt multios              # write to multiple descriptors.
setopt numericglobsort
setopt pushdignoredups    # do not store duplicates in the stack.
setopt pushdsilent         # do not print the directory stack after pushd or popd.
setopt pushdtohome        # push to home directory when no argument is given.

unsetopt beep
unsetopt checkjobs
unsetopt hup
unsetopt bgnice
unsetopt clobber
unsetopt extendedhistory
unsetopt rmstar_silent

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

zstyle ':completion:*' insert-tab false

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
