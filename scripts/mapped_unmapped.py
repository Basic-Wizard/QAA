#!/usr/bin/env python

import argparse
import re

def get_args():
    parser = argparse.ArgumentParser(description="isolate header files in a FASTA file")
    parser.add_argument("-f", help="file to run", type=str, required = True)
    return parser.parse_args()

parameters = get_args()
f = parameters.f
dict = {"mapped":0,"unmapped":0}
with open(f,"r") as fh:   #opens the file as fh
    for line in fh:
        line = line.strip('\n')
        if not line.startswith('@'):
            a = line.split('\t')
            if((int(a[1]) & 4) != 4) and ((int(a[1]) & 256) != 256):
                dict['mapped']= dict['mapped'] +1
            elif ((int(a[1]) & 4) == 4):
                dict['unmapped']= dict['unmapped'] +1
print (dict)
                