#!usr/bin/perl
my($in)=@ARGV;
my $per = $in."_per";
my $out = $in."_out";
#my $only = $in."_snponly"

open SNP,"<$in" or die ($!);
open PER,">$per" or die ($!);
#open ONLY,">$only" or die ($!);
open OUT,">$out" or die ($!);

@snp=<SNP>;
chomp(@snp);
my $spe = shift(@snp);
my @ids = split(/\t/,$spe);
@ids = grep(/^[BCGHIW]/, @ids);
my $len = @ids;

print OUT "##fileformat=VCFv4.2\n#CHROM"."\t"."POS"."\t"."ID"."\t"."REF"."\t"."ALT"."\t"."QUAL"."\t"."FILTER"."\t"."INFO"."\t"."FORMAT";
for (@ids){print OUT "\t".$_;}
print OUT "\n";

for (@snp){
  my @var = split(/\t/,$_);
  my $pid = shift(@var);
  my $idnum = substr($pid,0,2);#$pid,2,2 for starting with "rs"
  $idnum =~ s/^0//;
  my $chr = "Chr".$idnum;
  my $pos = substr($pid,2);
  $pos =~ s/^0*//;
  my %gcount;
  my ($tmp, $ct) = ("@var", 0);
  $gcount{$_}++ for @var;
  my @keyrow = sort {$gcount{$b} <=> $gcount{$a}} keys %gcount;
  #my @keyrow = grep (!/^DEL$|^N$/,@keyrow);
  #if ($keyrow[0]){my $refgt = $keyrow[0];}
  #if ($keyrow[1]){my $altgt = $keyrow[1];}
  my $refgt = $keyrow[0];
  my $altgt = $keyrow[1];
  if (!$keyrow[1]){my $altgt = "non";}
  my ($qual,$filter,$info,$format) = (".","PASS",".","GT");
  my @gt="";
  for (my $i = 0;$i < $len;$i++ ){
  if ($var[$i] eq $refgt){$gt[$i]="0|0";}
  elsif ($var[$i] eq $altgt){$gt[$i]="1|1";}
  else {$gt[$i]=".|.";}
  }
  print OUT $chr."\t".$pos."\t".$pid."\t".$refgt."\t".$altgt."\t".$qual."\t".$filter."\t".$info."\t".$format;
  for (@gt){print OUT "\t".$_;}
  print OUT "\n";
  my $refp = sprintf "%.2f",(100*$gcount{$refgt}/$len);
  my $altp = sprintf "%.2f",(100*$gcount{$altgt}/$len);
  my $np = sprintf "%.2f",(100*$gcount{"N"}/$len);
  my $delp = sprintf "%.2f",(100*$gcount{"DEL"}/$len);
  print PER $pid."\t".$refp."\t".$altp."\t".$delp."\t".$np."\n";
}
close OUT;
close PER;
close SNP;
