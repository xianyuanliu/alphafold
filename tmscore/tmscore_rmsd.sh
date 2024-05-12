#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: ./calculate_all.sh <path_to_folder> <output_file_name>"
    exit 1
fi

folder=$1
pred_folder="$folder/pred_pdb_alphafold"
true_folder="$folder/true_pdb"
output_file="$folder/$2.csv"

echo "name,TM-socre,RMSD" > "$output_file"

for pred_file in "$pred_folder"/*.pdb; do
    base_name=$(basename "$pred_file" .pdb)
    base_name=${base_name%%_*}
    true_file="$true_folder/${base_name}_reindex.pdb"
    echo "${base_name}"
    
    result=$(./TMscore $pred_file $true_file | awk '/RMSD of  the common residues=|TM-score    =/{print}')

    rmsd=$(echo "$result" | grep "RMSD of  the common residues=" | awk -F'= ' '{print $2}' | awk '{print $1}')
    tmscore=$(echo "$result" | grep "TM-score    =" | awk -F'= ' '{print $2}' | awk '{print $1}')

    file_id=$(basename $file1 .pdb)

    echo "TM-score = $tmscore"
    echo "RMSD of the common residues = $rmsd"
    echo "\"$base_name\",$tmscore,$rmsd" >> "$output_file"
done

