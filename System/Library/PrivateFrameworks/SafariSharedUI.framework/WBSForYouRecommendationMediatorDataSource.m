@implementation WBSForYouRecommendationMediatorDataSource

- (void)recommendationsWithTopics:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  WBSForYouRecommendationMediatorDataSource *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = a4;
  v7 = dispatch_group_create();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        dispatch_group_enter(v7);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __93__WBSForYouRecommendationMediatorDataSource_recommendationsWithTopics_withCompletionHandler___block_invoke;
        v21[3] = &unk_1E5443D08;
        v22 = v8;
        v23 = self;
        v24 = v7;
        -[WBSForYouRecommendationMediatorDataSource retrieveRecommendationsMatchingTopic:withCompletionHandler:](self, "retrieveRecommendationsMatchingTopic:withCompletionHandler:", v14, v21);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__WBSForYouRecommendationMediatorDataSource_recommendationsWithTopics_withCompletionHandler___block_invoke_1;
  block[3] = &unk_1E5443108;
  v19 = v8;
  v20 = v17;
  v15 = v17;
  v16 = v8;
  dispatch_group_notify(v7, MEMORY[0x1E0C80D38], block);

}

void __93__WBSForYouRecommendationMediatorDataSource_recommendationsWithTopics_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  os_signpost_id_t v16;
  id obj;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v9 = *(void **)(a1 + 32);
          objc_msgSend(v8, "pageURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v8, "originalQueries");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addOriginalQueries:", v12);
          }
          else
          {
            v13 = *(void **)(a1 + 32);
            objc_msgSend(v8, "pageURL");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v12);
          }

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v5);
    }

    objc_sync_exit(obj);
  }
  v14 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
  v15 = os_signpost_id_make_with_pointer(v14, *(const void **)(a1 + 40));
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A840B000, v14, OS_SIGNPOST_INTERVAL_END, v16, "RetrieveRecommendations", " enableTelemetry=YES ", buf, 2u);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __93__WBSForYouRecommendationMediatorDataSource_recommendationsWithTopics_withCompletionHandler___block_invoke_1(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id obj;

  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  }
  objc_sync_exit(obj);

}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)notifyContentsDidChangeFromSource:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D8A3A8];
  v9 = *MEMORY[0x1E0D8A3B0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", v6, self, v8);

}

- (void)notifyImageWasUpdatedForRecommendation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D8A3B8];
  v9 = *MEMORY[0x1E0D8A3C0];
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", v7, self, v8);
}

- (void)emitStartRetrievingRecommendationsPerformanceMarker
{
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (id)WBS_LOG_CHANNEL_PREFIXStartPage();
  v4 = os_signpost_id_make_with_pointer(v3, self);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v4;
    if (os_signpost_enabled(v3))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_signpost_emit_with_name_impl(&dword_1A840B000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RetrieveRecommendations", "%@", (uint8_t *)&v8, 0xCu);

    }
  }

}

@end
