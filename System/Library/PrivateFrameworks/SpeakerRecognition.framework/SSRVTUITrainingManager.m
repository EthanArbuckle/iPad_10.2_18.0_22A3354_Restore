@implementation SSRVTUITrainingManager

- (SSRVoiceProfile)voiceProfile
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (!self->_shouldTrainViaXPC)
    return self->_profile;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1964;
  v10 = __Block_byref_object_dispose__1965;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__SSRVTUITrainingManager_voiceProfile__block_invoke;
  v5[3] = &unk_24CC864E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SSRVoiceProfile *)v3;
}

- (SSRVTUITrainingManager)initWithLocaleIdentifier:(id)a3 withAudioSession:(id)a4 withAppDomain:(id)a5
{
  return -[SSRVTUITrainingManager initWithLocaleIdentifier:withAudioSession:withAppDomain:shouldTrainViaXPC:](self, "initWithLocaleIdentifier:withAudioSession:withAppDomain:shouldTrainViaXPC:", a3, a4, a5, 0);
}

- (SSRVTUITrainingManager)initWithLocaleIdentifier:(id)a3 withAudioSession:(id)a4 withAppDomain:(id)a5 shouldTrainViaXPC:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  SSRVTUITrainingManager *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  SSRVTUITrainingServiceClient *v16;
  SSRVTUITrainingServiceClient *trainingServiceClient;
  CSVTUIKeywordDetector *keywordDetector;
  id cleanupCompletion;
  CSDispatchGroup *v20;
  CSDispatchGroup *didStopWaitingGroup;
  id v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  CSAudioZeroCounter *audioZeroCounter;
  SSRVoiceProfile *v27;
  SSRVoiceProfile *profile;
  objc_super v30;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SSRVTUITrainingManager;
  v13 = -[SSRVTUITrainingManager init](&v30, sel_init);
  if (v13)
  {
    SSRLogInitIfNeeded();
    v14 = dispatch_queue_create("com.apple.VoiceTriggerUI.TrainingManager", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    v13->_shouldTrainViaXPC = v6;
    if (v6)
    {
      v16 = -[SSRVTUITrainingServiceClient initWithDelegate:]([SSRVTUITrainingServiceClient alloc], "initWithDelegate:", v13);
      trainingServiceClient = v13->_trainingServiceClient;
      v13->_trainingServiceClient = v16;

      -[SSRVTUITrainingServiceClient setupWithLocaleID:appDomain:](v13->_trainingServiceClient, "setupWithLocaleID:appDomain:", v10, v12);
    }
    else
    {
      -[SSRVTUITrainingManager setLocaleIdentifier:](v13, "setLocaleIdentifier:", v10);
      objc_storeStrong((id *)&v13->_audioSession, a4);
      -[CSVTUIAudioSession setDelegate:](v13->_audioSession, "setDelegate:", v13);
      v13->_suspendAudio = 0;
      keywordDetector = v13->_keywordDetector;
      v13->_keywordDetector = 0;

      cleanupCompletion = v13->_cleanupCompletion;
      v13->_cleanupCompletion = 0;

      v20 = (CSDispatchGroup *)objc_alloc_init(MEMORY[0x24BE28408]);
      didStopWaitingGroup = v13->_didStopWaitingGroup;
      v13->_didStopWaitingGroup = v20;

      v22 = objc_alloc(MEMORY[0x24BE283E8]);
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
      v25 = objc_msgSend(v22, "initWithToken:sampleRate:numChannels:", v24, 1);
      audioZeroCounter = v13->_audioZeroCounter;
      v13->_audioZeroCounter = (CSAudioZeroCounter *)v25;

      v27 = -[SSRVoiceProfile initNewVoiceProfileWithLocale:withAppDomain:]([SSRVoiceProfile alloc], "initNewVoiceProfileWithLocale:withAppDomain:", v10, v12);
      profile = v13->_profile;
      v13->_profile = v27;

    }
  }

  return v13;
}

- (id)updateTrainingManagerForDevice:(unint64_t)a3 trainingDeviceUUIDList:(id)a4
{
  id v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_INFO))
  {
    v8 = 136315651;
    v9 = "-[SSRVTUITrainingManager updateTrainingManagerForDevice:trainingDeviceUUIDList:]";
    v10 = 2048;
    v11 = a3;
    v12 = 2113;
    v13 = v5;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_INFO, "%s Remote device type: %zu, Remote device UUID list: %{private}@", (uint8_t *)&v8, 0x20u);
  }

  return 0;
}

- (void)setLocaleIdentifier:(id)a3
{
  id v5;
  void *v6;
  NSObject *queue;
  NSString **p_locale;
  void *v9;
  CSAsset *v10;
  CSAsset *currentAsset;
  os_log_t *v12;
  NSObject *v13;
  CSAsset *v14;
  CSAsset *v15;
  NSObject *v16;
  CSAsset *v17;
  CSAsset *v18;
  NSString *v19;
  NSString *vtAssetConfigVersion;
  NSObject *v21;
  NSString *v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  CSAsset *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (self->_shouldTrainViaXPC)
  {
    queue = self->_queue;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __46__SSRVTUITrainingManager_setLocaleIdentifier___block_invoke;
    v23[3] = &unk_24CC85EE8;
    v23[4] = self;
    v24 = v5;
    dispatch_async(queue, v23);

  }
  else
  {
    p_locale = &self->_locale;
    objc_storeStrong((id *)&self->_locale, a3);
    +[SSRAssetManager sharedManager](SSRAssetManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "installedAssetOfType:forLanguage:", 0, self->_locale);
    v10 = (CSAsset *)objc_claimAutoreleasedReturnValue();
    currentAsset = self->_currentAsset;
    self->_currentAsset = v10;

    v12 = (os_log_t *)MEMORY[0x24BE284B8];
    if (!self->_currentAsset)
    {
      v13 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[SSRVTUITrainingManager setLocaleIdentifier:]";
        _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s Cannot find voicetrigger asset from asset manager, let's fallback to asset in the framework", buf, 0xCu);
      }
      objc_msgSend(MEMORY[0x24BE28388], "defaultFallBackAssetForVoiceTrigger");
      v14 = (CSAsset *)objc_claimAutoreleasedReturnValue();
      v15 = self->_currentAsset;
      self->_currentAsset = v14;

    }
    v16 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_currentAsset;
      *(_DWORD *)buf = 136315394;
      v26 = "-[SSRVTUITrainingManager setLocaleIdentifier:]";
      v27 = 2114;
      v28 = v17;
      _os_log_impl(&dword_2117D4000, v16, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerAsset found: %{public}@", buf, 0x16u);
    }
    if (self->_keywordDetector)
      -[SSRVTUITrainingManager createKeywordDetector](self, "createKeywordDetector");
    v18 = self->_currentAsset;
    if (v18)
    {
      -[CSAsset configVersion](v18, "configVersion");
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      vtAssetConfigVersion = self->_vtAssetConfigVersion;
      self->_vtAssetConfigVersion = v19;

    }
    v21 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *p_locale;
      *(_DWORD *)buf = 136315394;
      v26 = "-[SSRVTUITrainingManager setLocaleIdentifier:]";
      v27 = 2114;
      v28 = (CSAsset *)v22;
      _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s Locale: [%{public}@]", buf, 0x16u);
    }
  }

}

- (BOOL)createKeywordDetector
{
  void *v3;
  CSVoiceTriggerUserSelectedPhrase *v4;
  uint64_t v5;
  CSVTUITwoPassKeywordDetector *v6;
  NSObject *v7;
  BOOL v8;
  CSVTUIKeywordDetector *keywordDetector;
  CSVTUIKeywordDetector *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->_locale)
  {
    objc_msgSend(MEMORY[0x24BE284B0], "decodeConfigFrom:forFirstPassSource:", self->_currentAsset, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "useRecognizerCombination")
      && +[SSRUtils isMphVTUIKeywordDetectorSupportedPlatform](SSRUtils, "isMphVTUIKeywordDetectorSupportedPlatform"))
    {
      if (objc_msgSend(MEMORY[0x24BE28488], "supportsMphForLanguageCode:", self->_locale))
      {
        v4 = -[CSVoiceTriggerUserSelectedPhrase initWithEndpointId:]([CSVoiceTriggerUserSelectedPhrase alloc], "initWithEndpointId:", 0);
        v5 = -[CSVoiceTriggerUserSelectedPhrase multiPhraseSelected](v4, "multiPhraseSelected");

      }
      else
      {
        v5 = 0;
      }
      v6 = -[CSVTUITwoPassKeywordDetector initWithAsset:supportMph:]([CSVTUITwoPassKeywordDetector alloc], "initWithAsset:supportMph:", self->_currentAsset, v5);
    }
    else
    {
      v6 = -[CSVTUIKeywordDetector initWithAsset:]([CSVTUIKeywordDetector alloc], "initWithAsset:", self->_currentAsset);
    }
    keywordDetector = self->_keywordDetector;
    self->_keywordDetector = &v6->super;

    v10 = self->_keywordDetector;
    v8 = v10 != 0;
    if (!v10)
    {
      v11 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        v13 = 136315138;
        v14 = "-[SSRVTUITrainingManager createKeywordDetector]";
        _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s Creation of Keyword Detector failed.", (uint8_t *)&v13, 0xCu);
      }
    }

  }
  else
  {
    v7 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[SSRVTUITrainingManager createKeywordDetector]";
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s No locale set when creating phrase spotter.", (uint8_t *)&v13, 0xCu);
    }
    return 0;
  }
  return v8;
}

- (void)createSpeechRecognizer
{
  SFSpeechRecognizer *speechRecognizer;
  id v4;
  SFSpeechRecognizer *v5;
  SFSpeechRecognizer *v6;
  id v7;

  speechRecognizer = self->_speechRecognizer;
  if (speechRecognizer)
  {
    self->_speechRecognizer = 0;

  }
  v4 = objc_alloc(MEMORY[0x24BDE9E38]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", self->_locale);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (SFSpeechRecognizer *)objc_msgSend(v4, "initWithLocale:", v7);
  v6 = self->_speechRecognizer;
  self->_speechRecognizer = v5;

}

- (void)prepareWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke;
  v12[3] = &unk_24CC84C90;
  v13 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x212BE197C](v12);
  queue = self->_queue;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_3;
  block[3] = &unk_24CC86148;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(queue, block);

}

- (BOOL)_stopAudioSession
{
  CSVTUIAudioSession *audioSession;

  audioSession = self->_audioSession;
  if (audioSession)
  {
    LODWORD(audioSession) = -[CSVTUIAudioSession isRecording](audioSession, "isRecording");
    if ((_DWORD)audioSession)
    {
      -[CSVTUIAudioSession stopRecording](self->_audioSession, "stopRecording");
      LOBYTE(audioSession) = 1;
    }
  }
  return (char)audioSession;
}

- (void)_destroyAudioSession
{
  CSVTUIAudioSession *audioSession;

  audioSession = self->_audioSession;
  if (audioSession)
    -[CSVTUIAudioSession releaseAudioSession](audioSession, "releaseAudioSession");
}

- (id)cleanupWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *queue;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  _QWORD block[5];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[SSRVTUITrainingManager cleanupWithCompletion:]";
    v27 = 2082;
    v28 = "-[SSRVTUITrainingManager cleanupWithCompletion:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}s Called", buf, 0x16u);
  }
  v6 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke;
  v23[3] = &unk_24CC84CB8;
  v7 = v4;
  v24 = v7;
  v8 = (void *)MEMORY[0x212BE197C](v23);
  v9 = v8;
  if (self->_shouldTrainViaXPC)
  {
    queue = self->_queue;
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_21;
    block[3] = &unk_24CC86148;
    block[4] = self;
    v22 = v8;
    dispatch_async(queue, block);
    v11 = v22;
  }
  else
  {
    v12 = CSIsOSX();
    v13 = self->_queue;
    if (v12)
    {
      v20[0] = v6;
      v20[1] = 3221225472;
      v20[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_3;
      v20[3] = &unk_24CC864B8;
      v20[4] = self;
      dispatch_async(v13, v20);
      v14 = self->_queue;
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_23;
      v18[3] = &unk_24CC86148;
      v18[4] = self;
      v19 = v9;
      dispatch_async(v14, v18);
      v11 = v19;
    }
    else
    {
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_24;
      v16[3] = &unk_24CC86148;
      v16[4] = self;
      v17 = v9;
      dispatch_async(v13, v16);
      v11 = v17;
    }
  }

  return 0;
}

- (void)destroySpeakerTrainer
{
  CSVTUIKeywordDetector *keywordDetector;

  keywordDetector = self->_keywordDetector;
  self->_keywordDetector = 0;

}

- (int64_t)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  int64_t v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__SSRVTUITrainingManager_trainUtterance_shouldUseASR_completion___block_invoke;
  v12[3] = &unk_24CC84CE0;
  v13 = v8;
  v9 = v8;
  v10 = -[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:](self, "trainUtterance:shouldUseASR:mhUUID:completionWithResult:", a3, v5, 0, v12);

  return v10;
}

- (int64_t)trainUtterance:(int64_t)a3 shouldUseASR:(BOOL)a4 mhUUID:(id)a5 completionWithResult:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  os_log_t *v12;
  NSObject *v13;
  NSObject *queue;
  int64_t v15;
  id v16;
  NSObject *v17;
  int64_t sessionNumber;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23[2];
  BOOL v24;
  id location;
  _QWORD block[5];
  id v27;
  id v28;
  int64_t v29;
  BOOL v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v7 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = a6;
  v12 = (os_log_t *)MEMORY[0x24BE284B8];
  v13 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]";
    v33 = 2050;
    v34 = a3;
    v35 = 1026;
    v36 = v7;
    _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s BEGIN num:%{public}ld use:%{public}d", buf, 0x1Cu);
  }
  if (self->_shouldTrainViaXPC)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke;
    block[3] = &unk_24CC84D30;
    block[4] = self;
    v29 = a3;
    v30 = v7;
    v27 = v10;
    v28 = v11;
    dispatch_async(queue, block);

    v15 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_4;
    v20[3] = &unk_24CC84D58;
    v20[4] = self;
    objc_copyWeak(v23, &location);
    v21 = v10;
    v16 = v11;
    v24 = v7;
    v22 = v16;
    v23[1] = (id)a3;
    dispatch_async(MEMORY[0x24BDAC9B8], v20);
    v17 = *v12;
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
    {
      sessionNumber = self->_sessionNumber;
      *(_DWORD *)buf = 136315394;
      v32 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]";
      v33 = 2050;
      v34 = sessionNumber;
      _os_log_impl(&dword_2117D4000, v17, OS_LOG_TYPE_DEFAULT, "%s _sessionNumber [%{public}ld]", buf, 0x16u);
    }
    v15 = self->_sessionNumber;

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)_playSoundsEffect:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  AVAudioPlayer *v15;
  id v16;
  AVAudioPlayer *audioPlayer;
  AVAudioPlayer *v18;
  NSObject *v19;
  NSObject *v20;
  os_log_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VoiceTriggerTraining_FX_%ld"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLForResource:withExtension:", v6, CFSTR("caf"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (os_log_t *)MEMORY[0x24BE28368];
  v9 = (void *)*MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    objc_msgSend(v7, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Request Play SoundFileURL = %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if ((v14 & 1) != 0)
  {
    v24 = 0;
    v15 = (AVAudioPlayer *)objc_msgSend(objc_alloc(MEMORY[0x24BDB1848]), "initWithContentsOfURL:error:", v7, &v24);
    v16 = v24;
    audioPlayer = self->_audioPlayer;
    self->_audioPlayer = v15;

    v18 = self->_audioPlayer;
    if (v18)
    {
      if (!-[AVAudioPlayer play](v18, "play"))
      {
        v19 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v26 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
          _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s Failed to play sounds file", buf, 0xCu);
        }
      }
    }
    else
    {
      v21 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        v22 = v21;
        objc_msgSend(v16, "localizedDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v26 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
        v27 = 2112;
        v28 = v23;
        _os_log_error_impl(&dword_2117D4000, v22, OS_LOG_TYPE_ERROR, "%s Failed to create audio player : %@", buf, 0x16u);

      }
    }

  }
  else
  {
    v20 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[SSRVTUITrainingManager _playSoundsEffect:]";
      _os_log_error_impl(&dword_2117D4000, v20, OS_LOG_TYPE_ERROR, "%s Unable to find playback resource file", buf, 0xCu);
    }
  }

}

- (void)playSoundsEffect:(int64_t)a3
{
  _BOOL4 shouldTrainViaXPC;
  NSObject *queue;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  shouldTrainViaXPC = self->_shouldTrainViaXPC;
  queue = self->_queue;
  if (shouldTrainViaXPC)
  {
    v9 = MEMORY[0x24BDAC760];
    v6 = __43__SSRVTUITrainingManager_playSoundsEffect___block_invoke;
    v7 = &v9;
  }
  else
  {
    v8 = MEMORY[0x24BDAC760];
    v6 = __43__SSRVTUITrainingManager_playSoundsEffect___block_invoke_2;
    v7 = &v8;
  }
  v7[1] = 3221225472;
  v7[2] = (uint64_t)v6;
  v7[3] = (uint64_t)&unk_24CC84D80;
  v7[4] = (uint64_t)self;
  v7[5] = a3;
  dispatch_async(queue, v7);
}

- (BOOL)cancelTrainingForID:(int64_t)a3
{
  NSObject *v5;
  NSObject *queue;
  _QWORD *v7;
  _QWORD block[5];
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SSRVTUITrainingManager cancelTrainingForID:]";
    v13 = 2082;
    v14 = "-[SSRVTUITrainingManager cancelTrainingForID:]";
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}s Canceling Training", buf, 0x16u);
  }
  if (self->_shouldTrainViaXPC)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46__SSRVTUITrainingManager_cancelTrainingForID___block_invoke;
    v10[3] = &unk_24CC84D80;
    v10[4] = self;
    v10[5] = a3;
    v7 = v10;
  }
  else
  {
    -[CSVTUITrainingSession closeSessionWithStatus:successfully:](self->_currentTrainingSession, "closeSessionWithStatus:successfully:", 6, 0);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__SSRVTUITrainingManager_cancelTrainingForID___block_invoke_2;
    block[3] = &unk_24CC864B8;
    block[4] = self;
    v7 = block;
  }
  dispatch_async(queue, v7);
  return 1;
}

- (void)closeSessionBeforeStartWithStatus:(int)a3 successfully:(BOOL)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  int v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SSRVTUITrainingManager closeSessionBeforeStartWithStatus:successfully:withCompletion:]";
    v18 = 1026;
    v19 = a3;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Called with status : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __88__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_withCompletion___block_invoke;
  v12[3] = &unk_24CC84DA8;
  v13 = v8;
  v14 = a3;
  v15 = a4;
  v11 = v8;
  dispatch_async(queue, v12);

}

- (void)closeSessionBeforeStartWithStatus:(int)a3 successfully:(BOOL)a4 completionWithResult:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  int v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[SSRVTUITrainingManager closeSessionBeforeStartWithStatus:successfully:completionWithResult:]";
    v18 = 1026;
    v19 = a3;
    _os_log_impl(&dword_2117D4000, v9, OS_LOG_TYPE_DEFAULT, "%s Called with status : %{public}d", buf, 0x12u);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_completionWithResult___block_invoke;
  v12[3] = &unk_24CC84DA8;
  v14 = a3;
  v13 = v8;
  v15 = a4;
  v11 = v8;
  dispatch_async(queue, v12);

}

- (unint64_t)audioSource
{
  _BOOL4 shouldTrainViaXPC;
  NSObject *queue;
  _QWORD *v5;
  unint64_t v6;
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 6;
  shouldTrainViaXPC = self->_shouldTrainViaXPC;
  queue = self->_queue;
  if (shouldTrainViaXPC)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __37__SSRVTUITrainingManager_audioSource__block_invoke;
    v9[3] = &unk_24CC864E8;
    v9[4] = self;
    v9[5] = &v10;
    v5 = v9;
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __37__SSRVTUITrainingManager_audioSource__block_invoke_3;
    v8[3] = &unk_24CC864E8;
    v8[4] = self;
    v8[5] = &v10;
    v5 = v8;
  }
  dispatch_sync(queue, v5);
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (unint64_t)_audioSource
{
  CSVTUIAudioSession *audioSession;

  audioSession = self->_audioSession;
  if (audioSession)
    return -[CSVTUIAudioSession audioSource](audioSession, "audioSource");
  else
    return 6;
}

- (BOOL)_setupAudioSession
{
  -[CSVTUIAudioSession setDelegate:](self->_audioSession, "setDelegate:", self);
  return -[CSVTUIAudioSession prepareRecord](self->_audioSession, "prepareRecord");
}

- (BOOL)_createAudioAnalyzer
{
  CSVTUIEndpointAnalyzer *v3;
  CSVTUIEndpointAnalyzer *audioAnalyzer;
  CSVTUIEndpointAnalyzer *v5;
  CSVTUIEndpointAnalyzer *v6;
  float v7;

  if (self->_audioSession)
  {
    v3 = objc_alloc_init(CSVTUIEndpointAnalyzer);
    audioAnalyzer = self->_audioAnalyzer;
    self->_audioAnalyzer = v3;

    v5 = self->_audioAnalyzer;
    if (v5)
    {
      -[CSVTUIEndpointAnalyzer setDelegate:](v5, "setDelegate:", self);
      v6 = self->_audioAnalyzer;
      objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
      -[CSVTUIEndpointAnalyzer resetForNewRequestWithSampleRate:](v6, "resetForNewRequestWithSampleRate:", (unint64_t)v7);
      -[CSVTUIEndpointAnalyzer setStartWaitTime:](self->_audioAnalyzer, "setStartWaitTime:", 5.0);
      -[CSVTUIEndpointAnalyzer setEndWaitTime:](self->_audioAnalyzer, "setEndWaitTime:", 0.77);
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)_shouldShowHeadsetDisconnectionMessage
{
  NSObject *v3;
  CSVTUIAudioSession *audioSession;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SSRVTUITrainingManager _shouldShowHeadsetDisconnectionMessage]";
    v8 = 2082;
    v9 = "-[SSRVTUITrainingManager _shouldShowHeadsetDisconnectionMessage]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v6, 0x16u);
  }
  audioSession = self->_audioSession;
  if (audioSession)
    LOBYTE(audioSession) = -[CSVTUIAudioSession hasCorrectAudioRoute](audioSession, "hasCorrectAudioRoute") ^ 1;
  return (char)audioSession;
}

- (BOOL)_startAudioSession
{
  os_log_t *v3;
  NSObject *v4;
  CSVTUIAudioSession *audioSession;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE284B8];
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[SSRVTUITrainingManager _startAudioSession]";
    v10 = 2082;
    v11 = "-[SSRVTUITrainingManager _startAudioSession]";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}s called", (uint8_t *)&v8, 0x16u);
  }
  audioSession = self->_audioSession;
  if (audioSession)
  {
    if ((-[CSVTUIAudioSession isRecording](audioSession, "isRecording") & 1) != 0
      || (-[CSVTUIAudioSession startRecording](self->_audioSession, "startRecording") & 1) != 0)
    {
      LOBYTE(audioSession) = 1;
    }
    else
    {
      v6 = *v3;
      LODWORD(audioSession) = os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR);
      if ((_DWORD)audioSession)
      {
        v8 = 136315138;
        v9 = "-[SSRVTUITrainingManager _startAudioSession]";
        _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s AudioSession StartRecording Failed", (uint8_t *)&v8, 0xCu);
        LOBYTE(audioSession) = 0;
      }
    }
  }
  return (char)audioSession;
}

- (BOOL)suspendAudio
{
  return self->_suspendAudio;
}

- (void)setSuspendAudio:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SSRVTUITrainingManager setSuspendAudio:]";
    v11 = 1026;
    v12 = v3;
    _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Setting suspendAudio:[%{public}d]", buf, 0x12u);
  }
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SSRVTUITrainingManager_setSuspendAudio___block_invoke;
  v7[3] = &unk_24CC862B0;
  v7[4] = self;
  v8 = v3;
  dispatch_async(queue, v7);
}

- (void)startRMS
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SSRVTUITrainingManager_startRMS__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stopRMS
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SSRVTUITrainingManager_stopRMS__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)shouldPerformRMS
{
  return self->_performRMS;
}

- (void)CSVTUITrainingSessionRMSAvailable:(float)a3
{
  SSRVTUITrainingManagerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  double v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      *(float *)&v9 = a3;
      objc_msgSend(v10, "VTUITrainingManagerFeedLevel:", v9);

    }
  }
}

- (void)CSVTUITrainingSessionStopListen
{
  NSObject *v3;
  SSRVTUITrainingManagerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SSRVTUITrainingManager CSVTUITrainingSessionStopListen]";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Stop Listening", (uint8_t *)&v10, 0xCu);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)p_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v9, "VTUITrainingManagerStopListening");

    }
  }
}

- (BOOL)CSVTUITrainingSession:(id)a3 hasTrainUtterance:(id)a4 languageCode:(id)a5 payload:(BOOL)a6
{
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  +[SSRVoiceProfileComposer sharedTrainer](SSRVoiceProfileComposer, "sharedTrainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "addUtterance:toProfile:withAsset:", v7, self->_profile, self->_currentAsset);

  if ((v9 & 1) == 0)
  {
    v10 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[SSRVTUITrainingManager CSVTUITrainingSession:hasTrainUtterance:languageCode:payload:]";
      _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Failed to save explicit utterance", (uint8_t *)&v12, 0xCu);
    }
  }
  return v9;
}

- (void)audioSessionDidStartRecording:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__SSRVTUITrainingManager_audioSessionDidStartRecording_error___block_invoke;
  block[3] = &unk_24CC84DF8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)audioSessionDidStopRecording:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SSRVTUITrainingManager_audioSessionDidStopRecording___block_invoke;
  v4[3] = &unk_24CC84D80;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)audioSessionRecordBufferAvailable:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  SSRVTUITrainingManager *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__SSRVTUITrainingManager_audioSessionRecordBufferAvailable___block_invoke;
  v7[3] = &unk_24CC85EE8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)audioSessionErrorDidOccur:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SSRVTUITrainingManager_audioSessionErrorDidOccur___block_invoke;
  v7[3] = &unk_24CC85EE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)audioSessionUnsupportedAudioRoute
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SSRVTUITrainingManager_audioSessionUnsupportedAudioRoute__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SSRVTUITrainingManager_endpointer_didDetectStartpointAtTime___block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__SSRVTUITrainingManager_endpointer_didDetectHardEndpointAtTime___block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)didDetectForceEndPoint
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SSRVTUITrainingManager_didDetectForceEndPoint__block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)CSVTUIRemoteTrainingSessionRMSAvailable:(float)a3
{
  SSRVTUITrainingManagerDelegate **p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  double v9;
  id v10;

  if (self->_shouldTrainViaXPC)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained((id *)p_delegate);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)p_delegate);
        *(float *)&v9 = a3;
        objc_msgSend(v10, "VTUITrainingManagerFeedLevel:", v9);

      }
    }
  }
}

- (float)rms
{
  return self->_rms;
}

- (void)setRms:(float)a3
{
  self->_rms = a3;
}

- (SSRVTUITrainingManagerDelegate)delegate
{
  return (SSRVTUITrainingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)speechRecognizerAvailable
{
  return self->_speechRecognizerAvailable;
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_trainingServiceClient, 0);
  objc_storeStrong((id *)&self->_audioZeroCounter, 0);
  objc_storeStrong((id *)&self->_mhUUID, 0);
  objc_storeStrong((id *)&self->_didStopWaitingGroup, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_speechRecognizer, 0);
  objc_storeStrong(&self->_cleanupCompletion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_currentTrainingSession, 0);
  objc_storeStrong((id *)&self->_trainingSessions, 0);
  objc_storeStrong((id *)&self->_keywordDetector, 0);
  objc_storeStrong((id *)&self->_audioAnalyzer, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_vtAssetConfigVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

void __48__SSRVTUITrainingManager_didDetectForceEndPoint__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    v2 = v1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "didDetectEndOfSpeech:", 2);

  }
}

uint64_t __65__SSRVTUITrainingManager_endpointer_didDetectHardEndpointAtTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  void *v5;
  float v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 64);
  if (v2)
  {
    v4 = v2;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "didDetectEndOfSpeech:", 1);

    v1 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(void **)(v1 + 40);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  return objc_msgSend(v5, "resetForNewRequestWithSampleRate:", (unint64_t)v6);
}

void __63__SSRVTUITrainingManager_endpointer_didDetectStartpointAtTime___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    v2 = v1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "didDetectBeginOfSpeech");

  }
}

void __59__SSRVTUITrainingManager_audioSessionUnsupportedAudioRoute__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    v2 = v1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v2, "audioSessionUnsupportedAudioRoute");

  }
}

void __52__SSRVTUITrainingManager_audioSessionErrorDidOccur___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    v3 = v1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "audioSessionErrorDidOccur:", *(_QWORD *)(a1 + 40));

  }
}

void __60__SSRVTUITrainingManager_audioSessionRecordBufferAvailable___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  v3 = objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleByteDepth");
  v4 = *(_QWORD **)(a1 + 40);
  v5 = (void *)v4[18];
  v6 = v2 / v3;
  if (v5)
  {
    objc_msgSend(v5, "getZeroStatisticsFromBuffer:entireSamples:", *(_QWORD *)(a1 + 32), v6);
    v4 = *(_QWORD **)(a1 + 40);
  }
  if (v4[5])
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28390]), "initWithData:numChannels:numSamples:sampleByteDepth:startSampleCount:hostTime:remoteVAD:", *(_QWORD *)(a1 + 32), 1, v6, 2, 0, 0, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "processAudioSamplesAsynchronously:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 192), "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), v6);

    v4 = *(_QWORD **)(a1 + 40);
  }
  v8 = (void *)v4[8];
  if (v8)
  {
    v9 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "audioSessionRecordBufferAvailable:", *(_QWORD *)(a1 + 32));

  }
}

void __55__SSRVTUITrainingManager_audioSessionDidStopRecording___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    v3 = v1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "audioSessionDidStopRecording:", *(_QWORD *)(a1 + 40));

  }
  v4 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SSRVTUITrainingManager audioSessionDidStopRecording:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s audioSessionDidStopRecording", (uint8_t *)&v5, 0xCu);
  }
}

void __62__SSRVTUITrainingManager_audioSessionDidStartRecording_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v1)
  {
    v3 = v1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "audioSessionDidStartRecording:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __33__SSRVTUITrainingManager_stopRMS__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 152))
    return objc_msgSend(*(id *)(v1 + 160), "stopRMS");
  *(_BYTE *)(v1 + 8) = 0;
  return result;
}

uint64_t __34__SSRVTUITrainingManager_startRMS__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 152))
    return objc_msgSend(*(id *)(v1 + 160), "startRMS");
  *(_BYTE *)(v1 + 8) = 1;
  return result;
}

uint64_t __42__SSRVTUITrainingManager_setSuspendAudio___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v1 = result;
  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    if (!*(_BYTE *)(result + 40))
    {
      v3 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315138;
        v6 = "-[SSRVTUITrainingManager setSuspendAudio:]_block_invoke";
        _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Resume training", (uint8_t *)&v5, 0xCu);
        v2 = *(_QWORD *)(v1 + 32);
      }
      result = objc_msgSend(*(id *)(v2 + 64), "resumeTraining");
    }
  }
  else if (*(_BYTE *)(result + 40))
  {
    v4 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[SSRVTUITrainingManager setSuspendAudio:]_block_invoke";
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Suspend training", (uint8_t *)&v5, 0xCu);
      v2 = *(_QWORD *)(v1 + 32);
    }
    result = objc_msgSend(*(id *)(v2 + 64), "suspendTraining");
  }
  *(_BYTE *)(*(_QWORD *)(v1 + 32) + 80) = *(_BYTE *)(v1 + 40);
  return result;
}

uint64_t __37__SSRVTUITrainingManager_audioSource__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__SSRVTUITrainingManager_audioSource__block_invoke_2;
  v4[3] = &unk_24CC84DD0;
  v4[4] = v1;
  return objc_msgSend(v2, "audioSourceWithCompletion:", v4);
}

uint64_t __37__SSRVTUITrainingManager_audioSource__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_audioSource");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __37__SSRVTUITrainingManager_audioSource__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __94__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_completionWithResult___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  int v4;
  char v5;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __94__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_completionWithResult___block_invoke_2;
  v2[3] = &unk_24CC84DA8;
  v4 = *(_DWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 44);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __94__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_completionWithResult___block_invoke_2(uint64_t a1)
{
  CSVTUITrainingResult *v2;
  uint64_t v3;
  CSVTUITrainingResult *v4;

  v2 = -[CSVTUITrainingResult initWithSessionId:sessionStatus:audioStatus:]([CSVTUITrainingResult alloc], "initWithSessionId:sessionStatus:audioStatus:", 0, *(unsigned int *)(a1 + 40), 0);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

void __88__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_withCompletion___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  int v4;
  char v5;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __88__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_withCompletion___block_invoke_2;
  v2[3] = &unk_24CC84DA8;
  v3 = *(id *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 44);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

uint64_t __88__SSRVTUITrainingManager_closeSessionBeforeStartWithStatus_successfully_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44), 0);
  return result;
}

uint64_t __46__SSRVTUITrainingManager_cancelTrainingForID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "cancelTrainingViaXPCForID:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__SSRVTUITrainingManager_cancelTrainingForID___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_stopAudioSession");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "endAudio");
}

uint64_t __43__SSRVTUITrainingManager_playSoundsEffect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_playSoundsEffect:", *(_QWORD *)(a1 + 40));
}

uint64_t __43__SSRVTUITrainingManager_playSoundsEffect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "playSoundsEffect:", *(_QWORD *)(a1 + 40));
}

void __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v3 = *(unsigned __int8 *)(a1 + 64);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_2;
  v5[3] = &unk_24CC84CE0;
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "trainUtteranceViaXPC:shouldUseASR:mhUUID:completionWithResult:", v4, v3, v1, v5);

}

void __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11[2];
  char v12;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_5;
  v7[3] = &unk_24CC84D58;
  objc_copyWeak(v11, (id *)(a1 + 56));
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v5 = *(id *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 72);
  v6 = *(void **)(a1 + 64);
  v10 = v5;
  v11[1] = v6;
  dispatch_async(v2, v7);

  objc_destroyWeak(v11);
}

void __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  os_log_t *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __objc2_class *v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  _BYTE v40[40];
  _BYTE v41[40];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  v4 = (os_log_t *)MEMORY[0x24BE284B8];
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 136), v3);
    v5 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke_5";
      v44 = 2112;
      v45 = v6;
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s CoreSpeech received the UUID from UI: %@", buf, 0x16u);
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48))
    objc_msgSend(WeakRetained, "createKeywordDetector");
  if ((objc_msgSend(WeakRetained, "_setupAudioSession") & 1) == 0)
  {
    v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke";
      v16 = "%s AudioSession setup failed";
      goto LABEL_35;
    }
LABEL_14:
    v8 = *(_QWORD *)(a1 + 48);
    v9 = WeakRetained;
    v10 = 5;
LABEL_15:
    objc_msgSend(v9, "closeSessionBeforeStartWithStatus:successfully:completionWithResult:", v10, 0, v8);
    goto LABEL_16;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 40))
    objc_msgSend(WeakRetained, "_createAudioAnalyzer");
  if (objc_msgSend(WeakRetained, "_shouldShowHeadsetDisconnectionMessage"))
  {
    v7 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke";
      _os_log_impl(&dword_2117D4000, v7, OS_LOG_TYPE_DEFAULT, "%s Has wrong audio routing, ask user to unplug headset", buf, 0xCu);
    }
    v8 = *(_QWORD *)(a1 + 48);
    v9 = WeakRetained;
    v10 = 4;
    goto LABEL_15;
  }
  if ((objc_msgSend(WeakRetained, "_startAudioSession") & 1) == 0)
  {
    v11 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke";
      v16 = "%s Start Audio Session failed";
LABEL_35:
      _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x24BE283A0];
  objc_msgSend(MEMORY[0x24BE28410], "utteranceFileASBD");
  objc_msgSend(MEMORY[0x24BE28410], "utteranceFileASBD");
  objc_msgSend(v12, "createAudioFileWriterForPHSTrainingWithInputFormat:outputFormat:", v41, v40);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(void **)(v14 + 192);
  *(_QWORD *)(v14 + 192) = v13;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(WeakRetained, "createSpeechRecognizer");
  }
  else
  {
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(void **)(v17 + 104);
    *(_QWORD *)(v17 + 104) = 0;

  }
  v19 = *(void **)(*(_QWORD *)(a1 + 40) + 144);
  objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
  objc_msgSend(v19, "resetWithSampleRate:");
  v20 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v43 = "-[SSRVTUITrainingManager trainUtterance:shouldUseASR:mhUUID:completionWithResult:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s Resetting zero counter", buf, 0xCu);
  }
  if (*(uint64_t *)(a1 + 64) <= 0)
    v21 = CSVTUITrainingSession;
  else
    v21 = CSVTUITrainingSessionWithPayload;
  v22 = [v21 alloc];
  v38 = *(_QWORD *)(a1 + 64);
  v39 = v22;
  v23 = *(_QWORD **)(a1 + 40);
  v24 = v23[9];
  v25 = v23[2];
  v26 = v23[3];
  v27 = v23[4];
  v28 = v23[6];
  v29 = v23[13];
  +[SSRVTUITrainingManager sharedtrainingSessionQueue](SSRVTUITrainingManager, "sharedtrainingSessionQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v39, "initWithUtteranceId:sessionNumber:Locale:vtAssetConfigVersion:audioSession:keywordDetector:speechRecognizer:speechRecognitionRequest:sessionDelegate:sessionDispatchQueue:mhUUID:zeroCounter:completionWithResult:", v38, v24, v25, v26, v27, v28, v29, 0, v23, v30, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), *(_QWORD *)(a1 + 48));
  v32 = *(_QWORD *)(a1 + 40);
  v33 = *(void **)(v32 + 64);
  *(_QWORD *)(v32 + 64) = v31;

  v34 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v34 + 64))
  {
    v8 = *(_QWORD *)(a1 + 48);
    v9 = WeakRetained;
    v10 = 3;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(v34 + 56), "addObject:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "startTraining");
  v35 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v35 + 80))
  {
    objc_msgSend(*(id *)(v35 + 64), "suspendTraining");
    v35 = *(_QWORD *)(a1 + 40);
  }
  v36 = kCSVTUITrainingManagerSessionNo++;
  *(_QWORD *)(v35 + 72) = kCSVTUITrainingManagerSessionNo;
  v37 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v37 + 72))
  {
    kCSVTUITrainingManagerSessionNo = v36 + 2;
    *(_QWORD *)(v37 + 72) = v36 + 2;
  }
LABEL_16:

}

void __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_2(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_3;
    v9[3] = &unk_24CC84D08;
    v11 = v8;
    v13 = a3;
    v10 = v7;
    v12 = a4;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
}

uint64_t __82__SSRVTUITrainingManager_trainUtterance_shouldUseASR_mhUUID_completionWithResult___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __65__SSRVTUITrainingManager_trainUtterance_shouldUseASR_completion___block_invoke(uint64_t result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(result + 32);
  if (v4)
  {
    v7 = a2;
    v8 = objc_msgSend(v7, "sessionId");
    v9 = objc_msgSend(v7, "sessionStatus");

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v8, v9, a3, a4);
  }
  return result;
}

void __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD block[4];
  id v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_2;
    block[3] = &unk_24CC84CB8;
    v3 = v1;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_21(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_2_22;
  v3[3] = &unk_24CC84CB8;
  v4 = v1;
  objc_msgSend(v2, "cleanupViaXPCWithCompletion:", v3);

}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke_3";
    v6 = 2082;
    v7 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke_3";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s %{public}s async called", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "enter");
  if ((objc_msgSend(*(id *)(a1 + 32), "_stopAudioSession") & 1) == 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "leave");
  return objc_msgSend(*(id *)(a1 + 32), "destroySpeakerTrainer");
}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_23(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (os_log_t *)MEMORY[0x24BE284B8];
  v3 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v3, OS_LOG_TYPE_DEFAULT, "%s Waiting for didStop", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "waitWithTimeout:", dispatch_time(0, 2000000000));
  v4 = *v2;
  if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Done waiting for didStop", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_destroyAudioSession");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "endAudio");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_24(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke";
    v6 = 2082;
    v7 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s %{public}s async called", (uint8_t *)&v4, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_stopAudioSession");
  objc_msgSend(*(id *)(a1 + 32), "destroySpeakerTrainer");
  objc_msgSend(*(id *)(a1 + 32), "_destroyAudioSession");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "endAudio");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_2_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__SSRVTUITrainingManager_cleanupWithCompletion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE284B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SSRVTUITrainingManager cleanupWithCompletion:]_block_invoke_2";
    _os_log_impl(&dword_2117D4000, v2, OS_LOG_TYPE_DEFAULT, "%s Called before completion called", (uint8_t *)&v4, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[4];
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_2;
    v4[3] = &unk_24CC84C68;
    v5 = v2;
    v6 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);

  }
}

void __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 152))
  {
    v3 = *(void **)(v2 + 160);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_4;
    v5[3] = &unk_24CC84C90;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "prepareWithCompletion:", v5);

  }
  else
  {
    v4 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[SSRVTUITrainingManager prepareWithCompletion:]_block_invoke_3";
      v9 = 2080;
      v10 = "-[SSRVTUITrainingManager prepareWithCompletion:]_block_invoke_3";
      _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s %s async called", buf, 0x16u);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v2 + 32), "prepareRecord");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __48__SSRVTUITrainingManager_prepareWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __46__SSRVTUITrainingManager_setLocaleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setLocaleIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__SSRVTUITrainingManager_voiceProfile__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__SSRVTUITrainingManager_voiceProfile__block_invoke_2;
  v4[3] = &unk_24CC84C40;
  v4[4] = v1;
  return objc_msgSend(v2, "voiceProfileWithCompletion:", v4);
}

void __38__SSRVTUITrainingManager_voiceProfile__block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (SSRVTUITrainingManager)trainingManagerWithLocaleID:(id)a3 withAppDomain:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  CSVTUIAudioSessionRecorder *v8;
  SSRVTUITrainingManager *v9;

  v5 = a4;
  v6 = a3;
  SSRLogInitIfNeeded();
  v7 = objc_msgSend(MEMORY[0x24BE28488], "isExclaveHardware");
  if ((v7 & 1) != 0)
    v8 = 0;
  else
    v8 = -[CSVTUIAudioSessionRecorder initWithDelegate:]([CSVTUIAudioSessionRecorder alloc], "initWithDelegate:", 0);
  v9 = -[SSRVTUITrainingManager initWithLocaleIdentifier:withAudioSession:withAppDomain:shouldTrainViaXPC:]([SSRVTUITrainingManager alloc], "initWithLocaleIdentifier:withAudioSession:withAppDomain:shouldTrainViaXPC:", v6, v8, v5, v7);

  return v9;
}

+ (id)sharedtrainingSessionQueue
{
  if (sharedtrainingSessionQueue_onceToken != -1)
    dispatch_once(&sharedtrainingSessionQueue_onceToken, &__block_literal_global_1970);
  return (id)sharedtrainingSessionQueue_sharedQueue;
}

void __52__SSRVTUITrainingManager_sharedtrainingSessionQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.VoiceTriggerUI.TrainingSessionQueue", 0);
  v1 = (void *)sharedtrainingSessionQueue_sharedQueue;
  sharedtrainingSessionQueue_sharedQueue = (uint64_t)v0;

}

@end
