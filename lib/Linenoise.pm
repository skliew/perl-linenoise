package Linenoise;

use 5.018002;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Linenoise ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Linenoise', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

Linenoise - Perl bindings to antirez's linenoise library

=head1 SYNOPSIS

  use Linenoise;

  my $line = Linenoise::prompt('prompt> ');
  Linenoise::history_add($line);
  Linenoise::history_save('history.txt');

  Linenoise::set_multiline(1);
  Linenoise::print_keycodes();
  Linenoise::set_completion_callback(\&completion2);
  Linenoise::history_set_maxlen(11);

=head1 DESCRIPTION

This library provides Perl bindings to the linenoise library.

It embeds a copy of antirez's linenoise library (linenoise.c & linenoise.h).

=head1 SEE ALSO

Please refer to antirez's linenoise library for more info:

https://github.com/antirez/linenoise

=head1 AUTHOR

darkgrin E<lt>darkgrin@yahoo.comE<gt>

=head1 COPYRIGHT AND LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.18.2 or,
at your option, any later version of Perl 5 you may have available.


=cut
