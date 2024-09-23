@implementation VSOspreyTTSCore

- (VSOspreyTTSCore)initWithRequest:(id)a3
{
  id v5;
  VSOspreyTTSCore *v6;
  VSOspreyTTSCore *v7;
  uint64_t v8;
  VSSiriServerConfiguration *serverConfig;
  VSServerTTSClient *v10;
  VSServerTTSClient *serverTTSClient;
  uint64_t v12;
  VSSpeechInternalSettings *internalSettings;
  NSCondition *v14;
  NSCondition *didReceiveAudioCondition;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *delegateCallbackQueue;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)VSOspreyTTSCore;
  v6 = -[VSOspreyTTSCore init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
    v8 = objc_claimAutoreleasedReturnValue();
    serverConfig = v7->_serverConfig;
    v7->_serverConfig = (VSSiriServerConfiguration *)v8;

    v10 = objc_alloc_init(VSServerTTSClient);
    serverTTSClient = v7->_serverTTSClient;
    v7->_serverTTSClient = v10;

    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    internalSettings = v7->_internalSettings;
    v7->_internalSettings = (VSSpeechInternalSettings *)v12;

    v14 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    didReceiveAudioCondition = v7->_didReceiveAudioCondition;
    v7->_didReceiveAudioCondition = v14;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("VSOspreyTTSCoreCallbackQueue", v16);
    delegateCallbackQueue = v7->_delegateCallbackQueue;
    v7->_delegateCallbackQueue = (OS_dispatch_queue *)v17;

  }
  return v7;
}

- (double)timeout
{
  void *v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  -[VSOspreyTTSCore internalSettings](self, "internalSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverTTSTimeout");
  if (v4 == 0.0)
  {
    -[VSOspreyTTSCore serverConfig](self, "serverConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSOspreyTTSCore request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeoutForAppId:", v7);
    v9 = v8;

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (void)setDidReceiveAudio:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[VSOspreyTTSCore didReceiveAudioCondition](self, "didReceiveAudioCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_didReceiveAudio = v3;
  if (v3)
  {
    -[VSOspreyTTSCore didReceiveAudioCondition](self, "didReceiveAudioCondition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "broadcast");

  }
  -[VSOspreyTTSCore didReceiveAudioCondition](self, "didReceiveAudioCondition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)performRoundTripOspreyTTS
{
  void *v3;
  VSTimeoutCondition *v4;
  VSTimeoutCondition *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  -[VSOspreyTTSCore instrumentMetrics](self, "instrumentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceOfTTS:", 4);

  v4 = [VSTimeoutCondition alloc];
  -[VSOspreyTTSCore timeout](self, "timeout");
  v5 = -[VSTimeoutCondition initWithTimeoutValue:](v4, "initWithTimeoutValue:");
  -[VSOspreyTTSCore setTimeoutCondition:](self, "setTimeoutCondition:", v5);

  objc_initWeak(&location, self);
  -[VSOspreyTTSCore serverTTSClient](self, "serverTTSClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSOspreyTTSCore request](self, "request");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke;
  v18[3] = &unk_24DD8E3A8;
  objc_copyWeak(&v19, &location);
  v13 = v8;
  v14 = 3221225472;
  v15 = __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke_3;
  v16 = &unk_24DD8E3D0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v6, "ospreyStartSynthesisRequest:responseHandler:completion:", v7, v18, &v13);

  -[VSOspreyTTSCore timeoutCondition](self, "timeoutCondition", v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "wait");

  if ((v7 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD0FC8];
    v22[0] = CFSTR("Osprey round-trip TTS timed out");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 602, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSOspreyTTSCore setError:](self, "setError:", v12);

  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)performStreamingOspreyTTS
{
  void *v3;
  VSTimeoutCondition *v4;
  VSTimeoutCondition *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint8_t v16[8];
  _QWORD v17[7];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[9];
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[4];
  id location;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  -[VSOspreyTTSCore instrumentMetrics](self, "instrumentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceOfTTS:", 5);

  v4 = [VSTimeoutCondition alloc];
  -[VSOspreyTTSCore timeout](self, "timeout");
  v5 = -[VSTimeoutCondition initWithTimeoutValue:](v4, "initWithTimeoutValue:");
  -[VSOspreyTTSCore setTimeoutCondition:](self, "setTimeoutCondition:", v5);

  objc_initWeak(&location, self);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__848;
  v31 = __Block_byref_object_dispose__849;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__848;
  v25[4] = __Block_byref_object_dispose__849;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__848;
  v23[4] = __Block_byref_object_dispose__849;
  v24 = 0;
  -[VSOspreyTTSCore serverTTSClient](self, "serverTTSClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSOspreyTTSCore request](self, "request");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke;
  v21[3] = &unk_24DD8E420;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  v21[5] = v33;
  v21[6] = &v27;
  v21[7] = v25;
  v21[8] = v23;
  v19[0] = v8;
  v19[2] = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_22;
  v19[3] = &unk_24DD8E448;
  v19[1] = 3221225472;
  objc_copyWeak(&v20, &location);
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_2_24;
  v17[3] = &unk_24DD8E498;
  objc_copyWeak(&v18, &location);
  v17[4] = v33;
  v17[5] = &v27;
  v17[6] = v25;
  objc_msgSend(v6, "ospreyStartStreamingRequest:dataHandler:metaInfoHandler:completion:", v7, v21, v19, v17);

  -[VSOspreyTTSCore timeoutCondition](self, "timeoutCondition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "wait");

  if ((v7 & 1) == 0)
  {
    if (v28[5])
    {
      VSGetLogDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_21AA84000, v10, OS_LOG_TYPE_ERROR, "Timeout in osprey streaming", v16, 2u);
      }

      v11 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BDD0FC8];
      v36 = CFSTR("Osprey streaming TTS timed out");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 602, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSOspreyTTSCore setError:](self, "setError:", v13);
    }
    else
    {
      VSGetLogDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_error_impl(&dword_21AA84000, v14, OS_LOG_TYPE_ERROR, "Network stall in osprey streaming", v16, 2u);
      }

      v15 = (void *)MEMORY[0x24BDD1540];
      v37 = *MEMORY[0x24BDD0FC8];
      v38[0] = CFSTR("Osprey streaming network stall");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 603, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSOspreyTTSCore setError:](self, "setError:", v13);
    }

    -[VSOspreyTTSCore cancel](self, "cancel");
  }
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v33, 8);
  objc_destroyWeak(&location);
}

- (void)main
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  v3 = mach_absolute_time();
  -[VSOspreyTTSCore instrumentMetrics](self, "instrumentMetrics");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "setSynthesisBeginTimestamp:", v3);

  kdebug_trace();
  -[VSOspreyTTSCore internalSettings](self, "internalSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "disableOspreyStreaming");

  if ((v4 & 1) != 0)
    -[VSOspreyTTSCore performRoundTripOspreyTTS](self, "performRoundTripOspreyTTS");
  else
    -[VSOspreyTTSCore performStreamingOspreyTTS](self, "performStreamingOspreyTTS");
  v6 = mach_absolute_time();
  -[VSOspreyTTSCore instrumentMetrics](self, "instrumentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSynthesisEndTimestamp:", v6);

  kdebug_trace();
  -[VSOspreyTTSCore delegateCallbackQueue](self, "delegateCallbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__VSOspreyTTSCore_main__block_invoke;
  block[3] = &unk_24DD8EBB0;
  block[4] = self;
  dispatch_async_and_wait(v8, block);

}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  VSOspreyTTSCore *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_INFO, "Osprey core %p is cancelled", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)VSOspreyTTSCore;
  -[VSOspreyTTSCore cancel](&v5, sel_cancel);
  -[VSOspreyTTSCore timeoutCondition](self, "timeoutCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

}

- (void)waitUntilFinishedIfAudioReceivedWithin:(double)a3
{
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  -[VSOspreyTTSCore didReceiveAudioCondition](self, "didReceiveAudioCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = -[VSOspreyTTSCore didReceiveAudio](self, "didReceiveAudio");
  -[VSOspreyTTSCore didReceiveAudioCondition](self, "didReceiveAudioCondition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "unlock");

    -[VSOspreyTTSCore waitUntilFinished](self, "waitUntilFinished");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "waitUntilDate:", v9);

    -[VSOspreyTTSCore didReceiveAudioCondition](self, "didReceiveAudioCondition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unlock");

    if ((v10 & 1) == 0)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v16 = *MEMORY[0x24BDD0FC8];
      v17[0] = CFSTR("Osprey core is not able to provide audio in time");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 602, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSOspreyTTSCore setError:](self, "setError:", v14);

      -[VSOspreyTTSCore timeoutCondition](self, "timeoutCondition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stop");

    }
    -[VSOspreyTTSCore waitUntilFinished](self, "waitUntilFinished");
  }
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (VSOspreyTTSCoreDelegate)delegate
{
  return (VSOspreyTTSCoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return (VSInstrumentMetrics *)objc_loadWeakRetained((id *)&self->_instrumentMetrics);
}

- (void)setInstrumentMetrics:(id)a3
{
  objc_storeWeak((id *)&self->_instrumentMetrics, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (VSVoiceAsset)voice
{
  return self->_voice;
}

- (void)setVoice:(id)a3
{
  objc_storeStrong((id *)&self->_voice, a3);
}

- (VSVoiceResourceAsset)voiceResource
{
  return self->_voiceResource;
}

- (void)setVoiceResource:(id)a3
{
  objc_storeStrong((id *)&self->_voiceResource, a3);
}

- (VSServerTTSClient)serverTTSClient
{
  return self->_serverTTSClient;
}

- (void)setServerTTSClient:(id)a3
{
  objc_storeStrong((id *)&self->_serverTTSClient, a3);
}

- (VSSiriServerConfiguration)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerConfig:(id)a3
{
  objc_storeStrong((id *)&self->_serverConfig, a3);
}

- (VSSpeechInternalSettings)internalSettings
{
  return self->_internalSettings;
}

- (void)setInternalSettings:(id)a3
{
  objc_storeStrong((id *)&self->_internalSettings, a3);
}

- (double)bufferDurationLimit
{
  return self->_bufferDurationLimit;
}

- (void)setBufferDurationLimit:(double)a3
{
  self->_bufferDurationLimit = a3;
}

- (VSTimeoutCondition)timeoutCondition
{
  return self->_timeoutCondition;
}

- (void)setTimeoutCondition:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutCondition, a3);
}

- (BOOL)didReceiveAudio
{
  return self->_didReceiveAudio;
}

- (NSCondition)didReceiveAudioCondition
{
  return self->_didReceiveAudioCondition;
}

- (void)setDidReceiveAudioCondition:(id)a3
{
  objc_storeStrong((id *)&self->_didReceiveAudioCondition, a3);
}

- (OS_dispatch_queue)delegateCallbackQueue
{
  return self->_delegateCallbackQueue;
}

- (void)setDelegateCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateCallbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_didReceiveAudioCondition, 0);
  objc_storeStrong((id *)&self->_timeoutCondition, 0);
  objc_storeStrong((id *)&self->_internalSettings, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong((id *)&self->_serverTTSClient, 0);
  objc_storeStrong((id *)&self->_voiceResource, 0);
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_instrumentMetrics);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
}

void __23__VSOspreyTTSCore_main__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ospreyCore:didFinishWithError:", v2, v3);

}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  void *v22;
  NSObject *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  void *v43;
  id v44;
  id v45;
  __int128 v46;
  _QWORD block[5];
  id v48;
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v8 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v8, "isFinished") & 1) == 0)
  {
    objc_msgSend(v5, "duration");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(v8, "bufferDurationLimit");
    if (v10 > fmax(v11 + 0.1, 0.8))
    {
      objc_msgSend(v8, "internalSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "simulateNetworkStall");

      if (v13)
      {
        VSGetLogDefault();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AA84000, v14, OS_LOG_TYPE_INFO, "Simulate network stall is on, ignore audio object", buf, 2u);
        }
LABEL_21:

        goto LABEL_22;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "serverFirstPacketTimestamp");

    if (!v16)
    {
      v17 = mach_absolute_time();
      objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setServerFirstPacketTimestamp:", v17);

    }
    v19 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setServerLastPacketTimestamp:", v19);

    v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setServerStreamedAudioDuration:", v21);

    if (objc_msgSend(v8, "didReceiveAudio"))
    {
      objc_msgSend(v8, "delegateCallbackQueue");
      v23 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_20;
      block[3] = &unk_24DD8E938;
      block[4] = v8;
      v48 = v5;
      v49 = v6;
      dispatch_async(v23, block);

      v24 = v48;
    }
    else
    {
      v25 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      objc_msgSend(v8, "bufferDurationLimit");
      if (v25 < v26)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v5);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v6);
LABEL_16:
        v31 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v31)
        {
          objc_msgSend(v31, "dateByAddingTimeInterval:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "timeIntervalSinceNow");
          v34 = v33 + 0.05;
          objc_msgSend(v8, "timeoutCondition");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setTimeoutValue:", v34);

          VSGetLogDefault();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "timeoutCondition");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "timeoutValue");
            *(_DWORD *)buf = 134217984;
            v51 = v38;
            _os_log_impl(&dword_21AA84000, v36, OS_LOG_TYPE_INFO, "Refresh timeout value as %.2f", buf, 0xCu);

          }
        }
        objc_msgSend(v8, "timeoutCondition");
        v14 = objc_claimAutoreleasedReturnValue();
        -[NSObject refresh](v14, "refresh");
        goto LABEL_21;
      }
      objc_msgSend(v8, "setDidReceiveAudio:", 1);
      objc_msgSend(v8, "delegateCallbackQueue");
      v27 = objc_claimAutoreleasedReturnValue();
      v39 = MEMORY[0x24BDAC760];
      v40 = 3221225472;
      v41 = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_2;
      v42 = &unk_24DD8E3F8;
      v43 = v8;
      v46 = *(_OWORD *)(a1 + 48);
      v44 = v5;
      v45 = v6;
      dispatch_async(v27, &v39);

      objc_msgSend(MEMORY[0x24BDBCE60], "date", v39, v40, v41, v42, v43);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

      v24 = v44;
    }

    goto LABEL_16;
  }
LABEL_22:

}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_22(uint64_t a1, void *a2, void *a3, float a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  float v11;
  id v12;

  v12 = a2;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v9, "isFinished") & 1) == 0)
  {
    objc_msgSend(v9, "setVoice:", v12);
    objc_msgSend(v9, "setVoiceResource:", v7);
    objc_msgSend(v9, "internalSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "streamBufferDuration");
    if (v11 == 0.0)
      v11 = a4;
    objc_msgSend(v9, "setBufferDurationLimit:", v11);

  }
}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_2_24(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v5, "isFinished") & 1) == 0)
  {
    if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > 0.8
      && (objc_msgSend(v5, "internalSettings"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "simulateNetworkStall"),
          v6,
          v7))
    {
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA84000, v8, OS_LOG_TYPE_INFO, "Simulate network stall is on, ignore completion callback", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v5, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        objc_msgSend(v5, "setError:", v3);
      objc_msgSend(v5, "delegateCallbackQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_25;
      v15 = &unk_24DD8E470;
      v18 = *(_QWORD *)(a1 + 40);
      v16 = v3;
      v17 = v5;
      v19 = *(_QWORD *)(a1 + 48);
      dispatch_async(v10, &v12);

      objc_msgSend(v5, "timeoutCondition", v12, v13, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stop");

      v8 = v16;
    }

  }
}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_25(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "setDidReceiveAudio:", 1);
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"))
      {
        v2 = 0;
        do
        {
          objc_msgSend(*(id *)(a1 + 40), "delegate");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = *(_QWORD *)(a1 + 40);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "objectAtIndexedSubscript:", v2);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", v2);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "ospreyCore:didReceiveAudio:wordTimingInfo:", v4, v5, v6);

          ++v2;
        }
        while (v2 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"));
      }
    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_20(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ospreyCore:didReceiveAudio:wordTimingInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __44__VSOspreyTTSCore_performStreamingOspreyTTS__block_invoke_2(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
  {
    v2 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectAtIndexedSubscript:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "objectAtIndexedSubscript:", v2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "ospreyCore:didReceiveAudio:wordTimingInfo:", v4, v5, v6);

      ++v2;
    }
    while (v2 < objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"));
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ospreyCore:didReceiveAudio:wordTimingInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

void __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v8, "isFinished") & 1) == 0)
  {
    objc_msgSend(v8, "setDidReceiveAudio:", 1);
    objc_msgSend(v8, "delegateCallbackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke_2;
    block[3] = &unk_24DD8E938;
    block[4] = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

void __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "isCancelled") & 1) == 0 && (objc_msgSend(v4, "isFinished") & 1) == 0)
  {
    objc_msgSend(v4, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(v4, "setError:", v7);
    objc_msgSend(v4, "timeoutCondition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");

  }
}

void __44__VSOspreyTTSCore_performRoundTripOspreyTTS__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ospreyCore:didReceiveAudio:wordTimingInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
