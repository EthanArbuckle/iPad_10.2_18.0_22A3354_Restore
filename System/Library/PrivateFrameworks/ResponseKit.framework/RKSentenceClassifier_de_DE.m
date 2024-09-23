@implementation RKSentenceClassifier_de_DE

- (id)alternativeConjunctions
{
  return &unk_24C715E90;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_de_DE;
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
  v11.super_class = (Class)RKSentenceClassifier_de_DE;
  -[RKSentenceClassifier analyzeSentence](&v11, sel_analyzeSentence);
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKSentenceClassifier setInversions:](self, "setInversions:", v3);

  if (analyzeSentence_onceToken_0 != -1)
    dispatch_once(&analyzeSentence_onceToken_0, &__block_literal_global_9);
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
  v10[2] = __45__RKSentenceClassifier_de_DE_analyzeSentence__block_invoke_2;
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
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RKSentenceClassifier_de_DE;
  -[RKSentenceClassifier classifySentence](&v19, sel_classifySentence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __46__RKSentenceClassifier_de_DE_classifySentence__block_invoke;
    v17[3] = &unk_24C6AEDA8;
    v17[4] = self;
    v18 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);

  }
  if (objc_msgSend(v3, "sentenceType") == 11)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("partOfSpeech == %@ && ((word == 'du') || (string == 'Sie'))"), *MEMORY[0x24BDD0F48]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = 12;
LABEL_9:
      objc_msgSend(v3, "setSentenceType:", v9);
    }
  }
  else
  {
    if (objc_msgSend(v3, "sentenceType") != 21)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(string LIKE[cd] 'morgen') || (string LIKE[cd] 'morgigen') || (string LIKE[cd] 'gestern') || (string LIKE[cd] 'gestrigen')"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v9 = 24;
      goto LABEL_9;
    }
  }

LABEL_11:
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier inversions](self, "inversions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __46__RKSentenceClassifier_de_DE_classifySentence__block_invoke_2;
    v15[3] = &unk_24C6AF4F0;
    v15[4] = self;
    v16 = v3;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

  }
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 1);
  }
  return v3;
}

@end
