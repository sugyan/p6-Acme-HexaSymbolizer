[![Build Status](https://travis-ci.org/sugyan/p6-Acme-HexaSymbolizer.svg?branch=master)](https://travis-ci.org/sugyan/p6-Acme-HexaSymbolizer)

NAME
====

Acme::HexaSymbolizer - Esoteric program generator

SYNOPSIS
========

    use Acme::HexaSymbolizer;

    my $code = q{say 'Hello, world!'};
    print Acme::HexaSymbolizer.symbolize($code);

DESCRIPTION
===========

Acme::HexaSymbolizer translates perl6 code to equivalent code which uses 6 kind symbols only.

    $ cat eg/hello.pl6
    ::((~::('~'~^~(^(''~~''))~':'~^~(^(''~~''))~^'~'~^'('~^')'~')'~^':'~^'~')(')'~^~(^(''~~''))~^'('~'^' ...
    $ perl6 eg/hello.pl6
    Hello, world!

AUTHOR
======

sugyan <sugi1982@gmail.com>
