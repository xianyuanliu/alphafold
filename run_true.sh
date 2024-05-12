#!/bin/bash

BASE_COMMAND="python3 docker/run_docker.py --max_template_date=2024-04-01 --data_dir=/media/xianyuan/10tb_hdd/Data/alphafold --output_dir=/home/xianyuan/Projects/alphafold/outputs/true"

FASTA_FILES=("2lku" "2k3d" "2mc8" "2myg" "2l4v" "1cyu" "1v9w" "1qkl" "2krx" "1gyz" "2rsx" "2i7k" "1vib" "2ml5" "2dbc" "1xut")

# FASTA_FILES=("fasta_files/alku.fasta")

for fasta_file in "${FASTA_FILES[@]}"; do
    echo "$fasta_file.fasta ..."

    COMMAND="$BASE_COMMAND --fasta_paths=fasta_files/true/$fasta_file.fasta"

    echo "$COMMAND"

    $COMMAND

    if [ $? -eq 0 ]; then
        echo "$fasta_file processed."
    else
        echo "Error processing $fasta_file."
    fi
done

echo "All processed."
