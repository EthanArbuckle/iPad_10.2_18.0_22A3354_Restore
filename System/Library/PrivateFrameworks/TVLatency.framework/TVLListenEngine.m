@implementation TVLListenEngine

+ (TVLListenEngine)engineWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  TVLListenEngine *result;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__TVLListenEngine_engineWithCompletion___block_invoke;
  v8[3] = &unk_24E3E9D00;
  v9 = v4;
  v10 = a1;
  v6 = v4;
  objc_msgSend(v5, "requestRecordPermission:", v8);

  return result;
}

void __40__TVLListenEngine_engineWithCompletion___block_invoke(uint64_t a1, char a2)
{
  id v3;
  TVLListenEngine *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = *(id *)(a1 + 40);
    objc_sync_enter(v3);
    if (!_listenEngineInst)
    {
      v4 = objc_alloc_init(TVLListenEngine);
      v5 = (void *)_listenEngineInst;
      _listenEngineInst = (uint64_t)v4;

      objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "inputLatency");
      _inputLatency = v7;

      if (_TVLLogDefault_onceToken_6 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
      v8 = _TVLLogDefault_log_6;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = _inputLatency;
        _os_log_impl(&dword_21F2AB000, v8, OS_LOG_TYPE_DEFAULT, "Input Latency: %f", (uint8_t *)&v9, 0xCu);
      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    objc_sync_exit(v3);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }
}

- (TVLListenEngine)init
{
  TVLListenEngine *v2;
  TVLListenEngine *v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  _BOOL4 v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *analysisQueue;
  void *v11;
  TVLListenEngine *v12;
  id v14;
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TVLListenEngine;
  v2 = -[TVLListenEngine init](&v16, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_5;
  v15 = 0;
  v4 = -[TVLListenEngine _setupAndStartAudioSessionWithError:](v2, "_setupAndStartAudioSessionWithError:", &v15);
  v5 = v15;
  v6 = v5;
  if (v4)
  {
    v14 = v5;
    v7 = -[TVLListenEngine _setupAndStartAudioEngineGraphWithTimeout:error:](v3, "_setupAndStartAudioEngineGraphWithTimeout:error:", &v14, 2.0);
    v8 = v14;

    if (v7)
    {
      v9 = dispatch_queue_create("com.apple.tvlatency.soundanalysis", 0);
      analysisQueue = v3->_analysisQueue;
      v3->_analysisQueue = (OS_dispatch_queue *)v9;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObserver:selector:name:object:", v3, sel__handleIterruption_, *MEMORY[0x24BDB15D8], 0);

LABEL_5:
      v12 = v3;
      goto LABEL_12;
    }
    v6 = v8;
  }
  if (_TVLLogDefault_onceToken_6 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR))
    -[TVLListenEngine init].cold.1();

  v12 = 0;
LABEL_12:

  return v12;
}

+ (void)invalidate
{
  void *v2;
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  objc_msgSend((id)_listenEngineInst, "invalidate");
  v2 = (void *)_listenEngineInst;
  _listenEngineInst = 0;

  objc_sync_exit(obj);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  id v5;

  -[TVLListenEngine mixer](self, "mixer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeTapOnBus:", 0);

  -[TVLListenEngine audioEngine](self, "audioEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  -[TVLListenEngine setPlayer:](self, "setPlayer:", 0);
  -[TVLListenEngine setMixer:](self, "setMixer:", 0);
  -[TVLListenEngine setMicrophone:](self, "setMicrophone:", 0);
  -[TVLListenEngine setAudioEngine:](self, "setAudioEngine:", 0);
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:error:", 0, 0);

}

- (void)_handleIterruption:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDB15F0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (!v6)
  {
    if (_TVLLogDefault_onceToken_6 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
    v7 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21F2AB000, v7, OS_LOG_TYPE_DEFAULT, "Interruption Ended, Reactivating AVAudioSession...", v8, 2u);
    }
    -[TVLListenEngine _setupAndStartAudioSessionWithError:](self, "_setupAndStartAudioSessionWithError:", 0);
  }
}

- (BOOL)_setupAndStartAudioSessionWithError:(id *)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[5];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  __int128 buf;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "setCategory:mode:options:error:", *MEMORY[0x24BDB15A0], *MEMORY[0x24BDB1620], 2, a3);

  if (v5
    && (objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "setPreferredIOBufferDuration:error:", a3, 0.005),
        v6,
        v7))
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "setActive:error:", 1, a3);

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowAllBuiltInDataSources:", 1);

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__0;
  v30 = __Block_byref_object_dispose__0;
  v31 = 0;
  objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "availableInputs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke;
  v25[3] = &unk_24E3E9D28;
  v25[4] = &v26;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v25);

  v14 = (void *)v27[5];
  if (v14)
  {
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v15, "setPreferredInput:error:", v27[5], a3);

      v14 = (void *)v27[5];
    }
    objc_msgSend(v14, "dataSources");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (_TVLLogDefault_onceToken_6 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
    v19 = (id)_TVLLogDefault_log_6;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_impl(&dword_21F2AB000, v19, OS_LOG_TYPE_DEFAULT, "Selected Built-In Mic: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    if (v18)
    {
      if (v9)
        LOBYTE(v9) = objc_msgSend((id)v27[5], "setPreferredDataSource:error:", v18, a3);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__0;
      v35 = __Block_byref_object_dispose__0;
      v36 = 0;
      objc_msgSend(v18, "supportedPolarPatterns");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v13;
      v24[1] = 3221225472;
      v24[2] = __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke_8;
      v24[3] = &unk_24E3E9D90;
      v24[4] = &buf;
      objc_msgSend(v21, "enumerateObjectsUsingBlock:", v24);

      v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      if (v22)
        objc_msgSend(v18, "setPreferredPolarPattern:error:", v22, a3);
      _Block_object_dispose(&buf, 8);

    }
  }
  _Block_object_dispose(&v26, 8);

  return v9;
}

void __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "portType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB16C8]);

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "orientation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orientation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = PriorityOfAVAudioSessionOrientation(v5);
  v8 = PriorityOfAVAudioSessionOrientation(v6);
  if (v7 >= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 > v8)
    v10 = 1;
  else
    v10 = v9;

  return v10;
}

void __55__TVLListenEngine__setupAndStartAudioSessionWithError___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB1698]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)_setupAndStartAudioEngineGraphWithTimeout:(double)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  _QWORD v47[5];
  NSObject *v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t buf[16];
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__0;
  v54 = __Block_byref_object_dispose__0;
  v55 = 0;
  v8 = (void *)MEMORY[0x24BDB1888];
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __67__TVLListenEngine__setupAndStartAudioEngineGraphWithTimeout_error___block_invoke;
  v47[3] = &unk_24E3E9DB8;
  v47[4] = self;
  v49 = &v50;
  v9 = v7;
  v48 = v9;
  *(_OWORD *)buf = *(_OWORD *)"xmuaxmcmlppa";
  v57 = 0;
  objc_msgSend(v8, "instantiateWithComponentDescription:options:completionHandler:", buf, 0, v47);
  v10 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_group_wait(v9, v10);
  *a4 = objc_retainAutorelease((id)v51[5]);
  -[TVLListenEngine mixer](self, "mixer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDB1800]);
    -[TVLListenEngine setAudioEngine:](self, "setAudioEngine:", v12);

    -[TVLListenEngine audioEngine](self, "audioEngine");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "inputNode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLListenEngine setMicrophone:](self, "setMicrophone:", v14);

    -[TVLListenEngine microphone](self, "microphone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputFormatForBus:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sampleRate");
    if (v17 <= 0.0)
    {

    }
    else
    {
      -[TVLListenEngine microphone](self, "microphone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "inputFormatForBus:", 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "channelCount") == 0;

      if (!v20)
      {
        v21 = objc_alloc_init(MEMORY[0x24BDB1850]);
        -[TVLListenEngine setPlayer:](self, "setPlayer:", v21);

        -[TVLListenEngine audioEngine](self, "audioEngine");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine player](self, "player");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "attachNode:", v23);

        -[TVLListenEngine audioEngine](self, "audioEngine");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine mixer](self, "mixer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "attachNode:", v25);

        v26 = objc_alloc(MEMORY[0x24BDB1818]);
        objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "sampleRate");
        v28 = objc_msgSend(v26, "initStandardFormatWithSampleRate:channels:", 2);

        -[TVLListenEngine audioEngine](self, "audioEngine");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine microphone](self, "microphone");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine mixer](self, "mixer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "connect:to:fromBus:toBus:format:", v30, v31, 0, 1, v28);

        -[TVLListenEngine audioEngine](self, "audioEngine");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine player](self, "player");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine mixer](self, "mixer");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "connect:to:fromBus:toBus:format:", v33, v34, 0, 0, v28);

        -[TVLListenEngine audioEngine](self, "audioEngine");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine mixer](self, "mixer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine audioEngine](self, "audioEngine");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "mainMixerNode");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "connect:to:format:", v36, v38, v28);

        -[TVLListenEngine audioEngine](self, "audioEngine");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "mainMixerNode");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v41) = 0;
        objc_msgSend(v40, "setOutputVolume:", v41);

        -[TVLListenEngine _splitMicrophoneAndReferenceToneChannels](self, "_splitMicrophoneAndReferenceToneChannels");
        -[TVLListenEngine audioEngine](self, "audioEngine");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "startAndReturnError:", a4);

LABEL_12:
        goto LABEL_13;
      }
    }
    if (_TVLLogDefault_onceToken_6 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
    v28 = (id)_TVLLogDefault_log_6;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      -[TVLListenEngine microphone](self, "microphone");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "inputFormatForBus:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLListenEngine _setupAndStartAudioEngineGraphWithTimeout:error:].cold.1(v45, buf, v28, v44);
    }
    v43 = 0;
    goto LABEL_12;
  }
  v43 = 0;
LABEL_13:

  _Block_object_dispose(&v50, 8);
  return v43;
}

void __67__TVLListenEngine__setupAndStartAudioEngineGraphWithTimeout_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setMixer:", a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)_splitMicrophoneAndReferenceToneChannels
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  OpaqueAudioComponentInstance *v7;
  const void *v8;
  UInt32 v9;
  void *v10;
  void *v11;
  int v12;
  OpaqueAudioComponentInstance *v13;
  const void *v14;
  UInt32 v15;
  id v16;

  -[TVLListenEngine mixer](self, "mixer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "inputFormatForBus:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "channelCount");

  switch(v5)
  {
    case 3:
      -[TVLListenEngine mixer](self, "mixer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (OpaqueAudioComponentInstance *)objc_msgSend(v6, "audioUnit");
      v8 = &SURROUND_TO_STEREO_LEFT;
      v9 = 24;
      break;
    case 2:
      -[TVLListenEngine mixer](self, "mixer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (OpaqueAudioComponentInstance *)objc_msgSend(v6, "audioUnit");
      v8 = &STEREO_TO_STEREO_LEFT;
      v9 = 16;
      break;
    case 1:
      -[TVLListenEngine mixer](self, "mixer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (OpaqueAudioComponentInstance *)objc_msgSend(v6, "audioUnit");
      v8 = &MONO_TO_STEREO_LEFT;
      v9 = 8;
      break;
    default:
      goto LABEL_8;
  }
  AudioUnitSetProperty(v7, 0xBBEu, 1u, 0, v8, v9);

LABEL_8:
  -[TVLListenEngine mixer](self, "mixer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputFormatForBus:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "channelCount");

  switch(v12)
  {
    case 3:
      -[TVLListenEngine mixer](self, "mixer");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (OpaqueAudioComponentInstance *)objc_msgSend(v16, "audioUnit");
      v14 = &SURROUND_TO_STEREO_RIGHT;
      v15 = 24;
      break;
    case 2:
      -[TVLListenEngine mixer](self, "mixer");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (OpaqueAudioComponentInstance *)objc_msgSend(v16, "audioUnit");
      v14 = &STEREO_TO_STEREO_RIGHT;
      v15 = 16;
      break;
    case 1:
      -[TVLListenEngine mixer](self, "mixer");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (OpaqueAudioComponentInstance *)objc_msgSend(v16, "audioUnit");
      v14 = &MONO_TO_STEREO_RIGHT;
      v15 = 8;
      break;
    default:
      return;
  }
  AudioUnitSetProperty(v13, 0xBBEu, 1u, 1u, v14, v15);

}

- (BOOL)startListeningWithReferenceTone:(id)a3 at:(unint64_t)a4 saveToFile:(id)a5 withCallback:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  double v26;
  double v27;
  NSObject *v28;
  double v29;
  double v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  BOOL v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  dispatch_time_t v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  dispatch_time_t v58;
  id v59;
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD v63[4];
  id v64;
  id location;
  id v66;
  id v67;
  id v68;
  uint8_t buf[4];
  double v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v60 = a3;
  v59 = a5;
  v12 = a6;
  v13 = a7;
  -[TVLListenEngine audioEngine](self, "audioEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  v15 = objc_msgSend(v14, "startAndReturnError:", &v68);
  v16 = v68;

  if ((v15 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "IOBufferDuration");
    v19 = v18;

    if (_TVLLogDefault_onceToken_6 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
    v20 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v70 = v19;
      _os_log_impl(&dword_21F2AB000, v20, OS_LOG_TYPE_DEFAULT, "IOBufferDuration: %f", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "inputSafetyOffset");
    v23 = v22;

    if (_TVLLogDefault_onceToken_6 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
    v24 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v70 = v23;
      _os_log_impl(&dword_21F2AB000, v24, OS_LOG_TYPE_DEFAULT, "Input Safety Offset: %f", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDB1858], "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "outputSafetyOffset");
    v27 = v26;

    if (_TVLLogDefault_onceToken_6 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
    v28 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v70 = v27;
      _os_log_impl(&dword_21F2AB000, v28, OS_LOG_TYPE_DEFAULT, "Output Safety Offset: %f", buf, 0xCu);
    }
    v29 = v23 + v19 * 2.0;
    if (_TVLLogDefault_onceToken_6 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
    v30 = v29 + v27;
    v31 = _TVLLogDefault_log_6;
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v70 = v30;
      _os_log_impl(&dword_21F2AB000, v31, OS_LOG_TYPE_DEFAULT, "Adjusted Offset: %f", buf, 0xCu);
    }
    v58 = dispatch_time(a4, (uint64_t)(v30 * 1000000000.0));
    -[TVLListenEngine setCallback:](self, "setCallback:", v12);
    -[TVLListenEngine setCompletion:](self, "setCompletion:", v13);
    v32 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[TVLListenEngine setConfidentResults:](self, "setConfidentResults:", v32);

    -[TVLListenEngine setConvergenceLossCount:](self, "setConvergenceLossCount:", 0);
    -[TVLListenEngine setFirstObservationDate:](self, "setFirstObservationDate:", 0);
    -[TVLListenEngine setTimeToConverge:](self, "setTimeToConverge:", INFINITY);
    -[TVLListenEngine setLastObservationWasConfident:](self, "setLastObservationWasConfident:", 0);
    v33 = objc_alloc(MEMORY[0x24BDE9AD8]);
    -[TVLListenEngine mixer](self, "mixer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "outputFormatForBus:", 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v33, "initWithFormat:", v35);
    -[TVLListenEngine setStreamAnalyzer:](self, "setStreamAnalyzer:", v36);

    v37 = objc_alloc_init(MEMORY[0x24BDE9B30]);
    -[TVLListenEngine setEstimateAudioOffsetRequest:](self, "setEstimateAudioOffsetRequest:", v37);

    -[TVLListenEngine streamAnalyzer](self, "streamAnalyzer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVLListenEngine estimateAudioOffsetRequest](self, "estimateAudioOffsetRequest");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v16;
    objc_msgSend(v38, "addRequest:withObserver:error:", v39, self, &v67);
    v40 = v67;

    if (v40)
    {
      if (_TVLLogDefault_onceToken_6 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR))
        -[TVLListenEngine startListeningWithReferenceTone:at:saveToFile:withCallback:completion:].cold.3();
      v41 = 0;
      v16 = v40;
    }
    else
    {
      if (v59)
      {
        v42 = objc_alloc(MEMORY[0x24BDB1810]);
        -[TVLListenEngine mixer](self, "mixer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "outputFormatForBus:", 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "settings");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = 0;
        v46 = (void *)objc_msgSend(v42, "initForWriting:settings:error:", v59, v45, &v66);
        v16 = v66;
        -[TVLListenEngine setFile:](self, "setFile:", v46);

        if (v16)
        {
          if (_TVLLogDefault_onceToken_6 != -1)
            dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
          if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR))
            -[TVLListenEngine startListeningWithReferenceTone:at:saveToFile:withCallback:completion:].cold.2();
        }
      }
      else
      {
        v16 = 0;
      }
      -[TVLListenEngine mixer](self, "mixer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "removeTapOnBus:", 0);

      objc_initWeak(&location, self);
      -[TVLListenEngine mixer](self, "mixer");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke;
      v63[3] = &unk_24E3E9E08;
      objc_copyWeak(&v64, &location);
      objc_msgSend(v48, "installTapOnBus:bufferSize:format:block:", 0, 64, 0, v63);

      self->_didMissDeadline = 0;
      v49 = dispatch_time(0, 0);
      if (_TVLLogDefault_onceToken_6 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
      v50 = _TVLLogDefault_log_6;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v70 = *(double *)&v49;
        _os_log_impl(&dword_21F2AB000, v50, OS_LOG_TYPE_DEFAULT, "NOW: %llu", buf, 0xCu);
      }
      if (_TVLLogDefault_onceToken_6 != -1)
        dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
      v51 = _TVLLogDefault_log_6;
      if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v70 = *(double *)&v58;
        _os_log_impl(&dword_21F2AB000, v51, OS_LOG_TYPE_DEFAULT, "SCHEDULED TIME: %llu", buf, 0xCu);
      }
      if (v49 >= v58)
      {
        if (_TVLLogDefault_onceToken_6 != -1)
          dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
        v52 = _TVLLogDefault_log_6;
        if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR))
          -[TVLListenEngine startListeningWithReferenceTone:at:saveToFile:withCallback:completion:].cold.1(v52);
        self->_didMissDeadline = 1;
      }
      -[TVLListenEngine player](self, "player");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDB1880], "timeWithHostTime:", v58);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke_22;
      v61[3] = &unk_24E3E9E30;
      objc_copyWeak(&v62, &location);
      objc_msgSend(v53, "scheduleFile:atTime:completionCallbackType:completionHandler:", v60, v54, 2, v61);

      -[TVLListenEngine player](self, "player");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "prepareWithFrameCount:", objc_msgSend(v60, "length"));

      -[TVLListenEngine player](self, "player");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "play");

      objc_destroyWeak(&v62);
      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);
      v41 = 1;
    }
  }
  else
  {
    if (_TVLLogDefault_onceToken_6 != -1)
      dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
    if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR))
      -[TVLListenEngine startListeningWithReferenceTone:at:saveToFile:withCallback:completion:].cold.4();
    (*((void (**)(id, _QWORD, _QWORD, double))v13 + 2))(v13, 0, 0, 0.0);
    v41 = 0;
  }

  return v41;
}

void __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "analysisQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke_2;
    block[3] = &unk_24E3E9DE0;
    block[4] = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

void __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "file");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "file");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "writeFromBuffer:error:", *(_QWORD *)(a1 + 40), 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "streamAnalyzer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "analyzeAudioBuffer:atAudioFramePosition:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "sampleTime"));

}

void __89__TVLListenEngine_startListeningWithReferenceTone_at_saveToFile_withCallback_completion___block_invoke_22(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "mixer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeTapOnBus:", 0);

    objc_msgSend(v8, "player");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pause");

    objc_msgSend(v8, "audioEngine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pause");

    objc_msgSend(v8, "streamAnalyzer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "estimateAudioOffsetRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeRequest:", v6);

    objc_msgSend(v8, "setEstimateAudioOffsetRequest:", 0);
    objc_msgSend(v8, "streamAnalyzer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completeAnalysis");

    objc_msgSend(v8, "completeAnalysis");
    objc_msgSend(v8, "setConfidentResults:", 0);
    WeakRetained = v8;
  }

}

- (void)completeAnalysis
{
  void *v3;
  _BOOL4 didMissDeadline;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, double);
  _QWORD v23[4];
  _QWORD v24[5];

  v24[4] = *MEMORY[0x24BDAC8D0];
  -[TVLListenEngine confidentResults](self, "confidentResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {

    goto LABEL_5;
  }
  didMissDeadline = self->_didMissDeadline;

  if (didMissDeadline)
  {
LABEL_5:
    v21 = 0;
    v20 = 0;
    v8 = 0.0;
    goto LABEL_6;
  }
  -[TVLListenEngine confidentResults](self, "confidentResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVLListenEngine medianOfSortedArray:](self, "medianOfSortedArray:", v6);
  v8 = v7;
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  objc_msgSend(v6, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  v23[0] = CFSTR("LATENCY_LOW");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v15;
  v23[1] = CFSTR("LATENCY_HIGH");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v16;
  v23[2] = CFSTR("CONVERGENCE_TIME");
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[TVLListenEngine timeToConverge](self, "timeToConverge");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v18;
  v23[3] = CFSTR("CONVERGENCE_LOSS_COUNT");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[TVLListenEngine convergenceLossCount](self, "convergenceLossCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 1;
LABEL_6:
  -[TVLListenEngine completion](self, "completion");
  v22 = (void (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, uint64_t, void *, double))v22)[2](v22, v21, v20, v8);

}

- (double)medianOfSortedArray:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  double v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    if (v4 == 1)
    {
      objc_msgSend(v3, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v15 = v6;
      objc_msgSend(v6, "doubleValue");
      v7 = v16;

      goto LABEL_9;
    }
    v8 = (unint64_t)(v4 - 1) >> 1;
    if ((v4 & 1) != 0)
    {
      objc_msgSend(v3, "objectAtIndex:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    objc_msgSend(v3, "objectAtIndex:", (unint64_t)(double)v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    objc_msgSend(v3, "objectAtIndex:", v5 >> 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    v7 = (v11 + v14) * 0.5;
  }
  else
  {
    v7 = 0.0;
  }
LABEL_9:

  return v7;
}

- (void)request:(id)a3 didProduceResult:(id)a4
{
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  void (**v12)(_QWORD, double, float);
  double v13;
  float v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v22;
  if ((isKindOfClass & 1) != 0)
  {
    -[TVLListenEngine firstObservationDate](self, "firstObservationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVLListenEngine setFirstObservationDate:](self, "setFirstObservationDate:", v8);

    }
    v9 = v22;
    objc_msgSend(v9, "offset");
    v11 = v10 / 1000.0 - *(double *)&_inputLatency;
    -[TVLListenEngine callback](self, "callback");
    v12 = (void (**)(_QWORD, double, float))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "confidence");
    v14 = v13;
    v12[2](v12, v11, v14);

    objc_msgSend(v9, "confidence");
    v16 = v15;
    if (v15 == 1.0)
    {
      -[TVLListenEngine confidentResults](self, "confidentResults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v18);

      -[TVLListenEngine timeToConverge](self, "timeToConverge");
      if (v19 >= INFINITY)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[TVLListenEngine firstObservationDate](self, "firstObservationDate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v21);
        -[TVLListenEngine setTimeToConverge:](self, "setTimeToConverge:");

      }
    }
    else
    {
      if (!-[TVLListenEngine lastObservationWasConfident](self, "lastObservationWasConfident"))
      {
LABEL_10:

        v6 = v22;
        goto LABEL_11;
      }
      -[TVLListenEngine setConvergenceLossCount:](self, "setConvergenceLossCount:", -[TVLListenEngine convergenceLossCount](self, "convergenceLossCount") + 1);
    }
    -[TVLListenEngine setLastObservationWasConfident:](self, "setLastObservationWasConfident:", v16 == 1.0);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, double);

  v6 = a3;
  v7 = a4;
  if (_TVLLogDefault_onceToken_6 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_ERROR))
    -[TVLListenEngine request:didFailWithError:].cold.1();
  -[TVLListenEngine completion](self, "completion");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  v8[2](v8, 0, 0, 0.0);

  -[TVLListenEngine invalidate](self, "invalidate");
}

- (void)requestDidComplete:(id)a3
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = a3;
  if (_TVLLogDefault_onceToken_6 != -1)
    dispatch_once(&_TVLLogDefault_onceToken_6, &__block_literal_global_209);
  v4 = _TVLLogDefault_log_6;
  if (os_log_type_enabled((os_log_t)_TVLLogDefault_log_6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2AB000, v4, OS_LOG_TYPE_DEFAULT, "SoundAnalysis Did Complete!", v5, 2u);
  }

}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (void)setAudioEngine:(id)a3
{
  objc_storeStrong((id *)&self->_audioEngine, a3);
}

- (AVAudioInputNode)microphone
{
  return self->_microphone;
}

- (void)setMicrophone:(id)a3
{
  objc_storeStrong((id *)&self->_microphone, a3);
}

- (AVAudioPlayerNode)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (AVAudioUnit)mixer
{
  return self->_mixer;
}

- (void)setMixer:(id)a3
{
  objc_storeStrong((id *)&self->_mixer, a3);
}

- (SNEstimateAudioOffsetRequest)estimateAudioOffsetRequest
{
  return self->_estimateAudioOffsetRequest;
}

- (void)setEstimateAudioOffsetRequest:(id)a3
{
  objc_storeStrong((id *)&self->_estimateAudioOffsetRequest, a3);
}

- (SNAudioStreamAnalyzer)streamAnalyzer
{
  return self->_streamAnalyzer;
}

- (void)setStreamAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_streamAnalyzer, a3);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (AVAudioFile)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
  objc_storeStrong((id *)&self->_file, a3);
}

- (NSMutableArray)confidentResults
{
  return self->_confidentResults;
}

- (void)setConfidentResults:(id)a3
{
  objc_storeStrong((id *)&self->_confidentResults, a3);
}

- (int64_t)convergenceLossCount
{
  return self->_convergenceLossCount;
}

- (void)setConvergenceLossCount:(int64_t)a3
{
  self->_convergenceLossCount = a3;
}

- (NSDate)firstObservationDate
{
  return self->_firstObservationDate;
}

- (void)setFirstObservationDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstObservationDate, a3);
}

- (double)timeToConverge
{
  return self->_timeToConverge;
}

- (void)setTimeToConverge:(double)a3
{
  self->_timeToConverge = a3;
}

- (BOOL)lastObservationWasConfident
{
  return self->_lastObservationWasConfident;
}

- (void)setLastObservationWasConfident:(BOOL)a3
{
  self->_lastObservationWasConfident = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (OS_dispatch_queue)analysisQueue
{
  return self->_analysisQueue;
}

- (void)setAnalysisQueue:(id)a3
{
  objc_storeStrong((id *)&self->_analysisQueue, a3);
}

- (BOOL)didMissDeadline
{
  return self->_didMissDeadline;
}

- (void)setDidMissDeadline:(BOOL)a3
{
  self->_didMissDeadline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_firstObservationDate, 0);
  objc_storeStrong((id *)&self->_confidentResults, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_streamAnalyzer, 0);
  objc_storeStrong((id *)&self->_estimateAudioOffsetRequest, 0);
  objc_storeStrong((id *)&self->_mixer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_microphone, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
}

- (void)init
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2AB000, v0, v1, "Unable to create Listen Engine: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_setupAndStartAudioEngineGraphWithTimeout:(os_log_t)log error:(void *)a4 .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_21F2AB000, log, OS_LOG_TYPE_ERROR, "Microphone has an invalid input format! %{public}@", buf, 0xCu);

}

- (void)startListeningWithReferenceTone:(os_log_t)log at:saveToFile:withCallback:completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F2AB000, log, OS_LOG_TYPE_ERROR, "DEADLINE MISS: Calibration will be incorrect.", v1, 2u);
}

- (void)startListeningWithReferenceTone:at:saveToFile:withCallback:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2AB000, v0, v1, "Creating AVAudioFile reported an error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)startListeningWithReferenceTone:at:saveToFile:withCallback:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2AB000, v0, v1, "An error occurred while setting up the stream analyzer %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)startListeningWithReferenceTone:at:saveToFile:withCallback:completion:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2AB000, v0, v1, "Audio Engine did not start err=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)request:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0(&dword_21F2AB000, v0, v1, "SoundAnalysis Failed. Error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
