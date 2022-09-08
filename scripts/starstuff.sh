#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=mk_star_database      ### Job Name
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --account=bgmp      ### Account used for job submission
#SBATCH --cpus-per-task=8  ### cores dedicated per task 
 



/usr/bin/time -v STAR --runThreadN 8 --runMode genomeGenerate --genomeDir Mus_musculus.GRCm39.dna.ens107.STAR_2.7.1a \
--genomeFastaFiles /projects/bgmp/kraleigh/bi623/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile /projects/bgmp/kraleigh/bi623/Mus_musculus.GRCm39.107.gtf \
