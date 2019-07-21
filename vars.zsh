#!/usr/bin/env zsh

: ${EDITOR:="vim"}
: ${VISUAL:="vim"}
: ${PAGER:="less"}
: ${HISTSIZE:=9999}
: ${SAVEHIST:=9999}
: ${LISTMAX:=9999}

export EDITOR
export VISUAL
export PAGER
export HISTSIZE
export SAVEHIST
export LISTMAX

WORDCHARS='*?_[]~=&;!#$%^(){}<>:.'
HISTFILE="$HOME/.zsh_history"
ZSH_COMPDUMP="$HOME/.zcompdump"
