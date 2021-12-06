#!/usr/bin/env bash

# defaults
export NUM_EPOCHS=100
export MAX_LENGTH_SRC=435
export MAX_LENGTH_TGT=75
export BERT_MODEL=bert-base-uncased

export BATCH_SIZE=1
export NUM_EPOCHS=20
export SEED=1

SAVE_TOP_K=5
USE_CHECKPOINT=FALSE
N_GPU=0

th=80

POSITIONAL=()
while [[ $# -gt 0 ]]; do
  key="$1"

  case $key in
    --bert_model)
      BERT_MODEL="$2"
      shift # past argument
      shift # past value
      ;;
    --num_epochs)
      NUM_EPOCHS="$2"
      shift # past argument
      shift # past value
      ;;
    --n_gpu)
      N_GPU="$2"
      shift # past argument
      shift # past value
      ;;
    --save_top_k)
      SAVE_TOP_K="$2"
      shift # past argument
      shift # past value
      ;;
    --do_train)
      DO_TRAIN="TRUE"
      shift # past argument
      ;;
    --use_checkpoint)
      USE_CHECKPOINT="$2"
      shift # past argument
      shift # past value
      ;;
    *)    # unknown option
      POSITIONAL+=("$1") # save it in an array for later
      shift # past argument
      ;;
  esac
done

if [ "${USE_CHECKPOINT}" != "FALSE" ]; then
  do_train_clause=""
  use_checkpoint_clause="--do_predict --use_checkpoint ${USE_CHECKPOINT}"
else
  do_train_clause="--do_train"
  use_checkpoint_clause=""
fi

export CURRENT_DIR=${PWD}
export OUTPUT_DIR_NAME=model${MAX_LENGTH_SRC}_${BERT_MODEL}_e${NUM_EPOCHS}_${th}
export OUTPUT_DIR=${CURRENT_DIR}/${OUTPUT_DIR_NAME}

mkdir -p $OUTPUT_DIR

# Add parent directory to python path to access eval.py
export PYTHONPATH="../":"${PYTHONPATH}"

echo "=========================================================================================="
echo "                                   output_dir ${OUTPUT_DIR_NAME}                          "
echo "=========================================================================================="
python3 run_pl_gtt.py  \
--data_dir ../data/muc/processed \
--model_type bert \
--model_name_or_path $BERT_MODEL \
--output_dir $OUTPUT_DIR \
--max_seq_length_src  $MAX_LENGTH_SRC \
--max_seq_length_tgt $MAX_LENGTH_TGT \
--num_train_epochs $NUM_EPOCHS \
--train_batch_size $BATCH_SIZE \
--eval_batch_size $BATCH_SIZE \
--seed $SEED \
--n_gpu ${N_GPU} \
--thresh $th \
--save_top_k $SAVE_TOP_K \
${do_train_clause} ${use_checkpoint_clause}

# if testing, move preds_gtt.out to safety
if [ "${USE_CHECKPOINT}" != "FALSE" ]; then
  mv preds_gtt.out ${OUTPUT_DIR}/${USE_CHECKPOINT}-preds_gtt.out
fi
  
