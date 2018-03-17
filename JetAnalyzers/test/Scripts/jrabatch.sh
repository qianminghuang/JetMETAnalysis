#!/bin/bash
export SCRAM_ARCH=slc6_amd64_gcc530
cd /afs/cern.ch/user/q/qihuang/work/JECv2/jec/CMSSW_9_0_2/src #modify this to your own directory!
eval $(scramv1 runtime -sh)
cd JetMETAnalysis/JetAnalyzers/test/

#----------------Please modify these file paths to your own directories! ---------------------
confpath="/afs/cern.ch/user/q/qihuang/work/JECv2/jec/CMSSW_9_0_2/src/JetMETAnalysis/JetAnalyzers/config"
inpath="/store/group/phys_jetmet/qihuang/HLT800JEC"
midpath="/tmp/qihuang"
outpath="/store/group/phys_jetmet/qihuang/HLT800JEC"
#---------------------------------------------------------------------------------------------

num=$1
filelist="list$num.txt"

string="jra_L1L2L3_"

confile="jra_dr_finebinning.config"

iter=$(($num * 1000))

while read file
do
    echo $file
	label=`printf $iter`
	outfile="$string$label.root"

	printf "Copy file from eos to tmp..."
	cmsStage $inpath/$file $midpath/

	jet_response_analyzer_x $confpath/$confile -input $midpath/$file -output $midpath/$outfile -nbinsabsrsp 0 -nbinsetarsp 0 -nbinsphirsp 0 -algs ak4pfHLTl1l2l3 ak4caloHLTl1l2l3 ak8pfHLTl1l2l3 ak8caloHLTl1l2l3

	printf "Copy file from tmp back to eos..."
	cmsStage $midpath/$outfile $outpath/

	rm -rf $midpath/$file
	rm -rf $midpath/$outfile

	(( iter += 1 ))

done < $filelist
