@implementation WFAttribution

+ (id)sharedAttribution
{
  if (sharedAttribution_onceToken != -1)
    dispatch_once(&sharedAttribution_onceToken, &__block_literal_global_29);
  return (id)sharedAttribution_attribution;
}

void __34__WFAttribution_sharedAttribution__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedAttribution_attribution;
  sharedAttribution_attribution = v0;

}

- (NSURL)sourceAttributionURL
{
  return (NSURL *)objc_msgSend((id)objc_opt_class(), "platformSpecializedWeatherSourceAttributionURLForTrafficParameter:", 0);
}

- (NSString)localizedSourceAttribution
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WFAttributionSourceLocalizedAttributionString"), CFSTR("Weather Foundation Unlocalized Source Attribution String"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)sourceName
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("WFAttributionSourceName"), CFSTR("Weather Foundation Unlocalized Source Name"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)sourceAttributionImageForStyle:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 > 2)
    return 0;
  v3 = off_24CCA2848[a3];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v4 = (void *)getUIImageClass_softClass_0;
  v13 = getUIImageClass_softClass_0;
  if (!getUIImageClass_softClass_0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __getUIImageClass_block_invoke_0;
    v9[3] = &unk_24CCA17D8;
    v9[4] = &v10;
    __getUIImageClass_block_invoke_0((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)weatherSourceAttributionURLForTrafficParameter:(id)a3
{
  __CFString *v3;
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
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("http://www.weather.com/wx/today/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v3, "length"))
  {

    v3 = CFSTR("TWC");
  }
  v22 = v3;
  v5 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(CFSTR("apple_"), "stringByAppendingString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryItemWithName:value:", CFSTR("par"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%@"), v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("locale"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryItems");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = (void *)MEMORY[0x24BDBD1A8];
  v23[0] = v7;
  v23[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryItems:", v19);

  objc_msgSend(v4, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)platformSpecializedWeatherSourceAttributionURLForTrafficParameter:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;

  v4 = a3;
  if (platformSpecializedWeatherSourceAttributionURLForTrafficParameter__onceToken != -1)
    dispatch_once(&platformSpecializedWeatherSourceAttributionURLForTrafficParameter__onceToken, &__block_literal_global_32);
  objc_msgSend(getUIApplicationClass(), "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canOpenURL:", platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPadURL);

  if (v6)
  {
    v7 = (void *)platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPadURL;
  }
  else
  {
    objc_msgSend(getUIApplicationClass(), "sharedApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canOpenURL:", platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPhoneURL);

    if (!v9)
    {
      objc_msgSend(a1, "weatherSourceAttributionURLForTrafficParameter:", v4);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v7 = (void *)platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPhoneURL;
  }
  v10 = v7;
LABEL_9:
  v11 = v10;

  return v11;
}

void __83__WFAttribution_platformSpecializedWeatherSourceAttributionURLForTrafficParameter___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("twcweather://now"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPhoneURL;
  platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPhoneURL = v0;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("twc://now"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPadURL;
  platformSpecializedWeatherSourceAttributionURLForTrafficParameter__sTWCAppiPadURL = v2;

}

@end
