@implementation RKSentenceClassifier_zh_Hans_CN

- (id)alternativeConjunctions
{
  return &unk_24C715CB0;
}

- (id)addSentenceTerminatorQuestion:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RKSentenceClassifier_zh_Hans_CN;
  -[RKSentenceClassifier addSentenceTerminatorQuestion:](&v6, sel_addSentenceTerminatorQuestion_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("？"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)analyzeSentence
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RKSentenceClassifier_zh_Hans_CN;
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
  v8.super_class = (Class)RKSentenceClassifier_zh_Hans_CN;
  -[RKSentenceClassifier classifySentence](&v8, sel_classifySentence);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "sentenceType"))
  {
    -[RKSentenceClassifier interrogatives](self, "interrogatives");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __51__RKSentenceClassifier_zh_Hans_CN_classifySentence__block_invoke;
    v6[3] = &unk_24C6AED50;
    v7 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
  if (objc_msgSend(v3, "sentenceType") == 31
    && -[RKSentenceClassifier sentenceIsTerminated](self, "sentenceIsTerminated")
    && !-[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 0);
  }
  if (!objc_msgSend(v3, "sentenceType")
    && -[RKSentenceClassifier sentenceHasQuestionTerminator](self, "sentenceHasQuestionTerminator"))
  {
    objc_msgSend(v3, "setSentenceType:", 1);
  }
  return v3;
}

@end
