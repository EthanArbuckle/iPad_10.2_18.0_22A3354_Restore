@implementation TIKeyboardInputManagerLogger

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbsOverrideLoggingCapture, 0);
  objc_storeStrong((id *)&self->_typologyStatistic, 0);
  objc_storeStrong((id *)&self->_typologyLog, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_typologyPreferences, 0);
}

- (BOOL)allowTypologyLogForKeyboardState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if (objc_msgSend(v4, "secureTextEntry"))
    goto LABEL_3;
  objc_msgSend(v5, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.mobilesafari")))
  {
    v7 = objc_msgSend(v5, "wordLearningEnabled");

    if ((v7 & 1) == 0)
    {
LABEL_3:
      -[TIKeyboardInputManagerLogger setHadSecureText:](self, "setHadSecureText:", 1);
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (!-[TIKeyboardInputManagerLogger hadSecureText](self, "hadSecureText"))
  {
    -[TIKeyboardInputManagerLogger typologyPreferences](self, "typologyPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "typologyLoggingEnabled");

    goto LABEL_10;
  }
LABEL_9:
  v8 = 0;
LABEL_10:

  return v8;
}

- (TITypologyPreferences)typologyPreferences
{
  return self->_typologyPreferences;
}

- (BOOL)hadSecureText
{
  return self->_hadSecureText;
}

- (void)setConfig:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfig:", v4);

}

- (void)disableTypologyLogIfNecessaryForKeyboardState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && !-[TIKeyboardInputManagerLogger allowTypologyLogForKeyboardState:](self, "allowTypologyLogForKeyboardState:", v6))
  {
    -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[TIKeyboardInputManagerLogger setTypologyLog:](self, "setTypologyLog:", 0);
    -[TIKeyboardInputManagerLogger setSbsOverrideLoggingCapture:](self, "setSbsOverrideLoggingCapture:", 0);
  }

}

- (void)logKeyboardConfig:(id)a3 forSyncToKeyboardState:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v6);
  -[TIKeyboardInputManagerLogger tryStartingTypologyLogForSyncToKeyboardState:](self, "tryStartingTypologyLogForSyncToKeyboardState:", v6);
  v8 = objc_alloc_init(MEMORY[0x1E0DBDD50]);
  objc_msgSend(v8, "setKeyboardState:", v6);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logRecord:", v8);

  v10 = objc_alloc_init(MEMORY[0x1E0DBDDA0]);
  objc_msgSend(v10, "setKeyboardConfig:", v7);

  objc_msgSend(v10, "setKeyboardState:", v6);
  -[TIKeyboardInputManagerLogger inputModeIdentifier](self, "inputModeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v6, "inputMode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLogger setInputModeIdentifier:](self, "setInputModeIdentifier:", v12);

  }
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logRecord:", v10);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visitRecordSync:", v10);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v6))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logKeyboardConfig:forSyncToKeyboardState:]", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v18;
        _os_log_debug_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (TITypologyLog)typologyLog
{
  return self->_typologyLog;
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)tryStartingTypologyLogForSyncToKeyboardState:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  TIStatusBarStyleOverrideLoggingCapture *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    && -[TIKeyboardInputManagerLogger allowTypologyLogForKeyboardState:](self, "allowTypologyLogForKeyboardState:", v10))
  {
    -[TIKeyboardInputManagerLogger typologyPreferences](self, "typologyPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "typologyLoggingEnabledByProfile");

    if (v6)
    {
      v7 = objc_alloc_init(TIStatusBarStyleOverrideLoggingCapture);
      -[TIKeyboardInputManagerLogger setSbsOverrideLoggingCapture:](self, "setSbsOverrideLoggingCapture:", v7);

    }
    v8 = objc_alloc_init(MEMORY[0x1E0DBDD28]);
    -[TIKeyboardInputManagerLogger setTypologyLog:](self, "setTypologyLog:", v8);

    -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

  }
}

- (BOOL)shouldWriteToSyslogForKeyboardState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel < 2)
    LOBYTE(v4) = 0;
  else
    v4 = objc_msgSend(v3, "secureTextEntry") ^ 1;

  return v4;
}

- (void)setInputModeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_inputModeIdentifier, a3);
}

- (TIKeyboardInputManagerLogger)initWithTypologyPreferences:(id)a3
{
  id v5;
  TIKeyboardInputManagerLogger *v6;
  TIKeyboardInputManagerLogger *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  TITypologyStatistic *typologyStatistic;
  void *v12;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManagerLogger;
  v6 = -[TIKeyboardInputManagerLogger init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_typologyPreferences, a3);
    objc_msgSend(MEMORY[0x1E0DBDDB8], "statistic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DBDDB0], "statisticCompositeWithStatistics:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    typologyStatistic = v7->_typologyStatistic;
    v7->_typologyStatistic = (TITypologyStatistic *)v10;

  }
  -[TIKeyboardInputManagerLogger typologyStatistic](v7, "typologyStatistic");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "prepareForComputation");

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finalizeComputation");

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aggregateReport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIKeyboardInputManagerLogger inputModeIdentifier](self, "inputModeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIKeyboardInputManagerLogger submitAggregrateDictionaryReport:inputModeIdentifier:](TIKeyboardInputManagerLogger, "submitAggregrateDictionaryReport:inputModeIdentifier:", v5, v6);

  -[TIKeyboardInputManagerLogger backgroundWriteLogs](self, "backgroundWriteLogs");
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerLogger;
  -[TIKeyboardInputManagerLogger dealloc](&v7, sel_dealloc);
}

- (TITypologyStatistic)typologyStatistic
{
  return self->_typologyStatistic;
}

- (void)backgroundWriteLogs
{
  void *v3;
  id v4;

  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLogger typologyPreferences](self, "typologyPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && TI_DEVICE_UNLOCKED() && objc_msgSend(v3, "typologyLoggingEnabled"))
    objc_msgSend((id)objc_opt_class(), "_backgroundWriteLog:preferences:completion:", v4, v3, &__block_literal_global_61_14706);

}

+ (void)submitAggregrateDictionaryReport:(id)a3 inputModeIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (TI_DEVICE_UNLOCKED_SINCE_BOOT() && objc_msgSend(v6, "length"))
  {
    v7 = v5;
    v8 = v6;
    TIDispatchAsync();

  }
}

void __85__TIKeyboardInputManagerLogger_submitAggregrateDictionaryReport_inputModeIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __85__TIKeyboardInputManagerLogger_submitAggregrateDictionaryReport_inputModeIdentifier___block_invoke_2;
  v2[3] = &unk_1EA104208;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v2);

}

- (BOOL)shouldWriteToTypologyLogForKeyboardState:(id)a3
{
  return objc_msgSend(a3, "secureTextEntry") ^ 1;
}

- (void)didReachMaximumEntries:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  -[TIKeyboardInputManagerLogger typologyPreferences](self, "typologyPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 != v18)
    {
LABEL_5:

      goto LABEL_6;
    }
    v8 = objc_msgSend(v4, "persistenceStrategy");

    if (v8 == 1)
    {
      -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDelegate:", 0);
      v17 = objc_alloc(MEMORY[0x1E0DBDD28]);
      objc_msgSend(v6, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "partIndex") + 1;
      objc_msgSend(v6, "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "systemVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "buildVersion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clientIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "config");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v17, "initWithUUID:partIndex:date:systemVersion:buildVersion:clientIdentifier:config:", v16, v9, v10, v11, v12, v13, v14);

      -[TIKeyboardInputManagerLogger setTypologyLog:](self, "setTypologyLog:", v7);
      -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDelegate:", self);

      objc_msgSend((id)objc_opt_class(), "_backgroundWriteLog:preferences:completion:", v6, v4, &__block_literal_global_14710);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (BOOL)isInternalDeviceWithForcedTypologyLoggingForTesting
{
  void *v2;
  char v3;

  -[TIKeyboardInputManagerLogger typologyPreferences](self, "typologyPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalDeviceWithForcedTypologyLoggingForTesting");

  return v3;
}

- (id)writeToFile
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardInputManagerLogger typologyPreferences](self, "typologyPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3
    && objc_msgSend(v4, "typologyLoggingEnabled")
    && ((TI_DEVICE_UNLOCKED() & 1) != 0
     || -[TIKeyboardInputManagerLogger isInternalDeviceWithForcedTypologyLoggingForTesting](self, "isInternalDeviceWithForcedTypologyLoggingForTesting")))
  {
    objc_msgSend(v5, "typologyDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[TIKeyboardInputManagerLogger _writeToFileWithTypologyLog:directoryURL:requireDeviceUnlocked:](TIKeyboardInputManagerLogger, "_writeToFileWithTypologyLog:directoryURL:requireDeviceUnlocked:", v3, v6, -[TIKeyboardInputManagerLogger isInternalDeviceWithForcedTypologyLoggingForTesting](self, "isInternalDeviceWithForcedTypologyLoggingForTesting") ^ 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", 0);

    -[TIKeyboardInputManagerLogger setTypologyLog:](self, "setTypologyLog:", 0);
    -[TIKeyboardInputManagerLogger setSbsOverrideLoggingCapture:](self, "setSbsOverrideLoggingCapture:", 0);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_tryWriteToSyslogWithTrace:(id)a3
{
  id v3;
  id v4;
  id v5;

  v3 = a3;
  if (TICanLogMessageAtLevel_onceToken != -1)
  {
    v5 = v3;
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    v3 = v5;
  }
  if (TICanLogMessageAtLevel_logLevel >= 3)
  {
    v4 = v3;
    objc_msgSend(v3, "enumerateLinesUsingBlock:", &__block_literal_global_74);
    v3 = v4;
  }

}

- (void)logKeyboardOutput:(id)a3 keyboardConfiguration:(id)a4 trace:(id)a5 forKeyboardInput:(id)a6 keyboardState:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v14);
  objc_msgSend(v13, "touchEvent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0DBDD50]);
    objc_msgSend(v18, "setKeyboardState:", v14);
    -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logRecord:", v18);

  }
  v20 = objc_alloc_init(MEMORY[0x1E0DBDD60]);
  objc_msgSend(v20, "setOutput:", v16);

  objc_msgSend(v20, "setKeyboardConfig:", v15);
  objc_msgSend(v20, "setKeyboardState:", v14);
  objc_msgSend(v20, "setInput:", v13);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logRecord:trace:", v20, v12);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "visitRecordKeyboardInput:", v20);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v14))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v20, "shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logKeyboardOutput:keyboardConfiguration:trace:forKeyboardInput:keyboardState:]", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v26;
        _os_log_debug_impl(&dword_1DA6F2000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    if (objc_msgSend(v12, "length"))
      -[TIKeyboardInputManagerLogger _tryWriteToSyslogWithTrace:](self, "_tryWriteToSyslogWithTrace:", v12);
  }

}

- (void)logAutocorrections:(id)a3 trace:(id)a4 forKeyboardState:(id)a5 requestToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v12);
  v14 = objc_alloc_init(MEMORY[0x1E0DBDD38]);
  objc_msgSend(v14, "setAutocorrections:", v13);

  objc_msgSend(v14, "setListUIDisplayed:", objc_msgSend(v12, "autocorrectionListUIDisplayed"));
  objc_msgSend(v14, "setKeyboardState:", v12);
  objc_msgSend(v14, "setRequestToken:", v11);

  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logRecord:trace:", v14, v10);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visitRecordAutocorrections:", v14);

  LODWORD(v16) = -[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v12);
  if ((_DWORD)v16)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "shortDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logAutocorrections:trace:forKeyboardState:requestToken:]", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v20;
        _os_log_debug_impl(&dword_1DA6F2000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    if (objc_msgSend(v10, "length"))
      -[TIKeyboardInputManagerLogger _tryWriteToSyslogWithTrace:](self, "_tryWriteToSyslogWithTrace:", v10);
  }

}

- (void)logCandidateResultSet:(id)a3 trace:(id)a4 forKeyboardState:(id)a5 requestToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v12);
  v14 = objc_alloc_init(MEMORY[0x1E0DBDD48]);
  objc_msgSend(v14, "setResultSet:", v13);

  objc_msgSend(v14, "setKeyboardState:", v12);
  objc_msgSend(v14, "setRequestToken:", v11);

  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logRecord:trace:", v14, v10);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "visitRecordCandidateResultSet:", v14);

  LODWORD(v16) = -[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v12);
  if ((_DWORD)v16)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v14, "shortDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logCandidateResultSet:trace:forKeyboardState:requestToken:]", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v20;
        _os_log_debug_impl(&dword_1DA6F2000, v17, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    if (objc_msgSend(v10, "length"))
      -[TIKeyboardInputManagerLogger _tryWriteToSyslogWithTrace:](self, "_tryWriteToSyslogWithTrace:", v10);
  }

}

- (void)logKeyboardConfig:(id)a3 textToCommit:(id)a4 forAcceptedCandidate:(id)a5 keyboardState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v10);
  if (v11)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0DBDD50]);
    objc_msgSend(v14, "setKeyboardState:", v10);
    -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logRecord:", v14);

  }
  v16 = objc_alloc_init(MEMORY[0x1E0DBDD30]);
  objc_msgSend(v16, "setKeyboardConfig:", v13);

  objc_msgSend(v16, "setTextToCommit:", v12);
  objc_msgSend(v16, "setCandidate:", v11);

  objc_msgSend(v16, "setKeyboardState:", v10);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logRecord:", v16);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "visitRecordAcceptedCandidate:", v16);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v10))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "shortDescription");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logKeyboardConfig:textToCommit:forAcceptedCandidate:keyboardState:]", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v22;
        _os_log_debug_impl(&dword_1DA6F2000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logReplacements:(id)a3 forString:(id)a4 keyLayout:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0DBDD88];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(v8);
  objc_msgSend(v12, "setCandidates:", v11);

  objc_msgSend(v12, "setString:", v10);
  objc_msgSend(v12, "setKeyLayout:", v9);

  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logRecord:", v12);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visitRecordReplacements:", v12);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", 0))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logReplacements:forString:keyLayout:]", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v18;
        _os_log_debug_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logRefinements:(id)a3 forCandidate:(id)a4 keyboardState:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v8);
  v11 = objc_alloc_init(MEMORY[0x1E0DBDD80]);
  objc_msgSend(v11, "setCandidate:", v9);

  objc_msgSend(v11, "setRefinements:", v10);
  objc_msgSend(v11, "setKeyboardState:", v8);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logRecord:", v11);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visitRecordRefinements:", v11);

  LODWORD(self) = -[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v8);
  if ((_DWORD)self)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logRefinements:forCandidate:keyboardState:]", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v17;
        _os_log_debug_impl(&dword_1DA6F2000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logHitKeyCode:(int64_t)a3 forTouchEvent:(id)a4 keyboardState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v9);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "loggedRecordOfClass:", objc_opt_class());

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v9, "keyLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLogger logKeyboardLayout:name:](self, "logKeyboardLayout:name:", v12, &stru_1EA1081D0);

  }
  if (!objc_msgSend(v8, "stage"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0DBDD50]);
    objc_msgSend(v13, "setKeyboardState:", v9);
    -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logRecord:", v13);

  }
  v15 = objc_alloc_init(MEMORY[0x1E0DBDD58]);
  objc_msgSend(v15, "setKeyCode:", a3);
  objc_msgSend(v15, "setTouchEvent:", v8);
  objc_msgSend(v15, "setKeyboardState:", v9);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logRecord:", v15);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visitRecordHitTest:", v15);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v9))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v15, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logHitKeyCode:forTouchEvent:keyboardState:]", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v21;
        _os_log_debug_impl(&dword_1DA6F2000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logReceivedSkipHitTestForTouchEvent:(id)a3 forKeyboardState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v7);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "loggedRecordOfClass:", objc_opt_class());

  if ((v9 & 1) == 0)
  {
    objc_msgSend(v7, "keyLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerLogger logKeyboardLayout:name:](self, "logKeyboardLayout:name:", v10, &stru_1EA1081D0);

  }
  if (!objc_msgSend(v6, "stage"))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0DBDD50]);
    objc_msgSend(v11, "setKeyboardState:", v7);
    -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logRecord:", v11);

  }
  v13 = objc_alloc_init(MEMORY[0x1E0DBDD98]);
  objc_msgSend(v13, "setTouchEvent:", v6);
  objc_msgSend(v13, "setKeyboardState:", v7);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logRecord:", v13);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "visitRecordSkipHitTest:", v13);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v7))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v13, "shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logReceivedSkipHitTestForTouchEvent:forKeyboardState:]", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v19;
        _os_log_debug_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logKeyboardConfig:(id)a3 forAdjustedPhraseBoundaryInForwardDirection:(BOOL)a4 granularity:(int)a5 keyboardState:(id)a6
{
  uint64_t v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a5;
  v7 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a3;
  -[TIKeyboardInputManagerLogger disableTypologyLogIfNecessaryForKeyboardState:](self, "disableTypologyLogIfNecessaryForKeyboardState:", v10);
  v12 = objc_alloc_init(MEMORY[0x1E0DBDD78]);
  objc_msgSend(v12, "setKeyboardConfig:", v11);

  objc_msgSend(v12, "setForwardAdjustment:", v7);
  objc_msgSend(v12, "setGranularity:", v6);
  objc_msgSend(v12, "setKeyboardState:", v10);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logRecord:", v12);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "visitRecordPhraseBoundaryAdjustment:", v12);

  LODWORD(self) = -[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", v10);
  if ((_DWORD)self)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v12, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logKeyboardConfig:forAdjustedPhraseBoundaryInForwardDirection:granularity:keyboardState:]", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v20 = v18;
        _os_log_debug_impl(&dword_1DA6F2000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logReceivedSetOriginalInput:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DBDD90];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setOriginalInput:", v5);

  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logRecord:", v6);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visitRecordSetOriginalInput:", v6);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", 0))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logReceivedSetOriginalInput:]", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logReceivedTextAccepted:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DBDDA8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setCandidate:", v5);

  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logRecord:", v6);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visitRecordTextAccepted:", v6);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", 0))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logReceivedTextAccepted:]", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logReceivedCandidateRejected:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DBDD40];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setCandidate:", v5);

  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logRecord:", v6);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "visitRecordCandidateRejected:", v6);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", 0))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v6, "shortDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logReceivedCandidateRejected:]", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v12;
        _os_log_debug_impl(&dword_1DA6F2000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logReceivedLastAcceptedCandidateCorrected
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0DBDD70]);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logRecord:", v3);

  -[TIKeyboardInputManagerLogger typologyStatistic](self, "typologyStatistic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visitRecordLastAcceptedCandidateCorrected:", v3);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", 0))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v3, "shortDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logReceivedLastAcceptedCandidateCorrected]", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_debug_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)logKeyboardLayout:(id)a3 name:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0DBDD68];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "setName:", v7);

  objc_msgSend(v9, "setKeyboardLayout:", v8);
  -[TIKeyboardInputManagerLogger typologyLog](self, "typologyLog");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logRecord:", v9);

  if (-[TIKeyboardInputManagerLogger shouldWriteToSyslogForKeyboardState:](self, "shouldWriteToSyslogForKeyboardState:", 0))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v9, "shortDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%s %@"), "-[TIKeyboardInputManagerLogger logKeyboardLayout:name:]", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v14;
        _os_log_debug_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
  }

}

- (void)setTypologyLog:(id)a3
{
  objc_storeStrong((id *)&self->_typologyLog, a3);
}

- (void)setTypologyStatistic:(id)a3
{
  objc_storeStrong((id *)&self->_typologyStatistic, a3);
}

- (void)setHadSecureText:(BOOL)a3
{
  self->_hadSecureText = a3;
}

- (TIStatusBarStyleOverrideLoggingCapture)sbsOverrideLoggingCapture
{
  return self->_sbsOverrideLoggingCapture;
}

- (void)setSbsOverrideLoggingCapture:(id)a3
{
  objc_storeStrong((id *)&self->_sbsOverrideLoggingCapture, a3);
}

void __59__TIKeyboardInputManagerLogger__tryWriteToSyslogWithTrace___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 3)
  {
    TIOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      v5 = -[__CFString length](v2, "length");
      v6 = CFSTR(" ");
      if (v5)
        v6 = v2;
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%s %@\n"), "-[TIKeyboardInputManagerLogger _tryWriteToSyslogWithTrace:]_block_invoke", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

}

uint64_t __51__TIKeyboardInputManagerLogger_backgroundWriteLogs__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[TIKeyboardInputManagerLogger _backgroundPruneLogsWithPreferences:](TIKeyboardInputManagerLogger, "_backgroundPruneLogsWithPreferences:", a2);
}

+ (BOOL)createTypologyDirectoryAtURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v11);

  v7 = v11;
  if ((v6 & 1) == 0)
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s failed to create typology directory: %@"), "+[TIKeyboardInputManagerLogger createTypologyDirectoryAtURL:]", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_debug_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }

  return v6;
}

+ (id)_writeToFileWithTypologyLog:(id)a3 directoryURL:(id)a4 requireDeviceUnlocked:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  _QWORD v26[3];

  v5 = a5;
  v26[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8
    && (!v5 || TI_DEVICE_UNLOCKED())
    && objc_msgSend((id)objc_opt_class(), "createTypologyDirectoryAtURL:", v9))
  {
    objc_msgSend(v8, "recommendedTypologyLogFilename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "recommendedTraceLogFilename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "accessibilityConfigInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v15 = objc_msgSend(v8, "writeToTypologyLogFile:andTraceLogFile:withAccessibilityInfo:error:", v11, v13, v14, &v23);
    v16 = v23;

    if ((v15 & 1) != 0)
    {
      v26[0] = v11;
      v26[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (TICanLogMessageAtLevel_onceToken != -1)
        dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
      TIOSLogFacility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v8, "filename");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringWithFormat:", CFSTR("%s Error serializing and writing property list %@: %@"), "+[TIKeyboardInputManagerLogger _writeToFileWithTypologyLog:directoryURL:requireDeviceUnlocked:]", v21, v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v22;
        _os_log_debug_impl(&dword_1DA6F2000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)accessibilityConfigInfo
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Accessibility"));
  objc_msgSend(v2, "objectForKey:", CFSTR("AccessibilityEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = objc_msgSend(v2, "BOOLForKey:", CFSTR("FullKeyboardAccessEnabled"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("FullKeyboardAccessEnabled"));

    v8 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VoiceOverTouchUIEnabled"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("VoiceOverTouchUIEnabled"));

    v10 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VoiceOverTouchEnabled"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("VoiceOverTouchEnabled"));

    v12 = objc_msgSend(v2, "BOOLForKey:", CFSTR("VOTIsRunningKey"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("VOTIsRunningKey"));

    v14 = objc_msgSend(v2, "integerForKey:", CFSTR("VoiceOverTouchTypingMode"));
    v15 = CFSTR("Standard Typing");
    if (v14 == 2)
      v15 = CFSTR("Direct Touch Typing");
    if (v14 == 1)
      v16 = CFSTR("Touch Typing");
    else
      v16 = v15;
    objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("VoiceOverTouchTypingMode"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)_writeHumanReadableTraceForTypologyLog:(id)a3 directoryURL:(id)a4
{
  id v5;
  id v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (TI_DEVICE_UNLOCKED()
    && objc_msgSend((id)objc_opt_class(), "createTypologyDirectoryAtURL:", v6))
  {
    v7 = (void *)MEMORY[0x1E0CB37A0];
    objc_msgSend(v5, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptionWithLocale:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Date: %@\n"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "systemVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR("iOS version: %@ (%@)\n"), v12, v13);

    objc_msgSend(v5, "filename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("typology"), CFSTR("typologyTrace"), 8, 0, objc_msgSend(v14, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(".plist"), CFSTR(".log"), 12, 0, objc_msgSend(v15, "length"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "URLByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x1E0CB2AD8];
    v37[0] = *MEMORY[0x1E0CB2AB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dataUsingEncoding:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "createFileAtPath:contents:attributes:", v20, v21, v18);

    if (v22)
    {
      v33 = 0;
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v17, &v33);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v33;
      v25 = v24;
      if (v23 && !v24)
      {
        objc_msgSend(v23, "seekToEndOfFile");
        objc_msgSend(v11, "setString:", &stru_1EA1081D0);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __84__TIKeyboardInputManagerLogger__writeHumanReadableTraceForTypologyLog_directoryURL___block_invoke;
        v30[3] = &unk_1EA104138;
        v26 = v11;
        v31 = v26;
        v32 = v23;
        v27 = v23;
        objc_msgSend(v5, "enumerateTraceRecordsWithBlock:", v30);
        objc_msgSend(v26, "dataUsingEncoding:", 4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject writeData:](v27, "writeData:", v28);

        objc_msgSend(v26, "setString:", &stru_1EA1081D0);
        -[NSObject closeFile](v27, "closeFile");

LABEL_12:
        goto LABEL_13;
      }

    }
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    TIOSLogFacility();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s failed to write trace"), "+[TIKeyboardInputManagerLogger _writeHumanReadableTraceForTypologyLog:directoryURL:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v29;
      _os_log_debug_impl(&dword_1DA6F2000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
    goto LABEL_12;
  }
LABEL_13:

}

+ (void)_backgroundWriteLog:(id)a3 preferences:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  _TIQueueLow();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  TIDispatchAsync();

}

+ (void)_backgroundPruneLogsWithPreferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "typologyDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxBytesPersistedTypologyRecords");
  objc_msgSend(v3, "maxBytesPersistedTypologyTraceLogs");
  objc_msgSend(v3, "maxLifetimeInterval");

  _TIQueueLow();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v6 = v4;
  TIDispatchAsync();

}

+ (void)pruneTypologyLogsAtDirectoryURL:(id)a3 toMaxNumBytes:(int64_t)a4 expirationInterval:(double)a5 satisfyingPredicate:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  _BYTE v43[128];
  _QWORD v44[4];

  v44[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = *MEMORY[0x1E0C998D8];
  v12 = *MEMORY[0x1E0C99998];
  v44[0] = *MEMORY[0x1E0C998D8];
  v44[1] = v12;
  v33 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v13;
  v32 = v9;
  objc_msgSend(v14, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v9, v13, 4, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __117__TIKeyboardInputManagerLogger_pruneTypologyLogsAtDirectoryURL_toMaxNumBytes_expirationInterval_satisfyingPredicate___block_invoke;
  v41[3] = &unk_1EA104230;
  v30 = v10;
  v42 = v30;
  objc_msgSend(v15, "indexesOfObjectsPassingTest:", v41);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectsAtIndexes:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_71);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v38;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v23);
        v36 = 0;
        objc_msgSend(v24, "getResourceValue:forKey:error:", &v36, v11, 0);
        v25 = v36;
        v26 = v25;
        if (v21 > a4
          || (objc_msgSend(v25, "earlierDate:", v34),
              v27 = (void *)objc_claimAutoreleasedReturnValue(),
              v27,
              v27 == v26))
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "removeItemAtURL:error:", v24, 0);

        }
        else
        {
          v35 = 0;
          objc_msgSend(v24, "getResourceValue:forKey:error:", &v35, v33, 0);
          v21 += objc_msgSend(v35, "integerValue");
        }

        ++v23;
      }
      while (v20 != v23);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v20);
  }

}

uint64_t __117__TIKeyboardInputManagerLogger_pruneTypologyLogsAtDirectoryURL_toMaxNumBytes_expirationInterval_satisfyingPredicate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __117__TIKeyboardInputManagerLogger_pruneTypologyLogsAtDirectoryURL_toMaxNumBytes_expirationInterval_satisfyingPredicate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  id v9;
  id v10;

  v10 = 0;
  v4 = *MEMORY[0x1E0C998D8];
  v5 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v10, v4, 0);
  v9 = 0;
  v6 = v10;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v9, v4, 0);

  v7 = objc_msgSend(v9, "compare:", v6);
  return v7;
}

void __85__TIKeyboardInputManagerLogger_submitAggregrateDictionaryReport_inputModeIdentifier___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  if (objc_msgSend(v6, "length"))
  {
    TIStatisticGetKeyForInputMode();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (objc_msgSend(v6, "containsString:", CFSTR(".distr")))
      {
        objc_msgSend(v4, "doubleValue");
        TIStatisticDistributionPushValue();
      }
      else
      {
        objc_msgSend(v4, "longLongValue");
        TIStatisticScalarAddValue();
      }
    }

  }
}

uint64_t __68__TIKeyboardInputManagerLogger__backgroundPruneLogsWithPreferences___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 40);
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    result = +[TIKeyboardInputManagerLogger pruneTypologyLogsAtDirectoryURL:toMaxNumBytes:expirationInterval:satisfyingPredicate:](TIKeyboardInputManagerLogger, "pruneTypologyLogsAtDirectoryURL:toMaxNumBytes:expirationInterval:satisfyingPredicate:", *(_QWORD *)(result + 32), v2, &__block_literal_global_64, *(double *)(result + 48));
  v3 = *(_QWORD *)(v1 + 56);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    return +[TIKeyboardInputManagerLogger pruneTypologyLogsAtDirectoryURL:toMaxNumBytes:expirationInterval:satisfyingPredicate:](TIKeyboardInputManagerLogger, "pruneTypologyLogsAtDirectoryURL:toMaxNumBytes:expirationInterval:satisfyingPredicate:", *(_QWORD *)(v1 + 32), v3, &__block_literal_global_65, *(double *)(v1 + 48));
  return result;
}

uint64_t __68__TIKeyboardInputManagerLogger__backgroundPruneLogsWithPreferences___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0DBDD28];
  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isTraceLogFilename:", v3);

  return v4;
}

uint64_t __68__TIKeyboardInputManagerLogger__backgroundPruneLogsWithPreferences___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0DBDD28];
  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isTypologyLogFilename:", v3);

  return v4;
}

void __75__TIKeyboardInputManagerLogger__backgroundWriteLog_preferences_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "typologyDirectoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[TIKeyboardInputManagerLogger _writeToFileWithTypologyLog:directoryURL:requireDeviceUnlocked:](TIKeyboardInputManagerLogger, "_writeToFileWithTypologyLog:directoryURL:requireDeviceUnlocked:", *(_QWORD *)(a1 + 40), v3, 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __84__TIKeyboardInputManagerLogger__writeHumanReadableTraceForTypologyLog_directoryURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1DF0A2708]();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v8, "logText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v5);

  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >= 0x7D1)
  {
    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "dataUsingEncoding:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeData:", v7);

    objc_msgSend(*(id *)(a1 + 32), "setString:", &stru_1EA1081D0);
  }
  objc_autoreleasePoolPop(v3);

}

@end
