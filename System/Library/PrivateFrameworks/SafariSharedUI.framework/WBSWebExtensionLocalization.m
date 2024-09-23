@implementation WBSWebExtensionLocalization

- (WBSWebExtensionLocalization)initWithBundleURL:(id)a3 defaultLocale:(id)a4 uniqueIdentifier:(id)a5 extensionIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  WBSWebExtensionLocalization *v25;
  WBSWebExtensionLocalization *v26;
  NSObject *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  WBSWebExtensionLocalization *v34;
  void *v36;
  void *v37;
  void *v38;
  WBSWebExtensionLocalization *v39;
  void *v40;
  id v41;
  void *v42;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  if (objc_msgSend(v11, "length"))
  {
    v39 = self;
    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "languageCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v14;
    objc_msgSend(v14, "countryCode");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v15, v37);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_locales/%@/messages.json"), v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_locales/%@/messages.json"), v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v19);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)v16;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_locales/%@/messages.json"), v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)v18;
    localizationDictionaryAtURL(v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v12;
    if (v22)
    {
      v23 = v11;
    }
    else
    {
      v27 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[WBSWebExtensionLocalization initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:].cold.2();
      v23 = 0;
    }
    localizationDictionaryAtURL((uint64_t)v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = v15;

      v23 = v29;
    }
    else
    {
      v30 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[WBSWebExtensionLocalization initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:].cold.2();
    }
    localizationDictionaryAtURL((uint64_t)v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = v11;

      v23 = v32;
    }
    else
    {
      v33 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        -[WBSWebExtensionLocalization initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:].cold.2();
    }
    v34 = -[WBSWebExtensionLocalization initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:](v39, "initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:", v31, v28, v22, v23, v13);

    v26 = v34;
    v12 = v41;
  }
  else
  {
    v24 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[WBSWebExtensionLocalization initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:].cold.1((uint64_t)v12, v24);
    v25 = -[WBSWebExtensionLocalization initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:](self, "initWithRegionalLocalization:languageLocalization:defaultLocalization:withBestLocale:uniqueIdentifier:", 0, 0, 0, 0, v13);

    v26 = v25;
  }

  return v26;
}

- (WBSWebExtensionLocalization)initWithRegionalLocalization:(id)a3 languageLocalization:(id)a4 defaultLocalization:(id)a5 withBestLocale:(id)a6 uniqueIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  WBSWebExtensionLocalization *v17;
  uint64_t v18;
  NSLocale *locale;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *localizationDictionary;
  WBSWebExtensionLocalization *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)WBSWebExtensionLocalization;
  v17 = -[WBSWebExtensionLocalization init](&v30, sel_init);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v15);
    v18 = objc_claimAutoreleasedReturnValue();
    locale = v17->_locale;
    v17->_locale = (NSLocale *)v18;

    objc_storeStrong((id *)&v17->_localeString, a6);
    objc_storeStrong((id *)&v17->_uniqueIdentifier, a7);
    -[WBSWebExtensionLocalization _predefinedMessagesForLocale:](v17, "_predefinedMessagesForLocale:", v17->_locale);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_dictionaryWithLowercaseKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "safari_dictionaryByMergingWithDictionary:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "safari_dictionaryWithLowercaseKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "safari_dictionaryByMergingWithDictionary:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "safari_dictionaryWithLowercaseKeys");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "safari_dictionaryByMergingWithDictionary:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    localizationDictionary = v17->_localizationDictionary;
    v17->_localizationDictionary = (NSDictionary *)v26;

    v28 = v17;
  }

  return v17;
}

- (id)localizedDictionaryForDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_localizationDictionary)
  {
    v6 = v4;
    goto LABEL_18;
  }
  v17 = v4;
  v6 = (id)objc_msgSend(v4, "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v8)
    goto LABEL_16;
  v9 = v8;
  v10 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v19 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
      objc_msgSend(v6, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[WBSWebExtensionLocalization localizedStringForString:](self, "localizedStringForString:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[WBSWebExtensionLocalization _localizedArrayForArray:](self, "_localizedArrayForArray:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_14;
          -[WBSWebExtensionLocalization localizedDictionaryForDictionary:](self, "localizedDictionaryForDictionary:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
        }
      }
      v15 = (void *)v14;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

LABEL_14:
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v9);
LABEL_16:

  v5 = v17;
LABEL_18:

  return v6;
}

- (id)localizedStringForKey:(id)a3 withPlaceholders:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSDictionary *localizationDictionary;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "count") <= 9)
  {
    localizationDictionary = self->_localizationDictionary;
    objc_msgSend(v6, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary safari_dictionaryForKey:](localizationDictionary, "safari_dictionaryForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "safari_stringForKey:", CFSTR("message"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString length](v12, "length"))
    {
      objc_msgSend(v11, "safari_dictionaryForKey:", CFSTR("placeholders"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safari_dictionaryWithLowercaseKeys");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[WBSWebExtensionLocalization _stringByReplacingNamedPlaceholdersInString:withNamedPlaceholders:](self, "_stringByReplacingNamedPlaceholdersInString:withNamedPlaceholders:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[WBSWebExtensionLocalization _stringByReplacingPositionalPlaceholdersInString:withValues:](self, "_stringByReplacingPositionalPlaceholdersInString:withValues:", v15, v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("$$"), CFSTR("$"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v17;
      v8 = v12;
    }
    else
    {
      v8 = &stru_1E5449658;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_localizedArrayForArray:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__WBSWebExtensionLocalization__localizedArrayForArray___block_invoke;
  v4[3] = &unk_1E54489A0;
  v4[4] = self;
  objc_msgSend(a3, "safari_mapObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __55__WBSWebExtensionLocalization__localizedArrayForArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedStringForString:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_localizedArrayForArray:", v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "localizedDictionaryForDictionary:", v3);
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = v3;
      }
    }
  }
  v5 = v4;

  return v5;
}

- (id)localizedStringForString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("__MSG_([A-Za-z0-9_@]+)__"), 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v6)
  {
    v8 = (void *)v6;
    v9 = v4;
    do
    {
      v10 = objc_msgSend(v8, "rangeAtIndex:", 1);
      objc_msgSend(v9, "substringWithRange:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSWebExtensionLocalization localizedStringForKey:withPlaceholders:](self, "localizedStringForKey:withPlaceholders:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v8, "range");
      objc_msgSend(v9, "substringWithRange:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", v16, v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "firstMatchInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
      v17 = objc_claimAutoreleasedReturnValue();

      v9 = v7;
      v8 = (void *)v17;
    }
    while (v17);
  }

  return v7;
}

- (id)_predefinedMessagesForLocale:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *localeString;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  _QWORD v33[6];
  _QWORD v34[6];
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  const __CFString *v46;
  _QWORD v47[6];
  _QWORD v48[7];

  v48[6] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CEA238];
  -[NSLocale languageCode](self->_locale, "languageCode", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "defaultWritingDirectionForLanguage:", v5);

  if (v6)
  {
    v33[0] = CFSTR("@@ui_locale");
    localeString = &stru_1E5449658;
    if (self->_localeString)
      localeString = (const __CFString *)self->_localeString;
    v31 = CFSTR("message");
    v32 = localeString;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v8;
    v33[1] = CFSTR("@@extension_id");
    v29 = CFSTR("message");
    -[NSUUID UUIDString](self->_uniqueIdentifier, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v10;
    v33[2] = CFSTR("@@bidi_dir");
    v27 = CFSTR("message");
    v28 = CFSTR("rtl");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v11;
    v33[3] = CFSTR("@@bidi_reversed_dir");
    v25 = CFSTR("message");
    v26 = CFSTR("ltr");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v12;
    v33[4] = CFSTR("@@bidi_start_edge");
    v23 = CFSTR("message");
    v24 = CFSTR("right");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v13;
    v33[5] = CFSTR("@@bidi_end_edge");
    v21 = CFSTR("message");
    v22 = CFSTR("left");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v34;
    v17 = v33;
  }
  else
  {
    v47[0] = CFSTR("@@ui_locale");
    v18 = &stru_1E5449658;
    if (self->_localeString)
      v18 = (const __CFString *)self->_localeString;
    v45 = CFSTR("message");
    v46 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v8;
    v47[1] = CFSTR("@@extension_id");
    v43 = CFSTR("message");
    -[NSUUID UUIDString](self->_uniqueIdentifier, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v10;
    v47[2] = CFSTR("@@bidi_dir");
    v41 = CFSTR("message");
    v42 = CFSTR("ltr");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v48[2] = v11;
    v47[3] = CFSTR("@@bidi_reversed_dir");
    v39 = CFSTR("message");
    v40 = CFSTR("rtl");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v48[3] = v12;
    v47[4] = CFSTR("@@bidi_start_edge");
    v37 = CFSTR("message");
    v38 = CFSTR("left");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v48[4] = v13;
    v47[5] = CFSTR("@@bidi_end_edge");
    v35 = CFSTR("message");
    v36 = CFSTR("right");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48[5] = v14;
    v15 = (void *)MEMORY[0x1E0C99D80];
    v16 = v48;
    v17 = v47;
  }
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_stringByReplacingNamedPlaceholdersInString:(id)a3 withNamedPlaceholders:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:[^$]|^)(\\$([A-Za-z0-9_@]+)\\$)"), 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      v10 = objc_msgSend(v9, "rangeAtIndex:", 2);
      objc_msgSend(v5, "substringWithRange:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "safari_dictionaryForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safari_stringForKey:", CFSTR("content"));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      if (v15)
        v17 = (__CFString *)v15;
      else
        v17 = &stru_1E5449658;
      v18 = v17;

      v19 = objc_msgSend(v9, "rangeAtIndex:", 1);
      objc_msgSend(v5, "substringWithRange:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v21, v18, 1, 0, objc_msgSend(v5, "length"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "firstMatchInString:options:range:", v22, 0, 0, objc_msgSend(v22, "length"));
      v23 = objc_claimAutoreleasedReturnValue();

      v5 = v22;
      v9 = (void *)v23;
    }
    while (v23);
  }
  else
  {
    v22 = v5;
  }

  return v22;
}

- (id)_stringByReplacingPositionalPlaceholdersInString:(id)a3 withValues:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(?:[^$]|^)(\\$([0-9]))"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      v11 = objc_msgSend(v10, "rangeAtIndex:", 2);
      objc_msgSend(v5, "substringWithRange:", v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      v15 = v14 >= 1 && v14 <= v7;
      v16 = &stru_1E5449658;
      if (v15)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v14 - 1);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v17 = objc_msgSend(v10, "rangeAtIndex:", 1);
      objc_msgSend(v5, "substringWithRange:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", v19, v16, 1, 0, objc_msgSend(v5, "length"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "firstMatchInString:options:range:", v20, 0, 0, objc_msgSend(v20, "length"));
      v21 = objc_claimAutoreleasedReturnValue();

      v5 = v20;
      v10 = (void *)v21;
    }
    while (v21);
  }
  else
  {
    v20 = v5;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *localizationDictionary;
  id v5;

  localizationDictionary = self->_localizationDictionary;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizationDictionary, CFSTR("localizationDictionary"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localeString, CFSTR("localeString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));

}

- (WBSWebExtensionLocalization)initWithCoder:(id)a3
{
  id v4;
  WBSWebExtensionLocalization *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *localizationDictionary;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSString *localeString;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSLocale *locale;
  uint64_t v26;
  NSUUID *uniqueIdentifier;
  WBSWebExtensionLocalization *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)WBSWebExtensionLocalization;
  v5 = -[WBSWebExtensionLocalization init](&v30, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("localizationDictionary"));
    v13 = objc_claimAutoreleasedReturnValue();
    localizationDictionary = v5->_localizationDictionary;
    v5->_localizationDictionary = (NSDictionary *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("localeString"));
    v18 = objc_claimAutoreleasedReturnValue();
    localeString = v5->_localeString;
    v5->_localeString = (NSString *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("locale"));
    v24 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSLocale *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSUUID *)v26;

    v28 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_localeString, 0);
  objc_storeStrong((id *)&self->_localizationDictionary, 0);
}

- (void)initWithBundleURL:(uint64_t)a1 defaultLocale:(NSObject *)a2 uniqueIdentifier:extensionIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_1A840B000, a2, OS_LOG_TYPE_DEBUG, "Not loading localization for extension %{private}@. No default locale provided.", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)initWithBundleURL:defaultLocale:uniqueIdentifier:extensionIdentifier:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_7(&dword_1A840B000, v0, v1, "Could not find localization for %{public}@ in extension %{private}@");
  OUTLINED_FUNCTION_1();
}

@end
