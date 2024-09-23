@implementation _LTOnlineTranslationEngine

+ (void)initialize
{
  dispatch_group_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = dispatch_group_create();
    v3 = (void *)completionGroup;
    completionGroup = (uint64_t)v2;

  }
}

- (_LTOnlineTranslationEngine)initWithSelfLoggingManager:(id)a3
{
  id v5;
  _LTOnlineTranslationEngine *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *translationQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *timerQueue;
  _LTOnlineTranslationEngine *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_LTOnlineTranslationEngine;
  v6 = -[_LTOnlineTranslationEngine init](&v13, sel_init);
  if (v6)
  {
    v7 = dispatch_queue_create("com.apple.translation.online-queue", 0);
    translationQueue = v6->_translationQueue;
    v6->_translationQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create("com.apple.translation.server-timer", 0);
    timerQueue = v6->_timerQueue;
    v6->_timerQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_selfLoggingManager, a3);
    v11 = v6;
  }

  return v6;
}

+ (id)blazarServiceWithBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  FTBlazarService *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v3);
  objc_msgSend(v4, "set_allowsTLSFalseStart:", 1);
  objc_msgSend(v4, "setTLSMinimumSupportedProtocolVersion:", 771);
  objc_msgSend(v4, "setURLCache:", 0);
  _LTPreferencesOspreyEndpointURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Creating service with URL: %{public}@, bundleID: %{public}@", (uint8_t *)&v9, 0x16u);
  }
  v7 = -[OspreyChannel initWithURL:configuration:]([FTBlazarService alloc], "initWithURL:configuration:", v5, v4);
  -[OspreyChannel setUseCompression:](v7, "setUseCompression:", 1);

  return v7;
}

- (id)_blazarService
{
  FTBlazarService *blazarService;
  FTBlazarService *v4;
  FTBlazarService *v5;

  blazarService = self->_blazarService;
  if (!blazarService)
  {
    +[_LTOnlineTranslationEngine blazarServiceWithBundleID:](_LTOnlineTranslationEngine, "blazarServiceWithBundleID:", CFSTR("com.apple.Translate"));
    v4 = (FTBlazarService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_blazarService;
    self->_blazarService = v4;

    blazarService = self->_blazarService;
  }
  return blazarService;
}

- (id)_siriService
{
  FTBlazarService *siriService;
  FTBlazarService *v4;
  FTBlazarService *v5;

  siriService = self->_siriService;
  if (!siriService)
  {
    +[_LTOnlineTranslationEngine blazarServiceWithBundleID:](_LTOnlineTranslationEngine, "blazarServiceWithBundleID:", CFSTR("com.apple.siri"));
    v4 = (FTBlazarService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_siriService;
    self->_siriService = v4;

    siriService = self->_siriService;
  }
  return siriService;
}

- (id)_systemService
{
  FTBlazarService *systemService;
  FTBlazarService *v4;
  FTBlazarService *v5;

  systemService = self->_systemService;
  if (!systemService)
  {
    +[_LTOnlineTranslationEngine blazarServiceWithBundleID:](_LTOnlineTranslationEngine, "blazarServiceWithBundleID:", CFSTR("com.apple.TranslationUIServices.TranslationUIService"));
    v4 = (FTBlazarService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_systemService;
    self->_systemService = v4;

    systemService = self->_systemService;
  }
  return systemService;
}

- (id)_webTaskService
{
  FTBlazarService *webTaskService;
  FTBlazarService *v4;
  FTBlazarService *v5;

  webTaskService = self->_webTaskService;
  if (!webTaskService)
  {
    +[_LTOnlineTranslationEngine blazarServiceWithBundleID:](_LTOnlineTranslationEngine, "blazarServiceWithBundleID:", CFSTR("com.apple.mobilesafari"));
    v4 = (FTBlazarService *)objc_claimAutoreleasedReturnValue();
    v5 = self->_webTaskService;
    self->_webTaskService = v4;

    webTaskService = self->_webTaskService;
  }
  return webTaskService;
}

- (id)_serviceForTask:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 2:
      -[_LTOnlineTranslationEngine _webTaskService](self, "_webTaskService");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[_LTOnlineTranslationEngine _siriService](self, "_siriService");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[_LTOnlineTranslationEngine _systemService](self, "_systemService");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[_LTOnlineTranslationEngine _blazarService](self, "_blazarService");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (BOOL)translatesPair:(id)a3
{
  return 0;
}

- (void)startServerTimeoutTimer
{
  NSObject *timerQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  timerQueue = self->_timerQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53___LTOnlineTranslationEngine_startServerTimeoutTimer__block_invoke;
  v4[3] = &unk_251A13100;
  objc_copyWeak(&v5, &location);
  dispatch_async(timerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)updateServerTimeout
{
  NSObject *timerQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  timerQueue = self->_timerQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49___LTOnlineTranslationEngine_updateServerTimeout__block_invoke;
  v4[3] = &unk_251A13100;
  objc_copyWeak(&v5, &location);
  dispatch_async(timerQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelServerTimeout
{
  NSObject *v3;
  NSObject *timerQueue;
  _QWORD block[4];
  id v6;
  id buf[2];

  v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "cancelServerTimeout", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49___LTOnlineTranslationEngine_cancelServerTimeout__block_invoke;
  block[3] = &unk_251A13100;
  objc_copyWeak(&v6, buf);
  dispatch_async(timerQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

- (void)serverTimeoutFired
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "batch timeout triggered", (uint8_t *)&v8, 2u);
  }
  if (self->batchTranslationResponseHandler)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", self->_startTime);
    v6 = v5;

    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = v6;
      _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "serverTimeoutFired Sending batch request after %.2fs", (uint8_t *)&v8, 0xCu);
    }
    -[_LTOnlineTranslationEngine sendBatchTranslationRequestWithDelegate:](self, "sendBatchTranslationRequestWithDelegate:", self->batchTranslationResponseHandler);
  }
}

- (id)_tokenizeString:(id)a3 inLocale:(id)a4
{
  id v5;
  id v6;
  _LTTokenizer *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(_LTTokenizer);
  -[_LTTokenizer tokenize:forLocale:](v7, "tokenize:forLocale:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)speak:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  void (**v31)(id, void *, _QWORD);
  _QWORD v32[4];
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  -[_LTOnlineTranslationEngine ttsCache](self, "ttsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v9, "localePair");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "targetLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v15, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "audioDataForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v18, OS_LOG_TYPE_INFO, "Found cached TTS data", buf, 2u);
    }
    v10[2](v10, v17, 0);
  }
  else
  {
    objc_msgSend(v9, "_ospreyTTSRequestWithText:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v19;
    v20 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "language");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "gender");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v21;
      v36 = 2114;
      v37 = v22;
      _os_log_impl(&dword_2491B9000, v20, OS_LOG_TYPE_INFO, "Start TTS request: %{public}@ / %{public}@", buf, 0x16u);

    }
    -[_LTOnlineTranslationEngine _serviceForTask:](self, "_serviceForTask:", objc_msgSend(v9, "taskHint"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke;
    v32[3] = &unk_251A13478;
    v25 = v26;
    v33 = v25;
    v27[0] = v24;
    v27[1] = 3221225472;
    v27[2] = __59___LTOnlineTranslationEngine_speak_withContext_completion___block_invoke_2;
    v27[3] = &unk_251A134A0;
    v31 = v10;
    v28 = v8;
    v29 = v11;
    v30 = v16;
    objc_msgSend(v23, "performTextToSpeechRouter:requestBuilder:completion:", v25, v32, v27);

  }
}

- (void)_createOrUpdateBatchTranslationRequestWithParagraph:(id)a3 index:(int64_t)a4 context:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _LTBatchTranslationResponseHandler *batchTranslationResponseHandler;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  BOOL v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _LTBatchTranslationResponseHandler *v33;
  _LTBatchTranslationResponseHandler *v34;
  void *v35;
  void *v36;
  void *v37;
  _LTBatchedParagraphsHolder *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  FTMutableBatchTranslationRequest_Paragraph *v46;
  void *v47;
  void *v48;
  _FTParagraphBatchInfo *v49;
  void *v50;
  BOOL v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  _LTBatchTranslationResponseHandler *v56;
  void *v57;
  void *v58;
  void *v59;
  void (**v60)(id, id, _QWORD);
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  uint8_t buf[4];
  _BOOL4 v70;
  __int16 v71;
  _BOOL4 v72;
  __int16 v73;
  _BOOL4 v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, id, _QWORD))a6;
  objc_msgSend(v10, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "length"))
  {
    v27 = objc_alloc_init(MEMORY[0x24BDF64A8]);
    objc_msgSend(v27, "setRoute:", 2);
    objc_msgSend(v10, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setIdentifier:", v28);

    objc_msgSend(v27, "setTranslations:", MEMORY[0x24BDBD1A8]);
    v12[2](v12, v27, 0);

    goto LABEL_24;
  }
  objc_msgSend(v11, "localePair");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sourceLocale");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localePair");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "targetLocale");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  batchTranslationResponseHandler = self->batchTranslationResponseHandler;
  if (!batchTranslationResponseHandler)
    goto LABEL_16;
  v64 = -[_LTBatchTranslationResponseHandler bufferSize](batchTranslationResponseHandler, "bufferSize");
  v63 = _LTPreferencesBatchingMaxParagraphBufferSize();
  -[_LTBatchTranslationResponseHandler batchedParagraphs](self->batchTranslationResponseHandler, "batchedParagraphs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v19, "count");
  v61 = _LTPreferencesBatchingMaxParagraphs();

  -[_LTBatchTranslationResponseHandler sourceLocale](self->batchTranslationResponseHandler, "sourceLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isEqual:", v66))
    goto LABEL_11;
  -[_LTBatchTranslationResponseHandler targetLocale](self->batchTranslationResponseHandler, "targetLocale");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v12;
  if ((objc_msgSend(v21, "isEqual:", v65) & 1) == 0)
  {

LABEL_11:
    v24 = v15;

    v25 = 1;
    goto LABEL_12;
  }
  v22 = -[_LTBatchTranslationResponseHandler taskHint](self->batchTranslationResponseHandler, "taskHint");
  v23 = objc_msgSend(v11, "taskHint");
  v24 = v15;
  v25 = v22 != v23;

  if (v64 >= v63 || v62 >= v61)
  {
    v12 = v60;
  }
  else
  {
    v26 = v22 == v23;
    v12 = v60;
    if (v26)
      goto LABEL_15;
  }
LABEL_12:
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "timeIntervalSinceDate:", self->_startTime);
  v31 = v30;

  v32 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109888;
    v70 = v64 >= v63;
    v71 = 1024;
    v72 = v62 >= v61;
    v73 = 1024;
    v74 = v25;
    v75 = 2048;
    v76 = v31;
    _os_log_debug_impl(&dword_2491B9000, v32, OS_LOG_TYPE_DEBUG, "Sending batch request: bufferSizeExceeded: %{BOOL}i; maxParagraphsExceeded: %{BOOL}i; taskChanged: %{BOOL}i; after %.2fs",
      buf,
      0x1Eu);
  }
  -[_LTOnlineTranslationEngine sendBatchTranslationRequestWithDelegate:](self, "sendBatchTranslationRequestWithDelegate:", self->batchTranslationResponseHandler);
LABEL_15:
  v15 = v24;
  if (!self->batchTranslationResponseHandler)
  {
LABEL_16:
    v33 = objc_alloc_init(_LTBatchTranslationResponseHandler);
    v34 = self->batchTranslationResponseHandler;
    self->batchTranslationResponseHandler = v33;

    v35 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "sessionID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("%@/%08zd"), v36, a4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = objc_alloc_init(_LTBatchedParagraphsHolder);
    -[_LTBatchTranslationResponseHandler setBatchedParagraphs:](self->batchTranslationResponseHandler, "setBatchedParagraphs:", v38);

    _LTPreferencesRequestIDOverride(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler setRequestID:](self->batchTranslationResponseHandler, "setRequestID:", v39);

    objc_msgSend(v11, "sessionID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    _LTPreferencesSessionIDOverride(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler setSessionID:](self->batchTranslationResponseHandler, "setSessionID:", v41);

    -[_LTBatchTranslationResponseHandler setSourceLocale:](self->batchTranslationResponseHandler, "setSourceLocale:", v66);
    -[_LTBatchTranslationResponseHandler setTargetLocale:](self->batchTranslationResponseHandler, "setTargetLocale:", v65);
    -[_LTBatchTranslationResponseHandler setTaskHint:](self->batchTranslationResponseHandler, "setTaskHint:", objc_msgSend(v11, "taskHint"));
    objc_msgSend(v11, "clientIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler setClientIdentifier:](self->batchTranslationResponseHandler, "setClientIdentifier:", v42);

    objc_msgSend(v11, "sourceURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler setSourceURL:](self->batchTranslationResponseHandler, "setSourceURL:", v43);

    objc_msgSend(v11, "sequoiaClientHeaderValue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler setClientHeader:](self->batchTranslationResponseHandler, "setClientHeader:", v44);

    objc_msgSend(v11, "logIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler setLogIdentifier:](self->batchTranslationResponseHandler, "setLogIdentifier:", v45);

    -[_LTBatchTranslationResponseHandler setSupportsGenderDisambiguation:](self->batchTranslationResponseHandler, "setSupportsGenderDisambiguation:", objc_msgSend(v11, "supportsGenderDisambiguation"));
    objc_msgSend(v11, "setSourceURL:", 0);
    -[_LTOnlineTranslationEngine startServerTimeoutTimer](self, "startServerTimeoutTimer");

  }
  v46 = objc_alloc_init(FTMutableBatchTranslationRequest_Paragraph);
  objc_msgSend(v10, "identifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest_Paragraph setParagraph_id:](v46, "setParagraph_id:", v47);

  objc_msgSend(v10, "text");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest_Paragraph setText:](v46, "setText:", v48);

  v49 = objc_alloc_init(_FTParagraphBatchInfo);
  -[_FTParagraphBatchInfo setParagraph:](v49, "setParagraph:", v10);
  -[_FTParagraphBatchInfo setRequestParagraph:](v49, "setRequestParagraph:", v46);
  -[_FTParagraphBatchInfo setCompletion:](v49, "setCompletion:", v12);
  objc_msgSend(v10, "spans");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "count") == 0;

  if (!v51)
  {
    objc_msgSend(v10, "spans");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __107___LTOnlineTranslationEngine__createOrUpdateBatchTranslationRequestWithParagraph_index_context_completion___block_invoke;
    v67[3] = &unk_251A134C8;
    v68 = v10;
    objc_msgSend(v52, "_ltCompactMap:", v67);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableBatchTranslationRequest_Paragraph setSpan:](v46, "setSpan:", v53);

  }
  v54 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    -[FTMutableBatchTranslationRequest_Paragraph text](v46, "text");
    objc_claimAutoreleasedReturnValue();
    -[_LTBatchTranslationResponseHandler requestID](self->batchTranslationResponseHandler, "requestID");
    objc_claimAutoreleasedReturnValue();
    -[_LTOnlineTranslationEngine _createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:].cold.2();
  }

  v55 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    -[FTMutableBatchTranslationRequest_Paragraph span](v46, "span");
    objc_claimAutoreleasedReturnValue();
    -[_LTOnlineTranslationEngine _createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:].cold.1();
  }

  v56 = self->batchTranslationResponseHandler;
  -[FTMutableBatchTranslationRequest_Paragraph text](v46, "text");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTBatchTranslationResponseHandler setBufferSize:](v56, "setBufferSize:", -[_LTBatchTranslationResponseHandler bufferSize](v56, "bufferSize") + objc_msgSend(v57, "length"));

  -[_LTBatchTranslationResponseHandler batchedParagraphs](self->batchTranslationResponseHandler, "batchedParagraphs");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest_Paragraph paragraph_id](v46, "paragraph_id");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "insertParagraph:withId:", v49, v59);

LABEL_24:
}

- (void)sendBatchTranslationRequestWithDelegate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _LTDSELFLoggingManager *selfLoggingManager;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  FTMutableBatchTranslationRequest *v50;
  id v51;
  id v52;
  void *v53;
  _LTBatchTranslationResponseHandler *batchTranslationResponseHandler;
  void *v55;
  uint64_t v56;
  void *v57;
  os_signpost_id_t spid;
  FTMutableTranslationOptions *v59;
  NSObject *log;
  void *v61;
  FTMutableBatchTranslationStreamingRequest *v62;
  void *v63;
  FTMutableBatchTranslationRequest *v64;
  _QWORD v65[5];
  NSObject *v66;
  FTMutableBatchTranslationRequest *v67;
  id v68;
  id v69;
  os_signpost_id_t v70;
  uint64_t v71;
  _QWORD v72[4];
  FTMutableBatchTranslationRequest *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t v79[128];
  uint8_t buf[4];
  uint64_t v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  uint8_t v88[8];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v63 = v4;
  -[_LTOnlineTranslationEngine cancelServerTimeout](self, "cancelServerTimeout");
  v64 = objc_alloc_init(FTMutableBatchTranslationRequest);
  -[_LTBatchTranslationResponseHandler requestID](self->batchTranslationResponseHandler, "requestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest setRequest_id:](v64, "setRequest_id:", v5);

  -[_LTBatchTranslationResponseHandler taskHint](self->batchTranslationResponseHandler, "taskHint");
  _LTTranslationModelTaskString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest setTask:](v64, "setTask:", v6);

  -[_LTBatchTranslationResponseHandler clientIdentifier](self->batchTranslationResponseHandler, "clientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest setApp_id:](v64, "setApp_id:", v7);

  -[_LTBatchTranslationResponseHandler sessionID](self->batchTranslationResponseHandler, "sessionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest setSession_id:](v64, "setSession_id:", v8);

  objc_msgSend(v4, "sourceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "sourceURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableBatchTranslationRequest setUrl:](v64, "setUrl:", v11);

  }
  objc_msgSend(v4, "batchedParagraphs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "paragraphs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest setParagraphs:](v64, "setParagraphs:", v13);

  objc_msgSend(v4, "paragraph");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest setIs_partial:](v64, "setIs_partial:", objc_msgSend(v14, "isFinal") ^ 1);

  objc_msgSend(v4, "sourceLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_ltLocaleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest setSource_language:](v64, "setSource_language:", v16);

  objc_msgSend(v4, "targetLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_ltLocaleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTMutableBatchTranslationRequest setTarget_language:](v64, "setTarget_language:", v18);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "siriDataSharingOptInStatus");
  if ((unint64_t)(v20 - 1) > 2)
    v21 = 0;
  else
    v21 = qword_249338758[v20 - 1];

  -[FTMutableBatchTranslationRequest setOpt_in_status:](v64, "setOpt_in_status:", LTDOspreyDataSharingStatus(v21));
  v59 = objc_alloc_init(FTMutableTranslationOptions);
  -[FTMutableTranslationOptions setEnable_disambiguation_alternatives:](v59, "setEnable_disambiguation_alternatives:", objc_msgSend(v4, "supportsGenderDisambiguation"));
  -[FTMutableTranslationOptions setDisable_payload_logging:](v59, "setDisable_payload_logging:", LTDDisablePayloadLogging(v21));
  -[FTMutableBatchTranslationRequest setOptions:](v64, "setOptions:", v59);
  v22 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[_LTOnlineTranslationEngine sendBatchTranslationRequestWithDelegate:].cold.1(-[FTMutableTranslationOptions enable_disambiguation_alternatives](v59, "enable_disambiguation_alternatives"), v88, v22);

  _LTOSLogTranslationEngine();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_generate(v23);
  v25 = v23;
  v26 = v25;
  spid = v24;
  log = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    objc_msgSend(v63, "requestID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v81 = (uint64_t)v27;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, log, OS_SIGNPOST_INTERVAL_BEGIN, v24, "TranslateParagraph", "Online: Translating paragraph: %{public}@", buf, 0xCu);

    v26 = log;
  }

  _LTPreferencesOspreyEndpointURL();
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v63, "requestID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[FTMutableBatchTranslationRequest task](v64, "task");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "sessionID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v81 = (uint64_t)v29;
    v82 = 2114;
    v83 = v30;
    v84 = 2114;
    v85 = v31;
    v86 = 2114;
    v87 = v61;
    _os_log_impl(&dword_2491B9000, v28, OS_LOG_TYPE_INFO, "Sending batch for requestID: %{public}@, task: %{public}@, sessionID: %{public}@, URL: %{public}@", buf, 0x2Au);

  }
  v62 = objc_alloc_init(FTMutableBatchTranslationStreamingRequest);
  -[FTMutableBatchTranslationStreamingRequest setContentAsFTBatchTranslationRequest:](v62, "setContentAsFTBatchTranslationRequest:", v64);
  -[FTMutableBatchTranslationStreamingRequest setContent_type:](v62, "setContent_type:", 1);
  objc_msgSend(v63, "setRequest:", v64);
  v32 = (id)_LTOSLogTranslationEngine();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v63, "batchedParagraphs");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "count");
    *(_DWORD *)buf = 134217984;
    v81 = v56;
    _os_log_debug_impl(&dword_2491B9000, v32, OS_LOG_TYPE_DEBUG, "Translating with online engine: %zu batched paragraph(s)", buf, 0xCu);

  }
  selfLoggingManager = self->_selfLoggingManager;
  objc_msgSend(v63, "logIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "requestID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTDSELFLoggingManager sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:](selfLoggingManager, "sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:", v34, v35, 1, 1, objc_msgSend(v63, "bufferSize"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[FTMutableBatchTranslationRequest paragraphs](v64, "paragraphs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
  if (v38)
  {
    v39 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v76 != v39)
          objc_enumerationMutation(v36);
        v41 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        v42 = objc_alloc(MEMORY[0x24BDD1458]);
        objc_msgSend(v41, "text");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = (void *)objc_msgSend(v42, "initWithString:", v43);

        objc_msgSend(v44, "lt_sentences");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

        v37 += v46;
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v75, v79, 16);
    }
    while (v38);
  }

  -[_LTOnlineTranslationEngine _serviceForTask:](self, "_serviceForTask:", objc_msgSend(v63, "taskHint"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = MEMORY[0x24BDAC760];
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke;
  v72[3] = &unk_251A134F0;
  v73 = v64;
  v74 = v63;
  v65[0] = v48;
  v65[1] = 3221225472;
  v65[2] = __70___LTOnlineTranslationEngine_sendBatchTranslationRequestWithDelegate___block_invoke_2;
  v65[3] = &unk_251A13540;
  v65[4] = self;
  v49 = log;
  v66 = v49;
  v70 = spid;
  v50 = v73;
  v67 = v50;
  v51 = v57;
  v68 = v51;
  v71 = v37;
  v52 = v74;
  v69 = v52;
  objc_msgSend(v47, "performBatchTranslationWithDelegate:requestBuilder:completion:", v52, v72, v65);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (v53)
  {
    objc_msgSend(v53, "sendBatchTranslationStreamingRequest:", v62);
    objc_msgSend(v53, "closeStream");
  }
  batchTranslationResponseHandler = self->batchTranslationResponseHandler;
  self->batchTranslationResponseHandler = 0;

}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *translationQueue;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36[2];
  id buf[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, "Start translating sentence with online engine", (uint8_t *)buf, 2u);
  }
  +[_LTAnalyticsEvent timedEventWithName:](_LTAnalyticsEvent, "timedEventWithName:", CFSTR("OnlineTextTranslation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localePair");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sourceLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceLocale:", v14);

  objc_msgSend(v9, "localePair");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "targetLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTargetLocale:", v16);

  objc_msgSend(v12, "addFieldsFromDictionary:", &unk_251A509E8);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF64A0]), "initWithIdentifier:text:spans:isFinal:", v18, v8, 0, 1);
  _LTOSLogTranslationEngine();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (char *)os_signpost_id_generate(v20);
  v22 = v20;
  v23 = v22;
  if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_2491B9000, v23, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v21, "TranslateSentence", "Online: Translating sentence", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  translationQueue = self->_translationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71___LTOnlineTranslationEngine_translateSentence_withContext_completion___block_invoke;
  block[3] = &unk_251A13590;
  objc_copyWeak(v36, buf);
  v31 = v19;
  v32 = v9;
  v33 = v23;
  v34 = v12;
  v36[1] = v21;
  v35 = v10;
  v25 = v10;
  v26 = v12;
  v27 = v23;
  v28 = v9;
  v29 = v19;
  dispatch_async(translationQueue, block);

  objc_destroyWeak(v36);
  objc_destroyWeak(buf);

}

- (void)translate:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *translationQueue;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(v10, "count"))
  {
    v14 = (id)_LTOSLogTranslationEngine();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v34 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_2491B9000, v14, OS_LOG_TYPE_INFO, "Start translating %zu paragraphs with online engine", buf, 0xCu);
    }

    +[_LTAnalyticsEvent timedEventWithName:](_LTAnalyticsEvent, "timedEventWithName:", CFSTR("OnlineTextTranslation"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localePair");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sourceLocale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSourceLocale:", v17);

    objc_msgSend(v11, "localePair");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "targetLocale");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTargetLocale:", v19);

    objc_initWeak((id *)buf, self);
    translationQueue = self->_translationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __79___LTOnlineTranslationEngine_translate_withContext_paragraphResult_completion___block_invoke;
    block[3] = &unk_251A13630;
    objc_copyWeak(&v32, (id *)buf);
    v28 = v10;
    v29 = v11;
    v30 = v12;
    v31 = v13;
    dispatch_async(translationQueue, block);

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v21 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[_LTOnlineTranslationEngine translate:withContext:paragraphResult:completion:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD1540];
    v35[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("GENERIC_FAILURE_ERROR_DESCRIPTION"), &stru_251A15610, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v23;
    v35[1] = *MEMORY[0x24BDD0FD8];
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("INPUT_EMPTY_ERROR_DESCRIPTION"), &stru_251A15610, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDF6530], 3, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v13 + 2))(v13, v26);
  }

}

- (void)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _LTOspreySpeechTranslationSession *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  _LTOspreySpeechTranslationSession *v16;
  void *v17;
  _LTOspreySpeechTranslationSession *v18;
  _LTDSELFLoggingManager *selfLoggingManager;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _LTOspreySpeechTranslationSession *speechSession;
  _LTOspreySpeechTranslationSession *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  _LTOspreySpeechTranslationSession *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[_LTOnlineTranslationEngine _hasOngoingSpeechSession](self, "_hasOngoingSpeechSession"))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "siriDataSharingOptInStatus") - 1;
    if (v14 > 2)
      v15 = 0;
    else
      v15 = qword_249338758[v14];
    objc_msgSend(v8, "setDataSharingOptInStatus:", v15);

    v16 = [_LTOspreySpeechTranslationSession alloc];
    -[_LTOnlineTranslationEngine _serviceForTask:](self, "_serviceForTask:", objc_msgSend(v8, "taskHint"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[_LTOspreySpeechTranslationSession initWithService:context:text:delegate:selfLoggingManager:](v16, "initWithService:context:text:delegate:selfLoggingManager:", v17, v8, v9, v10, self->_selfLoggingManager);

    selfLoggingManager = self->_selfLoggingManager;
    objc_msgSend(v8, "logIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uniqueID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTDSELFLoggingManager sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:](selfLoggingManager, "sendFrameworkRequestWithInvocationId:qssSessionId:requestType:requestRoute:requestSize:", v20, v21, 2, 1, objc_msgSend(v9, "length"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak((id *)buf, self);
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __84___LTOnlineTranslationEngine_startTextToSpeechTranslationWithContext_text_delegate___block_invoke;
    v34[3] = &unk_251A13680;
    objc_copyWeak(&v36, (id *)buf);
    v35 = v22;
    v23 = v22;
    -[_LTOspreySpeechTranslationSession setCompletionBlock:](v18, "setCompletionBlock:", v34);
    speechSession = self->_speechSession;
    self->_speechSession = v18;
    v25 = v18;

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "overrideOngoingSessionIfNeeded"))
  {
    v11 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = self->_speechSession;
      *(_DWORD *)buf = 134217984;
      v38 = v12;
      _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, "Context allows overriding ongoing speech session %p; cancelling existing session and creating a new one for TTS",
        buf,
        0xCu);
    }
    -[_LTOspreySpeechTranslationSession cancel](self->_speechSession, "cancel");
    goto LABEL_6;
  }
  v26 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[_LTOnlineTranslationEngine startTextToSpeechTranslationWithContext:text:delegate:].cold.1((uint64_t)self, v26, v27, v28, v29, v30, v31, v32);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "lt_speechTranslationOngoing");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "translationDidFinishWithError:", v33);

  }
LABEL_10:

}

- (void)setLanguagesRecognized:(id)a3 context:(id)a4
{
  -[_LTOspreySpeechTranslationSession setLanguagesRecognized:](self->_speechSession, "setLanguagesRecognized:", a3, a4);
}

- (void)addSpeechAudioData:(id)a3
{
  -[_LTOspreySpeechTranslationSession sendAudioData:](self->_speechSession, "sendAudioData:", a3);
}

- (void)endpoint
{
  -[_LTOspreySpeechTranslationSession endpoint](self->_speechSession, "endpoint");
}

- (void)endAudio
{
  -[_LTOspreySpeechTranslationSession sendEndAudio](self->_speechSession, "sendEndAudio");
}

- (BOOL)_hasOngoingSpeechSession
{
  _LTOspreySpeechTranslationSession *speechSession;
  _LTOspreySpeechTranslationSession **p_speechSession;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  p_speechSession = &self->_speechSession;
  speechSession = self->_speechSession;
  if (speechSession)
  {
    v4 = -[_LTOspreySpeechTranslationSession isCancelled](speechSession, "isCancelled");
    if (v4)
    {
      v5 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[_LTOnlineTranslationEngine _hasOngoingSpeechSession].cold.1((uint64_t)p_speechSession, v5, v6, v7, v8, v9, v10, v11);
    }
    LOBYTE(speechSession) = !v4;
  }
  return (char)speechSession;
}

- (void)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _LTOspreySpeechTranslationSession *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  _LTOspreySpeechTranslationSession *v14;
  void *v15;
  _LTOspreySpeechTranslationSession *speechSession;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  _LTOspreySpeechTranslationSession *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!-[_LTOnlineTranslationEngine _hasOngoingSpeechSession](self, "_hasOngoingSpeechSession"))
  {
LABEL_6:
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "siriDataSharingOptInStatus") - 1;
    if (v11 > 2)
      v12 = 0;
    else
      v12 = qword_249338758[v11];
    objc_msgSend(v6, "setDataSharingOptInStatus:", v12);

    -[_LTOnlineTranslationEngine _serviceForTask:](self, "_serviceForTask:", objc_msgSend(v6, "taskHint"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_LTOspreySpeechTranslationSession initWithService:context:delegate:selfLoggingManager:]([_LTOspreySpeechTranslationSession alloc], "initWithService:context:delegate:selfLoggingManager:", v13, v6, v7, self->_selfLoggingManager);
    -[_LTOnlineTranslationEngine ttsCache](self, "ttsCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_LTOspreySpeechTranslationSession setTtsCache:](v14, "setTtsCache:", v15);

    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __73___LTOnlineTranslationEngine_startSpeechTranslationWithContext_delegate___block_invoke;
    v24[3] = &unk_251A136A8;
    objc_copyWeak(&v25, (id *)buf);
    -[_LTOspreySpeechTranslationSession setCompletionBlock:](v14, "setCompletionBlock:", v24);
    speechSession = self->_speechSession;
    self->_speechSession = v14;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "overrideOngoingSessionIfNeeded"))
  {
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_speechSession;
      *(_DWORD *)buf = 134217984;
      v27 = v9;
      _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "Context allows overriding ongoing speech session %p; cancelling existing session and creating a new one",
        buf,
        0xCu);
    }
    -[_LTOspreySpeechTranslationSession cancel](self->_speechSession, "cancel");
    goto LABEL_6;
  }
  v17 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[_LTOnlineTranslationEngine startSpeechTranslationWithContext:delegate:].cold.1((uint64_t)self, v17, v18, v19, v20, v21, v22, v23);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "lt_speechTranslationOngoing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "translationDidFinishWithError:", v13);
LABEL_10:

  }
}

- (void)_speechSessionCompletedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _LTOspreySpeechTranslationSession *speechSession;
  uint8_t v14[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serverQueue);
  if (v4)
  {
    v5 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[_LTOnlineTranslationEngine _speechSessionCompletedWithError:].cold.1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    v12 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2491B9000, v12, OS_LOG_TYPE_INFO, "Completed current speech session successfully", v14, 2u);
    }
  }
  speechSession = self->_speechSession;
  self->_speechSession = 0;

}

- (void)cancelSpeechTranslation:(BOOL)a3
{
  NSObject *serverQueue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  serverQueue = self->_serverQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54___LTOnlineTranslationEngine_cancelSpeechTranslation___block_invoke;
  block[3] = &unk_251A130B0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  dispatch_async(serverQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (_LTTextToSpeechCache)ttsCache
{
  return self->_ttsCache;
}

- (void)setTtsCache:(id)a3
{
  objc_storeStrong((id *)&self->_ttsCache, a3);
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serverQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_ttsCache, 0);
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_serverTimer, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->batchTranslationResponseHandler, 0);
  objc_storeStrong((id *)&self->_speechSession, 0);
  objc_storeStrong((id *)&self->_translationQueue, 0);
  objc_storeStrong((id *)&self->_webTaskService, 0);
  objc_storeStrong((id *)&self->_systemService, 0);
  objc_storeStrong((id *)&self->_siriService, 0);
  objc_storeStrong((id *)&self->_blazarService, 0);
}

- (void)_createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_14_0();
  *(_DWORD *)v1 = 138739971;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_5(&dword_2491B9000, v3, (uint64_t)v3, "Spans: %{sensitive}@", v4);

  OUTLINED_FUNCTION_16();
}

- (void)_createOrUpdateBatchTranslationRequestWithParagraph:index:context:completion:.cold.2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_12_0();
  *(_DWORD *)v2 = 138740227;
  *(_QWORD *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2114;
  *(_QWORD *)(v2 + 14) = v4;
  OUTLINED_FUNCTION_8_2(&dword_2491B9000, "Translating: %{sensitive}@ request_id %{public}@", v5, v6);

  OUTLINED_FUNCTION_16();
}

- (void)sendBatchTranslationRequestWithDelegate:(os_log_t)log .cold.1(char a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1 & 1;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "Disambiguation: Creating online batch request, setting option for enable_disambiguation_alternatives: %{BOOL}i", buf, 8u);
}

- (void)translate:withContext:paragraphResult:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to translate paragraphs because there's nothing to translate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)startTextToSpeechTranslationWithContext:(uint64_t)a3 text:(uint64_t)a4 delegate:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Online speech or text to speech translation already ongoing with session: %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)_hasOngoingSpeechSession
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Speech session %p still exists, but the session was already cancelled without the ivar being set to nil; continuing "
    "as-if there wasn't a previous session",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_1_2();
}

- (void)startSpeechTranslationWithContext:(uint64_t)a3 delegate:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Online speech translation already ongoing with session: %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_2();
}

- (void)_speechSessionCompletedWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, a2, a3, "Invalidating current speech session with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_2();
}

@end
