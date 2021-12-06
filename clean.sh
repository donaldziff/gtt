awk 'BEGIN{
    OFS = ","
    map["google/bert_uncased_L-2_H-128_A-2"] = "BERT-Tiny"
    map["google/bert_uncased_L-4_H-256_A-4"] = "BERT-Mini"
    map["google/bert_uncased_L-4_H-512_A-8"] = "BERT-Small"
    map["google/bert_uncased_L-8_H-512_A-8"] = "BERT-Medium"
    map["bert-base-uncased"] = "BERT-Base"
    map["prajjwal1/bert-medium"] = "PB-BERT-medium"
    headers = "model,epoch,type:P,type:R,type:F1,PerpInd:P,PerpInd:R,PerpInd:F1,PerpOrg:P,PerpOrg:R,PerpOrg:F1,Target:P,Target:R,Target:F1,Victim:P,Victim:R,Victim:F1,Weapon:P,Weapon:R,Weapon:F1,mAvg:P,mAvg:R,mAvg:F1"
    print headers
    }
    {$1 = map[$1]; print}'
