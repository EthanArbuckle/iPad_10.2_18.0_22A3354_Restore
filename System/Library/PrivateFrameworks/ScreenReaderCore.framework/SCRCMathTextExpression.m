@implementation SCRCMathTextExpression

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc(MEMORY[0x24BDD1458]);
  -[SCRCMathSimpleExpression content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("kSCRCMathStringAttributeIsNonTechnicalText");
  v11[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v6, v7);

  return v8;
}

- (id)mathMLString
{
  void *v2;
  void *v3;

  -[SCRCMathSimpleExpression content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWrappedInMathMLTag:", CFSTR("mtext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)latexDescriptionInMathMode:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  -[SCRCMathSimpleExpression content](self, "content");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\\text{%@}"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

@end
