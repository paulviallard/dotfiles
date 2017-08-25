#!/usr/bin/env zsh
# Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

function print_prompt() {
  # We set the normal prompt
  PROMPT="%{$(tput bold)%}(%{$(tput setaf 4)%}$(whoami)%{$(tput sgr0; tput bold)%}@%{$(tput setaf 4)%}$(hostname -s)%{$(tput sgr0; tput bold)%})";

  # We get the git prompt (the right prompt)
  git="$(~/.shell/prompt/prompt_git.pl)";
  if [[ "$git" != "" ]]; then
    RPROMPT="($git)";
  else
    RPROMPT="";
  fi 

  # We modify the prompt in order to respect the size defined 
  size=$(($(tput cols)/2-${#p}));
  PROMPT="$PROMPT $(~/.shell/prompt/directory.pl $size)>%{$(tput sgr0)%} ";

}

precmd() { eval print_prompt }
