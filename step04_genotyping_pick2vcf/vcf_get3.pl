#!usr/bin/perl
my($vcfo,$col,$out)=@ARGV;

open DATA,"<$vcfo" or die ($!);
open LIST,"<$col" or die ($!);
open OUT,">$out" or die ($!);

my %vcf;
my %rrr;
my %vvv;
my %mid;
while(<DATA>){
chomp;
next if (length((split(/\t/,$_,10))[3])>1 or length((split(/\t/,$_,10))[4]>1));
#if ($_ =~ /^#/){print OUT $_."\n";}
my $rs = (split(/\t/,$_,10))[1];
$vcf{$rs} = (split(/\t/,$_,10))[9];
$rrr{$rs} = (split(/,/,(split(/\t/,$_,10))[3]))[0];
$vvv{$rs} = (split(/,/,(split(/\t/,$_,10))[4]))[0];
$mid{$rs} = (split(/\t/,$_,10))[5]."\t".(split(/\t/,$_,10))[6]."\t".(split(/\t/,$_,10))[7]."\t"."GT";
}

while(<LIST>){
chomp;
next if ($_ =~ /^#/);
@ele = split(/\t/,$_);
next if (length($ele[3])>1 or length($ele[4])>1);
next if (!exists $vcf{$ele[1]});
@gt = split(/\t/,$vcf{$ele[1]});
print OUT $_."\t".$mid{$ele[1]};

#if ($ele[3] eq $rrr{$ele[1]} && $ele[4] eq $vvv{$ele[1]}||"."){
if ($ele[3] eq $rrr{$ele[1]}){
for $tt(@gt){
if ($tt =~ /^0\/0:/){print OUT "\t"."0|0";}
elsif ($tt =~ /^1\/1:/){print OUT "\t"."1|1";}
else {print OUT "\t".".|.";}
}
}
#elsif ($ele[3] eq $vvv{$ele[1]} && $ele[4] eq $rrr{$ele[1]}||"."){
elsif ($ele[3] eq $vvv{$ele[1]}){
for $tt(@gt){
if ($tt =~ /^0\/0:/){print OUT "\t"."1|1";}
elsif ($tt =~ /^1\/1:/){print OUT "\t"."0|0";}
else {print OUT "\t".".|.";}
}
}

else {
for $tt(@gt){
print OUT "\t".".|.";
}
}

print OUT "\n";
}

close OUT;
close LIST;
close DATA;
