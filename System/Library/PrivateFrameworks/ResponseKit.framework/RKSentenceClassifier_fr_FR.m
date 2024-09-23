@implementation RKSentenceClassifier_fr_FR

- (id)alternativeConjunctions
{
  return &unk_24C715818;
}

- (id)lexicalEntitiesFromString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)RKSentenceClassifier_fr_FR;
  -[RKSentenceClassifier lexicalEntitiesFromString:](&v8, sel_lexicalEntitiesFromString_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)analyzeSentence
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  objc_super v11;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)RKSentenceClassifier_fr_FR;
  -[RKSentenceClassifier analyzeSentence](&v11, sel_analyzeSentence);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier setInversions:](self, "setInversions:", v3);

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = *MEMORY[0x24BDD0F48];
  v12[0] = *MEMORY[0x24BDD0EE8];
  v12[1] = v5;
  v6 = *MEMORY[0x24BDD0F38];
  v12[2] = *MEMORY[0x24BDD0F30];
  v12[3] = v6;
  v12[4] = *MEMORY[0x24BDD0F08];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __45__RKSentenceClassifier_fr_FR_analyzeSentence__block_invoke;
  v10[3] = &unk_24C6AED80;
  v10[4] = v8;
  v10[5] = self;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

- (id)classifySentence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  id v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)RKSentenceClassifier_fr_FR;
  -[RKSentenceClassifier classifySentence](&v35, sel_classifySentence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "word");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "word");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(&unk_24C715830, "containsObject:", v11);

        if (v12)
        {
          objc_msgSend(v3, "setSentenceType:", 8);
          goto LABEL_9;
        }
        goto LABEL_8;
      }

    }
LABEL_8:
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __46__RKSentenceClassifier_fr_FR_classifySentence__block_invoke;
    v33[3] = &unk_24C6AEDA8;
    v33[4] = self;
    v34 = v3;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v33);

  }
LABEL_9:
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier inversions](self, "inversions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __46__RKSentenceClassifier_fr_FR_classifySentence__block_invoke_2;
    v31[3] = &unk_24C6AEDD0;
    v32 = v3;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v31);

  }
  -[RKSentenceClassifier sentenceString](self, "sentenceString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lowercaseString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "sentenceType") && objc_msgSend(v16, "containsString:", CFSTR("comment")))
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(lemma == 'appeler') || (lemma == 'appelles') || (lemma == \"s'appeler\")"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(lemma == 'dire')"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v16, "isEqualToString:", CFSTR("comment?")) & 1) == 0
      && (objc_msgSend(v16, "isEqualToString:", CFSTR("comment!")) & 1) == 0)
    {
      -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "filteredArrayUsingPredicate:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        v19 = 9;
        goto LABEL_16;
      }
      -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "filteredArrayUsingPredicate:", v18);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (!v30
        && !+[RKUtilities prefixInArray:withArray:](RKUtilities, "prefixInArray:withArray:", v16, &unk_24C715860)&& (!+[RKUtilities prefixInArray:withArray:](RKUtilities, "prefixInArray:withArray:", v16, &unk_24C715878)|| !+[RKUtilities suffixInArray:withArray:](RKUtilities, "suffixInArray:withArray:", v16, &unk_24C715890)&& !+[RKUtilities tokenInArray:withArray:](RKUtilities, "tokenInArray:withArray:", v16, &unk_24C715848))
        && !+[RKUtilities tokenInArray:withArray:](RKUtilities, "tokenInArray:withArray:", v16, &unk_24C7158A8))
      {
        goto LABEL_17;
      }
    }
    v19 = 8;
LABEL_16:
    objc_msgSend(v3, "setSentenceType:", v19);
LABEL_17:

  }
  if (objc_msgSend(v3, "sentenceType") == 11)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("partOfSpeech == %@ &&(word == 't\\'' || string == 'tu')"), *MEMORY[0x24BDD0F48]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
      objc_msgSend(v3, "setSentenceType:", 12);

  }
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 1);
  }

  return v3;
}

@end
