# run eval.py on all the *preds_gtt.out files we can find
find . -name \*preds_gtt.out | awk '{print "python eval.py --pred_file", $1, "> ", $1 "-eval.txt"}' | sh
# now extract the line with all the metrics on it and mark which model/epoch produced it
find . -name \*preds_gtt.out-eval.txt | xargs -n 1 gawk '/^print/{match(FILENAME, /model435_(.*)_e[0-9]*_[0-9]*.*epoch=([0-9]*).ck/, a);$1=a[1] " " a[2]; print}'

