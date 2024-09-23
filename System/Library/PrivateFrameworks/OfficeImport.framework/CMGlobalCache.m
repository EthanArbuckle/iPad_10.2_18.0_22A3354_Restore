@implementation CMGlobalCache

+ (void)initGlobalCache
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("gColorPropertyCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("gLengthPropertyCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("gBorderStyleCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "threadDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("gBorderWidthCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "threadDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("gCssStylesheetCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "threadDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("gDrawableElementCache"));

}

+ (id)colorPropertyCache
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("gColorPropertyCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)drawableElementCache
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("gDrawableElementCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)lengthPropertyCache
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("gLengthPropertyCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)releaseGlobalCache
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", 0, CFSTR("gColorPropertyCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", 0, CFSTR("gLengthPropertyCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "threadDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", 0, CFSTR("gBorderStyleCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", 0, CFSTR("gBorderWidthCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", 0, CFSTR("gCssStylesheetCache"));

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", 0, CFSTR("gDrawableElementCache"));

}

+ (id)borderStyleCache
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("gBorderStyleCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)borderWidthCache
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("gBorderWidthCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)cssStylesheetCache
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("gCssStylesheetCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
