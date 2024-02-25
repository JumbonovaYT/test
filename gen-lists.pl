#!/usr/bin/perl
use warnings;
use strict;
use autodie;

my $start = pop @ARGV or die "Needs base (unused) number to start";

my $lc = $start*100*1000;
my $fh;
while(my $line=<>) {
  if ($lc % (100*1000) == 0) {
    mkdir "/6BT/AT/ytll-items/" . sprintf("%03d",$lc/100/1000);
    chdir "/6BT/AT/ytll-items/" . sprintf("%03d",$lc/100/1000);
  }
  if ($lc % 100 == 0) {
    open $fh, ">", sprintf("%03d", ($lc/100) %1000 );
  }
  print $fh $line;
  $lc++
}