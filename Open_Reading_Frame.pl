#Rohit Setlem
#Finding Open Reading Frames
#hash map for all the amino acids
          my %genetic_code = (

"TCA" => "S",    # Serine
"TCC" => "S",    # Serine
"TCG" => "S",    # Serine
"TCT" => "S",    # Serine
"TTC" => "F",    # Phenylalanine
"TTT" => "F",    # Phenylalanine
"TTA" => "L",    # Leucine
"TTG" => "L",    # Leucine
"TAC" => "Y",    # Tyrosine
"TAT" => "Y",    # Tyrosine
"TAA" => "_",    # Stop
"TAG" => "_",    # Stop
"TGC" => "C",    # Cysteine
"TGT" => "C",    # Cysteine
"TGA" => "_",    # Stop
"TGG" => "W",    # Tryptophan
"CTA" => "L",    # Leucine
"CTC" => "L",    # Leucine
"CTG" => "L",    # Leucine
"CTT" => "L",    # Leucine
"CCA" => "P",    # Proline
"CCC" => "P",    # Proline
"CCG" => "P",    # Proline
"CCT" => "P",    # Proline
"CAC" => "H",    # Histidine
"CAT" => "H",    # Histidine
"CAA" => "Q",    # Glutamine
"CAG" => "Q",    # Glutamine
"CGA" => "R",    # Arginine
"CGC" => "R",    # Arginine
"CGG" => "R",    # Arginine
"CGT" => "R",    # Arginine
"ATA" => "I",    # Isoleucine
"ATC" => "I",    # Isoleucine
"ATT" => "I",    # Isoleucine
"ATG" => "M",    # Methionine
"ACA" => "T",    # Threonine
"ACC" => "T",    # Threonine
"ACG" => "T",    # Threonine
"ACT" => "T",    # Threonine
"AAC" => "N",    # Asparagine
"AAT" => "N",    # Asparagine
"AAA" => "K",    # Lysine
"AAG" => "K",    # Lysine
"AGC" => "S",    # Serine
"AGT" => "S",    # Serine
"AGA" => "R",    # Arginine
"AGG" => "R",    # Arginine
"GTA" => "V",    # Valine
"GTC" => "V",    # Valine
"GTG" => "V",    # Valine
"GTT" => "V",    # Valine
"GCA" => "A",    # Alanine
"GCC" => "A",    # Alanine
"GCG" => "A",    # Alanine
"GCT" => "A",    # Alanine
"GAC" => "D",    # Aspartic Acid
"GAT" => "D",    # Aspartic Acid
"GAA" => "E",    # Glutamic Acid
"GAG" => "E",    # Glutamic Acid
"GGA" => "G",    # Glycine
"GGC" => "G",    # Glycine
"GGG" => "G",    # Glycine
"GGT" => "G",    # Glycine
);
#loading the file name 
print ("Please Type the input filename:\n");
my $data = <STDIN>;
#Open the file
open (my $fh, $data) or die("could not open the file");
#creating output files
open (OUT1,">","Open_Reading_Frame.txt");
open (OUT,">","Peptide_Sequence.txt");

@data=<$fh>;
$len=@data;
print "total no of lines processed: $len\n";
$z=0;
for($i=0;$i <= $len; $i++)
{
    $seq = $data[$i];
    chomp($seq);
    #Using regex to check for a sequence and validating the sequence
    if ($seq =~ /^[ATGC]+$/){
        #print OUT1  "$seq\n";
        #extracts the sequence
        $tot_seq.=$seq;
    }
}

my @arr = split //, $tot_seq;
$flag = 0;
#Searching every three characters,finding start and end codon (open reading frames)
for ($x=0; $x <=2; $x++)
{
    for($i=$x; $i<@arr; $i=$i+3)
    {
        
        $codon=$arr[$i].$arr[$i+1].$arr[$i+2];
        
        if($codon eq "ATG" && $rem==0)
        {
            $frame++;
            
            $rem = 1;
        }
        if($rem == 1)
        {
            $str = $str.$arr[$i].$arr[$i+1].$arr[$i+2];
            #print "$arr[$i]$arr[$i+1]$arr[$i+2]:\n";
            $flag++;
        }
        if( ($codon eq "TAA" || $codon eq "TAG"|| $codon eq "TGA") && $rem==1)
        {
            if ($flag > 26)
            {
                #Writing Open reading frames to ouput file
                print OUT1 "\nReading frame $frame\n";
                print OUT1 $str;
                #finding amino acids sequence using the hash map created above
                
                my @arr = split /(?=(?:.{3})+\z)/s, $str;
                $count++;
                print OUT "Peptide sequence: ";
                foreach my $a (@arr)
                {
                    print OUT "$genetic_code{$a}";
                }
                print OUT "\n";
                
                $str = "";
                $flag = 0;
                $seq_str = $str;
            }
            $rem = 0;
            #print OUT "\n";
            # $count++;
        }
        


    }
    my @arr1 = ($seq_str =~ m/.../g);
    print "@arr1";
}

#printing the total open reading frames
print "total open reading frames = $count\n";
