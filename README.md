NAME
====

Acme::HexaSymbolizer - translate to equivalent code which uses 6 kind symbols.

SYNOPSIS
========

    use Acme::HexaSymbolizer;

    my $code = q{say 'Hello, world!'};
    say Acme::HexaSymbolizer.symbolize($code);

DESCRIPTION
===========

    $ cat eg/hello.pl6
    ::((~::('~'~^~(^(''~~''))~':'~^~(^(''~~''))~^'~'~^'('~^')'~')'~^':'~^'~')(')'~^~(^(''~~''))~^'('~'^' ...
    $ perl6 eg/hello.pl6
    Hello, world!

AUTHOR
======

sugyan <sugi1982@gmail.com>
