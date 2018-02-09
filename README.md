# Open-Reading-Frames
It is the part of reading frame that has the potential to be translated. An ORF is a continuous stretch of codons that contains a start codon (AUG) and stop codons (UAA,UAG or UGA)
# Pre-Req
Download Perl
https://www.perl.org/get.html
# Perl Script .pl file
The perl script provides two output files when FASTA file is taken as input.
1) Open reading frames:
A Regular expression is carried out to check the each line is a sequence line or not based on ATGC. Next, every three character is searched to find a start codon and stop codon. Only sequence more than 26 characters are considered to be open reading frame.
2) Peptide Sequence:
A hashmap is created for all amino acids and from the above open reading frames peptide sequence are annotated.
