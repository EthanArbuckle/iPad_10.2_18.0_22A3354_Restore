@implementation WBSSiteMetadataImageCacheSettingsSQLiteStore

- (id)allEntries
{
  void *v3;
  NSObject *databaseQueue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  databaseQueue = self->_databaseQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__WBSSiteMetadataImageCacheSettingsSQLiteStore_allEntries__block_invoke;
  v9[3] = &unk_1E54413C0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(databaseQueue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

- (WBSSiteMetadataImageCacheSettingsSQLiteStore)initWithDatabaseURL:(id)a3 protectionType:(int64_t)a4
{
  id v7;
  WBSSiteMetadataImageCacheSettingsSQLiteStore *v8;
  WBSSiteMetadataImageCacheSettingsSQLiteStore *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *databaseQueue;
  NSObject *v18;
  WBSSiteMetadataImageCacheSettingsSQLiteStore *v19;
  WBSSiteMetadataImageCacheSettingsSQLiteStore *v20;
  WBSSiteMetadataImageCacheSettingsSQLiteStore *v21;
  _QWORD block[4];
  WBSSiteMetadataImageCacheSettingsSQLiteStore *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  objc_super v31;

  v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)WBSSiteMetadataImageCacheSettingsSQLiteStore;
  v8 = -[WBSSiteMetadataImageCacheSettingsSQLiteStore init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_databaseURL, a3);
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.SafariShared.%@.%p"), v12, v9);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    databaseQueue = v9->_databaseQueue;
    v9->_databaseQueue = (OS_dispatch_queue *)v16;

    v9->_protectionType = a4;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v18 = v9->_databaseQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__WBSSiteMetadataImageCacheSettingsSQLiteStore_initWithDatabaseURL_protectionType___block_invoke;
    block[3] = &unk_1E5444B28;
    v26 = &v27;
    v19 = v9;
    v24 = v19;
    v25 = v7;
    dispatch_sync(v18, block);
    if (*((_BYTE *)v28 + 24))
      v20 = v19;
    else
      v20 = 0;
    v21 = v20;

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __83__WBSSiteMetadataImageCacheSettingsSQLiteStore_initWithDatabaseURL_protectionType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_openDatabase:andCheckIntegrity:", *(_QWORD *)(a1 + 40), 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
    || (result = objc_msgSend(*(id *)(a1 + 32), "_migrateToCurrentSchemaVersionifNeeded"),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  }
  return result;
}

- (BOOL)_openDatabase:(id)a3 andCheckIntegrity:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  WBSSQLiteDatabase *v7;
  WBSSQLiteDatabase *database;
  WBSSQLiteDatabase *v9;
  int64_t protectionType;
  char v11;
  id v12;
  void *v13;
  WBSSQLiteDatabase *v14;
  char v15;
  id v16;
  BOOL v17;
  WBSSQLiteDatabase *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[40];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (WBSSQLiteDatabase *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A1B0]), "initWithURL:queue:", v6, self->_databaseQueue);
  database = self->_database;
  self->_database = v7;

  v9 = self->_database;
  protectionType = self->_protectionType;
  v24 = 0;
  v11 = -[WBSSQLiteDatabase openWithAccessType:protectionType:vfs:error:](v9, "openWithAccessType:protectionType:vfs:error:", 3, protectionType, 0, &v24);
  v12 = v24;
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    objc_msgSend(v12, "safari_privacyPreservingDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    WTFLogAlways();

    v18 = self->_database;
    self->_database = 0;

    v17 = 0;
    self->_isClosed = 1;
    goto LABEL_11;
  }
  v14 = self->_database;
  v23 = v13;
  v15 = -[WBSSQLiteDatabase enableWAL:](v14, "enableWAL:", &v23);
  v16 = v23;

  v13 = v16;
  if ((v15 & 1) == 0)
  {
    v19 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "safari_privacyPreservingDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSiteMetadataImageCacheSettingsSQLiteStore _openDatabase:andCheckIntegrity:].cold.1((uint64_t)v6, v20, buf, v19);
    }

    goto LABEL_10;
  }
  if (v4 && !-[WBSSiteMetadataImageCacheSettingsSQLiteStore _checkDatabaseIntegrity](self, "_checkDatabaseIntegrity"))
  {
LABEL_10:
    -[WBSSiteMetadataImageCacheSettingsSQLiteStore _closeDatabase](self, "_closeDatabase");
    v17 = 0;
    goto LABEL_11;
  }
  v17 = 1;
LABEL_11:

  return v17;
}

- (BOOL)_checkDatabaseIntegrity
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;

  -[WBSSQLiteDatabase fetchQuery:](self->_database, "fetchQuery:", CFSTR("PRAGMA integrity_check(1)"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  if (!v3)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSSiteMetadataImageCacheSettingsSQLiteStore _checkDatabaseIntegrity].cold.1(v7);
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ok")) & 1) == 0)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSSiteMetadataImageCacheSettingsSQLiteStore _checkDatabaseIntegrity].cold.2((uint64_t)v4, v8);
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v6 = 1;
LABEL_9:

  return v6;
}

void __58__WBSSiteMetadataImageCacheSettingsSQLiteStore_allEntries__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_selectAllEntriesSQLiteStatement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_msgSend((id)objc_opt_class(), "cacheSettingsEntryClass");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = *(void **)(a1 + 40);
        v11 = [v4 alloc];
        v12 = (void *)objc_msgSend(v11, "initWithSQLiteRow:", v9, (_QWORD)v13);
        objc_msgSend(v10, "addObject:", v12);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  objc_msgSend(v2, "invalidate");
}

- (WBSSQLiteDatabase)database
{
  return self->_database;
}

- (BOOL)_migrateToCurrentSchemaVersionifNeeded
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;

  SafariShared::WBSSQLiteDatabaseFetch<>(self->_database, CFSTR("PRAGMA user_version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intAtIndex:", 0);

  objc_msgSend(v3, "statement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(), "databaseSchemaVersion");
    v8 = v7;
    if (v7 > v5 && v7 >= v5 + 1)
    {
      v10 = v5 + 1;
      do
      {
        -[WBSSiteMetadataImageCacheSettingsSQLiteStore _statementsForMigrationToSchemaVersion:](self, "_statementsForMigrationToSchemaVersion:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v9) = -[WBSSiteMetadataImageCacheSettingsSQLiteStore _performMigrationStepToSchemaVersion:withStatements:](self, "_performMigrationStepToSchemaVersion:withStatements:", v10, v11);

      }
      while (v8 != v10++ && v9);
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    v9 = -[WBSSiteMetadataImageCacheSettingsSQLiteStore _createNewDatabaseSchema](self, "_createNewDatabaseSchema");
  }

  return v9;
}

- (WBSSiteMetadataImageCacheSettingsSQLiteStore)initWithDatabaseURL:(id)a3
{
  return -[WBSSiteMetadataImageCacheSettingsSQLiteStore initWithDatabaseURL:protectionType:](self, "initWithDatabaseURL:protectionType:", a3, 0);
}

- (void)close
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__WBSSiteMetadataImageCacheSettingsSQLiteStore_close__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_sync(databaseQueue, block);
}

uint64_t __53__WBSSiteMetadataImageCacheSettingsSQLiteStore_close__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabase");
}

- (void)_closeDatabase
{
  if (!self->_isClosed)
  {
    -[WBSSQLiteDatabase close](self->_database, "close");
    self->_isClosed = 1;
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSSiteMetadataImageCacheSettingsSQLiteStore;
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore dealloc](&v2, sel_dealloc);
}

- (BOOL)_createNewDatabaseSchema
{
  void *v3;
  int v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore _createNewDatabaseSQLiteStatement](self, "_createNewDatabaseSQLiteStatement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "execute");
  objc_msgSend(v3, "invalidate");
  if (v4 == 101)
  {
    v5 = -[WBSSiteMetadataImageCacheSettingsSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", objc_msgSend((id)objc_opt_class(), "databaseSchemaVersion")) == 101;
  }
  else
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSiteMetadataImageCacheSettingsSQLiteStore _createNewDatabaseSchema].cold.1(v7, (uint64_t)v9, v4);
    }

    v5 = 0;
  }

  return v5;
}

- (BOOL)_performMigrationStepToSchemaVersion:(int64_t)a3 withStatements:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(_QWORD);
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  int v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[5];
  _QWORD v37[4];
  id v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v7 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke;
    v37[3] = &unk_1E54425B0;
    v8 = v6;
    v38 = v8;
    v9 = (void (**)(_QWORD))MEMORY[0x1A85D45E4](v37);
    v36[0] = v7;
    v36[1] = 3221225472;
    v36[2] = __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke_2;
    v36[3] = &unk_1E54425B0;
    v36[4] = self;
    v10 = (void (**)(_QWORD))MEMORY[0x1A85D45E4](v36);
    v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("BEGIN TRANSACTION"));
    if (v11 == 101)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(v12);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "execute", (_QWORD)v32);
            if (v16 != 101)
            {
              v20 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                v26 = (objc_class *)objc_opt_class();
                NSStringFromClass(v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v41 = v27;
                v42 = 2112;
                v43 = v28;
                v44 = 1024;
                v45 = v16;
                _os_log_error_impl(&dword_1A840B000, v20, OS_LOG_TYPE_ERROR, "Failed to execute migration sql statement: %@ %@ (%d)", buf, 0x1Cu);

              }
              goto LABEL_21;
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
          if (v13)
            continue;
          break;
        }
      }

      if (-[WBSSiteMetadataImageCacheSettingsSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", a3) == 101)
      {
        v17 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(self->_database, 0, CFSTR("COMMIT TRANSACTION"));
        if (v17 == 101)
        {
          v9[2](v9);
          v18 = 1;
LABEL_24:

          goto LABEL_25;
        }
        v22 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v41 = v30;
          v42 = 2112;
          v43 = v31;
          v44 = 1024;
          v45 = v17;
          _os_log_error_impl(&dword_1A840B000, v22, OS_LOG_TYPE_ERROR, "Failed to start a transaction while migrating: %@ %@ (%d)", buf, 0x1Cu);

        }
      }
      else
      {
LABEL_21:
        v10[2](v10);
      }
      v9[2](v9);
    }
    else
    {
      v19 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v41 = v24;
        v42 = 2112;
        v43 = v25;
        v44 = 1024;
        v45 = v11;
        _os_log_error_impl(&dword_1A840B000, v19, OS_LOG_TYPE_ERROR, "Failed to start a transaction while migrating: %@ %@ (%d)", buf, 0x1Cu);

      }
      v9[2](v9);
    }
    v18 = 0;
    goto LABEL_24;
  }
  v18 = -[WBSSiteMetadataImageCacheSettingsSQLiteStore _setDatabaseSchemaVersion:](self, "_setDatabaseSchemaVersion:", a3) == 101;
LABEL_25:

  return v18;
}

void __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = 0u;
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v6;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v6 != v3)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4++), "invalidate", (_QWORD)v5);
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    }
    while (v2);
  }

}

void __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke_2(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 8), 0, CFSTR("ROLLBACK TRANSACTION"));
  if (v2 != 101)
  {
    v3 = v2;
    v4 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lastErrorMessage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke_2_cold_1(v5, (uint64_t)v6, v3);
    }

  }
}

- (int)_setDatabaseSchemaVersion:(int)a3
{
  WBSSQLiteDatabase *database;
  void *v6;
  int v7;
  NSObject *v8;
  void *v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  database = self->_database;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %d"), *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(database, 0, v6);

  if (v7 != 101)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v12 = a3;
      v13 = 2112;
      v14 = v10;
      v15 = 1024;
      v16 = v7;
      _os_log_error_impl(&dword_1A840B000, v8, OS_LOG_TYPE_ERROR, "Failed to set the database schema version to %d: %@ (%d)", buf, 0x18u);

    }
  }
  return v7;
}

- (void)_checkpointWriteAheadLogOnInternalQueue
{
  void *v3;
  id v4;
  dispatch_block_t v5;
  _QWORD v6[5];
  id v7;

  v3 = (void *)os_transaction_create();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __87__WBSSiteMetadataImageCacheSettingsSQLiteStore__checkpointWriteAheadLogOnInternalQueue__block_invoke;
  v6[3] = &unk_1E54413C0;
  v6[4] = self;
  v7 = v3;
  v4 = v3;
  v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_DETACHED, QOS_CLASS_BACKGROUND, 0, v6);
  _os_activity_initiate(&dword_1A840B000, "Cleaning WAL", OS_ACTIVITY_FLAG_DETACHED, v5);

}

void __87__WBSSiteMetadataImageCacheSettingsSQLiteStore__checkpointWriteAheadLogOnInternalQueue__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t buf[4];
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = 0;
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "checkpointWriteAheadLogWithLogFrameCount:checkpointedFrameCount:", (char *)&v2 + 4, &v2))
  {
    v1 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v4 = HIDWORD(v2);
      v5 = 1024;
      v6 = v2;
      _os_log_impl(&dword_1A840B000, v1, OS_LOG_TYPE_INFO, "Checkpointed write ahead log (WAL). Log frame count: %d, checkpointed frame count: %d", buf, 0xEu);
    }
  }
}

- (id)entryWithHost:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__21;
  v16 = __Block_byref_object_dispose__21;
  v17 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__WBSSiteMetadataImageCacheSettingsSQLiteStore_entryWithHost___block_invoke;
  block[3] = &unk_1E5445EE8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __62__WBSSiteMetadataImageCacheSettingsSQLiteStore_entryWithHost___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_selectEntrySQLiteStatementWithHost:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "cacheSettingsEntryClass")), "initWithSQLiteRow:", v3);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  objc_msgSend(v7, "invalidate");

}

- (id)saveEntry:(id)a3
{
  id v4;
  NSObject *databaseQueue;
  id v6;
  id v7;
  _QWORD block[4];
  id v10;
  WBSSiteMetadataImageCacheSettingsSQLiteStore *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__21;
  v17 = __Block_byref_object_dispose__21;
  v18 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WBSSiteMetadataImageCacheSettingsSQLiteStore_saveEntry___block_invoke;
  block[3] = &unk_1E5445F10;
  v11 = self;
  v12 = &v13;
  v10 = v4;
  v6 = v4;
  dispatch_sync(databaseQueue, block);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __58__WBSSiteMetadataImageCacheSettingsSQLiteStore_saveEntry___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(a1 + 32), "databaseID");
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  if (v2)
    objc_msgSend(v3, "_updateEntry:", v4);
  else
    objc_msgSend(v3, "_insertEntry:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_insertEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore _insertEntrySQLiteStatementWithEntry:](self, "_insertEntrySQLiteStatementWithEntry:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "execute");
  objc_msgSend(v5, "invalidate");
  if (v6 == 101)
  {
    objc_msgSend(v4, "entryWithDatabaseID:", -[WBSSQLiteDatabase lastInsertRowID](self->_database, "lastInsertRowID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 141558787;
      v12 = 1752392040;
      v13 = 2117;
      v14 = v4;
      v15 = 2112;
      v16 = v10;
      v17 = 1024;
      v18 = v6;
      _os_log_error_impl(&dword_1A840B000, v8, OS_LOG_TYPE_ERROR, "Failed to insert cache settings entry for host = %{sensitive, mask.hash}@: %@ (%d)", (uint8_t *)&v11, 0x26u);

    }
    v7 = 0;
  }

  return v7;
}

- (id)_updateEntry:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBSSiteMetadataImageCacheSettingsSQLiteStore _updateEntrySQLiteStatementWithEntry:](self, "_updateEntrySQLiteStatementWithEntry:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "execute");
  objc_msgSend(v5, "invalidate");
  if (v6 == 101)
  {
    v7 = v4;
  }
  else
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self->_database, "lastErrorMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 141558787;
      v12 = 1752392040;
      v13 = 2117;
      v14 = v4;
      v15 = 2112;
      v16 = v10;
      v17 = 1024;
      v18 = v6;
      _os_log_error_impl(&dword_1A840B000, v8, OS_LOG_TYPE_ERROR, "Failed to insert cache settings entry for host = %{sensitive, mask.hash}@: %@ (%d)", (uint8_t *)&v11, 0x26u);

    }
    v7 = 0;
  }

  return v7;
}

- (BOOL)deleteEntryWithHost:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *databaseQueue;
  id v7;
  BOOL v8;
  _QWORD block[5];
  id v11;
  _BYTE *v12;
  _BYTE buf[24];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 141558275;
    *(_QWORD *)&buf[4] = 1752392040;
    *(_WORD *)&buf[12] = 2117;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl(&dword_1A840B000, v5, OS_LOG_TYPE_DEFAULT, "Removed Touch Icon from database; host=%{sensitive, mask.hash}@",
      buf,
      0x16u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v14 = 0;
  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteEntryWithHost___block_invoke;
  block[3] = &unk_1E5445EE8;
  block[4] = self;
  v11 = v4;
  v12 = buf;
  v7 = v4;
  dispatch_sync(databaseQueue, block);
  v8 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24) == 101;

  _Block_object_dispose(buf, 8);
  return v8;
}

void __68__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteEntryWithHost___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_deleteEntrySQLiteStatementWithHost:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "execute");
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 101)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lastErrorMessage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v7 = 141558787;
      v8 = 1752392040;
      v9 = 2117;
      v10 = v4;
      v11 = 2112;
      v12 = v5;
      v13 = 1024;
      v14 = v6;
      _os_log_error_impl(&dword_1A840B000, v3, OS_LOG_TYPE_ERROR, "Failed to delete entry with host %{sensitive, mask.hash}@: %@ (%d)", (uint8_t *)&v7, 0x26u);

    }
  }
  objc_msgSend(v2, "invalidate");

}

- (BOOL)deleteAllEntries
{
  NSObject *databaseQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  databaseQueue = self->_databaseQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteAllEntries__block_invoke;
  v5[3] = &unk_1E5445F38;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(databaseQueue, v5);
  v3 = *((_DWORD *)v7 + 6) == 101;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __64__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteAllEntries__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_deleteAllEntriesSQLiteStatement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "execute");
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 101)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "lastErrorMessage");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      __64__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteAllEntries__block_invoke_cold_1(v4, a1 + 40, (uint64_t)v5, v3);
    }

  }
  objc_msgSend(v2, "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "_checkpointWriteAheadLogOnInternalQueue");

}

- (void)performMaintenanceWork
{
  NSObject *databaseQueue;
  _QWORD block[5];

  databaseQueue = self->_databaseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__WBSSiteMetadataImageCacheSettingsSQLiteStore_performMaintenanceWork__block_invoke;
  block[3] = &unk_1E54425B0;
  block[4] = self;
  dispatch_async(databaseQueue, block);
}

uint64_t __70__WBSSiteMetadataImageCacheSettingsSQLiteStore_performMaintenanceWork__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkpointWriteAheadLogOnInternalQueue");
}

+ (Class)cacheSettingsEntryClass
{
  return 0;
}

+ (int64_t)databaseSchemaVersion
{
  return 0;
}

- (id)_createNewDatabaseSQLiteStatement
{
  return 0;
}

- (id)_selectAllEntriesSQLiteStatement
{
  return 0;
}

- (id)_selectEntrySQLiteStatementWithHost:(id)a3
{
  return 0;
}

- (id)_insertEntrySQLiteStatementWithEntry:(id)a3
{
  return 0;
}

- (id)_updateEntrySQLiteStatementWithEntry:(id)a3
{
  return 0;
}

- (id)_deleteEntrySQLiteStatementWithHost:(id)a3
{
  return 0;
}

- (id)_deleteAllEntriesSQLiteStatement
{
  return 0;
}

- (id)_statementsForMigrationToSchemaVersion:(int64_t)a3
{
  return 0;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_databaseQueue, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (void)_openDatabase:(uint8_t *)buf andCheckIntegrity:(os_log_t)log .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 141558531;
  *(_QWORD *)(buf + 4) = 1752392040;
  *((_WORD *)buf + 6) = 2117;
  *(_QWORD *)(buf + 14) = a1;
  *((_WORD *)buf + 11) = 2112;
  *((_QWORD *)buf + 3) = a2;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Failed to enable write-ahead logging on cache settings store at %{sensitive, mask.hash}@: %@", buf, 0x20u);

  OUTLINED_FUNCTION_1_0();
}

- (void)_checkDatabaseIntegrity
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A840B000, a2, OS_LOG_TYPE_ERROR, "Failed database integrity check: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_createNewDatabaseSchema
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_10(&dword_1A840B000, "Failed to create the cache_settings table: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_1_0();
}

void __100__WBSSiteMetadataImageCacheSettingsSQLiteStore__performMigrationStepToSchemaVersion_withStatements___block_invoke_2_cold_1(void *a1, uint64_t a2, int a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_0_10(&dword_1A840B000, "Failed to roll back transaction: %@ (%d)", v4, v5);

  OUTLINED_FUNCTION_1_0();
}

void __64__WBSSiteMetadataImageCacheSettingsSQLiteStore_deleteAllEntries__block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  int v5;

  v5 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 24);
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = v5;
  OUTLINED_FUNCTION_0_10(&dword_1A840B000, "Failed to delete all entries: %@ (%d)", (uint8_t *)a3, a4);

  OUTLINED_FUNCTION_1_0();
}

@end
