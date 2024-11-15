@implementation CSVTUIAudioSessionRecorder

- (CSVTUIAudioSessionRecorder)initWithDelegate:(id)a3
{
  id v4;
  CSVTUIAudioSessionRecorder *v5;
  CSVTUIAudioSessionRecorder *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  CSAudioPowerMeter *powerMeter;
  CSVTUIAudioSessionRecorder *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CSVTUIAudioSessionRecorder;
  v5 = -[CSVTUIAudioSessionRecorder init](&v17, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  objc_storeWeak((id *)&v5->_delegate, 0);
  objc_storeWeak((id *)&v6->_audioSessionRecorderDelegate, v4);
  v7 = dispatch_queue_create("com.apple.VoiceTriggerUI.RecordSessionQueue", 0);
  queue = v6->_queue;
  v6->_queue = (OS_dispatch_queue *)v7;

  objc_msgSend(MEMORY[0x24BE283C0], "contextForVoiceTriggerTraining");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:](v6, "_forceFetchAudioProvider:recordContext:", 0, v9);

  if (v6->_audioProvider)
  {
    v11 = objc_alloc(MEMORY[0x24BE283A8]);
    objc_msgSend(MEMORY[0x24BE283F0], "inputRecordingSampleRate");
    v12 = objc_msgSend(v11, "initWithSampleRate:");
    powerMeter = v6->_powerMeter;
    v6->_powerMeter = (CSAudioPowerMeter *)v12;

LABEL_4:
    v14 = v6;
    goto LABEL_8;
  }
  v15 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[CSVTUIAudioSessionRecorder initWithDelegate:]";
    _os_log_error_impl(&dword_2117D4000, v15, OS_LOG_TYPE_ERROR, "%s Creating audioRecorder has failed", buf, 0xCu);
  }
  v14 = 0;
LABEL_8:

  return v14;
}

- (CSVTUIAudioSessionRecorder)initWithAudioProvider:(id)a3 forceSupportsRemoteDarwinDisplay:(BOOL)a4
{
  id v7;
  CSVTUIAudioSessionRecorder *v8;
  CSVTUIAudioSessionRecorder *v9;

  v7 = a3;
  v8 = -[CSVTUIAudioSessionRecorder init](self, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_audioProvider, a3);
    v9->_forceSupportsRemoteDarwinDisplay = a4;
    -[CSVTUIAudioSessionRecorder _updateRemoteDarwinDisplayConnectedIfNeeded](v9, "_updateRemoteDarwinDisplayConnectedIfNeeded");
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)_forceFetchAudioProvider:(BOOL)a3 recordContext:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  char v9;
  NSObject *v10;
  id v11;
  id *p_audioProvider;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id *v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  void *v30;
  void *v31;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  id obj;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t v45[4];
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[24];
  uint64_t v52;
  _BYTE buf[24];
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__2176;
  v43 = __Block_byref_object_dispose__2177;
  v44 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioSessionRecorderDelegate);
  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)&self->_audioSessionRecorderDelegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = *MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
        _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Fetching audioProvider from SpeechManager, this should only apply to Exclave hardware", buf, 0xCu);
      }
      v11 = objc_loadWeakRetained((id *)&self->_audioSessionRecorderDelegate);
      v38[0] = MEMORY[0x24BDAC760];
      v38[1] = 3221225472;
      v38[2] = __69__CSVTUIAudioSessionRecorder__forceFetchAudioProvider_recordContext___block_invoke;
      v38[3] = &unk_24CC84E28;
      v38[4] = &v39;
      objc_msgSend(v11, "requestAudioProviderForTrainingWithSyncBlock:", v38);

      goto LABEL_24;
    }
  }
  p_audioProvider = (id *)&self->_audioProvider;
  if (self->_audioProvider && !a3)
  {
    v13 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 0;
      _os_log_impl(&dword_2117D4000, v13, OS_LOG_TYPE_DEFAULT, "%s audioProvider already exists and force == %d, return the current one.", buf, 0x12u);
    }
    goto LABEL_25;
  }
  v14 = (void *)MEMORY[0x212BE17E4]();
  v15 = *p_audioProvider;
  *p_audioProvider = 0;

  objc_autoreleasePoolPop(v14);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v54 = __Block_byref_object_copy__2176;
  v55 = __Block_byref_object_dispose__2177;
  v56 = 0;
  v16 = objc_alloc(MEMORY[0x24BE283C8]);
  v17 = *(_QWORD *)&buf[8];
  obj = *(id *)(*(_QWORD *)&buf[8] + 40);
  v18 = (void *)objc_msgSend(v16, "initWithQueue:error:", 0, &obj);
  objc_storeStrong((id *)(v17 + 40), obj);
  if (v18)
  {
    *(_QWORD *)v51 = 0;
    *(_QWORD *)&v51[8] = v51;
    *(_QWORD *)&v51[16] = 0x2020000000;
    v52 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __69__CSVTUIAudioSessionRecorder__forceFetchAudioProvider_recordContext___block_invoke_12;
    v32[3] = &unk_24CC84E50;
    v32[4] = v51;
    v32[5] = &v33;
    v32[6] = buf;
    objc_msgSend(v18, "setContext:completion:", v6, v32);
    v19 = (id *)MEMORY[0x24BE28368];
    v20 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(*(_QWORD *)&v51[8] + 24);
      *(_DWORD *)v45 = 136315650;
      v46 = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
      v47 = 2114;
      v48 = v6;
      v49 = 2048;
      v50 = v21;
      _os_log_impl(&dword_2117D4000, v20, OS_LOG_TYPE_DEFAULT, "%s For Context : %{public}@, audioStreamId(%llu) has allocated", v45, 0x20u);
    }
    if (*(_QWORD *)(*(_QWORD *)&v51[8] + 24))
    {
      v22 = objc_alloc(MEMORY[0x24BE283B8]);
      v23 = objc_msgSend(v22, "initWithAudioStreamHandleId:audioStreamType:audioRecordContext:audioRecorder:", *(_QWORD *)(*(_QWORD *)&v51[8] + 24), v34[3], v6, v18);
      v24 = (void *)v40[5];
      v40[5] = v23;

      objc_msgSend((id)v40[5], "start");
      objc_msgSend((id)v40[5], "setAudioProviderDelegate:", self);
      v25 = 0;
    }
    else
    {
      v27 = *v19;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v45 = 136315394;
        v46 = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
        v47 = 2112;
        v48 = v31;
        _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s Failed to get audio stream handle ID : %{publid}@", v45, 0x16u);

      }
      v25 = 1;
    }
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(v51, 8);
  }
  else
  {
    v26 = (id)*MEMORY[0x24BE28368];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "localizedDescription");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v51 = 136315394;
      *(_QWORD *)&v51[4] = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]";
      *(_WORD *)&v51[12] = 2114;
      *(_QWORD *)&v51[14] = v30;
      _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s Failed to create audio recorder : %{public}@", v51, 0x16u);

    }
    v25 = 1;
  }

  _Block_object_dispose(buf, 8);
  if (!v25)
  {
LABEL_24:
    objc_storeStrong((id *)&self->_audioProvider, (id)v40[5]);
    -[CSVTUIAudioSessionRecorder _updateRemoteDarwinDisplayConnectedIfNeeded](self, "_updateRemoteDarwinDisplayConnectedIfNeeded");
    p_audioProvider = (id *)(v40 + 5);
LABEL_25:
    v28 = *p_audioProvider;
    goto LABEL_26;
  }
  v28 = 0;
LABEL_26:
  _Block_object_dispose(&v39, 8);

  return v28;
}

- (BOOL)prepareRecord
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  CSAudioStream *audioStream;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  CSAudioStream *v24;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE283C0], "contextForVoiceTriggerTraining");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:](self, "_forceFetchAudioProvider:recordContext:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v29 = 0;
    v5 = objc_msgSend(v4, "activateAudioSessionWithReason:dynamicAttribute:bundleID:error:", 2, 0, 0, &v29);
    v6 = v29;
    if ((v5 & 1) != 0)
    {
      audioStream = self->_audioStream;
      if (!audioStream || !-[CSAudioStream isStreaming](audioStream, "isStreaming"))
      {
        objc_msgSend(MEMORY[0x24BE283C0], "contextForVoiceTriggerTraining");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE283E0], "defaultRequestWithContext:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setClientIdentity:", 7);
        objc_msgSend(v16, "setRequestRecordModeLock:", 1);
        if (objc_msgSend(MEMORY[0x24BE28488], "isExclaveHardware"))
          objc_msgSend(v16, "setRequestListeningMicIndicatorLock:", 1);
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v6;
        objc_msgSend(v4, "audioStreamWithRequest:streamName:error:", v16, v18, &v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v28;

        if (v19)
          v20 = v14 == 0;
        else
          v20 = 0;
        v9 = v20;
        v21 = *MEMORY[0x24BE28368];
        v22 = *MEMORY[0x24BE28368];
        if (v20)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
            _os_log_impl(&dword_2117D4000, v21, OS_LOG_TYPE_DEFAULT, "%s Successfully prepared record", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v26 = v21;
          objc_msgSend(v14, "localizedDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
          v32 = 2114;
          v33 = v27;
          _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s Failed to prepareAudioStreamRecord : %{public}@", buf, 0x16u);

        }
        objc_msgSend(v19, "setDelegate:", self);
        v24 = self->_audioStream;
        self->_audioStream = (CSAudioStream *)v19;

        goto LABEL_30;
      }
      v8 = *MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
        _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s AudioStream is already recording, do not prepare anymore", buf, 0xCu);
      }
      v9 = 1;
    }
    else
    {
      v11 = (void *)*MEMORY[0x24BE28368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        objc_msgSend(v6, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
        v32 = 2114;
        v33 = v13;
        _os_log_impl(&dword_2117D4000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to activate audio session, error : %{public}@", buf, 0x16u);

      }
      v9 = 0;
    }
    v14 = v6;
LABEL_30:

    goto LABEL_31;
  }
  v10 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[CSVTUIAudioSessionRecorder prepareRecord]";
    _os_log_error_impl(&dword_2117D4000, v10, OS_LOG_TYPE_ERROR, "%s Cannot prepare since audio provider does not exist", buf, 0xCu);
  }
  v9 = 0;
LABEL_31:

  return v9;
}

- (void)updateAudioRecorderForTrainingDevice:(unint64_t)a3 deviceUUIDs:(id)a4
{
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = CSIsOSX();
  if (a3 == 1 && v7)
  {
    v8 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315651;
      v16 = "-[CSVTUIAudioSessionRecorder updateAudioRecorderForTrainingDevice:deviceUUIDs:]";
      v17 = 2048;
      v18 = 1;
      v19 = 2113;
      v20 = v6;
      _os_log_impl(&dword_2117D4000, v8, OS_LOG_TYPE_DEFAULT, "%s Update to latest record context with device type: %zu, Remote device UUID list: %{private}@", (uint8_t *)&v15, 0x20u);
    }
    objc_msgSend(v6, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE28480], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceConnectedWithUUID:", v10);
    objc_msgSend(v11, "fetchRichDeviceUIDStringFromUUID:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE283C0]), "initWithRecordType:deviceId:", 4, v12);
    -[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:](self, "_forceFetchAudioProvider:recordContext:", 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLatestRecordContext:streamType:", v13, 3);

  }
}

- (BOOL)startRecording
{
  void *v3;
  CSAudioStream *audioStream;
  NSObject *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE283D0], "noAlertOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRequireSingleChannelLookup:", 1);
  objc_msgSend(v3, "setSelectedChannel:", 0);
  audioStream = self->_audioStream;
  if (audioStream)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__CSVTUIAudioSessionRecorder_startRecording__block_invoke;
    v7[3] = &unk_24CC84E78;
    v7[4] = self;
    -[CSAudioStream startAudioStreamWithOption:completion:](audioStream, "startAudioStreamWithOption:completion:", v3, v7);
  }
  else
  {
    v5 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v9 = "-[CSVTUIAudioSessionRecorder startRecording]";
      _os_log_error_impl(&dword_2117D4000, v5, OS_LOG_TYPE_ERROR, "%s Failed to startAudioStream since audioStream not existing", buf, 0xCu);
    }
  }

  return audioStream != 0;
}

- (void)stopRecording
{
  CSAudioStream *audioStream;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  audioStream = self->_audioStream;
  if (audioStream)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __43__CSVTUIAudioSessionRecorder_stopRecording__block_invoke;
    v5[3] = &unk_24CC84E78;
    v5[4] = self;
    -[CSAudioStream stopAudioStreamWithOption:completion:](audioStream, "stopAudioStreamWithOption:completion:", 0, v5);
  }
  else
  {
    v4 = *MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[CSVTUIAudioSessionRecorder stopRecording]";
      _os_log_error_impl(&dword_2117D4000, v4, OS_LOG_TYPE_ERROR, "%s failed to stopRecording since audioStream not existing", buf, 0xCu);
    }
  }
}

- (BOOL)isRecording
{
  return -[CSAudioStream isStreaming](self->_audioStream, "isStreaming");
}

- (void)releaseAudioSession
{
  CSAudioProvider *audioProvider;
  CSAudioStream *audioStream;

  -[CSAudioProvider deactivateAudioSession:error:](self->_audioProvider, "deactivateAudioSession:error:", 1, 0);
  -[CSAudioProvider setAudioProviderDelegate:](self->_audioProvider, "setAudioProviderDelegate:", 0);
  -[CSAudioStream setDelegate:](self->_audioStream, "setDelegate:", 0);
  audioProvider = self->_audioProvider;
  self->_audioProvider = 0;

  audioStream = self->_audioStream;
  self->_audioStream = 0;

}

- (float)averagePower
{
  double v2;

  -[CSAudioPowerMeter getAveragePowerDB](self->_powerMeter, "getAveragePowerDB");
  return v2;
}

- (BOOL)hasAudioRoute
{
  return 1;
}

- (BOOL)hasCorrectAudioRoute
{
  return -[CSVTUIAudioSessionRecorder _hasCorrectInputAudioRoute](self, "_hasCorrectInputAudioRoute")
      && -[CSVTUIAudioSessionRecorder _hasCorrectOutputAudioRoute](self, "_hasCorrectOutputAudioRoute");
}

- (BOOL)_hasCorrectInputAudioRoute
{
  BOOL v3;
  CSAudioProvider *audioProvider;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((CSIsOSX() & 1) != 0)
    return 1;
  audioProvider = self->_audioProvider;
  if (!audioProvider)
    return 0;
  -[CSAudioProvider recordRoute](audioProvider, "recordRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSVTUIAudioSessionRecorder _hasCorrectInputAudioRoute]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s audioInput:[%@]", (uint8_t *)&v8, 0x16u);
  }
  v3 = v5
    && ((objc_msgSend(v5, "isEqualToString:", CFSTR("Borealis Input")) & 1) != 0
     || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB16C8]) & 1) != 0
     || objc_msgSend(MEMORY[0x24BE28488], "isExclaveHardware")
     && (objc_msgSend(v5, "isEqualToString:", CFSTR("HACBuiltIn")) & 1) != 0);

  return v3;
}

- (BOOL)_hasCorrectInputAudioRouteFromHardwareConfiguration:(int64_t)a3
{
  NSObject *v4;
  BOOL result;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSVTUIAudioSessionRecorder _hasCorrectInputAudioRouteFromHardwareConfiguration:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s hardwareConfig: %ld", (uint8_t *)&v6, 0x16u);
  }
  result = CSIsOSX();
  if ((unint64_t)(a3 - 1) < 3)
    return 1;
  return result;
}

- (BOOL)_hasCorrectOutputAudioRoute
{
  int v3;
  CSAudioProvider *audioProvider;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if ((CSIsOSX() & 1) != 0)
    goto LABEL_2;
  audioProvider = self->_audioProvider;
  if (!audioProvider)
  {
LABEL_14:
    LOBYTE(v3) = 0;
    return v3;
  }
  -[CSAudioProvider playbackRoute](audioProvider, "playbackRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[CSVTUIAudioSessionRecorder _hasCorrectOutputAudioRoute]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_2117D4000, v6, OS_LOG_TYPE_DEFAULT, "%s audioOutput:[%@]", (uint8_t *)&v8, 0x16u);
  }
  if (!v5)
  {
    if ((objc_msgSend(MEMORY[0x24BE28488], "isExclaveHardware") & 1) != 0)
    {
LABEL_2:
      LOBYTE(v3) = 1;
      return v3;
    }
    goto LABEL_14;
  }
  if (self->_isRemoteDarwinDisplayConnected && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB16F0]) & 1) != 0)
  {
    LOBYTE(v3) = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB1708]) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB16F0]) & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB16E8]) ^ 1;
  }

  return v3;
}

- (int64_t)convertStopReason:(int64_t)a3
{
  int64_t result;

  result = a3;
  switch(a3)
  {
    case -11789:
    case -11788:
    case -11787:
    case -11786:
      return result;
    default:
      if (a3)
        result = -11785;
      break;
  }
  return result;
}

- (unint64_t)audioSource
{
  unint64_t v3;
  CSAudioProvider *audioProvider;
  void *v5;
  void *v6;

  if ((CSIsOSX() & 1) != 0)
    return 0;
  audioProvider = self->_audioProvider;
  if (!audioProvider)
    return 6;
  -[CSAudioProvider playbackRoute](audioProvider, "playbackRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 6;
  v6 = v5;
  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB1708]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB16F0]) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB1718]) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB16B0]) & 1) != 0
         || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB16B8]) & 1) != 0
         || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB16C0]) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB16A8]) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB16E8]) & 1) != 0)
  {
    v3 = 4;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB16E0]))
  {
    v3 = 5;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_handleDidStopWithReason:(int64_t)a3
{
  CSVTUIAudioSessionDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;

  -[CSAudioPowerMeter reset](self->_powerMeter, "reset");
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "audioSessionDidStopRecording:", a3);

    }
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  CSAudioPowerMeter *powerMeter;
  uint64_t v10;
  CSVTUIAudioSessionDelegate **p_delegate;
  id WeakRetained;
  void *v13;
  id v14;
  char v15;
  id v16;
  id v17;

  v5 = a4;
  v6 = objc_msgSend(v5, "numSamples");
  objc_msgSend(v5, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = CSIsOSX();
  powerMeter = self->_powerMeter;
  v17 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v17, "bytes");
  if (v8)
    -[CSAudioPowerMeter processFloatBuffer:stride:inFrameToProcess:](powerMeter, "processFloatBuffer:stride:inFrameToProcess:", v10, 1, v6);
  else
    -[CSAudioPowerMeter processShortBuffer:stride:inFrameToProcess:](powerMeter, "processShortBuffer:stride:inFrameToProcess:", v10, 1, v6);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v14 = objc_loadWeakRetained((id *)p_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v16, "audioSessionRecordBufferAvailable:", v17);

    }
  }

}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  CSVTUIAudioSessionDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;

  -[CSVTUIAudioSessionRecorder _handleDidStopWithReason:](self, "_handleDidStopWithReason:", -[CSVTUIAudioSessionRecorder convertStopReason:](self, "convertStopReason:", a4));
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "audioSessionErrorDidOccur:", 0);

    }
  }
}

- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4
{
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  NSObject *queue;
  _QWORD block[5];

  if (!-[CSVTUIAudioSessionRecorder _hasCorrectInputAudioRouteFromHardwareConfiguration:](self, "_hasCorrectInputAudioRouteFromHardwareConfiguration:", a4))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      v6 = WeakRetained;
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v9 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v9, "audioSessionUnsupportedAudioRoute");

      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__CSVTUIAudioSessionRecorder_audioStreamProvider_didHardwareConfigurationChange___block_invoke;
  block[3] = &unk_24CC864B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_updateRemoteDarwinDisplayConnectedIfNeeded
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if ((CSIsIPad() & 1) != 0 || self->_forceSupportsRemoteDarwinDisplay)
  {
    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pickableRoutesForCategory:andMode:", CFSTR("PlayAndRecord"), CFSTR("SpeechRecognition"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      v21 = "-[CSVTUIAudioSessionRecorder _updateRemoteDarwinDisplayConnectedIfNeeded]";
      v22 = 2113;
      v23 = v4;
      _os_log_impl(&dword_2117D4000, v5, OS_LOG_TYPE_DEFAULT, "%s Available audio routes %{private}@", buf, 0x16u);
    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      v9 = (_QWORD *)MEMORY[0x24BE647C8];
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BE28488], "audioPortSubtypeAsString:", 1781740087, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", *v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v12 && objc_msgSend(v13, "isEqualToString:", v12))
          {

            LOBYTE(v7) = 1;
            goto LABEL_16;
          }

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_16:

    self->_isRemoteDarwinDisplayConnected = v7;
  }
}

- (CSVTUIAudioSessionDelegate)delegate
{
  return (CSVTUIAudioSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CSAudioPowerMeter)powerMeter
{
  return self->_powerMeter;
}

- (void)setPowerMeter:(id)a3
{
  objc_storeStrong((id *)&self->_powerMeter, a3);
}

- (unint64_t)audioStreamHandleId
{
  return self->_audioStreamHandleId;
}

- (void)setAudioStreamHandleId:(unint64_t)a3
{
  self->_audioStreamHandleId = a3;
}

- (CSVTUIAudioSessionRecorderDelegate)audioSessionRecorderDelegate
{
  return (CSVTUIAudioSessionRecorderDelegate *)objc_loadWeakRetained((id *)&self->_audioSessionRecorderDelegate);
}

- (void)setAudioSessionRecorderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_audioSessionRecorderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioSessionRecorderDelegate);
  objc_storeStrong((id *)&self->_powerMeter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
}

uint64_t __81__CSVTUIAudioSessionRecorder_audioStreamProvider_didHardwareConfigurationChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateRemoteDarwinDisplayConnectedIfNeeded");
}

void __43__CSVTUIAudioSessionRecorder_stopRecording__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_handleDidStopWithReason:", 0);
  if ((a2 & 1) == 0)
  {
    v6 = (void *)*MEMORY[0x24BE28368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      objc_msgSend(v5, "localizedDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[CSVTUIAudioSessionRecorder stopRecording]_block_invoke";
      v11 = 2114;
      v12 = v8;
      _os_log_error_impl(&dword_2117D4000, v7, OS_LOG_TYPE_ERROR, "%s failed to stopRecording : %{public}@", (uint8_t *)&v9, 0x16u);

    }
  }

}

void __44__CSVTUIAudioSessionRecorder_startRecording__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
      objc_msgSend(v9, "audioSessionDidStartRecording:error:", a2, v10);

    }
  }

}

void __69__CSVTUIAudioSessionRecorder__forceFetchAudioProvider_recordContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE28368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE28368], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSVTUIAudioSessionRecorder _forceFetchAudioProvider:recordContext:]_block_invoke";
    _os_log_impl(&dword_2117D4000, v4, OS_LOG_TYPE_DEFAULT, "%s Fetched audioProvider!!", (uint8_t *)&v7, 0xCu);
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __69__CSVTUIAudioSessionRecorder__forceFetchAudioProvider_recordContext___block_invoke_12(_QWORD *a1, uint64_t a2, uint64_t a3, id obj)
{
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
}

@end
