@implementation NSLocale(WBSNSLocaleExtras)

+ (id)safari_localeIdentifiersForMostWidelyUsedLanguages
{
  if (safari_localeIdentifiersForMostWidelyUsedLanguages_onceToken != -1)
    dispatch_once(&safari_localeIdentifiersForMostWidelyUsedLanguages_onceToken, &__block_literal_global_23);
  return (id)safari_localeIdentifiersForMostWidelyUsedLanguages_identifiers;
}

- (__CFString)safari_localeStringInWebExtensionFormat
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  objc_msgSend(a1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "countryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "languageCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "countryCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "languageCode");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = &stru_1E64A2498;
  }
  return v8;
}

- (__CFString)safari_localeStringInOfflineSearchModelFormat
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;

  objc_msgSend(a1, "languageCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "countryCode");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length");

    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "languageCode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "countryCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lowercaseString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v6, v8);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(a1, "languageCode");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v9 = &stru_1E64A2498;
  }
  return v9;
}

@end
