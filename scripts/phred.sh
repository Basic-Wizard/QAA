#!/bin/bash

#SBATCH --partition=bgmp       ### Partition (like a queue in PBS)
#SBATCH --job-name=QAA    ### Job Name
#SBATCH --nodes=1               ### Number of nodes needed for the job
#SBATCH --cpus-per-task=1     ### Number of tasks to be launched per Node
#SBATCH --account=bgmp     ### Account used for job submission


./phred_scores.py -f ../../shared/2017_sequencing/demultiplexed/24_4A_control_S18_L008_R1_001.fastq.gz -o 24_R1_hist.png

./phred_scores.py -f ../../shared/2017_sequencing/demultiplexed/24_4A_control_S18_L008_R2_001.fastq.gz -o 24_R2_hist.png

./phred_scores.py -f ../../shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R1_001.fastq.gz -o 1_R1_hist.png

./phred_scores.py -f ../../shared/2017_sequencing/demultiplexed/1_2A_control_S1_L008_R2_001.fastq.gz -o 1_R2_hist.png