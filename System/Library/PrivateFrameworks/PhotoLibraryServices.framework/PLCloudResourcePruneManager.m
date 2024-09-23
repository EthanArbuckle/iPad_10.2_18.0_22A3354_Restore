@implementation PLCloudResourcePruneManager

- (PLCloudResourcePruneManager)init
{
  -[PLCloudResourcePruneManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[PLCloudResourcePruneManager initWithCPLManager:libraryServicesManager:](self, "initWithCPLManager:libraryServicesManager:", 0, 0);
}

- (PLCloudResourcePruneManager)initWithCPLManager:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  PLCloudResourcePruneManager *v8;
  PLCloudResourcePruneManager *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLCloudResourcePruneManager;
  v8 = -[PLCloudResourcePruneManager init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lsm, a4);
    objc_storeWeak((id *)&v9->_cplManager, v6);
    v9->_stopped = 0;
    PLCloudCopyDefaultSerialQueueAttributes();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("PLCloudResourcePruneManager work queue", v10);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v11;

    -[PLCloudResourcePruneManager _handleCacheDeleteRegistration](v9, "_handleCacheDeleteRegistration");
  }

  return v9;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)PLCloudResourcePruneManager;
  -[PLCloudResourcePruneManager dealloc](&v4, sel_dealloc);
}

- (int64_t)_totalPurgeableAmountForUrgency:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newShortLivedLibraryWithName:", "-[PLCloudResourcePruneManager _totalPurgeableAmountForUrgency:]");

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__PLCloudResourcePruneManager__totalPurgeableAmountForUrgency___block_invoke;
  v9[3] = &unk_1E3675800;
  v11 = &v13;
  v6 = v5;
  v10 = v6;
  v12 = a3;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (int64_t)_purgeableAmountWithBudget:(int64_t)a3 debugString:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PLCloudResourcePruneManager__purgeableAmountWithBudget_debugString___block_invoke;
  v10[3] = &unk_1E366C758;
  v11 = v6;
  v7 = v6;
  v8 = -[PLCloudResourcePruneManager _fetchResourcesForPruningWithBudget:urgency:batchHandler:](self, "_fetchResourcesForPruningWithBudget:urgency:batchHandler:", a3, 1, v10);

  return v8;
}

- (__CFDictionary)_handleCacheDeletePurge:(int)a3 info:(__CFDictionary *)a4
{
  void *v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_semaphore_t v15;
  _BOOL8 v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __CFDictionary *v24;
  uint64_t v26;
  uint64_t v27;
  intptr_t (*v28)(uint64_t, uint64_t);
  void *v29;
  NSObject *v30;
  _BYTE *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t v34[4];
  uint64_t v35;
  _BYTE buf[24];
  _BYTE v37[14];
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[__CFDictionary objectForKey:](a4, "objectForKey:", CFSTR("CACHE_DELETE_AMOUNT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "longLongValue");

  v9 = -[PLCloudResourcePruneManager diskSpaceToPrune](self, "diskSpaceToPrune");
  v10 = v9;
  if (v8 <= v9)
    v11 = v9;
  else
    v11 = v8;
  PLResourceCachingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v8 + 0xFFFFF;
    *(_DWORD *)buf = 134219008;
    if (v8 >= 0)
      v13 = v8;
    *(_QWORD *)&buf[4] = v13 >> 20;
    v14 = v10 + 0xFFFFF;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v8;
    if (v10 >= 0)
      v14 = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)v37 = a3;
    *(_WORD *)&v37[4] = 2048;
    *(_QWORD *)&v37[6] = v14 >> 20;
    v38 = 2048;
    v39 = v10;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "CacheDelete requested purging %lld MB (%lld) with urgency %d, pruneable %lld MB (%lld)", buf, 0x30u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_QWORD *)v37 = 0;
  v15 = dispatch_semaphore_create(0);
  v16 = a3 > 1;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __60__PLCloudResourcePruneManager__handleCacheDeletePurge_info___block_invoke;
  v29 = &unk_1E366C780;
  v31 = buf;
  v17 = v15;
  v30 = v17;
  -[PLCloudResourcePruneManager startAutomaticPruneWithBudget:urgency:completionHandler:](self, "startAutomaticPruneWithBudget:urgency:completionHandler:", v11, v16, &v26);
  dispatch_semaphore_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  if ((*(_QWORD *)(*(_QWORD *)&buf[8] + 24) & 0x8000000000000000) != 0)
  {
    PLResourceCachingGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v34 = 134217984;
      v35 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "amountPurged is negative (%lld), setting to 0", v34, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = 0;
  }
  else
  {
    PLResourceCachingGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v34 = 134217984;
      v35 = v19 / 0x100000;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Purged %lld MB", v34, 0xCu);
    }

  }
  v32[0] = CFSTR("CACHE_DELETE_VOLUME");
  -[__CFDictionary objectForKey:](a4, "objectForKey:", v26, v27, v28, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v33[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(*(_QWORD *)&buf[8] + 24));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v24 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(buf, 8);
  return v24;
}

- (__CFDictionary)_handleCacheDeletePurgeable:(int)a3 info:(__CFDictionary *)a4
{
  NSObject *v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __CFDictionary *v16;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLResourceCachingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Calculating purgeable space for CacheDelete...", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = -[PLCloudResourcePruneManager _totalPurgeableAmountForUrgency:](self, "_totalPurgeableAmountForUrgency:", a3 != 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v12 = v11;
  PLResourceCachingGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v21 = v10 / 0x100000;
    v22 = 2048;
    v23 = v12 - v9;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Max purgeable amount: %llu MB, took %f s", buf, 0x16u);
  }

  -[__CFDictionary objectForKey:](a4, "objectForKey:", CFSTR("CACHE_DELETE_VOLUME"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("CACHE_DELETE_AMOUNT");
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v16 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_handleCacheDeleteRegistration
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[8];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCentralizedCacheDeleteCapable");

  if ((v5 & 1) == 0)
  {
    objc_initWeak(&location, self);
    v6 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__PLCloudResourcePruneManager__handleCacheDeleteRegistration__block_invoke;
    v14[3] = &unk_1E366C7A8;
    objc_copyWeak(&v15, &location);
    v7 = (void *)MEMORY[0x19AEC174C](v14);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __61__PLCloudResourcePruneManager__handleCacheDeleteRegistration__block_invoke_34;
    v12[3] = &unk_1E366C7A8;
    objc_copyWeak(&v13, &location);
    v8 = (void *)MEMORY[0x19AEC174C](v12);
    v9 = (void *)MEMORY[0x19AEC174C](v7);
    if (CacheDeleteRegisterInfoCallbacks())
    {
      PLResourceCachingGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Failed to register with CacheDelete service. ", v11, 2u);
      }

    }
    objc_destroyWeak(&v13);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)updateCacheDeletePurgeableAmount
{
  void *v3;
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCentralizedCacheDeleteCapable");

  if ((v5 & 1) == 0)
  {
    v6 = -[PLCloudResourcePruneManager _totalPurgeableAmountForUrgency:](self, "_totalPurgeableAmountForUrgency:", 1);
    v12[0] = CFSTR("CACHE_DELETE_ID");
    v12[1] = CFSTR("CACHE_DELETE_VOLUME");
    v13[0] = CFSTR("com.apple.assetsd.cacheDelete");
    v13[1] = CFSTR("/private/var");
    v13[2] = &unk_1E375F528;
    v12[2] = CFSTR("CACHE_DELETE_URGENCY");
    v12[3] = CFSTR("CACHE_DELETE_AMOUNT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    PLResourceCachingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Updating CacheDelete purgeable info: %@", (uint8_t *)&v10, 0xCu);
    }

    CacheDeleteUpdatePurgeable();
  }
}

- (void)startAutomaticPruneWithBudget:(int64_t)a3 urgency:(int64_t)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD v20[5];
  NSObject *v21;
  id v22;
  id v23;
  int64_t v24;
  int64_t v25;
  os_signpost_id_t v26;
  uint8_t buf[4];
  int64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Budget: %lld"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("PruneStart"));

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudResourcePruneManager startAutomaticPruneWithBudget:urgency:completionHandler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_stopped = 0;
  PLResourceCachingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v28 = a3 / 0x100000;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Starting automatic prune with budget: %lld MB", buf, 0xCu);
  }

  PLCloudResourcePruneGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);
  v15 = v13;
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 134217984;
    v28 = a3 / 0x100000;
    _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "AutoPrune", "Budget: %lld MB", buf, 0xCu);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__PLCloudResourcePruneManager_startAutomaticPruneWithBudget_urgency_completionHandler___block_invoke;
  v20[3] = &unk_1E366C818;
  v24 = a3;
  v25 = a4;
  v20[4] = self;
  v21 = v16;
  v26 = v14;
  v22 = v9;
  v23 = v8;
  v17 = v9;
  v18 = v16;
  v19 = v8;
  -[PLCloudResourcePruneManager _runOnWorkQueueWithTransaction:block:](self, "_runOnWorkQueueWithTransaction:block:", v11, v20);

}

- (void)stop
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  uint8_t v6[16];

  PLResourceCachingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Stopping pruning", v6, 2u);
  }

  self->_stopped = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cplManager);
  objc_msgSend(WeakRetained, "cplStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLastPruneDate:", 0);
}

- (int64_t)_fetchResourcesForPruningWithBudget:(int64_t)a3 urgency:(int64_t)a4 batchHandler:(id)a5
{
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  dispatch_semaphore_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  int64_t v21;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  id v27;
  id v28;
  uint64_t *v29;
  int64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  int64_t v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (self->_stopped)
  {
    PLResourceCachingGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Pruning is stopped";
      v11 = v9;
      v12 = 2;
LABEL_4:
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
    }
  }
  else
  {
    if (a3 <= 0)
    {
      PLResourceCachingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_DWORD *)buf = 134217984;
      v36 = a3;
      v10 = "Pruning budget is %lld bytes, skip pruning";
      v11 = v9;
      v12 = 12;
      goto LABEL_4;
    }
    -[PLCloudResourcePruneManager _predicateForPruneWithUrgency:](self, "_predicateForPruneWithUrgency:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PLResourceCachingGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v36 = a3;
      v37 = 2112;
      v38 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Started pruning with budget %lld predicate: %@", buf, 0x16u);
    }

    -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newShortLivedLibraryWithName:", "-[PLCloudResourcePruneManager _fetchResourcesForPruningWithBudget:urgency:batchHandler:]");

    v17 = dispatch_semaphore_create(0);
    v18 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke;
    v25[3] = &unk_1E3672020;
    v9 = v13;
    v26 = v9;
    v19 = v16;
    v27 = v19;
    v28 = v8;
    v29 = &v31;
    v30 = a3;
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke_71;
    v23[3] = &unk_1E3677AA0;
    v20 = v17;
    v24 = v20;
    objc_msgSend(v19, "performBlock:completionHandler:withPriority:", v25, v23, 1);
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);

  }
LABEL_11:

  v21 = v32[3];
  _Block_object_dispose(&v31, 8);

  return v21;
}

- (id)pruneStatusForDebug:(BOOL)a3
{
  int64_t v4;
  void *v5;

  v4 = -[PLCloudResourcePruneManager diskSpaceToPrune](self, "diskSpaceToPrune", a3);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Disk space to prune: %llu MB\n"), v4 / 0x100000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("Max purgeable amount: %llu MB\n"), -[PLCloudResourcePruneManager _purgeableAmountWithBudget:debugString:](self, "_purgeableAmountWithBudget:debugString:", v4, v5)/ 0x100000);
  return v5;
}

- (void)handleOptimizeModeChange
{
  -[PLCloudResourcePruneManager startAutomaticPruneWithBudget:urgency:completionHandler:](self, "startAutomaticPruneWithBudget:urgency:completionHandler:", -[PLCloudResourcePruneManager diskSpaceToPrune](self, "diskSpaceToPrune"), 0, &__block_literal_global_77);
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

- (void)_updateLocalStateForPrunedResources:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  int v24;
  uint64_t v25;
  id v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v26 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v11, "fileURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        PLResourceCachingGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v38 = v13;
          v39 = 2112;
          v40 = v11;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "%@ has been deleted for %@", buf, 0x16u);
        }

        objc_msgSend(v11, "markAsNotLocallyAvailableAfterPurge");
        objc_msgSend(v11, "asset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v6, "addObject:", v16);
        }
        else
        {
          PLResourceCachingGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v38 = v11;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "No assetUUID for local resource %@", buf, 0xCu);
          }

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v8);
  }

  +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", v6, 0, v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        v24 = objc_msgSend(v23, "cloudPlaceholderKind");
        if ((objc_msgSend(v23, "hasMasterThumb") & 1) != 0)
        {
          if (v24 == 3)
            continue;
          v25 = 3;
        }
        else
        {
          if (v24 == 2)
            continue;
          v25 = 2;
        }
        objc_msgSend(v23, "setCloudPlaceholderKind:", v25);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v20);
  }

}

- (int64_t)_localResourcesSize
{
  void *v2;
  void *v3;
  id v4;
  int64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newShortLivedLibraryWithName:", "-[PLCloudResourcePruneManager _localResourcesSize]");

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PLCloudResourcePruneManager__localResourcesSize__block_invoke;
  v7[3] = &unk_1E3677C68;
  v4 = v3;
  v8 = v4;
  v9 = &v10;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (int64_t)diskSpaceToPrune
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[24];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager cplSettings](self->_lsm, "cplSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isKeepOriginalsEnabled");

  -[PLLibraryServicesManager pathManager](self->_lsm, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoDirectoryWithType:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(MEMORY[0x1E0D731D8], "fileSystemSizeForPath:", v6);
  v8 = objc_msgSend(MEMORY[0x1E0D731D8], "diskSpaceAvailableForPath:", v6);
  v9 = 0.1;
  v10 = 0.05;
  if (!v4)
    v10 = 0.1;
  v11 = (uint64_t)(v10 * (double)v7);
  if (!v4)
    v9 = 0.25;
  v12 = (uint64_t)(v9 * (double)v7);
  PLResourceCachingGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v12 + 0xFFFFF;
    *(_DWORD *)v21 = 134218752;
    *(_QWORD *)&v21[4] = v7 / 0x100000;
    *(_WORD *)&v21[12] = 2048;
    *(_QWORD *)&v21[14] = v8 / 0x100000;
    if (v12 >= 0)
      v14 = v12;
    *(_WORD *)&v21[22] = 2048;
    v22 = v11 / 0x100000;
    v23 = 2048;
    v24 = v14 >> 20;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Total storage: %lld MB Available storage: %lld MB Free space to start/stop pruning: %lld/%lld MB", v21, 0x2Au);
  }

  if (v8 >= v11)
  {
    v15 = 0;
  }
  else
  {
    v15 = v12 - v8;
    PLResourceCachingGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v21 = 134217984;
      *(_QWORD *)&v21[4] = v15 / 0x100000;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Prune space: %lld MB", v21, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", *(_OWORD *)v21, *(_QWORD *)&v21[16]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerForKey:", CFSTR("PLPruneDiskSpaceMB"));

  if (v18 <= 0)
    v19 = v15;
  else
    v19 = v18 << 20;

  return v19 & ~(v19 >> 63);
}

- (id)_predicateForPruneWithUrgency:(int64_t)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  +[PLInternalResource nonOriginalCPLResourceTypes](PLInternalResource, "nonOriginalCPLResourceTypes", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager cplSettings](self->_lsm, "cplSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isKeepOriginalsEnabled");

  if (v6)
  {
    +[PLInternalResource prunePredicateForCPLResourceTypes:](PLInternalResource, "prunePredicateForCPLResourceTypes:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[PLInternalResource originalCPLResourceTypes](PLInternalResource, "originalCPLResourceTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLInternalResource prunePredicateForCPLResourceTypes:](PLInternalResource, "prunePredicateForCPLResourceTypes:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_identifierForResource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "itemScopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "resourceType");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%lu"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)pruneResources:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int64_t v12;
  _QWORD v14[4];
  id v15;
  PLCloudResourcePruneManager *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__PLCloudResourcePruneManager_pruneResources_inPhotoLibrary___block_invoke;
  v14[3] = &unk_1E3676EC8;
  v8 = v6;
  v15 = v8;
  v16 = self;
  v18 = &v19;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v9, "performTransactionAndWait:", v14);
  PLResourceCachingGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v20[3];
    *(_DWORD *)buf = 134217984;
    v24 = v11;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Total pruned size: %lld", buf, 0xCu);
  }

  v12 = v20[3];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_cplManager);
  objc_storeStrong((id *)&self->_lsm, 0);
}

void __61__PLCloudResourcePruneManager_pruneResources_inPhotoLibrary___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  dispatch_semaphore_t v14;
  id WeakRetained;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  dispatch_semaphore_t dsema;
  void *v31;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  dispatch_semaphore_t v40;
  __int128 *p_buf;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[4];
  NSObject *v47;
  __int16 v48;
  NSObject *v49;
  uint8_t v50[128];
  __int128 buf;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*v1, "count"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v3 = *v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v43 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v7, "fileURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v7, "cplResourceIncludeFile:createDirectoryIfNeeded:", 1, 0);
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v34, "addObject:", v10);
            objc_msgSend(v2, "setObject:forKey:", v7, v9);
          }
          else
          {
            PLResourceCachingGetLog();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = v7;
              _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to create CPLResource for prune from %@", (uint8_t *)&buf, 0xCu);
            }

            v10 = 0;
          }
        }
        else
        {
          PLResourceCachingGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v7;
            _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to prune resource with no file path: %@", (uint8_t *)&buf, 0xCu);
          }
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v4);
  }

  PLResourceCachingGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Pruning %lu resources", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__54932;
  v54 = __Block_byref_object_dispose__54933;
  v55 = 0;
  v14 = dispatch_semaphore_create(0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __61__PLCloudResourcePruneManager_pruneResources_inPhotoLibrary___block_invoke_84;
  v39[3] = &unk_1E366C8A8;
  p_buf = &buf;
  dsema = v14;
  v40 = dsema;
  objc_msgSend(WeakRetained, "deleteResources:checkServerIfNecessary:completionHandler:", v34, 1, v39);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v31 = (void *)objc_msgSend(v16, "initWithCapacity:", objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v17 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v36 != v19)
          objc_enumerationMutation(v17);
        v21 = *(NSObject **)(*((_QWORD *)&v35 + 1) + 8 * j);
        -[NSObject identity](v21, "identity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "fileURL");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          objc_msgSend(v2, "objectForKey:", v24);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            -[NSObject fileURL](v25, "fileURL");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "path");
            v28 = objc_claimAutoreleasedReturnValue();

            if (v28 && objc_msgSend(v24, "isEqualToString:", v28))
            {
              if ((objc_msgSend(v33, "fileExistsAtPath:", v28) & 1) != 0)
              {
                PLResourceCachingGetLog();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v46 = 138412290;
                  v47 = v26;
                  _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Pruned file still exists at for %@", v46, 0xCu);
                }
                goto LABEL_30;
              }
              objc_msgSend(v31, "addObject:", v26);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += -[NSObject dataLength](v26, "dataLength");
            }
            else
            {
              PLResourceCachingGetLog();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v46 = 138412546;
                v47 = v21;
                v48 = 2112;
                v49 = v26;
                _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Unmatched filepath for pruned resource between CPL (%@) and PL (%@)", v46, 0x16u);
              }
LABEL_30:

            }
          }
          else
          {
            PLResourceCachingGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v46 = 138412290;
              v47 = v21;
              _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Unable to find matching PLResource for deleted CPLResource %@", v46, 0xCu);
            }
          }

          goto LABEL_40;
        }
        PLResourceCachingGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v46 = 138412290;
          v47 = v21;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Pruned CPL resource %@ has no path", v46, 0xCu);
        }
LABEL_40:

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
    }
    while (v18);
  }

  objc_msgSend(*(id *)(a1 + 40), "_updateLocalStateForPrunedResources:inPhotoLibrary:", v31, *(_QWORD *)(a1 + 48));
  _Block_object_dispose(&buf, 8);

}

void __61__PLCloudResourcePruneManager_pruneResources_inPhotoLibrary___block_invoke_84(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLResourceCachingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = objc_msgSend(v5, "count");
    v15 = 2048;
    v16 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Pruned %lu resources, kept %lu resources", (uint8_t *)&v13, 0x16u);
  }

  PLResourceCachingGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = (uint64_t)v5;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Pruned resources: %@", (uint8_t *)&v13, 0xCu);
  }

  PLResourceCachingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = (uint64_t)v6;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Unsafe resources to prune: %@", (uint8_t *)&v13, 0xCu);
  }

  v10 = objc_msgSend(v5, "copy");
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50__PLCloudResourcePruneManager__localResourcesSize__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLInternalResource predicateForAvailableResources](PLInternalResource, "predicateForAvailableResources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PLCloudResourcePruneManager__localResourcesSize__block_invoke_2;
  v8[3] = &unk_1E3672098;
  v8[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v5, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v3, &v9, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    PLResourceCachingGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch resources: %@", buf, 0xCu);
    }

  }
}

uint64_t __50__PLCloudResourcePruneManager__localResourcesSize__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "dataLength");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t __68__PLCloudResourcePruneManager__runOnWorkQueueWithTransaction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke(uint64_t a1)
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
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cloudLastOnDemandDownloadDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cloudLastPrefetchDate"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v5;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("cloudMasterDateCreated"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v7);

  v32[0] = CFSTR("asset");
  v32[1] = CFSTR("asset.master");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRelationshipKeyPathsForPrefetching:", v8);

  objc_msgSend(v3, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke_2;
  v22[3] = &unk_1E366C840;
  v11 = v10;
  v23 = v11;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = *(_QWORD *)(a1 + 64);
  v24 = v12;
  v25 = v13;
  v26 = v14;
  objc_msgSend(v9, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v3, &v27, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    if (*(_QWORD *)(a1 + 64) > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v16 = *(_QWORD *)(a1 + 48);
      if (v16)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += (*(uint64_t (**)(uint64_t, id))(v16 + 16))(v16, v11);
    }
  }
  objc_msgSend(v11, "removeAllObjects");
  if (v15)
  {
    PLResourceCachingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v29 = v18;
      v30 = 2112;
      v31 = v15;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch resources with predicate %@: %@", buf, 0x16u);
    }

  }
  PLResourceCachingGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v21 = (void *)(*(_QWORD *)(a1 + 64) - v20);
    *(_DWORD *)buf = 134218240;
    v29 = v20;
    v30 = 2048;
    v31 = v21;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Pruned amount: %lld Remaining budget: %lld", buf, 0x16u);
  }

}

intptr_t __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke_71(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __88__PLCloudResourcePruneManager__fetchResourcesForPruningWithBudget_urgency_batchHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0x64)
  {
    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += (*(uint64_t (**)(uint64_t, _QWORD))(v6 + 16))(v6, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56))
    {
      PLResourceCachingGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "No more budget, stop pruning", v8, 2u);
      }

      *a4 = 1;
    }
  }
}

void __87__PLCloudResourcePruneManager_startAutomaticPruneWithBudget_urgency_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "databaseContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "newShortLivedLibraryWithName:", "-[PLCloudResourcePruneManager startAutomaticPruneWithBudget:urgency:completionHandler:]_block_invoke");

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __87__PLCloudResourcePruneManager_startAutomaticPruneWithBudget_urgency_completionHandler___block_invoke_2;
  v23[3] = &unk_1E366C7F0;
  v23[4] = v4;
  v7 = v3;
  v24 = v7;
  v8 = objc_msgSend(v4, "_fetchResourcesForPruningWithBudget:urgency:batchHandler:", v5, v6, v23);
  PLResourceCachingGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v8 / 0x100000;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Finished automatic prune with amount: %lld MB", buf, 0xCu);
  }

  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v10 + 16))(v10, v8, 0);
    if (v8 >= 1)
      objc_msgSend(*(id *)(a1 + 32), "updateCacheDeletePurgeableAmount");
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "cplStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastPruneDate:", v13);

  objc_msgSend(v12, "setLastCompletePrefetchDate:", 0);
  PLResourceCachingGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Deleting cpl_download_finished_marker", buf, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "libraryBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "indicatorFileCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "deleteCPLDownloadFinishedMarkerFilePath");
  v17 = *(id *)(a1 + 40);
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 80);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v8 / 0x100000;
    _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_END, v19, "AutoPrune", "Amount pruned: %lld MB", buf, 0xCu);
  }

  v20 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PrunedAmount: %lld"), v8);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("PruneEnd"));

  v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v22, "reportMiscInformation:", *(_QWORD *)(a1 + 48));

}

uint64_t __87__PLCloudResourcePruneManager_startAutomaticPruneWithBudget_urgency_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "pruneResources:inPhotoLibrary:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __61__PLCloudResourcePruneManager__handleCacheDeleteRegistration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained, "_handleCacheDeletePurge:info:", a2, a3);
  }
  else
  {
    v10[0] = CFSTR("CACHE_DELETE_VOLUME");
    objc_msgSend(a3, "objectForKey:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("CACHE_DELETE_AMOUNT");
    v11[0] = v8;
    v11[1] = &unk_1E375F510;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __61__PLCloudResourcePruneManager__handleCacheDeleteRegistration__block_invoke_34(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained, "_handleCacheDeletePurgeable:info:", a2, a3);
  }
  else
  {
    v10[0] = CFSTR("CACHE_DELETE_VOLUME");
    objc_msgSend(a3, "objectForKey:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("CACHE_DELETE_AMOUNT");
    v11[0] = v8;
    v11[1] = &unk_1E375F510;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

intptr_t __60__PLCloudResourcePruneManager__handleCacheDeletePurge_info___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __70__PLCloudResourcePruneManager__purgeableAmountWithBudget_debugString___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "fileURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (*(_QWORD *)(a1 + 32))
          {
            objc_msgSend(v9, "cplResourceIncludeFile:createDirectoryIfNeeded:", 1, 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@\n"), v11);

          }
          v6 += objc_msgSend(v9, "dataLength");
        }
        else
        {
          PLResourceCachingGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v9;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Unable to prune resource with no file path: %@", buf, 0xCu);
          }

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

int64_t __63__PLCloudResourcePruneManager__totalPurgeableAmountForUrgency___block_invoke(_QWORD *a1)
{
  int64_t result;

  result = +[PLManagedAsset totalPurgeableSizeOnDiskInLibrary:urgency:](PLManagedAsset, "totalPurgeableSizeOnDiskInLibrary:urgency:", a1[4], a1[6]);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = result;
  return result;
}

@end
