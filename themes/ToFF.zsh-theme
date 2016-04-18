# PROMPT="[%*] %n:%c $(git_prompt_info)%(!.#.$) "

# Full path => ${(%):-%~}
# Only current folder %c

if [ "$(id -u)" = "0" ]; then
	PROMPT='[%*] `hostname` %{$fg[red]%}%n%{$reset_color%}:%{$fg[green]%}${(%):-%~}%{$reset_color%}$(git_prompt_info) %(!.#.$) '
else
	PROMPT='[%*] `hostname` %{$fg[cyan]%}%n%{$reset_color%}:%{$fg[green]%}${(%):-%~}%{$reset_color%}$(git_prompt_info) %(!.#.$) '
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}git:("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
