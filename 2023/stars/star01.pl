#!/usr/bin/perl
use strict;
use warnings;
use constant TEXT_PATH => '../inputs/input01.txt';
use integer;

my @values;
my $left;
my $right;
my $sum = 0;
my $in;

if( -f TEXT_PATH){
  open($in, "<".TEXT_PATH) or die("open: $!");
}

foreach (<$in>) {
  if($_ =~ m/^\D*(\d)/) {
    $left = $1;
  }
  else {
    warn("\n\"${_}\" without number !\n");
  }
  if($_ =~ m/(\d)\D*$/) {
    $right = $1;
  }
  else {
    warn("\n\"${_}\" without number !\n");
  }
  push(@values, "${left}${right}");
}

close($in);

my $before_last = $#values - 1;
foreach (@values[0..${before_last}]) {
  $sum = $sum + $_;
  print("${_} + ");
}
$sum = $sum + $values[$#values];
print("$values[$#values]\n\n");
print("Sum : ${sum}\n");

