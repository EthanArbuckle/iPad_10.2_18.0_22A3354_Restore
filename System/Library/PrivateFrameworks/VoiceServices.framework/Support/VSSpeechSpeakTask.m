@implementation VSSpeechSpeakTask

- (VSSpeechSpeakTask)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (VSSpeechSpeakTask)initWithRequest:(id)a3
{
  id v5;
  VSSpeechSpeakTask *v6;
  VSSpeechSpeakTask *v7;
  VSInstrumentMetrics *v8;
  VSInstrumentMetrics *instrumentMetrics;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  VSCachingService *cachingService;
  uint64_t v18;
  VSPrewarmService *prewarmService;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  VSSpeechSpeakTask *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VSSpeechSpeakTask;
  v6 = -[VSSpeechSpeakTask init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x24BEC0D88]);
    instrumentMetrics = v7->_instrumentMetrics;
    v7->_instrumentMetrics = v8;

    if (objc_msgSend(v5, "requestCreatedTimestamp"))
    {
      v10 = objc_msgSend(v5, "requestCreatedTimestamp");
    }
    else
    {
      VSGetLogDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v11, OS_LOG_TYPE_ERROR, "Using timestamp inside voiced for task", buf, 2u);
      }

      v10 = mach_absolute_time();
    }
    -[VSInstrumentMetrics setRequestCreatedTimestamp:](v7->_instrumentMetrics, "setRequestCreatedTimestamp:", v10);
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = -[VSInstrumentMetrics requestCreatedTimestamp](v7->_instrumentMetrics, "requestCreatedTimestamp");
      *(_DWORD *)buf = 134218240;
      v23 = v13;
      v24 = 2048;
      v25 = v7;
      _os_log_impl(&dword_21AA84000, v12, OS_LOG_TYPE_INFO, "Created Task %llu (%p)", buf, 0x16u);
    }

    kdebug_trace();
    objc_msgSend(v5, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSInstrumentMetrics setUtterance:](v7->_instrumentMetrics, "setUtterance:", v14);

    -[VSInstrumentMetrics setCanUseServerTTS:](v7->_instrumentMetrics, "setCanUseServerTTS:", objc_msgSend(v5, "canUseServerTTS"));
    objc_msgSend(v5, "clientBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSInstrumentMetrics setClientBundleIdentifier:](v7->_instrumentMetrics, "setClientBundleIdentifier:", v15);

    -[VSInstrumentMetrics setSourceOfTTS:](v7->_instrumentMetrics, "setSourceOfTTS:", 1);
    +[VSCachingService standardService](VSCachingService, "standardService");
    v16 = objc_claimAutoreleasedReturnValue();
    cachingService = v7->_cachingService;
    v7->_cachingService = (VSCachingService *)v16;

    +[VSPrewarmService sharedService](VSPrewarmService, "sharedService");
    v18 = objc_claimAutoreleasedReturnValue();
    prewarmService = v7->_prewarmService;
    v7->_prewarmService = (VSPrewarmService *)v18;

  }
  return v7;
}

- (OS_dispatch_queue)taskAuxiliaryQueue
{
  VSSpeechSpeakTask *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *taskAuxiliaryQueue;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_taskAuxiliaryQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create(0, v3);
    taskAuxiliaryQueue = v2->_taskAuxiliaryQueue;
    v2->_taskAuxiliaryQueue = (OS_dispatch_queue *)v4;

  }
  objc_sync_exit(v2);

  return v2->_taskAuxiliaryQueue;
}

- (BOOL)isSpeaking
{
  return 1;
}

- (id)taskHash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v22 = (void *)MEMORY[0x24BDD17C8];
  -[VSSpeechSpeakTask request](self, "request");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "utterance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rate");
  v6 = v5;
  -[VSSpeechSpeakTask request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pitch");
  v9 = v8;
  -[VSSpeechSpeakTask request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "volume");
  v12 = v11;
  -[VSSpeechSpeakTask request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contextInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "customResourceURLs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ %@ %@ %@ %.2f %.2f %.2f %@ %@"), CFSTR("2"), v20, v3, v4, v6, v9, v12, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "sha256hex");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)main
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
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
  double v20;
  double v21;
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
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  BOOL v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  char v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint8_t buf[4];
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  kdebug_trace();
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v80 = objc_msgSend(v74, "requestCreatedTimestamp");
    _os_log_debug_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEBUG, "Starting speech task %llu", buf, 0xCu);

  }
  -[VSSpeechSpeakTask cachingService](self, "cachingService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popShortTermCacheForHash:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechSpeakTask request](self, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logText");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v80 = (uint64_t)v10;
      _os_log_impl(&dword_21AA84000, v8, OS_LOG_TYPE_DEFAULT, "Short-term cached synthesis is found for text '%@'", buf, 0xCu);

    }
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIsServerTTS:", 1);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setIsCacheHitFromMemory:", 1);

    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourceOfTTS:", 6);

    objc_msgSend(v7, "voiceKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setVoiceAssetKey:", v14);

    objc_msgSend(v7, "voiceResourceKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setVoiceResourceAssetKey:", v16);

    objc_msgSend(v7, "timingInfos");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask setTimingInfos:](self, "setTimingInfos:", v18);

    objc_msgSend(v7, "audio");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "duration");
    v21 = v20;
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAudioDuration:", v21);

    -[VSSpeechSpeakTask setSpeechCache:](self, "setSpeechCache:", v7);
  }
  else
  {
    v23 = (void *)objc_opt_new();
    -[VSSpeechSpeakTask request](self, "request");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "languageCode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "voiceName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "estimatedTTSWordTimingForText:withLanguage:voiceName:", v25, v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask setTimingInfos:](self, "setTimingInfos:", v30);

    v31 = (void *)MEMORY[0x24BEC0E10];
    -[VSSpeechSpeakTask timingInfos](self, "timingInfos");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "contextInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "adjustWordTimingInfo:forContext:", v32, v34);

    -[VSSpeechSpeakTask fetchVoiceResource](self, "fetchVoiceResource");
    -[VSSpeechSpeakTask fetchVoiceAsset](self, "fetchVoiceAsset");
    -[VSSpeechSpeakTask error](self, "error");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      -[VSSpeechSpeakTask cachingService](self, "cachingService");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "fetchCacheForTask:", self);

    }
  }
  -[VSSpeechSpeakTask error](self, "error");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
  {
    -[VSSpeechSpeakTask speechCache](self, "speechCache");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      -[VSSpeechSpeakTask reportTimingInfo](self, "reportTimingInfo");
      -[VSSpeechSpeakTask speakCachedAudio](self, "speakCachedAudio");
    }
    else
    {
      -[VSSpeechSpeakTask synthesizeAndSpeak](self, "synthesizeAndSpeak");
      -[VSSpeechSpeakTask error](self, "error");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v39)
      {
        -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "duration");
        v42 = v41;
        -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setAudioDuration:", v42);

      }
    }
    v44 = mach_absolute_time();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setSpeechEndTimestamp:", v44);

    -[VSSpeechSpeakTask playbackService](self, "playbackService");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v45) = objc_msgSend(v46, "discontinuedDuringPlayback");

    if ((_DWORD)v45)
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setErrorCode:", 452);

    }
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setIsSpeechRequest:", 1);

  }
  if (-[VSSpeechSpeakTask isCancelled](self, "isCancelled"))
  {
    v49 = (void *)MEMORY[0x24BDD1540];
    v77 = *MEMORY[0x24BDD0FD0];
    v78 = CFSTR("Speech is cancelled/interrupted.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 400, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask setError:](self, "setError:", v51);

  }
  -[VSSpeechSpeakTask error](self, "error");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
  {
    -[VSSpeechSpeakTask reportInstrumentMetrics](self, "reportInstrumentMetrics");
    -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask request](self, "request");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "dumpStreamAudio:forRequest:", v55, v56);
    }
    else
    {
      -[VSSpeechSpeakTask compressedAudio](self, "compressedAudio");
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v57)
      {
LABEL_25:
        -[VSSpeechSpeakTask speechCache](self, "speechCache");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {

        }
        else
        {
          -[VSSpeechSpeakTask request](self, "request");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v59, "shouldCache") & 1) != 0)
          {
            v60 = -[VSSpeechSpeakTask synthesisHasIssue](self, "synthesisHasIssue");

            if (!v60)
              -[VSSpeechSpeakTask enqueueCache](self, "enqueueCache");
          }
          else
          {

          }
        }
        -[VSSpeechSpeakTask request](self, "request");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "outputPath");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "path");
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (v63)
        {
          -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "writeWaveToFilePath:", v63);

          if ((v65 & 1) == 0)
          {
            v66 = (void *)MEMORY[0x24BDD1540];
            v75 = *MEMORY[0x24BDD0FD0];
            v76 = CFSTR("writeWaveToFilePath failed.");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 501, v67);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            -[VSSpeechSpeakTask setError:](self, "setError:", v68);

          }
        }
        -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend(v69, "errorCode");
        v71 = VSSpeakTaskTailSpinDumpInProgress;

        if (v70 == 452 && (v71 & 1) == 0)
        {
          VSGetLogDefault();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21AA84000, v72, OS_LOG_TYPE_INFO, "Detected synthesis stall, starting tailspin", buf, 2u);
          }

          VSSpeakTaskTailSpinDumpInProgress = 1;
          +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "collectTailspin:", &__block_literal_global_277);

        }
        goto LABEL_40;
      }
      +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask compressedAudio](self, "compressedAudio");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask request](self, "request");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "dumpCompressedAudio:forRequest:", v55, v56);
    }

    goto LABEL_25;
  }
LABEL_40:
  -[VSSpeechSpeakTask reportFinish](self, "reportFinish");
  -[VSSpeechSpeakTask logFinish](self, "logFinish");
  kdebug_trace();

}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  objc_super v9;
  objc_super v10;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 400, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask setError:](self, "setError:", v3);

  if ((-[VSSpeechSpeakTask isExecuting](self, "isExecuting") & 1) != 0
    || (-[VSSpeechSpeakTask isCancelled](self, "isCancelled") & 1) != 0
    || (-[VSSpeechSpeakTask isFinished](self, "isFinished") & 1) != 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)VSSpeechSpeakTask;
    -[VSSpeechSpeakTask cancel](&v9, sel_cancel);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)VSSpeechSpeakTask;
    -[VSSpeechSpeakTask cancel](&v10, sel_cancel);
    -[VSSpeechSpeakTask reportFinish](self, "reportFinish");
  }
  -[VSSpeechSpeakTask engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAtMarker:", 0);

  -[VSSpeechSpeakTask neuralPlaybackSemaphore](self, "neuralPlaybackSemaphore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VSSpeechSpeakTask neuralPlaybackSemaphore](self, "neuralPlaybackSemaphore");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v6);

  }
  -[VSSpeechSpeakTask taskAuxiliaryQueue](self, "taskAuxiliaryQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__VSSpeechSpeakTask_cancel__block_invoke;
  block[3] = &unk_24DD8EBB0;
  block[4] = self;
  dispatch_async(v7, block);

}

- (void)synthesizeAndSpeak
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[7];
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD block[5];
  _QWORD v66[3];
  uint64_t v67;
  uint8_t v68[128];
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask prepareForSynthesis](self, "prepareForSynthesis");
  -[VSSpeechSpeakTask error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[VSSpeechSpeakTask request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask startPlaybackServiceWithAudioSessionID:](self, "startPlaybackServiceWithAudioSessionID:", objc_msgSend(v4, "audioSessionID"));

    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x2020000000;
    v67 = 0;
    v67 = mach_absolute_time();
    -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "voiceData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "type") == 4;

    if (v7)
    {
      v8 = dispatch_semaphore_create(0);
      -[VSSpeechSpeakTask setNeuralPlaybackSemaphore:](self, "setNeuralPlaybackSemaphore:", v8);

      -[VSSpeechSpeakTask taskAuxiliaryQueue](self, "taskAuxiliaryQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke;
      block[3] = &unk_24DD8EBB0;
      block[4] = self;
      dispatch_async(v9, block);

    }
    -[VSSpeechSpeakTask error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 && (-[VSSpeechSpeakTask isCancelled](self, "isCancelled") & 1) == 0)
    {
      v11 = mach_absolute_time();
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setSynthesisBeginTimestamp:", v11);

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      -[VSSpeechSpeakTask request](self, "request");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "customResourceURLs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v62;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v62 != v17)
              objc_enumerationMutation(v15);
            v19 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
            -[VSSpeechSpeakTask engine](self, "engine");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "loadResource:error:", v19, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (v21)
              objc_msgSend(v13, "addObject:", v21);

          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
        }
        while (v16);
      }

      -[VSSpeechSpeakTask engine](self, "engine");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "asbd");
        v24 = DWORD2(v59);
      }
      else
      {
        v24 = 0;
        v60 = 0;
        v58 = 0u;
        v59 = 0u;
      }
      -[VSSpeechSpeakTask engine](self, "engine");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "asbd");
        v27 = *(double *)&v55;
      }
      else
      {
        v57 = 0;
        v55 = 0u;
        v56 = 0u;
        v27 = 0.0;
      }

      kdebug_trace();
      -[VSSpeechSpeakTask engine](self, "engine");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask request](self, "request");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "utterance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask request](self, "request");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "canLogRequestText");
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_35;
      v54[3] = &unk_24DD8E2C0;
      v54[4] = self;
      v54[5] = v66;
      v54[6] = (unint64_t)(v27 * (double)v24);
      objc_msgSend(v28, "synthesizeText:loggable:callback:", v30, v32, v54);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
        -[VSSpeechSpeakTask setError:](self, "setError:", v33);
      -[VSSpeechSpeakTask neuralPlaybackSemaphore](self, "neuralPlaybackSemaphore");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        -[VSSpeechSpeakTask neuralPlaybackSemaphore](self, "neuralPlaybackSemaphore");
        v35 = objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_signal(v35);

      }
      VSGetLogDefault();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        -[VSSpeechSpeakTask request](self, "request");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "utterance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "length");
        -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "duration");
        v42 = v41;
        -[VSSpeechSpeakTask error](self, "error");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v70 = v39;
        v71 = 2048;
        v72 = v42;
        v73 = 2112;
        v74 = v43;
        _os_log_impl(&dword_21AA84000, v36, OS_LOG_TYPE_INFO, "SpeakTask done synthesize %lu characters, audio duration %f, error %@", buf, 0x20u);

      }
      notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEC0EC0], "UTF8String"));
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v44 = v13;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
      if (v45)
      {
        v46 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v45; ++j)
          {
            if (*(_QWORD *)v51 != v46)
              objc_enumerationMutation(v44);
            v48 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
            -[VSSpeechSpeakTask engine](self, "engine", (_QWORD)v50);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "unloadResource:", v48);

          }
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v50, v68, 16);
        }
        while (v45);
      }

      -[VSSpeechSpeakTask waitUntilAudioFinished](self, "waitUntilAudioFinished");
    }
    _Block_object_dispose(v66, 8);
  }
}

- (void)reportInstrumentMetrics
{
  void *v3;
  char v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    VSGetLogDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "requestCreatedTimestamp");
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218242;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_DEFAULT, "Device task %llu: Instrument metric: %@", (uint8_t *)&v16, 0x16u);

    }
    -[VSSpeechSpeakTask delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "speechRequest:didReportInstrumentMetrics:", v10, v11);

    +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dumpInstrumentMetrics:withTimestamp:", v14, objc_msgSend(v15, "requestCreatedTimestamp"));

  }
}

- (void)reportFinish
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VSSpeechSpeakTask delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VSSpeechSpeakTask isCancelled](self, "isCancelled") ^ 1;
    -[VSSpeechSpeakTask phonemes](self, "phonemes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask error](self, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechRequest:didStopWithSuccess:phonemesSpoken:error:", v6, v7, v9, v10);

    VSGetLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "requestCreatedTimestamp");
      -[VSSpeechSpeakTask error](self, "error");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v59 = v50;
      v60 = 2112;
      v61 = v51;
      _os_log_debug_impl(&dword_21AA84000, v11, OS_LOG_TYPE_DEBUG, "Task %llu reported finish, error: %@", buf, 0x16u);

    }
  }
  v12 = (void *)MEMORY[0x24BEC0D70];
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reportInstrumentMetrics:", v13);

  -[VSSpeechSpeakTask error](self, "error");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[VSSpeechSpeakTask error](self, "error");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "code") == 400)
    {

    }
    else
    {
      -[VSSpeechSpeakTask error](self, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "code");

      if (v18 != 501)
      {
        -[VSSpeechSpeakTask siriInstrumentation](self, "siriInstrumentation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)MEMORY[0x24BDD16E0];
        -[VSSpeechSpeakTask error](self, "error");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "numberWithInteger:", objc_msgSend(v46, "code"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v47;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v57, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "instrumentSpeechFailedWithErrorCodes:", v48);

        goto LABEL_21;
      }
    }
  }
  -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "voiceData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "languages");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "languageCode");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "isEqualToString:", v24))
  {

    goto LABEL_14;
  }
  -[VSSpeechSpeakTask request](self, "request");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "voiceName");
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {

    goto LABEL_16;
  }
  v55 = (void *)v26;
  -[VSSpeechSpeakTask request](self, "request");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "voiceName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "voiceData");
  v53 = v25;
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "name");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v27, "isEqualToString:", v29);

  if ((v56 & 1) == 0)
  {
LABEL_14:
    -[VSSpeechSpeakTask siriInstrumentation](self, "siriInstrumentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "voiceData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "instrumentVoiceFallbackOccurredWithVoice:resource:", v21, v22);
LABEL_16:

  }
  v30 = -[VSSpeechSpeakTask isCancelled](self, "isCancelled");
  -[VSSpeechSpeakTask siriInstrumentation](self, "siriInstrumentation");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v30)
  {
    objc_msgSend(v31, "instrumentSpeechCancelled");
  }
  else
  {
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "audioDuration");
    v35 = v34;
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "ttsSynthesisLatency");
    v38 = v37;
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "cappedRealTimeFactor");
    v41 = v40;
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "promptCount");
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "instrumentSpeechEndedWithAudioDuration:synthesisLatency:realTimeFactor:promptCount:errorCode:", v43, objc_msgSend(v44, "errorCode"), v35, v38, v41);

  }
LABEL_21:

}

- (void)reportSpeechStart
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "speechBeginTimestamp");

  if (!v4)
  {
    kdebug_trace();
    v5 = mach_absolute_time();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v6, "setSpeechBeginTimestamp:", v5);

    -[VSSpeechSpeakTask delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[VSSpeechSpeakTask delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask request](self, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "speechRequestDidStart:", v9);

      VSGetLogDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v36 = objc_msgSend(v23, "requestCreatedTimestamp");
        _os_log_debug_impl(&dword_21AA84000, v10, OS_LOG_TYPE_DEBUG, "Task %llu started speaking", buf, 0xCu);

      }
    }
    -[VSSpeechSpeakTask siriInstrumentation](self, "siriInstrumentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v34, "sourceOfTTS");
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "timeToSpeakLatency");
    v14 = v13;
    -[VSSpeechSpeakTask playbackService](self, "playbackService");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "outputRouteInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "voiceData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v30, "type");
    -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "voiceData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v28, "footprint");
    -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "voiceData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "contentVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");
    -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntegerValue");
    -[VSSpeechSpeakTask request](self, "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v24) = objc_msgSend(v22, "shouldWhisper");
    objc_msgSend(v11, "instrumentSpeechStartedWithSource:customerPerceivedLatency:audioOutputRoute:voiceType:voiceFootprint:voiceVersion:resourceVersion:isWhisper:", v12, v27, v26, v25, v18, v21, v14, v24);

  }
}

- (void)setObserverForWordTimings:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  -[VSSpeechSpeakTask delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[VSSpeechSpeakTask playbackService](self, "playbackService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __47__VSSpeechSpeakTask_setObserverForWordTimings___block_invoke;
    v8[3] = &unk_24DD8E9C8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v7, "setBoundaryTimeObserverForTimingInfos:usingBlock:", v4, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)reportTimingInfo
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[VSSpeechSpeakTask delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask timingInfos](self, "timingInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "speechRequest:didReceiveTimingInfo:", v6, v7);

    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134217984;
      v11 = objc_msgSend(v9, "requestCreatedTimestamp");
      _os_log_debug_impl(&dword_21AA84000, v8, OS_LOG_TYPE_DEBUG, "Task %llu reported word time info", (uint8_t *)&v10, 0xCu);

    }
  }
}

- (id)audioPowerProvider
{
  void *v2;
  void *v3;

  -[VSSpeechSpeakTask playbackService](self, "playbackService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioPowerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSArray)timingInfos
{
  return self->_timingInfos;
}

- (void)setTimingInfos:(id)a3
{
  objc_storeStrong((id *)&self->_timingInfos, a3);
}

- (VSSpeechServiceDelegate)delegate
{
  return (VSSpeechServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSSpeechEngine)engine
{
  return self->_engine;
}

- (void)setEngine:(id)a3
{
  objc_storeStrong((id *)&self->_engine, a3);
}

- (VSVoiceBooster)voiceBooster
{
  return self->_voiceBooster;
}

- (void)setVoiceBooster:(id)a3
{
  objc_storeStrong((id *)&self->_voiceBooster, a3);
}

- (VSAudioPlaybackService)playbackService
{
  return self->_playbackService;
}

- (void)setPlaybackService:(id)a3
{
  objc_storeStrong((id *)&self->_playbackService, a3);
}

- (VSVoiceAssetSelection)voiceSelection
{
  return self->_voiceSelection;
}

- (void)setVoiceSelection:(id)a3
{
  objc_storeStrong((id *)&self->_voiceSelection, a3);
}

- (VSVoiceResourceAsset)voiceResource
{
  return self->_voiceResource;
}

- (void)setVoiceResource:(id)a3
{
  objc_storeStrong((id *)&self->_voiceResource, a3);
}

- (VSCachingService)cachingService
{
  return self->_cachingService;
}

- (void)setCachingService:(id)a3
{
  objc_storeStrong((id *)&self->_cachingService, a3);
}

- (VSPrewarmService)prewarmService
{
  return self->_prewarmService;
}

- (void)setPrewarmService:(id)a3
{
  objc_storeStrong((id *)&self->_prewarmService, a3);
}

- (BOOL)synthesisHasIssue
{
  return self->_synthesisHasIssue;
}

- (void)setSynthesisHasIssue:(BOOL)a3
{
  self->_synthesisHasIssue = a3;
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setInstrumentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentMetrics, a3);
}

- (VSSiriInstrumentation)siriInstrumentation
{
  return self->_siriInstrumentation;
}

- (void)setSiriInstrumentation:(id)a3
{
  objc_storeStrong((id *)&self->_siriInstrumentation, a3);
}

- (VSSpeechCacheItem)speechCache
{
  return self->_speechCache;
}

- (void)setSpeechCache:(id)a3
{
  objc_storeStrong((id *)&self->_speechCache, a3);
}

- (NSArray)phonemes
{
  return self->_phonemes;
}

- (void)setPhonemes:(id)a3
{
  objc_storeStrong((id *)&self->_phonemes, a3);
}

- (VSAudioData)compressedAudio
{
  return self->_compressedAudio;
}

- (void)setCompressedAudio:(id)a3
{
  objc_storeStrong((id *)&self->_compressedAudio, a3);
}

- (VSStreamAudioData)streamAudio
{
  return self->_streamAudio;
}

- (void)setStreamAudio:(id)a3
{
  objc_storeStrong((id *)&self->_streamAudio, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)setTaskAuxiliaryQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskAuxiliaryQueue, a3);
}

- (OS_dispatch_semaphore)neuralPlaybackSemaphore
{
  return self->_neuralPlaybackSemaphore;
}

- (void)setNeuralPlaybackSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_neuralPlaybackSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_neuralPlaybackSemaphore, 0);
  objc_storeStrong((id *)&self->_taskAuxiliaryQueue, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_streamAudio, 0);
  objc_storeStrong((id *)&self->_compressedAudio, 0);
  objc_storeStrong((id *)&self->_phonemes, 0);
  objc_storeStrong((id *)&self->_speechCache, 0);
  objc_storeStrong((id *)&self->_siriInstrumentation, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_prewarmService, 0);
  objc_storeStrong((id *)&self->_cachingService, 0);
  objc_storeStrong((id *)&self->_voiceResource, 0);
  objc_storeStrong((id *)&self->_voiceSelection, 0);
  objc_storeStrong((id *)&self->_playbackService, 0);
  objc_storeStrong((id *)&self->_voiceBooster, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timingInfos, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __47__VSSpeechSpeakTask_setObserverForWordTimings___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "textRange");
    objc_msgSend(v5, "speechRequest:didStartWithMark:forRange:", v6, 1, v7, v8);

  }
}

void __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  uint8_t v6[16];

  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21AA84000, v2, OS_LOG_TYPE_INFO, "Holding audio playback before we get fast synthesis.", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "neuralPlaybackSemaphore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "neuralPlaybackSemaphore");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v4, v5);

  }
}

id __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  uint64_t v33;
  double v34;
  double v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  _QWORD block[5];
  id v50;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (v4 == 3)
  {
    v7 = mach_absolute_time();
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSynthesisEndTimestamp:", v7);

    if ((objc_msgSend(v3, "neuralDidFallback") & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v3, "hasAudioClick");
    objc_msgSend(*(id *)(a1 + 32), "setSynthesisHasIssue:", v9);
    v10 = objc_msgSend(v3, "numOfPromptsTriggered");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPromptCount:", v10);

    kdebug_trace();
    objc_msgSend(*(id *)(a1 + 32), "timingInfos");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(v3, "wordTimingInfos");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setTimingInfos:", v13);

      v14 = (void *)MEMORY[0x24BEC0E10];
      objc_msgSend(*(id *)(a1 + 32), "timingInfos");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contextInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "adjustWordTimingInfo:forContext:", v15, v17);

    }
    v18 = *(void **)(a1 + 32);
    objc_msgSend(v18, "timingInfos");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObserverForWordTimings:", v19);

    objc_msgSend(v3, "phonemes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPhonemes:", v20);

    objc_msgSend(*(id *)(a1 + 32), "reportTimingInfo");
    v21 = objc_msgSend(v3, "hasAlignmentStall");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeuralAlignmentStall:", v21);

    v23 = objc_msgSend(v3, "hasAudioClick");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNeuralAudioClick:", v23);

    v25 = objc_msgSend(v3, "neuralDidFallback");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNeuralFallback:", v25);

  }
  else if (v4 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
LABEL_14:

      goto LABEL_15;
    }
    v27 = (void *)MEMORY[0x220750BF4]();
    objc_msgSend(v3, "mutablePCMData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "voiceBooster");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "processData:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      v6 = v30;

      objc_autoreleasePoolPop(v27);
      goto LABEL_14;
    }
    objc_msgSend(*(id *)(a1 + 32), "neuralPlaybackSemaphore");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      v33 = mach_absolute_time();
      v34 = (double)(unint64_t)objc_msgSend(v28, "length") / (double)*(unint64_t *)(a1 + 48);
      VSAbsoluteTimeToSecond();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v33;
      if (v34 / v35 > 1.2)
      {
        objc_msgSend(*(id *)(a1 + 32), "neuralPlaybackSemaphore");
        v36 = objc_claimAutoreleasedReturnValue();
        dispatch_semaphore_signal(v36);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "streamAudio");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "appendAudioData:packetCount:packetDescriptions:", v28, 0, 0);

    objc_msgSend(*(id *)(a1 + 32), "taskAuxiliaryQueue");
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_2;
    block[3] = &unk_24DD8EDB0;
    block[4] = *(_QWORD *)(a1 + 32);
    v50 = v28;
    v40 = v28;
    dispatch_async(v38, block);

    objc_autoreleasePoolPop(v27);
    objc_msgSend(*(id *)(a1 + 32), "taskAuxiliaryQueue");
    v41 = objc_claimAutoreleasedReturnValue();
    v48[0] = v39;
    v48[1] = 3221225472;
    v48[2] = __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_3;
    v48[3] = &unk_24DD8EBB0;
    v48[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v41, v48);

    objc_msgSend(*(id *)(a1 + 32), "timingInfos");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      v43 = objc_alloc(MEMORY[0x24BDBCE30]);
      objc_msgSend(v3, "wordTimingInfos");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v43, "initWithArray:copyItems:", v44, 1);

      v45 = (void *)MEMORY[0x24BEC0E10];
      objc_msgSend(*(id *)(a1 + 32), "request");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "contextInfo");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "adjustWordTimingInfo:forContext:", v42, v47);

    }
    objc_msgSend(*(id *)(a1 + 32), "setObserverForWordTimings:", v42);

  }
  v6 = 0;
LABEL_15:

  return v6;
}

void __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "playbackService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueue:packetCount:packetDescriptions:", *(_QWORD *)(a1 + 40), 0, 0);

}

uint64_t __39__VSSpeechSpeakTask_synthesizeAndSpeak__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reportSpeechStart");
}

void __27__VSSpeechSpeakTask_cancel__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "playbackService");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stop");

}

void __25__VSSpeechSpeakTask_main__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSSpeakTaskTailSpinDumpInProgress = 0;
  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_INFO, "Finished tail spin, success:%d, file: %@", (uint8_t *)v6, 0x12u);
  }

}

- (void)prepareForSynthesis
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  VSStreamAudioData *v18;
  VSStreamAudioData *v19;
  void *v20;
  double v21;
  void *v22;
  float v23;
  void *v24;
  double v25;
  void *v26;
  float v27;
  void *v28;
  double v29;
  void *v30;
  float v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  VSVoiceBooster *v41;
  VSVoiceBooster *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  int v47;
  void *v48;
  double v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  _BYTE v53[40];
  uint8_t buf[4];
  id v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceOfTTS:", 1);

  +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExperimentIdentifier:", v5);

  -[VSSpeechSpeakTask prewarmService](self, "prewarmService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedEngineForVoice:resources:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
    goto LABEL_5;
  }
  -[VSSpeechSpeakTask prewarmService](self, "prewarmService");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "loadEngineForVoice:resources:", v16, v17);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
LABEL_5:
    objc_msgSend(v12, "setIsWarmStart:", v14);

    v18 = [VSStreamAudioData alloc];
    objc_msgSend(v11, "asbd");
    v19 = -[VSStreamAudioData initWithASBD:](v18, "initWithASBD:", v53);
    -[VSSpeechSpeakTask setStreamAudio:](self, "setStreamAudio:", v19);

    -[VSSpeechSpeakTask request](self, "request");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "volume");
    if (v21 == 0.0)
    {
      -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "volume");
      if (v23 == 0.0)
        objc_msgSend(v11, "volume");
      objc_msgSend(v11, "setVolume:");

    }
    else
    {
      *(float *)&v21 = v21;
      objc_msgSend(v11, "setVolume:", v21);
    }

    -[VSSpeechSpeakTask request](self, "request");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pitch");
    if (v25 == 0.0)
    {
      -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pitch");
      if (v27 == 0.0)
        objc_msgSend(v11, "pitch");
      objc_msgSend(v11, "setPitch:");

    }
    else
    {
      *(float *)&v25 = v25;
      objc_msgSend(v11, "setPitch:", v25);
    }

    -[VSSpeechSpeakTask request](self, "request");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rate");
    if (v29 == 0.0)
    {
      -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "rate");
      if (v31 == 0.0)
        objc_msgSend(v11, "rate");
      objc_msgSend(v11, "setRate:");

    }
    else
    {
      *(float *)&v29 = v29;
      objc_msgSend(v11, "setRate:", v29);
    }

    -[VSSpeechSpeakTask request](self, "request");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "powerProfile");

    if (v33)
      goto LABEL_30;
    v34 = objc_alloc_init(MEMORY[0x24BE09260]);
    v52 = 0;
    objc_msgSend(v34, "currentPowerPolicyWithError:", &v52);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v52;
    if (v35)
    {
      objc_msgSend(v35, "ttsPolicy");
      if (v51 <= 2)
      {
        v33 = qword_21AACEDB8[v51];
LABEL_29:

LABEL_30:
        objc_msgSend(v11, "setPowerProfile:", v33);
        v41 = [VSVoiceBooster alloc];
        objc_msgSend(v11, "asbd");
        v42 = -[VSVoiceBooster initWithStreamDescription:pcmBufferSize:](v41, "initWithStreamDescription:pcmBufferSize:", &v50, objc_msgSend(v11, "pcmBufferSize"));
        -[VSSpeechSpeakTask setVoiceBooster:](self, "setVoiceBooster:", v42);

        -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "voiceData");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSpeechSpeakTask request](self, "request");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "volume");
        objc_msgSend(v44, "gainDecibelWithVolume:");
        v47 = v46;
        -[VSSpeechSpeakTask voiceBooster](self, "voiceBooster");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v49) = v47;
        objc_msgSend(v48, "setVoiceBoostGainDecibels:", v49);

        -[VSSpeechSpeakTask setEngine:](self, "setEngine:", v11);
        goto LABEL_31;
      }
    }
    else
    {
      VSGetLogDefault();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v36;
        _os_log_error_impl(&dword_21AA84000, v40, OS_LOG_TYPE_ERROR, "Unable to get power policy from Siri, error: %@", buf, 0xCu);
      }

    }
    v33 = 0;
    goto LABEL_29;
  }
  v37 = (void *)MEMORY[0x24BDD1540];
  v56 = *MEMORY[0x24BDD0FD8];
  v57[0] = CFSTR("Can't create VSSpeechEngine");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 0, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask setError:](self, "setError:", v39);

  v11 = 0;
LABEL_31:

}

- (void)speakCachedAudio
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = mach_absolute_time();
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSynthesisBeginTimestamp:", v3);

  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "synthesisBeginTimestamp");
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSynthesisEndTimestamp:", v6);

  -[VSSpeechSpeakTask speechCache](self, "speechCache");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "audio");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask setCompressedAudio:](self, "setCompressedAudio:", v8);

  objc_msgSend(v17, "timingInfos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask setTimingInfos:](self, "setTimingInfos:", v9);

  -[VSSpeechSpeakTask request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask startPlaybackServiceWithAudioSessionID:](self, "startPlaybackServiceWithAudioSessionID:", objc_msgSend(v10, "audioSessionID"));

  -[VSSpeechSpeakTask taskAuxiliaryQueue](self, "taskAuxiliaryQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v11, &__block_literal_global_3232);

  if ((-[VSSpeechSpeakTask isCancelled](self, "isCancelled") & 1) == 0)
  {
    -[VSSpeechSpeakTask error](self, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[VSSpeechSpeakTask reportSpeechStart](self, "reportSpeechStart");
      objc_msgSend(v17, "timingInfos");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask setObserverForWordTimings:](self, "setObserverForWordTimings:", v13);

      -[VSSpeechSpeakTask playbackService](self, "playbackService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "flushAndStop");

      -[VSSpeechSpeakTask playbackService](self, "playbackService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "error");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask setError:](self, "setError:", v16);

    }
  }

}

- (void)startPlaybackServiceWithAudioSessionID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  VSAudioPlaybackService *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  VSAudioPlaybackService *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  double v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD block[5];
  _OWORD v35[2];
  uint64_t v36;
  uint8_t buf[8];
  uint64_t v38;
  _QWORD v39[2];

  v3 = *(_QWORD *)&a3;
  v39[1] = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask playbackService](self, "playbackService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_21AA84000, v6, OS_LOG_TYPE_DEBUG, "playbackService is initialized already.", buf, 2u);
    }

  }
  else
  {
    kdebug_trace();
    v7 = [VSAudioPlaybackService alloc];
    -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
    else
      -[VSSpeechSpeakTask compressedAudio](self, "compressedAudio");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "asbd");
    }
    else
    {
      v36 = 0;
      memset(v35, 0, sizeof(v35));
    }
    -[VSSpeechSpeakTask request](self, "request");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[VSAudioPlaybackService initWithAudioSessionID:asbd:useAVSBAR:](v7, "initWithAudioSessionID:asbd:useAVSBAR:", v3, v35, v12 != 0);
    -[VSSpeechSpeakTask setPlaybackService:](self, "setPlaybackService:", v13);

    -[VSSpeechSpeakTask playbackService](self, "playbackService");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outputRouteInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "audioRouteName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setAudioOutputRoute:", v16);

    -[VSSpeechSpeakTask playbackService](self, "playbackService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      -[VSSpeechSpeakTask taskAuxiliaryQueue](self, "taskAuxiliaryQueue");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke;
      block[3] = &unk_24DD8EBB0;
      block[4] = self;
      dispatch_async(v19, block);

      -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "duration");
      v23 = v22;

      if (v23 <= 0.0)
      {
        -[VSSpeechSpeakTask compressedAudio](self, "compressedAudio");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "duration");
        v31 = v30;

        if (v31 <= 0.0)
          return;
        -[VSSpeechSpeakTask taskAuxiliaryQueue](self, "taskAuxiliaryQueue");
        v24 = objc_claimAutoreleasedReturnValue();
        v32[0] = v20;
        v32[1] = 3221225472;
        v32[2] = __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_3;
        v32[3] = &unk_24DD8EBB0;
        v32[4] = self;
        dispatch_async(v24, v32);
      }
      else
      {
        -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
        v24 = objc_claimAutoreleasedReturnValue();
        v33[0] = v20;
        v33[1] = 3221225472;
        v33[2] = __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_24;
        v33[3] = &unk_24DD8EC00;
        v33[4] = self;
        -[NSObject enumerateAudioWithBlock:](v24, "enumerateAudioWithBlock:", v33);
      }

    }
    else
    {
      VSGetLogDefault();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v25, OS_LOG_TYPE_ERROR, "Can't create VSAudioPlaybackService", buf, 2u);
      }

      v26 = (void *)MEMORY[0x24BDD1540];
      v38 = *MEMORY[0x24BDD0FD8];
      v39[0] = CFSTR("Can't create VSAudioPlaybackService");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 0, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask setError:](self, "setError:", v28);

    }
  }
}

- (void)waitUntilAudioFinished
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[VSSpeechSpeakTask taskAuxiliaryQueue](self, "taskAuxiliaryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v3, &__block_literal_global_26);

  -[VSSpeechSpeakTask playbackService](self, "playbackService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flushAndStop");

  -[VSSpeechSpeakTask error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[VSSpeechSpeakTask playbackService](self, "playbackService");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask setError:](self, "setError:", v6);

  }
}

- (void)pausePlayback
{
  NSObject *v3;
  _QWORD block[5];

  -[VSSpeechSpeakTask taskAuxiliaryQueue](self, "taskAuxiliaryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__VSSpeechSpeakTask_Utilities__pausePlayback__block_invoke;
  block[3] = &unk_24DD8EBB0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)resumePlayback
{
  NSObject *v3;
  _QWORD block[5];

  -[VSSpeechSpeakTask taskAuxiliaryQueue](self, "taskAuxiliaryQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__VSSpeechSpeakTask_Utilities__resumePlayback__block_invoke;
  block[3] = &unk_24DD8EBB0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (void)fetchVoiceResource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectVoiceResourceAssetForLanguage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask setVoiceResource:](self, "setVoiceResource:", v6);

  -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVoiceResourceAssetKey:", v7);

}

- (void)fetchVoiceAsset
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask _fetchVoiceAsset_NoRetry](self, "_fetchVoiceAsset_NoRetry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask setError:](self, "setError:", v3);

  -[VSSpeechSpeakTask error](self, "error");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[VSSpeechSpeakTask error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "code");

    if (v7 == 402)
    {
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.voiceservices.notification.voice-update"), "UTF8String"));
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_21AA84000, v8, OS_LOG_TYPE_INFO, "Reset MobileAsset query cache and retry selecting voice", (uint8_t *)&v16, 2u);
      }

      objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resetCache");

      -[VSSpeechSpeakTask _fetchVoiceAsset_NoRetry](self, "_fetchVoiceAsset_NoRetry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSpeechSpeakTask setError:](self, "setError:", v10);

    }
  }
  VSGetLogDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "requestCreatedTimestamp");
    -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "voiceData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218242;
    v17 = v13;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_INFO, "Task %llu fetched voice %@", (uint8_t *)&v16, 0x16u);

  }
}

- (id)_fetchVoiceAsset_NoRetry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  const __CFString **v19;
  uint64_t *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;
  const __CFString *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "voiceType");
  -[VSSpeechSpeakTask request](self, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "gender");
  -[VSSpeechSpeakTask request](self, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectVoiceForLang:name:type:gender:footprint:", v4, v6, v8, v10, objc_msgSend(v11, "footprint"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    VSGetLogDefault();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21AA84000, v21, OS_LOG_TYPE_ERROR, "No voice available", buf, 2u);
    }

    v17 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    v44[0] = CFSTR("No voice available");
    v18 = (void *)MEMORY[0x24BDBCE70];
    v19 = (const __CFString **)v44;
    v20 = &v43;
    goto LABEL_10;
  }
  -[VSSpeechSpeakTask request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "disableCompactVoiceFallback") & 1) != 0)
  {
    objc_msgSend(v12, "voiceData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "footprint");

    if (v15 == 1)
    {
      VSGetLogDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v16, OS_LOG_TYPE_ERROR, "Compact voice is explicitly disabled.", buf, 2u);
      }

      v17 = (void *)MEMORY[0x24BDD1540];
      v41 = *MEMORY[0x24BDD0FC8];
      v42 = CFSTR("Compact voice is explicitly disabled.");
      v18 = (void *)MEMORY[0x24BDBCE70];
      v19 = &v42;
      v20 = &v41;
LABEL_10:
      objc_msgSend(v18, "dictionaryWithObjects:forKeys:count:", v19, v20, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v17;
      v24 = 401;
LABEL_17:
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), v24, v22);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "voicePath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "fileExistsAtPath:", v26);

  if ((v27 & 1) == 0)
  {
    VSGetLogDefault();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "voicePath");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v40 = v35;
      _os_log_error_impl(&dword_21AA84000, v32, OS_LOG_TYPE_ERROR, "Voice is deleted at path '%@'", buf, 0xCu);

    }
    v33 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0FC8];
    v38 = CFSTR("Voice is deleted already.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v33;
    v24 = 402;
    goto LABEL_17;
  }
  -[VSSpeechSpeakTask setVoiceSelection:](self, "setVoiceSelection:", v12);
  -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "key");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setVoiceAssetKey:", v29);

  v31 = 0;
LABEL_18:

  return v31;
}

- (void)logFinish
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  const __CFString *v12;
  _BOOL4 v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  double v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  float v24;
  void *v25;
  double v26;
  float v27;
  void *v28;
  double v29;
  float v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  _BOOL8 v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  int v39;
  uint64_t v40;
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
  void *v51;
  void *v52;
  const __CFString *v53;
  const __CFString *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[7];
  _QWORD v66[7];
  uint8_t buf[4];
  uint64_t v68;
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  const __CFString *v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask error](self, "error");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[VSSpeechSpeakTask error](self, "error"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "code"),
        v5,
        v4,
        v6 != 400))
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "requestCreatedTimestamp");
      -[VSSpeechSpeakTask error](self, "error");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v68 = v22;
      v69 = 2112;
      v70 = v23;
      _os_log_error_impl(&dword_21AA84000, v8, OS_LOG_TYPE_ERROR, "Error in device task %llu, error: %@", buf, 0x16u);

    }
  }
  else
  {
    -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "voiceData");
    v8 = objc_claimAutoreleasedReturnValue();

    -[VSSpeechSpeakTask voiceResource](self, "voiceResource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    VSGetLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v62, "requestCreatedTimestamp");
      v11 = -[VSSpeechSpeakTask isCancelled](self, "isCancelled");
      v12 = CFSTR("Finished");
      if (v11)
        v12 = CFSTR("Cancelled");
      v54 = v12;
      v13 = -[VSSpeechSpeakTask isSpeaking](self, "isSpeaking");
      v14 = CFSTR("synthesizing");
      if (v13)
        v14 = CFSTR("speaking");
      v53 = v14;
      -[VSSpeechSpeakTask request](self, "request");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "logUtterance");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = CFSTR("voice");
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "voiceAssetKey");
      v15 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v59 = (__CFString *)v15;
      if (!v15)
      {
        -[NSObject voiceKey](v8, "voiceKey");
        v16 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v16;
        if (v16)
          v15 = (const __CFString *)v16;
        else
          v15 = CFSTR("(null)");
      }
      v66[0] = v15;
      v65[1] = CFSTR("voice_resource");
      objc_msgSend(v9, "key");
      v17 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v17;
      if (v17)
        v18 = (const __CFString *)v17;
      else
        v18 = CFSTR("(null)");
      v66[1] = v18;
      v65[2] = CFSTR("rate");
      v19 = (void *)MEMORY[0x24BDD16E0];
      -[VSSpeechSpeakTask speechCache](self, "speechCache");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      if (v57)
      {
        -[VSSpeechSpeakTask request](self, "request");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "rate");
      }
      else
      {
        -[VSSpeechSpeakTask engine](self, "engine");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "rate");
        v20 = v24;
      }
      objc_msgSend(v19, "numberWithDouble:", v20);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v66[2] = v52;
      v65[3] = CFSTR("pitch");
      v25 = (void *)MEMORY[0x24BDD16E0];
      -[VSSpeechSpeakTask speechCache](self, "speechCache");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (v51)
      {
        -[VSSpeechSpeakTask request](self, "request");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "pitch");
      }
      else
      {
        -[VSSpeechSpeakTask engine](self, "engine");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "pitch");
        v26 = v27;
      }
      objc_msgSend(v25, "numberWithDouble:", v26);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v66[3] = v49;
      v65[4] = CFSTR("volume");
      v28 = (void *)MEMORY[0x24BDD16E0];
      -[VSSpeechSpeakTask speechCache](self, "speechCache");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v9;
      if (v48)
      {
        -[VSSpeechSpeakTask request](self, "request");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "volume");
      }
      else
      {
        -[VSSpeechSpeakTask engine](self, "engine");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "volume");
        v29 = v30;
      }
      objc_msgSend(v28, "numberWithDouble:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v66[4] = v31;
      v65[5] = CFSTR("isEager");
      v32 = (void *)MEMORY[0x24BDD16E0];
      v33 = -[VSSpeechSpeakTask isSpeaking](self, "isSpeaking");
      if (v33)
      {
        -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v45, "eagerRequestCreatedTimestampDiffs") > 0;
      }
      else
      {
        v34 = 0;
      }
      objc_msgSend(v32, "numberWithInt:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v66[5] = v35;
      v65[6] = CFSTR("neuralIssue");
      v36 = (void *)MEMORY[0x24BDD16E0];
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "neuralAlignmentStall");
      if ((v38 & 1) != 0)
      {
        v39 = 0;
        v40 = 1;
      }
      else
      {
        -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v44, "neuralAudioClick") & 1) != 0)
        {
          v39 = 0;
          v40 = 1;
        }
        else
        {
          -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v43, "neuralFallback");
          v39 = 1;
        }
      }
      objc_msgSend(v36, "numberWithInt:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v66[6] = v41;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v66, v65, 7);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v68 = v55;
      v69 = 2112;
      v70 = v54;
      v71 = 2112;
      v72 = v53;
      v73 = 2112;
      v74 = v64;
      v75 = 2114;
      v76 = v42;
      _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_DEFAULT, "Device task %llu: %@ %@ utterance: '%@', %{public}@", buf, 0x34u);

      if (v39)
      if ((v38 & 1) == 0)

      if (v33)
      if (!v59)

      v9 = v63;
    }

  }
}

- (void)enqueueCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[VSSpeechSpeakTask taskHash](self, "taskHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSSpeechSpeakTask cachingService](self, "cachingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VSSpeechSpeakTask streamAudio](self, "streamAudio");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask timingInfos](self, "timingInfos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "voiceAssetKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "voiceResourceAssetKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueCacheWithHash:streamAudio:timingInfo:voiceKey:voiceResourceKey:completion:", v3, v6, v7, v9, v11, 0);

    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134218242;
      v22 = objc_msgSend(v13, "requestCreatedTimestamp");
      v23 = 2112;
      v24 = v3;
      v14 = "Cached streamAudio in task %llu with hash %@ in memory";
LABEL_6:
      _os_log_impl(&dword_21AA84000, v12, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v21, 0x16u);

    }
  }
  else
  {
    -[VSSpeechSpeakTask compressedAudio](self, "compressedAudio");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask timingInfos](self, "timingInfos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "voiceAssetKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "voiceResourceAssetKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueCacheWithHash:audio:timingInfo:voiceKey:voiceResourceKey:completion:", v3, v15, v16, v18, v20, 0);

    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134218242;
      v22 = objc_msgSend(v13, "requestCreatedTimestamp");
      v23 = 2112;
      v24 = v3;
      v14 = "Cached audio in task %llu with hash %@ in memory";
      goto LABEL_6;
    }
  }

}

void __46__VSSpeechSpeakTask_Utilities__resumePlayback__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "playbackService");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "start");

    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      objc_msgSend(*(id *)(a1 + 32), "playbackService");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stop");

    }
  }
}

void __45__VSSpeechSpeakTask_Utilities__pausePlayback__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "playbackService");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pause");

}

void __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "audioStartTimestampDiffs");

  if (!v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      kdebug_trace();
    }
    else
    {
      VSGetLogDefault();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v11 = 0;
        _os_log_debug_impl(&dword_21AA84000, v4, OS_LOG_TYPE_DEBUG, "Starting AudioQueue", v11, 2u);
      }

      v5 = mach_absolute_time();
      objc_msgSend(*(id *)(a1 + 32), "playbackService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setError:", v7);

      v8 = mach_absolute_time() - v5;
      objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAudioStartTimestampDiffs:", v8);

      kdebug_trace();
      if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
      {
        objc_msgSend(*(id *)(a1 + 32), "playbackService");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stop");

      }
    }
  }
}

void __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_24(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;

  v7 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "taskAuxiliaryQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_2;
  v12[3] = &unk_24DD8EBD8;
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v8;
  v15 = a3;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, v12);

}

void __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "playbackService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "compressedAudio");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "compressedAudio");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "packetCount");
  objc_msgSend(*(id *)(a1 + 32), "compressedAudio");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "packetDescriptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueue:packetCount:packetDescriptions:", v3, v5, v7);

}

void __71__VSSpeechSpeakTask_Utilities__startPlaybackServiceWithAudioSessionID___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "playbackService");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enqueue:packetCount:packetDescriptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

@end
