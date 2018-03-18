#! /bin/bash
#just to see that the bash is working:
echo "hello"
#cluster my NRPS custom db:
cdhit -i "/home/eddie/Barak/DIAMOND/fullnrpsDB.fasta" -c 0.95 -M 0 -o nrpsdb.fasta
#take my clustered NRPS uniprot fasta file and turn it into a DIAMOND database:
diamond makedb --in "/home/eddie/Barak/DIAMOND/clusnrpsdb.fasta" -d nrpsdb
#create my 85 genomes combined fasta files:
cat *.fasta > combined.fasta
#blastX alignment:
diamond blastx -d nrpsdb --id 70 --max-target-seqs 1 -q "/home/eddie/Barak/DIAMOND/genomes/combined.fasta" -a combinedNRPS
diamond view -a "/home/eddie/Barak/DIAMOND/combinedNRPS.daa" -o combinedNRPS.m8


