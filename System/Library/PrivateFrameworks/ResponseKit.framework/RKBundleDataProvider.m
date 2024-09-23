@implementation RKBundleDataProvider

- (RKBundleDataProvider)init
{
  -[RKBundleDataProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return self;
}

- (RKBundleDataProvider)initWithBundle:(id)a3
{
  id v5;
  RKBundleDataProvider *v6;
  RKBundleDataProvider *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *assetPlistURL;
  uint64_t v12;
  NSMutableDictionary *displayStringsByPlatformByLanguage;
  uint64_t v14;
  NSMutableDictionary *polarityMapsByLanguageID;
  RKAssets *v16;
  RKAssets *assets;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)RKBundleDataProvider;
  v6 = -[RKBundleDataProvider init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundle, a3);
    v8 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("RKAssetsConstantClasses"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    assetPlistURL = v7->_assetPlistURL;
    v7->_assetPlistURL = (NSURL *)v10;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    displayStringsByPlatformByLanguage = v7->_displayStringsByPlatformByLanguage;
    v7->_displayStringsByPlatformByLanguage = (NSMutableDictionary *)v12;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    polarityMapsByLanguageID = v7->_polarityMapsByLanguageID;
    v7->_polarityMapsByLanguageID = (NSMutableDictionary *)v14;

    v16 = objc_alloc_init(RKAssets);
    assets = v7->_assets;
    v7->_assets = v16;

  }
  return v7;
}

- (RKBundleDataProvider)initWithAssetPlist:(id)a3
{
  id v5;
  RKBundleDataProvider *v6;
  RKBundleDataProvider *v7;
  NSBundle *bundle;
  uint64_t v9;
  NSMutableDictionary *displayStringsByPlatformByLanguage;
  uint64_t v11;
  NSMutableDictionary *polarityMapsByLanguageID;
  RKAssets *v13;
  void *v14;
  uint64_t v15;
  RKAssets *assets;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)RKBundleDataProvider;
  v6 = -[RKBundleDataProvider init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    bundle = v6->_bundle;
    v6->_bundle = 0;

    objc_storeStrong((id *)&v7->_assetPlistURL, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    displayStringsByPlatformByLanguage = v7->_displayStringsByPlatformByLanguage;
    v7->_displayStringsByPlatformByLanguage = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    polarityMapsByLanguageID = v7->_polarityMapsByLanguageID;
    v7->_polarityMapsByLanguageID = (NSMutableDictionary *)v11;

    v13 = [RKAssets alloc];
    objc_msgSend(v5, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[RKAssets initWithPlistURL:](v13, "initWithPlistURL:", v14);
    assets = v7->_assets;
    v7->_assets = (RKAssets *)v15;

  }
  return v7;
}

- (id)stringsFromTable:(id)a3 forLanguageIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[RKAssets localizedStrings](RKAssets, "localizedStrings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v6;
  v9 = (void *)MEMORY[0x24BDD1488];
  v30[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferredLocalizationsFromArray:forPreferences:", &unk_24C715E48, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(&unk_24C715E30, "containsObject:", v12);

  v14 = v8;
  if (v13)
  {
    v15 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredLocalizationsFromArray:forPreferences:", &unk_24C715E60, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("yue")))
    {

      v14 = CFSTR("zh_HK");
    }
  }
  v18 = CFSTR("zh_CN");
  if ((-[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("zh-Hans")) & 1) == 0
    && !-[__CFString hasPrefix:](v14, "hasPrefix:", CFSTR("zh_Hans")))
  {
    v18 = v14;
  }
  v19 = v18;

  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("ko"));

  if (v22)
  {

    v19 = CFSTR("ko");
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR(".strings"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".strings"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (__CFString *)v26;
  }

  return v25;
}

- (id)displayStringsForPlatform:(id)a3 languageID:(id)a4
{
  id v6;
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
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  void *v32;
  RKBundleDataProvider *v33;
  id v34;
  id v35;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLanguageIdentifierFromString:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RKBundleDataProvider displayStringsByPlatformByLanguage](self, "displayStringsByPlatformByLanguage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RKBundleDataProvider displayStringsByPlatformByLanguage](self, "displayStringsByPlatformByLanguage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v6);

  }
  -[RKBundleDataProvider displayStringsByPlatformByLanguage](self, "displayStringsByPlatformByLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[RKBundleDataProvider stringsFromTable:forLanguageIdentifier:](self, "stringsFromTable:forLanguageIdentifier:", v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RKUtilities canonicalLanguageAndScriptCodeIdentifierForIdentifier:](RKUtilities, "canonicalLanguageAndScriptCodeIdentifierForIdentifier:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v16) & 1) != 0 || objc_msgSend(v15, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF != ''"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RKBundleDataProvider displayStringsByPlatformByLanguage](self, "displayStringsByPlatformByLanguage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v7);

      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __61__RKBundleDataProvider_displayStringsForPlatform_languageID___block_invoke;
      v31 = &unk_24C6AFDC8;
      v32 = v17;
      v33 = self;
      v34 = v6;
      v35 = v7;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", &v28);

      v22 = v32;
    }
    else
    {
      -[RKBundleDataProvider displayStringsForPlatform:languageID:](self, "displayStringsForPlatform:languageID:", v6, v16);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      -[RKBundleDataProvider displayStringsByPlatformByLanguage](self, "displayStringsByPlatformByLanguage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, v7);

    }
  }
  -[RKBundleDataProvider displayStringsByPlatformByLanguage](self, "displayStringsByPlatformByLanguage", v28, v29, v30, v31);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

void __61__RKBundleDataProvider_displayStringsForPlatform_languageID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = (void *)MEMORY[0x24BDBCEB8];
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __61__RKBundleDataProvider_displayStringsForPlatform_languageID___block_invoke_2;
  v14[3] = &unk_24C6AEE68;
  v15 = *(id *)(a1 + 32);
  v16 = v8;
  v13 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  objc_msgSend(*(id *)(a1 + 40), "displayStringsByPlatformByLanguage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v7);

}

void __61__RKBundleDataProvider_displayStringsForPlatform_languageID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a2;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "filteredArrayUsingPredicate:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 8, 1);
}

- (RKAssets)assets
{
  return (RKAssets *)objc_getProperty(self, a2, 16, 1);
}

- (NSURL)assetPlistURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)displayStringsByPlatformByLanguage
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)polarityMapsByLanguageID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableDictionary)localizationsByLanguageID
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLocalizationsByLanguageID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizationsByLanguageID, 0);
  objc_storeStrong((id *)&self->_polarityMapsByLanguageID, 0);
  objc_storeStrong((id *)&self->_displayStringsByPlatformByLanguage, 0);
  objc_storeStrong((id *)&self->_assetPlistURL, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
