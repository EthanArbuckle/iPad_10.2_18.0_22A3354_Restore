@implementation SFSpeechSynthesisTask

- (SFSpeechSynthesisTask)initWithRequest:(id)a3
{
  id v5;
  SFSpeechSynthesisTask *v6;
  SFSpeechSynthesisTask *v7;
  NSMutableArray *v8;
  NSMutableArray *bufferedAudios;
  NSMutableArray *v10;
  NSMutableArray *bufferedAudioData;
  NSMutableArray *v12;
  NSMutableArray *phonemeSequence;
  uint64_t v14;
  NSString *taskIdentifer;
  NSCondition *v16;
  NSCondition *synthesisStateCondition;
  SFSSInstrumentMetrics *v18;
  SFSSInstrumentMetrics *instrumentMetrics;
  void *v20;
  void *v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SFSpeechSynthesisTask;
  v6 = -[SFSpeechSynthesisTask init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_speakState = 0;
    v6->_synthesisState = 0;
    objc_storeStrong((id *)&v6->_request, a3);
    v7->_bufferedDuration = 0.0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    bufferedAudios = v7->_bufferedAudios;
    v7->_bufferedAudios = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    bufferedAudioData = v7->_bufferedAudioData;
    v7->_bufferedAudioData = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    phonemeSequence = v7->_phonemeSequence;
    v7->_phonemeSequence = v12;

    -[SFSpeechSynthesisRequest requestIdentifer](v7->_request, "requestIdentifer");
    v14 = objc_claimAutoreleasedReturnValue();
    taskIdentifer = v7->_taskIdentifer;
    v7->_taskIdentifer = (NSString *)v14;

    v16 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    synthesisStateCondition = v7->_synthesisStateCondition;
    v7->_synthesisStateCondition = v16;

    v18 = objc_alloc_init(SFSSInstrumentMetrics);
    instrumentMetrics = v7->_instrumentMetrics;
    v7->_instrumentMetrics = v18;

    objc_msgSend(v5, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSSInstrumentMetrics setText:](v7->_instrumentMetrics, "setText:", v20);

    -[SFSSInstrumentMetrics setIsSpeechRequest:](v7->_instrumentMetrics, "setIsSpeechRequest:", objc_msgSend(v5, "type") == 0);
    objc_msgSend(v5, "clientBundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSSInstrumentMetrics setClientBundleIdentifier:](v7->_instrumentMetrics, "setClientBundleIdentifier:", v21);

    -[SFSSInstrumentMetrics setRequestCreatedTimestamp:](v7->_instrumentMetrics, "setRequestCreatedTimestamp:", mach_absolute_time());
  }

  return v7;
}

- (void)cancelTask
{
  id v2;

  v2 = -[SFSpeechSynthesisTask cancel](self, "cancel");
}

- (id)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (!-[SFSpeechSynthesisTask isSpeakRequest](self, "isSpeakRequest")
    || -[SFSpeechSynthesisTask speakState](self, "speakState") == 3
    || -[SFSpeechSynthesisTask speakState](self, "speakState") == 4)
  {
    if (-[SFSpeechSynthesisTask isSpeakRequest](self, "isSpeakRequest")
      || -[SFSpeechSynthesisTask synthesisState](self, "synthesisState") == 4
      || -[SFSpeechSynthesisTask synthesisState](self, "synthesisState") == 3)
    {
      v3 = (void *)MEMORY[0x24BDD1540];
      v21 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Speak/Synthesis task is in wrong state. speak state = %ld, synthesis state = %ld"), -[SFSpeechSynthesisTask speakState](self, "speakState"), -[SFSpeechSynthesisTask synthesisState](self, "synthesisState"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisTaskError"), 700, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    -[SFSpeechSynthesisTask setSynthesisState:](self, "setSynthesisState:", 4);
    v15 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Speak/Synthesis task is canceled. speak state = %ld, synthesis state = %ld"), -[SFSpeechSynthesisTask speakState](self, "speakState"), -[SFSpeechSynthesisTask synthesisState](self, "synthesisState"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisError"), 300, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask setErrorIfNotNull:](self, "setErrorIfNotNull:", v18);

    SFSSGetLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v20;
      _os_log_impl(&dword_21E284000, v19, OS_LOG_TYPE_INFO, "Cancel synthesis task, taskId=%@", buf, 0xCu);

    }
    -[SFSpeechSynthesisTask cancelTask](self, "cancelTask");
  }
  else
  {
    -[SFSpeechSynthesisTask setSpeakState:](self, "setSpeakState:", 3);
    if (-[SFSpeechSynthesisTask synthesisState](self, "synthesisState") != 3)
    {
      -[SFSpeechSynthesisTask setSynthesisState:](self, "setSynthesisState:", 4);
      v8 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Speak/Synthesis task is canceled. speak state = %ld, synthesis state = %ld"), -[SFSpeechSynthesisTask speakState](self, "speakState"), -[SFSpeechSynthesisTask synthesisState](self, "synthesisState"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisError"), 300, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSpeechSynthesisTask setErrorIfNotNull:](self, "setErrorIfNotNull:", v11);

    }
    SFSSGetLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v13;
      _os_log_impl(&dword_21E284000, v12, OS_LOG_TYPE_INFO, "Cancel speak task, taskId=%@", buf, 0xCu);

    }
    -[SFSpeechSynthesisTask cancelTask](self, "cancelTask");
    -[SFSpeechSynthesisTask playbackService](self, "playbackService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stop");

  }
  return 0;
}

- (id)pause
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[SFSpeechSynthesisTask speakState](self, "speakState") == 1)
  {
    -[SFSpeechSynthesisTask setSpeakState:](self, "setSpeakState:", 2);
    SFSSGetLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "Pause speak, taskId=%@", buf, 0xCu);

    }
    -[SFSpeechSynthesisTask playbackService](self, "playbackService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pause");
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Speak task is in wrong state. speak state = %ld"), -[SFSpeechSynthesisTask speakState](self, "speakState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisTaskError"), 700, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)resume
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (-[SFSpeechSynthesisTask speakState](self, "speakState") == 2)
  {
    -[SFSpeechSynthesisTask setSpeakState:](self, "setSpeakState:", 1);
    SFSSGetLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "Resume speak, taskId=%@", buf, 0xCu);

    }
    -[SFSpeechSynthesisTask playbackService](self, "playbackService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Speak task is in wrong state. speak state = %ld"), -[SFSpeechSynthesisTask speakState](self, "speakState"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("SFSpeechSynthesisTaskError"), 700, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)startSpeakIfValid
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[SFSpeechSynthesisTask speakState](self, "speakState") != 1
    && -[SFSpeechSynthesisTask speakState](self, "speakState") != 2
    && -[SFSpeechSynthesisTask speakState](self, "speakState") != 3)
  {
    SFSSGetLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "Start speaking, taskId=%@", (uint8_t *)&v9, 0xCu);

    }
    -[SFSpeechSynthesisTask playbackService](self, "playbackService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask setErrorIfNotNull:](self, "setErrorIfNotNull:", v6);

    -[SFSpeechSynthesisTask setSpeakState:](self, "setSpeakState:", 1);
    v7 = mach_absolute_time();
    -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpeakBeginTimestamp:", v7);

  }
}

- (void)start:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  -[SFSpeechSynthesisTask handleSynthesisInit](self, "handleSynthesisInit");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__SFSpeechSynthesisTask_start___block_invoke;
  v6[3] = &unk_24E246868;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SFSpeechSynthesisTask startTask:](self, "startTask:", v6);

}

- (void)initSpeak:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4
{
  SFSSAudioPlaybackService *v6;
  __int128 v7;
  SFSSAudioPlaybackService *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _BYTE v15[32];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = [SFSSAudioPlaybackService alloc];
  v7 = *(_OWORD *)&a4->mBytesPerPacket;
  *(_OWORD *)v15 = *(_OWORD *)&a4->mSampleRate;
  *(_OWORD *)&v15[16] = v7;
  v16 = *(_QWORD *)&a4->mBitsPerChannel;
  v8 = -[SFSSAudioPlaybackService initWithAudioSessionID:asbd:](v6, "initWithAudioSessionID:asbd:", 0, v15);
  -[SFSpeechSynthesisTask setPlaybackService:](self, "setPlaybackService:", v8);

  -[SFSpeechSynthesisTask playbackService](self, "playbackService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "outputRoute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAudioOutputRoute:", v10);

  SFSSGetLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask error](self, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v15 = 138412546;
    *(_QWORD *)&v15[4] = v13;
    *(_WORD *)&v15[12] = 2112;
    *(_QWORD *)&v15[14] = v14;
    _os_log_impl(&dword_21E284000, v12, OS_LOG_TYPE_INFO, "Init speak, taskId=%@, error=%@", v15, 0x16u);

  }
}

- (void)waitForSpeakFinish
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "Wait for speak finish, taskId=%@", (uint8_t *)&v9, 0xCu);

  }
  -[SFSpeechSynthesisTask playbackService](self, "playbackService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flushAndStop");

  -[SFSpeechSynthesisTask playbackService](self, "playbackService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "waitForAudioQueueStop");

  -[SFSpeechSynthesisTask setSpeakState:](self, "setSpeakState:", 4);
  SFSSGetLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_21E284000, v7, OS_LOG_TYPE_INFO, "Speak finished, taskId=%@", (uint8_t *)&v9, 0xCu);

  }
}

- (void)handleSynthesisInit
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint8_t v6[16];

  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "handleSynthesisInit", v6, 2u);
  }

  v4 = mach_absolute_time();
  -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSynthesisBeginTimestamp:", v4);

  -[SFSpeechSynthesisTask setSynthesisState:](self, "setSynthesisState:", 1);
}

- (void)handleSynthesisBegin:(unsigned int)a3 asbd:(AudioStreamBasicDescription *)a4 audioPlaybackBufferDuration:(double)a5 voiceAsset:(id)a6 resourceAsset:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  __int128 v14;
  NSObject *v15;
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
  char v28[40];
  _OWORD v29[2];
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v10 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  v13 = a6;
  -[SFSpeechSynthesisTask setAudioPlaybackBufferDuration:](self, "setAudioPlaybackBufferDuration:", a5);
  v14 = *(_OWORD *)&a4->mBytesPerPacket;
  v29[0] = *(_OWORD *)&a4->mSampleRate;
  v29[1] = v14;
  v30 = *(_QWORD *)&a4->mBitsPerChannel;
  -[SFSpeechSynthesisTask setAsbd:](self, "setAsbd:", v29);
  -[SFSpeechSynthesisTask setVoiceAsset:](self, "setVoiceAsset:", v13);

  -[SFSpeechSynthesisTask setResourceAsset:](self, "setResourceAsset:", v12);
  SFSSGetLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    -[SFSpeechSynthesisTask voiceAsset](self, "voiceAsset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "key");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask resourceAsset](self, "resourceAsset");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "key");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v17;
    v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_21E284000, v15, OS_LOG_TYPE_INFO, "handleSynthesisBegin: voiceKey=%@, resourceKey=%@", buf, 0x16u);

  }
  if (-[SFSpeechSynthesisTask isSpeakRequest](self, "isSpeakRequest"))
  {
    SFSSGetLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      -[SFSpeechSynthesisTask audioPlaybackBufferDuration](self, "audioPlaybackBufferDuration");
      *(_DWORD *)buf = 134217984;
      v32 = v21;
      _os_log_impl(&dword_21E284000, v20, OS_LOG_TYPE_INFO, "AudioPlaybackBufferDuration=%f", buf, 0xCu);
    }

    -[SFSpeechSynthesisTask asbd](self, "asbd");
    -[SFSpeechSynthesisTask initSpeak:asbd:](self, "initSpeak:asbd:", v10, v28);
  }
  -[SFSpeechSynthesisTask voiceAsset](self, "voiceAsset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "key");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setVoiceAssetKey:", v23);

  -[SFSpeechSynthesisTask resourceAsset](self, "resourceAsset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "key");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setResourceAssetKey:", v26);

}

- (void)handleSynthesisChunks:(id)a3
{
  id v4;
  void *v5;
  SFSSAudioData *v6;
  SFSSAudioData *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  _BYTE v20[40];

  v4 = a3;
  -[SFSpeechSynthesisTask bufferedAudios](self, "bufferedAudios");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  v6 = [SFSSAudioData alloc];
  -[SFSpeechSynthesisTask asbd](self, "asbd");
  v7 = -[SFSSAudioData initWithASBD:rawData:](v6, "initWithASBD:rawData:", v20, v4);

  -[SFSpeechSynthesisTask bufferedAudioData](self, "bufferedAudioData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

  -[SFSSAudioData duration](v7, "duration");
  v10 = v9;
  -[SFSpeechSynthesisTask bufferedDuration](self, "bufferedDuration");
  -[SFSpeechSynthesisTask setBufferedDuration:](self, "setBufferedDuration:", v10 + v11);
  if (-[SFSpeechSynthesisTask isSpeakRequest](self, "isSpeakRequest"))
  {
    -[SFSpeechSynthesisTask playbackService](self, "playbackService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSSAudioData audioData](v7, "audioData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SFSSAudioData packetCount](v7, "packetCount");
    -[SFSSAudioData packetDescriptions](v7, "packetDescriptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "enqueue:packetCount:packetDescriptions:", v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask setErrorIfNotNull:](self, "setErrorIfNotNull:", v16);

    -[SFSpeechSynthesisTask bufferedDuration](self, "bufferedDuration");
    v18 = v17;
    -[SFSpeechSynthesisTask audioPlaybackBufferDuration](self, "audioPlaybackBufferDuration");
    if (v18 >= v19)
    {
      -[SFSpeechSynthesisTask setSynthesisState:](self, "setSynthesisState:", 2);
      -[SFSpeechSynthesisTask startSpeakIfValid](self, "startSpeakIfValid");
    }
  }

}

- (void)handleSynthesisEnd:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  SFSSCacheItem *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  SFSSCacheItem *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SFSSCacheItem *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39[40];
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SFSSGetLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "handleSynthesisEnd", buf, 2u);
  }

  -[SFSpeechSynthesisTask setErrorIfNotNull:](self, "setErrorIfNotNull:", v4);
  v6 = mach_absolute_time();
  -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSynthesisEndTimestamp:", v6);

  -[SFSpeechSynthesisTask error](self, "error");
  v8 = (SFSSCacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
    v8 = (SFSSCacheItem *)objc_claimAutoreleasedReturnValue();
    if (-[SFSSCacheItem sourceOfTTS](v8, "sourceOfTTS") != 1)
    {
      +[SFSpeechSynthesisInternalSetting sharedInstance](SFSpeechSynthesisInternalSetting, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "disableCaching");

      if ((v10 & 1) != 0)
        goto LABEL_10;
      SFSSGetLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        -[SFSpeechSynthesisTask taskIdentifer](self, "taskIdentifer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v12;
        _os_log_impl(&dword_21E284000, v11, OS_LOG_TYPE_INFO, "Cache Audio for task: %@", buf, 0xCu);

      }
      v13 = [SFSSCacheItem alloc];
      -[SFSpeechSynthesisTask request](self, "request");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "text");
      v14 = objc_claimAutoreleasedReturnValue();
      -[SFSpeechSynthesisTask request](self, "request");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "voiceName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSpeechSynthesisTask voiceAsset](self, "voiceAsset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "key");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSpeechSynthesisTask resourceAsset](self, "resourceAsset");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "key");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSpeechSynthesisTask asbd](self, "asbd");
      -[SFSpeechSynthesisTask bufferedAudios](self, "bufferedAudios");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");
      v22 = v13;
      v23 = (void *)v14;
      v8 = -[SFSSCacheItem initWithText:voiceName:voiceKey:resourceKey:asbd:rawAudio:](v22, "initWithText:voiceName:voiceKey:resourceKey:asbd:rawAudio:", v14, v15, v17, v19, v39, v21);

      +[SFSSCachingService sharedInstance](SFSSCachingService, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSSCacheItem key](v8, "key");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setObject:forKey:", v8, v25);

    }
  }

LABEL_10:
  -[SFSpeechSynthesisTask setSynthesisState:](self, "setSynthesisState:", 3);
  if (-[SFSpeechSynthesisTask isSpeakRequest](self, "isSpeakRequest"))
  {
    -[SFSpeechSynthesisTask startSpeakIfValid](self, "startSpeakIfValid");
    -[SFSpeechSynthesisTask waitForSpeakFinish](self, "waitForSpeakFinish");
    v26 = mach_absolute_time();
    -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSpeakEndTimestamp:", v26);

  }
  -[SFSpeechSynthesisTask bufferedDuration](self, "bufferedDuration");
  v29 = v28;
  -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setAudioDuration:", v29);

  -[SFSpeechSynthesisTask error](self, "error");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "code");
  -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setErrorCode:", v32);

  SFSSGetLogObject();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "description");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v36;
    _os_log_impl(&dword_21E284000, v34, OS_LOG_TYPE_INFO, "InstrumentMetrics: %@", buf, 0xCu);

  }
  -[SFSpeechSynthesisTask handleSynthesisEndCallback](self, "handleSynthesisEndCallback");
}

- (void)handleSynthesisEndCallback
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  _BYTE v25[40];
  uint8_t buf[16];
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  SFSSGetLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E284000, v3, OS_LOG_TYPE_INFO, "handleSynthesisEndCallback", buf, 2u);
  }

  -[SFSpeechSynthesisTask delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    +[SFSSAudioConverter sharedInstance](SFSSAudioConverter, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask bufferedAudioData](self, "bufferedAudioData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask asbd](self, "asbd");
    v24 = 0;
    *(_OWORD *)buf = SFSSAudioFormat48khzPCM;
    v27 = unk_21E34D408;
    v28 = 16;
    objc_msgSend(v6, "convertChunks:srcAsbd:dstAsbd:outError:", v7, v25, buf, &v24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v24;

    if (v9)
    {
      SFSSGetLogObject();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_21E284000, v10, OS_LOG_TYPE_INFO, "Audio converter error: %@", buf, 0xCu);
      }

      -[SFSpeechSynthesisTask error](self, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        -[SFSpeechSynthesisTask setError:](self, "setError:", v9);
    }
    -[SFSpeechSynthesisTask delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)buf = SFSSAudioFormat48khzPCM;
    v27 = unk_21E34D408;
    v28 = 16;
    objc_msgSend(v12, "speechSynthesisTask:didFinishSysthesisAudio:audioData:", self, buf, v8);

  }
  -[SFSpeechSynthesisTask delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    -[SFSpeechSynthesisTask delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "voiceAssetKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask instrumentMetrics](self, "instrumentMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "resourceAssetKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "speechSynthesisTask:didFinishWithVoiceKey:resourceKey:", self, v17, v19);

  }
  -[SFSpeechSynthesisTask delegate](self, "delegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_respondsToSelector();

  if ((v21 & 1) != 0)
  {
    -[SFSpeechSynthesisTask delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSpeechSynthesisTask phonemeSequence](self, "phonemeSequence");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "speechSynthesisTask:didFinishWithPhoneme:", self, v23);

  }
}

- (void)handleSynthesisFrontendFeaturePhoneme:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SFSpeechSynthesisTask phonemeSequence](self, "phonemeSequence");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v4);

}

- (BOOL)isFinished
{
  if (-[SFSpeechSynthesisTask isSpeakRequest](self, "isSpeakRequest"))
    return -[SFSpeechSynthesisTask speakState](self, "speakState") == 4;
  else
    return -[SFSpeechSynthesisTask synthesisState](self, "synthesisState") == 3;
}

- (BOOL)isCancelled
{
  if (-[SFSpeechSynthesisTask isSpeakRequest](self, "isSpeakRequest"))
    return -[SFSpeechSynthesisTask speakState](self, "speakState") == 3;
  else
    return -[SFSpeechSynthesisTask synthesisState](self, "synthesisState") == 4;
}

- (BOOL)isSpeaking
{
  return -[SFSpeechSynthesisTask speakState](self, "speakState") == 1;
}

- (BOOL)isSpeakRequest
{
  void *v2;
  BOOL v3;

  -[SFSpeechSynthesisTask request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "type") == 0;

  return v3;
}

- (void)setErrorIfNotNull:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SFSpeechSynthesisTask error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[SFSpeechSynthesisTask setError:](self, "setError:", v4);
    SFSSGetLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[SFSpeechSynthesisTask error](self, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_debug_impl(&dword_21E284000, v6, OS_LOG_TYPE_DEBUG, "Set Error: %@", (uint8_t *)&v8, 0xCu);

    }
  }

}

- (void)setIsSpeaking:(BOOL)a3
{
  self->_isSpeaking = a3;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (void)setIsCancelled:(BOOL)a3
{
  self->_isCancelled = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSCondition)synthesisStateCondition
{
  return self->_synthesisStateCondition;
}

- (void)setSynthesisStateCondition:(id)a3
{
  objc_storeStrong((id *)&self->_synthesisStateCondition, a3);
}

- (double)audioPlaybackBufferDuration
{
  return self->_audioPlaybackBufferDuration;
}

- (void)setAudioPlaybackBufferDuration:(double)a3
{
  self->_audioPlaybackBufferDuration = a3;
}

- (AudioStreamBasicDescription)asbd
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].mSampleRate;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&self[3].mBytesPerFrame;
  *(_OWORD *)&retstr->mBytesPerPacket = v3;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&self[4].mBytesPerPacket;
  return self;
}

- (void)setAsbd:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->mSampleRate;
  v4 = *(_OWORD *)&a3->mBytesPerPacket;
  *(_QWORD *)&self->_asbd.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
  *(_OWORD *)&self->_asbd.mSampleRate = v3;
  *(_OWORD *)&self->_asbd.mBytesPerPacket = v4;
}

- (SFSpeechSynthesisRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (SFSSAudioPlaybackService)playbackService
{
  return self->_playbackService;
}

- (void)setPlaybackService:(id)a3
{
  objc_storeStrong((id *)&self->_playbackService, a3);
}

- (SFSSVoiceAsset)voiceAsset
{
  return self->_voiceAsset;
}

- (void)setVoiceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_voiceAsset, a3);
}

- (SFSSResourceAsset)resourceAsset
{
  return self->_resourceAsset;
}

- (void)setResourceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_resourceAsset, a3);
}

- (SFSSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setInstrumentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentMetrics, a3);
}

- (NSString)taskIdentifer
{
  return self->_taskIdentifer;
}

- (void)setTaskIdentifer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (double)bufferedDuration
{
  return self->_bufferedDuration;
}

- (void)setBufferedDuration:(double)a3
{
  self->_bufferedDuration = a3;
}

- (NSMutableArray)bufferedAudios
{
  return self->_bufferedAudios;
}

- (void)setBufferedAudios:(id)a3
{
  objc_storeStrong((id *)&self->_bufferedAudios, a3);
}

- (NSMutableArray)bufferedAudioData
{
  return self->_bufferedAudioData;
}

- (void)setBufferedAudioData:(id)a3
{
  objc_storeStrong((id *)&self->_bufferedAudioData, a3);
}

- (NSMutableArray)phonemeSequence
{
  return self->_phonemeSequence;
}

- (void)setPhonemeSequence:(id)a3
{
  objc_storeStrong((id *)&self->_phonemeSequence, a3);
}

- (int64_t)speakState
{
  return self->_speakState;
}

- (void)setSpeakState:(int64_t)a3
{
  self->_speakState = a3;
}

- (int64_t)synthesisState
{
  return self->_synthesisState;
}

- (void)setSynthesisState:(int64_t)a3
{
  self->_synthesisState = a3;
}

- (SFSpeechSynthesisTaskPrivateDelegate)delegate
{
  return (SFSpeechSynthesisTaskPrivateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_phonemeSequence, 0);
  objc_storeStrong((id *)&self->_bufferedAudioData, 0);
  objc_storeStrong((id *)&self->_bufferedAudios, 0);
  objc_storeStrong((id *)&self->_taskIdentifer, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_resourceAsset, 0);
  objc_storeStrong((id *)&self->_voiceAsset, 0);
  objc_storeStrong((id *)&self->_playbackService, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_synthesisStateCondition, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

void __31__SFSpeechSynthesisTask_start___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechSynthesisTask:didFinishWithError:", v6, v7);

  }
  v8 = *(_QWORD *)(a1 + 40);
  v9 = v10;
  if (v8)
  {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v10);
    v9 = v10;
  }

}

@end
