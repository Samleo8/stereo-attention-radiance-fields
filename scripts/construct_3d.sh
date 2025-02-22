#!/bin/bash

EXP_NAME=${1:-"train_DTU_2L_32H"}
SCAN_NUM=${2:-23}
CUDA_VISIBLE_DEVICE=${3:-"0"}

shift
shift
shift

echo "Performing 3D reconstruction of scan $SCAN_NUM for $EXP_NAME on GPU $CUDA_VISIBLE_DEVICE with flags $@"

CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICE python3 3d_reconstruction.py --config configs/render_experiment.txt --expname "render_${EXP_NAME}" --generate_specific_samples scan${SCAN_NUM} --no_parallel --ckpt_expname ${EXP_NAME} $@