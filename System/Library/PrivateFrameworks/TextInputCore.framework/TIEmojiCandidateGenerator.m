@implementation TIEmojiCandidateGenerator

- (void)updateEmojiStatusForKeyboardState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "textInputTraits");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "keyboardType");
  objc_msgSend(v4, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIEmojiCandidateGenerator updateEmojiStatusForKeyboardType:appIdentifier:](self, "updateEmojiStatusForKeyboardType:appIdentifier:", v5, v6);
}

- (void)updateEmojiStatusForKeyboardType:(unint64_t)a3 appIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enabledInputModeIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  self->m_isEmojiInputModeEnabled = objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_5743) != 0x7FFFFFFFFFFFFFFFLL;
  v9 = (a3 < 0x10) & (0x99FAu >> a3);
  if (TIGetShowEmojisByDefaultValue_onceToken != -1)
    dispatch_once(&TIGetShowEmojisByDefaultValue_onceToken, &__block_literal_global_133);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForPreferenceKey:", CFSTR("ShowEmojisByDefault"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "BOOLValue");
  if (v9)
    goto LABEL_4;
  if (v12)
  {
    v13 = 1;
LABEL_15:
    self->m_shouldShowEmojis = v13;
    goto LABEL_16;
  }
  if (self->m_isEmojiInputModeEnabled && v6)
  {
    v20 = 0;
    +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel](_TILanguageLikelihoodModel, "sharedLanguageLikelihoodModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "emojiUsageCountForApp:lastEmojiCountUpdateTime:", &stru_1EA1081D0, &v20);

    +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel](_TILanguageLikelihoodModel, "sharedLanguageLikelihoodModel", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "emojiUsageCountForApp:lastEmojiCountUpdateTime:", v6, &v19);

    if (v15)
      v18 = v17 == 0;
    else
      v18 = 1;
    v13 = !v18;
    goto LABEL_15;
  }
LABEL_4:
  self->m_shouldShowEmojis = 0;
LABEL_16:

}

uint64_t __76__TIEmojiCandidateGenerator_updateEmojiStatusForKeyboardType_appIdentifier___block_invoke()
{
  void *v0;
  uint64_t v1;

  TIInputModeGetLanguage();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("emoji"));

  return v1;
}

- (TIEmojiCandidateGenerator)initWithActiveInputModes:(id)a3
{
  id v5;
  TIEmojiCandidateGenerator *v6;
  TIEmojiCandidateGenerator *v7;
  uint64_t v8;
  NSSet *m_disabledLocales;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIEmojiCandidateGenerator;
  v6 = -[TIEmojiCandidateGenerator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_activeInputModes, a3);
    v7->m_shouldShowEmojis = 0;
    v7->m_emojiGeneratorSecondaryLanguage = 0;
    v7->m_emojiGeneratorTertiaryLanguage = 0;
    v7->m_emojiGeneratorPrimaryLanguage = 0;
    v7->m_emojiDataForSecondaryLocale = 0;
    v7->m_emojiDataForTertiaryLocale = 0;
    v7->m_emojiDataForPrimaryLocale = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("gu"), CFSTR("mr"), CFSTR("te"), CFSTR("ta"), CFSTR("pa"), CFSTR("bn"), CFSTR("gu-Latn"), CFSTR("mr-Latn"), CFSTR("te-Latn"), CFSTR("ta-Latn"), CFSTR("pa-Latn"), CFSTR("bn-Latn"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    m_disabledLocales = v7->m_disabledLocales;
    v7->m_disabledLocales = (NSSet *)v8;

  }
  return v7;
}

- (TIEmojiCandidateGenerator)initWithActiveInputModes:(id)a3 inputManager:(id)a4
{
  id v6;
  TIEmojiCandidateGenerator *v7;
  TIEmojiCandidateGenerator *v8;

  v6 = a4;
  v7 = -[TIEmojiCandidateGenerator initWithActiveInputModes:](self, "initWithActiveInputModes:", a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->m_inputManager, v6);

  return v8;
}

- (void)dealloc
{
  void *m_emojiGeneratorPrimaryLanguage;
  void *m_emojiGeneratorSecondaryLanguage;
  void *m_emojiGeneratorTertiaryLanguage;
  __EmojiLocaleDataWrapper *m_emojiDataForPrimaryLocale;
  __EmojiLocaleDataWrapper *m_emojiDataForSecondaryLocale;
  __EmojiLocaleDataWrapper *m_emojiDataForTertiaryLocale;
  objc_super v9;

  m_emojiGeneratorPrimaryLanguage = self->m_emojiGeneratorPrimaryLanguage;
  if (m_emojiGeneratorPrimaryLanguage)
    CFRelease(m_emojiGeneratorPrimaryLanguage);
  m_emojiGeneratorSecondaryLanguage = self->m_emojiGeneratorSecondaryLanguage;
  if (m_emojiGeneratorSecondaryLanguage)
    CFRelease(m_emojiGeneratorSecondaryLanguage);
  m_emojiGeneratorTertiaryLanguage = self->m_emojiGeneratorTertiaryLanguage;
  if (m_emojiGeneratorTertiaryLanguage)
    CFRelease(m_emojiGeneratorTertiaryLanguage);
  m_emojiDataForPrimaryLocale = self->m_emojiDataForPrimaryLocale;
  if (m_emojiDataForPrimaryLocale)
    CFRelease(m_emojiDataForPrimaryLocale);
  m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
  if (m_emojiDataForSecondaryLocale)
    CFRelease(m_emojiDataForSecondaryLocale);
  m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
  if (m_emojiDataForTertiaryLocale)
    CFRelease(m_emojiDataForTertiaryLocale);
  v9.receiver = self;
  v9.super_class = (Class)TIEmojiCandidateGenerator;
  -[TIEmojiCandidateGenerator dealloc](&v9, sel_dealloc);
}

- (TIInputMode)primaryInputMode
{
  void *v2;
  void *v3;

  -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TIInputMode *)v3;
}

- (void)updateEmojiLocale
{
  void *v3;
  void *v4;
  void *v5;
  __EmojiLocaleDataWrapper *v6;
  __EmojiLocaleDataWrapper *v7;
  void *v8;
  void *v9;
  __EmojiLocaleDataWrapper *v10;
  uint64_t v11;
  __EmojiLocaleDataWrapper *m_emojiDataForSecondaryLocale;
  __EmojiLocaleDataWrapper *v13;
  void *v14;
  void *v15;
  __EmojiLocaleDataWrapper *v16;
  unint64_t v17;
  __EmojiLocaleDataWrapper *m_emojiDataForTertiaryLocale;
  void *v19;

  -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  if (!self->m_didAttemptPrimaryLocaleForEmojiLoad)
  {
    self->m_didAttemptPrimaryLocaleForEmojiLoad = 1;
    -[TIEmojiCandidateGenerator primaryInputMode](self, "primaryInputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1DF0A08CC]();

    v6 = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
    v3 = v19;
    self->m_emojiDataForPrimaryLocale = v6;
  }
  if (!self->m_didAttemptSecondaryLocaleForEmojiLoad)
  {
    self->m_didAttemptSecondaryLocaleForEmojiLoad = 1;
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      v11 = objc_msgSend(v19, "count");
      v3 = v19;
      if (v11 == 1)
      {
        m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
        if (m_emojiDataForSecondaryLocale)
        {
          CFRelease(m_emojiDataForSecondaryLocale);
          v3 = v19;
          self->m_emojiDataForSecondaryLocale = 0;
        }
      }
    }
    else
    {
      v7 = self->m_emojiDataForSecondaryLocale;
      if (v7)
        CFRelease(v7);
      objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "locale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1DF0A08CC]();

      v10 = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
      v3 = v19;
      self->m_emojiDataForSecondaryLocale = v10;
    }
  }
  if (!self->m_didAttemptTertiaryLocaleForEmojiLoad)
  {
    self->m_didAttemptTertiaryLocaleForEmojiLoad = 1;
    if ((unint64_t)objc_msgSend(v3, "count") < 3)
    {
      v17 = objc_msgSend(v19, "count");
      v3 = v19;
      if (v17 <= 2)
      {
        m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
        if (m_emojiDataForTertiaryLocale)
        {
          CFRelease(m_emojiDataForTertiaryLocale);
          v3 = v19;
          self->m_emojiDataForTertiaryLocale = 0;
        }
      }
    }
    else
    {
      v13 = self->m_emojiDataForTertiaryLocale;
      if (v13)
        CFRelease(v13);
      objc_msgSend(v19, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1DF0A08CC]();

      v16 = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
      v3 = v19;
      self->m_emojiDataForTertiaryLocale = v16;
    }
  }

}

- (void)updateEmojiAdornmentGenerators
{
  __CFDictionary *Mutable;
  const void *v4;
  void *v5;
  void *v6;
  const void *v7;
  void *v8;
  void *v9;
  __CFDictionary *v10;
  const void *v11;
  void *v12;
  void *v13;
  const void *v14;
  void *m_emojiGeneratorSecondaryLanguage;
  void *m_emojiGeneratorTertiaryLanguage;
  __CFDictionary *v17;
  const void *v18;
  void *v19;
  void *v20;
  const void *v21;
  void *v22;
  id v23;

  if (!self->m_didAttemptPrimaryEmojiGeneratorLoad)
  {
    self->m_didAttemptPrimaryEmojiGeneratorLoad = 1;
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v4 = (const void *)*MEMORY[0x1E0D513A8];
    -[TIEmojiCandidateGenerator primaryInputMode](self, "primaryInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const void *)MEMORY[0x1DF0A08CC]();
    CFDictionaryAddValue(Mutable, v4, v7);

    self->m_emojiGeneratorPrimaryLanguage = (void *)NLEmojiPredictorCreate();
    CFRelease(Mutable);
  }
  if (!self->m_didAttemptSecondaryEmojiGeneratorLoad)
  {
    self->m_didAttemptSecondaryEmojiGeneratorLoad = 1;
    -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") < 2)
    {
      if (objc_msgSend(v8, "count") == 1)
      {
        m_emojiGeneratorSecondaryLanguage = self->m_emojiGeneratorSecondaryLanguage;
        if (m_emojiGeneratorSecondaryLanguage)
        {
          CFRelease(m_emojiGeneratorSecondaryLanguage);
          self->m_emojiGeneratorSecondaryLanguage = 0;
        }
      }
    }
    else
    {
      v9 = self->m_emojiGeneratorSecondaryLanguage;
      if (v9)
        CFRelease(v9);
      v10 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v11 = (const void *)*MEMORY[0x1E0D513A8];
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "locale");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (const void *)MEMORY[0x1DF0A08CC]();
      CFDictionaryAddValue(v10, v11, v14);

      self->m_emojiGeneratorSecondaryLanguage = (void *)NLEmojiPredictorCreate();
      CFRelease(v10);
    }

  }
  if (!self->m_didAttemptTertiaryEmojiGeneratorLoad)
  {
    self->m_didAttemptTertiaryEmojiGeneratorLoad = 1;
    -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count") == 3)
    {
      m_emojiGeneratorTertiaryLanguage = self->m_emojiGeneratorTertiaryLanguage;
      if (m_emojiGeneratorTertiaryLanguage)
        CFRelease(m_emojiGeneratorTertiaryLanguage);
      v17 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v18 = (const void *)*MEMORY[0x1E0D513A8];
      objc_msgSend(v23, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "locale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (const void *)MEMORY[0x1DF0A08CC]();
      CFDictionaryAddValue(v17, v18, v21);

      self->m_emojiGeneratorTertiaryLanguage = (void *)NLEmojiPredictorCreate();
      CFRelease(v17);
    }
    else if ((unint64_t)objc_msgSend(v23, "count") <= 2)
    {
      v22 = self->m_emojiGeneratorTertiaryLanguage;
      if (v22)
      {
        CFRelease(v22);
        self->m_emojiGeneratorTertiaryLanguage = 0;
      }
    }

  }
}

- (id)createAndAddEmojiTokensFrom:(__CFArray *)a3 inArray:(id)a4 forInputString:(id)a5
{
  id v7;
  id v8;
  CFIndex i;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  for (i = 0; i < CFArrayGetCount(a3); ++i)
  {
    v10 = (void *)MEMORY[0x1E0DBDBE8];
    CFArrayGetValueAtIndex(a3, i);
    objc_msgSend(v10, "candidateWithCandidate:forInput:", CEMEmojiTokenGetString(), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  return v7;
}

- (id)enumerateForEmojiCandidatesIn:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 asReplacementCandidate:(BOOL)a5
{
  return -[TIEmojiCandidateGenerator enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:](self, "enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:", a3, a4, a5, 0);
}

- (id)enumerateForEmojiCandidatesIn:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 asReplacementCandidate:(BOOL)a5 matchedString:(id *)a6
{
  id v9;
  void *v10;
  const __CFString *LocaleIdentifier;
  id v12;
  __CFString *v13;
  unint64_t v14;
  void *v15;
  __CFString *v16;
  uint64_t v17;
  const void *EmojiTokensForString;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  uint64_t v31;
  id *v33;
  const __CFString *v34;
  __EmojiLocaleDataWrapper *v35;
  id v36;
  TIEmojiCandidateGenerator *v37;
  _BOOL4 v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v38 = a5;
  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LocaleIdentifier = (const __CFString *)CEMEmojiLocaleDataGetLocaleIdentifier();
  v37 = self;
  if (-[TIEmojiCandidateGenerator isLocaleDisabled:](self, "isLocaleDisabled:", LocaleIdentifier))
  {
    v12 = v10;
  }
  else
  {
    v33 = a6;
    if (objc_msgSend(v9, "count"))
    {
      v13 = 0;
      v14 = 0;
      v35 = a4;
      v36 = v9;
      v34 = LocaleIdentifier;
      while (!objc_msgSend(v10, "count"))
      {
        objc_msgSend(v9, "subarrayWithRange:", v14, objc_msgSend(v9, "count") - v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "componentsJoinedByString:", CFSTR(" "));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v17 = objc_msgSend(v9, "count");
        if (LocaleIdentifier
          && v17 - v14 == 2
          && CFStringHasPrefix(LocaleIdentifier, CFSTR("en"))
          && (!-[__CFString caseInsensitiveCompare:](v16, "caseInsensitiveCompare:", CFSTR("northern ireland"))
           || !-[__CFString caseInsensitiveCompare:](v16, "caseInsensitiveCompare:", CFSTR("inner mongolia"))))
        {
          goto LABEL_31;
        }
        EmojiTokensForString = (const void *)CEMEmojiLocaleDataCreateEmojiTokensForString();
        objc_msgSend(MEMORY[0x1E0D1F268], "emojiTokensForCEMEmojiTokens:", EmojiTokensForString);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "count"))
        {
          v39 = v10;
          objc_msgSend(MEMORY[0x1E0D1F258], "sharedServiceWithMachName:", 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "preferences");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = (void *)objc_msgSend(v21, "copySortedEmojis:keyword:localeIdentifier:", v19, v16, LocaleIdentifier);
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v22, "count"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v19 = v22;
          v24 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v41;
            do
            {
              for (i = 0; i != v25; ++i)
              {
                if (*(_QWORD *)v41 != v26)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "string");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "addObject:", v28);

              }
              v25 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            }
            while (v25);
          }

          v29 = &stru_1EA1081D0;
          if (v38)
            v29 = v16;
          v30 = v29;
          -[TIEmojiCandidateGenerator skinToneModifiedAdornmentEmojis:forLocale:forInput:](v37, "skinToneModifiedAdornmentEmojis:forLocale:forInput:", v23, v35, v30);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v36;
          LocaleIdentifier = v34;
        }
        if (EmojiTokensForString)
          CFRelease(EmojiTokensForString);
        ++v14;

        v13 = v16;
        if (v14 >= objc_msgSend(v9, "count"))
          goto LABEL_28;
      }
      v16 = v13;
    }
    else
    {
      v16 = 0;
    }
LABEL_28:
    v31 = objc_msgSend(v10, "count");
    if (v33 && v31)
      *v33 = objc_retainAutorelease(v16);
LABEL_31:
    v12 = v10;

  }
  return v12;
}

- (id)randomShuffle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++), arc4random_uniform(objc_msgSend(v4, "count", (_QWORD)v12) + 1));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)extractTokensForEmojiComputation:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") < 8)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "subarrayWithRange:", objc_msgSend(v3, "count") - 7, 7);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)getSkinToneSensitiveEmojis:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!getSkinToneSensitiveEmojis__fistEmoji)
  {
    objc_msgSend(MEMORY[0x1E0D1F268], "emojiTokenWithString:localeData:", CFSTR("✊"), 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)getSkinToneSensitiveEmojis__fistEmoji;
    getSkinToneSensitiveEmojis__fistEmoji = v4;

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D1F258], "sharedServiceWithMachName:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v18 = v3;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(MEMORY[0x1E0D1F268], "emojiTokenWithString:localeData:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13), 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "supportsSkinToneVariants")
            && (!objc_msgSend(v14, "skinTone")
             || (objc_msgSend(v14, "isEqualIgnoringModifiers:", getSkinToneSensitiveEmojis__fistEmoji) & 1) == 0))
          {
            objc_msgSend(v8, "lastUsedVariantEmojiForEmoji:", v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v14 = (void *)v15;
          }
          if (v14)
          {
            objc_msgSend(v14, "string");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v3 = v18;
  }

  return v6;
}

- (id)skinToneModifiedAdornmentEmojis:(id)a3 forLocale:(__EmojiLocaleDataWrapper *)a4 forInput:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  -[TIEmojiCandidateGenerator getSkinToneSensitiveEmojis:](self, "getSkinToneSensitiveEmojis:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), v7, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)emojiAppendCandidates:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  __EmojiLocaleDataWrapper *v7;
  __EmojiLocaleDataWrapper *m_emojiDataForTertiaryLocale;
  uint64_t v9;
  __EmojiLocaleDataWrapper *m_emojiDataForPrimaryLocale;
  void *v11;
  __EmojiLocaleDataWrapper *m_emojiDataForSecondaryLocale;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIEmojiCandidateGenerator updateEmojiLocale](self, "updateEmojiLocale");
  v6 = -[TIEmojiCandidateGenerator emojiPredominantInputModeIdxFromContext](self, "emojiPredominantInputModeIdxFromContext");
  if (v6 < 0)
  {
    m_emojiDataForPrimaryLocale = self->m_emojiDataForPrimaryLocale;
    if (m_emojiDataForPrimaryLocale)
    {
      -[TIEmojiCandidateGenerator enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:](self, "enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:", v4, m_emojiDataForPrimaryLocale, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count") || (m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale) == 0)
      {
        v5 = v11;
      }
      else
      {
        -[TIEmojiCandidateGenerator enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:](self, "enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:", v4, m_emojiDataForSecondaryLocale, 0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (!objc_msgSend(v5, "count"))
      {
        m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
        if (m_emojiDataForTertiaryLocale)
          goto LABEL_4;
      }
    }
  }
  else
  {
    v7 = -[TIEmojiCandidateGenerator emojiDataForInputModeIdx:](self, "emojiDataForInputModeIdx:", v6);
    if (v7)
    {
      m_emojiDataForTertiaryLocale = v7;
LABEL_4:
      -[TIEmojiCandidateGenerator enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:](self, "enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:", v4, m_emojiDataForTertiaryLocale, 0);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
  }

  return v5;
}

- (id)emojiAdornmentCandidates:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    goto LABEL_19;
  -[TIEmojiCandidateGenerator updateEmojiAdornmentGenerators](self, "updateEmojiAdornmentGenerators");
  v6 = -[TIEmojiCandidateGenerator emojiPredominantInputModeIdxFromContext](self, "emojiPredominantInputModeIdxFromContext");
  if (v6 < 0)
  {
    if (self->m_emojiGeneratorPrimaryLanguage)
    {
      -[TIEmojiCandidateGenerator primaryInputMode](self, "primaryInputMode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "locale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[TIEmojiCandidateGenerator isLocaleDisabled:](self, "isLocaleDisabled:", v19);

      if (!v20)
      {
        -[TIEmojiCandidateGenerator emojiAdornmentCandidates:emojiGenerator:emojiData:](self, "emojiAdornmentCandidates:emojiGenerator:emojiData:", v4, self->m_emojiGeneratorPrimaryLanguage, self->m_emojiDataForPrimaryLocale);
        v21 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v21;
      }
    }
    if (objc_msgSend(v5, "count") || !self->m_emojiGeneratorSecondaryLanguage)
      goto LABEL_17;
    -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v22, "count") >= 2)
    {
      -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "locale");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localeIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[TIEmojiCandidateGenerator isLocaleDisabled:](self, "isLocaleDisabled:", v26);

      if (v27)
        goto LABEL_17;
      -[TIEmojiCandidateGenerator emojiAdornmentCandidates:emojiGenerator:emojiData:](self, "emojiAdornmentCandidates:emojiGenerator:emojiData:", v4, self->m_emojiGeneratorSecondaryLanguage, self->m_emojiDataForSecondaryLocale);
      v22 = v5;
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_17:
    v16 = v5;
    if (objc_msgSend(v5, "count") || !self->m_emojiGeneratorTertiaryLanguage)
      goto LABEL_18;
    -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 3)
      goto LABEL_7;
    -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndexedSubscript:", 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "locale");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localeIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[TIEmojiCandidateGenerator isLocaleDisabled:](self, "isLocaleDisabled:", v33);

    if (v34)
      goto LABEL_18;
    -[TIEmojiCandidateGenerator emojiAdornmentCandidates:emojiGenerator:emojiData:](self, "emojiAdornmentCandidates:emojiGenerator:emojiData:", v4, self->m_emojiGeneratorTertiaryLanguage, self->m_emojiDataForTertiaryLocale);
    v15 = objc_claimAutoreleasedReturnValue();
    v5 = v16;
LABEL_6:
    v16 = (void *)v15;
LABEL_7:

LABEL_18:
    v5 = v16;
    goto LABEL_19;
  }
  v7 = v6;
  v8 = -[TIEmojiCandidateGenerator emojiGeneratorForInputModeIdx:](self, "emojiGeneratorForInputModeIdx:", v6);
  if (v8)
  {
    v9 = v8;
    -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TIEmojiCandidateGenerator isLocaleDisabled:](self, "isLocaleDisabled:", v13);

    if (!v14)
    {
      -[TIEmojiCandidateGenerator emojiAdornmentCandidates:emojiGenerator:emojiData:](self, "emojiAdornmentCandidates:emojiGenerator:emojiData:", v4, v9, -[TIEmojiCandidateGenerator emojiDataForInputModeIdx:](self, "emojiDataForInputModeIdx:", v7));
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_19:
  -[TIEmojiCandidateGenerator randomShuffle:](self, "randomShuffle:", v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)emojiAdornmentCandidates:(id)a3 emojiGenerator:(void *)a4 emojiData:(__EmojiLocaleDataWrapper *)a5
{
  void *v7;
  id v8;
  void *v9;
  const __CFArray *CandidatesForString;
  CFIndex Count;
  uint64_t v12;

  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v7, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CandidatesForString = (const __CFArray *)NLEmojiPredictorCreateCandidatesForString();

  -[TIEmojiCandidateGenerator updateEmojiLocale](self, "updateEmojiLocale");
  if (CandidatesForString)
  {
    Count = CFArrayGetCount(CandidatesForString);
    if (a5 && Count >= 1)
    {
      -[TIEmojiCandidateGenerator skinToneModifiedAdornmentEmojis:forLocale:forInput:](self, "skinToneModifiedAdornmentEmojis:forLocale:forInput:", CandidatesForString, a5, &stru_1EA1081D0);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
    CFRelease(CandidatesForString);
  }
  return v9;
}

- (id)generateEmojiAdornmentCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  TIEmojiCandidateGenerator *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  id obj;
  id obja;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t);
  void *v65;
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v43 = v5;
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationAndWhitespaceCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v4;
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v7;
    objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v9, "count") - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "length");
      v62 = MEMORY[0x1E0C809B0];
      v63 = 3221225472;
      v64 = __62__TIEmojiCandidateGenerator_generateEmojiAdornmentCandidates___block_invoke;
      v65 = &unk_1EA0FF228;
      v66 = v10;
      CEMEnumerateEmojiTokensInStringWithBlock();

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v9;
    v48 = v10;
    v40 = self;
    if (objc_msgSend(v9, "count"))
    {
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = v9;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v59 != v14)
              objc_enumerationMutation(obj);
            v16 = *(id *)(*((_QWORD *)&v58 + 1) + 8 * i);
            if (CEMStringContainsEmoji())
            {
              v56 = 0u;
              v57 = 0u;
              v54 = 0u;
              v55 = 0u;
              v17 = v10;
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
              if (v18)
              {
                v19 = v18;
                v20 = *(_QWORD *)v55;
                do
                {
                  v21 = 0;
                  v22 = v16;
                  do
                  {
                    if (*(_QWORD *)v55 != v20)
                      objc_enumerationMutation(v17);
                    objc_msgSend(v22, "stringByReplacingOccurrencesOfString:withString:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v21), &stru_1EA1081D0, v40);
                    v16 = (id)objc_claimAutoreleasedReturnValue();

                    ++v21;
                    v22 = v16;
                  }
                  while (v19 != v21);
                  v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
                }
                while (v19);
              }

              v10 = v48;
            }
            if (objc_msgSend(v16, "length", v40))
              objc_msgSend(v49, "addObject:", v16);

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        }
        while (v13);
      }

      self = v40;
    }
    -[TIEmojiCandidateGenerator extractTokensForEmojiComputation:](self, "extractTokensForEmojiComputation:", v49, v40);
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obja, "componentsJoinedByString:", CFSTR(" "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEmojiCandidateGenerator emojiAdornmentCandidates:](self, "emojiAdornmentCandidates:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
          objc_msgSend(v31, "candidate");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v10, "containsObject:", v32);

          if ((v33 & 1) == 0)
            objc_msgSend(v25, "addObject:", v31);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v67, 16);
      }
      while (v28);
    }

    if (objc_msgSend(v25, "count") || objc_msgSend(v10, "count"))
    {
      v34 = v25;
      v35 = v43;
      v36 = v45;
      v37 = obja;
    }
    else
    {
      v36 = v45;
      v5 = v43;
      if (!objc_msgSend(v45, "count"))
      {
        v37 = obja;
        goto LABEL_37;
      }
      objc_msgSend(v45, "objectAtIndex:", objc_msgSend(v45, "count") - 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v37 = obja;
      if (!CEMStringContainsEmoji())
      {
        objc_msgSend(v41, "emojiAppendCandidates:", obja);
        v39 = objc_claimAutoreleasedReturnValue();

        v34 = (id)v39;
      }

    }
    v5 = v34;
LABEL_37:

    v4 = v44;
  }

  return v5;
}

- (void)updateForMultilingualKeyboard:(id)a3
{
  __EmojiLocaleDataWrapper *m_emojiDataForSecondaryLocale;
  void *v5;
  void *v6;
  void *m_emojiGeneratorSecondaryLanguage;
  __CFDictionary *Mutable;
  const void *v9;
  void *v10;
  void *v11;
  const void *v12;
  __EmojiLocaleDataWrapper *m_emojiDataForTertiaryLocale;
  void *v14;
  void *v15;
  void *m_emojiGeneratorTertiaryLanguage;
  __CFDictionary *v17;
  const void *v18;
  void *v19;
  void *v20;
  const void *v21;
  id v22;

  v22 = a3;
  if ((unint64_t)objc_msgSend(v22, "count") >= 2)
  {
    if ((unint64_t)objc_msgSend(v22, "count") >= 2)
    {
      m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
      if (m_emojiDataForSecondaryLocale)
        CFRelease(m_emojiDataForSecondaryLocale);
      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "locale");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1DF0A08CC]();

      self->m_emojiDataForSecondaryLocale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
      m_emojiGeneratorSecondaryLanguage = self->m_emojiGeneratorSecondaryLanguage;
      if (m_emojiGeneratorSecondaryLanguage)
        CFRelease(m_emojiGeneratorSecondaryLanguage);
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v9 = (const void *)*MEMORY[0x1E0D513A8];
      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "locale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (const void *)MEMORY[0x1DF0A08CC]();
      CFDictionaryAddValue(Mutable, v9, v12);

      self->m_emojiGeneratorSecondaryLanguage = (void *)NLEmojiPredictorCreate();
      CFRelease(Mutable);
    }
    if ((unint64_t)objc_msgSend(v22, "count") >= 3)
    {
      m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
      if (m_emojiDataForTertiaryLocale)
        CFRelease(m_emojiDataForTertiaryLocale);
      objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x1DF0A08CC]();

      self->m_emojiDataForTertiaryLocale = (__EmojiLocaleDataWrapper *)CEMCreateEmojiLocaleData();
      m_emojiGeneratorTertiaryLanguage = self->m_emojiGeneratorTertiaryLanguage;
      if (m_emojiGeneratorTertiaryLanguage)
        CFRelease(m_emojiGeneratorTertiaryLanguage);
      v17 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v18 = (const void *)*MEMORY[0x1E0D513A8];
      objc_msgSend(v22, "objectAtIndexedSubscript:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "locale");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (const void *)MEMORY[0x1DF0A08CC]();
      CFDictionaryAddValue(v17, v18, v21);

      self->m_emojiGeneratorTertiaryLanguage = (void *)NLEmojiPredictorCreate();
      CFRelease(v17);
    }
  }

}

- (void)updateForActiveInputModes:(id)a3
{
  __EmojiLocaleDataWrapper *m_emojiDataForSecondaryLocale;
  void *m_emojiGeneratorSecondaryLanguage;
  __EmojiLocaleDataWrapper *m_emojiDataForTertiaryLocale;
  void *m_emojiGeneratorTertiaryLanguage;
  id v8;

  v8 = a3;
  -[TIEmojiCandidateGenerator setActiveInputModes:](self, "setActiveInputModes:", v8);
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
    if (m_emojiDataForSecondaryLocale)
    {
      CFRelease(m_emojiDataForSecondaryLocale);
      self->m_emojiDataForSecondaryLocale = 0;
    }
    m_emojiGeneratorSecondaryLanguage = self->m_emojiGeneratorSecondaryLanguage;
    if (m_emojiGeneratorSecondaryLanguage)
    {
      CFRelease(m_emojiGeneratorSecondaryLanguage);
      self->m_emojiGeneratorSecondaryLanguage = 0;
    }
    m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
    if (m_emojiDataForTertiaryLocale)
    {
      CFRelease(m_emojiDataForTertiaryLocale);
      self->m_emojiDataForTertiaryLocale = 0;
    }
    m_emojiGeneratorTertiaryLanguage = self->m_emojiGeneratorTertiaryLanguage;
    if (m_emojiGeneratorTertiaryLanguage)
    {
      CFRelease(m_emojiGeneratorTertiaryLanguage);
      self->m_emojiGeneratorTertiaryLanguage = 0;
    }
  }
  else
  {
    -[TIEmojiCandidateGenerator updateForMultilingualKeyboard:](self, "updateForMultilingualKeyboard:", v8);
  }

}

- (id)emojiReplacementCandidates:(id)a3
{
  return -[TIEmojiCandidateGenerator emojiReplacementCandidates:matchedString:](self, "emojiReplacementCandidates:matchedString:", a3, 0);
}

- (id)emojiReplacementCandidates:(id)a3 matchedString:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  const void *v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  __EmojiLocaleDataWrapper *v15;
  __EmojiLocaleDataWrapper *m_emojiDataForSecondaryLocale;
  uint64_t v17;
  __EmojiLocaleDataWrapper *m_emojiDataForTertiaryLocale;

  v6 = a3;
  if (self->m_isEmojiInputModeEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEmojiCandidateGenerator updateEmojiLocale](self, "updateEmojiLocale");
    v8 = objc_msgSend(v6, "lastObject");
    v9 = -[TIEmojiCandidateGenerator emojiPredominantInputModeIdxFromContext](self, "emojiPredominantInputModeIdxFromContext");
    if (self->m_emojiDataForPrimaryLocale && v8)
    {
      v10 = v9;
      if (CEMStringIsSingleEmoji())
      {
        v11 = (const void *)CEMEmojiTokenCreateWithString();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (const void *)CEMEmojiTokenCopyRelatedEmoji();
        if (v11)
          CFRelease(v11);
        if (!v13)
          goto LABEL_18;
        -[TIEmojiCandidateGenerator createAndAddEmojiTokensFrom:inArray:forInputString:](self, "createAndAddEmojiTokensFrom:inArray:forInputString:", v13, v12, v8);
        v14 = objc_claimAutoreleasedReturnValue();

        CFRelease(v13);
        goto LABEL_9;
      }
      if (v10 < 0)
      {
        -[TIEmojiCandidateGenerator enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:](self, "enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:", v6, self->m_emojiDataForPrimaryLocale, 1, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v12, "count"))
        {
          m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
          if (m_emojiDataForSecondaryLocale)
          {
            -[TIEmojiCandidateGenerator enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:](self, "enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:", v6, m_emojiDataForSecondaryLocale, 1, a4);
            v17 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v17;
          }
        }
        if (objc_msgSend(v12, "count"))
          goto LABEL_18;
        m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
        if (!m_emojiDataForTertiaryLocale)
          goto LABEL_18;
        -[TIEmojiCandidateGenerator enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:](self, "enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:", v6, m_emojiDataForTertiaryLocale, 1, a4);
        v14 = objc_claimAutoreleasedReturnValue();

LABEL_9:
        v12 = (void *)v14;
LABEL_18:

        v7 = v12;
        goto LABEL_19;
      }
      v15 = -[TIEmojiCandidateGenerator emojiDataForInputModeIdx:](self, "emojiDataForInputModeIdx:", v10);
      if (v15)
      {
        -[TIEmojiCandidateGenerator enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:](self, "enumerateForEmojiCandidatesIn:forEmojiLocaleData:asReplacementCandidate:matchedString:", v6, v15, 1, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_19:

  return v7;
}

- (id)emojiReplacementCandidatesForKeyboardState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIEmojiCandidateGenerator emojiReplacementCandidatesForText:](self, "emojiReplacementCandidatesForText:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)emojiReplacementCandidatesForText:(id)a3
{
  void *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__5739;
  v13 = __Block_byref_object_dispose__5740;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "array");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__TIEmojiCandidateGenerator_emojiReplacementCandidatesForText___block_invoke;
  v8[3] = &unk_1EA0FF290;
  v8[4] = &v9;
  -[TIEmojiCandidateGenerator emojiReplacementCandidatesForText:completionHandler:](self, "emojiReplacementCandidatesForText:completionHandler:", v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)emojiAlternativesForText:(id)a3 completionHandler:(id)a4
{
  void (**v6)(id, id, void *);
  void *v7;
  id v8;
  id v9;

  v9 = 0;
  v6 = (void (**)(id, id, void *))a4;
  -[TIEmojiCandidateGenerator emojiAlternativesForText:matchedString:](self, "emojiAlternativesForText:matchedString:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  v6[2](v6, v8, v7);

}

- (id)emojiAlternativesForText:(id)a3 matchedString:(id *)a4
{
  id v6;
  void *v7;
  int64_t v8;
  __EmojiLocaleDataWrapper *v9;
  void *v10;
  __EmojiLocaleDataWrapper *m_emojiDataForPrimaryLocale;
  __EmojiLocaleDataWrapper *m_emojiDataForSecondaryLocale;
  uint64_t v13;
  __EmojiLocaleDataWrapper *m_emojiDataForTertiaryLocale;
  uint64_t v15;

  v6 = a3;
  if (self->m_isEmojiInputModeEnabled)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEmojiCandidateGenerator updateEmojiLocale](self, "updateEmojiLocale");
    v8 = -[TIEmojiCandidateGenerator emojiPredominantInputModeIdxFromContext](self, "emojiPredominantInputModeIdxFromContext");
    if (v8 < 0)
    {
      m_emojiDataForPrimaryLocale = self->m_emojiDataForPrimaryLocale;
      if (m_emojiDataForPrimaryLocale)
      {
        -[TIEmojiCandidateGenerator enumerateForEmojiAlternativesInText:forEmojiLocaleData:matchedString:](self, "enumerateForEmojiAlternativesInText:forEmojiLocaleData:matchedString:", v6, m_emojiDataForPrimaryLocale, a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "count"))
        {
          m_emojiDataForSecondaryLocale = self->m_emojiDataForSecondaryLocale;
          if (m_emojiDataForSecondaryLocale)
          {
            -[TIEmojiCandidateGenerator enumerateForEmojiAlternativesInText:forEmojiLocaleData:matchedString:](self, "enumerateForEmojiAlternativesInText:forEmojiLocaleData:matchedString:", v6, m_emojiDataForSecondaryLocale, a4);
            v13 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v13;
          }
        }
        if (!objc_msgSend(v10, "count"))
        {
          m_emojiDataForTertiaryLocale = self->m_emojiDataForTertiaryLocale;
          if (m_emojiDataForTertiaryLocale)
          {
            -[TIEmojiCandidateGenerator enumerateForEmojiAlternativesInText:forEmojiLocaleData:matchedString:](self, "enumerateForEmojiAlternativesInText:forEmojiLocaleData:matchedString:", v6, m_emojiDataForTertiaryLocale, a4);
            v15 = objc_claimAutoreleasedReturnValue();

            v10 = (void *)v15;
          }
        }
        goto LABEL_13;
      }
    }
    else
    {
      v9 = -[TIEmojiCandidateGenerator emojiDataForInputModeIdx:](self, "emojiDataForInputModeIdx:", v8);
      if (v9)
      {
        -[TIEmojiCandidateGenerator enumerateForEmojiAlternativesInText:forEmojiLocaleData:matchedString:](self, "enumerateForEmojiAlternativesInText:forEmojiLocaleData:matchedString:", v6, v9, a4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        v7 = v10;
      }
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)enumerateForEmojiAlternativesInText:(id)a3 forEmojiLocaleData:(__EmojiLocaleDataWrapper *)a4 matchedString:(id *)a5
{
  id v8;
  void *v9;
  const __CFString *LocaleIdentifier;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const void *EmojiTokensForString;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  void *v36;
  id *v37;
  const __CFString *v38;
  void *v39;
  __EmojiLocaleDataWrapper *v40;
  id v41;
  TIEmojiCandidateGenerator *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LocaleIdentifier = (const __CFString *)CEMEmojiLocaleDataGetLocaleIdentifier();
  v42 = self;
  if (-[TIEmojiCandidateGenerator isLocaleDisabled:](self, "isLocaleDisabled:", LocaleIdentifier))
  {
    v11 = v9;
  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
    objc_msgSend(v12, "setString:", v8);
    objc_msgSend(v12, "setLanguage:", LocaleIdentifier);
    v36 = v12;
    objc_msgSend(v12, "tokensForRange:", 0, objc_msgSend(v8, "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = a5;
    if ((unint64_t)objc_msgSend(v13, "count") >= 8)
    {
      objc_msgSend(v13, "subarrayWithRange:", objc_msgSend(v13, "count") - 7, 7);
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    objc_msgSend(v13, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "rangeValue");
    v18 = v17;

    if (objc_msgSend(v13, "count"))
    {
      v19 = 0;
      v20 = 0;
      v43 = v16 + v18;
      v40 = a4;
      v41 = v8;
      v38 = LocaleIdentifier;
      v39 = v13;
      while (!objc_msgSend(v9, "count"))
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "rangeValue");

        objc_msgSend(v8, "substringWithRange:", v22, v43 - v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v13, "count");
        if (!LocaleIdentifier
          || v24 - v20 != 2
          || !CFStringHasPrefix(LocaleIdentifier, CFSTR("en"))
          || objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("northern ireland"))
          && objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("inner mongolia")))
        {
          EmojiTokensForString = (const void *)CEMEmojiLocaleDataCreateEmojiTokensForString();
          objc_msgSend(MEMORY[0x1E0D1F268], "emojiTokensForCEMEmojiTokens:", EmojiTokensForString);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "count"))
          {
            v44 = v9;
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v28 = v26;
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v46;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v46 != v31)
                    objc_enumerationMutation(v28);
                  objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "string");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "addObject:", v33);

                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
              }
              while (v30);
            }

            -[TIEmojiCandidateGenerator skinToneModifiedAdornmentEmojis:forLocale:forInput:](v42, "skinToneModifiedAdornmentEmojis:forLocale:forInput:", v27, v40, v23);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v41;
            LocaleIdentifier = v38;
            v13 = v39;
          }
          if (EmojiTokensForString)
            CFRelease(EmojiTokensForString);

          ++v20;
          v19 = v23;
          if (v20 < objc_msgSend(v13, "count"))
            continue;
        }
        goto LABEL_28;
      }
      v23 = v19;
    }
    else
    {
      v23 = 0;
    }
LABEL_28:
    v34 = objc_msgSend(v9, "count");
    if (v37 && v34)
      *v37 = objc_retainAutorelease(v23);
    v11 = v9;

  }
  return v11;
}

- (void)emojiReplacementCandidatesForText:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, __CFString *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;

  v6 = a3;
  v7 = (void (**)(id, __CFString *, void *))a4;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->m_shouldShowEmojis)
  {
    v12 = &stru_1EA1081D0;
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "_looksLikeEmailAddress") & 1) != 0)
  {
    v12 = &stru_1EA1081D0;
  }
  else
  {
    v12 = &stru_1EA1081D0;
    if ((objc_msgSend(v11, "_looksLikeURL") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIEmojiCandidateGenerator extractTokensForEmojiComputation:](self, "extractTokensForEmojiComputation:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = &stru_1EA1081D0;
      -[TIEmojiCandidateGenerator emojiReplacementCandidates:matchedString:](self, "emojiReplacementCandidates:matchedString:", v15, &v17);
      v16 = objc_claimAutoreleasedReturnValue();
      v12 = v17;

      v8 = (void *)v16;
    }
  }

  if (v7)
LABEL_9:
    v7[2](v7, v12, v8);
LABEL_10:

}

- (id)emojiAdornmentCandidatesForKeyboardState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->m_shouldShowEmojis)
  {
    objc_msgSend(v4, "documentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextBeforeInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEmojiCandidateGenerator generateEmojiAdornmentCandidates:](self, "generateEmojiAdornmentCandidates:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (BOOL)isLocaleDisabled:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = (_os_feature_enabled_impl() & 1) == 0 && -[NSSet containsObject:](self->m_disabledLocales, "containsObject:", v4);

  return v5;
}

- (int64_t)emojiPredominantInputModeIdxFromContext
{
  TIKeyboardInputManager **p_m_inputManager;
  id WeakRetained;
  id v5;
  int v6;
  unint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;

  p_m_inputManager = &self->m_inputManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_inputManager);

  if (!WeakRetained)
    return -1;
  v5 = objc_loadWeakRetained((id *)p_m_inputManager);
  v6 = objc_msgSend(v5, "predominantLexiconInContext");

  v7 = TILocaleIdentifierForLexiconID(v6);
  v8 = -1;
  if (v6 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", TILocaleIdentifierForLexiconID(v6), 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIEmojiCandidateGenerator primaryInputMode](self, "primaryInputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v9);

    if ((v13 & 1) != 0)
    {
      v8 = 0;
LABEL_16:

      return v8;
    }
    -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v14, "count") <= 1)
    {

    }
    else
    {
      -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1;
      objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "locale");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", v9);

      if ((v19 & 1) != 0)
        goto LABEL_16;
    }
    -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v20, "count") <= 2)
    {

      v8 = -1;
    }
    else
    {
      -[TIEmojiCandidateGenerator activeInputModes](self, "activeInputModes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "locale");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localeIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", v9);

      if (v25)
        v8 = 2;
      else
        v8 = -1;
    }
    goto LABEL_16;
  }
  return v8;
}

- (__EmojiLocaleDataWrapper)emojiDataForInputModeIdx:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return (__EmojiLocaleDataWrapper *)*((_QWORD *)&self->m_emojiDataForPrimaryLocale + a3);
}

- (void)emojiGeneratorForInputModeIdx:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return (void *)*((_QWORD *)&self->m_emojiGeneratorPrimaryLanguage + a3);
}

- (NSArray)activeInputModes
{
  return self->_activeInputModes;
}

- (void)setActiveInputModes:(id)a3
{
  objc_storeStrong((id *)&self->_activeInputModes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInputModes, 0);
  objc_destroyWeak((id *)&self->m_inputManager);
  objc_storeStrong((id *)&self->m_disabledLocales, 0);
}

void __63__TIEmojiCandidateGenerator_emojiReplacementCandidatesForText___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

uint64_t __62__TIEmojiCandidateGenerator_generateEmojiAdornmentCandidates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", CEMEmojiTokenGetString());
}

@end
