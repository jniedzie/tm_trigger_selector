#!/bin/bash

INPUT=$1
OUTPUT=$2

export SCRAM_ARCH=el9_amd64_gcc12
source /cvmfs/cms.cern.ch/cmsset_default.sh

cmsenv

cmsRun tm_trigger_selector.py "$INPUT" "$OUTPUT"
