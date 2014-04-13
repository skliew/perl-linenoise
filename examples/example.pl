#!/usr/bin/env perl 
use strict;
use warnings;

use Linenoise;

sub completion {
    my ($string) = @_;
    if ($string =~ /^h/) {
        Linenoise::add_completion("hello");
        Linenoise::add_completion("hello there");
    }
}

# Linenoise::set_multiline(1);
# Linenoise::print_keycodes();
Linenoise::set_completion_callback(\&completion);
Linenoise::history_set_maxlen(11);

while (1) {
    my $line = Linenoise::prompt('prompt> ');
    last if !defined($line);
    print "echo: $line\n";
    Linenoise::history_add($line);
    Linenoise::history_save('history.txt');
}

