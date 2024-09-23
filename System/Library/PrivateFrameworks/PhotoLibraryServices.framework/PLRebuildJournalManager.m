@implementation PLRebuildJournalManager

- (PLRebuildJournalManager)initWithLibraryServicesManager:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  dispatch_group_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PLRebuildJournalManager;
  v6 = -[PLRebuildJournalManager init](&v21, sel_init);
  if (v6)
  {
    +[PLJournalManager journalManagerWithClass:libraryServiceManager:](PLJournalManager, "journalManagerWithClass:libraryServiceManager:", objc_opt_class(), v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v7;

    objc_storeWeak((id *)v6 + 1, v5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.assetsd.PLJournalManager.queue", v10);
    v12 = (void *)*((_QWORD *)v6 + 4);
    *((_QWORD *)v6 + 4) = v11;

    v13 = dispatch_group_create();
    v14 = (void *)*((_QWORD *)v6 + 5);
    *((_QWORD *)v6 + 5) = v13;

    *((_WORD *)v6 + 24) = 0;
    objc_msgSend(v5, "libraryBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PLRebuildJournalManager.m"), 232, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lsm.libraryBundle"));

    }
    objc_msgSend(v5, "libraryBundle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:", 4.0);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v17;

    dispatch_group_enter(*((dispatch_group_t *)v6 + 5));
  }

  return (PLRebuildJournalManager *)v6;
}

- (void)start
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLRebuildJournalManager start]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__PLRebuildJournalManager_start__block_invoke;
  v6[3] = &unk_1E3677C18;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(queue, v6);

}

- (void)stop
{
  id WeakRetained;
  void *v4;
  char v5;
  NSObject *queue;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "postRunningProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelled");

  if ((v5 & 1) == 0)
    dispatch_group_wait((dispatch_group_t)self->_startupWaitGroup, 0xFFFFFFFFFFFFFFFFLL);
  -[PLRebuildJournalManager _unregisterForChangeHandlingNotifications](self, "_unregisterForChangeHandlingNotifications");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLRebuildJournalManager_stop__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)notifyWillRebuild
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__PLRebuildJournalManager_notifyWillRebuild__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)notifyRebuildComplete
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLRebuildJournalManager notifyRebuildComplete]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PLRebuildJournalManager_notifyRebuildComplete__block_invoke;
  v6[3] = &unk_1E3677C18;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(queue, v6);

}

- (void)_startAfterRebuild
{
  int state;
  PLLibraryServicesManager **p_lsm;
  id WeakRetained;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  NSObject *queue;
  _QWORD block[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (state == 3 || state == 0)
  {
    p_lsm = &self->_lsm;
    WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    objc_msgSend(WeakRetained, "postRunningProgress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCancelled");

    if (v8)
    {
      PLMigrationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[PLJournalManagerCore name](self->_journalManager, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v10;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: postRunningProgress is cancelled. Not retrying _startAfterRebuild.", buf, 0xCu);

      }
    }
    else
    {
      v11 = objc_loadWeakRetained((id *)p_lsm);
      objc_msgSend(v11, "databaseContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v12, "newShortLivedLibraryWithName:", "-[PLRebuildJournalManager _startAfterRebuild]");

      -[NSObject globalValues](v9, "globalValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v13, "isRebuildComplete");

      if ((_DWORD)v12)
      {
        PLMigrationGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[PLJournalManagerCore name](self->_journalManager, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v23 = v15;
          _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: starting after rebuild complete", buf, 0xCu);

        }
        -[PLRebuildJournalManager _start](self, "_start");
      }
      else
      {
        self->_state = 3;
        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[PLJournalManagerCore name](self->_journalManager, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v23 = v17;
          v24 = 2048;
          v25 = 10;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: rebuild not complete, retry start after %ld seconds", buf, 0x16u);

        }
        objc_initWeak((id *)buf, self);
        v18 = dispatch_time(0, 10000000000);
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __45__PLRebuildJournalManager__startAfterRebuild__block_invoke;
        block[3] = &unk_1E3677D48;
        objc_copyWeak(&v21, (id *)buf);
        dispatch_after(v18, queue, block);
        objc_destroyWeak(&v21);
        objc_destroyWeak((id *)buf);
      }
    }

  }
}

- (void)_start
{
  _BOOL4 v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  dispatch_time_t v9;
  NSObject *queue;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[PLJournalManager needsSnapshot](self->_journalManager, "needsSnapshot"))
  {
    self->_state = 1;
    v13 = 0;
    v3 = -[PLRebuildJournalManager _performSnapshotIfNecessaryWithError:](self, "_performSnapshotIfNecessaryWithError:", &v13);
    v4 = v13;
    if (v3)
    {
      self->_state = 2;
      -[PLRebuildJournalManager _replayFromCurrentHistoryToken](self, "_replayFromCurrentHistoryToken");
      dispatch_group_leave((dispatch_group_t)self->_startupWaitGroup);
    }
    else
    {
      PLMigrationGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[PLJournalManagerCore name](self->_journalManager, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v15 = v8;
        v16 = 2048;
        v17 = 10;
        v18 = 2112;
        v19 = v4;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: retrying snapshot after %ld seconds, error: %@", buf, 0x20u);

      }
      objc_initWeak((id *)buf, self);
      v9 = dispatch_time(0, 10000000000);
      queue = self->_queue;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __33__PLRebuildJournalManager__start__block_invoke;
      v11[3] = &unk_1E3677D48;
      objc_copyWeak(&v12, (id *)buf);
      dispatch_after(v9, queue, v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[PLJournalManagerCore name](self->_journalManager, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: started, replaying from history", buf, 0xCu);

    }
    self->_state = 2;
    -[PLRebuildJournalManager _replayFromCurrentHistoryToken](self, "_replayFromCurrentHistoryToken");
    dispatch_group_leave((dispatch_group_t)self->_startupWaitGroup);
  }
}

- (void)_retrySnapshot
{
  if (self->_state == 1)
    -[PLRebuildJournalManager _start](self, "_start");
}

- (void)_registerForChangeHandlingNotifications
{
  PLChangeHandlingNotificationObserver *changeHandlingNotificationObserver;
  _QWORD v4[4];
  id v5;
  id location;

  -[PLRebuildJournalManager _unregisterForChangeHandlingNotifications](self, "_unregisterForChangeHandlingNotifications");
  objc_initWeak(&location, self);
  changeHandlingNotificationObserver = self->_changeHandlingNotificationObserver;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PLRebuildJournalManager__registerForChangeHandlingNotifications__block_invoke;
  v4[3] = &unk_1E3674308;
  objc_copyWeak(&v5, &location);
  -[PLChangeHandlingNotificationObserver startObservingRemoteNotificationsWithBlock:](changeHandlingNotificationObserver, "startObservingRemoteNotificationsWithBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleChangeHandlingNotificationWithTransaction:(id)a3
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
  v7[2] = __76__PLRebuildJournalManager__handleChangeHandlingNotificationWithTransaction___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_unregisterForChangeHandlingNotifications
{
  -[PLChangeHandlingNotificationObserver stopObservingRemoteNotifications](self->_changeHandlingNotificationObserver, "stopObservingRemoteNotifications");
}

- (void)snapshotJournalsForPayloadClassIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *startupWaitGroup;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[PLRebuildJournalManager _snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:](self, "_snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:", v6);
  queue = self->_queue;
  startupWaitGroup = self->_startupWaitGroup;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__PLRebuildJournalManager_snapshotJournalsForPayloadClassIDs_withCompletionHandler___block_invoke;
  block[3] = &unk_1E3676290;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_group_notify(startupWaitGroup, queue, block);

}

- (BOOL)snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__90606;
  v21 = __Block_byref_object_dispose__90607;
  v22 = 0;
  -[PLRebuildJournalManager _snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:](self, "_snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:", v6);
  dispatch_group_wait((dispatch_group_t)self->_startupWaitGroup, 0xFFFFFFFFFFFFFFFFLL);
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PLRebuildJournalManager_snapshotJournalsForPayloadClassIDs_error___block_invoke;
  v13[3] = &unk_1E3676348;
  v15 = &v23;
  v13[4] = self;
  v8 = v6;
  v14 = v8;
  v16 = &v17;
  dispatch_sync(queue, v13);
  LODWORD(queue) = *((unsigned __int8 *)v24 + 24);
  v9 = (id)v18[5];
  v10 = v9;
  if (!(_DWORD)queue && a4)
    *a4 = objc_retainAutorelease(v9);

  v11 = *((_BYTE *)v24 + 24);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

- (void)_snapshotJournalsIgnoreHistoreIfNecessaryForPayloadClassIDs:(id)a3
{
  if (!objc_msgSend(a3, "count"))
    -[PLJournalManager setIgnoreHistoryDuringSnapshot](self->_journalManager, "setIgnoreHistoryDuringSnapshot");
}

- (BOOL)_snapshotJournalsForPayloadClassIDs:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_state == 2)
  {
    v18 = 0;
    v7 = -[PLRebuildJournalManager _performSnapshotForPayloadClassIDs:error:](self, "_performSnapshotForPayloadClassIDs:error:", v6, &v18);
    v8 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to request snapshot in manager state: %d"), self->_state);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 51008, v12);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[PLJournalManagerCore name](self->_journalManager, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: %@", buf, 0x16u);

    }
    v7 = 0;
  }
  -[PLJournalManager clearIgnoreHistoryDuringSnapshot](self->_journalManager, "clearIgnoreHistoryDuringSnapshot");
  v15 = v8;
  v16 = v15;
  if (!v7 && a4)
    *a4 = objc_retainAutorelease(v15);

  return v7;
}

- (BOOL)_performSnapshotIfNecessaryWithError:(id *)a3
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
  v7[2] = __64__PLRebuildJournalManager__performSnapshotIfNecessaryWithError___block_invoke;
  v7[3] = &unk_1E3675800;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  objc_msgSend(v5, "sync:identifyingBlock:library:", v7, 0, 0);

  LOBYTE(a3) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)a3;
}

- (BOOL)_performSnapshotForPayloadClassIDs:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PLRebuildJournalManager *v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__PLRebuildJournalManager__performSnapshotForPayloadClassIDs_error___block_invoke;
  v10[3] = &unk_1E3674DF8;
  v8 = v6;
  v11 = v8;
  v12 = self;
  v13 = &v15;
  v14 = a4;
  objc_msgSend(v7, "sync:identifyingBlock:library:", v10, 0, 0);

  LOBYTE(a4) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a4;
}

- (void)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *startupWaitGroup;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  float v17;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  startupWaitGroup = self->_startupWaitGroup;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __111__PLRebuildJournalManager_coalesceJournalsForPayloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke;
  v14[3] = &unk_1E3674330;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_group_notify(startupWaitGroup, queue, v14);

}

- (BOOL)coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5
{
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  void *v12;
  char v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  float v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__90606;
  v24 = __Block_byref_object_dispose__90607;
  v25 = 0;
  dispatch_group_wait((dispatch_group_t)self->_startupWaitGroup, 0xFFFFFFFFFFFFFFFFLL);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PLRebuildJournalManager_coalesceJournalsForPayloadClassIDs_withChangeJournalOverThreshold_error___block_invoke;
  block[3] = &unk_1E3674358;
  v17 = &v26;
  block[4] = self;
  v10 = v8;
  v19 = a4;
  v16 = v10;
  v18 = &v20;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((unsigned __int8 *)v27 + 24);
  v11 = (id)v21[5];
  v12 = v11;
  if (!(_DWORD)queue && a5)
    *a5 = objc_retainAutorelease(v11);

  v13 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  return v13;
}

- (BOOL)_coalesceJournalsForPayloadClassIDs:(id)a3 withChangeJournalOverThreshold:(float)a4 error:(id *)a5
{
  id v8;
  double v9;
  PLJournalManager *journalManager;
  BOOL v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (self->_state == 2)
  {
    journalManager = self->_journalManager;
    v22 = 0;
    *(float *)&v9 = a4;
    v11 = -[PLJournalManager coalesceJournalsForPayloadClassIDs:withChangeJournalOverThreshold:error:](journalManager, "coalesceJournalsForPayloadClassIDs:withChangeJournalOverThreshold:error:", v8, &v22, v9);
    v12 = v22;
    if (v11)
    {
      v13 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to coalesce journals in manager state: %d"), self->_state);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 51008, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    PLMigrationGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[PLJournalManagerCore name](self->_journalManager, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v20;
      v25 = 2112;
      v26 = v14;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: %@", buf, 0x16u);

    }
    v12 = v18;
  }
  if (a5)
  {
    v12 = objc_retainAutorelease(v12);
    v13 = 0;
    *a5 = v12;
  }
  else
  {
    v13 = 0;
  }
LABEL_10:

  return v13;
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
  PLRebuildJournalManager *v19;

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
  objc_msgSend(v9, "stringWithFormat:", CFSTR("JournalManager[%@] transient context (%@)"), v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v11);

  v12 = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(v12, "persistentStoreCoordinator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPersistentStoreCoordinator:", v13);

  objc_msgSend(v3, "setStalenessInterval:", 0.0);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __47__PLRebuildJournalManager__newTransientContext__block_invoke;
  v17[3] = &unk_1E3677C18;
  v14 = v3;
  v18 = v14;
  v19 = self;
  objc_msgSend(v14, "performBlockAndWait:", v17);
  v15 = v14;

  return v15;
}

- (BOOL)_replayFromCurrentHistoryToken
{
  id v3;
  void *v4;
  id v5;
  double v6;
  float v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  PLJournalManager *journalManager;
  id *v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  id obj;
  _QWORD v24[5];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  double v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__90606;
  v36 = __Block_byref_object_dispose__90607;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__PLRebuildJournalManager__replayFromCurrentHistoryToken__block_invoke;
  v24[3] = &unk_1E3676348;
  v26 = &v28;
  v24[4] = self;
  v5 = v3;
  v25 = v5;
  v27 = &v32;
  objc_msgSend(v4, "sync:identifyingBlock:library:", v24, 0, 0);

  if (*((_BYTE *)v29 + 24))
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = 10.0;
      if (MEMORY[0x19AEC04BC]())
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("PLRebuildJournalManagerImmediateCoalesceThreshold"));
        v9 = objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[NSObject floatValue](v9, "floatValue");
          v7 = *(float *)&v6;
        }
      }
      else
      {
        v9 = 0;
      }
      journalManager = self->_journalManager;
      v14 = (id *)(v33 + 5);
      obj = (id)v33[5];
      *(float *)&v6 = v7;
      v15 = -[PLJournalManager coalesceJournalsForPayloadClassIDs:withChangeJournalOverThreshold:error:](journalManager, "coalesceJournalsForPayloadClassIDs:withChangeJournalOverThreshold:error:", v5, &obj, v6);
      objc_storeStrong(v14, obj);
      if (!v15)
      {
        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[PLJournalManagerCore name](self->_journalManager, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v33[5];
          *(_DWORD *)buf = 138544130;
          v39 = v17;
          v40 = 2114;
          v41 = v5;
          v42 = 2048;
          v43 = v7;
          v44 = 2112;
          v45 = v18;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Error attempting to coalesce journals for payloadClassIDs [%{public}@] with a threshold over %f: %@", buf, 0x2Au);

        }
      }
LABEL_18:

    }
  }
  else
  {
    if (objc_msgSend((id)v33[5], "code") != 51009)
    {
      PLMigrationGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[PLJournalManagerCore name](self->_journalManager, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)v33[5];
        *(_DWORD *)buf = 138543618;
        v39 = v19;
        v40 = 2112;
        v41 = v20;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: Error replaying history: %@", buf, 0x16u);

      }
      goto LABEL_18;
    }
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[PLJournalManagerCore name](self->_journalManager, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)v33[5];
      *(_DWORD *)buf = 138543618;
      v39 = v11;
      v40 = 2112;
      v41 = v12;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "JournalManager[%{public}@]: History token not found in history, removing token and re-starting: %@", buf, 0x16u);

    }
    -[PLJournalManager clearHistoryToken](self->_journalManager, "clearHistoryToken");
    if (self->_state == 2)
    {
      dispatch_group_enter((dispatch_group_t)self->_startupWaitGroup);
      -[PLRebuildJournalManager _start](self, "_start");
    }
  }
  v21 = *((_BYTE *)v29 + 24) != 0;

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v21;
}

- (void)recreateAllObjectsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4
{
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  char v12;
  NSObject *queue;
  PLRebuildJournalManager *v14;
  SEL v15;
  id v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  unsigned __int8 v22;

  v6 = a3;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLLibraryIDFromPathManager();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqual:", v11);

  if ((v12 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PLRebuildJournalManager_recreateAllObjectsInManagedObjectContext_options___block_invoke;
    block[3] = &unk_1E3675C80;
    block[4] = self;
    v21 = v6;
    v22 = a4;
    v19 = v6;
    dispatch_sync(queue, block);

  }
  else
  {
    objc_msgSend(v6, "photoLibrary");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "libraryID");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_loadWeakRetained((id *)&self->_lsm), "pathManager");
    objc_claimAutoreleasedReturnValue();
    PLLibraryIDFromPathManager();
    objc_claimAutoreleasedReturnValue();
    v14 = (PLRebuildJournalManager *)_PFAssertFailHandler();
    -[PLRebuildJournalManager recreateAssetsInManagedObjectContext:options:progress:](v14, v15, v16, v17, v18);
  }
}

- (void)recreateAssetsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4 progress:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  char v14;
  NSObject *queue;
  id v16;
  PLRebuildJournalManager *v17;
  SEL v18;
  id v19;
  id v20;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  unsigned __int8 v26;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "libraryID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLLibraryIDFromPathManager();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isEqual:", v13);

  if ((v14 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__PLRebuildJournalManager_recreateAssetsInManagedObjectContext_options_progress___block_invoke;
    block[3] = &unk_1E36752E0;
    block[4] = self;
    v24 = v7;
    v26 = a4;
    v25 = v8;
    v16 = v8;
    v22 = v7;
    dispatch_sync(queue, block);

  }
  else
  {
    objc_msgSend(v7, "photoLibrary");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "libraryID");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_loadWeakRetained((id *)&self->_lsm), "pathManager");
    objc_claimAutoreleasedReturnValue();
    PLLibraryIDFromPathManager();
    objc_claimAutoreleasedReturnValue();
    v17 = (PLRebuildJournalManager *)_PFAssertFailHandler();
    -[PLRebuildJournalManager recreateNonAssetsInManagedObjectContext:progress:](v17, v18, v19, v20);
  }
}

- (void)recreateNonAssetsInManagedObjectContext:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  char v13;
  NSObject *queue;
  id v15;
  PLRebuildJournalManager *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  BOOL v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLLibraryIDFromPathManager();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqual:", v12);

  if ((v13 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PLRebuildJournalManager_recreateNonAssetsInManagedObjectContext_progress___block_invoke;
    block[3] = &unk_1E3677530;
    block[4] = self;
    v26 = v6;
    v27 = v7;
    v15 = v7;
    v24 = v6;
    dispatch_sync(queue, block);

  }
  else
  {
    objc_msgSend(v6, "photoLibrary");
    objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "libraryID");
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_loadWeakRetained((id *)&self->_lsm), "pathManager");
    objc_claimAutoreleasedReturnValue();
    PLLibraryIDFromPathManager();
    objc_claimAutoreleasedReturnValue();
    v16 = (PLRebuildJournalManager *)_PFAssertFailHandler();
    -[PLRebuildJournalManager _recreateResourcesForAsset:withPayload:resources:recreateOptions:storeOptions:libraryID:isCPLEnabled:](v16, v17, v18, v19, v20, v21, v22, v23, v28);
  }
}

- (BOOL)_recreateResourcesForAsset:(id)a3 withPayload:(id)a4 resources:(id)a5 recreateOptions:(unsigned __int8)a6 storeOptions:(id)a7 libraryID:(id)a8 isCPLEnabled:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v35;
  id obj;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v40 = a7;
  v39 = a8;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v16)
  {
    v17 = v16;
    v35 = v14;
    v38 = v13;
    v18 = 0;
    v19 = 0;
    v37 = *(_QWORD *)v45;
    while (2)
    {
      v20 = 0;
      v21 = v18;
      v22 = v19;
      do
      {
        if (*(_QWORD *)v45 != v37)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v20);
        objc_msgSend(v23, "validatedExternalResourceWithAsset:isCPLEnabled:", v38, a9, v35);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLResourceDataStoreManager storeForExternalResource:inLibraryWithID:](PLResourceDataStoreManager, "storeForExternalResource:inLibraryWithID:", v24, v39);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v21;
        v43 = v22;
        v26 = objc_msgSend(v25, "storeExternalResource:forAsset:options:error:resultingResource:", v24, v38, v40, &v43, &v42);
        v19 = v43;

        v18 = v42;
        if ((v26 & 1) == 0)
        {

          v27 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v23, "updateStoredResource:", v18);

        ++v20;
        v21 = v18;
        v22 = v19;
      }
      while (v17 != v20);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v17)
        continue;
      break;
    }
    v27 = 1;
LABEL_11:
    v13 = v38;
    v14 = v35;
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v27 = 1;
  }

  if ((objc_msgSend(v13, "isPhotoIris") & 1) != 0 || objc_msgSend(v13, "isVideo"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pathForLocalVideoKeyFrame");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0;
    v30 = objc_msgSend(v28, "removeItemAtPath:error:", v29, &v41);
    v31 = v41;

    if ((v30 & 1) == 0 && (PLIsErrorFileNotFound() & 1) == 0)
    {
      PLMigrationGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v14, "payloadID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v49 = v33;
        v50 = 2112;
        v51 = v31;
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Rebuild: failed to remove unnecessary file for payload ID %{public}@ %@", buf, 0x16u);

      }
    }

  }
  return v27;
}

- (void)_recreateAssetsInManagedObjectContext:(id)a3 options:(unsigned __int8)a4 progress:(id)a5
{
  int v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  PLJournal *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  id *v18;
  char v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  PLJournal *v25;
  void *v26;
  id v27;
  id v28;
  id *v29;
  id *v30;
  char v31;
  NSObject *v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id WeakRetained;
  void *v39;
  PLResourceDataStoreOptions *v40;
  PLJournal *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  char v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id *v51;
  void *v52;
  PLResourceDataStoreOptions *v53;
  void *v54;
  id v55;
  void *v56;
  PLJournal *v57;
  void (**v58)(void);
  id v59;
  char v60;
  PLJournal *v61;
  PLJournal *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  id v66;
  PLJournal *v67;
  id v68;
  id v69;
  PLRebuildJournalManager *v70;
  PLResourceDataStoreOptions *v71;
  id v72;
  id v73;
  id v74;
  void (**v75)(void);
  __int128 *v76;
  uint8_t *v77;
  uint64_t *v78;
  _QWORD *v79;
  _QWORD *v80;
  char v81;
  char v82;
  uint8_t v83[8];
  uint8_t *v84;
  uint64_t v85;
  char v86;
  _QWORD v87[4];
  id v88;
  PLRebuildJournalManager *v89;
  id v90;
  uint64_t *v91;
  __int128 *p_buf;
  _QWORD v93[6];
  _QWORD v94[4];
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  id v100;
  NSObject *v101;
  id v102;
  id v103;
  id obj;
  _QWORD v105[4];
  id v106;
  id v107;
  id v108;
  uint64_t v109;
  id *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  __int128 buf;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  uint64_t v120;

  v6 = a4;
  v120 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v109 = 0;
  v110 = (id *)&v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__90606;
  v113 = __Block_byref_object_dispose__90607;
  v114 = 0;
  PLMigrationGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v6;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Recreate options enabled: %d", (uint8_t *)&buf, 8u);
  }
  v60 = v6;

  objc_msgSend(v8, "setChangeSource:", 2);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = [PLJournal alloc];
  -[PLJournalManagerCore baseURL](self->_journalManager, "baseURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = -[PLJournal initWithBaseURL:payloadClass:](v12, "initWithBaseURL:payloadClass:", v13, objc_opt_class());

  v105[0] = MEMORY[0x1E0C809B0];
  v105[1] = 3221225472;
  v105[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke;
  v105[3] = &unk_1E3674390;
  v14 = v9;
  v106 = v14;
  v15 = v8;
  v107 = v15;
  v16 = v11;
  v108 = v16;
  v17 = v110;
  obj = v110[5];
  -[PLJournal enumeratePayloadsUsingBlock:error:](v62, "enumeratePayloadsUsingBlock:error:", v105, &obj);
  objc_storeStrong(v17 + 5, obj);
  if (objc_msgSend(v15, "hasChanges"))
  {
    v18 = v110;
    v103 = v110[5];
    v19 = objc_msgSend(v15, "save:", &v103);
    objc_storeStrong(v18 + 5, v103);
    if ((v19 & 1) == 0)
    {
      PLMigrationGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = v110[5];
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v21;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Rebuild: unable to save moc during volume creation. Data loss may occur. (%@)", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  -[PLRebuildJournalManager _replayFromCurrentHistoryToken](self, "_replayFromCurrentHistoryToken");
  if (objc_msgSend(v14, "isCancelled"))
  {
    PLMigrationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Early return from journal re-create assets due to progress cancel", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = [PLJournal alloc];
    -[PLJournalManagerCore baseURL](self->_journalManager, "baseURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = -[PLJournal initWithBaseURL:payloadClass:](v25, "initWithBaseURL:payloadClass:", v26, objc_opt_class());

    v98[0] = MEMORY[0x1E0C809B0];
    v98[1] = 3221225472;
    v98[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_83;
    v98[3] = &unk_1E36743B8;
    v27 = v14;
    v99 = v27;
    v28 = v15;
    v100 = v28;
    v22 = v23;
    v101 = v22;
    v59 = v24;
    v102 = v59;
    v29 = v110;
    v97 = v110[5];
    -[PLJournal enumeratePayloadsUsingBlock:error:](v61, "enumeratePayloadsUsingBlock:error:", v98, &v97);
    objc_storeStrong(v29 + 5, v97);
    if (objc_msgSend(v28, "hasChanges"))
    {
      v30 = v110;
      v96 = v110[5];
      v31 = objc_msgSend(v28, "save:", &v96);
      objc_storeStrong(v30 + 5, v96);
      if ((v31 & 1) == 0)
      {
        PLMigrationGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = v110[5];
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v33;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Rebuild: unable to save moc during keyword creation. Data loss may occur. (%@)", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    -[PLRebuildJournalManager _replayFromCurrentHistoryToken](self, "_replayFromCurrentHistoryToken");
    if (objc_msgSend(v27, "isCancelled"))
    {
      PLMigrationGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Early return from journal re-create assets due to progress cancel", (uint8_t *)&buf, 2u);
      }

    }
    else
    {
      v35 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v116 = 0x3032000000;
      v117 = __Block_byref_object_copy__90606;
      v118 = __Block_byref_object_dispose__90607;
      if ((v60 & 1) != 0)
        v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v119 = v35;
      v95[0] = 0;
      v95[1] = v95;
      v95[2] = 0x2020000000;
      v95[3] = 0;
      v94[0] = 0;
      v94[1] = v94;
      v94[2] = 0x2020000000;
      v94[3] = 0;
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_86;
      v93[3] = &unk_1E36743E0;
      v93[4] = v95;
      v93[5] = v94;
      v58 = (void (**)(void))MEMORY[0x19AEC174C](v93);
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_2;
      v87[3] = &unk_1E3674408;
      v36 = v28;
      v91 = &v109;
      v88 = v36;
      v89 = self;
      v37 = v27;
      v90 = v37;
      p_buf = &buf;
      v56 = (void *)MEMORY[0x19AEC174C](v87);
      v58[2]();
      v55 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
      objc_msgSend(WeakRetained, "pathManager");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      PLLibraryIDFromPathManager();
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v40 = objc_alloc_init(PLResourceDataStoreOptions);
      -[PLResourceDataStoreOptions setAssumeNoExistingResources:](v40, "setAssumeNoExistingResources:", 0);
      v53 = v40;
      v41 = [PLJournal alloc];
      -[PLJournalManagerCore baseURL](self->_journalManager, "baseURL");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = -[PLJournal initWithBaseURL:payloadClass:](v41, "initWithBaseURL:payloadClass:", v42, objc_opt_class());

      v43 = -[PLJournal countOfInsertEntriesWithError:](v57, "countOfInsertEntriesWithError:", 0);
      objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", v43, v37, objc_msgSend(v37, "totalUnitCount"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "isCancelled"))
      {
        PLMigrationGetLog();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v83 = 0;
          _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "Early return from journal re-create assets due to progress cancel", v83, 2u);
        }

      }
      else
      {
        *(_QWORD *)v83 = 0;
        v84 = v83;
        v85 = 0x2020000000;
        v86 = 0;
        objc_msgSend(v36, "photoLibrary");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "isCloudPhotoLibraryEnabled");

        v86 = v46;
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_90;
        v64[3] = &unk_1E3674430;
        v65 = v37;
        v47 = v36;
        v66 = v47;
        v81 = v60 & 1;
        v67 = v57;
        v76 = &buf;
        v68 = v59;
        v48 = v55;
        v77 = v83;
        v69 = v48;
        v70 = self;
        v82 = v60;
        v71 = v53;
        v72 = v54;
        v78 = &v109;
        v49 = v52;
        v73 = v49;
        v79 = v95;
        v80 = v94;
        v50 = v56;
        v74 = v50;
        v75 = v58;
        v51 = v110;
        v63 = v110[5];
        -[PLJournal enumeratePayloadsUsingBlock:error:](v67, "enumeratePayloadsUsingBlock:error:", v64, &v63);
        objc_storeStrong(v51 + 5, v63);
        (*((void (**)(id, id))v50 + 2))(v50, v48);
        objc_msgSend(v49, "setCompletedUnitCount:", objc_msgSend(v49, "totalUnitCount"));
        objc_msgSend(v47, "setChangeSource:", 0);

        _Block_object_dispose(v83, 8);
      }

      _Block_object_dispose(v94, 8);
      _Block_object_dispose(v95, 8);
      _Block_object_dispose(&buf, 8);

    }
  }

  _Block_object_dispose(&v109, 8);
}

- (void)_recreateNonAssetsInManagedObjectContext:(id)a3 progress:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  PLJournal *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  id v27;
  id *v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  id *v34;
  BOOL v35;
  NSObject *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  id *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  id v49;
  PLJournal *v50;
  void *v51;
  id *v52;
  id v53;
  id v54;
  NSObject *v55;
  NSObject *v56;
  id v57;
  id v58;
  id *v59;
  BOOL v60;
  NSObject *v61;
  NSObject *v62;
  id v63;
  id v64;
  id *v65;
  BOOL v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  id v72;
  id *v73;
  BOOL v74;
  NSObject *v75;
  NSObject *v76;
  id v77;
  id v78;
  id *v79;
  BOOL v80;
  NSObject *v81;
  uint64_t v82;
  PLJournal *v83;
  id v84;
  id *v85;
  BOOL v86;
  NSObject *v87;
  id v88;
  id *v89;
  BOOL v90;
  NSObject *v91;
  id WeakRetained;
  BOOL v93;
  NSObject *v94;
  id *v95;
  BOOL v96;
  NSObject *v97;
  uint64_t v98;
  NSObject *v99;
  uint64_t v100;
  NSObject *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  id v107;
  NSObject *v108;
  PLJournal *v109;
  id v110;
  id v111;
  id v112;
  NSObject *v113;
  id v114;
  id v115;
  uint64_t v116;
  id v117;
  void (**v118)(_QWORD, _QWORD, _QWORD);
  void (**v119)(_QWORD, _QWORD);
  id v121;
  char v122;
  NSObject *v123;
  PLJournal *v124;
  PLJournal *v125;
  PLJournal *v126;
  PLJournal *v127;
  PLJournal *v128;
  PLJournal *v129;
  PLJournal *v130;
  PLJournal *v131;
  PLJournal *v132;
  id v133;
  id v134;
  void *v135;
  _QWORD v136[5];
  id v137;
  uint64_t *v138;
  uint64_t *v139;
  id v140;
  _QWORD v141[4];
  NSObject *v142;
  id v143;
  __int128 *v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t *v147;
  uint64_t v148;
  uint64_t v149;
  id v150;
  _QWORD v151[4];
  NSObject *v152;
  id v153;
  id v154;
  id v155;
  _QWORD v156[4];
  id v157;
  id v158;
  _QWORD v159[4];
  NSObject *v160;
  id v161;
  id v162;
  uint8_t *v163;
  uint8_t buf[8];
  uint8_t *v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  _QWORD v169[4];
  NSObject *v170;
  id v171;
  NSObject *v172;
  id v173;
  id v174;
  _QWORD v175[4];
  NSObject *v176;
  id v177;
  PLRebuildJournalManager *v178;
  id v179;
  id v180;
  char v181;
  id v182;
  _QWORD v183[4];
  NSObject *v184;
  id v185;
  id v186;
  char v187;
  _QWORD v188[4];
  id v189;
  id v190;
  id v191;
  _QWORD v192[4];
  NSObject *v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  id v198;
  _QWORD v199[4];
  NSObject *v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  _QWORD v208[4];
  NSObject *v209;
  id v210;
  id v211;
  char v212;
  id v213;
  _QWORD v214[4];
  NSObject *v215;
  id v216;
  id v217;
  char v218;
  id obj;
  _QWORD v220[4];
  id v221;
  id v222;
  id v223;
  char v224;
  _QWORD v225[4];
  id v226;
  id v227;
  _QWORD v228[4];
  id v229;
  _QWORD v230[4];
  id v231;
  uint64_t v232;
  uint64_t *v233;
  uint64_t v234;
  char v235;
  uint64_t v236;
  uint64_t *v237;
  uint64_t v238;
  uint64_t (*v239)(uint64_t, uint64_t);
  void (*v240)(uint64_t);
  id v241;
  uint8_t v242[4];
  uint64_t v243;
  __int128 v244;
  uint64_t v245;
  uint64_t v246;
  _BYTE v247[128];
  uint64_t v248;

  v248 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v236 = 0;
  v237 = &v236;
  v238 = 0x3032000000;
  v239 = __Block_byref_object_copy__90606;
  v240 = __Block_byref_object_dispose__90607;
  v241 = 0;
  v232 = 0;
  v233 = &v232;
  v234 = 0x2020000000;
  v235 = 0;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v230[0] = MEMORY[0x1E0C809B0];
  v230[1] = 3221225472;
  v230[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke;
  v230[3] = &unk_1E3674458;
  v115 = v7;
  v231 = v115;
  v8 = (void *)MEMORY[0x19AEC174C](v230);
  v228[0] = MEMORY[0x1E0C809B0];
  v228[1] = 3221225472;
  v228[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2;
  v228[3] = &unk_1E3674480;
  v9 = v5;
  v229 = v9;
  v119 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v228);
  v225[0] = MEMORY[0x1E0C809B0];
  v225[1] = 3221225472;
  v225[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_103;
  v225[3] = &unk_1E36744D0;
  v133 = v6;
  v226 = v133;
  v121 = v8;
  v227 = v121;
  v118 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v225);
  v122 = objc_msgSend(v9, "hasChanges");
  -[PLJournalManagerCore baseURL](self->_journalManager, "baseURL");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v132 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v129 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v131 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v130 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v128 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v127 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v125 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v126 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
  v11 = v9;
  v116 = -[PLJournal countOfInsertEntriesWithError:](v127, "countOfInsertEntriesWithError:", 0);
  v124 = v10;
  v12 = -[PLJournal countOfInsertEntriesWithError:](v10, "countOfInsertEntriesWithError:", 0);
  v13 = -[PLJournal countOfInsertEntriesWithError:](v132, "countOfInsertEntriesWithError:", 0);
  v14 = -[PLJournal countOfInsertEntriesWithError:](v129, "countOfInsertEntriesWithError:", 0);
  v15 = -[PLJournal countOfInsertEntriesWithError:](v131, "countOfInsertEntriesWithError:", 0);
  v16 = -[PLJournal countOfInsertEntriesWithError:](v130, "countOfInsertEntriesWithError:", 0);
  v17 = -[PLJournal countOfInsertEntriesWithError:](v128, "countOfInsertEntriesWithError:", 0);
  v18 = -[PLJournal countOfInsertEntriesWithError:](v126, "countOfInsertEntriesWithError:", 0);
  v19 = -[PLJournal countOfInsertEntriesWithError:](v125, "countOfInsertEntriesWithError:", 0);
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:parent:pendingUnitCount:", v12 + v116 + v13 + v14 + v15 + v16 + v17 + v18 + v19, v133, objc_msgSend(v133, "totalUnitCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setChangeSource:", 2);
  v220[0] = MEMORY[0x1E0C809B0];
  v220[1] = 3221225472;
  v220[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_107;
  v220[3] = &unk_1E36744F8;
  v21 = v133;
  v221 = v21;
  v134 = v11;
  v222 = v134;
  v224 = v122;
  v22 = v20;
  v223 = v22;
  v23 = (id *)(v237 + 5);
  obj = (id)v237[5];
  LOBYTE(v11) = -[PLJournal enumeratePayloadsUsingBlock:error:](v124, "enumeratePayloadsUsingBlock:error:", v220, &obj);
  objc_storeStrong(v23, obj);
  *((_BYTE *)v233 + 24) = (_BYTE)v11;
  if (!objc_msgSend(v21, "isCancelled"))
  {
    v214[0] = MEMORY[0x1E0C809B0];
    v214[1] = 3221225472;
    v214[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_110;
    v214[3] = &unk_1E3674520;
    v25 = v21;
    v215 = v25;
    v26 = v134;
    v216 = v26;
    v218 = v122;
    v27 = v22;
    v217 = v27;
    v28 = (id *)(v237 + 5);
    v213 = (id)v237[5];
    v29 = -[PLJournal enumeratePayloadsUsingBlock:error:](v132, "enumeratePayloadsUsingBlock:error:", v214, &v213);
    objc_storeStrong(v28, v213);
    *((_BYTE *)v233 + 24) = v29;
    if (-[NSObject isCancelled](v25, "isCancelled"))
    {
      PLMigrationGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_79;
    }
    v208[0] = MEMORY[0x1E0C809B0];
    v208[1] = 3221225472;
    v208[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_112;
    v208[3] = &unk_1E36744F8;
    v31 = v25;
    v209 = v31;
    v32 = v26;
    v210 = v32;
    v212 = v122;
    v33 = v27;
    v211 = v33;
    v34 = (id *)(v237 + 5);
    v207 = (id)v237[5];
    v35 = -[PLJournal enumeratePayloadsUsingBlock:error:](v131, "enumeratePayloadsUsingBlock:error:", v208, &v207);
    objc_storeStrong(v34, v207);
    *((_BYTE *)v233 + 24) = v35;
    if (-[NSObject isCancelled](v31, "isCancelled"))
    {
      PLMigrationGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_78;
    }
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v199[0] = MEMORY[0x1E0C809B0];
    v199[1] = 3221225472;
    v199[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_114;
    v199[3] = &unk_1E3674548;
    v40 = v31;
    v200 = v40;
    v114 = v38;
    v201 = v114;
    v117 = v39;
    v202 = v117;
    v112 = v121;
    v206 = v112;
    v110 = v32;
    v203 = v110;
    v41 = v37;
    v204 = v41;
    v107 = v33;
    v205 = v107;
    v42 = (id *)(v237 + 5);
    v198 = (id)v237[5];
    LOBYTE(v39) = -[PLJournal enumeratePayloadsUsingBlock:error:](v130, "enumeratePayloadsUsingBlock:error:", v199, &v198);
    objc_storeStrong(v42, v198);
    *((_BYTE *)v233 + 24) = (_BYTE)v39;
    v194 = 0u;
    v195 = 0u;
    v196 = 0u;
    v197 = 0u;
    v36 = v41;
    v43 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v194, v247, 16);
    if (v43)
    {
      v44 = *(_QWORD *)v195;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v195 != v44)
            objc_enumerationMutation(v36);
          v46 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * i);
          -[NSObject objectForKey:](v36, "objectForKey:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "updateAlbum:includePendingChanges:", v46, 1);

        }
        v43 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v194, v247, 16);
      }
      while (v43);
    }

    if (-[NSObject isCancelled](v40, "isCancelled"))
    {
      PLMigrationGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_77;
    }
    v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v50 = [PLJournal alloc];
    -[PLJournalManagerCore baseURL](self->_journalManager, "baseURL");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = -[PLJournal initWithBaseURL:payloadClass:](v50, "initWithBaseURL:payloadClass:", v51, objc_opt_class());

    v192[0] = MEMORY[0x1E0C809B0];
    v192[1] = 3221225472;
    v192[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_118;
    v192[3] = &unk_1E3674570;
    v108 = v49;
    v193 = v108;
    v52 = (id *)(v237 + 5);
    v191 = (id)v237[5];
    LOBYTE(v50) = -[PLJournal enumeratePayloadsUsingBlock:error:](v109, "enumeratePayloadsUsingBlock:error:", v192, &v191);
    objc_storeStrong(v52, v191);
    *((_BYTE *)v233 + 24) = (_BYTE)v50;
    v188[0] = MEMORY[0x1E0C809B0];
    v188[1] = 3221225472;
    v188[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2_121;
    v188[3] = &unk_1E3674598;
    v53 = v110;
    v189 = v53;
    v54 = v112;
    v190 = v54;
    -[NSObject enumerateKeysAndObjectsUsingBlock:](v108, "enumerateKeysAndObjectsUsingBlock:", v188);
    if (-[NSObject isCancelled](v40, "isCancelled"))
    {
      PLMigrationGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_76;
    }
    ((void (**)(_QWORD, const __CFString *))v119)[2](v119, CFSTR("albums and folders"));
    v183[0] = MEMORY[0x1E0C809B0];
    v183[1] = 3221225472;
    v183[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_125;
    v183[3] = &unk_1E36744F8;
    v56 = v40;
    v184 = v56;
    v57 = v53;
    v185 = v57;
    v187 = v122;
    v58 = v107;
    v186 = v58;
    v59 = (id *)(v237 + 5);
    v182 = (id)v237[5];
    v60 = -[PLJournal enumeratePayloadsUsingBlock:error:](v129, "enumeratePayloadsUsingBlock:error:", v183, &v182);
    objc_storeStrong(v59, v182);
    *((_BYTE *)v233 + 24) = v60;
    if (-[NSObject isCancelled](v56, "isCancelled"))
    {
      PLMigrationGetLog();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_75;
    }
    ((void (**)(_QWORD, const __CFString *))v119)[2](v119, CFSTR("import sessions"));
    v175[0] = MEMORY[0x1E0C809B0];
    v175[1] = 3221225472;
    v175[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_128;
    v175[3] = &unk_1E36745C0;
    v62 = v56;
    v176 = v62;
    v63 = v57;
    v177 = v63;
    v178 = self;
    v181 = v122;
    v180 = v54;
    v64 = v58;
    v179 = v64;
    v65 = (id *)(v237 + 5);
    v174 = (id)v237[5];
    v66 = -[PLJournal enumeratePayloadsUsingBlock:error:](v128, "enumeratePayloadsUsingBlock:error:", v175, &v174);
    objc_storeStrong(v65, v174);
    *((_BYTE *)v233 + 24) = v66;
    if (-[NSObject isCancelled](v62, "isCancelled"))
    {
      PLMigrationGetLog();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v67, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }
      goto LABEL_74;
    }
    ((void (**)(_QWORD, const __CFString *))v119)[2](v119, CFSTR("memories"));
    v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v169[0] = MEMORY[0x1E0C809B0];
    v169[1] = 3221225472;
    v169[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_133;
    v169[3] = &unk_1E36745E8;
    v69 = v62;
    v170 = v69;
    v70 = v63;
    v171 = v70;
    v71 = v68;
    v172 = v71;
    v72 = v64;
    v173 = v72;
    v73 = (id *)(v237 + 5);
    v168 = (id)v237[5];
    v74 = -[PLJournal enumeratePayloadsUsingBlock:error:](v127, "enumeratePayloadsUsingBlock:error:", v169, &v168);
    v123 = v71;
    objc_storeStrong(v73, v168);
    *((_BYTE *)v233 + 24) = v74;
    +[PLPersonJournalEntryPayload updateMergeTargetPersonWithPersonUUIDMapping:fromDataInManagedObjectContext:](PLPersonJournalEntryPayload, "updateMergeTargetPersonWithPersonUUIDMapping:fromDataInManagedObjectContext:", v71, v70);
    if (-[NSObject isCancelled](v69, "isCancelled"))
    {
      PLMigrationGetLog();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v75, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
      }

      goto LABEL_73;
    }
    *(_QWORD *)buf = 0;
    v165 = buf;
    v166 = 0x2020000000;
    v167 = 0;
    v159[0] = MEMORY[0x1E0C809B0];
    v159[1] = 3221225472;
    v159[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_136;
    v159[3] = &unk_1E3674610;
    v76 = v69;
    v160 = v76;
    v77 = v70;
    v161 = v77;
    v163 = buf;
    v78 = v72;
    v162 = v78;
    v79 = (id *)(v237 + 5);
    v158 = (id)v237[5];
    v80 = -[PLJournal enumeratePayloadsUsingBlock:error:](v126, "enumeratePayloadsUsingBlock:error:", v159, &v158);
    objc_storeStrong(v79, v158);
    *((_BYTE *)v233 + 24) = v80;
    if (*((_QWORD *)v165 + 3))
    {
      PLMigrationGetLog();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        v82 = *((_QWORD *)v165 + 3);
        LODWORD(v244) = 134217984;
        *(_QWORD *)((char *)&v244 + 4) = v82;
        _os_log_impl(&dword_199541000, v81, OS_LOG_TYPE_INFO, "Skipping %lu potentially deferred faces", (uint8_t *)&v244, 0xCu);
      }

    }
    v83 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", v135, objc_opt_class());
    v156[0] = MEMORY[0x1E0C809B0];
    v156[1] = 3221225472;
    v156[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_139;
    v156[3] = &unk_1E3674638;
    v84 = v77;
    v157 = v84;
    v85 = (id *)(v237 + 5);
    v155 = (id)v237[5];
    v86 = -[PLJournal enumeratePayloadsUsingBlock:error:](v83, "enumeratePayloadsUsingBlock:error:", v156, &v155);
    objc_storeStrong(v85, v155);
    *((_BYTE *)v233 + 24) = v86;
    ((void (**)(_QWORD, const __CFString *))v119)[2](v119, CFSTR("persons and faces"));
    if (-[NSObject isCancelled](v76, "isCancelled"))
    {
      PLMigrationGetLog();
      v87 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v244) = 0;
        _os_log_impl(&dword_199541000, v87, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", (uint8_t *)&v244, 2u);
      }
      goto LABEL_72;
    }
    v151[0] = MEMORY[0x1E0C809B0];
    v151[1] = 3221225472;
    v151[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_143;
    v151[3] = &unk_1E3674660;
    v113 = v76;
    v152 = v113;
    v88 = v84;
    v153 = v88;
    v111 = v78;
    v154 = v111;
    v89 = (id *)(v237 + 5);
    v150 = (id)v237[5];
    v90 = -[PLJournal enumeratePayloadsUsingBlock:error:](v125, "enumeratePayloadsUsingBlock:error:", v151, &v150);
    objc_storeStrong(v89, v150);
    *((_BYTE *)v233 + 24) = v90;
    ((void (**)(_QWORD, const __CFString *))v119)[2](v119, CFSTR("social groups"));
    if (-[NSObject isCancelled](v113, "isCancelled"))
    {
      PLMigrationGetLog();
      v91 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v244) = 0;
        _os_log_impl(&dword_199541000, v91, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", (uint8_t *)&v244, 2u);
      }

      goto LABEL_71;
    }
    objc_msgSend(v88, "setChangeSource:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
    if (objc_msgSend(WeakRetained, "isCloudPhotoLibraryEnabled"))
    {
      v93 = *((_QWORD *)v165 + 3) == 0;

      if (!v93)
      {
        *(_QWORD *)&v244 = 0;
        *((_QWORD *)&v244 + 1) = &v244;
        v245 = 0x2020000000;
        v246 = 0;
        v146 = 0;
        v147 = &v146;
        v148 = 0x2020000000;
        v149 = 0;
        v141[0] = MEMORY[0x1E0C809B0];
        v141[1] = 3221225472;
        v141[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_148;
        v141[3] = &unk_1E3674688;
        v94 = v113;
        v142 = v94;
        v143 = v88;
        v144 = &v244;
        v145 = &v146;
        v95 = (id *)(v237 + 5);
        v140 = (id)v237[5];
        v96 = -[PLJournal enumeratePayloadsUsingBlock:error:](v126, "enumeratePayloadsUsingBlock:error:", v141, &v140);
        objc_storeStrong(v95, v140);
        *((_BYTE *)v233 + 24) = v96;
        if (*(_QWORD *)(*((_QWORD *)&v244 + 1) + 24))
        {
          PLMigrationGetLog();
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            v98 = *(_QWORD *)(*((_QWORD *)&v244 + 1) + 24);
            *(_DWORD *)v242 = 134217984;
            v243 = v98;
            _os_log_impl(&dword_199541000, v97, OS_LOG_TYPE_ERROR, "Dropped %lu faces", v242, 0xCu);
          }

        }
        if (v147[3])
        {
          PLMigrationGetLog();
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            v100 = v147[3];
            *(_DWORD *)v242 = 134217984;
            v243 = v100;
            _os_log_impl(&dword_199541000, v99, OS_LOG_TYPE_INFO, "Deferred %lu faces", v242, 0xCu);
          }

        }
        ((void (**)(_QWORD, const __CFString *))v119)[2](v119, CFSTR("deferred rebuild faces"));
        if (-[NSObject isCancelled](v94, "isCancelled"))
        {
          PLMigrationGetLog();
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v242 = 0;
            _os_log_impl(&dword_199541000, v101, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", v242, 2u);
          }

          _Block_object_dispose(&v146, 8);
          _Block_object_dispose(&v244, 8);
          goto LABEL_71;
        }

        _Block_object_dispose(&v146, 8);
        _Block_object_dispose(&v244, 8);
      }
    }
    else
    {

    }
    objc_msgSend(v88, "photoLibrary");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum rootFolderInLibrary:](PLManagedFolder, "rootFolderInLibrary:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v88, "photoLibrary");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum projectAlbumRootFolderInLibrary:](PLManagedFolder, "projectAlbumRootFolderInLibrary:", v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, void *, id))v118)[2](v118, v103, v114);
    ((void (**)(_QWORD, void *, id))v118)[2](v118, v105, v117);
    if (-[NSObject isCancelled](v113, "isCancelled"))
    {
      PLMigrationGetLog();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v244) = 0;
        _os_log_impl(&dword_199541000, v106, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", (uint8_t *)&v244, 2u);
      }
    }
    else
    {
      ((void (**)(_QWORD, const __CFString *))v119)[2](v119, CFSTR("root folders"));
      objc_msgSend(v111, "setCompletedUnitCount:", objc_msgSend(v111, "totalUnitCount"));
      if (!-[PLRebuildJournalManager _replayFromCurrentHistoryToken](self, "_replayFromCurrentHistoryToken"))
        goto LABEL_70;
      if (!-[NSObject isCancelled](v113, "isCancelled"))
      {
        v136[0] = MEMORY[0x1E0C809B0];
        v136[1] = 3221225472;
        v136[2] = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_154;
        v136[3] = &unk_1E36746B0;
        v136[4] = self;
        v137 = v135;
        v138 = &v232;
        v139 = &v236;
        objc_msgSend(v115, "enumerateKeysAndObjectsUsingBlock:", v136);

        goto LABEL_70;
      }
      PLMigrationGetLog();
      v106 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v244) = 0;
        _os_log_impl(&dword_199541000, v106, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", (uint8_t *)&v244, 2u);
      }
    }

LABEL_70:
LABEL_71:

    v87 = v152;
LABEL_72:

    _Block_object_dispose(buf, 8);
LABEL_73:

    v67 = v123;
LABEL_74:

    v61 = v176;
LABEL_75:

    v55 = v184;
LABEL_76:

    v48 = v108;
LABEL_77:

LABEL_78:
    v30 = v209;
LABEL_79:

    v24 = v215;
    goto LABEL_80;
  }
  PLMigrationGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Early return from journal re-create non-assets due to progress cancel", buf, 2u);
  }
LABEL_80:

  _Block_object_dispose(&v232, 8);
  _Block_object_dispose(&v236, 8);

}

- (id)assetsToImportFromAssetJournalInManagedObjectContext:(id)a3 outOnDiskURLs:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__90606;
  v21 = __Block_byref_object_dispose__90607;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__PLRebuildJournalManager_assetsToImportFromAssetJournalInManagedObjectContext_outOnDiskURLs___block_invoke;
  v13[3] = &unk_1E3676EC8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)_assetsToImportFromAssetJournalInManagedObjectContext:(id)a3 outOnDiskURLs:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  PLJournal *v19;
  void *v20;
  PLJournal *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  PLJournalEntry *v46;
  void *v47;
  id v48;
  NSObject *v49;
  int v50;
  id v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  const char *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint32_t v58;
  void *v59;
  uint64_t v60;
  id v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  NSObject *p_super;
  void *v71;
  id v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  id v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  _BYTE v91[128];
  _BYTE v92[128];
  const __CFString *v93;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  id v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(WeakRetained, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(WeakRetained) = objc_msgSend(v11, "isUBF");
  v12 = objc_loadWeakRetained((id *)&self->_lsm);
  objc_msgSend(v12, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((_DWORD)WeakRetained)
    v15 = 4;
  else
    v15 = 1;
  objc_msgSend(v13, "photoDirectoryWithType:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v90 = 0;
  objc_msgSend(MEMORY[0x1E0D73208], "realPathForPath:error:", v16, &v90);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v90;
  if (v17)
  {
    v71 = v16;
    v19 = [PLJournal alloc];
    -[PLJournalManagerCore baseURL](self->_journalManager, "baseURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PLJournal initWithBaseURL:payloadClass:](v19, "initWithBaseURL:payloadClass:", v20, objc_opt_class());

    v84[0] = MEMORY[0x1E0C809B0];
    v84[1] = 3221225472;
    v84[2] = __95__PLRebuildJournalManager__assetsToImportFromAssetJournalInManagedObjectContext_outOnDiskURLs___block_invoke;
    v84[3] = &unk_1E36746D8;
    v85 = v11;
    v86 = v17;
    v72 = v8;
    v87 = v72;
    v22 = v9;
    v88 = v22;
    v89 = v7;
    v83 = v18;
    p_super = &v21->super;
    LODWORD(v21) = -[PLJournal enumeratePayloadsUsingBlock:error:](v21, "enumeratePayloadsUsingBlock:error:", v84, &v83);
    v69 = v83;

    PLMigrationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (!(_DWORD)v21)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v69;
        v95 = (uint64_t)v69;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Error enumerating assets journal for import %@", buf, 0xCu);
      }
      else
      {
        v51 = v69;
      }
      v49 = p_super;
      goto LABEL_42;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(v72, "count");
      *(_DWORD *)buf = 134217984;
      v95 = v25;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Will import %lu assets from asset journal", buf, 0xCu);
    }

    v66 = v8;
    v67 = v7;
    v64 = v11;
    v65 = v9;
    v68 = v17;
    if (objc_msgSend(v22, "count"))
    {
      v26 = (void *)MEMORY[0x1E0C97B48];
      +[PLAssetJournalEntryPayload payloadClassID](PLAssetJournalEntryPayload, "payloadClassID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "fetchRequestWithEntityName:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setReturnsObjectsAsFaults:", 1);
      v93 = CFSTR("uuid");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setPropertiesToFetch:", v29);

      objc_msgSend(v28, "setFetchBatchSize:", 100);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setPredicate:", v30);

      v82 = 0;
      objc_msgSend(v6, "executeFetchRequest:error:", v28, &v82);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v82;
      v33 = v32;
      if (v31)
      {
        v62 = v32;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v34 = v31;
        v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v79;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v79 != v37)
                objc_enumerationMutation(v34);
              objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "uuid");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "removeObject:", v39);

            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, v92, 16);
          }
          while (v36);
        }

        v8 = v66;
        v7 = v67;
        v11 = v64;
        v9 = v65;
        v33 = v62;
      }

      v17 = v68;
    }
    if (!objc_msgSend(v22, "count"))
    {
      v18 = v69;
      v49 = p_super;
LABEL_43:
      objc_msgSend(v72, "allValues");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v71;
      goto LABEL_44;
    }
    v63 = v6;
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v40 = v22;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v75 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * j);
          v46 = [PLJournalEntry alloc];
          +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v45);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = -[PLJournalEntry initForDeleteWithPayloadID:payloadClass:](v46, "initForDeleteWithPayloadID:payloadClass:", v47, objc_opt_class());

          -[NSObject addObject:](v24, "addObject:", v48);
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v74, v91, 16);
      }
      while (v42);
    }

    v49 = p_super;
    v73 = v69;
    v50 = -[NSObject appendChangeEntries:error:](p_super, "appendChangeEntries:error:", v24, &v73);
    v51 = v73;

    PLMigrationGetLog();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v50)
    {
      v8 = v66;
      v7 = v67;
      v11 = v64;
      v9 = v65;
      v17 = v68;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v54 = objc_msgSend(v40, "count");
        *(_DWORD *)buf = 134217984;
        v95 = v54;
        v55 = "Deleted %lu non-local assets from asset journal";
        v56 = v53;
        v57 = OS_LOG_TYPE_DEFAULT;
        v58 = 12;
LABEL_40:
        _os_log_impl(&dword_199541000, v56, v57, v55, buf, v58);
      }
    }
    else
    {
      v8 = v66;
      v7 = v67;
      v11 = v64;
      v9 = v65;
      v17 = v68;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v60 = objc_msgSend(v40, "count");
        *(_DWORD *)buf = 134218242;
        v95 = v60;
        v96 = 2112;
        v97 = v51;
        v55 = "Error deleting %lu entries from asset journal: %@";
        v56 = v53;
        v57 = OS_LOG_TYPE_ERROR;
        v58 = 22;
        goto LABEL_40;
      }
    }

    v6 = v63;
LABEL_42:

    v18 = v51;
    goto LABEL_43;
  }
  PLMigrationGetLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v95 = (uint64_t)v16;
    v96 = 2112;
    v97 = v18;
    _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "Failed to resolve originals path: %{public}@, error: %@", buf, 0x16u);
  }
  v59 = (void *)MEMORY[0x1E0C9AA60];
LABEL_44:

  return v59;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupWaitGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_changeHandlingNotificationObserver, 0);
  objc_storeStrong((id *)&self->_journalManager, 0);
  objc_destroyWeak((id *)&self->_lsm);
}

void __95__PLRebuildJournalManager__assetsToImportFromAssetJournalInManagedObjectContext_outOnDiskURLs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PLFileSystemImportAsset *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "originalResourceRelativePathsWithPathManager:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = v5;
      v28 = v4;
      v29 = 0;
      v10 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v13 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathComponent:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fileURLWithPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", 0))
          {
            -[NSObject addObject:](v9, "addObject:", v15);
            objc_msgSend(v6, "firstObject");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 == v16)
            {
              v17 = v15;

              v29 = v17;
            }
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v8);

      v4 = v28;
      v18 = v29;
      v5 = v9;
      if (v29)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = *(void **)(a1 + 56);
          objc_msgSend(v19, "assetPayload");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "payloadID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "payloadIDString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v24);

        }
        v25 = -[PLFileSystemImportAsset initWithAssetPayload:]([PLFileSystemImportAsset alloc], "initWithAssetPayload:", v3);
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v25, v29);

        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addURLs:", v5);

        objc_msgSend(*(id *)(a1 + 64), "unionSet:", v5);
        goto LABEL_20;
      }
    }
    else
    {

    }
    v27 = *(void **)(a1 + 56);
    objc_msgSend(v3, "payloadID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "payloadIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObject:", v20);
LABEL_20:

    goto LABEL_21;
  }
  PLMigrationGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v3;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Asset payload has no resources, not importing: %{public}@", buf, 0xCu);
  }
LABEL_21:

}

void __94__PLRebuildJournalManager_assetsToImportFromAssetJournalInManagedObjectContext_outOnDiskURLs___block_invoke(_QWORD *a1)
{
  _WORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (_WORD *)a1[4];
  if (v2[24] == 3)
  {
    objc_msgSend(v2, "_assetsToImportFromAssetJournalInManagedObjectContext:outOnDiskURLs:", a1[5], a1[6]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  else
  {
    v6 = _PFAssertFailHandler();
    __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke(v6, v7);
  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  PLJournalEntry *v9;
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v12 = v3;
  objc_msgSend((id)objc_opt_class(), "payloadClassID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "payloadClassID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  v9 = [PLJournalEntry alloc];
  objc_msgSend(v12, "payloadID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLJournalEntry initForDeleteWithPayloadID:payloadClass:](v9, "initForDeleteWithPayloadID:payloadClass:", v10, objc_opt_class());
  objc_msgSend(v6, "addObject:", v11);

}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v4 = *(void **)(a1 + 32);
    v10 = 0;
    v5 = objc_msgSend(v4, "save:", &v10);
    v6 = v10;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Rebuild: (%@) failed to save context %@: %@"), v3, *(_QWORD *)(a1 + 32), v6);
      v7 = objc_claimAutoreleasedReturnValue();
      PLMigrationGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v7;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v7, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v9);
    }
    objc_msgSend(*(id *)(a1 + 32), "refreshAllObjects");

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_103(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__90606;
  v23 = __Block_byref_object_dispose__90607;
  v24 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2_104;
  v14 = &unk_1E36744A8;
  v15 = *(id *)(a1 + 32);
  v7 = v5;
  v16 = v7;
  v18 = &v19;
  v17 = *(id *)(a1 + 40);
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, &v11);
  objc_msgSend((id)v20[5], "childCollectionUUIDs", v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend((id)v20[5], "childCollectionUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLFolderJournalEntryPayload updateChildrenOrderingInFolder:usingChildCollectionUUIDs:includePendingChanges:](PLFolderJournalEntryPayload, "updateChildrenOrderingInFolder:usingChildCollectionUUIDs:includePendingChanges:", v7, v10, 1);

  }
  _Block_object_dispose(&v19, 8);

}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_107(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort albums journal enumeration due to progress cancel", v12, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v5, "insertAlbumFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v5, "updateAlbum:includePendingChanges:", v11, *(unsigned __int8 *)(a1 + 56));

    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_110(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort projects journal enumeration due to progress cancel", v12, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v5, "insertAlbumFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v5, "updateAlbum:includePendingChanges:", v11, *(unsigned __int8 *)(a1 + 56));

    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_112(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort fetching album journal enumeration due to progress cancel", v12, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v5, "insertAlbumFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v5, "updateAlbum:includePendingChanges:", v11, *(unsigned __int8 *)(a1 + 56));

    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_114(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    if (objc_msgSend(v5, "isRootFolder"))
    {
      v7 = *(void **)(a1 + 40);
    }
    else
    {
      if (!objc_msgSend(v5, "isProjectAlbumRootFolder"))
      {
        objc_msgSend(v5, "cloudGUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("----Project-Root-Folder----")))
        {
          v9 = objc_msgSend(v5, "isProjectAlbumRootFolder");

          if ((v9 & 1) == 0)
          {
            PLMigrationGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v16 = 0;
              _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "JournalManager: found project root album PLFolderJournalEntryPayload with incorrect folder type, will delete", v16, 2u);
            }

            (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
            goto LABEL_10;
          }
        }
        else
        {

        }
        objc_msgSend(v5, "payloadID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "payloadIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "photoLibrary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          objc_msgSend(v5, "insertAlbumFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 56));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v5, v15);

        }
        goto LABEL_10;
      }
      v7 = *(void **)(a1 + 48);
    }
    objc_msgSend(v7, "addObject:", v5);
LABEL_10:
    objc_msgSend(*(id *)(a1 + 72), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 72), "completedUnitCount") + 1);
    goto LABEL_11;
  }
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort folder journal enumeration due to progress cancel", buf, 2u);
  }

  *a3 = 1;
LABEL_11:

}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_118(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v3, "albumListType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v9, "albumListType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
  objc_msgSend(v6, "addObject:", v9);

}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2_121(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertAlbumListFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "updateAlbumList:", v6);
  objc_msgSend(v4, "removeObject:", v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_125(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[16];

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort import session journal enumeration due to progress cancel", v12, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum albumWithUUID:inLibrary:](PLGenericAlbum, "albumWithUUID:inLibrary:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v5, "insertAlbumFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 40));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v5, "updateAlbum:includePendingChanges:", v11, *(unsigned __int8 *)(a1 + 56));

    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_128(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort memories journal enumeration due to progress cancel", (uint8_t *)&v18, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLMemory memoryWithUUID:inPhotoLibrary:](PLMemory, "memoryWithUUID:inPhotoLibrary:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
      v12 = objc_msgSend(WeakRetained, "isCloudPhotoLibraryEnabled");

      if (v12
        && (objc_msgSend(v5, "hasAllAssetsAvailableInManagedObjectContext:includePendingAssetChanges:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72)) & 1) == 0)
      {
        PLMigrationGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v5;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Skipping restore for memory with references to unavailable assets, will restore %@ from iCloud Photo Library", (uint8_t *)&v18, 0xCu);
        }

        PLMigrationGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v5;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Removing memory journal entry for %@", (uint8_t *)&v18, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      }
      else
      {
        PLMigrationGetLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v5;
          _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Creating new memory from journal entry payload %@", (uint8_t *)&v18, 0xCu);
        }

        objc_msgSend(v5, "insertMemoryFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 40));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "updateAssetsInMemory:includePendingAssetChanges:", v14, *(unsigned __int8 *)(a1 + 72)) & 1) == 0)
        {
          PLMigrationGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v18 = 138412290;
            v19 = v5;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Incomplete restore of assets for memory %@", (uint8_t *)&v18, 0xCu);
          }

        }
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_133(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort persons journal enumeration due to progress cancel", v14, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPerson personWithUUID:inManagedObjectContext:](PLPerson, "personWithUUID:inManagedObjectContext:", v8, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v5, "insertPersonFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v5, "mergeTargetPersonUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 48);
        objc_msgSend(v10, "personUUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 56), "completedUnitCount") + 1);

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_136(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort faces journal enumeration due to progress cancel", buf, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDetectedFace detectedFaceWithUUID:inManagedObjectContext:](PLDetectedFace, "detectedFaceWithUUID:inManagedObjectContext:", v8, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v11 = 0;
      if ((objc_msgSend(v5, "insertFaceFromDataInManagedObjectContext:allowDeferred:", *(_QWORD *)(a1 + 40), &v11) & 1) == 0)
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        PLMigrationGetLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v5;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Skipping face for journal payload, might be deferred: %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);

  }
}

id __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_139(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "insertDeferredRebuildFaceFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 32));
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_143(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t v11[16];

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort social groups journal enumeration due to progress cancel", v11, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGraphNode graphNodeWithUUID:inManagedObjectContext:](PLGraphNode, "graphNodeWithUUID:inManagedObjectContext:", v8, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v10 = (id)objc_msgSend(v5, "insertSocialGroupInManagedObjectContext:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_148(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  char v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort faces journal enumeration due to progress cancel", buf, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDetectedFace detectedFaceWithUUID:inManagedObjectContext:](PLDetectedFace, "detectedFaceWithUUID:inManagedObjectContext:", v8, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12 = 1;
      if ((objc_msgSend(v5, "insertFaceFromDataInManagedObjectContext:allowDeferred:", *(_QWORD *)(a1 + 40), &v12) & 1) != 0)
      {
        if (v12)
        {
          PLMigrationGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v14 = v5;
            _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Deferred face for journal payload: %@", buf, 0xCu);
          }

          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        }
      }
      else
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        PLMigrationGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v5;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Dropped face for journal payload: %@", buf, 0xCu);
        }

      }
    }

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_154(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  PLJournal *v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  id obj;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1[4] + 16), "payloadClassForPayloadClassID:", v5);
  if (v7)
  {
    v8 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", a1[5], v7);
    v9 = *(_QWORD *)(a1[7] + 8);
    obj = *(id *)(v9 + 40);
    v10 = -[PLJournal appendChangeEntries:error:](v8, "appendChangeEntries:error:", v6, &obj);
    objc_storeStrong((id *)(v9 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v10;

  }
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138412802;
      v15 = v5;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Rebuild: Unable to append delete entries for invalid objects to %@ journal: %@, %@", buf, 0x20u);
    }

  }
}

void __77__PLRebuildJournalManager__recreateNonAssetsInManagedObjectContext_progress___block_invoke_2_104(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint8_t v15[16];

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Will abort root folder journal enumeration due to progress cancel", v15, 2u);
    }

    *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "payloadID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "payloadIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(v7, "childCollectionUUIDs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }

}

void __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort volume journal enumeration due to progress cancel", v13, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLFileSystemVolume volumeForObjectUUID:context:](PLFileSystemVolume, "volumeForObjectUUID:context:", v8, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (id)objc_msgSend(v5, "insertFileSystemVolumeFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 40));
      v11 = *(void **)(a1 + 48);
      objc_msgSend(v5, "payloadID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
  }

}

void __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_83(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedKeyword keywordForTitle:context:](PLManagedKeyword, "keywordForTitle:context:", v7, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "payloadID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "payloadIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      PLMigrationGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "payloadID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v14;
        v25 = 2112;
        v26 = v15;
        v27 = 2112;
        v28 = v16;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Rebuild: remapping uuid for keyword %@, %@ -> %@", (uint8_t *)&v23, 0x20u);

      }
      objc_msgSend(v8, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 56);
      objc_msgSend(v5, "payloadID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "payloadIDString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v20);

    }
    else
    {
      v21 = (id)objc_msgSend(v5, "insertKeywordFromDataInManagedObjectContext:", *(_QWORD *)(a1 + 40));
      v22 = *(void **)(a1 + 48);
      objc_msgSend(v5, "payloadID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v17);
    }

    goto LABEL_12;
  }
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort keyword journal enumeration due to progress cancel", (uint8_t *)&v23, 2u);
  }

  *a3 = 1;
LABEL_13:

}

uint64_t __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_86(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  result = arc4random_uniform(0xAu);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (result + 20);
  return result;
}

void __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  id obj;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v3 + 40);
    v4 = objc_msgSend(v2, "save:", &obj);
    objc_storeStrong((id *)(v3 + 40), obj);
    if ((v4 & 1) == 0)
    {
      PLMigrationGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Rebuild: unable to save moc during asset creation. Data loss may occur. (%@)", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "refreshAllObjects");
  objc_msgSend(*(id *)(a1 + 40), "_replayFromCurrentHistoryToken");
  if (objc_msgSend(*(id *)(a1 + 48), "isCancelled"))
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Skipping replay from current history token due to progress cancel", buf, 2u);
    }

  }
  else if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v12 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "LegacyMigrationRecoveryFix: Ignored assets due to missing resource data: [%@]", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "removeAllObjects");
  }
}

void __82__PLRebuildJournalManager__recreateAssetsInManagedObjectContext_options_progress___block_invoke_90(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PLImageContainer *v32;
  void *v33;
  void *v34;
  PLImageContainer *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  PLJournalEntry *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Will abort asset journal enumeration due to progress cancel", buf, 2u);
    }

    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "payloadID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "payloadIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", v8, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 96), "completedUnitCount") + 1);
    }
    else
    {
      objc_msgSend(v5, "resources");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (*(_BYTE *)(a1 + 160) && !objc_msgSend(v10, "count"))
      {
        v40 = [PLJournalEntry alloc];
        objc_msgSend(v5, "payloadID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[PLJournalEntry initForDeleteWithPayloadID:payloadClass:](v40, "initForDeleteWithPayloadID:payloadClass:", v41, objc_opt_class());

        v42 = *(void **)(a1 + 48);
        v57[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0;
        v44 = objc_msgSend(v42, "appendChangeEntries:error:", v43, &v52);
        v12 = v52;

        if ((v44 & 1) != 0)
        {
          v45 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40);
          objc_msgSend(v5, "payloadID");
          v46 = objc_claimAutoreleasedReturnValue();
          -[NSObject payloadIDString](v46, "payloadIDString");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "addObject:", v47);

        }
        else
        {
          PLMigrationGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v54 = v5;
            v55 = 2112;
            v56 = v12;
            _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_ERROR, "Rebuild: Failed to add deletion change for invalid recovery asset for payload %@: %@", buf, 0x16u);
          }
        }

        v9 = 0;
      }
      else
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v5, "insertAssetFromDataInManagedObjectContext:keywordUUIDRemapping:rawPayloadAttributesToUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(a1 + 64);
        objc_msgSend(v5, "payloadID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

        v15 = *(void **)(a1 + 48);
        objc_msgSend(v5, "payloadID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = 0;
        v17 = objc_msgSend(v15, "appendUpdatePayloadWithPayloadID:rawAttributes:error:", v16, v12, &v51);
        v18 = v51;

        if ((v17 & 1) == 0)
        {
          PLMigrationGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v5, "payloadID");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v54 = v20;
            v55 = 2112;
            v56 = v18;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Rebuild: Failed to add reupdate change for inserted asset for payload ID %{public}@ %@", buf, 0x16u);

          }
        }
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8);
        if (*(_BYTE *)(v21 + 24))
        {
          objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = objc_msgSend(v22, "isCloudPhotoLibraryEnabled");

        }
        else
        {
          *(_BYTE *)(v21 + 24) = 0;
        }
        LOBYTE(v48) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24);
        if ((objc_msgSend(*(id *)(a1 + 72), "_recreateResourcesForAsset:withPayload:resources:recreateOptions:storeOptions:libraryID:isCPLEnabled:", v9, v5, v11, *(unsigned __int8 *)(a1 + 161), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v48) & 1) != 0)
        {
          if (objc_msgSend(v9, "deferredProcessingNeeded"))
          {
            WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 72) + 8));
            objc_msgSend(WeakRetained, "backgroundJobService");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "signalBackgroundProcessingNeededOnLibrary:", v25);

          }
          objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "thumbnailManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "thumbnailJPEGPathForPhoto:", v9);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v27) = objc_msgSend(v29, "fileExistsAtPath:", v28);

          if ((_DWORD)v27
            && (v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:", v28)) != 0
            && (DCIM_newPLImageWithStoredJPEGData(),
                v50 = (void *)objc_claimAutoreleasedReturnValue(),
                v30,
                v50))
          {
            objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setEffectiveThumbnailIndex:", +[PLThumbnailIndexes nextAvailableThumbnailIndexInLibrary:](PLThumbnailIndexes, "nextAvailableThumbnailIndexInLibrary:", v31));

            v32 = [PLImageContainer alloc];
            DCIM_storedJPEGDataFromImage();
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[PLImageContainer initWithPLImage:backingData:uniformTypeIdentifier:auxiliaryImageRecords:](v32, "initWithPLImage:backingData:uniformTypeIdentifier:auxiliaryImageRecords:", v50, v33, v34, 0);

            objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "thumbnailManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "setThumbnailsForAsset:withImage:", v9, v35);

          }
          else
          {
            LOBYTE(v49) = 0;
            objc_msgSend(v9, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:metadata:forceSRGBConversion:saveCameraPreviewWellImage:", 0, 0, 0, 0, 0, 0, v49);
          }

          if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 24) > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8)
                                                                                          + 24))
          {
            (*(void (**)(void))(*(_QWORD *)(a1 + 104) + 16))();
            objc_msgSend(*(id *)(a1 + 64), "removeAllObjects");
            objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24)+ objc_msgSend(*(id *)(a1 + 96), "completedUnitCount"));
            (*(void (**)(void))(*(_QWORD *)(a1 + 112) + 16))();
          }
        }
        else
        {
          PLMigrationGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
            *(_DWORD *)buf = 138412546;
            v54 = v5;
            v55 = 2112;
            v56 = v39;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Rebuild: (Asset) Failed to create resources for asset payload %@: %@", buf, 0x16u);
          }

          objc_msgSend(v9, "deleteFromDatabaseOnly");
          objc_msgSend(*(id *)(a1 + 96), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 96), "completedUnitCount") + 1);
        }
      }

    }
  }

}

void __76__PLRebuildJournalManager_recreateNonAssetsInManagedObjectContext_progress___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_WORD *)(*(_QWORD *)(a1 + 32) + 48) == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_recreateNonAssetsInManagedObjectContext:progress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v1 = _PFAssertFailHandler();
    __81__PLRebuildJournalManager_recreateAssetsInManagedObjectContext_options_progress___block_invoke(v1);
  }
}

void __81__PLRebuildJournalManager_recreateAssetsInManagedObjectContext_options_progress___block_invoke(uint64_t a1)
{
  uint64_t v1;

  if (*(_WORD *)(*(_QWORD *)(a1 + 32) + 48) == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_recreateAssetsInManagedObjectContext:options:progress:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v1 = _PFAssertFailHandler();
    __76__PLRebuildJournalManager_recreateAllObjectsInManagedObjectContext_options___block_invoke(v1);
  }
}

void __76__PLRebuildJournalManager_recreateAllObjectsInManagedObjectContext_options___block_invoke(uint64_t a1)
{
  _WORD *v2;
  _QWORD *v3;

  v2 = *(_WORD **)(a1 + 32);
  if (v2[24] == 3)
  {
    objc_msgSend(v2, "_recreateAssetsInManagedObjectContext:options:progress:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0);
    objc_msgSend(*(id *)(a1 + 32), "_recreateNonAssetsInManagedObjectContext:progress:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    v3 = (_QWORD *)_PFAssertFailHandler();
    __57__PLRebuildJournalManager__replayFromCurrentHistoryToken__block_invoke(v3);
  }
}

void __57__PLRebuildJournalManager__replayFromCurrentHistoryToken__block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id obj;

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[2];
  v4 = (void *)objc_msgSend(v2, "_newTransientContext");
  v5 = a1[5];
  v6 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v6 + 40);
  LOBYTE(v3) = objc_msgSend(v3, "replayFromCurrentHistoryTokenWithManagedObjectContext:updatedPayloadClassIDs:error:", v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = (_BYTE)v3;

}

void __47__PLRebuildJournalManager__newTransientContext__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("com.apple.photos.PLModelMigratorPathManagerKey"));

  v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(v8, "libraryBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graphCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("com.apple.photos.PLMigrationGraphCacheKey"));

}

void __99__PLRebuildJournalManager_coalesceJournalsForPayloadClassIDs_withChangeJournalOverThreshold_error___block_invoke(uint64_t a1, double a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  LODWORD(a2) = *(_DWORD *)(a1 + 64);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v3, "_coalesceJournalsForPayloadClassIDs:withChangeJournalOverThreshold:error:", v4, &obj, a2);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;
}

uint64_t __111__PLRebuildJournalManager_coalesceJournalsForPayloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t result;

  LODWORD(a2) = *(_DWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "_coalesceJournalsForPayloadClassIDs:withChangeJournalOverThreshold:error:", *(_QWORD *)(a1 + 40), 0, a2);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__PLRebuildJournalManager__performSnapshotForPayloadClassIDs_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v3 = *(_QWORD **)(a1 + 40);
  v4 = (void *)v3[2];
  if (v2)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = (id)objc_msgSend(v3, "_newTransientContext");
    v6 = objc_msgSend(v4, "performPartialSnapshotForPayloadClassIDs:append:createOnlyIfNecessary:withManagedObjectContext:error:", v5, 1, 0);
  }
  else
  {
    v7 = (id)objc_msgSend(v3, "_newTransientContext");
    v6 = objc_msgSend(v4, "performFullSnapshotAppend:createOnlyIfNecessary:withManagedObjectContext:error:", 1, 0);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v6;

}

void __64__PLRebuildJournalManager__performSnapshotIfNecessaryWithError___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  id v4;

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[2];
  v4 = (id)objc_msgSend(v2, "_newTransientContext");
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v3, "performSnapshotIfNecessaryAppend:withManagedObjectContext:error:", 1, v4, a1[6]);

}

void __68__PLRebuildJournalManager_snapshotJournalsForPayloadClassIDs_error___block_invoke(_QWORD *a1)
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
  v5 = objc_msgSend(v2, "_snapshotJournalsForPayloadClassIDs:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

void __84__PLRebuildJournalManager_snapshotJournalsForPayloadClassIDs_withCompletionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v6 = 0;
  objc_msgSend(v2, "_snapshotJournalsForPayloadClassIDs:error:", v3, &v6);
  v4 = v6;
  v5 = a1[6];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);

}

uint64_t __76__PLRebuildJournalManager__handleChangeHandlingNotificationWithTransaction___block_invoke(uint64_t a1)
{
  unsigned __int16 *v2;

  v2 = *(unsigned __int16 **)(a1 + 32);
  if (v2[24] >= 2u)
    objc_msgSend(v2, "_replayFromCurrentHistoryToken");
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __66__PLRebuildJournalManager__registerForChangeHandlingNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handleChangeHandlingNotificationWithTransaction:", v4);

}

void __33__PLRebuildJournalManager__start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_retrySnapshot");

}

void __45__PLRebuildJournalManager__startAfterRebuild__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_startAfterRebuild");

}

uint64_t __48__PLRebuildJournalManager_notifyRebuildComplete__block_invoke(uint64_t a1)
{
  _WORD *v2;

  v2 = *(_WORD **)(a1 + 32);
  if (!v2[24])
  {
    objc_msgSend(v2, "_registerForChangeHandlingNotifications");
    v2 = *(_WORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_startAfterRebuild");
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

void __44__PLRebuildJournalManager_notifyWillRebuild__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _WORD *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: notified rebuild starting", (uint8_t *)&v7, 0xCu);

  }
  v4 = *(_WORD **)(a1 + 32);
  if (v4[24] == 2)
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: already started, re-entering wait group", (uint8_t *)&v7, 0xCu);

    }
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 40));
  }
  else if (!v4[24])
  {
    objc_msgSend(v4, "_registerForChangeHandlingNotifications");
  }
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 48) = 3;
}

void __31__PLRebuildJournalManager_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "JournalManager[%{public}@]: stopping", (uint8_t *)&v4, 0xCu);

  }
}

uint64_t __32__PLRebuildJournalManager_start__block_invoke(uint64_t a1)
{
  _WORD *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = *(_WORD **)(a1 + 32);
  if (!v2[24])
  {
    objc_msgSend(v2, "_registerForChangeHandlingNotifications");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "databaseContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "newShortLivedLibraryWithName:", "-[PLRebuildJournalManager start]_block_invoke");

    objc_msgSend(v5, "globalValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v4) = objc_msgSend(v6, "isRebuildComplete");

    if ((_DWORD)v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "_start");
    }
    else
    {
      PLMigrationGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "JournalManager: waiting to be notified of rebuild start", v9, 2u);
      }

      *(_WORD *)(*(_QWORD *)(a1 + 32) + 48) = 3;
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

+ (id)name
{
  return CFSTR("Rebuild");
}

+ (id)baseURLFromPathManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(a3, "photoDirectoryWithType:", 8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)payloadClasses
{
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 14);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isEnabledWithPathManager:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString **v14;
  uint64_t *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLRebuildJournalManager.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  if (objc_msgSend(v7, "isUBF"))
  {
    v8 = (void *)MEMORY[0x1E0D73280];
    objc_msgSend(v7, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "wellKnownPhotoLibraryIdentifierForURL:", v9);

    if (v10 != 3)
    {
      v20 = 1;
      goto LABEL_11;
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D74498];
    v25 = *MEMORY[0x1E0CB2938];
    v26[0] = CFSTR("Disabled journal for invalid well known library type");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = (const __CFString **)v26;
    v15 = &v25;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D74498];
    v23 = *MEMORY[0x1E0CB2938];
    v24 = CFSTR("Disabled journal for unsupported DCIM format");
    v13 = (void *)MEMORY[0x1E0C99D80];
    v14 = &v24;
    v15 = &v23;
  }
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v14, v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 46309, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v17;
  v19 = v18;
  if (a4)
    *a4 = objc_retainAutorelease(v18);

  v20 = 0;
LABEL_11:

  return v20;
}

+ (BOOL)assetJournalExists:(id)a3 error:(id *)a4
{
  id v5;
  PLJournal *v6;
  void *v7;
  void *v8;
  void *v9;
  PLJournal *v10;
  BOOL v11;
  __int128 v13;

  v5 = a3;
  v6 = [PLJournal alloc];
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v5, "photoDirectoryWithType:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLJournal initWithBaseURL:payloadClass:](v6, "initWithBaseURL:payloadClass:", v9, objc_opt_class());

  v13 = 0uLL;
  v11 = -[PLJournal snapshotJournalFileSize:changeJournalFileSize:error:](v10, "snapshotJournalFileSize:changeJournalFileSize:error:", (char *)&v13 + 8, &v13, a4)&& v13 != 0;

  return v11;
}

+ (BOOL)existingJournalsCompatibleForRebuild:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v6, "photoDirectoryWithType:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileURLWithPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__90606;
  v26 = __Block_byref_object_dispose__90607;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  objc_msgSend(a1, "payloadClasses");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PLRebuildJournalManager_existingJournalsCompatibleForRebuild_error___block_invoke;
  v14[3] = &unk_1E36742E0;
  v11 = v9;
  v15 = v11;
  v16 = &v22;
  v17 = &v18;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  if (a4)
    *a4 = objc_retainAutorelease((id)v23[5]);
  v12 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __70__PLRebuildJournalManager_existingJournalsCompatibleForRebuild_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  PLJournal *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id obj;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = -[PLJournal initWithBaseURL:payloadClass:]([PLJournal alloc], "initWithBaseURL:payloadClass:", a1[4], a2);
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v9 = -[PLJournal currentPayloadVersionWithError:](v7, "currentPayloadVersionWithError:", &obj);
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9 <= objc_msgSend(a2, "payloadVersion"))
  {
    if (!v9)
    {
      if (PLIsErrorEqualToCode())
      {
        v19 = *(_QWORD *)(a1[5] + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = 0;

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
        *a4 = 1;
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D74498];
    v22 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a2, "payloadClassID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Existing journal (%@) too new to perform a rebuild, journal version %lu greater than current version %u"), v13, v9, objc_msgSend(a2, "payloadVersion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 46006, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[5] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

@end
