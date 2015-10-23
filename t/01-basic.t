use v6;

use Test;
use Acme::HexaSymbolizer;

my $result = Acme::HexaSymbolizer.symbolize("42");

is-deeply $result.comb.unique.sort, <' ( ) : ^ ~>;
is $result.EVAL, 42;

done-testing;
