#!/usr/bin/env perl

use 5.036;
use DDP;
use List::MoreUtils qw(natatime);

my $p1sum;
my $p2sum;
my $f = 1;
while (<STDIN>) {
    chomp;
    my @p1vals = /mul\((\d+),(\d+)\)/gmi;
    my $it     = natatime( 2, @p1vals );
    while ( my ( $x, $y ) = $it->() ) {
        $p1sum += $x * $y;
    }

    my @vals = /mul\(\d+,\d+\)|do\(\)|don't\(\)/gmi;
    p @vals;

    for (@vals) {
        if ( $_ eq 'do()' ) {
            $f = 1;
        }
        elsif ( $_ eq "don't()" ) {
            $f = 0;
        }
        else {
            if ($f) {
                my ( $x, $y ) = /(\d+),(\d+)/mi;
                CORE::say 'adding: ', $x, ' ', $y;
                $p2sum += $x * $y;
            }
        }
    }
}

CORE::say 'Part 1: ', $p1sum;
CORE::say 'Part 2: ', $p2sum;

__DATA__
mul(1,1)do()mul(1,2)don't()mul(1,4)
