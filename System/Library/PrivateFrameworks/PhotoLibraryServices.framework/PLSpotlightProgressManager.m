@implementation PLSpotlightProgressManager

+ (BOOL)shouldReindexSpotlightIndexForPhotoLibraryPathManager:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  BOOL v24;
  void *v26;
  uint8_t buf[16];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v6 = a1;
  objc_sync_enter(v6);
  if (objc_msgSend(v5, "isSystemPhotoLibraryPathManager"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryForKey:", CFSTR("search.coreSpotlight.universalSearchEligibility"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.needsSpotlightIndexRebuild"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v10, "BOOLValue");

    if ((_DWORD)v8)
    {
      PLSearchBackendDonationsGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Detected request to rebuild the search index due to prior universal search eligibility change", buf, 2u);
      }

      +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("search.coreSpotlight.needsReindexing"));
      v14 = (void *)objc_msgSend(v13, "copy");
      v15 = objc_msgSend(v6, "_writeProgressToDisk:forPhotoLibraryPathManager:", v14, v5);

      if (v15)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("search.coreSpotlight.needsSpotlightIndexRebuild"));
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("search.coreSpotlight.universalSearchEligibility"));

      }
    }

  }
  +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.needsReindexing"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "BOOLValue");

  if ((v20 & 1) != 0)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.reindexFailureCount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");

    if (v22)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.reindexRetryDate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = +[PLSpotlightProgressManager _shouldRetryReindexWithScheduledDateOf:](PLSpotlightProgressManager, "_shouldRetryReindexWithScheduledDateOf:", v23);

    }
    else
    {
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }

  objc_sync_exit(v6);
  return v24;
}

+ (id)_readProgressFromDiskForPhotoLibraryPathManager:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "searchIndexSpotlightProgressFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    PLSearchBackendDonationsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "No prior Spotlight progress plist found at path: \"%@\", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_9;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v3);
  if (!v6)
  {
    PLSearchBackendDonationsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v3;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to read Spotlight Progress at path: \"%@\", (uint8_t *)&v11, 0xCu);
    }

    v7 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v7 = v6;
  v8 = v7;
LABEL_10:

  return v8;
}

+ (BOOL)spotlightOperationCompletedForOperationType:(unint64_t)a3 withSearchableIdentifiers:(id)a4 forPhotoLibraryPathManager:(id)a5 success:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;

  v6 = a6;
  v11 = a4;
  v12 = a5;
  if (a3)
  {
    if (v11)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItemIdentifiers"));

    if (v12)
      goto LABEL_4;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operationType != PLSpotlightOperationTypeUndefined"));

  if (!v11)
    goto LABEL_17;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

LABEL_4:
  v13 = a1;
  objc_sync_enter(v13);
  if (v6)
  {
    +[PLSpotlightProgressManager _updateFailureCountsForSearchableItemIdentifiers:shouldIncrementCounts:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "_updateFailureCountsForSearchableItemIdentifiers:shouldIncrementCounts:forPhotoLibraryPathManager:", v11, 0, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = v18;

    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, CFSTR("search.coreSpotlight.itemFailureCounts"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E375D938, CFSTR("search.coreSpotlight.requestFailureCount"));
    if (a3 == 2)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("search.corespotlight.lastDeletionDate"));
    }
    else
    {
      if (a3 != 1)
      {
LABEL_14:
        v22 = (void *)objc_msgSend(v20, "copy");
        v19 = +[PLSpotlightProgressManager _writeProgressToDisk:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "_writeProgressToDisk:forPhotoLibraryPathManager:", v22, v12);

        goto LABEL_15;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("search.corespotlight.lastDonationDate"));
    }

    goto LABEL_14;
  }
  v19 = +[PLSpotlightProgressManager _addSearchableItemIdentifiers:operationType:forPhotoLibraryPathManager:isRetry:](PLSpotlightProgressManager, "_addSearchableItemIdentifiers:operationType:forPhotoLibraryPathManager:isRetry:", v11, a3, v12, 1);
LABEL_15:
  objc_sync_exit(v13);

  return v19;
}

+ (BOOL)addSearchableItemIdentifiers:(id)a3 forOperationType:(unint64_t)a4 forPhotoLibraryPathManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a5;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operationType != PLSpotlightOperationTypeUndefined"));

    if (v10)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItemIdentifiers"));

  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!v10)
    goto LABEL_7;
LABEL_4:
  v11 = a1;
  objc_sync_enter(v11);
  v12 = +[PLSpotlightProgressManager _addSearchableItemIdentifiers:operationType:forPhotoLibraryPathManager:isRetry:](PLSpotlightProgressManager, "_addSearchableItemIdentifiers:operationType:forPhotoLibraryPathManager:isRetry:", v9, a4, v10, 0);
  objc_sync_exit(v11);

  return v12;
}

+ (BOOL)removeSearchableItemIdentifiers:(id)a3 forPhotoLibraryPathManager:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItemIdentifiers"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

LABEL_3:
  v10 = a1;
  objc_sync_enter(v10);
  if (objc_msgSend(v7, "count"))
  {
    +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.itemsToDonate"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = (void *)MEMORY[0x1E0C9AA60];
      if (v12)
        v15 = (void *)v12;
      else
        v15 = (void *)MEMORY[0x1E0C9AA60];
      v16 = v15;

      v31 = v16;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "minusSet:", v32);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.itemsToDelete"));
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v18)
        v20 = (void *)v18;
      else
        v20 = v14;
      v21 = v20;

      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "minusSet:", v32);
      v23 = (void *)objc_msgSend(v11, "mutableCopy");
      objc_msgSend(v17, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("search.coreSpotlight.itemsToDonate"));

      objc_msgSend(v22, "allObjects");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("search.coreSpotlight.itemsToDelete"));

      v26 = (void *)objc_msgSend(v23, "copy");
      v27 = +[PLSpotlightProgressManager _writeProgressToDisk:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "_writeProgressToDisk:forPhotoLibraryPathManager:", v26, v9);

    }
    else
    {
      v27 = 1;
    }

  }
  else
  {
    v27 = 1;
  }
  objc_sync_exit(v10);

  return v27;
}

+ (BOOL)spotlightResetOperationCompletedForPhotoLibraryPathManager:(id)a3 success:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v20;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v8 = a1;
  objc_sync_enter(v8);
  +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.reindexFailureCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntegerValue");

  if (!v4)
  {
    +[PLSpotlightProgressManager _minimumScheduledDateForNextReindexRetry](PLSpotlightProgressManager, "_minimumScheduledDateForNextReindexRetry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 + 1;
    if (v9)
      goto LABEL_5;
LABEL_7:
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    goto LABEL_8;
  }
  v12 = 0;
  v13 = 0;
  if (!v9)
    goto LABEL_7;
LABEL_5:
  v14 = (id)objc_msgSend(v9, "mutableCopy");
LABEL_8:
  v15 = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("search.coreSpotlight.reindexFailureCount"));

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("search.coreSpotlight.reindexRetryDate"));
  v17 = (void *)objc_msgSend(v15, "copy");
  LOBYTE(v16) = +[PLSpotlightProgressManager _writeProgressToDisk:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "_writeProgressToDisk:forPhotoLibraryPathManager:", v17, v7);

  v18 = v16 & +[PLSpotlightProgressManager setSpotlightIndexNeedsReindexing:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "setSpotlightIndexNeedsReindexing:forPhotoLibraryPathManager:", !v4, v7);
  objc_sync_exit(v8);

  return v18;
}

+ (BOOL)setSpotlightIndexNeedsReindexing:(BOOL)a3 forPhotoLibraryPathManager:(id)a4
{
  _BOOL8 v4;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v8 = a1;
  objc_sync_enter(v8);
  +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = (id)objc_msgSend(v9, "mutableCopy");
  else
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v11;
  if (v4)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("search.coreSpotlight.itemsToDonate"));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, CFSTR("search.coreSpotlight.itemsToDelete"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("search.coreSpotlight.needsReindexing"));

  v14 = (void *)objc_msgSend(v12, "copy");
  LOBYTE(v13) = +[PLSpotlightProgressManager _writeProgressToDisk:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "_writeProgressToDisk:forPhotoLibraryPathManager:", v14, v7);

  objc_sync_exit(v8);
  return (char)v13;
}

+ (BOOL)shouldPerformSpotlightOperationOfType:(unint64_t)a3 withSearchableItemIdentifiers:(id)a4 photoLibraryPathManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    if (a3)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("operationType != PLSpotlightOperationTypeUndefined"));

    if (v10)
      goto LABEL_4;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 234, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItemIdentifiers"));

  if (!a3)
    goto LABEL_13;
LABEL_3:
  if (v10)
    goto LABEL_4;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

LABEL_4:
  v11 = a1;
  objc_sync_enter(v11);
  v12 = objc_msgSend(v11, "shouldPerformSpotlightOperationsWithPhotoLibraryPathManager:", v10);
  if ((v12 & 1) == 0)
  {
    +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.needsReindexing"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    if ((v15 & 1) == 0
      && !+[PLSpotlightProgressManager _addSearchableItemIdentifiers:operationType:forPhotoLibraryPathManager:isRetry:](PLSpotlightProgressManager, "_addSearchableItemIdentifiers:operationType:forPhotoLibraryPathManager:isRetry:", v9, a3, v10, 0))
    {
      PLSearchBackendDonationsGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        v22 = objc_msgSend(v9, "count");
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to record %{public}lu searchable identifiers on disk for deferred retry. Photos and Spotlight indexes have diverged.", buf, 0xCu);
      }

    }
  }
  objc_sync_exit(v11);

  return v12;
}

+ (BOOL)shouldPerformSpotlightOperationsWithPhotoLibraryPathManager:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v16;
  uint8_t buf[4];
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 261, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v6 = a1;
  objc_sync_enter(v6);
  +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.needsReindexing"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if (v9)
  {
    PLSearchBackendDonationsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Spotlight index needs to be re-indexed. Aborting request to donate/delete content.", buf, 2u);
    }
    v11 = 0;
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.requestFailureCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntegerValue");

  if (v13 >= 5)
  {
    PLSearchBackendDonationsGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v18 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Donations paused due to multiple (%{public}lu) consecutive failures. Evaluating whether or not to proceed based on when the most recent attempt occurred...", buf, 0xCu);
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.requestRetryDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = +[PLSpotlightProgressManager _shouldRetryRequestWithMostRecentAttemptOf:](PLSpotlightProgressManager, "_shouldRetryRequestWithMostRecentAttemptOf:", v10);
    goto LABEL_12;
  }
  v11 = 1;
LABEL_13:

  objc_sync_exit(v6);
  return v11;
}

+ (BOOL)deleteSpotlightProgressForPhotoLibraryPathManager:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v18;
  id v19;
  uint8_t buf[4];
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v6 = a1;
  objc_sync_enter(v6);
  objc_msgSend(v5, "searchIndexSpotlightProgressFilePath");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if ((v9 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v11 = objc_msgSend(v10, "removeItemAtPath:error:", v7, &v19);
    v12 = v19;

    if (v11)
    {
      PLSearchBackendDonationsGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v7;
        v14 = "Successfully deleted Spotlight progress plist at path: \"%@\". Nothing to delete";
        v15 = v13;
        v16 = OS_LOG_TYPE_DEFAULT;
LABEL_12:
        _os_log_impl(&dword_199541000, v15, v16, v14, buf, 0xCu);
      }
    }
    else
    {
      PLSearchBackendDonationsGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v12;
        v14 = "Failed to delete Spotlight progress plist from disk. Error: %@";
        v15 = v13;
        v16 = OS_LOG_TYPE_ERROR;
        goto LABEL_12;
      }
    }

    goto LABEL_14;
  }
  PLSearchBackendDonationsGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "No prior Spotlight progress plist found at path. Nothing to delete: \"%@\", buf, 0xCu);
  }
  LOBYTE(v11) = 1;
LABEL_14:

  objc_sync_exit(v6);
  return v11;
}

+ (void)spotlightProgressForPhotoLibraryPathManager:(id)a3 completion:(id)a4
{
  void (**v7)(id, id, id);
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v7 = (void (**)(id, id, id))a4;
  if (v21)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSpotlightProgressManager.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v8 = a1;
  objc_sync_enter(v8);
  +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.itemsToDonate"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v13 = (void *)v10;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.itemsToDelete"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v12;
  v18 = v17;

  v7[2](v7, v14, v18);
  objc_sync_exit(v8);

}

+ (BOOL)universalSearchEligibilityDidChangeForSPLWithDatabaseUUID:(id)a3 currentSPLPath:(id)a4 currentEligibility:(BOOL)a5
{
  return 0;
}

+ (BOOL)shouldRetrySpotlightIndexDropForUniversalSearchEligibilityChange
{
  return 0;
}

+ (BOOL)didPreviouslySetSpotlightNeedsIndexRebuild
{
  return 0;
}

+ (id)lastKnownSystemPhotoLibraryPath
{
  return 0;
}

+ (BOOL)_addSearchableItemIdentifiers:(id)a3 operationType:(unint64_t)a4 forPhotoLibraryPathManager:(id)a5 isRetry:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  __objc2_class **v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __objc2_class *v37;
  void *v38;
  void *v39;
  unint64_t v41;
  void *v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v6 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v11 = off_1E365A000;
    if (+[PLSpotlightProgressManager removeSearchableItemIdentifiers:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "removeSearchableItemIdentifiers:forPhotoLibraryPathManager:", v9, v10))
    {
      +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        v14 = (id)objc_msgSend(v12, "mutableCopy");
      else
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v16 = v14;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
      v18 = v17;
      v44 = v13;
      if (v6)
      {
        v41 = a4;
        v43 = v10;
        +[PLSpotlightProgressManager _updateFailureCountsForSearchableItemIdentifiers:shouldIncrementCounts:forPhotoLibraryPathManager:](PLSpotlightProgressManager, "_updateFailureCountsForSearchableItemIdentifiers:shouldIncrementCounts:forPhotoLibraryPathManager:", v9, 1, v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v16;
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("search.coreSpotlight.itemFailureCounts"));
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v20 = v9;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v46 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v19, "objectForKeyedSubscript:", v25);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "unsignedIntegerValue");

              if (v27 <= 4)
                objc_msgSend(v18, "addObject:", v25);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v22);
        }

        v16 = v42;
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.requestFailureCount"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v29 + 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v30, CFSTR("search.coreSpotlight.requestFailureCount"));

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v31, CFSTR("search.coreSpotlight.requestRetryDate"));

        v10 = v43;
        v11 = off_1E365A000;
        a4 = v41;
      }
      else
      {
        objc_msgSend(v17, "addObjectsFromArray:", v9);
      }
      -[__objc2_class _storageKeyForOperationType:](v11[398], "_storageKeyForOperationType:", a4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
      }
      v35 = v34;
      objc_msgSend(v34, "addObjectsFromArray:", v18);
      objc_msgSend(v35, "allObjects");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v36, v32);

      v37 = v11[398];
      v38 = v16;
      v39 = (void *)objc_msgSend(v16, "copy");
      v15 = -[__objc2_class _writeProgressToDisk:forPhotoLibraryPathManager:](v37, "_writeProgressToDisk:forPhotoLibraryPathManager:", v39, v10);

    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

+ (id)_storageKeyForOperationType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("search.coreSpotlight.itemsToDonate");
  if (a3 != 1)
    v3 = 0;
  if (a3 == 2)
    return CFSTR("search.coreSpotlight.itemsToDelete");
  else
    return (id)v3;
}

+ (id)_updateFailureCountsForSearchableItemIdentifiers:(id)a3 shouldIncrementCounts:(BOOL)a4 forPhotoLibraryPathManager:(id)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[PLSpotlightProgressManager _readProgressFromDiskForPhotoLibraryPathManager:](PLSpotlightProgressManager, "_readProgressFromDiskForPhotoLibraryPathManager:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("search.coreSpotlight.itemFailureCounts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 0;
  else
    v10 = !v6;
  if (v10)
  {
    v12 = 0;
  }
  else
  {
    v24 = v9;
    if (v9)
      v11 = (id)objc_msgSend(v9, "mutableCopy");
    else
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v11;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v7;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (v6)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "unsignedIntegerValue");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21 + 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v19);

          }
          else
          {
            objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    v12 = (void *)objc_msgSend(v13, "copy");
    v7 = v25;
    v9 = v24;
  }

  return v12;
}

+ (BOOL)_shouldRetryRequestWithMostRecentAttemptOf:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  BOOL v8;

  if (!a3)
    return 1;
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  v8 = v7 / 60.0 >= 60.0;
  return v8;
}

+ (BOOL)_shouldRetryReindexWithScheduledDateOf:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  if (!a3)
    return 1;
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:", v5);

  v7 = v6 == -1;
  return v7;
}

+ (id)_minimumScheduledDateForNextReindexRetry
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend(v3, "components:fromDate:", 28, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDay:", objc_msgSend(v5, "day") + 1);
  objc_msgSend(v3, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_writeProgressToDisk:(id)a3 forPhotoLibraryPathManager:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (!v6)
  {
    PLSearchBackendDonationsGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to serialize progress plist. Error: %@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "searchIndexSpotlightProgressFilePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = objc_msgSend(v6, "writeToFile:options:error:", v8, 1073741825, &v14);
  v10 = v14;

  if ((v9 & 1) == 0)
  {
    PLSearchBackendDonationsGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v10;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to write Spotlight progress plist to disk. Error: %@", buf, 0xCu);
    }

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v11 = 1;
LABEL_10:

  return v11;
}

@end
