@implementation NSLocale(TPSCoreAdditions)

+ (id)tps_userLanguageCode
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "tps_userPreferredLocalizations");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)tps_userPreferredLocalizations
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tps_userPreferredLocalizationsForLanguages:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)tps_userPreferredLocalizationsForLanguages:()TPSCoreAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB34D0];
  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "systemLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLocalizationsFromArray:forPreferences:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
