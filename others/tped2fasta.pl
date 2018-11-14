#!usr/bin/perl
my($in1,$in2,$out)=@ARGV;
open TP,"<$in1" or die ($!);
open LIST,"<$in2" or die ($!);
open OUT,">$out" or die ($!);

my @list=<LIST>;
my @data=<TP>;
chomp(@data,@list);

for(my $a=0;$a<602;$a++){
print OUT ">".$list[$a]."\n";
$b = 4;
for $pp(@data){
my @ele = split(/\t/,$pp);
print OUT $ele[$b];
$b++;
}
print OUT "\n";
}

close OUT;
close TP;
close LIST;
