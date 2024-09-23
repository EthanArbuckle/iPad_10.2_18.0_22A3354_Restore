@implementation VSSpeechServerTask

- (VSSpeechServerTask)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (VSSpeechServerTask)initWithRequest:(id)a3 shouldSpeak:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  VSSpeechServerTask *v8;
  VSSpeechServerTask *v9;
  VSInstrumentMetrics *v10;
  VSInstrumentMetrics *instrumentMetrics;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  VSDeviceTTSCore *v19;
  VSDeviceTTSCore *synthesisCore;
  void *v21;
  VSOspreyTTSCore *v22;
  VSOspreyTTSCore *ospreyCore;
  void *v24;
  uint64_t v25;
  VSSpeechInternalSettings *internalSettings;
  uint64_t v27;
  VSCachingService *cachingService;
  uint64_t v29;
  VSSiriServerConfiguration *serverTTSConfig;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VSSpeechServerTask;
  v8 = -[VSSpeechServerTask init](&v32, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_request, a3);
    v9->_shouldSpeak = v4;
    v9->_isNeuralFallbackCondition = objc_msgSend(MEMORY[0x24BEC0DA8], "isNeuralFallbackCondition");
    v10 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x24BEC0D88]);
    instrumentMetrics = v9->_instrumentMetrics;
    v9->_instrumentMetrics = v10;

    if (objc_msgSend(v7, "requestCreatedTimestamp"))
    {
      v12 = objc_msgSend(v7, "requestCreatedTimestamp");
    }
    else
    {
      VSGetLogDefault();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v13, OS_LOG_TYPE_ERROR, "Using requestCreatedTimestamp inside voiced for Server task", buf, 2u);
      }

      v12 = mach_absolute_time();
    }
    -[VSInstrumentMetrics setRequestCreatedTimestamp:](v9->_instrumentMetrics, "setRequestCreatedTimestamp:", v12);
    VSGetLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      -[VSSpeechServerTask instrumentMetrics](v9, "instrumentMetrics");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "requestCreatedTimestamp");
      *(_DWORD *)buf = 134218240;
      v34 = v16;
      v35 = 1024;
      v36 = v4;
      _os_log_impl(&dword_21AA84000, v14, OS_LOG_TYPE_INFO, "Created Server task %llu: shouldSpeak %{BOOL}d", buf, 0x12u);

    }
    v9->_readyForEagerTask = !v4;
    objc_msgSend(v7, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSInstrumentMetrics setUtterance:](v9->_instrumentMetrics, "setUtterance:", v17);

    -[VSInstrumentMetrics setIsServerTTS:](v9->_instrumentMetrics, "setIsServerTTS:", 1);
    -[VSInstrumentMetrics setIsSpeechRequest:](v9->_instrumentMetrics, "setIsSpeechRequest:", v4);
    -[VSInstrumentMetrics setCanUseServerTTS:](v9->_instrumentMetrics, "setCanUseServerTTS:", objc_msgSend(v7, "canUseServerTTS"));
    objc_msgSend(v7, "clientBundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSInstrumentMetrics setClientBundleIdentifier:](v9->_instrumentMetrics, "setClientBundleIdentifier:", v18);

    v9->_timeoutCondition.__sig = 1018212795;
    *(_OWORD *)v9->_timeoutCondition.__opaque = 0u;
    *(_OWORD *)&v9->_timeoutCondition.__opaque[16] = 0u;
    *(_QWORD *)&v9->_timeoutCondition.__opaque[32] = 0;
    v9->_deviceTTSWaitTime = NAN;
    v19 = -[VSDeviceTTSCore initWithRequest:]([VSDeviceTTSCore alloc], "initWithRequest:", v7);
    synthesisCore = v9->_synthesisCore;
    v9->_synthesisCore = v19;

    -[VSSpeechServerTask instrumentMetrics](v9, "instrumentMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore setInstrumentMetrics:](v9->_synthesisCore, "setInstrumentMetrics:", v21);

    -[VSDeviceTTSCore setDelegate:](v9->_synthesisCore, "setDelegate:", v9);
    v22 = -[VSOspreyTTSCore initWithRequest:]([VSOspreyTTSCore alloc], "initWithRequest:", v7);
    ospreyCore = v9->_ospreyCore;
    v9->_ospreyCore = v22;

    -[VSSpeechServerTask instrumentMetrics](v9, "instrumentMetrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSOspreyTTSCore setInstrumentMetrics:](v9->_ospreyCore, "setInstrumentMetrics:", v24);

    -[VSOspreyTTSCore setDelegate:](v9->_ospreyCore, "setDelegate:", v9);
    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v25 = objc_claimAutoreleasedReturnValue();
    internalSettings = v9->_internalSettings;
    v9->_internalSettings = (VSSpeechInternalSettings *)v25;

    +[VSCachingService standardService](VSCachingService, "standardService");
    v27 = objc_claimAutoreleasedReturnValue();
    cachingService = v9->_cachingService;
    v9->_cachingService = (VSCachingService *)v27;

    +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
    v29 = objc_claimAutoreleasedReturnValue();
    serverTTSConfig = v9->_serverTTSConfig;
    v9->_serverTTSConfig = (VSSiriServerConfiguration *)v29;

    pthread_mutex_init(&v9->_racingMutex, 0);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  pthread_cond_destroy(&self->_timeoutCondition);
  v3.receiver = self;
  v3.super_class = (Class)VSSpeechServerTask;
  -[VSSpeechServerTask dealloc](&v3, sel_dealloc);
}

- (id)handleServerResponse:(id)a3 timingInfo:(id)a4
{
  id v6;
  id v7;
  _opaque_pthread_mutex_t *p_racingMutex;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
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
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  uint8_t v34[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  p_racingMutex = &self->_racingMutex;
  pthread_mutex_lock(&self->_racingMutex);
  if (-[VSSpeechServerTask useDeviceSynthesis](self, "useDeviceSynthesis"))
  {
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "selectedVoice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "voiceData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "footprint");

    if (v12 != 1)
    {
      VSGetLogDefault();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_21AA84000, v32, OS_LOG_TYPE_INFO, "Received device synthesis previously, ignore server TTS.", v34, 2u);
      }
      goto LABEL_16;
    }
  }
  if (!-[VSSpeechServerTask useServerResponse](self, "useServerResponse"))
  {
    VSGetLogDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v13, OS_LOG_TYPE_DEFAULT, "Received server TTS response. Use Server TTS.", buf, 2u);
    }

    -[VSSpeechServerTask setUseServerResponse:](self, "setUseServerResponse:", 1);
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIsServerTTS:", 1);

  }
  v15 = mach_absolute_time();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSynthesisEndTimestamp:", v15);

  kdebug_trace();
  -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "voice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "voiceKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setVoiceAssetKey:", v19);

  -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "voiceResource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "key");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setVoiceResourceAssetKey:", v23);

  -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    -[VSSpeechServerTask setWordTimingInfo:](self, "setWordTimingInfo:", v7);
    -[VSSpeechServerTask reportTimingInfo](self, "reportTimingInfo");
  }
  v26 = -[VSSpeechServerTask enqueueAudioData:](self, "enqueueAudioData:", v6);
  -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask setObserverForWordTimings:](self, "setObserverForWordTimings:", v27);

  -[VSSpeechServerTask serverAudio](self, "serverAudio");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[VSSpeechServerTask serverAudio](self, "serverAudio");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "concatenateWithAudio:", v6);

  }
  else
  {
    -[VSSpeechServerTask setServerAudio:](self, "setServerAudio:", v6);
  }
  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isCancelled");

  if ((v31 & 1) == 0)
  {
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v32 = objc_claimAutoreleasedReturnValue();
    -[NSObject cancel](v32, "cancel");
LABEL_16:

  }
  pthread_mutex_unlock(p_racingMutex);

  return 0;
}

- (void)speakRetryPhrase
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  VSDeviceTTSCore *v22;
  uint8_t buf[16];

  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEFAULT, "Encountered Osprey streaming network stall. Retry with device TTS.", buf, 2u);
  }

  v4 = (void *)MEMORY[0x24BEC0D90];
  v5 = *MEMORY[0x24BEC0E80];
  -[VSSpeechServerTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedInterstitialStringForKey:language:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSSpeechServerTask request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  v11 = (void *)MEMORY[0x24BDD17C8];
  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "utterance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUtterance:", v15);

  v16 = (void *)MEMORY[0x24BDD17C8];
  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "request");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ %@"), v8, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v20);

  -[VSSpeechServerTask playbackService](self, "playbackService");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stop");

  -[VSSpeechServerTask setPlaybackService:](self, "setPlaybackService:", 0);
  -[VSSpeechServerTask setUseServerResponse:](self, "setUseServerResponse:", 0);
  -[VSSpeechServerTask setUseDeviceSynthesis:](self, "setUseDeviceSynthesis:", 1);
  v22 = -[VSDeviceTTSCore initWithRequest:]([VSDeviceTTSCore alloc], "initWithRequest:", v10);
  -[VSDeviceTTSCore setDelegate:](v22, "setDelegate:", self);
  -[VSDeviceTTSCore start](v22, "start");

}

- (void)fallbackToDeviceSynthesis
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
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
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechServerTask error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    VSGetLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[VSSpeechServerTask error](self, "error");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "localizedDescription");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = v50;
      _os_log_error_impl(&dword_21AA84000, v4, OS_LOG_TYPE_ERROR, "Server network error: %@", buf, 0xCu);

    }
  }
  -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isCancelled") & 1) == 0)
  {

    goto LABEL_9;
  }
  -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "code");

  if (v8 == 602)
  {
LABEL_9:
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsServerTimeout:", 1);

  }
  -[VSSpeechServerTask request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "disableDeviceRacing");

  if (v11)
  {
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v12, OS_LOG_TYPE_DEFAULT, "Start device synthesis fallback.", buf, 2u);
    }

    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "start");

  }
  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

    return;
  }
  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "streamAudio");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else
  {
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "compressedAudio");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
      return;
  }
  VSGetLogDefault();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v20, OS_LOG_TYPE_DEFAULT, "Start playing device synthesis instead.", buf, 2u);
  }

  -[VSSpeechServerTask setUseDeviceSynthesis:](self, "setUseDeviceSynthesis:", 1);
  -[VSSpeechServerTask deferredTTSTimingInfo](self, "deferredTTSTimingInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask setWordTimingInfo:](self, "setWordTimingInfo:", v21);

  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setIsServerTTS:", 0);

  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSourceOfTTS:", 1);

  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectedVoice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "key");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setVoiceAssetKey:", v26);

  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "selectedVoiceResource");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "key");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setVoiceResourceAssetKey:", v30);

  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "streamAudio");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33)
  {
    objc_msgSend(v34, "streamAudio");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __47__VSSpeechServerTask_fallbackToDeviceSynthesis__block_invoke;
    v51[3] = &unk_24DD8EC00;
    v51[4] = self;
    objc_msgSend(v36, "enumerateAudioWithBlock:", v51);
  }
  else
  {
    objc_msgSend(v34, "compressedAudio");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v37)
      goto LABEL_26;
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "compressedAudio");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[VSSpeechServerTask enqueueAudioData:](self, "enqueueAudioData:", v36);
  }

LABEL_26:
  -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask setObserverForWordTimings:](self, "setObserverForWordTimings:", v39);

  -[VSSpeechServerTask reportTimingInfo](self, "reportTimingInfo");
  -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "error");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {

  }
  else
  {
    -[VSSpeechServerTask error](self, "error");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v30, "isEqualToString:", CFSTR("ServerTTSErrorDomain"));

    if (!v43)
      return;
  }
  -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "error");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "error");
  }
  else
  {
    -[VSSpeechServerTask error](self, "error");
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "code");
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setErrorCode:", v47);

  if (v45)
  {

    v46 = v30;
  }

  -[VSSpeechServerTask setError:](self, "setError:", 0);
}

- (double)deviceTTSWaitTime
{
  return self->_deviceTTSWaitTime;
}

- (BOOL)shouldRelyOnServerTTS
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[VSSpeechServerTask request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "disableDeviceRacing") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isCancelled") & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v4 = 1;
      }
      else
      {
        -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "selectedVoice");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "voiceData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "footprint") == 1)
        {
          v4 = 1;
        }
        else
        {
          -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "selectedVoice");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "voiceData");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v12, "type") == 4 && self->_isNeuralFallbackCondition;

        }
      }

    }
  }

  return v4;
}

- (BOOL)shouldDeferDeviceTTS
{
  double v4;

  if (-[VSSpeechServerTask shouldRelyOnServerTTS](self, "shouldRelyOnServerTTS"))
    return 1;
  -[VSSpeechServerTask deviceTTSWaitTime](self, "deviceTTSWaitTime");
  return v4 > 0.0;
}

- (id)handleDeviceSynthesis:(id)a3 timingInfo:(id)a4
{
  id v6;
  id v7;
  _opaque_pthread_mutex_t *p_racingMutex;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
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
  uint8_t v30[16];
  uint8_t v31[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  p_racingMutex = &self->_racingMutex;
  pthread_mutex_lock(&self->_racingMutex);
  if (-[VSSpeechServerTask useServerResponse](self, "useServerResponse"))
  {
    VSGetLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v9, OS_LOG_TYPE_INFO, "Received server TTS previously, ignore device TTS", buf, 2u);
    }

  }
  else
  {
    if (v6)
    {
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "synthesisEndTimestamp");

      if (!v12)
      {
        v13 = mach_absolute_time();
        -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSynthesisEndTimestamp:", v13);

        kdebug_trace();
      }
    }
    if (-[VSSpeechServerTask useDeviceSynthesis](self, "useDeviceSynthesis")
      || !-[VSSpeechServerTask shouldDeferDeviceTTS](self, "shouldDeferDeviceTTS"))
    {
      if (!-[VSSpeechServerTask useDeviceSynthesis](self, "useDeviceSynthesis"))
      {
        VSGetLogDefault();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_INFO, "Received audio from device synthesis. Use device synthesis immediately.", v31, 2u);
        }

        -[VSSpeechServerTask setUseDeviceSynthesis:](self, "setUseDeviceSynthesis:", 1);
        -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "cancel");

        -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setIsServerTTS:", 0);

        -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setSourceOfTTS:", 1);

      }
      if (v6)
      {
        -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "selectedVoice");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "key");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setVoiceAssetKey:", v22);

        -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "selectedVoiceResource");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "key");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setVoiceResourceAssetKey:", v26);

        -[VSSpeechServerTask enqueueAudioData:](self, "enqueueAudioData:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
          goto LABEL_22;
      }
      else
      {
        v10 = 0;
        if (!v7)
          goto LABEL_22;
      }
      -[VSSpeechServerTask setWordTimingInfo:](self, "setWordTimingInfo:", v7);
      -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask setObserverForWordTimings:](self, "setObserverForWordTimings:", v28);

      -[VSSpeechServerTask reportTimingInfo](self, "reportTimingInfo");
      goto LABEL_22;
    }
    VSGetLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_21AA84000, v15, OS_LOG_TYPE_INFO, "Received audio from device synthesis, but it's deferred.", v30, 2u);
    }

    if (v7)
      -[VSSpeechServerTask setDeferredTTSTimingInfo:](self, "setDeferredTTSTimingInfo:", v7);
  }
  v10 = 0;
LABEL_22:
  pthread_mutex_unlock(p_racingMutex);

  return v10;
}

- (id)enqueueAudioData:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  VSAudioPlaybackService *v26;
  void *v27;
  void *v28;
  VSAudioPlaybackService *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSSpeechServerTask setReadyForEagerTask:](self, "setReadyForEagerTask:", 0);
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "duration");
  v7 = v6;
  objc_msgSend(v5, "audioDuration");
  objc_msgSend(v5, "setAudioDuration:", v7 + v8);

  if (!-[VSSpeechServerTask shouldSpeak](self, "shouldSpeak"))
  {
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[VSSpeechServerTask request](self, "request");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "shouldStreamAudioData");

      if (v20)
      {
        -[VSSpeechServerTask delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSpeechServerTask request](self, "request");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "synthesisRequest:didGenerateAudioChunk:", v22, v4);

      }
      goto LABEL_10;
    }
  }
  -[VSSpeechServerTask playbackService](self, "playbackService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
LABEL_4:
    -[VSSpeechServerTask playbackService](self, "playbackService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "audioData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v4, "packetCount");
    objc_msgSend(v4, "packetDescriptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "enqueue:packetCount:packetDescriptions:", v12, v13, v14);

    if (!-[VSSpeechServerTask speechStartReported](self, "speechStartReported"))
    {
      v15 = mach_absolute_time();
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSpeechBeginTimestamp:", v15);

      -[VSSpeechServerTask reportSpeechStart](self, "reportSpeechStart");
      -[VSSpeechServerTask setSpeechStartReported:](self, "setSpeechStartReported:", 1);
    }
LABEL_10:
    v23 = 0;
    goto LABEL_11;
  }
  if (self->_shouldSpeak)
  {
    -[VSSpeechServerTask request](self, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "audioSessionID");
  }
  else
  {
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "request");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v25, "audioSessionID");

  }
  v26 = [VSAudioPlaybackService alloc];
  if (v4)
  {
    objc_msgSend(v4, "asbd");
  }
  else
  {
    v43 = 0;
    v41 = 0u;
    v42 = 0u;
  }
  -[VSSpeechServerTask request](self, "request", v41, v42, v43);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "accessoryID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[VSAudioPlaybackService initWithAudioSessionID:asbd:useAVSBAR:](v26, "initWithAudioSessionID:asbd:useAVSBAR:", v18, &v41, v28 != 0);
  -[VSSpeechServerTask setPlaybackService:](self, "setPlaybackService:", v29);

  -[VSSpeechServerTask playbackService](self, "playbackService");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "outputRouteInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "audioRouteName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAudioOutputRoute:", v32);

  -[VSSpeechServerTask playbackService](self, "playbackService");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    v39 = (void *)MEMORY[0x24BDD1540];
    v44 = *MEMORY[0x24BDD0FC8];
    v45[0] = CFSTR("Unable to create playback service");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 450, v40);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v35 = mach_absolute_time();
  -[VSSpeechServerTask playbackService](self, "playbackService");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "start");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v37 = mach_absolute_time() - v35;
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAudioStartTimestampDiffs:", v37);

    goto LABEL_4;
  }
LABEL_11:

  return v23;
}

- (id)eagerTaskHashForRequest:(id)a3
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
  void *v16;
  void *v18;

  v18 = (void *)MEMORY[0x24BDD17C8];
  v3 = a3;
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v3, "gender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v3, "voiceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v3, "footprint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "rate");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "pitch");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "volume");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "stringWithFormat:", CFSTR("EagerTTS:%@:%@:%@:%@:%@:%@:%@:%@:%@"), v4, v5, v6, v7, v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
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
  void *v43;
  uint8_t v44[16];
  uint8_t buf[16];

  kdebug_trace();
  -[VSSpeechServerTask serverTTSConfig](self, "serverTTSConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "experimentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExperimentIdentifier:", v4);

  -[VSSpeechServerTask cachingService](self, "cachingService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "popShortTermCacheForHash:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    VSGetLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_INFO, "Inline server TTS is previously cached.", buf, 2u);
    }

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSourceOfTTS:", 6);

  }
  else
  {
    -[VSSpeechServerTask cachingService](self, "cachingService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask eagerTaskHashForRequest:](self, "eagerTaskHashForRequest:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "popShortTermCacheForHash:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      -[VSSpeechServerTask proceedWithServerTTS](self, "proceedWithServerTTS");
      goto LABEL_10;
    }
    VSGetLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_21AA84000, v14, OS_LOG_TYPE_INFO, "Eager server TTS is previously cached.", v44, 2u);
    }

    -[VSSpeechServerTask setIsEagerCache:](self, "setIsEagerCache:", 1);
  }
  -[VSSpeechServerTask proceedWithSpeechCache:](self, "proceedWithSpeechCache:", v9);
LABEL_10:
  notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEC0EC0], "UTF8String"));
  -[VSSpeechServerTask setReadyForEagerTask:](self, "setReadyForEagerTask:", 0);
  if (-[VSSpeechServerTask shouldSpeak](self, "shouldSpeak")
    || (-[VSSpeechServerTask speakTask](self, "speakTask"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    -[VSSpeechServerTask playbackService](self, "playbackService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "flushAndStop");

    -[VSSpeechServerTask error](self, "error");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[VSSpeechServerTask playbackService](self, "playbackService");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask setError:](self, "setError:", v19);

    }
    v7 = (void *)mach_absolute_time();
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setSpeechEndTimestamp:", v7);
    goto LABEL_15;
  }
  -[VSSpeechServerTask request](self, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "shouldCache")
    || !-[VSSpeechServerTask useServerResponse](self, "useServerResponse")
    || (-[VSSpeechServerTask isCancelled](self, "isCancelled") & 1) != 0)
  {
LABEL_15:

    goto LABEL_16;
  }
  -[VSSpeechServerTask error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[VSSpeechServerTask cachingService](self, "cachingService");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask request](self, "request");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask eagerTaskHashForRequest:](self, "eagerTaskHashForRequest:", v43);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask serverAudio](self, "serverAudio");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "voiceAssetKey");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "voiceResourceAssetKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "enqueueShortTermCacheWithHash:audio:timingInfo:voiceKey:voiceResourceKey:completion:", v33, v34, v35, v36, v7, 0);

    goto LABEL_15;
  }
LABEL_16:
  v21 = -[VSSpeechServerTask useServerResponse](self, "useServerResponse");
  if (v21)
  {
    -[VSSpeechServerTask error](self, "error");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
LABEL_24:
      -[VSSpeechServerTask reportInstrumentMetrics](self, "reportInstrumentMetrics");
      goto LABEL_25;
    }
    v7 = (void *)v22;
    if (!-[VSSpeechServerTask useDeviceSynthesis](self, "useDeviceSynthesis"))
    {

      goto LABEL_25;
    }
  }
  else if (!-[VSSpeechServerTask useDeviceSynthesis](self, "useDeviceSynthesis"))
  {
    goto LABEL_25;
  }
  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "error");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  if (!v24)
    goto LABEL_24;
LABEL_25:
  if (!-[VSSpeechServerTask useDeviceSynthesis](self, "useDeviceSynthesis"))
    goto LABEL_28;
  -[VSSpeechServerTask error](self, "error");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "error");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v25 == (void *)v27)
  {

LABEL_36:
    -[VSSpeechServerTask setError:](self, "setError:", 0);
    if (v9)
      goto LABEL_29;
    goto LABEL_37;
  }
  v28 = (void *)v27;
  -[VSSpeechServerTask error](self, "error");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "domain");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("ServerTTSErrorDomain"));

  if (v31)
    goto LABEL_36;
LABEL_28:
  if (v9)
  {
LABEL_29:
    objc_msgSend(v9, "audio");
    v32 = objc_claimAutoreleasedReturnValue();
LABEL_39:
    v38 = (void *)v32;
    -[VSSpeechServerTask writeAudioIfNeeded:](self, "writeAudioIfNeeded:", v32);
    goto LABEL_40;
  }
LABEL_37:
  if (-[VSSpeechServerTask useServerResponse](self, "useServerResponse"))
  {
    -[VSSpeechServerTask serverAudio](self, "serverAudio");
    v32 = objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  if (!-[VSSpeechServerTask useDeviceSynthesis](self, "useDeviceSynthesis"))
    goto LABEL_41;
  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "streamAudio");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[VSSpeechServerTask writeAudioIfNeeded:](self, "writeAudioIfNeeded:", v39);
  }
  else
  {
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "compressedAudio");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask writeAudioIfNeeded:](self, "writeAudioIfNeeded:", v41);

  }
LABEL_40:

LABEL_41:
  -[VSSpeechServerTask reportFinish](self, "reportFinish");
  kdebug_trace();

}

- (void)proceedWithSpeechCache:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v4 = a3;
  -[VSSpeechServerTask setUseServerResponse:](self, "setUseServerResponse:", 1);
  objc_msgSend(v4, "voiceKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setVoiceAssetKey:", v5);

  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsCacheHitFromMemory:", 1);

  objc_msgSend(v4, "timingInfos");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask setWordTimingInfo:](self, "setWordTimingInfo:", v8);

  -[VSSpeechServerTask reportTimingInfo](self, "reportTimingInfo");
  objc_msgSend(v4, "audio");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VSSpeechServerTask enqueueAudioData:](self, "enqueueAudioData:", v9);

  -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask setObserverForWordTimings:](self, "setObserverForWordTimings:", v11);

  objc_msgSend(v4, "audio");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[VSSpeechServerTask setServerAudio:](self, "setServerAudio:", v12);
}

- (void)broadcastTimeoutCondition
{
  pthread_cond_broadcast(&self->_timeoutCondition);
}

- (void)proceedWithServerTTS
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
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
  NSObject *v28;
  void *v29;
  char v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  BOOL v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v3 = mach_absolute_time();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSynthesisBeginTimestamp:", v3);

  kdebug_trace();
  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectVoiceResourceAssetForLanguage:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSSpeechServerTask request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "voiceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (!v11)
  {
    -[VSSpeechServerTask request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "gender");

    if (!v13)
    {
      v14 = objc_msgSend(v8, "defaultVoiceGender");
      -[VSSpeechServerTask request](self, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setGender:", v14);

    }
    -[VSSpeechServerTask request](self, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultVoiceNameForGender:", objc_msgSend(v16, "gender"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask request](self, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setVoiceName:", v17);

  }
  v19 = (void *)objc_opt_new();
  -[VSSpeechServerTask request](self, "request");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask request](self, "request");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "languageCode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask request](self, "request");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "voiceName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "estimatedTTSWordTimingForText:withLanguage:voiceName:", v21, v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask setWordTimingInfo:](self, "setWordTimingInfo:", v26);

  -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    -[VSSpeechServerTask reportTimingInfo](self, "reportTimingInfo");
  dispatch_get_global_queue(33, 0);
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__VSSpeechServerTask_proceedWithServerTTS__block_invoke;
  block[3] = &unk_24DD8EBB0;
  block[4] = self;
  dispatch_async(v28, block);

  -[VSSpeechServerTask request](self, "request");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "disableDeviceRacing");

  if ((v30 & 1) != 0)
  {
    VSGetLogDefault();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v32 = "Device TTS will not race";
    v33 = v31;
    v34 = 2;
    goto LABEL_14;
  }
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setIsServerTTSRacing:", 1);

  VSGetLogDefault();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v36, OS_LOG_TYPE_DEFAULT, "Device TTS is racing with Server TTS", buf, 2u);
  }

  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "start");

  VSGetLogDefault();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    -[VSSpeechServerTask deviceTTSWaitTime](self, "deviceTTSWaitTime");
    *(_DWORD *)buf = 134217984;
    v53 = v38;
    v32 = "Device TTS wait time for server audio: %.2f";
    v33 = v31;
    v34 = 12;
LABEL_14:
    _os_log_impl(&dword_21AA84000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
  }
LABEL_15:

  v39 = -[VSSpeechServerTask shouldRelyOnServerTTS](self, "shouldRelyOnServerTTS");
  if ((-[VSSpeechServerTask isCancelled](self, "isCancelled") & 1) == 0)
  {
    if (v39)
    {
      -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "waitUntilFinished");
    }
    else
    {
      -[VSSpeechServerTask deviceTTSWaitTime](self, "deviceTTSWaitTime");
      if (v41 <= 0.0)
        goto LABEL_27;
      -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask deviceTTSWaitTime](self, "deviceTTSWaitTime");
      objc_msgSend(v40, "waitUntilFinishedIfAudioReceivedWithin:");
    }

    if ((-[VSSpeechServerTask isCancelled](self, "isCancelled") & 1) == 0)
    {
      -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "error");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "code");

      if (v44 != 603)
      {
        -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "error");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {

        }
        else
        {
          -[VSSpeechServerTask error](self, "error");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "domain");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("ServerTTSErrorDomain"));

          if (!v50)
            goto LABEL_27;
        }
        -[VSSpeechServerTask fallbackToDeviceSynthesis](self, "fallbackToDeviceSynthesis");
        goto LABEL_27;
      }
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setErrorCode:", 603);

      -[VSSpeechServerTask speakRetryPhrase](self, "speakRetryPhrase");
    }
  }
LABEL_27:

}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 400, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask setError:](self, "setError:", v3);

  if ((-[VSSpeechServerTask isExecuting](self, "isExecuting") & 1) != 0
    || (-[VSSpeechServerTask isCancelled](self, "isCancelled") & 1) != 0
    || (-[VSSpeechServerTask isFinished](self, "isFinished") & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)VSSpeechServerTask;
    -[VSSpeechServerTask cancel](&v7, sel_cancel);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)VSSpeechServerTask;
    -[VSSpeechServerTask cancel](&v8, sel_cancel);
    -[VSSpeechServerTask reportFinish](self, "reportFinish");
  }
  -[VSSpeechServerTask playbackService](self, "playbackService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cancel");

  pthread_cond_broadcast(&self->_timeoutCondition);
}

- (void)suspend
{
  id v2;

  -[VSSpeechServerTask playbackService](self, "playbackService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (void)resume
{
  id v2;
  id v3;

  -[VSSpeechServerTask playbackService](self, "playbackService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "start");

}

- (id)taskHash
{
  return &stru_24DD8EF88;
}

- (BOOL)isSpeaking
{
  BOOL v2;
  void *v3;

  if (self->_shouldSpeak)
    return 1;
  -[VSSpeechServerTask speakTask](self, "speakTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (void)setObserverForWordTimings:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[VSSpeechServerTask playbackService](self, "playbackService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__VSSpeechServerTask_setObserverForWordTimings___block_invoke;
  v6[3] = &unk_24DD8E9C8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "setBoundaryTimeObserverForTimingInfos:usingBlock:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

- (void)reportTimingInfo
{
  _BOOL4 shouldSpeak;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  shouldSpeak = self->_shouldSpeak;
  -[VSSpeechServerTask delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldSpeak)
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      goto LABEL_7;
    -[VSSpeechServerTask delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "speechRequest:didReceiveTimingInfo:", v7, v8);
  }
  else
  {
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
      goto LABEL_7;
    -[VSSpeechServerTask delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask request](self, "request");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synthesisRequest:didReceiveTimingInfo:", v7, v8);
  }

LABEL_7:
  -[VSSpeechServerTask speakTask](self, "speakTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "request");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask wordTimingInfo](self, "wordTimingInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "speechRequest:didReceiveTimingInfo:", v15, v16);

  }
}

- (void)reportSpeechStart
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldSpeak)
  {
    -[VSSpeechServerTask delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[VSSpeechServerTask delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask request](self, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "speechRequestDidStart:", v6);

    }
  }
  -[VSSpeechServerTask speakTask](self, "speakTask");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[VSSpeechServerTask speakTask](self, "speakTask");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask speakTask](self, "speakTask");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "request");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "speechRequestDidStart:", v15);

    }
  }
  if (-[VSSpeechServerTask useServerResponse](self, "useServerResponse"))
  {
    -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "voice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "selectedVoice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "voiceData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (-[VSSpeechServerTask useServerResponse](self, "useServerResponse"))
  {
    -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "voiceResource");
  }
  else
  {
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "selectedVoiceResource");
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSSpeechServerTask siriInstrumentation](self, "siriInstrumentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v37, "sourceOfTTS");
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "timeToSpeakLatency");
  v22 = v21;
  -[VSSpeechServerTask playbackService](self, "playbackService");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "outputRouteInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v17, "type");
  v25 = objc_msgSend(v17, "footprint");
  objc_msgSend(v17, "contentVersion");
  v39 = v17;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "unsignedIntegerValue");
  objc_msgSend(v38, "contentVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "unsignedIntegerValue");
  -[VSSpeechServerTask request](self, "request");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v33) = objc_msgSend(v30, "shouldWhisper");
  objc_msgSend(v20, "instrumentSpeechStartedWithSource:customerPerceivedLatency:audioOutputRoute:voiceType:voiceFootprint:voiceVersion:resourceVersion:isWhisper:", v34, v23, v24, v25, v27, v29, v22, v33);

  VSGetLogDefault();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v41 = objc_msgSend(v32, "requestCreatedTimestamp");
    _os_log_debug_impl(&dword_21AA84000, v31, OS_LOG_TYPE_DEBUG, "Server task %llu started speaking", buf, 0xCu);

  }
}

- (void)reportInstrumentMetrics
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
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
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (self->_shouldSpeak)
  {
    -[VSSpeechServerTask delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[VSSpeechServerTask delegate](self, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask request](self, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "speechRequest:didReportInstrumentMetrics:", v6, v7);

    }
  }
  -[VSSpeechServerTask speakTask](self, "speakTask");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "instrumentMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "voiceAssetKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setVoiceAssetKey:", v14);

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "voiceResourceAssetKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setVoiceResourceAssetKey:", v16);

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "utterance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUtterance:", v18);

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSynthesisBeginTimestamp:", objc_msgSend(v19, "synthesisBeginTimestamp"));

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSynthesisEndTimestamp:", objc_msgSend(v20, "synthesisEndTimestamp"));

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSpeechBeginTimestamp:", objc_msgSend(v21, "speechBeginTimestamp"));

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSpeechEndTimestamp:", objc_msgSend(v22, "speechEndTimestamp"));

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAudioStartTimestampDiffs:", objc_msgSend(v23, "audioStartTimestampDiffs"));

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "audioDuration");
    objc_msgSend(v12, "setAudioDuration:");

    v25 = objc_msgSend(v12, "requestCreatedTimestamp");
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEagerRequestCreatedTimestampDiffs:", v25 - objc_msgSend(v26, "requestCreatedTimestamp"));

    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIsServerTimeout:", objc_msgSend(v27, "isServerTimeout"));

    -[VSSpeechServerTask speakTask](self, "speakTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "delegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "request");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "speechRequest:didReportInstrumentMetrics:", v31, v32);

  }
  VSGetLogDefault();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "requestCreatedTimestamp");
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 134218242;
    v42 = v35;
    v43 = 2112;
    v44 = v36;
    _os_log_impl(&dword_21AA84000, v33, OS_LOG_TYPE_DEFAULT, "Server task %llu: Instrument metric: %@", (uint8_t *)&v41, 0x16u);

  }
  +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "dictionaryMetrics");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dumpInstrumentMetrics:withTimestamp:", v39, objc_msgSend(v40, "requestCreatedTimestamp"));

}

- (id)voiceKey
{
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isServerTTS");

  if ((v4 & 1) != 0)
  {
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sourceOfTTS");

    if (v6 != 5)
    {
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "voiceAssetKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    -[VSSpeechServerTask ospreyCore](self, "ospreyCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "voice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "descriptiveKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VSSpeechServerTask synthesisCore](self, "synthesisCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectedVoice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "voiceData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "descriptiveKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_7:

  return v9;
}

- (void)reportFinish
{
  _BOOL4 shouldSpeak;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL8 v29;
  __CFString *v30;
  NSObject *v31;
  int v32;
  const __CFString *v33;
  _BOOL4 v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  __CFString *v74;
  void *v75;
  const __CFString *v76;
  const __CFString *v77;
  int v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  __CFString *v84;
  void *v85;
  _QWORD v86[6];
  _QWORD v87[6];
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  const __CFString *v91;
  __int16 v92;
  const __CFString *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  _QWORD v98[4];

  v98[1] = *MEMORY[0x24BDAC8D0];
  shouldSpeak = self->_shouldSpeak;
  -[VSSpeechServerTask delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (shouldSpeak)
  {
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[VSSpeechServerTask delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask request](self, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[VSSpeechServerTask isCancelled](self, "isCancelled") ^ 1;
      -[VSSpeechServerTask error](self, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "speechRequest:didStopWithSuccess:phonemesSpoken:error:", v7, v8, &stru_24DD8EF88, v9);
LABEL_6:

    }
  }
  else
  {
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[VSSpeechServerTask delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask request](self, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask error](self, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "synthesisRequest:didFinishWithInstrumentMetrics:error:", v7, v9, v11);

      goto LABEL_6;
    }
  }
  -[VSSpeechServerTask speakTask](self, "speakTask");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      -[VSSpeechServerTask speakTask](self, "speakTask");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechServerTask speakTask](self, "speakTask");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "request");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[VSSpeechServerTask isCancelled](self, "isCancelled") ^ 1;
      -[VSSpeechServerTask error](self, "error");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "speechRequest:didStopWithSuccess:phonemesSpoken:error:", v20, v21, &stru_24DD8EF88, v22);

    }
  }
  -[VSSpeechServerTask error](self, "error");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_14;
  v24 = (void *)v23;
  -[VSSpeechServerTask error](self, "error");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v25, "code") == 400)
  {

LABEL_14:
    -[VSSpeechServerTask speakTask](self, "speakTask");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      v29 = 1;
    else
      v29 = -[VSSpeechServerTask isEagerCache](self, "isEagerCache");

    -[VSSpeechServerTask voiceKey](self, "voiceKey");
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    VSGetLogDefault();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v83, "requestCreatedTimestamp");
      v32 = -[VSSpeechServerTask isCancelled](self, "isCancelled");
      v33 = CFSTR("Finished");
      if (v32)
        v33 = CFSTR("Cancelled");
      v77 = v33;
      v34 = -[VSSpeechServerTask isSpeaking](self, "isSpeaking");
      v35 = CFSTR("synthesizing");
      if (v34)
        v35 = CFSTR("speaking");
      v76 = v35;
      -[VSSpeechServerTask request](self, "request");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "logUtterance");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = CFSTR("(null)");
      if (v30)
        v37 = v30;
      v87[0] = v37;
      v85 = (void *)v36;
      v86[0] = CFSTR("voice");
      v86[1] = CFSTR("is_eager");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v29);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = v81;
      v86[2] = CFSTR("is_one_shot");
      v38 = (void *)MEMORY[0x24BDD16E0];
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend(v80, "isServerTTS");
      v84 = v30;
      if (v78)
      {
        -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v75, "isSynthesisCached"))
          v39 = v29 ^ 1;
        else
          v39 = 0;
      }
      else
      {
        v39 = 0;
      }
      objc_msgSend(v38, "numberWithInt:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v87[2] = v40;
      v86[3] = CFSTR("is_time_out");
      v41 = (void *)MEMORY[0x24BDD16E0];
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "numberWithBool:", objc_msgSend(v42, "isServerTimeout"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v87[3] = v43;
      v86[4] = CFSTR("is_device_tts");
      v44 = (void *)MEMORY[0x24BDD16E0];
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "numberWithInt:", objc_msgSend(v45, "isServerTTS") ^ 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v87[4] = v46;
      v86[5] = CFSTR("source_of_tts");
      v47 = (void *)MEMORY[0x24BEC0D88];
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringOfSourceOfTTS:", objc_msgSend(v48, "sourceOfTTS"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v87[5] = v49;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, v86, 6);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v89 = v79;
      v90 = 2112;
      v91 = v77;
      v92 = 2112;
      v93 = v76;
      v94 = 2112;
      v95 = v85;
      v96 = 2114;
      v97 = v50;
      _os_log_impl(&dword_21AA84000, v31, OS_LOG_TYPE_DEFAULT, "Server task %llu: %@ %@ utterance: '%@', %{public}@", buf, 0x34u);

      if (v78)
      v30 = v84;
    }

    v51 = -[VSSpeechServerTask isCancelled](self, "isCancelled");
    -[VSSpeechServerTask siriInstrumentation](self, "siriInstrumentation");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v51)
    {
      objc_msgSend(v52, "instrumentSpeechCancelled");
    }
    else
    {
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "audioDuration");
      v56 = v55;
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "ttsSynthesisLatency");
      v59 = v58;
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "cappedRealTimeFactor");
      v62 = v61;
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "promptCount");
      -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "instrumentSpeechEndedWithAudioDuration:synthesisLatency:realTimeFactor:promptCount:errorCode:", v64, objc_msgSend(v65, "errorCode"), v56, v59, v62);

    }
    v66 = (void *)MEMORY[0x24BEC0D70];
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "reportInstrumentMetrics:", v67);
    goto LABEL_36;
  }
  -[VSSpeechServerTask error](self, "error");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "code");

  if (v27 == 501)
    goto LABEL_14;
  VSGetLogDefault();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
  {
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "requestCreatedTimestamp");
    -[VSSpeechServerTask error](self, "error");
    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v89 = v73;
    v90 = 2112;
    v91 = v74;
    _os_log_error_impl(&dword_21AA84000, v68, OS_LOG_TYPE_ERROR, "Error in server task %llu, error: %@", buf, 0x16u);

  }
  -[VSSpeechServerTask siriInstrumentation](self, "siriInstrumentation");
  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)MEMORY[0x24BDD16E0];
  -[VSSpeechServerTask error](self, "error");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "numberWithInteger:", objc_msgSend(v67, "code"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v70;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString instrumentSpeechFailedWithErrorCodes:](v30, "instrumentSpeechFailedWithErrorCodes:", v71);

LABEL_36:
}

- (void)writeAudioIfNeeded:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = 0;
    v6 = v4;
  }
  else
  {
    objc_opt_class();
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
  }
  v9 = v4;
  v7 = v5;
  v8 = v6;
LABEL_5:
  -[VSSpeechServerTask speakTask](self, "speakTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

  }
  else if (!-[VSSpeechServerTask shouldSpeak](self, "shouldSpeak"))
  {
    goto LABEL_13;
  }
  if (v8)
  {
    +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dumpStreamAudio:forRequest:", v8, v12);
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask request](self, "request");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dumpCompressedAudio:forRequest:", v7, v12);
  }

LABEL_13:
  -[VSSpeechServerTask request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "outputPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    goto LABEL_22;
  if (v8)
  {
    v16 = objc_msgSend(v8, "writeWaveToFilePath:", v15);
  }
  else
  {
    if (!v7)
    {
      v17 = 0;
      goto LABEL_19;
    }
    v16 = objc_msgSend(v7, "writeToFilePath:", v15);
  }
  v17 = v16 ^ 1;
LABEL_19:
  -[VSSpeechServerTask error](self, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18 && v17)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FD0];
    v23[0] = CFSTR("writeWaveToFilePath failed.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 501, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask setError:](self, "setError:", v21);

  }
LABEL_22:

}

- (id)audioPowerProvider
{
  void *v2;
  void *v3;

  -[VSSpeechServerTask playbackService](self, "playbackService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioPowerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)synthesisCore:(id)a3 didReceiveAudio:(id)a4
{
  id v4;

  v4 = -[VSSpeechServerTask handleDeviceSynthesis:timingInfo:](self, "handleDeviceSynthesis:timingInfo:", a4, 0);
}

- (void)synthesisCore:(id)a3 didReceiveWordTimingInfo:(id)a4
{
  id v4;

  v4 = -[VSSpeechServerTask handleDeviceSynthesis:timingInfo:](self, "handleDeviceSynthesis:timingInfo:", 0, a4);
}

- (void)ospreyCore:(id)a3 didReceiveAudio:(id)a4 wordTimingInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;

  v21 = a3;
  v8 = a4;
  v9 = a5;
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "voiceAssetKey");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
  }
  else
  {
    objc_msgSend(v21, "voice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_6;
    objc_msgSend(v21, "voice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "voiceKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setVoiceAssetKey:", v12);

  }
LABEL_6:
  -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "voiceResourceAssetKey");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
LABEL_10:

    goto LABEL_11;
  }
  objc_msgSend(v21, "voiceResource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v21, "voiceResource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechServerTask instrumentMetrics](self, "instrumentMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setVoiceResourceAssetKey:", v17);

    goto LABEL_10;
  }
LABEL_11:
  v20 = -[VSSpeechServerTask handleServerResponse:timingInfo:](self, "handleServerResponse:timingInfo:", v8, v9);

}

- (void)ospreyCore:(id)a3 didFinishWithError:(id)a4
{
  -[VSSpeechServerTask setError:](self, "setError:", a4);
}

- (VSSpeechServiceDelegate)delegate
{
  return (VSSpeechServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldSpeak
{
  return self->_shouldSpeak;
}

- (void)setShouldSpeak:(BOOL)a3
{
  self->_shouldSpeak = a3;
}

- (BOOL)isNeuralFallbackCondition
{
  return self->_isNeuralFallbackCondition;
}

- (void)setIsNeuralFallbackCondition:(BOOL)a3
{
  self->_isNeuralFallbackCondition = a3;
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setInstrumentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentMetrics, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (VSAudioPlaybackService)playbackService
{
  return self->_playbackService;
}

- (void)setPlaybackService:(id)a3
{
  objc_storeStrong((id *)&self->_playbackService, a3);
}

- (NSArray)wordTimingInfo
{
  return self->_wordTimingInfo;
}

- (void)setWordTimingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_wordTimingInfo, a3);
}

- (_opaque_pthread_cond_t)timeoutCondition
{
  __int128 v3;

  v3 = *(_OWORD *)&self[8].__opaque[8];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[8].__sig;
  *(_OWORD *)&retstr->__opaque[8] = v3;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[8].__opaque[24];
  return self;
}

- (void)setTimeoutCondition:(_opaque_pthread_cond_t *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->__opaque[8];
  v3 = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_timeoutCondition.__sig = *(_OWORD *)&a3->__sig;
  *(_OWORD *)&self->_timeoutCondition.__opaque[8] = v4;
  *(_OWORD *)&self->_timeoutCondition.__opaque[24] = v3;
}

- (void)setDeviceTTSWaitTime:(double)a3
{
  self->_deviceTTSWaitTime = a3;
}

- (BOOL)readyForEagerTask
{
  return self->_readyForEagerTask;
}

- (void)setReadyForEagerTask:(BOOL)a3
{
  self->_readyForEagerTask = a3;
}

- (VSSpeechServerTask)speakTask
{
  return self->_speakTask;
}

- (void)setSpeakTask:(id)a3
{
  objc_storeStrong((id *)&self->_speakTask, a3);
}

- (VSDeviceTTSCore)synthesisCore
{
  return self->_synthesisCore;
}

- (void)setSynthesisCore:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisCore, a3);
}

- (BOOL)useServerResponse
{
  return self->_useServerResponse;
}

- (void)setUseServerResponse:(BOOL)a3
{
  self->_useServerResponse = a3;
}

- (BOOL)useDeviceSynthesis
{
  return self->_useDeviceSynthesis;
}

- (void)setUseDeviceSynthesis:(BOOL)a3
{
  self->_useDeviceSynthesis = a3;
}

- (BOOL)speechStartReported
{
  return self->_speechStartReported;
}

- (void)setSpeechStartReported:(BOOL)a3
{
  self->_speechStartReported = a3;
}

- (BOOL)isEagerCache
{
  return self->_isEagerCache;
}

- (void)setIsEagerCache:(BOOL)a3
{
  self->_isEagerCache = a3;
}

- (_opaque_pthread_mutex_t)racingMutex
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self[7].__sig;
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self[6].__opaque[40];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  v4 = *(_OWORD *)&self[7].__opaque[24];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self[7].__opaque[8];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setRacingMutex:(_opaque_pthread_mutex_t *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->__opaque[40];
  v5 = *(_OWORD *)&a3->__sig;
  v4 = *(_OWORD *)&a3->__opaque[8];
  *(_OWORD *)&self->_racingMutex.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_racingMutex.__opaque[40] = v3;
  *(_OWORD *)&self->_racingMutex.__sig = v5;
  *(_OWORD *)&self->_racingMutex.__opaque[8] = v4;
}

- (VSAudioData)serverAudio
{
  return self->_serverAudio;
}

- (void)setServerAudio:(id)a3
{
  objc_storeStrong((id *)&self->_serverAudio, a3);
}

- (NSArray)deferredTTSTimingInfo
{
  return self->_deferredTTSTimingInfo;
}

- (void)setDeferredTTSTimingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_deferredTTSTimingInfo, a3);
}

- (VSSiriInstrumentation)siriInstrumentation
{
  return self->_siriInstrumentation;
}

- (void)setSiriInstrumentation:(id)a3
{
  objc_storeStrong((id *)&self->_siriInstrumentation, a3);
}

- (VSSpeechInternalSettings)internalSettings
{
  return self->_internalSettings;
}

- (void)setInternalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_internalSettings, a3);
}

- (VSOspreyTTSCore)ospreyCore
{
  return self->_ospreyCore;
}

- (void)setOspreyCore:(id)a3
{
  objc_storeStrong((id *)&self->_ospreyCore, a3);
}

- (VSCachingService)cachingService
{
  return self->_cachingService;
}

- (void)setCachingService:(id)a3
{
  objc_storeStrong((id *)&self->_cachingService, a3);
}

- (VSSiriServerConfiguration)serverTTSConfig
{
  return self->_serverTTSConfig;
}

- (void)setServerTTSConfig:(id)a3
{
  objc_storeStrong((id *)&self->_serverTTSConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverTTSConfig, 0);
  objc_storeStrong((id *)&self->_cachingService, 0);
  objc_storeStrong((id *)&self->_ospreyCore, 0);
  objc_storeStrong((id *)&self->_internalSettings, 0);
  objc_storeStrong((id *)&self->_siriInstrumentation, 0);
  objc_storeStrong((id *)&self->_deferredTTSTimingInfo, 0);
  objc_storeStrong((id *)&self->_serverAudio, 0);
  objc_storeStrong((id *)&self->_synthesisCore, 0);
  objc_storeStrong((id *)&self->_speakTask, 0);
  objc_storeStrong((id *)&self->_wordTimingInfo, 0);
  objc_storeStrong((id *)&self->_playbackService, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __48__VSSpeechServerTask_setObserverForWordTimings___block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v21 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[248])
    {
      objc_msgSend(WeakRetained, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        objc_msgSend(v4, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "request");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v21, "textRange");
        objc_msgSend(v7, "speechRequest:didStartWithMark:forRange:", v8, 1, v9, v10);

      }
    }
    objc_msgSend(v4, "speakTask");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      objc_msgSend(v4, "speakTask");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        objc_msgSend(v4, "speakTask");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "delegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "request");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v21, "textRange");
        objc_msgSend(v17, "speechRequest:didStartWithMark:forRange:", v18, 1, v19, v20);

      }
    }
  }

}

void __42__VSSpeechServerTask_proceedWithServerTTS__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "ospreyCore");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "start");

}

void __47__VSSpeechServerTask_fallbackToDeviceSynthesis__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, _BYTE *a5)
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _OWORD v17[2];
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v9 = (objc_class *)MEMORY[0x24BEC0D78];
  v10 = a4;
  v11 = a2;
  v12 = objc_alloc_init(v9);
  objc_msgSend(*(id *)(a1 + 32), "synthesisCore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "streamAudio");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "asbd");
  }
  else
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
  }
  v17[0] = v19;
  v17[1] = v20;
  v18 = v21;
  objc_msgSend(v12, "setAsbd:", v17);

  objc_msgSend(v12, "setPacketCount:", a3);
  objc_msgSend(v12, "setPacketDescriptions:", v10);

  objc_msgSend(v12, "setAudioData:", v11);
  objc_msgSend(*(id *)(a1 + 32), "enqueueAudioData:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    *a5 = 1;

}

@end
