for BERT_MODEL in prajjwal1/bert-medium google/bert_uncased_L-8_H-512_A-8 google/bert_uncased_L-4_H-512_A-8 google/bert_uncased_L-4_H-256_A-4 google/bert_uncased_L-2_H-128_A-2
do
CUDA_VISIBLE_DEVICES=2 bash ./run_pl_max.sh --num_epochs 100 --n_gpu 1 --save_top_k -1 --bert_model $BERT_MODEL
done
