#!/usr/bin/env zsh

# Standarized $0 handling, following:
# https://github.com/zdharma/Zsh-100-Commits-Club/blob/master/Zsh-Plugin-Standard.adoc
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
_DIRNAME="${0:h}"

DEPENDENCES_ZSH+=( zpm-zsh/helpers zpm-zsh/colors )

if (( $+functions[zpm] )) >/dev/null; then
  zpm zpm-zsh/helpers zpm-zsh/colors
fi

source "${_DIRNAME}/vars.zsh"
source "${_DIRNAME}/completions.zsh"
source "${_DIRNAME}/correct.zsh"
source "${_DIRNAME}/keyboard.zsh"
source "${_DIRNAME}/modules.zsh"
source "${_DIRNAME}/cd.zsh"
source "${_DIRNAME}/path-fix.zsh"
source "${_DIRNAME}/users.zsh"
