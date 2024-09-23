@implementation CACMessageTracerUtilities

+ (id)sharedCACMessageTracerUtilities
{
  if (sharedCACMessageTracerUtilities_instaniateReporter != -1)
    dispatch_once(&sharedCACMessageTracerUtilities_instaniateReporter, &__block_literal_global_10);
  return (id)sCACMessageTracerUtilities;
}

void __60__CACMessageTracerUtilities_sharedCACMessageTracerUtilities__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sCACMessageTracerUtilities;
  sCACMessageTracerUtilities = v0;

}

- (CACMessageTracerUtilities)init
{
  CACMessageTracerUtilities *v2;
  uint64_t v3;
  NSOperationQueue *remoteSpeechOperationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CACMessageTracerUtilities;
  v2 = -[CACMessageTracerUtilities init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    remoteSpeechOperationQueue = v2->_remoteSpeechOperationQueue;
    v2->_remoteSpeechOperationQueue = (NSOperationQueue *)v3;

    -[CACMessageTracerUtilities _prepareToSendAudioDataToAppleServers](v2, "_prepareToSendAudioDataToAppleServers");
  }
  return v2;
}

- (void)logCommandWithIdentifier:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *targetApplicationIdentifier;
  int AppBooleanValue;
  NSDictionary *customUserCommandProperties;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
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
  NSString *textAreaIdentifierOrLabel;
  NSString *textAreaSelectionRange;
  CACMessageTracerUtilities *v33;
  void *v34;
  CACMessageTracerUtilities *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  CACMessageTracerUtilities *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t AppIntegerValue;
  double v46;
  double v47;
  double v48;
  const void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  _BOOL4 v55;
  Boolean keyExistsAndHasValidFormat;
  const __CFString *v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_localeIdentifier)
  {
    objc_msgSend(v5, "bestLocaleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACMessageTracerUtilities setLocaleIdentifier:](self, "setLocaleIdentifier:", v8);

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v4)
    v11 = v4;
  else
    v11 = &stru_24F2ADCC8;
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("CommandIdentifier"));
  if (self->_targetApplicationIdentifier)
    targetApplicationIdentifier = (const __CFString *)self->_targetApplicationIdentifier;
  else
    targetApplicationIdentifier = &stru_24F2ADCC8;
  objc_msgSend(v10, "setObject:forKey:", targetApplicationIdentifier, CFSTR("TargetApplicationIdentifier"));
  objc_msgSend(v10, "setObject:forKey:", v7, CFSTR("RecordedTime"));
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("CACAddDebuggingInfoToRecentCommands"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl"), &keyExistsAndHasValidFormat);
  customUserCommandProperties = self->_customUserCommandProperties;
  if (AppBooleanValue && keyExistsAndHasValidFormat)
  {
    if (customUserCommandProperties)
    {
      -[CACMessageTracerUtilities _mutablePlistCompatibleObjectFromObject:](self, "_mutablePlistCompatibleObjectFromObject:", self->_customUserCommandProperties);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("CustomUserCommandProperties"));

    }
    -[CACMessageTracerUtilities recognitionProperties](self, "recognitionProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else
    {
      -[CACMessageTracerUtilities dictationProperties](self, "dictationProperties");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (v20)
      {
LABEL_31:
        v28 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "alwaysShowOverlayType");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "numberWithBool:", v29 != 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v30, CFSTR("AlwaysShowOverlayType"));

        textAreaIdentifierOrLabel = self->_textAreaIdentifierOrLabel;
        if (textAreaIdentifierOrLabel)
          objc_msgSend(v10, "setObject:forKey:", textAreaIdentifierOrLabel, CFSTR("TextAreaIdentifierOrLabel"));
        textAreaSelectionRange = self->_textAreaSelectionRange;
        if (textAreaSelectionRange)
          objc_msgSend(v10, "setObject:forKey:", textAreaSelectionRange, CFSTR("TextAreaSelectionRange"));
        goto LABEL_35;
      }
    }
    v21 = (void *)objc_opt_new();
    -[CACMessageTracerUtilities recognitionProperties](self, "recognitionProperties");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[CACMessageTracerUtilities recognitionProperties](self, "recognitionProperties");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACMessageTracerUtilities _mutablePlistCompatibleObjectFromObject:](self, "_mutablePlistCompatibleObjectFromObject:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        objc_msgSend(v21, "addEntriesFromDictionary:", v24);

    }
    -[CACMessageTracerUtilities dictationProperties](self, "dictationProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[CACMessageTracerUtilities dictationProperties](self, "dictationProperties");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CACMessageTracerUtilities _mutablePlistCompatibleObjectFromObject:](self, "_mutablePlistCompatibleObjectFromObject:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        objc_msgSend(v21, "addEntriesFromDictionary:", v27);

    }
    if (objc_msgSend(v21, "count"))
      objc_msgSend(v10, "setObject:forKey:", v21, CFSTR("RecognitionParameters"));

    goto LABEL_31;
  }
  if (customUserCommandProperties)
  {
    v57 = CFSTR("CustomType");
    -[NSDictionary objectForKey:](customUserCommandProperties, "objectForKey:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v18, CFSTR("CustomUserCommandProperties"));

  }
LABEL_35:
  if (-[__CFString length](v4, "length"))
  {
    v33 = self;
    objc_sync_enter(v33);
    objc_msgSend(v5, "recentCommandEntries");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "insertObject:atIndex:", v10, 0);
    if ((unint64_t)objc_msgSend(v34, "count") >= 0x65)
      objc_msgSend(v34, "removeObjectsInRange:", 100, objc_msgSend(v34, "count") - 100);
    objc_msgSend(v5, "setRecentCommandEntries:", v34);

    objc_sync_exit(v33);
  }
  if (-[__CFString length](v4, "length"))
  {
    v35 = self;
    objc_sync_enter(v35);
    objc_msgSend(v5, "commandCounts");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v36, "objectForKey:", v4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "numberWithUnsignedLongLong:", objc_msgSend(v38, "unsignedLongLongValue") + 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKey:", v39, v4);

    objc_msgSend(v5, "setCommandCounts:", v36);
    objc_sync_exit(v35);

  }
  if (-[NSString length](self->_targetApplicationIdentifier, "length"))
  {
    v40 = self;
    objc_sync_enter(v40);
    objc_msgSend(v5, "targetApplicationCounts");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v41, "objectForKey:", self->_targetApplicationIdentifier);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "numberWithUnsignedLongLong:", objc_msgSend(v43, "unsignedLongLongValue") + 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setObject:forKey:", v44, self->_targetApplicationIdentifier);

    objc_msgSend(v5, "setTargetApplicationCounts:", v41);
    objc_sync_exit(v40);

  }
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CACMessageTraceRandomizedCountDown"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"), 0);
  objc_msgSend(v7, "doubleValue");
  v47 = v46;
  objc_msgSend(v5, "lastCommandDate");
  if (v47 <= v48 + 3481.0)
  {
    if (AppIntegerValue < 1)
      goto LABEL_48;
    v49 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", --AppIntegerValue);
  }
  else
  {
    AppIntegerValue = rand() % 11;
    v49 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", AppIntegerValue);
  }
  CFPreferencesSetAppValue(CFSTR("CACMessageTraceRandomizedCountDown"), v49, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
LABEL_48:
  if (!AppIntegerValue)
  {
    v50 = (void *)CFPreferencesCopyAppValue(CFSTR("CACLastCommandRecognizedMessageTrace"), CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
    if (!v50
      || (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v7, "doubleValue"), v52 = v51, objc_msgSend(v50, "doubleValue"), v52 > v53 + 3481.0))
    {
      -[CACMessageTracerUtilities sendCoreAnalyticsForRecognizedCommandIdentifier:appIdentifier:](self, "sendCoreAnalyticsForRecognizedCommandIdentifier:appIdentifier:", v4, self->_targetApplicationIdentifier);
      objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "siriDataSharingOptInStatus") == 1;

      if (v55)
        -[CACMessageTracerUtilities sendRecentAudioDataToAppleServers](self, "sendRecentAudioDataToAppleServers");
      CFPreferencesSetAppValue(CFSTR("CACLastCommandRecognizedMessageTrace"), v7, CFSTR("com.apple.speech.SpeechRecognitionCommandAndControl.Log"));
    }

  }
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v5, "setLastCommandDate:");
  -[CACMessageTracerUtilities setCustomUserCommandProperties:](self, "setCustomUserCommandProperties:", 0);
  -[CACMessageTracerUtilities setRecognitionProperties:](self, "setRecognitionProperties:", 0);
  -[CACMessageTracerUtilities setDictationProperties:](self, "setDictationProperties:", 0);

}

- (void)sendCoreAnalyticsForRecognizedCommandIdentifier:(id)a3 appIdentifier:(id)a4
{
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  NSDictionary *customUserCommandProperties;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  CACMessageTracerUtilities *v41;
  void *v42;
  __CFString *v43;
  id v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  const __CFString *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  v6 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v8, "recentCommandEntries");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v9)
  {
    v10 = v9;
    v41 = self;
    v42 = v8;
    v43 = v6;
    v11 = CFSTR("Custom");
    v12 = *(_QWORD *)v47;
    v13 = 0.0;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKey:", CFSTR("CommandIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "hasPrefix:", v11))
        {
          v17 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v15, "objectForKey:", CFSTR("CustomUserCommandProperties"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKey:", CFSTR("CustomType"));
          v19 = v10;
          v20 = v12;
          v21 = v7;
          v22 = v11;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringWithFormat:", CFSTR("Custom_%@"), v23);
          v24 = objc_claimAutoreleasedReturnValue();

          v11 = v22;
          v7 = v21;
          v12 = v20;
          v10 = v19;

          v16 = (void *)v24;
        }
        if (v13 == 0.0)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("RecordedTime"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v13 = v26;

        }
        objc_msgSend(v7, "insertObject:atIndex:", v16, 0);
        if ((unint64_t)objc_msgSend(v7, "count") >= 3)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("RecordedTime"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          v30 = v13 - v29;

          if (v30 > 60.0)
          {

            v7 = 0;
          }
          v8 = v42;
          v6 = v43;
          self = v41;
          v27 = v44;

          goto LABEL_18;
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v10)
        continue;
      break;
    }
    v8 = v42;
    v6 = v43;
    self = v41;
  }
  v27 = v44;
LABEL_18:

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v27;
  v33 = v32;
  if (objc_msgSend(v32, "hasPrefix:", CFSTR("Custom")))
  {
    customUserCommandProperties = self->_customUserCommandProperties;
    v33 = v32;
    if (customUserCommandProperties)
    {
      v35 = (void *)MEMORY[0x24BDD17C8];
      -[NSDictionary objectForKey:](customUserCommandProperties, "objectForKey:", CFSTR("CustomType"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("Custom_%@"), v36);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v31, "setObject:forKey:", v33, CFSTR("CommandIdentifier"));
  if (v6)
    v37 = v6;
  else
    v37 = &stru_24F2ADCC8;
  objc_msgSend(v31, "setObject:forKey:", v37, CFSTR("AppIdentifier"));
  if (objc_msgSend(v7, "count") == 3)
  {
    objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v38, CFSTR("RecentCommandTriplet"));

  }
  -[CACMessageTracerUtilities dictionaryOfNormallyStaticPreferenceValuesForCoreAnalytics](self, "dictionaryOfNormallyStaticPreferenceValuesForCoreAnalytics");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addEntriesFromDictionary:", v39);

  AnalyticsSendEvent();
  CACLogGeneral();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v51 = CFSTR("com.apple.commandandcontrol.commandrecognized");
    _os_log_impl(&dword_229A40000, v40, OS_LOG_TYPE_DEFAULT, "Sent %@ event to CoreAnalytics.", buf, 0xCu);
  }

}

- (id)dictionaryOfNormallyStaticPreferenceValuesForCoreAnalytics
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[19];
  _QWORD v49[19];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "rawCustomCommandsPreferencesDictionary");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    v39 = 0;
    v41 = 0;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(obj, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("Enabled"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "BOOLValue");

        objc_msgSend(v11, "objectForKey:", CFSTR("ConfirmationRequired"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "BOOLValue");

        if (objc_msgSend(v10, "hasPrefix:", CFSTR("Custom")))
        {
          ++v7;
          objc_msgSend(v11, "objectForKey:", CFSTR("CustomType"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v6 += objc_msgSend(v14, "isEqualToString:", CFSTR("RunGesture"));
          v4 += objc_msgSend(v14, "isEqualToString:", CFSTR("RunShortcutsWorkflow"));
          v5 += objc_msgSend(v14, "isEqualToString:", CFSTR("RunUserActionFlow"));
          v39 += objc_msgSend(v14, "isEqualToString:", CFSTR("PasteText"));
          v41 += objc_msgSend(v14, "isEqualToString:", CFSTR("PasteBoard"));

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v39 = 0;
    v41 = 0;
    v6 = 0;
    v7 = 0;
  }
  v48[0] = CFSTR("LocaleIdentifier");
  objc_msgSend(v38, "bestLocaleIdentifier");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v37;
  v48[1] = CFSTR("VocabularyEntriesCountLog2Bucket");
  objc_msgSend(v38, "bestLocaleIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "vocabularyEntriesForLocaleIdentifier:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  NumberWithLog2BucketForIntegerValue(objc_msgSend(v35, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v34;
  v48[2] = CFSTR("CustomCommandsCountLog2Bucket");
  NumberWithLog2BucketForIntegerValue(v7);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v33;
  v48[3] = CFSTR("CustomGesturesCountLog2Bucket");
  NumberWithLog2BucketForIntegerValue(v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v32;
  v48[4] = CFSTR("CustomShortcutsCountLog2Bucket");
  NumberWithLog2BucketForIntegerValue(v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v31;
  v48[5] = CFSTR("CustomRecordedActionsCountLog2Bucket");
  NumberWithLog2BucketForIntegerValue(v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v30;
  v48[6] = CFSTR("CustomTextInsertLog2Bucket");
  NumberWithLog2BucketForIntegerValue(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v40;
  v48[7] = CFSTR("CustomPasteboardLog2Bucket");
  NumberWithLog2BucketForIntegerValue(v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v42;
  v48[8] = CFSTR("ContinousOverlayType");
  objc_msgSend(v38, "alwaysShowOverlayType");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v29;
  v48[9] = CFSTR("GridOverlayIsCustomized");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v38, "gridOverlayCustomColumnsEnabled") | objc_msgSend(v38, "gridOverlayCustomRowsEnabled"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v28;
  v48[10] = CFSTR("VisualConfirmationIsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v38, "showTextResponseUponRecognition"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v27;
  v48[11] = CFSTR("AudioConfirmationIsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v38, "playSoundUponRecognition"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v26;
  v48[12] = CFSTR("ShowHintsIsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v38, "userHintsFeatures") != 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v15;
  v48[13] = CFSTR("ShareAudioDataIsEnabled");
  v16 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "siriDataSharingOptInStatus") == 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[13] = v18;
  v48[14] = CFSTR("AttentionAwareMode");
  objc_msgSend(v38, "attentionAwareAction");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[14] = v19;
  v48[15] = CFSTR("VoiceOverIsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSVoiceOverTouchEnabled());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[15] = v20;
  v48[16] = CFSTR("AssistiveTouchIsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSAssistiveTouchEnabled());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[16] = v21;
  v48[17] = CFSTR("ZoomIsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSZoomTouchEnabled());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[17] = v22;
  v48[18] = CFSTR("SwitchControlIsEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", _AXSAssistiveTouchScannerEnabled());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[18] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (void)_prepareToSendAudioDataToAppleServers
{
  void *v3;
  uint64_t v4;
  CFPropertyListRef *v5;

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "siriDataSharingOptInStatus");

  v5 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (v4 != 1)
    v5 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  CFPreferencesSetAppValue(CFSTR("SaveUtteranceToFile"), *v5, CFSTR("com.apple.SpeechRecognitionCore"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.SpeechRecognitionCore"));
  if (v4 != 1)
    -[CACMessageTracerUtilities removeCachedAudioFile](self, "removeCachedAudioFile");
}

- (void)removeCachedAudioFile
{
  const __CFArray *v2;
  const __CFURL *ValueAtIndex;
  const __CFURL *v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  char buffer[2000];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v2, 0);
  v4 = CFURLCreateCopyAppendingPathComponent(0, ValueAtIndex, CFSTR("com.apple.SpeechRecognitionCore"), 1u);
  CFRelease(v2);
  v5 = CFURLCopyPath(v4);
  if (v5)
  {
    v6 = v5;
    CFStringGetCString(v5, buffer, 2000, 0x8000100u);
    if (!opendir(buffer) && mkdir(buffer, 0x1EDu))
      NSLog(CFSTR("CopySRCacheURL Error creating %@"), v4);
    CFRelease(v6);
  }
  -[__CFURL path](v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("srcLogAudioFile.wav"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemAtPath:error:", v8, 0);

  }
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  CACLogAudio();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "requestIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_229A40000, v7, OS_LOG_TYPE_DEFAULT, "speechRecognitionTask:didFinishRecognition:, task ID: %@, result: %@", (uint8_t *)&v9, 0x16u);

  }
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  CACLogAudio();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "requestIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_229A40000, v4, OS_LOG_TYPE_DEFAULT, "speechRecognitionTaskWasCancelled:, task ID: %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CACLogAudio();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "requestIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 1024;
    v11 = v4;
    _os_log_impl(&dword_229A40000, v6, OS_LOG_TYPE_DEFAULT, "speechRecognitionTask:didFinishSuccessfully:, task ID: %@, successfully: %d", (uint8_t *)&v8, 0x12u);

  }
}

- (id)_mutablePlistCompatibleObjectFromObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v4, "allKeys");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACMessageTracerUtilities _mutablePlistCompatibleObjectFromObject:](self, "_mutablePlistCompatibleObjectFromObject:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v5, "setObject:forKey:", v13, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v8);
    }
LABEL_22:

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = v4;
    v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v6);
          -[CACMessageTracerUtilities _mutablePlistCompatibleObjectFromObject:](self, "_mutablePlistCompatibleObjectFromObject:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v5, "addObject:", v18);

        }
        v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v15);
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19 = v4;
  }
  else
  {
    objc_msgSend(v4, "description");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v19;
LABEL_29:

  return v5;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (NSString)targetApplicationIdentifier
{
  return self->_targetApplicationIdentifier;
}

- (void)setTargetApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_targetApplicationIdentifier, a3);
}

- (NSString)textAreaIdentifierOrLabel
{
  return self->_textAreaIdentifierOrLabel;
}

- (void)setTextAreaIdentifierOrLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textAreaIdentifierOrLabel, a3);
}

- (NSString)textAreaSelectionRange
{
  return self->_textAreaSelectionRange;
}

- (void)setTextAreaSelectionRange:(id)a3
{
  objc_storeStrong((id *)&self->_textAreaSelectionRange, a3);
}

- (NSDictionary)customUserCommandProperties
{
  return self->_customUserCommandProperties;
}

- (void)setCustomUserCommandProperties:(id)a3
{
  objc_storeStrong((id *)&self->_customUserCommandProperties, a3);
}

- (NSDictionary)recognitionProperties
{
  return self->_recognitionProperties;
}

- (void)setRecognitionProperties:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionProperties, a3);
}

- (NSDictionary)dictationProperties
{
  return self->_dictationProperties;
}

- (void)setDictationProperties:(id)a3
{
  objc_storeStrong((id *)&self->_dictationProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationProperties, 0);
  objc_storeStrong((id *)&self->_remoteSpeechOperationQueue, 0);
  objc_storeStrong((id *)&self->_recognitionProperties, 0);
  objc_storeStrong((id *)&self->_customUserCommandProperties, 0);
  objc_storeStrong((id *)&self->_textAreaSelectionRange, 0);
  objc_storeStrong((id *)&self->_textAreaIdentifierOrLabel, 0);
  objc_storeStrong((id *)&self->_targetApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
