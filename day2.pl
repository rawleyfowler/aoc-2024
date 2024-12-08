#!/usr/bin/env perl

use strict;
use warnings;

sub is_safe {
    my (@data) = @_;

    my $i;
    for ( 1 .. $#data ) {
        my ( $p, $c ) = @data[ $_ - 1 .. $_ ];
        my $s = $p - $c;
        if ( $p == $c || abs( $c - $p ) > 3 ) {
            return 0;
        }

        if ( defined $i ) {
            if ( $i == 1 && $s < 0 ) {
                return 0;
            }
            elsif ( $i == 0 && $s > 0 ) {
                return 0;
            }
        }

        $i = $s < 0 ? 0 : 1;
    }

    return 1;
}

sub is_dampenable {
    for ( 0 .. $#_ ) {
        my @a = (@_);
        splice( @a, $_, 1 );
        if ( is_safe(@a) ) {
            return 1;
        }
    }

    return 0;
}

my ( $p1, $p2 ) = ( 0, 0 );
while (<STDIN>) {
    chomp;
    my @data = split ' ';
    $p1++ if ( is_safe(@data) );
    $p2++ if ( is_dampenable(@data) );
}

CORE::say( 'Part 1: ', $p1 );
CORE::say 'Part 2: ', $p2;

__DATA__
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
