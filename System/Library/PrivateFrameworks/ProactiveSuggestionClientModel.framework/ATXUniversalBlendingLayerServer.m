@implementation ATXUniversalBlendingLayerServer

- (void)clientModelUpdatedSuggestions:(id)a3 feedbackMetadata:(id)a4 clientModelId:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  ATXClientModelCacheUpdate *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  __atxlog_handle_xpc();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  __atxlog_handle_xpc();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "updateSuggestionsFromClientModel", " enableTelemetry=YES ", buf, 2u);
  }

  __atxlog_handle_blending();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 138543618;
    v30 = v12;
    v31 = 2048;
    v32 = v19;
    _os_log_impl(&dword_1AA841000, v18, OS_LOG_TYPE_DEFAULT, "Blending: <<%{public}@>> client model produced %lu new suggestions. Updating the internal cache.", buf, 0x16u);
  }

  v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Received the following suggestions for client model %@: \n%@"), v12, v10);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p> "), self);
  +[ATXUniversalBlendingLayer logLongDescriptionForBlendingLayerString:prefix:shouldUseDefaultLogLevel:limit:](ATXUniversalBlendingLayer, "logLongDescriptionForBlendingLayerString:prefix:shouldUseDefaultLogLevel:limit:", v20, v21, 1, 20);

  WeakRetained = objc_loadWeakRetained((id *)&self->_serverDelegate);
  LOBYTE(v20) = objc_msgSend(WeakRetained, "rerouteSuggestions:clientModelId:completion:", v10, v12, v13);

  if ((v20 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1AF421DC4]();
    -[ATXClientModelCacheManagerProtocol cachedSuggestionsForClientModel:](self->_clientModelCacheManager, "cachedSuggestionsForClientModel:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[ATXClientModelCacheUpdate initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:]([ATXClientModelCacheUpdate alloc], "initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:", v12, v10, v11, 0);
    -[ATXUniversalBlendingLayerServer updateClientModelCacheWithCacheUpdate:previousCacheUpdate:completion:](self, "updateClientModelCacheWithCacheUpdate:previousCacheUpdate:completion:", v25, v24, v13);
    -[ATXUniversalBlendingLayerServer refreshBlendingLayerIfNeededForNewSuggestions:previousCacheUpdate:clientModelId:](self, "refreshBlendingLayerIfNeededForNewSuggestions:previousCacheUpdate:clientModelId:", v10, v24, v12);

    objc_autoreleasePoolPop(v23);
  }
  if (v10)
    v26 = v10;
  else
    v26 = (id)MEMORY[0x1E0C9AA60];
  -[ATXEngagementRecordManagerProtocol updateForClientModelCacheUpdate:clientModelId:](self->_engagementRecordsManager, "updateForClientModelCacheUpdate:clientModelId:", v26, v12);
  __atxlog_handle_xpc();
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v28, OS_SIGNPOST_INTERVAL_END, v15, "updateSuggestionsFromClientModel", " enableTelemetry=YES ", buf, 2u);
  }

}

- (void)refreshBlendingLayerIfNeededForNewSuggestions:(id)a3 previousCacheUpdate:(id)a4 clientModelId:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL4 v13;
  _PASLock *pendingRefreshTrackerLock;
  NSObject *v15;
  int64_t v16;
  _PASSimpleCoalescingTimer *coalescedBlendingLayerRefreshOperation;
  double v18;
  uint64_t v19;
  _QWORD v20[4];
  NSObject *v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "suggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[ATXProactiveSuggestion suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:](ATXProactiveSuggestion, "suggestionsHaveChangedFromPreviousSuggestions:newSuggestions:", v10, v9);

  __atxlog_handle_blending();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v23 = v8;
      _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "BlendingRefresh: Executing Blending Layer refresh based on suggestion update for %{public}@", buf, 0xCu);
    }

    pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __115__ATXUniversalBlendingLayerServer_refreshBlendingLayerIfNeededForNewSuggestions_previousCacheUpdate_clientModelId___block_invoke;
    v20[3] = &unk_1E57CEB18;
    v15 = v8;
    v21 = v15;
    -[_PASLock runWithLockAcquired:](pendingRefreshTrackerLock, "runWithLockAcquired:", v20);
    v16 = +[ATXProactiveSuggestionClientModel clientModelTypeFromClientModelId:](ATXProactiveSuggestionClientModel, "clientModelTypeFromClientModelId:", v15);
    if (v16 == 1 || v16 == 46 || v16 == 24)
    {
      coalescedBlendingLayerRefreshOperation = self->_coalescedBlendingLayerRefreshOperation;
      v18 = 1.0;
      v19 = 0;
    }
    else
    {
      coalescedBlendingLayerRefreshOperation = self->_coalescedBlendingLayerRefreshOperation;
      v18 = 3.0;
      v19 = 1;
    }
    -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](coalescedBlendingLayerRefreshOperation, "runAfterDelaySeconds:coalescingBehavior:", v19, v18);
    v12 = v21;
  }
  else if (v13)
  {
    *(_DWORD *)buf = 138543362;
    v23 = v8;
    _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "BlendingRefresh: Skipping Blending Layer refresh based on suggestion update for %{public}@", buf, 0xCu);
  }

}

- (void)updateClientModelCacheWithCacheUpdate:(id)a3 previousCacheUpdate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  void (**v13)(id, _QWORD);
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__ATXUniversalBlendingLayerServer_updateClientModelCacheWithCacheUpdate_previousCacheUpdate_completion___block_invoke;
  block[3] = &unk_1E57CEAF0;
  block[4] = self;
  v11 = v8;
  v18 = v11;
  v19 = v9;
  v12 = v9;
  v13 = (void (**)(id, _QWORD))a5;
  dispatch_sync(queue, block);
  __atxlog_handle_blending();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v11, "clientModelId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_1AA841000, v14, OS_LOG_TYPE_DEFAULT, "Blending: Updated cached client suggestions for client model: %{public}@ with client cache update UUID: %@", buf, 0x16u);

  }
  v13[2](v13, 0);

}

uint64_t __104__ATXUniversalBlendingLayerServer_updateClientModelCacheWithCacheUpdate_previousCacheUpdate_completion___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 56), "sendEventToBiomeIfNeededForClientModelCacheUpdate:previousUpdate:", a1[5], a1[6]);
  return objc_msgSend(*(id *)(a1[4] + 104), "updateCachedSuggestions:", a1[5]);
}

- (ATXUniversalBlendingLayerServer)initWithBlendingLayer:(id)a3 engagementRecordsManager:(id)a4 hyperParameters:(id)a5 serverDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  ATXUniversalBlendingLayerServer *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  v17 = -[ATXUniversalBlendingLayerServer initWithBlendingLayer:engagementRecordsManager:hyperParameters:clientModelCacheManager:clientModelNotificationManager:serverDelegate:pendingRefreshTracker:](self, "initWithBlendingLayer:engagementRecordsManager:hyperParameters:clientModelCacheManager:clientModelNotificationManager:serverDelegate:pendingRefreshTracker:", v13, v12, v11, v14, v15, v10, v16);

  return v17;
}

- (ATXUniversalBlendingLayerServer)initWithBlendingLayer:(id)a3 engagementRecordsManager:(id)a4 hyperParameters:(id)a5 clientModelCacheManager:(id)a6 clientModelNotificationManager:(id)a7 serverDelegate:(id)a8 pendingRefreshTracker:(id)a9
{
  id v16;
  id v17;
  id v18;
  ATXUniversalBlendingLayerServer *v19;
  ATXUniversalBlendingLayerServer *v20;
  uint64_t v21;
  ATXUniversalBlendingFeedbackWriter *feedbackWriter;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *queue;
  uint64_t v26;
  _PASLock *pendingRefreshTrackerLock;
  ATXUniversalRealTimeSuggestionRequestCoordinator *v28;
  ATXUniversalRealTimeSuggestionRequestCoordinator *realTimeSuggestionRequestCoordinator;
  id v30;
  OS_dispatch_queue *v31;
  uint64_t v32;
  _PASSimpleCoalescingTimer *coalescedBlendingLayerRefreshOperation;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  objc_super v42;

  v16 = a3;
  v38 = a4;
  v37 = a5;
  v36 = a6;
  v35 = a7;
  v17 = a8;
  v18 = a9;
  v42.receiver = self;
  v42.super_class = (Class)ATXUniversalBlendingLayerServer;
  v19 = -[ATXUniversalBlendingLayerServer init](&v42, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_blendingLayer, a3);
    objc_storeStrong((id *)&v20->_clientModelCacheManager, a6);
    objc_storeStrong((id *)&v20->_clientModelNotificationManager, a7);
    objc_storeWeak((id *)&v20->_serverDelegate, v17);
    objc_storeStrong((id *)&v20->_engagementRecordsManager, a4);
    objc_storeStrong((id *)&v20->_hyperParameters, a5);
    objc_msgSend(v16, "feedbackWriter", v35, v36, v37, v38);
    v21 = objc_claimAutoreleasedReturnValue();
    feedbackWriter = v20->_feedbackWriter;
    v20->_feedbackWriter = (ATXUniversalBlendingFeedbackWriter *)v21;

    objc_initWeak(&location, v20);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create("ATXClientModelSuggestionReceiver", v23);
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v18);
    pendingRefreshTrackerLock = v20->_pendingRefreshTrackerLock;
    v20->_pendingRefreshTrackerLock = (_PASLock *)v26;

    v28 = -[ATXUniversalRealTimeSuggestionRequestCoordinator initWithBlendingLayer:hyperParameters:pendingRefreshTracker:server:]([ATXUniversalRealTimeSuggestionRequestCoordinator alloc], "initWithBlendingLayer:hyperParameters:pendingRefreshTracker:server:", v20->_blendingLayer, v20->_hyperParameters, v20->_pendingRefreshTrackerLock, v20);
    realTimeSuggestionRequestCoordinator = v20->_realTimeSuggestionRequestCoordinator;
    v20->_realTimeSuggestionRequestCoordinator = v28;

    v30 = objc_alloc(MEMORY[0x1E0D81618]);
    v31 = v20->_queue;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __190__ATXUniversalBlendingLayerServer_initWithBlendingLayer_engagementRecordsManager_hyperParameters_clientModelCacheManager_clientModelNotificationManager_serverDelegate_pendingRefreshTracker___block_invoke;
    v39[3] = &unk_1E57CEAA0;
    objc_copyWeak(&v40, &location);
    v32 = objc_msgSend(v30, "initWithQueue:operation:", v31, v39);
    coalescedBlendingLayerRefreshOperation = v20->_coalescedBlendingLayerRefreshOperation;
    v20->_coalescedBlendingLayerRefreshOperation = (_PASSimpleCoalescingTimer *)v32;

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }

  return v20;
}

void __190__ATXUniversalBlendingLayerServer_initWithBlendingLayer_engagementRecordsManager_hyperParameters_clientModelCacheManager_clientModelNotificationManager_serverDelegate_pendingRefreshTracker___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "coalescedBlendingLayerRefresh");
  }
  else
  {
    __atxlog_handle_blending();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __190__ATXUniversalBlendingLayerServer_initWithBlendingLayer_engagementRecordsManager_hyperParameters_clientModelCacheManager_clientModelNotificationManager_serverDelegate_pendingRefreshTracker___block_invoke_cold_1(v3);

  }
}

- (void)start
{
  const char *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.clientModelRefreshBlendingLayer"), "UTF8String");
  v4 = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __40__ATXUniversalBlendingLayerServer_start__block_invoke;
  v10 = &unk_1E57CEAC8;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v3, &self->_blendingDarwinNotificationObserver, v4, &v7);

  -[ATXUniversalBlendingLayerServer setupXPCListener](self, "setupXPCListener", v7, v8, v9, v10);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_refreshBlendingLayer, CFSTR("com.apple.duetexpertd.clientModelRefreshBlendingLayer"), 0);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __40__ATXUniversalBlendingLayerServer_start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshBlendingLayer");

}

- (void)dealloc
{
  int blendingDarwinNotificationObserver;
  objc_super v4;

  blendingDarwinNotificationObserver = self->_blendingDarwinNotificationObserver;
  if (blendingDarwinNotificationObserver)
  {
    notify_cancel(blendingDarwinNotificationObserver);
    self->_blendingDarwinNotificationObserver = 0;
  }
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)ATXUniversalBlendingLayerServer;
  -[ATXUniversalBlendingLayerServer dealloc](&v4, sel_dealloc);
}

- (void)setupXPCListener
{
  NSXPCListener *v3;
  NSXPCListener *xpcListener;

  v3 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.proactive.ProactiveSuggestionClientModel.xpc"));
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_xpcListener, "resume");
}

void __115__ATXUniversalBlendingLayerServer_refreshBlendingLayerIfNeededForNewSuggestions_previousCacheUpdate_clientModelId___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "clientModelsThatUpdatedSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "clientModelsThatUpdatedSuggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1AA841000, v5, OS_LOG_TYPE_DEFAULT, "BlendingRefresh: Updated pendingRefreshTracker. Client Models that updated recently: %{public}@", (uint8_t *)&v7, 0xCu);

  }
}

- (void)refreshBlendingLayer
{
  -[_PASLock runWithLockAcquired:](self->_pendingRefreshTrackerLock, "runWithLockAcquired:", &__block_literal_global_4);
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescedBlendingLayerRefreshOperation, "runAfterDelaySeconds:coalescingBehavior:", 1, 3.0);
}

uint64_t __55__ATXUniversalBlendingLayerServer_refreshBlendingLayer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setShouldForceRefreshForAllUIs:", 1);
}

- (void)coalescedBlendingLayerRefresh
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1AA841000, a2, OS_LOG_TYPE_DEBUG, "BlendingRefresh: The Blending Layer has the following suggestions: %@", (uint8_t *)&v2, 0xCu);
}

void __64__ATXUniversalBlendingLayerServer_coalescedBlendingLayerRefresh__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "clientModelsThatUpdatedSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "shouldForceRefreshForAllUIs");
  v7 = (void *)objc_opt_new();
  objc_msgSend(v8, "setClientModelsThatUpdatedSuggestions:", v7);

  objc_msgSend(v8, "setShouldForceRefreshForAllUIs:", 0);
}

uint64_t __64__ATXUniversalBlendingLayerServer_coalescedBlendingLayerRefresh__block_invoke_28(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(a2, "unsignedIntValue"));
}

- (id)consumerSubTypesToRefreshGivenUpdatesFromClientModels:(id)a3
{
  return (id)-[ATXUniversalBlendingLayerHyperParametersProtocol consumerSubTypesToConsiderForClientModelIds:](self->_hyperParameters, "consumerSubTypesToConsiderForClientModelIds:", a3);
}

- (void)clientModelUpdatedNotificationId:(id)a3 clientModelId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  __atxlog_handle_xpc();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  __atxlog_handle_xpc();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "updateNotificationIdFromClientModel", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  __atxlog_handle_blending();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543618;
    v19 = v9;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1AA841000, v15, OS_LOG_TYPE_DEFAULT, "Blending: <<%{public}@>> client model updated its notification id. New notification id: %@", (uint8_t *)&v18, 0x16u);
  }

  -[ATXClientModelNotificationManager updateNotificationId:clientModel:](self->_clientModelNotificationManager, "updateNotificationId:clientModel:", v8, v9);
  v10[2](v10, 0);

  __atxlog_handle_xpc();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v17, OS_SIGNPOST_INTERVAL_END, v12, "updateNotificationIdFromClientModel", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

}

- (void)retrieveSuggestionsForClientModelId:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  __atxlog_handle_xpc();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "retrieveSuggestionsForClientModelId", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

  __atxlog_handle_blending();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543362;
    v19 = v6;
    _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "Blending: <<%{public}@>> client model retrieves suggestions.", (uint8_t *)&v18, 0xCu);
  }

  -[ATXClientModelCacheManagerProtocol cachedSuggestionsForClientModel:](self->_clientModelCacheManager, "cachedSuggestionsForClientModel:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[ATXUniversalBlendingLayerServer retrieveSuggestionsForClientModelId:reply:].cold.1((uint64_t)v6, v13, v14);

  objc_msgSend(v13, "suggestions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v15, 0);

  __atxlog_handle_xpc();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v17, OS_SIGNPOST_INTERVAL_END, v9, "retrieveSuggestionsForClientModelId", " enableTelemetry=YES ", (uint8_t *)&v18, 2u);
  }

}

- (void)generateLayoutForRequest:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v6 = (void (**)(id, void *))a4;
  v7 = a3;
  __atxlog_handle_xpc();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  __atxlog_handle_xpc();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "generateLayoutForRequest", " enableTelemetry=YES ", buf, 2u);
  }

  -[ATXUniversalBlendingLayerServer selectedLayoutForSuggestionRequest:](self, "selectedLayoutForSuggestionRequest:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v12);
  __atxlog_handle_xpc();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v14, OS_SIGNPOST_INTERVAL_END, v9, "generateLayoutForRequest", " enableTelemetry=YES ", v15, 2u);
  }

}

- (id)selectedLayoutForSuggestionRequest:(id)a3
{
  return -[ATXUniversalRealTimeSuggestionRequestCoordinator selectedLayoutForSuggestionRequest:](self->_realTimeSuggestionRequestCoordinator, "selectedLayoutForSuggestionRequest:", a3);
}

- (void)generateRankedSuggestionsForRequest:(id)a3 limit:(id)a4 reply:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t buf[16];

  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = a3;
  __atxlog_handle_xpc();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);

  __atxlog_handle_xpc();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "generateSuggestionsForRequest", " enableTelemetry=YES ", buf, 2u);
  }

  -[ATXUniversalBlendingLayerServer generatedRankedSuggestionsForSuggestionRequest:limit:](self, "generatedRankedSuggestionsForSuggestionRequest:limit:", v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v15);
  __atxlog_handle_xpc();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v17, OS_SIGNPOST_INTERVAL_END, v12, "generateSuggestionsForRequest", " enableTelemetry=YES ", v18, 2u);
  }

}

- (id)generatedRankedSuggestionsForSuggestionRequest:(id)a3 limit:(id)a4
{
  return -[ATXUniversalRealTimeSuggestionRequestCoordinator generatedRankedSuggestionsForSuggestionRequest:limit:](self->_realTimeSuggestionRequestCoordinator, "generatedRankedSuggestionsForSuggestionRequest:limit:", a3, a4);
}

- (void)registerRealTimeSuggestionProviderDelegate:(id)a3 clientModelId:(id)a4
{
  -[ATXUniversalRealTimeSuggestionRequestCoordinator registerRealTimeSuggestionProviderDelegate:clientModelId:](self->_realTimeSuggestionRequestCoordinator, "registerRealTimeSuggestionProviderDelegate:clientModelId:", a3, a4);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;

  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.proactive.ProactiveSuggestionClientModel.xpc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
    ATXCreateProactiveSuggestionClientModelXPCInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v7);

    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setInterruptionHandler:", &__block_literal_global_34);
    objc_msgSend(v5, "setInvalidationHandler:", &__block_literal_global_36);
    objc_msgSend(v5, "resume");
    v8 = 1;
  }
  else
  {
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXUniversalBlendingLayerServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v5, (uint64_t)CFSTR("com.apple.proactive.ProactiveSuggestionClientModel.xpc"), v9);

    v8 = 0;
  }

  return v8;
}

void __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_blending();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

void __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_35()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  __atxlog_handle_blending();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_35_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

}

- (id)clientModelsThatUpdatedSuggestionsRecently
{
  _PASLock *pendingRefreshTrackerLock;
  id v3;
  _QWORD v5[6];
  _QWORD v6[3];
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__ATXUniversalBlendingLayerServer_clientModelsThatUpdatedSuggestionsRecently__block_invoke;
  v5[3] = &unk_1E57CEB60;
  v5[4] = &v8;
  v5[5] = v6;
  -[_PASLock runWithLockAcquired:](pendingRefreshTrackerLock, "runWithLockAcquired:", v5);
  v3 = (id)v9[5];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return v3;
}

void __77__ATXUniversalBlendingLayerServer_clientModelsThatUpdatedSuggestionsRecently__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "clientModelsThatUpdatedSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  LOBYTE(v4) = objc_msgSend(v3, "shouldForceRefreshForAllUIs");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v4;
}

- (BOOL)willForceRefreshOfAllUIs
{
  _PASLock *pendingRefreshTrackerLock;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__2;
  v10[4] = __Block_byref_object_dispose__2;
  v11 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__ATXUniversalBlendingLayerServer_willForceRefreshOfAllUIs__block_invoke;
  v5[3] = &unk_1E57CEB60;
  v5[4] = v10;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](pendingRefreshTrackerLock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);

  return v3;
}

void __59__ATXUniversalBlendingLayerServer_willForceRefreshOfAllUIs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "clientModelsThatUpdatedSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  LOBYTE(v4) = objc_msgSend(v3, "shouldForceRefreshForAllUIs");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)v4;
}

- (ATXUniversalBlendingLayer)blendingLayer
{
  return self->_blendingLayer;
}

- (ATXClientModelCacheManagerProtocol)clientModelCacheManager
{
  return self->_clientModelCacheManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelCacheManager, 0);
  objc_storeStrong((id *)&self->_blendingLayer, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_coalescedBlendingLayerRefreshOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_feedbackWriter, 0);
  objc_storeStrong((id *)&self->_realTimeSuggestionRequestCoordinator, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_engagementRecordsManager, 0);
  objc_destroyWeak((id *)&self->_serverDelegate);
  objc_storeStrong((id *)&self->_clientModelNotificationManager, 0);
  objc_storeStrong((id *)&self->_pendingRefreshTrackerLock, 0);
}

void __190__ATXUniversalBlendingLayerServer_initWithBlendingLayer_engagementRecordsManager_hyperParameters_clientModelCacheManager_clientModelNotificationManager_serverDelegate_pendingRefreshTracker___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "ATXClientModelSuggestionReceiver: couldn't perform refresh operation because swelf is nil", v1, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)retrieveSuggestionsForClientModelId:(NSObject *)a3 reply:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "suggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_1AA841000, a3, OS_LOG_TYPE_DEBUG, "Blending: client model <<%{public}@>> has the following suggestions: %@", (uint8_t *)&v6, 0x16u);

}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AA841000, log, OS_LOG_TYPE_ERROR, "Blending: Rejecting connection %@ without entitlement %@", (uint8_t *)&v3, 0x16u);
}

void __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, a1, a3, "Blending: Unexpected interruption on Proactive Suggestion Client Model XPC interface", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __70__ATXUniversalBlendingLayerServer_listener_shouldAcceptNewConnection___block_invoke_35_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AA841000, a1, a3, "Blending: Connection invalidated on Proactive Suggestion Client Model XPC interface. Client went away.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
