@implementation PLCloudPersistentHistoryChangeTracker

- (PLCloudPersistentHistoryChangeTracker)initWithPersistentStoreCoordinator:(id)a3 libraryBundle:(id)a4
{
  id v8;
  id v9;
  PLCloudPersistentHistoryChangeTracker *v10;
  PLCloudPersistentHistoryChangeTracker *v11;
  uint64_t v12;
  PLChangeHandlingNotificationObserver *notificationObserver;
  PLCloudPersistentHistoryChangeTracker *v14;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLCloudPersistentHistoryChangeTracker;
  v10 = -[PLCloudPersistentHistoryChangeTracker init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_coordinator, a3);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("PLCloudPersistentHistoryChangeTracker.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundle"));

    }
    objc_msgSend(v9, "makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:", 0.0);
    v12 = objc_claimAutoreleasedReturnValue();
    notificationObserver = v11->_notificationObserver;
    v11->_notificationObserver = (PLChangeHandlingNotificationObserver *)v12;

    v14 = v11;
  }

  return v11;
}

- (NSString)name
{
  return (NSString *)CFSTR("Core Data Persistent History");
}

- (BOOL)hasChangeTrackerToken
{
  NSObject *v3;
  NSPersistentHistoryToken *lastKnownToken;
  int v6;
  const char *v7;
  __int16 v8;
  NSPersistentHistoryToken *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      lastKnownToken = self->_lastKnownToken;
      v6 = 136315394;
      v7 = "-[PLCloudPersistentHistoryChangeTracker hasChangeTrackerToken]";
      v8 = 2112;
      v9 = lastKnownToken;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  return self->_lastKnownToken != 0;
}

- (NSString)lastKnownTokenDescription
{
  NSObject *v3;
  NSPersistentHistoryToken *lastKnownToken;
  int v6;
  const char *v7;
  __int16 v8;
  NSPersistentHistoryToken *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      lastKnownToken = self->_lastKnownToken;
      v6 = 136315394;
      v7 = "-[PLCloudPersistentHistoryChangeTracker lastKnownTokenDescription]";
      v8 = 2112;
      v9 = lastKnownToken;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v6, 0x16u);
    }

  }
  -[NSPersistentHistoryToken description](self->_lastKnownToken, "description");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)clearToken
{
  NSObject *v3;
  NSPersistentHistoryToken *lastKnownToken;
  uint8_t v5[16];

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Clearing last known tokens", v5, 2u);
    }

  }
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = 0;

}

- (BOOL)connectWithContext:(id)a3
{
  id v4;
  _BYTE *v5;
  NSObject *v6;
  void *v7;
  NSPersistentHistoryToken *v8;
  NSPersistentHistoryToken *lastKnownToken;
  NSObject *v10;
  NSPersistentHistoryToken *v11;
  int v13;
  NSPersistentHistoryToken *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLCloudPersistentHistoryChangeTracker clearToken](self, "clearToken");
  -[PLCloudPersistentHistoryChangeTracker _registerForChangeHandlingNotifications](self, "_registerForChangeHandlingNotifications");
  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Registered for change handling notification", (uint8_t *)&v13, 2u);
    }

  }
  -[PLCloudPersistentHistoryChangeTracker lastKnownTokenFromDisk](self, "lastKnownTokenFromDisk");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PLCloudPersistentHistoryChangeTracker currentToken](self, "currentToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = (NSPersistentHistoryToken *)objc_msgSend(v7, "copy");
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = v8;

  if (!*v5)
  {
    __CPLAssetsdOSLogDomain();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = self->_lastKnownToken;
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Set initial last known tokens to: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  -[PLCloudPersistentHistoryChangeTracker saveLastKnownChangeTrackerTokenToDiskWithContext:](self, "saveLastKnownChangeTrackerTokenToDiskWithContext:", v4);

  return 1;
}

- (id)lastKnownTokenFromDisk
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "readCloudTrackerToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Last known token from disk: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  return v3;
}

- (void)saveLastKnownChangeTrackerTokenToDiskWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSPersistentHistoryToken *lastKnownToken;
  id WeakRetained;
  int v8;
  NSPersistentHistoryToken *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lastKnownToken = self->_lastKnownToken;
      v8 = 138412290;
      v9 = lastKnownToken;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Saving last known token to disk: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "saveCloudTrackerToken:withContext:", self->_lastKnownToken, v4);

}

- (void)disconnect
{
  -[PLCloudPersistentHistoryChangeTracker clearToken](self, "clearToken");
  -[PLCloudPersistentHistoryChangeTracker _unregisterForChangeHandlingNotifications](self, "_unregisterForChangeHandlingNotifications");
}

- (BOOL)isConnected
{
  return 1;
}

- (void)changeTrackerDidReceiveChangesWithTransaction:(id)a3
{
  PLCloudPersistentHistoryChangeTrackerDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "cloudChangeTrackerDidReceiveChangesWithTransaction:", v4);

}

- (void)_registerForChangeHandlingNotifications
{
  PLChangeHandlingNotificationObserver *notificationObserver;
  _QWORD v4[4];
  id v5;
  id location;

  -[PLCloudPersistentHistoryChangeTracker _unregisterForChangeHandlingNotifications](self, "_unregisterForChangeHandlingNotifications");
  objc_initWeak(&location, self);
  notificationObserver = self->_notificationObserver;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__PLCloudPersistentHistoryChangeTracker__registerForChangeHandlingNotifications__block_invoke;
  v4[3] = &unk_1E3674308;
  objc_copyWeak(&v5, &location);
  -[PLChangeHandlingNotificationObserver startObservingRemoteNotificationsWithBlock:](notificationObserver, "startObservingRemoteNotificationsWithBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_unregisterForChangeHandlingNotifications
{
  -[PLChangeHandlingNotificationObserver stopObservingRemoteNotifications](self->_notificationObserver, "stopObservingRemoteNotifications");
}

- (id)_eventsResultFromPersistentHistoryToken:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  v5 = a3;
  v6 = a4;
  if (!v5 && !*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Token is nil so fetching ALL transactions", v10, 2u);
    }

  }
  +[PLCloudPersistentHistoryTransactionsResult fetchTransactionsSinceToken:inContext:](PLCloudPersistentHistoryTransactionsResult, "fetchTransactionsSinceToken:inContext:", v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)fetchAllEventsInContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSPersistentHistoryToken *lastKnownToken;
  void *v7;
  int v9;
  NSPersistentHistoryToken *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      lastKnownToken = self->_lastKnownToken;
      v9 = 138412290;
      v10 = lastKnownToken;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Fetch all events since token: %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[PLCloudPersistentHistoryChangeTracker _eventsResultFromPersistentHistoryToken:inContext:](self, "_eventsResultFromPersistentHistoryToken:inContext:", self->_lastKnownToken, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)currentToken
{
  return -[NSPersistentStoreCoordinator currentPersistentHistoryTokenFromStores:](self->_coordinator, "currentPersistentHistoryTokenFromStores:", 0);
}

- (void)forceTokenToCurrent
{
  void *v3;
  NSObject *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[NSPersistentStoreCoordinator currentPersistentHistoryTokenFromStores:](self->_coordinator, "currentPersistentHistoryTokenFromStores:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "Forcing last known tokens to current: %@", (uint8_t *)&v5, 0xCu);
    }

  }
  -[PLCloudPersistentHistoryChangeTracker _updateLastKnownTokensToToken:](self, "_updateLastKnownTokensToToken:", v3);

}

- (void)updateLastKnownTokenToResult:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "resultType"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPersistentHistoryChangeTracker.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result.resultType == PLCloudChangeEventsResultSuccess"));

  }
  v6 = objc_opt_class();
  v7 = v5;
  if (!v7)
    goto LABEL_9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PLHelperExtension.h"), 76, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_9:
    v9 = 0;
  }

  objc_msgSend(v9, "lastProcessedCoreDataToken");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Updating last known tokens from result token: %@", buf, 0xCu);
    }

  }
  if (v12)
    -[PLCloudPersistentHistoryChangeTracker _updateLastKnownTokensToToken:](self, "_updateLastKnownTokensToToken:", v12);

}

- (void)_updateLastKnownTokensToToken:(id)a3
{
  NSPersistentHistoryToken *v4;
  NSPersistentHistoryToken *lastKnownToken;

  v4 = (NSPersistentHistoryToken *)objc_msgSend(a3, "copy");
  lastKnownToken = self->_lastKnownToken;
  self->_lastKnownToken = v4;

}

- (PLCloudPersistentHistoryChangeTrackerDelegate)delegate
{
  return (PLCloudPersistentHistoryChangeTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notificationObserver, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_lastKnownToken, 0);
}

void __80__PLCloudPersistentHistoryChangeTracker__registerForChangeHandlingNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "changeTrackerDidReceiveChangesWithTransaction:", v4);

}

@end
