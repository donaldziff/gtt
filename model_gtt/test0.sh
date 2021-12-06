for BERT_MODEL in bert-base-uncased
do
for i in {0..119}
do
  bash ./run_pl_max.sh --num_epochs 120 --n_gpu 1 --bert_model $BERT_MODEL --use_checkpoint checkpointepoch=${i}.ckpt
done
done
