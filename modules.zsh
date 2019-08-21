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

setopt braceccl
setopt interactive_comments
setopt nohup
setopt nobeep
setopt numericglobsort
setopt nocaseglob
setopt nocheckjobs
setopt multios              # Write to multiple descriptors.
setopt extendedglob         # Use extended globbing syntax.
unsetopt clobber            # Do not overwrite existing files with > and >>.
unsetopt EXTENDED_HISTORY
setopt COMBINING_CHARS      # Use >! and >>! to bypass.

