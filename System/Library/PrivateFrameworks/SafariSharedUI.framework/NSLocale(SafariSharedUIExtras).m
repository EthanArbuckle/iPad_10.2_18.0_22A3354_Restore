@implementation NSLocale(SafariSharedUIExtras)

+ (id)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras usingLanguageForLocalization:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E547C348);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
  else
    objc_msgSend(a1, "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "safari_baseLanguageFromLanguage:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "containsObject:", v10)
    || (objc_msgSend(v9, "localizedStringForLocaleIdentifier:", v10),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v9, "localizedStringForLanguageCode:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "capitalizedStringWithLocale:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras inNativeLanguage:
{
  void *v5;
  id v6;
  void *v7;

  if (a4)
    v5 = a3;
  else
    v5 = 0;
  v6 = a3;
  objc_msgSend(a1, "safari_displayNameForLocaleIdentifier:usingLanguageForLocalization:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)safari_displayNameForLocaleIdentifier:()SafariSharedUIExtras
{
  return objc_msgSend(a1, "safari_displayNameForLocaleIdentifier:inNativeLanguage:", a3, 0);
}

+ (uint64_t)safari_currentLocaleHasSameBaseLanguageAsLocaleIdentifier:()SafariSharedUIExtras
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(a1, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_baseLanguageFromLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "safari_baseLanguageFromLanguage:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "isEqualToString:", v9);
  return v10;
}

+ (id)safari_baseLanguageFromLanguage:()SafariSharedUIExtras
{
  __CFString *v3;
  void *v4;
  id v5;

  v3 = a3;
  if (safari_baseLanguageFromLanguage__once != -1)
    dispatch_once(&safari_baseLanguageFromLanguage__once, &__block_literal_global_63);
  if (!v3)
    v3 = &stru_1E5449658;
  os_unfair_lock_lock((os_unfair_lock_t)&safari_baseLanguageFromLanguage__lock);
  objc_msgSend((id)safari_baseLanguageFromLanguage__cache, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&safari_baseLanguageFromLanguage__lock);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&safari_baseLanguageFromLanguage__lock);
      objc_msgSend((id)safari_baseLanguageFromLanguage__cache, "setObject:forKeyedSubscript:", v4, v3);
      os_unfair_lock_unlock((os_unfair_lock_t)&safari_baseLanguageFromLanguage__lock);
    }
  }
  v5 = v4;

  return v5;
}

@end
