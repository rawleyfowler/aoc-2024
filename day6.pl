#!/usr/bin/env perl

use 5.036;
use Carp;
use DDP;

use constant {
    LEFT  => [ -1, 0 ],
    RIGHT => [  1, 0 ],
    DOWN  => [  0, 1 ],
    UP    => [  0, -1 ]
};

sub next_dir {
    my ($dir) = @_;

    if ( $dir eq LEFT ) {
        return UP;
    }
    elsif ( $dir eq RIGHT ) {
        return DOWN;
    }
    elsif ( $dir eq UP ) {
        return RIGHT;
    }
    elsif ( $dir eq DOWN ) {
        return LEFT;
    }

    Carp::croak 'GOT BAD DIRECTION';
}

sub guard_gone {
    my ( $guard, $map ) = @_;
    my $width  = $#{ $map->[0] };
    my $height = $#{$map};
    if ( $guard->[0] == 0 || $guard->[0] == $width ) {
        return 1;
    }
    elsif ( $guard->[1] == 0 || $guard->[1] == $height ) {
        return 1;
    }

    return 0;
}

my @map;
while (<>) {
    chomp;
    push @map, [ split '' ];
}

my $guard;
my $start;
for my $y ( 0 .. $#map ) {
    my @row = @{ $map[$y] };
    for my $x ( 0 .. $#row ) {
        if ( $row[$x] eq '^' ) {
            $guard = [ $x, $y, UP ];
            $start = [ $x, $y, UP ];
            last;
        }
    }

    last if $guard;
}

sub test_guard {
    my ( $guard, $map, $lookup ) = @_;
    my %visited;
    my $step_cnt = 0;

    while ( !guard_gone( $guard, $map ) ) {
        $visited{ $guard->[0] . ':' . $guard->[1] } = 1;

        my $dir = $guard->[2];
        my ( $dx, $dy ) = ( $guard->[0] + $dir->[0], $guard->[1] + $dir->[1] );

        if ( $map->[$dy]->[$dx] eq '#' ) {
            $guard->[2] = next_dir( $guard->[2] );
        }
        elsif ( $map->[$dy]->[$dx] eq 'O' ) {
            if ( defined $guard->[3] ) {
                $guard->[4] = 1;
                last;
            }
            else {
                $guard->[3] = 1;
            }

            $guard->[2] = next_dir( $guard->[2] );
        }
        else {
            $guard->[0] = $dx;
            $guard->[1] = $dy;
            $step_cnt++;
        }
    }

    return \%visited;
}

my $p1r = test_guard( $guard, \@map );

CORE::say 'Part 1: ', scalar( keys %$p1r ) + 1;

$p1r->{ $guard->[0] . ':' . $guard->[1] } = 1;
my $p2s = 0;
for ( keys %$p1r ) {
    my ( $x, $y ) = split ':';
    next if ( $map[$y]->[$x] ne '.' );

    my $no = 0;
    for ( ( LEFT, UP, RIGHT, DOWN ) ) {
        my ( $dx, $dy ) = ( $x + $_->[0], $y + $_->[1] );
        while ( $map[$dy]->[$dx] ne '#' && !guard_gone( [ $dx, $dy ], \@map ) )
        {
            ( $dx, $dy ) = ( $x + $_->[0], $y + $_->[1] );
        }
        $no++ if ( guard_gone( [ $dx, $dy, \@map ] ) );
    }

    next if $no == 4;

    $map[$y]->[$x] = 'O';
    $guard = [@$start];
    test_guard( $guard, \@map );
    if ( defined $guard->[4] ) {
        $p2s++;
    }
    $map[$y]->[$x] = '.';
}

CORE::say 'Part 2: ', $p2s;

__DATA__
....#.....
.........#
..........
..#.......
.......#..
..........
.#..^.....
........#.
#.........
......#...
