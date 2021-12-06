# Template Filling with Generative Transformers (NAACL 2021 short)
[paper link](https://www.aclweb.org/anthology/2021.naacl-main.70.pdf)


## Dependencies

* Python 3.6.10
* Transformers: [transformers 2.4.1](https://github.com/huggingface/transformers/tree/2c12464a20160061a8b436b4939e8d5fa2437a15) installed from source.
* Pytorch-Lightning==0.7.1
* Pytorch==1.4.0
* seqeval

## Dataset 
* `./data/muc`, refer to `./data/muc/README.md` for details

## Eval
* eval on preds_gtt.out `python eval.py --pred_file model_gtt/preds_gtt.out`

## GTT model 

* The encoder-decoder model (code is written based on hugging face [transformers/examples/ner/3ee431d](https://github.com/huggingface/transformers/tree/3ee431dd4c720e67e35a449b453d3dc2b15ccfff)
* How to run: see README in model_gtt

## Citation
If you use our materials, please cite
```
@inproceedings{du2021gtt,
  title={Template Filling with Generative Transformers},
  author={Du, Xinya and Rush, Alexander M and Cardie, Claire},
  booktitle = "Proceedings of the 2021 Conference of the North {A}merican Chapter of the Association for Computational Linguistics: Human Language Technologies",
  year={2021}
}
```

## Max Ziff's modifications to the orginal repo

My modifications consist in the following:

* Minor bug-fixes and feature enhancements to the primary implementation files: `./model_gtt/run_pl_gtt.py` and `./model_gtt/transformer_base.py`
* New testing harness and data collection: `./model_gtt/run_pl_max.sh`, `./gather_scores.sh` and `clean.sh`
* Test scripts: `./model_gtt/experiment*.sh` and `./model_gtt/test*.sh`
* Jupyter notebook for producing graphs: `./graphs.ipynb`

I ran the experiment and test scripts and created many model checkpoints derived from various BERT-models as described.

I gathered the results as follows:

```
bash ./gather_scores.sh > results.txt
cat results.txt | bash clean.sh > clean-results.csv
```

