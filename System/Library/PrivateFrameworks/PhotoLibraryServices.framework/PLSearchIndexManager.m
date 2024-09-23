@implementation PLSearchIndexManager

__CFString *__38__PLSearchIndexManager__onQueueAsync___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
    return CFSTR("Closed");
  else
    return (__CFString *)0;
}

- (void)pauseIndexingWithReason:(id)a3
{
  -[PLSearchIndexManager _setIndexingPaused:synchronously:reason:](self, "_setIndexingPaused:synchronously:reason:", 1, 0, a3);
}

- (BOOL)_setIndexingPaused:(BOOL)a3 synchronously:(BOOL)a4 reason:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  BOOL v12;
  _QWORD v14[5];
  id v15;
  BOOL v16;

  v5 = a4;
  v8 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__PLSearchIndexManager__setIndexingPaused_synchronously_reason___block_invoke;
  v14[3] = &unk_1E3675C80;
  v16 = a3;
  v14[4] = self;
  v15 = v8;
  v9 = v8;
  v10 = (void *)MEMORY[0x19AEC174C](v14);
  if (v5)
    v11 = -[PLSearchIndexManager _onQueueSync:](self, "_onQueueSync:", v10);
  else
    v11 = -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v10);
  v12 = v11;

  return v12;
}

- (void)_preferencesDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__PLSearchIndexManager__preferencesDidChange__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v2);
}

- (BOOL)_onQueueAsync:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  PLResultWithUnfairLock();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    dispatch_async((dispatch_queue_t)self->_queue, v4);

  return v5 == 0;
}

uint64_t __64__PLSearchIndexManager__setIndexingPaused_synchronously_reason___block_invoke(uint64_t a1)
{
  _BOOL8 v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_inqSetIndexingPaused:reason:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
  {
    v2 = 1;
  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Indexing unpaused for reason: %{public}@. Resuming indexing if needed for %{public}@.", (uint8_t *)&v7, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_inqResumeIndexingIfNeeded");
    v2 = *(_BYTE *)(a1 + 48) != 0;
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setPaused:", v2);
}

- (void)_inqTakeClientServerTransactionIfNeeded
{
  PLClientServerTransaction **p_serverTransaction;
  PLClientServerTransaction *serverTransaction;
  NSObject *v5;
  _BOOL4 v6;
  PLClientServerTransaction *v7;
  void *v8;
  PLClientServerTransaction *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  PLClientServerTransaction *v16;
  void *v17;
  int v18;
  PLClientServerTransaction *v19;
  __int16 v20;
  PLClientServerTransaction *v21;
  __int16 v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  p_serverTransaction = &self->_serverTransaction;
  serverTransaction = self->_serverTransaction;
  PLSearchBackendIndexManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (serverTransaction)
  {
    if (v6)
    {
      v7 = self->_serverTransaction;
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134349570;
      v19 = v7;
      v20 = 2112;
      v21 = v7;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Server Transaction [Exists]: %{public}p, %@ for %{public}@", (uint8_t *)&v18, 0x20u);

    }
  }
  else
  {
    if (v6)
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v9 = (PLClientServerTransaction *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v9;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Server Transaction [Opening] for %{public}@", (uint8_t *)&v18, 0xCu);

    }
    v10 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = CFSTR("PLTransactionScopeSearchIndex");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v5 = objc_claimAutoreleasedReturnValue();

    +[PLClientServerTransaction beginClientTransactionWithChangeScopes:pathManager:identifier:](PLClientServerTransaction, "beginClientTransactionWithChangeScopes:pathManager:identifier:", v5, self->_pathManager, "-[PLSearchIndexManager _inqTakeClientServerTransactionIfNeeded]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transactionToken");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v13, v5, self->_pathManager, "-[PLSearchIndexManager _inqTakeClientServerTransactionIfNeeded]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_serverTransaction, v14);
    objc_msgSend(v12, "completeTransaction");
    PLSearchBackendIndexManagerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_serverTransaction;
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 134349570;
      v19 = v16;
      v20 = 2112;
      v21 = v16;
      v22 = 2114;
      v23 = v17;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Server Transaction [Opened]: %{public}p, %@ for %{public}@", (uint8_t *)&v18, 0x20u);

    }
    self->_serverTransactionStartTime = CFAbsoluteTimeGetCurrent();

  }
}

- (void)_inqSetIndexingPaused:(BOOL)a3 reason:(id)a4
{
  _BOOL4 v4;
  PLSearchIndexManager *v6;
  _BOOL4 v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *v10;
  PLSearchIndexManager *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  PLSearchIndexManager *v15;
  PLSearchIndexManager *v16;
  _BOOL8 v17;
  _BOOL8 v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  PLSearchIndexManager *v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  PLSearchIndexManager *v28;
  __int16 v29;
  PLSearchIndexManager *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v6 = (PLSearchIndexManager *)a4;
  v7 = -[PLSearchIndexManager _inqIsIndexingPaused](self, "_inqIsIndexingPaused");
  -[PLSearchIndexManager _pauseReasons](self, "_pauseReasons");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v4)
  {
    PLSearchBackendIndexManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v11 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
      v25 = 138543874;
      v26 = (const __CFString *)v6;
      v27 = 2050;
      v28 = self;
      v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Search Indexing was asked to pause for reason: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x20u);

    }
    -[__CFString addObject:](v9, "addObject:", v6);
  }
  else
  {
    v12 = -[__CFString containsObject:](v8, "containsObject:", v6);
    PLSearchBackendIndexManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v15 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = (const __CFString *)v6;
        v27 = 2050;
        v28 = self;
        v29 = 2114;
        v30 = v15;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Search Indexing was asked to unpause for reason: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x20u);

      }
      -[__CFString removeObject:](v9, "removeObject:", v6);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v16 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
        v25 = 138543874;
        v26 = (const __CFString *)v6;
        v27 = 2050;
        v28 = self;
        v29 = 2114;
        v30 = v16;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Search Indexing was asked to unpause for (unbalanced) reason: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x20u);

      }
    }
  }
  v17 = -[PLSearchIndexManager _inqIsIndexingPaused](self, "_inqIsIndexingPaused");
  if (v7 != v17)
  {
    v18 = v17;
    PLSearchBackendIndexManagerGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (v18)
        v20 = CFSTR("paused");
      else
        v20 = CFSTR("unpaused");
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138544130;
      v26 = v20;
      v27 = 2114;
      v28 = v6;
      v29 = 2050;
      v30 = self;
      v31 = 2114;
      v32 = v21;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Search Indexing [%{public}@] for reason: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x2Au);

    }
    -[PLSearchIndexManager spotlightDonationManager](self, "spotlightDonationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSpotlightOperationQueueSuspended:", v18);

  }
  PLSearchBackendIndexManagerGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v24 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v9;
    v27 = 2050;
    v28 = self;
    v29 = 2114;
    v30 = v24;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Search Indexing pause reasons: '%{public}@'. Search Index Manager: %{public}p for %{public}@", (uint8_t *)&v25, 0x20u);

  }
}

- (NSString)photoLibraryTypeDescription
{
  NSString *photoLibraryTypeDescription;
  void *v4;
  NSString *v5;
  NSString *v6;

  photoLibraryTypeDescription = self->_photoLibraryTypeDescription;
  if (!photoLibraryTypeDescription)
  {
    -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLPhotolibraryWellKnownIdentifierDescriptionForPhotoLibrary(v4);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_photoLibraryTypeDescription;
    self->_photoLibraryTypeDescription = v5;

    photoLibraryTypeDescription = self->_photoLibraryTypeDescription;
  }
  return photoLibraryTypeDescription;
}

- (BOOL)_inqIsIndexingPaused
{
  void *v2;
  BOOL v3;

  -[PLSearchIndexManager _pauseReasons](self, "_pauseReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSCountedSet)_pauseReasons
{
  return self->__pauseReasons;
}

- (PLSpotlightDonationManager)spotlightDonationManager
{
  return self->_spotlightDonationManager;
}

- (id)_inqPhotoLibrary
{
  -[PLSearchIndexManager _inqEnsurePhotoLibraryExists](self, "_inqEnsurePhotoLibraryExists");
  return self->_photoLibrary;
}

- (void)_inqEnsurePhotoLibraryExists
{
  PLPhotoLibraryOptions *v3;
  void *v4;
  PLPhotoLibrary *v5;
  id v6;
  PLPhotoLibrary *photoLibrary;
  NSObject *v8;
  void *v9;
  PLSearchIndexDateFormatter *v10;
  PLSearchIndexDateFormatter *dateFormatter;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_photoLibrary)
  {
    v3 = objc_alloc_init(PLPhotoLibraryOptions);
    -[PLPhotoLibraryOptions setRequiredState:](v3, "setRequiredState:", 6);
    -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v3, "setAutomaticallyPinToFirstFetch:", 0);
    -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v5 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLSearchIndexManager _inqEnsurePhotoLibraryExists]", v4, v3, &v12);
    v6 = v12;
    photoLibrary = self->_photoLibrary;
    self->_photoLibrary = v5;

    if (!self->_photoLibrary)
    {
      PLSearchBackendIndexManagerGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Failed to load Photo Library from path \"%@\". Error: %@", buf, 0x16u);

      }
    }

  }
  if (!self->_dateFormatter)
  {
    v10 = objc_alloc_init(PLSearchIndexDateFormatter);
    dateFormatter = self->_dateFormatter;
    self->_dateFormatter = v10;

  }
}

uint64_t __45__PLSearchIndexManager__preferencesDidChange__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Preferences changed. Resuming indexing if needed for %{public}@.", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_inqResumeIndexingIfNeeded");
}

- (void)setDatePausedIndexingOnBattery:(id)a3
{
  objc_storeStrong((id *)&self->_datePausedIndexingOnBattery, a3);
}

- (void)setDateBeganIndexingOnBattery:(id)a3
{
  objc_storeStrong((id *)&self->_dateBeganIndexingOnBattery, a3);
}

- (id)searchIndexManagerSignpostLog
{
  if (searchIndexManagerSignpostLog_onceToken != -1)
    dispatch_once(&searchIndexManagerSignpostLog_onceToken, &__block_literal_global_316);
  return (id)searchIndexManagerSignpostLog_searchIndexManagerSignpostLog;
}

- (BOOL)_shouldResumeIndexingBasedOnDevicePowerStatusOrDAS
{
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v27;
  _BYTE v28[22];
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_opt_class(), "_isUnboundedIndexingAllowed");
  if (!self->_shouldLimitIndexingWhileOnBattery || (v3 & 1) != 0)
  {
    if (self->_shouldLimitIndexingWhileOnBattery)
    {
      if (!v3)
      {
LABEL_18:
        -[PLSearchIndexManager setDateBeganIndexingOnBattery:](self, "setDateBeganIndexingOnBattery:", 0, *(_OWORD *)v28);
        -[PLSearchIndexManager setDatePausedIndexingOnBattery:](self, "setDatePausedIndexingOnBattery:", 0);
        return 1;
      }
      PLSearchBackendIndexManagerGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543362;
        *(_QWORD *)&v28[4] = v14;
        v15 = "Indexing on power or because DAS has allowed indexing for %{public}@.";
LABEL_16:
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, v15, v28, 0xCu);

      }
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543362;
        *(_QWORD *)&v28[4] = v14;
        v15 = "Battery indexing limitations overridden, no battery or DAS indexing limits applied for %{public}@.";
        goto LABEL_16;
      }
    }

    goto LABEL_18;
  }
  -[PLSearchIndexManager dateBeganIndexingOnBattery](self, "dateBeganIndexingOnBattery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PLSearchIndexManager datePausedIndexingOnBattery](self, "datePausedIndexingOnBattery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PLSearchIndexManager datePausedIndexingOnBattery](self, "datePausedIndexingOnBattery");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceNow");
      v19 = (0.0 - v18) / 60.0;

      PLSearchBackendIndexManagerGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (v19 <= 60.0)
      {
        if (v21)
        {
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v28 = 134218498;
          *(double *)&v28[4] = v19;
          *(_WORD *)&v28[12] = 2114;
          *(_QWORD *)&v28[14] = v27;
          v29 = 2048;
          v30 = 60;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Search indexing on battery has been paused for %f minutes for %{public}@, indexing will remain paused for a minimum of %tu minutes.", v28, 0x20u);

        }
        return 0;
      }
      if (v21)
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 134218498;
        *(double *)&v28[4] = v19;
        *(_WORD *)&v28[12] = 2114;
        *(_QWORD *)&v28[14] = v22;
        v29 = 2048;
        v30 = 5;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Search indexing on battery has been paused for %f minutes for %{public}@, resuming indexing for %tu minutes.", v28, 0x20u);

      }
      -[PLSearchIndexManager setDatePausedIndexingOnBattery:](self, "setDatePausedIndexingOnBattery:", 0);
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v28 = 138543362;
        *(_QWORD *)&v28[4] = v24;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Began indexing on battery for %{public}@.", v28, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSearchIndexManager setDateBeganIndexingOnBattery:](self, "setDateBeganIndexingOnBattery:", v25);

    return 1;
  }
  PLSearchBackendIndexManagerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 138543362;
    *(_QWORD *)&v28[4] = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Indexing on battery for %{public}@.", v28, 0xCu);

  }
  -[PLSearchIndexManager dateBeganIndexingOnBattery](self, "dateBeganIndexingOnBattery");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = (0.0 - v8) / 60.0;

  if (v9 <= 5.0)
    return 1;
  PLSearchBackendIndexManagerGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v28 = 134218498;
    *(double *)&v28[4] = v9;
    *(_WORD *)&v28[12] = 2114;
    *(_QWORD *)&v28[14] = v11;
    v29 = 2048;
    v30 = 60;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Search has been indexing on battery for %f minutes for %{public}@, pausing indexing for %tu minutes.", v28, 0x20u);

  }
  -[PLSearchIndexManager setDateBeganIndexingOnBattery:](self, "setDateBeganIndexingOnBattery:", 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchIndexManager setDatePausedIndexingOnBattery:](self, "setDatePausedIndexingOnBattery:", v12);

  -[PLSearchIndexManager _inqCloseIndexIfAbleOrForce:isDelete:](self, "_inqCloseIndexIfAbleOrForce:isDelete:", 1, 0);
  return 0;
}

- (BOOL)_isIndexing
{
  return self->__indexing;
}

- (void)_inqValidateSearchIndexWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int64_t v12;
  uint8_t v13[16];
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__PLSearchIndexManager__inqValidateSearchIndexWithCompletionHandler___block_invoke;
  v14[3] = &unk_1E36649F8;
  v14[4] = self;
  v5 = (void (**)(_QWORD))v4;
  v15 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v14);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "globalValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "searchIndexVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "globalValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSearchIndexSceneTaxonomySHA:", 0);

      PLSearchBackendIndexManagerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Reindexing because feature flag PhotosSearchBackgroundJobWorker was turned off", v13, 2u);
      }

      v6[2](v6, 9);
      goto LABEL_11;
    }

  }
  v12 = -[PLSearchIndexManager _inqRebuildReasonIfSearchIndexIsValid](self, "_inqRebuildReasonIfSearchIndexIsValid");
  if (v12
    || (v12 = -[PLSearchIndexManager _inqSpotlightRequestedRebuild](self, "_inqSpotlightRequestedRebuild")) != 0
    || (-[PLSearchIndexManager _inqEnsureSearchIndexExists](self, "_inqEnsureSearchIndexExists"),
        -[PLSearchIndexManager _inqEnsureSceneTaxonomyProxyExists](self, "_inqEnsureSceneTaxonomyProxyExists"),
        -[PLSearchIndexManager _inqEnsureCSUTaxonomyProxyExists](self, "_inqEnsureCSUTaxonomyProxyExists"),
        (v12 = -[PLSearchIndexManager _inqRebuildReasonIfSearchSupportingDataIsValid](self, "_inqRebuildReasonIfSearchSupportingDataIsValid")) != 0))
  {
    v6[2](v6, v12);
  }
  else if (v5)
  {
    v5[2](v5);
  }
LABEL_11:

}

- (int64_t)_inqSpotlightRequestedRebuild
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
  int64_t v6;

  -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[PLSpotlightProgressManager shouldReindexSpotlightIndexForPhotoLibraryPathManager:](PLSpotlightProgressManager, "shouldReindexSpotlightIndexForPhotoLibraryPathManager:", v4);

    if (v5)
      v6 = 8;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_inqResumeIndexingIfNeeded
{
  NSObject *v3;
  NSObject *v4;
  PLSearchIndexManager *v5;
  void *v6;
  PLSearchIndexManager *v7;
  NSObject *v8;
  PLSearchIndexManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSDictionary *inqUUIDsToProcess;
  id v15;
  CFAbsoluteTime Current;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  PLSearchIndexManager *v28;
  void *v29;
  NSObject *v30;
  double lastKnownElapsedIndexingTime;
  void *v32;
  NSDate *v33;
  NSDate *dateOfLastSearchIndexRebuild;
  NSObject *v35;
  PLSearchIndexManager *v36;
  NSObject *v37;
  PLSearchIndexManager *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  BOOL v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  os_signpost_id_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  _QWORD v82[5];
  id v83;
  id v84;
  id v85;
  id v86;
  NSObject *v87;
  id v88;
  _QWORD *v89;
  CFAbsoluteTime v90;
  os_signpost_id_t v91;
  BOOL v92;
  BOOL v93;
  _QWORD v94[4];
  id v95;
  PLSearchIndexManager *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  NSObject *v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  _QWORD *v109;
  BOOL v110;
  _QWORD v111[5];
  id v112;
  _QWORD v113[5];
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD *v117;
  _QWORD v118[4];
  uint8_t buf[4];
  PLSearchIndexManager *v120;
  __int16 v121;
  uint64_t v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  void *v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  +[PLFileDescriptorFuse checkFileDescriptorFuse](PLFileDescriptorFuse, "checkFileDescriptorFuse");
  -[PLSearchIndexManager searchIndexManagerSignpostLog](self, "searchIndexManagerSignpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (-[PLSearchIndexManager _inqIsIndexingPaused](self, "_inqIsIndexingPaused"))
  {
    PLSearchBackendIndexManagerGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSearchIndexManager _pauseReasons](self, "_pauseReasons");
      v5 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v120 = v5;
      v121 = 2114;
      v122 = (uint64_t)v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Not resuming because indexing is paused. Pause reasons: %{public}@ for %{public}@", buf, 0x16u);

    }
LABEL_4:

    goto LABEL_44;
  }
  if (-[PLSearchIndexManager _isIndexing](self, "_isIndexing"))
  {
    PLSearchBackendIndexManagerGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v7 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v120 = v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Already indexing a batch of content. Not resuming because indexing work is already in progress for %{public}@.", buf, 0xCu);

    }
    goto LABEL_4;
  }
  if (!-[PLSearchIndexManager _shouldResumeIndexingBasedOnDevicePowerStatusOrDAS](self, "_shouldResumeIndexingBasedOnDevicePowerStatusOrDAS"))goto LABEL_44;
  PLSearchBackendIndexManagerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v9 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v120 = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Resuming indexing for %{public}@.", buf, 0xCu);

  }
  -[PLSearchIndexManager _inqValidateSearchIndexWithCompletionHandler:](self, "_inqValidateSearchIndexWithCompletionHandler:", 0);
  -[PLSearchIndexManager _inqTrackTransitionFromUpdateScheduledToUpdatingIfAble](self, "_inqTrackTransitionFromUpdateScheduledToUpdatingIfAble");
  -[PLSearchIndexManager _inqEnsureSearchProgressExists](self, "_inqEnsureSearchProgressExists");
  if (-[PLSearchIndexManager _inqEnqueuedUUIDsCountForceLoad:](self, "_inqEnqueuedUUIDsCountForceLoad:", 0))
  {
    self->_startedIndexing = 1;
    -[PLSearchIndexManager _inqEnsureSceneTaxonomyProxyExists](self, "_inqEnsureSceneTaxonomyProxyExists");
    -[PLSearchIndexManager _inqEnsureCSUTaxonomyProxyExists](self, "_inqEnsureCSUTaxonomyProxyExists");
    -[PLSearchIndexManager _setIndexing:](self, "_setIndexing:", 1);
    PLSearchBackendIndexManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v120 = self;
      v121 = 2114;
      v122 = (uint64_t)v11;
      v123 = 2112;
      v124 = (uint64_t)v12;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Indexing Batch: [BEGIN]. Search Index Manager: %{public}p for %{public}@, PhotoLibrary path: %@", buf, 0x20u);

    }
    self->_receivedUpdatesWhileIndexing = 0;
    v118[0] = 0;
    v118[1] = v118;
    v118[2] = 0x2020000000;
    v118[3] = 0;
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    inqUUIDsToProcess = self->_inqUUIDsToProcess;
    v115[0] = MEMORY[0x1E0C809B0];
    v115[1] = 3221225472;
    v115[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke;
    v115[3] = &unk_1E3661B28;
    v117 = v118;
    v15 = v13;
    v116 = v15;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inqUUIDsToProcess, "enumerateKeysAndObjectsUsingBlock:", v115);
    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
    v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 32);
    v113[0] = 0;
    v113[1] = v113;
    v113[2] = 0x3032000000;
    v113[3] = __Block_byref_object_copy__6301;
    v113[4] = __Block_byref_object_dispose__6302;
    v114 = 0;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("insertAsset"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("insertHighlight"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("insertAlbum"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("insertMemory"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("removeMemory"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("renamePerson"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    PLSearchBackendIndexManagerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v80, "count");
      v19 = objc_msgSend(v78, "count");
      v20 = objc_msgSend(v76, "count");
      v21 = objc_msgSend(v75, "count");
      v22 = objc_msgSend(v74, "count");
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134350338;
      v120 = (PLSearchIndexManager *)v18;
      v121 = 2050;
      v122 = v19;
      v123 = 2050;
      v124 = v20;
      v125 = 2050;
      v126 = v21;
      v127 = 2050;
      v128 = v22;
      v129 = 2114;
      v130 = v23;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Indexing batch of %{public}lu Assets, %{public}lu Highlights, %{public}ld Albums, %{public}ld Memories, %{public}ld Renamed Persons for %{public}@", buf, 0x3Eu);

    }
    v24 = os_signpost_id_generate(v3);
    v25 = v3;
    v26 = v25;
    if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "SearchIndexManager - IndexBatch", ", buf, 2u);
    }
    v66 = v26;
    v67 = v24;

    if (_os_feature_enabled_impl())
    {
      PLSearchBackendIndexManagerGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v28 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v120 = v28;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_INFO, "Skipping graph data validation, %{public}@", buf, 0xCu);

      }
      v29 = (void *)MEMORY[0x1E0C9AA70];
      v64 = MEMORY[0x1E0C9AA70];
    }
    else
    {
      v29 = (void *)-[NSMutableDictionary copy](self->_inqSynonymsByIndexCategoryMask, "copy");
      v27 = -[NSMutableDictionary copy](self->_inqGraphDataByUUID, "copy");
      if (+[PLSearchIndexKnowledgeGraphDataValidator isGraphDataValid:](PLSearchIndexKnowledgeGraphDataValidator, "isGraphDataValid:", v27))
      {
        v64 = v27;
LABEL_41:
        -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "libraryServicesManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "wellKnownPhotoLibraryIdentifier");

        v44 = +[PLSpotlightDonationUtilities isUniversalSearchEnabledForPhotoLibrary:](PLSpotlightDonationUtilities, "isUniversalSearchEnabledForPhotoLibrary:", v41);
        v63 = v43 == 3;
        objc_msgSend(v29, "objectForKeyedSubscript:", &unk_1E375D740);
        v45 = objc_claimAutoreleasedReturnValue();
        v46 = (void *)v45;
        v47 = (void *)MEMORY[0x1E0C9AA70];
        if (v45)
          v47 = (void *)v45;
        v48 = v47;

        v49 = (void *)objc_opt_new();
        v111[0] = MEMORY[0x1E0C809B0];
        v111[1] = 3221225472;
        v111[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_227;
        v111[3] = &unk_1E3661B50;
        v111[4] = self;
        v50 = v49;
        v112 = v50;
        v51 = (void *)MEMORY[0x19AEC174C](v111);
        v52 = MEMORY[0x1E0C809B0];
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_229;
        v94[3] = &unk_1E3661BA0;
        v53 = v41;
        v95 = v53;
        v96 = self;
        v59 = v69;
        v97 = v59;
        v70 = v48;
        v98 = v70;
        v62 = v29;
        v99 = v62;
        v60 = v80;
        v100 = v60;
        v65 = v64;
        v101 = v65;
        v102 = v72;
        v110 = v44;
        v81 = v51;
        v108 = v81;
        v61 = v78;
        v103 = v61;
        v73 = v76;
        v104 = v73;
        v105 = v71;
        v77 = v75;
        v106 = v77;
        v109 = v113;
        v79 = v68;
        v107 = v79;
        v82[0] = v52;
        v82[1] = 3221225472;
        v82[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_241;
        v82[3] = &unk_1E3661C40;
        v90 = Current;
        v82[4] = self;
        v54 = v15;
        v83 = v54;
        v89 = v113;
        v55 = v102;
        v84 = v55;
        v56 = v105;
        v85 = v56;
        v57 = v74;
        v86 = v57;
        v87 = v66;
        v91 = v67;
        v92 = v44;
        v93 = v63;
        v58 = v50;
        v88 = v58;
        objc_msgSend(v53, "performBlock:completionHandler:", v94, v82);

        _Block_object_dispose(v113, 8);
        _Block_object_dispose(v118, 8);
        goto LABEL_44;
      }
      PLSearchBackendIndexManagerGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v120 = (PLSearchIndexManager *)v27;
        v121 = 2114;
        v122 = (uint64_t)v40;
        _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Detected Invalid Knowledge Graph data. Not indexing Knowledge Graph data: %@ for %{public}@", buf, 0x16u);

      }
      v64 = 0;
    }

    goto LABEL_41;
  }
  if (!self->_startedIndexing || self->_lastIndexingStartTime == 0.0)
  {
    PLSearchBackendIndexManagerGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v36 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v120 = v36;
      _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "Search Indexing is Finished for %{public}@.", buf, 0xCu);

    }
  }
  else
  {
    self->_lastKnownElapsedIndexingTime = CFAbsoluteTimeGetCurrent() - self->_lastIndexingStartTime;
    PLSearchBackendIndexManagerGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      lastKnownElapsedIndexingTime = self->_lastKnownElapsedIndexingTime;
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349314;
      v120 = *(PLSearchIndexManager **)&lastKnownElapsedIndexingTime;
      v121 = 2114;
      v122 = (uint64_t)v32;
      _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "Search Indexing is Finished. Took %{public}f seconds for %{public}@.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
    dateOfLastSearchIndexRebuild = self->_dateOfLastSearchIndexRebuild;
    self->_dateOfLastSearchIndexRebuild = v33;

    self->_lastIndexingStartTime = 0.0;
    self->_startedIndexing = 0;
  }
  PLSearchBackendIndexManagerGetLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v38 = (PLSearchIndexManager *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v120 = v38;
    _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "Finished indexing for the Photos Search Index (enqueuedUUIDs count is 0). Scheduling search index close if needed for %{public}@.", buf, 0xCu);

  }
  -[PLSearchIndexManager _inqScheduleCloseIndexIfNeeded](self, "_inqScheduleCloseIndexIfNeeded");
  -[PLSearchIndexManager setDateBeganIndexingOnBattery:](self, "setDateBeganIndexingOnBattery:", 0);
  -[PLSearchIndexManager setDatePausedIndexingOnBattery:](self, "setDatePausedIndexingOnBattery:", 0);
LABEL_44:

}

- (int64_t)_inqRebuildReasonIfSearchIndexIsValid
{
  int64_t result;

  -[PLSearchIndexManager _inqEnsureSearchSystemInfoExists](self, "_inqEnsureSearchSystemInfoExists");
  if (self->_hasValidSearchIndex)
    return 0;
  result = -[PLSearchIndexManager _inqUpdateVersion](self, "_inqUpdateVersion");
  self->_hasValidSearchIndex = result ^ 1;
  return result;
}

- (void)_inqEnsureSearchSystemInfoExists
{
  id v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *searchSystemInfo;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;

  if (!self->_searchSystemInfo)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99D80]);
    -[PLPhotoLibraryPathManager searchIndexSystemInfoFilePath](self->_pathManager, "searchIndexSystemInfoFilePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSDictionary *)objc_msgSend(v3, "initWithContentsOfFile:", v4);
    searchSystemInfo = self->_searchSystemInfo;
    self->_searchSystemInfo = v5;

    v7 = self->_searchSystemInfo;
    if (v7)
      v8 = v7;
    else
      v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    v9 = self->_searchSystemInfo;
    self->_searchSystemInfo = v8;

  }
}

- (void)_inqEnsureSearchIndexExists
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  PSIDatabase *v8;
  PSIDatabase *db;
  id WeakRetained;
  PSIDatabase *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "libraryServicesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");

    if (!self->_db && v5 != 3)
    {
      PLSearchBackendIndexManagerGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v14 = v7;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "-[PLSearchIndexManager _inqEnsureSearchIndexExists] called. Requesting Server Transaction if needed for %{public}@.", buf, 0xCu);

      }
      -[PLSearchIndexManager _inqTakeClientServerTransactionIfNeeded](self, "_inqTakeClientServerTransactionIfNeeded");
      v8 = -[PSIDatabase initWithPathManager:options:]([PSIDatabase alloc], "initWithPathManager:options:", self->_pathManager, 2);
      db = self->_db;
      self->_db = v8;

      WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnectionDelegate);
      if (WeakRetained)
      {
        v11 = self->_db;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __51__PLSearchIndexManager__inqEnsureSearchIndexExists__block_invoke;
        v12[3] = &unk_1E3677AA0;
        v12[4] = self;
        -[PSIDatabase performSyncOnDBQueue:](v11, "performSyncOnDBQueue:", v12);
      }
    }

  }
  -[PLSearchIndexManager _inqEnsureSpotlightDonationManagerExists](self, "_inqEnsureSpotlightDonationManagerExists");
}

+ (BOOL)_isUnboundedIndexingAllowed
{
  if (IOPSGetTimeRemainingEstimate() == -2.0)
    return 1;
  else
    return objc_msgSend(a1, "_isIndexingAllowedByDAS");
}

- (PLSearchIndexManager)initWithPathManager:(id)a3
{
  id v6;
  NSObject *v7;
  PLSearchIndexManager *v8;
  char v10;
  void *v11;
  uint64_t v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  NSHashTable *blocksOnQueueAfterDelay;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  PLThrottleTimer *v23;
  PLThrottleTimer *throttleTimer;
  NSCountedSet *v25;
  void *pauseReasons;
  NSObject *v27;
  void *v28;
  id v29;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((PLIsAssetsd() & 1) == 0 && (PLIsInternalTool() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexManager.m"), 317, CFSTR("Must only be initialized in assetsd"));

  }
  if ((PLPlatformSearchSupported() & 1) == 0)
    goto LABEL_9;
  if (_os_feature_enabled_impl())
  {
    PLSearchBackendIndexManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Attempted to initialize PLSearchIndexManager while PhotosSearchBackgroundJobWorker feature flag is enabled. Unsupported configuration.", buf, 2u);
    }

LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v30.receiver = self;
  v30.super_class = (Class)PLSearchIndexManager;
  v8 = -[PLSearchIndexManager init](&v30, sel_init);
  if (v8)
  {
    v10 = 1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_qos_and_fallback_qos();
    v12 = objc_claimAutoreleasedReturnValue();
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_pathManager, a3);
    v8->_stateLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    blocksOnQueueAfterDelay = v8->_blocksOnQueueAfterDelay;
    v8->_blocksOnQueueAfterDelay = (NSHashTable *)v14;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("shouldLimitIndexingWhileOnBattery"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v10 = objc_msgSend(v17, "BOOLValue");
    v8->_shouldLimitIndexingWhileOnBattery = v10;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManager searchIndexDirectory](v8->_pathManager, "searchIndexDirectory");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v21 = objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v29);
    v22 = v29;

    if ((v21 & 1) != 0)
    {
      v23 = -[PLThrottleTimer initWithTarget:action:invocationQueue:timeout:maxTimeout:]([PLThrottleTimer alloc], "initWithTarget:action:invocationQueue:timeout:maxTimeout:", v8, sel__throttleTimerFire_, v8->_queue, 20.0, 300.0);
      throttleTimer = v8->_throttleTimer;
      v8->_throttleTimer = v23;

      v25 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
      pauseReasons = v8->__pauseReasons;
      v8->__pauseReasons = v25;
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v22;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Failed to create directory. Error: %@", buf, 0xCu);
      }

      pauseReasons = v8;
      v8 = 0;
    }

    -[PLSearchIndexManager _beginObservingPhotosPreferences](v8, "_beginObservingPhotosPreferences");
    -[PLSearchIndexManager _beginObservingPowerSourceChanges](v8, "_beginObservingPowerSourceChanges");

  }
LABEL_10:

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[PLThrottleTimer invalidate](self->_throttleTimer, "invalidate");
  -[PLSearchIndexManager _inqCloseIndexIfAbleOrForce:isDelete:](self, "_inqCloseIndexIfAbleOrForce:isDelete:", 1, 0);
  v3.receiver = self;
  v3.super_class = (Class)PLSearchIndexManager;
  -[PLSearchIndexManager dealloc](&v3, sel_dealloc);
}

- (BOOL)_onQueueSync:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  PLResultWithUnfairLock();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    dispatch_sync((dispatch_queue_t)self->_queue, v4);

  return v5 == 0;
}

- (BOOL)_onQueueAsyncWithDelay:(double)a3 perform:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  dispatch_block_t v9;
  NSHashTable *blocksOnQueueAfterDelay;
  void *v11;
  dispatch_time_t v12;
  _QWORD block[5];
  id v15;
  id v16;
  id location[6];

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  location[1] = (id)MEMORY[0x1E0C809B0];
  location[2] = (id)3221225472;
  location[3] = __55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke;
  location[4] = &unk_1E3670AD8;
  location[5] = self;
  PLResultWithUnfairLock();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_initWeak(location, self);
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke_2;
    block[3] = &unk_1E36619F0;
    objc_copyWeak(&v16, location);
    block[4] = self;
    v15 = v6;
    v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
    os_unfair_lock_lock(&self->_stateLock);
    blocksOnQueueAfterDelay = self->_blocksOnQueueAfterDelay;
    v11 = (void *)MEMORY[0x19AEC174C](v9);
    -[NSHashTable addObject:](blocksOnQueueAfterDelay, "addObject:", v11);

    v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_after(v12, (dispatch_queue_t)self->_queue, v9);
    os_unfair_lock_unlock(&self->_stateLock);

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }

  return v8 == 0;
}

- (BOOL)_inqUpdateSearchSystemInfo:(id)a3 forKey:(id)a4 logMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSUInteger v11;
  id v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSDictionary *v16;
  NSDictionary *searchSystemInfo;
  BOOL v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PLSearchIndexManager _inqEnsureSearchSystemInfoExists](self, "_inqEnsureSearchSystemInfoExists");
  v11 = -[NSDictionary count](self->_searchSystemInfo, "count");
  -[NSDictionary objectForKeyedSubscript:](self->_searchSystemInfo, "objectForKeyedSubscript:", v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 == v8 || (objc_msgSend(v12, "isEqual:", v8) & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    if (v10)
    {
      PLSearchBackendIndexManagerGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v20 = 138543874;
        v21 = v10;
        v22 = 2114;
        v23 = v13;
        v24 = 2114;
        v25 = v8;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ -> %{public}@", (uint8_t *)&v20, 0x20u);
      }

    }
    v16 = (NSDictionary *)-[NSDictionary mutableCopy](self->_searchSystemInfo, "mutableCopy");
    -[NSDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v8, v9);
    searchSystemInfo = self->_searchSystemInfo;
    self->_searchSystemInfo = v16;

    v14 = 1;
  }
  if (v11)
    v18 = v14;
  else
    v18 = 0;

  return v18;
}

- (BOOL)_inqUpdateVersion
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = +[PLSearchIndexConfiguration currentSearchIndexVersion](PLSearchIndexConfiguration, "currentSearchIndexVersion");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Search index version changed for photolibrary: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PLSearchIndexManager _inqUpdateSearchSystemInfo:forKey:logMessage:](self, "_inqUpdateSearchSystemInfo:forKey:logMessage:", v8, CFSTR("searchIndexVersion"), v6);

  return (char)self;
}

- (BOOL)_inqUpdateEmbeddingModelVersion
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = +[PLSearchIndexConfiguration currentEmbeddingModelVersion](PLSearchIndexConfiguration, "currentEmbeddingModelVersion");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Search embedding model version changed for photolibrary: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PLSearchIndexManager _inqUpdateSearchSystemInfo:forKey:logMessage:](self, "_inqUpdateSearchSystemInfo:forKey:logMessage:", v8, CFSTR("embeddingModelVersion"), v6);

  return (char)self;
}

- (BOOL)_inqUpdateUtilityTypeClassifierVersion
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = +[PLSearchIndexConfiguration currentUtilityTypeClassifierVersion](PLSearchIndexConfiguration, "currentUtilityTypeClassifierVersion");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Utility type classifier version changed for photolibrary: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[PLSearchIndexManager _inqUpdateSearchSystemInfo:forKey:logMessage:](self, "_inqUpdateSearchSystemInfo:forKey:logMessage:", v8, CFSTR("utilityTypeClassifierVersion"), v6);

  return (char)self;
}

- (BOOL)_inqUpdateLocale
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Locale changed for photolibrary: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[PLSearchIndexManager _inqUpdateSearchSystemInfo:forKey:logMessage:](self, "_inqUpdateSearchSystemInfo:forKey:logMessage:", v4, CFSTR("localeIdentifier"), v7);
  return (char)self;
}

- (BOOL)_inqUpdateSceneTaxonomySHA:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Scene taxonomy SHA changed for photolibrary: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[PLSearchIndexManager _inqUpdateSearchSystemInfo:forKey:logMessage:](self, "_inqUpdateSearchSystemInfo:forKey:logMessage:", v5, CFSTR("sceneTaxonomySHA"), v7);
  return (char)self;
}

- (BOOL)_inqUpdateWordEmbeddingVersion:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Word Embedding version changed for photolibrary: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[PLSearchIndexManager _inqUpdateSearchSystemInfo:forKey:logMessage:](self, "_inqUpdateSearchSystemInfo:forKey:logMessage:", v8, CFSTR("embeddingVersion"), v7);
  return (char)self;
}

- (BOOL)_inqUpdateFeaturedContentAllowed:(BOOL)a3
{
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = CFSTR("0");
  if (a3)
    v4 = CFSTR("1");
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = v4;
  -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Featured Content Allowed Changed for photolibrary: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PLSearchIndexManager _inqUpdateSearchSystemInfo:forKey:logMessage:](self, "_inqUpdateSearchSystemInfo:forKey:logMessage:", v6, CFSTR("featuredContentAllowed"), v8);
  return v9;
}

- (void)_inqStartTrackingRebuildWithReason:(int64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  int64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PLSearchIndexManager _inqEndTrackingRebuildIfNeeded](self, "_inqEndTrackingRebuildIfNeeded");
  -[PLSearchIndexManager searchIndexManagerSignpostLog](self, "searchIndexManagerSignpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_make_with_pointer(v5, self);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SearchIndexManager - RebuildIndex", ", (uint8_t *)&v12, 2u);
  }

  PLSearchBackendIndexManagerGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 0xA)
      v10 = CFSTR("PLSearchIndexRebuildReasonNone");
    else
      v10 = off_1E3661D60[a3 - 1];
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v10;
    v14 = 2050;
    v15 = a3;
    v16 = 2114;
    v17 = v11;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Start tracking search index rebuild with reason: %{public}@ (%{public}ld) for %{public}@", (uint8_t *)&v12, 0x20u);

  }
  kdebug_trace();
  self->_isTrackingRebuild = 1;
  self->_rebuildReason = a3;

}

- (void)_inqEndTrackingRebuildIfNeeded
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int64_t rebuildReason;
  const __CFString *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_isTrackingRebuild)
  {
    -[PLSearchIndexManager searchIndexManagerSignpostLog](self, "searchIndexManagerSignpostLog");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_make_with_pointer(v3, self);
    v5 = v3;
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_END, v4, "SearchIndexManager - RebuildIndex", ", (uint8_t *)&v11, 2u);
    }

    PLSearchBackendIndexManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      rebuildReason = self->_rebuildReason;
      if ((unint64_t)(rebuildReason - 1) > 0xA)
        v9 = CFSTR("PLSearchIndexRebuildReasonNone");
      else
        v9 = off_1E3661D60[rebuildReason - 1];
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v9;
      v13 = 2050;
      v14 = rebuildReason;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "End tracking search index rebuild with reason: %{public}@ (%{public}ld) for %{public}@", (uint8_t *)&v11, 0x20u);

    }
    kdebug_trace();
    self->_isTrackingRebuild = 0;

  }
}

- (void)_inqStartTrackingUpdateIfAble
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (!self->_updateState)
  {
    PLSearchBackendIndexManagerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Start tracking update scheduled for %{public}@.", (uint8_t *)&v5, 0xCu);

    }
    kdebug_trace();
    self->_updateState = 1;
  }
}

- (void)_inqTrackTransitionFromUpdateScheduledToUpdatingIfAble
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_updateState == 1)
  {
    PLSearchBackendIndexManagerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Transition to active updating for %{public}@.", (uint8_t *)&v5, 0xCu);

    }
    kdebug_trace();
    kdebug_trace();
    self->_updateState = 2;
  }
}

- (void)_inqEndTrackingUpdateIfNeeded
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->_updateState == 2)
  {
    PLSearchBackendIndexManagerGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "End tracking update for %{public}@.", (uint8_t *)&v5, 0xCu);

    }
    kdebug_trace();
    self->_updateState = 0;
  }
}

- (unint64_t)_inqEnqueuedUUIDsCountForceLoad:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
    -[PLSearchIndexManager _inqEnsureSearchProgressExists](self, "_inqEnsureSearchProgressExists");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSDictionary allValues](self->_inqUUIDsToProcess, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "count");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)enqueuedUUIDsCountWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  PLSearchIndexManager *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __64__PLSearchIndexManager_enqueuedUUIDsCountWithCompletionHandler___block_invoke;
  v11 = &unk_1E3675C58;
  v12 = self;
  v5 = v4;
  v13 = v5;
  if (!-[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", &v8))
  {
    PLSearchBackendIndexManagerGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription", v8, v9, v10, v11, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Search index is invalidated. Not returning enqueuedUUIDsCount for %{public}@.", buf, 0xCu);

    }
    if (v5)
      (*((void (**)(id, _QWORD, _QWORD, double))v5 + 2))(v5, 0, 0, 0.0);
  }

}

- (void)_inqAddUpdatesWithUUIDs:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSDictionary *inqUUIDsToProcess;
  id v11;
  const __CFString *v12;
  void *v13;
  NSDictionary *v14;
  __CFString *v15;
  NSDictionary *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PLSearchIndexManager *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v6);
    -[NSDictionary objectForKey:](self->_inqUUIDsToProcess, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    inqUUIDsToProcess = self->_inqUUIDsToProcess;
    v11 = v7;
    v42 = v7;
    v43 = v6;
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("insertAsset")) & 1) != 0)
    {
      v12 = CFSTR("removeAsset");
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("removeAsset")) & 1) != 0)
    {
      v12 = CFSTR("insertAsset");
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("insertAlbum")) & 1) != 0)
    {
      v12 = CFSTR("removeAlbum");
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("removeAlbum")) & 1) != 0)
    {
      v12 = CFSTR("insertAlbum");
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("insertMemory")) & 1) != 0)
    {
      v12 = CFSTR("removeMemory");
    }
    else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("removeMemory")) & 1) != 0)
    {
      v12 = CFSTR("insertMemory");
    }
    else
    {
      v12 = CFSTR("insertHighlight");
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("insertHighlight")) & 1) != 0)
      {
        v12 = CFSTR("removeHighlight");
      }
      else if (!objc_msgSend(v11, "isEqualToString:", CFSTR("removeHighlight")))
      {
        v12 = 0;
      }
    }

    -[NSDictionary objectForKey:](inqUUIDsToProcess, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v9;
    objc_msgSend(v9, "unionOrderedSet:", v8);
    v38 = v13;
    v40 = (void *)v8;
    objc_msgSend(v13, "minusOrderedSet:", v8);
    v41 = self;
    v14 = self->_inqUUIDsToProcess;
    if (objc_msgSend(v11, "hasPrefix:", CFSTR("insert")))
      v15 = CFSTR(" add");
    else
      v15 = CFSTR(" del");
    v16 = v14;
    v35 = (void *)MEMORY[0x1E0CB3940];
    v33 = v15;
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("insertAsset"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v37, "count");
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("removeAsset"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v36, "count");
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("insertAlbum"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v34, "count");
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("removeAlbum"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v31, "count");
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("insertMemory"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("removeMemory"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("insertHighlight"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("removeHighlight"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("renamePerson"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stringWithFormat:", CFSTR("(%@) index progress -> assets[+%d -%d] albums[+%d -%d] [memories[+%d -%d]] highlights[+%d -%d] renamedPersons[+%d]"), v33, v32, v30, v29, v28, v18, v20, v22, v24, objc_msgSend(v25, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    PLSearchBackendIndexManagerGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v26;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v6 = v43;
    if (objc_msgSend(v39, "count") || objc_msgSend(v38, "count"))
    {
      -[PLThrottleTimer ping](v41->_throttleTimer, "ping");
      if (-[PLSearchIndexManager _isIndexing](v41, "_isIndexing"))
        v41->_receivedUpdatesWhileIndexing = 1;
    }

    v7 = v42;
  }

}

- (BOOL)isIndexingPaused
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__PLSearchIndexManager_isIndexingPaused__block_invoke;
  v4[3] = &unk_1E3677C68;
  v4[4] = self;
  v4[5] = &v5;
  -[PLSearchIndexManager _onQueueSync:](self, "_onQueueSync:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)unpauseIndexingWithReason:(id)a3
{
  -[PLSearchIndexManager _setIndexingPaused:synchronously:reason:](self, "_setIndexingPaused:synchronously:reason:", 0, 0, a3);
}

- (void)_throttleTimerFire:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  PLSearchBackendIndexManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Throttle timer fire. Resuming indexing if needed for %{public}@.", (uint8_t *)&v6, 0xCu);

  }
  -[PLSearchIndexManager _inqResumeIndexingIfNeeded](self, "_inqResumeIndexingIfNeeded");
}

- (void)_inqCloseSearchIndexAndDelete:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  PLSearchIndexManager *v16;
  id v17;
  BOOL v18;

  v6 = a4;
  -[PLSearchIndexManager _inqSetIndexingPaused:reason:](self, "_inqSetIndexingPaused:reason:", 1, CFSTR("PLSearchIndexPauseReasonCloseSearchIndex"));
  v7 = MEMORY[0x1E0C809B0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __69__PLSearchIndexManager__inqCloseSearchIndexAndDelete_withCompletion___block_invoke;
  v15 = &unk_1E3673368;
  v16 = self;
  v18 = a3;
  v8 = v6;
  v17 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x19AEC174C](&v12);
  if (-[PLSearchIndexManager _isIndexing](self, "_isIndexing")
    && (v11 = v7, PLResultWithUnfairLock(), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    -[PLSearchIndexManager _setInqAfterIndexingDidIterate:](self, "_setInqAfterIndexingDidIterate:", v9, v11, 3221225472, __69__PLSearchIndexManager__inqCloseSearchIndexAndDelete_withCompletion___block_invoke_2, &unk_1E3670AD8, self, v12, v13, v14, v15, v16);
  }
  else
  {
    v9[2](v9);
  }

}

- (void)ensureSearchIndexExistsWithCompletionHandler:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  BOOL v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__PLSearchIndexManager_ensureSearchIndexExistsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v5 = (void (**)(_QWORD))v4;
  v8 = v5;
  v6 = -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v7);
  if (v5 && !v6)
    v5[2](v5);

}

- (void)invalidate
{
  uint64_t v3;
  dispatch_block_t v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  PLSearchIndexManager *v13;

  -[PLSearchIndexManager _stopObservingPhotosPreferences](self, "_stopObservingPhotosPreferences");
  -[PLSearchIndexManager _stopObservingPowerSourceChanges](self, "_stopObservingPowerSourceChanges");
  -[PLThrottleTimer invalidate](self->_throttleTimer, "invalidate");
  v3 = MEMORY[0x1E0C809B0];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __34__PLSearchIndexManager_invalidate__block_invoke;
  v12 = &unk_1E3677AA0;
  v13 = self;
  PLRunWithUnfairLock();
  v4 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_6604);
  queue = self->_queue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __34__PLSearchIndexManager_invalidate__block_invoke_3;
  block[3] = &unk_1E3675C58;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  dispatch_block_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)dropSearchIndexWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  BOOL v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__PLSearchIndexManager_dropSearchIndexWithCompletion___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v5 = (void (**)(_QWORD))v4;
  v8 = v5;
  v6 = -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v7);
  if (v5 && !v6)
    v5[2](v5);

}

- (void)_inqResetSearchIndexWithReason:(int64_t)a3 dropCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  int64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PLSearchBackendIndexManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 0xA)
      v8 = CFSTR("PLSearchIndexRebuildReasonNone");
    else
      v8 = off_1E3661D60[a3 - 1];
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v8;
    v15 = 2050;
    v16 = a3;
    v17 = 2114;
    v18 = v9;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Received request to rebuild search index with reason: %{public}@ (%{public}ld) for %{public}@", buf, 0x20u);

  }
  -[PLSearchIndexManager _inqStartTrackingRebuildWithReason:](self, "_inqStartTrackingRebuildWithReason:", a3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PLSearchIndexManager__inqResetSearchIndexWithReason_dropCompletion___block_invoke;
  v11[3] = &unk_1E3675C58;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[PLSearchIndexManager _inqCloseSearchIndexAndDelete:withCompletion:](self, "_inqCloseSearchIndexAndDelete:withCompletion:", 1, v11);

}

- (void)resetSearchIndexWithReason:(int64_t)a3 dropCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  BOOL v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PLSearchIndexManager_resetSearchIndexWithReason_dropCompletion___block_invoke;
  v9[3] = &unk_1E3674C40;
  v9[4] = self;
  v11 = a3;
  v7 = (void (**)(_QWORD))v6;
  v10 = v7;
  v8 = -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v9);
  if (v7 && !v8)
    v7[2](v7);

}

- (id)_updatesAfterConvertingPersonsToAssetsInUpdates:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PLPhotoLibrary *photoLibrary;
  id v11;
  id v12;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v5 = a3;
  if (!self->_photoLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexManager.m"), 755, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_photoLibrary"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("insertPerson"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("insertPerson"));
    objc_msgSend(v5, "objectForKey:", CFSTR("insertAsset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("insertAsset"));
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    photoLibrary = self->_photoLibrary;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__PLSearchIndexManager__updatesAfterConvertingPersonsToAssetsInUpdates___block_invoke;
    v15[3] = &unk_1E3677530;
    v15[4] = self;
    v16 = v9;
    v17 = v8;
    v11 = v8;
    v12 = v9;
    -[PLPhotoLibrary performBlockAndWait:](photoLibrary, "performBlockAndWait:", v15);

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)_updatesAfterConvertingDetectedFacesToAssetsInUpdates:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PLPhotoLibrary *photoLibrary;
  id v10;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a3;
  if (!self->_photoLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexManager.m"), 788, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_photoLibrary"));

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("insertDetectedFace"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "removeObjectForKey:", CFSTR("insertDetectedFace"));
    objc_msgSend(v5, "objectForKey:", CFSTR("insertAsset"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("insertAsset"));
    }
    photoLibrary = self->_photoLibrary;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __78__PLSearchIndexManager__updatesAfterConvertingDetectedFacesToAssetsInUpdates___block_invoke;
    v13[3] = &unk_1E3677530;
    v13[4] = self;
    v14 = v6;
    v15 = v8;
    v10 = v8;
    -[PLPhotoLibrary performBlockAndWait:](photoLibrary, "performBlockAndWait:", v13);

  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)_updatesEnsuringMutableArraysFromUpdates:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PLSearchIndexManager__updatesEnsuringMutableArraysFromUpdates___block_invoke;
  v8[3] = &unk_1E36758D0;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

- (void)applyUpdates:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void (**v12)(_QWORD);
  BOOL v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = objc_msgSend(v6, "count");
  PLSearchBackendIndexManagerGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v20 = v8;
      v21 = 2114;
      v22 = v6;
      v23 = 2114;
      v24 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Applying %{public}lu updates: %{public}@ for %{public}@", buf, 0x20u);

    }
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __48__PLSearchIndexManager_applyUpdates_completion___block_invoke;
    v16[3] = &unk_1E3676290;
    v16[4] = self;
    v17 = v6;
    v12 = v7;
    v18 = v12;
    v13 = -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v16);
    if (v12 && !v13)
      v12[2](v12);

  }
  else
  {
    if (v10)
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = (uint64_t)v14;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "No updates to apply for %{public}@.", buf, 0xCu);

    }
    if (v7)
    {
      v15 = (void *)MEMORY[0x19AEC1554]();
      v7[2](v7);
      objc_autoreleasePoolPop(v15);
    }
  }

}

- (void)applyGraphUpdates:(id)a3 supportingData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void (**v15)(_QWORD);
  BOOL v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  PLSearchIndexManager *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  v11 = objc_msgSend(v8, "count");
  PLSearchBackendIndexManagerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349826;
      v30 = v11;
      v31 = 2114;
      v32 = v8;
      v33 = 2112;
      v34 = v9;
      v35 = 2114;
      v36 = v14;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Applying %{public}lu Knowledge Graph updates :%{public}@, supportingData: %@ for %{public}@", buf, 0x2Au);

    }
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __68__PLSearchIndexManager_applyGraphUpdates_supportingData_completion___block_invoke;
    v24 = &unk_1E3671878;
    v25 = self;
    v26 = v9;
    v27 = v8;
    v15 = v10;
    v28 = v15;
    v16 = -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", &v21);
    if (v15 && !v16)
      v15[2](v15);

    PLSearchBackendIndexManagerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription", v21, v22, v23, v24, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = (uint64_t)v18;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Finished applying Knowledge Graph updates for %{public}@.", buf, 0xCu);

    }
  }
  else
  {
    if (v13)
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = (uint64_t)v19;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "No Knowledge Graph updates to apply for %{public}@.", buf, 0xCu);

    }
    if (v10)
    {
      v20 = (void *)MEMORY[0x19AEC1554]();
      v10[2](v10);
      objc_autoreleasePoolPop(v20);
    }
  }

}

- (id)_assetUUIDsWithGraphDataInSpotlight
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  dispatch_semaphore_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v22[5];
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(&unk_1E3763290, "componentsJoinedByString:", CFSTR(" || "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CA6B28]);
  v6 = objc_alloc_init(MEMORY[0x1E0CA6B30]);
  v7 = (void *)objc_msgSend(v5, "initWithQueryString:queryContext:", v4, v6);

  PLSearchBackendIndexManagerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v4;
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Querying Spotlight for indexed Knowledge Graph data with queryString: %@ for %{public}@", buf, 0x16u);

  }
  v10 = dispatch_semaphore_create(0);
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __59__PLSearchIndexManager__assetUUIDsWithGraphDataInSpotlight__block_invoke;
  v24[3] = &unk_1E366A108;
  v12 = v3;
  v25 = v12;
  objc_msgSend(v7, "setFoundItemsHandler:", v24);
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __59__PLSearchIndexManager__assetUUIDsWithGraphDataInSpotlight__block_invoke_2;
  v22[3] = &unk_1E366B140;
  v22[4] = self;
  v13 = v10;
  v23 = v13;
  objc_msgSend(v7, "setCompletionHandler:", v22);
  objc_msgSend(v7, "start");
  v14 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v13, v14))
  {
    PLSearchBackendIndexManagerGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_FAULT, "Spotlight query for Knowledge Graph data timed out. Stale Knowledge Graph data may remain in the Spotlight index until the next Knowledge Graph rebuild for %{public}@", buf, 0xCu);

    }
    objc_msgSend(v7, "cancel");
  }
  PLSearchBackendIndexManagerGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v12;
    v28 = 2114;
    v29 = v18;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Spotlight query for Knowledge Graph data returned UUIDs: %{public}@ for %{public}@", buf, 0x16u);

  }
  v19 = v23;
  v20 = v12;

  return v20;
}

- (BOOL)_removeFileAtPath:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v11 = objc_msgSend(v10, "removeItemAtPath:error:", v6, &v21);
    v12 = v21;

    PLSearchBackendIndexManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v7;
        v24 = 2114;
        v25 = v15;
        v16 = "Removed: %@ for %{public}@";
        v17 = v14;
        v18 = OS_LOG_TYPE_INFO;
        v19 = 22;
LABEL_7:
        _os_log_impl(&dword_199541000, v17, v18, v16, buf, v19);

      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v23 = v15;
      v24 = 2114;
      v25 = v7;
      v26 = 2112;
      v27 = v12;
      v16 = "Failed to remove %@ for %{public}@. Error: %@";
      v17 = v14;
      v18 = OS_LOG_TYPE_ERROR;
      v19 = 32;
      goto LABEL_7;
    }

  }
  return 0;
}

- (void)_inqScheduleCloseIndexIfNeeded
{
  _BOOL4 hasScheduledCloseIndex;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  hasScheduledCloseIndex = self->_hasScheduledCloseIndex;
  PLSearchBackendIndexManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (hasScheduledCloseIndex)
  {
    if (v5)
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Search index already scheduled to close for %{public}@.", buf, 0xCu);

    }
  }
  else
  {
    if (v5)
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling search index close if needed for %{public}@.", buf, 0xCu);

    }
    v8 = MEMORY[0x1E0C809B0];
    self->_hasScheduledCloseIndex = 1;
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __54__PLSearchIndexManager__inqScheduleCloseIndexIfNeeded__block_invoke;
    v9[3] = &unk_1E3677AA0;
    v9[4] = self;
    -[PLSearchIndexManager _onQueueAsyncWithDelay:perform:](self, "_onQueueAsyncWithDelay:perform:", v9, 5.0);
  }
}

- (void)_inqDropClientServerTransactionIfNeeded
{
  PLClientServerTransaction *serverTransaction;
  NSObject *v4;
  _BOOL4 v5;
  PLClientServerTransaction *v6;
  void *v7;
  double Current;
  double serverTransactionStartTime;
  NSObject *v10;
  PLClientServerTransaction *v11;
  void *v12;
  PLClientServerTransaction *v13;
  PLClientServerTransaction *v14;
  int v15;
  PLClientServerTransaction *v16;
  __int16 v17;
  PLClientServerTransaction *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  serverTransaction = self->_serverTransaction;
  PLSearchBackendIndexManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (serverTransaction)
  {
    if (v5)
    {
      v6 = self->_serverTransaction;
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134349570;
      v16 = v6;
      v17 = 2112;
      v18 = v6;
      v19 = 2114;
      v20 = *(double *)&v7;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Server Transaction [Closing]: %{public}p, %@ for %{public}@", (uint8_t *)&v15, 0x20u);

    }
    -[PLClientServerTransaction completeTransactionScope:](self->_serverTransaction, "completeTransactionScope:", CFSTR("PLTransactionScopeSearchIndex"));
    Current = CFAbsoluteTimeGetCurrent();
    serverTransactionStartTime = self->_serverTransactionStartTime;
    PLSearchBackendIndexManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->_serverTransaction;
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134349826;
      v16 = v11;
      v17 = 2112;
      v18 = v11;
      v19 = 2050;
      v20 = Current - serverTransactionStartTime;
      v21 = 2114;
      v22 = v12;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Server Transaction [Closed]: %{public}p, %@. Transaction time: %{public}f for %{public}@", (uint8_t *)&v15, 0x2Au);

    }
    v13 = self->_serverTransaction;
    self->_serverTransaction = 0;

    self->_serverTransactionStartTime = 0.0;
  }
  else
  {
    if (v5)
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v14 = (PLClientServerTransaction *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Server Transaction [NULL]. No transaction to close for %{public}@.", (uint8_t *)&v15, 0xCu);

    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  uint64_t v8;
  _QWORD v9[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("operationCount"), a4, a5, a6))
  {
    -[PLSearchIndexManager spotlightDonationManager](self, "spotlightDonationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "pendingOperationCount");

    if (!v8)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __71__PLSearchIndexManager_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v9[3] = &unk_1E3677AA0;
      v9[4] = self;
      -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v9);
    }
  }
}

- (void)_inqCloseIndexIfAbleOrForce:(BOOL)a3 isDelete:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v5;
  _BOOL4 v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  NSObject *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  uint64_t (*__ptr32 *v25)();
  __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  dispatch_semaphore_t v34;
  void *v35;
  NSObject *v36;
  dispatch_time_t v37;
  NSObject *v38;
  __CFString *v39;
  dispatch_semaphore_t v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  PSIDatabase *db;
  void *v45;
  unint64_t v46;
  id v47;
  NSDictionary *inqUUIDsToProcess;
  id v49;
  void *v50;
  PLSearchIndexManager *v51;
  PLSearchIndexManager *v52;
  NSDictionary *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  __CFString *v61;
  NSObject *v62;
  __CFString *v63;
  NSMutableDictionary *inqGraphDataByUUID;
  void *v65;
  PLSearchIndexManager *v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  PLSearchIndexManager *v71;
  NSObject *v72;
  __CFString *v73;
  __CFString *v74;
  NSDictionary *searchSystemInfo;
  void *v76;
  char v77;
  PLSearchIndexManager *v78;
  NSObject *v79;
  __CFString *v80;
  NSMutableDictionary *inqSynonymsByIndexCategoryMask;
  void *v82;
  PLSearchIndexManager *v83;
  uint64_t (*__ptr32 *v84)();
  void *v85;
  char v86;
  PLSearchIndexManager *v87;
  NSObject *v88;
  __CFString *v89;
  __CFString *v90;
  void *v91;
  PLZeroKeywordStore *zeroKeywordStore;
  void *v93;
  PLSearchMetadataStore *searchMetadataStore;
  void *v95;
  id WeakRetained;
  PSIDatabase *v97;
  PSIDatabase *v98;
  NSDictionary *v99;
  NSMutableDictionary *v100;
  NSMutableDictionary *v101;
  void *v102;
  PLSpotlightDonationManager *spotlightDonationManager;
  PLPhotoLibrary *photoLibrary;
  PLSearchIndexSceneTaxonomyProvider *sceneTaxonomyProvider;
  CSUSearchableKnowledgeObjectStore *csuTaxonomyObjectStore;
  PLSearchIndexDateFormatter *dateFormatter;
  NSObject *v108;
  __CFString *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  PLSearchIndexManager *v123;
  PLSearchIndexManager *v124;
  void *v125;
  char context;
  void *contexta;
  _BOOL4 v128;
  void *v129;
  _QWORD v130[5];
  PLSearchIndexManager *v131;
  id v132;
  PLSearchIndexManager *v133;
  PLSearchIndexManager *v134;
  id v135;
  id v136;
  _QWORD v137[4];
  id v138;
  _QWORD v139[5];
  NSObject *v140;
  _QWORD v141[4];
  NSObject *v142;
  uint8_t buf[4];
  __CFString *v144;
  __int16 v145;
  PLSearchIndexManager *v146;
  __int16 v147;
  __CFString *v148;
  __int16 v149;
  void *v150;
  uint64_t v151;

  v4 = a4;
  LODWORD(v5) = a3;
  v151 = *MEMORY[0x1E0C80C00];
  v7 = -[PLSearchIndexManager _isIndexing](self, "_isIndexing");
  v8 = -[PLSearchIndexManager _inqEnqueuedUUIDsCountForceLoad:](self, "_inqEnqueuedUUIDsCountForceLoad:", 0);
  -[PLSearchIndexManager spotlightDonationManager](self, "spotlightDonationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pendingOperationCount");

  if (v8)
    v11 = 1;
  else
    v11 = v7;
  if (v10)
    v12 = 1;
  else
    v12 = v11;
  PLSearchBackendIndexManagerGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v128 = v7;
    if (v4)
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v15 = v14;
    if ((_DWORD)v5)
      v16 = CFSTR("YES");
    else
      v16 = CFSTR("NO");
    context = (char)v5;
    v5 = v16;
    if (v12)
      v17 = CFSTR("YES");
    else
      v17 = CFSTR("NO");
    v18 = v17;
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v144 = v15;
    v145 = 2114;
    v146 = (PLSearchIndexManager *)v5;
    v147 = 2114;
    v148 = v18;
    v149 = 2114;
    v150 = v19;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Checking if able to close the Search Index. isDelete: %{public}@, forceClose: %{public}@, hasIndexingWork: %{public}@ for %{public}@", buf, 0x2Au);

    v7 = v128;
    LOBYTE(v5) = context;

  }
  PLSearchBackendIndexManagerGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) == 0 && !v4 && v12 == 1)
  {
    if (v21)
    {
      v22 = CFSTR("NO");
      if (v7)
        v22 = CFSTR("YES");
      v23 = v22;
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v144 = v23;
      v145 = 2050;
      v146 = (PLSearchIndexManager *)v8;
      v147 = 2050;
      v148 = (__CFString *)v10;
      v149 = 2114;
      v150 = v24;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Not closing the search index because there is work to do. isIndexing: %{public}@, enqueued UUIDs count: %{public}ld, pending Spotlight operations count: %{public}ld for %{public}@", buf, 0x2Au);

    }
    goto LABEL_93;
  }
  v25 = &off_199B99000;
  if (v21)
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v144 = v26;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Closing the Search Index for %{public}@.", buf, 0xCu);

  }
  -[PLPhotoLibraryPathManager searchIndexProgressFilePath](self->_pathManager, "searchIndexProgressFilePath");
  v20 = objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager searchIndexGraphDataProgressFilePath](self->_pathManager, "searchIndexGraphDataProgressFilePath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager searchIndexSystemInfoFilePath](self->_pathManager, "searchIndexSystemInfoFilePath");
  v28 = objc_claimAutoreleasedReturnValue();
  v129 = (void *)v28;
  if (v4)
  {
    v29 = v27;
    -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = +[PLSpotlightDonationUtilities isUniversalSearchEnabledForPhotoLibrary:](PLSpotlightDonationUtilities, "isUniversalSearchEnabledForPhotoLibrary:", v30);
    objc_msgSend(v30, "libraryServicesManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "wellKnownPhotoLibraryIdentifier");

    if (v31 && v33 != 3)
    {
      -[PLSearchIndexManager _inqEnsureSpotlightDonationManagerExists](self, "_inqEnsureSpotlightDonationManagerExists");
      v34 = dispatch_semaphore_create(0);
      -[PLSearchIndexManager spotlightDonationManager](self, "spotlightDonationManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v141[0] = MEMORY[0x1E0C809B0];
      v141[1] = 3221225472;
      v141[2] = __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke;
      v141[3] = &unk_1E3677AA0;
      v36 = v34;
      v142 = v36;
      objc_msgSend(v35, "deleteAllSearchableItemsWithCompletion:", v141);

      v37 = dispatch_time(0, 20000000000);
      if (dispatch_semaphore_wait(v36, v37))
      {
        PLSearchBackendDonationsGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v144 = v39;
          v145 = 2050;
          v146 = self;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Timed-out trying to delete all items in Spotlight for %{public}@. SearchIndexManager: %{public}p", buf, 0x16u);

        }
      }

    }
    v40 = dispatch_semaphore_create(0);
    v139[0] = MEMORY[0x1E0C809B0];
    v139[1] = 3221225472;
    v139[2] = __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_172;
    v139[3] = &unk_1E366B140;
    v139[4] = self;
    v41 = v40;
    v140 = v41;
    v42 = MEMORY[0x19AEC174C](v139);
    v43 = (void *)v42;
    if (v33 == 3)
    {
      (*(void (**)(uint64_t, _QWORD))(v42 + 16))(v42, 0);
      v27 = v29;
    }
    else
    {
      db = self->_db;
      v27 = v29;
      if (db)
      {
        -[PSIDatabase dropDatabaseWithCompletion:](db, "dropDatabaseWithCompletion:", v43);
      }
      else
      {
        -[PLPhotoLibraryPathManager searchIndexDatabaseFilePath](self->_pathManager, "searchIndexDatabaseFilePath");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSIDatabase dropDatabaseAtPath:withCompletion:](PSIDatabase, "dropDatabaseAtPath:withCompletion:", v91, v43);

      }
    }
    v45 = v129;
    dispatch_semaphore_wait(v41, 0xFFFFFFFFFFFFFFFFLL);
    zeroKeywordStore = self->_zeroKeywordStore;
    if (zeroKeywordStore)
    {
      -[PLZeroKeywordStore deleteStore](zeroKeywordStore, "deleteStore");
    }
    else
    {
      -[PLPhotoLibraryPathManager searchIndexZeroKeywordStoreFilePath](self->_pathManager, "searchIndexZeroKeywordStoreFilePath");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchIndexManager _removeFileAtPath:description:](self, "_removeFileAtPath:description:", v93, CFSTR("zero keyword store"));

    }
    searchMetadataStore = self->_searchMetadataStore;
    if (searchMetadataStore)
    {
      -[PLSearchMetadataStore deleteStore](searchMetadataStore, "deleteStore");
    }
    else
    {
      -[PLPhotoLibraryPathManager searchIndexMetadataStoreFilePath](self->_pathManager, "searchIndexMetadataStoreFilePath");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchIndexManager _removeFileAtPath:description:](self, "_removeFileAtPath:description:", v95, CFSTR("search metadata store"));

    }
    -[PLSearchIndexManager _removeFileAtPath:description:](self, "_removeFileAtPath:description:", v20, CFSTR("index progress"));
    -[PLSearchIndexManager _removeFileAtPath:description:](self, "_removeFileAtPath:description:", v27, CFSTR("graph data progress"));
    -[PLSearchIndexManager _removeFileAtPath:description:](self, "_removeFileAtPath:description:", v129, CFSTR("index searchSystemInfo"));

    v25 = &off_199B99000;
    goto LABEL_88;
  }
  v45 = (void *)v28;
  v125 = v27;
  contexta = (void *)MEMORY[0x19AEC1554]();
  v46 = 0x1E0CB3000uLL;
  if (self->_inqUUIDsToProcess)
  {
    v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    inqUUIDsToProcess = self->_inqUUIDsToProcess;
    v137[0] = MEMORY[0x1E0C809B0];
    v137[1] = 3221225472;
    v137[2] = __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_184;
    v137[3] = &unk_1E3661A88;
    v49 = v47;
    v138 = v49;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inqUUIDsToProcess, "enumerateKeysAndObjectsUsingBlock:", v137);
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v49, 100, 0, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = 0;
    LOBYTE(inqUUIDsToProcess) = objc_msgSend(v50, "writeToFile:options:error:", v20, 1073741825, &v136);
    v51 = (PLSearchIndexManager *)v136;
    v52 = v51;
    if ((inqUUIDsToProcess & 1) != 0)
    {
      v121 = v50;
      v122 = v49;
      v123 = v51;
      v53 = self->_inqUUIDsToProcess;
      v118 = (void *)MEMORY[0x1E0CB3940];
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("insertAsset"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v120, "count");
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("removeAsset"));
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(v119, "count");
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("insertAlbum"));
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = objc_msgSend(v117, "count");
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("removeAlbum"));
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = objc_msgSend(v115, "count");
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("insertMemory"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = objc_msgSend(v113, "count");
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("removeMemory"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("insertHighlight"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "count");
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("removeHighlight"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = objc_msgSend(v58, "count");
      -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", CFSTR("renamePerson"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "stringWithFormat:", CFSTR("(%@) index progress -> assets[+%d -%d] albums[+%d -%d] [memories[+%d -%d]] highlights[+%d -%d] renamedPersons[+%d]"), CFSTR("save progress"), v116, v114, v112, v111, v110, v55, v57, v59, objc_msgSend(v60, "count"));
      v61 = (__CFString *)objc_claimAutoreleasedReturnValue();

      PLSearchBackendIndexManagerGetLog();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v144 = v61;
        _os_log_impl(&dword_199541000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v52 = v123;
      v27 = v125;
      v46 = 0x1E0CB3000;
      v50 = v121;
      v49 = v122;
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v53 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v53->super, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v144 = v63;
        v145 = 2112;
        v146 = v52;
        _os_log_impl(&dword_199541000, &v53->super, OS_LOG_TYPE_ERROR, "Failed to write search progress for %{public}@. Error: %@", buf, 0x16u);

      }
    }

    v25 = &off_199B99000;
    v45 = v129;
  }
  else
  {
    v52 = 0;
  }
  inqGraphDataByUUID = self->_inqGraphDataByUUID;
  if (inqGraphDataByUUID)
  {
    v124 = v52;
    v135 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", inqGraphDataByUUID, 1, &v135);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (PLSearchIndexManager *)v135;
    if (v65)
    {
      v67 = v45;
      v68 = v27;
      -[PLPhotoLibraryPathManager searchIndexGraphDataProgressFilePath](self->_pathManager, "searchIndexGraphDataProgressFilePath");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = v66;
      v70 = objc_msgSend(v65, "writeToFile:options:error:", v69, 1073741825, &v134);
      v71 = v134;

      if ((v70 & 1) != 0)
      {
        v27 = v68;
        v45 = v67;
        v25 = &off_199B99000;
        v52 = v124;
LABEL_59:

        v46 = 0x1E0CB3000uLL;
        goto LABEL_60;
      }
      PLSearchBackendIndexManagerGetLog();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v144 = v74;
        v145 = 2112;
        v146 = v71;
        _os_log_impl(&dword_199541000, v72, OS_LOG_TYPE_ERROR, "Failed to write search graph data progress for %{public}@. Error: %@", buf, 0x16u);

      }
      v27 = v68;
      v45 = v67;
      v25 = &off_199B99000;
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v144 = v73;
        v145 = 2112;
        v146 = v66;
        _os_log_impl(&dword_199541000, v72, OS_LOG_TYPE_ERROR, "Failed to archive search graph data for %{public}@. Error: %@", buf, 0x16u);

      }
      v71 = v66;
    }
    v52 = v124;

    goto LABEL_59;
  }
LABEL_60:
  searchSystemInfo = self->_searchSystemInfo;
  if (searchSystemInfo)
  {
    objc_msgSend(*(id *)(v46 + 2224), "dataWithPropertyList:format:options:error:", searchSystemInfo, 100, 0, 0);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = v52;
    v77 = objc_msgSend(v76, "writeToFile:options:error:", v45, 1073741825, &v133);
    v78 = v133;

    if ((v77 & 1) == 0)
    {
      PLSearchBackendIndexManagerGetLog();
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v144 = v80;
        v145 = 2112;
        v146 = v78;
        _os_log_impl(&dword_199541000, v79, OS_LOG_TYPE_ERROR, "Failed to write searchSystemInfo for %{public}@. Error: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    v78 = v52;
  }
  inqSynonymsByIndexCategoryMask = self->_inqSynonymsByIndexCategoryMask;
  if (!inqSynonymsByIndexCategoryMask)
    goto LABEL_79;
  v132 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", inqSynonymsByIndexCategoryMask, 1, &v132);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = (PLSearchIndexManager *)v132;
  if (!v82)
  {
    PLSearchBackendIndexManagerGetLog();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v89 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v144 = v89;
      v145 = 2112;
      v146 = v83;
      _os_log_impl(&dword_199541000, v88, OS_LOG_TYPE_ERROR, "Failed to archive search synonyms for %{public}@. Error: %@", buf, 0x16u);

    }
    v87 = v83;
    goto LABEL_77;
  }
  v84 = v25;
  -[PLPhotoLibraryPathManager searchIndexSynonymsFilePath](self->_pathManager, "searchIndexSynonymsFilePath");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v83;
  v86 = objc_msgSend(v82, "writeToFile:options:error:", v85, 1073741825, &v131);
  v87 = v131;

  if ((v86 & 1) == 0)
  {
    PLSearchBackendIndexManagerGetLog();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v144 = v90;
      v145 = 2112;
      v146 = v87;
      _os_log_impl(&dword_199541000, v88, OS_LOG_TYPE_ERROR, "Failed to write search synonyms for %{public}@. Error: %@", buf, 0x16u);

    }
    v25 = v84;
LABEL_77:

    goto LABEL_78;
  }
  v25 = v84;
LABEL_78:

  v27 = v125;
  v45 = v129;
LABEL_79:
  -[PLSearchIndexManager _inqEndTrackingUpdateIfNeeded](self, "_inqEndTrackingUpdateIfNeeded");
  -[PLSearchIndexManager _inqEndTrackingRebuildIfNeeded](self, "_inqEndTrackingRebuildIfNeeded");

  objc_autoreleasePoolPop(contexta);
LABEL_88:
  WeakRetained = objc_loadWeakRetained((id *)&self->_databaseConnectionDelegate);

  if (WeakRetained)
  {
    v97 = self->_db;
    v130[0] = MEMORY[0x1E0C809B0];
    v130[1] = 3221225472;
    v130[2] = __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_190;
    v130[3] = &unk_1E3677AA0;
    v130[4] = self;
    -[PSIDatabase performSyncOnDBQueue:](v97, "performSyncOnDBQueue:", v130);
  }
  v98 = self->_db;
  self->_db = 0;

  v99 = self->_inqUUIDsToProcess;
  self->_inqUUIDsToProcess = 0;

  v100 = self->_inqGraphDataByUUID;
  self->_inqGraphDataByUUID = 0;

  v101 = self->_inqSynonymsByIndexCategoryMask;
  self->_inqSynonymsByIndexCategoryMask = 0;

  -[PLSearchIndexManager spotlightDonationManager](self, "spotlightDonationManager");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "removeOperationCountObserver:", self);

  spotlightDonationManager = self->_spotlightDonationManager;
  self->_spotlightDonationManager = 0;

  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = 0;

  sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
  self->_sceneTaxonomyProvider = 0;

  csuTaxonomyObjectStore = self->_csuTaxonomyObjectStore;
  self->_csuTaxonomyObjectStore = 0;

  dateFormatter = self->_dateFormatter;
  self->_dateFormatter = 0;

  PLSearchBackendIndexManagerGetLog();
  v108 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v109 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = *((_QWORD *)v25 + 206);
    v144 = v109;
    _os_log_impl(&dword_199541000, v108, OS_LOG_TYPE_DEFAULT, "Search index closed. Closing Server Transaction if needed for %{public}@.", buf, 0xCu);

  }
  -[PLSearchIndexManager _inqDropClientServerTransactionIfNeeded](self, "_inqDropClientServerTransactionIfNeeded");

LABEL_93:
}

- (void)_inqEnsureSpotlightDonationManagerExists
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  PLSpotlightDonationManager *v14;
  PLSpotlightDonationManager *spotlightDonationManager;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!self->_spotlightDonationManager)
  {
    -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLSpotlightDonationUtilities shouldDisablePhotosLegacySearchDonation](PLSpotlightDonationUtilities, "shouldDisablePhotosLegacySearchDonation"))
    {
      PLSearchBackendIndexStatusGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "pathManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "libraryURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v6;
        v18 = 2114;
        v19 = v7;
        v8 = "PhotosSearchBackgroundJobWorker feature flag is enabled. Not using Spotlight donations from legacy search. "
             "Not creating Spotlight Donation Manager for PhotoLibrary at path: %@ of type: %{public}@.";
LABEL_11:
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, 0x16u);

      }
    }
    else
    {
      v9 = +[PLSpotlightDonationUtilities isUniversalSearchEnabledForPhotoLibrary:](PLSpotlightDonationUtilities, "isUniversalSearchEnabledForPhotoLibrary:", v3);
      PLSearchBackendIndexManagerGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v10)
        {
          objc_msgSend(v3, "pathManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "libraryURL");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412546;
          v17 = v12;
          v18 = 2114;
          v19 = v13;
          _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Creating Spotlight Donation Manager for PhotoLibrary at path: %@ of type: %{public}@", (uint8_t *)&v16, 0x16u);

        }
        v14 = -[PLSpotlightDonationManager initWithPhotoLibrary:]([PLSpotlightDonationManager alloc], "initWithPhotoLibrary:", self->_photoLibrary);
        spotlightDonationManager = self->_spotlightDonationManager;
        self->_spotlightDonationManager = v14;

        -[PLSpotlightDonationManager addOperationCountObserver:](self->_spotlightDonationManager, "addOperationCountObserver:", self);
        -[PLSpotlightDonationManager setSpotlightOperationQueueSuspended:](self->_spotlightDonationManager, "setSpotlightOperationQueueSuspended:", -[PLSearchIndexManager _inqIsIndexingPaused](self, "_inqIsIndexingPaused"));
        goto LABEL_13;
      }
      if (v10)
      {
        objc_msgSend(v3, "pathManager");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "libraryURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v6;
        v18 = 2114;
        v19 = v7;
        v8 = "Universal Search not supported for Photo Library. Not creating Spotlight Donation Manager. PhotoLibrary pat"
             "h: %@ of type: %{public}@";
        goto LABEL_11;
      }
    }

LABEL_13:
  }
}

- (void)_inqUpdateUUIDsToProcessWithSpotlightProgress
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  PLSearchIndexManager *v18;

  -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v13 = v3;
    -[NSDictionary objectForKeyedSubscript:](self->_inqUUIDsToProcess, "objectForKeyedSubscript:", CFSTR("insertAsset"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_inqUUIDsToProcess, "objectForKeyedSubscript:", CFSTR("removeAsset"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "pathManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = +[PLSpotlightProgressManager shouldPerformSpotlightOperationsWithPhotoLibraryPathManager:](PLSpotlightProgressManager, "shouldPerformSpotlightOperationsWithPhotoLibraryPathManager:", v7);

    if (v8)
    {
      objc_msgSend(v13, "pathManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __69__PLSearchIndexManager__inqUpdateUUIDsToProcessWithSpotlightProgress__block_invoke;
      v14[3] = &unk_1E3661AB0;
      v15 = v5;
      v16 = v4;
      v10 = v6;
      v17 = v10;
      v18 = self;
      +[PLSpotlightProgressManager spotlightProgressForPhotoLibraryPathManager:completion:](PLSpotlightProgressManager, "spotlightProgressForPhotoLibraryPathManager:completion:", v9, v14);

      v11 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v13, "pathManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLSpotlightProgressManager removeSearchableItemIdentifiers:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "removeSearchableItemIdentifiers:forPhotoLibraryPathManager:", v11, v12);

    }
    v3 = v13;
  }

}

- (void)_inqEnsureSearchProgressExists
{
  NSDictionary **p_inqUUIDsToProcess;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *inqGraphDataByUUID;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  __CFString **v23;
  void *v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSMutableDictionary *v34;
  NSMutableDictionary *inqSynonymsByIndexCategoryMask;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  id v45;
  void *v46;
  NSObject *v47;
  void *v48;
  NSDictionary *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  NSObject *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSDictionary **v81;
  void *v82;
  id v83;
  id v84;
  id v85[2];
  _QWORD v86[4];
  NSMutableDictionary *v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  id v91;
  __int16 v92;
  id v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  p_inqUUIDsToProcess = &self->_inqUUIDsToProcess;
  if (self->_inqUUIDsToProcess)
    goto LABEL_37;
  PLSearchBackendIndexManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v89 = (uint64_t)v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "-[PLSearchIndexManager _inqEnsureSearchProgressExists] called. Requesting Server Transaction if needed for %{public}@.", buf, 0xCu);

  }
  v82 = (void *)MEMORY[0x19AEC1554](-[PLSearchIndexManager _inqTakeClientServerTransactionIfNeeded](self, "_inqTakeClientServerTransactionIfNeeded"));
  v6 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[PLPhotoLibraryPathManager searchIndexProgressFilePath](self->_pathManager, "searchIndexProgressFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithContentsOfFile:", v7);

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = v9;
  if (v8)
  {
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __54__PLSearchIndexManager__inqEnsureSearchProgressExists__block_invoke;
    v86[3] = &unk_1E3668EA8;
    v87 = (NSMutableDictionary *)v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v86);
    objc_storeStrong((id *)p_inqUUIDsToProcess, v10);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inqGraphDataByUUID = self->_inqGraphDataByUUID;
    self->_inqGraphDataByUUID = v11;

    -[PLPhotoLibraryPathManager searchIndexGraphDataProgressFilePath](self->_pathManager, "searchIndexGraphDataProgressFilePath");
    v85[1] = 0;
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v79 = v8;
    v81 = p_inqUUIDsToProcess;
    v78 = (void *)v13;
    if (v13)
    {
      v15 = (void *)MEMORY[0x1E0C99E60];
      v16 = objc_opt_class();
      v17 = objc_opt_class();
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, objc_opt_class(), 0);
      v20 = objc_claimAutoreleasedReturnValue();
      v85[0] = v14;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v20, v13, v85);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v85[0];

      if (v21)
      {
        -[NSMutableDictionary addEntriesFromDictionary:](self->_inqGraphDataByUUID, "addEntriesFromDictionary:", v21);
      }
      else
      {
        PLSearchBackendIndexManagerGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = (uint64_t)v33;
          v90 = 2112;
          v91 = v22;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Failed to unarchive Knowledge Graph data for %{public}@. Error: %@", buf, 0x16u);

        }
      }
      p_inqUUIDsToProcess = v81;

    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v89 = (uint64_t)v80;
        v90 = 2114;
        v91 = v31;
        v92 = 2112;
        v93 = v14;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to read Knowledge Graph data from file \"%@\" for %{public}@. Error: %@", buf, 0x20u);

      }
      v22 = v14;
    }

    v34 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inqSynonymsByIndexCategoryMask = self->_inqSynonymsByIndexCategoryMask;
    self->_inqSynonymsByIndexCategoryMask = v34;

    -[PLPhotoLibraryPathManager searchIndexSynonymsFilePath](self->_pathManager, "searchIndexSynonymsFilePath");
    v36 = objc_claimAutoreleasedReturnValue();
    v84 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v36, 0, &v84);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v84;
    v76 = (void *)v37;
    v77 = (void *)v36;
    if (v37)
    {
      v39 = (void *)MEMORY[0x1E0C99E60];
      v40 = objc_opt_class();
      v41 = objc_opt_class();
      v42 = objc_opt_class();
      objc_msgSend(v39, "setWithObjects:", v40, v41, v42, objc_opt_class(), 0);
      v43 = objc_claimAutoreleasedReturnValue();
      v83 = v38;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v43, v37, &v83);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v83;

      if (v44)
      {
        -[NSMutableDictionary addEntriesFromDictionary:](self->_inqSynonymsByIndexCategoryMask, "addEntriesFromDictionary:", v44);
      }
      else
      {
        PLSearchBackendIndexManagerGetLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v89 = (uint64_t)v48;
          v90 = 2112;
          v91 = v45;
          _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_ERROR, "Failed to unarchive synonyms for %{public}@. Error: %@", buf, 0x16u);

        }
      }
      v75 = v45;

    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v89 = v36;
        v90 = 2114;
        v91 = v46;
        v92 = 2112;
        v93 = v38;
        _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_ERROR, "Failed to read synonyms from file \"%@\" for %{public}@. Error: %@", buf, 0x20u);

      }
      v75 = v38;
    }

    v49 = *p_inqUUIDsToProcess;
    v72 = (void *)MEMORY[0x1E0CB3940];
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("insertAsset"));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v74, "count");
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("removeAsset"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v73, "count");
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("insertAlbum"));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v71, "count");
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("removeAlbum"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v69, "count");
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("insertMemory"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v67, "count");
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("removeMemory"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "count");
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("insertHighlight"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count");
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("removeHighlight"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "count");
    -[NSDictionary objectForKeyedSubscript:](v49, "objectForKeyedSubscript:", CFSTR("renamePerson"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "stringWithFormat:", CFSTR("(%@) index progress -> assets[+%d -%d] albums[+%d -%d] [memories[+%d -%d]] highlights[+%d -%d] renamedPersons[+%d]"), CFSTR("load"), v70, v68, v66, v65, v64, v51, v53, v55, objc_msgSend(v56, "count"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    PLSearchBackendIndexManagerGetLog();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v89 = (uint64_t)v57;
      _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v29 = v87;
    v30 = v79;
    p_inqUUIDsToProcess = v81;
  }
  else
  {
    v23 = _uuidProcessingKeys;
    do
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (uint64_t)*v23++;
      objc_msgSend(v10, "setObject:forKey:", v24, v25);

    }
    while (v23 < PLSearchIndexPauseReasonCloseSearchIndex);
    objc_storeStrong((id *)p_inqUUIDsToProcess, v10);
    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = self->_inqGraphDataByUUID;
    self->_inqGraphDataByUUID = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v29 = self->_inqSynonymsByIndexCategoryMask;
    self->_inqSynonymsByIndexCategoryMask = v28;
    v30 = 0;
  }

  if (*p_inqUUIDsToProcess)
  {
    if (!v30)
    {
LABEL_33:
      PLSearchBackendIndexManagerGetLog();
      v59 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v89 = (uint64_t)v60;
        _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_DEFAULT, "No prior search progress. Enqueuing ALL assets, albums, memories, etc. for %{public}@", buf, 0xCu);

      }
      -[PLSearchIndexManager _inqIndexPhotoLibrary](self, "_inqIndexPhotoLibrary");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexManager.m"), 1448, CFSTR("expect search progress data structures"));

    if (!v30)
      goto LABEL_33;
  }

  objc_autoreleasePoolPop(v82);
LABEL_37:
  -[PLSearchIndexManager _inqUpdateUUIDsToProcessWithSpotlightProgress](self, "_inqUpdateUUIDsToProcessWithSpotlightProgress");
  v61 = PLIsFeaturedContentAllowed();
  if (-[PLSearchIndexManager _inqUpdateFeaturedContentAllowed:](self, "_inqUpdateFeaturedContentAllowed:", v61))
    -[PLSearchIndexManager _inqUpdateFeaturedContentForSearch:](self, "_inqUpdateFeaturedContentForSearch:", v61);
}

- (id)_inqRequestGraphDataForHighlightUUIDs:(id)a3 momentUUIDs:(id)a4 photoLibrary:(id)a5 singleAssetOnly:(BOOL)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PLPhotoAnalysisMomentGraphService *v18;
  void *v19;
  PLPhotoAnalysisMomentGraphService *v20;
  NSObject *v21;
  __CFString *v22;
  PLPhotoAnalysisMomentGraphService *v23;
  NSObject *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  double Current;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id v34;
  NSObject *v35;
  __CFString *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  CFAbsoluteTime v40;
  void *v41;
  NSObject *v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  double v46;
  os_signpost_id_t v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  id v51;
  NSObject *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  __CFString *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  const __CFString *v68;
  CFAbsoluteTime v69;
  void *v70;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  unint64_t v74;
  PLPhotoAnalysisMomentGraphService *v75;
  id v76;
  void *v77;
  id v78;
  _BOOL4 v79;
  id v80;
  id v81;
  id v82;
  uint8_t buf[4];
  const __CFString *v84;
  __int16 v85;
  CFAbsoluteTime v86;
  __int16 v87;
  id v88;
  uint64_t v89;

  v79 = a6;
  v89 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (_os_feature_enabled_impl())
  {
    PLSearchBackendIndexManagerGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v84 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Skipping _inqRequestGraphDataForHighlightUUIDs, %{public}@", buf, 0xCu);

    }
    v15 = 0;
  }
  else
  {
    -[PLSearchIndexManager searchIndexManagerSignpostLog](self, "searchIndexManagerSignpostLog");
    v13 = objc_claimAutoreleasedReturnValue();
    v76 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v12, "libraryServicesManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "wellKnownPhotoLibraryIdentifier");

    if (v17 == 3
      || (v18 = [PLPhotoAnalysisMomentGraphService alloc],
          objc_msgSend(v12, "photoAnalysisClient"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = -[PLPhotoAnalysisMomentGraphService initWithServiceProvider:](v18, "initWithServiceProvider:", v19),
          v19,
          !v20))
    {
      PLSearchBackendIndexManagerGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v84 = v22;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "No Knowledge Graph data for %{public}@", buf, 0xCu);

      }
      v20 = 0;
    }
    v77 = v10;
    v78 = v12;
    if (objc_msgSend(v10, "count"))
    {
      v23 = v20;
      PLSearchBackendIndexManagerGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("(JIT) ");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        if (v79)
          v26 = CFSTR("(JIT) ");
        else
          v26 = &stru_1E36789C0;
        v27 = objc_msgSend(v77, "count");
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v84 = v26;
        v10 = v77;
        v85 = 2050;
        v86 = *(double *)&v27;
        v87 = 2114;
        v88 = v28;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "%{public}@Requesting Search Index Keywords for %{public}ld Highlights for %{public}@", buf, 0x20u);

      }
      Current = CFAbsoluteTimeGetCurrent();
      v30 = os_signpost_id_generate(v13);
      if (!v79)
      {
        v31 = v13;
        v32 = v31;
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "SearchIndexManager - RequestSearchIndexKeywordsForHighlights", ", buf, 2u);
        }

      }
      v82 = 0;
      -[PLPhotoAnalysisMomentGraphService requestSearchIndexKeywordsForAssetCollectionUUIDs:ofType:error:](v23, "requestSearchIndexKeywordsForAssetCollectionUUIDs:ofType:error:", v10, 1, &v82);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v82;
      if (v34)
      {
        PLSearchBackendIndexManagerGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v84 = v36;
          v85 = 2112;
          v86 = *(double *)&v34;
          _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "No Highlight Knowledge Graph data from full index rebuild for %{public}@. Error: %@", buf, 0x16u);

        }
      }
      else
      {
        objc_msgSend(v76, "addEntriesFromDictionary:", v33);
      }
      if (!v79)
      {
        v37 = v13;
        v38 = v37;
        if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v38, OS_SIGNPOST_INTERVAL_END, v30, "SearchIndexManager - RequestSearchIndexKeywordsForHighlights", ", buf, 2u);
        }

      }
      PLSearchBackendIndexManagerGetLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        if (!v79)
          v25 = &stru_1E36789C0;
        v40 = CFAbsoluteTimeGetCurrent() - Current;
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v84 = v25;
        v85 = 2050;
        v86 = v40;
        v87 = 2114;
        v88 = v41;
        _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@Request for Search Index Keywords for Highlights took %{public}f seconds for %{public}@", buf, 0x20u);

      }
      v12 = v78;
      v20 = v23;
    }
    else
    {
      v34 = 0;
    }
    if (objc_msgSend(v11, "count"))
    {
      PLSearchBackendIndexManagerGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        if (v79)
          v43 = CFSTR("(JIT) ");
        else
          v43 = &stru_1E36789C0;
        v44 = objc_msgSend(v11, "count");
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v84 = v43;
        v12 = v78;
        v85 = 2050;
        v86 = *(double *)&v44;
        v87 = 2114;
        v88 = v45;
        _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@Requesting Asset Search Keywords for %{public}ld Moments for %{public}@", buf, 0x20u);

      }
      v46 = CFAbsoluteTimeGetCurrent();
      v47 = os_signpost_id_generate(v13);
      v48 = v13;
      v49 = v48;
      v74 = v47 - 1;
      if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v47, "SearchIndexManager - RequestAssetSearchKeywordsForMoments", ", buf, 2u);
      }
      spid = v47;

      v81 = v34;
      -[PLPhotoAnalysisMomentGraphService requestAssetSearchKeywordsForAssetCollectionUUIDs:ofType:error:](v20, "requestAssetSearchKeywordsForAssetCollectionUUIDs:ofType:error:", v11, 0, &v81);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v81;

      if (v51)
      {
        PLSearchBackendIndexManagerGetLog();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          if (v79)
            v53 = CFSTR("JIT");
          else
            v53 = CFSTR("full search index rebuild");
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription", v47);
          v54 = v50;
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v84 = v53;
          v12 = v78;
          v85 = 2114;
          v86 = *(double *)&v55;
          v87 = 2112;
          v88 = v51;
          _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_ERROR, "No asset Knowledge Graph data for %{public}@ for %{public}@. Error: %@", buf, 0x20u);

          v50 = v54;
        }

      }
      v80 = v51;
      v75 = v20;
      -[PLPhotoAnalysisMomentGraphService requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:ofType:isFullAnalysis:error:](v20, "requestSearchableAssetUUIDsBySocialGroupForAssetCollectionUUIDs:ofType:isFullAnalysis:error:", v11, 0, 1, &v80, spid);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v80;

      if (v34)
      {
        PLSearchBackendIndexManagerGetLog();
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          if (v79)
            v58 = CFSTR("JIT");
          else
            v58 = CFSTR("full search index rebuild");
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v59 = v50;
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v84 = v58;
          v12 = v78;
          v85 = 2114;
          v86 = *(double *)&v60;
          v87 = 2112;
          v88 = v34;
          _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "No Social Group asset Knowledge Graph data for %{public}@ for %{public}@. Error :%@", buf, 0x20u);

          v50 = v59;
        }

      }
      +[PLSearchIndexManager _keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:andAssetUUIDsBySocialGroup:photoLibrary:](PLSearchIndexManager, "_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:andAssetUUIDsBySocialGroup:photoLibrary:", v50, v56, v12);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (v61)
      {
        objc_msgSend(v76, "addEntriesFromDictionary:", v61);
      }
      else
      {
        v62 = v50;
        PLSearchBackendIndexManagerGetLog();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v84 = v64;
          _os_log_impl(&dword_199541000, v63, OS_LOG_TYPE_ERROR, "Failed to compute per-asset keywords from assetSearchKeywords for %{public}@.", buf, 0xCu);

          v12 = v78;
        }

        v50 = v62;
      }
      v65 = v49;
      v66 = v65;
      if (v74 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v66, OS_SIGNPOST_INTERVAL_END, spida, "SearchIndexManager - RequestAssetSearchKeywordsForMoments", ", buf, 2u);
      }

      PLSearchBackendIndexManagerGetLog();
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        if (v79)
          v68 = CFSTR("(JIT)");
        else
          v68 = &stru_1E36789C0;
        v69 = CFAbsoluteTimeGetCurrent() - v46;
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v84 = v68;
        v85 = 2050;
        v86 = v69;
        v87 = 2114;
        v88 = v70;
        _os_log_impl(&dword_199541000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@Request for Asset Search Keywords for Moments took %{public}f seconds for %{public}@.", buf, 0x20u);

        v12 = v78;
      }

      v20 = v75;
    }
    v15 = (void *)objc_msgSend(v76, "copy");

    v10 = v77;
  }

  return v15;
}

- (void)_inqIndexPhotoLibrary
{
  PLPhotoLibrary *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  PLPhotoAnalysisMomentGraphService *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  double Current;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  double v28;
  void *v29;
  NSObject *v30;
  void *v31;
  double v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  PLZeroKeywordStore *zeroKeywordStore;
  PLZeroKeywordStore *v38;
  void *v39;
  PLZeroKeywordStore *v40;
  PLZeroKeywordStore *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  double v47;
  void *v48;
  NSObject *v49;
  void *v50;
  double v51;
  os_signpost_id_t v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  id v56;
  PLSearchMetadataStore *searchMetadataStore;
  PLSearchMetadataStore *v58;
  void *v59;
  PLSearchMetadataStore *v60;
  PLSearchMetadataStore *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  double v67;
  void *v68;
  PLPhotoLibrary *v69;
  NSObject *log;
  os_log_t loga;
  PLPhotoAnalysisMomentGraphService *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD v77[5];
  _QWORD v78[4];
  PLPhotoLibrary *v79;
  PLSearchIndexManager *v80;
  _BYTE *v81;
  uint64_t *v82;
  uint64_t *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint8_t v110[4];
  double v111;
  __int16 v112;
  id v113;
  _BYTE buf[24];
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  -[PLSearchIndexManager _inqEnsurePhotoLibraryExists](self, "_inqEnsurePhotoLibraryExists");
  v3 = self->_photoLibrary;
  self->_lastIndexingStartTime = CFAbsoluteTimeGetCurrent();
  -[PLSearchIndexManager searchIndexManagerSignpostLog](self, "searchIndexManagerSignpostLog");
  log = objc_claimAutoreleasedReturnValue();
  PLSearchBackendIndexManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2050;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Began indexing Photo Library: %@, Search Index Manager: %{public}p", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v115 = __Block_byref_object_copy__6301;
  v116 = __Block_byref_object_dispose__6302;
  v117 = 0;
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__6301;
  v108 = __Block_byref_object_dispose__6302;
  v109 = 0;
  v98 = 0;
  v99 = &v98;
  v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__6301;
  v102 = __Block_byref_object_dispose__6302;
  v103 = 0;
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = __Block_byref_object_copy__6301;
  v96 = __Block_byref_object_dispose__6302;
  v97 = 0;
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__6301;
  v90 = __Block_byref_object_dispose__6302;
  v91 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __45__PLSearchIndexManager__inqIndexPhotoLibrary__block_invoke;
  v78[3] = &unk_1E3661AD8;
  v79 = v3;
  v80 = self;
  v81 = buf;
  v82 = &v104;
  v83 = &v98;
  v84 = &v92;
  v85 = &v86;
  v69 = v79;
  -[PLPhotoLibrary performBlockAndWait:](v79, "performBlockAndWait:", v78);
  v77[0] = v6;
  v77[1] = 3221225472;
  v77[2] = __45__PLSearchIndexManager__inqIndexPhotoLibrary__block_invoke_212;
  v77[3] = &unk_1E3661B00;
  v77[4] = self;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v77);
  ((void (**)(_QWORD, _QWORD, const __CFString *))v7)[2](v7, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), CFSTR("insertAsset"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, v105[5], CFSTR("insertAlbum"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, v99[5], CFSTR("insertMemory"));
  ((void (**)(_QWORD, uint64_t, const __CFString *))v7)[2](v7, v93[5], CFSTR("insertHighlight"));
  v8 = [PLPhotoAnalysisMomentGraphService alloc];
  -[PLPhotoLibrary photoAnalysisClient](v69, "photoAnalysisClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = -[PLPhotoAnalysisMomentGraphService initWithServiceProvider:](v8, "initWithServiceProvider:", v9);

  if (_os_feature_enabled_impl())
  {
    PLSearchBackendIndexManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v110 = 138543362;
      v111 = *(double *)&v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Skipping request for search data from photoanalysisd, %{public}@, ", v110, 0xCu);

    }
    v12 = 0;
  }
  else
  {
    v13 = v93[5];
    v14 = v87[5];
    v76 = 0;
    -[PLSearchIndexManager _inqRequestGraphDataForHighlightUUIDs:momentUUIDs:photoLibrary:singleAssetOnly:error:](self, "_inqRequestGraphDataForHighlightUUIDs:momentUUIDs:photoLibrary:singleAssetOnly:error:", v13, v14, v69, 0, &v76);
    v10 = objc_claimAutoreleasedReturnValue();
    v15 = v76;
    if (-[NSObject count](v10, "count"))
      -[NSMutableDictionary addEntriesFromDictionary:](self->_inqGraphDataByUUID, "addEntriesFromDictionary:", v10);
    PLSearchBackendIndexManagerGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v110 = 138543362;
      v111 = *(double *)&v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Requesting Synonym Dictionaries for %{public}@.", v110, 0xCu);

    }
    Current = CFAbsoluteTimeGetCurrent();
    v19 = os_signpost_id_generate(log);
    v20 = log;
    v21 = v20;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v110 = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "SearchIndexManager - RequestSynonymDictionaries", ", v110, 2u);
    }

    v75 = v15;
    -[PLPhotoAnalysisMomentGraphService requestSynonymsDictionariesWithError:](v72, "requestSynonymsDictionariesWithError:", &v75);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v75;

    if (v22)
    {
      -[NSMutableDictionary addEntriesFromDictionary:](self->_inqSynonymsByIndexCategoryMask, "addEntriesFromDictionary:", v22);
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v110 = 138543618;
        v111 = *(double *)&v24;
        v112 = 2112;
        v113 = v12;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to get Synonyms from Photo Analysis for %{public}@. Error: %@", v110, 0x16u);

      }
    }
    v25 = v21;
    v26 = v25;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)v110 = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v19, "SearchIndexManager - RequestSynonymDictionaries", ", v110, 2u);
    }

    PLSearchBackendIndexManagerGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = CFAbsoluteTimeGetCurrent();
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v110 = 134349314;
      v111 = v28 - Current;
      v112 = 2114;
      v113 = v29;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Request for Synonyms took %{public}f seconds for %{public}@.", v110, 0x16u);

    }
  }

  PLSearchBackendIndexManagerGetLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v110 = 138543362;
    v111 = *(double *)&v31;
    _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "Requesting Zero Keywords from Photo Analysis for %{public}@.", v110, 0xCu);

  }
  v32 = CFAbsoluteTimeGetCurrent();
  v33 = os_signpost_id_generate(log);
  v34 = log;
  v35 = v34;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)v110 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "SearchIndexManager - RequestZeroKeywords", ", v110, 2u);
  }

  v74 = v12;
  -[PLPhotoAnalysisMomentGraphService requestZeroKeywordsWithOptions:error:](v72, "requestZeroKeywordsWithOptions:error:", 0, &v74);
  loga = (os_log_t)objc_claimAutoreleasedReturnValue();
  v36 = v74;

  if (loga)
  {
    zeroKeywordStore = self->_zeroKeywordStore;
    if (!zeroKeywordStore)
    {
      v38 = [PLZeroKeywordStore alloc];
      -[PLPhotoLibraryPathManager searchIndexZeroKeywordStoreFilePath](self->_pathManager, "searchIndexZeroKeywordStoreFilePath");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[PLZeroKeywordStore initWithPath:](v38, "initWithPath:", v39);
      v41 = self->_zeroKeywordStore;
      self->_zeroKeywordStore = v40;

      zeroKeywordStore = self->_zeroKeywordStore;
    }
    -[PLZeroKeywordStore updateZeroKeywordsTo:](zeroKeywordStore, "updateZeroKeywordsTo:", loga);
  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v110 = 138543618;
      v111 = *(double *)&v43;
      v112 = 2112;
      v113 = v36;
      _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "Failed to get Zero Keywords from Photo Analysis for %{public}@. Error: %@", v110, 0x16u);

    }
  }
  v44 = v35;
  v45 = v44;
  if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
  {
    *(_WORD *)v110 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v45, OS_SIGNPOST_INTERVAL_END, v33, "SearchIndexManager - RequestZeroKeywords", ", v110, 2u);
  }

  PLSearchBackendIndexManagerGetLog();
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = CFAbsoluteTimeGetCurrent();
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v110 = 134349314;
    v111 = v47 - v32;
    v112 = 2114;
    v113 = v48;
    _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEFAULT, "Request for Zero Keywords took %{public}f seconds for %{public}@.", v110, 0x16u);

  }
  PLSearchBackendIndexManagerGetLog();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v110 = 138543362;
    v111 = *(double *)&v50;
    _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_DEFAULT, "Requesting Knowledge Graph Search Metadata for %{public}@.", v110, 0xCu);

  }
  v51 = CFAbsoluteTimeGetCurrent();
  v52 = os_signpost_id_generate(v45);
  v53 = v45;
  v54 = v53;
  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    *(_WORD *)v110 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v54, OS_SIGNPOST_INTERVAL_BEGIN, v52, "SearchIndexManager - indexPhotoLibrary - requestGraphSearchMetadata", ", v110, 2u);
  }

  v73 = v36;
  -[PLPhotoAnalysisMomentGraphService requestGraphSearchMetadataWithOptions:error:](v72, "requestGraphSearchMetadataWithOptions:error:", 0, &v73);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v73;

  if (v55)
  {
    searchMetadataStore = self->_searchMetadataStore;
    if (!searchMetadataStore)
    {
      v58 = [PLSearchMetadataStore alloc];
      -[PLPhotoLibraryPathManager searchIndexMetadataStoreFilePath](self->_pathManager, "searchIndexMetadataStoreFilePath");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = -[PLSearchMetadataStore initWithPath:](v58, "initWithPath:", v59);
      v61 = self->_searchMetadataStore;
      self->_searchMetadataStore = v60;

      searchMetadataStore = self->_searchMetadataStore;
    }
    -[PLSearchMetadataStore updateSearchMetadataTo:](searchMetadataStore, "updateSearchMetadataTo:", v55);
  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v110 = 138543618;
      v111 = *(double *)&v63;
      v112 = 2112;
      v113 = v56;
      _os_log_impl(&dword_199541000, v62, OS_LOG_TYPE_ERROR, "Failed to get Knowledge Graph Search Metadata from Photo Analysis for %{public}@. Error: %@", v110, 0x16u);

    }
  }
  v64 = v54;
  v65 = v64;
  if (v52 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
  {
    *(_WORD *)v110 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v65, OS_SIGNPOST_INTERVAL_END, v52, "SearchIndexManager - RequestGraphSearchMetadata", ", v110, 2u);
  }

  PLSearchBackendIndexManagerGetLog();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = CFAbsoluteTimeGetCurrent();
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v110 = 134349314;
    v111 = v67 - v51;
    v112 = 2114;
    v113 = v68;
    _os_log_impl(&dword_199541000, v66, OS_LOG_TYPE_DEFAULT, "Request for Knowledge Graph Search Metadata took %{public}f seconds for %{public}@.", v110, 0x16u);

  }
  _Block_object_dispose(&v86, 8);

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(&v104, 8);
  _Block_object_dispose(buf, 8);

}

- (void)_inqEnsureSceneTaxonomyProxyExists
{
  PLSearchIndexSceneTaxonomyProvider *v3;
  PLSearchIndexSceneTaxonomyProvider *sceneTaxonomyProvider;

  if (!self->_sceneTaxonomyProvider)
  {
    v3 = objc_alloc_init(PLSearchIndexSceneTaxonomyProvider);
    sceneTaxonomyProvider = self->_sceneTaxonomyProvider;
    self->_sceneTaxonomyProvider = v3;

  }
}

- (void)_inqEnsureCSUTaxonomyProxyExists
{
  void *v3;
  void *v4;
  id v5;
  CSUSearchableKnowledgeObjectStore *v6;
  id v7;
  CSUSearchableKnowledgeObjectStore *csuTaxonomyObjectStore;
  NSObject *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl() && !self->_csuTaxonomyObjectStore)
  {
    -[PLPhotoLibrary pathManager](self->_photoLibrary, "pathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v3, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 5, 0, 0, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;

    v10 = v5;
    v6 = (CSUSearchableKnowledgeObjectStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0D188F0]), "initExistingDB:error:", v4, &v10);
    v7 = v10;

    csuTaxonomyObjectStore = self->_csuTaxonomyObjectStore;
    self->_csuTaxonomyObjectStore = v6;

    if (!self->_csuTaxonomyObjectStore || v7)
    {
      PLSearchBackendSceneTaxonomyGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Victoria: Failed to load CSU EntityStore. Error: %@", buf, 0xCu);
      }

    }
  }
}

- (id)_wordEmbeddingVersion
{
  void *v2;
  void *v3;

  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)NLStringEmbeddingCopyCurrentVersion();

  return v3;
}

- (int64_t)_inqRebuildReasonIfSearchSupportingDataIsValid
{
  void *v3;
  _BOOL4 v4;
  int v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PLSearchIndexManager _wordEmbeddingVersion](self, "_wordEmbeddingVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLSearchIndexManager _inqUpdateWordEmbeddingVersion:](self, "_inqUpdateWordEmbeddingVersion:", v3);

  if (!self->_hasValidSearchSupportingData || (self->_shouldCheckDatabaseIntegrity ? (v5 = 1) : (v5 = v4), v5 == 1))
  {
    v6 = -[PLSearchIndexManager _inqUpdateLocale](self, "_inqUpdateLocale");
    v7 = -[PLSearchIndexManager _inqUpdateEmbeddingModelVersion](self, "_inqUpdateEmbeddingModelVersion");
    v8 = -[PLSearchIndexManager _inqUpdateUtilityTypeClassifierVersion](self, "_inqUpdateUtilityTypeClassifierVersion");
    -[PLSearchIndexSceneTaxonomyProvider digests](self->_sceneTaxonomyProvider, "digests");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PLSearchIndexManager _inqUpdateSceneTaxonomySHA:](self, "_inqUpdateSceneTaxonomySHA:", v9);

    if (v6)
    {
      PLSearchBackendIndexManagerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v12;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Locale changed for %{public}@.", (uint8_t *)&v21, 0xCu);

      }
      v13 = 2;
    }
    else if (v7)
    {
      PLSearchBackendIndexManagerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v14;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Embedding model version changed for %{public}@.", (uint8_t *)&v21, 0xCu);

      }
      v13 = 10;
    }
    else if (v8)
    {
      PLSearchBackendIndexManagerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v15;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Utility type classifier version changed for %{public}@.", (uint8_t *)&v21, 0xCu);

      }
      v13 = 11;
    }
    else if (v10)
    {
      PLSearchBackendIndexManagerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v16;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Scene Taxonomy SHA changed for %{public}@.", (uint8_t *)&v21, 0xCu);

      }
      v13 = 3;
    }
    else if (v4)
    {
      PLSearchBackendIndexManagerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v17;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: Word Embedding version changed for %{public}@.", (uint8_t *)&v21, 0xCu);

      }
      v13 = 4;
    }
    else
    {
      if (!self->_shouldCheckDatabaseIntegrity || !-[PSIDatabase isDatabaseCorrupted](self->_db, "isDatabaseCorrupted"))
      {
        v13 = 0;
        v19 = 1;
        goto LABEL_33;
      }
      PLSearchBackendIndexManagerGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543362;
        v22 = v18;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Detected unexpected reason to reindex: Search Index databsae is corrupted for %{public}@.", (uint8_t *)&v21, 0xCu);

      }
      v13 = 7;
    }

    v19 = 0;
LABEL_33:
    self->_hasValidSearchSupportingData = v19;
    self->_shouldCheckDatabaseIntegrity = 0;
    return v13;
  }
  return 0;
}

- (id)_assetUUIDsToRemoveFromUUIDsToProcess:(id)a3
{
  return (id)objc_msgSend(a3, "objectForKey:", CFSTR("removeAsset"));
}

- (id)_collectionUUIDsToRemoveFromUUIDsToProcess:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("removeHighlight"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  objc_msgSend(v4, "objectForKey:", CFSTR("removeAlbum"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend(v4, "objectForKey:", CFSTR("removeMemory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObjectsFromArray:", v8);
  return v5;
}

- (void)resumeIndexingIfAllowed
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__PLSearchIndexManager_resumeIndexingIfAllowed__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v2);
}

- (void)indexSingleAssetWithUUID:(id)a3 completion:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  PLPhotoAnalysisMomentGraphService *v13;
  void *v14;
  PLPhotoAnalysisMomentGraphService *v15;
  id v16;
  PLPhotoAnalysisMomentGraphService *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  id *v51;
  id *v52;
  id v53;
  id v54;
  PLPhotoLibraryOptions *v55;
  id v56;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  _BYTE *v62;
  uint64_t *v63;
  uint64_t *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  PLPhotoAnalysisMomentGraphService *v68;
  PLSearchIndexManager *v69;
  _BYTE *v70;
  _QWORD *v71;
  _BYTE *v72;
  _QWORD *v73;
  uint64_t *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _QWORD v83[5];
  id v84;
  _QWORD v85[5];
  id v86;
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  id v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  const __CFString *v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  uint8_t v110[4];
  void *v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  void *v115;
  _BYTE v116[24];
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  _BYTE buf[24];
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v54 = a4;
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__6301;
  v99 = __Block_byref_object_dispose__6302;
  v100 = 0;
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 1;
  PLSearchBackendIndexManagerGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v56;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "(JIT) indexSingleAssetWithUUID: %{public}@ BEGIN for %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v121 = __Block_byref_object_copy__6301;
  v122 = __Block_byref_object_dispose__6302;
  v123 = 0;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = __Block_byref_object_copy__6301;
  v89[4] = __Block_byref_object_dispose__6302;
  v90 = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = __Block_byref_object_copy__6301;
  v87[4] = __Block_byref_object_dispose__6302;
  v88 = 0;
  v55 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = 0;
  v9 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLSearchIndexManager indexSingleAssetWithUUID:completion:]", v8, v55, &v86);
  v53 = v86;

  if (v9)
  {
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke;
    v83[3] = &unk_1E3676370;
    v83[4] = self;
    v10 = v56;
    v84 = v10;
    v85[1] = buf;
    v85[4] = a2;
    v85[2] = v89;
    v11 = v9;
    v85[0] = v11;
    v85[3] = v87;
    v12 = -[PLSearchIndexManager _onQueueSync:](self, "_onQueueSync:", v83);
    v51 = &v84;
    v52 = (id *)v85;
    *((_BYTE *)v92 + 24) = v12;
    if (v12)
    {
      v13 = [PLPhotoAnalysisMomentGraphService alloc];
      objc_msgSend(v11, "photoAnalysisClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLPhotoAnalysisMomentGraphService initWithServiceProvider:](v13, "initWithServiceProvider:", v14);

      *(_QWORD *)v116 = 0;
      *(_QWORD *)&v116[8] = v116;
      *(_QWORD *)&v116[16] = 0x3032000000;
      v117 = __Block_byref_object_copy__6301;
      v118 = __Block_byref_object_dispose__6302;
      v119 = 0;
      v77 = 0;
      v78 = &v77;
      v79 = 0x3032000000;
      v80 = __Block_byref_object_copy__6301;
      v81 = __Block_byref_object_dispose__6302;
      v82 = 0;
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_267;
      v65[3] = &unk_1E3661CE0;
      v16 = v10;
      v66 = v16;
      v67 = v11;
      v17 = v15;
      v68 = v17;
      v69 = self;
      v70 = buf;
      v71 = v89;
      v72 = v116;
      v73 = v87;
      v74 = &v77;
      v75 = &v91;
      v76 = &v95;
      objc_msgSend(v67, "performBlockAndWait:", v65);
      objc_msgSend(MEMORY[0x1E0CA6B38], "defaultSearchableIndex");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18 && *(_QWORD *)(*(_QWORD *)&v116[8] + 40) && v78[5])
      {
        PLSearchBackendIndexManagerGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(*(_QWORD *)&v116[8] + 40), "uniqueIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v78[5];
          -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v110 = 138543874;
          v111 = v20;
          v112 = 2114;
          v113 = v21;
          v114 = 2114;
          v115 = v22;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_INFO, "(JIT) Donating CSSI %{public}@, bundleID %{public}@ to Spotlight for %{public}@.", v110, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLSearchIndexManager indexSingleAssetWithUUID:completion:]");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = *(_QWORD *)(*(_QWORD *)&v116[8] + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v78[5];
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_275;
        v58[3] = &unk_1E3661D08;
        v62 = v116;
        v63 = &v77;
        v58[4] = self;
        v64 = &v95;
        v61 = v54;
        v59 = v16;
        v26 = v23;
        v60 = v26;
        objc_msgSend(v18, "indexSearchableItems:deleteSearchableItemsWithIdentifiers:clientState:protectionClass:forBundleID:options:completionHandler:", v24, 0, 0, 0, v25, 0, v58);

      }
      else
      {
        *((_BYTE *)v92 + 24) = 0;
        if (v96[5])
        {
LABEL_16:

          _Block_object_dispose(&v77, 8);
          _Block_object_dispose(v116, 8);

          goto LABEL_17;
        }
        v32 = (void *)MEMORY[0x1E0CB35C8];
        v107 = *MEMORY[0x1E0CB2938];
        v108 = CFSTR("missing at least one of: index, cssi, bundle identifier");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v26);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = (void *)v96[5];
        v96[5] = v33;

      }
      goto LABEL_16;
    }
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v105 = *MEMORY[0x1E0CB2938];
    v106 = CFSTR("search index manager invalid state");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
    v17 = (PLPhotoAnalysisMomentGraphService *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v17);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v96[5];
    v96[5] = v30;

  }
  else
  {
    *((_BYTE *)v92 + 24) = 0;
    v27 = v96;
    v28 = v53;
    v17 = (PLPhotoAnalysisMomentGraphService *)v27[5];
    v27[5] = (uint64_t)v28;
  }
LABEL_17:

  v35 = v92;
  if (*((_BYTE *)v92 + 24))
  {
    NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[PLSearchIndexManager _setIndexingPaused:synchronously:reason:](self, "_setIndexingPaused:synchronously:reason:", 0, 1, v36);

    v35 = v92;
    if (!v37)
    {
      *((_BYTE *)v92 + 24) = 0;
      v38 = (void *)MEMORY[0x1E0CB35C8];
      v103 = *MEMORY[0x1E0CB2938];
      v104 = CFSTR("indexSingleAssetWithUUID: unable to resume search indexing");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v39);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = (void *)v96[5];
      v96[5] = v40;

      v35 = v92;
    }
  }
  if (!*((_BYTE *)v35 + 24))
  {
    if (!v96[5])
    {
      PLSearchBackendIndexManagerGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
        -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v116 = 138543618;
        *(_QWORD *)&v116[4] = v56;
        *(_WORD *)&v116[12] = 2114;
        *(_QWORD *)&v116[14] = v43;
        _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_FAULT, "(JIT) indexSingleAssetWithUUID: %{public}@ unexpected localError is nil for %{public}@.", v116, 0x16u);

      }
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v101 = *MEMORY[0x1E0CB2938];
      v102 = CFSTR("unexpected localError == nil during indexSingleAssetWithUUID");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (void *)v96[5];
      v96[5] = v46;

    }
    PLSearchBackendIndexManagerGetLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (uint64_t (*)(uint64_t, uint64_t))v96[5];
      *(_DWORD *)v116 = 138543874;
      *(_QWORD *)&v116[4] = v56;
      *(_WORD *)&v116[12] = 2114;
      *(_QWORD *)&v116[14] = v49;
      *(_WORD *)&v116[22] = 2112;
      v117 = v50;
      _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "(JIT) [FAILED] indexSingleAssetWithUUID: %{public}@ failed for %{public}@. Error: %@", v116, 0x20u);

    }
    (*((void (**)(id, _QWORD, uint64_t))v54 + 2))(v54, 0, v96[5]);
  }
  if (v9)
  {

  }
  _Block_object_dispose(v87, 8);

  _Block_object_dispose(v89, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v91, 8);
  _Block_object_dispose(&v95, 8);

}

- (void)disableUISearch
{
  -[PLSpotlightDonationManager disableUISearch](self->_spotlightDonationManager, "disableUISearch");
}

- (void)_fetchMemoriesToIndexWithUUIDs:(id)a3 managedObjectContext:(id)a4 result:(id)a5
{
  id v7;
  void (**v8)(id, void *, void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  id v28;
  int v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void (**v42)(id, void *, void *, void *);
  id v43;
  id v44;
  id v45;
  id v46;
  id obj;
  void *v48;
  uint64_t v49;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  _BYTE v57[128];
  void *v58;
  _QWORD v59[4];

  v59[2] = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v7 = a4;
  v8 = (void (**)(id, void *, void *, void *))a5;
  v9 = (void *)MEMORY[0x1E0C97B48];
  +[PLMemory entityName](PLMemory, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPropertiesToFetch:", &unk_1E37632C0);
  objc_msgSend(v11, "setIncludesPendingChanges:", 0);
  objc_msgSend(v11, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(pendingState) != %d && noindex:(rejected) == NO"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v15);

  v56 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v11, &v56);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v56;
  v18 = v17;
  if (v16)
  {
    v39 = v17;
    v41 = v11;
    v42 = v8;
    v43 = v7;
    v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = v16;
    v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v40 = v19;
    obj = v19;
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    if (v51)
    {
      v49 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v53 != v49)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v23, "photosGraphData");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLSearchIndexManager _featuredPersonLocalIdentifiersFromPhotosGraphData:photosGraphVersion:](self, "_featuredPersonLocalIdentifiersFromPhotosGraphData:photosGraphVersion:", v24, objc_msgSend(v23, "photosGraphVersion"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v25, "count"))
          {
            objc_msgSend(v25, "sortedArrayUsingDescriptors:", v48);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "componentsJoinedByString:", CFSTR(":"));
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v27 = &stru_1E36789C0;
          }
          v28 = objc_alloc(MEMORY[0x1E0CB3940]);
          v29 = objc_msgSend(v23, "category");
          v30 = objc_msgSend(v23, "subcategory");
          objc_msgSend(v23, "title");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "subtitle");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%hd:%hd:%@:%@:%@"), v29, v30, v31, v32, v27);

          if (objc_msgSend(v20, "containsObject:", v33))
          {
            objc_msgSend(v23, "uuid");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v34);

          }
          else
          {
            objc_msgSend(v20, "addObject:", v33);
            objc_msgSend(v23, "uuid");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v46, "containsObject:", v35);

            if (v36)
              objc_msgSend(v44, "addObject:", v23);
          }

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v51);
    }

    v8 = v42;
    v7 = v43;
    v16 = v40;
    v11 = v41;
    v18 = v39;
    v37 = v44;
    v38 = v45;
  }
  else
  {
    v38 = 0;
    v37 = 0;
  }
  v8[2](v8, v37, v38, v18);

}

- (id)_featuredPersonLocalIdentifiersFromPhotosGraphData:(id)a3 photosGraphVersion:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  const __CFString *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  unsigned __int16 v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v39 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v37 = objc_opt_class();
  v14 = v6;
  v15 = v41;
  objc_msgSend(v14, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, v37, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v16, v41, &v46);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v46;

  if (v17)
  {
    v19 = v39 == 257;
    if (v39 >= 0x101u)
    {
      v40 = v18;
      if (v19)
        v20 = CFSTR("featureVector");
      else
        v20 = CFSTR("featureVector_v2");
      objc_msgSend(v17, "objectForKeyedSubscript:", v20);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v43 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v26, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("People"));

            if (v28)
            {
              objc_msgSend(v26, "lastObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "addObject:", v29);

            }
          }
          v23 = -[NSObject countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        }
        while (v23);
      }

      v18 = v40;
      v15 = v41;
      goto LABEL_25;
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("featureVector"));
    v31 = objc_claimAutoreleasedReturnValue();
    v21 = v31;
    if (v31)
    {
      -[NSObject objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", CFSTR("people"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32 && objc_msgSend(v32, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v33);
        v34 = objc_claimAutoreleasedReturnValue();
LABEL_24:
        v35 = (void *)v34;

        v4 = v35;
        goto LABEL_25;
      }
    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v34 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  PLSearchBackendIndexManagerGetLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v30;
    v49 = 2112;
    v50 = v18;
    _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to unarchive Knowledge Graph data for %{public}@. Error: %@", buf, 0x16u);

  }
LABEL_25:

  return v4;
}

- (PSIDatabase)database
{
  return self->_db;
}

- (void)_inqUpdateFeaturedContentForSearch:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  const __CFString *v7;
  _QWORD v8[4];
  id v9;
  PLSearchIndexManager *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  -[PLSearchIndexManager _inqPhotoLibrary](self, "_inqPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6301;
  v16 = __Block_byref_object_dispose__6302;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__PLSearchIndexManager__inqUpdateFeaturedContentForSearch___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v6 = v5;
  v10 = self;
  v11 = &v12;
  v9 = v6;
  objc_msgSend(v6, "performBlockAndWait:", v8);
  if (objc_msgSend((id)v13[5], "count"))
  {
    if (v3)
      v7 = CFSTR("insertMemory");
    else
      v7 = CFSTR("removeMemory");
    -[PLSearchIndexManager _inqAddUpdatesWithUUIDs:forKey:](self, "_inqAddUpdatesWithUUIDs:forKey:", v13[5], v7);
  }

  _Block_object_dispose(&v12, 8);
}

- (void)_beginObservingPhotosPreferences
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_preferencesDidChange, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_stopObservingPhotosPreferences
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0);
}

- (void)_beginObservingPowerSourceChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_PLSearchIndexManagerPowerSourceNotificationCallback, CFSTR("com.apple.system.powersources.source"), 0, CFNotificationSuspensionBehaviorCoalesce);
}

- (void)_stopObservingPowerSourceChanges
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.system.powersources.source"), 0);
}

- (void)_handlePowerSourceChange
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexManagerGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PLSearchIndexManager photoLibraryTypeDescription](self, "photoLibraryTypeDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Detected power source change. Resuming indexing if needed / allowed for %{public}@.", (uint8_t *)&v5, 0xCu);

  }
  -[PLSearchIndexManager resumeIndexingIfAllowed](self, "resumeIndexingIfAllowed");
}

- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  id v14;
  id v15;
  BOOL v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__PLSearchIndexManager_insertEmbeddings_modelType_assetUUID_completion___block_invoke;
  v17[3] = &unk_1E3674F58;
  v17[4] = self;
  v18 = v10;
  v21 = a4;
  v19 = v11;
  v13 = (void (**)(_QWORD))v12;
  v20 = v13;
  v14 = v11;
  v15 = v10;
  v16 = -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v17);
  if (v13 && !v16)
    v13[2](v13);

}

- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  id v12;
  id v13;
  BOOL v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__PLSearchIndexManager_deleteEmbeddings_assetUUID_completion___block_invoke;
  v15[3] = &unk_1E3671878;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v11 = (void (**)(_QWORD))v10;
  v18 = v11;
  v12 = v9;
  v13 = v8;
  v14 = -[PLSearchIndexManager _onQueueAsync:](self, "_onQueueAsync:", v15);
  if (v11 && !v14)
    v11[2](v11);

}

- (BOOL)isSharedLibraryEnabledForSearchIndexingContext:(id)a3
{
  return self->_isSharedLibraryEnabled;
}

- (double)lastKnownElapsedIndexingTime
{
  return self->_lastKnownElapsedIndexingTime;
}

- (void)setLastKnownElapsedIndexingTime:(double)a3
{
  self->_lastKnownElapsedIndexingTime = a3;
}

- (NSDate)dateOfLastSearchIndexRebuild
{
  return self->_dateOfLastSearchIndexRebuild;
}

- (void)setDateOfLastSearchIndexRebuild:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfLastSearchIndexRebuild, a3);
}

- (PLSearchIndexSceneTaxonomyProvider)sceneTaxonomyProvider
{
  return self->_sceneTaxonomyProvider;
}

- (CSUSearchableKnowledgeObjectStore)csuTaxonomyObjectStore
{
  return self->_csuTaxonomyObjectStore;
}

- (void)_setIndexing:(BOOL)a3
{
  self->__indexing = a3;
}

- (id)_inqAfterIndexingDidIterate
{
  return self->__inqAfterIndexingDidIterate;
}

- (void)_setInqAfterIndexingDidIterate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setPhotoLibraryTypeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryTypeDescription, a3);
}

- (NSDate)dateBeganIndexingOnBattery
{
  return self->_dateBeganIndexingOnBattery;
}

- (NSDate)datePausedIndexingOnBattery
{
  return self->_datePausedIndexingOnBattery;
}

- (PLSearchIndexManagerDatabaseConnectionDelegate)databaseConnectionDelegate
{
  return (PLSearchIndexManagerDatabaseConnectionDelegate *)objc_loadWeakRetained((id *)&self->_databaseConnectionDelegate);
}

- (void)setDatabaseConnectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_databaseConnectionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_databaseConnectionDelegate);
  objc_storeStrong((id *)&self->_datePausedIndexingOnBattery, 0);
  objc_storeStrong((id *)&self->_dateBeganIndexingOnBattery, 0);
  objc_storeStrong((id *)&self->_photoLibraryTypeDescription, 0);
  objc_storeStrong((id *)&self->_spotlightDonationManager, 0);
  objc_storeStrong((id *)&self->__pauseReasons, 0);
  objc_storeStrong(&self->__inqAfterIndexingDidIterate, 0);
  objc_storeStrong((id *)&self->_dateOfLastSearchIndexRebuild, 0);
  objc_storeStrong((id *)&self->_blocksOnQueueAfterDelay, 0);
  objc_storeStrong((id *)&self->_inqSynonymsByIndexCategoryMask, 0);
  objc_storeStrong((id *)&self->_inqGraphDataByUUID, 0);
  objc_storeStrong((id *)&self->_inqUUIDsToProcess, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_searchSystemInfo, 0);
  objc_storeStrong((id *)&self->_csuTaxonomyObjectStore, 0);
  objc_storeStrong((id *)&self->_sceneTaxonomyProvider, 0);
  objc_storeStrong((id *)&self->_serverTransaction, 0);
  objc_storeStrong((id *)&self->_throttleTimer, 0);
  objc_storeStrong((id *)&self->_searchMetadataStore, 0);
  objc_storeStrong((id *)&self->_zeroKeywordStore, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

void __62__PLSearchIndexManager_deleteEmbeddings_assetUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_inqEnsureSearchIndexExists");
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v3, "deleteEmbeddingsForModelTypes:assetUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

uint64_t __72__PLSearchIndexManager_insertEmbeddings_modelType_assetUUID_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_inqEnsureSearchIndexExists");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "insertEmbeddings:modelType:assetUUID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __59__PLSearchIndexManager__inqUpdateFeaturedContentForSearch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "fetchMemoryUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v5, "wellKnownPhotoLibraryIdentifier"), &v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  if (v7)
  {
    PLSearchBackendIndexManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch Memories for %{public}@. Error: %@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v2);
}

void __53__PLSearchIndexManager_searchIndexManagerSignpostLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.search", "SearchIndexManager");
  v1 = (void *)searchIndexManagerSignpostLog_searchIndexManagerSignpostLog;
  searchIndexManagerSignpostLog_searchIndexManagerSignpostLog = (uint64_t)v0;

}

void __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t v39[4];
  uint64_t v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  NSObject *v44;
  _BYTE buf[24];
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_inqIsIndexingPaused"))
  {
    PLSearchBackendIndexManagerGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "(JIT) Search Indexing is already paused before indexing single asset %{public}@ for %{public}@", buf, 0x16u);

    }
  }
  v5 = *(void **)(a1 + 32);
  NSStringFromSelector(*(SEL *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_inqSetIndexingPaused:reason:", 1, v6);

  objc_msgSend(*(id *)(a1 + 32), "_inqEnsureSceneTaxonomyProxyExists");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(a1 + 32), "_inqEnsureCSUTaxonomyProxyExists");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v46 = __Block_byref_object_copy__6301;
  v47 = __Block_byref_object_dispose__6302;
  v48 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__6301;
  v37 = __Block_byref_object_dispose__6302;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = *(void **)(a1 + 48);
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_266;
  v27[3] = &unk_1E366F518;
  v28 = v7;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v29 = v8;
  v30 = v9;
  v31 = buf;
  v32 = &v33;
  objc_msgSend(v28, "performBlockAndWait:", v27);
  if (_os_feature_enabled_impl())
  {
    PLSearchBackendIndexManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v39 = 138412546;
      v40 = v11;
      v41 = 2114;
      v42 = v12;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "Skipping request for search data from photoanalysisd for asset %@, %{public}@", v39, 0x16u);

    }
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v34[5], "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 48);
    v26 = 0;
    objc_msgSend(v13, "_inqRequestGraphDataForHighlightUUIDs:momentUUIDs:photoLibrary:singleAssetOnly:error:", v14, v15, v16, 1, &v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v26;

    if (!objc_msgSend(v17, "count") && v10)
    {
      PLSearchBackendIndexManagerGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v39 = 138543874;
        v40 = v19;
        v41 = 2114;
        v42 = v20;
        v43 = 2112;
        v44 = v10;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "(JIT) Failed to get Knowledge Graph data for asset %{public}@ for %{public}@. Error: %@", v39, 0x20u);

      }
    }
    objc_msgSend(v17, "objectForKey:", *(_QWORD *)(a1 + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if (!*(_QWORD *)(v25 + 40))
    *(_QWORD *)(v25 + 40) = MEMORY[0x1E0C9AA70];

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(buf, 8);

}

void __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_267(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  PLSearchIndexingContext *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PLSearchIndexingContext *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(a1 + 48);
    v43 = 0;
    objc_msgSend(v3, "requestSynonymsDictionariesWithError:", &v43);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v43;
    if (!v4)
    {
      PLSearchBackendIndexManagerGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 56), "photoLibraryTypeDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v49 = v7;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "(JIT) synonymsDictionaries not available for JIT donation for %{public}@.", buf, 0xCu);

      }
      v4 = (void *)MEMORY[0x1E0C9AA70];
    }
    v42 = v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1E375D740);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA70];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v12 = [PLSearchIndexingContext alloc];
    v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PLSearchIndexingContext initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:](v12, "initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:", v13, v14, v15, v16, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8), v11, v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 24), "libraryServicesManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "wellKnownPhotoLibraryIdentifier");
    v20 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    objc_msgSend(v2, "documentObservation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightAssetTranslator spotlightSearchableItemFromAsset:libraryIdentifier:graphData:indexingContext:documentObservation:](PLSpotlightAssetTranslator, "spotlightSearchableItemFromAsset:libraryIdentifier:graphData:indexingContext:documentObservation:", v2, v19, v20, v17, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      PLSearchBackendIndexManagerGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "uniqueIdentifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "photoLibraryTypeDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v26;
        v50 = 2114;
        v51 = v27;
        v52 = 2114;
        v53 = v28;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "(JIT) CSSI for asset %{public}@ has uniqueIdentifier %{public}@ for %{public}@", buf, 0x20u);

      }
      if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "setIsUpdate:", 1);
      +[PLSpotlightDonationUtilities bundleIdentifierForAsset:](PLSpotlightDonationUtilities, "bundleIdentifierForAsset:", v2);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;
    }
    else
    {
      v37 = (uint64_t *)MEMORY[0x1E0CB2938];
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
      v46 = *v37;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("indexSingleAssetWithUUID could not create CSSI from asset %@"), *(_QWORD *)(a1 + 32));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 47017, v31);
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
      v41 = *(void **)(v40 + 40);
      *(_QWORD *)(v40 + 40) = v39;

    }
    v34 = v42;
  }
  else
  {
    v32 = (uint64_t *)MEMORY[0x1E0CB2938];
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 0;
    v44 = *v32;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("indexSingleAssetWithUUID unable to find asset %@"), *(_QWORD *)(a1 + 32));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v33;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 47017, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    v4 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;
  }

}

void __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_275(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLSearchBackendIndexManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
      v14 = 138544130;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      v18 = 2114;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "(JIT) [FAILED] Donation for CSSI %{public}@, bundleID %{public}@ failed for %{public}@. Error: %@", (uint8_t *)&v14, 0x2Au);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544130;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    v20 = 2114;
    v21 = v13;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "(JIT) [SUCCEEDED] Donated asset UUID %{public}@, CSSI %{public}@, bundleID %{public}@ for %{public}@", (uint8_t *)&v14, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

void __60__PLSearchIndexManager_indexSingleAssetWithUUID_completion___block_invoke_266(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetWithUUID:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "highlightBeingAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuid");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v5);
    objc_msgSend(v3, "moment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v7);

  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "photoLibraryTypeDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "(JIT) Failed to find asset with UUID: %{public}@ for %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) <= 0x20uLL)
    v5 = 32;
  else
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend(v6, "count");
  if (v5 >= v8)
    v5 = v8;
  v9 = 32 - v5;
  if (v5 > 0x20)
    v9 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v9;
  objc_msgSend(v6, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subarrayWithRange:", 0, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v11, v7);
  objc_msgSend(v6, "removeObjectsInRange:", 0, v5);

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_227(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_opt_new();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);
    }
    -[NSObject addObject:](v7, "addObject:", v5);
  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Failed to add CSSearchableItem for donation. Missing bundleIdentifier for searchableItem: %{public}@ for %{public}@", (uint8_t *)&v10, 0x16u);

    }
  }

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_229(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  PLSearchIndexingContext *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  PLSearchIndexingContext *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  const char *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void (*v79)(uint64_t, void *, void *);
  uint64_t v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  NSObject *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  PLSearchIndexingContext *v106;
  void *v107;
  uint64_t v108;
  _QWORD v109[4];
  NSObject *v110;
  id v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  char v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  id v126;
  id v127;
  _BYTE v128[128];
  uint8_t v129[128];
  uint8_t buf[4];
  void *v131;
  __int16 v132;
  id v133;
  __int16 v134;
  uint64_t v135;
  __int16 v136;
  void *v137;
  __int16 v138;
  uint64_t v139;
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = objc_claimAutoreleasedReturnValue();
  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 142) = v3 != 0;

  v4 = [PLSearchIndexingContext alloc];
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 88);
  +[PLSearchIndexConfiguration locale](PLSearchIndexConfiguration, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = a1;
  v11 = -[PLSearchIndexingContext initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:](v4, "initWithSceneTaxonomyProvider:csuTaxonomyObjectStore:locale:calendar:indexDateFormatter:delegate:seasonSynonyms:synonymsByIndexCategoryMask:", v9, v7, v8, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

  v106 = v11;
  v107 = (void *)v2;
  v108 = a1;
  if (objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    v12 = (void *)objc_opt_class();
    v13 = *(_QWORD *)(a1 + 72);
    v127 = 0;
    objc_msgSend(v12, "fetchAssetsWithUUIDs:managedObjectContext:error:", v13, v2, &v127);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v127;
    v16 = (void *)v2;
    v97 = v15;
    if (v14)
    {
      v17 = objc_msgSend(v14, "count");
      if (v17)
      {
        v18 = v17;
        v19 = 0;
        v100 = v17;
        v101 = v14;
        do
        {
          v20 = (void *)MEMORY[0x19AEC1554]();
          objc_msgSend(v14, "objectAtIndex:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v21, "isDeleted") & 1) != 0
            || (objc_msgSend(v21, "uuid"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, !v22))
          {
            PLSearchBackendIndexManagerGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              goto LABEL_24;
            objc_msgSend(v21, "uuid");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v108;
            objc_msgSend(*(id *)(v108 + 40), "photoLibraryTypeDescription");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v131 = v41;
            v132 = 2114;
            v133 = v43;
            v44 = v24;
            v45 = "Asset is deleted. Not indexing asset UUID: %{public}@ for %{public}@";
          }
          else
          {
            objc_msgSend(v21, "dateCreated");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
            {
              objc_msgSend(v21, "documentObservation");
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = *(void **)(v108 + 80);
              objc_msgSend(v21, "uuid");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v25;
              v10 = v108;
              objc_msgSend(v27, "objectForKeyedSubscript:", v26);
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = (void *)v28;
              v30 = (void *)MEMORY[0x1E0C9AA70];
              if (v28)
                v30 = (void *)v28;
              v31 = v30;

              +[PSIAssetTranslator psiAssetFromAsset:graphData:indexingContext:documentObservation:](PSIAssetTranslator, "psiAssetFromAsset:graphData:indexingContext:documentObservation:", v21, v31, v106, v24);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (v32)
                objc_msgSend(*(id *)(v108 + 88), "addObject:", v32);
              if (*(_BYTE *)(v108 + 152))
              {
                +[PLSpotlightDonationUtilities bundleIdentifierForAsset:](PLSpotlightDonationUtilities, "bundleIdentifierForAsset:", v21);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(*(_QWORD *)(v108 + 40) + 24), "libraryServicesManager");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                +[PLSpotlightAssetTranslator spotlightSearchableItemFromAsset:libraryIdentifier:graphData:indexingContext:documentObservation:](PLSpotlightAssetTranslator, "spotlightSearchableItemFromAsset:libraryIdentifier:graphData:indexingContext:documentObservation:", v21, objc_msgSend(v34, "wellKnownPhotoLibraryIdentifier"), v31, v106, v24);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

                v10 = v108;
                if (v35)
                {
                  v99 = v33;
                  PLSearchBackendIndexManagerGetLog();
                  v98 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v21, "uuid");
                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "uniqueIdentifier");
                    v36 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "attributeSet");
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "debugDescription");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v108 + 40), "photoLibraryTypeDescription");
                    v38 = objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v131 = v95;
                    v132 = 2114;
                    v133 = v33;
                    v134 = 2114;
                    v39 = (void *)v36;
                    v135 = v36;
                    v136 = 2112;
                    v137 = v37;
                    v138 = 2114;
                    v139 = v38;
                    v40 = (void *)v38;
                    _os_log_impl(&dword_199541000, v98, OS_LOG_TYPE_DEBUG, "Created CSSearchableItem for asset UUID: %{public}@, bundleIdentifier: %{public}@, searchableItem.uniqueIdentifier: %{public}@, attributes: %@ for %{public}@", buf, 0x34u);

                    v10 = v108;
                  }

                  v33 = v99;
                  (*(void (**)(void))(*(_QWORD *)(v10 + 136) + 16))();
                }

              }
              v16 = v107;
              objc_msgSend(v107, "refreshObject:mergeChanges:", v21, objc_msgSend(v21, "hasChanges"));

              v18 = v100;
              v14 = v101;
              goto LABEL_25;
            }
            PLSearchBackendIndexManagerGetLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
LABEL_24:
              v10 = v108;
              goto LABEL_25;
            }
            objc_msgSend(v21, "uuid");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = v108;
            objc_msgSend(*(id *)(v108 + 40), "photoLibraryTypeDescription");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v131 = v41;
            v132 = 2114;
            v133 = v43;
            v44 = v24;
            v45 = "Asset missing creation date. Not indexing asset UIUD: %{public}@ for %{public}@";
          }
          _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_INFO, v45, buf, 0x16u);

          v10 = v42;
          v16 = v107;
LABEL_25:

          objc_autoreleasePoolPop(v20);
          ++v19;
        }
        while (v18 != v19);
      }
    }
    else
    {
      v47 = v15;
      PLSearchBackendIndexManagerGetLog();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v131 = v49;
        v132 = 2112;
        v133 = v47;
        _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "Failed to fetch Assets while indexing batch for %{public}@. Error: %@", buf, 0x16u);

        v16 = (void *)v2;
      }

      v10 = a1;
    }

    v11 = v106;
    v46 = v97;
  }
  else
  {
    v46 = 0;
    v16 = (void *)v2;
  }
  if (objc_msgSend(*(id *)(v10 + 96), "count"))
  {
    v50 = (void *)objc_opt_class();
    v51 = *(_QWORD *)(v10 + 96);
    v126 = v46;
    objc_msgSend(v50, "fetchHighlightsWithUUIDs:managedObjectContext:error:", v51, v16, &v126);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v126;

    if (v52)
    {
      v104 = v53;
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v54 = v52;
      v55 = -[NSObject countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v122, v129, 16);
      if (v55)
      {
        v56 = v55;
        v102 = v52;
        v57 = *(_QWORD *)v123;
        do
        {
          for (i = 0; i != v56; ++i)
          {
            if (*(_QWORD *)v123 != v57)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
            if (objc_msgSend(v59, "isEligibleForSearchIndexing"))
            {
              +[PLSpotlightHighlightTranslator spotlightSearchableItemFromHighlight:](PLSpotlightHighlightTranslator, "spotlightSearchableItemFromHighlight:", v59);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (v60)
              {
                v61 = *(_QWORD *)(v108 + 136);
                +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                (*(void (**)(uint64_t, void *, void *))(v61 + 16))(v61, v60, v62);

                v16 = v107;
              }
              objc_msgSend(v16, "refreshObject:mergeChanges:", v59, objc_msgSend(v59, "hasChanges"));

            }
          }
          v56 = -[NSObject countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v122, v129, 16);
        }
        while (v56);
        v11 = v106;
        v52 = v102;
        v53 = v104;
      }
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v108 + 40), "photoLibraryTypeDescription");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v131 = v63;
        v132 = 2112;
        v133 = v53;
        _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_ERROR, "Failed to fetch Highlights while indexing a batch for %{public}@. Error: %@", buf, 0x16u);

        v16 = v107;
      }
    }

    v10 = v108;
  }
  else
  {
    v53 = v46;
  }
  if (objc_msgSend(*(id *)(v10 + 104), "count"))
  {
    v64 = (void *)objc_opt_class();
    v65 = *(_QWORD *)(v10 + 104);
    v121 = v53;
    objc_msgSend(v64, "fetchAlbumsWithUUIDs:managedObjectContext:error:", v65, v16, &v121);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v121;

    if (v66)
    {
      v120 = 0u;
      v118 = 0u;
      v119 = 0u;
      v117 = 0u;
      v68 = v66;
      v69 = -[NSObject countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
      if (v69)
      {
        v70 = v69;
        v103 = v66;
        v105 = v67;
        v71 = *(_QWORD *)v118;
        do
        {
          for (j = 0; j != v70; ++j)
          {
            if (*(_QWORD *)v118 != v71)
              objc_enumerationMutation(v68);
            v73 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * j);
            v74 = (void *)MEMORY[0x19AEC1554]();
            if (objc_msgSend(v73, "isEligibleForSearchIndexing"))
            {
              +[PSIAlbumTranslator psiCollectionFromAlbum:indexingContext:](PSIAlbumTranslator, "psiCollectionFromAlbum:indexingContext:", v73, v11);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if (v75)
                objc_msgSend(*(id *)(v10 + 112), "addObject:", v75);
              if (*(_BYTE *)(v10 + 152))
              {
                +[PLSpotlightAlbumTranslator spotlightSearchableItemFromAlbum:](PLSpotlightAlbumTranslator, "spotlightSearchableItemFromAlbum:", v73);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                if (v76)
                {
                  v77 = *(_QWORD *)(v108 + 136);
                  +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = *(void (**)(uint64_t, void *, void *))(v77 + 16);
                  v80 = v77;
                  v16 = v107;
                  v79(v80, v76, v78);

                  v11 = v106;
                }

                v10 = v108;
              }
              objc_msgSend(v16, "refreshObject:mergeChanges:", v73, objc_msgSend(v73, "hasChanges"));

            }
            objc_autoreleasePoolPop(v74);
          }
          v70 = -[NSObject countByEnumeratingWithState:objects:count:](v68, "countByEnumeratingWithState:objects:count:", &v117, v128, 16);
        }
        while (v70);
        v66 = v103;
        v67 = v105;
      }
    }
    else
    {
      PLSearchBackendIndexManagerGetLog();
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(v10 + 40), "photoLibraryTypeDescription");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v131 = v81;
        v132 = 2112;
        v133 = v67;
        _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_ERROR, "Failed to fetch Albums while indexing a batch for %{public}@. Error: %@", buf, 0x16u);

        v11 = v106;
      }
    }

  }
  else
  {
    v67 = v53;
  }
  v82 = PLIsFeaturedContentAllowed();
  if (objc_msgSend(*(id *)(v108 + 120), "count") && v82)
  {
    v83 = *(void **)(v108 + 40);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(v108 + 120));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = MEMORY[0x1E0C809B0];
    v109[1] = 3221225472;
    v109[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_237;
    v109[3] = &unk_1E3661B78;
    v110 = v106;
    v111 = *(id *)(v108 + 112);
    v116 = *(_BYTE *)(v108 + 152);
    v114 = *(id *)(v108 + 136);
    v85 = v16;
    v86 = *(_QWORD *)(v108 + 40);
    v112 = v85;
    v113 = v86;
    v115 = *(_QWORD *)(v108 + 144);
    v87 = v83;
    v11 = v106;
    objc_msgSend(v87, "_fetchMemoriesToIndexWithUUIDs:managedObjectContext:result:", v84, v85, v109);

    v88 = v110;
LABEL_81:

    v16 = v107;
    goto LABEL_82;
  }
  if (objc_msgSend(*(id *)(v108 + 128), "count"))
    v89 = v82;
  else
    v89 = 1;
  if ((v89 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(v108 + 128));
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = *(_QWORD *)(*(_QWORD *)(v108 + 144) + 8);
    v92 = *(void **)(v91 + 40);
    *(_QWORD *)(v91 + 40) = v90;

    PLSearchBackendIndexManagerGetLog();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      v93 = *(void **)(*(_QWORD *)(*(_QWORD *)(v108 + 144) + 8) + 40);
      objc_msgSend(*(id *)(v108 + 40), "photoLibraryTypeDescription");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v131 = v93;
      v132 = 2114;
      v133 = v94;
      _os_log_impl(&dword_199541000, v88, OS_LOG_TYPE_INFO, "Featured Content is disabled for %{public}@. Removing Memories from search index. Memory UUIDs: %{public}@", buf, 0x16u);

      v11 = v106;
    }
    goto LABEL_81;
  }
LABEL_82:
  objc_msgSend(v16, "refreshAllObjects");

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_241(uint64_t a1)
{
  NSObject *v2;
  CFAbsoluteTime v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int16 v21;
  uint8_t buf[4];
  CFAbsoluteTime v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349314;
    v23 = v3;
    v24 = 2114;
    v25 = v4;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_INFO, "PhotoLibrary performBlock for index batch took %{public}f seconds for %{public}@.", buf, 0x16u);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_242;
  v10[3] = &unk_1E3661C40;
  v5 = *(void **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 88);
  v12 = v6;
  v18 = v7;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 72);
  v9 = *(_QWORD *)(a1 + 104);
  v16 = v8;
  v19 = v9;
  v20 = *(_QWORD *)(a1 + 96);
  v21 = *(_WORD *)(a1 + 112);
  v17 = *(id *)(a1 + 80);
  objc_msgSend(v11, "_onQueueAsync:", v10);

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_242(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  id v24;
  void (**v25)(_QWORD);
  void *v26;
  void *v27;
  void (**v28)(_QWORD);
  void *v29;
  void *v30;
  void (**v31)(_QWORD);
  void *v32;
  void (**v33)(_QWORD);
  void *v34;
  _QWORD v35[4];
  void (**v36)(_QWORD);
  _QWORD *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  void (**v41)(_QWORD);
  _QWORD *v42;
  id v43;
  _QWORD v44[5];
  _QWORD v45[4];
  id v46;
  void (**v47)(_QWORD);
  _QWORD *v48;
  id v49;
  _QWORD v50[5];
  id v51;
  void (**v52)(_QWORD);
  _QWORD *v53;
  _QWORD v54[5];
  id v55;
  void (**v56)(_QWORD);
  _QWORD *v57;
  _QWORD v58[5];
  id v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[3];
  BOOL v68;
  _QWORD v69[3];
  BOOL v70;
  _QWORD v71[3];
  BOOL v72;
  _QWORD v73[3];
  BOOL v74;
  _QWORD v75[3];
  BOOL v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_assetUUIDsToRemoveFromUUIDsToProcess:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v2, "_collectionUUIDsToRemoveFromUUIDsToProcess:", *(_QWORD *)(v2 + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v76 = 0;
  v76 = objc_msgSend(*(id *)(a1 + 48), "count") == 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v74 = 0;
  v74 = objc_msgSend(*(id *)(a1 + 56), "count") == 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x2020000000;
  v72 = 0;
  v72 = objc_msgSend(v3, "count") == 0;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x2020000000;
  v70 = 0;
  v70 = objc_msgSend(v4, "count") == 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v68 = 0;
  v68 = objc_msgSend(*(id *)(a1 + 64), "count") == 0;
  v7 = MEMORY[0x1E0C809B0];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_2;
  v58[3] = &unk_1E3661BC8;
  v61 = v73;
  v62 = v71;
  v63 = v69;
  v64 = v67;
  v8 = *(_QWORD *)(a1 + 32);
  v60 = v75;
  v58[4] = v8;
  v9 = *(id *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 96);
  v59 = v9;
  v65 = v10;
  v66 = *(_QWORD *)(a1 + 104);
  v11 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v58);
  objc_msgSend(*(id *)(a1 + 32), "_inqEnsureSearchIndexExists");
  PLSearchBackendIndexManagerGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(*(id *)(a1 + 48), "count");
    v14 = objc_msgSend(v3, "count");
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349570;
    v78 = v13;
    v79 = 2050;
    v80 = v14;
    v81 = 2114;
    v82 = v15;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Search Index Updates: [PSIAsset] Adding %{public}ld, Removing %{public}ld for %{public}@", buf, 0x20u);

  }
  PLSearchBackendIndexManagerGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(*(id *)(a1 + 56), "count");
    v18 = objc_msgSend(v4, "count");
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134349570;
    v78 = v17;
    v79 = 2050;
    v80 = v18;
    v81 = 2114;
    v82 = v19;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Search Index Updates: [PSICollection] Adding %{public}ld, Removing %{public}ld for %{public}@", buf, 0x20u);

  }
  v11[2](v11);
  if (objc_msgSend(v4, "count"))
  {
    v54[0] = v7;
    v54[1] = 3221225472;
    v54[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_246;
    v54[3] = &unk_1E3668810;
    v54[4] = *(_QWORD *)(a1 + 32);
    v20 = v4;
    v55 = v20;
    v57 = v69;
    v56 = v11;
    v21 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v54);
    v22 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v22)
      objc_msgSend(v22, "removeCollectionsWithUUIDs:completion:", v20, v21);
    else
      v21[2](v21);
    if (*(_BYTE *)(a1 + 112))
    {
      objc_msgSend(*(id *)(a1 + 32), "spotlightDonationManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "deleteSearchableItemsWithIdentifiers:", v20);

    }
  }
  if (objc_msgSend(v3, "count"))
  {
    v50[0] = v7;
    v50[1] = 3221225472;
    v50[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_3;
    v50[3] = &unk_1E3668810;
    v50[4] = *(_QWORD *)(a1 + 32);
    v24 = v3;
    v51 = v24;
    v53 = v71;
    v52 = v11;
    v25 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v50);
    v26 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v26)
      objc_msgSend(v26, "removeAssetsWithUUIDs:completion:", v24, v25);
    else
      v25[2](v25);
    if (*(_BYTE *)(a1 + 112) && !*(_BYTE *)(a1 + 113))
    {
      objc_msgSend(*(id *)(a1 + 32), "spotlightDonationManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "deleteSearchableItemsWithIdentifiers:", v24);

    }
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v45[0] = v7;
    v45[1] = 3221225472;
    v45[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_5;
    v45[3] = &unk_1E3661BF0;
    objc_copyWeak(&v49, (id *)buf);
    v46 = *(id *)(a1 + 48);
    v48 = v75;
    v47 = v11;
    v28 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v45);
    v29 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v29)
      objc_msgSend(v29, "addAssets:withCompletion:", *(_QWORD *)(a1 + 48), v28);
    else
      v28[2](v28);
    if (*(_BYTE *)(a1 + 112))
    {
      v30 = *(void **)(a1 + 80);
      v44[0] = v7;
      v44[1] = 3221225472;
      v44[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_7;
      v44[3] = &unk_1E366B960;
      v44[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v30, "enumerateKeysAndObjectsUsingBlock:", v44);
    }

    objc_destroyWeak(&v49);
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_8;
    v39[3] = &unk_1E3661BF0;
    objc_copyWeak(&v43, (id *)buf);
    v40 = *(id *)(a1 + 56);
    v42 = v73;
    v41 = v11;
    v31 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v39);
    v32 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v32)
      objc_msgSend(v32, "addCollections:withCompletion:", *(_QWORD *)(a1 + 56), v31);
    else
      v31[2](v31);

    objc_destroyWeak(&v43);
  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_10;
    v35[3] = &unk_1E3661C18;
    objc_copyWeak(&v38, (id *)buf);
    v37 = v67;
    v36 = v11;
    v33 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v35);
    v34 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    if (v34)
      objc_msgSend(v34, "deleteGroupsWithGraphCollectionsForPersonUUIDs:withCompletion:", *(_QWORD *)(a1 + 64), v33);
    else
      v33[2](v33);

    objc_destroyWeak(&v38);
  }
  objc_destroyWeak((id *)buf);

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);
  _Block_object_dispose(v71, 8);
  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  void *v23;
  CFAbsoluteTime v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  CFAbsoluteTime v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 104));
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
    v37 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("insertAsset"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v39, "count");
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("removeAsset"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v38, "count");
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("insertAlbum"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v36, "count");
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("removeAlbum"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v34, "count");
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("insertMemory"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v3, "count");
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("removeMemory"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("insertHighlight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("removeHighlight"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("renamePerson"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("(%@) index progress -> assets[+%d -%d] albums[+%d -%d] [memories[+%d -%d]] highlights[+%d -%d] renamedPersons[+%d]"), CFSTR("iter"), v35, v33, v32, v31, v30, v5, v7, v9, objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    PLSearchBackendIndexManagerGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v42 != v17)
            objc_enumerationMutation(v13);
          v16 += objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "count");
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v55, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    v19 = *(id *)(a1 + 40);
    v20 = v19;
    v21 = *(_QWORD *)(a1 + 88);
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v21, "SearchIndexManager - IndexBatch", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_setIndexing:", 0);
    PLSearchBackendIndexManagerGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
      v25 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(v25 + 16), "libraryURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v46 = v23;
      v47 = 2050;
      v48 = v24;
      v49 = 2050;
      v50 = v16;
      v51 = 2050;
      v52 = v25;
      v53 = 2112;
      v54 = v26;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Indexing Batch: [END] for %{public}@. Took %{public}f seconds. %{public}ld items remaining for the Photos Search Index. Search Index Manager: %{public}p, PhotoLibrary path: %@", buf, 0x34u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_inqAfterIndexingDidIterate");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v27;
    if (v27)
    {
      (*(void (**)(uint64_t))(v27 + 16))(v27);
      objc_msgSend(*(id *)(a1 + 32), "_setInqAfterIndexingDidIterate:", 0);
    }
    else
    {
      v29 = *(_BYTE **)(a1 + 32);
      if (!v29[136])
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_245;
        v40[3] = &unk_1E3677AA0;
        v40[4] = v29;
        objc_msgSend(v29, "_onQueueAsync:", v40);
      }
    }

  }
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_246(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_2_247;
  v5[3] = &unk_1E3668810;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v8 = v4;
  objc_msgSend(v6, "_onQueueAsync:", v5);

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  id v6;
  id v7;
  __int128 v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_4;
  v5[3] = &unk_1E3668810;
  v2 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 32);
  v7 = v2;
  v4 = *(_OWORD *)(a1 + 48);
  v3 = (id)v4;
  v8 = v4;
  objc_msgSend(v6, "_onQueueAsync:", v5);

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  id v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_6;
  v6[3] = &unk_1E3661BF0;
  objc_copyWeak(&v9, v2);
  v7 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v8 = v5;
  objc_msgSend(WeakRetained, "_onQueueAsync:", v6);

  objc_destroyWeak(&v9);
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "spotlightDonationManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "donateSearchableItems:bundleIdentifier:", v5, v6);

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  id v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_9;
  v6[3] = &unk_1E3661BF0;
  objc_copyWeak(&v9, v2);
  v7 = *(id *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v8 = v5;
  objc_msgSend(WeakRetained, "_onQueueAsync:", v6);

  objc_destroyWeak(&v9);
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  id v3;
  __int128 v4;
  _QWORD v5[4];
  __int128 v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_11;
  v5[3] = &unk_1E36714A8;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(WeakRetained, "_onQueueAsync:", v5);

}

uint64_t __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_11(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_9(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "uuid", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(WeakRetained[15], "removeObjectsForKeys:", v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "uuid", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(WeakRetained[15], "removeObjectsForKeys:", v3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_4(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 120), "removeObjectsForKeys:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_2_247(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 120), "removeObjectsForKeys:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_245(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Process another batch for %{public}@. Resuming indexing if needed.", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_inqResumeIndexingIfNeeded");
}

void __50__PLSearchIndexManager__inqResumeIndexingIfNeeded__block_invoke_237(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void (*v21)(uint64_t, void *, void *);
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  NSObject *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v7;
    v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v10)
    {
      v11 = v10;
      v27 = v8;
      v28 = v9;
      v29 = v7;
      v12 = *(_QWORD *)v32;
      v13 = obj;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v13);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x19AEC1554]();
          if (objc_msgSend(v15, "isEligibleForSearchIndexing"))
          {
            +[PSIMemoryTranslator psiCollectionFromMemory:indexingContext:](PSIMemoryTranslator, "psiCollectionFromMemory:indexingContext:", v15, *(_QWORD *)(a1 + 32));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
            if (*(_BYTE *)(a1 + 80))
            {
              +[PLSpotlightMemoryTranslator spotlightSearchableItemFromMemory:](PLSpotlightMemoryTranslator, "spotlightSearchableItemFromMemory:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                v19 = *(_QWORD *)(a1 + 64);
                +[PLSpotlightDonationUtilities photosBundleIdentifier](PLSpotlightDonationUtilities, "photosBundleIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = *(void (**)(uint64_t, void *, void *))(v19 + 16);
                v22 = v19;
                v13 = obj;
                v21(v22, v18, v20);

              }
            }
            objc_msgSend(*(id *)(a1 + 48), "refreshObject:mergeChanges:", v15, objc_msgSend(v15, "hasChanges", v27, v28, v29));

          }
          objc_autoreleasePoolPop(v16);
        }
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v11);
      v9 = v28;
      v7 = v29;
      v8 = v27;
    }
  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    obj = v23;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 56), "photoLibraryTypeDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v36 = v24;
      v37 = 2112;
      v38 = v9;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to fetch Memories while indexing a batch for %{public}@. Error: %@", buf, 0x16u);

    }
  }

  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v8;

}

uint64_t __47__PLSearchIndexManager_resumeIndexingIfAllowed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqResumeIndexingIfNeeded");
}

void __69__PLSearchIndexManager__inqValidateSearchIndexWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) > 0xA)
      v5 = CFSTR("PLSearchIndexRebuildReasonNone");
    else
      v5 = off_1E3661D60[a2 - 1];
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v12 = v5;
    v13 = 2050;
    v14 = a2;
    v15 = 2114;
    v16 = v6;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Detected reason to reindex: %{public}@ (%{public}ld) for %{public}@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_inqSetIndexingPaused:reason:", 1, CFSTR("_PLSearchIndexPauseReasonInvalidSearchIndex"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__PLSearchIndexManager__inqValidateSearchIndexWithCompletionHandler___block_invoke_220;
  v8[3] = &unk_1E3675C58;
  v7 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v7;
  objc_msgSend(v9, "_inqResetSearchIndexWithReason:dropCompletion:", a2, v8);

}

void __69__PLSearchIndexManager__inqValidateSearchIndexWithCompletionHandler___block_invoke_220(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_inqSetIndexingPaused:reason:", 0, CFSTR("_PLSearchIndexPauseReasonInvalidSearchIndex"));
  objc_msgSend(*(id *)(a1 + 32), "unpauseIndexingWithReason:", CFSTR("PLSearchIndexPauseReasonCloseSearchIndex"));
  objc_msgSend(*(id *)(a1 + 32), "_inqPhotoLibrary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchIndexVersion:", 0);

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

void __45__PLSearchIndexManager__inqIndexPhotoLibrary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v4, "fetchAssetUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v5, "wellKnownPhotoLibraryIdentifier"), &v44);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v44;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    PLSearchBackendIndexManagerGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v11;
      v47 = 2112;
      v48 = v7;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch Assets for %{public}@. Error: %@", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "libraryServicesManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v7;
  objc_msgSend(v4, "fetchAlbumUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v12, "wellKnownPhotoLibraryIdentifier"), &v43);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v43;

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v13;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    PLSearchBackendIndexManagerGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v12;
      v47 = 2112;
      v48 = v14;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to fetch Albums for %{public}@ . Error: %@", buf, 0x16u);

    }
  }
  v18 = PLIsFeaturedContentAllowed();
  if (v18)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "libraryServicesManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v14;
    objc_msgSend(v4, "fetchMemoryUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v12, "wellKnownPhotoLibraryIdentifier"), &v42);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v42;

    v14 = v20;
  }
  else
  {
    v19 = 0;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v19);
  if (v18)
  {

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      goto LABEL_20;
    PLSearchBackendIndexManagerGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v22;
      v47 = 2112;
      v48 = v14;
      v23 = "Failed to fetch Memories for %{public}@. Error: %@";
      v24 = v21;
      v25 = OS_LOG_TYPE_ERROR;
      v26 = 22;
LABEL_18:
      _os_log_impl(&dword_199541000, v24, v25, v23, buf, v26);

    }
  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v22;
      v23 = "Featured Content is disabled for %{public}@. Not fetching Memories to index.";
      v24 = v21;
      v25 = OS_LOG_TYPE_INFO;
      v26 = 12;
      goto LABEL_18;
    }
  }

LABEL_20:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "libraryServicesManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v14;
  objc_msgSend(v4, "fetchHighlightUUIDsToPopulateSearchIndexWithManagedObjectContext:libraryIdentifier:error:", v3, objc_msgSend(v27, "wellKnownPhotoLibraryIdentifier"), &v41);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v41;

  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v28;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    PLSearchBackendIndexManagerGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v33;
      v47 = 2112;
      v48 = v29;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch Highlights for %{public}@. Error: %@", buf, 0x16u);

    }
  }
  v40 = v29;
  objc_msgSend(v4, "fetchMomentUUIDsToPopulateAssetSearchIndexWithManagedObjectContext:error:", v3, &v40);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v40;

  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v37 = *(void **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = v34;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    PLSearchBackendIndexManagerGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryTypeDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v39;
      v47 = 2112;
      v48 = v35;
      _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Failed to fetch Moments for %{public}@. Error: %@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v2);
}

void __45__PLSearchIndexManager__inqIndexPhotoLibrary__block_invoke_212(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_inqAddUpdatesWithUUIDs:forKey:", v6, v5);

}

void __54__PLSearchIndexManager__inqEnsureSearchProgressExists__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0C99E10];
  v6 = a3;
  v7 = a2;
  v8 = (id)objc_msgSend([v5 alloc], "initWithArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v7);
}

void __69__PLSearchIndexManager__inqUpdateUUIDsToProcessWithSpotlightProgress__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
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
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend(a1[4], "containsObject:", v11) & 1) == 0)
          objc_msgSend(a1[5], "addObject:", v11);
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    }
    while (v8);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        if ((objc_msgSend(a1[5], "containsObject:", v17, (_QWORD)v22) & 1) == 0)
          objc_msgSend(a1[4], "addObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
    }
    while (v14);
  }

  objc_msgSend(a1[6], "addObjectsFromArray:", v5);
  objc_msgSend(a1[6], "addObjectsFromArray:", v12);
  if (objc_msgSend(v5, "count") || objc_msgSend(v12, "count"))
  {
    PLSearchBackendIndexManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(v5, "count");
      v20 = objc_msgSend(v12, "count");
      objc_msgSend(a1[7], "photoLibraryTypeDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v31 = v19;
      v32 = 2050;
      v33 = v20;
      v34 = 2114;
      v35 = v21;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Added %{public}lu, Removed %{public}lud asset UUIDs to search index manager's UUIDsToProcess from Spotlight progress for %{public}@.", buf, 0x20u);

    }
  }

}

void __51__PLSearchIndexManager__inqEnsureSearchIndexExists__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "databaseConnectionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didCreateConnection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "databaseConnection"));

}

intptr_t __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLSearchBackendIndexManagerGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543618;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to drop the search index database for %{public}@. Error: %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_184(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "array");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

void __61__PLSearchIndexManager__inqCloseIndexIfAbleOrForce_isDelete___block_invoke_190(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "databaseConnectionDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "willTeardownConnection:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "databaseConnection"));

}

uint64_t __71__PLSearchIndexManager_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLSearchBackendIndexManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Spotlight operation count is 0. Scheduling search index close if needed for %{public}@.", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_inqScheduleCloseIndexIfNeeded");
}

uint64_t __54__PLSearchIndexManager__inqScheduleCloseIndexIfNeeded__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 137) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_inqCloseIndexIfAbleOrForce:isDelete:", 0, 0);
}

void __59__PLSearchIndexManager__assetUUIDsWithGraphDataInSpotlight__block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void __59__PLSearchIndexManager__assetUUIDsWithGraphDataInSpotlight__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    PLSearchBackendIndexManagerGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543618;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Spotlight query for Knowledge Graph data failed. Stale Knowledge Graph data may remain in the Spotlight index until the next Knowledge Graph rebuild for %{public}@. Error: %@", (uint8_t *)&v6, 0x16u);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __68__PLSearchIndexManager_applyGraphUpdates_supportingData_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PLZeroKeywordStore *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  PLSearchMetadataStore *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_inqEnsureSearchProgressExists");
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("zeroKeywords"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (!v3)
    {
      v4 = [PLZeroKeywordStore alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "searchIndexZeroKeywordStoreFilePath");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PLZeroKeywordStore initWithPath:](v4, "initWithPath:", v5);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    }
    objc_msgSend(v3, "updateZeroKeywordsTo:", v2);
  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v10;
      v55 = 2112;
      v56 = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to get ZeroKeywords from Knowledge Graph update for %{public}@. Error: %@", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("searchMetadata"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    if (!v12)
    {
      v13 = [PLSearchMetadataStore alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "searchIndexMetadataStoreFilePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[PLSearchMetadataStore initWithPath:](v13, "initWithPath:", v14);
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 48);
      *(_QWORD *)(v16 + 48) = v15;

      v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    }
    objc_msgSend(v12, "updateSearchMetadataTo:", v11);
  }
  else
  {
    PLSearchBackendIndexManagerGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v54 = v19;
      v55 = 2112;
      v56 = 0;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to get Search Metadata from Knowledge Graph update for %{public}@. Error: %@", buf, 0x16u);

    }
  }
  if (_os_feature_enabled_impl())
  {
    PLSearchBackendIndexManagerGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "Ignoring applyGraphUpdates call from photoanalysisd, %{public}@", buf, 0xCu);

    }
  }
  else
  {
    v52 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_inqPhotoLibrary");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("synonymsByIndexCategoryMask"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addEntriesFromDictionary:");
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("isGraphRebuild"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    if (v23)
    {
      PLSearchBackendIndexManagerGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v25;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Applying Knowledge Graph updates for Knowledge Graph rebuild for %{public}@.", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "_inqEnsureSearchIndexExists");
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 140) = 1;
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addIndex:", 1700);
      objc_msgSend(v26, "addIndex:", 1701);
      objc_msgSend(v26, "addIndex:", 1800);
      objc_msgSend(v26, "addIndex:", 1802);
      objc_msgSend(v26, "addIndex:", 1801);
      objc_msgSend(v26, "addIndex:", 1103);
      objc_msgSend(v26, "addIndex:", 1310);
      objc_msgSend(v26, "addIndex:", 1600);
      objc_msgSend(v26, "addIndex:", 1610);
      objc_msgSend(v26, "addIndex:", 1001);
      objc_msgSend(v26, "addIndex:", 1000);
      objc_msgSend(v26, "addIndex:", 1300);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject libraryServicesManager](v20, "libraryServicesManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "wellKnownPhotoLibraryIdentifier");

      v30 = *(id **)(a1 + 32);
      if (v29 == 3)
      {
        objc_msgSend(v30, "_assetUUIDsWithGraphDataInSpotlight");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = CFSTR("insertAsset");
      }
      else
      {
        objc_msgSend(v30[4], "allAssetUUIDsForGroupsWithCategories:", v26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, CFSTR("insertAsset"));

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allCollectionUUIDsWithCollectionType:", 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = CFSTR("removeHighlight");
      }
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, v32);

      PLSearchBackendIndexManagerGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v54 = v35;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "Applying Knowledge Graph updates: dropGraphDataUpdates for %{public}@.", buf, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "applyUpdates:completion:", v27, 0);

    }
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("assetSearchKeywordsKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("searchableAssetAssetUUIDsBySocialGroupKey"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSearchIndexManager _keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:andAssetUUIDsBySocialGroup:photoLibrary:](PLSearchIndexManager, "_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:andAssetUUIDsBySocialGroup:photoLibrary:", v36, v37, v20);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addEntriesFromDictionary:", v38);
    v39 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    v40 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v38, "allKeys");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "arrayWithArray:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", CFSTR("insertAsset"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObjectsFromArray:", v43);

    objc_msgSend(v39, "setObject:forKeyedSubscript:", v42, CFSTR("insertAsset"));
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("graphDataByUUID"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "addEntriesFromDictionary:", v44);
    PLSearchBackendIndexManagerGetLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
      v50 = v37;
      v46 = v36;
      v47 = v20;
      v48 = v11;
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v49;
      _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_DEFAULT, "Applying Knowledge Graph updates to the search index for %{public}@.", buf, 0xCu);

      v11 = v48;
      v20 = v47;
      v36 = v46;
      v37 = v50;
    }

    objc_msgSend(*(id *)(a1 + 32), "applyUpdates:completion:", v39, *(_QWORD *)(a1 + 56));
    v2 = v52;
  }

}

uint64_t __48__PLSearchIndexManager_applyUpdates_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_inqStartTrackingUpdateIfAble");
  objc_msgSend(*(id *)(a1 + 32), "_inqEnsurePhotoLibraryExists");
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[3])
  {
    objc_msgSend(v2, "_updatesEnsuringMutableArraysFromUpdates:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_updatesAfterConvertingPersonsToAssetsInUpdates:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_updatesAfterConvertingDetectedFacesToAssetsInUpdates:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_inqEnsureSearchProgressExists");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__PLSearchIndexManager_applyUpdates_completion___block_invoke_2;
    v10[3] = &unk_1E36732A0;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
    (*(void (**)(void))(v6 + 16))();
  PLSearchBackendIndexManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "-[PLSearchIndexManager applyUpdates:completion:] called. Scheduling search index close if needed for %{public}@.", buf, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_inqScheduleCloseIndexIfNeeded");
}

void __48__PLSearchIndexManager_applyUpdates_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLSearchBackendIndexManagerGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Applying search index updates for key: %{public}@ for %{public}@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_inqAddUpdatesWithUUIDs:forKey:", v6, v5);

}

void __65__PLSearchIndexManager__updatesEnsuringMutableArraysFromUpdates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v5);

}

void __78__PLSearchIndexManager__updatesAfterConvertingDetectedFacesToAssetsInUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__PLSearchIndexManager__updatesAfterConvertingDetectedFacesToAssetsInUpdates___block_invoke_2;
  v4[3] = &unk_1E3661A60;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  +[PLPerson enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:managedObjectContext:assetUUIDHandler:](PLPerson, "enumerateAssetUUIDsForSearchIndexingWithDetectedFaceUUIDs:managedObjectContext:assetUUIDHandler:", v3, v2, v4);

}

uint64_t __78__PLSearchIndexManager__updatesAfterConvertingDetectedFacesToAssetsInUpdates___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

void __72__PLSearchIndexManager__updatesAfterConvertingPersonsToAssetsInUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id obj;
  _QWORD v11[4];
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "libraryServicesManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "wellKnownPhotoLibraryIdentifier");
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __72__PLSearchIndexManager__updatesAfterConvertingPersonsToAssetsInUpdates___block_invoke_2;
        v11[3] = &unk_1E3661A38;
        v12 = *(id *)(a1 + 48);
        +[PLPerson enumerateAssetUUIDsForSearchIndexingWithPersonUUID:managedObjectContext:libraryIdentifier:assetUUIDHandler:](PLPerson, "enumerateAssetUUIDsForSearchIndexingWithPersonUUID:managedObjectContext:libraryIdentifier:assetUUIDHandler:", v7, v2, v9, v11);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

uint64_t __72__PLSearchIndexManager__updatesAfterConvertingPersonsToAssetsInUpdates___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __66__PLSearchIndexManager_resetSearchIndexWithReason_dropCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqResetSearchIndexWithReason:dropCompletion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __70__PLSearchIndexManager__inqResetSearchIndexWithReason_dropCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "unpauseIndexingWithReason:", CFSTR("PLSearchIndexPauseReasonCloseSearchIndex"));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__PLSearchIndexManager_dropSearchIndexWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqCloseSearchIndexAndDelete:withCompletion:", 1, *(_QWORD *)(a1 + 40));
}

void __34__PLSearchIndexManager_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 176) = 1;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "allObjects", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        dispatch_block_cancel(*(dispatch_block_t *)(*((_QWORD *)&v6 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __34__PLSearchIndexManager_invalidate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_inqCloseSearchIndexAndDelete:withCompletion:", 0, *(_QWORD *)(a1 + 40));
}

void __69__PLSearchIndexManager_ensureSearchIndexExistsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__PLSearchIndexManager_ensureSearchIndexExistsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E36619F0;
  objc_copyWeak(&v6, &location);
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_inqValidateSearchIndexWithCompletionHandler:", v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __69__PLSearchIndexManager_ensureSearchIndexExistsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_inqEnsureSearchIndexExists");

  PLSearchBackendIndexManagerGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "-ensureSearchIndexExistsWithCompletionHandler called. Schedule index close if needed for %{public}@.", (uint8_t *)&v8, 0xCu);

  }
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "_inqScheduleCloseIndexIfNeeded");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __69__PLSearchIndexManager__inqCloseSearchIndexAndDelete_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_inqCloseIndexIfAbleOrForce:isDelete:", 1, *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

__CFString *__69__PLSearchIndexManager__inqCloseSearchIndexAndDelete_withCompletion___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
    return CFSTR("Closed");
  else
    return (__CFString *)0;
}

uint64_t __40__PLSearchIndexManager_isIndexingPaused__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_inqIsIndexingPaused");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __64__PLSearchIndexManager_enqueuedUUIDsCountWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t result;
  double v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_inqEnqueuedUUIDsCountForceLoad:", 1);
  PLSearchBackendIndexManagerGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibraryTypeDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "-enqueuedUUIDsCountWithCompletionHandler called. Scheduling search index close if needed for %{public}@.", (uint8_t *)&v6, 0xCu);

  }
  result = objc_msgSend(*(id *)(a1 + 32), "_inqScheduleCloseIndexIfNeeded");
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "timeIntervalSinceNow");
    return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))((0.0 - v5) / 60.0);
  }
  return result;
}

__CFString *__55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
    return CFSTR("Closed");
  else
    return (__CFString *)0;
}

void __55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  PLResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v4, v5, v6, v7);

}

__CFString *__55__PLSearchIndexManager__onQueueAsyncWithDelay_perform___block_invoke_3(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
    return CFSTR("Closed");
  else
    return (__CFString *)0;
}

__CFString *__37__PLSearchIndexManager__onQueueSync___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 176))
    return CFSTR("Closed");
  else
    return (__CFString *)0;
}

+ (BOOL)_isIndexingAllowedByDAS
{
  void *v2;
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 buf;
  uint64_t v18;
  void *v19;
  uint64_t *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2050000000;
  v2 = (void *)get_DASSystemContextClass_softClass;
  v16 = get_DASSystemContextClass_softClass;
  if (!get_DASSystemContextClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v18 = (uint64_t)__get_DASSystemContextClass_block_invoke;
    v19 = &unk_1E3677580;
    v20 = &v13;
    __get_DASSystemContextClass_block_invoke((uint64_t)&buf);
    v2 = (void *)v14[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v13, 8);
  objc_msgSend(v3, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v18 = 0x2020000000;
  v5 = (_QWORD *)get_DASSchedulingPriorityBackgroundSymbolLoc_ptr;
  v19 = (void *)get_DASSchedulingPriorityBackgroundSymbolLoc_ptr;
  if (!get_DASSchedulingPriorityBackgroundSymbolLoc_ptr)
  {
    v6 = DuetActivitySchedulerLibrary();
    v5 = dlsym(v6, "_DASSchedulingPriorityBackground");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v5;
    get_DASSchedulingPriorityBackgroundSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&buf, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_DASSchedulingPriority get_DASSchedulingPriorityBackground(void)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PLSearchIndexManager.m"), 89, CFSTR("%s"), dlerror());

    __break(1u);
  }
  v7 = objc_msgSend(v4, "allowsDiscretionaryWorkForTask:withPriority:withParameters:", CFSTR("com.apple.assetsd.search"), *v5, 0);

  PLSearchBackendIndexManagerGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR(" not");
    if (v7)
      v9 = &stru_1E36789C0;
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "DAS is%@ allowing indexing to continue.", (uint8_t *)&buf, 0xCu);
  }

  return v7;
}

+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:(id)a3 andAssetUUIDsBySocialGroup:(id)a4 photoLibrary:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v8 = a4;
  objc_msgSend(a1, "_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:photoLibrary:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "count"))
  {
    v13 = v9;
LABEL_6:
    v12 = v13;
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v13 = v10;
    goto LABEL_6;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __122__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_andAssetUUIDsBySocialGroup_photoLibrary___block_invoke;
  v15[3] = &unk_1E366F438;
  v11 = v9;
  v16 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v11;

LABEL_7:
  return v12;
}

+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke;
  v14[3] = &unk_1E3677530;
  v15 = v6;
  v16 = v5;
  v8 = v7;
  v17 = v8;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v10, "performBlockAndWait:", v14);
  v11 = v17;
  v12 = v8;

  return v12;
}

+ (id)_keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __86__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup___block_invoke;
  v8[3] = &unk_1E3661CB8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __86__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetUUIDsBySocialGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E375D758);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, &unk_1E375D758);
        }
        objc_msgSend(v13, "addObject:", v5);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

void __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke_2;
  v5[3] = &unk_1E3661C90;
  v6 = v2;
  v3 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v4 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C97B48];
  v7 = a2;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setResultType:", 2);
  objc_msgSend(v9, "setPropertiesToFetch:", &unk_1E37632A8);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("moment.uuid = %@"), v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v12);

  v13 = *(void **)(a1 + 32);
  v19 = 0;
  objc_msgSend(v13, "executeFetchRequest:error:", v9, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke_3;
    v16[3] = &unk_1E3661C68;
    v17 = v14;
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v16);

  }
}

void __95__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_photoLibrary___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v19 = a3;
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v5;
  objc_msgSend(v5, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("dateCreated"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 && objc_msgSend(v13, "compare:", v6) != -1)
        {
          if (objc_msgSend(v14, "compare:", v20) == 1)
          {

            goto LABEL_17;
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("uuid"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = v16;
            objc_msgSend(v16, "addEntriesFromDictionary:", v19);
          }
          else
          {
            v17 = (void *)objc_msgSend(v19, "mutableCopy");
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v17, v15);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_17:

}

void __122__PLSearchIndexManager__keywordsByCategoryMaskByAssetUUIDFromAssetSearchKeywords_andAssetUUIDsBySocialGroup_photoLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addEntriesFromDictionary:", v5);
  }
  else
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
  }

}

+ (id)fetchAssetsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C97B48];
  v9 = a4;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setIncludesPendingChanges:", 0);
  objc_msgSend(v11, "setRelationshipKeyPathsForPrefetching:", &unk_1E3763980);
  if ((unint64_t)objc_msgSend(v7, "count") >= 0x65)
    objc_msgSend(v11, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "setFetchLimit:", objc_msgSend(v7, "count"));
  objc_msgSend(v9, "executeFetchRequest:error:", v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fetchAlbumsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C97B48];
  v9 = a4;
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPropertiesToFetch:", &unk_1E3763998);
  objc_msgSend(v11, "setIncludesPendingChanges:", 0);
  if ((unint64_t)objc_msgSend(v7, "count") >= 0x65)
    objc_msgSend(v11, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "setFetchLimit:", objc_msgSend(v7, "count"));
  objc_msgSend(v9, "executeFetchRequest:error:", v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fetchMemoriesWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C97B48];
  v9 = a4;
  +[PLMemory entityName](PLMemory, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPropertiesToFetch:", &unk_1E37639B0);
  objc_msgSend(v11, "setIncludesPendingChanges:", 0);
  if ((unint64_t)objc_msgSend(v7, "count") >= 0x65)
    objc_msgSend(v11, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "setFetchLimit:", objc_msgSend(v7, "count"));
  objc_msgSend(v9, "executeFetchRequest:error:", v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)fetchHighlightsWithUUIDs:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  +[PLPhotosHighlight fetchRequest](PLPhotosHighlight, "fetchRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = CFSTR("uuid");
  v14[1] = CFSTR("title");
  v14[2] = CFSTR("keyAssetPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPropertiesToFetch:", v10);

  objc_msgSend(v9, "setIncludesPendingChanges:", 0);
  if ((unint64_t)objc_msgSend(v7, "count") >= 0x65)
    objc_msgSend(v9, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);

  objc_msgSend(v9, "setFetchLimit:", objc_msgSend(v7, "count"));
  objc_msgSend(v8, "executeFetchRequest:error:", v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)fetchAssetUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultType:", 2);
  v16[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v11);

  +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  objc_msgSend(v8, "executeFetchRequest:error:", v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "valueForKey:", CFSTR("uuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)fetchAlbumUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a3;
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultType:", 2);
  v16[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v11);

  +[PLGenericAlbum isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLGenericAlbum, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  objc_msgSend(v8, "executeFetchRequest:error:", v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "valueForKey:", CFSTR("uuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)fetchMemoryUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a3;
  +[PLMemory entityName](PLMemory, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResultType:", 2);
  v16[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v11);

  +[PLMemory isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLMemory, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  objc_msgSend(v8, "executeFetchRequest:error:", v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "valueForKey:", CFSTR("uuid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)fetchHighlightUUIDsToPopulateSearchIndexWithManagedObjectContext:(id)a3 libraryIdentifier:(int64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[PLPhotosHighlight fetchRequest](PLPhotosHighlight, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setResultType:", 2);
  v14[0] = CFSTR("uuid");
  v14[1] = CFSTR("title");
  v14[2] = CFSTR("keyAssetPrivate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPropertiesToFetch:", v9);

  +[PLPhotosHighlight isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLPhotosHighlight, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v10);

  objc_msgSend(v7, "executeFetchRequest:error:", v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueForKey:", CFSTR("uuid"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)fetchMomentUUIDsToPopulateAssetSearchIndexWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PLMoment fetchRequest](PLMoment, "fetchRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setResultType:", 2);
  v11[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPropertiesToFetch:", v7);

  objc_msgSend(v5, "executeFetchRequest:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "valueForKey:", CFSTR("uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
