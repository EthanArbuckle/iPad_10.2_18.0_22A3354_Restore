@implementation NSLocale(PKAdditions)

+ (id)pk_preferredLocale
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredLocalizations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (__CFString)pk_deviceLanguage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v0 = (void *)MEMORY[0x1E0CB34D0];
  PKPassKitBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredLocalizationsFromArray:forPreferences:", v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    v5 = CFSTR("en");
  v7 = v5;

  return v7;
}

@end
