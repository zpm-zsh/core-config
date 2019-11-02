#!/usr/bin/env zsh

setopt autocd               # Auto changes to a directory without typing cd.


alias tmp='cd $(mktemp -d)'
alias cdo='cd -'
alias -- -='cd -'

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
