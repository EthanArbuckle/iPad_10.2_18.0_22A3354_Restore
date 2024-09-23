@implementation WBSSQLiteStore

void __116__WBSSQLiteStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = *(_QWORD *)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = *(_BYTE *)(a1 + 56);
  v2 = *(_QWORD **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = v2[4];
  v4 = *(unsigned __int8 *)(a1 + 57);
  v5 = *(unsigned __int8 *)(a1 + 58);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __116__WBSSQLiteStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2;
  v6[3] = &unk_1E64A0180;
  v7 = v1;
  objc_msgSend(v2, "_openDatabase:createIfNeeded:checkIntegrity:completionHandler:", v3, v4, v5, v6);

}

- (void)_openDatabase:(id)a3 createIfNeeded:(BOOL)a4 checkIntegrity:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  WBSSQLiteDatabase *v12;
  WBSSQLiteDatabase *database;
  WBSSQLiteDatabase *v14;
  uint64_t v15;
  int64_t protectionType;
  BOOL v17;
  id v18;
  WBSSQLiteDatabase *v19;
  BOOL v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id WeakRetained;
  NSObject *v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  id v40;
  id location[4];

  v7 = a5;
  v8 = a4;
  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = -[WBSSQLiteDatabase initWithURL:queue:]([WBSSQLiteDatabase alloc], "initWithURL:queue:", v10, self->_databaseQueue);
  database = self->_database;
  self->_database = v12;

  v14 = self->_database;
  if (v8)
    v15 = 3;
  else
    v15 = 2;
  protectionType = self->_protectionType;
  v40 = 0;
  v17 = -[WBSSQLiteDatabase openWithAccessType:protectionType:vfs:error:](v14, "openWithAccessType:protectionType:vfs:error:", v15, protectionType, 0, &v40);
  v18 = v40;
  if (!v17)
  {
    v23 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "safari_privacyPreservingDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStore _openDatabase:createIfNeeded:checkIntegrity:completionHandler:].cold.3((uint64_t)v10, v24, (uint64_t)location);
    }

    v25 = 1;
    goto LABEL_23;
  }
  if (self->_databaseLockingPolicy == 1
    && !-[WBSSQLiteStore _acquireDatabaseCoordinationLockForDatabaseURL:](self, "_acquireDatabaseCoordinationLockForDatabaseURL:", v10))
  {
    v29 = WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[WBSSQLiteStore _openDatabase:createIfNeeded:checkIntegrity:completionHandler:].cold.2((uint64_t)v10, v29, v30);
    v25 = 2;
LABEL_23:
    -[WBSSQLiteStore _handleOpenFailureWithStatus:completionHandler:](self, "_handleOpenFailureWithStatus:completionHandler:", v25, v11);
    goto LABEL_24;
  }
  if (v7 && !-[WBSSQLiteStore _confirmDatabaseIntegrityIsOK](self, "_confirmDatabaseIntegrityIsOK"))
  {
    objc_initWeak(location, self);
    -[WBSSQLiteStore _closeDatabase](self, "_closeDatabase");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      dispatch_get_global_queue(21, 0);
      v32 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke;
      block[3] = &unk_1E64A0220;
      objc_copyWeak(&v38, location);
      v35 = WeakRetained;
      v36 = v10;
      v39 = v8;
      v37 = v11;
      dispatch_async(v32, block);

      objc_destroyWeak(&v38);
    }
    else
    {
      -[WBSSQLiteStore _handleOpenFailureWithStatus:completionHandler:](self, "_handleOpenFailureWithStatus:completionHandler:", 3, v11);
    }

    objc_destroyWeak(location);
  }
  else
  {
    v19 = self->_database;
    v33 = v18;
    v20 = -[WBSSQLiteDatabase enableWAL:](v19, "enableWAL:", &v33);
    v21 = v33;

    if (v20)
    {
      SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("PRAGMA foreign_keys = ON"));
      if (-[WBSSQLiteStore _migrateToCurrentSchemaVersionIfNecessary](self, "_migrateToCurrentSchemaVersionIfNecessary"))
      {
        v22 = 0;
      }
      else
      {
        v22 = 3;
      }
      v18 = v21;
      (*((void (**)(id, uint64_t))v11 + 2))(v11, v22);
    }
    else
    {
      v26 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "safari_privacyPreservingDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSQLiteStore _openDatabase:createIfNeeded:checkIntegrity:completionHandler:].cold.1(v27, v28, (uint64_t)location);
      }

      v18 = v21;
      -[WBSSQLiteStore _handleOpenFailureWithStatus:completionHandler:](self, "_handleOpenFailureWithStatus:completionHandler:", 3, v11);
    }
  }
LABEL_24:

}

uint64_t __116__WBSSQLiteStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (int)_migrateToCurrentSchemaVersionIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  int v8;

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intAtIndex:", 0);

  objc_msgSend(v3, "statement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  v7 = -[WBSSQLiteStore _currentSchemaVersion](self, "_currentSchemaVersion");
  if (v5 < v7)
  {
    if (!v5)
    {
      if (-[WBSSQLiteStore _createFreshDatabaseSchema](self, "_createFreshDatabaseSchema") != 101)
      {
        v5 = 0;
        goto LABEL_14;
      }
      v5 = 1;
      -[WBSSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", 1);
    }
    if (v7 <= v5)
      v8 = v5;
    else
      v8 = v7;
    while (v8 != v5)
    {
      if (-[WBSSQLiteStore _migrateToSchemaVersion:](self, "_migrateToSchemaVersion:", (v5 + 1)) != 101)
        goto LABEL_12;
      -[WBSSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", ++v5);
    }
    v5 = v8;
LABEL_12:
    if (v5 >= v7)
      v5 = v7;
  }
LABEL_14:

  return v5;
}

- (BOOL)_acquireDatabaseCoordinationLockForDatabaseURL:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  const char *v8;
  BOOL v9;
  NSObject *v10;
  int *v11;
  int *v12;
  _BYTE v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[WBSSQLiteDatabase inMemoryDatabaseURL](WBSSQLiteDatabase, "inMemoryDatabaseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
    goto LABEL_4;
  -[WBSSQLiteStore _databaseCoordinationLockURLForDatabaseURL:](self, "_databaseCoordinationLockURLForDatabaseURL:", v4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");

  self->_databaseCoordinationLockFileDescriptor = open(v8, 512, 438);
  if (!-[WBSSQLiteStore _isDatabaseLocked](self, "_isDatabaseLocked"))
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = __error();
      -[WBSSQLiteStore _acquireDatabaseCoordinationLockForDatabaseURL:].cold.2((uint64_t)v8, (uint64_t)v11, (uint64_t)v14);
    }
    goto LABEL_9;
  }
  if (flock(self->_databaseCoordinationLockFileDescriptor, 6) == -1)
  {
    close(self->_databaseCoordinationLockFileDescriptor);
    self->_databaseCoordinationLockFileDescriptor = -1;
    v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      -[WBSSQLiteStore _acquireDatabaseCoordinationLockForDatabaseURL:].cold.1((uint64_t)v8, (uint64_t)v12, (uint64_t)v14);
    }
LABEL_9:

    v9 = 0;
    goto LABEL_10;
  }
LABEL_4:
  v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)_isDatabaseLocked
{
  return self->_databaseCoordinationLockFileDescriptor != -1;
}

- (id)_databaseCoordinationLockURLForDatabaseURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[NSURL absoluteString](self->_databaseURL, "absoluteString", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-lock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (WBSSQLiteStore)initWithURL:(id)a3
{
  return -[WBSSQLiteStore initWithURL:protectionType:](self, "initWithURL:protectionType:", a3, 0);
}

- (WBSSQLiteDatabase)database
{
  return self->_database;
}

- (OS_dispatch_queue)databaseQueue
{
  return self->_databaseQueue;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)openAndCheckIntegrity:(BOOL)a3 createIfNeeded:(BOOL)a4 fallBackToMemoryStoreIfError:(BOOL)a5 lockingPolicy:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  NSObject *databaseQueue;
  id v14;
  _QWORD v15[5];
  id v16;
  int64_t v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;

  v12 = a7;
  databaseQueue = self->_databaseQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __116__WBSSQLiteStore_openAndCheckIntegrity_createIfNeeded_fallBackToMemoryStoreIfError_lockingPolicy_completionHandler___block_invoke;
  v15[3] = &unk_1E64A01A8;
  v16 = v12;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v15[4] = self;
  v14 = v12;
  dispatch_async(databaseQueue, v15);

}

- (WBSSQLiteStore)initWithURL:(id)a3 protectionType:(int64_t)a4
{
  id v7;
  WBSSQLiteStore *v8;
  WBSSQLiteStore *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *databaseQueue;
  WBSSQLiteStore *v17;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSSQLiteStore;
  v8 = -[WBSSQLiteStore init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databaseURL, a3);
    v9->_protectionType = a4;
    v9->_databaseCoordinationLockFileDescriptor = -1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p"), v13, v9);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), v10);
    databaseQueue = v9->_databaseQueue;
    v9->_databaseQueue = (OS_dispatch_queue *)v15;

    v17 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (-[WBSSQLiteStore _isDatabaseLocked](self, "_isDatabaseLocked"))
    -[WBSSQLiteStore _releaseDatabaseCoordinationLock](self, "_releaseDatabaseCoordinationLock");
  v3.receiver = self;
  v3.super_class = (Class)WBSSQLiteStore;
  -[WBSSQLiteStore dealloc](&v3, sel_dealloc);
}

- (BOOL)isOpen
{
  return self->_database != 0;
}

void __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke_2;
    v5[3] = &unk_1E64A01F8;
    objc_copyWeak(&v8, v2);
    v6 = *(id *)(a1 + 40);
    v9 = *(_BYTE *)(a1 + 64);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "sqliteStoreDidFailDatabaseIntegrityCheck:completionHandler:", WeakRetained, v5);

    objc_destroyWeak(&v8);
  }

}

void __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "databaseQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke_3;
    v5[3] = &unk_1E64A01D0;
    v5[4] = v3;
    v6 = *(id *)(a1 + 32);
    v8 = *(_BYTE *)(a1 + 56);
    v7 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);

  }
}

uint64_t __80__WBSSQLiteStore__openDatabase_createIfNeeded_checkIntegrity_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_openDatabase:createIfNeeded:checkIntegrity:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), 0, *(_QWORD *)(a1 + 48));
}

- (void)_handleOpenFailureWithStatus:(int64_t)a3 completionHandler:(id)a4
{
  void (**v6)(id, int64_t);
  NSObject *v7;
  void *v8;
  id WeakRetained;

  v6 = (void (**)(id, int64_t))a4;
  -[WBSSQLiteStore _closeDatabase](self, "_closeDatabase");
  if (self->_fallBackToMemoryStoreIfError)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSSQLiteStore _handleOpenFailureWithStatus:completionHandler:].cold.1(v7);
    +[WBSSQLiteDatabase inMemoryDatabaseURL](WBSSQLiteDatabase, "inMemoryDatabaseURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSQLiteStore _openDatabase:createIfNeeded:checkIntegrity:completionHandler:](self, "_openDatabase:createIfNeeded:checkIntegrity:completionHandler:", v8, 1, 0, v6);

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "sqliteStoreDidFallBackToInMemoryStore:", self);

  }
  else
  {
    v6[2](v6, a3);
  }

}

- (void)closeWithCompletionHandler:(id)a3
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
  v7[2] = __45__WBSSQLiteStore_closeWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E649A640;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(databaseQueue, v7);

}

uint64_t __45__WBSSQLiteStore_closeWithCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_closeDatabase");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)savePendingChangesBeforeTermination
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSSQLiteStore_savePendingChangesBeforeTermination__block_invoke;
  block[3] = &unk_1E649A460;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __53__WBSSQLiteStore_savePendingChangesBeforeTermination__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase");
}

- (void)_closeDatabase
{
  WBSSQLiteDatabase *database;

  if (-[WBSSQLiteStore isOpen](self, "isOpen"))
  {
    -[WBSSQLiteStore _databaseWillClose](self, "_databaseWillClose");
    if (-[WBSSQLiteStore _isDatabaseLocked](self, "_isDatabaseLocked"))
      -[WBSSQLiteStore _releaseDatabaseCoordinationLock](self, "_releaseDatabaseCoordinationLock");
    -[WBSSQLiteDatabase close](self->_database, "close");
    database = self->_database;
    self->_database = 0;

  }
}

- (BOOL)_confirmDatabaseIntegrityIsOK
{
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  -[WBSSQLiteDatabase checkIntegrity](self->_database, "checkIntegrity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStore _confirmDatabaseIntegrityIsOK].cold.1(v4, (uint64_t)v6, v3);
    }

  }
  return v2 == 0;
}

- (int)_currentSchemaVersion
{
  return 1;
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  WBSSQLiteDatabase *database;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  _BYTE v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXSQLiteStore();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[NSURL lastPathComponent](self->_databaseURL, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteStore _setDatabaseSchemaVersion:].cold.1(v9, (uint64_t)v11, a3, v8);
    }

  }
  return v7;
}

- (int)_createFreshDatabaseSchema
{
  return 101;
}

- (int)_migrateToSchemaVersion:(int)a3
{
  return 3;
}

- (void)_releaseDatabaseCoordinationLock
{
  int v3;

  v3 = *a1;
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = v3;
  OUTLINED_FUNCTION_3_1(&dword_1B2621000, a2, a3, "Failed to unlock database store coordination lock: %{errno}d", (uint8_t *)a2);
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (WBSSQLiteStoreDelegate)delegate
{
  return (WBSSQLiteStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

- (void)_openDatabase:(uint64_t)a3 createIfNeeded:checkIntegrity:completionHandler:.cold.1(void *a1, void *a2, uint64_t a3)
{
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_7((uint64_t)a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_4_2(&dword_1B2621000, "Failed to enable write-ahead logging on database at %{private}@: %{public}@", v5, v6);

  OUTLINED_FUNCTION_0_3();
}

- (void)_openDatabase:(uint64_t)a3 createIfNeeded:checkIntegrity:completionHandler:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138477827;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, a2, a3, "Failed to acquire exclusive access to database at %{private}@.", (uint8_t *)&v3);
}

- (void)_openDatabase:(uint64_t)a3 createIfNeeded:checkIntegrity:completionHandler:.cold.3(uint64_t a1, void *a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_1_7(a1, (uint64_t)a2, a3, 5.8081e-34);
  OUTLINED_FUNCTION_4_2(&dword_1B2621000, "Failed to open database at %{private}@. Error: %{public}@", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (void)_handleOpenFailureWithStatus:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B2621000, log, OS_LOG_TYPE_ERROR, "Falling back to an in-memory store", v1, 2u);
}

- (void)_confirmDatabaseIntegrityIsOK
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, a3, (uint64_t)a3, "Failed database integrity check: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_0_3();
}

- (void)_setDatabaseSchemaVersion:(int)a3 .cold.1(void *a1, uint64_t a2, int a3, NSObject *a4)
{
  *(_DWORD *)a2 = 67109378;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2114;
  *(_QWORD *)(a2 + 10) = a1;
  OUTLINED_FUNCTION_1(&dword_1B2621000, "Failed to set the database schema version to %d for database: %{public}@", (uint8_t *)a2, a4);

  OUTLINED_FUNCTION_0_3();
}

- (void)_acquireDatabaseCoordinationLockForDatabaseURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2_3(a1, 4.8151e-34, a2, a3);
  OUTLINED_FUNCTION_1(&dword_1B2621000, "Failed to acquire database store coordination lock at %s: %{errno}d", v3, v4);
}

- (void)_acquireDatabaseCoordinationLockForDatabaseURL:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_2_3(a1, 4.8151e-34, a2, a3);
  OUTLINED_FUNCTION_1(&dword_1B2621000, "Failed to open database store coordination lock at %s: %{errno}d", v3, v4);
}

@end
