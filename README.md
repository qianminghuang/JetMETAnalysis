JetMETAnalysis
==============

The code contained in this package is used for creating and analyzing the L2Relative and L3Absolute jet energy corrections (JEC). The code is used by the Jet Energy Resolution and Corrections (JERC) subgroup.

The JetAnalyzers subpackage relies upon the JetUtilities subpackage.

The JetUtilities subpackage contains useful tools and plugins for the JetMETAnalysis-JetAnalyzers package, but they can also be used outside of the JetAnalyzers framework (i.e. CommandLine tools).

<!-- MarkdownTOC depth=0 -->
- [Set up the framework](#set-up)
- [Manufacture the Ntuple](#ntuple)
- [Determine pileup correction](#pileup-correction)
- [Apply the pileup correction on the fly and extract pre-response](#pre-response)
- [Determine L2L3 corrections](#l2l3)
- [Apply combined L2L3 corrections on the fly and extract response profiles for closure](#l1l2l3)
- [Summarize the response distributions and conduct closure test](#closure)

<!-- /MarkdownTOC -->


<a name="setup"></a>
## Set up the framework
```
cmsrel CMSSW_10_0_0
cd CMSSW_10_0_0/src
cmsenv
git cms-init

git cms-addpkg L1Trigger/L1TGlobal

git cms-addpkg HLTrigger/Configuration

git cms-checkdeps -A -a
scram b -j 6
rehash

git clone https://github.com/bchirod/JetMET-Analysis-for-JEC-94X.git
cd JetMETAnalysis/
git checkout online
git branch
cd ../
scram b -j 6
cd JetMETAnalysis/JetAnalyzers/test/
voms-proxy-init --voms cms


cd ..
cd ..
cd ..
git cms-addpkg RecoJets/JetProducers
cd RecoJets/JetProducers/python/
git clone https://github.com/bchirod/JEC-94X-RecoJet.git
cd ..
cd ..
cd ..
scram b -j 6
```

<a name="ntuple"></a>
## Manufacture the Ntuple

 For local test, you can just do:
```
cmsRun run_JRA_hlt_cfg.py
