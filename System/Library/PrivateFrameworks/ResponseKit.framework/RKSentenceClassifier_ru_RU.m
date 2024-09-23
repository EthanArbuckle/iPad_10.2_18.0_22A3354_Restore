@implementation RKSentenceClassifier_ru_RU

- (id)alternativeConjunctions
{
  return &unk_24C715D58;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_ru_RU;
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
  v2.super_class = (Class)RKSentenceClassifier_ru_RU;
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
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)RKSentenceClassifier_ru_RU;
  -[RKSentenceClassifier classifySentence](&v12, sel_classifySentence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__RKSentenceClassifier_ru_RU_classifySentence__block_invoke;
    v10[3] = &unk_24C6AED50;
    v11 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v10);

  }
  if (objc_msgSend(v3, "sentenceType") == 11)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("(string == 'ты' || string == 'вы')"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKSentenceClassifier sentenceEntities](self, "sentenceEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "filteredArrayUsingPredicate:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
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
