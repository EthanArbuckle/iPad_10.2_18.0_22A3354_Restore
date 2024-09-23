@implementation PBFSQLiteDatabaseConnection

- (PBFSQLiteDatabaseConnection)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  PBFSQLiteDatabaseConnection *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  PBFSQLiteDatabaseConnection *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("PBFSQLiteDatabaseConnection.m");
    v17 = 1024;
    v18 = 48;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1CB9FA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (PBFSQLiteDatabaseConnection *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (PBFSQLiteDatabaseConnection)initWithInMemoryDatabase
{
  PBFSQLiteDatabaseConnection *v2;
  PBFSQLiteDatabaseConnection *v3;
  PBFSQLiteDatabaseConnection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBFSQLiteDatabaseConnection;
  v2 = -[PBFSQLiteDatabaseConnection init](&v6, sel_init);
  v3 = v2;
  if (!v2 || (v4 = 0, PBFSQLiteDatabaseConnectionSharedInit(v2, CFSTR(":memory:"), 6, 2, 0)))
    v4 = v3;

  return v4;
}

- (PBFSQLiteDatabaseConnection)initWithFileURL:(id)a3 dataProtectionClass:(unint64_t)a4
{
  id v6;
  PBFSQLiteDatabaseConnection *v7;
  void *v8;
  _BOOL4 v9;
  PBFSQLiteDatabaseConnection *v10;
  void *v12;
  objc_super v13;

  v6 = a3;
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteDatabaseConnection.m"), 62, CFSTR("url must be a fileURL : url=%@"), v6);

  }
  v13.receiver = self;
  v13.super_class = (Class)PBFSQLiteDatabaseConnection;
  v7 = -[PBFSQLiteDatabaseConnection init](&v13, sel_init);
  if (!v7
    || (objc_msgSend(v6, "path"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = PBFSQLiteDatabaseConnectionSharedInit(v7, v8, 6, 2, 0),
        v8,
        v10 = 0,
        v9))
  {
    v10 = v7;
  }

  return v10;
}

- (PBFSQLiteDatabaseConnection)initWithFileURL:(id)a3 options:(int)a4 dataProtectionClass:(unint64_t)a5 error:(id *)a6
{
  id v11;
  PBFSQLiteDatabaseConnection *v12;
  void *v13;
  _BOOL4 v14;
  PBFSQLiteDatabaseConnection *v15;
  void *v17;
  objc_super v18;

  v11 = a3;
  if ((objc_msgSend(v11, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteDatabaseConnection.m"), 73, CFSTR("url must be a fileURL : url=%@"), v11);

  }
  v18.receiver = self;
  v18.super_class = (Class)PBFSQLiteDatabaseConnection;
  v12 = -[PBFSQLiteDatabaseConnection init](&v18, sel_init);
  if (v12
    && (objc_msgSend(v11, "path"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = PBFSQLiteDatabaseConnectionSharedInit(v12, v13, a4, a5, a6),
        v13,
        !v14))
  {
    v15 = 0;
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

+ (uint64_t)_sqliteOpenFlagsForDataProtectionClass:(uint64_t)a1
{
  objc_opt_self();
  if ((unint64_t)(a2 - 1) >= 3)
    return 0x100000;
  else
    return (0x400000 - (((_DWORD)a2 - 1) << 20));
}

- (void)_closeConnection
{
  sqlite3 *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *(sqlite3 **)(a1 + 24);
    if (v2)
    {
      v3 = sqlite3_close_v2(v2);
      objc_msgSend((id)a1, "loggingCategory");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v3)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 8), "lastPathComponent");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = sqlite3_errstr(v3);
          v8 = *(_QWORD *)(a1 + 24);
          v11 = 134219266;
          v12 = a1;
          v13 = 2112;
          v14 = v6;
          v15 = 2080;
          v16 = "-[PBFSQLiteDatabaseConnection _closeConnection]";
          v17 = 1024;
          *(_DWORD *)v18 = v3;
          *(_WORD *)&v18[4] = 2082;
          *(_QWORD *)&v18[6] = v7;
          v19 = 2048;
          v20 = v8;
          _os_log_error_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_ERROR, "[%p/'%@'] %s: got error %d (%{public}s) closing database connection %p", (uint8_t *)&v11, 0x3Au);

        }
      }
      else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 8), "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)(a1 + 24);
        v11 = 134218754;
        v12 = a1;
        v13 = 2112;
        v14 = v9;
        v15 = 2080;
        v16 = "-[PBFSQLiteDatabaseConnection _closeConnection]";
        v17 = 2048;
        *(_QWORD *)v18 = v10;
        _os_log_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_DEFAULT, "[%p/'%@'] %s: successfully closed database connection %p", (uint8_t *)&v11, 0x2Au);

      }
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
}

- (void)dealloc
{
  void *v4;
  void *v5;
  objc_super v6;

  if (self->_queue_dbConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteDatabaseConnection.m"), 106, CFSTR("database must be closed before dealloc"));

  }
  if (self->_queue_queryCache)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteDatabaseConnection.m"), 107, CFSTR("database must be closed before dealloc"));

  }
  v6.receiver = self;
  v6.super_class = (Class)PBFSQLiteDatabaseConnection;
  -[PBFSQLiteDatabaseConnection dealloc](&v6, sel_dealloc);
}

- (id)prepareStatement:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v14;
  uint8_t buf[4];
  PBFSQLiteDatabaseConnection *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PBFSQLiteDatabaseConnection.m"), 113, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  -[NSCache objectForKey:](self->_queue_queryCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = +[PBFSQLitePreparedStatement _newPreparedStatementForDatabaseConnection:withSQLQuery:]((uint64_t)PBFSQLitePreparedStatement, self, v5);
    -[PBFSQLiteDatabaseConnection loggingCategory](self, "loggingCategory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLoggingCategory:", v7);

    -[PBFSQLiteDatabaseConnection loggingCategory](self, "loggingCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      -[NSString lastPathComponent](self->_sqliteDatabasePath, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v16 = self;
      v17 = 2114;
      v18 = v9;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CB9FA000, v8, OS_LOG_TYPE_INFO, "[%p/'%{public}@'] preparing new statement %@", buf, 0x20u);

    }
    -[PBFSQLiteDatabaseConnection loggingCategory](self, "loggingCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v6)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[NSString lastPathComponent](self->_sqliteDatabasePath, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v16 = self;
        v17 = 2114;
        v18 = v12;
        v19 = 2112;
        v20 = v5;
        _os_log_impl(&dword_1CB9FA000, v11, OS_LOG_TYPE_INFO, "[%p/'%{public}@'] prepared new statement %@", buf, 0x20u);

      }
      v11 = objc_msgSend(v5, "copy");
      -[NSCache setObject:forKey:](self->_queue_queryCache, "setObject:forKey:", v6, v11);
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PBFSQLiteDatabaseConnection prepareStatement:].cold.1((uint64_t)self, (uint64_t)v5, v11);
      v6 = 0;
    }

  }
  return v6;
}

- (BOOL)executeQuery:(id)a3 error:(id *)a4
{
  return -[PBFSQLiteDatabaseConnection executeQuery:bindings:resultRowHandler:error:](self, "executeQuery:bindings:resultRowHandler:error:", a3, 0, 0, a4);
}

- (BOOL)executeQuery:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  return -[PBFSQLiteDatabaseConnection executeQuery:bindings:resultRowHandler:error:](self, "executeQuery:bindings:resultRowHandler:error:", a3, 0, a4, a5);
}

- (BOOL)executeQuery:(id)a3 bindings:(id)a4 resultRowHandler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  PBFSQLiteDatabaseConnection *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a4;
  v13 = +[PBFSQLitePreparedStatement _newPreparedStatementForDatabaseConnection:withSQLQuery:]((uint64_t)PBFSQLitePreparedStatement, self, v10);
  -[PBFSQLiteDatabaseConnection loggingCategory](self, "loggingCategory");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    -[NSString lastPathComponent](self->_sqliteDatabasePath, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v24 = self;
    v25 = 2114;
    v26 = v15;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_INFO, "[%p/'%{public}@'] executing statement %@", buf, 0x20u);

  }
  v22 = 0;
  v16 = objc_msgSend(v13, "executeWithBindings:resultRowHandler:error:", v12, v11, &v22);

  v17 = v22;
  v18 = v17;
  if (v17)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v17);
    -[PBFSQLiteDatabaseConnection loggingCategory](self, "loggingCategory");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[NSString lastPathComponent](self->_sqliteDatabasePath, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v24 = self;
      v25 = 2114;
      v26 = v21;
      v27 = 2112;
      v28 = v10;
      v29 = 2112;
      v30 = v18;
      _os_log_error_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_ERROR, "[%p/'%{public}@'] failed to execute SQL statement %@: %@", buf, 0x2Au);

    }
  }

  return v16;
}

- (BOOL)truncateDatabaseAndReturnError:(id *)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint8_t buf[4];
  PBFSQLiteDatabaseConnection *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PBFSQLiteDatabaseConnection_truncateDatabaseAndReturnError___block_invoke;
  v11[3] = &unk_1E86F3DA0;
  v11[4] = &v16;
  v11[5] = &v12;
  -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)self, v11);
  if (v17[5])
  {
    -[PBFSQLiteDatabaseConnection loggingCategory](self, "loggingCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      -[NSString lastPathComponent](self->_sqliteDatabasePath, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v17[5];
      *(_DWORD *)buf = 134218498;
      v23 = self;
      v24 = 2114;
      v25 = v6;
      v26 = 2112;
      v27 = v7;
      _os_log_error_impl(&dword_1CB9FA000, v5, OS_LOG_TYPE_ERROR, "[%p/'%{public}@'] failed to truncate database w/ error: %@", buf, 0x20u);

    }
  }
  else
  {
    -[PBFSQLiteDatabaseConnection loggingCategory](self, "loggingCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      -[NSString lastPathComponent](self->_sqliteDatabasePath, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBFSQLiteDatabaseConnection truncateDatabaseAndReturnError:].cold.1((uint64_t)self, v8, buf, v5);
    }
  }

  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v9 = *((_BYTE *)v13 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __62__PBFSQLiteDatabaseConnection_truncateDatabaseAndReturnError___block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = sqlite3_file_control(a2, 0, 101, 0);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(a2));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pbf_sqliteDatabaseErrorWithCode:errorMessage:", v5, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)performSyncWithDatabase:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 16);
    block[1] = 3221225472;
    block[2] = __55__PBFSQLiteDatabaseConnection_performSyncWithDatabase___block_invoke;
    block[3] = &unk_1E86F2F98;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    block[4] = a1;
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

- (void)performWithDatabase:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PBFSQLiteDatabaseConnection_performWithDatabase___block_invoke;
    v6[3] = &unk_1E86F2F98;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __51__PBFSQLiteDatabaseConnection_performWithDatabase___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __55__PBFSQLiteDatabaseConnection_performSyncWithDatabase___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)lastErrorMessage
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__PBFSQLiteDatabaseConnection_lastErrorMessage__block_invoke;
  v4[3] = &unk_1E86F3DC8;
  v4[4] = &v5;
  -[PBFSQLiteDatabaseConnection performSyncWithDatabase:]((uint64_t)self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __47__PBFSQLiteDatabaseConnection_lastErrorMessage__block_invoke(uint64_t a1, sqlite3 *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_errmsg(a2));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)invalidate
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 8), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1CB9FA000, v2, v3, "[%p/'%{public}@'] invalidating", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_20();
}

void __41__PBFSQLiteDatabaseConnection_invalidate__block_invoke(uint64_t a1)
{
  id *v1;
  NSObject *v2;

  v1 = (id *)(a1 + 32);
  -[PBFSQLiteDatabaseConnection _queue_close](*(_QWORD *)(a1 + 32));
  objc_msgSend(*v1, "loggingCategory");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __41__PBFSQLiteDatabaseConnection_invalidate__block_invoke_cold_1((uint64_t)v1);

}

- (void)_queue_close
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(a1 + 40);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "sqliteDatabaseConnectionWillClose:", a1, (_QWORD)v10);
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

    v8 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    v9 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    -[PBFSQLiteDatabaseConnection _closeConnection](a1);
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__PBFSQLiteDatabaseConnection_addObserver___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __43__PBFSQLiteDatabaseConnection_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PBFSQLiteDatabaseConnection_removeObserver___block_invoke;
  v7[3] = &unk_1E86F2540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __46__PBFSQLiteDatabaseConnection_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)dataDumpResultOfQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__PBFSQLiteDatabaseConnection_dataDumpResultOfQuery_error___block_invoke;
  v10[3] = &unk_1E86F3DF0;
  v8 = v7;
  v11 = v8;
  -[PBFSQLiteDatabaseConnection executeQuery:resultRowHandler:error:](self, "executeQuery:resultRowHandler:error:", v6, v10, a4);

  return v8;
}

void __59__PBFSQLiteDatabaseConnection_dataDumpResultOfQuery_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(v9, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v9, "keyAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      objc_msgSend(v9, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v6);

      ++v4;
    }
    while (v4 < objc_msgSend(v9, "count"));
  }
  objc_msgSend(*(id *)(a1 + 32), "bs_safeAddObject:", v3);

}

- (id)dataDumpResultOfTable:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM '%@'"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBFSQLiteDatabaseConnection dataDumpResultOfQuery:error:](self, "dataDumpResultOfQuery:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)dataDumpForTable:(uint64_t)a3 error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  if (!a1)
    return 0;
  v5 = a2;
  v6 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM %@;"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__PBFSQLiteDatabaseConnection_dataDumpForTable_error___block_invoke;
  v10[3] = &unk_1E86F3DF0;
  v8 = v6;
  v11 = v8;
  objc_msgSend(a1, "executeQuery:resultRowHandler:error:", v7, v10, a3);

  return v8;
}

void __54__PBFSQLiteDatabaseConnection_dataDumpForTable_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(v9, "count"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v9, "keyAtIndex:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      objc_msgSend(v9, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "copy");
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v6);

      ++v4;
    }
    while (v4 < objc_msgSend(v9, "count"));
  }
  objc_msgSend(*(id *)(a1 + 32), "bs_safeAddObject:", v3);

}

- (id)dataDumpResultOfAllTablesWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PBFSQLiteDatabaseConnection tableNames](self, "tableNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v16 = 0;
        -[PBFSQLiteDatabaseConnection dataDumpForTable:error:](self, v11, (uint64_t)&v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v16;
        if (v13)
        {
          v14 = v13;
          if (a3)
            *a3 = objc_retainAutorelease(v13);

          goto LABEL_13;
        }
        objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

- (id)tableNames
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__PBFSQLiteDatabaseConnection_tableNames__block_invoke;
  v6[3] = &unk_1E86F3DF0;
  v4 = v3;
  v7 = v4;
  -[PBFSQLiteDatabaseConnection executeQuery:resultRowHandler:error:](self, "executeQuery:resultRowHandler:error:", CFSTR("SELECT tbl_name from sqlite_master WHERE type = 'table' AND tbl_name NOT LIKE 'sqlite_%'"), v6, 0);

  return v4;
}

void __41__PBFSQLiteDatabaseConnection_tableNames__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringForKey:", CFSTR("tbl_name"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (OS_os_log)loggingCategory
{
  return (OS_os_log *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLoggingCategory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingCategory, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_queryCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sqliteDatabasePath, 0);
}

- (void)prepareStatement:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 8), "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = a1;
  OUTLINED_FUNCTION_1_1();
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1CB9FA000, a3, OS_LOG_TYPE_ERROR, "[%p/'%{public}@'] failed to prepare new statement %@", (uint8_t *)&v7, 0x20u);

}

- (void)truncateDatabaseAndReturnError:(uint8_t *)buf .cold.1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1CB9FA000, log, OS_LOG_TYPE_DEBUG, "[%p/'%{public}@'] successfully truncated database", buf, 0x16u);

}

void __41__PBFSQLiteDatabaseConnection_invalidate__block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(*(_QWORD *)a1 + 8), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_1CB9FA000, v2, v3, "[%p/'%{public}@'] invalidated", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_20();
}

@end
