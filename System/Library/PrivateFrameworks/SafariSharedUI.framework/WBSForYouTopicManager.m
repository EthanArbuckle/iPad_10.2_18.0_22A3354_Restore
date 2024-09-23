@implementation WBSForYouTopicManager

- (WBSForYouTopicManager)initWithHistory:(id)a3 contextClient:(id)a4
{
  id v7;
  id v8;
  WBSForYouTopicManager *v9;
  WBSForYouTopicManager *v10;
  uint64_t v11;
  NSDate *lastContextKitRequestDate;
  WBSForYouTopicManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSForYouTopicManager;
  v9 = -[WBSForYouTopicManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_history, a3);
    objc_storeStrong((id *)&v10->_contextClient, a4);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v11 = objc_claimAutoreleasedReturnValue();
    lastContextKitRequestDate = v10->_lastContextKitRequestDate;
    v10->_lastContextKitRequestDate = (NSDate *)v11;

    v13 = v10;
  }

  return v10;
}

- (void)contextKitTopicsWithCompletionHandler:(id)a3
{
  void (**v4)(id, NSArray *);
  double v5;
  double v6;
  WBSRecentHistoryTopicTagController *v7;
  WBSRecentHistoryTopicTagController *historyTopicTagController;
  NSDate *v9;
  NSDate *lastContextKitRequestDate;
  WBSRecentHistoryTopicTagController *v11;
  NSObject *v12;
  _QWORD v13[5];
  void (**v14)(id, NSArray *);
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, NSArray *))a3;
  -[NSDate timeIntervalSinceNow](self->_lastContextKitRequestDate, "timeIntervalSinceNow");
  v6 = v5;
  if (v5 >= -20.0)
  {
    v4[2](v4, self->_mostRecentUserVisibleTopics);
    v12 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v16 = v6 + 20.0;
      _os_log_impl(&dword_1A840B000, v12, OS_LOG_TYPE_INFO, "Using cached ContextKit topics (and will for +%fs)", buf, 0xCu);
    }
  }
  else
  {
    if (!self->_historyTopicTagController)
    {
      v7 = (WBSRecentHistoryTopicTagController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A1A0]), "initWithHistory:", self->_history);
      historyTopicTagController = self->_historyTopicTagController;
      self->_historyTopicTagController = v7;

      -[WBSRecentHistoryTopicTagController setMaximumNumberOfTopics:](self->_historyTopicTagController, "setMaximumNumberOfTopics:", 10);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastContextKitRequestDate = self->_lastContextKitRequestDate;
    self->_lastContextKitRequestDate = v9;

    v11 = self->_historyTopicTagController;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E5443D30;
    v13[4] = self;
    v14 = v4;
    -[WBSRecentHistoryTopicTagController loadTopicsWithCompletionHandler:](v11, "loadTopicsWithCompletionHandler:", v13);

  }
}

void __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  WBSForYouTopic *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WBSForYouTopic *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id obj;
  _QWORD block[5];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[16];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v25 = a3;
  v26 = v6;
  if (objc_msgSend(v6, "count"))
  {
    v24 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v11, "historyItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = [WBSForYouTopic alloc];
          objc_msgSend(v11, "title");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "lastVisitedDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = v3;
          }
          v19 = -[WBSForYouTopic initWithTitle:identifier:relevancyDate:source:](v14, "initWithTitle:identifier:relevancyDate:source:", v15, v16, v18, 1);
          if (!v17)

          objc_msgSend(v7, "addObject:", v19);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v8);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke_4;
    block[3] = &unk_1E5441AD8;
    v20 = *(void **)(v24 + 40);
    block[4] = *(_QWORD *)(v24 + 32);
    v29 = v7;
    v30 = v20;
    v21 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    if (v25)
    {
      v22 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v25, "safari_privacyPreservingDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke_cold_1(v23, (uint64_t)v36, v22);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)portraitNamedEntitiesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WBSForYouTopicManager _createInternalQueueIfNecessary](self, "_createInternalQueueIfNecessary");
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441BC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = objc_opt_new();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = v2;

  }
  v5 = objc_alloc_init(MEMORY[0x1E0D70BD0]);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -5400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromDate:", v6);

  objc_msgSend(v5, "setLimit:", 3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E547BD60);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMatchingCategories:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v16 = 0;
  objc_msgSend(v8, "rankedNamedEntitiesWithQuery:error:", v5, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (v10)
  {
    v11 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke_cold_1(v12, (uint64_t)v17, v11);
    }

    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }
  else
  {
    objc_msgSend(v9, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v14);

  }
}

WBSForYouTopic *__68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  WBSForYouTopic *v4;
  WBSForYouTopic *v5;
  void *v6;

  objc_msgSend(a2, "item");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v3, "length") >= 5)
  {
    v5 = [WBSForYouTopic alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[WBSForYouTopic initWithTitle:identifier:relevancyDate:source:](v5, "initWithTitle:identifier:relevancyDate:source:", v3, v3, v6, 3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_createInternalQueueIfNecessary
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *internalQueue;

  if (!self->_internalQueue)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Safari.ForYouTopicManager.internalQueue", 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v3;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentUserVisibleTopics, 0);
  objc_storeStrong((id *)&self->_lastContextKitRequestDate, 0);
  objc_storeStrong((id *)&self->_contextClient, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_historyTopicTagController, 0);
}

void __63__WBSForYouTopicManager_contextKitTopicsWithCompletionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A840B000, a2, a3, "Could not load ContextKit topics with error: %{public}@", (uint8_t *)a2);

}

void __68__WBSForYouTopicManager_portraitNamedEntitiesWithCompletionHandler___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A840B000, a2, a3, "Failed to get Portrait named entities: %{public}@", (uint8_t *)a2);

}

@end
