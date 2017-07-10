#!/usr/bin/env zsh
# Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

function _git() {
    if [[ $1 == "tree" ]]; then
	command git log --graph --oneline --all;
    else
	command git $*;
    fi
}
alias git="_git"

function _find() {
    command find $* 2>&1 | grep -v "Permission denied\|No such file or directory";
}
alias find="_find"

alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias la="ls --color=auto -la"

alias ocaml="ledit ocaml"

# LOCAL #
function _backup() {
  if [[ $1 == "mac" ]]; then
    command backup $HOME "" 10 paulviallard 192.168.1.23 /volume1/Backup/Mac;
  fi
}
alias backup="_backup"
# LOCAL #
