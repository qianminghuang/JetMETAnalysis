#!/bin/bash
export SCRAM_ARCH=slc6_amd64_gcc530
cd /afs/cern.ch/user/q/qihuang/work/JECv2/jec/CMSSW_9_0_2/src #modify this to your own directory!
eval $(scramv1 runtime -sh)
cd JetMETAnalysis/JetAnalyzers/test/

#----------------Please modify these file paths to your own directories! ---------------------
inpath="/store/group/phys_jetmet/qihuang/hlt902jec"
outpath="/afs/cern.ch/user/q/qihuang/work/JECv2/jec/CMSSW_9_0_2/src/JetMETAnalysis/JetAnalyzers/test"   #take back to local area for final analysis
#---------------------------------------------------------------------------------------------

num=$1
outfile="jraPrefile_L1_"
list="list_"

if [ $num -eq 1 ]; then
    outfile=$outfile"fineBinning_"
    list=$list"fineBinning.txt"
elif [ $num -eq 2 ]; then
    outfile=$outfile"MergeEta_"
    list=$list"MergeEta.txt"
else
    outfile=$outfile"MergePt_"
    list=$list"MergePt.txt"
fi


num1=0
num2=1

while read file
do
    label=`printf $num1`
    label2=`printf $num2`

    if [ $num1 -eq 0 ]; then
        infile=$inpath/$file
        echo $infile
        printf "Copy file from eos to local directory ..."
        cmsStage $infile $outpath/
        mv $outpath/$file $outpath/$outfile$label2".root" 
    else
        infile1=$outpath/$outfile$label".root"
        infile2=$inpath/$file
        echo $infile1
        echo $infile2
        printf "Copy file from eos to local directory ..."
        cmsStage $infile2 $outpath/
        printf "Hadd source files ..."
        hadd $outpath/$outfile$label2".root" $outpath/$outfile$label".root" $outpath/$file
        printf "Hadd finish!!!"
        rm $outpath/$outfile$label".root"
        rm $outpath/$file
    fi

    (( num1 += 1 ))
    (( num2 += 1 ))

done < $list
