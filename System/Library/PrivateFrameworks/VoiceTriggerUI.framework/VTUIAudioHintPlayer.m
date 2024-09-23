@implementation VTUIAudioHintPlayer

- (VTUIAudioHintPlayer)initWithLanguage:(id)a3
{
  id v4;
  VTUIAudioHintPlayer *v5;
  VTUIAudioHintPlayer *v6;
  VTUISpeechSynthesizer *v7;
  VTUISpeechSynthesizer *synth;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VTUIAudioHintPlayer;
  v5 = -[VTUIAudioHintPlayer init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[VTUIAudioHintPlayer setLanguage:](v5, "setLanguage:", v4);
    v7 = objc_alloc_init(VTUISpeechSynthesizer);
    synth = v6->_synth;
    v6->_synth = v7;

    v9 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[VTUIAudioHintPlayer initWithLanguage:]";
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s Audio Hint language: %@", buf, 0x16u);
    }
  }

  return v6;
}

- (VTUIAudioHintPlayer)initWithLanguage:(id)a3 isCompact:(BOOL)a4
{
  self->_useCompactHints = a4;
  return -[VTUIAudioHintPlayer initWithLanguage:](self, "initWithLanguage:", a3);
}

- (void)setLanguage:(id)a3
{
  id v5;
  void *v6;
  AFVoiceInfo *v7;
  AFVoiceInfo *outputVoice;
  AFVoiceInfo *v9;
  AFVoiceInfo *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_language, a3);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outputVoice");
  v7 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue();
  outputVoice = self->_outputVoice;
  self->_outputVoice = v7;

  if (!self->_outputVoice)
  {
    objc_msgSend(MEMORY[0x24BE093A0], "voiceInfoForLanguageCode:", self->_language);
    v9 = (AFVoiceInfo *)objc_claimAutoreleasedReturnValue();
    v10 = self->_outputVoice;
    self->_outputVoice = v9;

  }
  -[VTUIAudioHintPlayer _setupHints](self, "_setupHints");
  v11 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[VTUIAudioHintPlayer setLanguage:]";
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s Audio Hint language: %@", (uint8_t *)&v13, 0x16u);
  }
  if (-[VTUIAudioHintPlayer _hasValidHints](self, "_hasValidHints"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "_deviceLanguage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldSpeakAudioHint = -[VTUIAudioHintPlayer _systemLanguageMatchesSiriLanguage:siriLanguage:](self, "_systemLanguageMatchesSiriLanguage:siriLanguage:", v12, self->_language);

  }
  else
  {
    self->_shouldSpeakAudioHint = 0;
  }

}

- (void)updateIfNeededForUsesMultipleTriggers:(BOOL)a3
{
  id v4;

  if (self->_useCompactHints != a3)
  {
    self->_useCompactHints = a3;
    -[VTUIAudioHintPlayer _setupHints](self, "_setupHints");
    if (-[VTUIAudioHintPlayer _hasValidHints](self, "_hasValidHints"))
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "_deviceLanguage");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      self->_shouldSpeakAudioHint = -[VTUIAudioHintPlayer _systemLanguageMatchesSiriLanguage:siriLanguage:](self, "_systemLanguageMatchesSiriLanguage:siriLanguage:", v4, self->_language);

    }
    else
    {
      self->_shouldSpeakAudioHint = 0;
    }
  }
}

- (void)setOutputVoice:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_outputVoice, a3);
  -[VTUIAudioHintPlayer _setupHints](self, "_setupHints");
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[VTUIAudioHintPlayer setOutputVoice:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_229EF7000, v6, OS_LOG_TYPE_DEFAULT, "%s Audio Hint output voice: %@", (uint8_t *)&v8, 0x16u);
  }
  if (-[VTUIAudioHintPlayer _hasValidHints](self, "_hasValidHints"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "_deviceLanguage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldSpeakAudioHint = -[VTUIAudioHintPlayer _systemLanguageMatchesSiriLanguage:siriLanguage:](self, "_systemLanguageMatchesSiriLanguage:siriLanguage:", v7, self->_language);

  }
  else
  {
    self->_shouldSpeakAudioHint = 0;
  }

}

- (BOOL)_hasValidHints
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  BOOL result;
  NSString *language;
  int v9;
  const char *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_trainingPageAudioHintPreviews, "count") > 4)
    return 1;
  if (-[NSArray count](self->_trainingPageAudioHintInstructions, "count") >= 5)
  {
    -[NSArray objectAtIndexedSubscript:](self->_trainingPageAudioHintInstructions, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqualToString:", &stru_24F340078);

    if (!v4)
      return 1;
  }
  v5 = *MEMORY[0x24BE08FB0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v6)
  {
    language = self->_language;
    v9 = 136315394;
    v10 = "-[VTUIAudioHintPlayer _hasValidHints]";
    v11 = 2112;
    v12 = language;
    _os_log_impl(&dword_229EF7000, v5, OS_LOG_TYPE_DEFAULT, "%s No valid audio hints for language %@", (uint8_t *)&v9, 0x16u);
    return 0;
  }
  return result;
}

- (BOOL)_systemLanguageMatchesSiriLanguage:(id)a3 siriLanguage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject **v11;
  NSObject *v12;
  char v13;
  const __CFString *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@-%@"), v7, v8);
  objc_msgSend(v6, "scriptCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (NSObject **)MEMORY[0x24BE08FB0];
  v12 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v20 = "-[VTUIAudioHintPlayer _systemLanguageMatchesSiriLanguage:siriLanguage:]";
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v10;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_229EF7000, v12, OS_LOG_TYPE_DEFAULT, "%s System locale (language-scriptCode-countryCode): %@-%@-%@, Siri language: %@", buf, 0x34u);
  }
  if ((objc_msgSend(v5, "isEqualToString:", v9) & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("zh"))
    && objc_msgSend(v10, "isEqualToString:", CFSTR("Hans")))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("zh-CN")) & 1) != 0)
    {
LABEL_4:
      v13 = 1;
      goto LABEL_21;
    }
    v14 = CFSTR("yue-CN");
LABEL_16:
    v13 = objc_msgSend(v5, "isEqualToString:", v14);
    goto LABEL_21;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("zh"))
    && ((objc_msgSend(v8, "isEqualToString:", CFSTR("MO")) & 1) != 0
     || objc_msgSend(v8, "isEqualToString:", CFSTR("HK"))))
  {
    v14 = CFSTR("zh-HK");
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("zh"))
    && objc_msgSend(v10, "isEqualToString:", CFSTR("Hant")))
  {
    v14 = CFSTR("zh-TW");
    goto LABEL_16;
  }
  if (v10)
  {
    v15 = *v11;
    v13 = 0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[VTUIAudioHintPlayer _systemLanguageMatchesSiriLanguage:siriLanguage:]";
      _os_log_impl(&dword_229EF7000, v15, OS_LOG_TYPE_DEFAULT, "%s Not playing Audio Hint due to Siri language and system language mismatch", buf, 0xCu);
      v13 = 0;
    }
  }
  else
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v17, "isEqualToString:", v7);
  }
LABEL_21:

  return v13;
}

- (void)_setupHints
{
  void *v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *trainingPageAudioHintInstructions;
  os_log_t *v13;
  NSObject *v14;
  NSString *language;
  os_log_t v16;
  AFVoiceInfo *outputVoice;
  NSObject *v18;
  NSString *v19;
  NSArray *v20;
  NSArray *trainingPageAudioHintPreviews;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  +[VTUIStyle sharedStyle](VTUIStyle, "sharedStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i != 6; ++i)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AUDIO_INSTRUCTION_UTT%lu"), i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "VTUIDeviceSpecificString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedAudioStringForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v3, "addObject:", v8);

  }
  +[VTUIStringsHelper sharedStringsHelper](VTUIStringsHelper, "sharedStringsHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedAudioStringForKey:", CFSTR("AUDIO_INSTRUCTION_READY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trainingPageAudioHintInstructions = self->_trainingPageAudioHintInstructions;
  self->_trainingPageAudioHintInstructions = v11;

  v13 = (os_log_t *)MEMORY[0x24BE08FB0];
  v14 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    language = self->_language;
    *(_DWORD *)buf = 136315394;
    v24 = "-[VTUIAudioHintPlayer _setupHints]";
    v25 = 2112;
    v26 = language;
    _os_log_impl(&dword_229EF7000, v14, OS_LOG_TYPE_DEFAULT, "%s Audio Hint language: %@", buf, 0x16u);
  }
  v16 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    outputVoice = self->_outputVoice;
    v18 = v16;
    -[AFVoiceInfo description](outputVoice, "description");
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v24 = "-[VTUIAudioHintPlayer _setupHints]";
    v25 = 2112;
    v26 = v19;
    _os_log_impl(&dword_229EF7000, v18, OS_LOG_TYPE_DEFAULT, "%s Audio Hint outputVoice: %@", buf, 0x16u);

  }
  -[VTUIAudioHintPlayer _getTrainingPageAudioHintRequests](self, "_getTrainingPageAudioHintRequests");
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trainingPageAudioHintPreviews = self->_trainingPageAudioHintPreviews;
  self->_trainingPageAudioHintPreviews = v20;

}

- (id)_getTrainingPageAudioHintRequests
{
  void *v3;
  uint64_t i;
  id v5;
  NSString *language;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i != 7; ++i)
  {
    v5 = objc_alloc(MEMORY[0x24BEA7A58]);
    language = self->_language;
    -[AFVoiceInfo name](self->_outputVoice, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithLanguage:name:", language, v7);

    v9 = objc_alloc(MEMORY[0x24BEA79F0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VTUIAudioHintPlayer useCompactHints](self, "useCompactHints"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithVoice:dialogNumber:useCompactHints:", v8, i, v10);

    if (objc_msgSend(v11, "isValid"))
      objc_msgSend(v3, "addObject:", v11);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_audioHintPathForFileName:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[VTUIAudioHintPlayer _audioHintPathForFileName:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_229EF7000, v7, OS_LOG_TYPE_DEFAULT, "%s %@: Finding path for filename: %@", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathForResource:ofType:", v4, CFSTR("opx"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "-[VTUIAudioHintPlayer _audioHintPathForFileName:]";
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_229EF7000, v11, OS_LOG_TYPE_DEFAULT, "%s No audio hint file %@", (uint8_t *)&v13, 0x16u);
    }
  }

  return v10;
}

- (void)cleanup
{
  NSTimer *timer;

  -[VTUISpeechSynthesizer stopSpeaking](self->_synth, "stopSpeaking");
  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)speakConfirmationDialog:(id)a3
{
  void (**v4)(id, id);
  NSTimer *v5;
  NSTimer *timer;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  VTUISpeechSynthesizer *synth;
  void *v14;
  void *v15;
  VTUISpeechSynthesizer *v16;
  NSString *language;
  _QWORD v18[4];
  void *v19;
  void (**v20)(id, id);
  _QWORD v21[4];
  void *v22;
  void (**v23)(id, id);
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, id))a3;
  -[NSTimer invalidate](self->_timer, "invalidate");
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerFired, 0, 0, 3.0);
  v5 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  timer = self->_timer;
  self->_timer = v5;

  objc_msgSend(MEMORY[0x24BEC1DF0], "requestPhraseSpotterBypassing:timeout:", 1, 3.0);
  v7 = (os_log_t *)MEMORY[0x24BE09000];
  v8 = *MEMORY[0x24BE09000];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]";
    v26 = 2048;
    v27 = 0x4008000000000000;
    _os_log_impl(&dword_229EF7000, v8, OS_LOG_TYPE_DEFAULT, "%s requestPhraseSpotterBypassing for %f seconds", buf, 0x16u);
  }
  if (self->_shouldSpeakAudioHint)
  {
    if (-[NSArray count](self->_trainingPageAudioHintPreviews, "count") == 5)
    {
      v9 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]";
        _os_log_impl(&dword_229EF7000, v9, OS_LOG_TYPE_DEFAULT, "%s Locale only has training dialogs without a confirmation dialog", buf, 0xCu);
      }
      v10 = objc_alloc(MEMORY[0x24BDD1540]);
      v11 = (id)objc_msgSend(v10, "initWithDomain:code:userInfo:", *MEMORY[0x24BE09488], 0, 0);
      v4[2](v4, v11);
    }
    else
    {
      if (-[NSArray count](self->_trainingPageAudioHintPreviews, "count") == 6)
      {
        -[NSArray lastObject](self->_trainingPageAudioHintPreviews, "lastObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setUseCompactHints:", -[VTUIAudioHintPlayer useCompactHints](self, "useCompactHints"));
        synth = self->_synth;
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __47__VTUIAudioHintPlayer_speakConfirmationDialog___block_invoke;
        v21[3] = &unk_24F33E158;
        v22 = v12;
        v23 = v4;
        v11 = v12;
        -[VTUISpeechSynthesizer speak:completion:](synth, "speak:completion:", v11, v21);

        v14 = v22;
      }
      else
      {
        -[NSArray lastObject](self->_trainingPageAudioHintInstructions, "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = self->_synth;
        language = self->_language;
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __47__VTUIAudioHintPlayer_speakConfirmationDialog___block_invoke_49;
        v18[3] = &unk_24F33E158;
        v19 = v15;
        v20 = v4;
        v11 = v15;
        -[VTUISpeechSynthesizer speak:language:completion:](v16, "speak:language:completion:", v11, language, v18);

        v14 = v19;
      }

    }
  }

}

void __47__VTUIAudioHintPlayer_speakConfirmationDialog___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE09000];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v10 = 136315394;
      v11 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]_block_invoke";
      v12 = 2112;
      v13 = v3;
      v8 = "%s Error speaking confirmation dialog %@";
LABEL_6:
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    v9 = *(void **)(a1 + 32);
    v10 = 136315394;
    v11 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    v8 = "%s Finished speaking confirmation dialog audioHintRequest %@";
    goto LABEL_6;
  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v6, v7);

}

void __47__VTUIAudioHintPlayer_speakConfirmationDialog___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE09000];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v10 = 136315394;
      v11 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]_block_invoke";
      v12 = 2112;
      v13 = v3;
      v8 = "%s Error speaking confirmation dialog %@";
LABEL_6:
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    v9 = *(void **)(a1 + 32);
    v10 = 136315394;
    v11 = "-[VTUIAudioHintPlayer speakConfirmationDialog:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    v8 = "%s Finished speaking confirmation dialog %@";
    goto LABEL_6;
  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v6, v7);

}

- (void)_timerFired
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  NSTimer *v6;
  NSTimer *timer;
  void *v8;
  NSTimer *v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = -[VTUISpeechSynthesizer isSpeaking](self->_synth, "isSpeaking");
  v4 = *MEMORY[0x24BE09000];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v10 = 136315394;
      v11 = "-[VTUIAudioHintPlayer _timerFired]";
      v12 = 2048;
      v13 = 0x4000000000000000;
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s requestPhraseSpotterBypassing for %f more seconds because synth is still speaking", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__timerFired, 0, 0, 2.0);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v6;

    v8 = (void *)MEMORY[0x24BEC1DF0];
    -[NSTimer timeInterval](self->_timer, "timeInterval");
    objc_msgSend(v8, "requestPhraseSpotterBypassing:timeout:", 1);
  }
  else
  {
    if (v5)
    {
      v10 = 136315138;
      v11 = "-[VTUIAudioHintPlayer _timerFired]";
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, "%s Reenabling phrase spotter", (uint8_t *)&v10, 0xCu);
    }
    -[NSTimer invalidate](self->_timer, "invalidate");
    v9 = self->_timer;
    self->_timer = 0;

  }
}

- (void)speakAudioHint:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSArray *trainingPageAudioHintPreviews;
  NSArray *trainingPageAudioHintInstructions;
  void *v9;
  void *v10;
  VTUISpeechSynthesizer *synth;
  id *v12;
  id *v13;
  id v14;
  VTUISpeechSynthesizer *v15;
  NSString *language;
  _QWORD v17[4];
  void *v18;
  id v19;
  _QWORD v20[4];
  void *v21;
  id v22;

  v6 = a4;
  if (self->_shouldSpeakAudioHint)
  {
    trainingPageAudioHintPreviews = self->_trainingPageAudioHintPreviews;
    if (trainingPageAudioHintPreviews && -[NSArray count](trainingPageAudioHintPreviews, "count") - 1 >= a3)
    {
      if (-[NSArray count](self->_trainingPageAudioHintPreviews, "count") <= a3)
      {
        v10 = 0;
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_trainingPageAudioHintPreviews, "objectAtIndexedSubscript:", a3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setUseCompactHints:", -[VTUIAudioHintPlayer useCompactHints](self, "useCompactHints"));
      }
      synth = self->_synth;
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __49__VTUIAudioHintPlayer_speakAudioHint_completion___block_invoke;
      v20[3] = &unk_24F33E158;
      v12 = &v21;
      v21 = v10;
      v13 = &v22;
      v22 = v6;
      v14 = v10;
      -[VTUISpeechSynthesizer speak:completion:](synth, "speak:completion:", v14, v20);
      goto LABEL_14;
    }
    trainingPageAudioHintInstructions = self->_trainingPageAudioHintInstructions;
    if (trainingPageAudioHintInstructions && -[NSArray count](trainingPageAudioHintInstructions, "count") - 1 > a3)
    {
      if (-[NSArray count](self->_trainingPageAudioHintInstructions, "count") <= a3)
      {
        v9 = 0;
      }
      else
      {
        -[NSArray objectAtIndexedSubscript:](self->_trainingPageAudioHintInstructions, "objectAtIndexedSubscript:", a3);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = self->_synth;
      language = self->_language;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __49__VTUIAudioHintPlayer_speakAudioHint_completion___block_invoke_50;
      v17[3] = &unk_24F33E158;
      v12 = &v18;
      v18 = v9;
      v13 = &v19;
      v19 = v6;
      v14 = v9;
      -[VTUISpeechSynthesizer speak:language:completion:](v15, "speak:language:completion:", v14, language, v17);
LABEL_14:

    }
  }

}

void __49__VTUIAudioHintPlayer_speakAudioHint_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE09000];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v10 = 136315394;
      v11 = "-[VTUIAudioHintPlayer speakAudioHint:completion:]_block_invoke";
      v12 = 2112;
      v13 = v3;
      v8 = "%s Error speaking audio hint %@";
LABEL_6:
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    v9 = *(void **)(a1 + 32);
    v10 = 136315394;
    v11 = "-[VTUIAudioHintPlayer speakAudioHint:completion:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    v8 = "%s Finished speaking audio hint request %@";
    goto LABEL_6;
  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v6, v7);

}

void __49__VTUIAudioHintPlayer_speakAudioHint_completion___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE09000];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE09000], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v10 = 136315394;
      v11 = "-[VTUIAudioHintPlayer speakAudioHint:completion:]_block_invoke";
      v12 = 2112;
      v13 = v3;
      v8 = "%s Error speaking audio hint %@";
LABEL_6:
      _os_log_impl(&dword_229EF7000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v5)
  {
    v9 = *(void **)(a1 + 32);
    v10 = 136315394;
    v11 = "-[VTUIAudioHintPlayer speakAudioHint:completion:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    v8 = "%s Finished speaking audio hint with string %@";
    goto LABEL_6;
  }
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v6, v7);

}

- (NSString)language
{
  return self->_language;
}

- (AFVoiceInfo)outputVoice
{
  return self->_outputVoice;
}

- (BOOL)shouldSpeakAudioHint
{
  return self->_shouldSpeakAudioHint;
}

- (void)setShouldSpeakAudioHint:(BOOL)a3
{
  self->_shouldSpeakAudioHint = a3;
}

- (NSArray)trainingPageAudioHintInstructions
{
  return self->_trainingPageAudioHintInstructions;
}

- (void)setTrainingPageAudioHintInstructions:(id)a3
{
  objc_storeStrong((id *)&self->_trainingPageAudioHintInstructions, a3);
}

- (NSArray)trainingPageAudioHintFiles
{
  return self->_trainingPageAudioHintFiles;
}

- (void)setTrainingPageAudioHintFiles:(id)a3
{
  objc_storeStrong((id *)&self->_trainingPageAudioHintFiles, a3);
}

- (NSArray)trainingPageAudioHintPreviews
{
  return self->_trainingPageAudioHintPreviews;
}

- (void)setTrainingPageAudioHintPreviews:(id)a3
{
  objc_storeStrong((id *)&self->_trainingPageAudioHintPreviews, a3);
}

- (VTUISpeechSynthesizer)synth
{
  return self->_synth;
}

- (void)setSynth:(id)a3
{
  objc_storeStrong((id *)&self->_synth, a3);
}

- (BOOL)useCompactHints
{
  return self->_useCompactHints;
}

- (void)setUseCompactHints:(BOOL)a3
{
  self->_useCompactHints = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synth, 0);
  objc_storeStrong((id *)&self->_trainingPageAudioHintPreviews, 0);
  objc_storeStrong((id *)&self->_trainingPageAudioHintFiles, 0);
  objc_storeStrong((id *)&self->_trainingPageAudioHintInstructions, 0);
  objc_storeStrong((id *)&self->_outputVoice, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
