@implementation _LTOspreySpeechTranslationSession

- (void)sendAnalyticsEvent
{
  id v2;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v2, &location);
  AnalyticsSendEventLazy();
  objc_destroyWeak(&v2);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  const __CFString *v3;
  __CFString *v4;
  const __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  objc_class *v20;
  void *v21;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  __CFString *v29;

  if (self->_sentAudio)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v27 = (__CFString *)v3;
  if (self->_sentEndAudio)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if (self->_endpointedSpeech)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v25 = (__CFString *)v5;
  if (self->_didReceiveAudioLimitExceededResponse)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_didReceivePartialRecognitionResponse)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_didReceiveFinalRecognitionResponse)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_didReceiveTranslationResponse)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_didReceiveTTSResponse)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (self->_didReceiveFinalBlazarResponse)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (self->_didTimeout)
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  v26 = (void *)MEMORY[0x24BDD17C8];
  v24 = v12;
  v23 = v11;
  v29 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  v16 = v6;
  v17 = v25;
  v18 = v4;
  v19 = v27;
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("<%@: sentAudio:%@ sentEndAudio:%@ endpointedSpeech:%@ didReceiveAudioLimitExceededResponse:%@ didReceivePartialRecognitionResponse:%@ didReceiveFinalRecognitionResponse:%@ didReceiveTranslationResponse:%@  didReceiveTTSResponse:%@ didReceiveFinalBlazarResponse:%@ didTimeout:%@ error %@>"), v21, v19, v18, v17, v16, v15, v14, v13, v29, v23, v24, self->_error);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v28;
}

- (_LTOspreySpeechTranslationSession)initWithService:(id)a3 context:(id)a4 delegate:(id)a5 selfLoggingManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _LTOspreySpeechTranslationSession *v15;
  _LTOspreySpeechTranslationSession *v16;
  _LTSpeechCompressor *v17;
  _LTSpeechCompressor *speechCompressor;
  uint64_t v19;
  NSMutableDictionary *finalASRResults;
  uint64_t v21;
  NSMutableArray *mtResults;
  uint64_t v23;
  NSMutableArray *confirmedTranslations;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id *v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  id *v43;
  id v44[2];
  _QWORD v45[4];
  id v46;
  objc_super v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v47.receiver = self;
  v47.super_class = (Class)_LTOspreySpeechTranslationSession;
  v15 = -[_LTOspreySpeechTranslationSession init](&v47, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_delegate, v13);
    objc_storeStrong((id *)&v16->_context, a4);
    v17 = -[_LTSpeechCompressor initWithDelegate:]([_LTSpeechCompressor alloc], "initWithDelegate:", v16);
    speechCompressor = v16->_speechCompressor;
    v16->_speechCompressor = v17;

    -[_LTSpeechCompressor startCompressionNarrowband:](v16->_speechCompressor, "startCompressionNarrowband:", 0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    finalASRResults = v16->_finalASRResults;
    v16->_finalASRResults = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    mtResults = v16->_mtResults;
    v16->_mtResults = (NSMutableArray *)v21;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v23 = objc_claimAutoreleasedReturnValue();
    confirmedTranslations = v16->_confirmedTranslations;
    v16->_confirmedTranslations = (NSMutableArray *)v23;

    v16->_audioPacketCount = 0;
    v16->_didSendTranslationDidFinish = 0;
    *(_QWORD *)&v16->_sentAudio = 0;
    v16->_didReceiveFinalBlazarResponse = 0;
    objc_storeStrong((id *)&v16->_selfLoggingManager, a6);
    v25 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      objc_msgSend(v12, "uniqueID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sessionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _LTPreferencesSessionIDOverride(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v12, "dataSharingOptInStatus");
      *(_DWORD *)buf = 138543874;
      v49 = v27;
      v50 = 2114;
      v51 = v29;
      v52 = 2048;
      v53 = v30;
      _os_log_impl(&dword_2491B9000, v26, OS_LOG_TYPE_INFO, "Starting speech translation with request ID: %{public}@ session ID: %{public}@, opt in status: %zd", buf, 0x20u);

    }
    objc_initWeak((id *)buf, v16);
    v31 = MEMORY[0x24BDAC760];
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke;
    v45[3] = &unk_251A13738;
    v32 = v12;
    v46 = v32;
    v39 = v31;
    v40 = 3221225472;
    v41 = __89___LTOspreySpeechTranslationSession_initWithService_context_delegate_selfLoggingManager___block_invoke_36;
    v42 = &unk_251A13760;
    v33 = v16;
    v43 = v33;
    v44[1] = (id)a2;
    objc_copyWeak(v44, (id *)buf);
    objc_msgSend(v11, "performSpeechTranslationWithDelegate:requestBuilder:completion:", v33, v45, &v39);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v33[1];
    v33[1] = (id)v34;

    objc_msgSend(v32, "_ospreySpeechTranslationRequestWithHybridEndpointer:", 1, v39, v40, v41, v42);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33[1], "sendSpeechTranslationStreamingRequest:", v36);
    objc_msgSend(v33, "initCommon");
    v37 = v33;

    objc_destroyWeak(v44);
    objc_destroyWeak((id *)buf);
  }

  return v16;
}

- (_LTOspreySpeechTranslationSession)initWithService:(id)a3 context:(id)a4 text:(id)a5 delegate:(id)a6 selfLoggingManager:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _LTOspreySpeechTranslationSession *v17;
  NSObject *v18;
  uint64_t v19;
  NSMutableArray *mtResults;
  uint64_t v21;
  NSMutableArray *confirmedTranslations;
  uint64_t v23;
  NSString *cachedUserTypedText;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id *v37;
  _QWORD v39[4];
  id *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)_LTOspreySpeechTranslationSession;
  v17 = -[_LTOspreySpeechTranslationSession init](&v44, sel_init);
  if (v17)
  {
    if (!v14)
    {
      v18 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[_LTOspreySpeechTranslationSession initWithService:context:text:delegate:selfLoggingManager:].cold.1();
    }
    objc_storeWeak((id *)&v17->_delegate, v15);
    objc_storeStrong((id *)&v17->_context, a4);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    mtResults = v17->_mtResults;
    v17->_mtResults = (NSMutableArray *)v19;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = objc_claimAutoreleasedReturnValue();
    confirmedTranslations = v17->_confirmedTranslations;
    v17->_confirmedTranslations = (NSMutableArray *)v21;

    v23 = objc_msgSend(v14, "copy");
    cachedUserTypedText = v17->_cachedUserTypedText;
    v17->_cachedUserTypedText = (NSString *)v23;

    objc_storeStrong((id *)&v17->_selfLoggingManager, a7);
    v25 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = v25;
      objc_msgSend(v13, "uniqueID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sessionID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      _LTPreferencesSessionIDOverride(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v13, "dataSharingOptInStatus");
      *(_DWORD *)buf = 138543874;
      v46 = v27;
      v47 = 2114;
      v48 = v29;
      v49 = 2048;
      v50 = v30;
      _os_log_impl(&dword_2491B9000, v26, OS_LOG_TYPE_INFO, "Starting text to speech translation with request ID: %{public}@, session ID: %{public}@, opt in status: %zd", buf, 0x20u);

    }
    objc_initWeak((id *)buf, v17);
    v31 = MEMORY[0x24BDAC760];
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke;
    v42[3] = &unk_251A13738;
    v32 = v13;
    v43 = v32;
    v39[0] = v31;
    v39[1] = 3221225472;
    v39[2] = __94___LTOspreySpeechTranslationSession_initWithService_context_text_delegate_selfLoggingManager___block_invoke_2;
    v39[3] = &unk_251A13788;
    v33 = v17;
    v40 = v33;
    objc_copyWeak(&v41, (id *)buf);
    objc_msgSend(v12, "performSpeechTranslationWithDelegate:requestBuilder:completion:", v33, v42, v39);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v33[1];
    v33[1] = (id)v34;

    objc_msgSend(v32, "_ospreyTextToSpeechTranslationRequestWithText:", v14);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33[1], "sendSpeechTranslationStreamingRequest:", v36);
    objc_msgSend(v33, "initCommon");
    v37 = v33;

    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);
  }

  return v17;
}

- (void)initCommon
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *timerQueue;
  _LTDSELFLoggingManager *selfLoggingManager;
  void *v6;
  id v7;

  self->_initialOnlineTimeout = _LTPreferencesServerSpeechSessionInitialOnlineTimeout();
  self->_onlineTimeout = _LTPreferencesServerSpeechSessionOnlineTimeout();
  self->_endpointTimeout = _LTPreferencesServerSpeechSessionEndpointTimeout();
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.translation.speech-timer", 0);
  timerQueue = self->_timerQueue;
  self->_timerQueue = v3;

  -[_LTOspreySpeechTranslationSession startServerTimeoutTimer](self, "startServerTimeoutTimer");
  selfLoggingManager = self->_selfLoggingManager;
  -[_LTTranslationContext logIdentifier](self->_context, "logIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationContext uniqueID](self->_context, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDSELFLoggingManager sendSpeechTranslationFrameworkRequestSentWithInvocationId:qssSessionId:requestRoute:payloadSizeInBytes:](selfLoggingManager, "sendSpeechTranslationFrameworkRequestSentWithInvocationId:qssSessionId:requestRoute:payloadSizeInBytes:", v7, v6, 1, 0);

}

- (void)startServerTimeoutTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *serverTimer;

  if (!self->_serverTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_timerQueue);
    serverTimer = self->_serverTimer;
    self->_serverTimer = v3;

    -[_LTOspreySpeechTranslationSession updateServerTimeout:](self, "updateServerTimeout:", self->_initialOnlineTimeout);
    dispatch_resume((dispatch_object_t)self->_serverTimer);
  }
}

- (void)updateServerTimeout:(double)a3
{
  NSObject *serverTimer;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (self->_serverTimer)
  {
    objc_initWeak(&location, self);
    serverTimer = self->_serverTimer;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57___LTOspreySpeechTranslationSession_updateServerTimeout___block_invoke;
    v11[3] = &unk_251A111A0;
    objc_copyWeak(&v12, &location);
    dispatch_source_set_event_handler(serverTimer, v11);
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_LTOspreySpeechTranslationSession updateServerTimeout:].cold.1(v6, a3, v7, v8);
    v9 = self->_serverTimer;
    v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)cancelServerTimeout
{
  NSObject *serverTimer;
  OS_dispatch_source *v4;

  serverTimer = self->_serverTimer;
  if (serverTimer)
  {
    dispatch_source_cancel(serverTimer);
    v4 = self->_serverTimer;
    self->_serverTimer = 0;

  }
}

- (void)serverTimeoutFired
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Server timeout triggered", v5, 2u);
  }
  self->_didTimeout = 1;
  objc_msgSend(MEMORY[0x24BDD1540], "lt_translationTimeout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTOspreySpeechTranslationSession translationDidFinishWithError:](self, "translationDidFinishWithError:", v4);

  -[_LTOspreySpeechTranslationSession cancel](self, "cancel");
}

- (void)sendAudioData:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 endpointedSpeech;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  if (self->_didReceiveFinalRecognitionResponse)
  {
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_LTOspreySpeechTranslationSession sendAudioData:].cold.3();
  }
  else if (self->_sentEndAudio)
  {
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[_LTOspreySpeechTranslationSession sendAudioData:].cold.2();
  }
  else
  {
    endpointedSpeech = self->_endpointedSpeech;
    v8 = _LTOSLogTranslationEngine();
    v9 = v8;
    if (endpointedSpeech)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[_LTOspreySpeechTranslationSession sendAudioData:].cold.1();
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "sendAudioData: Start compressing audio", v10, 2u);
      }
      -[_LTSpeechCompressor addAudioSampleData:](self->_speechCompressor, "addAudioSampleData:", v4);
      self->_sentAudio = 1;
    }
  }

}

- (void)sendEndAudio
{
  NSObject *v3;
  FTMutableFinishAudio *v4;
  FTMutableSpeechTranslationStreamingRequest *v5;
  uint8_t v6[16];

  if (self->_sentAudio && !self->_sentEndAudio)
  {
    self->_sentEndAudio = 1;
    v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Sending end audio", v6, 2u);
    }
    v4 = objc_alloc_init(FTMutableFinishAudio);
    -[FTMutableFinishAudio setPacket_count:](v4, "setPacket_count:", LODWORD(self->_audioPacketCount));
    v5 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
    -[FTMutableSpeechTranslationStreamingRequest setContent_type:](v5, "setContent_type:", 5);
    -[FTMutableSpeechTranslationStreamingRequest setContentAsFTFinishAudio:](v5, "setContentAsFTFinishAudio:", v4);
    -[FTSpeechTranslationStreamingContext sendSpeechTranslationStreamingRequest:](self->_streamContext, "sendSpeechTranslationStreamingRequest:", v5);

  }
}

- (void)endpoint
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Ending audio due to endpointer trigger", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)cancel
{
  -[_LTOspreySpeechTranslationSession sendEndAudio](self, "sendEndAudio");
  -[FTSpeechTranslationStreamingContext closeStream](self->_streamContext, "closeStream");
  self->_isCancelled = 1;
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (void)setLanguagesRecognized:(id)a3
{
  id v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  FTMutableLanguageDetected *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  FTMutableLanguageDetectionPrediction *v23;
  void *v24;
  void *v25;
  void *v26;
  FTMutableSpeechTranslationStreamingRequest *v27;
  _LTOspreySpeechTranslationSession *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_lidResult, a3);
  v6 = objc_msgSend(v5, "isFinal");
  v7 = _LTOSLogTranslationEngine();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      -[_LTOspreySpeechTranslationSession _primaryLanguageRecognized](self, "_primaryLanguageRecognized");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_ltLocaleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "LID result received. Primary language recognized: %{public}@", buf, 0xCu);

    }
    v28 = self;
    -[_LTOspreySpeechTranslationSession confirmDataIfNeeded](self, "confirmDataIfNeeded");
    v12 = objc_alloc_init(FTMutableLanguageDetected);
    objc_msgSend(v5, "dominantLanguage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_ltLocaleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableLanguageDetected setDetected_locale:](v12, "setDetected_locale:", v14);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v5, "confidences");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "allKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v23 = objc_alloc_init(FTMutableLanguageDetectionPrediction);
          objc_msgSend(v22, "_ltLocaleIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[FTMutableLanguageDetectionPrediction setLocale:](v23, "setLocale:", v24);

          objc_msgSend(v5, "confidences");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "floatValue");
          -[FTMutableLanguageDetectionPrediction setConfidence:](v23, "setConfidence:");

          objc_msgSend(v15, "addObject:", v23);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    -[FTMutableLanguageDetected setPredictions:](v12, "setPredictions:", v15);
    v27 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
    -[FTMutableSpeechTranslationStreamingRequest setContent_type:](v27, "setContent_type:", 2);
    -[FTMutableSpeechTranslationStreamingRequest setContentAsFTLanguageDetected:](v27, "setContentAsFTLanguageDetected:", v12);
    -[FTSpeechTranslationStreamingContext sendSpeechTranslationStreamingRequest:](v28->_streamContext, "sendSpeechTranslationStreamingRequest:", v27);

  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[_LTOspreySpeechTranslationSession setLanguagesRecognized:].cold.1();
  }

}

- (id)_primaryLanguageRecognized
{
  _LTLanguageDetectionResult *lidResult;
  void *v4;
  void *v5;

  if ((-[_LTTranslationContext autodetectLanguage](self->_context, "autodetectLanguage") & 1) != 0)
  {
    lidResult = self->_lidResult;
    if (lidResult)
    {
      -[_LTLanguageDetectionResult dominantLanguage](lidResult, "dominantLanguage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    -[_LTTranslationContext localePair](self->_context, "localePair");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceLocale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_translationForLocale:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_mtResults;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "locale", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "_ltEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)translationDidFinishWithError:(id)a3
{
  id v5;
  id WeakRetained;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  _LTOspreySpeechTranslationSession *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_error, a3);
  -[_LTOspreySpeechTranslationSession sendEndAudio](self, "sendEndAudio");
  -[_LTOspreySpeechTranslationSession cancelServerTimeout](self, "cancelServerTimeout");
  if (!self->_didSendTranslationDidFinish)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      self->_didSendTranslationDidFinish = 1;
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "translationDidFinishWithError:", v5);

    }
    else
    {
      v9 = _LTOSLogTranslationEngine();
      v10 = v9;
      if (v5)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          -[_LTOspreySpeechTranslationSession translationDidFinishWithError:].cold.1();
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 134217984;
        v12 = self;
        _os_log_impl(&dword_2491B9000, v10, OS_LOG_TYPE_INFO, "Warning: Speech session %p finished successfully but there's no delegate to inform", (uint8_t *)&v11, 0xCu);
      }
    }
  }

}

- (void)confirmDataIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Sending MT responses if needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)didCompressPackets:(id)a3 totalPacketCount:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  FTMutableSpeechTranslationAudioPacket *v9;
  FTMutableSpeechTranslationStreamingRequest *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v11 = 134217984;
    v12 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Sending %zu packets from compressor", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v5, "_ltCompactMap:", &__block_literal_global_21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(FTMutableSpeechTranslationAudioPacket);
  -[FTMutableSpeechTranslationAudioPacket setAudio_frames:](v9, "setAudio_frames:", v8);
  v10 = objc_alloc_init(FTMutableSpeechTranslationStreamingRequest);
  -[FTMutableSpeechTranslationStreamingRequest setContent_type:](v10, "setContent_type:", 4);
  -[FTMutableSpeechTranslationStreamingRequest setContentAsFTSpeechTranslationAudioPacket:](v10, "setContentAsFTSpeechTranslationAudioPacket:", v9);
  -[FTSpeechTranslationStreamingContext sendSpeechTranslationStreamingRequest:](self->_streamContext, "sendSpeechTranslationStreamingRequest:", v10);
  self->_audioPacketCount += objc_msgSend(v8, "count");

}

- (void)_handleAudioLimitExceededResponse:(id)a3
{
  NSObject *v4;
  void *v5;

  self->_didReceiveAudioLimitExceededResponse = 1;
  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[_LTOspreySpeechTranslationSession _handleAudioLimitExceededResponse:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "lt_speechLimitExceeded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTOspreySpeechTranslationSession translationDidFinishWithError:](self, "translationDidFinishWithError:", v5);

}

- (void)_handlePartialRecognitionResponse:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _LTSpeechTranslationDelegate **p_delegate;
  id WeakRetained;
  char v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_didReceivePartialRecognitionResponse = 1;
  objc_msgSend(v4, "source_locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_LTOspreySpeechTranslationSession updateServerTimeout:](self, "updateServerTimeout:", self->_onlineTimeout);
    v6 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      objc_msgSend(v4, "source_locale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v8;
      _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Always sending ASR partial %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6448]), "initWithOspreyPartialRecognitionResponse:isSanitized:", v4, -[_LTTranslationContext censorSpeech](self->_context, "censorSpeech"));
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v13, "speechRecognitionResult:", v9);

    }
  }

}

- (void)_handleFinalRecognitionResponse:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  char v16;
  id v17;
  NSMutableDictionary *finalASRResults;
  void *v19;
  uint8_t v20[16];

  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Received final recognition response", v20, 2u);
  }
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[_LTOspreySpeechTranslationSession _handleFinalRecognitionResponse:].cold.2(v6, v4);
  self->_didReceiveFinalRecognitionResponse = 1;
  v7 = objc_alloc(MEMORY[0x24BDBCEA0]);
  objc_msgSend(v4, "source_locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithLocaleIdentifier:", v8);

  v10 = _LTPreferencesServerASRConfidenceThreshold(v9);
  if ((-[_LTTranslationContext asrConfidenceThreshold](self->_context, "asrConfidenceThreshold") & 0x8000000000000000) == 0)
    v10 = -[_LTTranslationContext asrConfidenceThreshold](self->_context, "asrConfidenceThreshold");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6448]), "initWithOspreyResponse:confidenceThreshold:isSanitized:", v4, v10, -[_LTTranslationContext censorSpeech](self->_context, "censorSpeech"));
  objc_msgSend(v11, "transcriptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_ltCompactMap:", &__block_literal_global_57_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[_LTOspreySpeechTranslationSession _handleFinalRecognitionResponse:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    v17 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v17, "speechRecognitionResult:", v11);

  }
  finalASRResults = self->_finalASRResults;
  objc_msgSend(v11, "locale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](finalASRResults, "setObject:forKeyedSubscript:", v11, v19);

  -[_LTOspreySpeechTranslationSession confirmDataIfNeeded](self, "confirmDataIfNeeded");
}

- (void)_handleServerEndpointFeatures:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _LTSpeechTranslationDelegate **p_delegate;
  id WeakRetained;
  char v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;

  v4 = a3;
  objc_msgSend(v4, "source_locale");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "server_endpoint_features"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[_LTOspreySpeechTranslationSession updateServerTimeout:](self, "updateServerTimeout:", self->_onlineTimeout);
    v8 = objc_alloc(MEMORY[0x24BDF6428]);
    objc_msgSend(v4, "server_endpoint_features");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithResponse:", v9);

    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)p_delegate);
      v15 = objc_alloc(MEMORY[0x24BDBCEA0]);
      objc_msgSend(v4, "source_locale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithLocaleIdentifier:", v16);
      objc_msgSend(v14, "serverEndpointerFeatures:locale:", v10, v17);

    }
  }
  else
  {
    v18 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[_LTOspreySpeechTranslationSession _handleServerEndpointFeatures:].cold.1();
  }

}

- (id)_bestSourceTextForResponse:(id)a3
{
  NSString *cachedUserTypedText;
  NSString *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  cachedUserTypedText = self->_cachedUserTypedText;
  if (cachedUserTypedText)
  {
    v4 = cachedUserTypedText;
  }
  else
  {
    objc_msgSend(a3, "translation_locale_pair");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "source_locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_finalASRResults, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bestTranscription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formattedString");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_handleTranslationResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;

  v4 = a3;
  -[_LTOspreySpeechTranslationSession _bestSourceTextForResponse:](self, "_bestSourceTextForResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF64A8]), "initWithOspreySpeechTranslationMTResponse:sourceText:censorSpeech:", v4, v5, -[_LTTranslationContext censorSpeech](self->_context, "censorSpeech"));
  -[_LTOspreySpeechTranslationSession updateServerTimeout:](self, "updateServerTimeout:", self->_onlineTimeout);
  v7 = objc_msgSend(v4, "is_final");

  if (v7)
    self->_didReceiveTranslationResponse = 1;
  v8 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[_LTOspreySpeechTranslationSession _handleTranslationResponse:].cold.1(v8, v6);
  -[NSMutableArray addObject:](self->_mtResults, "addObject:", v6);
  -[_LTOspreySpeechTranslationSession confirmDataIfNeeded](self, "confirmDataIfNeeded");

}

- (void)_handleTTSResponse:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _LTAudioData *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _LTAudioData *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _OWORD v35[2];
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_didReceiveTTSResponse = 1;
  v5 = _LTOSLogTTS();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "target_locale");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text_to_speech_response");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v38 = v7;
    v39 = 2048;
    v40 = objc_msgSend(v8, "audio_type");
    _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Received TTS response: %{public}@ (%zd)", buf, 0x16u);

  }
  -[_LTOspreySpeechTranslationSession updateServerTimeout:](self, "updateServerTimeout:", self->_onlineTimeout);
  v9 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(v4, "target_locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeWithLocaleIdentifier:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v11;
  -[_LTOspreySpeechTranslationSession _translationForLocale:](self, "_translationForLocale:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "translations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sanitizedFormattedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v13, "formattedString");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v18 = (void *)MEMORY[0x24BDF64E0];
  objc_msgSend(v4, "text_to_speech_response");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "word_timing_info");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "wordTimingInfoFromArray:text:", v20, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [_LTAudioData alloc];
  objc_msgSend(v4, "text_to_speech_response");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "decoder_description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "audioStreamBasicDescription");
  }
  else
  {
    v36 = 0;
    memset(v35, 0, sizeof(v35));
  }
  objc_msgSend(v4, "text_to_speech_response");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "audio");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[_LTAudioData initWithASBD:rawData:wordTimingInfo:](v22, "initWithASBD:rawData:wordTimingInfo:", v35, v27, v21);

  if (!v28)
  {
    v29 = _LTOSLogTTS();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[_LTOspreySpeechTranslationSession _handleTTSResponse:].cold.1();
  }
  v30 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "target_locale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("%@-%@"), v31, v17);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  -[_LTTextToSpeechCache cacheAudioData:forKey:](self->_ttsCache, "cacheAudioData:forKey:", v28, v32);
}

- (BOOL)_receivedEmptyFinalASRResults
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!-[NSMutableDictionary count](self->_finalASRResults, "count"))
    return 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_finalASRResults, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v8, "bestTranscription");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          objc_msgSend(v8, "bestTranscription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "formattedString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", &stru_251A15610);

          if (!v13)
          {
            v14 = 0;
            goto LABEL_14;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_14:

  return v14;
}

- (void)_handleFinalBlazarResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  unsigned int v14;
  void (**completionBlock)(id, void *);
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_LTOspreySpeechTranslationSession cancelServerTimeout](self, "cancelServerTimeout");
  self->_didReceiveFinalBlazarResponse = 1;
  -[FTSpeechTranslationStreamingContext closeStream](self->_streamContext, "closeStream");
  if (_LTRemoteStatusIsSuccess(objc_msgSend(v4, "return_code")))
  {
    if (!-[_LTOspreySpeechTranslationSession _receivedEmptyFinalASRResults](self, "_receivedEmptyFinalASRResults"))
    {
      v12 = 0;
      goto LABEL_11;
    }
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_LTOspreySpeechTranslationSession _handleFinalBlazarResponse:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDF6530];
    v16[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("EMPTY_RECOGNITION_ERROR_DESCRIPTION"), &stru_251A15610, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v16[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SPEECH_NOT_RECOGNIZED_ERROR_DESCRIPTION"), &stru_251A15610, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_LTOspreySpeechTranslationSession _handleFinalBlazarResponse:].cold.2(v13, v4);
    v14 = objc_msgSend(v4, "return_code");
    objc_msgSend(v4, "return_str");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LTErrorFromRemoteFailure(v14, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  -[_LTOspreySpeechTranslationSession translationDidFinishWithError:](self, "translationDidFinishWithError:", v12);
  if (!self->_isCancelled)
  {
    completionBlock = (void (**)(id, void *))self->_completionBlock;
    if (completionBlock)
      completionBlock[2](completionBlock, v12);
  }

}

- (void)streamFailVerifySpeechTranslationStreamingResponse:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[_LTOspreySpeechTranslationSession translationDidFinishWithError:](self, "translationDidFinishWithError:", v4);
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[_LTOspreySpeechTranslationSession streamFailVerifySpeechTranslationStreamingResponse:].cold.1();

}

- (void)streamDidReceiveSpeechTranslationStreamingResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  v5 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Received server message", v7, 2u);
  }
  switch(objc_msgSend(v4, "content_type"))
  {
    case 0:
      -[_LTOspreySpeechTranslationSession cancelServerTimeout](self, "cancelServerTimeout");
      break;
    case 1:
      objc_msgSend(v4, "contentAsFTSpeechTranslationPartialRecognitionResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTOspreySpeechTranslationSession _handlePartialRecognitionResponse:](self, "_handlePartialRecognitionResponse:", v6);
      goto LABEL_12;
    case 2:
      objc_msgSend(v4, "contentAsFTSpeechTranslationFinalRecognitionResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTOspreySpeechTranslationSession _handleFinalRecognitionResponse:](self, "_handleFinalRecognitionResponse:", v6);
      goto LABEL_12;
    case 3:
      objc_msgSend(v4, "contentAsFTAudioLimitExceeded");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTOspreySpeechTranslationSession _handleAudioLimitExceededResponse:](self, "_handleAudioLimitExceededResponse:", v6);
      goto LABEL_12;
    case 4:
      objc_msgSend(v4, "contentAsFTSpeechTranslationMtResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTOspreySpeechTranslationSession _handleTranslationResponse:](self, "_handleTranslationResponse:", v6);
      goto LABEL_12;
    case 5:
      objc_msgSend(v4, "contentAsFTSpeechTranslationTextToSpeechResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTOspreySpeechTranslationSession _handleTTSResponse:](self, "_handleTTSResponse:", v6);
      goto LABEL_12;
    case 6:
      objc_msgSend(v4, "contentAsFTFinalBlazarResponse");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTOspreySpeechTranslationSession _handleFinalBlazarResponse:](self, "_handleFinalBlazarResponse:", v6);
      goto LABEL_12;
    case 12:
      objc_msgSend(v4, "contentAsFTSpeechTranslationServerEndpointFeatures");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTOspreySpeechTranslationSession _handleServerEndpointFeatures:](self, "_handleServerEndpointFeatures:", v6);
LABEL_12:

      break;
    default:
      break;
  }

}

- (double)initialOnlineTimeout
{
  return self->_initialOnlineTimeout;
}

- (void)setInitialOnlineTimeout:(double)a3
{
  self->_initialOnlineTimeout = a3;
}

- (double)onlineTimeout
{
  return self->_onlineTimeout;
}

- (void)setOnlineTimeout:(double)a3
{
  self->_onlineTimeout = a3;
}

- (double)endpointTimeout
{
  return self->_endpointTimeout;
}

- (void)setEndpointTimeout:(double)a3
{
  self->_endpointTimeout = a3;
}

- (_LTTextToSpeechCache)ttsCache
{
  return self->_ttsCache;
}

- (void)setTtsCache:(id)a3
{
  objc_storeStrong((id *)&self->_ttsCache, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (_LTSpeechTranslationDelegate)delegate
{
  return (_LTSpeechTranslationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_ttsCache, 0);
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_serverTimer, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_speechCompressor, 0);
  objc_storeStrong((id *)&self->_confirmedTranslations, 0);
  objc_storeStrong((id *)&self->_mtResults, 0);
  objc_storeStrong((id *)&self->_cachedUserTypedText, 0);
  objc_storeStrong((id *)&self->_finalASRResults, 0);
  objc_storeStrong((id *)&self->_lidResult, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_streamContext, 0);
}

- (void)initWithService:context:text:delegate:selfLoggingManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Initializing LTOspreySpeechTranslationSession with no text to translate. This may not be what you want.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)updateServerTimeout:(uint64_t)a3 .cold.1(NSObject *a1, double a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_5(&dword_2491B9000, a1, a4, "Setting server timeout for %.2fs", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_2();
}

- (void)sendAudioData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "sendAudioData: Already endpointed, do not need to send additional audio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)sendAudioData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "sendAudioData: Already sent end audio, not sending audio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)sendAudioData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "sendAudioData: Final ASR response received, not sending audio", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)setLanguagesRecognized:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Ignoring non-final LID result", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)translationDidFinishWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_2491B9000, v1, OS_LOG_TYPE_FAULT, "Speech session %p finished with error, but there's no delegate to inform; error: %@",
    v2,
    0x16u);
  OUTLINED_FUNCTION_1_2();
}

- (void)_handleAudioLimitExceededResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Audio limit exceeded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handleFinalRecognitionResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v0, v1, "Recognition: %{sensitive}@", v2);
  OUTLINED_FUNCTION_1_2();
}

- (void)_handleFinalRecognitionResponse:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_11_0();
  objc_msgSend(a2, "return_str");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  _os_log_debug_impl(&dword_2491B9000, v2, OS_LOG_TYPE_DEBUG, "Final recognition status: %d: %@", v5, 0x12u);

  OUTLINED_FUNCTION_1_3();
}

- (void)_handleServerEndpointFeatures:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_2491B9000, v0, v1, "Insufficient information in server endpointer features response", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handleTranslationResponse:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = OUTLINED_FUNCTION_8(a1);
  objc_msgSend(a2, "locale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_ltLocaleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v3, v6, "Received translation response: %{public}@", v7);

  OUTLINED_FUNCTION_1_3();
}

- (void)_handleTTSResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to process TTS audio data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handleFinalBlazarResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Send out no translation results caused by empty recognition", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_handleFinalBlazarResponse:(void *)a1 .cold.2(void *a1, void *a2)
{
  NSObject *v2;
  void *v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_8(a1);
  OUTLINED_FUNCTION_11_0();
  objc_msgSend(a2, "return_str");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0();
  _os_log_error_impl(&dword_2491B9000, v2, OS_LOG_TYPE_ERROR, "Remote service error %d: %@", v5, 0x12u);

  OUTLINED_FUNCTION_1_3();
}

- (void)streamFailVerifySpeechTranslationStreamingResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Speech translation stream error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
