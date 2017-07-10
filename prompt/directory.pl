#!/usr/bin/env perl
# Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

use strict;
use warnings;

# We set the variables
my $max_size = shift @ARGV or die("Usage: $0 max_size");
my $home = $ENV{HOME};
my $color_begin = `tput setaf 4`;
my $color_end = `tput sgr0; tput bold`;

# We take the current directory 
open(PWD, "-|", "pwd") or die("Error: can't execute pwd\n");
my $prompt = <PWD>;
chomp $prompt;
$prompt =~ s/$home/~/;

# We try to respect the max_size for the pwd
while((length $prompt) > $max_size && $prompt =~ /[^\/][^\/]+\//) {
  $prompt =~ s/([^\/])[^\/]+/$1/;
}

# We print the prompt
$prompt =~ s/([^\/]+)/%{$color_begin%}$1%{$color_end%}/g;
print($prompt);
