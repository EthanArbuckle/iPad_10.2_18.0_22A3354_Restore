@implementation WBSFaviconProvider

- (void)setProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_providerDelegate, a3);
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[10] = 2;
    objc_msgSend(WeakRetained, "_updateOutstandingRequestsAfterSuccessfulSetup");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_45(uint64_t a1)
{
  dispatch_object_t *WeakRetained;
  NSObject *v3;
  uint64_t v4;

  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_45_cold_1();
    dispatch_resume(WeakRetained[4]);
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + 16))();
  v3 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_cold_1();
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_45;
  v12[3] = &unk_1E54427F8;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  v13 = *(id *)(a1 + 40);
  v5 = (void *)MEMORY[0x1A85D45E4](v12);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_46;
  v8[3] = &unk_1E5442898;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v9 = v5;
  v11 = v2;
  v7 = v5;
  objc_msgSend(v6, "openAndCheckIntegrity:createIfNeeded:fallBackToMemoryStoreIfError:completionHandler:", v2, 0, 0, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v14);
}

- (void)_updateOutstandingRequestsAfterSuccessfulSetup
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSFaviconProvider__updateOutstandingRequestsAfterSuccessfulSetup__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

+ (CGSize)defaultFaviconSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 16.0;
  v3 = 16.0;
  result.height = v3;
  result.width = v2;
  return result;
}

void __68__WBSFaviconProvider__updateOutstandingRequestsAfterSuccessfulSetup__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v18;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v18 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v4);
        v13 = 0u;
        v14 = 0u;
        v15 = 0u;
        v16 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v14;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v14 != v8)
                objc_enumerationMutation(v6);
              v10 = *(void **)(a1 + 32);
              objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "url");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "_removeCachedResponsesForURL:", v11);

              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
          }
          while (v7);
        }

        objc_msgSend(*(id *)(a1 + 32), "_prepareAndSendResponseForRequests:forceDidReceiveNewData:", v6, 0);
        ++v4;
      }
      while (v4 != v2);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v2);
  }

}

- (void)setUpWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E54428E8;
  v7[4] = self;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_46(uint64_t a1, uint64_t a2)
{
  id *v4;
  _QWORD *WeakRetained;
  void *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    switch(a2)
    {
      case 0:
        v10 = (void *)WeakRetained[7];
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_2;
        v18[3] = &unk_1E54427F8;
        v8 = &v20;
        objc_copyWeak(&v20, v4);
        v19 = *(id *)(a1 + 32);
        objc_msgSend(v10, "removeIconFilesNotReferencedInDatabaseWithCompletionHandler:", v18);
        v9 = v19;
        goto LABEL_6;
      case 1:
      case 3:
        WeakRetained[10] = 1;
        v7 = WeakRetained[17];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_4;
        v13[3] = &unk_1E54428C0;
        v8 = &v15;
        objc_copyWeak(&v15, v4);
        v14 = *(id *)(a1 + 32);
        objc_msgSend(v6, "setUpPersistenceAtPath:completionHandler:", v7, v13);
        v9 = v14;
LABEL_6:

        objc_destroyWeak(v8);
        break;
      case 2:
        v11 = (void *)WeakRetained[7];
        v12 = *(unsigned __int8 *)(a1 + 48);
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_3;
        v16[3] = &unk_1E5442820;
        v16[4] = WeakRetained;
        v17 = *(id *)(a1 + 32);
        objc_msgSend(v11, "openAndCheckIntegrity:createIfNeeded:fallBackToMemoryStoreIfError:completionHandler:", v12, 0, 1, v16);

        break;
      default:
        break;
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (WBSFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 isReadOnly:(BOOL)a8 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a9
{
  _BOOL8 v10;
  double height;
  double width;
  id v18;
  id v19;
  id v20;
  id v21;
  WBSFaviconProvider *v22;
  WBSFaviconProvider *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *internalQueue;
  dispatch_queue_t v27;
  OS_dispatch_queue *internalSavingQueue;
  uint64_t v29;
  NSMutableDictionary *hostsToRequestsMap;
  NSCache *v31;
  NSCache *responseCache;
  uint64_t v33;
  NSCalendar *calendar;
  uint64_t v35;
  NSArray *allIconScales;
  uint64_t v37;
  id shouldCheckIntegrityWhenOpeningDatabaseBlock;
  uint64_t v39;
  NSCountedSet *requestsPendingResponse;
  WBSFaviconProviderPersistenceController *v41;
  WBSFaviconProviderPersistenceController *persistenceController;
  WBSFaviconProvider *v43;
  objc_super v45;

  v10 = a8;
  height = a5.height;
  width = a5.width;
  v18 = a3;
  v19 = a4;
  v20 = a7;
  v21 = a9;
  v45.receiver = self;
  v45.super_class = (Class)WBSFaviconProvider;
  v22 = -[WBSFaviconProvider init](&v45, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_baseURL, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = dispatch_queue_create("com.apple.Safari.WBSFaviconProvider", v24);
    internalQueue = v23->_internalQueue;
    v23->_internalQueue = (OS_dispatch_queue *)v25;

    v27 = dispatch_queue_create("com.apple.Safari.WBSFaviconProviderInternalSaving", v24);
    internalSavingQueue = v23->_internalSavingQueue;
    v23->_internalSavingQueue = (OS_dispatch_queue *)v27;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v29 = objc_claimAutoreleasedReturnValue();
    hostsToRequestsMap = v23->_hostsToRequestsMap;
    v23->_hostsToRequestsMap = (NSMutableDictionary *)v29;

    v31 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    responseCache = v23->_responseCache;
    v23->_responseCache = v31;

    v23->_providerState = 0;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v33 = objc_claimAutoreleasedReturnValue();
    calendar = v23->_calendar;
    v23->_calendar = (NSCalendar *)v33;

    v23->_expirationInterval = 604800.0;
    v23->_preferredIconSize.width = width;
    v23->_preferredIconSize.height = height;
    v23->_preferredIconScale = a6;
    v23->_scaledPreferredIconSize.width = width * a6;
    v23->_scaledPreferredIconSize.height = height * a6;
    v35 = objc_msgSend(v20, "copy");
    allIconScales = v23->_allIconScales;
    v23->_allIconScales = (NSArray *)v35;

    v23->_isReadOnly = v10;
    v37 = MEMORY[0x1A85D45E4](v21);
    shouldCheckIntegrityWhenOpeningDatabaseBlock = v23->_shouldCheckIntegrityWhenOpeningDatabaseBlock;
    v23->_shouldCheckIntegrityWhenOpeningDatabaseBlock = (id)v37;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v39 = objc_claimAutoreleasedReturnValue();
    requestsPendingResponse = v23->_requestsPendingResponse;
    v23->_requestsPendingResponse = (NSCountedSet *)v39;

    v41 = -[WBSFaviconProviderPersistenceController initWithPersistenceBaseURL:databaseName:preferredIconSize:isReadOnly:]([WBSFaviconProviderPersistenceController alloc], "initWithPersistenceBaseURL:databaseName:preferredIconSize:isReadOnly:", v23->_baseURL, v19, v10, v23->_scaledPreferredIconSize.width, v23->_scaledPreferredIconSize.height);
    persistenceController = v23->_persistenceController;
    v23->_persistenceController = v41;

    v43 = v23;
  }

  return v23;
}

- (WBSFaviconProvider)initWithPersistenceBaseURL:(id)a3 persistenceName:(id)a4 preferredIconSize:(CGSize)a5 atScale:(double)a6 allScales:(id)a7 shouldCheckIntegrityWhenOpeningDatabaseBlock:(id)a8
{
  return -[WBSFaviconProvider initWithPersistenceBaseURL:persistenceName:preferredIconSize:atScale:allScales:isReadOnly:shouldCheckIntegrityWhenOpeningDatabaseBlock:](self, "initWithPersistenceBaseURL:persistenceName:preferredIconSize:atScale:allScales:isReadOnly:shouldCheckIntegrityWhenOpeningDatabaseBlock:", a3, a4, a7, 0, a8, a5.width, a5.height, a6);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSFaviconProvider;
  -[WBSFaviconProvider dealloc](&v2, sel_dealloc);
}

- (id)persistenceController
{
  return self->_persistenceController;
}

- (int64_t)providerState
{
  NSObject *internalQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__WBSFaviconProvider_providerState__block_invoke;
  v5[3] = &unk_1E5441398;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__WBSFaviconProvider_providerState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 80);
  return result;
}

- (id)fallbackIconForRequest:(id)a3
{
  return 0;
}

uint64_t __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_4(uint64_t a1, char a2)
{
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;

  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (void *)*((_QWORD *)WeakRetained + 7);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_5;
    v8[3] = &unk_1E5442898;
    objc_copyWeak(&v10, v4);
    v9 = *(id *)(a1 + 32);
    v11 = a2;
    objc_msgSend(v7, "openAndCheckIntegrity:createIfNeeded:fallBackToMemoryStoreIfError:completionHandler:", 1, 1, 1, v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  char v9;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 7);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_6;
    v6[3] = &unk_1E5442870;
    objc_copyWeak(&v8, v2);
    v7 = *(id *)(a1 + 32);
    v9 = *(_BYTE *)(a1 + 48);
    objc_msgSend(v5, "removeIconFilesNotReferencedInDatabaseWithCompletionHandler:", v6);

    objc_destroyWeak(&v8);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v17 = a1;
    *((_QWORD *)WeakRetained + 10) = 2;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(*((id *)WeakRetained + 6), "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v21 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v8, "iconData");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "iconURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "pageURL");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "originalPageURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "size");
          objc_msgSend(v3, "_atomicallySaveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", v9, v10, v11, v12, objc_msgSend(v8, "isPrivate"), 0, v13, v14);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v5);
    }

    v15 = (void *)v3[6];
    v3[6] = 0;

    objc_msgSend(v3, "_updateOutstandingRequestsAfterSuccessfulSetup");
    v16 = *(unsigned __int8 *)(v17 + 48);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_7;
    v18[3] = &unk_1E5442848;
    v19 = *(id *)(v17 + 32);
    objc_msgSend(v3, "cleanUpAfterPersistenceSetUpDidSucceed:completionHandler:", v16, v18);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)shouldIconDataBeSavedForIconWithPageURL:(id)a3 originalPageURL:(id)a4 iconURL:(id)a5 size:(CGSize)a6 isPrivate:(BOOL)a7 completionHandler:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *internalQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  CGFloat v29;
  CGFloat v30;
  BOOL v31;

  height = a6.height;
  width = a6.width;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a8;
  internalQueue = self->_internalQueue;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke;
  v24[3] = &unk_1E5442988;
  v27 = v17;
  v28 = v18;
  v24[4] = self;
  v25 = v15;
  v26 = v16;
  v31 = a7;
  v29 = width;
  v30 = height;
  v20 = v17;
  v21 = v16;
  v22 = v15;
  v23 = v18;
  dispatch_async(internalQueue, v24);

}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(void);
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  char v23;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (v2 == 1)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_5;
  }
  if (!v2)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_5:
    v3();
    return;
  }
  if (!*(_QWORD *)(a1 + 40) || (v4 = *(void **)(a1 + 48)) == 0)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_2();
    v14 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_1();
    goto LABEL_16;
  }
  if (!*(_QWORD *)(a1 + 56))
  {
    v15 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_4();
    v16 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_3((uint64_t *)(a1 + 56), v16);
LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return;
  }
  v5 = objc_msgSend(v4, "safari_shouldBeAssociatedWithFaviconFromRedirectedURL:");
  v6 = 40;
  if (v5)
    v6 = 48;
  v7 = *(id *)(a1 + v6);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "absoluteString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(unsigned __int8 *)(a1 + 88);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_49;
  v17[3] = &unk_1E5442960;
  v17[4] = *(_QWORD *)(a1 + 32);
  v21 = *(id *)(a1 + 64);
  v18 = *(id *)(a1 + 40);
  v23 = *(_BYTE *)(a1 + 88);
  v19 = *(id *)(a1 + 56);
  v22 = *(_OWORD *)(a1 + 72);
  v12 = v7;
  v20 = v12;
  objc_msgSend(v8, "rejectedResourceInfosForPageURLString:iconURLString:includingPrivateData:completionHandler:", v9, v10, v11, v17);

}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v7, "isRejectedResource"))
        {
          v8 = *(void **)(a1 + 32);
          objc_msgSend(v7, "dateAdded");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v8) = objc_msgSend(v8, "_isIconDateExpired:", v9);

          if ((v8 & 1) == 0)
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v4)
        continue;
      break;
    }
  }

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(unsigned __int8 *)(a1 + 88);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5442938;
  v13[4] = *(_QWORD *)(a1 + 32);
  v14 = *(id *)(a1 + 48);
  v19 = *(_BYTE *)(a1 + 88);
  v18 = *(_OWORD *)(a1 + 72);
  v17 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 56);
  objc_msgSend(v10, "iconInfoForPageURLString:includingPrivateData:completionHandler:", v11, v12, v13);

LABEL_12:
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  char v17;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int8 *)(a1 + 88);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_3;
  v10[3] = &unk_1E5442910;
  v7 = v3;
  v11 = v7;
  v16 = *(_OWORD *)(a1 + 72);
  v8 = *(id *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v12 = v9;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v17 = *(_BYTE *)(a1 + 88);
  objc_msgSend(v4, "iconInfoForIconURLString:includingPrivateData:completionHandler:", v5, v6, v10);

}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double *v5;
  double v6;
  double v7;
  double v9;
  double v10;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v35;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v35 = v3;
  if (!v4)
  {
    if (v3)
    {
      v22 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "_atomicallyLinkPageURLs:toIconWithInfo:isPrivate:", v23, v35, *(unsigned __int8 *)(a1 + 88));

      v24 = *(_QWORD *)(a1 + 64);
      v25 = *(void **)(a1 + 40);
      objc_msgSend(v35, "dateAdded");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t))(v24 + 16))(v24, objc_msgSend(v25, "_isIconDateExpired:", v26));
      goto LABEL_28;
    }
    goto LABEL_31;
  }
  v5 = (double *)MEMORY[0x1E0C9D820];
  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*(double *)(a1 + 72) == *MEMORY[0x1E0C9D820] && *(double *)(a1 + 80) == v7)
  {
    objc_msgSend(v4, "size");
    v6 = *v5;
    v7 = v5[1];
    if (v10 == *v5 && v9 == v7)
      goto LABEL_31;
  }
  if (v35)
  {
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v35, "dateAdded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v12) = objc_msgSend(v12, "_isIconDateExpired:", v13);

    if ((v12 & 1) == 0)
    {
      objc_msgSend(v35, "size");
      v15 = v14;
      v17 = v16;
      objc_msgSend(*(id *)(a1 + 32), "size");
      if (+[WBSFaviconProviderUtilities isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:](WBSFaviconProviderUtilities, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v15, v17, v18, v19, *(double *)(*(_QWORD *)(a1 + 40) + 96), *(double *)(*(_QWORD *)(a1 + 40) + 104))|| objc_msgSend(*(id *)(a1 + 32), "hasGeneratedResolutions")&& (objc_msgSend(v35, "hasGeneratedResolutions") & 1) == 0)
      {
        v20 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_atomicallyLinkPageURLs:toIconWithInfo:isPrivate:", v21, v35, *(unsigned __int8 *)(a1 + 88));

      }
    }
    goto LABEL_31;
  }
  v27 = *(double *)(a1 + 72);
  v28 = *(double *)(a1 + 80);
  v29 = *(void **)(a1 + 32);
  if (v27 != v6 || v28 != v7)
    goto LABEL_24;
  if ((objc_msgSend(v29, "hasGeneratedResolutions") & 1) != 0)
  {
LABEL_31:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_32;
  }
  v27 = *(double *)(a1 + 72);
  v28 = *(double *)(a1 + 80);
  v29 = *(void **)(a1 + 32);
LABEL_24:
  objc_msgSend(v29, "size");
  if (+[WBSFaviconProviderUtilities isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:](WBSFaviconProviderUtilities, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v27, v28, v31, v32, *(double *)(*(_QWORD *)(a1 + 40) + 96), *(double *)(*(_QWORD *)(a1 + 40) + 104))&& (objc_msgSend(*(id *)(a1 + 32), "hasGeneratedResolutions") & 1) != 0)
  {
    goto LABEL_31;
  }
  v33 = *(_QWORD *)(a1 + 64);
  v34 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dateAdded");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t))(v33 + 16))(v33, objc_msgSend(v34, "_isIconDateExpired:", v26));
LABEL_28:

LABEL_32:
}

- (void)linkIconFromPageURL:(id)a3 toCurrentPageURL:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke;
  block[3] = &unk_1E54429D8;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21 = a5;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(internalQueue, block);

}

void __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  char v15;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80) <= 1uLL)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (!v3)
      return;
LABEL_12:
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    return;
  }
  v4 = *(void **)(a1 + 40);
  if (v4 && *(_QWORD *)(a1 + 48))
  {
    v5 = *(void **)(v2 + 56);
    objc_msgSend(v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(unsigned __int8 *)(a1 + 64);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_54;
    v12[3] = &unk_1E54429B0;
    v8 = *(id *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    v14 = v8;
    v12[4] = v9;
    v13 = *(id *)(a1 + 48);
    v15 = *(_BYTE *)(a1 + 64);
    objc_msgSend(v5, "iconInfoForPageURLString:includingPrivateData:completionHandler:", v6, v7, v12);

    return;
  }
  v10 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_cold_2();
  v11 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_cold_1();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    goto LABEL_12;
}

void __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_54(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_atomicallyLinkPageURLs:toIconWithInfo:isPrivate:", v4, v6, *(unsigned __int8 *)(a1 + 56));

  }
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, BOOL))(v5 + 16))(v5, v6 != 0);

}

- (BOOL)_isIconDateExpired:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v9 = v7 - v8 > self->_expirationInterval || v8 > v7;

  return v9;
}

- (void)saveFaviconImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  id v23;
  NSObject *internalQueue;
  id v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  void (**v33)(_QWORD);
  CGFloat v34;
  CGFloat v35;
  BOOL v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  height = a7.height;
  width = a7.width;
  v43 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = (void (**)(_QWORD))a9;
  if (!v18 || !v19 || !v20)
  {
    v26 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[WBSFaviconProvider saveFaviconImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:].cold.1();
    v27 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138478339;
      v38 = v19;
      v39 = 2113;
      v40 = v20;
      v41 = 2113;
      v42 = v18;
      _os_log_debug_impl(&dword_1A840B000, v27, OS_LOG_TYPE_DEBUG, "Cannot save icon, invalid page URL %{private}@, original page URL %{private}@, or icon URL %{private}@", buf, 0x20u);
      if (!v21)
        goto LABEL_13;
    }
    else if (!v21)
    {
      goto LABEL_13;
    }
    v21[2](v21);
    goto LABEL_13;
  }
  if (objc_msgSend(v20, "safari_shouldBeAssociatedWithFaviconFromRedirectedURL:", v19))
    v22 = v20;
  else
    v22 = v19;
  v23 = v22;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __108__WBSFaviconProvider_saveFaviconImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke;
  block[3] = &unk_1E5442A00;
  block[4] = self;
  v33 = v21;
  v29 = v19;
  v30 = v23;
  v31 = v18;
  v32 = v17;
  v34 = width;
  v35 = height;
  v36 = a8;
  v25 = v23;
  dispatch_async(internalQueue, block);

LABEL_13:
}

void __108__WBSFaviconProvider_saveFaviconImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _WBSFaviconRecord *v9;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[10];
  switch(v3)
  {
    case 2:
      objc_msgSend(v2, "_atomicallySaveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
      break;
    case 1:
      if (!v2[6])
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(void **)(v6 + 48);
        *(_QWORD *)(v6 + 48) = v5;

      }
      v9 = -[_WBSFaviconRecord initWithPageURL:originalPageURL:iconURL:iconData:size:isPrivate:]([_WBSFaviconRecord alloc], "initWithPageURL:originalPageURL:iconURL:iconData:size:isPrivate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 80), *(double *)(a1 + 88));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:");
      objc_msgSend(*(id *)(a1 + 32), "_updateOutstandingRequestsForPageURL:forceDidReceiveNewData:", *(_QWORD *)(a1 + 40), 0);
      if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:", *(_QWORD *)(a1 + 48)) & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 48));
        objc_msgSend(*(id *)(a1 + 32), "_updateOutstandingRequestsForPageURL:forceDidReceiveNewData:", *(_QWORD *)(a1 + 48), 0);
      }
      v8 = *(_QWORD *)(a1 + 72);
      if (v8)
        (*(void (**)(void))(v8 + 16))();

      break;
    case 0:
      v4 = *(_QWORD *)(a1 + 72);
      if (v4)
        (*(void (**)(void))(v4 + 16))();
      break;
  }
}

- (void)_atomicallySaveImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9
{
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *internalSavingQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34[3];
  BOOL v35;
  id location;

  height = a7.height;
  width = a7.width;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a9;
  objc_initWeak(&location, self);
  internalSavingQueue = self->_internalSavingQueue;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __112__WBSFaviconProvider__atomicallySaveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke;
  v28[3] = &unk_1E5442A28;
  objc_copyWeak(v34, &location);
  v32 = v20;
  v33 = v21;
  v29 = v17;
  v30 = v18;
  v31 = v19;
  v34[1] = *(id *)&width;
  v34[2] = *(id *)&height;
  v35 = a8;
  v23 = v20;
  v24 = v19;
  v25 = v18;
  v26 = v17;
  v27 = v21;
  dispatch_async(internalSavingQueue, v28);

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
}

void __112__WBSFaviconProvider__atomicallySaveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_object_t *WeakRetained;
  dispatch_object_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_suspend(WeakRetained[5]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(double *)(a1 + 80);
    v9 = *(double *)(a1 + 88);
    v10 = *(unsigned __int8 *)(a1 + 96);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __112__WBSFaviconProvider__atomicallySaveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_2;
    v11[3] = &unk_1E5441BC8;
    v11[4] = v3;
    v12 = *(id *)(a1 + 64);
    -[dispatch_object_t _saveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:](v3, "_saveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", v4, v5, v6, v7, v10, v11, v8, v9);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __112__WBSFaviconProvider__atomicallySaveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_confirmImageDataShouldBeSaved:(id)a3 size:(CGSize)a4 pageURL:(id)a5 iconURL:(id)a6 includingPrivateData:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  CGFloat height;
  CGFloat width;
  id v15;
  id v16;
  id v17;
  id v18;
  WBSFaviconProviderPersistenceController *persistenceController;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30[3];
  BOOL v31;
  id location;

  v9 = a7;
  height = a4.height;
  width = a4.width;
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  objc_initWeak(&location, self);
  persistenceController = self->_persistenceController;
  objc_msgSend(v16, "absoluteString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke;
  v25[3] = &unk_1E5442A50;
  objc_copyWeak(v30, &location);
  v21 = v18;
  v29 = v21;
  v22 = v15;
  v26 = v22;
  v23 = v16;
  v27 = v23;
  v24 = v17;
  v28 = v24;
  v31 = v9;
  v30[1] = *(id *)&width;
  v30[2] = *(id *)&height;
  -[WBSFaviconProviderPersistenceController iconInfoForPageURLString:includingPrivateData:completionHandler:](persistenceController, "iconInfoForPageURLString:includingPrivateData:completionHandler:", v20, v9, v25);

  objc_destroyWeak(v30);
  objc_destroyWeak(&location);

}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double *WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double *v9;
  BOOL v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  char v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  char v41;
  _BYTE v42[32];
  _BYTE v43[24];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v41 = 0;
    +[WBSFaviconProviderUtilities sizeOfImageWithData:closestToPreferredSize:isMultiResolution:](WBSFaviconProviderUtilities, "sizeOfImageWithData:closestToPreferredSize:isMultiResolution:", *(_QWORD *)(a1 + 32), &v41, WeakRetained[12], WeakRetained[13]);
    v7 = v5;
    v8 = v6;
    v9 = (double *)MEMORY[0x1E0C9D820];
    if (v5 == *MEMORY[0x1E0C9D820] && v6 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v13 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_2((uint64_t)v43, objc_msgSend(*(id *)(a1 + 32), "length"), v13);

      v14 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_1(*(_QWORD *)(a1 + 40), (uint64_t)v42, objc_msgSend(*(id *)(a1 + 32), "length"));

      v15 = (void *)*((_QWORD *)WeakRetained + 7);
      objc_msgSend(*(id *)(a1 + 40), "absoluteString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(unsigned __int8 *)(a1 + 88);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_57;
      v39[3] = &unk_1E5442848;
      v40 = *(id *)(a1 + 56);
      objc_msgSend(v15, "setIconIsRejectedResource:forPageURLString:iconURLString:isPrivate:completionHandler:", 1, v16, v17, v18, v39);

    }
    else
    {
      if (v3)
      {
        v11 = +[WBSFaviconProviderUtilities computeRelativeSize:referenceSize:](WBSFaviconProviderUtilities, "computeRelativeSize:referenceSize:", v5, v6, WeakRetained[12], WeakRetained[13]) != 6|| v41 == 0;
        if (v11 || (objc_msgSend(v3, "hasGeneratedResolutions") & 1) == 0)
        {
          objc_msgSend(v3, "size");
          v12 = +[WBSFaviconProviderUtilities isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:](WBSFaviconProviderUtilities, "isFaviconSize:morePreferrableThanFaviconSize:givenDesiredSize:", v7, v8, v19, v20, WeakRetained[12], WeakRetained[13]);
        }
        else
        {
          v12 = 1;
        }
        if (((objc_msgSend(v3, "hasGeneratedResolutions") ^ 1 | v12) & 1) == 0
          && (v41 || *(double *)(a1 + 72) == *v9 && *(double *)(a1 + 80) == v9[1]))
        {
          v24 = (void *)*((_QWORD *)WeakRetained + 7);
          objc_msgSend(*(id *)(a1 + 40), "absoluteString");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "absoluteString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = *(unsigned __int8 *)(a1 + 88);
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_2;
          v37[3] = &unk_1E5442848;
          v38 = *(id *)(a1 + 56);
          objc_msgSend(v24, "setIconIsRejectedResource:forPageURLString:iconURLString:isPrivate:completionHandler:", 1, v25, v26, v27, v37);

          goto LABEL_35;
        }
        objc_msgSend(v3, "dateAdded");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(WeakRetained, "_isIconDateExpired:", v21);

        if (((v22 | v12) & 1) == 0)
        {
          (*(void (**)(double, double))(*(_QWORD *)(a1 + 56) + 16))(*v9, v9[1]);
          goto LABEL_35;
        }
      }
      v36 = 0;
      +[WBSFaviconProviderUtilities multiResolutionImageFromImageData:withPreferredSize:atScales:didGenerateResolutions:](WBSFaviconProviderUtilities, "multiResolutionImageFromImageData:withPreferredSize:atScales:didGenerateResolutions:", *(_QWORD *)(a1 + 32), *((_QWORD *)WeakRetained + 19), &v36, WeakRetained[20], WeakRetained[21]);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        (*(void (**)(double, double))(*(_QWORD *)(a1 + 56) + 16))(v7, v8);
      }
      else
      {
        v28 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_4((uint64_t)v43, objc_msgSend(*(id *)(a1 + 32), "length"), v28);

        v29 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_3(*(_QWORD *)(a1 + 40), (uint64_t)v42, objc_msgSend(*(id *)(a1 + 32), "length"));

        v30 = (void *)*((_QWORD *)WeakRetained + 7);
        objc_msgSend(*(id *)(a1 + 40), "absoluteString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "absoluteString");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = *(unsigned __int8 *)(a1 + 88);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_58;
        v34[3] = &unk_1E5442848;
        v35 = *(id *)(a1 + 56);
        objc_msgSend(v30, "setIconIsRejectedResource:forPageURLString:iconURLString:isPrivate:completionHandler:", 1, v31, v32, v33, v34);

      }
    }
  }
  else
  {
    (*(void (**)(double, double))(*(_QWORD *)(a1 + 56) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
LABEL_35:

}

uint64_t __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_57(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

uint64_t __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

uint64_t __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_58(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(*MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)_saveImageData:(id)a3 iconURL:(id)a4 pageURL:(id)a5 originalPageURL:(id)a6 size:(CGSize)a7 isPrivate:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL8 v10;
  double height;
  double width;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  id location;

  v10 = a8;
  height = a7.height;
  width = a7.width;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a3;
  objc_initWeak(&location, self);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke;
  v26[3] = &unk_1E5442AF0;
  objc_copyWeak(&v31, &location);
  v27 = v18;
  v28 = v17;
  v32 = v10;
  v29 = v19;
  v30 = v20;
  v22 = v19;
  v23 = v17;
  v24 = v18;
  v25 = v20;
  -[WBSFaviconProvider _confirmImageDataShouldBeSaved:size:pageURL:iconURL:includingPrivateData:completionHandler:](self, "_confirmImageDataShouldBeSaved:size:pageURL:iconURL:includingPrivateData:completionHandler:", v21, v24, v23, v10, v26, width, height);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke(uint64_t a1, char a2, void *a3, uint64_t a4, double a5, double a6)
{
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v13 = WeakRetained;
  if (WeakRetained && (a2 & 1) != 0)
  {
    v14 = (void *)*((_QWORD *)WeakRetained + 7);
    objc_msgSend(*(id *)(a1 + 32), "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(unsigned __int8 *)(a1 + 72);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_2;
    v19[3] = &unk_1E5442AC8;
    objc_copyWeak(&v24, (id *)(a1 + 64));
    v23 = *(id *)(a1 + 56);
    v20 = *(id *)(a1 + 32);
    v21 = *(id *)(a1 + 48);
    v22 = *(id *)(a1 + 40);
    v25 = *(_BYTE *)(a1 + 72);
    objc_msgSend(v14, "setIconData:forPageURLString:iconURLString:iconSize:hasGeneratedResolutions:isPrivate:completionHandler:", v11, v15, v16, a4, v17, v19, a5, a6);

    objc_destroyWeak(&v24);
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 56);
    if (v18)
      (*(void (**)(void))(v18 + 16))();
  }

}

void __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[4];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_3;
    v6[3] = &unk_1E5442AA0;
    v6[4] = WeakRetained;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 48);
    v11 = *(_BYTE *)(a1 + 72);
    dispatch_async(v4, v6);

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }

}

void __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_updateOutstandingRequestsForPageURL:forceDidReceiveNewData:", *(_QWORD *)(a1 + 40), 0);
  if (objc_msgSend(*(id *)(a1 + 48), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 64);
    if (v2)
      (*(void (**)(void))(v2 + 16))();
  }
  else
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    objc_msgSend(*(id *)(a1 + 48), "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "absoluteString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned __int8 *)(a1 + 72);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_4;
    v7[3] = &unk_1E5442A78;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 64);
    objc_msgSend(v3, "linkPageURLString:toIconURLString:isPrivate:completionHandler:", v4, v5, v6, v7);

  }
}

void __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_5;
  block[3] = &unk_1E5441AD8;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

uint64_t __102__WBSFaviconProvider__saveImageData_iconURL_pageURL_originalPageURL_size_isPrivate_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateOutstandingRequestsForPageURL:forceDidReceiveNewData:", *(_QWORD *)(a1 + 40), 0);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeAllIconsForURLStringsNotIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WBSFaviconProvider_removeAllIconsForURLStringsNotIn_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __73__WBSFaviconProvider_removeAllIconsForURLStringsNotIn_completionHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 56), "removeIconsWithURLStringsNotFoundIn:completionHandler:", a1[5], a1[6]);
}

- (void)removeIconForURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *internalQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__WBSFaviconProvider_removeIconForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __63__WBSFaviconProvider_removeIconForURLString_completionHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 56), "removeIconWithPageURLString:completionHandler:", a1[5], a1[6]);
}

- (void)flushPrivateDataFromMemoryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441BC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 56);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5442B18;
  v4[4] = v1;
  v5 = v2;
  objc_msgSend(v3, "flushPrivateDataFromMemoryWithCompletionHandler:", v4);

}

void __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
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
  v6 = *(NSObject **)(v4 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E5441AD8;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __70__WBSFaviconProvider_flushPrivateDataFromMemoryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v5), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_updateOutstandingRequestsForPageURL:forceDidReceiveNewData:", v7, 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)retainPrivateData
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WBSFaviconProvider_retainPrivateData__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __39__WBSFaviconProvider_retainPrivateData__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(result + 32) + 88);
  return result;
}

- (void)releasePrivateData
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WBSFaviconProvider_releasePrivateData__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

_QWORD *__40__WBSFaviconProvider_releasePrivateData__block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result[4];
  v2 = *(_QWORD *)(v1 + 88);
  if (v2)
  {
    *(_QWORD *)(v1 + 88) = v2 - 1;
    result = (_QWORD *)result[4];
    if (!result[11])
      return (_QWORD *)objc_msgSend(result, "flushPrivateDataFromMemoryWithCompletionHandler:", 0);
  }
  return result;
}

- (void)setUpPersistenceAtPath:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
}

- (void)imageForRequestDuringPersistenceSetUp:(id)a3 completionHandler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)cleanUpAfterPersistenceSetUpDidSucceed:(BOOL)a3 completionHandler:(id)a4
{
  (*((void (**)(id))a4 + 2))(a4);
}

- (id)builtInIconForRequest:(id)a3
{
  return 0;
}

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)prepareResponseForRequest:(id)a3 allowDelayedResponse:(BOOL)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a3;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WBSFaviconProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke;
  block[3] = &unk_1E5441410;
  block[4] = self;
  v9 = v5;
  v10 = v5;
  v7 = v5;
  dispatch_async(internalQueue, block);

}

void __69__WBSFaviconProvider_prepareResponseForRequest_allowDelayedResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_registerRequest:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_cachedResponseForRequest:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", *(_QWORD *)(a1 + 48)) & 1) != 0)
      return;
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_prepareAndSendResponseForRequests:forceDidReceiveNewData:");
    v2 = v4;
  }

}

- (id)responseForRequest:(id)a3 willProvideUpdates:(BOOL *)a4
{
  *a4 = 1;
  -[WBSFaviconProvider _cachedResponseForRequest:](self, "_cachedResponseForRequest:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)stopWatchingUpdatesForRequest:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSFaviconProvider *v9;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__WBSFaviconProvider_stopWatchingUpdatesForRequest___block_invoke;
  v7[3] = &unk_1E54413C0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __52__WBSFaviconProvider_stopWatchingUpdatesForRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_hostFromRequest:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObject:", v4);
    if (!objc_msgSend(v3, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObjectForKey:", v2);

  }
}

- (BOOL)providesFavicons
{
  return 1;
}

- (void)emptyCaches
{
  -[WBSFaviconProviderPersistenceController removeAllIconsWithCompletionHandler:](self->_persistenceController, "removeAllIconsWithCompletionHandler:", &__block_literal_global_9);
}

- (void)savePendingChangesBeforeTermination
{
  dispatch_sync((dispatch_queue_t)self->_internalSavingQueue, &__block_literal_global_62_1);
  -[WBSFaviconProviderPersistenceController savePendingChangesBeforeTermination](self->_persistenceController, "savePendingChangesBeforeTermination");
}

- (id)_cachedResponseForRequest:(id)a3
{
  id v4;
  NSCache *v5;
  NSCache *responseCache;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = self->_responseCache;
  objc_sync_enter(v5);
  responseCache = self->_responseCache;
  -[WBSFaviconProvider _responseCacheKeyForRequest:](self, "_responseCacheKeyForRequest:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](responseCache, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSFaviconProvider _responseDictionaryKeyForRequest:](self, "_responseDictionaryKeyForRequest:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v10;
}

- (void)_addCachedResponse:(id)a3 forRequest:(id)a4
{
  id v6;
  NSCache *v7;
  NSCache *responseCache;
  void *v9;
  void *v10;
  uint64_t v11;
  NSCache *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = self->_responseCache;
  objc_sync_enter(v7);
  responseCache = self->_responseCache;
  -[WBSFaviconProvider _responseCacheKeyForRequest:](self, "_responseCacheKeyForRequest:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](responseCache, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = self->_responseCache;
    -[WBSFaviconProvider _responseCacheKeyForRequest:](self, "_responseCacheKeyForRequest:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setObject:forKey:](v12, "setObject:forKey:", v11, v13);

    v10 = (void *)v11;
  }
  -[WBSFaviconProvider _responseDictionaryKeyForRequest:](self, "_responseDictionaryKeyForRequest:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v14);

  objc_sync_exit(v7);
}

- (void)_removeCachedResponsesForURL:(id)a3
{
  id v5;
  NSCache *obj;

  obj = self->_responseCache;
  v5 = a3;
  objc_sync_enter(obj);
  -[NSCache removeObjectForKey:](self->_responseCache, "removeObjectForKey:", v5);

  objc_sync_exit(obj);
}

- (void)_removeCachedResponsesForRequest:(id)a3
{
  NSCache *v4;
  NSCache *responseCache;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self->_responseCache;
  objc_sync_enter(v4);
  responseCache = self->_responseCache;
  -[WBSFaviconProvider _responseCacheKeyForRequest:](self, "_responseCacheKeyForRequest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](responseCache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WBSFaviconProvider _responseDictionaryKeyForRequest:](self, "_responseDictionaryKeyForRequest:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  objc_sync_exit(v4);

}

- (id)_responseDictionaryKeyForRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "iconSize");
  v6 = v5;
  objc_msgSend(v3, "iconSize");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("{%lf, %lf}-%lu"), v6, v7, objc_msgSend(v3, "fallbackType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_responseCacheKeyForRequest:(id)a3
{
  objc_msgSend(a3, "url");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_hostFromRequest:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFaviconProvider _hostFromURL:](self, "_hostFromURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_hostFromURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    objc_msgSend(v3, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "host");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_stringByRemovingWwwDotPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (void)_registerRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WBSFaviconProvider _hostFromRequest:](self, "_hostFromRequest:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestsMap, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hostsToRequestsMap, "setObject:forKeyedSubscript:");
    }
    objc_msgSend(v5, "addObject:", v6);

  }
}

- (id)_requestsForHost:(id)a3
{
  -[NSMutableDictionary objectForKeyedSubscript:](self->_hostsToRequestsMap, "objectForKeyedSubscript:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateOutstandingRequestsForPageURL:(id)a3 forceDidReceiveNewData:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[WBSFaviconProvider _removeCachedResponsesForURL:](self, "_removeCachedResponsesForURL:");
  -[WBSFaviconProvider _hostFromURL:](self, "_hostFromURL:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSFaviconProvider _requestsForHost:](self, "_requestsForHost:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
    -[WBSFaviconProvider _prepareAndSendResponseForRequests:forceDidReceiveNewData:](self, "_prepareAndSendResponseForRequests:forceDidReceiveNewData:", v7, v4);

}

- (void)_prepareAndSendResponseForRequests:(id)a3 forceDidReceiveNewData:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke;
  v4[3] = &unk_1E5442BF8;
  v4[4] = self;
  v5 = a4;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v4);
}

void __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;
  char v8;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", v3);
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_2;
  v6[3] = &unk_1E5442BD0;
  v6[4] = v4;
  v5 = v3;
  v7 = v5;
  v8 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v4, "_getIconForRequest:withCompletionHandler:", v5, v6);

}

void __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_3;
  v8[3] = &unk_1E5442BA8;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  v8[1] = 3221225472;
  v8[4] = v4;
  v9 = v3;
  v10 = v5;
  v11 = *(_BYTE *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  BOOL v22;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(*(id *)(a1 + 32), "_addCachedResponse:forRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "favicon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v3 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "favicon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        v3 = 0;
      else
        v3 = objc_msgSend(*(id *)(a1 + 48), "fallbackType") == 0;

    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "isIconDownloadingEnabled")
    && !objc_msgSend(*(id *)(a1 + 40), "faviconType"))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "iconSize");
    v11 = v10;
    v13 = v12;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_4;
    v17[3] = &unk_1E5442B80;
    v14 = WeakRetained;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    v18 = v14;
    v19 = v15;
    v20 = v16;
    v21 = *(id *)(a1 + 48);
    v22 = v3;
    objc_msgSend(v6, "shouldIconDataBeSavedForIconWithPageURL:originalPageURL:iconURL:size:isPrivate:completionHandler:", v7, v8, v9, 0, v17, v11, v13);

  }
  else
  {
    objc_msgSend(WeakRetained, "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, v3, *(_QWORD *)(a1 + 48));
  }

}

void __80__WBSFaviconProvider__prepareAndSendResponseForRequests_forceDidReceiveNewData___block_invoke_4(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  if (a2)
  {
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "_blockOperationForRequest:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "siteMetadataProvider:didReceiveResponse:forRequest:beginOperationUsingBlock:", v3, v4, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "siteMetadataProvider:didReceiveResponse:ofType:didReceiveNewData:forRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
}

- (id)_blockOperationForRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__WBSFaviconProvider__blockOperationForRequest___block_invoke;
  v8[3] = &unk_1E5442C68;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1A85D45E4](v8);

  return v6;
}

WBSTouchIconFetchOperation *__48__WBSFaviconProvider__blockOperationForRequest___block_invoke(uint64_t a1)
{
  WBSTouchIconFetchOperation *v2;
  uint64_t v3;
  WBSTouchIconFetchOperation *v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [WBSTouchIconFetchOperation alloc];
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__WBSFaviconProvider__blockOperationForRequest___block_invoke_2;
  v6[3] = &unk_1E5442C40;
  objc_copyWeak(&v8, &location);
  v7 = *(id *)(a1 + 40);
  v4 = -[WBSTouchIconFetchOperation initWithRequest:completionHandler:](v2, "initWithRequest:completionHandler:", v3, v6);
  -[WBSWebViewMetadataFetchOperation setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v4;
}

void __48__WBSFaviconProvider__blockOperationForRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  NSObject **v9;
  id v10;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[4];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__WBSFaviconProvider__blockOperationForRequest___block_invoke_3;
    block[3] = &unk_1E5441410;
    v8 = v3;
    v9 = v5;
    v10 = *(id *)(a1 + 32);
    dispatch_async(v6, block);

  }
}

void __48__WBSFaviconProvider__blockOperationForRequest___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  if (objc_msgSend(*(id *)(a1 + 32), "pageRequestDidSucceed")
    && !objc_msgSend(*(id *)(a1 + 32), "higherPriorityIconDownloadFailedDueToNetworkError"))
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "iconData");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "iconURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "iconSize");
    objc_msgSend(v5, "_atomicallySaveImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:", v12, v6, v7, v8, 0, 0);
LABEL_10:

    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "iconURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "response");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v10, "statusCode");

    objc_msgSend(*(id *)(a1 + 32), "response");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v11, "safari_statusCodeGroup");

    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 4 || v3 == 204 || v3 == 205)
    {
      v9 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
      objc_msgSend(*(id *)(a1 + 48), "url");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "iconURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "absoluteString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIconIsRejectedResource:forPageURLString:iconURLString:isPrivate:completionHandler:", 1, v6, v8, 0, &__block_literal_global_69);
      goto LABEL_10;
    }
  }
}

- (void)webViewMetadataFetchOperation:(id)a3 didFinishUsingWebView:(id)a4
{
  WBSSiteMetadataProviderDelegate **p_providerDelegate;
  id v6;
  id WeakRetained;

  p_providerDelegate = &self->_providerDelegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:didFinishUsingWebView:", self, v6);

}

- (void)webViewMetadataFetchOperation:(id)a3 getWebViewOfSize:(CGSize)a4 withConfiguration:(id)a5 completionHandler:(id)a6
{
  double height;
  double width;
  WBSSiteMetadataProviderDelegate **p_providerDelegate;
  id v11;
  id v12;
  id WeakRetained;

  height = a4.height;
  width = a4.width;
  p_providerDelegate = &self->_providerDelegate;
  v11 = a6;
  v12 = a5;
  WeakRetained = objc_loadWeakRetained((id *)p_providerDelegate);
  objc_msgSend(WeakRetained, "siteMetadataProvider:getWebViewOfSize:withConfiguration:completionHandler:", self, v12, v11, width, height);

}

- (void)_getIconForRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  WBSFaviconProviderPersistenceController *persistenceController;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  WBSFaviconProviderPersistenceController *v22;
  _QWORD v23[4];
  void (**v24)(_QWORD, _QWORD, _QWORD);
  _QWORD v25[5];
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  _QWORD v28[5];
  id v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke;
  v31[3] = &unk_1E5442CB8;
  v31[4] = self;
  v9 = v6;
  v32 = v9;
  v10 = v7;
  v33 = v10;
  v11 = MEMORY[0x1A85D45E4](v31);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))v11;
  if (self->_providerState)
  {
    -[WBSFaviconProvider builtInIconForRequest:](self, "builtInIconForRequest:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      ((void (**)(_QWORD, void *, uint64_t))v12)[2](v12, v13, 1);
    }
    else
    {
      if (self->_providerState != 1)
      {
        v14 = objc_msgSend(v9, "type");
        if (v14)
        {
          if (v14 != 1)
            goto LABEL_14;
          -[WBSFaviconProvider _hostFromRequest:](self, "_hostFromRequest:", v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          persistenceController = self->_persistenceController;
          v25[0] = v8;
          v25[1] = 3221225472;
          v25[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_5;
          v25[3] = &unk_1E5442D98;
          v26 = v15;
          v27 = v12;
          v25[4] = self;
          v17 = v15;
          -[WBSFaviconProviderPersistenceController firstIconForVariantsOfDomainString:includingPrivateData:completionHandler:](persistenceController, "firstIconForVariantsOfDomainString:includingPrivateData:completionHandler:", v17, 1, v25);

          v18 = v27;
        }
        else
        {
          objc_msgSend(v9, "url");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "absoluteString");
          v17 = (id)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v9, "isURLTypedByUser"))
          {
            objc_msgSend(v17, "safari_bestURLForUserTypedString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "absoluteString");
            v21 = objc_claimAutoreleasedReturnValue();

            v17 = (id)v21;
          }
          v22 = self->_persistenceController;
          v23[0] = v8;
          v23[1] = 3221225472;
          v23[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_9;
          v23[3] = &unk_1E5442DC0;
          v24 = v12;
          -[WBSFaviconProviderPersistenceController firstIconForVariantsOfPageURLString:includingPrivateData:completionHandler:](v22, "firstIconForVariantsOfPageURLString:includingPrivateData:completionHandler:", v17, 1, v23);
          v18 = v24;
        }

        goto LABEL_14;
      }
      v28[0] = v8;
      v28[1] = 3221225472;
      v28[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_3;
      v28[3] = &unk_1E5442CE0;
      v28[4] = self;
      v29 = v9;
      v30 = v10;
      -[WBSFaviconProvider imageForRequestDuringPersistenceSetUp:completionHandler:](self, "imageForRequestDuringPersistenceSetUp:completionHandler:", v29, v28);

    }
LABEL_14:

    goto LABEL_15;
  }
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v11 + 16))(v11, 0, 0);
LABEL_15:

}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  char v15;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5442C90;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 32);
  block[1] = 3221225472;
  v15 = a3;
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v14 = *(id *)(a1 + 48);
  v9 = v5;
  dispatch_async(v8, block);

}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  WBSFaviconResponse *v4;
  void *v5;
  WBSFaviconResponse *v6;
  id v7;

  if (*(_BYTE *)(a1 + 64))
    v2 = 1;
  else
    v2 = 2;
  v7 = *(id *)(a1 + 32);
  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "fallbackIconForRequest:", *(_QWORD *)(a1 + 48));
    v2 = 0;
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = *(_QWORD *)(a1 + 56);
  v4 = [WBSFaviconResponse alloc];
  objc_msgSend(*(id *)(a1 + 48), "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSFaviconResponse initWithURL:favicon:faviconType:](v4, "initWithURL:favicon:faviconType:", v5, v7, v2);
  (*(void (**)(uint64_t, WBSFaviconResponse *))(v3 + 16))(v3, v6);

}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_4;
  v8[3] = &unk_1E5441B28;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 32);
  v8[1] = 3221225472;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  WBSFaviconResponse *v10;
  void *v11;
  WBSFaviconResponse *v12;
  id v13;
  id v14;

  v2 = *(id *)(a1 + 32);
  if (v2)
  {
    v13 = v2;
    v3 = 2;
  }
  else
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
    objc_msgSend(*(id *)(a1 + 48), "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14
      && (v6 = objc_alloc(MEMORY[0x1E0CEA638]),
          objc_msgSend(v14, "iconData"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v6, "initWithData:", v7),
          v7,
          v14,
          v8))
    {
      v3 = 2;
      v13 = (id)v8;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "fallbackIconForRequest:", *(_QWORD *)(a1 + 48));
      v3 = 0;
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v9 = *(_QWORD *)(a1 + 56);
  v10 = [WBSFaviconResponse alloc];
  objc_msgSend(*(id *)(a1 + 48), "url");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WBSFaviconResponse initWithURL:favicon:faviconType:](v10, "initWithURL:favicon:faviconType:", v11, v13, v3);
  (*(void (**)(uint64_t, WBSFaviconResponse *))(v9 + 16))(v9, v12);

}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_6;
    v7[3] = &unk_1E5442D70;
    v6 = *(id *)(a1 + 48);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v5, "pageURLStringsPrefixedWithVariantsOfDomainString:includingPrivateData:completionHandler:", v4, 1, v7);

  }
}

void __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "safari_minimumUsingComparator:", &__block_literal_global_77);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_8;
    v6[3] = &unk_1E5442D48;
    v7 = v4;
    objc_msgSend(v5, "iconForPageURLString:includingPrivateData:completionHandler:", v3, 1, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v5, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 >= v9)
  {
    objc_msgSend(v4, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    objc_msgSend(v5, "pathComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 > objc_msgSend(v13, "count");

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

uint64_t __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__WBSFaviconProvider__getIconForRequest_withCompletionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_atomicallyLinkPageURLs:(id)a3 toIconWithInfo:(id)a4 isPrivate:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *internalSavingQueue;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  internalSavingQueue = self->_internalSavingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WBSFaviconProvider__atomicallyLinkPageURLs_toIconWithInfo_isPrivate___block_invoke;
  block[3] = &unk_1E5442DE8;
  objc_copyWeak(&v16, &location);
  v14 = v8;
  v15 = v9;
  v17 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(internalSavingQueue, block);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __71__WBSFaviconProvider__atomicallyLinkPageURLs_toIconWithInfo_isPrivate___block_invoke(uint64_t a1)
{
  dispatch_object_t *WeakRetained;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = (dispatch_object_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v13;
      v6 = MEMORY[0x1E0C809B0];
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
          dispatch_suspend(WeakRetained[5]);
          v9 = *(_QWORD *)(a1 + 40);
          v10 = *(unsigned __int8 *)(a1 + 56);
          v11[0] = v6;
          v11[1] = 3221225472;
          v11[2] = __71__WBSFaviconProvider__atomicallyLinkPageURLs_toIconWithInfo_isPrivate___block_invoke_2;
          v11[3] = &unk_1E54425B0;
          v11[4] = WeakRetained;
          -[dispatch_object_t _linkPageURL:toIconWithInfo:isPrivate:completionHandler:](WeakRetained, "_linkPageURL:toIconWithInfo:isPrivate:completionHandler:", v8, v9, v10, v11);
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v4);
    }

  }
}

void __71__WBSFaviconProvider__atomicallyLinkPageURLs_toIconWithInfo_isPrivate___block_invoke_2(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_linkPageURL:(id)a3 toIconWithInfo:(id)a4 isPrivate:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  WBSFaviconProviderPersistenceController *persistenceController;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  persistenceController = self->_persistenceController;
  objc_msgSend(v10, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke;
  v18[3] = &unk_1E5442E38;
  objc_copyWeak(&v22, &location);
  v15 = v12;
  v21 = v15;
  v16 = v11;
  v19 = v16;
  v17 = v10;
  v20 = v17;
  v23 = v7;
  -[WBSFaviconProviderPersistenceController iconInfoForPageURLString:includingPrivateData:completionHandler:](persistenceController, "iconInfoForPageURLString:includingPrivateData:completionHandler:", v14, v7, v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained
    || v3
    && (objc_msgSend(v3, "UUIDString"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(*(id *)(a1 + 32), "UUIDString"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = (void *)WeakRetained[7];
    objc_msgSend(*(id *)(a1 + 40), "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "iconURLString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(unsigned __int8 *)(a1 + 64);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2;
    v12[3] = &unk_1E5442E10;
    objc_copyWeak(&v16, (id *)(a1 + 56));
    v15 = *(id *)(a1 + 48);
    v13 = *(id *)(a1 + 40);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v8, "linkPageURLString:toIconURLString:isPrivate:completionHandler:", v9, v10, v11, v12);

    objc_destroyWeak(&v16);
  }

}

void __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if ((a2 & 1) == 0)
    {
      v5 = WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2_cold_2();
      v6 = (id)WBS_LOG_CHANNEL_PREFIXFaviconProvider();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "iconURLString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2_cold_1(v7, v8, (uint64_t)v16, v6);
      }

    }
    v9 = WeakRetained[4];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_79;
    v14[3] = &unk_1E54413C0;
    v14[4] = WeakRetained;
    v15 = *(id *)(a1 + 32);
    dispatch_async(v9, v14);
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v10, v11, v12, v13);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_79(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateOutstandingRequestsForPageURL:forceDidReceiveNewData:", *(_QWORD *)(a1 + 40), 0);
}

- (WBSSiteMetadataProviderDelegate)providerDelegate
{
  return (WBSSiteMetadataProviderDelegate *)objc_loadWeakRetained((id *)&self->_providerDelegate);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (CGSize)preferredIconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredIconSize.width;
  height = self->_preferredIconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)preferredIconScale
{
  return self->_preferredIconScale;
}

- (NSArray)allIconScales
{
  return self->_allIconScales;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIconScales, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_providerDelegate);
  objc_storeStrong(&self->_shouldCheckIntegrityWhenOpeningDatabaseBlock, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_storeStrong((id *)&self->_urlsToFaviconRecordsSavedDuringMigration, 0);
  objc_storeStrong((id *)&self->_internalSavingQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_requestsPendingResponse, 0);
  objc_storeStrong((id *)&self->_responseCache, 0);
  objc_storeStrong((id *)&self->_hostsToRequestsMap, 0);
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1A840B000, v0, v1, "Suspended processing favicon provider requests due to initialization.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __49__WBSFaviconProvider_setUpWithCompletionHandler___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_7(&dword_1A840B000, v0, v1, "Resumed processing favicon provider requests, initialization is done.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, v0, (uint64_t)v0, "Cannot determine if icon should be saved, invalid page URL %{private}@ or original page URL %{private}@.", v1);
  OUTLINED_FUNCTION_1();
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Cannot determine if icon should be saved due to invalid page URLs.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_3(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138477827;
  v4 = v2;
  _os_log_debug_impl(&dword_1A840B000, a2, OS_LOG_TYPE_DEBUG, "Cannot determine if icon should be saved, invalid icon URL %{private}@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __119__WBSFaviconProvider_shouldIconDataBeSavedForIconWithPageURL_originalPageURL_iconURL_size_isPrivate_completionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Cannot determine if icon should be saved due to invalid icon URL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, v0, (uint64_t)v0, "Cannot determine if icon should be linked, invalid page URL %{private}@ or original page URL %{private}@.", v1);
  OUTLINED_FUNCTION_1();
}

void __87__WBSFaviconProvider_linkIconFromPageURL_toCurrentPageURL_isPrivate_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Cannot determine if icon should be linked due to invalid page URLs.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)saveFaviconImageData:iconURL:pageURL:originalPageURL:size:isPrivate:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Cannot save icon, invalid page URLs or icon URL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5_0(a1, a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, v5, v3, "Failed to get image from icon data for page URL: %{private}@ - data %lu bytes", v4);
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134349056;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1A840B000, a2, a3, "Failed to get image from icon data: %{public}lu bytes", (uint8_t *)a1);
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_5_0(a1, a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, v5, v3, "Failed to create image from icon data for page URL: %{private}@ - data %lu bytes", v4);
}

void __113__WBSFaviconProvider__confirmImageDataShouldBeSaved_size_pageURL_iconURL_includingPrivateData_completionHandler___block_invoke_cold_4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134349056;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0(&dword_1A840B000, a2, a3, "Failed to create image from icon data: %{public}lu bytes", (uint8_t *)a1);
}

void __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138478083;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2113;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_3(&dword_1A840B000, a4, a3, "Failed to link page URL %{private}@ to icon URL %{private}@", (uint8_t *)a3);

}

void __78__WBSFaviconProvider__linkPageURL_toIconWithInfo_isPrivate_completionHandler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2(&dword_1A840B000, v0, v1, "Failed to link page URL to icon URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
