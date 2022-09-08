#!/bin/bash

#SBATCH --partition=bgmp        ### Partition (like a queue in PBS)
#SBATCH --job-name=htseq_count      ### Job Name
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --account=bgmp      ### Account used for job submission
#SBATCH --cpus-per-task=1  ### cores dedicated per task 

htseq-count --stranded=yes alignment_SAM_1/Aligned.out.sam Mus_musculus.GRCm39.107.gtf > lib_1_yes.txt
htseq-count --stranded=reverse alignment_SAM_1/Aligned.out.sam Mus_musculus.GRCm39.107.gtf > lib_1_reverse.txt
htseq-count --stranded=yes alignment_SAM_24/Aligned.out.sam Mus_musculus.GRCm39.107.gtf > lib_24_yes.txt
htseq-count --stranded=reverse alignment_SAM_24/Aligned.out.sam Mus_musculus.GRCm39.107.gtf > lib_24_reverse.txt