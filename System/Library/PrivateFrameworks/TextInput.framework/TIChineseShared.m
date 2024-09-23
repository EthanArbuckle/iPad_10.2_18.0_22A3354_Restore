@implementation TIChineseShared

+ (id)validFuzzyPinyinPairs
{
  if (validFuzzyPinyinPairs___onceToken != -1)
    dispatch_once(&validFuzzyPinyinPairs___onceToken, &__block_literal_global_1062);
  return (id)validFuzzyPinyinPairs___validFuzzyPinyinPairs;
}

+ (id)defaultFuzzyPinyinPairs
{
  if (defaultFuzzyPinyinPairs___onceToken != -1)
    dispatch_once(&defaultFuzzyPinyinPairs___onceToken, &__block_literal_global_50);
  return (id)defaultFuzzyPinyinPairs___defaultFuzzyPinyinPairs;
}

void __42__TIChineseShared_defaultFuzzyPinyinPairs__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("z"), CFSTR("zh"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("s"), CFSTR("sh"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("c"), CFSTR("ch"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("an"), CFSTR("ang"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en"), CFSTR("eng"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("in"), CFSTR("ing"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithObjects:", v8, v1, v2, v3, v4, v5, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)defaultFuzzyPinyinPairs___defaultFuzzyPinyinPairs;
  defaultFuzzyPinyinPairs___defaultFuzzyPinyinPairs = v6;

}

void __40__TIChineseShared_validFuzzyPinyinPairs__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
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
  void *v13;
  void *v14;
  void *v15;

  v12 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("z"), CFSTR("zh"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("s"), CFSTR("sh"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("c"), CFSTR("ch"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("an"), CFSTR("ang"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("en"), CFSTR("eng"), 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("in"), CFSTR("ing"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("ian"), CFSTR("iang"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("uan"), CFSTR("uang"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("n"), CFSTR("l"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("r"), CFSTR("l"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("h"), CFSTR("f"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("hui"), CFSTR("fei"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("huang"), CFSTR("wang"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithObjects:", v15, v11, v14, v13, v0, v1, v2, v3, v4, v5, v6, v7, v8, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)validFuzzyPinyinPairs___validFuzzyPinyinPairs;
  validFuzzyPinyinPairs___validFuzzyPinyinPairs = v9;

}

@end
