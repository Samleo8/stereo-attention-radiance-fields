#!/bin/bash

EXP_NAMES=(train_DTU_4L_16H train_DTU_2L_16H_reduced2)

CNT=0
PIDS=""
for EXP_NAME in "${EXP_NAMES[@]}"; do
    echo "Processing $EXP_NAME on GPU $CNT"

    echo "" >nohup_render${CNT}.out
    nohup ./scripts/render_finetune.sh ${EXP_NAME} 23 "0" $CNT &>nohup_render${CNT}.out &
    # PIDS="$! $PIDS"

    CNT=$((CNT + 1))
done

# wait $PIDS
# echo "Done!"
