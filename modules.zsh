#!/usr/bin/env zsh

autoload -Uz is-at-least
if [[ ${ZSH_VERSION} != 5.1.1 && ${TERM} != "dumb" ]]; then
  if is-at-least 5.2; then
    autoload -Uz bracketed-paste-url-magic
    zle -N bracketed-paste bracketed-paste-url-magic
  else
    if is-at-least 5.1; then
      autoload -Uz bracketed-paste-magic
      zle -N bracketed-paste bracketed-paste-magic
    fi
  fi
  autoload -Uz url-quote-magic
  zle -N self-insert url-quote-magic
fi

autoload -Uz compinit
_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#_comp_files )); then
  compinit -i -C
else
  compinit -i
fi
unset _comp_files

zstyle ":completion::complete:*" use-cache 1
zstyle ":completion::complete:*" cache-path "$HOME/.cache/zsh"

setopt braceccl
setopt interactive_comments
setopt nohup
setopt nobeep
setopt numericglobsort
setopt nocaseglob
setopt nocheckjobs
setopt multios              
setopt extendedglob        
setopt COMBINING_CHARS

unsetopt clobber            
unsetopt EXTENDED_HISTORY
unsetopt BG_NICE
