@implementation NSExtension(SiriUI)

- (id)siriui_displayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
    v3 = (void *)MEMORY[0x24BDC1538];
    v4 = (void *)MEMORY[0x24BDC1588];
    objc_msgSend(a1, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pluginKitProxyForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containingBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applicationProxyForIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "localizedName");
    v10 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v10;
  }
  return v2;
}

- (uint64_t)siriui_iconImage
{
  return objc_msgSend(a1, "_siriui_iconImageWithFormat:", 5);
}

- (id)_siriui_iconImageWithFormat:()SiriUI
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  v7 = v6;

  objc_msgSend(a1, "_siriui_extensionIconImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_applicationIconImageForFormat:precomposed:scale:", a3, 0, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDF6AC8];
    v12 = (void *)MEMORY[0x24BDC1588];
    objc_msgSend(a1, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "pluginKitProxyForIdentifier:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_iconForResourceProxy:format:", v14, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (id)_siriui_extensionIconImage
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

  if (!SiriUISystemLanguageIsRTL()
    || (objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("CFBundleIconFilesRightToLeft")),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "objectForInfoDictionaryKey:", CFSTR("CFBundleIconFiles"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v2, "count"))
  {
    v3 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v2, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDD1488];
    v6 = (void *)MEMORY[0x24BDC1588];
    objc_msgSend(a1, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pluginKitProxyForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageNamed:inBundle:", v4, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
