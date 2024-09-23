@implementation PLImageWriter

- (PLImageWriter)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("You just got singlestacked"), CFSTR("Must use an initializer that takes a library services manager"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (PLImageWriter)initWithLibraryServicesManager:(id)a3
{
  id v4;
  PLImageWriter *v5;
  PLImageWriter *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *jobQueue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *jobCompletionQueue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLImageWriter;
  v5 = -[PLImageWriter init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.photos.backend.imageWriterQueue", v7);
    jobQueue = v6->_jobQueue;
    v6->_jobQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.photos.backend.imageWriterCompletionQueue", v10);
    jobCompletionQueue = v6->_jobCompletionQueue;
    v6->_jobCompletionQueue = (OS_dispatch_queue *)v11;

    v6->_jobCountLock = 0;
    *(unint64_t *)((char *)&v6->_transactionCounter + 4) = 0;
    *(_QWORD *)&v6->_transactionLock._os_unfair_lock_opaque = 0;
    HIDWORD(v6->_crashRecoveryCounter) = 0;
  }

  return v6;
}

- (id)_newShortLivedLibraryWithName:(const char *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "databaseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:libraryRole:", a3, 2);

  return v6;
}

- (BOOL)_isHighPriorityJob:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0D74DB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74E00]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74DD8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74DC8]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74DD0]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74E20]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74E38]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74E30]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74E28]) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74E18]);

  return v4;
}

- (BOOL)canEnqueueJob:(id)a3
{
  return 1;
}

- (id)indicatorFileCoordinator
{
  PLIndicatorFileCoordinator *indicatorFileCoordinator;
  id WeakRetained;
  void *v5;
  PLIndicatorFileCoordinator *v6;
  PLIndicatorFileCoordinator *v7;

  indicatorFileCoordinator = self->_indicatorFileCoordinator;
  if (!indicatorFileCoordinator)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    objc_msgSend(WeakRetained, "libraryBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indicatorFileCoordinator");
    v6 = (PLIndicatorFileCoordinator *)objc_claimAutoreleasedReturnValue();
    v7 = self->_indicatorFileCoordinator;
    self->_indicatorFileCoordinator = v6;

    indicatorFileCoordinator = self->_indicatorFileCoordinator;
  }
  return indicatorFileCoordinator;
}

- (void)_incrementJobCount:(id)a3
{
  unint64_t transactionCounter;
  OS_os_transaction *transaction;
  OS_os_transaction *v7;
  OS_os_transaction *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int unfinishedJobsRequiringIndicatorCount;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  os_unfair_lock_lock(&self->_transactionLock);
  transactionCounter = self->_transactionCounter;
  self->_transactionCounter = transactionCounter + 1;
  transaction = self->_transaction;
  if (transactionCounter)
  {
    if (!transaction)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageWriter.m"), 420, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_transaction"));

    }
    os_transaction_needs_more_time();
  }
  else
  {
    if (transaction)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageWriter.m"), 417, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_transaction"));

    }
    v7 = (OS_os_transaction *)os_transaction_create();
    v8 = self->_transaction;
    self->_transaction = v7;

  }
  v9 = (void *)objc_opt_class();
  v10 = *MEMORY[0x1E0D74DB8];
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v9, "_requiresCrashRecoveryForJobType:", v11);

  if ((_DWORD)v9)
    ++self->_crashRecoveryCounter;
  os_unfair_lock_unlock(&self->_transactionLock);
  v12 = (void *)objc_opt_class();
  objc_msgSend(v20, "objectForKeyedSubscript:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v12, "_requiresIndicatorFileForJobType:", v13);

  if ((_DWORD)v12)
  {
    os_unfair_recursive_lock_lock_with_options();
    unfinishedJobsRequiringIndicatorCount = self->_unfinishedJobsRequiringIndicatorCount;
    self->_unfinishedJobsRequiringIndicatorCount = unfinishedJobsRequiringIndicatorCount + 1;
    if (!unfinishedJobsRequiringIndicatorCount)
    {
      -[PLImageWriter indicatorFileCoordinator](self, "indicatorFileCoordinator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      objc_msgSend(WeakRetained, "crashRecoverySupport");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setImageWriter:isBusy:crashRecoverySupport:", self, 1, v17);

    }
    os_unfair_recursive_lock_unlock();
  }

}

- (void)_decrementJobCount:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id WeakRetained;
  void *v11;
  unint64_t v12;
  OS_os_transaction *transaction;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v5 = (void *)objc_opt_class();
  v6 = *MEMORY[0x1E0D74DB8];
  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "_requiresIndicatorFileForJobType:", v7);

  if ((_DWORD)v5)
  {
    os_unfair_recursive_lock_lock_with_options();
    v8 = self->_unfinishedJobsRequiringIndicatorCount - 1;
    self->_unfinishedJobsRequiringIndicatorCount = v8;
    if (!v8)
    {
      -[PLImageWriter indicatorFileCoordinator](self, "indicatorFileCoordinator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      objc_msgSend(WeakRetained, "crashRecoverySupport");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setImageWriter:isBusy:crashRecoverySupport:", self, 0, v11);

    }
    os_unfair_recursive_lock_unlock();
  }
  os_unfair_lock_lock(&self->_transactionLock);
  if (!self->_transactionCounter)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageWriter.m"), 449, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_transactionCounter > 0"));

  }
  if (!self->_transaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageWriter.m"), 450, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_transaction"));

  }
  v12 = self->_transactionCounter - 1;
  self->_transactionCounter = v12;
  if (!v12)
  {
    transaction = self->_transaction;
    self->_transaction = 0;

  }
  v14 = (void *)objc_opt_class();
  objc_msgSend(v18, "objectForKeyedSubscript:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v14, "_requiresCrashRecoveryForJobType:", v15);

  if ((_DWORD)v14)
    --self->_crashRecoveryCounter;
  os_unfair_lock_unlock(&self->_transactionLock);

}

- (BOOL)_hasNonCrashRecoveryJobsEnqueued
{
  PLImageWriter *v2;
  os_unfair_lock_s *p_transactionLock;

  v2 = self;
  p_transactionLock = &self->_transactionLock;
  os_unfair_lock_lock(&self->_transactionLock);
  LOBYTE(v2) = v2->_transactionCounter > v2->_crashRecoveryCounter;
  os_unfair_lock_unlock(p_transactionLock);
  return (char)v2;
}

- (BOOL)enqueueJob:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *jobQueue;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D74DB0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    ++enqueueJob__s_jobIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

  }
  -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v4);
  v8 = *MEMORY[0x1E0D74DB8];
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D74DB8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLAssetImportGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = (uint64_t)v9;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Started queueing jobType: %{public}@", buf, 0xCu);
  }

  if (enqueueJob__onceToken != -1)
    dispatch_once(&enqueueJob__onceToken, &__block_literal_global_5186);
  if (enqueueJob__debugVideoJobDelay
    && (objc_msgSend(v4, "objectForKeyedSubscript:", v8),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0D74E20]),
        v11,
        v12))
  {
    PLAssetImportGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = enqueueJob__debugVideoJobDelay;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Delaying video job for %ld seconds", buf, 0xCu);
    }

    v14 = enqueueJob__debugVideoJobDelay;
  }
  else
  {
    if (!enqueueJob__debugImageJobDelay
      || (objc_msgSend(v4, "objectForKeyedSubscript:", v8),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D74E00]),
          v15,
          !v16))
    {
      jobQueue = self->_jobQueue;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __28__PLImageWriter_enqueueJob___block_invoke_93;
      v20[3] = &unk_1E3677C18;
      v20[4] = self;
      v21 = v4;
      dispatch_async(jobQueue, v20);

      goto LABEL_19;
    }
    PLAssetImportGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = enqueueJob__debugImageJobDelay;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Delaying image job for %ld seconds", buf, 0xCu);
    }

    v14 = enqueueJob__debugImageJobDelay;
  }
  -[PLImageWriter delayJob:delay:](self, "delayJob:delay:", v4, v14);
LABEL_19:

  return 1;
}

- (void)delayJob:(id)a3 delay:(int64_t)a4
{
  id v6;
  void *v7;
  dispatch_time_t v8;
  NSObject *jobQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLImageWriter delayJob:delay:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = dispatch_time(0, 1000000000 * a4);
  jobQueue = self->_jobQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__PLImageWriter_delayJob_delay___block_invoke;
  block[3] = &unk_1E3677530;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_after(v8, jobQueue, block);

}

- (id)cameraAssetPathForNewAssetWithExtension:(id)a3 assetUUID:(id)a4
{
  id v7;
  id v8;
  PLLibraryServicesManager **p_libraryServicesManager;
  id WeakRetained;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4937;
  v33 = __Block_byref_object_dispose__4938;
  v34 = 0;
  p_libraryServicesManager = &self->_libraryServicesManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isUBF");

  if (!v12)
  {
    v15 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    objc_msgSend(v15, "pathManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "simpleDCIMDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "nextAvailableFileURLWithExtension:", v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
      {
        PLAssetImportGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v36 = v7;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_FAULT, "Failed to get next available URL under DCIM folder for extension: %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected nil value for DCIM directory for extension: %@"), v7);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:] Unexpected nil value for DCIM directory"), v19);
        v18 = 0;
        goto LABEL_15;
      }
      objc_msgSend(v17, "path");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      -[PLImageWriter _pathForNewAssetWithPath:withExtension:](self, "_pathForNewAssetWithPath:withExtension:", v19, v7);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v30[5];
      v30[5] = v20;
    }
    else
    {
      PLAssetImportGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_FAULT, "Failed to get the DCIM directory for extension: %@", buf, 0xCu);
      }

      v23 = (void *)MEMORY[0x1E0CB3940];
      v19 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      objc_msgSend(v19, "pathManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("Unexpected nil value for DCIM directory for\nextension: %@\nLSM: %@\nlibrary: %@"), v7, v19, v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Unexpected Photo Library state"), CFSTR("Please file a Radar against Photos"), CFSTR("TTR: -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:] Unexpected nil value for DCIM directory"), v24);

      v14 = 0;
      v18 = v19;
    }
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D752F0], "typeForFilenameExtensionOrLastPathComponent:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73278]), "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:", v8, 0, v14, 0, 31);
    v19 = objc_loadWeakRetained((id *)p_libraryServicesManager);
    objc_msgSend(v19, "pathManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __67__PLImageWriter_cameraAssetPathForNewAssetWithExtension_assetUUID___block_invoke;
    v28[3] = &unk_1E36613B0;
    v28[4] = &v29;
    objc_msgSend(v21, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v18, 2, v28);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageWriter.m"), 531, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUID"));
LABEL_16:

  v25 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v25;
}

- (id)pathForNewAssetWithDirectoryPath:(id)a3 fileName:(id)a4 extension:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  objc_msgSend(a3, "stringByAppendingPathComponent:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLImageWriter _pathForNewAssetWithPath:withExtension:](self, "_pathForNewAssetWithPath:withExtension:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_pathForNewAssetWithPath:(id)a3 withExtension:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageWriter.m"), 560, CFSTR("%@ can only be called from assetsd"), v23);

  }
  v9 = (void *)MEMORY[0x19AEC1554]();
  v10 = v7;
  v11 = v10;
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v10, "pathExtension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", v8);

    v11 = v10;
    if ((v13 & 1) == 0)
    {
      objc_msgSend(v10, "stringByDeletingPathExtension");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uppercaseString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathExtension:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByDeletingLastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v18 = objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v24);
  v19 = v24;

  if ((v18 & 1) == 0)
  {
    PLAssetImportGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v26 = v11;
      v27 = 2114;
      v28 = v8;
      v29 = 2112;
      v30 = v19;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to create directory at path: %@, extension: %{public}@ (Error: %@)", buf, 0x20u);
    }

  }
  objc_autoreleasePoolPop(v9);

  return v11;
}

- (id)pathForNewAssetPathAtAlbumDirectoryPath:(id)a3 assetType:(unsigned int)a4 extension:(id)a5
{
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  NSObject *v15;
  char v16;
  id WeakRetained;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  NSObject *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageWriter.m"), 587, CFSTR("%@ can only be called from assetsd"), v32);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "fileExistsAtPath:", v9) & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v34 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v34);
    v14 = v34;
    if ((v13 & 1) == 0)
    {
      PLAssetImportGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v9;
        v37 = 2112;
        v38 = v14;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error creating album subdirectory %@ : %@", buf, 0x16u);
      }
      v22 = 0;
      v12 = v14;
      goto LABEL_29;
    }
    -[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", CFSTR(".MISC"));
    v15 = objc_claimAutoreleasedReturnValue();
    v33 = v14;
    v16 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v33);
    v12 = v33;

    if ((v16 & 1) == 0)
    {
      PLAssetImportGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v15;
        v37 = 2112;
        v38 = v12;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Error creating album misc subdirectory %@ : %@", buf, 0x16u);
      }

      v22 = 0;
      goto LABEL_29;
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "pathManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isUBF");

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject stringByAppendingPathComponent:](v9, "stringByAppendingPathComponent:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  objc_msgSend((id)__albumDCIMDirectoriesByPath, "objectForKey:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (!__albumDCIMDirectoriesByPath)
    {
      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v24 = (void *)__albumDCIMDirectoriesByPath;
      __albumDCIMDirectoriesByPath = (uint64_t)v23;

    }
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73270]), "initWithDCIMPath:", v9);
    objc_msgSend((id)__albumDCIMDirectoriesByPath, "setObject:forKey:", v20, v9);
  }
  objc_msgSend(v20, "lockDirectory");
  objc_msgSend(v20, "nextAvailableDirectory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "nextAvailableFileGroup");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ensureDirectoryExists");
  objc_msgSend(v20, "unlockDirectory");
  if (a4 == 1)
  {
    objc_msgSend(v25, "pathForVideoFile");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v22 = 0;
      goto LABEL_26;
    }
    objc_msgSend(v25, "pathForFullSizeImage");
    v26 = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)v26;
LABEL_26:

LABEL_27:
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v22, "stringByDeletingPathExtension");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uppercaseString");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject stringByAppendingPathExtension:](v15, "stringByAppendingPathExtension:", v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v29;
LABEL_29:

  }
  return v22;
}

- (void)_removeTransientKeys:(id)a3
{
  uint64_t v3;
  id v4;

  v3 = *MEMORY[0x1E0D74DA0];
  v4 = a3;
  objc_msgSend(v4, "removeObjectForKey:", v3);
  objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0D74EF0]);
  objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0D74EE8]);
  objc_msgSend(v4, "removeObjectForKey:", *MEMORY[0x1E0D74F38]);
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("PLImageWriterTransientAsset"));

}

- (id)writeFilteredPreviewWithImageData:(id)a3 orImage:(id)a4 toPathWithBaseName:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  char v20;
  id v21;
  NSObject *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = v7;
LABEL_3:
    objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("tempFilteredPreview.JPG"));
    v11 = objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v13, 0);

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v17 = objc_msgSend(v16, "removeItemAtPath:error:", v13, &v25);
      v18 = v25;

      if ((v17 & 1) == 0)
      {
        PLAssetImportGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v27 = v13;
          v28 = 2112;
          v29 = v18;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Failed to remove existing temporary filtered preview file before writing %@, %@", buf, 0x16u);
        }

      }
    }
    v24 = 0;
    v20 = objc_msgSend(v10, "writeToFile:options:error:", v13, 1073741825, &v24);
    v21 = v24;
    if ((v20 & 1) == 0)
    {
      PLAssetImportGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v27 = v13;
        v28 = 2112;
        v29 = v21;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to write filtered preview thumbnail to temporary file: %@, %@", buf, 0x16u);
      }

      v13 = 0;
    }

    goto LABEL_19;
  }
  if (v8)
  {
    v10 = (id)DCIM_newJPEGRepresentationWithPLImage();
    if (v10)
      goto LABEL_3;
  }
  PLAssetImportGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to get jpeg data for filtered preview thumbnail", buf, 2u);
  }
  v10 = 0;
  v13 = 0;
LABEL_19:

  return v13;
}

- (void)_linkDiagnosticFileWithSourcePath:(id)a3 forPhotoDestinationURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 && objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v6, 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _linkDiagnosticFileWithSourcePath:forPhotoDestinationURL:]");
    objc_msgSend(v7, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset diagnosticFilePathForLibrary:mainFilename:createIfNeeded:](PLManagedAsset, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v11, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (!v10 || !v14)
        goto LABEL_17;
      v20 = 0;
      v16 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v10, v14, &v20);
      v17 = v20;
      if ((v16 & 1) == 0)
      {
        PLAssetImportGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v22 = v10;
          v23 = 2112;
          v24 = v15;
          v25 = 2112;
          v26 = v17;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@: %@", buf, 0x20u);
        }

        v10 = 0;
      }
      PLAssetImportGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v15;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Linked diagnosticPath to %@", buf, 0xCu);
      }

    }
    else
    {
      PLAssetImportGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v22 = v11;
        v23 = 2048;
        v24 = v12;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to get a diagnostic file URL (library: %p, mainFilename: %p)", buf, 0x16u);
      }
      v15 = 0;
    }

LABEL_17:
  }

}

- (void)_processImageJob:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  const __CFString *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  BOOL v48;
  id v49;
  NSObject *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  char v58;
  id v59;
  NSObject *v60;
  id v61;
  char v62;
  id v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  dispatch_time_t v72;
  NSObject *jobQueue;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  BOOL v81;
  uint64_t v82;
  id v83;
  void *v84;
  uint64_t v85;
  void *v86;
  __int16 v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  id v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  void (**v103)(_QWORD);
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  uint64_t v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  int v129;
  id v130;
  void *v131;
  id v132;
  char v133;
  id v134;
  NSObject *v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  NSObject *v150;
  PLIngestJobCameraMetadata *v151;
  void *v152;
  _QWORD v154[4];
  id v155;
  id v156;
  NSObject *v157;
  id v158;
  id v159;
  id v160;
  PLImageWriter *v161;
  id v162;
  id v163;
  id v164;
  id v165;
  _QWORD *v166;
  _BYTE *v167;
  _QWORD *v168;
  _QWORD *v169;
  _QWORD v170[4];
  id v171;
  id v172;
  id v173;
  id v174;
  id v175;
  id v176;
  id v177;
  id v178;
  NSObject *v179;
  NSObject *v180;
  id v181;
  id v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  id v188;
  PLImageWriter *v189;
  id v190;
  id v191;
  id v192;
  PLIngestJobCameraMetadata *v193;
  id v194;
  id v195;
  _BYTE *v196;
  _BYTE *v197;
  _QWORD *v198;
  _QWORD *v199;
  _QWORD *v200;
  uint64_t v201;
  double v202;
  __int16 v203;
  char v204;
  char v205;
  _QWORD v206[5];
  id v207;
  _QWORD v208[5];
  id v209;
  _QWORD v210[3];
  char v211;
  _QWORD block[4];
  id v213;
  id v214;
  id v215;
  _QWORD v216[5];
  id v217;
  id v218;
  _QWORD v219[4];
  id v220;
  id v221;
  id v222;
  id v223;
  id v224;
  id v225;
  _QWORD v226[2];
  _QWORD v227[2];
  _BYTE v228[24];
  uint64_t (*v229)(uint64_t, uint64_t);
  void (*v230)(uint64_t);
  id v231;
  uint64_t v232;
  uint64_t v233;
  _BYTE buf[24];
  uint64_t (*v235)(uint64_t, uint64_t);
  void (*v236)(uint64_t);
  id v237;
  uint64_t v238;

  v238 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v143 = a4;
  v138 = a5;
  objc_msgSend(v8, "objectForKey:", CFSTR("callStack"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  if (v149)
  {
    PLAssetImportGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v149;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "##### %@ %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("callStack"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLJobLogDictionary();

  }
  v12 = *MEMORY[0x1E0D74EC0];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74EC0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_msgSend(v148, "fileExistsAtPath:", v13) & 1) != 0)
  {
    v14 = v13;
LABEL_10:
    v145 = v14;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0D73148], "sharedDCIMWriter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "saveImageJobToDisk:", v8);

  objc_msgSend(v8, "objectForKey:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v148, "fileExistsAtPath:", v16) & 1) != 0)
  {
    v14 = v16;
    if (v16)
      goto LABEL_10;
  }
  else
  {

  }
  v145 = 0;
  v152 = 0;
LABEL_13:
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D60]);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v145, "pathExtension");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D30]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:](self, "cameraAssetPathForNewAssetWithExtension:assetUUID:", v140, v142);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v19, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74E70]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v19, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v21;
  if (v140)
  {
    objc_msgSend(v21, "pathExtension");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", v140);

    if ((v23 & 1) == 0)
    {
      objc_msgSend(v20, "URLByDeletingPathExtension");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "URLByAppendingPathExtension:", v140);
      v25 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v25;
    }
  }
LABEL_21:

  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D58]);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D20]);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (v146)
  {
    v151 = -[PLIngestJobCameraMetadata initWithCameraMetadataPath:]([PLIngestJobCameraMetadata alloc], "initWithCameraMetadataPath:", v146);
    -[PLIngestJobCameraMetadata deserializeCameraMetadata](v151, "deserializeCameraMetadata");
  }
  else
  {
    v151 = 0;
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v235 = __Block_byref_object_copy__4937;
  v236 = __Block_byref_object_dispose__4938;
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74CF8]);
  v237 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74E78]);
  v26 = objc_claimAutoreleasedReturnValue();
  -[PLImageWriter _linkDiagnosticFileWithSourcePath:forPhotoDestinationURL:](self, "_linkDiagnosticFileWithSourcePath:forPhotoDestinationURL:", v26, v20);
  v137 = (void *)v26;
  v150 = v20;
  v27 = (void *)MEMORY[0x1E0D75260];
  -[PLIngestJobCameraMetadata cameraMetadata](v151, "cameraMetadata");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "semanticEnhanceSceneForCameraMetadata:", v28);
  v31 = v30;

  -[NSObject pathExtension](v150, "pathExtension");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset uniformTypeIdentifierFromPathExtension:assetType:](PLManagedAsset, "uniformTypeIdentifierFromPathExtension:assetType:", v32, 0);
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v139);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "conformsToType:", *MEMORY[0x1E0CEC5B8]);

  if (v34)
    v35 = -1;
  else
    v35 = v29;
  v147 = v35;
  v36 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
  if (v36)
  {
    v225 = 0;
    objc_msgSend(MEMORY[0x1E0D750C0], "deserializedAdjustmentsFromData:error:", v36, &v225);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v225;
    if (v37)
    {
      objc_msgSend(v37, "portraitMetadata");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = v147;
      if (v39)
        v40 = -1;
      v147 = v40;
    }
    else
    {
      PLBackendGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v228 = 138412290;
        *(_QWORD *)&v228[4] = v38;
        _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "[SemDev] Error deserializing camera adjustment data: %@", v228, 0xCu);
      }

    }
  }
  if (objc_msgSend((id)objc_opt_class(), "semanticEnhanceSceneIsValid:", v147))
  {
    PLAssetImportGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)(v147 + 1) > 4)
        v43 = CFSTR("unknown");
      else
        v43 = off_1E36615F0[v147 + 1];
      *(_DWORD *)v228 = 138412290;
      *(_QWORD *)&v228[4] = v43;
      _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "[SemDev] Classifying image as semantic enhance scene: %@", v228, 0xCu);
    }

    -[PLIngestJobCameraMetadata cameraMetadata](v151, "cameraMetadata");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setSemanticEnhanceScene:", v147);

    -[PLIngestJobCameraMetadata cameraMetadata](v151, "cameraMetadata");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setSemanticEnhanceSceneConfidence:", v31);

    +[PLImageWriter cameraMetadataURLForPrimaryAssetURL:photoLibrary:](PLImageWriter, "cameraMetadataURLForPrimaryAssetURL:photoLibrary:", v150, v143);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = 0;
    v48 = -[PLImageWriter _writeOutCameraMetadata:destinationURL:error:](self, "_writeOutCameraMetadata:destinationURL:error:", v151, v47, &v224);
    v49 = v224;
    if (v48)
    {
      if (v144)
      {
        v133 = 0;
        v44 = v150;
LABEL_51:

        goto LABEL_52;
      }
      +[PLImageWriter semanticEnhancePreviewDestinationURLForPrimaryAssetURL:](PLImageWriter, "semanticEnhancePreviewDestinationURLForPrimaryAssetURL:", v150);
      v133 = v48;
      v44 = objc_claimAutoreleasedReturnValue();
      v50 = v150;
    }
    else
    {
      PLBackendGetLog();
      v50 = objc_claimAutoreleasedReturnValue();
      v133 = v48;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v228 = 138412290;
        *(_QWORD *)&v228[4] = v49;
        _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_ERROR, "[SemDev] Error writing out MDATA file, skipping SemDev: %@", v228, 0xCu);
      }
      v147 = -1;
      v44 = v150;
    }

    goto LABEL_51;
  }
  v133 = 0;
  v44 = v150;
LABEL_52:
  v141 = 0;
  if (v144 && v44)
  {
    +[PLPhotoLibrary deferredPhotoPreviewDestinationURLForPrimaryAssetURL:](PLPhotoLibrary, "deferredPhotoPreviewDestinationURLForPrimaryAssetURL:", v44);
    v51 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D98]);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D88]);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = 1;
    v44 = v51;
  }
  else
  {
    v136 = 0;
  }
  if (v152 && v44)
  {
    v52 = (void *)MEMORY[0x1E0D73200];
    -[NSObject path](v44, "path");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "persistString:forKey:fileURL:", v53, *MEMORY[0x1E0D73F58], v152);
    v54 = v44;

    if (v149)
    {
      PLAssetImportGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v228 = 138412290;
        *(_QWORD *)&v228[4] = v44;
        _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_DEBUG, "#### added destination EA %@", v228, 0xCu);
      }

    }
    v232 = *MEMORY[0x1E0CB2AD8];
    v233 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v233, &v232, 1);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "path");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v223 = 0;
    v58 = objc_msgSend(v148, "setAttributes:ofItemAtPath:error:", v56, v57, &v223);
    v59 = v223;

    if ((v58 & 1) == 0)
    {
      PLAssetImportGetLog();
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v152, "path");
        v61 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v228 = 138412546;
        *(_QWORD *)&v228[4] = v61;
        *(_WORD *)&v228[12] = 2112;
        *(_QWORD *)&v228[14] = v59;
        _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", v228, 0x16u);

      }
    }
    v222 = 0;
    v62 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v152, v54, &v222);
    v63 = v222;
    if ((v62 & 1) != 0)
    {
      if (!v149)
      {
LABEL_74:

        v44 = v54;
        goto LABEL_75;
      }
      PLAssetImportGetLog();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v228 = 138412290;
        *(_QWORD *)&v228[4] = v54;
        _os_log_impl(&dword_199541000, v64, OS_LOG_TYPE_DEBUG, "#### linked photoSourcePath to %@", v228, 0xCu);
      }
    }
    else
    {
      PLAssetImportGetLog();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v228 = 138412802;
        *(_QWORD *)&v228[4] = v152;
        *(_WORD *)&v228[12] = 2112;
        *(_QWORD *)&v228[14] = v54;
        *(_WORD *)&v228[22] = 2112;
        v229 = (uint64_t (*)(uint64_t, uint64_t))v63;
        _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@: %@", v228, 0x20u);
      }

      v64 = v54;
      v54 = 0;
    }

    goto LABEL_74;
  }
LABEL_75:
  v135 = v44;
  if (!v152 || !v44)
  {
    v82 = MEMORY[0x1E0C809B0];
    v219[0] = MEMORY[0x1E0C809B0];
    v219[1] = 3221225472;
    v219[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke;
    v219[3] = &unk_1E3677C18;
    v220 = v143;
    v221 = v142;
    v216[0] = v82;
    v216[1] = 3221225472;
    v216[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_2;
    v216[3] = &unk_1E3676290;
    v216[4] = self;
    v217 = v8;
    v218 = v138;
    objc_msgSend(v220, "performTransaction:completionHandler:", v219, v216);

    v83 = v220;
    goto LABEL_111;
  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D38]);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D08]);
  v123 = objc_claimAutoreleasedReturnValue();
  v113 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  if (objc_msgSend(v113, "BOOLForKey:", CFSTR("PLImageWriterStashCameraJob")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPLImageWriterReplayedCameraJob"));
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (v66 | v123) == 0;

    if (v67)
      -[PLImageWriter _copyJobContentsToHoldingDirectoryWithUUID:incomingPath:job:](self, "_copyJobContentsToHoldingDirectoryWithUUID:incomingPath:job:", v126, v145, v8);
  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74E98]);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v68, "BOOLValue");

  if (v129)
  {
    objc_msgSend(v145, "stringByDeletingLastPathComponent");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    _photoIrisIndicatorFilePathForPhoto(v69, (uint64_t)v126);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      PLMakeIndicatorFileExistAtPath();
      objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLImageWriter _processImageJob:inLibrary:completion:]");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = dispatch_time(0, 8000000000);
      jobQueue = self->_jobQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_3;
      block[3] = &unk_1E3677530;
      v213 = v143;
      v214 = v70;
      v74 = v71;
      v215 = v74;
      dispatch_after(v72, jobQueue, block);

    }
  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74C58]);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74CC8]);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74CC0]);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74E58]);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D28]);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v75)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v75 = 0;
    }
  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D40]);
  v76 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D18]);
  v77 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", CFSTR("ImportedBy"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = (void *)v77;
  v118 = (void *)v76;
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74D70]);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74DA8]);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v79)
  {
    objc_msgSend(v124, "objectForKey:", *MEMORY[0x1E0CBCFF0]);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v80 == 0;

    if (v81)
    {
      v79 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PLImageOrientationFromImageProperties());
      v79 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74EE8]);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v84, "length"))
  {
    DCIM_newPLImageWithStoredJPEGData();
    v85 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v86 = 0;
    if (!objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74EF0]) || !v79)
      goto LABEL_98;
    objc_msgSend(v79, "intValue");
    v85 = DCIM_newPLImageWithCGImage();
  }
  v86 = (void *)v85;
LABEL_98:
  *(_QWORD *)v228 = 0;
  *(_QWORD *)&v228[8] = v228;
  *(_QWORD *)&v228[16] = 0x3032000000;
  v229 = __Block_byref_object_copy__4937;
  v230 = __Block_byref_object_dispose__4938;
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74E80]);
  v231 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74E68]);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74E60]);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v210[0] = 0;
  v210[1] = v210;
  v210[2] = 0x2020000000;
  v211 = 0;
  v87 = objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForUnspecifiedImageWriterJobs");
  v88 = *MEMORY[0x1E0D74F00];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74F00]);
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    objc_msgSend(v8, "objectForKey:", v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v90, "integerValue");

  }
  if ((objc_msgSend(v78, "intValue") == 6 || objc_msgSend(v78, "intValue") == 9)
    && objc_msgSend(v131, "length"))
  {
    v91 = *MEMORY[0x1E0D73598];
    v227[0] = v131;
    v92 = *MEMORY[0x1E0D735A0];
    v226[0] = v91;
    v226[1] = v92;
    v93 = v128;
    if (!v128)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v227[1] = v93;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v227, v226, 2);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x19AEC0B7C](*MEMORY[0x1E0D73590], v94);

    if (!v128)
  }
  v208[0] = 0;
  v208[1] = v208;
  v208[2] = 0x3032000000;
  v208[3] = __Block_byref_object_copy__4937;
  v208[4] = __Block_byref_object_dispose__4938;
  v209 = 0;
  v206[0] = 0;
  v206[1] = v206;
  v206[2] = 0x3032000000;
  v206[3] = __Block_byref_object_copy__4937;
  v206[4] = __Block_byref_object_dispose__4938;
  v207 = 0;
  -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v8);
  v170[0] = MEMORY[0x1E0C809B0];
  v170[1] = 3221225472;
  v170[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_5;
  v170[3] = &unk_1E36613D8;
  v109 = v131;
  v171 = v109;
  v110 = v119;
  v172 = v110;
  v111 = v121;
  v173 = v111;
  v117 = v116;
  v174 = v117;
  v120 = v78;
  v175 = v120;
  v122 = v124;
  v176 = v122;
  v112 = v75;
  v177 = v112;
  v95 = v143;
  v178 = v95;
  v96 = v135;
  v179 = v96;
  v180 = v150;
  v125 = v86;
  v181 = v125;
  v203 = v87;
  v182 = v142;
  v108 = v126;
  v183 = v108;
  v204 = v133;
  v127 = v118;
  v184 = v127;
  v205 = v129;
  v185 = v136;
  v186 = v141;
  v196 = buf;
  v197 = v228;
  v97 = v148;
  v187 = v97;
  v134 = v115;
  v188 = v134;
  v189 = self;
  v132 = v84;
  v190 = v132;
  v198 = v210;
  v98 = v114;
  v191 = v98;
  v99 = v8;
  v192 = v99;
  v193 = v151;
  v130 = (id)v123;
  v194 = v130;
  v202 = v31;
  v195 = v144;
  v199 = v206;
  v201 = v147;
  v200 = v208;
  v100 = (void *)MEMORY[0x19AEC174C](v170);
  v154[0] = MEMORY[0x1E0C809B0];
  v154[1] = 3221225472;
  v154[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_162;
  v154[3] = &unk_1E3661400;
  v101 = v99;
  v155 = v101;
  v156 = v152;
  v157 = v96;
  v158 = v97;
  v159 = v145;
  v160 = v149;
  v161 = self;
  v162 = v137;
  v102 = v98;
  v163 = v102;
  v164 = v146;
  v166 = v210;
  v167 = v228;
  v168 = v208;
  v169 = v206;
  v103 = (void (**)(_QWORD))v138;
  v165 = v103;
  v104 = (void *)MEMORY[0x19AEC174C](v154);
  objc_msgSend(v101, "objectForKey:", CFSTR("imagejob_transient_save_transaction"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v98) = objc_msgSend(v105, "BOOLValue");

  if ((_DWORD)v98)
  {
    v106 = (void *)objc_msgSend(v100, "copy");
    objc_msgSend(v101, "setObject:forKey:", v106, CFSTR("imagejob_transient_transaction_block"));

    v107 = (void *)objc_msgSend(v104, "copy");
    objc_msgSend(v101, "setObject:forKey:", v107, CFSTR("imagejob_transient_transaction_completion_block"));

    v103[2](v103);
  }
  else
  {
    objc_msgSend(v95, "performTransaction:completionHandler:withPriority:", v100, v104, 1);
  }

  _Block_object_dispose(v206, 8);
  _Block_object_dispose(v208, 8);

  _Block_object_dispose(v210, 8);
  _Block_object_dispose(v228, 8);

  v83 = v108;
LABEL_111:

  _Block_object_dispose(buf, 8);
}

- (void)_removeInProgressExtendedAttributesForFileAtURL:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D73200], "filesystemPersistenceBatchItemForFileAtURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setData:forKey:", 0, *MEMORY[0x1E0D73F68]);
    objc_msgSend(v4, "setData:forKey:", 0, *MEMORY[0x1E0D73F58]);
    objc_msgSend(v4, "setData:forKey:", 0, *MEMORY[0x1E0D73F50]);
    objc_msgSend(v4, "setData:forKey:", 0, *MEMORY[0x1E0D73F60]);
    objc_msgSend(v4, "persist");
    v3 = v4;
  }

}

- (id)_processLimitedLibraryAdditionIfNeededWithAssetUUID:(id)a3 clientBundleIdentifier:(id)a4 clientAuthorization:(id)a5 library:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "length") && objc_msgSend(v10, "length"))
  {
    if (v11)
    {
      objc_msgSend(v11, "clientAuditToken");
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
    }
    objc_msgSend(v12, "managedObjectContext", v19, v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLLimitedLibraryFetchFilter fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:auditToken:inManagedObjectContext:](PLLimitedLibraryFetchFilter, "fetchOrCreateLimitedLibraryFetchFilterWithApplicationIdentifier:auditToken:inManagedObjectContext:", v10, &v19, v15);
    v13 = objc_claimAutoreleasedReturnValue();

    PLAssetImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Adding image writer asset %{public}@ to limited library fetch filter for %@", buf, 0x16u);
    }

    v21 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addAssetsWithUUIDs:](v13, "addAssetsWithUUIDs:", v17);

    -[NSObject objectID](v13, "objectID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLAssetImportGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Error adding asset to limited library due to nil uuid %{public}@ or clientBundleIdentifier %@", buf, 0x16u);
    }
    v14 = 0;
  }

  return v14;
}

- (void)_processBatchImageJob:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  void (**v44)(_QWORD);
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD v50[4];
  id v51;
  PLImageWriter *v52;
  id v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = *MEMORY[0x1E0D74CF0];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D74CF0]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  if (objc_msgSend(v12, "BOOLForKey:", CFSTR("PLImageWriterStashCameraJob")))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kPLImageWriterReplayedCameraJob"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v41 = v11;
      v42 = v9;
      v43 = v12;
      v44 = v10;
      v45 = v8;
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = objc_msgSend(v46, "count");
      if (v15)
      {
        v16 = v15;
        for (i = 0; i != v16; ++i)
        {
          objc_msgSend(v46, "objectAtIndex:", i, v41);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "mutableCopy");
          objc_msgSend(v14, "setObject:atIndexedSubscript:", v19, i);

        }
      }
      v57 = 0u;
      v58 = 0u;
      v56 = 0u;
      v55 = 0u;
      v20 = v14;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v56;
        v24 = *MEMORY[0x1E0D74EF0];
        v25 = *MEMORY[0x1E0D74E70];
        v26 = *MEMORY[0x1E0D74F28];
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v56 != v23)
              objc_enumerationMutation(v20);
            v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
            v59[0] = CFSTR("completionBlock");
            v59[1] = v24;
            v59[2] = v25;
            v59[3] = v26;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4, v41);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeObjectsForKeys:", v29);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
        }
        while (v22);
      }

      objc_msgSend(v20, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v20, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", *MEMORY[0x1E0D74D08]);
        v32 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKey:", *MEMORY[0x1E0D74EC0]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = v45;
        v35 = (void *)objc_msgSend(v45, "mutableCopy");
        objc_msgSend(v35, "setObject:forKeyedSubscript:", v20, v41);
        -[PLImageWriter _copyJobContentsToHoldingDirectoryWithUUID:incomingPath:job:](self, "_copyJobContentsToHoldingDirectoryWithUUID:incomingPath:job:", v32, v34, v35);

        v10 = v44;
        v12 = v43;
      }
      else
      {
        PLAssetImportGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        v10 = v44;
        v8 = v45;
        v12 = v43;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "No job dictionaries found in batch image job, skipping stashing of camera job", buf, 2u);
        }
      }
      v9 = v42;

    }
  }
  v36 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __60__PLImageWriter__processBatchImageJob_inLibrary_completion___block_invoke;
  v50[3] = &unk_1E3677530;
  v37 = v46;
  v51 = v37;
  v52 = self;
  v38 = v9;
  v53 = v38;
  objc_msgSend(v38, "performTransactionAndWait:", v50);
  -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v8);
  v47[0] = v36;
  v47[1] = 3221225472;
  v47[2] = __60__PLImageWriter__processBatchImageJob_inLibrary_completion___block_invoke_3;
  v47[3] = &unk_1E3677C18;
  v48 = v38;
  v49 = v37;
  v39 = v37;
  v40 = v38;
  objc_msgSend(v40, "performTransactionAndWait:", v47);
  v10[2](v10);
  -[PLImageWriter _decrementJobCount:](self, "_decrementJobCount:", v8);

}

- (void)_processAvalancheJob:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v16 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D74D60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D74CD0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D74CD8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D74CE0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
    if (objc_msgSend(v12, "BOOLForKey:", CFSTR("PLImageWriterStashCameraJob")))
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("kPLImageWriterReplayedCameraJob"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        -[PLImageWriter _copyJobContentsToHoldingDirectoryWithUUID:incomingPath:job:](self, "_copyJobContentsToHoldingDirectoryWithUUID:incomingPath:job:", v8, 0, v16);
    }
    if (objc_msgSend(v9, "count", v16) && objc_msgSend(v10, "count") && v11)
    {
      -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v16);
      v14 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processAvalancheJob:completion:]");
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __49__PLImageWriter__processAvalancheJob_completion___block_invoke;
      v17[3] = &unk_1E3670C40;
      v18 = v9;
      v19 = v8;
      v20 = v14;
      v21 = v10;
      v22 = v11;
      v15 = v14;
      objc_msgSend(v15, "performTransactionAndWait:", v17);
      v6[2](v6);
      -[PLImageWriter _decrementJobCount:](self, "_decrementJobCount:", v16);

    }
  }

  objc_autoreleasePoolPop(v7);
}

- (void)_processAvalanchesValidationJob:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74CE8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processAvalanchesValidationJob:completion:]");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__PLImageWriter__processAvalanchesValidationJob_completion___block_invoke;
  v14[3] = &unk_1E3677530;
  v15 = v9;
  v13 = v6;
  v16 = v13;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v11, "performBlockAndWait:", v14);
  v7[2](v7);

  objc_autoreleasePoolPop(v8);
}

- (void)_processAutodeleteEmptyAlbumJob:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  void (**v15)(_QWORD);
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v6, "objectForKey:", CFSTR("EmptyAlbumToDelete"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processAutodeleteEmptyAlbumJob:completion:]");
    -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v6);
    v11 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__PLImageWriter__processAutodeleteEmptyAlbumJob_completion___block_invoke;
    v16[3] = &unk_1E3677C18;
    v17 = v10;
    v18 = v9;
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __60__PLImageWriter__processAutodeleteEmptyAlbumJob_completion___block_invoke_2;
    v13[3] = &unk_1E3676290;
    v15 = v7;
    v13[4] = self;
    v14 = v6;
    v12 = v10;
    objc_msgSend(v12, "performTransaction:completionHandler:", v16, v13);

  }
  else
  {
    v7[2](v7);
  }

  objc_autoreleasePoolPop(v8);
}

- (void)_processDeletePhotoStreamDataJob:(id)a3 withReason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PLImageWriter__processDeletePhotoStreamDataJob_withReason_completion___block_invoke;
  v14[3] = &unk_1E3676290;
  v15 = v8;
  v16 = v9;
  v14[4] = self;
  v12 = v8;
  v13 = v9;
  +[PLPhotoStreamsHelper deletePhotoStreamAssetsWithLibraryServiceManager:withReason:completion:](PLPhotoStreamsHelper, "deletePhotoStreamAssetsWithLibraryServiceManager:withReason:completion:", WeakRetained, v10, v14);

}

- (void)_enablePhotoStreamJob:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLMyPhotoStreamGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "_enablePhotoStreamJob %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", *MEMORY[0x1E0D74DF0], *MEMORY[0x1E0D74DB8]);
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[_enablePhotoStreamJob]Enabling PhotoStream so we make sure that previous assets are deleted."));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __50__PLImageWriter__enablePhotoStreamJob_completion___block_invoke;
  v12[3] = &unk_1E3676CD8;
  v13 = v7;
  v11 = v7;
  -[PLImageWriter _processDeletePhotoStreamDataJob:withReason:completion:](self, "_processDeletePhotoStreamDataJob:withReason:completion:", v9, v10, v12);

}

- (id)iTunesSyncedAssetsDCIMDirectory
{
  PLImageWriter *v2;
  id WeakRetained;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  PLSimpleDCIMDirectory *iTunesSyncedAssetsDCIMDirectory;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_iTunesSyncedAssetsDCIMDirectory)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v2->_libraryServicesManager);
    objc_msgSend(WeakRetained, "pathManager");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "iTunesSyncedAssetsDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = 0;
    LOBYTE(v4) = objc_msgSend(MEMORY[0x1E0D73208], "createDirectoryAtPath:error:", v5, &v12);
    v6 = v12;
    if ((v4 & 1) == 0)
    {
      PLSyncGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v5;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Unable to create directory \"%@\": %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0D732E0]), "initWithDirectoryURL:subDirectorySuffix:perDirectoryLimit:userInfoPath:", v8, CFSTR("SYNCD"), 2000, 0);
    iTunesSyncedAssetsDCIMDirectory = v2->_iTunesSyncedAssetsDCIMDirectory;
    v2->_iTunesSyncedAssetsDCIMDirectory = (PLSimpleDCIMDirectory *)v9;

  }
  objc_sync_exit(v2);

  return v2->_iTunesSyncedAssetsDCIMDirectory;
}

- (void)_resetSyncedAssetsDCIMDirectory
{
  id v2;

  -[PLImageWriter iTunesSyncedAssetsDCIMDirectory](self, "iTunesSyncedAssetsDCIMDirectory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (void)processSyncSaveJob:(id)a3 library:(id)a4 albumMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  NSObject *v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  _UNKNOWN **v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  id *v53;
  void *v54;
  void *v55;
  char v56;
  id *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id v62;
  BOOL v63;
  id v64;
  NSObject *v65;
  id WeakRetained;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  id v77;
  id v78;
  unsigned int *v79;
  unsigned int *v80;
  id v81;
  _BYTE *v82;
  uint64_t v83;
  uint64_t NextPart;
  uint64_t v85;
  int v86;
  char *FilePath;
  void *v88;
  void *v89;
  id v90;
  int v91;
  void *ThumbnailData;
  int v93;
  id v94;
  id v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  id v107;
  NSObject *v108;
  NSObject *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  id v113;
  id *v114;
  char v115;
  id v116;
  void *v117;
  uint64_t v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  char v128;
  NSObject *v129;
  id v130;
  void *v131;
  NSObject *v132;
  void *v133;
  NSObject *v134;
  id *v135;
  void *v136;
  void *v137;
  void *v138;
  NSObject *v139;
  void *v140;
  NSObject *v141;
  NSObject *v142;
  void *v143;
  void *v144;
  void *v145;
  NSObject *v146;
  void *v147;
  NSObject *v148;
  void *v149;
  char v150;
  void *v151;
  void *v152;
  NSObject *v153;
  void *v154;
  void *v155;
  NSObject *v156;
  NSObject *v157;
  id v158;
  NSObject *v159;
  void *v160;
  char v161;
  NSObject *v162;
  char v163;
  id v164;
  NSObject *v165;
  BOOL v166;
  NSObject *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t i;
  id v194;
  void *v195;
  uint64_t v196;
  id v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  NSObject *v217;
  NSObject *v218;
  void *v219;
  void *v220;
  id v221;
  void *v222;
  uint64_t v223;
  id v224;
  uint64_t v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  id *location;
  char locationa;
  id *locationb;
  void *v234;
  void *v235;
  id v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  id v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  _QWORD v250[4];
  id v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  id v256;
  id v257;
  __int128 v258;
  uint64_t v259;
  __int128 v260;
  uint64_t v261;
  id v262;
  id v263;
  uint64_t v264;
  id v265;
  id v266;
  unsigned int *v267;
  id v268;
  id v269;
  id v270;
  id v271;
  id v272;
  id v273;
  id v274;
  _BYTE v275[128];
  _BYTE v276[128];
  uint8_t v277[32];
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint8_t buf[24];
  id *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  _QWORD v287[4];

  v287[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    goto LABEL_28;
  PLSyncGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v8;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Process sync save job %{public}@", buf, 0xCu);
  }

  +[PLDelayedFiledSystemDeletions waitForAllDelayedDeletionsToFinish](PLDelayedFiledSystemDeletions, "waitForAllDelayedDeletionsToFinish");
  if (objc_msgSend(v8, "cleanupSyncState"))
  {
    PLSyncGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Process sync cleanup", buf, 2u);
    }

    v13 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(v8, "cleanupBeforeDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLImageWriter cleanupFilesInLibrary:afteriTunesSyncBeforeDate:](self, "cleanupFilesInLibrary:afteriTunesSyncBeforeDate:", v9, v14);

    objc_autoreleasePoolPop(v13);
    goto LABEL_28;
  }
  if (objc_msgSend(v8, "isSyncComplete"))
  {
    PLSyncGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Process sync completion", buf, 2u);
    }

    objc_msgSend(v8, "originalAssetURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "fileExistsAtPath:", v17);

    if (v17 && v19)
    {
      v20 = v10;
      objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("lastsynced"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v286 = *MEMORY[0x1E0CB2AD8];
      v287[0] = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v287, &v286, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v274 = 0;
      v24 = objc_msgSend(v22, "setAttributes:ofItemAtPath:error:", v23, v17, &v274);
      v25 = v274;

      if ((v24 & 1) == 0)
      {
        PLSyncGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v25;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Unable to assign data protection to sync metadata \"%@\": %@", buf, 0x16u);
        }

      }
      objc_msgSend(v22, "removeItemAtPath:error:", v21, 0);
      v273 = v25;
      v27 = objc_msgSend(v22, "moveItemAtPath:toPath:error:", v17, v21, &v273);
      v28 = v273;

      if ((v27 & 1) == 0)
      {
        PLSyncGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v28;
          _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Failed to move the sync metadata to %@! Error: %@", buf, 0x16u);
        }

      }
      v10 = v20;
    }
    +[PLManagedAlbum clearAssetOrderByAbumUUIDs](PLManagedAlbum, "clearAssetOrderByAbumUUIDs");
    objc_msgSend(v9, "managedObjectContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _PLPhotoLibraryAggregateSyncedContent(v30, 0, (uint64_t)CFSTR("com.apple.mobileslideshow.syncedPhotoCount"));
    _PLPhotoLibraryAggregateSyncedContent(v30, 1u, (uint64_t)CFSTR("com.apple.mobileslideshow.syncedVideoCount"));

    goto LABEL_28;
  }
  v31 = &off_1E3659000;
  objc_msgSend(v8, "uuid");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v32, v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v243 = v33;
  if (v33)
  {
    PLSyncGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v33, "uuid");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v35;
      _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_FAULT, "Attempting to sync an asset that is already in the library (UUID: %{public}@)", buf, 0xCu);

    }
    v36 = 0;
LABEL_27:

    goto LABEL_28;
  }
  v242 = v9;
  if (objc_msgSend(v8, "isVideo"))
  {
    objc_msgSend(v8, "originalAssetURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "pathExtension");
    v38 = objc_claimAutoreleasedReturnValue();

    -[PLImageWriter iTunesSyncedAssetsDCIMDirectory](self, "iTunesSyncedAssetsDCIMDirectory");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v234 = (void *)v38;
    objc_msgSend(v39, "nextAvailableFileURLWithExtension:", v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v41 = objc_claimAutoreleasedReturnValue();
    v284 = *MEMORY[0x1E0CB2AD8];
    v285 = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v285, &v284, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "originalAssetURL");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "path");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = 0;
    v240 = (void *)v41;
    LOBYTE(v41) = objc_msgSend((id)v41, "setAttributes:ofItemAtPath:error:", v42, v44, &v272);
    v45 = v272;

    if ((v41 & 1) == 0)
    {
      PLSyncGetLog();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "originalAssetURL");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "path");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v45;
        _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "Unable to assign data protection to video \"%@\": %@", buf, 0x16u);

      }
    }
    objc_msgSend(v8, "originalAssetURL");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "path");
    v50 = objc_claimAutoreleasedReturnValue();

    PLSyncGetLog();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "uuid");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "path");
      v53 = (id *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v50;
      *(_WORD *)&buf[22] = 2112;
      v283 = v53;
      _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEFAULT, "Importing iTunes sync video asset %{public}@ %@ -> %@", buf, 0x20u);

    }
    v238 = (void *)v50;

    objc_msgSend(v8, "originalAssetURL");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v271 = v45;
    v55 = v240;
    v56 = objc_msgSend(v240, "moveItemAtURL:toURL:error:", v54, v40, &v271);
    v57 = (id *)v271;

    if ((v56 & 1) != 0)
    {
      location = v57;
      v58 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForFinderSyncedAsset");
      objc_msgSend(v8, "uuid");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:](PLManagedAsset, "insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:", v242, v40, v58, 0, v59, 0, 0, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v40, "path");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v269 = 0;
        v270 = 0;
        PLPreviewImageAndDurationForVideoAtPathWithPreferredTime(0, v60, &v270, &v269, 0);
        v61 = v270;
        v62 = v269;

        objc_msgSend(v36, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", v61, v62, 0, 0, 0);
        v268 = 0;
        v63 = +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v36, 0, 0, &v268);
        v64 = v268;
        if (!v63)
        {
          PLSyncGetLog();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v64;
            _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %@", buf, 0x16u);
          }

        }
      }
      else
      {
        PLSyncGetLog();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "uuid");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "path");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v151;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v152;
          _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "Failed to import iTunes sync video %{public}@, unable to insert asset %{public}@", buf, 0x16u);

        }
        v36 = 0;
      }
      v57 = location;
      v138 = v234;
      v55 = v240;
    }
    else
    {
      PLSyncGetLog();
      v134 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v40, "path");
        v135 = v57;
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v238;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v136;
        *(_WORD *)&buf[22] = 2112;
        v283 = v135;
        _os_log_impl(&dword_199541000, v134, OS_LOG_TYPE_ERROR, "Unable to move sync video %@ to %@: %@", buf, 0x20u);

        v57 = v135;
      }

      PLSyncGetLog();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "uuid");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v137;
        _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "Sync save job failed for video %{public}@", buf, 0xCu);

      }
      v36 = 0;
      v138 = v234;
    }

    v9 = v242;
    if ((v56 & 1) != 0)
      goto LABEL_153;
    goto LABEL_27;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "pathManager");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "iTunesSyncedAssetsDirectory");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v241, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v68, 1, 0, 0);
  objc_msgSend(v8, "originalAssetURL");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "path");
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  PLSyncGetLog();
  v71 = objc_claimAutoreleasedReturnValue();
  v239 = v70;
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uuid");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v72;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v239;
    _os_log_impl(&dword_199541000, v71, OS_LOG_TYPE_DEFAULT, "Processing iTunes sync asset %{public}@ %@", buf, 0x16u);

    v70 = v239;
  }

  v229 = v68;
  if (v70)
  {
    v73 = (void *)MEMORY[0x1E0CEC3F8];
    objc_msgSend(v70, "pathExtension");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "typeWithFilenameExtension:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "conformsToType:", *MEMORY[0x1E0CEC698]);

    v70 = v239;
    v267 = 0;
    if (v76)
    {
      v77 = v239;
      locationa = 1;
      goto LABEL_76;
    }
  }
  v78 = objc_retainAutorelease(v70);
  v79 = SyncedAssetCreateWithFileAtPath((unsigned int *)objc_msgSend(v78, "fileSystemRepresentation"));
  v267 = v79;
  if (!v79)
  {
    PLSyncGetLog();
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v78;
      _os_log_impl(&dword_199541000, v141, OS_LOG_TYPE_ERROR, "Failed to create SyncedAsset from path: %@", buf, 0xCu);
    }

    PLSyncGetLog();
    v142 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "uuid");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v143;
      _os_log_impl(&dword_199541000, v142, OS_LOG_TYPE_ERROR, "Sync save job failed for asset %{public}@", buf, 0xCu);

    }
    v77 = 0;
    goto LABEL_111;
  }
  v80 = v79;
  v81 = objc_retainAutorelease(v68);
  v82 = (_BYTE *)objc_msgSend(v81, "cStringUsingEncoding:", 1);
  if (*v82)
    *((_QWORD *)v80 + 7) = v82;
  v235 = v8;
  v83 = (uint64_t)v267;
  if (v267)
  {
    *((_BYTE *)v267 + 52) = v267[13] & 0xFC | 1;
    *(_DWORD *)(v83 + 48) = *(_DWORD *)(v83 + 40) - 1;
  }
  NextPart = SyncedAssetExtractNextPart(v83);
  if (!NextPart)
  {
LABEL_98:
    PLSyncGetLog();
    v139 = objc_claimAutoreleasedReturnValue();
    v8 = v235;
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v235, "uuid");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v140;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v235;
      _os_log_impl(&dword_199541000, v139, OS_LOG_TYPE_ERROR, "Failed to import iTunes sync photo asset %{public}@, unable to resolve path from job %@", buf, 0x16u);

    }
    v36 = 0;
    v77 = 0;
    v121 = v239;
LABEL_147:
    if (v267 && (v267[13] & 1) != 0)
      *((_BYTE *)v267 + 52) = v267[13] & 0xFC | 2;
    SyncedAssetDestroy((uint64_t *)&v267);
LABEL_151:
    v150 = 1;
    goto LABEL_152;
  }
  v85 = NextPart;
  v77 = 0;
  do
  {
    v86 = *(_DWORD *)(v85 + 4);
    if (v86 == 2)
    {
      v90 = v10;
      v91 = *(_DWORD *)v85;
      ThumbnailData = SyncedPartGetThumbnailData(v85, (uint64_t)v267);
      v93 = *(_DWORD *)(v85 + 24);
      v94 = *(id *)(v85 + 32);
      v88 = v94;
      if (v91 != 901 || ThumbnailData == 0 || v93 == 0 || v94 == 0)
      {
        v10 = v90;
      }
      else
      {
        v98 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
        objc_msgSend(v98, "pathManager");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "iTunesSyncedFaceAlbumThumbnailsDirectory");
        v89 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v241, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v89, 1, 0, 0);
        objc_msgSend(v89, "stringByAppendingPathComponent:", v88);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "stringByAppendingPathExtension:", CFSTR("JPG"));
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        PLWriteThumbnailDataToPath(ThumbnailData, v93, 901, v101);
        v9 = v242;
        v10 = v90;
LABEL_71:

      }
      goto LABEL_73;
    }
    if (!v86)
    {
      FilePath = SyncedPartGetFilePath(v85, (uint64_t)v267);
      if (FilePath)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", FilePath);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "stringByAppendingPathComponent:", v88);
        v89 = v77;
        v77 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_71;
      }
    }
LABEL_73:
    v85 = SyncedAssetExtractNextPart((uint64_t)v267);
  }
  while (v85);
  if (!v77)
    goto LABEL_98;
  locationa = 0;
  v8 = v235;
  v31 = &off_1E3659000;
LABEL_76:
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v77, 0);
  v102 = objc_claimAutoreleasedReturnValue();
  -[PLImageWriter iTunesSyncedAssetsDCIMDirectory](self, "iTunesSyncedAssetsDCIMDirectory");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "pathExtension");
  v104 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "nextAvailableFileURLWithExtension:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v225 = *MEMORY[0x1E0CB2AD8];
  v280 = *MEMORY[0x1E0CB2AD8];
  v223 = *MEMORY[0x1E0CB2AC0];
  v281 = *MEMORY[0x1E0CB2AC0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v281, &v280, 1);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v266 = 0;
  LOBYTE(v104) = objc_msgSend(v241, "setAttributes:ofItemAtPath:error:", v106, v77, &v266);
  v107 = v266;

  if ((v104 & 1) == 0)
  {
    PLSyncGetLog();
    v108 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v77;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v107;
      _os_log_impl(&dword_199541000, v108, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
    }

  }
  PLSyncGetLog();
  v109 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uuid");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "path");
    v111 = v105;
    v112 = v102;
    v113 = v10;
    v114 = (id *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v110;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v77;
    *(_WORD *)&buf[22] = 2112;
    v283 = v114;
    _os_log_impl(&dword_199541000, v109, OS_LOG_TYPE_DEFAULT, "Importing iTunes sync photo asset %{public}@ %@ -> %@", buf, 0x20u);

    v10 = v113;
    v102 = v112;
    v105 = v111;
    v31 = &off_1E3659000;

  }
  v265 = v107;
  v115 = objc_msgSend(v241, "moveItemAtURL:toURL:error:", v102, v105, &v265);
  v236 = v265;

  if ((v115 & 1) != 0)
  {
    v221 = v77;
    v116 = v10;
    v264 = 0;
    v117 = v31[476];
    v118 = objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForFinderSyncedAsset");
    objc_msgSend(v8, "uuid");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    v263 = 0;
    objc_msgSend(v117, "insertAssetIntoPhotoLibrary:mainFileURL:savedAssetType:bundleScope:uuid:replacementUUID:imageSource:imageData:", v242, v105, v118, 0, v119, 0, &v264, &v263);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = v263;

    v222 = (void *)v102;
    v227 = v120;
    if (v36)
    {
      v121 = v239;
      if (objc_msgSend(v8, "hasVideoComplement"))
      {
        objc_msgSend(v8, "videoComplementURL");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "path");
        v123 = objc_claimAutoreleasedReturnValue();

        v124 = (void *)v123;
        v10 = v116;
        v220 = v105;
        if (v124 && objc_msgSend(v241, "fileExistsAtPath:", v124))
        {
          v278 = v225;
          v279 = v223;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v279, &v278, 1);
          v125 = objc_claimAutoreleasedReturnValue();
          v126 = v124;
          v127 = (void *)v125;
          v262 = v236;
          v226 = v126;
          v128 = objc_msgSend(v241, "setAttributes:ofItemAtPath:error:", v125);
          v224 = v236;

          v9 = v242;
          if ((v128 & 1) == 0)
          {
            PLSyncGetLog();
            v129 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v226;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v224;
              _os_log_impl(&dword_199541000, v129, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
            }

          }
          v130 = objc_alloc(MEMORY[0x1E0D75318]);
          objc_msgSend(v105, "path");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = objc_msgSend(v130, "initWithPathToVideo:pathToImage:", v226, v131);

          -[NSObject pairingIdentifier](v132, "pairingIdentifier");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          memset(buf, 0, sizeof(buf));
          if (v132)
          {
            -[NSObject imageDisplayTime](v132, "imageDisplayTime");
            v260 = 0uLL;
            v261 = 0;
            -[NSObject originalVideoDuration](v132, "originalVideoDuration");
          }
          else
          {
            v260 = 0uLL;
            v261 = 0;
          }
          if (v133 && (BYTE12(v260) & 1) != 0)
          {
            objc_msgSend(v8, "videoComplementURL");
            v159 = objc_claimAutoreleasedReturnValue();
            *(_OWORD *)v277 = v260;
            *(_QWORD *)&v277[16] = v261;
            v258 = *(_OWORD *)buf;
            v259 = *(_QWORD *)&buf[16];
            objc_msgSend(v36, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v133, 0, v159, v277, &v258, 0);
          }
          else
          {
            PLSyncGetLog();
            v159 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v277 = 138412290;
              *(_QWORD *)&v277[4] = v226;
              _os_log_impl(&dword_199541000, v159, OS_LOG_TYPE_ERROR, "Failed to extract Iris properties from %@", v277, 0xCu);
            }
          }

          objc_msgSend(v36, "pathForVideoComplementFile");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          v161 = objc_msgSend(v226, "isEqualToString:", v160);

          if ((v161 & 1) == 0)
          {
            PLSyncGetLog();
            v162 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v277 = 138412290;
              *(_QWORD *)&v277[4] = v226;
              _os_log_impl(&dword_199541000, v162, OS_LOG_TYPE_DEBUG, "Removing sync file at path: %@", v277, 0xCu);
            }

            v257 = 0;
            v163 = objc_msgSend(v241, "removeItemAtPath:error:", v226, &v257);
            v164 = v257;
            if ((v163 & 1) == 0)
            {
              PLSyncGetLog();
              v165 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v277 = 138412546;
                *(_QWORD *)&v277[4] = v226;
                *(_WORD *)&v277[12] = 2112;
                *(_QWORD *)&v277[14] = v164;
                _os_log_impl(&dword_199541000, v165, OS_LOG_TYPE_DEFAULT, "Error removing file at path: %@, %@", v277, 0x16u);
              }

            }
          }
          v157 = v132;

          v121 = v239;
          v77 = v221;
          v158 = v224;
          v124 = v226;
        }
        else
        {
          PLSyncGetLog();
          v156 = objc_claimAutoreleasedReturnValue();
          v77 = v221;
          if (os_log_type_enabled(v156, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v124;
            v157 = v156;
            _os_log_impl(&dword_199541000, v156, OS_LOG_TYPE_ERROR, "Missing video complement file at %@", buf, 0xCu);
          }
          else
          {
            v157 = v156;
          }
          v158 = v236;
          v9 = v242;
        }

        v236 = v158;
        v120 = v227;
        v105 = v220;
      }
      else
      {
        v9 = v242;
        v10 = v116;
        v77 = v221;
      }
      objc_msgSend(v36, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, v264, v120, 0);
      v256 = 0;
      v166 = +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v36, 0, 0, &v256);
      v153 = v256;
      if (!v166)
      {
        PLSyncGetLog();
        v167 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v153;
          _os_log_impl(&dword_199541000, v167, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      PLSyncGetLog();
      v153 = objc_claimAutoreleasedReturnValue();
      v10 = v116;
      if (os_log_type_enabled(v153, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "uuid");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "path");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v154;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v155;
        _os_log_impl(&dword_199541000, v153, OS_LOG_TYPE_ERROR, "Failed to import iTunes sync photo %{public}@, unable to insert asset %{public}@", buf, 0x16u);

      }
      v9 = v242;
      v121 = v239;
      v77 = v221;
    }

    if ((locationa & 1) == 0)
      goto LABEL_147;
    goto LABEL_151;
  }
  v144 = v105;
  v145 = (void *)v102;
  PLSyncGetLog();
  v146 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v144, "path");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v77;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v147;
    *(_WORD *)&buf[22] = 2112;
    v283 = (id *)v236;
    _os_log_impl(&dword_199541000, v146, OS_LOG_TYPE_ERROR, "Unable to move sync photo %@ to %@: %@", buf, 0x20u);

  }
  PLSyncGetLog();
  v148 = objc_claimAutoreleasedReturnValue();
  v9 = v242;
  if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "uuid");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v149;
    _os_log_impl(&dword_199541000, v148, OS_LOG_TYPE_ERROR, "Sync save job failed for photo %{public}@", buf, 0xCu);

  }
LABEL_111:
  v36 = 0;
  v150 = 0;
  v121 = v239;
LABEL_152:

  if ((v150 & 1) == 0)
    goto LABEL_27;
LABEL_153:
  if (v36)
  {
    objc_msgSend(v8, "uuid");
    v168 = (void *)objc_claimAutoreleasedReturnValue();

    if (v168)
    {
      objc_msgSend(v8, "uuid");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setUuid:", v169);

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "creationDate");
    v171 = (void *)objc_claimAutoreleasedReturnValue();

    if (v171)
    {
      objc_msgSend(v8, "creationDate");
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setDateCreated:", v172);

      objc_msgSend(v8, "creationDate");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "setObject:forKey:", v173, *MEMORY[0x1E0C998E8]);

    }
    objc_msgSend(v8, "modificationDate");
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    if (v174)
    {
      objc_msgSend(v8, "modificationDate");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setModificationDate:", v175);

      objc_msgSend(v8, "modificationDate");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "setObject:forKey:", v176, *MEMORY[0x1E0C998D8]);

    }
    if (objc_msgSend(v170, "count"))
    {
      objc_msgSend(v36, "mainFileURL");
      v177 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v177, "setResourceValues:error:", v170, 0);

    }
    objc_msgSend(v8, "location");
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v178, "coordinate");
    v180 = v179;
    objc_msgSend(v36, "longitude");
    if (v180 != v181 || (objc_msgSend(v178, "coordinate"), v183 = v182, objc_msgSend(v36, "latitude"), v183 != v184))
      objc_msgSend(v36, "setLocation:", v178);
    v230 = v178;
    objc_msgSend(v8, "sortToken");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = v185;
    if (v185)
    {
      objc_msgSend(v185, "doubleValue");
      objc_msgSend(v36, "setSortToken:");
    }
    else
    {
      objc_msgSend(v36, "dateCreated");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "timeIntervalSinceReferenceDate");
      objc_msgSend(v36, "setSortToken:");

    }
    locationb = (id *)v170;
    v244 = v10;
    objc_msgSend(v8, "originalFileName");
    v187 = (void *)objc_claimAutoreleasedReturnValue();

    if (v187)
    {
      objc_msgSend(v8, "originalFileName");
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setOriginalFilename:", v188);

    }
    v237 = v8;
    v254 = 0u;
    v255 = 0u;
    v253 = 0u;
    v252 = 0u;
    objc_msgSend(v36, "legacyFaces");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v252, v276, 16);
    if (v190)
    {
      v191 = v190;
      v192 = *(_QWORD *)v253;
      do
      {
        for (i = 0; i != v191; ++i)
        {
          if (*(_QWORD *)v253 != v192)
            objc_enumerationMutation(v189);
          objc_msgSend(*(id *)(*((_QWORD *)&v252 + 1) + 8 * i), "delete");
        }
        v191 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v252, v276, 16);
      }
      while (v191);
    }

    v250[0] = MEMORY[0x1E0C809B0];
    v250[1] = 3221225472;
    v250[2] = __53__PLImageWriter_processSyncSaveJob_library_albumMap___block_invoke;
    v250[3] = &unk_1E36614E8;
    v194 = v36;
    v251 = v194;
    objc_msgSend(v237, "processFacesWithBlock:", v250);
    objc_msgSend(v237, "facesInfo");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = objc_msgSend(v195, "count");

    if (v196)
    {
      v197 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      objc_msgSend(v197, "pathManager");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v198, "iTunesSyncedFaceDataDirectory");
      v199 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v200, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v199, 1, 0, 0);

      objc_msgSend(v194, "uuid");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "stringByAppendingPathComponent:", v201);
      v202 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v202, "stringByAppendingPathExtension:", CFSTR("plist"));
      v203 = (void *)objc_claimAutoreleasedReturnValue();

      v204 = (void *)MEMORY[0x1E0CB38B0];
      objc_msgSend(v237, "facesInfo");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v204, "dataWithPropertyList:format:options:error:", v205, 100, 0, 0);
      v206 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v206, "writeToFile:options:error:", v203, 1073741825, 0);
    }
    v248 = 0u;
    v249 = 0u;
    v246 = 0u;
    v247 = 0u;
    objc_msgSend(v237, "albumURIs");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v246, v275, 16);
    v10 = v244;
    if (!v208)
    {
LABEL_197:

      v9 = v242;
      objc_msgSend(v242, "syncProgressAlbum");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v219, "reducePendingItemsCountBy:", 1);

      objc_msgSend(v194, "persistMetadataToFilesystem");
      v8 = v237;
      goto LABEL_28;
    }
    v209 = v208;
    v210 = *(_QWORD *)v247;
    while (2)
    {
      v211 = 0;
LABEL_182:
      if (*(_QWORD *)v247 != v210)
        objc_enumerationMutation(v207);
      v212 = *(_QWORD *)(*((_QWORD *)&v246 + 1) + 8 * v211);
      objc_msgSend(v10, "objectForKey:", v212);
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v213)
      {
        objc_msgSend(v242, "managedObjectContext");
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v214, "persistentStoreCoordinator");
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "managedObjectIDForURIRepresentation:", v212);
        v216 = (void *)objc_claimAutoreleasedReturnValue();

        if (v216)
        {
          v245 = 0;
          objc_msgSend(v214, "existingObjectWithID:error:", v216, &v245);
          v213 = (void *)objc_claimAutoreleasedReturnValue();
          v217 = v245;
          if (v213)
          {
            objc_msgSend(v244, "setObject:forKey:", v213, v212);
            goto LABEL_194;
          }
          PLSyncGetLog();
          v218 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v218, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v212;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v217;
            _os_log_impl(&dword_199541000, v218, OS_LOG_TYPE_ERROR, "Unable to fetch album %@: %@", buf, 0x16u);
          }

        }
        else
        {
          PLSyncGetLog();
          v217 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v217, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v212;
            _os_log_impl(&dword_199541000, v217, OS_LOG_TYPE_ERROR, "Unable to create NSManagedObjectID from %@", buf, 0xCu);
          }
        }
        v213 = 0;
LABEL_194:

        v10 = v244;
      }
      objc_msgSend(v213, "addAssetUsingiTunesAlbumOrder:", v194);
      objc_msgSend(v213, "reducePendingItemsCountBy:", 1);

      if (v209 == ++v211)
      {
        v209 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v246, v275, 16);
        if (!v209)
          goto LABEL_197;
        continue;
      }
      goto LABEL_182;
    }
  }
LABEL_28:

}

- (void)cleanupFilesInLibrary:(id)a3 afteriTunesSyncBeforeDate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v29;
  char v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  char v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  id v68;
  id v69;
  void *v71;
  id obj;
  id v73;
  id v74;
  void *v75;
  NSObject *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  NSObject *v90;
  NSObject *v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[4];
  id v98;
  id v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint8_t v107[128];
  uint8_t buf[4];
  NSObject *v109;
  __int16 v110;
  NSObject *v111;
  __int16 v112;
  NSObject *v113;
  _BYTE v114[128];
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v76 = a4;
  v71 = v5;
  objc_msgSend(v5, "globalValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v6, "didImportFileSystemAssets");

  if ((_DWORD)v5)
  {
    v7 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v10);

    objc_msgSend(v9, "setFetchLimit:", 1);
    v101 = 0;
    v102 = &v101;
    v103 = 0x2020000000;
    v104 = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v71, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __65__PLImageWriter_cleanupFilesInLibrary_afteriTunesSyncBeforeDate___block_invoke;
    v97[3] = &unk_1E3676EA0;
    v100 = &v101;
    v98 = v11;
    v68 = v9;
    v69 = v98;
    v99 = v68;
    objc_msgSend(v98, "performBlockAndWait:", v97);
    PLSyncGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v109 = v76;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Cleaning up iTunes sync thumb files (before date %{public}@)", buf, 0xCu);
    }

    v77 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    objc_msgSend(WeakRetained, "pathManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iTunesPhotosDirectory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("Thumbs"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v77, "contentsOfDirectoryAtPath:error:", v75, 0);
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
    if (v16)
    {
      v73 = *(id *)v94;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(id *)v94 != v73)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v75, "stringByAppendingPathComponent:", v18);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v76)
          {
            v24 = 0;
            goto LABEL_25;
          }
          -[NSObject stringByAppendingString:](v20, "stringByAppendingString:", CFSTR(".test"));
          v22 = objc_claimAutoreleasedReturnValue();
          v92 = 0;
          v23 = objc_msgSend(v77, "moveItemAtPath:toPath:error:", v21, v22, &v92);
          v24 = v92;
          if (!v23)
          {
            PLSyncGetLog();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v109 = v21;
              v110 = 2112;
              v111 = v22;
              v112 = 2112;
              v113 = v24;
              _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Error moving file at path: %@ to %@, %@", buf, 0x20u);
            }

            goto LABEL_32;
          }
          objc_msgSend(v77, "attributesOfItemAtPath:error:", v22, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25)
          {
            objc_msgSend(v25, "fileModificationDate");
            v27 = objc_claimAutoreleasedReturnValue();
            -[NSObject earlierDate:](v27, "earlierDate:", v76);
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = v28 == v27;

            if (v29)
            {
              PLSyncGetLog();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v109 = v21;
                v110 = 2112;
                v111 = v27;
                v112 = 2112;
                v113 = v76;
                _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEBUG, "File: %@ date: %@ was earlier than date: %@", buf, 0x20u);
              }
            }
            else
            {
              v91 = v24;
              v30 = objc_msgSend(v77, "moveItemAtPath:toPath:error:", v22, v21, &v91);
              v31 = v91;

              if ((v30 & 1) != 0)
              {

LABEL_31:
                v24 = v31;
                goto LABEL_32;
              }
              PLSyncGetLog();
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v109 = v22;
                v110 = 2112;
                v111 = v21;
                v112 = 2112;
                v113 = v31;
                _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Error moving back test file at path: %@ to %@, %@", buf, 0x20u);
              }
              v24 = v31;
            }

            v21 = v22;
LABEL_25:
            PLSyncGetLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v109 = v21;
              _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEBUG, "Removing sync file at path: %@", buf, 0xCu);
            }

            v90 = v24;
            v35 = objc_msgSend(v77, "removeItemAtPath:error:", v21, &v90);
            v31 = v90;

            if ((v35 & 1) != 0)
            {
              v24 = v31;
              goto LABEL_33;
            }
            PLSyncGetLog();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v109 = v21;
              v110 = 2112;
              v111 = v31;
              _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Error removing file at path: %@, %@", buf, 0x16u);
            }
            goto LABEL_31;
          }
LABEL_32:

LABEL_33:
          objc_autoreleasePoolPop(v19);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v114, 16);
      }
      while (v16);
    }

    if (!v76 && !v102[3])
    {
      v36 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      objc_msgSend(v36, "pathManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      PLSyncGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "There are no sync'd assets left; cleaning up filesystem",
          buf,
          2u);
      }

      objc_msgSend(v37, "iTunesSyncedAssetsDirectory");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "contentsOfDirectoryAtPath:error:", v39, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v74 = v40;
      v41 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v86, v107, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v87;
        do
        {
          for (j = 0; j != v41; ++j)
          {
            if (*(_QWORD *)v87 != v42)
              objc_enumerationMutation(v74);
            v44 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j);
            objc_msgSend(v37, "iTunesSyncedAssetsDirectory");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "stringByAppendingPathComponent:", v44);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "removeItemAtPath:error:", v46, 0);

          }
          v41 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v86, v107, 16);
        }
        while (v41);
      }

      objc_msgSend(v37, "iTunesSyncedAssetMetadataThumbnailsDirectory");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "contentsOfDirectoryAtPath:error:", v47, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v49 = v48;
      v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v82, v106, 16);
      if (v50)
      {
        v51 = *(_QWORD *)v83;
        do
        {
          for (k = 0; k != v50; ++k)
          {
            if (*(_QWORD *)v83 != v51)
              objc_enumerationMutation(v49);
            v53 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * k);
            objc_msgSend(v37, "iTunesSyncedAssetMetadataThumbnailsDirectory");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringByAppendingPathComponent:", v53);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "removeItemAtPath:error:", v55, 0);

          }
          v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v82, v106, 16);
        }
        while (v50);
      }

      objc_msgSend(v37, "iTunesSyncedAssetSmallThumbnailsDirectory");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "contentsOfDirectoryAtPath:error:", v56, 0);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v58 = v57;
      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v105, 16);
      if (v59)
      {
        v60 = *(_QWORD *)v79;
        do
        {
          for (m = 0; m != v59; ++m)
          {
            if (*(_QWORD *)v79 != v60)
              objc_enumerationMutation(v58);
            v62 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * m);
            objc_msgSend(v37, "iTunesSyncedAssetSmallThumbnailsDirectory");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "stringByAppendingPathComponent:", v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            NSLog(CFSTR("\t %@"), v64);

            objc_msgSend(v37, "iTunesSyncedAssetSmallThumbnailsDirectory");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "stringByAppendingPathComponent:", v62);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "removeItemAtPath:error:", v66, 0);

          }
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v78, v105, 16);
        }
        while (v59);
      }

      -[PLImageWriter _resetSyncedAssetsDCIMDirectory](self, "_resetSyncedAssetsDCIMDirectory");
    }
    PLSyncGetLog();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v67, OS_LOG_TYPE_DEFAULT, "Cleaning up thumb files - finished", buf, 2u);
    }

    _Block_object_dispose(&v101, 8);
  }

}

- (void)_processSyncClientSaveJobsJob:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  PLImageWriter *v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C99E98];
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "pathManager");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "iTunesSyncedAssetsDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  LOBYTE(v10) = objc_msgSend(v12, "getResourceValue:forKey:error:", &v34, *MEMORY[0x1E0C99968], 0);
  v13 = v34;
  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    v15 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v33);
    v16 = v33;

    if ((v15 & 1) == 0)
    {
      PLSyncGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v16;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to create dir: %{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("SyncClientJobsData"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PLSyncGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v20;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Processing %d sync save jobs", buf, 8u);
  }

  v21 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processSyncClientSaveJobsJob:completion:]");
  -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v6);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __58__PLImageWriter__processSyncClientSaveJobsJob_completion___block_invoke;
  v29[3] = &unk_1E3677530;
  v30 = v18;
  v31 = self;
  v32 = v21;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __58__PLImageWriter__processSyncClientSaveJobsJob_completion___block_invoke_2;
  v26[3] = &unk_1E3676290;
  v27 = v6;
  v28 = v7;
  v26[4] = self;
  v22 = v6;
  v23 = v7;
  v24 = v21;
  v25 = v18;
  objc_msgSend(v24, "performTransaction:completionHandler:", v29, v26);

}

- (void)_handleAvalancheCrashRecovery:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handleAvalancheCrashRecovery:]");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__PLImageWriter__handleAvalancheCrashRecovery___block_invoke;
    v7[3] = &unk_1E3677C18;
    v8 = v6;
    v9 = v4;
    v5 = v4;
    objc_msgSend(v5, "performTransactionAndWait:", v7);

  }
}

- (void)_handleCameraMetadataCrashRecovery:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLImageWriter *v9;
  id v10;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handleCameraMetadataCrashRecovery:]");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__PLImageWriter__handleCameraMetadataCrashRecovery___block_invoke;
    v7[3] = &unk_1E3677530;
    v8 = v6;
    v9 = self;
    v10 = v4;
    v5 = v4;
    objc_msgSend(v5, "performTransactionAndWait:", v7);

  }
}

- (void)_handlePhotoIrisCrashRecoveryForVideos:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PLImageWriter *v13;
  SEL v14;
  _QWORD v15[4];
  id v16;
  id v17;
  PLImageWriter *v18;
  id v19;
  SEL v20;

  v10 = a3;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handlePhotoIrisCrashRecoveryForVideos:]");
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__PLImageWriter__handlePhotoIrisCrashRecoveryForVideos___block_invoke;
    v15[3] = &unk_1E36710D8;
    v16 = v10;
    v8 = v6;
    v17 = v8;
    v18 = self;
    v20 = a2;
    v9 = v5;
    v19 = v9;
    objc_msgSend(v8, "performBlockAndWait:", v15);
    if (objc_msgSend(v9, "count"))
    {
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __56__PLImageWriter__handlePhotoIrisCrashRecoveryForVideos___block_invoke_239;
      v11[3] = &unk_1E3677C40;
      v13 = self;
      v14 = a2;
      v12 = v9;
      objc_msgSend(v8, "performBlockAndWait:", v11);

    }
  }

}

- (void)_handleCameraAdjustments:(id)a3 fullsizeRenders:(id)a4 largeThumbnails:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  char v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  char v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id obj;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  PLImageWriter *v65;
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  id v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend((id)objc_opt_class(), "_pathsByAssetUUIDFromIncomingCrashRecoveryPaths:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v9;
  objc_msgSend((id)objc_opt_class(), "_pathsByAssetUUIDFromIncomingCrashRecoveryPaths:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_pathsByAssetUUIDFromIncomingCrashRecoveryPaths:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v8;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v10;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]");
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __74__PLImageWriter__handleCameraAdjustments_fullsizeRenders_largeThumbnails___block_invoke;
  v58[3] = &unk_1E366EA20;
  v43 = v11;
  v59 = v43;
  v42 = v12;
  v60 = v42;
  v41 = v13;
  v61 = v41;
  v39 = v15;
  v62 = v39;
  v17 = v14;
  v63 = v17;
  v64 = v16;
  v65 = self;
  v40 = v64;
  objc_msgSend(v64, "performTransactionAndWait:", v58);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v17;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v55;
    do
    {
      v23 = 0;
      v24 = v21;
      do
      {
        if (*(_QWORD *)v55 != v22)
          objc_enumerationMutation(obj);
        v25 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v23);
        PLAssetImportGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v68 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]";
          v69 = 2114;
          v70 = v25;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s Removing orphaned adjustment file %{public}@", buf, 0x16u);
        }

        v53 = v24;
        v27 = objc_msgSend(v18, "removeItemAtPath:error:", v25, &v53, v39);
        v21 = v53;

        if ((v27 & 1) == 0)
        {
          PLAssetImportGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v68 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]";
            v69 = 2114;
            v70 = v25;
            v71 = 2114;
            v72 = v21;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "%{public}s Error removing orphaned adjustment file %{public}@: %{public}@", buf, 0x20u);
          }

        }
        ++v23;
        v24 = v21;
      }
      while (v20 != v23);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v29 = v39;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v50;
    do
    {
      v33 = 0;
      v34 = v21;
      do
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(v29);
        v35 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v33);
        PLAssetImportGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          v68 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]";
          v69 = 2114;
          v70 = v35;
          _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s Removing orphaned large thumbnail file %{public}@", buf, 0x16u);
        }

        v48 = v34;
        v37 = objc_msgSend(v18, "removeItemAtPath:error:", v35, &v48);
        v21 = v48;

        if ((v37 & 1) == 0)
        {
          PLAssetImportGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446722;
            v68 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]";
            v69 = 2114;
            v70 = v35;
            v71 = 2114;
            v72 = v21;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "%{public}s Error removing orphaned large thumbnail file file %{public}@: %{public}@", buf, 0x20u);
          }

        }
        ++v33;
        v34 = v21;
      }
      while (v31 != v33);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v66, 16);
    }
    while (v31);
  }

}

- (BOOL)_writeOutCameraMetadata:(id)a3 destinationURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v14;
  id v15;

  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a3, "cameraMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  v14 = v11;
  LOBYTE(v9) = objc_msgSend(v10, "writeToURL:options:error:", v7, 1, &v14);
  v12 = v14;

  if ((v9 & 1) == 0)
  {

    v7 = 0;
  }
  if (a5 && v12)
    *a5 = objc_retainAutorelease(v12);

  return v12 == 0;
}

- (void)_handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v4 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:]");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__PLImageWriter__handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles___block_invoke;
    v7[3] = &unk_1E3677C18;
    v8 = v6;
    v9 = v4;
    v5 = v4;
    objc_msgSend(v5, "performTransactionAndWait:", v7);

  }
}

- (BOOL)_enterAtomicCrashRecoveryJobProcessing
{
  atomic_flag *p_isCrashRecoveryJobInProgress;
  unsigned __int8 v3;

  p_isCrashRecoveryJobInProgress = &self->_isCrashRecoveryJobInProgress;
  do
    v3 = __ldaxr((unsigned __int8 *)p_isCrashRecoveryJobInProgress);
  while (__stlxr(1u, (unsigned __int8 *)p_isCrashRecoveryJobInProgress));
  return (v3 & 1) == 0;
}

- (void)_exitAtomicCrashRecoveryJobProcessing
{
  atomic_store(0, (unsigned __int8 *)&self->_isCrashRecoveryJobInProgress);
}

- (void)_processCrashRecoveryJob:(id)a3 completion:(id)a4
{
  id WeakRetained;
  _BOOL4 v8;
  unsigned __int8 v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  int v47;
  NSObject *v48;
  void *v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSObject *v56;
  int v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  char v62;
  id v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  id v72;
  void *v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  char v79;
  id v80;
  NSObject *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  char v85;
  uint64_t v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  _BOOL4 v103;
  void *v104;
  int v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  id *location;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void (**v128)(void);
  void *v129;
  id v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  int v139;
  PLImageWriter *v140;
  id obj;
  uint64_t v142;
  void *v143;
  void *v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _QWORD v150[4];
  id v151;
  id v152;
  PLImageWriter *v153;
  id v154;
  id v155;
  id v156;
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  id v162;
  void (**v163)(void);
  id v164;
  id v165;
  int v166;
  char v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t (*v174)(uint64_t);
  void *v175;
  void *v176;
  PLImageWriter *v177;
  SEL v178;
  _BYTE v179[128];
  uint8_t v180[128];
  uint8_t buf[4];
  uint64_t v182;
  __int16 v183;
  id v184;
  __int16 v185;
  id v186;
  __int16 v187;
  void *v188;
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  v130 = a3;
  v128 = (void (**)(void))a4;
  v140 = self;
  location = (id *)&self->_libraryServicesManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "crashRecoverySupport");
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = +[PLPhotoLibrary areOpportunisticTasksDisabled](PLPhotoLibrary, "areOpportunisticTasksDisabled");
  v9 = objc_msgSend(v127, "isSafeToRecoverAfterCrash");
  v10 = -[PLImageWriter _hasNonCrashRecoveryJobsEnqueued](self, "_hasNonCrashRecoveryJobsEnqueued");
  if (((v8 | v9 ^ 1 | v10) & 1) != 0
    || !-[PLImageWriter _enterAtomicCrashRecoveryJobProcessing](v140, "_enterAtomicCrashRecoveryJobProcessing"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v8)
    {
      objc_msgSend(v15, "addObject:", CFSTR("opportunistic tasks are disabled"));
      if ((v9 & 1) != 0)
      {
LABEL_11:
        if (!v10)
          goto LABEL_12;
        goto LABEL_19;
      }
    }
    else if ((v9 & 1) != 0)
    {
      goto LABEL_11;
    }
    objc_msgSend(v16, "addObject:", CFSTR("open camera transaction"));
    if (!v10)
    {
LABEL_12:
      if (((v8 | v9 ^ 1 | v10) & 1) != 0)
      {
LABEL_14:
        PLAssetImportGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v130, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB0]);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v182 = (uint64_t)v18;
          v183 = 2114;
          v184 = v19;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "##### RECOVER: delaying crash recovery job (%{public}@) because: %{public}@", buf, 0x16u);

        }
        v20 = (void *)objc_msgSend(v130, "mutableCopy");
        dispatch_time(0, 3000000000);
        v172 = MEMORY[0x1E0C809B0];
        v173 = 3221225472;
        v174 = __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke;
        v175 = &unk_1E3677C40;
        v178 = a2;
        v176 = v20;
        v177 = v140;
        v21 = v20;
        pl_dispatch_after();
        v128[2]();

        goto LABEL_136;
      }
LABEL_13:
      objc_msgSend(v16, "addObject:", CFSTR("crash recovery job already in progress"));
      goto LABEL_14;
    }
LABEL_19:
    objc_msgSend(v16, "addObject:", CFSTR("other jobs are still in progress"));
    if (((v8 | v9 ^ 1 | v10) & 1) != 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  PLAssetImportGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "##### RECOVER: entered crash recovery job processing", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v130, "objectForKey:", CFSTR("CrashRecoveryFilenamesKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v130, "objectForKey:", CFSTR("CrashRecoveryPhotoStreamFilenamesKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "handleFailureInMethod:object:file:lineNumber:description:", a2, v140, CFSTR("PLImageWriter.m"), 2865, CFSTR("Cannot recover both camera and photostreams in the same job"));

    }
    objc_msgSend(MEMORY[0x1E0D73148], "incomingDirectoryPath");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v143 = 0;
  }
  PLAssetImportGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v130, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("CrashRecoveryJobCreationDateKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v182 = (uint64_t)v23;
    v183 = 2114;
    v184 = v24;
    v185 = 2114;
    v186 = v143;
    v187 = 2114;
    v188 = v12;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Initiating recovery job (#%{public}@) of incoming files (requested at %{public}@) from %{public}@: %{public}@", buf, 0x2Au);

  }
  v25 = objc_loadWeakRetained(location);
  objc_msgSend(v25, "pathManager");
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "privateDirectoryWithSubType:createIfNeeded:error:", 8, 1, 0);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  obj = v12;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, v180, 16);
  if (v26)
  {
    v27 = v26;
    v142 = *(_QWORD *)v169;
    v138 = *MEMORY[0x1E0D74A78];
    v133 = *MEMORY[0x1E0D74A88];
    v131 = *MEMORY[0x1E0D74A70];
    v126 = *MEMORY[0x1E0D74A60];
    v124 = *MEMORY[0x1E0D74A58];
    v120 = *MEMORY[0x1E0D74A68];
    v100 = *MEMORY[0x1E0D73F58];
    v101 = *MEMORY[0x1E0D74010];
    v99 = *MEMORY[0x1E0D73F70];
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v169 != v142)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * v28);
        v30 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v143, "stringByAppendingPathComponent:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "pathExtension");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v167 = 0;
        v33 = objc_msgSend(v144, "fileExistsAtPath:isDirectory:", v31, &v167);
        if (v167)
          v34 = 0;
        else
          v34 = v33;
        if ((v34 & 1) != 0)
        {
          if (+[PLPhotoLibrary isVideoFileExtension:](PLPhotoLibrary, "isVideoFileExtension:", v32))
          {
            PFVideoComplementMetadataForVideoAtPath();
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "pairingIdentifier");
            v36 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v36 = 0;
          }
          objc_msgSend(v29, "stringByDeletingPathExtension");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "pathExtension");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = objc_msgSend(v38, "isEqualToString:", v138);
          if (v39)
          {
            objc_msgSend((id)objc_opt_class(), "_assetUUIDFromIncomingFilename:", v29);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend((id)objc_opt_class(), "_hasPrimaryAssetAndAdjustmentsFilesWithType:inIncomingFilenames:forAssetUUID:", 0, obj, v40))
            {
              objc_msgSend(v135, "addObject:", v31);
              goto LABEL_41;
            }

          }
          v41 = v137;
          if (v36)
            goto LABEL_50;
          v42 = objc_msgSend(v32, "isEqualToString:", CFSTR("irs"));
          v41 = v136;
          if ((v42 & 1) != 0)
            goto LABEL_50;
          v43 = objc_msgSend(v32, "isEqualToString:", v133);
          v41 = v134;
          if ((v43 & 1) != 0)
            goto LABEL_50;
          v44 = objc_msgSend(v32, "isEqualToString:", v131);
          v41 = v132;
          if ((v44 & 1) != 0
            || (v45 = objc_msgSend(v32, "isEqualToString:", v126), v41 = v129, (v45 & 1) != 0)
            || (v46 = objc_msgSend(v32, "isEqualToString:", v124), v41 = v125, (v46 & 1) != 0)
            || (v47 = objc_msgSend(v32, "isEqualToString:", v120), v41 = v122, v47))
          {
LABEL_50:
            objc_msgSend(v41, "addObject:", v31);
            goto LABEL_51;
          }
          if ((objc_msgSend(v32, "isEqualToString:", CFSTR("plist")) & 1) != 0)
            goto LABEL_51;
          objc_msgSend((id)objc_opt_class(), "_assetUUIDFromIncomingFilename:", v29);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v31, 0);
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLManagedAsset uniformTypeIdentifierFromPathExtension:assetType:](PLManagedAsset, "uniformTypeIdentifierFromPathExtension:assetType:", v32, 3);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = +[PLManagedAsset assetTypeFromUniformTypeIdentifier:](PLManagedAsset, "assetTypeFromUniformTypeIdentifier:", v112);

            if (v105 == 1)
              objc_msgSend(MEMORY[0x1E0C8B0D0], "consolidateMovieFragmentsInFile:error:", v111, 0);
            objc_msgSend(MEMORY[0x1E0D73200], "persistedAttributesForFileAtURL:", v111);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "UUIDStringForKey:", v101);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            if (v106)
            {
              v103 = 0;
            }
            else
            {
              if (v39)
              {
                objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "UUIDString");
                v107 = objc_claimAutoreleasedReturnValue();

                v50 = (id)v107;
              }
              else
              {
                v50 = v40;
              }
              v106 = v50;
              v103 = v50 != 0;
            }
            PLAssetImportGetLog();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v182 = (uint64_t)v106;
              v183 = 2114;
              v184 = v29;
              _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEFAULT, "##### RECOVER: assetUUID %{public}@ (%{public}@)", buf, 0x16u);
            }

            objc_msgSend(v102, "stringForKey:", v100);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            PLAssetImportGetLog();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v182 = (uint64_t)v113;
              _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEFAULT, "##### RECOVER: destinationPath EA %{public}@", buf, 0xCu);
            }

            if (v113)
            {
              objc_msgSend(v109, "setObject:forKeyedSubscript:", v113, v40);
              goto LABEL_88;
            }
            -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:](v140, "cameraAssetPathForNewAssetWithExtension:assetUUID:", v32, v106);
            v53 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setObject:forKeyedSubscript:", v53, v40);
            if (+[PLPhotoLibrary isImageFileExtension:](PLPhotoLibrary, "isImageFileExtension:", v32))
            {
              v94 = (id)v53;
              v96 = objc_alloc(MEMORY[0x1E0D75140]);
              v114 = objc_loadWeakRetained(location);
              objc_msgSend(v114, "libraryBundle");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "timeZoneLookup");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = (void *)objc_msgSend(v96, "initWithImageURL:contentType:timeZoneLookup:", v111, 0, v54);

              if (objc_msgSend(v97, "isDeferredPhotoProxy")
                && (objc_msgSend(v97, "deferredPhotoProcessingIdentifier"),
                    (v91 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v94, 0);
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                +[PLPhotoLibrary deferredPhotoPreviewDestinationURLForPrimaryAssetURL:](PLPhotoLibrary, "deferredPhotoPreviewDestinationURLForPrimaryAssetURL:", v115);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "path");
                v86 = objc_claimAutoreleasedReturnValue();

                PLAssetImportGetLog();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v182 = v86;
                  _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_DEFAULT, "##### RECOVER: assigning deferred path %{public}@", buf, 0xCu);
                }

                v57 = 0;
                v94 = (id)v86;
              }
              else
              {
                v91 = 0;
                v57 = 1;
              }
              v166 = -1;
              objc_msgSend(v102, "getInt32:forKey:", &v166, v99);
              if ((v57 & objc_msgSend((id)objc_opt_class(), "semanticEnhanceSceneIsValid:", v166)) == 1)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v94, 0);
                v87 = (void *)objc_claimAutoreleasedReturnValue();
                +[PLImageWriter semanticEnhancePreviewDestinationURLForPrimaryAssetURL:](PLImageWriter, "semanticEnhancePreviewDestinationURLForPrimaryAssetURL:", v87);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v59, "path");
                v116 = objc_claimAutoreleasedReturnValue();

                PLAssetImportGetLog();
                v60 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v182 = v116;
                  _os_log_impl(&dword_199541000, v60, OS_LOG_TYPE_DEFAULT, "##### RECOVER: assigning SemDev deferred path %{public}@", buf, 0xCu);
                }

              }
              else
              {
                v116 = (uint64_t)v94;
              }

              v58 = (void *)v116;
            }
            else
            {
              v58 = (void *)v53;
            }
            if (v58)
            {
              v113 = v58;
              objc_msgSend(MEMORY[0x1E0D73200], "persistString:forKey:fileURL:", v58, v100, v111);
LABEL_88:
              if (v103)
                objc_msgSend(MEMORY[0x1E0D73200], "persistUUIDString:forKey:fileURL:", v106, v101, v111);
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v113, 0);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              PLAssetImportGetLog();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v182 = (uint64_t)v31;
                v183 = 2114;
                v184 = v113;
                _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_DEFAULT, "##### RECOVER: source %{public}@ -> destination %{public}@", buf, 0x16u);
              }

              if ((objc_msgSend(v144, "fileExistsAtPath:", v113) & 1) != 0)
              {
LABEL_97:
                objc_msgSend(v31, "stringByDeletingPathExtension");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v65, "stringByAppendingPathExtension:", v131);
                v63 = (id)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v144, "fileExistsAtPath:", v63))
                {
                  objc_msgSend(v31, "lastPathComponent");
                  v98 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v108, "stringByAppendingPathComponent:", v98);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v63 && v66)
                  {
                    v95 = v66;
                    v88 = (void *)MEMORY[0x1E0D73208];
                    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v63, 0);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v95, 0);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v164 = 0;
                    v85 = objc_msgSend(v88, "copyItemAtURL:toURL:error:", v92, v67, &v164);
                    v89 = v164;

                    if ((v85 & 1) == 0 && (objc_msgSend(v144, "fileExistsAtPath:", v95) & 1) == 0)
                    {
                      PLAssetImportGetLog();
                      v93 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(v89, "localizedDescription");
                        v68 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543874;
                        v182 = (uint64_t)v63;
                        v183 = 2114;
                        v184 = v95;
                        v185 = 2114;
                        v186 = v68;
                        _os_log_impl(&dword_199541000, v93, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@: %{public}@", buf, 0x20u);

                      }
                    }

                    v66 = v95;
                  }

                }
                objc_msgSend(v118, "setObject:forKey:", v111, v104);
                objc_msgSend(v121, "addObject:", v104);
              }
              else
              {
                v165 = 0;
                v62 = objc_msgSend(MEMORY[0x1E0D73208], "copyItemAtURL:toURL:error:", v111, v104, &v165);
                v63 = v165;
                if ((v62 & 1) != 0)
                {
                  PLAssetImportGetLog();
                  v64 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543618;
                    v182 = (uint64_t)v31;
                    v183 = 2114;
                    v184 = v113;
                    _os_log_impl(&dword_199541000, v64, OS_LOG_TYPE_DEBUG, "##### RECOVER: copied %{public}@ to %{public}@", buf, 0x16u);
                  }

                  goto LABEL_97;
                }
                PLAssetImportGetLog();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v182 = (uint64_t)v31;
                  v183 = 2114;
                  v184 = v113;
                  v185 = 2114;
                  v186 = v63;
                  _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_ERROR, "Failed to copy %{public}@ to %{public}@: %{public}@", buf, 0x20u);
                }

              }
            }
            else
            {
              PLAssetImportGetLog();
              v70 = objc_claimAutoreleasedReturnValue();
              v113 = v70;
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v182 = (uint64_t)v29;
                _os_log_impl(&dword_199541000, v70, OS_LOG_TYPE_DEFAULT, "##### RECOVER: skipping %{public}@, missing destinationPath", buf, 0xCu);
              }
            }

          }
          else
          {
            PLAssetImportGetLog();
            v48 = objc_claimAutoreleasedReturnValue();
            v111 = v48;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v182 = (uint64_t)v31;
              _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Ignoring malformed incoming filename with path %{public}@", buf, 0xCu);
            }
          }

LABEL_41:
LABEL_51:

          goto LABEL_52;
        }
        PLAssetImportGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v182 = (uint64_t)v31;
          _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Skipping missing file %{public}@", buf, 0xCu);
        }
LABEL_52:

        objc_autoreleasePoolPop(v30);
        ++v28;
      }
      while (v27 != v28);
      v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v168, v180, 16);
      v27 = v71;
    }
    while (v71);
  }

  if (objc_msgSend(v121, "count") || objc_msgSend(v119, "count"))
  {
    -[PLImageWriter _incrementJobCount:](v140, "_incrementJobCount:", v130);
    v72 = objc_loadWeakRetained(location);
    objc_msgSend(v72, "modelMigrator");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v150[0] = MEMORY[0x1E0C809B0];
    v150[1] = 3221225472;
    v150[2] = __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke_269;
    v150[3] = &unk_1E3661538;
    v151 = v118;
    v152 = v144;
    v153 = v140;
    v154 = v110;
    v155 = v125;
    v156 = v136;
    v157 = v137;
    v158 = v129;
    v159 = v135;
    v160 = v134;
    v161 = v122;
    v163 = v128;
    v162 = v130;
    objc_msgSend(v73, "importAfterCrash:dictionariesByPhotoStreamID:completionBlock:", v121, v119, v150);

    v139 = 0;
  }
  else
  {
    -[PLImageWriter _handleAvalancheCrashRecovery:](v140, "_handleAvalancheCrashRecovery:", v125);
    -[PLImageWriter _handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:](v140, "_handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:", v136);
    -[PLImageWriter _handlePhotoIrisCrashRecoveryForVideos:](v140, "_handlePhotoIrisCrashRecoveryForVideos:", v137);
    -[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:](v140, "_handleCameraAdjustments:fullsizeRenders:largeThumbnails:", v129, v135, v134);
    -[PLImageWriter _handleCameraMetadataCrashRecovery:](v140, "_handleCameraMetadataCrashRecovery:", v122);
    v139 = 1;
  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v74 = v132;
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v146, v179, 16);
  if (v75)
  {
    v76 = *(_QWORD *)v147;
    do
    {
      for (i = 0; i != v75; ++i)
      {
        if (*(_QWORD *)v147 != v76)
          objc_enumerationMutation(v74);
        v78 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
        v145 = 0;
        v79 = objc_msgSend(v144, "removeItemAtPath:error:", v78, &v145);
        v80 = v145;
        if ((v79 & 1) == 0)
        {
          PLAssetImportGetLog();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v80, "localizedDescription");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v182 = (uint64_t)v78;
            v183 = 2114;
            v184 = v82;
            _os_log_impl(&dword_199541000, v81, OS_LOG_TYPE_ERROR, "Failed to unlink file at path %{public}@: %{public}@", buf, 0x16u);

          }
        }

      }
      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v146, v179, 16);
    }
    while (v75);
  }

  if (v139)
    v128[2]();

  -[PLImageWriter _exitAtomicCrashRecoveryJobProcessing](v140, "_exitAtomicCrashRecoveryJobProcessing");
  PLAssetImportGetLog();
  v83 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v83, OS_LOG_TYPE_DEFAULT, "##### RECOVER: exited crash recovery job processing", buf, 2u);
  }

LABEL_136:
}

- (void)_processDaemonJob:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  PLLibraryServicesManager **p_libraryServicesManager;
  uint64_t i;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void (**v22)(_QWORD);
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("kPLImageWriterDaemonJobEventKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    +[PLDaemonJob runDaemonSideWithXPCEvent:libraryServicesManager:](PLDaemonJob, "runDaemonSideWithXPCEvent:libraryServicesManager:", v8, WeakRetained);

  }
  else
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("kPLImageWriterDaemonJobRecoveredEventsKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v12 = v10;
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v13)
      {
        v14 = v13;
        v21 = v11;
        v22 = v7;
        v23 = v6;
        v15 = *(_QWORD *)v25;
        p_libraryServicesManager = &self->_libraryServicesManager;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(v12);
            v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            v19 = (void *)MEMORY[0x19AEC1554]();
            v20 = objc_loadWeakRetained((id *)p_libraryServicesManager);
            +[PLDaemonJob runDaemonSideWithXPCEvent:libraryServicesManager:](PLDaemonJob, "runDaemonSideWithXPCEvent:libraryServicesManager:", v18, v20);

            objc_autoreleasePoolPop(v19);
          }
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        }
        while (v14);
        v7 = v22;
        v6 = v23;
        v11 = v21;
      }
    }
    else
    {
      PLAssetImportGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v6;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "##### missing event(s) for PLDaemonJob %@", buf, 0xCu);
      }
    }

  }
  v7[2](v7);

}

- (void)_processXPCDaemonJob:(id)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  id v6;

  v5 = (void (**)(_QWORD))a4;
  objc_msgSend(a3, "objectForKey:", CFSTR("kPLImageWriterDaemonJobEventKey"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "runDaemonSide");
  v5[2](v5);

}

- (BOOL)_transferVideoFromIncomingPath:(id)a3 toDestinationPath:(id)a4 shouldRemoveIncoming:(BOOL *)a5 error:(id *)a6
{
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  BOOL v13;
  char v14;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint32_t v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  NSObject *v42;
  __int16 v43;
  NSObject *v44;
  __int16 v45;
  NSObject *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  if (!v9 || !v10)
  {
LABEL_5:
    if (!a5)
      goto LABEL_7;
    goto LABEL_6;
  }
  if ((-[NSObject isEqualToString:](v9, "isEqualToString:", v10) & 1) != 0)
  {
    v13 = 0;
    v14 = 0;
    v12 = 0;
    goto LABEL_5;
  }
  v16 = (void *)MEMORY[0x1E0D73200];
  v17 = *MEMORY[0x1E0D73F58];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "persistString:forKey:fileURL:", v11, v17, v18);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject stringByDeletingLastPathComponent](v11, "stringByDeletingLastPathComponent");
  v20 = objc_claimAutoreleasedReturnValue();
  v40 = 0;
  LODWORD(v18) = objc_msgSend(v19, "createDirectoryIfNeededAtPath:error:", v20, &v40);
  v21 = v40;
  if ((_DWORD)v18)
  {
    v47 = *MEMORY[0x1E0CB2AD8];
    v48[0] = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v23 = objc_msgSend(v19, "setAttributes:ofItemAtPath:error:", v22, v9, &v39);
    v24 = v39;

    if ((v23 & 1) == 0)
    {
      PLAssetImportGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v42 = v9;
        v43 = 2112;
        v44 = v24;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
      }

    }
    v36 = v20;
    v37 = v19;
    PLAssetImportGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v11;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEBUG, "#### added destination EA %@", buf, 0xCu);
    }

    v27 = (void *)MEMORY[0x1E0D73208];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v11, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v21;
    v14 = objc_msgSend(v27, "copyItemAtURL:toURL:error:", v28, v29, &v38);
    v12 = v38;

    PLAssetImportGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if ((v14 & 1) != 0)
    {
      v20 = v36;
      v19 = v37;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v11;
        v32 = "#### linked videoIncomingPath to %@";
        v33 = v31;
        v34 = OS_LOG_TYPE_DEBUG;
        v35 = 12;
LABEL_25:
        _os_log_impl(&dword_199541000, v33, v34, v32, buf, v35);
      }
    }
    else
    {
      v20 = v36;
      v19 = v37;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v42 = v9;
        v43 = 2112;
        v44 = v11;
        v45 = 2112;
        v46 = v12;
        v32 = "Failed to copy %@ to %@: %@";
        v33 = v31;
        v34 = OS_LOG_TYPE_ERROR;
        v35 = 32;
        goto LABEL_25;
      }
    }

    goto LABEL_27;
  }
  PLAssetImportGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v42 = v20;
    v43 = 2112;
    v44 = v21;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Failed to create directory at %@: %@", buf, 0x16u);
  }
  v14 = 0;
  v12 = v21;
LABEL_27:

  v13 = 1;
  if (a5)
LABEL_6:
    *a5 = v13;
LABEL_7:
  if (a6)
    *a6 = objc_retainAutorelease(v12);

  return v14;
}

- (BOOL)_retryPairedVideoJob:(id)a3 pairingType:(id)a4 pairingIdentifier:(id)a5 retryMax:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  double v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  _BYTE v34[10];
  _BYTE v35[10];
  _BYTE v36[10];
  _QWORD v37[3];

  *(_QWORD *)((char *)&v37[1] + 6) = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74F30]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLAssetImportGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithPath:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)v34 = v11;
    *(_WORD *)&v34[8] = 2114;
    *(_QWORD *)v35 = v15;
    *(_WORD *)&v35[8] = 2112;
    *(_QWORD *)v36 = v16;
    *(_WORD *)&v36[8] = 2114;
    v37[0] = v12;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ paired video job %{public}@: %@ did not find asset with uuid %{public}@", buf, 0x2Au);

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kPLImageWriterPairedVideoJobRetryKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  if (v18 >= a6)
  {
    PLAssetImportGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
      v25 = v12;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithPath:", v13);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v34 = v18;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = a6;
      *(_WORD *)v35 = 2114;
      *(_QWORD *)&v35[2] = v11;
      *(_WORD *)v36 = 2114;
      *(_QWORD *)&v36[2] = v26;
      LOWORD(v37[0]) = 2112;
      *(_QWORD *)((char *)v37 + 2) = v27;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Too many retries (%d/%d) for %{public}@ paired video job %{public}@: %@ will save as standalone video asset", buf, 0x2Cu);

      v12 = v25;
    }
  }
  else
  {
    v29 = v12;
    v19 = _kPLImageWriterPairedVideoJobRetryDelays[v18];
    PLAssetImportGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithPath:", v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)v34 = v11;
      *(_WORD *)&v34[8] = 2114;
      *(_QWORD *)v35 = v21;
      *(_WORD *)&v35[8] = 2112;
      *(_QWORD *)v36 = v22;
      *(_WORD *)&v36[8] = 1024;
      LODWORD(v37[0]) = v18 + 1;
      WORD2(v37[0]) = 1024;
      *(_DWORD *)((char *)v37 + 6) = a6;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ paired video job %{public}@: %@ will retry (%d/%d)", buf, 0x2Cu);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 + 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("kPLImageWriterPairedVideoJobRetryKey"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kPLImageWriterVideoJobWillRetryKey"));
    -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v10);
    dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
    v30 = v11;
    v31 = v10;
    v32 = v29;
    v12 = v29;
    pl_dispatch_after();

    v24 = v30;
  }

  return v18 < a6;
}

- (void)_processVideoJob:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  PLIngestJobCameraMetadata *v15;
  void *v16;
  int v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  _BOOL4 v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void (**v44)(void);
  id v45;
  void *v46;
  void *v47;
  _QWORD v49[4];
  id v50;
  id v51;
  PLImageWriter *v52;
  id v53;
  id v54;
  id v55;
  void (**v56)(void);
  _QWORD *v57;
  _BYTE *v58;
  uint64_t *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  PLImageWriter *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  PLIngestJobCameraMetadata *v73;
  uint64_t *v74;
  _BYTE *v75;
  uint64_t *v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  uint64_t *v80;
  char v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;
  _QWORD v88[5];
  id v89;
  _QWORD v90[3];
  char v91;
  id v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  _QWORD v97[3];
  char v98[8];
  _QWORD v99[4];
  id v100;
  id v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  _BYTE buf[24];
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v44 = (void (**)(void))a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("callStack"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    PLAssetImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "##### %@ %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("callStack"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PLJobLogDictionary();

  }
  v45 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processVideoJob:completion:]");
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74F30]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v110 = __Block_byref_object_copy__4937;
  v111 = __Block_byref_object_dispose__4938;
  v11 = *MEMORY[0x1E0D74F28];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74F28]);
  v112 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74E80]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_kPLImageWriterDidTransferVideoToDestinationPath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74D20]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -[PLIngestJobCameraMetadata initWithCameraMetadataPath:]([PLIngestJobCameraMetadata alloc], "initWithCameraMetadataPath:", v14);
    -[PLIngestJobCameraMetadata deserializeCameraMetadata](v15, "deserializeCameraMetadata");
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74DB8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0D74E18]);
  v47 = v16;
  v18 = (_QWORD *)MEMORY[0x1E0D74D38];
  if (v17)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74D38]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      v103 = 0;
      v104 = &v103;
      v105 = 0x3032000000;
      v106 = __Block_byref_object_copy__4937;
      v107 = __Block_byref_object_dispose__4938;
      v108 = 0;
      v99[0] = MEMORY[0x1E0C809B0];
      v99[1] = 3221225472;
      v99[2] = __45__PLImageWriter__processVideoJob_completion___block_invoke;
      v99[3] = &unk_1E3676EA0;
      v100 = v19;
      v101 = v45;
      v102 = &v103;
      v18 = (_QWORD *)MEMORY[0x1E0D74D38];
      objc_msgSend(v101, "performBlockAndWait:", v99);
      v20 = (void *)v104[5];
      if (v20)
        v21 = v13;
      else
        v21 = 1;
      if ((v21 & 1) == 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v20);
        objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v11);
      }

      _Block_object_dispose(&v103, 8);
    }

  }
  v42 = 0;
  v97[0] = 0;
  v97[1] = v97;
  v97[2] = 0x2020000000;
  v98[0] = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x2020000000;
  v96 = v13;
  if ((v13 & 1) != 0
    || (v22 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40),
        v92 = 0,
        v23 = -[PLImageWriter _transferVideoFromIncomingPath:toDestinationPath:shouldRemoveIncoming:error:](self, "_transferVideoFromIncomingPath:toDestinationPath:shouldRemoveIncoming:error:", v46, v22, v98, &v92), v24 = v92, *((_BYTE *)v94 + 24) = v23, v42 = v24, v23))
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_kPLImageWriterDidTransferVideoToDestinationPath"));
  }
  else
  {
    if (v24)
    {
      -[PLImageWriter _removeTransientKeys:](self, "_removeTransientKeys:", v6);
      v44[2]();
      goto LABEL_30;
    }
    v42 = 0;
  }
  v90[0] = 0;
  v90[1] = v90;
  v90[2] = 0x2020000000;
  v91 = 0;
  v103 = 0;
  v104 = &v103;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__4937;
  v107 = __Block_byref_object_dispose__4938;
  v108 = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x3032000000;
  v88[3] = __Block_byref_object_copy__4937;
  v88[4] = __Block_byref_object_dispose__4938;
  v89 = 0;
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74D70]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", *MEMORY[0x1E0D74D18]);
  v25 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74CC8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74CC0]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v25;
  v82 = 0;
  v83 = &v82;
  v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__4937;
  v86 = __Block_byref_object_dispose__4938;
  objc_msgSend(v6, "objectForKey:", *v18);
  v87 = (id)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v47, "isEqualToString:", *MEMORY[0x1E0D74E28]);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.mobileslideshow"));
  if (objc_msgSend(v29, "BOOLForKey:", CFSTR("PLImageWriterStashCameraJob")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kPLImageWriterReplayedCameraJob"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30 == 0;

    if (v31)
    {
      v32 = *MEMORY[0x1E0D74E88];
      objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D74E88]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", v32);
        v34 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = (id)v83[5];
      }
      v35 = v34;
      -[PLImageWriter _copyJobContentsToHoldingDirectoryWithUUID:incomingPath:job:](self, "_copyJobContentsToHoldingDirectoryWithUUID:incomingPath:job:", v34, v46, v6);

    }
  }
  -[PLImageWriter _incrementJobCount:](self, "_incrementJobCount:", v6);
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __45__PLImageWriter__processVideoJob_completion___block_invoke_2;
  v62[3] = &unk_1E3661560;
  v63 = v6;
  v81 = v28;
  v36 = v26;
  v64 = v36;
  v74 = &v82;
  v65 = v45;
  v66 = v47;
  v67 = self;
  v75 = buf;
  v68 = v46;
  v38 = v29;
  v69 = v38;
  v76 = &v93;
  v77 = v97;
  v78 = v90;
  v70 = v43;
  v37 = v27;
  v71 = v37;
  v41 = v40;
  v72 = v41;
  v73 = v15;
  v79 = v88;
  v80 = &v103;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __45__PLImageWriter__processVideoJob_completion___block_invoke_308;
  v49[3] = &unk_1E3661588;
  v57 = v97;
  v50 = v68;
  v51 = v7;
  v52 = self;
  v58 = buf;
  v59 = &v103;
  v60 = v88;
  v53 = v14;
  v61 = v90;
  v54 = v63;
  v55 = v70;
  v56 = v44;
  objc_msgSend(v65, "performTransaction:completionHandler:withPriority:", v62, v49, 1);

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(v88, 8);

  _Block_object_dispose(&v103, 8);
  _Block_object_dispose(v90, 8);
LABEL_30:
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(v97, 8);

  _Block_object_dispose(buf, 8);
}

- (void)_processVideoSaveJob:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  id v38;
  NSObject *v39;
  int v40;
  char v41;
  uint64_t v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("callStack"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    PLAssetImportGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v56 = v10;
      v57 = 2112;
      v58 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "##### %@ %@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("callStack"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PLJobLogDictionary();

  }
  v45 = (void *)v8;
  v42 = *MEMORY[0x1E0D74F40];
  objc_msgSend(v6, "objectForKey:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74F30]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D74F20]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v17;
  if (v15)
  {
    v50 = 0;
    objc_msgSend(MEMORY[0x1E0D73208], "hasDiskSpaceToCopyFileAtURL:toVolumeAtURL:error:", v16, v17, &v50);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v50;
    if (v18)
    {
      v20 = objc_msgSend(v18, "BOOLValue");

      if (!v20)
      {
        PLServicesLocalizedFrameworkString();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        SetErrorForJob(v6, 0xEu, v21);

        goto LABEL_20;
      }
    }
    else
    {
      PLAssetImportGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v16, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v56 = v23;
        v57 = 2112;
        v58 = (uint64_t)v19;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Failed to determine available space for copying video %@: %@", buf, 0x16u);

      }
    }
  }
  objc_msgSend(v16, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = +[PLPhotoLibrary canSaveVideoToLibrary:](PLPhotoLibrary, "canSaveVideoToLibrary:", v24);

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v15)
    {
      v49 = 0;
      v41 = objc_msgSend(v26, "copyItemAtPath:toPath:error:", v12, v13, &v49);
      v28 = v49;
      v53 = *MEMORY[0x1E0CB2AD8];
      v54 = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      v30 = objc_msgSend(v27, "setAttributes:ofItemAtPath:error:", v29, v13, &v48);
      v31 = v48;

      if ((v30 & 1) == 0)
      {
        PLAssetImportGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v56 = v13;
          v57 = 2112;
          v58 = (uint64_t)v31;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
        }

      }
      if ((v41 & 1) == 0)
      {
LABEL_19:
        PLServicesLocalizedFrameworkString();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        SetErrorForJob(v6, 0xFu, v33);

LABEL_23:
        goto LABEL_24;
      }
    }
    else
    {
      v51 = *MEMORY[0x1E0CB2AD8];
      v52 = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v37 = objc_msgSend(v27, "setAttributes:ofItemAtPath:error:", v36, v12, &v47);
      v38 = v47;

      if ((v37 & 1) == 0)
      {
        PLAssetImportGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v56 = v12;
          v57 = 2112;
          v58 = (uint64_t)v38;
          _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\": %@", buf, 0x16u);
        }

      }
      v46 = 0;
      v40 = objc_msgSend(v27, "moveItemAtPath:toPath:error:", v12, v13, &v46);
      v28 = v46;

      if (!v40)
        goto LABEL_19;
    }
    objc_msgSend(v6, "setObject:forKey:", v13, v42);
    -[PLImageWriter _processVideoJob:completion:](self, "_processVideoJob:completion:", v6, v7);

    v35 = v45;
    goto LABEL_31;
  }
LABEL_20:
  objc_msgSend(v6, "objectForKey:", CFSTR("Error"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    PLServicesLocalizedFrameworkString();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    SetErrorForJob(v6, 0xDu, v27);
    v28 = 0;
    goto LABEL_23;
  }
  v28 = 0;
LABEL_24:
  v35 = v45;
  v7[2](v7);
LABEL_31:

}

- (void)_processSyncedVideoSaveJob:(id)a3 completion:(id)a4
{
  PLLibraryServicesManager **p_libraryServicesManager;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  p_libraryServicesManager = &self->_libraryServicesManager;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_libraryServicesManager);
  objc_msgSend(WeakRetained, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iTunesSyncedAssetsDirectory");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, 0);

  -[PLImageWriter _processVideoSaveJob:completion:](self, "_processVideoSaveJob:completion:", v8, v7);
}

- (void)_processJob:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  PLImageWriter *v23;
  NSObject *v24;
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D74DB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLImageWriterGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __29__PLImageWriter__processJob___block_invoke;
  v21 = &unk_1E36710D8;
  v10 = v5;
  v22 = v10;
  v23 = self;
  v11 = v8;
  v24 = v11;
  v26 = v9;
  v12 = v7;
  v25 = v12;
  v13 = (void *)MEMORY[0x19AEC174C](&v18);
  v14 = v11;
  v15 = v14;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v12;
    _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ProcessImageWriterJob", "jobType: %{public}@", buf, 0xCu);
  }

  PLAssetImportGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v12;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "Processing job with type %@", buf, 0xCu);
  }

  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E00]))
  {
    v17 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processJob:]");
    -[PLImageWriter _processImageJob:inLibrary:completion:](self, "_processImageJob:inLibrary:completion:", v10, v17, v13);
  }
  else if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74DD8]))
  {
    v17 = -[PLImageWriter _newShortLivedLibraryWithName:](self, "_newShortLivedLibraryWithName:", "-[PLImageWriter _processJob:] (BatchImage)");
    -[PLImageWriter _processBatchImageJob:inLibrary:completion:](self, "_processBatchImageJob:inLibrary:completion:", v10, v17, v13);
  }
  else
  {
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74DC8]))
    {
      -[PLImageWriter _processAvalancheJob:completion:](self, "_processAvalancheJob:completion:", v10, v13);
      goto LABEL_11;
    }
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74DD0]))
    {
      -[PLImageWriter _processAvalanchesValidationJob:completion:](self, "_processAvalanchesValidationJob:completion:", v10, v13);
      goto LABEL_11;
    }
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E20]) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E38]) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E18]) & 1) != 0
      || objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E28]))
    {
      -[PLImageWriter _processVideoJob:completion:](self, "_processVideoJob:completion:", v10, v13);
      goto LABEL_11;
    }
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E30]))
    {
      -[PLImageWriter _processVideoSaveJob:completion:](self, "_processVideoSaveJob:completion:", v10, v13);
      goto LABEL_11;
    }
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E10]))
    {
      -[PLImageWriter _processSyncedVideoSaveJob:completion:](self, "_processSyncedVideoSaveJob:completion:", v10, v13);
      goto LABEL_11;
    }
    if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74DF0]))
    {
      +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[_processJob][_processDeletePhotoStreamDataJob]Deleting PhotoStream data."));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      -[PLImageWriter _processDeletePhotoStreamDataJob:withReason:completion:](self, "_processDeletePhotoStreamDataJob:withReason:completion:", v10, v17, v13);
    }
    else
    {
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74DF8]))
      {
        -[PLImageWriter _enablePhotoStreamJob:completion:](self, "_enablePhotoStreamJob:completion:", v10, v13);
        goto LABEL_11;
      }
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E08]))
      {
        -[PLImageWriter _processSyncClientSaveJobsJob:completion:](self, "_processSyncClientSaveJobsJob:completion:", v10, v13);
        goto LABEL_11;
      }
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74DC0]))
      {
        -[PLImageWriter _processAutodeleteEmptyAlbumJob:completion:](self, "_processAutodeleteEmptyAlbumJob:completion:", v10, v13);
        goto LABEL_11;
      }
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74DE0]))
      {
        -[PLImageWriter _processCrashRecoveryJob:completion:](self, "_processCrashRecoveryJob:completion:", v10, v13);
        goto LABEL_11;
      }
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74DE8]))
      {
        -[PLImageWriter _processDaemonJob:completion:](self, "_processDaemonJob:completion:", v10, v13);
        goto LABEL_11;
      }
      if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D74E40]))
      {
        -[PLImageWriter _processXPCDaemonJob:completion:](self, "_processXPCDaemonJob:completion:", v10, v13);
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLImageWriter.m"), 4011, CFSTR("JobType unknown %@"), v12, v18, v19, v20, v21, v22, v23, v24);
    }
  }

LABEL_11:
  objc_autoreleasePoolPop(v6);

}

- (BOOL)imageWriterJob:(id)a3 hasValidPathsWithConnection:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t i;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  int v28;
  NSObject *v29;
  uint64_t j;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[32];
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _QWORD v45[4];

  v45[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 1;
  objc_msgSend(v9, "photoDirectoryWithType:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  NSHomeDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("Library/ReplayKit"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  NSHomeDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("Library/SMS/Attachments"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = (id)*MEMORY[0x1E0D74E70];
  v13 = 0;
  v45[1] = (id)*MEMORY[0x1E0D74F28];
  while (1)
  {
    v14 = v10;
    objc_msgSend(v6, "objectForKey:", v45[v13]);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(MEMORY[0x1E0D73208], "filePath:hasPrefix:", v13, v36) & 1) == 0)
    {
      break;
    }

    v10 = 0;
    v13 = 1;
    if ((v14 & 1) == 0)
      goto LABEL_9;
  }
  PLAssetImportGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v36;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "DestinationPath %@ is not under supported resourcesPath %@", buf, 0x16u);
  }

  LOBYTE(v13) = 0;
LABEL_9:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  PLImageWriterSourcePathKeys();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
  v18 = v34;
  if (v17)
  {
    v19 = v17;
    v33 = v7;
    v20 = *(_QWORD *)v38;
    v21 = v36;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v16);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i), v32);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend(MEMORY[0x1E0D73208], "filePath:hasPrefix:", v23, v21) & 1) == 0
          && (objc_msgSend(MEMORY[0x1E0D73208], "filePath:hasPrefix:", v23, v18) & 1) == 0
          && (objc_msgSend(MEMORY[0x1E0D73208], "filePath:hasPrefix:", v23, v35) & 1) == 0)
        {
          v24 = v33;
          objc_msgSend(MEMORY[0x1E0D73208], "realPathForPath:error:", v23, 0);
          v25 = objc_claimAutoreleasedReturnValue();
          if (!v25)
          {

            v21 = v36;
LABEL_27:
            PLAssetImportGetLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v23;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v21;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v34;
              v42 = 2112;
              v43 = v35;
              _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Source file: %@ is not in %@ nor %@ nor %@ and the client does not have access", buf, 0x2Au);
            }

            LOBYTE(v13) = 0;
            goto LABEL_30;
          }
          v26 = (void *)v25;
          if (v33)
            objc_msgSend(v24, "auditToken");
          else
            memset(buf, 0, sizeof(buf));
          v27 = objc_retainAutorelease(v26);
          v32 = objc_msgSend(v27, "fileSystemRepresentation");
          v28 = sandbox_check_by_audit_token();

          v21 = v36;
          v18 = v34;
          if (v28)
            goto LABEL_27;
        }

      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v44, 16);
      if (v19)
        continue;
      break;
    }
LABEL_30:
    v7 = v33;
  }

  for (j = 1; j != -1; --j)
  return v13;
}

- (void)saveAssetJob:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  const void *v45;
  uint64_t v46;
  const void *v47;
  id v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  void *v60;
  _QWORD v62[4];
  id v63;
  id v64;
  __CFString *v65;
  id v66;
  id v67;
  SEL v68;
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  id v74;
  __int16 v75;
  const __CFString *v76;
  __int16 v77;
  id v78;
  uint64_t v79;
  _QWORD v80[3];

  v80[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = *MEMORY[0x1E0D74EF8];
  objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74EF8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    && (objc_msgSend(v10, "objectForKey:", v14),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "BOOLValue"),
        v16,
        !v17)
    || -[PLImageWriter canEnqueueJob:](self, "canEnqueueJob:", v10))
  {
    v18 = *MEMORY[0x1E0D74D38];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D38]);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D74D60]);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74DB8]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      if (objc_msgSend((id)objc_opt_class(), "_requiresAssetUUIDForJobType:", v20))
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "UUIDString");
        v19 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v18);
        PLAssetImportGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543618;
          v70 = v20;
          v71 = 2114;
          v72 = v19;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "Job %{public}@ missing required assetUUID, assigning %{public}@ ", buf, 0x16u);
        }

      }
      else
      {
        v19 = 0;
      }
    }
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74D78]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v29;
    v55 = (void *)v19;
    if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D74E00]))
    {
      v30 = *MEMORY[0x1E0D74E70];
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74E70]);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v31, "length"))
      {
        if (!objc_msgSend(v29, "length"))
        {
          objc_msgSend(MEMORY[0x1E0D73148], "defaultFileExtensionForAssetType:", 0);
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = v29;
          v37 = (void *)v35;

          v60 = v37;
        }
        objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74D30]);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v38)
        {
          -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:](self, "cameraAssetPathForNewAssetWithExtension:assetUUID:", v60, v19);
          v39 = objc_claimAutoreleasedReturnValue();

          v31 = (void *)v39;
        }
        if (v31)
          objc_msgSend(v10, "setObject:forKey:", v31, v30);
        v32 = CFSTR("generated image");
        if (!v11)
          goto LABEL_51;
        goto LABEL_48;
      }
      goto LABEL_18;
    }
    v33 = *MEMORY[0x1E0D74E20];
    if ((objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D74E20]) & 1) == 0
      && (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D74E18]) & 1) == 0
      && !objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D74E30]))
    {
      if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D74E28]))
      {
        -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:](self, "cameraAssetPathForNewAssetWithExtension:assetUUID:", CFSTR("MOV"), v19);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v31, *MEMORY[0x1E0D74F28]);
      }
      else
      {
        v31 = 0;
      }
LABEL_18:
      v32 = CFSTR("provided image");
      if (!v11)
      {
LABEL_51:
        if (v12)
        {
          if (objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D74E28]))
          {
            v44 = PLCreateCGImageFromIOSurface();
            if (v44)
            {
              v45 = (const void *)v44;
              objc_msgSend(v10, "setObject:forKey:", v44, *MEMORY[0x1E0D74F38]);
              CFRelease(v45);
            }
          }
          v46 = PLCreateImageFromPreviewImageSurface();
          if (v46)
          {
            v47 = (const void *)v46;
            objc_msgSend(v10, "setObject:forKey:", v46, *MEMORY[0x1E0D74EF0]);
            CFRelease(v47);
          }
        }
        v58 = v11;
        v59 = v12;
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __81__PLImageWriter_saveAssetJob_imageSurface_previewImageSurface_completionHandler___block_invoke;
        v62[3] = &unk_1E36615B0;
        v68 = a2;
        v48 = v20;
        v63 = v48;
        v28 = v55;
        v64 = v28;
        v65 = (__CFString *)v32;
        v49 = v31;
        v66 = v49;
        v67 = v13;
        v50 = (void *)MEMORY[0x19AEC174C](v62);
        PLAssetImportGetLog();
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v70 = v52;
          v71 = 2114;
          v72 = (uint64_t)v48;
          v73 = 2114;
          v74 = v28;
          v75 = 2114;
          v76 = v32;
          v77 = 2112;
          v78 = v49;
          _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing job %{public}@ assetUUID %{public}@ with %{public}@ destination path %@", buf, 0x34u);

        }
        v53 = (void *)objc_msgSend(v50, "copy");
        v54 = (void *)MEMORY[0x19AEC174C]();
        objc_msgSend(v10, "setObject:forKey:", v54, CFSTR("completionBlock"));

        -[PLImageWriter enqueueJob:](self, "enqueueJob:", v10);
        v11 = v58;
        v12 = v59;
        goto LABEL_60;
      }
LABEL_48:
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74C78]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73228]), "initWithIOSurface:length:", v11, objc_msgSend(v42, "unsignedIntegerValue"));
        objc_msgSend(v10, "setObject:forKey:", v43, *MEMORY[0x1E0D74DA0]);

      }
      goto LABEL_51;
    }
    v34 = *MEMORY[0x1E0D74F28];
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74F28]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v31, "length"))
    {
      v32 = CFSTR("provided video");
      if (!v11)
        goto LABEL_51;
      goto LABEL_48;
    }
    if (!objc_msgSend(v60, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D73148], "defaultFileExtensionForAssetType:", 2);
      v56 = objc_claimAutoreleasedReturnValue();

      v60 = (void *)v56;
    }
    if ((objc_msgSend(v20, "isEqualToString:", v33) & 1) != 0
      || objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D74E18]))
    {
      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74F40]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v40, *MEMORY[0x1E0D74F30]);

      objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0D74E88]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        objc_msgSend(v10, "removeObjectForKey:", v34);
        v57 = 0;
      }
      else
      {
        -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:](self, "cameraAssetPathForNewAssetWithExtension:assetUUID:", CFSTR("MOV"), v19);
        v57 = objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (!objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D74E30]))
      {
LABEL_45:
        if (v31)
          objc_msgSend(v10, "setObject:forKey:", v31, v34);
        v32 = CFSTR("generated video");
        if (!v11)
          goto LABEL_51;
        goto LABEL_48;
      }
      -[PLImageWriter cameraAssetPathForNewAssetWithExtension:assetUUID:](self, "cameraAssetPathForNewAssetWithExtension:assetUUID:", v60, v19);
      v57 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D73148], "uniqueIncomingPathForAssetWithUUID:andExtension:isPhotoStream:", v19, v60, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v41, *MEMORY[0x1E0D74F30]);
    }

    v31 = (void *)v57;
    goto LABEL_45;
  }
  PLAssetImportGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v70 = v24;
    v71 = 2112;
    v72 = (uint64_t)v10;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "[%{public}@] job queue full, failed to enqueue job %@", buf, 0x16u);

  }
  v25 = (void *)MEMORY[0x1E0CB35C8];
  v26 = *MEMORY[0x1E0D74498];
  v79 = *MEMORY[0x1E0CB2D50];
  v80[0] = CFSTR("Failed to enqueue imagewriter job; job queue is full");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, &v79, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 41001, v27);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
    (*((void (**)(id, _QWORD, _QWORD, uint64_t, id))v13 + 2))(v13, 0, 0, 1, v28);
LABEL_60:

}

- (void)enqueueAutoDeleteEmptyAlbumJobWithAlbumID:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D74DC0];
  objc_msgSend(v6, "setObject:forKey:", *MEMORY[0x1E0D74DC0], *MEMORY[0x1E0D74DB8]);
  objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("EmptyAlbumToDelete"));
  PLAssetImportGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v9;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "[%@] enqueing job %@ with albumID %@", (uint8_t *)&v10, 0x20u);

  }
  -[PLImageWriter enqueueJob:](self, "enqueueJob:", v6);

}

- (void)_copyJobContentsToHoldingDirectoryWithUUID:(id)a3 incomingPath:(id)a4 job:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  id v27;
  void *v28;
  char v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  _QWORD v59[4];
  uint8_t buf[4];
  id v61;
  __int16 v62;
  NSObject *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v8;
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v11, &v58);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v58;

  NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "pathComponentForIncomingHoldingDirectory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingPathComponent:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByAppendingPathComponent:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v57 = 0;
    v18 = objc_msgSend(v10, "createDirectoryIfNeededAtPath:error:", v17, &v57);
    v19 = v57;
    v20 = v19;
    if (v18)
    {
      v45 = v19;
      v46 = v12;
      v47 = v13;
      v48 = v10;
      v49 = v9;
      v50 = v7;
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v21 = v12;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      if (!v22)
        goto LABEL_21;
      v23 = v22;
      v24 = *(_QWORD *)v54;
      while (1)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
          objc_msgSend(v26, "pathExtension", v45, v46, v47, v48, v49, v50);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v27, "isEqualToString:", CFSTR("irs")) & 1) != 0)
            goto LABEL_18;
          objc_msgSend(v26, "pathExtension");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("avalanche"));

          if ((v29 & 1) != 0)
            continue;
          objc_msgSend(v26, "lastPathComponent");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingPathComponent:", v30);
          v31 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v51, "stringByDeletingLastPathComponent");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringByAppendingPathComponent:", v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33)
          {
            v27 = 0;
LABEL_14:
            PLAssetImportGetLog();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v61 = v33;
              v62 = 2112;
              v63 = v31;
              v64 = 2112;
              v65 = v27;
              _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "Error copying item from %@ to %@: %@", buf, 0x20u);
            }

            goto LABEL_17;
          }
          v52 = 0;
          v34 = objc_msgSend(MEMORY[0x1E0D73208], "cloneFileAtPath:toPath:error:", v33, v31, &v52);
          v27 = v52;
          if ((v34 & 1) == 0)
            goto LABEL_14;
LABEL_17:

LABEL_18:
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        if (!v23)
        {
LABEL_21:

          v9 = v49;
          v7 = v50;
          v13 = v47;
          v10 = v48;
          v20 = v45;
          v12 = v46;
          goto LABEL_27;
        }
      }
    }
    PLAssetImportGetLog();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v61 = v17;
      v62 = 2112;
      v63 = v20;
      _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Error creating holding file path at %@: %@", buf, 0x16u);
    }

  }
  else
  {
    PLAssetImportGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v13;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Error getting contents of incoming directory: %@", buf, 0xCu);
    }
  }
LABEL_27:

  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByAppendingPathExtension:", CFSTR("plist"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = (void *)objc_msgSend(v9, "mutableCopy");
    v41 = *MEMORY[0x1E0D74EF0];
    v59[0] = CFSTR("completionBlock");
    v59[1] = v41;
    v42 = *MEMORY[0x1E0D74F28];
    v59[2] = *MEMORY[0x1E0D74E70];
    v59[3] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "removeObjectsForKeys:", v43);

    objc_msgSend(v40, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("kPLImageWriterReplayedCameraJob"));
    if ((objc_msgSend(v40, "writeToFile:atomically:", v39, 1) & 1) == 0)
    {
      PLAssetImportGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v61 = v39;
        v62 = 2112;
        v63 = 0;
        _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "Error writing job dict to %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    PLAssetImportGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Unable to write out job dictionary as it is nil", buf, 2u);
    }
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_indicatorFileCoordinator, 0);
  objc_storeStrong((id *)&self->_iTunesSyncedAssetsDCIMDirectory, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_jobCompletionQueue, 0);
  objc_storeStrong((id *)&self->_jobQueue, 0);
}

void __81__PLImageWriter_saveAssetJob_imageSurface_previewImageSurface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("completionBlock"));
  PLAssetImportGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 72));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v11 = 138544386;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    v15 = 2114;
    v16 = v7;
    v17 = 2114;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] completed job %{public}@ assetUUID %{public}@ with %{public}@ destination path %@", (uint8_t *)&v11, 0x34u);

  }
  v10 = *(_QWORD *)(a1 + 64);
  if (v10)
    (*(void (**)(uint64_t, uint64_t, id, _QWORD, _QWORD))(v10 + 16))(v10, 1, v3, 0, 0);

}

void __29__PLImageWriter__processJob___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  uint64_t v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D731D8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateAvailableDiskSpace");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("completionBlock"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_incrementJobCount:", *(_QWORD *)(a1 + 32));
    v4 = *(void **)(a1 + 32);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __29__PLImageWriter__processJob___block_invoke_2;
    v15[3] = &unk_1E3676218;
    v16 = v4;
    v20 = v3;
    v6 = *(id *)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 64);
    v17 = v6;
    v21 = v7;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v18 = v9;
    v19 = v10;
    dispatch_async(v5, v15);

    v11 = v16;
  }
  else
  {
    v12 = *(id *)(a1 + 48);
    v11 = v12;
    v13 = *(_QWORD *)(a1 + 64);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      v23 = v14;
      _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_END, v13, "ProcessImageWriterJob", "jobType: %{public}@", buf, 0xCu);
    }
  }

}

uint64_t __29__PLImageWriter__processJob___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("kPLImageWriterVideoJobWillRetryKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if ((v3 & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 72);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v7 = *(_QWORD *)(a1 + 48);
    v9 = 138543362;
    v10 = v7;
    _os_signpost_emit_with_name_impl(&dword_199541000, v5, OS_SIGNPOST_INTERVAL_END, v6, "ProcessImageWriterJob", "jobType: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 56), "_decrementJobCount:", *(_QWORD *)(a1 + 32));
}

void __45__PLImageWriter__processVideoJob_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", a1[4], a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForVideoFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copy");
  v4 = *(_QWORD *)(a1[6] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __45__PLImageWriter__processVideoJob_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  CMTimeValue v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;
  id v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  char v53;
  __CFString *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  __int16 v58;
  const __CFDictionary *v59;
  const __CFDictionary *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  int v66;
  void *v67;
  int v68;
  int v69;
  BOOL v70;
  int v71;
  NSObject *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  uint64_t v76;
  __CFString *v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  BOOL IsApproximatelyEqual;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  void *v101;
  uint64_t v102;
  void *v103;
  float v104;
  float v105;
  BOOL v106;
  id v107;
  NSObject *v108;
  CMTimeValue v109;
  void *v110;
  void *v111;
  NSObject *v112;
  _BOOL4 v113;
  CMTimeValue v114;
  void *v115;
  __CFString *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  NSObject *v126;
  _BOOL4 v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  const char *v132;
  void *v133;
  void *v134;
  char v135;
  void *v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  CMTimeValue v148;
  int v149;
  NSObject *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  NSObject *v154;
  CMTimeValue v155;
  uint64_t v156;
  uint64_t v157;
  NSObject *v158;
  CMTimeValue v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  NSObject *v164;
  CMTimeValue v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  void *v170;
  _BOOL4 v171;
  void *v172;
  int v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  const __CFString *v185;
  void *v186;
  void *v187;
  __CFString *v188;
  id v189;
  CMTime v190;
  CMTime v191;
  CMTime v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  CMTime buf;
  __CFString *v199;
  __int16 v200;
  const __CFString *v201;
  uint64_t v202;
  _QWORD v203[4];

  v203[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D74E58];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74E58]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("ImportedBy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "intValue") == 6 || objc_msgSend(v5, "intValue") == 9)
    && objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    v6 = *MEMORY[0x1E0D73590];
    v7 = *(_QWORD *)(a1 + 40);
    v202 = *MEMORY[0x1E0D73598];
    v203[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v203, &v202, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x19AEC0B7C](v6, v8);

  }
  if (*(_BYTE *)(a1 + 176))
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "length"))
    {
      +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        goto LABEL_8;
    }
  }
  if (!objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", *MEMORY[0x1E0D74E18]))
  {
LABEL_16:
    v15 = *MEMORY[0x1E0D74E38];
    if (objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", *MEMORY[0x1E0D74E38]))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CB8]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "photoFromAssetURL:", v16);
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "pathForVideoFile");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
      v19 = *(void **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;

    }
    else
    {
      v183 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74EA8]);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74E88]);
    v188 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v184 = v4;
    v185 = v20;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40)
      || !objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", *MEMORY[0x1E0D74E20]))
    {
      v171 = 0;
      v182 = 0;
      v173 = 0;
      v21 = 0;
      goto LABEL_29;
    }
    if (v188)
    {
      +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v188, *(_QWORD *)(a1 + 48));
      v21 = objc_claimAutoreleasedReturnValue();
      PLAssetImportGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          v24 = *(_QWORD *)(a1 + 72);
          -[NSObject objectID](v21, "objectID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.value) = 138543874;
          *(CMTimeValue *)((char *)&buf.value + 4) = v24;
          LOWORD(buf.flags) = 2114;
          *(_QWORD *)((char *)&buf.flags + 2) = v25;
          HIWORD(buf.epoch) = 2114;
          v199 = v188;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ found asset %{public}@ with uuid %{public}@", (uint8_t *)&buf, 0x20u);

        }
        -[NSObject mediaGroupUUID](v21, "mediaGroupUUID");
        v26 = objc_claimAutoreleasedReturnValue();
        v182 = (void *)v26;
        if (v20 && v26)
        {
          v171 = 0;
          v173 = -[__CFString isEqualToString:](v20, "isEqualToString:", v26) ^ 1;
        }
        else
        {
          v173 = 0;
          v171 = v26 == 0;
        }
LABEL_190:
        v149 = objc_msgSend(*(id *)(a1 + 80), "BOOLForKey:", CFSTR("PLFrameDropRecoveryEnableOnOlderDevices"));
        if (v149)
        {
          PLAssetImportGetLog();
          v150 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.value) = 0;
            _os_log_impl(&dword_199541000, v150, OS_LOG_TYPE_DEFAULT, "[FDR] Sending live photo down frame drop recovery path because PLFrameDropRecoveryEnableOnOlderDevicesUserDefaultsKey default is set", (uint8_t *)&buf, 2u);
          }

        }
        if ((-[NSObject hasAdjustments](v21, "hasAdjustments") & 1) != 0
          || (v149 | PLPlatformIsFrameDropRecoverySupported()) != 1)
        {
          -[NSObject pathForVideoComplementFile](v21, "pathForVideoComplementFile");
          v156 = objc_claimAutoreleasedReturnValue();
          v157 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
          v154 = *(NSObject **)(v157 + 40);
          *(_QWORD *)(v157 + 40) = v156;
        }
        else
        {
          -[NSObject pathForDeferredVideoComplementFile](v21, "pathForDeferredVideoComplementFile");
          v151 = objc_claimAutoreleasedReturnValue();
          v152 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
          v153 = *(void **)(v152 + 40);
          *(_QWORD *)(v152 + 40) = v151;

          -[NSObject setVideoDeferredProcessingNeeded:](v21, "setVideoDeferredProcessingNeeded:", 1);
          +[PLImageWriter _signalBackgroundProcessingNeededForAsset:reason:](PLImageWriter, "_signalBackgroundProcessingNeededForAsset:reason:", v21, CFSTR("frame drop recovery"));
          PLAssetImportGetLog();
          v154 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
          {
            v155 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
            LODWORD(buf.value) = 138412290;
            *(CMTimeValue *)((char *)&buf.value + 4) = v155;
            _os_log_impl(&dword_199541000, v154, OS_LOG_TYPE_DEFAULT, "[FDR] Marking video complement for frame drop recovery, assigning path %@", (uint8_t *)&buf, 0xCu);
          }
        }

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40))
        {
          PLAssetImportGetLog();
          v158 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
          {
            v159 = *(_QWORD *)(a1 + 72);
            v160 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
            LODWORD(buf.value) = 138543618;
            *(CMTimeValue *)((char *)&buf.value + 4) = v159;
            LOWORD(buf.flags) = 2114;
            *(_QWORD *)((char *)&buf.flags + 2) = v160;
            _os_log_impl(&dword_199541000, v158, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ -> destination %{public}@", (uint8_t *)&buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 64), "cameraAssetPathForNewAssetWithExtension:assetUUID:", CFSTR("MOV"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
          v161 = objc_claimAutoreleasedReturnValue();
          v162 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
          v163 = *(void **)(v162 + 40);
          *(_QWORD *)(v162 + 40) = v161;

          PLAssetImportGetLog();
          v164 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
          {
            v165 = *(_QWORD *)(a1 + 72);
            v166 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
            LODWORD(buf.value) = 138543618;
            *(CMTimeValue *)((char *)&buf.value + 4) = v165;
            LOWORD(buf.flags) = 2114;
            *(_QWORD *)((char *)&buf.flags + 2) = v166;
            _os_log_impl(&dword_199541000, v164, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ aborting, will import video at %{public}@", (uint8_t *)&buf, 0x16u);
          }

          v158 = v21;
          v21 = 0;
        }

        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), *MEMORY[0x1E0D74F28]);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, CFSTR("kPLImageWriterVideoJobWillRetryKey"));
LABEL_29:
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24))
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74F30]);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74F28]);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = *(void **)(a1 + 64);
          v41 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24;
          v197 = 0;
          v42 = objc_msgSend(v40, "_transferVideoFromIncomingPath:toDestinationPath:shouldRemoveIncoming:error:", v38, v39, v41, &v197);
          v43 = v197;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24) = v42;
          v44 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);

          if (!v44)
          {
            if (v43)
            {
              v10 = 0;
              v20 = (__CFString *)v185;
LABEL_181:
              v147 = v182;
LABEL_182:

              v4 = v184;
              goto LABEL_183;
            }
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D80]);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (v21 && v27)
        {
          -[NSObject pathForFullsizeRenderVideoFile](v21, "pathForFullsizeRenderVideoFile");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = *(void **)(a1 + 64);
          v31 = *(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24;
          v196 = 0;
          v32 = objc_msgSend(v30, "_transferVideoFromIncomingPath:toDestinationPath:shouldRemoveIncoming:error:", v28, v29, v31, &v196);
          v33 = v196;
          if (v32)
            -[NSObject setVideoCpVisibilityState:](v21, "setVideoCpVisibilityState:", -[NSObject videoCpVisibilityState](v21, "videoCpVisibilityState") | 8);

        }
        v181 = v5;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), 0);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*(_BYTE *)(a1 + 176))
          objc_msgSend(MEMORY[0x1E0C8B0D0], "consolidateMovieFragmentsInFile:error:", v187, 0);
        v178 = v28;
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74D40]);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74E48]);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74F38]))
        {
          v36 = DCIM_newPLImageWithCGImage();
          v20 = (__CFString *)v185;
          if (v36)
          {
            v180 = (id)v36;
            v37 = (id)PLCreateImageWithFormatFromImage();
LABEL_40:
            v179 = v37;
            goto LABEL_46;
          }
        }
        else
        {
          v20 = (__CFString *)v185;
          if (!v21)
          {
            if (*(_QWORD *)(a1 + 88))
            {
              DCIM_newPLImageWithContentsOfFile();
              v180 = (id)objc_claimAutoreleasedReturnValue();
              DCIM_newPLImageWithContentsOfFile();
              v37 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v117 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
              v194 = 0;
              v195 = 0;
              PLPreviewImageAndDurationForVideoAtPathWithPreferredTime(0, v117, &v195, &v194, 0);
              v180 = v195;
              v37 = v194;
            }
            goto LABEL_40;
          }
        }
        v179 = 0;
        v180 = 0;
LABEL_46:
        v177 = v34;
        if (v34)
        {
          if (!v35)
            v35 = v34;
          if (!*(_BYTE *)(a1 + 176))
          {
            v45 = v3;
            v46 = v15;
            v47 = v2;
            v48 = objc_alloc(MEMORY[0x1E0C99D80]);
            v49 = v35;
            v50 = (void *)objc_msgSend(v48, "initWithObjectsAndKeys:", v34, *MEMORY[0x1E0CB2A38], v35, *MEMORY[0x1E0CB2A88], 0);
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
            v193 = 0;
            v53 = objc_msgSend(v51, "setAttributes:ofItemAtPath:error:", v50, v52, &v193);
            v54 = (__CFString *)v193;

            if ((v53 & 1) == 0)
            {
              PLAssetImportGetLog();
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                v56 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
                LODWORD(buf.value) = 138543874;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v50;
                LOWORD(buf.flags) = 2112;
                *(_QWORD *)((char *)&buf.flags + 2) = v56;
                HIWORD(buf.epoch) = 2112;
                v199 = v54;
                _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_ERROR, "Failed to write file attributes %{public}@ on %@: %@", (uint8_t *)&buf, 0x20u);
              }

            }
            v20 = (__CFString *)v185;
            v35 = v49;
            v2 = v47;
            v15 = v46;
            v3 = v45;
          }
        }
        v176 = v35;
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74F00]);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = v57;
        if (v57)
        {
          v58 = objc_msgSend(v57, "integerValue");
          if (v21)
            goto LABEL_57;
        }
        else
        {
          v58 = objc_msgSend(MEMORY[0x1E0D73310], "defaultSavedAssetTypeForUnspecifiedImageWriterJobs");
          if (v21)
          {
LABEL_57:
            v59 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74EB0]);
            v60 = (const __CFDictionary *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74EB8]);
            memset(&v192, 0, sizeof(v192));
            if (v59)
              CMTimeMakeFromDictionary(&v192, v59);
            else
              v192 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
            v5 = v181;
            memset(&v191, 0, sizeof(v191));
            if (v60)
              CMTimeMakeFromDictionary(&v191, v60);
            else
              v191 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
            buf = v191;
            v190 = v192;
            v64 = -[NSObject becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:](v21, "becomePhotoIrisWithMediaGroupUUID:mainFileMetadata:videoURL:videoDuration:stillDisplayTime:options:", v20, 0, v187, &buf, &v190, 0);
            if ((_DWORD)v64)
            {
              objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74E90]);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = objc_msgSend(v65, "BOOLValue");

              if (v66)
              {
                objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74EA0]);
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject updatePhotoIrisVisibilityStateWithVitalityScore:](v21, "updatePhotoIrisVisibilityStateWithVitalityScore:", v67);

              }
              v68 = v192.flags & 0x1D;
              v69 = v191.flags & 0x1D;
              v70 = v68 == 1 && v69 == 1;
              v71 = v173;
              if (!v70)
                v71 = 1;
              if ((v71 | v171) == 1)
              {
                PLAssetImportGetLog();
                v72 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                {
                  v169 = v2;
                  if (v68 == 1)
                    v73 = CFSTR("N");
                  else
                    v73 = CFSTR("Y");
                  if (v69 == 1)
                    v74 = CFSTR("N");
                  else
                    v74 = CFSTR("Y");
                  if (v173)
                  {
                    v75 = v74;
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Y (existing %@, incoming %@)"), v182, v20);
                    v76 = objc_claimAutoreleasedReturnValue();
                    v74 = v75;
                    v77 = (__CFString *)v76;
                  }
                  else
                  {
                    v77 = CFSTR("N");
                  }
                  if (v171)
                    v118 = CFSTR("Y");
                  else
                    v118 = CFSTR("N");
                  LODWORD(buf.value) = 138413058;
                  *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v73;
                  LOWORD(buf.flags) = 2112;
                  *(_QWORD *)((char *)&buf.flags + 2) = v74;
                  HIWORD(buf.epoch) = 2112;
                  v199 = v77;
                  v200 = 2112;
                  v201 = v118;
                  _os_log_impl(&dword_199541000, v72, OS_LOG_TYPE_ERROR, "Invalid live photo metadata, non-numeric still display time: %@, video duration: %@, pairing identifier mismatch: %@, pairing identifier potentially missing in image: %@", (uint8_t *)&buf, 0x2Au);
                  if (v173)

                  v2 = v169;
                  v5 = v181;
                }

                if (MEMORY[0x19AEC04BC]())
                {
                  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Captured live photo with invalid video metadata:"));
                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                  v120 = v119;
                  if (v68 != 1)
                    objc_msgSend(v119, "appendString:", CFSTR("\n  Still display time is non-numeric"));
                  if (v69 != 1)
                    objc_msgSend(v120, "appendString:", CFSTR("\n  Video duration is non-numeric"));
                  if (v173)
                    objc_msgSend(v120, "appendFormat:", CFSTR("\n  Pairing identifier does not match, existing identifier %@ does not match incoming identifier %@"), v182, v20);
                  if (v171)
                    objc_msgSend(v120, "appendFormat:", CFSTR("\n  No pairing identifier found for existing asset, image metadata is potentially missing pairing identifier (incoming pairing identifier: %@)"), v20);
                  +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Photos Live Photo Capture Issue Detected!"), CFSTR("Please file a Radar for critical live photo capture issue."), CFSTR("TTR Photos: captured live photo with invalid video metadata"), v120);

                }
              }
              if (-[NSObject hasAdjustments](v21, "hasAdjustments"))
              {
                if (!-[NSObject deferredProcessingNeeded](v21, "deferredProcessingNeeded"))
                {
                  -[NSObject setDeferredProcessingNeeded:](v21, "setDeferredProcessingNeeded:", 2);
                  +[PLImageWriter _signalBackgroundProcessingNeededForAsset:reason:](PLImageWriter, "_signalBackgroundProcessingNeededForAsset:reason:", v21, CFSTR("pairing succeeded and asset has adjustments"));
                }
                if ((-[NSObject videoCpVisibilityState](v21, "videoCpVisibilityState") & 1) == 0)
                  -[NSObject setVideoCpVisibilityState:](v21, "setVideoCpVisibilityState:", -[NSObject videoCpVisibilityState](v21, "videoCpVisibilityState") | 8);
                -[NSObject pathForFullsizeRenderImageFile](v21, "pathForFullsizeRenderImageFile");
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                v122 = +[PLResourceInstaller onDemand_installAdjustedFullSizeRenderResourceAtFilePath:forAsset:](PLResourceInstaller, "onDemand_installAdjustedFullSizeRenderResourceAtFilePath:forAsset:", v121, v21);

                v123 = +[PLResourceInstaller onDemand_installAdjustedDeferredFullSizeVideoComplementResourceForAsset:](PLResourceInstaller, "onDemand_installAdjustedDeferredFullSizeVideoComplementResourceForAsset:", v21);
              }
            }
            if (!v188)
              goto LABEL_162;
            objc_msgSend(*(id *)(a1 + 72), "stringByDeletingLastPathComponent");
            v124 = (void *)objc_claimAutoreleasedReturnValue();
            _photoIrisIndicatorFilePathForPhoto(v124, (uint64_t)v188);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            PLAssetImportGetLog();
            v126 = objc_claimAutoreleasedReturnValue();
            v127 = os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v64)
            {
              if (v127)
              {
                objc_msgSend(v187, "path");
                v128 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject mainFileURL](v21, "mainFileURL");
                v129 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "path");
                v130 = v2;
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(buf.value) = 138543618;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v128;
                LOWORD(buf.flags) = 2114;
                *(_QWORD *)((char *)&buf.flags + 2) = v131;
                v132 = "photoIris video job successfully paired %{public}@ with %{public}@";
LABEL_160:
                _os_log_impl(&dword_199541000, v126, OS_LOG_TYPE_DEFAULT, v132, (uint8_t *)&buf, 0x16u);

                v2 = v130;
                v20 = (__CFString *)v185;

              }
            }
            else if (v127)
            {
              objc_msgSend(v187, "path");
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject mainFileURL](v21, "mainFileURL");
              v129 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v129, "path");
              v130 = v2;
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(buf.value) = 138543618;
              *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v128;
              LOWORD(buf.flags) = 2114;
              *(_QWORD *)((char *)&buf.flags + 2) = v131;
              v132 = "photoIris video job failed to pair %{public}@ with %{public}@";
              goto LABEL_160;
            }

            +[PLImageWriter photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:](PLImageWriter, "photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:", v64, v125, v21, *(_QWORD *)(a1 + 48));
            v5 = v181;
LABEL_162:
            v10 = 0;
LABEL_163:
            if ((objc_msgSend(v10, "isInserted") & 1) == 0 && objc_msgSend(v10, "isUpdated"))
              objc_msgSend(v10, "setNeedsMomentUpdate:", 1);
            objc_msgSend(*(id *)(a1 + 48), "assetURLForPhoto:", v10);
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            if (v133)
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v133, *MEMORY[0x1E0D74CB8]);
            if (v10)
            {
              objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v10, CFSTR("PLImageWriterTransientAsset"));
              v134 = *(void **)(a1 + 112);
              if (v134)
                objc_msgSend(v134, "applyCameraMetadataToAsset:", v10);
            }
            else
            {
              v135 = v64 ^ 1;
              if (!v21)
                v135 = 1;
              if ((v135 & 1) == 0)
                objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v21, CFSTR("PLImageWriterTransientAsset"));
            }
            objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("job.private.ClientInLimitedLibraryMode"));
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v137 = objc_msgSend(v136, "BOOLValue");

            objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("job.private.LimitedLibraryClientFetchFilterIdentifier"));
            v138 = objc_claimAutoreleasedReturnValue();
            v139 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
            v140 = *(void **)(v139 + 40);
            *(_QWORD *)(v139 + 40) = v138;

            if (v137
              && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 160) + 8) + 40), "length")
              && (objc_msgSend(v5, "intValue") == 6 || objc_msgSend(v5, "intValue") == 9))
            {
              objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("job.private.LimitedLibraryClientAuthorization"));
              v141 = (void *)objc_claimAutoreleasedReturnValue();
              v142 = *(void **)(a1 + 64);
              objc_msgSend(v10, "uuid");
              v143 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v142, "_processLimitedLibraryAdditionIfNeededWithAssetUUID:clientBundleIdentifier:clientAuthorization:library:", v143, *(_QWORD *)(a1 + 40), v141, *(_QWORD *)(a1 + 48));
              v144 = objc_claimAutoreleasedReturnValue();
              v145 = *(_QWORD *)(*(_QWORD *)(a1 + 168) + 8);
              v146 = *(void **)(v145 + 40);
              *(_QWORD *)(v145 + 40) = v144;

            }
            goto LABEL_181;
          }
        }
        if (objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", v15))
        {
          v61 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v183, "pathForVideoFile");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "fileURLWithPath:isDirectory:", v62, 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v183, "setVideoInfoFromFileAtURL:mainFileMetadata:fullSizeRenderURL:overwriteOriginalProperties:", v63, 0, 0, 0);
          objc_msgSend(v183, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", v180, v179, 0, 0, 0);
          v10 = v183;

          LOBYTE(v64) = 0;
        }
        else
        {
          v78 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v79 = v78;
          v80 = *(_QWORD *)(a1 + 40);
          if (v80)
            objc_msgSend(v78, "setObject:forKey:", v80, *MEMORY[0x1E0D74CC8]);
          v81 = *(_QWORD *)(a1 + 96);
          if (v81)
            objc_msgSend(v79, "setObject:forKey:", v81, *MEMORY[0x1E0D74CC0]);
          if (v184)
            objc_msgSend(v79, "setObject:forKey:", v184, v3);
          v82 = *(_QWORD *)(a1 + 104);
          if (v82)
            objc_msgSend(v79, "setObject:forKey:", v82, *MEMORY[0x1E0D74D18]);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), 0);
          v83 = objc_claimAutoreleasedReturnValue();
          v84 = objc_alloc(MEMORY[0x1E0D75140]);
          objc_msgSend(*(id *)(a1 + 48), "libraryBundle");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v85, "timeZoneLookup");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v87 = objc_msgSend(v84, "initWithAVURL:options:timeZoneLookup:", v83, 12, v86);

          LOBYTE(v168) = 0;
          LOBYTE(v167) = *(_BYTE *)(a1 + 176);
          v172 = (void *)v83;
          v186 = (void *)v87;
          objc_msgSend(*(id *)(a1 + 48), "addDCIMEntryAtFileURL:mainFileMetadata:previewImage:thumbnailImage:savedAssetType:replacementUUID:publicGlobalUUID:extendedInfo:withUUID:isPlaceholder:placeholderFileURL:forFinalCameraImage:", v83, v87, v180, v179, v58, v2, 0, v79, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), v167, 0, v168);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v88;
          if (v177)
          {
            objc_msgSend(v88, "dateCreated");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            IsApproximatelyEqual = PLDateIsApproximatelyEqual(v177, v89, 0.001);

            if (!IsApproximatelyEqual)
            {
              objc_msgSend(v10, "didSetCustomDateCreated");
              objc_msgSend(v10, "setDateCreated:", v177);
            }
          }
          if (*(_BYTE *)(a1 + 176))
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D74EE0]);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D74ED8]);
            v92 = objc_claimAutoreleasedReturnValue();
            v93 = (void *)v92;
            if (v91 && v92)
            {
              objc_msgSend(v10, "setWidth:", objc_msgSend(v91, "longLongValue"));
              objc_msgSend(v10, "setHeight:", objc_msgSend(v93, "longLongValue"));
            }

          }
          if (v20)
            objc_msgSend(v10, "setMediaGroupUUID:", v20);
          v170 = v2;
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CB0]);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (uint64_t)v94;
          if (v94)
            objc_msgSend(v10, "updateAssetKindAndPlaybackStyleIfNeededWithKind:", (__int16)objc_msgSend(v94, "intValue"));
          v174 = v79;
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CA8]);
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          v96 = v95;
          if (v95)
            objc_msgSend(v10, "setKindSubtype:", (__int16)objc_msgSend(v95, "intValue"));
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74F18]);
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x1E0D74CF8]);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = *MEMORY[0x1E0C9D820];
          v100 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          if (v98)
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D74D98]);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D74D88]);
            v102 = objc_claimAutoreleasedReturnValue();
            v103 = (void *)v102;
            if (v101 && v102)
            {
              objc_msgSend(v101, "floatValue");
              v99 = v104;
              objc_msgSend(v103, "floatValue");
              v100 = v105;
            }

          }
          objc_msgSend((id)objc_opt_class(), "setAdjustmentsForNewVideo:mainFileMetadata:withAdjustmentsDictionary:cameraAdjustments:renderedContentPath:renderedPosterFramePreviewPath:finalAssetSize:", v10, v186, v97, v98, v178, *(_QWORD *)(a1 + 88), v99, v100);
          if (v10)
          {
            v189 = 0;
            v106 = +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v10, 0, 0, &v189);
            v107 = v189;
            if (!v106)
            {
              PLAssetImportGetLog();
              v108 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf.value) = 138412546;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v10;
                LOWORD(buf.flags) = 2114;
                *(_QWORD *)((char *)&buf.flags + 2) = v107;
                _os_log_impl(&dword_199541000, v108, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %{public}@", (uint8_t *)&buf, 0x16u);
              }

            }
          }

          LOBYTE(v64) = 0;
          v2 = v170;
        }
        v5 = v181;
        goto LABEL_163;
      }
      if (v23)
      {
        v109 = *(_QWORD *)(a1 + 72);
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = v109;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v188;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ did not find asset with uuid %{public}@", (uint8_t *)&buf, 0x16u);
      }

    }
    if (v20)
    {
      objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset imageAssetsForMediaGroupUUID:moc:](PLManagedAsset, "imageAssetsForMediaGroupUUID:moc:", v20, v110);
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "firstObject");
      v21 = objc_claimAutoreleasedReturnValue();

      PLAssetImportGetLog();
      v112 = objc_claimAutoreleasedReturnValue();
      v113 = os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v113)
        {
          v114 = *(_QWORD *)(a1 + 72);
          -[NSObject objectID](v21, "objectID");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject uuid](v21, "uuid");
          v116 = (__CFString *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.value) = 138544130;
          *(CMTimeValue *)((char *)&buf.value + 4) = v114;
          LOWORD(buf.flags) = 2114;
          *(_QWORD *)((char *)&buf.flags + 2) = v115;
          HIWORD(buf.epoch) = 2114;
          v199 = v116;
          v200 = 2114;
          v201 = v185;
          _os_log_impl(&dword_199541000, v112, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ found asset %{public}@/%{public}@ with media group UUID %{public}@", (uint8_t *)&buf, 0x2Au);

        }
        v171 = 0;
        v182 = 0;
        v173 = 0;
        goto LABEL_190;
      }
      if (v113)
      {
        v148 = *(_QWORD *)(a1 + 72);
        LODWORD(buf.value) = 138543618;
        *(CMTimeValue *)((char *)&buf.value + 4) = v148;
        LOWORD(buf.flags) = 2114;
        *(_QWORD *)((char *)&buf.flags + 2) = v20;
        _os_log_impl(&dword_199541000, v112, OS_LOG_TYPE_DEFAULT, "photoIris video job %{public}@ did not find asset with media group UUID %{public}@", (uint8_t *)&buf, 0x16u);
      }

    }
    v21 = 0;
    if ((objc_msgSend(*(id *)(a1 + 64), "_retryPairedVideoJob:pairingType:pairingIdentifier:retryMax:", *(_QWORD *)(a1 + 32), CFSTR("live-photo"), v188, 22) & 1) != 0)
    {
      v147 = 0;
      v10 = 0;
      goto LABEL_182;
    }
    v171 = 0;
    v173 = 0;
    v182 = 0;
    goto LABEL_190;
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "length"))
  {
LABEL_15:
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", 0, CFSTR("kPLImageWriterVideoJobWillRetryKey"));
    goto LABEL_16;
  }
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

    v2 = v12;
LABEL_14:

    goto LABEL_15;
  }
  if ((objc_msgSend(*(id *)(a1 + 64), "_retryPairedVideoJob:pairingType:pairingIdentifier:retryMax:", *(_QWORD *)(a1 + 32), CFSTR("timelapse"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), 8) & 1) == 0)goto LABEL_14;
LABEL_8:
  v10 = 0;
LABEL_183:

}

void __45__PLImageWriter__processVideoJob_completion___block_invoke_308(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint32_t v33;
  uint64_t v34;
  char v35;
  id v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  const char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint32_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  const __CFString *v49;
  uint64_t v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v48 = 0;
    v5 = objc_msgSend(v2, "removeItemAtPath:error:", v4, &v48);
    v6 = v48;
    if ((v5 & 1) != 0)
    {
      if (!*(_QWORD *)(a1 + 40))
      {
LABEL_10:
        v14 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_removeInProgressExtendedAttributesForFileAtURL:", v15);

        goto LABEL_11;
      }
      PLAssetImportGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v52 = v8;
        v9 = "#### deleted %@";
        v10 = v7;
        v11 = OS_LOG_TYPE_DEBUG;
        v12 = 12;
LABEL_8:
        _os_log_impl(&dword_199541000, v10, v11, v9, buf, v12);
      }
    }
    else
    {
      PLAssetImportGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v13 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v52 = v13;
        v53 = 2112;
        v54 = v6;
        v9 = "Failed to delete incoming video %@ : %@";
        v10 = v7;
        v11 = OS_LOG_TYPE_ERROR;
        v12 = 22;
        goto LABEL_8;
      }
    }

    goto LABEL_10;
  }
LABEL_11:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
    v49 = CFSTR("PLLimitedLibraryFetchFiltersUpdatedNotificationApplicationIdentifier");
    v50 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:userInfo:", CFSTR("PLLimitedLibraryFetchFiltersUpdatedNotification"), v17, v19);

  }
  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
  {
    v47 = 0;
    v21 = objc_msgSend(v3, "removeItemAtPath:error:", v20, &v47);
    v22 = v47;
    if ((v21 & 1) == 0)
    {
      PLAssetImportGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138412546;
        v52 = v24;
        v53 = 2112;
        v54 = v22;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to delete incoming camera metadata %@ : %@", buf, 0x16u);
      }

    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 64), "objectForKey:", *MEMORY[0x1E0D74D80]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    v26 = objc_msgSend(v3, "removeItemAtPath:error:", v25, &v46);
    v27 = v46;
    PLAssetImportGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if ((v26 & 1) != 0)
    {
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v25;
        v30 = "#### deleted %@";
        v31 = v29;
        v32 = OS_LOG_TYPE_DEBUG;
        v33 = 12;
LABEL_25:
        _os_log_impl(&dword_199541000, v31, v32, v30, buf, v33);
      }
    }
    else if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v52 = v25;
      v53 = 2112;
      v54 = v27;
      v30 = "Failed to delete incoming filtered video %@ : %@";
      v31 = v29;
      v32 = OS_LOG_TYPE_ERROR;
      v33 = 22;
      goto LABEL_25;
    }

  }
  if (*(_QWORD *)(a1 + 72) && objc_msgSend(v3, "fileExistsAtPath:"))
  {
    v34 = *(_QWORD *)(a1 + 72);
    v45 = 0;
    v35 = objc_msgSend(v3, "removeItemAtPath:error:", v34, &v45);
    v36 = v45;
    PLAssetImportGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if ((v35 & 1) != 0)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v39 = *(void **)(a1 + 72);
        *(_DWORD *)buf = 138412290;
        v52 = v39;
        v40 = "#### deleted %@";
        v41 = v38;
        v42 = OS_LOG_TYPE_DEBUG;
        v43 = 12;
LABEL_34:
        _os_log_impl(&dword_199541000, v41, v42, v40, buf, v43);
      }
    }
    else if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v44 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138412546;
      v52 = v44;
      v53 = 2112;
      v54 = v36;
      v40 = "Failed to delete incoming filtered video preview %@ : %@";
      v41 = v38;
      v42 = OS_LOG_TYPE_ERROR;
      v43 = 22;
      goto LABEL_34;
    }

  }
  objc_msgSend(*(id *)(a1 + 48), "_removeTransientKeys:", *(_QWORD *)(a1 + 64));
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "_decrementJobCount:", *(_QWORD *)(a1 + 64));

}

uint64_t __77__PLImageWriter__retryPairedVideoJob_pairingType_pairingIdentifier_retryMax___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLAssetImportGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v8 = 138544130;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    v12 = 2114;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] re-enqueing %{public}@ recovery job %{public}@ with pairing identifier (uuid) %{public}@", (uint8_t *)&v8, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 56), "enqueueJob:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 56), "_decrementJobCount:", *(_QWORD *)(a1 + 40));
}

uint64_t __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLAssetImportGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0D74DB0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] re-enqueing crash recovery job %{public}@ (#%{public}@)", (uint8_t *)&v7, 0x20u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "enqueueJob:", *(_QWORD *)(a1 + 32));
}

void __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke_269(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  char v32;
  id v33;
  NSObject *v34;
  void *v35;
  __int128 v36;
  id obj;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLAssetImportGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v53 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Deleting %{public}@", buf, 0xCu);
  }

  v49 = 0u;
  v50 = 0u;
  v48 = 0u;
  v47 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v6)
  {
    v8 = v6;
    v38 = *(_QWORD *)v48;
    *(_QWORD *)&v7 = 138543618;
    v36 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v48 != v38)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v10, "mainFileURL", v36);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(a1 + 40);
        v46 = 0;
        v14 = objc_msgSend(v13, "removeItemAtURL:error:", v12, &v46);
        v15 = v46;
        if ((v14 & 1) == 0)
        {
          PLAssetImportGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "path");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v36;
            v53 = v17;
            v54 = 2112;
            v55 = v15;
            _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "##### RECOVER: Failed to remove asset source URL:%{public}@ %@", buf, 0x16u);

          }
        }
        v18 = *(void **)(a1 + 40);
        objc_msgSend(v12, "URLByDeletingPathExtension");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "URLByAppendingPathExtension:", CFSTR("plist"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeItemAtURL:error:", v20, 0);

        objc_msgSend(*(id *)(a1 + 48), "_removeInProgressExtendedAttributesForFileAtURL:", v11);
        if (objc_msgSend(v10, "hasDeferredProcessingPreviewFile"))
        {
          v21 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v10, "pathForDeferredProcessingPreviewFile");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "fileURLWithPath:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 48), "_removeInProgressExtendedAttributesForFileAtURL:", v23);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v8);
  }

  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke_270;
  v44[3] = &unk_1E3661510;
  v24 = *(void **)(a1 + 32);
  v45 = *(id *)(a1 + 40);
  objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v44);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v25 = *(id *)(a1 + 56);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
        if (objc_msgSend(*(id *)(a1 + 40), "fileExistsAtPath:", v30))
        {
          v31 = *(void **)(a1 + 40);
          v39 = 0;
          v32 = objc_msgSend(v31, "removeItemAtPath:error:", v30, &v39);
          v33 = v39;
          if ((v32 & 1) == 0)
          {
            PLAssetImportGetLog();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v33, "localizedDescription");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v53 = v30;
              v54 = 2114;
              v55 = v35;
              _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Failed to unlink file at path %{public}@: %{public}@", buf, 0x16u);

            }
          }

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v40, v51, 16);
    }
    while (v27);
  }

  objc_msgSend(*(id *)(a1 + 48), "_handleAvalancheCrashRecovery:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "_handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles:", *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 48), "_handlePhotoIrisCrashRecoveryForVideos:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 48), "_handleCameraAdjustments:fullsizeRenders:largeThumbnails:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 48), "_handleCameraMetadataCrashRecovery:", *(_QWORD *)(a1 + 112));
  (*(void (**)(void))(*(_QWORD *)(a1 + 128) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "_decrementJobCount:", *(_QWORD *)(a1 + 120));

}

void __53__PLImageWriter__processCrashRecoveryJob_completion___block_invoke_270(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v16 = 0;
  v8 = objc_msgSend(v7, "removeItemAtURL:error:", v6, &v16);
  v9 = v16;
  if ((v8 & 1) == 0)
  {
    PLAssetImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "##### RECOVER: Failed to remove URL %{public}@, registered to unlink by recovery URL:%{public}@ %@", buf, 0x20u);

    }
  }
  v13 = *(void **)(a1 + 32);
  objc_msgSend(v6, "URLByDeletingPathExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathExtension:", CFSTR("plist"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeItemAtURL:error:", v15, 0);

}

void __69__PLImageWriter__handlePhotoIrisCrashRecoveryForPhotoIndicatorFiles___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        +[PLImageWriter photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:](PLImageWriter, "photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:", 0, *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0, *(_QWORD *)(a1 + 40), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __74__PLImageWriter__handleCameraAdjustments_fullsizeRenders_largeThumbnails___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v2)
  {
    v3 = v2;
    v19 = *(_QWORD *)v22;
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9
          || (objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7),
              (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          objc_msgSend(*(id *)(a1 + 56), "removeObject:", v9);
        }
        objc_msgSend(*(id *)(a1 + 64), "removeObject:", v8);
        +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v7, *(_QWORD *)(a1 + 72));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PLAssetImportGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446978;
            v26 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]_block_invoke";
            v27 = 2114;
            v28 = v7;
            v29 = 2114;
            v30 = v9;
            v31 = 2114;
            v32 = v8;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s Applying render & adjustment to asset %{public}@ (%{public}@, %{public}@)", buf, 0x2Au);
          }

          LOBYTE(v17) = 1;
          if ((objc_msgSend((id)objc_opt_class(), "setAdjustmentsForNewPhoto:mainFileMetadata:cameraAdjustmentData:adjustmentDataPath:filteredImagePath:cameraMetadata:finalAssetSize:isSubstandardRender:", v10, 0, 0, v8, v9, 0, v4, v5, v17) & 1) == 0)
          {
            PLAssetImportGetLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446466;
              v26 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]_block_invoke";
              v27 = 2114;
              v28 = v7;
              _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "%{public}s Failed to apply adjustment to asset %{public}@", buf, 0x16u);
            }

          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          v15 = objc_msgSend(v14, "removeItemAtPath:error:", v8, &v20);
          v12 = v20;

          if ((v15 & 1) == 0)
          {
            PLAssetImportGetLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446722;
              v26 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]_block_invoke";
              v27 = 2114;
              v28 = v8;
              v29 = 2114;
              v30 = v7;
              _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "%{public}s Failed to remove adjustment path %{public}@ for asset %{public}@", buf, 0x20u);
            }

          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v26 = "-[PLImageWriter _handleCameraAdjustments:fullsizeRenders:largeThumbnails:]_block_invoke";
          v27 = 2114;
          v28 = v7;
          v29 = 2114;
          v30 = v9;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "%{public}s Failed to find required, preflighted asset with UUID %{public}@, deferring orphaned render ingestion for %{public}@", buf, 0x20u);
        }

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v3);
  }

}

void __56__PLImageWriter__handlePhotoIrisCrashRecoveryForVideos___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFAllocator *v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  const __CFAllocator *v11;
  void *v12;
  void *v13;
  CFDictionaryRef v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFAllocator *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const __CFDictionary *v39;
  const __CFDictionary *v40;
  void *v41;
  CMTime v42;
  CMTime time;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v1 = a1;
  v55 = *MEMORY[0x1E0C80C00];
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = *(id *)(a1 + 32);
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
  if (v37)
  {
    v36 = *(_QWORD *)v45;
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v35 = (void *)*MEMORY[0x1E0D74E20];
    v32 = *MEMORY[0x1E0D74DB8];
    v31 = *MEMORY[0x1E0D74F30];
    v30 = *MEMORY[0x1E0D74E88];
    v29 = *MEMORY[0x1E0D74EA8];
    v28 = *MEMORY[0x1E0D74EB8];
    v27 = *MEMORY[0x1E0D74EB0];
    v33 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v34 = v1;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        PFVideoComplementMetadataForVideoAtPath();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "pairingIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v5;
        if (v5)
        {
          objc_msgSend(v5, "videoDuration");
          v7 = CMTimeCopyAsDictionary(&time, v2);
          objc_msgSend(v5, "imageDisplayTime");
        }
        else
        {
          memset(&time, 0, sizeof(time));
          v7 = CMTimeCopyAsDictionary(&time, v2);
          memset(&v42, 0, sizeof(v42));
        }
        v8 = CMTimeCopyAsDictionary(&v42, v2);
        objc_msgSend(*(id *)(v1 + 40), "managedObjectContext");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset imageAssetsForMediaGroupUUID:moc:](PLManagedAsset, "imageAssetsForMediaGroupUUID:moc:", v6, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "firstObject");
        v11 = v2;
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v12;
        if (v12)
        {
          v38 = v12;
          objc_msgSend(v12, "uuid");
          v14 = v7;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, v32);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v4, v31);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v30);
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, v29);
          v40 = v14;
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v28);
          v39 = v8;
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, v27);
          v17 = (void *)objc_opt_class();
          objc_msgSend(v4, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_assetUUIDFromIncomingFilename:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          v20 = v41;
          if (!v19)
          {
            PLAssetImportGetLog();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v49 = v4;
              _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Encountered malformed incoming photo iris filename with path %{public}@, ignoring", buf, 0xCu);
            }

          }
          PLAssetImportGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v49 = v4;
            v50 = 2114;
            v51 = v6;
            v52 = 2114;
            v53 = v15;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "##### RECOVER: enqueue job for photoIris video %{public}@, mediaGroupUUID %{public}@, assetUUID %{public}@", buf, 0x20u);
          }

          PLAssetImportGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          v1 = v34;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            NSStringFromSelector(*(SEL *)(v34 + 64));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v49 = v24;
            v50 = 2114;
            v51 = v35;
            v52 = 2114;
            v53 = v15;
            _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing recovery job %{public}@ with assetUUID %{public}@", buf, 0x20u);

          }
          objc_msgSend(*(id *)(v34 + 48), "enqueueJob:", v16);

          v2 = v33;
          v8 = v39;
          v7 = v40;
          v13 = v38;
        }
        else
        {
          PLAssetImportGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v49 = v4;
            _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Found orphaned incoming photo iris video: %{public}@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(v1 + 56), "addObject:", v4);
          v2 = v11;
          v20 = v41;
        }

      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    }
    while (v37);
  }

}

void __56__PLImageWriter__handlePhotoIrisCrashRecoveryForVideos___block_invoke_239(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v1 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    v19 = *MEMORY[0x1E0D74E20];
    v5 = *MEMORY[0x1E0D74DB8];
    v6 = *MEMORY[0x1E0D74F30];
    v7 = 0x1E0C99000uLL;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v10 = objc_alloc_init(*(Class *)(v7 + 3592));
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v5);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);
        PLAssetImportGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(*(SEL *)(v1 + 48));
          v12 = v1;
          v13 = v3;
          v14 = v6;
          v15 = v5;
          v16 = v4;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v25 = v17;
          v26 = 2114;
          v27 = v19;
          v28 = 2114;
          v29 = v9;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing recovery job %{public}@ with orphaned iris video %{public}@", buf, 0x20u);

          v4 = v16;
          v5 = v15;
          v6 = v14;
          v3 = v13;
          v1 = v12;
          v7 = 0x1E0C99000;
        }

        objc_msgSend(*(id *)(v1 + 40), "enqueueJob:", v10);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v3);
  }

}

void __52__PLImageWriter__handleCameraMetadataCrashRecovery___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  PLIngestJobCameraMetadata *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = *(id *)(a1 + 32);
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v4 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v3, "lastPathComponent");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_assetUUIDFromIncomingFilename:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "length"))
        {
          +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v6, *(_QWORD *)(a1 + 48));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (v7
            && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
                v8 = (void *)objc_claimAutoreleasedReturnValue(),
                v9 = objc_msgSend(v8, "fileExistsAtPath:", v3),
                v8,
                v9))
          {
            PLAssetImportGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v37 = v3;
              v38 = 2112;
              v39 = v6;
              _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Handling camera metadata %@ -> %@", buf, 0x16u);
            }

            v11 = -[PLIngestJobCameraMetadata initWithCameraMetadataPath:]([PLIngestJobCameraMetadata alloc], "initWithCameraMetadataPath:", v3);
            -[PLIngestJobCameraMetadata applyCameraMetadataToAsset:](v11, "applyCameraMetadataToAsset:", v7);
            objc_msgSend(v7, "additionalAttributes");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "deferredProcessingCandidateOptions");

            if ((v13 & 8) != 0)
            {
              v14 = (void *)MEMORY[0x1E0D75260];
              -[PLIngestJobCameraMetadata cameraMetadata](v11, "cameraMetadata");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "semanticEnhanceSceneForCameraMetadata:", v15);
              v18 = v17;

              -[PLIngestJobCameraMetadata cameraMetadata](v11, "cameraMetadata");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setSemanticEnhanceScene:", v16);

              -[PLIngestJobCameraMetadata cameraMetadata](v11, "cameraMetadata");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setSemanticEnhanceSceneConfidence:", v18);

              v21 = (void *)MEMORY[0x1E0C99E98];
              objc_msgSend(v7, "pathForCameraMetadataFile");
              v22 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "fileURLWithPath:", v22);
              v23 = objc_claimAutoreleasedReturnValue();

              v24 = *(void **)(a1 + 40);
              v31 = 0;
              v27 = (void *)v23;
              LOBYTE(v22) = objc_msgSend(v24, "_writeOutCameraMetadata:destinationURL:error:", v11, v23, &v31);
              v25 = v31;
              if ((v22 & 1) == 0)
              {
                PLAssetImportGetLog();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v37 = v25;
                  _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Error writing out camera metadata: %@", buf, 0xCu);
                }

              }
            }
          }
          else
          {
            PLAssetImportGetLog();
            v11 = (PLIngestJobCameraMetadata *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v3;
              _os_log_impl(&dword_199541000, &v11->super, OS_LOG_TYPE_DEFAULT, "##### RECOVER: MDATA file no longer found: %@", buf, 0xCu);
            }
          }

        }
        unlink((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"));

        objc_autoreleasePoolPop(v4);
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v30);
  }

}

void __47__PLImageWriter__handleAvalancheCrashRecovery___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _UNKNOWN **v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v1 = a1;
  v29 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v21;
    v5 = &off_1E3659000;
    do
    {
      v6 = 0;
      v18 = v3;
      do
      {
        if (*(_QWORD *)v21 != v4)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v7, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByDeletingPathExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
        {
          v11 = (void *)objc_msgSend(objc_alloc((Class)v5[126]), "initWithUUID:photoLibrary:", v10, *(_QWORD *)(v1 + 40));
          PLAssetImportGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "assets");
            v13 = v4;
            v14 = v1;
            v15 = v5;
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");
            *(_DWORD *)buf = 138412546;
            v25 = v10;
            v26 = 2048;
            v27 = v17;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "##### RECOVER: Handling avalanche %@ -> %lu", buf, 0x16u);

            v5 = v15;
            v1 = v14;
            v4 = v13;
            v3 = v18;
          }

          objc_msgSend(v11, "applyChangesAndDeleteNonPicks:currentContainer:completionHandler:", 0, 0, 0);
        }
        unlink((const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"));

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v3);
  }

}

void __58__PLImageWriter__processSyncClientSaveJobsJob_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = -[PLSyncSaveJob initFromSerializedData:]([PLSyncSaveJob alloc], "initFromSerializedData:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7));
        objc_msgSend(a1[5], "processSyncSaveJob:library:albumMap:", v8, a1[6], v2);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v2, "allValues", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        objc_msgSend(a1[6], "pathManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "persistMetadataToFileSystemWithPathManager:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v11);
  }

}

uint64_t __58__PLImageWriter__processSyncClientSaveJobsJob_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_decrementJobCount:", *(_QWORD *)(a1 + 40));
}

uint64_t __65__PLImageWriter_cleanupFilesInLibrary_afteriTunesSyncBeforeDate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "countForFetchRequest:error:", *(_QWORD *)(a1 + 40), 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __53__PLImageWriter_processSyncSaveJob_library_albumMap___block_invoke(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  PLSyncGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v23 = 138412546;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "[face processing] asset %@ before: %@", (uint8_t *)&v23, 0x16u);

  }
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "addLegacyFaceWithRelativeRect:identifier:albumUUID:", a2, v13, a4, a5, a6, a7);
  PLSyncGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v23 = 138412546;
    v24 = v19;
    v25 = 2112;
    v26 = v20;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "[face processing] asset %@ after: %@", (uint8_t *)&v23, 0x16u);

  }
  PLSyncGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "legacyFaces");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412290;
    v24 = v22;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "[face processing] legacyFaces: %@", (uint8_t *)&v23, 0xCu);

  }
}

uint64_t __50__PLImageWriter__enablePhotoStreamJob_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLMyPhotoStreamGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "ignoring request to enable Photo Stream since no stream ID was found", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__PLImageWriter__processDeletePhotoStreamDataJob_withReason_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_decrementJobCount:", *(_QWORD *)(a1 + 40));
}

void __60__PLImageWriter__processAutodeleteEmptyAlbumJob_completion___block_invoke(uint64_t a1)
{
  void *v2;
  char isKindOfClass;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "existingObjectWithID:error:", *(_QWORD *)(a1 + 40), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v8;
    if ((objc_msgSend(v5, "isDeleted") & 1) == 0)
    {
      objc_msgSend(v5, "assets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (!v7)
      {
        objc_msgSend(*(id *)(a1 + 32), "resetCachedImportAlbumsIfNeededForAlbum:", v5);
        objc_msgSend(v5, "delete");
      }
    }

    v4 = v8;
  }

}

uint64_t __60__PLImageWriter__processAutodeleteEmptyAlbumJob_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_decrementJobCount:", *(_QWORD *)(a1 + 40));
}

void __60__PLImageWriter__processAvalanchesValidationJob_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1[4], "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v2, CFSTR("avalancheStackAssetMap"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a1[4];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        objc_msgSend(a1[6], "managedObjectContext", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLAvalanche assetsWithAvalancheUUID:inManagedObjectContext:](PLAvalanche, "assetsWithAvalancheUUID:inManagedObjectContext:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v10, "count") >= 2
          && !+[PLAvalanche isValidBurstWithAssets:](PLAvalanche, "isValidBurstWithAssets:", v10))
        {
          +[PLAvalanche revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:](PLAvalanche, "revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:", v10, a1[6], 0, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, v8);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void __49__PLImageWriter__processAvalancheJob_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PLAvalanche *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 2)
  {
    v2 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAvalanche assetsWithAvalancheUUID:inManagedObjectContext:](PLAvalanche, "assetsWithAvalancheUUID:inManagedObjectContext:", v2, v3);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", *(_QWORD *)(a1 + 56), 3, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v16);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = 1;
    v8 = +[PLAvalanche updatePropertiesForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:setFirstPick:allowDissolve:](PLAvalanche, "updatePropertiesForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:setFirstPick:allowDissolve:", v6, v7, v5, 0, 0, 1, v15);

    v9 = -[PLAvalanche initWithUUID:photoLibrary:]([PLAvalanche alloc], "initWithUUID:photoLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    -[PLAvalanche stackAsset](v9, "stackAsset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "generateLargeThumbnailFileIfNecessary");

    -[PLAvalanche assets](v9, "assets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAvalanche autoPicks](v9, "autoPicks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAvalanche stackAsset](v9, "stackAsset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAvalanche userFavorites](v9, "userFavorites");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAvalanche updateMembershipForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:allowDissolve:inLibrary:](PLAvalanche, "updateMembershipForAssets:autoPicks:stackAsset:userFavorites:deleteNonPicks:allowDissolve:inLibrary:", v11, v12, v13, v14, 0, 1, *(_QWORD *)(a1 + 48));

  }
}

void __60__PLImageWriter__processBatchImageJob_inLibrary_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = MEMORY[0x1E0C9AAB0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x19AEC1554](v3);
        objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("imagejob_transient_save_transaction"), (_QWORD)v10);
        objc_msgSend(*(id *)(a1 + 40), "_processImageJob:inLibrary:completion:", v8, *(_QWORD *)(a1 + 48), &__block_literal_global_206);
        objc_msgSend(v8, "removeObjectForKey:", CFSTR("imagejob_transient_save_transaction"));
        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v4 != v7);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v4 = v3;
    }
    while (v3);
  }

}

void __60__PLImageWriter__processBatchImageJob_inLibrary_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("imagejob_transient_batch_transaction_key"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(v9, "objectForKey:", CFSTR("imagejob_transient_transaction_block"));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v11)
          (*(void (**)(uint64_t))(v11 + 16))(v11);
        objc_msgSend(v9, "removeObjectForKey:", CFSTR("imagejob_transient_transaction_block"));

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "removeObjectForKey:", CFSTR("imagejob_transient_batch_transaction_key"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = *(id *)(a1 + 40);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v17);
        v19 = (void *)MEMORY[0x19AEC1554](v14);
        objc_msgSend(v18, "objectForKey:", CFSTR("imagejob_transient_transaction_completion_block"), (_QWORD)v22);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          (*(void (**)(uint64_t))(v20 + 16))(v20);
        objc_msgSend(v18, "removeObjectForKey:", CFSTR("imagejob_transient_transaction_completion_block"));

        objc_autoreleasePoolPop(v19);
        ++v17;
      }
      while (v15 != v17);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      v15 = v14;
    }
    while (v14);
  }

}

void __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "assetWithUUID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[ProcessImageJob]We failed to create the finalized image data, so now we remove the in-flight asset."));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteWithReason:", v1);

}

uint64_t __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeTransientKeys:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_3(id *a1)
{
  id v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_4;
  v3[3] = &unk_1E3677530;
  v2 = a1[4];
  v4 = a1[5];
  v5 = a1[4];
  v6 = a1[6];
  objc_msgSend(v2, "performTransaction:", v3);

}

void __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_5(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL IsApproximatelyEqual;
  void *v27;
  int v28;
  int v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id *v37;
  char v38;
  id v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  void *v44;
  float v45;
  float v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  __int16 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  NSObject *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  BOOL v83;
  id v84;
  uint64_t v85;
  NSObject *v86;
  void *v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  id v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, *MEMORY[0x1E0D74CC8]);
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, *MEMORY[0x1E0D74CC0]);
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0D74E58]);
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", v7, *MEMORY[0x1E0D74D18]);
  v8 = *(_QWORD *)(a1 + 64);
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("ImportedBy"));
  objc_msgSend(*(id *)(a1 + 72), "objectForKey:", *MEMORY[0x1E0CBCB50]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CBCB30]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = &unk_1E375D6E0;
  if (v10)
    v12 = (void *)v10;
  v13 = v12;

  objc_msgSend(v3, "setObject:forKey:", v13, *MEMORY[0x1E0D74D48]);
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 88), "assetWithUUID:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14
      && objc_msgSend(v14, "isPhotoStreamPhoto")
      && objc_msgSend(v15, "visibilityState") != 2)
    {
      objc_msgSend(v15, "setVisibilityState:", 2);
      objc_msgSend(v15, "publicGlobalUUID");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v102 = 0;
    }

  }
  else
  {
    v102 = 0;
  }
  v16 = objc_alloc(MEMORY[0x1E0D75140]);
  v17 = *(_QWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 88), "libraryBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeZoneLookup");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithImageURL:contentType:options:timeZoneLookup:cacheImageSource:cacheImageData:", v17, 0, 12, v19, 1, 1);

  if (*(_BYTE *)(a1 + 290))
    v21 = *(_QWORD *)(a1 + 96);
  else
    v21 = 0;
  LOBYTE(v100) = 0;
  LOBYTE(v99) = *(_BYTE *)(a1 + 290) != 0;
  objc_msgSend(*(id *)(a1 + 88), "addDCIMEntryAtFileURL:mainFileMetadata:previewImage:thumbnailImage:savedAssetType:replacementUUID:publicGlobalUUID:extendedInfo:withUUID:isPlaceholder:placeholderFileURL:forFinalCameraImage:", *(_QWORD *)(a1 + 104), v20, *(_QWORD *)(a1 + 112), 0, *(__int16 *)(a1 + 288), *(_QWORD *)(a1 + 120), v102, v3, *(_QWORD *)(a1 + 128), v99, v21, v100);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v24 = *(void **)(a1 + 136);
  if (v24)
  {
    objc_msgSend(v22, "dateCreated");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    IsApproximatelyEqual = PLDateIsApproximatelyEqual(v24, v25, 0.001);

    if (!IsApproximatelyEqual)
    {
      objc_msgSend(v23, "didSetCustomDateCreated");
      objc_msgSend(v23, "setDateCreated:", *(_QWORD *)(a1 + 136));
    }
    objc_msgSend(*(id *)(a1 + 136), "timeIntervalSinceReferenceDate");
    objc_msgSend(v23, "setSortToken:");
  }
  if (*(_BYTE *)(a1 + 291))
    objc_msgSend(v23, "setKindSubtype:", 2);
  v27 = *(void **)(a1 + 144);
  if (v27 && *(_QWORD *)(a1 + 152))
  {
    objc_msgSend(v23, "setWidth:", objc_msgSend(v27, "longLongValue"));
    objc_msgSend(v23, "setHeight:", objc_msgSend(*(id *)(a1 + 152), "longLongValue"));
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40))
  {
    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 40)
        ? objc_msgSend(*(id *)(a1 + 160), "fileExistsAtPath:")
        : 0;
    v29 = *(_QWORD *)(a1 + 168) ? objc_msgSend(*(id *)(a1 + 160), "fileExistsAtPath:") : 0;
    if (((v28 | v29) & 1) == 0)
    {
      v30 = *(void **)(a1 + 176);
      v31 = *(_QWORD *)(a1 + 184);
      v32 = *(_QWORD *)(a1 + 112);
      objc_msgSend(*(id *)(a1 + 96), "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "writeFilteredPreviewWithImageData:orImage:toPathWithBaseName:", v31, v32, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v35)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 40), v35);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 248) + 8) + 24) = 1;
      }

    }
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40)
    || (v54 = *(_QWORD *)(a1 + 192)) != 0
    && objc_msgSend(*(id *)(a1 + 160), "fileExistsAtPath:isDirectory:", v54, 0))
  {
    v37 = (id *)(a1 + 168);
    v36 = *(_QWORD *)(a1 + 168);
    if (v36 && (objc_msgSend(*(id *)(a1 + 160), "fileExistsAtPath:isDirectory:", v36, 0) & 1) != 0)
    {
      v38 = 0;
    }
    else
    {
      v37 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 240) + 8) + 40);
      v38 = 1;
    }
    v39 = *v37;
    v40 = *MEMORY[0x1E0C9D820];
    v41 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 200), "objectForKeyedSubscript:", *MEMORY[0x1E0D74D98]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 200), "objectForKeyedSubscript:", *MEMORY[0x1E0D74D88]);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v43;
      if (v42 && v43)
      {
        objc_msgSend(v42, "floatValue");
        v40 = v45;
        objc_msgSend(v44, "floatValue");
        v41 = v46;
      }

    }
    v47 = (void *)objc_opt_class();
    v48 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40);
    v49 = *(_QWORD *)(a1 + 192);
    objc_msgSend(*(id *)(a1 + 208), "cameraMetadata");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v98) = v38;
    objc_msgSend(v47, "setAdjustmentsForNewPhoto:mainFileMetadata:cameraAdjustmentData:adjustmentDataPath:filteredImagePath:cameraMetadata:finalAssetSize:isSubstandardRender:", v23, v20, v48, v49, v39, v50, v40, v41, v98);

  }
  if (*(_QWORD *)(a1 + 216))
  {
    objc_msgSend(v23, "setAvalancheUUID:");
    objc_msgSend(*(id *)(a1 + 200), "objectForKey:", *MEMORY[0x1E0D74D00]);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
      v53 = objc_msgSend(v51, "intValue");
    else
      v53 = 2;
    objc_msgSend(v23, "setAvalanchePickType:", v53);
    if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks"))
    {
      objc_msgSend(*(id *)(a1 + 200), "objectForKey:", *MEMORY[0x1E0D74D10]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      if (v55)
        v57 = objc_msgSend(v55, "intValue");
      else
        v57 = 2;
      objc_msgSend(v23, "setVisibilityState:", v57);

    }
  }
  objc_msgSend(v23, "avalancheUUID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (v58)
  {
    objc_msgSend(v23, "avalancheUUID");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 88), "managedObjectContext");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLAvalanche assetsWithAvalancheUUID:inManagedObjectContext:](PLAvalanche, "assetsWithAvalancheUUID:inManagedObjectContext:", v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = +[PLAvalanche revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:](PLAvalanche, "revalidateAvalancheAssets:inLibrary:deleteNonPicks:allowDissolve:", v61, *(_QWORD *)(a1 + 88), 0, 1);
  }
  objc_msgSend(*(id *)(a1 + 200), "objectForKey:", *MEMORY[0x1E0D74CB0]);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v63)
    objc_msgSend(v23, "updateAssetKindAndPlaybackStyleIfNeededWithKind:", (__int16)objc_msgSend(v63, "intValue"));
  objc_msgSend(*(id *)(a1 + 200), "objectForKey:", *MEMORY[0x1E0D74CA8]);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
    objc_msgSend(v23, "setKindSubtype:", (__int16)objc_msgSend(v65, "intValue"));
  v67 = *(void **)(a1 + 208);
  if (v67)
    objc_msgSend(v67, "applyCameraMetadataToAsset:", v23);
  v68 = *(_QWORD *)(a1 + 224);
  if (v68)
  {
    objc_msgSend(v23, "additionalAttributes");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "setDeferredPhotoIdentifier:", *(_QWORD *)(a1 + 224));

    if (objc_msgSend(v20, "isDeferredPhotoProxyExpectingDepth"))
    {
      objc_msgSend(v23, "setDepthType:", 1);
      objc_msgSend(v23, "setEditableDepthBadgeAttribute:", 1);
    }
    objc_msgSend(*(id *)(a1 + 88), "constraintsDirector");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "informPhotoCapturedThatNeedsDeferredProcessing");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 88), "constraintsDirector");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "informPhotoCapturedThatNeedsQuickFace");
  }

  if (objc_msgSend((id)objc_opt_class(), "semanticEnhanceSceneIsValid:", *(_QWORD *)(a1 + 272)))
  {
    if (!*(_QWORD *)(a1 + 224))
      objc_msgSend(v23, "setDeferredProcessingNeeded:", 10);
    objc_msgSend(v23, "additionalAttributes");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "setDeferredProcessingCandidateOptions:", objc_msgSend(v71, "deferredProcessingCandidateOptions") | 8);

  }
  else if (!v68)
  {
    goto LABEL_98;
  }
  if (*(_QWORD *)(a1 + 224))
    objc_msgSend(v23, "setDeferredProcessingNeeded:", 1);
  v72 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 232) + 8) + 40);
  if (v72)
  {
    v104 = 0;
    objc_msgSend(MEMORY[0x1E0D750C0], "deserializedAdjustmentsFromData:error:", v72, &v104);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v104;
    if (v73)
    {
      if (!objc_msgSend(v73, "canBeRenderedByCapturePipelineWithVideoComplement:deferredIdentifier:", objc_msgSend(v23, "kindSubtype") == 2, *(_QWORD *)(a1 + 224)))
      {
LABEL_96:

        goto LABEL_97;
      }
      v101 = v3;
      v75 = v20;
      PLAssetImportGetLog();
      v76 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v23, "uuid");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v106 = v77;
        _os_log_impl(&dword_199541000, v76, OS_LOG_TYPE_DEFAULT, "Deferred capture will have render delivered by deferredmediad for asset: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v23, "additionalAttributes");
      v78 = objc_claimAutoreleasedReturnValue();
      -[NSObject setDeferredProcessingCandidateOptions:](v78, "setDeferredProcessingCandidateOptions:", 16);
    }
    else
    {
      v101 = v3;
      v75 = v20;
      PLAssetImportGetLog();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v23, "uuid");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v106 = v79;
        v107 = 2112;
        v108 = v74;
        _os_log_impl(&dword_199541000, v78, OS_LOG_TYPE_ERROR, "Failed to deserialize adjustment data for asset: %{public}@ error: %@", buf, 0x16u);

      }
    }

    v20 = v75;
    v3 = v101;
    goto LABEL_96;
  }
LABEL_97:
  +[PLImageWriter _signalBackgroundProcessingNeededForAsset:reason:](PLImageWriter, "_signalBackgroundProcessingNeededForAsset:reason:", v23, CFSTR("needs capture scheduling"));
LABEL_98:
  if (*(_BYTE *)(a1 + 290))
  {
    objc_msgSend(*(id *)(a1 + 200), "objectForKeyedSubscript:", *MEMORY[0x1E0D74D98]);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 200), "objectForKeyedSubscript:", *MEMORY[0x1E0D74D88]);
    v81 = objc_claimAutoreleasedReturnValue();
    v82 = (void *)v81;
    if (v80 && v81)
    {
      objc_msgSend(v23, "setWidth:", objc_msgSend(v80, "longLongValue"));
      objc_msgSend(v23, "setHeight:", objc_msgSend(v82, "longLongValue"));
    }

  }
  if ((objc_msgSend(v23, "isInserted") & 1) == 0
    && objc_msgSend(v23, "isUpdated")
    && objc_msgSend(v23, "avalanchePickType") != 1)
  {
    objc_msgSend(v23, "setNeedsMomentUpdate:", 1);
  }
  if (v23)
  {
    v103 = 0;
    v83 = +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v23, 0, 0, &v103);
    v84 = v103;
    if (v83)
    {
      v85 = objc_msgSend(v23, "expectedDeferredProcessingNeededOnAssetCreation");
      if ((_DWORD)v85)
      {
        objc_msgSend(v23, "setDeferredProcessingNeeded:", v85);
        +[PLImageWriter _signalBackgroundProcessingNeededForAsset:reason:](PLImageWriter, "_signalBackgroundProcessingNeededForAsset:reason:", v23, CFSTR("expected deferred processing on asset creation"));
      }
    }
    else
    {
      PLMyPhotoStreamGetLog();
      v86 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v106 = v23;
        v107 = 2112;
        v108 = v84;
        _os_log_impl(&dword_199541000, v86, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 200), "objectForKey:", CFSTR("job.private.ClientInLimitedLibraryMode"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 200), "objectForKey:", CFSTR("job.private.LimitedLibraryClientFetchFilterIdentifier"));
    v89 = objc_claimAutoreleasedReturnValue();
    v90 = *(_QWORD *)(*(_QWORD *)(a1 + 256) + 8);
    v91 = *(void **)(v90 + 40);
    *(_QWORD *)(v90 + 40) = v89;

    if (v88
      && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 256) + 8) + 40), "length")
      && (objc_msgSend(*(id *)(a1 + 64), "intValue") == 6
       || objc_msgSend(*(id *)(a1 + 64), "intValue") == 9))
    {
      objc_msgSend(*(id *)(a1 + 200), "objectForKey:", CFSTR("job.private.LimitedLibraryClientAuthorization"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = *(void **)(a1 + 176);
      objc_msgSend(v23, "uuid");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "_processLimitedLibraryAdditionIfNeededWithAssetUUID:clientBundleIdentifier:clientAuthorization:library:", v94, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 256) + 8) + 40), v92, *(_QWORD *)(a1 + 88));
      v95 = objc_claimAutoreleasedReturnValue();
      v96 = *(_QWORD *)(*(_QWORD *)(a1 + 264) + 8);
      v97 = *(void **)(v96 + 40);
      *(_QWORD *)(v96 + 40) = v95;

    }
    objc_msgSend(*(id *)(a1 + 200), "setObject:forKey:", v23, CFSTR("PLImageWriterTransientAsset"));
  }

}

void __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_162(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint32_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  char v36;
  id v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  char v53;
  id v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  char v60;
  id v61;
  NSObject *v62;
  void *v63;
  const char *v64;
  NSObject *v65;
  os_log_type_t v66;
  uint32_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  const __CFString *v81;
  uint64_t v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  id v86;
  __int16 v87;
  id v88;
  _QWORD v89[3];

  v89[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("PLImageWriterTransientAsset"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v89[0] = CFSTR("PLImageWriterTransientAsset");
  v89[1] = CFSTR("imagejob_transient_publicGlobalUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsForKeys:", v4);

  objc_msgSend(v2, "assetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_QWORD *)(a1 + 40) || !*(_QWORD *)(a1 + 48))
  {
    v16 = 0;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
      goto LABEL_62;
    goto LABEL_50;
  }
  v6 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v80 = 0;
  v8 = objc_msgSend(v6, "removeItemAtPath:error:", v7, &v80);
  v9 = v80;
  if ((v8 & 1) == 0)
  {
    PLAssetImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      v84 = v17;
      v85 = 2112;
      v86 = v9;
      v12 = "Failed to delete incoming photo %@ : %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 22;
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    PLAssetImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138412290;
      v84 = v11;
      v12 = "#### deleted %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_DEBUG;
      v15 = 12;
LABEL_11:
      _os_log_impl(&dword_199541000, v13, v14, v12, buf, v15);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_13:
  objc_msgSend(*(id *)(a1 + 64), "stringByDeletingPathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingPathExtension:", CFSTR("plist"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = *(void **)(a1 + 56);
  v79 = v9;
  LODWORD(v18) = objc_msgSend(v20, "removeItemAtPath:error:", v19, &v79);
  v21 = v79;

  if ((_DWORD)v18 && *(_QWORD *)(a1 + 72))
  {
    PLAssetImportGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v84 = v19;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "#### deleted %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 80), "_removeInProgressExtendedAttributesForFileAtURL:", *(_QWORD *)(a1 + 48));
  v23 = *(_QWORD *)(a1 + 88);
  if (v23)
  {
    v24 = *(void **)(a1 + 56);
    v78 = v21;
    v25 = objc_msgSend(v24, "removeItemAtPath:error:", v23, &v78);
    v26 = v78;

    if ((v25 & 1) == 0)
    {
      PLAssetImportGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v33 = *(void **)(a1 + 88);
        *(_DWORD *)buf = 138412546;
        v84 = v33;
        v85 = 2112;
        v86 = v26;
        v29 = "Failed to delete incoming diagnostic %@ : %@";
        v30 = v27;
        v31 = OS_LOG_TYPE_ERROR;
        v32 = 22;
        goto LABEL_26;
      }
LABEL_27:

      goto LABEL_28;
    }
    if (*(_QWORD *)(a1 + 72))
    {
      PLAssetImportGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = *(void **)(a1 + 88);
        *(_DWORD *)buf = 138412290;
        v84 = v28;
        v29 = "#### deleted %@";
        v30 = v27;
        v31 = OS_LOG_TYPE_DEBUG;
        v32 = 12;
LABEL_26:
        _os_log_impl(&dword_199541000, v30, v31, v29, buf, v32);
        goto LABEL_27;
      }
      goto LABEL_27;
    }
  }
  else
  {
    v26 = v21;
  }
LABEL_28:
  v34 = *(_QWORD *)(a1 + 96);
  if (v34)
  {
    v35 = *(void **)(a1 + 56);
    v77 = v26;
    v36 = objc_msgSend(v35, "removeItemAtPath:error:", v34, &v77);
    v37 = v77;

    if ((v36 & 1) == 0)
    {
      PLAssetImportGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = *(void **)(a1 + 96);
        *(_DWORD *)buf = 138412546;
        v84 = v39;
        v85 = 2112;
        v86 = v37;
        _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Failed to delete incoming adjustment data %@ : %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v37 = v26;
  }
  if (MEMORY[0x19AEC04BC]())
  {
    PLAssetImportGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "Stashing incoming mdata files if present because internal install", buf, 2u);
    }

    if (*(_QWORD *)(a1 + 104))
    {
      objc_msgSend(v2, "photoLibrary");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "filename");
      v42 = objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset diagnosticFilePathForLibrary:mainFilename:createIfNeeded:](PLManagedAsset, "diagnosticFilePathForLibrary:mainFilename:createIfNeeded:", v41, v42, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v43, "stringByDeletingPathExtension");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByAppendingPathExtension:", *MEMORY[0x1E0D74A68]);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = *(void **)(a1 + 56);
      v47 = *(_QWORD *)(a1 + 104);
      v76 = 0;
      LOBYTE(v42) = objc_msgSend(v46, "copyItemAtPath:toPath:error:", v47, v45, &v76);
      v48 = v76;
      if ((v42 & 1) == 0)
      {
        PLAssetImportGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = *(void **)(a1 + 104);
          *(_DWORD *)buf = 138412802;
          v84 = v50;
          v85 = 2112;
          v86 = v45;
          v87 = 2112;
          v88 = v48;
          _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "Failed to copy incoming camera metadata %@ to %@ : %@", buf, 0x20u);
        }

      }
    }
  }
  v51 = *(_QWORD *)(a1 + 104);
  if (v51)
  {
    v52 = *(void **)(a1 + 56);
    v75 = v37;
    v53 = objc_msgSend(v52, "removeItemAtPath:error:", v51, &v75);
    v54 = v75;

    if ((v53 & 1) == 0)
    {
      PLAssetImportGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v56 = *(void **)(a1 + 104);
        *(_DWORD *)buf = 138412546;
        v84 = v56;
        v85 = 2112;
        v86 = v54;
        _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_ERROR, "Failed to delete incoming camera metadata %@ : %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v54 = v37;
  }

  v16 = 1;
LABEL_50:
  v57 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
  if (v57 && objc_msgSend(*(id *)(a1 + 56), "fileExistsAtPath:isDirectory:", v57, 0))
  {
    v58 = *(void **)(a1 + 56);
    v59 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
    v74 = 0;
    v60 = objc_msgSend(v58, "removeItemAtPath:error:", v59, &v74);
    v61 = v74;
    if ((v60 & 1) != 0)
    {
      if (!*(_QWORD *)(a1 + 72) || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
        goto LABEL_61;
      PLAssetImportGetLog();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        v63 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v84 = v63;
        v64 = "#### deleted %@";
        v65 = v62;
        v66 = OS_LOG_TYPE_DEBUG;
        v67 = 12;
LABEL_59:
        _os_log_impl(&dword_199541000, v65, v66, v64, buf, v67);
      }
    }
    else
    {
      PLAssetImportGetLog();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        v68 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v84 = v68;
        v85 = 2112;
        v86 = v61;
        v64 = "Failed to delete incoming filtered preview %@ : %@";
        v65 = v62;
        v66 = OS_LOG_TYPE_ERROR;
        v67 = 22;
        goto LABEL_59;
      }
    }

LABEL_61:
  }
LABEL_62:
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
    v71 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40);
    v81 = CFSTR("PLLimitedLibraryFetchFiltersUpdatedNotificationApplicationIdentifier");
    v82 = v71;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "postNotificationName:object:userInfo:", CFSTR("PLLimitedLibraryFetchFiltersUpdatedNotification"), v70, v72);

  }
  objc_msgSend(*(id *)(a1 + 80), "_removeTransientKeys:", *(_QWORD *)(a1 + 32));
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, *MEMORY[0x1E0D74CB8]);
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 48), "path");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v73, *MEMORY[0x1E0D74D90]);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
  objc_msgSend(*(id *)(a1 + 80), "_decrementJobCount:", *(_QWORD *)(a1 + 32));

}

uint64_t __55__PLImageWriter__processImageJob_inLibrary_completion___block_invoke_4(uint64_t a1)
{
  +[PLImageWriter photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:](PLImageWriter, "photoIrisPairingDidSucceed:fileIndicatorPath:photoAsset:photoLibrary:", 0, *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "stillAlive");
}

void __67__PLImageWriter_cameraAssetPathForNewAssetWithExtension_assetUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "path");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __32__PLImageWriter_delayJob_delay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLAssetImportGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Delay elapsed, processing job", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_processJob:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_decrementJobCount:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 48), "stillAlive");
}

uint64_t __28__PLImageWriter_enqueueJob___block_invoke_93(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_processJob:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_decrementJobCount:", *(_QWORD *)(a1 + 40));
}

void __28__PLImageWriter_enqueueJob___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("PLImageWriterVideoJobDebugDelayOverride"));
  if (v1 >= 0)
    v2 = v1;
  else
    v2 = -v1;
  enqueueJob__debugVideoJobDelay = v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "integerForKey:", CFSTR("PLImageWriterImageJobDebugDelayOverride"));
  if (v3 >= 0)
    v4 = v3;
  else
    v4 = -v3;
  enqueueJob__debugImageJobDelay = v4;

}

+ (BOOL)_requiresIndicatorFileForJobType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74DE8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74E40]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74DF8]) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74DC0]) & 1) == 0
    && !objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D74DF0]);

  return v4;
}

+ (BOOL)_requiresAssetUUIDForJobType:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D74E08]) ^ 1;
}

+ (BOOL)_requiresCrashRecoveryForJobType:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D74DE0]);
}

+ (void)_signalBackgroundProcessingNeededForAsset:(id)a3 reason:(id)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  unsigned int v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  int v17;
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  __CFString *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (__CFString *)a4;
  objc_msgSend(v5, "photoLibrary");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString libraryServicesManager](v7, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundJobService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLAssetImportGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v5, "deferredProcessingNeeded");
      if (v12 > 0xB)
        v13 = 0;
      else
        v13 = off_1E3663E30[v12];
      v15 = v13;
      objc_msgSend(v5, "uuidDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v15;
      v19 = 2114;
      v20 = v16;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "ImageWriter signaling %{public}@ background processing needed for %{public}@, due to %{public}@", (uint8_t *)&v17, 0x20u);

    }
    objc_msgSend(v9, "startWatchdogTimerIfNeededWithSourceDescription:", CFSTR("ImageWriter"));
    objc_msgSend(v5, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "signalBackgroundProcessingNeededOnLibrary:", v11);
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v5, "uuidDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138544386;
    v18 = v6;
    v19 = 2114;
    v20 = v14;
    v21 = 2048;
    v22 = v7;
    v23 = 2048;
    v24 = v8;
    v25 = 2048;
    v26 = 0;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_FAULT, "ImageWriter is unable to signal background processing for %{public}@: asset: %{public}@, photoLibrary: %p, libraryServicesManager: %p, backgroundJobService: %p", (uint8_t *)&v17, 0x34u);

  }
}

+ (BOOL)isSpatialOverCaptureURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("IMG_")) & 1) != 0)
  {
    v6 = objc_msgSend(v5, "hasSuffix:", *MEMORY[0x1E0D747B0]);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73278], "uuidFromURL:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v6 = objc_msgSend(v5, "hasSuffix:", *MEMORY[0x1E0D747B0]);
    else
      v6 = 0;

  }
  return v6;
}

+ (BOOL)isDeferredPhotoPreviewURL:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("IMG_")))
  {
    if ((objc_msgSend(v4, "hasSuffix:", *MEMORY[0x1E0D73E10]) & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v4, "hasSuffix:", *MEMORY[0x1E0D74710]);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)finalizedAssetURLForDeferredPhotoPreviewURL:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "isDeferredPhotoPreviewURL:", v6))
  {
    objc_msgSend(v6, "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    objc_msgSend(v9, "substringToIndex:", v10 - objc_msgSend((id)*MEMORY[0x1E0D73E10], "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v7)
    {
      objc_msgSend(v11, "stringByAppendingPathExtension:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathExtension:", v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathComponent:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)semanticEnhancePreviewDestinationURLForPrimaryAssetURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", *MEMORY[0x1E0D74710]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)cameraMetadataURLForPrimaryAssetURL:(id)a3 photoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(a4, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateDirectoryWithSubType:createIfNeeded:error:", 9, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathExtension:", *MEMORY[0x1E0D74A68]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "stringByAppendingPathComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)semanticEnhanceSceneIsValid:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0xFFFFFFFFFFFFFFFELL;
}

+ (id)assetAdjustmentsFromCompositionController:(id)a3 exportProperties:(id)a4
{
  id v5;
  id v6;
  PLPhotoEditPersistenceManager *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;
  id v18;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(PLPhotoEditPersistenceManager);
  v17 = 0;
  v18 = 0;
  -[PLPhotoEditPersistenceManager dataFromCompositionController:outFormatIdentifier:outFormatVersion:exportProperties:](v7, "dataFromCompositionController:outFormatIdentifier:outFormatVersion:exportProperties:", v6, &v18, &v17, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v18;
  v10 = v17;
  objc_msgSend(v6, "adjustmentConstants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "PISemanticEnhanceAdjustmentKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustmentControllerForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = 24640;
  else
    v14 = 24576;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithFormatIdentifier:formatVersion:data:baseVersion:editorBundleID:renderTypes:", v9, v10, v8, 0, CFSTR("com.apple.camera"), v14);

  return v15;
}

+ (id)assetAdjustmentsFromCameraFilters:(id)a3 portraitMetadata:(id)a4 exportProperties:(id)a5 cameraMetadata:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v10 = (objc_class *)MEMORY[0x1E0D75150];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v10);
  objc_msgSend(v15, "setPortraitMetadata:", v13);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __100__PLImageWriter_assetAdjustmentsFromCameraFilters_portraitMetadata_exportProperties_cameraMetadata___block_invoke;
  v19[3] = &unk_1E3661428;
  v20 = v15;
  v16 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);

  objc_msgSend(a1, "assetAdjustmentsFromCameraAdjustments:cameraMetadata:exportProperties:", v16, v11, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)assetAdjustmentsFromCameraAdjustmentsFileAtPath:(id)a3 exportProperties:(id)a4 cameraMetadata:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v8);
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0D750C0], "deserializedAdjustmentsFromData:error:", v11, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;
  if (v13)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v8);
    if (v14)
    {
      v22 = v9;
      v23 = v10;
      v25 = 0;
      v26 = 0;
      v24 = 0;
      v15 = objc_msgSend(MEMORY[0x1E0D750C0], "deserializeDictionary:toFilters:portraitMetadata:error:", v14, &v26, &v25, &v24);
      v16 = v26;
      v17 = v25;
      v18 = v24;
      if (v15)
      {
        v9 = v22;
        objc_msgSend(a1, "assetAdjustmentsFromCameraFilters:portraitMetadata:exportProperties:cameraMetadata:", v16, v17, v22, v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        PLAssetImportGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v8;
          v30 = 2112;
          v31 = v18;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Error deserializing camera adjustments dictionary at path %@: %@", buf, 0x16u);
        }

        v19 = 0;
        v9 = v22;
      }

      v10 = v23;
    }
    else
    {
      PLAssetImportGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Could not read camera adjustments dictionary from path %@", buf, 0xCu);
      }
      v19 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "assetAdjustmentsFromCameraAdjustments:cameraMetadata:exportProperties:", v12, v10, v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

+ (id)assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6
{
  return (id)objc_msgSend(a1, "_assetAdjustmentsFromCameraAdjustments:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", a3, a4, a5, 0, a6, 0);
}

+ (id)assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5
{
  return (id)objc_msgSend(a1, "_assetAdjustmentsFromCameraAdjustments:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", a3, a4, a5, 0, 0, 0);
}

+ (id)_assetAdjustmentsFromCameraAdjustments:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 assetType:(signed __int16)a6 applySemanticEnhance:(BOOL)a7 sourceURL:(id)a8
{
  _BOOL4 v9;
  int v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  id v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  _QWORD v62[4];
  id v63;
  uint8_t buf[4];
  void *v65;
  uint64_t v66;

  v9 = a7;
  v10 = a6;
  v66 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (v9)
    v9 = +[PLCompositionHelper wantsSemanticEnhanceForCameraMetadata:](PLCompositionHelper, "wantsSemanticEnhanceForCameraMetadata:", v15);
  if (v14 || v9)
  {
    v53 = a1;
    objc_msgSend(v14, "effectFilterName");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "portraitEffectFilterName");
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "portraitMetadata");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v14, "isDepthEnabled");
    v22 = +[PLCompositionHelper newIdentityCompositionController](PLCompositionHelper, "newIdentityCompositionController");
    v23 = v22;
    if (v10 == 1)
      v24 = 2;
    else
      v24 = 1;
    objc_msgSend(v22, "setMediaType:", v24);
    objc_msgSend(v23, "adjustmentConstants");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v20;
    v27 = v25;
    v54 = (void *)v19;
    if (v19)
      v28 = 1;
    else
      v28 = v21;
    v51 = v26;
    if (v28 == 1 && v26)
    {
      +[PLPhotoEditRenderer updateCompositionController:fromPortraitMetadata:](PLPhotoEditRenderer, "updateCompositionController:fromPortraitMetadata:", v23);
      if (v21)
      {
        objc_msgSend(v23, "depthAdjustmentController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "depthInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v31)
        {
          objc_msgSend(v27, "PIDepthAdjustmentKey");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "modifyAdjustmentWithKey:modificationBlock:", v32, &__block_literal_global_190);

        }
      }
      if (v54)
      {
        objc_msgSend(v23, "portraitAdjustmentController");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "portraitInfo");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "count");

        if (v35)
        {
          +[PLPhotoEffect effectWithCIFilterName:](PLPhotoEffect, "effectWithCIFilterName:", v54);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            objc_msgSend(v27, "PIPortraitAdjustmentKey");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v62[0] = MEMORY[0x1E0C809B0];
            v62[1] = 3221225472;
            v62[2] = __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2;
            v62[3] = &unk_1E36675F0;
            v63 = v36;
            objc_msgSend(v23, "modifyAdjustmentWithKey:modificationBlock:", v37, v62);

          }
          else
          {
            PLAssetImportGetLog();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v54;
              _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "Failed to create photo effect for %@", buf, 0xCu);
            }

          }
        }
      }
    }
    else
    {
      v38 = v21 ^ 1;
      if (v10 != 1)
        v38 = 1;
      if ((v38 & 1) == 0)
      {
        objc_msgSend(v25, "PIPortraitVideoAdjustmentKey");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v60[0] = MEMORY[0x1E0C809B0];
        v60[1] = 3221225472;
        v60[2] = __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_193;
        v60[3] = &unk_1E3661450;
        v40 = v14;
        v61 = v40;
        objc_msgSend(v23, "modifyAdjustmentWithKey:modificationBlock:", v39, v60);

        if (objc_msgSend(v40, "isEligibleForCinematicAudioEffectProcessing"))
        {
          objc_msgSend(v27, "PICinematicAudioAdjustmentKey");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "modifyAdjustmentWithKey:modificationBlock:", v41, &__block_literal_global_197);

        }
      }
    }
    if (v52)
    {
      +[PLPhotoEffect effectWithCIFilterName:](PLPhotoEffect, "effectWithCIFilterName:", v52);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v43;
      if (v43)
      {
        +[PLCompositionHelper compositionController:setEffectFilterName:version:](PLCompositionHelper, "compositionController:setEffectFilterName:version:", v23, v52, objc_msgSend(v43, "latestVersion"));
      }
      else
      {
        PLAssetImportGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v65 = v52;
          _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_ERROR, "Failed to create photo effect for %@", buf, 0xCu);
        }

      }
    }
    if (objc_msgSend(v14, "hasCrop"))
    {
      objc_msgSend(v27, "PICropAdjustmentKey");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_198;
      v57[3] = &unk_1E3661498;
      v58 = v14;
      v59 = v16;
      objc_msgSend(v23, "modifyAdjustmentWithKey:modificationBlock:", v46, v57);

    }
    if (v9)
      +[PLCompositionHelper compositionController:updateSemanticEnhanceFromCameraMetadata:exportProperties:](PLCompositionHelper, "compositionController:updateSemanticEnhanceFromCameraMetadata:exportProperties:", v23, v15, v16);
    if (objc_msgSend(v14, "isSloMoEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:", v17);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "PISlomoAdjustmentKey");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2_200;
      v55[3] = &unk_1E36614C0;
      v56 = v47;
      v49 = v47;
      objc_msgSend(v23, "modifyAdjustmentWithKey:modificationBlock:", v48, v55);

    }
    objc_msgSend(v53, "assetAdjustmentsFromCompositionController:exportProperties:", v23, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6 assetType:(signed __int16)a7
{
  return (id)objc_msgSend(a1, "_assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", a3, a4, a5, a7, a6, 0);
}

+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6 assetType:(signed __int16)a7 sourceURL:(id)a8
{
  return (id)objc_msgSend(a1, "_assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", a3, a4, a5, a7, a6, a8);
}

+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 applySemanticEnhance:(BOOL)a6
{
  return (id)objc_msgSend(a1, "_assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", a3, a4, a5, 0, a6, 0);
}

+ (id)assetAdjustmentsFromCameraAdjustmentData:(id)a3 exportProperties:(id)a4
{
  return (id)objc_msgSend(a1, "_assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", a3, 0, a4, 0, 0, 0);
}

+ (id)_assetAdjustmentsFromCameraAdjustmentData:(id)a3 cameraMetadata:(id)a4 exportProperties:(id)a5 assetType:(signed __int16)a6 applySemanticEnhance:(BOOL)a7 sourceURL:(id)a8
{
  _BOOL8 v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  BOOL v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  _BOOL4 v25;
  int v26;
  void *v27;
  unsigned int v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v9 = a7;
  v10 = a6;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  if (v14)
  {
    v30 = 0;
    objc_msgSend(MEMORY[0x1E0D750C0], "deserializedAdjustmentsFromData:error:", v14, &v30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v30;
    v20 = v19;
    if (v18)
      v21 = 1;
    else
      v21 = v19 == 0;
    v22 = v21;
    if (!v21)
    {
      v29 = v10;
      PLAssetImportGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v14, "length");
        *(_DWORD *)buf = 134218242;
        v32 = v24;
        v33 = 2112;
        v34 = v20;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Error deserializing camera adjustments data (length=%lu): %@", buf, 0x16u);
      }

      v10 = v29;
    }

    if (v9)
      goto LABEL_13;
  }
  else
  {
    v18 = 0;
    v22 = 1;
    if (v9)
    {
LABEL_13:
      v25 = +[PLCompositionHelper wantsSemanticEnhanceForCameraMetadata:](PLCompositionHelper, "wantsSemanticEnhanceForCameraMetadata:", v15);
      goto LABEL_16;
    }
  }
  v25 = 0;
LABEL_16:
  if (v18)
    v26 = 1;
  else
    v26 = v25;
  if ((v22 & v26) == 1)
  {
    objc_msgSend(a1, "_assetAdjustmentsFromCameraAdjustments:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", v18, v15, v16, v10, v9, v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

+ (BOOL)setAdjustmentsForNewPhoto:(id)a3 mainFileMetadata:(id)a4 cameraAdjustmentData:(id)a5 adjustmentDataPath:(id)a6 filteredImagePath:(id)a7 cameraMetadata:(id)a8 finalAssetSize:(CGSize)a9 isSubstandardRender:(BOOL)a10
{
  double height;
  double width;
  id v18;
  id v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  int v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  char v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  CMTime time;
  uint8_t buf[4];
  id v49;
  uint64_t v50;

  height = a9.height;
  width = a9.width;
  v50 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = (unint64_t)a5;
  v21 = (unint64_t)a6;
  v22 = a7;
  v23 = a8;
  if (!(v20 | v21))
  {
    v29 = 0;
    goto LABEL_38;
  }
  v24 = (void *)MEMORY[0x19AEC1554]();
  v25 = *MEMORY[0x1E0C9D820];
  v26 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (*MEMORY[0x1E0C9D820] == width && v26 == height)
  {
    height = 0.0;
    width = 0.0;
    if (objc_msgSend(v18, "originalWidth", v25, v26) >= 1)
      width = (double)(unint64_t)objc_msgSend(v18, "originalWidth");
    if (objc_msgSend(v18, "originalHeight") >= 1)
      height = (double)(unint64_t)objc_msgSend(v18, "originalHeight");
  }
  v28 = objc_msgSend(v18, "orientation", v25, v26);
  if (v18)
    objc_msgSend(v18, "photoIrisVideoDuration");
  else
    memset(&time, 0, sizeof(time));
  +[PLPhotoEditExportProperties exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:](PLPhotoEditExportProperties, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", (unint64_t)width, (unint64_t)height, v28, CMTimeGetSeconds(&time));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(a1, "_assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", v20, v23, v30, 0, 0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
      goto LABEL_21;
LABEL_19:
    if (!v31)
    {
      objc_msgSend(a1, "assetAdjustmentsFromCameraAdjustmentsFileAtPath:exportProperties:cameraMetadata:", v21, v30, v23);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_21;
  }
  v31 = 0;
  if (v21)
    goto LABEL_19;
LABEL_21:
  v29 = v31 != 0;
  if (v31)
  {
    v44 = v30;
    v45 = v24;
    objc_msgSend(v18, "dateCreated");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAdjustmentTimestamp:", v32);

    v46 = v23;
    if (v22)
    {
      v33 = v19;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "fileExistsAtPath:", v22);

      if ((v35 & 1) == 0)
      {
        PLAssetImportGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v49 = v22;
          _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "setting adjustments but rendered image does not exist at %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v22, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v33;
    }
    else
    {
      PLAssetImportGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "setting adjustments with no filteredImagePath provided", buf, 2u);
      }

      v37 = 0;
    }
    v39 = v19;
    +[PLAssetAdjustmentOptions assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:](PLAssetAdjustmentOptions, "assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:", v37, a10, v19, width, height);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAdjustments:options:", v31, v40);

    if (a10 && (objc_msgSend(v18, "setCurrentAdjustmentAsOriginalAdjustment") & 1) == 0)
    {
      PLAssetImportGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEFAULT, "setting original adjustment for asset failed", buf, 2u);
      }

    }
    objc_msgSend(v18, "dateCreated");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setModificationDate:", v42);

    v19 = v39;
    v24 = v45;
    v23 = v46;
    v30 = v44;
  }

  objc_autoreleasePoolPop(v24);
LABEL_38:

  return v29;
}

+ (id)_fetchPhotoAssetForUUID:(id)a3 moc:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a4;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid = %@ AND noindex:(kind) = %d"), v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setFetchLimit:", 1);
  v16 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v9, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v16;
  if (!v11)
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v18 = v5;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetchPhotoAssetForUUID:%{public}@ %@", buf, 0x16u);
    }

  }
  objc_msgSend(v11, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_pathsByAssetUUIDFromIncomingCrashRecoveryPaths:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  void *v10;
  void *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSObject *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSObject *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(obj);
        v9 = *(NSObject **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v10 = (void *)objc_opt_class();
        -[NSObject lastPathComponent](v9, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_assetUUIDFromIncomingFilename:", v11);
        v12 = (char *)objc_claimAutoreleasedReturnValue();

        PLAssetImportGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            v29 = "+[PLImageWriter _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:]";
            v30 = 2114;
            v31 = v9;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s Malformed path, ignoring %{public}@", buf, 0x16u);
          }
          goto LABEL_18;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136446466;
          v29 = "+[PLImageWriter _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:]";
          v30 = 2114;
          v31 = v12;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "%{public}s: assetUUID %{public}@", buf, 0x16u);
        }

        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          PLAssetImportGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136446978;
            v29 = "+[PLImageWriter _pathsByAssetUUIDFromIncomingCrashRecoveryPaths:]";
            v30 = 2114;
            v31 = v12;
            v32 = 2114;
            v33 = v17;
            v34 = 2114;
            v35 = v9;
            _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s Redundant render/adjustment file associated with asset %{public}@: previously found %{public}@, removing %{public}@", buf, 0x2Au);

          }
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 0;
          v19 = objc_msgSend(v18, "removeItemAtPath:error:", v9, &v23);
          v14 = v23;

          if ((v19 & 1) == 0)
          {
            PLAssetImportGetLog();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v29 = v12;
              v30 = 2112;
              v31 = v14;
              _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to remove asset crash recovery resource path for asset:%{public}@ %@", buf, 0x16u);
            }

          }
LABEL_18:

          goto LABEL_20;
        }
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v12);
LABEL_20:

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v6);
  }

  return v4;
}

+ (void)photoIrisPairingDidSucceed:(BOOL)a3 fileIndicatorPath:(id)a4 photoAsset:(id)a5 photoLibrary:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLImageWriter.m"), 2687, CFSTR("expect photo indicator file"));

  }
  if ((PLDoesIndicatorFileExistAtPath() & 1) != 0)
  {
    if (v11 && !v12)
    {
      _uuidFromPhotoIrisIndicatorFilePath(v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v13, "managedObjectContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLImageWriter _fetchPhotoAssetForUUID:moc:](PLImageWriter, "_fetchPhotoAssetForUUID:moc:", v14, v15);
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v12 = 0;
      }

    }
    if (v12)
    {
      if (!a3 && objc_msgSend(v12, "kindSubtype") == 2)
      {
        PLAssetImportGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v12, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138412290;
          v22 = v18;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "photo asset %@ got no video, demoting subtype", (uint8_t *)&v21, 0xCu);

        }
        objc_msgSend(v12, "setKindSubtype:", 0);
        if (objc_msgSend(v12, "hasAdjustments")
          && !objc_msgSend(v12, "deferredProcessingNeeded"))
        {
          objc_msgSend(v12, "setDeferredProcessingNeeded:", 2);
          +[PLImageWriter _signalBackgroundProcessingNeededForAsset:reason:](PLImageWriter, "_signalBackgroundProcessingNeededForAsset:reason:", v12, CFSTR("live photo demote"));
        }
      }
    }
    else
    {
      PLAssetImportGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 138412290;
        v22 = v11;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "unable to locate photo asset from indicator file %@", (uint8_t *)&v21, 0xCu);
      }

    }
    PLMakeIndicatorFileExistAtPath();
  }
  else
  {
    PLAssetImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v21 = 138412290;
      v22 = v11;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "ignoring pairing operation for indicator file %@", (uint8_t *)&v21, 0xCu);
    }

  }
}

+ (id)_assetUUIDFromIncomingFilename:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", *MEMORY[0x1E0D74A80]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)_hasPrimaryAssetAndAdjustmentsFilesWithType:(signed __int16)a3 inIncomingFilenames:(id)a4 forAssetUUID:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  BOOL v23;
  id v25;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (!v8)
  {
    v23 = 0;
    goto LABEL_29;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (!v9)
  {
    v23 = 0;
    goto LABEL_28;
  }
  v10 = v9;
  v25 = v7;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v29;
  v26 = *MEMORY[0x1E0D74A60];
LABEL_4:
  v14 = 0;
  while (1)
  {
    if (*(_QWORD *)v29 != v13)
      objc_enumerationMutation(obj);
    v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v14);
    objc_msgSend(a1, "_assetUUIDFromIncomingFilename:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", v8);

    if (v17)
      break;
LABEL_13:
    if (v12)
      goto LABEL_14;
LABEL_15:
    if (v10 == ++v14)
    {
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      v10 = v22;
      if (!v22)
      {
        v23 = 0;
        goto LABEL_25;
      }
      goto LABEL_4;
    }
  }
  if ((v11 & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v15, "pathExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "isEqualToString:", v26);

  }
  if (((v12 | v18) & 1) != 0)
  {
    v11 |= v18;
    goto LABEL_13;
  }
  objc_msgSend(v15, "pathExtension");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByDeletingPathExtension");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "hasSuffix:", v8))
    v12 = +[PLPhotoLibrary isImageFileExtension:](PLPhotoLibrary, "isImageFileExtension:", v20);
  else
    v12 = 0;

  if (!v12)
    goto LABEL_15;
LABEL_14:
  if ((v11 & 1) == 0)
    goto LABEL_15;
  v23 = 1;
LABEL_25:
  v7 = v25;
LABEL_28:

LABEL_29:
  return v23;
}

+ (void)setAdjustmentsForNewVideo:(id)a3 mainFileMetadata:(id)a4 withAdjustmentsDictionary:(id)a5 cameraAdjustments:(id)a6 renderedContentPath:(id)a7 renderedPosterFramePreviewPath:(id)a8 finalAssetSize:(CGSize)a9
{
  double height;
  double width;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  uint64_t v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  int v38;
  id v39;
  uint64_t v40;

  height = a9.height;
  width = a9.width;
  v40 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  if (!v18)
  {
    if (!v19)
      goto LABEL_31;
    v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (*MEMORY[0x1E0C9D820] == width && v25 == height)
    {
      height = 0.0;
      width = 0.0;
      if (objc_msgSend(v16, "originalWidth", *MEMORY[0x1E0C9D820], v25) >= 1)
        width = (double)(unint64_t)objc_msgSend(v16, "originalWidth");
      if (objc_msgSend(v16, "originalHeight") >= 1)
        height = (double)(unint64_t)objc_msgSend(v16, "originalHeight");
    }
    +[PLPhotoEditExportProperties exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:](PLPhotoEditExportProperties, "exportPropertiesWithImageWidth:imageHeight:exifOrientation:duration:", (unint64_t)width, (unint64_t)height, 0, 0.0, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLImageWriter _assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:](PLImageWriter, "_assetAdjustmentsFromCameraAdjustmentData:cameraMetadata:exportProperties:assetType:applySemanticEnhance:sourceURL:", v19, 0, v23, 1, 0, 0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

      goto LABEL_31;
    }
    v24 = (void *)v27;
    objc_msgSend(v16, "dateCreated");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAdjustmentTimestamp:", v28);

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "fileExistsAtPath:", v20);

      if ((v30 & 1) == 0)
      {
        PLAssetImportGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v38 = 138412290;
          v39 = v20;
          _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "setting adjustments but rendered image does not exist at %@", (uint8_t *)&v38, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v20, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_23;
    }
    else
    {
      PLAssetImportGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "setting adjustments with no filteredImagePath provided", (uint8_t *)&v38, 2u);
      }

      v32 = 0;
      if (!v21)
        goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v21, 0);
    v33 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v33;
LABEL_23:
    +[PLAssetAdjustmentOptions assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:](PLAssetAdjustmentOptions, "assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:", v32, 1, v17, width, height);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAdjustments:options:", v24, v34);

    if ((objc_msgSend(v16, "setCurrentAdjustmentAsOriginalAdjustment") & 1) == 0)
    {
      PLAssetImportGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "setting original adjustment for asset failed", (uint8_t *)&v38, 2u);
      }

    }
    goto LABEL_29;
  }
  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D750B0]), "initWithPropertyListDictionary:", v18);
  if (!v22)
  {
LABEL_31:
    objc_msgSend(v16, "setDefaultAdjustmentsIfNecessaryWithMainFileMetadata:", v17);
    goto LABEL_32;
  }
  v23 = (void *)v22;
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v20, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  +[PLAssetAdjustmentOptions assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:](PLAssetAdjustmentOptions, "assetAdjustmentOptionsForImageWriterWithEditedRenderURL:async:fullSizeRenderSize:mainFileMetadata:", v24, 0, v17, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAdjustments:options:", v23, v36);

  objc_msgSend(v16, "dateCreated");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setModificationDate:", v32);
LABEL_29:

LABEL_32:
}

+ (id)pathComponentForIncomingHoldingDirectory
{
  return CFSTR("PhotosIncomingHoldingDirectory");
}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 32), "filterIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKind:", v3);

  objc_msgSend(v4, "setVersion:", objc_msgSend(*(id *)(a1 + 32), "latestVersion"));
}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_193(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setEnabled:", 1);
  objc_msgSend(v3, "setRenderingVersionAtCapture:", objc_msgSend(*(id *)(a1 + 32), "cinematicVideoRenderingVersion"));

}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_198(uint64_t a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "cropRect");
  objc_msgSend(v9, "setCropRect:");
  objc_msgSend(v9, "setEnabled:", 1);
  v3 = objc_msgSend(*(id *)(a1 + 40), "imageHeight");
  v4 = objc_msgSend(*(id *)(a1 + 40), "imageWidth");
  v5 = 9;
  if (v4 <= v3)
    v6 = 9;
  else
    v6 = 16;
  if (v4 <= v3)
    v5 = 16;
  if (v3 == v4)
    v7 = 1;
  else
    v7 = v6;
  if (v3 == v4)
    v8 = 1;
  else
    v8 = v5;
  objc_msgSend(v9, "setConstraintWidth:", v7);
  objc_msgSend(v9, "setConstraintHeight:", v8);

}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2_200(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  float v7;
  CMTime v8;
  CMTimeRange range;
  CMTime v10;
  __int128 v11;
  CMTimeEpoch epoch;
  CMTimeRange v13;

  v2 = (void *)MEMORY[0x1E0D75308];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "defaultSlowMotionAdjustmentsForAsset:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  memset(&v13, 0, sizeof(v13));
  if (v5)
    objc_msgSend(v5, "slowMotionTimeRange");
  v11 = *(_OWORD *)&v13.start.value;
  epoch = v13.start.epoch;
  objc_msgSend(v4, "setStartTime:", &v11);
  range = v13;
  CMTimeRangeGetEnd(&v10, &range);
  v8 = v10;
  objc_msgSend(v4, "setEndTime:", &v8);
  objc_msgSend(v6, "slowMotionRate");
  objc_msgSend(v4, "setRate:", v7);

}

void __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke_2_195(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setRenderingStyleToDefaultForPortraitVideo");
  objc_msgSend(v2, "setEnabled:", 1);

}

uint64_t __129__PLImageWriter__assetAdjustmentsFromCameraAdjustments_cameraMetadata_exportProperties_assetType_applySemanticEnhance_sourceURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", 1);
}

void __100__PLImageWriter_assetAdjustmentsFromCameraFilters_portraitMetadata_exportProperties_cameraMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("CIDepthEffect")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setDepthEnabled:", 1);
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("CIPhotoEffect")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setEffectFilterName:", v3);
  }
  else if (objc_msgSend(v3, "hasPrefix:", CFSTR("CIPortraitEffect")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPortraitEffectFilterName:", v3);
  }

}

@end
