#!/usr/bin/env zsh
# Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

# We will use the ssh agent to connect to remote servers
# If there is an error in ssh-add or if there is no pid for the ssh agent
if [ "$(ssh-add -l 2>&1 1>/dev/null)" != "" ] || [ "$SSH_AGENT_PID" = "" ]; then
  if [ -f "$SSHENV" ]; then
    # We source the (old) ssh environment
    source $SSHENV 1>/dev/null
  fi
  # If we fail, the ssh-agent is not launched
  if [ "$(ssh-add -l 2>&1 1>/dev/null)" != "" ] || [ "$SSH_AGENT_PID" = "" ]; then
    # So, we launch it
    ssh-agent > $SSHENV
    chmod u+x $SSHENV
    source $SSHENV 1>/dev/null
    ssh-add
  fi
fi
