@implementation VSSiriInlineTTSStreamTask

- (VSSiriInlineTTSStreamTask)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (VSSiriInlineTTSStreamTask)initWithRequest:(id)a3 withStreamID:(id)a4
{
  id v7;
  id v8;
  VSSiriInlineTTSStreamTask *v9;
  VSSiriInlineTTSStreamTask *v10;
  VSInstrumentMetrics *v11;
  VSInstrumentMetrics *instrumentMetrics;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSString *streamID;
  uint64_t v19;
  NSMutableArray *finalTimingInfo;
  NSCondition *v21;
  NSCondition *refreshTimeoutCondition;
  void *v23;
  float v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  VSDeviceTTSCore *v29;
  VSDeviceTTSCore *deviceTTSCore;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  NSString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)VSSiriInlineTTSStreamTask;
  v9 = -[VSSiriInlineTTSStreamTask init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_streamID, a4);
    v11 = (VSInstrumentMetrics *)objc_alloc_init(MEMORY[0x24BEC0D88]);
    instrumentMetrics = v10->_instrumentMetrics;
    v10->_instrumentMetrics = v11;

    if (objc_msgSend(v7, "requestCreatedTimestamp"))
    {
      v13 = objc_msgSend(v7, "requestCreatedTimestamp");
    }
    else
    {
      VSGetLogDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v14, OS_LOG_TYPE_ERROR, "Using timestamp inside voiced for Stream task", buf, 2u);
      }

      v13 = mach_absolute_time();
    }
    -[VSInstrumentMetrics setRequestCreatedTimestamp:](v10->_instrumentMetrics, "setRequestCreatedTimestamp:", v13);
    VSGetLogDefault();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[VSSiriInlineTTSStreamTask instrumentMetrics](v10, "instrumentMetrics");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "requestCreatedTimestamp");
      streamID = v10->_streamID;
      *(_DWORD *)buf = 134218242;
      v34 = v17;
      v35 = 2112;
      v36 = streamID;
      _os_log_impl(&dword_21AA84000, v15, OS_LOG_TYPE_INFO, "Created Stream task %llu: streamID %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    finalTimingInfo = v10->_finalTimingInfo;
    v10->_finalTimingInfo = (NSMutableArray *)v19;

    v21 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    refreshTimeoutCondition = v10->_refreshTimeoutCondition;
    v10->_refreshTimeoutCondition = v21;

    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "serverTTSTimeout");
    if (v24 == 0.0)
    {
      +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clientBundleIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeoutForAppId:", v26);
      v10->_timeoutValue = v27;

    }
    else
    {
      v10->_timeoutValue = v24;
    }

    -[VSInstrumentMetrics setCanUseServerTTS:](v10->_instrumentMetrics, "setCanUseServerTTS:", objc_msgSend(v7, "canUseServerTTS"));
    -[VSInstrumentMetrics setIsServerStreamTTS:](v10->_instrumentMetrics, "setIsServerStreamTTS:", 1);
    -[VSInstrumentMetrics setIsServerTTS:](v10->_instrumentMetrics, "setIsServerTTS:", 1);
    -[VSInstrumentMetrics setIsSpeechRequest:](v10->_instrumentMetrics, "setIsSpeechRequest:", 1);
    -[VSInstrumentMetrics setSourceOfTTS:](v10->_instrumentMetrics, "setSourceOfTTS:", 3);
    objc_msgSend(v7, "clientBundleIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSInstrumentMetrics setClientBundleIdentifier:](v10->_instrumentMetrics, "setClientBundleIdentifier:", v28);

    v29 = -[VSDeviceTTSCore initWithRequest:]([VSDeviceTTSCore alloc], "initWithRequest:", v7);
    deviceTTSCore = v10->_deviceTTSCore;
    v10->_deviceTTSCore = v29;

    -[VSDeviceTTSCore setDelegate:](v10->_deviceTTSCore, "setDelegate:", v10);
    -[VSDeviceTTSCore setInstrumentMetrics:](v10->_deviceTTSCore, "setInstrumentMetrics:", v10->_instrumentMetrics);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  +[VSInlineStreamService sharedService](VSInlineStreamService, "sharedService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask streamID](self, "streamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeStreamId:", v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)VSSiriInlineTTSStreamTask;
  -[VSSiriInlineTTSStreamTask dealloc](&v6, sel_dealloc);
}

- (void)handleStreamNotification:(id)a3
{
  id v4;
  void *v5;
  double v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  char v14;
  char v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioDuration");
  if (v6 <= 0.8)
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "simulateNetworkStall");

    if (v8)
    {
      VSGetLogDefault();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v4, "object");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_21AA84000, v9, OS_LOG_TYPE_INFO, "Simulate network stall is on, ignore object %@", (uint8_t *)&v16, 0xCu);
LABEL_5:

      goto LABEL_15;
    }
  }
  objc_msgSend(v4, "object");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "object");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    -[VSSiriInlineTTSStreamTask handleBegin:](self, "handleBegin:", v13);
  }
  else
  {
    objc_opt_class();
    v14 = objc_opt_isKindOfClass();

    objc_msgSend(v4, "object");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v14 & 1) != 0)
    {
      -[VSSiriInlineTTSStreamTask handleChunk:](self, "handleChunk:", v13);
    }
    else
    {
      objc_opt_class();
      v15 = objc_opt_isKindOfClass();

      if ((v15 & 1) == 0)
      {
        VSGetLogDefault();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        objc_msgSend(v4, "object");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v10;
        _os_log_error_impl(&dword_21AA84000, v9, OS_LOG_TYPE_ERROR, "Unknown streaming object: %@", (uint8_t *)&v16, 0xCu);
        goto LABEL_5;
      }
      objc_msgSend(v4, "object");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask handleEnd:](self, "handleEnd:", v13);
    }
  }

LABEL_16:
}

- (void)handleBegin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  VSAudioPlaybackService *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  VSAudioPlaybackService *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
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
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  _OWORD v51[2];
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "speechSynthesisVoice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask setStreamingVoice:](self, "setStreamingVoice:", v5);

  objc_msgSend(v4, "speechSynthesisResource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask setStreamingResource:](self, "setStreamingResource:", v6);

  VSGetLogDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "streamId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decoderStreamDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "vsDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v59 = (uint64_t)v8;
    v60 = 2112;
    v61 = v9;
    v62 = 2112;
    v63 = v11;
    _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_INFO, "Handle stream begin with streamId: %@, text: %@, decoder: %@", buf, 0x20u);

  }
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "streamBufferDuration");
  if (v13 == 0.0)
    objc_msgSend(v4, "streamingPlaybackBufferSize");
  -[VSSiriInlineTTSStreamTask setBufferDurationLimit:](self, "setBufferDurationLimit:", v13);

  v14 = objc_alloc_init(MEMORY[0x24BEC0D78]);
  -[VSSiriInlineTTSStreamTask setServerAudio:](self, "setServerAudio:", v14);

  v15 = (void *)MEMORY[0x24BEC0D78];
  objc_msgSend(v4, "decoderStreamDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "asbdFromDescription:", v16);
  -[VSSiriInlineTTSStreamTask serverAudio](self, "serverAudio");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v53;
  v51[1] = v54;
  v52 = v55;
  objc_msgSend(v17, "setAsbd:", v51);

  v18 = [VSAudioPlaybackService alloc];
  -[VSSiriInlineTTSStreamTask request](self, "request");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "audioSessionID");
  -[VSSiriInlineTTSStreamTask serverAudio](self, "serverAudio");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    objc_msgSend(v21, "asbd");
  }
  else
  {
    v50 = 0;
    v48 = 0u;
    v49 = 0u;
  }
  -[VSSiriInlineTTSStreamTask request](self, "request", v48, v49, v50);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "accessoryID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[VSAudioPlaybackService initWithAudioSessionID:asbd:useAVSBAR:](v18, "initWithAudioSessionID:asbd:useAVSBAR:", v20, &v48, v24 != 0);

  -[VSSiriInlineTTSStreamTask error](self, "error");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {

  }
  else
  {
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "errorCode");

    if (!v28)
    {
      -[VSSiriInlineTTSStreamTask setPlaybackServices:](self, "setPlaybackServices:", v25);
      objc_msgSend(v4, "text");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setUtterance:", v30);

      objc_msgSend(v4, "speechSynthesisVoice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "vsDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setVoiceAssetKey:", v33);

      objc_msgSend(v4, "speechSynthesisResource");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "vsDescription");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setVoiceResourceAssetKey:", v36);

      -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "outputRouteInfo");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "audioRouteName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setAudioOutputRoute:", v40);

      -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
        goto LABEL_13;
      v43 = (void *)MEMORY[0x24BDD1540];
      v56 = *MEMORY[0x24BDD0FC8];
      v57 = CFSTR("Unable to create playback service");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 450, v29);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask signalNewDataWithError:](self, "signalNewDataWithError:", v44);
      goto LABEL_19;
    }
  }
  VSGetLogDefault();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    -[VSSiriInlineTTSStreamTask error](self, "error");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "code");
    if (v45)
    {
      *(_DWORD *)buf = 134217984;
      v59 = v45;
      _os_log_error_impl(&dword_21AA84000, v29, OS_LOG_TYPE_ERROR, "Ignoring stream begin: error already occurred: %ld", buf, 0xCu);
    }
    else
    {
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "errorCode");
      *(_DWORD *)buf = 134217984;
      v59 = v47;
      _os_log_error_impl(&dword_21AA84000, v29, OS_LOG_TYPE_ERROR, "Ignoring stream begin: error already occurred: %ld", buf, 0xCu);

    }
LABEL_19:

  }
LABEL_13:

}

- (void)handleChunk:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
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
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  _OWORD v54[2];
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "streamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v66 = v6;
    _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_INFO, "Handle stream chunk with streamId: %@", buf, 0xCu);

  }
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "serverFirstPacketTimestamp");

  if (!v8)
  {
    v9 = mach_absolute_time();
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setServerFirstPacketTimestamp:", v9);

  }
  v11 = mach_absolute_time();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setServerLastPacketTimestamp:", v11);

  v13 = objc_alloc_init(MEMORY[0x24BEC0D78]);
  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
    objc_msgSend(v14, "asbd");

    if (DWORD2(v62) == 1819304813)
    {
      objc_msgSend(v4, "audioData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "populateWithPCMData:", v16);
      goto LABEL_12;
    }
  }
  else
  {
    v64 = 0;
    v62 = 0u;
    v63 = 0u;
  }
  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v61 = 0;
    v59 = 0u;
    v60 = 0u;
    goto LABEL_15;
  }
  v18 = v17;
  objc_msgSend(v17, "asbd");

  if (DWORD2(v59) != 1869641075)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 451, MEMORY[0x24BDBD1B8]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSiriInlineTTSStreamTask signalNewDataWithError:](self, "signalNewDataWithError:", v21);
LABEL_27:

    goto LABEL_28;
  }
  objc_msgSend(v4, "audioData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "populateWithOpusData:", v16);
LABEL_12:

  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    objc_msgSend(v19, "asbd");
  }
  else
  {
    v58 = 0;
    v56 = 0u;
    v57 = 0u;
  }
  v54[0] = v56;
  v54[1] = v57;
  v55 = v58;
  objc_msgSend(v13, "setAsbd:", v54);

  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "audioData");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v13, "packetCount");
  objc_msgSend(v13, "packetDescriptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "enqueue:packetCount:packetDescriptions:", v23, v24, v25);

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "duration");
  v28 = v27;
  objc_msgSend(v26, "audioDuration");
  objc_msgSend(v26, "setAudioDuration:", v28 + v29);

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "audioDuration");
  v32 = v31;
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setServerStreamedAudioDuration:", v32);

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "audioDuration");
  v36 = v35;
  -[VSSiriInlineTTSStreamTask bufferDurationLimit](self, "bufferDurationLimit");
  if (v36 < v37)
  {

    goto LABEL_20;
  }
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "speechBeginTimestamp");

  if (v39)
  {
LABEL_20:
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "speechBeginTimestamp");

    if (v41)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask playbackBeginDate](self, "playbackBeginDate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "timeIntervalSinceDate:", v43);
      v45 = v44;

      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "audioDuration");
      v48 = v47 - v45;

      -[VSSiriInlineTTSStreamTask setTimeoutValue:](self, "setTimeoutValue:", v48);
    }
    goto LABEL_25;
  }
  VSGetLogDefault();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AA84000, v49, OS_LOG_TYPE_INFO, "Reached buffer threshold. Start playing audio.", buf, 2u);
  }

  -[VSSiriInlineTTSStreamTask startPlayback](self, "startPlayback");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask setPlaybackBeginDate:](self, "setPlaybackBeginDate:", v50);

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "audioDuration");
  -[VSSiriInlineTTSStreamTask setTimeoutValue:](self, "setTimeoutValue:");

LABEL_25:
  -[VSSiriInlineTTSStreamTask signalNewDataWithError:](self, "signalNewDataWithError:", 0);
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "enableAudioDump");

  if (v53)
  {
    -[VSSiriInlineTTSStreamTask serverAudio](self, "serverAudio");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "concatenateWithAudio:", v13);
    goto LABEL_27;
  }
LABEL_28:

}

- (void)handleEnd:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "streamId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v28 = v6;
    v29 = 2112;
    v30 = v7;
    _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_INFO, "Handle stream end with streamId: %@, count: %@", buf, 0x16u);

  }
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "synthesisEndTimestamp");

  if (!v9)
  {
    v10 = mach_absolute_time();
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSynthesisEndTimestamp:", v10);

    kdebug_trace();
  }
  if (objc_msgSend(v4, "errorCode") && objc_msgSend(v4, "errorCode") != 200)
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = objc_msgSend(v4, "errorCode");
    objc_msgSend(v4, "errorMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Unknown inline streaming error %d, %@"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 700, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[VSSiriInlineTTSStreamTask signalNewDataWithError:](self, "signalNewDataWithError:", v19);
  }
  else
  {
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "speechBeginTimestamp"))
    {

    }
    else
    {
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "audioDuration");
      v22 = v21;
      -[VSSiriInlineTTSStreamTask bufferDurationLimit](self, "bufferDurationLimit");
      v24 = v23;

      if (v22 < v24)
        -[VSSiriInlineTTSStreamTask startPlayback](self, "startPlayback");
    }
    -[VSSiriInlineTTSStreamTask signalNewDataWithError:](self, "signalNewDataWithError:", 0);
  }

}

- (void)startPlayback
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = mach_absolute_time();
  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = mach_absolute_time() - v3;
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAudioStartTimestampDiffs:", v5);

  if (v9)
  {
    -[VSSiriInlineTTSStreamTask signalNewDataWithError:](self, "signalNewDataWithError:", v9);
  }
  else
  {
    v7 = mach_absolute_time();
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSpeechBeginTimestamp:", v7);

    -[VSSiriInlineTTSStreamTask reportSpeechStart](self, "reportSpeechStart");
  }

}

- (BOOL)waitForNewData:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  -[VSSiriInlineTTSStreamTask refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[VSSiriInlineTTSStreamTask refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "waitUntilDate:", v7);

  -[VSSiriInlineTTSStreamTask refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

  return v8;
}

- (void)signalNewDataWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[VSSiriInlineTTSStreamTask refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  -[VSSiriInlineTTSStreamTask error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[VSSiriInlineTTSStreamTask setError:](self, "setError:", v8);
  -[VSSiriInlineTTSStreamTask refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "signal");

  -[VSSiriInlineTTSStreamTask refreshTimeoutCondition](self, "refreshTimeoutCondition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)main
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  uint8_t buf[4];
  void *v104;
  __int16 v105;
  int v106;
  uint64_t v107;
  _QWORD v108[2];

  v108[1] = *MEMORY[0x24BDAC8D0];
  kdebug_trace();
  v3 = mach_absolute_time();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSynthesisBeginTimestamp:", v3);

  +[VSSiriServerConfiguration defaultConfig](VSSiriServerConfiguration, "defaultConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "experimentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExperimentIdentifier:", v6);

  kdebug_trace();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask streamID](self, "streamID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_handleStreamNotification_, v9, 0);

  +[VSInlineStreamService sharedService](VSInlineStreamService, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask streamID](self, "streamID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startStreamingWithId:", v11);

  do
  {
    -[VSSiriInlineTTSStreamTask timeoutValue](self, "timeoutValue");
    v12 = -[VSSiriInlineTTSStreamTask waitForNewData:](self, "waitForNewData:");
    -[VSSiriInlineTTSStreamTask error](self, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      break;
    if (!v12)
    {
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "synthesisEndTimestamp");

      if (!v15)
      {
        -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "speechBeginTimestamp");

        VSGetLogDefault();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
        if (v19)
        {
          if (v21)
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_21AA84000, v20, OS_LOG_TYPE_ERROR, "Stream TTS network stall.", buf, 2u);
          }
          v22 = 701;
        }
        else
        {
          if (v21)
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_21AA84000, v20, OS_LOG_TYPE_ERROR, "Inline streaming TTS timeout.", buf, 2u);
          }
          v22 = 702;
        }

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), v22, MEMORY[0x24BDBD1B8]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSiriInlineTTSStreamTask setError:](self, "setError:", v23);

        -[VSSiriInlineTTSStreamTask error](self, "error");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "code");
        -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setErrorCode:", v25);

        -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setIsServerTimeout:", 1);

        v28 = mach_absolute_time();
        -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setSynthesisEndTimestamp:", v28);

        kdebug_trace();
        notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEC0EC0], "UTF8String"));
        break;
      }
    }
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "synthesisEndTimestamp");

  }
  while (!v17);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "removeObserver:", self);

  if ((-[VSSiriInlineTTSStreamTask isCancelled](self, "isCancelled") & 1) != 0)
  {
    v31 = 0;
  }
  else
  {
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "errorCode") == 701)
    {
      -[VSSiriInlineTTSStreamTask request](self, "request");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v33, "retryDeviceOnNetworkStall");

    }
    else
    {
      v31 = 0;
    }

  }
  if ((-[VSSiriInlineTTSStreamTask isCancelled](self, "isCancelled") & 1) != 0
    || (-[VSSiriInlineTTSStreamTask error](self, "error"),
        v34 = (void *)objc_claimAutoreleasedReturnValue(),
        v34,
        !v34))
  {
    if (!v31)
      goto LABEL_36;
  }
  else
  {
    -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "request");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "utterance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "length");

    if (!v38)
    {
      v39 = (void *)MEMORY[0x24BDD1540];
      v107 = *MEMORY[0x24BDD0FC8];
      v108[0] = CFSTR("Missing utterance in the request (preprocessing missing?). Can't fallback to device TTS.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 100, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask setError:](self, "setError:", v41);

      if ((v31 & 1) == 0)
        goto LABEL_36;
    }
  }
  VSGetLogDefault();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
  {
    -[VSSiriInlineTTSStreamTask error](self, "error");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v101, "errorCode");
    *(_DWORD *)buf = 138412546;
    v104 = v100;
    v105 = 1024;
    v106 = v102;
    _os_log_error_impl(&dword_21AA84000, v42, OS_LOG_TYPE_ERROR, "Streaming error: %@, error_code: %d", buf, 0x12u);

  }
  -[VSSiriInlineTTSStreamTask setServerAudio:](self, "setServerAudio:", 0);
  -[VSSiriInlineTTSStreamTask finalTimingInfo](self, "finalTimingInfo");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "removeAllObjects");

  -[VSSiriInlineTTSStreamTask setError:](self, "setError:", 0);
  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stop");

  -[VSSiriInlineTTSStreamTask setPlaybackServices:](self, "setPlaybackServices:", 0);
  if ((v31 & 1) != 0
    || (-[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics"),
        v45 = (void *)objc_claimAutoreleasedReturnValue(),
        v46 = objc_msgSend(v45, "speechBeginTimestamp"),
        v45,
        v46))
  {
    v47 = (void *)MEMORY[0x24BEC0D90];
    v48 = *MEMORY[0x24BEC0E80];
    -[VSSiriInlineTTSStreamTask request](self, "request");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "languageCode");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "localizedInterstitialStringForKey:language:", v48, v50);
    v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v52 = (void *)MEMORY[0x24BDD17C8];
    if (v51)
      v53 = v51;
    else
      v53 = &stru_24DD8EF88;
    -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "request");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "utterance");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringWithFormat:", CFSTR("%@ %@"), v53, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "request");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setUtterance:", v57);

    v60 = (void *)MEMORY[0x24BDD17C8];
    -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "request");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "text");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringWithFormat:", CFSTR("%@ %@"), v53, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "request");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setText:", v64);

  }
  -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "start");

  -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "error");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask setError:](self, "setError:", v69);

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setIsServerStreamTTS:", 0);

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "setIsServerTTS:", 0);

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setIsServerTimeout:", 1);

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setSourceOfTTS:", 1);

  -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "selectedVoice");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "key");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setVoiceAssetKey:", v76);

  -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "selectedVoiceResource");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "key");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setVoiceResourceAssetKey:", v80);

LABEL_36:
  -[VSSiriInlineTTSStreamTask error](self, "error");
  v82 = (void *)objc_claimAutoreleasedReturnValue();

  if (v82)
  {
    -[VSSiriInlineTTSStreamTask error](self, "error");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend(v83, "code");
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setErrorCode:", v84);
  }
  else
  {
    -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "flushAndStop");

    -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "error");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSiriInlineTTSStreamTask setError:](self, "setError:", v85);
  }

  v87 = mach_absolute_time();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "setSpeechEndTimestamp:", v87);

  -[VSSiriInlineTTSStreamTask error](self, "error");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v89)
  {
    -[VSSiriInlineTTSStreamTask reportInstrumentMetrics](self, "reportInstrumentMetrics");
    -[VSSiriInlineTTSStreamTask reportTimingInfo](self, "reportTimingInfo");
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "sourceOfTTS");

    if (v91 == 3)
    {
      +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask serverAudio](self, "serverAudio");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask request](self, "request");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "dumpCompressedAudio:forRequest:", v93, v94);
LABEL_47:

      goto LABEL_48;
    }
    -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "streamAudio");
    v96 = (void *)objc_claimAutoreleasedReturnValue();

    if (v96)
    {
      +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "streamAudio");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask request](self, "request");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "dumpStreamAudio:forRequest:", v94, v97);
LABEL_46:

      goto LABEL_47;
    }
    -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "compressedAudio");
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if (v99)
    {
      +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "compressedAudio");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask request](self, "request");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "dumpCompressedAudio:forRequest:", v94, v97);
      goto LABEL_46;
    }
  }
LABEL_48:
  -[VSSiriInlineTTSStreamTask reportFinish](self, "reportFinish");
  kdebug_trace();
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 400, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask setError:](self, "setError:", v3);

  if ((-[VSSiriInlineTTSStreamTask isExecuting](self, "isExecuting") & 1) != 0
    || (-[VSSiriInlineTTSStreamTask isCancelled](self, "isCancelled") & 1) != 0
    || (-[VSSiriInlineTTSStreamTask isFinished](self, "isFinished") & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)VSSiriInlineTTSStreamTask;
    -[VSSiriInlineTTSStreamTask cancel](&v6, sel_cancel);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VSSiriInlineTTSStreamTask;
    -[VSSiriInlineTTSStreamTask cancel](&v7, sel_cancel);
    -[VSSiriInlineTTSStreamTask reportFinish](self, "reportFinish");
  }
  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stop");

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ServerTTSErrorDomain"), 400, MEMORY[0x24BDBD1B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask signalNewDataWithError:](self, "signalNewDataWithError:", v5);

}

- (id)taskHash
{
  return self->_streamID;
}

- (void)resume
{
  id v2;
  id v3;

  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "start");

}

- (void)suspend
{
  id v2;

  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pause");

}

- (BOOL)isSpeaking
{
  return 1;
}

- (void)reportSpeechStart
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[VSSiriInlineTTSStreamTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speechRequestDidStart:", v4);

  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v30 = objc_msgSend(v6, "requestCreatedTimestamp");
    _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_INFO, "Task %llu started speaking", buf, 0xCu);

  }
  -[VSSiriInlineTTSStreamTask siriInstrumentation](self, "siriInstrumentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v28, "sourceOfTTS");
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeToSpeakLatency");
  v10 = v9;
  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "outputRouteInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BEC0E20];
  -[VSSiriInlineTTSStreamTask streamingVoice](self, "streamingVoice");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "type");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v11, "typeFromString:", v24);
  v12 = (void *)MEMORY[0x24BEC0E20];
  -[VSSiriInlineTTSStreamTask streamingVoice](self, "streamingVoice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "quality");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "footprintFromString:", v14);
  -[VSSiriInlineTTSStreamTask streamingVoice](self, "streamingVoice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");
  -[VSSiriInlineTTSStreamTask streamingResource](self, "streamingResource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "resourceVersion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v21) = 0;
  objc_msgSend(v7, "instrumentSpeechStartedWithSource:customerPerceivedLatency:audioOutputRoute:voiceType:voiceFootprint:voiceVersion:resourceVersion:isWhisper:", v8, v23, v22, v15, v18, objc_msgSend(v20, "integerValue"), v10, v21);

}

- (id)voiceKey
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isServerTimeout");

  if (v4)
  {
    -[VSSiriInlineTTSStreamTask deviceTTSCore](self, "deviceTTSCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedVoice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "voiceData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "descriptiveKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "voiceAssetKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)reportFinish
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[2];

  v59[1] = *MEMORY[0x24BDAC8D0];
  -[VSSiriInlineTTSStreamTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VSSiriInlineTTSStreamTask isCancelled](self, "isCancelled") ^ 1;
  -[VSSiriInlineTTSStreamTask error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speechRequest:didStopWithSuccess:phonemesSpoken:error:", v4, v5, &stru_24DD8EF88, v6);

  -[VSSiriInlineTTSStreamTask error](self, "error");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  -[VSSiriInlineTTSStreamTask error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "code") == 400)
  {

LABEL_5:
    -[VSSiriInlineTTSStreamTask voiceKey](self, "voiceKey");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    VSGetLogDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v48, "requestCreatedTimestamp");
      if (-[VSSiriInlineTTSStreamTask isCancelled](self, "isCancelled"))
        v15 = CFSTR("Cancelled");
      else
        v15 = CFSTR("Finished");
      -[VSSiriInlineTTSStreamTask request](self, "request");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "logText");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        v18 = v12;
      else
        v18 = CFSTR("(null)");
      v49[0] = CFSTR("voice");
      v49[1] = CFSTR("voice_resource");
      v50[0] = v18;
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "voiceResourceAssetKey");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = (const __CFString *)v20;
      else
        v22 = CFSTR("(null)");
      v50[1] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v52 = v14;
      v53 = 2112;
      v54 = v15;
      v55 = 2112;
      v56 = v17;
      v57 = 2114;
      v58 = v23;
      _os_log_impl(&dword_21AA84000, v13, OS_LOG_TYPE_DEFAULT, "Stream task %llu: %@ speaking text: '%@', %{public}@", buf, 0x2Au);

    }
    v24 = -[VSSiriInlineTTSStreamTask isCancelled](self, "isCancelled");
    -[VSSiriInlineTTSStreamTask siriInstrumentation](self, "siriInstrumentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v24)
    {
      objc_msgSend(v25, "instrumentSpeechCancelled");
    }
    else
    {
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "audioDuration");
      v29 = v28;
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "ttsSynthesisLatency");
      v32 = v31;
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "cappedRealTimeFactor");
      v35 = v34;
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "promptCount");
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "instrumentSpeechEndedWithAudioDuration:synthesisLatency:realTimeFactor:promptCount:errorCode:", v37, objc_msgSend(v38, "errorCode"), v29, v32, v35);

    }
    v39 = (void *)MEMORY[0x24BEC0D70];
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "reportInstrumentMetrics:", v40);
    goto LABEL_20;
  }
  -[VSSiriInlineTTSStreamTask error](self, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "code");

  if (v11 == 501)
    goto LABEL_5;
  VSGetLogDefault();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "requestCreatedTimestamp");
    -[VSSiriInlineTTSStreamTask error](self, "error");
    v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v52 = v46;
    v53 = 2112;
    v54 = v47;
    _os_log_error_impl(&dword_21AA84000, v41, OS_LOG_TYPE_ERROR, "Error in stream task %llu, error: %@", buf, 0x16u);

  }
  -[VSSiriInlineTTSStreamTask siriInstrumentation](self, "siriInstrumentation");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)MEMORY[0x24BDD16E0];
  -[VSSiriInlineTTSStreamTask error](self, "error");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "numberWithInteger:", objc_msgSend(v40, "code"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v43;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString instrumentSpeechFailedWithErrorCodes:](v12, "instrumentSpeechFailedWithErrorCodes:", v44);

LABEL_20:
}

- (void)reportTimingInfo
{
  void *v3;
  void *v4;
  id v5;

  -[VSSiriInlineTTSStreamTask delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask finalTimingInfo](self, "finalTimingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "speechRequest:didReceiveTimingInfo:", v3, v4);

}

- (void)reportInstrumentMetrics
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[VSSiriInlineTTSStreamTask delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speechRequest:didReportInstrumentMetrics:", v4, v5);

  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "requestCreatedTimestamp");
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 134218242;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_DEFAULT, "Stream task %llu: Instrument metric: %@", (uint8_t *)&v14, 0x16u);

  }
  +[VSDiagnosticService defaultService](VSDiagnosticService, "defaultService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryMetrics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dumpInstrumentMetrics:withTimestamp:", v12, objc_msgSend(v13, "requestCreatedTimestamp"));

}

- (id)audioPowerProvider
{
  void *v2;
  void *v3;

  -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioPowerProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)synthesisCore:(id)a3 didReceiveAudio:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  VSAudioPlaybackService *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  VSAudioPlaybackService *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint8_t buf[8];
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[VSSiriInlineTTSStreamTask error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AA84000, v8, OS_LOG_TYPE_DEFAULT, "Initializing fallback playback service", buf, 2u);
      }

      v9 = [VSAudioPlaybackService alloc];
      -[VSSiriInlineTTSStreamTask request](self, "request");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "audioSessionID");
      if (v5)
      {
        objc_msgSend(v5, "asbd");
      }
      else
      {
        v41 = 0;
        v39 = 0u;
        v40 = 0u;
      }
      -[VSSiriInlineTTSStreamTask request](self, "request", v39, v40, v41);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessoryID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[VSAudioPlaybackService initWithAudioSessionID:asbd:useAVSBAR:](v9, "initWithAudioSessionID:asbd:useAVSBAR:", v11, &v39, v13 != 0);
      -[VSSiriInlineTTSStreamTask setPlaybackServices:](self, "setPlaybackServices:", v14);

      -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "outputRouteInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "audioRouteName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setAudioOutputRoute:", v17);

      -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        v37 = (void *)MEMORY[0x24BDD1540];
        v43 = *MEMORY[0x24BDD0FC8];
        v44[0] = CFSTR("Unable to create playback service");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 450, v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSSiriInlineTTSStreamTask setError:](self, "setError:", v38);

LABEL_15:
        goto LABEL_16;
      }
      v20 = mach_absolute_time();
      -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "start");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        -[VSSiriInlineTTSStreamTask setError:](self, "setError:", v22);
      v23 = mach_absolute_time() - v20;
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setAudioStartTimestampDiffs:", v23);

    }
    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "speechBeginTimestamp");

    if (!v26)
    {
      v27 = mach_absolute_time();
      -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSpeechBeginTimestamp:", v27);

      -[VSSiriInlineTTSStreamTask reportSpeechStart](self, "reportSpeechStart");
    }
    -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "audioData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v5, "packetCount");
    objc_msgSend(v5, "packetDescriptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "enqueue:packetCount:packetDescriptions:", v30, v31, v32);

    -[VSSiriInlineTTSStreamTask instrumentMetrics](self, "instrumentMetrics");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "duration");
    v35 = v34;
    objc_msgSend(v33, "audioDuration");
    objc_msgSend(v33, "setAudioDuration:", v35 + v36);
    goto LABEL_15;
  }
LABEL_16:

}

- (void)synthesisCore:(id)a3 didReceiveProcessingWordTimingInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  -[VSSiriInlineTTSStreamTask delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_initWeak(&location, self);
    -[VSSiriInlineTTSStreamTask playbackServices](self, "playbackServices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __78__VSSiriInlineTTSStreamTask_synthesisCore_didReceiveProcessingWordTimingInfo___block_invoke;
    v11[3] = &unk_24DD8E9C8;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v10, "setBoundaryTimeObserverForTimingInfos:usingBlock:", v7, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

- (void)synthesisCore:(id)a3 didReceiveWordTimingInfo:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[VSSiriInlineTTSStreamTask finalTimingInfo](self, "finalTimingInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v5);

}

- (VSSpeechServiceDelegate)delegate
{
  return (VSSpeechServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (NSString)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(id)a3
{
  objc_storeStrong((id *)&self->_streamID, a3);
}

- (SATTSSpeechSynthesisResource)streamingResource
{
  return self->_streamingResource;
}

- (void)setStreamingResource:(id)a3
{
  objc_storeStrong((id *)&self->_streamingResource, a3);
}

- (SATTSSpeechSynthesisVoice)streamingVoice
{
  return self->_streamingVoice;
}

- (void)setStreamingVoice:(id)a3
{
  objc_storeStrong((id *)&self->_streamingVoice, a3);
}

- (VSInstrumentMetrics)instrumentMetrics
{
  return self->_instrumentMetrics;
}

- (void)setInstrumentMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentMetrics, a3);
}

- (VSDeviceTTSCore)deviceTTSCore
{
  return self->_deviceTTSCore;
}

- (void)setDeviceTTSCore:(id)a3
{
  objc_storeStrong((id *)&self->_deviceTTSCore, a3);
}

- (VSAudioPlaybackService)playbackServices
{
  return self->_playbackServices;
}

- (void)setPlaybackServices:(id)a3
{
  objc_storeStrong((id *)&self->_playbackServices, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSCondition)refreshTimeoutCondition
{
  return self->_refreshTimeoutCondition;
}

- (void)setRefreshTimeoutCondition:(id)a3
{
  objc_storeStrong((id *)&self->_refreshTimeoutCondition, a3);
}

- (VSAudioData)serverAudio
{
  return self->_serverAudio;
}

- (void)setServerAudio:(id)a3
{
  objc_storeStrong((id *)&self->_serverAudio, a3);
}

- (NSMutableArray)finalTimingInfo
{
  return self->_finalTimingInfo;
}

- (void)setFinalTimingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_finalTimingInfo, a3);
}

- (double)bufferDurationLimit
{
  return self->_bufferDurationLimit;
}

- (void)setBufferDurationLimit:(double)a3
{
  self->_bufferDurationLimit = a3;
}

- (double)timeoutValue
{
  return self->_timeoutValue;
}

- (void)setTimeoutValue:(double)a3
{
  self->_timeoutValue = a3;
}

- (NSDate)playbackBeginDate
{
  return self->_playbackBeginDate;
}

- (void)setPlaybackBeginDate:(id)a3
{
  objc_storeStrong((id *)&self->_playbackBeginDate, a3);
}

- (VSSiriInstrumentation)siriInstrumentation
{
  return self->_siriInstrumentation;
}

- (void)setSiriInstrumentation:(id)a3
{
  objc_storeStrong((id *)&self->_siriInstrumentation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriInstrumentation, 0);
  objc_storeStrong((id *)&self->_playbackBeginDate, 0);
  objc_storeStrong((id *)&self->_finalTimingInfo, 0);
  objc_storeStrong((id *)&self->_serverAudio, 0);
  objc_storeStrong((id *)&self->_refreshTimeoutCondition, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_playbackServices, 0);
  objc_storeStrong((id *)&self->_deviceTTSCore, 0);
  objc_storeStrong((id *)&self->_instrumentMetrics, 0);
  objc_storeStrong((id *)&self->_streamingVoice, 0);
  objc_storeStrong((id *)&self->_streamingResource, 0);
  objc_storeStrong((id *)&self->_streamID, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __78__VSSiriInlineTTSStreamTask_synthesisCore_didReceiveProcessingWordTimingInfo___block_invoke(uint64_t a1, void *a2)
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

@end
