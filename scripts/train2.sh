#!/bin/bash

git pull
echo "" >nohup2.out

# NUM_PROC=$(nproc)
# echo "NOTE: Using $NUM_PROC workers (number of CPUs in VM)."
NUM_PROC=16

export CUDA_VISIBLE_DEVICES=1
python3 trainer.py --config configs/train_DTU_4L_16H.txt --num_workers=$NUM_PROC --no_parallel $@
