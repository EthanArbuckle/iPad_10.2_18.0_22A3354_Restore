@implementation TILanguageSelectionController

- (NSArray)activeInputModes
{
  return self->_activeInputModes;
}

- (void)setAdaptationContext:(id)a3
{
  TILanguageModelAdaptationContext *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (TILanguageModelAdaptationContext *)a3;
  if (self->_adaptationContext != v5)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Setting adaptation context = %@"), "-[TILanguageSelectionController setAdaptationContext:]", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v11;
        _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[TILanguageModelAdaptationContext recipientNameDigest](v5, "recipientNameDigest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageSelectionController adaptationContext](self, "adaptationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recipientNameDigest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "_string:matchesString:", v8, v10);

    objc_storeStrong((id *)&self->_adaptationContext, a3);
    if ((v7 & 1) == 0)
      -[TILanguageSelectionController updateActiveInputModesSuppressingNotification:](self, "updateActiveInputModesSuppressingNotification:", 0);
  }

}

- (TILanguageModelAdaptationContext)adaptationContext
{
  return self->_adaptationContext;
}

- (void)feedBufferedTokenStringsToModel
{
  vector<TITokenID, std::allocator<TITokenID>> *p_m_buffered_tokens;
  void *v4;
  TITokenID *begin;
  unint64_t v6;
  TITokenID v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;
  id v22;

  p_m_buffered_tokens = &self->m_buffered_tokens;
  -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILanguageSelectionController reportTypedTokens:activeInputModes:](TILanguageSelectionController, "reportTypedTokens:activeInputModes:", p_m_buffered_tokens, v4);

  begin = self->m_buffered_tokens.__begin_;
  if (self->m_buffered_tokens.__end_ == begin)
  {
    v21 = &stru_1EA1081D0;
  }
  else
  {
    v6 = 0;
    v21 = &stru_1EA1081D0;
    do
    {
      v7 = begin[v6];
      -[TILanguageSelectionController bufferedTokenStrings](self, "bufferedTokenStrings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "length"))
      {
        if (-[__CFString length](v21, "length")
          && v7.word_id - 500 <= 0xFFFFFE0C
          && (v10 = -[__CFString _lastLongCharacter](v21, "_lastLongCharacter"),
              objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              LOBYTE(v10) = objc_msgSend(v11, "longCharacterIsMember:", v10),
              v11,
              (v10 & 1) == 0))
        {
          -[__CFString stringByAppendingFormat:](v21, "stringByAppendingFormat:", CFSTR(" "));
          v14 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v14;
        }
        else
        {
          v12 = v21;
        }
        v22 = v12;
        objc_msgSend(v12, "stringByAppendingString:", v9);
        v13 = objc_claimAutoreleasedReturnValue();

        v21 = (__CFString *)v13;
      }

      ++v6;
      begin = self->m_buffered_tokens.__begin_;
    }
    while (v6 < self->m_buffered_tokens.__end_ - begin);
  }
  if (-[__CFString length](v21, "length"))
  {
    -[TILanguageSelectionController adaptationContext](self, "adaptationContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recipientNameDigest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[TILanguageSelectionController adaptationContext](self, "adaptationContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[TILanguageSelectionController languageLikelihoodModel](self, "languageLikelihoodModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addEvidence:timestamp:adaptationType:forRecipient:app:language:", v21, 0, v16, v18, 0, CFAbsoluteTimeGetCurrent());

    -[TILanguageSelectionController updateActiveInputModesSuppressingNotification:](self, "updateActiveInputModesSuppressingNotification:", 0);
  }
  -[TILanguageSelectionController bufferedTokenStrings](self, "bufferedTokenStrings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeAllObjects");

  self->m_buffered_tokens.__end_ = self->m_buffered_tokens.__begin_;
}

- (NSMutableArray)bufferedTokenStrings
{
  return self->_bufferedTokenStrings;
}

+ (void)reportTypedTokens:(const void *)a3 activeInputModes:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  void *v28;
  id v29;
  int v30;
  uint64_t *v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[2];
  BOOL (*v37)(uint64_t, int);
  void *v38;
  int v39;
  _QWORD v40[2];
  BOOL (*v41)(uint64_t, int);
  void *v42;
  int v43;
  _QWORD v44[2];
  BOOL (*v45)(uint64_t, int);
  void *v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if ((unint64_t)objc_msgSend(v5, "count") >= 2 && *(_QWORD *)a3 != *((_QWORD *)a3 + 1))
  {
    v6 = (void *)objc_opt_new();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v49 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "locale");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v9);
    }

    TIStatisticGetKeyForMultilingual();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarSetValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v15, "UTF8String"));

    v17 = MEMORY[0x1E0C809B0];
    v18 = *(uint64_t **)a3;
    v19 = (uint64_t *)*((_QWORD *)a3 + 1);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v45 = __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke;
    v46 = &__block_descriptor_36_e21_B16__0_TITokenID_II_8l;
    v47 = v16;
    v20 = v44;
    while (v18 != v19)
    {
      v21 = *v18++;
      ((uint64_t (*)(_QWORD *, uint64_t))v45)(v20, v21);
    }

    TIStatisticGetKeyForMultilingual();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarAddValue();

    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(v22) = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v23, "UTF8String"));

    v24 = *(uint64_t **)a3;
    v25 = (uint64_t *)*((_QWORD *)a3 + 1);
    v40[0] = v17;
    v40[1] = 3221225472;
    v41 = __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke_2;
    v42 = &__block_descriptor_36_e21_B16__0_TITokenID_II_8l;
    v43 = (int)v22;
    v26 = v40;
    while (v24 != v25)
    {
      v27 = *v24++;
      ((uint64_t (*)(_QWORD *, uint64_t))v41)(v26, v27);
    }

    TIStatisticGetKeyForMultilingual();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarAddValue();

    if (objc_msgSend(v6, "count") == 3)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
      v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v30 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v29, "UTF8String"));

      v31 = *(uint64_t **)a3;
      v32 = (uint64_t *)*((_QWORD *)a3 + 1);
      v36[0] = v17;
      v36[1] = 3221225472;
      v37 = __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke_3;
      v38 = &__block_descriptor_36_e21_B16__0_TITokenID_II_8l;
      v39 = v30;
      v33 = v36;
      while (v31 != v32)
      {
        v34 = *v31++;
        ((uint64_t (*)(_QWORD *, uint64_t))v37)(v33, v34);
      }

      TIStatisticGetKeyForMultilingual();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarAddValue();

    }
  }

}

- (TILanguageSelectionController)init
{
  void *v3;
  _TIMultilingualPreferences *v4;
  TILanguageSelectionController *v5;

  +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel](_TILanguageLikelihoodModel, "sharedLanguageLikelihoodModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(_TIMultilingualPreferences);
  v5 = -[TILanguageSelectionController initWithLanguageLikelihoodModel:preferenceProvider:](self, "initWithLanguageLikelihoodModel:preferenceProvider:", v3, v4);

  return v5;
}

- (TILanguageSelectionController)initWithLanguageLikelihoodModel:(id)a3 preferenceProvider:(id)a4
{
  id v7;
  id v8;
  TILanguageSelectionController *v9;
  TILanguageSelectionController *v10;
  NSArray *v11;
  NSArray *activeInputModes;
  NSArray *v13;
  NSArray *inferredAdditionalInputModes;
  NSArray *v15;
  NSArray *preferredAdditionalInputModes;
  NSMutableDictionary *v17;
  NSMutableDictionary *inputModeProbabilities;
  NSDictionary *v19;
  NSDictionary *referenceInputModeProbabilities;
  NSMutableArray *v21;
  NSMutableArray *bufferedTokenStrings;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v29;

  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)TILanguageSelectionController;
  v9 = -[TILanguageSelectionController init](&v29, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_languageLikelihoodModel, a3);
    objc_storeStrong((id *)&v10->_preferenceProvider, a4);
    v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    activeInputModes = v10->_activeInputModes;
    v10->_activeInputModes = v11;

    v13 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    inferredAdditionalInputModes = v10->_inferredAdditionalInputModes;
    v10->_inferredAdditionalInputModes = v13;

    v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    preferredAdditionalInputModes = v10->_preferredAdditionalInputModes;
    v10->_preferredAdditionalInputModes = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inputModeProbabilities = v10->_inputModeProbabilities;
    v10->_inputModeProbabilities = v17;

    v19 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    referenceInputModeProbabilities = v10->_referenceInputModeProbabilities;
    v10->_referenceInputModeProbabilities = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    bufferedTokenStrings = v10->_bufferedTokenStrings;
    v10->_bufferedTokenStrings = v21;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v10, sel_appleKeyboardsPreferencesChanged_, CFSTR("AppleKeyboardsPreferencesChangedNotification_Private"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v10, sel_appleKeyboardsInternalSettingsChanged_, CFSTR("AppleKeyboardsInternalSettingsChangedNotification"), 0);

  }
  -[TILanguageSelectionController fetchPreferredSecondaryInputMode](v10, "fetchPreferredSecondaryInputMode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setPreferredSecondaryInputMode:](v10, "setPreferredSecondaryInputMode:", v25);

  -[TILanguageSelectionController fetchPreferredAdditionalInputModes](v10, "fetchPreferredAdditionalInputModes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setPreferredAdditionalInputModes:](v10, "setPreferredAdditionalInputModes:", v26);

  -[TILanguageSelectionController fetchUserEnabledInputModes](v10, "fetchUserEnabledInputModes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setUserEnabledInputModes:](v10, "setUserEnabledInputModes:", v27);

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TILanguageSelectionController;
  -[TILanguageSelectionController dealloc](&v4, sel_dealloc);
}

- (id)fetchUserEnabledInputModes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController preferenceProvider](self, "preferenceProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userEnabledInputModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_opt_class();
  -[TILanguageSelectionController preferenceProvider](self, "preferenceProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userPreferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputModesForLanguageIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(v3, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILanguageSelectionController multilingualInputModesForInputModes:](TILanguageSelectionController, "multilingualInputModesForInputModes:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchUserEnabledInputModesExcludingPreferredLanguages
{
  void *v2;
  void *v3;
  void *v4;

  -[TILanguageSelectionController preferenceProvider](self, "preferenceProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userEnabledInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILanguageSelectionController multilingualInputModesForInputModes:](TILanguageSelectionController, "multilingualInputModesForInputModes:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)fetchPreferredSecondaryInputMode
{
  void *v2;
  void *v3;

  -[TILanguageSelectionController preferenceProvider](self, "preferenceProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredSecondaryInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fetchPreferredAdditionalInputModes
{
  void *v2;
  void *v3;

  -[TILanguageSelectionController preferenceProvider](self, "preferenceProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredAdditionalInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)appleKeyboardsPreferencesChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[TILanguageSelectionController fetchUserEnabledInputModes](self, "fetchUserEnabledInputModes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setUserEnabledInputModes:](self, "setUserEnabledInputModes:", v4);

  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController userEnabledInputModes](self, "userEnabledInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController fetchUserEnabledInputModesExcludingPreferredLanguages](self, "fetchUserEnabledInputModesExcludingPreferredLanguages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:enabledExcludingPreferredLanguages:](TILanguageSelectionController, "inferSecondaryInputModeForPrimary:enabled:isSimulation:enabledExcludingPreferredLanguages:", v5, v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setInferredSecondaryInputMode:](self, "setInferredSecondaryInputMode:", v8);

  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILanguageSelectionController inferAdditionalInputModesForPrimary:](TILanguageSelectionController, "inferAdditionalInputModesForPrimary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setInferredAdditionalInputModes:](self, "setInferredAdditionalInputModes:", v10);

  -[TILanguageSelectionController updateActiveInputModesSuppressingNotification:](self, "updateActiveInputModesSuppressingNotification:", 0);
}

- (void)appleKeyboardsInternalSettingsChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[TILanguageSelectionController fetchPreferredSecondaryInputMode](self, "fetchPreferredSecondaryInputMode", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setPreferredSecondaryInputMode:](self, "setPreferredSecondaryInputMode:", v4);

  -[TILanguageSelectionController fetchPreferredAdditionalInputModes](self, "fetchPreferredAdditionalInputModes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setPreferredAdditionalInputModes:](self, "setPreferredAdditionalInputModes:", v5);

  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController userEnabledInputModes](self, "userEnabledInputModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController fetchUserEnabledInputModesExcludingPreferredLanguages](self, "fetchUserEnabledInputModesExcludingPreferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:enabledExcludingPreferredLanguages:](TILanguageSelectionController, "inferSecondaryInputModeForPrimary:enabled:isSimulation:enabledExcludingPreferredLanguages:", v6, v7, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setInferredSecondaryInputMode:](self, "setInferredSecondaryInputMode:", v9);

  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILanguageSelectionController inferAdditionalInputModesForPrimary:](TILanguageSelectionController, "inferAdditionalInputModesForPrimary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController setInferredAdditionalInputModes:](self, "setInferredAdditionalInputModes:", v11);

  -[TILanguageSelectionController updateActiveInputModesSuppressingNotification:](self, "updateActiveInputModesSuppressingNotification:", 0);
}

- (void)updateActiveInputModesSuppressingNotification:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 136315650;
    v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
    v31 = 2112;
    v32 = v6;
    v33 = 2112;
    v34 = v8;
    _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Found primary input mode = %@ with original identifier = %@", (uint8_t *)&v29, 0x20u);

  }
  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);

    }
  }
  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController secondaryInputModeForUpdatedPrimaryInputMode:](self, "secondaryInputModeForUpdatedPrimaryInputMode:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "originalIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315650;
      v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
      v31 = 2112;
      v32 = v13;
      v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Found secondary input mode = %@ with original identifier = %@", (uint8_t *)&v29, 0x20u);

    }
    objc_msgSend(v5, "addObject:", v13);
  }
  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController additionalInputModesForUpdatedPrimaryInputMode:withSecondaryInputMode:](self, "additionalInputModesForUpdatedPrimaryInputMode:withSecondaryInputMode:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v16);
  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (id)v17;
  if (!v13 && v17)
  {
    v19 = _os_feature_enabled_impl();

    if ((v19 & 1) != 0)
      goto LABEL_18;
    -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageSelectionController dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:](self, "dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:", v20, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v18 = v18;

      v5 = v18;
    }
  }

LABEL_18:
  if (-[TILanguageSelectionController didUpdatedInputModesChange:](self, "didUpdatedInputModesChange:", v5))
  {
    -[TILanguageSelectionController setActiveInputModes:](self, "setActiveInputModes:", v5);
    -[TILanguageSelectionController updateInputModeProbabilities](self, "updateInputModeProbabilities");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[TILanguageSelectionController adaptationContext](self, "adaptationContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recipientNameDigest");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315650;
      v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
      v31 = 2112;
      v32 = v22;
      v33 = 2112;
      v34 = v23;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Activating new input modes (recipient=%@) = %@", (uint8_t *)&v29, 0x20u);

    }
    if (!a3)
    {
      -[TILanguageSelectionController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "didUpdateInputModes:", self);
LABEL_30:

    }
  }
  else
  {
    v25 = -[TILanguageSelectionController updateInputModeProbabilities](self, "updateInputModeProbabilities");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[TILanguageSelectionController adaptationContext](self, "adaptationContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "recipientNameDigest");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 136315650;
      v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
      v31 = 2112;
      v32 = v27;
      v33 = 2112;
      v34 = v28;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Updating input mode probs (recipient=%@) = %@", (uint8_t *)&v29, 0x20u);

    }
    if (v25 && !a3)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v29 = 136315138;
        v30 = "-[TILanguageSelectionController updateActiveInputModesSuppressingNotification:]";
        _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Notifying delegate about significant probability change", (uint8_t *)&v29, 0xCu);
      }
      -[TILanguageSelectionController delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "didUpdateInputModeProbabilities:", self);
      goto LABEL_30;
    }
  }

}

- (BOOL)didUpdatedInputModesChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqualToSet:", v8);
    v4 = (id)v8;
  }
  else
  {
    -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "isEqualToArray:", v7);
  }

  return v9 ^ 1;
}

- (BOOL)didProbabilityChangeSignificantly
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  void *v17;
  float v18;
  float v19;
  float v20;
  BOOL result;
  void *v22;
  unint64_t v23;

  -[TILanguageSelectionController referenceInputModeProbabilities](self, "referenceInputModeProbabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 != v6)
    return 1;
  -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
    return 0;
  v9 = 0;
  while (1)
  {
    -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[TILanguageSelectionController referenceInputModeProbabilities](self, "referenceInputModeProbabilities");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    v15 = v14;

    -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;

    v20 = vabds_f32(v15, v19);
    result = v20 >= 0.05;
    if (v20 >= 0.05)
      break;
    ++v9;
    -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v9 >= v23)
      return 0;
  }
  return result;
}

- (BOOL)updateInputModeProbabilities
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float *v16;
  float *v17;
  float v18;
  float v19;
  NSObject *v20;
  float *v21;
  float *v22;
  NSObject *v23;
  float *v24;
  float *v25;
  float v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t v53[4];
  void *v54;
  __int128 buf;
  uint64_t v56;
  __n128 (*v57)(__n128 *, __n128 *);
  void (*v58)(uint64_t);
  const char *v59;
  void *__p;
  void *v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Update input mode probabilities"), "-[TILanguageSelectionController updateInputModeProbabilities]");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v45;
        _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v50 != v10)
            objc_enumerationMutation(v7);
          _TILSCLanguageForInputMode(*(TIInputMode **)(*((_QWORD *)&v49 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v63, 16);
      }
      while (v9);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v56 = 0x4812000000;
    v57 = __Block_byref_object_copy__14226;
    v58 = __Block_byref_object_dispose__14227;
    v59 = "";
    __p = 0;
    v61 = 0;
    v62 = 0;
    -[TILanguageSelectionController adaptationContext](self, "adaptationContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "recipientNameDigest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[TILanguageSelectionController languageLikelihoodModel](self, "languageLikelihoodModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __61__TILanguageSelectionController_updateInputModeProbabilities__block_invoke;
    v48[3] = &unk_1EA103CD0;
    v48[4] = &buf;
    objc_msgSend(v15, "priorProbabilityForLanguages:recipient:handler:", v6, v14, v48);

    v16 = *(float **)(*((_QWORD *)&buf + 1) + 48);
    v17 = *(float **)(*((_QWORD *)&buf + 1) + 56);
    if (v16 == v17)
      goto LABEL_30;
    v18 = 0.0;
    do
    {
      v19 = *v16++;
      v18 = v18 + v19;
    }
    while (v16 != v17);
    if (v18 <= 0.0)
    {
LABEL_30:
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        TIOSLogFacility();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s All weights are zero -- dividing probability equally"), "-[TILanguageSelectionController updateInputModeProbabilities]");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v53 = 138412290;
          v54 = v46;
          _os_log_debug_impl(&dword_1DA6F2000, v23, OS_LOG_TYPE_DEBUG, "%@", v53, 0xCu);

        }
      }
      v25 = *(float **)(*((_QWORD *)&buf + 1) + 48);
      v24 = *(float **)(*((_QWORD *)&buf + 1) + 56);
      if (v24 != v25)
      {
        v26 = 1.0 / (float)(unint64_t)(v24 - v25);
        do
          *v25++ = v26;
        while (v25 != v24);
      }
    }
    else
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        TIOSLogFacility();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Scaling sum weights to 1."), "-[TILanguageSelectionController updateInputModeProbabilities]");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v53 = 138412290;
          v54 = v47;
          _os_log_debug_impl(&dword_1DA6F2000, v20, OS_LOG_TYPE_DEBUG, "%@", v53, 0xCu);

        }
      }
      v21 = *(float **)(*((_QWORD *)&buf + 1) + 48);
      v22 = *(float **)(*((_QWORD *)&buf + 1) + 56);
      while (v21 != v22)
      {
        *v21 = *v21 / v18;
        ++v21;
      }
    }
    v27 = *((_QWORD *)&buf + 1) + 48;
    v28 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 56) - *(_QWORD *)(*((_QWORD *)&buf + 1) + 48);
    if (v28 == 8)
    {
      -[TILanguageSelectionController rebalanceBilingualInputModeWeights:](self, "rebalanceBilingualInputModeWeights:", v27);
    }
    else if (v28 >= 9)
    {
      -[TILanguageSelectionController rebalanceMultipleInputModeWeights:](self, "rebalanceMultipleInputModeWeights:", v27);
    }
    -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeAllObjects");

    -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (v33)
    {
      v34 = 0;
      do
      {
        -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectAtIndex:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)&buf + 1) + 48) + 4 * v34);
        -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v39) = v37;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setObject:forKey:", v40, v36);

        ++v34;
        -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

      }
      while (v34 < v42);
    }
    v30 = -[TILanguageSelectionController didProbabilityChangeSignificantly](self, "didProbabilityChangeSignificantly");
    if (v30)
    {
      -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[TILanguageSelectionController setReferenceInputModeProbabilities:](self, "setReferenceInputModeProbabilities:", v43);

    }
    _Block_object_dispose(&buf, 8);
    if (__p)
    {
      v61 = __p;
      operator delete(__p);
    }

  }
  else
  {
    -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeAllObjects");

    -[TILanguageSelectionController setReferenceInputModeProbabilities:](self, "setReferenceInputModeProbabilities:", MEMORY[0x1E0C9AA70]);
    return 0;
  }
  return v30;
}

- (id)secondaryInputModeForUpdatedPrimaryInputMode:(id)a3
{
  void *v4;
  void *v5;
  TIInputMode *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  TIInputMode *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  _TILSCLanguageForInputMode((TIInputMode *)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController preferredSecondaryInputMode](self, "preferredSecondaryInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TILanguageSelectionController preferredSecondaryInputMode](self, "preferredSecondaryInputMode");
    v6 = (TIInputMode *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[TIInputMode originalIdentifier](v6, "originalIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[TILanguageSelectionController secondaryInputModeForUpdatedPrimaryInputMode:]";
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Configured secondary input mode = %@ with original identifier = %@", (uint8_t *)&v12, 0x20u);

    }
    _TILSCLanguageForInputMode(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v4) & 1) != 0)
    {

      v6 = 0;
    }
  }
  else
  {
    -[TILanguageSelectionController inferredSecondaryInputMode](self, "inferredSecondaryInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v6 = 0;
      goto LABEL_13;
    }
    -[TILanguageSelectionController inferredSecondaryInputMode](self, "inferredSecondaryInputMode");
    v6 = (TIInputMode *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      -[TIInputMode originalIdentifier](v6, "originalIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 136315650;
      v13 = "-[TILanguageSelectionController secondaryInputModeForUpdatedPrimaryInputMode:]";
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Inferred secondary input mode = %@ with original identifier = %@", (uint8_t *)&v12, 0x20u);

    }
    _TILSCLanguageForInputMode(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  return v6;
}

- (id)additionalInputModesForUpdatedPrimaryInputMode:(id)a3 withSecondaryInputMode:(id)a4
{
  TIInputMode *v6;
  TIInputMode *v7;
  TIInputMode *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  TIInputMode *v19;
  void *v20;
  char v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  TIInputMode *v29;
  void *v30;
  TIInputMode *v32;
  TIInputMode *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = (TIInputMode *)a3;
  v7 = (TIInputMode *)a4;
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v6 && v7 && TILSCMaximumActiveInputModes >= 3 && _os_feature_enabled_impl())
  {
    v9 = (void *)objc_opt_new();
    _TILSCLanguageForInputMode(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _TILSCLanguageForInputMode(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageSelectionController preferredAdditionalInputModes](self, "preferredAdditionalInputModes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      -[TILanguageSelectionController preferredAdditionalInputModes](self, "preferredAdditionalInputModes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v15)
      {
        v16 = v15;
        v32 = v6;
        v33 = v8;
        v17 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v39 != v17)
              objc_enumerationMutation(v14);
            v19 = *(TIInputMode **)(*((_QWORD *)&v38 + 1) + 8 * i);
            _TILSCLanguageForInputMode(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isEqualToString:", v10);
            v22 = objc_msgSend(v20, "isEqualToString:", v11);
            if ((v21 & 1) == 0 && (v22 & 1) == 0)
              objc_msgSend(v9, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v16);
        v6 = v32;
LABEL_25:
        v8 = v33;
      }
    }
    else
    {
      -[TILanguageSelectionController inferredAdditionalInputModes](self, "inferredAdditionalInputModes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

      if (!v24)
      {
LABEL_27:

        goto LABEL_28;
      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      -[TILanguageSelectionController inferredAdditionalInputModes](self, "inferredAdditionalInputModes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v25)
      {
        v26 = v25;
        v33 = v8;
        v27 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v35 != v27)
              objc_enumerationMutation(v14);
            v29 = *(TIInputMode **)(*((_QWORD *)&v34 + 1) + 8 * j);
            _TILSCLanguageForInputMode(v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v29);

          }
          v26 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v26);
        goto LABEL_25;
      }
    }

    goto LABEL_27;
  }
LABEL_28:

  return v9;
}

- (id)dynamicallyDetectedInputModesForPrimaryInputMode:(id)a3 isSimulation:(BOOL)a4
{
  _BOOL4 v4;
  TIInputMode *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TIInputMode *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = (TIInputMode *)a3;
  if (v6 && (!_os_feature_enabled_impl() || v4))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _TILSCLanguageForInputMode(v6);
    v9 = objc_claimAutoreleasedReturnValue();
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Primary language = %@"), "-[TILanguageSelectionController dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:]", v9);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v24;
        _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(v8, "addObject:", v9);
    -[TILanguageSelectionController languageLikelihoodModel](self, "languageLikelihoodModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rankedLanguagesForRecipient:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)v9;
    v28 = v6;
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Detected languages = %@"), "-[TILanguageSelectionController dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:]", v12);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v25;
        _os_log_debug_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
LABEL_19:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v18);
        if ((objc_msgSend(v8, "containsObject:", v19) & 1) == 0)
        {
          -[TILanguageSelectionController userEnabledInputModes](self, "userEnabledInputModes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[TILanguageSelectionController inferInputModeForLanguage:enabled:](TILanguageSelectionController, "inferInputModeForLanguage:enabled:", v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 && objc_msgSend(v21, "supportsMultilingualKeyboard"))
          {
            if (TICanLogMessageAtLevel_onceToken != -1)
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
            if (TICanLogMessageAtLevel_logLevel >= 2)
            {
              TIOSLogFacility();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Adding active input mode = %@"), "-[TILanguageSelectionController dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:]", v21);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v35 = v26;
                _os_log_debug_impl(&dword_1DA6F2000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

              }
            }
            objc_msgSend(v7, "addObject:", v21);
            objc_msgSend(v8, "addObject:", v19);
          }

        }
        if ((unint64_t)objc_msgSend(v7, "count") > 1)
          break;
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v16)
            goto LABEL_19;
          break;
        }
      }
    }

    v6 = v28;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)rebalanceBilingualInputModeWeights:(void *)a3
{
  float *v3;
  float v6;
  float v7;
  float v8;
  NSObject *v9;
  float *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  float v22;
  NSObject *v23;
  NSObject *v24;
  float *v25;
  float v26;
  void *v27;
  void *v28;
  void *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = *(float **)a3;
  if (*((_QWORD *)a3 + 1) - *(_QWORD *)a3 != 8)
    return;
  v6 = *v3;
  v7 = 0.5;
  if (*v3 < 0.5)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
    {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      v7 = 0.5;
    }
    v8 = v7 - v6;
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Boosting primary language weight to minimum (%.2g)"), "-[TILanguageSelectionController rebalanceBilingualInputModeWeights:]", 0x3FE0000000000000);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v28;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v10 = *(float **)a3;
    v11 = *(float *)(*(_QWORD *)a3 + 4) - v8;
    *v10 = v8 + **(float **)a3;
    v10[1] = v11;
  }
  -[TILanguageSelectionController preferredSecondaryInputMode](self, "preferredSecondaryInputMode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqual:", v14))
  {

    goto LABEL_13;
  }
  -[TILanguageSelectionController inferredSecondaryInputMode](self, "inferredSecondaryInputMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndex:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v15, "isEqual:", v17);

  if (v18)
  {
LABEL_13:
    -[TILanguageSelectionController activeInputModes](self, "activeInputModes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndex:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "normalizedIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v21, "hasPrefix:", CFSTR("nl_")) & 1) != 0
      || objc_msgSend(v21, "hasPrefix:", CFSTR("hi_Latn")))
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      v22 = 0.1;
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        TIOSLogFacility();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Using reduced minimum prior %.2g for language %s"), "-[TILanguageSelectionController rebalanceBilingualInputModeWeights:]", 0x3FB99999A0000000, objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v27;
          _os_log_debug_impl(&dword_1DA6F2000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }
    }
    else
    {
      v22 = 0.1666;
    }

    goto LABEL_24;
  }
  v22 = 0.0476;
LABEL_24:
  if (*(float *)(*(_QWORD *)a3 + 4) < v22)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Boosting secondary language weight to minimum (%.2g)"), "-[TILanguageSelectionController rebalanceBilingualInputModeWeights:]", v22);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v31 = v29;
        _os_log_debug_impl(&dword_1DA6F2000, v24, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    v25 = *(float **)a3;
    v26 = *(float *)(*(_QWORD *)a3 + 4);
    *v25 = **(float **)a3 - (float)(v22 - v26);
    v25[1] = v26 + (float)(v22 - v26);
  }
}

- (vector<float,)retreiveExcessInputModeWeightRatiosFromCurrentWeights:()vector<float
{
  float *v4;
  float *v5;
  float *v7;
  float *v8;
  float *v9;
  float v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  float *v14;
  float *v15;
  int v16;
  float v17;
  float *v18;
  float v19;
  float *var1;
  float *var0;
  float *v22;
  float *v23;
  float v24;
  float *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  float *v29;
  int v30;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v4 = *(float **)a4;
  v5 = (float *)*((_QWORD *)a4 + 1);
  if (*(float **)a4 != v5)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      if (*v4 <= 0.15)
        v10 = 0.0;
      else
        v10 = *v4 + -0.15;
      if (v8 >= v9)
      {
        v11 = v8 - v7;
        v12 = v11 + 1;
        if ((unint64_t)(v11 + 1) >> 62)
LABEL_52:
          abort();
        if (((char *)v9 - (char *)v7) >> 1 > v12)
          v12 = ((char *)v9 - (char *)v7) >> 1;
        if ((unint64_t)((char *)v9 - (char *)v7) >= 0x7FFFFFFFFFFFFFFCLL)
          self = (vector<float, std::allocator<float>> *)0x3FFFFFFFFFFFFFFFLL;
        else
          self = (vector<float, std::allocator<float>> *)v12;
        if (self)
          self = (vector<float, std::allocator<float>> *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((unint64_t)self);
        else
          v13 = 0;
        v14 = (float *)((char *)self + 4 * v11);
        *v14 = v10;
        v15 = v14 + 1;
        while (v8 != v7)
        {
          v16 = *((_DWORD *)v8-- - 1);
          *((_DWORD *)v14-- - 1) = v16;
        }
        v9 = (float *)((char *)self + 4 * v13);
        if (v7)
          operator delete(v7);
        v7 = v14;
        v8 = v15;
      }
      else
      {
        *v8++ = v10;
      }
      ++v4;
    }
    while (v4 != v5);
    if (v7 == v8)
      goto LABEL_50;
    v17 = 0.0;
    v18 = v7;
    do
    {
      v19 = *v18++;
      v17 = v17 + v19;
    }
    while (v18 != v8);
    var1 = 0;
    var0 = retstr->var2.var0;
    v22 = retstr->var0;
    v23 = v7;
    do
    {
      if (*v23 == 0.0)
        v24 = 0.0;
      else
        v24 = *v23 / v17;
      if (var1 >= var0)
      {
        v26 = var1 - v22;
        v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 62)
          goto LABEL_52;
        if (((char *)var0 - (char *)v22) >> 1 > v27)
          v27 = ((char *)var0 - (char *)v22) >> 1;
        if ((unint64_t)((char *)var0 - (char *)v22) >= 0x7FFFFFFFFFFFFFFCLL)
          self = (vector<float, std::allocator<float>> *)0x3FFFFFFFFFFFFFFFLL;
        else
          self = (vector<float, std::allocator<float>> *)v27;
        if (self)
        {
          self = (vector<float, std::allocator<float>> *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((unint64_t)self);
          var1 = retstr->var1;
        }
        else
        {
          v28 = 0;
        }
        v29 = (float *)((char *)self + 4 * v26);
        *v29 = v24;
        v25 = v29 + 1;
        while (var1 != v22)
        {
          v30 = *((_DWORD *)var1-- - 1);
          *((_DWORD *)v29-- - 1) = v30;
        }
        var0 = (float *)((char *)self + 4 * v28);
        retstr->var0 = v29;
        retstr->var1 = v25;
        retstr->var2.var0 = var0;
        if (v22)
          operator delete(v22);
        v22 = v29;
      }
      else
      {
        *var1 = v24;
        v25 = var1 + 1;
      }
      retstr->var1 = v25;
      ++v23;
      var1 = v25;
    }
    while (v23 != v8);
    if (v7)
LABEL_50:
      operator delete(v7);
  }
  return self;
}

- (void)rebalanceMultipleInputModeWeights:(void *)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  float v9;
  NSObject *v10;
  float v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  __int128 __p;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (*((_QWORD *)a3 + 1) - *(_QWORD *)a3 >= 0xCuLL)
  {
    if (_os_feature_enabled_impl())
    {
      v5 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
      if ((int)(v5 >> 2) >= 1)
      {
        v6 = 0;
        v7 = (v5 >> 2);
        v8 = 0x1E0CB3000uLL;
        do
        {
          v9 = *(float *)(*(_QWORD *)a3 + 4 * v6);
          if (v9 < 0.15)
          {
            if (TICanLogMessageAtLevel_onceToken != -1)
              dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
            if (TICanLogMessageAtLevel_logLevel >= 2)
            {
              TIOSLogFacility();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("%s Boosting language %i weight to minimum (%.2g)"), "-[TILanguageSelectionController rebalanceMultipleInputModeWeights:]", (v6 + 1), 0x3FC3333340000000);
                v15 = v8;
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(__p) = 138412290;
                *(_QWORD *)((char *)&__p + 4) = v16;
                _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&__p, 0xCu);

                v8 = v15;
              }

            }
            v11 = 0.15 - v9;
            -[TILanguageSelectionController retreiveExcessInputModeWeightRatiosFromCurrentWeights:](self, "retreiveExcessInputModeWeightRatiosFromCurrentWeights:", a3);
            v12 = 0;
            v13 = (float *)__p;
            v14 = *(_QWORD *)a3;
            do
            {
              if (v6 != v12)
                *(float *)(v14 + 4 * v12) = *(float *)(v14 + 4 * v12) - (float)(v11 * v13[v12]);
              ++v12;
            }
            while (v7 != v12);
            *(float *)(v14 + 4 * v6) = v11 + *(float *)(v14 + 4 * v6);
            if (v13)
            {
              *((_QWORD *)&__p + 1) = v13;
              operator delete(v13);
            }
          }
          ++v6;
        }
        while (v6 != v7);
      }
    }
  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (self->_delegate != a3)
  {
    self->_delegate = (TILanguageSelectionControllerDelegate *)a3;
    v4 = a3;
    objc_msgSend(v4, "primaryInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageSelectionController setPrimaryInputMode:](self, "setPrimaryInputMode:", v5);

    -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageSelectionController userEnabledInputModes](self, "userEnabledInputModes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageSelectionController fetchUserEnabledInputModesExcludingPreferredLanguages](self, "fetchUserEnabledInputModesExcludingPreferredLanguages");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:enabledExcludingPreferredLanguages:](TILanguageSelectionController, "inferSecondaryInputModeForPrimary:enabled:isSimulation:enabledExcludingPreferredLanguages:", v6, v7, 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TILanguageSelectionController setInferredSecondaryInputMode:](self, "setInferredSecondaryInputMode:", v9);

    -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[TILanguageSelectionController inferAdditionalInputModesForPrimary:](TILanguageSelectionController, "inferAdditionalInputModesForPrimary:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[TILanguageSelectionController setInferredAdditionalInputModes:](self, "setInferredAdditionalInputModes:", v11);
    -[TILanguageSelectionController updateActiveInputModesSuppressingNotification:](self, "updateActiveInputModesSuppressingNotification:", 1);
  }
}

- (float)priorProbabilityForInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;

  v4 = a3;
  -[TILanguageSelectionController inputModeProbabilities](self, "inputModeProbabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "floatValue");
  v8 = v7;

  return v8;
}

- (BOOL)bufferIsCompatibleWithContext:(const TITokenID *)a3 contextLength:(unint64_t)a4
{
  TITokenID *begin;
  TITokenID *end;
  unint64_t v6;
  const TITokenID *v7;
  unsigned int lexicon_id;
  unsigned int word_id;
  unsigned int v10;
  unsigned int v11;
  _BOOL4 v13;
  const TITokenID *v15;
  TITokenID *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;

  begin = self->m_buffered_tokens.__begin_;
  end = self->m_buffered_tokens.__end_;
  v6 = end - begin;
  if (v6 < a4)
  {
    if (begin != end)
    {
      v7 = &a3[a4 - v6];
      do
      {
        lexicon_id = begin->lexicon_id;
        word_id = begin->word_id;
        ++begin;
        v10 = v7->lexicon_id;
        v11 = v7->word_id;
        ++v7;
        v13 = lexicon_id == v10 && word_id == v11;
      }
      while (v13 && begin != end);
      return v13;
    }
LABEL_30:
    LOBYTE(v13) = 1;
    return v13;
  }
  if (!a4)
    goto LABEL_30;
  v15 = &a3[a4];
  v16 = &begin[v6 - a4];
  do
  {
    v17 = a3->lexicon_id;
    v18 = a3->word_id;
    ++a3;
    v19 = v16->lexicon_id;
    v20 = v16->word_id;
    ++v16;
    v13 = v17 == v19 && v18 == v20;
  }
  while (v13 && a3 != v15);
  return v13;
}

- (void)addTokenString:(id)a3 tokenID:(TITokenID)a4 context:(const TITokenID *)a5 contextLength:(unint64_t)a6
{
  _BOOL4 v10;
  unint64_t v11;
  void *v12;
  TITokenID *value;
  TITokenID *end;
  TITokenID *v15;
  TITokenID *begin;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  TITokenID *v22;
  TITokenID *v23;
  TITokenID *v24;
  TITokenID *v25;
  TITokenID v26;
  id v27;

  v27 = a3;
  v10 = -[TILanguageSelectionController bufferIsCompatibleWithContext:contextLength:](self, "bufferIsCompatibleWithContext:contextLength:", a5, a6);
  v11 = *(_QWORD *)&a4 & 0xFFFFFFFF00000000;
  if (!v10
    || v11 == 0x100000000
    || v11 == 0x200000000
    || (TITokenID *)((char *)self->m_buffered_tokens.__end_ - (char *)self->m_buffered_tokens.__begin_) >= (TITokenID *)0x191)
  {
    -[TILanguageSelectionController feedBufferedTokenStringsToModel](self, "feedBufferedTokenStringsToModel");
  }
  if (v11 != 0x200000000)
  {
    -[TILanguageSelectionController bufferedTokenStrings](self, "bufferedTokenStrings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v27);

    end = self->m_buffered_tokens.__end_;
    value = self->m_buffered_tokens.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->m_buffered_tokens.__begin_;
      v17 = end - begin;
      if ((unint64_t)(v17 + 1) >> 61)
        abort();
      v18 = (char *)value - (char *)begin;
      v19 = v18 >> 2;
      if (v18 >> 2 <= (unint64_t)(v17 + 1))
        v19 = v17 + 1;
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8)
        v20 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v20 = v19;
      if (v20)
        v20 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v20);
      else
        v21 = 0;
      v22 = (TITokenID *)(v20 + 8 * v17);
      v23 = (TITokenID *)(v20 + 8 * v21);
      *v22 = a4;
      v15 = v22 + 1;
      v25 = self->m_buffered_tokens.__begin_;
      v24 = self->m_buffered_tokens.__end_;
      if (v24 != v25)
      {
        do
        {
          v26 = v24[-1];
          --v24;
          v22[-1] = v26;
          --v22;
        }
        while (v24 != v25);
        v24 = self->m_buffered_tokens.__begin_;
      }
      self->m_buffered_tokens.__begin_ = v22;
      self->m_buffered_tokens.__end_ = v15;
      self->m_buffered_tokens.__end_cap_.__value_ = v23;
      if (v24)
        operator delete(v24);
    }
    else
    {
      *end = a4;
      v15 = end + 1;
    }
    self->m_buffered_tokens.__end_ = v15;
  }

}

- (void)removeTokenString:(id)a3 tokenID:(TITokenID)a4 context:(const TITokenID *)a5 contextLength:(unint64_t)a6
{
  id v10;
  TITokenID *end;
  TITokenID v12;
  void *v13;
  void *v14;
  void *v15;
  TITokenID *value;
  TITokenID *v17;
  TITokenID *v18;
  TITokenID *begin;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  TITokenID *v25;
  TITokenID *v26;
  TITokenID *v27;
  TITokenID *v28;
  TITokenID v29;
  void *v30;
  id v31;

  v10 = a3;
  end = self->m_buffered_tokens.__end_;
  if (self->m_buffered_tokens.__begin_ != end)
  {
    v31 = v10;
    v12 = end[-1];
    self->m_buffered_tokens.__end_ = end - 1;
    -[TILanguageSelectionController bufferedTokenStrings](self, "bufferedTokenStrings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[TILanguageSelectionController bufferedTokenStrings](self, "bufferedTokenStrings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeLastObject");

    if (v12 != a4
      || !-[TILanguageSelectionController bufferIsCompatibleWithContext:contextLength:](self, "bufferIsCompatibleWithContext:contextLength:", a5, a6))
    {
      v17 = self->m_buffered_tokens.__end_;
      value = self->m_buffered_tokens.__end_cap_.__value_;
      if (v17 >= value)
      {
        begin = self->m_buffered_tokens.__begin_;
        v20 = v17 - begin;
        if ((unint64_t)(v20 + 1) >> 61)
          abort();
        v21 = (char *)value - (char *)begin;
        v22 = v21 >> 2;
        if (v21 >> 2 <= (unint64_t)(v20 + 1))
          v22 = v20 + 1;
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8)
          v23 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v23 = v22;
        if (v23)
          v23 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v23);
        else
          v24 = 0;
        v25 = (TITokenID *)(v23 + 8 * v20);
        v26 = (TITokenID *)(v23 + 8 * v24);
        *v25 = v12;
        v18 = v25 + 1;
        v28 = self->m_buffered_tokens.__begin_;
        v27 = self->m_buffered_tokens.__end_;
        if (v27 != v28)
        {
          do
          {
            v29 = v27[-1];
            --v27;
            v25[-1] = v29;
            --v25;
          }
          while (v27 != v28);
          v27 = self->m_buffered_tokens.__begin_;
        }
        self->m_buffered_tokens.__begin_ = v25;
        self->m_buffered_tokens.__end_ = v18;
        self->m_buffered_tokens.__end_cap_.__value_ = v26;
        if (v27)
          operator delete(v27);
      }
      else
      {
        *v17 = v12;
        v18 = v17 + 1;
      }
      self->m_buffered_tokens.__end_ = v18;
      -[TILanguageSelectionController bufferedTokenStrings](self, "bufferedTokenStrings");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObject:", v14);

      -[TILanguageSelectionController feedBufferedTokenStringsToModel](self, "feedBufferedTokenStringsToModel");
    }

    v10 = v31;
  }

}

- (id)simulateImplicitInputModeDetectionForPrimaryInputMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "addObject:", v4);
  -[TILanguageSelectionController primaryInputMode](self, "primaryInputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController userEnabledInputModes](self, "userEnabledInputModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TILanguageSelectionController fetchUserEnabledInputModesExcludingPreferredLanguages](self, "fetchUserEnabledInputModesExcludingPreferredLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:enabledExcludingPreferredLanguages:](TILanguageSelectionController, "inferSecondaryInputModeForPrimary:enabled:isSimulation:enabledExcludingPreferredLanguages:", v6, v7, 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "addObject:", v9);
    v10 = v5;
  }
  else
  {
    -[TILanguageSelectionController dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:](self, "dynamicallyDetectedInputModesForPrimaryInputMode:isSimulation:", v4, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (double)lastOfflineAdaptationTimeForApp:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[TILanguageSelectionController languageLikelihoodModel](self, "languageLikelihoodModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastOfflineAdaptationTimeForApp:", v4);
  v7 = v6;

  return v7;
}

- (TILanguageSelectionControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setActiveInputModes:(id)a3
{
  objc_storeStrong((id *)&self->_activeInputModes, a3);
}

- (TILanguageLikelihoodModeling)languageLikelihoodModel
{
  return self->_languageLikelihoodModel;
}

- (TIMultilingualPreferenceProviding)preferenceProvider
{
  return self->_preferenceProvider;
}

- (TIInputMode)primaryInputMode
{
  return self->_primaryInputMode;
}

- (void)setPrimaryInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_primaryInputMode, a3);
}

- (TIInputMode)preferredSecondaryInputMode
{
  return self->_preferredSecondaryInputMode;
}

- (void)setPreferredSecondaryInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSecondaryInputMode, a3);
}

- (NSArray)preferredAdditionalInputModes
{
  return self->_preferredAdditionalInputModes;
}

- (void)setPreferredAdditionalInputModes:(id)a3
{
  objc_storeStrong((id *)&self->_preferredAdditionalInputModes, a3);
}

- (TIInputMode)inferredSecondaryInputMode
{
  return self->_inferredSecondaryInputMode;
}

- (void)setInferredSecondaryInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_inferredSecondaryInputMode, a3);
}

- (NSArray)inferredAdditionalInputModes
{
  return self->_inferredAdditionalInputModes;
}

- (void)setInferredAdditionalInputModes:(id)a3
{
  objc_storeStrong((id *)&self->_inferredAdditionalInputModes, a3);
}

- (NSArray)userEnabledInputModes
{
  return self->_userEnabledInputModes;
}

- (void)setUserEnabledInputModes:(id)a3
{
  objc_storeStrong((id *)&self->_userEnabledInputModes, a3);
}

- (NSMutableDictionary)inputModeProbabilities
{
  return self->_inputModeProbabilities;
}

- (NSDictionary)referenceInputModeProbabilities
{
  return self->_referenceInputModeProbabilities;
}

- (void)setReferenceInputModeProbabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  TITokenID *begin;

  objc_storeStrong((id *)&self->_bufferedTokenStrings, 0);
  objc_storeStrong((id *)&self->_referenceInputModeProbabilities, 0);
  objc_storeStrong((id *)&self->_inputModeProbabilities, 0);
  objc_storeStrong((id *)&self->_userEnabledInputModes, 0);
  objc_storeStrong((id *)&self->_inferredAdditionalInputModes, 0);
  objc_storeStrong((id *)&self->_inferredSecondaryInputMode, 0);
  objc_storeStrong((id *)&self->_preferredAdditionalInputModes, 0);
  objc_storeStrong((id *)&self->_preferredSecondaryInputMode, 0);
  objc_storeStrong((id *)&self->_primaryInputMode, 0);
  objc_storeStrong((id *)&self->_preferenceProvider, 0);
  objc_storeStrong((id *)&self->_activeInputModes, 0);
  objc_storeStrong((id *)&self->_adaptationContext, 0);
  begin = self->m_buffered_tokens.__begin_;
  if (begin)
  {
    self->m_buffered_tokens.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_languageLikelihoodModel, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

void __61__TILanguageSelectionController_updateInputModeProbabilities__block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5;
  _QWORD *v6;
  unint64_t v7;
  float *v8;
  float *v9;
  float *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  float *v17;
  unint64_t v18;
  int v19;
  id v20;

  v5 = a2;
  v6 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  v8 = (float *)v6[7];
  v7 = v6[8];
  if ((unint64_t)v8 >= v7)
  {
    v10 = (float *)v6[6];
    v11 = v8 - v10;
    v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 62)
      abort();
    v20 = v5;
    v13 = v7 - (_QWORD)v10;
    if (v13 >> 1 > v12)
      v12 = v13 >> 1;
    v14 = (unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL;
    v15 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v14)
      v15 = v12;
    if (v15)
    {
      v15 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(v15);
      v10 = (float *)v6[6];
      v8 = (float *)v6[7];
    }
    else
    {
      v16 = 0;
    }
    v17 = (float *)(v15 + 4 * v11);
    v18 = v15 + 4 * v16;
    *v17 = a3;
    v9 = v17 + 1;
    while (v8 != v10)
    {
      v19 = *((_DWORD *)v8-- - 1);
      *((_DWORD *)v17-- - 1) = v19;
    }
    v6[6] = v17;
    v6[7] = v9;
    v6[8] = v18;
    if (v10)
      operator delete(v10);
    v5 = v20;
  }
  else
  {
    *v8 = a3;
    v9 = v8 + 1;
  }
  v6[7] = v9;

}

+ (id)sharedLanguageLikelihoodModel
{
  return +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel](_TILanguageLikelihoodModel, "sharedLanguageLikelihoodModel");
}

+ (id)multilingualInputModesForInputModes:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", &__block_literal_global_119);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectsAtIndexes:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)inferSecondaryInputModeForPrimary:(id)a3 enabled:(id)a4 isSimulation:(BOOL)a5
{
  TIInputMode *v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = (TIInputMode *)a3;
  v8 = a4;
  if (_os_feature_enabled_impl() && !a5)
  {
    -[TIInputMode additionalConfiguredLatinLanguages](v7, "additionalConfiguredLatinLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315394;
        v33 = "+[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:]";
        v34 = 2112;
        v35 = v10;
        _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Sucessfully inferred secondary input mode = %@", buf, 0x16u);
      }
      +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 136315138;
        v33 = "+[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:]";
        _os_log_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s  Unable to infer secondary input mode due to no additional input modes found for primary input mode.", buf, 0xCu);
      }
      v10 = 0;
      v12 = 0;
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v7 && (unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          _TILSCLanguageForInputMode(*(TIInputMode **)(*((_QWORD *)&v27 + 1) + 8 * v17));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v15);
    }

    _TILSCLanguageForInputMode(v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v19);
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "anyObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __88__TILanguageSelectionController_inferSecondaryInputModeForPrimary_enabled_isSimulation___block_invoke;
      v25[3] = &unk_1EA103CA8;
      v26 = v20;
      v21 = v20;
      objc_msgSend(v13, "indexesOfObjectsPassingTest:", v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectsAtIndexes:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }

    goto LABEL_24;
  }
  v12 = 0;
LABEL_25:

  return v12;
}

+ (id)inferSecondaryInputModeForPrimary:(id)a3 enabled:(id)a4 isSimulation:(BOOL)a5 enabledExcludingPreferredLanguages:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;

  v7 = a5;
  v9 = a3;
  v10 = a6;
  +[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:](TILanguageSelectionController, "inferSecondaryInputModeForPrimary:enabled:isSimulation:", v9, a4, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[TILanguageSelectionController inferSecondaryInputModeForPrimary:enabled:isSimulation:](TILanguageSelectionController, "inferSecondaryInputModeForPrimary:enabled:isSimulation:", v9, v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (id)inferAdditionalInputModesForPrimary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v3, "additionalConfiguredLatinLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 >= 2)
    {
      objc_msgSend(v3, "additionalConfiguredLatinLanguages");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (v8 >= 2)
      {
        v9 = 1;
        do
        {
          objc_msgSend(v3, "additionalConfiguredLatinLanguages");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v12);

          }
          ++v9;
          objc_msgSend(v3, "additionalConfiguredLatinLanguages");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

        }
        while (v14 > v9);
      }
    }
  }

  return v4;
}

+ (id)inferInputModeForLanguage:(id)a3 enabled:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  TIInputMode *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(TIInputMode **)(*((_QWORD *)&v18 + 1) + 8 * i);
        _TILSCLanguageForInputMode(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqualToString:", v6, (_QWORD)v18))
          objc_msgSend(v8, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "count"))
    objc_msgSend(v8, "firstObject");
  else
    objc_msgSend(a1, "inputModeForLanguageIdentifier:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)inputModeForLanguageIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  TIGetDefaultInputModesForLanguage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") < 2)
  {
    objc_msgSend(v4, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
LABEL_8:
      v12 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB34D0];
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredLocalizationsFromArray:forPreferences:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v4, "firstObject");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    if (!v11)
      goto LABEL_8;
  }
  +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v12;
}

+ (id)inputModesForLanguageIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "inputModeForLanguageIdentifier:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

BOOL __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke(uint64_t a1, int a2)
{
  return *(_DWORD *)(a1 + 32) == a2;
}

BOOL __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke_2(uint64_t a1, int a2)
{
  return *(_DWORD *)(a1 + 32) == a2;
}

BOOL __68__TILanguageSelectionController_reportTypedTokens_activeInputModes___block_invoke_3(uint64_t a1, int a2)
{
  return *(_DWORD *)(a1 + 32) == a2;
}

uint64_t __88__TILanguageSelectionController_inferSecondaryInputModeForPrimary_enabled_isSimulation___block_invoke(uint64_t a1, TIInputMode *a2)
{
  void *v3;
  uint64_t v4;

  _TILSCLanguageForInputMode(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __69__TILanguageSelectionController_multilingualInputModesForInputModes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "normalizedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0DBE158]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

@end
