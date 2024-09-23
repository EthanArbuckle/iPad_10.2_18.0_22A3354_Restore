@implementation NSLocale(Display)

- (id)wf_displayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "length");

  if (!v3)
    return v3;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForLanguageCode:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "capitalizedString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "wf_subname");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "languageIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("zh-Hans")))
  {

LABEL_5:
    WFLocalizedString(CFSTR("Chinese"));
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
    goto LABEL_6;
  }
  objc_msgSend(a1, "languageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("zh-Hant"));

  if (v10)
    goto LABEL_5;
LABEL_6:
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v3, v7);
    v12 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v12;
  }

  return v3;
}

- (id)wf_subname
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  objc_msgSend(a1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {

  }
  else
  {
    objc_msgSend(a1, "countryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (!v4)
    {
      v9 = 0;
      return v9;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(&unk_1E7B8DAC0, "containsObject:", v6);

  if (!v7)
  {
    v9 = 0;
    goto LABEL_13;
  }
  objc_msgSend(a1, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForRegion:context:short:", v8, 3, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "languageIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("zh-Hant")) & 1) != 0
    || objc_msgSend(v10, "hasPrefix:", CFSTR("zh-TW")))
  {
    objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isChineseRegionCelluarDevice");

    if (v12)
      v13 = CFSTR("Mandarin - Taiwan (China)");
    else
      v13 = CFSTR("Mandarin - Taiwan");
  }
  else
  {
    if ((objc_msgSend(v10, "hasPrefix:", CFSTR("zh-Hans")) & 1) == 0
      && !objc_msgSend(v10, "hasPrefix:", CFSTR("zh-CN")))
    {
      goto LABEL_11;
    }
    v13 = CFSTR("Mandarin - China mainland");
  }
  WFLocalizedString(v13);
  v14 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v14;
LABEL_11:

LABEL_13:
  objc_msgSend(a1, "languageCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(&unk_1E7B8DAD8, "containsObject:", v15);

  if (v16)
  {
    objc_msgSend(a1, "countryCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForRegion:context:short:", v17, 3, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v18;
  }

  return v9;
}

@end
