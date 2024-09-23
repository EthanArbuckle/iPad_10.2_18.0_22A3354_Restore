@implementation ATXUniversalRealTimeSuggestionRequestCoordinator

- (ATXUniversalRealTimeSuggestionRequestCoordinator)initWithBlendingLayer:(id)a3 hyperParameters:(id)a4 pendingRefreshTracker:(id)a5 server:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXUniversalRealTimeSuggestionRequestCoordinator *v15;
  ATXUniversalRealTimeSuggestionRequestCoordinator *v16;
  uint64_t v17;
  ATXUniversalBlendingFeedbackWriter *feedbackWriter;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ATXUniversalRealTimeSuggestionRequestCoordinator;
  v15 = -[ATXUniversalRealTimeSuggestionRequestCoordinator init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_blendingLayer, a3);
    objc_storeStrong((id *)&v16->_hyperParameters, a4);
    objc_storeStrong((id *)&v16->_pendingRefreshTrackerLock, a5);
    objc_storeWeak((id *)&v16->_server, v14);
    objc_msgSend(v11, "feedbackWriter");
    v17 = objc_claimAutoreleasedReturnValue();
    feedbackWriter = v16->_feedbackWriter;
    v16->_feedbackWriter = (ATXUniversalBlendingFeedbackWriter *)v17;

  }
  return v16;
}

- (void)registerRealTimeSuggestionProviderDelegate:(id)a3 clientModelId:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _PASLock *pendingRefreshTrackerLock;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "RealTimeRequestCoordinator registering a delegate for clientModelId: %{public}@...", buf, 0xCu);
  }

  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __109__ATXUniversalRealTimeSuggestionRequestCoordinator_registerRealTimeSuggestionProviderDelegate_clientModelId___block_invoke;
  v12[3] = &unk_1E57CF800;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[_PASLock runWithLockAcquired:](pendingRefreshTrackerLock, "runWithLockAcquired:", v12);

}

void __109__ATXUniversalRealTimeSuggestionRequestCoordinator_registerRealTimeSuggestionProviderDelegate_clientModelId___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "registeredDelegatesForClientModels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1AA841000, v4, OS_LOG_TYPE_DEFAULT, "RealTimeRequestCoordinator done registering a delegate for clientModelId: %{public}@.", (uint8_t *)&v6, 0xCu);
  }

}

- (id)clientModelUpdatesForSuggestionRequest:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _PASLock *pendingRefreshTrackerLock;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  _PASLock *v25;
  void *v26;
  NSObject *v27;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  unint64_t v32;
  os_signpost_id_t spid;
  id v34;
  id obj;
  NSObject *v36;
  _QWORD v38[4];
  NSObject *v39;
  __int128 *p_buf;
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  _QWORD v44[6];
  id v45;
  NSObject *v46;
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  NSObject *v53;
  __int128 buf;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  sel_getName(a2);
  v31 = (void *)os_transaction_create();
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  spid = os_signpost_id_generate(v4);

  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v32 = spid - 1;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    objc_msgSend(v34, "originatorId", v31);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v6, OS_SIGNPOST_INTERVAL_BEGIN, spid, "RealTimeSuggestionRequest", "originatorId=%{signpost.telemetry:string1, public}@ enableTelemetry=YES ", (uint8_t *)&buf, 0xCu);

  }
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v34;
    _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Received suggestion request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke;
    v52[3] = &unk_1E57CEB18;
    v36 = v34;
    v53 = v36;
    -[_PASLock runWithLockAcquired:](pendingRefreshTrackerLock, "runWithLockAcquired:", v52);
    -[ATXUniversalBlendingLayerHyperParametersProtocol clientModelsToConsiderForConsumerSubType:](self->_hyperParameters, "clientModelsToConsiderForConsumerSubType:", -[NSObject consumerSubType](v36, "consumerSubType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v10);
    __atxlog_handle_blending();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "Blending: Communicating with client models for request: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v13 = dispatch_group_create();
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    obj = v10;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v49 != v15)
            objc_enumerationMutation(obj);
          v17 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
          dispatch_group_enter(v13);
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_8;
          v44[3] = &unk_1E57CF828;
          v44[4] = self;
          v44[5] = v17;
          v45 = v11;
          v46 = v13;
          v47 = v36;
          -[ATXUniversalRealTimeSuggestionRequestCoordinator realTimeProviderDelegateForClientModelId:completion:](self, "realTimeProviderDelegateForClientModelId:completion:", v17, v44);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
      }
      while (v14);
    }

    v18 = (void *)MEMORY[0x1E0D81598];
    -[NSObject timeout](v36, "timeout");
    v20 = v19;
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_12;
    v41[3] = &unk_1E57CF850;
    v21 = v36;
    v42 = v21;
    v22 = v11;
    v43 = v22;
    objc_msgSend(v18, "waitForGroup:timeoutSeconds:onGroupComplete:onTimeout:", v13, &__block_literal_global_15, v41, v20);
    __atxlog_handle_blending();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v32 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AA841000, v24, OS_SIGNPOST_INTERVAL_END, spid, "RealTimeSuggestionRequest", ", (uint8_t *)&buf, 2u);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__7;
    v57 = __Block_byref_object_dispose__7;
    v58 = 0;
    v25 = self->_pendingRefreshTrackerLock;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_13;
    v38[3] = &unk_1E57CF878;
    p_buf = &buf;
    v39 = v21;
    -[_PASLock runWithLockAcquired:](v25, "runWithLockAcquired:", v38);
    -[ATXUniversalRealTimeSuggestionRequestCoordinator cacheUpdateDictionaryFromCacheUpdatesArray:](self, "cacheUpdateDictionaryFromCacheUpdatesArray:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&buf, 8);
    v27 = v53;
  }
  else
  {
    __atxlog_handle_blending();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      -[ATXUniversalRealTimeSuggestionRequestCoordinator clientModelUpdatesForSuggestionRequest:].cold.1((uint64_t)v34, v29);

    __atxlog_handle_blending();
    v30 = objc_claimAutoreleasedReturnValue();
    v27 = v30;
    if (v32 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v30))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AA841000, v27, OS_SIGNPOST_INTERVAL_END, spid, "RealTimeSuggestionRequest", ", (uint8_t *)&buf, 2u);
    }
    v26 = 0;
  }

  return v26;
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v3, "requestUUIDToClientModelCaches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "requestUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v6);

}

uint64_t __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSuggestionsFromDelegate:clientModelId:clientModelsPendingUpdate:dispatchGroup:suggestionRequest:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_2()
{
  NSObject *v0;

  __atxlog_handle_blending();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_2_cold_1(v0);

}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_12(uint64_t a1)
{
  NSObject *v2;

  __atxlog_handle_blending();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_12_cold_1(a1);

}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "requestUUIDToClientModelCaches");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(v3, "requestUUIDToClientModelCaches");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "requestUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectForKey:", v11);

}

- (id)generatedRankedSuggestionsForSuggestionRequest:(id)a3 limit:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;

  v6 = a4;
  -[ATXUniversalRealTimeSuggestionRequestCoordinator clientModelUpdatesForSuggestionRequest:](self, "clientModelUpdatesForSuggestionRequest:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUniversalBlendingLayer rerankedValidSuggestionsFromClientModelSuggestions:](self->_blendingLayer, "rerankedValidSuggestionsFromClientModelSuggestions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    v10 = objc_msgSend(v6, "unsignedIntegerValue");
    v11 = objc_msgSend(v9, "count");
    if (v10 >= v11)
      v12 = v11;
    else
      v12 = v10;
    objc_msgSend(v9, "subarrayWithRange:", 0, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v8;
  }
  v14 = v13;

  return v14;
}

- (id)selectedLayoutForSuggestionRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ATXBlendingModelUICacheUpdate *v8;
  ATXUniversalBlendingFeedbackWriter *feedbackWriter;
  uint64_t v10;

  v4 = a3;
  -[ATXUniversalRealTimeSuggestionRequestCoordinator clientModelUpdatesForSuggestionRequest:](self, "clientModelUpdatesForSuggestionRequest:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUniversalBlendingLayer rerankedValidSuggestionsFromClientModelSuggestions:](self->_blendingLayer, "rerankedValidSuggestionsFromClientModelSuggestions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUniversalBlendingLayer selectedLayoutForUIConsumer:rankedSuggestions:](self->_blendingLayer, "selectedLayoutForUIConsumer:rankedSuggestions:", objc_msgSend(v4, "consumerSubType"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ATXBlendingModelUICacheUpdate initWithUICache:consumerSubType:clientModelCacheUpdates:]([ATXBlendingModelUICacheUpdate alloc], "initWithUICache:consumerSubType:clientModelCacheUpdates:", v7, objc_msgSend(v4, "consumerSubType"), v5);
  feedbackWriter = self->_feedbackWriter;
  v10 = objc_msgSend(v4, "consumerSubType");

  -[ATXUniversalBlendingFeedbackWriter donateBlendingModelUICacheUpdate:uiConsumer:](feedbackWriter, "donateBlendingModelUICacheUpdate:uiConsumer:", v8, v10);
  return v7;
}

- (void)updateSuggestionsFromDelegate:(id)a3 clientModelId:(id)a4 clientModelsPendingUpdate:(id)a5 dispatchGroup:(id)a6 suggestionRequest:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void *v33;
  ATXUniversalRealTimeSuggestionRequestCoordinator *v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  os_signpost_id_t v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  __atxlog_handle_blending();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = os_signpost_id_generate(v17);

  __atxlog_handle_blending();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 138543362;
    v41 = v13;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RequestSuggestionsFromRealTimeProviderDelegate", "clientModelId=%{signpost.telemetry:string1, public}@ enableTelemetry=YES ", buf, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        __atxlog_handle_blending();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[ATXUniversalRealTimeSuggestionRequestCoordinator updateSuggestionsFromDelegate:clientModelId:clientModelsPendingUpdate:dispatchGroup:suggestionRequest:].cold.1((uint64_t)v16, v29);

        goto LABEL_21;
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    __atxlog_handle_blending();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v13;
      v42 = 2114;
      v43 = v26;
      _os_log_impl(&dword_1AA841000, v24, OS_LOG_TYPE_DEFAULT, "Blending: %{public}@ may not have a real-time request delegate that supports %{public}@ requests. Falling back to cache.", buf, 0x16u);

    }
    -[ATXUniversalRealTimeSuggestionRequestCoordinator respondToRequestWithPreviouslyCachedPredictionsForClientModelId:suggestionRequest:](self, "respondToRequestWithPreviouslyCachedPredictionsForClientModelId:suggestionRequest:", v13, v16);
    objc_msgSend(v14, "removeObject:", v13);
    __atxlog_handle_blending();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AA841000, v28, OS_SIGNPOST_INTERVAL_END, v18, "RequestSuggestionsFromRealTimeProviderDelegate", ", buf, 2u);
    }

LABEL_21:
    dispatch_group_leave(v15);
    goto LABEL_25;
  }
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __154__ATXUniversalRealTimeSuggestionRequestCoordinator_updateSuggestionsFromDelegate_clientModelId_clientModelsPendingUpdate_dispatchGroup_suggestionRequest___block_invoke;
  v33 = &unk_1E57CF8A0;
  v34 = self;
  v21 = v13;
  v35 = v21;
  v22 = v16;
  v36 = v22;
  v37 = v14;
  v39 = v18;
  v38 = v15;
  v23 = (void *)MEMORY[0x1AF421F50](&v30);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "suggestionsForInteractionSuggestionRequest:clientModelId:reply:", v22, v21, v23, v30, v31, v32, v33, v34, v35, v36, v37);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "suggestionsForContextualActionSuggestionRequest:clientModelId:reply:", v22, v21, v23, v30, v31, v32, v33, v34, v35, v36, v37);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v12, "suggestionsForIntentSuggestionRequest:clientModelId:reply:", v22, v21, v23, v30, v31, v32, v33, v34, v35, v36, v37);
    }
  }

LABEL_25:
}

void __154__ATXUniversalRealTimeSuggestionRequestCoordinator_updateSuggestionsFromDelegate_clientModelId_clientModelsPendingUpdate_dispatchGroup_suggestionRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "delegateUpdatedSuggestionsForClientModelId:suggestionRequest:response:clientModelsPendingUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56));
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 72);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AA841000, v4, OS_SIGNPOST_INTERVAL_END, v5, "RequestSuggestionsFromRealTimeProviderDelegate", ", v6, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
}

- (void)delegateUpdatedSuggestionsForClientModelId:(id)a3 suggestionRequest:(id)a4 response:(id)a5 clientModelsPendingUpdate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  ATXClientModelCacheUpdate *v18;
  void *v19;
  void *v20;
  ATXClientModelCacheUpdate *v21;
  id WeakRetained;
  void *v23;
  void *v24;
  _PASLock *pendingRefreshTrackerLock;
  ATXClientModelCacheUpdate *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  ATXClientModelCacheUpdate *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  __atxlog_handle_blending();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v34 = v10;
    v35 = 2114;
    v36 = v16;
    v37 = 1024;
    v38 = objc_msgSend(v12, "responseCode");
    _os_log_impl(&dword_1AA841000, v14, OS_LOG_TYPE_DEFAULT, "Blending: %{public}@ real-time delegate provided response to %{public}@. Response code: %d", buf, 0x1Cu);

  }
  if (objc_msgSend(v12, "responseCode") == 1)
  {
    -[ATXUniversalRealTimeSuggestionRequestCoordinator respondToRequestWithPreviouslyCachedPredictionsForClientModelId:suggestionRequest:](self, "respondToRequestWithPreviouslyCachedPredictionsForClientModelId:suggestionRequest:", v10, v11);
  }
  else if (objc_msgSend(v12, "responseCode") == 3
         || !objc_msgSend(v12, "responseCode")
         || objc_msgSend(v12, "responseCode") == 5)
  {
    __atxlog_handle_blending();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXUniversalRealTimeSuggestionRequestCoordinator delegateUpdatedSuggestionsForClientModelId:suggestionRequest:response:clientModelsPendingUpdate:].cold.1((uint64_t)v10, v12);

  }
  else if (objc_msgSend(v12, "responseCode") == 2 || objc_msgSend(v12, "responseCode") == 4)
  {
    v18 = [ATXClientModelCacheUpdate alloc];
    objc_msgSend(v12, "suggestions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "feedbackMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[ATXClientModelCacheUpdate initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:](v18, "initWithClientModelId:suggestions:feedbackMetadata:responseForRealTimeRequest:", v10, v19, v20, v12);

    -[ATXUniversalBlendingFeedbackWriter sendEventToBiomeIfNeededForClientModelCacheUpdate:previousUpdate:](self->_feedbackWriter, "sendEventToBiomeIfNeededForClientModelCacheUpdate:previousUpdate:", v21, 0);
    if (objc_msgSend(v12, "responseCode") == 4)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      objc_msgSend(v12, "suggestions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "feedbackMetadata");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "clientModelUpdatedSuggestions:feedbackMetadata:clientModelId:completion:", v23, v24, v10, &__block_literal_global_24_0);

    }
    pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke_25;
    v30 = &unk_1E57CF800;
    v31 = v11;
    v32 = v21;
    v26 = v21;
    -[_PASLock runWithLockAcquired:](pendingRefreshTrackerLock, "runWithLockAcquired:", &v27);

  }
  objc_msgSend(v13, "removeObject:", v10, v27, v28, v29, v30);

}

void __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = a2;
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke_cold_1((uint64_t)v2, v3, v4);

}

void __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke_25(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "requestUUIDToClientModelCaches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)respondToRequestWithPreviouslyCachedPredictionsForClientModelId:(id)a3 suggestionRequest:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _PASLock *pendingRefreshTrackerLock;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend(WeakRetained, "clientModelCacheManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedSuggestionsForClientModel:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __134__ATXUniversalRealTimeSuggestionRequestCoordinator_respondToRequestWithPreviouslyCachedPredictionsForClientModelId_suggestionRequest___block_invoke;
  v14[3] = &unk_1E57CF800;
  v15 = v6;
  v16 = v10;
  v12 = v10;
  v13 = v6;
  -[_PASLock runWithLockAcquired:](pendingRefreshTrackerLock, "runWithLockAcquired:", v14);

}

void __134__ATXUniversalRealTimeSuggestionRequestCoordinator_respondToRequestWithPreviouslyCachedPredictionsForClientModelId_suggestionRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "requestUUIDToClientModelCaches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v6, "addObject:");

}

- (id)cacheUpdateDictionaryFromCacheUpdatesArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "clientModelId", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)realTimeProviderDelegateForClientModelId:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  _PASLock *pendingRefreshTrackerLock;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  __int128 *p_buf;
  uint8_t v19[4];
  id v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "Blending: Fetching delegate for client model %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  pendingRefreshTrackerLock = self->_pendingRefreshTrackerLock;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __104__ATXUniversalRealTimeSuggestionRequestCoordinator_realTimeProviderDelegateForClientModelId_completion___block_invoke;
  v16 = &unk_1E57CF878;
  p_buf = &buf;
  v10 = v6;
  v17 = v10;
  -[_PASLock runWithLockAcquired:](pendingRefreshTrackerLock, "runWithLockAcquired:", &v13);
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    __atxlog_handle_blending();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1AA841000, v11, OS_LOG_TYPE_DEFAULT, "Found a cached delegate for clientModelId: %{public}@", v19, 0xCu);
    }

    v7[2](v7, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
  }
  else
  {
    __atxlog_handle_blending();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v19 = 138543362;
      v20 = v10;
      _os_log_impl(&dword_1AA841000, v12, OS_LOG_TYPE_DEFAULT, "Blending: Didn't find a cached delegate for client model %{public}@. Trying the XPC route.", v19, 0xCu);
    }

    -[ATXUniversalRealTimeSuggestionRequestCoordinator remoteAsyncDelegateForClientModel:completion:](self, "remoteAsyncDelegateForClientModel:completion:", v10, v7, v13, v14, v15, v16);
  }

  _Block_object_dispose(&buf, 8);
}

void __104__ATXUniversalRealTimeSuggestionRequestCoordinator_realTimeProviderDelegateForClientModelId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "registeredDelegatesForClientModels");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)remoteAsyncDelegateForClientModel:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  __int128 *p_buf;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  ATXUniversalRealTimeSuggestionRequestCoordinator *v25;
  __int128 buf;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_blending();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_1AA841000, v8, OS_LOG_TYPE_DEFAULT, "Establishing XPC connection to clientModelId: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("com.apple.proactive.SuggestionRequest.%@"), v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v9, 0);
  ATXProactiveSuggestionRealTimeProviderXPCInterface();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRemoteObjectInterface:", v11);

  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke;
  v23[3] = &unk_1E57CF850;
  v13 = v6;
  v24 = v13;
  v25 = self;
  objc_msgSend(v10, "setInterruptionHandler:", v23);
  objc_msgSend(v10, "interruptionHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInvalidationHandler:", v14);

  objc_msgSend(v10, "resume");
  if (v10)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__7;
    v29 = __Block_byref_object_dispose__7;
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_2;
    v21[3] = &unk_1E57CE778;
    v15 = v7;
    v22 = v15;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v21);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_3;
    v17[3] = &unk_1E57CF8E8;
    v17[4] = self;
    p_buf = &buf;
    v18 = v13;
    v19 = v15;
    objc_msgSend(v16, "pingWithCompletion:", v17);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  __atxlog_handle_blending();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_cold_1(a1, v2);

  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_31;
  v5[3] = &unk_1E57CEB18;
  v6 = v3;
  objc_msgSend(v4, "runWithLockAcquired:", v5);

}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "registeredDelegatesForClientModels");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

}

uint64_t __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_3(_QWORD *a1, int a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (a2)
  {
    v3 = (void *)a1[5];
    v4 = *(void **)(a1[4] + 8);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_4;
    v7[3] = &unk_1E57CF878;
    v9 = a1[7];
    v8 = v3;
    objc_msgSend(v4, "runWithLockAcquired:", v7);
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1[6] + 16))(a1[6], *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), v5, v6);

  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "registeredDelegatesForClientModels");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackWriter, 0);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_blendingLayer, 0);
  objc_storeStrong((id *)&self->_pendingRefreshTrackerLock, 0);
}

- (void)clientModelUpdatesForSuggestionRequest:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_1(&dword_1AA841000, a2, v5, "Received a real-time suggestion request of an unexpected type: %{public}@. Returning nil.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AA841000, log, OS_LOG_TYPE_DEBUG, "Success", v1, 2u);
}

void __91__ATXUniversalRealTimeSuggestionRequestCoordinator_clientModelUpdatesForSuggestionRequest___block_invoke_12_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "timeout");
  OUTLINED_FUNCTION_0_1(&dword_1AA841000, v1, v2, "Dispatch group timed out when responding to real time request. Request timeout: %.2f seconds. Pending updates from: %{public}@", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)updateSuggestionsFromDelegate:(uint64_t)a1 clientModelId:(NSObject *)a2 clientModelsPendingUpdate:dispatchGroup:suggestionRequest:.cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_1(&dword_1AA841000, a2, v5, "Received a real-time suggestion request of an unexpected type: %{public}@. Returning.", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)delegateUpdatedSuggestionsForClientModelId:(uint64_t)a1 suggestionRequest:(void *)a2 response:clientModelsPendingUpdate:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_1AA841000, v2, v3, "Encountered error when fetching requesting real-time suggestions from client model: %{public}@. Error: %{public}@", v4, v5, v6, v7, 2u);

}

void __148__ATXUniversalRealTimeSuggestionRequestCoordinator_delegateUpdatedSuggestionsForClientModelId_suggestionRequest_response_clientModelsPendingUpdate___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_1(&dword_1AA841000, a2, a3, "Error when updating suggestions in Real Time Request Coordinator. Error: %{public}@", (uint8_t *)&v3);
}

void __97__ATXUniversalRealTimeSuggestionRequestCoordinator_remoteAsyncDelegateForClientModel_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1AA841000, a2, OS_LOG_TYPE_ERROR, "Blending: Connection to Client Model %{public}@ interrupted in 2-way communication server.", (uint8_t *)&v3, 0xCu);
}

@end
