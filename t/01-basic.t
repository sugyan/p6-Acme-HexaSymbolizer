use v6;

use Test;
use Acme::HexaSymbolizer;

subtest {
    my $result = Acme::HexaSymbolizer.symbolize("42");

    is-deeply $result.comb.unique.sort, <' ( ) : ^ ~>;
    is $result.EVAL, 42;
};

subtest {
    my $result = Acme::HexaSymbolizer.symbolize(q:to/CODE/);
    my %foo = bar => "baz";
    my @arr = 2, 4, 6;
    my $str = "%foo, { @arr.join('-') }"
    CODE

    is-deeply $result.comb.unique.sort, <' ( ) : ^ ~>;
    is $result.EVAL, '%foo, 2-4-6';
};

done-testing;
