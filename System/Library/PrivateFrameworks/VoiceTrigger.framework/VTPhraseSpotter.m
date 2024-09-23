@implementation VTPhraseSpotter

- (VTPhraseSpotter)init
{
  void *v3;
  char v4;
  VTPhraseSpotter *v5;

  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "corespeechDaemonEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    self = -[VTPhraseSpotter initWithHardwareSampleRate:](self, "initWithHardwareSampleRate:", 16000.0);
    v5 = self;
  }

  return v5;
}

- (VTPhraseSpotter)initWithHardwareSampleRate:(double)a3
{
  void *v5;
  char v6;
  VTPhraseSpotter *v7;

  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "corespeechDaemonEnabled");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    self = -[VTPhraseSpotter initWithHardwareSampleRate:readyCompletion:](self, "initWithHardwareSampleRate:readyCompletion:", 0, a3);
    v7 = self;
  }

  return v7;
}

- (VTPhraseSpotter)initWithHardwareSampleRate:(double)a3 readyCompletion:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  VTPhraseSpotter *v11;
  void *v12;
  id readyCompletion;
  NSObject *ndetectQueue;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *desQueue;
  NSObject *v17;
  _QWORD block[4];
  VTPhraseSpotter *v20;
  objc_super v21;
  uint8_t buf[16];

  v6 = a4;
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "corespeechDaemonEnabled");

  if ((v8 & 1) != 0)
    goto LABEL_7;
  v9 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "VT initialization start", buf, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)VTPhraseSpotter;
  self = -[VTPhraseSpotter init](&v21, sel_init);
  if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "VoiceTrigger framework not available. Returning nil for VTPhraseSpotter", buf, 2u);
      v11 = 0;
      goto LABEL_16;
    }
LABEL_7:
    v11 = 0;
    goto LABEL_16;
  }
  if (self)
  {
    -[VTPhraseSpotter _initDetector](self, "_initDetector");
    self->_hardwareSampleRate = a3;
    -[VTPhraseSpotter _commonInit](self, "_commonInit");
    -[VTPhraseSpotter _configureWithDefaults](self, "_configureWithDefaults");
    if (v6)
    {
      v12 = (void *)MEMORY[0x212BACF9C](v6);
      readyCompletion = self->_readyCompletion;
      self->_readyCompletion = v12;

      -[VTPhraseSpotter _performReadyCompletion](self, "_performReadyCompletion");
    }
    else
    {
      ndetectQueue = self->_ndetectQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__VTPhraseSpotter_initWithHardwareSampleRate_readyCompletion___block_invoke;
      block[3] = &unk_24C7F4C20;
      v20 = self;
      dispatch_sync(ndetectQueue, block);

    }
    v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.fides-record-creation", 0);
    desQueue = self->_desQueue;
    self->_desQueue = v15;

  }
  objc_storeStrong((id *)&_currentSpotter, self);
  self->_audioInjectionIndex = 0;
  v17 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v17, OS_LOG_TYPE_DEFAULT, "VT initialization complete", buf, 2u);
  }
  self = self;
  v11 = self;
LABEL_16:

  return v11;
}

- (VTPhraseSpotter)initWithLanguageCodeForSATEnrollment:(id)a3
{
  id v5;
  void *v6;
  char v7;
  VTPhraseSpotter *v8;
  VTPhraseSpotter *v9;
  VTPhraseSpotter *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *desQueue;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *configVersion;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSString *v25;
  void *v26;
  NSString *v27;
  void *v28;
  uint64_t v29;
  NSString *v30;
  void *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *v33;
  NSObject *v34;
  dispatch_queue_t v35;
  OS_dispatch_queue *assetChangedQueue;
  NSObject *v37;
  NSObject *ndetectQueue;
  VTPhraseSpotter *v39;
  VTCorruptDetector *v40;
  VTCorruptDetector *corruptDetector;
  _QWORD block[4];
  VTPhraseSpotter *v44;
  uint8_t buf[16];
  objc_super v46;

  v5 = a3;
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "corespeechDaemonEnabled");

  if ((v7 & 1) == 0)
  {
    v46.receiver = self;
    v46.super_class = (Class)VTPhraseSpotter;
    v9 = -[VTPhraseSpotter init](&v46, sel_init);
    v10 = v9;
    if (!v9)
    {
LABEL_20:
      objc_storeStrong((id *)&_currentSpotter, v10);
      self = v10;
      v8 = self;
      goto LABEL_21;
    }
    v9->_isRunningSATEnrollment = 1;
    v9->_phraseSpotterEnabled = 1;
    v9->_phraseSpotterBypassed = 0;
    v9->_externalPhraseSpotterRunning = 0;
    v9->_hardwareSampleRate = 0.0;
    objc_storeStrong((id *)&v9->_languageCode, a3);
    if (v10->_ndetectQueue)
    {
      if (v10->_assetChangedQueue)
      {
LABEL_6:
        v11 = dispatch_queue_create("com.apple.fides-record-creation", 0);
        desQueue = v10->_desQueue;
        v10->_desQueue = (OS_dispatch_queue *)v11;

        +[VTAssetManager sharedInstance](VTAssetManager, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "installedAssetForLanguage:", v10->_languageCode);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v14, "path");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("config.txt"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "compatibilityVersion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringValue");
          v18 = objc_claimAutoreleasedReturnValue();
          configVersion = v10->_configVersion;
          v10->_configVersion = (NSString *)v18;

          if (v10->_configVersion)
          {
            objc_msgSend(v14, "version");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20)
            {
              v21 = v10->_configVersion;
              objc_msgSend(v14, "version");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "stringValue");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSString stringByAppendingFormat:](v21, "stringByAppendingFormat:", CFSTR(".%@"), v23);
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = v10->_configVersion;
              v10->_configVersion = (NSString *)v24;

            }
            if (v10->_configVersion)
            {
              objc_msgSend(v14, "footprint");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                v27 = v10->_configVersion;
                objc_msgSend(v14, "footprint");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSString stringByAppendingFormat:](v27, "stringByAppendingFormat:", CFSTR(".%@"), v28);
                v29 = objc_claimAutoreleasedReturnValue();
                v30 = v10->_configVersion;
                v10->_configVersion = (NSString *)v29;

              }
            }
          }
          +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setAssetString:", v10->_configVersion);

          objc_storeStrong((id *)&v10->_configLanguageCode, v10->_languageCode);
          -[VTPhraseSpotter _configureWithConfig:resourcePath:](v10, "_configureWithConfig:resourcePath:", v16, v15);

        }
        else
        {
          v37 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D965000, v37, OS_LOG_TYPE_DEFAULT, "::: asset is not available for SAT enrollment, cannot do anything", buf, 2u);
          }
          v10->_phraseSpotterEnabled = 0;
        }
        ndetectQueue = v10->_ndetectQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __56__VTPhraseSpotter_initWithLanguageCodeForSATEnrollment___block_invoke;
        block[3] = &unk_24C7F4C20;
        v39 = v10;
        v44 = v39;
        dispatch_async(ndetectQueue, block);
        -[VTPhraseSpotter _resetCounters](v39, "_resetCounters");
        v40 = objc_alloc_init(VTCorruptDetector);
        corruptDetector = v39->_corruptDetector;
        v39->_corruptDetector = v40;

        goto LABEL_20;
      }
    }
    else
    {
      v32 = dispatch_queue_create("voiceTrigger reload queue", 0);
      v33 = v10->_ndetectQueue;
      v10->_ndetectQueue = (OS_dispatch_queue *)v32;

      if (v10->_assetChangedQueue)
        goto LABEL_6;
    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = dispatch_queue_create("voiceTrigger asset changed", v34);
    assetChangedQueue = v10->_assetChangedQueue;
    v10->_assetChangedQueue = (OS_dispatch_queue *)v35;

    goto LABEL_6;
  }
  v8 = 0;
LABEL_21:

  return v8;
}

- (VTPhraseSpotter)initWithConfig:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  VTPhraseSpotter *v10;
  VTPhraseSpotter *v11;
  VTPhraseSpotter *v12;
  NSString *languageCode;

  v6 = a3;
  v7 = a4;
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "corespeechDaemonEnabled");

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v11 = -[VTPhraseSpotter init](self, "init");
    v12 = v11;
    if (v11)
    {
      -[VTPhraseSpotter _commonInit](v11, "_commonInit");
      languageCode = v12->_languageCode;
      v12->_languageCode = (NSString *)CFSTR("??-??");

      -[VTPhraseSpotter _configureWithConfig:resourcePath:](v12, "_configureWithConfig:resourcePath:", v6, v7);
    }
    dispatch_sync((dispatch_queue_t)v12->_ndetectQueue, &__block_literal_global_6251);
    objc_storeStrong((id *)&_currentSpotter, v12);
    self = v12;
    v10 = self;
  }

  return v10;
}

- (VTPhraseSpotter)initWithConfig:(id)a3 assetDir:(id)a4 runMode:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  VTPhraseSpotter *v12;
  VTPhraseSpotter *v13;
  VTPhraseSpotter *v14;
  NSString *languageCode;
  NSString *configVersion;

  v8 = a3;
  v9 = a4;
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "corespeechDaemonEnabled");

  if ((v11 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v13 = -[VTPhraseSpotter init](self, "init");
    v14 = v13;
    if (v13)
    {
      languageCode = v13->_languageCode;
      v13->_languageCode = (NSString *)CFSTR("XX-XX");

      if (a5 <= 2)
        *((_BYTE *)&v14->super.isa + qword_20DA25528[a5]) = 1;
      v14->_phraseSpotterEnabled = 1;
      v14->_phraseSpotterBypassed = 0;
      v14->_externalPhraseSpotterRunning = 0;
      configVersion = v14->_configVersion;
      v14->_configVersion = (NSString *)CFSTR("1.0");

      objc_storeStrong((id *)&v14->_configLanguageCode, v14->_languageCode);
      -[VTPhraseSpotter _configureWithConfig:resourcePath:](v14, "_configureWithConfig:resourcePath:", v8, v9);
      dispatch_sync((dispatch_queue_t)v14->_ndetectQueue, &__block_literal_global_299);
      objc_storeStrong((id *)&_currentSpotter, v14);
    }
    self = v14;
    v12 = self;
  }

  return v12;
}

- (void)prepareWithProperty:(id)a3 readyCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  VTTextDependentSpeakerRecognizer *satDetectionTdSr;
  OS_dispatch_semaphore *v12;
  OS_dispatch_semaphore *satDetectionTdSrSemaphore;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  double secondPassTrailingTime;
  double v32;
  int v33;
  NSObject *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  VTTranscriber *transcriber;
  void *v40;
  void *v41;
  uint64_t v42;
  OSStatus v43;
  OSStatus v44;
  NSObject *v45;
  OpaqueAudioConverter *v46;
  AudioBufferList *deinterleavedABL;
  AudioBufferList *v48;
  void *v49;
  void *v50;
  unint64_t audioInjectionIndex;
  unint64_t v52;
  VTAudioFileReader *v53;
  NSString *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  unint64_t v58;
  NSString *v59;
  NSString *injectedAudioFilePath;
  VTAudioFileReader *v61;
  void *v62;
  void *v63;
  void *v64;
  VTAudioFileReader *v65;
  VTAudioFileReader *audioFileReader;
  void *v67;
  id readyForAnalyze;
  void *v69;
  int v70;
  uint64_t v71;
  NSObject *log;
  void *v73;
  _QWORD v74[5];
  AudioStreamBasicDescription info;
  AudioConverterRef outAudioConverter;
  uint8_t v77[4];
  OSStatus v78;
  AudioStreamBasicDescription buf;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[VTPhraseSpotter _commonInit](self, "_commonInit");
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.mSampleRate) = 138543362;
    *(_QWORD *)((char *)&buf.mSampleRate + 4) = v6;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "preparing VTPhraseSpotter with property: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  self->_isSecondPass = 0;
  self->_secondPassResetTimer = 0;
  *(_WORD *)&self->_didWakeAP = 0;
  self->_earlyDetecFiredMachTime = 0;
  self->_triggerFireMachTime = 0;
  self->_triggerStartMachTime = 0;
  self->_firstPassScore = -1000.0;
  *(_WORD *)&self->_isRunningRecognizer = 0;
  self->_firstRecognitionResultReceived = 0;
  -[VTTranscriber reset](self->_transcriber, "reset");
  *(_OWORD *)&self->_threshold = *(_OWORD *)&self->_ndapiThreshold;
  self->_thresholdLogNearMisses = self->_ndapiThresholdLogNearMisses;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("isSecondPass"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 && objc_msgSend(v9, "BOOLValue"))
    {
      satDetectionTdSr = self->_satDetectionTdSr;
      if (satDetectionTdSr)
      {
        self->_lastCombinedTdSpeakerRecognizerSATScore = 0.0;
        -[VTTextDependentSpeakerRecognizer resetForNewRequest](satDetectionTdSr, "resetForNewRequest");
        v12 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
        satDetectionTdSrSemaphore = self->_satDetectionTdSrSemaphore;
        self->_satDetectionTdSrSemaphore = v12;

        v14 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.mSampleRate) = 138412546;
          *(_QWORD *)((char *)&buf.mSampleRate + 4) = v10;
          LOWORD(buf.mFormatFlags) = 2112;
          *(_QWORD *)((char *)&buf.mFormatFlags + 2) = v6;
          _os_log_impl(&dword_20D965000, v14, OS_LOG_TYPE_DEFAULT, "Created _satDetectionTdSrSemaphore: isSecondPass=%@, property: %@", (uint8_t *)&buf, 0x16u);
        }
      }
      self->_isSecondPass = 1;
      self->_secondPassResetTimer = 48000;
      self->_secondPassAccepted = 0;
      self->_secondPassStopSent = 0;
      self->_secondPassBestScore = -INFINITY;
      if (self->_secondPassAudioLoggingEnabled)
      {
        +[VTAudioFileLog sharedInstance](VTAudioFileLog, "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startRecording");

      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AOPVoiceTriggerData"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("trigger-woke-ap"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18 && objc_msgSend(v18, "BOOLValue"))
          self->_didWakeAP = 1;
        v73 = v19;
        if (!self->_isRunningSATEnrollment)
        {
          v20 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.mSampleRate) = 0;
            _os_log_impl(&dword_20D965000, v20, OS_LOG_TYPE_DEFAULT, "Received AOPVoiceTrigger, need to send early detect", (uint8_t *)&buf, 2u);
          }
          +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
          self->_earlyDetectTime = v21;
          self->_earlyDetecFiredMachTime = mach_absolute_time();
          +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "useSiriActivationSPIForiOS");

          if (v23)
          {
            AFSiriActivationBuiltInMicVoiceTriggerPrewarm();
          }
          else
          {
            notify_post("com.apple.voicetrigger.EarlyDetect");
            v24 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.mSampleRate) = 0;
              _os_log_impl(&dword_20D965000, v24, OS_LOG_TYPE_DEFAULT, "Use legacy notification", (uint8_t *)&buf, 2u);
            }
          }
        }
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("trigger-time"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("currentHostTime"));
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v25)
        {
          if (v26)
          {
            self->_triggerStartMachTime = objc_msgSend(v25, "unsignedLongLongValue");
            v28 = -[VTPhraseSpotter _applyExtraTime:to:](self, "_applyExtraTime:to:", objc_msgSend(v25, "unsignedLongLongValue"), 0.5);
            if (objc_msgSend(v27, "unsignedLongLongValue") > v28)
            {
              v29 = objc_msgSend(v27, "unsignedLongLongValue");
              info.mSampleRate = 0.0;
              mach_timebase_info((mach_timebase_info_t)&info);
              if (LODWORD(info.mSampleRate))
              {
                LODWORD(v30) = HIDWORD(info.mSampleRate);
                secondPassTrailingTime = self->_secondPassTrailingTime;
                v32 = secondPassTrailingTime
                    + (double)(v29 - v28) / ((double)v30 / (double)LODWORD(info.mSampleRate) * 1000000000.0);
                v33 = (int)(v32 * 16000.0);
                if (v33 >= 1 && self->_secondPassResetTimer > v33)
                {
                  self->_secondPassResetTimer = v33;
                  v34 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    LODWORD(buf.mSampleRate) = 134349568;
                    *(double *)((char *)&buf.mSampleRate + 4) = v32;
                    LOWORD(buf.mFormatFlags) = 2050;
                    *(double *)((char *)&buf.mFormatFlags + 2) = secondPassTrailingTime;
                    HIWORD(buf.mFramesPerPacket) = 1026;
                    buf.mBytesPerFrame = (int)(v32 * 16000.0);
                    _os_log_impl(&dword_20D965000, v34, OS_LOG_TYPE_DEFAULT, "VT 2nd-pass is set to analyze %{public}.2f (%{public}.2f more) seconds (%{public}d samples)", (uint8_t *)&buf, 0x1Cu);
                  }
                }
              }
            }
          }
        }
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("trigger-config-blob"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        self->_firstPassScore = -1000.0;
        if (v35)
        {
          if ((unint64_t)objc_msgSend(v35, "length") >= 0x18
            && (v37 = objc_retainAutorelease(v36), objc_msgSend(v37, "bytes")))
          {
            self->_firstPassScore = *(float *)(objc_msgSend(objc_retainAutorelease(v37), "bytes") + 16);
          }
          else
          {
            v38 = (void *)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
            {
              log = v38;
              v70 = objc_msgSend(v36, "length");
              v71 = objc_msgSend(objc_retainAutorelease(v36), "bytes");
              LODWORD(buf.mSampleRate) = 67240448;
              HIDWORD(buf.mSampleRate) = v70;
              LOWORD(buf.mFormatID) = 1026;
              *(AudioFormatID *)((char *)&buf.mFormatID + 2) = v71 == 0;
              _os_log_error_impl(&dword_20D965000, log, OS_LOG_TYPE_ERROR, "firstPassOutData is invalid. VoiceTrigger is not able to decode size(%{public}d), isNull(%{public}d)", (uint8_t *)&buf, 0xEu);

            }
          }
        }

      }
      if (self->_useRecognizer)
      {
        self->_isRunningRecognizer = 1;
        *(_OWORD *)&self->_threshold = *(_OWORD *)&self->_combinedThreshold;
        self->_thresholdLogNearMisses = self->_combinedThresholdLogNearMisses;
        transcriber = self->_transcriber;
        v74[0] = MEMORY[0x24BDAC760];
        v74[1] = 3221225472;
        v74[2] = __55__VTPhraseSpotter_prepareWithProperty_readyCompletion___block_invoke_316;
        v74[3] = &unk_24C7F4C20;
        v74[4] = self;
        -[VTTranscriber runRecognitionWithCallback:](transcriber, "runRecognitionWithCallback:", v74);
      }

    }
    if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
    {
      self->_numChannels = 1;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("channelCount"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v40 && objc_msgSend(v40, "integerValue") >= 2)
      {
        v42 = objc_msgSend(v41, "integerValue");
        self->_numChannels = v42;
        outAudioConverter = 0;
        buf.mSampleRate = 16000.0;
        *(_QWORD *)&buf.mFormatID = 0xC6C70636DLL;
        buf.mBytesPerFrame = 2 * v42;
        buf.mChannelsPerFrame = v42;
        buf.mBytesPerPacket = 2 * v42;
        buf.mFramesPerPacket = 1;
        *(_QWORD *)&buf.mBitsPerChannel = 16;
        *(_OWORD *)&info.mSampleRate = *(_OWORD *)&buf.mSampleRate;
        *(_OWORD *)&info.mBytesPerPacket = *(_OWORD *)&buf.mBytesPerPacket;
        *(_QWORD *)&info.mBitsPerChannel = 16;
        info.mBytesPerFrame = 2;
        info.mFormatFlags = 44;
        info.mBytesPerPacket = 2;
        v43 = AudioConverterNew(&buf, &info, &outAudioConverter);
        if (v43)
        {
          v44 = v43;
          v45 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v77 = 67240192;
            v78 = v44;
            _os_log_impl(&dword_20D965000, v45, OS_LOG_TYPE_DEFAULT, "Cannot create AudioConverter using AudioConverterNew: %{public}d", v77, 8u);
          }
          v46 = 0;
        }
        else
        {
          v46 = outAudioConverter;
        }
        self->_deinterleaver = v46;
        deinterleavedABL = self->_deinterleavedABL;
        if (deinterleavedABL)
          free(deinterleavedABL);
        v48 = (AudioBufferList *)malloc_type_malloc(24 * self->_numChannels, 0x10800404ACF7207uLL);
        self->_deinterleavedABL = v48;
        v48->mNumberBuffers = self->_numChannels;
      }

    }
  }
  -[VTCorruptDetector reset](self->_corruptDetector, "reset");
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "audioInjectionFilePath");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    self->_secondPassResetTimer = 48000;
    audioInjectionIndex = self->_audioInjectionIndex;
    if (audioInjectionIndex >= objc_msgSend(v50, "count"))
    {
      v52 = 0;
      self->_audioInjectionIndex = 0;
    }
    else
    {
      v52 = self->_audioInjectionIndex;
    }
    v55 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v56 = v55;
      objc_msgSend(v50, "objectAtIndexedSubscript:", v52);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = self->_audioInjectionIndex;
      LODWORD(buf.mSampleRate) = 138412546;
      *(_QWORD *)((char *)&buf.mSampleRate + 4) = v57;
      LOWORD(buf.mFormatFlags) = 1024;
      *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = v58;
      _os_log_impl(&dword_20D965000, v56, OS_LOG_TYPE_DEFAULT, "::: Audio Injection for file : %@, %d", (uint8_t *)&buf, 0x12u);

      v52 = self->_audioInjectionIndex;
    }
    objc_msgSend(v50, "objectAtIndexedSubscript:", v52);
    v59 = (NSString *)objc_claimAutoreleasedReturnValue();
    injectedAudioFilePath = self->_injectedAudioFilePath;
    self->_injectedAudioFilePath = v59;

    v61 = [VTAudioFileReader alloc];
    v62 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v50, "objectAtIndexedSubscript:", self->_audioInjectionIndex);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "URLWithString:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = -[VTAudioFileReader initWithURL:](v61, "initWithURL:", v64);
    audioFileReader = self->_audioFileReader;
    self->_audioFileReader = v65;

    ++self->_audioInjectionIndex;
  }
  else
  {
    v53 = self->_audioFileReader;
    self->_audioFileReader = 0;

    v54 = self->_injectedAudioFilePath;
    self->_injectedAudioFilePath = 0;

  }
  v67 = (void *)MEMORY[0x212BACF9C](v7);

  readyForAnalyze = self->_readyForAnalyze;
  self->_readyForAnalyze = v67;

  -[VTPhraseSpotter _performReadyCompletion](self, "_performReadyCompletion");
  v69 = (void *)objc_msgSend(v6, "copy");
  -[VTPhraseSpotter _logPrepareProperty:](self, "_logPrepareProperty:", v69);

}

- (void)notifyAssetChangeWithCallback:(id)a3
{
  void *v4;
  id assetChangedCallback;

  v4 = (void *)MEMORY[0x212BACF9C](a3, a2);
  assetChangedCallback = self->_assetChangedCallback;
  self->_assetChangedCallback = v4;

}

- (void)_initDetector
{
  void *v3;
  void *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *loggingQueue;
  id v7;
  void *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v11;
  __CFNotificationCenter *v12;
  void *v13;
  VTPhraseSpotterEnabledPolicy *v14;
  VTPhraseSpotterEnabledPolicy *policy;
  VTPhraseSpotterEnabledPolicy *v16;
  void *v17;
  void *v18;
  void *v19;
  VTSiriNotifications *v20;
  VTSiriNotifications *siriNotifications;
  NSMutableArray *v22;
  NSMutableArray *nonceTriggerEvents;
  VTCorruptDetector *v24;
  VTCorruptDetector *corruptDetector;
  VTBiometricMatchMonitor *v26;
  VTBiometricMatchMonitor *biometricMonitor;
  OS_dispatch_queue *v28;
  OS_dispatch_queue *ndetectQueue;
  NSObject *v30;
  OS_dispatch_queue *v31;
  OS_dispatch_queue *assetChangedQueue;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, int);
  void *v36;
  id v37;
  id location;

  self->_isRunningSATEnrollment = 0;
  if (self->_ndetectQueue)
  {
    if (self->_assetChangedQueue)
      goto LABEL_3;
  }
  else
  {
    v28 = (OS_dispatch_queue *)dispatch_queue_create("voiceTrigger reload queue", 0);
    ndetectQueue = self->_ndetectQueue;
    self->_ndetectQueue = v28;

    if (self->_assetChangedQueue)
      goto LABEL_3;
  }
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (OS_dispatch_queue *)dispatch_queue_create("voiceTrigger asset changed", v30);
  assetChangedQueue = self->_assetChangedQueue;
  self->_assetChangedQueue = v31;

LABEL_3:
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_audioLoggingEnabled = objc_msgSend(v4, "fileLoggingIsEnabled");

  *(_WORD *)&self->_secondPassAudioLoggingEnabled = 0;
  if (self->_audioLoggingEnabled)
  {
    if (!self->_loggingQueue)
    {
      v5 = (OS_dispatch_queue *)dispatch_queue_create("voiceTrigger logging queue", MEMORY[0x24BDAC9C0]);
      loggingQueue = self->_loggingQueue;
      self->_loggingQueue = v5;

    }
    v7 = VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_24C7F6FB8, &stru_24C7F6FB8);
    +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_secondPassAudioLoggingEnabled = objc_msgSend(v8, "secondPassAudioLoggingEnabled");

  }
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_voiceTriggerEnabled = objc_msgSend(v9, "voiceTriggerEnabled");

  if (!self->_registeredforVoiceTriggerEnabledNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_VoiceTriggerEnabledDidChange, CFSTR("kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification"), 0, CFNotificationSuspensionBehaviorDrop);
    self->_registeredforVoiceTriggerEnabledNotification = 1;
  }
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_phraseSpotterEnabled = objc_msgSend(v11, "phraseSpotterEnabled");

  if (!self->_registeredForPhraseSpotterNotification)
  {
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, self, (CFNotificationCallback)_PhraseSpotterEnabledDidChange, CFSTR("kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification"), 0, CFNotificationSuspensionBehaviorDrop);
    self->_registeredForPhraseSpotterNotification = 1;
  }
  self->_phraseSpotterBypassed = 0;
  self->_externalPhraseSpotterRunning = 0;
  +[VTLanguageCodeUpdateMonitor sharedInstance](VTLanguageCodeUpdateMonitor, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:", self);

  v14 = objc_alloc_init(VTPhraseSpotterEnabledPolicy);
  policy = self->_policy;
  self->_policy = v14;

  objc_initWeak(&location, self);
  v16 = self->_policy;
  v33 = MEMORY[0x24BDAC760];
  v34 = 3221225472;
  v35 = __32__VTPhraseSpotter__initDetector__block_invoke;
  v36 = &unk_24C7F4CD8;
  objc_copyWeak(&v37, &location);
  -[VTPolicy setCallback:](v16, "setCallback:", &v33);
  +[VTAssetMonitor sharedInstance](VTAssetMonitor, "sharedInstance", v33, v34, v35, v36);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:", self);

  AFPreferencesMobileUserSessionLanguage();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLanguageCode:", v18);

  -[VTPhraseSpotter _handleAssetChangeForLanguageCode:](self, "_handleAssetChangeForLanguageCode:", v18);
  v20 = objc_alloc_init(VTSiriNotifications);
  siriNotifications = self->siriNotifications;
  self->siriNotifications = v20;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  nonceTriggerEvents = self->_nonceTriggerEvents;
  self->_nonceTriggerEvents = v22;

  v24 = objc_alloc_init(VTCorruptDetector);
  corruptDetector = self->_corruptDetector;
  self->_corruptDetector = v24;

  self->_triggerCount = 0;
  +[VTBiometricMatchMonitor sharedInstance](VTBiometricMatchMonitor, "sharedInstance");
  v26 = (VTBiometricMatchMonitor *)objc_claimAutoreleasedReturnValue();
  biometricMonitor = self->_biometricMonitor;
  self->_biometricMonitor = v26;

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (void)_commonInit
{
  NSObject *ndetectQueue;
  _QWORD block[5];

  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__VTPhraseSpotter__commonInit__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  void *v5;
  VTAnalyzerNDAPI *analyzer;
  void *v7;
  void *v8;
  VTAudioCircularBuffer *audioBuffer;
  void *v10;
  VTTranscriber *transcriber;
  VTTextDependentSpeakerRecognizer *satDetectionTdSr;
  AudioBufferList *deinterleavedABL;
  objc_super v14;

  if (self->_registeredforVoiceTriggerEnabledNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification"), 0);
    self->_registeredforVoiceTriggerEnabledNotification = 0;
  }
  if (self->_registeredForPhraseSpotterNotification)
  {
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(v4, self, CFSTR("kVTPreferencesPhraseSpotterEnabledDidChangeDarwinNotification"), 0);
    self->_registeredForPhraseSpotterNotification = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  analyzer = self->_analyzer;
  if (analyzer)
  {
    self->_analyzer = 0;

  }
  +[VTLanguageCodeUpdateMonitor sharedInstance](VTLanguageCodeUpdateMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  +[VTAssetMonitor sharedInstance](VTAssetMonitor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  audioBuffer = self->_audioBuffer;
  self->_audioBuffer = 0;

  v10 = (void *)_currentSpotter;
  _currentSpotter = 0;

  transcriber = self->_transcriber;
  self->_transcriber = 0;

  -[VTTextDependentSpeakerRecognizer endAudio](self->_satDetectionTdSr, "endAudio");
  satDetectionTdSr = self->_satDetectionTdSr;
  self->_satDetectionTdSr = 0;

  deinterleavedABL = self->_deinterleavedABL;
  if (deinterleavedABL)
    free(deinterleavedABL);
  v14.receiver = self;
  v14.super_class = (Class)VTPhraseSpotter;
  -[VTPhraseSpotter dealloc](&v14, sel_dealloc);
}

- (void)_performReadyCompletion
{
  NSObject *ndetectQueue;
  _QWORD v3[6];
  _QWORD v4[5];
  id v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__6237;
  v4[4] = __Block_byref_object_dispose__6238;
  v5 = 0;
  ndetectQueue = self->_ndetectQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__VTPhraseSpotter__performReadyCompletion__block_invoke;
  v3[3] = &unk_24C7F4D00;
  v3[4] = self;
  v3[5] = v4;
  dispatch_async(ndetectQueue, v3);
  _Block_object_dispose(v4, 8);

}

- (void)_phraseSpotterEnabledDidChange
{
  NSObject *assetChangedQueue;
  _QWORD block[5];

  assetChangedQueue = self->_assetChangedQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__VTPhraseSpotter__phraseSpotterEnabledDidChange__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(assetChangedQueue, block);
}

- (void)_voiceTriggerEnabledDidChange
{
  NSObject *assetChangedQueue;
  _QWORD block[5];

  assetChangedQueue = self->_assetChangedQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__VTPhraseSpotter__voiceTriggerEnabledDidChange__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(assetChangedQueue, block);
}

- (id)getAudioBuffer
{
  return self->_audioBuffer;
}

- (void)looseTriggerThreshold
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "::: will loose trigger threshold", v4, 2u);
  }
  -[VTPhraseSpotter _setSecondChance](self, "_setSecondChance");
}

- (void)clearTriggerCount
{
  self->_triggerCount = 0;
}

- (void)_setDeviceHandHeld
{
  double v3;

  self->_deviceHandheld = 1;
  +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
  self->_handHeldDetectedTime = v3;
}

- (void)_clearDeviceHandHeld
{
  self->_deviceHandheld = 0;
}

- (BOOL)_isDeviceHandheld
{
  double v3;
  double handHeldDetectedTime;
  double v5;
  BOOL result;

  if (!self->_deviceHandheld)
    return 0;
  +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
  if (v3 <= 0.0)
    return 0;
  handHeldDetectedTime = self->_handHeldDetectedTime;
  if (handHeldDetectedTime <= 0.0)
    return 0;
  v5 = v3 - handHeldDetectedTime;
  if (v5 > 0.0 && v5 < 8.0)
    return 1;
  result = 0;
  self->_deviceHandheld = 0;
  return result;
}

- (void)_resetVoiceTriggerDueToRTSTrigger
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "RTSTriggered. Resetting VoiceTrigger", v4, 2u);
  }
  -[VTPhraseSpotter _commonInit](self, "_commonInit");
  self->_isSecondPass = 0;
  self->_secondPassResetTimer = 0;
  *(_WORD *)&self->_didWakeAP = 0;
  self->_earlyDetecFiredMachTime = 0;
  self->_triggerFireMachTime = 0;
  self->_triggerStartMachTime = 0;
  self->_firstPassScore = -1000.0;
  -[VTCorruptDetector reset](self->_corruptDetector, "reset");
}

- (id)analyze:(AudioBuffer)a3
{
  void *mData;
  unint64_t v4;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  VTAudioFileReader *audioFileReader;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *ndetectQueue;
  int *v19;
  NSObject *v20;
  int v21;
  int v22;
  VTTranscriber *transcriber;
  id v24;
  VTTranscriber *v25;
  id v26;
  uint64_t v27;
  dispatch_time_t v28;
  NSObject *v29;
  unsigned int samplecount;
  id v31;
  int secondPassResetTimer;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v41;
  double secondPassBestScore;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  float recognizerWaitTime;
  int v50;
  int nearMissLogPreDelayTimer;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD block[7];
  int v55;
  int v56;
  void *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  const __CFString *v62;
  uint64_t v63;
  _BYTE v64[14];
  uint8_t buf[8];
  uint8_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;

  mData = a3.mData;
  v4 = *(_QWORD *)&a3.mNumberChannels;
  v69 = *MEMORY[0x24BDAC8D0];
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v6 = *(_QWORD *)&a3.mNumberChannels >> 33;
  v7 = analyze__audioSampleHeartBeat;
  if ((-286331153 * analyze__audioSampleHeartBeat + 143165576) <= 0x11111110)
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)&buf[4] = v6;
      LOWORD(v66) = 1026;
      *(_DWORD *)((char *)&v66 + 2) = v7;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "::: Received %{public}d samples, heartbeat : %{public}d", buf, 0xEu);
    }
    v8 = 1;
  }
  else
  {
    v8 = analyze__audioSampleHeartBeat + 1;
  }
  analyze__audioSampleHeartBeat = v8;
  audioFileReader = self->_audioFileReader;
  if (audioFileReader)
  {
    v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "::: Reading %d samples from file", buf, 8u);
      audioFileReader = self->_audioFileReader;
    }
    -[VTAudioFileReader readSamples:](audioFileReader, "readSamples:", v6);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    mData = (void *)objc_msgSend(v12, "bytes");
    LODWORD(v6) = objc_msgSend(v12, "length");

    if (!self->_isSecondPass)
    {
LABEL_18:
      if (self->_audioCaptureRequested)
      {
        +[VTAudioFileLog sharedInstance](VTAudioFileLog, "sharedInstance");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "appendAudioData:", v4 | ((unint64_t)v6 << 32), mData);

      }
      mach_absolute_time();
      kdebug_trace();
      *(_QWORD *)buf = 0;
      v66 = buf;
      v67 = 0x2020000000;
      v68 = 0;
      v17 = MEMORY[0x24BDAC760];
      ndetectQueue = self->_ndetectQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __27__VTPhraseSpotter_analyze___block_invoke;
      block[3] = &unk_24C7F4D28;
      v55 = v4;
      v56 = v6;
      v57 = mData;
      block[4] = self;
      block[5] = &v58;
      block[6] = buf;
      dispatch_sync(ndetectQueue, block);
      if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
      {
        if (self->_useRecognizer)
        {
          v19 = (int *)v59[3];
          if (v19)
          {
            if (*((_BYTE *)v19 + 21) && !self->_isRunningRecognizer)
            {
              v20 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                v22 = *v19;
                v21 = v19[1];
                *(_DWORD *)v64 = 67240448;
                *(_DWORD *)&v64[4] = v21;
                *(_WORD *)&v64[8] = 1026;
                *(_DWORD *)&v64[10] = v22;
                _os_log_impl(&dword_20D965000, v20, OS_LOG_TYPE_DEFAULT, "Let's start running recognizer from trigger_start: %{public}d samples_fed %{public}d", v64, 0xEu);
                v20 = VTLogContextFacilityVoiceTrigger;
              }
              self->_isSecondPass = 1;
              self->_secondPassTriggered = 0;
              self->_secondPassAccepted = 0;
              self->_secondPassBestScore = -INFINITY;
              self->_isRunningRecognizer = 1;
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v64 = 134349056;
                *(_QWORD *)&v64[4] = 0x3FF0000000000000;
                _os_log_impl(&dword_20D965000, v20, OS_LOG_TYPE_DEFAULT, "Set to wait up to samples of %{public}.2f seconds for the first recognition results to come back", v64, 0xCu);
              }
              self->_secondPassResetTimer = 16000;
              self->_nearMissLogPreDelayTimer = 24000;
              if (!self->_nearMissLogPending)
                self->_nearMissLogPending = 1;
              self->_firstRecognitionResultReceived = 0;
              -[VTTranscriber reset](self->_transcriber, "reset");
              transcriber = self->_transcriber;
              v53[0] = v17;
              v53[1] = 3221225472;
              v53[2] = __27__VTPhraseSpotter_analyze___block_invoke_339;
              v53[3] = &unk_24C7F4C20;
              v53[4] = self;
              -[VTTranscriber runRecognitionWithCallback:](transcriber, "runRecognitionWithCallback:", v53);
              *(_QWORD *)v64 = 0;
              v24 = -[VTAudioCircularBuffer copySamplesFrom:to:withNumSamplesCopiedIn:](self->_audioBuffer, "copySamplesFrom:to:withNumSamplesCopiedIn:", -[VTAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount")- -[VTPhraseSpotter _sampleLengthFrom:To:](self, "_sampleLengthFrom:To:", *(unsigned int *)(v59[3] + 4), *(unsigned int *)v59[3]), -[VTAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount"), v64);
              v25 = self->_transcriber;
              v26 = objc_retainAutorelease(v24);
              v27 = objc_msgSend(v26, "bytes");
              -[VTTranscriber recognizeWavData:length:](v25, "recognizeWavData:length:", v27, *(unsigned int *)v64);
              self->_isRecognitionResultPending = 1;
              v28 = dispatch_time(0, 500000000);
              v29 = self->_ndetectQueue;
              v52[0] = v17;
              v52[1] = 3221225472;
              v52[2] = __27__VTPhraseSpotter_analyze___block_invoke_340;
              v52[3] = &unk_24C7F4C20;
              v52[4] = self;
              dispatch_after(v28, v29, v52);

            }
          }
        }
      }
      if (v66[24])
      {
        samplecount = self->_samplecount;
        self->_samplecountAtLastTriggerStart = samplecount;
        self->_samplecountAtLastTriggerEnd = samplecount;
        v62 = CFSTR("isTriggerEvent");
        v63 = MEMORY[0x24BDBD1C8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        self->_lastTriggerType = 3;
LABEL_65:

        _Block_object_dispose(buf, 8);
        goto LABEL_66;
      }
      if (v59[3])
      {
        -[VTPhraseSpotter _analyzeEvents:](self, "_analyzeEvents:");
        v31 = (id)objc_claimAutoreleasedReturnValue();
        if (!self->_isSecondPass)
        {
LABEL_59:
          if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman")
            && self->_useRecognizer
            && self->_isSecondPass
            && self->_secondPassTriggered)
          {
            self->_isSecondPass = 0;
            self->_secondPassTriggered = 0;
            self->_secondPassAccepted = 0;
            self->_secondPassBestScore = -INFINITY;
            *(_WORD *)&self->_isRunningRecognizer = 0;
          }
          v31 = v31;
          v14 = v31;
          goto LABEL_65;
        }
      }
      else
      {
        v31 = 0;
        if (!self->_isSecondPass)
          goto LABEL_59;
      }
      if (!self->_secondPassTriggered)
      {
        secondPassResetTimer = self->_secondPassResetTimer;
        if (secondPassResetTimer < 0)
        {
          v33 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v64 = 67240192;
            *(_DWORD *)&v64[4] = secondPassResetTimer;
            _os_log_impl(&dword_20D965000, v33, OS_LOG_TYPE_DEFAULT, "secondPassResetTimerFired: %{public}d", v64, 8u);
          }
          -[VTTextDependentSpeakerRecognizer endAudio](self->_satDetectionTdSr, "endAudio");
          if (self->_isRunningRecognizer)
          {
            if (self->_isRecognitionResultPending)
            {
              if (!self->_firstRecognitionResultReceived)
              {
                +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "logRecognizerTimedOut");

                if (self->_useFallbackThresholdUponTimeout)
                {
                  self->_isRunningRecognizer = 0;
                  self->_isMaximized = 0;
                  v35 = VTLogContextFacilityVoiceTrigger;
                  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)v64 = 0;
                    _os_log_impl(&dword_20D965000, v35, OS_LOG_TYPE_DEFAULT, "We are falling back to normal threshold due to recognizer timeout", v64, 2u);
                  }
                }
              }
            }
            else
            {
              v36 = VTLogContextFacilityVoiceTrigger;
              if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v64 = 0;
                _os_log_impl(&dword_20D965000, v36, OS_LOG_TYPE_DEFAULT, "Stopping audio feed to recognizer per second pass stop timer", v64, 2u);
              }
              -[VTTranscriber endAudio](self->_transcriber, "endAudio");
              if (!self->_firstRecognitionResultReceived)
              {
                self->_isRecognitionResultPending = 1;
                v48 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                {
                  recognizerWaitTime = self->_recognizerWaitTime;
                  *(_DWORD *)v64 = 134349056;
                  *(double *)&v64[4] = recognizerWaitTime;
                  _os_log_impl(&dword_20D965000, v48, OS_LOG_TYPE_DEFAULT, "Set to wait up to samples of %{public}.2f seconds for the first recognition results to come back", v64, 0xCu);
                }
                v50 = (int)(self->_recognizerWaitTime * 16000.0);
                self->_secondPassResetTimer = v50;
                nearMissLogPreDelayTimer = self->_nearMissLogPreDelayTimer;
                v14 = 0;
                if ((nearMissLogPreDelayTimer & 0x80000000) == 0)
                  self->_nearMissLogPreDelayTimer = nearMissLogPreDelayTimer + v50;
                goto LABEL_65;
              }
            }
          }
          if (self->_isMaximized || (v38 = v59[3]) == 0)
          {
            v37 = v31;
          }
          else
          {
            v39 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v64 = 0;
              _os_log_impl(&dword_20D965000, v39, OS_LOG_TYPE_DEFAULT, "Checking one more time if we are triggered by enforcing maximization", v64, 2u);
              v38 = v59[3];
            }
            -[VTPhraseSpotter _analyzeEvents:](self, "_analyzeEvents:", v38);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

          }
          if (!self->_secondPassTriggered)
          {
            v41 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              secondPassBestScore = self->_secondPassBestScore;
              *(_DWORD *)v64 = 134349056;
              *(double *)&v64[4] = secondPassBestScore;
              _os_log_impl(&dword_20D965000, v41, OS_LOG_TYPE_DEFAULT, "We didn't trigger with 2nd-pass score at most up to: %{public}.3f", v64, 0xCu);
            }
            +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "logSecondPassResult:", self->_secondPassAccepted);

            +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "logFalseWakeUp:", self->_didWakeAP);

            if (self->_secondPassAudioLoggingEnabled)
            {
              +[VTAudioFileLog sharedInstance](VTAudioFileLog, "sharedInstance");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "stopRecording");

            }
            if (self->_secondPassAccepted
              || self->_nearMissLogPreDelayTimer < 0
              || !v59[3]
              || self->_lastScore < self->_thresholdLogNearMisses)
            {
              v31 = v37;
            }
            else
            {
              -[VTPhraseSpotter _computeSATScore:](self, "_computeSATScore:");
              -[VTPhraseSpotter _analyzeMakeResult:eventKind:satScore:](self, "_analyzeMakeResult:eventKind:satScore:", v59[3], 2);
              v31 = (id)objc_claimAutoreleasedReturnValue();

              if (+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
              {
                v47 = VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v64 = 0;
                  _os_log_impl(&dword_20D965000, v47, OS_LOG_TYPE_DEFAULT, "Sending near trigger notification...", v64, 2u);
                }
                notify_post("com.apple.voicetrigger.NearTrigger");
              }
              -[VTPhraseSpotter _logMetaData:](self, "_logMetaData:", v31);
              -[VTPhraseSpotter _logDESRecord:result:](self, "_logDESRecord:result:", v59[3], v31);
              -[VTPhraseSpotter _analyzeResetWithOption:](self, "_analyzeResetWithOption:", 0);
            }
            if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman") && self->_useRecognizer)
            {
              -[VTPhraseSpotter _analyzeResetWithOption:](self, "_analyzeResetWithOption:", 0);
              v14 = 0;
              self->_isSecondPass = 0;
              self->_secondPassTriggered = 0;
              self->_secondPassAccepted = 0;
              self->_secondPassBestScore = -INFINITY;
              *(_WORD *)&self->_isRunningRecognizer = 0;
            }
            else
            {
              if (-[VTCorruptDetector audioHasZeroRun](self->_corruptDetector, "audioHasZeroRun"))
              {
                -[VTPhraseSpotter _logCorruptAudio](self, "_logCorruptAudio");
                +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "logZeroRunAudio:", -[VTCorruptDetector getMaxZeroSampleCount](self->_corruptDetector, "getMaxZeroSampleCount"));

              }
              self->_secondPassStopSent = 1;
              v14 = &unk_24C803128;
            }
            goto LABEL_65;
          }
          v31 = v37;
        }
      }
      goto LABEL_59;
    }
  }
  else
  {
    v6 = HIDWORD(v4);
    if (!self->_isSecondPass)
      goto LABEL_18;
  }
  if (!self->_secondPassStopSent)
  {
    if (self->_secondPassAudioLoggingEnabled)
    {
      +[VTAudioFileLog sharedInstance](VTAudioFileLog, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendAudioData:", v4 | ((unint64_t)v6 << 32), mData);

    }
    goto LABEL_18;
  }
  v13 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v13, OS_LOG_TYPE_DEFAULT, "We already returned secondPassStop = 1, returning again to ensure stopping", buf, 2u);
  }
  v14 = &unk_24C803100;
LABEL_66:
  _Block_object_dispose(&v58, 8);
  return v14;
}

- (id)analyzeBufferList:(AudioBufferList *)a3
{
  void *v5;
  unint64_t mDataByteSize;
  id v7;
  uint64_t v8;
  unint64_t numChannels;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  void *v15;
  NSObject *v16;
  OSStatus v17;
  OSStatus v18;
  NSObject *v19;
  _DWORD v21[2];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x212BACE10](self, a2);
  if (!a3)
  {
    v16 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21[0]) = 0;
      _os_log_error_impl(&dword_20D965000, v16, OS_LOG_TYPE_ERROR, "Received NULL bufferList", (uint8_t *)v21, 2u);
    }
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman") && self->_numChannels >= 2)
  {
    mDataByteSize = (int)a3->mBuffers[0].mDataByteSize;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", mDataByteSize);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "mutableBytes");
    numChannels = self->_numChannels;
    v10 = mDataByteSize / numChannels;
    v11 = 0;
    v12 = 0;
    v13 = (int)(mDataByteSize / numChannels);
    do
    {
      v14 = (char *)self->_deinterleavedABL + v11;
      *((_DWORD *)v14 + 2) = 1;
      *((_DWORD *)v14 + 3) = v10;
      *((_QWORD *)v14 + 2) = v8 + v12 * (int)v10;
      ++v12;
      v11 += 16;
      --numChannels;
    }
    while (numChannels);
    v17 = AudioConverterConvertComplexBuffer(self->_deinterleaver, v13 >> 1, a3, self->_deinterleavedABL);
    if (!v17)
    {
      -[VTPhraseSpotter analyze:](self, "analyze:", *(_QWORD *)&self->_deinterleavedABL->mBuffers[0].mNumberChannels, self->_deinterleavedABL->mBuffers[0].mData);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    v18 = v17;
    v19 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 67240192;
      v21[1] = v18;
      _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "Failed to deinterleave data: %{public}d", (uint8_t *)v21, 8u);
    }

    goto LABEL_14;
  }
  -[VTPhraseSpotter analyze:](self, "analyze:", *(_QWORD *)&a3->mBuffers[0].mNumberChannels, a3->mBuffers[0].mData);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  objc_autoreleasePoolPop(v5);
  return v15;
}

- (id)_handleTriggerEvent:(const _ndresult *)a3 num_new_samples:(unsigned int)a4 satScore:(double)a5
{
  void *v8;
  NSObject *v9;
  double var4;
  unsigned int var1;
  unsigned int var2;
  unint64_t samplecountAtLastTriggerEnd;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSString *v30;
  NSString *lastImplicitlyTrainedAudioFile;
  uint8_t v32[16];
  _BYTE buf[12];
  __int16 v34;
  _WORD v35[9];

  *(_QWORD *)&v35[5] = *MEMORY[0x24BDAC8D0];
  -[VTPhraseSpotter _analyzeMakeResult:eventKind:satScore:](self, "_analyzeMakeResult:eventKind:satScore:", a3, 0, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_numFramesFromPreTrigger += a4;
  if (!self->_isMaximized)
    return v8;
  kdebug_trace();
  ++self->_triggerCount;
  self->_lastTriggerType = 1;
  if (self->_isSecondChanceEffective)
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      var4 = a3->var4;
      var1 = a3->var1;
      var2 = a3->var2;
      *(_DWORD *)buf = 134349568;
      *(double *)&buf[4] = var4;
      v34 = 1026;
      *(_DWORD *)v35 = var1;
      v35[2] = 1026;
      *(_DWORD *)&v35[3] = var2;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "::: Detected a second chance trigger - 2nd of 2 [score: %{public}5.3f] start: %{public}d end: %{public}d", buf, 0x18u);
    }
    self->_lastTriggerType = 2;
  }
  -[VTPhraseSpotter _cancelSecondChance](self, "_cancelSecondChance");
  if (self->_audioBuffer)
  {
    samplecountAtLastTriggerEnd = self->_samplecountAtLastTriggerEnd;
    if (+[VTSiriPHash sampleSizeForSignalEstimate](VTSiriPHash, "sampleSizeForSignalEstimate") <= samplecountAtLastTriggerEnd)
    {
      v15 = self->_samplecountAtLastTriggerEnd;
      v14 = v15
          - +[VTSiriPHash sampleSizeForSignalEstimate](VTSiriPHash, "sampleSizeForSignalEstimate");
    }
    else
    {
      v14 = 0;
    }
    v16 = -[VTPhraseSpotter _sampleLengthFrom:To:](self, "_sampleLengthFrom:To:", v14, self->_samplecount);
    v17 = -[VTAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount") - v16;
    v18 = -[VTAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount");
    v19 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349312;
      *(_QWORD *)&buf[4] = v17;
      v34 = 2050;
      *(_QWORD *)v35 = v18;
      _os_log_impl(&dword_20D965000, v19, OS_LOG_TYPE_DEFAULT, "BTLE broadcastAudioPayload ringBuffer startpoint: %{public}llu to: %{public}llu", buf, 0x16u);
    }
    *(_QWORD *)buf = 0;
    v20 = -[VTAudioCircularBuffer copySamplesFrom:to:withNumSamplesCopiedIn:](self->_audioBuffer, "copySamplesFrom:to:withNumSamplesCopiedIn:", v17, v18, buf);
    if (*(_QWORD *)buf)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndMachTime"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("triggerEndMachTime"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "unsignedLongLongValue");

        -[VTSiriNotifications broadcastAudioPayload:numSamples:superVectorScore:absoluteTime:](self->siriNotifications, "broadcastAudioPayload:numSamples:superVectorScore:absoluteTime:", v20, *(_QWORD *)buf, v23, self->_lastSupervecScore);
LABEL_18:

        goto LABEL_19;
      }
      v24 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)v32 = 0;
      v25 = "BTLE trigger end mach time is not available";
    }
    else
    {
      v24 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)v32 = 0;
      v25 = "BTLE ring buffer returns 0 length buffer";
    }
    _os_log_error_impl(&dword_20D965000, v24, OS_LOG_TYPE_ERROR, v25, v32, 2u);
    goto LABEL_18;
  }
LABEL_19:
  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator", *(_QWORD *)v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logActivation");

  -[VTPhraseSpotter _logMetaData:](self, "_logMetaData:", v8);
  -[VTPhraseSpotter _logDESTriggerRecord:result:](self, "_logDESTriggerRecord:result:", a3, v8);
  -[VTPhraseSpotter _analyzeResetWithOption:](self, "_analyzeResetWithOption:", 0);
  self->_lastEventEnd = a3->var2;
  if (self->_isRunningSATEnrollment)
  {
    v27 = -[VTPhraseSpotter _storeTrainingAudioAndMetaInfo](self, "_storeTrainingAudioAndMetaInfo");
  }
  else if (self->_isRunningSATDetection && self->_implicitlyTrained)
  {
    -[VTPhraseSpotter _storeTrainingAudioAndMetaInfo](self, "_storeTrainingAudioAndMetaInfo");
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    lastImplicitlyTrainedAudioFile = self->_lastImplicitlyTrainedAudioFile;
    self->_lastImplicitlyTrainedAudioFile = v30;

    notify_post("com.apple.voicetrigger.PHSProfileModified");
  }
  if (!+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman") && self->_isRunningRecognizer)
  {
    v28 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "Stopping audio feed to recognizer per trigger event", buf, 2u);
    }
    -[VTTranscriber endAudio](self->_transcriber, "endAudio");
  }
  return v8;
}

- (unint64_t)_sampleLengthFrom:(unsigned int)a3 To:(unsigned int)a4
{
  unsigned int v4;

  v4 = -a3;
  if (a3 > a4)
    v4 = ~a3;
  return v4 + a4;
}

- (id)_storeTrainingAudioAndMetaInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  VTAudioCircularBuffer *audioBuffer;
  unint64_t v10;
  unint64_t v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(".wav"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_audioBuffer)
  {
    +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 1, self->_languageCode);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[VTPhraseSpotter _sampleLengthFrom:To:](self, "_sampleLengthFrom:To:", self->_samplecountAtLastTriggerStart, self->_samplecount);
    audioBuffer = self->_audioBuffer;
    v10 = -[VTAudioCircularBuffer sampleCount](audioBuffer, "sampleCount") - v8;
    v11 = -[VTAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount");
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTAudioCircularBuffer saveRecordingBufferFrom:to:toURL:](audioBuffer, "saveRecordingBufferFrom:to:toURL:", v10, v11, v12);

    +[VTUtteranceMetadataManager saveUtteranceMetadataForUtterance:isExplicitEnrollment:isHandheldEnrollment:withBiometricResult:](VTUtteranceMetadataManager, "saveUtteranceMetadataForUtterance:isExplicitEnrollment:isHandheldEnrollment:withBiometricResult:", v7, self->_isRunningSATEnrollment, -[VTPhraseSpotter _isDeviceHandheld](self, "_isDeviceHandheld"), -[VTPhraseSpotter _getBiometricMatchResult](self, "_getBiometricMatchResult"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_getBiometricMatchResult
{
  uint64_t v3;
  double v4;
  double v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint8_t buf[4];
  double v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v12 = 0;
  v3 = mach_continuous_time();
  if (-[VTBiometricMatchMonitor getLastBiometricMatchEvent:atTime:](self->_biometricMonitor, "getLastBiometricMatchEvent:atTime:", &v13, &v12))
  {
    +[VTUtilities VTMachAbsoluteTimeGetTimeInterval:](VTUtilities, "VTMachAbsoluteTimeGetTimeInterval:", v3 - v12);
    v5 = v4;
    v6 = v13;
    v7 = VTLogContextFacilityVoiceTrigger;
    v8 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v6 && v5 < 3.0)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134349056;
        v15 = v5;
        _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Biometric match happened in last %{public}f secs", buf, 0xCu);
      }
      return 1;
    }
    else
    {
      if (v8)
      {
        v11 = CFSTR("MATCH");
        if (!v6)
          v11 = CFSTR("MIS-MATCH");
        *(_DWORD *)buf = 138543618;
        v15 = *(double *)&v11;
        v16 = 2050;
        v17 = v5;
        _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "Biometric match result: %{public}@ happened in last %{public}f secs", buf, 0x16u);
        v6 = v13;
      }
      if (v6)
        return 3;
      else
        return 2;
    }
  }
  else
  {
    v10 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "No biometric information available", buf, 2u);
    }
    return 0;
  }
}

- (void)_setSecondChance
{
  NSObject *ndetectQueue;
  _QWORD block[5];

  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__VTPhraseSpotter__setSecondChance__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

- (void)_cancelSecondChance
{
  NSObject *ndetectQueue;
  _QWORD block[5];

  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__VTPhraseSpotter__cancelSecondChance__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

- (BOOL)_getSecondChanceEffective
{
  NSObject *ndetectQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ndetectQueue = self->_ndetectQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__VTPhraseSpotter__getSecondChanceEffective__block_invoke;
  v5[3] = &unk_24C7F4D00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(ndetectQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_storeFirstChanceAudio
{
  NSObject *ndetectQueue;
  _QWORD block[5];

  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__VTPhraseSpotter__storeFirstChanceAudio__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

- (void)_createFirstChanceMeta:(const _ndresult *)a3
{
  NSDate *v5;
  NSDate *firstChanceTriggeredDate;
  double v7;
  double v8;
  unsigned int var1;
  float samplerate;
  double v11;
  double v12;
  unsigned int extraSamplesAtStart;
  uint64_t v14;
  NSArray *triggerPhrases;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const __CFString *configVersion;
  const __CFString *languageCode;
  void *v29;
  void *v30;
  NSObject *v31;
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
  void *v42;
  uint8_t buf[4];
  void *v44;
  _QWORD v45[20];
  _QWORD v46[22];

  v46[20] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    firstChanceTriggeredDate = self->_firstChanceTriggeredDate;
    self->_firstChanceTriggeredDate = v5;

    +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
    v8 = v7;
    var1 = a3->var1;
    samplerate = (float)self->_samplerate;
    v11 = v7 - (float)((float)(a3->var0 - var1) / samplerate);
    v12 = v7 - (float)((float)(a3->var0 - a3->var2) / samplerate);
    extraSamplesAtStart = self->_extraSamplesAtStart;
    if (extraSamplesAtStart >= var1)
      v14 = var1;
    else
      v14 = extraSamplesAtStart;
    triggerPhrases = self->_triggerPhrases;
    if (!triggerPhrases)
      triggerPhrases = (NSArray *)MEMORY[0x24BDBD1A8];
    v46[0] = triggerPhrases;
    v45[0] = CFSTR("triggerPhrases");
    v45[1] = CFSTR("triggerScore");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastScore);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v42;
    v45[2] = CFSTR("earlyDetectFiredTime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_earlyDetectTime);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v46[2] = v41;
    v45[3] = CFSTR("triggerStartTime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v46[3] = v40;
    v45[4] = CFSTR("triggerEndTime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v46[4] = v39;
    v45[5] = CFSTR("triggerFiredTime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v46[5] = v38;
    v45[6] = CFSTR("numFramesFromPreTrigger");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_numFramesFromPreTrigger);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v46[6] = v37;
    v45[7] = CFSTR("isMaximized");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMaximized);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v46[7] = v36;
    v45[8] = CFSTR("extraSamplesAtStart");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v14);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v46[8] = v35;
    v45[9] = CFSTR("isSecondChance");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSecondChanceEffective);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v46[9] = v34;
    v45[10] = CFSTR("threshold");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_threshold);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v46[10] = v33;
    v45[11] = CFSTR("effectiveThreshold");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_effectiveThreshold);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46[11] = v32;
    v45[12] = CFSTR("hardwareSamplerate");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hardwareSampleRate);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v46[12] = v16;
    v45[13] = CFSTR("uptime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastUptime);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[13] = v17;
    v45[14] = CFSTR("downtime");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastDowntime);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46[14] = v18;
    v45[15] = CFSTR("didWakeAP");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didWakeAP);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46[15] = v19;
    v45[16] = CFSTR("onBatteryPower");
    v20 = (void *)MEMORY[0x24BDD16E0];
    +[VTBatteryMonitor sharedInstance](VTBatteryMonitor, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "numberWithInt:", objc_msgSend(v21, "batteryState") == 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46[16] = v22;
    v45[17] = CFSTR("siriIsActiveOrOtherAssertion");
    v23 = (void *)MEMORY[0x24BDD16E0];
    +[VTSiriAssertionMonitor sharedInstance](VTSiriAssertionMonitor, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithBool:", objc_msgSend(v24, "isEnabled"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    configVersion = (const __CFString *)self->_configVersion;
    if (!configVersion)
      configVersion = CFSTR("n/a");
    v46[17] = v25;
    v46[18] = configVersion;
    v45[18] = CFSTR("configVersion");
    v45[19] = CFSTR("languageCode");
    languageCode = (const __CFString *)self->_languageCode;
    if (!languageCode)
      languageCode = CFSTR("n/a");
    v46[19] = languageCode;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v46, v45, 20);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&self->_firstChanceVTEventInfo, v29);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), self->_firstChanceVTEventInfo);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v30;
      _os_log_impl(&dword_20D965000, v31, OS_LOG_TYPE_DEFAULT, "First Chance Meta : %{public}@", buf, 0xCu);
    }

  }
}

- (id)_analyzeEvents:(const _ndresult *)a3
{
  unsigned int samplecount;
  unsigned int var0;
  uint64_t v7;
  unsigned int lastEventEnd;
  int nearMissLogPreDelayTimer;
  int v10;
  NSObject *v11;
  VTPhraseSpotter *v12;
  uint64_t v13;
  void *v14;
  float var4;
  double v17;
  double v18;
  double secondPassBestScore;
  int heartbeatCounter;
  unint64_t v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int var1;
  unsigned int sampleCountAtFirstChance;
  double threshold;
  double *p_effectiveThreshold;
  _BOOL4 v28;
  _BOOL4 doSuperVectorSecondaryTest;
  uint64_t v30;
  double thresholdLogNearMisses;
  NSObject *v32;
  unsigned int v33;
  unsigned int v34;
  int v35;
  NSObject *v36;
  const _ndsupervec *v37;
  NSObject *v38;
  const __CFString *v39;
  NSObject *v40;
  double v41;
  void *v42;
  int v43;
  NSObject *v44;
  const _ndsvscore *v45;
  double v46;
  NSObject *v47;
  NSObject *v48;
  unsigned int v49;
  unsigned int var2;
  int v51;
  NSString *lastImplicitlyTrainedAudioFile;
  double v53;
  double thresholdSAT;
  const _ndsvscore *v55;
  VTTextDependentSpeakerRecognizer *satDetectionTdSr;
  void *v57;
  dispatch_time_t v58;
  intptr_t v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  VTTextDependentSpeakerRecognizer *v64;
  NSObject *v65;
  double tdSpeakerRecognizerCombinationWeight;
  double tdSpeakerRecognizerSATThreshold;
  float v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  BOOL v72;
  double v73;
  NSObject *v74;
  NSObject *ndetectQueue;
  NSObject *v76;
  NSObject *v77;
  int v78;
  void *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  char v83;
  NSObject *v84;
  float v85;
  double v86;
  float v87;
  _QWORD v88[6];
  uint8_t buf[4];
  _BYTE v90[20];
  double v91;
  __int16 v92;
  double v93;
  __int16 v94;
  double v95;
  __int16 v96;
  double v97;
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    goto LABEL_13;
  samplecount = self->_samplecount;
  var0 = a3->var0;
  self->_samplecount = a3->var0;
  v7 = var0 - samplecount;
  if (var0 >= samplecount)
  {
    lastEventEnd = self->_lastEventEnd;
  }
  else
  {
    lastEventEnd = 0;
    self->_lastEventEnd = 0;
    self->_sampleCountAtFirstChance = 0;
  }
  nearMissLogPreDelayTimer = self->_nearMissLogPreDelayTimer;
  if (nearMissLogPreDelayTimer >= 0)
    v10 = v7;
  else
    v10 = 0;
  self->_nearMissLogPreDelayTimer = nearMissLogPreDelayTimer - v10;
  if (a3->var1 < lastEventEnd)
  {
    v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "::: Not a new event. Must reset scores", buf, 2u);
    }
    v12 = self;
    v13 = 1;
LABEL_12:
    -[VTPhraseSpotter _analyzeResetWithOption:](v12, "_analyzeResetWithOption:", v13);
LABEL_13:
    v14 = 0;
    return v14;
  }
  var4 = a3->var4;
  if (self->_isRunningRecognizer)
  {
    -[VTTranscriber triggerConfidence](self->_transcriber, "triggerConfidence");
    self->_recognizerScore = v17;
    var4 = var4 + v17 * self->_recognizerScoreScaleFactor;
  }
  v18 = var4;
  self->_isMaximized = self->_lastScore >= v18;
  self->_lastScore = v18;
  if (self->_isSecondPass)
  {
    secondPassBestScore = self->_secondPassBestScore;
    if (secondPassBestScore < v18)
      secondPassBestScore = v18;
    self->_secondPassBestScore = secondPassBestScore;
  }
  heartbeatCounter = self->_heartbeatCounter;
  self->_heartbeatCounter = heartbeatCounter + 1;
  HIDWORD(v21) = -286331153 * heartbeatCounter + 143165576;
  LODWORD(v21) = HIDWORD(v21);
  if ((v21 >> 1) <= 0x8888888)
  {
    v22 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      v23 = self->_samplecount;
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)v90 = v23;
      *(_WORD *)&v90[4] = 2050;
      *(double *)&v90[6] = v18;
      _os_log_impl(&dword_20D965000, v22, OS_LOG_TYPE_INFO, "::: heartbeat: %{public}u score: %{public}f", buf, 0x12u);
    }
  }
  if (!self->_isRunningSATEnrollment && a3->var5 && !self->_earlyDetected)
  {
    self->_earlyDetected = 1;
    v40 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v40, OS_LOG_TYPE_DEFAULT, "::: Early detect.  Send a notification to preheat.", buf, 2u);
    }
    kdebug_trace();
    +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
    self->_earlyDetectTime = v41;
    self->_earlyDetecFiredMachTime = mach_absolute_time();
    +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "useSiriActivationSPIForiOS");

    if (v43)
    {
      AFSiriActivationBuiltInMicVoiceTriggerPrewarm();
    }
    else
    {
      notify_post("com.apple.voicetrigger.EarlyDetect");
      v76 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v76, OS_LOG_TYPE_DEFAULT, "Use legacy notification", buf, 2u);
      }
    }
  }
  var1 = a3->var1;
  sampleCountAtFirstChance = self->_sampleCountAtFirstChance;
  self->_isSecondChanceEffective = 0;
  if (var1 >= sampleCountAtFirstChance)
  {
    v28 = -[VTPhraseSpotter _getSecondChanceEffective](self, "_getSecondChanceEffective");
    threshold = self->_threshold;
    self->_effectiveThreshold = threshold;
    p_effectiveThreshold = &self->_effectiveThreshold;
    self->_isSecondChanceEffective = v28;
    if (v28)
    {
      if (threshold >= self->_thresholdSecondChance)
        threshold = self->_thresholdSecondChance;
      self->_effectiveThreshold = threshold;
    }
  }
  else
  {
    threshold = self->_threshold;
    self->_effectiveThreshold = threshold;
    p_effectiveThreshold = &self->_effectiveThreshold;
  }
  if (self->_isRunningRecognizer)
    self->_effectiveThreshold = self->_recognizerThresholdOffset + threshold;
  doSuperVectorSecondaryTest = self->_doSuperVectorSecondaryTest;
  v30 = 128;
  if (self->_doSuperVectorSecondaryTest)
    v30 = 336;
  if (*(double *)((char *)&self->super.isa + v30) <= v18)
  {
    if (self->_isSecondPass)
      self->_secondPassAccepted = 1;
    if (self->_isSuperVectorNeeded)
    {
      v37 = -[VTAnalyzerNDAPI getSuperVectorWithEndPoint:](self->_analyzer, "getSuperVectorWithEndPoint:", a3->var2);
      v38 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
      {
        v39 = CFSTR("NO");
        if (v37 && v37->var0)
          v39 = CFSTR("YES");
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v90 = v39;
        _os_log_impl(&dword_20D965000, v38, OS_LOG_TYPE_INFO, "::: getting supervector successful? %{public}@", buf, 0xCu);
      }
      if (!v37 || !v37->var0 || !v37->var1)
      {
        v44 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v44, OS_LOG_TYPE_DEFAULT, "supervector is not available, cannot proceed", buf, 2u);
        }
        v12 = self;
        v13 = 0;
        goto LABEL_12;
      }
      doSuperVectorSecondaryTest = self->_doSuperVectorSecondaryTest;
    }
    else
    {
      v37 = 0;
    }
    if (doSuperVectorSecondaryTest)
    {
      v45 = -[VTAnalyzerNDAPI getScoreSuperVector:size:](self->_analyzer, "getScoreSuperVector:size:", v37->var0, v37->var1);
      if (v45)
      {
        v46 = v45->var0;
        self->_lastSupervecScore = v46;
        v47 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          *(double *)v90 = v46;
          _os_log_impl(&dword_20D965000, v47, OS_LOG_TYPE_DEFAULT, "::: supervector score is computed: %{public}.3f", buf, 0xCu);
        }
        if (*p_effectiveThreshold <= v46)
        {
          v51 = 1;
          goto LABEL_82;
        }
        if (var1 >= sampleCountAtFirstChance && self->_thresholdSecondChance < v46)
        {
          v48 = VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
          {
            v49 = a3->var1;
            var2 = a3->var2;
            *(_DWORD *)buf = 134349568;
            *(double *)v90 = v18;
            *(_WORD *)&v90[8] = 1026;
            *(_DWORD *)&v90[10] = v49;
            *(_WORD *)&v90[14] = 1026;
            *(_DWORD *)&v90[16] = var2;
            _os_log_impl(&dword_20D965000, v48, OS_LOG_TYPE_DEFAULT, "::: Detected a second chance trigger - 1st of 2 [score: %{public}5.3f]  start: %{public}d end: %{public}d", buf, 0x18u);
          }
          self->_sampleCountAtFirstChance = a3->var2;
          -[VTPhraseSpotter _setSecondChance](self, "_setSecondChance");
          -[VTPhraseSpotter _storeFirstChanceAudio](self, "_storeFirstChanceAudio");
          -[VTPhraseSpotter _createFirstChanceMeta:](self, "_createFirstChanceMeta:", a3);
        }
        -[VTPhraseSpotter _analyzeResetWithOption:](self, "_analyzeResetWithOption:", 0);
      }
    }
    v51 = 0;
LABEL_82:
    self->_implicitlyTrained = 0;
    lastImplicitlyTrainedAudioFile = self->_lastImplicitlyTrainedAudioFile;
    self->_lastImplicitlyTrainedAudioFile = 0;

    v53 = 0.0;
    if (!self->_isRunningSATDetection
      || !self->_isMaximized
      || (thresholdSAT = self->_thresholdSAT,
          (v55 = -[VTAnalyzerNDAPI analyzeSAT:size:](self->_analyzer, "analyzeSAT:size:", v37->var0, v37->var1)) == 0))
    {
      v71 = 0;
      v72 = 1;
      if (!self->_isRunningSATEnrollment)
      {
LABEL_108:
        if (self->_doSuperVectorSecondaryTest)
        {
          if (self->_isRunningSATDetection)
            v78 = v51;
          else
            v78 = 1;
          if (!self->_isRunningSATDetection)
            v71 = v51;
          if (v78 != 1)
            goto LABEL_118;
        }
        else if (!self->_isRunningSATDetection)
        {
          if (!self->_isMaximized)
            goto LABEL_118;
          goto LABEL_125;
        }
        if (!v71)
          goto LABEL_118;
LABEL_125:
        self->_triggerFireMachTime = mach_absolute_time();
        -[VTPhraseSpotter _handleTriggerEvent:num_new_samples:satScore:](self, "_handleTriggerEvent:num_new_samples:satScore:", a3, v7, v53);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_isSecondPass && !self->_secondPassTriggered)
        {
          self->_secondPassTriggered = 1;
          +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "logSecondPassResult:", 1);

          if (self->_secondPassAudioLoggingEnabled)
          {
            +[VTAudioFileLog sharedInstance](VTAudioFileLog, "sharedInstance");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "stopRecording");

          }
        }
        goto LABEL_129;
      }
LABEL_93:
      if (!self->_isMaximized)
      {
LABEL_118:
        v79 = 0;
LABEL_129:
        v83 = !self->_isRunningSATDetection || v72;
        if ((v83 & 1) != 0)
        {
          v14 = v79;
        }
        else
        {
          -[VTPhraseSpotter _analyzeMakeResult:eventKind:satScore:](self, "_analyzeMakeResult:eventKind:satScore:", a3, 1, v53);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
          {
            v84 = VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_20D965000, v84, OS_LOG_TYPE_DEFAULT, "Sending PHS reject notification", buf, 2u);
            }
            notify_post("com.apple.voicetrigger.PHSReject");
          }
          -[VTPhraseSpotter _logMetaData:](self, "_logMetaData:", v14);
          -[VTPhraseSpotter _analyzeResetWithOption:](self, "_analyzeResetWithOption:", 0);
          self->_lastEventEnd = a3->var2;
        }
        return v14;
      }
      if (-[VTAnalyzerNDAPI analyzeSAT:size:](self->_analyzer, "analyzeSAT:size:", v37->var0, v37->var1))
        -[VTAnalyzerNDAPI updateSAT](self->_analyzer, "updateSAT");
      goto LABEL_125;
    }
    v53 = v55->var0;
    self->_lastCombinedTdSpeakerRecognizerSATScore = v53;
    if (!self->_isSecondPass
      || (satDetectionTdSr = self->_satDetectionTdSr) == 0
      || !-[VTTextDependentSpeakerRecognizer tdPsrCanProcessRequest](satDetectionTdSr, "tdPsrCanProcessRequest"))
    {
      v59 = 0;
      v73 = v53;
      goto LABEL_97;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = dispatch_time(0, 300000000);
    v59 = dispatch_semaphore_wait((dispatch_semaphore_t)self->_satDetectionTdSrSemaphore, v58);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "timeIntervalSinceDate:", v57);
    v62 = v61 * 1000.0;
    v63 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v64 = self->_satDetectionTdSr;
      v65 = v63;
      -[VTTextDependentSpeakerRecognizer lastRequestSatScore](v64, "lastRequestSatScore");
      tdSpeakerRecognizerCombinationWeight = self->_tdSpeakerRecognizerCombinationWeight;
      tdSpeakerRecognizerSATThreshold = self->_tdSpeakerRecognizerSATThreshold;
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)v90 = v64;
      *(_WORD *)&v90[8] = 2050;
      *(_QWORD *)&v90[10] = v59;
      *(_WORD *)&v90[18] = 2050;
      v91 = v62;
      v92 = 2050;
      v93 = v68;
      v94 = 2050;
      v95 = tdSpeakerRecognizerCombinationWeight;
      v96 = 2050;
      v97 = tdSpeakerRecognizerSATThreshold;
      _os_log_impl(&dword_20D965000, v65, OS_LOG_TYPE_DEFAULT, "TDSR:: SATDetection: Done Waiting with _satDetectionTdSr: %{public}@, psrTDTimedOut=%{public}ld, tdPsrSATDetectionWaitTimeMs: %{public}fms, _lastTdSpeakerRecognizerSATScore=%{public}f, _tdSpeakerRecognizerCombinationWeight=%{public}f, _tdSpeakerRecognizerSATThreshold: %{public}f", buf, 0x3Eu);

    }
    +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (v59)
    {
      objc_msgSend(v69, "logTdPsrSATDetectionTimedOut");

    }
    else
    {
      objc_msgSend(v69, "logTdPsrSATDetectionWaitTimeMs:", v62);

      if (self->_tdSpeakerRecognizerCombinationWeight > 0.0)
      {
        -[VTTextDependentSpeakerRecognizer lastRequestSatScore](self->_satDetectionTdSr, "lastRequestSatScore");
        v73 = v53;
        if (v85 > 0.0)
        {
          v86 = self->_tdSpeakerRecognizerCombinationWeight;
          -[VTTextDependentSpeakerRecognizer lastRequestSatScore](self->_satDetectionTdSr, "lastRequestSatScore");
          v73 = v86 * v87 + (1.0 - v86) * v53;
          self->_lastCombinedTdSpeakerRecognizerSATScore = v73;
          thresholdSAT = self->_tdSpeakerRecognizerSATThreshold;
        }
        goto LABEL_143;
      }
    }
    v73 = v53;
LABEL_143:

LABEL_97:
    v74 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349568;
      *(double *)v90 = v53;
      *(_WORD *)&v90[8] = 2050;
      *(double *)&v90[10] = v73;
      *(_WORD *)&v90[18] = 2050;
      v91 = thresholdSAT;
      _os_log_impl(&dword_20D965000, v74, OS_LOG_TYPE_DEFAULT, ":::[SAT Result] SAT score: %{public}f, combinedScore=%{public}f, vs threshold %{public}f", buf, 0x20u);
    }
    v71 = v73 >= thresholdSAT;
    if (v73 < thresholdSAT)
    {
      v77 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349568;
        *(double *)v90 = v53;
        *(_WORD *)&v90[8] = 2050;
        *(double *)&v90[10] = v73;
        *(_WORD *)&v90[18] = 2050;
        v91 = thresholdSAT;
        _os_log_impl(&dword_20D965000, v77, OS_LOG_TYPE_DEFAULT, ":::[SAT Rejection] SAT rejected (SAT {satScore=[%{public}f], combinedScore=[%{public}f]} < threshold [%{public}f])", buf, 0x20u);
      }
    }
    else
    {
      ndetectQueue = self->_ndetectQueue;
      v88[0] = MEMORY[0x24BDAC760];
      v88[1] = 3221225472;
      v88[2] = __34__VTPhraseSpotter__analyzeEvents___block_invoke_372;
      v88[3] = &unk_24C7F4D70;
      v88[4] = self;
      v88[5] = v59;
      dispatch_sync(ndetectQueue, v88);
    }
    -[VTPhraseSpotter _logPHSDESRecord:](self, "_logPHSDESRecord:", v37);
    v72 = v73 >= thresholdSAT;
    if (!self->_isRunningSATEnrollment)
      goto LABEL_108;
    goto LABEL_93;
  }
  v14 = 0;
  if (!self->_doSuperVectorSecondaryTest && self->_isMaximized)
  {
    thresholdLogNearMisses = self->_thresholdLogNearMisses;
    if (var1 >= sampleCountAtFirstChance && self->_thresholdSecondChance < v18)
    {
      v32 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v33 = a3->var1;
        v34 = a3->var2;
        *(_DWORD *)buf = 134349568;
        *(double *)v90 = v18;
        *(_WORD *)&v90[8] = 1026;
        *(_DWORD *)&v90[10] = v33;
        *(_WORD *)&v90[14] = 1026;
        *(_DWORD *)&v90[16] = v34;
        _os_log_impl(&dword_20D965000, v32, OS_LOG_TYPE_DEFAULT, "::: Detected a second chance trigger - 1st of 2 [score: %{public}5.3f]  start: %{public}d end: %{public}d", buf, 0x18u);
      }
      self->_sampleCountAtFirstChance = a3->var2;
      -[VTPhraseSpotter _setSecondChance](self, "_setSecondChance");
      -[VTPhraseSpotter _storeFirstChanceAudio](self, "_storeFirstChanceAudio");
      -[VTPhraseSpotter _createFirstChanceMeta:](self, "_createFirstChanceMeta:", a3);
    }
    if (thresholdLogNearMisses >= v18)
      goto LABEL_13;
    if (!self->_nearMissLogPending)
    {
      v14 = 0;
      self->_nearMissLogPreDelayTimer = 8000;
      self->_nearMissLogPending = 1;
      return v14;
    }
    v35 = self->_nearMissLogPreDelayTimer;
    if ((v35 & 0x80000000) == 0)
    {
      v36 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67240192;
        *(_DWORD *)v90 = v35;
        _os_log_impl(&dword_20D965000, v36, OS_LOG_TYPE_INFO, "::: will log in %{public}d elapsed samples", buf, 8u);
      }
      goto LABEL_13;
    }
    -[VTPhraseSpotter _computeSATScore:](self, "_computeSATScore:", a3);
    -[VTPhraseSpotter _analyzeMakeResult:eventKind:satScore:](self, "_analyzeMakeResult:eventKind:satScore:", a3, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[VTUtilities isInternalInstall](VTUtilities, "isInternalInstall"))
    {
      v80 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v80, OS_LOG_TYPE_DEFAULT, "Sending near trigger notification", buf, 2u);
      }
      notify_post("com.apple.voicetrigger.NearTrigger");
    }
    -[VTPhraseSpotter _logMetaData:](self, "_logMetaData:", v14);
    -[VTPhraseSpotter _logDESRecord:result:](self, "_logDESRecord:result:", a3, v14);
    -[VTPhraseSpotter _analyzeResetWithOption:](self, "_analyzeResetWithOption:", 1);
  }
  return v14;
}

- (double)_computeSATScore:(const _ndresult *)a3
{
  const _ndsupervec *v4;
  NSObject *v5;
  const __CFString *v6;
  double v7;
  const _ndsvscore *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = -[VTAnalyzerNDAPI getSuperVectorWithEndPoint:](self->_analyzer, "getSuperVectorWithEndPoint:", a3->var2);
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (v4 && v4->var0)
      v6 = CFSTR("YES");
    v10 = 138543362;
    v11 = v6;
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_INFO, "::: getting supervector successful? %{public}@", (uint8_t *)&v10, 0xCu);
  }
  v7 = 0.0;
  if (v4)
  {
    v8 = -[VTAnalyzerNDAPI analyzeSAT:size:](self->_analyzer, "analyzeSAT:size:", v4->var0, v4->var1);
    if (v8)
      return v8->var0;
  }
  return v7;
}

- (void)_analyzeResetWithOption:(unsigned __int8)a3
{
  NSObject *ndetectQueue;
  _QWORD v4[5];
  unsigned __int8 v5;

  ndetectQueue = self->_ndetectQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__VTPhraseSpotter__analyzeResetWithOption___block_invoke;
  v4[3] = &unk_24C7F4D98;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(ndetectQueue, v4);
}

- (id)_analyzeMakeResult:(const _ndresult *)a3 eventKind:(unsigned __int8)a4 satScore:(double)a5
{
  int v6;
  double v9;
  double v10;
  unsigned int var1;
  float samplerate;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  unsigned int extraSamplesAtStart;
  unsigned int v20;
  uint64_t v21;
  BOOL v22;
  unsigned int v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  NSArray *triggerPhrases;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *configVersion;
  const __CFString *languageCode;
  uint64_t v35;
  void *v36;
  const __CFString *configData;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double consecutivePHSRejects;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  VTAudioCircularBuffer *audioBuffer;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  VTTextDependentSpeakerRecognizer *satDetectionTdSr;
  float v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  unint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  unint64_t v81;
  void *v82;
  void *v83;
  void *v85;
  id v86;
  id v87;
  float v88;
  float v89;
  _BOOL4 v90;
  void *v91;
  void *v92;
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
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  int v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  id v118;
  _QWORD v119[29];
  _QWORD v120[31];

  v120[29] = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v16 = 0;
    return v16;
  }
  v6 = a4;
  +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
  v10 = v9;
  var1 = a3->var1;
  samplerate = (float)self->_samplerate;
  v13 = (float)((float)(a3->var0 - var1) / samplerate);
  v14 = (float)((float)(a3->var0 - a3->var2) / samplerate);
  if (self->_audioLoggingEnabled)
  {
    VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_24C7F6FB8, &stru_24C7F6FB8);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTPhraseSpotter _capturePathWithPrefix:eventKind:](self, "_capturePathWithPrefix:eventKind:");
    v15 = objc_claimAutoreleasedReturnValue();
    var1 = a3->var1;
  }
  else
  {
    v15 = 0;
    v116 = 0;
  }
  v17 = v10 - v13;
  v18 = v10 - v14;
  self->_samplecountAtRealTriggerStart = var1;
  extraSamplesAtStart = self->_extraSamplesAtStart;
  v20 = a3->var1;
  if (extraSamplesAtStart >= v20)
    v21 = v20;
  else
    v21 = extraSamplesAtStart;
  v22 = v20 >= extraSamplesAtStart;
  v23 = v20 - extraSamplesAtStart;
  if (!v22)
    v23 = 0;
  self->_samplecountAtLastTriggerStart = v23;
  self->_samplecountAtLastTriggerEnd = a3->var2;
  self->_lastSupervecScore = a5;
  v24 = (double)(self->_samplecount - v23) / 16000.0;
  v115 = (void *)v15;
  if (v6 || self->_numFramesFromPreTrigger)
  {
    v113 = 0;
    v114 = 0;
  }
  else
  {
    +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = 0;
    v118 = 0;
    objc_msgSend(v85, "cumulativeUptime:cumulativeDowntime:reset:", &v118, &v117, 1);
    v86 = v118;
    v87 = v117;

    v114 = v86;
    objc_msgSend(v86, "floatValue");
    self->_lastUptime = v88;
    v113 = v87;
    objc_msgSend(v87, "floatValue");
    self->_lastDowntime = v89;
  }
  v110 = v6;
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 3, self->_languageCode);
  v25 = objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 2, self->_languageCode);
  v26 = objc_claimAutoreleasedReturnValue();
  triggerPhrases = self->_triggerPhrases;
  if (!triggerPhrases)
    triggerPhrases = (NSArray *)MEMORY[0x24BDBD1A8];
  v120[0] = triggerPhrases;
  v119[0] = CFSTR("triggerPhrases");
  v119[1] = CFSTR("triggerScore");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastScore);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v109;
  v119[2] = CFSTR("earlyDetectFiredTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_earlyDetectTime);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v108;
  v119[3] = CFSTR("triggerStartTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v17);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = v107;
  v119[4] = CFSTR("triggerEndTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10 - v14);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v120[4] = v106;
  v119[5] = CFSTR("triggerFiredTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v120[5] = v105;
  v119[6] = CFSTR("triggerFireSeconds");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v120[6] = v104;
  v119[7] = CFSTR("isTriggerEvent");
  v90 = v6 == 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6 == 0);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v120[7] = v103;
  v119[8] = CFSTR("numFramesFromPreTrigger");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_numFramesFromPreTrigger);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v120[8] = v102;
  v119[9] = CFSTR("isMaximized");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isMaximized);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v120[9] = v101;
  v119[10] = CFSTR("extraSamplesAtStart");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v21);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v120[10] = v100;
  v119[11] = CFSTR("isSecondChance");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSecondChanceEffective);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v120[11] = v99;
  v119[12] = CFSTR("threshold");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_threshold);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v120[12] = v98;
  v119[13] = CFSTR("effectiveThreshold");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_effectiveThreshold);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v120[13] = v97;
  v119[14] = CFSTR("hardwareSamplerate");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_hardwareSampleRate);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v120[14] = v96;
  v119[15] = CFSTR("uptime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastUptime);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v120[15] = v95;
  v119[16] = CFSTR("downtime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastDowntime);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v120[16] = v94;
  v119[17] = CFSTR("didWakeAP");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didWakeAP);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v120[17] = v93;
  v119[18] = CFSTR("onBatteryPower");
  v28 = (void *)MEMORY[0x24BDD16E0];
  +[VTBatteryMonitor sharedInstance](VTBatteryMonitor, "sharedInstance");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithInt:", objc_msgSend(v92, "batteryState") == 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v120[18] = v91;
  v119[19] = CFSTR("siriIsActiveOrOtherAssertion");
  v29 = (void *)MEMORY[0x24BDD16E0];
  +[VTSiriAssertionMonitor sharedInstance](VTSiriAssertionMonitor, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithBool:", objc_msgSend(v30, "isEnabled"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  configVersion = (const __CFString *)self->_configVersion;
  if (!configVersion)
    configVersion = CFSTR("n/a");
  v120[19] = v31;
  v120[20] = configVersion;
  v119[20] = CFSTR("configVersion");
  v119[21] = CFSTR("languageCode");
  languageCode = (const __CFString *)self->_languageCode;
  if (!languageCode)
    languageCode = CFSTR("n/a");
  v120[21] = languageCode;
  v119[22] = CFSTR("deviceHandHeld");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VTPhraseSpotter _isDeviceHandheld](self, "_isDeviceHandheld"));
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  configData = (const __CFString *)self->_configData;
  if (!configData)
    configData = CFSTR("n/a");
  v120[22] = v35;
  v120[23] = configData;
  v119[23] = CFSTR("configDataHash");
  v119[24] = CFSTR("biometricClue");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VTPhraseSpotter _getBiometricMatchResult](self, "_getBiometricMatchResult"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v120[24] = v38;
  v119[25] = CFSTR("numberOfHSPayloadUtterances");
  v112 = (void *)v25;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[VTPhraseSpotter _getNumberOfAudioFilesInDirectory:](self, "_getNumberOfAudioFilesInDirectory:", v25));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v120[25] = v39;
  v119[26] = CFSTR("numberOfPayloadUtterances");
  v111 = (void *)v26;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[VTPhraseSpotter _getNumberOfAudioFilesInDirectory:](self, "_getNumberOfAudioFilesInDirectory:", v26));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v120[26] = v40;
  v119[27] = CFSTR("lastConsecutivePHSRejects");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_consecutivePHSRejects);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v120[27] = v41;
  v119[28] = CFSTR("deltaTimeFromlastPHSReject");
  consecutivePHSRejects = self->_consecutivePHSRejects;
  if (consecutivePHSRejects == 0.0)
  {
    v45 = &unk_24C803048;
  }
  else
  {
    v43 = (void *)MEMORY[0x24BDD16E0];
    +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
    objc_msgSend(v43, "numberWithDouble:", v44 - self->_lastPHSRejectedTime);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v120[28] = v45;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v120, v119, 29);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (consecutivePHSRejects != 0.0)

  if (v115)
  {
    v47 = (void *)objc_msgSend(v46, "mutableCopy");
    objc_msgSend(v47, "setObject:forKey:", v115, CFSTR("captureFilePath"));

    if (self->_audioBuffer)
    {
      v48 = -[VTPhraseSpotter _sampleLengthFrom:To:](self, "_sampleLengthFrom:To:", self->_samplecountAtLastTriggerStart, self->_samplecount);
      audioBuffer = self->_audioBuffer;
      v50 = -[VTAudioCircularBuffer sampleCount](audioBuffer, "sampleCount") - v48;
      v51 = -[VTAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount");
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v115);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[VTAudioCircularBuffer saveRecordingBufferFrom:to:toURL:](audioBuffer, "saveRecordingBufferFrom:to:toURL:", v50, v51, v52);

      if (self->_isSecondPass)
        -[VTTextDependentSpeakerRecognizer logWithAudioFilepath:](self->_satDetectionTdSr, "logWithAudioFilepath:", v115);
    }
  }
  else
  {
    v47 = v46;
  }
  if (!self->_isRunningSATDetection)
  {
    v53 = v47;
    goto LABEL_37;
  }
  v53 = (void *)objc_msgSend(v47, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setObject:forKey:", v54, CFSTR("satScore"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_thresholdSAT);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setObject:forKey:", v55, CFSTR("satThreshold"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v90);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setObject:forKey:", v56, CFSTR("satTriggered"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_implicitlyTrained);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setObject:forKey:", v57, CFSTR("satBeingTrained"));

  v58 = -[VTAnalyzerNDAPI getSATVectorCount](self->_analyzer, "getSATVectorCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setObject:forKey:", v59, CFSTR("satNumTrainingUtts"));

  if (v110)
  {
    if (v110 == 1)
    {
      +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
      self->_lastPHSRejectedTime = v60;
      v61 = self->_consecutivePHSRejects + 1.0;
      goto LABEL_60;
    }
LABEL_37:
    if (!self->_isRunningRecognizer)
      goto LABEL_39;
    goto LABEL_38;
  }
  self->_lastPHSRejectedTime = -INFINITY;
  v61 = 0.0;
LABEL_60:
  self->_consecutivePHSRejects = v61;
  if (self->_isRunningRecognizer)
  {
LABEL_38:
    v62 = (void *)objc_msgSend(v53, "mutableCopy");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_recognizerScore);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKey:", v63, CFSTR("recognizerScore"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_recognizerThresholdOffset);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKey:", v64, CFSTR("recognizerThresholdOffset"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_recognizerWaitTime);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKey:", v65, CFSTR("recognizerWaitTime"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_recognizerScoreScaleFactor);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setObject:forKey:", v66, CFSTR("recognizerScoreScaleFactor"));

    v53 = v62;
  }
LABEL_39:
  if (self->_isSecondPass)
  {
    satDetectionTdSr = self->_satDetectionTdSr;
    if (satDetectionTdSr)
    {
      if (-[VTTextDependentSpeakerRecognizer tdPsrCanProcessRequest](satDetectionTdSr, "tdPsrCanProcessRequest"))
      {
        -[VTTextDependentSpeakerRecognizer lastRequestSatScore](self->_satDetectionTdSr, "lastRequestSatScore");
        if (v68 > 0.0)
        {
          v69 = (void *)objc_msgSend(v53, "mutableCopy");
          v70 = (void *)MEMORY[0x24BDD16E0];
          -[VTTextDependentSpeakerRecognizer lastRequestSatScore](self->_satDetectionTdSr, "lastRequestSatScore");
          objc_msgSend(v70, "numberWithFloat:");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v71, CFSTR("tdSpeakerRecognizerScore"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastCombinedTdSpeakerRecognizerSATScore);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v72, CFSTR("tdSpeakerRecognizerCombinedScore"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tdSpeakerRecognizerSATThreshold);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v73, CFSTR("tdSpeakerRecognizerCombinedThreshold"));

          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_tdSpeakerRecognizerCombinationWeight);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v74, CFSTR("tdSpeakerRecognizerCombinationWeight"));

          v53 = v69;
        }
      }
    }
  }
  if (self->_injectedAudioFilePath)
  {
    v75 = (void *)objc_msgSend(v53, "mutableCopy");
    objc_msgSend(v75, "setObject:forKeyedSubscript:", self->_injectedAudioFilePath, CFSTR("injectedAudioFilePath"));

    v53 = v75;
  }
  v16 = (void *)objc_msgSend(v53, "mutableCopy");
  if (self->_earlyDetecFiredMachTime)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v76, CFSTR("earlyDetectFiredMachTime"));

  }
  if (self->_triggerStartMachTime)
  {
    v77 = -[VTPhraseSpotter _addExtraTime:to:](self, "_addExtraTime:to:", v18 - v17);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_triggerStartMachTime);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v78, CFSTR("triggerStartMachTime"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v79, CFSTR("triggerEndMachTime"));

  }
  if (self->_triggerFireMachTime)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v80, CFSTR("triggerFireMachTime"));

  }
  if (!self->_triggerStartMachTime && self->_triggerFireMachTime)
  {
    v81 = -[VTPhraseSpotter _applyExtraTime:to:](self, "_applyExtraTime:to:", v14);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v82, CFSTR("triggerEndMachTime"));

  }
  if (self->_isSecondPass)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_firstPassScore);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v83, CFSTR("firstPassScore"));

  }
  return v16;
}

- (void)_logCorruptAudio
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  NSObject *loggingQueue;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  if (self->_audioLoggingEnabled)
  {
    VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_24C7F6FB8, &stru_24C7F6FB8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[VTPhraseSpotter _capturePathWithPrefix:eventKind:](self, "_capturePathWithPrefix:eventKind:", v3, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[VTCorruptDetector getMaxZeroSampleCount](self->_corruptDetector, "getMaxZeroSampleCount");
    v6 = v5;
    v17[0] = CFSTR("num-zero-samples");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("zero-in-seconds");
    v18[0] = v7;
    *(float *)&v8 = (float)v6 / 16000.0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    loggingQueue = self->_loggingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__VTPhraseSpotter__logCorruptAudio__block_invoke;
    block[3] = &unk_24C7F4DC0;
    v15 = v4;
    v16 = v10;
    v12 = v10;
    v13 = v4;
    dispatch_async(loggingQueue, block);

  }
}

- (void)_logPrepareProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *loggingQueue;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  _QWORD v31[4];
  _QWORD v32[5];

  v32[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && self->_audioLoggingEnabled)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AOPVoiceTriggerData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentHostTime"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-time"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentHostTime"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "longLongValue");

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger-time"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "longLongValue");

          v31[0] = CFSTR("trigger-woke-ap");
          objc_msgSend(v6, "objectForKeyedSubscript:");
          v15 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v15;
          v18 = MEMORY[0x24BDBD1C0];
          if (v15)
            v18 = v15;
          v32[0] = v18;
          v31[1] = CFSTR("trigger-start-time");
          v14 = (double)(v13 - v11) / 24000.0;
          *(float *)&v16 = v14;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v32[1] = v19;
          v31[2] = CFSTR("trigger-time");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v13);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v32[2] = v20;
          v31[3] = CFSTR("currentHostTime");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v32[3] = v21;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_24C7F6FB8, &stru_24C7F6FB8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[VTPhraseSpotter _capturePathWithPrefix:eventKind:](self, "_capturePathWithPrefix:eventKind:", v23, 3);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          loggingQueue = self->_loggingQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __39__VTPhraseSpotter__logPrepareProperty___block_invoke;
          block[3] = &unk_24C7F4DC0;
          v29 = v24;
          v30 = v22;
          v26 = v22;
          v27 = v24;
          dispatch_async(loggingQueue, block);

        }
      }
    }

  }
}

- (id)_createVTEventInfoString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (_createVTEventInfoString__onceToken != -1)
    dispatch_once(&_createVTEventInfoString__onceToken, &__block_literal_global_386);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithUTF8String:", "\n");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = (id)_createVTEventInfoString__printingWhiteList;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v3, "objectForKey:", v10);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("\t%@: %@\n"), v10, v13, (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendString:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_logMetaData:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  NSDictionary *lastVoiceTriggerEventInfo;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *configPath;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *loggingQueue;
  id v28;
  id v29;
  void *v30;
  const __CFString *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  char v35;
  void *v36;
  void *v37;
  _QWORD block[4];
  id v39;
  id v40;
  id v41;
  id v42;
  char v43;
  uint8_t buf[4];
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _QWORD v50[7];
  _QWORD v51[9];

  v51[7] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    lastVoiceTriggerEventInfo = self->_lastVoiceTriggerEventInfo;
    self->_lastVoiceTriggerEventInfo = v6;

    -[VTPhraseSpotter _createVTEventInfoString:](self, "_createVTEventInfoString:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isTriggerEvent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (self->_audioLoggingEnabled)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("captureFilePath"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("triggerStartTime"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      objc_msgSend(v5, "objectForKey:", CFSTR("triggerEndTime"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v5);
      v50[0] = CFSTR("totalSamplesAtTriggerEnd");
      v35 = v10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_samplecountAtLastTriggerEnd);
      v37 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v18;
      v50[1] = CFSTR("totalSamplesAtTriggerStart");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_samplecountAtLastTriggerStart);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v19;
      v50[2] = CFSTR("totalSamplesAtEndOfCapture");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_samplecount);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      configPath = (const __CFString *)self->_configPath;
      if (!configPath)
        configPath = CFSTR("n/a");
      v51[2] = v20;
      v51[3] = configPath;
      v50[3] = CFSTR("configPath");
      v50[4] = CFSTR("triggerDuration");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16 - v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v51[4] = v23;
      v50[5] = CFSTR("productVersion");
      +[VTUtilities deviceProductVersion](VTUtilities, "deviceProductVersion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v51[5] = v24;
      v50[6] = CFSTR("buildVersion");
      v25 = (void *)MGCopyAnswer();
      v51[6] = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, v50, 7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addEntriesFromDictionary:", v26);

      v8 = v37;
      loggingQueue = self->_loggingQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __32__VTPhraseSpotter__logMetaData___block_invoke;
      block[3] = &unk_24C7F4DE8;
      v39 = v36;
      v40 = v17;
      v43 = v35;
      v41 = v5;
      v42 = v37;
      v28 = v17;
      v29 = v36;
      dispatch_async(loggingQueue, block);

    }
    else
    {
      v30 = (void *)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        if (v10)
          v31 = CFSTR("Trigger Event");
        else
          v31 = CFSTR("Nearly Triggered Event");
        v32 = v30;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("triggerScore"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValue");
        *(_DWORD *)buf = 138543874;
        v45 = v31;
        v46 = 2050;
        v47 = v34;
        v48 = 2114;
        v49 = v8;
        _os_log_impl(&dword_20D965000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ [score %{public}7.5f]: %{public}@", buf, 0x20u);

      }
    }

  }
}

- (id)_desRecordFromTriggerData:(const _ndresult *)a3 sampleCount:(unint64_t *)a4
{
  unint64_t v6;
  uint64_t v8;

  if (!self->_audioBuffer)
    return 0;
  v8 = 0;
  v6 = -[VTPhraseSpotter _sampleLengthFrom:To:](self, "_sampleLengthFrom:To:", a3->var1, a3->var0);
  if (a4)
    *a4 = v6;
  return -[VTAudioCircularBuffer copySamplesFrom:to:withNumSamplesCopiedIn:](self->_audioBuffer, "copySamplesFrom:to:withNumSamplesCopiedIn:", -[VTAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount") - v6, -[VTAudioCircularBuffer sampleCount](self->_audioBuffer, "sampleCount"), &v8);
}

- (void)_logDESTriggerRecord:(const _ndresult *)a3 result:(id)a4
{
  -[VTPhraseSpotter _logDESRecord:result:isActualTrigger:](self, "_logDESRecord:result:isActualTrigger:", a3, a4, 1);
}

- (void)_logDESRecord:(const _ndresult *)a3 result:(id)a4
{
  -[VTPhraseSpotter _logDESRecord:result:isActualTrigger:](self, "_logDESRecord:result:isActualTrigger:", a3, a4, 0);
}

- (void)_logDESRecord:(const _ndresult *)a3 result:(id)a4 isActualTrigger:(BOOL)a5
{
  id v8;
  void *v9;
  NSObject *desQueue;
  _QWORD block[5];
  id v12;
  _QWORD *v13;
  BOOL v14;
  _QWORD v15[4];
  __int128 v16;
  uint64_t v17;

  v8 = a4;
  v9 = v8;
  if (!self->_isRunningSATEnrollment)
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3810000000;
    v15[3] = "";
    v16 = *(_OWORD *)&a3->var0;
    v17 = *(_QWORD *)&a3->var4;
    desQueue = self->_desQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__VTPhraseSpotter__logDESRecord_result_isActualTrigger___block_invoke;
    block[3] = &unk_24C7F4E50;
    v14 = a5;
    block[4] = self;
    v13 = v15;
    v12 = v8;
    dispatch_async(desQueue, block);

    _Block_object_dispose(v15, 8);
  }

}

- (void)_logPHSDESRecord:(const _ndsupervec *)a3
{
  NSObject *desQueue;
  _QWORD block[5];

  desQueue = self->_desQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__VTPhraseSpotter__logPHSDESRecord___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(desQueue, block);
}

- (id)getCorealisRTModel
{
  const __CFString *languageCode;
  void *v4;
  void *v5;
  id v6;
  NSString *resourcePath;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSString *configPath;
  NSString *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (self->_languageCode)
    languageCode = (const __CFString *)self->_languageCode;
  else
    languageCode = CFSTR("xx-XX");
  objc_msgSend(CFSTR("RT Model for "), "stringByAppendingString:", languageCode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR(" from asset "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  resourcePath = self->_resourcePath;
  if (!resourcePath || !self->_configPath)
    goto LABEL_18;
  -[NSString stringByAppendingPathComponent:](resourcePath, "stringByAppendingPathComponent:", CFSTR("config_rt.txt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[VTUtilities isAlwaysOn](VTUtilities, "isAlwaysOn"))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, 0);

  if ((v10 & 1) == 0)
  {
    v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      configPath = self->_configPath;
      *(_DWORD *)buf = 138543618;
      v29 = v8;
      v30 = 2114;
      v31 = configPath;
      _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "RT specific configuration %{public}@ does not exist, defaulting to unified configuration %{public}@", buf, 0x16u);
    }
LABEL_10:
    v13 = self->_configPath;

    v8 = v13;
  }
  v14 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v8;
    _os_log_impl(&dword_20D965000, v14, OS_LOG_TYPE_DEFAULT, "Creating RT blob using: %{public}@", buf, 0xCu);
  }
  +[VTBlobBuilder getBlobWithConfigFilename:rootDirectory:](VTBlobBuilder, "getBlobWithConfigFilename:rootDirectory:", v8, self->_resourcePath);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v17, OS_LOG_TYPE_DEFAULT, "CorealisRT model creation done successfully", buf, 2u);
    }
    +[VTUtilities getAssetHashFromConfigPath:](VTUtilities, "getAssetHashFromConfigPath:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_24;
  }

LABEL_18:
  v20 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v20, OS_LOG_TYPE_DEFAULT, "Defaulting to en_US CorealisRT model", buf, 2u);
  }
  +[VTBlobBuilder getDefaultBlob](VTBlobBuilder, "getDefaultBlob");
  v21 = objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    v23 = 0;
    v19 = v6;
    goto LABEL_28;
  }
  v16 = (void *)v21;
  v22 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v22, OS_LOG_TYPE_DEFAULT, "Default CorealisRT model creation done successfully", buf, 2u);
  }
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("default config"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
LABEL_24:

  v26[0] = CFSTR("CorealisRTModel");
  v26[1] = CFSTR("CorealisRTModelVersion");
  v27[0] = v16;
  v27[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v19;
    _os_log_impl(&dword_20D965000, v24, OS_LOG_TYPE_DEFAULT, "RT Model queried - %{public}@", buf, 0xCu);
  }

LABEL_28:
  return v23;
}

- (id)getLanguageCode
{
  return self->_languageCode;
}

- (unint64_t)_applyExtraTime:(double)a3 to:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  if (info.numer)
  {
    LODWORD(v6) = info.denom;
    v7 = (unint64_t)((double)v6 / (double)info.numer * 1000000000.0 * a3);
  }
  else
  {
    v7 = 0;
  }
  v8 = a4 >= v7;
  v9 = a4 - v7;
  if (v8)
    return v9;
  else
    return 0;
}

- (unint64_t)_addExtraTime:(double)a3 to:(unint64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  if (info.numer)
  {
    LODWORD(v6) = info.denom;
    v7 = (unint64_t)((double)v6 / (double)info.numer * 1000000000.0 * a3);
  }
  else
  {
    v7 = 0;
  }
  return v7 + a4;
}

- (unint64_t)getAdjustedDeviceStartTime:(unint64_t)a3
{
  unint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  unint64_t v10;
  __int16 v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = -[VTPhraseSpotter _applyExtraTime:to:](self, "_applyExtraTime:to:", 0.5);
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134349568;
    v8 = 0x3FE0000000000000;
    v9 = 2050;
    v10 = a3;
    v11 = 2050;
    v12 = v4;
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "Start audio device %{public}.1fs earlier -- received trigger time %{public}lld and adjusted device start time: %{public}lld", (uint8_t *)&v7, 0x20u);
  }
  return v4;
}

- (id)getSATDirectory
{
  return +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 1, self->_languageCode);
}

- (unint64_t)sampleCount
{
  return self->_samplecount;
}

- (unint64_t)sampleCountAtStartOfTrigger
{
  return self->_samplecountAtLastTriggerStart;
}

- (unint64_t)sampleCountAtEndOfTrigger
{
  return self->_samplecountAtLastTriggerEnd;
}

- (id)_capturePathWithPrefix:(id)a3 eventKind:(unsigned __int8)a4
{
  const __CFString *v4;

  if ((a4 - 1) > 3u)
    v4 = CFSTR("-triggered.wav");
  else
    v4 = off_24C7F4F58[(a4 - 1)];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), a3, v4);
}

- (BOOL)_configureWithDefaults
{
  return 1;
}

- (void)VTLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  notify_post("com.apple.corespeech.voicetriggerassetchange");
  v7 = v5;
  +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLanguageCode:", v7);

  -[VTPhraseSpotter _handleAssetChangeForLanguageCode:](self, "_handleAssetChangeForLanguageCode:", v7);
}

- (void)setBypass:(BOOL)a3
{
  NSObject *ndetectQueue;
  _QWORD v4[5];
  BOOL v5;

  ndetectQueue = self->_ndetectQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__VTPhraseSpotter_setBypass___block_invoke;
  v4[3] = &unk_24C7F4D98;
  v4[4] = self;
  v5 = a3;
  dispatch_async(ndetectQueue, v4);
}

- (void)didReceiveSiriSessionCancellation:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *ndetectQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "::: Received siriSessionCancel Event with reason: %{public}@", buf, 0xCu);
  }
  ndetectQueue = self->_ndetectQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__VTPhraseSpotter_didReceiveSiriSessionCancellation___block_invoke;
  v8[3] = &unk_24C7F4DC0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(ndetectQueue, v8);

}

- (void)requestFoceTrigger
{
  NSObject *v3;
  NSObject *ndetectQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Received forrced trigger event creation", buf, 2u);
  }
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__VTPhraseSpotter_requestFoceTrigger__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

- (void)requestSecondChance
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Received forrced second chance event creation", v4, 2u);
  }
  -[VTPhraseSpotter looseTriggerThreshold](self, "looseTriggerThreshold");
}

- (void)_firstUnlockedAndSpringBoardStarted
{
  NSObject *ndetectQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__VTPhraseSpotter__firstUnlockedAndSpringBoardStarted__block_invoke;
  block[3] = &unk_24C7F4E98;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(ndetectQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_notifyAssetChangedCallback
{
  void (**assetChangedCallback)(void);

  assetChangedCallback = (void (**)(void))self->_assetChangedCallback;
  if (assetChangedCallback)
    assetChangedCallback[2]();
}

- (void)_handleAssetChangeForLanguageCode:(id)a3
{
  id v4;
  NSObject *assetChangedQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  VTPhraseSpotter *v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  assetChangedQueue = self->_assetChangedQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__VTPhraseSpotter__handleAssetChangeForLanguageCode___block_invoke;
  v7[3] = &unk_24C7F4EC0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_copyWeak(&v10, &location);
  dispatch_async(assetChangedQueue, v7);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void)VTAssetMonitor:(id)a3 didReceiveNewAssetAvailable:(BOOL)a4
{
  -[VTPhraseSpotter _handleAssetChangeForLanguageCode:](self, "_handleAssetChangeForLanguageCode:", self->_languageCode, a4);
}

- (BOOL)_configureWithConfig:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  VTAnalyzerNDAPI *v15;
  VTAnalyzerNDAPI *v16;
  NSObject *ndetectQueue;
  _QWORD block[5];
  VTAnalyzerNDAPI *v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v25 = "-[VTPhraseSpotter _configureWithConfig:resourcePath:]";
    v26 = 2114;
    v27 = v6;
    v28 = 2114;
    v29 = v7;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "::: %{public}s config: %{public}@; resources: %{public}@",
      buf,
      0x20u);
  }
  kdebug_trace();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v6);

  v11 = 0;
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "MD5HashString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  nd_initlog((void (*)(void))ndapilog_callback);
  nd_logcontrol("NLogLevelVerbose", v14);
  v15 = -[VTAnalyzerNDAPI initWithConfigPath:resourcePath:]([VTAnalyzerNDAPI alloc], "initWithConfigPath:resourcePath:", v6, v7);
  v16 = v15;
  if (v15)
  {
    ndetectQueue = self->_ndetectQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__VTPhraseSpotter__configureWithConfig_resourcePath___block_invoke;
    block[3] = &unk_24C7F4EE8;
    block[4] = self;
    v20 = v15;
    v21 = v6;
    v22 = v11;
    v23 = v7;
    dispatch_async(ndetectQueue, block);

  }
  return v16 != 0;
}

- (int64_t)_getNumberOfAudioFilesInDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  _BYTE buf[24];
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = *MEMORY[0x24BDBCCD0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, v6, 0, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    if (v8)
    {
      v9 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v4;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v8;
        _os_log_error_impl(&dword_20D965000, v9, OS_LOG_TYPE_ERROR, "Error reading contents of audioDir: %{public}@, err: %{public}@", buf, 0x16u);
      }
      v10 = -1;
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v16 = 0;
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __53__VTPhraseSpotter__getNumberOfAudioFilesInDirectory___block_invoke;
      v13[3] = &unk_24C7F4F10;
      v13[4] = buf;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);
      v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      _Block_object_dispose(buf, 8);
    }

  }
  else
  {
    v11 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_20D965000, v11, OS_LOG_TYPE_ERROR, "ERR: audioDir is nil - Bailing out", buf, 2u);
    }
    v10 = -1;
  }

  return v10;
}

- (BOOL)_shouldPerformRetrainingWithAnalyzerNDAPI:(id)a3 resourcePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  int64_t v13;
  int v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  char v26;
  int64_t v27;
  NSObject *v28;
  void *v30;
  VTTextDependentSpeakerRecognizer *satDetectionTdSr;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  char v36;
  uint8_t buf[4];
  int64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 1, self->_languageCode);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  if ((objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v9, &v36) & 1) != 0 || v36)
  {
    +[VTSpeakerIdUtilities getSpeakerModelPathForType:withLanguageCode:withConfigPath:createDirectory:](VTSpeakerIdUtilities, "getSpeakerModelPathForType:withLanguageCode:withConfigPath:createDirectory:", 1, self->_languageCode, self->_configPath, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v12, 0) & 1) == 0)
    {
      v19 = VTLogContextFacilityVoiceTrigger;
      if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:
        v11 = 1;
LABEL_33:

        goto LABEL_34;
      }
      *(_DWORD *)buf = 138543362;
      v38 = (int64_t)v12;
      v20 = "Needs Retraining: phsSATFile doesnt exist at: %{public}@.";
      v21 = v19;
      v22 = 12;
LABEL_11:
      _os_log_impl(&dword_20D965000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      goto LABEL_12;
    }
    v34 = v12;
    v35 = v7;
    v13 = -[VTPhraseSpotter _getNumberOfAudioFilesInDirectory:](self, "_getNumberOfAudioFilesInDirectory:", v9);
    v14 = objc_msgSend(v6, "getSATVectorCount");
    v15 = objc_msgSend(v6, "getMaximumSpeakerVectors");
    v16 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v14;
      *(_DWORD *)buf = 134349826;
      v18 = v15;
      v38 = v13;
      v39 = 2114;
      v40 = v6;
      v41 = 2050;
      v42 = v14;
      v43 = 2050;
      v44 = v15;
      _os_log_impl(&dword_20D965000, v16, OS_LOG_TYPE_DEFAULT, "SV: numAudioFiles: %{public}ld, analyzerNDAPI: %{public}@, numSATSpeakerVectors: %{public}ld, maxSpeakerVectors: %{public}ld", buf, 0x2Au);
      if (v13 > v15)
        goto LABEL_18;
    }
    else
    {
      v18 = v15;
      v17 = v14;
      if (v13 > v15)
        goto LABEL_18;
    }
    if (v13 != v17)
    {
      v23 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v23, OS_LOG_TYPE_DEFAULT, "Needs Retraining: (PHS)SpeakerVectors MISMATCH. numSATSpeakerVectors != numAudioFiles", buf, 2u);
      }
      v11 = 1;
      v12 = v34;
      v7 = v35;
      goto LABEL_33;
    }
LABEL_18:
    if (v13 > v18 && v14 != v15)
    {
      v24 = VTLogContextFacilityVoiceTrigger;
      v12 = v34;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v24, OS_LOG_TYPE_DEFAULT, "Needs Retraining: (PHS)SpeakerVectors MISMATCH. numSATSpeakerVectors != maxSpeakerVectors", buf, 2u);
      }
      v11 = 1;
      v7 = v35;
      goto LABEL_33;
    }
    v7 = v35;
    v12 = v34;
    if (+[VTTextDependentSpeakerRecognizer psrTdAssetExistsAtResourcePath:](VTTextDependentSpeakerRecognizer, "psrTdAssetExistsAtResourcePath:", v35))
    {
      -[VTTextDependentSpeakerRecognizer tdSATModelFilePath](self->_satDetectionTdSr, "tdSATModelFilePath");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v25, 0);

      if ((v26 & 1) == 0)
      {
        v30 = (void *)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          satDetectionTdSr = self->_satDetectionTdSr;
          v32 = v30;
          -[VTTextDependentSpeakerRecognizer tdSATModelFilePath](satDetectionTdSr, "tdSATModelFilePath");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = (int64_t)v33;
          _os_log_impl(&dword_20D965000, v32, OS_LOG_TYPE_DEFAULT, "Needs Retraining: psrTD SAT file doesnt exist at: %{public}@", buf, 0xCu);

        }
        goto LABEL_12;
      }
      v27 = -[VTTextDependentSpeakerRecognizer getSATVectorCount](self->_satDetectionTdSr, "getSATVectorCount");
      v28 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v38 = v27;
        _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "numPsrTdSpeakerVectors: %{public}ld", buf, 0xCu);
        v28 = VTLogContextFacilityVoiceTrigger;
      }
      if (v27 != v17)
      {
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        *(_WORD *)buf = 0;
        v20 = "Needs Retraining: (TD-PSR)SpeakerVectors MISMATCH! numPsrTdSpeakerVectors != numSATSpeakerVectors";
        v21 = v28;
        v22 = 2;
        goto LABEL_11;
      }
    }
    else
    {
      v28 = VTLogContextFacilityVoiceTrigger;
    }
    v11 = 0;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "VT does not need retraining: ", buf, 2u);
      v11 = 0;
    }
    goto LABEL_33;
  }
  v10 = VTLogContextFacilityVoiceTrigger;
  v11 = 0;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v38 = (int64_t)v9;
    v39 = 1026;
    LODWORD(v40) = 0;
    _os_log_impl(&dword_20D965000, v10, OS_LOG_TYPE_DEFAULT, "Cannot find SAT Audio dir at %{public}@: isDir: %{public}d", buf, 0x12u);
    v11 = 0;
  }
LABEL_34:

  return v11;
}

- (void)_safeConfigureWithAnalyzer:(id)a3 path:(id)a4 data:(id)a5 resourcePath:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSString *configVersion;
  NSString *configData;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  NSString *v28;
  NSString *recognizerConfigName;
  double v30;
  double v31;
  double v32;
  NSString *v33;
  NSString *triggerTokens;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  _BOOL4 isRunningSATEnrollment;
  double v40;
  unsigned int v41;
  NSObject *v42;
  NSString *v43;
  NSString *retrainSamplingPolicy;
  double v45;
  double v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  VTTextDependentSpeakerRecognizer *v50;
  VTTextDependentSpeakerRecognizer *satDetectionTdSr;
  NSObject *v52;
  VTTextDependentSpeakerRecognizer *v53;
  double v54;
  void *v55;
  int v56;
  void *v57;
  id v58;
  NSObject *v59;
  double v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  double v69;
  void *v70;
  id v71;
  NSObject *v72;
  double v73;
  void *v74;
  void *v75;
  NSObject *v76;
  double v77;
  NSObject *v78;
  BOOL v79;
  NSObject *v80;
  BOOL isRunningSATDetection;
  VTVoiceProfileRetrainer *v82;
  NSObject *v83;
  void *v84;
  int v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  VTTextDependentSpeakerRecognizer *v90;
  double v91;
  double v92;
  NSObject *v93;
  VTTextDependentSpeakerRecognizer *v94;
  double thresholdSAT;
  double tdSpeakerRecognizerSATThreshold;
  double tdSpeakerRecognizerCombinationWeight;
  void *v98;
  double v99;
  double v100;
  double v101;
  NSObject *v102;
  VTTranscriber *v103;
  VTTranscriber *transcriber;
  void *v105;
  double v106;
  double v107;
  NSObject *v108;
  VTAudioCircularBuffer *v109;
  VTAudioCircularBuffer *audioBuffer;
  VTAnalyzerNDAPI *analyzer;
  void *v112;
  void *v113;
  NSArray *v114;
  NSArray *triggerPhrases;
  NSObject *v116;
  NSString *languageCode;
  double threshold;
  double thresholdLogNearMisses;
  NSArray *v120;
  NSObject *v121;
  id v122;
  id v123;
  id v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  _QWORD v131[5];
  id v132;
  id v133;
  id v134;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  id v140;
  id v141;
  void *v142;
  uint8_t buf[4];
  uint64_t v144;
  __int16 v145;
  double v146;
  __int16 v147;
  double v148;
  __int16 v149;
  double v150;
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[VTSpeakerIdUtilities getSATAudioDirectoryForType:forLanguageCode:](VTSpeakerIdUtilities, "getSATAudioDirectoryForType:forLanguageCode:", 1, self->_languageCode);
  v130 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  -[VTPhraseSpotter _resetCounters](self, "_resetCounters");
  self->_samplerate = 16000;
  objc_storeStrong((id *)&self->_resourcePath, a6);
  objc_storeStrong((id *)&self->_configPath, a4);
  objc_storeStrong((id *)&self->_configData, a5);
  v15 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    configVersion = self->_configVersion;
    configData = self->_configData;
    *(_DWORD *)buf = 138543618;
    v144 = (uint64_t)configVersion;
    v145 = 2114;
    v146 = *(double *)&configData;
    _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, "::: config version: %{public}@; data: %{public}@",
      buf,
      0x16u);
  }

  objc_msgSend(v11, "getNDAPITriggerThreshold");
  self->_ndapiThreshold = v18;
  objc_msgSend(v11, "getNDAPISecondChanceThreshold");
  self->_ndapiThresholdSecondChance = v19;
  objc_msgSend(v11, "getNDAPILoggingThreshold");
  self->_ndapiThresholdLogNearMisses = v20;
  *(_OWORD *)&self->_threshold = *(_OWORD *)&self->_ndapiThreshold;
  self->_thresholdLogNearMisses = v20;
  objc_msgSend(v11, "getCombinedTriggerThreshold");
  self->_combinedThreshold = v21;
  objc_msgSend(v11, "getCombinedSecondChanceThreshold");
  self->_combinedThresholdSecondChance = v22;
  objc_msgSend(v11, "getCombinedLoggingThreshold");
  self->_combinedThresholdLogNearMisses = v23;
  objc_msgSend(v11, "getExtraSamplesAtStart");
  self->_extraSamplesAtStart = v24;
  objc_msgSend(v11, "getSecondPassTrailingTime");
  self->_secondPassTrailingTime = v25;
  self->_doSuperVectorSecondaryTest = objc_msgSend(v11, "getDoSupervectorSecondaryTest");
  objc_msgSend(v11, "getThresholdPresuperVector");
  self->_thresholdPreSuperVector = v26;
  v27 = objc_msgSend(v11, "getUseRecognizer");
  self->_useRecognizer = v27;
  if (v27)
  {
    if (+[VTUtilities supportPremiumAssets](VTUtilities, "supportPremiumAssets"))
    {
      if (!self->_isRunningSATEnrollment)
      {
        objc_msgSend(v11, "getRecognizerConfig");
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        recognizerConfigName = self->_recognizerConfigName;
        self->_recognizerConfigName = v28;

        objc_msgSend(v11, "getRecognizerThresholdOffset");
        self->_recognizerThresholdOffset = v30;
        objc_msgSend(v11, "getRecognizerWaitTime");
        self->_recognizerWaitTime = v31;
        objc_msgSend(v11, "getRecognizerScoreScaleFactor");
        self->_recognizerScoreScaleFactor = v32;
        objc_msgSend(v11, "getTriggerTokens");
        v33 = (NSString *)objc_claimAutoreleasedReturnValue();
        triggerTokens = self->_triggerTokens;
        self->_triggerTokens = v33;

        self->_useFallbackThresholdUponTimeout = objc_msgSend(v11, "getUseFallbackThresholdUponTimeout");
        self->_useKeywordSpotting = objc_msgSend(v11, "getUseKeywordSpotting");
        goto LABEL_12;
      }
    }
    else if (!self->_isRunningSATEnrollment)
    {
      v121 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20D965000, v121, OS_LOG_TYPE_DEFAULT, "Device does not support recognizer config, ignoring...", buf, 2u);
      }
      goto LABEL_11;
    }
    v35 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v35, OS_LOG_TYPE_DEFAULT, "recognizer config ignored during enrollment...", buf, 2u);
    }

LABEL_11:
    self->_useRecognizer = 0;
  }
LABEL_12:
  if (self->_isRunningSATEnrollment)
  {
    self->_isRunningSATDetection = 0;
    self->_thresholdSAT = INFINITY;
    v36 = +[VTSpeakerIdUtilities createSATDirectoriesForType:forLanguageCode:](VTSpeakerIdUtilities, "createSATDirectoriesForType:forLanguageCode:", 2, self->_languageCode);
    v37 = +[VTSpeakerIdUtilities createSATDirectoriesForType:forLanguageCode:](VTSpeakerIdUtilities, "createSATDirectoriesForType:forLanguageCode:", 1, self->_languageCode);
    v38 = +[VTSpeakerIdUtilities createSATDirectoriesForType:forLanguageCode:](VTSpeakerIdUtilities, "createSATDirectoriesForType:forLanguageCode:", 3, self->_languageCode);
    isRunningSATEnrollment = self->_isRunningSATEnrollment;
    if (self->_isRunningSATEnrollment)
      goto LABEL_21;
  }
  else
  {
    self->_isRunningSATDetection = objc_msgSend(v11, "getDoSAT");
    objc_msgSend(v11, "getThresholdSAT");
    self->_thresholdSAT = v40;
    v41 = objc_msgSend(v11, "getRetrainNumExplicitUtt");
    self->_retrainNumExplicitUtt = (int)v41;
    if (v41 <= 4)
    {
      v42 = (id)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349056;
        v144 = 5;
        _os_log_impl(&dword_20D965000, v42, OS_LOG_TYPE_DEFAULT, "# of explicit utterances must be larger than %{public}lu, overriding...", buf, 0xCu);
      }

      self->_retrainNumExplicitUtt = 5;
    }
    self->_retrainNumImplicitUtt = (int)objc_msgSend(v11, "getRetrainNumImplicitUtt");
    objc_msgSend(v11, "getRetrainSamplingPolicy");
    v43 = (NSString *)objc_claimAutoreleasedReturnValue();
    retrainSamplingPolicy = self->_retrainSamplingPolicy;
    self->_retrainSamplingPolicy = v43;

    objc_msgSend(v11, "getRetrainThresholdTrigger");
    self->_retrainThresholdTrigger = v45;
    objc_msgSend(v11, "getRetrainThresholdSAT");
    self->_retrainThresholdSAT = v46;
    isRunningSATEnrollment = self->_isRunningSATEnrollment;
    if (self->_isRunningSATEnrollment)
      goto LABEL_21;
  }
  if (!self->_isRunningSATDetection)
  {
    isRunningSATDetection = 0;
    goto LABEL_91;
  }
LABEL_21:
  +[VTSpeakerIdUtilities getSpeakerModelPathForType:withLanguageCode:withConfigPath:createDirectory:](VTSpeakerIdUtilities, "getSpeakerModelPathForType:withLanguageCode:withConfigPath:createDirectory:", 1, self->_languageCode, v12, isRunningSATEnrollment);
  v129 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  v47 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(double *)&v144 = v129;
    _os_log_impl(&dword_20D965000, v47, OS_LOG_TYPE_DEFAULT, "SAT speaker file location is %{public}@", buf, 0xCu);
  }

  v48 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(double *)&v144 = v130;
    _os_log_impl(&dword_20D965000, v48, OS_LOG_TYPE_DEFAULT, "SAT training utterances stored in %{public}@", buf, 0xCu);
  }

  +[VTUtilities getAssetHashFromConfigPath:](VTUtilities, "getAssetHashFromConfigPath:", v12);
  v49 = objc_claimAutoreleasedReturnValue();
  +[VTSpeakerIdUtilities getSATDirectoryForModelType:forLanguageCode:](VTSpeakerIdUtilities, "getSATDirectoryForModelType:forLanguageCode:", 1, self->_languageCode);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = (void *)v49;
  v50 = -[VTTextDependentSpeakerRecognizer initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:]([VTTextDependentSpeakerRecognizer alloc], "initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:", v14, v127, v49, 0, self);
  satDetectionTdSr = self->_satDetectionTdSr;
  self->_satDetectionTdSr = v50;

  v52 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
  {
    v53 = self->_satDetectionTdSr;
    *(_DWORD *)buf = 138543362;
    v144 = (uint64_t)v53;
    _os_log_impl(&dword_20D965000, v52, OS_LOG_TYPE_DEFAULT, "TDSR:: Created _tdSrForSatDetection: %{public}@", buf, 0xCu);
  }

  v54 = v130;
  if (self->_isRunningSATEnrollment)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "fileExistsAtPath:isDirectory:", *(_QWORD *)&v129, 0);

    if (v56)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = 0;
      objc_msgSend(v57, "removeItemAtPath:error:", *(_QWORD *)&v129, &v141);
      v58 = v141;

      if (v58)
      {
        v59 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v58, "localizedDescription");
          v60 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138543618;
          *(double *)&v144 = v129;
          v145 = 2114;
          v146 = v60;
          _os_log_impl(&dword_20D965000, v59, OS_LOG_TYPE_DEFAULT, "Couldn't delete speaker model at path %{public}@ %{public}@", buf, 0x16u);

        }
      }

    }
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = 0;
    objc_msgSend(v61, "contentsOfDirectoryAtPath:error:", *(_QWORD *)&v130, &v140);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v140;

    v126 = v62;
    if (v63 || !v62)
    {
      v74 = (void *)VTLogContextFacilityVoiceTrigger;
      v75 = v63;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v76 = v74;
        objc_msgSend(v63, "localizedDescription");
        v77 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543618;
        *(double *)&v144 = v130;
        v145 = 2114;
        v146 = v77;
        _os_log_impl(&dword_20D965000, v76, OS_LOG_TYPE_DEFAULT, "Coudn't fetch the list of training utterances at path: %{public}@ %{public}@", buf, 0x16u);

      }
    }
    else
    {
      v122 = v14;
      v123 = v13;
      v124 = v12;
      v125 = v11;
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      v64 = v62;
      v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
      if (v65)
      {
        v66 = v65;
        v67 = *(_QWORD *)v137;
        do
        {
          for (i = 0; i != v66; ++i)
          {
            if (*(_QWORD *)v137 != v67)
              objc_enumerationMutation(v64);
            if (*(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * i))
            {
              objc_msgSend(*(id *)&v54, "stringByAppendingPathComponent:");
              v69 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v135 = 0;
              objc_msgSend(v70, "removeItemAtPath:error:", *(_QWORD *)&v69, &v135);
              v71 = v135;

              if (v71)
              {
                v72 = (id)VTLogContextFacilityVoiceTrigger;
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v71, "localizedDescription");
                  v73 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                  *(_DWORD *)buf = 138543618;
                  *(double *)&v144 = v69;
                  v145 = 2114;
                  v146 = v73;
                  _os_log_impl(&dword_20D965000, v72, OS_LOG_TYPE_DEFAULT, "Couldn't delete training utterance at path %{public}@ %{public}@", buf, 0x16u);

                  v54 = v130;
                }

              }
            }
          }
          v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
        }
        while (v66);
      }

      v12 = v124;
      v11 = v125;
      v14 = v122;
      v13 = v123;
      v75 = 0;
    }

  }
  if ((objc_msgSend(v11, "initializeSAT:", *(_QWORD *)&v129) & 1) != 0)
  {
    if (self->_isRunningSATDetection)
    {
      if (+[VTVoiceProfileMigration checkIfMigrationNecessaryForCompatibilityVersion:forLanguageCode:](VTVoiceProfileMigration, "checkIfMigrationNecessaryForCompatibilityVersion:forLanguageCode:", 1, self->_languageCode))
      {
        v78 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v78, OS_LOG_TYPE_DEFAULT, "Performing Migration of Voice Profile...", buf, 2u);
        }

        v79 = +[VTVoiceProfileMigration migrateVoiceProfileToVersion:forLanguageCode:](VTVoiceProfileMigration, "migrateVoiceProfileToVersion:forLanguageCode:", 1, self->_languageCode);
      }
      else
      {
        v79 = 0;
      }
      v82 = -[VTVoiceProfileRetrainer initWithAnalyzer:languageCode:modelType:configPath:resourcePath:]([VTVoiceProfileRetrainer alloc], "initWithAnalyzer:languageCode:modelType:configPath:resourcePath:", v11, self->_languageCode, 1, self->_configPath, self->_resourcePath);
      if (v79
        || -[VTPhraseSpotter _shouldPerformRetrainingWithAnalyzerNDAPI:resourcePath:](self, "_shouldPerformRetrainingWithAnalyzerNDAPI:resourcePath:", v11, v14))
      {
        if (-[VTVoiceProfileRetrainer pruneVoiceProfileIfNecessary](v82, "pruneVoiceProfileIfNecessary"))
        {
          v83 = (id)VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D965000, v83, OS_LOG_TYPE_DEFAULT, "Pruned Voice profile", buf, 2u);
          }

        }
        +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend(v84, "voiceTriggerEnabled");

        v86 = VTLogContextFacilityVoiceTrigger;
        if (v85)
        {
          v87 = (id)VTLogContextFacilityVoiceTrigger;
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_20D965000, v87, OS_LOG_TYPE_DEFAULT, "Retraining SAT speaker models with previous enrollment data", buf, 2u);
          }

          if (!+[VTSpeakerIdUtilities deleteExistingSATModelForLanguageCode:](VTSpeakerIdUtilities, "deleteExistingSATModelForLanguageCode:", self->_languageCode))
          {
            v88 = (id)VTLogContextFacilityVoiceTrigger;
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_20D965000, v88, OS_LOG_TYPE_ERROR, "ERR: Cannot delete invalidated spk model", buf, 2u);
            }

          }
          -[VTTextDependentSpeakerRecognizer deleteExistingSATModel](self->_satDetectionTdSr, "deleteExistingSATModel");
          v131[0] = MEMORY[0x24BDAC760];
          v131[1] = 3221225472;
          v131[2] = __69__VTPhraseSpotter__safeConfigureWithAnalyzer_path_data_resourcePath___block_invoke;
          v131[3] = &unk_24C7F4F38;
          v131[4] = self;
          v132 = v14;
          v133 = v127;
          v134 = v128;
          -[VTVoiceProfileRetrainer retrainSATModelWithCompletion:](v82, "retrainSATModelWithCompletion:", v131);

        }
        else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v86, OS_LOG_TYPE_DEFAULT, "Not performing retraining while Voice Trigger is disabled", buf, 2u);
        }
      }
      if ((int)objc_msgSend(v11, "getSATVectorCount") <= 0)
      {
        v89 = (id)VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v89, OS_LOG_TYPE_DEFAULT, "SAT model file can't be read correctly, turning off SAT for workaround", buf, 2u);
        }

        self->_isRunningSATDetection = 0;
      }

    }
  }
  else
  {
    v80 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(double *)&v144 = v129;
      _os_log_impl(&dword_20D965000, v80, OS_LOG_TYPE_DEFAULT, "Couldn't load or initialize speaker model file at path %{public}@, disabling SAT", buf, 0xCu);
    }
    self->_isRunningSATDetection = 0;
  }

  isRunningSATDetection = self->_isRunningSATDetection;
  if (isRunningSATDetection)
  {
    v90 = self->_satDetectionTdSr;
    if (v90)
    {
      -[VTTextDependentSpeakerRecognizer getThresholdSAT](v90, "getThresholdSAT");
      self->_tdSpeakerRecognizerSATThreshold = v91;
      -[VTTextDependentSpeakerRecognizer getCombinationWeight](self->_satDetectionTdSr, "getCombinationWeight");
      self->_tdSpeakerRecognizerCombinationWeight = v92;
    }
    v93 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
    {
      v94 = self->_satDetectionTdSr;
      thresholdSAT = self->_thresholdSAT;
      tdSpeakerRecognizerSATThreshold = self->_tdSpeakerRecognizerSATThreshold;
      tdSpeakerRecognizerCombinationWeight = self->_tdSpeakerRecognizerCombinationWeight;
      *(_DWORD *)buf = 138544130;
      v144 = (uint64_t)v94;
      v145 = 2050;
      v146 = thresholdSAT;
      v147 = 2050;
      v148 = tdSpeakerRecognizerSATThreshold;
      v149 = 2050;
      v150 = tdSpeakerRecognizerCombinationWeight;
      _os_log_impl(&dword_20D965000, v93, OS_LOG_TYPE_DEFAULT, "_satDetectionTdSr: %{public}@: _thresholdSAT=%{public}f, _tdSpeakerRecognizerSATThreshold=%{public}f, _tdSpeakerRecognizerCombinationWeight=%{public}f", buf, 0x2Au);
    }

    isRunningSATDetection = self->_isRunningSATDetection;
  }
LABEL_91:
  self->_isSuperVectorNeeded = isRunningSATDetection
                            || self->_isRunningSATEnrollment
                            || self->_doSuperVectorSecondaryTest;
  if (self->_useRecognizer && self->_recognizerConfigName)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "systemUptime");
    v100 = v99;

    -[NSString stringByAppendingPathComponent:](self->_resourcePath, "stringByAppendingPathComponent:", self->_recognizerConfigName);
    v101 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v102 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(double *)&v144 = v101;
      _os_log_impl(&dword_20D965000, v102, OS_LOG_TYPE_DEFAULT, "Speech recognizer config path: %{public}@", buf, 0xCu);
    }

    v103 = -[VTTranscriber initWithConfiguration:triggerTokens:useKeywordSpotting:]([VTTranscriber alloc], "initWithConfiguration:triggerTokens:useKeywordSpotting:", *(_QWORD *)&v101, self->_triggerTokens, self->_useKeywordSpotting);
    transcriber = self->_transcriber;
    self->_transcriber = v103;

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "systemUptime");
    v107 = v106;

    v108 = (id)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      *(double *)&v144 = (v107 - v100) * 1000.0;
      _os_log_impl(&dword_20D965000, v108, OS_LOG_TYPE_DEFAULT, "Speech model loading took %{public}.3fms", buf, 0xCu);
    }

    if (!self->_transcriber)
      self->_useRecognizer = 0;

  }
  if (!self->_audioBuffer && -[VTPhraseSpotter _shouldCreateAudioBuffer](self, "_shouldCreateAudioBuffer"))
  {
    v109 = -[VTAudioCircularBuffer initWithNumChannels:recordingDuration:samplingRate:]([VTAudioCircularBuffer alloc], "initWithNumChannels:recordingDuration:samplingRate:", 1, 2, 16000);
    audioBuffer = self->_audioBuffer;
    self->_audioBuffer = v109;

  }
  analyzer = self->_analyzer;
  if (analyzer)
  {
    self->_analyzer = 0;

  }
  objc_storeStrong((id *)&self->_analyzer, a3);
  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v112, "localizedTriggerPhraseForLanguageCode:", self->_languageCode);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v113;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v142, 1);
  v114 = (NSArray *)objc_claimAutoreleasedReturnValue();
  triggerPhrases = self->_triggerPhrases;
  self->_triggerPhrases = v114;

  self->_isMaximized = 0;
  self->_earlyDetected = 0;
  self->_earlyDetectTime = 0.0;
  self->_earlyDetecFiredMachTime = 0;
  self->_numFramesFromPreTrigger = 0;
  v116 = (id)VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    languageCode = self->_languageCode;
    threshold = self->_threshold;
    thresholdLogNearMisses = self->_thresholdLogNearMisses;
    v120 = self->_triggerPhrases;
    *(_DWORD *)buf = 138544130;
    v144 = (uint64_t)languageCode;
    v145 = 2050;
    v146 = threshold;
    v147 = 2050;
    v148 = thresholdLogNearMisses;
    v149 = 2114;
    v150 = *(double *)&v120;
    _os_log_impl(&dword_20D965000, v116, OS_LOG_TYPE_DEFAULT, "Initialized detector. LanguageCode: %{public}@; Threshold set to %{public}f; logging threshold: %{public}f; trigge"
      "r phrases: %{public}@",
      buf,
      0x2Au);
  }

}

- (id)_randomSubset:(id)a3 numSelected:(unsigned int)a4
{
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint32_t v10;
  uint32_t v11;
  uint32_t v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count") <= (unint64_t)a4)
  {
    v9 = v5;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
    objc_msgSend(v5, "subarrayWithRange:", 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "initWithArray:", v8);

    if (objc_msgSend(v5, "count") > (unint64_t)a4)
    {
      v10 = a4 + 1;
      do
      {
        v11 = arc4random_uniform(v10);
        if (v11 < a4)
        {
          v12 = v11;
          objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:atIndexedSubscript:", v13, v12);

        }
        v6 = v10++;
      }
      while (objc_msgSend(v5, "count") > v6);
    }
  }

  return v9;
}

- (id)_sampleFromSortedArray:(id)a3 numSelected:(unint64_t)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v5 = a3;
  if (objc_msgSend(v5, "count") <= a4)
  {
    v6 = v5;
  }
  else if (a4)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a4);
    v7 = objc_msgSend(v5, "count");
    if (objc_msgSend(v5, "count"))
    {
      v8 = 0;
      v9 = (unint64_t)((double)v7 / (double)a4);
      v10 = 1;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v11);

        v8 += v9;
        if (v8 >= objc_msgSend(v5, "count"))
          break;
      }
      while (v10++ < a4);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_safeReconfig
{
  NSObject *v3;
  NSString *v4;
  NSString *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  VTAnalyzerNDAPI *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136446210;
    v13 = "-[VTPhraseSpotter _safeReconfig]";
    _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&v12, 0xCu);
  }
  v4 = self->_configPath;
  v5 = self->_resourcePath;
  if (self->_audioLoggingEnabled
    && (objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "fileExistsAtPath:", v4),
        v6,
        v7))
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "MD5HashString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  v11 = -[VTAnalyzerNDAPI initWithConfigPath:resourcePath:]([VTAnalyzerNDAPI alloc], "initWithConfigPath:resourcePath:", v4, v5);
  if (v11)
    -[VTPhraseSpotter _safeConfigureWithAnalyzer:path:data:resourcePath:](self, "_safeConfigureWithAnalyzer:path:data:resourcePath:", v11, v4, v10, v5);

}

- (void)_resetCounters
{
  self->_samplecount = 0;
  *(_QWORD *)&self->_samplecountAtLastTriggerStart = 0;
  *(_QWORD *)&self->_sampleCountAtFirstChance = 0;
  *(_QWORD *)((char *)&self->_lastEventEnd + 1) = 0;
  self->_lastScore = -INFINITY;
  self->_earlyDetectTime = 0.0;
  self->_earlyDetecFiredMachTime = 0;
  self->_heartbeatCounter = 0;
}

- (int64_t)isFollowedBySpeech
{
  VTTranscriber *transcriber;
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  int64_t v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  transcriber = self->_transcriber;
  if (transcriber)
  {
    v3 = -[VTTranscriber isTriggerFollowedByWords](transcriber, "isTriggerFollowedByWords");
    v4 = VTLogContextFacilityVoiceTrigger;
    v5 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)buf = 0;
        v6 = 2;
        _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "isFollowedBySpeech: YES", buf, 2u);
      }
      else
      {
        return 2;
      }
    }
    else
    {
      if (v5)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_DEFAULT, "isFollowedBySpeech: NO", v10, 2u);
      }
      return 1;
    }
  }
  else
  {
    v7 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "isFollowedBySpeech: Unknown", v9, 2u);
    }
    return 0;
  }
  return v6;
}

- (void)startAudioCapture
{
  NSObject *ndetectQueue;
  _QWORD block[5];

  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__VTPhraseSpotter_startAudioCapture__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

- (void)stopAudioCapture
{
  NSObject *ndetectQueue;
  _QWORD block[5];

  ndetectQueue = self->_ndetectQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__VTPhraseSpotter_stopAudioCapture__block_invoke;
  block[3] = &unk_24C7F4C20;
  block[4] = self;
  dispatch_async(ndetectQueue, block);
}

- (BOOL)_shouldCreateAudioBuffer
{
  return 1;
}

- (id)assetDictionary
{
  NSString *resourcePath;
  NSString *v4;
  void *v5;
  NSObject *v6;
  NSString *configVersion;
  _QWORD v9[2];
  _QWORD v10[2];
  uint8_t buf[4];
  NSString *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  resourcePath = self->_resourcePath;
  if (resourcePath && (v4 = self->_configVersion) != 0)
  {
    v9[0] = CFSTR("resourcePath");
    v9[1] = CFSTR("configVersion");
    v10[0] = resourcePath;
    v10[1] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      configVersion = self->_configVersion;
      *(_DWORD *)buf = 138412546;
      v12 = resourcePath;
      v13 = 2112;
      v14 = configVersion;
      _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "VoiceTrigger Asset Not confgiured yet!. _resourcePath=%@, _configVersion=%@", buf, 0x16u);
    }
    v5 = 0;
  }
  return v5;
}

- (id)lastVoiceTriggerEventInfo
{
  return self->_lastVoiceTriggerEventInfo;
}

- (void)textDependentSpeakerRecognizer:(id)a3 hasSatScore:(float)a4
{
  VTTextDependentSpeakerRecognizer *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  VTTextDependentSpeakerRecognizer *v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (VTTextDependentSpeakerRecognizer *)a3;
  v7 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2050;
    v12 = a4;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "textDependentSpeakerRecognizer:hasSatScore: %{public}@: %{public}f, signalling now", (uint8_t *)&v9, 0x16u);
  }
  if (self->_satDetectionTdSr == v6)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_satDetectionTdSrSemaphore);
  }
  else
  {
    v8 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "ERR: textDependentSpeakerRecognizer called for unmanaged TD-SR instance: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

}

- (void)textDependentSpeakerRecognizer:(id)a3 failedWithError:(id)a4
{
  VTTextDependentSpeakerRecognizer *v6;
  id v7;
  NSObject *v8;
  VTTextDependentSpeakerRecognizer *satDetectionTdSr;
  _BOOL4 isRunningSATDetection;
  _BOOL4 isRunningSATEnrollment;
  VTTextDependentSpeakerRecognizer *v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  _BYTE v16[10];
  VTTextDependentSpeakerRecognizer *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (VTTextDependentSpeakerRecognizer *)a3;
  v7 = a4;
  v8 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    satDetectionTdSr = self->_satDetectionTdSr;
    v15 = 138543874;
    *(_QWORD *)v16 = v6;
    *(_WORD *)&v16[8] = 2114;
    v17 = satDetectionTdSr;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "TDSR-ERROR:: tdSR: %{public}@, _tdSrForSatDetection:%{public}@, ERROR: %{public}@", (uint8_t *)&v15, 0x20u);
    v8 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    isRunningSATDetection = self->_isRunningSATDetection;
    isRunningSATEnrollment = self->_isRunningSATEnrollment;
    v15 = 67240448;
    *(_DWORD *)v16 = isRunningSATDetection;
    *(_WORD *)&v16[4] = 1026;
    *(_DWORD *)&v16[6] = isRunningSATEnrollment;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "_isRunningSATDetection: %{public}d, _isRunningSATEnrollment: %{public}d", (uint8_t *)&v15, 0xEu);
    v8 = VTLogContextFacilityVoiceTrigger;
  }
  v12 = self->_satDetectionTdSr;
  v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v12 == v6)
  {
    if (v13)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "VTTextDependentSpeakerRecognizer failed with Error during DETECTION", (uint8_t *)&v15, 2u);
    }
    +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logTdPsrFailedDuringSATDetection");

  }
  else if (v13)
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "ERR: VTTextDependentSpeakerRecognizer failed for unmanaged TD-SR instance!!!", (uint8_t *)&v15, 2u);
  }

}

- (double)lastScore
{
  return self->_lastScore;
}

- (double)lastSupervecScore
{
  return self->_lastSupervecScore;
}

- (unsigned)lastTriggerType
{
  return self->_lastTriggerType;
}

- (int64_t)triggerCount
{
  return self->_triggerCount;
}

- (NSData)firstChanceAudioBuffer
{
  return (NSData *)objc_getProperty(self, a2, 704, 1);
}

- (NSDictionary)firstChanceVTEventInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 712, 1);
}

- (NSDate)firstChanceTriggeredDate
{
  return (NSDate *)objc_getProperty(self, a2, 720, 1);
}

- (unint64_t)samplerate
{
  return self->_samplerate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricMonitor, 0);
  objc_storeStrong((id *)&self->_lastVoiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_injectedAudioFilePath, 0);
  objc_storeStrong((id *)&self->_audioFileReader, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_firstChanceTriggeredDate, 0);
  objc_storeStrong((id *)&self->_firstChanceVTEventInfo, 0);
  objc_storeStrong((id *)&self->_firstChanceAudioBuffer, 0);
  objc_storeStrong((id *)&self->_corruptDetector, 0);
  objc_storeStrong((id *)&self->_nonceTriggerEvents, 0);
  objc_storeStrong((id *)&self->_satDetectionTdSrSemaphore, 0);
  objc_storeStrong((id *)&self->_satDetectionTdSr, 0);
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong((id *)&self->_triggerTokens, 0);
  objc_storeStrong((id *)&self->_recognizerConfigName, 0);
  objc_storeStrong((id *)&self->_desQueue, 0);
  objc_storeStrong((id *)&self->siriNotifications, 0);
  objc_storeStrong(&self->_assetChangedCallback, 0);
  objc_storeStrong((id *)&self->_assetChangedQueue, 0);
  objc_storeStrong((id *)&self->_ndetectQueue, 0);
  objc_storeStrong((id *)&self->_loggingQueue, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_audioBuffer, 0);
  objc_storeStrong((id *)&self->_retrainSamplingPolicy, 0);
  objc_storeStrong((id *)&self->_lastImplicitlyTrainedAudioFile, 0);
  objc_storeStrong((id *)&self->_resourcePath, 0);
  objc_storeStrong((id *)&self->_configVersion, 0);
  objc_storeStrong((id *)&self->_configLanguageCode, 0);
  objc_storeStrong((id *)&self->_configData, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_audioFileDir, 0);
  objc_storeStrong(&self->_readyForAnalyze, 0);
  objc_storeStrong(&self->_readyCompletion, 0);
  objc_storeStrong((id *)&self->_triggerPhrases, 0);
  objc_storeStrong((id *)&self->_analyzer, 0);
}

void __35__VTPhraseSpotter_stopAudioCapture__block_invoke(uint64_t a1)
{
  id v1;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 161) = 0;
  +[VTAudioFileLog sharedInstance](VTAudioFileLog, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopRecording");

}

void __36__VTPhraseSpotter_startAudioCapture__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 160))
  {
    *(_BYTE *)(v1 + 161) = 1;
    +[VTAudioFileLog sharedInstance](VTAudioFileLog, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startRecording");

  }
}

void __69__VTPhraseSpotter__safeConfigureWithAnalyzer_path_data_resourcePath___block_invoke(_QWORD *a1, int a2, int a3)
{
  VTTextDependentSpeakerRecognizer *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = -[VTTextDependentSpeakerRecognizer initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:]([VTTextDependentSpeakerRecognizer alloc], "initWithResourcePath:satDirectory:assetHash:shouldCreateModelDir:delegate:", a1[5], a1[6], a1[7], 0, a1[4]);
    v6 = a1[4];
    v7 = *(void **)(v6 + 592);
    *(_QWORD *)(v6 + 592) = v5;

    v8 = VTLogContextFacilityVoiceTrigger;
    if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v9 = *(_QWORD *)(a1[4] + 592);
    v15 = 138543362;
    v16 = v9;
    v10 = "TDSR:: _satRetrainingTdSr Success. Recreated _satDetectionTdSr: %{public}@";
  }
  else
  {
    v11 = a1[4];
    v12 = *(void **)(v11 + 592);
    *(_QWORD *)(v11 + 592) = 0;

    v8 = VTLogContextFacilityVoiceTrigger;
    if (!os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v13 = *(_QWORD *)(a1[4] + 592);
    v15 = 138543362;
    v16 = v13;
    v10 = "TDSR:: _satRetrainingTdSr FAILED. Setting _satDetectionTdSr to nil: %{public}@";
  }
  _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, 0xCu);
LABEL_7:
  if (a2)
  {
    notify_post("com.apple.voicetrigger.PHSProfileModified");
  }
  else
  {
    v14 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_20D965000, v14, OS_LOG_TYPE_DEFAULT, "Retraining failed, turning off SAT for workaround", (uint8_t *)&v15, 2u);
    }
    *(_BYTE *)(a1[4] + 241) = 0;
  }
}

void __53__VTPhraseSpotter__getNumberOfAudioFilesInDirectory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("wav"));

  if (v4)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

uint64_t __53__VTPhraseSpotter__configureWithConfig_resourcePath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_safeConfigureWithAnalyzer:path:data:resourcePath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __53__VTPhraseSpotter__handleAssetChangeForLanguageCode___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  const char *v17;
  void *v18;
  int v19;
  _BOOL4 v20;
  const char *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  char v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id WeakRetained;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  _QWORD block[5];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(v3 + 168);
  if (v2)
  {
    if ((objc_msgSend(v2, "isEqualToString:", v4) & 1) != 0)
      goto LABEL_7;
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(id *)(a1 + 32);
    v7 = *(void **)(v5 + 168);
    *(_QWORD *)(v5 + 168) = v6;
  }
  else
  {
    if (v4)
      goto LABEL_7;
    v7 = 0;
    *(_QWORD *)(v3 + 168) = CFSTR("en-US");
  }

LABEL_7:
  +[VTAssetManager sharedInstance](VTAssetManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetForLanguage:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_36;
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("config.txt"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("config_marsh.txt"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v12, 0);

    v15 = VTLogContextFacilityVoiceTrigger;
    v16 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138543362;
        v57 = v12;
        v17 = "::: using marsh config: %{public}@";
LABEL_16:
        _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    if (!v16)
      goto LABEL_23;
    *(_DWORD *)buf = 138543362;
    v57 = v12;
    v21 = "::: marsh config doesn't exist: %{public}@, defaulting to normal config";
LABEL_22:
    _os_log_impl(&dword_20D965000, v15, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    goto LABEL_23;
  }
  if (!+[VTUtilities isAlwaysOn](VTUtilities, "isAlwaysOn"))
    goto LABEL_24;
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("config_quasar.txt"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v12, 0);

  v15 = VTLogContextFacilityVoiceTrigger;
  v20 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (!v20)
      goto LABEL_23;
    *(_DWORD *)buf = 138543362;
    v57 = v12;
    v21 = "::: quasar config doesn't exist: %{public}@, defaulting to normal config";
    goto LABEL_22;
  }
  if (v20)
  {
    *(_DWORD *)buf = 138543362;
    v57 = v12;
    v17 = "::: using quasar config: %{public}@";
    goto LABEL_16;
  }
LABEL_17:
  v12 = v12;

  v11 = v12;
LABEL_23:

LABEL_24:
  if (v10 && (objc_msgSend(v9, "isAvailableLocally") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 176), "isEqualToString:", v11))
    {
      v22 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(void **)(*(_QWORD *)(a1 + 40) + 168);
        *(_DWORD *)buf = 138543362;
        v57 = v23;
        _os_log_impl(&dword_20D965000, v22, OS_LOG_TYPE_DEFAULT, "resource path for %{public}@ has not been updated.", buf, 0xCu);
      }
      if (+[VTVoiceProfileMigration checkIfMigrationNecessaryForCompatibilityVersion:forLanguageCode:](VTVoiceProfileMigration, "checkIfMigrationNecessaryForCompatibilityVersion:forLanguageCode:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168)))
      {
        v24 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_20D965000, v24, OS_LOG_TYPE_DEFAULT, "Performing Migration of Voice Profile...", buf, 2u);
        }
        +[VTVoiceProfileMigration migrateVoiceProfileToVersion:forLanguageCode:](VTVoiceProfileMigration, "migrateVoiceProfileToVersion:forLanguageCode:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168));
      }
    }
    else
    {
      objc_msgSend(v9, "languages");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168));

      v28 = VTLogContextFacilityVoiceTrigger;
      v29 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
      if ((v27 & 1) != 0)
      {
        if (v29)
        {
          *(_DWORD *)buf = 138543362;
          v57 = v10;
          _os_log_impl(&dword_20D965000, v28, OS_LOG_TYPE_DEFAULT, "::: resource path:  %{public}@", buf, 0xCu);
        }
        objc_msgSend(v9, "compatibilityVersion");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringValue");
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(_QWORD *)(a1 + 40);
        v33 = *(void **)(v32 + 200);
        *(_QWORD *)(v32 + 200) = v31;

        v34 = *(_QWORD *)(a1 + 40);
        if (*(_QWORD *)(v34 + 200))
        {
          objc_msgSend(v9, "version");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v34 = *(_QWORD *)(a1 + 40);
          if (v35)
          {
            v36 = *(void **)(v34 + 200);
            objc_msgSend(v9, "version");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "stringValue");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringByAppendingFormat:", CFSTR(".%@"), v38);
            v39 = objc_claimAutoreleasedReturnValue();
            v40 = *(_QWORD *)(a1 + 40);
            v41 = *(void **)(v40 + 200);
            *(_QWORD *)(v40 + 200) = v39;

            v34 = *(_QWORD *)(a1 + 40);
          }
        }
        if (*(_QWORD *)(v34 + 200))
        {
          objc_msgSend(v9, "footprint");
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42)
          {
            v43 = *(void **)(*(_QWORD *)(a1 + 40) + 200);
            objc_msgSend(v9, "footprint");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "stringByAppendingFormat:", CFSTR(".%@"), v44);
            v45 = objc_claimAutoreleasedReturnValue();
            v46 = *(_QWORD *)(a1 + 40);
            v47 = *(void **)(v46 + 200);
            *(_QWORD *)(v46 + 200) = v45;

          }
        }
        +[VTAggregator sharedAggregator](VTAggregator, "sharedAggregator");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setAssetString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 200));

        objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 192), *(id *)(*(_QWORD *)(a1 + 40) + 168));
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
        objc_msgSend(WeakRetained, "_configureWithConfig:resourcePath:", v11, v10);

        v50 = *(_QWORD *)(a1 + 40);
        v51 = *(NSObject **)(v50 + 448);
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __53__VTPhraseSpotter__handleAssetChangeForLanguageCode___block_invoke_473;
        block[3] = &unk_24C7F4C20;
        block[4] = v50;
        dispatch_async(v51, block);
      }
      else if (v29)
      {
        v52 = v28;
        objc_msgSend(v9, "languages");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 168);
        *(_DWORD *)buf = 138543618;
        v57 = v53;
        v58 = 2114;
        v59 = v54;
        _os_log_impl(&dword_20D965000, v52, OS_LOG_TYPE_DEFAULT, "::: new resource for locales %{public}@ is not applicable to the current locale(%{public}@)", buf, 0x16u);

      }
    }
  }
  else
  {
    v25 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v25, OS_LOG_TYPE_DEFAULT, "::: resource path NOT found, waiting to be notified...", buf, 2u);
    }
  }

LABEL_36:
}

uint64_t __53__VTPhraseSpotter__handleAssetChangeForLanguageCode___block_invoke_473(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v1 = *(_QWORD *)(*(_QWORD *)(result + 32) + 504);
  if (v1)
  {
    v2 = result;
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "VTPhraseSpotter is re-configured with new assets, calling back VTSM for model update", v4, 2u);
      v1 = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 504);
    }
    return (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  }
  return result;
}

void __54__VTPhraseSpotter__firstUnlockedAndSpringBoardStarted__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleAssetChangeForLanguageCode:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));

}

void __37__VTPhraseSpotter_requestFoceTrigger__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemUptime");
  v4 = v3;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 632);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

void __53__VTPhraseSpotter_didReceiveSiriSessionCancellation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  const __CFString *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 256))
  {
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "::: Removing the last implicit utterance", buf, 2u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v2 + 16), "deleteVectorIndex:", 0xFFFFFFFFLL);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 592), "deleteVectorAtIndex:", 0xFFFFFFFFLL);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = 0;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264))
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));

      if (v5)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264), 0);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "stringByDeletingPathExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("json"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeItemAtPath:error:", v8, 0);

      }
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 264);
      *(_QWORD *)(v12 + 264) = 0;

      if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264))
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264));

        if (v15)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeItemAtPath:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264), 0);

          v17 = *(_QWORD *)(a1 + 32);
          v18 = *(void **)(v17 + 264);
          *(_QWORD *)(v17 + 264) = 0;

        }
      }
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 136))
  {
    v19 = CFSTR("???");
    if (*(_QWORD *)(a1 + 40))
      v19 = *(const __CFString **)(a1 + 40);
    v31 = CFSTR("siriCancelReason");
    v32[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v20, 1, &v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v28;
    VTMakeTimestampedAudioLogFilenameWithPrefixAndSuffix(&stru_24C7F6FB8, CFSTR("-cancel.json"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v24 = (void *)VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        objc_msgSend(v22, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v26;
        _os_log_impl(&dword_20D965000, v25, OS_LOG_TYPE_DEFAULT, "::: Error writing out Siri cancellation meta: %{public}@", buf, 0xCu);

      }
    }
    objc_msgSend(v21, "writeToFile:atomically:", v23, 0);
    v27 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v23;
      _os_log_impl(&dword_20D965000, v27, OS_LOG_TYPE_DEFAULT, "::: Siri session cancellation data written into %{public}@", buf, 0xCu);
    }

  }
}

uint64_t __29__VTPhraseSpotter_setBypass___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 476) = *(_BYTE *)(result + 40);
  return result;
}

void __36__VTPhraseSpotter__logPHSDESRecord___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2D160]), "initWithBundleIdentifier:", CFSTR("com.apple.fides.phs"));
  if (objc_msgSend(v2, "isPermitted")
    && (objc_msgSend(v2, "shouldMakeRecordWithFrequency:", 100) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", **(_QWORD **)(a1 + 32), 4 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "saveRecordWithData:recordInfo:completion:", v3, MEMORY[0x24BDBD1B8], &__block_literal_global_427);

  }
  else
  {
    v4 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D965000, v4, OS_LOG_TYPE_INFO, "Skip creating PHS DES record because of lottery", v5, 2u);
    }
  }

}

void __36__VTPhraseSpotter__logPHSDESRecord___block_invoke_426(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "Error saving PHS DES record: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_INFO, "Saved PHS DES record with identifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void __56__VTPhraseSpotter__logDESRecord_result_isActualTrigger___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2D160]), "initWithBundleIdentifier:", CFSTR("com.apple.fides.borealis"));
  v3 = v2;
  if (*(_BYTE *)(a1 + 56))
    v4 = 1000;
  else
    v4 = 100;
  if ((objc_msgSend(v2, "shouldMakeRecordWithFrequency:", v4) & 1) != 0)
  {
    v10 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_desRecordFromTriggerData:sampleCount:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("triggerSampleCount"));

      if (*(_BYTE *)(a1 + 56))
        v8 = CFSTR("trigger");
      else
        v8 = CFSTR("near-miss");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("type"));
      objc_msgSend(v3, "saveRecordWithData:recordInfo:completion:", v5, v6, &__block_literal_global_422);

    }
  }
  else
  {
    v9 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_INFO, "Skip creating DES record because of lottery", buf, 2u);
    }
  }

}

void __56__VTPhraseSpotter__logDESRecord_result_isActualTrigger___block_invoke_420(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = VTLogContextFacilityVoiceTrigger;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "Error saving DES record: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_INFO))
  {
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_INFO, "Saved DES record with identifier: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

void __32__VTPhraseSpotter__logMetaData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(".wav"), CFSTR(".json"), 1, objc_msgSend(*(id *)(a1 + 32), "length") - 4, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, &v15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  objc_msgSend(v4, "writeToFile:atomically:", v2, 0);

  v6 = VTLogContextFacilityVoiceTrigger;
  if (v5 && os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "::: Error writing out metadata: %{public}@", buf, 0xCu);

    v6 = VTLogContextFacilityVoiceTrigger;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 64))
      v9 = CFSTR("Trigger Event");
    else
      v9 = CFSTR("Nearly Triggered Event");
    v10 = *(void **)(a1 + 48);
    v11 = v6;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("triggerScore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v13 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138543874;
    v17 = v9;
    v18 = 2050;
    v19 = v14;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_20D965000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ [score %{public}7.5f]: %{public}@", buf, 0x20u);

  }
}

void __44__VTPhraseSpotter__createVTEventInfoString___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[30];

  v2[29] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("configVersion");
  v2[1] = CFSTR("languageCode");
  v2[2] = CFSTR("isSecondChance");
  v2[3] = CFSTR("triggerScore");
  v2[4] = CFSTR("effectiveThreshold");
  v2[5] = CFSTR("threshold");
  v2[6] = CFSTR("firstPassScore");
  v2[7] = CFSTR("recognizerScore");
  v2[8] = CFSTR("recognizerThresholdOffset");
  v2[9] = CFSTR("recognizerWaitTime");
  v2[10] = CFSTR("recognizerScoreScaleFactor");
  v2[11] = CFSTR("tdSpeakerRecognizerScore");
  v2[12] = CFSTR("tdSpeakerRecognizerCombinedScore");
  v2[13] = CFSTR("tdSpeakerRecognizerCombinedThreshold");
  v2[14] = CFSTR("tdSpeakerRecognizerCombinationWeight");
  v2[15] = CFSTR("satTriggered");
  v2[16] = CFSTR("satScore");
  v2[17] = CFSTR("satThreshold");
  v2[18] = CFSTR("satNumTrainingUtts");
  v2[19] = CFSTR("earlyDetectFiredTime");
  v2[20] = CFSTR("triggerStartTime");
  v2[21] = CFSTR("triggerEndTime");
  v2[22] = CFSTR("triggerFiredTime");
  v2[23] = CFSTR("triggerFireSeconds");
  v2[24] = CFSTR("extraSamplesAtStart");
  v2[25] = CFSTR("onBatteryPower");
  v2[26] = CFSTR("uptime");
  v2[27] = CFSTR("downtime");
  v2[28] = CFSTR("configDataHash");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 29);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_createVTEventInfoString__printingWhiteList;
  _createVTEventInfoString__printingWhiteList = v0;

}

void __39__VTPhraseSpotter__logPrepareProperty___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "stringByReplacingOccurrencesOfString:withString:", CFSTR(".wav"), CFSTR(".json"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    v6 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "::: Error writing out prepare property: %{public}@", buf, 0xCu);

    }
  }
  objc_msgSend(v4, "writeToFile:atomically:", v2, 0);

}

void __35__VTPhraseSpotter__logCorruptAudio__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "stringByReplacingOccurrencesOfString:withString:", CFSTR(".wav"), CFSTR(".json"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    v6 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_20D965000, v7, OS_LOG_TYPE_DEFAULT, "::: Error writing out prepare property: %{public}@", buf, 0xCu);

    }
  }
  objc_msgSend(v4, "writeToFile:atomically:", v2, 0);

}

uint64_t __43__VTPhraseSpotter__analyzeResetWithOption___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  if (+[VTUtilities VTIsHorseman](VTUtilities, "VTIsHorseman"))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
LABEL_5:
    result = objc_msgSend(v2, "reset");
    goto LABEL_6;
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (*(_BYTE *)(a1 + 40) != 1)
    goto LABEL_5;
  result = objc_msgSend(v2, "resetBest");
LABEL_6:
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416) = 0xFFF0000000000000;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 52) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 424) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 664) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 400) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408) = 0;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 372) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 376) = 0;
  return result;
}

uint64_t __34__VTPhraseSpotter__analyzeEvents___block_invoke_372(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getSATVectorCount");
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 477))
  {
    v4 = *(void **)(v3 + 592);
    if (!v4)
    {
      v5 = *(void **)(v3 + 16);
      goto LABEL_9;
    }
    if (!*(_QWORD *)(a1 + 40) && objc_msgSend(v4, "tdPsrCanProcessRequest"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "updateSAT");
      v5 = *(void **)(*(_QWORD *)(a1 + 32) + 592);
LABEL_9:
      objc_msgSend(v5, "updateSAT");
      goto LABEL_10;
    }
    v6 = (void *)VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 592);
      v9 = v6;
      v11 = 134349570;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      v15 = 1026;
      v16 = objc_msgSend(v8, "tdPsrCanProcessRequest");
      _os_log_impl(&dword_20D965000, v9, OS_LOG_TYPE_DEFAULT, "Not updating SAT & PSR models: psrTDTimedOut: %{public}ld, _satDetectionTdSr: %{public}@, tdPsrCanProcessRequest: %{public}d", (uint8_t *)&v11, 0x1Cu);

    }
  }
LABEL_10:
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getSATVectorCount");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = (_DWORD)result - v2 == 1;
  return result;
}

void __34__VTPhraseSpotter__analyzeEvents___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTLogContextFacilityVoiceTrigger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "AFSiriActivationBuiltInMicVoiceTriggerPrewarm success", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "AFSiriActivationBuiltInMicVoiceTriggerPrewarm failed : %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

void __41__VTPhraseSpotter__storeFirstChanceAudio__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
  if (v2)
  {
    v4 = 0;
    v3 = (void *)objc_msgSend(v2, "copyBufferWithNumSamplesCopiedIn:", &v4);
    if (v3)
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 704), v3);

  }
}

uint64_t __44__VTPhraseSpotter__getSecondChanceEffective__block_invoke(uint64_t result)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  double v4;
  double v5;
  BOOL v6;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 377))
  {
    v1 = result;
    result = +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
    v3 = *(_QWORD *)(v1 + 32);
    if (v2 > 0.0
      && (v4 = *(double *)(v3 + 384), v4 > 0.0)
      && ((v5 = v2 - v4, v5 > 0.0) ? (v6 = v5 < 8.0) : (v6 = 0), v6))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
    }
    else
    {
      *(_BYTE *)(v3 + 377) = 0;
    }
  }
  return result;
}

uint64_t __38__VTPhraseSpotter__cancelSecondChance__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 377) = 0;
  return result;
}

uint64_t __35__VTPhraseSpotter__setSecondChance__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 377) = 1;
  result = +[VTUtilities systemUpTime](VTUtilities, "systemUpTime");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384) = v3;
  return result;
}

uint64_t __27__VTPhraseSpotter_analyze___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t result;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v20;
  int v21;
  int v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (unint64_t)*(unsigned int *)(a1 + 60) >> 1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  if (v4 && *(_BYTE *)(v3 + 473) && !*(_BYTE *)(v3 + 476) && !*(_BYTE *)(v3 + 792))
  {
    objc_msgSend(v4, "analyzeWavData:length:", *(_QWORD *)(a1 + 64), v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "getAnalyzedResult:", 0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 312);
    if (v6)
    {
      objc_msgSend(v6, "addSamples:numSamples:", *(_QWORD *)(a1 + 64), v2);
      v5 = *(_QWORD *)(a1 + 32);
    }
    if (*(_BYTE *)(v5 + 477) && !*(_BYTE *)(v5 + 240))
    {
      v7 = *(void **)(v5 + 592);
      if (v7)
      {
        objc_msgSend(v7, "processAudio:numSamples:", *(_QWORD *)(a1 + 64), v2);
      }
      else
      {
        v8 = VTLogContextFacilityVoiceTrigger;
        if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
        {
          v22 = 138412546;
          v23 = 0.0;
          v24 = 1024;
          LODWORD(v25) = v2;
          _os_log_impl(&dword_20D965000, v8, OS_LOG_TYPE_DEFAULT, "Unable to feed audio to TDSR: _satDetectionTdSr=%@, missedSamples=%d", (uint8_t *)&v22, 0x12u);
        }
      }
    }
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v9 + 529))
    {
      objc_msgSend(*(id *)(v9 + 584), "recognizeWavData:length:", *(_QWORD *)(a1 + 64), v2);
      v9 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v9 + 648), "analyze:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v3 = *(_QWORD *)(a1 + 32);
  }
  result = objc_msgSend(*(id *)(v3 + 632), "count");
  if (result)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemUptime");
    v13 = v12;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    v17 = VTLogContextFacilityVoiceTrigger;
    v18 = os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT);
    if (v13 - v16 > 0.0 && v13 - v16 < 7.0)
    {
      if (v18)
      {
        v22 = 134349312;
        v23 = v16;
        v24 = 2050;
        v25 = v13;
        _os_log_impl(&dword_20D965000, v17, OS_LOG_TYPE_DEFAULT, "nonceTrigger time::: received %{public}f vs. current %{public}f", (uint8_t *)&v22, 0x16u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "removeLastObject");
    }
    else
    {
      if (v18)
      {
        v22 = 134349312;
        v23 = v16;
        v24 = 2050;
        v25 = v13;
        _os_log_impl(&dword_20D965000, v17, OS_LOG_TYPE_DEFAULT, "nonceTrigger is outdated::: received %{public}f vs. current %{public}f", (uint8_t *)&v22, 0x16u);
      }
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "removeAllObjects");
    }
  }
  v20 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v20 + 477))
  {
    v21 = *(_DWORD *)(v20 + 480);
    if ((v21 & 0x80000000) == 0)
      *(_DWORD *)(v20 + 480) = v21 - v2;
  }
  return result;
}

void __27__VTPhraseSpotter_analyze___block_invoke_339(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 531))
  {
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Received first recognition result...", v5, 2u);
      v1 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 531) = 1;
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 530))
      *(_DWORD *)(v4 + 480) = -10101;
  }
}

uint64_t __27__VTPhraseSpotter_analyze___block_invoke_340(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = VTLogContextFacilityVoiceTrigger;
  if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D965000, v2, OS_LOG_TYPE_DEFAULT, "Stopping audio feed to recognizer per dispatch timer", v4, 2u);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 584), "endAudio");
}

void __48__VTPhraseSpotter__voiceTriggerEnabledDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 448);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__VTPhraseSpotter__voiceTriggerEnabledDidChange__block_invoke_2;
  block[3] = &unk_24C7F4C20;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __48__VTPhraseSpotter__voiceTriggerEnabledDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  _BYTE *v5;
  NSObject *v6;
  uint8_t v7[16];

  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "voiceTriggerEnabled");

  v4 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 475) != v3)
  {
    *(_BYTE *)(v4 + 475) = v3;
    v5 = *(_BYTE **)(a1 + 32);
    if (v5[475])
    {
      v6 = VTLogContextFacilityVoiceTrigger;
      if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_20D965000, v6, OS_LOG_TYPE_DEFAULT, "VoiceTrigger is enabled, reload phrase spotter", v7, 2u);
        v5 = *(_BYTE **)(a1 + 32);
      }
      objc_msgSend(v5, "_safeReconfig");
    }
  }
}

void __49__VTPhraseSpotter__phraseSpotterEnabledDidChange__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 448);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__VTPhraseSpotter__phraseSpotterEnabledDidChange__block_invoke_2;
  block[3] = &unk_24C7F4C20;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __49__VTPhraseSpotter__phraseSpotterEnabledDidChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  _BYTE *v5;

  +[VTPreferences sharedPreferences](VTPreferences, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "phraseSpotterEnabled");

  v4 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 473) != v3)
  {
    *(_BYTE *)(v4 + 473) = v3;
    v5 = *(_BYTE **)(a1 + 32);
    if (v5[473])
      objc_msgSend(v5, "_safeReconfig");
  }
}

void __42__VTPhraseSpotter__performReadyCompletion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 32))
  {
    v3 = MEMORY[0x212BACF9C]();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
    v6 = 32;
  }
  else
  {
    if (!*(_QWORD *)(v2 + 40))
      goto LABEL_6;
    v7 = MEMORY[0x212BACF9C]();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
    v6 = 40;
  }

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + v6);
  *(_QWORD *)(v9 + v6) = 0;

LABEL_6:
  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v11)
  {
    v12 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20D965000, v12, OS_LOG_TYPE_DEFAULT, "calling back to start feeding us the samples", v13, 2u);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    (*(void (**)(uint64_t))(v11 + 16))(v11);
  }
}

void *__30__VTPhraseSpotter__commonInit__block_invoke(uint64_t a1)
{
  void *result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reset");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 424) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 664) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_resetCounters");
  result = *(void **)(*(_QWORD *)(a1 + 32) + 312);
  if (result)
    return (void *)objc_msgSend(result, "reset");
  return result;
}

void __32__VTPhraseSpotter__initDetector__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_firstUnlockedAndSpringBoardStarted");
    WeakRetained = v4;
  }

}

void __55__VTPhraseSpotter_prepareWithProperty_readyCompletion___block_invoke_316(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[16];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 531))
  {
    v3 = VTLogContextFacilityVoiceTrigger;
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_20D965000, v3, OS_LOG_TYPE_DEFAULT, "Received first recognition result...", v5, 2u);
      v1 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v1 + 531) = 1;
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v4 + 530))
      *(_DWORD *)(v4 + 480) = -10101;
  }
}

void __55__VTPhraseSpotter_prepareWithProperty_readyCompletion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = VTLogContextFacilityVoiceTrigger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_20D965000, v5, OS_LOG_TYPE_DEFAULT, "AFSiriActivationBuiltInMicVoiceTriggerPrewarm success", (uint8_t *)&v8, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)VTLogContextFacilityVoiceTrigger, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_error_impl(&dword_20D965000, v6, OS_LOG_TYPE_ERROR, "AFSiriActivationBuiltInMicVoiceTriggerPrewarm failed : %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

uint64_t __56__VTPhraseSpotter_initWithLanguageCodeForSATEnrollment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "reset");
}

void __62__VTPhraseSpotter_initWithHardwareSampleRate_readyCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

+ (void)initialize
{
  if (VTLogInitIfNeeded_once != -1)
    dispatch_once(&VTLogInitIfNeeded_once, &__block_literal_global_21_6307);
}

+ (id)currentSpotter
{
  return (id)_currentSpotter;
}

@end
