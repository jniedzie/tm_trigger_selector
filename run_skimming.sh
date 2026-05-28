#!/bin/bash

INPUT_DIR="/pnfs/iihe/cms/store/user/sduponch/PhD/TMToEE/etaToTMGamma/20260508/Simulation/MINIAODSIM/2022"
OUTPUT_DIR="/pnfs/iihe/cms/store/user/jniedzie/tm/skimmed_passing_trigger"

mkdir -p "$OUTPUT_DIR"

for input in "$INPUT_DIR"/output_*.root; do

    filename=$(basename "$input")
    index=${filename#output_}
    index=${index%.root}

    output="$OUTPUT_DIR/skimmed_${index}.root"

    echo "Processing:"
    echo "  input : $input"
    echo "  output: $output"

    cmsRun tm_trigger_selector.py "$input" "$output"

done
