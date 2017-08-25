#!/usr/bin/env zsh
# Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

# We set the shell history
export HISTSIZE=3000
export HISTFILE="$HOME/.zsh_history"

# We set the style of the autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=fg=15

# We set the ssh "environment"
export SSHENV="$HOME/.zsh_ssh"
