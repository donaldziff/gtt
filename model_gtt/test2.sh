for BERT_MODEL in google/bert_uncased_L-2_H-128_A-2
do
for i in {0..119}
do
  bash ./run_pl_max.sh --num_epochs 100 --n_gpu 1 --bert_model $BERT_MODEL --use_checkpoint checkpointepoch=${i}.ckpt
done
done
