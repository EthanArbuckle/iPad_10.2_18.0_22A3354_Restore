@implementation SCRCMathNumberExpression

- (BOOL)isNumber
{
  return 1;
}

- (id)speakableDescriptionWithSpeakingStyle:(int64_t)a3 arePausesAllowed:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;

  v5 = (void *)MEMORY[0x24BDD1458];
  -[SCRCMathSimpleExpression content](self, "content", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrcStringWithString:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SCRCMathSimpleExpression content](self, "content");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "length") > 5)
    goto LABEL_4;
  -[SCRCMathSimpleExpression content](self, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsString:", CFSTR(".")))
  {

LABEL_4:
    goto LABEL_5;
  }
  -[SCRCMathSimpleExpression content](self, "content");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "containsString:", CFSTR(","));

  if ((v22 & 1) == 0)
    goto LABEL_10;
LABEL_5:
  v10 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  -[SCRCMathSimpleExpression content](self, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberFromString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v18 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathSimpleExpression content](self, "content");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "scrcStringWithString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
    goto LABEL_15;
  }
  objc_msgSend(v10, "setNumberStyle:", 5);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLocale:", v13);

  objc_msgSend(v10, "stringFromNumber:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v27 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathSimpleExpression content](self, "content");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "scrcStringWithString:", v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  v15 = v14;
  objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(" "));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1458], "scrcStringWithString:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v7 = (id)v17;
LABEL_10:
  if (-[SCRCMathSimpleExpression isImplicit](self, "isImplicit"))
  {
    v23 = (void *)MEMORY[0x24BDD1458];
    -[SCRCMathExpression localizedStringForKey:](self, "localizedStringForKey:", CFSTR("implicit.decoration"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCRCMathExpression localizedAttributedStringForKey:](self, "localizedAttributedStringForKey:", CFSTR("implicit"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scrcStringWithFormat:", v24, v25, v7);
    v26 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v26;
  }
  v7 = v7;
  v20 = v7;
LABEL_15:

  return v20;
}

- (id)mathMLString
{
  void *v2;
  void *v3;

  -[SCRCMathSimpleExpression content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWrappedInMathMLTag:", CFSTR("mn"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
