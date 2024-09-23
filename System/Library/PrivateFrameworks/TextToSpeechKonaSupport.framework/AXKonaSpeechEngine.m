@implementation AXKonaSpeechEngine

- (AXKonaSpeechEngine)initWithVoice:(id)a3
{
  id v5;
  AXKonaSpeechEngine *v6;
  uint64_t v7;
  id v8;
  NSRegularExpression *commandRegex;
  AXKonaSpeechEngine *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *synthesizerSyncQueue;
  uint64_t v14;
  AVAudioFormat *engineFormat;
  uint64_t v16;
  AVAudioFormat *outputFormat;
  uint64_t v18;
  AVAudioConverter *bufferConverter;
  uint64_t v20;
  NSMutableArray *queuedBuffers;
  NSCondition *v22;
  NSCondition *producedBuffers;
  NSCondition *v24;
  NSCondition *consumedBuffers;
  TTSRulesetRunner *v26;
  TTSRulesetRunner *ruleSetRunner;
  uint64_t v28;
  NSMutableArray *currentMarkers;
  id v31;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AXKonaSpeechEngine;
  v6 = -[AXKonaSpeechEngine init](&v32, sel_init);
  if (v6)
  {
    v31 = 0;
    v8 = v31;
    commandRegex = v6->_commandRegex;
    v6->_commandRegex = (NSRegularExpression *)v7;

    if (v8)
    {
      v10 = 0;
    }
    else
    {
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_queue_create("konaSpeechSyncQueue", v11);
      synthesizerSyncQueue = v6->_synthesizerSyncQueue;
      v6->_synthesizerSyncQueue = (OS_dispatch_queue *)v12;

      objc_storeStrong((id *)&v6->_currentVoice, a3);
      *(_WORD *)&v6->_highQualityMode = 257;
      v6->_phrasePrediction = 0;
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, 16000.0);
      engineFormat = v6->_engineFormat;
      v6->_engineFormat = (AVAudioFormat *)v14;

      v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithCommonFormat:sampleRate:channels:interleaved:", 1, 1, 0, 16000.0);
      outputFormat = v6->_outputFormat;
      v6->_outputFormat = (AVAudioFormat *)v16;

      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89A80]), "initFromFormat:toFormat:", v6->_engineFormat, v6->_outputFormat);
      bufferConverter = v6->_bufferConverter;
      v6->_bufferConverter = (AVAudioConverter *)v18;

      -[AVAudioConverter setPrimeMethod:](v6->_bufferConverter, "setPrimeMethod:", 2);
      v6->_synthState = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = objc_claimAutoreleasedReturnValue();
      queuedBuffers = v6->_queuedBuffers;
      v6->_queuedBuffers = (NSMutableArray *)v20;

      v6->_bufferLock._os_unfair_lock_opaque = 0;
      v22 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
      producedBuffers = v6->_producedBuffers;
      v6->_producedBuffers = v22;

      v24 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
      consumedBuffers = v6->_consumedBuffers;
      v6->_consumedBuffers = v24;

      v26 = (TTSRulesetRunner *)objc_alloc_init(MEMORY[0x1E0DBEF40]);
      ruleSetRunner = v6->_ruleSetRunner;
      v6->_ruleSetRunner = v26;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = objc_claimAutoreleasedReturnValue();
      currentMarkers = v6->_currentMarkers;
      v6->_currentMarkers = (NSMutableArray *)v28;

      -[AXKonaSpeechEngine _initializeConfigurationMap](v6, "_initializeConfigurationMap");
      if (-[AXKonaSpeechEngine _initializeWrappedEngineForVoice:](v6, "_initializeWrappedEngineForVoice:", v5))
      {
        v6 = v6;
      }
      else
      {

        v6 = 0;
      }

      v10 = v6;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setPhrasePrediction:(BOOL)a3
{
  if (self->_phrasePrediction != a3)
  {
    self->_phrasePrediction = a3;
    -[AXKonaSpeechEngine _resetEnginePreservingParams](self, "_resetEnginePreservingParams");
  }
}

- (void)setPreferCommunityDictionary:(BOOL)a3
{
  if (self->_preferCommunityDictionary != a3)
  {
    self->_preferCommunityDictionary = a3;
    -[AXKonaSpeechEngine _resetEnginePreservingParams](self, "_resetEnginePreservingParams");
  }
}

- (void)setAbbreviationDictionary:(BOOL)a3
{
  if (self->_abbreviationDictionary != a3)
  {
    self->_abbreviationDictionary = a3;
    -[AXKonaSpeechEngine _resetEnginePreservingParams](self, "_resetEnginePreservingParams");
  }
}

- (void)setHighQualityMode:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  double v6;
  AVAudioFormat *v7;
  AVAudioFormat *engineFormat;
  AVAudioConverter *v9;
  AVAudioConverter *bufferConverter;

  if (self->_highQualityMode != a3)
  {
    v3 = a3;
    v5 = objc_alloc(MEMORY[0x1E0C89AA8]);
    v6 = 11025.0;
    if (v3)
      v6 = 16000.0;
    v7 = (AVAudioFormat *)objc_msgSend(v5, "initWithCommonFormat:sampleRate:channels:interleaved:", 3, 1, 0, v6);
    engineFormat = self->_engineFormat;
    self->_engineFormat = v7;

    self->_highQualityMode = v3;
    v9 = (AVAudioConverter *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89A80]), "initFromFormat:toFormat:", self->_engineFormat, self->_outputFormat);
    bufferConverter = self->_bufferConverter;
    self->_bufferConverter = v9;

    -[AVAudioConverter setPrimeMethod:](self->_bufferConverter, "setPrimeMethod:", 2);
    -[AXKonaSpeechEngine _resetEnginePreservingParams](self, "_resetEnginePreservingParams");
  }
}

- (void)_resetEnginePreservingParams
{
  void *v3;
  id v4;

  -[AXKonaSpeechEngine cancelSynthesis](self, "cancelSynthesis");
  if (-[AXKonaSpeechEngine currentDictionary](self, "currentDictionary"))
  {
    -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
    -[AXKonaSpeechEngine currentDictionary](self, "currentDictionary");
    eciDeleteDict2();
    -[AXKonaSpeechEngine setCurrentDictionary:](self, "setCurrentDictionary:", 0);
  }
  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  eciDelete2();
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AXKonaSpeechEngine currentVoice](self, "currentVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXKonaSpeechEngine _initializeWrappedEngineForVoice:](self, "_initializeWrappedEngineForVoice:", v3);

  -[AXKonaSpeechEngine setParameters:](self, "setParameters:", v4);
}

- (void)dealloc
{
  AXKonaSpeechEngine *v3;
  void *v4;
  objc_super v5;

  if (-[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance"))
  {
    v3 = self;
    objc_sync_enter(v3);
    -[AXKonaSpeechEngine ruleSetRunner](v3, "ruleSetRunner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelProcessing");

    -[AXKonaSpeechEngine _cancelSynthesis](v3, "_cancelSynthesis");
    objc_sync_exit(v3);

    if (-[AXKonaSpeechEngine currentDictionary](v3, "currentDictionary"))
    {
      -[AXKonaSpeechEngine wrappedInstance](v3, "wrappedInstance");
      -[AXKonaSpeechEngine currentDictionary](v3, "currentDictionary");
      eciDeleteDict2();
    }
    -[AXKonaSpeechEngine wrappedInstance](v3, "wrappedInstance");
    eciDelete2();
  }
  v5.receiver = self;
  v5.super_class = (Class)AXKonaSpeechEngine;
  -[AXKonaSpeechEngine dealloc](&v5, sel_dealloc);
}

- (void)_initializeConfigurationMap
{
  AXKonaConfiguration *v3;
  AXKonaConfiguration *v4;
  AXKonaConfiguration *v5;
  AXKonaConfiguration *v6;
  AXKonaConfiguration *v7;
  AXKonaConfiguration *v8;
  AXKonaConfiguration *v9;
  AXKonaConfiguration *v10;
  AXKonaConfiguration *v11;
  NSDictionary *v12;
  NSDictionary *configurationMap;
  AXKonaConfiguration *v14;
  AXKonaConfiguration *v15;
  AXKonaConfiguration *v16;
  AXKonaConfiguration *v17;
  AXKonaConfiguration *v18;
  _QWORD v19[14];
  _QWORD v20[16];

  v20[14] = *MEMORY[0x1E0C80C00];
  v19[0] = &unk_1E8C64210;
  v18 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("enu"), CFSTR("1.0"), 0x10000);
  v20[0] = v18;
  v19[1] = &unk_1E8C64228;
  v17 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("eng"), CFSTR("1.1"), 65537);
  v20[1] = v17;
  v19[2] = &unk_1E8C64240;
  v16 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("esp"), CFSTR("2.0"), 0x20000);
  v20[2] = v16;
  v19[3] = &unk_1E8C64258;
  v15 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("esm"), CFSTR("2.1"), 131073);
  v20[3] = v15;
  v19[4] = &unk_1E8C64270;
  v14 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("fra"), CFSTR("3.0"), 196608);
  v20[4] = v14;
  v19[5] = &unk_1E8C64288;
  v3 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("frc"), CFSTR("3.1"), 196609);
  v20[5] = v3;
  v19[6] = &unk_1E8C642A0;
  v4 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("deu"), CFSTR("4.0"), 0x40000);
  v20[6] = v4;
  v19[7] = &unk_1E8C642B8;
  v5 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("ita"), CFSTR("5.0"), 327680);
  v20[7] = v5;
  v19[8] = &unk_1E8C642D0;
  v6 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("ptb"), CFSTR("7.0"), 458752);
  v20[8] = v6;
  v19[9] = &unk_1E8C642E8;
  v7 = -[AXKonaConfiguration initWithDylib:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:dialectCode:dialect:", CFSTR("fin"), CFSTR("9.0"), 589824);
  v20[9] = v7;
  v19[10] = &unk_1E8C64300;
  v8 = -[AXKonaConfiguration initWithDylib:romanizerDylib:encoding:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:romanizerDylib:encoding:dialectCode:dialect:", CFSTR("jpn"), CFSTR("jpnrom"), 8, CFSTR("8.0"), 0x80000);
  v20[10] = v8;
  v19[11] = &unk_1E8C64318;
  v9 = -[AXKonaConfiguration initWithDylib:romanizerDylib:encoding:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:romanizerDylib:encoding:dialectCode:dialect:", CFSTR("kor"), CFSTR("korrom"), CFStringConvertEncodingToNSStringEncoding(0x422u), CFSTR("10.0"), 655360);
  v20[11] = v9;
  v19[12] = &unk_1E8C64330;
  v10 = -[AXKonaConfiguration initWithDylib:romanizerDylib:encoding:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:romanizerDylib:encoding:dialectCode:dialect:", CFSTR("chs"), CFSTR("chsrom"), CFStringConvertEncodingToNSStringEncoding(0x421u), CFSTR("6.0"), 393216);
  v20[12] = v10;
  v19[13] = &unk_1E8C64348;
  v11 = -[AXKonaConfiguration initWithDylib:romanizerDylib:encoding:dialectCode:dialect:]([AXKonaConfiguration alloc], "initWithDylib:romanizerDylib:encoding:dialectCode:dialect:", CFSTR("cht"), CFSTR("chtrom"), CFStringConvertEncodingToNSStringEncoding(0xA03u), CFSTR("6.1"), 393217);
  v20[13] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 14);
  v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  configurationMap = self->_configurationMap;
  self->_configurationMap = v12;

}

- (BOOL)_initializeWrappedEngineForVoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v18;
  int v19;
  const char *v20;
  int v21;

  v4 = a3;
  -[AXKonaSpeechEngine configurationMap](self, "configurationMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "konaLanguage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "iniString");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v8, "cStringUsingEncoding:", 4);
  objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4);
  eciSetIniContent();
  objc_msgSend(v7, "eciDialect");
  v9 = eciNew2();
  if (v9)
    goto LABEL_11;
  -[AXKonaSpeechEngine setWrappedInstance:](self, "setWrappedInstance:", 0);
  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  if (eciRegisterCallback2())
  {
    v18 = "eciRegisterCallback2(self.wrappedInstance, globalEciCallback, (__bridge void *)self, 0, NULL) == ECISUCCESS_SUCCESS";
    v19 = 481;
    goto LABEL_14;
  }
  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  if (eciRegisterKlattHooks2())
  {
    v18 = "eciRegisterKlattHooks2(self.wrappedInstance, GlobalKlattConstHook, GlobalKlattDynamicHook, (__bridge void *)se"
          "lf) == ECISUCCESS_SUCCESS";
    v19 = 482;
LABEL_14:
    __assert_rtn("-[AXKonaSpeechEngine _initializeWrappedEngineForVoice:]", "AXKonaSpeechEngine.mm", v19, v18);
  }
  -[AXKonaSpeechEngine highQualityMode](self, "highQualityMode", 2);
  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  if (eciRegisterSampleBuffer2())
  {
    v20 = "eciRegisterSampleBuffer2(self.wrappedInstance, _pSampleBuffer, KONA_AUDIOBUFFER_SIZE, &eciSampleFmt) == ECISUCCESS_SUCCESS";
    v21 = 488;
    goto LABEL_18;
  }
  objc_msgSend(v4, "eciVoiceNumber");
  eciSetStandardVoice2();
  -[AXKonaSpeechEngine phrasePrediction](self, "phrasePrediction");
  if (eciSetParam2())
  {
    v20 = "eciSetParam2(handle, ECIPARAMTYPE_ENVIRONMENT, ECIENVPARAM_PHRASEPREDICTIONMODE, self.phrasePrediction ? ECIEN"
          "VPARAM_PHRASEPREDICTIONMODE_ENABLED : ECIENVPARAM_PHRASEPREDICTIONMODE_DISABLED) == ECISUCCESS_SUCCESS";
    v21 = 492;
    goto LABEL_18;
  }
  -[AXKonaSpeechEngine abbreviationDictionary](self, "abbreviationDictionary");
  if (eciSetParam2())
  {
    v20 = "eciSetParam2(handle, ECIPARAMTYPE_ENVIRONMENT, ECIENVPARAM_ABBRDICTMODE, self.abbreviationDictionary ? ECIENVP"
          "ARAM_ABBRDICTMODE_ENABLED : ECIENVPARAM_ABBRDICTMODE_DISABLED) == ECISUCCESS_SUCCESS";
    v21 = 494;
LABEL_18:
    __assert_rtn("-[AXKonaSpeechEngine _initializeWrappedEngineForVoice:]", "AXKonaSpeechEngine.mm", v21, v20);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCE180]), "initWithUnit:", 0);
  -[AXKonaSpeechEngine setTokenizer:](self, "setTokenizer:", v10);

  -[AXKonaSpeechEngine tokenizer](self, "tokenizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)kKonaLangToNLLang;
  objc_msgSend(v4, "languageCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = v14;
  else
    v16 = *MEMORY[0x1E0CCDEF8];
  objc_msgSend(v11, "setLanguage:", v16);

  -[AXKonaSpeechEngine _loadDictionaryForVoice:](self, "_loadDictionaryForVoice:", v4);
  -[AXKonaSpeechEngine setCurrentConfiguration:](self, "setCurrentConfiguration:", v7);
LABEL_11:

  return v9 == 0;
}

- (id)_konaCrashPatterns
{
  return &unk_1E8C64418;
}

- (id)_segmentsForText:(id)a3
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  AXKonaSpeechSegment *v37;
  id obj;
  uint64_t v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  AXKonaSpeechEngine *v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  AXTTSLogKona();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXKonaSpeechEngine _segmentsForText:].cold.3();

  -[AXKonaSpeechEngine commandRegex](self, "commandRegex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchesInString:options:range:", v36, 2, 0, objc_msgSend(v36, "length"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXKonaSpeechEngine tokenizer](self, "tokenizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setString:", v36);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy_;
  v61 = __Block_byref_object_dispose_;
  v62 = 0;
  objc_msgSend(MEMORY[0x1E0DBEF38], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regexForString:atStart:", CFSTR("(^|\\s+)['\"]\\s*$"), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXKonaSpeechEngine tokenizer](self, "tokenizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v36, "length");
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __39__AXKonaSpeechEngine__segmentsForText___block_invoke;
  v49[3] = &unk_1E8C61700;
  v30 = v32;
  v50 = v30;
  v31 = v34;
  v51 = v31;
  v35 = v36;
  v52 = v35;
  v53 = self;
  v55 = &v63;
  v56 = &v57;
  v9 = v33;
  v54 = v9;
  objc_msgSend(v7, "enumerateTokensInRange:usingBlock:", 0, v8, v49);

  v37 = objc_alloc_init(AXKonaSpeechSegment);
  v10 = v64[3];
  v11 = objc_msgSend(v35, "length");
  -[AXKonaSpeechSegment setRange:](v37, "setRange:", v10, v11 - v64[3]);
  v12 = -[AXKonaSpeechSegment range](v37, "range");
  objc_msgSend(v35, "substringWithRange:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXKonaSpeechSegment setText:](v37, "setText:", v14);

  -[AXKonaSpeechSegment setMarker:](v37, "setMarker:", v58[5]);
  -[AXKonaSpeechEngine currentConfiguration](self, "currentConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXKonaSpeechSegment setTargetEncoding:](v37, "setTargetEncoding:", objc_msgSend(v15, "encoding"));

  objc_msgSend(v9, "addObject:", v37);
  AXTTSLogKona();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[AXKonaSpeechEngine _segmentsForText:].cold.2();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = v9;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
  if (v17)
  {
    v39 = *(_QWORD *)v46;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v46 != v39)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v18);
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        -[AXKonaSpeechEngine _konaCrashPatterns](self, "_konaCrashPatterns");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v67, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v42;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v42 != v22)
                objc_enumerationMutation(v20);
              v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v23);
              objc_msgSend(v19, "text");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:options:range:", v24, &stru_1E8C61F80, 1025, 0, objc_msgSend(v25, "length"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setText:", v26);

              ++v23;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v41, v67, 16);
          }
          while (v21);
        }

        ++v18;
      }
      while (v18 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v68, 16);
    }
    while (v17);
  }

  AXTTSLogKona();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    -[AXKonaSpeechEngine _segmentsForText:].cold.1();

  v28 = obj;
  _Block_object_dispose(&v57, 8);

  _Block_object_dispose(&v63, 8);
  return v28;
}

void __39__AXKonaSpeechEngine__segmentsForText___block_invoke(uint64_t a1, unint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  unint64_t v11;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AXKonaSpeechSegment *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  AXKonaMarker *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v6);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "range", (_QWORD)v30);
        if (a2 >= v10 && a2 - v10 < v11)
        {

          return;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v7);
  }

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "matchesInString:options:range:", *(_QWORD *)(a1 + 48), 2, 0, a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = a2;
    if (v14)
    {
      objc_msgSend(v14, "range");
      v15 = objc_msgSend(v14, "range");
    }

  }
  else
  {
    v15 = 0;
  }
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v17 = v15 - v16;
  if (v15 != v16)
  {
    v18 = objc_alloc_init(AXKonaSpeechSegment);
    objc_msgSend(*(id *)(a1 + 56), "currentConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXKonaSpeechSegment setTargetEncoding:](v18, "setTargetEncoding:", objc_msgSend(v19, "encoding"));

    -[AXKonaSpeechSegment setRange:](v18, "setRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v17);
    v20 = *(void **)(a1 + 48);
    v21 = -[AXKonaSpeechSegment range](v18, "range");
    objc_msgSend(v20, "substringWithRange:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXKonaSpeechSegment setText:](v18, "setText:", v23);

    -[AXKonaSpeechSegment setMarker:](v18, "setMarker:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 64), "addObject:", v18);
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = 0;

  }
  v26 = objc_alloc_init(AXKonaMarker);
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

  objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", a2, a3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setText:", v29);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setOriginalStringRange:", a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v15;
}

- (id)_preprocessTextForIrregularities:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)-[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex;
  if (!-[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\b((?<!:)[0-9]{1,2}:[0-9]{2}(?!:))\\s?(am|pm|AM|PM|[:cntrl:])?"), 0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)-[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex;
    -[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex = v5;

    v4 = (void *)-[AXKonaSpeechEngine _preprocessTextForIrregularities:]::TimeDurationRegex;
  }
  objc_msgSend(v4, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = (id)objc_msgSend(v3, "mutableCopy");
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v7, "reverseObjectEnumerator", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "range");
          objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR(":"), CFSTR(" "), 0, v13, v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (void)synthesizeText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AXKonaSpeechEngine *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD block[5];

  v4 = a3;
  -[AXKonaSpeechEngine cancelSynthesis](self, "cancelSynthesis");
  -[AXKonaSpeechEngine _preprocessTextForIrregularities:](self, "_preprocessTextForIrregularities:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXKonaSpeechEngine ruleSetRunner](self, "ruleSetRunner");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processText:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXKonaSpeechEngine setCurrentSpeechString:](self, "setCurrentSpeechString:", v7);

  -[AXKonaSpeechEngine currentSpeechString](self, "currentSpeechString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transformedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self;
  objc_sync_enter(v10);
  -[AXKonaSpeechEngine bufferConverter](v10, "bufferConverter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reset");

  LODWORD(v12) = 0;
  -[AXKonaSpeechEngine setLastSampVal:](v10, "setLastSampVal:", v12);
  -[AXKonaSpeechEngine setCurrentFrameCount:](v10, "setCurrentFrameCount:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXKonaSpeechEngine setCurrentMarkers:](v10, "setCurrentMarkers:", v13);

  -[AXKonaSpeechEngine _segmentsForText:](v10, "_segmentsForText:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXKonaSpeechEngine setCurrentSpeechSegments:](v10, "setCurrentSpeechSegments:", v14);

  -[AXKonaSpeechEngine synthesizerSyncQueue](v10, "synthesizerSyncQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__AXKonaSpeechEngine_synthesizeText___block_invoke;
  block[3] = &unk_1E8C61728;
  block[4] = v10;
  dispatch_async(v15, block);

  objc_sync_exit(v10);
  -[AXKonaSpeechEngine producedBuffers](v10, "producedBuffers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "wait");

}

void __37__AXKonaSpeechEngine_synthesizeText___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "setSynthState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "wrappedInstance");
  objc_msgSend(*(id *)(a1 + 32), "currentVoice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eciVoiceNumber");
  eciSetStandardVoice2();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "currentParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setParameters:", v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "currentSpeechSegments", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "wrappedInstance");
        eciInsertIndex2();
        objc_msgSend(*(id *)(a1 + 32), "wrappedInstance");
        objc_msgSend(v11, "encodedString");
        objc_msgSend(v11, "encodedStringLength");
        eciAddText2();
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 += i;
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "wrappedInstance");
  eciSynthesize2();
  objc_sync_exit(v2);

  objc_msgSend(*(id *)(a1 + 32), "wrappedInstance");
  eciSynchronize2();
  v12 = *(id *)(a1 + 32);
  objc_sync_enter(v12);
  if (objc_msgSend(*(id *)(a1 + 32), "synthState") == 1)
    objc_msgSend(*(id *)(a1 + 32), "setSynthState:", 3);
  objc_msgSend(*(id *)(a1 + 32), "producedBuffers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "broadcast");

  objc_msgSend(*(id *)(a1 + 32), "consumedBuffers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "broadcast");

  objc_sync_exit(v12);
}

- (id)nextBuffer
{
  void *v3;
  id v4;
  void *v5;
  AXKonaSpeechEngine *v6;
  uint64_t v7;
  void *v8;
  AXKonaSpeechEngine *v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  v12 = MEMORY[0x1E0C809B0];
  AX_PERFORM_WITH_LOCK();
  v3 = (void *)v15[5];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    v7 = -[AXKonaSpeechEngine synthState](v6, "synthState", v12, 3221225472, __32__AXKonaSpeechEngine_nextBuffer__block_invoke, &unk_1E8C61750, self, &v14);
    objc_sync_exit(v6);

    if (v7 != 1)
      goto LABEL_6;
    -[AXKonaSpeechEngine producedBuffers](v6, "producedBuffers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wait");

    v9 = v6;
    objc_sync_enter(v9);
    v10 = -[AXKonaSpeechEngine synthState](v9, "synthState");
    objc_sync_exit(v9);

    if (v10 == 2)
    {
LABEL_6:
      v5 = 0;
      goto LABEL_7;
    }
    -[AXKonaSpeechEngine nextBuffer](v9, "nextBuffer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __32__AXKonaSpeechEngine_nextBuffer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "queuedBuffers");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v6, "count");

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "queuedBuffers");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(a1 + 32), "queuedBuffers");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectAtIndex:", 0);

    objc_msgSend(*(id *)(a1 + 32), "consumedBuffers");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "signal");

  }
}

- (void)_enqueueBuffer:(id)a3
{
  id v4;
  void *v5;
  AXKonaSpeechEngine *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v4 = a3;
  AX_PERFORM_WITH_LOCK();
  if (!*((_BYTE *)v9 + 24))
  {
    -[AXKonaSpeechEngine consumedBuffers](self, "consumedBuffers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wait");

    v6 = self;
    objc_sync_enter(v6);
    v7 = -[AXKonaSpeechEngine synthState](v6, "synthState");
    objc_sync_exit(v6);

    if (v7 != 2)
      -[AXKonaSpeechEngine _enqueueBuffer:](v6, "_enqueueBuffer:", v4);
  }

  _Block_object_dispose(&v8, 8);
}

void __37__AXKonaSpeechEngine__enqueueBuffer___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "queuedBuffers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 <= 0x18)
  {
    objc_msgSend(*(id *)(a1 + 32), "queuedBuffers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "producedBuffers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signal");

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (void)cancelSynthesis
{
  AXKonaSpeechEngine *v2;
  void *v3;
  NSObject *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[AXKonaSpeechEngine ruleSetRunner](v2, "ruleSetRunner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelProcessing");

  -[AXKonaSpeechEngine _cancelSynthesis](v2, "_cancelSynthesis");
  objc_sync_exit(v2);

  -[AXKonaSpeechEngine synthesizerSyncQueue](v2, "synthesizerSyncQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v4, &__block_literal_global);

}

- (void)_cancelSynthesis
{
  void *v3;
  void *v4;

  AX_PERFORM_WITH_LOCK();
  -[AXKonaSpeechEngine setSynthState:](self, "setSynthState:", 2);
  -[AXKonaSpeechEngine producedBuffers](self, "producedBuffers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadcast");

  -[AXKonaSpeechEngine consumedBuffers](self, "consumedBuffers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "broadcast");

  -[AXKonaSpeechEngine setCurrentSpeechString:](self, "setCurrentSpeechString:", 0);
}

void __38__AXKonaSpeechEngine__cancelSynthesis__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setQueuedBuffers:");

}

- (void)setParameters:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_storeStrong((id *)&self->_currentParameters, a3);
  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headSize");
  eciSetParam2();

  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vocalTract");
  eciSetParam2();

  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pitchBase");
  eciSetParam2();

  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pitchFluctuation");
  eciSetParam2();

  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "roughness");
  eciSetParam2();

  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "breathiness");
  eciSetParam2();

  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "speed");
  eciSetParam2();

  -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
  -[AXKonaSpeechEngine currentParameters](self, "currentParameters");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "volume");
  eciSetParam2();

}

- (AXKonaParameters)parameters
{
  AXKonaParameters *currentParameters;
  AXKonaParameters *v3;
  void *v4;

  currentParameters = self->_currentParameters;
  if (currentParameters)
  {
    v3 = currentParameters;
  }
  else
  {
    -[AXKonaSpeechEngine currentVoice](self, "currentVoice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "parameters");
    v3 = (AXKonaParameters *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setVoice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a3;
  -[AXKonaSpeechEngine currentVoice](self, "currentVoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    -[AXKonaSpeechEngine cancelSynthesis](self, "cancelSynthesis");
    if (-[AXKonaSpeechEngine currentDictionary](self, "currentDictionary"))
    {
      -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
      -[AXKonaSpeechEngine currentDictionary](self, "currentDictionary");
      eciDeleteDict2();
      -[AXKonaSpeechEngine setCurrentDictionary:](self, "setCurrentDictionary:", 0);
    }
    -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
    eciDelete2();
    -[AXKonaSpeechEngine _initializeWrappedEngineForVoice:](self, "_initializeWrappedEngineForVoice:", v8);
    -[AXKonaSpeechEngine setCurrentVoice:](self, "setCurrentVoice:", v8);
    -[AXKonaSpeechEngine setCurrentParameters:](self, "setCurrentParameters:", 0);
  }

}

- (void)_loadDictionaryForVoice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:inDirectory:", v6, 0, CFSTR("Dictionaries"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("community"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("system"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v8);

    if (!v11
      || (v12 = -[AXKonaSpeechEngine preferCommunityDictionary](self, "preferCommunityDictionary"), v13 = v8, !v12))
    {
      v13 = v9;
    }
    v14 = v13;

    objc_msgSend(v4, "languageCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E8C64430, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "intValue");

    -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
    if (eciNewDict2())
    {
      AXTTSLogKona();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "languageCode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXKonaSpeechEngine _loadDictionaryForVoice:].cold.3(v18, (uint64_t)v26, v17);
      }
    }
    else
    {
      -[NSObject stringByAppendingPathComponent:](v14, "stringByAppendingPathComponent:", CFSTR("root.kdict"));
      v17 = objc_claimAutoreleasedReturnValue();
      -[AXKonaSpeechEngine _loadDictionaryAtPath:type:handle:](self, "_loadDictionaryAtPath:type:handle:", v17, 1, 0);
      -[NSObject stringByAppendingPathComponent:](v14, "stringByAppendingPathComponent:", CFSTR("abbrv.kdict"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXKonaSpeechEngine _loadDictionaryAtPath:type:handle:](self, "_loadDictionaryAtPath:type:handle:", v21, 2, 0);
      -[NSObject stringByAppendingPathComponent:](v14, "stringByAppendingPathComponent:", CFSTR("main.kdict"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXKonaSpeechEngine _loadDictionaryAtPath:type:handle:](self, "_loadDictionaryAtPath:type:handle:", v22, 0, 0);
      -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
      if (eciActivateDict2())
      {
        AXTTSLogKona();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          -[AXKonaSpeechEngine currentVoice](self, "currentVoice");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "languageCode");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXKonaSpeechEngine _loadDictionaryForVoice:].cold.2(v25, (uint64_t)v26, v23, v24);
        }

      }
      -[AXKonaSpeechEngine setCurrentDictionary:](self, "setCurrentDictionary:", 0);

    }
  }
  else
  {
    AXTTSLogKona();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AXKonaSpeechEngine _loadDictionaryForVoice:].cold.1(v14, v19, v20);
  }

}

- (BOOL)_loadDictionaryAtPath:(id)a3 type:(int64_t)a4 handle:(void *)a5
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  BOOL v10;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(objc_retainAutorelease(v6), "cStringUsingEncoding:", 5);
    -[AXKonaSpeechEngine wrappedInstance](self, "wrappedInstance");
    if (!eciLoadDictVolume2())
    {
      v10 = 1;
      goto LABEL_7;
    }
    AXTTSLogKona();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[AXKonaSpeechEngine _loadDictionaryAtPath:type:handle:].cold.1();

  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)setOverrideVoicingGain:(id)a3
{
  float v5;
  float v6;
  float v7;
  id v8;

  v8 = a3;
  -[NSNumber floatValue](self->_overrideVoicingGain, "floatValue");
  v6 = v5;
  objc_msgSend(v8, "floatValue");
  if (v6 != v7)
  {
    objc_storeStrong((id *)&self->_overrideVoicingGain, a3);
    -[AXKonaSpeechEngine _resetEnginePreservingParams](self, "_resetEnginePreservingParams");
  }

}

- (void)setOverrideFricationGain:(id)a3
{
  float v5;
  float v6;
  float v7;
  id v8;

  v8 = a3;
  -[NSNumber floatValue](self->_overrideFricationGain, "floatValue");
  v6 = v5;
  objc_msgSend(v8, "floatValue");
  if (v6 != v7)
  {
    objc_storeStrong((id *)&self->_overrideFricationGain, a3);
    -[AXKonaSpeechEngine _resetEnginePreservingParams](self, "_resetEnginePreservingParams");
  }

}

- (void)setOverrideAspirationGain:(id)a3
{
  float v5;
  float v6;
  float v7;
  id v8;

  v8 = a3;
  -[NSNumber floatValue](self->_overrideAspirationGain, "floatValue");
  v6 = v5;
  objc_msgSend(v8, "floatValue");
  if (v6 != v7)
  {
    objc_storeStrong((id *)&self->_overrideAspirationGain, a3);
    -[AXKonaSpeechEngine _resetEnginePreservingParams](self, "_resetEnginePreservingParams");
  }

}

- (void)setOverrideOverallGain:(id)a3
{
  float v5;
  float v6;
  float v7;
  id v8;

  v8 = a3;
  -[NSNumber floatValue](self->_overrideOverallGain, "floatValue");
  v6 = v5;
  objc_msgSend(v8, "floatValue");
  if (v6 != v7)
  {
    objc_storeStrong((id *)&self->_overrideOverallGain, a3);
    -[AXKonaSpeechEngine _resetEnginePreservingParams](self, "_resetEnginePreservingParams");
  }

}

- (void)klattDynamicHook:(KlattFrame *)a3
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  void *v66;
  double v67;
  void *v68;
  double v69;
  uint64_t v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  void *v75;
  float var22;
  void *v77;
  float v78;
  float var24;
  void *v80;
  float v81;
  float var26;
  void *v83;
  float v84;
  void *v85;
  BOOL v86;
  float var21;
  void *v88;
  float v89;
  float var23;
  void *v91;
  float v92;
  float var25;
  void *v94;
  float v95;
  void *v96;
  BOOL v97;
  void (**v98)(_QWORD, _QWORD);
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
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
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  _QWORD v154[62];
  _QWORD v155[64];

  v155[62] = *MEMORY[0x1E0C80C00];
  v154[0] = CFSTR("ui");
  *(float *)&v3 = a3->var0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v3);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = v152;
  v154[1] = CFSTR("f0");
  *(float *)&v5 = a3->var1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v155[1] = v150;
  v154[2] = CFSTR("av");
  *(float *)&v6 = a3->var2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v155[2] = v149;
  v154[3] = CFSTR("oq");
  *(float *)&v7 = a3->var3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  v155[3] = v148;
  v154[4] = CFSTR("tl");
  *(float *)&v8 = a3->var4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v155[4] = v147;
  v154[5] = CFSTR("fl");
  *(float *)&v9 = a3->var5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v155[5] = v146;
  v154[6] = CFSTR("di");
  *(float *)&v10 = a3->var6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v155[6] = v145;
  v154[7] = CFSTR("ah");
  *(float *)&v11 = a3->var7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v155[7] = v144;
  v154[8] = CFSTR("af");
  *(float *)&v12 = a3->var8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v155[8] = v143;
  v154[9] = CFSTR("f1");
  *(float *)&v13 = a3->var9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v155[9] = v142;
  v154[10] = CFSTR("b1");
  *(float *)&v14 = a3->var10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v155[10] = v141;
  v154[11] = CFSTR("df1");
  *(float *)&v15 = a3->var11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  v155[11] = v140;
  v154[12] = CFSTR("db1");
  *(float *)&v16 = a3->var12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v155[12] = v139;
  v154[13] = CFSTR("f2");
  *(float *)&v17 = a3->var13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v17);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v155[13] = v138;
  v154[14] = CFSTR("b2");
  *(float *)&v18 = a3->var14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v155[14] = v137;
  v154[15] = CFSTR("f3");
  *(float *)&v19 = a3->var15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v155[15] = v136;
  v154[16] = CFSTR("b3");
  *(float *)&v20 = a3->var16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v155[16] = v135;
  v154[17] = CFSTR("f4");
  *(float *)&v21 = a3->var17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v21);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v155[17] = v134;
  v154[18] = CFSTR("b4");
  *(float *)&v22 = a3->var18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v22);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v155[18] = v133;
  v154[19] = CFSTR("f5");
  *(float *)&v23 = a3->var19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v155[19] = v132;
  v154[20] = CFSTR("b5");
  *(float *)&v24 = a3->var20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v155[20] = v131;
  v154[21] = CFSTR("f6");
  *(float *)&v25 = a3->var21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v155[21] = v130;
  v154[22] = CFSTR("b6");
  *(float *)&v26 = a3->var22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v26);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v155[22] = v129;
  v154[23] = CFSTR("f7");
  *(float *)&v27 = a3->var23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v155[23] = v128;
  v154[24] = CFSTR("b7");
  *(float *)&v28 = a3->var24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v28);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v155[24] = v127;
  v154[25] = CFSTR("f8");
  *(float *)&v29 = a3->var25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v29);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v155[25] = v126;
  v154[26] = CFSTR("b8");
  *(float *)&v30 = a3->var26;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v155[26] = v125;
  v154[27] = CFSTR("fnp");
  *(float *)&v31 = a3->var27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v155[27] = v124;
  v154[28] = CFSTR("bnp");
  *(float *)&v32 = a3->var28;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v32);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v155[28] = v123;
  v154[29] = CFSTR("fnz");
  *(float *)&v33 = a3->var29;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v155[29] = v122;
  v154[30] = CFSTR("bnz");
  *(float *)&v34 = a3->var30;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v34);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v155[30] = v121;
  v154[31] = CFSTR("ftp");
  *(float *)&v35 = a3->var31;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v155[31] = v120;
  v154[32] = CFSTR("btp");
  *(float *)&v36 = a3->var32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v36);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v155[32] = v119;
  v154[33] = CFSTR("ftz");
  *(float *)&v37 = a3->var33;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v155[33] = v118;
  v154[34] = CFSTR("btz");
  *(float *)&v38 = a3->var34;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v38);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v155[34] = v117;
  v154[35] = CFSTR("a1f");
  *(float *)&v39 = a3->var35;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v39);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v155[35] = v116;
  v154[36] = CFSTR("a2f");
  *(float *)&v40 = a3->var36;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v40);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v155[36] = v115;
  v154[37] = CFSTR("a3f");
  *(float *)&v41 = a3->var37;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v41);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v155[37] = v114;
  v154[38] = CFSTR("a4f");
  *(float *)&v42 = a3->var38;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v42);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v155[38] = v113;
  v154[39] = CFSTR("a5f");
  *(float *)&v43 = a3->var39;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v43);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v155[39] = v112;
  v154[40] = CFSTR("a6f");
  *(float *)&v44 = a3->var40;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v155[40] = v111;
  v154[41] = CFSTR("a7f");
  *(float *)&v45 = a3->var41;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v45);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v155[41] = v110;
  v154[42] = CFSTR("a8f");
  *(float *)&v46 = a3->var42;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v155[42] = v109;
  v154[43] = CFSTR("ab");
  *(float *)&v47 = a3->var43;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v47);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v155[43] = v108;
  v154[44] = CFSTR("b1f");
  *(float *)&v48 = a3->var44;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v48);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v155[44] = v107;
  v154[45] = CFSTR("b2f");
  *(float *)&v49 = a3->var45;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v49);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v155[45] = v106;
  v154[46] = CFSTR("b3f");
  *(float *)&v50 = a3->var46;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v50);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v155[46] = v105;
  v154[47] = CFSTR("b4f");
  *(float *)&v51 = a3->var47;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v155[47] = v104;
  v154[48] = CFSTR("b5f");
  *(float *)&v52 = a3->var48;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v52);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v155[48] = v103;
  v154[49] = CFSTR("b6f");
  *(float *)&v53 = a3->var49;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v155[49] = v102;
  v154[50] = CFSTR("b7f");
  *(float *)&v54 = a3->var50;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v54);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v155[50] = v101;
  v154[51] = CFSTR("b8f");
  *(float *)&v55 = a3->var51;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v155[51] = v100;
  v154[52] = CFSTR("anv");
  *(float *)&v56 = a3->var52;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v155[52] = v99;
  v154[53] = CFSTR("a1v");
  *(float *)&v57 = a3->var53;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v155[53] = v58;
  v154[54] = CFSTR("a2v");
  *(float *)&v59 = a3->var54;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v155[54] = v60;
  v154[55] = CFSTR("a3v");
  *(float *)&v61 = a3->var55;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v155[55] = v62;
  v154[56] = CFSTR("a4v");
  *(float *)&v63 = a3->var56;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v155[56] = v64;
  v154[57] = CFSTR("a5v");
  *(float *)&v65 = a3->var57;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v155[57] = v66;
  v154[58] = CFSTR("a6v");
  *(float *)&v67 = a3->var58;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v155[58] = v68;
  v154[59] = CFSTR("a7v");
  *(float *)&v69 = a3->var59;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69);
  v70 = objc_claimAutoreleasedReturnValue();
  v155[59] = v70;
  v154[60] = CFSTR("a8v");
  *(float *)&v71 = a3->var60;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v155[60] = v72;
  v154[61] = CFSTR("atv");
  *(float *)&v73 = a3->var61;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v155[61] = v74;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 62);
  v151 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXKonaSpeechEngine highFormantBandwidthScalingFactor](self, "highFormantBandwidthScalingFactor");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v70) = v75 == 0;

  if ((v70 & 1) == 0)
  {
    var22 = a3->var22;
    -[AXKonaSpeechEngine highFormantBandwidthScalingFactor](self, "highFormantBandwidthScalingFactor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "floatValue");
    a3->var22 = var22 * v78;

    var24 = a3->var24;
    -[AXKonaSpeechEngine highFormantBandwidthScalingFactor](self, "highFormantBandwidthScalingFactor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "floatValue");
    a3->var22 = var24 * v81;

    var26 = a3->var26;
    -[AXKonaSpeechEngine highFormantBandwidthScalingFactor](self, "highFormantBandwidthScalingFactor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "floatValue");
    a3->var22 = var26 * v84;

  }
  -[AXKonaSpeechEngine highFormantFrequencyScalingFactor](self, "highFormantFrequencyScalingFactor");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85 == 0;

  if (!v86)
  {
    var21 = a3->var21;
    -[AXKonaSpeechEngine highFormantFrequencyScalingFactor](self, "highFormantFrequencyScalingFactor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "floatValue");
    a3->var21 = var21 * v89;

    var23 = a3->var23;
    -[AXKonaSpeechEngine highFormantFrequencyScalingFactor](self, "highFormantFrequencyScalingFactor");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "floatValue");
    a3->var21 = var23 * v92;

    var25 = a3->var25;
    -[AXKonaSpeechEngine highFormantFrequencyScalingFactor](self, "highFormantFrequencyScalingFactor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "floatValue");
    a3->var21 = var25 * v95;

  }
  -[AXKonaSpeechEngine dynamicLoggingBlock](self, "dynamicLoggingBlock");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v96 == 0;

  if (!v97)
  {
    -[AXKonaSpeechEngine dynamicLoggingBlock](self, "dynamicLoggingBlock");
    v98 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v98)[2](v98, v151);

  }
}

- (void)klattConstantHook:(id *)a3
{
  void *v5;
  float v6;
  void *v7;
  float v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  id v13;
  id v14;
  id v15;
  id v16;

  -[AXKonaSpeechEngine overrideFricationGain](self, "overrideFricationGain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[AXKonaSpeechEngine overrideFricationGain](self, "overrideFricationGain");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    a3->var10 = v6;

  }
  -[AXKonaSpeechEngine overrideAspirationGain](self, "overrideAspirationGain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXKonaSpeechEngine overrideAspirationGain](self, "overrideAspirationGain");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    a3->var9 = v8;

  }
  -[AXKonaSpeechEngine overrideVoicingGain](self, "overrideVoicingGain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AXKonaSpeechEngine overrideVoicingGain](self, "overrideVoicingGain");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    a3->var8 = v10;

  }
  -[AXKonaSpeechEngine overrideOverallGain](self, "overrideOverallGain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AXKonaSpeechEngine overrideOverallGain](self, "overrideOverallGain");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    a3->var11 = v12;

  }
}

- (int64_t)eciCallback:(int64_t)a3 iParam:(int64_t)a4 instanceData:(void *)a5
{
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  AXKonaBuffer *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[4];
  id v52;
  _QWORD *v53;
  id v54;
  _QWORD v55[3];
  char v56;
  _DWORD v57[4];
  signed __int16 *pSampleBuffer;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (-[AXKonaSpeechEngine synthState](self, "synthState", a3, a4, a5) != 2)
  {
    if (a3 == 1)
    {
      -[AXKonaSpeechEngine engineFormat](self, "engineFormat");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sampleRate");
      v19 = v18;

      -[AXKonaSpeechEngine outputFormat](self, "outputFormat");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sampleRate");
      v22 = v21;

      v57[0] = 1;
      v57[2] = 1;
      v57[3] = a4;
      pSampleBuffer = self->_pSampleBuffer;
      v23 = objc_alloc(MEMORY[0x1E0C89AC0]);
      -[AXKonaSpeechEngine engineFormat](self, "engineFormat");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(v23, "initWithPCMFormat:bufferListNoCopy:deallocator:", v24, v57, 0);

      v25 = objc_alloc(MEMORY[0x1E0C89AC0]);
      -[AXKonaSpeechEngine outputFormat](self, "outputFormat");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v27) = vcvtpd_u64_f64((double)(a4 >> 1) / (v19 / v22));
      v28 = (void *)objc_msgSend(v25, "initWithPCMFormat:frameCapacity:", v26, v27);

      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x2020000000;
      v56 = 0;
      -[AXKonaSpeechEngine bufferConverter](self, "bufferConverter");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v55;
      v54 = 0;
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __54__AXKonaSpeechEngine_eciCallback_iParam_instanceData___block_invoke;
      v51[3] = &unk_1E8C617E0;
      v30 = v46;
      v52 = v30;
      objc_msgSend(v29, "convertToBuffer:error:withInputFromBlock:", v28, &v54, v51);
      v45 = v54;

      -[AXKonaSpeechEngine setCurrentFrameCount:](self, "setCurrentFrameCount:", -[AXKonaSpeechEngine currentFrameCount](self, "currentFrameCount")+ objc_msgSend(v28, "frameLength"));
      v31 = objc_alloc_init(AXKonaBuffer);
      -[AXKonaBuffer setBuffer:](v31, "setBuffer:", v28);
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      -[AXKonaSpeechEngine currentMarkers](self, "currentMarkers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v48;
        do
        {
          v35 = 0;
          do
          {
            if (*(_QWORD *)v48 != v34)
              objc_enumerationMutation(v32);
            v36 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v35);
            -[AXKonaSpeechEngine currentSpeechString](self, "currentSpeechString", v45);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v36, "originalStringRange");
            v40 = objc_msgSend(v37, "translateRangeInTransformedString:", v38, v39);
            objc_msgSend(v36, "setOriginalStringRange:", v40, v41);

            ++v35;
          }
          while (v33 != v35);
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        }
        while (v33);
      }

      -[AXKonaSpeechEngine currentMarkers](self, "currentMarkers");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXKonaBuffer setMarkers:](v31, "setMarkers:", v42);

      -[AXKonaSpeechEngine _enqueueBuffer:](self, "_enqueueBuffer:", v31);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXKonaSpeechEngine setCurrentMarkers:](self, "setCurrentMarkers:", v43);

      _Block_object_dispose(v55, 8);
    }
    else if (!a3)
    {
      -[AXKonaSpeechEngine currentSpeechSegments](self, "currentSpeechSegments");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9 > a4)
      {
        -[AXKonaSpeechEngine currentSpeechSegments](self, "currentSpeechSegments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", a4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "marker");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = -[AXKonaSpeechEngine currentFrameCount](self, "currentFrameCount");
          objc_msgSend(v11, "marker");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setFramePosition:", v13);

          -[AXKonaSpeechEngine currentMarkers](self, "currentMarkers");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "marker");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

        }
      }
    }
  }
  return 0;
}

id __54__AXKonaSpeechEngine_eciCallback_iParam_instanceData___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    *a3 = 1;
    return 0;
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
    *a3 = 0;
    return *(id *)(a1 + 32);
  }
}

+ (id)allVoices
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  AXKonaVoice *v9;
  void *v10;
  void *v11;
  void *v12;
  AXKonaParameters *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  void *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("KonaVoicePresets"), CFSTR("plist"));
  v4 = objc_claimAutoreleasedReturnValue();

  v40 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v4);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v43;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v7);
        v9 = objc_alloc_init(AXKonaVoice);
        objc_msgSend(v8, "objectForKey:", CFSTR("name"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXKonaVoice setName:](v9, "setName:", v10);

        objc_msgSend(v8, "objectForKey:", CFSTR("languageCode"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXKonaVoice setLanguageCode:](v9, "setLanguageCode:", v11);

        objc_msgSend(v8, "objectForKey:", CFSTR("konaDialect"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXKonaVoice setKonaLanguage:](v9, "setKonaLanguage:", objc_msgSend(v12, "unsignedIntValue"));

        v13 = objc_alloc_init(AXKonaParameters);
        -[AXKonaVoice setParameters:](v9, "setParameters:", v13);

        objc_msgSend(v8, "objectForKey:", CFSTR("vocalTract"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "intValue");
        -[AXKonaVoice parameters](v9, "parameters");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setVocalTract:", v15);

        objc_msgSend(v8, "objectForKey:", CFSTR("headSize"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "intValue");
        -[AXKonaVoice parameters](v9, "parameters");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setHeadSize:", v18);

        objc_msgSend(v8, "objectForKey:", CFSTR("pitchBase"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "intValue");
        -[AXKonaVoice parameters](v9, "parameters");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setPitchBase:", v21);

        objc_msgSend(v8, "objectForKey:", CFSTR("pitchFluctuation"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "intValue");
        -[AXKonaVoice parameters](v9, "parameters");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setPitchFluctuation:", v24);

        objc_msgSend(v8, "objectForKey:", CFSTR("breathiness"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "intValue");
        -[AXKonaVoice parameters](v9, "parameters");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setBreathiness:", v27);

        objc_msgSend(v8, "objectForKey:", CFSTR("roughness"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "intValue");
        -[AXKonaVoice parameters](v9, "parameters");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setRoughness:", v30);

        objc_msgSend(v8, "objectForKey:", CFSTR("volume"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "intValue");
        -[AXKonaVoice parameters](v9, "parameters");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setVolume:", v33);

        objc_msgSend(v8, "objectForKey:", CFSTR("speed"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "intValue");
        -[AXKonaVoice parameters](v9, "parameters");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setSpeed:", v36);

        objc_msgSend(v8, "objectForKey:", CFSTR("eciVoiceNumber"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXKonaVoice setEciVoiceNumber:](v9, "setEciVoiceNumber:", (int)objc_msgSend(v38, "intValue"));

        objc_msgSend(v2, "addObject:", v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)dynamicLoggingBlock
{
  return self->_dynamicLoggingBlock;
}

- (void)setDynamicLoggingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (BOOL)highQualityMode
{
  return self->_highQualityMode;
}

- (BOOL)abbreviationDictionary
{
  return self->_abbreviationDictionary;
}

- (BOOL)phrasePrediction
{
  return self->_phrasePrediction;
}

- (BOOL)preferCommunityDictionary
{
  return self->_preferCommunityDictionary;
}

- (NSNumber)overrideFricationGain
{
  return self->_overrideFricationGain;
}

- (NSNumber)overrideAspirationGain
{
  return self->_overrideAspirationGain;
}

- (NSNumber)overrideVoicingGain
{
  return self->_overrideVoicingGain;
}

- (NSNumber)overrideOverallGain
{
  return self->_overrideOverallGain;
}

- (NSNumber)highFormantBandwidthScalingFactor
{
  return self->_highFormantBandwidthScalingFactor;
}

- (void)setHighFormantBandwidthScalingFactor:(id)a3
{
  objc_storeStrong((id *)&self->_highFormantBandwidthScalingFactor, a3);
}

- (NSNumber)highFormantFrequencyScalingFactor
{
  return self->_highFormantFrequencyScalingFactor;
}

- (void)setHighFormantFrequencyScalingFactor:(id)a3
{
  objc_storeStrong((id *)&self->_highFormantFrequencyScalingFactor, a3);
}

- (TTSRulesetRunner)ruleSetRunner
{
  return self->_ruleSetRunner;
}

- (void)setRuleSetRunner:(id)a3
{
  objc_storeStrong((id *)&self->_ruleSetRunner, a3);
}

- (void)wrappedInstance
{
  return self->_wrappedInstance;
}

- (void)setWrappedInstance:(void *)a3
{
  self->_wrappedInstance = a3;
}

- (void)currentDictionary
{
  return self->_currentDictionary;
}

- (void)setCurrentDictionary:(void *)a3
{
  self->_currentDictionary = a3;
}

- (OS_dispatch_queue)synthesizerSyncQueue
{
  return self->_synthesizerSyncQueue;
}

- (void)setSynthesizerSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synthesizerSyncQueue, a3);
}

- (AXKonaVoice)currentVoice
{
  return self->_currentVoice;
}

- (void)setCurrentVoice:(id)a3
{
  objc_storeStrong((id *)&self->_currentVoice, a3);
}

- (AXKonaConfiguration)currentConfiguration
{
  return self->_currentConfiguration;
}

- (void)setCurrentConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_currentConfiguration, a3);
}

- (NLTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (void)setTokenizer:(id)a3
{
  objc_storeStrong((id *)&self->_tokenizer, a3);
}

- (AXKonaParameters)currentParameters
{
  return self->_currentParameters;
}

- (void)setCurrentParameters:(id)a3
{
  objc_storeStrong((id *)&self->_currentParameters, a3);
}

- (NSDictionary)configurationMap
{
  return self->_configurationMap;
}

- (void)setConfigurationMap:(id)a3
{
  objc_storeStrong((id *)&self->_configurationMap, a3);
}

- (NSArray)currentSpeechSegments
{
  return self->_currentSpeechSegments;
}

- (void)setCurrentSpeechSegments:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpeechSegments, a3);
}

- (NSMutableArray)currentMarkers
{
  return self->_currentMarkers;
}

- (void)setCurrentMarkers:(id)a3
{
  objc_storeStrong((id *)&self->_currentMarkers, a3);
}

- (unsigned)currentFrameCount
{
  return self->_currentFrameCount;
}

- (void)setCurrentFrameCount:(unsigned int)a3
{
  self->_currentFrameCount = a3;
}

- (AVAudioConverter)bufferConverter
{
  return self->_bufferConverter;
}

- (void)setBufferConverter:(id)a3
{
  objc_storeStrong((id *)&self->_bufferConverter, a3);
}

- (float)lastSampVal
{
  return self->_lastSampVal;
}

- (void)setLastSampVal:(float)a3
{
  self->_lastSampVal = a3;
}

- (AVAudioFormat)engineFormat
{
  return self->_engineFormat;
}

- (void)setEngineFormat:(id)a3
{
  objc_storeStrong((id *)&self->_engineFormat, a3);
}

- (AVAudioFormat)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(id)a3
{
  objc_storeStrong((id *)&self->_outputFormat, a3);
}

- (NSRegularExpression)commandRegex
{
  return self->_commandRegex;
}

- (void)setCommandRegex:(id)a3
{
  objc_storeStrong((id *)&self->_commandRegex, a3);
}

- (unint64_t)synthState
{
  return self->_synthState;
}

- (void)setSynthState:(unint64_t)a3
{
  self->_synthState = a3;
}

- (NSMutableArray)queuedBuffers
{
  return self->_queuedBuffers;
}

- (void)setQueuedBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_queuedBuffers, a3);
}

- (NSCondition)producedBuffers
{
  return self->_producedBuffers;
}

- (void)setProducedBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_producedBuffers, a3);
}

- (NSCondition)consumedBuffers
{
  return self->_consumedBuffers;
}

- (void)setConsumedBuffers:(id)a3
{
  objc_storeStrong((id *)&self->_consumedBuffers, a3);
}

- (TTSSpeechString)currentSpeechString
{
  return self->_currentSpeechString;
}

- (void)setCurrentSpeechString:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpeechString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSpeechString, 0);
  objc_storeStrong((id *)&self->_consumedBuffers, 0);
  objc_storeStrong((id *)&self->_producedBuffers, 0);
  objc_storeStrong((id *)&self->_queuedBuffers, 0);
  objc_storeStrong((id *)&self->_commandRegex, 0);
  objc_storeStrong((id *)&self->_outputFormat, 0);
  objc_storeStrong((id *)&self->_engineFormat, 0);
  objc_storeStrong((id *)&self->_bufferConverter, 0);
  objc_storeStrong((id *)&self->_currentMarkers, 0);
  objc_storeStrong((id *)&self->_currentSpeechSegments, 0);
  objc_storeStrong((id *)&self->_configurationMap, 0);
  objc_storeStrong((id *)&self->_currentParameters, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_currentVoice, 0);
  objc_storeStrong((id *)&self->_synthesizerSyncQueue, 0);
  objc_storeStrong((id *)&self->_ruleSetRunner, 0);
  objc_storeStrong((id *)&self->_highFormantFrequencyScalingFactor, 0);
  objc_storeStrong((id *)&self->_highFormantBandwidthScalingFactor, 0);
  objc_storeStrong((id *)&self->_overrideOverallGain, 0);
  objc_storeStrong((id *)&self->_overrideVoicingGain, 0);
  objc_storeStrong((id *)&self->_overrideAspirationGain, 0);
  objc_storeStrong((id *)&self->_overrideFricationGain, 0);
  objc_storeStrong(&self->_dynamicLoggingBlock, 0);
}

- (void)_segmentsForText:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1CF3B6000, v0, v1, "Outgoing segments after crash-word removal: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_segmentsForText:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1CF3B6000, v0, v1, "Outgoing segments before crash-word removal: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_segmentsForText:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1CF3B6000, v0, v1, "Processing segments for text: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_loadDictionaryForVoice:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_0(&dword_1CF3B6000, a1, a3, "No resources found at %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_loadDictionaryForVoice:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1CF3B6000, a3, (uint64_t)a3, "Could not activate dictionary for %@", (uint8_t *)a2);

}

- (void)_loadDictionaryForVoice:(NSObject *)a3 .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1CF3B6000, a3, (uint64_t)a3, "Could not create dictionary for %@", (uint8_t *)a2);

}

- (void)_loadDictionaryAtPath:type:handle:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CF3B6000, v0, v1, "Failed to load dictionaty at %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
