#!/usr/bin/env perl

use strict;
use warnings;
use List::Util qw(reduce zip all);

my ( @a, @b );
my $i = 0;
while (<>) {
    ( $a[$i], $b[$i] ) = split '   ';
    $i++;
}
my @m = zip [ sort @a ], [ sort @b ];
my $d = reduce { $a + abs( $b->[0] - $b->[1] ) } 0, @m;
CORE::say 'Part 1: ', $d;

my $td;
for my $c (@a) {
    $td += $c * scalar( grep { $c == $_ } @b );
}
CORE::say 'Part 2: ', $td;
