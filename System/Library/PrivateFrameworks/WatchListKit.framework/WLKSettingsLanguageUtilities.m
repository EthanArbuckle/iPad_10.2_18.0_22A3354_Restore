@implementation WLKSettingsLanguageUtilities

+ (id)localizedNameForLanguageCodeInItsOwnLanguage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99DC8];
    v4 = a3;
    objc_msgSend(v3, "localeWithLocaleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKSettingsLanguageUtilities _localizedNameForLanguageCode:withLocale:](WLKSettingsLanguageUtilities, "_localizedNameForLanguageCode:withLocale:", v4, v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1E68AA228;
  }
  return v6;
}

+ (id)localizedNameForLanguageCode:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKSettingsLanguageUtilities _localizedNameForLanguageCode:withLocale:](WLKSettingsLanguageUtilities, "_localizedNameForLanguageCode:withLocale:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)userFacingLocalizedNameForLanguageCode:(id)a3 autoString:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("AUTO_SENTINEL_VALUE")))
  {
    v7 = v6;
  }
  else
  {
    +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:](WLKSettingsLanguageUtilities, "localizedNameForLanguageCode:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (!v7)
    v8 = v5;

  return v8;
}

+ (id)userFacingAudioLanguageTitles:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[WLKSettingsLanguageUtilities availableAudioLanguageCodes](WLKSettingsLanguageUtilities, "availableAudioLanguageCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        +[WLKSettingsLanguageUtilities userFacingLocalizedNameForLanguageCode:autoString:](WLKSettingsLanguageUtilities, "userFacingLocalizedNameForLanguageCode:autoString:", v10, v3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)availableAudioLanguageCodes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(&unk_1E68CA180, "mutableCopy");
  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supplementaryAvailableAudioLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v2, "containsObject:", v10) & 1) == 0)
          objc_msgSend(v2, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0x1E0C99000uLL;
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = v15;
  if (v12)
  {
    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("-"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v28 = v17;
      v29 = v12;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v19 = v2;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * j);
            if (objc_msgSend(v24, "hasPrefix:", v18, v28, v29, (_QWORD)v30))
              v25 = v14;
            else
              v25 = v16;
            objc_msgSend(v25, "addObject:", v24);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v21);
      }

      v17 = v28;
      v12 = v29;
      v13 = 0x1E0C99000;
    }
    else
    {
      objc_msgSend(v16, "addObjectsFromArray:", v2);
    }

  }
  else
  {
    objc_msgSend(v15, "addObjectsFromArray:", v2);
  }
  objc_msgSend(v14, "sortUsingComparator:", &__block_literal_global_17, v28, v29);
  objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_290);
  v26 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 3560)), "initWithArray:", v14);
  objc_msgSend(v26, "addObjectsFromArray:", v16);
  objc_msgSend(v26, "insertObject:atIndex:", CFSTR("AUTO_SENTINEL_VALUE"), 0);

  return v26;
}

uint64_t __59__WLKSettingsLanguageUtilities_availableAudioLanguageCodes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:](WLKSettingsLanguageUtilities, "localizedNameForLanguageCode:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:](WLKSettingsLanguageUtilities, "localizedNameForLanguageCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

uint64_t __59__WLKSettingsLanguageUtilities_availableAudioLanguageCodes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:](WLKSettingsLanguageUtilities, "localizedNameForLanguageCode:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKSettingsLanguageUtilities localizedNameForLanguageCode:](WLKSettingsLanguageUtilities, "localizedNameForLanguageCode:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

+ (id)_localizedNameForLanguageCode:(id)a3 withLocale:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0C997E0];
  objc_msgSend(v6, "displayNameForKey:value:", *MEMORY[0x1E0C997E0], v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[WLKSettingsLanguageUtilities _isSpecialSpokenLanguage:](WLKSettingsLanguageUtilities, "_isSpecialSpokenLanguage:", v5))
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        objc_msgSend(v9, "objectAtIndex:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v12, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v14;
      }
      objc_msgSend(v6, "displayNameForKey:value:", v7, v12);
      v15 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v15;
    }

  }
  objc_msgSend(v8, "capitalizedStringWithLocale:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (!v16)
    v16 = v5;
  v18 = v16;

  return v18;
}

+ (BOOL)_isSpecialSpokenLanguage:(id)a3
{
  return objc_msgSend(a3, "containsString:", CFSTR("cmn"));
}

@end
