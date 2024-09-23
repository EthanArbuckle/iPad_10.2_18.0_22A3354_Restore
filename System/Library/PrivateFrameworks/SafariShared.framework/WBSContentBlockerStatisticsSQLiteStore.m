@implementation WBSContentBlockerStatisticsSQLiteStore

- (BOOL)_tryOpenDatabase:(id *)a3
{
  NSURL **p_databaseURL;
  WBSSQLiteDatabase *v6;
  WBSSQLiteDatabase *database;
  WBSSQLiteDatabase *v8;
  char v9;
  id v10;
  NSURL *v11;
  void *v12;
  WBSSQLiteDatabase *v13;
  char v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  WBSSQLiteDatabase *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v27;
  id v28;
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  p_databaseURL = &self->_databaseURL;
  v6 = (WBSSQLiteDatabase *)objc_msgSend(objc_alloc(MEMORY[0x1E0D89CC0]), "initWithURL:queue:", self->_databaseURL, self->_databaseQueue);
  database = self->_database;
  self->_database = v6;

  v8 = self->_database;
  v28 = 0;
  v9 = -[WBSSQLiteDatabase openWithAccessType:error:](v8, "openWithAccessType:error:", 3, &v28);
  v10 = v28;
  if ((v9 & 1) == 0)
  {
    v17 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (uint64_t)*p_databaseURL;
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSContentBlockerStatisticsSQLiteStore _tryOpenDatabase:].cold.3(v18, v19, (uint64_t)v29);
    }

    v20 = self->_database;
    self->_database = 0;

    if (a3)
    {
      v10 = objc_retainAutorelease(v10);
      v16 = 0;
      *a3 = v10;
      goto LABEL_21;
    }
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  v11 = *p_databaseURL;
  objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = -[NSURL isEqual:](v11, "isEqual:", v12);

  if ((v11 & 1) == 0)
    SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA locking_mode = EXCLUSIVE"));
  v13 = self->_database;
  v27 = v10;
  v14 = -[WBSSQLiteDatabase enableWAL:](v13, "enableWAL:", &v27);
  v15 = v27;

  v10 = v15;
  if ((v14 & 1) == 0)
  {
    if (objc_msgSend(v15, "code") == 5)
    {
      v21 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[WBSContentBlockerStatisticsSQLiteStore _tryOpenDatabase:].cold.1((uint64_t *)&self->_databaseURL, v21, v22);
    }
    else
    {
      v23 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (uint64_t)*p_databaseURL;
        objc_msgSend(v15, "safari_privacyPreservingDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSContentBlockerStatisticsSQLiteStore _tryOpenDatabase:].cold.2(v24, v25, (uint64_t)v29);
      }

    }
    if (a3)
      *a3 = objc_retainAutorelease(v15);
    goto LABEL_19;
  }
  SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA foreign_keys = ON"));
  if (!-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded](self, "_createDatabaseSchemaIfNeeded"))
  {
LABEL_19:
    -[WBSContentBlockerStatisticsSQLiteStore _closeDatabaseOnDatabaseQueue](self, "_closeDatabaseOnDatabaseQueue");
    goto LABEL_20;
  }
  v16 = 1;
LABEL_21:

  return v16;
}

- (BOOL)_createDatabaseSchemaIfNeeded
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[WBSContentBlockerStatisticsSQLiteStore _schemaVersion](self, "_schemaVersion"))
    return 1;
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE IF NOT EXISTS FirstPartyDomains (firstPartyDomainID INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE ON CONFLICT FAIL)"));
  if (v4 == 101)
  {
    v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE IF NOT EXISTS ThirdPartyDomains (thirdPartyDomainID INTEGER PRIMARY KEY AUTOINCREMENT,domain TEXT NOT NULL UNIQUE ON CONFLICT FAIL)"));
    if (v5 == 101)
    {
      v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("CREATE TABLE IF NOT EXISTS BlockedResources (firstPartyDomainID INTEGER NOT NULL,thirdPartyDomainID INTEGER NOT NULL,lastSeen REAL NOT NULL,FOREIGN KEY (firstPartyDomainID) REFERENCES FirstPartyDomains(firstPartyDomainID) ON DELETE CASCADE,FOREIGN KEY (thirdPartyDomainID) REFERENCES ThirdPartyDomains(thirdPartyDomainID) ON DELETE CASCADE,PRIMARY KEY (firstPartyDomainID, thirdPartyDomainID))"));
      if (v6 == 101)
      {
        v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA user_version = 1"));
        if (v7 == 101)
          return 1;
        v8 = v7;
        v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded]");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "safari_privacyPreservingDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543618;
          v22 = v11;
          v23 = 1024;
          v24 = v8;
          _os_log_error_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_ERROR, "Failed to set Content Blocker Statistics database schema version: %{public}@ (%d)", (uint8_t *)&v21, 0x12u);

        }
      }
      else
      {
        v18 = v6;
        v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded]");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "safari_privacyPreservingDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = 138543618;
          v22 = v20;
          v23 = 1024;
          v24 = v18;
          _os_log_error_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_ERROR, "Failed to create BlockedResources table: %{public}@, (%d)", (uint8_t *)&v21, 0x12u);

        }
      }
    }
    else
    {
      v15 = v5;
      v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "safari_privacyPreservingDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543618;
        v22 = v17;
        v23 = 1024;
        v24 = v15;
        _os_log_error_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_ERROR, "Failed to create ThirdPartyDomains table: %{public}@ (%d)", (uint8_t *)&v21, 0x12u);

      }
    }
  }
  else
  {
    v12 = v4;
    v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _createDatabaseSchemaIfNeeded]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safari_privacyPreservingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v14;
      v23 = 1024;
      v24 = v12;
      _os_log_error_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_ERROR, "Failed to create FirstPartyDomains table: %{public}@ (%d)", (uint8_t *)&v21, 0x12u);

    }
  }

  return 0;
}

- (int64_t)_schemaVersion
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intAtIndex:", 0);

  objc_msgSend(v2, "statement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  return v4;
}

void __55__WBSContentBlockerStatisticsSQLiteStore_standardStore__block_invoke()
{
  WBSContentBlockerStatisticsSQLiteStore *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [WBSContentBlockerStatisticsSQLiteStore alloc];
  +[WBSContentBlockerStatisticsSQLiteStore _defaultDatabaseURL](WBSContentBlockerStatisticsSQLiteStore, "_defaultDatabaseURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[WBSContentBlockerStatisticsSQLiteStore initWithDatabaseURL:](v0, "initWithDatabaseURL:");
  v2 = (void *)+[WBSContentBlockerStatisticsSQLiteStore standardStore]::sharedStore;
  +[WBSContentBlockerStatisticsSQLiteStore standardStore]::sharedStore = v1;

}

- (WBSContentBlockerStatisticsSQLiteStore)initWithDatabaseURL:(id)a3
{
  id v5;
  WBSContentBlockerStatisticsSQLiteStore *v6;
  WBSContentBlockerStatisticsSQLiteStore *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *databaseQueue;
  WBSContentBlockerStatisticsSQLiteStore *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBSContentBlockerStatisticsSQLiteStore;
  v6 = -[WBSContentBlockerStatisticsSQLiteStore init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseURL, a3);
    dispatch_get_global_queue(17, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("com.apple.SafariShared.WBSContentBlockerStatisticsSQLiteStore", 0, v8);
    databaseQueue = v7->_databaseQueue;
    v7->_databaseQueue = (OS_dispatch_queue *)v9;

    v11 = v7;
  }

  return v7;
}

+ (id)_defaultDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_settingsDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("ContentBlockerStatistics.db"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __105__WBSContentBlockerStatisticsSQLiteStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  double *v5;
  double *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WBSContentBlockerStatisticsFirstParty *v12;
  uint64_t v13;
  WBSContentBlockerStatisticsFirstParty *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 72))
      v3 = CFSTR(" AND FirstPartyDomains.domain = ?");
    else
      v3 = &stru_1E4B40D18;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WHERE lastSeen >= ? AND lastSeen <= ?%@"), v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT ThirdPartyDomains.domain, FirstPartyDomains.domain, lastSeen FROM BlockedResources JOIN ThirdPartyDomains on BlockedResources.thirdPartyDomainID = ThirdPartyDomains.thirdPartyDomainID JOIN FirstPartyDomains on BlockedResources.firstPartyDomainID = FirstPartyDomains.firstPartyDomainID %@"), v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v5 = (double *)(a1 + 56);
    v6 = (double *)(a1 + 64);
    if (*(_BYTE *)(a1 + 72))
      SafariShared::WBSSQLiteDatabaseFetch<double const&,double const&,NSString * const {__strong}&>(v4, v19, v5, v6, (_QWORD *)(a1 + 40));
    else
      SafariShared::WBSSQLiteDatabaseFetch<double const&,double const&>(v4, v19, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      objc_msgSend(v8, "nextObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (!v9)
        break;
      objc_msgSend(v9, "stringAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = [WBSContentBlockerStatisticsFirstParty alloc];
      objc_msgSend(v10, "stringAtIndex:", 1);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleAtIndex:", 2);
      v14 = -[WBSContentBlockerStatisticsFirstParty initWithDomain:lastSeen:](v12, "initWithDomain:lastSeen:", v13);

      objc_msgSend(v2, "objectForKeyedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v13) = v15 == 0;

      if ((v13 & 1) != 0)
      {
        v21[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "mutableCopy");
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v17, v11);

      }
      else
      {
        objc_msgSend(v2, "objectForKeyedSubscript:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v14);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v7 + 16))(v7);

  }
}

- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 onFirstParty:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *databaseQueue;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "timeIntervalSince1970");
  v15 = v14;
  objc_msgSend(v11, "timeIntervalSince1970");
  v17 = v16;
  v18 = objc_msgSend(v12, "length");
  databaseQueue = self->_databaseQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __105__WBSContentBlockerStatisticsSQLiteStore_blockedThirdPartiesAfter_before_onFirstParty_completionHandler___block_invoke;
  v22[3] = &unk_1E4B37FF8;
  v23 = v12;
  v24 = v13;
  v27 = v18 != 0;
  v25 = v15;
  v26 = v17;
  v22[4] = self;
  v20 = v12;
  v21 = v13;
  dispatch_async(databaseQueue, v22);

}

- (BOOL)_openDatabaseIfNeeded
{
  return -[WBSContentBlockerStatisticsSQLiteStore _openDatabaseIfNeededFallingBackToInMemory:](self, "_openDatabaseIfNeededFallingBackToInMemory:", 1);
}

- (BOOL)_openDatabaseIfNeededFallingBackToInMemory:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  NSURL *v10;
  NSURL *databaseURL;
  NSObject *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  id v18;
  id v19;
  id v20;
  uint8_t buf[24];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_database)
  {
    v3 = a3;
    v20 = 0;
    v5 = -[WBSContentBlockerStatisticsSQLiteStore _tryOpenDatabase:](self, "_tryOpenDatabase:", &v20);
    v6 = v20;
    v7 = v6;
    if (v5)
    {
      LOBYTE(v3) = 1;
LABEL_21:

      return v3;
    }
    if ((objc_msgSend(v6, "safari_isSQLiteCorruptionError") & 1) != 0
      || objc_msgSend(v7, "safari_isSQLiteError") && objc_msgSend(v7, "code") == 26)
    {
      -[WBSContentBlockerStatisticsSQLiteStore _deleteDatabase](self, "_deleteDatabase");
      v19 = v7;
      v8 = -[WBSContentBlockerStatisticsSQLiteStore _tryOpenDatabase:](self, "_tryOpenDatabase:", &v19);
      v9 = v19;

      if (v8)
      {
        LOBYTE(v3) = 1;
        v7 = v9;
        goto LABEL_21;
      }
      v7 = v9;
      if (!v3)
        goto LABEL_21;
    }
    else if (!v3)
    {
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
    v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
    databaseURL = self->_databaseURL;
    self->_databaseURL = v10;

    v12 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSContentBlockerStatisticsSQLiteStore _openDatabaseIfNeededFallingBackToInMemory:].cold.2(v13, buf, v12);
    }

    v18 = v7;
    v14 = -[WBSContentBlockerStatisticsSQLiteStore _tryOpenDatabase:](self, "_tryOpenDatabase:", &v18);
    v15 = v18;

    if (v14)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v16 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[WBSContentBlockerStatisticsSQLiteStore _openDatabaseIfNeededFallingBackToInMemory:].cold.1(v16);
      LOBYTE(v3) = 0;
    }
    v7 = v15;
    goto LABEL_21;
  }
  LOBYTE(v3) = 1;
  return v3;
}

+ (NSArray)allStores
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "standardStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  allProfileDatabaseIdentifiers();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy", 0);

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(a1, "storeForProfileWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return (NSArray *)v12;
}

+ (WBSContentBlockerStatisticsSQLiteStore)standardStore
{
  if (+[WBSContentBlockerStatisticsSQLiteStore standardStore]::onceToken != -1)
    dispatch_once(&+[WBSContentBlockerStatisticsSQLiteStore standardStore]::onceToken, &__block_literal_global_28);
  return (WBSContentBlockerStatisticsSQLiteStore *)(id)+[WBSContentBlockerStatisticsSQLiteStore standardStore]::sharedStore;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; databaseURL: %@>"),
                       objc_opt_class(),
                       self,
                       self->_databaseURL);
}

+ (id)storeForProfileWithIdentifier:(id)a3
{
  id v4;
  WBSContentBlockerStatisticsSQLiteStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D89E20]))
  {
    objc_msgSend(a1, "standardStore");
    v5 = (WBSContentBlockerStatisticsSQLiteStore *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    storesByProfileIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v5 = (WBSContentBlockerStatisticsSQLiteStore *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(a1, "_databaseURLForProfileWithIdentifier:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[WBSContentBlockerStatisticsSQLiteStore initWithDatabaseURL:]([WBSContentBlockerStatisticsSQLiteStore alloc], "initWithDatabaseURL:", v7);
      storesByProfileIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v5, v4);

      allProfileDatabaseIdentifiers();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v4);

    }
  }

  return v5;
}

+ (BOOL)storeExistsForProfileWithIdentifier:(id)a3
{
  id v3;
  char v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    allProfileDatabaseIdentifiers();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "containsObject:", v3);

  }
  return v4;
}

- (void)dealloc
{
  WBSSQLiteDatabase *v3;
  NSObject *databaseQueue;
  WBSSQLiteDatabase *v5;
  objc_super v6;
  _QWORD block[4];
  WBSSQLiteDatabase *v8;

  v3 = self->_database;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WBSContentBlockerStatisticsSQLiteStore_dealloc__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  v8 = v3;
  v5 = v3;
  dispatch_async(databaseQueue, block);

  v6.receiver = self;
  v6.super_class = (Class)WBSContentBlockerStatisticsSQLiteStore;
  -[WBSContentBlockerStatisticsSQLiteStore dealloc](&v6, sel_dealloc);
}

uint64_t __49__WBSContentBlockerStatisticsSQLiteStore_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

- (void)recordThirdPartyResourceBlocked:(id)a3 onFirstParty:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *databaseQueue;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "host");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_highLevelDomainFromHost");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "host");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safari_highLevelDomainFromHost");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  databaseQueue = self->_databaseQueue;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __105__WBSContentBlockerStatisticsSQLiteStore_recordThirdPartyResourceBlocked_onFirstParty_completionHandler___block_invoke;
  v19[3] = &unk_1E4B2A2A0;
  v19[4] = self;
  v20 = v12;
  v21 = v14;
  v22 = v10;
  v16 = v14;
  v17 = v12;
  v18 = v10;
  dispatch_async(databaseQueue, v19);

}

uint64_t __105__WBSContentBlockerStatisticsSQLiteStore_recordThirdPartyResourceBlocked_onFirstParty_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t result;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded") & 1) != 0)
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "_idForThirdPartyWithHighLevelDomain:", *(_QWORD *)(a1 + 40));
    v11 = objc_msgSend(*(id *)(a1 + 32), "_idForFirstPartyWithHighLevelDomain:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSince1970");
    v4 = v3;

    v10 = v4;
    v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long &,long &,double &>(*(void **)(*(_QWORD *)(a1 + 32) + 24), 0, CFSTR("INSERT INTO BlockedResources (thirdPartyDomainID, firstPartyDomainID, lastSeen) VALUES (?,?,?) ON CONFLICT(thirdPartyDomainID, firstPartyDomainID) DO UPDATE SET lastSeen = excluded.lastSeen"), &v12, &v11, (double *)&v10);
    if (v5 != 101)
    {
      v6 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore recordThirdPartyResourceBlocked:onFirstParty:completionHandler:]_block_invoke");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "safari_privacyPreservingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v14 = v9;
        v15 = 1024;
        v16 = v5;
        _os_log_error_impl(&dword_1A3D90000, v6, OS_LOG_TYPE_ERROR, "Failed to insert into BlockedResources table: %{public}@ (%d)", buf, 0x12u);

      }
    }
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v5 == 101);
  }
  else
  {
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (void)blockedThirdPartiesAfter:(id)a3 before:(id)a4 completionHandler:(id)a5
{
  -[WBSContentBlockerStatisticsSQLiteStore blockedThirdPartiesAfter:before:onFirstParty:completionHandler:](self, "blockedThirdPartiesAfter:before:onFirstParty:completionHandler:", a3, a4, 0, a5);
}

- (void)clearAllStatisticsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__WBSContentBlockerStatisticsSQLiteStore_clearAllStatisticsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __82__WBSContentBlockerStatisticsSQLiteStore_clearAllStatisticsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t result;
  uint8_t v7[16];

  if (objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeededFallingBackToInMemory:", 0))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_clearStatisticsAfter:before:", v3, v4);

  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Failed to open database to clear statistics. Deleting.", v7, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "_deleteDatabase");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clearStatisticsAfter:(id)a3 before:(id)a4
{
  id v6;
  id v7;
  NSObject *databaseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSContentBlockerStatisticsSQLiteStore_clearStatisticsAfter_before___block_invoke;
  block[3] = &unk_1E4B2B2A8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(databaseQueue, block);

}

uint64_t __70__WBSContentBlockerStatisticsSQLiteStore_clearStatisticsAfter_before___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_clearStatisticsAfter:before:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)clearStatisticsForDomains:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  databaseQueue = self->_databaseQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__WBSContentBlockerStatisticsSQLiteStore_clearStatisticsForDomains___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __68__WBSContentBlockerStatisticsSQLiteStore_clearStatisticsForDomains___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_openDatabaseIfNeeded");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v5 = *(_QWORD *)v14;
    *(_QWORD *)&v4 = 138477827;
    v12 = v4;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "safari_highLevelDomainFromHost", v12, (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqualToString:", v8);

        if ((v9 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "_clearStatisticsForDomain:", v7);
        }
        else
        {
          v10 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v12;
            v18 = v7;
            _os_log_error_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_ERROR, "Could not remove content blocker statistics for non high-level domain %{private}@", buf, 0xCu);
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_deleteUnusedDomains");
}

- (void)closeDatabase
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WBSContentBlockerStatisticsSQLiteStore_closeDatabase__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __55__WBSContentBlockerStatisticsSQLiteStore_closeDatabase__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabaseOnDatabaseQueue");
}

+ (id)_databaseURLForProfileWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_profileDirectoryURLWithID:createIfNeeded:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("ContentBlockerStatistics.db"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_closeDatabaseOnDatabaseQueue
{
  WBSSQLiteDatabase *database;

  -[WBSSQLiteDatabase close](self->_database, "close");
  database = self->_database;
  self->_database = 0;

}

- (void)_deleteDatabase
{
  NSURL *databaseURL;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  databaseURL = self->_databaseURL;
  objc_msgSend(MEMORY[0x1E0D89CC0], "inMemoryDatabaseURL");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(databaseURL) = -[NSURL isEqual:](databaseURL, "isEqual:");

  if ((databaseURL & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[NSURL absoluteString](self->_databaseURL, "absoluteString");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtURL:error:", self->_databaseURL, 0);
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-lock"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtURL:error:", v7, 0);

    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-shm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtURL:error:", v10, 0);

    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("-wal"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtURL:error:", v13, 0);

  }
}

- (int64_t)_idForThirdPartyWithHighLevelDomain:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int64_t v7;
  int v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, CFSTR("SELECT thirdPartyDomainID FROM ThirdPartyDomains WHERE domain = ?"), &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (int)-[NSObject intAtIndex:](v5, "intAtIndex:", 0);
  }
  else
  {
    v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_database, 0, CFSTR("INSERT INTO ThirdPartyDomains (domain) VALUES (?)"), &v13);
    if (v8 == 101)
    {
      v7 = -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID");
    }
    else
    {
      v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _idForThirdPartyWithHighLevelDomain:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safari_privacyPreservingDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v12;
        v16 = 1024;
        v17 = v8;
        _os_log_error_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_ERROR, "Failed to insert row into ThirdPartyDomains: %{public}@ (%d)", buf, 0x12u);

      }
      v7 = 0x7FFFFFFFFFFFFFFFLL;
      v6 = v9;
    }
  }

  return v7;
}

- (int64_t)_idForFirstPartyWithHighLevelDomain:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int64_t v7;
  int v8;
  NSObject *v9;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(self->_database, CFSTR("SELECT firstPartyDomainID FROM FirstPartyDomains WHERE domain = ?"), &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextObject");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (int)-[NSObject intAtIndex:](v5, "intAtIndex:", 0);
  }
  else
  {
    v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_database, 0, CFSTR("INSERT INTO FirstPartyDomains (domain) VALUES (?)"), &v13);
    if (v8 == 101)
    {
      v7 = -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID");
    }
    else
    {
      v9 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _idForFirstPartyWithHighLevelDomain:]");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "safari_privacyPreservingDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v12;
        v16 = 1024;
        v17 = v8;
        _os_log_error_impl(&dword_1A3D90000, v9, OS_LOG_TYPE_ERROR, "Failed to insert row into FirstPartyDomains: %{public}@ (%d)", buf, 0x12u);

      }
      v7 = 0x7FFFFFFFFFFFFFFFLL;
      v6 = v9;
    }
  }

  return v7;
}

- (void)_clearStatisticsAfter:(id)a3 before:(id)a4
{
  id v6;
  id v7;
  WBSSQLiteDatabase *database;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _BYTE buf[12];
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  database = self->_database;
  objc_msgSend(v6, "timeIntervalSince1970");
  *(_QWORD *)buf = v9;
  objc_msgSend(v7, "timeIntervalSince1970");
  v15 = v10;
  v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,double>(database, 0, CFSTR("DELETE FROM BlockedResources WHERE lastSeen >= ? AND lastSeen <= ?"), (double *)buf, (double *)&v15);
  if (v11 != 101)
  {
    v12 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _clearStatisticsAfter:before:]");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safari_privacyPreservingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      v17 = 1024;
      v18 = v11;
      _os_log_error_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_ERROR, "Unable to clear rows from Blocked Resources: %{public}@ (%d)", buf, 0x12u);

    }
  }
  -[WBSContentBlockerStatisticsSQLiteStore _deleteUnusedDomains](self, "_deleteUnusedDomains");

}

- (void)_clearStatisticsForDomain:(id)a3
{
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(self->_database, 0, CFSTR("DELETE FROM FirstPartyDomains WHERE domain = ?"), &v8);
  if (v4 != 101)
  {
    v5 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _clearStatisticsForDomain:]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      v11 = 1024;
      v12 = v4;
      _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Unable to clear row from First Party Domains: %{public}@ (%d)", buf, 0x12u);

    }
  }

}

- (void)_deleteUnusedDomains
{
  int v3;
  int v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DELETE FROM FirstPartyDomains WHERE (SELECT COUNT(rowid) FROM BlockedResources WHERE BlockedResources.firstPartyDomainID = FirstPartyDomains.firstPartyDomainID) = 0"));
  if (v3 != 101)
  {
    v4 = v3;
    v5 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _deleteUnusedDomains]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safari_privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 1024;
      v15 = v4;
      _os_log_error_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_ERROR, "Unable to clear rows from First Party Domains: %{public}@ (%d)", (uint8_t *)&v12, 0x12u);

    }
  }
  v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("DELETE FROM ThirdPartyDomains WHERE (SELECT COUNT(rowid) FROM BlockedResources WHERE BlockedResources.thirdPartyDomainID = ThirdPartyDomains.thirdPartyDomainID) = 0"));
  if (v6 != 101)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorWithMethodName:](self->_database, "lastErrorWithMethodName:", "-[WBSContentBlockerStatisticsSQLiteStore _deleteUnusedDomains]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_privacyPreservingDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v11;
      v14 = 1024;
      v15 = v6;
      _os_log_error_impl(&dword_1A3D90000, v7, OS_LOG_TYPE_ERROR, "Unable to clear rows from Third Party Domains: %@ (%d)", (uint8_t *)&v12, 0x12u);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_openDatabaseIfNeededFallingBackToInMemory:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Failed to open in-memory database", v1, 2u);
}

- (void)_openDatabaseIfNeededFallingBackToInMemory:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1A3D90000, log, OS_LOG_TYPE_FAULT, "Failling back to in-memory database: %{public}@", buf, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (void)_tryOpenDatabase:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138477827;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a2, a3, "Failed to acquire exclusive access to Content Blocker Statistics SQLite store at %{private}@.", (uint8_t *)&v4);
}

- (void)_tryOpenDatabase:(uint64_t)a3 .cold.2(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to enable write-ahead logging on Content Blocker Statistics SQLite store at %{private}@: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_tryOpenDatabase:(uint64_t)a3 .cold.3(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_1(a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A3D90000, "Failed to open Content Blocker Statistics SQLite store at %{private}@. Error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

@end
