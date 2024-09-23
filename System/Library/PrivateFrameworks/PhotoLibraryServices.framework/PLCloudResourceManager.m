@implementation PLCloudResourceManager

- (PLCloudResourceManager)init
{
  -[PLCloudResourceManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (PLCloudResourceManager)initWithCPLManager:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  PLCloudResourceManager *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *workQueue;
  void *v12;
  void *v13;
  char v14;
  PLCloudResourcePruneManager *v15;
  PLCloudResourcePruneManager *pruneManager;
  PLCloudResourcePrefetchManager *v17;
  PLCloudResourcePrefetchManager *prefetchManager;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PLCloudResourceManager;
  v8 = -[PLCloudResourceManager init](&v20, sel_init);
  if (v8)
  {
    PLCloudCopyDefaultSerialQueueAttributes();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("PLCloudResourceManager work queue", v9);
    workQueue = v8->_workQueue;
    v8->_workQueue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v8->_libraryServicesManager, a4);
    objc_msgSend(v7, "pathManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "capabilities");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isCentralizedCacheDeleteCapable");

    if ((v14 & 1) == 0)
    {
      v15 = -[PLCloudResourcePruneManager initWithCPLManager:libraryServicesManager:]([PLCloudResourcePruneManager alloc], "initWithCPLManager:libraryServicesManager:", v6, v7);
      pruneManager = v8->_pruneManager;
      v8->_pruneManager = v15;

    }
    v17 = -[PLCloudResourcePrefetchManager initWithCPLManager:pruneManager:libraryServicesManager:]([PLCloudResourcePrefetchManager alloc], "initWithCPLManager:pruneManager:libraryServicesManager:", v6, v8->_pruneManager, v7);
    prefetchManager = v8->_prefetchManager;
    v8->_prefetchManager = v17;

    v8->_enqueuedOperation = 0;
  }

  return v8;
}

- (void)invalidate
{
  -[PLCloudResourcePrefetchManager invalidate](self->_prefetchManager, "invalidate");
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

- (double)_minimumIntervalBetweenOperations
{
  void *v2;
  uint64_t v3;
  double result;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("PLPrefetchMinimumIntervalBetweenOperations"));

  result = 600.0;
  if (v3 >= 1)
    return (double)v3;
  return result;
}

- (void)startAutomaticPrefetchAndPruneWithTimeout:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourceManager startAutomaticPrefetchAndPruneWithTimeout:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PLCloudResourceManager_startAutomaticPrefetchAndPruneWithTimeout___block_invoke;
  v6[3] = &unk_1E36762F8;
  v7 = a3;
  v6[4] = self;
  -[PLCloudResourceManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v5, v6);

}

- (void)updateCacheDeletePurgeableAmount
{
  -[PLCloudResourcePruneManager updateCacheDeletePurgeableAmount](self->_pruneManager, "updateCacheDeletePurgeableAmount");
}

- (void)stop
{
  NSDate *lastOperationDate;

  -[PLCloudResourcePruneManager stop](self->_pruneManager, "stop");
  -[PLCloudResourcePrefetchManager stop](self->_prefetchManager, "stop");
  lastOperationDate = self->_lastOperationDate;
  self->_lastOperationDate = 0;

  self->_enqueuedOperation = 0;
}

- (void)handleOptimizeModeChange
{
  -[PLCloudResourcePrefetchManager handleOptimizeModeChange](self->_prefetchManager, "handleOptimizeModeChange");
  -[PLCloudResourcePruneManager handleOptimizeModeChange](self->_pruneManager, "handleOptimizeModeChange");
}

- (void)handleCPLStatusChange
{
  -[PLCloudResourcePrefetchManager handleCPLStatusChange](self->_prefetchManager, "handleCPLStatusChange");
}

- (void)handleCPLConfigurationChange
{
  -[PLCloudResourcePrefetchManager handleCPLConfigurationChange](self->_prefetchManager, "handleCPLConfigurationChange");
}

- (id)statusForDebug:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSDate *lastOperationDate;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PLCloudResourcePruneManager *pruneManager;
  void *v27;
  uint64_t v28;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;

  v3 = a3;
  -[PLLibraryServicesManager pathManager](self->_libraryServicesManager, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoDirectoryWithType:", 1);
  v6 = objc_claimAutoreleasedReturnValue();

  v37 = objc_msgSend(MEMORY[0x1E0D731D8], "fileSystemSizeForPath:", v6);
  v42 = (void *)v6;
  v36 = objc_msgSend(MEMORY[0x1E0D731D8], "diskSpaceAvailableForPath:", v6);
  v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss Z"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v8);

  -[PLLibraryServicesManager libraryURL](self->_libraryServicesManager, "libraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLLibraryServicesManager cplSettings](self->_libraryServicesManager, "cplSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v10;
  if (-[PLLibraryServicesManager isSystemPhotoLibrary](self->_libraryServicesManager, "isSystemPhotoLibrary"))
  {
    v12 = (__CFString *)*MEMORY[0x1E0D11290];
  }
  else
  {
    if ((objc_msgSend(v11, "isAppLibrary") & 1) != 0)
    {
      objc_msgSend(v10, "containerIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CPLLibraryIdentifierForApp();
      v44 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v12 = CFSTR("None");
  }
  v44 = v12;
LABEL_7:
  v34 = (void *)MEMORY[0x1E0CB3940];
  -[PLLibraryServicesManager mainScopeIdentifier](self->_libraryServicesManager, "mainScopeIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLLibraryServicesManager isCloudPhotoLibraryEnabled](self->_libraryServicesManager, "isCloudPhotoLibraryEnabled"))
  {
    v15 = CFSTR("YES");
  }
  else
  {
    v15 = CFSTR("NO");
  }
  v31 = v15;
  v39 = v11;
  +[PLCloudResourcePrefetchManager descriptionForPrefetchMode:](PLCloudResourcePrefetchManager, "descriptionForPrefetchMode:", objc_msgSend(v11, "prefetchMode"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D11398], "fingerprintSchemeForNewMasterAsset");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "fingerprintSchemeDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", self->_lastOperationDate);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  lastOperationDate = self->_lastOperationDate;
  -[PLCloudResourceManager _minimumIntervalBetweenOperations](self, "_minimumIntervalBetweenOperations");
  -[NSDate dateByAddingTimeInterval:](lastOperationDate, "dateByAddingTimeInterval:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v7;
  objc_msgSend(v7, "stringFromDate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_enqueuedOperation)
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v37, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v36, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudResourcePrefetchManager prefetchStatusForDebug:](self->_prefetchManager, "prefetchStatusForDebug:", v3);
  v38 = v3;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "stringWithFormat:", CFSTR("Library Identifier: %@\nMain Scope Identifier: %@\niCPL enabled: %@\nPrefetch Mode: %@\nDefault fingerprint scheme: %@\nCurrent time: %@\nLast operation time: %@\nNext operation time: %@\nEnqueued: %@\nTotal storage: %@ Available storage: %@\n\n%@"), v44, v33, v31, v43, v16, v30, v17, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  pruneManager = self->_pruneManager;
  if (pruneManager)
  {
    -[PLCloudResourcePruneManager pruneStatusForDebug:](pruneManager, "pruneStatusForDebug:", v38);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingFormat:", CFSTR("\nPrune status (non-CCD):\n%@\n"), v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)v28;
  }

  return v25;
}

- (void)clearPrefetchState
{
  -[PLCloudResourcePrefetchManager clearPrefetchState](self->_prefetchManager, "clearPrefetchState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastOperationDate, 0);
  objc_storeStrong((id *)&self->_pruneManager, 0);
  objc_storeStrong((id *)&self->_prefetchManager, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __68__PLCloudResourceManager_startAutomaticPrefetchAndPruneWithTimeout___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  NSObject *v3;
  const __CFString *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  NSObject *v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t buf[4];
  double v20;
  __int16 v21;
  double v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 40))
        *(double *)&v4 = COERCE_DOUBLE(CFSTR("YES"));
      else
        *(double *)&v4 = COERCE_DOUBLE(CFSTR("NO"));
      *(_DWORD *)buf = 138412290;
      v20 = *(double *)&v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Starting automatic prefetch/prune with timeOut %@", buf, 0xCu);
    }

  }
  if (!*(_BYTE *)(a1 + 40) || !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD **)(a1 + 32);
  v7 = (void *)v6[5];
  objc_msgSend(v6, "_minimumIntervalBetweenOperations");
  objc_msgSend(v7, "dateByAddingTimeInterval:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v5);
  if (v9 <= 0.0)
  {
    if (!*v2)
    {
      __CPLAssetsdOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Allowed to start prefetch/prune now", buf, 2u);
      }

    }
LABEL_16:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "diskSpaceToPrune") <= 0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startAutomaticPrefetch");
    return;
  }
  v14 = v9;
  if (!*v2)
  {
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(double *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      v21 = 2048;
      v22 = v14;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Last operation date is %@, next operation is allowed in %f seconds, skip automatic prefetch/prune now", buf, 0x16u);
    }

  }
  v17 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v17 + 48))
  {
    if (!*v2)
    {
      __CPLAssetsdOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v20 = v14;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Enqueuing automatic prefetch/prune in %f seconds", buf, 0xCu);
      }

      v17 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v17 + 48) = 1;
    dispatch_time(0, (uint64_t)(v14 * 1000000000.0));
    pl_dispatch_after();
  }

}

uint64_t __68__PLCloudResourceManager_startAutomaticPrefetchAndPruneWithTimeout___block_invoke_29(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "startAutomaticPrefetchAndPruneWithTimeout:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __63__PLCloudResourceManager__runOnWorkQueueWithTransaction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

@end
