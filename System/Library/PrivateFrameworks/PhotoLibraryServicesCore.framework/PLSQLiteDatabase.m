@implementation PLSQLiteDatabase

+ (int)dataProtectionOpenFlagForPath:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLFileSystemCapabilities capabilitiesWithURL:](PLFileSystemCapabilities, "capabilitiesWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = +[PLSQLiteDatabase dataProtectionOpenFlagForCapabilities:](PLSQLiteDatabase, "dataProtectionOpenFlagForCapabilities:", v4);
  return (int)v3;
}

+ (int)dataProtectionOpenFlagForCapabilities:(id)a3
{
  if (objc_msgSend(a3, "supportsDataProtection"))
    return 3145728;
  else
    return 0;
}

- (PLSQLiteDatabase)initWithOpenedSQLite3Database:(sqlite3 *)a3
{
  PLSQLiteDatabase *v4;
  PLSQLiteDatabase *v5;
  PLSQLiteDatabase *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLSQLiteDatabase;
  v4 = -[PLSQLiteDatabase init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_database = a3;
    v6 = v4;
  }

  return v5;
}

- (BOOL)close
{
  int v2;
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = sqlite3_close(self->_database);
  if (v2)
  {
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315394;
      v6 = sqlite3_errstr(v2);
      v7 = 1024;
      v8 = v2;
      _os_log_impl(&dword_199DF7000, v3, OS_LOG_TYPE_DEFAULT, "Failed to close database: %s (%d).", (uint8_t *)&v5, 0x12u);
    }

  }
  return v2 == 0;
}

- (BOOL)beginDeferredTransaction
{
  return -[PLSQLiteDatabase _execute:](self, "_execute:", CFSTR("BEGIN DEFERRED TRANSACTION"));
}

- (BOOL)beginExclusiveTransaction
{
  return -[PLSQLiteDatabase _execute:](self, "_execute:", CFSTR("BEGIN EXCLUSIVE TRANSACTION"));
}

- (BOOL)commitTransaction
{
  return -[PLSQLiteDatabase _execute:](self, "_execute:", CFSTR("COMMIT"));
}

- (BOOL)rollbackTransaction
{
  return -[PLSQLiteDatabase _execute:](self, "_execute:", CFSTR("ROLLBACK"));
}

- (BOOL)prepareAndEvaluateStatement:(id)a3
{
  return -[PLSQLiteDatabase prepareStatement:andStepThroughResultsWithBlock:](self, "prepareStatement:andStepThroughResultsWithBlock:", a3, &__block_literal_global_662);
}

- (BOOL)prepareStatement:(id)a3 andStepThroughResultsWithBlock:(id)a4
{
  void (**v6)(id, sqlite3_stmt *, char *);
  sqlite3_stmt *v7;
  sqlite3_stmt *v8;
  int v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  const char *v13;
  char v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, sqlite3_stmt *, char *))a4;
  v7 = -[PLSQLiteDatabase _prepareStatement:](self, "_prepareStatement:", a3);
  if (v7)
  {
    v8 = v7;
    v15 = 0;
    while (1)
    {
      v9 = sqlite3_step(v8);
      if (v9 != 100)
        break;
      v6[2](v6, v8, &v15);
      if (v15)
      {
        v10 = 1;
        goto LABEL_12;
      }
    }
    v11 = v9;
    if (v9 == 101)
    {
      v10 = 1;
      v15 = 1;
    }
    else
    {
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = sqlite3_errmsg(self->_database);
        *(_DWORD *)buf = 136315394;
        v17 = v13;
        v18 = 1024;
        v19 = v11;
        _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_DEFAULT, "Failed to step statement: %s (%d)", buf, 0x12u);
      }

      v10 = 0;
      v15 = 1;
    }
LABEL_12:
    sqlite3_finalize(v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (sqlite3_stmt)_prepareStatement:(id)a3
{
  id v4;
  const char *v5;
  int v6;
  int v7;
  int v8;
  NSObject *v9;
  const char *v10;
  sqlite3_stmt *v11;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  v5 = (const char *)objc_msgSend(v4, "UTF8String");
  v6 = strlen(v5);
  ppStmt = 0;
  v7 = sqlite3_prepare_v2(self->_database, v5, v6 + 1, &ppStmt, 0);
  if (v7)
  {
    v8 = v7;
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = sqlite3_errmsg(self->_database);
      *(_DWORD *)buf = 138412802;
      v15 = v4;
      v16 = 2080;
      v17 = v10;
      v18 = 1024;
      v19 = v8;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "Failed to prepare \"%@\": %s (%d)", buf, 0x1Cu);
    }

  }
  v11 = ppStmt;

  return v11;
}

- (BOOL)_execute:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  char *errmsg;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease(a3);
  errmsg = 0;
  v5 = sqlite3_exec(self->_database, (const char *)objc_msgSend(v4, "UTF8String"), 0, 0, &errmsg);
  if (v5)
  {
    PLBackendGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v10 = v4;
      v11 = 2080;
      v12 = errmsg;
      v13 = 1024;
      v14 = v5;
      _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEFAULT, "Failed to execute \"%@\": %s (%d)", buf, 0x1Cu);
    }

  }
  return v5 == 0;
}

void __48__PLSQLiteDatabase_prepareAndEvaluateStatement___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  *a3 = 1;
}

+ (int)setLockProxyFileForDatabase:(sqlite3 *)a3 lockFilePath:(id)a4
{
  id v5;
  char *v6;
  char *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  char *errmsg;
  uint8_t buf[4];
  _DWORD v14[7];

  *(_QWORD *)&v14[5] = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a4);
  v6 = sqlite3_mprintf("PRAGMA lock_proxy_file = %Q", objc_msgSend(v5, "fileSystemRepresentation"));
  if (v6)
  {
    v7 = v6;
    errmsg = 0;
    v8 = sqlite3_exec(a3, v6, 0, 0, &errmsg);
    if (v8)
    {
      PLBackendGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109378;
        v14[0] = v8;
        LOWORD(v14[1]) = 2080;
        *(_QWORD *)((char *)&v14[1] + 2) = errmsg;
        _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "Failed to set lock_proxy_file - %d %s", buf, 0x12u);
      }

      sqlite3_free(errmsg);
      errmsg = 0;
    }
    sqlite3_free(v7);
  }
  else
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v14 = v5;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_ERROR, "Failed to set lock_proxy_file (statement parse error) for path: %@", buf, 0xCu);
    }

    v8 = 1;
  }

  return v8;
}

+ (id)openDatabaseAtPath:(id)a3 capabilities:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  PLSQLiteDatabase *v9;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  v8 = objc_msgSend(a1, "_openSQLiteDatabaseAtPath:capabilities:", objc_msgSend(v6, "UTF8String"), v7);

  if (v8)
    v9 = -[PLSQLiteDatabase initWithOpenedSQLite3Database:]([PLSQLiteDatabase alloc], "initWithOpenedSQLite3Database:", v8);
  else
    v9 = 0;
  return v9;
}

+ (sqlite3)_openSQLiteDatabaseAtPath:(const char *)a3 capabilities:(id)a4
{
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  int v12;
  NSObject *v13;
  sqlite3 *v14;
  void *v16;
  char *errmsg;
  sqlite3 *ppDb;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLSQLiteDatabase.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path != NULL"));

  }
  ppDb = 0;
  v8 = sqlite3_open_v2(a3, &ppDb, +[PLSQLiteDatabase dataProtectionOpenFlagForCapabilities:](PLSQLiteDatabase, "dataProtectionOpenFlagForCapabilities:", v7) | 2, 0);
  if (v8)
  {
    v9 = v8;
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v20 = v9;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEFAULT, "Failed to open DB - %d", buf, 8u);
    }

    v11 = 1;
  }
  else
  {
    errmsg = 0;
    v12 = sqlite3_exec(ppDb, "PRAGMA journal_mode = WAL", 0, 0, &errmsg);
    if (v12)
    {
      PLBackendGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v20 = v12;
        v21 = 2080;
        v22 = errmsg;
        _os_log_impl(&dword_199DF7000, v13, OS_LOG_TYPE_DEFAULT, "Failed to enable WAL - %d %s", buf, 0x12u);
      }

    }
    v11 = v12 != 0;
  }
  v14 = ppDb;
  if (v11 && ppDb)
  {
    sqlite3_close(ppDb);
    v14 = 0;
  }

  return v14;
}

@end
