@implementation PLPersistentHistoryChangeDistributor

- (void)startObservingRemoteNotifications
{
  void *v3;
  NSObject *isolationQueue;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLPersistentHistoryChangeDistributor startObservingRemoteNotifications]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PLPersistentHistoryChangeDistributor_startObservingRemoteNotifications__block_invoke;
  block[3] = &unk_1E3677B80;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (PLPersistentHistoryChangeDistributor)initWithPersistentStoreCoordinator:(id)a3 bundle:(id)a4 changeMerger:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PLPersistentHistoryChangeDistributor *v14;
  PLPersistentHistoryChangeDistributor *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *isolationQueue;
  uint64_t v19;
  PLChangeHandlingNotificationObserver *notificationObserver;
  NSObject *v21;
  uint64_t v22;
  PLPersistentHistoryChangeDistributor *v23;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  PLPersistentHistoryChangeDistributor *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersistentHistoryChangeDistributor.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changeMerger != nil"));

    if (v11)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersistentHistoryChangeDistributor.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("persistentStoreCoordinator != nil"));

  if (!v13)
    goto LABEL_10;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersistentHistoryChangeDistributor.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle != nil"));

LABEL_4:
  v28.receiver = self;
  v28.super_class = (Class)PLPersistentHistoryChangeDistributor;
  v14 = -[PLPersistentHistoryChangeDistributor init](&v28, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_persistentStoreCoordinator, a3);
    objc_storeStrong((id *)&v15->_changeMerger, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("PLPersistentHistoryChangeDistributor.isolationQueue", v16);
    isolationQueue = v15->_isolationQueue;
    v15->_isolationQueue = (OS_dispatch_queue *)v17;

    objc_msgSend(v11, "makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:", 4.0);
    v19 = objc_claimAutoreleasedReturnValue();
    notificationObserver = v15->_notificationObserver;
    v15->_notificationObserver = (PLChangeHandlingNotificationObserver *)v19;

    v15->_observerCountLock._os_unfair_lock_opaque = 0;
    v15->_observerCount = 0;
    PLPhotosObjectLifecycleGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v30 = v22;
      v31 = 2048;
      v32 = v15;
      v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "%@ %p initWithPersistentStoreCoordinator:%@", buf, 0x20u);
    }

    v23 = v15;
  }

  return v15;
}

void __58__PLPersistentHistoryChangeDistributor__inq_setLastToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "description");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

}

- (void)beginObservingChanges
{
  uint64_t v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v3 = MEMORY[0x1E0C809B0];
  PLRunWithUnfairLock();
  if (*((_BYTE *)v6 + 24))
    -[PLPersistentHistoryChangeDistributor _advanceTokenToCurrent](self, "_advanceTokenToCurrent", v3, 3221225472, __61__PLPersistentHistoryChangeDistributor_beginObservingChanges__block_invoke, &unk_1E3677C68, self, &v5);
  _Block_object_dispose(&v5, 8);
}

- (void)_advanceTokenToCurrent
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PLPersistentHistoryChangeDistributor__advanceTokenToCurrent__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

uint64_t __73__PLPersistentHistoryChangeDistributor_startObservingRemoteNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_inq_startObservingRemoteNotifications");

  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __62__PLPersistentHistoryChangeDistributor__advanceTokenToCurrent__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (v3)
  {
    objc_msgSend(v3, "currentPersistentHistoryTokenFromStores:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_inq_setLastToken:", v4);

    PLPersistentHistoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      v11 = 138412290;
      v12 = v6;
      v7 = "Change distributor advanced _lastToken to: %@";
      v8 = v5;
      v9 = OS_LOG_TYPE_DEFAULT;
      v10 = 12;
LABEL_6:
      _os_log_impl(&dword_199541000, v8, v9, v7, (uint8_t *)&v11, v10);
    }
  }
  else
  {
    PLPersistentHistoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      v7 = "Change distributor _inq_advanceTokenToCurrent PSC is nil";
      v8 = v5;
      v9 = OS_LOG_TYPE_ERROR;
      v10 = 2;
      goto LABEL_6;
    }
  }

}

- (void)_inq_startObservingRemoteNotifications
{
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  void *v4;
  NSObject *v5;
  NSPersistentHistoryToken *lastToken;
  PLChangeHandlingNotificationObserver *notificationObserver;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  NSPersistentHistoryToken *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
    -[NSPersistentStoreCoordinator currentPersistentHistoryTokenFromStores:](persistentStoreCoordinator, "currentPersistentHistoryTokenFromStores:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistentHistoryChangeDistributor _inq_setLastToken:](self, "_inq_setLastToken:", v4);

    PLPersistentHistoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lastToken = self->_lastToken;
      *(_DWORD *)buf = 138412290;
      v12 = lastToken;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Setting initial _lastToken to: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    notificationObserver = self->_notificationObserver;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__PLPersistentHistoryChangeDistributor__inq_startObservingRemoteNotifications__block_invoke;
    v9[3] = &unk_1E3674308;
    objc_copyWeak(&v10, (id *)buf);
    -[PLChangeHandlingNotificationObserver startObservingRemoteNotificationsWithBlock:](notificationObserver, "startObservingRemoteNotificationsWithBlock:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    PLPersistentHistoryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Change distributor _inq_startObservingRemoteNotifications PSC is nil", buf, 2u);
    }

  }
}

- (void)_inq_setLastToken:(id)a3
{
  id v4;
  NSPersistentHistoryToken *v5;
  NSPersistentHistoryToken *lastToken;
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v5 = (NSPersistentHistoryToken *)objc_msgSend(v4, "copy");
  lastToken = self->_lastToken;
  self->_lastToken = v5;

  v7 = v4;
  PLRunWithUnfairLock();

}

void __61__PLPersistentHistoryChangeDistributor_beginObservingChanges__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    PLPersistentHistoryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "beginObservingChanges: _observerCount became 1 (resuming), _lastToken = %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  PLPersistentHistoryChangeDistributor *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLPersistentHistoryChangeDistributor;
  -[PLPersistentHistoryChangeDistributor dealloc](&v4, sel_dealloc);
}

- (void)stopObservingRemoteNotifications
{
  NSObject *isolationQueue;
  _QWORD block[5];

  -[PLChangeHandlingNotificationObserver stopObservingRemoteNotifications](self->_notificationObserver, "stopObservingRemoteNotifications");
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PLPersistentHistoryChangeDistributor_stopObservingRemoteNotifications__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)handleRemoteNotificationOfType:(int64_t)a3 withTransaction:(id)a4
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__PLPersistentHistoryChangeDistributor_handleRemoteNotificationOfType_withTransaction___block_invoke;
  block[3] = &unk_1E3677C40;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_sync(isolationQueue, block);

}

- (void)endObservingChanges
{
  PLRunWithUnfairLock();
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *isolationQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  __int16 v8;
  PLPersistentHistoryChangeDistributor *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v7 = objc_opt_class();
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p invalidate", buf, 0x16u);
  }

  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__PLPersistentHistoryChangeDistributor_invalidate__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)distributeNewTransactionsSinceLastToken
{
  void *v3;
  NSObject *isolationQueue;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLPersistentHistoryChangeDistributor distributeNewTransactionsSinceLastToken]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PLPersistentHistoryChangeDistributor_distributeNewTransactionsSinceLastToken__block_invoke;
  block[3] = &unk_1E3677B80;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_async(isolationQueue, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_inq_distributeNewTransactionsSinceLastTokenWithReason:(id)a3 xpcTransaction:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v8 = v6;
  PLRunWithUnfairLock();
  if (*((_BYTE *)v12 + 24))
  {
    PLPersistentHistoryGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Distributing new transactions since last token [Reason: %{public}@]", buf, 0xCu);
    }

    -[PLPersistentHistoryChangeDistributor fetchTransactionsSinceLastToken](self, "fetchTransactionsSinceLastToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[PLPersistentHistoryChangeDistributor distributeTransactions:withXPCTransaction:](self, "distributeTransactions:withXPCTransaction:", v10, v7);

  }
  _Block_object_dispose(&v11, 8);

}

- (id)fetchTransactionsSinceLastToken
{
  NSObject *v3;
  NSPersistentHistoryToken *lastToken;
  NSObject *v5;
  NSPersistentHistoryToken *v6;
  void *v7;
  NSPersistentHistoryToken *v8;
  NSObject *v9;
  NSPersistentHistoryToken *v10;
  id v12;
  uint8_t buf[4];
  NSPersistentHistoryToken *v14;
  __int16 v15;
  NSPersistentHistoryToken *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  PLPersistentHistoryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    lastToken = self->_lastToken;
    *(_DWORD *)buf = 138412290;
    v14 = lastToken;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Fetching transactions since _lastToken: %@", buf, 0xCu);
  }

  if (self->_lastToken)
  {
    -[PLPersistentHistoryChangeDistributor makeManagedObjectContext](self, "makeManagedObjectContext");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = self->_lastToken;
    v12 = 0;
    +[PLPersistentHistoryTransactionIterator iteratorSinceToken:withManagedObjectObjectContext:error:](PLPersistentHistoryTransactionIterator, "iteratorSinceToken:withManagedObjectObjectContext:error:", v6, v5, &v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSPersistentHistoryToken *)v12;
    if (!v7)
    {
      if (PLIsErrorEqualToCode())
      {
        -[PLPersistentHistoryChangeDistributor forceUserInterfaceReload](self, "forceUserInterfaceReload");
      }
      else
      {
        PLPersistentHistoryGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = self->_lastToken;
          *(_DWORD *)buf = 138412546;
          v14 = v8;
          v15 = 2112;
          v16 = v10;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error fetching transactions: %@, since token: %@", buf, 0x16u);
        }

      }
    }

  }
  else
  {
    PLPersistentHistoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "_lastKnownToken is unexpectedly nil, not fetching all history", buf, 2u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)makeManagedObjectContext
{
  void *v3;
  NSObject *v5;
  uint8_t v6[16];

  if (self->_persistentStoreCoordinator)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
    objc_msgSend(v3, "setPersistentStoreCoordinator:", self->_persistentStoreCoordinator);
    objc_msgSend(v3, "setName:", CFSTR("com.apple.photos.persistentHistoryChangeDistributor.managedObjectContext"));
    return v3;
  }
  else
  {
    PLPersistentHistoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "makeManagedObjectContext failure: PSC is nil", v6, 2u);
    }

    return 0;
  }
}

- (void)forceUserInterfaceReload
{
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  void *v4;
  NSObject *v5;
  NSPersistentHistoryToken *lastToken;
  NSObject *v7;
  int v8;
  NSPersistentHistoryToken *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  persistentStoreCoordinator = self->_persistentStoreCoordinator;
  if (persistentStoreCoordinator)
  {
    -[NSPersistentStoreCoordinator currentPersistentHistoryTokenFromStores:](persistentStoreCoordinator, "currentPersistentHistoryTokenFromStores:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistentHistoryChangeDistributor _inq_setLastToken:](self, "_inq_setLastToken:", v4);

    PLPersistentHistoryGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lastToken = self->_lastToken;
      v8 = 138412290;
      v9 = lastToken;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Forcing user interface reload set _lastToken to: %@", (uint8_t *)&v8, 0xCu);
    }

    -[PLCoreDataChangeMerger handleUnknownMergeEvent](self->_changeMerger, "handleUnknownMergeEvent");
  }
  else
  {
    PLPersistentHistoryGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "forceUserInterfaceReload: PSC is nil", (uint8_t *)&v8, 2u);
    }

  }
}

- (void)distributeTransactions:(id)a3 withXPCTransaction:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  PLCoreDataChangeMerger *changeMerger;
  id v23;
  void *v24;
  NSObject *v25;
  NSPersistentHistoryToken *lastToken;
  NSObject *v27;
  NSObject *v28;
  NSPersistentHistoryToken *v29;
  os_signpost_id_t spid;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (objc_msgSend(v6, "count"))
  {
    -[PLPersistentHistoryChangeDistributor localEventFromTransactions:](self, "localEventFromTransactions:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v8, "count"))
    {
      -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", CFSTR("PLUnknownMergeEvent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      if (v10)
      {
        PLPersistentHistoryGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Handling unknown merge event", buf, 2u);
        }

        -[PLPersistentHistoryChangeDistributor forceUserInterfaceReload](self, "forceUserInterfaceReload");
      }
      else
      {
        PLChangeHandlingGetLog();
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = os_signpost_id_generate(v13);

        v15 = v13;
        v16 = v15;
        v17 = v14 - 1;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
        {
          *(_DWORD *)buf = 134217984;
          v34 = objc_msgSend(v6, "count");
          _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "DistributeTransactions", "transaction count: %lu", buf, 0xCu);
        }
        spid = v14;

        PLPersistentHistoryGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject _pl_prettyDescription](v8, "_pl_prettyDescription", spid);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = (uint64_t)v19;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Distributing local event: %@", buf, 0xCu);

        }
        v20 = v16;
        v21 = v20;
        if (v17 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_EVENT, spid, "DistributeLocalEvent", ", buf, 2u);
        }

        changeMerger = self->_changeMerger;
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __82__PLPersistentHistoryChangeDistributor_distributeTransactions_withXPCTransaction___block_invoke;
        v31[3] = &unk_1E3677AA0;
        v23 = v7;
        v32 = v23;
        -[PLCoreDataChangeMerger mergeIntoAllContextsChangesFromRemoteContextSave:completionHandler:](changeMerger, "mergeIntoAllContextsChangesFromRemoteContextSave:completionHandler:", v8, v31);
        objc_msgSend(v6, "lastIteratedToken");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          -[PLPersistentHistoryChangeDistributor _inq_setLastToken:](self, "_inq_setLastToken:", v24);
          PLPersistentHistoryGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            lastToken = self->_lastToken;
            *(_DWORD *)buf = 138412290;
            v34 = (uint64_t)lastToken;
            _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "Distributing transactions set _lastToken to: %@", buf, 0xCu);
          }

        }
        v27 = v21;
        v28 = v27;
        if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          v29 = self->_lastToken;
          *(_DWORD *)buf = 138412290;
          v34 = (uint64_t)v29;
          _os_signpost_emit_with_name_impl(&dword_199541000, v28, OS_SIGNPOST_INTERVAL_END, spid, "DistributeTransactions", "_lastToken: %@", buf, 0xCu);
        }

        objc_msgSend(v23, "stillAlive");
      }
    }
    else
    {
      PLPersistentHistoryGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "Not distributing empty local event", buf, 2u);
      }

    }
  }
  else
  {
    PLPersistentHistoryGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Not distributing empty transaction iterator", buf, 2u);
    }
  }

}

- (id)localEventFromTransactions:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PLPersistentHistoryChangeDistributor_localEventFromTransactions___block_invoke;
  v7[3] = &unk_1E366D710;
  v8 = v3;
  v4 = v3;
  +[PLLocalChangeEventBuilder localEventWithBuilderBlock:](PLLocalChangeEventBuilder, "localEventWithBuilderBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerCountLastTokenDescription, 0);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_lastToken, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_changeMerger, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
}

void __67__PLPersistentHistoryChangeDistributor_localEventFromTransactions___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setUpdatedPropertyFilter:", &__block_literal_global_11007);
  objc_msgSend(v3, "recordAllTransactionsFromIterator:", *(_QWORD *)(a1 + 32));

}

uint64_t __82__PLPersistentHistoryChangeDistributor_distributeTransactions_withXPCTransaction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __110__PLPersistentHistoryChangeDistributor__inq_distributeNewTransactionsSinceLastTokenWithReason_xpcTransaction___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1[4] + 56))
  {
    PLPersistentHistoryGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = a1[5];
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Change distribution is paused (no observers), not distributing change (reason: %{public}@)", (uint8_t *)&v4, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
}

void __79__PLPersistentHistoryChangeDistributor_distributeNewTransactionsSinceLastToken__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_inq_distributeNewTransactionsSinceLastTokenWithReason:xpcTransaction:", CFSTR("requested"), *(_QWORD *)(a1 + 32));

}

void __50__PLPersistentHistoryChangeDistributor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

void __59__PLPersistentHistoryChangeDistributor_endObservingChanges__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint32_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 56);
  if (v2)
  {
    *(_QWORD *)(v1 + 56) = v2 - 1;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
      return;
    PLPersistentHistoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
      v10 = 138543362;
      v11 = v5;
      v6 = "endObservingChanges: _observerCount became 0 (pausing), _lastToken = %{public}@";
      v7 = v4;
      v8 = OS_LOG_TYPE_DEFAULT;
      v9 = 12;
LABEL_7:
      _os_log_impl(&dword_199541000, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    PLPersistentHistoryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      v6 = "endObservingChanges: observerCount is already 0";
      v7 = v4;
      v8 = OS_LOG_TYPE_ERROR;
      v9 = 2;
      goto LABEL_7;
    }
  }

}

uint64_t __87__PLPersistentHistoryChangeDistributor_handleRemoteNotificationOfType_withTransaction___block_invoke(uint64_t a1)
{
  const __CFString *v1;

  if (*(_QWORD *)(a1 + 48) == 1)
    v1 = CFSTR("notification-high");
  else
    v1 = CFSTR("notification-low");
  return objc_msgSend(*(id *)(a1 + 32), "_inq_distributeNewTransactionsSinceLastTokenWithReason:xpcTransaction:", v1, *(_QWORD *)(a1 + 40));
}

uint64_t __72__PLPersistentHistoryChangeDistributor_stopObservingRemoteNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inq_setLastToken:", 0);
}

void __78__PLPersistentHistoryChangeDistributor__inq_startObservingRemoteNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "handleRemoteNotificationOfType:withTransaction:", a2, v5);

}

@end
