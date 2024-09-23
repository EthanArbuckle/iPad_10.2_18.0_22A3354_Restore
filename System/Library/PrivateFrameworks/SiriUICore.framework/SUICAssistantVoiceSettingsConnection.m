@implementation SUICAssistantVoiceSettingsConnection

- (BOOL)languageHasVoiceVariations:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[SUICAssistantVoiceSettingsConnection getAvailableVoicesForLanguage:](self, "getAvailableVoicesForLanguage:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = (unint64_t)objc_msgSend(v5, "count") > 1;
  return (char)v3;
}

BOOL __67__SUICAssistantVoiceSettingsConnection_languageHasVoiceVariations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isCustom"))
  {
    objc_msgSend(v2, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)getAvailableVoicesForLanguage:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cachedAvailableVoices;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
  {
    v6 = self->_cachedAvailableVoices;
    objc_sync_enter(v6);
    cachedAvailableVoices = self->_cachedAvailableVoices;
    if (!cachedAvailableVoices)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_cachedAvailableVoices;
      self->_cachedAvailableVoices = v8;

      cachedAvailableVoices = self->_cachedAvailableVoices;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](cachedAvailableVoices, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CFEAC0], "allVoicesForSiriSessionLanguage:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3880];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__SUICAssistantVoiceSettingsConnection_getAvailableVoicesForLanguage___block_invoke;
      v18[3] = &unk_1E4A557A0;
      v13 = v4;
      v19 = v13;
      objc_msgSend(v12, "predicateWithBlock:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredArrayUsingPredicate:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        v16 = v15;
      else
        v16 = v5;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedAvailableVoices, "setObject:forKeyedSubscript:", v16, v13);

    }
    objc_sync_exit(v6);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedAvailableVoices, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __70__SUICAssistantVoiceSettingsConnection_getAvailableVoicesForLanguage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "languageCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)getAvailableDialectsForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathForResource:ofType:", CFSTR("AssistantVoiceDialects"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v3, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)languageHasVoiceSelection:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (-[SUICAssistantVoiceSettingsConnection languageHasVoiceVariations:](self, "languageHasVoiceVariations:", v4))
  {
    v5 = 1;
  }
  else
  {
    -[SUICAssistantVoiceSettingsConnection getAvailableDialectsForLanguage:](self, "getAvailableDialectsForLanguage:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v6, "count") > 1;

  }
  return v5;
}

- (id)_regionForLanguageIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99DC8];
  v4 = a3;
  objc_msgSend(v3, "_deviceLanguage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeWithLocaleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x1E0C997B0];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayNameForKey:value:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)dialectForLanguageIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("REGION_%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1E4A55AD0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_msgSend(v7, "isEqualToString:", v5) & 1) == 0)
  {
    v8 = v7;
  }
  else
  {
    -[SUICAssistantVoiceSettingsConnection _regionForLanguageIdentifier:](self, "_regionForLanguageIdentifier:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

+ (id)assistantLanguageTitlesDictionary
{
  void *v3;
  void *v4;
  void *v5;

  AFPreferencesSupportedLanguages();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "titlesForLanguageIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)titlesForLanguageIdentifiers:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  uint64_t v18;
  const __CFString *v19;
  unint64_t v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id obj;
  id obja;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = 0x1E0C99000uLL;
  v6 = (void *)MEMORY[0x1E0C99DC8];
  objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeWithLocaleIdentifier:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v45 = (id)objc_claimAutoreleasedReturnValue();
  v43 = a1;
  v52 = (void *)v8;
  objc_msgSend(a1, "shortTitlesForLanguageIdentifiers:deviceLanguageLocale:", v4, v8);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v64;
    v12 = *MEMORY[0x1E0C997E8];
    v55 = *MEMORY[0x1E0C997B0];
    v13 = CFSTR("zh");
    v50 = *MEMORY[0x1E0C997E8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v64 != v11)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
        objc_msgSend(*(id *)(v5 + 3528), "componentsFromLocaleIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKey:", v12);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](v17, "isEqualToString:", v13))
        {
          v18 = v11;
          v19 = v13;
          v20 = v5;
          objc_msgSend(v16, "objectForKey:", v55);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("HK"));

          if (v22)
          {

            v17 = CFSTR("yue");
          }
          v5 = v20;
          v13 = v19;
          v11 = v18;
          v12 = v50;
        }
        objc_msgSend(v53, "setObject:forKey:", v16, v15);
        objc_msgSend(v54, "addObject:", v17);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v10);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v44 = obj;
  v23 = v43;
  v49 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  if (v49)
  {
    v47 = *(_QWORD *)v60;
    v51 = *MEMORY[0x1E0C997E8];
    v46 = *MEMORY[0x1E0C997B0];
    do
    {
      for (j = 0; j != v49; ++j)
      {
        if (*(_QWORD *)v60 != v47)
          objc_enumerationMutation(v44);
        v25 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j);
        objc_msgSend(v53, "objectForKey:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", v51);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKey:", v46);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKey:", v25);
        obja = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "displayNameForKey:value:", v46, v28);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v27, "isEqualToString:", CFSTR("zh")))
        {
          if (objc_msgSend(v28, "isEqualToString:", CFSTR("HK")))
          {
            objc_msgSend(v52, "displayNameForKey:value:", v51, CFSTR("yue"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("MANDARIN_SPOKEN_DIALECT"), &stru_1E4A55AD0, 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        else if (objc_msgSend(v27, "isEqualToString:", CFSTR("yue"))
               && objc_msgSend(v28, "isEqualToString:", CFSTR("CN")))
        {
          objc_msgSend(v52, "displayNameForKey:value:", v51, CFSTR("yue"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "displayNameForKey:value:", v51, CFSTR("zh"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "capitalizeFirstPartOfCountry:", v30);
          v31 = objc_claimAutoreleasedReturnValue();

          obja = (id)v31;
        }
        else
        {
          v29 = 0;
        }
        if ((unint64_t)objc_msgSend(v54, "countForObject:", v27) < 2)
        {
          if (objc_msgSend(v27, "isEqualToString:", CFSTR("pt")))
          {
            v38 = v56;

            v29 = v38;
          }
          if (!v29)
          {
            v37 = obja;
            if (!v37)
              goto LABEL_38;
LABEL_37:
            objc_msgSend(v45, "setValue:forKey:", v37, v25);
            goto LABEL_38;
          }
          v39 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("LANGUAGE_WITH_REGION"), &stru_1E4A55AD0, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", v40, obja, v29);
          v37 = (id)objc_claimAutoreleasedReturnValue();

          v23 = v43;
          goto LABEL_32;
        }
        v33 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v29)
        {
          objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("LANGUAGE_WITH_REGION_AND_DIALECT"), &stru_1E4A55AD0, 0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", v36, obja, v29, v56);
          v37 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
          if (v37)
            goto LABEL_37;
          goto LABEL_38;
        }
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("LANGUAGE_WITH_REGION"), &stru_1E4A55AD0, 0);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "stringWithFormat:", v41, obja, v56);
        v37 = (id)objc_claimAutoreleasedReturnValue();

        if (v37)
          goto LABEL_37;
LABEL_38:

      }
      v49 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v49);
  }

  return v45;
}

+ (id)shortTitlesForLanguageIdentifiers:(id)a3 deviceLanguageLocale:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = *MEMORY[0x1E0C997E8];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "displayNameForKey:value:", v10, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "capitalizeFirstPartOfCountry:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v19, "setValue:forKey:", v16, v12);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v19;
}

+ (id)capitalizeFirstPartOfCountry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  unint64_t v9;
  void *v10;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("("));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "capitalizedString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v7);
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v9 = 1;
      do
      {
        -[__CFString appendString:](v8, "appendString:", CFSTR("("));
        objc_msgSend(v5, "objectAtIndex:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString appendString:](v8, "appendString:", v10);

        ++v9;
      }
      while (objc_msgSend(v5, "count") > v9);
    }

  }
  else
  {
    v8 = &stru_1E4A55AD0;
  }

  return v8;
}

- (NSMutableDictionary)cachedAvailableVoices
{
  return self->_cachedAvailableVoices;
}

- (void)setCachedAvailableVoices:(id)a3
{
  objc_storeStrong((id *)&self->_cachedAvailableVoices, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAvailableVoices, 0);
}

@end
