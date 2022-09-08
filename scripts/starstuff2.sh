#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=align_reads      ### Job Name
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --account=bgmp      ### Account used for job submission
#SBATCH --cpus-per-task=8  ### cores dedicated per task 
 


/usr/bin/time -v STAR --runThreadN 8 --runMode alignReads \
--outFilterMultimapNmax 3 \
--outSAMunmapped Within KeepPairs \
--alignIntronMax 1000000 --alignMatesGapMax 1000000 \
--readFilesCommand zcat \
--readFilesIn /projects/bgmp/kraleigh/bi623/trimmomatic/1_r1_trmmd.fastq.gz /projects/bgmp/kraleigh/bi623/trimmomatic/1_r2_trmmd.fastq.gz \
--genomeDir /projects/bgmp/kraleigh/bi623/Mus_musculus.GRCm39.dna.ens107.STAR_2.7.1a \
--outFileNamePrefix alignment_SAM_1/