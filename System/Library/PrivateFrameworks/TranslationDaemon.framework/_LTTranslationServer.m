@implementation _LTTranslationServer

- (_LTTranslationServer)init
{
  _LTTranslationServer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  _LTDTranslationOperationScheduler *v5;
  _LTDTranslationOperationScheduler *translationEngineScheduler;
  _LTTextToSpeechCache *v7;
  _LTTextToSpeechCache *ttsCache;
  _LTLoggingRequestHandler *v9;
  _LTLoggingRequestHandler *logger;
  _LTActivityLogger *v11;
  _LTActivityLogger *activityLogger;
  _LTDSELFLoggingManager *v13;
  _LTDSELFLoggingManager *selfLoggingManager;
  uint64_t v15;
  NSMutableSet *pendingSpeechSessionIDs;
  _LTTranslationServer *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_LTTranslationServer;
  v2 = -[_LTTranslationServer init](&v19, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.translationd.server", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = -[_LTDTranslationOperationScheduler initWithQueue:]([_LTDTranslationOperationScheduler alloc], "initWithQueue:", v2->_queue);
    translationEngineScheduler = v2->_translationEngineScheduler;
    v2->_translationEngineScheduler = v5;

    v7 = objc_alloc_init(_LTTextToSpeechCache);
    ttsCache = v2->_ttsCache;
    v2->_ttsCache = v7;

    v9 = objc_alloc_init(_LTLoggingRequestHandler);
    logger = v2->_logger;
    v2->_logger = v9;

    v11 = objc_alloc_init(_LTActivityLogger);
    activityLogger = v2->_activityLogger;
    v2->_activityLogger = v11;

    v13 = objc_alloc_init(_LTDSELFLoggingManager);
    selfLoggingManager = v2->_selfLoggingManager;
    v2->_selfLoggingManager = v13;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    pendingSpeechSessionIDs = v2->_pendingSpeechSessionIDs;
    v2->_pendingSpeechSessionIDs = (NSMutableSet *)v15;

    -[_LTTranslationServer _logStateSoon](v2, "_logStateSoon");
    v17 = v2;
  }

  return v2;
}

- (id)_offlineEngineForContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _LTTranslationEngine *v8;
  _LTOfflineAssetManager *v9;
  void *v10;
  void *v11;
  id v12;
  _LTTranslationEngine *offlineCachedEngine;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  _LTTranslationEngine *v26;
  _LTTranslationEngine *v27;
  _LTOfflineTranslationEngine *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  _LTOfflineAssetManager *v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (_LTPreferencesTranslationIsDisabled())
  {
    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_LTTranslationServer _offlineEngineForContext:error:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "lt_translationNotWorking");
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_alloc_init(_LTOfflineAssetManager);
    objc_msgSend(v6, "localePair");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    -[_LTOfflineAssetManager speechTranslationAssetInfoForLocalePair:error:](v9, "speechTranslationAssetInfoForLocalePair:error:", v10, &v36);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v36;

    if (v11)
    {
      offlineCachedEngine = self->_offlineCachedEngine;
      objc_msgSend(v6, "localePair");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(offlineCachedEngine) = -[_LTTranslationEngine translatesPair:](offlineCachedEngine, "translatesPair:", v14);

      if ((_DWORD)offlineCachedEngine)
      {
        v15 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = v15;
          objc_msgSend(v6, "localePair");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v38 = v17;
          _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Reusing cached offline engine for locales: %{public}@", buf, 0xCu);

        }
        -[_LTTranslationServer _updateOfflineEngineIdleTimer](self, "_updateOfflineEngineIdleTimer");
        v8 = self->_offlineCachedEngine;
      }
      else
      {
        v27 = self->_offlineCachedEngine;
        self->_offlineCachedEngine = 0;

        v28 = [_LTOfflineTranslationEngine alloc];
        objc_msgSend(v6, "localePair");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[_LTOfflineTranslationEngine initWithLocalePair:assetInfo:selfLoggingManager:](v28, "initWithLocalePair:assetInfo:selfLoggingManager:", v29, v11, self->_selfLoggingManager);

        objc_msgSend(v6, "asrModelURLs");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTTranslationEngine setAsrModelURLs:](v8, "setAsrModelURLs:", v30);

        v31 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[_LTTranslationServer _offlineEngineForContext:error:].cold.3(v31);
        objc_msgSend(v6, "mtModelURL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[_LTTranslationEngine setMtModelURL:](v8, "setMtModelURL:", v32);

        -[_LTTranslationEngine setTtsCache:](v8, "setTtsCache:", self->_ttsCache);
        objc_storeStrong((id *)&self->_offlineCachedEngine, v8);
        -[_LTTranslationServer _updateOfflineEngineIdleTimer](self, "_updateOfflineEngineIdleTimer");
      }
    }
    else
    {
      v35 = v9;
      if (!v12
        || (objc_msgSend(v12, "domain"),
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            v18,
            v18 == CFSTR("LTTranslationDaemonErrorDomain")))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)MEMORY[0x24BDD1540];
        v20 = *MEMORY[0x24BDF6530];
        v39[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("GENERIC_FAILURE_ERROR_DESCRIPTION"), &stru_251A15610, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = v21;
        v39[1] = *MEMORY[0x24BDD0FD8];
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OFFLINE_MODELS_UNAVAILABLE_ERROR_DESCRIPTION"), &stru_251A15610, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", v20, 16, v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v24;
      }
      v25 = _LTOSLogAssets();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[_LTTranslationServer _offlineEngineForContext:error:].cold.2(v25);
      v9 = v35;
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      v26 = self->_offlineCachedEngine;
      self->_offlineCachedEngine = 0;

      -[_LTTranslationServer _cancelOfflineEngineIdleTimer](self, "_cancelOfflineEngineIdleTimer");
      v8 = 0;
    }

  }
  return v8;
}

- (id)_onlineEngineForContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  _LTTranslationEngine *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  _LTTranslationEngine *onlineCachedEngine;
  _LTOnlineTranslationEngine *v14;
  _LTTranslationEngine *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!_LTPreferencesTranslationIsDisabled())
  {
    _LTPreferencesSupportedLocalePairsForTask(objc_msgSend(v6, "taskHint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localePair");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", v10))
    {

    }
    else
    {
      objc_msgSend(v6, "localePair");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isPassthrough");

      if ((v12 & 1) == 0)
      {
        v16 = _LTOSLogTranslationEngine();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[_LTTranslationServer _onlineEngineForContext:error:].cold.2();
        v17 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(v6, "localePair");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lt_unsupporedLocalePairError:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (a4)
          *a4 = objc_retainAutorelease(v19);

        v8 = 0;
        goto LABEL_16;
      }
    }
    onlineCachedEngine = self->_onlineCachedEngine;
    if (!onlineCachedEngine)
    {
      v14 = -[_LTOnlineTranslationEngine initWithSelfLoggingManager:]([_LTOnlineTranslationEngine alloc], "initWithSelfLoggingManager:", self->_selfLoggingManager);
      -[_LTOnlineTranslationEngine setTtsCache:](v14, "setTtsCache:", self->_ttsCache);
      -[_LTOnlineTranslationEngine setServerQueue:](v14, "setServerQueue:", self->_queue);
      v15 = self->_onlineCachedEngine;
      self->_onlineCachedEngine = (_LTTranslationEngine *)v14;

      onlineCachedEngine = self->_onlineCachedEngine;
    }
    v8 = onlineCachedEngine;
LABEL_16:

    goto LABEL_17;
  }
  v7 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[_LTTranslationServer _onlineEngineForContext:error:].cold.1();
  objc_msgSend(MEMORY[0x24BDD1540], "lt_translationNotWorking");
  v8 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

  return v8;
}

- (id)_engineForContext:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _LTCombinedEngine *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v6 = a3;
  if (objc_msgSend(v6, "route") == 1)
  {
    v7 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "Creating offline engine", buf, 2u);
    }
    -[_LTTranslationServer _offlineEngineForContext:error:](self, "_offlineEngineForContext:error:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v10 = (_LTCombinedEngine *)v8;
    goto LABEL_23;
  }
  if (objc_msgSend(v6, "route") == 2)
  {
    v9 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_2491B9000, v9, OS_LOG_TYPE_INFO, "Creating online engine", v18, 2u);
    }
    -[_LTTranslationServer _onlineEngineForContext:error:](self, "_onlineEngineForContext:error:", v6, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  -[_LTTranslationServer _onlineEngineForContext:error:](self, "_onlineEngineForContext:error:", v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[_LTTranslationServer _offlineEngineForContext:error:](self, "_offlineEngineForContext:error:", v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = _LTOSLogTranslationEngine();
    v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2491B9000, v14, OS_LOG_TYPE_INFO, "Creating combined engine", v17, 2u);
      }
      v10 = objc_alloc_init(_LTCombinedEngine);
      -[_LTCombinedEngine setOfflineEngine:](v10, "setOfflineEngine:", v12);
      -[_LTCombinedEngine setOnlineEngine:](v10, "setOnlineEngine:", v11);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_LTTranslationServer _engineForContext:error:].cold.2();
      v10 = v11;
    }

  }
  else
  {
    v15 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_LTTranslationServer _engineForContext:error:].cold.1();
    v10 = 0;
  }

LABEL_23:
  return v10;
}

- (void)preheatWithContext:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _LTDTranslationOperationScheduler *translationEngineScheduler;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _LTTranslationServer *v17;
  id v18;
  SEL v19;

  v7 = a3;
  v8 = a4;
  translationEngineScheduler = self->_translationEngineScheduler;
  objc_msgSend(v7, "sessionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "route");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __54___LTTranslationServer_preheatWithContext_completion___block_invoke;
  v15[3] = &unk_251A13D98;
  v16 = v7;
  v17 = self;
  v18 = v8;
  v19 = a2;
  v12 = v8;
  v13 = v7;
  v14 = -[_LTDTranslationOperationScheduler scheduleOperationWithGroupID:route:block:](translationEngineScheduler, "scheduleOperationWithGroupID:route:block:", v10, v11, v15);

}

- (void)cancelExistingSessions
{
  NSObject *v3;
  _LTServerSpeechSession *speechSession;
  NSObject *v5;
  void *v6;
  _LTServerSpeechSession *v7;
  NSObject *v8;
  _LTServerSpeakSession *speakSession;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_speechSession)
  {
    v3 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      speechSession = self->_speechSession;
      v5 = v3;
      -[_LTServerSpeechSession sessionID](speechSession, "sessionID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Cancel ongoing speech session: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    -[_LTServerSpeechSession cancel](self->_speechSession, "cancel");
    v7 = self->_speechSession;
    self->_speechSession = 0;

  }
  if (self->_speakSession)
  {
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_2491B9000, v8, OS_LOG_TYPE_INFO, "Cancel ongoing speak session", (uint8_t *)&v10, 2u);
    }
    -[_LTServerSpeakSession cancel](self->_speakSession, "cancel");
    speakSession = self->_speakSession;
    self->_speakSession = 0;

  }
}

- (void)_cancelPendingSpeechOperations
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableSet allObjects](self->_pendingSpeechSessionIDs, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LTOSLogSpeech();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    *(_DWORD *)buf = 134218242;
    v17 = objc_msgSend(v3, "count");
    v18 = 2114;
    v19 = v3;
    _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Cancelling %zu sessionIDs for potentially pending speech requests: %{public}@", buf, 0x16u);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[_LTDTranslationOperationScheduler cancelOperationsWithGroupID:](self->_translationEngineScheduler, "cancelOperationsWithGroupID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[NSMutableSet removeAllObjects](self->_pendingSpeechSessionIDs, "removeAllObjects");
}

- (void)translateSentence:(id)a3 withContext:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  _LTDTranslationOperationScheduler *translationEngineScheduler;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_initWeak(&location, self);
  translationEngineScheduler = self->_translationEngineScheduler;
  objc_msgSend(v10, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "route");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __65___LTTranslationServer_translateSentence_withContext_completion___block_invoke;
  v19[3] = &unk_251A13DE8;
  v19[4] = self;
  v15 = v10;
  v20 = v15;
  v23[1] = (id)a2;
  v16 = v11;
  v22 = v16;
  v17 = v9;
  v21 = v17;
  objc_copyWeak(v23, &location);
  v18 = -[_LTDTranslationOperationScheduler scheduleOperationWithGroupID:route:block:](translationEngineScheduler, "scheduleOperationWithGroupID:route:block:", v13, v14, v19);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

}

- (void)translateParagraphs:(id)a3 withContext:(id)a4 paragraphResult:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _LTDTranslationOperationScheduler *translationEngineScheduler;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _LTTranslationServer *v26;
  id v27;
  id v28;
  id v29[2];
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_initWeak(&location, self);
  translationEngineScheduler = self->_translationEngineScheduler;
  objc_msgSend(v12, "sessionID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "route");
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __83___LTTranslationServer_translateParagraphs_withContext_paragraphResult_completion___block_invoke;
  v23[3] = &unk_251A13E38;
  v18 = v11;
  v24 = v18;
  v19 = v12;
  v25 = v19;
  v26 = self;
  v29[1] = (id)a2;
  v20 = v14;
  v27 = v20;
  v21 = v13;
  v28 = v21;
  objc_copyWeak(v29, &location);
  v22 = -[_LTDTranslationOperationScheduler scheduleOperationWithGroupID:route:block:](translationEngineScheduler, "scheduleOperationWithGroupID:route:block:", v16, v17, v23);

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);

}

- (void)textStreamingConfigurationWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65___LTTranslationServer_textStreamingConfigurationWithCompletion___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (id)startTextToSpeechTranslationWithContext:(id)a3 text:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _LTDTranslationOperationScheduler *translationEngineScheduler;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _LTTranslationServer *v28;
  id v29;
  id v30;
  id v31;
  id v32[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[_LTTranslationServer _effectiveGroupIDForContext:](self, "_effectiveGroupIDForContext:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationServer _markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:](self, "_markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:", v9, v13);
  translationEngineScheduler = self->_translationEngineScheduler;
  v15 = objc_msgSend(v9, "route");
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __78___LTTranslationServer_startTextToSpeechTranslationWithContext_text_delegate___block_invoke;
  v25[3] = &unk_251A13E88;
  objc_copyWeak(v32, &location);
  v16 = v13;
  v26 = v16;
  v17 = v9;
  v27 = v17;
  v28 = self;
  v32[1] = (id)a2;
  v18 = v11;
  v29 = v18;
  v19 = v12;
  v30 = v19;
  v20 = v10;
  v31 = v20;
  v21 = -[_LTDTranslationOperationScheduler scheduleOperationWithGroupID:route:block:](translationEngineScheduler, "scheduleOperationWithGroupID:route:block:", v16, v15, v25);
  v22 = v31;
  v23 = v19;

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);

  return v23;
}

- (void)speak:(id)a3 withContext:(id)a4 delegate:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _LTDTranslationOperationScheduler *translationEngineScheduler;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _LTTranslationServer *v27;
  id v28;
  id v29;
  id v30;
  id v31[2];
  id location;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_initWeak(&location, self);
  -[_LTTranslationServer _effectiveGroupIDForContext:](self, "_effectiveGroupIDForContext:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationServer _markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:](self, "_markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:", v12, v15);
  translationEngineScheduler = self->_translationEngineScheduler;
  v17 = objc_msgSend(v12, "route");
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __62___LTTranslationServer_speak_withContext_delegate_completion___block_invoke;
  v24[3] = &unk_251A13F00;
  objc_copyWeak(v31, &location);
  v18 = v15;
  v25 = v18;
  v19 = v12;
  v26 = v19;
  v27 = self;
  v31[1] = (id)a2;
  v20 = v14;
  v30 = v20;
  v21 = v11;
  v28 = v21;
  v22 = v13;
  v29 = v22;
  v23 = -[_LTDTranslationOperationScheduler scheduleOperationWithGroupID:route:block:](translationEngineScheduler, "scheduleOperationWithGroupID:route:block:", v18, v17, v24);

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);

}

- (id)startSpeechTranslationWithContext:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _LTDTranslationOperationScheduler *translationEngineScheduler;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _LTTranslationServer *v24;
  id v25;
  id v26;
  id v27[2];
  id location;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[_LTTranslationServer _effectiveGroupIDForContext:](self, "_effectiveGroupIDForContext:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LTTranslationServer _markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:](self, "_markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:", v7, v10);
  translationEngineScheduler = self->_translationEngineScheduler;
  v12 = objc_msgSend(v7, "route");
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __67___LTTranslationServer_startSpeechTranslationWithContext_delegate___block_invoke;
  v21[3] = &unk_251A13F28;
  objc_copyWeak(v27, &location);
  v13 = v10;
  v22 = v13;
  v14 = v7;
  v23 = v14;
  v24 = self;
  v15 = v8;
  v25 = v15;
  v27[1] = (id)a2;
  v16 = v9;
  v26 = v16;
  v17 = -[_LTDTranslationOperationScheduler scheduleOperationWithGroupID:route:block:](translationEngineScheduler, "scheduleOperationWithGroupID:route:block:", v13, v12, v21);
  v18 = v26;
  v19 = v16;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);

  return v19;
}

- (void)cancelSpeechSession
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43___LTTranslationServer_cancelSpeechSession__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cancelSpeechSessionWithID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50___LTTranslationServer_cancelSpeechSessionWithID___block_invoke;
  block[3] = &unk_251A10FD0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_speechSessionCompleted
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47___LTTranslationServer__speechSessionCompleted__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
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
  if (v4)
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43___LTTranslationServer_addSpeechAudioData___block_invoke;
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
  v4[2] = __32___LTTranslationServer_endAudio__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)autoDetectSpeechUnsupportedPairsWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71___LTTranslationServer_autoDetectSpeechUnsupportedPairsWithCompletion___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (id)_modalitiesPerLocale
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v12;

  _LTPreferencesSupportedLocales(1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  +[_LTDConfigurationService asrConfigurationWithError:](_LTDConfigurationService, "asrConfigurationWithError:", &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  v5 = v2;
  if (v4)
  {
    v6 = _LTOSLogAssets();
    v7 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[_LTTranslationServer _modalitiesPerLocale].cold.2();
      v7 = v5;
    }
  }
  else
  {
    objc_msgSend(v3, "locales");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = v5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6408]), "initWithSupportedLocales:asrLocales:ttsLocales:", v8, v7, v8);
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_LTTranslationServer _modalitiesPerLocale].cold.1(v10);

  return v9;
}

- (void)modalitiesPerLocaleWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58___LTTranslationServer_modalitiesPerLocaleWithCompletion___block_invoke;
  v7[3] = &unk_251A129D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)_effectiveGroupIDForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "sessionID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 || !objc_msgSend(v3, "cancelOnCleanup"))
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)_markPendingSpeechSessionIfNeededWithContext:(id)a3 effectiveSessionID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (v7 && objc_msgSend(v6, "cancelOnCleanup"))
  {
    v8 = _LTOSLogSpeech();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_LTTranslationServer _markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:].cold.1();
    queue = self->_queue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __88___LTTranslationServer__markPendingSpeechSessionIfNeededWithContext_effectiveSessionID___block_invoke;
    v10[3] = &unk_251A13990;
    v10[4] = self;
    v11 = v7;
    dispatch_async(queue, v10);

  }
}

- (void)_removePendingSpeechSessionID:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = _LTOSLogSpeech();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[_LTTranslationServer _removePendingSpeechSessionID:].cold.1();
    -[NSMutableSet removeObject:](self->_pendingSpeechSessionIDs, "removeObject:", v4);
  }

}

- (void)registerActivity:(int64_t)a3
{
  -[_LTActivityLogger registerActivity:](self->_activityLogger, "registerActivity:", a3);
}

- (void)_logStateSoon
{
  uint64_t v3;
  void *v4;
  dispatch_time_t v5;
  OS_dispatch_queue *v6;
  void *v7;
  OS_dispatch_queue *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  OS_dispatch_queue *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __37___LTTranslationServer__logStateSoon__block_invoke;
  v14[3] = &unk_251A111A0;
  objc_copyWeak(&v15, &location);
  v4 = (void *)MEMORY[0x2495AE9CC](v14);
  v5 = dispatch_time(0, 5000000000);
  dispatch_after(v5, (dispatch_queue_t)self->_queue, v4);
  v6 = self->_queue;
  v7 = (void *)MEMORY[0x24BDBCF40];
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __37___LTTranslationServer__logStateSoon__block_invoke_41;
  v11[3] = &unk_251A13F70;
  v8 = v6;
  v12 = v8;
  v9 = v4;
  v13 = v9;
  v10 = (id)objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, v11, 10800.0);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)startLoggingRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44___LTTranslationServer_startLoggingRequest___block_invoke;
  block[3] = &unk_251A10FD0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)clearCaches
{
  +[_LTDAssetService setNeedsCatalogRefresh:](_LTDAssetService, "setNeedsCatalogRefresh:", 1);
}

- (void)notifyOfMemoryPressure
{
  -[_LTTextToSpeechCache clear](self->_ttsCache, "clear");
}

- (void)cleanupOfflineEngine
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44___LTTranslationServer_cleanupOfflineEngine__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)cleanup
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31___LTTranslationServer_cleanup__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)attemptToCancelRequestsWithSessionID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___LTTranslationServer_attemptToCancelRequestsWithSessionID___block_invoke;
  block[3] = &unk_251A10FD0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)shouldPresentSystemFirstUseConsent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59___LTTranslationServer_shouldPresentSystemFirstUseConsent___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)languageForText:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51___LTTranslationServer_languageForText_completion___block_invoke;
  v11[3] = &unk_251A12770;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

}

- (void)languagesForText:(id)a3 completion:(id)a4
{
  -[_LTTranslationServer languagesForText:usingModel:completion:](self, "languagesForText:usingModel:completion:", a3, 0, a4);
}

- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 completion:(id)a5
{
  -[_LTTranslationServer languagesForText:usingModel:strategy:completion:](self, "languagesForText:usingModel:strategy:completion:", a3, a4, 0, a5);
}

- (void)languagesForText:(id)a3 usingModel:(unint64_t)a4 strategy:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unint64_t v18;
  unint64_t v19;

  v10 = a3;
  v11 = a6;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72___LTTranslationServer_languagesForText_usingModel_strategy_completion___block_invoke;
  v15[3] = &unk_251A12300;
  v18 = a4;
  v19 = a5;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, v15);

}

- (void)languageAssetsWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  unint64_t v11;

  v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61___LTTranslationServer_languageAssetsWithOptions_completion___block_invoke;
  v9[3] = &unk_251A119B8;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)setLanguageAssets:(id)a3 options:(unint64_t)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __70___LTTranslationServer_setLanguageAssets_options_progress_completion___block_invoke;
  v17[3] = &unk_251A12638;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a4;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, v17);

}

- (void)_offlineLanguageStatus:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47___LTTranslationServer__offlineLanguageStatus___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)_downloadAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79___LTTranslationServer__downloadAssetForLanguagePair_userInitiated_completion___block_invoke;
  v14[3] = &unk_251A13FC0;
  v18 = a4;
  v16 = v10;
  v17 = a2;
  v15 = v9;
  v12 = v10;
  v13 = v9;
  dispatch_async(queue, v14);

}

- (void)_purgeAssetForLanguagePair:(id)a3 userInitiated:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  SEL v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  queue = self->_queue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __76___LTTranslationServer__purgeAssetForLanguagePair_userInitiated_completion___block_invoke;
  v14[3] = &unk_251A13FC0;
  v18 = a4;
  v16 = v10;
  v17 = a2;
  v15 = v9;
  v12 = v10;
  v13 = v9;
  dispatch_async(queue, v14);

}

- (void)_purgeAllAssetsExcludingConfig:(BOOL)a3 completion:(id)a4
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  SEL v12;
  BOOL v13;

  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66___LTTranslationServer__purgeAllAssetsExcludingConfig_completion___block_invoke;
  block[3] = &unk_251A13FE8;
  v13 = a3;
  v11 = v7;
  v12 = a2;
  v9 = v7;
  dispatch_async(queue, block);

}

- (void)_updateAllAssets:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __41___LTTranslationServer__updateAllAssets___block_invoke;
  v8[3] = &unk_251A119B8;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)installedLocales:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41___LTTranslationServer_installedLocales___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)installedLocalesForTask:(int64_t)a3 completion:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = a4;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59___LTTranslationServer_installedLocalesForTask_completion___block_invoke;
  block[3] = &unk_251A11A98;
  objc_copyWeak(&v10, &location);
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)startInstallRequest:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53___LTTranslationServer_startInstallRequest_delegate___block_invoke;
  v11[3] = &unk_251A13990;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

}

- (void)_getAssetSize:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  SEL v10;

  v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38___LTTranslationServer__getAssetSize___block_invoke;
  v8[3] = &unk_251A119B8;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (void)availableLocalePairsForTask:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63___LTTranslationServer_availableLocalePairsForTask_completion___block_invoke;
  v9[3] = &unk_251A119B8;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(queue, v9);

}

- (void)additionalLikelyPreferredLocalesForLocale:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77___LTTranslationServer_additionalLikelyPreferredLocalesForLocale_completion___block_invoke;
  v11[3] = &unk_251A129D0;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, v11);

}

- (void)configInfoForLocale:(id)a3 otherLocale:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67___LTTranslationServer_configInfoForLocale_otherLocale_completion___block_invoke;
  block[3] = &unk_251A140C8;
  v17 = v9;
  v18 = v10;
  v16 = v8;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, block);

}

- (void)task:(int64_t)a3 isSupportedInCountry:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___LTTranslationServer_task_isSupportedInCountry_completion___block_invoke;
  block[3] = &unk_251A111C8;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)_updateHotfix:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38___LTTranslationServer__updateHotfix___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)_deleteHotfix:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38___LTTranslationServer__deleteHotfix___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)onDeviceModeEnabled:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44___LTTranslationServer_onDeviceModeEnabled___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)onDeviceModeSupported:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46___LTTranslationServer_onDeviceModeSupported___block_invoke;
  block[3] = &unk_251A111C8;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

- (void)selfLoggingEventWithData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49___LTTranslationServer_selfLoggingEventWithData___block_invoke;
  block[3] = &unk_251A10FD0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)selfLoggingLanguageIdentificationCompletedWithLIDData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78___LTTranslationServer_selfLoggingLanguageIdentificationCompletedWithLIDData___block_invoke;
  block[3] = &unk_251A10FD0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)scheduleAssetCleanupWork:(id)a3
{
  id v4;
  _LTDTranslationOperationScheduler *translationEngineScheduler;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  translationEngineScheduler = self->_translationEngineScheduler;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49___LTTranslationServer_scheduleAssetCleanupWork___block_invoke;
  v8[3] = &unk_251A14140;
  v6 = v4;
  v9 = v6;
  objc_copyWeak(&v10, &location);
  v7 = -[_LTDTranslationOperationScheduler scheduleOperationWithGroupID:route:block:](translationEngineScheduler, "scheduleOperationWithGroupID:route:block:", 0, 1, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_offlineEngineIdleTimer, 0);
  objc_storeStrong((id *)&self->_selfLoggingManager, 0);
  objc_storeStrong((id *)&self->_activityLogger, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_pendingSpeechSessionIDs, 0);
  objc_storeStrong((id *)&self->_speakSession, 0);
  objc_storeStrong((id *)&self->_speechSession, 0);
  objc_storeStrong((id *)&self->_ttsCache, 0);
  objc_storeStrong((id *)&self->_translationEngineScheduler, 0);
  objc_storeStrong((id *)&self->_onlineCachedEngine, 0);
  objc_storeStrong((id *)&self->_offlineCachedEngine, 0);
}

- (void)_offlineEngineForContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to create offline engine.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_offlineEngineForContext:(void *)a1 error:.cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "localePair");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v1, v4, "No asset info found for pair %{public}@", v5);

  OUTLINED_FUNCTION_1_3();
}

- (void)_offlineEngineForContext:(void *)a1 error:.cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_8(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3_1(), "mtModelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4_0(&dword_2491B9000, v3, v4, "MT model URL: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_9();
}

- (void)_onlineEngineForContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unable to create online engine.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_onlineEngineForContext:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_2491B9000, v0, v1, "Unsupported language pair requested for online engine", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

- (void)_engineForContext:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Could not create online engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)_engineForContext:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Could not create offline engine, using online only: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)_modalitiesPerLocale
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "Failed to read ASR configuration locale identifiers %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

- (void)_markPendingSpeechSessionIfNeededWithContext:effectiveSessionID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v0, v1, "Marking a speech session as pending: %{public}@", v2);
  OUTLINED_FUNCTION_1_2();
}

- (void)_removePendingSpeechSessionID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_2491B9000, v0, v1, "Removing a pending speech sessionID since it's starting: %{public}@", v2);
  OUTLINED_FUNCTION_1_2();
}

@end
