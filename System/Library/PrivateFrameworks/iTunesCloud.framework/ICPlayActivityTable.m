@implementation ICPlayActivityTable

- (ICPlayActivityTable)init
{
  return -[ICPlayActivityTable initWithDatabasePath:](self, "initWithDatabasePath:", 0);
}

- (ICPlayActivityTable)initWithDatabasePath:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *serialAccessQueue;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  ICSQLiteConnectionOptions *v12;
  ICSQLiteConnection *v13;
  void *v14;
  id v15;
  ICSQLiteConnection *v16;
  ICPlayActivityTable *v17;
  id *p_isa;
  ICPlayActivityTable *v19;
  void *v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_super v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_migrateDatabaseFiles");
  v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunescloudd.playactivitytable", 0);
  serialAccessQueue = self->_serialAccessQueue;
  self->_serialAccessQueue = v5;

  if (v4)
  {
    v7 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_defaultDatabasePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v10 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v30);
  v11 = v30;

  if (v10)
  {
    v12 = -[ICSQLiteConnectionOptions initWithDatabasePath:]([ICSQLiteConnectionOptions alloc], "initWithDatabasePath:", v7);
    v13 = -[ICSQLiteConnection initWithOptions:]([ICSQLiteConnection alloc], "initWithOptions:", v12);
    v14 = (void *)objc_opt_class();
    if ((objc_msgSend(v14, "_setupDatabase:", v13) & 1) != 0)
    {
      v15 = v11;
      v16 = v13;
    }
    else
    {
      v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v32 = v14;
        v33 = 2112;
        v34 = v7;
        v35 = 2112;
        v36 = v11;
        _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "%{public}@ -- Error creating database, removing if possible...: %@ -- %@", buf, 0x20u);
      }

      v29 = v11;
      v23 = -[ICPlayActivityTable _removeDatabaseReturningError:](self, "_removeDatabaseReturningError:", &v29);
      v15 = v29;

      v24 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      if (!v23)
      {
        if (v25)
        {
          *(_DWORD *)buf = 138543874;
          v32 = v14;
          v33 = 2112;
          v34 = v7;
          v35 = 2112;
          v36 = v15;
          _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "%{public}@ -- Error removing database: %@ -- %@", buf, 0x20u);
        }

        v19 = 0;
        v16 = v13;
        goto LABEL_26;
      }
      if (v25)
      {
        *(_DWORD *)buf = 138543874;
        v32 = v14;
        v33 = 2112;
        v34 = v7;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_1A03E3000, v24, OS_LOG_TYPE_ERROR, "%{public}@ -- Removing database successful, attempting to recreate...: %@ -- %@", buf, 0x20u);
      }

      v16 = -[ICSQLiteConnection initWithOptions:]([ICSQLiteConnection alloc], "initWithOptions:", v12);
      if (!v16)
      {
        v19 = 0;
        goto LABEL_27;
      }
      if ((objc_msgSend(v14, "_setupDatabase:", v16) & 1) == 0)
      {
        v26 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v32 = v14;
          v33 = 2112;
          v34 = v7;
          _os_log_impl(&dword_1A03E3000, v26, OS_LOG_TYPE_ERROR, "%{public}@ -- Error creating database for a second time, bailing out: %@", buf, 0x16u);
        }

        v19 = 0;
        goto LABEL_26;
      }
    }
    v28.receiver = self;
    v28.super_class = (Class)ICPlayActivityTable;
    v17 = -[ICPlayActivityTable init](&v28, sel_init);
    p_isa = (id *)&v17->super.isa;
    if (v17)
    {
      objc_storeStrong((id *)&v17->_databaseConnection, v16);
      objc_storeStrong(p_isa + 2, v7);
    }
    self = p_isa;
    v19 = self;
LABEL_26:

    goto LABEL_27;
  }
  v12 = (ICSQLiteConnectionOptions *)os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543874;
    v32 = v20;
    v33 = 2112;
    v34 = v7;
    v35 = 2112;
    v36 = v11;
    v21 = v20;
    _os_log_impl(&dword_1A03E3000, &v12->super, OS_LOG_TYPE_ERROR, "%{public}@ -- Error creating directory: %@ -- %@", buf, 0x20u);

  }
  v19 = 0;
  v15 = v11;
LABEL_27:

  return v19;
}

- (BOOL)_removeDatabaseReturningError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSString copy](self->_databasePath, "copy");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v3;
  objc_msgSend(v3, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v5, 0);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    LOBYTE(v10) = 0;
    v11 = 0;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasPrefix:", v6))
        {
          objc_msgSend(v5, "stringByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v11;
          v10 = objc_msgSend(v20, "removeItemAtPath:error:", v15, &v21);
          v16 = v21;

          if (!v10)
          {
            v11 = v16;
            goto LABEL_14;
          }
          LOBYTE(v10) = 1;
          v11 = v16;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
    v11 = 0;
  }
LABEL_14:

  if (a3)
    *a3 = objc_retainAutorelease(v11);

  return v10 & 1;
}

- (id)eventsRevisionVersionToken
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[ICPlayActivityTable _valueForDatabasePropertyKey:](self, "_valueForDatabasePropertyKey:", CFSTR("events_revision_version_token"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("unknown-revision-version");
  v4 = v2;

  return v4;
}

- (BOOL)insertPlayActivityEvent:(id)a3 returningError:(id *)a4
{
  id v6;
  ICSQLiteConnection *databaseConnection;
  id v8;
  BOOL v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  databaseConnection = self->_databaseConnection;
  v18 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __62__ICPlayActivityTable_insertPlayActivityEvent_returningError___block_invoke;
  v16 = &unk_1E438FC50;
  v8 = v6;
  v17 = v8;
  v9 = -[ICSQLiteConnection executeStatement:error:bindings:](databaseConnection, "executeStatement:error:bindings:", CFSTR("INSERT OR REPLACE INTO events (pid, timestamp, store_account_id, event_data) VALUES (?, ?, ?, ?)"), &v18, &v13);
  v10 = v18;
  v11 = v10;
  if (!v9 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0, v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v9;
}

- (void)performTransactionWithBlock:(id)a3
{
  id v4;
  NSObject *serialAccessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    serialAccessQueue = self->_serialAccessQueue;
    block[1] = 3221225472;
    block[2] = __51__ICPlayActivityTable_performTransactionWithBlock___block_invoke;
    block[3] = &unk_1E4390EF8;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(serialAccessQueue, block);

    v4 = v6;
  }

}

- (BOOL)getPlayActivityEvents:(id *)a3 storeAccountID:(int64_t)a4 limit:(unint64_t)a5 returningError:(id *)a6
{
  void *v10;
  uint64_t i;
  const __CFString *v12;
  void *v13;
  BOOL v14;
  ICSQLiteConnection *databaseConnection;
  uint64_t v16;
  void *v17;
  _QWORD v20[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  if (!a3)
    return 1;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__14556;
  v35 = __Block_byref_object_dispose__14557;
  v36 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("SELECT "));
  for (i = 0; i != 4; ++i)
  {
    if (i == 3)
      v12 = &stru_1E4391778;
    else
      v12 = CFSTR(",");
    objc_msgSend(v10, "appendFormat:", CFSTR("%@%@"), off_1E438C598[i], v12);
  }
  objc_msgSend((id)objc_opt_class(), "_eventsDatabaseTableName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendFormat:", CFSTR(" FROM %@"), v13);
  if (a4)
    objc_msgSend(v10, "appendFormat:", CFSTR(" WHERE (%@ == %llu)"), CFSTR("store_account_id"), a4);
  objc_msgSend(v10, "appendString:", CFSTR(" ORDER BY "));
  if (a4)
    objc_msgSend(v10, "appendFormat:", CFSTR("%@,%@ ASC"), CFSTR("store_account_id"), CFSTR("timestamp"));
  else
    objc_msgSend(v10, "appendFormat:", CFSTR("%@ ASC"), CFSTR("timestamp"));
  if (a5)
    objc_msgSend(v10, "appendFormat:", CFSTR(" LIMIT %lu;"), a5);
  else
    objc_msgSend(v10, "appendFormat:", CFSTR(";"));
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 1;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__14556;
  v25 = __Block_byref_object_dispose__14557;
  v26 = 0;
  databaseConnection = self->_databaseConnection;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __81__ICPlayActivityTable_getPlayActivityEvents_storeAccountID_limit_returningError___block_invoke;
  v20[3] = &unk_1E4390100;
  v20[4] = &v27;
  v20[5] = &v31;
  v20[6] = &v21;
  -[ICSQLiteConnection executeQuery:withResults:](databaseConnection, "executeQuery:withResults:", v10, v20);
  if (!*((_BYTE *)v28 + 24) && !v32[5])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v32[5];
    v32[5] = v16;

  }
  if (a6)
    *a6 = objc_retainAutorelease((id)v32[5]);
  *a3 = objc_retainAutorelease((id)v22[5]);
  v14 = v32[5] == 0;
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

- (BOOL)removePlayActivityEvents:(id)a3 returningError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  const __CFString *v10;
  ICSQLiteConnection *databaseConnection;
  id v12;
  BOOL v13;
  id v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  objc_msgSend((id)objc_opt_class(), "_eventsDatabaseTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ IN ("), v7, CFSTR("pid"));
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      if (objc_msgSend(v6, "count") - 1 <= v9)
        v10 = &stru_1E4391778;
      else
        v10 = CFSTR(",");
      objc_msgSend(v8, "appendFormat:", CFSTR("?%@"), v10);
      ++v9;
    }
    while (objc_msgSend(v6, "count") > v9);
  }
  objc_msgSend(v8, "appendString:", CFSTR(");"));
  databaseConnection = self->_databaseConnection;
  v19 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__ICPlayActivityTable_removePlayActivityEvents_returningError___block_invoke;
  v17[3] = &unk_1E438FC50;
  v12 = v6;
  v18 = v12;
  v13 = -[ICSQLiteConnection executeStatement:error:bindings:](databaseConnection, "executeStatement:error:bindings:", v8, &v19, v17);
  v14 = v19;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v15;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v14);

  return v13;
}

- (BOOL)_setValue:(id)a3 forDatabasePropertyKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  ICSQLiteConnection *databaseConnection;
  BOOL v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  ICSQLiteConnection *v18;
  BOOL v19;
  BOOL v20;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICPlayActivityTable.m"), 480, CFSTR("key cannot be nil"));

  }
  objc_msgSend((id)objc_opt_class(), "_propertiesDatabaseTableName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR REPLACE INTO %@ (%@, %@) VALUES ('%@', '%@');"),
      v9,
      CFSTR("key"),
      CFSTR("value"),
      v8,
      v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    databaseConnection = self->_databaseConnection;
    v24 = 0;
    v12 = -[ICSQLiteConnection executeStatement:error:](databaseConnection, "executeStatement:error:", v10, &v24);
    v13 = v24;
    if (!v12)
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v26 = v8;
        v27 = 2114;
        v28 = v7;
        v29 = 2114;
        v30 = v13;
        v15 = "Failed to set database property ('%{public}@' = '%{public}@'). err=%{public}@";
        v16 = v14;
        v17 = 32;
LABEL_11:
        _os_log_impl(&dword_1A03E3000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM %@ WHERE %@ = '%@';"),
      v9,
      CFSTR("key"),
      v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = self->_databaseConnection;
    v23 = 0;
    v19 = -[ICSQLiteConnection executeStatement:error:](v18, "executeStatement:error:", v10, &v23);
    v13 = v23;
    if (!v19)
    {
      v14 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = v8;
        v27 = 2114;
        v28 = v13;
        v15 = "Failed to delete database property '%{public}@'. err=%{public}@";
        v16 = v14;
        v17 = 22;
        goto LABEL_11;
      }
LABEL_12:

      v20 = 0;
      goto LABEL_13;
    }
  }
  v20 = 1;
LABEL_13:

  return v20;
}

- (id)_valueForDatabasePropertyKey:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  ICSQLiteConnection *databaseConnection;
  id v9;
  id v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICPlayActivityTable.m"), 503, CFSTR("key cannot be nil"));

  }
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14556;
  v20 = __Block_byref_object_dispose__14557;
  v21 = 0;
  objc_msgSend((id)objc_opt_class(), "_propertiesDatabaseTableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM %@ WHERE %@ = '%@';"),
    CFSTR("value"),
    v6,
    CFSTR("key"),
    v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  databaseConnection = self->_databaseConnection;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__ICPlayActivityTable__valueForDatabasePropertyKey___block_invoke;
  v13[3] = &unk_1E438C550;
  v9 = v5;
  v14 = v9;
  v15 = &v16;
  -[ICSQLiteConnection executeQuery:withResults:](databaseConnection, "executeQuery:withResults:", v7, v13);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (BOOL)getStoreAccounts:(id *)a3 returningError:(id *)a4
{
  void *v7;
  void *v8;
  ICSQLiteConnection *databaseConnection;
  uint64_t v10;
  void *v11;
  BOOL v12;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  if (!a3)
    return 1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__14556;
  v29 = __Block_byref_object_dispose__14557;
  v30 = 0;
  objc_msgSend((id)objc_opt_class(), "_eventsDatabaseTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT DISTINCT %@ FROM %@;"),
    CFSTR("store_account_id"),
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__14556;
  v19 = __Block_byref_object_dispose__14557;
  v20 = 0;
  databaseConnection = self->_databaseConnection;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__ICPlayActivityTable_getStoreAccounts_returningError___block_invoke;
  v14[3] = &unk_1E4390100;
  v14[4] = &v21;
  v14[5] = &v25;
  v14[6] = &v15;
  -[ICSQLiteConnection executeQuery:withResults:](databaseConnection, "executeQuery:withResults:", v8, v14);
  if (!*((_BYTE *)v22 + 24) && !v26[5])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), 0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v26[5];
    v26[5] = v10;

  }
  if (a4)
    *a4 = objc_retainAutorelease((id)v26[5]);
  *a3 = objc_retainAutorelease((id)v16[5]);
  v12 = v26[5] == 0;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (BOOL)hasPendingPlayActivityEvents:(BOOL *)a3 returningError:(id *)a4
{
  void *v7;
  void *v8;
  ICSQLiteConnection *databaseConnection;
  BOOL v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialAccessQueue);
  if (!a3)
    return 1;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14556;
  v21 = __Block_byref_object_dispose__14557;
  v22 = 0;
  objc_msgSend((id)objc_opt_class(), "_eventsDatabaseTableName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT EXISTS (SELECT 1 FROM %@);"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  databaseConnection = self->_databaseConnection;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__ICPlayActivityTable_hasPendingPlayActivityEvents_returningError___block_invoke;
  v12[3] = &unk_1E438C578;
  v12[4] = &v13;
  v12[5] = &v17;
  -[ICSQLiteConnection executeQuery:withResults:](databaseConnection, "executeQuery:withResults:", v8, v12);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  *a3 = *((_BYTE *)v14 + 24);
  v10 = v18[5] == 0;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialAccessQueue, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_databaseConnection, 0);
}

void __67__ICPlayActivityTable_hasPendingPlayActivityEvents_returningError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;

  v6 = a3;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "firstInt64Value") > 0;
  }

}

void __55__ICPlayActivityTable_getStoreAccounts_returningError___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v6 = a3;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __55__ICPlayActivityTable_getStoreAccounts_returningError___block_invoke_2;
    v7[3] = &unk_1E438C528;
    v8 = *((_OWORD *)a1 + 2);
    v9 = a1[6];
    objc_msgSend(a2, "enumerateRowsUsingBlock:", v7, 0);
  }

}

void __55__ICPlayActivityTable_getStoreAccounts_returningError___block_invoke_2(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a3;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", objc_msgSend(v13, "int64ForColumnName:", CFSTR("store_account_id")));
    if (v8)
    {
      v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      if (!v9)
      {
        v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        v11 = *(_QWORD *)(a1[6] + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

        v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      }
      objc_msgSend(v9, "addObject:", v8);
    }

  }
}

void __52__ICPlayActivityTable__valueForDatabasePropertyKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "Failed to get database property '%{public}@'. err=%{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
  else
  {
    objc_msgSend(a2, "firstStringValue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

void __63__ICPlayActivityTable_removePlayActivityEvents_returningError___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bindInt64:atPosition:", objc_msgSend(v4, "persistentID"), ++v3);

    }
    while (objc_msgSend(*(id *)(a1 + 32), "count") > v3);
  }

}

void __81__ICPlayActivityTable_getPlayActivityEvents_storeAccountID_limit_returningError___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;

  v6 = a3;
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__ICPlayActivityTable_getPlayActivityEvents_storeAccountID_limit_returningError___block_invoke_2;
    v7[3] = &unk_1E438C528;
    v8 = *((_OWORD *)a1 + 2);
    v9 = a1[6];
    objc_msgSend(a2, "enumerateRowsUsingBlock:", v7, 0);
  }

}

void __81__ICPlayActivityTable_getPlayActivityEvents_storeAccountID_limit_returningError___block_invoke_2(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  ICPlayActivityEvent *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a3;
  if (v14)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    objc_msgSend(a2, "dataForColumnIndex:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      v9 = -[ICPlayActivityEvent initWithDataRepresentation:]([ICPlayActivityEvent alloc], "initWithDataRepresentation:", v8);
      if (v9)
      {
        v10 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        if (!v10)
        {
          v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
          v12 = *(_QWORD *)(a1[6] + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

          v10 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
        }
        objc_msgSend(v10, "addObject:", v9);
      }

    }
  }

}

void __51__ICPlayActivityTable_performTransactionWithBlock___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__ICPlayActivityTable_performTransactionWithBlock___block_invoke_2;
  v3[3] = &unk_1E438C500;
  v4 = v1;
  objc_msgSend(v2, "performTransaction:", v3);

}

uint64_t __51__ICPlayActivityTable_performTransactionWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__ICPlayActivityTable_insertPlayActivityEvent_returningError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindInt64:atPosition:", objc_msgSend(v3, "persistentID"), 1);
  objc_msgSend(*(id *)(a1 + 32), "eventDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "bindDouble:atPosition:", 2);

  objc_msgSend(v4, "bindInt64:atPosition:", objc_msgSend(*(id *)(a1 + 32), "storeAccountID"), 3);
  objc_msgSend(*(id *)(a1 + 32), "dataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindData:atPosition:", v6, 4);

}

+ (void)_migrateDatabaseFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("com.apple.itunesstored"), CFSTR("play_activity.sqlitedb"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    objc_msgSend(a1, "_defaultDatabasePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

    objc_msgSend(v4, "moveItemAtPath:toPath:error:", v3, v5, 0);
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("-wal"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("-wal"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveItemAtPath:toPath:error:", v7, v8, 0);

    objc_msgSend(v3, "stringByAppendingString:", CFSTR("-shm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("-shm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "moveItemAtPath:toPath:error:", v9, v10, 0);

  }
}

+ (id)_defaultDatabasePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Library"), CFSTR("com.apple.iTunesCloud"), CFSTR("play_activity.sqlitedb"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_eventsDatabaseTableName
{
  return CFSTR("events");
}

+ (id)_propertiesDatabaseTableName
{
  return CFSTR("properties");
}

+ (BOOL)_setupDatabase:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  char v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  __CFString *v13;
  char v14;
  char v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  char v19;
  int v20;
  const __CFString *v21;
  void *v22;
  __CFString *v23;
  int v24;
  const __CFString *v25;
  void *v26;
  int v27;
  __CFString *v28;
  uint64_t v29;
  BOOL v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  void *v36;
  uint64_t v37;
  void *v38;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  char v42;
  char v43;
  uint64_t v44;
  char v45;
  __CFString *v46;
  NSObject *v47;
  __CFString *v48;
  const __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  __CFString *v57;
  id v58;
  uint8_t buf[4];
  const __CFString *v60;
  __int16 v61;
  __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_eventsDatabaseTableName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@ INTEGER PRIMARY KEY, %@ REAL, %@ INTEGER, %@ BLOB);"),
      v5,
      CFSTR("pid"),
      CFSTR("timestamp"),
      CFSTR("store_account_id"),
      CFSTR("event_data"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_propertiesDatabaseTableName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE TABLE IF NOT EXISTS %@ (%@ TEXT PRIMARY KEY, %@ TEXT);"),
      v7,
      CFSTR("key"),
      CFSTR("value"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v9 = objc_msgSend(v4, "executeStatement:error:", CFSTR("PRAGMA legacy_file_format = 0;"), &v58);
    v10 = (__CFString *)v58;
    v11 = v10;
    if ((v9 & 1) != 0)
    {
      v49 = v8;
      v57 = v10;
      v12 = objc_msgSend(v4, "executeStatement:error:", CFSTR("PRAGMA journal_mode=WAL;"), &v57);
      v13 = v57;

      if ((v12 & 1) == 0)
      {
        v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v60 = CFSTR("PRAGMA journal_mode=WAL;");
          v61 = 2114;
          v62 = v13;
          _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_ERROR, "Failed to execute database statment: (%@). err=%{public}@", buf, 0x16u);
        }
        v30 = 0;
        v11 = v13;
        goto LABEL_30;
      }
      v56 = v13;
      v14 = objc_msgSend(v4, "executeStatement:error:", v6, &v56);
      v11 = v56;

      if ((v14 & 1) != 0)
      {
        v55 = v11;
        v15 = objc_msgSend(v4, "executeStatement:error:", v49, &v55);
        v16 = v55;

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v4, "userVersion");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "integerValue");

          v48 = v6;
          if (v18)
          {
            if ((unint64_t)v18 <= 0x7D5)
            {
              v11 = v16;
              v19 = 0;
              LOBYTE(v20) = 1;
              v21 = CFSTR("DROP TABLE IF EXISTS %@;");
              do
              {
                if ((unint64_t)(v18 - 2000) <= 5)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v21, v7);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = v11;
                  v54 = v11;
                  v24 = objc_msgSend(v4, "executeStatement:error:", v22, &v54);
                  v11 = v54;

                  if (!v24)
                    goto LABEL_59;
                  v25 = v21;
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v21, v5);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = v11;
                  v27 = objc_msgSend(v4, "executeStatement:error:", v26, &v53);
                  v28 = v53;

                  if (!v27)
                  {
                    v11 = v28;
LABEL_59:
                    v6 = v48;
                    goto LABEL_60;
                  }
                  v6 = v48;
                  v11 = v28;
                  if (!objc_msgSend(v4, "executeStatement:error:", v48, 0))
                    goto LABEL_60;
                  v20 = objc_msgSend(v4, "executeStatement:error:", v49, 0);
                  if (v20)
                    v18 = 2006;
                  v19 = 1;
                  v21 = v25;
                }
              }
              while ((v20 & 1) != 0 && v18 < 2006);
              if ((v20 & 1) != 0)
              {
                v29 = v18;
                v16 = v11;
                if ((v19 & 1) != 0)
                  goto LABEL_39;
                goto LABEL_44;
              }
LABEL_60:
              _ICLogCategoryDefault();
              v31 = objc_claimAutoreleasedReturnValue();
              v8 = (__CFString *)v49;
              if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                goto LABEL_26;
              *(_DWORD *)buf = 138543362;
              v60 = v11;
              v32 = "Failed to execute database statment to drop tables. err=%{public}@";
              v33 = v31;
              v34 = 12;
              goto LABEL_25;
            }
            v29 = v18;
          }
          else
          {
            v29 = 2006;
LABEL_39:
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "UUIDString");
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v37;
            v39 = &stru_1E4391778;
            if (v37)
              v39 = (__CFString *)v37;
            v40 = v39;

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO %@ (%@, %@) VALUES ('%@', '%@');"),
              v7,
              CFSTR("key"),
              CFSTR("value"),
              CFSTR("events_revision_version_token"),
              v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v16;
            v42 = objc_msgSend(v4, "executeStatement:error:", v41, &v52);
            v11 = v52;

            if ((v42 & 1) == 0)
            {
              _ICLogCategoryDefault();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v60 = v11;
                _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_ERROR, "Failed to execute database statment to set initial properties. err=%{public}@", buf, 0xCu);
              }
              v30 = 0;
              v6 = v48;
              goto LABEL_30;
            }
            v16 = v11;
          }
LABEL_44:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS StoreAccountID ON %@ (%@ ASC);"),
            v5,
            CFSTR("store_account_id"));
          v31 = objc_claimAutoreleasedReturnValue();
          v51 = v16;
          v43 = objc_msgSend(v4, "executeStatement:error:", v31, &v51);
          v11 = v51;

          if ((v43 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CREATE INDEX IF NOT EXISTS Timestamp ON %@ (%@ ASC);"),
              v5,
              CFSTR("timestamp"));
            v44 = objc_claimAutoreleasedReturnValue();

            v50 = v11;
            v45 = objc_msgSend(v4, "executeStatement:error:", v44, &v50);
            v46 = v50;

            if ((v45 & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
              v47 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setUserVersion:", v47);
              v30 = 1;
            }
            else
            {
              _ICLogCategoryDefault();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v60 = CFSTR("CREATE INDEX IF NOT EXISTS Timestamp ON...;");
                v61 = 2114;
                v62 = v46;
                _os_log_impl(&dword_1A03E3000, v47, OS_LOG_TYPE_ERROR, "Failed to execute database statment: (%@). err=%{public}@", buf, 0x16u);
              }
              v30 = 0;
            }
            v11 = v46;
            v31 = v44;
          }
          else
          {
            _ICLogCategoryDefault();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v60 = CFSTR("CREATE INDEX IF NOT EXISTS StoreAccountID ON...;");
              v61 = 2114;
              v62 = v11;
              _os_log_impl(&dword_1A03E3000, v47, OS_LOG_TYPE_ERROR, "Failed to execute database statment: (%@). err=%{public}@", buf, 0x16u);
            }
            v30 = 0;
          }
          v6 = v48;

        }
        else
        {
          v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v8 = (__CFString *)v49;
            v60 = v49;
            v61 = 2114;
            v62 = v16;
            _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_ERROR, "Failed to execute database statment: (%@). err=%{public}@", buf, 0x16u);
            v11 = v16;
            goto LABEL_26;
          }
          v11 = v16;
          v30 = 0;
        }
LABEL_30:
        v8 = (__CFString *)v49;
        goto LABEL_31;
      }
      v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      v8 = (__CFString *)v49;
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)buf = 138412546;
      v60 = v6;
      v61 = 2114;
      v62 = v11;
      v32 = "Failed to execute database statment: (%@). err=%{public}@";
    }
    else
    {
      v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_26:
        v30 = 0;
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 138412546;
      v60 = CFSTR("PRAGMA legacy_file_format = 0;");
      v61 = 2114;
      v62 = v11;
      v32 = "Failed to execute database statment: (%@). err=%{public}@";
    }
    v33 = v31;
    v34 = 22;
LABEL_25:
    _os_log_impl(&dword_1A03E3000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
    goto LABEL_26;
  }
  v30 = 0;
LABEL_32:

  return v30;
}

@end
