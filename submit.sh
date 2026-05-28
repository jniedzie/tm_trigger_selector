#!/bin/bash

INPUT_DIR="/pnfs/iihe/cms/store/user/sduponch/PhD/TMToEE/etaToTMGamma/20260508/Simulation/MINIAODSIM/2022"
OUTPUT_DIR="/pnfs/iihe/cms/store/user/jniedzie/tm/skimmed_passing_trigger_condor"

mkdir -p logs
mkdir -p "$OUTPUT_DIR"

rm -f filelist.txt

for f in "$INPUT_DIR"/*.root; do

    filename=$(basename "$f")
    base=${filename%.root}

    echo "$f $OUTPUT_DIR/${base}_skimmed.root" >> filelist.txt

done

condor_submit submit.jdl
