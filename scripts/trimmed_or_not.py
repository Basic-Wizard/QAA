#!/usr/bin/env python

import argparse


def get_args():
    parser = argparse.ArgumentParser(description="determine how much of a read was trimmed")
    parser.add_argument("-t", help="trimmed fastq file", type=str, required = True)
    return parser.parse_args()

parameters = get_args()
t = parameters.t

trm=0
unt = 0

with open (t, "r") as tin: 
    while True:
        a = tin.readline().strip()
        if a == "":
            break
        a = a.split()
        l = int(a[1])
        c = int(a[0])
        if l != 101:
            trm+=c
        else:
            unt+=c

print (trm," trimmed reads, ",unt,"untrimmed reads")
print ((trm/(trm+unt))*100,"percent of reads were trimmed")


        

