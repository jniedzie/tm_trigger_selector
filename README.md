# TM trigger selector

This repo contains a CMSSW package to skim TM samples, keeping only those passing some selected trigger.

## Installation

Start by checking that you have the `cmsrel` command available:

```
cmsrel
```

If this fails, source cmssw defaults (you can add it to `~/.bash_profile` to source automatically every time you log in):

```
source /cvmfs/cms.cern.ch/cmsset_default.sh
```

Then, initialize CMSSW:

```
mkdir tm_trigger_selector
cd tm_trigger_selector

cmsrel CMSSW_15_0_15
cd CMSSW_15_0_15/src/
cmsenv
scram b -j
```

Once this is done, clone this git repo inside of `src` and recompile:

```
git clone git@github.com:jniedzie/tm_trigger_selector.git .
scram b -j
```
