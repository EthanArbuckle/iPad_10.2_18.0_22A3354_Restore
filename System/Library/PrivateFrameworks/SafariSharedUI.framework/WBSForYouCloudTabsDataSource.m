@implementation WBSForYouCloudTabsDataSource

- (WBSForYouCloudTabsDataSource)initWithTabStore:(id)a3
{
  id v5;
  WBSForYouCloudTabsDataSource *v6;
  WBSForYouCloudTabsDataSource *v7;
  WBSForYouCloudTabsDataSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSForYouCloudTabsDataSource;
  v6 = -[WBSForYouCloudTabsDataSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabsStore, a3);
    v8 = v7;
  }

  return v7;
}

- (void)retrieveRecommendationsMatchingTopic:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WBSForYouCloudTabsDataSource;
  -[WBSForYouRecommendationMediatorDataSource emitStartRetrievingRecommendationsPerformanceMarker](&v11, sel_emitStartRetrievingRecommendationsPerformanceMarker);
  if (v7)
  {
    -[WBSForYouCloudTabsDataSource _createInternalQueueIfNecessary](self, "_createInternalQueueIfNecessary");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__WBSForYouCloudTabsDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke;
    block[3] = &unk_1E54432C0;
    block[4] = self;
    v9 = v6;
    v10 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __91__WBSForYouCloudTabsDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "syncedCloudTabDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __91__WBSForYouCloudTabsDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E54432C0;
  block[1] = 3221225472;
  v8 = v3;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, block);

}

void __91__WBSForYouCloudTabsDataSource_retrieveRecommendationsMatchingTopic_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  WBSForYouLinkRecommendation *v13;
  void *v14;
  void *v15;
  WBSForYouLinkRecommendation *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = *(id *)(a1 + 32);
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v26)
  {
    v25 = *(_QWORD *)v35;
    do
    {
      v2 = 0;
      do
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(obj);
        v27 = v2;
        v3 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v2);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v29 = v3;
        objc_msgSend(v3, "tabs");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v31 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
              objc_msgSend(v9, "title");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(a1 + 40), "title");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v10, "localizedCaseInsensitiveContainsString:", v11);

              if (v12)
              {
                v13 = [WBSForYouLinkRecommendation alloc];
                objc_msgSend(v9, "url");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = -[WBSForYouLinkRecommendation initWithTitle:url:lastSeenDate:source:topicSource:](v13, "initWithTitle:url:lastSeenDate:source:topicSource:", v10, v14, v15, 4, objc_msgSend(*(id *)(a1 + 40), "source"));

                v17 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend(*(id *)(a1 + 40), "title");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setWithObject:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBSForYouLinkRecommendation addOriginalQueries:](v16, "addOriginalQueries:", v19);

                v20 = (void *)MEMORY[0x1E0CB3940];
                _WBSLocalizedString();
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "disambiguatedName");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "stringWithFormat:", v21, v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBSForYouLinkRecommendation setFootnote:](v16, "setFootnote:", v23);

                objc_msgSend(v28, "addObject:", v16);
              }

            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          }
          while (v6);
        }

        v2 = v27 + 1;
      }
      while (v27 + 1 != v26);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v26);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_createInternalQueueIfNecessary
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *internalQueue;

  if (!self->_internalQueue)
  {
    v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Safari.WBSForYouCloudTabsDataSource.internalQueue", 0);
    internalQueue = self->_internalQueue;
    self->_internalQueue = v3;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_tabsStore, 0);
}

@end
