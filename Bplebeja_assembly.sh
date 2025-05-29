#!/bin/bash
#SBATCH --job-name="Moneses uniflora"
#SBATCH --export=ALL
#SBATCH --partition=short
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G #ask for 32G memory

#QC has been done
#remove reads mapped to chloroplast genome? I guess it doesn't matter too much
#Spade assembly

function assembly_spade {

r1=$1
r2=$2
ref=$3
spades.py --only-assembler --trusted-contigs $ref -1 $r1 -2 $r2 -k 23,31,55,65 -t 16 -m 32 -o spades_assembly
}

function main {
sample_dir='/home/zchen/projects/rbge/Begonia_map/Cyn1_raw/raw_data/Sample_85'
r1='Sample_85_EDSW200001003-1a_H2MKTDSXY_L2_1.fq.gz'
r2='Sample_85_EDSW200001003-1a_H2MKTDSXY_L2_2.fq.gz'
ref='/home/zchen/projects/rbge/Begonia_genomes/Reference_Assembelies/conch_genome_v4.fasta'
workdir='/home/zchen/maternity_cover/Bplebeja_assembly_202505'

#assembly
assembly_spade $sample_dir/$r1 $sample_dir/$r2 $ref

}

main
