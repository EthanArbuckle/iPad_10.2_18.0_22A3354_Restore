@implementation ADAMSoundAnalysisWriter

- (void)createAndLogOSTransaction
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->_transaction;
  self->_transaction = v3;

  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v5 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v5)
      return;
  }
  else
  {
    v5 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "ADAMSoundAnalysisWriter.mm";
    v9 = 1024;
    v10 = 91;
    _os_log_impl(&dword_216CFB000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created os_transaction for sound analysis", (uint8_t *)&v7, 0x12u);
  }

}

- (void)destroyAndLogOSTransaction
{
  OS_os_transaction *transaction;
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  transaction = self->_transaction;
  self->_transaction = 0;

  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v3 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v3)
      return;
  }
  else
  {
    v3 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "ADAMSoundAnalysisWriter.mm";
    v7 = 1024;
    v8 = 97;
    _os_log_impl(&dword_216CFB000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroyed os_transaction for sound analysis", (uint8_t *)&v5, 0x12u);
  }

}

- (ADAMSoundAnalysisWriter)initWithWriterName:(id)a3 sessionID:(unsigned int)a4 audioFormat:(id)a5 speechMetricsSRWriter:(id)a6 soundDetectionSRWriter:(id)a7 speechEmotionSRWriter:(id)a8 completionHandler:(id)a9
{
  uint64_t v13;
  id v15;
  id v16;
  ADAMSoundAnalysisWriter *v17;
  id *p_isa;
  ADAMSoundAnalysisWriter *v19;
  uint64_t v20;
  NSString *sessionID;
  unsigned __int8 v22;
  NSObject *v23;
  uint64_t v24;
  id completeHandler;
  SNMeasureLKFSRequest *audioLevelRequest;
  void *v27;
  int v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *queue;
  char v31;
  void *v32;
  int v33;
  dispatch_queue_t v34;
  id v35;
  id v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  ADAMSoundAnalysisWriter *v42;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  _BYTE v55[30];
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v13 = *(_QWORD *)&a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v45 = a5;
  v46 = a6;
  v47 = a7;
  v48 = a8;
  v16 = a9;
  v49.receiver = self;
  v49.super_class = (Class)ADAMSoundAnalysisWriter;
  v17 = -[ADAMSoundAnalysisWriter init](&v49, sel_init);
  p_isa = (id *)&v17->super.isa;
  v19 = v17;
  if (!v17)
  {
LABEL_12:
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v35 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v35)
      {
LABEL_21:
        v42 = v19;
        goto LABEL_22;
      }
    }
    else
    {
      v35 = (id)MEMORY[0x24BDACB70];
      v36 = MEMORY[0x24BDACB70];
    }
    v37 = v35;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ADAMSoundAnalysisWriter _isMonitoringEmotion](v19, "_isMonitoringEmotion"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ADAMSoundAnalysisWriter _isMonitoringSoundDetection](v19, "_isMonitoringSoundDetection"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](v19, "_isMonitoringSpeechMetrics"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[NSMutableArray count](v19->_requests, "count");
      *(_DWORD *)buf = 136316674;
      v51 = "ADAMSoundAnalysisWriter.mm";
      v52 = 1024;
      v53 = 169;
      v54 = 2112;
      *(_QWORD *)v55 = v19;
      *(_WORD *)&v55[8] = 2112;
      *(_QWORD *)&v55[10] = v38;
      *(_WORD *)&v55[18] = 2112;
      *(_QWORD *)&v55[20] = v39;
      *(_WORD *)&v55[28] = 2112;
      v56 = v40;
      v57 = 2048;
      v58 = v41;
      _os_log_impl(&dword_216CFB000, v37, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created ADAM SN Writer: %@ monitoring emotion? %@, monitoring detecion? %@, monitoring speech metrics? %@, num requests: %lu", buf, 0x44u);

    }
    goto LABEL_21;
  }
  objc_storeStrong((id *)&v17->_format, a5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v13);
  v20 = objc_claimAutoreleasedReturnValue();
  sessionID = v19->_sessionID;
  v19->_sessionID = (NSString *)v20;

  {
    ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
  }
  v23 = ADAM::get_log(void)::adam_os_log;
  if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v51 = "ADAMSoundAnalysisWriter.mm";
    v52 = 1024;
    v53 = 112;
    v54 = 1040;
    *(_DWORD *)v55 = 23;
    *(_WORD *)&v55[4] = 2080;
    *(_QWORD *)&v55[6] = "ADAMSoundAnalysisWriter]";
    *(_WORD *)&v55[14] = 2048;
    *(_QWORD *)&v55[16] = v19;
    *(_WORD *)&v55[24] = 1024;
    *(_DWORD *)&v55[26] = v13;
    _os_log_impl(&dword_216CFB000, v23, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] Created with session ID: %d", buf, 0x32u);
  }
  v24 = MEMORY[0x219A011D4](v16);
  completeHandler = v19->_completeHandler;
  v19->_completeHandler = (id)v24;

  v19->_processing = 0;
  v19->_soundAnalyzerInitialized = 0;
  *(_QWORD *)&v19->_statusLock._os_unfair_lock_opaque = 0;
  v19->_isLastBatch = 0;
  objc_storeWeak(p_isa + 10, 0);
  audioLevelRequest = v19->_audioLevelRequest;
  v19->_audioLevelRequest = 0;

  v19->_siriAudioBufferCount = 0;
  v19->_detectionResultCounterPerMinute = 0;
  v19->_emotionResultCounterPerMinute = 0;
  v19->_detectionFirstAbsoluteTimestampPerMinute = 0.0;
  v19->_emotionFirstAbsoluteTimestampPerMinute = 0.0;
  v19->_audioLevelTimestamp = 0;
  objc_storeStrong(p_isa + 17, a6);
  v19->_laughterTimeTracker = 0;
  v19->_shoutingTimeTracker = 0;
  v19->_speechTimeTracker = 0;
  if (-[ADAMSoundAnalysisWriter isMonitoring](v19, "isMonitoring"))
    -[ADAMSoundAnalysisWriter createAndLogOSTransaction](v19, "createAndLogOSTransaction");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SiriUplink");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v15, "hasPrefix:", v27);

  if (v28)
  {
    v19->_streamType = 0;
    objc_storeStrong(p_isa + 15, a8);
    objc_storeStrong(p_isa + 16, a7);
    v29 = dispatch_queue_create("SiriUplink", 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v29;
    v31 = 1;
LABEL_11:

    v19->_inSiriUseCase = v31;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TelephonyUplink");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v15, "hasPrefix:", v32);

  if (v33)
  {
    v19->_streamType = 1;
    objc_storeStrong(p_isa + 15, a8);
    objc_storeStrong(p_isa + 16, a7);
    v34 = dispatch_queue_create("TelephonyUplink", 0);
    v31 = 0;
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v34;
    goto LABEL_11;
  }
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v42 = (ADAMSoundAnalysisWriter *)*(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v42)
      goto LABEL_22;
  }
  else
  {
    v42 = (ADAMSoundAnalysisWriter *)MEMORY[0x24BDACB70];
    v44 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(&v42->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v51 = "ADAMSoundAnalysisWriter.mm";
    v52 = 1024;
    v53 = 162;
    v54 = 2112;
    *(_QWORD *)v55 = v15;
    _os_log_impl(&dword_216CFB000, &v42->super, OS_LOG_TYPE_ERROR, "%25s:%-5d unknown audio buffer stream type: %@", buf, 0x1Cu);
  }

  v42 = 0;
LABEL_22:

  return v42;
}

- (void)_initializeSoundAnalyzer
{
  os_unfair_lock_s *p_initLock;
  SNAudioStreamAnalyzer *v4;
  SNAudioStreamAnalyzer *SNAnalyzer;
  NSObject *v6;
  id v7;
  SNAudioStreamAnalyzer *v8;
  NSMutableArray *v9;
  NSMutableArray *requests;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  SNMeasureLKFSRequest *v19;
  SNMeasureLKFSRequest *audioLevelRequest;
  SNAudioStreamAnalyzer *v21;
  SNMeasureLKFSRequest *v22;
  id v23;
  unsigned __int8 v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  id v30;
  _QWORD v31[5];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BYTE v37[14];
  __int16 v38;
  ADAMSoundAnalysisWriter *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  p_initLock = &self->_initLock;
  os_unfair_lock_lock(&self->_initLock);
  if (!self->_soundAnalyzerInitialized)
  {
    v4 = (SNAudioStreamAnalyzer *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9AE0]), "initWithFormat:", self->_format);
    SNAnalyzer = self->_SNAnalyzer;
    self->_SNAnalyzer = v4;

    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v6 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v6)
        goto LABEL_11;
    }
    else
    {
      v6 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_SNAnalyzer;
      *(_DWORD *)buf = 136315650;
      v33 = "ADAMSoundAnalysisWriter.mm";
      v34 = 1024;
      v35 = 182;
      v36 = 2112;
      *(_QWORD *)v37 = v8;
      _os_log_impl(&dword_216CFB000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created SN AudioStreamAnalyzer %@", buf, 0x1Cu);
    }

LABEL_11:
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    requests = self->_requests;
    self->_requests = v9;

    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setComputeUnits:", 0);
    v12 = objc_alloc(MEMORY[0x24BDE9B10]);
    v13 = (void *)objc_msgSend(v12, "initWithDetectorIdentifier:error:", *MEMORY[0x24BDE9B78], 0);
    objc_msgSend(v13, "setModelConfiguration:", v11);
    -[NSMutableArray addObject:](self->_requests, "addObject:", v13);
    v14 = objc_alloc(MEMORY[0x24BDE9B10]);
    v15 = (void *)objc_msgSend(v14, "initWithDetectorIdentifier:error:", *MEMORY[0x24BDE9B80], 0);
    objc_msgSend(v15, "setModelConfiguration:", v11);
    -[NSMutableArray addObject:](self->_requests, "addObject:", v15);
    v16 = objc_alloc(MEMORY[0x24BDE9B10]);
    v17 = (void *)objc_msgSend(v16, "initWithDetectorIdentifier:error:", *MEMORY[0x24BDE9B88], 0);
    objc_msgSend(v17, "setModelConfiguration:", v11);
    -[NSMutableArray addObject:](self->_requests, "addObject:", v17);
    v18 = self->_requests;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __51__ADAMSoundAnalysisWriter__initializeSoundAnalyzer__block_invoke;
    v31[3] = &unk_24D615BB0;
    v31[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](v18, "enumerateObjectsUsingBlock:", v31);
    v19 = (SNMeasureLKFSRequest *)objc_alloc_init(MEMORY[0x24BDE9B58]);
    audioLevelRequest = self->_audioLevelRequest;
    self->_audioLevelRequest = v19;

    -[NSMutableArray addObject:](self->_requests, "addObject:", self->_audioLevelRequest);
    v21 = self->_SNAnalyzer;
    v22 = self->_audioLevelRequest;
    v30 = 0;
    -[SNAudioStreamAnalyzer addRequest:withObserver:error:](v21, "addRequest:withObserver:error:", v22, self, &v30);
    v23 = v30;
    if (v23)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v25 = ADAM::get_log(void)::adam_os_log;
      if (!os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      *(_DWORD *)buf = 136316162;
      v33 = "ADAMSoundAnalysisWriter.mm";
      v34 = 1024;
      v35 = 232;
      v36 = 1040;
      *(_DWORD *)v37 = 23;
      *(_WORD *)&v37[4] = 2080;
      *(_QWORD *)&v37[6] = "ADAMSoundAnalysisWriter]";
      v38 = 2048;
      v39 = self;
      v26 = "[%s:%-5d %.*s:%p] failed to add SNMeasureAudioLevelRequest";
      v27 = v25;
      v28 = OS_LOG_TYPE_ERROR;
    }
    else
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v29 = ADAM::get_log(void)::adam_os_log;
      if (!os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEBUG))
        goto LABEL_19;
      *(_DWORD *)buf = 136316162;
      v33 = "ADAMSoundAnalysisWriter.mm";
      v34 = 1024;
      v35 = 236;
      v36 = 1040;
      *(_DWORD *)v37 = 23;
      *(_WORD *)&v37[4] = 2080;
      *(_QWORD *)&v37[6] = "ADAMSoundAnalysisWriter]";
      v38 = 2048;
      v39 = self;
      v26 = "[%s:%-5d %.*s:%p] added SNMeasureAudioLevelRequest";
      v27 = v29;
      v28 = OS_LOG_TYPE_DEBUG;
    }
    _os_log_impl(&dword_216CFB000, v27, v28, v26, buf, 0x2Cu);
LABEL_19:

    self->_frameCnt = 0;
    self->_speechEmotionTimestamp = 0;
    self->_soundAnalyzerInitialized = 1;

  }
  os_unfair_lock_unlock(p_initLock);
}

- (BOOL)_isMonitoringSpeechMetrics
{
  _BOOL4 v3;

  ADAM::Parameters::instance((ADAM::Parameters *)self);
  if ((ADAM::Parameters::GetParamValue<BOOL>(5u) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_speechMetricsSRWriter, "isValidSRSensorWriterPresent");
    if (v3)
    {
      v3 = -[ADAMSRSensorWriter isMonitoring](self->_speechMetricsSRWriter, "isMonitoring");
      if (v3)
        LOBYTE(v3) = -[ADAMSRSensorWriter isBundleIdentifierEligible](self->_speechMetricsSRWriter, "isBundleIdentifierEligible");
    }
  }
  return v3;
}

- (BOOL)_isMonitoringEmotion
{
  _BOOL4 v3;

  ADAM::Parameters::instance((ADAM::Parameters *)self);
  if ((ADAM::Parameters::GetParamValue<BOOL>(5u) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_speechEmotionSRWriter, "isValidSRSensorWriterPresent");
    if (v3)
    {
      v3 = -[ADAMSRSensorWriter isMonitoring](self->_speechEmotionSRWriter, "isMonitoring");
      if (v3)
        LOBYTE(v3) = -[ADAMSRSensorWriter isBundleIdentifierEligible](self->_speechEmotionSRWriter, "isBundleIdentifierEligible");
    }
  }
  return v3;
}

- (BOOL)_isMonitoringSoundDetection
{
  _BOOL4 v3;

  ADAM::Parameters::instance((ADAM::Parameters *)self);
  if ((ADAM::Parameters::GetParamValue<BOOL>(5u) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_soundDetectionSRWriter, "isValidSRSensorWriterPresent");
    if (v3)
    {
      v3 = -[ADAMSRSensorWriter isMonitoring](self->_soundDetectionSRWriter, "isMonitoring");
      if (v3)
        LOBYTE(v3) = -[ADAMSRSensorWriter isBundleIdentifierEligible](self->_soundDetectionSRWriter, "isBundleIdentifierEligible");
    }
  }
  return v3;
}

- (BOOL)isMonitoring
{
  return -[ADAMSoundAnalysisWriter _isMonitoringEmotion](self, "_isMonitoringEmotion")
      || -[ADAMSoundAnalysisWriter _isMonitoringSoundDetection](self, "_isMonitoringSoundDetection")
      || -[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](self, "_isMonitoringSpeechMetrics");
}

- (BOOL)isComplete
{
  ADAMSoundAnalysisWriter *v2;
  os_unfair_lock_s *p_statusLock;

  v2 = self;
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  LOBYTE(v2) = !v2->_processing;
  os_unfair_lock_unlock(p_statusLock);
  return (char)v2;
}

- (void)reinitializeSpeechEmotionRequest
{
  SNEstimateSpeechEmotionRequest **p_speechEmotionRequest;
  id WeakRetained;
  SNAudioStreamAnalyzer *SNAnalyzer;
  id v6;
  NSMutableArray *requests;
  id v8;
  id v9;
  id v10;
  SNAudioStreamAnalyzer *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  p_speechEmotionRequest = &self->_speechEmotionRequest;
  WeakRetained = objc_loadWeakRetained((id *)&self->_speechEmotionRequest);

  if (WeakRetained)
  {
    SNAnalyzer = self->_SNAnalyzer;
    v6 = objc_loadWeakRetained((id *)p_speechEmotionRequest);
    -[SNAudioStreamAnalyzer removeRequest:](SNAnalyzer, "removeRequest:", v6);

    requests = self->_requests;
    v8 = objc_loadWeakRetained((id *)p_speechEmotionRequest);
    -[NSMutableArray removeObject:](requests, "removeObject:", v8);

    objc_storeWeak((id *)p_speechEmotionRequest, 0);
  }
  v9 = objc_alloc_init(MEMORY[0x24BDE9B38]);
  -[NSMutableArray addObject:](self->_requests, "addObject:", v9);
  v10 = objc_storeWeak((id *)p_speechEmotionRequest, v9);
  v11 = self->_SNAnalyzer;
  v12 = v10;
  v21 = 0;
  -[SNAudioStreamAnalyzer addRequest:withObserver:error:](v11, "addRequest:withObserver:error:", v9, self, &v21);
  v13 = v21;

  if (v13)
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v14 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v14)
        goto LABEL_21;
    }
    else
    {
      v14 = (id)MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    v17 = v14;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_loadWeakRetained((id *)p_speechEmotionRequest);
      *(_DWORD *)buf = 136315650;
      v23 = "ADAMSoundAnalysisWriter.mm";
      v24 = 1024;
      v25 = 309;
      v26 = 2112;
      v27 = v18;
      _os_log_impl(&dword_216CFB000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to add SN request: %@", buf, 0x1Cu);

    }
  }
  else
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15)
        goto LABEL_21;
    }
    else
    {
      v15 = (id)MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_loadWeakRetained((id *)p_speechEmotionRequest);
      *(_DWORD *)buf = 136315650;
      v23 = "ADAMSoundAnalysisWriter.mm";
      v24 = 1024;
      v25 = 313;
      v26 = 2112;
      v27 = v20;
      _os_log_impl(&dword_216CFB000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d added SN request: %@", buf, 0x1Cu);

    }
  }

LABEL_21:
}

- (int)write:(id)a3 withMetadata:(const Metadata *)a4
{
  id v6;
  BOOL v7;
  UInt64 mHostTime;
  NSObject *queue;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v14;
  UInt64 v15;
  const Metadata *v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (-[ADAMSoundAnalysisWriter _isMonitoringEmotion](self, "_isMonitoringEmotion")
    || -[ADAMSoundAnalysisWriter _isMonitoringSoundDetection](self, "_isMonitoringSoundDetection")
    || -[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](self, "_isMonitoringSpeechMetrics"))
  {
    if (!self->_transaction)
      -[ADAMSoundAnalysisWriter createAndLogOSTransaction](self, "createAndLogOSTransaction");
    -[ADAMSoundAnalysisWriter _initializeSoundAnalyzer](self, "_initializeSoundAnalyzer");
    if (ADAM::isXCTest(void)::once != -1)
      dispatch_once(&ADAM::isXCTest(void)::once, &__block_literal_global_45);
    if (!ADAM::isXCTest(void)::isXCTest)
    {
      v7 = a4->var2 != 0;
      mHostTime = a4->var0.mHostTime;
      queue = self->_queue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__ADAMSoundAnalysisWriter_write_withMetadata___block_invoke;
      block[3] = &unk_24D615BD8;
      block[4] = self;
      v15 = mHostTime;
      v14 = v6;
      v16 = a4;
      v17 = v7;
      dispatch_async(queue, block);

    }
  }
  else
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v10 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v10)
        goto LABEL_19;
    }
    else
    {
      v10 = MEMORY[0x24BDACB70];
      v11 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "ADAMSoundAnalysisWriter.mm";
      v20 = 1024;
      v21 = 385;
      _os_log_impl(&dword_216CFB000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d emotion and detection not being monitored...", buf, 0x12u);
    }

  }
LABEL_19:

  return 0;
}

- (void)_setProcessing:(BOOL)a3
{
  os_unfair_lock_s *p_statusLock;

  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  self->_processing = a3;
  os_unfair_lock_unlock(p_statusLock);
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  id v5;
  id v6;
  unint64_t speechEmotionTimestamp;
  uint64_t v8;
  ADAMSRSensorWriter *speechEmotionSRWriter;
  id v10;
  id v11;
  id v12;
  ADAMSoundAnalysisWriter *v13;
  id v14;
  void *v15;
  char v16;
  uint64_t v17;
  id v18;
  unint64_t audioLevelTimestamp;
  id v20;
  unsigned __int8 v21;
  NSObject *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  uint64_t v27;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *left;
  uint64_t **p_pair1;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *v30;
  uint64_t v31;
  BOOL v32;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> **v33;
  uint64_t v34;
  uint64_t **v35;
  uint64_t *v36;
  double v37;
  double v38;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *v39;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *v40;
  uint64_t v41;
  uint64_t *v42;
  void *v43;
  ADAM *v44;
  double v45;
  uint64_t v46;
  CMTimeRange *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  SRAbsoluteTime v51;
  id v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  id v64;
  NSString *sessionID;
  SRAbsoluteTime v66;
  void *v67;
  double v68;
  double v69;
  ADAMSRSensorWriter *speechMetricsSRWriter;
  id v71;
  id v72;
  unsigned __int8 v73;
  NSObject *v74;
  SRAbsoluteTime v75;
  id v76;
  SRAbsoluteTime v77;
  ADAM *v78;
  double v79;
  uint64_t v80;
  CMTimeRange *v81;
  float v82;
  void *v83;
  id v84;
  uint64_t v85;
  NSString *v86;
  SRAbsoluteTime v87;
  void *v88;
  ADAMSRSensorWriter *v89;
  id v90;
  unsigned __int8 v91;
  NSObject *v92;
  SRAbsoluteTime v93;
  const char *v94;
  NSObject *v95;
  os_log_type_t v96;
  uint32_t v97;
  unsigned __int8 v98;
  NSObject *v99;
  SRAbsoluteTime v100;
  double v101;
  double v102;
  ADAM *v103;
  double v104;
  uint64_t v105;
  CMTimeRange *v106;
  uint64_t v107;
  unsigned int v108;
  id v109;
  _OWORD v110[4];
  __int128 v111;
  __int128 v112;
  id v113;
  _OWORD v114[3];
  id v115;
  uint64_t cont;
  _BYTE buf[64];
  __int16 v118;
  SRAbsoluteTime v119;
  __int16 v120;
  id v121;
  uint64_t v122;

  v122 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!-[ADAMSoundAnalysisWriter _isMonitoringEmotion](self, "_isMonitoringEmotion")
      && !-[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](self, "_isMonitoringSpeechMetrics"))
    {
      goto LABEL_85;
    }
    v6 = v5;
    speechEmotionTimestamp = self->_speechEmotionTimestamp;
    *(_QWORD *)buf = 0;
    cont = 0;
    mach_get_times();
    v8 = speechEmotionTimestamp;
    if (!self->_emotionFirstContinuousTimeStampPerMinute.__engaged_)
    {
      self->_emotionFirstAbsoluteTimestampPerMinute = SRAbsoluteTimeFromContinuousTime(*(_QWORD *)buf
                                                                                     + speechEmotionTimestamp - cont);
      self->_emotionFirstContinuousTimeStampPerMinute.var0.__val_ = speechEmotionTimestamp;
      self->_emotionFirstContinuousTimeStampPerMinute.__engaged_ = 1;
    }
    if (!-[ADAMSoundAnalysisWriter _isMonitoringEmotion](self, "_isMonitoringEmotion"))
    {
      v10 = 0;
      goto LABEL_62;
    }
    speechEmotionSRWriter = self->_speechEmotionSRWriter;
    v115 = 0;
    -[ADAMSRSensorWriter provideSample:continuousTimestamp:error:](speechEmotionSRWriter, "provideSample:continuousTimestamp:error:", v6, speechEmotionTimestamp, &v115);
    v10 = v115;
    if (!v10)
      goto LABEL_62;
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v11 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v11)
        goto LABEL_62;
    }
    else
    {
      v11 = (id)MEMORY[0x24BDACB70];
      v49 = MEMORY[0x24BDACB70];
    }
    v50 = v11;
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = SRAbsoluteTimeFromContinuousTime(v8);
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "ADAMSoundAnalysisWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 426;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v6;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v8;
      *(_WORD *)&buf[38] = 2048;
      *(SRAbsoluteTime *)&buf[40] = v51;
      *(_WORD *)&buf[48] = 2112;
      *(_QWORD *)&buf[50] = v10;
      _os_log_impl(&dword_216CFB000, v50, OS_LOG_TYPE_DEFAULT, "%25s:%-5d failed to write SNSpeechEmotionResult result to SensorKit: %@, continuous timestamp: continuous %llu, absolute %f, err: %@", buf, 0x3Au);
    }

LABEL_62:
    v52 = objc_alloc(MEMORY[0x24BDE9708]);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("1"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v6, "timeRange");
    else
      memset(v114, 0, sizeof(v114));
    objc_msgSend(v6, "confidence");
    v55 = v54;
    objc_msgSend(v6, "mood");
    v57 = v56;
    objc_msgSend(v6, "valence");
    v59 = v58;
    objc_msgSend(v6, "arousal");
    v61 = v60;
    objc_msgSend(v6, "dominance");
    v63 = (void *)objc_msgSend(v52, "initWithVersion:timeRange:confidence:mood:valence:activation:dominance:", v53, v114, v55, v57, v59, v61, v62);

    v64 = objc_alloc(MEMORY[0x24BDE9710]);
    sessionID = self->_sessionID;
    v66 = SRAbsoluteTimeFromContinuousTime(v8);
    v67 = (void *)objc_msgSend(v64, "initWithSessionIdentifier:sessionFlags:timestamp:audioLevel:speechRecognition:soundClassification:speechExpression:", sessionID, 0, 0, 0, 0, v63, SRAbsoluteTimeToCFAbsoluteTime(v66));
    if (!-[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](self, "_isMonitoringSpeechMetrics"))
      goto LABEL_81;

    speechMetricsSRWriter = self->_speechMetricsSRWriter;
    v113 = 0;
    -[ADAMSRSensorWriter provideSample:error:](speechMetricsSRWriter, "provideSample:error:", v67, &v113);
    v71 = v113;
    if (v71)
    {
      v10 = v71;
      if (ADAM::ADAMLogScope(void)::once != -1)
        dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
      if (ADAM::ADAMLogScope(void)::scope)
      {
        v72 = *(id *)ADAM::ADAMLogScope(void)::scope;
        if (!v72)
          goto LABEL_81;
      }
      else
      {
        v72 = (id)MEMORY[0x24BDACB70];
        v76 = MEMORY[0x24BDACB70];
      }
      v74 = v72;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        v77 = SRAbsoluteTimeFromContinuousTime(v8);
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "ADAMSoundAnalysisWriter.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 443;
        *(_WORD *)&buf[18] = 2112;
        *(_QWORD *)&buf[20] = v67;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v8;
        *(_WORD *)&buf[38] = 2048;
        *(SRAbsoluteTime *)&buf[40] = v77;
        *(_WORD *)&buf[48] = 2112;
        *(_QWORD *)&buf[50] = v10;
        _os_log_impl(&dword_216CFB000, v74, OS_LOG_TYPE_DEFAULT, "%25s:%-5d failed to write SRSpeechMetrics result to SensorKit: %@, continuous timestamp: continuous %llu, absolute %f, err: %@", buf, 0x3Au);
      }

    }
    else
    {
      ++self->_emotionResultCounterPerMinute;
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v74 = (id)ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
      {
        v75 = SRAbsoluteTimeFromContinuousTime(v8);
        *(_DWORD *)buf = 136316930;
        *(_QWORD *)&buf[4] = "ADAMSoundAnalysisWriter.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 449;
        *(_WORD *)&buf[18] = 1040;
        *(_DWORD *)&buf[20] = 23;
        *(_WORD *)&buf[24] = 2080;
        *(_QWORD *)&buf[26] = "ADAMSoundAnalysisWriter]";
        *(_WORD *)&buf[34] = 2048;
        *(_QWORD *)&buf[36] = self;
        *(_WORD *)&buf[44] = 2112;
        *(_QWORD *)&buf[46] = v67;
        *(_WORD *)&buf[54] = 2048;
        *(_QWORD *)&buf[56] = v8;
        v118 = 2048;
        v119 = v75;
        _os_log_impl(&dword_216CFB000, v74, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] Write SpeechExpression result: %@, timestamp: continuous %llu, absolute %f", buf, 0x4Au);
      }
      v10 = 0;
    }

LABEL_81:
    v78 = (ADAM *)self->_speechEmotionTimestamp;
    if (v6)
    {
      objc_msgSend(v6, "timeRange");
      v80 = *((_QWORD *)&v111 + 1);
      v81 = (CMTimeRange *)v112;
    }
    else
    {
      v81 = 0;
      v80 = 0;
      v79 = 0.0;
      v111 = 0u;
      v112 = 0u;
      v110[3] = 0u;
    }
    self->_speechEmotionTimestamp = ADAM::absoluteTimeFromCMTimeRange(v78, v80, v81, v79, v68, v69);

    goto LABEL_85;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v22 = ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "ADAMSoundAnalysisWriter.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 538;
        *(_WORD *)&buf[18] = 1040;
        *(_DWORD *)&buf[20] = 23;
        *(_WORD *)&buf[24] = 2080;
        *(_QWORD *)&buf[26] = "ADAMSoundAnalysisWriter]";
        *(_WORD *)&buf[34] = 2048;
        *(_QWORD *)&buf[36] = self;
        *(_WORD *)&buf[44] = 2112;
        *(_QWORD *)&buf[46] = v5;
        _os_log_impl(&dword_216CFB000, v22, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] Unknown SN result: %@", buf, 0x36u);
      }
      goto LABEL_85;
    }
    if (!-[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](self, "_isMonitoringSpeechMetrics"))
      goto LABEL_85;
    v18 = v5;
    audioLevelTimestamp = self->_audioLevelTimestamp;
    *(_QWORD *)buf = 0;
    cont = 0;
    mach_get_times();
    v20 = objc_alloc(MEMORY[0x24BDE96F8]);
    if (v18)
      objc_msgSend(v18, "timeRange");
    else
      memset(v110, 0, 48);
    objc_msgSend(v18, "decibelLevel");
    v83 = (void *)objc_msgSend(v20, "initWithTimeRange:loudness:", v110, v82);
    v84 = objc_alloc(MEMORY[0x24BDE9710]);
    v85 = audioLevelTimestamp;
    v86 = self->_sessionID;
    v87 = SRAbsoluteTimeFromContinuousTime(v85);
    v88 = (void *)objc_msgSend(v84, "initWithSessionIdentifier:sessionFlags:timestamp:audioLevel:speechRecognition:soundClassification:speechExpression:", v86, 0, v83, 0, 0, 0, SRAbsoluteTimeToCFAbsoluteTime(v87));
    v89 = self->_speechMetricsSRWriter;
    v109 = 0;
    -[ADAMSRSensorWriter provideSample:error:](v89, "provideSample:error:", v88, &v109);
    v90 = v109;
    if (v90)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v92 = (id)ADAM::get_log(void)::adam_os_log;
      if (!os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        goto LABEL_99;
      v93 = SRAbsoluteTimeFromContinuousTime(v85);
      *(_DWORD *)buf = 136317186;
      *(_QWORD *)&buf[4] = "ADAMSoundAnalysisWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 524;
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 23;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = "ADAMSoundAnalysisWriter]";
      *(_WORD *)&buf[34] = 2048;
      *(_QWORD *)&buf[36] = self;
      *(_WORD *)&buf[44] = 2112;
      *(_QWORD *)&buf[46] = v88;
      *(_WORD *)&buf[54] = 2048;
      *(_QWORD *)&buf[56] = v85;
      v118 = 2048;
      v119 = v93;
      v120 = 2112;
      v121 = v90;
      v94 = "[%s:%-5d %.*s:%p] failed to write SNLKFSResult result to SensorKit: %@, continuous timestamp: continuous %ll"
            "u, absolute %f, err: %@";
      v95 = v92;
      v96 = OS_LOG_TYPE_ERROR;
      v97 = 84;
    }
    else
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v92 = (id)ADAM::get_log(void)::adam_os_log;
      if (!os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        goto LABEL_99;
      v100 = SRAbsoluteTimeFromContinuousTime(v85);
      *(_DWORD *)buf = 136316930;
      *(_QWORD *)&buf[4] = "ADAMSoundAnalysisWriter.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 529;
      *(_WORD *)&buf[18] = 1040;
      *(_DWORD *)&buf[20] = 23;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = "ADAMSoundAnalysisWriter]";
      *(_WORD *)&buf[34] = 2048;
      *(_QWORD *)&buf[36] = self;
      *(_WORD *)&buf[44] = 2112;
      *(_QWORD *)&buf[46] = v88;
      *(_WORD *)&buf[54] = 2048;
      *(_QWORD *)&buf[56] = v85;
      v118 = 2048;
      v119 = v100;
      v94 = "[%s:%-5d %.*s:%p] Write SNLKFSResult result: %@, timestamp: continuous %llu, absolute %f";
      v95 = v92;
      v96 = OS_LOG_TYPE_DEBUG;
      v97 = 74;
    }
    _os_log_impl(&dword_216CFB000, v95, v96, v94, buf, v97);
LABEL_99:

    v103 = (ADAM *)self->_audioLevelTimestamp;
    if (v18)
    {
      objc_msgSend(v18, "timeRange");
      v105 = v107;
      v106 = (CMTimeRange *)v108;
    }
    else
    {
      v106 = 0;
      v105 = 0;
      v104 = 0.0;
    }
    self->_audioLevelTimestamp = ADAM::absoluteTimeFromCMTimeRange(v103, v105, v106, v104, v101, v102);

    goto LABEL_85;
  }
  if (!-[ADAMSoundAnalysisWriter _isMonitoringSoundDetection](self, "_isMonitoringSoundDetection")
    && !-[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](self, "_isMonitoringSpeechMetrics"))
  {
    goto LABEL_85;
  }
  v12 = v5;
  v13 = self;
  v14 = v12;
  objc_msgSend(v14, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDE9B90]);

  if ((v16 & 1) != 0)
  {
    v17 = 208;
  }
  else
  {
    objc_msgSend(v14, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BDE9B98]);

    if ((v24 & 1) != 0)
    {
      v17 = 216;
    }
    else
    {
      objc_msgSend(v14, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BDE9BA8]);

      if (!v26)
      {
        {
          ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
        }
        v99 = ADAM::get_log(void)::adam_os_log;
        if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = "ADAMSoundAnalysisWriter.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 501;
          *(_WORD *)&buf[18] = 1040;
          *(_DWORD *)&buf[20] = 23;
          *(_WORD *)&buf[24] = 2080;
          *(_QWORD *)&buf[26] = "ADAMSoundAnalysisWriter]";
          *(_WORD *)&buf[34] = 2048;
          *(_QWORD *)&buf[36] = v13;
          *(_WORD *)&buf[44] = 2112;
          *(_QWORD *)&buf[46] = v14;
          _os_log_impl(&dword_216CFB000, v99, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] Unknown SNDetection result: %@", buf, 0x36u);
        }

        goto LABEL_85;
      }
      v17 = 224;
    }
  }
  v27 = *(uint64_t *)((char *)&v13->super.isa + v17);
  *(_QWORD *)buf = 0;
  mach_get_times();
  cont = v27;
  p_pair1 = (uint64_t **)&v13->_detectionCachedTimestamps.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v13->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_41;
  v30 = &v13->_detectionCachedTimestamps.__tree_.__pair1_;
  do
  {
    v31 = (uint64_t)left[4].__value_.__left_;
    v32 = v31 >= v27;
    if (v31 >= v27)
      v33 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> **)left;
    else
      v33 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> **)&left[1];
    if (v32)
      v30 = left;
    left = *v33;
  }
  while (*v33);
  if (v30 == (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)p_pair1
    || (void *)v27 < v30[4].__value_.__left_)
  {
LABEL_41:
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 3);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&v13->_detectionCachedResultMap, v27, (uint64_t **)&cont);
    v36 = v35[5];
    v35[5] = (uint64_t *)v34;

  }
  objc_msgSend(std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&v13->_detectionCachedResultMap, v27, (uint64_t **)&cont)[5], "addObject:", v14);
  v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v13->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_;
  v40 = &v13->_detectionCachedTimestamps.__tree_.__pair1_;
  if (v39)
  {
    while (1)
    {
      while (1)
      {
        v40 = v39;
        v41 = (uint64_t)v39[4].__value_.__left_;
        if (v27 >= v41)
          break;
        v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v40->__value_.__left_;
        p_pair1 = (uint64_t **)v40;
        if (!v40->__value_.__left_)
          goto LABEL_49;
      }
      if (v41 >= v27)
        break;
      v39 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v40[1].__value_.__left_;
      if (!v39)
      {
        p_pair1 = (uint64_t **)&v40[1];
        goto LABEL_49;
      }
    }
  }
  else
  {
LABEL_49:
    v42 = (uint64_t *)operator new(0x28uLL);
    v42[4] = v27;
    *v42 = 0;
    v42[1] = 0;
    v42[2] = (uint64_t)v40;
    *p_pair1 = v42;
    v43 = *(void **)v13->_detectionCachedTimestamps.__tree_.__begin_node_;
    if (v43)
    {
      v13->_detectionCachedTimestamps.__tree_.__begin_node_ = v43;
      v42 = *p_pair1;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v13->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_, v42);
    ++v13->_detectionCachedTimestamps.__tree_.__pair3_.__value_;
  }
  v44 = *(Class *)((char *)&v13->super.isa + v17);
  if (v14)
  {
    objc_msgSend(v14, "timeRange");
    v46 = *(_QWORD *)&buf[24];
    v47 = (CMTimeRange *)*(unsigned int *)&buf[32];
  }
  else
  {
    v47 = 0;
    v46 = 0;
    v45 = 0.0;
    memset(buf, 0, 48);
  }
  *(Class *)((char *)&v13->super.isa + v17) = (Class)ADAM::absoluteTimeFromCMTimeRange(v44, v46, v47, v45, v37, v38);
  if (!v13->_detectionFirstContinuousTimeStampPerMinute.__engaged_)
  {
    v48 = cont;
    v13->_detectionFirstAbsoluteTimestampPerMinute = SRAbsoluteTimeFromContinuousTime(cont);
    v13->_detectionFirstContinuousTimeStampPerMinute.var0.__val_ = v48;
    v13->_detectionFirstContinuousTimeStampPerMinute.__engaged_ = 1;
  }

LABEL_85:
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v7 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315906;
    v10 = "ADAMSoundAnalysisWriter.mm";
    v11 = 1024;
    v12 = 546;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_216CFB000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SN Request: %@ failed with error: %@", (uint8_t *)&v9, 0x26u);
  }

LABEL_10:
}

- (void)requestDidComplete:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**completeHandler)(id, _QWORD);
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v5 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    v5 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "ADAMSoundAnalysisWriter.mm";
    v10 = 1024;
    v11 = 553;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_216CFB000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d SN Request: %@ did complete", (uint8_t *)&v8, 0x1Cu);
  }

LABEL_10:
  -[NSMutableArray removeObject:](self->_requests, "removeObject:", v4);
  if (!-[NSMutableArray count](self->_requests, "count"))
  {
    completeHandler = (void (**)(id, _QWORD))self->_completeHandler;
    if (completeHandler)
      completeHandler[2](completeHandler, 0);
  }

}

- (BOOL)verifyStateInit
{
  _BOOL4 v3;

  v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_speechEmotionSRWriter, "isValidSRSensorWriterPresent");
  if (v3)
  {
    v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_soundDetectionSRWriter, "isValidSRSensorWriterPresent");
    if (v3)
      LOBYTE(v3) = self->_SNAnalyzer == 0;
  }
  return v3;
}

- (BOOL)verifyStateOn
{
  _BOOL4 v3;

  v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_speechEmotionSRWriter, "isValidSRSensorWriterPresent");
  if (v3)
  {
    v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_soundDetectionSRWriter, "isValidSRSensorWriterPresent");
    if (v3)
      LOBYTE(v3) = self->_SNAnalyzer != 0;
  }
  return v3;
}

- (void)logResultCountAndFirstTimeStamp
{
  unsigned __int8 v3;
  NSObject *v4;
  unsigned int detectionResultCounterPerMinute;
  unsigned __int8 v6;
  NSObject *v7;
  unint64_t val;
  double detectionFirstAbsoluteTimestampPerMinute;
  unsigned __int8 v10;
  NSObject *v11;
  unsigned int emotionResultCounterPerMinute;
  unsigned __int8 v13;
  NSObject *v14;
  unint64_t v15;
  double emotionFirstAbsoluteTimestampPerMinute;
  int v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  ADAMSoundAnalysisWriter *v26;
  __int16 v27;
  unint64_t v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (self->_detectionFirstContinuousTimeStampPerMinute.__engaged_)
  {
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v4 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
    {
      detectionResultCounterPerMinute = self->_detectionResultCounterPerMinute;
      v17 = 136316418;
      v18 = "ADAMSoundAnalysisWriter.mm";
      v19 = 1024;
      v20 = 577;
      v21 = 1040;
      v22 = 23;
      v23 = 2080;
      v24 = "ADAMSoundAnalysisWriter]";
      v25 = 2048;
      v26 = self;
      v27 = 1024;
      LODWORD(v28) = detectionResultCounterPerMinute;
      _os_log_impl(&dword_216CFB000, v4, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] # detection results sent previous minute : %d", (uint8_t *)&v17, 0x32u);
    }
    self->_detectionResultCounterPerMinute = 0;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v7 = (id)ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (!self->_detectionFirstContinuousTimeStampPerMinute.__engaged_)
        std::__throw_bad_optional_access[abi:ne180100]();
      val = self->_detectionFirstContinuousTimeStampPerMinute.var0.__val_;
      detectionFirstAbsoluteTimestampPerMinute = self->_detectionFirstAbsoluteTimestampPerMinute;
      v17 = 136316674;
      v18 = "ADAMSoundAnalysisWriter.mm";
      v19 = 1024;
      v20 = 580;
      v21 = 1040;
      v22 = 23;
      v23 = 2080;
      v24 = "ADAMSoundAnalysisWriter]";
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = val;
      v29 = 2048;
      v30 = detectionFirstAbsoluteTimestampPerMinute;
      _os_log_impl(&dword_216CFB000, v7, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] first detection timestamp of previous minute : continuous %llu, absolute %f", (uint8_t *)&v17, 0x40u);
    }

    if (self->_detectionFirstContinuousTimeStampPerMinute.__engaged_)
      self->_detectionFirstContinuousTimeStampPerMinute.__engaged_ = 0;
  }
  if (self->_emotionFirstContinuousTimeStampPerMinute.__engaged_)
  {
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v11 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
    {
      emotionResultCounterPerMinute = self->_emotionResultCounterPerMinute;
      v17 = 136316418;
      v18 = "ADAMSoundAnalysisWriter.mm";
      v19 = 1024;
      v20 = 586;
      v21 = 1040;
      v22 = 23;
      v23 = 2080;
      v24 = "ADAMSoundAnalysisWriter]";
      v25 = 2048;
      v26 = self;
      v27 = 1024;
      LODWORD(v28) = emotionResultCounterPerMinute;
      _os_log_impl(&dword_216CFB000, v11, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] # emotion results sent previous minute : %d", (uint8_t *)&v17, 0x32u);
    }
    self->_emotionResultCounterPerMinute = 0;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v14 = (id)ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (!self->_emotionFirstContinuousTimeStampPerMinute.__engaged_)
        std::__throw_bad_optional_access[abi:ne180100]();
      v15 = self->_emotionFirstContinuousTimeStampPerMinute.var0.__val_;
      emotionFirstAbsoluteTimestampPerMinute = self->_emotionFirstAbsoluteTimestampPerMinute;
      v17 = 136316674;
      v18 = "ADAMSoundAnalysisWriter.mm";
      v19 = 1024;
      v20 = 589;
      v21 = 1040;
      v22 = 23;
      v23 = 2080;
      v24 = "ADAMSoundAnalysisWriter]";
      v25 = 2048;
      v26 = self;
      v27 = 2048;
      v28 = v15;
      v29 = 2048;
      v30 = emotionFirstAbsoluteTimestampPerMinute;
      _os_log_impl(&dword_216CFB000, v14, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] first emotion timestamps of previous minute : continuous %llu, absolute %f", (uint8_t *)&v17, 0x40u);
    }

    if (self->_emotionFirstContinuousTimeStampPerMinute.__engaged_)
      self->_emotionFirstContinuousTimeStampPerMinute.__engaged_ = 0;
  }
}

- (void)sendCachedDetectionResultsToSensorKit
{
  ADAMSoundAnalysisWriter *begin_node;
  void *v4;
  uint64_t **p_frameCnt;
  unint64_t frameCnt;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  ADAMSRSensorWriter *soundDetectionSRWriter;
  id v14;
  unsigned __int8 v15;
  NSObject *v16;
  SRAbsoluteTime v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSString *sessionID;
  SRAbsoluteTime v25;
  void *v26;
  ADAMSRSensorWriter *speechMetricsSRWriter;
  id v28;
  unsigned __int8 v29;
  NSObject *v30;
  uint64_t *v31;
  SRAbsoluteTime v32;
  NSObject *v33;
  os_log_type_t v34;
  const char *v35;
  uint32_t v36;
  unsigned __int8 v37;
  uint64_t *v38;
  SRAbsoluteTime v39;
  uint64_t v40;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *v41;
  SNAudioStreamAnalyzer *SNAnalyzer;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *left;
  BOOL v44;
  uint64_t **p_detectionCachedResultMap;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *p_pair1;
  ADAMSoundAnalysisWriter *v47;
  uint64_t *obj;
  uint64_t v49;
  uint64_t v50;
  id v51;
  _OWORD v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  void *v61;
  void *v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  char *v70;
  __int16 v71;
  ADAMSoundAnalysisWriter *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  SRAbsoluteTime v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  begin_node = (ADAMSoundAnalysisWriter *)self->_detectionCachedTimestamps.__tree_.__begin_node_;
  p_pair1 = &self->_detectionCachedTimestamps.__tree_.__pair1_;
  if (begin_node != (ADAMSoundAnalysisWriter *)&self->_detectionCachedTimestamps.__tree_.__pair1_)
  {
    v4 = 0;
    p_detectionCachedResultMap = (uint64_t **)&self->_detectionCachedResultMap;
    while (1)
    {
      v59 = 0u;
      v60 = 0u;
      v47 = begin_node;
      frameCnt = begin_node->_frameCnt;
      p_frameCnt = (uint64_t **)&begin_node->_frameCnt;
      v58 = 0u;
      v57 = 0u;
      obj = std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(p_detectionCachedResultMap, frameCnt, p_frameCnt)[5];
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
      if (v7)
        break;
LABEL_38:

      v41 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v47;
      SNAnalyzer = v47->_SNAnalyzer;
      if (SNAnalyzer)
      {
        do
        {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)SNAnalyzer;
          SNAnalyzer = (SNAudioStreamAnalyzer *)SNAnalyzer->super.isa;
        }
        while (SNAnalyzer);
      }
      else
      {
        do
        {
          left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<unsigned long long, void *>>> *)v41[2].__value_.__left_;
          v44 = left->__value_.__left_ == v41;
          v41 = left;
        }
        while (!v44);
      }
      begin_node = (ADAMSoundAnalysisWriter *)left;
      if (left == p_pair1)
        goto LABEL_46;
    }
    LODWORD(v8) = 0;
    v49 = *(_QWORD *)v58;
LABEL_5:
    v9 = 0;
    v8 = (int)v8;
    v50 = v7;
    while (1)
    {
      if (*(_QWORD *)v58 != v49)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v9);
      v11 = *p_frameCnt;
      if (-[ADAMSoundAnalysisWriter _isMonitoringSoundDetection](self, "_isMonitoringSoundDetection"))
      {
        v12 = (uint64_t)v11 + v8;
        soundDetectionSRWriter = self->_soundDetectionSRWriter;
        v56 = v4;
        -[ADAMSRSensorWriter provideSample:continuousTimestamp:error:](soundDetectionSRWriter, "provideSample:continuousTimestamp:error:", v10, (char *)v11 + v8, &v56);
        v14 = v56;

        if (v14)
        {
          {
            ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
          }
          v16 = (id)ADAM::get_log(void)::adam_os_log;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = SRAbsoluteTimeFromContinuousTime(v12);
            *(_DWORD *)buf = 136317186;
            v64 = "ADAMSoundAnalysisWriter.mm";
            v65 = 1024;
            v66 = 618;
            v67 = 1040;
            v68 = 23;
            v69 = 2080;
            v70 = "ADAMSoundAnalysisWriter]";
            v71 = 2048;
            v72 = self;
            v73 = 2112;
            v74 = v10;
            v75 = 2048;
            v76 = v12;
            v77 = 2048;
            v78 = v17;
            v79 = 2112;
            v80 = v14;
            _os_log_impl(&dword_216CFB000, v16, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] failed to write SNDetectionResult result to SensorKit: %@, timestamp: continuous %llu, absolute %f, err: %@", buf, 0x54u);
          }

          v4 = v14;
        }
        else
        {
          v4 = 0;
        }
        v7 = v50;
      }
      if (!-[ADAMSoundAnalysisWriter _isMonitoringSpeechMetrics](self, "_isMonitoringSpeechMetrics"))
        goto LABEL_29;
      objc_msgSend(v10, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v18;
      v19 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v10, "confidence");
      objc_msgSend(v19, "numberWithDouble:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9AF0]), "initWithClassificationDictionary:", v21);
      if (v10)
      {
        objc_msgSend(v10, "timeRange");
      }
      else
      {
        v54 = 0u;
        v55 = 0u;
        v53 = 0u;
      }
      v52[0] = v53;
      v52[1] = v54;
      v52[2] = v55;
      objc_msgSend(v22, "setTimeRange:", v52);
      v23 = objc_alloc(MEMORY[0x24BDE9710]);
      sessionID = self->_sessionID;
      v25 = SRAbsoluteTimeFromContinuousTime((uint64_t)*p_frameCnt);
      v26 = (void *)objc_msgSend(v23, "initWithSessionIdentifier:sessionFlags:timestamp:audioLevel:speechRecognition:soundClassification:speechExpression:", sessionID, 0, 0, 0, v22, 0, SRAbsoluteTimeToCFAbsoluteTime(v25));
      speechMetricsSRWriter = self->_speechMetricsSRWriter;
      v51 = v4;
      -[ADAMSRSensorWriter provideSample:error:](speechMetricsSRWriter, "provideSample:error:", v26, &v51);
      v28 = v51;

      if (v28)
      {
        {
          ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
        }
        v30 = (id)ADAM::get_log(void)::adam_os_log;
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          goto LABEL_28;
        v31 = *p_frameCnt;
        v32 = SRAbsoluteTimeFromContinuousTime((uint64_t)*p_frameCnt);
        *(_DWORD *)buf = 136317186;
        v64 = "ADAMSoundAnalysisWriter.mm";
        v65 = 1024;
        v66 = 635;
        v67 = 1040;
        v68 = 23;
        v69 = 2080;
        v70 = "ADAMSoundAnalysisWriter]";
        v71 = 2048;
        v72 = self;
        v73 = 2112;
        v74 = v26;
        v75 = 2048;
        v76 = (uint64_t)v31;
        v77 = 2048;
        v78 = v32;
        v79 = 2112;
        v80 = v28;
        v33 = v30;
        v34 = OS_LOG_TYPE_ERROR;
        v35 = "[%s:%-5d %.*s:%p] failed to write SRSpeechMetrics result to SensorKit: %@, timestamp: continuous %llu, abs"
              "olute %f, err: %@";
        v36 = 84;
      }
      else
      {
        ++self->_detectionResultCounterPerMinute;
        {
          ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
        }
        v30 = (id)ADAM::get_log(void)::adam_os_log;
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
        v38 = *p_frameCnt;
        v39 = SRAbsoluteTimeFromContinuousTime((uint64_t)*p_frameCnt);
        *(_DWORD *)buf = 136316930;
        v64 = "ADAMSoundAnalysisWriter.mm";
        v65 = 1024;
        v66 = 640;
        v67 = 1040;
        v68 = 23;
        v69 = 2080;
        v70 = "ADAMSoundAnalysisWriter]";
        v71 = 2048;
        v72 = self;
        v73 = 2112;
        v74 = v26;
        v75 = 2048;
        v76 = (uint64_t)v38;
        v77 = 2048;
        v78 = v39;
        v33 = v30;
        v34 = OS_LOG_TYPE_DEBUG;
        v35 = "[%s:%-5d %.*s:%p] Write SRSpeechMetrics result: %@, timestamp: continuous %llu, absolute %f";
        v36 = 74;
      }
      _os_log_impl(&dword_216CFB000, v33, v34, v35, buf, v36);
LABEL_28:

      v4 = v28;
      v7 = v50;
LABEL_29:
      v8 += 5;
      if (v7 == ++v9)
      {
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v81, 16);
        v7 = v40;
        if (!v40)
          goto LABEL_38;
        goto LABEL_5;
      }
    }
  }
  v4 = 0;
LABEL_46:
  std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::destroy((_QWORD *)self->_detectionCachedResultMap.__tree_.__pair1_.__value_.__left_);
  self->_detectionCachedResultMap.__tree_.__pair1_.__value_.__left_ = 0;
  self->_detectionCachedResultMap.__tree_.__pair3_.__value_ = 0;
  self->_detectionCachedResultMap.__tree_.__begin_node_ = &self->_detectionCachedResultMap.__tree_.__pair1_;
  std::__tree<ADAM::EndPointBitMask>::destroy((_QWORD *)self->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_);
  self->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_ = 0;
  self->_detectionCachedTimestamps.__tree_.__pair3_.__value_ = 0;
  self->_detectionCachedTimestamps.__tree_.__begin_node_ = p_pair1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  std::__tree<std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,NSMutableArray * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,NSMutableArray * {__strong}>>>::destroy((_QWORD *)self->_detectionCachedResultMap.__tree_.__pair1_.__value_.__left_);
  std::__tree<ADAM::EndPointBitMask>::destroy((_QWORD *)self->_detectionCachedTimestamps.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_speechMetricsSRWriter, 0);
  objc_storeStrong((id *)&self->_soundDetectionSRWriter, 0);
  objc_storeStrong((id *)&self->_speechEmotionSRWriter, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_audioLevelRequest, 0);
  objc_destroyWeak((id *)&self->_speechEmotionRequest);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completeHandler, 0);
  objc_storeStrong((id *)&self->_SNAnalyzer, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 152) = 0;
  *((_BYTE *)self + 160) = 0;
  *((_BYTE *)self + 184) = 0;
  *((_BYTE *)self + 192) = 0;
  *((_QWORD *)self + 30) = 0;
  *((_QWORD *)self + 29) = (char *)self + 240;
  *((_QWORD *)self + 33) = 0;
  *((_QWORD *)self + 34) = 0;
  *((_QWORD *)self + 31) = 0;
  *((_QWORD *)self + 32) = (char *)self + 264;
  return self;
}

uint64_t __46__ADAMSoundAnalysisWriter_write_withMetadata___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  char v3;
  NSObject *v4;
  id v5;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[97])
  {
    v3 = v2[96];
    if (((-64 * v3) | ((-85 * v3) >> 2)) <= 0x15u)
    {
      objc_msgSend(v2, "reinitializeSpeechEmotionRequest");
      v2 = *(_BYTE **)(a1 + 32);
      v3 = v2[96];
    }
    v2[96] = v3 + 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) %= 0xCu;
  }
  else
  {
    objc_msgSend(v2, "reinitializeSpeechEmotionRequest");
  }
  objc_msgSend(*(id *)(a1 + 32), "_setProcessing:", 1);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "analyzeAudioBuffer:atAudioFramePosition:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(*(id *)(a1 + 32), "sendCachedDetectionResultsToSensorKit");
  objc_msgSend(*(id *)(a1 + 32), "logResultCountAndFirstTimeStamp");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) += *(unsigned int *)(*(_QWORD *)(a1 + 56) + 64);
  objc_msgSend(*(id *)(a1 + 32), "_setProcessing:", 0);
  if (*(_BYTE *)(a1 + 64))
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v4 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v4)
      {
LABEL_16:
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 68) = 1;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "completeAnalysis");
        return objc_msgSend(*(id *)(a1 + 32), "destroyAndLogOSTransaction");
      }
    }
    else
    {
      v4 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "ADAMSoundAnalysisWriter.mm";
      v9 = 1024;
      v10 = 374;
      _os_log_impl(&dword_216CFB000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d sending the last batch of audio data to SoundAnalysis", (uint8_t *)&v7, 0x12u);
    }

    goto LABEL_16;
  }
  return objc_msgSend(*(id *)(a1 + 32), "destroyAndLogOSTransaction");
}

void __51__ADAMSoundAnalysisWriter__initializeSoundAnalyzer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  v13 = 0;
  objc_msgSend(v5, "addRequest:withObserver:error:", v3, v4, &v13);
  v6 = v13;
  if (!v6)
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v7 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v7)
        goto LABEL_20;
    }
    else
    {
      v7 = MEMORY[0x24BDACB70];
      v12 = MEMORY[0x24BDACB70];
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315650;
    v15 = "ADAMSoundAnalysisWriter.mm";
    v16 = 1024;
    v17 = 217;
    v18 = 2112;
    v19 = v3;
    v9 = "%25s:%-5d added SN request: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_18;
  }
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v7 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v7)
      goto LABEL_20;
  }
  else
  {
    v7 = MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "ADAMSoundAnalysisWriter.mm";
    v16 = 1024;
    v17 = 213;
    v18 = 2112;
    v19 = v3;
    v9 = "%25s:%-5d failed to add SN request: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
LABEL_18:
    _os_log_impl(&dword_216CFB000, v10, v11, v9, buf, 0x1Cu);
  }
LABEL_19:

LABEL_20:
}

@end
