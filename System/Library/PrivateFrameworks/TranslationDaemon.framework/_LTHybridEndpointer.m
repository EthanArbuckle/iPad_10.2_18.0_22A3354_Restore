@implementation _LTHybridEndpointer

- (_LTHybridEndpointer)init
{
  _LTHybridEndpointer *v2;
  _LTHybridEndpointer *v3;
  NSObject *v4;
  double clientLagThresholdMs;
  double clampedSFLatencyMsForClientLag;
  _BOOL4 useDefaultServerFeaturesOnClientLag;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  dispatch_queue_t v10;
  OS_dispatch_queue *featureQueue;
  NSObject *v12;
  _EAREndpointer *sourceEndpointer;
  _LTServerEndpointerFeatures *sourceEndpointerFeatures;
  _EAREndpointer *targetEndpointer;
  _LTServerEndpointerFeatures *targetEndpointerFeatures;
  _LTHybridEndpointer *v17;
  objc_super v19;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  double v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)_LTHybridEndpointer;
  v2 = -[_LTHybridEndpointer init](&v19, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_samplingRate = xmmword_2493386B0;
    v2->_clientLagThresholdMs = (double)_LTPreferencesHybridEndpointerClientLagThreshold();
    v3->_clampedSFLatencyMsForClientLag = (double)_LTPreferencesHybridEndpointerClientLagClampedLatency();
    v3->_useDefaultServerFeaturesOnClientLag = _LTPreferencesHybridEndpointerUseDefaultFeaturesOnClientLagThreshold();
    v4 = _LTOSLogSpeech();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      clientLagThresholdMs = v3->_clientLagThresholdMs;
      clampedSFLatencyMsForClientLag = v3->_clampedSFLatencyMsForClientLag;
      useDefaultServerFeaturesOnClientLag = v3->_useDefaultServerFeaturesOnClientLag;
      *(_DWORD *)buf = 134218496;
      v21 = clientLagThresholdMs;
      v22 = 2048;
      v23 = clampedSFLatencyMsForClientLag;
      v24 = 1024;
      v25 = useDefaultServerFeaturesOnClientLag;
      _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Client lag configuration is %f, %f, %{BOOL}i", buf, 0x1Cu);
    }
    v8 = dispatch_queue_create("com.apple.siri.translation.HEP", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    v10 = dispatch_queue_create("com.apple.siri.translation.HEP.features", 0);
    featureQueue = v3->_featureQueue;
    v3->_featureQueue = (OS_dispatch_queue *)v10;

    v12 = _LTOSLogSpeech();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_INFO, "Init of HEP", buf, 2u);
    }
    v3->_didEndpoint = 0;
    sourceEndpointer = v3->_sourceEndpointer;
    v3->_sourceEndpointer = 0;

    sourceEndpointerFeatures = v3->_sourceEndpointerFeatures;
    v3->_sourceEndpointerFeatures = 0;

    targetEndpointer = v3->_targetEndpointer;
    v3->_targetEndpointer = 0;

    targetEndpointerFeatures = v3->_targetEndpointerFeatures;
    v3->_targetEndpointerFeatures = 0;

    v17 = v3;
  }

  return v3;
}

- (void)startEndpointingWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  _BOOL4 v11;
  _EAREndpointer *sourceEndpointer;
  _LTServerEndpointerFeatures *sourceEndpointerFeatures;
  _EAREndpointer *targetEndpointer;
  _LTServerEndpointerFeatures *targetEndpointerFeatures;
  _LTOfflineAssetManager *v16;
  _LTHybridEndpointerAssetInfo *v17;
  id v18;
  _LTHybridEndpointerAssetInfo *asset;
  NSObject *v20;
  uint64_t v21;
  _LTHybridEndpointerAssetInfo *v22;
  void *v23;
  id v24;
  void *v25;
  EARCaesuraSilencePosteriorGenerator *v26;
  EARCaesuraSilencePosteriorGenerator *spg;
  _LTHybridEndpointerAssetInfo *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  _LTHybridEndpointerAssetInfo *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _EAREndpointer *v38;
  _EAREndpointer *v39;
  _LTServerEndpointerFeatures *v40;
  _LTServerEndpointerFeatures *v41;
  void *v42;
  void *v43;
  NSNumber *v44;
  NSNumber *sourceEndpointerThreshold;
  void *v46;
  void *v47;
  NSNumber *v48;
  NSNumber *sourceDisconnectedEndpointerThreshold;
  NSObject *v50;
  NSNumber *v51;
  NSObject *v52;
  float v53;
  _EAREndpointer *v54;
  NSNumber *v55;
  NSObject *v56;
  NSObject *v57;
  _EAREndpointer *v58;
  NSObject *v59;
  NSNumber *v60;
  NSObject *v61;
  float v62;
  _LTHybridEndpointerAssetInfo *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  _EAREndpointer *v69;
  _EAREndpointer *v70;
  _LTServerEndpointerFeatures *v71;
  _LTServerEndpointerFeatures *v72;
  void *v73;
  void *v74;
  NSNumber *v75;
  NSNumber *targetEndpointerThreshold;
  void *v77;
  void *v78;
  NSNumber *v79;
  NSNumber *targetDisconnectedEndpointerThreshold;
  NSObject *v81;
  NSNumber *v82;
  NSObject *v83;
  float v84;
  _EAREndpointer *v85;
  NSNumber *v86;
  NSObject *v87;
  _EAREndpointer *v88;
  NSObject *v89;
  NSNumber *v90;
  NSObject *v91;
  float v92;
  NSObject *v93;
  _BOOL4 v94;
  _BOOL4 v95;
  void *v96;
  void *v97;
  id v98;
  uint8_t buf[4];
  _DWORD v100[7];

  *(_QWORD *)&v100[5] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "autoEndpoint");
  v10 = _LTOSLogSpeech();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if ((v9 & 1) != 0)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v10, OS_LOG_TYPE_INFO, "Start new HEP request", buf, 2u);
    }
    self->_didEndpoint = 0;
    objc_storeStrong((id *)&self->_context, a3);
    objc_storeWeak((id *)&self->_delegate, v8);
    sourceEndpointer = self->_sourceEndpointer;
    self->_sourceEndpointer = 0;

    sourceEndpointerFeatures = self->_sourceEndpointerFeatures;
    self->_sourceEndpointerFeatures = 0;

    targetEndpointer = self->_targetEndpointer;
    self->_targetEndpointer = 0;

    targetEndpointerFeatures = self->_targetEndpointerFeatures;
    self->_targetEndpointerFeatures = 0;

    v16 = objc_alloc_init(_LTOfflineAssetManager);
    v98 = 0;
    -[_LTOfflineAssetManager endpointAssetInfoWithContext:error:](v16, "endpointAssetInfoWithContext:error:", v7, &v98);
    v17 = (_LTHybridEndpointerAssetInfo *)objc_claimAutoreleasedReturnValue();
    v18 = v98;
    asset = self->_asset;
    self->_asset = v17;

    if (v18 || (v22 = self->_asset) == 0)
    {
      v20 = _LTOSLogSpeech();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[_LTHybridEndpointer startEndpointingWithContext:delegate:].cold.1((uint64_t)v18, v20, v21);
      goto LABEL_46;
    }
    -[_LTHybridEndpointerAssetInfo caesuraModelURL](v22, "caesuraModelURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v56 = _LTOSLogSpeech();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v56, OS_LOG_TYPE_INFO, "Could not obtain SPG (silence posterior generator) asset", buf, 2u);
      }
      goto LABEL_45;
    }
    v24 = objc_alloc(MEMORY[0x24BE2E6D8]);
    objc_msgSend(v23, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (EARCaesuraSilencePosteriorGenerator *)objc_msgSend(v24, "initWithConfigFile:samplingRate:", v25, self->_samplingRate);
    spg = self->_spg;
    self->_spg = v26;

    -[EARCaesuraSilencePosteriorGenerator setDelegate:](self->_spg, "setDelegate:", self);
    v28 = self->_asset;
    objc_msgSend(v7, "localePair");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "sourceLocale");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTHybridEndpointerAssetInfo endpointerModelURL:](v28, "endpointerModelURL:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v97 = (void *)v31;
    if (v31)
    {
      v96 = v23;
      v32 = objc_alloc(MEMORY[0x24BE2E718]);
      v33 = self->_asset;
      objc_msgSend(v7, "localePair");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sourceLocale");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_LTHybridEndpointerAssetInfo endpointerModelURL:](v33, "endpointerModelURL:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "path");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (_EAREndpointer *)objc_msgSend(v32, "initWithConfiguration:", v37);
      v39 = self->_sourceEndpointer;
      self->_sourceEndpointer = v38;

      objc_msgSend(MEMORY[0x24BDF6428], "featuresForEndpointer:", self->_sourceEndpointer);
      v40 = (_LTServerEndpointerFeatures *)objc_claimAutoreleasedReturnValue();
      v41 = self->_sourceEndpointerFeatures;
      self->_sourceEndpointerFeatures = v40;

      if ((-[_EAREndpointer requestSupportedWithSamplingRate:](self->_sourceEndpointer, "requestSupportedWithSamplingRate:", self->_samplingRate) & 1) != 0)
      {
        objc_msgSend(v7, "localePair");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "sourceLocale");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        _LTPreferencesHybridEndpointerThresholdForLocale(v43);
        v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        sourceEndpointerThreshold = self->_sourceEndpointerThreshold;
        self->_sourceEndpointerThreshold = v44;

        objc_msgSend(v7, "localePair");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "sourceLocale");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        _LTPreferencesDisconnectedHybridEndpointerThresholdForLocale(v47);
        v48 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        sourceDisconnectedEndpointerThreshold = self->_sourceDisconnectedEndpointerThreshold;
        self->_sourceDisconnectedEndpointerThreshold = v48;

        if (self->_sourceDisconnectedEndpointerThreshold)
        {
          v50 = _LTOSLogSpeech();
          v23 = v96;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            v51 = self->_sourceDisconnectedEndpointerThreshold;
            v52 = v50;
            -[NSNumber floatValue](v51, "floatValue");
            *(_DWORD *)buf = 134217984;
            *(double *)v100 = v53;
            _os_log_impl(&dword_2491B9000, v52, OS_LOG_TYPE_INFO, "Updating disconnected source endpointer threshold to %f", buf, 0xCu);

          }
          v54 = self->_sourceEndpointer;
          v55 = self->_sourceDisconnectedEndpointerThreshold;
LABEL_26:
          -[NSNumber floatValue](v55, "floatValue");
          -[_EAREndpointer updateEndpointerThresholdWithValue:](v54, "updateEndpointerThresholdWithValue:");
          goto LABEL_27;
        }
        v23 = v96;
        if (self->_sourceEndpointerThreshold)
        {
          v59 = _LTOSLogSpeech();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            v60 = self->_sourceEndpointerThreshold;
            v61 = v59;
            -[NSNumber floatValue](v60, "floatValue");
            *(_DWORD *)buf = 134217984;
            *(double *)v100 = v62;
            _os_log_impl(&dword_2491B9000, v61, OS_LOG_TYPE_INFO, "Updating source endpointer threshold to %f", buf, 0xCu);

          }
          v54 = self->_sourceEndpointer;
          v55 = self->_sourceEndpointerThreshold;
          goto LABEL_26;
        }
      }
      else
      {
        v57 = _LTOSLogSpeech();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2491B9000, v57, OS_LOG_TYPE_INFO, "Request for sampling rate failed for source locale", buf, 2u);
        }
        v58 = self->_sourceEndpointer;
        self->_sourceEndpointer = 0;

        v23 = v96;
      }
    }
LABEL_27:
    v63 = self->_asset;
    objc_msgSend(v7, "localePair");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "targetLocale");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTHybridEndpointerAssetInfo endpointerModelURL:](v63, "endpointerModelURL:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v66 || !objc_msgSend(v7, "autodetectLanguage"))
      goto LABEL_42;
    v67 = objc_alloc(MEMORY[0x24BE2E718]);
    objc_msgSend(v66, "path");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (_EAREndpointer *)objc_msgSend(v67, "initWithConfiguration:", v68);
    v70 = self->_targetEndpointer;
    self->_targetEndpointer = v69;

    objc_msgSend(MEMORY[0x24BDF6428], "featuresForEndpointer:", self->_targetEndpointer);
    v71 = (_LTServerEndpointerFeatures *)objc_claimAutoreleasedReturnValue();
    v72 = self->_targetEndpointerFeatures;
    self->_targetEndpointerFeatures = v71;

    if ((-[_EAREndpointer requestSupportedWithSamplingRate:](self->_targetEndpointer, "requestSupportedWithSamplingRate:", self->_samplingRate) & 1) == 0)
    {
      v87 = _LTOSLogSpeech();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2491B9000, v87, OS_LOG_TYPE_INFO, "Request for sampling rate failed for source locale", buf, 2u);
      }
      v88 = self->_targetEndpointer;
      self->_targetEndpointer = 0;

      goto LABEL_42;
    }
    objc_msgSend(v7, "localePair");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "targetLocale");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    _LTPreferencesHybridEndpointerThresholdForLocale(v74);
    v75 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    targetEndpointerThreshold = self->_targetEndpointerThreshold;
    self->_targetEndpointerThreshold = v75;

    objc_msgSend(v7, "localePair");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "targetLocale");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    _LTPreferencesDisconnectedHybridEndpointerThresholdForLocale(v78);
    v79 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    targetDisconnectedEndpointerThreshold = self->_targetDisconnectedEndpointerThreshold;
    self->_targetDisconnectedEndpointerThreshold = v79;

    if (self->_targetDisconnectedEndpointerThreshold)
    {
      v81 = _LTOSLogSpeech();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        v82 = self->_targetDisconnectedEndpointerThreshold;
        v83 = v81;
        -[NSNumber floatValue](v82, "floatValue");
        *(_DWORD *)buf = 134217984;
        *(double *)v100 = v84;
        _os_log_impl(&dword_2491B9000, v83, OS_LOG_TYPE_INFO, "Updating disconnected target endpointer threshold to %f", buf, 0xCu);

      }
      v85 = self->_targetEndpointer;
      v86 = self->_targetDisconnectedEndpointerThreshold;
    }
    else
    {
      if (!self->_targetEndpointerThreshold)
      {
LABEL_42:
        v93 = _LTOSLogSpeech();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
        {
          v94 = self->_sourceEndpointer != 0;
          v95 = self->_targetEndpointer != 0;
          *(_DWORD *)buf = 67109376;
          v100[0] = v94;
          LOWORD(v100[1]) = 1024;
          *(_DWORD *)((char *)&v100[1] + 2) = v95;
          _os_log_impl(&dword_2491B9000, v93, OS_LOG_TYPE_INFO, "Have hybrid endpointer for source %{BOOL}i, for target %{BOOL}i", buf, 0xEu);
        }

LABEL_45:
LABEL_46:

        goto LABEL_47;
      }
      v89 = _LTOSLogSpeech();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
      {
        v90 = self->_targetEndpointerThreshold;
        v91 = v89;
        -[NSNumber floatValue](v90, "floatValue");
        *(_DWORD *)buf = 134217984;
        *(double *)v100 = v92;
        _os_log_impl(&dword_2491B9000, v91, OS_LOG_TYPE_INFO, "Updating target endpointer threshold to %f", buf, 0xCu);

      }
      v85 = self->_targetEndpointer;
      v86 = self->_targetEndpointerThreshold;
    }
    -[NSNumber floatValue](v86, "floatValue");
    -[_EAREndpointer updateEndpointerThresholdWithValue:](v85, "updateEndpointerThresholdWithValue:");
    goto LABEL_42;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2491B9000, v10, OS_LOG_TYPE_INFO, "Auto endpointing is turned off", buf, 2u);
  }
LABEL_47:

}

- (void)setServerEndpointerFeatures:(id)a3 withLocale:(id)a4
{
  id v6;
  id v7;
  NSObject *featureQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  featureQueue = self->_featureQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62___LTHybridEndpointer_setServerEndpointerFeatures_withLocale___block_invoke;
  v11[3] = &unk_251A128B0;
  objc_copyWeak(&v14, &location);
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(featureQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)addSpeechAudioData:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (!self->_didEndpoint && (self->_sourceEndpointer || self->_targetEndpointer))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42___LTHybridEndpointer_addSpeechAudioData___block_invoke;
    block[3] = &unk_251A10FD0;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(queue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

- (void)endAudio
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31___LTHybridEndpointer_endAudio__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)didEndpointWithFeatures:(id)a3 silenceFeatures:(id)a4 endpointer:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 useDefaultServerFeaturesOnClientLag;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  float v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  int v59;
  id v60;
  NSObject *v61;
  NSObject *v62;
  uint64_t v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  double v79;
  NSObject *v80;
  double clientLagThresholdMs;
  const char *v82;
  NSObject *v83;
  uint32_t v84;
  double clampedSFLatencyMsForClientLag;
  id v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  NSObject *v101;
  id v103;
  id v104;
  uint64_t v105;
  uint8_t buf[4];
  double v107;
  __int16 v108;
  double v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  double v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  uint64_t v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  unint64_t v125;
  __int16 v126;
  double v127;
  __int16 v128;
  int v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "processedAudioMs");
  if (v11 >= (double)objc_msgSend(v8, "processedAudioDurationInMilliseconds"))
  {
    objc_msgSend(v9, "processedAudioMs");
    v43 = v42 - (double)objc_msgSend(v8, "processedAudioDurationInMilliseconds");
    v44 = objc_alloc(MEMORY[0x24BE2E708]);
    v45 = objc_msgSend(v8, "wordCount");
    v46 = objc_msgSend(v8, "trailingSilenceDuration");
    objc_msgSend(v8, "eosLikelihood");
    v48 = v47;
    objc_msgSend(v8, "pauseCounts");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "silencePosterior");
    v51 = v50;
    objc_msgSend(v9, "silenceFramesCountMs");
    v53 = v52;
    objc_msgSend(v9, "silenceProbability");
    v55 = v54;
    objc_msgSend(v9, "silenceDurationMs");
    *(float *)&v57 = v56;
    *(float *)&v58 = v43;
    v41 = (void *)objc_msgSend(v44, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:", v45, v46, v49, v48, v51, v53, v55, v57, v58);

    if (!v41)
      goto LABEL_19;
  }
  else
  {
    v12 = _LTOSLogSpeech();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      *(double *)&v14 = COERCE_DOUBLE(objc_msgSend(v8, "processedAudioDurationInMilliseconds"));
      objc_msgSend(v9, "processedAudioMs");
      *(_DWORD *)buf = 134349312;
      v107 = *(double *)&v14;
      v108 = 2050;
      v109 = v15;
      _os_log_impl(&dword_2491B9000, v13, OS_LOG_TYPE_INFO, "ClientLag: serverProcessedAudioMs(%{public}ld) > effectiveClientProcessedAudioMs(%{public}f)", buf, 0x16u);

    }
    objc_msgSend(v9, "processedAudioMs");
    v17 = v16 - (double)objc_msgSend(v8, "processedAudioDurationInMilliseconds");
    if (v17 > self->_clientLagThresholdMs)
    {
      v80 = _LTOSLogSpeech();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        clientLagThresholdMs = self->_clientLagThresholdMs;
        *(_DWORD *)buf = 134349312;
        v107 = v17;
        v108 = 2050;
        v109 = clientLagThresholdMs;
        v82 = "ClientLag: Not invoking HybridClassifier: sfLatency > clientLagThreshold: %{public}f > %{public}f";
        v83 = v80;
        v84 = 22;
LABEL_21:
        _os_log_impl(&dword_2491B9000, v83, OS_LOG_TYPE_INFO, v82, buf, v84);
      }
LABEL_22:
      LOBYTE(v59) = 0;
      goto LABEL_23;
    }
    useDefaultServerFeaturesOnClientLag = self->_useDefaultServerFeaturesOnClientLag;
    v19 = _LTOSLogSpeech();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (useDefaultServerFeaturesOnClientLag)
    {
      if (v20)
      {
        v21 = v19;
        objc_msgSend(v9, "processedAudioMs");
        *(_DWORD *)buf = 134349056;
        v107 = v22;
        _os_log_impl(&dword_2491B9000, v21, OS_LOG_TYPE_INFO, "ClientLag: Using DefaultServerFeatures with disconnected-state sfLatency: %{public}f", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDF6428], "featuresForEndpointer:", v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_alloc(MEMORY[0x24BE2E708]);
      v25 = objc_msgSend(v23, "wordCount");
      v26 = objc_msgSend(v23, "trailingSilenceDuration");
      objc_msgSend(v23, "eosLikelihood");
      v28 = v27;
      objc_msgSend(v23, "pauseCounts");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "silencePosterior");
      v31 = v30;
      objc_msgSend(v9, "silenceFramesCountMs");
      v33 = v32;
      objc_msgSend(v9, "silenceProbability");
      v35 = v34;
      objc_msgSend(v9, "silenceDurationMs");
      v37 = v36;
      objc_msgSend(v9, "processedAudioMs");
      *(float *)&v39 = v38;
      *(float *)&v40 = v37;
      v41 = (void *)objc_msgSend(v24, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:", v25, v26, v29, v28, v31, v33, v35, v40, v39);

      if (!v41)
        goto LABEL_19;
    }
    else
    {
      if (v20)
      {
        clampedSFLatencyMsForClientLag = self->_clampedSFLatencyMsForClientLag;
        *(_DWORD *)buf = 134349056;
        v107 = clampedSFLatencyMsForClientLag;
        _os_log_impl(&dword_2491B9000, v19, OS_LOG_TYPE_INFO, "ClientLag: Using ServerFeatures with ClampedSFLatency: %{public}f", buf, 0xCu);
      }
      v86 = objc_alloc(MEMORY[0x24BE2E708]);
      v87 = objc_msgSend(v8, "wordCount");
      v88 = objc_msgSend(v8, "trailingSilenceDuration");
      objc_msgSend(v8, "eosLikelihood");
      v90 = v89;
      objc_msgSend(v8, "pauseCounts");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "silencePosterior");
      v93 = v92;
      objc_msgSend(v9, "silenceFramesCountMs");
      v95 = v94;
      objc_msgSend(v9, "silenceProbability");
      v97 = v96;
      objc_msgSend(v9, "silenceDurationMs");
      *(float *)&v99 = v98;
      *(float *)&v100 = self->_clampedSFLatencyMsForClientLag;
      v41 = (void *)objc_msgSend(v86, "initWithWordCount:trailingSilenceDuration:endOfSentenceLikelihood:pauseCounts:silencePosterior:clientSilenceFramesCountMs:clientSilenceProbability:silencePosteriorNF:serverFeaturesLatency:", v87, v88, v91, v90, v93, v95, v97, v99, v100);

      if (!v41)
      {
LABEL_19:
        v101 = _LTOSLogSpeech();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v82 = "ClientLag: Not Invoking HybridClassifier as serverProcessedAudioMs > effectiveClientProcessedAudioMs";
          v83 = v101;
          v84 = 2;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
    }
  }
  v105 = 0;
  objc_msgSend(v9, "processedAudioMs");
  v104 = 0;
  v59 = objc_msgSend(v10, "didEndpointWithFeatures:audioTimestamp:featuresToLog:endpointPosterior:extraDelayMs:", v41, &v104, (char *)&v105 + 4, &v105);
  v60 = v104;
  v61 = _LTOSLogSpeech();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    v62 = v61;
    *(double *)&v63 = COERCE_DOUBLE(objc_msgSend(v41, "trailingSilenceDuration"));
    objc_msgSend(v41, "clientSilenceFramesCountMs");
    v65 = v64;
    objc_msgSend(v41, "endOfSentenceLikelihood");
    v67 = v66;
    v68 = objc_msgSend(v41, "wordCount");
    objc_msgSend(v41, "serverFeaturesLatency");
    v70 = v69;
    objc_msgSend(v41, "clientSilenceProbability");
    v72 = v71;
    objc_msgSend(v41, "pauseCounts");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "componentsJoinedByString:", CFSTR(","));
    v103 = v10;
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "silencePosterior");
    v76 = v75;
    objc_msgSend(v9, "silencePosterior");
    v78 = v77;
    objc_msgSend(v9, "processedAudioMs");
    *(_DWORD *)buf = 134351874;
    v107 = *(double *)&v63;
    v108 = 2050;
    v109 = v65;
    v110 = 2050;
    v111 = v67;
    v112 = 2050;
    v113 = v68;
    v114 = 2050;
    v115 = v70;
    v116 = 2050;
    v117 = v72;
    v118 = 2114;
    v119 = v74;
    v120 = 2050;
    v121 = v76;
    v122 = 2050;
    v123 = v78;
    v124 = 2050;
    v125 = (unint64_t)v79;
    v126 = 2050;
    v127 = *((float *)&v105 + 1);
    v128 = 1026;
    v129 = v59;
    _os_log_impl(&dword_2491B9000, v62, OS_LOG_TYPE_INFO, "HEP.feats: [%{public}ld,%{public}f,%{public}f,%{public}ld,%{public}f,%{public}f] & [(%{public}@),%{public}f,%{public}f] @ %{public}lu [%{public}f, %{public}d]", buf, 0x76u);

    v10 = v103;
  }

LABEL_23:
  return v59;
}

- (void)clientSilenceFeaturesAvailable:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *featureQueue;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  v5 = _LTOSLogSpeech();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_LTHybridEndpointer clientSilenceFeaturesAvailable:].cold.1(v5);
  if (!self->_didEndpoint)
  {
    objc_initWeak(&location, self);
    featureQueue = self->_featureQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54___LTHybridEndpointer_clientSilenceFeaturesAvailable___block_invoke;
    block[3] = &unk_251A10FD0;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(featureQueue, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (NSDictionary)endpointerThreshold
{
  return self->_endpointerThreshold;
}

- (void)setEndpointerThreshold:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (int64_t)samplingRate
{
  return self->_samplingRate;
}

- (int64_t)audioBitDepth
{
  return self->_audioBitDepth;
}

- (double)clientLagThresholdMs
{
  return self->_clientLagThresholdMs;
}

- (void)setClientLagThresholdMs:(double)a3
{
  self->_clientLagThresholdMs = a3;
}

- (double)clampedSFLatencyMsForClientLag
{
  return self->_clampedSFLatencyMsForClientLag;
}

- (void)setClampedSFLatencyMsForClientLag:(double)a3
{
  self->_clampedSFLatencyMsForClientLag = a3;
}

- (BOOL)useDefaultServerFeaturesOnClientLag
{
  return self->_useDefaultServerFeaturesOnClientLag;
}

- (void)setUseDefaultServerFeaturesOnClientLag:(BOOL)a3
{
  self->_useDefaultServerFeaturesOnClientLag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointerThreshold, 0);
  objc_storeStrong((id *)&self->_featureQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spg, 0);
  objc_storeStrong((id *)&self->_targetEndpointerFeatures, 0);
  objc_storeStrong((id *)&self->_targetDisconnectedEndpointerThreshold, 0);
  objc_storeStrong((id *)&self->_targetEndpointerThreshold, 0);
  objc_storeStrong((id *)&self->_targetEndpointer, 0);
  objc_storeStrong((id *)&self->_sourceEndpointerFeatures, 0);
  objc_storeStrong((id *)&self->_sourceDisconnectedEndpointerThreshold, 0);
  objc_storeStrong((id *)&self->_sourceEndpointerThreshold, 0);
  objc_storeStrong((id *)&self->_sourceEndpointer, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)startEndpointingWithContext:(uint64_t)a3 delegate:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, a2, a3, "Could not get appropriate endpointer assets: %@", (uint8_t *)&v3);
}

- (void)clientSilenceFeaturesAvailable:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "clientSilenceFeaturesAvailable", v1, 2u);
}

@end
