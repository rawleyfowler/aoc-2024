#!/usr/bin/env perl
@a=(<>);$i=0;($c[$i],$d[$i++])=split for (@a);say(reduce {$a+=abs($b->[0]-$b->[1])} 0, zip(\(sort@c),\(sort@d)));
