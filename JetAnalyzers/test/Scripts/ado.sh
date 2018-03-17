#for i in `seq 1 201` 
#do 
#bsub -q 2nw4cores PreL1batch.sh $i 
#done  



#for i in `seq 1 4` 
#do
#bsub -q 2nw4cores L1Hadd.sh $i
#done


#for i in `seq 1 9` 
#do 
#bsub -q 2nw4cores L1batch.sh $i 
#done


#for i in `seq 1 3` 
#do 
#bsub -q 2nw4cores PrejraHadd.sh $i 
#done

#for i in `seq 1 9` 
#do 
#bsub -q 2nw4cores L2batch.sh $i 
#done 


#for i in `seq 1 9` 
#do 
#bsub -q 2nw4cores L3batch.sh $i 
#done 


for i in `seq 1 3` 
do 
bsub -q 2nw4cores jraHadd.sh $i 
done 





