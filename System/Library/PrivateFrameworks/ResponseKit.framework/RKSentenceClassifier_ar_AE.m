@implementation RKSentenceClassifier_ar_AE

- (id)alternativeConjunctions
{
  return &unk_24C715B60;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR("؟")) & 1) != 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)RKSentenceClassifier_ar_AE;
    -[RKSentenceClassifier addSentenceTerminatorQuestion:](&v8, sel_addSentenceTerminatorQuestion_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)RKSentenceClassifier_ar_AE;
    -[RKSentenceClassifier addSentenceTerminatorQuestion:](&v9, sel_addSentenceTerminatorQuestion_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingString:", CFSTR("؟"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v6;
  }

  return v5;
}

- (void)analyzeSentence
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RKSentenceClassifier_ar_AE;
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
  v8.super_class = (Class)RKSentenceClassifier_ar_AE;
  -[RKSentenceClassifier classifySentence](&v8, sel_classifySentence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__RKSentenceClassifier_ar_AE_classifySentence__block_invoke;
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
