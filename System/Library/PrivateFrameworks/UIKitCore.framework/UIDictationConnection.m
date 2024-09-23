@implementation UIDictationConnection

- (BOOL)dictationIsAvailableForLanguage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationConnection connection](self, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "dictationIsAvailableForLanguage:", v5);

  return (char)v4;
}

- (AFDictationConnection)connection
{
  AFDictationConnection *connection;
  AFDictationConnection **p_connection;
  UIDictationConnection *v5;
  id v6;
  id v7;
  uint64_t v8;
  OS_dispatch_queue *analyticsQueue;

  p_connection = &self->_connection;
  connection = self->_connection;
  if (!connection)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (!self->_connection)
    {
      v6 = objc_alloc_init((Class)getAFDictationConnectionClass());
      if (v6)
      {
        objc_storeStrong((id *)p_connection, v6);
        -[AFDictationConnection setDelegate:](*p_connection, "setDelegate:", v5);
        v7 = (id)objc_msgSend((id)objc_opt_class(), "analytics");
        dispatch_get_global_queue(9, 0);
        v8 = objc_claimAutoreleasedReturnValue();
        analyticsQueue = v5->_analyticsQueue;
        v5->_analyticsQueue = (OS_dispatch_queue *)v8;

      }
    }
    objc_sync_exit(v5);

    connection = *p_connection;
  }
  return connection;
}

- (void)setTokenFilter:(id)a3
{
  objc_storeWeak((id *)&self->_tokenFilter, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)analytics
{
  if (qword_1ECD7EDF8 != -1)
    dispatch_once(&qword_1ECD7EDF8, &__block_literal_global_330);
  return (id)_MergedGlobals_1122;
}

+ (BOOL)dictationIsSupportedForLanguageCode:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v17;
  const __CFString *v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (cachedDictationLanguageCodes)
  {
    v7 = objc_msgSend((id)cachedDictationLanguageCodes, "containsObject:", v6);
LABEL_6:

    LOBYTE(v9) = v7;
    return (char)v9;
  }
  v17 = 0;
  v7 = objc_msgSend(getAFDictationConnectionClass(), "dictationIsSupportedForLanguageCode:error:", v6, &v17);
  v8 = v17;
  if (a4 || (v7 & 1) != 0)
  {

    goto LABEL_6;
  }
  v10 = v8;
  v11 = objc_msgSend(v8, "code");
  v12 = (void *)MEMORY[0x1E0CB35C8];
  if (v11 == 402)
  {
    v20 = CFSTR("UIDictationConnectionUnderlyingError");
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v15 = 1;
  }
  else
  {
    v18 = CFSTR("UIDictationConnectionUnderlyingError");
    v19 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v12;
    v15 = -1;
  }
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("UIDictationConnection"), v15, v13);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  __break(1u);
  return (char)v9;
}

+ (BOOL)dictationRestricted
{
  void *v2;
  void *v3;
  BOOL result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getAFDictationRestrictedSymbolLoc_ptr_0;
  v10 = getAFDictationRestrictedSymbolLoc_ptr_0;
  if (!getAFDictationRestrictedSymbolLoc_ptr_0)
  {
    v3 = AssistantServicesLibrary_0();
    v2 = dlsym(v3, "AFDictationRestricted");
    v8[3] = (uint64_t)v2;
    getAFDictationRestrictedSymbolLoc_ptr_0 = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (v2)
    return ((uint64_t (*)(void))v2)();
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _AFDictationRestricted(void)");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("UIDictationConnection.m"), 63, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (void)beginAvailabilityMonitoring
{
  id v2;

  -[UIDictationConnection connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginAvailabilityMonitoring");

}

- (void)cancelAvailabilityMonitoring
{
  id v2;

  -[UIDictationConnection connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelAvailabilityMonitoring");

}

- (void)dictationConnnectionDidChangeAvailability:(id)a3
{
  id WeakRetained;

  if (self->_connection == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnnectionDidChangeAvailability:", self);

  }
}

+ (BOOL)isDictationAvailable
{
  return getAFDictationConnectionClass() != 0;
}

void __34__UIDictationConnection_analytics__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)qword_1ECD7EE20;
  v8 = qword_1ECD7EE20;
  if (!qword_1ECD7EE20)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getAFAnalyticsClass_block_invoke;
    v4[3] = &unk_1E16B14C0;
    v4[4] = &v5;
    __getAFAnalyticsClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "sharedAnalytics");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_1122;
  _MergedGlobals_1122 = v2;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedPartials, 0);
  objc_storeStrong((id *)&self->_lastUsedTopLanguages, 0);
  objc_storeStrong((id *)&self->_lastUsedDetectedLanguage, 0);
  objc_storeStrong((id *)&self->_lastUsedPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dictationOptions, 0);
  objc_destroyWeak((id *)&self->_tokenFilter);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sendSpeechCorrection:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v10 = objc_alloc_init((Class)getAFSpeechCorrectionInfoClass());
  objc_msgSend(v10, "setAlternativeSelectionCount:", (int)objc_msgSend(v7, "alternativeSelectionCount"));
  objc_msgSend(v10, "setCharacterModificationCount:", (int)objc_msgSend(v7, "characterModificationCount"));
  objc_msgSend(v7, "correctedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCorrectedText:", v8);
  -[UIDictationConnection connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSpeechCorrection:forIdentifier:", v10, v6);

}

- (void)sendSpeechCorrection:(id)a3 interactionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v12 = objc_alloc_init((Class)getAFSpeechCorrectionInfoClass());
  objc_msgSend(v12, "setAlternativeSelectionCount:", (int)objc_msgSend(v7, "alternativeSelectionCount"));
  objc_msgSend(v12, "setCharacterModificationCount:", (int)objc_msgSend(v7, "characterModificationCount"));
  objc_msgSend(v12, "setCharacterInsertionCount:", (int)objc_msgSend(v7, "characterInsertionCount"));
  objc_msgSend(v12, "setCharacterDeletionCount:", (int)objc_msgSend(v7, "characterDeletionCount"));
  objc_msgSend(v12, "setCharacterSubstitutionCount:", (int)objc_msgSend(v7, "characterSubstitutionCount"));
  objc_msgSend(v7, "correctedText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCorrectedText:", v8);

  objc_msgSend(v7, "recognizedTextInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRecognizedTextInfo:", v9);

  objc_msgSend(v7, "selectedAlternativesInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSelectedAlternativesInfo:", v10);
  -[UIDictationConnection connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendSpeechCorrection:interactionIdentifier:", v12, v6);

}

- (float)averagePower
{
  void *v2;
  float v3;
  float v4;

  -[UIDictationConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "averagePower");
  v4 = v3;

  return v4;
}

+ (void)cacheSupportedDictationLanguages
{
  objc_msgSend(getAFDictationConnectionClass(), "fetchSupportedLanguageCodes:", &__block_literal_global_72_2);
}

void __57__UIDictationConnection_cacheSupportedDictationLanguages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;

  if (a2)
  {
    v2 = objc_msgSend(a2, "copy");
    v3 = (void *)cachedDictationLanguageCodes;
    cachedDictationLanguageCodes = v2;

  }
}

- (void)endSession
{
  id v2;

  -[UIDictationConnection connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endSession");

}

- (void)pauseSpeechRecognition
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_ignoreSpeechRecognitionResults = 1;
  _UIDictationConnectionLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[UIDictationConnection pauseSpeechRecognition]";
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting _ignoreSpeechRecognitionResults to YES and calling pauseRecognition", (uint8_t *)&v5, 0xCu);
  }

  -[UIDictationConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pauseRecognition");

}

- (void)resumeSpeechRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIDictationConnection connection](self, "connection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resumeRecognitionWithPrefixText:postfixText:selectedText:", v10, v9, v8);

}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[UIDictationConnection connection](self, "connection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "suppressLowStorageNotificationForLanguage:suppress:", v6, v4);

}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  char v22;
  void *v23;
  id v24;

  v24 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  -[UIDictationConnection connection](self, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[UIDictationConnection connection](self, "connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:", v24, v15, v16, v17, v18, v19, v20);

  }
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;

  v24 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (-[UIDictationConnection supportNewVoiceEditingCommandSPI](self, "supportNewVoiceEditingCommandSPI"))
  {
    -[UIDictationConnection connection](self, "connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", v24, v16, v17, v18, v19, v20, v21, v22);

  }
}

- (BOOL)supportNewVoiceEditingCommandSPI
{
  void *v2;
  char v3;

  -[UIDictationConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[UIDictationConnection connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v6)
    v9 = v6;
  else
    v9 = &__block_literal_global_76;
  objc_msgSend(v8, "requestOfflineDictationSupportForLanguage:completion:", v7, v9);

}

+ (void)afDelegate:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7
{
  objc_msgSend(a3, "dictationConnection:didReceiveSearchResults:recognizedText:stable:final:", 0, a4, a5, a6, a7);
}

+ (void)_updateFromGlobalOptions:(id)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = qword_1ECD7EE08;
  v5 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ECD7EE08, &__block_literal_global_77);
  +[UIKeyboard keyboardBundleIdentifier](UIKeyboard, "keyboardBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setApplicationName:", v4);

  objc_msgSend(v5, "setApplicationVersion:", qword_1ECD7EE00);
  objc_msgSend(v5, "setReleaseAudioSessionOnRecordingCompletion:", 0);

}

void __50__UIDictationConnection__updateFromGlobalOptions___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ECD7EE00;
  qword_1ECD7EE00 = v1;

}

- (id)languageDetectionUserContext
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  id v8;
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSmartLanguageSelectionEnabled");

  if (!v3)
    return 0;
  +[UIDictationController activeSLSDictationLanguages](UIDictationController, "activeSLSDictationLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v6 = (void *)getAFLanguageDetectionUserContextClass_softClass;
    v33 = getAFLanguageDetectionUserContextClass_softClass;
    if (!getAFLanguageDetectionUserContextClass_softClass)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __getAFLanguageDetectionUserContextClass_block_invoke;
      v29[3] = &unk_1E16B14C0;
      v29[4] = &v30;
      __getAFLanguageDetectionUserContextClass_block_invoke((uint64_t)v29);
      v6 = (void *)v31[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v30, 8);
    v8 = objc_alloc_init(v7);
    objc_msgSend(v8, "setDictationLanguages:", v4);
    +[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferencesActions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inputModeSelectionSequence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setWasLanguageToggled:", (unint64_t)objc_msgSend(v11, "count") < 3);
    objc_msgSend(v5, "currentInputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictationLanguage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrimaryLanguageCode:", v13);

    objc_msgSend(v5, "currentInputMode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "multilingualLanguages");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMultiLingualKeyboardLanguages:", v15);

    objc_msgSend(v5, "currentInputModeInPreference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    TIInputModeGetLanguageWithRegion();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setGlobalLastUsedKeyboard:", v18);

    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "textInputTraits");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "keyboardType");

    if (v21 == 126)
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastMessageKeyboardLanguage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "textInputTraits");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "inputContextHistory");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "mostRecentTextEntries:", 10);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setKeyboardConvoRecentMessages:", v27);

      objc_msgSend(v8, "setPrevMessageLanguage:", v23);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_dictationOptions:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[3];
  _QWORD v38[4];

  v38[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v5 = (void *)getAFDictationOptionsClass_softClass;
  v36 = getAFDictationOptionsClass_softClass;
  if (!getAFDictationOptionsClass_softClass)
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __getAFDictationOptionsClass_block_invoke;
    v32[3] = &unk_1E16B14C0;
    v32[4] = &v33;
    __getAFDictationOptionsClass_block_invoke((uint64_t)v32);
    v5 = (void *)v34[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v33, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend((id)objc_opt_class(), "_updateFromGlobalOptions:", v7);
  objc_msgSend(v7, "setFieldLabel:", &stru_1E16EDF20);
  objc_msgSend(v4, "fieldIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFieldIdentifier:", v8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "layoutIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyboardIdentifier:", v9);

  }
  v10 = objc_msgSend(v4, "keyboardType");
  switch(v10)
  {
    case 1:
      v11 = 2;
      break;
    case 2:
      goto LABEL_8;
    case 3:
      v11 = 7;
      break;
    case 4:
      v11 = 5;
      break;
    case 5:
      v11 = 9;
      break;
    case 6:
      v11 = 10;
      break;
    case 7:
      v11 = 8;
      break;
    case 8:
      v11 = 6;
      break;
    case 9:
      v11 = 11;
      break;
    case 10:
      v11 = 12;
      break;
    case 11:
      v11 = 14;
      break;
    default:
      if (v10 == 123)
LABEL_8:
        v11 = 4;
      else
        v11 = 1;
      break;
  }
  objc_msgSend(v7, "setKeyboardType:", v11);
  v12 = objc_msgSend(v4, "returnKeyType");
  if (v12 > 0xB)
    v13 = 0;
  else
    v13 = qword_186680818[v12];
  objc_msgSend(v7, "setReturnKeyType:", v13);
  if (objc_msgSend(v7, "returnKeyType") != 7
    && +[UIDictationController isInputDelegateSafariAddressBar](UIDictationController, "isInputDelegateSafariAddressBar"))
  {
    objc_msgSend(v7, "setReturnKeyType:", 7);
  }
  objc_msgSend(v7, "setSecureOfflineOnly:", objc_msgSend(v4, "secureInput"));
  if (objc_msgSend(v4, "acceptsDictationSearchResults"))
    objc_msgSend(v7, "setVoiceSearchTypeOptions:", 1);
  objc_msgSend(v4, "prefixText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrefixText:", v14);

  objc_msgSend(v4, "postfixText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPostfixText:", v15);

  objc_msgSend(v4, "selectedText");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelectedText:", v16);

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictationRequestOrigin");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDictationInputOrigin:", objc_msgSend((id)v18, "integerValue"));

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v18) = objc_msgSend(v19, "smartLanguageSelectionOverridden");

  if ((v18 & 1) == 0)
  {
    -[UIDictationConnection languageDetectionUserContext](self, "languageDetectionUserContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLanguageDetectionUserContext:", v20);

  }
  objc_msgSend(v7, "setPreferOnlineRecognition:", +[UIDictationController shouldPreferOnlineRecognition](UIDictationController, "shouldPreferOnlineRecognition"));
  objc_msgSend(v7, "setPreferOnDeviceRecognition:", +[UIDictationController shouldPreferOnDeviceRecognition](UIDictationController, "shouldPreferOnDeviceRecognition"));
  if ((objc_msgSend(v7, "preferOnlineRecognition") & 1) == 0)
  {
    objc_msgSend(v7, "languageDetectionUserContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
LABEL_31:

      goto LABEL_42;
    }
    if (objc_msgSend(v7, "returnKeyType") != 7)
    {
      +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "languageCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isOnDeviceDictationSupportAvailableForLanguage:", v23);

      objc_msgSend(v7, "setEmojiRecognition:", v24);
      if (_os_feature_enabled_impl())
      {
        objc_msgSend(v7, "setDetectUtterances:", 1);
        objc_msgSend(v7, "setContinuousListening:", 1);
        objc_msgSend(v7, "setShouldHandleCapitalization:", 1);
        if ((_DWORD)v24)
          v25 = objc_msgSend(v4, "shouldRecognizeCommands");
        else
          v25 = 0;
        objc_msgSend(v7, "setShouldRecognizeCommands:", v25);
        objc_msgSend(v7, "setMaximumRecognitionDuration:", -1.0);
      }
      if (+[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled")
        && !+[UIDictationController supportsSiriDictationVoiceCommands](UIDictationController, "supportsSiriDictationVoiceCommands")&& _os_feature_enabled_impl())
      {
        v37[0] = CFSTR("decoders.msg.lattice-biglm-lme-faster.inter-utt-sil");
        objc_msgSend(&unk_1E1A985F8, "stringValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v21;
        v37[1] = CFSTR("decoders.msg.lattice-biglm-lme-faster.max-utt-length");
        objc_msgSend(&unk_1E1A98610, "stringValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v26;
        v37[2] = CFSTR("decoders.msg.lattice-biglm-lme-faster.max-utt-sil");
        objc_msgSend(&unk_1E1A98628, "stringValue");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38[2] = v27;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setRecognitionOverrides:", v28);

        goto LABEL_31;
      }
    }
  }
LABEL_42:
  if (objc_msgSend(v7, "returnKeyType") != 7)
    objc_msgSend(v7, "setAutoPunctuation:", objc_msgSend(v4, "autoPunctuation"));
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "interactionIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteractionIdentifier:", v30);

  return v7;
}

- (int64_t)speechEventTypeForDictationActivationType:(unint64_t)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_186680878[a3];
}

- (id)_speechOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)getAFSpeechRequestOptionsClass()), "initWithActivationEvent:", -[UIDictationConnection speechEventTypeForDictationActivationType:](self, "speechEventTypeForDictationActivationType:", objc_msgSend(v4, "activationType")));
  objc_msgSend(v5, "setUseStreamingDictation:", 1);
  if (objc_msgSend(v4, "useAutomaticEndpointing"))
  {
    if (objc_msgSend(v4, "secureInput"))
      v6 = 0;
    else
      v6 = 3;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v5, "setEndpointerOperationMode:", v6);
  objc_msgSend(v4, "activationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActivationDeviceIdentifier:", v7);

  objc_msgSend(v4, "turnIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTurnIdentifier:", v8);

  return v5;
}

- (id)_createConnectionOptions
{
  UIDictationConnectionOptions *v3;
  id WeakRetained;

  v3 = objc_alloc_init(UIDictationConnectionOptions);
  -[UIDictationConnectionOptions setVersion:](v3, "setVersion:", 1);
  -[UIDictationConnectionOptions setActivationType:](v3, "setActivationType:", 0);
  -[UIDictationConnectionOptions setLanguageCode:](v3, "setLanguageCode:", 0);
  -[UIDictationConnectionOptions setRegionCode:](v3, "setRegionCode:", 0);
  -[UIDictationConnectionOptions setFieldIdentifier:](v3, "setFieldIdentifier:", &stru_1E16EDF20);
  -[UIDictationConnectionOptions setActivationIdentifier:](v3, "setActivationIdentifier:", 0);
  -[UIDictationConnectionOptions setLayoutIdentifier:](v3, "setLayoutIdentifier:", 0);
  -[UIDictationConnectionOptions setKeyboardType:](v3, "setKeyboardType:", 0);
  -[UIDictationConnectionOptions setReturnKeyType:](v3, "setReturnKeyType:", 0);
  -[UIDictationConnectionOptions setSecureInput:](v3, "setSecureInput:", 0);
  -[UIDictationConnectionOptions setUseAutomaticEndpointing:](v3, "setUseAutomaticEndpointing:", 1);
  -[UIDictationConnectionOptions setAcceptsDictationSearchResults:](v3, "setAcceptsDictationSearchResults:", 0);
  -[UIDictationConnectionOptions setPrefixText:](v3, "setPrefixText:", 0);
  -[UIDictationConnectionOptions setSelectedText:](v3, "setSelectedText:", 0);
  -[UIDictationConnectionOptions setPostfixText:](v3, "setPostfixText:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dictationConnection:updateOptions:", self, v3);

  self->_offlineOnly = -[UIDictationConnectionOptions secureInput](v3, "secureInput");
  return v3;
}

- (void)start
{
  void *v3;
  void *WeakRetained;
  void *v5;
  void *v6;
  id v7;

  -[UIDictationConnection _createConnectionOptions](self, "_createConnectionOptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDictationConnection _initializeWithOptions:](self, "_initializeWithOptions:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnection:didFailRecordingWithError:", self, v3);
  }
  else
  {
    +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_charBeforeInsertionPointOnDictationStart = objc_msgSend(v5, "_characterBeforeCaretSelection");

    objc_msgSend(WeakRetained, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_charAfterInsertionPointOnDictationStart = objc_msgSend(v6, "_characterAfterCaretSelection");

    -[UIDictationConnection _startWithOptions:](self, "_startWithOptions:", v7);
  }

}

- (void)startForFileAtURL:(id)a3 forLanguage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *WeakRetained;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[UIDictationConnection _createConnectionOptions](self, "_createConnectionOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationConnection _initializeWithOptions:](self, "_initializeWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnection:didFailRecordingWithError:", self, v8);
  }
  else
  {
    -[UIDictationConnection _dictationOptions:](self, "_dictationOptions:", v7);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    -[UIDictationConnection connection](self, "connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDictationWithSpeechFileAtURL:options:forLanguage:", v11, WeakRetained, v6);

  }
}

- (id)_initializeWithOptions:(id)a3
{
  void *v3;
  void *v4;

  -[UIDictationConnection connection](self, "connection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UIDictationConnection"), 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (void)_startWithOptions:(id)a3
{
  id v4;
  void *v5;
  int v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  _BOOL8 v52;
  void *v53;
  NSObject *v54;
  void *v55;
  int v56;
  void *v57;
  int v58;
  NSObject *v59;
  _BOOL4 ignoreSpeechRecognitionResults;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  const __CFString *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  const __CFString *v72;
  _QWORD v73[4];
  _QWORD v74[6];

  v74[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "smartLanguageSelectionOverridden");

  if (v6)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString smartLanguageSelectionOverrideLanguage](v7, "smartLanguageSelectionOverrideLanguage");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "languageCode");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v4, "regionCode");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (-[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("ko"))
      && -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("KO")))
    {

      v7 = CFSTR("KR");
    }
    else if (!v7)
    {
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v11, v7);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  v11 = (__CFString *)v8;
LABEL_12:
  objc_msgSend(v4, "setLanguageCode:", v11);
  -[UIDictationConnection _dictationOptions:](self, "_dictationOptions:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationConnection setDictationOptions:](self, "setDictationOptions:", v13);

  -[UIDictationConnection _speechOptions:](self, "_speechOptions:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "reasonType");

  +[UIDictationController UIDictationStartStopReasonTypeDescription:](UIDictationController, "UIDictationStartStopReasonTypeDescription:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (const __CFString *)v17;
  else
    v19 = &stru_1E16EDF20;
  v74[0] = v19;
  v73[0] = CFSTR("startDictation");
  v73[1] = CFSTR("leftContext");
  objc_msgSend(v4, "prefixText");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v20)
    v22 = (const __CFString *)v20;
  else
    v22 = &stru_1E16EDF20;
  v74[1] = v22;
  v73[2] = CFSTR("rightContext");
  objc_msgSend(v4, "postfixText");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (const __CFString *)v23;
  else
    v25 = &stru_1E16EDF20;
  v74[2] = v25;
  v73[3] = CFSTR("selectedText");
  objc_msgSend(v4, "selectedText");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  if (v26)
    v28 = (const __CFString *)v26;
  else
    v28 = &stru_1E16EDF20;
  v74[3] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v14;
  objc_msgSend(v14, "setStartContext:", v29);

  _UIDictationConnectionLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    -[UIDictationConnection dictationOptions](self, "dictationOptions");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "preferOnlineRecognition"))
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    *(_DWORD *)buf = 136315394;
    v66 = "-[UIDictationConnection _startWithOptions:]";
    v67 = 2112;
    v68 = v32;
    _os_log_impl(&dword_185066000, v30, OS_LOG_TYPE_DEFAULT, "%s shouldPreferOnlineRecognition=%@", buf, 0x16u);

  }
  -[UIDictationConnection dictationOptions](self, "dictationOptions");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "languageDetectionUserContext");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "userContextLanguageCodeForKeyboardLangauge:overrideLanguageCode:", v11, 0);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35)
    v37 = (void *)v35;
  else
    v37 = v11;
  v38 = v37;

  objc_msgSend(v38, "componentsSeparatedByString:", CFSTR("-"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "componentsJoinedByString:", CFSTR("_"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIDictationConnection setLastUsedPrimaryLanguage:](self, "setLastUsedPrimaryLanguage:", v40);
  -[UIDictationConnection setLastUsedDetectedLanguage:](self, "setLastUsedDetectedLanguage:", 0);
  -[UIDictationConnection setLastUsedTopLanguages:](self, "setLastUsedTopLanguages:", 0);
  -[UIDictationConnection setLowConfidenceAboutLanguageDetection:](self, "setLowConfidenceAboutLanguageDetection:", 0);
  -[UIDictationConnection setReceivedMultilingualResultsCommand:](self, "setReceivedMultilingualResultsCommand:", 0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationConnection setLastReceivedPartials:](self, "setLastReceivedPartials:", v41);

  _UIDictationConnectionLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    -[UIDictationConnection dictationOptions](self, "dictationOptions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "languageDetectionUserContext");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v45 = CFSTR("YES");
    if (v44)
      v45 = CFSTR("NO");
    v66 = "-[UIDictationConnection _startWithOptions:]";
    v67 = 2112;
    v68 = v11;
    v69 = 2112;
    v70 = v40;
    v71 = 2112;
    v72 = v45;
    _os_log_impl(&dword_185066000, v42, OS_LOG_TYPE_DEFAULT, "%s languageCode %@ siriDictationWithLanguageCode %@ monolingual %@", buf, 0x2Au);

  }
  +[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "isOnDeviceDictationSupportAvailableForLanguage:", v11);
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setIsCurrentDictationLanguageOnDevice:", v47);

  -[UIDictationConnection dictationOptions](self, "dictationOptions");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v49, "detectUtterances") & 1) != 0)
  {
    +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isCurrentDictationLanguageOnDevice");

    if (v51)
    {
      v52 = +[UIKeyboard isMajelEnabled](UIKeyboard, "isMajelEnabled");
      +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setUsingTypeAndTalk:", v52);

      _UIDictationConnectionLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "usingTypeAndTalk");
        *(_DWORD *)buf = 136315394;
        v66 = "-[UIDictationConnection _startWithOptions:]";
        v67 = 1024;
        LODWORD(v68) = v56;
        _os_log_impl(&dword_185066000, v54, OS_LOG_TYPE_DEFAULT, "%s usingTypeAndTalk = %d", buf, 0x12u);

      }
      goto LABEL_43;
    }
  }
  else
  {

  }
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "usingTypeAndTalk");

  if (!v58)
    goto LABEL_44;
  +[UIKeyboardInputMode dictationInputMode](UIKeyboardInputMode, "dictationInputMode");
  v54 = objc_claimAutoreleasedReturnValue();
  -[NSObject setUsingTypeAndTalk:](v54, "setUsingTypeAndTalk:", 0);
LABEL_43:

LABEL_44:
  _UIDictationConnectionLog();
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
    *(_DWORD *)buf = 136315394;
    v66 = "-[UIDictationConnection _startWithOptions:]";
    v67 = 1024;
    LODWORD(v68) = ignoreSpeechRecognitionResults;
    _os_log_impl(&dword_185066000, v59, OS_LOG_TYPE_DEFAULT, "%s Setting _ignoreSpeechRecognitionResults=%d", buf, 0x12u);
  }

  self->_ignoreSpeechRecognitionResults = 0;
  _UIDictationConnectionLog();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v66 = "-[UIDictationConnection _startWithOptions:]";
    _os_log_impl(&dword_185066000, v61, OS_LOG_TYPE_DEFAULT, "%s Calling startDictationWithLanguageCode on delegate", buf, 0xCu);
  }

  -[UIDictationConnection connection](self, "connection");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationConnection dictationOptions](self, "dictationOptions");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "startDictationWithLanguageCode:options:speechOptions:", v11, v63, v64);

}

- (void)stopSpeech:(id)a3 activationType:(unint64_t)a4 result:(id)a5 suppressAlert:(BOOL)a6
{
  _BOOL4 v6;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v6 = a6;
  v24[1] = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a3;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc((Class)getAFSpeechRequestOptionsClass()), "initWithActivationEvent:", -[UIDictationConnection speechEventTypeForDictationActivationType:](self, "speechEventTypeForDictationActivationType:", a4));
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "setSuppressStopAlert:", 1);
  v23 = CFSTR("stopDictation");
  v24[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStopContext:", v13);

  if (v11)
  {
    v14 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v12, "stopContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryWithDictionary:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v17 = v10;
    else
      v17 = &stru_1E16EDF20;
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("submitDictation"));
    +[UIDictationController removeTextIfNeeded:](UIDictationController, "removeTextIfNeeded:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
      v20 = (const __CFString *)v18;
    else
      v20 = &stru_1E16EDF20;
    objc_msgSend(v16, "setObject:forKey:", v20, CFSTR("recognitionResult"));

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setStopContext:", v21);

  }
  -[UIDictationConnection connection](self, "connection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stopSpeechWithOptions:", v12);

}

- (void)cancelSpeech
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *analyticsQueue;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "reasonType");

  if (v4 == 20)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastHypothesis");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyboardInputModeToReturn");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "primaryLanguage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interactionIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    analyticsQueue = self->_analyticsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__UIDictationConnection_cancelSpeech__block_invoke;
    block[3] = &unk_1E16B47A8;
    v18 = v6;
    v19 = v9;
    v20 = v11;
    v13 = v11;
    v14 = v9;
    v15 = v6;
    dispatch_async(analyticsQueue, block);

  }
  -[UIDictationConnection connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cancelSpeech");

}

void __37__UIDictationConnection_cancelSpeech__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  +[UIDictationController UIDictationStartStopReasonTypeDescription:](UIDictationController, "UIDictationStartStopReasonTypeDescription:", 20);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (const __CFString *)v2;
  else
    v4 = &stru_1E16EDF20;
  v13[0] = CFSTR("stopDictation");
  v13[1] = CFSTR("submitDictation");
  v14[0] = v4;
  v14[1] = v4;
  v13[2] = CFSTR("recognitionResult");
  +[UIDictationController removeTextIfNeeded:](UIDictationController, "removeTextIfNeeded:", a1[4]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E16EDF20;
  v8 = (const __CFString *)a1[5];
  v9 = (const __CFString *)a1[6];
  if (!v8)
    v8 = &stru_1E16EDF20;
  v14[2] = v7;
  v14[3] = v8;
  v13[3] = 0x1E1747BA0;
  v13[4] = CFSTR("dictationUIInteractionIdentifier");
  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E16EDF20;
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIDictationConnection analytics](UIDictationConnection, "analytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logEventWithType:context:", 2202, v11);

}

- (void)logDidShowAlternatives:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *analyticsQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__UIDictationConnection_logDidShowAlternatives_correctionIdentifier_interactionIdentifier___block_invoke;
  block[3] = &unk_1E16B47A8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(analyticsQueue, block);

}

void __91__UIDictationConnection_logDidShowAlternatives_correctionIdentifier_interactionIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (v1)
  {
    v12[0] = CFSTR("alternatesShown");
    v12[1] = CFSTR("correctionIdentifier");
    v2 = MEMORY[0x1E0C9AA70];
    v3 = (const __CFString *)a1[6];
    if (a1[5])
      v2 = a1[5];
    v13[0] = v1;
    v13[1] = v2;
    if (v3)
      v4 = v3;
    else
      v4 = &stru_1E16EDF20;
    v13[2] = v4;
    v12[2] = CFSTR("dictationUIInteractionIdentifier");
    v12[3] = 0x1E1747BA0;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryLanguage");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E16EDF20;
    v13[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationConnection analytics](UIDictationConnection, "analytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logEventWithType:context:", 2202, v10);

  }
}

- (void)logDidSelectAlternative:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *analyticsQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__UIDictationConnection_logDidSelectAlternative_correctionIdentifier_interactionIdentifier___block_invoke;
  block[3] = &unk_1E16B47A8;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(analyticsQueue, block);

}

void __92__UIDictationConnection_logDidSelectAlternative_correctionIdentifier_interactionIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (v1)
  {
    v12[0] = CFSTR("alternateSelected");
    v12[1] = CFSTR("correctionIdentifier");
    v2 = MEMORY[0x1E0C9AA70];
    v3 = (const __CFString *)a1[6];
    if (a1[5])
      v2 = a1[5];
    v13[0] = v1;
    v13[1] = v2;
    if (v3)
      v4 = v3;
    else
      v4 = &stru_1E16EDF20;
    v13[2] = v4;
    v12[2] = CFSTR("dictationUIInteractionIdentifier");
    v12[3] = 0x1E1747BA0;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentInputMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primaryLanguage");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E16EDF20;
    v13[3] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIDictationConnection analytics](UIDictationConnection, "analytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logEventWithType:context:", 2202, v10);

  }
}

- (void)logDidAcceptDictationResult:(id)a3 reason:(id)a4 result:(id)a5 correctionIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *analyticsQueue;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!objc_msgSend(v10, "count"))
  {
    v14 = 0;
    goto LABEL_6;
  }
  +[UIDictationController whitelistedDictationDictionariesFromMetadataDictionaries:](UIDictationController, "whitelistedDictationDictionariesFromMetadataDictionaries:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_6:
    v20 = 0;
    v15 = 0;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = (void *)MEMORY[0x1E0CB3710];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "unarchivedObjectOfClasses:fromData:error:", v19, v15, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)v19;
  }
  else
  {
    v20 = 0;
  }
LABEL_8:

  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__UIDictationConnection_logDidAcceptDictationResult_reason_result_correctionIdentifier___block_invoke;
  block[3] = &unk_1E16B51E8;
  v29 = v20;
  v30 = v11;
  v31 = v12;
  v32 = v13;
  v22 = v13;
  v23 = v12;
  v24 = v11;
  v25 = v20;
  dispatch_async(analyticsQueue, block);

}

void __88__UIDictationConnection_logDidAcceptDictationResult_reason_result_correctionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(const __CFString **)(a1 + 40);
    if (!v3)
      v3 = &stru_1E16EDF20;
    v31[0] = v3;
    v30[0] = CFSTR("submitDictation");
    v30[1] = CFSTR("recognitionResult");
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIDictationController removeTextIfNeeded:metadata:](UIDictationController, "removeTextIfNeeded:metadata:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (const __CFString *)v6;
    else
      v8 = &stru_1E16EDF20;
    v9 = *(_QWORD *)(a1 + 32);
    v31[1] = v8;
    v31[2] = v9;
    v30[2] = CFSTR("edits");
    v30[3] = 0x1E1747BA0;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentInputMode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "primaryLanguage");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = &stru_1E16EDF20;
    v31[3] = v14;
    v30[4] = CFSTR("dictationUIInteractionIdentifier");
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "interactionIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
      v18 = (const __CFString *)v16;
    else
      v18 = &stru_1E16EDF20;
    v31[4] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28[0] = CFSTR("submitDictation");
    v28[1] = CFSTR("recognitionResult");
    v20 = *(const __CFString **)(a1 + 40);
    v21 = *(const __CFString **)(a1 + 48);
    if (!v20)
      v20 = &stru_1E16EDF20;
    if (!v21)
      v21 = &stru_1E16EDF20;
    v29[0] = v20;
    v29[1] = v21;
    v22 = *(_QWORD *)(a1 + 56);
    if (!v22)
      v22 = MEMORY[0x1E0C9AA70];
    v29[2] = v22;
    v28[2] = CFSTR("correctionIdentifier");
    v28[3] = 0x1E1747BA0;
    +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentInputMode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "primaryLanguage");
    v23 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v23;
    if (v23)
      v24 = (const __CFString *)v23;
    else
      v24 = &stru_1E16EDF20;
    v29[3] = v24;
    v28[4] = CFSTR("dictationUIInteractionIdentifier");
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "interactionIdentifier");
    v25 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v25;
    if (v25)
      v26 = (const __CFString *)v25;
    else
      v26 = &stru_1E16EDF20;
    v29[4] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[UIDictationConnection analytics](UIDictationConnection, "analytics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "logEventWithType:context:", 2202, v19);

}

- (void)logDidAcceptReplacement:(id)a3 replacementLanguageCode:(id)a4 originalText:(id)a5 correctionIdentifier:(id)a6 interactionIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *analyticsQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __129__UIDictationConnection_logDidAcceptReplacement_replacementLanguageCode_originalText_correctionIdentifier_interactionIdentifier___block_invoke;
  block[3] = &unk_1E16B6F18;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(analyticsQueue, block);
  -[UIDictationConnection connection](self, "connection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "sendUserSelectedAlternativeDictationLanguageCode:", v21);

}

void __129__UIDictationConnection_logDidAcceptReplacement_replacementLanguageCode_originalText_correctionIdentifier_interactionIdentifier___block_invoke(_QWORD *a1)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("text");
  v16[1] = CFSTR("languageCode");
  v2 = (const __CFString *)a1[4];
  v3 = (const __CFString *)a1[5];
  if (!v2)
    v2 = &stru_1E16EDF20;
  if (!v3)
    v3 = &stru_1E16EDF20;
  v17[0] = v2;
  v17[1] = v3;
  v16[2] = CFSTR("originalText");
  v4 = (const __CFString *)a1[6];
  if (!v4)
    v4 = &stru_1E16EDF20;
  v17[2] = v4;
  v18[0] = CFSTR("replacementInfo");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = a1[7];
  if (!v7)
    v7 = MEMORY[0x1E0C9AA70];
  v19[0] = v5;
  v19[1] = v7;
  v18[1] = CFSTR("correctionIdentifier");
  v18[2] = 0x1E1747BA0;
  +[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentInputMode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryLanguage");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1E16EDF20;
  v18[3] = CFSTR("dictationUIInteractionIdentifier");
  v13 = (const __CFString *)a1[8];
  if (!v13)
    v13 = &stru_1E16EDF20;
  v19[2] = v12;
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIDictationConnection analytics](UIDictationConnection, "analytics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logEventWithType:context:", 2202, v14);

}

- (void)synthesizeDidRecognizeTokens:(id)a3 languageModel:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIDictationConnection connection](self, "connection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDictationConnection dictationConnection:didRecognizeTokens:languageModel:](self, "dictationConnection:didRecognizeTokens:languageModel:", v8, v7, v6);

}

- (void)synthesizeDidRecognizePhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[UIDictationConnection connection](self, "connection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:](self, "dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:", v11, v10, v9, v8);

}

- (void)preheat
{
  id v2;

  -[UIDictationConnection connection](self, "connection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preheat");

}

+ (id)interpretationFromSpeechTokens:(id)a3 startIndex:(unint64_t)a4 filterBlock:(id)a5
{
  id v7;
  void (**v8)(id, id, unint64_t, _BYTE *);
  id v9;
  unint64_t v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  id v15;
  double v16;
  int v17;
  UIDictationInterpretation *v18;
  UIDictationInterpretation *v19;
  unsigned __int8 v21;

  v7 = a3;
  v8 = (void (**)(id, id, unint64_t, _BYTE *))a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_msgSend(v7, "count");
  v11 = 0.0;
  v12 = 0.0;
  if (v10 > a4)
  {
    v13 = v10 - 1;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v15 = v14;
      if (v8)
      {
        v8[2](v8, v15, a4, &v21);
        if (v21)
          goto LABEL_7;
      }
      if (v15)
        break;
      v17 = 0;
LABEL_9:

      if (v13 != a4)
      {
        ++a4;
        if (!v17)
          continue;
      }
      goto LABEL_11;
    }
    objc_msgSend(v9, "addObject:", v15);
    objc_msgSend(v15, "confidenceScore");
    v12 = v12 + v16;
LABEL_7:

    v17 = v21;
    goto LABEL_9;
  }
LABEL_11:
  v18 = [UIDictationInterpretation alloc];
  if (objc_msgSend(v9, "count"))
    v11 = v12 / (double)(unint64_t)objc_msgSend(v9, "count");
  v19 = -[UIDictationInterpretation initWithTokens:score:](v18, "initWithTokens:score:", v9, v11);

  return v19;
}

- (BOOL)isSecureInput
{
  return self->_offlineOnly;
}

+ (BOOL)hasSpeechRecognitionPauseAckPhrases:(id)a3
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
  char v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interpretations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "interpretations");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") == 1)
      {
        objc_msgSend(v3, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "interpretations");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "tokens");
        v18 = v6;
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("DUMMYTOKEN"));

        v6 = v18;
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dictationConnection:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6
{
  AFDictationConnection *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id WeakRetained;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  int IsDefaultRightToLeft;
  unsigned int charBeforeInsertionPointOnDictationStart;
  unsigned int charAfterInsertionPointOnDictationStart;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  int v46;
  const char *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v10 = (AFDictationConnection *)a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("_"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDictationConnection setLastUsedDetectedLanguage:](self, "setLastUsedDetectedLanguage:", v14);

  +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "textInputTraits");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "keyboardType");

  if (v17 > 0xB || ((1 << v17) & 0x930) == 0)
  {
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "currentKeyboardPrimaryLanguage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v35) = UIKeyboardInputModeIsDefaultRightToLeft(v36);
    -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft(v37);

    if ((_DWORD)v35 != IsDefaultRightToLeft)
    {
      charBeforeInsertionPointOnDictationStart = self->_charBeforeInsertionPointOnDictationStart;
      if (charBeforeInsertionPointOnDictationStart == 10 || !charBeforeInsertionPointOnDictationStart)
      {
        charAfterInsertionPointOnDictationStart = self->_charAfterInsertionPointOnDictationStart;
        if (charAfterInsertionPointOnDictationStart == 10 || !charAfterInsertionPointOnDictationStart)
        {
          +[UIKeyboardImpl sharedInstance](UIKeyboardImpl, "sharedInstance");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "inputDelegate");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = UIKeyboardInputModeIsDefaultRightToLeft(v43);
          objc_msgSend(v42, "selectedTextRange");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setBaseWritingDirection:forRange:", v44, v45);

        }
      }
    }

  }
  objc_msgSend(v12, "keysSortedByValueUsingComparator:", &__block_literal_global_125_0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[UIDictationConnection setLastUsedTopLanguages:](self, "setLastUsedTopLanguages:", v20);

  v21 = objc_msgSend(v19, "count");
  if (v21 >= 3)
    v22 = 3;
  else
    v22 = v21;
  if (v22 >= 2)
  {
    for (i = 1; i != v22; ++i)
    {
      -[UIDictationConnection lastUsedTopLanguages](self, "lastUsedTopLanguages");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", i);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v25);

    }
  }
  self->_lowConfidenceAboutLanguageDetection = !a6;
  if (self->_connection == v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnection:didDetectLanguage:", self, v11);

    _UIDictationConnectionLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v46 = 136315394;
      v47 = "-[UIDictationConnection dictationConnection:didDetectLanguage:confidenceScores:isConfident:]";
      v48 = 2112;
      v49 = v11;
      _os_log_impl(&dword_185066000, v27, OS_LOG_TYPE_DEFAULT, "%s languageCode %@", (uint8_t *)&v46, 0x16u);
    }

    if (!self->_receivedMultilingualResultsCommand)
    {
      -[UIDictationConnection lastUsedPrimaryLanguage](self, "lastUsedPrimaryLanguage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToString:", v29);

      if ((v30 & 1) == 0)
      {
        -[UIDictationConnection lastReceivedPartials](self, "lastReceivedPartials");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          _UIDictationConnectionLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            v46 = 136315394;
            v47 = "-[UIDictationConnection dictationConnection:didDetectLanguage:confidenceScores:isConfident:]";
            v48 = 2112;
            v49 = v11;
            _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_DEFAULT, "%s Replaying last partial result for %@ by calling didRecognizePartialResult", (uint8_t *)&v46, 0x16u);
          }

          -[UIDictationConnection dictationConnection:didRecognizePartialResult:](self, "dictationConnection:didRecognizePartialResult:", v10, v33);
        }

      }
    }
  }

}

uint64_t __92__UIDictationConnection_dictationConnection_didDetectLanguage_confidenceScores_isConfident___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (void)dictationConnection:(id)a3 languageDetectorFailedWithError:(id)a4
{
  id v4;

  if (self->_connection == a3)
  {
    -[UIDictationConnection dictationOptions](self, "dictationOptions");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLanguageDetectionUserContext:", 0);

  }
}

- (void)dictationConnectionSpeechRecordingWillBegin:(id)a3
{
  id WeakRetained;

  if (self->_connection == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnectionWillStartRecording:", self);

  }
}

- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3
{
  id WeakRetained;

  if (self->_connection == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnectionDidStartRecording:", self);

  }
}

- (void)dictationConnection:(id)a3 speechRecordingDidBeginWithOptions:(id)a4
{
  UIDictationConnectionDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if (self->_connection == a3)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "dictationConnection:didStartRecordingWithOptions:", self, v6);

  }
}

- (void)dictationConnection:(id)a3 didBeginLocalRecognitionWithModelInfo:(id)a4
{
  UIDictationConnectionDelegate **p_delegate;
  id v6;
  id WeakRetained;

  if (self->_connection == a3)
  {
    p_delegate = &self->_delegate;
    v6 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "dictationConnection:didBeginLocalRecognitionWithModelInfo:", self, v6);

  }
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  AFDictationConnection *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (AFDictationConnection *)a3;
  if (self->_connection == v6)
  {
    self->_connection = 0;
    v7 = a4;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v12 = CFSTR("UIDictationConnectionUnderlyingError");
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("UIDictationConnection"), -1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "dictationConnection:didFailRecordingWithError:", self, v11);
  }

}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  AFDictationConnection *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id WeakRetained;
  const __CFString *v17;
  id v18;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = (AFDictationConnection *)a3;
  v7 = a4;
  if (self->_connection == v6)
  {
    self->_connection = 0;

    if (objc_msgSend(v7, "code") == 6)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v23 = CFSTR("UIDictationConnectionUnderlyingError");
      v24[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = 2;
    }
    else if (objc_msgSend(v7, "code") == 602)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v21 = CFSTR("UIDictationConnectionUnderlyingError");
      v22 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
      v11 = 3;
    }
    else
    {
      v13 = objc_msgSend(v7, "code");
      v14 = (void *)MEMORY[0x1E0CB35C8];
      if (v13 == 603)
      {
        v19 = CFSTR("UIDictationConnectionUnderlyingError");
        v20 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v14;
        v11 = 4;
      }
      else
      {
        v17 = CFSTR("UIDictationConnectionUnderlyingError");
        v18 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v14;
        v11 = -1;
      }
    }
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("UIDictationConnection"), v11, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnection:didFailRecognitionWithError:", self, v15);

  }
}

- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3
{
  id WeakRetained;

  if (self->_connection == a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnectionDidEndRecording:", self);

  }
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  AFDictationConnection *v4;
  id WeakRetained;
  AFDictationConnection *v6;

  v4 = (AFDictationConnection *)a3;
  if (self->_connection == v4)
  {
    self->_connection = 0;
    v6 = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnectionDidCancel:", self);

    v4 = v6;
  }

}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  AFDictationConnection *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _BOOL4 ignoreSpeechRecognitionResults;
  void *v14;
  id WeakRetained;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  unint64_t v24;
  void *v25;
  _BOOL8 offlineOnly;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  id v33;
  id v34;
  id *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id *location;
  _QWORD aBlock[5];
  id v41;
  uint64_t *v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[4];
  NSObject *v49;
  _BYTE buf[24];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = (AFDictationConnection *)a3;
  v9 = a4;
  v10 = a5;
  if (self->_connection == v8)
  {
    _UIDictationConnectionLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[UIDictationConnection dictationConnection:didRecognizeTokens:languageModel:]";
      _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    if (self->_ignoreSpeechRecognitionResults)
    {
      _UIDictationConnectionLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[UIDictationConnection dictationConnection:didRecognizeTokens:languageModel:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = ignoreSpeechRecognitionResults;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "%s _ignoreSpeechRecognitionResults=%d. Early return", buf, 0x12u);
      }
    }
    else
    {
      +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateRecordingLimitTimerIfNeeded");

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "dictationConnection:didReceiveCandidateDictationSerializableResults:", self, 0);

      location = (id *)&self->_tokenFilter;
      v16 = objc_loadWeakRetained((id *)&self->_tokenFilter);
      v36 = objc_msgSend(v16, "resultTransformForLanguageModel:", v10);

      objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("-"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("_"));
      v38 = objc_claimAutoreleasedReturnValue();

      v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v19 = MEMORY[0x1E0C809B0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __78__UIDictationConnection_dictationConnection_didRecognizeTokens_languageModel___block_invoke;
      v48[3] = &unk_1E16D4498;
      v12 = v18;
      v49 = v12;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v48);
      if (-[NSObject count](v12, "count"))
      {
        -[NSObject firstObject](v12, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setRemoveSpaceBefore:", 1);

        v21 = objc_loadWeakRetained(location);
        objc_msgSend(v21, "dictationConnection:willFilterTokensWithLanguageModel:forFinalize:", self, v38, 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v51 = 0;
        v44 = 0;
        v45 = &v44;
        v46 = 0x2020000000;
        v47 = 0;
        v22 = objc_loadWeakRetained(location);

        if (v22)
        {
          aBlock[0] = v19;
          aBlock[1] = 3221225472;
          aBlock[2] = __78__UIDictationConnection_dictationConnection_didRecognizeTokens_languageModel___block_invoke_2;
          aBlock[3] = &unk_1E16D44C0;
          aBlock[4] = self;
          v41 = v37;
          v42 = &v44;
          v43 = buf;
          v23 = _Block_copy(aBlock);

        }
        else
        {
          v23 = 0;
        }
        v24 = -[NSObject count](v12, "count", &self->_delegate) - 1;
        while (v24 >= *(_QWORD *)(*(_QWORD *)&buf[8] + 24))
        {
          *((_BYTE *)v45 + 24) = 0;
          +[UIDictationConnection interpretationFromSpeechTokens:startIndex:filterBlock:](UIDictationConnection, "interpretationFromSpeechTokens:startIndex:filterBlock:", v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          offlineOnly = self->_offlineOnly;
          objc_msgSend(v25, "tokens");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v27, v36, offlineOnly);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(offlineOnly) = *((_BYTE *)v45 + 24) == 0;
          v29 = objc_loadWeakRetained(v35);
          v30 = v29;
          v31 = self->_offlineOnly;
          if (offlineOnly)
          {
            objc_msgSend(v29, "dictationConnection:receivedInterpretation:languageModel:secureInput:", self, v28, v38, v31);

            break;
          }
          objc_msgSend(v29, "dictationConnection:receivedInterpretation:languageModel:secureInput:", self, v28, v38, v31);

          ++*(_QWORD *)(*(_QWORD *)&buf[8] + 24);
          -[NSObject objectAtIndex:](v12, "objectAtIndex:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_loadWeakRetained(location);
          objc_msgSend(v33, "dictationConnection:filterState:processFilteredToken:forFinalize:", self, v37, v32, 0);

        }
        v34 = objc_loadWeakRetained(location);
        objc_msgSend(v34, "dictationConnection:didFilterTokensWithFilterState:forFinalize:", self, v37, 0);

        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(buf, 8);

      }
      v10 = (id)v38;
    }

  }
}

void __78__UIDictationConnection_dictationConnection_didRecognizeTokens_languageModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  +[UIDictationUtilities tokenFromAFToken:](UIDictationUtilities, "tokenFromAFToken:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = (id)v6;
  if (v6)
  {
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    objc_msgSend(v7, "removeAllObjects");
    *a4 = 1;
  }

}

void __78__UIDictationConnection_dictationConnection_didRecognizeTokens_languageModel___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v7;
  id v8;
  id WeakRetained;
  int v10;

  v7 = (id *)(a1[4] + 32);
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  v10 = objc_msgSend(WeakRetained, "dictationConnection:filterState:shouldCheckpointAtToken:", a1[4], a1[5], v8);

  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
  }
}

- (void)dictationConnection:(id)a3 didRecognizePartialResult:(id)a4
{
  AFDictationConnection *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id WeakRetained;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  unint64_t v34;
  void *v35;
  _BOOL8 offlineOnly;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  AFDictationConnection *v50;
  id *location;
  void *v52;
  _QWORD aBlock[5];
  id v54;
  uint64_t *v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  _QWORD v61[4];
  id v62;
  _BYTE buf[24];
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = (AFDictationConnection *)a3;
  v7 = a4;
  v50 = v6;
  if (self->_connection == v6)
  {
    v48 = v7;
    -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v46 = v8;
    }
    else
    {
      -[UIDictationConnection lastUsedPrimaryLanguage](self, "lastUsedPrimaryLanguage");
      v46 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v48, "language");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "componentsSeparatedByString:", CFSTR("-"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("_"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIDictationConnection dictationOptions](self, "dictationOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "languageDetectionUserContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[UIDictationConnection lastReceivedPartials](self, "lastReceivedPartials");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v48, v49);

    }
    -[UIDictationConnection lastUsedPrimaryLanguage](self, "lastUsedPrimaryLanguage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    _UIDictationConnectionLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[UIDictationConnection lastUsedPrimaryLanguage](self, "lastUsedPrimaryLanguage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[UIDictationConnection dictationConnection:didRecognizePartialResult:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v64 = v16;
      v65 = 2112;
      v66 = v52;
      _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, "%s Keyboard language code %@, detected language code %@, partial language code %@", buf, 0x2Au);

    }
    -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v52, "isEqualToString:", v46);
    v19 = objc_msgSend(v49, "isEqualToString:", v45);
    if (v17)
      v20 = 0;
    else
      v20 = v19;
    if (((v18 | v20) & 1) != 0
      || (-[UIDictationConnection dictationOptions](self, "dictationOptions"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v21, "languageDetectionUserContext"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v23 = v22 == 0,
          v22,
          v21,
          v23))
    {
      location = (id *)&self->_tokenFilter;
      WeakRetained = objc_loadWeakRetained((id *)&self->_tokenFilter);
      v47 = objc_msgSend(WeakRetained, "resultTransformForLanguageModel:", v52);

      v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v48, "af_tokens");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __71__UIDictationConnection_dictationConnection_didRecognizePartialResult___block_invoke;
      v61[3] = &unk_1E16D4498;
      v28 = v25;
      v62 = v28;
      objc_msgSend(v26, "enumerateObjectsUsingBlock:", v61);

      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setRemoveSpaceBefore:", 1);

        v30 = objc_loadWeakRetained(location);
        objc_msgSend(v30, "dictationConnection:willFilterTokensWithLanguageModel:forFinalize:", self, v52, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v64 = 0;
        v57 = 0;
        v58 = &v57;
        v59 = 0x2020000000;
        v60 = 0;
        v32 = objc_loadWeakRetained(location);

        if (v32)
        {
          aBlock[0] = v27;
          aBlock[1] = 3221225472;
          aBlock[2] = __71__UIDictationConnection_dictationConnection_didRecognizePartialResult___block_invoke_2;
          aBlock[3] = &unk_1E16D44C0;
          aBlock[4] = self;
          v54 = v31;
          v55 = &v57;
          v56 = buf;
          v33 = _Block_copy(aBlock);

        }
        else
        {
          v33 = 0;
        }
        v34 = objc_msgSend(v28, "count") - 1;
        if (v34 >= *(_QWORD *)(*(_QWORD *)&buf[8] + 24))
        {
          while (1)
          {
            *((_BYTE *)v58 + 24) = 0;
            +[UIDictationConnection interpretationFromSpeechTokens:startIndex:filterBlock:](UIDictationConnection, "interpretationFromSpeechTokens:startIndex:filterBlock:", v28);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            offlineOnly = self->_offlineOnly;
            objc_msgSend(v35, "tokens");
            v37 = objc_claimAutoreleasedReturnValue();
            +[UIDictationController serializedInterpretationFromTokens:transform:capitalization:](UIDictationController, "serializedInterpretationFromTokens:transform:capitalization:", v37, v47, offlineOnly);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            LOBYTE(v37) = *((_BYTE *)v58 + 24) == 0;
            v39 = objc_loadWeakRetained((id *)&self->_delegate);
            v40 = v39;
            v41 = self->_offlineOnly;
            if ((v37 & 1) != 0)
              break;
            objc_msgSend(v39, "dictationConnection:receivedInterpretation:languageModel:secureInput:", self, v38, v52, v41);

            ++*(_QWORD *)(*(_QWORD *)&buf[8] + 24);
            objc_msgSend(v28, "objectAtIndex:");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_loadWeakRetained(location);
            objc_msgSend(v43, "dictationConnection:filterState:processFilteredToken:forFinalize:", self, v31, v42, 0);

            if (v34 < *(_QWORD *)(*(_QWORD *)&buf[8] + 24))
              goto LABEL_23;
          }
          objc_msgSend(v39, "dictationConnection:receivedInterpretation:languageModel:secureInput:", self, v38, v52, v41);

        }
LABEL_23:
        v44 = objc_loadWeakRetained(location);
        objc_msgSend(v44, "dictationConnection:didFilterTokensWithFilterState:forFinalize:", self, v31, 0);

        _Block_object_dispose(&v57, 8);
        _Block_object_dispose(buf, 8);

      }
    }

    v7 = v48;
  }

}

void __71__UIDictationConnection_dictationConnection_didRecognizePartialResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  void *v7;
  id v8;

  +[UIDictationUtilities tokenFromAFToken:](UIDictationUtilities, "tokenFromAFToken:", a2);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v8 = (id)v6;
  if (v6)
  {
    objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    objc_msgSend(v7, "removeAllObjects");
    *a4 = 1;
  }

}

void __71__UIDictationConnection_dictationConnection_didRecognizePartialResult___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id *v7;
  id v8;
  id WeakRetained;
  int v10;

  v7 = (id *)(a1[4] + 32);
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  v10 = objc_msgSend(WeakRetained, "dictationConnection:filterState:shouldCheckpointAtToken:", a1[4], a1[5], v8);

  if (v10)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
  }
}

- (id)dictationSerializedResultWithPhrases:(id)a3 languageModel:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  UIDictationSerializableResults *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tokenFilter);
  v9 = objc_msgSend(WeakRetained, "resultTransformForLanguageModel:", v7);

  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("-"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("_"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        +[UIDictationUtilities phraseFromAFPhrase:](UIDictationUtilities, "phraseFromAFPhrase:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v15);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v12, "firstObject", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "interpretations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v30;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v30 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v24), "tokens");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setRemoveSpaceBefore:", 1);

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v22);
  }

  v27 = -[UIDictationSerializableResults initWithPhrases:]([UIDictationSerializableResults alloc], "initWithPhrases:", v12);
  -[UIDictationSerializableResults setTransform:](v27, "setTransform:", v9);

  return v27;
}

- (void)dictationConnection:(id)a3 didRecognizePhrases:(id)a4 languageModel:(id)a5 correctionIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  NSObject *v31;
  id WeakRetained;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->_connection == a3)
  {
    _UIDictationConnectionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 136315138;
      v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v36, 0xCu);
    }

    if (objc_msgSend((id)objc_opt_class(), "hasSpeechRecognitionPauseAckPhrases:", v10))
    {
      _UIDictationConnectionLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 136315138;
        v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
        v15 = "%s This is a speech recognition pause acknowledgement callback. Early return";
LABEL_10:
        _os_log_impl(&dword_185066000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v36, 0xCu);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
    if (self->_ignoreSpeechRecognitionResults)
    {
      _UIDictationConnectionLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v36 = 136315138;
        v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
        v15 = "%s _ignoreSpeechRecognitionResults == YES. Early return";
        goto LABEL_10;
      }
LABEL_28:

      goto LABEL_29;
    }
    if (!_os_feature_enabled_impl())
      goto LABEL_21;
    if (+[UIDictationController supportsSiriDictationVoiceCommands](UIDictationController, "supportsSiriDictationVoiceCommands"))
    {
      goto LABEL_21;
    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isDetectingUtterances");

    if (!v17)
      goto LABEL_21;
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      v19 = objc_msgSend(v18, "handleCommandRecognizedWithPhrases:locale:", v10, v11);

      if ((v19 & 1) != 0)
        goto LABEL_29;
      goto LABEL_21;
    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "smartLanguageSelectionOverrideLanguage");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)v21;
      v23 = objc_msgSend(v18, "handleCommandRecognizedWithPhrases:locale:", v10, v21);

      if ((v23 & 1) != 0)
        goto LABEL_29;
      goto LABEL_21;
    }
    +[UIDictationController sharedInstance](UIDictationController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "language");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v18, "handleCommandRecognizedWithPhrases:locale:", v10, v25);

    if ((v26 & 1) == 0)
    {
LABEL_21:
      -[UIDictationConnection lastUsedPrimaryLanguage](self, "lastUsedPrimaryLanguage");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqualToString:", v28);

      if (self->_receivedMultilingualResultsCommand)
        goto LABEL_25;
      -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v30)
        v29 = 1;

      if ((v29 & 1) != 0)
      {
LABEL_25:
        _UIDictationConnectionLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 136315394;
          v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
          v38 = 2112;
          v39 = v11;
          _os_log_impl(&dword_185066000, v31, OS_LOG_TYPE_DEFAULT, "%s languageModel %@", (uint8_t *)&v36, 0x16u);
        }

        -[UIDictationConnection dictationSerializedResultWithPhrases:languageModel:](self, "dictationSerializedResultWithPhrases:languageModel:", v10, v11);
        v14 = objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:", self, v14, v11, v12, self->_offlineOnly, 1);

      }
      else
      {
        _UIDictationConnectionLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIDictationConnection lastUsedPrimaryLanguage](self, "lastUsedPrimaryLanguage");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 136315650;
          v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
          v38 = 2112;
          v39 = v34;
          v40 = 2112;
          v41 = v35;
          _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_DEFAULT, "%s Calling didCancelIncompatibleLocalRecognizer on delegate because of language mismatch (%@ vs %@)", (uint8_t *)&v36, 0x20u);

        }
        -[UIDictationConnection delegate](self, "delegate");
        v14 = objc_claimAutoreleasedReturnValue();
        -[NSObject dictationConnectionDidCancelIncompatibleLocalRecognizer:](v14, "dictationConnectionDidCancelIncompatibleLocalRecognizer:", self);
      }
      goto LABEL_28;
    }
  }
LABEL_29:

}

- (void)dictationConnection:(id)a3 didRecognizePartialPackage:(id)a4 nluResult:(id)a5 languageModel:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *WeakRetained;
  _BOOL4 ignoreSpeechRecognitionResults;
  int v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (self->_connection == a3)
  {
    _UIDictationConnectionLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[UIDictationConnection dictationConnection:didRecognizePartialPackage:nluResult:languageModel:]";
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v16, 0xCu);
    }

    if (self->_ignoreSpeechRecognitionResults)
    {
      _UIDictationConnectionLog();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
        v16 = 136315394;
        v17 = "-[UIDictationConnection dictationConnection:didRecognizePartialPackage:nluResult:languageModel:]";
        v18 = 1024;
        v19 = ignoreSpeechRecognitionResults;
        _os_log_impl(&dword_185066000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%s _ignoreSpeechRecognitionResults=%d. Early return", (uint8_t *)&v16, 0x12u);
      }
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[NSObject dictationConnection:didReceivePartialPackage:nluResult:languageModel:](WeakRetained, "dictationConnection:didReceivePartialPackage:nluResult:languageModel:", self, v10, v11, v12);
    }

  }
}

- (void)dictationConnection:(id)a3 didRecognizeMultilingualSpeech:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  UIDictationMultilingualResults *v31;
  uint64_t v32;
  void *v33;
  BOOL v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  void *v55;
  void *v56;
  void *v57;
  UIDictationSerializableResults *v58;
  id WeakRetained;
  void *v60;
  _BOOL8 offlineOnly;
  UIDictationConnection *v62;
  UIDictationSerializableResults *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t ii;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t jj;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  UIDictationConnection *v87;
  id obj;
  uint64_t v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  uint8_t v130[128];
  uint8_t buf[4];
  const char *v132;
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_connection == a3)
  {
    -[UIDictationConnection setReceivedMultilingualResultsCommand:](self, "setReceivedMultilingualResultsCommand:", 1);
    _UIDictationConnectionLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v132 = "-[UIDictationConnection dictationConnection:didRecognizeMultilingualSpeech:]";
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      -[UIDictationConnection lastUsedPrimaryLanguage](self, "lastUsedPrimaryLanguage");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    v85 = v6;
    objc_msgSend(v6, "speechRecognizedByLanguage");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = v11;
    v87 = self;
    if (v12)
    {
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      -[UIDictationConnection lastUsedTopLanguages](self, "lastUsedTopLanguages");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
      if (v92)
      {
        v89 = *(_QWORD *)v121;
        do
        {
          for (i = 0; i != v92; ++i)
          {
            if (*(_QWORD *)v121 != v89)
              objc_enumerationMutation(obj);
            v93 = *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * i);
            objc_msgSend(v91, "objectForKey:");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "recognition");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "af_speechPhrases");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v116 = 0u;
            v117 = 0u;
            v118 = 0u;
            v119 = 0u;
            v17 = v15;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v117;
              do
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v117 != v20)
                    objc_enumerationMutation(v17);
                  +[UIDictationUtilities phraseFromAFPhrase:](UIDictationUtilities, "phraseFromAFPhrase:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * j));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "addObject:", v22);

                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
              }
              while (v19);
            }

            v114 = 0u;
            v115 = 0u;
            v112 = 0u;
            v113 = 0u;
            objc_msgSend(v16, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "interpretations");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v113;
              do
              {
                for (k = 0; k != v26; ++k)
                {
                  if (*(_QWORD *)v113 != v27)
                    objc_enumerationMutation(v24);
                  objc_msgSend(*(id *)(*((_QWORD *)&v112 + 1) + 8 * k), "tokens");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "firstObject");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "setRemoveSpaceBefore:", 1);

                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
              }
              while (v26);
            }

            v31 = -[UIDictationMultilingualResults initWithPhrases:dominantLanguage:]([UIDictationMultilingualResults alloc], "initWithPhrases:dominantLanguage:", v16, v93);
            objc_msgSend(v90, "addObject:", v31);

          }
          v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v130, 16);
        }
        while (v92);
      }

      v11 = v86;
      self = v87;
    }
    -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
    v32 = objc_claimAutoreleasedReturnValue();
    if (v32
      && (v33 = (void *)v32,
          v34 = -[UIDictationConnection lowConfidenceAboutLanguageDetection](self, "lowConfidenceAboutLanguageDetection"), v33, v34))
    {
      v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[UIDictationConnection lastUsedDetectedLanguage](self, "lastUsedDetectedLanguage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "componentsSeparatedByString:", CFSTR("_"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "componentsJoinedByString:", CFSTR("-"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKey:", v38);
      v39 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "recognition");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "af_speechPhrases");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "af_correctionContext");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v43 = v41;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v101;
        do
        {
          for (m = 0; m != v45; ++m)
          {
            if (*(_QWORD *)v101 != v46)
              objc_enumerationMutation(v43);
            +[UIDictationUtilities phraseFromAFPhrase:](UIDictationUtilities, "phraseFromAFPhrase:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * m));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "addObject:", v48);

          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v100, v125, 16);
        }
        while (v45);
      }

      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      objc_msgSend(v35, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "interpretations");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v97;
        do
        {
          for (n = 0; n != v52; ++n)
          {
            if (*(_QWORD *)v97 != v53)
              objc_enumerationMutation(v50);
            objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * n), "tokens");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "firstObject");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setRemoveSpaceBefore:", 1);

          }
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v96, v124, 16);
        }
        while (v52);
      }

      v57 = v90;
      v58 = -[UIDictationSerializableResults initWithDetectedPhrases:multilingualAlternatives:]([UIDictationSerializableResults alloc], "initWithDetectedPhrases:multilingualAlternatives:", v35, v90);
      -[UIDictationSerializableResults setLowConfidenceAboutLanguageDetection:](v58, "setLowConfidenceAboutLanguageDetection:", -[UIDictationConnection lowConfidenceAboutLanguageDetection](v87, "lowConfidenceAboutLanguageDetection"));
      WeakRetained = objc_loadWeakRetained((id *)&v87->_delegate);
      v60 = WeakRetained;
      offlineOnly = v87->_offlineOnly;
      v62 = v87;
      v63 = v58;
      v64 = v86;
      v65 = v86;
      v66 = v42;
    }
    else
    {
      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("_"));
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "componentsJoinedByString:", CFSTR("-"));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "objectForKey:", v68);
      v35 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "recognition");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "af_speechPhrases");
      v70 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "af_correctionContext");
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v71 = objc_loadWeakRetained((id *)&self->_tokenFilter);
      v95 = objc_msgSend(v71, "resultTransformForLanguageModel:", v11);

      v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v108 = 0u;
      v109 = 0u;
      v110 = 0u;
      v111 = 0u;
      v39 = v70;
      v72 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v108, v127, 16);
      if (v72)
      {
        v73 = v72;
        v74 = *(_QWORD *)v109;
        do
        {
          for (ii = 0; ii != v73; ++ii)
          {
            if (*(_QWORD *)v109 != v74)
              objc_enumerationMutation(v39);
            +[UIDictationUtilities phraseFromAFPhrase:](UIDictationUtilities, "phraseFromAFPhrase:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * ii));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "addObject:", v76);

          }
          v73 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v108, v127, 16);
        }
        while (v73);
      }

      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      objc_msgSend(v42, "firstObject");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "interpretations");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
      if (v79)
      {
        v80 = v79;
        v81 = *(_QWORD *)v105;
        do
        {
          for (jj = 0; jj != v80; ++jj)
          {
            if (*(_QWORD *)v105 != v81)
              objc_enumerationMutation(v78);
            objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * jj), "tokens");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "firstObject");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "setRemoveSpaceBefore:", 1);

          }
          v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v104, v126, 16);
        }
        while (v80);
      }

      v57 = v90;
      v58 = -[UIDictationSerializableResults initWithDetectedPhrases:multilingualAlternatives:]([UIDictationSerializableResults alloc], "initWithDetectedPhrases:multilingualAlternatives:", v42, v90);
      -[UIDictationSerializableResults setLowConfidenceAboutLanguageDetection:](v58, "setLowConfidenceAboutLanguageDetection:", -[UIDictationConnection lowConfidenceAboutLanguageDetection](v87, "lowConfidenceAboutLanguageDetection"));
      -[UIDictationSerializableResults setTransform:](v58, "setTransform:", v95);
      WeakRetained = objc_loadWeakRetained((id *)&v87->_delegate);
      v60 = WeakRetained;
      offlineOnly = v87->_offlineOnly;
      v62 = v87;
      v63 = v58;
      v64 = v86;
      v65 = v86;
      v66 = v43;
    }
    objc_msgSend(WeakRetained, "dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:", v62, v63, v65, v66, offlineOnly, 0);

    v6 = v85;
  }

}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  AFDictationConnection *v4;
  id WeakRetained;
  AFDictationConnection *v6;

  v4 = (AFDictationConnection *)a3;
  if (self->_connection == v4)
  {
    self->_connection = 0;
    v6 = v4;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "dictationConnectionDidFinish:", self);

    v4 = v6;
  }

}

- (void)dictationConnection:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  UIDictationConnectionDelegate **p_delegate;
  id v12;
  id v13;
  id WeakRetained;

  if (self->_connection == a3)
  {
    v7 = a7;
    v8 = a6;
    p_delegate = &self->_delegate;
    v12 = a5;
    v13 = a4;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "dictationConnection:didReceiveSearchResults:recognizedText:stable:final:", self, v13, v12, v8, v7);

  }
}

- (void)dictationConnectionDidPauseRecognition:(id)a3
{
  NSObject *v4;
  _BOOL4 ignoreSpeechRecognitionResults;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (self->_connection == a3)
  {
    self->_ignoreSpeechRecognitionResults = 0;
    _UIDictationConnectionLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
      v6 = 136315394;
      v7 = "-[UIDictationConnection dictationConnectionDidPauseRecognition:]";
      v8 = 1024;
      v9 = ignoreSpeechRecognitionResults;
      _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_DEFAULT, "%s Setting _ignoreSpeechRecognitionResults=%d", (uint8_t *)&v6, 0x12u);
    }

  }
}

- (void)dictationConnection:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  AFDictationConnection *v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 ignoreSpeechRecognitionResults;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  int v15;
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (AFDictationConnection *)a3;
  v7 = a4;
  v8 = v7;
  if (self->_connection == v6)
  {
    if (self->_ignoreSpeechRecognitionResults)
    {
      _UIDictationConnectionLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
        v15 = 136315394;
        v16 = "-[UIDictationConnection dictationConnection:didRecognizeFinalResultCandidatePackage:]";
        v17 = 1024;
        v18 = ignoreSpeechRecognitionResults;
        _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "%s _ignoreSpeechRecognitionResults=%d. Early return", (uint8_t *)&v15, 0x12u);
      }

    }
    else
    {
      objc_msgSend(v7, "recognition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "phrases");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIDictationConnection dictationSerializedResultWithPhrases:languageModel:](self, "dictationSerializedResultWithPhrases:languageModel:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "dictationConnection:didReceiveCandidateDictationSerializableResults:", self, v13);

    }
  }

}

- (void)dictationConnection:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4 nluResult:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *WeakRetained;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  _BOOL4 ignoreSpeechRecognitionResults;
  int v18;
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (self->_connection == a3)
  {
    _UIDictationConnectionLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136315138;
      v19 = "-[UIDictationConnection dictationConnection:didRecognizeVoiceCommandCandidatePackage:nluResult:]";
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
    }

    objc_msgSend(v8, "recognition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "phrases");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)objc_opt_class(), "hasSpeechRecognitionPauseAckPhrases:", v12))
    {
      _UIDictationConnectionLog();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 136315138;
        v19 = "-[UIDictationConnection dictationConnection:didRecognizeVoiceCommandCandidatePackage:nluResult:]";
        v14 = "%s This is a speech recognition pause acknowledgement callback. Early return";
        v15 = WeakRetained;
        v16 = 12;
LABEL_10:
        _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v16);
      }
    }
    else
    {
      if (!self->_ignoreSpeechRecognitionResults)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:](WeakRetained, "dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:", self, v8, v9);
        goto LABEL_12;
      }
      _UIDictationConnectionLog();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
        v18 = 136315394;
        v19 = "-[UIDictationConnection dictationConnection:didRecognizeVoiceCommandCandidatePackage:nluResult:]";
        v20 = 1024;
        v21 = ignoreSpeechRecognitionResults;
        v14 = "%s _ignoreSpeechRecognitionResults=%d. Early return";
        v15 = WeakRetained;
        v16 = 18;
        goto LABEL_10;
      }
    }
LABEL_12:

  }
}

- (void)preheatEuclidModelWithLanguageCode:(id)a3 clientID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[UIDictationConnection connection](self, "connection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preheatEuclidModelWithLanguage:clientID:", v7, v6);

}

- (void)euclidPhoneticString:(id)a3 maxResultsCount:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[UIDictationConnection connection](self, "connection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getEuclidPhonetic:maxResultsCount:completion:", v9, a4, v8);

}

- (UIDictationConnectionDelegate)delegate
{
  return (UIDictationConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIDictationConnectionTokenFilterProtocol)tokenFilter
{
  return (UIDictationConnectionTokenFilterProtocol *)objc_loadWeakRetained((id *)&self->_tokenFilter);
}

- (BOOL)receivedMultilingualResultsCommand
{
  return self->_receivedMultilingualResultsCommand;
}

- (void)setReceivedMultilingualResultsCommand:(BOOL)a3
{
  self->_receivedMultilingualResultsCommand = a3;
}

- (AFDictationOptions)dictationOptions
{
  return self->_dictationOptions;
}

- (void)setDictationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_dictationOptions, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)offlineOnly
{
  return self->_offlineOnly;
}

- (void)setOfflineOnly:(BOOL)a3
{
  self->_offlineOnly = a3;
}

- (BOOL)ignoreSpeechRecognitionResults
{
  return self->_ignoreSpeechRecognitionResults;
}

- (void)setIgnoreSpeechRecognitionResults:(BOOL)a3
{
  self->_ignoreSpeechRecognitionResults = a3;
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (void)setAnalyticsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsQueue, a3);
}

- (NSString)lastUsedPrimaryLanguage
{
  return self->_lastUsedPrimaryLanguage;
}

- (void)setLastUsedPrimaryLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)lastUsedDetectedLanguage
{
  return self->_lastUsedDetectedLanguage;
}

- (void)setLastUsedDetectedLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSMutableArray)lastUsedTopLanguages
{
  return self->_lastUsedTopLanguages;
}

- (void)setLastUsedTopLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedTopLanguages, a3);
}

- (BOOL)lowConfidenceAboutLanguageDetection
{
  return self->_lowConfidenceAboutLanguageDetection;
}

- (void)setLowConfidenceAboutLanguageDetection:(BOOL)a3
{
  self->_lowConfidenceAboutLanguageDetection = a3;
}

- (unsigned)charBeforeInsertionPointOnDictationStart
{
  return self->_charBeforeInsertionPointOnDictationStart;
}

- (void)setCharBeforeInsertionPointOnDictationStart:(unsigned int)a3
{
  self->_charBeforeInsertionPointOnDictationStart = a3;
}

- (unsigned)charAfterInsertionPointOnDictationStart
{
  return self->_charAfterInsertionPointOnDictationStart;
}

- (void)setCharAfterInsertionPointOnDictationStart:(unsigned int)a3
{
  self->_charAfterInsertionPointOnDictationStart = a3;
}

- (NSMutableDictionary)lastReceivedPartials
{
  return self->_lastReceivedPartials;
}

- (void)setLastReceivedPartials:(id)a3
{
  objc_storeStrong((id *)&self->_lastReceivedPartials, a3);
}

@end
