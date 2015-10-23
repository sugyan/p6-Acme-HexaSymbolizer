use v6;

unit class Acme::HexaSymbolizer;

has Str %!dict;

submethod BUILD() {
    my %hash = (
        '"' => <0 : (>,
        '&' => <( 4 :>,
        '.' => <: ~ ^ 4>,
        '1' => <( 0 )>,
        '2' => <: ~ ^ (>,
        '3' => <) : ^ ~>,
        '5' => <4 ) (>,
        '6' => <0 4 ~ ( : ^>,
        '7' => <) ~ 4 : 0 ^>,
        '8' => <^ ( ~ 0>,
        '9' => <^ ) ~ 0>,
        'A' => <: ( ) 4 ~ 0>,
        'B' => <^ 4 (>,
        'C' => <^ ) 4>,
        'D' => <: ~>,
        'E' => <) ( ~ :>,
        'F' => <0 ( ^>,
        'L' => <: ( ^>,
        'V' => <~ (>,
        '\\' => <( : ~ 0>,
        'x' => <4 : ( ^>,
    );
    %!dict = (
        '0' => "(~(^(''~~'')))",
        '4' => self!four,
    );
    for %hash.kv -> $k, $v {
        %!dict.push: $k => $v.pick(*).map({ %!dict{$_} // "'$_'" }).join('~^');
    }
}

method symbolize(Str $code) {
    if !self.defined {
        return self.bless.symbolize($code);
    }
    my $encoded = $code.comb.map({ '\x'~.ord.base(16) }).join;
    my $main = self!encode(qq{"$encoded".EVAL});
    return "::({self!encode('&EVAL')})($main)"
}

method !encode(Str $str) {
    return $str.comb.map({ %!dict{$_} }).join('~');
}

method !four() {
    my %hash = (
        '0' => "~(^(''~~''))",
        '1' => "')'~^~(^(''~~''))~^'('",
        '2' => "'^'~^':'~^'~'~^'('",
        'N' => "'~'~^~(^(''~~''))",
        'u' => "':'~^~(^(''~~''))~^'~'~^'('~^')'",
        'm' => "')'~^':'~^'~'",
        '*' => "'^'~^~(^(''~~''))~^':'~^'~'",
    );
    my $num = 'Num'.comb.map({ %hash{$_} }).join('~');
    my $four = '1*2**2'.comb.map({ %hash{$_} }).join('~');
    return "(~::({$num})({$four}))";
}
