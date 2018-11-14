#!usr/bin/perl
my($para)=@ARGV;
my $in = $para."_out";
my $list = $para.".list";
my $out = $para."_snp.vcf";

open DATA,"<$in" or die ($!);
open LIST,"<$list" or die ($!);
open OUT,">$out" or die ($!);


my %vcf;
while(<DATA>){
chomp;
if ($_ =~ /^#/){print OUT $_."\n";}
my $rs = (split(/\t/,$_,5))[2];
$vcf{$rs} = $_;
}

while(<LIST>){
chomp;
print OUT $vcf{$_}."\n";
}

close OUT;
close LIST;
close DATA;
