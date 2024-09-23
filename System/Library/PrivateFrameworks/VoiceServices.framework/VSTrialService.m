@implementation VSTrialService

- (id)definedVoicesWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_triClient, "rolloutIdentifiersWithNamespaceName:", CFSTR("SIRI_TEXT_TO_SPEECH"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[VSTrialService _definedVoicesWithLanguage:name:type:footprint:](self, "_definedVoicesWithLanguage:name:type:footprint:", v10, v11, a5, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)_definedVoicesWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v10 = a4;
  -[VSTrialService cachedVoices](self, "cachedVoices");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
        if ((!a5 || objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "type") == a5)
          && (!a6 || objc_msgSend(v17, "footprint") == a6))
        {
          if (!v10
            || (objc_msgSend(v17, "name"),
                v18 = (void *)objc_claimAutoreleasedReturnValue(),
                v19 = objc_msgSend(v10, "isEqualToString:", v18),
                v18,
                v19))
          {
            if (!v24
              || (objc_msgSend(v17, "language"),
                  v20 = (void *)objc_claimAutoreleasedReturnValue(),
                  v21 = objc_msgSend(v24, "isEqualToString:", v20),
                  v20,
                  v21))
            {
              objc_msgSend(v23, "addObject:", v17, v23);
            }
          }
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v14);
  }

  return v23;
}

- (NSArray)cachedVoices
{
  NSArray *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VSTrialVoice *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_clientRefreshLock, "lock");
  v3 = self->_cachedVoices;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[TRIClient factorLevelsWithNamespaceName:](self->_triClient, "factorLevelsWithNamespaceName:", CFSTR("SIRI_TEXT_TO_SPEECH"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = -[VSTrialVoice initWithFactorLevel:]([VSTrialVoice alloc], "initWithFactorLevel:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
          if (v9)
            -[NSArray addObject:](v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
    objc_storeStrong((id *)&self->_cachedVoices, v3);

  }
  -[NSLock unlock](self->_clientRefreshLock, "unlock");
  return v3;
}

- (VSTrialService)init
{
  VSTrialService *v2;
  uint64_t v3;
  TRIClient *triClient;
  dispatch_queue_t v5;
  OS_dispatch_queue *downloadQueue;
  NSLock *v7;
  NSLock *clientRefreshLock;
  TRIClient *v9;
  uint64_t v10;
  TRINotificationToken *trialNotificationToken;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)VSTrialService;
  v2 = -[VSTrialService init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC09D0], "clientWithIdentifier:", 118);
    v3 = objc_claimAutoreleasedReturnValue();
    triClient = v2->_triClient;
    v2->_triClient = (TRIClient *)v3;

    v5 = dispatch_queue_create("VSTrialService.downloadQueue", 0);
    downloadQueue = v2->_downloadQueue;
    v2->_downloadQueue = (OS_dispatch_queue *)v5;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    clientRefreshLock = v2->_clientRefreshLock;
    v2->_clientRefreshLock = v7;

    objc_initWeak(&location, v2);
    v9 = v2->_triClient;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __22__VSTrialService_init__block_invoke;
    v13[3] = &unk_1EA8B0300;
    objc_copyWeak(&v14, &location);
    -[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v9, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("SIRI_TEXT_TO_SPEECH"), v13);
    v10 = objc_claimAutoreleasedReturnValue();
    trialNotificationToken = v2->_trialNotificationToken;
    v2->_trialNotificationToken = (TRINotificationToken *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TRIClient removeUpdateHandlerForToken:](self->_triClient, "removeUpdateHandlerForToken:", self->_trialNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)VSTrialService;
  -[VSTrialService dealloc](&v3, sel_dealloc);
}

- (void)refreshTrialClient
{
  NSArray *cachedVoices;
  NSArray *cachedResources;

  -[TRIClient refresh](self->_triClient, "refresh");
  -[NSLock lock](self->_clientRefreshLock, "lock");
  cachedVoices = self->_cachedVoices;
  self->_cachedVoices = 0;

  cachedResources = self->_cachedResources;
  self->_cachedResources = 0;

  -[NSLock unlock](self->_clientRefreshLock, "unlock");
}

- (NSArray)cachedResources
{
  NSArray *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  VSTrialVoiceResource *v10;
  NSArray *v11;
  NSArray *cachedResources;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_clientRefreshLock, "lock");
  v3 = self->_cachedResources;
  if (!-[NSArray count](v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TRIClient factorLevelsWithNamespaceName:](self->_triClient, "factorLevelsWithNamespaceName:", CFSTR("SIRI_TEXT_TO_SPEECH"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = -[VSTrialVoiceResource initWithFactorLevel:]([VSTrialVoiceResource alloc], "initWithFactorLevel:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9));
          if (v10)
            objc_msgSend(v4, "addObject:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    v11 = v4;

    cachedResources = self->_cachedResources;
    self->_cachedResources = v11;

    v3 = v11;
  }
  -[NSLock unlock](self->_clientRefreshLock, "unlock");
  return v3;
}

- (id)_directoryOfFactorName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v4, CFSTR("SIRI_TEXT_TO_SPEECH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_error_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_ERROR, "#Trial Unable to find asset for factor name '%@'.", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_14;
  }
  objc_msgSend(v5, "directoryValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    VSGetLogDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_error_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_ERROR, "#Trial Factor '%@' doesn't seem to be directory.", (uint8_t *)&v15, 0xCu);
    }

    v8 = 0;
    goto LABEL_14;
  }
  v8 = v7;
  if (!-[NSObject hasPath](v7, "hasPath")
    || (-[NSObject path](v8, "path"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        !v10))
  {
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_INFO, "#Trial Factor '%@' is not downloaded yet.", (uint8_t *)&v15, 0xCu);
    }

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  v8 = v8;
  v11 = v8;
LABEL_15:

  return v11;
}

- (id)_fileOfFactorName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v4, CFSTR("SIRI_TEXT_TO_SPEECH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    VSGetLogDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_error_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_ERROR, "#Trial Unable to find asset for factor name '%@'.", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_14;
  }
  objc_msgSend(v5, "fileValue");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    VSGetLogDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_error_impl(&dword_1DE15E000, v13, OS_LOG_TYPE_ERROR, "#Trial Factor '%@' doesn't seem to be a file.", (uint8_t *)&v15, 0xCu);
    }

    v8 = 0;
    goto LABEL_14;
  }
  v8 = v7;
  if (!-[NSObject hasPath](v7, "hasPath")
    || (-[NSObject path](v8, "path"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "length"),
        v9,
        !v10))
  {
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1DE15E000, v12, OS_LOG_TYPE_INFO, "#Trial Factor '%@' is not downloaded yet.", (uint8_t *)&v15, 0xCu);
    }

LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  v8 = v8;
  v11 = v8;
LABEL_15:

  return v11;
}

- (void)downloadNamespaceImmediatelyIfNeededWithOption:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *downloadQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  downloadQueue = self->_downloadQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__VSTrialService_downloadNamespaceImmediatelyIfNeededWithOption_completion___block_invoke;
  block[3] = &unk_1EA8B0368;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(downloadQueue, block);

}

- (void)_downloadFactorName:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  TRIClient *triClient;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  VSGetLogEvent();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v31 = v10;
    v32 = 1024;
    v33 = objc_msgSend(v11, "allowDiscretionary");
    v34 = 1024;
    v35 = objc_msgSend(v11, "allowCellularData");
    _os_log_impl(&dword_1DE15E000, v14, OS_LOG_TYPE_DEFAULT, "#Trial Downloading asset with factor name: %@, discretionary:%d, allowCellular:%d", buf, 0x18u);
  }

  if (v11)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0DC0A08]);
    objc_msgSend(v15, "setAllowsCellularAccess:", objc_msgSend(v11, "allowCellularData"));
    if (objc_msgSend(v11, "allowDiscretionary"))
      v16 = 2;
    else
      v16 = 0;
    objc_msgSend(v15, "setDiscretionaryBehavior:", v16);
  }
  else
  {
    +[VSTrialService defaultDownloadOptions](VSTrialService, "defaultDownloadOptions");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_initWeak((id *)buf, self);
  triClient = self->_triClient;
  v29 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __70__VSTrialService__downloadFactorName_withOptions_progress_completion___block_invoke;
  v27[3] = &unk_1EA8B0390;
  v20 = v12;
  v28 = v20;
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __70__VSTrialService__downloadFactorName_withOptions_progress_completion___block_invoke_2;
  v23[3] = &unk_1EA8B03B8;
  v21 = v10;
  v24 = v21;
  objc_copyWeak(&v26, (id *)buf);
  v22 = v13;
  v25 = v22;
  -[TRIClient downloadLevelsForFactors:withNamespace:queue:options:progress:completion:](triClient, "downloadLevelsForFactors:withNamespace:queue:options:progress:completion:", v18, CFSTR("SIRI_TEXT_TO_SPEECH"), 0, v15, v27, v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);

}

- (void)_removeAssetWithFactorName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  TRIClient *triClient;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  VSGetLogEvent();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_DEFAULT, "#Trial Removing asset with factor name: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  triClient = self->_triClient;
  v17 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__VSTrialService__removeAssetWithFactorName_completion___block_invoke;
  v13[3] = &unk_1EA8B03B8;
  v11 = v6;
  v14 = v11;
  objc_copyWeak(&v16, (id *)buf);
  v12 = v7;
  v15 = v12;
  -[TRIClient removeLevelsForFactors:withNamespace:queue:completion:](triClient, "removeLevelsForFactors:withNamespace:queue:completion:", v10, CFSTR("SIRI_TEXT_TO_SPEECH"), 0, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);

}

- (TRIClient)triClient
{
  return self->_triClient;
}

- (void)setTriClient:(id)a3
{
  objc_storeStrong((id *)&self->_triClient, a3);
}

- (void)setCachedVoices:(id)a3
{
  objc_storeStrong((id *)&self->_cachedVoices, a3);
}

- (void)setCachedResources:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResources, a3);
}

- (TRINotificationToken)trialNotificationToken
{
  return self->_trialNotificationToken;
}

- (void)setTrialNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_trialNotificationToken, a3);
}

- (OS_dispatch_queue)downloadQueue
{
  return self->_downloadQueue;
}

- (void)setDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_downloadQueue, a3);
}

- (NSLock)clientRefreshLock
{
  return self->_clientRefreshLock;
}

- (void)setClientRefreshLock:(id)a3
{
  objc_storeStrong((id *)&self->_clientRefreshLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientRefreshLock, 0);
  objc_storeStrong((id *)&self->_downloadQueue, 0);
  objc_storeStrong((id *)&self->_trialNotificationToken, 0);
  objc_storeStrong((id *)&self->_cachedResources, 0);
  objc_storeStrong((id *)&self->_cachedVoices, 0);
  objc_storeStrong((id *)&self->_triClient, 0);
}

void __56__VSTrialService__removeAssetWithFactorName_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *WeakRetained;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    VSGetLogEvent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_DEFAULT, "#Trial Removed asset with factor name: %@", (uint8_t *)&v11, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject refreshTrialClient](WeakRetained, "refreshTrialClient");
  }
  else
  {
    VSGetLogDefault();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1DE15E000, WeakRetained, OS_LOG_TYPE_ERROR, "#Trial Unable to remove asset with factor name '%@', error: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);

}

uint64_t __70__VSTrialService__downloadFactorName_withOptions_progress_completion___block_invoke(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(float))(result + 16))((float)a2 / 100.0);
  return result;
}

void __70__VSTrialService__downloadFactorName_withOptions_progress_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *WeakRetained;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    VSGetLogEvent();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1DE15E000, v6, OS_LOG_TYPE_DEFAULT, "#Trial Downloaded asset with factor name: %@", (uint8_t *)&v11, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    -[NSObject refreshTrialClient](WeakRetained, "refreshTrialClient");
  }
  else
  {
    VSGetLogDefault();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412546;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1DE15E000, WeakRetained, OS_LOG_TYPE_ERROR, "#Trial Unable to download asset with factor name: %@, error: %@", (uint8_t *)&v11, 0x16u);
    }
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);

}

void __76__VSTrialService_downloadNamespaceImmediatelyIfNeededWithOption_completion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void (*v16)(void);
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rolloutIdentifiersWithNamespaceName:", CFSTR("SIRI_TEXT_TO_SPEECH"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "allowDiscretionary"))
  {
    VSGetLogDefault();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_DEFAULT, "Skip immediate namespace download due to discretionary download option.", buf, 2u);
    }

    v4 = *(_QWORD *)(a1 + 48);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    v21[0] = CFSTR("immediateDownloadForNamespaceNames cannot use discretionary download option.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("VSTrialServiceErrorDomain"), 3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SIRI_TEXT_TO_SPEECH"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    VSGetLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DE15E000, v9, OS_LOG_TYPE_DEFAULT, "#Trial Start downloading SIRI_TEXT_TO_SPEECH namespace.", buf, 2u);
    }

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v11 = objc_msgSend(*(id *)(a1 + 40), "allowCellularData");
    v17 = 0;
    v12 = objc_msgSend(v10, "immediateDownloadForNamespaceNames:allowExpensiveNetworking:error:", v8, v11, &v17);
    v13 = v17;
    VSGetLogDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DE15E000, v15, OS_LOG_TYPE_DEFAULT, "#Trial Finished downloading SIRI_TEXT_TO_SPEECH namespace.", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "refreshTrialClient");
      v16 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v13;
        _os_log_error_impl(&dword_1DE15E000, v15, OS_LOG_TYPE_ERROR, "#Trial Unable to download Trial namespace. Error: %@", buf, 0xCu);
      }

      v16 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    v16();

  }
}

void __22__VSTrialService_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1DE15E000, v2, OS_LOG_TYPE_DEFAULT, "#Trial Received namespace 'SIRI_TEXT_TO_SPEECH' update", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshTrialClient");

}

+ (VSTrialService)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_3715);
  return (VSTrialService *)(id)sharedService___sharedService;
}

+ (id)versionFactorNameWithFactorName:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR(".version"));
}

+ (id)defaultDownloadOptions
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0DC0A08]);
  objc_msgSend(v2, "setAllowsCellularAccess:", 0);
  objc_msgSend(v2, "setDiscretionaryBehavior:", 0);
  return v2;
}

void __31__VSTrialService_sharedService__block_invoke()
{
  VSTrialService *v0;
  void *v1;

  v0 = objc_alloc_init(VSTrialService);
  v1 = (void *)sharedService___sharedService;
  sharedService___sharedService = (uint64_t)v0;

}

- (id)definedVoiceResourcesWithLanguage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_triClient, "rolloutIdentifiersWithNamespaceName:", CFSTR("SIRI_TEXT_TO_SPEECH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[VSTrialService cachedResources](self, "cachedResources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12);
          if (!v4
            || (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "language", (_QWORD)v18),
                v14 = (void *)objc_claimAutoreleasedReturnValue(),
                v15 = objc_msgSend(v14, "isEqualToString:", v4),
                v14,
                v15))
          {
            objc_msgSend(v7, "addObject:", v13, (_QWORD)v18);
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v10);
    }

    if (!objc_msgSend(v7, "count"))
    {
      VSGetLogDefault();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_fault_impl(&dword_1DE15E000, v16, OS_LOG_TYPE_FAULT, "#Trial Cannot find any Trial resource for language %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (id)selectVoiceResourceWithLanguage:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t v8[16];

  if (!a3)
    return 0;
  -[VSTrialService definedVoiceResourcesWithLanguage:](self, "definedVoiceResourcesWithLanguage:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    VSGetLogDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_fault_impl(&dword_1DE15E000, v4, OS_LOG_TYPE_FAULT, "Unexpected multiple resources from Trial.", v8, 2u);
    }

  }
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isLocal"))
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)downloadVoiceResource:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "factorName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[VSTrialService _downloadFactorName:withOptions:progress:completion:](self, "_downloadFactorName:withOptions:progress:completion:", v13, v12, v11, v10);

}

- (void)removeVoiceResource:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "factorName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VSTrialService _removeAssetWithFactorName:completion:](self, "_removeAssetWithFactorName:completion:", v7, v6);

}

- (id)definedVoicesWithAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_triClient, "rolloutIdentifiersWithNamespaceName:", CFSTR("SIRI_TEXT_TO_SPEECH"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v17 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "languages", v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSTrialService _definedVoicesWithLanguage:name:type:footprint:](self, "_definedVoicesWithLanguage:name:type:footprint:", v13, v14, objc_msgSend(v11, "type"), objc_msgSend(v11, "footprint"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v15);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v4 = v17;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (id)selectVoiceWithLanguage:(id)a3 name:(id)a4 type:(int64_t)a5 footprint:(int64_t)a6
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v6 = 0;
  if (a3 && a4 && a5 && a6)
  {
    -[VSTrialService definedVoicesWithLanguage:name:type:footprint:](self, "definedVoicesWithLanguage:name:type:footprint:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_fault_impl(&dword_1DE15E000, v8, OS_LOG_TYPE_FAULT, "Unexpected multiple voices.", v11, 2u);
      }

    }
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isLocal"))
      v6 = v9;
    else
      v6 = 0;

  }
  return v6;
}

- (void)downloadVoice:(id)a3 withOptions:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  objc_msgSend(a3, "factorName");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[VSTrialService _downloadFactorName:withOptions:progress:completion:](self, "_downloadFactorName:withOptions:progress:completion:", v13, v12, v11, v10);

}

- (void)removeVoice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "factorName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[VSTrialService _removeAssetWithFactorName:completion:](self, "_removeAssetWithFactorName:completion:", v7, v6);

}

@end
