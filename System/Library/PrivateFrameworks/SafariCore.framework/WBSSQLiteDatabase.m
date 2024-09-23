@implementation WBSSQLiteDatabase

- (BOOL)openWithAccessType:(int64_t)a3 protectionType:(int64_t)a4 vfs:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  BOOL v16;

  v10 = a5;
  v11 = 1;
  switch(a3)
  {
    case 0:
      goto LABEL_3;
    case 1:
      v11 = 0;
LABEL_3:
      v12 = 32769;
      break;
    case 2:
      v12 = 32770;
      break;
    case 3:
      v12 = 32774;
      break;
    default:
      v12 = 0x8000;
      break;
  }
  v13 = v12 | 0x300000;
  v14 = v12 | 0x200000;
  if (a4 == 3)
    v12 |= 0x100000u;
  if (a4 == 2)
    v12 = v14;
  if ((unint64_t)a4 >= 2)
    v15 = v12;
  else
    v15 = v13;
  v16 = -[WBSSQLiteDatabase _openWithFlags:useLock:vfs:error:](self, "_openWithFlags:useLock:vfs:error:", v15, v11, v10, a6);

  return v16;
}

+ (id)inMemoryDatabaseURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("file::memory:"));
}

+ (id)privateOnDiskDatabaseURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("safari::privateondisk:"));
}

- (sqlite3)handle
{
  return self->_handle;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)openWithAccessType:(int64_t)a3 error:(id *)a4
{
  return -[WBSSQLiteDatabase openWithAccessType:vfs:error:](self, "openWithAccessType:vfs:error:", a3, 0, a4);
}

- (BOOL)openWithAccessType:(int64_t)a3 vfs:(id)a4 error:(id *)a5
{
  return -[WBSSQLiteDatabase openWithAccessType:protectionType:vfs:error:](self, "openWithAccessType:protectionType:vfs:error:", a3, 0, a4, a5);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WBSSQLiteDatabase)initWithURL:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  WBSSQLiteDatabase *v8;
  uint64_t v9;
  NSURL *url;
  WBSSQLiteDatabase *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBSSQLiteDatabase;
  v8 = -[WBSSQLiteDatabase init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_queue, a4);
    v11 = v8;
  }

  return v8;
}

- (BOOL)enableWAL:(id *)a3
{
  return SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<std::__ignore_t<unsigned char> const&>>(self, (uint64_t)a3, CFSTR("PRAGMA journal_mode = WAL"));
}

- (id)fetchQuery:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_storeStrong((id *)&self->_lastSQLQuery, a3);
  SafariShared::WBSSQLiteDatabaseFetch<>(self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)initialize
{
  objc_msgSend(MEMORY[0x1E0CB35C8], "setUserInfoValueProviderForDomain:provider:", CFSTR("com.apple.Safari.SQLite"), &__block_literal_global_59);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSSQLiteDatabase;
  -[WBSSQLiteDatabase dealloc](&v2, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastSQLQuery, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (int)close
{
  int v3;
  NSObject *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v3 = sqlite3_close_v2(self->_handle);
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self, "lastErrorMessage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteDatabase close].cold.1(v5, (uint64_t)v7, v3);
    }

  }
  else
  {
    self->_handle = 0;
  }
  return v3;
}

id __31__WBSSQLiteDatabase_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("WBSPrivacyPreservingDescription")))
    {
      errorStringForCode(objc_msgSend(v4, "code"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB2D50]))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      errorStringForCode(objc_msgSend(v4, "code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        objc_msgSend(v8, "addObject:", v9);

      objc_msgSend(v6, "safari_stringForKey:", CFSTR("Message"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v8, "addObject:", v10);

      objc_msgSend(v6, "safari_stringForKey:", CFSTR("SQL"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v8, "addObject:", v11);

      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(": "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (void)_reportSevereError:(id)a3
{
  id v4;
  id WeakRetained;
  qos_class_t v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;
  WBSSQLiteDatabase *v10;
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = qos_class_self();
    dispatch_get_global_queue(v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__WBSSQLiteDatabase__reportSevereError___block_invoke;
    block[3] = &unk_1E649A6B0;
    v9 = WeakRetained;
    v10 = self;
    v11 = v4;
    dispatch_async(v7, block);

  }
}

uint64_t __40__WBSSQLiteDatabase__reportSevereError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "database:hadSevereError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (BOOL)reportErrorWithCode:(int)a3 statement:(sqlite3_stmt *)a4 error:(id *)a5
{
  uint64_t v6;
  char *v8;
  char *v9;
  void *v10;
  BOOL v11;

  v6 = *(_QWORD *)&a3;
  if (!a4)
    return -[WBSSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", v6, 0, a5);
  v8 = sqlite3_expanded_sql(a4);
  if (!v8)
    return -[WBSSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", v6, 0, a5);
  v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WBSSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", v6, v10, a5);

  sqlite3_free(v9);
  return v11;
}

- (BOOL)reportErrorWithCode:(int)a3 query:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  void *v10;
  NSURL *url;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  if (url)
  {
    v12 = (void *)-[NSURL copy](url, "copy");
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB3308]);

  }
  if ((a3 - 100) >= 2)
  {
    if (a3)
    {
      v9 = sqlite3_errmsg(self->_handle);
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("Message"));

      }
    }
  }
  if (v8)
  {
    v14 = (void *)objc_msgSend(v8, "copy", v9);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("SQL"));

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.SQLite"), a3, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a5)
  {
    *a5 = objc_retainAutorelease(v15);
  }
  else
  {
    v17 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "safari_privacyPreservingDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteDatabase reportErrorWithCode:query:error:].cold.1(v18, (uint64_t)v20, v17);
    }

  }
  if ((a3 & 0xFFFFFFFE) == 0xA)
    -[WBSSQLiteDatabase _reportSevereError:](self, "_reportSevereError:", v16);

  return 0;
}

- (BOOL)executeQuery:(id)a3 error:(id *)a4
{
  id v7;
  sqlite3 *handle;
  id v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  sqlite3_stmt *ppStmt;

  v7 = a3;
  objc_storeStrong((id *)&self->_lastSQLQuery, a3);
  ppStmt = 0;
  handle = self->_handle;
  v9 = objc_retainAutorelease(v7);
  v10 = sqlite3_prepare_v2(handle, (const char *)objc_msgSend(v9, "UTF8String"), -1, &ppStmt, 0);
  if ((_DWORD)v10)
  {
    -[WBSSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", v10, v9, a4);
    if (ppStmt)
      sqlite3_finalize(ppStmt);
    v11 = 0;
  }
  else
  {
    v12 = sqlite3_step(ppStmt);
    v11 = (_DWORD)v12 == 101 || (_DWORD)v12 == 0;
    if ((_DWORD)v12 && (_DWORD)v12 != 101)
      -[WBSSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", v12, v9, a4);
    sqlite3_finalize(ppStmt);
  }

  return v11;
}

- (id)fetchQuery:(id)a3 stringArguments:(id)a4
{
  id v7;
  id v8;
  WBSSQLiteStatement *v9;
  WBSSQLiteStatement *v10;
  void *v11;
  _QWORD v13[4];
  WBSSQLiteStatement *v14;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_lastSQLQuery, a3);
  v9 = -[WBSSQLiteStatement initWithDatabase:query:]([WBSSQLiteStatement alloc], "initWithDatabase:query:", self, v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__WBSSQLiteDatabase_fetchQuery_stringArguments___block_invoke;
  v13[3] = &unk_1E64A0110;
  v10 = v9;
  v14 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);
  -[WBSSQLiteStatement fetch](v10, "fetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __48__WBSSQLiteDatabase_fetchQuery_stringArguments___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "bindString:atParameterIndex:", a2, a3 + 1);
}

- (int)checkpointWriteAheadLogWithLogFrameCount:(int *)a3 checkpointedFrameCount:(int *)a4
{
  int v5;
  NSObject *v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v5 = sqlite3_wal_checkpoint_v2(self->_handle, 0, 2, a3, a4);
  if (v5)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase lastErrorMessage](self, "lastErrorMessage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteDatabase checkpointWriteAheadLogWithLogFrameCount:checkpointedFrameCount:].cold.1(v7, (uint64_t)v9, v5);
    }

  }
  return v5;
}

- (int)lastErrorCode
{
  return sqlite3_extended_errcode(self->_handle);
}

- (NSString)lastErrorMessage
{
  void *v2;

  v2 = (void *)sqlite3_errmsg(self->_handle);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v2;
}

- (int64_t)lastInsertRowID
{
  return sqlite3_last_insert_rowid(self->_handle);
}

- (int64_t)changedRowCount
{
  return sqlite3_changes(self->_handle);
}

- (id)lastErrorWithMethodName:(const char *)a3
{
  void *v5;
  void *v6;
  NSString *lastSQLQuery;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  lastSQLQuery = self->_lastSQLQuery;
  if (lastSQLQuery)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", lastSQLQuery, CFSTR("SQL"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("MethodName"));

  objc_msgSend((id)objc_opt_class(), "_errorWithErrorCode:userInfo:", -[WBSSQLiteDatabase lastErrorCode](self, "lastErrorCode"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_openWithFlags:(int)a3 useLock:(BOOL)a4 vfs:(id)a5 error:(id *)a6
{
  id v10;
  id *p_url;
  NSURL *url;
  void *v13;
  char v14;
  __CFString *v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  sqlite3 **p_handle;
  uint64_t v26;
  void *v27;
  BOOL v28;
  NSObject *v29;
  uint64_t v30;

  v10 = a5;
  p_url = (id *)&self->_url;
  url = self->_url;
  +[WBSSQLiteDatabase inMemoryDatabaseURL](WBSSQLiteDatabase, "inMemoryDatabaseURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSURL isEqual:](url, "isEqual:", v13);

  if ((v14 & 1) != 0)
  {
    v15 = CFSTR("file::memory:");
  }
  else
  {
    v16 = *p_url;
    +[WBSSQLiteDatabase privateOnDiskDatabaseURL](WBSSQLiteDatabase, "privateOnDiskDatabaseURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
    {
      v15 = &stru_1E64A2498;
    }
    else
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*p_url, "path");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v19, "stringWithFormat:", CFSTR("file:%s"), objc_msgSend(v20, "fileSystemRepresentation"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_url, "URLByDeletingLastPathComponent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "safari_ensureDirectoryExists:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        if (a6)
        {
          v29 = WBS_LOG_CHANNEL_PREFIXSQLite();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[WBSSQLiteDatabase _openWithFlags:useLock:vfs:error:].cold.1((uint64_t *)&self->_url, v29, v30);
          objc_msgSend((id)objc_opt_class(), "_errorWithErrorCode:userInfo:", 14, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
LABEL_17:
        v28 = 0;
        goto LABEL_18;
      }
    }
  }
  if (!a4)
  {
    -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", CFSTR("?nolock=1"));
    v24 = objc_claimAutoreleasedReturnValue();

    v15 = (__CFString *)v24;
  }
  v15 = objc_retainAutorelease(v15);
  p_handle = &self->_handle;
  v26 = sqlite3_open_v2((const char *)-[__CFString UTF8String](v15, "UTF8String"), &self->_handle, a3, (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
  if (!(_DWORD)v26)
  {
    v28 = 1;
    goto LABEL_18;
  }
  sqlite3_close_v2(*p_handle);
  *p_handle = 0;
  if (!a6)
    goto LABEL_17;
  objc_msgSend((id)objc_opt_class(), "_errorWithErrorCode:userInfo:", v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v28 = 0;
  *a6 = v27;
LABEL_18:

  return v28;
}

+ (id)_errorWithErrorCode:(int)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errstr(a3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("Message"));
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Safari.SQLite"), a3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)writeAheadLogURLForDatabaseURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-wal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)writeAheadLogSharedMemoryURLForDatabaseURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("-shm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setBusyTimeout:(double)a3
{
  sqlite3_busy_timeout(self->_handle, (int)(a3 * 1000.0));
}

- (WBSSQLiteDatabaseDelegate)delegate
{
  return (WBSSQLiteDatabaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSURL)url
{
  return self->_url;
}

- (BOOL)tryToPerformTransactionInBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  BOOL v5;
  id v6;
  BOOL v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v16;
  id v17;
  id v18;
  _BYTE v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(_QWORD))a3;
  if (-[WBSSQLiteDatabase handle](self, "handle"))
  {
    v18 = 0;
    v5 = -[WBSSQLiteDatabase executeQuery:error:](self, "executeQuery:error:", CFSTR("BEGIN TRANSACTION"), &v18);
    v6 = v18;
    if (v5)
    {
      if ((v4[2](v4) & 1) != 0)
      {
        v16 = v6;
        v7 = -[WBSSQLiteDatabase executeQuery:error:](self, "executeQuery:error:", CFSTR("COMMIT TRANSACTION"), &v16);
        v8 = v16;

        if (v7)
        {
          v9 = 1;
LABEL_17:

          goto LABEL_18;
        }
        v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "safari_privacyPreservingDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSSQLiteDatabase(Extras) tryToPerformTransactionInBlock:].cold.1(v13, (uint64_t)v19, v10);
        }
      }
      else
      {
        v17 = v6;
        v12 = -[WBSSQLiteDatabase executeQuery:error:](self, "executeQuery:error:", CFSTR("ROLLBACK TRANSACTION"), &v17);
        v8 = v17;

        if (v12)
        {
          v9 = 0;
          goto LABEL_17;
        }
        v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "safari_privacyPreservingDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSSQLiteDatabase(Extras) tryToPerformTransactionInBlock:].cold.2(v14, (uint64_t)v19, v10);
        }
      }
      v6 = v8;
    }
    else
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "safari_privacyPreservingDescription");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSSQLiteDatabase(Extras) tryToPerformTransactionInBlock:].cold.3(v11, (uint64_t)v19, v10);
      }
    }

    v9 = 0;
    v8 = v6;
    goto LABEL_17;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (id)checkIntegrity
{
  char v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v12;
  id v13;
  id v14;
  _BYTE buf[12];
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = 0;
  *(_QWORD *)buf = &v14;
  v3 = SafariShared::WBSSQLiteDatabaseEnumerate<std::tuple<NSString * {__strong}&>>(self, (uint64_t)&v13, CFSTR("PRAGMA integrity_check(128)"), (void ***)buf);
  v4 = v13;
  if ((v3 & 1) == 0)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase url](self, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject safari_privacyPreservingDescription](v4, "safari_privacyPreservingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v7;
      v16 = 2114;
      v17 = v8;
      v18 = 2112;
      v19 = v14;
      _os_log_error_impl(&dword_1B2621000, v6, OS_LOG_TYPE_ERROR, "Failed database integrity check on %@: %{public}@: %@", buf, 0x20u);

    }
    goto LABEL_9;
  }
  if ((objc_msgSend(v14, "isEqualToString:", CFSTR("ok")) & 1) == 0)
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXSQLite();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[WBSSQLiteDatabase url](self, "url");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSSQLiteDatabase(Extras) checkIntegrity].cold.1(v10, (uint64_t *)&v14, buf, v9);
    }

    v12 = v4;
    -[WBSSQLiteDatabase reportErrorWithCode:query:error:](self, "reportErrorWithCode:query:error:", 11, 0, &v12);
    v6 = v4;
    v4 = v12;
LABEL_9:

    v4 = v4;
    v5 = v4;
    goto LABEL_10;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

- (void)close
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_10((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B2621000, "Failed to close database: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (void)reportErrorWithCode:(void *)a1 query:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, a3, (uint64_t)a3, "Unhandled SQLite error: %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_0_3();
}

- (void)checkpointWriteAheadLogWithLogFrameCount:(int)a3 checkpointedFrameCount:.cold.1(void *a1, uint64_t a2, int a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_0_10((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1(&dword_1B2621000, "Failed to checkpoint database write ahead log: %{public}@ (%d)", v4, v5);

  OUTLINED_FUNCTION_0_3();
}

- (void)_openWithFlags:(uint64_t)a3 useLock:vfs:error:.cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138477827;
  v5 = v3;
  OUTLINED_FUNCTION_0_0(&dword_1B2621000, a2, a3, "Unable to create parent folder for database at path: %{private}@", (uint8_t *)&v4);
}

@end
