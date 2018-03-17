#!/bin/bash
source /afs/cern.ch/project/eos/installation/cms/etc/setup.sh

#----------- For PreL1batch.sh -------------------------
##eos ls store/user/fengwang/QCDHLT_NoPU/*.root > list.txt
eos ls /store/group/phys_jetmet/qihuang/JRA/NPU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC-NPU/170227_033516/0000/*.root > ../list.txt 

#----------- For L1Hadd.sh -------------------------
##method 1 for few files
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/output_ak4caloHLT_15*root > ../list_ak4caloHLT.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/output_ak4pfHLT_15*root   > ../list_ak4pfHLT.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/output_ak8caloHLT_15*root > ../list_ak8caloHLT.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/output_ak8pfHLT_15*root   > ../list_ak8pfHLT.txt

###method 2 for too many files, need to add 1 2 3 4 5 ...
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/output_ak4caloHLT_*_9*root > ../list_ak4caloHLT.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/output_ak4pfHLT_*_9*root   > ../list_ak4pfHLT.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/output_ak8caloHLT_*_9*root > ../list_ak8caloHLT.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/output_ak8pfHLT_*_9*root   > ../list_ak8pfHLT.txt

#-------------- For L1batch.sh ---------------------------
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_1*.root > ../list1.txt
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_2*.root > ../list2.txt
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_3*.root > ../list3.txt
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_4*.root > ../list4.txt
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_5*.root > ../list5.txt
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_6*.root > ../list6.txt
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_7*.root > ../list7.txt
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_8*.root > ../list8.txt
#eos ls /store/group/phys_jetmet/qihuang/JRA/PU/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/crab_QCDHLTJEC/170227_033301/0000/JRA_9*.root > ../list9.txt

#-------------- For PrejraHadd.sh -------------------------
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/jra_L1_*.root          > ../list_fineBinning.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/jra_L1-MergeEta_*.root > ../list_MergeEta.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/jra_L1-MergePt_*.root  > ../list_MergePt.txt

#-------------- For L2batch.sh ---------------------------- 
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_1*.root > ../list1.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_2*.root > ../list2.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_3*.root > ../list3.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_4*.root > ../list4.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_5*.root > ../list5.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_6*.root > ../list6.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_7*.root > ../list7.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_8*.root > ../list8.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1_9*.root > ../list9.txt

#------------- For L3batch.sh -----------------------------
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_1*.root > ../list1.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_2*.root > ../list2.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_3*.root > ../list3.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_4*.root > ../list4.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_5*.root > ../list5.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_6*.root > ../list6.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_7*.root > ../list7.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_8*.root > ../list8.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2_9*.root > ../list9.txt

#------------- For jrabatch.sh -----------------------------
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_1*.root > ../list1.txt
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_2*.root > ../list2.txt
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_3*.root > ../list3.txt
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_4*.root > ../list4.txt
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_5*.root > ../list5.txt
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_6*.root > ../list6.txt
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_7*.root > ../list7.txt
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_8*.root > ../list8.txt
###eos ls /store/group/phys_jetmet/qihuang/jral1l2l3/JRA_L1L2L3_9*.root > ../list9.txt

#------------- For jraHadd.sh -------------------------------
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/JRA_L1L2L3_*.root          > ../list_fineBinning.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/jra_L1L2L3-MergeEta_*.root > ../list_MergeEta.txt
#eos ls /store/group/phys_jetmet/qihuang/HLT8026JEC/jra_L1L2L3-MergePt_*.root  > ../list_MergePt.txt
