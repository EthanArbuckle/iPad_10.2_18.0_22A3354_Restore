@implementation PLComputeCacheManager

- (PLComputeCacheManager)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLComputeCacheManager *v6;
  uint64_t v7;
  PLJournalManager *journalManager;
  PLCoreAnalyticsEventManager *v9;
  PLCoreAnalyticsEventManager *coreAnalyticsManager;
  id v11;
  const char *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  void *v18;
  objc_super v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLComputeCacheManager.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lsm"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PLComputeCacheManager;
  v6 = -[PLComputeCacheManager init](&v19, sel_init);
  if (v6)
  {
    +[PLJournalManager journalManagerWithClass:libraryServiceManager:](PLJournalManager, "journalManagerWithClass:libraryServiceManager:", objc_opt_class(), v5);
    v7 = objc_claimAutoreleasedReturnValue();
    journalManager = v6->_journalManager;
    v6->_journalManager = (PLJournalManager *)v7;

    v9 = (PLCoreAnalyticsEventManager *)objc_alloc_init(MEMORY[0x1E0D731C0]);
    coreAnalyticsManager = v6->_coreAnalyticsManager;
    v6->_coreAnalyticsManager = v9;

    objc_storeWeak((id *)&v6->_lsm, v5);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%s.%@.queue"), "assetsd", objc_opt_class());
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v12, v14);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v15;

    v6->_restoreStateLock._os_unfair_lock_opaque = 0;
    -[PLComputeCacheManager _resetRestoreState](v6, "_resetRestoreState");

  }
  return v6;
}

- (void)_publish
{
  -[PLCoreAnalyticsEventManager publishAllEvents](self->_coreAnalyticsManager, "publishAllEvents");
  -[PLCoreAnalyticsEventManager removeEventWithName:](self->_coreAnalyticsManager, "removeEventWithName:", *MEMORY[0x1E0D73740]);
}

- (void)notifyReadyToRestoreWithInitialSyncDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL v8;
  NSObject *queue;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[16];

  v4 = a3;
  if (MEMORY[0x19AEC04BC]()
    && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("PLDisableAutoComputeCacheRestore")),
        v5,
        v6))
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "ComputeCacheManager: notified ready to restore but auto-restore disabled", buf, 2u);
    }

  }
  else
  {
    v8 = -[PLComputeCacheManager _isInitialSyncWithInitialSyncDate:](self, "_isInitialSyncWithInitialSyncDate:", v4);
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65__PLComputeCacheManager_notifyReadyToRestoreWithInitialSyncDate___block_invoke;
    v10[3] = &unk_1E36762F8;
    v10[4] = self;
    v11 = v8;
    dispatch_async(queue, v10);
  }

}

- (void)notifyCPLConfiguration:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PLComputeCacheManager_notifyCPLConfiguration___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BOOL)_isInitialSyncWithInitialSyncDate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  NSObject *v8;
  int v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "timeIntervalSinceNow");
  v6 = v5;
  if (v5 >= 0.0)
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Initial sync date has been set in the future. Interval: %lf", (uint8_t *)&v10, 0xCu);
    }

    goto LABEL_7;
  }
  v7 = fabs(v5) <= 120.0;
LABEL_8:

  return v7;
}

- (int64_t)_iCloudBackupState
{
  id v2;
  int64_t v3;

  v2 = objc_alloc_init(MEMORY[0x1E0D4E0A8]);
  if (objc_msgSend(v2, "isBackupEnabled"))
    v3 = objc_msgSend(v2, "isBackupEnabledForDomainName:", CFSTR("CameraRollDomain"));
  else
    v3 = 0;

  return v3;
}

- (BOOL)resetComputeCacheWithError:(id *)a3
{
  NSObject *queue;
  int v5;
  id v6;
  void *v7;
  char v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__57771;
  v15 = __Block_byref_object_dispose__57772;
  v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PLComputeCacheManager_resetComputeCacheWithError___block_invoke;
  block[3] = &unk_1E3677830;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(queue, block);
  v5 = *((unsigned __int8 *)v18 + 24);
  v6 = (id)v12[5];
  v7 = v6;
  if (!v5 && a3)
    *a3 = objc_retainAutorelease(v6);

  v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (BOOL)snapshotComputeCacheAndBackupIfNeededWithError:(id *)a3
{
  NSObject *queue;
  int v5;
  id v6;
  void *v7;
  char v8;
  _QWORD block[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__57771;
  v15 = __Block_byref_object_dispose__57772;
  v16 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PLComputeCacheManager_snapshotComputeCacheAndBackupIfNeededWithError___block_invoke;
  block[3] = &unk_1E3677830;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v11;
  dispatch_sync(queue, block);
  v5 = *((unsigned __int8 *)v18 + 24);
  v6 = (id)v12[5];
  v7 = v6;
  if (!v5 && a3)
    *a3 = objc_retainAutorelease(v6);

  v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (BOOL)snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4
{
  NSObject *queue;
  int v6;
  id v7;
  void *v8;
  char v9;
  _QWORD block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__57771;
  v16 = __Block_byref_object_dispose__57772;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__PLComputeCacheManager_snapshotJournalsForPayloadClassIDs_error___block_invoke;
  block[3] = &unk_1E3677830;
  block[4] = self;
  block[5] = &v18;
  block[6] = &v12;
  dispatch_sync(queue, block);
  v6 = *((unsigned __int8 *)v19 + 24);
  v7 = (id)v13[5];
  v8 = v7;
  if (!v6 && a4)
    *a4 = objc_retainAutorelease(v7);

  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (void)snapshotJournalsForPayloadClassIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __82__PLComputeCacheManager_snapshotJournalsForPayloadClassIDs_withCompletionHandler___block_invoke;
  v8[3] = &unk_1E3675C58;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

- (BOOL)_snapshotJournalsWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEnabledWithPathManager:error:", v7, 0);

  PLMigrationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_loadWeakRetained((id *)&self->_lsm);
      objc_msgSend(v19, "pathManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Snapshot disabled for library: %@", buf, 0xCu);

    }
    v14 = 0;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = objc_loadWeakRetained((id *)&self->_lsm);
    objc_msgSend(v11, "pathManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v12;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "ComputeCacheManager: Performing snapshot for library: %@", buf, 0xCu);

  }
  v22 = 0;
  v13 = -[PLComputeCacheManager _performSnapshotWithError:](self, "_performSnapshotWithError:", &v22);
  v14 = v22;
  if (v13)
  {
LABEL_12:
    v18 = 1;
    goto LABEL_13;
  }
  PLMigrationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = objc_loadWeakRetained((id *)&self->_lsm);
    objc_msgSend(v16, "pathManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v24 = v17;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "ComputeCacheManager: : Snapshot failed for library %@. Error: %@", buf, 0x16u);

  }
  if (a3)
  {
    v14 = objc_retainAutorelease(v14);
    v18 = 0;
    *a3 = v14;
  }
  else
  {
    v18 = 0;
  }
LABEL_13:
  -[PLComputeCacheManager _resetRestoreState](self, "_resetRestoreState");

  return v18;
}

- (BOOL)_performSnapshotWithError:(id *)a3
{
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PLComputeCacheManager__performSnapshotWithError___block_invoke;
  v7[3] = &unk_1E3675800;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  objc_msgSend(v5, "sync:identifyingBlock:library:", v7, 0, 0);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (BOOL)_removeSnapshotWithError:(id *)a3
{
  return -[PLComputeCacheManager _removeComputeCacheDataForMatchingRestoreState:error:](self, "_removeComputeCacheDataForMatchingRestoreState:error:", 0, a3);
}

- (id)_snapshotPolicy
{
  void *v3;
  PLComputeCachePolicyDataSource *v4;
  void *v5;
  PLComputeCachePolicy *v6;

  -[PLComputeCacheManager _shortLivedLibrary](self, "_shortLivedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLComputeCachePolicyDataSource initWithPhotoLibrary:restoreState:]([PLComputeCachePolicyDataSource alloc], "initWithPhotoLibrary:restoreState:", v3, -[PLComputeCacheManager _restoreState](self, "_restoreState"));
  -[PLComputeCacheManager _cachedPolicyConfiguration](self, "_cachedPolicyConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLComputeCachePolicy initWithPolicyData:configuration:]([PLComputeCachePolicy alloc], "initWithPolicyData:configuration:", v4, v5);

  return v6;
}

- (void)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 completionHandler:(id)a5
{
  if (a5)
    (*((void (**)(id, float))a5 + 2))(a5, a4);
}

- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)createArchiveWithError:(id *)a3
{
  NSObject *queue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PLComputeCacheManager_createArchiveWithError___block_invoke;
  block[3] = &unk_1E3675800;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_createArchiveWithError:(id *)a3
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  BOOL v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = -[PLComputeCacheManager _restoreState](self, "_restoreState");
  if (v5 < 2)
  {
    v15 = 0;
    v11 = -[PLComputeCacheManager _archiveSnapshotIfNecessaryWithError:](self, "_archiveSnapshotIfNecessaryWithError:", &v15);
    v12 = v15;
    if (v11)
    {
      v13 = 1;
      goto LABEL_13;
    }
  }
  else
  {
    if (v5 - 2 > 1)
    {
      v9 = 0;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D74498];
      v18 = *MEMORY[0x1E0CB2938];
      v19[0] = CFSTR("Backup triggered before restore has completed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 52008, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      PLMigrationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Attempting to backup the compute cache archive before restore has completed. Error: %@", buf, 0xCu);
      }

    }
    v12 = v9;
  }
  if (a3)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a3 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (BOOL)_archiveSnapshotIfNecessaryWithError:(id *)a3
{
  BOOL v5;

  v5 = -[PLComputeCacheManager _hasPrepareDataToBackupWithError:](self, "_hasPrepareDataToBackupWithError:")
    && -[PLComputeCacheManager _archiveSnapshotWithError:](self, "_archiveSnapshotWithError:", a3)
    && -[PLComputeCacheManager _transferToBackupLocationWithError:](self, "_transferToBackupLocationWithError:", a3);
  -[PLComputeCacheManager _resetRestoreState](self, "_resetRestoreState");
  return v5;
}

- (BOOL)_hasPrepareDataToBackupWithError:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  BOOL v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__PLComputeCacheManager__hasPrepareDataToBackupWithError___block_invoke;
  v13[3] = &unk_1E366D7A8;
  v13[4] = &v14;
  -[PLComputeCacheManager _enumerateComputeCachePrepareDirectoryUsingBlock:](self, "_enumerateComputeCachePrepareDirectoryUsingBlock:", v13);
  if (*((_BYTE *)v15 + 24))
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2938];
    v21[0] = CFSTR("Backup triggered on missing prepare data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 52009, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Attempting to backup from prepare location with no data. Error: %@", buf, 0xCu);
    }

    v9 = *((unsigned __int8 *)v15 + 24);
    v10 = v7;
    v4 = v10;
    if (!v9 && a3)
    {
      v4 = objc_retainAutorelease(v10);
      *a3 = v4;
    }
  }

  v11 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);
  return v11;
}

- (BOOL)_archiveSnapshotWithError:(id *)a3
{
  BOOL v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v10;
  BOOL v11;
  id v13;
  id v14;

  v14 = 0;
  v5 = -[PLComputeCacheManager _archivePrepareDirectoryWithError:](self, "_archivePrepareDirectoryWithError:", &v14);
  v6 = v14;
  v7 = v6;
  if (v5)
  {
    v13 = v6;
    v8 = -[PLComputeCacheManager _addBackupCreatedMarkerWithError:](self, "_addBackupCreatedMarkerWithError:", &v13);
    v9 = v13;

    v10 = v9;
    if (v8)
    {
      v11 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v10 = v6;
  }
  if (a3)
  {
    v10 = objc_retainAutorelease(v10);
    v11 = 0;
    *a3 = v10;
  }
  else
  {
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (BOOL)_transferToBackupLocationWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  BOOL v22;
  NSObject *v23;
  id v24;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v5, "_urlForLocation:pathManager:createIfNeeded:error:", 5, v7, 1, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;

  if (v8)
  {
    v27 = v9;
    v10 = -[PLComputeCacheManager _removeLocation:error:](self, "_removeLocation:error:", 6, &v27);
    v11 = v27;

    if (v10)
    {
      v12 = (void *)objc_opt_class();
      v13 = objc_loadWeakRetained((id *)&self->_lsm);
      objc_msgSend(v13, "pathManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_urlForLocation:pathManager:createIfNeeded:error:", 6, v14, 0, 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_opt_class();
      v17 = objc_loadWeakRetained((id *)&self->_lsm);
      objc_msgSend(v17, "pathManager");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "_urlForLocation:pathManager:createIfNeeded:error:", 1, v18, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v11;
      LOBYTE(v18) = objc_msgSend(v20, "moveItemAtURL:toURL:error:", v19, v15, &v26);
      v9 = v26;

      if ((v18 & 1) != 0)
      {

        v21 = v9;
        v22 = 1;
        goto LABEL_15;
      }
      PLMigrationGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v9;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to transfer the backup cache to the restore location. Error: %@", buf, 0xCu);
      }

    }
    else
    {
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v11;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove previous backup archive. Error: %@", buf, 0xCu);
      }
      v9 = v11;
    }

  }
  v24 = v9;
  v21 = v24;
  if (a3)
  {
    v21 = objc_retainAutorelease(v24);
    v22 = 0;
    *a3 = v21;
  }
  else
  {
    v22 = 0;
  }
LABEL_15:

  return v22;
}

- (BOOL)_addBackupCreatedMarkerWithError:(id *)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  BOOL v12;
  NSObject *v13;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "_urlForLocation:pathManager:createIfNeeded:error:", 2, v7, 1, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;

  if (v8)
  {
    v15 = v9;
    v10 = +[PLJournalFile createEmptyURL:error:](PLJournalFile, "createEmptyURL:error:", v8, &v15);
    v11 = v15;

    if (v10)
    {
      v12 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = v9;
  }
  PLMigrationGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v11;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to create marker. Error: %@", buf, 0xCu);
  }

  if (a3)
  {
    v11 = objc_retainAutorelease(v11);
    v12 = 0;
    *a3 = v11;
  }
  else
  {
    v12 = 0;
  }
LABEL_10:

  return v12;
}

- (BOOL)restoreComputeCacheWithProgress:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  int v9;
  id v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__57771;
  v22 = __Block_byref_object_dispose__57772;
  v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__PLComputeCacheManager_restoreComputeCacheWithProgress_error___block_invoke;
  v14[3] = &unk_1E3676348;
  v16 = &v24;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v17 = &v18;
  dispatch_sync(queue, v14);
  v9 = *((unsigned __int8 *)v25 + 24);
  v10 = (id)v19[5];
  v11 = v10;
  if (!v9 && a4)
    *a4 = objc_retainAutorelease(v10);

  v12 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v12;
}

- (BOOL)_restoreComputeCacheWithProgress:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  int v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint32_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  BOOL v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v10 = objc_msgSend(v7, "isEnabledWithPathManager:error:", v9, &v43);
  v11 = v43;

  if (v10)
  {
    switch(-[PLComputeCacheManager _restoreState](self, "_restoreState"))
    {
      case 0:
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0D74498];
        v52 = *MEMORY[0x1E0CB2938];
        v53[0] = CFSTR("Restore not required");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 52004, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        *(_WORD *)buf = 0;
        v17 = "ComputeCacheManager: Restore already completed";
        v18 = v16;
        v19 = OS_LOG_TYPE_DEFAULT;
        v20 = 2;
        goto LABEL_26;
      case 1:
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0D74498];
        v50 = *MEMORY[0x1E0CB2938];
        v51 = CFSTR("Restore not permitted for self created archive");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 52005, v35);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_DWORD *)buf = 138412290;
        v45 = v15;
        v17 = "ComputeCacheManager: Attempting to restore the compute cache from a self created archive. Error: %@";
        goto LABEL_25;
      case 2:
        -[PLComputeCacheManager _setRestoreState:](self, "_setRestoreState:", 3);
        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", 1, v6, objc_msgSend(v6, "totalUnitCount"));
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = 0;
        }
        v42 = v11;
        v24 = -[PLComputeCacheManager _restoreComputeCacheArchiveWithProgress:error:](self, "_restoreComputeCacheArchiveWithProgress:error:", v21, &v42);
        v40 = v42;

        -[NSObject setCompletedUnitCount:](v21, "setCompletedUnitCount:", -[NSObject completedUnitCount](v21, "completedUnitCount") + 1);
        v11 = v40;
        goto LABEL_8;
      case 3:
        v36 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0D74498];
        v48 = *MEMORY[0x1E0CB2938];
        v49 = CFSTR("Restore not permitted whilst restore is currently in progress");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 52007, v38);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_DWORD *)buf = 138412290;
        v45 = v15;
        v17 = "ComputeCacheManager: Attempting to restore the compute cache when restore is currently in progress. Error: %@";
LABEL_25:
        v18 = v16;
        v19 = OS_LOG_TYPE_ERROR;
        v20 = 12;
LABEL_26:
        _os_log_impl(&dword_199541000, v18, v19, v17, buf, v20);
LABEL_27:

        v31 = v15;
        if (!a4)
          goto LABEL_28;
        goto LABEL_16;
      default:
        v31 = v11;
        goto LABEL_18;
    }
  }
  PLMigrationGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_loadWeakRetained((id *)&self->_lsm);
    objc_msgSend(v22, "pathManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v45 = v23;
    v46 = 2112;
    v47 = v11;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: : Restore not permitted for library %@. Error: %@", buf, 0x16u);

  }
  v24 = 0;
LABEL_8:

  PLMigrationGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: : Cleaning up restore and backup archive", buf, 2u);
  }

  v41 = 0;
  v26 = -[PLComputeCacheManager _removeRestoreDataWithError:](self, "_removeRestoreDataWithError:", &v41);
  v27 = v41;
  if (!v26)
  {
    PLMigrationGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = objc_loadWeakRetained((id *)&self->_lsm);
      objc_msgSend(v29, "pathManager");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v30;
      v46 = 2112;
      v47 = v27;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "ComputeCacheManager: : Cleanup restore data error for library %@. Error: %@", buf, 0x16u);

    }
  }
  -[PLComputeCacheManager _resetRestoreState](self, "_resetRestoreState");

  v31 = v11;
  if (v24)
  {
LABEL_18:
    v32 = 1;
  }
  else if (a4)
  {
LABEL_16:
    v31 = objc_retainAutorelease(v31);
    v32 = 0;
    *a4 = v31;
  }
  else
  {
LABEL_28:
    v32 = 0;
  }

  return v32;
}

- (BOOL)_restoreComputeCacheArchiveWithProgress:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  __int16 v10;
  NSDate *iCloudBackupRestoreDateStart;
  PLCoreAnalyticsEventManager *coreAnalyticsManager;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  BOOL v23;
  _BOOL4 v25;
  PLPhotoLibrary *v26;
  PLPhotoLibrary *restoreCachePhotoLibrary;
  id WeakRetained;
  void *v29;
  void *v30;
  char v31;
  PLPhotoLibrary *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  int v47;
  NSObject *v48;
  void *v49;
  void *v50;
  PLPhotoLibrary *v51;
  id *location;
  void *v53;
  id v54;
  _QWORD v55[5];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  __int128 *p_buf;
  id v62;
  id v63;
  uint8_t v64[2];
  __int128 buf;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  _QWORD v71[3];

  v71[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLComputeCacheManager _cachedPolicyConfiguration](self, "_cachedPolicyConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isRestoreEnabled") & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v70 = *MEMORY[0x1E0CB2938];
    v71[0] = CFSTR("Restore disabled by server configuration");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 52006, v20);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: Restore disabled by server configuration", (uint8_t *)&buf, 2u);
    }

    goto LABEL_13;
  }
  -[PLComputeCacheManager _setICloudBackupRestoreDateFromArchive](self, "_setICloudBackupRestoreDateFromArchive");
  *(_WORD *)v64 = 0;
  v63 = 0;
  v8 = -[PLComputeCacheManager _incrementRestoreCount:error:](self, "_incrementRestoreCount:error:", v64, &v63);
  v9 = v63;
  if (!v8)
    goto LABEL_9;
  v10 = *(_WORD *)v64;
  if (*(__int16 *)v64 >= 2)
  {
    iCloudBackupRestoreDateStart = self->_iCloudBackupRestoreDateStart;
    self->_iCloudBackupRestoreDateStart = 0;

    v10 = *(_WORD *)v64;
  }
  coreAnalyticsManager = self->_coreAnalyticsManager;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCoreAnalyticsEventManager setPayloadValue:forKey:onEventWithName:](coreAnalyticsManager, "setPayloadValue:forKey:onEventWithName:", v13, *MEMORY[0x1E0D73768], *MEMORY[0x1E0D73740]);

  if (*(__int16 *)v64 >= 6)
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = *(__int16 *)v64;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Too many attempts to restore. Attempts count: %hd", (uint8_t *)&buf, 8u);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v68 = *MEMORY[0x1E0CB2938];
    v69 = CFSTR("Too many attempts to restore compute cache");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 52003, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v17;
LABEL_9:
    v18 = v9;
    goto LABEL_13;
  }
  v62 = v9;
  v25 = -[PLComputeCacheManager _transferAndPrepareComputeCacheFromBackupToRestoreLocationWithError:](self, "_transferAndPrepareComputeCacheFromBackupToRestoreLocationWithError:", &v62);
  v18 = v62;

  if (v25)
  {
    -[PLComputeCacheManager _shortLivedLibrary](self, "_shortLivedLibrary");
    v26 = (PLPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    restoreCachePhotoLibrary = self->_restoreCachePhotoLibrary;
    self->_restoreCachePhotoLibrary = v26;

    -[PLPhotoLibrary libraryID](self->_restoreCachePhotoLibrary, "libraryID");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id *)&self->_lsm;
    WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    objc_msgSend(WeakRetained, "pathManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    PLLibraryIDFromPathManager();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v53, "isEqual:", v30);

    v32 = self->_restoreCachePhotoLibrary;
    if ((v31 & 1) == 0)
    {
      -[PLPhotoLibrary libraryID](v32, "libraryID");
      objc_claimAutoreleasedReturnValue();
      objc_msgSend(objc_loadWeakRetained(location), "pathManager");
      objc_claimAutoreleasedReturnValue();
      PLLibraryIDFromPathManager();
      objc_claimAutoreleasedReturnValue();
      _PFAssertFailHandler();
      __break(1u);
    }
    -[PLPhotoLibrary disableOpportunisticTasks](v32, "disableOpportunisticTasks");
    v33 = (void *)objc_opt_class();
    v34 = objc_loadWeakRetained(location);
    objc_msgSend(v34, "pathManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_urlForLocation:pathManager:createIfNeeded:error:", 3, v35, 0, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_alloc(MEMORY[0x1E0C99DE8]);
    +[PLComputeCacheManager restorePayloadClasses](PLComputeCacheManager, "restorePayloadClasses");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v37, "initWithCapacity:", objc_msgSend(v38, "count"));

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v66 = 0x2020000000;
    v67 = 0;
    +[PLComputeCacheManager restorePayloadClasses](PLComputeCacheManager, "restorePayloadClasses");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke;
    v58[3] = &unk_1E366D7D0;
    v54 = v36;
    v59 = v54;
    p_buf = &buf;
    v42 = v39;
    v60 = v42;
    objc_msgSend(v40, "enumerateObjectsUsingBlock:", v58);
    v43 = v41;

    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 24), v6, objc_msgSend(v6, "totalUnitCount"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v43;
    v55[1] = 3221225472;
    v55[2] = __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke_2;
    v55[3] = &unk_1E366D820;
    v55[4] = self;
    v45 = v6;
    v56 = v45;
    v46 = v44;
    v57 = v46;
    objc_msgSend(v42, "enumerateObjectsUsingBlock:", v55);
    -[PLPhotoLibrary enableOpportunisticTasks](self->_restoreCachePhotoLibrary, "enableOpportunisticTasks");
    v47 = objc_msgSend(v45, "isCancelled");
    if (v47)
    {
      PLMigrationGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v64 = 0;
        _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "ComputeCacheJournalManager: Early return from journal re-create non-assets due to progress cancel", v64, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41031, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (a4)
        *a4 = objc_retainAutorelease(v49);

    }
    objc_msgSend(v46, "setCompletedUnitCount:", objc_msgSend(v46, "totalUnitCount"));
    v51 = self->_restoreCachePhotoLibrary;
    self->_restoreCachePhotoLibrary = 0;

    _Block_object_dispose(&buf, 8);
    if (!v47)
    {
      v23 = 1;
      goto LABEL_18;
    }
  }
LABEL_13:
  objc_msgSend(v6, "setCompletedUnitCount:", objc_msgSend(v6, "totalUnitCount"));
  PLMigrationGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to restore compute cache. Error: %@", (uint8_t *)&buf, 0xCu);
  }

  if (a4)
  {
    v18 = objc_retainAutorelease(v18);
    v23 = 0;
    *a4 = v18;
  }
  else
  {
    v23 = 0;
  }
LABEL_18:

  return v23;
}

- (BOOL)_transferAndPrepareComputeCacheFromBackupToRestoreLocationWithError:(id *)a3
{
  PLLibraryServicesManager **p_lsm;
  id WeakRetained;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  char v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  NSObject *v27;
  char v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  BOOL v35;
  NSObject *v36;
  NSObject *v37;
  id v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  id v44;
  uint8_t buf[4];
  NSObject *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  p_lsm = &self->_lsm;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "clientSideEncryptionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v44 = 0;
    v8 = -[PLComputeCacheManager _removeLocation:error:](self, "_removeLocation:error:", 3, &v44);
    v9 = v44;
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = objc_loadWeakRetained((id *)p_lsm);
      objc_msgSend(v11, "pathManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_urlForLocation:pathManager:createIfNeeded:error:", 6, v12, 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_opt_class();
      v15 = objc_loadWeakRetained((id *)p_lsm);
      objc_msgSend(v15, "pathManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v9;
      objc_msgSend(v14, "_urlForLocation:pathManager:createIfNeeded:error:", 4, v16, 1, &v43);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v43;

      if (v17)
      {
        v19 = objc_alloc_init(MEMORY[0x1E0CB3620]);
        v42 = v18;
        v20 = objc_msgSend(v19, "copyItemAtURL:toURL:error:", v13, v17, &v42);
        v9 = v42;

        if ((v20 & 1) != 0)
        {

          v21 = (void *)objc_opt_class();
          v22 = objc_loadWeakRetained((id *)p_lsm);
          objc_msgSend(v22, "pathManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "_urlForLocation:pathManager:createIfNeeded:error:", 4, v23, 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = objc_loadWeakRetained((id *)p_lsm);
          objc_msgSend(v24, "clientSideEncryptionManager");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v9;
          v26 = objc_msgSend(v25, "unarchiveDirectoryAtURL:error:", v13, &v41);
          v27 = v41;

          if (v26)
          {
            v40 = v27;
            v28 = objc_msgSend(MEMORY[0x1E0D73208], "removeItemAtURL:error:", v13, &v40);
            v9 = v40;

            if ((v28 & 1) != 0)
            {

              v29 = v9;
              v30 = 1;
LABEL_26:

              goto LABEL_27;
            }
            PLMigrationGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v9;
              _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove the archive from the restore location. Error: %@", buf, 0xCu);
            }
          }
          else
          {
            v39 = 0;
            v35 = -[PLComputeCacheManager _removeLocation:error:](self, "_removeLocation:error:", 3, &v39);
            v17 = v39;
            if (!v35)
            {
              PLMigrationGetLog();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v17;
                _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to clean up the restore location. Error: %@", buf, 0xCu);
              }

            }
            v9 = v27;
          }
        }
        else
        {
          PLMigrationGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v9;
            _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to transfer the backup cache to the restore location. Error: %@", buf, 0xCu);
          }

        }
      }
      else
      {
        PLMigrationGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v18;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to create the restore location. Error: %@", buf, 0xCu);
        }
        v9 = v18;
      }

    }
    v37 = v9;
    v29 = v37;
    if (a3)
    {
      v29 = objc_retainAutorelease(v37);
      v30 = 0;
      *a3 = v29;
    }
    else
    {
      v30 = 0;
    }
    goto LABEL_26;
  }
  v31 = (void *)MEMORY[0x1E0CB35C8];
  v32 = *MEMORY[0x1E0D74498];
  v47 = *MEMORY[0x1E0CB2938];
  v48[0] = CFSTR("Encryption manager not initialized");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 52011, v33);
  v29 = objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v29 = objc_retainAutorelease(v29);
    v30 = 0;
    *a3 = v29;
  }
  else
  {
    v30 = 0;
  }
LABEL_27:

  return v30;
}

- (BOOL)_removeRestoreDataWithError:(id *)a3
{
  return -[PLComputeCacheManager _removeComputeCacheDataForMatchingRestoreState:error:](self, "_removeComputeCacheDataForMatchingRestoreState:error:", 3, a3);
}

- (BOOL)isReadyForAnalysis
{
  return (-[PLComputeCacheManager _restoreState](self, "_restoreState") & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (int64_t)_restoreState
{
  return -[PLComputeCacheManager _performBlockOnRestoreStateLockAndWait:](self, "_performBlockOnRestoreStateLockAndWait:", 0);
}

- (int64_t)_performBlockOnRestoreStateLockAndWait:(id)a3
{
  void (**v4)(id, int64_t);
  os_unfair_lock_s *p_restoreStateLock;
  NSNumber *restoreState;
  NSNumber *v7;
  _BOOL4 v8;
  int64_t v9;

  v4 = (void (**)(id, int64_t))a3;
  p_restoreStateLock = &self->_restoreStateLock;
  os_unfair_lock_lock(&self->_restoreStateLock);
  restoreState = self->_restoreState;
  if (!restoreState)
  {
    self->_restoreState = (NSNumber *)&unk_1E375F8D0;
    if (-[PLComputeCacheManager _hasBackupArchive](self, "_hasBackupArchive"))
    {
      v7 = self->_restoreState;
      self->_restoreState = (NSNumber *)&unk_1E375F8A0;

    }
    v8 = -[PLComputeCacheManager _hasBackupCreatedMarker](self, "_hasBackupCreatedMarker");
    restoreState = self->_restoreState;
    if (v8)
    {
      self->_restoreState = (NSNumber *)&unk_1E375F8B8;

      restoreState = self->_restoreState;
    }
  }
  v9 = -[NSNumber integerValue](restoreState, "integerValue");
  if (v4)
    v4[2](v4, v9);
  os_unfair_lock_unlock(p_restoreStateLock);

  return v9;
}

- (void)_setRestoreState:(int64_t)a3
{
  PLRunWithUnfairLock();
}

- (void)_resetRestoreState
{
  PLRunWithUnfairLock();
}

- (BOOL)_hasBackupCreatedMarker
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlForLocation:pathManager:createIfNeeded:error:", 2, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v7 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v11);
  v8 = v11;
  if ((v7 & 1) == 0)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Backup marker is not reachable. Error: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (BOOL)_hasBackupArchive
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlForLocation:pathManager:createIfNeeded:error:", 6, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  v7 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v11);
  v8 = v11;
  if ((v7 & 1) == 0)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Backup archive is not available. Error: %@", buf, 0xCu);
    }

  }
  return v7;
}

- (BOOL)_removeComputeCacheDataForMatchingRestoreState:(int64_t)a3 error:(id *)a4
{
  int v5;
  id v6;
  void *v7;
  char v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__57771;
  v19 = __Block_byref_object_dispose__57772;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__PLComputeCacheManager__removeComputeCacheDataForMatchingRestoreState_error___block_invoke;
  v10[3] = &unk_1E366D848;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v15;
  v10[7] = a3;
  -[PLComputeCacheManager _performBlockOnRestoreStateLockAndWait:](self, "_performBlockOnRestoreStateLockAndWait:", v10);
  v5 = *((unsigned __int8 *)v12 + 24);
  v6 = (id)v16[5];
  v7 = v6;
  if (!v5 && a4)
    *a4 = objc_retainAutorelease(v6);

  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v8;
}

- (BOOL)_removeLocation:(int64_t)a3 error:(id *)a4
{
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  int64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlForLocation:pathManager:createIfNeeded:error:", a3, v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v11 = objc_msgSend(MEMORY[0x1E0D73208], "removeItemAtURL:error:", v10, &v15);
  v12 = v15;
  if ((v11 & 1) == 0)
  {
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v17 = a3;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove location %tu. Error: %@", buf, 0x16u);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v11;
}

- (BOOL)_incrementRestoreCount:(signed __int16 *)a3 error:(id *)a4
{
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  unsigned int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  id v31;
  BOOL v32;
  __int16 value;
  id v35;
  unsigned __int16 v36;
  id v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_urlForLocation:pathManager:createIfNeeded:error:", 6, v9, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  LODWORD(v9) = objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", &v37);
  v11 = v37;
  v12 = v11;
  if (!(_DWORD)v9)
  {
    PLMigrationGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v12;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Increment: Backup resource is not available. Error: %@", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v36 = 0;
  v35 = v11;
  v13 = -[PLComputeCacheManager _getRestoreCount:error:](self, "_getRestoreCount:error:", &v36, &v35);
  v14 = v35;

  if (!v13)
  {
    PLMigrationGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v14;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to increment count, missing initial value. Error: %@", buf, 0xCu);
    }

    goto LABEL_14;
  }
  v15 = ++v36;
  value = bswap32(v15) >> 16;
  if (setxattr((const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"), (const char *)objc_msgSend(CFSTR("com.apple.Photos.computecacherestorecount"), "UTF8String"), &value, 2uLL, 0, 0))
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2FE0];
    v18 = *__error();
    v42 = *MEMORY[0x1E0CB2938];
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = __error();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%s"), strerror(*v20));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0D74498];
    v40 = *MEMORY[0x1E0CB3388];
    v41 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 52002, v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    PLMigrationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v39 = v12;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to increment the restore count. Error: %@", buf, 0xCu);
    }

LABEL_10:
    v14 = v12;
LABEL_14:
    v30 = v14;
    v31 = v30;
    if (a4)
    {
      v31 = objc_retainAutorelease(v30);
      v32 = 0;
      *a4 = v31;
    }
    else
    {
      v32 = 0;
    }
    goto LABEL_20;
  }
  if (a3)
    *a3 = v36;
  v31 = v14;
  v32 = 1;
LABEL_20:

  return v32;
}

- (BOOL)_getRestoreCount:(signed __int16 *)a3 error:(id *)a4
{
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  ssize_t v12;
  unsigned int v13;
  BOOL v14;
  id v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  unsigned __int16 value;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    objc_msgSend(WeakRetained, "pathManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_urlForLocation:pathManager:createIfNeeded:error:", 6, v9, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    LOBYTE(WeakRetained) = objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", &v32);
    v11 = v32;
    if ((WeakRetained & 1) != 0)
    {
      value = 0;
      v12 = getxattr((const char *)objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"), (const char *)objc_msgSend(CFSTR("com.apple.Photos.computecacherestorecount"), "UTF8String"), &value, 2uLL, 0, 0);
      if (v12 == 2)
      {
        v13 = bswap32(value) >> 16;
      }
      else
      {
        if (v12 < 0 && *__error() != 93)
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v18 = *MEMORY[0x1E0CB2FE0];
          v19 = *__error();
          v37 = *MEMORY[0x1E0CB2938];
          v20 = (void *)MEMORY[0x1E0CB3940];
          v21 = __error();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("%s"), strerror(*v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = (void *)MEMORY[0x1E0CB35C8];
          v26 = *MEMORY[0x1E0D74498];
          v35 = *MEMORY[0x1E0CB3388];
          v36 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 52002, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          PLMigrationGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v34 = v28;
            _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to get the increment count. Error: %@", buf, 0xCu);
          }

          v30 = v28;
          v15 = v30;
          if (a4)
          {
            v15 = objc_retainAutorelease(v30);
            v14 = 0;
            *a4 = v15;
          }
          else
          {
            v14 = 0;
          }
          goto LABEL_11;
        }
        LOWORD(v13) = 0;
      }
      *a3 = v13;
    }
    v15 = v11;
    v14 = 1;
LABEL_11:

    return v14;
  }
  return 1;
}

- (unint64_t)_getArchiveSize
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  unint64_t v11;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlForLocation:pathManager:createIfNeeded:error:", 6, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v7 = *MEMORY[0x1E0C99998];
  v13 = 0;
  LOBYTE(v5) = objc_msgSend(v6, "getResourceValue:forKey:error:", &v14, v7, &v13);
  v8 = v14;
  v9 = v13;
  if ((v5 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
  {
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to get the file size from the archive. Error: %@", buf, 0xCu);
    }

  }
  v11 = objc_msgSend(v8, "unsignedIntegerValue");

  return v11;
}

- (void)_enumerateComputeCachePrepareDirectoryUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    objc_msgSend(WeakRetained, "pathManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_urlForLocation:pathManager:createIfNeeded:error:", 0, v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C999D0];
    v26[0] = *MEMORY[0x1E0C99A90];
    v26[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v11, 7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLComputeCacheManager _filenameExclusionList](self, "_filenameExclusionList");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v18);
        if (-[PLComputeCacheManager _isValidArchiveURL:filenameExclusionList:](self, "_isValidArchiveURL:filenameExclusionList:", v19, v13))
        {
          v20 = 0;
          v4[2](v4, v19, &v20);
          if (v20)
            break;
        }
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (id)_filenameExclusionList
{
  void *v3;
  id WeakRetained;
  void *v5;
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

  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlForLocation:pathManager:createIfNeeded:error:", 2, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_class();
  v9 = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(v9, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_urlForLocation:pathManager:createIfNeeded:error:", 1, v10, 1, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLJournalManagerCore historyTokenURL](self->_journalManager, "historyTokenURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v7, v12, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)_isValidArchiveURL:(id)a3 filenameExclusionList:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    -[PLComputeCacheManager _filenameExclusionList](self, "_filenameExclusionList");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = 0;
  objc_msgSend(v6, "getResourceValue:forKey:error:", &v12, *MEMORY[0x1E0C999D0], 0);
  v8 = v12;
  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    v11 = 0;
    objc_msgSend(v6, "getResourceValue:forKey:error:", &v11, *MEMORY[0x1E0C99A90], 0);
    v9 = objc_msgSend(v7, "containsObject:", v11) ^ 1;
  }

  return v9;
}

- (BOOL)_archivePrepareDirectoryWithError:(id *)a3
{
  PLLibraryServicesManager **p_lsm;
  id WeakRetained;
  void *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  dispatch_semaphore_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v32[5];
  NSObject *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__57771;
  v42 = __Block_byref_object_dispose__57772;
  p_lsm = &self->_lsm;
  v43 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "clientSideEncryptionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v8)
  {
    *((_BYTE *)v45 + 24) = 0;
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v48 = *MEMORY[0x1E0CB2938];
    v49[0] = CFSTR("Encryption manager not initialized");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 52011, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v39[5];
    v39[5] = v29;

    if (a3)
      *a3 = objc_retainAutorelease((id)v39[5]);
    v26 = *((unsigned __int8 *)v45 + 24);
  }
  else
  {
    v9 = (void *)objc_opt_class();
    v10 = objc_loadWeakRetained((id *)p_lsm);
    objc_msgSend(v10, "pathManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_urlForLocation:pathManager:createIfNeeded:error:", 1, v11, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)objc_opt_class();
    v14 = objc_loadWeakRetained((id *)p_lsm);
    objc_msgSend(v14, "pathManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_urlForLocation:pathManager:createIfNeeded:error:", 0, v15, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLComputeCacheManager _filenameExclusionList](self, "_filenameExclusionList");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = dispatch_semaphore_create(0);
    v19 = objc_loadWeakRetained((id *)p_lsm);
    objc_msgSend(v19, "clientSideEncryptionManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __59__PLComputeCacheManager__archivePrepareDirectoryWithError___block_invoke;
    v36[3] = &unk_1E366D870;
    v36[4] = self;
    v22 = v17;
    v37 = v22;
    v32[0] = v21;
    v32[1] = 3221225472;
    v32[2] = __59__PLComputeCacheManager__archivePrepareDirectoryWithError___block_invoke_2;
    v32[3] = &unk_1E366D898;
    v34 = &v44;
    v35 = &v38;
    v32[4] = self;
    v23 = v18;
    v33 = v23;
    objc_msgSend(v20, "archiveDirectoryAtURL:toOutputURL:dataType:options:entryPredicate:completionHandler:", v16, v12, 1, 0, v36, v32);

    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    LODWORD(v20) = *((unsigned __int8 *)v45 + 24);
    v24 = (id)v39[5];
    v25 = v24;
    if (!(_DWORD)v20 && a3)
      *a3 = objc_retainAutorelease(v24);

    v26 = *((unsigned __int8 *)v45 + 24);
  }
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v26 != 0;
}

- (void)_cleanupLegacyArchiveFilename
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  NSObject *v24;
  BOOL v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlForLocation:pathManager:createIfNeeded:error:", 1, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", CFSTR("computecache.aar"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  v9 = -[PLComputeCacheManager _cleanupLegacyArchiveURL:replacementURL:error:](self, "_cleanupLegacyArchiveURL:replacementURL:error:", v8, v6, &v30);
  v10 = v30;
  if (v9)
  {
    v11 = (void *)objc_opt_class();
    v12 = objc_loadWeakRetained((id *)&self->_lsm);
    objc_msgSend(v12, "pathManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_urlForLocation:pathManager:createIfNeeded:error:", 4, v13, 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "URLByDeletingLastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("computecache.aar"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v10;
    LODWORD(v15) = -[PLComputeCacheManager _cleanupLegacyArchiveURL:replacementURL:error:](self, "_cleanupLegacyArchiveURL:replacementURL:error:", v16, v14, &v29);
    v17 = v29;

    if ((_DWORD)v15)
    {
      v18 = (void *)objc_opt_class();
      v19 = objc_loadWeakRetained((id *)&self->_lsm);
      objc_msgSend(v19, "pathManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "_urlForLocation:pathManager:createIfNeeded:error:", 6, v20, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "URLByDeletingLastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URLByAppendingPathComponent:", CFSTR("computecache.aar"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = v17;
      v22 = -[PLComputeCacheManager _cleanupLegacyArchiveURL:replacementURL:error:](self, "_cleanupLegacyArchiveURL:replacementURL:error:", v8, v6, &v28);
      v10 = v28;

      v23 = v10;
      if (v22)
        goto LABEL_12;
    }
    else
    {
      v10 = v17;
      v6 = v14;
      v8 = v16;
    }
  }
  PLMigrationGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v10;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Resetting compute cache after failing to cleanup legacy archive. Error: %@", buf, 0xCu);
  }

  v27 = v10;
  v25 = -[PLComputeCacheManager resetComputeCacheWithError:](self, "resetComputeCacheWithError:", &v27);
  v23 = v27;

  if (!v25)
  {
    PLMigrationGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v23;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to reset compute cache. Error: %@", buf, 0xCu);
    }

  }
LABEL_12:

}

- (BOOL)_cleanupLegacyArchiveURL:(id)a3 replacementURL:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  int v15;
  id v16;
  char v17;
  void *v18;
  char v19;
  BOOL v20;
  NSObject *v21;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLComputeCacheManager.m"), 1175, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("legacyURL"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLComputeCacheManager.m"), 1176, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("replacementURL"));

LABEL_3:
  v28 = 0;
  v12 = objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", &v28);
  v13 = v28;
  v14 = v13;
  if (!v12)
  {
    if ((PLIsErrorFileNotFound() & 1) == 0)
      goto LABEL_13;
    goto LABEL_11;
  }
  v27 = v13;
  v15 = objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", &v27);
  v16 = v27;

  if (v15)
  {
    v26 = v16;
    v17 = objc_msgSend(MEMORY[0x1E0D73208], "removeItemAtURL:error:", v9, &v26);
    v14 = v26;

    if ((v17 & 1) == 0)
      goto LABEL_13;
LABEL_11:
    v20 = 1;
    goto LABEL_18;
  }
  if (PLIsErrorFileNotFound())
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v16;
    v19 = objc_msgSend(v18, "moveItemAtURL:toURL:error:", v9, v11, &v25);
    v14 = v25;

    if ((v19 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    v14 = v16;
  }
LABEL_13:
  PLMigrationGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v14;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to cleanup legacy archive location. Error: %@", buf, 0xCu);
  }

  if (a5)
  {
    v14 = objc_retainAutorelease(v14);
    v20 = 0;
    *a5 = v14;
  }
  else
  {
    v20 = 0;
  }
LABEL_18:

  return v20;
}

- (void)_setICloudBackupRestoreDateFromArchive
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v9;
  int *v10;
  char *v11;
  void *iCloudBackupRestoreDateStart;
  NSDate *v13;
  NSDate *v14;
  stat v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_urlForLocation:pathManager:createIfNeeded:error:", 6, v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  memset(&v15, 0, sizeof(v15));
  if (stat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v15))
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *__error();
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      v17 = v9;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Unable to stat the archive for the start date. Stat error[%d]: %s", buf, 0x12u);
    }

    iCloudBackupRestoreDateStart = self->_iCloudBackupRestoreDateStart;
    self->_iCloudBackupRestoreDateStart = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v15.st_ctimespec.tv_sec);
    iCloudBackupRestoreDateStart = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (NSDate *)objc_msgSend(iCloudBackupRestoreDateStart, "copy");
    v14 = self->_iCloudBackupRestoreDateStart;
    self->_iCloudBackupRestoreDateStart = v13;

  }
}

- (id)status
{
  id v3;
  NSObject *queue;
  uint64_t v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  __CFString *v12;
  void *v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__57771;
  v20 = __Block_byref_object_dispose__57772;
  v21 = 0;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __31__PLComputeCacheManager_status__block_invoke;
  v15[3] = &unk_1E3677C68;
  v15[4] = self;
  v15[5] = &v16;
  dispatch_sync(queue, v15);
  v5 = -[PLComputeCacheManager _restoreState](self, "_restoreState");
  v6 = -[PLComputeCacheManager isReadyForAnalysis](self, "isReadyForAnalysis");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  v8 = v7;
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("Ready for Analysis"));

  PLStringFromPLComputeCacheRestoreStateShort(v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("Restore State"));

  objc_msgSend((id)v17[5], "configuration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  switch(v5)
  {
    case 3:
      v12 = CFSTR("The restore is currently active");
      break;
    case 2:
      if ((objc_msgSend(v10, "isRestoreEnabled") & 1) == 0)
      {
        objc_msgSend(CFSTR("The compute cache archive is available for restore"), "stringByAppendingString:", CFSTR(", but disabled by the configuration"));
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_15;
        goto LABEL_14;
      }
      v12 = CFSTR("The compute cache archive is available for restore");
      break;
    case 1:
      v12 = CFSTR("The compute cache archive was created on this device");
      break;
    default:
      v12 = CFSTR("There is no compute cache to restore");
      break;
  }

LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("Restore State Reason"));
LABEL_15:

  -[PLComputeCacheManager statusFromPolicy:](self, "statusFromPolicy:", v17[5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v13);

  _Block_object_dispose(&v16, 8);
  return v3;
}

- (id)statusFromPolicy:(id)a3
{
  id v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v3, "snapshotAllowed"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("Snapshot Allowed"));
  if (objc_msgSend(v3, "snapshotRequired"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("Snapshot Required"));
  PLStringFromPLComputeCacheSnapshotDenyPolicyShort(objc_msgSend(v3, "denyPolicy"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("Snapshot Deny Policy"));

  v8 = objc_msgSend(v3, "denyPolicy");
  if ((unint64_t)(v8 - 1) > 4)
    v9 = CFSTR("Snapshot enabled. Check allow policy");
  else
    v9 = off_1E36705C8[v8 - 1];
  v10 = v9;
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("Snapshot Deny Policy Reason"));

  if (!objc_msgSend(v3, "denyPolicy"))
  {
    PLStringFromPLComputeCacheSnapshotAllowPolicyShort(objc_msgSend(v3, "allowPolicy"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("Snapshot Allow Policy"));

    v12 = objc_msgSend(v3, "allowPolicy");
    v13 = CFSTR("Snapshot disabled. Snapshot is current");
    if (v12 == 1)
      v13 = CFSTR("Snapshot required. Snapshot is out of date");
    if (v12 == 2)
      v13 = CFSTR("Snapshot required. Snapshot has deleted asset records");
    v14 = v13;
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Snapshot Allow Policy Reason"));

  }
  objc_msgSend(v3, "reason");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Snapshot Reason"));

  return v4;
}

- (void)_updateCachedPolicyConfigurationWithCPLConfiguration:(id)a3
{
  uint64_t v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "valueForKey:", CFSTR("computecache.policyconfiguration"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0D73158];
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appPrivateDataForLibraryURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForKeyPath:", CFSTR("ComputeCache.PolicyConfiguration"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v4 | v9 && (objc_msgSend((id)v9, "isEqual:", v4) & 1) == 0)
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543362;
      v13 = v4;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: updating app private data policy configuration from CPL with dictionary: %{public}@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(v8, "setValue:forKeyPath:", v4, CFSTR("ComputeCache.PolicyConfiguration"));
  }

}

- (id)_cachedPolicyConfiguration
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  PLComputeCachePolicyConfiguration *v7;

  v2 = (void *)MEMORY[0x1E0D73158];
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "libraryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appPrivateDataForLibraryURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "valueForKeyPath:", CFSTR("ComputeCache.PolicyConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLComputeCachePolicyConfiguration initWithConfigurationDictionary:]([PLComputeCachePolicyConfiguration alloc], "initWithConfigurationDictionary:", v6);

  return v7;
}

- (id)_newTransientContext
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  PLComputeCacheManager *v19;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
  v4 = (void *)MEMORY[0x1E0D73208];
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "redactedDescriptionForFileURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[PLJournalManagerCore name](self->_journalManager, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("ComputeCacheManager[%@] transient context (%@)"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v11);

  v12 = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(v12, "persistentStoreCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentStoreCoordinator:", v13);

  objc_msgSend(v3, "setStalenessInterval:", 0.0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __45__PLComputeCacheManager__newTransientContext__block_invoke;
  v17[3] = &unk_1E3677C18;
  v14 = v3;
  v18 = v14;
  v19 = self;
  objc_msgSend(v14, "performBlockAndWait:", v17);
  v15 = v14;

  return v15;
}

- (int64_t)_libraryAssetCount
{
  void *v3;
  PLComputeCachePolicyDataSource *v4;
  uint64_t v5;
  int64_t v6;

  -[PLComputeCacheManager _shortLivedLibrary](self, "_shortLivedLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLComputeCachePolicyDataSource initWithPhotoLibrary:restoreState:]([PLComputeCachePolicyDataSource alloc], "initWithPhotoLibrary:restoreState:", v3, -[PLComputeCacheManager _restoreState](self, "_restoreState"));
  v5 = -[PLComputeCachePolicyDataSource assetCount](v4, "assetCount");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = -1;
  else
    v6 = v5;

  return v6;
}

- (id)_shortLivedLibrary
{
  void *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self = (PLComputeCacheManager *)((char *)self + 8);
  WeakRetained = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - identifier:%td"), v5, objc_msgSend(WeakRetained, "wellKnownPhotoLibraryIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_loadWeakRetained((id *)&self->super.isa);
  objc_msgSend(v8, "databaseContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_retainAutorelease(v7);
  v11 = (void *)objc_msgSend(v9, "newShortLivedLibraryWithName:", objc_msgSend(v10, "UTF8String"));

  return v11;
}

- (id)managedObjectContext
{
  return -[PLPhotoLibrary managedObjectContext](self->_restoreCachePhotoLibrary, "managedObjectContext");
}

- (void)performTransactionAndWait:(id)a3
{
  -[PLPhotoLibrary performTransactionAndWait:](self->_restoreCachePhotoLibrary, "performTransactionAndWait:", a3);
}

- (id)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  dispatch_block_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__57771;
  v19 = __Block_byref_object_dispose__57772;
  v20 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "cloudPhotoLibraryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_153_57773);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__PLComputeCacheManager_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke_2;
    v12[3] = &unk_1E366D8E0;
    v14 = &v15;
    v9 = v8;
    v13 = v9;
    objc_msgSend(v7, "resolveLocalIdentifiersForCloudIdentifiers:completionHandler:", v5, v12);
    dispatch_block_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

  }
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudBackupRestoreDateStart, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_restoreCachePhotoLibrary, 0);
  objc_storeStrong((id *)&self->_restoreState, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_journalManager, 0);
  objc_destroyWeak((id *)&self->_lsm);
}

void __74__PLComputeCacheManager_resolveLocalIdentifiersForCloudIdentifiers_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __45__PLComputeCacheManager__newTransientContext__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("com.apple.photos.PLModelMigratorPathManagerKey"));

}

void __31__PLComputeCacheManager_status__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_snapshotPolicy");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __59__PLComputeCacheManager__archivePrepareDirectoryWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isValidArchiveURL:filenameExclusionList:", a2, *(_QWORD *)(a1 + 40));
}

void __59__PLComputeCacheManager__archivePrepareDirectoryWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to create archive. Error: %@", buf, 0xCu);
    }

    v9 = *(void **)(a1 + 32);
    v13 = 0;
    v10 = objc_msgSend(v9, "_removeLocation:error:", 1, &v13);
    v11 = v13;
    if ((v10 & 1) == 0)
    {
      PLMigrationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v11;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove archive. Error: %@", buf, 0xCu);
      }

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __78__PLComputeCacheManager__removeComputeCacheDataForMatchingRestoreState_error___block_invoke(_QWORD *a1, unint64_t a2)
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  id *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id obj;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (a2 >= 2)
  {
    if (a2 - 2 >= 2)
    {
      v3 = a1[7];
    }
    else
    {
      v3 = a1[7];
      if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v4 = (void *)a1[4];
        v5 = *(_QWORD *)(a1[6] + 8);
        obj = *(id *)(v5 + 40);
        v6 = objc_msgSend(v4, "_removeLocation:error:", 3, &obj);
        objc_storeStrong((id *)(v5 + 40), obj);
        *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v6;
        if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
        {
          v7 = (void *)a1[4];
          v8 = *(_QWORD *)(a1[6] + 8);
          v10 = *(void **)(v8 + 40);
          v9 = (id *)(v8 + 40);
          v30 = v10;
          v11 = objc_msgSend(v7, "_removeLocation:error:", 5, &v30);
          v12 = v30;
LABEL_9:
          objc_storeStrong(v9, v12);
          *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v11;
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Requested to remove the compute cache data with invalid restore state: [current:%td vs request:%td]"), a2, v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D74498];
    v36 = *MEMORY[0x1E0CB2938];
    v37[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 52010, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1[6] + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

    PLMigrationGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v35 = v27;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Error removing the compute cache data. Error: %@", buf, 0xCu);
    }

    goto LABEL_14;
  }
  v3 = a1[7];
  if (v3 > 1)
    goto LABEL_11;
  v13 = (void *)a1[4];
  v14 = *(_QWORD *)(a1[6] + 8);
  v33 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v13, "_removeLocation:error:", 5, &v33);
  objc_storeStrong((id *)(v14 + 40), v33);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v15;
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v16 = (void *)a1[4];
    v17 = *(_QWORD *)(a1[6] + 8);
    v18 = *(void **)(v17 + 40);
    v9 = (id *)(v17 + 40);
    v32 = v18;
    v11 = objc_msgSend(v16, "_removeLocation:error:", 0, &v32);
    v12 = v32;
    goto LABEL_9;
  }
LABEL_14:
  v28 = a1[4];
  v29 = *(void **)(v28 + 32);
  *(_QWORD *)(v28 + 32) = 0;

}

void __43__PLComputeCacheManager__resetRestoreState__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  *(_QWORD *)(v1 + 32) = 0;

}

void __42__PLComputeCacheManager__setRestoreState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke(uint64_t a1, uint64_t a2)
{
  PLJournal *v3;

  v3 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", *(_QWORD *)(a1 + 32), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += -[PLJournal countOfInsertEntriesWithError:](v3, "countOfInsertEntriesWithError:", 0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  PLCloudAssetPayloadRestore *v7;
  PLCloudAssetPayloadRestore *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PLCloudAssetPayloadRestore *v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = -[PLCloudAssetPayloadRestore initWithDelegate:batchSize:]([PLCloudAssetPayloadRestore alloc], "initWithDelegate:batchSize:", *(_QWORD *)(a1 + 32), 100);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke_3;
  v18[3] = &unk_1E366D7F8;
  v19 = *(id *)(a1 + 40);
  v8 = v7;
  v20 = v8;
  v21 = *(id *)(a1 + 48);
  v17 = 0;
  v9 = objc_msgSend(v6, "enumeratePayloadsUsingBlock:error:", v18, &v17);
  v10 = v17;
  if ((v9 & 1) == 0)
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)objc_msgSend(v6, "payloadClass"), "payloadClassID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = (uint64_t)v12;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed enumerate journal for payload %{public}@. Error: %@", buf, 0x16u);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
  {
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Will abort journal enumeration due to progress cancel", buf, 2u);
    }

    *a4 = 1;
  }
  else
  {
    -[PLCloudAssetPayloadRestore insertRemainingPayloads](v8, "insertRemainingPayloads");
    if (-[PLCloudAssetPayloadRestore totalSkipped](v8, "totalSkipped"))
    {
      PLMigrationGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = -[PLCloudAssetPayloadRestore totalSkipped](v8, "totalSkipped");
        objc_msgSend((id)objc_msgSend(v6, "payloadClass"), "payloadClassID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v23 = v15;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Dropped %tu unmatched %@ payloads", buf, 0x16u);

      }
    }
  }

}

void __71__PLComputeCacheManager__restoreComputeCacheArchiveWithProgress_error___block_invoke_3(id *a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a2;
  if (objc_msgSend(a1[4], "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Will abort journal enumeration due to progress cancel", v7, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(a1[5], "addPayload:", v5);
    objc_msgSend(a1[6], "setCompletedUnitCount:", objc_msgSend(a1[6], "completedUnitCount") + 1);
  }

}

void __63__PLComputeCacheManager_restoreComputeCacheWithProgress_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_restoreComputeCacheWithProgress:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

uint64_t __58__PLComputeCacheManager__hasPrepareDataToBackupWithError___block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

uint64_t __48__PLComputeCacheManager_createArchiveWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_createArchiveWithError:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __51__PLComputeCacheManager__performSnapshotWithError___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[2];
  v4 = (void *)objc_msgSend(v2, "_newTransientContext");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PLComputeCacheManager__performSnapshotWithError___block_invoke_2;
  v5[3] = &unk_1E366D780;
  v5[4] = a1[4];
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "performFullSnapshotAppend:createOnlyIfNecessary:withManagedObjectContext:entryLimitBlock:error:", 0, 1, v4, v5, a1[6]);

}

uint64_t __51__PLComputeCacheManager__performSnapshotWithError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  if (!objc_msgSend((id)objc_msgSend(a2, "payloadClass"), "isEqual:", objc_opt_class()))
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "_cachedPolicyConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ambientSuggestionEntryLimit");

  return v4;
}

void __82__PLComputeCacheManager_snapshotJournalsForPayloadClassIDs_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "_snapshotJournalsWithError:", &v5);
  v3 = v5;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

void __66__PLComputeCacheManager_snapshotJournalsForPayloadClassIDs_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_snapshotJournalsWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

void __72__PLComputeCacheManager_snapshotComputeCacheAndBackupIfNeededWithError___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id obj;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_snapshotPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "snapshotAllowed") & 1) != 0)
  {
    v3 = objc_msgSend(v2, "snapshotRequired");
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if ((v3 & 1) != 0)
    {
      if (v5)
      {
        objc_msgSend(v2, "reason");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
        objc_msgSend(WeakRetained, "pathManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v45 = v6;
        v46 = 2112;
        v47 = v8;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: Updating compute cache snapshot with reason [%{public}@] for library: %@", buf, 0x16u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startRecordingTimedEventToken");
      v10 = v9;
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v12 + 40);
      v13 = objc_msgSend(v11, "_snapshotJournalsWithError:", &obj);
      objc_storeStrong((id *)(v12 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v14 = *(void **)(a1 + 32);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v41 = *(id *)(v15 + 40);
        v16 = objc_msgSend(v14, "_createArchiveWithError:", &v41);
        objc_storeStrong((id *)(v15 + 40), v41);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16;
      }
      v17 = *MEMORY[0x1E0D73740];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "stopRecordingTimedEventWithToken:forKey:onEventWithName:", *MEMORY[0x1E0D73760], *MEMORY[0x1E0D73740], v10);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setPayloadValue:forKey:onEventWithName:", &unk_1E375F8B8, *MEMORY[0x1E0D73778], v17);
      v18 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPayloadValue:forKey:onEventWithName:", v19, *MEMORY[0x1E0D73770], v17);

      v20 = *(_QWORD **)(a1 + 32);
      v21 = (void *)v20[3];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v20, "_libraryAssetCount"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setPayloadValue:forKey:onEventWithName:", v22, *MEMORY[0x1E0D73748], v17);

      v23 = *(_QWORD **)(a1 + 32);
      v24 = (void *)v23[3];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "_getArchiveSize"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPayloadValue:forKey:onEventWithName:", v25, *MEMORY[0x1E0D73728], v17);

      v26 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "allowPolicy"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setPayloadValue:forKey:onEventWithName:", v27, *MEMORY[0x1E0D73730], v17);

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        v28 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "code"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setPayloadValue:forKey:onEventWithName:", v29, *MEMORY[0x1E0D73738], v17);

      }
      objc_msgSend(*(id *)(a1 + 32), "_publish");
      goto LABEL_18;
    }
    if (v5)
    {
      objc_msgSend(v2, "reason");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
      objc_msgSend(v39, "pathManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v38;
      v46 = 2112;
      v47 = v40;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: Skipping compute cache snapshot with reason [%{public}@] for library: %@", buf, 0x16u);

    }
LABEL_17:

    goto LABEL_18;
  }
  PLMigrationGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "reason");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v32, "pathManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v31;
    v46 = 2112;
    v47 = v33;
    _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "ComputeCacheManager: Snapshot not allowed, performing snapshot cleanup with reason [%{public}@] for library: %@", buf, 0x16u);

  }
  v34 = *(void **)(a1 + 32);
  v35 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v43 = *(id *)(v35 + 40);
  v36 = objc_msgSend(v34, "_removeSnapshotWithError:", &v43);
  objc_storeStrong((id *)(v35 + 40), v43);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v36;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v37 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v45 = v37;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to remove snapshot data. Error: %@", buf, 0xCu);
    }
    goto LABEL_17;
  }
LABEL_18:

}

uint64_t __52__PLComputeCacheManager_resetComputeCacheWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v14;
  id v15;
  id obj;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "_removeLocation:error:", 5, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v5 + 24))
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(id *)(v7 + 40);
    v8 = objc_msgSend(v6, "_removeLocation:error:", 0, &v15);
    objc_storeStrong((id *)(v7 + 40), v15);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v8 = 0;
  }
  *(_BYTE *)(v5 + 24) = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v9 + 24))
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(id *)(v11 + 40);
    v12 = objc_msgSend(v10, "_removeLocation:error:", 3, &v14);
    objc_storeStrong((id *)(v11 + 40), v14);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  else
  {
    v12 = 0;
  }
  *(_BYTE *)(v9 + 24) = v12;
  return objc_msgSend(*(id *)(a1 + 32), "_resetRestoreState");
}

uint64_t __48__PLComputeCacheManager_notifyCPLConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCachedPolicyConfigurationWithCPLConfiguration:", *(_QWORD *)(a1 + 40));
}

void __65__PLComputeCacheManager_notifyReadyToRestoreWithInitialSyncDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "ComputeCacheManager: notified restore start", buf, 2u);
  }

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[3];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "_getArchiveSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D73740];
  objc_msgSend(v4, "setPayloadValue:forKey:onEventWithName:", v5, *MEMORY[0x1E0D73728], *MEMORY[0x1E0D73740]);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "startRecordingTimedEventToken");
  v8 = v7;
  v9 = *(void **)(a1 + 32);
  v32 = 0;
  v10 = objc_msgSend(v9, "_restoreComputeCacheWithProgress:error:", 0, &v32);
  v11 = v32;
  objc_msgSend(*(id *)(a1 + 32), "_shortLivedLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoAnalysisPhotoLibraryService notifyComputeCacheDidLoadForLibrary:reply:](PLPhotoAnalysisPhotoLibraryService, "notifyComputeCacheDidLoadForLibrary:reply:", v12, &__block_literal_global_57946);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "stopRecordingTimedEventWithToken:forKey:onEventWithName:", *MEMORY[0x1E0D73760], v6, v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setPayloadValue:forKey:onEventWithName:", &unk_1E375F8A0, *MEMORY[0x1E0D73778], v6);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setPayloadValue:forKey:onEventWithName:", v14, *MEMORY[0x1E0D73770], v6);

  v15 = *(_QWORD **)(a1 + 32);
  v16 = (void *)v15[3];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "_libraryAssetCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPayloadValue:forKey:onEventWithName:", v17, *MEMORY[0x1E0D73748], v6);

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(void **)(v18 + 24);
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(v18 + 64), "timeIntervalSinceNow");
  objc_msgSend(v20, "numberWithDouble:", -v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setPayloadValue:forKey:onEventWithName:", v22, *MEMORY[0x1E0D73750], v6);

  v23 = *(_QWORD **)(a1 + 32);
  v24 = (void *)v23[3];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v23, "_iCloudBackupState"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setPayloadValue:forKey:onEventWithName:", v25, *MEMORY[0x1E0D73758], v6);

  if ((_DWORD)v10)
  {
    PLMigrationGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_INFO, "ComputeCacheManager: restore completed", buf, 2u);
    }

    goto LABEL_16;
  }
  if (objc_msgSend((id)objc_opt_class(), "shouldPublishAnalyticsForRestoreError:", v11))
  {
    PLMigrationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      v28 = "ComputeCacheManager: Restore compute cache failed or denied on notify. Error: %@";
LABEL_14:
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (*(_BYTE *)(a1 + 40) && PLIsErrorEqualToCode())
  {
    PLMigrationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      v28 = "ComputeCacheManager: Restore compute cache failed. No restore archive available. Error: %@";
      goto LABEL_14;
    }
LABEL_15:

    v29 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "code"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setPayloadValue:forKey:onEventWithName:", v30, *MEMORY[0x1E0D73738], v6);

LABEL_16:
    objc_msgSend(*(id *)(a1 + 32), "_publish");
    goto LABEL_17;
  }
  PLMigrationGetLog();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v11;
    _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_INFO, "ComputeCacheManager: Restore compute cache failed or denied on notify. Error: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeEventWithName:", v6);
LABEL_17:

}

void __65__PLComputeCacheManager_notifyReadyToRestoreWithInitialSyncDate___block_invoke_65(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (v2)
  {
    PLMigrationGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 138412290;
      v5 = v2;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "ComputeCacheManager: photoanalysisd FTE registration failed. Error: %@", (uint8_t *)&v4, 0xCu);
    }

  }
}

+ (id)name
{
  return CFSTR("ComputeCache");
}

+ (id)baseURLFromPathManager:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = 0;
    objc_msgSend(a1, "_urlForLocation:pathManager:createIfNeeded:error:", 0, a3, 1, &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (v4)
    {
      PLMigrationGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to save prepare compute cache data. Error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (id)payloadClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)restorePayloadClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isEnabledWithPathManager:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  char v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString **v18;
  uint64_t *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v26;
  uint8_t buf[8];
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLComputeCacheManager.m"), 183, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v8 = (void *)MEMORY[0x1E0D73280];
  objc_msgSend(v7, "libraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "wellKnownPhotoLibraryIdentifierForURL:", v9);

  if (v10 - 2 < 2)
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Disabled journal for invalid well known library type", buf, 2u);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D74498];
    v28 = *MEMORY[0x1E0CB2938];
    v29 = CFSTR("Disabled journal for invalid well known library type");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = &v29;
    v19 = &v28;
  }
  else
  {
    if (v10 > 1
      || (objc_msgSend(v7, "libraryURL"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v11),
          v11,
          (v12 & 1) != 0))
    {
      v13 = 1;
      goto LABEL_16;
    }
    PLMigrationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "ComputeCacheManager: Disabled journal manager for CPL disabled library", buf, 2u);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D74498];
    v30 = *MEMORY[0x1E0CB2938];
    v31[0] = CFSTR("Disabled journal manager for CPL disabled library");
    v17 = (void *)MEMORY[0x1E0C99D80];
    v18 = (const __CFString **)v31;
    v19 = &v30;
  }
  objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 52001, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v22;
  v24 = v23;
  if (a4)
    *a4 = objc_retainAutorelease(v23);

  v13 = 0;
LABEL_16:

  return v13;
}

+ (BOOL)shouldPublishAnalyticsForRestoreError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D74498]);

  if (!v5
    || ((v6 = objc_msgSend(v3, "code"), v7 = 0, (unint64_t)(v6 - 52001) > 6)
     || ((1 << (v6 - 33)) & 0x59) == 0)
    && v6 != 45999)
  {
    v7 = 1;
  }

  return v7;
}

+ (id)_urlForLocation:(int64_t)a3 pathManager:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  const __CFString *v16;
  void *v17;
  id v18;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint8_t buf[4];
  int64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    objc_msgSend(v9, "privateCacheDirectoryCreationMaskResetWithSubType:", 15);
    objc_msgSend(v10, "privateDirectoryCreationMaskResetWithSubType:", 10);
  }
  switch(a3)
  {
    case 0:
      v27 = 0;
      v11 = 1;
      objc_msgSend(v10, "privateCacheDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", 15, 1, CFSTR("prepare"), v7, &v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v27;
      goto LABEL_8;
    case 1:
      v26 = 0;
      objc_msgSend(v10, "privateCacheDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", 15, 1, CFSTR("prepare"), v7, &v26);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v26;
      goto LABEL_19;
    case 2:
      v25 = 0;
      objc_msgSend(v10, "privateCacheDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", 15, 1, CFSTR("prepare"), v7, &v25);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v25;
      v16 = CFSTR("backupcreatedmarker");
      goto LABEL_20;
    case 3:
      v24 = 0;
      v11 = 1;
      objc_msgSend(v10, "privateCacheDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", 15, 1, CFSTR("restore"), v7, &v24);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v24;
LABEL_8:
      v15 = v13;
      if (!v15)
        goto LABEL_13;
      goto LABEL_21;
    case 4:
      v23 = 0;
      objc_msgSend(v10, "privateCacheDirectoryWithSubType:leafType:additionalPathComponents:createIfNeeded:error:", 15, 1, CFSTR("restore"), v7, &v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v23;
      goto LABEL_19;
    case 5:
      v22 = 0;
      objc_msgSend(v10, "privateDirectoryWithSubType:createIfNeeded:error:", 10, v7, &v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v22;
      v11 = 1;
      if (!v15)
        goto LABEL_13;
      goto LABEL_21;
    case 6:
      v21 = 0;
      objc_msgSend(v10, "privateDirectoryWithSubType:createIfNeeded:error:", 10, v7, &v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v21;
LABEL_19:
      v15 = v17;
      v16 = CFSTR("computecache.aea");
LABEL_20:
      objc_msgSend(v14, "stringByAppendingPathComponent:", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = 0;
      if (!v15)
        goto LABEL_13;
LABEL_21:
      PLMigrationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v29 = a3;
        v30 = 2112;
        v31 = v15;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "ComputeCacheManager: Failed to create location %tu compute cache data. Error: %@", buf, 0x16u);
      }

      v18 = v15;
      if (!a6)
        goto LABEL_16;
      goto LABEL_15;
    default:
      v12 = 0;
      v11 = 1;
LABEL_13:
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, v11);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v18)
        goto LABEL_17;
      if (a6)
LABEL_15:
        *a6 = objc_retainAutorelease(v18);
LABEL_16:

      v18 = 0;
LABEL_17:

      return v18;
  }
}

@end
