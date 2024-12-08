#!/usr/bin/env perl

use 5.036;
use DDP;

my %l = (
    'X' => 'M',
    'M' => 'A',
    'A' => 'S'
);
my @as = (
    [ 0, 1 ], [  1,  0 ], [  0, -1 ], [ -1, 0 ],
    [ 1, 1 ], [ -1, -1 ], [ -1,  1 ], [  1, -1 ]
);
my @ks = ( [ 1, 1 ], [ -1, -1 ], [ -1, 1 ], [ 1, -1 ] );

my @a;
my @xs;
my @ak;
while (<STDIN>) {
    chomp;
    push @a, [ split '' ];
}

for my $y ( 0 .. $#a ) {
    my @t = $a[$y]->@*;
    for my $x ( 0 .. $#t ) {
        push( @xs, [ $x, $y, 'X' ] )
          if ( $t[$x] eq 'X' );
        push( @ak, [ $x, $y, 'A' ] )
          if ( $t[$x] eq 'A' );
    }
}

my $mx = scalar $a[0]->@*;
my $my = $#a;

my $c     = 0;
my @stack = (@xs);
my %seen;
while ( my $k = shift @stack ) {
    if ( $k->[2] eq 'S' ) {
        $c++;
        next;
    }

    my $t = $l{ $k->[2] };
    if ( $k->[2] eq 'X' ) {
        for (@as) {
            my ( $x, $y ) = ( $k->[0] + $_->[0], $k->[1] + $_->[1] );
            next if $x < 0 || $x > $mx;
            next if $y < 0 || $y > $my;
            if ( my $i = $a[$y]->[$x] ) {
                if ( $i eq $t ) {
                    $seen{$x}->{$y} = 1;
                    push @stack, [ $x, $y, $t, $_ ];
                }
            }
        }
    }
    else {
        my ( $x, $y ) = ( $k->[0] + $k->[3]->[0], $k->[1] + $k->[3]->[1] );
        next if $x < 0 || $x > $mx;
        next if $y < 0 || $y > $my;
        if ( my $i = $a[$y]->[$x] ) {
            if ( $i eq $t ) {
                $seen{$x}->{$y} = 1;
                push @stack, [ $x, $y, $t, $k->[3] ];
            }
        }
    }
}

CORE::say 'Part 1: ', $c;

my $acc = 0;
for my $k (@ak) {
    my @ms;
    for (@ks) {
        my ( $x, $y ) = ( $k->[0] + $_->[0], $k->[1] + $_->[1] );
        next if $x < 0 || $x > $mx;
        next if $y < 0 || $y > $my;

        push @ms, [ $x, $y, $_ ]
          if ( $a[$y]->[$x] && $a[$y]->[$x] eq 'M' );
    }

    next if scalar @ms != 2;

    my $mas = 0;
    my @ss;
    for (@ms) {
        my ( $x, $y ) =
          ( $k->[0] + ( $_->[2]->[0] * -1 ), $k->[1] + ( $_->[2]->[1] * -1 ) );
        next if $x < 0 || $x > $mx;
        next if $y < 0 || $y > $my;

        if ( $a[$y]->[$x] && $a[$y]->[$x] eq 'S' ) {
            push @ss, [ $x, $y ];
            $mas++;
        }
    }

    if ( $mas == 2 ) {
        $acc++;
    }
}

CORE::say 'Part 2: ', $acc;

__DATA__
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
