#!/bin/bash
export SCRAM_ARCH=slc6_amd64_gcc530
cd /afs/cern.ch/user/q/qihuang/work/JECv2/jec/CMSSW_9_0_2/src #modify this to your own directory!
eval $(scramv1 runtime -sh)
cd JetMETAnalysis/JetAnalyzers/test/

#----------------Please modify these file paths to your own directories! ---------------------
inpath="/store/group/phys_jetmet/qihuang/hlt902jec"
midpath="/tmp/qihuang"
outpath="/store/group/phys_jetmet/qihuang/hlt902jec"
#----------------------------------------------------------------------------------------

num=$1
filelist="list$num.txt"

string="JRA_L1L2_"

iter=$(($num * 1000))

while read file
do
    echo $file
	label=`printf $iter`
	outfile="$string$label.root"

	printf "Copy file from eos to tmp..."
	cmsStage $inpath/$file $midpath/

    jet_apply_jec_x -input $midpath/$file -output $midpath/$outfile -era EcalMultifitHCALMethod3 -levels 2 -jecpath ./JECTag_EcalMultifit_HCALMethod3/ -algs ak4pfHLTl1 ak4caloHLTl1 ak8pfHLTl1 ak8caloHLTl1

	printf "Copy file from tmp back to eos..."
	cmsStage $midpath/$outfile $outpath/

	rm -rf $midpath/$file
	rm -rf $midpath/$outfile

	(( iter += 1 ))

done < $filelist
