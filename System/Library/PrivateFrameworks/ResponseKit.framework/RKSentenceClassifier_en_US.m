@implementation RKSentenceClassifier_en_US

- (id)alternativeConjunctions
{
  return &unk_24C715C08;
}

+ (id)preProcessTextMessageForLinguisticTagger:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDD1638];
  v4 = a3;
  v5 = [v3 alloc];
  v18[0] = *MEMORY[0x24BDD0F60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTagSchemes:options:", v6, 6);

  objc_msgSend(v7, "setString:", v4);
  v8 = (void *)objc_msgSend(v4, "mutableCopy");

  v9 = objc_msgSend(v8, "length");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__RKSentenceClassifier_en_US_preProcessTextMessageForLinguisticTagger___block_invoke;
  v15[3] = &unk_24C6AF430;
  v16 = v7;
  v10 = v8;
  v17 = v10;
  v11 = v7;
  objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 259, v15);
  v12 = v17;
  v13 = v10;

  return v13;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_en_US;
  -[RKSentenceClassifier addSentenceTerminatorQuestion:](&v6, sel_addSentenceTerminatorQuestion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("?"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)analyzeSentence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[7];
  objc_super v13;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &__block_literal_global_3);

  v13.receiver = self;
  v13.super_class = (Class)RKSentenceClassifier_en_US;
  -[RKSentenceClassifier analyzeSentence](&v13, sel_analyzeSentence);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier setInversions:](self, "setInversions:", v4);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C715C20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = *MEMORY[0x24BDD0F48];
  v14[0] = *MEMORY[0x24BDD0EE8];
  v14[1] = v7;
  v8 = *MEMORY[0x24BDD0F38];
  v14[2] = *MEMORY[0x24BDD0F30];
  v14[3] = v8;
  v14[4] = *MEMORY[0x24BDD0F08];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__RKSentenceClassifier_en_US_analyzeSentence__block_invoke_2;
  v12[3] = &unk_24C6AF478;
  v12[4] = v10;
  v12[5] = self;
  v12[6] = v5;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

- (id)classifySentence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _QWORD v44[5];
  id v45;
  _QWORD v46[5];
  id v47;
  _QWORD v48[5];
  id v49;
  uint64_t *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD v53[3];
  char v54;
  _QWORD v55[4];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  objc_super v60;

  v3 = (void *)objc_opt_new();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("lemma == 'please'"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      objc_msgSend(v3, "setSentenceType:", 4);

  }
  if (!objc_msgSend(v3, "sentenceType"))
  {
    v60.receiver = self;
    v60.super_class = (Class)RKSentenceClassifier_en_US;
    -[RKSentenceClassifier classifySentence](&v60, sel_classifySentence);
    v8 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v8;
  }
  if (objc_msgSend(v3, "sentenceType") == 6)
  {
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v55[3] = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v54 = 0;
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x24BDAC760];
    v48[1] = 3221225472;
    v48[2] = __46__RKSentenceClassifier_en_US_classifySentence__block_invoke;
    v48[3] = &unk_24C6AF4C8;
    v48[4] = self;
    v50 = &v56;
    v51 = v53;
    v10 = v3;
    v49 = v10;
    v52 = v55;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v48);

    if (v57[3])
      goto LABEL_10;
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier alternatives](self, "alternatives");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier alternatives](self, "alternatives");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v13, "count") - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v14, "rangeValue"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "word");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("so"));

    if (v17)
    {
LABEL_10:
      objc_msgSend(v10, "setSentenceType:", 0);
      objc_msgSend(v10, "setCustomResponses:", 0);
    }

    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);
    _Block_object_dispose(&v56, 8);
  }
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_3;
    v46[3] = &unk_24C6AEDA8;
    v46[4] = self;
    v47 = v3;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v46);

  }
  if (objc_msgSend(v3, "sentenceType") == 19)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("partOfSpeech == %@ && lemma == 'time'"), *MEMORY[0x24BDD0EE8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = v3;
      v24 = 28;
LABEL_20:
      objc_msgSend(v23, "setSentenceType:", v24);
      goto LABEL_30;
    }
    goto LABEL_30;
  }
  if (objc_msgSend(v3, "sentenceType") != 11)
  {
    if (objc_msgSend(v3, "sentenceType") != 21)
      goto LABEL_31;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24C715C50);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(lemma == 'tomorrow') || (lemma == 'yesterday')"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x24BDD0F98];
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(partOfSpeech == %@ && lemma == 'will') || (partOfSpeech == %@ && lemma == 'next')"), *MEMORY[0x24BDD0F98], *MEMORY[0x24BDD0F40]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(partOfSpeech == %@ && string.lowercaseString IN %@) || (partOfSpeech == %@ && lemma == 'last')"), v29, v19, *MEMORY[0x24BDD0EA0]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "filteredArrayUsingPredicate:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      v35 = 24;
    }
    else
    {
      -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "filteredArrayUsingPredicate:", v31);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      if (v38)
      {
        v35 = 22;
      }
      else
      {
        -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "filteredArrayUsingPredicate:", v30);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        if (!v41)
        {
LABEL_29:

          goto LABEL_30;
        }
        v35 = 23;
      }
    }
    objc_msgSend(v3, "setSentenceType:", v35);
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("partOfSpeech == %@ && lemma == 'you'"), *MEMORY[0x24BDD0F48]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "filteredArrayUsingPredicate:", v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    v23 = v3;
    v24 = 12;
    goto LABEL_20;
  }
LABEL_30:

LABEL_31:
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier inversions](self, "inversions");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __46__RKSentenceClassifier_en_US_classifySentence__block_invoke_4;
    v44[3] = &unk_24C6AF4F0;
    v44[4] = self;
    v45 = v3;
    objc_msgSend(v42, "enumerateObjectsUsingBlock:", v44);

  }
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 1);
  }
  return v3;
}

@end
