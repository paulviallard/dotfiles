#!/usr/bin/env zsh
# Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

export EDITOR="vim"

PATH=.:~/.shell/scripts/

# LOCAL #
PATH=$PATH:/usr/local/opt/php56/bin:/usr/local/opt/gcc/bin/:/usr/local/opt/coreutils/libexec/gnubin
PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-darwin:/Applications/SageMath-7.3.app:/Applications/Utilities/XQuartz.app/Contents/MacOS:/Applications/Dia.app/Contents/Resources/bin:/usr/local/Cellar/vim/8.0.0604/bin:/Applications/MacVim.app/Contents/bin
# LOCAL #

PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH

# LOCAL #
export MANPATH=/usr/local/opt/coreutils/libexec/gnuman/man1:$MANPATH
export PERL5LIB=$PERL5LIB:/Users/paulviallard/perl5/lib/perl5
export CLASSPATH=".:/usr/local/Cellar/antlr/4.6/antlr-4.6-complete.jar:$CLASSPATH"
export TF_CPP_MIN_LOG_LEVEL=2
# LOCAL #
