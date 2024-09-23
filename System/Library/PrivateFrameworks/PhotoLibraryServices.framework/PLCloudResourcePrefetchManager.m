@implementation PLCloudResourcePrefetchManager

- (PLCloudResourcePrefetchManager)init
{
  -[PLCloudResourcePrefetchManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[PLCloudResourcePrefetchManager initWithCPLManager:pruneManager:libraryServicesManager:](self, "initWithCPLManager:pruneManager:libraryServicesManager:", 0, 0, 0);
}

- (PLCloudResourcePrefetchManager)initWithCPLManager:(id)a3 pruneManager:(id)a4 libraryServicesManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLCloudResourcePrefetchManager *v12;
  PLPrefetchConfiguration *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PLPrefetchConfiguration *prefetchConfiguration;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSDictionary *inflightResources;
  NSObject *v27;
  dispatch_queue_t v28;
  OS_dispatch_queue *workQueue;
  uint64_t v30;
  NSDate *lastCheckCPLBGDownloadDate;
  void *v32;
  id WeakRetained;
  void *v34;
  uint64_t v35;
  NSDate *initialSyncDate;
  NSDate *lastCompletePrefetchDate;
  void *v39;
  id v40;
  objc_super v41;
  _QWORD v42[7];
  _QWORD v43[9];

  v43[7] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v41.receiver = self;
  v41.super_class = (Class)PLCloudResourcePrefetchManager;
  v12 = -[PLCloudResourcePrefetchManager init](&v41, sel_init);
  if (v12)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("PLCloudResourcePrefetchManager.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryServicesManager"));

    }
    objc_storeStrong((id *)&v12->_lsm, a5);
    objc_storeWeak((id *)&v12->_cplManager, v9);
    v40 = v10;
    objc_storeWeak((id *)&v12->_pruneManager, v10);
    v13 = [PLPrefetchConfiguration alloc];
    objc_msgSend(v9, "cplConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKey:", *MEMORY[0x1E0D11238]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PLPrefetchConfiguration initWithPrefetchDictionary:](v13, "initWithPrefetchDictionary:", v15);
    prefetchConfiguration = v12->_prefetchConfiguration;
    v12->_prefetchConfiguration = (PLPrefetchConfiguration *)v16;

    v42[0] = &unk_1E375FE28;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceThumbnailsMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceThumbnailsMaxResourcesPerFetch"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v18;
    v42[1] = &unk_1E375FE40;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceComputeSyncMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceComputeSyncMaxResourcesPerFetch"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v43[1] = v19;
    v42[2] = &unk_1E375FE58;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceMemoriesMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceMemoriesMaxResourcesPerFetch"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v20;
    v42[3] = &unk_1E375FE70;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceWidgetMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceWidgetMaxResourcesPerFetch"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v21;
    v42[4] = &unk_1E375FE88;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceNonThumbnailsMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceNonThumbnailsMaxResourcesPerFetch"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v43[4] = v22;
    v42[5] = &unk_1E375FEA0;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceMediaMetadataOverflowMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceMediaMetadataOverflowMaxResourcesPerFetch"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[5] = v23;
    v42[6] = &unk_1E375FEB8;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[PLPrefetchConfiguration cloudResourceMediaMetadataOverflowMaxResourcesPerFetch](v12->_prefetchConfiguration, "cloudResourceMediaMetadataOverflowMaxResourcesPerFetch"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[6] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 7);
    v25 = objc_claimAutoreleasedReturnValue();
    inflightResources = v12->_inflightResources;
    v12->_inflightResources = (NSDictionary *)v25;

    PLCloudCopyDefaultSerialQueueAttributes();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create("PLCloudResourcePrefetchManager work queue", v27);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v28;

    v12->_enqueuedCheckCPLBGDownload = 0;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v30 = objc_claimAutoreleasedReturnValue();
    lastCheckCPLBGDownloadDate = v12->_lastCheckCPLBGDownloadDate;
    v12->_lastCheckCPLBGDownloadDate = (NSDate *)v30;

    if (PLIsEDUMode())
      v12->_prefetchMode = 2;
    objc_msgSend(v11, "cplSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v12->_prefetchMode = objc_msgSend(v32, "prefetchMode");

    v12->_prefetchOptimizeMode = +[PLPrefetchConfiguration defaultPrefetchOptimizeMode](PLPrefetchConfiguration, "defaultPrefetchOptimizeMode");
    WeakRetained = objc_loadWeakRetained((id *)&v12->_cplManager);
    objc_msgSend(WeakRetained, "cplStatus");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "initialSyncDate");
    v35 = objc_claimAutoreleasedReturnValue();
    initialSyncDate = v12->_initialSyncDate;
    v12->_initialSyncDate = (NSDate *)v35;

    lastCompletePrefetchDate = v12->_lastCompletePrefetchDate;
    v12->_lastCompletePrefetchDate = 0;

    v12->_isWalrusEnabled = objc_msgSend(v34, "isWalrusEnabled");
    v10 = v40;
  }

  return v12;
}

- (void)invalidate
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  uint8_t v5[16];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  PLResourceCachingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Invalidated prefetch manager", v5, 2u);
  }

}

- (void)startAutomaticPrefetch
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager startAutomaticPrefetch]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PLCloudResourcePrefetchManager_startAutomaticPrefetch__block_invoke;
  v4[3] = &unk_1E3677AA0;
  v4[4] = self;
  -[PLCloudResourcePrefetchManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v3, v4);

}

- (void)_startAutomaticPrefetch
{
  if (self->_initialSyncDate)
    self->_prefetchOptimizeMode = -[PLCloudResourcePrefetchManager _prefetchOptimizeModeBasedOnLibrarySize](self, "_prefetchOptimizeModeBasedOnLibrarySize");
  if (-[PLCloudResourcePrefetchManager _countOfAllInflightResources](self, "_countOfAllInflightResources"))
    -[PLCloudResourcePrefetchManager _checkCPLBackgroundDownloadOperations](self, "_checkCPLBackgroundDownloadOperations");
  else
    -[PLCloudResourcePrefetchManager _startPrefetchNextBatch](self, "_startPrefetchNextBatch");
}

- (void)handleCPLStatusChange
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager handleCPLStatusChange]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
  objc_msgSend(WeakRetained, "cplStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PLCloudResourcePrefetchManager_handleCPLStatusChange__block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PLCloudResourcePrefetchManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v3, v7);

}

- (void)handleCPLConfigurationChange
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager handleCPLConfigurationChange]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
  objc_msgSend(WeakRetained, "cplConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PLCloudResourcePrefetchManager_handleCPLConfigurationChange__block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PLCloudResourcePrefetchManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v3, v7);

}

- (void)handleOptimizeModeChange
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  PLResourceCachingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Trigger prefetching due to optimize mode change", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager handleOptimizeModeChange]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__PLCloudResourcePrefetchManager_handleOptimizeModeChange__block_invoke;
  v5[3] = &unk_1E3677AA0;
  v5[4] = self;
  -[PLCloudResourcePrefetchManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v4, v5);

}

- (void)_checkCPLBackgroundDownloadOperations
{
  void *v3;
  double v4;
  NSDate *v5;
  NSDate *lastCheckCPLBGDownloadDate;
  NSObject *v7;
  id WeakRetained;
  _QWORD v9[5];
  uint8_t buf[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (-[PLCloudResourcePrefetchManager _countOfAllInflightResources](self, "_countOfAllInflightResources"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_lastCheckCPLBGDownloadDate);
    if (v4 <= (double)-[PLPrefetchConfiguration cloudResourceIntervalBetweenCheckCPLBGDownload](self->_prefetchConfiguration, "cloudResourceIntervalBetweenCheckCPLBGDownload"))
    {
      -[PLCloudResourcePrefetchManager _enqueueCheckCPLBGDownloadFromNow:withReason:](self, "_enqueueCheckCPLBGDownloadFromNow:withReason:", v3, CFSTR("throttled"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastCheckCPLBGDownloadDate = self->_lastCheckCPLBGDownloadDate;
      self->_lastCheckCPLBGDownloadDate = v5;

      PLResourceCachingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Asking CPL if it has background download operations", buf, 2u);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __71__PLCloudResourcePrefetchManager__checkCPLBackgroundDownloadOperations__block_invoke;
      v9[3] = &unk_1E36705F8;
      v9[4] = self;
      objc_msgSend(WeakRetained, "cplHasBackgroundDownloadOperationsWithCompletionHandler:", v9);

    }
  }
}

- (void)_enqueueCheckCPLBGDownloadFromNow:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (self->_enqueuedCheckCPLBGDownload)
  {
    PLResourceCachingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "CPL background download check (reason: %@) already enqueued", buf, 0xCu);
    }
  }
  else
  {
    self->_enqueuedCheckCPLBGDownload = 1;
    PLResourceCachingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "dateByAddingTimeInterval:", (double)-[PLPrefetchConfiguration cloudResourceIntervalBetweenCheckCPLBGDownload](self->_prefetchConfiguration, "cloudResourceIntervalBetweenCheckCPLBGDownload"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v7;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Enqueuing CPL background download check (reason: %@) at %@", buf, 0x16u);

    }
    dispatch_time(0, 1000000000* -[PLPrefetchConfiguration cloudResourceIntervalBetweenCheckCPLBGDownload](self->_prefetchConfiguration, "cloudResourceIntervalBetweenCheckCPLBGDownload"));
    v11 = v7;
    pl_dispatch_after();
    v8 = v11;
  }

}

- (void)_cleanupInflightResourcesInLibrary:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  PLPrefetchResourceIdentifier *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  PLCloudResourcePrefetchManager *v19;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v19 = self;
  -[PLCloudResourcePrefetchManager _allInflightResourceIdentifiers](self, "_allInflightResourceIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLResourceCachingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Cleaning up inflight resources: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v12, "assetUuid", v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = -[PLPrefetchResourceIdentifier initWithAssetUuid:version:cplType:recipeID:]([PLPrefetchResourceIdentifier alloc], "initWithAssetUuid:version:cplType:recipeID:", 0, objc_msgSend(v12, "version"), objc_msgSend(v12, "cplType"), objc_msgSend(v12, "recipeID"));
          objc_msgSend(v6, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKey:", v15, v14);
          }
          objc_msgSend(v12, "assetUuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v16);

        }
        else
        {
          if (*MEMORY[0x1E0D115D0])
            continue;
          __CPLAssetsdOSLogDomain();
          v14 = (PLPrefetchResourceIdentifier *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v12;
            _os_log_impl(&dword_199541000, &v14->super, OS_LOG_TYPE_ERROR, "Invalid resource identifier: %@", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __69__PLCloudResourcePrefetchManager__cleanupInflightResourcesInLibrary___block_invoke;
  v20[3] = &unk_1E3670620;
  v21 = v18;
  v17 = v18;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v20);
  -[PLCloudResourcePrefetchManager _removeAllInflightResourceIdentifiers](v19, "_removeAllInflightResourceIdentifiers");

}

- (void)stop
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager stop]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newShortLivedLibraryWithName:", "-[PLCloudResourcePrefetchManager stop]");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__PLCloudResourcePrefetchManager_stop__block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[PLCloudResourcePrefetchManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v3, v7);

}

- (id)prefetchStatusForDebug:(BOOL)a3
{
  id v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__70520;
  v9 = __Block_byref_object_dispose__70521;
  v10 = 0;
  pl_dispatch_sync();
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (id)_prefetchStatusForDebug:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v33;
  char v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  PLCloudResourcePrefetchManager *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  LODWORD(v33) = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:", "-[PLCloudResourcePrefetchManager _prefetchStatusForDebug:]");

  objc_msgSend(v6, "libraryBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indicatorFileCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isICloudPhotosPaused"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("iCPL Paused"));
    if (objc_msgSend(v8, "isUserPause"))
      objc_msgSend(v4, "appendFormat:", CFSTR(" (user)"));
    objc_msgSend(v4, "appendFormat:", CFSTR("\n"), v33);
  }
  v36 = v8;
  objc_msgSend(v6, "thumbnailManager", v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRebuildingThumbnails");

  if (v10)
    objc_msgSend(v4, "appendFormat:", CFSTR("Rebuilding thumbnails\n"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
  v12 = objc_msgSend(WeakRetained, "currentResetSyncType");

  if (v12)
    objc_msgSend(v4, "appendFormat:", CFSTR("In reset sync\n"));
  v61 = 0;
  v62 = 0;
  v59 = 0;
  v60 = 0;
  v57 = 0;
  v58 = 0;
  v56 = 0;
  -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 0, v6, 0, &v62);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 2, v6, 0, &v61);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 3, v6, 0, &v60);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 4, v6, 0, &v59);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 1, v6, 0, &v58);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 5, v6, 0, &v57);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 6, v6, 0, &v56);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v4;
  v21 = (void *)v19;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __58__PLCloudResourcePrefetchManager__prefetchStatusForDebug___block_invoke;
  v37[3] = &unk_1E3670648;
  v22 = v20;
  v48 = v62;
  v49 = v61;
  v50 = v60;
  v51 = v59;
  v52 = v58;
  v53 = v57;
  v54 = v56;
  v38 = v22;
  v39 = self;
  v40 = v6;
  v41 = v13;
  v55 = v34;
  v42 = v14;
  v43 = v15;
  v44 = v16;
  v45 = v17;
  v46 = v18;
  v47 = v21;
  v35 = v21;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v15;
  v27 = v14;
  v28 = v13;
  v29 = v6;
  objc_msgSend(v29, "performBlockAndWait:", v37);
  v30 = v47;
  v31 = v22;

  return v31;
}

- (void)prefetchResourcesWithPredicates:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id obj;
  id v21;
  _QWORD v22[5];
  id v23;
  NSObject *v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD v27[6];
  id v28;
  _QWORD *v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v21 = a4;
  v19 = a6;
  v11 = dispatch_group_create();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    v14 = MEMORY[0x1E0C809B0];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v15);
        dispatch_group_enter(v11);
        objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager prefetchResourcesWithPredicates:photoLibrary:prefetchPhase:completionHandler:]", v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x3032000000;
        v30[3] = __Block_byref_object_copy__70520;
        v30[4] = __Block_byref_object_dispose__70521;
        v31 = 0;
        v27[0] = v14;
        v27[1] = 3221225472;
        v27[2] = __111__PLCloudResourcePrefetchManager_prefetchResourcesWithPredicates_photoLibrary_prefetchPhase_completionHandler___block_invoke;
        v27[3] = &unk_1E3676EC8;
        v29 = v30;
        v27[4] = self;
        v27[5] = v16;
        v18 = v21;
        v28 = v18;
        objc_msgSend(v18, "performBlockAndWait:", v27);
        v22[0] = v14;
        v22[1] = 3221225472;
        v22[2] = __111__PLCloudResourcePrefetchManager_prefetchResourcesWithPredicates_photoLibrary_prefetchPhase_completionHandler___block_invoke_2;
        v22[3] = &unk_1E3675D28;
        v22[4] = self;
        v25 = v30;
        v23 = v18;
        v26 = a5;
        v24 = v11;
        -[PLCloudResourcePrefetchManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v17, v22);

        _Block_object_dispose(v30, 8);
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

}

- (void)_runOnWorkQueueWithTransaction:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v7;
  v6 = v8;
  pl_dispatch_async();

}

- (unint64_t)_countOfAllInflightResources
{
  NSDictionary *inflightResources;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  inflightResources = self->_inflightResources;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PLCloudResourcePrefetchManager__countOfAllInflightResources__block_invoke;
  v5[3] = &unk_1E3670670;
  v5[4] = &v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inflightResources, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)_countOfInflightResourcesForPrefetchPhase:(unint64_t)a3
{
  NSDictionary *inflightResources;
  void *v4;
  void *v5;
  unint64_t v6;

  inflightResources = self->_inflightResources;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](inflightResources, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)_allInflightResourceIdentifiers
{
  id v3;
  NSDictionary *inflightResources;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  inflightResources = self->_inflightResources;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PLCloudResourcePrefetchManager__allInflightResourceIdentifiers__block_invoke;
  v7[3] = &unk_1E3670698;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inflightResources, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (id)_inflightResourceIdentifiersForPrefetchPhase:(unint64_t)a3
{
  NSDictionary *inflightResources;
  void *v4;
  void *v5;

  inflightResources = self->_inflightResources;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](inflightResources, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isInflightResourceIdentifier:(id)a3
{
  id v4;
  NSDictionary *inflightResources;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  inflightResources = self->_inflightResources;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PLCloudResourcePrefetchManager__isInflightResourceIdentifier___block_invoke;
  v8[3] = &unk_1E36706C0;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inflightResources, "enumerateKeysAndObjectsUsingBlock:", v8);
  LOBYTE(inflightResources) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)inflightResources;
}

- (void)_addInflightResourceIdentifier:(id)a3 prefetchPhase:(unint64_t)a4
{
  NSDictionary *inflightResources;
  void *v6;
  id v7;
  void *v8;
  id v9;

  inflightResources = self->_inflightResources;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](inflightResources, "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);

}

- (void)_removeInflightResourceIdentifier:(id)a3 prefetchPhase:(unint64_t)a4
{
  NSDictionary *inflightResources;
  void *v6;
  id v7;
  void *v8;
  id v9;

  inflightResources = self->_inflightResources;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](inflightResources, "objectForKeyedSubscript:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

}

- (void)_removeAllInflightResourceIdentifiers
{
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](self->_inflightResources, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_70607);
}

- (BOOL)_isPrefetchDisabled
{
  int v2;
  void *v3;
  char v4;

  v2 = MEMORY[0x19AEC04BC](self, a2);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PLPrefetchDisabled"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (BOOL)_canPrefetchInLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v14;
  id WeakRetained;
  uint64_t v16;
  BOOL v17;
  void *v19;
  int v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLCloudResourcePrefetchManager _isPrefetchDisabled](self, "_isPrefetchDisabled"))
  {
    PLResourceCachingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = CFSTR("PLPrefetchDisabled");
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Prefetch disabled because %@ user default is set", (uint8_t *)&v20, 0xCu);
    }
    goto LABEL_18;
  }
  -[PLLibraryServicesManager libraryBundle](self->_lsm, "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indicatorFileCoordinator");
  v5 = objc_claimAutoreleasedReturnValue();

  if (!-[NSObject isICloudPhotosPaused](v5, "isICloudPhotosPaused"))
  {
    objc_msgSend(v4, "thumbnailManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isRebuildingThumbnails");

    if (v14)
    {
      PLResourceCachingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      LOWORD(v20) = 0;
      v10 = "Thumbnail rebuilding in progress, stops prefetching";
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
      v16 = objc_msgSend(WeakRetained, "currentResetSyncType");

      if (v16)
      {
        PLResourceCachingGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        LOWORD(v20) = 0;
        v10 = "In reset sync, stops prefetching";
      }
      else
      {
        -[PLCloudResourcePrefetchManager _volumeInfo](self, "_volumeInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v17 = 1;
          goto LABEL_19;
        }
        PLResourceCachingGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        LOWORD(v20) = 0;
        v10 = "Cannot access volume info, stops prefetching";
      }
    }
    v11 = v7;
    v12 = 2;
LABEL_16:
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v20, v12);
    goto LABEL_17;
  }
  PLResourceCachingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NSObject isUserPause](v5, "isUserPause");
    v9 = &stru_1E36789C0;
    if (v8)
      v9 = CFSTR("(user)");
    v20 = 138412290;
    v21 = v9;
    v10 = "CloudPhotos is paused %@, stops prefetching";
    v11 = v7;
    v12 = 12;
    goto LABEL_16;
  }
LABEL_17:

LABEL_18:
  v17 = 0;
LABEL_19:

  return v17;
}

- (void)_writeDownloadFinishedMarkerIfNeededWithLibrary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lastCompletePrefetchDate)
  {
    -[PLCloudResourcePrefetchManager _setLastCompletePrefetchDate:inLibrary:](self, "_setLastCompletePrefetchDate:inLibrary:", v5, v4);
  }
  else if (self->_initialSyncDate)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v6, "setDateFormat:", CFSTR("yyyy-MM-dd HH.mm.ss.SSS"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocale:", v7);

    PLResourceCachingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Writing out cpl_download_finished_marker", (uint8_t *)&v13, 2u);
    }

    objc_msgSend(v6, "stringFromDate:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cplDownloadFinishedMarkerFilePath");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeToFile:atomically:encoding:error:", v11, 1, 4, 0);

    -[PLCloudResourcePrefetchManager _setLastCompletePrefetchDate:inLibrary:](self, "_setLastCompletePrefetchDate:inLibrary:", v5, v4);
  }
  else
  {
    PLResourceCachingGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "No initial sync date at %@", (uint8_t *)&v13, 0xCu);
    }

  }
}

- (void)clearPrefetchState
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PLCloudResourcePrefetchManager *v11;
  id v12;
  uint8_t buf[16];

  PLResourceCachingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Clearing prefetch state", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager clearPrefetchState]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:", "-[PLCloudResourcePrefetchManager clearPrefetchState]");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PLCloudResourcePrefetchManager_clearPrefetchState__block_invoke;
  v9[3] = &unk_1E3677530;
  v10 = v6;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = v6;
  -[PLCloudResourcePrefetchManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v7, v9);

}

- (void)_startPrefetchNextBatch
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newShortLivedLibraryWithName:", "-[PLCloudResourcePrefetchManager _startPrefetchNextBatch]");

  if (-[PLCloudResourcePrefetchManager _canPrefetchInLibrary:](self, "_canPrefetchInLibrary:", v4))
  {
    v36 = 0;
    -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 0, v4, 1, &v36);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      PLResourceCachingGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 134217984;
        v38 = v7;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu thumbnail resources", buf, 0xCu);
      }

      -[PLCloudResourcePrefetchManager _prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:](self, "_prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:", v5, v4, 0, 1);
    }
    else
    {
      v35 = 0;
      -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 1, v4, 1, &v35);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
      {
        PLResourceCachingGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = objc_msgSend(v8, "count");
          *(_DWORD *)buf = 134217984;
          v38 = v10;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu compute-sync resources", buf, 0xCu);
        }

        -[PLCloudResourcePrefetchManager _prefetchComputeSyncResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:](self, "_prefetchComputeSyncResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:", v8, v4, 1, 1);
      }
      else if (!-[PLCloudResourcePrefetchManager _countOfInflightResourcesForPrefetchPhase:](self, "_countOfInflightResourcesForPrefetchPhase:", 0))
      {
        v33 = 0;
        v34 = 0;
        v31 = 0;
        v32 = 0;
        v30 = 0;
        -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 2, v4, 1, &v34);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 3, v4, 1, &v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 4, v4, 1, &v32);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 5, v4, 1, &v31);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudResourcePrefetchManager _resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:](self, "_resourcesToPrefetchWithPrefetchPhase:photoLibrary:applyPerPrefetchLimit:initialBudget:", 6, v4, 1, &v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
        v29 = v11;
        v16 = objc_msgSend(v11, "count");
        v17 = v16 == 0;
        if (v16
          && !-[PLCloudResourcePrefetchManager _countOfInflightResourcesForPrefetchPhase:](self, "_countOfInflightResourcesForPrefetchPhase:", 2))
        {
          PLResourceCachingGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_msgSend(v29, "count");
            *(_DWORD *)buf = 134217984;
            v38 = v19;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu memories resources", buf, 0xCu);
          }

          -[PLCloudResourcePrefetchManager _prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:](self, "_prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:", v29, v4, 2, 1);
        }
        if (objc_msgSend(v12, "count"))
        {
          if (!-[PLCloudResourcePrefetchManager _countOfInflightResourcesForPrefetchPhase:](self, "_countOfInflightResourcesForPrefetchPhase:", 3))
          {
            PLResourceCachingGetLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = objc_msgSend(v12, "count");
              *(_DWORD *)buf = 134217984;
              v38 = v21;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu widget resources", buf, 0xCu);
            }

            -[PLCloudResourcePrefetchManager _prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:](self, "_prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:", v12, v4, 3, 1);
          }
          v17 = 0;
        }
        if (objc_msgSend(v13, "count"))
        {
          if (!-[PLCloudResourcePrefetchManager _countOfInflightResourcesForPrefetchPhase:](self, "_countOfInflightResourcesForPrefetchPhase:", 4))
          {
            PLResourceCachingGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = objc_msgSend(v13, "count");
              *(_DWORD *)buf = 134217984;
              v38 = v23;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu non-thumbnail resources", buf, 0xCu);
            }

            -[PLCloudResourcePrefetchManager _prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:](self, "_prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:", v13, v4, 4, 1);
          }
          v17 = 0;
        }
        if (objc_msgSend(v14, "count"))
        {
          if (!-[PLCloudResourcePrefetchManager _countOfInflightResourcesForPrefetchPhase:](self, "_countOfInflightResourcesForPrefetchPhase:", 5))
          {
            PLResourceCachingGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              v25 = objc_msgSend(v14, "count");
              *(_DWORD *)buf = 134217984;
              v38 = v25;
              _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu media-metadata-overflow resources", buf, 0xCu);
            }

            -[PLCloudResourcePrefetchManager _prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:](self, "_prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:", v14, v4, 5, 1);
          }
          v17 = 0;
        }
        if (objc_msgSend(v15, "count"))
        {
          if (!-[PLCloudResourcePrefetchManager _countOfInflightResourcesForPrefetchPhase:](self, "_countOfInflightResourcesForPrefetchPhase:", 5))
          {
            PLResourceCachingGetLog();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              v27 = objc_msgSend(v15, "count");
              *(_DWORD *)buf = 134217984;
              v38 = v27;
              _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch of %lu adjusted-media-metadata-overflow resources", buf, 0xCu);
            }

            -[PLCloudResourcePrefetchManager _prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:](self, "_prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:", v15, v4, 6, 1);
          }
        }
        else if (v17)
        {
          PLResourceCachingGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "No more resources for prefetching", buf, 2u);
          }

          -[PLCloudResourcePrefetchManager _writeDownloadFinishedMarkerIfNeededWithLibrary:](self, "_writeDownloadFinishedMarkerIfNeededWithLibrary:", v4);
        }

      }
    }

  }
}

- (unint64_t)_intentForPrefetchPhase:(unint64_t)a3
{
  unint64_t result;
  void *v6;

  if (self->_prefetchMode == 1)
    return 2;
  result = 3;
  switch(a3)
  {
    case 0uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
      if (self->_prefetchOptimizeMode == 2)
        result = 5;
      else
        result = 1;
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudResourcePrefetchManager.m"), 762, CFSTR("%s should not be invoked for compute sync prefetch phase"), "-[PLCloudResourcePrefetchManager _intentForPrefetchPhase:]");

      goto LABEL_8;
    case 2uLL:
      return result;
    case 3uLL:
      result = 6;
      break;
    default:
LABEL_8:
      result = 0;
      break;
  }
  return result;
}

- (void)_prefetchResources:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 shouldAutoPrefetchNextBatch:(BOOL)a6
{
  id v10;
  NSObject *workQueue;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  unint64_t v29;
  BOOL v30;
  _QWORD v31[4];
  id v32;
  PLCloudResourcePrefetchManager *v33;
  id v34;
  id v35;

  v10 = a3;
  workQueue = self->_workQueue;
  v12 = a4;
  dispatch_assert_queue_V2(workQueue);
  -[PLCloudResourcePrefetchManager _incrementPrefetchCountForPrefetchPhase:resources:photoLibrary:](self, "_incrementPrefetchCountForPrefetchPhase:resources:photoLibrary:", a5, v10, v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v15 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke;
  v31[3] = &unk_1E3677998;
  v32 = v10;
  v33 = self;
  v34 = v13;
  v16 = v14;
  v35 = v16;
  v17 = v13;
  v25 = v10;
  objc_msgSend(v12, "performBlockAndWait:", v31);

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager _prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("start prefetching for phase: %@"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager _enqueueCheckCPLBGDownloadFromNow:withReason:](self, "_enqueueCheckCPLBGDownloadFromNow:withReason:", v19, v22);

  v26[0] = v15;
  v26[1] = 3221225472;
  v26[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_171;
  v26[3] = &unk_1E36707A0;
  v26[4] = self;
  v27 = v18;
  v28 = v16;
  v29 = a5;
  v30 = a6;
  v23 = v16;
  v24 = v18;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v26);

}

- (void)_prefetchComputeSyncResources:(id)a3 photoLibrary:(id)a4 prefetchPhase:(unint64_t)a5 shouldAutoPrefetchNextBatch:(BOOL)a6
{
  id v10;
  NSObject *workQueue;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  unint64_t v28;
  BOOL v29;
  _QWORD v30[4];
  id v31;
  id v32;

  v10 = a3;
  workQueue = self->_workQueue;
  v12 = a4;
  dispatch_assert_queue_V2(workQueue);
  -[PLCloudResourcePrefetchManager _incrementPrefetchCountForPrefetchPhase:resources:photoLibrary:](self, "_incrementPrefetchCountForPrefetchPhase:resources:photoLibrary:", a5, v10, v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v14 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke;
  v30[3] = &unk_1E3677C18;
  v15 = v10;
  v31 = v15;
  v16 = v13;
  v32 = v16;
  objc_msgSend(v12, "performBlockAndWait:", v30);

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager _prefetchComputeSyncResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("start prefetching for phase: %@"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager _enqueueCheckCPLBGDownloadFromNow:withReason:](self, "_enqueueCheckCPLBGDownloadFromNow:withReason:", v18, v21);

  objc_msgSend(v16, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
    v24[0] = v14;
    v24[1] = 3221225472;
    v24[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2;
    v24[3] = &unk_1E36707F0;
    v24[4] = self;
    v25 = v17;
    v28 = a5;
    v26 = v16;
    v27 = v22;
    v29 = a6;
    objc_msgSend(WeakRetained, "fetchComputeStatesForRecordsWithScopedIdentifiers:onDemand:completionHandler:", v27, 0, v24);

  }
}

- (void)_incrementPrefetchCountForPrefetchPhase:(unint64_t)a3 resources:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PLCloudResourcePrefetchManager *v12;
  unint64_t v13;

  v8 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __97__PLCloudResourcePrefetchManager__incrementPrefetchCountForPrefetchPhase_resources_photoLibrary___block_invoke;
  v10[3] = &unk_1E3677C40;
  v12 = self;
  v13 = a3;
  v11 = v8;
  v9 = v8;
  objc_msgSend(a5, "performTransactionAndWait:", v10);

}

- (void)_handlePrefetchError:(id)a3 forPLCloudResourceWithObjectID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "domain");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D11268]))
    goto LABEL_4;
  v8 = objc_msgSend(v11, "code");

  if (v8 == 27)
  {
    -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", "-[PLCloudResourcePrefetchManager _handlePrefetchError:forPLCloudResourceWithObjectID:]");

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __86__PLCloudResourcePrefetchManager__handlePrefetchError_forPLCloudResourceWithObjectID___block_invoke;
    v12[3] = &unk_1E3677C18;
    v13 = v10;
    v14 = v6;
    v7 = v10;
    objc_msgSend(v7, "performTransactionAndWait:", v12);

LABEL_4:
  }

}

- (id)_volumeInfo
{
  PLVolumeInfo *volumeInfo;
  id v4;
  void *v5;
  void *v6;
  PLVolumeInfo *v7;
  PLVolumeInfo *v8;

  volumeInfo = self->_volumeInfo;
  if (!volumeInfo)
  {
    v4 = objc_alloc(MEMORY[0x1E0D73318]);
    -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoDirectoryWithType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (PLVolumeInfo *)objc_msgSend(v4, "initWithPath:", v6);
    v8 = self->_volumeInfo;
    self->_volumeInfo = v7;

    volumeInfo = self->_volumeInfo;
  }
  return volumeInfo;
}

- (int64_t)_diskSpaceBudgetForPrefetchPhase:(unint64_t)a3
{
  return -[PLCloudResourcePrefetchManager _diskSpaceBudgetForPrefetchPhase:prefetchOptimizeMode:](self, "_diskSpaceBudgetForPrefetchPhase:prefetchOptimizeMode:", a3, self->_prefetchOptimizeMode);
}

- (int64_t)_diskSpaceBudgetForPrefetchPhase:(unint64_t)a3 prefetchOptimizeMode:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  double v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[PLCloudResourcePrefetchManager _volumeInfo](self, "_volumeInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "nearLowDiskThreshold");
  if (a3 > 6)
  {
    v9 = 0;
    goto LABEL_5;
  }
  v9 = v8;
  if (((1 << a3) & 0x6E) == 0)
  {
    if (!a3)
      goto LABEL_5;
    v9 = 0x40000000;
    if (self->_prefetchMode != 1 && a4 != 2 && !self->_lastCompletePrefetchDate)
    {
      -[PLPrefetchConfiguration cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio](self->_prefetchConfiguration, "cloudResourceInitialMinimumFreeDiskSpaceForOptimizeRatio");
      v9 = (uint64_t)(v15 * (double)(unint64_t)objc_msgSend(v7, "volumeSize"));
    }
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerForKey:", CFSTR("PLPrefetchMinimumFreeDiskGB"));

  if (v11 > 0)
    v9 = v11 << 30;
LABEL_5:
  v12 = objc_msgSend(v7, "availableSpace");
  v13 = (v12 - v9) & ~((v12 - v9) >> 63);

  return v13;
}

- (int64_t)_totalSizeOfOriginalResourcesForPrefetchWithPredicate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  int64_t v19;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  SEL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = -1;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setResultType:", 2);
  objc_msgSend(v8, "setPredicate:", v5);
  v9 = objc_alloc_init(MEMORY[0x1E0C97B30]);
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("dataLength"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", CFSTR("dataLength"));
  v11 = (void *)MEMORY[0x1E0CB35D0];
  v31[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expressionForFunction:arguments:", CFSTR("sum:"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setExpression:", v13);

  objc_msgSend(v9, "setExpressionResultType:", 300);
  v30 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v14);

  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "newShortLivedLibraryWithName:", "-[PLCloudResourcePrefetchManager _totalSizeOfOriginalResourcesForPrefetchWithPredicate:]");

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__PLCloudResourcePrefetchManager__totalSizeOfOriginalResourcesForPrefetchWithPredicate___block_invoke;
  v21[3] = &unk_1E3674DF8;
  v17 = v16;
  v22 = v17;
  v18 = v8;
  v23 = v18;
  v24 = &v26;
  v25 = a2;
  objc_msgSend(v17, "performBlockAndWait:", v21);
  v19 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v19;
}

- (int64_t)_totalSizeOfOriginalResources
{
  void *v3;
  int64_t v4;

  +[PLCloudResourcePrefetchPredicates predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:](PLCloudResourcePrefetchPredicates, "predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLCloudResourcePrefetchManager _totalSizeOfOriginalResourcesForPrefetchWithPredicate:](self, "_totalSizeOfOriginalResourcesForPrefetchWithPredicate:", v3);

  return v4;
}

- (int64_t)_totalSizeOfLocallyAvailableOriginalResources
{
  void *v3;
  int64_t v4;

  +[PLCloudResourcePrefetchPredicates predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:](PLCloudResourcePrefetchPredicates, "predicateForOriginalResourcesForPrefetchLocallyAvailableOnly:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLCloudResourcePrefetchManager _totalSizeOfOriginalResourcesForPrefetchWithPredicate:](self, "_totalSizeOfOriginalResourcesForPrefetchWithPredicate:", v3);

  return v4;
}

- (unint64_t)_smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  if (MEMORY[0x19AEC04BC](self, a2))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerForKey:", CFSTR("PLPrefetchMaximumSmallLibraryThresholdGB"));

  }
  else
  {
    v6 = 0;
  }
  -[PLCloudResourcePrefetchManager _volumeInfo](self, "_volumeInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLPrefetchConfiguration smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumThresholdGB:](self->_prefetchConfiguration, "smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumThresholdGB:", a3, objc_msgSend(v7, "availableSpace"), v6);

  return v8;
}

- (int64_t)_prefetchOptimizeModeBasedOnLibrarySize
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int64_t v8;
  void *v10;

  +[PLPrefetchConfiguration overridePrefetchOptimizeMode](PLPrefetchConfiguration, "overridePrefetchOptimizeMode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
  }
  else
  {
    if (!self->_prefetchMode)
    {
      if (MEMORY[0x19AEC04BC]())
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "integerForKey:", CFSTR("PLPrefetchMaximumSmallLibraryThresholdGB"));

      }
      else
      {
        v7 = 0;
      }
      if (-[PLPrefetchConfiguration cloudResourceMaximumSmallLibraryThreshold](self->_prefetchConfiguration, "cloudResourceMaximumSmallLibraryThreshold") | v7)
      {
        -[PLCloudResourcePrefetchManager _volumeInfo](self, "_volumeInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[PLPrefetchConfiguration prefetchOptimizeModeForTotalSizeOfOriginalResources:totalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumSmallLibraryThresholdGB:nonThumbnailsBudget:](self->_prefetchConfiguration, "prefetchOptimizeModeForTotalSizeOfOriginalResources:totalSizeOfLocallyAvailableOriginalResources:availableSpace:overrideMaximumSmallLibraryThresholdGB:nonThumbnailsBudget:", -[PLCloudResourcePrefetchManager _totalSizeOfOriginalResources](self, "_totalSizeOfOriginalResources"), -[PLCloudResourcePrefetchManager _totalSizeOfLocallyAvailableOriginalResources](self, "_totalSizeOfLocallyAvailableOriginalResources"), objc_msgSend(v10, "availableSpace"), v7, -[PLCloudResourcePrefetchManager _diskSpaceBudgetForPrefetchPhase:prefetchOptimizeMode:](self, "_diskSpaceBudgetForPrefetchPhase:prefetchOptimizeMode:", 4, 2));

        goto LABEL_10;
      }
    }
    v5 = +[PLPrefetchConfiguration defaultPrefetchOptimizeMode](PLPrefetchConfiguration, "defaultPrefetchOptimizeMode");
  }
  v8 = v5;
LABEL_10:

  return v8;
}

- (id)_lastCompletePrefetchDateInLibrary:(id)a3
{
  id v4;
  NSDate *lastCompletePrefetchDate;
  void *v6;
  NSDate *v7;
  NSDate *v8;
  NSDate *v9;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  lastCompletePrefetchDate = self->_lastCompletePrefetchDate;
  if (!lastCompletePrefetchDate)
  {
    objc_msgSend(v4, "globalValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastCompletePrefetchDate");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v8 = self->_lastCompletePrefetchDate;
    self->_lastCompletePrefetchDate = v7;

    lastCompletePrefetchDate = self->_lastCompletePrefetchDate;
  }
  v9 = lastCompletePrefetchDate;

  return v9;
}

- (void)_setLastCompletePrefetchDate:(id)a3 inLibrary:(id)a4
{
  NSDate *v6;
  NSObject *workQueue;
  id v8;
  void *v9;
  NSDate *lastCompletePrefetchDate;

  v6 = (NSDate *)a3;
  workQueue = self->_workQueue;
  v8 = a4;
  dispatch_assert_queue_V2(workQueue);
  objc_msgSend(v8, "globalValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setLastCompletePrefetchDate:", v6);
  lastCompletePrefetchDate = self->_lastCompletePrefetchDate;
  self->_lastCompletePrefetchDate = v6;

}

- (BOOL)_prefetchIsEnabledForPhase:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "_prefetchIsEnabledForPhase:givenMode:andInitialSyncDate:", a3, self->_prefetchMode, self->_initialSyncDate);
}

- (id)_resourcesToPrefetchWithPrefetchPhase:(unint64_t)a3 photoLibrary:(id)a4 applyPerPrefetchLimit:(BOOL)a5 initialBudget:(int64_t *)a6
{
  id v10;
  int64_t v11;
  void *v12;
  void *v13;
  int64_t prefetchMode;
  int64_t prefetchOptimizeMode;
  NSDate *initialSyncDate;
  BOOL isWalrusEnabled;
  PLPrefetchConfiguration *prefetchConfiguration;
  id v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a4;
  v11 = -[PLCloudResourcePrefetchManager _diskSpaceBudgetForPrefetchPhase:](self, "_diskSpaceBudgetForPrefetchPhase:", a3);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__70520;
  v28 = __Block_byref_object_dispose__70521;
  v29 = 0;
  -[PLCloudResourcePrefetchManager _lastCompletePrefetchDateInLibrary:](self, "_lastCompletePrefetchDateInLibrary:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  prefetchMode = self->_prefetchMode;
  prefetchOptimizeMode = self->_prefetchOptimizeMode;
  initialSyncDate = self->_initialSyncDate;
  isWalrusEnabled = self->_isWalrusEnabled;
  prefetchConfiguration = self->_prefetchConfiguration;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __121__PLCloudResourcePrefetchManager__resourcesToPrefetchWithPrefetchPhase_photoLibrary_applyPerPrefetchLimit_initialBudget___block_invoke;
  v23[3] = &unk_1E3670840;
  v23[4] = &v24;
  LOBYTE(v22) = a5;
  LOBYTE(v21) = isWalrusEnabled;
  objc_msgSend(v13, "resourcesToPrefetchWithPrefetchPhase:prefetchMode:prefetchOptimizeMode:initialSyncDate:lastCompletePrefetchDate:initialBudget:excludeDynamicCPLResources:prefetchConfiguration:photoLibrary:applyPerPrefetchLimit:completionHandler:", a3, prefetchMode, prefetchOptimizeMode, initialSyncDate, v12, v11, v21, prefetchConfiguration, v10, v22, v23);
  if (a6)
    *a6 = v11;
  v19 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchConfiguration, 0);
  objc_storeStrong((id *)&self->_lastCompletePrefetchDate, 0);
  objc_storeStrong((id *)&self->_initialSyncDate, 0);
  objc_storeStrong((id *)&self->_volumeInfo, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_lastCheckCPLBGDownloadDate, 0);
  objc_storeStrong((id *)&self->_inflightResources, 0);
  objc_destroyWeak((id *)&self->_pruneManager);
  objc_destroyWeak((id *)&self->_cplManager);
  objc_storeStrong((id *)&self->_lsm, 0);
}

void __121__PLCloudResourcePrefetchManager__resourcesToPrefetchWithPrefetchPhase_photoLibrary_applyPerPrefetchLimit_initialBudget___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __88__PLCloudResourcePrefetchManager__totalSizeOfOriginalResourcesForPrefetchWithPredicate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v9 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (!v4)
  {
    PLResourceCachingGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "%@: failed to calculate total resource size: %@", buf, 0x16u);

    }
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("dataLength"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "longLongValue");

LABEL_6:
  }

}

void __86__PLCloudResourcePrefetchManager__handlePrefetchError_forPLCloudResourceWithObjectID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (int)objc_msgSend(v3, "remoteAvailability") >= 1)
  {
    PLResourceCachingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Setting %@ as unavailable", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(v3, "setRemoteAvailability:", 0);
  }

}

void __97__PLCloudResourcePrefetchManager__incrementPrefetchCountForPrefetchPhase_resources_photoLibrary___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v6);
        v8 = *(_QWORD *)(a1 + 48);
        if (v8 <= 6)
        {
          if (v8 == 2)
            v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "cloudResourceMaxPrefetchRetry", (_QWORD)v12);
          else
            v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v6), "cloudPrefetchCount");
          objc_msgSend(v7, "setCloudPrefetchCount:", (__int16)(v9 + 1), (_QWORD)v12);
        }
        objc_msgSend(MEMORY[0x1E0C99D68], "date", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setCloudLastPrefetchDate:", v10);

        ++v6;
      }
      while (v4 != v6);
      v11 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v4 = v11;
    }
    while (v11);
  }

}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x19AEC1554](v3);
        objc_msgSend(v7, "scopedIdentifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v7, "objectID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v10, v9);

        }
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = v3;
    }
    while (v3);
  }

}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_3;
  v11[3] = &unk_1E3670750;
  v12 = v6;
  v13 = v7;
  v17 = *(_QWORD *)(a1 + 64);
  v14 = *(id *)(a1 + 48);
  v15 = v5;
  v16 = *(id *)(a1 + 56);
  v18 = *(_BYTE *)(a1 + 72);
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "_runOnWorkQueueWithTransaction:block:", v8, v11);

}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    PLResourceCachingGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", *(_QWORD *)(a1 + 72));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v26 = (uint64_t)v3;
      v27 = 2112;
      v28 = v4;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "[CCSS] Failed to prefetch ComputeSync resources (phase: %@) error: %@", buf, 0x16u);

    }
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(a1 + 40), "_handlePrefetchError:forPLCloudResourceWithObjectID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudResourcePrefetchManager _prefetchComputeSyncResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:]_block_invoke");

  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2_181;
    v16[3] = &unk_1E3677530;
    v17 = *(id *)(a1 + 56);
    v18 = *(id *)(a1 + 48);
    v19 = v11;
    objc_msgSend(v19, "performTransactionAndWait:", v16);

    v12 = v17;
  }
  else
  {
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_18;
    __CPLAssetsdOSLogDomain();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_msgSend(*(id *)(a1 + 64), "count");
      *(_DWORD *)buf = 134217984;
      v26 = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "[CCSS] No compute sync resources returned in batch of size %lu", buf, 0xCu);
    }
  }

LABEL_18:
  if (*(_BYTE *)(a1 + 80))
  {
    PLResourceCachingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", *(_QWORD *)(a1 + 72));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = (uint64_t)v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "No more compute sync resource downloads for phase: %{public}@, checking additional resources for prefetch", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "_startPrefetchNextBatch");
  }

}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2_181(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_3_182;
  v3[3] = &unk_1E36707C8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v3);

}

void __119__PLCloudResourcePrefetchManager__prefetchComputeSyncResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_3_182(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  NSObject *v34;
  __int16 v35;
  NSObject *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "existingObjectWithID:error:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v7, *(_QWORD *)(a1 + 40), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 && v10)
  {
    objc_msgSend(v13, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v16 = objc_msgSend(v11, "copyComputeSyncResourceFromCPLFilePath:error:", v15, &v30);
    v17 = v30;

    if (v16)
    {
      objc_msgSend(v11, "updateComputeSyncResourceAfterDownloadWithResource:onDemandDownload:", v10, 0);
      v29 = 0;
      v18 = objc_msgSend(v11, "applyComputeSyncPayloadWithComputeStateRecord:originatedFromPrefetch:error:", v5, 1, &v29);
      v19 = v29;
      if (v18)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "scopedIdentifier");
            v21 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v32 = v5;
            v33 = 2114;
            v34 = v21;
            v22 = "[CCSS] Applied compute sync record %@ to asset %{public}@ using payload helper";
            v23 = v20;
            v24 = OS_LOG_TYPE_DEFAULT;
            v25 = 22;
LABEL_22:
            _os_log_impl(&dword_199541000, v23, v24, v22, buf, v25);

            goto LABEL_23;
          }
          goto LABEL_23;
        }
      }
      else if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "scopedIdentifier");
          v21 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v32 = v5;
          v33 = 2114;
          v34 = v21;
          v35 = 2112;
          v36 = v19;
          v22 = "[CCSS] Failed to apply compute sync record %@ to asset %{public}@ using payload helper error: %@";
          v23 = v20;
          v24 = OS_LOG_TYPE_ERROR;
          v25 = 32;
          goto LABEL_22;
        }
LABEL_23:

      }
LABEL_24:

      goto LABEL_25;
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "scopedIdentifier");
        v20 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = v5;
        v33 = 2114;
        v34 = v20;
        v35 = 2112;
        v36 = v17;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "[CCSS] Failed to copy compute sync record %@ to asset %{public}@ using payload helper error: %@", buf, 0x20u);
        goto LABEL_23;
      }
      goto LABEL_24;
    }
LABEL_25:

    goto LABEL_26;
  }

  if (v14)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      objc_msgSend(v11, "scopedIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v5;
      v33 = 2114;
      v34 = v19;
      v35 = 2114;
      v36 = v8;
      v26 = "[CCSS] No compute sync wrapper resource found %@ for asset: %{public}@, resource: %{public}@";
      v27 = v17;
      v28 = 32;
LABEL_18:
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);
      goto LABEL_24;
    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    objc_msgSend(v11, "scopedIdentifier");
    v19 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v32 = v5;
    v33 = 2114;
    v34 = v19;
    v26 = "[CCSS] ComputeStateRecord contains nil fileURL unexpectedly %@ for asset %{public}@";
    v27 = v17;
    v28 = 22;
    goto LABEL_18;
  }
LABEL_26:

}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "dataLength");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v4);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a1[4];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        v13 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v12, "cplResourceIncludeFile:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend((id)objc_opt_class(), "_identifierForResourceDownload:", v12);
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v14, v15);
          objc_msgSend(a1[7], "setObject:forKeyedSubscript:", v16, v15);

        }
        else
        {
          PLResourceCachingGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v12;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Unable to create CPLResource from %@", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v9);
  }

}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_171(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  char v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "_isInflightResourceIdentifier:", v5) & 1) != 0)
  {
    PLResourceCachingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", *(_QWORD *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v6;
      v33 = 2112;
      v34 = v5;
      v35 = 2112;
      v36 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Skip prefetching %@ [%@] which is already inflight (phase: %@)", buf, 0x20u);

    }
  }
  else
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D11458]), "initWithIntent:priority:", objc_msgSend(*(id *)(a1 + 32), "_intentForPrefetchPhase:", *(_QWORD *)(a1 + 56)), 2);
    PLResourceCachingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", *(_QWORD *)(a1 + 56));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v32 = v10;
      v33 = 2112;
      v34 = v6;
      v35 = 2112;
      v36 = v5;
      v37 = 2112;
      v38 = v7;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Start prefetching (phase: %@) %@ [%@] %@", buf, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 32), "_addInflightResourceIdentifier:prefetchPhase:", v5, *(_QWORD *)(a1 + 56));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    v12 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_175;
    v26[3] = &unk_1E3670728;
    v13 = *(void **)(a1 + 40);
    v26[4] = *(_QWORD *)(a1 + 32);
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 56);
    v27 = v14;
    v30 = v15;
    v28 = v6;
    v29 = v5;
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_177;
    v19[3] = &unk_1E3670778;
    v16 = *(void **)(a1 + 40);
    v19[4] = *(_QWORD *)(a1 + 32);
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 56);
    v20 = v17;
    v24 = v18;
    v21 = v28;
    v22 = v29;
    v23 = *(id *)(a1 + 48);
    v25 = *(_BYTE *)(a1 + 64);
    objc_msgSend(WeakRetained, "downloadResource:options:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", v21, v7, CFSTR("com.apple.mobileslideshow"), 0, v26, 0, v19);

  }
}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_175(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;

  v5 = a4;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2;
  v9[3] = &unk_1E36710D8;
  v10 = v5;
  v11 = v6;
  v14 = *(_QWORD *)(a1 + 64);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v8 = v5;
  objc_msgSend(v6, "_runOnWorkQueueWithTransaction:block:", v7, v9);

}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_177(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;

  v6 = a5;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2_178;
  v10[3] = &unk_1E3670750;
  v11 = v6;
  v12 = v7;
  v16 = *(_QWORD *)(a1 + 72);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v17 = *(_BYTE *)(a1 + 80);
  v9 = v6;
  objc_msgSend(v7, "_runOnWorkQueueWithTransaction:block:", v8, v10);

}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2_178(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    PLResourceCachingGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", *(_QWORD *)(a1 + 72));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 48);
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(void **)(a1 + 32);
      v15 = 138413058;
      v16 = v3;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Failed to prefetch (phase: %@) %@ [%@]: %@", (uint8_t *)&v15, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_handlePrefetchError:forPLCloudResourceWithObjectID:", *(_QWORD *)(a1 + 32), v7);

  }
  objc_msgSend(*(id *)(a1 + 40), "_removeInflightResourceIdentifier:prefetchPhase:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  PLResourceCachingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11 = objc_msgSend(*(id *)(a1 + 40), "_countOfInflightResourcesForPrefetchPhase:", *(_QWORD *)(a1 + 72));
    objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", *(_QWORD *)(a1 + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413058;
    v16 = v10;
    v17 = 2112;
    v18 = v9;
    v19 = 2048;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Removing %@ [%@] from %ld inflight prefetched resources (phase: %@).", (uint8_t *)&v15, 0x2Au);

  }
  if (*(_BYTE *)(a1 + 80))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_countOfInflightResourcesForPrefetchPhase:", *(_QWORD *)(a1 + 72)))
    {
      objc_msgSend(*(id *)(a1 + 40), "_checkCPLBackgroundDownloadOperations");
    }
    else
    {
      PLResourceCachingGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", *(_QWORD *)(a1 + 72));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "No more inflight resource downloads for phase: %@, checking additional resources for prefetch", (uint8_t *)&v15, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 40), "_startPrefetchNextBatch");
    }
  }
}

void __108__PLCloudResourcePrefetchManager__prefetchResources_photoLibrary_prefetchPhase_shouldAutoPrefetchNextBatch___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  PLResourceCachingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", *(_QWORD *)(a1 + 64));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138413058;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to start prefetching (phase: %@) %@ [%@]: %@", (uint8_t *)&v12, 0x2Au);

    }
    objc_msgSend(*(id *)(a1 + 40), "_removeInflightResourceIdentifier:prefetchPhase:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(void **)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 56);
      v11 = objc_msgSend(*(id *)(a1 + 40), "_countOfInflightResourcesForPrefetchPhase:", *(_QWORD *)(a1 + 64));
      v12 = 138412802;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Adding %@ [%@] to %ld inflight prefetched resources", (uint8_t *)&v12, 0x20u);
    }

  }
}

void __52__PLCloudResourcePrefetchManager_clearPrefetchState__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PLCloudResourcePrefetchManager_clearPrefetchState__block_invoke_2;
  v9[3] = &unk_1E3677C18;
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v4;
  objc_msgSend(v3, "performTransactionAndWait:", v9);
  PLResourceCachingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Deleting cpl_download_finished_marker", v8, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indicatorFileCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "deleteCPLDownloadFinishedMarkerFilePath");
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

uint64_t __52__PLCloudResourcePrefetchManager_clearPrefetchState__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v5[16];

  PLResourceCachingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Resetting cloud resources state", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLInternalResource resetCloudResourcesStateForCloudInManagedObjectContext:hardReset:](PLInternalResource, "resetCloudResourcesStateForCloudInManagedObjectContext:hardReset:", v3, 0);

  return objc_msgSend(*(id *)(a1 + 40), "_setLastCompletePrefetchDate:inLibrary:", 0, *(_QWORD *)(a1 + 32));
}

uint64_t __71__PLCloudResourcePrefetchManager__removeAllInflightResourceIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeAllObjects");
}

uint64_t __64__PLCloudResourcePrefetchManager__isInflightResourceIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a4 = 1;
  return result;
}

uint64_t __65__PLCloudResourcePrefetchManager__allInflightResourceIdentifiers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:");
}

uint64_t __62__PLCloudResourcePrefetchManager__countOfAllInflightResources__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __71__PLCloudResourcePrefetchManager__runOnWorkQueueWithTransaction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __111__PLCloudResourcePrefetchManager_prefetchResourcesWithPredicates_photoLibrary_prefetchPhase_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resourcesWithPredicate:limit:context:", v3, 0xFFFFFFFFLL, v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __111__PLCloudResourcePrefetchManager_prefetchResourcesWithPredicates_photoLibrary_prefetchPhase_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_prefetchResources:photoLibrary:prefetchPhase:shouldAutoPrefetchNextBatch:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), 0);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __58__PLCloudResourcePrefetchManager__prefetchStatusForDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t m;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t n;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t ii;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t jj;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t kk;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t mm;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  id obje;
  id objf;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 112), 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 120), 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 128), 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 136), 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 144), 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 152), 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", *(_QWORD *)(a1 + 160), 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_lastCompletePrefetchDateInLibrary:", *(_QWORD *)(a1 + 48));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("(Incremental)");
  if (!v10)
    v11 = CFSTR("(Initial)");
  objc_msgSend(v2, "appendFormat:", CFSTR("Disk space budget: Thumbnails: %@ Memories: %@ Widget: %@ Non-Thumbnails: %@ ComputeSync: %@ MediaMetadataOverflow: %@ FullSizeResourceMediaMetadataOverflow: %@ %@\n"), v3, v4, v5, v6, v7, v8, v9, v11);

  if (objc_msgSend(*(id *)(a1 + 40), "_isPrefetchDisabled"))
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Prefetch disabled\n"));
  v12 = *(_QWORD **)(a1 + 40);
  v13 = v12[5];
  if (v13 >= 2)
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchMode:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appendFormat:", CFSTR("Prefetch Mode: %@\n"), v15);

    v12 = *(_QWORD **)(a1 + 40);
    v13 = v12[5];
  }
  if (!v13)
  {
    v16 = objc_msgSend(v12, "_totalSizeOfOriginalResources");
    v17 = objc_msgSend(*(id *)(a1 + 40), "_totalSizeOfLocallyAvailableOriginalResources");
    v18 = objc_msgSend(*(id *)(a1 + 40), "_smallLibrarySizeThresholdForTotalSizeOfLocallyAvailableOriginalResources:", v17);
    v19 = *(void **)(a1 + 32);
    +[PLPrefetchConfiguration descriptionForPrefetchOptimizeMode:](PLPrefetchConfiguration, "descriptionForPrefetchOptimizeMode:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v16, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v17, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v18, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "appendFormat:", CFSTR("Prefetch Optimize Mode (non-thumbnail): %@ (original resources: %@, local original resources: %@ small-library threshold: %@)\n"), v20, v21, v22, v23);

    v24 = *(void **)(a1 + 32);
    +[PLPrefetchConfiguration descriptionForPrefetchOptimizeMode:](PLPrefetchConfiguration, "descriptionForPrefetchOptimizeMode:", +[PLPrefetchConfiguration defaultPrefetchOptimizeMode](PLPrefetchConfiguration, "defaultPrefetchOptimizeMode"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "appendFormat:", CFSTR("Prefetch Optimize Mode (memories/widget): %@\n"), v25);

    v12 = *(_QWORD **)(a1 + 40);
  }
  if (objc_msgSend(v12, "_prefetchIsEnabledForPhase:", 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Will prefetch %ld thumbnail resources:\n"), objc_msgSend(*(id *)(a1 + 56), "count"));
    if (*(_BYTE *)(a1 + 168))
    {
      if (objc_msgSend(*(id *)(a1 + 56), "count"))
      {
        v148 = 0u;
        v149 = 0u;
        v146 = 0u;
        v147 = 0u;
        obj = *(id *)(a1 + 56);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v157, 16);
        if (v26)
        {
          v27 = v26;
          v111 = *(_QWORD *)v147;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v147 != v111)
                objc_enumerationMutation(obj);
              v29 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
              v30 = *(void **)(a1 + 32);
              objc_msgSend(v29, "asset");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "uuid");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v32, objc_msgSend(v29, "version"), objc_msgSend(v29, "cplType"), objc_msgSend(v29, "recipeID"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "appendFormat:", CFSTR("  %@\n"), v33);

            }
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v146, v157, 16);
          }
          while (v27);
        }

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_prefetchIsEnabledForPhase:", 2))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Will prefetch %ld memories resources:\n"), objc_msgSend(*(id *)(a1 + 64), "count"));
    if (*(_BYTE *)(a1 + 168))
    {
      if (objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        obja = *(id *)(a1 + 64);
        v34 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
        if (v34)
        {
          v35 = v34;
          v112 = *(_QWORD *)v143;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v143 != v112)
                objc_enumerationMutation(obja);
              v37 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * j);
              v38 = *(void **)(a1 + 32);
              objc_msgSend(v37, "asset");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "uuid");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v40, objc_msgSend(v37, "version"), objc_msgSend(v37, "cplType"), objc_msgSend(v37, "recipeID"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "appendFormat:", CFSTR("  %@\n"), v41);

            }
            v35 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v142, v156, 16);
          }
          while (v35);
        }

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_prefetchIsEnabledForPhase:", 3))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Will prefetch %ld widget resources:\n"), objc_msgSend(*(id *)(a1 + 72), "count"));
    if (*(_BYTE *)(a1 + 168))
    {
      if (objc_msgSend(*(id *)(a1 + 72), "count"))
      {
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        objb = *(id *)(a1 + 72);
        v42 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
        if (v42)
        {
          v43 = v42;
          v113 = *(_QWORD *)v139;
          do
          {
            for (k = 0; k != v43; ++k)
            {
              if (*(_QWORD *)v139 != v113)
                objc_enumerationMutation(objb);
              v45 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * k);
              v46 = *(void **)(a1 + 32);
              objc_msgSend(v45, "asset");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "uuid");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v48, objc_msgSend(v45, "version"), objc_msgSend(v45, "cplType"), objc_msgSend(v45, "recipeID"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "appendFormat:", CFSTR("  %@\n"), v49);

            }
            v43 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v138, v155, 16);
          }
          while (v43);
        }

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_prefetchIsEnabledForPhase:", 4))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Will prefetch %ld non-thumbnail resources:\n"), objc_msgSend(*(id *)(a1 + 80), "count"));
    if (*(_BYTE *)(a1 + 168))
    {
      if (objc_msgSend(*(id *)(a1 + 80), "count"))
      {
        v136 = 0u;
        v137 = 0u;
        v134 = 0u;
        v135 = 0u;
        objc = *(id *)(a1 + 80);
        v50 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v134, v154, 16);
        if (v50)
        {
          v51 = v50;
          v114 = *(_QWORD *)v135;
          do
          {
            for (m = 0; m != v51; ++m)
            {
              if (*(_QWORD *)v135 != v114)
                objc_enumerationMutation(objc);
              v53 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * m);
              v54 = *(void **)(a1 + 32);
              objc_msgSend(v53, "asset");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "uuid");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v56, objc_msgSend(v53, "version"), objc_msgSend(v53, "cplType"), objc_msgSend(v53, "recipeID"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "appendFormat:", CFSTR("  %@\n"), v57);

            }
            v51 = objc_msgSend(objc, "countByEnumeratingWithState:objects:count:", &v134, v154, 16);
          }
          while (v51);
        }

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_prefetchIsEnabledForPhase:", 1))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Will prefetch %ld compute-sync resources:\n"), objc_msgSend(*(id *)(a1 + 88), "count"));
    if (*(_BYTE *)(a1 + 168))
    {
      if (objc_msgSend(*(id *)(a1 + 88), "count"))
      {
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        objd = *(id *)(a1 + 88);
        v58 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v130, v153, 16);
        if (v58)
        {
          v59 = v58;
          v115 = *(_QWORD *)v131;
          do
          {
            for (n = 0; n != v59; ++n)
            {
              if (*(_QWORD *)v131 != v115)
                objc_enumerationMutation(objd);
              v61 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * n);
              v62 = *(void **)(a1 + 32);
              objc_msgSend(v61, "asset");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "uuid");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v64, objc_msgSend(v61, "version"), objc_msgSend(v61, "cplType"), objc_msgSend(v61, "recipeID"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "appendFormat:", CFSTR("  %@\n"), v65);

            }
            v59 = objc_msgSend(objd, "countByEnumeratingWithState:objects:count:", &v130, v153, 16);
          }
          while (v59);
        }

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_prefetchIsEnabledForPhase:", 5))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Will prefetch %ld media-metadata-overflow resources:\n"), objc_msgSend(*(id *)(a1 + 96), "count"));
    if (*(_BYTE *)(a1 + 168))
    {
      if (objc_msgSend(*(id *)(a1 + 96), "count"))
      {
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        obje = *(id *)(a1 + 96);
        v66 = objc_msgSend(obje, "countByEnumeratingWithState:objects:count:", &v126, v152, 16);
        if (v66)
        {
          v67 = v66;
          v116 = *(_QWORD *)v127;
          do
          {
            for (ii = 0; ii != v67; ++ii)
            {
              if (*(_QWORD *)v127 != v116)
                objc_enumerationMutation(obje);
              v69 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * ii);
              v70 = *(void **)(a1 + 32);
              objc_msgSend(v69, "asset");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v71, "uuid");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v72, objc_msgSend(v69, "version"), objc_msgSend(v69, "cplType"), objc_msgSend(v69, "recipeID"));
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "appendFormat:", CFSTR("  %@\n"), v73);

            }
            v67 = objc_msgSend(obje, "countByEnumeratingWithState:objects:count:", &v126, v152, 16);
          }
          while (v67);
        }

      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_prefetchIsEnabledForPhase:", 6))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Will prefetch %ld adjusted-media-metadata-overflow resources:\n"), objc_msgSend(*(id *)(a1 + 104), "count"));
    if (*(_BYTE *)(a1 + 168))
    {
      if (objc_msgSend(*(id *)(a1 + 104), "count"))
      {
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        objf = *(id *)(a1 + 104);
        v74 = objc_msgSend(objf, "countByEnumeratingWithState:objects:count:", &v122, v151, 16);
        if (v74)
        {
          v75 = v74;
          v117 = *(_QWORD *)v123;
          do
          {
            for (jj = 0; jj != v75; ++jj)
            {
              if (*(_QWORD *)v123 != v117)
                objc_enumerationMutation(objf);
              v77 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * jj);
              v78 = *(void **)(a1 + 32);
              objc_msgSend(v77, "asset");
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v79, "uuid");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLPrefetchResourceIdentifier resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:](PLPrefetchResourceIdentifier, "resourceDescriptionWithAssetUuid:resourceVersion:cplType:recipeID:", v80, objc_msgSend(v77, "version"), objc_msgSend(v77, "cplType"), objc_msgSend(v77, "recipeID"));
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v78, "appendFormat:", CFSTR("  %@\n"), v81);

            }
            v75 = objc_msgSend(objf, "countByEnumeratingWithState:objects:count:", &v122, v151, 16);
          }
          while (v75);
        }

      }
    }
  }
  v82 = objc_msgSend(*(id *)(a1 + 40), "_countOfAllInflightResources");
  if (v82)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("In-flight resources: %lu\n"), v82);
    for (kk = 0; kk != 5; ++kk)
    {
      v84 = objc_msgSend(*(id *)(a1 + 40), "_countOfInflightResourcesForPrefetchPhase:", kk);
      if (v84)
      {
        v85 = v84;
        v86 = *(void **)(a1 + 32);
        objc_msgSend((id)objc_opt_class(), "descriptionForPrefetchPhase:", kk);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "appendFormat:", CFSTR("In-flight %@ resources: %ld\n"), v87, v85);

        if (*(_BYTE *)(a1 + 168))
        {
          v120 = 0u;
          v121 = 0u;
          v118 = 0u;
          v119 = 0u;
          objc_msgSend(*(id *)(a1 + 40), "_inflightResourceIdentifiersForPrefetchPhase:", kk);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v118, v150, 16);
          if (v89)
          {
            v90 = v89;
            v91 = *(_QWORD *)v119;
            do
            {
              for (mm = 0; mm != v90; ++mm)
              {
                if (*(_QWORD *)v119 != v91)
                  objc_enumerationMutation(v88);
                objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("  %@\n"), *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * mm));
              }
              v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v118, v150, 16);
            }
            while (v90);
          }

        }
      }
    }
  }
  +[PLMemory memoriesToPrefetchInPhotoLibrary:prefetchConfiguration:](PLMemory, "memoriesToPrefetchInPhotoLibrary:prefetchConfiguration:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v93, "count"))
  {
    v94 = *(void **)(a1 + 32);
    objc_msgSend(v93, "valueForKey:", CFSTR("uuid"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "appendFormat:", CFSTR("Will prefetch memories with UUIDs: %@\n"), v95);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "_prefetchIsEnabledForPhase:", 3))
  {
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSuggestion suggestionsToPrefetchInManagedObjectContext:](PLSuggestion, "suggestionsToPrefetchInManagedObjectContext:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v97, "count"))
    {
      v98 = *(void **)(a1 + 32);
      objc_msgSend(v97, "valueForKey:", CFSTR("uuid"));
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "appendFormat:", CFSTR("Will prefetch widget suggestions with UUIDs: %@\n"), v99);

    }
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLMemory memoriesToPrefetchForWidgetInManagedObjectContext:](PLMemory, "memoriesToPrefetchForWidgetInManagedObjectContext:", v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v101, "count"))
    {
      v102 = *(void **)(a1 + 32);
      objc_msgSend(v101, "valueForKey:", CFSTR("uuid"));
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "appendFormat:", CFSTR("Will prefetch widget memories with UUIDs: %@\n"), v103);

    }
  }

}

void __57__PLCloudResourcePrefetchManager_prefetchStatusForDebug___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_prefetchStatusForDebug:", *(unsigned __int8 *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __38__PLCloudResourcePrefetchManager_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLResourceCachingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_countOfAllInflightResources");
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Stopping prefetching, %ld inflight resources.", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cleanupInflightResourcesInLibrary:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setLastCompletePrefetchDate:inLibrary:", 0, *(_QWORD *)(a1 + 40));
}

void __69__PLCloudResourcePrefetchManager__cleanupInflightResourcesInLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
    +[PLInternalResource resetPrefetchStateForResourcesWithVersion:cplType:assetUuids:inLibrary:](PLInternalResource, "resetPrefetchStateForResourcesWithVersion:cplType:assetUuids:inLibrary:", objc_msgSend(v6, "version"), objc_msgSend(v6, "cplType"), v5, *(_QWORD *)(a1 + 32));

}

uint64_t __79__PLCloudResourcePrefetchManager__enqueueCheckCPLBGDownloadFromNow_withReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLResourceCachingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Running CPL background download check (reason: %@)", (uint8_t *)&v5, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 64) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "_checkCPLBackgroundDownloadOperations");
}

void __71__PLCloudResourcePrefetchManager__checkCPLBackgroundDownloadOperations__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  void *v11;
  char v12;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePrefetchManager _checkCPLBackgroundDownloadOperations]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PLCloudResourcePrefetchManager__checkCPLBackgroundDownloadOperations__block_invoke_2;
  v9[3] = &unk_1E3675C80;
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  objc_msgSend(v7, "_runOnWorkQueueWithTransaction:block:", v6, v9);

}

void __71__PLCloudResourcePrefetchManager__checkCPLBackgroundDownloadOperations__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    PLResourceCachingGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v3;
      v4 = "Failed to check if CPL has background download operations: %@";
      v5 = v2;
      v6 = OS_LOG_TYPE_ERROR;
LABEL_7:
      _os_log_impl(&dword_199541000, v5, v6, v4, (uint8_t *)&v11, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    PLResourceCachingGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "_countOfAllInflightResources");
      v11 = 134217984;
      v12 = v7;
      v4 = "CPL has %ld inflight resources download, do not start another automatic prefetch now";
      v5 = v2;
      v6 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_countOfAllInflightResources"))
  {
    PLResourceCachingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "_allInflightResourceIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = (uint64_t)v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "CPL has no background download operations, yet assetsd has inflight downloads (%@)", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "databaseContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v10, "newShortLivedLibraryWithName:", "-[PLCloudResourcePrefetchManager _checkCPLBackgroundDownloadOperations]_block_invoke");

    objc_msgSend(*(id *)(a1 + 40), "_cleanupInflightResourcesInLibrary:", v2);
    objc_msgSend(*(id *)(a1 + 40), "_startPrefetchNextBatch");
    goto LABEL_8;
  }
}

uint64_t __58__PLCloudResourcePrefetchManager_handleOptimizeModeChange__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cplSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(v2, "prefetchMode");

  objc_msgSend(*(id *)(a1 + 32), "clearPrefetchState");
  return objc_msgSend(*(id *)(a1 + 32), "startAutomaticPrefetch");
}

void __62__PLCloudResourcePrefetchManager_handleCPLConfigurationChange__block_invoke(uint64_t a1)
{
  PLPrefetchConfiguration *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = [PLPrefetchConfiguration alloc];
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", *MEMORY[0x1E0D11238]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PLPrefetchConfiguration initWithPrefetchDictionary:](v2, "initWithPrefetchDictionary:", v6);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 104);
  *(_QWORD *)(v4 + 104) = v3;

}

uint64_t __55__PLCloudResourcePrefetchManager_handleCPLStatusChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t result;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88)
    || (objc_msgSend(*(id *)(a1 + 40), "initialSyncDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    objc_msgSend(*(id *)(a1 + 40), "initialSyncDate");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = v2;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "initialSyncDate");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 88);
    *(_QWORD *)(v7 + 88) = v6;

    PLResourceCachingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "initialSyncDate became non-nil (%@), starting non-thumbnails prefetch", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_startAutomaticPrefetch");
  }
  result = objc_msgSend(*(id *)(a1 + 40), "isWalrusEnabled");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = result;
  return result;
}

uint64_t __56__PLCloudResourcePrefetchManager_startAutomaticPrefetch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAutomaticPrefetch");
}

+ (id)descriptionForPrefetchPhase:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("thumbnails");
  else
    return off_1E3670860[a3 - 1];
}

+ (id)_identifierForResourceDownload:(id)a3
{
  id v3;
  PLPrefetchResourceIdentifier *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PLPrefetchResourceIdentifier *v10;

  v3 = a3;
  v4 = [PLPrefetchResourceIdentifier alloc];
  objc_msgSend(v3, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "version");
  v8 = objc_msgSend(v3, "cplType");
  v9 = objc_msgSend(v3, "recipeID");

  v10 = -[PLPrefetchResourceIdentifier initWithAssetUuid:version:cplType:recipeID:](v4, "initWithAssetUuid:version:cplType:recipeID:", v6, v7, v8, v9);
  return v10;
}

+ (id)descriptionForPrefetchMode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("optimize");
  else
    return off_1E3670890[a3 - 1];
}

+ (id)_resourcesWithPredicate:(id)a3 limit:(unint64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  id v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = CFSTR("asset");
  v26[1] = CFSTR("asset.master");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v11);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cloudMasterDateCreated"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSortDescriptors:", v13);

  objc_msgSend(v10, "setPredicate:", v7);
  objc_msgSend(v10, "setFetchLimit:", a4);
  v18 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v10, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v18;
  if (v15)
  {
    PLResourceCachingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v7;
      v21 = 2048;
      v22 = a4;
      v23 = 2112;
      v24 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch resources with predicate %@ limit %ld : %@", buf, 0x20u);
    }

  }
  return v14;
}

+ (BOOL)_prefetchIsEnabledForPhase:(unint64_t)a3 givenMode:(int64_t)a4 andInitialSyncDate:(id)a5
{
  unsigned int v5;
  BOOL v6;

  v5 = (0x77u >> a3) & 1;
  if (a3 >= 7)
    LOBYTE(v5) = 0;
  if (!a5)
    LOBYTE(v5) = 0;
  v6 = a3 == 0;
  if (a4 != 3)
    v6 = 0;
  if ((unint64_t)a4 >= 2)
    return v6;
  else
    return v5;
}

+ (BOOL)_hasAssetsNeedingOneTimeThumbRebuildInContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v8;

  v3 = a3;
  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("thumbnailIndex"), 4294967293);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = objc_msgSend(v3, "countForFetchRequest:error:", v4, 0);
  v8 = v6 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0;

  return v8;
}

+ (id)_fetchThumbnailResourcesForAssets:(id)a3 version:(unsigned int)a4 maxRetry:(unint64_t)a5 inContext:(id)a6 error:(id *)a7
{
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v25;
  _QWORD v26[3];

  v10 = *(_QWORD *)&a4;
  v26[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  if (objc_msgSend(v11, "count"))
  {
    v13 = (void *)MEMORY[0x1E0C97B48];
    +[PLInternalResource entityName](PLInternalResource, "entityName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND %K == %d"), CFSTR("asset"), v11, CFSTR("version"), v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d AND %K == %d AND %K <= %d AND %K != nil"), CFSTR("dataStoreClassID"), 0, CFSTR("dataStoreSubtype"), 5, CFSTR("cloudPrefetchCount"), a5, CFSTR("fingerprint"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CB3528];
    v26[0] = v16;
    v26[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPredicate:", v20);

    v25 = 0;
    objc_msgSend(v12, "executeFetchRequest:error:", v15, &v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v25;
    v23 = v22;
    if (!v21 && a7)
      *a7 = objc_retainAutorelease(v22);

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v21;
}

+ (id)thumbnailResourcesNeedingPrefetchInContext:(id)a3 maxRetry:(unint64_t)a4 limit:(int64_t)a5
{
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v82;
  unint64_t v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *context;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  id v107;
  id v108;
  id v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint8_t v112[128];
  uint8_t buf[4];
  void *v114;
  __int16 v115;
  id v116;
  _QWORD v117[2];
  void *v118;
  _QWORD v119[5];

  v119[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5 < 1)
  {
    v31 = 0;
  }
  else
  {
    v83 = a4;
    v94 = a5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a5);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)MEMORY[0x19AEC1554]();
    v82 = a1;
    v9 = objc_msgSend(a1, "_hasAssetsNeedingOneTimeThumbRebuildInContext:", v8);
    v10 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("thumbnailIndex"), 0xFFFFFFFFLL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("thumbnailIndex"), 4294967293);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

    }
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB3528];
    v79 = (void *)v14;
    v119[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("cloudLocalState"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "andPredicateWithSubpredicates:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPredicate:", v21);

    objc_msgSend(v17, "setResultType:", 2);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSortDescriptors:", v23);

    objc_msgSend(v17, "setAllocationType:", 1);
    v24 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v24, "setName:", CFSTR("assetID"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForEvaluatedObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setExpression:", v25);

    objc_msgSend(v24, "setExpressionResultType:", 2000);
    v26 = objc_alloc_init(MEMORY[0x1E0C97B30]);
    objc_msgSend(v26, "setName:", CFSTR("adjustmentsState"));
    objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("adjustmentsState"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setExpression:", v27);

    objc_msgSend(v26, "setExpressionResultType:", 100);
    v76 = v26;
    v77 = v24;
    v117[0] = v24;
    v117[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPropertiesToFetch:", v28);

    v109 = 0;
    v78 = v17;
    objc_msgSend(v8, "executeFetchRequest:error:", v17, &v109);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v109;
    v30 = 0;
    v84 = v8;
    v31 = v85;
    v32 = v94;
    v90 = v29;
    do
    {
      if (objc_msgSend(v31, "count") >= v32 || v30 >= objc_msgSend(v29, "count"))
        break;
      context = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v32);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v32);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v33;
      v35 = objc_msgSend(v33, "count");
      v92 = v34;
      if (objc_msgSend(v34, "count") + v35 >= v32)
      {
        v36 = v82;
      }
      else
      {
        v36 = v82;
        do
        {
          if (v30 >= objc_msgSend(v29, "count"))
            break;
          objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("assetID"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("adjustmentsState"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "unsignedShortValue");

          objc_msgSend(v91, "addObject:", v38);
          v41 = v40 ? v34 : v93;
          objc_msgSend(v41, "addObject:", v38);
          ++v30;

          v29 = v90;
          v42 = objc_msgSend(v93, "count");
        }
        while (objc_msgSend(v34, "count") + v42 < v32);
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = 0;
      objc_msgSend(v36, "_fetchThumbnailResourcesForAssets:version:maxRetry:inContext:error:", v93, 0, v83, v8, &v108);
      v44 = objc_claimAutoreleasedReturnValue();
      v45 = v108;
      if (v44)
      {
        objc_msgSend(v43, "addObjectsFromArray:", v44);
      }
      else
      {
        PLResourceCachingGetLog();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v114 = v47;
          v115 = 2112;
          v116 = v45;
          _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "%@: failed to fetch thumbnail resources in unadj batch with error: %@", buf, 0x16u);

        }
      }
      v107 = v45;
      objc_msgSend(v36, "_fetchThumbnailResourcesForAssets:version:maxRetry:inContext:error:", v92, 2, v83, v8, &v107);
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = v107;

      v87 = v49;
      v88 = (void *)v44;
      v86 = (void *)v48;
      if (v48)
      {
        objc_msgSend(v43, "addObjectsFromArray:", v48);
      }
      else
      {
        PLResourceCachingGetLog();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v114 = v51;
          v115 = 2112;
          v116 = v49;
          _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_ERROR, "%@: failed to fetch thumbnail resources in adj batch with error: %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v43, "count"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = 0u;
      v104 = 0u;
      v105 = 0u;
      v106 = 0u;
      v53 = v43;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
      if (v54)
      {
        v55 = v54;
        v56 = *(_QWORD *)v104;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v104 != v56)
              objc_enumerationMutation(v53);
            v58 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
            objc_msgSend(v58, "objectIDsForRelationshipNamed:", CFSTR("asset"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "firstObject");
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v52, "setObject:forKeyedSubscript:", v58, v60);
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v103, v112, 16);
        }
        while (v55);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v53, "count"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      v62 = v91;
      v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
      if (v63)
      {
        v64 = v63;
        v65 = *(_QWORD *)v100;
        do
        {
          for (j = 0; j != v64; ++j)
          {
            if (*(_QWORD *)v100 != v65)
              objc_enumerationMutation(v62);
            objc_msgSend(v52, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            if (v67)
              objc_msgSend(v61, "addObject:", v67);

          }
          v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v99, v111, 16);
        }
        while (v64);
      }

      v97 = 0u;
      v98 = 0u;
      v95 = 0u;
      v96 = 0u;
      v68 = v61;
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v95, v110, 16);
      v31 = v85;
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v96;
LABEL_44:
        v72 = 0;
        while (1)
        {
          if (*(_QWORD *)v96 != v71)
            objc_enumerationMutation(v68);
          objc_msgSend(v85, "addObject:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * v72));
          if (objc_msgSend(v85, "count") == v94)
            break;
          if (v70 == ++v72)
          {
            v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v95, v110, 16);
            if (v70)
              goto LABEL_44;
            break;
          }
        }
      }

      v73 = objc_msgSend(v85, "count");
      objc_autoreleasePoolPop(context);
      v32 = v94;
      v8 = v84;
      v29 = v90;
    }
    while (v73 != v94);

    objc_autoreleasePoolPop(v80);
  }

  return v31;
}

+ (void)resourcesToPrefetchWithPrefetchPhase:(unint64_t)a3 prefetchMode:(int64_t)a4 prefetchOptimizeMode:(int64_t)a5 initialSyncDate:(id)a6 lastCompletePrefetchDate:(id)a7 initialBudget:(int64_t)a8 excludeDynamicCPLResources:(BOOL)a9 prefetchConfiguration:(id)a10 photoLibrary:(id)a11 applyPerPrefetchLimit:(BOOL)a12 completionHandler:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, id, int64_t);
  PLCloudResourcePrefetchPredicateOptions *v23;
  PLCloudResourcePrefetchPredicateOptions *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t *v43;
  unint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  int64_t v50;

  v18 = a6;
  v19 = a7;
  v20 = a10;
  v21 = a11;
  v22 = (void (**)(id, id, int64_t))a13;
  v36 = v18;
  if (objc_msgSend((id)objc_opt_class(), "_prefetchIsEnabledForPhase:givenMode:andInitialSyncDate:", a3, a4, v18))
  {
    v23 = -[PLCloudResourcePrefetchPredicateOptions initWithPrefetchMode:prefetchOptimizeMode:excludeDynamicResources:prefetchConfiguration:]([PLCloudResourcePrefetchPredicateOptions alloc], "initWithPrefetchMode:prefetchOptimizeMode:excludeDynamicResources:prefetchConfiguration:", a4, +[PLPrefetchConfiguration defaultPrefetchOptimizeMode](PLPrefetchConfiguration, "defaultPrefetchOptimizeMode"), a9, v20);
    v24 = v23;
    v25 = v19;
    switch(a3)
    {
      case 0uLL:
        v26 = objc_msgSend(v20, "cloudResourceThumbnailsMaxResourcesPerFetch");
        v27 = 0;
        break;
      case 1uLL:
        +[PLCloudResourcePrefetchPredicates predicatesForComputeSync:photoLibrary:](PLCloudResourcePrefetchPredicates, "predicatesForComputeSync:photoLibrary:", v23, v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v20, "cloudResourceComputeSyncMaxResourcesPerFetch");
        break;
      case 2uLL:
        +[PLCloudResourcePrefetchPredicates predicatesForMemories:photoLibrary:](PLCloudResourcePrefetchPredicates, "predicatesForMemories:photoLibrary:", v23, v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v20, "cloudResourceMemoriesMaxResourcesPerFetch");
        break;
      case 3uLL:
        +[PLCloudResourcePrefetchPredicates predicatesForWidget:photoLibrary:](PLCloudResourcePrefetchPredicates, "predicatesForWidget:photoLibrary:", v23, v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v20, "cloudResourceWidgetMaxResourcesPerFetch");
        break;
      case 4uLL:
        -[PLCloudResourcePrefetchPredicateOptions setPrefetchOptimizeMode:](v23, "setPrefetchOptimizeMode:", a5);
        +[PLCloudResourcePrefetchPredicates predicatesForNonThumbnails:lastCompletePrefetchDate:](PLCloudResourcePrefetchPredicates, "predicatesForNonThumbnails:lastCompletePrefetchDate:", v24, v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v20, "cloudResourceNonThumbnailsMaxResourcesPerFetch");
        break;
      case 5uLL:
        +[PLCloudResourcePrefetchPredicates predicateToPrefetchMediaMetadataResourcesWithOptions:photoLibrary:](PLCloudResourcePrefetchPredicates, "predicateToPrefetchMediaMetadataResourcesWithOptions:photoLibrary:", v23, v21);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 6uLL:
        +[PLCloudResourcePrefetchPredicates predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions:photoLibrary:](PLCloudResourcePrefetchPredicates, "predicateToPrefetchAdjustedMediaMetadataResourcesWithOptions:photoLibrary:", v23, v21);
        v30 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v27 = (void *)v30;
        v26 = objc_msgSend(v20, "cloudResourceMediaMetadataOverflowMaxResourcesPerFetch");
        break;
      default:
        v26 = 0;
        v27 = 0;
        v25 = v19;
        break;
    }
    v29 = a8;
    v28 = v26;

  }
  else
  {
    v28 = 0;
    v27 = 0;
    v25 = v19;
    v29 = a8;
  }
  if (a12)
  {
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = v29;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    LODWORD(v28) = objc_msgSend(v20, "cloudResourceThumbnailsMaxResourcesPerFetch");
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = v29;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v28;
  }
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __262__PLCloudResourcePrefetchManager_resourcesToPrefetchWithPrefetchPhase_prefetchMode_prefetchOptimizeMode_initialSyncDate_lastCompletePrefetchDate_initialBudget_excludeDynamicCPLResources_prefetchConfiguration_photoLibrary_applyPerPrefetchLimit_completionHandler___block_invoke;
  v38[3] = &unk_1E3673BB8;
  v43 = &v47;
  v32 = v31;
  v39 = v32;
  v44 = a3;
  v45 = a1;
  v33 = v21;
  v40 = v33;
  v34 = v20;
  v41 = v34;
  v46 = v28;
  v35 = v27;
  v42 = v35;
  objc_msgSend(v33, "performBlockAndWait:", v38);
  if (v22)
    v22[2](v22, v32, v29);

  _Block_object_dispose(&v47, 8);
}

void __262__PLCloudResourcePrefetchManager_resourcesToPrefetchWithPrefetchPhase_prefetchMode_prefetchOptimizeMode_initialSyncDate_lastCompletePrefetchDate_initialBudget_excludeDynamicCPLResources_prefetchConfiguration_photoLibrary_applyPerPrefetchLimit_completionHandler___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __262__PLCloudResourcePrefetchManager_resourcesToPrefetchWithPrefetchPhase_prefetchMode_prefetchOptimizeMode_initialSyncDate_lastCompletePrefetchDate_initialBudget_excludeDynamicCPLResources_prefetchConfiguration_photoLibrary_applyPerPrefetchLimit_completionHandler___block_invoke_2;
  v21[3] = &unk_1E3670818;
  v23 = *(_QWORD *)(a1 + 64);
  v22 = *(id *)(a1 + 32);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v21);
  if (*(_QWORD *)(a1 + 72) || *(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) < 1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v3 = *(id *)(a1 + 56);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v18;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7);
        v9 = objc_msgSend(*(id *)(a1 + 32), "count", (_QWORD)v17);
        v10 = *(_QWORD *)(a1 + 88);
        v11 = v10 - v9;
        if (v10 <= v9 || *(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) < 1)
          break;
        v12 = (void *)objc_opt_class();
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_resourcesWithPredicate:limit:context:", v8, v11, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        ((void (**)(_QWORD, void *))v2)[2](v2, v14);
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
          if (v5)
            goto LABEL_4;
          break;
        }
      }
    }
  }
  else
  {
    v15 = (void *)objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "thumbnailResourcesNeedingPrefetchInContext:maxRetry:limit:", v16, objc_msgSend(*(id *)(a1 + 48), "cloudResourceMaxPrefetchRetry"), *(_QWORD *)(a1 + 88));
    v3 = (id)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, id))v2)[2](v2, v3);
  }

}

void __262__PLCloudResourcePrefetchManager_resourcesToPrefetchWithPrefetchPhase_prefetchMode_prefetchOptimizeMode_initialSyncDate_lastCompletePrefetchDate_initialBudget_excludeDynamicCPLResources_prefetchConfiguration_photoLibrary_applyPerPrefetchLimit_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) -= objc_msgSend(v8, "dataLength", (_QWORD)v9);
      if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) < 1)
        break;
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

}

@end
