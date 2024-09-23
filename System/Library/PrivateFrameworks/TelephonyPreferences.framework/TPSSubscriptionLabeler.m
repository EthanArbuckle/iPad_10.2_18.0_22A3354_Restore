@implementation TPSSubscriptionLabeler

- (TPSSubscriptionLabeler)initWithLabelStorage:(id)a3
{
  id v4;
  TPSSubscriptionLabeler *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *labelDictionary;
  NSMutableDictionary *v10;
  uint64_t v11;
  NSMutableDictionary *v12;
  uint64_t v13;
  NSString *applicableLanguage;
  uint64_t v15;
  NSArray *applicableUnlocalizedLabels;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *cachedResult;
  uint64_t v21;
  NSLocale *updatingLocale;
  dispatch_queue_t v23;
  OS_dispatch_queue *accessQueue;
  uint64_t v25;
  NSURL *url;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TPSSubscriptionLabeler;
  v5 = -[TPSSubscriptionLabeler init](&v28, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithContentsOfFile:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    labelDictionary = v5->_labelDictionary;
    v5->_labelDictionary = (NSMutableDictionary *)v8;

    v10 = v5->_labelDictionary;
    if (!v10)
    {
      v11 = objc_opt_new();
      v12 = v5->_labelDictionary;
      v5->_labelDictionary = (NSMutableDictionary *)v11;

      v10 = v5->_labelDictionary;
    }
    -[NSMutableDictionary objectForKey:](v10, "objectForKey:", CFSTR("Language"));
    v13 = objc_claimAutoreleasedReturnValue();
    applicableLanguage = v5->_applicableLanguage;
    v5->_applicableLanguage = (NSString *)v13;

    -[NSMutableDictionary objectForKey:](v5->_labelDictionary, "objectForKey:", CFSTR("UnlocalizedLabels"));
    v15 = objc_claimAutoreleasedReturnValue();
    applicableUnlocalizedLabels = v5->_applicableUnlocalizedLabels;
    v5->_applicableUnlocalizedLabels = (NSArray *)v15;

    -[NSMutableDictionary objectForKey:](v5->_labelDictionary, "objectForKey:", CFSTR("LocalizedLabel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v5->_labelDictionary, "objectForKey:", CFSTR("ShortLocalizedLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[TPSSubscriptionLabel labelsFromUnlocalizedLabels:localizedLongLabels:localizedBadgeLabels:](TPSSubscriptionLabel, "labelsFromUnlocalizedLabels:localizedLongLabels:localizedBadgeLabels:", v5->_applicableUnlocalizedLabels, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    cachedResult = v5->_cachedResult;
    v5->_cachedResult = (NSArray *)v19;

    objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
    v21 = objc_claimAutoreleasedReturnValue();
    updatingLocale = v5->_updatingLocale;
    v5->_updatingLocale = (NSLocale *)v21;

    v23 = dispatch_queue_create("com.apple.telephony.labelstore", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v23;

    v25 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v25;

  }
  return v5;
}

+ (id)localizedStringDictionaryForLanguageIdentifiers:(id)a3 selectedLanguage:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  v21 = 0;
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(v6, "localizations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferredLocalizationsFromArray:forPreferences:", v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__TPSSubscriptionLabeler_localizedStringDictionaryForLanguageIdentifiers_selectedLanguage___block_invoke;
    v12[3] = &unk_1EA2CDD40;
    v14 = &v22;
    v13 = v6;
    v15 = &v16;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v17[5]);
  v10 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __91__TPSSubscriptionLabeler_localizedStringDictionaryForLanguageIdentifiers_selectedLanguage___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "localizedStringsForTable:localization:", CFSTR("SubscriptionLabel"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }

}

+ (id)localizedLabelForLabel:(id)a3
{
  return (id)objc_msgSend(a1, "localizedLabelForLabel:longForm:languageStringOverrides:", a3, 1, 0);
}

+ (id)localizedLabelsForLabels:(id)a3 languageIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "localizedStringDictionaryForLanguageIdentifiers:selectedLanguage:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedLabelsForLabels:languageStringOverrides:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)localizedLabelsForLabels:(id)a3 languageStringOverrides:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "localizedLabelForLabel:longForm:languageStringOverrides:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), 1, v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)localizedLabelForLabel:(id)a3 longForm:(BOOL)a4 languageStringOverrides:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;

  v7 = a3;
  v8 = a5;
  v9 = v7;
  v10 = v9;
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("_$<")))
  {
    v10 = v9;
    if (objc_msgSend(v9, "hasSuffix:", CFSTR(">$_")))
    {
      objc_msgSend(v9, "substringWithRange:", 3, objc_msgSend(v9, "length") - 6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("_$<SUBSCRIPTION_LABEL_UNKNOWN>$_"));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        v14 = CFSTR("untitled");
        if (v12)
          v14 = (__CFString *)v12;
        v15 = v14;

        objc_msgSend(v8, "objectForKey:", v11);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v15;
        v10 = v18;

        if (a4)
          goto LABEL_18;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_SHORT"), v11);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v19);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          v22 = (void *)v20;
        else
          v22 = v10;
        v23 = v22;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("_$<SUBSCRIPTION_LABEL_UNKNOWN>$_"), CFSTR("untitled"), CFSTR("SubscriptionLabel"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "localizedStringForKey:value:table:", v11, v24, CFSTR("SubscriptionLabel"));
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (a4)
        {
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_SHORT"), v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", v21, v10, CFSTR("SubscriptionLabel"));
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v23;

      v10 = v25;
      goto LABEL_17;
    }
  }
LABEL_19:
  if (!a4)
  {
    objc_msgSend(v10, "localizedUppercaseString");
    v26 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v26;
  }

  return v10;
}

- (id)cachedLocalizedLabelsForUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __88__TPSSubscriptionLabeler_cachedLocalizedLabelsForUnlocalizedLabels_languageIdentifiers___block_invoke;
  v13[3] = &unk_1EA2CDD68;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __88__TPSSubscriptionLabeler_cachedLocalizedLabelsForUnlocalizedLabels_languageIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_validateLabelsForInstalledUnlocalizedLabels:languageIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "cachedResult");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)cachedLocalizedLabelsForUnlocalizedLabels:(id)a3
{
  return -[TPSSubscriptionLabeler cachedLocalizedLabelsForUnlocalizedLabels:languageIdentifiers:](self, "cachedLocalizedLabelsForUnlocalizedLabels:languageIdentifiers:", a3, 0);
}

- (void)_validateLabelsForInstalledUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v6 = a3;
  v7 = a4;
  v28 = 0;
  objc_msgSend((id)objc_opt_class(), "localizedStringDictionaryForLanguageIdentifiers:selectedLanguage:", v7, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v28;
  if (!v8)
  {
    -[TPSSubscriptionLabeler updatingLocale](self, "updatingLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageCode");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  -[TPSSubscriptionLabeler applicableLanguage](self, "applicableLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqualToString:", v12);

  -[TPSSubscriptionLabeler applicableUnlocalizedLabels](self, "applicableUnlocalizedLabels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "isEqual:", v14);

  if (!v13 || (v15 & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "localizedBadgeLabelsForUnlocalizedLabels:languageStringOverrides:", v6, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "localizedLabelsForLabels:languageStringOverrides:", v6, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    -[TPSSubscriptionLabeler labelDictionary](self, "labelDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v6, CFSTR("UnlocalizedLabels"));

    -[TPSSubscriptionLabeler labelDictionary](self, "labelDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v9, CFSTR("Language"));

    -[TPSSubscriptionLabeler labelDictionary](self, "labelDictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v18, CFSTR("LocalizedLabel"));

    -[TPSSubscriptionLabeler labelDictionary](self, "labelDictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v16, CFSTR("ShortLocalizedLabel"));

    v23 = (void *)MEMORY[0x1E0CB38B0];
    -[TPSSubscriptionLabeler labelDictionary](self, "labelDictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dataWithPropertyList:format:options:error:", v24, 200, 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPSSubscriptionLabeler url](self, "url");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "writeToURL:atomically:", v26, 1);

    -[TPSSubscriptionLabeler setApplicableLanguage:](self, "setApplicableLanguage:", v9);
    -[TPSSubscriptionLabeler setApplicableUnlocalizedLabels:](self, "setApplicableUnlocalizedLabels:", v6);
    +[TPSSubscriptionLabel labelsFromUnlocalizedLabels:localizedLongLabels:localizedBadgeLabels:](TPSSubscriptionLabel, "labelsFromUnlocalizedLabels:localizedLongLabels:localizedBadgeLabels:", v6, v18, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSSubscriptionLabeler setCachedResult:](self, "setCachedResult:", v27);

  }
}

+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3 languageStringOverrides:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend((id)objc_opt_class(), "localizedLabelForLabel:longForm:languageStringOverrides:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13), 0, v7, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_msgSend(a1, "displayShortLabelStringsForLongFormShortLabels:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a1, "localizedStringDictionaryForLanguageIdentifiers:selectedLanguage:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedBadgeLabelsForUnlocalizedLabels:languageStringOverrides:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3
{
  return (id)objc_msgSend(a1, "localizedBadgeLabelsForUnlocalizedLabels:languageIdentifiers:", a3, 0);
}

+ (id)displayShortLabelStringsForLongFormShortLabels:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "stringsByAbbreviatingToPrefixesOfStrings:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringsByClippingStrings:toWidthOfString:", v4, CFSTR("𣍊𣍊𣍊"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "stringsByNumericallyDisambiguatingStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringsByAbbreviatingToPrefixesOfStrings:(id)a3
{
  id v4;
  TPSSubscriptionLabelerCharacterSets *v5;
  void *v6;
  id v7;
  id v8;
  TPSSubscriptionLabelerCharacterSets *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  TPSSubscriptionLabelerCharacterSets *v14;
  id v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = objc_alloc_init(TPSSubscriptionLabelerCharacterSets);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__TPSSubscriptionLabeler_stringsByAbbreviatingToPrefixesOfStrings___block_invoke;
  v13[3] = &unk_1EA2CDDB8;
  v17 = a1;
  v14 = v5;
  v15 = v4;
  v7 = v6;
  v16 = v7;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
  v10 = v16;
  v11 = v7;

  return v11;
}

void __67__TPSSubscriptionLabeler_stringsByAbbreviatingToPrefixesOfStrings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a2;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v6 = 0;
  if ((objc_msgSend(*(id *)(a1 + 56), "isExclusivelyCJKString:characterSets:", v5, *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    do
    {
      v7 = v29[3];
      if (v7 >= objc_msgSend(v5, "length"))
        break;
      v8 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", v29[3]);
      v10 = v9;
      objc_msgSend(v5, "substringToIndex:", v8 + v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v25 = &v24;
      v26 = 0x2020000000;
      v27 = 0;
      v12 = *(void **)(a1 + 40);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __67__TPSSubscriptionLabeler_stringsByAbbreviatingToPrefixesOfStrings___block_invoke_2;
      v17[3] = &unk_1EA2CDD90;
      v21 = a3;
      v13 = v11;
      v18 = v13;
      v19 = &v24;
      v20 = &v28;
      v22 = v8;
      v23 = v10;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v17);
      v14 = *((unsigned __int8 *)v25 + 24);
      if (!*((_BYTE *)v25 + 24))
      {
        v15 = v13;

        v6 = v15;
      }

      _Block_object_dispose(&v24, 8);
    }
    while (v14);
  }
  if (v6)
    v16 = v6;
  else
    v16 = v5;
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v16);

  _Block_object_dispose(&v28, 8);
}

void __67__TPSSubscriptionLabeler_stringsByAbbreviatingToPrefixesOfStrings___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  BOOL v8;
  id v9;

  v7 = a2;
  if (a1[7] != a3)
  {
    v9 = v7;
    v8 = objc_msgSend(v7, "rangeOfString:options:", a1[4], 137) == 0x7FFFFFFFFFFFFFFFLL;
    v7 = v9;
    if (!v8)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a1[9] + a1[8];
    }
  }

}

+ (id)stringsByClippingStrings:(id)a3 toWidthOfString:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(a1, "fontAttributeDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "widthOfString:attributes:", v7, v10);
    v12 = v11;
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __67__TPSSubscriptionLabeler_stringsByClippingStrings_toWidthOfString___block_invoke;
    v27[3] = &unk_1EA2CDDE0;
    v30 = a1;
    v13 = v10;
    v31 = v12;
    v28 = v13;
    v29 = &v32;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v27);
    v9 = v8;
    if (*((_BYTE *)v33 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = v8;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            v19 = objc_msgSend(v18, "rangeOfComposedCharacterSequenceAtIndex:", 0, (_QWORD)v23);
            objc_msgSend(v18, "substringToIndex:", v19 + v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v21);

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
        }
        while (v15);
      }

    }
    _Block_object_dispose(&v32, 8);

  }
  CTFontRemoveFromCaches();

  return v9;
}

uint64_t __67__TPSSubscriptionLabeler_stringsByClippingStrings_toWidthOfString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v7;

  result = objc_msgSend(*(id *)(a1 + 48), "widthOfString:attributes:", a2, *(_QWORD *)(a1 + 32));
  if (v7 > *(double *)(a1 + 56))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (id)fontAttributeDictionary
{
  const __CTFontDescriptor *v2;
  const __CTFontDescriptor *v3;
  CTFontRef v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (const __CTFontDescriptor *)CTFontDescriptorCreateForUIType();
  v3 = v2;
  if (v2)
  {
    v4 = CTFontCreateWithFontDescriptor(v2, 0.0, 0);
    CFRelease(v3);
    if (v4)
    {
      v7 = *MEMORY[0x1E0CA8188];
      v8[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
    }
    v3 = 0;
  }
  return v3;
}

+ (double)widthOfString:(id)a3 attributes:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  const __CFAttributedString *v8;
  const __CTLine *v9;
  double width;
  CGRect BoundsWithOptions;

  v5 = (objc_class *)MEMORY[0x1E0CB3498];
  v6 = a4;
  v7 = a3;
  v8 = (const __CFAttributedString *)objc_msgSend([v5 alloc], "initWithString:attributes:", v7, v6);

  v9 = CTLineCreateWithAttributedString(v8);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v9, 0);
  width = BoundsWithOptions.size.width;
  CFRelease(v9);

  return width;
}

+ (id)stringByShorteningString:(id)a3 maximumWidth:(double)a4 attributes:(id)a5
{
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;

  v8 = a3;
  objc_msgSend(a1, "widthOfString:attributes:", v8, a5);
  v9 = v8;
  if (v10 > a4)
  {
    v11 = objc_msgSend(v8, "rangeOfComposedCharacterSequenceAtIndex:", 0);
    objc_msgSend(v8, "substringToIndex:", v11 + v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)stringsByNumericallyDisambiguatingStrings:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v18;
  id obj;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  id v24;
  BOOL v25;
  _QWORD v26[3];
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(obj);
        v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v7), "mutableCopy");
        objc_msgSend(v4, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v5);
  }

  objc_msgSend(a1, "_groupStringsByCollationEquivalency:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v14, "count") >= 2)
        {
          v26[0] = 0;
          v26[1] = v26;
          v26[2] = 0x2020000000;
          v27 = 1;
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "rangeOfCharacterFromSet:options:", v18, 12) != 0x7FFFFFFFFFFFFFFFLL;

          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __68__TPSSubscriptionLabeler_stringsByNumericallyDisambiguatingStrings___block_invoke;
          v21[3] = &unk_1EA2CDE08;
          v25 = v16;
          v23 = v26;
          v24 = a1;
          v22 = v9;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", v21);

          _Block_object_dispose(v26, 8);
        }

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v11);
  }

  return v4;
}

void __68__TPSSubscriptionLabeler_stringsByNumericallyDisambiguatingStrings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  id v6;

  v6 = a2;
  v3 = 0;
  do
  {
    v4 = v3;
    if (*(_BYTE *)(a1 + 56))
      v5 = CFSTR(" %d");
    else
      v5 = CFSTR("%d");
    objc_msgSend(v6, "stringByAppendingFormat:", v5, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  while ((objc_msgSend(*(id *)(a1 + 48), "_dictionary:containsCollationEquivalentKey:", *(_QWORD *)(a1 + 32), v3) & 1) != 0);
  objc_msgSend(v6, "setString:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v3);

}

+ (BOOL)_dictionary:(id)a3 containsCollationEquivalentKey:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "compare:options:", v6, 385, (_QWORD)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)_groupStringsByCollationEquivalency:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  if (objc_msgSend(v5, "count"))
  {
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = (void *)objc_opt_new();
      v14 = 0;
      v15 = &v14;
      v16 = 0x3032000000;
      v17 = __Block_byref_object_copy__2;
      v18 = __Block_byref_object_dispose__2;
      v19 = 0;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __62__TPSSubscriptionLabeler__groupStringsByCollationEquivalency___block_invoke;
      v11[3] = &unk_1EA2CDE30;
      v13 = &v14;
      v8 = v7;
      v12 = v8;
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
      objc_msgSend(v5, "objectsAtIndexes:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObjectsAtIndexes:", v8);
      objc_msgSend(v4, "setObject:forKey:", v9, v15[5]);

      _Block_object_dispose(&v14, 8);
    }
    while (objc_msgSend(v5, "count"));
  }

  return v4;
}

void __62__TPSSubscriptionLabeler__groupStringsByCollationEquivalency___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v7 + 40);
  v8 = (id *)(v7 + 40);
  v9 = v10;
  v11 = v6;
  if (!v10)
  {
    objc_storeStrong(v8, a2);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
    goto LABEL_6;
  }
  if (!objc_msgSend(v9, "compare:options:", v6, 385))
    goto LABEL_5;
LABEL_6:

}

+ (id)standardLabelIdentifiers
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("_$<SUBSCRIPTION_LABEL_PRIMARY>$_");
  v3[1] = CFSTR("_$<SUBSCRIPTION_LABEL_SECONDARY>$_");
  v3[2] = CFSTR("_$<SUBSCRIPTION_LABEL_PERSONAL>$_");
  v3[3] = CFSTR("_$<SUBSCRIPTION_LABEL_BUSINESS>$_");
  v3[4] = CFSTR("_$<SUBSCRIPTION_LABEL_TRAVEL>$_");
  v3[5] = CFSTR("_$<SUBSCRIPTION_LABEL_DATA>$_");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isExclusivelyCJKString:(id)a3 characterSets:(id)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend(a1, "isString:exclusivelyInCharacterSet:", v6, objc_msgSend(a4, "CJK"));

  return (char)a4;
}

+ (BOOL)isString:(id)a3 exclusivelyInCharacterSet:(USet *)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  _QWORD v10[5];

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_opt_class();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__TPSSubscriptionLabeler_isString_exclusivelyInCharacterSet___block_invoke;
    v10[3] = &__block_descriptor_40_e13__24__0r_S8Q16l;
    v10[4] = a4;
    objc_msgSend(v6, "_resultWithAllCharacters:string:", v10, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

id __61__TPSSubscriptionLabeler_isString_exclusivelyInCharacterSet___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", uset_containsAllCodePoints());
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_resultWithAllCharacters:(id)a3 string:(id)a4
{
  _QWORD *v5;
  __CFString *v6;
  unint64_t v7;
  const UniChar *CharactersPtr;
  const UniChar *v9;
  void (*v10)(_QWORD *, const UniChar *, unint64_t);
  _QWORD *v11;
  unint64_t v12;
  _WORD *v13;
  _WORD *v14;
  void *v15;
  _WORD v17[255];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  v7 = -[__CFString length](v6, "length");
  if (!-[__CFString length](v6, "length"))
    goto LABEL_9;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  if (CharactersPtr)
  {
    v9 = CharactersPtr;
    v10 = (void (*)(_QWORD *, const UniChar *, unint64_t))v5[2];
LABEL_6:
    v11 = v5;
    v12 = v7;
LABEL_10:
    v10(v11, v9, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v7 <= 0xFE)
  {
    -[__CFString getCharacters:range:](v6, "getCharacters:range:", v17, 0, v7);
    v17[v7] = 0;
    v10 = (void (*)(_QWORD *, const UniChar *, unint64_t))v5[2];
    v9 = v17;
    goto LABEL_6;
  }
  v13 = malloc_type_malloc(2 * v7 + 2, 0x1000040BDFB0063uLL);
  if (!v13)
  {
LABEL_9:
    v10 = (void (*)(_QWORD *, const UniChar *, unint64_t))v5[2];
    v11 = v5;
    v9 = 0;
    v12 = 0;
    goto LABEL_10;
  }
  v14 = v13;
  -[__CFString getCharacters:range:](v6, "getCharacters:range:", v13, 0, v7);
  v14[v7] = 0;
  ((void (*)(_QWORD *, void *, unint64_t))v5[2])(v5, v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  free(v14);
LABEL_11:

  return v15;
}

- (NSMutableDictionary)labelDictionary
{
  return self->_labelDictionary;
}

- (void)setLabelDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_labelDictionary, a3);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_accessQueue, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (NSArray)applicableUnlocalizedLabels
{
  return self->_applicableUnlocalizedLabels;
}

- (void)setApplicableUnlocalizedLabels:(id)a3
{
  objc_storeStrong((id *)&self->_applicableUnlocalizedLabels, a3);
}

- (NSString)applicableLanguage
{
  return self->_applicableLanguage;
}

- (void)setApplicableLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_applicableLanguage, a3);
}

- (NSLocale)updatingLocale
{
  return self->_updatingLocale;
}

- (void)setUpdatingLocale:(id)a3
{
  objc_storeStrong((id *)&self->_updatingLocale, a3);
}

- (NSArray)cachedResult
{
  return self->_cachedResult;
}

- (void)setCachedResult:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResult, 0);
  objc_storeStrong((id *)&self->_updatingLocale, 0);
  objc_storeStrong((id *)&self->_applicableLanguage, 0);
  objc_storeStrong((id *)&self->_applicableUnlocalizedLabels, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_labelDictionary, 0);
}

@end
