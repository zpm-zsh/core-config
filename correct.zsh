#!/usr/bin/env zsh

setopt correct
if [[ "$CLICOLOR" = 1 ]]; then
  SPROMPT='$c[cyan] Change "$c[red]%R$c[cyan]" '
  SPROMPT+='to "$c[green]%r$c[cyan]"? '
  SPROMPT+='($c[green]${c_underline}Y$c_reset$c[green]es$c[cyan], '
  SPROMPT+='$c[red]${c_underline}N${c_reset}${c[red]}o$c[cyan], '
  SPROMPT+='$c[red]${c_underline}A${c_reset}${c[red]}bort$c[cyan], '
  SPROMPT+='$c[yellow]${c_underline}E${c_reset}${c[yellow]}dit$c[cyan]) '
  SPROMPT+='$c[blue]> $c_reset'
else
  SPROMPT=' Change '%R' to '%r'? (Yes, No, Abort, Edit) > '
fi
