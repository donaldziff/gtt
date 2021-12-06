for BERT_MODEL in google/bert_uncased_L-8_H-512_A-8 google/bert_uncased_L-4_H-512_A-8 google/bert_uncased_L-4_H-256_A-4 prajjwal1/bert-medium 
do
for i in {0..99}
do
  CUDA_VISIBLE_DEVICES=2 bash ./run_pl_max.sh --num_epochs 100 --n_gpu 1 --bert_model $BERT_MODEL --use_checkpoint checkpointepoch=${i}.ckpt
done
done
