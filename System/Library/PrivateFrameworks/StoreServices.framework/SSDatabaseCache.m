@implementation SSDatabaseCache

- (SSDatabaseCache)initWithIdentifier:(id)a3 cacheName:(id)a4 database:(id)a5 cacheEntryClass:(Class)a6
{
  SSDatabaseCache *v10;
  void *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *global_queue;
  id v19;
  uint64_t v20;
  SSPersistentCache *v21;
  id v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  SSSQLiteDatabase *v39;
  uint64_t v40;
  int v41;
  int v42;
  uint64_t v43;
  id v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  _QWORD v66[2];
  _QWORD v67[3];

  v67[2] = *MEMORY[0x1E0C80C00];
  v10 = -[SSDatabaseCache init](self, "init");
  if (v10)
  {
    if (objc_msgSend(a3, "length") && objc_msgSend(a4, "length"))
    {
      v10->_maximumInlineBlobSize = 1024;
      v10->_identifier = (NSString *)objc_msgSend(a3, "copy");
      v10->_cacheName = (NSString *)objc_msgSend(a4, "copy");
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("Caches"), a3, a4, 0);
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v11);

      v13 = objc_alloc(MEMORY[0x1E0C99D20]);
      v14 = (objc_class *)objc_opt_class();
      v15 = (void *)objc_msgSend(v13, "initWithObjects:", NSStringFromClass(v14), a3, a4, 0);
      v16 = (void *)objc_msgSend(v15, "componentsJoinedByString:", CFSTR("."));

      v17 = dispatch_queue_create((const char *)objc_msgSend(v16, "UTF8String"), 0);
      v10->_serialQueue = (OS_dispatch_queue *)v17;
      global_queue = dispatch_get_global_queue(0, 0);
      dispatch_set_target_queue(v17, global_queue);
      v19 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      v59 = 0;
      v20 = *MEMORY[0x1E0CB2A58];
      v66[0] = *MEMORY[0x1E0CB2A98];
      v66[1] = v20;
      v67[0] = CFSTR("mobile");
      v67[1] = CFSTR("mobile");
      if ((objc_msgSend(v19, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2), &v59) & 1) != 0)
      {
        v21 = -[SSPersistentCache initWithIdentifier:cacheName:]([SSPersistentCache alloc], "initWithIdentifier:cacheName:", a3, a4);
        v10->_persistentCache = v21;
        if (v21)
        {
          if (a5)
          {
            v10->_database = (SSSQLiteDatabase *)a5;
          }
          else
          {
            v38 = objc_msgSend((id)objc_msgSend(v12, "stringByAppendingPathComponent:", a4), "stringByAppendingPathExtension:", CFSTR("db"));
            v39 = [SSSQLiteDatabase alloc];
            v40 = -[SSSQLiteDatabase initWithDatabaseURL:](v39, "initWithDatabaseURL:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v38, 0));
            v10->_database = (SSSQLiteDatabase *)v40;
            if (!v40)
            {
              v44 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
              if (!v44)
                v44 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
              v45 = objc_msgSend(v44, "shouldLog");
              if (objc_msgSend(v44, "shouldLogToDisk"))
                v46 = v45 | 2;
              else
                v46 = v45;
              if (!os_log_type_enabled((os_log_t)objc_msgSend(v44, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
                v46 &= 2u;
              if (v46)
              {
                v47 = objc_opt_class();
                v60 = 138412546;
                v61 = v47;
                v62 = 2112;
                v63 = v38;
                LODWORD(v58) = 22;
                v57 = &v60;
                v48 = _os_log_send_and_compose_impl();
                if (v48)
                {
                  v49 = (void *)v48;
                  v50 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v48, 4, &v60, v58);
                  free(v49);
                  SSFileLog(v44, CFSTR("%@"), v51, v52, v53, v54, v55, v56, v50);
                }
              }
            }
          }
          if (!a6)
            a6 = (Class)objc_opt_class();
          v10->_cacheEntryClass = a6;
          if (-[SSDatabaseCache _setupDatabase](v10, "_setupDatabase", v57))
            goto LABEL_30;
          v22 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
          if (!v22)
            v22 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v41 = objc_msgSend(v22, "shouldLog");
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v42 = v41 | 2;
          else
            v42 = v41;
          if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
            v42 &= 2u;
          if (!v42)
          {
LABEL_29:

            v10 = 0;
LABEL_30:

            return v10;
          }
          v43 = objc_opt_class();
          v60 = 138412290;
          v61 = v43;
          LODWORD(v58) = 12;
        }
        else
        {
          v22 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
          if (!v22)
            v22 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
          v26 = objc_msgSend(v22, "shouldLog");
          if (objc_msgSend(v22, "shouldLogToDisk"))
            v27 = v26 | 2;
          else
            v27 = v26;
          if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
            v27 &= 2u;
          if (!v27)
            goto LABEL_29;
          v28 = objc_opt_class();
          v60 = 138412546;
          v61 = v28;
          v62 = 2112;
          v63 = (uint64_t)v12;
          LODWORD(v58) = 22;
        }
      }
      else
      {
        v22 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
        if (!v22)
          v22 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v23 = objc_msgSend(v22, "shouldLog");
        if (objc_msgSend(v22, "shouldLogToDisk"))
          v24 = v23 | 2;
        else
          v24 = v23;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
          v24 &= 2u;
        if (!v24)
          goto LABEL_29;
        v25 = objc_opt_class();
        v60 = 138412802;
        v61 = v25;
        v62 = 2112;
        v63 = (uint64_t)v12;
        v64 = 2112;
        v65 = v59;
        LODWORD(v58) = 32;
      }
      v29 = (void *)_os_log_send_and_compose_impl();
      if (v29)
      {
        v30 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v29, 4, &v60, v58);
        free(v29);
        SSFileLog(v22, CFSTR("%@"), v31, v32, v33, v34, v35, v36, v30);
      }
      goto LABEL_29;
    }

    return 0;
  }
  return v10;
}

- (SSDatabaseCache)initWithIdentifier:(id)a3 cacheName:(id)a4
{
  return -[SSDatabaseCache initWithIdentifier:cacheName:database:cacheEntryClass:](self, "initWithIdentifier:cacheName:database:cacheEntryClass:", a3, a4, 0, objc_opt_class());
}

- (void)dealloc
{
  NSObject *serialQueue;
  objc_super v4;

  serialQueue = self->_serialQueue;
  if (serialQueue)
    dispatch_release(serialQueue);

  v4.receiver = self;
  v4.super_class = (Class)SSDatabaseCache;
  -[SSDatabaseCache dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ : %p> - [ID: %@] [Name: %@] [Max Inline: %u] [DB: %@]"), objc_opt_class(), self, self->_identifier, self->_cacheName, self->_maximumInlineBlobSize, self->_database);
}

- (BOOL)_setupDatabase
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[objc_class databaseTable](self->_cacheEntryClass, "databaseTable");
  v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (pid INTEGER, lookup_key TEXT,data_blob BLOB, data_size INTEGER, date_inserted INTEGER, date_expired INTEGER, date_retired INTEGER, user_info TEXT, PRIMARY KEY (pid));"),
         v3);
  return -[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", CFSTR("PRAGMA legacy_file_format = 0;"))
      && -[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", v4)
      && -[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", CFSTR("PRAGMA journal_mode=WAL;"))
      && -[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_lookup_key ON %@ (lookup_key);"),
             v3,
             v3))
      && -[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_date_inserted ON %@ (date_inserted);"),
             v3,
             v3))
      && -[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_date_expired ON %@ (date_expired);"),
             v3,
             v3))
      && -[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_date_retired ON %@ (date_retired);"),
             v3,
             v3))
      && -[SSSQLiteDatabase executeSQL:](self->_database, "executeSQL:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS %@_date_user_info ON %@ (user_info);"),
             v3,
             v3));
}

- (id)statistics
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  id v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  SSSQLiteDatabase *database;
  uint64_t v13;
  void *v14;
  id v15;
  __CFString *v16;
  uint64_t v17;
  void *v18;
  SSSQLiteDatabase *v19;
  void *v20;
  id v21;
  void *v22;
  SSSQLiteDatabase *v23;
  _QWORD v25[6];
  _QWORD v26[7];
  _QWORD v27[8];

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v4 = objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = (uint64_t)v5;
  v7 = (void *)MEMORY[0x1A8585BF8](v4);
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = SSDatabaseCacheEntryDataBlobSize;
  v10 = -[objc_class databaseTable](self->_cacheEntryClass, "databaseTable");
  v11 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("SELECT SUM(%@), COUNT(*) FROM %@ WHERE %@ <= ?;"),
                  v9,
                  v10,
                  SSDatabaseCacheEntryDateRetired);
  database = self->_database;
  v13 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __29__SSDatabaseCache_statistics__block_invoke;
  v27[3] = &unk_1E47BFE70;
  v27[5] = v3;
  v27[6] = v6;
  v27[4] = self;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v11, 1, v27);

  objc_autoreleasePoolPop(v7);
  v14 = (void *)MEMORY[0x1A8585BF8]();
  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  v16 = SSDatabaseCacheEntryDataBlobSize;
  v17 = -[objc_class databaseTable](self->_cacheEntryClass, "databaseTable");
  v18 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("SELECT SUM(%@), COUNT(*) FROM %@ WHERE %@ <= ?;"),
                  v16,
                  v17,
                  SSDatabaseCacheEntryDateExpired);
  v19 = self->_database;
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __29__SSDatabaseCache_statistics__block_invoke_2;
  v26[3] = &unk_1E47BFE70;
  v26[5] = v3;
  v26[6] = v6;
  v26[4] = self;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](v19, "prepareStatementForSQL:cache:usingBlock:", v18, 1, v26);

  objc_autoreleasePoolPop(v14);
  v20 = (void *)MEMORY[0x1A8585BF8]();
  v21 = objc_alloc(MEMORY[0x1E0CB3940]);
  v22 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("SELECT SUM(%@), COUNT(*) FROM %@;"),
                  SSDatabaseCacheEntryDataBlobSize,
                  -[objc_class databaseTable](self->_cacheEntryClass, "databaseTable"));
  v23 = self->_database;
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __29__SSDatabaseCache_statistics__block_invoke_3;
  v25[3] = &unk_1E47BFE98;
  v25[4] = self;
  v25[5] = v3;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](v23, "prepareStatementForSQL:cache:usingBlock:", v22, 1, v25);

  objc_autoreleasePoolPop(v20);
  return v3;
}

uint64_t __29__SSDatabaseCache_statistics__block_invoke(_QWORD *a1, sqlite3_stmt *a2)
{
  uint64_t result;
  sqlite3_int64 v5;
  sqlite3_int64 v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  sqlite3_bind_int64(a2, 1, a1[6]);
  result = objc_msgSend(*(id *)(a1[4] + 56), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result)
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1)
        v5 = sqlite3_column_int64(a2, 0);
      else
        v5 = 0;
      if (sqlite3_column_type(a2, 1) == 1)
        v6 = sqlite3_column_int64(a2, 1);
      else
        v6 = 0;
      v7 = (void *)a1[5];
      v9[0] = CFSTR("count");
      v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
      v9[1] = CFSTR("bytes");
      v10[0] = v8;
      v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), CFSTR("retired"));
      result = objc_msgSend(*(id *)(a1[4] + 56), "statementHasRowAfterStepping:", a2);
    }
    while ((result & 1) != 0);
  }
  return result;
}

uint64_t __29__SSDatabaseCache_statistics__block_invoke_2(_QWORD *a1, sqlite3_stmt *a2)
{
  uint64_t result;
  sqlite3_int64 v5;
  sqlite3_int64 v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  sqlite3_bind_int64(a2, 1, a1[6]);
  result = objc_msgSend(*(id *)(a1[4] + 56), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result)
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1)
        v5 = sqlite3_column_int64(a2, 0);
      else
        v5 = 0;
      if (sqlite3_column_type(a2, 1) == 1)
        v6 = sqlite3_column_int64(a2, 1);
      else
        v6 = 0;
      v7 = (void *)a1[5];
      v9[0] = CFSTR("count");
      v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
      v9[1] = CFSTR("bytes");
      v10[0] = v8;
      v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), CFSTR("expired"));
      result = objc_msgSend(*(id *)(a1[4] + 56), "statementHasRowAfterStepping:", a2);
    }
    while ((result & 1) != 0);
  }
  return result;
}

uint64_t __29__SSDatabaseCache_statistics__block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;
  sqlite3_int64 v5;
  sqlite3_int64 v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result)
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 1)
        v5 = sqlite3_column_int64(a2, 0);
      else
        v5 = 0;
      if (sqlite3_column_type(a2, 1) == 1)
        v6 = sqlite3_column_int64(a2, 1);
      else
        v6 = 0;
      v7 = *(void **)(a1 + 40);
      v9[0] = CFSTR("count");
      v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v6);
      v9[1] = CFSTR("bytes");
      v10[0] = v8;
      v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
      objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2), CFSTR("total"));
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "statementHasRowAfterStepping:", a2);
    }
    while ((result & 1) != 0);
  }
  return result;
}

- (void)clear
{
  void *v3;
  void *v4;
  SSSQLiteDatabase *database;
  _QWORD v6[5];

  v3 = (void *)MEMORY[0x1A8585BF8](self, a2);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("DELETE FROM %@"), -[objc_class databaseTable](self->_cacheEntryClass, "databaseTable"));
  database = self->_database;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__SSDatabaseCache_clear__block_invoke;
  v6[3] = &unk_1E47BFEC0;
  v6[4] = self;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v4, 0, v6);

  objc_autoreleasePoolPop(v3);
}

uint64_t __24__SSDatabaseCache_clear__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "statementDidFinishAfterStepping:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "clear");
  return result;
}

- (void)clearCacheForLookupKey:(id)a3
{
  if (objc_msgSend(a3, "length"))
  {
    -[SSPersistentCache removeDataForKey:](self->_persistentCache, "removeDataForKey:", a3);
    objc_msgSend(-[SSDatabaseCache cacheEntryForLookupKey:](self, "cacheEntryForLookupKey:", a3), "deleteFromDatabase");
  }
}

- (int)clearRetiredData
{
  id v3;
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SSSQLiteDatabase *database;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SSSQLiteDatabase *v28;
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[8];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)MEMORY[0x1A8585BF8]();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = (uint64_t)v6;
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  v9 = SSDatabaseCacheEntryLookupKey;
  v10 = SSDatabaseCacheEntryDataBlob;
  v11 = -[objc_class databaseTable](self->_cacheEntryClass, "databaseTable");
  v12 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("SELECT %@, LENGTH(HEX(%@)) FROM %@ WHERE %@ <= ?;"),
                  v9,
                  v10,
                  v11,
                  SSDatabaseCacheEntryDateRetired);
  database = self->_database;
  v14 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __35__SSDatabaseCache_clearRetiredData__block_invoke;
  v39[3] = &unk_1E47BFEE8;
  v39[4] = self;
  v39[5] = v3;
  v39[6] = v4;
  v39[7] = v7;
  -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](database, "prepareStatementForSQL:cache:usingBlock:", v12, 1, v39);

  objc_autoreleasePoolPop(v5);
  v15 = (void *)MEMORY[0x1A8585BF8]();
  if (objc_msgSend(v4, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v4);
          -[SSPersistentCache removeDataForKey:](self->_persistentCache, "removeDataForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v19++));
        }
        while (v17 != v19);
        v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v17);
    }
  }

  objc_autoreleasePoolPop(v15);
  v20 = objc_msgSend(v3, "count");
  v21 = (void *)MEMORY[0x1A8585BF8]();
  if (objc_msgSend(v3, "count"))
  {
    v22 = objc_alloc(MEMORY[0x1E0CB37A0]);
    v23 = -[objc_class databaseTable](self->_cacheEntryClass, "databaseTable");
    v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN(?"), v23, SSDatabaseCacheEntryLookupKey);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v25 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v32;
      while (1)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v3);
        objc_msgSend(v24, "appendString:", CFSTR(", ?"));
        if (!--v26)
        {
          v26 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
          if (!v26)
            break;
        }
      }
    }
    objc_msgSend(v24, "appendString:", CFSTR(");"));
    v28 = self->_database;
    v30[0] = v14;
    v30[1] = 3221225472;
    v30[2] = __35__SSDatabaseCache_clearRetiredData__block_invoke_2;
    v30[3] = &unk_1E47BFE98;
    v30[4] = v3;
    v30[5] = self;
    -[SSSQLiteDatabase prepareStatementForSQL:cache:usingBlock:](v28, "prepareStatementForSQL:cache:usingBlock:", v24, 1, v30);

  }
  objc_autoreleasePoolPop(v21);
  return v20;
}

uint64_t __35__SSDatabaseCache_clearRetiredData__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;
  void *v5;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 56));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result)
  {
    do
    {
      if (sqlite3_column_type(a2, 0) == 3)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", sqlite3_column_text(a2, 0));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
        if (sqlite3_column_type(a2, 1) == 1 && !sqlite3_column_int64(a2, 1))
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);

      }
      result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "statementHasRowAfterStepping:", a2);
    }
    while ((result & 1) != 0);
  }
  return result;
}

uint64_t __35__SSDatabaseCache_clearRetiredData__block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  sqlite3_bind_int64(a2, 1, 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(void **)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = 2;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        sqlite3_bind_text(a2, v8 + i, (const char *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "UTF8String"), objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "length"), 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 += i;
    }
    while (v6);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "statementDidFinishAfterStepping:", a2);
}

- (id)cacheEntryForLookupKey:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(self->_cacheEntryClass), "initWithLookupKey:inDatabase:", a3, self->_database);
  objc_msgSend(v4, "setPersistentCache:", self->_persistentCache);
  return v4;
}

- (id)setData:(id)a3 expiring:(double)a4 retiring:(double)a5 lookupKey:(id)a6 userInfo:(id)a7
{
  void *v13;
  uint64_t v14;
  unint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  id v20;
  __CFString *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  int v31;
  id v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  SSPersistentCache *persistentCache;
  id v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int *v59;
  uint64_t v60;
  unint64_t v61;
  int v62;
  uint64_t v63;
  __int16 v64;
  _BYTE v65[10];
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v13 = (void *)MEMORY[0x1A8585BF8](self, a2);
  v14 = objc_msgSend(a3, "length");
  if (v14 && (v15 = v14, objc_msgSend(a6, "length")))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v17 = (uint64_t)v16;
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
    v19 = -[SSDatabaseCache maximumInlineBlobSize](self, "maximumInlineBlobSize");
    v20 = a3;
    v61 = v19;
    if (v15 > v19)
      v20 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null", a3);
    objc_msgSend(v18, "setObject:forKey:", v20, SSDatabaseCacheEntryDataBlob);
    if (a7)
    {
      v21 = SSDatabaseCacheEntryUserInfo;
      v22 = v18;
      v23 = a7;
    }
    else
    {
      v23 = (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = SSDatabaseCacheEntryUserInfo;
      v22 = v18;
    }
    objc_msgSend(v22, "setObject:forKey:", v23, v21);
    objc_msgSend(v18, "setObject:forKey:", a6, SSDatabaseCacheEntryLookupKey);
    v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    objc_msgSend(v18, "setObject:forKey:", v26, SSDatabaseCacheEntryDataBlobSize);
    v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v17);
    objc_msgSend(v18, "setObject:forKey:", v27, SSDatabaseCacheEntryDateInserted);
    v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)a4);
    objc_msgSend(v18, "setObject:forKey:", v28, SSDatabaseCacheEntryDateExpired);
    v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)a5);
    objc_msgSend(v18, "setObject:forKey:", v29, SSDatabaseCacheEntryDateRetired);
    v30 = -[SSDatabaseCache cacheEntryForLookupKey:](self, "cacheEntryForLookupKey:", a6);
    if (v30)
    {
      v24 = v30;
      v31 = objc_msgSend(v30, "setValuesWithDictionary:", v18);
    }
    else
    {
      v24 = (void *)objc_msgSend(objc_alloc(self->_cacheEntryClass), "initWithPropertyValues:inDatabase:", v18, self->_database);
      v31 = v24 != 0;
    }
    v32 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    if (!v32)
      v32 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v33 = objc_msgSend(v32, "shouldLog");
    if (objc_msgSend(v32, "shouldLogToDisk"))
      v34 = v33 | 2;
    else
      v34 = v33;
    if (os_log_type_enabled((os_log_t)objc_msgSend(v32, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v35 = v34;
    else
      v35 = v34 & 2;
    if (v35)
    {
      v62 = 138413058;
      v63 = (uint64_t)v24;
      v64 = 1024;
      *(_DWORD *)v65 = v31;
      *(_WORD *)&v65[4] = 1024;
      *(_DWORD *)&v65[6] = v15 > v61;
      v66 = 2112;
      v67 = a6;
      LODWORD(v60) = 34;
      v59 = &v62;
      v36 = _os_log_send_and_compose_impl();
      if (v36)
      {
        v37 = (void *)v36;
        v38 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v36, 4, &v62, v60);
        free(v37);
        SSFileLog(v32, CFSTR("%@"), v39, v40, v41, v42, v43, v44, v38);
      }
    }
    if (v31)
    {
      persistentCache = self->_persistentCache;
      if (v15 <= v61)
        -[SSPersistentCache removeDataForKey:](persistentCache, "removeDataForKey:", a6);
      else
        -[SSPersistentCache setData:forKey:](persistentCache, "setData:forKey:", a3, a6);
    }
    else
    {
      v46 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      if (!v46)
        v46 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v47 = objc_msgSend(v46, "shouldLog", v59);
      if (objc_msgSend(v46, "shouldLogToDisk"))
        v48 = v47 | 2;
      else
        v48 = v47;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v46, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v48 &= 2u;
      if (v48)
      {
        v49 = objc_opt_class();
        v62 = 138412546;
        v63 = v49;
        v64 = 2112;
        *(_QWORD *)v65 = a6;
        LODWORD(v60) = 22;
        v50 = _os_log_send_and_compose_impl();
        if (v50)
        {
          v51 = (void *)v50;
          v52 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v50, 4, &v62, v60);
          free(v51);
          SSFileLog(v46, CFSTR("%@"), v53, v54, v55, v56, v57, v58, v52);
        }
      }
    }
  }
  else
  {
    v24 = 0;
  }
  objc_autoreleasePoolPop(v13);
  return v24;
}

- (id)cacheEntryProperties:(id)a3 forLookupKeys:(id)a4
{
  void *v7;
  SSSQLiteDatabase *database;
  _QWORD v10[8];

  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  database = self->_database;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__SSDatabaseCache_cacheEntryProperties_forLookupKeys___block_invoke;
  v10[3] = &unk_1E47BFF10;
  v10[4] = a4;
  v10[5] = self;
  v10[6] = a3;
  v10[7] = v7;
  -[SSSQLiteDatabase performTransactionWithBlock:](database, "performTransactionWithBlock:", v10);
  return v7;
}

uint64_t __54__SSDatabaseCache_cacheEntryProperties_forLookupKeys___block_invoke(uint64_t a1)
{
  void *v2;
  SSSQLiteCompoundPredicate *v3;
  SSSQLiteQueryDescriptor *v4;
  SSSQLiteQuery *v5;
  unint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  _QWORD v10[7];
  _OWORD v11[5];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A8585BF8]();
  v3 = +[SSSQLiteCompoundPredicate predicateWithProperty:values:comparisonType:](SSSQLiteCompoundPredicate, "predicateWithProperty:values:comparisonType:", SSDatabaseCacheEntryLookupKey, *(_QWORD *)(a1 + 32), 1);
  v4 = objc_alloc_init(SSSQLiteQueryDescriptor);
  -[SSSQLiteQueryDescriptor setEntityClass:](v4, "setEntityClass:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64));
  -[SSSQLiteQueryDescriptor setPredicate:](v4, "setPredicate:", v3);
  -[SSSQLiteQueryDescriptor setOrderingProperties:](v4, "setOrderingProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", SSDatabaseCacheEntryDateInserted));
  -[SSSQLiteQueryDescriptor setOrderingDirections:](v4, "setOrderingDirections:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("DESC")));
  v5 = -[SSSQLiteQuery initWithDatabase:descriptor:]([SSSQLiteQuery alloc], "initWithDatabase:descriptor:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56), v4);
  memset(v11, 0, sizeof(v11));
  v6 = objc_msgSend(*(id *)(a1 + 48), "count");
  v7 = v6;
  v8 = v11;
  if (v6 >= 0xB)
    v8 = malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
  objc_msgSend(*(id *)(a1 + 48), "getObjects:range:", v8, 0, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__SSDatabaseCache_cacheEntryProperties_forLookupKeys___block_invoke_2;
  v10[3] = &unk_1E47BFBF8;
  v10[5] = v7;
  v10[6] = v8;
  v10[4] = *(_QWORD *)(a1 + 56);
  -[SSSQLiteQuery enumeratePersistentIDsAndProperties:count:usingBlock:](v5, "enumeratePersistentIDsAndProperties:count:usingBlock:", v8, v7, v10);
  if (v8 != v11)
    free(v8);

  objc_autoreleasePoolPop(v2);
  return 1;
}

void __54__SSDatabaseCache_cacheEntryProperties_forLookupKeys___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t i;
  uint64_t v9;

  v5 = (void *)MEMORY[0x1A8585BF8]();
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    for (i = 0; i < v7; ++i)
    {
      v9 = *(_QWORD *)(a3 + 8 * i);
      if (v9)
      {
        objc_msgSend(v6, "setObject:forKey:", v9, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * i));
        v7 = *(_QWORD *)(a1 + 40);
      }
    }
  }
  if (objc_msgSend(v6, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  objc_autoreleasePoolPop(v5);
}

- (unint64_t)maximumInlineBlobSize
{
  return self->_maximumInlineBlobSize;
}

- (void)setMaximumInlineBlobSize:(unint64_t)a3
{
  self->_maximumInlineBlobSize = a3;
}

@end
