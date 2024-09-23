@implementation RKSentenceClassifier_tr_TR

- (id)alternativeConjunctions
{
  return &unk_24C7158C0;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_tr_TR;
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
  v2.super_class = (Class)RKSentenceClassifier_tr_TR;
  -[RKSentenceClassifier analyzeSentence](&v2, sel_analyzeSentence);
}

- (id)classifySentence
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RKSentenceClassifier_tr_TR;
  -[RKSentenceClassifier classifySentence](&v19, sel_classifySentence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __46__RKSentenceClassifier_tr_TR_classifySentence__block_invoke;
    v17[3] = &unk_24C6AED50;
    v18 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v17);

  }
  if (!objc_msgSend(v3, "sentenceType"))
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("m[ıiuü][ ]*\\?"), 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceString](self, "sentenceString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceString](self, "sentenceString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v7, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = 3;
    }
    else
    {
      if (!-[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
      {
LABEL_9:

        goto LABEL_10;
      }
      v9 = 1;
    }
    objc_msgSend(v3, "setSentenceType:", v9);
    goto LABEL_9;
  }
LABEL_10:
  if (objc_msgSend(v3, "sentenceType") == 11)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(string == 'neredesin')"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredArrayUsingPredicate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
      objc_msgSend(v3, "setSentenceType:", 12);

  }
  if (!objc_msgSend(v3, "sentenceType") || objc_msgSend(v3, "sentenceType") == 31)
  {
    -[RKSentenceClassifier appreciations](self, "appreciations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
      objc_msgSend(v3, "setSentenceType:", 34);
  }
  return v3;
}

@end
