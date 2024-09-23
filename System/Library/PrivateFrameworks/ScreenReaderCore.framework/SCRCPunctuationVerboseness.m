@implementation SCRCPunctuationVerboseness

+ (id)punctuationKeyForString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%04hx"), objc_msgSend(v3, "characterAtIndex:", 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)punctuationDictionaryForLevel:(int64_t)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if ((unint64_t)a3 > 2)
    v3 = 0;
  else
    v3 = (uint64_t)*(&off_24CB255E0 + a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(v4, "URLForResource:withExtension:", v3, CFSTR("scrconfig"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithContentsOfURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)userExposedPunctuationCharacters
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SCRCPunctuationVerboseness_userExposedPunctuationCharacters__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userExposedPunctuationCharacters_onceToken != -1)
    dispatch_once(&userExposedPunctuationCharacters_onceToken, block);
  return (id)userExposedPunctuationCharacters_Keys;
}

void __62__SCRCPunctuationVerboseness_userExposedPunctuationCharacters__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x24BDBCE70];
  objc_msgSend(v5, "URLForResource:withExtension:", CFSTR("SCRCPunctuation_UserExposed"), CFSTR("scrconfig"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dictionaryWithContentsOfURL:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)userExposedPunctuationCharacters_Keys;
  userExposedPunctuationCharacters_Keys = v3;

}

+ (id)verbosenessDictionaryForLevel:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SCRCPunctuationVerboseness_verbosenessDictionaryForLevel___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (verbosenessDictionaryForLevel__once != -1)
    dispatch_once(&verbosenessDictionaryForLevel__once, block);
  v4 = (void *)verbosenessDictionaryForLevel__verbosenessDictionariesForLevels;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __60__SCRCPunctuationVerboseness_verbosenessDictionaryForLevel___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "punctuationDictionaryForLevel:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "punctuationDictionaryForLevel:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "punctuationDictionaryForLevel:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v2, &unk_24CB30618);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v3);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, &unk_24CB30630);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:", v4);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, &unk_24CB30648);

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v11);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)verbosenessDictionaryForLevel__verbosenessDictionariesForLevels;
  verbosenessDictionaryForLevel__verbosenessDictionariesForLevels = v9;

}

@end
