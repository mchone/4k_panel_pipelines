#!usr/bin/perl
my($in1,$in2,$out)=@ARGV;
open FK,"<$in1" or die ($!);
open HM,"<$in2" or die ($!);
open OUT,">$out" or die ($!);

my %fk;
my %hm;
while(<HM>){
chomp;
next if ($_ =~ /^#/);
my $rs = (split(/\t/,$_,6))[2];
$hm{$rs} = (split(/\t/,$_,10))[9];
}

while(<FK>){
chomp;
next if ($_ =~ /^#/);
next if (!exists $hm{(split(/\t/,$_,6))[2]});
my $chr = (split(/\t/,$_,6))[0];
my $rid = (split(/\t/,$_,6))[2];
my $pos = (split(/\t/,$_,6))[1];
my $ref = (split(/\t/,$_,6))[3];
my $alt = (split(/\t/,$_,6))[4];
print OUT $chr."\t".$rid."\t"."0"."\t".$pos;
@fkgt = split(/\t/,(split(/\t/,$_,10))[9]);
for $fke(@fkgt){
if ($fke =~ /^0|0/) {print OUT "\t".$ref." ".$ref;}
elsif ($fke =~ /^1|1/) {print OUT "\t".$alt." ".$alt;}
else {print OUT "\t"."0 0";}
}
@gt = split(/\t/,$hm{$rid});
for $ele(@gt){
if ($ele =~ /^0|0/) {print OUT "\t".$ref." ".$ref;}
elsif ($ele =~ /^1|1/) {print OUT "\t".$alt." ".$alt;}
else {print OUT "\t"."0 0";}
}
print OUT "\n";
}

close OUT;
close FK;
close HM;
