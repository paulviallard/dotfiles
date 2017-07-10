#!/usr/bin/env perl
# Copyright © 2017 Paul Viallard <paul.viallard@gmail.com>
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

use strict;
use warnings;

# Interpret the command git
open(GIT, "-|", "git status 2> /dev/null") or die("Error: can't execute git\n");

# Declaration of variables
my $prompt = "";
my $color_branch_begin = `tput setaf 4`;
my $color_branch_end = `tput sgr0; tput bold`;
my $color_status_begin = `tput setaf 5`;
my $color_status_end = $color_branch_end;
my $untrack_files = 0;
my $commit_files = 0;
my $line;

# We get the name of the branch
$line = <GIT>;
if(defined($line)) {
  if($line =~ /([^\s]*)$/) {
    $prompt .= $1;
  }
}

# We get the status of the branch (ahead/behind/diverged)
$line = <GIT>;
if(defined($line)) {
  if ($line =~ /ahead/) {
    $prompt .= "⇑";
  } elsif ($line =~ /behind/) {
    $prompt .= "⇓";
  } elsif ($line =~ /diverged/) {
    $prompt .= "⇕";
  }
}

# We get the status of files
while(<GIT>) {
  if($_ =~ /Untracked/) {
    $untrack_files = 1;
    last
  }
  if($_ =~ /[^:]*:[^:]*/) {
    $commit_files = 1;
  }
}
if($commit_files) {
  $prompt .= "+";
}
if($untrack_files) {
  $prompt .= "*";
}

# We color the prompt
$prompt =~ s/([^*+⇑⇓⇕]+)/%{$color_branch_begin%}$1%{$color_branch_end%}/g;
$prompt =~ s/([*+⇑⇓⇕]+)/%{$color_status_begin%}$1%{$color_status_end%}/g;

# And we print the final prompt
print($prompt);
