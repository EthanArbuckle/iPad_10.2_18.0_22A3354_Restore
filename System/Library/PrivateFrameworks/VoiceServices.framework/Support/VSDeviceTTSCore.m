@implementation VSDeviceTTSCore

- (VSDeviceTTSCore)initWithRequest:(id)a3
{
  id v5;
  VSDeviceTTSCore *v6;
  VSDeviceTTSCore *v7;
  uint64_t v8;
  VSCachingService *cachingService;
  uint64_t v10;
  VSPrewarmService *prewarmService;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSDeviceTTSCore;
  v6 = -[VSDeviceTTSCore init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    +[VSCachingService standardService](VSCachingService, "standardService");
    v8 = objc_claimAutoreleasedReturnValue();
    cachingService = v7->_cachingService;
    v7->_cachingService = (VSCachingService *)v8;

    +[VSPrewarmService sharedService](VSPrewarmService, "sharedService");
    v10 = objc_claimAutoreleasedReturnValue();
    prewarmService = v7->_prewarmService;
    v7->_prewarmService = (VSPrewarmService *)v10;

  }
  return v7;
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
  -[VSDeviceTTSCore request](self, "request");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "utterance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeviceTTSCore selectedVoice](self, "selectedVoice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeviceTTSCore selectedVoiceResource](self, "selectedVoiceResource");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeviceTTSCore request](self, "request");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rate");
  v6 = v5;
  -[VSDeviceTTSCore request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pitch");
  v9 = v8;
  -[VSDeviceTTSCore request](self, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "volume");
  v12 = v11;
  -[VSDeviceTTSCore request](self, "request");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "contextInfo");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeviceTTSCore request](self, "request");
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
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  VSAudioData *v11;
  VSAudioData *compressedAudio;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  VSStreamAudioData *streamAudio;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[7];
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  id v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  _QWORD v86[3];

  v86[1] = *MEMORY[0x24BDAC8D0];
  -[VSDeviceTTSCore request](self, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "utterance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v85 = *MEMORY[0x24BDD0FC8];
    v86[0] = CFSTR("Missing utterance in the request (preprocessing missing?).");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v86, &v85, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 100, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore setError:](self, "setError:", v16);

    goto LABEL_35;
  }
  v6 = -[VSDeviceTTSCore selectedVoiceResource](self, "selectedVoiceResource");
  v7 = -[VSDeviceTTSCore selectedVoice](self, "selectedVoice");
  -[VSDeviceTTSCore selectedVoice](self, "selectedVoice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[VSDeviceTTSCore request](self, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    v18 = -[VSDeviceTTSCore voiceSelectionWithRequest:error:](self, "voiceSelectionWithRequest:error:", v17, &v82);
    v10 = v82;

    -[VSDeviceTTSCore setError:](self, "setError:", v10);
    goto LABEL_35;
  }
  if ((-[VSDeviceTTSCore isCancelled](self, "isCancelled") & 1) != 0)
    return;
  -[VSDeviceTTSCore taskHash](self, "taskHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeviceTTSCore getCacheForHash:](self, "getCacheForHash:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if ((-[VSDeviceTTSCore isCancelled](self, "isCancelled") & 1) != 0)
    {
LABEL_34:
      v10 = 0;
      goto LABEL_35;
    }
    -[VSDeviceTTSCore prepareForSynthesis](self, "prepareForSynthesis");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[VSDeviceTTSCore setError:](self, "setError:", v19);

      goto LABEL_34;
    }
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy__1769;
    v80 = __Block_byref_object_dispose__1770;
    v81 = 0;
    v20 = (void *)objc_opt_new();
    -[VSDeviceTTSCore request](self, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore request](self, "request");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "languageCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore request](self, "request");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "voiceName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "estimatedTTSWordTimingForText:withLanguage:voiceName:", v22, v24, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v77[5];
    v77[5] = v27;

    v29 = (void *)MEMORY[0x24BEC0E10];
    v30 = v77[5];
    -[VSDeviceTTSCore request](self, "request");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "contextInfo");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "adjustWordTimingInfo:forContext:", v30, v32);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    -[VSDeviceTTSCore request](self, "request");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "customResourceURLs");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v73;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v73 != v37)
            objc_enumerationMutation(v35);
          v39 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * v38);
          -[VSDeviceTTSCore engine](self, "engine");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "loadResource:error:", v39, 0);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
            objc_msgSend(v33, "addObject:", v41);

          ++v38;
        }
        while (v36 != v38);
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
      }
      while (v36);
    }

    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 0;
    -[VSDeviceTTSCore engine](self, "engine");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore request](self, "request");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "utterance");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore request](self, "request");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "canLogRequestText");
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __23__VSDeviceTTSCore_main__block_invoke;
    v67[3] = &unk_24DD8E670;
    v67[4] = self;
    v67[5] = &v76;
    v67[6] = &v68;
    objc_msgSend(v42, "synthesizeText:loggable:callback:", v44, v46, v67);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v48 = v33;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v64;
      do
      {
        v51 = 0;
        do
        {
          if (*(_QWORD *)v64 != v50)
            objc_enumerationMutation(v48);
          v52 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v51);
          -[VSDeviceTTSCore engine](self, "engine");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "unloadResource:", v52);

          ++v51;
        }
        while (v49 != v51);
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v63, v83, 16);
      }
      while (v49);
    }

    if (!v47 && (-[VSDeviceTTSCore isCancelled](self, "isCancelled") & 1) == 0)
    {
      -[VSDeviceTTSCore request](self, "request");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v54, "shouldCache"))
      {
LABEL_32:

        goto LABEL_33;
      }
      v55 = *((_BYTE *)v69 + 24) == 0;

      if (v55)
      {
        -[VSDeviceTTSCore taskHash](self, "taskHash");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeviceTTSCore cachingService](self, "cachingService");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        streamAudio = self->_streamAudio;
        v57 = v77[5];
        -[VSDeviceTTSCore selectedVoice](self, "selectedVoice");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "key");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[VSDeviceTTSCore selectedVoiceResource](self, "selectedVoiceResource");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "key");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "enqueueCacheWithHash:streamAudio:timingInfo:voiceKey:voiceResourceKey:completion:", v54, streamAudio, v57, v59, v61, 0);

        goto LABEL_32;
      }
    }
LABEL_33:
    -[VSDeviceTTSCore setError:](self, "setError:", v47);
    _Block_object_dispose(&v68, 8);

    _Block_object_dispose(&v76, 8);
    goto LABEL_34;
  }
  objc_msgSend(v10, "audio");
  v11 = (VSAudioData *)objc_claimAutoreleasedReturnValue();
  compressedAudio = self->_compressedAudio;
  self->_compressedAudio = v11;

  objc_msgSend(v10, "timingInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeviceTTSCore reportWordTimingInfo:](self, "reportWordTimingInfo:", v13);

  objc_msgSend(v10, "audio");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeviceTTSCore reportAudio:](self, "reportAudio:", v14);

LABEL_35:
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  VSDeviceTTSCore *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)VSDeviceTTSCore;
  -[VSDeviceTTSCore cancel](&v5, sel_cancel);
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_INFO, "Device core %p is cancelled", buf, 0xCu);
  }

  -[VSDeviceTTSCore engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAtMarker:", 0);

}

- (VSVoiceAssetSelection)selectedVoice
{
  VSVoiceAssetSelection *selectedVoice;
  void *v4;
  VSVoiceAssetSelection *v5;
  VSVoiceAssetSelection *v6;

  selectedVoice = self->_selectedVoice;
  if (!selectedVoice)
  {
    -[VSDeviceTTSCore request](self, "request");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore voiceSelectionWithRequest:error:](self, "voiceSelectionWithRequest:error:", v4, 0);
    v5 = (VSVoiceAssetSelection *)objc_claimAutoreleasedReturnValue();
    v6 = self->_selectedVoice;
    self->_selectedVoice = v5;

    selectedVoice = self->_selectedVoice;
  }
  return selectedVoice;
}

- (VSVoiceResourceAsset)selectedVoiceResource
{
  VSVoiceResourceAsset *selectedVoiceResource;
  void *v4;
  void *v5;
  void *v6;
  VSVoiceResourceAsset *v7;
  VSVoiceResourceAsset *v8;

  selectedVoiceResource = self->_selectedVoiceResource;
  if (!selectedVoiceResource)
  {
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectVoiceResourceAssetForLanguage:", v6);
    v7 = (VSVoiceResourceAsset *)objc_claimAutoreleasedReturnValue();
    v8 = self->_selectedVoiceResource;
    self->_selectedVoiceResource = v7;

    selectedVoiceResource = self->_selectedVoiceResource;
  }
  return selectedVoiceResource;
}

- (void)setEngine:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[VSDeviceTTSCore isExecuting](self, "isExecuting") & 1) == 0)
    objc_storeStrong((id *)&self->_engine, a3);

}

- (id)getCacheForHash:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSDeviceTTSCore cachingService](self, "cachingService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inMemoryCacheForHash:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    VSGetLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v8;
      _os_log_impl(&dword_21AA84000, v7, OS_LOG_TYPE_DEFAULT, "In-memory cached synthesis %@ is found.", (uint8_t *)&v14, 0xCu);

    }
    -[VSDeviceTTSCore instrumentMetrics](self, "instrumentMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsCacheHitFromMemory:", 1);
LABEL_9:

    goto LABEL_10;
  }
  -[VSDeviceTTSCore cachingService](self, "cachingService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "onDiskCacheForHash:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    VSGetLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "key");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_DEFAULT, "On-disk cached synthesis %@ is found.", (uint8_t *)&v14, 0xCu);

    }
    -[VSDeviceTTSCore instrumentMetrics](self, "instrumentMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIsCacheHitFromDisk:", 1);
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (id)voiceSelectionWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v15;
  uint8_t buf[8];
  id v17;

  v6 = a3;
  v17 = 0;
  -[VSDeviceTTSCore voiceSelection_noRetry_WithRequest:error:](self, "voiceSelection_noRetry_WithRequest:error:", v6, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v17;
  v9 = v8;
  if (v8 && objc_msgSend(v8, "code") == 402)
  {
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.voiceservices.notification.voice-update"), "UTF8String"));
    VSGetLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_INFO, "Reset MobileAsset query cache and retry selecting voice", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resetCache");

    v15 = v9;
    -[VSDeviceTTSCore voiceSelection_noRetry_WithRequest:error:](self, "voiceSelection_noRetry_WithRequest:error:", v6, &v15);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v15;

    v7 = (void *)v12;
    v9 = v13;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v7;
}

- (id)voiceSelection_noRetry_WithRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  const __CFString **v15;
  uint64_t *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectVoiceForLang:name:type:gender:footprint:", v7, v8, objc_msgSend(v5, "voiceType"), objc_msgSend(v5, "gender"), objc_msgSend(v5, "footprint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v5, "disableCompactVoiceFallback")
      && (objc_msgSend(v9, "voiceData"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "footprint"),
          v10,
          v11 == 1))
    {
      VSGetLogDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_21AA84000, v12, OS_LOG_TYPE_ERROR, "Compact voice is explicitly disabled.", buf, 2u);
      }

      if (a4)
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        v32 = *MEMORY[0x24BDD0FC8];
        v33 = CFSTR("Compact voice is explicitly disabled.");
        v14 = (void *)MEMORY[0x24BDBCE70];
        v15 = &v33;
        v16 = &v32;
LABEL_14:
        objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v13;
        v23 = 401;
LABEL_19:
        objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), v23, v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        a4 = 0;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "voicePath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "fileExistsAtPath:", v18);

      if ((v19 & 1) != 0)
      {
        a4 = v9;
      }
      else
      {
        VSGetLogDefault();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v9, "voicePath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v27;
          _os_log_error_impl(&dword_21AA84000, v24, OS_LOG_TYPE_ERROR, "Voice is deleted at path '%@'", buf, 0xCu);

        }
        if (a4)
        {
          v25 = (void *)MEMORY[0x24BDD1540];
          v28 = *MEMORY[0x24BDD0FC8];
          v29 = CFSTR("Voice is deleted already.");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v25;
          v23 = 402;
          goto LABEL_19;
        }
      }
    }
  }
  else
  {
    VSGetLogDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21AA84000, v20, OS_LOG_TYPE_ERROR, "No voice available", buf, 2u);
    }

    if (a4)
    {
      v13 = (void *)MEMORY[0x24BDD1540];
      v34 = *MEMORY[0x24BDD0FC8];
      v35[0] = CFSTR("No voice available");
      v14 = (void *)MEMORY[0x24BDBCE70];
      v15 = (const __CFString **)v35;
      v16 = &v34;
      goto LABEL_14;
    }
  }

  return a4;
}

- (id)prepareForSynthesis
{
  VSPrewarmService *prewarmService;
  void *v4;
  void *v5;
  VSSpeechEngine *v6;
  VSSpeechEngine *engine;
  void *v8;
  void *v9;
  uint64_t v10;
  VSStreamAudioData *v11;
  VSSpeechEngine *v12;
  void *v13;
  void *v14;
  void *v15;
  VSStreamAudioData *v16;
  VSStreamAudioData *streamAudio;
  void *v18;
  double v19;
  void *v20;
  float v21;
  void *v22;
  double v23;
  void *v24;
  float v25;
  void *v26;
  double v27;
  void *v28;
  float v29;
  VSVoiceBooster *v30;
  VSSpeechEngine *v31;
  VSVoiceBooster *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  double v38;
  VSPrewarmService *v40;
  void *v41;
  void *v42;
  VSSpeechEngine *v43;
  VSSpeechEngine *v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _OWORD v48[2];
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  if (self->_engine)
    goto LABEL_3;
  prewarmService = self->_prewarmService;
  -[VSDeviceTTSCore selectedVoice](self, "selectedVoice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSDeviceTTSCore selectedVoiceResource](self, "selectedVoiceResource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSPrewarmService cachedEngineForVoice:resources:](prewarmService, "cachedEngineForVoice:resources:", v4, v5);
  v6 = (VSSpeechEngine *)objc_claimAutoreleasedReturnValue();
  engine = self->_engine;
  self->_engine = v6;

  if (self->_engine)
  {
LABEL_3:
    -[VSDeviceTTSCore instrumentMetrics](self, "instrumentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 1;
  }
  else
  {
    v40 = self->_prewarmService;
    -[VSDeviceTTSCore selectedVoice](self, "selectedVoice");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore selectedVoiceResource](self, "selectedVoiceResource");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSPrewarmService loadEngineForVoice:resources:](v40, "loadEngineForVoice:resources:", v41, v42);
    v43 = (VSSpeechEngine *)objc_claimAutoreleasedReturnValue();
    v44 = self->_engine;
    self->_engine = v43;

    -[VSDeviceTTSCore instrumentMetrics](self, "instrumentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 0;
  }
  objc_msgSend(v8, "setIsWarmStart:", v10);

  if (self->_engine)
  {
    v11 = [VSStreamAudioData alloc];
    v12 = self->_engine;
    if (v12)
    {
      -[VSSpeechEngine asbd](v12, "asbd");
    }
    else
    {
      v49 = 0;
      memset(v48, 0, sizeof(v48));
    }
    v16 = -[VSStreamAudioData initWithASBD:](v11, "initWithASBD:", v48);
    streamAudio = self->_streamAudio;
    self->_streamAudio = v16;

    -[VSDeviceTTSCore request](self, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "volume");
    if (v19 == 0.0)
    {
      -[VSDeviceTTSCore selectedVoiceResource](self, "selectedVoiceResource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "volume");
      if (v21 == 0.0)
        -[VSSpeechEngine volume](self->_engine, "volume");
      -[VSSpeechEngine setVolume:](self->_engine, "setVolume:");

    }
    else
    {
      *(float *)&v19 = v19;
      -[VSSpeechEngine setVolume:](self->_engine, "setVolume:", v19);
    }

    -[VSDeviceTTSCore request](self, "request");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pitch");
    if (v23 == 0.0)
    {
      -[VSDeviceTTSCore selectedVoiceResource](self, "selectedVoiceResource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pitch");
      if (v25 == 0.0)
        -[VSSpeechEngine pitch](self->_engine, "pitch");
      -[VSSpeechEngine setPitch:](self->_engine, "setPitch:");

    }
    else
    {
      *(float *)&v23 = v23;
      -[VSSpeechEngine setPitch:](self->_engine, "setPitch:", v23);
    }

    -[VSDeviceTTSCore request](self, "request");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "rate");
    if (v27 == 0.0)
    {
      -[VSDeviceTTSCore selectedVoiceResource](self, "selectedVoiceResource");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "rate");
      if (v29 == 0.0)
        -[VSSpeechEngine rate](self->_engine, "rate");
      -[VSSpeechEngine setRate:](self->_engine, "setRate:");

    }
    else
    {
      *(float *)&v27 = v27;
      -[VSSpeechEngine setRate:](self->_engine, "setRate:", v27);
    }

    v30 = [VSVoiceBooster alloc];
    v31 = self->_engine;
    if (v31)
    {
      -[VSSpeechEngine asbd](v31, "asbd");
      v31 = self->_engine;
    }
    else
    {
      v47 = 0;
      v45 = 0u;
      v46 = 0u;
    }
    v32 = -[VSVoiceBooster initWithStreamDescription:pcmBufferSize:](v30, "initWithStreamDescription:pcmBufferSize:", &v45, -[VSSpeechEngine pcmBufferSize](v31, "pcmBufferSize", v45, v46, v47));
    -[VSDeviceTTSCore setVoiceBooster:](self, "setVoiceBooster:", v32);

    -[VSDeviceTTSCore selectedVoice](self, "selectedVoice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "voiceData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSDeviceTTSCore request](self, "request");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "volume");
    objc_msgSend(v33, "gainDecibelWithVolume:");
    v36 = v35;
    -[VSDeviceTTSCore voiceBooster](self, "voiceBooster");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v38) = v36;
    objc_msgSend(v37, "setVoiceBoostGainDecibels:", v38);

    v15 = 0;
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0FD8];
    v51[0] = CFSTR("Can't create VSSpeechEngine");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (void)reportProcessingWordTimingInfo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VSDeviceTTSCore delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VSDeviceTTSCore delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synthesisCore:didReceiveProcessingWordTimingInfo:", self, v7);

  }
}

- (void)reportWordTimingInfo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VSDeviceTTSCore delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VSDeviceTTSCore delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synthesisCore:didReceiveWordTimingInfo:", self, v7);

  }
}

- (void)reportAudio:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[VSDeviceTTSCore delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[VSDeviceTTSCore delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synthesisCore:didReceiveAudio:", self, v7);

  }
}

- (VSSpeechRequest)request
{
  return self->_request;
}

- (VSDeviceTTSCoreDelegate)delegate
{
  return (VSDeviceTTSCoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

- (VSAudioData)compressedAudio
{
  return self->_compressedAudio;
}

- (VSStreamAudioData)streamAudio
{
  return self->_streamAudio;
}

- (VSSpeechEngine)engine
{
  return self->_engine;
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

- (void)setSelectedVoice:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVoice, a3);
}

- (void)setSelectedVoiceResource:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVoiceResource, a3);
}

- (VSVoiceBooster)voiceBooster
{
  return self->_voiceBooster;
}

- (void)setVoiceBooster:(id)a3
{
  objc_storeStrong((id *)&self->_voiceBooster, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceBooster, 0);
  objc_storeStrong((id *)&self->_selectedVoiceResource, 0);
  objc_storeStrong((id *)&self->_selectedVoice, 0);
  objc_storeStrong((id *)&self->_prewarmService, 0);
  objc_storeStrong((id *)&self->_cachingService, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_streamAudio, 0);
  objc_storeStrong((id *)&self->_compressedAudio, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_destroyWeak((id *)&self->_instrumentMetrics);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_request, 0);
}

id __23__VSDeviceTTSCore_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _OWORD v37[2];
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  if (v4 == 3)
  {
    if ((objc_msgSend(v3, "neuralDidFallback") & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v3, "hasAudioClick");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
    v10 = objc_msgSend(v3, "numOfPromptsTriggered");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPromptCount:", v10);

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v12)
    {
      objc_msgSend(v3, "wordTimingInfos");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      v16 = (void *)MEMORY[0x24BEC0E10];
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "request");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "contextInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "adjustWordTimingInfo:forContext:", v17, v19);

      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(*(id *)(a1 + 32), "reportWordTimingInfo:", v12);
    v20 = objc_msgSend(v3, "hasAlignmentStall");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setNeuralAlignmentStall:", v20);

    v22 = objc_msgSend(v3, "hasAudioClick");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNeuralAudioClick:", v22);

    v24 = objc_msgSend(v3, "neuralDidFallback");
    objc_msgSend(*(id *)(a1 + 32), "instrumentMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setNeuralFallback:", v24);

    goto LABEL_17;
  }
  if (v4 != 2)
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  v5 = (void *)MEMORY[0x220750BF4]();
  objc_msgSend(v3, "mutablePCMData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "voiceBooster");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processData:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "streamAudio");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendAudioData:packetCount:packetDescriptions:", v6, 0, 0);

    v27 = objc_alloc_init(MEMORY[0x24BEC0D78]);
    objc_msgSend(*(id *)(a1 + 32), "engine");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "asbd");
    }
    else
    {
      v41 = 0;
      v39 = 0u;
      v40 = 0u;
    }
    v37[0] = v39;
    v37[1] = v40;
    v38 = v41;
    objc_msgSend(v27, "setAsbd:", v37);

    objc_msgSend(v27, "setAudioData:", v6);
    objc_msgSend(v27, "setPacketCount:", 0);
    objc_msgSend(v27, "setPacketDescriptions:", 0);
    objc_msgSend(*(id *)(a1 + 32), "reportAudio:", v27);
    v30 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v30)
    {
      v31 = objc_alloc(MEMORY[0x24BDBCE30]);
      objc_msgSend(v3, "wordTimingInfos");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v31, "initWithArray:copyItems:", v32, 1);

      v33 = (void *)MEMORY[0x24BEC0E10];
      objc_msgSend(*(id *)(a1 + 32), "request");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "contextInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "adjustWordTimingInfo:forContext:", v30, v35);

    }
    objc_msgSend(*(id *)(a1 + 32), "reportProcessingWordTimingInfo:", v30);

    objc_autoreleasePoolPop(v5);
    goto LABEL_17;
  }

  objc_autoreleasePoolPop(v5);
LABEL_18:

  return v8;
}

@end
