@implementation WBSCloudHistory

- (WBSCloudHistory)initWithDatabase:(id)a3 configuration:(id)a4 databaseStore:(id)a5 completionBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WBSCloudHistory *v15;
  id v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *cloudHistoryQueue;
  id v19;
  const char *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *waitUntilMetadataHasLoadedQueue;
  objc_class *v24;
  objc_class *v25;
  uint64_t v26;
  NSMutableArray *storeDeterminationCompletionBlocks;
  id v28;
  uint64_t v29;
  WBSCloudKitContainerManateeObserving *containerManateeObserver;
  uint64_t v31;
  WBSCloudHistoryPushAgentProxy *v32;
  WBSCloudHistoryPushAgentProxy *pushAgent;
  WBSCloudHistory *v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *syncCircleSizeRetrievalCompletionHandlersByOperation;
  void *v37;
  void *v38;
  WBSCloudHistory *v39;
  _QWORD v41[4];
  WBSCloudHistory *v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id location;
  objc_super v47;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v47.receiver = self;
  v47.super_class = (Class)WBSCloudHistory;
  v15 = -[WBSCloudHistory init](&v47, sel_init);
  if (v15)
  {
    objc_initWeak(&location, v15);
    objc_storeStrong((id *)&v15->_database, a3);
    objc_storeWeak((id *)&v15->_databaseStore, v13);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSCloudHistory.%@.%p.internalQueue"), objc_opt_class(), v15);
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
    cloudHistoryQueue = v15->_cloudHistoryQueue;
    v15->_cloudHistoryQueue = (OS_dispatch_queue *)v17;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.SafariShared.WBSCloudHistory.%@.%p.waitForMetadata"), objc_opt_class(), v15);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend(v19, "UTF8String");
    dispatch_queue_attr_make_initially_inactive(0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create(v20, v21);
    waitUntilMetadataHasLoadedQueue = v15->_waitUntilMetadataHasLoadedQueue;
    v15->_waitUntilMetadataHasLoadedQueue = (OS_dispatch_queue *)v22;

    objc_storeStrong((id *)&v15->_configuration, a4);
    v24 = (objc_class *)objc_opt_class();
    v25 = (objc_class *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    storeDeterminationCompletionBlocks = v15->_storeDeterminationCompletionBlocks;
    v15->_storeDeterminationCompletionBlocks = (NSMutableArray *)v26;

    v28 = objc_alloc_init(v24);
    v29 = objc_msgSend([v25 alloc], "initWithContainerIdentifier:appleAccountInformationProvider:", CFSTR("com.apple.SafariShared.History"), v28);
    containerManateeObserver = v15->_containerManateeObserver;
    v15->_containerManateeObserver = (WBSCloudKitContainerManateeObserving *)v29;

    v31 = MEMORY[0x1E0C809B0];
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke;
    v44[3] = &unk_1E4B2AA88;
    objc_copyWeak(&v45, &location);
    -[WBSCloudKitContainerManateeObserving setStateChangeObserver:](v15->_containerManateeObserver, "setStateChangeObserver:", v44);
    v32 = objc_alloc_init(WBSCloudHistoryPushAgentProxy);
    pushAgent = v15->_pushAgent;
    v15->_pushAgent = v32;

    -[WBSCloudHistory _loadMetadataAsynchronously](v15, "_loadMetadataAsynchronously");
    v41[0] = v31;
    v41[1] = 3221225472;
    v41[2] = __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_2_61;
    v41[3] = &unk_1E4B2A250;
    v34 = v15;
    v42 = v34;
    v43 = v14;
    -[WBSCloudHistory _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:](v34, "_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:", v41);
    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    syncCircleSizeRetrievalCompletionHandlersByOperation = v34->_syncCircleSizeRetrievalCompletionHandlersByOperation;
    v34->_syncCircleSizeRetrievalCompletionHandlersByOperation = v35;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v34, sel__cloudHistoryConfigurationChanged_, CFSTR("WBSCloudHistoryConfigurationChangedNotification"), v15->_configuration);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v34, sel__pushNotificationReceived_, CFSTR("com.apple.SafariShared.CloudHistory.PushReceived"), 0);

    v39 = v34;
    objc_destroyWeak(&v45);

    objc_destroyWeak(&location);
  }

  return v15;
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  _QWORD *v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_2;
    v6[3] = &unk_1E4B2AA60;
    v8 = a2;
    v7 = WeakRetained;
    dispatch_async(v5, v6);

  }
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v10 = 134217984;
    v11 = v3;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "Received PCS change notification with state %ld", (uint8_t *)&v10, 0xCu);
  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
  v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == v4)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 40);
      v10 = 134217984;
      v11 = v8;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring PCS state change notification because it is the same as the current state %ld", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = 134217984;
      v11 = v9;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_DEFAULT, "Determining cloud history store in response to PCS change notification with state %ld", (uint8_t *)&v10, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_determineCloudHistoryStoreWithCompletion:", &__block_literal_global_14);
  }
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_2_61(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v2 = objc_alloc(MEMORY[0x1E0D89BB8]);
  objc_msgSend(*(id *)(a1 + 32), "_currentSaveChangesThrottlerPolicyString");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "initWithPolicyString:");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 128);
  *(_QWORD *)(v4 + 128) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setDataStore:");
  v6 = objc_alloc(MEMORY[0x1E0D89BB8]);
  objc_msgSend(*(id *)(a1 + 32), "_currentFetchChangesThrottlerPolicyString");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "initWithPolicyString:");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 136);
  *(_QWORD *)(v8 + 136) = v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setDataStore:");
  v10 = objc_alloc(MEMORY[0x1E0D89BB8]);
  objc_msgSend(*(id *)(a1 + 32), "_currentSyncCircleSizeRetrievalThrottlerPolicyString");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "initWithPolicyString:");
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 144);
  *(_QWORD *)(v12 + 144) = v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setDataStore:");
  objc_msgSend(*(id *)(a1 + 32), "_replayPersistedLongLivedSaveOperationIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud");
  objc_msgSend(*(id *)(a1 + 32), "_initializePushNotificationSupport");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("WBSCloudHistoryLongLivedSaveOperation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), v15);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setMetadataValue:forKey:completionHandler:", v15, CFSTR("long_lived_save_operation"), &__block_literal_global_67);
    objc_msgSend(v19, "removeObjectForKey:", CFSTR("WBSCloudHistoryLongLivedSaveOperation"));

  }
  if (*(_QWORD *)(a1 + 40))
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 40));

}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_3_cold_1();
    }

  }
}

- (void)_determineCloudHistoryStoreWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *storeDeterminationCompletionBlocks;
  void *v7;
  WBSCloudKitContainerManateeObserving *containerManateeObserver;
  _QWORD v9[5];

  v4 = a3;
  v5 = v4;
  if (self->_store && !self->_manateeStateNeedsUpdate)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    storeDeterminationCompletionBlocks = self->_storeDeterminationCompletionBlocks;
    v7 = (void *)MEMORY[0x1A8599ED0](v4);
    -[NSMutableArray addObject:](storeDeterminationCompletionBlocks, "addObject:", v7);

    if (!self->_determiningStoreType)
    {
      self->_determiningStoreType = 1;
      containerManateeObserver = self->_containerManateeObserver;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke;
      v9[3] = &unk_1E4B2AAF0;
      v9[4] = self;
      -[WBSCloudKitContainerManateeObserving determineAccountStateWithCompletion:](containerManateeObserver, "determineAccountStateWithCompletion:", v9);
    }
  }

}

void __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a2;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_DEFAULT, "Determined PCS state to be %ld", buf, 0xCu);
  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke_75;
  v7[3] = &unk_1E4B2AA60;
  v7[4] = v5;
  v7[5] = a2;
  dispatch_async(v6, v7);
}

uint64_t __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke_75(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke_2;
  v4[3] = &unk_1E4B2A2C8;
  v4[4] = v2;
  return objc_msgSend(v2, "_transitionCloudHistoryStoreToManateeState:completion:", v1, v4);
}

uint64_t __61__WBSCloudHistory__determineCloudHistoryStoreWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 242) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 0;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 224);
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
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "removeAllObjects", (_QWORD)v7);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)WBSCloudHistory;
  -[WBSCloudHistory dealloc](&v5, sel_dealloc);
}

- (BOOL)isCloudHistoryEnabled
{
  return self->_cloudHistoryEnabled;
}

- (void)setCloudHistoryEnabled:(BOOL)a3
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_cloudHistoryEnabled != a3)
  {
    self->_cloudHistoryEnabled = a3;
    v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_cloudHistoryEnabled)
        v5 = CFSTR("enabled");
      else
        v5 = CFSTR("disabled");
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "iCloud History is now %{public}@.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)_shouldSyncProfiles
{
  void *v3;
  void *v4;
  WBSCloudHistoryDataStore *store;
  char v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_numberForKey:", CFSTR("WBSEnableSafariProfileCloudHistorySyncing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  store = self->_store;
  if (v4)
  {
    if (!-[WBSCloudHistoryDataStore useManateeContainer](store, "useManateeContainer"))
    {
      v7 = 0;
      goto LABEL_7;
    }
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v6 = -[WBSCloudHistoryDataStore useManateeContainer](store, "useManateeContainer");
  }
  v7 = v6;
LABEL_7:

  return v7;
}

- (void)saveChangesToCloudHistoryStore
{
  -[WBSCloudHistory saveChangesBypassingThrottler:completionHandler:](self, "saveChangesBypassingThrottler:completionHandler:", 0, 0);
}

- (void)saveChangesToCloudHistoryStoreBypassingThrottler
{
  -[WBSCloudHistory saveChangesBypassingThrottler:completionHandler:](self, "saveChangesBypassingThrottler:completionHandler:", 1, 0);
}

- (void)saveChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  WBSCleanupHandler *v12;
  uint64_t v13;
  WBSCleanupHandler *v14;
  uint64_t v15;
  NSObject *cloudHistoryQueue;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  WBSCleanupHandler *v25;
  id v26;
  __int128 *p_buf;
  char v28;
  _QWORD v29[5];
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  id *(*v33)(uint64_t);
  uint64_t v34;
  id *v35;
  uint64_t v36;

  v4 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("WBSCloudHistoryIgnoreThrottlingPolicy"));

  v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  v10 = v8 | v4;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = CFSTR("respecting the throttler");
    if (v10)
      v11 = CFSTR("bypassing the throttler");
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Saving changes to iCloud History %{public}@", (uint8_t *)&buf, 0xCu);
  }
  v12 = [WBSCleanupHandler alloc];
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke;
  v29[3] = &unk_1E4B2A2C8;
  v29[4] = self;
  v14 = -[WBSCleanupHandler initWithBlock:](v12, "initWithBlock:", v29);
  if (-[WBSCloudHistory isCloudHistoryEnabled](self, "isCloudHistoryEnabled"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v31 = 0x3812000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    v34 = 0;
    v15 = operator new();
    MEMORY[0x1A8599720](v15, CFSTR("com.apple.SafariShared.WBSCloudHistoryStore.saveChanges"));
    v35 = (id *)v15;
    cloudHistoryQueue = self->_cloudHistoryQueue;
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_91;
    v24[3] = &unk_1E4B2AC80;
    v24[4] = self;
    v26 = v6;
    p_buf = &buf;
    v25 = v14;
    v28 = v10;
    dispatch_async(cloudHistoryQueue, v24);

    _Block_object_dispose(&buf, 8);
    v17 = v35;
    v35 = 0;
    if (v17)
    {
      SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v17);
      MEMORY[0x1A85998AC](v18, 0x1080C40D2F62047, v19, v20, v21);
    }
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A3D90000, v22, OS_LOG_TYPE_INFO, "iCloud History is not enabled. Nothing to do when saving changes!", (uint8_t *)&buf, 2u);
    }
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCloudHistory"), 1, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v23);

    }
  }

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[5];

  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2;
  block[3] = &unk_1E4B2A2C8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_3;
  v5[3] = &unk_1E4B2A2C8;
  v5[4] = v3;
  dispatch_async(v4, v5);
}

uint64_t __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postSaveChangesAttemptCompletedNotificationWithAllPendingDataSaved:", 0);
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 14, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_callAndResetSaveCompletionHandlerWithError:");

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_91(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  id **v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_registerSaveCompletionHandler:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "isValid"))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v3 = "Server has already asked us to back off. Nothing to do when saving changes!";
LABEL_7:
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, v3, buf, 2u);
    return;
  }
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v4 + 80);
  v5 = (id **)(v4 + 80);
  if (v6)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      return;
    *(_WORD *)buf = 0;
    v3 = "A save operation is already in progress. Nothing to do!";
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(id **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = 0;
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](v5, v8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_92;
  v10[3] = &unk_1E4B2AC58;
  v9 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = v9;
  v13 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v11, "_determineCloudHistoryStoreWithCompletion:", v10);

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_92(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  char v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_93;
  v3[3] = &unk_1E4B2AB18;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v4, "_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:", v3);

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_93(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  char v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t *v25;
  char v26;
  char v27;
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  void *v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  char v37;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_replayPersistedLongLivedSaveOperationIfNecessary");
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 184);
  if (v3 == 1)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_INFO, "Only one device in the iCloud History sync circle", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v3)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "More than one device in the iCloud History sync circle", buf, 2u);
    }
    v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_93_cold_1(v2, v11, v12, v13, v14, v15, v16, v17);
LABEL_12:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "syncWindow");
    v19 = v18;
    v20 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "shouldUseLongLivedOperationsToSaveRecords");
    *(_QWORD *)buf = 0;
    v29 = buf;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__96;
    v32 = __Block_byref_object_dispose__97;
    v33 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_98;
    v22[3] = &unk_1E4B2AC30;
    v26 = v20;
    v21 = *(void **)(a1 + 40);
    v23 = *(id *)(a1 + 32);
    v25 = buf;
    v27 = *(_BYTE *)(a1 + 48);
    v24 = v21;
    objc_msgSend(v23, "getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow:completion:", v22, v19);

    _Block_object_dispose(buf, 8);
    v8 = v33;
    goto LABEL_13;
  }
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Unknown number of devices in iCloud History sync circle. Will determine the number of devices and then retry the save.", buf, 2u);
  }
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_94;
  v34[3] = &unk_1E4B2AB18;
  v5 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 32);
  v35 = v6;
  v36 = v7;
  v37 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v5, "_determineNumberOfDevicesInSyncCircleForOperation:completionHandler:", CFSTR("SaveChanges"), v34);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)v2 + 80), 0);
  v8 = v35;
LABEL_13:

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_94(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD block[4];
  id v5;
  uint64_t v6;
  char v7;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_95;
  block[3] = &unk_1E4B2AB18;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  v7 = *(_BYTE *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_95(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return objc_msgSend(*(id *)(a1 + 40), "saveChangesBypassingThrottler:completionHandler:", *(unsigned __int8 *)(a1 + 48), 0);
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_98(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  __int16 v28;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v15 = *(NSObject **)(v13 + 8);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_99;
  v21[3] = &unk_1E4B2AC08;
  v28 = *(_WORD *)(a1 + 56);
  v21[1] = 3221225472;
  v16 = *(_QWORD *)(a1 + 48);
  v21[4] = v13;
  v22 = v11;
  v23 = v9;
  v24 = v10;
  v26 = v12;
  v27 = v16;
  v25 = v14;
  v17 = v12;
  v18 = v10;
  v19 = v9;
  v20 = v11;
  dispatch_async(v15, v21);

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_99(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  char v18;
  uint8_t buf[16];
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  char v23;

  v20[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_3_100;
  v20[3] = &unk_1E4B2AB40;
  v23 = *(_BYTE *)(a1 + 88);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 80);
  v20[4] = v2;
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v21 = v3;
  v5 = (void *)MEMORY[0x1A8599ED0](v20);
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "Transmitted Internet Records", buf, 2u);
  }

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(unsigned __int8 *)(a1 + 89);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_103;
  v14[3] = &unk_1E4B2ABE0;
  v14[4] = v8;
  v12 = *(id *)(a1 + 72);
  v18 = *(_BYTE *)(a1 + 88);
  v13 = *(_QWORD *)(a1 + 80);
  v16 = v12;
  v17 = v13;
  v15 = *(id *)(a1 + 64);
  objc_msgSend(v8, "_saveVisits:tombstones:toCloudHistoryBypassingThrottler:longLivedOperationPersistenceCompletion:withCallback:", v9, v10, v11, v5, v14);

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_3_100(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      objc_msgSend(*(id *)(a1 + 32), "_persistLongLivedSaveOperationDictionaryWithOperationID:databaseGenerations:", v4, *(_QWORD *)(a1 + 40));
      v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = 138543362;
        v7 = v4;
        _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Long-lived operation was persisted. Operation ID %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
  }

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_103(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void (*v21)(uint64_t, BOOL, _QWORD *);
  id v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (!a3 && !v7)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_6:
      v8 = 0;
      goto LABEL_15;
    }
    *(_WORD *)buf = 0;
    v10 = "No new data to save to iCloud History.";
    v11 = v9;
    v12 = 2;
LABEL_5:
    _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
    goto LABEL_6;
  }
  if (a3 == 1)
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "dateOfNextPermittedOperationWithPriority:", a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v15);
      *(_DWORD *)buf = 134217984;
      v31 = v16;
      _os_log_impl(&dword_1A3D90000, v13, OS_LOG_TYPE_INFO, "Save was denied by the throttler. A save will be permitted in %f seconds.", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCloudHistory"), 2, 0);
    v17 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v17;
  }
  else
  {
    if (!v7)
    {
      v23 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        goto LABEL_6;
      *(_DWORD *)buf = 134217984;
      v31 = a3;
      v10 = "iCloud History save completed with result %ld";
      v11 = v23;
      v12 = 12;
      goto LABEL_5;
    }
    v18 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_103_cold_1();
    }

  }
LABEL_15:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "operationWithPriority:didCompleteWithResult:", a2, a3);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_105;
  v24[3] = &unk_1E4B2ABB8;
  v29 = *(_BYTE *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 48);
  v27 = *(_QWORD *)(a1 + 56);
  v28 = a3;
  v20 = *(void **)(a1 + 40);
  v24[4] = *(_QWORD *)(a1 + 32);
  v25 = v8;
  v26 = v20;
  v21 = *(void (**)(uint64_t, BOOL, _QWORD *))(v19 + 16);
  v22 = v8;
  v21(v19, (a3 & 0xFFFFFFFFFFFFFFFDLL) == 0, v24);

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_105(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_106;
  v6[3] = &unk_1E4B2AB90;
  v11 = *(_BYTE *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 64);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v6[4] = v2;
  v6[1] = 3221225472;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);

}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_106(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 72))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_removePersistedLongLivedSaveOperationDictionary");
      v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543362;
        v20 = v3;
        _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Persisted long-lived operation was removed because operation finished. Operation ID %{public}@", buf, 0xCu);
      }
    }
  }
  v4 = 1;
  switch(*(_QWORD *)(a1 + 64))
  {
    case 0:
    case 2:
      goto LABEL_8;
    case 6:
      objc_msgSend(*(id *)(a1 + 32), "_callAndResetSaveCompletionHandlerWithError:", *(_QWORD *)(a1 + 40));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_107;
      block[3] = &unk_1E4B2A2C8;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      break;
    case 7:
      v8 = *(void **)(a1 + 32);
      v7 = a1 + 32;
      objc_msgSend(v8, "_callAndResetSaveCompletionHandlerWithError:", *(_QWORD *)(v7 + 8));
      objc_msgSend(*(id *)v7, "_handleManateeErrorIfNeeded:", *(_QWORD *)(v7 + 8));
      break;
    default:
      v4 = 0;
LABEL_8:
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_108;
      v12 = &unk_1E4B2AB68;
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 64);
      v13 = v5;
      v14 = v6;
      v17 = v4;
      v15 = *(id *)(a1 + 48);
      dispatch_async(MEMORY[0x1E0C80D38], &v9);
      if (*(_QWORD *)(a1 + 64) != 5)
        objc_msgSend(*(id *)(a1 + 32), "_callAndResetSaveCompletionHandlerWithError:", *(_QWORD *)(a1 + 40), v9, v10, v11, v12, v13, v14);

      break;
  }
}

uint64_t __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_107(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetForAccountChangeWithCompletionHandler:", 0);
}

uint64_t __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_108(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(a1 + 56) == 5)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 1;
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "_backoffTimeIntervalFromError:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "_backOffWithInterval:");
  }
  if (*(_BYTE *)(a1 + 64))
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 264) = 0;
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  return objc_msgSend(*(id *)(a1 + 32), "_postSaveChangesAttemptCompletedNotificationWithAllPendingDataSaved:", *(unsigned __int8 *)(a1 + 64));
}

- (void)_registerSaveCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id saveCompletionHandler;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A8599ED0](self->_saveCompletionHandler);
    v6 = v5;
    if (v5)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __50__WBSCloudHistory__registerSaveCompletionHandler___block_invoke;
      v11[3] = &unk_1E4B2ACA8;
      v12 = v5;
      v13 = v4;
      v7 = (void *)MEMORY[0x1A8599ED0](v11);
      saveCompletionHandler = self->_saveCompletionHandler;
      self->_saveCompletionHandler = v7;

      v9 = v12;
    }
    else
    {
      v10 = (void *)MEMORY[0x1A8599ED0](v4);
      v9 = self->_saveCompletionHandler;
      self->_saveCompletionHandler = v10;
    }

  }
}

void __50__WBSCloudHistory__registerSaveCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_callAndResetSaveCompletionHandlerWithError:(id)a3
{
  id v4;
  void (**saveCompletionHandler)(void);
  id v6;
  id v7;

  v4 = a3;
  saveCompletionHandler = (void (**)(void))self->_saveCompletionHandler;
  if (saveCompletionHandler)
  {
    v7 = v4;
    saveCompletionHandler[2]();
    v6 = self->_saveCompletionHandler;
    self->_saveCompletionHandler = 0;

    v4 = v7;
  }

}

- (id)_convertProfileLocalIdentifierToServerIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)*MEMORY[0x1E0D89E20];
  if (v5 && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_namedProfileLocalIdentifiersToServerIdentifiersMap, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)_convertProfileServerIdentifierToLocalIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)*MEMORY[0x1E0D89E20];
  if (v5 && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]))
  {
    -[NSDictionary objectForKeyedSubscript:](self->_namedProfileServerIdentifiersToLocalIdentifiersMap, "objectForKeyedSubscript:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (void)_enumerateDatabasesWithProfileLocalIdentifiers:(id)a3 createIfNeeded:(BOOL)a4 enumerationBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  OS_dispatch_queue *cloudHistoryQueue;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BOOL v20;

  v10 = a5;
  v11 = a6;
  v12 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseStore);
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke;
  v17[3] = &unk_1E4B2ACF8;
  v20 = a4;
  v18 = WeakRetained;
  v19 = v10;
  v15 = v10;
  v16 = WeakRetained;
  objc_msgSend(v12, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", cloudHistoryQueue, v17, v11);

}

void __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a2;
  v7 = a4;
  v8 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke_2;
  v12[3] = &unk_1E4B2ACD0;
  v14 = v7;
  v9 = *(void **)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v13 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "openDatabaseWithID:createIfNeeded:completionHandler:", v10, v8, v12);

}

void __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow:(double)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  WBSCloudHistory *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", *MEMORY[0x1E0D89E20]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  if (-[WBSCloudHistory _shouldSyncProfiles](self, "_shouldSyncProfiles"))
  {
    -[NSDictionary allKeys](self->_namedProfileLocalIdentifiersToServerIdentifiersMap, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke;
  v27[3] = &unk_1E4B2AD48;
  v32 = a3;
  v27[4] = self;
  v28 = v9;
  v29 = v10;
  v30 = v18;
  v31 = v11;
  v20[0] = v12;
  v20[1] = 3221225472;
  v20[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_3;
  v20[3] = &unk_1E4B2AE10;
  v13 = v6;
  v26 = v13;
  v14 = v28;
  v21 = v14;
  v15 = v29;
  v22 = v15;
  v16 = v30;
  v23 = v16;
  v24 = v31;
  v25 = self;
  v17 = v31;
  -[WBSCloudHistory _enumerateDatabasesWithProfileLocalIdentifiers:createIfNeeded:enumerationBlock:completionBlock:](self, "_enumerateDatabasesWithProfileLocalIdentifiers:createIfNeeded:enumerationBlock:completionBlock:", v19, 0, v27, v20);

}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(double *)(a1 + 72);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_2;
  v15[3] = &unk_1E4B2AD20;
  v11 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v7;
  v17 = v11;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 64);
  v21 = v8;
  v22 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v13, "visitsAndTombstonesNeedingSyncWithVisitSyncWindow:completionHandler:", v15, v10);

}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  if (objc_msgSend(v12, "count") || objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_convertProfileLocalIdentifierToServerIdentifier:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v8);

    objc_msgSend(v7, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v10, v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v11, v8);

    objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 80), v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();

}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_4;
  v8[3] = &unk_1E4B2ADE8;
  v5 = *(_QWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 64);
  v10 = v6;
  v11 = v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v3, v4, v5, v8);

}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_4(uint64_t a1, char a2, void *a3)
{
  id v5;
  dispatch_group_t v6;
  void *v7;
  NSObject *v8;
  dispatch_block_t block;
  _QWORD v10[4];
  id v11;
  dispatch_group_t v12;

  v5 = a3;
  block = v5;
  if ((a2 & 1) != 0)
  {
    v6 = dispatch_group_create();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_5;
    v10[3] = &unk_1E4B2ADC0;
    v7 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v12 = v6;
    v8 = v6;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);
    dispatch_group_notify(v8, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 48) + 8), block);

  }
  else
  {
    (*((void (**)(void))v5 + 2))();
  }

}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6;
  v10[3] = &unk_1E4B2AD98;
  v9 = v6;
  v11 = v9;
  v13 = v8;
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v9, "updateDatabaseAfterSuccessfulSyncWithGeneration:completionHandler:", v8, v10);

}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6_cold_1();
    }

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_115;
  v7[3] = &unk_1E4B2AD70;
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v5, "convertTombstoneWithGenerationToSecureFormat:lastSyncedGeneration:completionHandler:", v6, v6, v7);

}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_115_cold_1();
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (void)_saveVisits:(id)a3 tombstones:(id)a4 toCloudHistoryBypassingThrottler:(BOOL)a5 longLivedOperationPersistenceCompletion:(id)a6 withCallback:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  int64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  WBSCloudHistory *v23;
  id v24;
  id v25;
  int64_t v26;
  _QWORD v27[5];
  id v28;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = -[WBSCloudHistory _priorityForSaveWithVisits:tombstones:bypassingThrottler:](self, "_priorityForSaveWithVisits:tombstones:bypassingThrottler:", v12, v13, v9);
  if (!objc_msgSend(v12, "count") && !objc_msgSend(v13, "count"))
  {
    (*((void (**)(id, int64_t, _QWORD, _QWORD))v15 + 2))(v15, v16, 0, 0);
    goto LABEL_7;
  }
  if ((-[WBSCloudKitThrottler permitsOperationWithPriority:](self->_saveChangesThrottler, "permitsOperationWithPriority:", v16) & 1) == 0)
  {
    (*((void (**)(id, int64_t, uint64_t, _QWORD))v15 + 2))(v15, v16, 1, 0);
LABEL_7:
    std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_saveOperationSuddenTerminationDisabler, 0);
    goto LABEL_8;
  }
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke;
  v27[3] = &unk_1E4B2AE38;
  v27[4] = self;
  v28 = v14;
  v18 = (void *)MEMORY[0x1A8599ED0](v27);
  v20[0] = v17;
  v20[1] = 3221225472;
  v20[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_3;
  v20[3] = &unk_1E4B2AEB0;
  v21 = v12;
  v23 = self;
  v24 = v18;
  v22 = v13;
  v25 = v15;
  v26 = v16;
  v19 = v18;
  -[WBSCloudHistory _determineCloudHistoryStoreWithCompletion:](self, "_determineCloudHistoryStoreWithCompletion:", v20);

LABEL_8:
}

void __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_2;
    v6[3] = &unk_1E4B29E18;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_4;
  v9[3] = &unk_1E4B2AE88;
  v6 = *(_QWORD *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  v10 = v7;
  v11 = v8;
  objc_msgSend(a2, "saveCloudHistoryVisits:tombstones:longLivedOperationPersistenceCompletion:completion:", v4, v5, v6, v9);

}

void __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_5;
  v9[3] = &unk_1E4B2AE60;
  v6 = v4;
  v7 = a1[6];
  v11 = v6;
  v12 = v7;
  v9[4] = a1[4];
  v10 = v3;
  v8 = v3;
  dispatch_async(v5, v9);

}

id *__128__WBSCloudHistory__saveVisits_tombstones_toCloudHistoryBypassingThrottler_longLivedOperationPersistenceCompletion_withCallback___block_invoke_5(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "_resultFromError:", *(_QWORD *)(a1 + 40)), *(_QWORD *)(a1 + 40));
  return std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)(a1 + 32) + 80), 0);
}

- (void)_postSaveChangesAttemptCompletedNotificationWithAllPendingDataSaved:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("WBSCloudHistoryAllPendingDataSavedToCloudKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("WBSCloudHistorySaveChangesAttemptDidCompleteNotification"), self, v5);

}

- (id)dateOfNextPermittedSaveChangesAttempt
{
  return (id)-[WBSCloudKitThrottler dateOfNextPermittedOperationWithPriority:](self->_saveChangesThrottler, "dateOfNextPermittedOperationWithPriority:", -[WBSCloudHistory _estimatedPriorityForPotentialSaveAttempt](self, "_estimatedPriorityForPotentialSaveAttempt"));
}

- (void)fetchAndMergeChanges
{
  -[WBSCloudHistory fetchAndMergeChangesBypassingThrottler:completionHandler:](self, "fetchAndMergeChangesBypassingThrottler:completionHandler:", 0, 0);
}

- (void)fetchAndMergeChangesBypassingThrottler
{
  -[WBSCloudHistory fetchAndMergeChangesBypassingThrottler:completionHandler:](self, "fetchAndMergeChangesBypassingThrottler:completionHandler:", 1, 0);
}

- (void)fetchAndMergeChangesBypassingThrottler:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *cloudHistoryQueue;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  __int128 *p_buf;
  char v24;
  __int128 buf;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  id *(*v28)(uint64_t);
  uint64_t v29;
  id *v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("WBSCloudHistoryIgnoreThrottlingPolicy"));

  if (-[WBSCloudHistory isCloudHistoryEnabled](self, "isCloudHistoryEnabled"))
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    v10 = v8 | v4;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("respecting the throttler");
      if (v10)
        v11 = CFSTR("bypassing the throttler");
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_DEFAULT, "Fetching changes from iCloud History %{public}@", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v26 = 0x3812000000;
    v27 = __Block_byref_object_copy__2;
    v28 = __Block_byref_object_dispose__2;
    v29 = 0;
    v12 = operator new();
    MEMORY[0x1A8599720](v12, CFSTR("com.apple.SafariShared.WBSCloudHistory.fetchChanges"));
    v30 = (id *)v12;
    cloudHistoryQueue = self->_cloudHistoryQueue;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke;
    v21[3] = &unk_1E4B2AF50;
    v21[4] = self;
    v22 = v6;
    p_buf = &buf;
    v24 = v10;
    dispatch_async(cloudHistoryQueue, v21);

    _Block_object_dispose(&buf, 8);
    v14 = v30;
    v30 = 0;
    if (v14)
    {
      SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v14);
      MEMORY[0x1A85998AC](v15, 0x1080C40D2F62047, v16, v17, v18);
    }
  }
  else
  {
    v19 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A3D90000, v19, OS_LOG_TYPE_DEFAULT, "iCloud History is not enabled. Nothing to do when fetching changes!", (uint8_t *)&buf, 2u);
    }
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCloudHistory"), 1, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v20);

    }
  }

}

void __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  uint64_t v4;
  id **v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  void *v9;
  _QWORD v10[5];
  char v11;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_registerFetchCompletionHandler:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "isValid"))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v3 = "Server has already asked us to back off. Nothing to do when fetching changes!";
LABEL_7:
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 2u);
    return;
  }
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v4 + 88);
  v5 = (id **)(v4 + 88);
  if (v6)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      return;
    *(_WORD *)buf = 0;
    v3 = "A fetch operation is already in progress. Nothing to do!";
    goto LABEL_7;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(id **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = 0;
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100](v5, v8);
  v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_120;
  v10[3] = &unk_1E4B2AF28;
  v10[4] = v9;
  v11 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v9, "_determineCloudHistoryStoreWithCompletion:", v10);
}

uint64_t __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_120(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2;
  v3[3] = &unk_1E4B2AED8;
  v3[4] = v1;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:", v3);
}

id *__76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  char v18;
  _QWORD v19[5];
  char v20;
  uint8_t buf[16];

  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_replayPersistedLongLivedSaveOperationIfNecessary");
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 184);
  if (v3 == 1)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "Only one device in the iCloud History sync circle", buf, 2u);
    }
    goto LABEL_12;
  }
  if (v3)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_INFO, "More than one device in the iCloud History sync circle", buf, 2u);
    }
    v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_93_cold_1(v2, v9, v10, v11, v12, v13, v14, v15);
LABEL_12:
    v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_123;
    v17[3] = &unk_1E4B2AF00;
    v17[4] = v16;
    v18 = *(_BYTE *)(a1 + 40);
    return (id *)objc_msgSend(v16, "_getServerChangeTokenDataWithCompletion:", v17);
  }
  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Unknown number of devices in iCloud History sync circle. Will determine the number of devices and then retry the fetch.", buf, 2u);
  }
  v5 = *(void **)(a1 + 32);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_121;
  v19[3] = &unk_1E4B2AED8;
  v19[4] = v5;
  v20 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v5, "_determineNumberOfDevicesInSyncCircleForOperation:completionHandler:", CFSTR("FetchChanges"), v19);
  return std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)v2 + 88), 0);
}

void __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_121(uint64_t a1)
{
  _QWORD v1[5];
  char v2;

  v1[0] = MEMORY[0x1E0C809B0];
  v1[1] = 3221225472;
  v1[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2_122;
  v1[3] = &unk_1E4B2AED8;
  v1[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_BYTE *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v1);
}

uint64_t __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2_122(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAndMergeChangesBypassingThrottler:completionHandler:", *(unsigned __int8 *)(a1 + 40), 0);
}

void __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;
  char v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2_124;
  block[3] = &unk_1E4B2AB18;
  v9 = *(_BYTE *)(a1 + 40);
  block[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, block);

}

void __76__WBSCloudHistory_fetchAndMergeChangesBypassingThrottler_completionHandler___block_invoke_2_124(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = 2 * *(unsigned __int8 *)(a1 + 48);
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "permitsOperationWithPriority:", v2) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchAndMergeChangesWithServerChangeTokenData:withPriority:", *(_QWORD *)(a1 + 40), v2);
  }
  else
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "dateOfNextPermittedOperationWithPriority:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "timeIntervalSinceDate:", v5);
      v9 = 134217984;
      v10 = v6;
      _os_log_impl(&dword_1A3D90000, v3, OS_LOG_TYPE_DEFAULT, "Fetch was denied by the throttler. A fetch will be permitted in %f seconds.", (uint8_t *)&v9, 0xCu);

    }
    std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)(a1 + 32) + 88), 0);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WBSCloudHistory"), 2, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_callAndResetFetchCompletionHandlerWithError:", v8);

  }
}

- (void)_registerFetchCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id fetchCompletionHandler;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A8599ED0](self->_fetchCompletionHandler);
    v6 = v5;
    if (v5)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__WBSCloudHistory__registerFetchCompletionHandler___block_invoke;
      v11[3] = &unk_1E4B2ACA8;
      v12 = v5;
      v13 = v4;
      v7 = (void *)MEMORY[0x1A8599ED0](v11);
      fetchCompletionHandler = self->_fetchCompletionHandler;
      self->_fetchCompletionHandler = v7;

      v9 = v12;
    }
    else
    {
      v10 = (void *)MEMORY[0x1A8599ED0](v4);
      v9 = self->_fetchCompletionHandler;
      self->_fetchCompletionHandler = v10;
    }

  }
}

void __51__WBSCloudHistory__registerFetchCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_callAndResetFetchCompletionHandlerWithError:(id)a3
{
  id v4;
  void (**fetchCompletionHandler)(void);
  id v6;
  id v7;

  v4 = a3;
  fetchCompletionHandler = (void (**)(void))self->_fetchCompletionHandler;
  if (fetchCompletionHandler)
  {
    v7 = v4;
    fetchCompletionHandler[2]();
    v6 = self->_fetchCompletionHandler;
    self->_fetchCompletionHandler = 0;

    v4 = v7;
  }

}

- (void)_getServerChangeTokenDataWithCompletion:(id)a3
{
  id v4;
  WBSHistoryServiceDatabaseProtocol *database;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("server_change_token"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__WBSCloudHistory__getServerChangeTokenDataWithCompletion___block_invoke;
  v8[3] = &unk_1E4B2AF78;
  v7 = v4;
  v9 = v7;
  -[WBSHistoryServiceDatabaseProtocol fetchMetadataForKeys:completionHandler:](database, "fetchMetadataForKeys:completionHandler:", v6, v8);

}

void __59__WBSCloudHistory__getServerChangeTokenDataWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __59__WBSCloudHistory__getServerChangeTokenDataWithCompletion___block_invoke_cold_1();
    }

  }
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "safari_dataForKey:", CFSTR("server_change_token"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

}

- (void)_setServerChangeToken:(id)a3
{
  -[WBSHistoryServiceDatabaseProtocol setMetadataValue:forKey:completionHandler:](self->_database, "setMetadataValue:forKey:completionHandler:", a3, CFSTR("server_change_token"), &__block_literal_global_128);
}

void __41__WBSCloudHistory__setServerChangeToken___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __41__WBSCloudHistory__setServerChangeToken___block_invoke_cold_1();
    }

  }
}

- (void)_pcsIdentitiesChangedNotification:(id)a3
{
  NSObject *cloudHistoryQueue;
  _QWORD block[5];

  cloudHistoryQueue = self->_cloudHistoryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSCloudHistory__pcsIdentitiesChangedNotification___block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(cloudHistoryQueue, block);
}

void __53__WBSCloudHistory__pcsIdentitiesChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C94868], 0);

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 241))
  {
    *(_BYTE *)(v3 + 241) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 240) = 1;
    v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_DEFAULT, "Received expected PCS identity change notification. Fetching Safari History", buf, 2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__WBSCloudHistory__pcsIdentitiesChangedNotification___block_invoke_129;
    block[3] = &unk_1E4B2A2C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring PCS identity change notification because Safari History is not waiting for an identity update", buf, 2u);
    }
  }
}

uint64_t __53__WBSCloudHistory__pcsIdentitiesChangedNotification___block_invoke_129(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fetchAndMergeChanges");
  return objc_msgSend(*(id *)(a1 + 32), "saveChangesToCloudHistoryStore");
}

- (id)_manateeErrorCode:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 110) & 1) != 0)
  {
    v4 = &unk_1E4B878F8;
  }
  else if ((objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 112) & 1) != 0)
  {
    v4 = &unk_1E4B87910;
  }
  else if ((objc_msgSend(v3, "safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:", 5004) & 1) != 0)
  {
    v4 = &unk_1E4B87928;
  }
  else if (objc_msgSend(v3, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 111))
  {
    v4 = &unk_1E4B87940;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_handleManateeErrorIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSCloudHistory _manateeErrorCode:](self, "_manateeErrorCode:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "integerValue");
    v8 = v7;
    if (v7 > 111)
    {
      if (v7 == 112 || v7 == 5004)
      {
        v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 134217984;
          v14 = v8;
          _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_DEFAULT, "Received unrecoverable PCS error %ld from CloudKit. Deleting the zone and saving History data again.", (uint8_t *)&v13, 0xCu);
        }
        -[WBSCloudHistory _deleteAllCloudHistoryAndSaveAgain](self, "_deleteAllCloudHistoryAndSaveAgain");
      }
    }
    else if (v7 == 110)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_DEFAULT, "Received PCS unavailable error from CloudKit. Marking PCS state needs updating", (uint8_t *)&v13, 2u);
      }
      self->_manateeStateNeedsUpdate = 1;
    }
    else if (v7 == 111)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_DEFAULT, "Received unsynced Keychain error. Observing notification to start fetching History when PCS identities change", (uint8_t *)&v13, 2u);
      }
      self->_isWaitingForPCSIdentityUpdate = 1;
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel__pcsIdentitiesChangedNotification_, *MEMORY[0x1E0C94868], 0);

    }
  }

}

- (void)_transitionCloudHistoryStoreToManateeState:(int64_t)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  NSObject *v7;
  int64_t currentManateeState;
  _BOOL4 v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(_QWORD);
  id v15[2];
  BOOL v16;
  _QWORD v17[5];
  uint8_t buf[4];
  _DWORD v19[7];

  *(_QWORD *)&v19[5] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v19 = a3;
    _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning history store to PCS state %ld", buf, 0xCu);
  }
  currentManateeState = self->_currentManateeState;
  self->_currentManateeState = a3;
  if (self->_store && (v9 = currentManateeState != 1, (a3 != 1) == v9))
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v19[0] = v9;
      LOWORD(v19[1]) = 1024;
      *(_DWORD *)((char *)&v19[1] + 2) = a3 != 1;
      _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_DEFAULT, "No need to transition the history store. Currently using PCS cloud history store %d, should use PCS cloud history store %d", buf, 0xEu);
    }
    v6[2](v6);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke;
    v17[3] = &unk_1E4B2B010;
    v17[4] = self;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_4;
    v12[3] = &unk_1E4B2B0D8;
    v12[4] = self;
    v13 = (id)MEMORY[0x1A8599ED0](v17);
    v16 = a3 != 1;
    v14 = v6;
    v15[1] = (id)a3;
    v10 = v13;
    objc_copyWeak(v15, (id *)buf);
    -[WBSCloudHistory _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:](self, "_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:", v12);
    objc_destroyWeak(v15);

    objc_destroyWeak((id *)buf);
  }

}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("sync_with_manatee_container"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_2;
  v7[3] = &unk_1E4B2AFE8;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "fetchMetadataForKeys:completionHandler:", v5, v7);

}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_3;
  block[3] = &unk_1E4B2AFC0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "safari_BOOLForKey:", CFSTR("sync_with_manatee_container")), *(_QWORD *)(a1 + 40));
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7[2];
  char v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_5;
  v5[3] = &unk_1E4B2B0B0;
  v2 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v8 = *(_BYTE *)(a1 + 72);
  v3 = *(id *)(a1 + 48);
  v4 = *(void **)(a1 + 64);
  v6 = v3;
  v7[1] = v4;
  objc_copyWeak(v7, (id *)(a1 + 56));
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v5);
  objc_destroyWeak(v7);

}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_5(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  const __CFString *v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_5_cold_1();
    }

  }
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfiguration:useManateeContainer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned __int8 *)(a1 + 64));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 120);
  *(_QWORD *)(v8 + 120) = v7;

  if (a2)
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v11 = "History database has PCS container sync properties";
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v11 = "History database has normal container sync properties";
  }
  _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 32);
  v26 = CFSTR("UsesManateeContainerKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("WBSCloudHistoryStoreManateeStateDidChangeNotification"), v13, v15);

  if (((*(unsigned __int8 *)(a1 + 64) != a2) & ~(v5 != 0)) != 0)
  {
    v18 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      v25 = v19;
      _os_log_impl(&dword_1A3D90000, v18, OS_LOG_TYPE_DEFAULT, "History database needs to reset because sync properties are not compatible with PCS state %ld", buf, 0xCu);
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_138;
    v20[3] = &unk_1E4B2B088;
    v20[4] = *(_QWORD *)(a1 + 32);
    v23 = *(_BYTE *)(a1 + 64);
    objc_copyWeak(&v22, (id *)(a1 + 48));
    v21 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v20);

    objc_destroyWeak(&v22);
  }
  else
  {
    v16 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_DEFAULT, "Database sync properties should not reset. Error %{public}@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_138(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  char v6;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_2_139;
  v3[3] = &unk_1E4B2B088;
  v3[4] = v2;
  v6 = *(_BYTE *)(a1 + 56);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_resetForAccountChangeWithCompletionHandler:", v3);

  objc_destroyWeak(&v5);
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_2_139(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_DEFAULT, "Finish reseting database sync properties in response to PCS cloud history store transition", buf, 2u);
  }
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_140;
  v5[3] = &unk_1E4B2B060;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setMetadataValue:forKey:completionHandler:", v4, CFSTR("sync_with_manatee_container"), v5);

  objc_destroyWeak(&v7);
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_140(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_140_cold_1();
    }

  }
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_141;
    block[3] = &unk_1E4B2B038;
    v9 = *(id *)(a1 + 32);
    dispatch_async(v7, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_141(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_deleteAllCloudHistoryAndSaveAgain
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke;
  v2[3] = &unk_1E4B2A2C8;
  v2[4] = self;
  -[WBSCloudHistory _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:](self, "_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:", v2);
}

uint64_t __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_2;
  v3[3] = &unk_1E4B2B100;
  v3[4] = v1;
  return objc_msgSend(v1, "_determineCloudHistoryStoreWithCompletion:", v3);
}

uint64_t __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3;
  v3[3] = &unk_1E4B2AD70;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "deleteHistoryZoneWithCompletion:", v3);
}

void __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[9];

  block[8] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3_cold_1();
    }

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_143;
    block[3] = &unk_1E4B2A2C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

uint64_t __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_143(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_2_144;
  v3[3] = &unk_1E4B2A2C8;
  v3[4] = v1;
  return objc_msgSend(v1, "_resetForAccountChangeWithCompletionHandler:", v3);
}

void __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_2_144(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3_145;
  block[3] = &unk_1E4B2A2C8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3_145(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveChangesToCloudHistoryStore");
}

- (void)_fetchAndMergeChangesWithServerChangeTokenData:(id)a3 withPriority:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  WBSCloudHistory *v10;
  int64_t v11;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke;
  v8[3] = &unk_1E4B2B240;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  -[WBSCloudHistory _determineCloudHistoryStoreWithCompletion:](self, "_determineCloudHistoryStoreWithCompletion:", v8);

}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke(int8x16_t *a1, void *a2)
{
  int8x16_t v2;
  _QWORD v3[4];
  int8x16_t v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2;
  v3[3] = &unk_1E4B2B218;
  v5 = a1[3].i64[0];
  v2 = a1[2];
  v4 = vextq_s8(v2, v2, 8uLL);
  objc_msgSend(a2, "fetchRecordsWithServerChangeTokenData:completion:", (id)v2.i64[0], v3);

}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a2;
  v8 = a4;
  v9 = a1[4];
  v10 = (void *)a1[5];
  v11 = *(NSObject **)(v9 + 8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3;
  v14[3] = &unk_1E4B2B1F0;
  v14[1] = 3221225472;
  v15 = v8;
  v16 = v9;
  v19 = a1[6];
  v20 = a3;
  v17 = v7;
  v18 = v10;
  v12 = v7;
  v13 = v8;
  dispatch_async(v11, v14);

}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  int8x16_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD block[4];
  int8x16_t v34;
  uint64_t v35;
  uint8_t buf[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = objc_msgSend(v2, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0C947D0], 21);
    v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "iCloud History change token has expired. Resetting change token and retrying fetch.", buf, 2u);
      }
      objc_msgSend(*(id *)(a1 + 40), "_setServerChangeToken:", 0);
      objc_msgSend(*(id *)(a1 + 40), "_fetchAndMergeChangesWithServerChangeTokenData:withPriority:", 0, *(_QWORD *)(a1 + 64));
    }
    else
    {
      v18 = v4;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 32), "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_cold_1();
      }

      if (*(_QWORD *)(a1 + 72) >= 2uLL)
      {
        v19 = 0;
        do
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "operationWithPriority:didCompleteWithResult:", *(_QWORD *)(a1 + 64), 2);
          ++v19;
        }
        while (v19 < *(_QWORD *)(a1 + 72) - 1);
      }
      v20 = objc_msgSend(*(id *)(a1 + 40), "_resultFromError:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "operationWithPriority:didCompleteWithResult:", *(_QWORD *)(a1 + 64), v20);
      v21 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_146;
      block[3] = &unk_1E4B2B128;
      v35 = v20;
      v24 = *(int8x16_t *)(a1 + 32);
      v22 = (id)v24.i64[0];
      v34 = vextq_s8(v24, v24, 8uLL);
      dispatch_async(MEMORY[0x1E0C80D38], block);
      std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)(a1 + 40) + 88), 0);
      if (v20 != 5)
      {
        objc_msgSend(*(id *)(a1 + 40), "_callAndResetFetchCompletionHandlerWithError:", *(_QWORD *)(a1 + 32));
        if (v20 == 6)
        {
          v32[0] = v21;
          v32[1] = 3221225472;
          v32[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2_147;
          v32[3] = &unk_1E4B2A2C8;
          v32[4] = *(_QWORD *)(a1 + 40);
          v23 = (void *)MEMORY[0x1E0C80D38];
          dispatch_async(MEMORY[0x1E0C80D38], v32);

        }
        else if (v20 == 7)
        {
          objc_msgSend(*(id *)(a1 + 40), "_handleManateeErrorIfNeeded:", *(_QWORD *)(a1 + 32));
        }
      }

    }
  }
  else
  {
    if (*(_QWORD *)(a1 + 72))
    {
      v6 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "operationWithPriority:didCompleteWithResult:", *(_QWORD *)(a1 + 64), 2);
        ++v6;
      }
      while (v6 < *(_QWORD *)(a1 + 72));
    }
    v7 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_148;
    v28[3] = &unk_1E4B2B150;
    v28[4] = *(_QWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 72);
    v29 = v8;
    v31 = v9;
    v30 = *(id *)(a1 + 56);
    v10 = (void *)MEMORY[0x1A8599ED0](v28);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 272));
    objc_msgSend(*(id *)(a1 + 48), "profiles");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(void **)(a1 + 48);
    v16 = *(_QWORD *)(v14 + 8);
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_151;
    v25[3] = &unk_1E4B2B1C8;
    v25[4] = v14;
    v26 = v15;
    v17 = WeakRetained;
    v27 = v17;
    objc_msgSend(v13, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", v16, v25, v10);

  }
}

_QWORD *__79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_146(_QWORD *result)
{
  void *v1;

  if (result[6] == 5)
  {
    *(_BYTE *)(result[4] + 161) = 1;
    v1 = (void *)result[4];
    objc_msgSend(v1, "_backoffTimeIntervalFromError:", result[5]);
    return (_QWORD *)objc_msgSend(v1, "_backOffWithInterval:");
  }
  return result;
}

uint64_t __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2_147(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetForAccountChangeWithCompletionHandler:", 0);
}

uint64_t __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_148(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "serverChangeTokenData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setServerChangeToken:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud");
  v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 40), "visitCount");
    v6 = objc_msgSend(*(id *)(a1 + 40), "tombstoneCount");
    v7 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134218496;
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 2048;
    v17 = v7;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_DEFAULT, "Merged %zu visits and %zu tombstones fetched from iCloud History in %zu operations into local history store.", buf, 0x20u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "clearAcknowledgedPushNotifications");
  objc_msgSend(*(id *)(a1 + 32), "_processPendingPushNotifications");
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)(a1 + 32) + 88), 0);
  result = objc_msgSend(*(id *)(a1 + 32), "_callAndResetFetchCompletionHandlerWithError:", 0);
  if (!*(_QWORD *)(a1 + 48))
  {
    v9 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v9 + 184) <= 1uLL)
    {
      *(_QWORD *)(v9 + 64) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) = 0;
      v10 = *(void **)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_149;
      v11[3] = &unk_1E4B2A2C8;
      v11[4] = v10;
      return objc_msgSend(v10, "_determineNumberOfDevicesInSyncCircleForOperation:completionHandler:", CFSTR("FetchChanges"), v11);
    }
  }
  return result;
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_149(uint64_t a1)
{
  _QWORD block[5];

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 184) >= 2uLL)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2_150;
    block[3] = &unk_1E4B2A2C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_2_150(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveChangesBypassingThrottler:completionHandler:", 0, 0);
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_151(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldSyncProfiles") & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_convertProfileServerIdentifierToLocalIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = *(void **)(a1 + 48);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_152;
      v12[3] = &unk_1E4B2B1A0;
      v13 = v8;
      v14 = v6;
      v16 = v7;
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v10, "openDatabaseWithID:createIfNeeded:completionHandler:", v13, 1, v12);

    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v18 = v6;
        _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_DEFAULT, "Database for profile with server identifier %{private}@ does not exists on device because there is no local profile identifier that it is associated with, ignoring records associated with this server identifier", buf, 0xCu);
      }
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "clearRecordsForProfileWithServerIdentifier:", v6);
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_152(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  WBSCloudHistoryMergeOperation *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_152_cold_1((uint64_t)a1, v7);
      if (v5)
        goto LABEL_4;
LABEL_6:
      (*((void (**)(void))a1[7] + 2))();
      goto LABEL_7;
    }
  }
  if (!v5)
    goto LABEL_6;
LABEL_4:
  v8 = -[WBSCloudHistoryMergeOperation initWithDatabase:fetchResult:profileServerIdentifier:]([WBSCloudHistoryMergeOperation alloc], "initWithDatabase:fetchResult:profileServerIdentifier:", v5, a1[6], a1[5]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_154;
  v9[3] = &unk_1E4B2B178;
  v10 = a1[6];
  v11 = a1[5];
  v12 = a1[7];
  -[WBSCloudHistoryMergeOperation mergeWithCompletion:](v8, "mergeWithCompletion:", v9);

LABEL_7:
}

uint64_t __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_154(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "clearRecordsForProfileWithServerIdentifier:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud
{
  void *v3;
  double v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCloudHistoryConfiguration syncWindow](self->_configuration, "syncWindow");
  objc_msgSend(v3, "dateByAddingTimeInterval:", -v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[WBSHistoryServiceDatabaseProtocol pruneTombstonesWithEndDatePriorToDate:completionHandler:](self->_database, "pruneTombstonesWithEndDatePriorToDate:completionHandler:", v5, &__block_literal_global_157);
}

void __77__WBSCloudHistory__pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __77__WBSCloudHistory__pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud__block_invoke_cold_1();
    }

  }
}

- (void)_replayPersistedLongLivedSaveOperationIfNecessary
{
  id v3;
  id v4;
  id *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  WBSCloudHistory *v9;
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[WBSCloudHistoryConfiguration shouldUseLongLivedOperationsToSaveRecords](self->_configuration, "shouldUseLongLivedOperationsToSaveRecords")&& !self->_replayLongLivedSaveOperationHasBeenPerformed)
  {
    self->_replayLongLivedSaveOperationHasBeenPerformed = 1;
    v11 = 0;
    v12 = 0;
    -[WBSCloudHistory _persistedLongLivedSaveOperationID:databaseGenerations:](self, "_persistedLongLivedSaveOperationID:databaseGenerations:", &v12, &v11);
    v3 = v12;
    v4 = v11;
    -[WBSCloudHistory _removePersistedLongLivedSaveOperationDictionary](self, "_removePersistedLongLivedSaveOperationDictionary");
    if (v3 && v4)
    {
      v5 = (id *)operator new();
      MEMORY[0x1A8599720](v5, CFSTR("com.apple.SafariShared.WBSCloudHistoryStore.replayLongLivedSaveOperation"));
      std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_replayLongLivedSaveOperationSuddenTerminationDisabler, v5);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke;
      v7[3] = &unk_1E4B2B2F8;
      v8 = v3;
      v9 = self;
      v10 = v4;
      -[WBSCloudHistory _determineCloudHistoryStoreWithCompletion:](self, "_determineCloudHistoryStoreWithCompletion:", v7);

    }
    else
    {
      v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v14 = v3;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "There is no persisted long-lived operation to replay. Operation ID: %{public}@, generations: %@", buf, 0x16u);
      }
    }

  }
}

void __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke_2;
  v6[3] = &unk_1E4B2B2D0;
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(a2, "replayPersistedLongLivedSaveOperationWithID:completion:", v4, v6);

}

void __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(*(_QWORD *)(a1 + 32) + 96), 0);
    v11 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v14 = CFSTR("NO");
      if (a2)
        v14 = CFSTR("YES");
      v15 = v14;
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v22 = v13;
      v23 = 2112;
      v24 = v12;
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      _os_log_error_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_ERROR, "Long-lived operation cannot be fetched. Operation ID: %{public}@, generations: %@, operation exists: %{public}@, error: %{public}@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "_handleManateeErrorIfNeeded:", v5);
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v22 = v7;
      v23 = 2112;
      v24 = v8;
      _os_log_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_INFO, "Long-lived operation was fetched and successfully replayed. Operation ID: %{public}@, generations: %@", buf, 0x16u);
    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke_160;
    v17[3] = &unk_1E4B2B2A8;
    v9 = *(void **)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 32);
    v19 = v9;
    v20 = *(id *)(a1 + 48);
    objc_msgSend(v18, "_updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations:completion:", v10, v17);

  }
}

void __68__WBSCloudHistory__replayPersistedLongLivedSaveOperationIfNecessary__block_invoke_160(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)(a1[4] + 96), 0);
  v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[5];
    v4 = a1[6];
    v5 = 138543618;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "History was updated after successfully replaying the persisted long-lived operation. Operation ID: %{public}@, generations: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)_updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  OS_dispatch_queue *cloudHistoryQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseStore);
  objc_msgSend(v6, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke;
  v13[3] = &unk_1E4B2B1C8;
  v13[4] = self;
  v11 = WeakRetained;
  v14 = v11;
  v12 = v6;
  v15 = v12;
  objc_msgSend(v9, "safari_enumerateAsynchronouslyOnQueue:enumerationBlock:completionBlock:", cloudHistoryQueue, v13, v7);

}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v6 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_convertProfileServerIdentifierToLocalIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_161;
    v13[3] = &unk_1E4B2B348;
    v14 = v8;
    v17 = v7;
    v15 = *(id *)(a1 + 48);
    v16 = v6;
    objc_msgSend(v10, "openDatabaseWithID:createIfNeeded:completionHandler:", v14, 0, v13);

  }
  else
  {
    v11 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_cold_1((uint64_t)v6, v11, v12);
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_161(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "longLongValue");
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_162;
    v13[3] = &unk_1E4B2B320;
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v5, "updateDatabaseAfterSuccessfulSyncWithGeneration:completionHandler:", v9, v13);

  }
  else
  {
    if ((objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0CB2FE0], 2) & 1) == 0)
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v7, "safari_privacyPreservingDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_161_cold_1(v11, v12, (uint64_t)v15);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_162(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_persistedLongLivedSaveOperationID:(id *)a3 databaseGenerations:(id *)a4
{
  NSData *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  *a3 = 0;
  *a4 = 0;
  v6 = self->_longLivedSaveOperationData;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "safari_stringForKey:", CFSTR("operationID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v7, "safari_numberForKey:", CFSTR("generation"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          *a3 = objc_retainAutorelease(v8);
          v11 = *MEMORY[0x1E0D89E20];
          v12[0] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("generations"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            *a3 = objc_retainAutorelease(v8);
            *a4 = objc_retainAutorelease(v10);
          }

        }
      }

    }
  }

}

- (void)_persistLongLivedSaveOperationDictionaryWithOperationID:(id)a3 databaseGenerations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSData *v9;
  NSData *longLivedSaveOperationData;
  NSData *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v12[0] = CFSTR("operationID");
  v12[1] = CFSTR("generations");
  v13[0] = v6;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v8, 200, 0, 0);
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  longLivedSaveOperationData = self->_longLivedSaveOperationData;
  self->_longLivedSaveOperationData = v9;
  v11 = v9;

  -[WBSHistoryServiceDatabaseProtocol setMetadataValue:forKey:completionHandler:](self->_database, "setMetadataValue:forKey:completionHandler:", v11, CFSTR("long_lived_save_operation"), &__block_literal_global_163);
}

void __95__WBSCloudHistory__persistLongLivedSaveOperationDictionaryWithOperationID_databaseGenerations___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __95__WBSCloudHistory__persistLongLivedSaveOperationDictionaryWithOperationID_databaseGenerations___block_invoke_cold_1();
    }

  }
}

- (void)_removePersistedLongLivedSaveOperationDictionary
{
  NSData *longLivedSaveOperationData;

  longLivedSaveOperationData = self->_longLivedSaveOperationData;
  self->_longLivedSaveOperationData = 0;

  -[WBSHistoryServiceDatabaseProtocol setMetadataValue:forKey:completionHandler:](self->_database, "setMetadataValue:forKey:completionHandler:", 0, CFSTR("long_lived_save_operation"), &__block_literal_global_164);
}

void __67__WBSCloudHistory__removePersistedLongLivedSaveOperationDictionary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __67__WBSCloudHistory__removePersistedLongLivedSaveOperationDictionary__block_invoke_cold_1();
    }

  }
}

- (void)_initializePushNotificationSupport
{
  _QWORD v3[5];

  if (-[WBSCloudHistory isCloudHistoryEnabled](self, "isCloudHistoryEnabled"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke;
    v3[3] = &unk_1E4B2B3B0;
    v3[4] = self;
    -[WBSCloudHistory _pushNotificationsAreInitializedWithCompletionHandler:](self, "_pushNotificationsAreInitializedWithCompletionHandler:", v3);
  }
}

void __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_cold_1();
    }

  }
  else if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_processPendingPushNotifications");
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_INFO, "Initializing iCloud History push notifications…", buf, 2u);
    }
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_165;
    v9[3] = &unk_1E4B2B100;
    v9[4] = v8;
    objc_msgSend(v8, "_determineCloudHistoryStoreWithCompletion:", v9);
  }

}

uint64_t __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_165(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_2;
  v3[3] = &unk_1E4B2AD70;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "initializePushNotifications:", v3);
}

void __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_2_cold_1();
    }

  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Push notifications are now initialized.", v6, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_setPushNotificationAreInitialized:", 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "fetchAndMergeChanges");

}

- (void)_pushNotificationsAreInitializedWithCompletionHandler:(id)a3
{
  id v4;
  WBSHistoryServiceDatabaseProtocol *database;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("push_notifications_initialized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__WBSCloudHistory__pushNotificationsAreInitializedWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E4B2AFE8;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  -[WBSHistoryServiceDatabaseProtocol fetchMetadataForKeys:completionHandler:](database, "fetchMetadataForKeys:completionHandler:", v6, v8);

}

void __73__WBSCloudHistory__pushNotificationsAreInitializedWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__WBSCloudHistory__pushNotificationsAreInitializedWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4B2AFC0;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __73__WBSCloudHistory__pushNotificationsAreInitializedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "safari_BOOLForKey:", CFSTR("push_notifications_initialized")), *(_QWORD *)(a1 + 40));
}

- (void)_setPushNotificationAreInitialized:(BOOL)a3
{
  WBSHistoryServiceDatabaseProtocol *database;
  id v4;

  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryServiceDatabaseProtocol setMetadataValue:forKey:completionHandler:](database, "setMetadataValue:forKey:completionHandler:");

}

void __54__WBSCloudHistory__setPushNotificationAreInitialized___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __54__WBSCloudHistory__setPushNotificationAreInitialized___block_invoke_cold_1();
    }

  }
}

- (void)_pushNotificationReceived:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_DEFAULT, "iCloud History push notification received from agent.", v5, 2u);
  }
  -[WBSCloudHistory _processPendingPushNotifications](self, "_processPendingPushNotifications");
}

- (void)_processPendingPushNotifications
{
  WBSCloudHistoryPushAgentProxy *pushAgent;
  _QWORD v3[5];

  pushAgent = self->_pushAgent;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__WBSCloudHistory__processPendingPushNotifications__block_invoke;
  v3[3] = &unk_1E4B2B420;
  v3[4] = self;
  -[WBSCloudHistoryPushAgentProxy getPushNotifications:](pushAgent, "getPushNotifications:", v3);
}

void __51__WBSCloudHistory__processPendingPushNotifications__block_invoke(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;
  char v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__WBSCloudHistory__processPendingPushNotifications__block_invoke_2;
  v5[3] = &unk_1E4B2B3F8;
  v6 = a2;
  v7 = a3;
  v5[4] = v3;
  dispatch_async(v4, v5);
}

void __51__WBSCloudHistory__processPendingPushNotifications__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  WBSOneShotTimer *v17;
  uint64_t v18;
  void *v19;
  int v20;
  __CFString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 40) && !*(_BYTE *)(a1 + 41))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v20) = 0;
    v9 = "No pending push notifications.";
    goto LABEL_24;
  }
  v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 40))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    v4 = v3;
    if (*(_BYTE *)(a1 + 41))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v6 = v5;
    v20 = 138543618;
    v21 = v4;
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Processing unacknowledged push notifications: %{public}@. Processing acknowledged push notifications: %{public}@.", (uint8_t *)&v20, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateDeviceCountInResponseToPushNotification");
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 88))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v20) = 0;
    v9 = "A fetch is already in progress. Push notifications will be processed once the fetch completes.";
LABEL_24:
    _os_log_impl(&dword_1A3D90000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v20, 2u);
    return;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(v7 + 168), "acknowledgePendingPushNotifications");
    v7 = *(_QWORD *)(a1 + 32);
  }
  if ((objc_msgSend(*(id *)(v7 + 136), "permitsOperationWithPriority:", 0) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "BOOLForKey:", CFSTR("WBSCloudHistoryIgnoreThrottlingPolicy")),
        v10,
        v11))
  {
    objc_msgSend(*(id *)(a1 + 32), "_fetchChangesInResponseToPushNotification:", 0);
    return;
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v12 + 176))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v20) = 0;
    v9 = "A fetch has already been scheduled in response to a push notification.";
    goto LABEL_24;
  }
  objc_msgSend(*(id *)(v12 + 136), "dateOfNextPermittedOperationWithPriority:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v15);
    v20 = 134217984;
    v21 = v16;
    _os_log_impl(&dword_1A3D90000, v14, OS_LOG_TYPE_DEFAULT, "A fetch is not currently permitted by the throttler. Scheduling a fetch in %f seconds in response to processing push notifications", (uint8_t *)&v20, 0xCu);

  }
  v17 = -[WBSOneShotTimer initWithFireDate:queue:target:selector:]([WBSOneShotTimer alloc], "initWithFireDate:queue:target:selector:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 32), sel__fetchChangesInResponseToPushNotification_);
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 176);
  *(_QWORD *)(v18 + 176) = v17;

}

- (void)_fetchChangesInResponseToPushNotification:(id)a3
{
  WBSOneShotTimer *pushNotificationFetchTimer;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  pushNotificationFetchTimer = self->_pushNotificationFetchTimer;
  self->_pushNotificationFetchTimer = 0;

  v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_DEFAULT, "Fetching changes from iCloud History in response to a push notification.", buf, 2u);
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSCloudHistory__fetchChangesInResponseToPushNotification___block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __61__WBSCloudHistory__fetchChangesInResponseToPushNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchAndMergeChanges");
}

- (void)_determineNumberOfDevicesInSyncCircleForOperation:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void (**v16)(_QWORD, _QWORD, _QWORD);
  NSObject *v17;
  __int16 v18[8];
  _QWORD v19[4];
  void (**v20)(_QWORD, _QWORD, _QWORD);
  _QWORD v21[6];
  char v22;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_syncCircleSizeRetrievalCompletionHandlersByOperation, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WBSCloudHistory _determineNumberOfDevicesInSyncCircleForOperation:completionHandler:].cold.1((uint64_t)v6, v9, v10);
  }
  else
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_syncCircleSizeRetrievalCompletionHandlersByOperation, "setObject:forKeyedSubscript:", v11, v6);

    if ((unint64_t)-[NSMutableDictionary count](self->_syncCircleSizeRetrievalCompletionHandlersByOperation, "count") <= 1)
    {
      v12 = -[WBSCloudHistory _cachedNumberOfDevicesInSyncCircle](self, "_cachedNumberOfDevicesInSyncCircle");
      v13 = -[WBSCloudKitThrottler permitsOperationWithPriority:](self->_syncCircleSizeRetrievalThrottler, "permitsOperationWithPriority:", v12 == 0);
      v14 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke;
      v21[3] = &unk_1E4B2B4D8;
      v22 = v13;
      v21[4] = self;
      v21[5] = v12 == 0;
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A8599ED0](v21);
      v16 = v15;
      if (v13)
      {
        v19[0] = v14;
        v19[1] = 3221225472;
        v19[2] = __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_4;
        v19[3] = &unk_1E4B2B500;
        v20 = v15;
        -[WBSCloudHistory _determineCloudHistoryStoreWithCompletion:](self, "_determineCloudHistoryStoreWithCompletion:", v19);

      }
      else
      {
        v17 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18[0] = 0;
          _os_log_impl(&dword_1A3D90000, v17, OS_LOG_TYPE_INFO, "Determining size of sync circle was denied by throttler", (uint8_t *)v18, 2u);
        }
        v16[2](v16, v12, 0);
      }

    }
  }

}

void __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _QWORD v12[7];
  char v13;
  _QWORD block[5];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_cold_1();
    }

    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(NSObject **)(v7 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_171;
    block[3] = &unk_1E4B2B448;
    block[4] = v7;
    v15 = v5;
    dispatch_async(v8, block);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(NSObject **)(v9 + 8);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[2] = __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_2;
    v12[3] = &unk_1E4B2B4B0;
    v12[1] = 3221225472;
    v12[4] = v9;
    v12[5] = a2;
    v13 = *(_BYTE *)(a1 + 48);
    v12[6] = v10;
    dispatch_async(v11, v12);
  }

}

uint64_t __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_171(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeAllObjects");
  return objc_msgSend(*(id *)(a1 + 32), "_handleManateeErrorIfNeeded:", *(_QWORD *)(a1 + 40));
}

uint64_t __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setNumberOfDevicesInSyncCircle:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_173);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeAllObjects");
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "operationWithPriority:didCompleteWithResult:", *(_QWORD *)(a1 + 48), 2);
  return result;
}

uint64_t __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

uint64_t __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "fetchNumberOfDevicesInSyncCircleWithCompletion:", *(_QWORD *)(a1 + 32));
}

- (void)_saveChangesWhenHistoryLoads
{
  if (!self->_saveChangesWhenHistoryLoads)
  {
    -[WBSCloudHistory _registerForHistoryWasLoadedNotificationIfNecessary](self, "_registerForHistoryWasLoadedNotificationIfNecessary");
    self->_saveChangesWhenHistoryLoads = 1;
  }
}

- (void)_fetchChangesWhenHistoryLoads
{
  if (!self->_fetchChangesWhenHistoryLoads)
  {
    -[WBSCloudHistory _registerForHistoryWasLoadedNotificationIfNecessary](self, "_registerForHistoryWasLoadedNotificationIfNecessary");
    self->_fetchChangesWhenHistoryLoads = 1;
  }
}

- (void)_updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap
{
  void *v3;
  NSDictionary *namedProfileLocalIdentifiersToServerIdentifiersMap;
  NSDictionary *v5;
  NSDictionary *namedProfileServerIdentifiersToLocalIdentifiersMap;
  NSDictionary *v7;
  _QWORD v8[4];
  NSDictionary *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  namedProfileLocalIdentifiersToServerIdentifiersMap = self->_namedProfileLocalIdentifiersToServerIdentifiersMap;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__WBSCloudHistory__updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap__block_invoke;
  v8[3] = &unk_1E4B2B528;
  v5 = v3;
  v9 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](namedProfileLocalIdentifiersToServerIdentifiersMap, "enumerateKeysAndObjectsUsingBlock:", v8);
  namedProfileServerIdentifiersToLocalIdentifiersMap = self->_namedProfileServerIdentifiersToLocalIdentifiersMap;
  self->_namedProfileServerIdentifiersToLocalIdentifiersMap = v5;
  v7 = v5;

}

uint64_t __94__WBSCloudHistory__updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

- (void)_updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to serialize profile identifier map: %{private}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __81__WBSCloudHistory__updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v2, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    __81__WBSCloudHistory__updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase__block_invoke_cold_1();
  }

}

- (void)updateProfileLocalIdentifiersToServerIdentifiersMap:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __89__WBSCloudHistory_updateProfileLocalIdentifiersToServerIdentifiersMap_completionHandler___block_invoke;
  v10[3] = &unk_1E4B2B178;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WBSCloudHistory _performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:](self, "_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:", v10);

}

void __89__WBSCloudHistory_updateProfileLocalIdentifiersToServerIdentifiersMap_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "isEqualToDictionary:", *(_QWORD *)(a1 + 40)))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setWithArray:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "minusSet:", v6);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 248), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap");
    objc_msgSend(*(id *)(a1 + 32), "_updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase");
    if (objc_msgSend(v7, "count"))
      objc_msgSend(*(id *)(a1 + 32), "_fetchAddedProfileLocalIdentifiers:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

- (void)_fetchAddedProfileLocalIdentifiers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke;
  v6[3] = &unk_1E4B2B5E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSCloudHistory _determineCloudHistoryStoreWithCompletion:](self, "_determineCloudHistoryStoreWithCompletion:", v6);

}

void __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_2;
  v7[3] = &unk_1E4B2B598;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v8 = v6;
  objc_msgSend(v4, "_enumerateDatabasesWithProfileLocalIdentifiers:createIfNeeded:enumerationBlock:completionBlock:", v5, 1, v7, &__block_literal_global_180);

}

void __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_convertProfileLocalIdentifierToServerIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_3;
  v16[3] = &unk_1E4B2B570;
  v17 = v10;
  v12 = v7;
  v18 = v12;
  v13 = v9;
  v20 = v13;
  v14 = v8;
  v19 = v14;
  v15 = v10;
  objc_msgSend(v11, "fetchRecordsForProfileServerIdentifier:completion:", v15, v16);

}

void __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  WBSCloudHistoryMergeOperation *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v15 = v10;
      v16 = 2112;
      v17 = v9;
      v18 = 2114;
      v19 = v11;
      _os_log_error_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch records for profile server identifier %{private}@ (local identifier: %@): %{public}@", buf, 0x20u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v8 = -[WBSCloudHistoryMergeOperation initWithDatabase:fetchResult:profileServerIdentifier:]([WBSCloudHistoryMergeOperation alloc], "initWithDatabase:fetchResult:profileServerIdentifier:", *(_QWORD *)(a1 + 48), v5, *(_QWORD *)(a1 + 32));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_177;
    v12[3] = &unk_1E4B2B038;
    v13 = *(id *)(a1 + 56);
    -[WBSCloudHistoryMergeOperation mergeWithCompletion:](v8, "mergeWithCompletion:", v12);

  }
}

uint64_t __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_177(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54__WBSCloudHistory__fetchAddedProfileLocalIdentifiers___block_invoke_2_179()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1A3D90000, v0, OS_LOG_TYPE_INFO, "Finished fetching new profiles", v1, 2u);
  }
}

- (void)_loadMetadataAsynchronously
{
  void *v3;
  WBSHistoryServiceDatabaseProtocol *database;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("push_throttler_data"), CFSTR("fetch_throttler_data"), CFSTR("sync_circle_size_retrieval_throttler_data"), CFSTR("cached_sync_circle_size"), CFSTR("long_lived_save_operation"), CFSTR("profile_server_map"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke;
  v5[3] = &unk_1E4B2B608;
  v5[4] = self;
  -[WBSHistoryServiceDatabaseProtocol fetchMetadataForKeys:completionHandler:](database, "fetchMetadataForKeys:completionHandler:", v3, v5);

}

void __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke_2;
  v7[3] = &unk_1E4B2B448;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke_2(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  NSObject *v22;
  id v23[5];

  v23[4] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "safari_dataForKey:", CFSTR("push_throttler_data"));
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = a1 + 32;
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v3;

  objc_msgSend(*v2, "safari_dataForKey:", CFSTR("fetch_throttler_data"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  *(_QWORD *)(*(_QWORD *)v5 + 40) = v7;

  objc_msgSend(*v2, "safari_dataForKey:", CFSTR("sync_circle_size_retrieval_throttler_data"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  *(_QWORD *)(*(_QWORD *)v5 + 48) = v9;

  objc_msgSend(*v2, "safari_numberForKey:", CFSTR("cached_sync_circle_size"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = objc_msgSend(v11, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 40), "safari_dataForKey:", CFSTR("long_lived_save_operation"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v12;

  objc_msgSend(*(id *)(a1 + 40), "safari_dataForKey:", CFSTR("profile_server_map"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v23[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v14, 0, 0, v23);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v23[0];
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 248);
    *(_QWORD *)(v17 + 248) = v15;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 248);
      *(_QWORD *)(v19 + 248) = 0;

    }
    v21 = *(_QWORD **)(a1 + 32);
    if (v21[31])
    {
      objc_msgSend(v21, "_updateProfileServerIdentifiersToLocalIdentifiersMapBasedOnLocalToServerMap");
    }
    else
    {
      v22 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke_2_cold_1();
      }

    }
  }
  dispatch_set_target_queue(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));

}

- (void)_performBlockAsynchronouslyOnCloudHistoryQueueAfterMetadataHasLoaded:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_waitUntilMetadataHasLoadedQueue, a3);
}

- (int64_t)_priorityForSaveWithVisits:(id)a3 tombstones:(id)a4 bypassingThrottler:(BOOL)a5
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a5)
  {
    v8 = 2;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v6, "allValues", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v10 = 0;
      v11 = *(_QWORD *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          v10 += objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "count");
        }
        while (v8 != v12);
        v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
      v8 = v10 != 0;
    }

  }
  return v8;
}

- (int64_t)_estimatedPriorityForPotentialSaveAttempt
{
  return self->_removedHistoryItemsArePendingSave;
}

- (int64_t)_resultFromError:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v8;
  char v9;
  double v10;

  v4 = a3;
  if (v4)
  {
    -[WBSCloudHistory _manateeErrorCode:](self, "_manateeErrorCode:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = 7;
    }
    else if ((objc_msgSend(v4, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 26) & 1) != 0
           || (objc_msgSend(v4, "safari_hasOrContainsErrorWithCloudKitErrorCode:", 28) & 1) != 0)
    {
      v6 = 6;
    }
    else if ((objc_msgSend(v4, "safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:", 5008) & 1) != 0)
    {
      v6 = 5;
    }
    else
    {
      objc_msgSend(v4, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C947D0]);

      if ((v9 & 1) != 0 && (objc_msgSend(v4, "code") & 0xFFFFFFFFFFFFFFFELL) == 6)
      {
        -[WBSCloudHistory _backoffTimeIntervalFromError:](self, "_backoffTimeIntervalFromError:", v4);
        if (v10 == 0.0)
          v6 = 4;
        else
          v6 = 5;
      }
      else
      {
        v6 = 3;
      }
    }
  }
  else
  {
    v6 = 2;
  }

  return v6;
}

- (double)_backoffTimeIntervalFromError:(id)a3
{
  id v3;
  NSObject *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint8_t v11[16];

  v3 = a3;
  if (objc_msgSend(v3, "safari_errorOrAnyPartialErrorHasCloudKitInternalErrorCode:", 5008))
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Backing off sync in response to receiving unsynced keychain error from CloudKit", v11, 2u);
    }
    v5 = 120.0;
  }
  else
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_numberForKey:", *MEMORY[0x1E0C94800]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    v5 = 0.0;
    if (v9 > 0.0)
    {
      if (v9 <= 21600.0)
        v5 = v9;
      else
        v5 = 21600.0;
    }
  }

  return v5;
}

- (void)_backOffWithInterval:(double)a3
{
  WBSOneShotTimer *v5;
  uint64_t v6;
  id v7;
  WBSOneShotTimer *v8;
  WBSOneShotTimer *serverBackoffTimer;
  id v10;

  -[WBSOneShotTimer invalidate](self->_serverBackoffTimer, "invalidate");
  v5 = [WBSOneShotTimer alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  v8 = -[WBSOneShotTimer initWithFireDate:queue:target:selector:](v5, "initWithFireDate:queue:target:selector:", v10, v6, self, sel__serverBackoffTimerFired_);
  serverBackoffTimer = self->_serverBackoffTimer;
  self->_serverBackoffTimer = v8;

}

- (void)_serverBackoffTimerFired:(id)a3
{
  WBSOneShotTimer *serverBackoffTimer;

  serverBackoffTimer = self->_serverBackoffTimer;
  self->_serverBackoffTimer = 0;

  if (self->_saveChangesWhenBackoffTimerFires)
    -[WBSCloudHistory saveChangesToCloudHistoryStore](self, "saveChangesToCloudHistoryStore");
  if (self->_fetchChangesWhenBackoffTimerFires)
    -[WBSCloudHistory fetchAndMergeChanges](self, "fetchAndMergeChanges");
  *(_WORD *)&self->_saveChangesWhenBackoffTimerFires = 0;
}

- (id)recordOfPastOperationsForThrottler:(id)a3
{
  WBSCloudKitThrottler *v4;
  WBSCloudKitThrottler *v5;
  id v6;
  uint64_t v7;

  v4 = (WBSCloudKitThrottler *)a3;
  v5 = v4;
  if (self->_saveChangesThrottler == v4)
  {
    v7 = 32;
LABEL_8:
    v6 = *(id *)((char *)&self->super.isa + v7);
    goto LABEL_9;
  }
  if (self->_fetchChangesThrottler == v4)
  {
    v7 = 40;
    goto LABEL_8;
  }
  if (self->_syncCircleSizeRetrievalThrottler == v4)
  {
    v7 = 48;
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (void)setRecordOfPastOperations:(id)a3 forThrottler:(id)a4
{
  id v6;
  id v7;
  WBSCloudKitThrottler *v8;
  void *v9;
  void *v10;
  __CFString **v11;
  uint64_t v12;
  _QWORD v13[4];
  WBSCloudKitThrottler *v14;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__WBSCloudHistory_setRecordOfPastOperations_forThrottler___block_invoke;
  v13[3] = &unk_1E4B2AD70;
  v8 = (WBSCloudKitThrottler *)v7;
  v14 = v8;
  v9 = (void *)MEMORY[0x1A8599ED0](v13);
  v10 = (void *)objc_msgSend(v6, "copy");

  if (self->_saveChangesThrottler == v8)
  {
    v11 = WBSHistorySQLiteStorePushThrottlerDataKey;
    v12 = 32;
    goto LABEL_7;
  }
  if (self->_fetchChangesThrottler == v8)
  {
    v11 = WBSHistorySQLiteStoreFetchThrottlerDataKey;
    v12 = 40;
    goto LABEL_7;
  }
  if (self->_syncCircleSizeRetrievalThrottler == v8)
  {
    v11 = WBSHistorySQLiteStoreSyncCircleSizeRetrievalThrottlerDataKey;
    v12 = 48;
LABEL_7:
    objc_storeStrong((id *)((char *)&self->super.isa + v12), v10);
    -[WBSHistoryServiceDatabaseProtocol setMetadataValue:forKey:completionHandler:](self->_database, "setMetadataValue:forKey:completionHandler:", v10, *v11, v9);
  }

}

void __58__WBSCloudHistory_setRecordOfPastOperations_forThrottler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __58__WBSCloudHistory_setRecordOfPastOperations_forThrottler___block_invoke_cold_1(v5, v6, (uint64_t)v7);
    }

  }
}

- (id)_currentSaveChangesThrottlerPolicyString
{
  unint64_t numberOfDevicesInSyncCircle;
  WBSCloudHistoryConfiguration *configuration;

  numberOfDevicesInSyncCircle = self->_numberOfDevicesInSyncCircle;
  configuration = self->_configuration;
  if (numberOfDevicesInSyncCircle == 1)
    -[WBSCloudHistoryConfiguration singleDeviceSaveChangesThrottlingPolicyString](configuration, "singleDeviceSaveChangesThrottlingPolicyString");
  else
    -[WBSCloudHistoryConfiguration multipleDeviceSaveChangesThrottlingPolicyString](configuration, "multipleDeviceSaveChangesThrottlingPolicyString");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_currentFetchChangesThrottlerPolicyString
{
  unint64_t numberOfDevicesInSyncCircle;
  WBSCloudHistoryConfiguration *configuration;

  numberOfDevicesInSyncCircle = self->_numberOfDevicesInSyncCircle;
  configuration = self->_configuration;
  if (numberOfDevicesInSyncCircle == 1)
    -[WBSCloudHistoryConfiguration singleDeviceFetchChangesThrottlingPolicyString](configuration, "singleDeviceFetchChangesThrottlingPolicyString");
  else
    -[WBSCloudHistoryConfiguration multipleDeviceFetchChangesThrottlingPolicyString](configuration, "multipleDeviceFetchChangesThrottlingPolicyString");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_currentSyncCircleSizeRetrievalThrottlerPolicyString
{
  return -[WBSCloudHistoryConfiguration syncCircleSizeRetrievalThrottlingPolicyString](self->_configuration, "syncCircleSizeRetrievalThrottlingPolicyString");
}

- (void)setNumberOfDevicesInSyncCircle:(unint64_t)a3
{
  if (-[WBSCloudHistory _cachedNumberOfDevicesInSyncCircle](self, "_cachedNumberOfDevicesInSyncCircle") != a3)
    -[WBSCloudHistory _setCachedNumberOfDevicesInSyncCircle:](self, "_setCachedNumberOfDevicesInSyncCircle:", a3);
  if (self->_numberOfDevicesInSyncCircle != a3)
  {
    self->_numberOfDevicesInSyncCircle = a3;
    -[WBSCloudHistory _updateThrottlerPolicies](self, "_updateThrottlerPolicies");
  }
}

- (void)_updateDeviceCountInResponseToPushNotification
{
  NSObject *v2;
  uint8_t v3[16];

  if (self->_numberOfDevicesInSyncCircle == 1)
  {
    -[WBSCloudHistory setNumberOfDevicesInSyncCircle:](self, "setNumberOfDevicesInSyncCircle:", 2);
    v2 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A3D90000, v2, OS_LOG_TYPE_INFO, "Moved to multi-device throttling policies in response to receiving a push notification.", v3, 2u);
    }
  }
}

- (void)_updateThrottlerPolicies
{
  id v3;
  id v4;
  id v5;

  -[WBSCloudHistory _currentSaveChangesThrottlerPolicyString](self, "_currentSaveChangesThrottlerPolicyString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSCloudKitThrottler setPolicyString:](self->_saveChangesThrottler, "setPolicyString:");

  -[WBSCloudHistory _currentFetchChangesThrottlerPolicyString](self, "_currentFetchChangesThrottlerPolicyString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSCloudKitThrottler setPolicyString:](self->_fetchChangesThrottler, "setPolicyString:");

  -[WBSCloudHistory _currentSyncCircleSizeRetrievalThrottlerPolicyString](self, "_currentSyncCircleSizeRetrievalThrottlerPolicyString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSCloudKitThrottler setPolicyString:](self->_syncCircleSizeRetrievalThrottler, "setPolicyString:");

}

- (unint64_t)_cachedNumberOfDevicesInSyncCircle
{
  return self->_syncCircleSize;
}

- (void)_setCachedNumberOfDevicesInSyncCircle:(unint64_t)a3
{
  WBSHistoryServiceDatabaseProtocol *database;
  id v4;

  self->_syncCircleSize = a3;
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryServiceDatabaseProtocol setMetadataValue:forKey:completionHandler:](database, "setMetadataValue:forKey:completionHandler:");

}

void __57__WBSCloudHistory__setCachedNumberOfDevicesInSyncCircle___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __57__WBSCloudHistory__setCachedNumberOfDevicesInSyncCircle___block_invoke_cold_1();
    }

  }
}

- (void)_resetCloudHistoryDataWithCompletionHandler:(id)a3
{
  id v4;
  WBSHistoryServiceDatabaseProtocol *database;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  database = self->_database;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__WBSCloudHistory__resetCloudHistoryDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2B320;
  v8 = v4;
  v6 = v4;
  -[WBSHistoryServiceDatabaseProtocol resetCloudHistoryDataWithCompletionHandler:](database, "resetCloudHistoryDataWithCompletionHandler:", v7);

}

void __63__WBSCloudHistory__resetCloudHistoryDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXCloudHistory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __63__WBSCloudHistory__resetCloudHistoryDataWithCompletionHandler___block_invoke_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)resetForAccountChange
{
  -[WBSCloudHistory _resetForAccountChangeWithCompletionHandler:](self, "_resetForAccountChangeWithCompletionHandler:", 0);
}

- (void)_resetForAccountChangeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCloudHistory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Resetting Cloud History due to account change.", buf, 2u);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__WBSCloudHistory__resetForAccountChangeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[WBSCloudHistory _resetCloudHistoryDataWithCompletionHandler:](self, "_resetCloudHistoryDataWithCompletionHandler:", v7);

}

void __63__WBSCloudHistory__resetForAccountChangeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__WBSCloudHistory__resetForAccountChangeWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E4B2A250;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __63__WBSCloudHistory__resetForAccountChangeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setNumberOfDevicesInSyncCircle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "reloadRecordOfPastOperations");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "reloadRecordOfPastOperations");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "reloadRecordOfPastOperations");
  objc_msgSend(*(id *)(a1 + 32), "_initializePushNotificationSupport");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  NSObject *cloudHistoryQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__WBSCloudHistory_updateConfiguration_completionHandler___block_invoke;
  v8[3] = &unk_1E4B2B448;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(cloudHistoryQueue, v8);

}

uint64_t __57__WBSCloudHistory_updateConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "applyRemoteConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)resetForAccountChangeWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *cloudHistoryQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__WBSCloudHistory_resetForAccountChangeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(cloudHistoryQueue, v7);

}

void __62__WBSCloudHistory_resetForAccountChangeWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __62__WBSCloudHistory_resetForAccountChangeWithCompletionHandler___block_invoke_2;
  v2[3] = &unk_1E4B2B038;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_resetForAccountChangeWithCompletionHandler:", v2);

}

uint64_t __62__WBSCloudHistory_resetForAccountChangeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *cloudHistoryQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  cloudHistoryQueue = self->_cloudHistoryQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__WBSCloudHistory_fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B29E18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(cloudHistoryQueue, v7);

}

void __83__WBSCloudHistory_fetchDateOfNextPermittedSaveChangesAttemptWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "dateOfNextPermittedSaveChangesAttempt");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (BOOL)removedHistoryItemsArePendingSave
{
  return self->_removedHistoryItemsArePendingSave;
}

- (void)setRemovedHistoryItemsArePendingSave:(BOOL)a3
{
  self->_removedHistoryItemsArePendingSave = a3;
}

- (WBSHistoryServiceDatabaseStore)databaseStore
{
  return (WBSHistoryServiceDatabaseStore *)objc_loadWeakRetained((id *)&self->_databaseStore);
}

- (void)setDatabaseStore:(id)a3
{
  objc_storeWeak((id *)&self->_databaseStore, a3);
}

- (unint64_t)numberOfDevicesInSyncCircle
{
  return self->_numberOfDevicesInSyncCircle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_databaseStore);
  objc_storeStrong((id *)&self->_namedProfileServerIdentifiersToLocalIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_namedProfileLocalIdentifiersToServerIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_storeDeterminationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_containerManateeObserver, 0);
  objc_storeStrong(&self->_saveCompletionHandler, 0);
  objc_storeStrong(&self->_fetchCompletionHandler, 0);
  objc_storeStrong((id *)&self->_syncCircleSizeRetrievalCompletionHandlersByOperation, 0);
  objc_storeStrong((id *)&self->_pushNotificationFetchTimer, 0);
  objc_storeStrong((id *)&self->_pushAgent, 0);
  objc_storeStrong((id *)&self->_serverBackoffTimer, 0);
  objc_storeStrong((id *)&self->_syncCircleSizeRetrievalThrottler, 0);
  objc_storeStrong((id *)&self->_fetchChangesThrottler, 0);
  objc_storeStrong((id *)&self->_saveChangesThrottler, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_replayLongLivedSaveOperationSuddenTerminationDisabler, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_fetchOperationSuddenTerminationDisabler, 0);
  std::unique_ptr<SafariShared::SuddenTerminationDisabler>::reset[abi:sn180100]((id **)&self->_saveOperationSuddenTerminationDisabler, 0);
  objc_storeStrong((id *)&self->_longLivedSaveOperationData, 0);
  objc_storeStrong((id *)&self->_syncCircleSizeRetrievalThrottlerData, 0);
  objc_storeStrong((id *)&self->_fetchThrottlerData, 0);
  objc_storeStrong((id *)&self->_pushThrottlerData, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_waitUntilMetadataHasLoadedQueue, 0);
  objc_storeStrong((id *)&self->_cloudHistoryQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

void __80__WBSCloudHistory_initWithDatabase_configuration_databaseStore_completionBlock___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to migrate long lived operation: %{private}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_2_93_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Number of devices in iCloud History sync circle: %lul", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __67__WBSCloudHistory_saveChangesBypassingThrottler_completionHandler___block_invoke_103_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "iCloud History save completed with result %ld and error %{public}@.", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __114__WBSCloudHistory__enumerateDatabasesWithProfileLocalIdentifiers_createIfNeeded_enumerationBlock_completionBlock___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to open database: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_6_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update database after successful sync: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __83__WBSCloudHistory_getVisitsAndTombstonesNeedingSyncWithVisitSyncWindow_completion___block_invoke_115_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to convert tombstone to their secure format: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __59__WBSCloudHistory__getServerChangeTokenDataWithCompletion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to fetch server change token: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __41__WBSCloudHistory__setServerChangeToken___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update server change token: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_5_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to read syncs with PCS cloud container status: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __73__WBSCloudHistory__transitionCloudHistoryStoreToManateeState_completion___block_invoke_140_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update syncs with PCS cloud container status: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __53__WBSCloudHistory__deleteAllCloudHistoryAndSaveAgain__block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "iCloud History failed to delete History zone %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_3_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(v1, v2, v3, 3.8521e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "iCloud History fetch failed with an error after %zu operations: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __79__WBSCloudHistory__fetchAndMergeChangesWithServerChangeTokenData_withPriority___block_invoke_152_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138478083;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Can't open database with local identifier %{private}@ (server identifier %@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __77__WBSCloudHistory__pruneTombstonesThatCanNoLongerMatchVisitsFetchedFromCloud__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to prune tombsotnes: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138477827;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Unable to find local profile identifier for server profile identifier: %{private}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __106__WBSCloudHistory__updateHistoryAfterSuccessfulPersistedLongLivedSaveOperationWithGenerations_completion___block_invoke_161_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to open database with local identifier %@ after successful sync: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __95__WBSCloudHistory__persistLongLivedSaveOperationDictionaryWithOperationID_databaseGenerations___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to save long lived save operation: %{private}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __67__WBSCloudHistory__removePersistedLongLivedSaveOperationDictionary__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to remove long lived save operation: %{private}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to determine if push notifications are initialized: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __53__WBSCloudHistory__initializePushNotificationSupport__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to initialize push notifications for iCloud History: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __54__WBSCloudHistory__setPushNotificationAreInitialized___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update push notifications initialize status: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_determineNumberOfDevicesInSyncCircleForOperation:(uint64_t)a3 completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Skipping query for number of devices in sync circle. Concurrent %{public}@ in progress", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __87__WBSCloudHistory__determineNumberOfDevicesInSyncCircleForOperation_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Error when determining number of devices in sync circle: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __81__WBSCloudHistory__updateProfileLocalIdentifiersToServerIdentifiersMapInDatabase__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to save profile identifier map: %{private}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __46__WBSCloudHistory__loadMetadataAsynchronously__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.808e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Profile identifier map could not be read from database: %{private}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __58__WBSCloudHistory_setRecordOfPastOperations_forThrottler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to save past operations for throller %{private}@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __57__WBSCloudHistory__setCachedNumberOfDevicesInSyncCircle___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to update cached sync circle size: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

void __63__WBSCloudHistory__resetCloudHistoryDataWithCompletionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_5(&dword_1A3D90000, v3, v4, "Failed to reset Cloud History Data: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

@end
