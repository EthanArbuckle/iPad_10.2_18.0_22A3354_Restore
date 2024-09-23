@implementation TIKeyboardInputManager

- (id)autocorrectionRecordForWord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[TIKeyboardInputManager autocorrectionHistory](self, "autocorrectionHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[TIKeyboardInputManager rejectedAutocorrections](self, "rejectedAutocorrections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (TILRUDictionary)rejectedAutocorrections
{
  return self->_rejectedAutocorrections;
}

- (TILRUDictionary)autocorrectionHistory
{
  return self->_autocorrectionHistory;
}

- (id)dictionaryInputMode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryInputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[TIKeyboardInputManager config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "inputMode");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)internalStringToExternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "internalStringToExternal:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (TIKeyboardFeatureSpecialization)keyboardFeatureSpecialization
{
  TIKeyboardFeatureSpecialization *keyboardFeatureSpecialization;
  void *v4;
  TIKeyboardFeatureSpecialization *v5;
  TIKeyboardFeatureSpecialization *v6;
  void *v7;
  void *v8;

  keyboardFeatureSpecialization = self->_keyboardFeatureSpecialization;
  if (!keyboardFeatureSpecialization)
  {
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[TIKeyboardFeatureSpecialization createSpecializationForInputMode:](TIKeyboardFeatureSpecialization, "createSpecializationForInputMode:", v4);
    v6 = self->_keyboardFeatureSpecialization;
    self->_keyboardFeatureSpecialization = v5;

    -[TIKeyboardInputManager config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardFeatureSpecialization setUseRelaxedOVSPolicy:](self->_keyboardFeatureSpecialization, "setUseRelaxedOVSPolicy:", objc_msgSend(v7, "allowRelaxedOVSPolicy"));

    -[TIKeyboardInputManager config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardFeatureSpecialization setSkipCandidateQualityFilter:](self->_keyboardFeatureSpecialization, "setSkipCandidateQualityFilter:", objc_msgSend(v8, "skipCandidateQualityFilter"));

    keyboardFeatureSpecialization = self->_keyboardFeatureSpecialization;
  }
  return keyboardFeatureSpecialization;
}

void __39__TIKeyboardInputManager_setKeyLayout___block_invoke(uint64_t a1, const char *a2, __int16 a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  int v13;
  _QWORD *v14;
  int v15;
  unsigned int v16;
  _QWORD *v17;
  void *v18;
  int v19;
  unsigned __int16 v20[2];
  unsigned __int16 v21;
  char v22;
  void *v23;
  _QWORD v24[3];
  CGRect v25;

  v24[2] = *MEMORY[0x1E0C80C00];
  KB::String::String((KB::String *)v20, a2);
  v13 = v21;
  if (!v21)
  {
    KB::String::compute_length(v20);
    v13 = v21;
  }
  if (v13 == 1)
  {
    v14 = v23;
    if (!v23)
      v14 = v24;
    v17 = v14;
    LODWORD(v18) = 0;
    HIDWORD(v18) = v20[0];
    v19 = 0;
    KB::String::iterator::initialize((uint64_t *)&v17);
    v15 = (unsigned __int16)v19;
    v16 = objc_msgSend(*(id *)(a1 + 32), "mapKeyboardLayoutKey:", (unsigned __int16)v19);
    if (v16 != v15)
    {
      KB::String::String((uint64_t)&v17, v16);
      KB::String::operator=((uint64_t)v20, (KB::String *)&v17);
      if (v18)
      {
        if (BYTE6(v17) == 1)
          free(v18);
      }
    }
  }
  v25.origin.x = a4;
  v25.origin.y = a5;
  v25.size.width = a6;
  v25.size.height = a7;
  TIInputManager::register_key_area(*(TIInputManager **)(*(_QWORD *)(a1 + 32) + 40), (_LXLexicon *)v20, v25, a3);
  if (v23)
  {
    if (v22 == 1)
      free(v23);
  }
}

- (TIInlineCompletionAnalyticsMetadata)inlineCompletionMetadataFrom:(SEL)a3 andBundleId:(id)a4
{
  KB *v7;
  id v8;
  KB *v9;
  KB *v10;
  KB *v11;
  KB *v12;
  KB *v13;
  KB *v14;
  void *v15;
  KB *v16;
  void *v17;
  KB *v18;
  void *v19;
  KB *v20;
  TIInlineCompletionAnalyticsMetadata *result;
  _BYTE v22[8];
  void *v23;
  _BYTE v24[8];
  void *v25;
  _BYTE v26[8];
  void *v27;
  _BYTE v28[8];
  void *v29;
  _BYTE v30[8];
  void *v31;
  _BYTE v32[8];
  void *v33;
  _BYTE v34[8];
  void *v35;
  _BYTE v36[8];
  void *v37;
  _BYTE v38[8];
  void *v39;
  _BYTE v40[8];
  TIInlineCompletionAnalyticsMetadata *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = (KB *)a5;
  v8 = a4;
  objc_msgSend(v8, "inputLanguage");
  v9 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v9, (uint64_t)v40);

  objc_msgSend(v8, "inputRegion");
  v10 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v10, (uint64_t)v38);

  objc_msgSend(v8, "inputVariant");
  v11 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v11, (uint64_t)v36);

  objc_msgSend(v8, "secondaryLanguage");
  v12 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v12, (uint64_t)v34);

  objc_msgSend(v8, "secondaryRegion");
  v13 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v13, (uint64_t)v32);

  objc_msgSend(v8, "layoutName");
  v14 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v14, (uint64_t)v30);

  LOBYTE(v14) = objc_msgSend(v8, "keyboardType");
  objc_msgSend(v8, "testingParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0DBEA50]);
  v16 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v16, (uint64_t)v28);

  objc_msgSend(v8, "testingParameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0DBEA48]);
  v18 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v18, (uint64_t)v26);

  objc_msgSend(v8, "testingParameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0DBEA58]);
  v20 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v20, (uint64_t)v24);

  KB::utf8_string(v7, (uint64_t)v22);
  KB::String::String((KB::String *)retstr, (const KB::String *)v40);
  KB::String::String((KB::String *)&retstr->var1, (const KB::String *)v38);
  KB::String::String((KB::String *)&retstr->var2, (const KB::String *)v36);
  KB::String::String((KB::String *)&retstr->var3, (const KB::String *)v34);
  KB::String::String((KB::String *)&retstr->var4, (const KB::String *)v32);
  KB::String::String((KB::String *)&retstr->var5, (const KB::String *)v30);
  retstr->var6 = v14;
  KB::String::String((KB::String *)&retstr->var7, (const KB::String *)v22);
  KB::String::String((KB::String *)&retstr->var8, (const KB::String *)v26);
  KB::String::String((KB::String *)&retstr->var9, (const KB::String *)v28);
  KB::String::String((KB::String *)&retstr->var10, (const KB::String *)v24);
  if (v23 && v22[6] == 1)
    free(v23);
  if (v25 && v24[6] == 1)
    free(v25);
  if (v27 && v26[6] == 1)
    free(v27);
  if (v29 && v28[6] == 1)
    free(v29);
  if (v31 && v30[6] == 1)
    free(v31);
  if (v33 && v32[6] == 1)
    free(v33);
  if (v35 && v34[6] == 1)
    free(v35);
  if (v37 && v36[6] == 1)
    free(v37);
  if (v39 && v38[6] == 1)
    free(v39);
  result = v41;
  if (v41)
  {
    if (v40[6] == 1)
      free(v41);
  }
  return result;
}

- (void)_recalcSupplementalPrefix
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  _DWORD *m_impl;

  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supplementalLexicons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lexiconWithIdentifier:", objc_msgSend(v5, "supplementalLexiconIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    v11 = 0;
    if (self->m_impl && !v10)
    {
      -[TIKeyboardInputManager inputContext](self, "inputContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager inputStem](self, "inputStem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!objc_msgSend(v11, "length"))
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "string");
      v16 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v16;
    }
    objc_msgSend(v6, "core_searchPrefixSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v11, "_ti_supplementalPrefixOfLastToken:", v17);

  }
  else
  {
    v18 = 0;
  }

  self->_supplementalPrefix = v18;
  m_impl = self->m_impl;
  if (m_impl)
    m_impl[134] = v18;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  TIKeyboardLayoutState *v15;
  TIKeyboardLayoutState *layoutState;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  TIKeyboardInputManager *v21;
  uint64_t v22;
  void *m_impl;
  KB::DictionaryContainer *v24;
  void *v25;
  _BYTE *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  TIKBAnalyticsMetricsContext *v32;
  void *v33;
  void *v34;
  void *v35;
  TIKBAnalyticsMetricsContext *v36;
  TICounterChangeCache *counterChangeCache;
  void *v38;
  TICounterChangeCache *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  std::string __p;
  char v54;

  v5 = a5;
  v8 = a3;
  v9 = -[TIKeyboardInputManager updateAdaptationContextToKeyboardState:from:](self, "updateAdaptationContextToKeyboardState:from:", v8, a4);
  if (v5 || v9)
  {
    -[TIKeyboardInputManager scheduleLinguisticResourceUpdateWithReason:](self, "scheduleLinguisticResourceUpdateWithReason:", CFSTR("Context changed"));
    if (-[TIKeyboardInputManager isLinguisticResourceUpdateScheduled](self, "isLinguisticResourceUpdateScheduled"))
      -[TIKeyboardInputManager updateDictionaryAndLanguageModel](self, "updateDictionaryAndLanguageModel");
    -[TIKeyboardInputManager setRejectedConversionsForCurrentContinuousPath:](self, "setRejectedConversionsForCurrentContinuousPath:", 0);
  }
  -[TIKeyboardInputManager checkAndUpdateAdditionalLexicons](self, "checkAndUpdateAdditionalLexicons");
  objc_msgSend(v8, "layoutState");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v8, "layoutState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", self->_layoutState);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v8, "layoutState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (TIKeyboardLayoutState *)objc_msgSend(v14, "copy");
      layoutState = self->_layoutState;
      self->_layoutState = v15;

      -[TIKeyboardInputManager syncToLayoutState:](self, "syncToLayoutState:", self->_layoutState);
    }
  }
  objc_msgSend(v8, "keyLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager setKeyLayout:](self, "setKeyLayout:", v17);

  if (v5)
  {
    +[TIConnectionsMetricsTracker sharedInstance](TIConnectionsMetricsTracker, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInputContextDidChange:", 1);

  }
  -[TIKeyboardInputManager setAutoCorrects:](self, "setAutoCorrects:", objc_msgSend(v8, "autocorrectionEnabled"));
  -[TIKeyboardInputManager setAutocapitalizationEnabled:](self, "setAutocapitalizationEnabled:", objc_msgSend(v8, "autocapitalizationEnabled"));
  -[TIKeyboardInputManager setAutocapitalizationType:](self, "setAutocapitalizationType:", objc_msgSend(v8, "autocapitalizationType"));
  -[TIKeyboardInputManager setKeyboardEventsLagging:](self, "setKeyboardEventsLagging:", objc_msgSend(v8, "keyboardEventsLagging"));
  -[TIKeyboardInputManager setInHardwareKeyboardMode:](self, "setInHardwareKeyboardMode:", objc_msgSend(v8, "hardwareKeyboardMode"));
  -[TIKeyboardInputManager setInSplitKeyboardMode:](self, "setInSplitKeyboardMode:", objc_msgSend(v8, "splitKeyboardMode"));
  -[TIKeyboardInputManager syncInputStringToKeyboardState:afterContextChange:](self, "syncInputStringToKeyboardState:afterContextChange:", v8, v5);
  if (!objc_msgSend(v8, "wordLearningEnabled"))
  {
    v21 = self;
    v22 = 0;
    goto LABEL_17;
  }
  if (!self->_didInitialSync
    || v5
    || (objc_msgSend(v8, "documentState"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v19, "documentIsEmpty"),
        v19,
        v20))
  {
    v21 = self;
    v22 = 1;
LABEL_17:
    -[TIKeyboardInputManager setLearnsCorrection:](v21, "setLearnsCorrection:", v22);
  }
  if (!objc_msgSend(v8, "secureTextEntry") && TI_DEVICE_UNLOCKED_SINCE_BOOT())
  {
    m_impl = self->m_impl;
    if (m_impl)
    {
      v24 = (KB::DictionaryContainer *)*((_QWORD *)m_impl + 28);
      if (v24)
      {
        -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        KB::DictionaryContainer::load_dynamic_dict(v24, objc_msgSend(v25, "isSiriMode"));

      }
    }
    -[TITextCheckerExemptions setAssertsObservers:](self->_textCheckerExemptions, "setAssertsObservers:", 1);
  }
  v26 = self->m_impl;
  if (v26)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v26[683] = objc_msgSend(v27, "autocapitalizationEnabled");

  }
  -[TIKeyboardInputManager installTypologyTraceLogger](self, "installTypologyTraceLogger");
  -[TIKeyboardInputManager emojiCandidateGenerator](self, "emojiCandidateGenerator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "updateEmojiStatusForKeyboardState:", v29);

  +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pushQueuedCredentialIfNecessaryForKeyboardState:", v31);

  v32 = [TIKBAnalyticsMetricsContext alloc];
  -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activeInputModes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager testingParameters](self, "testingParameters");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v32, "initWithKeyboardState:activeInputModes:testingParameters:", v8, v34, v35);

  counterChangeCache = self->_counterChangeCache;
  objc_msgSend(v8, "statisticChanges");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[TICounterChangeCache addStatisticChanges:withContext:](counterChangeCache, "addStatisticChanges:withContext:", v38, v36);

  v39 = self->_counterChangeCache;
  objc_msgSend(MEMORY[0x1E0DBDCE0], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "flush");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[TICounterChangeCache addStatisticChanges:withContext:](v39, "addStatisticChanges:withContext:", v41, v36);

  if (self->m_impl)
  {
    +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "locale");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "inputTranscoderAssetsDirectoryURLForLocale:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    __p.__r_.__value_.__s.__data_[0] = 0;
    v54 = 0;
    if (v45)
    {
      objc_msgSend(v45, "absoluteString", __p.__r_.__value_.__r.__words[0]);
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::optional<std::string>::operator=[abi:nn180100]<char const*,void>(&__p, (std::string::value_type *)objc_msgSend(v46, "UTF8String"));
    }
    else
    {
      -[TIKeyboardInputManager config](self, "config", __p.__r_.__value_.__r.__words[0]);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "mlttBundleURL");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v48)
        goto LABEL_32;
      -[TIKeyboardInputManager config](self, "config");
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "mlttBundleURL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "absoluteString");
      v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::optional<std::string>::operator=[abi:nn180100]<char const*,void>(&__p, (std::string::value_type *)objc_msgSend(v50, "UTF8String"));

    }
LABEL_32:
    (*(void (**)(_QWORD, std::string *))(**((_QWORD **)self->m_impl + 23) + 424))(*((_QWORD *)self->m_impl + 23), &__p);
    if (v54 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);

  }
  self->_didInitialSync = 1;
  +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "supplementalLexicons");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_currentCandidateGenerationContextSupplementalLexicons, v52);

}

- (id)testingParameters
{
  void *v2;
  void *v3;
  id v4;

  -[TIKeyboardInputManager trialParameters](self, "trialParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)MEMORY[0x1E0C9AA70];

  return v4;
}

- (id)trialParameters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encodedCATrialParametersForLocale:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  self->_wordLearningEnabled = a3;
}

- (void)setKeyLayout:(id)a3
{
  id v5;
  TIKeyboardLayout **p_keyLayout;
  TIInputManager *m_impl;
  TIKeyboardLayout *v8;
  _BYTE *v9;
  char v10;
  uint64_t v11;
  void *v12;
  KB *v13;
  TIInputManager *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _BYTE v18[8];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_keyLayout = &self->_keyLayout;
  if ((-[TIKeyboardLayout isEqual:](self->_keyLayout, "isEqual:", v5) & 1) == 0)
  {
    -[TIKeyboardInputManager keyLayoutWillChangeTo:from:](self, "keyLayoutWillChangeTo:from:", v5, *p_keyLayout);
    objc_storeStrong((id *)&self->_keyLayout, a3);
    m_impl = (TIInputManager *)self->m_impl;
    if (m_impl)
    {
      TIInputManager::clear_key_areas(m_impl);
      v8 = *p_keyLayout;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __39__TIKeyboardInputManager_setKeyLayout___block_invoke;
      v17[3] = &unk_1EA100D80;
      v17[4] = self;
      -[TIKeyboardLayout enumerateKeysUsingBlock:](v8, "enumerateKeysUsingBlock:", v17);
      -[TIKeyboardInputManager keyLayoutDidChangeTo:](self, "keyLayoutDidChangeTo:", *p_keyLayout);
      v9 = self->m_impl;
      v10 = -[TIKeyboardLayout usesTwoHands](*p_keyLayout, "usesTwoHands");
      v9[280] = v10;
      v11 = *((_QWORD *)v9 + 40);
      if (v11)
        *(_BYTE *)(v11 + 112) = v10;
      -[TIKeyboardInputManager currentInputModeIdentifier](self, "currentInputModeIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      TIInputModeGetSWLayout();
      v13 = (KB *)objc_claimAutoreleasedReturnValue();

      v14 = (TIInputManager *)self->m_impl;
      KB::utf8_string(v13, (uint64_t)v18);
      TIInputManager::set_layout_name(v14, (const KB::String *)v18);
      if (v19 && v18[6] == 1)
        free(v19);
      TIInputManager::commit_key_layout((TIInputManager *)self->m_impl);

    }
    if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
    {
      -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "layoutDidChange:keyboardState:", v5, v16);

    }
  }

}

- (BOOL)nextInputWouldStartSentenceAfterInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;

  v4 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "autocapitalizationEnabled");

  if (!v6)
    goto LABEL_4;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "autocapitalizationType");

  if (v8 != 2)
    goto LABEL_4;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "markedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "documentState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contextBeforeInput");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v18 = &stru_1EA1081D0;
    if (v16)
      v18 = (__CFString *)v16;
    v19 = v18;

    if (v4)
    {
      -[__CFString stringByAppendingString:](v19, "stringByAppendingString:", v4);
      v20 = objc_claimAutoreleasedReturnValue();

      v19 = (__CFString *)v20;
    }
    v12 = -[TIKeyboardInputManager canStartSentenceAfterString:](self, "canStartSentenceAfterString:", v19);

  }
  else
  {
LABEL_4:
    v12 = 0;
  }

  return v12;
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)refreshInputManagerState
{
  void *v2;
  void *v3;
  _BOOL4 v5;
  BOOL v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
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
  void *v28;
  _BOOL8 v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  _BOOL8 v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  _BOOL8 v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  _BOOL8 v45;
  void *v46;
  _BOOL8 v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;

  v5 = -[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection");
  v6 = v5;
  if (v5)
  {
    -[TIKeyboardInputManager inputString](self, "inputString");
  }
  else
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "documentState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager inputStringFromDocumentState:](self, "inputStringFromDocumentState:", v3);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager currentState](self, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInputString:", v7);

  if (!v6)
  {

    v7 = v2;
  }

  v9 = -[TIKeyboardInputManager _hasSupplementalPrefix](self, "_hasSupplementalPrefix");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHasSupplementalPrefix:", v9);

  v11 = -[TIKeyboardInputManager inputCount](self, "inputCount");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInputCount:", v11);

  v13 = -[TIKeyboardInputManager inputIndex](self, "inputIndex");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInputIndex:", v13);

  v15 = -[TIKeyboardInputManager nextInputWouldStartSentence](self, "nextInputWouldStartSentence");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setNextInputWouldStartSentence:", v15);

  -[TIKeyboardInputManager shadowTyping](self, "shadowTyping");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager currentState](self, "currentState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setShadowTyping:", v17);

  -[TIKeyboardInputManager keyEventMap](self, "keyEventMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager currentState](self, "currentState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setKeyEventMap:", v19);

  -[TIKeyboardInputManager replacementForDoubleSpace](self, "replacementForDoubleSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager currentState](self, "currentState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setReplacementForDoubleSpace:", v21);

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "documentState");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager shortcutCompletionsForDocumentState:](self, "shortcutCompletionsForDocumentState:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager currentState](self, "currentState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setShortcutCompletions:", v25);

  -[TIKeyboardInputManager inputsToReject](self, "inputsToReject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager currentState](self, "currentState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setInputsToReject:", v27);

  v29 = -[TIKeyboardInputManager suppressPlaceholderCandidate](self, "suppressPlaceholderCandidate");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSuppressPlaceholderCandidate:", v29);

  v31 = -[TIKeyboardInputManager supportsNumberKeySelection](self, "supportsNumberKeySelection");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setSupportsNumberKeySelection:", v31);

  v33 = -[TIKeyboardInputManager usesPunctuationKeysForRowNavigation](self, "usesPunctuationKeysForRowNavigation");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setUsesPunctuationKeysForRowNavigation:", v33);

  v35 = -[TIKeyboardInputManager usesLiveConversion](self, "usesLiveConversion");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setUsesLiveConversion:", v35);

  v37 = -[TIKeyboardInputManager delayedCandidateList](self, "delayedCandidateList");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setDelayedCandidateList:", v37);

  -[TIKeyboardInputManager currentState](self, "currentState");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "inputString");
  v57 = (id)objc_claimAutoreleasedReturnValue();

  v40 = objc_msgSend(v57, "length");
  if (v40)
  {
    -[TIKeyboardInputManager textCheckerExemptions](self, "textCheckerExemptions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v38, "stringIsExemptFromChecker:", v57);
  }
  else
  {
    v41 = 0;
  }
  -[TIKeyboardInputManager currentState](self, "currentState");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setInputStringIsExemptFromChecker:", v41);

  if (v40)
  if (v57)
  {
    -[TIKeyboardInputManager autocorrectionRecordForWord:](self, "autocorrectionRecordForWord:", v57);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = 0;
  }
  -[TIKeyboardInputManager currentState](self, "currentState");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAutocorrectionRecordForInputString:", v43);

  if (v57)
  v45 = -[TIKeyboardInputManager usesContinuousPath](self, "usesContinuousPath");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setUsesContinuousPath:", v45);

  v47 = -[TIKeyboardInputManager shouldFixupIncompleteRomaji](self, "shouldFixupIncompleteRomaji");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setShouldFixupIncompleteRomaji:", v47);

  v49 = -[TIKeyboardInputManager acceptAutocorrectionCommitsInline](self, "acceptAutocorrectionCommitsInline");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setAcceptAutocorrectionCommitsInline:", v49);

  -[TIKeyboardInputManager config](self, "config");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "shouldIgnoreCPRequirements");
  -[TIKeyboardInputManager currentState](self, "currentState");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setIgnoreContinuousPathRequirements:", v52);

  -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v52, "learningFlagsMask");
  }
  else
  {
    v55 = 0;
  }
  -[TIKeyboardInputManager currentState](self, "currentState");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setLearningFlagsMaskForLastAcceptedCandidate:", v55);

  if (v54)
}

- (TIKeyboardInputManagerState)currentState
{
  TIKeyboardInputManagerState *currentState;
  TIKeyboardInputManagerState *v4;
  TIKeyboardInputManagerState *v5;

  currentState = self->_currentState;
  if (!currentState)
  {
    v4 = -[TIKeyboardInputManager newInputManagerState](self, "newInputManagerState");
    v5 = self->_currentState;
    self->_currentState = v4;

    currentState = self->_currentState;
  }
  return currentState;
}

- (unsigned)internalIndexToExternal:(unsigned int)a3
{
  unsigned int v3;
  unsigned __int16 *m_impl;
  const KB::String *v6;
  void *v7;
  void *v8;
  _BYTE v10[8];
  void *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  m_impl = (unsigned __int16 *)self->m_impl;
  if (m_impl)
  {
    if (self->m_composedText)
    {
      TIInputManager::input_substring(m_impl + 4, 0, a3, (uint64_t)v10);
      KB::ns_string((KB *)v10, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "length");

      if (v11)
      {
        if (v10[6] == 1)
          free(v11);
      }
    }
  }
  return v3;
}

- (TIKeyboardCandidate)lastAcceptedText
{
  return self->_lastAcceptedText;
}

- (id)shortcutCompletionsForDocumentState:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  TIKeyboardInputManager *v20;
  id v21;

  v4 = a3;
  if (-[TIKeyboardInputManager shouldSkipShortcutConversionForDocumentState:](self, "shouldSkipShortcutConversionForDocumentState:", v4))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "contextBeforeInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[TIKeyboardInputManager shortcutSearchRangeForString:](self, "shortcutSearchRangeForString:", v6);
    if (v8 <= 0x40)
    {
      v9 = v7;
      v10 = v8;
      v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __82__TIKeyboardInputManager_ShortcutConversion__shortcutCompletionsForDocumentState___block_invoke;
      v19 = &unk_1EA106CE8;
      v20 = self;
      v12 = v11;
      v21 = v12;
      -[TIKeyboardInputManager enumerateWordSuffixesOfString:inRange:usingBlock:](self, "enumerateWordSuffixesOfString:inRange:usingBlock:", v6, v9, v10, &v16);
      v13 = (void *)objc_msgSend(v12, "length", v16, v17, v18, v19, v20);
      if (v13)
      {
        objc_msgSend(v12, "uppercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendString:", v14);

        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB60]), "initWithCharactersInString:", v12);
      }
      v5 = v13;

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (BOOL)usesPunctuationKeysForRowNavigation
{
  return 0;
}

- (BOOL)usesLiveConversion
{
  return 0;
}

- (BOOL)usesContinuousPath
{
  void *v4;
  char v5;

  if (-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
    return 0;
  -[TIKeyboardInputManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "usesContinuousPath");

  return v5;
}

- (BOOL)suppressPlaceholderCandidate
{
  return 0;
}

- (BOOL)supportsNumberKeySelection
{
  return 0;
}

- (BOOL)shouldFixupIncompleteRomaji
{
  return 0;
}

- (id)shadowTyping
{
  char *m_impl;
  const KB::String *v4;
  void *v5;
  void *v6;
  _BYTE v8[8];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  m_impl = (char *)self->m_impl;
  if (m_impl)
  {
    KB::String::String((KB::String *)v8, (const KB::String *)(m_impl + 64));
    KB::ns_string((KB *)v8, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v8[6] == 1)
      free(v9);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)replacementForDoubleSpace
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replacementForDoubleSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)nextInputWouldStartSentence
{
  void *v3;
  BOOL v4;

  if (!-[TIKeyboardInputManager shouldInsertSpaceBeforeInput:](self, "shouldInsertSpaceBeforeInput:", 0))
    return -[TIKeyboardInputManager nextInputWouldStartSentenceAfterInput:](self, "nextInputWouldStartSentenceAfterInput:", 0);
  -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TIKeyboardInputManager nextInputWouldStartSentenceAfterInput:](self, "nextInputWouldStartSentenceAfterInput:", v3);

  return v4;
}

- (BOOL)delayedCandidateList
{
  return 0;
}

- (BOOL)acceptAutocorrectionCommitsInline
{
  return 0;
}

- (id)keyEventMap
{
  return 0;
}

- (void)willChangeToKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v4 = a4;
  v26 = a3;
  objc_msgSend(v26, "documentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    objc_msgSend(v26, "documentIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "documentIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v26, "documentIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "documentIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqual:", v15);

        if ((v16 & 1) != 0)
          goto LABEL_14;
      }
    }
    goto LABEL_9;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_4;
  if (!v4)
    goto LABEL_14;
LABEL_9:
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textInputTraits");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recentInputIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0DBDCB8];
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "documentState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contextBeforeInput");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIKeyboardInputManager recentsFilePathForIdentifier:](TIKeyboardInputManager, "recentsFilePathForIdentifier:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "storeInput:forSystemIdentifier:atPath:", v23, v19, v24);

  }
  if (!-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
  {
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "syncToDocumentState:", 0);

  }
LABEL_14:
  -[TIKeyboardInputManager updateResponseModelForKeyboardState:](self, "updateResponseModelForKeyboardState:", v26);

}

- (BOOL)usesCandidateSelection
{
  return 0;
}

- (void)syncToKeyboardState:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v16, "documentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

      goto LABEL_11;
    }
  }
  v6 = -[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection");
  objc_msgSend(v16, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v10 = objc_msgSend(v7, "isEqual:", v9);
  else
    v10 = objc_msgSend(v7, "isEqualIgnoringMarkedText:", v9);
  v11 = v10 ^ 1;

  if (!v5)
  {

    if ((v11 & 1) != 0)
      goto LABEL_11;
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }

  if (!v11)
    goto LABEL_12;
LABEL_11:
  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "reset");

  v14 = 1;
LABEL_13:
  -[TIKeyboardInputManager willChangeToKeyboardState:afterContextChange:](self, "willChangeToKeyboardState:afterContextChange:", v16, v14);
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager setKeyboardState:](self, "setKeyboardState:", v16);
  -[TIKeyboardInputManager syncToKeyboardState:from:afterContextChange:](self, "syncToKeyboardState:from:afterContextChange:", v16, v15, v14);

}

- (BOOL)shouldSkipShortcutConversionForDocumentState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "selectedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 || (objc_msgSend(v3, "markedText"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "contextAfterInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(v3, "contextAfterInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v9, "rangeOfCharacterFromSet:", v10) != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)shouldInsertSpaceBeforeInput:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v4 = a3;
  if (!-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
  {
    -[TIKeyboardInputManager config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "insertsSpaceAfterPredictiveInput");

    if ((v6 & 1) == 0)
    {
      -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8
        || !objc_msgSend(v8, "isContinuousPathConversion")
        || !objc_msgSend(v9, "shouldAccept"))
      {
        goto LABEL_16;
      }
      -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "length"))
      {
        objc_msgSend(v9, "candidate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "hasSuffix:", v12);

        if ((v13 & 1) != 0)
          goto LABEL_16;
      }
      else
      {

      }
      if (objc_msgSend(v4, "length"))
      {
        -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", v14))
        {
LABEL_15:

LABEL_16:
          v7 = 0;
LABEL_17:

          goto LABEL_18;
        }
        -[TIKeyboardInputManager pathedWordSeparator](self, "pathedWordSeparator");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "isEqualToString:", v15))
        {

          goto LABEL_15;
        }
        v17 = objc_msgSend(v4, "isEqualToString:", CFSTR("\n"));

        if ((v17 & 1) != 0)
          goto LABEL_16;
        -[TIKeyboardInputManager terminatorsDeletingAutospace](self, "terminatorsDeletingAutospace");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "characterSet");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

        if ((v20 & 1) != 0)
          goto LABEL_16;
        if (objc_msgSend(v9, "isContinuousPathConversion"))
        {
          if (objc_msgSend(v9, "shouldAccept"))
          {
            -[TIKeyboardInputManager spaceDeletingCharacters](self, "spaceDeletingCharacters");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "characterSet");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", 0));

            if ((v23 & 1) != 0)
              goto LABEL_16;
          }
        }
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "documentState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "contextBeforeInput");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = -[TIKeyboardInputManager rangeOfUnclosedQuoteMatchingQuote:inString:range:](self, "rangeOfUnclosedQuoteMatchingQuote:inString:range:", v4, v26, 0, objc_msgSend(v26, "length"));
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_16;
      }
      v7 = 1;
      goto LABEL_17;
    }
  }
  v7 = 0;
LABEL_18:

  return v7;
}

- (_NSRange)shortcutSearchRangeForString:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3500];
    v5 = a3;
    objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:options:", v6, 4);
    v9 = v8;

    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v3 = 0;
    else
      v3 = v7 + v9;
    v10 = objc_msgSend(v5, "length");

    v11 = v10 - v3;
  }
  else
  {
    v11 = 0;
  }
  v12 = v3;
  result.length = v11;
  result.location = v12;
  return result;
}

- (id)inputsToReject
{
  return 0;
}

- (id)inputStringFromDocumentState:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__TIKeyboardInputManager_inputStringFromDocumentState___block_invoke;
  v4[3] = &unk_1EA100AB0;
  v4[4] = self;
  objc_msgSend(a3, "inputStringWithTerminatorPredicate:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)inputIndex
{
  unsigned int *m_impl;

  m_impl = (unsigned int *)self->m_impl;
  if (m_impl)
    return -[TIKeyboardInputManager internalIndexToExternal:](self, "internalIndexToExternal:", m_impl[24]);
  else
    return 0;
}

- (unsigned)inputCount
{
  _QWORD *m_impl;

  m_impl = self->m_impl;
  if (m_impl)
    return -[TIKeyboardInputManager internalIndexToExternal:](self, "internalIndexToExternal:", -858993459 * ((m_impl[2] - m_impl[1]) >> 3));
  else
    return 0;
}

- (void)enumerateWordSuffixesOfString:(id)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  id v9;
  NSUInteger v10;
  id v11;
  void (**v12)(void *, _QWORD, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t *);
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v24;
  id v25;
  id v26;
  uint64_t *v27;
  NSUInteger v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v9 = a5;
  if (length)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v10 = location + length;
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __75__TIKeyboardInputManager_enumerateWordSuffixesOfString_inRange_usingBlock___block_invoke;
    v24 = &unk_1EA100F60;
    v28 = location + length;
    v11 = v8;
    v25 = v11;
    v26 = v9;
    v27 = &v29;
    v12 = (void (**)(void *, _QWORD, unint64_t, uint64_t, unint64_t, uint64_t, uint64_t *))_Block_copy(&v21);
    v13 = objc_alloc_init(MEMORY[0x1E0DBDDC8]);
    objc_msgSend(v13, "setString:withSearchRange:", v11, location, length, v21, v22, v23, v24);
    v14 = objc_msgSend(v13, "advanceToNextToken");
    if (v15)
    {
      v16 = v14;
      v17 = v15;
      do
      {
        if (v16 <= location)
        {
          v18 = v30;
        }
        else
        {
          objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", location, v16 - location, 514, v12);
          v18 = v30;
          if (*((_BYTE *)v30 + 24))
            break;
        }
        v12[2](v12, 0, v16, v17, v16, v17, v18 + 3);
        if (*((_BYTE *)v30 + 24))
          break;
        location = v16 + v17;
        v16 = objc_msgSend(v13, "advanceToNextToken");
        v17 = v19;
      }
      while (v19);
    }
    if (*((_BYTE *)v30 + 24))
      v20 = 0;
    else
      v20 = v10 > location;
    if (v20)
      objc_msgSend(v11, "enumerateSubstringsInRange:options:usingBlock:", location, v10 - location, 514, v12);

    _Block_object_dispose(&v29, 8);
  }

}

- (TIEmojiCandidateGenerator)emojiCandidateGenerator
{
  TIEmojiCandidateGenerator *emojiCandidateGenerator;
  void *v4;
  void *v5;
  TIEmojiCandidateGenerator *v6;
  TIEmojiCandidateGenerator *v7;
  TIEmojiCandidateGenerator *v8;

  if (TI_DEVICE_UNLOCKED_SINCE_BOOT())
  {
    emojiCandidateGenerator = self->_emojiCandidateGenerator;
    if (!emojiCandidateGenerator)
    {
      -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "activeInputModes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = -[TIEmojiCandidateGenerator initWithActiveInputModes:inputManager:]([TIEmojiCandidateGenerator alloc], "initWithActiveInputModes:inputManager:", v5, self);
      v7 = self->_emojiCandidateGenerator;
      self->_emojiCandidateGenerator = v6;

      emojiCandidateGenerator = self->_emojiCandidateGenerator;
    }
    v8 = emojiCandidateGenerator;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)checkAndUpdateAdditionalLexicons
{
  uint64_t v2;

  v2 = *((_QWORD *)self->m_impl + 29);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 552))(v2);
}

- (BOOL)_hasSupplementalPrefix
{
  return self->_supplementalPrefix != 0;
}

- (void)setKeyboardEventsLagging:(BOOL)a3
{
  *((_BYTE *)self->m_impl + 685) = a3;
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
  _BYTE *m_impl;

  m_impl = self->m_impl;
  if (m_impl)
    m_impl[681] = a3;
}

- (void)setRejectedConversionsForCurrentContinuousPath:(id)a3
{
  objc_storeStrong((id *)&self->_rejectedConversionsForCurrentContinuousPath, a3);
}

- (id)currentInputModeIdentifier
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)updateAdaptationContextToKeyboardState:(id)a3 from:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "recipientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "_string:matchesString:", v8, v9))
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "_string:matchesString:", v11, v12) ^ 1;

  }
  else
  {
    LOBYTE(v13) = 1;
  }

  return v13;
}

- (void)setKeyboardState:(id)a3
{
  id v3;
  id v5;
  _QWORD *m_impl;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _OWORD *v15;
  __int128 v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  int64x2_t v27;
  unint64_t v28;
  std::string *v29;
  char *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  _WORD *v39;
  std::__split_buffer<std::string>::pointer end;
  int64_t v41;
  unint64_t v42;
  unint64_t v43;
  std::string *v44;
  uint64_t v45;
  uint64_t v46;
  KB::String *v47;
  KB::String *v48;
  char *begin;
  std::string::value_type *v50;
  int64x2_t v51;
  std::string *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  _BOOL4 v56;
  void *v57;
  void *v58;
  id v59;
  id v60;
  TIKeyboardInputManager *v61;
  TIKeyboardInputManager *v62;
  _QWORD v63[3];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  std::string v68;
  void *__p[2];
  std::string *value;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  int64x2_t v75;
  std::string *v76;
  _BYTE v77[128];
  _BYTE v78[128];
  std::__split_buffer<std::string> v79;
  uint64_t v80;

  v3 = a3;
  v80 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (simular_swear_word_policy_v2_setting)
  {
    if ((objc_msgSend((id)simular_swear_word_policy_v2_setting, "BOOLValue") & 1) == 0)
      goto LABEL_38;
  }
  else if (!_os_feature_enabled_impl())
  {
    goto LABEL_38;
  }
  m_impl = self->m_impl;
  if (m_impl)
  {
    v60 = v3;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "clientIdentifier");
      v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      LODWORD(v79.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"-[TIKeyboardInputManager setKeyboardState:]";
      WORD2(v79.__begin_) = 2080;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__begin_ + 6) = (std::__split_buffer<std::string>::pointer)objc_msgSend(v59, "UTF8String");
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Passing client ID to the vulgar word usage database wrapper; client ID: %s",
        (uint8_t *)&v79,
        0x16u);

      m_impl = self->m_impl;
    }
    v61 = self;
    objc_msgSend(v5, "clientIdentifier");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    m_impl[75] = objc_msgSend(v7, "UTF8String");

    v75 = 0uLL;
    v76 = 0;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    objc_msgSend(v5, "inputContextHistory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recipientIdentifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v72 != v13)
            objc_enumerationMutation(v10);
          std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v71 + 1) + 8 * i)), "UTF8String"));
          v15 = (_OWORD *)v75.i64[1];
          if (v75.i64[1] >= (unint64_t)v76)
          {
            v17 = 0xAAAAAAAAAAAAAAABLL * ((v75.i64[1] - v75.i64[0]) >> 3);
            v18 = v17 + 1;
            if (v17 + 1 > 0xAAAAAAAAAAAAAAALL)
LABEL_71:
              abort();
            if (0x5555555555555556 * (((uint64_t)v76 - v75.i64[0]) >> 3) > v18)
              v18 = 0x5555555555555556 * (((uint64_t)v76 - v75.i64[0]) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v76 - v75.i64[0]) >> 3) >= 0x555555555555555)
              v19 = 0xAAAAAAAAAAAAAAALL;
            else
              v19 = v18;
            v79.__end_cap_.__value_ = (std::allocator<std::string> *)&v76;
            if (v19)
              v19 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v19);
            else
              v20 = 0;
            v21 = v19 + 24 * v17;
            v22 = *(_OWORD *)__p;
            *(_QWORD *)(v21 + 16) = value;
            *(_OWORD *)v21 = v22;
            __p[1] = 0;
            value = 0;
            __p[0] = 0;
            v23 = v75.i64[1];
            v24 = v75.i64[0];
            if (v75.i64[1] == v75.i64[0])
            {
              v27 = vdupq_n_s64(v75.u64[1]);
              v25 = v19 + 24 * v17;
            }
            else
            {
              v25 = v19 + 24 * v17;
              do
              {
                v26 = *(_OWORD *)(v23 - 24);
                *(_QWORD *)(v25 - 8) = *(_QWORD *)(v23 - 8);
                *(_OWORD *)(v25 - 24) = v26;
                v25 -= 24;
                *(_QWORD *)(v23 - 16) = 0;
                *(_QWORD *)(v23 - 8) = 0;
                *(_QWORD *)(v23 - 24) = 0;
                v23 -= 24;
              }
              while (v23 != v24);
              v27 = v75;
            }
            v28 = v21 + 24;
            v75.i64[0] = v25;
            v75.i64[1] = v21 + 24;
            *(int64x2_t *)&v79.__begin_ = v27;
            v29 = v76;
            v76 = (std::string *)(v19 + 24 * v20);
            v79.__end_cap_.__value_ = v29;
            v79.__first_ = (std::__split_buffer<std::string>::pointer)v27.i64[0];
            std::__split_buffer<std::string>::~__split_buffer(&v79);
            v75.i64[1] = v28;
            if (SHIBYTE(value) < 0)
              operator delete(__p[0]);
          }
          else
          {
            v16 = *(_OWORD *)__p;
            *(_QWORD *)(v75.i64[1] + 16) = value;
            *v15 = v16;
            v75.i64[1] = (uint64_t)v15 + 24;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
      }
      while (v12);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v79.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"-[TIKeyboardInputManager setKeyboardState:]";
      WORD2(v79.__begin_) = 2048;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__begin_ + 6) = (std::__split_buffer<std::string>::pointer)(0xAAAAAAAAAAAAAAABLL * ((v75.i64[1] - v75.i64[0]) >> 3));
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Passing recipient IDs to the vulgar word usage database wrapper; number of IDs: %lu",
        (uint8_t *)&v79,
        0x16u);
    }
    self = v61;
    v30 = (char *)v61->m_impl;
    memset(&v68, 0, sizeof(v68));
    std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v68, (__int128 *)v75.i64[0], (__int128 *)v75.i64[1], 0xAAAAAAAAAAAAAAABLL * ((v75.i64[1] - v75.i64[0]) >> 3));
    if (v30 + 608 != (char *)&v68)
      std::vector<std::string>::__assign_with_size[abi:nn180100]<std::string*,std::string*>((std::vector<std::string> *)(v30 + 608), (std::string *)v68.__r_.__value_.__l.__data_, (std::string *)v68.__r_.__value_.__l.__size_, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v68.__r_.__value_.__l.__size_ - v68.__r_.__value_.__r.__words[0]) >> 3));
    v79.__first_ = &v68;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v79);
    v79.__first_ = (std::__split_buffer<std::string>::pointer)&v75;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v79);
    v3 = v60;
  }
LABEL_38:
  v31 = self->m_impl;
  if (v31 && v31[29])
  {
    v62 = self;
    __p[0] = 0;
    __p[1] = 0;
    value = 0;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    objc_msgSend(v5, "inputContextHistory");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "recipientNames");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v65 != v37)
            objc_enumerationMutation(v34);
          KB::utf8_string(*(KB **)(*((_QWORD *)&v64 + 1) + 8 * j), (uint64_t)&v75);
          v39 = __p[1];
          if (__p[1] >= value)
          {
            v41 = ((char *)__p[1] - (char *)__p[0]) >> 5;
            if ((unint64_t)(v41 + 1) >> 59)
              goto LABEL_71;
            v42 = ((char *)value - (char *)__p[0]) >> 4;
            if (v42 <= v41 + 1)
              v42 = v41 + 1;
            if ((unint64_t)((char *)value - (char *)__p[0]) >= 0x7FFFFFFFFFFFFFE0)
              v43 = 0x7FFFFFFFFFFFFFFLL;
            else
              v43 = v42;
            v79.__end_cap_.__value_ = (std::allocator<std::string> *)&value;
            v44 = (std::string *)std::__allocate_at_least[abi:nn180100]<std::allocator<language_modeling::v1::Token>>(v43);
            v45 = (uint64_t)v44 + 32 * v41;
            v79.__first_ = v44;
            v79.__begin_ = (std::__split_buffer<std::string>::pointer)v45;
            v79.__end_cap_.__value_ = (std::string *)((char *)v44 + 32 * v46);
            *(_DWORD *)v45 = 0x100000;
            *(_WORD *)(v45 + 4) = 0;
            *(_BYTE *)(v45 + 6) = 0;
            *(_QWORD *)(v45 + 8) = 0;
            KB::String::operator=(v45, (KB::String *)&v75);
            end = (std::__split_buffer<std::string>::pointer)(v45 + 32);
            v79.__end_ = (std::__split_buffer<std::string>::pointer)(v45 + 32);
            v48 = (KB::String *)__p[0];
            v47 = (KB::String *)__p[1];
            begin = (char *)v79.__begin_;
            if (__p[1] == __p[0])
            {
              v51 = vdupq_n_s64((unint64_t)__p[1]);
            }
            else
            {
              v50 = &v79.__begin_[-2].__r_.__value_.__s.__data_[16];
              do
              {
                *(_DWORD *)v50 = 0x100000;
                v47 = (KB::String *)((char *)v47 - 32);
                *((_WORD *)v50 + 2) = 0;
                v50[6] = 0;
                *((_QWORD *)v50 + 1) = 0;
                begin = (char *)KB::String::operator=((uint64_t)v50, v47);
                v50 = begin - 32;
              }
              while (v47 != v48);
              v51 = *(int64x2_t *)__p;
              end = v79.__end_;
            }
            __p[0] = begin;
            __p[1] = end;
            *(int64x2_t *)&v79.__begin_ = v51;
            v52 = value;
            value = v79.__end_cap_.__value_;
            v79.__end_cap_.__value_ = v52;
            v79.__first_ = (std::__split_buffer<std::string>::pointer)v51.i64[0];
            std::__split_buffer<KB::String>::~__split_buffer((uint64_t)&v79);
          }
          else
          {
            *(_DWORD *)__p[1] = 0x100000;
            v39[2] = 0;
            *((_BYTE *)v39 + 6) = 0;
            *((_QWORD *)v39 + 1) = 0;
            end = (std::__split_buffer<std::string>::pointer)(KB::String::operator=((uint64_t)v39, (KB::String *)&v75)
                                                            + 32);
          }
          __p[1] = end;
          if (v75.i64[1] && v75.u8[6] == 1)
            free((void *)v75.i64[1]);
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      }
      while (v36);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v79.__first_) = 136315394;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__first_ + 4) = (std::__split_buffer<std::string>::pointer)"-[TIKeyboardInputManager setKeyboardState:]";
      WORD2(v79.__begin_) = 2048;
      *(std::__split_buffer<std::string>::pointer *)((char *)&v79.__begin_ + 6) = (std::__split_buffer<std::string>::pointer)(((char *)__p[1] - (char *)__p[0]) >> 5);
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Passing recipient names to the inline completions generator; number of names: %lu",
        (uint8_t *)&v79,
        0x16u);
    }
    self = v62;
    v53 = *((_QWORD *)v62->m_impl + 29);
    memset(v63, 0, sizeof(v63));
    std::vector<KB::String>::__init_with_size[abi:nn180100]<KB::String*,KB::String*>((KB::String *)v63, (const KB::String *)__p[0], (const KB::String *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 5);
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v53 + 216))(v53, v63);
    v79.__first_ = (std::__split_buffer<std::string>::pointer)v63;
    std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100]((void ***)&v79);
    v79.__first_ = (std::__split_buffer<std::string>::pointer)__p;
    std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100]((void ***)&v79);
  }
  objc_storeStrong((id *)&self->_keyboardState, v3);
  objc_msgSend(v5, "clientIdentifier");
  v54 = objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    v55 = (void *)v54;
    v56 = -[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession");

    if (v56)
    {
      -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "clientIdentifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setClientID:keyboardState:", v58, v5);

    }
  }
  -[TIKeyboardInputManager _recalcSupplementalPrefix](self, "_recalcSupplementalPrefix");

}

- (void)updateResponseModelForKeyboardState:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unsigned int v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = v4;
    v6 = objc_msgSend(v4, "secureTextEntry");
    v5 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = TI_DEVICE_UNLOCKED_SINCE_BOOT();
      v5 = v9;
      if (v7)
      {
        objc_msgSend(v9, "inputContextHistory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager synchronizeConversationHistoryWithInputContextHistory:](self, "synchronizeConversationHistoryWithInputContextHistory:", v8);

        v5 = v9;
      }
    }
  }

}

- (void)synchronizeConversationHistoryWithInputContextHistory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  TIInputContextHistory *synchronizedInputContextHistory;
  id *p_synchronizedInputContextHistory;
  TIInputContextHistory *v15;
  id v16;
  _QWORD v17[5];

  v5 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputContextHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "recipientIdentifiers");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v7, "recipientIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recipientIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToSet:", v11);

    if ((v12 & 1) == 0)
    {
      -[TIKeyboardInputManager resetConversationHistory](self, "resetConversationHistory");
      synchronizedInputContextHistory = self->_synchronizedInputContextHistory;
      self->_synchronizedInputContextHistory = 0;

    }
  }
  p_synchronizedInputContextHistory = (id *)&self->_synchronizedInputContextHistory;
  v15 = self->_synchronizedInputContextHistory;
  if (v15)
    -[TIInputContextHistory appendPendingEntriesFromInputContextHistory:](v15, "appendPendingEntriesFromInputContextHistory:", v5);
  else
    objc_storeStrong((id *)&self->_synchronizedInputContextHistory, a3);
  if (objc_msgSend(*p_synchronizedInputContextHistory, "hasPendingEntries"))
  {
    v16 = *p_synchronizedInputContextHistory;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __90__TIKeyboardInputManager_Learning__synchronizeConversationHistoryWithInputContextHistory___block_invoke;
    v17[3] = &unk_1EA1054E0;
    v17[4] = self;
    objc_msgSend(v16, "enumeratePendingEntries:", v17);
    objc_msgSend(*p_synchronizedInputContextHistory, "assertCheckpointForCoding");
    -[TIKeyboardInputManager updateInputContext](self, "updateInputContext");
  }

}

- (TILanguageSelectionController)languageSelectionController
{
  void *v3;
  TILanguageSelectionController *languageSelectionController;
  TILanguageSelectionController *v5;
  TILanguageSelectionController *v6;
  TILanguageSelectionController *v7;

  -[TIKeyboardInputManager getTestingStateObject](self, "getTestingStateObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if ((TI_DEVICE_UNLOCKED_SINCE_BOOT() & 1) == 0)
  {
    v7 = 0;
    return v7;
  }
  languageSelectionController = self->_languageSelectionController;
  if (!languageSelectionController)
  {
    v5 = objc_alloc_init(TILanguageSelectionController);
    v6 = self->_languageSelectionController;
    self->_languageSelectionController = v5;

    -[TILanguageSelectionController setDelegate:](self->_languageSelectionController, "setDelegate:", self);
    languageSelectionController = self->_languageSelectionController;
  }
  v7 = languageSelectionController;
  return v7;
}

- (id)getTestingStateObject
{
  return self->_testingStateObject;
}

void __51__TIKeyboardInputManager_mul_keyboardConfiguration__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "languageWithRegion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __52__TIKeyboardInputManager_mul_shouldUpdateDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  BOOL v5;

  result = objc_msgSend(*(id *)(a1 + 32), "lexiconIDForInputMode:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    v5 = 1;
  }
  else
  {
    result = KB::StaticDictionary::lexicon_index(*(KB::StaticDictionary **)(a1 + 48), result);
    v5 = result == -1;
  }
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

- (void)installTypologyTraceLogger
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  char v9;
  int v10;
  uint64_t *p_m_typology_recorder;
  _QWORD *v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  _QWORD *m_impl;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  __int128 v23;

  if (!self->m_impl)
    return;
  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isTesting") & 1) != 0)
  {
    -[TIKeyboardInputManagerBase typologyPreferences](self, "typologyPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isInternalDeviceWithForcedTypologyLoggingForTesting");

    if (!v5)
      return;
  }
  else
  {

  }
  -[TIKeyboardInputManagerBase typologyPreferences](self, "typologyPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "typologyLoggingEnabled") & 1) != 0)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "secureTextEntry");
    v9 = v8;
    v10 = v8 ^ 1;

    p_m_typology_recorder = (uint64_t *)&self->m_typology_recorder;
    if ((self->m_typology_recorder.__ptr_ != 0) == v10)
      return;
    s_trace_logging_enabled = v10;
    if ((v9 & 1) == 0)
    {
      v12 = operator new(0x28uLL);
      v12[1] = 0;
      v12[2] = 0;
      *v12 = &off_1EA101258;
      v12[3] = &off_1EA105998;
      v12[4] = CFStringCreateMutable(0, 0);
      *(_QWORD *)&v23 = v12 + 3;
      *((_QWORD *)&v23 + 1) = v12;
      goto LABEL_13;
    }
  }
  else
  {

    p_m_typology_recorder = (uint64_t *)&self->m_typology_recorder;
    if (!self->m_typology_recorder.__ptr_)
      return;
    s_trace_logging_enabled = 0;
  }
  v23 = 0uLL;
LABEL_13:
  std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100]((uint64_t)p_m_typology_recorder, &v23);
  v13 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
  if (*((_QWORD *)&v23 + 1))
  {
    v14 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  m_impl = self->m_impl;
  v17 = *p_m_typology_recorder;
  v18 = (std::__shared_weak_count *)p_m_typology_recorder[1];
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v20 = __ldxr(p_shared_owners);
    while (__stxr(v20 + 1, p_shared_owners));
    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](m_impl + 71, v17, (uint64_t)v18);
    v21 = (unint64_t *)&v18->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  else
  {
    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](m_impl + 71, v17, 0);
  }
}

- (TIKeyboardInputManagerConfig)config
{
  return self->_config;
}

uint64_t __48__TIKeyboardInputManager_mul_resourceInputModes__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)dynamicResourcePath
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager config](self, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicResourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  return 0;
}

- (BOOL)shouldUpdateDictionary
{
  _QWORD *m_impl;
  uint64_t v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v8;
  unint64_t v9;
  const char *v10;
  const char *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  m_impl = self->m_impl;
  if (m_impl)
  {
    v4 = m_impl[28];
    v5 = !v4
      || **(_QWORD **)(v4 + 8) == *(_QWORD *)(*(_QWORD *)(v4 + 8) + 8)
      || -[TIKeyboardInputManager linguisticResourceStatus](self, "linguisticResourceStatus") == 2;
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        v9 = -[TIKeyboardInputManager linguisticResourceStatus](self, "linguisticResourceStatus");
        if (v9 > 2)
          v10 = "Unknown";
        else
          v10 = off_1EA101280[v9];
        v11 = "False";
        if (v5)
          v11 = "True";
        objc_msgSend(v8, "stringWithFormat:", CFSTR("%s linguisticResourceStatus: %s, result: %s"), "-[TIKeyboardInputManager shouldUpdateDictionary]", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)keyboardConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[TIKeyboardInputManager refreshInputManagerState](self, "refreshInputManagerState");
  v3 = objc_alloc_init(MEMORY[0x1E0DBDBF0]);
  -[TIKeyboardInputManager currentState](self, "currentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInputManagerState:", v4);

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inputForMarkedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TIKeyboardInputManager markedText](self, "markedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIntermediateText:", v7);

  }
  -[TIKeyboardInputManager keyboardConfigurationLayoutTag](self, "keyboardConfigurationLayoutTag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutTag:", v8);

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accentKeyStringForKeyboardState:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccentKeyString:", v11);

  -[TIKeyboardInputManager contextualDisplayKeys](self, "contextualDisplayKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContextualDisplayKeys:", v12);

  objc_msgSend(v3, "setAssertDefaultKeyPlane:", -[TIKeyboardInputManager keyboardConfigurationAssertDefaultKeyPlane](self, "keyboardConfigurationAssertDefaultKeyPlane"));
  -[TIKeyboardInputManager trialParameters](self, "trialParameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTrialParameters:", v13);

  return v3;
}

- (id)keyboardConfigurationLayoutTag
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardLayoutState softwareLayout](self->_layoutState, "softwareLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager layoutTagsForLayout:](self, "layoutTagsForLayout:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v5)
    {
      v6 = v5;
      v23 = v4;
      v7 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v26 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v9, "allKeys", v23);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "firstObject");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "documentState");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "contextBeforeInput");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = objc_msgSend(v15, "length");
          v17 = objc_msgSend(v15, "length");
          if (objc_msgSend(v15, "length"))
          {
            if (v16 <= 0xA)
              v18 = v17;
            else
              v18 = 10;
            if (v16 <= 0xA)
              v19 = 0;
            else
              v19 = v17 - 10;
            v20 = objc_msgSend(v15, "rangeOfCharacterFromSet:options:range:", v12, 4, v19, v18);
          }
          else
          {
            v21 = 0;
            v20 = 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v20 != 0x7FFFFFFFFFFFFFFFLL && v20 + v21 == objc_msgSend(v15, "length"))
          {

            goto LABEL_23;
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v6)
          continue;
        break;
      }
      v11 = CFSTR("Default");
LABEL_23:
      v4 = v23;
    }
    else
    {
      v11 = CFSTR("Default");
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)layoutTagsForLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *cachedLayoutTags;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  TIKeyboardInputManager *v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedLayoutTags, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layoutTags");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v9, "count"))
        goto LABEL_14;
      v25 = self;
      v26 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = v9;
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Tag"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)MEMORY[0x1E0CB3500];
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("FollowingCharactersInSet"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "characterSetWithCharactersInString:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, v16);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v20);

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v12);
      }

      self = v25;
      v4 = v26;
      if (!v10)
LABEL_14:
        v10 = (void *)MEMORY[0x1E0C9AA60];
      cachedLayoutTags = self->_cachedLayoutTags;
      if (!cachedLayoutTags)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v22 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v23 = self->_cachedLayoutTags;
        self->_cachedLayoutTags = v22;

        cachedLayoutTags = self->_cachedLayoutTags;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](cachedLayoutTags, "setObject:forKeyedSubscript:", v10, v4);
      v6 = v10;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)keyboardConfigurationAssertDefaultKeyPlane
{
  return 0;
}

- (void)scheduleLinguisticResourceUpdateWithReason:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[TIKeyboardInputManager isLinguisticResourceUpdateScheduled](self, "isLinguisticResourceUpdateScheduled"))
    -[TIKeyboardInputManager setLinguisticResourceStatus:reason:](self, "setLinguisticResourceStatus:reason:", 1, v4);

}

- (BOOL)isLinguisticResourceUpdateScheduled
{
  unint64_t v3;

  v3 = -[TIKeyboardInputManager linguisticResourceStatus](self, "linguisticResourceStatus");
  if (v3 != 1)
    LOBYTE(v3) = -[TIKeyboardInputManager linguisticResourceStatus](self, "linguisticResourceStatus") == 2;
  return v3;
}

- (unint64_t)linguisticResourceStatus
{
  return self->_linguisticResourceStatus;
}

- (void)setLinguisticResourceStatus:(unint64_t)a3 reason:(id)a4
{
  __CFString *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  const char *v10;
  const char *v11;
  const __CFString *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a4;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = -[TIKeyboardInputManager linguisticResourceStatus](self, "linguisticResourceStatus");
      if (v9 > 2)
        v10 = "Unknown";
      else
        v10 = off_1EA101280[v9];
      if (a3 > 2)
        v11 = "Unknown";
      else
        v11 = off_1EA101280[a3];
      v12 = CFSTR("None");
      if (v6)
        v12 = v6;
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s linguisticResourceStatus: %s -> %s (%@)"), "-[TIKeyboardInputManager setLinguisticResourceStatus:reason:]", v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v13;
      _os_log_debug_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  self->_linguisticResourceStatus = a3;

}

- (id)configurationPropertyList
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager config](self, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertyList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateDictionaryAndLanguageModel
{
  void *m_impl;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  TIKBAnalyticsMetricsContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TIKBAnalyticsMetricsContext *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int *v16;
  _BYTE v17[8];
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (-[TIKeyboardInputManager shouldUpdateDictionary](self, "shouldUpdateDictionary"))
    -[TIKeyboardInputManager loadDictionaries](self, "loadDictionaries");
  -[TIKeyboardInputManager updateInlineCompletionOperatingPointForPrimaryLocale](self, "updateInlineCompletionOperatingPointForPrimaryLocale");
  if (-[TIKeyboardInputManager shouldUpdateLanguageModel](self, "shouldUpdateLanguageModel")
    && -[TIKeyboardInputManager updateLanguageModelForKeyboardState](self, "updateLanguageModelForKeyboardState"))
  {
    -[TIKeyboardInputManager loadFavoniusTypingModel](self, "loadFavoniusTypingModel");
    -[TIKeyboardInputManager logTestingParametersToTypology](self, "logTestingParametersToTypology");
  }
  -[TIKeyboardInputManager updateTrialNegativeLearningFlagForPrimaryLocale](self, "updateTrialNegativeLearningFlagForPrimaryLocale");
  -[TIKeyboardInputManager updateTrialFavoniusLanguagePowerForPrimaryLocale](self, "updateTrialFavoniusLanguagePowerForPrimaryLocale");
  -[TIKeyboardInputManager setLinguisticResourceStatus:reason:](self, "setLinguisticResourceStatus:reason:", 0, CFSTR("Dictionary and LM updated"));
  m_impl = self->m_impl;
  v4 = *((_QWORD *)m_impl + 29);
  if (v4)
  {
    v5 = (unsigned int *)*((_QWORD *)m_impl + 28);
    v16 = v5;
    if (v5)
    {
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 + 1, v5));
    }
    (*(void (**)(uint64_t, unsigned int **))(*(_QWORD *)v4 + 224))(v4, &v16);
    if (v16)
      WTF::RefCounted<KB::DictionaryContainer>::deref(v16);
    v7 = [TIKBAnalyticsMetricsContext alloc];
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeInputModes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager testingParameters](self, "testingParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TIKBAnalyticsMetricsContext initWithKeyboardState:activeInputModes:testingParameters:](v7, "initWithKeyboardState:activeInputModes:testingParameters:", v8, v10, v11);

    v13 = *((_QWORD *)self->m_impl + 29);
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager inlineCompletionMetadataFrom:andBundleId:](self, "inlineCompletionMetadataFrom:andBundleId:", v12, v15);
    (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v13 + 232))(v13, v17);
    if (v36 && v35 == 1)
      free(v36);
    if (v34 && v33 == 1)
      free(v34);
    if (v32 && v31 == 1)
      free(v32);
    if (v30 && v29 == 1)
      free(v30);
    if (v28 && v27 == 1)
      free(v28);
    if (v26 && v25 == 1)
      free(v26);
    if (v24 && v23 == 1)
      free(v24);
    if (v22 && v21 == 1)
      free(v22);
    if (v20 && v19 == 1)
      free(v20);
    if (v18)
    {
      if (v17[6] == 1)
        free(v18);
    }

  }
}

- (void)updateTrialFavoniusLanguagePowerForPrimaryLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD **m_impl;
  void (*v8)(void);
  void *v9;
  void *v10;
  _QWORD **v11;
  void *v12;
  void *v13;
  unsigned int v14;
  float v15;
  int v16;
  const char *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "favoniusLanguagePowerOverrideForLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "floatValue");
      v16 = 136315394;
      v17 = "-[TIKeyboardInputManager updateTrialFavoniusLanguagePowerForPrimaryLocale]";
      v18 = 2048;
      v19 = v15;
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Trial: Updating favonius language power to: %f", (uint8_t *)&v16, 0x16u);
    }
    m_impl = (_QWORD **)self->m_impl;
    objc_msgSend(v6, "floatValue");
    v8 = *(void (**)(void))(*m_impl[23] + 496);
  }
  else
  {
    -[TIKeyboardInputManager config](self, "config");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "favoniusLanguageModelWeight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (_QWORD **)self->m_impl;
    if (v10)
    {
      -[TIKeyboardInputManager config](self, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "favoniusLanguageModelWeight");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "floatValue");
      (*(void (**)(_QWORD *, uint64_t))(*v11[23] + 496))(v11[23], v14 | 0x100000000);

      goto LABEL_8;
    }
    v8 = *(void (**)(void))(*v11[23] + 496);
  }
  v8();
LABEL_8:

}

- (void)updateTrialNegativeLearningFlagForPrimaryLocale
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (TI_IS_INTERNAL_INSTALL::is_internal_install
    || (-[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "activeInputModes"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v3,
        v5 < 2))
  {
    +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "isNegativeLearningEnabledForLocale:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      TIOverrideAdaptationAutocorrectionRejectionV2Trial(objc_msgSend(v8, "BOOLValue"));
    else
      TIRestoreAdaptationAutocorrectionRejectionV2Trial();

  }
  else
  {
    TIRestoreAdaptationAutocorrectionRejectionV2Trial();
  }
}

- (void)updateInlineCompletionOperatingPointForPrimaryLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inlineCompletionOperatingPointOverrideForLocale:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6
    || (v7 = -[TIKeyboardInputManager precisionPointFromTrialOverride:](self, "precisionPointFromTrialOverride:", v6),
        v7 == -1))
  {
    if (byte_1F0283360)
      byte_1F0283360 = 0;
  }
  else
  {
    v8 = v7;
    inline_completion_precision_point_override = v7;
    byte_1F0283360 = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v9 = 136315394;
      v10 = "-[TIKeyboardInputManager(InlineCompletions) updateInlineCompletionOperatingPointForPrimaryLocale]";
      v11 = 1024;
      v12 = v8;
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Trial: overriding inline completion precision  operating point to %i percent", (uint8_t *)&v9, 0x12u);
    }
  }

}

- (BOOL)shouldUpdateLanguageModel
{
  void *v3;
  BOOL v4;
  unsigned int v5;
  uint64_t v6;

  if (!self->m_impl)
    return 0;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "secureTextEntry") & 1) == 0)
  {
    v5 = TI_DEVICE_UNLOCKED_SINCE_BOOT();

    if (v5)
    {
      v6 = *((_QWORD *)self->m_impl + 28);
      if (v6)
      {
        if (**(_QWORD **)(v6 + 8) != *(_QWORD *)(*(_QWORD *)(v6 + 8) + 8))
        {
          -[TIKeyboardState textInputTraits](self->_keyboardState, "textInputTraits");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v3, "autocorrectionType") != 1;
          goto LABEL_4;
        }
      }
    }
    return 0;
  }
  v4 = 0;
LABEL_4:

  return v4;
}

- (void)resume
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  TIInputManagerOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "normalizedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s Resume (inputMode=%@)"), "-[TIKeyboardInputManager resume]", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAssertionForObject:", self);

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager;
  -[TIKeyboardInputManagerBase resume](&v9, sel_resume);
  -[TIKeyboardInputManager scheduleLinguisticResourceUpdateWithReason:](self, "scheduleLinguisticResourceUpdateWithReason:", CFSTR("Input manager resumed"));
}

- (void)syncInputStringToKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if (-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
  {
    -[TIKeyboardInputManager syncMarkedTextForKeyboardState:afterContextChange:](self, "syncMarkedTextForKeyboardState:afterContextChange:", v7, v4);
  }
  else if (v4 || !self->_didInitialSync)
  {
    self->_lastHitTestKeycode = -1;
    objc_msgSend(v7, "documentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager setInputStringFromDocumentState:isDeleteEvent:](self, "setInputStringFromDocumentState:isDeleteEvent:", v6, 0);

  }
}

- (void)suspend
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  int v13;
  void *v14;
  void *v15;
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
  int v26;
  TIKeyboardInputManagerState *currentState;
  _QWORD *m_impl;
  uint64_t v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  TIKeyboardLayout *keyLayout;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  TIInputManagerOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "normalizedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s Suspend (inputMode=%@)"), "-[TIKeyboardInputManager suspend]", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v7;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  -[TIKeyboardInputManager logTestingParametersToTypology](self, "logTestingParametersToTypology");
  -[TIKeyboardInputManager config](self, "config");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "disableAnalytics") & 1) == 0)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layoutState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_7;
    v12 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)self->m_impl + 23) + 456))(*((_QWORD *)self->m_impl + 23));
    -[TIKeyboardInputManager config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "usesContinuousPath");
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticsReportCPStats(v12, v13, v16);

  }
LABEL_7:
  -[TIKeyboardInputManager willChangeToKeyboardState:afterContextChange:](self, "willChangeToKeyboardState:afterContextChange:", 0, 1);
  -[TIKeyboardInputManager recentAutocorrections](self, "recentAutocorrections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "removeAllObjects");

  -[TIKeyboardInputManager recentPredictiveInputSelections](self, "recentPredictiveInputSelections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAllObjects");

  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "acceptCurrentSentence");

  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "syncToDocumentState:", 0);

  -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "flushBuffer");

  -[TIKeyboardInputManager clearInput](self, "clearInput");
  -[TIKeyboardInputManager setDeleteKeyCount:](self, "setDeleteKeyCount:", 0);
  -[TIKeyboardInputManager rejectedAutocorrectionsDisplayedOrInserted](self, "rejectedAutocorrectionsDisplayedOrInserted");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeAllObjects");

  -[TIKeyboardInputManager rejectedAutocorrectionsDisplayedOrInsertedInverse](self, "rejectedAutocorrectionsDisplayedOrInsertedInverse");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeAllObjects");

  -[TIKeyboardInputManager autocorrectionForCurrentStem](self, "autocorrectionForCurrentStem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAllObjects");

  std::unique_ptr<TI::RejectionsDatabase>::reset[abi:nn180100]((TI::RejectionsDatabase **)&self->m_rejectionsDatabase, 0);
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "secureTextEntry");

  if (v26)
  {
    currentState = self->_currentState;
    self->_currentState = 0;

  }
  -[TIKeyboardInputManager setKeyboardState:](self, "setKeyboardState:", 0);
  m_impl = self->m_impl;
  if (m_impl)
  {
    v29 = m_impl[28];
    if (v29)
      KB::DynamicDictionary::unload_user_dictionary(*(KB::DynamicDictionary **)(v29 + 24));
  }
  -[TIKeyboardInputManager resetLMCache:](self, "resetLMCache:", 0);
  -[TIKeyboardInputManager stickerCandidateGenerator](self, "stickerCandidateGenerator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "clearCache");

  v31 = self->m_impl;
  if (v31)
  {
    v32 = v31[23];
    if (v32)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 120))(v32);
  }
  -[TIKeyboardInputManager releaseMRLBuffers](self, "releaseMRLBuffers");
  -[TIKeyboardInputManager setProactiveSuggestionsGenerationBlock:](self, "setProactiveSuggestionsGenerationBlock:", 0);
  v39.receiver = self;
  v39.super_class = (Class)TIKeyboardInputManager;
  -[TIKeyboardInputManagerBase suspend](&v39, sel_suspend);
  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "removeAssertionForObject:", self);

  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "reset");

  +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "reset");

  if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
  {
    -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "resetInteractionObserversForNextSession");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager endTypingSessionWithInteractionObservers:](self, "endTypingSessionWithInteractionObservers:", v37);
  }
  keyLayout = self->_keyLayout;
  self->_keyLayout = 0;

  -[TIKeyboardInputManager setRejectedConversionsForCurrentContinuousPath:](self, "setRejectedConversionsForCurrentContinuousPath:", 0);
}

- (BOOL)canComputeSentenceContextForInputStem:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (v6 = objc_msgSend(v4, "length"),
        -[TIKeyboardInputManager revisionHistory](self, "revisionHistory"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "selectedRange"),
        v7,
        v6 <= v8))
  {
    if (objc_msgSend(v4, "length"))
    {
      -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "selectedRange");
      v12 = v11 - objc_msgSend(v4, "length");
      v13 = objc_msgSend(v4, "length");

      -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "rangeOfString:options:range:", v4, 2, v12, v13);
      v18 = v17;

      v9 = v12 == v16 && v13 == v18;
    }
    else
    {
      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (LanguageModelContext)sentenceContextForInputStem:(SEL)a3 inputContext:(id)a4
{
  id v8;
  id v9;
  TIContextTokens *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  KB::String *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  BOOL v22;
  _BYTE *v23;
  _BYTE *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  TIContextTokens *v30;
  TITokenID v31;
  int v32;
  unint64_t v33;
  id v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  TITokenID v38;
  TITokenID v39;
  LanguageModelContext *result;
  id v41;
  void *v42;
  void *__p[2];
  char v44;
  void *v45;
  _BYTE *v46;
  _QWORD v47[4];
  id v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  __n128 (*v59)(__n128 *, __n128 *);
  void (*v60)(uint64_t);
  const char *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  char v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (-[TIKeyboardInputManager canComputeSentenceContextForInputStem:](self, "canComputeSentenceContextForInputStem:", v8))
  {
    v42 = v9;
    v10 = objc_alloc_init(TIContextTokens);
    v11 = -[TIContextTokens lmContext](v10, "lmContext");
    v56 = 0;
    v57 = &v56;
    v58 = 0x4812000000;
    v59 = __Block_byref_object_copy__246;
    v60 = __Block_byref_object_dispose__247;
    v61 = "";
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v52 = 0;
    v53 = &v52;
    v54 = 0x2020000000;
    v55 = 1;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "selectedRange");
    v15 = v14 - objc_msgSend(v8, "length");

    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __67__TIKeyboardInputManager_sentenceContextForInputStem_inputContext___block_invoke;
    v47[3] = &unk_1EA100F10;
    v50 = &v56;
    v51 = v15;
    v49 = &v52;
    v17 = v12;
    v48 = v17;
    objc_msgSend(v16, "enumerateSentenceStemUsingBlock:", v47);

    v18 = (KB::String *)std::vector<TITokenID>::vector(&v45, (uint64_t)(v57 + 6));
    if (v45 != v46)
    {
      v19 = v46 - 8;
      if (v46 - 8 > v45)
      {
        v20 = (char *)v45 + 8;
        do
        {
          v21 = *((_QWORD *)v20 - 1);
          *((_QWORD *)v20 - 1) = *(_QWORD *)v19;
          *(_QWORD *)v19 = v21;
          v19 -= 8;
          v22 = v20 >= v19;
          v20 += 8;
        }
        while (!v22);
      }
    }
    if (*((_BYTE *)v53 + 24))
    {
      v24 = v45;
      v23 = v46;
      v41 = v8;
      if (v45 == v46)
      {
        std::string::basic_string[abi:nn180100]<0>(&v65, "");
        KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, 0x100000000uLL, (uint64_t)&v65, 0);
        if (v67 < 0)
          operator delete(v65);
        v24 = v45;
        v23 = v46;
      }
      v25 = v23 - v24;
      if ((unint64_t)(v25 >> 3) >= 0x40)
        v26 = (v25 >> 3) - 64;
      else
        v26 = 0;
      if (v26 < v25 >> 3)
      {
        do
        {
          objc_msgSend(v17, "objectAtIndex:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (!*((_DWORD *)v45 + 2 * v26 + 1))
          {
            v28 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)(v11 + 8));
            if (v29)
            {
              if (*(_DWORD *)(v28 + 32 * v29 - 8) == 1)
                v30 = v10;
              else
                v30 = 0;
            }
            else
            {
              v30 = 0;
            }
            v31 = -[TIKeyboardInputManager findTokenIDForWord:contextTokens:tokenLookupMode:](self, "findTokenIDForWord:contextTokens:tokenLookupMode:", v27, v30, 5);
            *((TITokenID *)v45 + v26) = v31;
          }
          v32 = !-[TIKeyboardInputManager shouldAllowContextWord:](self, "shouldAllowContextWord:", v27);
          v33 = *((_QWORD *)v45 + v26);
          v34 = objc_retainAutorelease(v27);
          std::string::basic_string[abi:nn180100]<0>(&v65, (char *)objc_msgSend(v34, "UTF8String"));
          KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, v33, (uint64_t)&v65, v32);
          if (v67 < 0)
            operator delete(v65);

          ++v26;
        }
        while (v26 < (v46 - (_BYTE *)v45) >> 3);
      }
      v35 = v11[3] - v11[2];
      v8 = v41;
      if (v35)
      {
        v36 = v11[3];
        v37 = (unint64_t)*(unsigned int *)(v36 - 4) << 32;
        if (v37 == 0x600000000)
        {
          std::string::basic_string[abi:nn180100]<0>(__p, "");
          KB::LanguageModelContext::debug_string_for_token(0x200000000, (uint64_t)__p, (KB::String *)&v65);
          v39 = (TITokenID)0x200000000;
          KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, v39, (const KB::String *)&v65, 0);
          if (v66 && BYTE6(v65) == 1)
            free(v66);
          if (v44 < 0)
            operator delete(__p[0]);
          std::string::basic_string[abi:nn180100]<0>(&v65, "");
          KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, 0x100000000uLL, (uint64_t)&v65, 0);
          if (v67 < 0)
            operator delete(v65);
        }
        else if (v37 == 0x200000000)
        {
          if (v35 >= 9 && *(_DWORD *)(v36 - 12) == 6
            || (v18 = (KB::String *)objc_msgSend(v42, "hasSuffix:", CFSTR("\n")), (_DWORD)v18))
          {
            KB::String::empty_string(v18);
            v38 = (TITokenID)0x100000000;
            KB::LanguageModelContext::append((KB::LanguageModelContext *)v11, v38, (const KB::String *)&KB::String::empty_string(void)::empty_string, 0);
          }
          else
          {
            KB::LanguageModelContext::pop_back(v11);
          }
        }
      }
      -[TIKeyboardInputManager fillReversedConversationHistoryInContext:](self, "fillReversedConversationHistoryInContext:", v10);
    }
    KB::LanguageModelContext::LanguageModelContext((KB::LanguageModelContext *)retstr, (const KB::LanguageModelContext *)v11);
    if (v45)
    {
      v46 = v45;
      operator delete(v45);
    }

    _Block_object_dispose(&v52, 8);
    _Block_object_dispose(&v56, 8);
    if (v62)
    {
      v63 = v62;
      operator delete(v62);
    }

    v9 = v42;
  }
  else
  {
    retstr->var7.var2.var0 = 0;
    *(_OWORD *)&retstr->var7.var0 = 0u;
    *(_OWORD *)&retstr->var1.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->var3 = 0u;
    retstr->var0 = 0u;
    *(_OWORD *)&retstr->var1.__begin_ = 0u;
    *(_OWORD *)&retstr->var5.var0.var0.var0 = 0u;
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&retstr->var5);
    language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&retstr->var6);
    retstr->var7.var0 = 0;
    retstr->var7.var1 = 0;
    retstr->var7.var2.var0 = 0;
  }

  return result;
}

- (TIRevisionHistory)revisionHistory
{
  return self->_revisionHistory;
}

- (void)setInputStringFromDocumentState:(id)a3 isDeleteEvent:(BOOL)a4
{
  -[TIKeyboardInputManager setInputStringFromDocumentState:isDeleteEvent:didDeleteLastAcceptedPath:](self, "setInputStringFromDocumentState:isDeleteEvent:didDeleteLastAcceptedPath:", a3, a4, 0);
}

- (BOOL)shouldExtendPriorWord
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldExtendPriorWord");

  return v3;
}

- (void)updateInputContext
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  const __CFString *v10;
  char *m_impl;
  KB *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  void *__p;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  _BYTE v25[8];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->m_impl)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "documentState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextBeforeInput");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = &stru_1EA1081D0;
    if (v5)
      v7 = (__CFString *)v5;
    v8 = v7;

    -[TIKeyboardInputManager inputStem](self, "inputStem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
    {
      if (-[__CFString hasSuffix:](v8, "hasSuffix:", v9))
      {
        -[__CFString substringToIndex:](v8, "substringToIndex:", -[__CFString length](v8, "length") - objc_msgSend(v9, "length"));
        v10 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = &stru_1EA1081D0;
      }

      v8 = (__CFString *)v10;
    }
    m_impl = (char *)self->m_impl;
    if (m_impl)
    {
      -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v8);
      v12 = (KB *)objc_claimAutoreleasedReturnValue();
      KB::utf8_string(v12, (uint64_t)v25);
      -[TIKeyboardInputManager sentenceContextForInputStem:inputContext:](self, "sentenceContextForInputStem:inputContext:", v9, v8);
      KB::String::operator=((KB::String *)(m_impl + 400), (KB::String *)v25);
      KB::LanguageModelContext::operator=((uint64_t)(m_impl + 432), &v17);
      v24 = (void **)&v23;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v24);
      language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v22);
      language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v21);
      if (__p)
      {
        v20 = __p;
        operator delete(__p);
      }
      v13 = v18;
      if (v18)
      {
        p_shared_owners = (unint64_t *)&v18->__shared_owners_;
        do
          v15 = __ldaxr(p_shared_owners);
        while (__stlxr(v15 - 1, p_shared_owners));
        if (!v15)
        {
          ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
          std::__shared_weak_count::__release_weak(v13);
        }
      }
      if (v26)
        v16 = v25[6] == 1;
      else
        v16 = 0;
      if (v16)
        free(v26);

    }
    -[TIKeyboardInputManager setAutoshiftFromInputContext](self, "setAutoshiftFromInputContext");

  }
}

- (void)setAutoshiftFromInputContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  int v9;

  if (self->m_impl)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "autocapitalizationType");

    if (v4)
    {
      if (v4 == 2)
      {
        -[TIKeyboardInputManager inputContext](self, "inputContext");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v4) = -[TIKeyboardInputManager canStartSentenceAfterString:](self, "canStartSentenceAfterString:", v5);

      }
      else
      {
        LODWORD(v4) = 1;
      }
    }
    v6 = *((_QWORD *)self->m_impl + 1);
    if (-858993459 * ((unint64_t)(*((_QWORD *)self->m_impl + 2) - v6) >> 3))
    {
      v7 = *(_DWORD *)(v6 + 32);
      v8 = v7 & 0xFFFFFFFD;
      if ((v7 & v4) != 0)
        v9 = 2;
      else
        v9 = 0;
      *(_DWORD *)(v6 + 32) = v9 | v8;
    }
  }
}

- (BOOL)canStartSentenceAfterString:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;

  v4 = a3;
  v5 = 0;
  if (v4 && self->m_impl)
  {
    -[TIKeyboardInputManager autoshiftRegexLoader](self, "autoshiftRegexLoader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_4;
    -[TIKeyboardInputManager sentenceDelimitingCharacters](self, "sentenceDelimitingCharacters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager sentenceTrailingCharacters](self, "sentenceTrailingCharacters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager sentencePrefixingCharacters](self, "sentencePrefixingCharacters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIAutoshiftRegularExpressionLoader loaderWithSentenceDelimiters:trailingChars:prefixChars:](TIAutoshiftRegularExpressionLoader, "loaderWithSentenceDelimiters:trailingChars:prefixChars:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager setAutoshiftRegexLoader:](self, "setAutoshiftRegexLoader:", v10);

    if (!objc_msgSend(v4, "length"))
      goto LABEL_7;
    if (!objc_msgSend(v4, "hasSuffix:", CFSTR("\n")))
    {
LABEL_4:
      v5 = -[TIKeyboardInputManager _canStartSentenceAfterString:maxRecursionDepth:](self, "_canStartSentenceAfterString:maxRecursionDepth:", v4, 2);
    }
    else
    {
LABEL_7:
      -[TIKeyboardInputManager config](self, "config");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isTesting");

      if ((v12 & 1) == 0)
      {
        -[TIKeyboardInputManager autoshiftRegexLoader](self, "autoshiftRegexLoader");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "startBackgroundLoad");

      }
      v5 = 1;
    }
  }

  return v5;
}

- (TIAutoshiftRegularExpressionLoader)autoshiftRegexLoader
{
  return self->_autoshiftRegexLoader;
}

- (BOOL)_canStartSentenceAfterString:(id)a3 maxRecursionDepth:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  KB *v18;
  const KB::String *v19;
  int v20;
  uint64_t v21;
  void *v22;
  _BYTE v24[8];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TIKeyboardInputManager autoshiftRegexLoader](self, "autoshiftRegexLoader");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "regex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    goto LABEL_6;
  v11 = 1;
  v12 = objc_msgSend(v9, "rangeAtIndex:", 1);
  if (v13)
  {
    v14 = v12;
    v15 = v12 + v13;
    v16 = v12 + v13 - 1;
    if (objc_msgSend(v6, "characterAtIndex:", v16) != 46)
      goto LABEL_8;
    if (v16 && objc_msgSend(v6, "characterAtIndex:", v15 - 2) == 46)
    {
LABEL_6:
      v11 = 0;
      goto LABEL_16;
    }
    if (v16 == v14)
    {
LABEL_8:
      v11 = 1;
      goto LABEL_16;
    }
    objc_msgSend(v6, "substringWithRange:", v14, v16 - v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v17);
    v18 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v18, (uint64_t)v24);

    v20 = KB::string_capitalization((KB *)v24, v19);
    v21 = 0;
    if (a4 && v20 == 1)
    {
      objc_msgSend(v6, "substringToIndex:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[TIKeyboardInputManager _canStartSentenceAfterString:maxRecursionDepth:](self, "_canStartSentenceAfterString:maxRecursionDepth:", v22, a4 - 1);

    }
    v11 = TIInputManager::period_ends_sentence_after_word((TIInputManager *)self->m_impl, (const KB::String *)v24, v21);
    if (v25 && v24[6] == 1)
      free(v25);

  }
LABEL_16:

  return v11;
}

- (_NSRange)inputStringRangeFromRevisionHistory
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  __n128 (*v23)(__n128 *, __n128 *);
  uint64_t (*v24)();
  const char *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  __n128 (*v30)(__n128 *, __n128 *);
  uint64_t (*v31)();
  const char *v32;
  __int128 v33;
  _NSRange result;

  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selectedRange");
  v6 = v5;

  v27 = 0;
  v28 = &v27;
  v29 = 0x4012000000;
  v30 = __Block_byref_object_copy__237;
  v31 = __Block_byref_object_dispose__238;
  v32 = "";
  v33 = xmmword_1DA910F40;
  v20 = 0;
  v21 = &v20;
  v22 = 0x4012000000;
  v23 = __Block_byref_object_copy__237;
  v24 = __Block_byref_object_dispose__238;
  v25 = "";
  v26 = xmmword_1DA910F40;
  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__TIKeyboardInputManager_inputStringRangeFromRevisionHistory__block_invoke;
  v19[3] = &unk_1EA100E48;
  v19[6] = v4;
  v19[7] = v6;
  v19[4] = &v20;
  v19[5] = &v27;
  objc_msgSend(v7, "enumerateSentenceStemUsingBlock:", v19);

  v8 = v28[6];
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v21[6];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = 0;
    }
    else
    {
      v9 = -[TIKeyboardInputManager legacyInputRangeForTokenRange:](self, "legacyInputRangeForTokenRange:", v10, v21[7]);
      v11 = v16;
    }
  }
  else
  {
    v12 = v28[7];
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TIKeyboardInputManager acceptableRangeFromRange:inText:withSelectionLocation:](self, "acceptableRangeFromRange:inText:withSelectionLocation:", v8, v12, v14, v4);
    v11 = v15;

  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v27, 8);
  v17 = v9;
  v18 = v11;
  result.length = v18;
  result.location = v17;
  return result;
}

- (id)inputStem
{
  void *m_impl;
  const KB::String *v4;
  void *v5;
  void *v6;
  _BYTE v8[8];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  m_impl = self->m_impl;
  if (m_impl)
  {
    TIInputManager::input_substring((unsigned __int16 *)m_impl + 4, 0, *((_DWORD *)m_impl + 24), (uint64_t)v8);
    KB::ns_string((KB *)v8, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && v8[6] == 1)
      free(v9);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)fillReversedConversationHistoryInContext:(id)a3
{
  uint64_t **v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  RecentMessage *end;
  const KB::LanguageModelContext *v16;
  KB::LanguageModelContext *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  id v34;
  __int128 v35;

  v34 = a3;
  v4 = (uint64_t **)objc_msgSend(v34, "lmContext");
  v5 = *((_QWORD *)self->m_impl + 29);
  if (v5)
  {
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v5 + 160))(v5))
    {
      v6 = (unint64_t)v4[6];
      if (v6 <= 2 && (unint64_t)((char *)v4[3] - (char *)v4[2]) <= 0x1FF)
      {
        v7 = *v4;
        if (!*v4)
        {
          v8 = operator new(0x30uLL);
          v8[1] = 0;
          v8[2] = 0;
          *v8 = &off_1EA1011B8;
          v8[4] = 0;
          v8[5] = 0;
          *((_QWORD *)&v35 + 1) = v8;
          v8[3] = 0;
          *(_QWORD *)&v35 = v8 + 3;
          std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100]((uint64_t)v4, &v35);
          v9 = (std::__shared_weak_count *)*((_QWORD *)&v35 + 1);
          if (*((_QWORD *)&v35 + 1))
          {
            v10 = (unint64_t *)(*((_QWORD *)&v35 + 1) + 8);
            do
              v11 = __ldaxr(v10);
            while (__stlxr(v11 - 1, v10));
            if (!v11)
            {
              ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
              std::__shared_weak_count::__release_weak(v9);
            }
          }
          v7 = *v4;
        }
        v12 = (std::__shared_weak_count *)v4[1];
        if (v12)
        {
          p_shared_owners = (unint64_t *)&v12->__shared_owners_;
          do
            v14 = __ldxr(p_shared_owners);
          while (__stxr(v14 + 1, p_shared_owners));
        }
        v33 = v12;
        end = self->conversation_history.__end_;
        do
        {
          if (end == self->conversation_history.__begin_)
            break;
          v16 = (const KB::LanguageModelContext *)*((_QWORD *)end - 2);
          if (!v16)
          {
            -[TIKeyboardInputManager parseRecentMessage:](self, "parseRecentMessage:", (char *)end - 48);
            v16 = (const KB::LanguageModelContext *)*((_QWORD *)end - 2);
            if (!v16)
              continue;
          }
          v17 = (KB::LanguageModelContext *)v7[1];
          v18 = v7[2];
          if ((unint64_t)v17 >= v18)
          {
            v20 = 0x4EC4EC4EC4EC4EC5 * (((uint64_t)v17 - *v7) >> 3);
            v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) > 0x276276276276276)
              abort();
            v22 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v18 - *v7) >> 3);
            if (2 * v22 > v21)
              v21 = 2 * v22;
            if (v22 >= 0x13B13B13B13B13BLL)
              v23 = 0x276276276276276;
            else
              v23 = v21;
            if (v23)
            {
              v25 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LanguageModelContext>>(v23);
            }
            else
            {
              v25 = 0;
              v24 = 0;
            }
            v26 = &v25[104 * v24];
            v27 = (uint64_t)KB::LanguageModelContext::LanguageModelContext((KB::LanguageModelContext *)&v25[104 * v20], v16);
            v19 = (char *)(v27 + 104);
            v29 = (char *)*v7;
            v28 = (char *)v7[1];
            if (v28 == (char *)*v7)
            {
              *v7 = v27;
              v7[1] = (uint64_t)v19;
              v7[2] = (uint64_t)v26;
            }
            else
            {
              do
              {
                v28 -= 104;
                v27 = KB::LanguageModelContext::LanguageModelContext(v27 - 104, (uint64_t)v28);
              }
              while (v28 != v29);
              v30 = (char *)*v7;
              v28 = (char *)v7[1];
              *v7 = v27;
              v7[1] = (uint64_t)v19;
              v7[2] = (uint64_t)v26;
              if (v28 != v30)
              {
                do
                {
                  v28 -= 104;
                  std::__destroy_at[abi:nn180100]<KB::LanguageModelContext,0>((uint64_t)v28);
                }
                while (v28 != v30);
                v28 = v30;
              }
            }
            if (v28)
              operator delete(v28);
          }
          else
          {
            v19 = (char *)KB::LanguageModelContext::LanguageModelContext(v17, v16) + 104;
          }
          v7[1] = (uint64_t)v19;
          v6 += *((int *)end - 2);
          end = (RecentMessage *)((char *)end - 48);
        }
        while (v6 < 3);
        if (v33)
        {
          v31 = (unint64_t *)&v33->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
            std::__shared_weak_count::__release_weak(v33);
          }
        }
      }
    }
  }

}

- (id)externalStringToInternal:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "externalStringToInternal:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clearInput
{
  NSMutableString *m_composedText;
  const KB::String *v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE v8[8];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->m_impl)
  {
    -[TIKeyboardInputManager checkAutocorrectionDictionaries](self, "checkAutocorrectionDictionaries");
    TIInputManager::clear_input((TIInputManager *)self->m_impl);
    m_composedText = self->m_composedText;
    if (m_composedText)
    {
      TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->m_impl + 2) - *((_QWORD *)self->m_impl + 1)) >> 3), (uint64_t)v8);
      KB::ns_string((KB *)v8, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString setString:](m_composedText, "setString:", v6);

      if (v9)
      {
        if (v8[6] == 1)
          free(v9);
      }
    }
    -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    -[TIKeyboardInputManager setHitTestCorrectedInputMatchingCandidate:](self, "setHitTestCorrectedInputMatchingCandidate:", 0);
    -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", 0);
    self->_lastHitTestKeycode = -1;
    -[TIKeyboardInputManager setLastAutocorrectionList:](self, "setLastAutocorrectionList:", 0);
  }
}

- (void)setLastAutocorrectionList:(id)a3
{
  objc_storeStrong((id *)&self->_lastAutocorrectionList, a3);
}

- (void)setLastAcceptedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (void)setHitTestCorrectedInputMatchingCandidate:(id)a3
{
  objc_storeStrong((id *)&self->_hitTestCorrectedInputMatchingCandidate, a3);
}

- (void)checkAutocorrectionDictionaries
{
  uint64_t v3;

  v3 = *((_QWORD *)self->m_impl + 28);
  if (!v3 || **(_QWORD **)(v3 + 8) == *(_QWORD *)(*(_QWORD *)(v3 + 8) + 8))
  {
    -[TIKeyboardInputManager scheduleLinguisticResourceUpdateWithReason:](self, "scheduleLinguisticResourceUpdateWithReason:", CFSTR("Dictionary not loaded"));
    if (-[TIKeyboardInputManager isLinguisticResourceUpdateScheduled](self, "isLinguisticResourceUpdateScheduled"))
      -[TIKeyboardInputManager updateDictionaryAndLanguageModel](self, "updateDictionaryAndLanguageModel");
  }
}

- (void)changingContextWithTrigger:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
  {
    -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "changingContextWithTrigger:", v5);

  }
}

- (BOOL)shouldMonitorTypingSession
{
  return self->_typingSessionMonitor != 0;
}

- (TITypingSessionMonitor)typingSessionMonitor
{
  return self->_typingSessionMonitor;
}

- (TILRUDictionary)autocorrectionListsSuggestedForCurrentInput
{
  return self->_autocorrectionListsSuggestedForCurrentInput;
}

- (id)inputContext
{
  void *v3;
  void *v4;

  KB::ns_string((KB *)((char *)self->m_impl + 400), (const KB::String *)a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)resetLMCache:(int)a3
{
  uint64_t v3;
  _QWORD *m_impl;
  uint64_t v6;
  LanguageModel *ptr;
  _QWORD *v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  m_impl = self->m_impl;
  if (m_impl)
  {
    v6 = m_impl[29];
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v6 + 120))(v6, *(_QWORD *)&a3);
  }
  ptr = self->m_lightweight_language_model.__ptr_;
  if (ptr)
  {
    if ((*(unsigned int (**)(LanguageModel *, SEL))(*(_QWORD *)ptr + 16))(ptr, a2))
    {
      (*(void (**)(LanguageModel *, uint64_t))(*(_QWORD *)self->m_lightweight_language_model.__ptr_ + 120))(self->m_lightweight_language_model.__ptr_, v3);
      v8 = self->m_impl;
      if (v8)
      {
        v9 = v8[29];
        if (v9)
        {
          if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v9 + 16))(v9))
            std::shared_ptr<KB::LanguageModel>::reset[abi:nn180100](&self->m_lightweight_language_model.__ptr_);
        }
      }
    }
  }
}

- (void)prepareForKeyboardInactivity:(int)a3
{
  uint64_t v3;
  LanguageModel *ptr;

  v3 = *(_QWORD *)&a3;
  ptr = self->m_lightweight_language_model.__ptr_;
  if (ptr && (*(unsigned int (**)(LanguageModel *, SEL))(*(_QWORD *)ptr + 16))(ptr, a2))
    (*(void (**)(LanguageModel *))(*(_QWORD *)self->m_lightweight_language_model.__ptr_ + 192))(self->m_lightweight_language_model.__ptr_);
  -[TIKeyboardInputManager resetLMCache:](self, "resetLMCache:", v3);
}

void __65__TIKeyboardInputManager_mul_updateLanguageModelForKeyboardState__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_string:matchesString:", v4, v6) & 1) == 0)
  {

    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a1[5];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recipientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "_string:matchesString:", v8, v10);

  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "languageSelectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdaptationContext:", v13);
LABEL_5:

  }
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

- (id)languageModelAssetsForInputMode:(id)a3
{
  id v3;
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isSiriMode");
    v6 = CFSTR("LanguageModel");
    if (v5)
      v6 = CFSTR("SiriLanguageModel");
    v7 = v6;
    objc_msgSend(v4, "preferredModelLocaleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIInputMode inputModeWithIdentifier:isSiriMode:](TIInputMode, "inputModeWithIdentifier:isSiriMode:", v8, objc_msgSend(v4, "isSiriMode"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ddsAssetContentItemsWithContentType:inputMode:filteredWithRegion:", v7, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    TIAssetsOSLogFacility();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Language model asset content items for %@: %@"), "-[TIKeyboardInputManager languageModelAssetsForInputMode:]", v4, v11);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v29;
      _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    TIAssetsOSLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "normalizedIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v11, "count");
      objc_msgSend(v11, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%s Language model asset count and path for %@: (%lu, %@)"), "-[TIKeyboardInputManager languageModelAssetsForInputMode:]", v15, v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v36 = v19;
      _os_log_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v11;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v31 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "path");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "path");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v23);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v20;
}

void __67__TIKeyboardInputManager_TestingSupport__fetchTypingSessionParams___block_invoke(_QWORD *a1, uint64_t a2)
{
  TITypingSessionParams *v3;

  v3 = -[TITypingSessionParams initWithActiveInputModes:wordSeparator:testingParameters:assetAvailabilityStatus:]([TITypingSessionParams alloc], "initWithActiveInputModes:wordSeparator:testingParameters:assetAvailabilityStatus:", a1[4], a1[5], a1[6], a2);
  (*(void (**)(void))(a1[7] + 16))();

}

void __67__TIKeyboardInputManager_endTypingSessionWithInteractionObservers___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "typingSessionMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endSessionWithInteractionObservers:sessionParams:timestamp:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v4);

    objc_msgSend(v7, "counterChangeCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyboardDidSuspendForDate:", v4);

  }
}

void __67__TIKeyboardInputManager_endTypingSessionWithInteractionObservers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  TIDispatchAsync();

  objc_destroyWeak(&v6);
}

uint64_t __101__TIKeyboardInputManager_TestingSupport__fetchAssetAvailabilityStatusForInputMode_completionHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  if (*(_QWORD *)(result + 32))
  {
    v2 = result;
    objc_msgSend(a2, "count");
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

- (void)fetchTypingSessionParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeInputModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager testingParameters](self, "testingParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__TIKeyboardInputManager_TestingSupport__fetchTypingSessionParams___block_invoke;
  v14[3] = &unk_1EA101168;
  v15 = v6;
  v16 = v7;
  v17 = v8;
  v18 = v4;
  v10 = v4;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  -[TIKeyboardInputManager fetchAssetAvailabilityStatusForInputMode:completionHandler:](self, "fetchAssetAvailabilityStatusForInputMode:completionHandler:", v9, v14);

}

- (void)fetchAssetAvailabilityStatusForInputMode:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = a3;
  +[TIAssetManager sharedAssetManager](TIAssetManager, "sharedAssetManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __101__TIKeyboardInputManager_TestingSupport__fetchAssetAvailabilityStatusForInputMode_completionHandler___block_invoke;
  v9[3] = &unk_1EA100B90;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "ddsAssetsForInputMode:cachedOnly:completion:", v6, 0, v9);

}

- (id)wordSeparator
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wordSeparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (TIStickerCandidateGenerator)stickerCandidateGenerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (TI_DEVICE_UNLOCKED_SINCE_BOOT()
    && -[TIKeyboardInputManager isStickerSuggestionsEnabled](self, "isStickerSuggestionsEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageWithRegion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_os_feature_enabled_impl() & 1) != 0
      || objc_msgSend(v4, "hasPrefix:", CFSTR("en"))
      && objc_msgSend(v6, "hasPrefix:", CFSTR("en")))
    {
      +[TIStickerCandidateGenerator sharedInstance](TIStickerCandidateGenerator, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return (TIStickerCandidateGenerator *)v7;
}

- (void)setProactiveSuggestionsGenerationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void)setDeleteKeyCount:(int64_t)a3
{
  self->_deleteKeyCount = a3;
}

- (TILRUDictionary)rejectedAutocorrectionsDisplayedOrInserted
{
  return self->_rejectedAutocorrectionsDisplayedOrInserted;
}

- (TILRUDictionary)rejectedAutocorrectionsDisplayedOrInsertedInverse
{
  return self->_rejectedAutocorrectionsDisplayedOrInsertedInverse;
}

- (TILRUDictionary)recentPredictiveInputSelections
{
  return self->_recentPredictiveInputSelections;
}

- (TILRUDictionary)recentAutocorrections
{
  return self->_recentAutocorrections;
}

- (void)logTestingParametersToTypology
{
  void *v3;
  id v4;

  if (self->m_typology_recorder.__ptr_)
  {
    -[TIKeyboardInputManager testingParameters](self, "testingParameters");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LM trial param: %@"), v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v3);

  }
}

- (BOOL)isStickerSuggestionsEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTesting"))
  {
    -[TIKeyboardInputManager config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "stickerSuggestionsEnabled");

  }
  else
  {
    v5 = 1;
  }

  return _os_feature_enabled_impl() & v5;
}

- (void)endTypingSessionWithInteractionObservers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__TIKeyboardInputManager_endTypingSessionWithInteractionObservers___block_invoke;
  v6[3] = &unk_1EA100B28;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  -[TIKeyboardInputManager fetchTypingSessionParams:](self, "fetchTypingSessionParams:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (TICounterChangeCache)counterChangeCache
{
  return self->_counterChangeCache;
}

- (TILRUDictionary)autocorrectionForCurrentStem
{
  return self->_autocorrectionForCurrentStem;
}

uint64_t __50__TIKeyboardInputManager_mul_updateLanguagePriors__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  float v5;
  float v6;
  unsigned int v7;
  KB::StaticDictionary *v8;
  uint64_t v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "weightForInputMode:", v4);
  v6 = v5;
  v7 = objc_msgSend(*(id *)(a1 + 32), "lexiconIDForInputMode:", v4);

  v8 = *(KB::StaticDictionary **)(a1 + 40);
  v9 = KB::StaticDictionary::lexicon_index(v8, v7);
  if (v9 != -1)
    *(float *)(*((_QWORD *)v8 + 3) + 4 * v9) = v6;
  return KB::LanguageModelContainer::set_lexicon_prior_probability(*(KB::LanguageModelContainer **)(a1 + 48), v7, v6);
}

void __65__TIKeyboardInputManager_mul_updateLanguageModelForKeyboardState__block_invoke_53(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t *v11;
  uint64_t *v12;
  unint64_t v13;
  char *v14;
  void *__p[2];
  unsigned __int8 v16;
  unsigned int v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "weightForInputMode:", v4);
  v6 = v5;
  objc_msgSend(v4, "preferredModelLocaleIdentifier");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v7, "UTF8String"));

  objc_msgSend(v4, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localeIdentifier");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v9, "UTF8String"));

  v11 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
  if ((v16 & 0x80u) == 0)
    v12 = (uint64_t *)__p;
  else
    v12 = (uint64_t *)__p[0];
  if ((v16 & 0x80u) == 0)
    v13 = v16;
  else
    v13 = (unint64_t)__p[1];
  std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v12, v13);
  v14 = std::__hash_table<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,KB::LanguageModelLexiconGroup>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v11, (uint64_t)__p, (uint64_t)__p);
  v17 = v10;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,float>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,float>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,float>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,float>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t)(v14 + 56), v10, &v17)+ 5) = v6;

  if ((char)v16 < 0)
    operator delete(__p[0]);
}

void __193__TIKeyboardInputManager_mul_modelLoaderForModelLocaleMapping_customResourcePaths_dynamicResourcePath_usesLinguisticContext_isMultiLingualModeEnabled_validEnglishTransformerMultilingualConfig___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  objc_msgSend(a2, "preferredModelLocaleIdentifier");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodedLMTrialParametersForLocale:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "languageModelAssetsForInputMode:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredModelLocaleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "preferredModelLocaleIsMultilingual");
    v12 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    HIDWORD(v16) = *(unsigned __int8 *)(a1 + 72);
    LOWORD(v7) = *(_WORD *)(a1 + 73);
    objc_msgSend(*(id *)(a1 + 48), "inputMode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_msgSend(v13, "isSiriMode");
    LOBYTE(v16) = objc_msgSend(v5, "doesSupportInlineCompletion");
    BYTE2(v15) = (_BYTE)v6;
    LOWORD(v15) = (_WORD)v7;
    +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v9, v10, v12, v11, v17, HIDWORD(v16), v15, v8, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v14, v18);
  }

}

void __59__TIKeyboardInputManager_mul_modelLocaleToInputModeMapping__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "preferredModelLocaleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v7 = v6;

  objc_msgSend(v7, "addObject:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

}

void __68__TIKeyboardInputManager_mul_listOfModelLocalesFromActiveInputModes__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "preferredModelLocaleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __54__TIKeyboardInputManager_mul_lexiconInformationVector__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  _BOOL4 v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  void *v23[2];
  __int128 v24;
  void *v25[2];
  __int128 v26;
  void *v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)a1[4];
  if (v4)
  {
    objc_msgSend(v4, "lexiconInfoForInputMode:", v3);
    v4 = (void *)a1[4];
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
    *(_OWORD *)v27 = 0u;
    v28 = 0u;
    *(_OWORD *)v25 = 0u;
    v26 = 0u;
    *(_OWORD *)v23 = 0u;
    v24 = 0u;
  }
  objc_msgSend(v4, "weightForInputMode:", v3);
  DWORD2(v33) = v5;
  v6 = *(uint64_t **)(a1[5] + 8);
  v7 = v6[7];
  v8 = v6[8];
  if (v7 >= v8)
  {
    v10 = v6[6];
    v11 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v7 - v10) >> 4);
    if ((unint64_t)(v11 + 1) > 0x1745D1745D1745DLL)
      abort();
    v12 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v8 - v10) >> 4);
    v13 = 2 * v12;
    if (2 * v12 <= v11 + 1)
      v13 = v11 + 1;
    if (v12 >= 0xBA2E8BA2E8BA2ELL)
      v14 = 0x1745D1745D1745DLL;
    else
      v14 = v13;
    v22 = v6 + 8;
    if (v14)
      v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v14);
    else
      v15 = 0;
    v18 = v14;
    v19 = v14 + 176 * v11;
    v21 = v14 + 176 * v15;
    std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>(v19, (uint64_t)v23);
    v20 = v19 + 176;
    std::vector<KB::LexiconInfo>::__swap_out_circular_buffer(v6 + 6, &v18);
    v9 = v6[7];
    std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)&v18);
  }
  else
  {
    v9 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>(v7, (uint64_t)v23)
       + 176;
  }
  v6[7] = v9;
  objc_msgSend(v3, "languageWithRegion");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = TIMultilingualDynamicModelEnabled((char *)objc_msgSend(v16, "UTF8String"));

  if (v17)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  if (*((_QWORD *)&v31 + 1) && BYTE6(v31) == 1)
    free(*((void **)&v31 + 1));
  if (*((_QWORD *)&v29 + 1) && BYTE6(v29) == 1)
    free(*((void **)&v29 + 1));
  if (v27[1] && BYTE6(v27[0]) == 1)
    free(v27[1]);
  if (v25[1] && BYTE6(v25[0]) == 1)
    free(v25[1]);
  if (v23[1] && BYTE6(v23[0]) == 1)
    free(v23[1]);

}

void __51__TIKeyboardInputManager_mul_keyLayoutDidChangeTo___block_invoke(uint64_t a1, uint64_t a2, __int16 a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  void *v13;
  void *v14;
  uint64_t v15;
  TIInputManager *v16;
  _BYTE v17[8];
  void *v18;
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", a2, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "isShifted"))
  {
    objc_msgSend(v14, "uppercaseString");
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v15;
  }
  if (v14)
  {
    v16 = *(TIInputManager **)(*(_QWORD *)(a1 + 48) + 40);
    KB::utf8_string((KB *)v14, (uint64_t)v17);
    v20.origin.x = a4;
    v20.origin.y = a5;
    v20.size.width = a6;
    v20.size.height = a7;
    TIInputManager::register_key_area(v16, (_LXLexicon *)v17, v20, a3);
    if (v18)
    {
      if (v17[6] == 1)
        free(v18);
    }
  }

}

BOOL __64__TIKeyboardInputManager_mul_stringIsRecognizedByAlternativeIM___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "lexiconLocale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

BOOL __82__TIKeyboardInputManager_mul_shouldPassAlternativeInputAsPrediction_isRecognized___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "lexiconLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __82__TIKeyboardInputManager_mul_candidateArray_withCandidateUniquelyInsertedToFront___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4) ^ 1;

  return v5;
}

id __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v5, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      objc_msgSend(v5, "lexiconLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = *(id *)(a1 + 32);

        v6 = v8;
      }
    }
    objc_msgSend(v5, "candidateByReplacingWithCandidate:input:rawInput:", v6, *(_QWORD *)(a1 + 32), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[TIKeyboardInputManager_mul updateAutocorrectionListGivenOutdatedInput:andUpdatedInput:]_block_invoke";
      _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Received a candidate that could not be replaced but has to.", (uint8_t *)&v11, 0xCu);
    }
    v9 = v5;
  }

  return v9;
}

void __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_22(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_2(uint64_t a1)
{
  id v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

uint64_t __89__TIKeyboardInputManager_mul_updateAutocorrectionListGivenOutdatedInput_andUpdatedInput___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

_QWORD *__53__TIKeyboardInputManager_mul_getBetterLexiconLocale___block_invoke(_QWORD *result, void *a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (!*(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40))
  {
    v2 = result;
    v3 = (void *)result[4];
    v4 = (void *)result[5];
    v5 = a2;
    objc_msgSend(v4, "candidate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lexiconLocaleOfString:inputMode:", v6, v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(v2[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    return (_QWORD *)objc_msgSend((id)v2[5], "setLexiconLocale:", *(_QWORD *)(*(_QWORD *)(v2[6] + 8) + 40));
  }
  return result;
}

- (TIKeyboardInputManager)initWithInputMode:(id)a3 keyboardState:(id)a4
{
  id v6;
  void *v7;
  TIKeyboardInputManager *v8;

  v6 = a4;
  +[TIKeyboardInputManagerConfig configurationForInputMode:](TIKeyboardInputManagerConfig, "configurationForInputMode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIKeyboardInputManager initWithConfig:keyboardState:](self, "initWithConfig:keyboardState:", v7, v6);

  return v8;
}

- (TIKeyboardInputManager)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  TILRUDictionary *v17;
  void *v18;
  TILRUDictionary *v19;
  void *v20;
  TILRUDictionary *v21;
  void *v22;
  TILRUDictionary *v23;
  void *v24;
  TILRUDictionary *v25;
  void *v26;
  TILRUDictionary *v27;
  void *v28;
  TILRUDictionary *v29;
  void *v30;
  TILRUDictionary *v31;
  void *v32;
  TILRUDictionary *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  char v41;
  uint64_t v42;
  unsigned int *v43;
  unsigned int v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  int v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  KB *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  int v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  unsigned int v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  TIFilterParameterLoader *v106;
  void *v107;
  void *v108;
  int v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  TIRevisionHistory *v116;
  void *v117;
  id v118;
  void *v119;
  TITextCheckerExemptions *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  TICounterChangeCache *v126;
  void *v127;
  void *v128;
  char v129;
  TITypingSessionMonitor *v130;
  void *v131;
  void *v132;
  void *v133;
  TISmartSelector *v134;
  void *v135;
  void *v136;
  void *v137;
  NSObject *v138;
  void *v139;
  void *v140;
  void *v141;
  id v143;
  id v144;
  _QWORD v145[4];
  id v146;
  id location;
  _QWORD v148[4];
  id v149;
  unsigned int *v150;
  objc_super v151;
  __int128 buf;
  char v153;
  char v154;
  uint64_t v155;

  v155 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "inputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v151.receiver = self;
  v151.super_class = (Class)TIKeyboardInputManager;
  v10 = -[TIKeyboardInputManagerBase initWithInputMode:keyboardState:](&v151, sel_initWithInputMode_keyboardState_, v9, v8);

  if (v10)
  {
    v143 = v8;
    v144 = v7;
    objc_msgSend(v10, "setKeyboardState:", v8);
    +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAssertionForObject:", v10);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_dynamicDictionariesRemoved_, CFSTR("TIKeyboardInputManagerDynamicDictionariesRemovedNotification"), 0);

    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "secureCandidateRenderer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "languageWithRegion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLocaleIdentifier:", v16);

    objc_storeStrong((id *)v10 + 38, a3);
    v17 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 200);
    v18 = (void *)*((_QWORD *)v10 + 40);
    *((_QWORD *)v10 + 40) = v17;

    v19 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 12);
    v20 = (void *)*((_QWORD *)v10 + 41);
    *((_QWORD *)v10 + 41) = v19;

    v21 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 12);
    v22 = (void *)*((_QWORD *)v10 + 42);
    *((_QWORD *)v10 + 42) = v21;

    v23 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 20);
    v24 = (void *)*((_QWORD *)v10 + 63);
    *((_QWORD *)v10 + 63) = v23;

    v25 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 20);
    v26 = (void *)*((_QWORD *)v10 + 64);
    *((_QWORD *)v10 + 64) = v25;

    v27 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 20);
    v28 = (void *)*((_QWORD *)v10 + 62);
    *((_QWORD *)v10 + 62) = v27;

    v29 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 20);
    v30 = (void *)*((_QWORD *)v10 + 43);
    *((_QWORD *)v10 + 43) = v29;

    v31 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 20);
    v32 = (void *)*((_QWORD *)v10 + 44);
    *((_QWORD *)v10 + 44) = v31;

    v33 = -[TILRUDictionary initWithMaximumCapacity:]([TILRUDictionary alloc], "initWithMaximumCapacity:", 20);
    v34 = (void *)*((_QWORD *)v10 + 45);
    *((_QWORD *)v10 + 45) = v33;

    *((_BYTE *)v10 + 281) = 0;
    *((_QWORD *)v10 + 5) = objc_msgSend(v10, "initImplementation");
    objc_msgSend(v10, "config");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -INFINITY;
    if (objc_msgSend(v35, "isTesting"))
      v37 = -INFINITY;
    else
      v37 = 0.01;

    objc_msgSend(v10, "config");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v38, "isTesting"))
      v36 = 0.015;

    v39 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "allowsSpaceCorrections");
    v42 = operator new();
    *(_DWORD *)(v42 + 8) = 1;
    *(_QWORD *)v42 = &off_1EA101DE0;
    *(_BYTE *)(v42 + 12) = v41;
    *(_OWORD *)(v42 + 16) = xmmword_1DA911030;
    *(double *)(v42 + 32) = v37;
    *(double *)(v42 + 40) = v36;
    v150 = (unsigned int *)v42;
    TIInputManager::set_search_algorithm(v39, &v150);
    if (v150)
    {
      v43 = v150 + 2;
      v44 = atomic_load(v150 + 2);
      if (v44 == 1)
      {
        (*(void (**)(void))(*(_QWORD *)v150 + 16))();
      }
      else
      {
        do
          v45 = __ldaxr(v43);
        while (__stlxr(v45 - 1, v43));
      }
    }

    v46 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "usesTextChecker");
    *(_BYTE *)(v46 + 686) = v48;
    if (v48)
      v49 = _text_checker(1);

    v50 = *((_QWORD *)v10 + 5);
    *(_BYTE *)(v50 + 688) = objc_msgSend(v10, "usesCandidateSelection");
    v51 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v51 + 682) = objc_msgSend(v52, "usesRetrocorrection");

    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(*((_QWORD *)v10 + 5) + 184) + 296))(*(_QWORD *)(*((_QWORD *)v10 + 5) + 184), objc_msgSend(v10, "usesContinuousPath"));
    v53 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v53 + 184) + 304))(*(_QWORD *)(v53 + 184), objc_msgSend(v54, "usesETSRescoring"));

    v55 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v55 + 184) + 328))(*(_QWORD *)(v55 + 184), objc_msgSend(v56, "usesContinuousPathProgressiveCandidates"));

    v57 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v57 + 184) + 336))(*(_QWORD *)(v57 + 184), objc_msgSend(v58, "continuousPathCompletesWords"));

    v59 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v59 + 184) + 344))(*(_QWORD *)(v59 + 184), objc_msgSend(v60, "continuousPathDetectPause"));

    v61 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "continuousPathLanguageWeight");
    (*(void (**)(_QWORD))(**(_QWORD **)(v61 + 184) + 360))(*(_QWORD *)(v61 + 184));
    v62 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v62 + 184) + 376))(*(_QWORD *)(v62 + 184), objc_msgSend(v63, "continuousPathEnabledAlgorithms"));

    v64 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v64 + 689) = objc_msgSend(v65, "completionsShouldSharePrefix");

    v66 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "usesStemSuffixCorrectionFactor");
    v69 = *(_QWORD *)(v66 + 184);
    if (v69)
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v69 + 440))(v69, v68);

    v70 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "shapeStoreResourceDir");
    v72 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v72, (uint64_t)&buf);
    v73 = *(_QWORD *)(v70 + 184);
    if (v73)
      (*(void (**)(uint64_t, __int128 *))(*(_QWORD *)v73 + 464))(v73, &buf);
    if (*((_QWORD *)&buf + 1) && BYTE6(buf) == 1)
      free(*((void **)&buf + 1));

    v74 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "cpConfidenceModelType");
    *(_OWORD *)(v74 + 144) = xmmword_1DA910FE0;
    *(_DWORD *)(v74 + 160) = 1028443341;
    *(_DWORD *)(v74 + 164) = v76;
    *(_DWORD *)(v74 + 168) = 3;

    v77 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "continuousPathParams");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, void *))(**(_QWORD **)(v77 + 184) + 400))(*(_QWORD *)(v77 + 184), v79);

    v80 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "continuousPathEnsembleSourceWeights");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, void *))(**(_QWORD **)(v80 + 184) + 408))(*(_QWORD *)(v80 + 184), v82);

    v83 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "continuousPathEnsembleSourceScales");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, void *))(**(_QWORD **)(v83 + 184) + 416))(*(_QWORD *)(v83 + 184), v85);

    v86 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(v86 + 691) = objc_msgSend(v87, "skipCandidateQualityFilter");

    v88 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_msgSend(v89, "isTesting");
    *(_BYTE *)(v88 + 690) = v90;
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v88 + 184) + 264))(*(_QWORD *)(v88 + 184), v90);

    v91 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v91 + 184) + 272))(*(_QWORD *)(v91 + 184), objc_msgSend(v92, "skipLanguageLayoutCheckCPML"));

    v93 = *((_QWORD *)v10 + 5);
    objc_msgSend(v10, "config");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = objc_msgSend(v94, "cpCandidatesCount");
    if (v95 >= 1)
      *(_DWORD *)(v93 + 704) = v95;

    objc_msgSend(v10, "config");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "favoniusLanguageModelWeight");
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v97)
    {
      v98 = *((_QWORD *)v10 + 5);
      objc_msgSend(v10, "config");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "favoniusLanguageModelWeight");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "floatValue");
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(v98 + 184) + 496))(*(_QWORD *)(v98 + 184), v101 | 0x100000000);

    }
    objc_msgSend(v10, "config");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "mlttBundleURL");
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    if (v103)
    {
      v104 = *((_QWORD *)v10 + 5);
      objc_msgSend(v103, "absoluteString");
      v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      std::string::basic_string[abi:nn180100]<0>(&buf, (char *)objc_msgSend(v105, "UTF8String"));
      v154 = 1;
      (*(void (**)(_QWORD, __int128 *))(**(_QWORD **)(v104 + 184) + 424))(*(_QWORD *)(v104 + 184), &buf);
      if (v154 && v153 < 0)
        operator delete((void *)buf);

    }
    v106 = objc_alloc_init(TIFilterParameterLoader);
    v107 = (void *)*((_QWORD *)v10 + 58);
    *((_QWORD *)v10 + 58) = v106;

    objc_msgSend(v10, "config");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "isTesting");

    v110 = (void *)*((_QWORD *)v10 + 58);
    objc_msgSend(v10, "inputMode");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "normalizedIdentifier");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = MEMORY[0x1E0C809B0];
    if (v109)
    {
      objc_msgSend(v110, "loadCandidateFilterSpecificationForLanguageIdentifier:", v112);
      v114 = (void *)objc_claimAutoreleasedReturnValue();

      if (v114)
        TIInputManager::set_filter_specification_overrides(*((TIInputManager **)v10 + 5), v114);
    }
    else
    {
      v148[0] = MEMORY[0x1E0C809B0];
      v148[1] = 3221225472;
      v148[2] = __55__TIKeyboardInputManager_initWithConfig_keyboardState___block_invoke;
      v148[3] = &unk_1EA100A38;
      v149 = v10;
      objc_msgSend(v110, "loadCandidateFilterSpecificationForLanguageIdentifier:targetQueue:completion:", v112, MEMORY[0x1E0C80D38], v148);

      v114 = v149;
    }

    objc_msgSend(v10, "scheduleLinguisticResourceUpdateWithReason:", CFSTR("Input manager initialized"));
    if (objc_msgSend(v10, "isLinguisticResourceUpdateScheduled"))
      objc_msgSend(v10, "updateDictionaryAndLanguageModel");
    if ((objc_msgSend(v10, "usesCandidateSelection") & 1) == 0)
    {
      v115 = *((_QWORD *)v10 + 5);
      if (v115)
      {
        if (*(_QWORD *)(v115 + 136))
        {
          v116 = -[TIRevisionHistory initWithLocale:]([TIRevisionHistory alloc], "initWithLocale:", *(_QWORD *)(*((_QWORD *)v10 + 5) + 136));
          v117 = (void *)*((_QWORD *)v10 + 39);
          *((_QWORD *)v10 + 39) = v116;

          objc_msgSend(*((id *)v10 + 39), "setDelegate:", v10);
          objc_msgSend(*((id *)v10 + 39), "setRecentAutocorrections:", *((_QWORD *)v10 + 41));
          objc_msgSend(*((id *)v10 + 39), "setAutocorrectionHistory:", *((_QWORD *)v10 + 40));
        }
      }
    }
    if (objc_msgSend(v10, "doesComposeText"))
    {
      v118 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v119 = (void *)*((_QWORD *)v10 + 6);
      *((_QWORD *)v10 + 6) = v118;

    }
    *((_QWORD *)v10 + 7) = 0x7FFFFFFFFFFFFFFFLL;
    v120 = objc_alloc_init(TITextCheckerExemptions);
    v121 = (void *)*((_QWORD *)v10 + 47);
    *((_QWORD *)v10 + 47) = v120;

    *((_QWORD *)v10 + 59) = -1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "addObserver:selector:name:object:", v10, sel_mobileAssetsChanged_, CFSTR("TIAssetsDidChangeNotification"), 0);

    +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v10);
    v145[0] = v113;
    v145[1] = 3221225472;
    v145[2] = __55__TIKeyboardInputManager_initWithConfig_keyboardState___block_invoke_2;
    v145[3] = &unk_1EA100A68;
    objc_copyWeak(&v146, &location);
    objc_msgSend(v123, "setUpdateCallback:", v145);
    objc_msgSend(v123, "start");
    *((_QWORD *)v10 + 49) = 0;
    +[TIEventDescriptorRegistry registry](TIEventDescriptorRegistry, "registry");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIMetricDescriptorRegistry registry](TIMetricDescriptorRegistry, "registry");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = -[TICounterChangeCache initWithEventDescriptorRegistry:metricDescriptorRegistry:]([TICounterChangeCache alloc], "initWithEventDescriptorRegistry:metricDescriptorRegistry:", v124, v125);
    v127 = (void *)*((_QWORD *)v10 + 53);
    *((_QWORD *)v10 + 53) = v126;

    objc_msgSend(v10, "config");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "disableAnalytics");

    if ((v129 & 1) == 0)
    {
      v130 = -[TITypingSessionMonitor initWithConfig:metricDescriptorRegistry:]([TITypingSessionMonitor alloc], "initWithConfig:metricDescriptorRegistry:", v144, v125);
      v131 = (void *)*((_QWORD *)v10 + 52);
      *((_QWORD *)v10 + 52) = v130;

    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "languageCode");
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    v134 = -[TISmartSelector initWithOptions:language:dataChangedHandler:]([TISmartSelector alloc], "initWithOptions:language:dataChangedHandler:", 447, v133, 0);
    v135 = (void *)*((_QWORD *)v10 + 54);
    *((_QWORD *)v10 + 54) = v134;

    if (TIGetSkipStickersSuggestionGatingValue(void)::onceToken != -1)
      dispatch_once(&TIGetSkipStickersSuggestionGatingValue(void)::onceToken, &__block_literal_global_1170);
    objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "valueForPreferenceKey:", CFSTR("SkipStickersSuggestionGating"));
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    *((_BYTE *)v10 + 256) = objc_msgSend(v137, "BOOLValue");
    TIInputManagerOSLogFacility();
    v138 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
    {
      v139 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v10, "inputMode");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "stringWithFormat:", CFSTR("%s Creating input manager for %@"), "-[TIKeyboardInputManager initWithConfig:keyboardState:]", v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v141;
      _os_log_impl(&dword_1DA6F2000, v138, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&buf, 0xCu);

    }
    objc_destroyWeak(&v146);
    objc_destroyWeak(&location);

    v8 = v143;
    v7 = v144;
  }

  return (TIKeyboardInputManager *)v10;
}

- (TIKeyboardInputManager)initWithConfig:(id)a3 keyboardState:(id)a4 languageSelectionController:(id)a5
{
  id v9;
  id v10;
  id v11;
  TIKeyboardInputManager *v12;

  objc_storeStrong((id *)&self->_languageSelectionController, a5);
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[TIKeyboardInputManager initWithConfig:keyboardState:](self, "initWithConfig:keyboardState:", v11, v10);

  -[TILanguageSelectionController setDelegate:](v12->_languageSelectionController, "setDelegate:", v12);
  return v12;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  TITypingSessionMonitor *typingSessionMonitor;
  void *m_impl;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[TICounterChangeCache close](self->_counterChangeCache, "close");
  TIInputManagerOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s Removing input manager for %@"), "-[TIKeyboardInputManager dealloc]", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  typingSessionMonitor = self->_typingSessionMonitor;
  if (typingSessionMonitor)
    -[TITypingSessionMonitor tearDown](typingSessionMonitor, "tearDown");
  -[TILanguageSelectionController setDelegate:](self->_languageSelectionController, "setDelegate:", 0);
  -[TITextCheckerExemptions setAssertsObservers:](self->_textCheckerExemptions, "setAssertsObservers:", 0);
  m_impl = self->m_impl;
  if (m_impl)
  {
    (*(void (**)(void *))(*(_QWORD *)m_impl + 8))(m_impl);
    self->m_impl = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:", self);

  -[TIRevisionHistory setDelegate:](self->_revisionHistory, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObserver:", self);

  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "close");

  -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManager;
  -[TIKeyboardInputManager dealloc](&v12, sel_dealloc);
}

- (id)newInputManagerState
{
  id v3;
  void *v4;
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

  v3 = objc_alloc_init(MEMORY[0x1E0DBDC10]);
  objc_msgSend(v3, "setCanHandleKeyHitTest:", -[TIKeyboardInputManager canHandleKeyHitTest](self, "canHandleKeyHitTest"));
  objc_msgSend(v3, "setIgnoresDeadKeys:", -[TIKeyboardInputManager ignoresDeadKeys](self, "ignoresDeadKeys"));
  objc_msgSend(v3, "setShouldExtendPriorWord:", -[TIKeyboardInputManager shouldExtendPriorWord](self, "shouldExtendPriorWord"));
  objc_msgSend(v3, "setSupportsReversionUI:", -[TIKeyboardInputManager supportsReversionUI](self, "supportsReversionUI"));
  objc_msgSend(v3, "setSuppliesCompletions:", -[TIKeyboardInputManager suppliesCompletions](self, "suppliesCompletions"));
  objc_msgSend(v3, "setSupportsSetPhraseBoundary:", -[TIKeyboardInputManager supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary"));
  objc_msgSend(v3, "setSuppressCompletionsForFieldEditor:", -[TIKeyboardInputManager suppressCompletionsForFieldEditor](self, "suppressCompletionsForFieldEditor"));
  objc_msgSend(v3, "setUsesAutoDeleteWord:", -[TIKeyboardInputManager usesAutoDeleteWord](self, "usesAutoDeleteWord"));
  objc_msgSend(v3, "setAutoquoteType:", -[TIKeyboardInputManager autoquoteType](self, "autoquoteType"));
  objc_msgSend(v3, "setUsesCandidateSelection:", -[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"));
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsesAutocorrectionLists:", objc_msgSend(v4, "autocorrectionListUIDisplayed"));

  objc_msgSend(v3, "setCommitsAcceptedCandidate:", -[TIKeyboardInputManager commitsAcceptedCandidate](self, "commitsAcceptedCandidate"));
  objc_msgSend(v3, "setNewInputAcceptsUserSelectedCandidate:", -[TIKeyboardInputManager newInputAcceptsUserSelectedCandidate](self, "newInputAcceptsUserSelectedCandidate"));
  objc_msgSend(v3, "setInitialCandidateBatchCount:", -[TIKeyboardInputManager initialCandidateBatchCount](self, "initialCandidateBatchCount"));
  -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWordSeparator:", v5);

  objc_msgSend(v3, "setShouldAddModifierSymbolsToWordCharacters:", -[TIKeyboardInputManager shouldAddModifierSymbolsToWordCharacters](self, "shouldAddModifierSymbolsToWordCharacters"));
  -[TIKeyboardInputManager wordCharacters](self, "wordCharacters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWordCharacters:", v6);

  -[TIKeyboardInputManager supplementalLexiconWordExtraCharacters](self, "supplementalLexiconWordExtraCharacters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSupplementalLexiconWordExtraCharacters:", v7);

  -[TIKeyboardInputManager terminatorsPreventingAutocorrection](self, "terminatorsPreventingAutocorrection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTerminatorsPreventingAutocorrection:", v8);

  -[TIKeyboardInputManager terminatorsDeletingAutospace](self, "terminatorsDeletingAutospace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTerminatorsDeletingAutospace:", v9);

  -[TIKeyboardInputManager keyboardBehaviors](self, "keyboardBehaviors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setKeyboardBehaviors:", v10);

  objc_msgSend(v3, "setUsesContinuousPath:", -[TIKeyboardInputManager usesContinuousPath](self, "usesContinuousPath"));
  -[TIKeyboardInputManager config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsesContinuousPathProgressiveCandidates:", objc_msgSend(v11, "usesContinuousPathProgressiveCandidates"));

  -[TIKeyboardInputManager config](self, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInsertsSpaceAfterPredictiveInput:", objc_msgSend(v12, "insertsSpaceAfterPredictiveInput"));

  -[TIKeyboardInputManager config](self, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIgnoreContinuousPathRequirements:", objc_msgSend(v13, "shouldIgnoreCPRequirements"));

  -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLearningFlagsMaskForLastAcceptedCandidate:", objc_msgSend(v15, "learningFlagsMask"));

  }
  else
  {
    objc_msgSend(v3, "setLearningFlagsMaskForLastAcceptedCandidate:", 0);
  }

  return v3;
}

- (TISmartPunctuationOptions)smartOptions
{
  TISmartPunctuationOptions *smartOptions;
  void *v4;
  void *v5;
  void *v6;
  TISmartPunctuationOptions *v7;
  TISmartPunctuationOptions *v8;

  smartOptions = self->_smartOptions;
  if (!smartOptions)
  {
    v4 = (void *)MEMORY[0x1E0DBDCD8];
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "smartPunctuationOptionsForLocale:", v6);
    v7 = (TISmartPunctuationOptions *)objc_claimAutoreleasedReturnValue();
    v8 = self->_smartOptions;
    self->_smartOptions = v7;

    smartOptions = self->_smartOptions;
  }
  return smartOptions;
}

- (BOOL)isStringBasedModel
{
  uint64_t v2;

  v2 = *((_QWORD *)self->m_impl + 29);
  if (v2)
    LOBYTE(v2) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 24))(v2);
  return v2;
}

- (void)scheduleLinguisticResourceUpdate
{
  -[TIKeyboardInputManager scheduleLinguisticResourceUpdateWithReason:](self, "scheduleLinguisticResourceUpdateWithReason:", CFSTR("None"));
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardInputManager closeCandidateGenerationContextWithResults:forced:](self, "closeCandidateGenerationContextWithResults:forced:", 0, 1);
  -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", v4);

  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "open");

}

- (void)pushCandidateGenerationContextWithResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputForMarkedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[TIKeyboardInputManager markedText](self, "markedText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setUncommittedText:", v7);

    }
    if (v17)
    {
      objc_msgSend(v17, "proactiveTriggers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager trackProactiveMetrics:keyboardState:](self, "trackProactiveMetrics:keyboardState:", v9, v10);

      v11 = objc_alloc(MEMORY[0x1E0DBDB48]);
      objc_msgSend(v17, "candidates");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithCandidates:", v12);

      -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "candidatesOffered:keyboardState:", v13, v15);

    }
    -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "pushCandidateResultSet:", v17);

  }
}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[TIKeyboardInputManager closeCandidateGenerationContextWithResults:forced:](self, "closeCandidateGenerationContextWithResults:forced:", v4, objc_msgSend(v5, "asynchronous") ^ 1);

  return (char)self;
}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;

  v4 = a4;
  -[TIKeyboardInputManager pushCandidateGenerationContextWithResults:](self, "pushCandidateGenerationContextWithResults:", a3);
  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v4 = 0;
  if (v4)
  {
    -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "close");

    -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
  }
  return v4;
}

- (void)pushCandidateGenerationContextOnStack
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TIKeyboardInputManager candidateHandlerForOpenRequestStack](self, "candidateHandlerForOpenRequestStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager setCandidateHandlerForOpenRequestStack:](self, "setCandidateHandlerForOpenRequestStack:", v4);

  }
  -[TIKeyboardInputManager candidateHandlerForOpenRequestStack](self, "candidateHandlerForOpenRequestStack");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
}

- (void)popCandidateGenerationContextFromStack
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
  -[TIKeyboardInputManager candidateHandlerForOpenRequestStack](self, "candidateHandlerForOpenRequestStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[TIKeyboardInputManager candidateHandlerForOpenRequestStack](self, "candidateHandlerForOpenRequestStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", v7);

    -[TIKeyboardInputManager candidateHandlerForOpenRequestStack](self, "candidateHandlerForOpenRequestStack");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeLastObject");

  }
}

- (id)usageTrackingKeyForStatistic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputMode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TIStatisticGetKeyForInputMode();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)incrementUsageTrackingKeyForAutocorrectionStatistic:(id)a3 autocorrectionTypes:(unsigned int)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[TIKeyboardInputManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "disableAnalytics");

  if ((v6 & 1) == 0)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inputMode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrementAutocorrectionKey();

  }
}

- (void)incrementUsageTrackingKey:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TIKeyboardInputManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableAnalytics");

  if ((v5 & 1) == 0)
  {
    -[TIKeyboardInputManager usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

  }
}

- (void)incrementUsageTrackingKeyForAppWithIsSentence:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  _QWORD *v8;
  _QWORD *v9;
  char v10;
  int v11;
  void *v12;
  id v13;

  v3 = a3;
  if (!-[TIKeyboardInputManager shouldSuppressTokenIDLookups](self, "shouldSuppressTokenIDLookups"))
  {
    -[TIKeyboardInputManager config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "disableAnalytics");

    if ((v6 & 1) == 0)
    {
      if (-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::onceToken != -1)
        dispatch_once(&-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::onceToken, &__block_literal_global_10512);
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientIdentifier");
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.MobileSMS")) & 1) != 0)
      {
        v8 = (_QWORD *)MEMORY[0x1E0DBE808];
        v9 = (_QWORD *)MEMORY[0x1E0DBE800];
      }
      else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
      {
        v8 = (_QWORD *)MEMORY[0x1E0DBE7F8];
        v9 = (_QWORD *)MEMORY[0x1E0DBE7F0];
      }
      else if ((objc_msgSend(v13, "hasPrefix:", CFSTR("com.apple")) & 1) != 0)
      {
        v8 = (_QWORD *)MEMORY[0x1E0DBE740];
        v9 = (_QWORD *)MEMORY[0x1E0DBE738];
      }
      else
      {
        v10 = objc_msgSend((id)-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::translationApps, "containsObject:", v13);
        v9 = (_QWORD *)MEMORY[0x1E0DBE838];
        if ((v10 & 1) != 0)
        {
          v8 = (_QWORD *)MEMORY[0x1E0DBE940];
        }
        else
        {
          v11 = objc_msgSend((id)-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::messagingApps, "containsObject:", v13);
          if (v11)
            v9 = (_QWORD *)MEMORY[0x1E0DBE928];
          v8 = (_QWORD *)MEMORY[0x1E0DBE840];
          if (v11)
            v8 = (_QWORD *)MEMORY[0x1E0DBE930];
        }
      }
      if (v3)
        v8 = v9;
      -[TIKeyboardInputManager usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", *v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

    }
  }
}

- (void)incrementUsageTrackingKeysForDeleteFromInput
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  int v20;
  id v21;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deletingBackwardsWillRemoveText");

  if (v5)
  {
    -[TIKeyboardInputManager usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", *MEMORY[0x1E0DBE5C0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticScalarIncrement();

  }
  if (!-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
  {
    -[TIKeyboardInputManager inputString](self, "inputString");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v21, "length"))
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "documentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "selectedText");
      v9 = objc_claimAutoreleasedReturnValue();

      v21 = (id)v9;
    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsSeparatedByCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v12, "length"))
      goto LABEL_17;
    -[TIKeyboardInputManager recentAutocorrections](self, "recentAutocorrections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager recentPredictiveInputSelections](self, "recentPredictiveInputSelections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKey:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v14, "isAutocorrection") || v16)
    {
      v20 = objc_msgSend(v16, "isAutocorrection");
      v17 = (_QWORD *)MEMORY[0x1E0DBE5B0];
      if (v20)
        v17 = (_QWORD *)MEMORY[0x1E0DBE5A8];
      if ((v20 & 1) == 0 && !v16)
        goto LABEL_16;
    }
    else
    {
      v17 = (_QWORD *)MEMORY[0x1E0DBE5A0];
    }
    -[TIKeyboardInputManager usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", *v17);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)v18;
      TIStatisticScalarIncrement();

    }
LABEL_16:

LABEL_17:
  }
}

- (void)syncToLayoutState:(id)a3
{
  uint64_t v4;
  void *v5;
  _QWORD **m_impl;
  id v7;

  v7 = a3;
  s_interface_idiom_is_pad = objc_msgSend(v7, "userInterfaceIdiom") == 1;
  if (v7)
    v4 = objc_msgSend(v7, "userInterfaceIdiom");
  else
    v4 = -1;
  -[TIKeyboardInputManager setUserInterfaceIdiom:](self, "setUserInterfaceIdiom:", v4);
  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specializeInputManager:forLayoutState:", self->m_impl, v7);

  m_impl = (_QWORD **)self->m_impl;
  if (m_impl)
  {
    (*(void (**)(_QWORD *, BOOL))(*m_impl[23] + 296))(m_impl[23], -[TIKeyboardInputManager usesContinuousPath](self, "usesContinuousPath"));
    (*(void (**)(_QWORD, BOOL))(**((_QWORD **)self->m_impl + 23) + 320))(*((_QWORD *)self->m_impl + 23), -[TIKeyboardInputManager usesMLTapTyping](self, "usesMLTapTyping"));
  }

}

- (void)syncMarkedTextForKeyboardState:(id)a3 afterContextChange:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  char v20;
  id v21;
  TIKeyboardInputManagerKeyboardContext *v22;
  void *v23;
  TIKeyboardInputManagerKeyboardContext *v24;
  id v25;

  v4 = a4;
  v25 = a3;
  objc_msgSend(v25, "inputForMarkedText");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = &stru_1EA1081D0;
  v9 = v8;

  v10 = -[__CFString length](v9, "length");
  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[__CFString isEqualToString:](v9, "isEqualToString:", v11))
  {

    if (v10 || !v4)
    {
      objc_msgSend(v25, "documentState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "markedText");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      if (v13)
        v15 = (__CFString *)v13;
      else
        v15 = &stru_1EA1081D0;
      v16 = v15;

      -[TIKeyboardInputManager inputString](self, "inputString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", v17);

      if (v18)
        -[TIKeyboardInputManager setPhraseBoundaryIfNecessary](self, "setPhraseBoundaryIfNecessary");
      else
        -[TIKeyboardInputManager setMarkedText](self, "setMarkedText");
      goto LABEL_20;
    }
  }
  else
  {

  }
  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[__CFString isEqualToString:](v9, "isEqualToString:", v19);

  if ((v20 & 1) != 0
    || -[TIKeyboardInputManager shouldClearInputOnMarkedTextOutOfSync](self, "shouldClearInputOnMarkedTextOutOfSync"))
  {
    -[TIKeyboardInputManager clearInput](self, "clearInput");
    if (v4)
      -[TIKeyboardInputManager inputLocationChanged](self, "inputLocationChanged");
    if (v10)
    {
      v21 = objc_alloc_init(MEMORY[0x1E0DBDBF8]);
      objc_msgSend(v21, "setString:", v9);
      v22 = [TIKeyboardInputManagerKeyboardContext alloc];
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[TIKeyboardInputManagerKeyboardContext initWithKeyboardState:](v22, "initWithKeyboardState:", v23);

      -[TIKeyboardInputManager addInput:withContext:](self, "addInput:withContext:", v21, v24);
    }
  }
LABEL_20:

}

- (id)contextualDisplayKeys
{
  return 0;
}

- (id)keyboardConfigurationAccentKeyString
{
  return 0;
}

- (BOOL)shouldCommitInputString
{
  return 0;
}

- (id)keyboardBehaviors
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAddModifierSymbolsToWordCharacters");

  return v3;
}

- (id)contextBeforeWithDesiredLength:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "documentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextBeforeInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = v7 - a3;
  if (v7 > a3)
  {
    if (v8 < v7)
      v8 = objc_msgSend(v6, "rangeOfComposedCharacterSequenceAtIndex:");
    objc_msgSend(v6, "substringFromIndex:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  return v6;
}

- (BOOL)usesFavonius
{
  return 1;
}

- (BOOL)isProgressivelyPathing
{
  return 0;
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  return 1;
}

- (BOOL)shouldDelayUpdateComposedText
{
  return 0;
}

- (BOOL)shouldOmitEmojiCandidates
{
  void *v3;
  BOOL v4;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "omitEmojiCandidates") & 1) != 0
    || -[TIKeyboardInputManager userInterfaceIdiom](self, "userInterfaceIdiom") == 2
    || -[TIKeyboardInputManager userInterfaceIdiom](self, "userInterfaceIdiom") == 3;

  return v4;
}

- (void)setMarkedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInputForMarkedText:", v3);

  -[TIKeyboardInputManager searchStringForMarkedText](self, "searchStringForMarkedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSearchStringForMarkedText:", v5);

  -[TIKeyboardInputManager inputString](self, "inputString");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[TIKeyboardInputManager inputIndex](self, "inputIndex");
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "documentStateAfterSettingMarkedText:selectedRange:", v12, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDocumentState:", v10);

}

- (id)markedText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[TIKeyboardInputManager rawInputString](self, "rawInputString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager inputString](self, "inputString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TIKeyboardInputManager inputIndex](self, "inputIndex");
  -[TIKeyboardInputManager searchStringForMarkedText](self, "searchStringForMarkedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager lastInputString](self, "lastInputString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDC20], "intermediateTextWithInputString:displayString:selectionLocation:searchString:lastInputString:", v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)shouldSkipCandidateSelection
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldSkipCandidateSelection");

  return v3;
}

- (id)sortMethodTitles
{
  void *v3;
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
  -[TIKeyboardInputManager sortingMethods](self, "sortingMethods");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
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
          -[TIKeyboardInputManager titleForSortingMethod:](self, "titleForSortingMethod:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)sortMethodsGroupsForCandidates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardInputManager sortingMethods](self, "sortingMethods");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x1DF0A2708]();
          -[TIKeyboardInputManager titleForSortingMethod:](self, "titleForSortingMethod:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager groupedCandidatesFromCandidates:usingSortingMethod:](self, "groupedCandidatesFromCandidates:usingSortingMethod:", v4, v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v15, v14);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v5 = v17;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)sortMethodIndexes
{
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager sortingMethods](self, "sortingMethods");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[TIKeyboardInputManager titleForSortingMethod:](self, "titleForSortingMethod:", v10, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager indexTitlesForGroupTitles:sortingMethod:](self, "indexTitlesForGroupTitles:sortingMethod:", 0, v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v4, "setObject:forKey:", v12, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)sortMethodsShowExtensionCandidates
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager sortingMethods](self, "sortingMethods");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          -[TIKeyboardInputManager titleForSortingMethod:](self, "titleForSortingMethod:", v10, (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[TIKeyboardInputManager alwaysShowExtensionCandidatesForSortingMethod:](self, "alwaysShowExtensionCandidatesForSortingMethod:", v10);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v13, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)candidateResultSetFromCandidates:(id)a3
{
  return -[TIKeyboardInputManager candidateResultSetFromCandidates:proactiveTriggers:](self, "candidateResultSetFromCandidates:proactiveTriggers:", a3, 0);
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v39;
  _QWORD v40[4];
  id v41;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_msgSend(v6, "count");
    if ((unint64_t)objc_msgSend(v6, "count") >= 2
      && (objc_msgSend(v6, "objectAtIndex:", 1),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) != 0))
    {
      if (!-[TIKeyboardLayoutState hasCandidateKey](self->_layoutState, "hasCandidateKey"))
        goto LABEL_6;
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "splitKeyboardMode");

      if ((v12 & 1) == 0)
        goto LABEL_6;
    }
    else
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "needsCandidateMetadata");

      if (v26)
      {
LABEL_6:
        -[TIKeyboardInputManager sortMethodTitles](self, "sortMethodTitles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager sortMethodsGroupsForCandidates:](self, "sortMethodsGroupsForCandidates:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager sortMethodIndexes](self, "sortMethodIndexes");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0CB3880];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __77__TIKeyboardInputManager_candidateResultSetFromCandidates_proactiveTriggers___block_invoke;
        v40[3] = &unk_1EA100AD8;
        v41 = v14;
        v16 = v14;
        objc_msgSend(v15, "predicateWithBlock:", v40);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "filteredArrayUsingPredicate:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = (void *)MEMORY[0x1E0DBDBE0];
        v20 = -[TIKeyboardInputManager initialSelectedIndex](self, "initialSelectedIndex");
        -[TIKeyboardInputManager defaultCandidate](self, "defaultCandidate");
        v21 = v8;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager sortMethodsShowExtensionCandidates](self, "sortMethodsShowExtensionCandidates");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:", v6, v20, v22, v18, v16, v39, v23, 0, 0x7FFFFFFFFFFFFFFFLL, v7);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v21;
LABEL_15:
        objc_msgSend(v24, "setGeneratedCandidateCount:", v8);
        goto LABEL_16;
      }
    }
    v27 = v6;
    v28 = -[TIKeyboardInputManager candidateRange](self, "candidateRange");
    v29 = v8 - v28;
    if (v8 <= v28)
    {
      v30 = 0;
    }
    else
    {
      v30 = v28;
      -[TIKeyboardInputManager candidateRange](self, "candidateRange");
      if (v31 < v29)
      {
        -[TIKeyboardInputManager candidateRange](self, "candidateRange");
        v29 = v32;
      }
      objc_msgSend(v27, "subarrayWithRange:", v30, v29);
      v33 = objc_claimAutoreleasedReturnValue();

      v27 = (id)v33;
    }
    v34 = (void *)MEMORY[0x1E0DBDBE0];
    v35 = -[TIKeyboardInputManager initialSelectedIndex](self, "initialSelectedIndex");
    -[TIKeyboardInputManager defaultCandidate](self, "defaultCandidate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager sortMethodTitles](self, "sortMethodTitles");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithCandidates:initialSelectedIndex:defaultCandidate:sortMethods:sortMethodGroups:indexTitles:showExtensionCandidates:disambiguationCandidates:selectedDisambiguationCandidateIndex:proactiveTriggers:", v27, v35, v36, v37, 0, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "setBatchCandidateLocation:", v30);
    goto LABEL_15;
  }
  v24 = 0;
LABEL_16:

  return v24;
}

- (void)acceptCurrentCandidateWithContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCandidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[TIKeyboardInputManager defaultCandidate](self, "defaultCandidate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v11, "acceptCandidate:", v8);
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager handleAcceptedCandidate:keyboardState:](self, "handleAcceptedCandidate:keyboardState:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v11, "unmarkText:", v10);

}

- (void)acceptCurrentCandidateIfSelectedWithContext:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userSelectedCurrentCandidate");

  if (v5)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentCandidate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "acceptCandidate:", v7);
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager handleAcceptedCandidate:keyboardState:](self, "handleAcceptedCandidate:keyboardState:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v10, "unmarkText:", v9);

  }
}

- (BOOL)isHighMemoryManager
{
  _QWORD *m_impl;
  uint64_t v3;

  m_impl = self->m_impl;
  v3 = m_impl[29];
  if (v3)
  {
    LODWORD(v3) = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)v3 + 16))(v3, a2);
    if ((_DWORD)v3)
      LOBYTE(v3) = (*(uint64_t (**)(_QWORD))(*(_QWORD *)m_impl[29] + 136))(m_impl[29]) != 0;
  }
  return v3;
}

- (void)prepareForKeyboardActivity
{
  LanguageModel *ptr;

  ptr = self->m_lightweight_language_model.__ptr_;
  if (ptr)
  {
    if ((*(unsigned int (**)(LanguageModel *, SEL))(*(_QWORD *)ptr + 16))(ptr, a2))
      (*(void (**)(LanguageModel *))(*(_QWORD *)self->m_lightweight_language_model.__ptr_ + 184))(self->m_lightweight_language_model.__ptr_);
  }
}

- (void)logDiscoverabilityEvent:(int)a3 userInfo:(id)a4
{
  const __CFString *v5;
  void *v6;
  void *v7;
  TPSDiscoverabilitySignal *v8;

  if (a3)
  {
    if (a3 != 1)
      return;
    v5 = CFSTR("com.apple.keyboard.candidateBar.extendedWithGesture");
  }
  else
  {
    v5 = CFSTR("com.apple.keyboard.resized");
  }
  v8 = -[TPSDiscoverabilitySignal initWithIdentifier:]([TPSDiscoverabilitySignal alloc], "initWithIdentifier:", v5);
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalizedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSDiscoverabilitySignal setContext:](v8, "setContext:", v7);

  -[TPSDiscoverabilitySignal donateSignalWithCompletion:](v8, "donateSignalWithCompletion:", &__block_literal_global_156);
}

- (id)handleKeyboardInput:(id)a3
{
  id v4;
  TIKeyboardInputManagerKeyboardContext *v5;
  void *v6;
  TIKeyboardInputManagerKeyboardContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  signed int v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;

  v4 = a3;
  v5 = [TIKeyboardInputManagerKeyboardContext alloc];
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TIKeyboardInputManagerKeyboardContext initWithKeyboardState:](v5, "initWithKeyboardState:", v6);

  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerKeyboardContext setRevisionHistory:](v7, "setRevisionHistory:", v8);

  objc_msgSend(v4, "output");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v4, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager setLastInputString:](self, "setLastInputString:", v10);
    if (objc_msgSend(v4, "isDoubleSpace"))
    {
      -[TIKeyboardInputManager replacementForDoubleSpace](self, "replacementForDoubleSpace");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setString:", v33);

      -[TIKeyboardInputManagerKeyboardContext output](v7, "output");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setUnmarkIfNecessary:", 1);

      -[TIKeyboardInputManager deleteFromInputWithContext:](self, "deleteFromInputWithContext:", v7);
LABEL_27:
      -[TIKeyboardInputManager addInput:withContext:](self, "addInput:withContext:", v4, v7);
      goto LABEL_28;
    }
    if (objc_msgSend(v4, "isBackspace"))
    {
      -[TIKeyboardInputManager incrementUsageTrackingKeysForDeleteFromInput](self, "incrementUsageTrackingKeysForDeleteFromInput");
      -[TIKeyboardInputManager deleteFromInputWithContext:](self, "deleteFromInputWithContext:", v7);
      -[TIKeyboardInputManagerKeyboardContext output](v7, "output");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setProducedByDeleteInput:", 1);
    }
    else
    {
      v36 = -[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection");
      if (!v10 || !v36 || !-[TIKeyboardInputManager stringEndsWord:](self, "stringEndsWord:", v10))
      {
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "textInputTraits");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v38, "secureTextEntry") & 1) == 0)
        {
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "layoutState");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "layoutTag");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("Fullwidth"));

          if (!v42)
            goto LABEL_27;
          objc_msgSend(v4, "string");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "_stringByConvertingFromHalfWidthToFullWidth");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setString:", v38);
        }

        goto LABEL_27;
      }
      -[TIKeyboardInputManagerKeyboardContext insertText:](v7, "insertText:", v10);
      -[TIKeyboardInputManager clearInput](self, "clearInput");
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager syncMarkedTextForKeyboardState:afterContextChange:](self, "syncMarkedTextForKeyboardState:afterContextChange:", v35, 0);
    }

LABEL_28:
    self->super._hasHandledInput = 1;
    -[TIKeyboardInputManager _recalcSupplementalPrefix](self, "_recalcSupplementalPrefix");
    -[TIKeyboardInputManagerKeyboardContext output](v7, "output");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
    {
LABEL_31:

      goto LABEL_32;
    }
    -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addKeyInput:keyboardState:", v4, v24);
LABEL_30:

    goto LABEL_31;
  }
  if (-[TIKeyboardInputManager doesComposeText](self, "doesComposeText"))
  {
    -[TIKeyboardInputManager inputStem](self, "inputStem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "length");
    objc_msgSend(v4, "output");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "deletionCount");

    if (v14)
    {
      v15 = v12 - 1;
      if (((v12 - 1) & 0x80000000) == 0)
      {
        v16 = 1;
        do
        {
          v17 = objc_msgSend(v10, "_rangeOfBackwardDeletionClusterAtIndex:", v15);
          v19 = v18;
          objc_msgSend(v10, "substringWithRange:", v17, v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "insertString:atIndex:", v20, 0);

          objc_msgSend(v4, "output");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "deletionCount");

          if (v22 <= v16)
            break;
          v15 -= v19;
          ++v16;
        }
        while ((v15 & 0x80000000) == 0);
      }
    }
    v23 = *((_DWORD *)self->m_impl + 24)
        - -[TIKeyboardInputManager externalIndexToInternal:](self, "externalIndexToInternal:", objc_msgSend(v10, "length") - objc_msgSend(v11, "length"));
    if (v23 >= 1)
    {
      do
      {
        -[TIKeyboardInputManager deleteFromInputWithContext:](self, "deleteFromInputWithContext:", v7);
        --v23;
      }
      while (v23);
    }
    v24 = objc_alloc_init(MEMORY[0x1E0DBDBF8]);
    objc_msgSend(v4, "output");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "insertionText");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setString:", v26);

    -[TIKeyboardInputManager addInput:withContext:](self, "addInput:withContext:", v24, v7);
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "documentState");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "markedText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "length");

    if (v30)
    {
      objc_msgSend(v24, "string");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManagerKeyboardContext unmarkText:](v7, "unmarkText:", v31);

      -[TIKeyboardInputManager clearInput](self, "clearInput");
    }
    v32 = 0;
    goto LABEL_30;
  }
  v32 = 0;
LABEL_32:

  return v32;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  const KB::String *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v68 = v7;
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "isUppercase");
    if (objc_msgSend(v6, "isAutoshifted"))
      v12 = v11 | 2;
    else
      v12 = v11;
    if (objc_msgSend(v6, "isPopupVariant"))
      v12 |= 4u;
    if (objc_msgSend(v6, "isMultitap"))
      v12 |= 8u;
    v13 = objc_msgSend(v6, "isGesture");
    if (objc_msgSend(v6, "isPopupVariant") | v13)
      v12 |= 4u;
    if (objc_msgSend(v6, "isSynthesizedByAcceptingCandidate"))
      v14 = v12 | 0x80;
    else
      v14 = v12;
    objc_msgSend(v6, "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TIKeyboardInputManager shouldInsertSpaceBeforeInput:](self, "shouldInsertSpaceBeforeInput:", v15);

    if (!v16)
    {
LABEL_31:
      v69 = 0;
      -[TIKeyboardInputManager inputString](self, "inputString");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = -[TIKeyboardInputManager inputIndex](self, "inputIndex");
      -[TIKeyboardInputManager inputContext](self, "inputContext");
      v34 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "string");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "touchEvent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "location");
      -[TIKeyboardInputManager addInput:flags:point:firstDelete:](self, "addInput:flags:point:firstDelete:", v35, v14, &v69);
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v66 = (void *)v34;
      v67 = (void *)v32;
      -[TIKeyboardInputManager deletedSuffixOfInputContext:whenDeletingFromInputString:withInputIndex:deletionCount:](self, "deletedSuffixOfInputContext:whenDeletingFromInputString:withInputIndex:deletionCount:", v34, v32, v33, v69);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v37)
        v40 = v37;
      else
        v40 = &stru_1EA1081D0;
      objc_msgSend(v38, "stringByAppendingString:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
        v42 = -[TIKeyboardInputManager inputCount](self, "inputCount") == 0;
      else
        v42 = 1;
      v7 = v68;
      if ((objc_msgSend(v10, "shouldSkipCandidateSelection") & 1) == 0
        && (objc_msgSend(v10, "suppressingCandidateSelection") & 1) == 0
        && ((v42 | -[TIKeyboardInputManager shouldCommitInputString](self, "shouldCommitInputString")) & 1) == 0)
      {
        -[TIKeyboardInputManager setMarkedText](self, "setMarkedText");
LABEL_55:
        if (objc_msgSend(v6, "isSynthesizedByAcceptingCandidate"))
          -[TIKeyboardInputManager dropInput](self, "dropInput");
        -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        if (v55)
        {
          if (objc_msgSend(v6, "isSynthesizedByAcceptingCandidate"))
          {
            -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "candidate");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "string");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "stringByAppendingString:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "candidateByReplacingWithCandidate:", v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", v61);

            v7 = v68;
          }
          else
          {
            -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", 0);
            -[TIKeyboardInputManager setRejectedConversionsForCurrentContinuousPath:](self, "setRejectedConversionsForCurrentContinuousPath:", 0);
          }
        }
        TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->m_impl + 2) - *((_QWORD *)self->m_impl + 1)) >> 3), (uint64_t)&v70);
        KB::ns_string((KB *)&v70, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v71 && BYTE6(v70) == 1)
          free(v71);
        -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "shouldClearInput:", v63);

        if (v65)
          -[TIKeyboardInputManager clearInput](self, "clearInput");

        goto LABEL_67;
      }
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "documentState");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "selectedText");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_msgSend(v41, "length");
      if (!v69)
      {
LABEL_47:
        if (v46)
          objc_msgSend(v68, "insertText:", v41);
        if (objc_msgSend(v10, "shortcutConversionEnabled"))
        {
          objc_msgSend(v10, "documentState");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager shortcutConversionForDocumentState:](self, "shortcutConversionForDocumentState:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "output");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setShortcutConversion:", v51);

        }
        if (v45 && -[TIKeyboardInputManager shouldExtendPriorWord](self, "shouldExtendPriorWord"))
        {
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "documentState");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager setInputStringFromDocumentState:isDeleteEvent:](self, "setInputStringFromDocumentState:isDeleteEvent:", v54, 0);

        }
        else
        {
          -[TIKeyboardInputManager trimInput](self, "trimInput");
        }
        goto LABEL_55;
      }
      if (v45)
      {
        v47 = v69 + 1;
      }
      else
      {
        objc_msgSend(v10, "documentState");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "markedText");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = v69;
        if (!v49)
        {
LABEL_46:
          objc_msgSend(v68, "deleteBackward:", v47);
          goto LABEL_47;
        }
        v47 = v69 + 1;
      }
      v69 = v47;
      goto LABEL_46;
    }
    v70 = 0;
    -[TIKeyboardInputManager inputString](self, "inputString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TIKeyboardInputManager inputIndex](self, "inputIndex");
    -[TIKeyboardInputManager inputContext](self, "inputContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isContinuousPathConversion") & 1) != 0)
    {
      -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "shouldAccept");

      if ((v22 & 1) != 0)
      {
        -[TIKeyboardInputManager pathedWordSeparator](self, "pathedWordSeparator");
        v23 = objc_claimAutoreleasedReturnValue();
LABEL_23:
        v26 = (void *)v23;
        -[TIKeyboardInputManager addInput:flags:point:firstDelete:](self, "addInput:flags:point:firstDelete:", v23, 128, &v70, 0.0, 0.0);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

        -[TIKeyboardInputManager deletedSuffixOfInputContext:whenDeletingFromInputString:withInputIndex:deletionCount:](self, "deletedSuffixOfInputContext:whenDeletingFromInputString:withInputIndex:deletionCount:", v19, v17, v18, v70);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v27)
          v30 = v27;
        else
          v30 = &stru_1EA1081D0;
        objc_msgSend(v28, "stringByAppendingString:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v70)
          objc_msgSend(v68, "deleteBackward:");
        if (objc_msgSend(v31, "length"))
          objc_msgSend(v68, "insertText:", v31);
        -[TIKeyboardInputManager dropInput](self, "dropInput");

        goto LABEL_31;
      }
    }
    else
    {

    }
    -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "isSynthesizedByAcceptingCandidate"))
  {
    -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (!v25)
      -[TIKeyboardInputManager dropInput](self, "dropInput");
  }
LABEL_67:

}

- (void)continuousPathCandidateRejected:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager rejectedConversionsForCurrentContinuousPath](self, "rejectedConversionsForCurrentContinuousPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager setRejectedConversionsForCurrentContinuousPath:](self, "setRejectedConversionsForCurrentContinuousPath:", v8);

  }
  -[TIKeyboardInputManager rejectedConversionsForCurrentContinuousPath](self, "rejectedConversionsForCurrentContinuousPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (void)deleteFromInputWithContext:(id)a3
{
  id v4;
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
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  int v56;
  void *v57;
  id v58;
  _QWORD *m_impl;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v70[5];
  uint64_t v71;
  _BYTE v72[8];
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardInputManager currentWordStem](self, "currentWordStem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager autocorrectionForCurrentStem](self, "autocorrectionForCurrentStem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    -[TIKeyboardInputManager setRejectedAutocorrection:forInput:](self, "setRejectedAutocorrection:forInput:", v7, v5);
  -[TIKeyboardInputManager autocorrectionHistory](self, "autocorrectionHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "candidate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v9, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager setRejectedAutocorrection:forInput:](self, "setRejectedAutocorrection:forInput:", v10, v11);

  }
  if (!-[TIKeyboardInputManager inputCount](self, "inputCount")
    && -[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
  {
    -[TIKeyboardInputManager inputLocationChanged](self, "inputLocationChanged");
  }
  v71 = 0;
  if (!-[TIKeyboardInputManager inputIndex](self, "inputIndex"))
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markedText");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v17 = -[TIKeyboardInputManager supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary");

      if (v17)
        goto LABEL_30;
    }
    else
    {

    }
    -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
    v36 = objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = (void *)v36;
      -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v38, "isContinuousPathConversion") & 1) != 0)
      {
        -[TIKeyboardInputManager config](self, "config");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "continuousPathDeleteWholeWord");

        if (v40)
        {
          -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "candidate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "input");
          v44 = objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            v45 = (void *)v44;
            v67 = v10;
            v69 = v5;
            v46 = v9;
            -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "input");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager pathedWordSeparator](self, "pathedWordSeparator");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "stringByAppendingString:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = objc_msgSend(v42, "hasPrefix:", v50);

            if (!v66)
            {
              v53 = v4;
              v9 = v46;
              v10 = v67;
              v5 = v69;
              goto LABEL_47;
            }
            -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "input");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "substringFromIndex:", objc_msgSend(v51, "length") + 1);
            v52 = objc_claimAutoreleasedReturnValue();

            v42 = (void *)v52;
            v9 = v46;
            v10 = v67;
            v5 = v69;
          }
          v53 = v4;

LABEL_47:
          m_impl = self->m_impl;
          if (m_impl)
          {
            KB::utf8_string((KB *)v42, (uint64_t)v72);
            v60 = m_impl[23];
            if (v60)
              (*(void (**)(uint64_t, _BYTE *))(*(_QWORD *)v60 + 112))(v60, v72);
            if (v73 && v72[6] == 1)
              free(v73);
          }
          v4 = v53;
          objc_msgSend(v53, "deleteTextBackward:", v42);
          -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager continuousPathCandidateRejected:](self, "continuousPathCandidateRejected:", v61);

          -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", 0);
          v54 = 1;
LABEL_54:
          if (-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
          {
            -[TIKeyboardInputManager keyboardState](self, "keyboardState");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager syncMarkedTextForKeyboardState:afterContextChange:](self, "syncMarkedTextForKeyboardState:afterContextChange:", v62, 0);

          }
          else
          {
            if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
            {
              -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "changingContextWithTrigger:", *MEMORY[0x1E0DBDEC0]);

            }
            -[TIKeyboardInputManager keyboardState](self, "keyboardState");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "documentState");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager setInputStringFromDocumentState:isDeleteEvent:didDeleteLastAcceptedPath:](self, "setInputStringFromDocumentState:isDeleteEvent:didDeleteLastAcceptedPath:", v65, 1, v54);

          }
          goto LABEL_30;
        }
      }
      else
      {

      }
    }
    objc_msgSend(v4, "deleteBackward:", 1);
    -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
    v54 = objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "isContinuousPathConversion");

      if (v56)
      {
        -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager continuousPathCandidateRejected:](self, "continuousPathCandidateRejected:", v57);

        -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", 0);
      }
      v54 = 0;
    }
    goto LABEL_54;
  }
  if (!-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
  {
LABEL_16:
    v68 = v5;
    v20 = v10;
    v21 = v9;
    v22 = v4;
    v23 = -[TIKeyboardInputManager hasLegacyInputStem](self, "hasLegacyInputStem");
    -[TIKeyboardInputManager inputString](self, "inputString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[TIKeyboardInputManager inputIndex](self, "inputIndex");
    -[TIKeyboardInputManager inputContext](self, "inputContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      -[TIKeyboardInputManager displayedCandidateRejected](self, "displayedCandidateRejected");
    -[TIKeyboardInputManager deleteFromInput:](self, "deleteFromInput:", &v71);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager deletedSuffixOfInputContext:whenDeletingFromInputString:withInputIndex:deletionCount:](self, "deletedSuffixOfInputContext:whenDeletingFromInputString:withInputIndex:deletionCount:", v26, v24, v25, v71);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v27)
      v30 = v27;
    else
      v30 = &stru_1EA1081D0;
    objc_msgSend(v28, "stringByAppendingString:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "length");
    v4 = v22;
    if (v71)
      objc_msgSend(v22, "deleteBackward:");
    if (v32)
      objc_msgSend(v22, "insertText:", v31);
    if (!v23
      && -[TIKeyboardInputManager shouldExtendPriorWord](self, "shouldExtendPriorWord")
      && -[TIKeyboardInputManager hasLegacyInputStem](self, "hasLegacyInputStem"))
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "documentState");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __53__TIKeyboardInputManager_deleteFromInputWithContext___block_invoke;
      v70[3] = &unk_1EA100AB0;
      v70[4] = self;
      objc_msgSend(v34, "inputStringWithTerminatorPredicate:", v70);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v22;
      -[TIKeyboardInputManager setOriginalInput:](self, "setOriginalInput:", v35);

    }
    v9 = v21;
    v10 = v20;
    v5 = v68;
    goto LABEL_30;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "shouldSkipCandidateSelection"))
  {

    goto LABEL_16;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "suppressingCandidateSelection");

  if ((v19 & 1) != 0)
    goto LABEL_16;
  v58 = -[TIKeyboardInputManager deleteFromInput:](self, "deleteFromInput:", &v71);
  if (!-[TIKeyboardInputManager shouldDelayUpdateComposedText](self, "shouldDelayUpdateComposedText"))
  {
    -[TIKeyboardInputManager updateComposedText](self, "updateComposedText");
    -[TIKeyboardInputManager setMarkedText](self, "setMarkedText");
  }
LABEL_30:

}

- (void)trackProactiveMetrics:(id)a3 keyboardState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  +[TIConnectionsMetricsTracker sharedInstance](TIConnectionsMetricsTracker, "sharedInstance");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "documentIsEmpty");
  objc_msgSend(v5, "textInputTraits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "textContentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackTextFieldEntryWithEmpty:fieldType:trigger:", v8, v10, v6);

}

- (BOOL)generateAutofillFormWithKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isScreenLocked");

  if (v9)
    goto LABEL_2;
  if ((objc_msgSend(v6, "needAutofill") & 1) != 0
    || objc_msgSend(v6, "autofillMode") == 1
    || (objc_msgSend(v6, "autofillContext"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE430]),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("webauthn")),
        v12,
        v11,
        v13))
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secureCandidateRenderTraits");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke;
    v21[3] = &unk_1EA100B90;
    v22 = v7;
    objc_msgSend(v14, "generateAutofillFormCandidatesWithRenderTraits:withKeyboardState:completion:", v15, v6, v21);

    v10 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "autofillMode") == 2 || objc_msgSend(v6, "autofillMode") == 7)
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secureCandidateRenderTraits");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke_3;
    v19[3] = &unk_1EA100B90;
    v20 = v7;
    objc_msgSend(v17, "generateAutofillFormSuggestedUsernameWithRenderTraits:withKeyboardState:completionHandler:", v18, v6, v19);

  }
  else
  {
LABEL_2:
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (id)generateOneTimeCodeCandidatesWithKeyboardState:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScreenLocked");

  if ((v6 & 1) == 0
    && ((objc_msgSend(v4, "needOneTimeCodeAutofill") & 1) != 0 || objc_msgSend(v4, "autofillMode") == 3))
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secureCandidateRenderTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateOneTimeCodeCandidatesWithRenderTraits:withKeyboardState:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)generateCellularCandidatesWithKeyboardState:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScreenLocked");

  if ((v6 & 1) == 0 && objc_msgSend(v4, "needCellularAutofill") && objc_msgSend(v4, "autofillMode") == 8)
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secureCandidateRenderTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "generateCellularCandidatesWithRenderTraits:withKeyboardState:", v8, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  _BOOL4 v11;
  __int128 *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSUInteger v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  void *v29;
  NSUInteger v30;
  NSObject *v31;
  os_signpost_id_t v32;
  os_signpost_id_t v33;
  void *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  os_signpost_id_t v37;
  NSUInteger v38;
  void *v39;
  NSUInteger v40;
  void *v41;
  void *v42;
  char v43;
  NSObject *v44;
  os_signpost_id_t v45;
  os_signpost_id_t v46;
  id v47;
  void *v48;
  TIKeyboardInputManager *v49;
  NSUInteger v50;
  NSUInteger v51;
  _QWORD v52[5];
  id v53;
  NSUInteger v54;
  NSUInteger v55;
  uint8_t buf[16];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[TIKeyboardInputManager setKeyboardState:](self, "setKeyboardState:", v9);
  v11 = -[TIKeyboardInputManager _hasSupplementalPrefix](self, "_hasSupplementalPrefix");
  v12 = &xmmword_1F0284000;
  if (KB::SetOnlySearchSupplementalLexiconForScope::s_shouldOnlySearchSupplementalLexicon)
    v13 = 0;
  else
    v13 = v11;
  if (v13)
    KB::SetOnlySearchSupplementalLexiconForScope::s_shouldOnlySearchSupplementalLexicon = 1;
  if (v10)
  {
    +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isAutoPopupEnabled");

    -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "close");

      -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
    }
    -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", v10);
    -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "open");

    if ((*((_DWORD *)self->m_impl + 98) & 0x80000000) == 0)
      goto LABEL_10;
    if ((objc_msgSend(v9, "needOneTimeCodeAutofill") & 1) != 0 || objc_msgSend(v9, "autofillMode") == 3)
    {
      v51 = location;
      v30 = length;
      kdebug_trace();
      kac_get_log();
      v31 = (id)objc_claimAutoreleasedReturnValue();
      v32 = os_signpost_id_make_with_pointer(v31, (const void *)((unint64_t)self ^ 0x11));
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v33 = v32;
        if (os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v33, "kbdManager.generateAutofill", ", buf, 2u);
        }
      }

      -[TIKeyboardInputManager generateOneTimeCodeCandidatesWithKeyboardState:](self, "generateOneTimeCodeCandidatesWithKeyboardState:", v9);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      kdebug_trace();
      kac_get_log();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      v36 = os_signpost_id_make_with_pointer(v35, (const void *)((unint64_t)self ^ 0x11));
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v37 = v36;
        if (os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v35, OS_SIGNPOST_INTERVAL_END, v37, "kbdManager.generateAutofill", ", buf, 2u);
        }
      }

      if (objc_msgSend(v34, "count"))
      {
        objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:", 0, v34, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        length = v30;
        location = v51;
        if (v19)
          goto LABEL_30;
      }
      else
      {

        length = v30;
        location = v51;
      }
    }
    if (objc_msgSend(v9, "needCellularAutofill") && objc_msgSend(v9, "autofillMode") == 8)
    {
      v38 = location;
      -[TIKeyboardInputManager generateCellularCandidatesWithKeyboardState:](self, "generateCellularCandidatesWithKeyboardState:", v9);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "count"))
      {
        objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:", 0, v39, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        location = v38;
        if (v19)
        {
LABEL_30:
          if ((objc_msgSend(v19, "empty") & 1) == 0)
          {
            objc_msgSend(v10, "pushCandidates:", v19);
            objc_msgSend(v10, "close");
            -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
LABEL_16:

            goto LABEL_17;
          }
LABEL_11:
          -[TIKeyboardInputManager pregeneratedTypingAutocorrections](self, "pregeneratedTypingAutocorrections");
          v20 = objc_claimAutoreleasedReturnValue();
          if (!v20)
            goto LABEL_14;
          v21 = (void *)v20;
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v50 = location;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "documentState");
          v49 = self;
          v23 = v19;
          v24 = length;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "documentState");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v25, "isEqual:", v26);

          v12 = &xmmword_1F0284000;
          length = v24;
          v19 = v23;
          self = v49;

          location = v50;
          if ((v27 & 1) != 0)
          {
            -[TIKeyboardInputManager pregeneratedTypingAutocorrections](v49, "pregeneratedTypingAutocorrections");
            v28 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_14:
            -[TIKeyboardInputManager generateTypingAutocorrectionsWithCandidateRange:](self, "generateTypingAutocorrectionsWithCandidateRange:", location, length);
            v28 = objc_claimAutoreleasedReturnValue();
          }
          v29 = (void *)v28;
          -[TIKeyboardInputManager setPregeneratedTypingAutocorrections:](self, "setPregeneratedTypingAutocorrections:", 0);
          -[TIKeyboardInputManager finishGeneratingAutocorrectionsWithCandidates:candidateRange:candidateHandler:](self, "finishGeneratingAutocorrectionsWithCandidates:candidateRange:candidateHandler:", v29, location, length, v10);

          goto LABEL_16;
        }
      }
      else
      {

        location = v38;
      }
    }
    if (v15)
    {
      if ((objc_msgSend(v9, "needAutofill") & 1) != 0)
      {
        v40 = location;
        if ((objc_msgSend(v9, "needContactAutofill") & 1) != 0)
        {
LABEL_42:
          v19 = 0;
          location = v40;
          goto LABEL_11;
        }
LABEL_46:
        kdebug_trace();
        kac_get_log();
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = os_signpost_id_make_with_pointer(v44, (const void *)((unint64_t)self ^ 0x11));
        if (v45 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v46 = v45;
          if (os_signpost_enabled(v44))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v44, OS_SIGNPOST_INTERVAL_BEGIN, v46, "kbdManager.generateAutofill", ", buf, 2u);
          }
        }

        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __99__TIKeyboardInputManager_generateAutocorrectionsWithKeyboardState_candidateRange_candidateHandler___block_invoke;
        v52[3] = &unk_1EA100BB8;
        v52[4] = self;
        v47 = v10;
        v53 = v47;
        v54 = v40;
        v55 = length;
        if (-[TIKeyboardInputManager generateAutofillFormWithKeyboardState:completionHandler:](self, "generateAutofillFormWithKeyboardState:completionHandler:", v9, v52))
        {
          objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:", 0, 0);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "pushCandidates:", v48);

        }
        if (v13)
          goto LABEL_18;
        goto LABEL_19;
      }
      objc_msgSend(v9, "autofillContext");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "objectForKeyedSubscript:", *MEMORY[0x1E0DBE430]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v42, "isEqualToString:", CFSTR("webauthn")) & 1) != 0 || objc_msgSend(v9, "autofillMode"))
      {
        v40 = location;
        v43 = objc_msgSend(v9, "needContactAutofill");

        if ((v43 & 1) != 0)
          goto LABEL_42;
        goto LABEL_46;
      }

    }
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
LABEL_17:
  if (v13)
LABEL_18:
    *((_BYTE *)v12 + 1632) = 0;
LABEL_19:

}

- (id)generateTypingAutocorrectionsWithCandidateRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  length = a3.length;
  location = a3.location;
  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAutoPopupEnabled");

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "autocorrectionListUIDisplayed"))
  {

LABEL_4:
    -[TIKeyboardInputManager autocorrectionListWithCandidateCount:](self, "autocorrectionListWithCandidateCount:", location + length);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longPredictionListEnabled");

  if (v10)
    goto LABEL_4;
  if (v7)
  {
    -[TIKeyboardInputManager autocorrectionListWithCandidateCount:](self, "autocorrectionListWithCandidateCount:", location + length);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_6;
    v14 = v13;
    v15 = (void *)MEMORY[0x1E0DBDB48];
    objc_msgSend(v13, "corrections");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "proactiveTriggers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "listWithCorrections:predictions:emojiList:proactiveTriggers:", v16, 0, 0, v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TIKeyboardInputManager supplementalAutocorrectionCandidates](self, "supplementalAutocorrectionCandidates");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      -[TIKeyboardInputManager autocorrectionCandidates](self, "autocorrectionCandidates");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:", v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_5:
  if (!v11)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TIKeyboardInputManager setLastAutocorrectionList:](self, "setLastAutocorrectionList:", v11);
  return v11;
}

- (id)generateInlineCompletions:(id)a3 withPrefix:(id)a4
{
  KB *v6;
  KB *v7;
  _QWORD *m_impl;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  KB *v13;
  id v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD v19[5];
  int v20;
  __int128 v21;
  void *__p[2];
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[3];
  _QWORD v28[18];
  void **v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  __CFString *v34;
  _BYTE v35[8];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  *(_OWORD *)__p = 0u;
  v6 = (KB *)a4;
  v7 = (KB *)a3;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v25);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v26);
  memset(v27, 0, sizeof(v27));
  v20 = 0;
  KB::utf8_string(v7, (uint64_t)&v29);

  -[TIKeyboardInputManager tokenizeString:context:sentences:](self, "tokenizeString:context:sentences:", &v29, &v21, &v20);
  if (v30 && BYTE6(v29) == 1)
    free(v30);
  KB::utf8_string(v6, (uint64_t)v35);

  m_impl = self->m_impl;
  if (m_impl[29])
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    m_impl = self->m_impl;
    if (v10)
    {
      v11 = m_impl[29];
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "clientIdentifier");
      v13 = (KB *)objc_claimAutoreleasedReturnValue();
      KB::utf8_string(v13, (uint64_t)&v29);
      (*(void (**)(uint64_t, void ***))(*(_QWORD *)v11 + 240))(v11, &v29);
      if (v30 && BYTE6(v29) == 1)
        free(v30);

      m_impl = self->m_impl;
    }
  }
  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__10337;
  v33 = __Block_byref_object_dispose__10338;
  v34 = &stru_1EA1081D0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__TIKeyboardInputManager_generateInlineCompletions_withPrefix___block_invoke;
  v19[3] = &unk_1EA100BE0;
  v19[4] = &v29;
  (*(void (**)(_QWORD *__return_ptr, _QWORD *, __int128 *, _BYTE *, uint64_t, _QWORD *))(*m_impl + 32))(v28, m_impl, &v21, v35, 1, v19);
  std::__optional_destruct_base<std::tuple<KB::CandidateCollection,KB::String>,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v28);
  v14 = v30[5];
  _Block_object_dispose(&v29, 8);

  if (v36 && v35[6] == 1)
    free(v36);
  v29 = (void **)v27;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v29);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v26);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v25);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v15 = (std::__shared_weak_count *)*((_QWORD *)&v21 + 1);
  if (*((_QWORD *)&v21 + 1))
  {
    v16 = (unint64_t *)(*((_QWORD *)&v21 + 1) + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  return v14;
}

- (void)finishGeneratingAutocorrectionsWithCandidates:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length;
  id v7;
  void *v8;
  void *v9;
  dispatch_group_t v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSUInteger v32;
  id v33;
  NSUInteger v34;
  _QWORD aBlock[4];
  id v36;
  id v37;
  id location;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[4];
  NSObject *v46;
  TIKeyboardInputManager *v47;
  id v48;
  uint64_t *v49;
  id v50;
  _BYTE v51[8];
  void *v52;
  _BYTE v53[8];
  void *v54;
  uint64_t v55;

  length = a4.length;
  v34 = a4.location;
  v55 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__10337;
  v43 = __Block_byref_object_dispose__10338;
  v7 = a3;
  v44 = v7;
  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "requestToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v53);
  v10 = dispatch_group_create();
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__TIKeyboardInputManager_finishGeneratingAutocorrectionsWithCandidates_candidateRange_candidateHandler___block_invoke;
  aBlock[3] = &unk_1EA100C08;
  objc_copyWeak(&v37, &location);
  v12 = v9;
  v36 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  v45[0] = v11;
  v45[1] = 3321888768;
  v45[2] = __104__TIKeyboardInputManager_finishGeneratingAutocorrectionsWithCandidates_candidateRange_candidateHandler___block_invoke_2;
  v45[3] = &unk_1EA100C30;
  objc_copyWeak(&v50, &location);
  v14 = v10;
  v49 = &v39;
  v46 = v14;
  v47 = self;
  KB::String::String((KB::String *)v51, (const KB::String *)v53);
  v33 = v12;
  v48 = v33;
  v15 = _Block_copy(v45);
  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "asynchronous");

  -[TIKeyboardInputManager config](self, "config");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isTesting");

  if (v17 && v19)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v20, "needAutofill");

  }
  objc_msgSend((id)v40[5], "corrections");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "autocorrection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isContinuousPathConversion");

  if (v23)
  {
    -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pushCandidates:", v40[5]);
  }
  else
  {
    v32 = length;
    v25 = v7;
    if (-[TIKeyboardInputManager shouldGenerateInlineCompletions](self, "shouldGenerateInlineCompletions"))
    {
      dispatch_group_enter(v14);
      -[TIKeyboardInputManager finishGeneratingInlineCompletions:completion:syncResponse:](self, "finishGeneratingInlineCompletions:completion:syncResponse:", v40[5], v15, v17 ^ 1u);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v40[5];
      v40[5] = v26;

    }
    -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0DBDB48];
    objc_msgSend((id)v40[5], "corrections");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v40[5], "inlineCompletions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "listWithCorrections:inlineCompletionList:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pushCandidates:", v31);

    v7 = v25;
    length = v32;
  }

  dispatch_group_enter(v14);
  -[TIKeyboardInputManager finishGeneratingResponseKitProactiveSuggestions:candidateRange:completion:](self, "finishGeneratingResponseKitProactiveSuggestions:candidateRange:completion:", v40[5], v34, length, v15);
  if (v17)
    dispatch_group_notify(v14, MEMORY[0x1E0C80D38], v13);
  else
    v13[2](v13);

  if (v52 && v51[6] == 1)
    free(v52);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

  if (v54 && v53[6] == 1)
    free(v54);

  _Block_object_dispose(&v39, 8);
}

- (id)finishGeneratingInlineCompletions:(id)a3 completion:(id)a4 syncResponse:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  id v13;
  void *v14;
  char *m_impl;
  char *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[24];
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD aBlock[5];
  id v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  const KB::Candidate **v66;
  _BYTE v67[8];
  void *v68;
  _BYTE v69[128];
  _BYTE v70[8];
  void *v71;
  const KB::Candidate *v72[3];
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _BYTE v76[8];
  void *v77;
  uint8_t buf[104];
  _BYTE v79[40];
  _BYTE v80[8];
  void *v81;
  uint64_t v82;

  v5 = a5;
  v82 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  kdebug_trace();
  kac_get_log();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_make_with_pointer(v10, (const void *)((unint64_t)self ^ 0x10));
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "kbdManager.generateInlineCompletions", ", buf, 2u);
    }
  }

  v60 = 0;
  v61 = &v60;
  v62 = 0x3032000000;
  v63 = __Block_byref_object_copy__10337;
  v64 = __Block_byref_object_dispose__10338;
  v45 = v8;
  v65 = v45;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__TIKeyboardInputManager_finishGeneratingInlineCompletions_completion_syncResponse___block_invoke;
  aBlock[3] = &unk_1EA100C68;
  aBlock[4] = self;
  v59 = &v60;
  v13 = v9;
  v58 = v13;
  v14 = _Block_copy(aBlock);
  m_impl = (char *)self->m_impl;
  v16 = m_impl + 432;
  TIInputManager::input_substring((unsigned __int16 *)m_impl + 4, 0, *((_DWORD *)m_impl + 24), (uint64_t)v80);
  v44 = v14;
  (*(void (**)(uint8_t *__return_ptr, void *, char *, _BYTE *, _BOOL8, void *))(*(_QWORD *)self->m_impl + 32))(buf, self->m_impl, v16, v80, v5, v14);
  if (v79[32])
  {
    v43 = v13;
    KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v72, (const KB::Candidate **)buf);
    KB::String::String((KB::String *)v76, (const KB::String *)v79);
    KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v53, v72);
    KB::String::String((KB::String *)v70, (const KB::String *)v76);
    -[TIKeyboardInputManager inlineCompletions:matchedStem:](self, "inlineCompletions:matchedStem:", v53, v70);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v71 && v70[6] == 1)
      free(v71);
    v66 = (const KB::Candidate **)&v56;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
    v66 = (const KB::Candidate **)&v55;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
    v66 = (const KB::Candidate **)&v54;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
    v66 = (const KB::Candidate **)v53;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
    if (v17)
    {
      if (objc_msgSend(v17, "count"))
      {
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v42 = v17;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v50;
          v22 = &stru_1EA1081D0;
          do
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v50 != v21)
                objc_enumerationMutation(v18);
              v24 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
              if (-[__CFString length](v22, "length"))
              {
                -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", CFSTR(", "));
                v25 = objc_claimAutoreleasedReturnValue();

                v22 = (__CFString *)v25;
              }
              v26 = v22;
              objc_msgSend(v24, "candidate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v27);
              v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v49, v69, 16);
          }
          while (v20);
        }
        else
        {
          v22 = &stru_1EA1081D0;
        }

        -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](self, "logInlineCompletionsToTypology:candidate:", CFSTR("Sending cached inline completion to UI"), v22);
        v17 = v42;
        v13 = v43;
      }
      else
      {
        -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](self, "logInlineCompletionsToTypology:candidate:", CFSTR("Cached completions were found but suppressed: sending empty list to UI"), 0);
      }
    }
    if (v77 && v76[6] == 1)
      free(v77);
    v66 = (const KB::Candidate **)&v75;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
    v66 = (const KB::Candidate **)&v74;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
    v66 = (const KB::Candidate **)&v73;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
    v66 = v72;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v66);
  }
  else
  {
    objc_msgSend((id)v61[5], "inlineCompletions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend((id)v61[5], "corrections");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v61[5], "predictions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = 0;
  v46 = 0;
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v67);
  -[TIKeyboardInputManager reconcileInlineCompletionAndAutocorrections:inlineCompletions:predictions:outReconciledAutocorrections:outReconciledInlineCompletions:outReconciledPredictions:matchedStem:](self, "reconcileInlineCompletionAndAutocorrections:inlineCompletions:predictions:outReconciledAutocorrections:outReconciledInlineCompletions:outReconciledPredictions:matchedStem:", v28, v17, v29, &v48, &v47, &v46, v67);
  v30 = v48;
  v31 = v47;
  v32 = v46;
  if (v68 && v67[6] == 1)
    free(v68);

  v33 = v32;
  objc_msgSend(v30, "autocorrection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = v33;
  if (v34)
  {
    objc_msgSend(v30, "autocorrection");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager filterDuplicatePredictions:autocorrection:](self, "filterDuplicatePredictions:autocorrection:", v33, v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v37 = (void *)MEMORY[0x1E0DBDB48];
  objc_msgSend((id)v61[5], "emojiList");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v61[5], "proactiveTriggers");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "listWithCorrections:predictions:emojiList:inlineCompletionList:proactiveTriggers:", v30, v35, v38, v31, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  std::__optional_destruct_base<std::tuple<KB::CandidateCollection,KB::String>,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)buf);
  if (v81 && v80[6] == 1)
    free(v81);

  _Block_object_dispose(&v60, 8);
  return v40;
}

- (BOOL)shouldOfferStickers
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  BOOL v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v19;

  v19 = 0;
  +[_TILanguageLikelihoodModel sharedLanguageLikelihoodModel](_TILanguageLikelihoodModel, "sharedLanguageLikelihoodModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardState clientIdentifier](self->_keyboardState, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "emojiUsageCountForApp:lastEmojiCountUpdateTime:", v4, &v19);

  if (-[TIKeyboardInputManager isStickerSuggestionsEnabled](self, "isStickerSuggestionsEnabled"))
  {
    -[TIKeyboardInputManager stickerCandidateGenerator](self, "stickerCandidateGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }
  -[TIKeyboardState clientIdentifier](self->_keyboardState, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[TICandidateGatingManager stickerUsageCountForApp:](TICandidateGatingManager, "stickerUsageCountForApp:", v8);

  if (_os_feature_enabled_impl())
  {
    v11 = v5 > 2 || v9 != 0;
    v12 = v7 && v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "languageCode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "languageWithRegion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7
      && (v5 <= 2 ? (v17 = v9 == 0) : (v17 = 0), !v17 && objc_msgSend(v14, "hasPrefix:", CFSTR("en"))))
    {
      v12 = objc_msgSend(v16, "hasPrefix:", CFSTR("en"));
    }
    else
    {
      v12 = 0;
    }

  }
  if (self->_skipStickerSuggestionGating)
    return v7;
  else
    return v12;
}

- (void)finishGeneratingResponseKitProactiveSuggestions:(id)a3 candidateRange:(_NSRange)a4 completion:(id)a5
{
  NSUInteger length;
  NSUInteger v7;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSUInteger v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  char v48;
  uint64_t v49;
  void (**v50)(_QWORD, _QWORD);
  void *v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  BOOL v74;
  void *v75;
  void *v76;
  BOOL v77;
  id v78;
  NSUInteger v79;
  id v80;
  id v81;
  char v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *__p[2];
  char v89;
  _QWORD v90[2];
  char v91;
  _QWORD v92[4];
  id v93;
  uint64_t *v94;
  id v95;
  char v96;
  _QWORD v97[5];
  id v98;
  uint64_t *v99;
  uint64_t *v100;
  id v101;
  _QWORD v102[5];
  id v103;
  _QWORD aBlock[5];
  id v105;
  uint64_t *v106;
  id v107;
  id location;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t (*v118)(uint64_t, uint64_t);
  void (*v119)(uint64_t);
  id v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  id v126;
  uint8_t buf[4];
  void *v128;
  _QWORD v129[3];

  length = a4.length;
  v7 = a4.location;
  v129[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v121 = 0;
  v122 = &v121;
  v123 = 0x3032000000;
  v124 = __Block_byref_object_copy__10337;
  v125 = __Block_byref_object_dispose__10338;
  v87 = v9;
  v126 = v87;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  v115 = 0;
  v116 = &v115;
  v117 = 0x3032000000;
  v118 = __Block_byref_object_copy__10337;
  v119 = __Block_byref_object_dispose__10338;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "autofillContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0DBE418]);
  v120 = (id)objc_claimAutoreleasedReturnValue();

  if (!v116[5])
  {
    +[TIXPCUtils obtainApplicationIdentifierFromConnection:](TIXPCUtils, "obtainApplicationIdentifierFromConnection:", v11);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v116[5];
    v116[5] = v14;

  }
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__10337;
  v113 = __Block_byref_object_dispose__10338;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "autofillContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", *MEMORY[0x1E0DBE428]);
  v114 = (id)objc_claimAutoreleasedReturnValue();

  if (!v110[5])
  {
    +[TIXPCUtils obtainBundleIdentifierFromConnection:](TIXPCUtils, "obtainBundleIdentifierFromConnection:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v110[5];
    v110[5] = v18;

  }
  v86 = (void *)v11;
  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "asynchronous");

  objc_initWeak(&location, self);
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke;
  aBlock[3] = &unk_1EA100C90;
  aBlock[4] = self;
  v106 = &v121;
  v23 = v10;
  v105 = v23;
  objc_copyWeak(&v107, &location);
  v102[0] = v22;
  v102[1] = 3221225472;
  v102[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_2;
  v102[3] = &unk_1EA100CE0;
  v102[4] = self;
  v85 = _Block_copy(aBlock);
  v103 = v85;
  v24 = _Block_copy(v102);
  v97[0] = v22;
  v97[1] = 3221225472;
  v97[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_4;
  v97[3] = &unk_1EA100D30;
  v97[4] = self;
  objc_copyWeak(&v101, &location);
  v99 = &v115;
  v100 = &v109;
  v25 = v24;
  v98 = v25;
  v26 = _Block_copy(v97);
  v92[0] = v22;
  v92[1] = 3221225472;
  v92[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_7;
  v92[3] = &unk_1EA100D58;
  v94 = &v121;
  objc_copyWeak(&v95, &location);
  v82 = v21;
  v96 = v21;
  v27 = v26;
  v93 = v27;
  -[TIKeyboardInputManager setProactiveSuggestionsGenerationBlock:](self, "setProactiveSuggestionsGenerationBlock:", v92);
  v28 = v7 + length;
  -[TIKeyboardInputManager setLastNumCandidatesRequest:](self, "setLastNumCandidatesRequest:", v28);
  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "documentState");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v29;
  if ((objc_msgSend(v31, "documentIsEmpty") & 1) != 0)
  {
    v83 = v25;
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "responseContext");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      v34 = objc_msgSend(v29, "usePQT2Flow") ^ 1;
    }
    else
    {
      v80 = v27;
      v35 = v23;
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "inputContextHistory");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
        v34 = objc_msgSend(v29, "usePQT2Flow") ^ 1;
      else
        v34 = 0;

      v23 = v35;
      v27 = v80;
    }

    v25 = v83;
    if (v34)
    {
      v79 = v28;
      v81 = v27;
      objc_msgSend((id)v122[5], "corrections");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "autocorrection");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isContinuousPathConversion");

      if (v40)
      {
        v41 = v122[5];
        std::string::basic_string[abi:nn180100]<0>(v90, "Predictions");
        (*((void (**)(id, uint64_t, _QWORD *, _QWORD))v23 + 2))(v23, v41, v90, 0);
        v27 = v81;
        v42 = v84;
        if (v91 < 0)
        {
          v43 = (void *)v90[0];
LABEL_21:
          operator delete(v43);
          goto LABEL_24;
        }
      }
      else
      {
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "shiftState");

        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "responseContext");
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if (v54)
        {
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "responseContext");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v129[0] = v56;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v129, 1);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = -[TIKeyboardInputManager suggestionBlocklistMatchesStrings:](self, "suggestionBlocklistMatchesStrings:", v57);

        }
        else
        {
          v77 = 0;
        }
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        v78 = v23;
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            v68 = (void *)MEMORY[0x1E0CB3940];
            -[TIKeyboardInputManager keyboardState](self, "keyboardState");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "inputContextHistory");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "mostRecentTextEntryLogString");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "stringWithFormat:", CFSTR("%s InputContext Last Entry: %@"), "-[TIKeyboardInputManager finishGeneratingResponseKitProactiveSuggestions:candidateRange:completion:]", v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v128 = v72;
            _os_log_debug_impl(&dword_1DA6F2000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
        v74 = v52 != 2;
        +[TIResponseKitManager sharedTIResponseKitManager](TIResponseKitManager, "sharedTIResponseKitManager");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "responseContext");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "normalizedIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "clientIdentifier");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "recipientIdentifier");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v122[5];
        -[TIKeyboardInputManager proactiveSuggestionsGenerationBlock](self, "proactiveSuggestionsGenerationBlock");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        BYTE2(v73) = v82;
        BYTE1(v73) = v77;
        LOBYTE(v73) = v74;
        objc_msgSend(v59, "generateResponseKitSuggestionsForString:withLanguage:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:stringIsBlocklisted:async:completionHandler:", v60, v61, v63, v65, v66, v79, v73, v67);

        v23 = v78;
        v25 = v83;
        v27 = v81;
        v42 = v84;
      }
      goto LABEL_24;
    }
  }
  else
  {

  }
  objc_msgSend((id)v122[5], "corrections");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "autocorrection");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v45, "isContinuousPathConversion") & 1) == 0)
  {

    v42 = v84;
    goto LABEL_23;
  }
  -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
  v46 = v27;
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "asynchronous");

  v27 = v46;
  v42 = v84;
  if ((v48 & 1) == 0)
  {
LABEL_23:
    -[TIKeyboardInputManager proactiveSuggestionsGenerationBlock](self, "proactiveSuggestionsGenerationBlock");
    v50 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v50[2](v50, v122[5]);

    -[TIKeyboardInputManager setLastContinuousPathAutocorrection:](self, "setLastContinuousPathAutocorrection:", 0);
    goto LABEL_24;
  }
  -[TIKeyboardInputManager setLastContinuousPathAutocorrection:](self, "setLastContinuousPathAutocorrection:", v122[5]);
  v49 = v122[5];
  std::string::basic_string[abi:nn180100]<0>(__p, "Predictions");
  (*((void (**)(id, uint64_t, void **, _QWORD))v23 + 2))(v23, v49, __p, 0);
  if (v89 < 0)
  {
    v43 = __p[0];
    goto LABEL_21;
  }
LABEL_24:

  objc_destroyWeak(&v95);
  objc_destroyWeak(&v101);

  objc_destroyWeak(&v107);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v109, 8);

  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v121, 8);

}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  -[TIKeyboardInputManager setCandidateRange:](self, "setCandidateRange:", location, length);
  -[TIKeyboardInputManager openCandidateGenerationContextWithCandidateHandler:](self, "openCandidateGenerationContextWithCandidateHandler:", v10);

  -[TIKeyboardInputManager setKeyboardState:](self, "setKeyboardState:", v9);
  -[TIKeyboardInputManager setPhraseBoundaryIfNecessary](self, "setPhraseBoundaryIfNecessary");
  if ((*((_DWORD *)self->m_impl + 98) & 0x80000000) != 0)
  {
    objc_msgSend(v9, "inputForMarkedText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (!v12)
    {
      if ((objc_msgSend(v9, "needOneTimeCodeAutofill") & 1) != 0 || objc_msgSend(v9, "autofillMode") == 3)
      {
        -[TIKeyboardInputManager generateOneTimeCodeCandidatesWithKeyboardState:](self, "generateOneTimeCodeCandidatesWithKeyboardState:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
LABEL_8:
          objc_msgSend(MEMORY[0x1E0DBDBE0], "setWithCandidates:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", v14);

          goto LABEL_4;
        }

      }
      if (objc_msgSend(v9, "needCellularAutofill") && objc_msgSend(v9, "autofillMode") == 8)
      {
        -[TIKeyboardInputManager generateCellularCandidatesWithKeyboardState:](self, "generateCellularCandidatesWithKeyboardState:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
          goto LABEL_8;

      }
      if ((objc_msgSend(v9, "needAutofill") & 1) != 0
        || objc_msgSend(v9, "autofillMode") == 1
        || objc_msgSend(v9, "autofillMode") == 2
        || objc_msgSend(v9, "autofillMode") == 7)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __94__TIKeyboardInputManager_generateCandidatesWithKeyboardState_candidateRange_candidateHandler___block_invoke;
        v15[3] = &unk_1EA103228;
        v15[4] = self;
        -[TIKeyboardInputManager generateAutofillFormWithKeyboardState:completionHandler:](self, "generateAutofillFormWithKeyboardState:completionHandler:", v9, v15);
        goto LABEL_4;
      }
    }
  }
  -[TIKeyboardInputManager finishGeneratingCandidates](self, "finishGeneratingCandidates");
LABEL_4:

}

- (void)finishGeneratingCandidates
{
  id v3;
  _BOOL4 v4;
  id v5;

  -[TIKeyboardInputManager candidateResultSet](self, "candidateResultSet");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isDummySet") & 1) == 0)
  {
    v3 = v5;
    if (v5)
    {
      v4 = -[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection");
      v3 = v5;
      if (v4)
      {
        -[TIKeyboardInputManager setMarkedText](self, "setMarkedText");
        v3 = v5;
      }
    }
    -[TIKeyboardInputManager closeCandidateGenerationContextWithResults:](self, "closeCandidateGenerationContextWithResults:", v3);
  }

}

- (void)candidatesOfferedFeedback:(id)a3 keyboardState:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  TIStatisticsLogOfferedCandidateList(v8);
  if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
  {
    -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "candidatesOffered:keyboardState:", v8, v6);

  }
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
  {
    -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acceptingCandidateWithTrigger:", v5);

  }
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  TIKeyboardInputManagerKeyboardContext *v12;
  void *v13;
  TIKeyboardInputManagerKeyboardContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;

  v6 = a3;
  -[TIKeyboardInputManager setKeyboardState:](self, "setKeyboardState:", a4);
  -[TIKeyboardInputManager didAcceptCandidate:](self, "didAcceptCandidate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0DBDBF8]);
  -[TIKeyboardInputManager remainingInput](self, "remainingInput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setString:", v9);

  -[TIKeyboardInputManager clearInput](self, "clearInput");
  objc_msgSend(v8, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    v12 = [TIKeyboardInputManagerKeyboardContext alloc];
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TIKeyboardInputManagerKeyboardContext initWithKeyboardState:](v12, "initWithKeyboardState:", v13);

    -[TIKeyboardInputManager addInput:withContext:](self, "addInput:withContext:", v8, v14);
    -[TIKeyboardInputManagerKeyboardContext output](v14, "output");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertionText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[TIKeyboardInputManagerKeyboardContext output](v14, "output");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertionText");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v19;
      }
      else
      {
        -[TIKeyboardInputManagerKeyboardContext output](v14, "output");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "insertionText");
        v21 = (id)objc_claimAutoreleasedReturnValue();

        v7 = v22;
      }

      v7 = v21;
    }

  }
  self->super._hasHandledInput = 1;
  -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", 0);

  return v7;
}

- (id)generateReplacementsForString:(id)a3 keyLayout:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[TIKeyboardInputManager setKeyLayout:](self, "setKeyLayout:", a4);
  -[TIKeyboardInputManager candidatesForString:](self, "candidatesForString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (TIKeyboardLayout)keyLayout
{
  return self->_keyLayout;
}

- (unsigned)mapKeyboardLayoutKey:(unsigned __int16)a3
{
  return a3;
}

- (int64_t)performHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a3;
  objc_msgSend(a4, "keyLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager setKeyLayout:](self, "setKeyLayout:", v7);

  v8 = -[TIKeyboardInputManager addTouch:shouldHitTest:](self, "addTouch:shouldHitTest:", v6, 1);
  return v8;
}

- (void)skipHitTestForTouchEvent:(id)a3 keyboardState:(id)a4
{
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(a4, "keyLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager setKeyLayout:](self, "setKeyLayout:", v6);

  -[TIKeyboardInputManager addTouch:shouldHitTest:](self, "addTouch:shouldHitTest:", v7, 0);
}

- (_NSRange)smartSelectionRangeForTextInDocument:(id)a3 inRange:(_NSRange)a4 language:(id)a5 tokenizedRanges:(id)a6 options:(unint64_t)a7
{
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v7 = -[TISmartSelector selectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:](self->_smartSelector, "selectionRangeForTextInDocument:inRange:language:tokenizedRanges:options:", a3, a4.location, a4.length, a5, a6, a7);
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3
{
  -[TIKeyboardInputManager adjustPhraseBoundaryInForwardDirection:granularity:](self, "adjustPhraseBoundaryInForwardDirection:granularity:", a3, 0);
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  _BOOL4 v5;
  unint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  BOOL v13;

  v5 = a3;
  v7 = -[TIKeyboardInputManager phraseBoundary](self, "phraseBoundary");
  if (v7 > -[TIKeyboardInputManager inputCount](self, "inputCount")
    || !-[TIKeyboardInputManager supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary"))
  {
    return;
  }
  if (v5)
    v8 = 1;
  else
    v8 = -1;
  if (v5)
  {
    v9 = -[TIKeyboardInputManager inputCount](self, "inputCount");
    if (a4 < 2)
    {
      v10 = v9;
      goto LABEL_10;
    }
    v11 = -[TIKeyboardInputManager inputCount](self, "inputCount");
LABEL_17:
    -[TIKeyboardInputManager setPhraseBoundary:](self, "setPhraseBoundary:", v11);
    return;
  }
  v10 = 0;
  v11 = 0;
  if (a4 > 1)
    goto LABEL_17;
LABEL_10:
  if (v7 != v10)
  {
    v12 = v8 + v7;
    do
    {
      -[TIKeyboardInputManager setPhraseBoundary:](self, "setPhraseBoundary:", v12);
      if (-[TIKeyboardInputManager phraseBoundary](self, "phraseBoundary") != v7)
        break;
      v13 = v10 == v12;
      v12 += v8;
    }
    while (!v13);
  }
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  sqlite3 **v38;
  sqlite3 **v39;
  void *v40;
  void *v41;
  char v42;
  id v43;
  const char *v44;
  id v45;
  void *v46;
  int v47;
  void *m_impl;
  void *v49;
  KB *v50;
  void *v51;
  KB *v52;
  _DWORD *v53;
  unsigned int v54;
  unsigned int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD **v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  TITokenID v77;
  uint64_t v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  int v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  int v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void (**v104)(_QWORD, _QWORD);
  uint64_t v105;
  void *v106;
  char v107;
  id v108;
  id v109;
  unsigned __int16 v110[3];
  char v111;
  void *v112;
  unsigned __int16 v113[3];
  char v114;
  void *v115;
  uint64_t v116;

  v6 = a4;
  v116 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    if (objc_msgSend(v8, "isResponseKitCandidate"))
    {
      +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "usePQT2Flow");

      if (v11)
      {
        +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "candidate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "provideFeedbackForString:type:style:", v13, 1, 1);

      }
    }
  }
  if (v8 && self->m_impl)
  {
    if ((objc_msgSend(v8, "isAutocorrection") & 1) == 0)
    {
      -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isContinuousPathConversion") & 1) != 0)
        {
          -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "candidate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "candidate");
          v19 = v9;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v18, "isEqualToString:", v20);

          v9 = v19;
          if ((v107 & 1) != 0)
            goto LABEL_68;
        }
        else
        {

        }
      }
    }
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (objc_msgSend(v8, "isAutocorrection"))
      {
        -[TIKeyboardInputManager recordAcceptedAutocorrection:fromPredictiveInputBar:](self, "recordAcceptedAutocorrection:fromPredictiveInputBar:", v8, v6);
      }
      else
      {
        -[TIKeyboardInputManager recordRejectedAutocorrectionForAcceptedText:fromPredictiveInputBar:](self, "recordRejectedAutocorrectionForAcceptedText:fromPredictiveInputBar:", v8, v6);
        if (-[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase"))
        {
          if (v6)
          {
            objc_msgSend(v8, "candidate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "input");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "isEqualToString:", v23);

            if (v24)
            {
              -[TIKeyboardInputManager autocorrectionForCurrentStem](self, "autocorrectionForCurrentStem");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "input");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectForKey:", v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "input");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "rejectCandidate:forInput:hint:", v27, v29, 3);

            }
          }
        }
      }
      if ((objc_msgSend(v9, "isSynthesizedByAcceptingCandidate") & 1) != 0
        || !objc_msgSend(v8, "isAutocorrection"))
      {
        v36 = 0;
      }
      else
      {
        -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "input");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "autocorrection");
        v108 = v9;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "candidate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "candidate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "isEqualToString:", v35);

        v9 = v108;
      }
      -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "acceptText:isAutocorrection:isAutoshifted:", v8, v36, TIInputManager::is_autoshift((TIInputManager *)self->m_impl));

    }
    v38 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
    if (v38)
    {
      v39 = v38;
      if (objc_msgSend(v9, "isSynthesizedByAcceptingCandidate"))
      {
        objc_msgSend(v8, "input");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "candidate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v40, "isEqualToString:", v41);

        if ((v42 & 1) == 0)
        {
          objc_msgSend(v8, "input");
          v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v44 = (const char *)objc_msgSend(v43, "UTF8String");
          objc_msgSend(v8, "candidate");
          v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          TI::RejectionsDatabase::insert_acceptance(v39, v44, (const char *)objc_msgSend(v45, "UTF8String"), 1, 0);

        }
      }
    }
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    TIStatisticsLogCandidateAcceptance(v8, v46);

    if (!-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
    {
      v109 = v9;
      v47 = -[TIKeyboardInputManager shiftContext](self, "shiftContext");
      -[TIKeyboardInputManager inputStem](self, "inputStem");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      m_impl = self->m_impl;
      objc_msgSend(v8, "candidate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v49);
      v50 = (KB *)objc_claimAutoreleasedReturnValue();
      KB::utf8_string(v50, (uint64_t)v113);
      objc_msgSend(v8, "input");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v51);
      v52 = (KB *)objc_claimAutoreleasedReturnValue();
      KB::utf8_string(v52, (uint64_t)v110);
      TIInputManager::text_accepted((uint64_t)m_impl, v113, v110, objc_msgSend(v8, "wordOriginFeedbackID"), v47, objc_msgSend(v8, "isContinuousPathConversion"));
      if (v112 && v111 == 1)
        free(v112);

      if (v115 && v114 == 1)
        free(v115);

      -[TIKeyboardInputManager updateComposedText](self, "updateComposedText");
      if (!-[TIKeyboardInputManager shouldAllowCorrectionOfAcceptedCandidate:](self, "shouldAllowCorrectionOfAcceptedCandidate:", v8))
      {
        v53 = self->m_impl;
        v54 = v53[24];
        v55 = v53[43];
        if (v55 <= v54)
          v55 = v53[24];
        if (v53[44] < v54)
          v54 = v53[44];
        v53[43] = v55;
        v53[44] = v54;
      }
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "documentState");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "input");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "candidate");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "documentStateAfterReplacingText:withText:", v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setDocumentState:", v60);

      if (objc_msgSend(v8, "isContinuousPathConversion"))
      {
        v62 = (_QWORD **)self->m_impl;
        (*(void (**)(_QWORD *))(*v62[23] + 352))(v62[23]);
        *((_DWORD *)v62 + 98) = -1;
        KB::ContinuousPathDetector::clear_completed_paths(v62 + 41);
        -[TIKeyboardInputManager config](self, "config");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "usesContinuousPathRetrocorrection");

        if ((v64 & 1) != 0 && !v6)
          -[TIKeyboardInputManager trimInputAfterLathamConversion](self, "trimInputAfterLathamConversion");
        else
          -[TIKeyboardInputManager dropInput](self, "dropInput");
      }
      else
      {
        -[TIKeyboardInputManager updateComposedText](self, "updateComposedText");
        -[TIKeyboardInputManager updateInputContext](self, "updateInputContext");
      }
      if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
      {
        objc_msgSend(v8, "candidateByReplacingWithSourceMask:", -[TIKeyboardInputManager adjustedSourceMaskFromCandidate:](self, "adjustedSourceMaskFromCandidate:", v8));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "documentState");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager inputContext](self, "inputContext");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v105) = 0;
        objc_msgSend(v66, "candidateAccepted:withInput:documentState:inputContext:inputStem:predictionBarHit:useCandidateSelection:candidateIndex:keyboardState:", v65, v109, v68, v69, v106, v6, v105, 0x7FFFFFFFFFFFFFFFLL, v70);

      }
      -[TIKeyboardInputManager hitTestCorrectedInputMatchingCandidate](self, "hitTestCorrectedInputMatchingCandidate");
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v109;
      if (v71)
      {
        if ((objc_msgSend(v8, "isAutocorrection") & 1) == 0)
        {
          objc_msgSend(v8, "input");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager hitTestCorrectedInputMatchingCandidate](self, "hitTestCorrectedInputMatchingCandidate");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "input");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = objc_msgSend(v72, "isEqualToString:", v74);

          if (v75)
          {
            objc_msgSend(v8, "input");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = -[TIKeyboardInputManager findTokenIDForWord:contextTokens:tokenLookupMode:](self, "findTokenIDForWord:contextTokens:tokenLookupMode:", v76, 0, 0);

            if (HIDWORD(*(unint64_t *)&v77))
            {
              v78 = *MEMORY[0x1E0DBE548];
              -[TIKeyboardInputManager hitTestCorrectedInputMatchingCandidate](self, "hitTestCorrectedInputMatchingCandidate");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              -[TIKeyboardInputManager incrementUsageTrackingKeyForAutocorrectionStatistic:autocorrectionTypes:](self, "incrementUsageTrackingKeyForAutocorrectionStatistic:autocorrectionTypes:", v78, objc_msgSend(v79, "usageTrackingMask"));

            }
          }
        }
        -[TIKeyboardInputManager setHitTestCorrectedInputMatchingCandidate:](self, "setHitTestCorrectedInputMatchingCandidate:", 0);
      }
      -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
      v80 = (void *)objc_claimAutoreleasedReturnValue();

      if (v80)
        -[TIKeyboardInputManager setRejectedConversionsForCurrentContinuousPath:](self, "setRejectedConversionsForCurrentContinuousPath:", 0);
      v81 = v8;
      v82 = v81;
      if (objc_msgSend(v81, "isContinuousPathConversion"))
      {
        objc_msgSend(v81, "candidate");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v83, "hasPrefix:", v84);

        v82 = v81;
        if (v85)
        {
          objc_msgSend(v81, "candidate");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "substringFromIndex:", objc_msgSend(v87, "length"));
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "candidateByReplacingWithCandidate:", v88);
          v82 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", v82);
      -[TIKeyboardInputManager refreshInputManagerState](self, "refreshInputManagerState");
      if (!objc_msgSend(v81, "isContinuousPathConversion"))
        goto LABEL_67;
      -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = objc_msgSend(v89, "asynchronous");

      if (!v90)
        goto LABEL_67;
      -[TIKeyboardInputManager predictionCandidates:predictionType:](self, "predictionCandidates:predictionType:", 4, 3);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "proactiveTriggers");
      v92 = objc_claimAutoreleasedReturnValue();
      if (v92)
      {
        v93 = (void *)v92;
        -[TIKeyboardInputManager lastContinuousPathAutocorrection](self, "lastContinuousPathAutocorrection");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "emojiList");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v95, "count"))
        {

          v9 = v109;
        }
        else
        {
          -[TIKeyboardInputManager proactiveSuggestionsGenerationBlock](self, "proactiveSuggestionsGenerationBlock");
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          v9 = v109;
          if (v98)
          {
            v99 = (void *)MEMORY[0x1E0DBDB48];
            -[TIKeyboardInputManager lastContinuousPathAutocorrection](self, "lastContinuousPathAutocorrection");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "corrections");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "proactiveTriggers");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "listWithCorrections:predictions:emojiList:proactiveTriggers:", v101, 0, 0, v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();

            -[TIKeyboardInputManager proactiveSuggestionsGenerationBlock](self, "proactiveSuggestionsGenerationBlock");
            v104 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v104)[2](v104, v103);

            goto LABEL_66;
          }
        }
      }
      -[TIKeyboardInputManager candidateHandlerForOpenRequest](self, "candidateHandlerForOpenRequest");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "close");

      -[TIKeyboardInputManager setCandidateHandlerForOpenRequest:](self, "setCandidateHandlerForOpenRequest:", 0);
LABEL_66:

LABEL_67:
      -[TIKeyboardInputManager autocorrectionForCurrentStem](self, "autocorrectionForCurrentStem");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "removeAllObjects");

      -[TIKeyboardInputManager setDeleteKeyCount:](self, "setDeleteKeyCount:", 0);
    }
  }
LABEL_68:

}

- (id)suffixOfDesiredString:(id)a3 toAppendToInputString:(id)a4 withInputIndex:(unint64_t)a5 afterDeletionCount:(unint64_t *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  unint64_t v14;
  void *v15;

  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (a6)
    *a6 = 0;
  if (objc_msgSend(v10, "length") < a5)
    a5 = objc_msgSend(v11, "length");
  if (a5)
  {
    do
    {
      objc_msgSend(v11, "substringToIndex:", a5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v9, "hasPrefix:", v12);

      if ((v13 & 1) != 0)
        break;
      v14 = objc_msgSend(v11, "_rangeOfBackwardDeletionClusterAtIndex:", a5 - 1);
      a5 = v14;
      if (a6)
        ++*a6;
    }
    while (v14);
  }
  objc_msgSend(v9, "substringFromIndex:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)deletedSuffixOfInputContext:(id)a3 whenDeletingFromInputString:(id)a4 withInputIndex:(unint64_t)a5 deletionCount:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __CFString *v16;

  v9 = a3;
  v10 = a4;
  if (a6)
  {
    objc_msgSend(v9, "stringByAppendingString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "length") + a5;
    if (v12)
    {
      v13 = 0;
      while (1)
      {
        v14 = objc_msgSend(v11, "_rangeOfBackwardDeletionClusterAtIndex:", v12 - 1);
        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v15 = v14;
        ++v13;
        if (v14)
        {
          v12 = v14;
          if (v13 < a6)
            continue;
        }
        goto LABEL_11;
      }
      v15 = v12;
    }
    else
    {
      v15 = 0;
      v13 = 0;
    }
LABEL_11:
    if (v13 == a6 && v15 < objc_msgSend(v9, "length"))
    {
      objc_msgSend(v9, "substringFromIndex:", v15);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = &stru_1EA1081D0;
    }

  }
  else
  {
    v16 = &stru_1EA1081D0;
  }

  return v16;
}

- (BOOL)removeSuffixOfInputContext:(id)a3
{
  return 0;
}

- (id)didAcceptCandidate:(id)a3
{
  return 0;
}

- (id)remainingInput
{
  return 0;
}

- (BOOL)stringEndsWord:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TIKeyboardInputManager currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stringEndsWord:", v4);

  return v6;
}

- (BOOL)acceptInputString:(id)a3
{
  return 1;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deletesByComposedCharacterSequence");

  return v3;
}

- (void)updateComposedText
{
  unsigned __int16 *m_impl;
  const KB::String *v4;
  void *v5;
  void *v6;
  _BYTE v7[8];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  m_impl = (unsigned __int16 *)self->m_impl;
  if (m_impl && self->m_composedText)
  {
    TIInputManager::input_substring(m_impl + 4, 0, -858993459 * ((*((_QWORD *)m_impl + 2) - *((_QWORD *)m_impl + 1)) >> 3), (uint64_t)v7);
    KB::ns_string((KB *)v7, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (v7[6] == 1)
        free(v8);
    }
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableString setString:](self->m_composedText, "setString:", v6);

  }
}

- (unsigned)externalIndexToInternal:(unsigned int)a3
{
  unsigned int v3;
  _QWORD *m_impl;
  NSMutableString *m_composedText;
  void *v7;
  void *v8;
  unsigned int v9;

  v3 = a3;
  m_impl = self->m_impl;
  if (!m_impl)
    return v3;
  m_composedText = self->m_composedText;
  if (m_composedText)
  {
    if (-[NSMutableString length](m_composedText, "length") <= (unint64_t)a3)
    {
      -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", self->m_composedText);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "length");
    }
    else
    {
      -[NSMutableString substringToIndex:](self->m_composedText, "substringToIndex:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v8, "length");

    }
    m_impl = self->m_impl;
    if (!m_impl)
      return v3;
  }
  v9 = -858993459 * ((m_impl[2] - m_impl[1]) >> 3);
  if (v3 >= v9)
    return v9;
  else
    return v3;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dictionaryUsesExternalEncoding");

  return v3;
}

- (id)dictionaryStringForExternalString:(id)a3
{
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TIKeyboardInputManager dictionaryUsesExternalEncoding](self, "dictionaryUsesExternalEncoding"))
  {
    v5 = v4;
  }
  else
  {
    -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)externalStringForDictionaryString:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[TIKeyboardInputManager dictionaryUsesExternalEncoding](self, "dictionaryUsesExternalEncoding"))
  {
    v5 = v4;
  }
  else
  {
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)initImplementation
{
  void *result;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  result = self->m_impl;
  if (!result)
  {
    -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->m_impl = (void *)objc_msgSend(v4, "createInputManager");

    if (self->m_impl)
    {
      -[TIKeyboardInputManager config](self, "config");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "usesContinuousPathRetrocorrection");

      result = self->m_impl;
      if (v6)
      {
        v7 = *((_QWORD *)result + 23);
        if (v7)
        {
          (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)v7 + 392))(*((_QWORD *)result + 23), 1);
          return self->m_impl;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)lexiconLocales
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- ($71865D49803C3560DF570D424868A38C)lexiconInformation
{
  void *v5;
  void *v6;
  KB *v7;
  KB *v8;
  KB *v9;
  KB *v10;
  KB *v11;
  char *v12;
  char *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  char v17;
  $71865D49803C3560DF570D424868A38C *result;
  _BYTE v19[8];
  void *v20;
  _BYTE v21[8];
  void *v22;
  _BYTE v23[8];
  void *v24;
  _BYTE v25[8];
  void *v26;
  _WORD v27[3];
  char v28;
  char *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localeIdentifier");
  v7 = (KB *)objc_claimAutoreleasedReturnValue();

  KB::utf8_string(v7, (uint64_t)v27);
  -[TIKeyboardInputManager pathToStaticDictionary](self, "pathToStaticDictionary");
  v8 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v8, (uint64_t)v25);

  -[TIKeyboardInputManager pathToDeltaStaticDictionary](self, "pathToDeltaStaticDictionary");
  v9 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v9, (uint64_t)v23);

  -[TIKeyboardInputManager pathToPhraseDictionary](self, "pathToPhraseDictionary");
  v10 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v10, (uint64_t)v21);

  -[TIKeyboardInputManager pathToDynamicDictionary](self, "pathToDynamicDictionary");
  v11 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v11, (uint64_t)v19);

  v12 = v29;
  if (!v29)
    v12 = (char *)v30;
  if (v27[0])
    v13 = v12;
  else
    v13 = "";
  v14 = TILexiconIDForLocaleIdentifier(v13);
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "wantsMultilingualUnionOVS"))
  {
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "wantsMultilingualUnionOVS");

  }
  else
  {
    v17 = 0;
  }

  KB::String::String((KB::String *)retstr, (const KB::String *)v27);
  KB::String::String((KB::String *)&retstr->var1, (const KB::String *)v25);
  KB::String::String((KB::String *)&retstr->var2, (const KB::String *)v23);
  KB::String::String((KB::String *)&retstr->var3, (const KB::String *)v21);
  KB::String::String((KB::String *)&retstr->var4, (const KB::String *)v19);
  retstr->var5 = v14;
  retstr->var6 = v17;
  retstr->var7 = 1.0;
  if (v20 && v19[6] == 1)
    free(v20);
  if (v22 && v21[6] == 1)
    free(v22);
  if (v24 && v23[6] == 1)
    free(v24);
  if (v26 && v25[6] == 1)
    free(v26);
  if (v29 && v28 == 1)
    free(v29);

  return result;
}

- (void)loadDictionaries
{
  NSObject *v3;
  TIInputManager *m_impl;
  void *v5;
  KB *v6;
  _WORD *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64x2_t v20;
  char *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30[3];
  __int128 v31;
  char *v32;
  unint64_t v33;
  int64x2_t v34;
  unint64_t v35;
  char **v36;
  _OWORD buf[2];
  char v38;
  void *v39;
  char v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (self->m_impl)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Loading/reloading dictionaries."), "-[TIKeyboardInputManager loadDictionaries]");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0]) = 138412290;
        *(_QWORD *)((char *)buf + 4) = v26;
        _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);

      }
    }
    m_impl = (TIInputManager *)self->m_impl;
    -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageWithRegion");
    v6 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v6, (uint64_t)buf);
    TIInputManager::set_locale_identifier(m_impl, (const KB::String *)buf);
    if (*((_QWORD *)&buf[0] + 1) && BYTE6(buf[0]) == 1)
      free(*((void **)&buf[0] + 1));

    -[TIKeyboardInputManager lexiconInformation](self, "lexiconInformation");
    v7 = operator new(0xB0uLL);
    *(_QWORD *)&v31 = v7;
    v32 = (char *)(v7 + 88);
    std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo const&,KB::LexiconInfo*>((uint64_t)v7, (uint64_t)buf);
    *((_QWORD *)&v31 + 1) = v7 + 88;
    if (v45 && v44 == 1)
      free(v45);
    if (v43 && v42 == 1)
      free(v43);
    if (v41 && v40 == 1)
      free(v41);
    if (v39 && v38 == 1)
      free(v39);
    if (*((_QWORD *)&buf[0] + 1) && BYTE6(buf[0]) == 1)
      free(*((void **)&buf[0] + 1));
    if (v7[16])
    {
      -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "languageWithRegion");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v10 = TIMultilingualDynamicModelEnabled((char *)objc_msgSend(v9, "UTF8String"));

      if (v10)
      {
        -[TIKeyboardInputManager lexiconInfoForMultilingualDynamic](self, "lexiconInfoForMultilingualDynamic");
        if (*((_QWORD *)&v31 + 1) >= (unint64_t)v32)
        {
          v13 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((_QWORD *)&v31 + 1) - v31) >> 4);
          if ((unint64_t)(v13 + 1) > 0x1745D1745D1745DLL)
            abort();
          v14 = 0x5D1745D1745D1746 * ((uint64_t)&v32[-v31] >> 4);
          if (v14 <= v13 + 1)
            v14 = v13 + 1;
          if ((unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)&v32[-v31] >> 4)) >= 0xBA2E8BA2E8BA2ELL)
            v15 = 0x1745D1745D1745DLL;
          else
            v15 = v14;
          v36 = &v32;
          if (v15)
            v15 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<KB::LexiconInfo>>(v15);
          else
            v16 = 0;
          v17 = v15 + 16 * ((uint64_t)(*((_QWORD *)&v31 + 1) - v31) >> 4);
          v33 = v15;
          v34.i64[0] = v17;
          v35 = v15 + 176 * v16;
          std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v17, (uint64_t)buf);
          v11 = v17 + 176;
          v34.i64[1] = v17 + 176;
          v18 = *((_QWORD *)&v31 + 1);
          v19 = v34.i64[0];
          if (*((_QWORD *)&v31 + 1) == (_QWORD)v31)
          {
            v20 = vdupq_n_s64(*((unint64_t *)&v31 + 1));
          }
          else
          {
            do
            {
              v18 -= 176;
              v19 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(v19 - 176, v18);
            }
            while (v18 != (_QWORD)v31);
            v20 = (int64x2_t)v31;
            v11 = v34.i64[1];
          }
          *(_QWORD *)&v31 = v19;
          *((_QWORD *)&v31 + 1) = v11;
          v34 = v20;
          v21 = v32;
          v32 = (char *)v35;
          v35 = (unint64_t)v21;
          v33 = v20.i64[0];
          std::__split_buffer<KB::LexiconInfo>::~__split_buffer((uint64_t)&v33);
        }
        else
        {
          v11 = std::construct_at[abi:nn180100]<KB::LexiconInfo,KB::LexiconInfo,KB::LexiconInfo*>(*((uint64_t *)&v31 + 1), (uint64_t)buf)+ 176;
        }
        *((_QWORD *)&v31 + 1) = v11;
        if (v45 && v44 == 1)
          free(v45);
        if (v43 && v42 == 1)
          free(v43);
        if (v41 && v40 == 1)
          free(v41);
        if (v39 && v38 == 1)
          free(v39);
        if (*((_QWORD *)&buf[0] + 1) && BYTE6(buf[0]) == 1)
          free(*((void **)&buf[0] + 1));
      }
      -[TIKeyboardInputManager config](self, "config");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isTesting");

      v24 = self->m_impl;
      memset(v30, 0, sizeof(v30));
      std::vector<KB::LexiconInfo>::__init_with_size[abi:nn180100]<KB::LexiconInfo*,KB::LexiconInfo*>(v30, v31, *((uint64_t *)&v31 + 1), 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((_QWORD *)&v31 + 1) - v31) >> 4));
      TIInputManager::load_dictionaries((uint64_t)v24, v30, v10, v23, 0);
      *(_QWORD *)&buf[0] = v30;
      std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
      v25 = *((_QWORD *)self->m_impl + 28);
      if (v25)
      {
        if (**(_QWORD **)(v25 + 8) != *(_QWORD *)(*(_QWORD *)(v25 + 8) + 8))
          -[TIKeyboardInputManager loadFavoniusTypingModel](self, "loadFavoniusTypingModel");
      }
    }
    else
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%s WARNING: Input manager failed to load static dictionary for: %@"), "-[TIKeyboardInputManager loadDictionaries]", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf[0]) = 138412290;
        *(_QWORD *)((char *)buf + 4) = v29;
        _os_log_debug_impl(&dword_1DA6F2000, v12, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);

      }
    }
    *(_QWORD *)&buf[0] = &v31;
    std::vector<KB::LexiconInfo>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  }
}

- ($71865D49803C3560DF570D424868A38C)lexiconInfoForInputMode:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  char v11;
  String *p_var1;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  KB *v16;
  KB *v17;
  KB *v18;
  KB *v19;
  $71865D49803C3560DF570D424868A38C *result;
  _BYTE v21[6];
  char v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  v10 = TILexiconIDForLocaleIdentifier((char *)objc_msgSend(v9, "UTF8String"));
  if (objc_msgSend(v6, "wantsMultilingualUnionOVS"))
    v11 = objc_msgSend(v6, "wantsMultilingualUnionOVS");
  else
    v11 = 0;
  KB::utf8_string((KB *)v9, (uint64_t)retstr);
  *(_DWORD *)&retstr->var1.var0 = 0x100000;
  p_var1 = &retstr->var1;
  p_var1->var2 = 0;
  p_var1->var3 = 0;
  p_var1->var4 = 0;
  p_var1->var5[0] = 0;
  *(_DWORD *)&p_var1[1].var0 = 0x100000;
  v13 = (uint64_t)&p_var1[1];
  p_var1[1].var2 = 0;
  p_var1[1].var3 = 0;
  p_var1[1].var4 = 0;
  p_var1[1].var5[0] = 0;
  *(_DWORD *)&p_var1[2].var0 = 0x100000;
  v14 = (uint64_t)&p_var1[2];
  p_var1[2].var2 = 0;
  p_var1[2].var3 = 0;
  p_var1[2].var4 = 0;
  p_var1[2].var5[0] = 0;
  *(_DWORD *)&p_var1[3].var0 = 0x100000;
  v15 = (uint64_t)&p_var1[3];
  p_var1[3].var2 = 0;
  p_var1[3].var3 = 0;
  p_var1[3].var4 = 0;
  p_var1[3].var5[0] = 0;
  *(_DWORD *)&p_var1[4].var0 = v10;
  LOBYTE(p_var1[4].var2) = v11;
  LODWORD(p_var1[4].var4) = 0;
  -[TIKeyboardInputManager staticDictionaryPathForInputMode:](self, "staticDictionaryPathForInputMode:", v6);
  v16 = (KB *)objc_claimAutoreleasedReturnValue();
  if (-[KB length](v16, "length"))
  {
    KB::utf8_string(v16, (uint64_t)v21);
    KB::String::operator=((uint64_t)p_var1, (KB::String *)v21);
    if (v23)
    {
      if (v22 == 1)
        free(v23);
    }
  }
  -[TIKeyboardInputManager deltaDictionaryPathForInputMode:](self, "deltaDictionaryPathForInputMode:", v6);
  v17 = (KB *)objc_claimAutoreleasedReturnValue();
  if (-[KB length](v17, "length"))
  {
    KB::utf8_string(v17, (uint64_t)v21);
    KB::String::operator=(v13, (KB::String *)v21);
    if (v23)
    {
      if (v22 == 1)
        free(v23);
    }
  }
  -[TIKeyboardInputManager phraseDictionaryPathForInputMode:](self, "phraseDictionaryPathForInputMode:", v6);
  v18 = (KB *)objc_claimAutoreleasedReturnValue();
  if (-[KB length](v18, "length"))
  {
    KB::utf8_string(v18, (uint64_t)v21);
    KB::String::operator=(v14, (KB::String *)v21);
    if (v23)
    {
      if (v22 == 1)
        free(v23);
    }
  }
  -[TIKeyboardInputManager dynamicDictionaryPathForInputMode:](self, "dynamicDictionaryPathForInputMode:", v6);
  v19 = (KB *)objc_claimAutoreleasedReturnValue();
  if (-[KB length](v19, "length"))
  {
    KB::utf8_string(v19, (uint64_t)v21);
    KB::String::operator=(v15, (KB::String *)v21);
    if (v23)
    {
      if (v22 == 1)
        free(v23);
    }
  }

  return result;
}

- ($71865D49803C3560DF570D424868A38C)lexiconInfoForMultilingualDynamic
{
  String *p_var4;
  KB *v6;
  $71865D49803C3560DF570D424868A38C *result;
  _BYTE v8[8];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  KB::utf8_string((KB *)CFSTR("mul"), (uint64_t)retstr);
  *(_DWORD *)&retstr->var4.var0 = 0x100000;
  p_var4 = &retstr->var4;
  *(_DWORD *)&p_var4[-3].var0 = 0x100000;
  p_var4[-3].var2 = 0;
  p_var4[-3].var3 = 0;
  p_var4[-3].var4 = 0;
  p_var4[-3].var5[0] = 0;
  *(_DWORD *)&p_var4[-2].var0 = 0x100000;
  p_var4[-2].var2 = 0;
  p_var4[-2].var3 = 0;
  p_var4[-2].var4 = 0;
  p_var4[-2].var5[0] = 0;
  *(_DWORD *)&p_var4[-1].var0 = 0x100000;
  p_var4[-1].var2 = 0;
  p_var4[-1].var3 = 0;
  p_var4[-1].var4 = 0;
  p_var4[-1].var5[0] = 0;
  p_var4->var2 = 0;
  p_var4->var3 = 0;
  p_var4->var4 = 0;
  p_var4->var5[0] = 0;
  *(_DWORD *)&p_var4[1].var0 = -2;
  LOBYTE(p_var4[1].var2) = 0;
  LODWORD(p_var4[1].var4) = 1065353216;
  -[TIKeyboardInputManager multilingualDynamicDictionaryPath](self, "multilingualDynamicDictionaryPath");
  v6 = (KB *)objc_claimAutoreleasedReturnValue();
  if (-[KB length](v6, "length"))
  {
    KB::utf8_string(v6, (uint64_t)v8);
    KB::String::operator=((uint64_t)p_var4, (KB::String *)v8);
    if (v9)
    {
      if (v8[6] == 1)
        free(v9);
    }
  }

  return result;
}

- (id)staticDictionaryPathForInputMode:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v20;
  unint64_t v21;
  const char *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[TIKeyboardInputManager config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "usesCustomStaticDictionary");

    if (!v6)
    {
      objc_msgSend(v4, "normalizedIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = TIInputModeUseMorphemeLevelLexicon();

      if (v17)
        UIKeyboardMorphemeLexiconPathForInputMode(v4);
      else
        UIKeyboardUnigramLexiconPathForInputMode(v4);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel >= 2)
      {
        TIOSLogFacility();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v20 = (void *)MEMORY[0x1E0CB3940];
          v21 = -[TIKeyboardInputManager linguisticResourceStatus](self, "linguisticResourceStatus");
          if (v21 > 2)
            v22 = "Unknown";
          else
            v22 = off_1EA101280[v21];
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%s linguisticResourceStatus: %s, staticDictPath: %s"), "-[TIKeyboardInputManager staticDictionaryPathForInputMode:]", v22, objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v25 = v23;
          _os_log_debug_impl(&dword_1DA6F2000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        }
      }
      goto LABEL_15;
    }
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[TIKeyboardInputManager config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "staticDictionaryPath");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0DBE180];
    objc_msgSend(v4, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@%@.dat"), v9, v10, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v14, "fileExistsAtPath:", v13);

    if ((v9 & 1) != 0)
    {
LABEL_15:
      v13 = v13;
      v15 = v13;
      goto LABEL_16;
    }
  }
  else
  {
    v13 = 0;
  }
  v15 = 0;
LABEL_16:

  return v15;
}

- (id)pathToStaticDictionary
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager staticDictionaryPathForInputMode:](self, "staticDictionaryPathForInputMode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s WARNING: Static dictionary not found"), "-[TIKeyboardInputManager pathToStaticDictionary]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  return v4;
}

- (id)deltaDictionaryPathForInputMode:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (!v4)
  {
    v14 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  -[TIKeyboardInputManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesCustomStaticDictionary");

  if (!v6)
  {
    UIKeyboardDeltaLexiconPathForInputMode(v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardInputManager config](self, "config");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "staticDictionaryPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DBDFC0];
  objc_msgSend(v4, "languageWithRegion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@%@.dat"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v13, "fileExistsAtPath:", v12);

  if ((v8 & 1) != 0)
  {
LABEL_7:
    v14 = v12;
    v12 = v14;
    goto LABEL_8;
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (id)pathToDeltaStaticDictionary
{
  void *v3;
  void *v4;

  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager deltaDictionaryPathForInputMode:](self, "deltaDictionaryPathForInputMode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)phraseDictionaryPathForInputMode:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (!v4)
  {
    v14 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  -[TIKeyboardInputManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "usesCustomStaticDictionary");

  if (!v6)
  {
    UIKeyboardPhraseLexiconPathForInputMode(v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[TIKeyboardInputManager config](self, "config");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "staticDictionaryPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DBE050];
  objc_msgSend(v4, "languageWithRegion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@/%@%@.dat"), v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v13, "fileExistsAtPath:", v12);

  if ((v8 & 1) != 0)
  {
LABEL_7:
    v14 = v12;
    v12 = v14;
    goto LABEL_8;
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (id)pathToPhraseDictionary
{
  void *v3;
  void *v4;

  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager phraseDictionaryPathForInputMode:](self, "phraseDictionaryPathForInputMode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dynamicDictionaryPathForInputMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    objc_msgSend(a3, "languageWithRegion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager config](self, "config");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dynamicResourcePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIKeyboardDynamicDictionaryFileWithSiriMode(v4, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)multilingualDynamicDictionaryPath
{
  void *v2;
  void *v3;
  void *v4;

  -[TIKeyboardInputManager config](self, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dynamicResourcePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKeyboardDynamicDictionaryFileWithSiriMode(CFSTR("mul"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)languageModelAssets
{
  void *v3;
  void *v4;

  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager languageModelAssetsForInputMode:](self, "languageModelAssetsForInputMode:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)pathToDynamicDictionary
{
  void *v3;
  void *v4;
  void *v5;

  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager dynamicDictionaryPathForInputMode:](self, "dynamicDictionaryPathForInputMode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (shared_ptr<KB::LanguageModel>)loadNewLanguageModel
{
  _QWORD *v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  TIKeyboardInputManager *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  LanguageModel *v32;
  __shared_weak_count *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD v44[5];
  TIKeyboardInputManager *v45;
  _QWORD v46[3];
  shared_ptr<KB::LanguageModel> result;

  v38 = v2;
  v46[1] = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HIDWORD(v35) = objc_msgSend(v4, "usesWordNgramModel");

  -[TIKeyboardInputManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "usesAdaptation"))
  {
    -[TIKeyboardInputManager dynamicResourcePath](self, "dynamicResourcePath");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }

  -[TIKeyboardInputManager config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "usesCustomNgramModel"))
  {
    -[TIKeyboardInputManager config](self, "config");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ngramModelPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
    v9 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  -[TIKeyboardInputManager languageModelAssets](self, "languageModelAssets");
  v10 = objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[TITrialManagerProxy sharedManager](TITrialManagerProxy, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "locale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodedLMTrialParametersForLocale:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "preferredModelLocaleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v11, "preferredModelLocaleIsMultilingual");
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSiriMode");
  LOBYTE(v35) = objc_msgSend(v11, "doesSupportInlineCompletion");
  v36 = (void *)v10;
  BYTE2(v34) = v18;
  LOWORD(v34) = 0;
  v37 = (void *)v9;
  +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v15, v16, v9, v39, v10, HIDWORD(v35), v34, v14, v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "clientIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "recipientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__10337;
  v44[4] = __Block_byref_object_dispose__10338;
  v24 = self;
  v45 = v24;
  -[TIKeyboardInputManager keyboardState](v24, "keyboardState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "clientIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](v24, "keyboardState");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "recipientIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager lexiconLocales](v24, "lexiconLocales");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __46__TIKeyboardInputManager_loadNewLanguageModel__block_invoke;
  v40[3] = &unk_1EA100DA8;
  v30 = v21;
  v41 = v30;
  v43 = v44;
  v31 = v23;
  v42 = v31;
  if (v19)
  {
    objc_msgSend(v19, "sharedLanguageModelForClient:withRecipient:forLanguageLocales:completion:", v26, v28, v29, v40);
  }
  else
  {
    *v38 = 0;
    v38[1] = 0;
  }

  _Block_object_dispose(v44, 8);
  result.__cntrl_ = v33;
  result.__ptr_ = v32;
  return result;
}

- (BOOL)updateLanguageModelForKeyboardState
{
  void *m_impl;
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t *v12;
  unint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  _QWORD *v18;
  unsigned int *v19;
  unsigned int v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  __n128 v24;
  unint64_t *v25;
  unint64_t v26;
  void *v27;
  _QWORD *v28;
  unsigned int *v29;
  unsigned int v30;
  void *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  uint64_t *v42;
  unint64_t v43;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  uint64_t v48[2];
  unsigned int *v49;
  __n128 v50;
  uint64_t v51;
  std::__shared_weak_count *v52;

  -[TIKeyboardInputManager loadNewLanguageModel](self, "loadNewLanguageModel");
  m_impl = self->m_impl;
  v5 = *((_QWORD *)m_impl + 29);
  v4 = (std::__shared_weak_count *)*((_QWORD *)m_impl + 30);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = v51;
  if (v51 != v5)
  {
    v9 = self->m_impl;
    if (v52)
    {
      v10 = &v52->__shared_owners_;
      do
        v11 = __ldxr((unint64_t *)v10);
      while (__stxr(v11 + 1, (unint64_t *)v10));
      std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](v9 + 29, v51, (uint64_t)v52);
      v12 = &v52->__shared_owners_;
      do
        v13 = __ldaxr((unint64_t *)v12);
      while (__stlxr(v13 - 1, (unint64_t *)v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
        std::__shared_weak_count::__release_weak(v52);
      }
    }
    else
    {
      std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](v9 + 29, v51, 0);
    }
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v51 + 32))(v51))
    {
      -[TIKeyboardInputManager config](self, "config");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isTesting");

      -[TIKeyboardInputManager config](self, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "maxWordsPerPrediction");

      v18 = self->m_impl;
      v19 = (unsigned int *)v18[28];
      v49 = v19;
      if (v19)
      {
        do
          v20 = __ldaxr(v19);
        while (__stlxr(v20 + 1, v19));
        v18 = self->m_impl;
      }
      v21 = (std::__shared_weak_count *)v18[30];
      v48[0] = v18[29];
      v48[1] = (uint64_t)v21;
      if (v21)
      {
        v22 = (unint64_t *)&v21->__shared_owners_;
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 1, v22));
      }
      KB::NgramCandidateRefinery::create(&v49, v48, v17, v15, (std::__shared_weak_count **)&v50);
      v24 = v50;
      v50 = 0uLL;
      v45 = v24;
      if (v21)
      {
        v25 = (unint64_t *)&v21->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
          v24 = v45;
        }
      }
      if (v49)
      {
        WTF::RefCounted<KB::DictionaryContainer>::deref(v49);
        v24 = v45;
      }
    }
    else
    {
      v27 = self->m_impl;
      v28 = operator new(0x28uLL);
      v28[1] = 0;
      v28[2] = 0;
      *v28 = &off_1EA1021C8;
      v28[3] = &off_1EA106698;
      v29 = (unsigned int *)*((_QWORD *)v27 + 28);
      v28[4] = v29;
      if (v29)
      {
        do
          v30 = __ldaxr(v29);
        while (__stlxr(v30 + 1, v29));
      }
      v24.n128_u64[0] = (unint64_t)(v28 + 3);
      v24.n128_u64[1] = (unint64_t)v28;
    }
    v31 = self->m_impl;
    v46 = v24;
    v47 = v24;
    v32 = (std::__shared_weak_count *)v24.n128_u64[1];
    if (v24.n128_u64[1])
    {
      v33 = (unint64_t *)(v24.n128_u64[1] + 8);
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
      TIInputManager::set_candidate_refinery((uint64_t)v31, (uint64_t *)&v47);
      do
        v35 = __ldaxr(v33);
      while (__stlxr(v35 - 1, v33));
      v36 = v46.n128_u64[0];
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v32->__on_zero_shared)(v32, v46);
        std::__shared_weak_count::__release_weak(v32);
        v36 = v46.n128_u64[0];
      }
      std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](&self->_refinery.__ptr_, v36, (uint64_t)v32);
      v37 = (unint64_t *)&v32->__shared_owners_;
      do
        v38 = __ldaxr(v37);
      while (__stlxr(v38 - 1, v37));
      if (!v38)
      {
        ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
        std::__shared_weak_count::__release_weak(v32);
      }
    }
    else
    {
      TIInputManager::set_candidate_refinery((uint64_t)v31, (uint64_t *)&v47);
      std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](&self->_refinery.__ptr_, v46.n128_i64[0], 0);
    }
  }
  if (v4)
  {
    v39 = (unint64_t *)&v4->__shared_owners_;
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v41 = v52;
  if (v52)
  {
    v42 = &v52->__shared_owners_;
    do
      v43 = __ldaxr((unint64_t *)v42);
    while (__stlxr(v43 - 1, (unint64_t *)v42));
    if (!v43)
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  return v8 != v5;
}

- (void)loadFavoniusTypingModel
{
  unsigned int **v3;
  unsigned int *v4;
  void *m_impl;
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  unsigned int v9;
  TIInputManager *v10;
  unsigned int *v11;
  unsigned int v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int *v25;
  unsigned int *v26;

  v3 = (unsigned int **)((char *)self->m_impl + 224);
  v4 = (unsigned int *)operator new();
  TI::Favonius::UnigramTypingModel::UnigramTypingModel((uint64_t)v4, v3);
  m_impl = self->m_impl;
  v6 = operator new();
  *(_DWORD *)(v6 + 8) = 1;
  v7 = (unsigned int *)(v6 + 8);
  *(_QWORD *)v6 = &off_1EA0FA3C8;
  v8 = (unsigned int *)*((_QWORD *)m_impl + 28);
  *(_QWORD *)(v6 + 16) = v8;
  if (v8)
  {
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
  }
  v10 = (TIInputManager *)self->m_impl;
  v26 = v4;
  v11 = v4 + 2;
  do
    v12 = __ldaxr(v11);
  while (__stlxr(v12 + 1, v11));
  TIInputManager::set_typing_model(v10, &v26);
  if (v26)
  {
    v13 = v26 + 2;
    v14 = atomic_load(v26 + 2);
    if (v14 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v26 + 40))();
    }
    else
    {
      do
        v15 = __ldaxr(v13);
      while (__stlxr(v15 - 1, v13));
    }
  }
  v16 = self->m_impl;
  v25 = (unsigned int *)v6;
  do
    v17 = __ldaxr(v7);
  while (__stlxr(v17 + 1, v7));
  TIInputManager::set_candidate_generator((uint64_t)v16, &v25);
  if (v25)
  {
    v18 = v25 + 2;
    v19 = atomic_load(v25 + 2);
    if (v19 == 1)
    {
      (*(void (**)(void))(*(_QWORD *)v25 + 8))();
    }
    else
    {
      do
        v20 = __ldaxr(v18);
      while (__stlxr(v20 - 1, v18));
    }
  }
  v21 = atomic_load(v7);
  if (v21 == 1)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  else
  {
    do
      v22 = __ldaxr(v7);
    while (__stlxr(v22 - 1, v7));
  }
  v23 = atomic_load(v11);
  if (v23 == 1)
  {
    (*(void (**)(unsigned int *))(*(_QWORD *)v4 + 40))(v4);
  }
  else
  {
    do
      v24 = __ldaxr(v11);
    while (__stlxr(v24 - 1, v11));
  }
}

- (void)scoreCandidates:(void *)a3
{
  CandidateRefinery *ptr;
  _QWORD *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ptr = self->_refinery.__ptr_;
  v6[0] = &off_1EA101210;
  v7 = v6;
  (*(void (**)(CandidateRefinery *, void *, _QWORD *))(*(_QWORD *)ptr + 56))(ptr, a3, v6);
  v4 = v7;
  if (v7 == v6)
  {
    v5 = 4;
    v4 = v6;
  }
  else
  {
    if (!v7)
      return;
    v5 = 5;
  }
  (*(void (**)(void))(*v4 + 8 * v5))();
}

- (shared_ptr<KB::LanguageModel>)loadedLightweightLanguageModel
{
  LanguageModel **v2;
  LanguageModel **v3;
  shared_ptr<KB::LanguageModel> *p_m_lightweight_language_model;
  LanguageModel *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  __shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  _QWORD v35[2];
  shared_ptr<KB::LanguageModel> result;

  v3 = v2;
  v35[1] = *MEMORY[0x1E0C80C00];
  p_m_lightweight_language_model = &self->m_lightweight_language_model;
  ptr = self->m_lightweight_language_model.__ptr_;
  if (ptr)
  {
    cntrl = self->m_lightweight_language_model.__cntrl_;
    *v3 = ptr;
    v3[1] = (LanguageModel *)cntrl;
    if (cntrl)
    {
      v7 = (unint64_t *)((char *)cntrl + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }
  else
  {
    -[TIKeyboardInputManager config](self, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v10, "usesWordNgramModel");

    -[TIKeyboardInputManager dynamicResourcePath](self, "dynamicResourcePath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager config](self, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "usesCustomNgramModel"))
    {
      -[TIKeyboardInputManager config](self, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "ngramModelPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v30 = 0;
    }

    -[TIKeyboardInputManager languageModelAssets](self, "languageModelAssets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferredModelLocaleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "preferredModelLocaleIsMultilingual");
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isSiriMode");
    LOBYTE(v29) = objc_msgSend(v15, "doesSupportInlineCompletion");
    BYTE2(v28) = v19;
    LOWORD(v28) = 0;
    +[TILanguageModelLoaderManager sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:](TILanguageModelLoaderManager, "sharedLanguageModelLoaderForModelLocaleIdentifier:isMultilingualModel:customResourcePaths:dynamicResourcePath:mobileAssets:usesLinguisticContext:isMultiLingualModeEnabled:validEnglishTransformerMultilingualConfig:isSiriMode:trialParameters:isInlineCompletionEnabled:", v16, v17, v30, v32, v14, v31, v28, 0, v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager lexiconLocales](self, "lexiconLocales");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v20, "lightweightLanguageModelForLanguageLocales:", v21);
    }
    else
    {
      v33 = 0;
      v34 = 0;
    }

    -[TIKeyboardInputManager config](self, "config");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v33 + 72))(v33, objc_msgSend(v22, "includeLightWeightLanguageModelMobileAssets"));

    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](p_m_lightweight_language_model, v33, (uint64_t)v34);
    v23 = p_m_lightweight_language_model->__cntrl_;
    *v3 = p_m_lightweight_language_model->__ptr_;
    v3[1] = (LanguageModel *)v23;
    if (v23)
    {
      v24 = (unint64_t *)((char *)v23 + 8);
      do
        v25 = __ldxr(v24);
      while (__stxr(v25 + 1, v24));
    }
    if (v34)
    {
      p_shared_owners = (unint64_t *)&v34->__shared_owners_;
      do
        v27 = __ldaxr(p_shared_owners);
      while (__stlxr(v27 - 1, p_shared_owners));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
        std::__shared_weak_count::__release_weak(v34);
      }
    }

  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (LanguageModel *)self;
  return result;
}

- (void)handleTrialParametersUpdateCallback
{
  -[TIKeyboardInputManager setLinguisticResourceStatus:reason:](self, "setLinguisticResourceStatus:reason:", 2, CFSTR("trial parameters updated"));
}

- (void)mobileAssetsChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  TIAssetsOSLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s New LinguisticData OTA assets are available"), "-[TIKeyboardInputManager mobileAssetsChanged:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  -[TIKeyboardInputManager setLinguisticResourceStatus:reason:](self, "setLinguisticResourceStatus:reason:", 2, CFSTR("Mobile assets changed"));
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  uint64_t v7;
  id v9;
  void *v10;
  unsigned int v11;
  _BOOL4 v12;
  unsigned int v13;
  id v14;
  unsigned int v15;
  const KB::String *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  TIInputManager *m_impl;
  id v23;
  uint64_t v24;
  const KB::String *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  _DWORD *v31;
  char v33;
  unsigned int v34;
  _QWORD v35[5];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE v43[8];
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  _NSRange v50;

  v7 = *(_QWORD *)&a4;
  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = v9;
  if (a6)
    *a6 = 0;
  if (self->m_impl)
  {
    v11 = -[TIKeyboardInputManager simulateAutoshiftIfNecessaryForFlags:](self, "simulateAutoshiftIfNecessaryForFlags:", v7);
    v12 = -[TIKeyboardInputManager stringEndsWord:](self, "stringEndsWord:", v10);
    if (v12)
      v13 = v11 | 0x40;
    else
      v13 = v11;
    -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");
    v34 = -[TIKeyboardInputManager inputIndex](self, "inputIndex");
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    if ((v15 & 0xFFFFFFFE) != 0)
    {
      if ((v13 & 4) != 0 && (objc_msgSend(v14, "isEqualToString:", v10) & 1) == 0)
      {
        TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)&v45);
        v50.location = v15;
        KB::utf8_substring((KB *)v14, 0, v50, (uint64_t)v43);
        KB::String::append((unsigned __int16 *)&v45, (const KB::String *)v43);
        if (v44 && v43[6] == 1)
          free(v44);
        KB::ns_string((KB *)&v45, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "length");
        if (v19 <= objc_msgSend(v14, "length"))
        {
          v21 = 0;
        }
        else
        {
          v20 = objc_msgSend(v18, "length");
          v21 = v20 - objc_msgSend(v14, "length");
        }
        if (objc_msgSend(v18, "_rangeOfString:fromLocation:", v14, v21) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v23 = v10;

          v14 = v23;
        }

        if (v46 && BYTE6(v45) == 1)
          free(v46);
      }
      v45 = 0;
      v46 = &v45;
      v47 = 0x2020000000;
      v48 = v13;
      v24 = objc_msgSend(v14, "length");
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __59__TIKeyboardInputManager_addInput_flags_point_firstDelete___block_invoke;
      v35[3] = &unk_1EA100DD0;
      v35[4] = self;
      v14 = v14;
      v36 = v14;
      v37 = &v45;
      v38 = &v39;
      objc_msgSend(v14, "enumerateSubstringsInRange:options:usingBlock:", 0, v24, 514, v35);

      _Block_object_dispose(&v45, 8);
    }
    else
    {
      m_impl = (TIInputManager *)self->m_impl;
      KB::utf8_string((KB *)v14, (uint64_t)&v45);
      TIInputManager::add_input(m_impl, (const KB::String *)&v45, v13);
      if (v46 && BYTE6(v45) == 1)
        free(v46);
      ++v40[3];
    }
    if (self->m_composedText)
    {
      v33 = v13;
      v13 = v12;
      TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->m_impl + 2) - *((_QWORD *)self->m_impl + 1)) >> 3), (uint64_t)&v45);
      KB::ns_string((KB *)&v45, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v46 && BYTE6(v45) == 1)
        free(v46);
      v27 = *((unsigned int *)self->m_impl + 24);
      -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "substringToIndex:", -[TIKeyboardInputManager internalIndexToExternal:](self, "internalIndexToExternal:", v27));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v29, self->m_composedText, v34, a6);
      v30 = objc_claimAutoreleasedReturnValue();

      -[NSMutableString setString:](self->m_composedText, "setString:", v28);
      v14 = (id)v30;
      v12 = v13;
      LOBYTE(v13) = v33;
    }
    if (-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
    {
      if (!v12)
      {
LABEL_42:
        _Block_object_dispose(&v39, 8);
        goto LABEL_43;
      }
      -[TIKeyboardInputManager dropInput](self, "dropInput");
    }
    else
    {
      if ((v13 & 2) != 0)
      {
        if (v34)
        {
          v31 = self->m_impl;
          if ((*(_BYTE *)(*((_QWORD *)v31 + 1) + 40 * (v34 - 1) + 32) & 0x40) != 0)
            -[TIKeyboardInputManager dropInputPrefix:](self, "dropInputPrefix:", (v31[24] - *((_DWORD *)v40 + 6)));
        }
      }
      if (!v12)
        goto LABEL_42;
      KB::String::clear((KB::String *)((char *)self->m_impl + 64));
    }
    self->_isEditingWordPrefix = 0;
    goto LABEL_42;
  }
  v14 = v9;
LABEL_43:

  return v14;
}

- (BOOL)hasLegacyInputStem
{
  _QWORD *m_impl;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  m_impl = self->m_impl;
  if (!m_impl)
    return 0;
  v3 = *((unsigned int *)m_impl + 24);
  v4 = v3 + 1;
  v5 = 40 * v3 - 8;
  do
  {
    if (!--v4)
      break;
    v6 = *(_BYTE *)(m_impl[1] + v5);
    v5 -= 40;
  }
  while ((v6 & 0x40) == 0);
  return v4 < v3;
}

- (BOOL)hasLegacyInputString
{
  _DWORD *m_impl;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  char *v10;
  char v11;

  if (!self->m_impl)
    return 0;
  if (-[TIKeyboardInputManager hasLegacyInputStem](self, "hasLegacyInputStem"))
    return 1;
  m_impl = self->m_impl;
  v5 = m_impl[24];
  v6 = *((_QWORD *)m_impl + 1);
  v7 = -858993459 * ((unint64_t)(*((_QWORD *)m_impl + 2) - v6) >> 3);
  v8 = v5;
  v9 = v7 - v5;
  if (v7 > v5)
  {
    v10 = (char *)(v6 + 40 * v5 + 32);
    v8 = v5;
    while (1)
    {
      v11 = *v10;
      v10 += 40;
      if ((v11 & 0x40) != 0)
        break;
      ++v8;
      if (!--v9)
      {
        v8 = v7;
        return v5 < v8;
      }
    }
  }
  return v5 < v8;
}

- (unsigned)simulateAutoshiftIfNecessaryForFlags:(unsigned int)a3
{
  unsigned int v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  _BOOL4 v14;

  v3 = a3;
  if ((a3 & 1) != 0)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "autocapitalizationEnabled"))
    {

    }
    else
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "autocapitalizationType");

      if (v7 == 2)
      {
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "documentState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contextBeforeInput");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        v12 = &stru_1EA1081D0;
        if (v10)
          v12 = (__CFString *)v10;
        v13 = v12;

        v14 = -[TIKeyboardInputManager canStartSentenceAfterString:](self, "canStartSentenceAfterString:", v13);
        if (v14)
          v3 |= 2u;
      }
    }
  }
  return v3;
}

- (_NSRange)legacyInputRangeForTokenRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  NSUInteger v20;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = a3.location;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = a3.location + a3.length;
  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__TIKeyboardInputManager_legacyInputRangeForTokenRange___block_invoke;
  v12[3] = &unk_1EA100DF8;
  v12[4] = self;
  v12[5] = &v17;
  v12[6] = &v13;
  objc_msgSend(v7, "enumerateSubstringsInRange:options:usingBlock:", location, length, 2, v12);

  v8 = v18[3];
  v9 = v14[3] - v8;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  v10 = v8;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)acceptableRangeFromRange:(_NSRange)a3 inText:(id)a4 withSelectionLocation:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  BOOL v11;
  unint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSUInteger v17;
  NSUInteger v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD v26[5];
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v9 = a4;
  v10 = v9;
  if (a5 >= location && (v11 = location + length >= a5, v12 = location + length - a5, v11))
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v15 = MEMORY[0x1E0C809B0];
    v32 = a5;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __80__TIKeyboardInputManager_acceptableRangeFromRange_inText_withSelectionLocation___block_invoke;
    v26[3] = &unk_1EA100E20;
    v26[4] = self;
    v16 = v9;
    v27 = v16;
    v28 = &v29;
    objc_msgSend(v16, "enumerateSubstringsInRange:options:usingBlock:", a5, v12, 514, v26);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = a5;
    v19[0] = v15;
    v19[1] = 3221225472;
    v19[2] = __80__TIKeyboardInputManager_acceptableRangeFromRange_inText_withSelectionLocation___block_invoke_2;
    v19[3] = &unk_1EA100E20;
    v19[4] = self;
    v20 = v16;
    v21 = &v22;
    objc_msgSend(v20, "enumerateSubstringsInRange:options:usingBlock:", location, a5 - location, 770, v19);
    v14 = v23[3];
    v13 = v30[3] - v14;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v13 = 0;
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v17 = v14;
  v18 = v13;
  result.length = v18;
  result.location = v17;
  return result;
}

- (void)setInputStringFromDocumentState:(id)a3 isDeleteEvent:(BOOL)a4 didDeleteLastAcceptedPath:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v5 = a5;
  v6 = a4;
  v30 = a3;
  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "syncToDocumentState:", v30);

  if (-[TIKeyboardInputManager shouldExtendPriorWord](self, "shouldExtendPriorWord"))
  {
    -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "length"))
      v10 = 1;
    else
      v10 = !v5;

  }
  else
  {
    v10 = 0;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "documentState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "selectedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TIKeyboardInputManager clearInput](self, "clearInput");
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentWord");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "documentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "isEqualToString:", v18);

    if (v19)
      -[TIKeyboardInputManager setOriginalInput:](self, "setOriginalInput:", v15);

  }
  else
  {
    if ((_DWORD)v10)
    {
      v20 = -[TIKeyboardInputManager inputStringRangeFromRevisionHistory](self, "inputStringRangeFromRevisionHistory");
      v22 = v21;
      -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "selectedRange");

      if (v22 && v24 >= v20 && v24 <= v20 + v22)
      {
        -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "documentText");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "substringWithRange:", v20, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIKeyboardInputManager setInput:withIndex:](self, "setInput:withIndex:", v27, (v24 - v20));
      }
      else
      {
        -[TIKeyboardInputManager clearInput](self, "clearInput");
        v27 = 0;
      }
      goto LABEL_18;
    }
    -[TIKeyboardInputManager clearInput](self, "clearInput");
  }
  v27 = 0;
  v22 = 0;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v24 = -1;
LABEL_18:
  if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
  {
    -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "contextDidChange:wordDelete:cursorMoved:extendsPriorWord:inWord:range:selectionLocation:keyboardState:", v30, v6, v6 ^ 1, v10, v27, v20, v22, v24, v29);

  }
  -[TIKeyboardInputManager _recalcSupplementalPrefix](self, "_recalcSupplementalPrefix");
  -[TIKeyboardInputManager updateInputContext](self, "updateInputContext");

}

- (id)linguisticContext
{
  TIContextTokens *v3;

  v3 = objc_alloc_init(TIContextTokens);
  KB::LanguageModelContext::operator=((uint64_t)-[TIContextTokens lmContext](v3, "lmContext"), (uint64_t *)self->m_impl + 54);
  return v3;
}

- (void)tokenizeString:(const String *)a3 context:(void *)a4 sentences:(unsigned int *)a5
{
  uint64_t v5;
  _QWORD v6[9];
  _QWORD v7[3];
  char v8;
  _QWORD v9[6];
  int v10;
  __int16 v11;
  char v12;
  void *v13;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x5012000000;
  v9[3] = __Block_byref_object_copy__242;
  v9[4] = __Block_byref_object_dispose__243;
  v9[5] = "";
  v10 = 0x100000;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0;
  v5 = *((_QWORD *)self->m_impl + 29);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__TIKeyboardInputManager_tokenizeString_context_sentences___block_invoke;
  v6[3] = &unk_1EA100E70;
  v6[4] = self;
  v6[5] = v9;
  v6[6] = v7;
  v6[7] = a4;
  v6[8] = a5;
  (*(void (**)(uint64_t, const String *, _QWORD *))(*(_QWORD *)v5 + 528))(v5, a3, v6);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v9, 8);
  if (v13)
  {
    if (v12 == 1)
      free(v13);
  }
}

- (void)parseRecentMessage:(void *)a3
{
  KB::LanguageModelContext *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  __int128 v10;
  void *__p[2];
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];
  void **v17;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  *(_OWORD *)__p = 0u;
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v14);
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)&v15);
  memset(v16, 0, sizeof(v16));
  LODWORD(v17) = 0;
  -[TIKeyboardInputManager tokenizeString:context:sentences:](self, "tokenizeString:context:sentences:", a3, &v10, &v17);
  v5 = (KB::LanguageModelContext *)operator new();
  KB::LanguageModelContext::LanguageModelContext(v5, (const KB::LanguageModelContext *)&v10);
  v6 = *((_QWORD *)a3 + 4);
  *((_QWORD *)a3 + 4) = v5;
  if (v6)
    std::default_delete<KB::LanguageModelContext>::operator()[abi:nn180100](v6);
  *((_DWORD *)a3 + 10) = (_DWORD)v17;
  v17 = (void **)v16;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v17);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v15);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v14);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (unint64_t)maxPriorWordTokensAfterTrimming
{
  void *v2;
  unint64_t v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxPriorWordTokensAfterTrimming");

  return v3;
}

- (id)trimmedInputStem
{
  __CFString *v3;
  _DWORD *m_impl;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[9];
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;

  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    m_impl = self->m_impl;
    if (m_impl)
    {
      v3 = &stru_1EA1081D0;
      if (m_impl[24])
      {
        v13 = 0;
        v14 = &v13;
        v15 = 0x3032000000;
        v16 = __Block_byref_object_copy__10337;
        v17 = __Block_byref_object_dispose__10338;
        v18 = &stru_1EA1081D0;
        v12[0] = 0;
        v12[1] = v12;
        v12[2] = 0x2020000000;
        v12[3] = 0;
        v5 = -[TIKeyboardInputManager maxPriorWordTokensAfterTrimming](self, "maxPriorWordTokensAfterTrimming");
        -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "selectedRange");

        -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __42__TIKeyboardInputManager_trimmedInputStem__block_invoke;
        v11[3] = &unk_1EA100E98;
        v11[4] = self;
        v11[5] = &v13;
        v11[6] = v12;
        v11[7] = v7;
        v11[8] = v5;
        objc_msgSend(v8, "enumerateSentenceStemUsingBlock:", v11);

        v9 = (id)v14[5];
        _Block_object_dispose(v12, 8);
        _Block_object_dispose(&v13, 8);

        return v9;
      }
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (unint64_t)countOfWordsIninputStem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "selectedRange");

    v8 = objc_msgSend(v4, "length");
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__TIKeyboardInputManager_countOfWordsIninputStem___block_invoke;
    v12[3] = &unk_1EA100EC0;
    v12[5] = v7;
    v12[6] = v8;
    v12[4] = &v13;
    objc_msgSend(v9, "enumerateSentenceStemUsingBlock:", v12);

    v10 = v14[3];
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)wordInInputStem:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  int v9;
  unint64_t v10;
  void *v11;
  _QWORD v13[7];
  _QWORD v14[4];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  __CFString *v20;

  v6 = a3;
  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = &stru_1EA1081D0;
  if (v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__10337;
    v19 = __Block_byref_object_dispose__10338;
    v20 = &stru_1EA1081D0;
    v9 = -[TIKeyboardInputManager countOfWordsIninputStem:](self, "countOfWordsIninputStem:", v6);
    if (v9 > a4)
    {
      v10 = v9 + ~a4;
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      v14[3] = 0;
      -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __50__TIKeyboardInputManager_wordInInputStem_atIndex___block_invoke;
      v13[3] = &unk_1EA100EE8;
      v13[5] = &v15;
      v13[6] = v10;
      v13[4] = v14;
      objc_msgSend(v11, "enumerateSentenceStemUsingBlock:", v13);

      _Block_object_dispose(v14, 8);
    }
    v8 = (__CFString *)(id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  return v8;
}

- (unint64_t)internalIndexOfInputStemSuffix:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned __int16 *m_impl;
  unsigned int v12;
  const KB::String *v13;
  void *v14;
  void *v15;
  void *v16;
  _BYTE v18[8];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 && self->m_impl)
  {
    if (objc_msgSend(v4, "length"))
    {
      -[TIKeyboardInputManager inputStem](self, "inputStem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "rangeOfString:options:", v5, 12);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = v8;
        v10 = -[TIKeyboardInputManager externalIndexToInternal:](self, "externalIndexToInternal:", v8);
        m_impl = (unsigned __int16 *)self->m_impl;
        if (v10 <= *((_DWORD *)m_impl + 24))
        {
          v12 = v10;
          TIInputManager::input_substring(m_impl + 4, 0, v10, (uint64_t)v18);
          KB::ns_string((KB *)v18, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "substringToIndex:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v14) = objc_msgSend(v15, "isEqualToString:", v16);

          if ((_DWORD)v14)
            v6 = v12;

          if (v19 && v18[6] == 1)
            free(v19);
        }
      }

    }
    else
    {
      v6 = *((unsigned int *)self->m_impl + 24);
    }
  }

  return v6;
}

- (BOOL)canTrimInputAtIndex:(unsigned int)a3
{
  char *m_impl;
  unsigned int v4;
  BOOL candidates;
  const KB::String *v8;
  _BYTE v10[6];
  char v11;
  void *v12;
  unsigned __int16 v13[3];
  char v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  m_impl = (char *)self->m_impl;
  v4 = *((_DWORD *)m_impl + 43);
  if (v4 <= *((_DWORD *)m_impl + 44))
    v4 = *((_DWORD *)m_impl + 44);
  if (v4 > a3)
    return 0;
  v8 = (const KB::String *)(m_impl + 400);
  TIInputManager::input_substring((unsigned __int16 *)m_impl + 4, 0, a3, (uint64_t)v10);
  KB::String::String((KB::String *)v13, v8);
  KB::String::append(v13, (const KB::String *)v10);
  if (v12 && v11 == 1)
    free(v12);
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, a3, -858993459 * ((*((_QWORD *)self->m_impl + 2) - *((_QWORD *)self->m_impl + 1)) >> 3) - a3, (uint64_t)v10);
  candidates = TIInputManager::should_generate_candidates((uint64_t)self->m_impl, (KB::String *)v13, (KB::String *)v10, 0);
  if (v12 && v11 == 1)
    free(v12);
  if (v15 && v14 == 1)
    free(v15);
  return candidates;
}

- (BOOL)canRetrocorrectInputAtIndex:(unsigned int)a3
{
  int v5;
  const KB::String *v6;
  void *v7;
  const KB::String *v8;
  char v9;
  _BYTE v11[8];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  KB::String::String((KB::String *)v11, (const KB::String *)(*((_QWORD *)self->m_impl + 1) + 40 * a3));
  v5 = *(_DWORD *)(*((_QWORD *)self->m_impl + 1) + 40 * a3 + 32);
  KB::ns_string((KB *)v11, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (!KB::string_has_numbers((KB *)v11, v8) && (v5 & 0x13) != 1)
  {
    if (-[TIKeyboardInputManager stringEndsWord:](self, "stringEndsWord:", v7)
      && ((v5 & 0x24) != 0x20 || objc_msgSend(v7, "isEqualToString:", CFSTR("\n"))))
    {
      v9 = objc_msgSend(v7, "isEqualToString:", CFSTR(" "));
    }
    else
    {
      v9 = 1;
    }
  }

  if (v12 && v11[6] == 1)
    free(v12);
  return v9;
}

- (void)trimInput
{
  _DWORD *m_impl;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  int v11;

  m_impl = self->m_impl;
  if (m_impl && m_impl[24])
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
    if (-[TIKeyboardInputManager usesRetrocorrection](self, "usesRetrocorrection"))
    {
      -[TIKeyboardInputManager trimmedInputStem](self, "trimmedInputStem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[TIKeyboardInputManager internalIndexOfInputStemSuffix:](self, "internalIndexOfInputStemSuffix:", v5);
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = v6;
        v8 = v6;
        while (v8 < *((_DWORD *)self->m_impl + 24))
        {
          v9 = v8 + 1;
          v10 = -[TIKeyboardInputManager canRetrocorrectInputAtIndex:](self, "canRetrocorrectInputAtIndex:");
          v8 = v9;
          if (!v10)
          {
            v4 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_12;
          }
        }
        if (-[TIKeyboardInputManager canTrimInputAtIndex:](self, "canTrimInputAtIndex:", v7))
          v4 = v7;
        else
          v4 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_12:

    }
    v11 = *(_DWORD *)(*((_QWORD *)self->m_impl + 1) + 40 * (*((_DWORD *)self->m_impl + 24) - 1) + 32);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((v11 & 0x40) == 0)
        return;
LABEL_18:
      -[TIKeyboardInputManager dropInput](self, "dropInput");
      return;
    }
    -[TIKeyboardInputManager dropInputPrefix:](self, "dropInputPrefix:", v4);
    if ((v11 & 0x40) != 0 && -[TIKeyboardInputManager shouldDropInputStem](self, "shouldDropInputStem"))
      goto LABEL_18;
  }
}

- (id)trimmedInputStemAfterLathamConversion
{
  __CFString *v3;
  _DWORD *m_impl;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[8];
  _QWORD v11[4];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  __CFString *v17;

  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    m_impl = self->m_impl;
    if (m_impl)
    {
      v3 = &stru_1EA1081D0;
      if (m_impl[24])
      {
        v12 = 0;
        v13 = &v12;
        v14 = 0x3032000000;
        v15 = __Block_byref_object_copy__10337;
        v16 = __Block_byref_object_dispose__10338;
        v17 = &stru_1EA1081D0;
        v11[0] = 0;
        v11[1] = v11;
        v11[2] = 0x2020000000;
        v11[3] = 0;
        -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "selectedRange");

        -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __63__TIKeyboardInputManager_trimmedInputStemAfterLathamConversion__block_invoke;
        v10[3] = &unk_1EA100F10;
        v10[4] = self;
        v10[5] = &v12;
        v10[6] = v11;
        v10[7] = v6;
        objc_msgSend(v7, "enumerateSentenceStemUsingBlock:", v10);

        v8 = (id)v13[5];
        _Block_object_dispose(v11, 8);
        _Block_object_dispose(&v12, 8);

        return v8;
      }
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)trimInputAfterLathamConversion
{
  _DWORD *m_impl;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  int v10;

  m_impl = self->m_impl;
  if (m_impl && m_impl[24])
  {
    if (-[TIKeyboardInputManager usesRetrocorrection](self, "usesRetrocorrection"))
    {
      -[TIKeyboardInputManager trimmedInputStemAfterLathamConversion](self, "trimmedInputStemAfterLathamConversion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[TIKeyboardInputManager internalIndexOfInputStemSuffix:](self, "internalIndexOfInputStemSuffix:", v4);
      if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_13;
      v6 = v5;
      v7 = v5;
      while (v7 < *((_DWORD *)self->m_impl + 24))
      {
        v8 = v7 + 1;
        v9 = -[TIKeyboardInputManager canRetrocorrectInputAtIndex:](self, "canRetrocorrectInputAtIndex:");
        v7 = v8;
        if (!v9)
          goto LABEL_13;
      }
      if (!-[TIKeyboardInputManager canTrimInputAtIndex:](self, "canTrimInputAtIndex:", v6))
      {
LABEL_13:

      }
      else
      {

        v10 = *(_DWORD *)(*((_QWORD *)self->m_impl + 1) + 40 * (*((_DWORD *)self->m_impl + 24) - 1) + 32);
        -[TIKeyboardInputManager dropInputPrefix:](self, "dropInputPrefix:", v6);
        if ((v10 & 0x40) == 0 || !-[TIKeyboardInputManager shouldDropInputStem](self, "shouldDropInputStem"))
          return;
      }
    }
    -[TIKeyboardInputManager dropInput](self, "dropInput");
  }
}

- (void)dropInputPrefix:(unsigned int)a3
{
  void *m_impl;
  _QWORD v4[5];

  if (a3)
  {
    m_impl = self->m_impl;
    if (m_impl)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __42__TIKeyboardInputManager_dropInputPrefix___block_invoke;
      v4[3] = &unk_1EA106A98;
      v4[4] = self;
      TIInputManager::drop_input_prefix_and_update_autocorrection_engine((uint64_t)m_impl, *(uint64_t *)&a3, (uint64_t)v4);
    }
  }
}

- (void)dropInput
{
  if (self->m_impl)
  {
    -[TIKeyboardInputManager willDropInputStem](self, "willDropInputStem");
    -[TIKeyboardInputManager dropInputPrefix:](self, "dropInputPrefix:", *((unsigned int *)self->m_impl + 24));
    -[TIKeyboardInputManager didDropInputStem](self, "didDropInputStem");
  }
}

- (void)willDropInputStem
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Dropping input stem."), "-[TIKeyboardInputManager willDropInputStem]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v6 = v4;
      _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  if (-[TIKeyboardInputManager isLinguisticResourceUpdateScheduled](self, "isLinguisticResourceUpdateScheduled"))
    -[TIKeyboardInputManager updateDictionaryAndLanguageModel](self, "updateDictionaryAndLanguageModel");
}

- (void)setInput:(id)a3
{
  id v4;
  void *v5;
  TIInputManager *m_impl;
  KB *v7;
  NSMutableString *m_composedText;
  _BYTE v9[8];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->m_impl)
  {
    -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    -[TIKeyboardInputManager checkAutocorrectionDictionaries](self, "checkAutocorrectionDictionaries");
    m_impl = (TIInputManager *)self->m_impl;
    -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v4);
    v7 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v7, (uint64_t)v9);
    TIInputManager::set_input(m_impl, (const KB::String *)v9);
    if (v10 && v9[6] == 1)
      free(v10);

    self->_isEditingWordPrefix = 0;
    m_composedText = self->m_composedText;
    if (m_composedText)
      -[NSMutableString setString:](m_composedText, "setString:", v4);
    -[TIKeyboardInputManager updateForRevisitedString:](self, "updateForRevisitedString:", v4);
    -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", 0);
  }

}

- (void)setInput:(id)a3 withIndex:(unsigned int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  -[TIKeyboardInputManager setInput:](self, "setInput:", a3);
  -[TIKeyboardInputManager setInputIndex:](self, "setInputIndex:", v4);
}

- (id)deleteFromInput:(unint64_t *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  if (a3)
    *a3 = 1;
  if (!self->m_impl)
    goto LABEL_6;
  if (-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection"))
    goto LABEL_7;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "markedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_7:
    v9 = -[TIKeyboardInputManager inputIndex](self, "inputIndex");
    if (-[NSMutableString length](self->m_composedText, "length"))
    {
      -[TIKeyboardInputManager deleteComposedTextFromIndex:count:](self, "deleteComposedTextFromIndex:count:", v9, a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      TIInputManager::delete_from_input((TIInputManager *)self->m_impl);
      v8 = 0;
    }
    -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", 0);
  }
  else
  {
LABEL_6:
    v8 = 0;
  }
  return v8;
}

- (id)deleteComposedTextFromIndex:(unint64_t)a3 count:(unint64_t *)a4
{
  const KB::String *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  TIInputManager *m_impl;
  KB *v14;
  const KB::String *v15;
  void *v16;
  void *v17;
  const KB::String *v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE v23[6];
  char v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[TIKeyboardInputManager deletesComposedTextByComposedCharacterSequence](self, "deletesComposedTextByComposedCharacterSequence"))
  {
    TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->m_impl + 2) - *((_QWORD *)self->m_impl + 1)) >> 3), (uint64_t)v23);
    KB::ns_string((KB *)v23, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25 && v24 == 1)
      free(v25);
    v10 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", a3 - 1);
    objc_msgSend(v9, "substringWithRange:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    m_impl = (TIInputManager *)self->m_impl;
    -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v12);
    v14 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v14, (uint64_t)v23);
    TIInputManager::delete_suffix_from_input(m_impl, (const KB::String *)v23);
    if (v25 && v24 == 1)
      free(v25);

  }
  else
  {
    TIInputManager::delete_from_input((TIInputManager *)self->m_impl);
  }
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->m_impl + 2) - *((_QWORD *)self->m_impl + 1)) >> 3), (uint64_t)v23);
  KB::ns_string((KB *)v23, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && v24 == 1)
    free(v25);
  TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v23);
  KB::ns_string((KB *)v23, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && v24 == 1)
    free(v25);
  -[TIKeyboardInputManager suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:](self, "suffixOfDesiredString:toAppendToInputString:withInputIndex:afterDeletionCount:", v20, self->m_composedText, a3, a4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString setString:](self->m_composedText, "setString:", v17);
  if (!objc_msgSend(v21, "length"))
  {

    v21 = 0;
  }

  return v21;
}

- (void)acceptInput
{
  TIInputManager *m_impl;
  NSMutableString *m_composedText;
  const KB::String *v5;
  void *v6;
  void *v7;
  _BYTE v8[8];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  m_impl = (TIInputManager *)self->m_impl;
  if (m_impl)
  {
    TIInputManager::accept_input(m_impl);
    m_composedText = self->m_composedText;
    if (m_composedText)
    {
      TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, -858993459 * ((*((_QWORD *)self->m_impl + 2) - *((_QWORD *)self->m_impl + 1)) >> 3), (uint64_t)v8);
      KB::ns_string((KB *)v8, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString setString:](m_composedText, "setString:", v7);

      if (v9)
      {
        if (v8[6] == 1)
          free(v9);
      }
    }
  }
}

- (id)internalInputContext
{
  return KB::ns_string((KB *)((char *)self->m_impl + 400), (const KB::String *)a2);
}

- (void)setInputIndex:(unsigned int)a3
{
  unsigned int v4;
  BOOL v5;

  if (self->m_impl)
  {
    v4 = -[TIKeyboardInputManager externalIndexToInternal:](self, "externalIndexToInternal:", *(_QWORD *)&a3);
    TIInputManager::set_input_index((TIInputManager *)self->m_impl, v4);
    if (v4)
      v5 = v4 < -858993459 * ((*((_QWORD *)self->m_impl + 2) - *((_QWORD *)self->m_impl + 1)) >> 3);
    else
      v5 = 0;
    self->_isEditingWordPrefix = v5;
    -[TIKeyboardInputManager setLastAcceptedText:](self, "setLastAcceptedText:", 0);
  }
}

- (id)inputString
{
  unsigned __int16 *m_impl;
  NSMutableString *m_composedText;
  const KB::String *v6;
  void *v7;
  _BYTE v8[8];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  m_impl = (unsigned __int16 *)self->m_impl;
  if (!m_impl)
    return 0;
  m_composedText = self->m_composedText;
  if (m_composedText)
    return (id)-[NSMutableString copy](m_composedText, "copy");
  TIInputManager::input_substring(m_impl + 4, 0, -858993459 * ((*((_QWORD *)m_impl + 2) - *((_QWORD *)m_impl + 1)) >> 3), (uint64_t)v8);
  KB::ns_string((KB *)v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (v8[6] == 1)
      free(v9);
  }
  return v7;
}

- (id)currentWordStem
{
  const KB::String *v3;
  void *v4;
  void *v5;
  BOOL v6;
  _BYTE v8[8];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TIInputManager::legacy_input_stem((TIInputManager *)self->m_impl, (uint64_t)v8);
  KB::ns_string((KB *)v8, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v6 = v8[6] == 1;
  else
    v6 = 0;
  if (v6)
    free(v9);
  return v5;
}

- (void)setOriginalInput:(id)a3
{
  id v4;
  KB *v5;
  _BYTE v6[8];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->m_impl)
  {
    v4 = a3;
    -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v4);
    v5 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v5, (uint64_t)v6);

    KB::String::operator=((KB::String *)((char *)self->m_impl + 32), (KB::String *)v6);
    -[TIKeyboardInputManager updateForRevisitedString:](self, "updateForRevisitedString:", v4);

    if (v7)
    {
      if (v6[6] == 1)
        free(v7);
    }
  }
}

- (void)displayedCandidateRejected
{
  id v3;

  -[TIKeyboardInputManager setDeleteKeyCount:](self, "setDeleteKeyCount:", -[TIKeyboardInputManager deleteKeyCount](self, "deleteKeyCount") + 1);
  if (self->m_impl)
  {
    if (-[TIKeyboardInputManager deleteKeyCount](self, "deleteKeyCount") <= 1)
    {
      -[TIKeyboardInputManager usageTrackingKeyForStatistic:](self, "usageTrackingKeyForStatistic:", *MEMORY[0x1E0DBE5B8]);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

    }
  }
}

- (BOOL)shouldAllowCorrectionOfAcceptedCandidate:(id)a3
{
  id v3;
  char v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v3, "isFromPhraseDictionary") & 1) != 0
    || (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v3, "isFromTextChecker") & 1) != 0
    || (objc_msgSend(v3, "isForShortcutConversion") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "input");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v3, "input");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "candidate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0)
        v4 = 1;
      else
        v4 = objc_msgSend(v3, "isAutocorrection");

    }
    else
    {
      v4 = 1;
    }
  }

  return v4;
}

- (BOOL)shouldSuppressTokenIDLookups
{
  void *v3;
  char v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "secureTextEntry");

  if ((v4 & 1) != 0)
    return 1;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "autocorrectionType") == 1;

  return v5;
}

- (void)recordSuggestedAutocorrectionList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "corrections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_10;
  if ((objc_msgSend(v5, "isContinuousPathConversion") & 1) != 0)
  {
    -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "candidate");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v7;
    objc_msgSend(v6, "setObject:forKey:", v11, v7);

    goto LABEL_7;
  }
  objc_msgSend(v5, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "input");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  if (objc_msgSend(v5, "usageTrackingMask") && (objc_msgSend(v5, "isAutocorrection") & 1) == 0)
    -[TIKeyboardInputManager setHitTestCorrectedInputMatchingCandidate:](self, "setHitTestCorrectedInputMatchingCandidate:", v5);
LABEL_10:

}

- (BOOL)isContinuousPathCandidate:(id)a3 replacementForOriginalConversion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  char v9;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isContinuousPathConversion")
    && objc_msgSend(v6, "isContinuousPathConversion")
    && (objc_msgSend(v5, "input"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", &stru_1EA1081D0),
        v7,
        (v8 & 1) == 0))
  {
    objc_msgSend(v6, "candidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "input");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "hasSuffix:", v12);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)originatingAutocorrectionListForCandidate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  if ((objc_msgSend(v4, "isContinuousPathConversion") & 1) == 0)
  {
    -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "input");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v9 = v11;
    goto LABEL_12;
  }
  objc_msgSend(v4, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", &stru_1EA1081D0);

  -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v4, "input");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "corrections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "autocorrection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "isContinuousPathConversion")
        && -[TIKeyboardInputManager isContinuousPathCandidate:replacementForOriginalConversion:](self, "isContinuousPathCandidate:replacementForOriginalConversion:", v4, v8))
      {
        v11 = v10;
        v10 = v11;
        goto LABEL_5;
      }

    }
    -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  objc_msgSend(v4, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
LABEL_12:

  return v9;
}

- (id)revisionListFromAutocorrectionList:(id)a3 afterAcceptingCandidate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
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
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v56;
  void *v57;
  void *v58;
  id obj;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isContinuousPathConversion") & 1) != 0)
  {
    objc_msgSend(v5, "corrections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "autocorrection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (objc_msgSend(v8, "isAutocorrection"))
      {
        objc_msgSend(v8, "candidate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "candidate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v8, "candidate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "candidate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(v12, v13, objc_msgSend(v8, "usageTrackingMask"), objc_msgSend(v8, "sourceMask"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "supplementalItemIdentifiers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setSupplementalItemIdentifiers:", v15);

          objc_msgSend(v61, "addObject:", v14);
        }
      }
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(v5, "predictions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v63 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(v20, "candidate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "candidate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

          if ((v23 & 1) == 0)
          {
            objc_msgSend(v20, "candidate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "candidate");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(v24, v25, objc_msgSend(v20, "usageTrackingMask"), objc_msgSend(v20, "sourceMask"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "supplementalItemIdentifiers");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setSupplementalItemIdentifiers:", v27);

            objc_msgSend(v61, "addObject:", v26);
          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      }
      while (v17);
    }
    goto LABEL_36;
  }
  objc_msgSend(v6, "candidate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "input");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(obj, "isEqualToString:", v8) & 1) == 0)
  {
    __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(obj, v8, 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v28);

  }
  objc_msgSend(v5, "corrections");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "autocorrection");
  v30 = objc_claimAutoreleasedReturnValue();
  if (!v30)
    goto LABEL_23;
  v31 = (void *)v30;
  objc_msgSend(v5, "corrections");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "autocorrection");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v33, "isAutocorrection"))
  {
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  objc_msgSend(v5, "corrections");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "autocorrection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "candidate");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v36, "isEqualToString:", v8);

  if ((v56 & 1) == 0)
  {
    objc_msgSend(v5, "corrections");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "autocorrection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "candidate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "corrections");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "autocorrection");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v57, "usageTrackingMask");
    objc_msgSend(v5, "corrections");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "autocorrection");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(v32, v8, v37, objc_msgSend(v39, "sourceMask"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addObject:", v40);

    goto LABEL_22;
  }
LABEL_24:
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v5, "predictions", v5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v43; ++j)
      {
        if (*(_QWORD *)v67 != v44)
          objc_enumerationMutation(v41);
        v46 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        objc_msgSend(v46, "candidate");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isEqualToString:", v8);

        if ((v48 & 1) == 0)
        {
          objc_msgSend(v46, "candidate");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(v49, v8, objc_msgSend(v46, "usageTrackingMask"), objc_msgSend(v46, "sourceMask"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "supplementalItemIdentifiers");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setSupplementalItemIdentifiers:", v51);

          if (self->_supplementalPrefix)
            objc_msgSend(v50, "core_updateWithSupplementalItemPrefix:");
          objc_msgSend(v61, "addObject:", v50);

        }
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v43);
  }

  v5 = v58;
LABEL_36:

  v52 = (void *)MEMORY[0x1E0DBDB48];
  objc_msgSend(v5, "emojiList");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "listWithCorrections:predictions:emojiList:", 0, v61, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  return v54;
}

- (void)recordAcceptedAutocorrection:(id)a3 fromPredictiveInputBar:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TIKeyboardInputManager originatingAutocorrectionListForCandidate:](self, "originatingAutocorrectionListForCandidate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasSupplementalItems") & 1) == 0)
  {
    if (v7 && (objc_msgSend(v6, "isSupplementalItemCandidate") & 1) == 0)
    {
      objc_msgSend(v6, "candidate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManager revisionListFromAutocorrectionList:afterAcceptingCandidate:](self, "revisionListFromAutocorrectionList:afterAcceptingCandidate:", v7, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager autocorrectionListsForWordsInDocument](self, "autocorrectionListsForWordsInDocument");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v11, v10);

    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v6, "candidate", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(" "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if (objc_msgSend(v19, "length"))
          {
            -[TIKeyboardInputManager autocorrectionHistory](self, "autocorrectionHistory");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKey:", v6, v19);

            if (v4)
              -[TIKeyboardInputManager recentPredictiveInputSelections](self, "recentPredictiveInputSelections");
            else
              -[TIKeyboardInputManager recentAutocorrections](self, "recentAutocorrections");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKey:", v6, v19);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

  }
}

- (void)updateForRevisitedString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  KB *v11;
  char *m_impl;
  KB *v13;
  _QWORD *v14;
  _BYTE v15[6];
  char v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentWord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if (v8)
    {
      -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentUserTyping");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v10);
        v11 = (KB *)objc_claimAutoreleasedReturnValue();
        m_impl = (char *)self->m_impl;
        KB::utf8_string(v11, (uint64_t)v15);
        KB::String::operator=((KB::String *)(m_impl + 64), (KB::String *)v15);
        if (v17 && v16 == 1)
          free(v17);
        if ((objc_msgSend(v10, "isEqualToString:", v4) & 1) == 0)
        {
          -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v10);
          v13 = (KB *)objc_claimAutoreleasedReturnValue();
          v14 = self->m_impl;
          KB::utf8_string(v13, (uint64_t)v15);
          KB::String::operator=((KB::String *)(*(_QWORD *)(v14[28] + 24) + 56), (KB::String *)v15);
          if (v17 && v16 == 1)
            free(v17);

        }
      }
    }
  }

}

- (id)nonstopPunctuationCharacters
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nonstopPunctuationCharacters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setUserInterfaceIdiom:(int64_t)a3
{
  id v4;

  if (self->_userInterfaceIdiom != a3)
  {
    self->_userInterfaceIdiom = a3;
    -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrentUserInterfaceIdiom:", a3);

  }
}

- (const)precomposedCharacterSet
{
  void *v2;
  const USet *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (const USet *)objc_msgSend(v2, "precomposedCharacterSet");

  return v3;
}

- (id)wordCharacters
{
  TICharacterSetDescription *wordCharacters;
  void *v4;
  TICharacterSetDescription *v5;
  TICharacterSetDescription *v6;

  wordCharacters = self->_wordCharacters;
  if (!wordCharacters)
  {
    -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wordCharacters");
    v5 = (TICharacterSetDescription *)objc_claimAutoreleasedReturnValue();
    v6 = self->_wordCharacters;
    self->_wordCharacters = v5;

    wordCharacters = self->_wordCharacters;
  }
  return wordCharacters;
}

- (id)supplementalLexiconWordExtraCharacters
{
  TICharacterSetDescription *supplementalLexiconWordExtraCharacters;
  void *v4;
  TICharacterSetDescription *v5;
  TICharacterSetDescription *v6;

  supplementalLexiconWordExtraCharacters = self->_supplementalLexiconWordExtraCharacters;
  if (!supplementalLexiconWordExtraCharacters)
  {
    -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "supplementalLexiconWordExtraCharacters");
    v5 = (TICharacterSetDescription *)objc_claimAutoreleasedReturnValue();
    v6 = self->_supplementalLexiconWordExtraCharacters;
    self->_supplementalLexiconWordExtraCharacters = v5;

    supplementalLexiconWordExtraCharacters = self->_supplementalLexiconWordExtraCharacters;
  }
  return supplementalLexiconWordExtraCharacters;
}

- (id)sentencePrefixingCharacters
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentencePrefixingCharacters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sentenceDelimitingCharacters
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentenceDelimitingCharacters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sentenceTrailingCharacters
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sentenceTrailingCharacters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)spaceAndNextInputWouldStartSentence
{
  TIKeyboardInputManager *v2;
  void *v3;

  v2 = self;
  -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[TIKeyboardInputManager nextInputWouldStartSentenceAfterInput:](v2, "nextInputWouldStartSentenceAfterInput:", v3);

  return (char)v2;
}

- (unint64_t)prefixLengthOfInput:(id)a3 sharedWithCandidate:(const void *)a4
{
  id v6;
  unsigned int (**v7)(void *, uint64_t, uint64_t);
  unint64_t v8;
  const KB::String *v9;
  uint64_t v10;
  __CFString *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const KB::String *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  _QWORD aBlock[5];
  uint64_t v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  __int16 v27;
  char v28;
  void *v29;
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__TIKeyboardInputManager_prefixLengthOfInput_sharedWithCandidate___block_invoke;
  aBlock[3] = &unk_1EA100F38;
  aBlock[4] = self;
  v7 = (unsigned int (**)(void *, uint64_t, uint64_t))_Block_copy(aBlock);
  v26 = 0x100000;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  if (*(_QWORD *)a4)
  {
    v8 = 0;
    v9 = (const KB::String *)*((_QWORD *)a4 + 1);
    v10 = 240 * *(_QWORD *)a4 - 240;
    v11 = &stru_1EA1081D0;
    do
    {
      v12 = -[__CFString length](v11, "length");
      if (!v12
        || v12 >= objc_msgSend(v6, "length")
        || !v7[2](v7, objc_msgSend(v6, "characterAtIndex:", v12 - 1), objc_msgSend(v6, "characterAtIndex:", v12)))
      {
        goto LABEL_9;
      }
      v13 = -[__CFString characterAtIndex:](v11, "characterAtIndex:", v12 - 1);
      v14 = *((_QWORD *)v9 + 1);
      if (!v14)
        v14 = (uint64_t)v9 + 16;
      v22 = v14;
      v15 = *(unsigned __int16 *)v9;
      v23 = 0;
      v24 = v15;
      v25 = 0;
      KB::String::iterator::initialize(&v22);
      if ((((uint64_t (*)(void *, uint64_t, _QWORD))v7[2])(v7, v13, v25) & 1) == 0)
      {
LABEL_9:
        if (v12 != objc_msgSend(v6, "length"))
          v12 = v8;
      }
      KB::String::append((unsigned __int16 *)&v26, v9);
      KB::ns_string((KB *)&v26, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v17);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v6, "hasPrefix:", v18))
        break;
      v9 = (const KB::String *)((char *)v9 + 240);
      v19 = v10;
      v10 -= 240;
      v8 = v12;
      v11 = v18;
    }
    while (v19);
  }
  else
  {
    v12 = 0;
    v18 = &stru_1EA1081D0;
  }

  if (v29 && v28 == 1)
    free(v29);

  return v12;
}

- (id)phraseCandidateCompletedByWord:(const String *)a3 allowNoSuggest:(BOOL)a4 forAutocorrection:(BOOL)a5 shiftContext:(int)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v11;
  int var0;
  const KB::String *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const KB::String *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  KB::Word *v32;
  uint64_t v33;
  void *v34;
  id v36;
  void *v37;
  _BYTE v38[240];
  _BYTE v39[8];
  void *v40;
  uint64_t v41;
  KB::Word *v42;
  unsigned int v43;
  int v44;
  __int16 v45;
  char v46;
  void *v47;
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!self->m_impl)
    goto LABEL_25;
  v7 = a5;
  v8 = a4;
  -[TIKeyboardInputManager config](self, "config");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "usesRetrocorrection") & 1) == 0)
  {

    goto LABEL_25;
  }
  var0 = a3->var0;

  if (!var0)
  {
LABEL_25:
    v34 = 0;
    return v34;
  }
  v44 = 0x100000;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  v48 = 0;
  TIInputManager::phrase_completed_by_word((uint64_t)self->m_impl, (KB::String *)a3, (KB::String *)&v44, v8, v7, a6, (KB::Candidate *)&v41);
  if (v41)
  {
    KB::ns_string((KB *)&v44, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "documentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "selectedText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "documentState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "selectedText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingString:", v21);
      v22 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v22;
    }
    KB::Candidate::capitalized_string((KB::Candidate *)&v41, (uint64_t)v39);
    KB::ns_string((KB *)v39, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40 && v39[6] == 1)
      free(v40);
    if ((KB::Candidate::is_phrase_from_supplemental_lexicon((KB::Candidate *)&v41) & 1) == 0)
    {
      v26 = -[TIKeyboardInputManager prefixLengthOfInput:sharedWithCandidate:](self, "prefixLengthOfInput:sharedWithCandidate:", v15, &v41);
      if (v26)
      {
        v27 = v26;
        if ((objc_msgSend(v15, "isEqualToString:", v25) & 1) == 0)
        {
          objc_msgSend(v15, "substringFromIndex:", v27);
          v28 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "substringFromIndex:", v27);
          v29 = objc_claimAutoreleasedReturnValue();

          v25 = (void *)v29;
          v15 = (void *)v28;
        }
      }
    }
    if (objc_msgSend(v15, "rangeOfString:", CFSTR(" ")) == 0x7FFFFFFFFFFFFFFFLL)
      v30 = 1;
    else
      v30 = 33;
    if (v41)
    {
      LODWORD(v31) = 0;
      v32 = v42;
      v33 = 240 * v41;
      do
      {
        if ((*((_DWORD *)v32 + 26) & 0x80020100) != 0)
          v30 = v30 | 0x2000;
        else
          v30 = v30;
        KB::Word::Word((KB::Word *)v38, v32);
        v31 = -[TIKeyboardInputManager sourceMaskForWord:](self, "sourceMaskForWord:", v38) | v31;
        KB::Word::~Word((KB::Word *)v38);
        v32 = (KB::Word *)((char *)v32 + 240);
        v33 -= 240;
      }
      while (v33);
    }
    else
    {
      v31 = 0;
    }
    v36 = objc_alloc(MEMORY[0x1E0DBDDD0]);
    v34 = (void *)objc_msgSend(v36, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v25, v15, v14, v43, v30, v31);
    objc_msgSend(v34, "setIsFromPhraseDictionary:", 1);
    if (self->_supplementalPrefix)
      objc_msgSend(v34, "core_updateWithSupplementalItemPrefix:");
    if (v41)
    {
      KB::createNSArray<std::unordered_set<unsigned long long> const&>((uint64_t)v42 + 200);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setSupplementalItemIdentifiers:", v37);

    }
    else
    {
      objc_msgSend(v34, "setSupplementalItemIdentifiers:", MEMORY[0x1E0C9AA60]);
    }
    populateAutocorrectionAccuracyFields(v34, (float *)&v41);

  }
  else
  {
    v34 = 0;
  }
  KB::Candidate::~Candidate((KB::Candidate *)&v41);
  if (v47 && v46 == 1)
    free(v47);
  return v34;
}

- (BOOL)isEditingExistingWord
{
  _QWORD *m_impl;
  char *v5;
  uint64_t v6;
  unsigned int v7;
  const KB::String *v8;
  void *v9;
  KB *v10;
  unsigned __int16 *v11;
  char v12;
  _BYTE v13[8];
  void *v14;
  _BYTE v15[6];
  char v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_isEditingWordPrefix)
    return 1;
  m_impl = self->m_impl;
  v6 = m_impl[1];
  v5 = (char *)(m_impl + 1);
  v7 = -858993459 * ((unint64_t)(*((_QWORD *)v5 + 1) - v6) >> 3);
  if (*((_DWORD *)v5 + 22) >= v7)
    return 0;
  TIInputManager::input_substring((unsigned __int16 *)v5, 0, v7, (uint64_t)v15);
  KB::ns_string((KB *)v15, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v9);
  v10 = (KB *)objc_claimAutoreleasedReturnValue();

  if (v17 && v16 == 1)
    free(v17);
  v11 = (unsigned __int16 *)self->m_impl;
  TIInputManager::input_substring(v11 + 4, 0, -858993459 * ((*((_QWORD *)v11 + 2) - *((_QWORD *)v11 + 1)) >> 3), (uint64_t)v15);
  KB::utf8_string(v10, (uint64_t)v13);
  v12 = TIInputManager::dictionary_contains_word((TIInputManager *)v11, (const KB::String *)v15, (const KB::String *)v13, 0);
  if (v14 && v13[6] == 1)
    free(v14);
  if (v17)
  {
    if (v16 == 1)
      free(v17);
  }

  return (v12 & 1) != 0;
}

- (id)autocorrectionCandidateForInput:(id)a3 rawInput:(id)a4 withCandidate:(const void *)a5
{
  return -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:", a3, a4, a5, 0, 0x7FFFFFFFFFFFFFFFLL);
}

- (id)autocorrectionCandidateForInput:(id)a3 rawInput:(id)a4 withCandidate:(const void *)a5 insertingSpace:(BOOL)a6 sharedPrefixLength:(unint64_t)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  const KB::String *v14;
  void *v15;
  BOOL v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v42;
  _BOOL4 has_error_correction_type;
  int v44;
  unsigned int v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  unsigned __int8 *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  int v62;
  unsigned int v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  TIKeyboardInputManager *v70;
  void *v71;
  void *v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v93;
  uint64_t v94;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  BOOL v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  id v117;
  TIKeyboardInputManager *v118;
  _BYTE v119[8];
  void *v120;
  uint64_t v121;

  v8 = a6;
  v121 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  KB::Candidate::capitalized_string((KB::Candidate *)a5, (uint64_t)v119);
  KB::ns_string((KB *)v119, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v120)
    v16 = v119[6] == 1;
  else
    v16 = 0;
  if (v16)
    free(v120);
  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldConvertCandidateToExternal");

  if (v18)
  {
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v15);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v19;
  }
  if (v8)
  {
    v20 = v15;
    -[TIKeyboardInputManager wordSeparator](self, "wordSeparator");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v20;

  }
  else
  {
    v117 = 0;
  }
  if (a7 == 0x7FFFFFFFFFFFFFFFLL)
    a7 = -[TIKeyboardInputManager prefixLengthOfInput:sharedWithCandidate:](self, "prefixLengthOfInput:sharedWithCandidate:", v12, a5);
  if (a7)
  {
    objc_msgSend(v12, "substringFromIndex:", a7);
    v22 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "substringFromIndex:", a7);
    v23 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v23;
    v12 = (id)v22;
  }
  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v118 = self;
  if (objc_msgSend(v24, "shouldConvertAutocorrectionCandidatesToFullWidth"))
  {
    objc_msgSend(v12, "_lastGrapheme");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "_containsFullwidthLettersAndNumbers"))
    {

    }
    else
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v116 = v15;
      v26 = v12;
      v27 = v13;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "layoutState");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "layoutTag");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("Fullwidth"));

      v13 = v27;
      v12 = v26;
      v15 = v116;

      if (!v31)
        goto LABEL_22;
    }
    objc_msgSend(v15, "_stringByConvertingFromHalfWidthToFullWidth");
    v24 = v15;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  if ((*(_DWORD *)a5 & 0xFFFFFFFE) != 0)
    v32 = KB::Candidate::index_of_word_containing_position((KB::Candidate *)a5, a7);
  else
    v32 = 0;
  v33 = objc_msgSend(v15, "isEqualToString:", v12) ^ 1;
  v34 = v32;
  v36 = *(_QWORD *)a5;
  v35 = *((_QWORD *)a5 + 1);
  v37 = v35 + 240 * v32;
  v38 = v35 + 240 * *(_QWORD *)a5;
  if (*(_QWORD *)a5 == v32)
  {
    if (v37 != v38)
      v33 |= 2u;
LABEL_38:
    if (v37 != v38)
      v33 |= 4u;
LABEL_40:
    if (v37 != v38)
      v33 |= 0x40u;
LABEL_42:
    if (v37 != v38)
      v33 |= 0x100u;
LABEL_44:
    if (v37 != v38)
      v33 |= 0x200u;
LABEL_46:
    if (v37 == v38)
      v42 = v33;
    else
      v42 = v33 | 0x2000;
    goto LABEL_49;
  }
  v39 = 240 * v36 - 240 * v32;
  v40 = v35 + 240 * v32;
  while (!*(_DWORD *)(v40 + 120) || (*(_DWORD *)(v40 + 104) & 0x100000) != 0)
  {
    v40 += 240;
    v39 -= 240;
    if (!v39)
    {
      v40 = v35 + 240 * *(_QWORD *)a5;
      break;
    }
  }
  if (v40 != v38)
    v33 |= 2u;
  if (v36 == v32)
    goto LABEL_38;
  v74 = 240 * v36 - 240 * v32;
  v75 = v35 + 240 * v32;
  while ((*(_BYTE *)(v75 + 106) & 0x20) == 0)
  {
    v75 += 240;
    v74 -= 240;
    if (!v74)
    {
      v75 = v35 + 240 * *(_QWORD *)a5;
      break;
    }
  }
  if (v75 != v38)
    v33 |= 4u;
  if (v36 == v32)
    goto LABEL_40;
  v76 = 240 * v36 - 240 * v32;
  v77 = v35 + 240 * v32;
  while ((*(_BYTE *)(v77 + 107) & 1) == 0)
  {
    v77 += 240;
    v76 -= 240;
    if (!v76)
    {
      v77 = v35 + 240 * *(_QWORD *)a5;
      break;
    }
  }
  if (v77 != v38)
    v33 |= 0x40u;
  if (v36 == v32)
    goto LABEL_42;
  v78 = 240 * v36 - 240 * v32;
  v79 = v35 + 240 * v32;
  while ((*(_BYTE *)(v79 + 107) & 4) == 0)
  {
    v79 += 240;
    v78 -= 240;
    if (!v78)
    {
      v79 = v35 + 240 * *(_QWORD *)a5;
      break;
    }
  }
  if (v79 != v38)
    v33 |= 0x100u;
  if (v36 == v32)
    goto LABEL_44;
  v80 = 240 * v36 - 240 * v32;
  v81 = v35 + 240 * v32;
  while ((*(_DWORD *)(v81 + 104) & 0x2040000) != 0x2000000)
  {
    v81 += 240;
    v80 -= 240;
    if (!v80)
    {
      v81 = v35 + 240 * *(_QWORD *)a5;
      break;
    }
  }
  if (v81 != v38)
    v33 |= 0x200u;
  if (v36 == v32)
    goto LABEL_46;
  v82 = 240 * v36 - 240 * v32;
  while ((*(_BYTE *)(v37 + 105) & 1) == 0)
  {
    v37 += 240;
    v82 -= 240;
    if (!v82)
    {
      v37 = v35 + 240 * *(_QWORD *)a5;
      break;
    }
  }
  if (v37 == v38)
    v42 = v33;
  else
    v42 = v33 | 0x2000;
  if (v36 != v32)
  {
    v83 = -240 * v32 + 240 * v36 - 240;
    v84 = (uint64_t *)(240 * v32 + v35 + 224);
    do
    {
      v86 = *v84;
      v84 += 30;
      v85 = v86;
      if (v86)
        v87 = 1;
      else
        v87 = v83 == 0;
      v83 -= 240;
    }
    while (!v87);
    if (v85)
      v42 |= 0x100000u;
  }
LABEL_49:
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v32, 2))
    v42 |= 0x400u;
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v32, 4))
    v42 |= 0x800u;
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v32, 8))
    v42 |= 0x1000u;
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v32, 16))
    v42 |= 0x4000u;
  if (KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v32, 32))
    v42 |= 0x8000u;
  has_error_correction_type = KB::Candidate::has_error_correction_type((KB::Candidate *)a5, v32, 64);
  v44 = v42 | 0x10000;
  if (!has_error_correction_type)
    v44 = v42;
  v45 = v44 | *(_WORD *)(*((_QWORD *)a5 + 1) + 240 * *(_QWORD *)a5 - 134) & 8;
  v46 = objc_msgSend(v12, "rangeOfString:", CFSTR(" "));
  v47 = objc_msgSend(v15, "rangeOfString:", CFSTR(" "));
  if (v46 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v47 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v47 < objc_msgSend(v12, "length"))
        v45 |= 0x10u;
      else
        v45 |= 0x80u;
    }
  }
  else
  {
    if (v47 == 0x7FFFFFFFFFFFFFFFLL)
      v48 = 2097184;
    else
      v48 = 32;
    v45 |= v48;
  }
  v49 = *(_QWORD *)a5;
  v50 = *((_QWORD *)a5 + 1);
  if (*(_QWORD *)a5)
  {
    v51 = (unsigned __int8 *)(v50 + 192);
    v52 = 240 * v49;
    while (1)
    {
      v53 = *v51;
      v51 += 240;
      if (v53)
        break;
      v52 -= 240;
      if (!v52)
        goto LABEL_76;
    }
    v45 |= 0x40000u;
  }
LABEL_76:
  v54 = v50 + 240 * v49;
  if (*((_BYTE *)a5 + 960))
    v55 = v45 | 0x20000;
  else
    v55 = v45;
  v56 = v50 + 240 * v34;
  if (v49 == v34)
  {
    v57 = (v56 != v54) << 15;
LABEL_87:
    if (v56 == v54)
      v60 = v57;
    else
      v60 = v57 | 0x20000;
LABEL_90:
    if (v56 != v54)
      v60 |= 0x10000u;
LABEL_92:
    if (v56 == v54)
      v61 = v60;
    else
      v61 = v60 | 0x40000;
LABEL_95:
    if (v56 != v54)
      v61 |= 4u;
LABEL_97:
    if (v56 != v54)
      v61 |= 8u;
LABEL_99:
    if (v56 != v54)
      v61 |= 0x10u;
LABEL_101:
    if (v56 != v54)
      v61 |= 0x800u;
LABEL_103:
    if (v56 == v54)
      v62 = v61;
    else
      v62 = v61 | 0x20;
LABEL_106:
    if (v56 != v54)
      v62 |= 0x80u;
LABEL_108:
    if (v56 != v54)
      v62 |= 0x100u;
    goto LABEL_110;
  }
  v58 = 240 * v49 - 240 * v34;
  v59 = v50 + 240 * v34;
  while ((*(_BYTE *)(v59 + 106) & 4) == 0 || *(_BYTE *)(v59 + 192))
  {
    v59 += 240;
    v58 -= 240;
    if (!v58)
    {
      v59 = v50 + 240 * v49;
      break;
    }
  }
  v57 = (v59 != v54) << 15;
  if (v49 == v34)
    goto LABEL_87;
  v88 = 240 * v49 - 240 * v34;
  v89 = v50 + 240 * v34;
  while ((*(_BYTE *)(v89 + 106) & 4) == 0 || !*(_BYTE *)(v89 + 192))
  {
    v89 += 240;
    v88 -= 240;
    if (!v88)
    {
      v89 = v50 + 240 * v49;
      break;
    }
  }
  if (v89 == v54)
    v60 = v57;
  else
    v60 = v57 | 0x20000;
  if (v49 == v34)
    goto LABEL_90;
  v90 = 240 * v49 - 240 * v34;
  v91 = v50 + 240 * v34;
  while ((*(_DWORD *)(v91 + 104) & 0x80032000) == 0 || *(_BYTE *)(v91 + 192) != 0)
  {
    v91 += 240;
    v90 -= 240;
    if (!v90)
    {
      v91 = v50 + 240 * v49;
      break;
    }
  }
  if (v91 != v54)
    v60 |= 0x10000u;
  if (v49 == v34)
    goto LABEL_92;
  v93 = 240 * v49 - 240 * v34;
  v94 = v50 + 240 * v34;
  while ((*(_DWORD *)(v94 + 104) & 0x80032000) == 0 || *(_BYTE *)(v94 + 192) == 0)
  {
    v94 += 240;
    v93 -= 240;
    if (!v93)
    {
      v94 = v50 + 240 * v49;
      break;
    }
  }
  v61 = v60 | 0x40000;
  if (v94 == v54)
    v61 = v60;
  if (v49 == v34)
    goto LABEL_95;
  v96 = 240 * v49 - 240 * v34;
  v97 = v50 + 240 * v34;
  while ((*(_BYTE *)(v97 + 106) & 1) == 0)
  {
    v97 += 240;
    v96 -= 240;
    if (!v96)
    {
      v97 = v50 + 240 * v49;
      break;
    }
  }
  if (v97 != v54)
    v61 |= 4u;
  if (v49 == v34)
    goto LABEL_97;
  v98 = 240 * v49 - 240 * v34;
  v99 = v50 + 240 * v34;
  while ((*(_BYTE *)(v99 + 106) & 2) == 0)
  {
    v99 += 240;
    v98 -= 240;
    if (!v98)
    {
      v99 = v50 + 240 * v49;
      break;
    }
  }
  if (v99 != v54)
    v61 |= 8u;
  if (v49 == v34)
    goto LABEL_99;
  v100 = 240 * v49 - 240 * v34;
  v101 = v50 + 240 * v34;
  while ((*(_BYTE *)(v101 + 105) & 1) == 0)
  {
    v101 += 240;
    v100 -= 240;
    if (!v100)
    {
      v101 = v50 + 240 * v49;
      break;
    }
  }
  if (v101 != v54)
    v61 |= 0x10u;
  if (v49 == v34)
    goto LABEL_101;
  v102 = 240 * v49 - 240 * v34;
  v103 = v50 + 240 * v34;
  while ((*(_DWORD *)(v103 + 104) & 0x80000000) == 0)
  {
    v103 += 240;
    v102 -= 240;
    if (!v102)
    {
      v103 = v50 + 240 * v49;
      break;
    }
  }
  if (v103 != v54)
    v61 |= 0x800u;
  if (v49 == v34)
    goto LABEL_103;
  v104 = -240 * v34 + 240 * v49 - 240;
  v105 = (uint64_t *)(240 * v34 + v50 + 224);
  do
  {
    v107 = *v105;
    v105 += 30;
    v106 = v107;
    if (v107)
      v108 = 1;
    else
      v108 = v104 == 0;
    v104 -= 240;
  }
  while (!v108);
  if (v106)
    v61 |= 0x400u;
  if (v49 == v34)
    goto LABEL_103;
  v109 = 240 * v49 - 240 * v34;
  v110 = v56;
  while ((*(_BYTE *)(v110 + 106) & 0x80) == 0)
  {
    v110 += 240;
    v109 -= 240;
    if (!v109)
    {
      v110 = v54;
      break;
    }
  }
  if (v110 == v54)
    v62 = v61;
  else
    v62 = v61 | 0x20;
  if (v49 == v34)
    goto LABEL_106;
  v111 = 240 * v49 - 240 * v34;
  v112 = v56;
  while ((*(_BYTE *)(v112 + 107) & 0x10) == 0)
  {
    v112 += 240;
    v111 -= 240;
    if (!v111)
    {
      v112 = v54;
      break;
    }
  }
  if (v112 != v54)
    v62 |= 0x80u;
  if (v49 == v34)
    goto LABEL_108;
  v113 = 240 * v49 - 240 * v34;
  v114 = v56;
  while ((*(_BYTE *)(v114 + 107) & 8) == 0)
  {
    v114 += 240;
    v113 -= 240;
    if (!v113)
    {
      v114 = v54;
      break;
    }
  }
  if (v114 != v54)
    v62 |= 0x100u;
  if (v49 != v34)
  {
    v115 = 240 * v49 - 240 * v34;
    while ((*(_BYTE *)(v56 + 107) & 0x20) == 0)
    {
      v56 += 240;
      v115 -= 240;
      if (!v115)
      {
        v56 = v54;
        break;
      }
    }
  }
LABEL_110:
  if (v56 == v54)
    v63 = v62;
  else
    v63 = v62 | 0x200;
  if (*((_BYTE *)a5 + 963))
    v64 = v63 | 0x1000;
  else
    v64 = v63;
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD0]), "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:learningFlagsMask:", v15, v12, v13, *((unsigned int *)a5 + 194), v55, v64, *((unsigned __int8 *)a5 + 963));
  v66 = v65;
  v67 = *(_QWORD *)a5;
  if (*(_QWORD *)a5)
  {
    v68 = 240 * v67;
    v69 = *((_QWORD *)a5 + 1);
    v71 = v117;
    v70 = v118;
    while ((*(_BYTE *)(v69 + 105) & 0x80) == 0)
    {
      v69 += 240;
      v68 -= 240;
      if (!v68)
        goto LABEL_124;
    }
  }
  else
  {
    v69 = *((_QWORD *)a5 + 1);
    v71 = v117;
    v70 = v118;
  }
  if (v69 != *((_QWORD *)a5 + 1) + 240 * v67)
    objc_msgSend(v65, "setIsFromTextChecker:", 1);
LABEL_124:
  if (v70->_supplementalPrefix)
    objc_msgSend(v66, "core_updateWithSupplementalItemPrefix:");
  if (v34 < *(_DWORD *)a5)
  {
    KB::createNSArray<std::unordered_set<unsigned long long> const&>(*((_QWORD *)a5 + 1) + 240 * v34 + 200);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setSupplementalItemIdentifiers:", v72);

    if (!v71)
      goto LABEL_131;
    goto LABEL_130;
  }
  objc_msgSend(v66, "setSupplementalItemIdentifiers:", MEMORY[0x1E0C9AA60]);
  if (v71)
LABEL_130:
    objc_msgSend(v66, "setLabel:", v71);
LABEL_131:
  objc_msgSend(v66, "setTypingEngine:", *((unsigned int *)a5 + 248));
  populateAutocorrectionAccuracyFields(v66, (float *)a5);

  return v66;
}

- (BOOL)supportsShortcutConversion
{
  return 1;
}

- (id)shortcutConversionForString:(id)a3 stringStartsInMiddleOfWord:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a4;
  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10337;
  v20 = __Block_byref_object_dispose__10338;
  v21 = 0;
  v7 = -[TIKeyboardInputManager shortcutSearchRangeForString:](self, "shortcutSearchRangeForString:", v6);
  if (v8 < 0x41)
  {
    v9 = v7;
    v10 = v8;
    if (!v7 && v4)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0DBDDC8]);
      objc_msgSend(v11, "setString:withSearchRange:", v6, 0, v10);
      if (objc_msgSend(v11, "advanceToNextToken"))
      {
        v9 = 0;
      }
      else
      {
        v9 = v12;
        v10 = objc_msgSend(v6, "length") - v12;
      }

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__TIKeyboardInputManager_shortcutConversionForString_stringStartsInMiddleOfWord___block_invoke;
    v15[3] = &unk_1EA100F88;
    v15[4] = self;
    v15[5] = &v16;
    -[TIKeyboardInputManager enumerateWordSuffixesOfString:inRange:usingBlock:](self, "enumerateWordSuffixesOfString:inRange:usingBlock:", v6, v9, v10, v15);
  }
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (id)shortcutConversionForInput:(id)a3 andExistingString:(id)a4 existingStringStartsInMiddleOfWord:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = a3;
  -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager shortcutConversionForString:stringStartsInMiddleOfWord:](self, "shortcutConversionForString:stringStartsInMiddleOfWord:", v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)usesRetrocorrection
{
  _QWORD *m_impl;
  uint64_t v4;

  if (!-[TIKeyboardInputManager usesCandidateSelection](self, "usesCandidateSelection")
    && (m_impl = self->m_impl) != 0
    && *((_BYTE *)m_impl + 682))
  {
    v4 = m_impl[29];
    if (v4)
    {
      LODWORD(v4) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
      if ((_DWORD)v4)
      {
        LODWORD(v4) = (*(uint64_t (**)(_QWORD))(*(_QWORD *)m_impl[29] + 32))(m_impl[29]);
        if ((_DWORD)v4)
          LOBYTE(v4) = *(_QWORD *)(m_impl[28] + 32) == 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)suggestionBlocklistMatchesStrings:(id)a3
{
  id v4;
  void *m_impl;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  BOOL v10;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  _QWORD v24[6];
  std::__shared_weak_count *v25;
  uint64_t v26;
  std::__shared_weak_count *v27;

  v4 = a3;
  m_impl = self->m_impl;
  if (m_impl && (v6 = *((_QWORD *)m_impl + 29)) != 0)
  {
    v7 = (std::__shared_weak_count *)*((_QWORD *)m_impl + 30);
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 16))(v6) & 1) != 0)
    {
      std::shared_ptr<KB::LanguageModel>::reset[abi:nn180100](&self->m_lightweight_language_model.__ptr_);
    }
    else
    {
      -[TIKeyboardInputManager loadedLightweightLanguageModel](self, "loadedLightweightLanguageModel");
      v6 = v26;
      v12 = v27;
      v26 = 0;
      v27 = 0;
      if (v7)
      {
        v13 = (unint64_t *)&v7->__shared_owners_;
        do
          v14 = __ldaxr(v13);
        while (__stlxr(v14 - 1, v13));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
          std::__shared_weak_count::__release_weak(v7);
        }
      }
      v7 = v12;
    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3321888768;
    v24[2] = __60__TIKeyboardInputManager_suggestionBlocklistMatchesStrings___block_invoke;
    v24[3] = &unk_1EA100FB0;
    v24[4] = self;
    v24[5] = v6;
    v25 = v7;
    if (v7)
    {
      v17 = (unint64_t *)&v7->__shared_owners_;
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v10 = objc_msgSend(v4, "indexOfObjectPassingTest:", v24) != 0x7FFFFFFFFFFFFFFFLL;
    v19 = v25;
    if (v25)
    {
      v20 = (unint64_t *)&v25->__shared_owners_;
      do
        v21 = __ldaxr(v20);
      while (__stlxr(v21 - 1, v20));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    if (v7)
    {
      v22 = (unint64_t *)&v7->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)shouldDropInputStem
{
  _QWORD *m_impl;
  char v4;
  void *v6;
  KB *v7;
  _BYTE v8[8];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  m_impl = self->m_impl;
  if (!m_impl
    || !m_impl[29]
    || -[TIKeyboardInputManager isLinguisticResourceUpdateScheduled](self, "isLinguisticResourceUpdateScheduled"))
  {
    return 1;
  }
  -[TIKeyboardInputManager inputStem](self, "inputStem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v6);
  v7 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v7, (uint64_t)v8);

  v4 = (*(uint64_t (**)(_QWORD, _BYTE *, char *))(**((_QWORD **)self->m_impl + 29) + 480))(*((_QWORD *)self->m_impl + 29), v8, (char *)self->m_impl + 224);
  if (v9 && v8[6] == 1)
    free(v9);
  return v4;
}

- (BOOL)shouldAllowContextWord:(id)a3
{
  id v4;
  _QWORD *m_impl;
  uint64_t v6;
  KB *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  unsigned __int16 v17[3];
  char v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  m_impl = self->m_impl;
  if (m_impl && (v6 = m_impl[28]) != 0 && **(_QWORD **)(v6 + 8) != *(_QWORD *)(*(_QWORD *)(v6 + 8) + 8))
  {
    -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v4);
    v7 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v7, (uint64_t)v17);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    KB::DictionaryContainer::derive_static_words(*((KB::DictionaryContainer **)self->m_impl + 28), &v13, v17);
    if (v13 == v14)
    {
      v9 = 1;
    }
    else
    {
      v8 = v13 + 240;
      do
      {
        v9 = (*(_DWORD *)(v8 - 136) & 0x38000000) == 0;
        v10 = (*(_DWORD *)(v8 - 136) & 0x38000000) != 0 || v8 == v14;
        v8 += 240;
      }
      while (!v10);
    }
    v16 = (void **)&v13;
    std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100](&v16);
    if (v19)
      v11 = v18 == 1;
    else
      v11 = 0;
    if (v11)
      free(v19);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)cannedResponseCandidatesForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10337;
  v20 = __Block_byref_object_dispose__10338;
  v21 = 0;
  v4 = a3;
  +[TIResponseKitManager sharedTIResponseKitManager](TIResponseKitManager, "sharedTIResponseKitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "normalizedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recipientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__TIKeyboardInputManager_cannedResponseCandidatesForString___block_invoke;
  v15[3] = &unk_1EA100FE8;
  v15[4] = &v16;
  BYTE2(v14) = 0;
  LOWORD(v14) = 1;
  objc_msgSend(v5, "generateResponseKitSuggestionsForString:withLanguage:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:stringIsBlocklisted:async:completionHandler:", v4, v7, v9, v11, 0, 10, v14, v15);

  v12 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

- (void)generateCannedResponseCandidatesAsyncForString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v6 = a4;
  v7 = a3;
  +[TIResponseKitManager sharedTIResponseKitManager](TIResponseKitManager, "sharedTIResponseKitManager");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "normalizedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recipientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE2(v14) = 1;
  LOWORD(v14) = 1;
  objc_msgSend(v15, "generateResponseKitSuggestionsForString:withLanguage:withClientID:withRecipientID:withAdditionalPredictions:desiredCandidateCount:shouldDisableAutoCaps:stringIsBlocklisted:async:completionHandler:", v7, v9, v11, v13, 0, 10, v14, v6);

}

- (id)cachedAutocorrectionListResponseFor:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _BYTE v10[240];
  char v11;
  _BYTE v12[8];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_10;
  }
  v6 = objc_retainAutorelease(v4);
  KB::String::String((KB::String *)v12, (const char *)objc_msgSend(v6, "UTF8String"));
  KB::DynamicDictionary::word_from_supplemental_lexicon(*(_QWORD *)(*((_QWORD *)self->m_impl + 28) + 24), v10);
  if (v11)
  {
    v7 = 0;
LABEL_6:
    KB::Word::~Word((KB::Word *)v10);
    goto LABEL_7;
  }
  -[TIKeyboardInputManager autocorrectionListsForWordsInDocument](self, "autocorrectionListsForWordsInDocument");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_6;
LABEL_7:
  if (v13 && v12[6] == 1)
    free(v13);
LABEL_10:

  return v7;
}

- (id)autocorrectionListForSelectedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *m_impl;
  KB *v11;
  void *v12;
  _QWORD *v13;
  _QWORD *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void **v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager autocorrectionListsForWordsInDocument](self, "autocorrectionListsForWordsInDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && ((-[TIKeyboardInputManager keyboardState](self, "keyboardState"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v8, "shiftState"),
         v8,
         v9 == 2)
     || !v9 && !-[TIKeyboardInputManager nextInputWouldStartSentence](self, "nextInputWouldStartSentence")))
  {
    v25 = v7;
  }
  else
  {
    v27 = v7;
    m_impl = self->m_impl;
    -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v5);
    v11 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v11, (uint64_t)&v35);
    TIInputManager::candidates_for_string((uint64_t)m_impl, (const KB::String *)&v35, -[TIKeyboardInputManager shiftContext](self, "shiftContext"), (uint64_t)&v30);
    if (v36 && BYTE6(v35) == 1)
      free(v36);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    for (i = v31; v13 != i; v13 += 125)
    {
      if (*v13)
      {
        -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:", v5, 0, v13, 0, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "candidate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isEqualToString:", v5) & 1) == 0)
        {
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __59__TIKeyboardInputManager_autocorrectionListForSelectedText__block_invoke;
          v28[3] = &unk_1EA105CE0;
          v29 = v16;
          if (objc_msgSend(v12, "indexOfObjectPassingTest:", v28) == 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v12, "addObject:", v15);

        }
      }
    }
    -[TIKeyboardInputManager emojiCandidateGenerator](self, "emojiCandidateGenerator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "emojiReplacementCandidates:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v5, "_containsEmoji");
    if ((v20 & 1) != 0 || objc_msgSend(v19, "count"))
    {
      objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithCandidate:forInput:", v5, v5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0DBDB70]);
      if (v20)
        v23 = v21;
      else
        v23 = 0;
      v24 = (void *)objc_msgSend(v22, "initWithAutocorrection:alternateCorrections:", v23, 0);
      objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:", v24, v12, v19);
      v25 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:", 0, v12);
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v27;

    v35 = (void **)&v34;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v35);
    v35 = (void **)&v33;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v35);
    v35 = (void **)&v32;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v35);
    v35 = (void **)&v30;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v35);
  }

  return v25;
}

- (void)reconcileCandidates:(void *)a3 forTypedString:(String *)a4 withPhraseCandidate:(void *)a5 replacing:(const String *)a6
{
  unsigned __int16 var2;
  unsigned __int16 v11;
  int v12;
  char *var4;
  int var0;
  unsigned __int16 *v15;
  uint64_t i;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  int v23;
  int v24;
  int v25;
  _BYTE v26[8];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  var2 = a4->var2;
  if (!var2)
  {
    KB::String::compute_length(&a4->var0);
    var2 = a4->var2;
  }
  v11 = a6->var2;
  if (!v11)
  {
    KB::String::compute_length(&a6->var0);
    v11 = a6->var2;
  }
  v12 = (__int16)(var2 - v11);
  if (v12 < 1)
  {
    if (v12 < 0)
    {
      KB::String::operator=((KB::String *)a4, (KB::String *)a6);
      v17 = *(_QWORD *)a3;
      for (i = *((_QWORD *)a3 + 1); i != v17; KB::Candidate::~Candidate((KB::Candidate *)(i - 1000)))
        ;
      *((_QWORD *)a3 + 1) = v17;
    }
  }
  else
  {
    if (a4->var4)
      var4 = a4->var4;
    else
      var4 = a4->var5;
    v22 = var4;
    var0 = a4->var0;
    v23 = 0;
    v24 = var0;
    v25 = 0;
    KB::String::iterator::initialize((uint64_t *)&v22);
    *(_QWORD *)&v18 = var4;
    DWORD2(v18) = 0;
    HIDWORD(v18) = var0;
    LODWORD(v19) = 0;
    KB::String::iterator::initialize((uint64_t *)&v18);
    v20 = v18;
    v21 = v19;
    std::__advance[abi:nn180100]<KB::String::iterator>((KB::String::iterator *)&v20, (unsigned __int16)v12);
    v15 = (unsigned __int16 *)KB::String::String((KB::String *)v26, (const KB::String::iterator *)&v22, (const KB::String::iterator *)&v20);
    KB::String::append(v15, (const KB::String *)a6);
    KB::Candidate::Candidate((KB::Candidate *)&v22, (const KB::String *)v26, 0);
    KB::Candidate::operator=((uint64_t *)a5, (uint64_t *)&v22);
    KB::Candidate::~Candidate((KB::Candidate *)&v22);
    if (v27)
    {
      if (v26[6] == 1)
        free(v27);
    }
  }
}

- (BOOL)shouldGenerateSuggestionsForSelectedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)(objc_msgSend(v5, "length") - 1) > 0x3F)
  {
    v8 = 0;
  }
  else
  {
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentWord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v5);

  }
  return v8;
}

- (BOOL)shouldAutocapitalizePredictionAfterSpace
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  BOOL result;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autocapitalizationEnabled");

  if (!v4)
    return 0;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "autocapitalizationType");

  result = 1;
  if (v6 != 1 && v6 != 3)
  {
    if (v6 == 2)
      return -[TIKeyboardInputManager spaceAndNextInputWouldStartSentence](self, "spaceAndNextInputWouldStartSentence");
    return 0;
  }
  return result;
}

- (_NSRange)rangeOfUnclosedQuoteMatchingQuote:(id)a3 inString:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  unsigned int v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  NSUInteger v19;
  unint64_t v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  NSUInteger v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  NSUInteger v40;
  NSUInteger v41;
  id v42;
  NSUInteger v43;
  TIKeyboardInputManager *v44;
  NSUInteger v45;
  unsigned int v46;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  v9 = a3;
  v10 = a4;
  if (!objc_msgSend(v9, "length"))
    goto LABEL_5;
  v11 = objc_msgSend(v9, "characterAtIndex:", 0);
  v46 = v11;
  if (v11 == 34)
  {
    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "rightDoubleQuote");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length") != 1;

    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leftDoubleQuote");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v25, "characterAtIndex:", 0);

    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "rightDoubleQuote");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = v23;
    goto LABEL_7;
  }
  if (v11 != 39)
  {
LABEL_5:
    v19 = 0;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_25;
  }
  -[TIKeyboardInputManager smartOptions](self, "smartOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leftSingleQuote");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "characterAtIndex:", 0);

  -[TIKeyboardInputManager smartOptions](self, "smartOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rightSingleQuote");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v18 = 0;
LABEL_7:
  v26 = objc_msgSend(v16, "characterAtIndex:", v18);

  v27 = v46;
  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithRange:", v46, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addCharactersInRange:", v14, 1);
  objc_msgSend(v28, "addCharactersInRange:", v26, 1);
  v42 = v9;
  if (length)
  {
    v43 = location + length;
    v44 = self;
    v45 = location;
    do
    {
      v29 = objc_msgSend(v10, "rangeOfCharacterFromSet:options:range:", v28, 6, location, length);
      if (v29 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      v20 = v29;
      v19 = v30;
      v31 = objc_msgSend(v10, "characterAtIndex:", v29);
      if (v31 == v14)
        goto LABEL_24;
      if (v31 == v26)
        break;
      if (v31 == v27)
      {
        length = v20 - location;
        if (v20 <= location)
        {
          v35 = 1;
        }
        else
        {
          v32 = objc_msgSend(v10, "rangeOfComposedCharacterSequenceAtIndex:", v20 - 1);
          objc_msgSend(v10, "substringWithRange:", v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[TIKeyboardInputManager stringEndsWord:](v44, "stringEndsWord:", v34);

        }
        if (v20 + v19 >= v43)
        {
          v39 = 0;
          location = v45;
        }
        else
        {
          v36 = objc_msgSend(v10, "rangeOfComposedCharacterSequenceAtIndex:");
          objc_msgSend(v10, "substringWithRange:", v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = !-[TIKeyboardInputManager stringEndsWord:](v44, "stringEndsWord:", v38);

          location = v45;
          if ((v35 & v39 & 1) != 0)
            goto LABEL_24;
        }
        if ((v35 | v39) != 1)
          break;
        v27 = v46;
      }
    }
    while (length);
  }
  v19 = 0;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_24:

  v9 = v42;
LABEL_25:

  v40 = v20;
  v41 = v19;
  result.length = v41;
  result.location = v40;
  return result;
}

- (BOOL)stringEndsWithClosingQuote:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  int v21;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(v4, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v4, "length") - 1);
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "usesDirectionalQuotes") & 1) != 0)
    {
      -[TIKeyboardInputManager closingQuotes](self, "closingQuotes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "characterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v10);

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v12 = 1;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {

    }
    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "usesDirectionalQuotes") & 1) != 0)
    {
      -[TIKeyboardInputManager openingQuotes](self, "openingQuotes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "characterSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v7, "rangeOfCharacterFromSet:", v15);

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_13;
    }
    else
    {

    }
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("'")) & 1) != 0)
    {
      if (!v5)
      {
LABEL_13:
        v12 = 0;
        goto LABEL_20;
      }
    }
    else
    {
      v12 = 0;
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("\")) || !v5)
        goto LABEL_20;
    }
    v17 = objc_msgSend(v4, "rangeOfComposedCharacterSequenceAtIndex:", v5 - 1);
    objc_msgSend(v4, "substringWithRange:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(CFSTR("}])\"'”’.,?!;:…"), "rangeOfString:", v19);
    v21 = !-[TIKeyboardInputManager stringEndsWord:](self, "stringEndsWord:", v19);
    if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      v12 = v21;
    else
      v12 = 1;

    goto LABEL_20;
  }
  v12 = 0;
LABEL_21:

  return v12;
}

- (BOOL)shouldInsertSpaceBeforePredictions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  char v14;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v5, "length"))
  {
    v12 = 0;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v5, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v5, "length") - 1);
  objc_msgSend(v5, "substringWithRange:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager terminatorsPrecedingAutospace](self, "terminatorsPrecedingAutospace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "characterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "rangeOfCharacterFromSet:", v10) != 0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_7;
  }
  v11 = objc_msgSend(v8, "_containsEmoji");

  if ((v11 & 1) != 0)
  {
LABEL_7:
    v12 = 1;
    goto LABEL_8;
  }
  v12 = -[TIKeyboardInputManager stringEndsWithClosingQuote:](self, "stringEndsWithClosingQuote:", v5);
LABEL_8:
  -[TIKeyboardInputManager lastAcceptedText](self, "lastAcceptedText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "isContinuousPathConversion"))
  {
    v14 = objc_msgSend(v8, "isEqualToString:", CFSTR(" "));

    v12 |= v14 ^ 1;
  }
  else
  {

  }
LABEL_12:

  return v12;
}

- (id)predictionCandidates:(unint64_t)a3 predictionType:(int)a4
{
  uint64_t v4;
  unsigned int v5;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const KB::String *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  TIProactiveTrigger *v15;
  void *v16;
  void *v17;
  KB::Candidate *v18;
  KB::Candidate *v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  int *v23;
  char v24;
  int v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const KB::Candidate **v31;
  void **v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void **v38;
  void *v39;
  KB::Candidate *v40;
  KB::Candidate *v41;
  uint64_t v42;
  const KB::Candidate *v43;
  const KB::Candidate *v44;
  uint64_t v45;
  _BYTE v46[8];
  void *v47;
  uint64_t v48;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TIKeyboardInputManager shouldInsertSpaceBeforePredictions](self, "shouldInsertSpaceBeforePredictions");
  v8 = -[TIKeyboardInputManager shiftContext](self, "shiftContext");
  v9 = v8;
  v33 = v7;
  if (v7 && !(_DWORD)v8)
  {
    if (-[TIKeyboardInputManager shouldAutocapitalizePredictionAfterSpace](self, "shouldAutocapitalizePredictionAfterSpace"))
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = +[TIKeyboardInputManager shiftContextForShiftState:autocapitalizationType:](TIKeyboardInputManager, "shiftContextForShiftState:autocapitalizationType:", 2, objc_msgSend(v10, "autocapitalizationType"));

    }
    else
    {
      v9 = 0;
    }
  }
  TIInputManager::lookup((uint64_t)self->m_impl, v4, v5, v9, (uint64_t)&v40);
  v35 = 0;
  v36 = 0;
  v37 = 0;
  std::vector<KB::Candidate>::__init_with_size[abi:nn180100]<KB::Candidate*,KB::Candidate*>((KB::Candidate *)&v35, v43, v44, 0x1CAC083126E978D5 * ((v44 - v43) >> 3));
  v13 = v35;
  v12 = v36;
  if (v36 == v35)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0x1CAC083126E978D5 * ((v36 - v35) >> 3));
    do
    {
      v15 = -[TIProactiveTrigger initWithSourceType:attributes:]([TIProactiveTrigger alloc], "initWithSourceType:attributes:", 0, *(_QWORD *)(v13 + 976));
      objc_msgSend(v14, "addObject:", v15);

      v13 += 1000;
    }
    while (v13 != v12);
  }
  v31 = &v43;
  KB::ns_string((KB *)v46, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v40;
  v18 = v41;
  if (v40 != v41)
  {
    while (!*(_QWORD *)v19)
    {
LABEL_30:
      v19 = (KB::Candidate *)((char *)v19 + 1000);
      if (v19 == v18)
        goto LABEL_31;
    }
    KB::Candidate::capitalized_string(v19, (uint64_t)&v38);
    -[TIKeyboardInputManager phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:](self, "phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:", &v38, 0, 0, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39)
      v21 = BYTE6(v38) == 1;
    else
      v21 = 0;
    if (v21)
      free(v39);
    if (!v20)
    {
      if (*(_QWORD *)v19)
      {
        v22 = 240 * *(_QWORD *)v19 - 240;
        v23 = (int *)(*((_QWORD *)v19 + 1) + 104);
        do
        {
          v25 = *v23;
          v23 += 60;
          v24 = v25;
          if ((v25 & 0x10) != 0)
            break;
          v26 = v22;
          v22 -= 240;
        }
        while (v26);
        if ((v24 & 0x10) != 0)
        {
          v20 = 0;
LABEL_29:

          goto LABEL_30;
        }
      }
      -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:", v17, v16, v19, v33, 0x7FFFFFFFFFFFFFFFLL, v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v20, "input", v31);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (!v28)
      objc_msgSend(v34, "addObject:", v20);
    goto LABEL_29;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithPredictions:proactiveTriggers:", v34, v14, v31);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void **)&v35;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);
  if (v47 && v46[6] == 1)
    free(v47);
  v38 = (void **)&v45;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);
  v38 = v32;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);
  v38 = (void **)&v42;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);
  v38 = (void **)&v40;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v38);

  return v29;
}

- (id)continuousPathCandidates:(unint64_t)a3
{
  uint64_t v3;
  TIKeyboardInputManager *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  const KB::String *v15;
  uint64_t v16;
  _WORD *m_impl;
  void *v18;
  unsigned int v19;
  void *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  uint64_t v23;
  KB::String *v24;
  KB::Candidate *v25;
  int v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  int v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  KB::Candidate *v39;
  uint64_t v40;
  int *v41;
  char v42;
  int v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  int *v47;
  char v48;
  int v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  KB::String *v53;
  KB::String *v54;
  KB::String *v55;
  TIKeyboardInputManager *v56;
  void *v57;
  void *v58;
  const KB::String *v59;
  void *v60;
  char v61;
  void *v62;
  const KB::String *v63;
  void *v64;
  int v65;
  int *v66;
  void *v67;
  unsigned __int16 *v68;
  void *v69;
  uint64_t v70;
  int *v71;
  char v72;
  int v73;
  uint64_t v74;
  _BOOL8 v75;
  void *v76;
  float v77;
  double v78;
  unint64_t v79;
  uint64_t v80;
  void *v81;
  int v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  KB::String *v87;
  _BYTE *v88;
  KB::String *v89;
  unint64_t v90;
  _QWORD *v91;
  int *v92;
  void *v93;
  uint64_t v94;
  int *v95;
  char v96;
  int v97;
  uint64_t v98;
  void *v99;
  char v100;
  void *v101;
  float *v102;
  float v103;
  double v104;
  void *v105;
  id v106;
  void *v107;
  unint64_t v108;
  void *v109;
  unint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  unint64_t v119;
  void *v120;
  unint64_t v121;
  void *v122;
  void *v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  BOOL v145;
  _BOOL4 v146;
  TIKeyboardInputManager *v147;
  void *v148;
  void *v149;
  void *v150;
  unint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  unsigned int v155;
  unsigned int v156;
  unint64_t v157;
  _BYTE v158[8];
  void *v159;
  unsigned __int16 v160[3];
  char v161;
  void *v162;
  KB::String *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  _BYTE v167[40];
  void *v168;
  KB::String **v169;
  uint64_t v170;
  void (*v171)(uint64_t, unint64_t *, __CFString *);
  void *v172;
  uint64_t v173;
  int v174;
  unsigned int v175;
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  v3 = *((_QWORD *)self->m_impl + 28);
  if (!v3 || **(_QWORD **)(v3 + 8) == *(_QWORD *)(*(_QWORD *)(v3 + 8) + 8))
    return 0;
  v5 = self;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[TIKeyboardInputManager inputStem](v5, "inputStem");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v153 = v10;

  -[TIKeyboardInputManager keyboardState](v5, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectedText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v150 = 0;
  }
  else
  {
    TIInputManager::input_substring((unsigned __int16 *)v5->m_impl + 4, 0, *((_DWORD *)v5->m_impl + 24), (uint64_t)&v163);
    KB::ns_string((KB *)&v163, v15);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if (v164 && BYTE6(v163) == 1)
      free(v164);
  }

  if (-[TIKeyboardInputManager inputIndex](v5, "inputIndex")
    || !-[TIKeyboardInputManager shouldInsertSpaceBeforePredictions](v5, "shouldInsertSpaceBeforePredictions"))
  {
    m_impl = v5->m_impl;
    if (!m_impl[200])
    {
      v156 = -[TIKeyboardInputManager shiftContext](v5, "shiftContext");
      v16 = 0;
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "_stringWithUnichar:", KB::String::last((KB::String *)(m_impl + 200)));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TIKeyboardInputManager stringEndsWord:](v5, "stringEndsWord:", v18)
      || (objc_msgSend(v18, "isEqualToString:", CFSTR("'")) & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      v16 = objc_msgSend(v18, "isEqualToString:", CFSTR("-")) ^ 1;
    }

  }
  else
  {
    v16 = 1;
  }
  v19 = -[TIKeyboardInputManager shiftContext](v5, "shiftContext");
  v156 = v19;
  if ((_DWORD)v16 && !v19)
  {
    if (-[TIKeyboardInputManager shouldAutocapitalizePredictionAfterSpace](v5, "shouldAutocapitalizePredictionAfterSpace"))
    {
      -[TIKeyboardInputManager keyboardState](v5, "keyboardState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v156 = +[TIKeyboardInputManager shiftContextForShiftState:autocapitalizationType:](TIKeyboardInputManager, "shiftContextForShiftState:autocapitalizationType:", 2, objc_msgSend(v20, "autocapitalizationType"));

    }
    else
    {
      v156 = 0;
    }
    v16 = 1;
  }
LABEL_28:
  v21 = -[TIKeyboardInputManager _hasSupplementalPrefix](v5, "_hasSupplementalPrefix");
  if (KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix)
    v22 = 0;
  else
    v22 = v21;
  if (v22)
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 1;
  v23 = (uint64_t)v5->m_impl;
  v169 = (KB::String **)MEMORY[0x1E0C809B0];
  v170 = 0x40000000;
  v171 = ___ZN14TIInputManager6lookupEN2KB10LookupTypeEj14TIShiftContext_block_invoke;
  v172 = &__block_descriptor_tmp_7;
  v173 = v23;
  v174 = 5;
  v175 = v156;
  TIInputManager::perform_lookup(v23, 5, a3, (uint64_t)&v169, (uint64_t)&v163);
  v24 = v163;
  v25 = (KB::Candidate *)v164;
  v146 = v22;
  if (v163 == v164)
  {
    v25 = v163;
LABEL_51:
    v30 = (uint64_t *)v24;
    goto LABEL_52;
  }
  while (!*(_QWORD *)v24)
  {
LABEL_38:
    v24 = (KB::String *)((char *)v24 + 1000);
    if (v24 == v164)
    {
      v30 = (uint64_t *)v164;
      goto LABEL_52;
    }
  }
  v26 = 0;
  v27 = (uint64_t *)(*((_QWORD *)v24 + 1) + 224);
  v28 = 240 * *(_QWORD *)v24;
  while (1)
  {
    v29 = *v27;
    v27 += 30;
    v26 += v29;
    if ((v26 & 0xFFFFFFFE) != 0)
      break;
    v28 -= 240;
    if (!v28)
      goto LABEL_38;
  }
  if (v24 == v164)
    goto LABEL_51;
  v31 = (uint64_t *)((char *)v24 + 1000);
  if ((char *)v24 + 1000 == v164)
    goto LABEL_51;
  v30 = (uint64_t *)v24;
  do
  {
    v32 = v31;
    v33 = *((_QWORD *)v24 + 125);
    if (v33)
    {
      v34 = 0;
      v35 = (uint64_t *)(*((_QWORD *)v24 + 126) + 224);
      v36 = 240 * v33;
      while (1)
      {
        v37 = *v35;
        v35 += 30;
        v34 += v37;
        if ((v34 & 0xFFFFFFFE) != 0)
          break;
        v36 -= 240;
        if (!v36)
          goto LABEL_47;
      }
    }
    else
    {
LABEL_47:
      KB::Candidate::operator=(v30, v32);
      v30 += 125;
    }
    v31 = v32 + 125;
    v24 = (KB::String *)v32;
  }
  while (v32 + 125 != (uint64_t *)v25);
  v25 = (KB::Candidate *)v164;
LABEL_52:
  std::vector<KB::Candidate>::erase((uint64_t)&v163, v30, v25);
  v38 = (uint64_t *)v163;
  v39 = (KB::Candidate *)v164;
  v155 = v16;
  if (v163 == v164)
  {
    v39 = v163;
  }
  else
  {
    while (1)
    {
      if (*v38)
      {
        v40 = 240 * *v38 - 240;
        v41 = (int *)(v38[1] + 104);
        do
        {
          v43 = *v41;
          v41 += 60;
          v42 = v43;
          if ((v43 & 0x10) != 0)
            break;
          v44 = v40;
          v40 -= 240;
        }
        while (v44);
        if ((v42 & 0x10) != 0)
          break;
      }
      v38 += 125;
      if (v38 == v164)
      {
        v38 = (uint64_t *)v164;
        goto LABEL_72;
      }
    }
    if (v38 != v164)
    {
      v45 = v38 + 125;
      if (v38 + 125 != v164)
      {
        do
        {
          if (!*v45)
            goto LABEL_68;
          v46 = 240 * *v45 - 240;
          v47 = (int *)(v45[1] + 104);
          do
          {
            v49 = *v47;
            v47 += 60;
            v48 = v49;
            if ((v49 & 0x10) != 0)
              break;
            v50 = v46;
            v46 -= 240;
          }
          while (v50);
          if ((v48 & 0x10) == 0)
          {
LABEL_68:
            KB::Candidate::operator=(v38, v45);
            v38 += 125;
          }
          v45 += 125;
        }
        while (v45 != (uint64_t *)v39);
        v39 = (KB::Candidate *)v164;
      }
      v16 = v155;
    }
  }
LABEL_72:
  std::vector<KB::Candidate>::erase((uint64_t)&v163, v38, v39);
  if (v163 != v164)
  {
    v151 = a3;
    -[TIKeyboardInputManager rejectedConversionsForCurrentContinuousPath](v5, "rejectedConversionsForCurrentContinuousPath");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");

    v54 = v163;
    if (v52)
    {
      v55 = (KB::String *)v164;
      v56 = v5;
      if (v54 != v55)
      {
        do
        {
          -[TIKeyboardInputManager lastAcceptedText](v56, "lastAcceptedText");
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (v57)
          {
            if (*(_QWORD *)v54 < 2uLL)
              goto LABEL_88;
            -[TIKeyboardInputManager rejectedConversionsForCurrentContinuousPath](v56, "rejectedConversionsForCurrentContinuousPath");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            KB::Word::capitalized_string(*((KB::Word **)v54 + 1), (uint64_t)&v169);
            KB::ns_string((KB *)&v169, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v58, "containsObject:", v60);

            if (v170 && BYTE6(v169) == 1)
              free((void *)v170);

            v16 = v155;
            if ((v61 & 1) == 0)
              goto LABEL_88;
          }
          else
          {
            -[TIKeyboardInputManager rejectedConversionsForCurrentContinuousPath](v56, "rejectedConversionsForCurrentContinuousPath");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            KB::Candidate::capitalized_string(v54, (uint64_t)&v169);
            KB::ns_string((KB *)&v169, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v62, "containsObject:", v64);

            if (v170 && BYTE6(v169) == 1)
              free((void *)v170);

            v16 = v155;
            if (!v65)
              goto LABEL_88;
          }
          v54 = (KB::String *)((char *)v54 + 1000);
        }
        while (v54 != v55);
        v54 = v55;
      }
LABEL_88:

      v53 = v163;
      if (v54 == v163 || v54 == v164)
      {
        v54 = v163;
        if ((_DWORD)v16)
          goto LABEL_92;
        goto LABEL_95;
      }
      v53 = (KB::String *)std::__rotate_forward[abi:nn180100]<std::_ClassicAlgPolicy,std::__wrap_iter<KB::Candidate *>>((uint64_t *)v163, (uint64_t *)v54, (uint64_t *)v54 + 125);
      v54 = v163;
    }
    if ((_DWORD)v16)
    {
LABEL_92:
      KB::String::space(v53);
      v66 = &KB::String::space(void)::space;
      goto LABEL_96;
    }
LABEL_95:
    KB::String::empty_string(v53);
    v66 = &KB::String::empty_string(void)::empty_string;
LABEL_96:
    KB::Candidate::capitalized_string(v54, (uint64_t)v160);
    v68 = (unsigned __int16 *)KB::String::String((KB::String *)&v169, (const KB::String *)v66);
    KB::String::append(v68, (const KB::String *)v160);
    if (v162 && v161 == 1)
      free(v162);
    -[TIKeyboardInputManager phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:](v5, "phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:", &v169, 0, 1, v156);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v69)
    {
      if (*(_QWORD *)v54)
      {
        v70 = 240 * *(_QWORD *)v54 - 240;
        v71 = (int *)(*((_QWORD *)v54 + 1) + 104);
        do
        {
          v73 = *v71;
          v71 += 60;
          v72 = v73;
          if ((v73 & 0x10) != 0)
            break;
          v74 = v70;
          v70 -= 240;
        }
        while (v74);
        if ((v72 & 0x10) != 0)
        {
          v67 = 0;
          goto LABEL_158;
        }
      }
      -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:](v5, "autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:", v153, v150, v54, v16, 0x7FFFFFFFFFFFFFFFLL);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v75 = 1;
    objc_msgSend(v69, "setContinuousPathConversion:", 1);
    -[TIKeyboardInputManager config](v5, "config");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "usesContinuousPathProgressiveCandidates"))
      v75 = *((_BYTE *)v5->m_impl + 396) == 0;
    objc_msgSend(v69, "setShouldAccept:", v75);

    if (*((_DWORD *)v5->m_impl + 24) < -858993459
                                      * ((*((_QWORD *)v5->m_impl + 2) - *((_QWORD *)v5->m_impl + 1)) >> 3))
      objc_msgSend(v69, "setShouldInsertSpaceAfterSelection:", 1);
    v77 = *((float *)v54 + 192);
    v78 = 0.0;
    if (v77 > 0.00001)
      v78 = (float)(*((float *)v54 + 193) / v77);
    objc_msgSend(v69, "setExcessPathRatio:", v78);
    objc_msgSend(v69, "candidate");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v153, "length"))
    {
      v79 = v151;
      v80 = v156;
    }
    else
    {
      -[TIKeyboardInputManager config](v5, "config");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_msgSend(v81, "insertsSpaceAfterPredictiveInput");

      v79 = v151;
      v80 = v156;
      if (v82)
      {
        -[TIKeyboardInputManager wordSeparator](v5, "wordSeparator");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "stringByAppendingString:", v83);
        v84 = objc_claimAutoreleasedReturnValue();

        v152 = (void *)v84;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v69;
    objc_msgSend(v69, "candidate");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addObject:", v86);

    v89 = v163;
    v88 = v164;
    v148 = v85;
    if ((unint64_t)(0x1CAC083126E978D5 * (((_BYTE *)v164 - (_BYTE *)v163) >> 3)) < 2 || !v79)
    {
LABEL_157:
      -[TIKeyboardInputManager reconcileConversions:](v5, "reconcileConversions:", v149);
      -[TIKeyboardInputManager keyboardState](v5, "keyboardState");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "layoutState");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "inputMode");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticGetKeyForInputMode();
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticScalarIncrement();

      v136 = (void *)MEMORY[0x1E0CB3940];
      -[TIKeyboardInputManager keyboardState](v5, "keyboardState");
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "documentState");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v138, "contextBeforeInput");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "candidate");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "stringWithFormat:", CFSTR("%@ %@"), v139, v140);
      v141 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManager emojiCandidateGenerator](v5, "emojiCandidateGenerator");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "emojiReplacementCandidatesForText:", v141);
      v143 = (void *)objc_claimAutoreleasedReturnValue();

      v144 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:", v154, 0);
      objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:proactiveTriggers:", v144, v149, v143, 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_158:
      if (v170)
        v145 = BYTE6(v169) == 1;
      else
        v145 = 0;
      if (v145)
        free((void *)v170);
      goto LABEL_164;
    }
    v157 = 0;
    v90 = 1;
    v147 = v5;
    while (1)
    {
      v91 = (_QWORD *)((char *)v89 + 1000 * v90);
      if (*v91)
        break;
LABEL_152:
      v90 = (v90 + 1);
      if (0x1CAC083126E978D5 * ((v88 - (_BYTE *)v89) >> 3) <= v90 || v157 >= v79)
        goto LABEL_157;
    }
    if ((_DWORD)v16)
    {
      KB::String::space(v87);
      v92 = &KB::String::space(void)::space;
    }
    else
    {
      KB::String::empty_string(v87);
      v92 = &KB::String::empty_string(void)::empty_string;
    }
    KB::Candidate::capitalized_string((KB::String *)((char *)v89 + 1000 * v90), (uint64_t)v158);
    KB::String::String((KB::String *)v160, (const KB::String *)v92);
    KB::String::append(v160, (const KB::String *)v158);
    if (v159 && v158[6] == 1)
      free(v159);
    -[TIKeyboardInputManager phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:](v5, "phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:", v160, 0, 0, v80);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v93)
    {
      if (*v91)
      {
        v94 = 240 * *v91 - 240;
        v95 = (int *)(v91[1] + 104);
        do
        {
          v97 = *v95;
          v95 += 60;
          v96 = v97;
          if ((v97 & 0x10) != 0)
            break;
          v98 = v94;
          v94 -= 240;
        }
        while (v98);
        if ((v96 & 0x10) != 0)
        {
          v93 = 0;
          goto LABEL_148;
        }
      }
      -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:](v5, "autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:", v153, v150, (char *)v89 + 1000 * v90, v16, 0x7FFFFFFFFFFFFFFFLL);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v93, "candidate");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v85, "containsObject:", v99);

    if ((v100 & 1) != 0)
    {
LABEL_148:

      v87 = (KB::String *)v162;
      if (v162 && v161 == 1)
        free(v162);
      v89 = v163;
      v88 = v164;
      goto LABEL_152;
    }
    objc_msgSend(v93, "candidate");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addObject:", v101);

    objc_msgSend(v93, "setContinuousPathConversion:", 1);
    v102 = (float *)((char *)v89 + 1000 * v90);
    v103 = v102[192];
    v104 = 0.0;
    if (v103 > 0.00001)
      v104 = (float)(v102[193] / v103);
    objc_msgSend(v93, "setExcessPathRatio:", v104);
    objc_msgSend(v93, "candidate");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v152;
    objc_msgSend(v154, "input");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = objc_msgSend(v107, "length");
    objc_msgSend(v93, "input");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = objc_msgSend(v109, "length");

    objc_msgSend(v154, "input");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v111;
    if (v108 <= v110)
    {
      v119 = objc_msgSend(v111, "length");
      objc_msgSend(v93, "input");
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = objc_msgSend(v120, "length");

      if (v119 >= v121)
      {
        v85 = v148;
        goto LABEL_144;
      }
      objc_msgSend(v93, "input");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "input");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = objc_msgSend(v123, "length");
      objc_msgSend(v154, "input");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "substringToIndex:", v124 - objc_msgSend(v125, "length"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v116, "stringByAppendingString:", v106);
      v126 = objc_claimAutoreleasedReturnValue();
      v118 = v106;
      v106 = (id)v126;
    }
    else
    {
      objc_msgSend(v154, "input");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v113, "length");
      objc_msgSend(v93, "input");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v112, "substringToIndex:", v114 - objc_msgSend(v115, "length"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v155;
      objc_msgSend(v116, "stringByAppendingString:", v105);
      v117 = objc_claimAutoreleasedReturnValue();
      v118 = v105;
      v105 = (void *)v117;
    }
    v85 = v148;

LABEL_144:
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "stringByTrimmingCharactersInSet:", v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v128, "isEqualToString:", v105) & 1) != 0)
      v129 = 0;
    else
      v129 = v128;
    objc_msgSend(v93, "candidateByReplacingWithCandidate:input:label:", v105, v106, v129);
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "addObject:", v130);
    ++v157;

    v5 = v147;
    v79 = v151;
    v80 = v156;
    goto LABEL_148;
  }
  v67 = 0;
LABEL_164:
  if (v168 && v167[38] == 1)
    free(v168);
  v169 = (KB::String **)v167;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
  v169 = (KB::String **)&v166;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
  v169 = (KB::String **)&v165;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
  v169 = &v163;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)&v169);
  if (v146)
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 0;

  return v67;
}

- (id)indexesOfDuplicatesInCandidates:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E20];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__TIKeyboardInputManager_indexesOfDuplicatesInCandidates___block_invoke;
  v9[3] = &unk_1EA105CE0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)autocorrectionListForEmptyInputWithDesiredCandidateCount:(unint64_t)a3
{
  NSObject *v5;
  const void *v6;
  os_signpost_id_t v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  os_signpost_id_t v42;
  void *v43;
  void *v44;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  uint8_t v50[16];
  uint8_t buf[16];

  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)((unint64_t)self ^ 0x12);
  v7 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0x12));
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v8, "kbdManager.generatePredictions", ", buf, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager emojiCandidateGenerator](self, "emojiCandidateGenerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emojiAdornmentCandidatesForKeyboardState:", v12);
  v13 = objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "documentState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "documentIsEmpty");

  if (v16)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "responseContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {

    }
    else
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "inputContextHistory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_9;
    }
    -[TIKeyboardInputManager learnRecentMessageUserIsRespondingTo](self, "learnRecentMessageUserIsRespondingTo");
LABEL_9:
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "textInputTraits");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "textContentType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 && objc_msgSend(v23, "length"))
    {
      v48 = a3;
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "textInputTraits");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "textContentType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:](TIProactiveQuickTypeManager, "proactiveTriggerForTextContentType:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        objc_msgSend(v10, "addObject:", v27);

      a3 = v48;
    }

  }
  -[TIKeyboardInputManager predictionCandidates:predictionType:](self, "predictionCandidates:predictionType:", a3, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "predictions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v29);

  -[TIKeyboardInputManager indexesOfDuplicatesInCandidates:](self, "indexesOfDuplicatesInCandidates:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectsAtIndexes:", v30);

  objc_msgSend(v28, "proactiveTriggers");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v31);

  if (_os_feature_enabled_impl())
  {
    v47 = v13;
    v49 = v9;
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "textInputTraits");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "textContentType");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "documentState");
    v35 = v10;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "contextBeforeInput");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIProactiveQuickTypeManager proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:](TIProactiveQuickTypeManager, "proactiveTriggerForTextContentType:withContextBeforeInput:autofillMode:", v33, v37, objc_msgSend(v38, "autofillMode"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v35;
    if (v39)
      objc_msgSend(v35, "addObject:", v39);

    v6 = (const void *)((unint64_t)self ^ 0x12);
    v9 = v49;
    v13 = v47;
  }
  kdebug_trace();
  kac_get_log();
  v40 = (id)objc_claimAutoreleasedReturnValue();
  v41 = os_signpost_id_make_with_pointer(v40, v6);
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v42 = v41;
    if (os_signpost_enabled(v40))
    {
      *(_WORD *)v50 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v40, OS_SIGNPOST_INTERVAL_END, v42, "kbdManager.generatePredictions", ", v50, 2u);
    }
  }

  objc_msgSend(MEMORY[0x1E0DBDB48], "listWithPredictions:emojiList:proactiveTriggers:", v9, v13, v10);
  v43 = (void *)v13;
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (int)shiftContext
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shiftState");
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[TIKeyboardInputManager shiftContextForShiftState:autocapitalizationType:](TIKeyboardInputManager, "shiftContextForShiftState:autocapitalizationType:", v4, objc_msgSend(v5, "autocapitalizationType"));

  return v6;
}

- (id)newKeyboardContext
{
  TIKeyboardInputManagerKeyboardContext *v3;
  void *v4;
  TIKeyboardInputManagerKeyboardContext *v5;
  void *v6;

  v3 = [TIKeyboardInputManagerKeyboardContext alloc];
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TIKeyboardInputManagerKeyboardContext initWithKeyboardState:](v3, "initWithKeyboardState:", v4);

  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerKeyboardContext setRevisionHistory:](v5, "setRevisionHistory:", v6);

  return v5;
}

- (id)completionCandidates:(unint64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  void *v9;
  const KB::String *v10;
  void *v11;
  void *v12;
  KB::Candidate *v13;
  KB::Candidate *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  char v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  os_signpost_id_t v24;
  os_signpost_id_t v25;
  void *ptr;
  uint8_t v28[8];
  void *v29;
  uint8_t buf[8];
  KB::Candidate *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[8];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  kac_get_log();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  ptr = (void *)((unint64_t)self ^ 0x13);
  v6 = os_signpost_id_make_with_pointer(v5, (const void *)((unint64_t)self ^ 0x13));
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "kbdManager.generateCompletions", ", buf, 2u);
    }
  }

  v8 = -[TIKeyboardInputManager shiftContext](self, "shiftContext");
  (*(void (**)(uint8_t *__return_ptr, void *, unint64_t, uint64_t))(*(_QWORD *)self->m_impl + 24))(buf, self->m_impl, a3, v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0x1CAC083126E978D5 * (((uint64_t)v31 - *(_QWORD *)buf) >> 3));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  KB::ns_string((KB *)v35, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager internalStringToExternal:ignoreCompositionDisabled:](self, "internalStringToExternal:ignoreCompositionDisabled:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(KB::Candidate **)buf;
  v14 = v31;
  if (*(KB::Candidate **)buf != v31)
  {
    while (!*(_QWORD *)v13)
    {
LABEL_20:
      v13 = (KB::Candidate *)((char *)v13 + 1000);
      if (v13 == v14)
        goto LABEL_21;
    }
    v15 = v12;
    KB::Candidate::capitalized_string(v13, (uint64_t)v28);
    -[TIKeyboardInputManager phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:](self, "phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:", v28, 0, 0, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29 && v28[6] == 1)
      free(v29);
    if (!v16)
    {
      v17 = *(_QWORD *)v13;
      if (*(_QWORD *)v13)
      {
        v18 = 240 * v17 - 240;
        v19 = (int *)(*((_QWORD *)v13 + 1) + 104);
        do
        {
          v21 = *v19;
          v19 += 60;
          v20 = v21;
          if ((v21 & 0x10) != 0)
            break;
          v22 = v18;
          v18 -= 240;
        }
        while (v22);
        if ((v20 & 0x10) != 0
          || (v17 & 0xFFFFFFFE) != 0 && !-[TIKeyboardInputManager _canSuggestPhraseCandidate:withStem:](self, v13, v15))
        {
          goto LABEL_19;
        }
      }
      -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:", v15, v11, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "addObject:", v16);

LABEL_19:
    goto LABEL_20;
  }
LABEL_21:
  kdebug_trace();
  kac_get_log();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_make_with_pointer(v23, ptr);
  if (v24 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    v25 = v24;
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)v28 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v23, OS_SIGNPOST_INTERVAL_END, v25, "kbdManager.generateCompletions", ", v28, 2u);
    }
  }

  if (v36 && v35[6] == 1)
    free(v36);
  *(_QWORD *)v28 = &v34;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v28);
  *(_QWORD *)v28 = &v33;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v28);
  *(_QWORD *)v28 = &v32;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v28);
  *(_QWORD *)v28 = buf;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)v28);
  return v9;
}

- (id)extendedAutocorrection:(id)a3 spanningInputsForCandidates:(id)a4 emojis:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  TIKeyboardInputManager *v48;
  uint64_t v49;
  id v50;
  id v51;
  __CFString *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v48 = self;
  v58 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v51 = a5;
  objc_msgSend(v7, "candidate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = &stru_1EA1081D0;
  v52 = v11;

  v50 = v7;
  objc_msgSend(v7, "input");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (__CFString *)v12;
  else
    v14 = &stru_1EA1081D0;
  v15 = v14;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v54 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if ((objc_msgSend(v21, "isSupplementalItemCandidate", v48) & 1) == 0)
        {
          objc_msgSend(v21, "input");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v22, "length"))
            goto LABEL_21;
          objc_msgSend(v21, "input");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if ((-[__CFString hasSuffix:](v15, "hasSuffix:", v23) & 1) != 0)
            goto LABEL_20;
          if (!-[__CFString length](v15, "length"))
          {

LABEL_19:
            objc_msgSend(v21, "input");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "length");
            v28 = v27 - -[__CFString length](v15, "length");

            objc_msgSend(v21, "input");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "substringToIndex:", v28);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "stringByAppendingString:", v52);
            v30 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "stringByAppendingString:", v15);
            v23 = v15;
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v52 = (__CFString *)v30;
LABEL_20:

LABEL_21:
            continue;
          }
          objc_msgSend(v21, "input");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "hasSuffix:", v15);

          if (v25)
            goto LABEL_19;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v18);
  }

  v31 = v51;
  if (objc_msgSend(v51, "count"))
  {
    objc_msgSend(v51, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "input");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v50;
    if (objc_msgSend(v33, "containsString:", CFSTR(" ")))
    {
      v35 = objc_msgSend(v33, "length");
      if (v35 > -[__CFString length](v15, "length"))
      {
        if (objc_msgSend(v33, "hasSuffix:", v15))
        {
          objc_msgSend(v33, "substringToIndex:", objc_msgSend(v33, "length") - -[__CFString length](v15, "length"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "stringByAppendingString:", v52);
          v37 = objc_claimAutoreleasedReturnValue();

          v38 = v33;
          v15 = v38;
          v52 = (__CFString *)v37;
        }
      }
    }

  }
  else
  {
    v34 = v50;
  }
  objc_msgSend(v34, "input", v48);
  v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v15 == v39)
  {
    v45 = v34;
  }
  else
  {
    v40 = objc_msgSend(v34, "wordOriginFeedbackID");
    v41 = objc_msgSend(v34, "usageTrackingMask");
    v42 = objc_msgSend(v34, "sourceMask");
    v43 = objc_alloc(MEMORY[0x1E0DBDDD0]);
    objc_msgSend(v34, "rawInput");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (id)objc_msgSend(v43, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v52, v15, v44, v40, v41, v42);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v45, "setIsFromPhraseDictionary:", objc_msgSend(v34, "isFromPhraseDictionary"));
      objc_msgSend(v45, "setIsFromTextChecker:", objc_msgSend(v34, "isFromTextChecker"));
    }
    v31 = v51;
    if (*(_WORD *)(v49 + 282))
      objc_msgSend(v45, "core_updateWithSupplementalItemPrefix:");
    objc_msgSend(v34, "supplementalItemIdentifiers");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setSupplementalItemIdentifiers:", v46);

  }
  return v45;
}

- (void)reconcileConversions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t i;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v34;
    v7 = &stru_1EA1081D0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v9, "input");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "length");
        v12 = -[__CFString length](v7, "length");

        if (v11 > v12)
        {
          objc_msgSend(v9, "input");
          v13 = objc_claimAutoreleasedReturnValue();

          v7 = (__CFString *)v13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v5);
  }
  else
  {
    v7 = &stru_1EA1081D0;
  }
  if (objc_msgSend(v3, "count"))
  {
    v14 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[__CFString length](v7, "length");
      objc_msgSend(v15, "input");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16 - objc_msgSend(v17, "length");

      if (v18 >= 1)
      {
        -[__CFString substringToIndex:](v7, "substringToIndex:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "input");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByAppendingString:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "candidate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v19;
        objc_msgSend(v19, "stringByAppendingString:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = objc_msgSend(v15, "wordOriginFeedbackID");
        v25 = objc_msgSend(v15, "usageTrackingMask");
        v26 = objc_msgSend(v15, "sourceMask");
        v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD0]), "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v23, v21, 0, v24, v25, v26);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = v15;
          objc_msgSend(v27, "setIsFromPhraseDictionary:", objc_msgSend(v28, "isFromPhraseDictionary"));
          objc_msgSend(v27, "setIsFromTextChecker:", objc_msgSend(v28, "isFromTextChecker"));
          v29 = objc_msgSend(v28, "isContinuousPathConversion");

          objc_msgSend(v27, "setContinuousPathConversion:", v29);
        }
        if (self->_supplementalPrefix)
          objc_msgSend(v27, "core_updateWithSupplementalItemPrefix:");
        objc_msgSend(v15, "supplementalItemIdentifiers");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setSupplementalItemIdentifiers:", v30);

        objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v14, v27);
      }

      ++v14;
    }
    while (v14 < objc_msgSend(v3, "count"));
  }

}

- (NSCharacterSet)allowPredictionCharacterSet
{
  NSCharacterSet *allowPredictionCharacterSet;
  void *v4;
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
  NSCharacterSet *v15;
  NSCharacterSet *v16;

  allowPredictionCharacterSet = self->_allowPredictionCharacterSet;
  if (!allowPredictionCharacterSet)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR(" \n\t\"(.,?!:;)@#"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sentencePrefixingCharacters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v6);

    -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sentenceDelimitingCharacters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v8);

    -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sentenceTrailingCharacters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v10);

    v11 = (void *)MEMORY[0x1E0CB3500];
    -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wordMedialPunctuationCharacters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "characterSetWithCharactersInString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_removeCharactersFromSet:", v14);
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", v4);
    v15 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    v16 = self->_allowPredictionCharacterSet;
    self->_allowPredictionCharacterSet = v15;

    allowPredictionCharacterSet = self->_allowPredictionCharacterSet;
  }
  return allowPredictionCharacterSet;
}

- (BOOL)shouldGeneratePredictionsForCurrentContext
{
  void *v3;
  int v4;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  int v21;
  char v22;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "predictionEnabled");

  -[TIKeyboardInputManager config](self, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "usesWordNgramModel") & 1) == 0)
  {
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "supportsMultilingualKeyboard");

    if ((v8 & v4 & 1) == 0)
      return 0;
LABEL_5:
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contextBeforeInput");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "length"))
    {
      v6 = 1;
LABEL_21:

      return v6;
    }
    v12 = objc_msgSend(v11, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v11, "length") - 1);
    objc_msgSend(v11, "substringWithRange:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager allowPredictionCharacterSet](self, "allowPredictionCharacterSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "rangeOfCharacterFromSet:", v15);

    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_17;
    if ((objc_msgSend(v14, "_containsEmoji") & 1) == 0)
    {
      if (_os_feature_enabled_impl())
      {
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "needContactAutofill");

      }
      else
      {
        v18 = 0;
      }
      -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "languageWithRegion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("th_TH"));

      if (v21)
      {
        if (-[TIKeyboardInputManager inputIndex](self, "inputIndex"))
          v22 = v18;
        else
          v22 = 1;
        if ((v22 & 1) != 0)
          goto LABEL_17;
      }
      else if ((v18 & 1) != 0)
      {
LABEL_17:
        v6 = 1;
LABEL_20:

        goto LABEL_21;
      }
    }
    v6 = 0;
    goto LABEL_20;
  }

  if (v4)
    goto LABEL_5;
  return 0;
}

- (BOOL)allowsAutocorrectionForCurrentInputString
{
  return 1;
}

- (id)typedStringForEmptyAutocorrection
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  const KB::String *v11;
  void *v12;
  void *v13;
  _QWORD v14[7];
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__10337;
    v19 = __Block_byref_object_dispose__10338;
    v20 = &stru_1EA1081D0;
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "selectedRange");

    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__TIKeyboardInputManager_typedStringForEmptyAutocorrection__block_invoke;
    v14[3] = &unk_1EA101018;
    v14[5] = &v15;
    v14[6] = v5;
    v14[4] = self;
    objc_msgSend(v6, "enumerateSentenceStemUsingBlock:", v14);

    if (!CEMStringIsSingleEmoji())
    {
      -[TIKeyboardInputManager inputStem](self, "inputStem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*((id *)v16 + 5), "length");
      if (v8 > objc_msgSend(v7, "length"))
        objc_storeStrong((id *)v16 + 5, v7);

    }
    v9 = *((id *)v16 + 5);
    _Block_object_dispose(&v15, 8);

    return v9;
  }
  else
  {
    TIInputManager::legacy_input_stem((TIInputManager *)self->m_impl, (uint64_t)&v15);
    KB::ns_string((KB *)&v15, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager internalStringToExternal:](self, "internalStringToExternal:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 && BYTE6(v15) == 1)
      free(v16);
    return v13;
  }
}

- (BOOL)doesSelectedTextGenerateEmojiCandidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TIKeyboardInputManager emojiCandidateGenerator](self, "emojiCandidateGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emojiReplacementCandidates:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v8, "count") != 0;

  return v9;
}

- (id)candidateResultSet
{
  void *v3;
  void *v4;

  -[TIKeyboardInputManager candidates](self, "candidates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager candidateResultSetFromCandidates:](self, "candidateResultSetFromCandidates:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&a3;
  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "acceptsCharacter:", v3);

  return v3;
}

- (BOOL)acceptsRange:(_NSRange)a3 inString:(id)a4
{
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__TIKeyboardInputManager_acceptsRange_inString___block_invoke;
  v6[3] = &unk_1EA101040;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(a4, "_enumerateLongCharactersInRange:usingBlock:", a3.location, a3.length, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)forceInstallTypologyTraceLogger
{
  _QWORD *v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  _QWORD *m_impl;
  TypologyLogger *ptr;
  __shared_weak_count *cntrl;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  __int128 v14;

  v3 = operator new(0x28uLL);
  v3[1] = 0;
  v3[2] = 0;
  *v3 = &off_1EA101258;
  v3[3] = &off_1EA105998;
  v3[4] = CFStringCreateMutable(0, 0);
  *(_QWORD *)&v14 = v3 + 3;
  *((_QWORD *)&v14 + 1) = v3;
  std::shared_ptr<std::vector<KB::LanguageModelContext>>::operator=[abi:nn180100]((uint64_t)&self->m_typology_recorder, &v14);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v14 + 1);
  if (*((_QWORD *)&v14 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v14 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  m_impl = self->m_impl;
  ptr = self->m_typology_recorder.__ptr_;
  cntrl = self->m_typology_recorder.__cntrl_;
  if (cntrl)
  {
    v10 = (unint64_t *)((char *)cntrl + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](m_impl + 71, (uint64_t)ptr, (uint64_t)cntrl);
    v12 = (unint64_t *)((char *)cntrl + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
  else
  {
    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](m_impl + 71, (uint64_t)ptr, 0);
  }
}

- (BOOL)isTransliterationManager
{
  return 0;
}

- (unsigned)predominantLexiconInContext
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  unsigned int v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v14;
  std::__shared_weak_count *v15;
  void *__p;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void **v21;

  if (!*((_QWORD *)self->m_impl + 29))
    return 0;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextBeforeInput");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_1EA1081D0;
  v8 = v7;

  -[TIKeyboardInputManager sentenceContextForInputStem:inputContext:](self, "sentenceContextForInputStem:inputContext:", &stru_1EA1081D0, v8);
  v9 = (*(uint64_t (**)(_QWORD, uint64_t *))(**((_QWORD **)self->m_impl + 29) + 416))(*((_QWORD *)self->m_impl + 29), &v14);
  v21 = (void **)&v20;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100](&v21);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v19);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v18);
  if (__p)
  {
    v17 = __p;
    operator delete(__p);
  }
  v10 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }

  return v9;
}

- (id)resourceInputModes
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager dictionaryInputMode](self, "dictionaryInputMode");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (void)didUpdateInputModes:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "activeInputModes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager emojiCandidateGenerator](self, "emojiCandidateGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateForActiveInputModes:", v5);

}

- (unsigned)adjustedSourceMaskFromCandidate:(id)a3
{
  id v4;
  int v5;
  KB *v6;
  void *v7;
  void *v8;
  const KB::String *v9;
  const KB::String *v10;
  unsigned int v11;
  BOOL v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  unsigned int v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  _BYTE v27[8];
  void *v28;
  _OWORD buf[2];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "sourceMask");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v4, "candidate");
    v6 = (KB *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locale");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string_tokens_from_string(v6, (KB::String *)v26);

    v9 = (const KB::String *)v26[0];
    v10 = (const KB::String *)v26[1];
    while (v9 != v10)
    {
      KB::String::String((KB::String *)buf, v9);
      KB::String::String((KB::String *)v27, (const KB::String *)buf);
      v11 = -[TIKeyboardInputManager sourceMaskForWordString:caseSensitive:](self, "sourceMaskForWordString:caseSensitive:", v27, 0);
      if (v28)
        v12 = v27[6] == 1;
      else
        v12 = 0;
      if (v12)
        free(v28);
      if (*((_QWORD *)&buf[0] + 1))
      {
        if (BYTE6(buf[0]) == 1)
          free(*((void **)&buf[0] + 1));
      }
      v5 |= v11;
      v9 = (const KB::String *)((char *)v9 + 32);
    }
    *(_QWORD *)&buf[0] = v26;
    std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 |= 4u;
  if (objc_msgSend(v4, "isResponseKitCandidate"))
    v13 = v5 | 0x2000;
  else
    v13 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "proactiveTrigger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      v13 |= 0x40u;
  }
  objc_msgSend(v4, "candidate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_containsEmoji");

  if (v16)
    v17 = v13 | 0x4000;
  else
    v17 = v13;
  if (objc_msgSend(v4, "isToucanInlineCompletionCandidate"))
    v17 |= 0x80000u;
  if (IXACanLogMessageAtLevel())
  {
    IXADefaultLogFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "candidate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "input");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sourceMask");
      TIStatisticCandidateSourceAsString();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      TIStatisticCandidateSourceAsString();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("%s SourceMaskTesting |%@|%@|%@|%@|"), "-[TIKeyboardInputManager adjustedSourceMaskFromCandidate:]", v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf[0]) = 138412290;
      *(_QWORD *)((char *)buf + 4) = v25;
      _os_log_debug_impl(&dword_1DA6F2000, v18, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)buf, 0xCu);

    }
  }

  return v17;
}

- (unsigned)sourceMaskForWordString:(String *)a3 caseSensitive:(BOOL)a4
{
  const KB::Word *v5;
  const KB::Word *v6;
  unsigned int v7;
  unsigned int v8;
  const KB::Word *v10;
  const KB::Word *v11;
  const KB::Word **v12;
  _BYTE v13[240];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TIInputManager::matching_words_from_dictionary((TIInputManager *)self->m_impl, (const KB::String *)a3, (const KB::String *)a3, a4, (uint64_t *)&v10);
  v5 = v10;
  v6 = v11;
  if (v10 == v11)
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      KB::Word::Word((KB::Word *)v13, v5);
      v8 = -[TIKeyboardInputManager sourceMaskForWord:](self, "sourceMaskForWord:", v13);
      KB::Word::~Word((KB::Word *)v13);
      v7 |= v8;
      v5 = (const KB::Word *)((char *)v5 + 240);
    }
    while (v5 != v6);
  }
  v12 = &v10;
  std::vector<KB::Word>::__destroy_vector::operator()[abi:nn180100]((void ***)&v12);
  return v7;
}

- (unsigned)sourceMaskForWord:(Word *)a3
{
  int var8;
  int v4;
  int v5;
  int v6;
  int8x16_t v7;

  var8 = a3->var8;
  if ((var8 & 0x40000) != 0)
  {
    if (a3->var18)
      v4 = 0x20000;
    else
      v4 = 0x8000;
  }
  else
  {
    v4 = 0;
  }
  if ((var8 & 0x80032000) != 0)
  {
    if (a3->var18)
      v5 = 0x40000;
    else
      v5 = 0x10000;
    v4 |= v5;
  }
  if (a3->var19.var0.var2.var0)
    v4 |= 0x400u;
  v6 = (var8 >> 14) & 0xC | (var8 >> 4) & 0x10 | v4;
  if (var8 < 0)
    v6 |= 0x800u;
  v7 = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(var8), (uint32x4_t)xmmword_1DA911040), (int8x16_t)xmmword_1DA911050);
  *(int8x8_t *)v7.i8 = vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL));
  return v7.i32[0] | v6 | v7.i32[1];
}

- (TISupplementalLexiconController)currentCandidateGenerationContextSupplementalLexicons
{
  return (TISupplementalLexiconController *)objc_loadWeakRetained((id *)&self->_currentCandidateGenerationContextSupplementalLexicons);
}

- (unsigned)supplementalPrefix
{
  return self->_supplementalPrefix;
}

- (BOOL)isWordLearningEnabled
{
  return self->_wordLearningEnabled;
}

- (_NSRange)candidateRange
{
  _NSRange *p_candidateRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_candidateRange = &self->_candidateRange;
  location = self->_candidateRange.location;
  length = p_candidateRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCandidateRange:(_NSRange)a3
{
  self->_candidateRange = a3;
}

- (TILRUDictionary)autocorrectionListsForWordsInDocument
{
  return self->_autocorrectionListsForWordsInDocument;
}

- (BOOL)isEditingWordPrefix
{
  return self->_isEditingWordPrefix;
}

- (void)setIsEditingWordPrefix:(BOOL)a3
{
  self->_isEditingWordPrefix = a3;
}

- (void)setAutoshiftRegexLoader:(id)a3
{
  objc_storeStrong((id *)&self->_autoshiftRegexLoader, a3);
}

- (TITextCheckerExemptions)textCheckerExemptions
{
  return self->_textCheckerExemptions;
}

- (int64_t)deleteKeyCount
{
  return self->_deleteKeyCount;
}

- (TIKeyboardCandidate)hitTestCorrectedInputMatchingCandidate
{
  return self->_hitTestCorrectedInputMatchingCandidate;
}

- (NSMutableSet)rejectedConversionsForCurrentContinuousPath
{
  return self->_rejectedConversionsForCurrentContinuousPath;
}

- (void)setTypingSessionMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_typingSessionMonitor, a3);
}

- (void)setCounterChangeCache:(id)a3
{
  objc_storeStrong((id *)&self->_counterChangeCache, a3);
}

- (TISmartSelector)smartSelector
{
  return self->_smartSelector;
}

- (void)setSmartSelector:(id)a3
{
  objc_storeStrong((id *)&self->_smartSelector, a3);
}

- (id)proactiveSuggestionsGenerationBlock
{
  return self->_proactiveSuggestionsGenerationBlock;
}

- (TIAutocorrectionList)lastContinuousPathAutocorrection
{
  return self->_lastContinuousPathAutocorrection;
}

- (void)setLastContinuousPathAutocorrection:(id)a3
{
  objc_storeStrong((id *)&self->_lastContinuousPathAutocorrection, a3);
}

- (unint64_t)lastNumCandidatesRequest
{
  return self->_lastNumCandidatesRequest;
}

- (void)setLastNumCandidatesRequest:(unint64_t)a3
{
  self->_lastNumCandidatesRequest = a3;
}

- (TIFilterParameterLoader)filterParameterLoader
{
  return self->_filterParameterLoader;
}

- (int64_t)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (NSString)lastInputString
{
  return self->_lastInputString;
}

- (void)setLastInputString:(id)a3
{
  objc_storeStrong((id *)&self->_lastInputString, a3);
}

- (TIAutocorrectionList)pregeneratedTypingAutocorrections
{
  return self->_pregeneratedTypingAutocorrections;
}

- (void)setPregeneratedTypingAutocorrections:(id)a3
{
  objc_storeStrong((id *)&self->_pregeneratedTypingAutocorrections, a3);
}

- (void)setAutocorrectionForCurrentStem:(id)a3
{
  objc_storeStrong((id *)&self->_autocorrectionForCurrentStem, a3);
}

- (void)setRejectedAutocorrectionsDisplayedOrInserted:(id)a3
{
  objc_storeStrong((id *)&self->_rejectedAutocorrectionsDisplayedOrInserted, a3);
}

- (void)setRejectedAutocorrectionsDisplayedOrInsertedInverse:(id)a3
{
  objc_storeStrong((id *)&self->_rejectedAutocorrectionsDisplayedOrInsertedInverse, a3);
}

- (TIAutocorrectionList)lastAutocorrectionList
{
  return self->_lastAutocorrectionList;
}

- (TIKeyboardTouchEvent)previousTouchEvent
{
  return self->_previousTouchEvent;
}

- (void)setPreviousTouchEvent:(id)a3
{
  objc_storeStrong((id *)&self->_previousTouchEvent, a3);
}

- (TICandidateHandler)candidateHandlerForOpenRequest
{
  return self->_candidateHandlerForOpenRequest;
}

- (void)setCandidateHandlerForOpenRequest:(id)a3
{
  objc_storeStrong((id *)&self->_candidateHandlerForOpenRequest, a3);
}

- (NSMutableArray)candidateHandlerForOpenRequestStack
{
  return self->_candidateHandlerForOpenRequestStack;
}

- (void)setCandidateHandlerForOpenRequestStack:(id)a3
{
  objc_storeStrong((id *)&self->_candidateHandlerForOpenRequestStack, a3);
}

- (void).cxx_destruct
{
  RecentMessage *begin;
  RecentMessage *end;
  RecentMessage *v5;

  objc_storeStrong((id *)&self->_candidateHandlerForOpenRequestStack, 0);
  objc_storeStrong((id *)&self->_candidateHandlerForOpenRequest, 0);
  objc_storeStrong((id *)&self->_lastAcceptedText, 0);
  objc_storeStrong((id *)&self->_previousTouchEvent, 0);
  objc_storeStrong((id *)&self->_lastAutocorrectionList, 0);
  objc_storeStrong((id *)&self->_rejectedAutocorrectionsDisplayedOrInsertedInverse, 0);
  objc_storeStrong((id *)&self->_rejectedAutocorrectionsDisplayedOrInserted, 0);
  objc_storeStrong((id *)&self->_autocorrectionForCurrentStem, 0);
  objc_storeStrong((id *)&self->_pregeneratedTypingAutocorrections, 0);
  objc_storeStrong((id *)&self->_lastInputString, 0);
  objc_storeStrong((id *)&self->_filterParameterLoader, 0);
  objc_storeStrong((id *)&self->_lastContinuousPathAutocorrection, 0);
  objc_storeStrong(&self->_proactiveSuggestionsGenerationBlock, 0);
  objc_storeStrong((id *)&self->_smartSelector, 0);
  objc_storeStrong((id *)&self->_counterChangeCache, 0);
  objc_storeStrong((id *)&self->_typingSessionMonitor, 0);
  objc_storeStrong((id *)&self->_rejectedConversionsForCurrentContinuousPath, 0);
  objc_storeStrong((id *)&self->_hitTestCorrectedInputMatchingCandidate, 0);
  objc_storeStrong((id *)&self->_textCheckerExemptions, 0);
  objc_storeStrong((id *)&self->_autoshiftRegexLoader, 0);
  objc_storeStrong((id *)&self->_autocorrectionListsForWordsInDocument, 0);
  objc_storeStrong((id *)&self->_autocorrectionListsSuggestedForCurrentInput, 0);
  objc_storeStrong((id *)&self->_rejectedAutocorrections, 0);
  objc_storeStrong((id *)&self->_recentPredictiveInputSelections, 0);
  objc_storeStrong((id *)&self->_recentAutocorrections, 0);
  objc_storeStrong((id *)&self->_autocorrectionHistory, 0);
  objc_storeStrong((id *)&self->_revisionHistory, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_currentCandidateGenerationContextSupplementalLexicons);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  std::shared_ptr<language_modeling::v1::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&self->_refinery);
  begin = self->conversation_history.__begin_;
  if (begin)
  {
    end = self->conversation_history.__end_;
    v5 = self->conversation_history.__begin_;
    if (end != begin)
    {
      do
      {
        end = (RecentMessage *)((char *)end - 48);
        std::__destroy_at[abi:nn180100]<RecentMessage,0>((uint64_t)end);
      }
      while (end != begin);
      v5 = self->conversation_history.__begin_;
    }
    self->conversation_history.__end_ = begin;
    operator delete(v5);
  }
  objc_storeStrong((id *)&self->_testingStateObject, 0);
  objc_storeStrong((id *)&self->_smartOptions, 0);
  objc_storeStrong((id *)&self->_openingQuotes, 0);
  objc_storeStrong((id *)&self->_closingQuotes, 0);
  objc_storeStrong((id *)&self->_supplementalLexiconWordExtraCharacters, 0);
  objc_storeStrong((id *)&self->_wordCharacters, 0);
  objc_storeStrong((id *)&self->_synchronizedInputContextHistory, 0);
  objc_storeStrong((id *)&self->_emojiCandidateGenerator, 0);
  objc_storeStrong((id *)&self->_languageSelectionController, 0);
  std::unique_ptr<TI::RejectionsDatabase>::reset[abi:nn180100]((TI::RejectionsDatabase **)&self->m_rejectionsDatabase, 0);
  std::shared_ptr<language_modeling::v1::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&self->m_lightweight_language_model);
  std::shared_ptr<language_modeling::v1::LanguageModel>::~shared_ptr[abi:nn180100]((uint64_t)&self->m_typology_recorder);
  objc_storeStrong((id *)&self->_cachedLayoutTags, 0);
  objc_storeStrong((id *)&self->_allowPredictionCharacterSet, 0);
  objc_storeStrong((id *)&self->_keyboardFeatureSpecialization, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_layoutState, 0);
  objc_storeStrong((id *)&self->_keyLayout, 0);
  objc_storeStrong((id *)&self->m_composedText, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 29) = 0;
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 34) = 0;
  return self;
}

uint64_t __48__TIKeyboardInputManager_acceptsRange_inString___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "acceptsCharacter:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
  return result;
}

void __59__TIKeyboardInputManager_typedStringForEmptyAutocorrection__block_invoke(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;

  v14 = a2;
  if (a3 < *(_QWORD *)(a1 + 48))
  {
    v20 = v14;
    objc_msgSend(*(id *)(a1 + 32), "revisionHistory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "documentText");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "substringWithRange:", a3, *(_QWORD *)(a1 + 48) - a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 + a4 >= *(_QWORD *)(a1 + 48))
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "stringEndsWord:", v20)
        || CEMStringIsSingleEmoji())
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v17);
        if (objc_msgSend(v20, "length") == 1)
        {
          objc_msgSend(*(id *)(a1 + 32), "nonstopPunctuationCharacters");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "containsString:", v20);

          if ((v19 & 1) != 0)
            goto LABEL_11;
        }
      }
    }
    else if (a3 + a4 == a5 + a6 && (objc_msgSend(*(id *)(a1 + 32), "stringEndsWord:", v20) & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v17);
    }
    *a8 = 1;
LABEL_11:

    v14 = v20;
  }

}

- (BOOL)_canSuggestPhraseCandidate:(void *)a3 withStem:
{
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BOOL8 v11;
  unsigned int v13;
  int v14;

  v5 = a3;
  if (a1)
  {
    if (!*(_QWORD *)a2)
      goto LABEL_11;
    v6 = 240 * *(_QWORD *)a2 - 240;
    v7 = (uint64_t *)(*((_QWORD *)a2 + 1) + 224);
    do
    {
      v9 = *v7;
      v7 += 30;
      v8 = v9;
      if (v9)
        v10 = 1;
      else
        v10 = v6 == 0;
      v6 -= 240;
    }
    while (!v10);
    if (v8 && (KB::Candidate::is_phrase_from_supplemental_lexicon(a2) & 1) == 0)
    {
      v13 = objc_msgSend(a1, "prefixLengthOfInput:sharedWithCandidate:", v5, a2);
      v14 = *(_DWORD *)a2;
      v11 = v14 - KB::Candidate::index_of_word_containing_position(a2, v13) == 1;
    }
    else
    {
LABEL_11:
      v11 = 1;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

BOOL __58__TIKeyboardInputManager_indexesOfDuplicatesInCandidates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "member:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return v4 != 0;
}

uint64_t __59__TIKeyboardInputManager_autocorrectionListForSelectedText__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __60__TIKeyboardInputManager_cannedResponseCandidatesForString___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __60__TIKeyboardInputManager_suggestionBlocklistMatchesStrings___block_invoke(uint64_t a1, uint64_t a2)
{
  KB *v3;
  uint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::string *v11[3];
  _BYTE v12[8];
  std::__shared_weak_count *v13;
  void *__p;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  std::string **v19;
  __int128 v20;
  char v21;
  __int128 v22[2];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "dictionaryStringForExternalString:", a2);
  v3 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v3, (uint64_t)v22);

  v4 = *(_QWORD *)(a1 + 40);
  v5 = (unint64_t *)operator new(8uLL);
  *v5 = 0x100000000;
  std::string::basic_string[abi:nn180100]<0>(&v20, "");
  v11[0] = (std::string *)operator new(0x18uLL);
  v11[2] = v11[0] + 1;
  v11[1] = std::__uninitialized_allocator_copy[abi:nn180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(&v20, v22, v11[0]);
  KB::LanguageModelContext::LanguageModelContext((uint64_t)v12, v5, 1, (uint64_t)v11[0]);
  v6 = (*(uint64_t (**)(uint64_t, __int128 *, uint64_t, _BYTE *, uint64_t, uint64_t))(*(_QWORD *)v4 + 472))(v4, v22, 0xFFFFFFFFLL, v12, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 224, 1);
  v19 = (std::string **)&v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v19);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v17);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&v16);
  if (__p)
  {
    v15 = __p;
    operator delete(__p);
  }
  v7 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v19 = v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v19);
  if (v21 < 0)
    operator delete((void *)v20);
  operator delete(v5);
  if (*((_QWORD *)&v22[0] + 1) && BYTE6(v22[0]) == 1)
    free(*((void **)&v22[0] + 1));
  return v6;
}

void __81__TIKeyboardInputManager_shortcutConversionForString_stringStartsInMiddleOfWord___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  KB *v7;
  TIInputManager *v8;
  BOOL v9;
  id v10;
  const KB::String *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[8];
  void *v17;
  _WORD v18[120];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(TIInputManager **)(*(_QWORD *)(a1 + 32) + 40);
  KB::utf8_string(v7, (uint64_t)v16);
  TIInputManager::conversion_for_shortcut(v8, (const KB::String *)v16, (KB::Word *)v18);
  if (v17)
    v9 = v16[6] == 1;
  else
    v9 = 0;
  if (v9)
    free(v17);
  if (v18[0])
  {
    v10 = objc_alloc(MEMORY[0x1E0DBDCC0]);
    KB::ns_string((KB *)v18, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithCandidate:forInput:", v12, v7);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    *a5 = 1;
  }
  KB::Word::~Word((KB::Word *)v18);

}

void __75__TIKeyboardInputManager_enumerateWordSuffixesOfString_inRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *a7 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

BOOL __66__TIKeyboardInputManager_prefixLengthOfInput_sharedWithCandidate___block_invoke(uint64_t a1, unsigned __int16 a2, UChar32 c)
{
  _BOOL8 v6;
  void *v8;
  void *v9;

  if (u_isspace(c) || ((1 << u_charType(c)) & 0x1C0) != 0)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "wordCharacters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "characterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = !objc_msgSend(v9, "characterIsMember:", a2)
    || (objc_msgSend(v9, "characterIsMember:", (unsigned __int16)c) & 1) == 0;

  return v6;
}

id __85__TIKeyboardInputManager_revisionListFromAutocorrectionList_afterAcceptingCandidate___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v7 = a1;
  v8 = a2;
  if (objc_msgSend(v7, "length")
    && objc_msgSend(v8, "length")
    && objc_msgSend(v7, "hasPrefix:", CFSTR(" "))
    && objc_msgSend(v8, "hasPrefix:", CFSTR(" ")))
  {
    objc_msgSend(v7, "substringFromIndex:", 1);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "substringFromIndex:", 1);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v10;
    v7 = (id)v9;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD0]), "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v7, v8, 0, 0, a3, a4);

  return v11;
}

uint64_t __42__TIKeyboardInputManager_dropInputPrefix___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateComposedText");
  return objc_msgSend(*(id *)(a1 + 32), "updateInputContext");
}

void __63__TIKeyboardInputManager_trimmedInputStemAfterLathamConversion__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  int v9;
  void *v13;
  void *v14;
  id obj;

  if (a3 < *(_QWORD *)(a1 + 56))
  {
    v9 = HIDWORD(a7);
    objc_msgSend(*(id *)(a1 + 32), "revisionHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "substringWithRange:", a3, *(_QWORD *)(a1 + 56) - a3);
    obj = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(obj, "_containsEmoji") & 1) != 0
      || (objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj), a3 + a4 >= *(_QWORD *)(a1 + 56))
      && !objc_msgSend(*(id *)(a1 + 32), "usesRetrocorrection")
      || (v9 - 500) <= 0xFFFFFE0C
      && (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24),
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)))
    {
      *a8 = 1;
    }

  }
}

void __50__TIKeyboardInputManager_wordInInputStem_atIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  int v9;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;

  v9 = HIDWORD(a7);
  v12 = a2;
  if ((v9 - 500) <= 0xFFFFFE0C)
  {
    v13 = *(_QWORD *)(a1[4] + 8);
    v14 = *(_QWORD *)(v13 + 24);
    if (v14 >= a1[6])
    {
      v15 = v12;
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
      v12 = v15;
      *a8 = 1;
      v13 = *(_QWORD *)(a1[4] + 8);
      v14 = *(_QWORD *)(v13 + 24);
    }
    *(_QWORD *)(v13 + 24) = v14 + 1;
  }

}

_QWORD *__50__TIKeyboardInputManager_countOfWordsIninputStem___block_invoke(_QWORD *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v7;

  v7 = result[5];
  if (a3 < v7 && a3 >= v7 - result[6] && (HIDWORD(a7) - 500) <= 0xFFFFFE0C)
    ++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  return result;
}

void __42__TIKeyboardInputManager_trimmedInputStem__block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  int v9;
  void *v13;
  void *v14;
  id obj;

  if (a3 < *(_QWORD *)(a1 + 56))
  {
    v9 = HIDWORD(a7);
    objc_msgSend(*(id *)(a1 + 32), "revisionHistory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "documentText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "substringWithRange:", a3, *(_QWORD *)(a1 + 56) - a3);
    obj = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(obj, "_containsEmoji") & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
      if (a3 + a4 >= *(_QWORD *)(a1 + 56))
      {
        if ((objc_msgSend(*(id *)(a1 + 32), "usesRetrocorrection") & 1) != 0)
          goto LABEL_4;
      }
      else
      {
        if ((v9 - 500) > 0xFFFFFE0C)
          goto LABEL_4;
        if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) < *(_QWORD *)(a1 + 64))
          goto LABEL_4;
      }
    }
    *a8 = 1;
LABEL_4:

  }
}

void __67__TIKeyboardInputManager_sentenceContextForInputStem_inputContext___block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  __CFString *v13;
  __CFString *v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  const __CFString *v33;
  __CFString *v34;

  v13 = a2;
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 56);
  v16 = v15 > a3;
  v17 = v15 - a3;
  if (v16)
  {
    if (v17 >= a4)
    {
      v18 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
      v20 = (_QWORD *)v18[7];
      v19 = v18[8];
      v34 = v13;
      if ((unint64_t)v20 >= v19)
      {
        v22 = v18[6];
        v23 = ((uint64_t)v20 - v22) >> 3;
        if ((unint64_t)(v23 + 1) >> 61)
          abort();
        v24 = v19 - v22;
        v25 = v24 >> 2;
        if (v24 >> 2 <= (unint64_t)(v23 + 1))
          v25 = v23 + 1;
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
          v26 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v26 = v25;
        if (v26)
          v26 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v26);
        else
          v27 = 0;
        v28 = (_QWORD *)(v26 + 8 * v23);
        v29 = v26 + 8 * v27;
        *v28 = a7;
        v21 = v28 + 1;
        v31 = (char *)v18[6];
        v30 = (char *)v18[7];
        if (v30 != v31)
        {
          do
          {
            v32 = *((_QWORD *)v30 - 1);
            v30 -= 8;
            *--v28 = v32;
          }
          while (v30 != v31);
          v30 = (char *)v18[6];
        }
        v18[6] = v28;
        v18[7] = v21;
        v18[8] = v29;
        if (v30)
          operator delete(v30);
        v14 = v34;
      }
      else
      {
        *v20 = a7;
        v21 = v20 + 1;
      }
      v18[7] = v21;
      if (v14)
        v33 = v14;
      else
        v33 = &stru_1EA1081D0;
      objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v33, 0);
      v14 = v34;
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
      *a8 = 1;
    }
  }

}

void __59__TIKeyboardInputManager_tokenizeString_context_sentences___block_invoke(uint64_t a1, KB::String *a2, unint64_t *a3)
{
  unint64_t token_id_for_word;
  uint64_t v6;
  __CFString *v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  TITokenID v13;
  __CFString *v14;

  token_id_for_word = *a3;
  if (!HIDWORD(*a3))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 232);
    KB::cf_string_impl<KB::String>((CFStringRef *)&v14, (unsigned __int16 *)a2);
    v7 = v14;
    v8 = *(_QWORD **)(a1 + 32);
    v9 = (uint64_t *)(v8[5] + 224);
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v8, "inputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    token_id_for_word = KB::LanguageModel::find_token_id_for_word(v6, v7, v9, v10, 0x35u, (uint64_t)v12, (KB::String *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), (BOOL *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

    if (v7)
      CFRelease(v7);
  }
  v13 = (TITokenID)token_id_for_word;
  KB::LanguageModelContext::append(*(KB::LanguageModelContext **)(a1 + 56), v13, a2, 0);
  if (HIDWORD(token_id_for_word) == 1)
    ++**(_DWORD **)(a1 + 64);
}

_QWORD *__61__TIKeyboardInputManager_inputStringRangeFromRevisionHistory__block_invoke(_QWORD *result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = result[6];
  if (a3 + a4 >= v8)
  {
    if (a3 <= v8)
    {
      v9 = *(_QWORD *)(result[4] + 8);
      *(_QWORD *)(v9 + 48) = a3;
      *(_QWORD *)(v9 + 56) = a4;
      if ((HIDWORD(a7) - 500) <= 0xFFFFFE0C)
      {
        v10 = *(_QWORD *)(result[5] + 8);
        *(_QWORD *)(v10 + 48) = a3;
        *(_QWORD *)(v10 + 56) = a4;
      }
    }
  }
  else
  {
    *a8 = 1;
  }
  return result;
}

uint64_t __80__TIKeyboardInputManager_acceptableRangeFromRange_inText_withSelectionLocation___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "acceptsRange:inString:", a3, a4, *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3 + a4;
  else
    *a7 = 1;
  return result;
}

uint64_t __80__TIKeyboardInputManager_acceptableRangeFromRange_inText_withSelectionLocation___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "acceptsRange:inString:", a3, a4, *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  else
    *a7 = 1;
  return result;
}

void __56__TIKeyboardInputManager_legacyInputRangeForTokenRange___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v11;
  unint64_t v12;

  if (objc_msgSend(*(id *)(a1 + 32), "stringEndsWord:", a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "revisionHistory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "selectedRange");

    if (a3 >= v12)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
      *a7 = 1;
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 + a4;
    }
  }
}

void __59__TIKeyboardInputManager_addInput_flags_point_firstDelete___block_invoke(uint64_t a1, int a2, NSString *a3, _NSRange a4)
{
  TIInputManager *v6;
  _BYTE v7[8];
  void *v8;
  uint64_t v9;
  _NSRange v10;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = *(TIInputManager **)(*(_QWORD *)(a1 + 32) + 40);
  v10.location = v10.length;
  KB::utf8_substring(*(KB **)(a1 + 40), a3, v10, (uint64_t)v7);
  TIInputManager::add_input(v6, (const KB::String *)v7, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  if (v8 && v7[6] == 1)
    free(v8);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) &= 4u;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

- (void)scoreCandidates:
{
  *a2 = &off_1EA101210;
}

- (_QWORD)scoreCandidates:
{
  _QWORD *result;

  result = operator new(0x10uLL);
  *result = &off_1EA101210;
  return result;
}

- (float)scoreCandidates:
{
  float v4;
  float v5;
  float v6;
  float v7;
  float result;

  v4 = a2[187];
  v5 = a2[189];
  v6 = a2[190];
  v7 = logf(*a3);
  a2[188] = v7;
  result = v4 + (float)(v6 * (float)(v7 + v5));
  a2[186] = result;
  return result;
}

void __46__TIKeyboardInputManager_loadNewLanguageModel__block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_string:matchesString:", v4, v6) & 1) == 0)
  {

    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a1[5];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recipientIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "_string:matchesString:", v8, v10);

  if ((_DWORD)v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "languageSelectionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdaptationContext:", v13);
LABEL_5:

  }
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

void __94__TIKeyboardInputManager_generateCandidatesWithKeyboardState_candidateRange_candidateHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DBDBE0], "setWithCandidates:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "closeCandidateGenerationContextWithResults:", v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishGeneratingCandidates");
  }

}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  id obj;
  id *location;
  void *__p[2];
  char v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  void *v80[2];
  char v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isStickerSuggestionsEnabled"))
  {
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "objectAtIndex:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "customInfoType");

      if (v5 == 4096)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "emojiList");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        if (v7)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "emojiList");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "count");

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "emojiList");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v9 == 1)
          {
            if ((unint64_t)objc_msgSend(v3, "count") <= 2)
              v12 = objc_msgSend(v3, "count");
            else
              v12 = 2;
            objc_msgSend(v3, "subarrayWithRange:", 0, v12);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v56);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v10, "subarrayWithRange:", 0, 2);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "firstObject");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "arrayByAddingObject:", v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
        else
        {
          if ((unint64_t)objc_msgSend(v3, "count") <= 3)
            v55 = objc_msgSend(v3, "count");
          else
            v55 = 3;
          objc_msgSend(v3, "subarrayWithRange:", 0, v55);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v60 = (void *)MEMORY[0x1E0DBDB48];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "corrections");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "predictions");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "listWithCorrections:predictions:emojiList:", v61, v62, v58);
        v63 = objc_claimAutoreleasedReturnValue();
        v64 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v65 = *(void **)(v64 + 40);
        *(_QWORD *)(v64 + 40) = v63;

        v66 = *(_QWORD *)(a1 + 40);
        v67 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        std::string::basic_string[abi:nn180100]<0>(v80, "Stickers");
        (*(void (**)(uint64_t, uint64_t, void **, uint64_t))(v66 + 16))(v66, v67, v80, 1);
        if (v81 < 0)
          operator delete(v80[0]);

        goto LABEL_55;
      }
    }
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:", 0, v3, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  location = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "keyboardState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "autocorrectionListUIDisplayed"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "predictions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
      goto LABEL_14;
    v19 = (void *)MEMORY[0x1E0DBDB48];
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "corrections");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "emojiList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "listWithCorrections:predictions:emojiList:", WeakRetained, MEMORY[0x1E0C9AA60], v17);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
LABEL_14:
  v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v71 = a1;
  if (!v23)
    goto LABEL_36;
  objc_msgSend(v23, "predictions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "emojiList");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      goto LABEL_18;
LABEL_36:
    v45 = a1;
    if (!objc_msgSend(v3, "count"))
    {
      v53 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v53)
      {
        objc_msgSend(v53, "predictions");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {

          v45 = a1;
        }
        else
        {
          v45 = a1;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "emojiList");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
          {

          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "corrections");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "autocorrection");
            v69 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v69)
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v71 + 48) + 8) + 40), "setProactiveSuggestionsEmpty:", 1);
          }
        }
      }
    }
    goto LABEL_37;
  }

LABEL_18:
  v70 = v3;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "predictions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v77 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "secureCandidateRenderer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v32, "cachedCandidateForSecureCandidate:", v30);
          v33 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v33 = v30;
        }
        v34 = v33;
        v35 = objc_loadWeakRetained(location);
        v36 = objc_msgSend(v35, "shouldInsertSpaceBeforePredictions");

        if (v36)
        {
          v37 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v34, "candidate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringWithFormat:", CFSTR(" %@"), v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "secureCandidateRenderer");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "updateCachedCandidate:withCandidateString:", v34, v39);
          v42 = objc_claimAutoreleasedReturnValue();

          v34 = (void *)v42;
          a1 = v71;
        }
        objc_msgSend(v34, "proactiveTrigger");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        if (v43)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setContainsProactiveTriggers:", 1);

      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    }
    while (v27);
  }

  v44 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v44, "corrections");
  v45 = a1;
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "autocorrection");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "proactiveTrigger");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v44, "containsProactiveTriggers");
  if (v48)
    v50 = 1;
  else
    v50 = v49;
  objc_msgSend(v44, "setContainsProactiveTriggers:", v50);

  v3 = v70;
LABEL_37:
  v51 = *(_QWORD *)(v45 + 40);
  v52 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v45 + 48) + 8) + 40);
  std::string::basic_string[abi:nn180100]<0>(__p, "Predictions");
  (*(void (**)(uint64_t, uint64_t, void **, uint64_t))(v51 + 16))(v51, v52, __p, 1);
  if (v75 < 0)
    operator delete(__p[0]);
LABEL_55:

}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__10337;
  v15[4] = __Block_byref_object_dispose__10338;
  v16 = (id)objc_msgSend(a2, "copy");
  v3 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldOfferStickers"))
  {
    objc_msgSend(*(id *)(a1 + 32), "stickerCandidateGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 32), "stickerCandidateGenerator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "documentState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextBeforeInput");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "generateStickerQueriesForText:tokenize:", v6, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "stickerCandidateGenerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "secureCandidateRenderTraits");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(a1 + 32), "shouldGeneratePredictionsForCurrentContext");
    objc_msgSend(*(id *)(a1 + 32), "inputMode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "languageWithRegion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_3;
    v12[3] = &unk_1EA100CB8;
    v14 = v15;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v7, "generateStickerCandidatesForSearchableQueries:withRenderTraits:shouldAppend:language:completionHandler:", v3, v8, v9, v11, v12);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

  _Block_object_dispose(v15, 8);
}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  _QWORD v37[5];
  id v38;

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__10337;
  v37[4] = __Block_byref_object_dispose__10338;
  v38 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(*(id *)(a1 + 32), "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "autofillMode") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "keyboardState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "documentState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextBeforeInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "keyboardState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "documentState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contextBeforeInput");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "length"))
      {
        v10 = 0;
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      v31 = v9;
      v32 = v8;
      v33 = v7;
    }
    objc_msgSend(*(id *)(a1 + 32), "keyboardState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "documentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contextAfterInput");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(*(id *)(a1 + 32), "keyboardState");
      v30 = v6;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "documentState");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contextAfterInput");
      v17 = v5;
      v18 = v4;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v11;
      v10 = objc_msgSend(v19, "length") == 0;

      v4 = v18;
      v5 = v17;

      v6 = v30;
    }
    else
    {

      v10 = 1;
    }
    v8 = v32;
    v7 = v33;
    v9 = v31;
    if (!v6)
      goto LABEL_13;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_14:

  if (_os_feature_enabled_impl() && v10)
  {
    +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(WeakRetained, "keyboardState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "secureCandidateRenderTraits");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_loadWeakRetained((id *)(a1 + 64));
    objc_msgSend(v24, "keyboardState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = *(void **)(a1 + 40);
    v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_5;
    v34[3] = &unk_1EA100D08;
    v36 = v37;
    v35 = v26;
    objc_msgSend(v20, "generateJustHMEAutofillFormSuggestionWithRenderTraits:withKeyboardState:applicationID:applicationBundleID:completionHandler:", v23, v25, v27, v28, v34);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  _Block_object_dispose(v37, 8);

}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v4, "proactiveTriggers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "generateAndRenderProactiveSuggestionsWithTriggers:withAdditionalPredictions:withInput:async:completionHandler:", v6, v7, &stru_1EA1081D0, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));

  v8 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v8, "setProactiveSuggestionsGenerationBlock:", 0);

}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObject:", a2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  v6 = *(id *)(a1 + 32);
  TIDispatchAsync();

}

uint64_t __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __100__TIKeyboardInputManager_finishGeneratingResponseKitProactiveSuggestions_candidateRange_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "arrayByAddingObjectsFromArray:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __84__TIKeyboardInputManager_finishGeneratingInlineCompletions_completion_syncResponse___block_invoke(_QWORD *a1, const KB::Candidate **a2, const KB::String *a3, uint64_t a4)
{
  NSObject *v8;
  os_signpost_id_t v9;
  os_signpost_id_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *__p[2];
  char v23;
  _BYTE v24[24];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[8];
  _BYTE v29[8];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  kac_get_log();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_make_with_pointer(v8, (const void *)(a1[4] ^ 0x10));
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v8, OS_SIGNPOST_INTERVAL_END, v10, "kbdManager.generateInlineCompletions", ", buf, 2u);
    }
  }

  v11 = (void *)a1[4];
  KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v24, a2);
  KB::String::String((KB::String *)v29, a3);
  objc_msgSend(v11, "inlineCompletions:matchedStem:", v24, v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 && v29[6] == 1)
    free(v30);
  *(_QWORD *)buf = &v27;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  *(_QWORD *)buf = &v26;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  *(_QWORD *)buf = &v25;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  *(_QWORD *)buf = v24;
  std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100]((void ***)buf);
  v13 = (void *)MEMORY[0x1E0DBDB48];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "corrections");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "predictions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "emojiList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "listWithCorrections:predictions:emojiList:inlineCompletions:", v14, v15, v16, v12);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  v20 = a1[5];
  v21 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  std::string::basic_string[abi:nn180100]<0>(__p, "InlineCompletions");
  (*(void (**)(uint64_t, uint64_t, void **, uint64_t))(v20 + 16))(v20, v21, __p, a4);
  if (v23 < 0)
    operator delete(__p[0]);

}

void __104__TIKeyboardInputManager_finishGeneratingAutocorrectionsWithCandidates_candidateRange_candidateHandler___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  id v17;

  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v17 = WeakRetained;
    v7 = *(void **)(a1 + 32);
    v8 = v7;
    if (!v7)
    {
      v1 = objc_loadWeakRetained(v5);
      objc_msgSend(v1, "candidateHandlerForOpenRequest");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "requestToken");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {

LABEL_11:
        v14 = objc_loadWeakRetained(v5);
        objc_msgSend(v14, "candidateHandlerForOpenRequest");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "close");

        v16 = objc_loadWeakRetained(v5);
        objc_msgSend(v16, "setCandidateHandlerForOpenRequest:", 0);

        WeakRetained = v17;
        goto LABEL_12;
      }
      v3 = (void *)v9;
      v8 = *(void **)(a1 + 32);
    }
    v10 = objc_loadWeakRetained(v5);
    objc_msgSend(v10, "candidateHandlerForOpenRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requestToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isSameRequestAs:", v12);

    if (v7)
    {
      WeakRetained = v17;
      if (!v13)
        goto LABEL_12;
    }
    else
    {

      WeakRetained = v17;
      if ((v13 & 1) == 0)
        goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:

}

void __104__TIKeyboardInputManager_finishGeneratingAutocorrectionsWithCandidates_candidateRange_candidateHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t **a3, int a4)
{
  id v7;
  id *v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  char v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t *v62;
  int v63;
  uint64_t **v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  uint64_t v77;
  id v78;
  id v79;
  id *v80;
  id v81;
  void *v82;
  void *v83;
  int v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __CFString *v93;
  uint64_t i;
  void *v95;
  uint64_t v96;
  __CFString *v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  id *v105;
  id *v106;
  void *v107;
  void *v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  id v114;
  id v115;
  _BYTE v116[128];
  _BYTE v117[8];
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && a4)
  {
    if ((objc_msgSend(v7, "containsProactiveTriggers") & 1) != 0)
      v10 = 1;
    else
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "containsProactiveTriggers");
    if ((objc_msgSend(v7, "proactiveSuggestionsEmpty") & 1) != 0)
      v11 = 1;
    else
      v11 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "proactiveSuggestionsEmpty");
    v12 = (uint64_t *)*((unsigned __int8 *)a3 + 23);
    v13 = (char)v12;
    v14 = a3[1];
    if ((char)v12 >= 0)
      v15 = (uint64_t *)*((unsigned __int8 *)a3 + 23);
    else
      v15 = a3[1];
    if (v15 == (uint64_t *)11)
    {
      v16 = *a3;
      if ((char)v12 >= 0)
        v16 = (uint64_t *)a3;
      v17 = *v16;
      v18 = *(uint64_t *)((char *)v16 + 3);
      if (v17 == 0x6974636964657250 && v18 == 0x736E6F6974636964)
      {
        v104 = (void *)MEMORY[0x1E0DBDB48];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "corrections");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "predictions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "emojiList");
        LODWORD(v108) = v11;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "inlineCompletions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "proactiveTriggers");
        LODWORD(v107) = v10;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "listWithCorrections:predictions:emojiList:inlineCompletionList:proactiveTriggers:", v20, v21, v22, v23, v24);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        v8 = (id *)(a1 + 64);
        v10 = v10;

        v11 = v108;
        v12 = (uint64_t *)*((unsigned __int8 *)a3 + 23);
        v14 = a3[1];
        v13 = *((_BYTE *)a3 + 23);
      }
    }
    if (v13 < 0)
      v12 = v14;
    if (v12 == (uint64_t *)17)
    {
      v28 = *a3;
      if (v13 >= 0)
        v28 = (uint64_t *)a3;
      v29 = *v28;
      v30 = v28[1];
      v31 = *((unsigned __int8 *)v28 + 16);
      if (v29 == 0x6F43656E696C6E49 && v30 == 0x6E6F6974656C706DLL && v31 == 115)
      {
        LODWORD(v108) = v11;
        LODWORD(v107) = v10;
        v105 = v8;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "corrections");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "inlineCompletions");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "predictions");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "corrections");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "autocorrection");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isAutocorrection");

        if ((v39 & 1) != 0)
        {

          v35 = 0;
        }
        else
        {
          v40 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "corrections");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "inlineCompletions");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v40) = objc_msgSend(v40, "shouldPromoteInlineCompletionsToAutocorrections:inlineCompletions:", v41, v42);

          if ((_DWORD)v40)
          {
            objc_msgSend(v7, "inlineCompletions");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectAtIndexedSubscript:", 0);
            v102 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = *(void **)(a1 + 40);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "corrections");
            v45 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "predictions");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v114 = v36;
            v115 = v34;
            KB::String::String((KB::String *)v117, (const KB::String *)(a1 + 72));
            v47 = v44;
            v48 = (void *)v45;
            objc_msgSend(v47, "promoteInlineCompletionToAutocorrections:predictions:inlineCompletion:outReconciledAutocorrections:outReconciledPredictions:matchedStem:", v45, v46, v102, &v115, &v114, v117);
            v101 = v115;

            v49 = v114;
            if (v118 && v117[6] == 1)
              free(v118);

            v34 = v101;
            v36 = v49;
          }
        }
        v103 = v35;
        v50 = v36;
        v51 = v34;
        objc_msgSend(v34, "autocorrection");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = v50;
        if (v52)
        {
          v54 = *(void **)(a1 + 40);
          objc_msgSend(v34, "autocorrection");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "filterDuplicatePredictions:autocorrection:", v50, v55);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v56 = (void *)MEMORY[0x1E0DBDB48];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "emojiList");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "proactiveTriggers");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "listWithCorrections:predictions:emojiList:inlineCompletionList:proactiveTriggers:", v51, v53, v57, v103, v58);
        v59 = objc_claimAutoreleasedReturnValue();
        v60 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v61 = *(void **)(v60 + 40);
        *(_QWORD *)(v60 + 40) = v59;

        v8 = v105;
        v10 = v107;
        v11 = v108;
      }
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isStickerSuggestionsEnabled"))
    {
      v62 = (uint64_t *)*((unsigned __int8 *)a3 + 23);
      v63 = (char)v62;
      if ((char)v62 < 0)
        v62 = a3[1];
      if (v62 == (uint64_t *)8)
      {
        v64 = v63 >= 0 ? a3 : (uint64_t **)*a3;
        if (*v64 == (uint64_t *)0x7372656B63697453)
        {
          LODWORD(v108) = v11;
          v65 = (void *)MEMORY[0x1E0DBDB48];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "corrections");
          a3 = (uint64_t **)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "predictions");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "emojiList");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "inlineCompletions");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v65;
          v11 = v108;
          objc_msgSend(v69, "listWithCorrections:predictions:emojiList:inlineCompletions:", a3, v66, v67, v68);
          v70 = objc_claimAutoreleasedReturnValue();
          v71 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v72 = *(void **)(v71 + 40);
          *(_QWORD *)(v71 + 40) = v70;

        }
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setContainsProactiveTriggers:", v10);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setProactiveSuggestionsEmpty:", v11);
    v73 = *(void **)(a1 + 48);
    v74 = v73;
    if (!v73)
    {
      v75 = objc_loadWeakRetained(v8);
      objc_msgSend(v75, "candidateHandlerForOpenRequest");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "requestToken");
      v77 = objc_claimAutoreleasedReturnValue();
      if (!v77)
      {

        goto LABEL_62;
      }
      a3 = (uint64_t **)v77;
      v107 = v76;
      v108 = v75;
      v74 = *(void **)(a1 + 48);
    }
    v78 = WeakRetained;
    v79 = v7;
    v80 = v8;
    v81 = objc_loadWeakRetained(v8);
    objc_msgSend(v81, "candidateHandlerForOpenRequest");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "requestToken");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v74, "isSameRequestAs:", v83);

    if (v73)
    {
      v7 = v79;
      WeakRetained = v78;
      v8 = v80;
      if (!v84)
        goto LABEL_81;
    }
    else
    {

      v7 = v79;
      WeakRetained = v78;
      v8 = v80;
      if ((v84 & 1) == 0)
        goto LABEL_81;
    }
LABEL_62:
    v109 = v7;
    if (HIBYTE(inline_completions_override))
    {
      if (!(_BYTE)inline_completions_override)
        goto LABEL_80;
    }
    else if (!_os_feature_enabled_impl())
    {
LABEL_80:
      v99 = objc_loadWeakRetained(v8);
      objc_msgSend(v99, "candidateHandlerForOpenRequest");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "pushCandidates:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

      v7 = v109;
      goto LABEL_81;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "inlineCompletions");
    v85 = objc_claimAutoreleasedReturnValue();
    if (v85)
    {
      v86 = (void *)v85;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "inlineCompletions");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = objc_msgSend(v87, "count");

      if (v88)
      {
        v106 = v8;
        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "inlineCompletions");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
        if (v90)
        {
          v91 = v90;
          v92 = *(_QWORD *)v111;
          v93 = &stru_1EA1081D0;
          do
          {
            for (i = 0; i != v91; ++i)
            {
              if (*(_QWORD *)v111 != v92)
                objc_enumerationMutation(v89);
              v95 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
              if (-[__CFString length](v93, "length"))
              {
                -[__CFString stringByAppendingString:](v93, "stringByAppendingString:", CFSTR(", "));
                v96 = objc_claimAutoreleasedReturnValue();

                v93 = (__CFString *)v96;
              }
              v97 = v93;
              objc_msgSend(v95, "candidate");
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              -[__CFString stringByAppendingString:](v93, "stringByAppendingString:", v98);
              v93 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v110, v116, 16);
          }
          while (v91);
        }
        else
        {
          v93 = &stru_1EA1081D0;
        }

        objc_msgSend(*(id *)(a1 + 40), "logInlineCompletionsToTypology:candidate:", CFSTR("Sending inline completion to UI"), v93);
        v8 = v106;
      }
    }
    goto LABEL_80;
  }
LABEL_81:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __63__TIKeyboardInputManager_generateInlineCompletions_withPrefix___block_invoke(uint64_t a1, const KB::String *a2)
{
  _WORD *v3;
  KB *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = *(_WORD **)a2;
  if (*((_QWORD *)a2 + 1) != *(_QWORD *)a2)
  {
    v4 = (KB *)(v3 + 444);
    if (!v3[444])
      KB::Candidate::compute_string((KB::Candidate *)v3);
    KB::ns_string(v4, a2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

void __99__TIKeyboardInputManager_generateAutocorrectionsWithKeyboardState_candidateRange_candidateHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  uint8_t v8[16];

  v3 = a2;
  kdebug_trace();
  kac_get_log();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(_QWORD *)(a1 + 32) ^ 0x11));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v4, OS_SIGNPOST_INTERVAL_END, v6, "kbdManager.generateAutofill", ", v8, 2u);
    }
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:", 0, v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "pushCandidates:", v7);
    objc_msgSend(*(id *)(a1 + 40), "close");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "generateTypingAutocorrectionsWithCandidateRange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishGeneratingAutocorrectionsWithCandidates:candidateRange:candidateHandler:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }

}

void __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  TIDispatchAsync();

}

uint64_t __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __82__TIKeyboardInputManager_generateAutofillFormWithKeyboardState_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __53__TIKeyboardInputManager_deleteFromInputWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stringEndsWord:", a2);
}

void __59__TIKeyboardInputManager_logDiscoverabilityEvent_userInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (v2)
  {
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Failed to donate signal: %@"), "-[TIKeyboardInputManager logDiscoverabilityEvent:userInfo:]_block_invoke", v2);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v6 = v4;
LABEL_12:
        _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Event stored"), "-[TIKeyboardInputManager logDiscoverabilityEvent:userInfo:]_block_invoke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v6 = v4;
      goto LABEL_12;
    }
LABEL_9:

  }
}

BOOL __77__TIKeyboardInputManager_candidateResultSetFromCandidates_proactiveTriggers___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

uint64_t __55__TIKeyboardInputManager_inputStringFromDocumentState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "_firstLongCharacter");
  if ((_DWORD)v4 && !objc_msgSend(*(id *)(a1 + 32), "acceptsCharacter:", v4))
    v5 = 1;
  else
    v5 = objc_msgSend(*(id *)(a1 + 32), "stringEndsWord:", v3);

  return v5;
}

void __72__TIKeyboardInputManager_incrementUsageTrackingKeyForAppWithIsSentence___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1EA13FFD0);
  v1 = (void *)-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::translationApps;
  -[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::translationApps = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1EA13FFE8);
  v3 = (void *)-[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::messagingApps;
  -[TIKeyboardInputManager incrementUsageTrackingKeyForAppWithIsSentence:]::messagingApps = v2;

}

void __55__TIKeyboardInputManager_initWithConfig_keyboardState___block_invoke(uint64_t a1, const void *a2)
{
  if (a2)
    TIInputManager::set_filter_specification_overrides(*(TIInputManager **)(*(_QWORD *)(a1 + 32) + 40), a2);
}

void __55__TIKeyboardInputManager_initWithConfig_keyboardState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "handleTrialParametersUpdateCallback");
    WeakRetained = v2;
  }

}

+ (int)shiftContextForShiftState:(int)a3 autocapitalizationType:(unint64_t)a4
{
  int v4;
  int v5;

  if (a4 == 1)
    v4 = 3;
  else
    v4 = 2;
  if (a4 == 3)
    v4 = 4;
  if (a3 != 2)
    v4 = 0;
  if (a3 == 3)
    v5 = 5;
  else
    v5 = v4;
  if (a3 == 1)
    return 1;
  else
    return v5;
}

+ (id)offlineLearningHandleForInputMode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  TILanguageModelOfflineLearningHandleFavonius *v8;

  v3 = a3;
  objc_msgSend(v3, "normalizedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TIGetInputModeProperties();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DBE0D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  v8 = -[TILanguageModelOfflineLearningHandleFavonius initWithInputMode:]([TILanguageModelOfflineLearningHandleFavonius alloc], "initWithInputMode:", v3);
  -[TILanguageModelOfflineLearningHandle setValid:](v8, "setValid:", v7);

  return v8;
}

- (BOOL)canHandleKeyHitTest
{
  uint64_t v3;
  void *v4;
  void *v6;
  char v7;

  if (TIGetKeyboardDisableHitTestingValue(void)::onceToken != -1)
    dispatch_once(&TIGetKeyboardDisableHitTestingValue(void)::onceToken, &__block_literal_global_1181);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "valueForPreferenceKey:", CFSTR("KeyboardDisableHitTesting"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");
  if ((v3 & 1) != 0)
    return 0;
  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "canHandleKeyHitTest");

  return v7;
}

- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *m_impl;
  double v9;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
  double v14;
  double v15;
  uint64_t v16;
  int v17;
  double v18;
  float v19;
  int v20;
  int64_t v21;

  v4 = a4;
  v6 = a3;
  if (self->m_impl)
  {
    if (-[TIKeyboardInputManager shouldMonitorTypingSession](self, "shouldMonitorTypingSession"))
    {
      -[TIKeyboardInputManager typingSessionMonitor](self, "typingSessionMonitor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addTouchEvent:", v6);

    }
    m_impl = self->m_impl;
    objc_msgSend(v6, "location");
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(v6, "stage");
    objc_msgSend(v6, "timestamp");
    v15 = v14;
    v16 = objc_msgSend(v6, "pathIndex");
    v17 = objc_msgSend(v6, "fingerID");
    objc_msgSend(v6, "radius");
    v19 = v18;
    v20 = TIInputManager::add_touch((uint64_t)m_impl, v13, v16, v17, objc_msgSend(v6, "forcedKeyCode"), objc_msgSend(v6, "continuousPathState"), v4, v10, v12, v15, v19);
    v21 = v20;
    if (objc_msgSend(v6, "stage") != 2 && v20 != -2)
      goto LABEL_14;
    if (v20 < 0)
    {
      if (v20 != -2 || self->_lastHitTestKeycode < 0)
        goto LABEL_13;
    }
    else if (self->_lastHitTestKeycode != -2)
    {
      goto LABEL_13;
    }
    -[TIKeyboardInputManager dropInput](self, "dropInput");
LABEL_13:
    self->_lastHitTestKeycode = v20;
LABEL_14:
    -[TIKeyboardInputManager setPreviousTouchEvent:](self, "setPreviousTouchEvent:", v6);
    goto LABEL_15;
  }
  v21 = 0;
LABEL_15:

  return v21;
}

- (unint64_t)userFrequencyOfWord:(id)a3
{
  return -[TIKeyboardInputManager userFrequencyOfWord:lexiconID:](self, "userFrequencyOfWord:lexiconID:", a3, 0xFFFFFFFFLL);
}

- (unint64_t)userFrequencyOfWord:(id)a3 lexiconID:(unsigned int)a4
{
  _QWORD *m_impl;
  uint64_t v5;
  KB *v6;
  unint64_t v7;
  _BYTE v9[8];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  m_impl = self->m_impl;
  if (!m_impl)
    return 0;
  v5 = *(_QWORD *)&a4;
  -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", a3);
  v6 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v6, (uint64_t)v9);
  v7 = (*(unsigned int (**)(_QWORD, _BYTE *, uint64_t))(**(_QWORD **)(m_impl[28] + 24) + 64))(*(_QWORD *)(m_impl[28] + 24), v9, v5);
  if (v10 && v9[6] == 1)
    free(v10);

  return v7;
}

- (void)setTestingStateObject:(id)a3
{
  objc_storeStrong((id *)&self->_testingStateObject, a3);
}

- (id)humanReadableTrace
{
  TypologyLogger *ptr;

  ptr = self->m_typology_recorder.__ptr_;
  if (ptr)
    return *((id *)ptr + 1);
  else
    return 0;
}

- (void)clearHumanReadableTrace
{
  TypologyLogger *ptr;

  ptr = self->m_typology_recorder.__ptr_;
  if (ptr)
    KB::TypologyLogger::clear((KB::TypologyLogger *)ptr);
}

- (void)storeLanguageModelDynamicDataIncludingCache
{
  _QWORD *m_impl;
  uint64_t v3;
  id v4;

  m_impl = self->m_impl;
  if (m_impl)
  {
    v3 = m_impl[29];
    if (v3)
    {
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 568))(v3, 1);
      +[TIResponseKitManager sharedTIResponseKitManager](TIResponseKitManager, "sharedTIResponseKitManager");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "persistResponseKitDynamicDataToDisk");

    }
  }
}

- (BOOL)isTypologyEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", 53);

  return v3;
}

- (void)logToTypologyRecorderWithString:(id)a3
{
  __CFString *v4;
  TypologyLogger *ptr;
  __CFString *v6;

  v4 = (__CFString *)a3;
  if (v4)
  {
    ptr = self->m_typology_recorder.__ptr_;
    if (ptr)
    {
      v6 = v4;
      CFStringAppend(*((CFMutableStringRef *)ptr + 1), v4);
      v4 = v6;
    }
  }

}

- (BOOL)dictionaryContainsWord:(id)a3
{
  id v4;
  KB *v5;
  KB *v6;
  TIInputManager *m_impl;
  char v8;
  _BYTE v10[8];
  void *v11;
  _BYTE v12[8];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v4);
  v5 = (KB *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v4);
  v6 = (KB *)objc_claimAutoreleasedReturnValue();

  m_impl = (TIInputManager *)self->m_impl;
  KB::utf8_string(v6, (uint64_t)v12);
  KB::utf8_string(v5, (uint64_t)v10);
  v8 = TIInputManager::dictionary_contains_word(m_impl, (const KB::String *)v12, (const KB::String *)v10, 0);
  if (v11 && v10[6] == 1)
    free(v11);
  if (v13 && v12[6] == 1)
    free(v13);

  return v8;
}

- (RefPtr<KB::DictionaryContainer>)getDictionary
{
  unsigned int **v2;
  unsigned int *v3;
  unsigned int v4;

  v3 = (unsigned int *)*((_QWORD *)self->m_impl + 28);
  *v2 = v3;
  if (v3)
  {
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
  }
  return (RefPtr<KB::DictionaryContainer>)self;
}

- (BOOL)isHardwareKeyboardAutocorrectionEnabled
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hardwareKeyboardMode");

  if (!v4)
    return 0;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "autocorrectionEnabled");

  return v6;
}

- (void)addSynthesizedTouchToInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  __int128 v11;
  void *v12;
  void *v13;
  double MidX;
  double MidY;
  void *v16;
  KB *v17;
  double v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __n128 (*v28)(uint64_t, uint64_t);
  uint64_t (*v29)();
  const char *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;

  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v4, "setUppercase:", 1);
      if (-[TIKeyboardInputManager nextInputWouldStartSentence](self, "nextInputWouldStartSentence"))
        objc_msgSend(v4, "setAutoshifted:", 1);
    }
  }
  else
  {
    v8 = 0;
  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = -1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x5012000000;
  v28 = __Block_byref_object_copy__1128;
  v29 = __Block_byref_object_dispose__1129;
  v30 = "";
  v11 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v31 = *MEMORY[0x1E0C9D628];
  v32 = v11;
  if (v8 || objc_msgSend(v4, "isBackspace"))
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __84__TIKeyboardInputManager_TIHardwareKeyboardExperiments__addSynthesizedTouchToInput___block_invoke;
    v20[3] = &unk_1EA1010D8;
    v21 = v8;
    v22 = v4;
    v23 = &v25;
    v24 = &v33;
    objc_msgSend(v13, "enumerateKeysUsingBlock:", v20);

  }
  if (*((_DWORD *)v34 + 6) == -1)
  {
    objc_msgSend(v4, "setPopupVariant:", 1);
  }
  else
  {
    MidX = CGRectGetMidX(*(CGRect *)(v26 + 6));
    MidY = CGRectGetMidY(*(CGRect *)(v26 + 6));
    v16 = (void *)MEMORY[0x1E0DBDC78];
    v18 = KB::system_uptime(v17);
    objc_msgSend(v16, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 2, 0, *((int *)v34 + 6), MidX, MidY, 12.0, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTouchEvent:", v19);

  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v33, 8);

}

void __84__TIKeyboardInputManager_TIHardwareKeyboardExperiments__addSynthesizedTouchToInput___block_invoke(uint64_t a1, uint64_t a2, int a3, _BYTE *a4, double a5, double a6, double a7, double a8)
{
  double *v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 40), "isBackspace")
    && objc_msgSend(v16, "isEqualToString:", CFSTR("delete")))
  {
    v15 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
    v15[6] = a5;
    v15[7] = a6;
    v15[8] = a7;
    v15[9] = a8;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (unint64_t)maximumShortcutLengthAllowed
{
  _QWORD *m_impl;
  uint64_t *v3;
  uint64_t v4;

  m_impl = self->m_impl;
  if (m_impl && (v3 = *(uint64_t **)(*(_QWORD *)(m_impl[28] + 24) + 24)) != 0 && (v4 = *v3) != 0)
    return *(unsigned int *)(v4 + 88);
  else
    return 0;
}

- (id)shortcutConversionForDocumentState:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[TIKeyboardInputManager shouldSkipShortcutConversionForDocumentState:](self, "shouldSkipShortcutConversionForDocumentState:", v4))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "contextBeforeInput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager shortcutConversionForString:stringStartsInMiddleOfWord:](self, "shortcutConversionForString:stringStartsInMiddleOfWord:", v6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

void __82__TIKeyboardInputManager_ShortcutConversion__shortcutCompletionsForDocumentState___block_invoke(uint64_t a1, uint64_t a2)
{
  KB *v3;
  const KB::String *v4;
  void *v5;
  void *v6;
  void *v7;
  _WORD v8[3];
  char v9;
  void *v10;
  _BYTE v11[8];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "externalStringToInternal:", a2);
  v3 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v3, (uint64_t)v11);

  TIInputManager::single_character_completions_for_shortcut_prefix(*(KB::UserDictionary **)(*(_QWORD *)(a1 + 32) + 40), (const KB::String *)v11, (uint64_t)v8);
  if (v8[0])
  {
    v5 = *(void **)(a1 + 32);
    KB::ns_string((KB *)v8, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internalStringToExternal:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "appendString:", v7);
  }
  if (v10 && v9 == 1)
    free(v10);
  if (v12)
  {
    if (v11[6] == 1)
      free(v12);
  }
}

- (id)_supplementalCompletionCandidates:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v9;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "canSuggestSupplementalItemsForCurrentSelection") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supplementalLexiconIdentifier");

  if (!v7)
  {
LABEL_7:
    v9 = (void *)MEMORY[0x1E0C9AA60];
    return v9;
  }
  v8 = -[TIKeyboardInputManager _hasSupplementalPrefix](self, "_hasSupplementalPrefix");
  if (KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix || !v8)
  {
    -[TIKeyboardInputManager completionCandidates:](self, "completionCandidates:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 1;
    -[TIKeyboardInputManager completionCandidates:](self, "completionCandidates:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 0;
  }
  return v9;
}

- (id)supplementalAutocorrection
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager supplementalAutocorrectionCandidates](self, "supplementalAutocorrectionCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)supplementalAutocorrectionCandidates
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "canSuggestSupplementalItemsForCurrentSelection") & 1) == 0)
  {

LABEL_9:
    v10 = 0;
    return v10;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supplementalLexiconIdentifier");

  if (!v5 || !-[TIKeyboardInputManager _hasSupplementalPrefix](self, "_hasSupplementalPrefix"))
    goto LABEL_9;
  v6 = KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix;
  if (!KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix)
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 1;
  -[TIKeyboardInputManager autocorrection](self, "autocorrection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "supplementalItemIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:", v7, 0);
  else
    v10 = 0;

  if (!v6)
    KB::SetInputHasSupplementalPrefixForScope::s_inputHasSupplementalPrefix = 0;
  return v10;
}

- (id)autocorrection
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager autocorrectionCandidates](self, "autocorrectionCandidates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "autocorrection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)autocorrectionCandidates
{
  void *v3;
  BOOL v4;
  void *v5;
  BOOL v6;
  const KB::String *v7;
  void *v8;
  _DWORD *m_impl;
  int v11;
  void *v12;
  KB *v13;
  KB *v14;
  void *v15;
  char v16;
  TIInputManager *v17;
  char v18;
  const KB::String *v19;
  void *v20;
  KB *v21;
  const KB::String *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  TIInputManager *v29;
  char v30;
  KB *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  os_signpost_id_t v34;
  const KB::String *v35;
  uint64_t v36;
  KB *v37;
  uint64_t v38;
  int *v39;
  char v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  os_signpost_id_t v44;
  os_signpost_id_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  const KB::String *v49;
  void *v50;
  int v51;
  NSObject *v52;
  void *v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  os_signpost_id_t v59;
  os_signpost_id_t v60;
  void *v61;
  int v62;
  NSObject *v63;
  os_signpost_id_t v64;
  os_signpost_id_t v65;
  unsigned int v66;
  NSObject *v67;
  KB *v68;
  void *v69;
  void *ptr;
  KB *v71;
  KB *v72;
  uint8_t v73[8];
  void *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  _BYTE v78[40];
  uint8_t buf[16];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  __int16 v86;
  char v87;
  uint64_t v88;
  char v89;
  _BYTE v90[8];
  void *v91;
  char v92;
  uint64_t v93;
  void *v94;
  __int16 v95[37];
  char v96;
  _BYTE v97[8];
  void *v98;
  _BYTE v99[8];
  void *v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  if (!self->m_impl)
    goto LABEL_8;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "autocorrectionEnabled"))
  {

    goto LABEL_8;
  }
  v4 = -[TIKeyboardInputManager allowsAutocorrectionForCurrentInputString](self, "allowsAutocorrectionForCurrentInputString");

  if (v4)
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hardwareKeyboardMode"))
    {
      v6 = -[TIKeyboardInputManager isHardwareKeyboardAutocorrectionEnabled](self, "isHardwareKeyboardAutocorrectionEnabled");

      if (!v6)
        goto LABEL_8;
    }
    else
    {

    }
    m_impl = self->m_impl;
    v11 = m_impl[24];
    if (v11)
    {
      KB::ns_string((KB *)(*((_QWORD *)m_impl + 1) + 40 * (v11 - 1)), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[TIKeyboardInputManager stringEndsWord:](self, "stringEndsWord:", v12)
        || -[TIKeyboardInputManager isEditingExistingWord](self, "isEditingExistingWord")
        && !-[TIKeyboardInputManager _hasSupplementalPrefix](self, "_hasSupplementalPrefix"))
      {
        v8 = 0;
LABEL_117:

        return v8;
      }
      -[TIKeyboardInputManager currentWordStem](self, "currentWordStem");
      v13 = (KB *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v13);
      v14 = (KB *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "allowsAutocorrectionOfValidWords");

      if ((v16 & 1) == 0)
      {
        v17 = (TIInputManager *)self->m_impl;
        KB::utf8_string(v14, (uint64_t)&v93);
        KB::utf8_string(v13, (uint64_t)buf);
        v18 = TIInputManager::dictionary_contains_word(v17, (const KB::String *)&v93, (const KB::String *)buf, 0);
        if (*(_QWORD *)&buf[8] && buf[6] == 1)
          free(*(void **)&buf[8]);
        if (v94 && BYTE6(v93) == 1)
          free(v94);
        if ((v18 & 1) != 0)
        {
          v8 = 0;
LABEL_116:

          goto LABEL_117;
        }
      }
      v72 = v14;
      TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v99);
      KB::ns_string((KB *)v99, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager internalStringToExternal:ignoreCompositionDisabled:](self, "internalStringToExternal:ignoreCompositionDisabled:", v20, 1);
      v21 = (KB *)objc_claimAutoreleasedReturnValue();

      v22 = (const KB::String *)v97;
      v71 = v21;
      KB::utf8_string(v21, (uint64_t)v97);
      -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "canConvertExternalToExternal"))
      {
        -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "shouldConvertCandidateToExternal"))
          v22 = (const KB::String *)v99;

      }
      KB::Candidate::Candidate((KB::Candidate *)&v93, v22, 0);
      v25 = -[TIKeyboardInputManager shiftContext](self, "shiftContext");
      -[TIKeyboardInputManager phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:](self, "phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:", v97, 1, 1, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setConfidence:", 0);
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "hardwareKeyboardMode");

      if (!v26 && v28)
      {
        v29 = (TIInputManager *)self->m_impl;
        KB::utf8_string(v14, (uint64_t)buf);
        KB::utf8_string(v13, (uint64_t)v73);
        v30 = TIInputManager::dictionary_contains_word(v29, (const KB::String *)buf, (const KB::String *)v73, 1);
        if (v74 && v73[6] == 1)
          free(v74);
        if (*(_QWORD *)&buf[8] && buf[6] == 1)
          free(*(void **)&buf[8]);
        if ((v30 & 1) != 0)
        {
          v8 = 0;
          v31 = v71;
LABEL_110:
          KB::Candidate::~Candidate((KB::Candidate *)&v93);
          if (v98 && v97[6] == 1)
            free(v98);

          if (v100 && v99[6] == 1)
            free(v100);
          goto LABEL_116;
        }
      }
      kdebug_trace();
      kac_get_log();
      v32 = (id)objc_claimAutoreleasedReturnValue();
      ptr = (void *)((unint64_t)self ^ 0x14);
      v33 = os_signpost_id_make_with_pointer(v32, (const void *)((unint64_t)self ^ 0x14));
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v33;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v34, "kbdManager.generateOnlyAutocorrections", ", buf, 2u);
        }
      }

      if (v26)
      {
        v36 = 0;
        v85 = 0x10000000000000;
        v90[0] = 0;
        v92 = 0;
        *(_OWORD *)buf = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v86 = 0;
        v87 = 0;
        v88 = 0;
        v89 = 0;
      }
      else
      {
        v37 = v13;
        -[TIKeyboardInputManager transferErrorCorrectionFlagsToInputCandidate:](self, "transferErrorCorrectionFlagsToInputCandidate:", &v93);
        v90[0] = 0;
        v92 = 0;
        v85 = 0x10000000000000;
        *(_OWORD *)buf = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        v86 = 0;
        v87 = 0;
        v88 = 0;
        v89 = 0;
        (*(void (**)(uint8_t *__return_ptr, void *, uint64_t))(*(_QWORD *)self->m_impl + 16))(v73, self->m_impl, v25);
        KB::CandidateCollection::operator=((uint64_t)buf, (uint64_t)v73);
        KB::String::operator=((uint64_t)&v85 + 4, (KB::String *)v78);
        std::tuple<KB::CandidateCollection,KB::String>::~tuple((uint64_t)v73);
        KB::CandidateCollection::CandidateCollection((KB::CandidateCollection *)v73, (const KB::Candidate **)buf);
        KB::String::String((KB::String *)v78, (const KB::String *)((char *)&v85 + 4));
        if (*(void **)v73 == v74 && v75 != v76)
        {
          -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v61, "canConvertExternalToExternal");

          if (v62)
          {
            KB::Candidate::operator=((uint64_t)&v93, v75);
            std::optional<KB::String>::operator=[abi:nn180100]<KB::String,void>((uint64_t)v90, (KB::String *)v78);
          }
        }
        if (v74 != *(void **)v73)
        {
          KB::Candidate::operator=((uint64_t)&v93, *(uint64_t *)v73);
          std::optional<KB::String>::operator=[abi:nn180100]<KB::String,void>((uint64_t)v90, (KB::String *)v78);
        }
        if ((v77 & 1) != 0)
          v96 = 1;
        std::tuple<KB::CandidateCollection,KB::String>::~tuple((uint64_t)v73);
        if (!v95[0])
          KB::Candidate::compute_string((KB::Candidate *)&v93);
        v13 = v37;
        if (KB::String::equal((KB::String *)v95, v22, 0))
          goto LABEL_61;
        KB::Candidate::capitalized_string((KB::Candidate *)&v93, (uint64_t)v73);
        -[TIKeyboardInputManager phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:](self, "phraseCandidateCompletedByWord:allowNoSuggest:forAutocorrection:shiftContext:", v73, 0, 1, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74 && v73[6] == 1)
          free(v74);
        objc_msgSend(v26, "setConfidence:", 2);
        if (!v26)
        {
LABEL_61:
          if (v93)
          {
            v38 = 240 * v93 - 240;
            v39 = (int *)((char *)v94 + 104);
            do
            {
              v41 = *v39;
              v39 += 60;
              v40 = v41;
              if ((v41 & 0x10) != 0)
                break;
              v42 = v38;
              v38 -= 240;
            }
            while (v42);
            if ((v40 & 0x10) != 0)
            {
              kdebug_trace();
              kac_get_log();
              v43 = (id)objc_claimAutoreleasedReturnValue();
              v44 = os_signpost_id_make_with_pointer(v43, ptr);
              if (v44 - 1 > 0xFFFFFFFFFFFFFFFDLL)
              {
                v8 = 0;
                v46 = v43;
                v31 = v71;
              }
              else
              {
                v45 = v44;
                v31 = v71;
                if (os_signpost_enabled(v43))
                {
                  *(_WORD *)v73 = 0;
                  _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v43, OS_SIGNPOST_INTERVAL_END, v45, "kbdManager.generateOnlyAutocorrections", ", v73, 2u);
                }
                v8 = 0;
                v46 = v43;
              }
              goto LABEL_105;
            }
          }
          v26 = 0;
          v36 = 1;
        }
        else
        {
          v36 = 0;
        }
      }
      v69 = v12;
      if (v92)
      {
        KB::ns_string((KB *)v90, v35);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = v47;
        if (v92)
        {
          v48 = v47;
          v43 = v48;
          goto LABEL_74;
        }
      }
      else
      {
        v48 = 0;
      }
      TIInputManager::input_substring((unsigned __int16 *)self->m_impl + 4, 0, *((_DWORD *)self->m_impl + 24), (uint64_t)v73);
      KB::ns_string((KB *)v73, v49);
      v43 = objc_claimAutoreleasedReturnValue();
      if (v74 && v73[6] == 1)
        free(v74);
LABEL_74:
      -[TIKeyboardInputManager internalStringToExternal:ignoreCompositionDisabled:](self, "internalStringToExternal:ignoreCompositionDisabled:", v43, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v93 & 0xFFFFFFFE) != 0)
        v51 = v36;
      else
        v51 = 0;
      v67 = v48;
      v68 = v13;
      if (v51 == 1 && !-[TIKeyboardInputManager _canSuggestPhraseCandidate:withStem:](self, (KB::Candidate *)&v93, v50))
      {
        kdebug_trace();
        kac_get_log();
        v52 = (id)objc_claimAutoreleasedReturnValue();
        v59 = os_signpost_id_make_with_pointer(v52, ptr);
        if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v60 = v59;
          v31 = v71;
          if (os_signpost_enabled(v52))
          {
            *(_WORD *)v73 = 0;
            _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v52, OS_SIGNPOST_INTERVAL_END, v60, "kbdManager.generateOnlyAutocorrections", ", v73, 2u);
          }
          v8 = 0;
          v53 = v52;
          goto LABEL_104;
        }
        v8 = 0;
        v53 = v52;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v52 = objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v36)
        {
          if (v93)
          {
            -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:", v50, v43, &v93);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "setConfidence:", 2);
            v36 = -[TIKeyboardInputManager shouldBlockAutocorrection:](self, "shouldBlockAutocorrection:", v53);
            if ((_DWORD)v36)
            {
              -[NSObject addObject:](v52, "addObject:", v53);

              v53 = 0;
            }
            v54 = *((_QWORD *)&v80 + 1);
            if (*((_QWORD *)&v80 + 1) < (unint64_t)v81)
            {
              v66 = v36;
              do
              {
                -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:", v50, v43, v54);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "setConfidence:", 2);
                if (v53)
                {
                  objc_msgSend(v53, "input");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "input");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  v58 = objc_msgSend(v56, "isEqualToString:", v57);

                  if (v58)
                    -[NSObject addObject:](v52, "addObject:", v55);
                }

                v54 += 1000;
              }
              while (v54 < (unint64_t)v81);
              v36 = v66;
            }
          }
          else
          {
            v36 = 0;
            v53 = 0;
          }
        }
        else
        {
          -[TIKeyboardInputManager checkRejectionHistory:](self, "checkRejectionHistory:", v26);
          v53 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:autocorrectionBlocked:", v53, v52, v36);
        kdebug_trace();
        kac_get_log();
        v63 = (id)objc_claimAutoreleasedReturnValue();
        v64 = os_signpost_id_make_with_pointer(v63, ptr);
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v65 = v64;
          if (os_signpost_enabled(v63))
          {
            *(_WORD *)v73 = 0;
            _os_signpost_emit_with_name_impl(&dword_1DA6F2000, v63, OS_SIGNPOST_INTERVAL_END, v65, "kbdManager.generateOnlyAutocorrections", ", v73, 2u);
          }
        }

      }
      v31 = v71;
LABEL_104:

      v13 = v68;
      v12 = v69;
      v46 = v67;
LABEL_105:

      std::tuple<KB::CandidateCollection,KB::String>::~tuple((uint64_t)buf);
      if (v92 && v91 && v90[6] == 1)
        free(v91);
      v14 = v72;
      goto LABEL_110;
    }
  }
LABEL_8:
  v8 = 0;
  return v8;
}

- (void)transferErrorCorrectionFlagsToInputCandidate:(void *)a3
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;

  if (*(_QWORD *)a3)
  {
    v4 = 0;
    v5 = *((_QWORD *)a3 + 1);
    v6 = 240 * *(_QWORD *)a3;
    do
    {
      v7 = *(unsigned __int16 *)(v5 + 4);
      if (!*(_WORD *)(v5 + 4))
      {
        KB::String::compute_length((unsigned __int16 *)v5);
        v7 = *(unsigned __int16 *)(v5 + 4);
      }
      v8 = v4 + v7;
      if (TIInputManager::is_input_hit_test_corrected((TIInputManager *)self->m_impl, v4, v4 + v7))
        *(_QWORD *)(v5 + 152) = 64;
      v5 += 240;
      v4 = v8;
      v6 -= 240;
    }
    while (v6);
  }
}

- (id)autocorrectionList
{
  void *v3;

  -[TIKeyboardInputManager autocorrectionListWithCandidateCount:](self, "autocorrectionListWithCandidateCount:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager setLastAutocorrectionList:](self, "setLastAutocorrectionList:", v3);
  return v3;
}

- (BOOL)canGenerateCompletionCandidates
{
  char v3;
  void *v4;
  void *v5;

  if (TITransientLexiconManagerGetActiveSupplementalLexiconWords())
    return 1;
  -[TIKeyboardInputManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "usesWordNgramModel") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "supportsMultilingualKeyboard");

  }
  return v3;
}

- (id)autocorrectionListWithCandidateCount:(unint64_t)a3
{
  uint64_t v5;
  void (**v6)(void *, uint64_t);
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  char v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  char isKindOfClass;
  id v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  TIKeyboardInputManager *v72;
  void (**v73)(void *, uint64_t);
  void *v74;
  id v75;
  void *v76;
  _QWORD v77[5];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _QWORD aBlock[5];
  _BYTE v83[128];
  _QWORD v84[3];

  v84[1] = *MEMORY[0x1E0C80C00];
  if (self->m_impl)
  {
    if (-[TIKeyboardInputManager canGenerateCompletionCandidates](self, "canGenerateCompletionCandidates"))
    {
      v5 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__TIKeyboardInputManager_ResultSpecializations__autocorrectionListWithCandidateCount___block_invoke;
      aBlock[3] = &unk_1EA101068;
      aBlock[4] = self;
      v6 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
      if ((*((_DWORD *)self->m_impl + 98) & 0x80000000) == 0)
      {
        -[TIKeyboardInputManager continuousPathCandidates:](self, "continuousPathCandidates:", a3);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v10 = (void *)v7;
        v6[2](v6, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

LABEL_14:
        return v8;
      }
      if (-[TIKeyboardInputManager shouldGenerateSuggestionsForSelectedText](self, "shouldGenerateSuggestionsForSelectedText")|| -[TIKeyboardInputManager doesSelectedTextGenerateEmojiCandidates](self, "doesSelectedTextGenerateEmojiCandidates"))
      {
        -[TIKeyboardInputManager autocorrectionListForSelectedText](self, "autocorrectionListForSelectedText");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if (-[TIKeyboardInputManager shouldGeneratePredictionsForCurrentContext](self, "shouldGeneratePredictionsForCurrentContext"))
      {
        -[TIKeyboardInputManager autocorrectionListForEmptyInputWithDesiredCandidateCount:](self, "autocorrectionListForEmptyInputWithDesiredCandidateCount:", a3);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      if (-[TIKeyboardInputManager inputCount](self, "inputCount") > 0x40)
      {
        v8 = 0;
        goto LABEL_14;
      }
      if ((TIAdaptationAutocorrectionRejectionV2Enabled() & 1) != 0)
      {
        v12 = 0;
      }
      else
      {
        -[TIKeyboardInputManager rejectedAutocorrections](self, "rejectedAutocorrections");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager inputString](self, "inputString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v15 != 0;

      }
      v16 = -[TIKeyboardInputManager inputCount](self, "inputCount");
      if (v16 == -[TIKeyboardInputManager inputIndex](self, "inputIndex")
        && -[TIKeyboardInputManager inputIndex](self, "inputIndex")
        && !(*(unsigned int (**)(_QWORD))(**((_QWORD **)self->m_impl + 23) + 232))(*((_QWORD *)self->m_impl
                                                                                                + 23)))
      {
        -[TIKeyboardInputManager inputString](self, "inputString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager cachedAutocorrectionListResponseFor:](self, "cachedAutocorrectionListResponseFor:", v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          v18 = v12;
        else
          v18 = 1;
        if (v18 != 1)
          goto LABEL_14;

      }
      if (-[TIKeyboardInputManager _hasSupplementalPrefix](self, "_hasSupplementalPrefix"))
      {
        v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
        -[TIKeyboardInputManager _supplementalCompletionCandidates:](self, "_supplementalCompletionCandidates:", a3);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);

        if (!v12)
        {
          -[TIKeyboardInputManager supplementalAutocorrectionCandidates](self, "supplementalAutocorrectionCandidates");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:
          v23 = v22;
          objc_msgSend(v22, "autocorrection");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:
          objc_msgSend(v23, "alternateCorrections");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "autocorrectionBlocked") && objc_msgSend(v25, "count"))
          {
            objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
            v26 = v25;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v84[0] = v27;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v21);
            v29 = a3;
            v30 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v26, "subarrayWithRange:", 1, objc_msgSend(v26, "count") - 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v21 = (void *)v30;
            a3 = v29;
            v5 = MEMORY[0x1E0C809B0];
          }
          v70 = v25;
          -[TIKeyboardInputManager typedStringForEmptyAutocorrection](self, "typedStringForEmptyAutocorrection");
          v31 = objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            objc_msgSend(MEMORY[0x1E0DBDBE8], "candidateWithUnchangedInput:", v31);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v69 = (void *)v31;
          -[TIKeyboardInputManager emojiCandidateGenerator](self, "emojiCandidateGenerator");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "emojiReplacementCandidatesForKeyboardState:", v33);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v72 = self;
          v73 = v6;
          if (objc_msgSend(v24, "isSupplementalItemCandidate")
            && !-[TIKeyboardInputManager _hasSupplementalPrefix](self, "_hasSupplementalPrefix"))
          {

            v24 = 0;
          }
          v71 = a3;
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v24;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v34 = v21;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
          v74 = v34;
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v79;
            do
            {
              v38 = 0;
              do
              {
                if (*(_QWORD *)v79 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v38);
                objc_msgSend(v39, "candidate");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "isEqualToString:", &stru_1EA1081D0);

                if ((v41 & 1) == 0)
                {
                  v77[0] = v5;
                  v77[1] = 3221225472;
                  v77[2] = __86__TIKeyboardInputManager_ResultSpecializations__autocorrectionListWithCandidateCount___block_invoke_2;
                  v77[3] = &unk_1EA102730;
                  v77[4] = v39;
                  v42 = _Block_copy(v77);
                  v43 = objc_msgSend(v76, "indexOfObjectPassingTest:", v42);
                  if (v43 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    objc_msgSend(v39, "candidate");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "candidate");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_msgSend(v44, "isEqualToString:", v45);

                    if (v46
                      && (v47 = objc_msgSend(v39, "isSupplementalItemCandidate"),
                          v47 == objc_msgSend(v75, "isSupplementalItemCandidate")))
                    {
                      objc_opt_class();
                      isKindOfClass = objc_opt_isKindOfClass();
                      v5 = MEMORY[0x1E0C809B0];
                      v34 = v74;
                      if ((isKindOfClass & 1) != 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v55 = v75;
                          v56 = v39;
                          objc_msgSend(v55, "lexiconLocale");
                          v57 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v57)
                          {
                            objc_msgSend(v56, "lexiconLocale");
                            v58 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v55, "setLexiconLocale:", v58);

                          }
                        }
                      }
                    }
                    else
                    {
                      v48 = objc_msgSend(v39, "isSupplementalItemCandidate");
                      v5 = MEMORY[0x1E0C809B0];
                      v34 = v74;
                      if ((v48 & 1) != 0)
                        goto LABEL_58;
                      if (v39)
                      {
                        v49 = v39;
                        objc_msgSend(v49, "candidate");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v49, "input");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();

                        LOBYTE(v49) = objc_msgSend(v50, "isEqualToString:", v51);
                        v5 = MEMORY[0x1E0C809B0];

                        if ((v49 & 1) == 0)
LABEL_58:
                          objc_msgSend(v76, "addObject:", v39);
                      }
                    }
                  }
                  else
                  {
                    v52 = v43;
                    objc_msgSend(v76, "objectAtIndexedSubscript:", v43);
                    v53 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v39, "isSupplementalItemCandidate")
                      && (objc_msgSend(v53, "isSupplementalItemCandidate") & 1) == 0)
                    {
                      objc_msgSend(v76, "setObject:atIndexedSubscript:", v39, v52);
                    }

                  }
                }
                ++v38;
              }
              while (v36 != v38);
              v59 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, v83, 16);
              v36 = v59;
            }
            while (v59);
          }

          if (objc_msgSend(v76, "count") <= v71)
          {
            v60 = v76;
          }
          else
          {
            objc_msgSend(v76, "subarrayWithRange:", 0);
            v60 = (id)objc_claimAutoreleasedReturnValue();
          }
          v61 = v60;
          v6 = v73;
          v10 = v75;
          -[TIKeyboardInputManager extendedAutocorrection:spanningInputsForCandidates:emojis:](v72, "extendedAutocorrection:spanningInputsForCandidates:emojis:", v75, v60, v68);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager autocorrectionForCurrentStem](v72, "autocorrectionForCurrentStem");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "candidate");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager currentWordStem](v72, "currentWordStem");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "setObject:forKey:", v64, v65);

          v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB70]), "initWithAutocorrection:alternateCorrections:", v62, v70);
          objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:predictions:emojiList:", v66, v61, v68);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v6[2](v6, (uint64_t)v67);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_13;
        }
      }
      else
      {
        -[TIKeyboardInputManager completionCandidates:](self, "completionCandidates:", a3 - objc_msgSend(0, "count"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          -[TIKeyboardInputManager autocorrectionCandidates](self, "autocorrectionCandidates");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_37;
        }
      }
      v23 = 0;
      v24 = 0;
      goto LABEL_38;
    }
    -[TIKeyboardInputManager supplementalAutocorrectionCandidates](self, "supplementalAutocorrectionCandidates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[TIKeyboardInputManager autocorrectionCandidates](self, "autocorrectionCandidates");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0DBDB48], "listWithCorrections:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)candidates
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TIAccumulatingCandidateHandler *v15;
  id v16;
  id v17;
  TIAccumulatingCandidateHandler *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  TIKeyboardInputManager *v26;
  id v27;
  BOOL v28;
  char v29;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIInputMode inputModeWithIdentifier:](TIInputMode, "inputModeWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 != v5;

  v8 = objc_msgSend(v5, "supportsPrediction");
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "longPredictionListEnabled") & 1) != 0)
  {

  }
  else
  {

    v10 = 0;
    if (v6 == v5 || (v8 & 1) == 0)
      goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "documentState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager shortcutConversionForDocumentState:](self, "shortcutConversionForDocumentState:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v11, "addObject:", v14);
  v15 = [TIAccumulatingCandidateHandler alloc];
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __59__TIKeyboardInputManager_ResultSpecializations__candidates__block_invoke;
  v24 = &unk_1EA101090;
  v16 = v11;
  v28 = v7;
  v29 = v8;
  v25 = v16;
  v26 = self;
  v27 = v14;
  v17 = v14;
  v18 = -[TIAccumulatingCandidateHandler initWithHandlerBlock:](v15, "initWithHandlerBlock:", &v21);
  -[TIKeyboardInputManager pushCandidateGenerationContextOnStack](self, "pushCandidateGenerationContextOnStack", v21, v22, v23, v24);
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:](self, "generateAutocorrectionsWithKeyboardState:candidateRange:candidateHandler:", v19, 0, 20, v18);

  -[TIKeyboardInputManager popCandidateGenerationContextFromStack](self, "popCandidateGenerationContextFromStack");
  v10 = v16;

LABEL_8:
  return v10;
}

- (id)candidatesForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  int v10;
  void *m_impl;
  KB *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->m_impl
    && (unint64_t)objc_msgSend(v4, "length") <= 0x40
    && (objc_msgSend(v5, "_looksLikeURL") & 1) == 0)
  {
    v8 = 2 * (u_isupper(objc_msgSend(v5, "_firstLongCharacter")) != 0);
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[TIKeyboardInputManager shiftContextForShiftState:autocapitalizationType:](TIKeyboardInputManager, "shiftContextForShiftState:autocapitalizationType:", v8, objc_msgSend(v9, "autocapitalizationType"));

    m_impl = self->m_impl;
    -[TIKeyboardInputManager externalStringToInternal:](self, "externalStringToInternal:", v5);
    v12 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v12, (uint64_t)&v24);
    TIInputManager::candidates_for_string((uint64_t)m_impl, (const KB::String *)&v24, v10, (uint64_t)&v19);
    if (v25 && BYTE6(v24) == 1)
      free(v25);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    v13 = v20;
    if (v20 != v19)
    {
      v15 = 0;
      v16 = 1;
      do
      {
        if (*(_QWORD *)(v14 + 1000 * v15))
        {
          -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:", v5, 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v17);

          v14 = v19;
          v13 = v20;
        }
        v15 = v16;
      }
      while (0x1CAC083126E978D5 * ((v13 - v14) >> 3) > (unint64_t)v16++);
    }
    v24 = (void **)&v23;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v24);
    v24 = (void **)&v22;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v24);
    v24 = (void **)&v21;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v24);
    v24 = (void **)&v19;
    std::vector<KB::Candidate>::__destroy_vector::operator()[abi:nn180100](&v24);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setPhraseBoundaryIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  id v7;

  if (-[TIKeyboardInputManager supportsSetPhraseBoundary](self, "supportsSetPhraseBoundary")
    && !-[TIKeyboardInputManager isProgressivelyPathing](self, "isProgressivelyPathing"))
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "documentState");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v7;
    if (v7)
    {
      v5 = objc_msgSend(v7, "selectedRangeInMarkedText");
      v4 = v7;
      if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = v5 == -[TIKeyboardInputManager phraseBoundary](self, "phraseBoundary");
        v4 = v7;
        if (!v6)
        {
          -[TIKeyboardInputManager setPhraseBoundary:](self, "setPhraseBoundary:", v5);
          v4 = v7;
        }
      }
    }

  }
}

- (unint64_t)phraseBoundary
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 0;
}

- (BOOL)usesMLTapTyping
{
  int v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[TIKeyboardInputManager userInterfaceIdiom](self, "userInterfaceIdiom"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "hardwareKeyboardMode") & 1) != 0)
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "splitKeyboardMode") & 1) != 0)
      {
        LOBYTE(v3) = 0;
      }
      else
      {
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v3 = objc_msgSend(v6, "floatingKeyboardMode") ^ 1;

      }
    }

  }
  return v3;
}

- (double)continuousPathLanguageWeight
{
  void *v2;
  double v3;
  double v4;

  -[TIKeyboardInputManager config](self, "config");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "continuousPathLanguageWeight");
  v4 = v3;

  return v4;
}

- (BOOL)commitsAcceptedCandidate
{
  return 1;
}

- (BOOL)newInputAcceptsUserSelectedCandidate
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hardwareKeyboardMode") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "userInterfaceIdiom") != 2;

  }
  return v4;
}

- (BOOL)usesAutoDeleteWord
{
  return 1;
}

- (unint64_t)autoquoteType
{
  return 2;
}

- (id)defaultCandidate
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0DBDBE8]);
  -[TIKeyboardInputManager inputStem](self, "inputStem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUnchangedInput:", v4);

  return v5;
}

- (unint64_t)initialSelectedIndex
{
  return self->m_initialSelectedIndex;
}

- (unint64_t)initialCandidateBatchCount
{
  return 0x7FFFFFFFLL;
}

- (id)searchStringForMarkedText
{
  return &stru_1EA1081D0;
}

- (BOOL)suppliesCompletions
{
  return 0;
}

- (BOOL)suppressCompletionsForFieldEditor
{
  return 0;
}

- (id)terminatorsPreventingAutocorrection
{
  if (-[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::onceToken, &__block_literal_global_1003);
  return (id)-[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::result;
}

- (id)terminatorsDeletingAutospace
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "terminatorsDeletingAutospace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)terminatorsPrecedingAutospace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__TIKeyboardInputManager_ResultSpecializations__terminatorsPrecedingAutospace__block_invoke;
  block[3] = &unk_1EA106A98;
  block[4] = self;
  if (-[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::onceToken != -1)
    dispatch_once(&-[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::onceToken, block);
  return (id)-[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::result;
}

- (id)spaceDeletingCharacters
{
  void *v2;
  void *v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spaceDeletingCharacters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)closingQuotes
{
  TICharacterSetDescription *closingQuotes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TICharacterSetDescription *v9;

  closingQuotes = self->_closingQuotes;
  if (!closingQuotes)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC98]), "initWithCharactersInString:", CFSTR("”’"));
    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightDoubleQuote");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addCharactersInString:", v6);

    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "rightSingleQuote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addCharactersInString:", v8);

    v9 = self->_closingQuotes;
    self->_closingQuotes = (TICharacterSetDescription *)v4;

    closingQuotes = self->_closingQuotes;
  }
  return closingQuotes;
}

- (id)openingQuotes
{
  TICharacterSetDescription *openingQuotes;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TICharacterSetDescription *v9;

  openingQuotes = self->_openingQuotes;
  if (!openingQuotes)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDC98]), "initWithCharactersInString:", CFSTR("“‘"));
    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftDoubleQuote");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addCharactersInString:", v6);

    -[TIKeyboardInputManager smartOptions](self, "smartOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "leftSingleQuote");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addCharactersInString:", v8);

    v9 = self->_openingQuotes;
    self->_openingQuotes = (TICharacterSetDescription *)v4;

    openingQuotes = self->_openingQuotes;
  }
  return openingQuotes;
}

- (id)sortingMethods
{
  void *v2;
  int v3;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longPredictionListEnabled");

  if (v3)
    return &unk_1EA140000;
  else
    return 0;
}

- (id)titleForSortingMethod:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;

  v4 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longPredictionListEnabled");

  if (v6)
    v7 = v4;
  else
    v7 = 0;

  return v7;
}

- (BOOL)alwaysShowExtensionCandidatesForSortingMethod:(id)a3
{
  return 1;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  id v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "longPredictionListEnabled");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0DBDBD8]);
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithTitle:candidates:", 0, v9);
    v13[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)indexTitlesForGroupTitles:(id)a3 sortingMethod:(id)a4
{
  return a3;
}

void __78__TIKeyboardInputManager_ResultSpecializations__terminatorsPrecedingAutospace__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_alloc(MEMORY[0x1E0DBDB60]);
  objc_msgSend(*(id *)(a1 + 32), "sentenceDelimitingCharacters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(",.;:?!)]}”’"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithCharactersInString:", v3);
  v5 = (void *)-[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::result;
  -[TIKeyboardInputManager(ResultSpecializations) terminatorsPrecedingAutospace]::result = v4;

}

void __84__TIKeyboardInputManager_ResultSpecializations__terminatorsPreventingAutocorrection__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBDB60]), "initWithCharactersInString:", CFSTR("@#$%^*_([]\\|"));
  v1 = (void *)-[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::result;
  -[TIKeyboardInputManager(ResultSpecializations) terminatorsPreventingAutocorrection]::result = v0;

}

void __59__TIKeyboardInputManager_ResultSpecializations__candidates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "corrections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autocorrection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emojiList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAutocorrection"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "slotID"))
  {
    if (*(_BYTE *)(a1 + 56) && *(_BYTE *)(a1 + 57))
    {
      objc_msgSend(*(id *)(a1 + 40), "inputMode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isSiriMode");

      if (!v10)
      {
        if (!v7)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    else
    {

    }
    v20 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "defaultCandidate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v8);
  }

  if (v7)
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v7);
LABEL_9:
  if (v6)
  {
    v21 = v7;
    v22 = v5;
    v23 = v3;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v16, "candidate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "candidate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v17, "isEqualToString:", v18);

          if ((v19 & 1) == 0)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }

    v5 = v22;
    v3 = v23;
    v7 = v21;
  }

}

id __86__TIKeyboardInputManager_ResultSpecializations__autocorrectionListWithCandidateCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "recordSuggestedAutocorrectionList:", v3);
  return v3;
}

uint64_t __86__TIKeyboardInputManager_ResultSpecializations__autocorrectionListWithCandidateCount___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "candidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "candidate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)enablesProactiveQuickType
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInputTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "disablePrediction") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "autocorrectionType") != 1;

  }
  return v5;
}

- (void)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withAdditionalPredictions:(id)a4 withInput:(id)a5 async:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void (**v53)(id, _QWORD);
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  BOOL v69;
  BOOL v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  int v88;
  id v89;
  void *v90;
  _BOOL4 v91;
  void *v92;
  int v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  _QWORD aBlock[5];
  _QWORD v100[3];

  v8 = a6;
  v100[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(id, _QWORD))a7;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v14, "isScreenLocked");

  if (!(_DWORD)a4)
  {
    v91 = v8;
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "documentState");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "contextBeforeInput");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v16;
    objc_msgSend(v16, "contextAfterInput");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v17;
    if (objc_msgSend(v17, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "characterIsMember:", objc_msgSend(v17, "characterAtIndex:", objc_msgSend(v17, "length") - 1));

      v21 = v20 ^ 1;
    }
    else
    {
      v21 = 1;
    }
    if (objc_msgSend(v18, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "characterIsMember:", objc_msgSend(v18, "characterAtIndex:", 0));

      v24 = v23 ^ 1;
    }
    else
    {
      v24 = 0;
    }
    v95 = v18;
    if (((v21 | v24) & 1) != 0)
    {
      v25 = 1;
    }
    else
    {
      -[TIKeyboardInputManager inputStem](self, "inputStem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v26, "length") == 0;

    }
    -[TIKeyboardInputManager lastContinuousPathAutocorrection](self, "lastContinuousPathAutocorrection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "corrections");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "autocorrection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "candidate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager inputStem](self, "inputStem");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v30, "hasSuffix:", v31);

    v32 = v98;
    if ((objc_msgSend(v98, "usePQT2Flow") & 1) == 0
      && ((objc_msgSend(v98, "isAutoCompleteEnabled") ^ 1 | v25 | v93) & 1) == 0)
    {
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "needContactAutofill");

      if ((v34 & 1) == 0)
      {
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager trackProactiveMetrics:keyboardState:](self, "trackProactiveMetrics:keyboardState:", 0, v47);

        +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "secureCandidateRenderer");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "secureCandidateRenderTraits");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "textInputTraits");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "textContentType");
        v53 = v13;
        v54 = v12;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v97;
        objc_msgSend(v98, "generateAndRenderProactiveSuggestionsWithInput:withSecureCandidateRenderer:withRenderTraits:textContentType:async:completion:", v97, v48, v50, v55, v91, v53);

        v12 = v54;
        v13 = v53;

        v32 = v98;
LABEL_35:

        goto LABEL_36;
      }
    }
    if (objc_msgSend(v98, "isEnabled"))
    {
      if ((objc_msgSend(v98, "usePQT2Flow") & 1) != 0)
      {
LABEL_20:
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "supportedPayloadIds");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count");

        if (v41)
        {
          v42 = (void *)MEMORY[0x1E0C99E60];
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "supportedPayloadIds");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setWithArray:", v44);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "canSendCurrentLocation");

          if (v46)
          {
            objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("com.apple.messages.currentLocation"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v90 = 0;
          }
        }
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __156__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput_async_completionHandler___block_invoke_2;
        aBlock[3] = &unk_1EA101140;
        aBlock[4] = self;
        v62 = _Block_copy(aBlock);
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v63, "shiftState");

        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "responseContext");
        v65 = (void *)objc_claimAutoreleasedReturnValue();

        v89 = v11;
        v87 = v12;
        if (v65)
        {
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "responseContext");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v100[0] = v67;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = -[TIKeyboardInputManager suggestionBlocklistMatchesStrings:](self, "suggestionBlocklistMatchesStrings:", v68);

        }
        else
        {
          v69 = 0;
        }
        v70 = v91;
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v71 = objc_claimAutoreleasedReturnValue();
        +[TIAppAutofillManager sharedInstance](TIAppAutofillManager, "sharedInstance");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "secureCandidateRenderer");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "secureCandidateRenderTraits");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "stringByAppendingString:", CFSTR(" "));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "recipientIdentifier");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "clientIdentifier");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "languageWithRegion");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v93)
          v75 = -[TIKeyboardInputManager shouldInsertSpaceBeforePredictions](self, "shouldInsertSpaceBeforePredictions");
        else
          v75 = 0;
        LOBYTE(v78) = v70;
        BYTE1(v77) = v69;
        LOBYTE(v77) = v75;
        BYTE2(v77) = v88 != 2;
        v32 = v98;
        v79 = (void *)v71;
        v76 = v71;
        v12 = v87;
        objc_msgSend(v98, "generateAndRenderProactiveSuggestionsForInput:withKeyboardState:withAdditionalPredictions:withSecureCandidateRenderer:withRenderTraits:withInput:withRecipient:withApplication:withLocale:nextInputWillInsertAutospace:withIsResponseDenyListed:withShouldDisableAutoCaps:withAvailableApps:logBlock:async:completion:", v89, v76, v87, v86, v84, v83, v72, v73, v74, v77, v90, v62, v78, v13);

        v11 = v89;
        goto LABEL_34;
      }
      objc_msgSend(v11, "firstObject");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager trackProactiveMetrics:keyboardState:](self, "trackProactiveMetrics:keyboardState:", v35, v36);

      if (objc_msgSend(v11, "count"))
      {
        if (!-[TIKeyboardInputManager enablesProactiveQuickType](self, "enablesProactiveQuickType"))
        {
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_1140);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "filteredArrayUsingPredicate:", v37);
          v38 = objc_claimAutoreleasedReturnValue();

          v11 = (id)v38;
        }
        goto LABEL_20;
      }
      -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "languageWithRegion");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "textInputTraits");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "textContentType");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "userActionWithNoNewTriggers:fieldType:", v58, v61);

      v32 = v98;
      v13[2](v13, 0);
    }
LABEL_34:
    v56 = v97;
    goto LABEL_35;
  }
  v13[2](v13, 0);
LABEL_36:

}

- (id)generateAndRenderProactiveSuggestionsWithTriggers:(id)a3 withAdditionalPredictions:(id)a4 withInput:(id)a5
{
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__10337;
  v12 = __Block_byref_object_dispose__10338;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __132__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput___block_invoke;
  v7[3] = &unk_1EA1029F8;
  v7[4] = &v8;
  -[TIKeyboardInputManager generateAndRenderProactiveSuggestionsWithTriggers:withAdditionalPredictions:withInput:async:completionHandler:](self, "generateAndRenderProactiveSuggestionsWithTriggers:withAdditionalPredictions:withInput:async:completionHandler:", a3, a4, a5, 0, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __132__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __156__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput_async_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logToTypologyRecorderWithString:", v3);

}

BOOL __156__TIKeyboardInputManager_ProactiveQuickType__generateAndRenderProactiveSuggestionsWithTriggers_withAdditionalPredictions_withInput_async_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "triggerSourceType") != 0;
}

- (BOOL)doesComposeText
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "doesComposeText");

  return v3;
}

- (BOOL)supportsReversionUI
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsReversionUI");

  return v3;
}

- (BOOL)supportsLearning
{
  void *v2;
  char v3;

  -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsLearning");

  return v3;
}

- (BOOL)ignoresDeadKeys
{
  return 0;
}

- (BOOL)inHardwareKeyboardMode
{
  _BYTE *m_impl;

  m_impl = self->m_impl;
  return m_impl && m_impl[681] != 0;
}

- (void)releaseDynamicLanguageModel
{
  _QWORD *m_impl;
  void *v4;
  std::__shared_weak_count *v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unsigned int *v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  std::__shared_weak_count *v14;

  m_impl = self->m_impl;
  if (m_impl)
  {
    std::shared_ptr<KB::LanguageModel>::operator=[abi:nn180100](m_impl + 29, 0, 0);
    v4 = self->m_impl;
    v5 = (std::__shared_weak_count *)operator new(0x28uLL);
    v6 = v5;
    v5->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    v5->__shared_weak_owners_ = 0;
    v5->__vftable = (std::__shared_weak_count_vtbl *)&off_1EA1021C8;
    v5[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1EA106698;
    v8 = (unsigned int *)*((_QWORD *)v4 + 28);
    v5[1].__shared_owners_ = (uint64_t)v8;
    if (v8)
    {
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 + 1, v8));
      v4 = self->m_impl;
    }
    v13 = &v5[1].__vftable;
    v14 = v5;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
    TIInputManager::set_candidate_refinery((uint64_t)v4, (uint64_t *)&v13);
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
    -[TIKeyboardInputManager loadFavoniusTypingModel](self, "loadFavoniusTypingModel", v13, v14);
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

- (void)dynamicDictionariesRemoved:(id)a3
{
  -[TIKeyboardInputManager clearDynamicDictionary](self, "clearDynamicDictionary", a3);
  -[TIKeyboardInputManager releaseDynamicLanguageModel](self, "releaseDynamicLanguageModel");
  -[TIKeyboardInputManager releaseAndRemoveRejectionsDatabase](self, "releaseAndRemoveRejectionsDatabase");
}

+ (void)resetResponseKit
{
  id v2;

  +[TIResponseKitManager sharedTIResponseKitManager](TIResponseKitManager, "sharedTIResponseKitManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetResponseKit");

}

+ (id)keyboardUserDirectory
{
  void *v2;
  void *v3;

  TI_KB_USER_DIRECTORY();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)vulgarWordUsageDatabaseFileName
{
  void *v2;
  void *v3;

  +[TIKeyboardInputManager keyboardUserDirectory](TIKeyboardInputManager, "keyboardUserDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("VulgarWordUsage.db"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)userDictionaryWordKeyPairsFilePath
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "keyboardUserDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("UserDictionaryWordKeyPairs.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)dynamicDictionaryFilePathForInputMode:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("en_US")) & 1) != 0)
    {
      v5 = CFSTR("dynamic-text.dat");
    }
    else
    {
      TIInputModeGetLanguageWithRegion();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingString:", CFSTR("-dynamic-text.dat"));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(a1, "keyboardUserDirectory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)removeDynamicDictionaryForInputMode:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "dynamicDictionaryFilePathForInputMode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    if (objc_msgSend(v4, "fileExistsAtPath:", v3))
    {
      v5 = 0;
      objc_msgSend(v4, "removeItemAtPath:error:", v3, &v5);
    }

  }
}

+ (void)removeAllDynamicDictionaries
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0DBDBA8], "sharedInputModeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedInputModeIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        TICanonicalInputModeName();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)TIInputManagerClassForInputMode();
        if (v9)
        {
          objc_msgSend(v9, "removeDynamicDictionaryForInputMode:", v8);
        }
        else
        {
          if (TICanLogMessageAtLevel_onceToken != -1)
            dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
          TIOSLogFacility();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s No input manager class for input mode: %@"), "+[TIKeyboardInputManager(DynamicDictionarySpecializations) removeAllDynamicDictionaries]", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v17 = v11;
            _os_log_debug_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v5);
  }

}

+ (void)performVulgarWordUsageDatabaseMaintenance
{
  const void *v2[5];

  TI::VulgarWordUsageDatabaseWrapper::VulgarWordUsageDatabaseWrapper((TI::VulgarWordUsageDatabaseWrapper *)v2);
  LXVulgarWordUsageDatabasePerformMaintenance();
  TI::VulgarWordUsageDatabaseWrapper::~VulgarWordUsageDatabaseWrapper(v2);
}

+ (void)clearVulgarWordUsageDatabase
{
  const void *v2[5];

  TI::VulgarWordUsageDatabaseWrapper::VulgarWordUsageDatabaseWrapper((TI::VulgarWordUsageDatabaseWrapper *)v2);
  LXVulgarWordUsageDatabaseReset();
  TI::VulgarWordUsageDatabaseWrapper::~VulgarWordUsageDatabaseWrapper(v2);
}

+ (id)recentsFilePathForIdentifier:(id)a3
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3)
  {
    if ((v4 & 1) == 0
    {
      TI_KB_USER_DIRECTORY();
      +[TIKeyboardInputManager(DynamicDictionarySpecializations) recentsFilePathForIdentifier:]::dir = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend((id)+[TIKeyboardInputManager(DynamicDictionarySpecializations) recentsFilePathForIdentifier:]::dir, "stringByAppendingPathComponent:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("recents"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)clearRecentsFileForIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3620];
    v5 = a3;
    objc_msgSend(v4, "defaultManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "recentsFilePathForIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeItemAtPath:error:", v6, 0);
  }
}

- (void)rejectionsDatabase
{
  void *v3;
  char v4;
  void *result;
  unique_ptr<TI::RejectionsDatabase, std::default_delete<TI::RejectionsDatabase>> *p_m_rejectionsDatabase;
  TI::RejectionsDatabase *v7;
  TI::RejectionsDatabase *value;
  const std::__fs::filesystem::path *p_p;
  std::string __p;

  if (!TIAdaptationAutocorrectionRejectionV2Enabled())
    return 0;
  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "negativeLearningDisabled");

  if ((v4 & 1) != 0)
    return 0;
  p_m_rejectionsDatabase = &self->m_rejectionsDatabase;
  result = p_m_rejectionsDatabase->__ptr_.__value_;
  if (!p_m_rejectionsDatabase->__ptr_.__value_)
  {
    v7 = (TI::RejectionsDatabase *)operator new();
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    std::unique_ptr<TI::RejectionsDatabase>::reset[abi:nn180100]((TI::RejectionsDatabase **)p_m_rejectionsDatabase, v7);
    value = (TI::RejectionsDatabase *)p_m_rejectionsDatabase->__ptr_.__value_;
    TI::RejectionsDatabase::keyboard_db_file(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = (const std::__fs::filesystem::path *)&__p;
    else
      p_p = (const std::__fs::filesystem::path *)__p.__r_.__value_.__r.__words[0];
    TI::RejectionsDatabase::initialize(value, p_p, 2, CFSTR("rejections_database_migration_schema"));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    return p_m_rejectionsDatabase->__ptr_.__value_;
  }
  return result;
}

- (unint64_t)shouldSuppressLearning
{
  void *v3;
  char v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "secureTextEntry");

  if ((v4 & 1) != 0)
    return 0;
  if (!-[TIKeyboardInputManager isWordLearningEnabled](self, "isWordLearningEnabled"))
    return 1;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textInputTraits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "autocorrectionType");

  if (v8 == 1)
    return 2;
  -[TIKeyboardInputManager currentState](self, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "learningFlagsMaskForLastAcceptedCandidate");

  if ((v10 & 1) != 0)
    return 3;
  else
    return 4;
}

- (BOOL)shouldSuppressLanguageSelectionEvidence
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "autocorrectionType") == 1;

  return v4;
}

- (BOOL)shouldLearnWord:(id)a3
{
  KB *v4;
  unint64_t v5;
  const KB::String *v6;
  BOOL v7;
  _BYTE v9[8];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (KB *)a3;
  if (!-[TIKeyboardInputManager supportsLearning](self, "supportsLearning"))
  {
    KB::utf8_string(v4, (uint64_t)v9);
    goto LABEL_5;
  }
  v5 = -[TIKeyboardInputManager shouldSuppressLearning](self, "shouldSuppressLearning");
  KB::utf8_string(v4, (uint64_t)v9);
  if (v5 != 4)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = KB::count_letters_if_word((KB *)v9, v6) != 0;
LABEL_6:
  if (v10 && v9[6] == 1)
    free(v10);

  return v7;
}

- (void)incrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6 saveToDifferentialPrivacy:(int)a7
{
  -[TIKeyboardInputManager incrementLanguageModelCount:tokenID:contextTokens:saveToDifferentialPrivacy:](self, "incrementLanguageModelCount:tokenID:contextTokens:saveToDifferentialPrivacy:", a3, a5, a6, *(_QWORD *)&a7);
}

- (void)incrementLanguageModelCount:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5 saveToDifferentialPrivacy:(int)a6
{
  uint64_t v6;
  KB *v10;
  TIContextTokens *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *m_impl;
  __int128 *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  KB *v23;
  uint64_t v24;
  KB::DictionaryContainer *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  _OWORD *v35;
  __int128 v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  __int128 v46;
  int64x2_t v47;
  unint64_t v48;
  std::string *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  id v54;
  char *v55;
  id v56;
  TIKeyboardInputManager *v57;
  uint64_t v58;
  std::string v59;
  void *__p[2];
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  int64x2_t v66;
  std::string *v67;
  TITokenID v68;
  _BYTE v69[128];
  _WORD v70[3];
  char v71;
  void *v72;
  _BYTE v73[224];
  _QWORD v74[2];
  std::__split_buffer<std::string> v75;
  uint64_t v76;

  v6 = *(_QWORD *)&a6;
  v76 = *MEMORY[0x1E0C80C00];
  v68 = a4;
  v10 = (KB *)a3;
  v11 = (TIContextTokens *)a5;
  -[TIKeyboardInputManager getTestingStateObject](self, "getTestingStateObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v6 && v12)
  {
    v74[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v74[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager getTestingStateObject](self, "getTestingStateObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, CFSTR("incrementLanguageModelCount"));

  }
  m_impl = self->m_impl;
  if (m_impl && m_impl[29])
  {
    v17 = lmContextOrEmpty(v11);
    if (!-[TIKeyboardInputManager shouldSuppressLanguageSelectionEvidence](self, "shouldSuppressLanguageSelectionEvidence"))
    {
      -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addTokenString:tokenID:context:contextLength:", v10, a4);

    }
    v19 = -[TIKeyboardInputManager shouldSuppressLearning](self, "shouldSuppressLearning");
    if (v19 != 4)
    {
      if (v19 - 3 > 1)
        goto LABEL_63;
LABEL_22:
      v25 = (KB::DictionaryContainer *)*((_QWORD *)self->m_impl + 28);
      KB::utf8_string(v10, (uint64_t)&v75);
      KB::DictionaryContainer::closest_static_match(v25, (const KB::String *)&v75, (KB::Word *)v70);
      if (v75.__begin_ && BYTE6(v75.__first_) == 1)
        free(v75.__begin_);
      if (simular_swear_word_policy_v2_setting)
      {
        if ((objc_msgSend((id)simular_swear_word_policy_v2_setting, "BOOLValue") & 1) == 0)
          goto LABEL_62;
      }
      else if (!_os_feature_enabled_impl())
      {
LABEL_62:
        KB::Word::~Word((KB::Word *)v70);
        goto LABEL_63;
      }
      if ((v73[91] & 8) != 0
        && (*(unsigned int (**)(_QWORD, _QWORD))(**((_QWORD **)self->m_impl + 29) + 376))(*((_QWORD *)self->m_impl + 29), v68.lexicon_id))
      {
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "clientIdentifier");
        v56 = (id)objc_claimAutoreleasedReturnValue();

        v66 = 0uLL;
        v67 = 0;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v57 = self;
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "inputContextHistory");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "recipientIdentifiers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v63 != v33)
                objc_enumerationMutation(v30);
              std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i)), "UTF8String"));
              v35 = (_OWORD *)v66.i64[1];
              if (v66.i64[1] >= (unint64_t)v67)
              {
                v37 = 0xAAAAAAAAAAAAAAABLL * ((v66.i64[1] - v66.i64[0]) >> 3);
                v38 = v37 + 1;
                if (v37 + 1 > 0xAAAAAAAAAAAAAAALL)
                  abort();
                if (0x5555555555555556 * (((uint64_t)v67 - v66.i64[0]) >> 3) > v38)
                  v38 = 0x5555555555555556 * (((uint64_t)v67 - v66.i64[0]) >> 3);
                if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v67 - v66.i64[0]) >> 3) >= 0x555555555555555)
                  v39 = 0xAAAAAAAAAAAAAAALL;
                else
                  v39 = v38;
                v75.__end_cap_.__value_ = (std::allocator<std::string> *)&v67;
                if (v39)
                  v39 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v39);
                else
                  v40 = 0;
                v41 = v39 + 24 * v37;
                v42 = *(_OWORD *)__p;
                *(_QWORD *)(v41 + 16) = v61;
                *(_OWORD *)v41 = v42;
                __p[1] = 0;
                v61 = 0;
                __p[0] = 0;
                v43 = v66.i64[1];
                v44 = v66.i64[0];
                if (v66.i64[1] == v66.i64[0])
                {
                  v47 = vdupq_n_s64(v66.u64[1]);
                  v45 = v39 + 24 * v37;
                }
                else
                {
                  v45 = v39 + 24 * v37;
                  do
                  {
                    v46 = *(_OWORD *)(v43 - 24);
                    *(_QWORD *)(v45 - 8) = *(_QWORD *)(v43 - 8);
                    *(_OWORD *)(v45 - 24) = v46;
                    v45 -= 24;
                    *(_QWORD *)(v43 - 16) = 0;
                    *(_QWORD *)(v43 - 8) = 0;
                    *(_QWORD *)(v43 - 24) = 0;
                    v43 -= 24;
                  }
                  while (v43 != v44);
                  v47 = v66;
                }
                v48 = v41 + 24;
                v66.i64[0] = v45;
                v66.i64[1] = v41 + 24;
                *(int64x2_t *)&v75.__begin_ = v47;
                v49 = v67;
                v67 = (std::string *)(v39 + 24 * v40);
                v75.__end_cap_.__value_ = v49;
                v75.__first_ = (std::__split_buffer<std::string>::pointer)v47.i64[0];
                std::__split_buffer<std::string>::~__split_buffer(&v75);
                v66.i64[1] = v48;
                if (SHIBYTE(v61) < 0)
                  operator delete(__p[0]);
              }
              else
              {
                v36 = *(_OWORD *)__p;
                *(_QWORD *)(v66.i64[1] + 16) = v61;
                *v35 = v36;
                v66.i64[1] = (uint64_t)v35 + 24;
              }
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
          }
          while (v32);
        }

        v50 = (char *)TILocaleIdentifierForLexiconID(v68.lexicon_id);
        v51 = (uint64_t)v57->m_impl + 592;
        v52 = (char *)v72;
        if (!v72)
          v52 = v73;
        if (v70[0])
          v53 = v52;
        else
          v53 = "";
        v54 = objc_retainAutorelease(v56);
        v55 = (char *)objc_msgSend(v54, "UTF8String");
        memset(&v59, 0, sizeof(v59));
        std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v59, (__int128 *)v66.i64[0], (__int128 *)v66.i64[1], 0xAAAAAAAAAAAAAAABLL * ((v66.i64[1] - v66.i64[0]) >> 3));
        TI::VulgarWordUsageDatabaseWrapper::increment_usage_count(v51, v53, v55, (uint64_t *)&v59, v50);
        v75.__first_ = &v59;
        std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v75);
        v75.__first_ = (std::__split_buffer<std::string>::pointer)&v66;
        std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v75);

      }
      goto LABEL_62;
    }
    if ((_DWORD)v6)
    {
      if ((v6 & 2) == 0)
      {
LABEL_11:
        (*(void (**)(_QWORD, KB *, TITokenID, uint64_t))(**((_QWORD **)self->m_impl + 29) + 344))(*((_QWORD *)self->m_impl + 29), v10, a4, v6);
        goto LABEL_18;
      }
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "autocorrectionEnabled") & 1) != 0)
      {
        -[TIKeyboardInputManager keyboardState](self, "keyboardState");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "textInputTraits");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v22, "autocorrectionType");

        if (v58 != 1)
          goto LABEL_11;
      }
      else
      {

      }
    }
LABEL_18:
    -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v10);
    v23 = (KB *)objc_claimAutoreleasedReturnValue();
    v24 = *((_QWORD *)self->m_impl + 29);
    KB::utf8_string(v23, (uint64_t)v70);
    (*(void (**)(uint64_t, _WORD *, TITokenID *, __int128 *))(*(_QWORD *)v24 + 320))(v24, v70, &v68, v17);
    if (v72 && v71 == 1)
      free(v72);

    goto LABEL_22;
  }
LABEL_63:

}

- (void)decrementLanguageModelCount:(id)a3 latinInputString:(id)a4 tokenID:(TITokenID)a5 contextTokens:(id)a6
{
  -[TIKeyboardInputManager decrementLanguageModelCount:tokenID:contextTokens:](self, "decrementLanguageModelCount:tokenID:contextTokens:", a3, a5, a6);
}

- (void)decrementLanguageModelCount:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5
{
  KB *v8;
  TIContextTokens *v9;
  TIContextTokens *v10;
  _QWORD *m_impl;
  __int128 *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  KB::DictionaryContainer *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  _OWORD *v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  __int128 v37;
  int64x2_t v38;
  unint64_t v39;
  std::string *v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  id v45;
  char *v46;
  _QWORD *v47;
  uint64_t v48;
  id v49;
  TIKeyboardInputManager *v50;
  KB *v51;
  std::string v52;
  void *__p[2];
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  int64x2_t v59;
  std::string *v60;
  TITokenID v61;
  _BYTE v62[128];
  _WORD v63[3];
  char v64;
  void *v65;
  _BYTE v66[224];
  std::__split_buffer<std::string> v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v61 = a4;
  v8 = (KB *)a3;
  v9 = (TIContextTokens *)a5;
  v10 = v9;
  m_impl = self->m_impl;
  if (!m_impl || !m_impl[29])
    goto LABEL_56;
  v12 = lmContextOrEmpty(v9);
  if (!-[TIKeyboardInputManager shouldSuppressLanguageSelectionEvidence](self, "shouldSuppressLanguageSelectionEvidence"))
  {
    -[TIKeyboardInputManager languageSelectionController](self, "languageSelectionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeTokenString:tokenID:context:contextLength:", v8, a4);

  }
  v14 = -[TIKeyboardInputManager shouldSuppressLearning](self, "shouldSuppressLearning");
  if (v14 == 4)
  {
    v15 = *((_QWORD *)self->m_impl + 29);
    KB::utf8_string(v8, (uint64_t)v63);
    (*(void (**)(uint64_t, _WORD *, TITokenID *, __int128 *))(*(_QWORD *)v15 + 328))(v15, v63, &v61, v12);
    if (v65 && v64 == 1)
      free(v65);
LABEL_10:
    v16 = (KB::DictionaryContainer *)*((_QWORD *)self->m_impl + 28);
    KB::utf8_string(v8, (uint64_t)&v67);
    KB::DictionaryContainer::closest_static_match(v16, (const KB::String *)&v67, (KB::Word *)v63);
    if (v67.__begin_ && BYTE6(v67.__first_) == 1)
      free(v67.__begin_);
    if (simular_swear_word_policy_v2_setting)
    {
      if ((objc_msgSend((id)simular_swear_word_policy_v2_setting, "BOOLValue") & 1) == 0)
        goto LABEL_50;
    }
    else if (!_os_feature_enabled_impl())
    {
LABEL_50:
      KB::Word::~Word((KB::Word *)v63);
      goto LABEL_51;
    }
    if ((v66[91] & 8) != 0
      && (*(unsigned int (**)(_QWORD, _QWORD))(**((_QWORD **)self->m_impl + 29) + 376))(*((_QWORD *)self->m_impl + 29), v61.lexicon_id))
    {
      v51 = v8;
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clientIdentifier");
      v49 = (id)objc_claimAutoreleasedReturnValue();

      v59 = 0uLL;
      v60 = 0;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v50 = self;
      -[TIKeyboardInputManager keyboardState](self, "keyboardState");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "inputContextHistory");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recipientIdentifiers");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allObjects");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v56 != v24)
              objc_enumerationMutation(v21);
            std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i)), "UTF8String"));
            v26 = (_OWORD *)v59.i64[1];
            if (v59.i64[1] >= (unint64_t)v60)
            {
              v28 = 0xAAAAAAAAAAAAAAABLL * ((v59.i64[1] - v59.i64[0]) >> 3);
              v29 = v28 + 1;
              if (v28 + 1 > 0xAAAAAAAAAAAAAAALL)
                abort();
              if (0x5555555555555556 * (((uint64_t)v60 - v59.i64[0]) >> 3) > v29)
                v29 = 0x5555555555555556 * (((uint64_t)v60 - v59.i64[0]) >> 3);
              if (0xAAAAAAAAAAAAAAABLL * (((uint64_t)v60 - v59.i64[0]) >> 3) >= 0x555555555555555)
                v30 = 0xAAAAAAAAAAAAAAALL;
              else
                v30 = v29;
              v67.__end_cap_.__value_ = (std::allocator<std::string> *)&v60;
              if (v30)
                v30 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<std::string>>(v30);
              else
                v31 = 0;
              v32 = v30 + 24 * v28;
              v33 = *(_OWORD *)__p;
              *(_QWORD *)(v32 + 16) = v54;
              *(_OWORD *)v32 = v33;
              __p[1] = 0;
              v54 = 0;
              __p[0] = 0;
              v34 = v59.i64[1];
              v35 = v59.i64[0];
              if (v59.i64[1] == v59.i64[0])
              {
                v38 = vdupq_n_s64(v59.u64[1]);
                v36 = v30 + 24 * v28;
              }
              else
              {
                v36 = v30 + 24 * v28;
                do
                {
                  v37 = *(_OWORD *)(v34 - 24);
                  *(_QWORD *)(v36 - 8) = *(_QWORD *)(v34 - 8);
                  *(_OWORD *)(v36 - 24) = v37;
                  v36 -= 24;
                  *(_QWORD *)(v34 - 16) = 0;
                  *(_QWORD *)(v34 - 8) = 0;
                  *(_QWORD *)(v34 - 24) = 0;
                  v34 -= 24;
                }
                while (v34 != v35);
                v38 = v59;
              }
              v39 = v32 + 24;
              v59.i64[0] = v36;
              v59.i64[1] = v32 + 24;
              *(int64x2_t *)&v67.__begin_ = v38;
              v40 = v60;
              v60 = (std::string *)(v30 + 24 * v31);
              v67.__end_cap_.__value_ = v40;
              v67.__first_ = (std::__split_buffer<std::string>::pointer)v38.i64[0];
              std::__split_buffer<std::string>::~__split_buffer(&v67);
              v59.i64[1] = v39;
              if (SHIBYTE(v54) < 0)
                operator delete(__p[0]);
            }
            else
            {
              v27 = *(_OWORD *)__p;
              *(_QWORD *)(v59.i64[1] + 16) = v54;
              *v26 = v27;
              v59.i64[1] = (uint64_t)v26 + 24;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
        }
        while (v23);
      }

      v41 = (char *)TILocaleIdentifierForLexiconID(v61.lexicon_id);
      self = v50;
      v42 = (uint64_t)v50->m_impl + 592;
      v43 = (char *)v65;
      if (!v65)
        v43 = v66;
      if (v63[0])
        v44 = v43;
      else
        v44 = "";
      v45 = objc_retainAutorelease(v49);
      v46 = (char *)objc_msgSend(v45, "UTF8String");
      memset(&v52, 0, sizeof(v52));
      std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v52, (__int128 *)v59.i64[0], (__int128 *)v59.i64[1], 0xAAAAAAAAAAAAAAABLL * ((v59.i64[1] - v59.i64[0]) >> 3));
      TI::VulgarWordUsageDatabaseWrapper::decrement_usage_count(v42, v44, v46, (uint64_t *)&v52, v41);
      v67.__first_ = &v52;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v67);
      v67.__first_ = (std::__split_buffer<std::string>::pointer)&v59;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v67);

      v8 = v51;
    }
    goto LABEL_50;
  }
  if (v14 - 3 <= 1)
    goto LABEL_10;
LABEL_51:
  v47 = self->m_impl;
  KB::utf8_string(v8, (uint64_t)v63);
  v48 = v47[23];
  if (v48)
    (*(void (**)(uint64_t, _WORD *))(*(_QWORD *)v48 + 112))(v48, v63);
  if (v65 && v64 == 1)
    free(v65);
LABEL_56:

}

- (BOOL)directlyBlockedByNegativeLearning:(id)a3 correction:(id)a4 ignoreSoft:(BOOL)a5 retrocorrectionComponent:(BOOL)a6
{
  _BOOL4 v6;
  NSString *v10;
  NSString *v11;
  sqlite3 **v12;
  sqlite3 **v13;
  void *v14;
  double v15;
  double v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  BOOL v20;
  NSString *v21;
  NSString *v22;
  int should_block;
  NSString *v24;
  const char *v25;
  NSString *v26;
  double v27;
  int v28;
  void *v29;
  void *v31;
  int v32;
  char v33;
  double v34;
  char v35;
  void *__p[2];
  char v37;

  v6 = a6;
  v10 = (NSString *)a3;
  v11 = (NSString *)a4;
  v12 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
  if (v12)
  {
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v16 = v15;

    v17 = CFSTR("autocorrection");
    if (v6)
      v17 = CFSTR("retrocorrection component");
    v18 = v17;
    if (!a5)
    {
      if (-[NSString length](v10, "length") == 1 && -[NSString length](v11, "length") == 1)
      {
        v19 = 1;
      }
      else if (onlyChangesCaseDiacriticsPunctuation(v10, v11) || v6)
      {
        v19 = 3;
      }
      else
      {
        v19 = 20;
      }
      v21 = objc_retainAutorelease(v10);
      std::string::basic_string[abi:nn180100]<0>(&v31, (char *)-[NSString UTF8String](v21, "UTF8String"));
      v22 = objc_retainAutorelease(v11);
      std::string::basic_string[abi:nn180100]<0>(__p, (char *)-[NSString UTF8String](v22, "UTF8String"));
      should_block = TI::RejectionsDatabase::soft_should_block((uint64_t)v13, (unsigned __int8 *)&v31, (unsigned __int8 **)__p, v19, v16);
      if (v37 < 0)
        operator delete(__p[0]);
      if (v33 < 0)
      {
        operator delete(v31);
        if (should_block)
          goto LABEL_16;
      }
      else if (should_block)
      {
LABEL_16:
        goto LABEL_23;
      }
    }
    v24 = objc_retainAutorelease(v10);
    v25 = -[NSString UTF8String](v24, "UTF8String");
    v26 = objc_retainAutorelease(v11);
    TI::RejectionsDatabase::get_rejections(v13, v25, -[NSString UTF8String](v26, "UTF8String"), 0, (uint64_t)&v31);
    if (!v35
      || (v27 = (v16 - v34) / 60.0 / 60.0 / 24.0, v27 > 180.0)
      || (v28 = v32) == 0
      || log(v27) / 1.38629436 >= (double)(v28 - 1))
    {
      v20 = 0;
      goto LABEL_25;
    }
LABEL_23:
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v29);

    v20 = 1;
LABEL_25:

    goto LABEL_26;
  }
  v20 = 0;
LABEL_26:

  return v20;
}

- (BOOL)blockedByNegativeLearning:(id)a3 correction:(id)a4 ignoreSoft:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  sqlite3 **v10;
  sqlite3 **v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  unint64_t v34;
  void *v36;
  _BOOL4 v37;
  void *__p[2];
  char v39;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
  if (!v10 || (v11 = v10, (objc_msgSend(v8, "isEqualToString:", v9) & 1) != 0))
  {
    v12 = 0;
    v13 = v9;
    v14 = v8;
    goto LABEL_22;
  }
  -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TIKeyboardInputManager directlyBlockedByNegativeLearning:correction:ignoreSoft:retrocorrectionComponent:](self, "directlyBlockedByNegativeLearning:correction:ignoreSoft:retrocorrectionComponent:", v14, v13, v5, 0))
  {
LABEL_5:
    v12 = 1;
    goto LABEL_22;
  }
  if (objc_msgSend(v14, "rangeOfString:", CFSTR(" ")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v37 = v5;
    objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(" "));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR(" "));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "count");
    if (v17 == objc_msgSend(v16, "count"))
    {
      if (!objc_msgSend(v15, "count"))
      {
LABEL_13:
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v25);

        goto LABEL_5;
      }
      v18 = 0;
      while (1)
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if ((v21 & 1) == 0)
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[TIKeyboardInputManager directlyBlockedByNegativeLearning:correction:ignoreSoft:retrocorrectionComponent:](self, "directlyBlockedByNegativeLearning:correction:ignoreSoft:retrocorrectionComponent:", v22, v23, v37, 1);

          if (!v24)
            break;
        }
        if (objc_msgSend(v15, "count") <= (unint64_t)++v18)
          goto LABEL_13;
      }
    }

    LODWORD(v5) = v37;
  }
  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "locale");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseStringWithLocale:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "locale");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseStringWithLocale:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v31, "hasPrefix:", v28) || (objc_msgSend(v31, "isEqualToString:", v28) & 1) != 0)
    goto LABEL_20;
  v32 = objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4);
  v33 = objc_retainAutorelease(v13);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v33, "UTF8String"));
  v34 = TIInlineCompletionsNegativeLearning::wordBlockedByNegativeLearning(v11, v32, (uint64_t)__p, v5);
  if (v39 < 0)
    operator delete(__p[0]);
  if (HIDWORD(v34))
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v36);

    v12 = 1;
  }
  else
  {
LABEL_20:
    v12 = 0;
  }

LABEL_22:
  return v12;
}

- (void)softLearningRegisterAccepted:(id)a3 typed:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  std::string __p;
  std::string v17;

  v6 = a3;
  v7 = a4;
  v8 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
  if (v8)
  {
    v9 = (uint64_t)v8;
    -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSince1970");
    v14 = v13;

    v7 = objc_retainAutorelease(v11);
    std::string::basic_string[abi:nn180100]<0>(&v17, (char *)objc_msgSend(v7, "UTF8String"));
    v6 = objc_retainAutorelease(v10);
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)objc_msgSend(v6, "UTF8String"));
    TI::RejectionsDatabase::soft_add_accepted(v9, &v17, &__p, v14);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v17.__r_.__value_.__l.__data_);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[NegativeLearning] [SoftLearning] recording accepted word %@ (typed %@)\n"), v6, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v15);

  }
}

- (void)softLearningRegisterDeleted:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  std::string __p;

  v4 = a3;
  v5 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
  if (v5)
  {
    v6 = (uint64_t)v5;
    -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSince1970");
    v10 = v9;

    v4 = objc_retainAutorelease(v7);
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)objc_msgSend(v4, "UTF8String"));
    TI::RejectionsDatabase::soft_add_deleted(v6, &__p, v10);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[NegativeLearning] [SoftLearning] recording deleted word %@\n"), v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v11);

  }
}

- (void)registerNegativeEvidence:(id)a3 tokenID:(TITokenID)a4 contextTokens:(id)a5 intended:(id)a6 intendedTokenID:(TITokenID)a7 hint:(int)a8
{
  uint64_t v8;
  id v12;
  TIContextTokens *v13;
  id v14;
  id v15;
  __int128 *v16;
  sqlite3 **v17;
  sqlite3 **v18;
  void *v19;
  void *v20;
  _QWORD *m_impl;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  sqlite3 *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *__p[2];
  char v32;
  void *v33;
  char v34;
  TITokenID v35;
  TITokenID v36;
  std::string v37;
  uint64_t v38;

  v8 = *(_QWORD *)&a8;
  v38 = *MEMORY[0x1E0C80C00];
  v35 = a7;
  v36 = a4;
  v12 = a3;
  v13 = (TIContextTokens *)a5;
  v14 = a6;
  v15 = v14;
  if (v12 && v14 && (objc_msgSend(v12, "isEqualToString:", v14) & 1) == 0)
  {
    if (TIAdaptationAutocorrectionRejectionV2Enabled())
      -[TIKeyboardInputManager setRejectedAutocorrection:forInput:](self, "setRejectedAutocorrection:forInput:", v12, v15);
    v16 = lmContextOrEmpty(v13);
    if (-[TIKeyboardInputManager shouldSuppressLearning](self, "shouldSuppressLearning") == 4)
    {
      if ((TIAdaptationAutocorrectionRejectionV2Enabled() & 1) != 0)
      {
        v17 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
        if (v17)
        {
          v18 = v17;
          -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (-[TIKeyboardInputManager blockedByNegativeLearning:correction:ignoreSoft:](self, "blockedByNegativeLearning:correction:ignoreSoft:", v20, v19, 1))
          {
            v15 = v20;
            v12 = v19;
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v23);

            objc_msgSend(MEMORY[0x1E0C99D68], "now");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "timeIntervalSince1970");
            v26 = v25;

            v15 = objc_retainAutorelease(v20);
            v27 = (sqlite3 *)objc_msgSend(v15, "UTF8String");
            v12 = objc_retainAutorelease(v19);
            TI::RejectionsDatabase::insert_rejection(v18, v27, (const char *)objc_msgSend(v12, "UTF8String"), 1, 0, v26);
            if (objc_msgSend(v12, "hasPrefix:", v15))
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v28);

              v29 = objc_retainAutorelease(v12);
              std::string::basic_string[abi:nn180100]<0>(&v37, (char *)objc_msgSend(v29, "UTF8String"));
              v12 = objc_retainAutorelease(v29);
              std::string::basic_string[abi:nn180100]<0>(&v33, (char *)objc_msgSend(v12, "UTF8String"));
              v15 = objc_retainAutorelease(v15);
              std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v15, "UTF8String"));
              TIInlineCompletionsNegativeLearning::registerLearning(v18, &v37, v30, (std::string::size_type)__p, 1);
              if (v32 < 0)
                operator delete(__p[0]);
              if (v34 < 0)
                operator delete(v33);
              if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v37.__r_.__value_.__l.__data_);
            }
          }
        }
      }
      else
      {
        m_impl = self->m_impl;
        if (m_impl)
        {
          v22 = m_impl[29];
          if (v22)
          {
            KB::utf8_string((KB *)v12, (uint64_t)&v37);
            (*(void (**)(uint64_t, std::string *, TITokenID *, __int128 *, TITokenID *, uint64_t))(*(_QWORD *)v22 + 336))(v22, &v37, &v36, v16, &v35, v8);
            if (v37.__r_.__value_.__l.__size_)
            {
              if (v37.__r_.__value_.__s.__data_[6] == 1)
                free((void *)v37.__r_.__value_.__l.__size_);
            }
          }
        }
      }
    }
  }

}

- (void)registerRevisionFrom:(id)a3 to:(id)a4 contextTokens:(id)a5
{
  id v8;
  id v9;
  id v10;
  sqlite3 **v11;
  sqlite3 **v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && v9)
  {
    if ((objc_msgSend(v9, "isEqualToString:", v8) & 1) == 0)
    {
      v11 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
      if (v11)
      {
        v12 = v11;
        -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_retainAutorelease(v13);
        v15 = (const char *)objc_msgSend(v8, "UTF8String");
        v9 = objc_retainAutorelease(v14);
        TI::RejectionsDatabase::insert_acceptance(v12, v15, (const char *)objc_msgSend(v9, "UTF8String"), 1, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v16);

      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[TIKeyboardInputManager(Learning) registerRevisionFrom:to:contextTokens:]";
    _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  registerRevisionFrom called with nil parameter", buf, 0xCu);
  }

}

- (void)addItemToConversationHistoryWithText:(id)a3 timestamp:(id)a4 senderID:(id)a5 recipientIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD *m_impl;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  const void *v21;
  _QWORD *v22;
  std::__shared_weak_count *v23;
  uint64_t v24;
  unint64_t *p_shared_weak_owners;
  unint64_t v26;
  unsigned int *v27;
  unsigned int v28;
  KB *v29;
  vector<RecentMessage, std::allocator<RecentMessage>> *p_conversation_history;
  RecentMessage *end;
  RecentMessage *value;
  uint64_t v33;
  uint64_t v34;
  RecentMessage *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  RecentMessage *v44;
  RecentMessage *begin;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  RecentMessage *v50;
  RecentMessage *v51;
  uint64_t v52;
  void *v53;
  unint64_t *v54;
  unint64_t v55;
  id v56;
  id v57;
  id v58;
  TIInputContextHistory *synchronizedInputContextHistory;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  vector<RecentMessage, std::allocator<RecentMessage>> *v71;
  RecentMessage *v72;
  void *v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  RecentMessage *v77;
  void *v78;
  KB *v79;
  const void *v80;
  id v81;
  int v82;
  void *v83;
  std::__shared_weak_count *v84;
  _QWORD v85[4];
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _QWORD *v91;
  uint64_t v92;
  std::__shared_weak_count *v93;
  const void *v94;
  _QWORD v95[6];
  unsigned int *v96;
  _BYTE v97[8];
  void *v98;
  uint64_t v99;
  int v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  m_impl = self->m_impl;
  if (!m_impl)
    goto LABEL_66;
  if (!m_impl[29])
    goto LABEL_66;
  v15 = m_impl[28];
  if (!v15)
    goto LABEL_66;
  if (**(_QWORD **)(v15 + 8) == *(_QWORD *)(*(_QWORD *)(v15 + 8) + 8))
    goto LABEL_66;
  v16 = objc_msgSend(v10, "length");
  if (v16 > *MEMORY[0x1E0DBDFB0])
    goto LABEL_66;
  -[TIInputContextHistory senderIdentifiers](self->_synchronizedInputContextHistory, "senderIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  if (v12)
    v19 = v18 == 0;
  else
    v19 = 1;
  v20 = !v19;
  v21 = v12;
  if (!v19)
  {
    if (!objc_msgSend(v17, "containsObject:", v12))
    {
      v20 = 0;
      v21 = v12;
      goto LABEL_18;
    }
    v21 = (const void *)*MEMORY[0x1E0D43298];
  }
  if (!v21)
  {
    v82 = v20;
    v80 = 0;
    goto LABEL_19;
  }
LABEL_18:
  v82 = v20;
  v80 = v21;
  CFRetain(v21);
LABEL_19:
  v22 = self->m_impl;
  v24 = v22[29];
  v23 = (std::__shared_weak_count *)v22[30];
  if (v23)
  {
    p_shared_weak_owners = (unint64_t *)&v23->__shared_weak_owners_;
    do
      v26 = __ldxr(p_shared_weak_owners);
    while (__stxr(v26 + 1, p_shared_weak_owners));
    v22 = self->m_impl;
  }
  v95[0] = 0;
  v95[1] = v95;
  v95[2] = 0x3812000000;
  v95[3] = __Block_byref_object_copy__16096;
  v95[4] = __Block_byref_object_dispose__16097;
  v27 = (unsigned int *)v22[28];
  v95[5] = "";
  v96 = v27;
  if (v27)
  {
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 + 1, v27));
  }
  objc_msgSend(v10, "_stringWithLongestWhitespaceDelimitedSuffixOfMaxLength:", 200);
  v29 = (KB *)objc_claimAutoreleasedReturnValue();
  p_conversation_history = &self->conversation_history;
  KB::utf8_string(v29, (uint64_t)v97);
  v99 = 0;
  v100 = 0;
  end = self->conversation_history.__end_;
  value = self->conversation_history.__end_cap_.__value_;
  v84 = v23;
  v79 = v29;
  if (end >= value)
  {
    v36 = 0xAAAAAAAAAAAAAAABLL * ((end - p_conversation_history->__begin_) >> 4);
    if (v36 + 1 > 0x555555555555555)
      abort();
    v74 = v24;
    v37 = 0xAAAAAAAAAAAAAAABLL * ((value - p_conversation_history->__begin_) >> 4);
    v38 = 2 * v37;
    if (2 * v37 <= v36 + 1)
      v38 = v36 + 1;
    if (v37 >= 0x2AAAAAAAAAAAAAALL)
      v39 = 0x555555555555555;
    else
      v39 = v38;
    if (v39 > 0x555555555555555)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v40 = 3 * v39;
    v41 = (char *)operator new(48 * v39);
    v42 = (uint64_t)&v41[48 * v36];
    *(_DWORD *)v42 = 0x100000;
    *(_WORD *)(v42 + 4) = 0;
    v72 = (RecentMessage *)&v41[16 * v40];
    *(_BYTE *)(v42 + 6) = 0;
    *(_QWORD *)(v42 + 8) = 0;
    KB::String::operator=(v42, (KB::String *)v97);
    v43 = v99;
    v99 = 0;
    *(_QWORD *)(v42 + 32) = v43;
    *(_DWORD *)(v42 + 40) = v100;
    v35 = (RecentMessage *)(v42 + 48);
    begin = p_conversation_history->__begin_;
    v44 = self->conversation_history.__end_;
    v77 = (RecentMessage *)(v42 + 48);
    if (v44 == p_conversation_history->__begin_)
    {
      p_conversation_history->__begin_ = (RecentMessage *)v42;
      self->conversation_history.__end_ = v35;
      v24 = v74;
      self->conversation_history.__end_cap_.__value_ = v72;
    }
    else
    {
      v71 = &self->conversation_history;
      v46 = 0;
      do
      {
        *(_DWORD *)(v42 + v46 - 48) = 0x100000;
        v47 = v42 + v46 - 48;
        *(_WORD *)(v47 + 4) = 0;
        *(_BYTE *)(v47 + 6) = 0;
        *(_QWORD *)(v47 + 8) = 0;
        v48 = KB::String::operator=(v47, (KB::String *)((char *)v44 + v46 - 48));
        v49 = *(_QWORD *)((char *)v44 + v46 - 16);
        *(_QWORD *)((char *)v44 + v46 - 16) = 0;
        *(_QWORD *)(v48 + 32) = v49;
        *(_DWORD *)(v48 + 40) = *(_DWORD *)((char *)v44 + v46 - 8);
        v46 -= 48;
      }
      while ((RecentMessage *)((char *)v44 + v46) != begin);
      v50 = (RecentMessage *)(v42 + v46);
      p_conversation_history = &self->conversation_history;
      v51 = v71->__begin_;
      v44 = self->conversation_history.__end_;
      v71->__begin_ = v50;
      v35 = v77;
      v24 = v74;
      self->conversation_history.__end_ = v77;
      self->conversation_history.__end_cap_.__value_ = v72;
      if (v44 != v51)
      {
        do
        {
          v44 = (RecentMessage *)((char *)v44 - 48);
          std::__destroy_at[abi:nn180100]<RecentMessage,0>((uint64_t)v44);
        }
        while (v44 != v51);
        v44 = v51;
        v35 = v77;
      }
    }
    v29 = v79;
    if (v44)
    {
      operator delete(v44);
      v35 = v77;
    }
    v23 = v84;
  }
  else
  {
    *(_DWORD *)end = 0x100000;
    *((_WORD *)end + 2) = 0;
    *((_BYTE *)end + 6) = 0;
    *((_QWORD *)end + 1) = 0;
    v33 = KB::String::operator=((uint64_t)end, (KB::String *)v97);
    v34 = v99;
    v99 = 0;
    *(_QWORD *)(v33 + 32) = v34;
    *(_DWORD *)(v33 + 40) = v100;
    v35 = (RecentMessage *)(v33 + 48);
  }
  p_conversation_history->__end_ = v35;
  v52 = v99;
  v99 = 0;
  if (v52)
    std::default_delete<KB::LanguageModelContext>::operator()[abi:nn180100](v52);
  if (v98 && v97[6] == 1)
    free(v98);
  +[TILanguageModelOfflineLearningAgent sharedLearningAgent](TILanguageModelOfflineLearningAgent, "sharedLearningAgent");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3321888768;
  v85[2] = __113__TIKeyboardInputManager_Learning__addItemToConversationHistoryWithText_timestamp_senderID_recipientIdentifiers___block_invoke;
  v85[3] = &unk_1EA1054A8;
  v92 = v24;
  v93 = v23;
  if (v23)
  {
    v54 = (unint64_t *)&v23->__shared_weak_owners_;
    do
      v55 = __ldxr(v54);
    while (__stxr(v55 + 1, v54));
  }
  v56 = v10;
  v86 = v56;
  v94 = v80;
  v87 = v13;
  v81 = v17;
  v88 = v81;
  v57 = v12;
  v89 = v57;
  v91 = v95;
  v58 = v11;
  v90 = v58;
  objc_msgSend(v53, "performTaskInBackground:", v85);

  if (v82)
  {
    synchronizedInputContextHistory = self->_synchronizedInputContextHistory;
    v75 = v56;
    -[TIInputContextHistory mostRecentNonSenderTextEntry](synchronizedInputContextHistory, "mostRecentNonSenderTextEntry");
    v76 = objc_claimAutoreleasedReturnValue();
    +[TIResponseKitManager sharedTIResponseKitManager](TIResponseKitManager, "sharedTIResponseKitManager");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "normalizedIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "clientIdentifier");
    v61 = v58;
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager keyboardState](self, "keyboardState");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "recipientIdentifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v70) = 1;
    v69 = v61;
    v65 = (void *)v76;
    objc_msgSend(v73, "registerResponseKitResponse:forMessage:withLanguage:withClientID:withSenderID:withRecipientID:withTimestamp:shouldUpdateConversationHistory:", v75, v76, v60, v62, v57, v64, v69, v70);

    v29 = v79;
    v66 = v81;
  }
  else
  {
    v66 = v81;
    if (!v56 || !v58 || !v12)
      goto LABEL_59;
    +[TIResponseKitManager sharedTIResponseKitManager](TIResponseKitManager, "sharedTIResponseKitManager");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v56;
    v65 = v67;
    objc_msgSend(v67, "updateResponseKitConversationHistoryWithMessage:withSenderID:withTimestamp:", v68, v57, v58);
  }

LABEL_59:
  if (v93)
    std::__shared_weak_count::__release_weak(v93);

  _Block_object_dispose(v95, 8);
  if (v96)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v96);
  if (v84)
    std::__shared_weak_count::__release_weak(v84);

LABEL_66:
}

- (void)resetConversationHistory
{
  vector<RecentMessage, std::allocator<RecentMessage>> *p_conversation_history;
  RecentMessage *i;
  RecentMessage *begin;
  _QWORD *m_impl;
  uint64_t v7;
  uint64_t v8;
  id v9;

  p_conversation_history = &self->conversation_history;
  begin = self->conversation_history.__begin_;
  for (i = self->conversation_history.__end_; i != begin; std::__destroy_at[abi:nn180100]<RecentMessage,0>((uint64_t)i))
    i = (RecentMessage *)((char *)i - 48);
  p_conversation_history->__end_ = begin;
  m_impl = self->m_impl;
  if (m_impl)
  {
    v7 = m_impl[29];
    if (v7)
    {
      v8 = m_impl[28];
      if (v8)
      {
        if (**(_QWORD **)(v8 + 8) != *(_QWORD *)(*(_QWORD *)(v8 + 8) + 8))
        {
          (*(void (**)(uint64_t, SEL))(*(_QWORD *)v7 + 112))(v7, a2);
          +[TIResponseKitManager sharedTIResponseKitManager](TIResponseKitManager, "sharedTIResponseKitManager");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "resetResponseKitConversationHistory");

        }
      }
    }
  }
}

- (void)learnRecentMessageUserIsRespondingTo
{
  _QWORD *m_impl;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  KB *v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  _BYTE v16[8];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  m_impl = self->m_impl;
  if (m_impl)
  {
    if (m_impl[29])
    {
      v3 = m_impl[28];
      if (v3)
      {
        if (**(_QWORD **)(v3 + 8) != *(_QWORD *)(*(_QWORD *)(v3 + 8) + 8)
          && -[TIKeyboardInputManager shouldSuppressLearning](self, "shouldSuppressLearning") == 4)
        {
          -[TIKeyboardInputManager keyboardState](self, "keyboardState");
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "responseContext");
          v5 = objc_claimAutoreleasedReturnValue();
          if (v5)
          {
            v6 = (void *)v5;
            -[TIKeyboardInputManager keyboardState](self, "keyboardState");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "inputContextHistory");
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v8)
            {
              v9 = *((_QWORD *)self->m_impl + 29);
              -[TIKeyboardInputManager keyboardState](self, "keyboardState");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "responseContext");
              v11 = (KB *)objc_claimAutoreleasedReturnValue();
              KB::utf8_string(v11, (uint64_t)v16);
              v12 = (char *)self->m_impl + 224;
              -[TIKeyboardInputManager keyboardState](self, "keyboardState");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "recipientIdentifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              (*(void (**)(uint64_t, _BYTE *, char *, void *, uint64_t, double))(*(_QWORD *)v9 + 368))(v9, v16, v12, v14, 2, 0.0);

              if (v17)
              {
                if (v16[6] == 1)
                  free(v17);
              }

            }
          }
          else
          {

          }
        }
      }
    }
  }
}

- (TITokenID)findTokenIDForWord:(id)a3 contextTokens:(id)a4 tokenLookupMode:(unsigned int)a5 surfaceFormPtr:(id *)a6 hasCaseInsensitiveStaticVariant:(BOOL *)a7
{
  uint64_t v9;
  id v12;
  TIContextTokens *v13;
  _QWORD *m_impl;
  KB *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  unint64_t token_id_for_word;
  BOOL v22;
  const char *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  unint64_t v27;
  uint64_t v28;
  const char *v30;
  const char *v31;
  void *v32;
  __int128 *v33;
  uint64_t v34;
  BOOL v35;
  uint8_t buf[4];
  void *v37;
  int v38;
  __int16 v39;
  char v40;
  void *v41;
  _BYTE v42[16];
  _BYTE v43[8];
  void *v44;
  uint64_t v45;

  v9 = *(_QWORD *)&a5;
  v45 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (TIContextTokens *)a4;
  *a6 = 0;
  m_impl = self->m_impl;
  if (m_impl
    && m_impl[29]
    && !-[TIKeyboardInputManager shouldSuppressTokenIDLookups](self, "shouldSuppressTokenIDLookups")
    && objc_msgSend(v12, "length"))
  {
    -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v12);
    v34 = v9;
    v15 = (KB *)objc_claimAutoreleasedReturnValue();
    KB::utf8_string(v15, (uint64_t)v43);
    v38 = 0x100000;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v33 = lmContextOrEmpty(v13);
    v42[0] = 0;
    v35 = 0;
    v16 = self->m_impl;
    v17 = v16[29];
    v18 = v16 + 28;
    -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "locale");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    token_id_for_word = KB::LanguageModel::find_token_id_for_word(v17, (__CFString *)v15, v18, (uint64_t)v33, v34, (uint64_t)v20, (KB::String *)&v38, &v35);

    *a7 = v35;
    if (HIDWORD(token_id_for_word))
      v22 = (unsigned __int16)v38 == 0;
    else
      v22 = 1;
    if (!v22 && !KB::String::equal((KB::String *)v43, (const KB::String *)&v38, 1))
    {
      v23 = (const char *)v41;
      if (!v41)
        v23 = v42;
      if ((_WORD)v38)
        v24 = v23;
      else
        v24 = "";
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager externalStringForDictionaryString:](self, "externalStringForDictionaryString:", v25);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v30 = (const char *)v41;
        if (!v41)
          v30 = v42;
        if ((_WORD)v38)
          v31 = v30;
        else
          v31 = "";
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TOKEN: word = %@, lookupmode = %x, result = %u/%u/%s"), "-[TIKeyboardInputManager(Learning) findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:]", v12, v34, token_id_for_word, HIDWORD(token_id_for_word), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v37 = v32;
        _os_log_debug_impl(&dword_1DA6F2000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    if (v41 && v40 == 1)
      free(v41);
    if (v44 && v43[6] == 1)
      free(v44);

    v27 = token_id_for_word & 0xFFFFFFFF00000000;
    v28 = token_id_for_word;
  }
  else
  {
    v28 = 0;
    v27 = 0;
  }

  return (TITokenID)(v27 | v28);
}

- (TITokenID)findTokenIDForWord:(id)a3 contextTokens:(id)a4 tokenLookupMode:(unsigned int)a5
{
  uint64_t v6;
  char v7;

  v7 = 0;
  v6 = 0;
  return (TITokenID)-[TIKeyboardInputManager findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:](self, "findTokenIDForWord:contextTokens:tokenLookupMode:surfaceFormPtr:hasCaseInsensitiveStaticVariant:", a3, a4, *(_QWORD *)&a5, &v6, &v7);
}

- (TITokenID)addWord:(id)a3 contextTokens:(id)a4 surfaceFormPtr:(id *)a5
{
  id v8;
  TIContextTokens *v9;
  _QWORD *m_impl;
  __int128 *v11;
  unint64_t lexicon_id;
  TITokenID v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (TIContextTokens *)a4;
  *a5 = 0;
  m_impl = self->m_impl;
  if (!m_impl
    || !m_impl[29]
    || !objc_msgSend(v8, "length")
    || !-[TIKeyboardInputManager shouldLearnWord:](self, "shouldLearnWord:", v8))
  {
    v14 = 0;
    LODWORD(lexicon_id) = 0;
    goto LABEL_11;
  }
  v11 = lmContextOrEmpty(v9);
  LODWORD(lexicon_id) = (*(uint64_t (**)(_QWORD, __int128 *))(**((_QWORD **)self->m_impl + 29) + 416))(*((_QWORD *)self->m_impl + 29), v11);
  v13 = -[TIKeyboardInputManager findTokenIDForWord:contextTokens:tokenLookupMode:](self, "findTokenIDForWord:contextTokens:tokenLookupMode:", v8, v9, 12);
  if (HIDWORD(*(unint64_t *)&v13))
    lexicon_id = v13.lexicon_id;
  else
    lexicon_id = lexicon_id;
  if (!-[TIKeyboardInputManager isStringBasedModel](self, "isStringBasedModel"))
  {
    v16 = language_modeling::v1::LinguisticContext::tokenSpan((language_modeling::v1::LinguisticContext *)(v11 + 4));
    if (v17)
    {
      if (*(_DWORD *)(v16 + 32 * v17 - 8) == 1)
      {
        -[TIKeyboardInputManager keyboardFeatureSpecialization](self, "keyboardFeatureSpecialization");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "shouldLearnLowercaseAtBeginningOfSentence");

        if (v19)
        {
          -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "locale");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "capitalizedStringWithLocale:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v22, "isEqualToString:", v8))
          {
            -[TIKeyboardInputManagerBase inputMode](self, "inputMode");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "locale");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "lowercaseStringWithLocale:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            *a5 = (id)objc_msgSend(v25, "copy");
            v8 = v25;
          }

        }
      }
    }
    -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (*(uint64_t (**)(_QWORD, void *, unint64_t))(**((_QWORD **)self->m_impl + 29) + 312))(*((_QWORD *)self->m_impl + 29), v26, lexicon_id);
    v14 = HIDWORD(v27);
    if (HIDWORD(v27))
    {
      lexicon_id = v27;
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel < 2)
        goto LABEL_34;
      TIOSLogFacility();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        if (*a5)
          v30 = (const __CFString *)*a5;
        else
          v30 = &stru_1EA1081D0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TOKEN: add token, word = %@,  result = %u/%u/%@"), "-[TIKeyboardInputManager(Learning) addWord:contextTokens:surfaceFormPtr:]", v8, lexicon_id, v14, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v31;
        _os_log_debug_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    else
    {
      v28 = (*(uint64_t (**)(_QWORD, id, char *))(**((_QWORD **)self->m_impl + 29) + 296))(*((_QWORD *)self->m_impl + 29), v8, (char *)self->m_impl + 224);
      v14 = HIDWORD(v28);
      if (!HIDWORD(v28))
      {
        LODWORD(lexicon_id) = 0;
LABEL_34:

        goto LABEL_11;
      }
      lexicon_id = v28;
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      if (TICanLogMessageAtLevel_logLevel < 2)
        goto LABEL_34;
      TIOSLogFacility();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        if (*a5)
          v32 = (const __CFString *)*a5;
        else
          v32 = &stru_1EA1081D0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TOKEN: add token, word = %@, returning existing token id = %u/%u/%@"), "-[TIKeyboardInputManager(Learning) addWord:contextTokens:surfaceFormPtr:]", v8, lexicon_id, v14, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v35 = v33;
        _os_log_debug_impl(&dword_1DA6F2000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }

    goto LABEL_34;
  }
  v14 = 0;
LABEL_11:

  return (TITokenID)(lexicon_id | (v14 << 32));
}

- (void)candidateRejected:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "isToucanInlineCompletionCandidate"))
  {
    objc_msgSend(v14, "candidate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "input");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager registerLearningForCompletion:fullCompletion:context:prefix:mode:](self, "registerLearningForCompletion:fullCompletion:context:prefix:mode:", v4, &stru_1EA1081D0, 0, v5, *MEMORY[0x1E0DBE4A8]);
LABEL_3:

    goto LABEL_7;
  }
  -[TIKeyboardInputManager acceptInput](self, "acceptInput");
  if (self->m_impl)
  {
    objc_msgSend(v14, "candidate");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v14, "candidate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "input");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if ((v10 & 1) == 0)
      {
        -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "candidate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "input");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "rejectCandidate:forInput:hint:", v12, v13, 1);

        objc_msgSend(v14, "candidate");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "input");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIKeyboardInputManager setRejectedAutocorrection:forInput:](self, "setRejectedAutocorrection:forInput:", v4, v5);
        goto LABEL_3;
      }
    }
  }
LABEL_7:

}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v9 = a4;
  v10 = a6;
  if ((objc_msgSend(v23, "isToucanInlineCompletionCandidate") & 1) != 0
    || objc_msgSend(v9, "isToucanInlineCompletionCandidate"))
  {
    objc_msgSend(v23, "candidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "candidate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager registerLearningForCompletion:fullCompletion:context:prefix:mode:](self, "registerLearningForCompletion:fullCompletion:context:prefix:mode:", v11, v12, 0, v13, v10);

LABEL_4:
    goto LABEL_5;
  }
  if (TIIsRegisterLearningModeRejection())
  {
    -[TIKeyboardInputManager acceptInput](self, "acceptInput");
    if (self->m_impl)
    {
      objc_msgSend(v23, "candidate");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v23, "candidate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "input");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if ((v18 & 1) == 0)
        {
          if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DBE4C8]))
            v19 = 2;
          else
            v19 = 1;
          -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "candidate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "input");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "rejectCandidate:forInput:hint:", v21, v22, v19);

          objc_msgSend(v23, "candidate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "input");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIKeyboardInputManager setRejectedAutocorrection:forInput:](self, "setRejectedAutocorrection:forInput:", v11, v12);
          goto LABEL_4;
        }
      }
    }
  }
LABEL_5:

}

- (void)registerLearningForCompletion:(id)a3 fullCompletion:(id)a4 context:(id)a5 prefix:(id)a6 mode:(id)a7
{
  KB *v11;
  id v12;
  KB *v13;
  id v14;
  void *v15;
  char v16;
  _QWORD **m_impl;
  sqlite3 **v18;
  sqlite3 **v19;
  int v20;
  const __CFString *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *__p;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  char v34;
  std::string v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = (KB *)a3;
  v12 = a4;
  v13 = (KB *)a6;
  v14 = a7;
  -[TIKeyboardInputManager config](self, "config");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "disableAnalytics");

  if ((v16 & 1) == 0)
  {
    m_impl = (_QWORD **)self->m_impl;
    KB::utf8_string(v11, (uint64_t)&v35);
    KB::utf8_string(v13, (uint64_t)&v32);
    KB::utf8_string(v13, (uint64_t)&__p);
    (*(void (**)(_QWORD *, std::string *, void **, void **, _QWORD))(*m_impl[23] + 88))(m_impl[23], &v35, &v32, &__p, -[TIKeyboardInputManager TIInlineCompletionAcceptanceRejectionTypefromTIRegisterLearningMode:](self, "TIInlineCompletionAcceptanceRejectionTypefromTIRegisterLearningMode:", v14));
    if (v30 && BYTE6(__p) == 1)
      free(v30);
    if (v33 && BYTE6(v32) == 1)
      free(v33);
    if (v35.__r_.__value_.__l.__size_ && v35.__r_.__value_.__s.__data_[6] == 1)
      free((void *)v35.__r_.__value_.__l.__size_);
  }
  if (TIIsRegisterLearningModeRejection())
  {
    v18 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
    if (v18)
    {
      v19 = v18;
      v20 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DBE4C8]);
      v21 = CFSTR("hard");
      if (v20)
        v21 = CFSTR("soft");
      v28 = v21;
      v22 = v20 ^ 1;
      -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v11);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v12);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[TIKeyboardInputManager dictionaryStringForExternalString:](self, "dictionaryStringForExternalString:", v13);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_retainAutorelease(v23);
      std::string::basic_string[abi:nn180100]<0>(&v35, (char *)-[KB UTF8String](v11, "UTF8String"));
      v12 = objc_retainAutorelease(v24);
      std::string::basic_string[abi:nn180100]<0>(&v32, (char *)objc_msgSend(v12, "UTF8String"));
      v13 = objc_retainAutorelease(v25);
      std::string::basic_string[abi:nn180100]<0>(&__p, (char *)-[KB UTF8String](v13, "UTF8String"));
      TIInlineCompletionsNegativeLearning::registerLearning(v19, &v35, v26, (std::string::size_type)&__p, v22);
      if (v31 < 0)
        operator delete(__p);
      if (v34 < 0)
        operator delete(v32);
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v35.__r_.__value_.__l.__data_);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v27);

    }
  }

}

- (id)checkRejectionHistory:(id)a3
{
  id v4;

  v4 = a3;
  if (-[TIKeyboardInputManager shouldBlockAutocorrection:](self, "shouldBlockAutocorrection:", v4))
  {

    v4 = 0;
  }
  return v4;
}

- (BOOL)shouldBlockAutocorrection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  BOOL v27;
  _QWORD v29[2];
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[TIKeyboardInputManager _hasSupplementalPrefix](self, "_hasSupplementalPrefix")
    && objc_msgSend(v4, "isSupplementalItemCandidate"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v31 = "-[TIKeyboardInputManager(Learning) shouldBlockAutocorrection:]";
      _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  Not blocking autocorrection as its a supplemental candidate", buf, 0xCu);
    }
    goto LABEL_29;
  }
  if ((TIAdaptationAutocorrectionRejectionV2Enabled() & 1) == 0)
  {
    objc_msgSend(v4, "candidate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = objc_msgSend(v4, "isSupplementalItemCandidate");

      if ((v7 & 1) == 0)
      {
        -[TIKeyboardInputManager rejectedAutocorrectionsDisplayedOrInserted](self, "rejectedAutocorrectionsDisplayedOrInserted");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "candidate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          -[TIKeyboardInputManager currentWordStem](self, "currentWordStem");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "isEqualToString:", v11)
            && (objc_msgSend(v10, "length") != 1
             || (objc_msgSend(v4, "sourceMask") & 0x8000) == 0 && (objc_msgSend(v4, "sourceMask") & 0x20000) == 0
             || (objc_msgSend(v4, "usageTrackingMask") & 2) == 0)
            || (unint64_t)objc_msgSend(v11, "length") >= 2
            && (unint64_t)objc_msgSend(v11, "length") <= 0x20
            && objc_msgSend(v10, "_editDistanceFrom:", v11) == 1)
          {

LABEL_25:
            goto LABEL_26;
          }

        }
      }
    }
  }
  if (!v4)
  {
LABEL_29:
    v27 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v4, "input");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "candidate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[TIKeyboardInputManager blockedByNegativeLearning:correction:ignoreSoft:](self, "blockedByNegativeLearning:correction:ignoreSoft:", v12, v13, 0);

  if (!v14)
  {
    -[TIKeyboardInputManager revisionHistory](self, "revisionHistory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentWord");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v10, "length");
    objc_msgSend(v4, "input");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 <= objc_msgSend(v17, "length"))
    {

    }
    else
    {
      objc_msgSend(v4, "input");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v10, "hasSuffix:", v18);

      if (v19)
      {
        v20 = objc_msgSend(v10, "length");
        objc_msgSend(v4, "input");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "substringToIndex:", v20 - objc_msgSend(v21, "length"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "candidate", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "componentsJoinedByString:", &stru_1EA1081D0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = -[TIKeyboardInputManager blockedByNegativeLearning:correction:ignoreSoft:](self, "blockedByNegativeLearning:correction:ignoreSoft:", v10, v25, 0);
        if (v26)
          goto LABEL_25;
      }
    }

    goto LABEL_29;
  }
LABEL_26:
  v27 = 1;
LABEL_30:

  return v27;
}

- (BOOL)autocorrectionWasRecentlyRejected:(id)a3
{
  void *v3;
  BOOL v4;

  if (!a3)
    return 0;
  -[TIKeyboardInputManager checkRejectionHistory:](self, "checkRejectionHistory:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)autocorrectionWasRecentlyRejectedForCurrentInput
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[TIKeyboardInputManager rejectedAutocorrectionsDisplayedOrInsertedInverse](self, "rejectedAutocorrectionsDisplayedOrInsertedInverse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManager currentWordStem](self, "currentWordStem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (void)runMaintenanceTask
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  TI **v7;

  if (self->m_impl)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    v5 = v4;

    v6 = *((_QWORD *)self->m_impl + 23);
    if (v6)
      (*(void (**)(uint64_t, double))(*(_QWORD *)v6 + 480))(v6, v5 + -2592000.0);
  }
  v7 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
  if (v7)
    TI::RejectionsDatabase::prune(v7, (sqlite3 *)0x200000);
}

- (void)recordRejectedAutocorrectionForAcceptedText:(id)a3 fromPredictiveInputBar:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v4 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "candidate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "input");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[TIKeyboardInputManager autocorrectionListsSuggestedForCurrentInput](self, "autocorrectionListsSuggestedForCurrentInput");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "input");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "corrections");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "autocorrection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TIKeyboardInputManager autocorrectionHistory](self, "autocorrectionHistory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "input");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager autocorrectionListsForWordsInDocument](self, "autocorrectionListsForWordsInDocument");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "input");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKey:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "candidate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v12, "hasSupplementalItems") & 1) == 0)
  {
    if (v12 && (objc_msgSend(v6, "isSupplementalItemCandidate") & 1) == 0)
    {
      -[TIKeyboardInputManager revisionListFromAutocorrectionList:afterAcceptingCandidate:](self, "revisionListFromAutocorrectionList:afterAcceptingCandidate:", v12, v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager autocorrectionListsForWordsInDocument](self, "autocorrectionListsForWordsInDocument");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "input");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v20, v22);

    }
    if (objc_msgSend(v15, "isAutocorrection"))
    {
      -[TIKeyboardInputManager rejectedAutocorrections](self, "rejectedAutocorrections");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKey:", v15, v13);

      -[TIKeyboardInputManager autocorrectionHistory](self, "autocorrectionHistory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "candidate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "removeObjectForKey:", v25);

    }
    else if (v4)
    {
      v38 = v13;
      v39 = v15;
      v40 = v6;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      objc_msgSend(v12, "corrections");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "autocorrection");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "candidate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "componentsSeparatedByString:", CFSTR(" "));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v42 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            if (objc_msgSend(v34, "length"))
            {
              -[TIKeyboardInputManager recentPredictiveInputSelections](self, "recentPredictiveInputSelections");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "corrections");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "autocorrection");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setObject:forKey:", v37, v34);

            }
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v31);
      }

      v15 = v39;
      v6 = v40;
      v13 = v38;
    }
  }

}

- (void)releaseAndRemoveRejectionsDatabase
{
  void *v2;
  void *v3;
  std::string *p_p;
  void *v5;
  std::string __p;

  std::unique_ptr<TI::RejectionsDatabase>::reset[abi:nn180100]((TI::RejectionsDatabase **)&self->m_rejectionsDatabase, 0);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  TI::RejectionsDatabase::keyboard_db_file(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v3, "stringWithCString:encoding:", p_p, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeItemAtPath:error:", v5, 0);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

}

- (void)clearSoftLearning
{
  TI::RejectionsDatabase *v2;

  v2 = -[TIKeyboardInputManager rejectionsDatabase](self, "rejectionsDatabase");
  if (v2)
    TI::RejectionsDatabase::soft_clear_memory(v2);
}

- (void)setRejectedAutocorrection:(id)a3 forInput:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[TIKeyboardInputManager rejectedAutocorrectionsDisplayedOrInserted](self, "rejectedAutocorrectionsDisplayedOrInserted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, v7);

  -[TIKeyboardInputManager rejectedAutocorrectionsDisplayedOrInsertedInverse](self, "rejectedAutocorrectionsDisplayedOrInsertedInverse");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v7, v6);

}

uint64_t __90__TIKeyboardInputManager_Learning__synchronizeConversationHistoryWithInputContextHistory___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "addItemToConversationHistoryWithText:timestamp:senderID:recipientIdentifiers:", a2, a3, a4, a5);
}

void __113__TIKeyboardInputManager_Learning__addItemToConversationHistoryWithText_timestamp_senderID_recipientIdentifiers___block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_weak_owners;
  unint64_t v4;
  id v5;
  __int128 v6;
  id v7;
  id v8;
  id v9;
  id v10;
  std::__shared_weak_count *v11;

  v2 = *(std::__shared_weak_count **)(a1 + 88);
  v11 = v2;
  if (v2)
  {
    p_shared_weak_owners = (unint64_t *)&v2->__shared_weak_owners_;
    do
      v4 = __ldxr(p_shared_weak_owners);
    while (__stxr(v4 + 1, p_shared_weak_owners));
  }
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 64);
  v5 = (id)v6;
  TIDispatchSync();

  if (v11)
    std::__shared_weak_count::__release_weak(v11);
}

void __113__TIKeyboardInputManager_Learning__addItemToConversationHistoryWithText_timestamp_senderID_recipientIdentifiers___block_invoke_2(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  const void *v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  _BYTE v20[18];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(std::__shared_weak_count **)(a1 + 88);
  if (!v2)
  {
LABEL_20:
    v3 = 0;
    goto LABEL_21;
  }
  v3 = std::__shared_weak_count::lock(v2);
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 80);
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "length");
      if (!*(_QWORD *)(a1 + 96))
      {
        objc_msgSend(*(id *)(a1 + 40), "allObjects");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "allObjects");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v19 = 136315394;
          *(_QWORD *)v20 = "-[TIKeyboardInputManager(Learning) addItemToConversationHistoryWithText:timestamp:senderID:re"
                           "cipientIdentifiers:]_block_invoke_2";
          *(_WORD *)&v20[8] = 2112;
          *(_QWORD *)&v20[10] = v7;
          _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Recipients are: %@", (uint8_t *)&v19, 0x16u);
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v18 = *(_QWORD *)(a1 + 56);
          v19 = 136315394;
          *(_QWORD *)v20 = "-[TIKeyboardInputManager(Learning) addItemToConversationHistoryWithText:timestamp:senderID:re"
                           "cipientIdentifiers:]_block_invoke";
          *(_WORD *)&v20[8] = 2112;
          *(_QWORD *)&v20[10] = v18;
          _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  Sender Identifier: %@", (uint8_t *)&v19, 0x16u);
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v19 = 136315394;
          *(_QWORD *)v20 = "-[TIKeyboardInputManager(Learning) addItemToConversationHistoryWithText:timestamp:senderID:re"
                           "cipientIdentifiers:]_block_invoke";
          *(_WORD *)&v20[8] = 2112;
          *(_QWORD *)&v20[10] = v9;
          _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  All-Sender-Identifiers: %@", (uint8_t *)&v19, 0x16u);
        }

      }
      if (v5 <= 0x3FFE)
      {
        KB::utf8_string(*(KB **)(a1 + 32), (uint64_t)&v19);
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 48;
        objc_msgSend(*(id *)(a1 + 64), "timeIntervalSinceReferenceDate");
        (*(void (**)(uint64_t, int *, uint64_t, _QWORD, uint64_t))(*(_QWORD *)v4 + 368))(v4, &v19, v10, *(_QWORD *)(a1 + 96), 2);
        if (*(_QWORD *)&v20[4])
        {
          if (v20[2] == 1)
            free(*(void **)&v20[4]);
        }
      }
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
      goto LABEL_20;
    }
  }
LABEL_21:
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v14 = *(unsigned int **)(v13 + 48);
  *(_QWORD *)(v13 + 48) = 0;
  if (v14)
    WTF::RefCounted<KB::DictionaryContainer>::deref(v14);
  v15 = *(const void **)(a1 + 96);
  if (v15)
    CFRelease(v15);
  if (v3)
  {
    v16 = (unint64_t *)&v3->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

+ (void)clearRejectionsDatabase
{
  const std::__fs::filesystem::path *p_p;
  std::string __p;
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  TI::RejectionsDatabase::keyboard_db_file(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = (const std::__fs::filesystem::path *)&__p;
  else
    p_p = (const std::__fs::filesystem::path *)__p.__r_.__value_.__r.__words[0];
  TI::RejectionsDatabase::initialize((TI::RejectionsDatabase *)v4, p_p, 2, CFSTR("rejections_database_migration_schema"));
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  TI::RejectionsDatabase::clear((sqlite3 **)v4);
  TI::RejectionsDatabase::soft_clear_memory((TI::RejectionsDatabase *)v4);
  TI::RejectionsDatabase::~RejectionsDatabase((TI::RejectionsDatabase *)v4);
}

- (void)logInlineCompletionsToTypology:(id)a3 candidate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  TIInlineCompletionsOSLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManager(InlineCompletions) logInlineCompletionsToTypology:candidate:]", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    TIInlineCompletionsOSLogFacility();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManager(InlineCompletions) logInlineCompletionsToTypology:candidate:]", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v12;
      _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v10);

  }
  else
  {
    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v6);
  }

}

- (id)inlineCompletions:(CandidateCollection *)a3 matchedStem:(String *)a4
{
  void *v7;
  const KB::String *v8;
  void *v9;
  void *v10;
  Candidate *var0;
  Candidate *var1;
  void *v13;
  double v14;
  void *v15;
  _QWORD v17[3];
  void **v18;
  void *v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0x1CAC083126E978D5 * ((a3->var0.var1 - a3->var0.var0) >> 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WORD2(v18) = 0;
  BYTE6(v18) = 0;
  v19 = " \t\n";
  LODWORD(v18) = 1048579;
  v20 = 0;
  KB::string_split_after(&a4->var0, (const KB::String *)&v18, v17);
  if (v19 && BYTE6(v18) == 1)
    free(v19);
  if (a4->var0)
    KB::String::String((KB::String *)&v18, (const KB::String *)(v17[1] - 32));
  else
    KB::String::String((KB::String *)&v18, "");
  KB::ns_string((KB *)&v18, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19 && BYTE6(v18) == 1)
    free(v19);
  -[TIKeyboardInputManager internalStringToExternal:ignoreCompositionDisabled:](self, "internalStringToExternal:ignoreCompositionDisabled:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = a3->var0.var0;
  var1 = a3->var0.var1;
  if (a3->var0.var0 != var1)
  {
    do
    {
      if (*(_QWORD *)var0)
      {
        -[TIKeyboardInputManager autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:](self, "autocorrectionCandidateForInput:rawInput:withCandidate:insertingSpace:sharedPrefixLength:", v10, v9, var0, 0, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setToucanInlineCompletionCandidate:", 1);
        LODWORD(v14) = *(_DWORD *)(*((_QWORD *)var0 + 1) + 240 * *(_QWORD *)var0 - 184);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setStaticLinguisticLikelihood:", v15);

        objc_msgSend(v7, "addObject:", v13);
      }
      var0 = (Candidate *)((char *)var0 + 1000);
    }
    while (var0 != var1);
  }

  v18 = (void **)v17;
  std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](&v18);
  return v7;
}

- (void)reconcileInlineCompletionAndAutocorrections:(id)a3 inlineCompletions:(id)a4 predictions:(id)a5 outReconciledAutocorrections:(id *)a6 outReconciledInlineCompletions:(id *)a7 outReconciledPredictions:(id *)a8 matchedStem:(String *)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  float v26;
  float v27;
  void *v28;
  void *v29;
  float v30;
  float v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  TIKeyboardInputManager *v50;
  id *v51;
  void *v52;
  id v53;
  id v54;
  id *v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[8];
  void *v62;
  uint8_t v63[128];
  uint8_t buf[4];
  const char *v65;
  _BYTE v66[8];
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  objc_msgSend(v15, "autocorrection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_retainAutorelease(v15);
  *a6 = v19;
  v20 = objc_retainAutorelease(v16);
  *a7 = v20;
  v21 = objc_retainAutorelease(v17);
  *a8 = v21;
  if (-[TIKeyboardInputManager shouldPromoteInlineCompletionsToAutocorrections:inlineCompletions:](self, "shouldPromoteInlineCompletionsToAutocorrections:inlineCompletions:", v19, v20))
  {
    v54 = v20;
    v55 = a8;
    v56 = v21;
    objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v18, "isAutocorrection"))
      goto LABEL_5;
    objc_msgSend(v18, "staticLinguisticLikelihood");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
      goto LABEL_5;
    v24 = (void *)v23;
    objc_msgSend(v22, "staticLinguisticLikelihood");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "floatValue");
    v27 = v26;
    objc_msgSend(v18, "staticLinguisticLikelihood");
    v28 = v18;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    v31 = v30;

    v18 = v28;
    if (v27 <= v31)
    {
      objc_msgSend(v22, "candidate");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](self, "logInlineCompletionsToTypology:candidate:", CFSTR("Inline completion linguistically inferior to an autocorrect candidate and will be suppressed. Inline completion candidate: "), v49);

      *a7 = 0;
    }
    else
    {
LABEL_5:
      objc_msgSend(v22, "candidate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](self, "logInlineCompletionsToTypology:candidate:", CFSTR("Inline completion linguistically superior - will promote to autocorrect. Inline completion: "), v32);

      KB::String::String((KB::String *)v66, (const KB::String *)a9);
      -[TIKeyboardInputManager promoteInlineCompletionToAutocorrections:predictions:inlineCompletion:outReconciledAutocorrections:outReconciledPredictions:matchedStem:](self, "promoteInlineCompletionToAutocorrections:predictions:inlineCompletion:outReconciledAutocorrections:outReconciledPredictions:matchedStem:", v19, v56, v22, a6, v55, v66);
      if (v67 && v66[6] == 1)
        free(v67);
      if (*a6)
      {
        objc_msgSend(v22, "supplementalItemIdentifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v34)
        {
          v52 = v18;
          v53 = v19;
          objc_msgSend(v22, "candidate");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "componentsSeparatedByString:", CFSTR(" "));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "count");

          if (v37 == 1)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315138;
              v65 = "-[TIKeyboardInputManager(InlineCompletions) reconcileInlineCompletionAndAutocorrections:inlineComple"
                    "tions:predictions:outReconciledAutocorrections:outReconciledInlineCompletions:outReconciledPredictio"
                    "ns:matchedStem:]";
              _os_log_debug_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s  The inline completion being offered contains supplemental identifiers, removing it, and offering a prediction instead", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x1E0C99DE8], "array", self, a7);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = (void *)objc_msgSend(v22, "copy");
            objc_msgSend(v38, "addObject:", v39);

            v59 = 0u;
            v60 = 0u;
            v57 = 0u;
            v58 = 0u;
            v40 = v56;
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v58;
              do
              {
                for (i = 0; i != v42; ++i)
                {
                  if (*(_QWORD *)v58 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
                  objc_msgSend(v45, "candidate");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "candidate");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = objc_msgSend(v46, "isEqualToString:", v47);

                  if ((v48 & 1) == 0)
                    objc_msgSend(v38, "addObject:", v45);
                }
                v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
              }
              while (v42);
            }

            *v55 = (id)objc_msgSend(v38, "copy");
            self = v50;
            a7 = v51;
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v65 = "-[TIKeyboardInputManager(InlineCompletions) reconcileInlineCompletionAndAutocorrections:inlineCompleti"
                  "ons:predictions:outReconciledAutocorrections:outReconciledInlineCompletions:outReconciledPredictions:matchedStem:]";
            _os_log_error_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s  The inline completeion being offered contains supplemental identifiers, but it contained more than one word", buf, 0xCu);
          }
          objc_msgSend(v22, "setSupplementalItemIdentifiers:", 0);
          v18 = v52;
          v19 = v53;
        }
      }
    }

    v20 = v54;
    v21 = v56;
  }
  if (objc_msgSend(v18, "isAutocorrection") && (!*a7 || !objc_msgSend(*a7, "count")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[TIKeyboardInputManager shouldPromoteAutocorrectionsToInlineCompletions:](self, "shouldPromoteAutocorrectionsToInlineCompletions:", v18))
      {
        KB::String::String((KB::String *)v61, (const KB::String *)a9);
        -[TIKeyboardInputManager promoteAutocorrectionsToInlineCompletions:matchedStem:](self, "promoteAutocorrectionsToInlineCompletions:matchedStem:", v19, v61);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          if (v61[6] == 1)
            free(v62);
        }
      }
    }
  }

}

- (void)promoteInlineCompletionToAutocorrections:(id)a3 predictions:(id)a4 inlineCompletion:(id)a5 outReconciledAutocorrections:(id *)a6 outReconciledPredictions:(id *)a7 matchedStem:(String *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  const KB::String *v22;
  const __CFString *v23;
  TIKeyboardInputManager *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id *v52;
  id v53;
  void *v54;
  __CFString *v55;
  TIKeyboardInputManager *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[3];
  _BYTE v63[128];
  void **v64;
  char *v65;
  char v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = objc_retainAutorelease(v15);
  *a7 = v17;
  v18 = objc_retainAutorelease(v14);
  *a6 = v18;
  objc_msgSend(v16, "candidate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "componentsSeparatedByString:", CFSTR(" "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (a8->var0)
    v21 = KB::String::last((KB::String *)a8) == 32;
  else
    v21 = 1;
  if (objc_msgSend(v20, "count") > v21)
  {
    objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    WORD2(v64) = 0;
    BYTE6(v64) = 0;
    v65 = " \t\n";
    LODWORD(v64) = 1048579;
    v66 = 0;
    KB::string_split_after(&a8->var0, (const KB::String *)&v64, v62);
    if (v65 && BYTE6(v64) == 1)
      free(v65);
    v52 = a7;
    if (a8->var0 && KB::String::last((KB::String *)a8) != 32)
    {
      KB::ns_string((KB *)(v62[1] - 32), v22);
      v23 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = &stru_1EA1081D0;
    }
    v56 = self;
    v24 = self;
    v25 = v23;
    -[TIKeyboardInputManager internalStringToExternal:ignoreCompositionDisabled:](v24, "internalStringToExternal:ignoreCompositionDisabled:", v23, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (__CFString *)v25;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DBDDD0]), "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:learningFlagsMask:", v57, v54, v25, objc_msgSend(v16, "wordOriginFeedbackID"), objc_msgSend(v16, "usageTrackingMask"), objc_msgSend(v16, "sourceMask"), objc_msgSend(v16, "learningFlagsMask"));
    if (objc_msgSend(v20, "count") == 1)
      goto LABEL_14;
    if (HIBYTE(inline_completions_full_acceptance_by_space))
    {
      if (!(_BYTE)inline_completions_full_acceptance_by_space)
        goto LABEL_14;
    }
    else if ((_os_feature_enabled_impl() & 1) == 0)
    {
LABEL_14:
      v27 = objc_alloc(MEMORY[0x1E0DBDB70]);
      if (v18)
      {
        objc_msgSend(v18, "alternateCorrections");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = 0;
      }
      *a6 = (id)objc_msgSend(v27, "initWithAutocorrection:alternateCorrections:", v26, v28);
      if (v18)

      objc_msgSend(v26, "candidate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](v56, "logInlineCompletionsToTypology:candidate:", CFSTR("Promoting (single word) inline completion  to autocorrection"), v29);
LABEL_37:

      v64 = (void **)v62;
      std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](&v64);

      goto LABEL_38;
    }
    v49 = v20;
    v51 = v16;
    if (v18)
    {
      objc_msgSend(v18, "autocorrection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "input");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        objc_msgSend(v18, "autocorrection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)MEMORY[0x1E0DBDBE8];
        objc_msgSend(v32, "input");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "candidateWithUnchangedInput:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = objc_alloc(MEMORY[0x1E0DBDB70]);
        objc_msgSend(v18, "alternateCorrections");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *a6 = (id)objc_msgSend(v36, "initWithAutocorrection:alternateCorrections:", v35, v37);

      }
    }
    v50 = v18;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v29, "addObject:", v38);

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v53 = v17;
    v39 = v17;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v59 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v44, "candidate");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "candidate");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v45, "isEqualToString:", v46);

          if ((v47 & 1) == 0)
            objc_msgSend(v29, "addObject:", v44);
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      }
      while (v41);
    }

    *v52 = (id)objc_msgSend(v29, "copy");
    objc_msgSend(v26, "candidate");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](v56, "logInlineCompletionsToTypology:candidate:", CFSTR("Promoting (first word of multi word) inline completion  to prediction"), v48);

    v18 = v50;
    v16 = v51;
    v17 = v53;
    v20 = v49;
    goto LABEL_37;
  }
  -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](self, "logInlineCompletionsToTypology:candidate:", CFSTR("Should never get here - if the stem ends in a space and inline completion is produced, it has to have at least two words"), 0);
LABEL_38:

}

- (id)filterDuplicatePredictions:(id)a3 autocorrection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  TIKeyboardInputManager *v25;
  id obj;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v25 = self;
  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v28 = *(_QWORD *)v30;
    v9 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "supplementalItemIdentifiers", v25);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (void *)v12;
        else
          v14 = v9;
        v15 = v14;

        objc_msgSend(v6, "supplementalItemIdentifiers");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v16;
        if (v16)
          v18 = (void *)v16;
        else
          v18 = v9;
        v19 = v18;

        objc_msgSend(v11, "candidate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "candidate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "isEqualToString:", v21))
        {
          v22 = objc_msgSend(v15, "isEqualToArray:", v19);

          if (v22)
          {
            objc_msgSend(v11, "candidate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](v25, "logInlineCompletionsToTypology:candidate:", CFSTR("Removed duplicate prediction due to inline promotion to autocorrection"), v23);

            goto LABEL_17;
          }
        }
        else
        {

        }
        objc_msgSend(v27, "addObject:", v11);
LABEL_17:

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  return v27;
}

- (id)promoteAutocorrectionsToInlineCompletions:(id)a3 matchedStem:(String *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _WORD v18[3];
  char v19;
  void *v20;
  void **v21;
  void *v22;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!a4->var0)
  {
    v11 = 0;
    goto LABEL_20;
  }
  WORD2(v21) = 0;
  BYTE6(v21) = 0;
  v22 = " \t\n";
  LODWORD(v21) = 1048579;
  v23 = 0;
  KB::string_split_after(&a4->var0, (const KB::String *)&v21, v17);
  if (v22 && BYTE6(v21) == 1)
    free(v22);
  objc_msgSend(v6, "autocorrection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "candidate");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  KB::String::String((KB::String *)&v21, (const char *)objc_msgSend(v8, "UTF8String"));

  KB::String::String((KB::String *)v18, (const KB::String *)(v17[1] - 32));
  v9 = *((_QWORD *)self->m_impl + 28);
  if (v9)
  {
    do
      v10 = __ldaxr((unsigned int *)v9);
    while (__stlxr(v10 + 1, (unsigned int *)v9));
    if ((unsigned __int16)v21 <= v18[0])
      goto LABEL_10;
    goto LABEL_8;
  }
  if ((unsigned __int16)v21 > v18[0])
  {
LABEL_8:
    if (KB::CollatorWrapper::sortkey_starts_with((KB::CollatorWrapper *)(*(_QWORD *)(v9 + 8) + 72), (_LXLexicon *)&v21, (_LXLexicon *)v18))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "autocorrection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setConfidence:", 3);

      objc_msgSend(v6, "autocorrection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);

      objc_msgSend(v6, "autocorrection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "candidate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIKeyboardInputManager logInlineCompletionsToTypology:candidate:](self, "logInlineCompletionsToTypology:candidate:", CFSTR("Promoting autocorrection to inline completion"), v15);

LABEL_11:
      WTF::RefCounted<KB::DictionaryContainer>::deref((unsigned int *)v9);
      goto LABEL_12;
    }
LABEL_10:
    v11 = 0;
    goto LABEL_11;
  }
  v11 = 0;
LABEL_12:
  if (v20 && v19 == 1)
    free(v20);
  if (v22 && BYTE6(v21) == 1)
    free(v22);
  v21 = (void **)v17;
  std::vector<KB::String>::__destroy_vector::operator()[abi:nn180100](&v21);
LABEL_20:

  return v11;
}

- (BOOL)shouldPromoteAutocorrectionsToInlineCompletions:(id)a3
{
  id v4;
  BOOL v5;
  id v7;
  _QWORD *m_impl;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[8];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (HIBYTE(promote_autocorrect_to_inline))
  {
    if (!(_BYTE)promote_autocorrect_to_inline)
      goto LABEL_6;
  }
  else if (!_os_feature_enabled_impl())
  {
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((objc_msgSend(v4, "isContinuousPathConversion") & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v4, "lexiconLocale");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  KB::String::String((KB::String *)v18, (const char *)objc_msgSend(v7, "UTF8String"));

  m_impl = self->m_impl;
  if (m_impl
    && (v9 = m_impl[29]) != 0
    && ((*(uint64_t (**)(uint64_t, _BYTE *))(*(_QWORD *)v9 + 152))(v9, v18) & 1) != 0
    || (objc_msgSend(v4, "sourceMask") & 8) != 0)
  {
    v5 = 1;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "candidate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lexiconLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Suppressed promotion of %@ (locale: %@, mask: %u) \n"), v11, v12, objc_msgSend(v4, "sourceMask"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[TIKeyboardInputManager logToTypologyRecorderWithString:](self, "logToTypologyRecorderWithString:", v13);
    TIInlineCompletionsOSLogFacility();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s %s"), "-[TIKeyboardInputManager(InlineCompletions) shouldPromoteAutocorrectionsToInlineCompletions:]", objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v15;
      _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    v5 = 0;
  }
  if (v19 && v18[6] == 1)
    free(v19);
LABEL_7:

  return v5;
}

- (BOOL)shouldPromoteInlineCompletionsToAutocorrections:(id)a3 inlineCompletions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  if (!HIBYTE(promote_inline_to_autocorrect))
  {
    if (_os_feature_enabled_impl())
      goto LABEL_3;
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if (!(_BYTE)promote_inline_to_autocorrect)
    goto LABEL_7;
LABEL_3:
  objc_msgSend(v5, "autocorrection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isContinuousPathConversion");

  v9 = 0;
  if (v6 && (v8 & 1) == 0)
    v9 = objc_msgSend(v6, "count") != 0;
LABEL_8:

  return v9;
}

- (BOOL)shouldGenerateInlineCompletions
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  BOOL v7;
  char v8;
  void *v10;
  KB *v11;
  _BYTE v12[8];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[TIKeyboardInputManager config](self, "config");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTesting"))
  {
    if (HIBYTE(enable_inline_for_testing))
    {
      v4 = enable_inline_for_testing;

      if (!v4)
        return 0;
    }
    else
    {
      v8 = _os_feature_enabled_impl();

      if ((v8 & 1) == 0)
        return 0;
    }
  }
  else
  {

  }
  if (-[TIKeyboardInputManager isEditingExistingWord](self, "isEditingExistingWord"))
    return 0;
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "inlineCompletionEnabled");

  if (!v6)
    return 0;
  if (HIBYTE(inline_completions_override))
  {
    if ((_BYTE)inline_completions_override)
      return 1;
  }
  else if ((_os_feature_enabled_impl() & 1) != 0)
  {
    return 1;
  }
  -[TIKeyboardInputManager keyboardState](self, "keyboardState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v11 = (KB *)objc_claimAutoreleasedReturnValue();
  KB::utf8_string(v11, (uint64_t)v12);
  v7 = isInlineCompletionDefaultAllowlistedApp((KB::String *)v12);
  if (v13 && v12[6] == 1)
    free(v13);

  return v7;
}

- (int)TIInlineCompletionAcceptanceRejectionTypefromTIRegisterLearningMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE498]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE488]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE4A0]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE490]) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE480]) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE4D8]) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE4D0]) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE4C0]) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE4A8]) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE4C8]) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE4B0]) & 1) != 0)
  {
    v4 = 11;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DBE4B8]))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)precisionPointFromTrialOverride:(id)a3
{
  int result;

  result = objc_msgSend(a3, "intValue");
  if ((result - 70) > 0x14 || ((1 << (result - 70)) & 0x100401) == 0)
    return -1;
  return result;
}

@end
