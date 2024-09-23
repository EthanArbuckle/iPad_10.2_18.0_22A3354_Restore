@implementation WBSForYouRecommendationMediator

- (WBSForYouRecommendationMediator)initWithContextClient:(id)a3 historyProvider:(id)a4
{
  id v7;
  id v8;
  WBSForYouRecommendationMediator *v9;
  WBSForYouRecommendationMediator *v10;
  uint64_t v11;
  id historyProvider;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *internalQueue;
  NSCache *v16;
  NSCache *messagesMetadataCache;
  uint64_t v18;
  NSMutableSet *requestsInProgressBySourceID;
  WBSFoundInRecommendationManager *v20;
  WBSFoundInRecommendationManager *foundInManager;
  void *v22;
  WBSForYouRecommendationMediator *v23;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSForYouRecommendationMediator;
  v9 = -[WBSForYouRecommendationMediator init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextClient, a3);
    v11 = MEMORY[0x1A85D45E4](v8);
    historyProvider = v10->_historyProvider;
    v10->_historyProvider = (id)v11;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSForYouRecommendationMediator.%@.%p.internalQueue"), objc_opt_class(), v10);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v14;

    v16 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    messagesMetadataCache = v10->_messagesMetadataCache;
    v10->_messagesMetadataCache = v16;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = objc_claimAutoreleasedReturnValue();
    requestsInProgressBySourceID = v10->_requestsInProgressBySourceID;
    v10->_requestsInProgressBySourceID = (NSMutableSet *)v18;

    v20 = objc_alloc_init(WBSFoundInRecommendationManager);
    foundInManager = v10->_foundInManager;
    v10->_foundInManager = v20;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v10, sel__didUpdateFoundInSuggestions_, CFSTR("WBSFoundInRecommendationManagerDidUpdateSuggestionsNotification"), v10->_foundInManager);

    -[WBSForYouRecommendationMediator _beginListeningForHandoffActivity](v10, "_beginListeningForHandoffActivity");
    v23 = v10;
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[WBSForYouRecommendationMediator _endListeningForHandoffActivity](self, "_endListeningForHandoffActivity");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)WBSForYouRecommendationMediator;
  -[WBSForYouRecommendationMediator dealloc](&v4, sel_dealloc);
}

- (void)_didUpdateFoundInSuggestions:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0D8A3A8], self);

}

- (void)updatedTopicsWithCompletionHandler:(id)a3
{
  id v4;
  WBSForYouTopicManager *v5;
  void *v6;
  WBSForYouTopicManager *v7;
  WBSForYouTopicManager *topicManager;
  NSObject *v9;
  WBSForYouTopicManager *v10;
  uint64_t v11;
  NSObject *v12;
  WBSForYouTopicManager *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;
  _QWORD v24[4];
  NSObject *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;
  _QWORD v31[3];
  char v32;
  _QWORD v33[5];
  id v34;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D8A1D8], "areLocalSiriSuggestionsEnabled") & 1) != 0)
  {
    if (!self->_topicManager)
    {
      v5 = [WBSForYouTopicManager alloc];
      (*((void (**)(void))self->_historyProvider + 2))();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[WBSForYouTopicManager initWithHistory:contextClient:](v5, "initWithHistory:contextClient:", v6, self->_contextClient);
      topicManager = self->_topicManager;
      self->_topicManager = v7;

    }
    v9 = dispatch_group_create();
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__6;
    v33[4] = __Block_byref_object_dispose__6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v9);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    v10 = self->_topicManager;
    v11 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke;
    v24[3] = &unk_1E5443970;
    v26 = v31;
    v27 = v33;
    v28 = v29;
    v12 = v9;
    v25 = v12;
    -[WBSForYouTopicManager contextKitTopicsWithCompletionHandler:](v10, "contextKitTopicsWithCompletionHandler:", v24);
    dispatch_group_enter(v12);
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v23 = 0;
    v13 = self->_topicManager;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_15;
    v17[3] = &unk_1E5443970;
    v19 = v22;
    v20 = v33;
    v21 = v29;
    v14 = v12;
    v18 = v14;
    -[WBSForYouTopicManager portraitNamedEntitiesWithCompletionHandler:](v13, "portraitNamedEntitiesWithCompletionHandler:", v17);
    v15 = MEMORY[0x1E0C80D38];
    v16 = v4;
    WBSDispatchGroupNotifyWithTimeout();

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, MEMORY[0x1E0C9AA60]);
  }

}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v4);
    v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v3);
    objc_sync_exit(v4);

  }
  v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = 134217984;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Obtained %ld ContextKit topics.", (uint8_t *)&v8, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_sync_enter(v4);
    v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObjectsFromArray:", v3);
    objc_sync_exit(v4);

  }
  v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = 134217984;
    v9 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Obtained %ld Portrait topics.", (uint8_t *)&v8, 0xCu);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_16(_QWORD *a1, uint64_t a2)
{
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  unsigned __int8 v7;
  NSObject *v8;
  void *v9;
  void *v10;

  v4 = *(id *)(*(_QWORD *)(a1[5] + 8) + 40);
  objc_sync_enter(v4);
  if (a1[4])
  {
    if (a2 == 1)
    {
      v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24));
      if ((v5 & 1) == 0)
      {
        v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_16_cold_2();
      }
      v7 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1[7] + 8) + 24));
      if ((v7 & 1) == 0)
      {
        v8 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_16_cold_1();
      }
      atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24));
    }
    +[WBSForYouRecommendationMediator _adjustedTopicsWithTopics:](WBSForYouRecommendationMediator, "_adjustedTopicsWithTopics:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "copy");

    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_sync_exit(v4);

}

- (void)banURLsOfSameDomainAsURL:(id)a3
{
  -[WBSForYouRecommendationMediator banURLsOfSameDomainAsURL:postingChangeNotificationWhenDone:](self, "banURLsOfSameDomainAsURL:postingChangeNotificationWhenDone:", a3, 1);
}

- (void)banURLsOfSameDomainAsURL:(id)a3 postingChangeNotificationWhenDone:(BOOL)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke;
  block[3] = &unk_1E54418B8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[4];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "_createPreferenceManagerIfNecessary");
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke_2;
  v5[3] = &__block_descriptor_33_e8_v12__0B8l;
  v6 = *(_BYTE *)(a1 + 48);
  return objc_msgSend(v3, "setPreferenceValue:forURL:completionHandler:", 1, v2, v5);
}

void __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    if (*(_BYTE *)(a1 + 32))
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_12);
  }
}

void __94__WBSForYouRecommendationMediator_banURLsOfSameDomainAsURL_postingChangeNotificationWhenDone___block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x1E0D8A3A8], 0);

}

- (void)_createPreferenceManagerIfNecessary
{
  WBSForYouPerSitePreferenceManager *v3;
  WBSForYouPerSitePreferenceManager *v4;
  WBSForYouPerSitePreferenceManager *perSitePreferenceManager;
  id v6;

  if (!self->_perSitePreferenceManager)
  {
    v3 = [WBSForYouPerSitePreferenceManager alloc];
    objc_msgSend(MEMORY[0x1E0D8A170], "sharedStore");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[WBSForYouPerSitePreferenceManager initWithPerSitePreferencesStore:](v3, "initWithPerSitePreferencesStore:", v6);
    perSitePreferenceManager = self->_perSitePreferenceManager;
    self->_perSitePreferenceManager = v4;

  }
}

- (void)updatedRecommendationsForTopics:(id)a3 withCompletionHandler:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  NSObject *v23;
  uint8_t *v24;
  _QWORD *v25;
  id v26;
  uint8_t buf[8];
  uint8_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  NSObject *v34;
  _QWORD *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[3];
  char v42;
  id location;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v17 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_group_create();
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[WBSForYouRecommendationMediator dataSources](self, "dataSources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        dispatch_group_enter(v7);
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke;
        v31[3] = &unk_1E5443A00;
        v13 = v6;
        v35 = v41;
        v32 = v13;
        v33 = v12;
        objc_copyWeak(&v36, &location);
        v34 = v7;
        objc_msgSend(v12, "recommendationsWithTopics:withCompletionHandler:", v18, v31);

        objc_destroyWeak(&v36);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
    }
    while (v9);
  }

  dispatch_group_enter(v7);
  v14 = WBS_LOG_CHANNEL_PREFIXStartPage();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A840B000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RetrieveRecommendations", "WBSFoundInRecommendationManager", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v28 = buf;
  v29 = 0x2020000000;
  v30 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_23;
  v21[3] = &unk_1E5443A28;
  v24 = buf;
  v15 = v6;
  v22 = v15;
  v25 = v41;
  objc_copyWeak(&v26, &location);
  v16 = v7;
  v23 = v16;
  -[WBSForYouRecommendationMediator _retrieveFoundInRecommendationsWithCompletionHandler:](self, "_retrieveFoundInRecommendationsWithCompletionHandler:", v21);
  v19 = v15;
  v20 = v17;
  WBSDispatchGroupNotifyWithTimeout();

  objc_destroyWeak(&v26);
  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v41, 8);

  objc_destroyWeak(&location);
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  id WeakRetained;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = *(id *)(a1 + 32);
    objc_sync_enter(v4);
    v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    if ((v5 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
    objc_sync_exit(v4);

  }
  v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    v8 = objc_msgSend(v3, "count");
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = v8;
    v14 = 2114;
    v15 = v10;
    _os_log_impl(&dword_1A840B000, v7, OS_LOG_TYPE_INFO, "Retrieved %ld link recommendations from %{public}@", (uint8_t *)&v12, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_fetchImagesForRecommendations:recommendationsDispatchGroup:", v3, *(_QWORD *)(a1 + 48));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unsigned __int8 v5;
  id WeakRetained;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  if ((v5 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
  objc_sync_exit(v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_fetchImagesForRecommendations:recommendationsDispatchGroup:", v3, *(_QWORD *)(a1 + 40));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  v7 = WBS_LOG_CHANNEL_PREFIXStartPage();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A840B000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RetrieveRecommendations", " enableTelemetry=YES ", v8, 2u);
  }

}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_24(uint64_t a1, uint64_t a2)
{
  id v4;
  unsigned __int8 v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  if (*(_QWORD *)(a1 + 48))
  {
    if (a2 == 1)
    {
      v5 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
      if ((v5 & 1) != 0)
      {
        v7 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_24_cold_2();
      }
      else
      {
        v6 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_24_cold_1();
      }
      atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
    }
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_createPreferenceManagerIfNecessary");
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(v8 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_25;
      v11[3] = &unk_1E5443310;
      v11[4] = v8;
      v12 = *(id *)(a1 + 48);
      objc_msgSend(v10, "allowedForYouRecommendationsFromRecommendations:completionHandler:", v9, v11);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
  objc_sync_exit(v4);

}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E54432C0;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = (void *)objc_msgSend(a1[4], "mutableCopy");
  (*(void (**)(void))(*((_QWORD *)a1[5] + 11) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_dataSourceWeightManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSForYouRecommendationMediator _rankRecommendationsInPlace:history:weightManager:suppressHistoryDeduplication:](WBSForYouRecommendationMediator, "_rankRecommendationsInPlace:history:weightManager:suppressHistoryDeduplication:", v2, v3, v4, *((unsigned __int8 *)a1[5] + 97));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_3;
  v7[3] = &unk_1E5443108;
  v8 = v2;
  v5 = a1[5];
  v9 = a1[6];
  v6 = v2;
  objc_msgSend(v5, "obtainMessagesImagesWherePossibleForRecommendations:completionHandler:", v6, v7);

}

uint64_t __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  removeLinkRecommendationsPassingTestWithReductionReason(*(void **)(a1 + 32), CFSTR("items with an empty title"), &__block_literal_global_29);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

BOOL __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;

  return v3;
}

- (void)obtainMessagesImagesWherePossibleForRecommendations:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __objc2_class **v12;
  uint64_t v13;
  void *v14;
  __objc2_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WBSForYouRecommendationMediator *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  NSObject *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a4;
  v7 = dispatch_group_create();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    v12 = &off_1E5440000;
    v34 = *(_QWORD *)v41;
    do
    {
      v13 = 0;
      v35 = v10;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v13);
        v15 = v12[38];
        objc_msgSend(v14, "bundleIdentifier", v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v15) = -[__objc2_class isBundleIdentifierFromMessages:](v15, "isBundleIdentifierFromMessages:", v16);

        if ((_DWORD)v15)
        {
          objc_msgSend(v14, "sourceID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v14, "sourceID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v18, "copy");

            -[NSCache objectForKey:](self->_messagesMetadataCache, "objectForKey:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              v22 = self;
              v23 = v8;
              v24 = v7;
              objc_msgSend(v20, "first");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "title");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "length");

              if (!v27 && v25)
                objc_msgSend(v14, "setTitle:", v25);
              objc_msgSend(v21, "second");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              imageValidForPresentation(v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
                objc_msgSend(v14, "setImage:", v29);

              v7 = v24;
              v8 = v23;
              self = v22;
              v11 = v34;
              v10 = v35;
              v12 = &off_1E5440000;
            }
            else
            {
              dispatch_group_enter(v7);
              if (-[NSMutableSet containsObject:](self->_requestsInProgressBySourceID, "containsObject:", v19))
              {
                dispatch_group_leave(v7);
              }
              else
              {
                -[NSMutableSet addObject:](self->_requestsInProgressBySourceID, "addObject:", v19);
                v36[0] = MEMORY[0x1E0C809B0];
                v36[1] = 3221225472;
                v36[2] = __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke;
                v36[3] = &unk_1E5443AB8;
                v36[4] = self;
                v30 = v19;
                v37 = v30;
                v38 = v7;
                v39 = v14;
                v31 = v30;
                v12 = &off_1E5440000;
                -[WBSForYouRecommendationMediator loadLinkPresentationMetadataForMessageWithGUID:completionHandler:](self, "loadLinkPresentationMetadataForMessageWithGUID:completionHandler:", v31, v36);

              }
            }

          }
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v10);
  }

  v32 = v33;
  WBSDispatchGroupNotifyWithTimeout();

}

void __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v10 = a2;
  v5 = a3;
  if (v10 | v5)
  {
    imageValidForPresentation((void *)v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 56), "setImage:", v6);
    objc_msgSend(*(id *)(a1 + 56), "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v10 && !v8)
      objc_msgSend(*(id *)(a1 + 56), "setTitle:", v10);
    if (v10 && v5)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A160]), "initWithFirst:second:", v10, v5);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", v9, *(_QWORD *)(a1 + 40));

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }

}

uint64_t __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v3;

  if (a2 == 1)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke_2_cold_1();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_fetchImagesForRecommendations:(id)a3 recommendationsDispatchGroup:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "contact");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {

LABEL_8:
          dispatch_group_enter(v7);
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __95__WBSForYouRecommendationMediator__fetchImagesForRecommendations_recommendationsDispatchGroup___block_invoke;
          v15[3] = &unk_1E5441CB8;
          v16 = v7;
          -[WBSForYouRecommendationMediator fetchImageForRecommendation:completionHandler:](self, "fetchImageForRecommendation:completionHandler:", v12, v15);

          continue;
        }
        objc_msgSend(v12, "image");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_8;
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

void __95__WBSForYouRecommendationMediator__fetchImagesForRecommendations_recommendationsDispatchGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_retrieveFoundInRecommendationsWithCompletionHandler:(id)a3
{
  id v4;
  WBSFoundInRecommendationManager *foundInManager;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  foundInManager = self->_foundInManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__WBSForYouRecommendationMediator__retrieveFoundInRecommendationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5443B08;
  v8 = v4;
  v6 = v4;
  -[WBSFoundInRecommendationManager recentRecommendationsWithCompletionHandler:](foundInManager, "recentRecommendationsWithCompletionHandler:", v7);

}

uint64_t __88__WBSForYouRecommendationMediator__retrieveFoundInRecommendationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)retrieveHandoffRecommendationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  if ((objc_msgSend(MEMORY[0x1E0DC5EC0], "userActivityContinuationSupported") & 1) != 0)
  {
    -[WBSForYouRecommendationMediator _createAppSuggestionsManagerIfNecessary](self, "_createAppSuggestionsManagerIfNecessary");
    -[UABestAppSuggestion uniqueIdentifier](self->_currentAppSuggestion, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[UABestAppSuggestion originatingDeviceName](self->_currentAppSuggestion, "originatingDeviceName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0DC5EB8];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke;
      v10[3] = &unk_1E5443B30;
      v11 = v6;
      v12 = v4;
      v10[4] = self;
      v8 = v6;
      v9 = (id)objc_msgSend(v7, "fetchUserActivityWithUUID:intervalToWaitForDocumentSynchronizationToComplete:completionHandler:", v5, v10, 5.0);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  WBSForYouLinkRecommendation *v13;
  void *v14;
  WBSForYouLinkRecommendation *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "webpageURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v11)
        __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke_cold_2(v10, v6);
    }
    else if (v11)
    {
      __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke_cold_1();
    }
    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "safari_isHTTPFamilyURL") & 1) == 0)
  {
LABEL_10:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_18;
  }
  objc_msgSend(v5, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
    objc_msgSend(v5, "title");
  else
    objc_msgSend(v8, "host");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "length"))
  {
    v13 = [WBSForYouLinkRecommendation alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[WBSForYouLinkRecommendation initWithTitle:url:lastSeenDate:source:topicSource:](v13, "initWithTitle:url:lastSeenDate:source:topicSource:", v12, v8, v14, 3, 0);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "originatingDeviceType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSForYouLinkRecommendation setSecondarySourceIdentifier:](v15, "setSecondarySourceIdentifier:", v16);

    v17 = *(id *)(a1 + 40);
    if (objc_msgSend(v17, "length"))
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", v19, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSForYouLinkRecommendation setFootnote:](v15, "setFootnote:", v20);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

LABEL_18:
}

- (void)_createAppSuggestionsManagerIfNecessary
{
  UABestAppSuggestionManager *v3;
  UABestAppSuggestionManager *appSuggestionManager;

  if (objc_msgSend(MEMORY[0x1E0DC5EC0], "userActivityContinuationSupported"))
  {
    if (!self->_appSuggestionManager)
    {
      v3 = (UABestAppSuggestionManager *)objc_alloc_init(MEMORY[0x1E0DC5EB0]);
      appSuggestionManager = self->_appSuggestionManager;
      self->_appSuggestionManager = v3;

    }
  }
}

- (void)_beginListeningForHandoffActivity
{
  -[WBSForYouRecommendationMediator _createAppSuggestionsManagerIfNecessary](self, "_createAppSuggestionsManagerIfNecessary");
  -[UABestAppSuggestionManager setDelegate:](self->_appSuggestionManager, "setDelegate:", self);
  -[UABestAppSuggestionManager startListeningForBestAppSuggestions](self->_appSuggestionManager, "startListeningForBestAppSuggestions");
}

- (void)_endListeningForHandoffActivity
{
  -[UABestAppSuggestionManager setDelegate:](self->_appSuggestionManager, "setDelegate:", 0);
  -[UABestAppSuggestionManager stopListeningForBestAppSuggestions](self->_appSuggestionManager, "stopListeningForBestAppSuggestions");
  -[UABestAppSuggestionManager invalidate](self->_appSuggestionManager, "invalidate");
}

- (void)beginListeningForURLSuggestionChanges
{
  -[WBSFoundInRecommendationManager beginListeningForURLSuggestionChanges](self->_foundInManager, "beginListeningForURLSuggestionChanges");
}

- (void)stopListeningForURLSuggestionChanges
{
  -[WBSFoundInRecommendationManager stopListeningForURLSuggestionChanges](self->_foundInManager, "stopListeningForURLSuggestionChanges");
}

- (void)downvoteSource:(unint64_t)a3
{
  -[WBSForYouRecommendationMediator downvoteSource:postingChangeNotificationWhenDone:](self, "downvoteSource:postingChangeNotificationWhenDone:", a3, 1);
}

- (void)downvoteSource:(unint64_t)a3 postingChangeNotificationWhenDone:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  id v8;

  v4 = a4;
  -[WBSForYouRecommendationMediator _dataSourceWeightManager](self, "_dataSourceWeightManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downvoteSource:", a3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", *MEMORY[0x1E0D8A3A8], self);

  }
}

- (void)clearDataSourceWeights
{
  void *v3;
  id v4;

  -[WBSForYouRecommendationMediator _dataSourceWeightManager](self, "_dataSourceWeightManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0D8A3A8], self);

}

- (id)_dataSourceWeightManager
{
  WBSForYouDataSourceWeightManager *dataSourceWeightManager;
  WBSForYouDataSourceWeightManager *v4;
  void *v5;
  WBSForYouDataSourceWeightManager *v6;
  WBSForYouDataSourceWeightManager *v7;

  dataSourceWeightManager = self->_dataSourceWeightManager;
  if (!dataSourceWeightManager)
  {
    v4 = [WBSForYouDataSourceWeightManager alloc];
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WBSForYouDataSourceWeightManager initWithKeyValueStore:](v4, "initWithKeyValueStore:", v5);
    v7 = self->_dataSourceWeightManager;
    self->_dataSourceWeightManager = v6;

    dataSourceWeightManager = self->_dataSourceWeightManager;
  }
  return dataSourceWeightManager;
}

- (void)bestAppSuggestionChanged:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__WBSForYouRecommendationMediator_bestAppSuggestionChanged___block_invoke;
    v5[3] = &unk_1E5441848;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __60__WBSForYouRecommendationMediator_bestAppSuggestionChanged___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 40), "activityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB3418]))
    v3 = *(void **)(a1 + 40);
  else
    v3 = 0;
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), v3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("WBSForYouRecommendationMediatorDidUpdateHandoffApplicationNotification"), *(_QWORD *)(a1 + 32));

}

- (NSArray)dataSources
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)analyticsMetadataForRecommendation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_titleForRecommendationSource:", objc_msgSend(v3, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("source"));

  objc_msgSend(v3, "cachedScore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("recommendationScore"));

  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "lastSeenDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceNow");
  objc_msgSend(v7, "numberWithDouble:", -v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("recency"));

  objc_msgSend(v3, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(v3, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("sourceBundleIdentifier"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("unspecified"), CFSTR("sourceBundleIdentifier"));
  }

  objc_msgSend((id)objc_opt_class(), "_titleForRecommendationTopicSource:", objc_msgSend(v3, "topicSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("topicSource"));

  return v4;
}

+ (id)_titleForRecommendationSource:(unint64_t)a3
{
  if (a3 > 7)
    return CFSTR("unspecified");
  else
    return off_1E5443C98[a3];
}

+ (id)_titleForRecommendationTopicSource:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("unspecified");
  else
    return off_1E5443CD8[a3];
}

+ (double)scoreForRecommendation:(id)a3 weightManager:(id)a4 simplifiedURLStringToLastVisitedDateMap:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  double v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "weightForSource:", objc_msgSend(v9, "source"));
  v11 = v10;

  objc_msgSend(v9, "lastSeenDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v14 = v13;
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "isEqualToDate:", v17);

  objc_msgSend(v9, "pageURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "safari_isTopLevelURL");

  if (v20)
    v21 = 0.75;
  else
    v21 = 1.0;
  objc_msgSend(v9, "originalQueries");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23 >= 2)
    v21 = v21 * pow(1.1, (double)(v23 - 1));
  objc_msgSend(v9, "simplifiedURLString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v24, "length"))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "timeIntervalSinceReferenceDate");
      if (v27 != 0.0)
      {
        v28 = v27;
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        if (v29 - v28 < 15552000.0)
          v21 = v21 * 1.1;
      }
    }

  }
  v30 = ((v14 - v16) / 3600.0 + -2160.0) / -432.0;
  if (v18)
    v30 = -5.0;
  v31 = fmin(v11 * (1.0 - 1.0 / (exp(v30) + 1.0)) * v21, 1.0);

  return v31;
}

+ (void)_rankRecommendationsInPlace:(id)a3 history:(id)a4 weightManager:(id)a5 suppressHistoryDeduplication:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id obj;
  void *v42;
  _QWORD v43[5];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v39 = a4;
  v11 = a5;
  v40 = v10;
  if (objc_msgSend(v10, "count"))
  {
    v37 = a1;
    v38 = v11;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a6)
    {
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v63 != v14)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "simplifiedURLString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "length"))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "setObject:forKey:", v17, v16);

            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v13);
      }

      v18 = MEMORY[0x1E0C809B0];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke;
      v60[3] = &unk_1E5443B58;
      v19 = v42;
      v61 = v19;
      objc_msgSend(v39, "enumerateItemsUsingBlock:", v60);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v21 = v20;
      v57[0] = v18;
      v57[1] = 3221225472;
      v57[2] = __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_2;
      v57[3] = &unk_1E5443B80;
      v58 = v19;
      v59 = v21;
      removeLinkRecommendationsPassingTestWithReductionReason(v12, CFSTR("recently visited items"), v57);

    }
    if ((unint64_t)objc_msgSend(v10, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = v10;
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
      if (v23)
      {
        v24 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v54 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            objc_msgSend(v26, "pageURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v28
              || (objc_msgSend(v26, "lastSeenDate"),
                  v29 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v28, "lastSeenDate"),
                  v30 = (void *)objc_claimAutoreleasedReturnValue(),
                  v31 = objc_msgSend(v29, "compare:", v30) == 1,
                  v30,
                  v29,
                  v31))
            {
              objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, v27);
            }

          }
          v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
        }
        while (v23);
      }

      objc_msgSend(v22, "allValues");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "setArray:", v32);

      v33 = MEMORY[0x1E0C809B0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_3;
      v48[3] = &unk_1E5443BA8;
      v51 = v37;
      v49 = v38;
      v50 = v42;
      v52 = 0x3F7BB0247985D58DLL;
      removeLinkRecommendationsPassingTestWithReductionReason(obj, CFSTR("old items"), v48);
      objc_msgSend(obj, "sortUsingComparator:", &__block_literal_global_90);
      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      v47 = malloc_type_calloc(8uLL, 8uLL, 0x100004000313F17uLL);
      v43[0] = v33;
      v43[1] = 3221225472;
      v43[2] = __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_5;
      v43[3] = &unk_1E5443C10;
      v43[4] = &v44;
      removeLinkRecommendationsPassingTestWithReductionReason(obj, CFSTR("less relevant items for each data source"), v43);
      free((void *)v45[3]);
      v45[3] = 0;
      if ((unint64_t)objc_msgSend(obj, "count") <= 0xA)
        v34 = objc_msgSend(obj, "count");
      else
        v34 = 10;
      if (v34 != objc_msgSend(obj, "count"))
      {
        v35 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = objc_msgSend(obj, "count");
          *(_DWORD *)buf = 134218240;
          v67 = v36;
          v68 = 2048;
          v69 = 10;
          _os_log_impl(&dword_1A840B000, v35, OS_LOG_TYPE_INFO, "End up having %ld recommendations. Keep the top %ld", buf, 0x16u);
        }

        objc_msgSend(obj, "removeObjectsInRange:", v34, objc_msgSend(obj, "count") - v34);
      }
      _Block_object_dispose(&v44, 8);

    }
    v11 = v38;
  }

}

void __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "lastVisitedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  if (v5 != 0.0)
  {
    v6 = (void *)MEMORY[0x1A85D4428](v4);
    objc_msgSend(v10, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_simplifiedURLStringForDeduping");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v8);

    objc_autoreleasePoolPop(v6);
  }

}

BOOL __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL8 v8;

  objc_msgSend(a2, "simplifiedURLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = *(double *)(a1 + 40);
      objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      v8 = v6 - v7 < *MEMORY[0x1E0D8A3C8];
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 48), "scoreForRecommendation:weightManager:simplifiedURLStringToLastVisitedDateMap:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5 = v4;
  v6 = *(double *)(a1 + 56);
  if (v4 >= v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCachedScore:", v7);

  }
  return v5 < v6;
}

uint64_t __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "cachedScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "cachedScore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v11 = -1;
  if (v7 < v10)
    v11 = 1;
  if (v7 == v10)
    return 0;
  else
    return v11;
}

BOOL __114__WBSForYouRecommendationMediator__rankRecommendationsInPlace_history_weightManager_suppressHistoryDeduplication___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v3 = objc_msgSend(a2, "source");
  v4 = *(_QWORD *)(v2 + 8 * v3) + 1;
  *(_QWORD *)(v2 + 8 * v3) = v4;
  return v4 > 3;
}

+ (id)_adjustedTopicsWithTopics:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;
  void *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    v4 = v3;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v3;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
    goto LABEL_14;
  v7 = v6;
  v8 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v24 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      objc_msgSend(v10, "title", v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v10, "relevancyDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "relevancyDate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "compare:", v14);

        if (v15 != 1)
          goto LABEL_12;
        objc_msgSend(v10, "setSource:", 4);
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v11);
LABEL_12:

    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v7);
LABEL_14:

  objc_msgSend(v5, "allValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_94);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v17, "count") <= 3)
    v18 = objc_msgSend(v17, "count");
  else
    v18 = 3;
  objc_msgSend(v17, "subarrayWithRange:", 0, v18, v20);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v21;
LABEL_18:

  return v4;
}

uint64_t __61__WBSForYouRecommendationMediator__adjustedTopicsWithTopics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "relevancyDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relevancyDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)recommendationFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  WBSForYouLinkRecommendation *v12;
  WBSForYouLinkRecommendation *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  WBSForYouLinkRecommendation *v27;
  _QWORD v28[4];
  WBSForYouLinkRecommendation *v29;

  v4 = a3;
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("urlString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
        goto LABEL_6;
      objc_msgSend(v4, "safari_numberForKey:", CFSTR("source"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "integerValue");

      if (v9 > 7)
        goto LABEL_6;
      objc_msgSend(v4, "safari_numberForKey:", CFSTR("topic"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      if (v11 <= 4)
      {
        v14 = [WBSForYouLinkRecommendation alloc];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[WBSForYouLinkRecommendation initWithTitle:url:lastSeenDate:source:topicSource:](v14, "initWithTitle:url:lastSeenDate:source:topicSource:", v5, v7, v15, v9, v11);

        objc_msgSend(v4, "safari_stringForKey:", CFSTR("secondarySourceIdentifier"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSForYouLinkRecommendation setSecondarySourceIdentifier:](v12, "setSecondarySourceIdentifier:", v16);

        objc_msgSend(v4, "safari_stringForKey:", CFSTR("footnote"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSForYouLinkRecommendation setFootnote:](v12, "setFootnote:", v17);

        objc_msgSend(v4, "safari_stringForKey:", CFSTR("bundleIdentifier"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSForYouLinkRecommendation setBundleIdentifier:](v12, "setBundleIdentifier:", v18);

        objc_msgSend(v4, "safari_stringForKey:", CFSTR("sourceID"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSForYouLinkRecommendation setSourceID:](v12, "setSourceID:", v19);

        objc_msgSend(v4, "safari_stringForKey:", CFSTR("imageURLString"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            -[WBSForYouLinkRecommendation setImageURL:](v12, "setImageURL:", v21);
            +[WBSImageFetchingURLSessionTaskManager sharedManager](WBSImageFetchingURLSessionTaskManager, "sharedManager");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke;
            v28[3] = &unk_1E5443C78;
            v29 = v12;
            objc_msgSend(v22, "downloadImageWithURL:options:completionHandler:", v21, 1, v28);

          }
        }
        objc_msgSend(v4, "safari_stringForKey:", CFSTR("contactHandle"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "length"))
        {
          objc_msgSend(MEMORY[0x1E0D8A0E8], "sharedContactStoreManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "contactForHandle:error:", v23, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            -[WBSForYouLinkRecommendation setContact:](v12, "setContact:", v25);
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_3;
            v26[3] = &unk_1E5441CB8;
            v27 = v12;
            -[WBSForYouRecommendationMediator fetchImageForRecommendation:completionHandler:](self, "fetchImageForRecommendation:completionHandler:", v27, v26);

          }
        }

      }
      else
      {
LABEL_6:
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_2;
  v5[3] = &unk_1E5441848;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D8A3B8];
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *MEMORY[0x1E0D8A3C0];
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, v5);

}

void __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_4;
  block[3] = &unk_1E5441CB8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __64__WBSForYouRecommendationMediator_recommendationFromDictionary___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D8A3B8];
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *MEMORY[0x1E0D8A3C0];
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, 0, v5);

}

- (BOOL)ignoreMinimumNumberOfRecommendationsPerTopic
{
  return self->_ignoreMinimumNumberOfRecommendationsPerTopic;
}

- (void)setIgnoreMinimumNumberOfRecommendationsPerTopic:(BOOL)a3
{
  self->_ignoreMinimumNumberOfRecommendationsPerTopic = a3;
}

- (BOOL)suppressHistoryDeduplication
{
  return self->_suppressHistoryDeduplication;
}

- (void)setSuppressHistoryDeduplication:(BOOL)a3
{
  self->_suppressHistoryDeduplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_historyProvider, 0);
  objc_storeStrong((id *)&self->_contextClient, 0);
  objc_storeStrong((id *)&self->_requestsInProgressBySourceID, 0);
  objc_storeStrong((id *)&self->_messagesMetadataCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_currentAppSuggestion, 0);
  objc_storeStrong((id *)&self->_appSuggestionManager, 0);
  objc_storeStrong((id *)&self->_perSitePreferenceManager, 0);
  objc_storeStrong((id *)&self->_dataSourceWeightManager, 0);
  objc_storeStrong((id *)&self->_foundInManager, 0);
  objc_storeStrong((id *)&self->_topicManager, 0);
}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_16_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Timed out while obtaining Portrait topics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __70__WBSForYouRecommendationMediator_updatedTopicsWithCompletionHandler___block_invoke_16_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Timed out while obtaining ContextKit topics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Timed out while obtaining recommendations from Found In", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __89__WBSForYouRecommendationMediator_updatedRecommendationsForTopics_withCompletionHandler___block_invoke_24_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Timed out while obtaining recommendations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __105__WBSForYouRecommendationMediator_obtainMessagesImagesWherePossibleForRecommendations_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Timed out loading metadata for Messages from Found In", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Could not fetch user activity with unknown error", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __86__WBSForYouRecommendationMediator_retrieveHandoffRecommendationWithCompletionHandler___block_invoke_cold_2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Could not fetch user activity with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
