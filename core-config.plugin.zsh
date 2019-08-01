DEPENDENCES_ZSH+=( zpm-zsh/helpers zpm-zsh/colors )

if command -v zpm >/dev/null; then
  zpm zpm-zsh/helpers zpm-zsh/colors
fi

source ${${(%):-%x}:a:h}/vars.zsh
source ${${(%):-%x}:a:h}/completions.zsh
source ${${(%):-%x}:a:h}/correct.zsh
source ${${(%):-%x}:a:h}/history.zsh
source ${${(%):-%x}:a:h}/keyboard.zsh
source ${${(%):-%x}:a:h}/modules.zsh
source ${${(%):-%x}:a:h}/cd.zsh
source ${${(%):-%x}:a:h}/path-fix.zsh
source ${${(%):-%x}:a:h}/users.zsh

