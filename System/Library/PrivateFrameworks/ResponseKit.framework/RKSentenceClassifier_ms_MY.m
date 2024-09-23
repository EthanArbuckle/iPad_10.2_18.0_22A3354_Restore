@implementation RKSentenceClassifier_ms_MY

- (id)alternativeConjunctions
{
  return &unk_24C715CF8;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_ms_MY;
  -[RKSentenceClassifier addSentenceTerminatorQuestion:](&v6, sel_addSentenceTerminatorQuestion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("?"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)analyzeSentence
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RKSentenceClassifier_ms_MY;
  -[RKSentenceClassifier analyzeSentence](&v2, sel_analyzeSentence);
}

- (id)classifySentence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)RKSentenceClassifier_ms_MY;
  -[RKSentenceClassifier classifySentence](&v18, sel_classifySentence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __46__RKSentenceClassifier_ms_MY_classifySentence__block_invoke;
    v16[3] = &unk_24C6AED50;
    v17 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);

  }
  if (objc_msgSend(v3, "sentenceType") == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("word == 'boleh'"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
      objc_msgSend(v3, "setSentenceType:", 4);

  }
  if (objc_msgSend(v3, "sentenceType") == 11)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("word == 'anda'"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "filteredArrayUsingPredicate:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
      objc_msgSend(v3, "setSentenceType:", 12);

  }
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier appreciations](self, "appreciations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14)
      objc_msgSend(v3, "setSentenceType:", 34);
  }
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 1);
  }
  return v3;
}

@end
