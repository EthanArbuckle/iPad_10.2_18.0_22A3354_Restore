@implementation PLAnalysisCoordinator

- (PLAnalysisCoordinator)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLAnalysisCoordinator *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *taskQueue;
  uint64_t v10;
  NSMutableDictionary *tasks;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLAnalysisCoordinator;
  v6 = -[PLAnalysisCoordinator init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.photolibrary.analysis-coordinator", v7);
    taskQueue = v6->_taskQueue;
    v6->_taskQueue = (OS_dispatch_queue *)v8;

    objc_storeStrong((id *)&v6->_lsm, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    tasks = v6->_tasks;
    v6->_tasks = (NSMutableDictionary *)v10;

    v6->_lock_tasks._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (id)analyzeAssets:(id)a3 forFeature:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *tasks;
  void *v12;
  void *v13;
  OS_dispatch_queue *taskQueue;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  PLAnalysisCoordinator *v21;
  id v22;

  v8 = a5;
  v9 = a3;
  v10 = -[PLAnalysisCoordinatorTask initForFeature:assets:lsm:]([PLAnalysisCoordinatorTask alloc], "initForFeature:assets:lsm:", a4, v9, self->_lsm);

  os_unfair_lock_lock(&self->_lock_tasks);
  tasks = self->_tasks;
  objc_msgSend(v10, "taskID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](tasks, "setObject:forKeyedSubscript:", v10, v12);

  os_unfair_lock_unlock(&self->_lock_tasks);
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  taskQueue = self->_taskQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __72__PLAnalysisCoordinator_analyzeAssets_forFeature_withCompletionHandler___block_invoke;
  v19[3] = &unk_1E3676290;
  v20 = v10;
  v21 = self;
  v22 = v8;
  v15 = v8;
  v16 = v10;
  objc_msgSend(v13, "dispatchAsync:block:", taskQueue, v19);

  objc_msgSend(v16, "progress");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)analyzeLibraryForFeature:(unint64_t)a3 withCompletionHandler:(id)a4
{
  PLLibraryServicesManager *lsm;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;

  lsm = self->_lsm;
  v7 = a4;
  -[PLLibraryServicesManager databaseContext](lsm, "databaseContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newShortLivedLibraryWithName:", "-[PLAnalysisCoordinator analyzeLibraryForFeature:withCompletionHandler:]");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __72__PLAnalysisCoordinator_analyzeLibraryForFeature_withCompletionHandler___block_invoke;
  v18 = &unk_1E3677C18;
  v19 = v9;
  v20 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v12, "performBlockAndWait:", &v15);
  -[PLAnalysisCoordinator analyzeAssets:forFeature:withCompletionHandler:](self, "analyzeAssets:forFeature:withCompletionHandler:", v11, a3, v7, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_handleSearchFastPassTask:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PLAnalysisCoordinator *v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PLAnalysisCoordinator__handleSearchFastPassTask___block_invoke;
  v9[3] = &unk_1E3662888;
  v10 = v5;
  v11 = self;
  v12 = v4;
  v6 = v4;
  v7 = v5;
  v8 = -[PLAnalysisCoordinator analyzeLibraryForFeature:withCompletionHandler:](self, "analyzeLibraryForFeature:withCompletionHandler:", 2, v9);

}

- (void)reportBGSTCheckpointProgressForFeature:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PLFeatureAvailability *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  double v15;
  unint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  unint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager databaseContext](self->_lsm, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newShortLivedLibraryWithName:", "-[PLAnalysisCoordinator reportBGSTCheckpointProgressForFeature:]");

  objc_msgSend(v5, "globalValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "featureAvailability");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PLFeatureAvailability initWithDictionary:]([PLFeatureAvailability alloc], "initWithDictionary:", v7);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFeatureAvailability fractionForFeature:](v8, "fractionForFeature:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLFeatureAvailability processingSnapshot](v8, "processingSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "bgstTaskNameForCoordinatorFeature:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v20 = v5;
    objc_msgSend(MEMORY[0x1E0D00E58], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "totalAssetCount");
    objc_msgSend(v10, "doubleValue");
    v16 = llround(v15 * (double)v14 * 100.0);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    LOBYTE(v16) = objc_msgSend(v13, "reportProgressForTaskWithName:withGlobalTarget:completed:atDate:category:subCategory:error:", v12, v14, v16, v17, 10, 0, &v21);
    v18 = v21;

    if ((v16 & 1) == 0)
    {
      PLAnalysisCoordinatorGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v23 = a3;
        v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Report task workload progress failed for feature %lu: %@", buf, 0x16u);
      }

    }
    v5 = v20;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_lsm, 0);
}

void __51__PLAnalysisCoordinator__handleSearchFastPassTask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  NSObject *v5;
  __CFString *v6;
  void *v7;
  char v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fractionCompleted");
  if (v4 >= 0.35)
    objc_msgSend((id)objc_opt_class(), "reportBGSTFeaturePreviewAvailable:", 3);
  if (objc_msgSend(v3, "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 48), "setTaskCompleted");
  }
  else
  {
    PLAnalysisCoordinatorGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Task failed with analysis coordinator error: %@", buf, 0xCu);

    }
    v7 = *(void **)(a1 + 48);
    v12 = 0;
    v8 = objc_msgSend(v7, "setTaskExpiredWithRetryAfter:error:", &v12, 300.0);
    v9 = (__CFString *)v12;
    if ((v8 & 1) == 0)
    {
      PLAnalysisCoordinatorGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = CFSTR("Unknown");
        if (v9)
          v11 = v9;
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to expire task with error: %@", buf, 0xCu);
      }

    }
  }

}

void __72__PLAnalysisCoordinator_analyzeLibraryForFeature_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  +[PLManagedAsset fetchRequest](PLManagedAsset, "fetchRequest");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateToIncludeOnlyAllowedForAnalysisAssets](PLManagedAsset, "predicateToIncludeOnlyAllowedForAnalysisAssets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v2);

  objc_msgSend(v10, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "executeFetchRequest:error:", v10, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    do
    {
      v6 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v7, "objectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      objc_autoreleasePoolPop(v6);
      ++v5;
    }
    while (v5 < objc_msgSend(v4, "count"));
  }

}

void __72__PLAnalysisCoordinator_analyzeAssets_forFeature_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD v4[4];
  int8x16_t v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__PLAnalysisCoordinator_analyzeAssets_forFeature_withCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E366DF40;
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "executeWithCompletionHandler:", v4);

}

void __72__PLAnalysisCoordinator_analyzeAssets_forFeature_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 32);
  v6 = a2;
  os_unfair_lock_lock(v3);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "taskID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)registerSearchFastPassTaskWithBundleController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PLAnalysisCoordinator_registerSearchFastPassTaskWithBundleController___block_invoke;
  v7[3] = &unk_1E3662860;
  v8 = v4;
  v9 = a1;
  v6 = v4;
  objc_msgSend(v5, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.assetsd.PhotosSearchIndexing.fastpass"), 0, v7);

}

+ (unint64_t)bgstFeatureCodeForCoordinatorFeature:(unint64_t)a3
{
  if (a3 == 3)
    return 105;
  else
    return 0;
}

+ (id)bgstTaskNameForCoordinatorFeature:(unint64_t)a3
{
  if (a3 == 3)
    return CFSTR("com.apple.assetsd.PhotosSearchIndexing.fastpass");
  else
    return 0;
}

+ (void)reportBGSTFeaturePreviewAvailable:(unint64_t)a3
{
  uint64_t v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "bgstFeatureCodeForCoordinatorFeature:");
  if (v4)
  {
    v9 = 0;
    v5 = objc_msgSend(MEMORY[0x1E0D00E58], "reportFeatureCheckpoint:forFeature:error:", 30, v4, &v9);
    v6 = v9;
    if ((v5 & 1) == 0)
    {
      PLAnalysisCoordinatorGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = CFSTR("Unknown");
        if (v6)
          v8 = (const __CFString *)v6;
        *(_DWORD *)buf = 138412290;
        v11 = (unint64_t)v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to report preview available checkpoint with error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    PLAnalysisCoordinatorGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v11 = a3;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unknown feature %lu, not reporting available", buf, 0xCu);
    }
  }

}

+ (void)reportBGSTFeatureAvailable:(unint64_t)a3
{
  uint64_t v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  uint8_t buf[4];
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a1, "bgstFeatureCodeForCoordinatorFeature:");
  if (v4)
  {
    v9 = 0;
    v5 = objc_msgSend(MEMORY[0x1E0D00E58], "reportFeatureCheckpoint:forFeature:error:", 50, v4, &v9);
    v6 = v9;
    if ((v5 & 1) == 0)
    {
      PLAnalysisCoordinatorGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = CFSTR("Unknown");
        if (v6)
          v8 = (const __CFString *)v6;
        *(_DWORD *)buf = 138412290;
        v11 = (unint64_t)v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to report available checkpoint with error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    PLAnalysisCoordinatorGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v11 = a3;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unknown feature %lu, not reporting available", buf, 0xCu);
    }
  }

}

void __72__PLAnalysisCoordinator_registerSearchFastPassTaskWithBundleController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  PLPhotoLibraryOpener *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "becomeCurrentWithPendingUnitCount:", 1);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__PLAnalysisCoordinator_registerSearchFastPassTaskWithBundleController___block_invoke_2;
  v17[3] = &unk_1E3677AA0;
  v5 = v4;
  v18 = v5;
  objc_msgSend(v3, "setExpirationHandler:", v17);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  if (objc_msgSend(v6, "BOOLForKey:", CFSTR("PLAnalyisCoordinatorSkipSearchFastPass")))
  {
    PLAnalysisCoordinatorGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Skipping Search Fast Pass due to default being set", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "reportBGSTFeatureAvailable:", 3);
    objc_msgSend(v3, "setTaskCompleted");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "openBundleAtLibraryURL:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "libraryServicesManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PLPhotoLibraryOpener initWithLibraryServicesManager:reportInProgressUpgrades:]([PLPhotoLibraryOpener alloc], "initWithLibraryServicesManager:reportInProgressUpgrades:", v10, 0);
    v16 = 0;
    v12 = -[PLPhotoLibraryOpener openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:](v11, "openPhotoLibraryDatabaseWithAutoUpgrade:autoCreate:error:", 1, 0, &v16);
    v13 = v16;
    if (v12)
    {
      objc_msgSend(v10, "analysisCoordinator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_handleSearchFastPassTask:", v3);

    }
    else
    {
      PLAnalysisCoordinatorGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to open photo library: %@", buf, 0xCu);
      }

      objc_msgSend(v3, "setTaskExpiredWithRetryAfter:error:", 0, 0.0);
    }

  }
  objc_msgSend(v5, "resignCurrent");

}

uint64_t __72__PLAnalysisCoordinator_registerSearchFastPassTaskWithBundleController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

@end
