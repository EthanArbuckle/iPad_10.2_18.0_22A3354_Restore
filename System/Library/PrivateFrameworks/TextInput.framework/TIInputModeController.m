@implementation TIInputModeController

- (id)defaultEnabledInputModesForCurrentLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputModeController defaultInputModes](self, "defaultInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[TIInputModeController currentLocale](self, "currentLocale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v4) & 1) != 0)
    {
      -[TIInputModeController preferredLanguages](self, "preferredLanguages");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToArray:", v5);

      if ((v9 & 1) != 0)
        goto LABEL_15;
      goto LABEL_7;
    }

  }
LABEL_7:
  -[TIInputModeController setCurrentLocale:](self, "setCurrentLocale:", v4);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = v5;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        +[TIInputModeController _inputModesForLocale:language:modeFetcher:](TIInputModeController, "_inputModesForLocale:language:modeFetcher:", v4, *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15), &__block_literal_global_45);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObjectsFromArray:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  objc_msgSend(v10, "addObject:", CFSTR("emoji"));
  objc_msgSend(v10, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIInputModeController setDefaultInputModes:](self, "setDefaultInputModes:", v17);

  v5 = v20;
LABEL_15:
  -[TIInputModeController defaultInputModes](self, "defaultInputModes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __61__TIInputModeController_supportedInputModeLanguageAndRegions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("intl")) & 1) == 0)
  {
    v3 = *(void **)(a1 + 32);
    TIInputModeGetLanguageWithRegion(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

- (NSArray)defaultInputModes
{
  return self->defaultInputModes;
}

- (void)setDefaultInputModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setCurrentLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

+ (id)_inputModesForLocale:(id)a3 language:(id)a4 modeFetcher:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *);
  void *v41;
  id v42;
  id v43;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (!v7 || !v9)
    goto LABEL_42;
  v12 = objc_msgSend(v7, "rangeOfString:", CFSTR("@"));
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v7, "substringToIndex:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v13;
  }
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("zh-"))
    && ((objc_msgSend(v7, "hasPrefix:", CFSTR("zh-")) & 1) != 0
     || objc_msgSend(v7, "hasPrefix:", CFSTR("zh_"))))
  {
    if (!objc_msgSend(v8, "isEqualToString:", CFSTR("zh-Hant"))
      || (objc_msgSend(v7, "hasSuffix:", CFSTR("TW")) & 1) == 0
      && (objc_msgSend(v7, "hasSuffix:", CFSTR("HK")) & 1) == 0
      && (objc_msgSend(v7, "hasSuffix:", CFSTR("MO")) & 1) == 0)
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("zh-Hans")))
      {
        v14 = 0;
        goto LABEL_25;
      }
      if ((objc_msgSend(v7, "hasSuffix:", CFSTR("CN")) & 1) == 0)
      {
        v14 = objc_msgSend(v7, "hasSuffix:", CFSTR("SG"));
        goto LABEL_25;
      }
    }
    v14 = 1;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLocaleIdentifierFromString:", v7);
    v15 = v7;
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

    goto LABEL_27;
  }
  if (v8)
  {
    if (_inputModesForLocale_language_modeFetcher__once != -1)
      dispatch_once(&_inputModesForLocale_language_modeFetcher__once, &__block_literal_global_2147);
    TIInputModeGetComponentsFromIdentifier(v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetComponentsFromIdentifier(v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0C997E8];
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", v19))
    {
      v20 = (void *)_inputModesForLocale_language_modeFetcher__exceptionListToUseLanguageCode;
      objc_msgSend(v8, "stringByAppendingString:", CFSTR("/"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingString:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v20, "containsObject:", v22) ^ 1;

    }
    else
    {
      v14 = 0;
    }

    goto LABEL_26;
  }
  v14 = 1;
LABEL_27:
  ((void (**)(_QWORD, id))v10)[2](v10, v7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  if (!v14 || !objc_msgSend(v23, "count"))
  {
    ((void (**)(_QWORD, id))v10)[2](v10, v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(v25, "preferredLocalizations");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndex:", 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "canonicalLanguageIdentifierFromString:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v10)[2](v10, v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v30;
    }
    if (objc_msgSend(v11, "count"))
    {
      if (!objc_msgSend(v24, "count"))
      {
LABEL_39:

        goto LABEL_40;
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v24);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndex:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "substringToIndex:", 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v33, "isEqualToString:", CFSTR("en")) & 1) == 0
        && (objc_msgSend(v33, "isEqualToString:", CFSTR("pt")) & 1) == 0)
      {

        v33 = 0;
      }
      v38 = MEMORY[0x1E0C809B0];
      v39 = 3221225472;
      v40 = __67__TIInputModeController__inputModesForLocale_language_modeFetcher___block_invoke_2;
      v41 = &unk_1E24396F8;
      v42 = v33;
      v34 = v31;
      v43 = v34;
      v35 = v33;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v38);
      v36 = v34;

      v11 = v35;
    }
    else
    {
      v36 = v24;
    }

    v11 = v36;
    goto LABEL_39;
  }
LABEL_40:
  if (!objc_msgSend(v11, "count", v38, v39, v40, v41))
  {

    v11 = &unk_1E24B0660;
  }
LABEL_42:

  return v11;
}

- (NSArray)supportedInputModeIdentifiers
{
  NSArray *supportedInputModeIdentifiers;
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  supportedInputModeIdentifiers = self->_supportedInputModeIdentifiers;
  if (!supportedInputModeIdentifiers)
  {
    v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("ain"), CFSTR("ak"), CFSTR("am"), CFSTR("apw"), CFSTR("ar"), CFSTR("ars"), CFSTR("as"), CFSTR("az_Latn"), CFSTR("be"), CFSTR("bg_BG"), CFSTR("bn-Translit"), CFSTR("bn"), CFSTR("bo"), CFSTR("brx"), CFSTR("ca_ES"), CFSTR("cho"), CFSTR("chr"),
                      CFSTR("cic"),
                      CFSTR("ckb"),
                      CFSTR("cs_CZ"),
                      CFSTR("cv"),
                      CFSTR("cy_GB"),
                      CFSTR("da_DK"),
                      CFSTR("de_AT"),
                      CFSTR("de_CH"),
                      CFSTR("de_DE"),
                      CFSTR("doi_Deva"),
                      CFSTR("dv"),
                      CFSTR("dz"),
                      CFSTR("el_GR"),
                      CFSTR("emoji"),
                      CFSTR("en_AU"),
                      CFSTR("en_CA"),
                      CFSTR("en_GB"),
                      CFSTR("en_JP"),
                      CFSTR("en_IN"),
                      CFSTR("en_NZ"),
                      CFSTR("en_SG"),
                      CFSTR("en_US"),
                      CFSTR("en_ZA"),
                      CFSTR("es_ES"),
                      CFSTR("es_MX"),
                      CFSTR("es_419"),
                      CFSTR("et_EE"),
                      CFSTR("fa"),
                      CFSTR("fa_AF"),
                      CFSTR("ff_Adlm"),
                      CFSTR("fi_FI"),
                      CFSTR("fo"),
                      CFSTR("fr_FR"),
                      CFSTR("fr_BE"),
                      CFSTR("fr_CA"),
                      CFSTR("fr_CH"),
                      CFSTR("ga_IE"),
                      CFSTR("gu-Translit"),
                      CFSTR("gu"),
                      CFSTR("ha"),
                      CFSTR("haw"),
                      CFSTR("he_IL"),
                      CFSTR("hi-Translit"),
                      CFSTR("hi"));
    v5 = self->_supportedInputModeIdentifiers;
    self->_supportedInputModeIdentifiers = v4;

    supportedInputModeIdentifiers = self->_supportedInputModeIdentifiers;
  }
  v6 = supportedInputModeIdentifiers;
  +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", 2);

  if (v8)
  {
    -[NSArray arrayByAddingObject:](v6, "arrayByAddingObject:", CFSTR("intl"));
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (NSArray *)v9;
  }
  if (_os_feature_enabled_impl())
  {
    -[NSArray arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", &unk_1E24B0678);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (NSArray *)v10;
  }
  if (_os_feature_enabled_impl())
  {
    -[NSArray arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", &unk_1E24B0690);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (NSArray *)v11;
  }
  return v6;
}

+ (id)sharedInputModeController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__TIInputModeController_sharedInputModeController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInputModeController_createSharedInputModeControllerOnce != -1)
    dispatch_once(&sharedInputModeController_createSharedInputModeControllerOnce, block);
  return (id)sharedInputModeController_sharedInputModeController;
}

id __65__TIInputModeController_defaultEnabledInputModesForCurrentLocale__block_invoke(uint64_t a1, void *a2)
{
  return TIGetDefaultInputModesForLanguage(a2);
}

- (NSArray)preferredLanguages
{
  return self->preferredLanguages;
}

- (NSString)currentLocale
{
  return self->currentLocale;
}

void __67__TIInputModeController__inputModesForLocale_language_modeFetcher___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CFSTR("en-GB/en_US"), CFSTR("pt-PT/pt_BR"), 0);
  v1 = (void *)_inputModesForLocale_language_modeFetcher__exceptionListToUseLanguageCode;
  _inputModesForLocale_language_modeFetcher__exceptionListToUseLanguageCode = v0;

}

- (id)defaultDictationLanguagesForKeyboardLanguage:(id)a3
{
  return TIGetDefaultDictationLanguagesForKeyboardLanguage(a3);
}

- (BOOL)identifierIsValidSystemInputMode:(id)a3
{
  void *v4;
  char v5;
  void *v7;
  void *v8;

  TIInputModeGetNormalizedIdentifier(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("dictation")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("intl")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("intl_HWR")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "length"))
  {
    -[TIInputModeController supportedInputModeIdentifiers](self, "supportedInputModeIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputModeController supportedInputModeLanguageAndRegions](self, "supportedInputModeLanguageAndRegions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v4) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v8, "containsObject:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)supportedInputModeLanguageAndRegions
{
  NSArray *supportedInputModeLanguageAndRegions;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  void *v10;
  int v11;
  uint64_t v12;
  _QWORD v14[4];
  NSArray *v15;

  supportedInputModeLanguageAndRegions = self->_supportedInputModeLanguageAndRegions;
  if (!supportedInputModeLanguageAndRegions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputModeController supportedInputModeIdentifiers](self, "supportedInputModeIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__TIInputModeController_supportedInputModeLanguageAndRegions__block_invoke;
    v14[3] = &unk_1E2439760;
    v6 = v4;
    v15 = v6;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

    v7 = self->_supportedInputModeLanguageAndRegions;
    self->_supportedInputModeLanguageAndRegions = v6;
    v8 = v6;

    supportedInputModeLanguageAndRegions = self->_supportedInputModeLanguageAndRegions;
  }
  v9 = supportedInputModeLanguageAndRegions;
  +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLForKey:", 2);

  if (v11)
  {
    -[NSArray arrayByAddingObject:](self->_supportedInputModeLanguageAndRegions, "arrayByAddingObject:", CFSTR("intl"));
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (NSArray *)v12;
  }
  return v9;
}

void __50__TIInputModeController_sharedInputModeController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInputModeController_sharedInputModeController;
  sharedInputModeController_sharedInputModeController = v0;

}

- (NSArray)enabledInputModeIdentifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[TIInputModeController inputModesForTesting](self, "inputModesForTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLForKey:", 1);

    if ((v7 & 1) != 0)
    {
      +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKey:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIInputModeController enabledInputModes](self, "enabledInputModes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        -[TIInputModeController enabledInputModes](self, "enabledInputModes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToArray:", v9);

        if ((v12 & 1) != 0)
          goto LABEL_24;
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v23 = v9;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v25;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v25 != v17)
              objc_enumerationMutation(v14);
            v19 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v18);
            if (objc_msgSend(v19, "rangeOfString:", CFSTR("@")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              TICanonicalInputModeName(v19);
              v20 = objc_claimAutoreleasedReturnValue();

              v19 = (id)v20;
            }
            if ((objc_msgSend(v13, "containsObject:", v19) & 1) == 0)
              objc_msgSend(v13, "addObject:", v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v16);
      }

      if (objc_msgSend(v13, "count"))
      {
        -[TIInputModeController setEnabledInputModes:](self, "setEnabledInputModes:", v13);
      }
      else
      {
        -[TIInputModeController defaultEnabledInputModesForCurrentLocale](self, "defaultEnabledInputModesForCurrentLocale");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIInputModeController setEnabledInputModes:](self, "setEnabledInputModes:", v21);

      }
      v9 = v23;
      goto LABEL_24;
    }
    -[TIInputModeController defaultEnabledInputModesForCurrentLocale](self, "defaultEnabledInputModesForCurrentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIInputModeController setEnabledInputModes:](self, "setEnabledInputModes:", v9);
LABEL_24:

    -[TIInputModeController enabledInputModes](self, "enabledInputModes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSArray *)v5;
  }
  -[TIInputModeController inputModesForTesting](self, "inputModesForTesting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  return (NSArray *)v5;
}

- (NSArray)enabledInputModes
{
  return self->enabledInputModes;
}

- (void)setEnabledInputModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)inputModesForTesting
{
  return self->inputModesForTesting;
}

- (id)suggestedDictationLanguageForDeviceLanguage
{
  void *v2;
  void *v3;

  TIGetSuggestedDictationLanguagesForDeviceLanguage();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPreferredLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setInputModesForTesting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputModesForTesting, 0);
  objc_storeStrong((id *)&self->defaultInputModes, 0);
  objc_storeStrong((id *)&self->enabledInputModes, 0);
  objc_storeStrong((id *)&self->preferredLanguages, 0);
  objc_storeStrong((id *)&self->currentLocale, 0);
  objc_storeStrong((id *)&self->_supportedInputModeLanguageAndRegions, 0);
  objc_storeStrong((id *)&self->_supportedInputModeIdentifiers, 0);
}

void __67__TIInputModeController__inputModesForLocale_language_modeFetcher___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  char v6;
  id v7;

  v3 = a2;
  v4 = v3;
  v7 = v3;
  if (!*(_QWORD *)(a1 + 32) || (v5 = objc_msgSend(v3, "hasPrefix:"), v4 = v7, (v5 & 1) == 0))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v4);
    v4 = v7;
    if ((v6 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
      v4 = v7;
    }
  }

}

@end
