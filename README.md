# TM trigger selector

This repo contains a CMSSW package to skim TM samples, keeping only those passing some selected trigger.

## Installation

Start by checking that you have the `cmsrel` command available:

```bash
cmsrel
```

If this fails, source cmssw defaults (you can add it to `~/.bash_profile` to source automatically every time you log in):

```bash
source /cvmfs/cms.cern.ch/cmsset_default.sh
```

Then, initialize CMSSW:

```bash
mkdir tm_trigger_selector
cd tm_trigger_selector

cmsrel CMSSW_15_0_15
cd CMSSW_15_0_15/src/
cmsenv
scram b -j
```

Once this is done, clone this git repo inside of `src`:

```bash
git clone git@github.com:jniedzie/tm_trigger_selector.git .
```

## How to run

First, open `tm_trigger_selector.py` and put your desired trigger paths in the `triggerConditions` vector, e.g.:

```python
triggerConditions = cms.vstring(
    "HLT_DoubleEle4_eta1p22_mMax6*",
    "HLT_DoubleEle4p5_eta1p22_mMax6*",
    "HLT_DoubleEle5_eta1p22_mMax6*",
    "HLT_DoubleEle5p5_eta1p22_mMax6*",
    "HLT_DoubleEle6_eta1p22_mMax6*",
    "HLT_DoubleEle6p5_eta1p22_mMax6*",
    "HLT_DoubleEle7_eta1p22_mMax6*",
    "HLT_DoubleEle7p5_eta1p22_mMax6*",
    "HLT_DoubleEle8_eta1p22_mMax6*",
    "HLT_DoubleEle8p5_eta1p22_mMax6*",
    "HLT_DoubleEle9_eta1p22_mMax6*",
    "HLT_DoubleEle9p5_eta1p22_mMax6*",
    "HLT_DoubleEle10_eta1p22_mMax6*",
),
```

Then, run a test on a single file, providing full paths to the input and output files

```bash
cmsRun tm_trigger_selector.py \
  /pnfs/iihe/cms/store/user/sduponch/PhD/TMToEE/etaToTMGamma/20260508/Simulation/MINIAODSIM/2022/output_1.root \ 
  /pnfs/iihe/cms/store/user/jniedzie/tm/skimmed_passing_trigger/skimmed_1.root
```

Finally, you can run it in a loop using the `run_skimming.sh` script. Open it, set input and output paths:

```bash
INPUT_DIR="/pnfs/iihe/cms/store/user/sduponch/PhD/TMToEE/etaToTMGamma/20260508/Simulation/MINIAODSIM/2022"
OUTPUT_DIR="/pnfs/iihe/cms/store/user/jniedzie/tm/skimmed_passing_trigger"
```

and then simply run with:

```
./run_skimming.sh
```

## Running on condor

You can also submit jobs to condor - useful when you have many input files. Open `submit.sh` and set input/output paths:

```bash
INPUT_DIR="/pnfs/iihe/cms/store/user/sduponch/PhD/TMToEE/etaToTMGamma/20260508/Simulation/MINIAODSIM/2022"
OUTPUT_DIR="/pnfs/iihe/cms/store/user/jniedzie/tm/skimmed_passing_trigger_condor"
```

Then, simply run:

```bash
./submit.sh
```

You can check the progress with `condor_q`, as usual.

## Merging

This is super important - when merging these output files, you need to use `hadd` from the CMSSW environment used to produce them.
So first, make sure to do `cmsenv`:

```bash
cd tm_trigger_selector/CMSSW_15_0_15/src/
cmsenv
```

Only then merge your files:

```bash
cd /pnfs/iihe/cms/store/user/jniedzie/tm
hadd -f -j -k merged_skimmed_passing_trigger.root skimmed_passing_trigger/*.root
```



