@implementation RKSentenceClassifier_es_ES

- (id)alternativeConjunctions
{
  return &unk_24C715BA8;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)RKSentenceClassifier_es_ES;
  -[RKSentenceClassifier addSentenceTerminatorQuestion:](&v7, sel_addSentenceTerminatorQuestion_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("¿%@?"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)analyzeSentence
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RKSentenceClassifier_es_ES;
  -[RKSentenceClassifier analyzeSentence](&v2, sel_analyzeSentence);
}

- (id)classifySentence
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RKSentenceClassifier_es_ES;
  -[RKSentenceClassifier classifySentence](&v8, sel_classifySentence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__RKSentenceClassifier_es_ES_classifySentence__block_invoke;
    v6[3] = &unk_24C6AED50;
    v7 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 1);
  }
  return v3;
}

@end
