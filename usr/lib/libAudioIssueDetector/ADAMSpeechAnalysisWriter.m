@implementation ADAMSpeechAnalysisWriter

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
    v8 = "ADAMSpeechAnalysisWriter.mm";
    v9 = 1024;
    v10 = 80;
    _os_log_impl(&dword_216CFB000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created os_transaction for speech", (uint8_t *)&v7, 0x12u);
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
    v6 = "ADAMSpeechAnalysisWriter.mm";
    v7 = 1024;
    v8 = 86;
    _os_log_impl(&dword_216CFB000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Destroyed os_transaction for speech", (uint8_t *)&v5, 0x12u);
  }

}

- (ADAMSpeechAnalysisWriter)initWithWriterName:(id)a3 sessionID:(unsigned int)a4 audioFormat:(id)a5 speechMetricsSRWriter:(id)a6 completionHandler:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  ADAMSpeechAnalysisWriter *v15;
  uint64_t v16;
  id completionHandler;
  uint64_t v18;
  NSString *sessionID;
  id v20;
  unsigned __int8 v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  NSMutableDictionary *taskTimestamps;
  dispatch_semaphore_t v25;
  OS_dispatch_semaphore *throttlingSemaphore;
  void *v27;
  int v28;
  const char *v29;
  void *v30;
  int v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *queue;
  ADAMSpeechAnalysisWriter *v34;
  id v36;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BYTE v44[14];
  __int16 v45;
  ADAMSpeechAnalysisWriter *v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v10 = *(_QWORD *)&a4;
  v49 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v37 = a6;
  v14 = a7;
  v38.receiver = self;
  v38.super_class = (Class)ADAMSpeechAnalysisWriter;
  v15 = -[ADAMSpeechAnalysisWriter init](&v38, sel_init);
  if (!v15)
    goto LABEL_12;
  v16 = MEMORY[0x219A011D4](v14);
  completionHandler = v15->_completionHandler;
  v15->_completionHandler = (id)v16;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), v10, v37);
  v18 = objc_claimAutoreleasedReturnValue();
  sessionID = v15->_sessionID;
  v15->_sessionID = (NSString *)v18;

  v20 = v13;
  {
    ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
  }
  v22 = ADAM::get_log(void)::adam_os_log;
  if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v40 = "ADAMSpeechAnalysisWriter.mm";
    v41 = 1024;
    v42 = 100;
    v43 = 1040;
    *(_DWORD *)v44 = 24;
    *(_WORD *)&v44[4] = 2080;
    *(_QWORD *)&v44[6] = "ADAMSpeechAnalysisWriter]";
    v45 = 2048;
    v46 = v15;
    v47 = 1024;
    v48 = v10;
    _os_log_impl(&dword_216CFB000, v22, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] Created with session ID: %d", buf, 0x32u);
  }
  objc_storeStrong((id *)&v15->_format, a5);
  v13 = v20;
  v15->_frameCnt = 0;
  v15->_pendingRequestCnt = 0;
  v15->_statusLock._os_unfair_lock_opaque = 0;
  v15->_lastTimestamp = 0;
  *(_QWORD *)&v15->_timestampLock._os_unfair_lock_opaque = 0;
  v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  taskTimestamps = v15->_taskTimestamps;
  v15->_taskTimestamps = v23;

  v15->_resultCounterPerMinute = 0;
  v15->_firstAbsoluteTimestampPerMinute = 0.0;
  v15->_SpeechRecognizerInitialized = 0;
  v25 = dispatch_semaphore_create(0);
  throttlingSemaphore = v15->_throttlingSemaphore;
  v15->_throttlingSemaphore = (OS_dispatch_semaphore *)v25;

  if (-[ADAMSpeechAnalysisWriter isMonitoring](v15, "isMonitoring"))
    -[ADAMSpeechAnalysisWriter createAndLogOSTransaction](v15, "createAndLogOSTransaction");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "SiriUplink");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v12, "hasPrefix:", v27);

  if (v28)
  {
    objc_storeStrong((id *)&v15->_speechMetricsSRWriter, a6);
    v29 = "SiriUplink";
LABEL_11:
    v32 = dispatch_queue_create(v29, 0);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v32;

LABEL_12:
    v34 = v15;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "TelephonyUplink");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v12, "hasPrefix:", v30);

  if (v31)
  {
    objc_storeStrong((id *)&v15->_speechMetricsSRWriter, a6);
    v29 = "TelephonyUplink";
    goto LABEL_11;
  }
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v34 = (ADAMSpeechAnalysisWriter *)*(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v34)
      goto LABEL_13;
  }
  else
  {
    v34 = (ADAMSpeechAnalysisWriter *)MEMORY[0x24BDACB70];
    v36 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(&v34->super, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v40 = "ADAMSpeechAnalysisWriter.mm";
    v41 = 1024;
    v42 = 137;
    v43 = 2112;
    *(_QWORD *)v44 = v12;
    _os_log_impl(&dword_216CFB000, &v34->super, OS_LOG_TYPE_ERROR, "%25s:%-5d unknown audio buffer stream type: %@", buf, 0x1Cu);
  }

  v34 = 0;
LABEL_13:

  return v34;
}

- (void)_initSpeechAnalyzer
{
  os_unfair_lock_s *p_initLock;
  id v4;
  void *v5;
  SFSpeechRecognizer *v6;
  SFSpeechRecognizer *SpeechRecognizer;
  SFSpeechAudioBufferRecognitionRequest *SpeechRequest;

  p_initLock = &self->_initLock;
  os_unfair_lock_lock(&self->_initLock);
  if (!self->_SpeechRecognizerInitialized)
  {
    v4 = objc_alloc(MEMORY[0x24BDE9E38]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en-US"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (SFSpeechRecognizer *)objc_msgSend(v4, "initWithLocale:", v5);
    SpeechRecognizer = self->_SpeechRecognizer;
    self->_SpeechRecognizer = v6;

    SpeechRequest = self->_SpeechRequest;
    self->_SpeechRequest = 0;

    self->_SpeechRecognizerInitialized = 1;
  }
  os_unfair_lock_unlock(p_initLock);
}

- (BOOL)isMonitoring
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

- (BOOL)isComplete
{
  ADAMSpeechAnalysisWriter *v2;
  os_unfair_lock_s *p_statusLock;

  v2 = self;
  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  LOBYTE(v2) = v2->_pendingRequestCnt == 0;
  os_unfair_lock_unlock(p_statusLock);
  return (char)v2;
}

- (unint64_t)_addPendingRequest
{
  os_unfair_lock_s *p_statusLock;
  unint64_t v4;

  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  v4 = self->_pendingRequestCnt + 1;
  self->_pendingRequestCnt = v4;
  os_unfair_lock_unlock(p_statusLock);
  return v4;
}

- (unint64_t)_removePendingRequest
{
  os_unfair_lock_s *p_statusLock;
  unint64_t v4;

  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  v4 = self->_pendingRequestCnt - 1;
  self->_pendingRequestCnt = v4;
  os_unfair_lock_unlock(p_statusLock);
  return v4;
}

- (unint64_t)_getNumPendingRequests
{
  os_unfair_lock_s *p_statusLock;
  unint64_t pendingRequestCnt;

  p_statusLock = &self->_statusLock;
  os_unfair_lock_lock(&self->_statusLock);
  pendingRequestCnt = self->_pendingRequestCnt;
  os_unfair_lock_unlock(p_statusLock);
  return pendingRequestCnt;
}

- (void)_recordTimestamp:(unint64_t)a3 forTask:(id)a4
{
  id v6;
  os_unfair_lock_s *p_timestampLock;
  NSMutableDictionary *taskTimestamps;
  void *v9;
  void *v10;
  id v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  p_timestampLock = &self->_timestampLock;
  os_unfair_lock_lock(&self->_timestampLock);
  taskTimestamps = self->_taskTimestamps;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](taskTimestamps, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v11 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v11)
        goto LABEL_19;
    }
    else
    {
      v11 = (id)MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    v17 = v11;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315650;
      v22 = "ADAMSpeechAnalysisWriter.mm";
      v23 = 1024;
      v24 = 220;
      v25 = 2112;
      v26 = (unint64_t)v18;
      _os_log_impl(&dword_216CFB000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d timestamp already exists for task %@?", (uint8_t *)&v21, 0x1Cu);

    }
  }
  else
  {
    v12 = self->_taskTimestamps;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v13, v14);

    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15)
        goto LABEL_19;
    }
    else
    {
      v15 = (id)MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    v17 = v15;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 136315906;
      v22 = "ADAMSpeechAnalysisWriter.mm";
      v23 = 1024;
      v24 = 215;
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = v20;
      _os_log_impl(&dword_216CFB000, v17, OS_LOG_TYPE_INFO, "%25s:%-5d Recorded timestamp (%llu) for task %@", (uint8_t *)&v21, 0x26u);

    }
  }

LABEL_19:
  os_unfair_lock_unlock(p_timestampLock);

}

- (unint64_t)_fetchTimestampforTask:(id)a3
{
  id v4;
  os_unfair_lock_s *p_timestampLock;
  NSMutableDictionary *taskTimestamps;
  void *v7;
  void *v8;
  unint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  unint64_t lastTimestamp;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_timestampLock = &self->_timestampLock;
  os_unfair_lock_lock(&self->_timestampLock);
  taskTimestamps = self->_taskTimestamps;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](taskTimestamps, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v13 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v13)
      {
LABEL_20:
        v9 = self->_lastTimestamp + 5;
        goto LABEL_21;
      }
    }
    else
    {
      v13 = (id)MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    v18 = v13;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      lastTimestamp = self->_lastTimestamp;
      v22 = 136315906;
      v23 = "ADAMSpeechAnalysisWriter.mm";
      v24 = 1024;
      v25 = 242;
      v26 = 2112;
      v27 = v19;
      v28 = 2048;
      v29 = lastTimestamp;
      _os_log_impl(&dword_216CFB000, v18, OS_LOG_TYPE_DEFAULT, "%25s:%-5d timestamp missing for task %@, last timestamp: %llu", (uint8_t *)&v22, 0x26u);

    }
    goto LABEL_20;
  }
  v9 = objc_msgSend(v8, "unsignedLongLongValue");
  v10 = self->_taskTimestamps;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v12 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v12)
      goto LABEL_21;
  }
  else
  {
    v12 = (id)MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  v15 = v12;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 136315906;
    v23 = "ADAMSpeechAnalysisWriter.mm";
    v24 = 1024;
    v25 = 237;
    v26 = 2112;
    v27 = v16;
    v28 = 2048;
    v29 = v9;
    _os_log_impl(&dword_216CFB000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d removed timestamp for task %@, timestamp: %llu", (uint8_t *)&v22, 0x26u);

  }
LABEL_21:
  os_unfair_lock_unlock(p_timestampLock);

  return v9;
}

- (int)write:(id)a3 withMetadata:(const Metadata *)a4
{
  id v6;
  UInt64 mHostTime;
  UInt64 v8;
  NSObject *queue;
  _QWORD v11[5];
  id v12;
  UInt64 v13;
  const Metadata *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  if (-[ADAMSpeechAnalysisWriter isMonitoring](self, "isMonitoring"))
  {
    if (!self->_transaction)
      -[ADAMSpeechAnalysisWriter createAndLogOSTransaction](self, "createAndLogOSTransaction");
    -[ADAMSpeechAnalysisWriter _initSpeechAnalyzer](self, "_initSpeechAnalyzer");
    if (ADAM::isXCTest(void)::once != -1)
      dispatch_once(&ADAM::isXCTest(void)::once, &__block_literal_global_45);
    if (!ADAM::isXCTest(void)::isXCTest)
    {
      mHostTime = a4->var0.mHostTime;
      v16 = 0;
      v15 = 0;
      mach_get_times();
      -[ADAMSpeechAnalysisWriter _addPendingRequest](self, "_addPendingRequest");
      v8 = mHostTime;
      queue = self->_queue;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __47__ADAMSpeechAnalysisWriter_write_withMetadata___block_invoke;
      v11[3] = &unk_24D616200;
      v11[4] = self;
      v12 = v6;
      v13 = v8;
      v14 = a4;
      dispatch_async(queue, v11);

    }
  }

  return 0;
}

- (void)speechRecognitionDidDetectSpeech:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v4 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v4)
      goto LABEL_10;
  }
  else
  {
    v4 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "ADAMSpeechAnalysisWriter.mm";
    v8 = 1024;
    v9 = 314;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_216CFB000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d deteced speech for task %@", (uint8_t *)&v6, 0x1Cu);
  }

LABEL_10:
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
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
    v7 = (id)MEMORY[0x24BDACB70];
    v8 = MEMORY[0x24BDACB70];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "formattedString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316162;
    v12 = "ADAMSpeechAnalysisWriter.mm";
    v13 = 1024;
    v14 = 323;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v10;
    v19 = 2048;
    v20 = objc_msgSend(v5, "state");
    _os_log_impl(&dword_216CFB000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d didHypothesizeTranscription for task %@, Transcription: %@ Task state: %ld", (uint8_t *)&v11, 0x30u);

  }
LABEL_10:

}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  id v12;
  NSString *sessionID;
  SRAbsoluteTime v14;
  void *v15;
  ADAMSRSensorWriter *speechMetricsSRWriter;
  NSObject *v17;
  unsigned __int8 v18;
  NSObject *v19;
  uint64_t lastTimestamp;
  SRAbsoluteTime v21;
  id v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  uint64_t v26;
  SRAbsoluteTime v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  ADAMSpeechAnalysisWriter *v38;
  __int16 v39;
  NSObject *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  SRAbsoluteTime v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  SRAbsoluteTime v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "speechRecognitionMetadata"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    +[ADAMSpeechAnalysisWriter censoredResultFromInputResult:](ADAMSpeechAnalysisWriter, "censoredResultFromInputResult:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[ADAMSpeechAnalysisWriter _fetchTimestampforTask:](self, "_fetchTimestampforTask:", v6);
    self->_lastTimestamp = v11;
    if (!self->_firstContinuousTimestampPerMinute.__engaged_)
    {
      self->_firstAbsoluteTimestampPerMinute = SRAbsoluteTimeFromContinuousTime(v11);
      self->_firstContinuousTimestampPerMinute.var0.__val_ = self->_lastTimestamp;
      self->_firstContinuousTimestampPerMinute.__engaged_ = 1;
    }
    v12 = objc_alloc(MEMORY[0x24BDE9710]);
    sessionID = self->_sessionID;
    v14 = SRAbsoluteTimeFromContinuousTime(self->_lastTimestamp);
    v15 = (void *)objc_msgSend(v12, "initWithSessionIdentifier:sessionFlags:timestamp:audioLevel:speechRecognition:soundClassification:speechExpression:", sessionID, 0, 0, v10, 0, 0, SRAbsoluteTimeToCFAbsoluteTime(v14));
    speechMetricsSRWriter = self->_speechMetricsSRWriter;
    v28 = 0;
    -[ADAMSRSensorWriter provideSample:error:](speechMetricsSRWriter, "provideSample:error:", v15, &v28);
    v17 = v28;
    if (v17)
    {
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v19 = (id)ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        lastTimestamp = self->_lastTimestamp;
        v21 = SRAbsoluteTimeFromContinuousTime(lastTimestamp);
        v30 = "ADAMSpeechAnalysisWriter.mm";
        v31 = 1024;
        v32 = 381;
        v33 = 1040;
        v34 = 24;
        v35 = 2080;
        *(_DWORD *)buf = 136316930;
        v36 = "ADAMSpeechAnalysisWriter]";
        v37 = 2048;
        v38 = self;
        v39 = 2112;
        v40 = v17;
        v41 = 2048;
        v42 = lastTimestamp;
        v43 = 2048;
        v44 = v21;
        _os_log_impl(&dword_216CFB000, v19, OS_LOG_TYPE_ERROR, "[%s:%-5d %.*s:%p] failed to write speech metrics result to SensorKit: %@ timestamp: continuous %llu, absolute %f", buf, 0x4Au);
      }
    }
    else
    {
      ++self->_resultCounterPerMinute;
      {
        ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
      }
      v19 = (id)ADAM::get_log(void)::adam_os_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "bestTranscription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "formattedString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = self->_lastTimestamp;
        v27 = SRAbsoluteTimeFromContinuousTime(v26);
        *(_DWORD *)buf = 136317443;
        v30 = "ADAMSpeechAnalysisWriter.mm";
        v31 = 1024;
        v32 = 387;
        v33 = 1040;
        v34 = 24;
        v35 = 2080;
        v36 = "ADAMSpeechAnalysisWriter]";
        v37 = 2048;
        v38 = self;
        v39 = 2112;
        v40 = v6;
        v41 = 2117;
        v42 = (uint64_t)v25;
        v43 = 2112;
        v44 = *(double *)&v15;
        v45 = 2048;
        v46 = v26;
        v47 = 2048;
        v48 = v27;
        _os_log_impl(&dword_216CFB000, v19, OS_LOG_TYPE_DEBUG, "[%s:%-5d %.*s:%p] -> WRITE speech metrics for task %@, best result: %{sensitive}@ speech metrics: %@ timestamp: continuous %llu, absolute %f", buf, 0x5Eu);

      }
    }

  }
  else
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v17 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v17)
        goto LABEL_22;
    }
    else
    {
      v17 = MEMORY[0x24BDACB70];
      v22 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v30 = "ADAMSpeechAnalysisWriter.mm";
      v31 = 1024;
      v32 = 393;
      _os_log_impl(&dword_216CFB000, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Speech Metrics are null", buf, 0x12u);
    }
  }

LABEL_22:
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
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
    v7 = 136315650;
    v8 = "ADAMSpeechAnalysisWriter.mm";
    v9 = 1024;
    v10 = 405;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_216CFB000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d recognition task %@ cancelled", (uint8_t *)&v7, 0x1Cu);
  }

LABEL_10:
  -[ADAMSpeechAnalysisWriter speechRecognitionTask:didFinishSuccessfully:](self, "speechRecognitionTask:didFinishSuccessfully:", v4, 0);

}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_throttlingSemaphore);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__ADAMSpeechAnalysisWriter_speechRecognitionTask_didFinishSuccessfully___block_invoke;
  block[3] = &unk_24D616228;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (BOOL)verifyStateInit
{
  _BOOL4 v3;

  v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_speechMetricsSRWriter, "isValidSRSensorWriterPresent");
  if (v3)
    LOBYTE(v3) = self->_SpeechRecognizer == 0;
  return v3;
}

- (BOOL)verifyStateOn
{
  _BOOL4 v3;

  v3 = -[ADAMSRSensorWriter isValidSRSensorWriterPresent](self->_speechMetricsSRWriter, "isValidSRSensorWriterPresent");
  if (v3)
    LOBYTE(v3) = self->_SpeechRecognizer != 0;
  return v3;
}

- (void)logResultCountAndFirstTimeStamp
{
  unsigned __int8 v3;
  NSObject *v4;
  unsigned int resultCounterPerMinute;
  unsigned __int8 v6;
  NSObject *v7;
  unint64_t val;
  double firstAbsoluteTimestampPerMinute;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  __int16 v18;
  ADAMSpeechAnalysisWriter *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_firstContinuousTimestampPerMinute.__engaged_)
  {
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v4 = ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled((os_log_t)ADAM::get_log(void)::adam_os_log, OS_LOG_TYPE_DEFAULT))
    {
      resultCounterPerMinute = self->_resultCounterPerMinute;
      v10 = 136316418;
      v11 = "ADAMSpeechAnalysisWriter.mm";
      v12 = 1024;
      v13 = 451;
      v14 = 1040;
      v15 = 24;
      v16 = 2080;
      v17 = "ADAMSpeechAnalysisWriter]";
      v18 = 2048;
      v19 = self;
      v20 = 1024;
      LODWORD(v21) = resultCounterPerMinute;
      _os_log_impl(&dword_216CFB000, v4, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] # speech results sent previous minute : %d", (uint8_t *)&v10, 0x32u);
    }
    self->_resultCounterPerMinute = 0;
    {
      ADAM::get_log(void)::adam_os_log = (uint64_t)os_log_create("com.apple.coreaudio", "adam");
    }
    v7 = (id)ADAM::get_log(void)::adam_os_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (!self->_firstContinuousTimestampPerMinute.__engaged_)
        std::__throw_bad_optional_access[abi:ne180100]();
      val = self->_firstContinuousTimestampPerMinute.var0.__val_;
      firstAbsoluteTimestampPerMinute = self->_firstAbsoluteTimestampPerMinute;
      v10 = 136316674;
      v11 = "ADAMSpeechAnalysisWriter.mm";
      v12 = 1024;
      v13 = 454;
      v14 = 1040;
      v15 = 24;
      v16 = 2080;
      v17 = "ADAMSpeechAnalysisWriter]";
      v18 = 2048;
      v19 = self;
      v20 = 2048;
      v21 = val;
      v22 = 2048;
      v23 = firstAbsoluteTimestampPerMinute;
      _os_log_impl(&dword_216CFB000, v7, OS_LOG_TYPE_DEFAULT, "[%s:%-5d %.*s:%p] first speech timestamps of previous minute : continuous %llu, absolute %f", (uint8_t *)&v10, 0x40u);
    }

    if (self->_firstContinuousTimestampPerMinute.__engaged_)
      self->_firstContinuousTimestampPerMinute.__engaged_ = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_speechMetricsSRWriter, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_taskTimestamps, 0);
  objc_storeStrong((id *)&self->_throttlingSemaphore, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_SpeechRequest, 0);
  objc_storeStrong((id *)&self->_SpeechRecognizer, 0);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 136) = 0;
  *((_BYTE *)self + 144) = 0;
  return self;
}

void __72__ADAMSpeechAnalysisWriter_speechRecognitionTask_didFinishSuccessfully___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_removePendingRequest");
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v3 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = (id)MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  v5 = v3;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136316418;
    v12 = "ADAMSpeechAnalysisWriter.mm";
    v13 = 1024;
    v14 = 423;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    v21 = 2048;
    v22 = v2;
    _os_log_impl(&dword_216CFB000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d -> FINISHED task %@, successful(%@), error: %@, pending requests: %llu", (uint8_t *)&v11, 0x3Au);

  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "logResultCountAndFirstTimeStamp");
  objc_msgSend(*(id *)(a1 + 40), "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    if (v10)
      (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v9);
  }

}

void __47__ADAMSpeechAnalysisWriter_write_withMetadata___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDE9E18]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setShouldReportPartialResults:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRequiresOnDeviceRecognition:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "appendAudioPCMBuffer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "recognitionTaskWithRequest:delegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_recordTimestamp:forTask:", *(_QWORD *)(a1 + 48), v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "endAudio");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) += *(unsigned int *)(*(_QWORD *)(a1 + 56) + 64);
  if (ADAM::ADAMLogScope(void)::once != -1)
    dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
  if (ADAM::ADAMLogScope(void)::scope)
  {
    v6 = *(id *)ADAM::ADAMLogScope(void)::scope;
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v6 = (id)MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  v8 = v6;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "_getNumPendingRequests");
    v12 = *(_QWORD *)(a1 + 48);
    v18 = 136316674;
    v19 = "ADAMSpeechAnalysisWriter.mm";
    v20 = 1024;
    v21 = 290;
    v22 = 2112;
    v23 = v9;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v10;
    v28 = 2048;
    v29 = v11;
    v30 = 2048;
    v31 = v12;
    _os_log_impl(&dword_216CFB000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d -> SENT speech recognition request [ %@ ] with task [ %@ (%@)] requests pending: %llu timestamp: %llu", (uint8_t *)&v18, 0x44u);

  }
LABEL_10:
  v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v14 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    if (ADAM::ADAMLogScope(void)::once != -1)
      dispatch_once(&ADAM::ADAMLogScope(void)::once, &__block_literal_global_79);
    if (ADAM::ADAMLogScope(void)::scope)
    {
      v15 = *(id *)ADAM::ADAMLogScope(void)::scope;
      if (!v15)
        goto LABEL_20;
    }
    else
    {
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
      v18 = 136315906;
      v19 = "ADAMSpeechAnalysisWriter.mm";
      v20 = 1024;
      v21 = 300;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v5;
      _os_log_impl(&dword_216CFB000, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d error: request [%@] , task [%@] timed out...", (uint8_t *)&v18, 0x26u);
    }

  }
LABEL_20:
  objc_msgSend(*(id *)(a1 + 32), "destroyAndLogOSTransaction");

}

+ (id)censoredResultFromInputResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  int v19;
  double v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestTranscription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "segments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v3, "bestTranscription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v3;

    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v30;
      v11 = MEMORY[0x24BDBD1A8];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v12);
          if (v13)
          {
            v14 = objc_alloc(MEMORY[0x24BDE9E68]);
            objc_msgSend(v13, "timestamp");
            v16 = v15;
            objc_msgSend(v13, "duration");
            v18 = v17;
            objc_msgSend(v13, "confidence");
            LODWORD(v20) = v19;
            v21 = (void *)objc_msgSend(v14, "_initWithSubstring:range:timestamp:duration:confidence:alternativeSubstrings:alternativeConfidences:phoneSequence:ipaPhoneSequence:voiceAnalytics:", &stru_24D616C20, 0, 0, v11, v11, &stru_24D616C20, v16, v18, v20, &stru_24D616C20, 0);
            objc_msgSend(v28, "addObject:", v21);

          }
          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v9);
    }

    v3 = v8;
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9E58]), "_initWithSegments:formattedString:speakingRate:averagePauseDuration:", v28, &stru_24D616C20, 0.0, 0.0);
  v23 = objc_alloc(MEMORY[0x24BDE9E28]);
  v24 = objc_msgSend(v3, "isFinal");
  objc_msgSend(v3, "speechRecognitionMetadata");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "_initWithBestTranscription:rawTranscription:final:speechRecognitionMetadata:", v22, 0, v24, v25);

  return v26;
}

@end
