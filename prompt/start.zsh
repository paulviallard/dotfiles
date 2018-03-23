#!/usr/bin/env zsh
# Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

# We launch tmux if the program exists and if it's not already launched
if [ "$TMUX" = "" ] && [ "$(command -v tmux)" != "" ]; then exec tmux; fi

# We insert the plugins for zsh
source ~/.shell/prompt/highlighting/zsh-syntax-highlighting.zsh
source  ~/.shell/prompt/autosuggestions/zsh-autosuggestions.zsh

# We set the configuration
source ~/.shell/prompt/config.zsh

# We execute the configuration of the prompt 
source ~/.shell/prompt/prompt.zsh

# We execute the ssh agent
source ~/.shell/prompt/ssh.zsh
