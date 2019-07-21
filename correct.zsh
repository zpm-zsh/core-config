#!/usr/bin/env zsh

setopt correct
if [[ "$CLICOLOR" = 1 ]]; then
  SPROMPT='$c[cyan] Change "$c[red]%R$c[cyan]" to "$c[green]%r$c[cyan]"? ($c[green]Yes$c[cyan], $c[red]No$c[cyan], $c[red]Abort$c[cyan], $c[yellow]Edit$c[cyan]) $c[blue]> $c_reset'
else
  SPROMPT=' Change '%R' to '%r'? (Yes, No, Abort, Edit) > '
fi
