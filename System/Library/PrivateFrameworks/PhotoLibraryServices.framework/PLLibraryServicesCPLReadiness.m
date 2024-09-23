@implementation PLLibraryServicesCPLReadiness

- (PLLibraryServicesCPLReadiness)initWithLibraryServicesManager:(id)a3
{
  id v4;
  PLLibraryServicesCPLReadiness *v5;
  NSMutableArray *v6;
  NSMutableArray *photoLibraryCPLReadinessBlocks;
  NSString *statusMessage;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLLibraryServicesCPLReadiness;
  v5 = -[PLLibraryServicesCPLReadiness init](&v10, sel_init);
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    photoLibraryCPLReadinessBlocks = v5->_photoLibraryCPLReadinessBlocks;
    v5->_photoLibraryCPLReadinessBlocks = v6;

    objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
    v5->_stateLock._os_unfair_lock_opaque = 0;
    v5->_isReadyForCPL = 0;
    statusMessage = v5->_statusMessage;
    v5->_statusMessage = 0;

  }
  return v5;
}

- (id)libraryServicesManager
{
  PLLibraryServicesManager **p_libraryServicesManager;
  id WeakRetained;
  NSObject *v4;
  uint8_t v6[16];

  p_libraryServicesManager = &self->_libraryServicesManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);

  if (!WeakRetained)
  {
    PLLibraryServicesGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "CPLReadiness: LSM is nil", v6, 2u);
    }

  }
  return objc_loadWeakRetained((id *)p_libraryServicesManager);
}

- (BOOL)isReadyForCloudPhotoLibraryWithStatus:(id *)a3
{
  BOOL v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = -[PLLibraryServicesCPLReadiness _isReadyForCloudPhotoLibraryWithStatus:](self, "_isReadyForCloudPhotoLibraryWithStatus:", a3);
  if (!v4)
  {
    objc_initWeak(&location, self);
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedUtilityQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__PLLibraryServicesCPLReadiness_isReadyForCloudPhotoLibraryWithStatus___block_invoke;
    v8[3] = &unk_1E3677D48;
    objc_copyWeak(&v9, &location);
    dispatch_async(v6, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (BOOL)_isReadyForCloudPhotoLibraryWithStatus:(id *)a3
{
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40954;
  v10 = __Block_byref_object_dispose__40955;
  v11 = 0;
  PLRunWithUnfairLock();
  if (a3)
    *a3 = objc_retainAutorelease((id)v7[5]);
  v4 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
  return v4;
}

- (void)_updateIsReady:(BOOL)a3 statusMessage:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  PLRunWithUnfairLock();

}

- (void)_checkIsReadyForCloudPhotoLibrary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __CFString *v26;
  _BOOL8 v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  __CFString *v34;
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  __CFString *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesCPLReadiness libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    -[PLLibraryServicesCPLReadiness _updateIsReady:statusMessage:](self, "_updateIsReady:statusMessage:", 0, CFSTR("libraryServicesManager is nil"));
    goto LABEL_24;
  }
  objc_msgSend(v3, "databaseContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newShortLivedLibraryWithName:", "-[PLLibraryServicesCPLReadiness _checkIsReadyForCloudPhotoLibrary]");

  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  objc_msgSend(v6, "globalValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "didImportFileSystemAssets");

  v47 = v8;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__40954;
  v42 = __Block_byref_object_dispose__40955;
  v43 = CFSTR("ready");
  if (!*((_BYTE *)v45 + 24))
  {
    v43 = CFSTR("file system import is not complete");
    v26 = CFSTR("ready");
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v4, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDeviceRestoreSupported");

  if (v10)
  {
    v30 = MEMORY[0x1E0C809B0];
    v31 = 3221225472;
    v32 = __66__PLLibraryServicesCPLReadiness__checkIsReadyForCloudPhotoLibrary__block_invoke;
    v33 = &unk_1E3676348;
    v34 = v6;
    v11 = v4;
    v35 = v11;
    v36 = &v44;
    v37 = &v38;
    -[__CFString performBlockAndWait:completionHandler:](v34, "performBlockAndWait:completionHandler:", &v30, 0);
    v12 = v45;
    if (*((_BYTE *)v45 + 24))
    {
      objc_msgSend(v11, "modelMigrator", v30, v31, v32, v33);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "deviceRestoreMigrationSupport");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasCompletedDataMigratorPrerequisitesForTrackingRestoreFromCloud");

      v12 = v45;
      if ((v15 & 1) == 0)
      {
        *((_BYTE *)v45 + 24) = 0;
        v16 = (void *)v39[5];
        v39[5] = (uint64_t)CFSTR("data migrator prerequisites are not complete");

        v12 = v45;
      }
    }
    if (*((_BYTE *)v12 + 24))
    {
      objc_msgSend(v11, "pathManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isDCIM");

      if (v18)
      {
        objc_msgSend(v11, "modelMigrator");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "postProcessingToken");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "needsToPrepareForBackgroundRestore");

        if (v21)
        {
          *((_BYTE *)v45 + 24) = 0;
          v22 = (void *)v39[5];
          v39[5] = (uint64_t)CFSTR("needs to prepare for background restore");

        }
      }
    }
    if (*((_BYTE *)v45 + 24))
    {
      objc_msgSend(v11, "modelMigrator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isLoadingFacesFromFileSystem");

      if (v24)
      {
        *((_BYTE *)v45 + 24) = 0;
        v25 = (void *)v39[5];
        v39[5] = (uint64_t)CFSTR("loading faces");

      }
    }

    v26 = v34;
    goto LABEL_17;
  }
LABEL_18:
  if (*((_BYTE *)v45 + 24))
  {
    v27 = 1;
  }
  else
  {
    PLLibraryServicesGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v39[5];
      *(_DWORD *)buf = 138543362;
      v49 = v29;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "CPLReadiness: NOT ready because %{public}@", buf, 0xCu);
    }

    v27 = *((_BYTE *)v45 + 24) != 0;
  }
  -[PLLibraryServicesCPLReadiness _updateIsReady:statusMessage:](self, "_updateIsReady:statusMessage:", v27, v39[5], v30, v31, v32, v33);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
LABEL_24:

}

- (BOOL)_isAssetsdReadyForCPLManagerWithStatus:(id *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedUtilityQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[PLLibraryServicesCPLReadiness libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "state") < 6)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    PLStringFromLibraryServicesState();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("libraryServicesManager is not ready: %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLLibraryServicesCPLReadiness _updateIsReady:statusMessage:](self, "_updateIsReady:statusMessage:", 0, v10);

  }
  else
  {
    -[PLLibraryServicesCPLReadiness _checkIsReadyForCloudPhotoLibrary](self, "_checkIsReadyForCloudPhotoLibrary");
  }
  v11 = -[PLLibraryServicesCPLReadiness _isReadyForCloudPhotoLibraryWithStatus:](self, "_isReadyForCloudPhotoLibraryWithStatus:", a3);

  return v11;
}

- (void)cancelCPLReadinessBlocksAndStopWaiting
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "cancelCPLReadinessBlocksAndStopWaiting: removing CPL readiness blocks", buf, 2u);
  }

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedUtilityQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PLLibraryServicesCPLReadiness_cancelCPLReadinessBlocksAndStopWaiting__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(v5, block);

}

- (void)_stopWaitingForCPLReadiness
{
  void *v3;
  NSObject *v4;
  NSObject *photoLibraryCPLReadinessTimer;

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedUtilityQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  photoLibraryCPLReadinessTimer = self->_photoLibraryCPLReadinessTimer;
  if (photoLibraryCPLReadinessTimer)
    dispatch_source_cancel(photoLibraryCPLReadinessTimer);
}

- (void)_callOutstandingCPLReadinessBlocks
{
  void *v3;
  NSObject *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedUtilityQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_photoLibraryCPLReadinessBlocks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sharedUtilityQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v12, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_photoLibraryCPLReadinessBlocks, "removeAllObjects");
}

- (BOOL)_checkForCPLReadinessAndCallBlocks
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  __CFString *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedUtilityQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v16 = CFSTR("unknown");
  v5 = -[PLLibraryServicesCPLReadiness _isAssetsdReadyForCPLManagerWithStatus:](self, "_isAssetsdReadyForCPLManagerWithStatus:", &v16);
  v6 = v16;
  PLMigrationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      -[PLLibraryServicesCPLReadiness libraryServicesManager](self, "libraryServicesManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pathManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "libraryURL");
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v11;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Photo library is ready for Cloud Photos now: %@", buf, 0xCu);

    }
    -[PLLibraryServicesCPLReadiness _stopWaitingForCPLReadiness](self, "_stopWaitingForCPLReadiness");
    -[PLLibraryServicesCPLReadiness _callOutstandingCPLReadinessBlocks](self, "_callOutstandingCPLReadinessBlocks");
  }
  else
  {
    if (v8)
    {
      -[PLLibraryServicesCPLReadiness libraryServicesManager](self, "libraryServicesManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "libraryURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v6;
      v19 = 2112;
      v20 = v14;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Photo library is not ready for Cloud Photos [status: %{public}@]. Waiting for library at %@", buf, 0x16u);

    }
  }

  return v5;
}

- (void)_setupCPLReadinessTimerAndEventHandlerIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *photoLibraryCPLReadinessTimer;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  id location;

  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedUtilityQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (!self->_photoLibraryCPLReadinessTimer)
  {
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sharedUtilityQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);
    photoLibraryCPLReadinessTimer = self->_photoLibraryCPLReadinessTimer;
    self->_photoLibraryCPLReadinessTimer = v7;

    objc_initWeak(&location, self);
    objc_copyWeak(&v11, &location);
    pl_dispatch_source_set_event_handler();
    v9 = self->_photoLibraryCPLReadinessTimer;
    v10 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v9, v10, 0x12A05F200uLL, 0);
    dispatch_resume((dispatch_object_t)self->_photoLibraryCPLReadinessTimer);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)performOnceLibraryIsReadyForCPLManager:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharedUtilityQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PLLibraryServicesCPLReadiness_performOnceLibraryIsReadyForCPLManager___block_invoke;
  block[3] = &unk_1E3675C58;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

- (void)processCloudPhotosLibraryStateChange:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (a3)
  {
    -[PLLibraryServicesCPLReadiness libraryServicesManager](self, "libraryServicesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudPhotoLibraryManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v5);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __70__PLLibraryServicesCPLReadiness_processCloudPhotosLibraryStateChange___block_invoke;
    v8[3] = &unk_1E3677D48;
    objc_copyWeak(&v9, &location);
    -[PLLibraryServicesCPLReadiness performOnceLibraryIsReadyForCPLManager:](self, "performOnceLibraryIsReadyForCPLManager:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PLLibraryServicesCPLReadiness libraryServicesManager](self, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudPhotoLibraryManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[PLLibraryServicesCPLReadiness cancelCPLReadinessBlocksAndStopWaiting](self, "cancelCPLReadinessBlocksAndStopWaiting");
    objc_msgSend(v7, "disableiCPLWithCompletionHandler:", &__block_literal_global_42);

  }
}

- (void)pauseCloudPhotos:(BOOL)a3 reason:(signed __int16)a4
{
  _QWORD v7[4];
  id v8;
  signed __int16 v9;
  BOOL v10;
  id location;

  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PLLibraryServicesCPLReadiness_pauseCloudPhotos_reason___block_invoke;
  v7[3] = &unk_1E3669CE8;
  objc_copyWeak(&v8, &location);
  v10 = a3;
  v9 = a4;
  -[PLLibraryServicesCPLReadiness performOnceLibraryIsReadyForCPLManager:](self, "performOnceLibraryIsReadyForCPLManager:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_photoLibraryCPLReadinessBlocks, 0);
  objc_storeStrong((id *)&self->_photoLibraryCPLReadinessTimer, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
}

void __57__PLLibraryServicesCPLReadiness_pauseCloudPhotos_reason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPhotoLibraryManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPause:reason:", *(unsigned __int8 *)(a1 + 42), *(__int16 *)(a1 + 40));

}

void __70__PLLibraryServicesCPLReadiness_processCloudPhotosLibraryStateChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enableiCPLWithCompletionHandler:", &__block_literal_global_40942);

}

void __70__PLLibraryServicesCPLReadiness_processCloudPhotosLibraryStateChange___block_invoke_3()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.ICPLStateChanged"), 0, 0, 1u);
}

void __70__PLLibraryServicesCPLReadiness_processCloudPhotosLibraryStateChange___block_invoke_2()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.ICPLStateChanged"), 0, 0, 1u);
}

uint64_t __72__PLLibraryServicesCPLReadiness_performOnceLibraryIsReadyForCPLManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (void *)MEMORY[0x19AEC174C](*(_QWORD *)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  result = objc_msgSend(*(id *)(a1 + 32), "_checkForCPLReadinessAndCallBlocks");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "_setupCPLReadinessTimerAndEventHandlerIfNeeded");
  return result;
}

void __79__PLLibraryServicesCPLReadiness__setupCPLReadinessTimerAndEventHandlerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkForCPLReadinessAndCallBlocks");

}

void __71__PLLibraryServicesCPLReadiness_cancelCPLReadinessBlocksAndStopWaiting__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(a1 + 32), "_stopWaitingForCPLReadiness");
  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "cancelCPLReadinessBlocksAndStopWaiting: CPL readiness blocks removed", v3, 2u);
  }

}

void __66__PLLibraryServicesCPLReadiness__checkIsReadyForCloudPhotoLibrary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  uint8_t v8[16];

  if (objc_msgSend(*(id *)(a1 + 32), "hasPendingAssetsIgnoreiTunes:", 1))
  {
    objc_msgSend(*(id *)(a1 + 40), "modelMigrator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deviceRestoreMigrationSupport");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v3, "isOTARestoreInProgress") & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v5 = *(void **)(v4 + 40);
      v6 = CFSTR("OTA restore is in progress");
    }
    else
    {
      PLMigrationGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "iCloud Restore is finished but there are still pending assets, attempting cleanup", v8, 2u);
      }

      PLSimulateCrash();
      objc_msgSend(*(id *)(a1 + 32), "cleanupIncompleteAssetsAfterOTARestore");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v5 = *(void **)(v4 + 40);
      v6 = CFSTR("ready (had pending assets, but ota restore is complete - forced cleanup)");
    }
    *(_QWORD *)(v4 + 40) = v6;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __62__PLLibraryServicesCPLReadiness__updateIsReady_statusMessage___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    *(_BYTE *)(v1 + 48) = *(_BYTE *)(a1 + 48);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  }
}

void __72__PLLibraryServicesCPLReadiness__isReadyForCloudPhotoLibraryWithStatus___block_invoke(_QWORD *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_BYTE *)(a1[4] + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 40));
}

void __71__PLLibraryServicesCPLReadiness_isReadyForCloudPhotoLibraryWithStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkIsReadyForCloudPhotoLibrary");

}

@end
