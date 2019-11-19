#!/bin/bash
#SBATCH -J RAxML
#SBATCH -n 1
#SBATCH --mem=20g
#SBATCH -t 30:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=<cschlump@uwyo.edu>
#SBATCH --account=inbre-train

#SBATCH --ntasks-per-node=8
#SBATCH --account=inbre-train
#SBATCH partition=inv-inbre

echo "Starting raxmlHPC run at $(date)"

module load swset gcc raxml

# added -T 8

raxmlHPC-PTHREADS-AVX -T 8 -f a -m GTRGAMMA -p 618 -N 2 -x 309  \
        -s AllBears.aln -n AllBearTree -w /project/inbre-train/inbre014/molb4485/Schlump_Phylo/BearTrees -o Giantpanda

echo "RAxML has finished at $(date)"
