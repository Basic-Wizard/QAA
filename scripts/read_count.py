#!/usr/bin/env python

import argparse
import re

def get_args():
    parser = argparse.ArgumentParser(description="count the mapped and unmapped htseq reads")
    parser.add_argument("-f", help="file to run", type=str, required = True)
    return parser.parse_args()

parameters = get_args()
f = parameters.f

mapped = 0
unmapped = 0
with open(f,"r") as fh:   #opens the file as fh
    for line in fh:
        line = line.strip('\n')
        if not line.startswith('@'):
            a = line.split('\t')
            if a[0][0:3] == "ENS":
                mapped += int(a[1])
            else:
                unmapped += int(a[1])

print ("there are",mapped,"mapped reads","and",unmapped, "unmapped reads", "out of", mapped + unmapped, "reads")
print(((mapped/(unmapped+mapped))*100),"% mapped reads")