@implementation TIKeyboardInputManagerConfig

- (NSURL)mlttBundleURL
{
  return self->_mlttBundleURL;
}

- (BOOL)shouldIgnoreCPRequirements
{
  return self->_shouldIgnoreCPRequirements;
}

- (BOOL)usesContinuousPath
{
  return self->_usesContinuousPath;
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  return self->_insertsSpaceAfterPredictiveInput;
}

- (BOOL)isTesting
{
  return self->_testing;
}

- (BOOL)usesCustomNgramModel
{
  return self->_usesCustomNgramModel;
}

- (NSNumber)favoniusLanguageModelWeight
{
  return self->_favoniusLanguageModelWeight;
}

- (id)propertyList
{
  const __CFString *v3;
  uint64_t v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v26;
  __CFString *v27;
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
  void *v40;
  void *v41;
  _QWORD v42[23];
  _QWORD v43[25];

  v43[23] = *MEMORY[0x1E0C80C00];
  v42[0] = CFSTR("normalizedInputMode");
  -[TIKeyboardInputManagerConfig inputMode](self, "inputMode");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    -[TIKeyboardInputManagerConfig inputMode](self, "inputMode");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "normalizedIdentifier");
    v3 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &stru_1EA1081D0;
  }
  v27 = (__CFString *)v3;
  v43[0] = v3;
  v42[1] = CFSTR("staticDictionaryPath");
  -[TIKeyboardInputManagerConfig staticDictionaryPath](self, "staticDictionaryPath");
  v4 = objc_claimAutoreleasedReturnValue();
  v40 = (void *)v4;
  if (v4)
    v5 = (const __CFString *)v4;
  else
    v5 = &stru_1EA1081D0;
  v43[1] = v5;
  v42[2] = CFSTR("dynamicResourcePath");
  -[TIKeyboardInputManagerConfig dynamicResourcePath](self, "dynamicResourcePath");
  v6 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v6;
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = &stru_1EA1081D0;
  v43[2] = v7;
  v42[3] = CFSTR("ngramModelPath");
  -[TIKeyboardInputManagerConfig ngramModelPath](self, "ngramModelPath");
  v8 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v8;
  if (v8)
    v9 = (const __CFString *)v8;
  else
    v9 = &stru_1EA1081D0;
  v43[3] = v9;
  v42[4] = CFSTR("allowsSpaceCorrections");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig allowsSpaceCorrections](self, "allowsSpaceCorrections"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v37;
  v42[5] = CFSTR("usesTextChecker");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig usesTextChecker](self, "usesTextChecker"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v36;
  v42[6] = CFSTR("usesRetrocorrection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig usesRetrocorrection](self, "usesRetrocorrection"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v35;
  v42[7] = CFSTR("usesWordNgramModel");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig usesWordNgramModel](self, "usesWordNgramModel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[7] = v34;
  v42[8] = CFSTR("usesAdaptation");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig usesAdaptation](self, "usesAdaptation"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43[8] = v33;
  v42[9] = CFSTR("maxWordsPerPrediction");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[TIKeyboardInputManagerConfig maxWordsPerPrediction](self, "maxWordsPerPrediction"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v43[9] = v32;
  v42[10] = CFSTR("completionsShouldSharePrefix");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig completionsShouldSharePrefix](self, "completionsShouldSharePrefix"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[10] = v31;
  v42[11] = CFSTR("usesContinuousPath");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig usesContinuousPath](self, "usesContinuousPath"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v43[11] = v30;
  v42[12] = CFSTR("usesContinuousPathProgressiveCandidates");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig usesContinuousPathProgressiveCandidates](self, "usesContinuousPathProgressiveCandidates"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v43[12] = v29;
  v42[13] = CFSTR("continuousPathCompletesWords");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig continuousPathCompletesWords](self, "continuousPathCompletesWords"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[13] = v28;
  v42[14] = CFSTR("continuousPathLanguageWeight");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[TIKeyboardInputManagerConfig continuousPathLanguageWeight](self, "continuousPathLanguageWeight");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v43[14] = v11;
  v42[15] = *MEMORY[0x1E0DBE260];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig continuousPathDeleteWholeWord](self, "continuousPathDeleteWholeWord"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[15] = v12;
  v42[16] = *MEMORY[0x1E0DBE268];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig continuousPathDetectPause](self, "continuousPathDetectPause"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43[16] = v13;
  v42[17] = CFSTR("continuousPathParameters");
  -[TIKeyboardInputManagerConfig continuousPathParams](self, "continuousPathParams");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = MEMORY[0x1E0C9AA70];
  if (v14)
    v16 = v14;
  v43[17] = v16;
  v42[18] = CFSTR("insertsSpaceAfterPredictiveInput");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig insertsSpaceAfterPredictiveInput](self, "insertsSpaceAfterPredictiveInput"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v43[18] = v17;
  v42[19] = CFSTR("usesCJContinuousPath");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig usesCJContinuousPath](self, "usesCJContinuousPath"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43[19] = v18;
  v42[20] = CFSTR("testing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig isTesting](self, "isTesting"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v43[20] = v19;
  v42[21] = CFSTR("usesDODMLLogging");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[TIKeyboardInputManagerConfig usesDODMLLogging](self, "usesDODMLLogging"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[21] = v20;
  v42[22] = CFSTR("shapeStoreResourceDir");
  -[TIKeyboardInputManagerConfig shapeStoreResourceDir](self, "shapeStoreResourceDir");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = &stru_1EA1081D0;
  if (v21)
    v23 = (const __CFString *)v21;
  v43[22] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {

  }
  return v24;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (BOOL)usesWordNgramModel
{
  return self->_usesWordNgramModel;
}

- (BOOL)usesAdaptation
{
  return self->_usesAdaptation;
}

- (NSString)dynamicResourcePath
{
  return self->_dynamicResourcePath;
}

- (BOOL)usesTextChecker
{
  return self->_usesTextChecker;
}

- (BOOL)usesRetrocorrection
{
  return self->_usesRetrocorrection;
}

- (BOOL)usesDODMLLogging
{
  return self->_usesDODMLLogging;
}

- (BOOL)usesContinuousPathProgressiveCandidates
{
  return self->_usesContinuousPathProgressiveCandidates;
}

- (BOOL)usesCJContinuousPath
{
  return self->_usesCJContinuousPath;
}

- (NSString)staticDictionaryPath
{
  return self->_staticDictionaryPath;
}

- (NSString)shapeStoreResourceDir
{
  return self->_shapeStoreResourceDir;
}

- (NSString)ngramModelPath
{
  return self->_ngramModelPath;
}

- (unint64_t)maxWordsPerPrediction
{
  return self->_maxWordsPerPrediction;
}

- (NSDictionary)continuousPathParams
{
  return self->_continuousPathParams;
}

- (double)continuousPathLanguageWeight
{
  return self->_continuousPathLanguageWeight;
}

- (BOOL)continuousPathDetectPause
{
  return self->_continuousPathDetectPause;
}

- (BOOL)continuousPathDeleteWholeWord
{
  return self->_continuousPathDeleteWholeWord;
}

- (BOOL)continuousPathCompletesWords
{
  return self->_continuousPathCompletesWords;
}

- (BOOL)completionsShouldSharePrefix
{
  return self->_completionsShouldSharePrefix;
}

- (BOOL)allowsSpaceCorrections
{
  return self->_allowsSpaceCorrections;
}

- (BOOL)disableAnalytics
{
  return self->_disableAnalytics;
}

+ (id)configurationForInputMode:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char IsTransliteration;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;

  v4 = (void *)MEMORY[0x1E0DBDCA8];
  v5 = a3;
  objc_msgSend(v4, "sharedPreferencesController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init((Class)a1);
  objc_msgSend(v7, "setInputMode:", v5);
  objc_msgSend(v7, "inputMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsSpaceCorrections:", objc_msgSend(v8, "spaceAutocorrectionEnabled"));

  objc_msgSend(v7, "inputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsesETSRescoring:", objc_msgSend(v9, "typedStringLMRankingEnabled"));

  objc_msgSend(v5, "normalizedIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  TIGetInputModeProperties();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DBE068]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsesTextChecker:", objc_msgSend(v12, "BOOLValue"));

  if (TIGetKeyboardRetrocorrectionDisabledValue_onceToken != -1)
    dispatch_once(&TIGetKeyboardRetrocorrectionDisabledValue_onceToken, &__block_literal_global_16670);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForPreferenceKey:", CFSTR("KeyboardRetrocorrectionDisabled"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setUsesRetrocorrection:", objc_msgSend(v14, "BOOLValue") ^ 1);
  if (TIGetKeyboardWordNgramModelValue_onceToken != -1)
    dispatch_once(&TIGetKeyboardWordNgramModelValue_onceToken, &__block_literal_global_319);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForPreferenceKey:", CFSTR("KeyboardWordNgramModel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v16, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DBE0D0]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsesWordNgramModel:", objc_msgSend(v17, "BOOLValue"));

  }
  else
  {
    objc_msgSend(v7, "setUsesWordNgramModel:", 0);
  }

  if (TIGetKeyboardWordNgramModelAdaptationValue_onceToken != -1)
    dispatch_once(&TIGetKeyboardWordNgramModelAdaptationValue_onceToken, &__block_literal_global_322);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForPreferenceKey:", CFSTR("KeyboardWordNgramModelAdaptation"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setUsesAdaptation:", objc_msgSend(v19, "BOOLValue"));
  if (TIGetKeyboardMaxWordsPerPredictionValue_onceToken != -1)
    dispatch_once(&TIGetKeyboardMaxWordsPerPredictionValue_onceToken, &__block_literal_global_325);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForPreferenceKey:", CFSTR("KeyboardMaxWordsPerPrediction"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setMaxWordsPerPrediction:", objc_msgSend(v21, "integerValue"));
  if (TIGetKeyboardCompletionsShouldSharePrefixValue_onceToken != -1)
    dispatch_once(&TIGetKeyboardCompletionsShouldSharePrefixValue_onceToken, &__block_literal_global_330);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "valueForPreferenceKey:", CFSTR("KeyboardCompletionsShouldSharePrefix"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setCompletionsShouldSharePrefix:", objc_msgSend(v23, "BOOLValue"));
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DBE168]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsesStemSuffixCorrectionFactor:", objc_msgSend(v24, "BOOLValue"));

  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE2B8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldIgnoreCPRequirements:", objc_msgSend(v25, "BOOLValue"));

  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DBE078]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLanguageAllowsCP:", objc_msgSend(v26, "BOOLValue"));

  if ((objc_msgSend(v7, "languageAllowsCP") & 1) != 0 || objc_msgSend(v7, "shouldIgnoreCPRequirements"))
  {
    objc_msgSend(v7, "setUsesContinuousPath:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE278]));
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DBE090]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContinuousPathParams:", v27);

  }
  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE1E8]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUsesCJContinuousPath:", objc_msgSend(v28, "BOOLValue"));

  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE258]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContinuousPathCompletesWords:", objc_msgSend(v29, "BOOLValue"));

  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE280]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  objc_msgSend(v7, "setContinuousPathLanguageWeight:");

  objc_msgSend(v7, "setContinuousPathDeleteWholeWord:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE260]));
  objc_msgSend(v7, "setContinuousPathDetectPause:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE268]));
  objc_msgSend(v7, "setInsertsSpaceAfterPredictiveInput:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE2E0]));
  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE270]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContinuousPathEnabledAlgorithms:", objc_msgSend(v31, "integerValue"));

  objc_msgSend(v7, "setUsesContinuousPathRetrocorrection:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE290]));
  objc_msgSend(v7, "setUsesContinuousPathProgressiveCandidates:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE288]));
  objc_msgSend(v7, "setUsesDODMLLogging:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE298]));
  objc_msgSend(v7, "setSensorKitEnabled:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE3F8]));
  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE3F0]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSensorKitWordsThreshold:", objc_msgSend(v32, "integerValue"));

  objc_msgSend(v7, "setUsesUserModelLogging:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE440]));
  objc_msgSend(v7, "setAllowRelaxedOVSPolicy:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE1B8]));
  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE1F0]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (!v33)
    v33 = &unk_1EA140528;
  objc_msgSend(v7, "setCpCandidatesCount:", objc_msgSend(v33, "integerValue"));

  objc_msgSend(v7, "setSkipCandidateQualityFilter:", objc_msgSend(v6, "BOOLForPreferenceKey:", *MEMORY[0x1E0DBE410]));
  objc_msgSend(v7, "inputMode");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isSiriMode");

  objc_msgSend(v7, "inputMode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v36)
  {
    UIKeyboardUnigramLexiconPathForInputMode(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v37, "normalizedIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    IsTransliteration = TIInputModeIsTransliteration();
    objc_msgSend(v7, "inputMode");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if ((IsTransliteration & 1) != 0)
      objc_msgSend(v42, "normalizedIdentifier");
    else
      objc_msgSend(v42, "languageWithRegion");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    UIKeyboardStaticUnigramsFile(v44);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v44;
  }
  objc_msgSend(v7, "setStaticDictionaryPath:", v39);

  objc_msgSend(v7, "inputMode");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "languageWithRegion");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  TINgramModelPathForInputMode();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNgramModelPath:", v47);

  UIKeyboardUserDirectory();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDynamicResourcePath:", v48);

  UIKeyboardUserDirectory();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShapeStoreResourceDir:", v49);

  objc_msgSend(v6, "valueForPreferenceKey:", *MEMORY[0x1E0DBE1F8]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCpConfidenceModelType:", objc_msgSend(v50, "integerValue"));

  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0DBE0D8]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncludeLightWeightLanguageModelMobileAssets:", objc_msgSend(v51, "BOOLValue"));

  return v7;
}

- (void)setInputMode:(id)a3
{
  objc_storeStrong((id *)&self->_inputMode, a3);
}

- (void)setStaticDictionaryPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setDynamicResourcePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setNgramModelPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setShapeStoreResourceDir:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setAllowsSpaceCorrections:(BOOL)a3
{
  self->_allowsSpaceCorrections = a3;
}

- (void)setUsesTextChecker:(BOOL)a3
{
  self->_usesTextChecker = a3;
}

- (void)setUsesRetrocorrection:(BOOL)a3
{
  self->_usesRetrocorrection = a3;
}

- (void)setUsesWordNgramModel:(BOOL)a3
{
  self->_usesWordNgramModel = a3;
}

- (void)setUsesAdaptation:(BOOL)a3
{
  self->_usesAdaptation = a3;
}

- (BOOL)negativeLearningDisabled
{
  return self->_negativeLearningDisabled;
}

- (void)setNegativeLearningDisabled:(BOOL)a3
{
  self->_negativeLearningDisabled = a3;
}

- (void)setMaxWordsPerPrediction:(unint64_t)a3
{
  self->_maxWordsPerPrediction = a3;
}

- (void)setCompletionsShouldSharePrefix:(BOOL)a3
{
  self->_completionsShouldSharePrefix = a3;
}

- (BOOL)usesStemSuffixCorrectionFactor
{
  return self->_usesStemSuffixCorrectionFactor;
}

- (void)setUsesStemSuffixCorrectionFactor:(BOOL)a3
{
  self->_usesStemSuffixCorrectionFactor = a3;
}

- (BOOL)usesETSRescoring
{
  return self->_usesETSRescoring;
}

- (void)setUsesETSRescoring:(BOOL)a3
{
  self->_usesETSRescoring = a3;
}

- (BOOL)languageAllowsCP
{
  return self->_languageAllowsCP;
}

- (void)setLanguageAllowsCP:(BOOL)a3
{
  self->_languageAllowsCP = a3;
}

- (void)setUsesContinuousPath:(BOOL)a3
{
  self->_usesContinuousPath = a3;
}

- (void)setContinuousPathParams:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)continuousPathEnsembleSourceWeights
{
  return self->_continuousPathEnsembleSourceWeights;
}

- (void)setContinuousPathEnsembleSourceWeights:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSArray)continuousPathEnsembleSourceScales
{
  return self->_continuousPathEnsembleSourceScales;
}

- (void)setContinuousPathEnsembleSourceScales:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setUsesContinuousPathProgressiveCandidates:(BOOL)a3
{
  self->_usesContinuousPathProgressiveCandidates = a3;
}

- (void)setContinuousPathLanguageWeight:(double)a3
{
  self->_continuousPathLanguageWeight = a3;
}

- (void)setContinuousPathDeleteWholeWord:(BOOL)a3
{
  self->_continuousPathDeleteWholeWord = a3;
}

- (void)setContinuousPathDetectPause:(BOOL)a3
{
  self->_continuousPathDetectPause = a3;
}

- (void)setContinuousPathCompletesWords:(BOOL)a3
{
  self->_continuousPathCompletesWords = a3;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  self->_insertsSpaceAfterPredictiveInput = a3;
}

- (int)continuousPathEnabledAlgorithms
{
  return self->_continuousPathEnabledAlgorithms;
}

- (void)setContinuousPathEnabledAlgorithms:(int)a3
{
  self->_continuousPathEnabledAlgorithms = a3;
}

- (BOOL)usesContinuousPathRetrocorrection
{
  return self->_usesContinuousPathRetrocorrection;
}

- (void)setUsesContinuousPathRetrocorrection:(BOOL)a3
{
  self->_usesContinuousPathRetrocorrection = a3;
}

- (void)setShouldIgnoreCPRequirements:(BOOL)a3
{
  self->_shouldIgnoreCPRequirements = a3;
}

- (int)cpConfidenceModelType
{
  return self->_cpConfidenceModelType;
}

- (void)setCpConfidenceModelType:(int)a3
{
  self->_cpConfidenceModelType = a3;
}

- (int64_t)cpCandidatesCount
{
  return self->_cpCandidatesCount;
}

- (void)setCpCandidatesCount:(int64_t)a3
{
  self->_cpCandidatesCount = a3;
}

- (BOOL)includeLightWeightLanguageModelMobileAssets
{
  return self->_includeLightWeightLanguageModelMobileAssets;
}

- (void)setIncludeLightWeightLanguageModelMobileAssets:(BOOL)a3
{
  self->_includeLightWeightLanguageModelMobileAssets = a3;
}

- (void)setUsesCJContinuousPath:(BOOL)a3
{
  self->_usesCJContinuousPath = a3;
}

- (BOOL)stickerSuggestionsEnabled
{
  return self->_stickerSuggestionsEnabled;
}

- (void)setStickerSuggestionsEnabled:(BOOL)a3
{
  self->_stickerSuggestionsEnabled = a3;
}

- (void)setTesting:(BOOL)a3
{
  self->_testing = a3;
}

- (BOOL)skipLanguageLayoutCheckCPML
{
  return self->_skipLanguageLayoutCheckCPML;
}

- (void)setSkipLanguageLayoutCheckCPML:(BOOL)a3
{
  self->_skipLanguageLayoutCheckCPML = a3;
}

- (void)setUsesCustomNgramModel:(BOOL)a3
{
  self->_usesCustomNgramModel = a3;
}

- (BOOL)usesCustomStaticDictionary
{
  return self->_usesCustomStaticDictionary;
}

- (void)setUsesCustomStaticDictionary:(BOOL)a3
{
  self->_usesCustomStaticDictionary = a3;
}

- (void)setFavoniusLanguageModelWeight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setUsesDODMLLogging:(BOOL)a3
{
  self->_usesDODMLLogging = a3;
}

- (BOOL)sensorKitEnabled
{
  return self->_sensorKitEnabled;
}

- (void)setSensorKitEnabled:(BOOL)a3
{
  self->_sensorKitEnabled = a3;
}

- (unint64_t)sensorKitWordsThreshold
{
  return self->_sensorKitWordsThreshold;
}

- (void)setSensorKitWordsThreshold:(unint64_t)a3
{
  self->_sensorKitWordsThreshold = a3;
}

- (BOOL)allowRelaxedOVSPolicy
{
  return self->_allowRelaxedOVSPolicy;
}

- (void)setAllowRelaxedOVSPolicy:(BOOL)a3
{
  self->_allowRelaxedOVSPolicy = a3;
}

- (BOOL)usesUserModelLogging
{
  return self->_usesUserModelLogging;
}

- (void)setUsesUserModelLogging:(BOOL)a3
{
  self->_usesUserModelLogging = a3;
}

- (BOOL)skipCandidateQualityFilter
{
  return self->_skipCandidateQualityFilter;
}

- (void)setSkipCandidateQualityFilter:(BOOL)a3
{
  self->_skipCandidateQualityFilter = a3;
}

- (void)setDisableAnalytics:(BOOL)a3
{
  self->_disableAnalytics = a3;
}

- (void)setMlttBundleURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mlttBundleURL, 0);
  objc_storeStrong((id *)&self->_favoniusLanguageModelWeight, 0);
  objc_storeStrong((id *)&self->_continuousPathEnsembleSourceScales, 0);
  objc_storeStrong((id *)&self->_continuousPathEnsembleSourceWeights, 0);
  objc_storeStrong((id *)&self->_continuousPathParams, 0);
  objc_storeStrong((id *)&self->_shapeStoreResourceDir, 0);
  objc_storeStrong((id *)&self->_ngramModelPath, 0);
  objc_storeStrong((id *)&self->_dynamicResourcePath, 0);
  objc_storeStrong((id *)&self->_staticDictionaryPath, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
}

@end
