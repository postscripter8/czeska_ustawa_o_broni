#!/usr/bin/perl
use strict;
use warnings;

my @lines = ();
my $line;
my $number = "1";
my $OUTFILE;


while(<>) {
  my @matches= ($_ =~ /^### .*Section ([^<]+)/);
  if (@matches) {
    open (OUTFILE, "> sekcja_${number}_EN.md");
    print OUTFILE @lines;
    close(OUTFILE);
    $number = $1;
    @lines = ($_);
  } else {
    push @lines, $_;
  }
}

open (OUTFILE, "> sekcja_${number}_EN.md");
print OUTFILE @lines;
close(OUTFILE);
