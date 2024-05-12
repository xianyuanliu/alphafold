#!/bin/bash

BASE_COMMAND="python3 docker/run_docker.py --max_template_date=2024-04-01 --data_dir=/media/xianyuan/10tb_hdd/Data/alphafold --output_dir=/home/xianyuan/Projects/alphafold/outputs/pred"

FASTA_FILES=("2kcd" "3a57")

for fasta_file in "${FASTA_FILES[@]}"; do
    echo "$fasta_file.fasta ..."

    COMMAND="$BASE_COMMAND --fasta_paths=fasta_files/pred/$fasta_file.fasta"

    echo "$COMMAND"

    $COMMAND

    if [ $? -eq 0 ]; then
        echo "$fasta_file processed."
    else
        echo "Error processing $fasta_file."
    fi
done

echo "All processed."
