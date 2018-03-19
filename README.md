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
cmsrel CMSSW_10_0_3
cd CMSSW_10_0_3/src
cmsenv
git cms-init

git cms-addpkg L1Trigger/L1TGlobal

git cms-addpkg HLTrigger/Configuration

git cms-checkdeps -A -a

git clone https://github.com/qianminghuang/JetMETAnalysis.git
scram b -j8

git cms-addpkg RecoJets/JetProducers
cd RecoJets/JetProducers/python/
git clone https://github.com/qianminghuang/JEC-94X-RecoJet.git
cp JEC-94X-RecoJet/kt6CaloJets_cfi.py ./
cd ../../../
scram b -j8
```

<a name="ntuple"></a>
## Manufacture the Ntuple

 For local test, you can just do:
```
cmsRun run_JRA_hlt_cfg.py
```
Alternatively, you can use "crabConfig_QCD_NoPU.py" and "crabConfig_QCD_PU0to70.py" and "dump_hlt_10_0_0_JEC.py" python file to submit CRAB jobs, and get a set of new datasets. Use those datasets and "crabConfig_QCD_NoPU_JRA.py" and "crabConfig_QCD_PU0to70_JRA.py" and the above python file to submit CRAB jobs, and get a set of ntuples. 

<a name="pileup-correction"></a>
## Determine pileup correction

 The new method complies reco-jet matching using two samples with/without pileup simulation while from the same generator, and parametrizes the correction using jet area, rho, and pt in different eta regions. You will need two groups of ntuples, one of which with pileup simulation while the other one without pileup.

1) prepare the histograms for the parametrization. The configuration file is "../bin/jet_synchtest_x.cc". Since this step is time consuming, you can use my script in lxbatch: Scripts/PreL1batch.sh. Please modify the paths in the script to your own directory (afs or eos or tmp). Then you can run it like this:

```
for i in `seq 1 4` 
do 
bsub -q 2nw4cores PreL1batch.sh $i 
done  
```
Note that before you run this script, you have to produce a text file "list.txt" containing the name lists of the input ntuple files. You can refer to "Scripts/prolist.sh" to generate it. 

 2) merge the output files by use of "Scripts/L1Hadd.sh". Before running it, please delete the output files of the smallest size which are empty (use "ls -lrth" to check the size of each file), and also produce four text files containing the lists of the output file made by "PreL1batch.sh". Then run the "L1Hadd.sh" in the similar lxbatch mode to the "PreL1batch.sh".

3) run the ../bin/jet_synchfit_x.cc to determine the PU correction using the output_ak4*HLT.root of the L1Hadd.sh:

```
jet_synchfit_x -algo1 ak4pfHLT -algo2 ak4pfHLT
jet_synchfit_x -algo1 ak4caloHLT -algo2 ak4caloHLT
jet_synchfit_x -algo1 ak8pfHLT -algo2 ak8pfHLT
jet_synchfit_x -algo1 ak8caloHLT -algo2 ak8caloHLT
```

You will have the parameters_ak4pfHLT.txt and parameters_ak4caloHLT.txt with the L1 corrections.



<a name="pre-response"></a>
## Apply the pileup correction on the fly and extract pre-response

 You should change the text file names of L1 correction to:
```
EcalMultifitHCALMethod3_L1FastJet_AK4CaloHLT.txt
EcalMultifitHCALMethod3_L1FastJet_AK4PFHLT.txt
EcalMultifitHCALMethod3_L1FastJet_AK8CaloHLT.txt
EcalMultifitHCALMethod3_L1FastJet_AK8PFHLT.txt
```
and put them into a new directory called "JECTag_EcalMultifit_HCALMethod3". Then you change the path in the "L1batch.sh", and run it as following:
```
for i in `seq 1 9` 
do 
bsub -q 2nw4cores L1batch.sh $i 
done 
```
This splits the jobs into nine pieces, before which you need to again refer to "prolist.sh" to produce nine text files containing different group lists of input files. After this you will obtain the ntuples with L1 correction applied and jet response profile after L1 correction. The configuration files are "../bin/jet_apply_jec_x.cc" and "../bin/jet_response_analyzer_x.cc".

Then you need to merge the pre-response root files produced by "L1batch.sh", simply use "PrejraHadd.sh":
```
for i in `seq 1 3` 
do 
bsub -q 2nw4cores PrejraHadd.sh $i 
done 
```
And you also need to produce the "list.txt" with the file name list before launching the lxbatch (refer to "prolist.sh"). 

<a name="l2l3"></a>
## Determine L2L3 corrections

 After the last step finishes, you will need to fit the profiles (histograms) in the merged root file to get the pre-response values. The fit function is Gaussian distribution around the peak of each profile by default. For this you need the configuration file of "../bin/jet_response_fitter_x.cc", in order to determine the L2L3 corrections later.

The L2 (relative) and L3 (absolute) corrections are derived together by "../bin/jet_l3_correction_x.cc" and "../bin/jet_l2_correction_x.cc". They are processed in order, and after these runs you will get the text files of L2L3 corrections. You can use the "Scripts/deterjec.sh" to achieve the above consequent procedures by:
```
bash deterjec.sh
```
#### REMEMBER: you should only keep the L2 correction text file, since it contains the combined L2L3 corrections. You need to throw away the L3 correction text files produced in this step, because it does redundant corrections! Instead, you need to create a dummy L3 correction file for the subsequent program compatibility. This phenomenon results from programmatic characteristics. An example of such a dummy file can be find here: EcalMultifitHCALMethod3_L3Absolute_AK4PFHLTl1l2.txt. The name of the L3 dummy file should be as below for programmatic compatibility:
```
EcalMultifitHCALMethod3_L3Absolute_AK4CaloHLTl1l2.txt
EcalMultifitHCALMethod3_L3Absolute_AK4PFHLTl1l2.txt
EcalMultifitHCALMethod3_L3Absolute_AK8CaloHLTl1l2.txt
EcalMultifitHCALMethod3_L3Absolute_AK8PFHLTl1l2.txt
```
put these text files together with the L1 and L2 correction text files. In order to check the quality of determined L2L3 correction, you can have a look at the "l2.root" file produced by the deterjec.sh, including the correction distributions together with the parametrization. Alternatively, you can also use the scripts of "sanity/*.cc" to implement sanity check for the L2L3 corrections. Simply copy the files below into the sanity directory and remove the first row of each text file, and use interactive root commands to compile and run the scripts. Then you will get some text files containing possible anomalous correction factors (typically divergence) in some bins.
```
EcalMultifitHCALMethod3_L2Relative_AK4CaloHLTl1.txt
EcalMultifitHCALMethod3_L2Relative_AK4PFHLTl1.txt
EcalMultifitHCALMethod3_L2Relative_AK8CaloHLTl1.txt
EcalMultifitHCALMethod3_L2Relative_AK8PFHLTl1.txt
```
<a name="l1l2l3"></a>
## Apply combined L2L3 corrections on the fly and extract response profiles for closure

 Now you can apply the derived L2L3 corrections to the ntuples with L1 correction applied. The configuration file is "../bin/jet_apply_jec_x.cc". You can use my "Scripts/L2batch.sh" to launch the lxbatch (you also need the list.txt file for the list of the L1 corrected ntuple files, refer to prolist.sh):
```
for i in `seq 1 9` 
do 
bsub -q 2nw4cores L2batch.sh $i 
done 
```
After that, you also need to apply the dummy L3 correction on the fly. After producing the list of root files produced by "L2batch.sh", you can start the lxbatch with "Scripts/L3batch.sh":
```
for i in `seq 1 9` 
do 
bsub -q 2nw4cores L3batch.sh $i 
done 
```
Then you have the ntuples corrected by L1L2L3 and the corrected response profiles as well. They are ready for closure test.

Now you need to merge the output root files (jra_L1L2L3*.root) for the subsequent processing, simply use "Scripts/jraHadd.sh" (also produce list.txt for the input files):
```
for i in `seq 1 3` 
do 
bsub -q 2nw4cores jraHadd.sh $i 
done 
```
<a name="closure"></a>
## Summarize the response distributions and conduct closure test

 Typically we use fine binning of both η and pt to determine the full JEC, with the configuration file of "../config/jra_dr_finebinning.config", as above. Regarding the closure test, we prefer to see the corrected jet response and jet energy resolution in specific pt or η ranges, hence we need to rebin the response profiles. We have two scenarios: one is to check response versus η in specific pt regions; while the other one is to see the response versus pt in specific η ranges. In the framework, "../config/jra_Eta_finebinning.config" is used for the former while the "../config/jra_QCDflat_MergeEta.config" is used for the latter. Based on the merged response profile files from last step, you can simply run my "Scripts/MergePt.sh" for the former and "Scripts/MergeEta.sh" for the latter:
```
bash MergePt.sh
bash MergeEta.sh
```
These two scripts take advantages of the configuration of "../bin/jet_response_fitter_x.cc" and "../bin/jet_response_and_resolution_x.cc". The former (configuration file) deals with the Gaussian fitting for all the response profiles corrected by previous determined JEC. Afterwards, the latter (configuration file) extracts the mean value of each fitted response profile differentially and calculates their dependences on observables (number of pileup, pt, η). After that, you can draw the final closure plots to have an intuitive view, by means of "Scripts/MultiGraph.sh" based on the output root file of above two scripts:
```
bash MultiGraph.sh
```
This script utilizes the configuration file of "../../JetUtilities/bin/jet_response_and_resolution_x.cc". Have fun! For any technical inquiry, you can also refer to: 

[https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideJetResponseAnalyzer](https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideJetResponseAnalyzer)
and
[https://twiki.cern.ch/twiki/bin/viewauth/CMS/TriggerStudiesPAGStudyHCALMethod2JetMETInternal#Introduction_of_workflow_of_Jet](https://twiki.cern.ch/twiki/bin/viewauth/CMS/TriggerStudiesPAGStudyHCALMethod2JetMETInternal#Introduction_of_workflow_of_Jet)
