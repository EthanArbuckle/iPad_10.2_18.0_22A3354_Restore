@implementation NSLocale(TIExtras)

+ (id)localeForBundleLanguage:()TIExtras
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(a3, "preferredLocalizations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "canonicalLanguageIdentifierFromString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v6);
  else
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
