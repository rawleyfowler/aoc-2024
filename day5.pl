#!/usr/bin/env perl

use 5.036;
use DDP;

my $f = 0;
my %m;
my @n;
while (<>) {
    chomp;
    if ( !$_ ) {
        $f = 1;
        next;
    }

    if ( !$f ) {
        my ( $l, $r ) = /(\d+)\|(\d+)/mi;
        if ( not defined $m{$l} ) {
            $m{$l} = {};
        }

        $m{$l}->{$r} = 1;
    }
    else {
        push @n, [ split ',' ];
    }
}

my @invalid;

sub proc {
    my ($arr) = @_;
    my %r;
    for (@$arr) {
        if ( defined $m{$_} ) {
            for ( keys $m{$_}->%* ) {
                if ( defined $r{$_} ) {
                    push @invalid, $arr;
                    return 0;
                }
            }
        }
        $r{$_} = 1;
    }
    return $arr->[ scalar @$arr / 2 ];
}

my $s = 0;
for my $arr (@n) {
    $s += proc($arr);
}

CORE::say 'Part 1: ', $s;

my $p2s = 0;
for my $arr (@invalid) {
    my @o = sort { exists $m{$b}->{$a} ? -1 : 1 } @$arr;
    $p2s += $o[ scalar @o / 2 ];
}

CORE::say 'Part 2: ', $p2s;

__DATA__
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
