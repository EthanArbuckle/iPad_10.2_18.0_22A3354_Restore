@implementation _LTTranslationStatistics(Daemon)

+ (uint64_t)_countWithTokenString:()Daemon countCharacters:
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if ((a4 & 1) != 0)
  {
    objc_msgSend(a3, "_ltRemoveAllWhitespaces");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
  }
  else
  {
    objc_msgSend(a3, "_ltTrimWhitespaces");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count");

  }
  return v5;
}

+ (id)statisticsWithEngineMeta:()Daemon locale:
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t IsCharacterBasedLocale;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BDF64C0];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  IsCharacterBasedLocale = _LTPreferencesIsCharacterBasedLocale(v8);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstleg sentencepiece encoder input"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sentencepiece encoder input"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  if (objc_msgSend(v14, "length"))
    objc_msgSend(v9, "setInputTokenCount:", objc_msgSend(a1, "_countWithTokenString:countCharacters:", v14, IsCharacterBasedLocale));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("firstleg sentencepiece decoder output"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v17 = v15;
  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sentencepiece decoder output"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;

  if (objc_msgSend(v18, "length"))
    objc_msgSend(v9, "setInputSubtokenCount:", objc_msgSend(a1, "_countWithTokenString:countCharacters:", v18, IsCharacterBasedLocale));

  return v9;
}

- (void)copyWithZone:()Daemon
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setInputTokenCount:", objc_msgSend(a1, "inputTokenCount"));
  objc_msgSend(v4, "setInputSubtokenCount:", objc_msgSend(a1, "inputSubtokenCount"));
  return v4;
}

@end
