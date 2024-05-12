#bin/bash

if [ "$#" -ne 2 ]; then
  echo "Usage: ./tmscore_rmsd.sh <file1.pdb> <file2.pdb>"
  exit 1
fi

file1=$1
file2=$2

#result=$(./TMscore $file1 $file2 | awk '/TM-score[[:space:]]+=[[:space:]]+[0-9\.]+/{print $3}')
result=$(./TMscore $file1 $file2 | awk '/RMSD of  the common residues=|TM-score    =/{print}')

#rmsd=$(echo "$result" | grep "RMSD of  the common residues=")
#tmscore=$(echo "$result" | grep "TM-score    =")
rmsd=$(echo "$result" | grep "RMSD of  the common residues=" | awk -F'= ' '{print $2}' | awk '{print $1}')
tmscore=$(echo "$result" | grep "TM-score    =" | awk -F'= ' '{print $2}' | awk '{print $1}')

file_id=$(basename $file1 .pdb)

#echo "${file_id} TM-score = $tmscore"
#echo "${file_id} RMSD of the common residues = $rmsd"
echo "TM-score = $tmscore"
echo "RMSD of the common residues = $rmsd"


