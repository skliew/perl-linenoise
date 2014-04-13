use strict;
use warnings;

use Test::More; 
BEGIN { use_ok('Linenoise') };

#########################

ok(!defined(Linenoise::set_multiline(1)));
ok(Linenoise::history_set_maxlen(10));
ok(Linenoise::history_add('W00t'));
ok(Linenoise::history_save('linenoise.history') == 0);
ok(Linenoise::history_load('linenoise.history') == 0);

# cleanup
unlink('linenoise.history');

# The following tests don't play well with our test harness, well well

# ok(!defined(Linenoise::clear_screen()));
# ok(!defined(Linenoise::print_keycodes()));
# ok(defined(Linenoise::prompt("Hello>")));

done_testing();
