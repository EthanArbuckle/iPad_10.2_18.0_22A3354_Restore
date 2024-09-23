@implementation WBSOnDiskDataCache

uint64_t __47__WBSOnDiskDataCache__dispatchDiskAccessBlock___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t result;

  v1 = *(id **)(a1 + 40);
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v1)
  {
    SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v1);
    JUMPOUT(0x1A85D41B8);
  }
  return result;
}

void __80__WBSOnDiskDataCache_removeEntriesForKeyStringsNotIncludedIn_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_24);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), 0, 7, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "lastPathComponent", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v2, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "safari_removeFileAtURL:error:", v9, 0);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(void))(v13 + 16))();

}

- (void)removeEntriesForKeyStringsNotIncludedIn:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WBSOnDiskDataCache *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (!self->_terminating)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__WBSOnDiskDataCache_removeEntriesForKeyStringsNotIncludedIn_completionHandler___block_invoke;
    v8[3] = &unk_1E5441AD8;
    v9 = v6;
    v10 = self;
    v11 = v7;
    -[WBSOnDiskDataCache _dispatchDiskAccessBlock:](self, "_dispatchDiskAccessBlock:", v8);

  }
}

void __27__WBSOnDiskDataCache_setUp__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[4];
  id v20;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_diskAccessQueueName");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), v5);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v7;

  v10 = objc_alloc(MEMORY[0x1E0D8A0D8]);
  objc_msgSend(*(id *)(a1 + 32), "_cacheSettingsFileURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __27__WBSOnDiskDataCache_setUp__block_invoke_2;
  v19[3] = &unk_1E5444AB8;
  objc_copyWeak(&v20, (id *)(a1 + 40));
  v14 = objc_msgSend(v10, "initWithName:fileURL:dataSourceQueue:dataSourceBlock:", CFSTR("SiteMetadataCacheSetting"), v11, v12, v19);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 56);
  *(_QWORD *)(v15 + 56) = v14;

  v17 = *(void **)(a1 + 32);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __27__WBSOnDiskDataCache_setUp__block_invoke_10;
  v18[3] = &unk_1E54425B0;
  v18[4] = v17;
  objc_msgSend(v17, "_dispatchDiskAccessBlock:", v18);
  objc_destroyWeak(&v20);

}

- (void)_dispatchDiskAccessBlock:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *diskAccessQueue;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v4 = a3;
  if (!self->_terminating)
  {
    v5 = operator new();
    MEMORY[0x1A85D4170](v5, CFSTR("com.apple.SafariShared.WBSOnDiskDataCache"));
    diskAccessQueue = self->_diskAccessQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__WBSOnDiskDataCache__dispatchDiskAccessBlock___block_invoke;
    v7[3] = &unk_1E5444B98;
    v9 = v5;
    v8 = v4;
    dispatch_async(diskAccessQueue, v7);

  }
}

- (void)setUp
{
  _QWORD v3[5];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__WBSOnDiskDataCache_setUp__block_invoke;
  v3[3] = &unk_1E5444AE0;
  v3[4] = self;
  objc_copyWeak(&v4, &location);
  -[WBSOnDiskDataCache _internalQueueDispatchAsync:](self, "_internalQueueDispatchAsync:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_internalQueueDispatchAsync:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_internalQueue, a3);
}

- (id)_cacheSettingsFileURL
{
  return -[NSURL URLByAppendingPathComponent:isDirectory:](self->_cacheDirectoryURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("Settings.plist"), 0);
}

- (id)_diskAccessQueueName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.diskAccessQueue"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_notifyDidFinishSettingUp
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCacheDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dataCacheDidSetUp:", self);

}

- (void)setIsInMemoryCacheEnabled:(BOOL)a3
{
  uint64_t v3;
  _QWORD v4[5];

  if (self->_isInMemoryCacheEnabled != a3)
  {
    v3 = MEMORY[0x1E0C809B0];
    self->_isInMemoryCacheEnabled = a3;
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __48__WBSOnDiskDataCache_setIsInMemoryCacheEnabled___block_invoke;
    v4[3] = &unk_1E54425B0;
    v4[4] = self;
    -[WBSOnDiskDataCache _internalQueueDispatchSync:](self, "_internalQueueDispatchSync:", v4);
  }
}

- (void)setDataCacheDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataCacheDelegate, a3);
}

- (WBSOnDiskDataCache)initWithCacheDirectoryURL:(id)a3
{
  id v5;
  WBSOnDiskDataCache *v6;
  NSObject *v7;
  id v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *internalQueue;
  NSCache *v11;
  NSCache *entriesForKeyStringsCache;
  NSMutableSet *v13;
  NSMutableSet *missingEntryKeyStrings;
  WBSOnDiskDataCache *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSOnDiskDataCache;
  v6 = -[WBSOnDiskDataCache init](&v17, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    -[WBSOnDiskDataCache _internalQueueName](v6, "_internalQueueName");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), v7);
    internalQueue = v6->_internalQueue;
    v6->_internalQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_cacheDirectoryURL, a3);
    v6->_isInMemoryCacheEnabled = 1;
    v11 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    entriesForKeyStringsCache = v6->_entriesForKeyStringsCache;
    v6->_entriesForKeyStringsCache = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    missingEntryKeyStrings = v6->_missingEntryKeyStrings;
    v6->_missingEntryKeyStrings = v13;

    v15 = v6;
  }

  return v6;
}

- (id)_internalQueueName
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.Safari.%@.%p.internalQueue"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_internalQueueDispatchSync:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_internalQueue, a3);
}

void __48__WBSOnDiskDataCache_setIsInMemoryCacheEnabled___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 65))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;
  }
  else
  {
    v5 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = 0;
  }

}

- (WBSOnDiskDataCache)init
{

  return 0;
}

id __27__WBSOnDiskDataCache_setUp__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v9;
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained[6];
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (!v3)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = WeakRetained[6];
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __27__WBSOnDiskDataCache_setUp__block_invoke_2_cold_1(v6, v7, buf, v5);
    }

  }
  return v3;
}

void __27__WBSOnDiskDataCache_setUp__block_invoke_10(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v2 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(*(id *)(a1 + 32), "_cacheSettingsFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__WBSOnDiskDataCache_setUp__block_invoke_2_13;
  v10[3] = &unk_1E54413C0;
  v10[4] = v8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "_internalQueueDispatchAsync:", v10);

}

uint64_t __27__WBSOnDiskDataCache_setUp__block_invoke_2_13(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDidFinishSettingUp");
}

- (void)savePendingChangesBeforeTearDown
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WBSOnDiskDataCache_savePendingChangesBeforeTearDown__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_barrier_sync(internalQueue, block);
  dispatch_sync((dispatch_queue_t)self->_diskAccessQueue, &__block_literal_global_26);
}

uint64_t __54__WBSOnDiskDataCache_savePendingChangesBeforeTearDown__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "completePendingWriteSynchronously");
}

- (void)reset
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __27__WBSOnDiskDataCache_reset__block_invoke;
  v2[3] = &unk_1E54425B0;
  v2[4] = self;
  -[WBSOnDiskDataCache _internalQueueDispatchAsync:](self, "_internalQueueDispatchAsync:", v2);
}

void __27__WBSOnDiskDataCache_reset__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  _QWORD v4[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__WBSOnDiskDataCache_reset__block_invoke_2;
  v4[3] = &unk_1E54425B0;
  v4[4] = v2;
  objc_msgSend(v2, "_dispatchDiskAccessBlock:", v4);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dataCacheDidReset:", *(_QWORD *)(a1 + 32));

}

void __27__WBSOnDiskDataCache_reset__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12[5];

  v12[4] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v12[0] = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, v12);
  v5 = v12[0];
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_2();
    }
    goto LABEL_9;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v11 = v5;
  v8 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v11);
  v9 = v11;

  if ((v8 & 1) == 0)
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_1();
    }
    v6 = v9;
LABEL_9:

    goto LABEL_10;
  }
  v6 = v9;
LABEL_10:

}

- (id)settingForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (self->_terminating)
  {
    v6 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__13;
    v15 = __Block_byref_object_dispose__13;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__WBSOnDiskDataCache_settingForKey___block_invoke;
    v8[3] = &unk_1E5444B28;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    -[WBSOnDiskDataCache _internalQueueDispatchSync:](self, "_internalQueueDispatchSync:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __36__WBSOnDiskDataCache_settingForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 48), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setSetting:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WBSOnDiskDataCache *v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (!self->_terminating)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__WBSOnDiskDataCache_setSetting_forKey___block_invoke;
    v8[3] = &unk_1E5441410;
    v9 = v6;
    v10 = self;
    v11 = v7;
    -[WBSOnDiskDataCache _internalQueueDispatchAsync:](self, "_internalQueueDispatchAsync:", v8);

  }
}

uint64_t __40__WBSOnDiskDataCache_setSetting_forKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;
  uint64_t v5;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 48);
  if (v2)
    result = objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, a1[6]);
  else
    result = objc_msgSend(v3, "removeObjectForKey:", a1[6]);
  v5 = a1[5];
  if (!*(_BYTE *)(v5 + 64))
    return objc_msgSend(*(id *)(v5 + 56), "scheduleWrite");
  return result;
}

- (id)requestEntryForKeyString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (self->_terminating)
  {
    v6 = 0;
  }
  else
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__13;
    v15 = __Block_byref_object_dispose__13;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke;
    v8[3] = &unk_1E5444B28;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    -[WBSOnDiskDataCache _internalQueueDispatchSync:](self, "_internalQueueDispatchSync:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return v6;
}

void __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)
    && (objc_msgSend(*(id *)(a1[4] + 32), "containsObject:", a1[5]) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1[4] + 32), "addObject:", a1[5]);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke_2;
    v6[3] = &unk_1E54413C0;
    v5 = (void *)a1[5];
    v7 = (id)a1[4];
    v8 = v5;
    objc_msgSend(v7, "_dispatchDiskAccessBlock:", v6);

  }
}

void __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_fileLocationForKeyString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke_3;
  v6[3] = &unk_1E5441410;
  v4 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v4;
  v5 = v3;
  objc_msgSend(v7, "_internalQueueDispatchAsync:", v6);

}

uint64_t __47__WBSOnDiskDataCache_requestEntryForKeyString___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didLoadEntry:forKeyString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)getEntryURLForKeyString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_terminating)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__WBSOnDiskDataCache_getEntryURLForKeyString_completionHandler___block_invoke;
    v9[3] = &unk_1E5441AD8;
    v9[4] = self;
    v10 = v6;
    v11 = v8;
    -[WBSOnDiskDataCache _dispatchDiskAccessBlock:](self, "_dispatchDiskAccessBlock:", v9);

  }
}

void __64__WBSOnDiskDataCache_getEntryURLForKeyString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_fileLocationForKeyString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
  {

    v2 = 0;
  }
  v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__WBSOnDiskDataCache_getEntryURLForKeyString_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5442F00;
  v10 = *(id *)(a1 + 48);
  v7 = v2;
  v9 = v7;
  objc_msgSend(v6, "_internalQueueDispatchAsync:", v8);

}

uint64_t __64__WBSOnDiskDataCache_getEntryURLForKeyString_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)setEntry:(id)a3 forKeyString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_terminating)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke;
    v11[3] = &unk_1E5444B50;
    v11[4] = self;
    v12 = v9;
    v14 = v10;
    v13 = v8;
    -[WBSOnDiskDataCache _dispatchDiskAccessBlock:](self, "_dispatchDiskAccessBlock:", v11);

  }
}

void __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  id *v9;
  id *v10;
  id *v11;
  NSObject *v12;
  id *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "_fileLocationForKeyString:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  v5 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v35);
  v6 = v35;

  if ((v5 & 1) == 0)
  {
    v12 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_1();
    }

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_17;
    v30[3] = &unk_1E5441B28;
    v13 = (id *)v30;
    v14 = a1[5];
    v31 = a1[4];
    v15 = v31;
    v32 = v14;
    v33 = v6;
    v34 = a1[7];
    objc_msgSend(v15, "_internalQueueDispatchAsync:", v30);
    goto LABEL_12;
  }
  v7 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v19 = a1[6];
    v20 = objc_msgSend(v19, "length");
    *(_DWORD *)buf = 134218498;
    v37 = v19;
    v38 = 2048;
    v39 = v20;
    v40 = 2112;
    v41 = v2;
    _os_log_debug_impl(&dword_1A840B000, v7, OS_LOG_TYPE_DEBUG, "Saving entry %p <entry data length = %zu> to location %@", buf, 0x20u);
  }

  if ((objc_msgSend(a1[6], "writeToURL:atomically:", v2, 1) & 1) == 0)
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_cold_1();
    }

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_18;
    v25[3] = &unk_1E5441B28;
    v13 = (id *)v25;
    v17 = a1[5];
    v26 = a1[4];
    v18 = v26;
    v27 = v17;
    v28 = v6;
    v29 = a1[7];
    objc_msgSend(v18, "_internalQueueDispatchAsync:", v25);
LABEL_12:
    v9 = v13 + 5;
    v10 = v13 + 6;
    v11 = v13 + 7;
    goto LABEL_13;
  }
  v8 = a1[4];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_2;
  v21[3] = &unk_1E5441B28;
  v21[4] = v8;
  v22 = a1[6];
  v23 = a1[5];
  v24 = a1[7];
  objc_msgSend(v8, "_internalQueueDispatchAsync:", v21);
  v9 = &v22;
  v10 = &v23;
  v11 = &v24;
LABEL_13:

}

uint64_t __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_17(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_didFailToLoadEntryForKeyString:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_18(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_didFailToLoadEntryForKeyString:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 48));
  return result;
}

uint64_t __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_didLoadEntry:forKeyString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)_didLoadEntry:(id)a3 forKeyString:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (v9)
  {
    -[NSCache setObject:forKey:](self->_entriesForKeyStringsCache, "setObject:forKey:", v9, v6);
    -[NSMutableSet removeObject:](self->_missingEntryKeyStrings, "removeObject:", v7);
  }
  else
  {
    -[NSMutableSet addObject:](self->_missingEntryKeyStrings, "addObject:", v6);
  }
  -[NSMutableSet removeObject:](self->_pendingKeyStringRequests, "removeObject:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCacheDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dataCache:didLoadEntry:forKeyString:", self, v9, v7);

}

- (void)_didFailToLoadEntryForKeyString:(id)a3 error:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMutableSet addObject:](self->_missingEntryKeyStrings, "addObject:", v8);
  -[NSMutableSet removeObject:](self->_pendingKeyStringRequests, "removeObject:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataCacheDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dataCache:didFailToLoadEntryForKeyString:error:", self, v8, v6);

}

- (void)removeEntriesForKeyStrings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  WBSOnDiskDataCache *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (!self->_terminating)
  {
    v8 = (void *)objc_msgSend(v6, "copy");

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__WBSOnDiskDataCache_removeEntriesForKeyStrings_completionHandler___block_invoke;
    v9[3] = &unk_1E5441AD8;
    v6 = v8;
    v10 = v6;
    v11 = self;
    v12 = v7;
    -[WBSOnDiskDataCache _dispatchDiskAccessBlock:](self, "_dispatchDiskAccessBlock:", v9);

  }
}

void __67__WBSOnDiskDataCache_removeEntriesForKeyStrings_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v18;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(v2);
        v6 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_fileLocationForKeyString:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_removeFileAtURL:error:", v8, 0);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v3);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__WBSOnDiskDataCache_removeEntriesForKeyStrings_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5441AD8;
  v9 = *(void **)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(void **)(a1 + 48);
  v14 = v10;
  v15 = v11;
  v16 = v12;
  objc_msgSend(v9, "_internalQueueDispatchAsync:", v13);

}

uint64_t __67__WBSOnDiskDataCache_removeEntriesForKeyStrings_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++), (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __80__WBSOnDiskDataCache_removeEntriesForKeyStringsNotIncludedIn_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "safari_md5Hash");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)entryStateForKeyString:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__WBSOnDiskDataCache_entryStateForKeyString___block_invoke;
  v8[3] = &unk_1E5444B28;
  v9 = v4;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  -[WBSOnDiskDataCache _internalQueueDispatchSync:](self, "_internalQueueDispatchSync:", v8);
  v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __45__WBSOnDiskDataCache_entryStateForKeyString___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_internalEntryStateForKeyString:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (int64_t)_internalEntryStateForKeyString:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;

  v4 = a3;
  if ((-[NSMutableSet containsObject:](self->_missingEntryKeyStrings, "containsObject:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[NSCache objectForKey:](self->_entriesForKeyStringsCache, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 2 * (v6 != 0);

  }
  return v5;
}

- (id)_fileLocationForKeyString:(id)a3
{
  NSURL *cacheDirectoryURL;
  void *v4;
  void *v5;

  cacheDirectoryURL = self->_cacheDirectoryURL;
  objc_msgSend(a3, "safari_md5Hash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](cacheDirectoryURL, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (WBSDataCacheDelegate)dataCacheDelegate
{
  return (WBSDataCacheDelegate *)objc_loadWeakRetained((id *)&self->_dataCacheDelegate);
}

- (BOOL)isInMemoryCacheEnabled
{
  return self->_isInMemoryCacheEnabled;
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_destroyWeak((id *)&self->_dataCacheDelegate);
  objc_storeStrong((id *)&self->_cacheSettingsWriter, 0);
  objc_storeStrong((id *)&self->_cacheSettings, 0);
  objc_storeStrong((id *)&self->_missingEntryKeyStrings, 0);
  objc_storeStrong((id *)&self->_pendingKeyStringRequests, 0);
  objc_storeStrong((id *)&self->_entriesForKeyStringsCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_diskAccessQueue, 0);
}

void __27__WBSOnDiskDataCache_setUp__block_invoke_2_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138740227;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Could not generate plist data with cache settings: %{sensitive}@, error: %{public}@", buf, 0x16u);

  OUTLINED_FUNCTION_1_0();
}

void __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Error \"%{public}@\" trying to create entry cache folder.", v5);

  OUTLINED_FUNCTION_1_0();
}

void __27__WBSOnDiskDataCache_reset__block_invoke_2_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Error \"%{public}@\" trying to delete entry cache folder.", v5);

  OUTLINED_FUNCTION_1_0();
}

void __62__WBSOnDiskDataCache_setEntry_forKeyString_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0(&dword_1A840B000, v3, v4, "Error \"%{public}@\" trying to write entry cache folder.", v5);

  OUTLINED_FUNCTION_1_0();
}

@end
