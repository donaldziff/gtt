for BERT_MODEL in bert-base-uncased
do
CUDA_VISIBLE_DEVICES=2 bash ./run_pl_max.sh --num_epochs 120 --n_gpu 1 --save_top_k -1 --bert_model $BERT_MODEL
done
