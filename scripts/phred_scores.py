#!/usr/bin/env python

import argparse
import bioinfo as bio
import gzip

def get_args():
    parser = argparse.ArgumentParser(description="isolate header files in a FASTA file")
    parser.add_argument("-f", help="file to run", type=str, required = True)
    parser.add_argument("-o", help="output file", type=str, required = True)
    return parser.parse_args()

parameters = get_args()
f = parameters.f
o = parameters.o



scores = []
record = 0
totals = []
with gzip.open(f,"rt") as fh:   #opens the file as fh
    for n,line in enumerate (fh):     #starts a for loop for each line in file f 
        line = line.strip('\n') 
        if n%4 == 3:
            record +=1
            total = 0
            if record == 1:
                for score in line:
                    values = (bio.convert_phred(score))
                    totals.append(values)
            else:
                for i,score in enumerate(line):
                    values = (bio.convert_phred(score))
                    totals[i] += values
                    if record % 100000000000 == 1:
                        print ("it's working!")
            
means = []      
for a in totals:
    mean = a/record 
    means.append(mean)

import matplotlib.pyplot as plt                        #imports matplotlib for making a graph


fig = plt.figure(figsize = (20, 10))                   #sets the size of the image that will be created

plt.bar(range (0,len(means)), means, color ='maroon', width = 1) #plots a bargraph 
 


plt.xlabel("position")
plt.ylabel("mean phred score")
plt.title("Mean Phred Score per Position")
plt.savefig(fname = o)