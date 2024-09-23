@implementation SCUIMoreHelpWebResources

+ (id)learnMoreAboutCommunicationSafetyURL
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/kb/HT212850"));
}

+ (id)learnMoreAboutSensitiveContentWarningURL
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/kb/HT213834"));
}

+ (id)waysToGetHelpURL
{
  return +[SCUIMoreHelpWebResources waysToGetHelpURLForInterventionType:](SCUIMoreHelpWebResources, "waysToGetHelpURLForInterventionType:", SCUICurrentInterventionType());
}

+ (id)waysToGetHelpURLForInterventionType:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  +[SCUIMoreHelpWebResources validLanguageCountryPairings](SCUIMoreHelpWebResources, "validLanguageCountryPairings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCUIMoreHelpWebResources defaultLanguageForCountryPairings](SCUIMoreHelpWebResources, "defaultLanguageForCountryPairings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 > 2)
    v6 = 0;
  else
    v6 = off_2516EC6E8[a3];
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryAuthKitAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "appleIDCountryCodeForAccount:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "languageCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && v13)
  {
    objc_msgSend(v4, "objectForKey:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = objc_msgSend(v14, "containsObject:", v13);
      v17 = (void *)MEMORY[0x24BDD17C8];
      if (v16)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v13, v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v5, "objectForKey:", v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%@"), v19, v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v18);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)validLanguageCountryPairings
{
  id v2;
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("br"), 0);
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("br"));

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("en"), CFSTR("fr"), 0);
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("ca"));

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("en"), CFSTR("es"), 0);
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("us"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("jp"), 0);
  objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("jp"));

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("ko"), 0);
  objc_msgSend(v2, "setValue:forKey:", v7, CFSTR("kr"));

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("fr"), CFSTR("nl"), 0);
  objc_msgSend(v2, "setValue:forKey:", v8, CFSTR("be"));

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("en"), CFSTR("fr"), 0);
  objc_msgSend(v2, "setValue:forKey:", v9, CFSTR("fr"));

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("en"), CFSTR("de"), 0);
  objc_msgSend(v2, "setValue:forKey:", v10, CFSTR("de"));

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("en"), 0);
  objc_msgSend(v2, "setValue:forKey:", v11, CFSTR("gb"));

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("it"), 0);
  objc_msgSend(v2, "setValue:forKey:", v12, CFSTR("it"));

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("nl"), 0);
  objc_msgSend(v2, "setValue:forKey:", v13, CFSTR("nl"));

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("es"), 0);
  objc_msgSend(v2, "setValue:forKey:", v14, CFSTR("es"));

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("sv"), 0);
  objc_msgSend(v2, "setValue:forKey:", v15, CFSTR("se"));

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("en"), 0);
  objc_msgSend(v2, "setValue:forKey:", v16, CFSTR("au"));

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", CFSTR("en"), 0);
  objc_msgSend(v2, "setValue:forKey:", v17, CFSTR("nz"));

  return v2;
}

+ (id)defaultLanguageForCountryPairings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v2, "setValue:forKey:", CFSTR("br"), CFSTR("br"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("ca"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("us"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("jp"), CFSTR("jp"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("ko"), CFSTR("kr"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("fr"), CFSTR("be"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("fr"), CFSTR("fr"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("de"), CFSTR("de"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("gb"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("it"), CFSTR("it"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("nl"), CFSTR("nl"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("es"), CFSTR("es"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("sv"), CFSTR("se"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("au"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("nz"));
  return v2;
}

@end
