@implementation PPSQLDatabase

- (void)readTransactionWithClient:(unsigned __int8)a3 block:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[PPSQLDatabase _acquireReadOnlyHandleWithClient:](self, "_acquireReadOnlyHandleWithClient:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPTransaction readTransactionWithHandle:block:](PPTransaction, "readTransactionWithHandle:block:", v6, v7);
  -[PPSQLDatabase _releaseReadOnlyHandle:client:](self, "_releaseReadOnlyHandle:client:", v6, v4);

}

- (id)_acquireReadOnlyHandleWithClient:(unsigned __int8)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PPSQLDatabaseHandlePool *handlePool;
  unint64_t totalReadOnlyHandles;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("readOnlyHandleTLSKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "threadDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("readOnlyHandleTLSKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "threadDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("readOnlyHandleCountTLSKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v13, "intValue") + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "threadDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("readOnlyHandleCountTLSKey"));

    v16 = v11;
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("writeTxnOpenTLSKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "threadDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("writeTxnOpenTLSKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "threadDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("readOnlyHandleTLSKey"));

      objc_msgSend(v6, "threadDictionary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E7E59438, CFSTR("readOnlyHandleCountTLSKey"));

      v16 = v19;
    }
    else
    {
      -[NSCondition lock](self->_handlePoolCond, "lock");
      while (1)
      {
        -[NSMutableArray lastObject](self->_handlePool->availableReadOnlyHandles, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        handlePool = self->_handlePool;
        if (v22)
        {
          -[NSMutableArray removeLastObject](handlePool->availableReadOnlyHandles, "removeLastObject");
          v25 = v22;
          goto LABEL_13;
        }
        totalReadOnlyHandles = handlePool->totalReadOnlyHandles;
        if (totalReadOnlyHandles <= 2)
          break;
        -[NSCondition wait](self->_handlePoolCond, "wait");
      }
      handlePool->totalReadOnlyHandles = totalReadOnlyHandles + 1;
      -[PPSQLDatabase _openFreshHandleForClient:](self, "_openFreshHandleForClient:", v3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSQLDatabase.m"), 304, CFSTR("_openFreshHandleForClient() failed on new read-only handle"));

      }
      v25 = v26;
LABEL_13:
      v16 = v25;
      objc_msgSend(v6, "threadDictionary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v16, CFSTR("readOnlyHandleTLSKey"));

      objc_msgSend(v6, "threadDictionary");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_1E7E59438, CFSTR("readOnlyHandleCountTLSKey"));

      -[NSCondition unlock](self->_handlePoolCond, "unlock");
    }
  }

  return v16;
}

- (void)_releaseReadOnlyHandle:(id)a3 client:(unsigned __int8)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v14 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "threadDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("readOnlyHandleCountTLSKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)objc_msgSend(v7, "intValue") < 2)
  {
    objc_msgSend(v5, "threadDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("readOnlyHandleTLSKey"));

    objc_msgSend(v5, "threadDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", CFSTR("readOnlyHandleCountTLSKey"));

    objc_msgSend(v5, "threadDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("writeTxnOpenTLSKey"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 != v14)
    {
      -[NSCondition lock](self->_handlePoolCond, "lock");
      -[NSMutableArray addObject:](self->_handlePool->availableReadOnlyHandles, "addObject:", v14);
      -[NSCondition signal](self->_handlePoolCond, "signal");
      -[NSCondition unlock](self->_handlePoolCond, "unlock");
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "intValue") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "threadDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("readOnlyHandleCountTLSKey"));

  }
}

- (void)writeTransactionWithClient:(unsigned __int8)a3 block:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  -[NSRecursiveLock lock](self->_writeLock, "lock");
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSQLDatabase handleWithClient:](self, "handleWithClient:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("writeTxnOpenTLSKey"));

  +[PPTransaction writeTransactionWithHandle:block:](PPTransaction, "writeTransactionWithHandle:block:", v7, v10);
  objc_msgSend(v6, "threadDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("writeTxnOpenTLSKey"));

  -[NSRecursiveLock unlock](self->_writeLock, "unlock");
}

- (id)_nullableHandleWithClient:(unsigned __int8)a3
{
  uint64_t v3;
  _PASSqliteDatabase *readWriteHandle;
  uint64_t v6;
  PPSQLDatabaseHandlePool *handlePool;
  _PASSqliteDatabase *v8;
  _PASSqliteDatabase *v9;

  v3 = a3;
  -[NSCondition lock](self->_handlePoolCond, "lock");
  readWriteHandle = self->_handlePool->readWriteHandle;
  if (!readWriteHandle)
  {
    -[PPSQLDatabase _openFreshHandleForClient:](self, "_openFreshHandleForClient:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    handlePool = self->_handlePool;
    v8 = handlePool->readWriteHandle;
    handlePool->readWriteHandle = (_PASSqliteDatabase *)v6;

    readWriteHandle = self->_handlePool->readWriteHandle;
  }
  v9 = readWriteHandle;
  -[NSCondition unlock](self->_handlePoolCond, "unlock");
  return v9;
}

- (id)handleWithClient:(unsigned __int8)a3
{
  void *v5;
  void *v7;

  -[PPSQLDatabase _nullableHandleWithClient:](self, "_nullableHandleWithClient:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSQLDatabase.m"), 272, CFSTR("handleWithClient failed to retrieve nonnull readwrite handle"));

  }
  return v5;
}

- (id)_initInStandardParentDirectoryWithPerformMigrations:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  PPSQLDatabase *v6;

  v3 = a3;
  +[PPPaths topDirectory](PPPaths, "topDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSQLDatabase initWithParentDirectory:performMigrations:](self, "initWithParentDirectory:performMigrations:", v5, v3);

  return v6;
}

- (PPSQLDatabase)initWithTemporaryInMemoryDatabaseAndPerformMigrations:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  PPSQLDatabase *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D81620], "randomlyNamedInMemoryPathWithBaseName:", CFSTR("PPSQLDatabase.db"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PPSQLDatabase _initWithPath:performMigrations:](self, "_initWithPath:performMigrations:", v5, v3);

  return v6;
}

- (PPSQLDatabase)initWithParentDirectory:(id)a3 performMigrations:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  PPSQLDatabase *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PPSQLDatabase.db"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v7);
  v9 = -[PPSQLDatabase _initWithPath:performMigrations:](self, "_initWithPath:performMigrations:", v8, v4);

  return v9;
}

- (id)_initWithPath:(id)a3 performMigrations:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  PPSQLDatabase *v9;
  NSString *v10;
  NSString *parentDirectory;
  void *v12;
  NSString *v13;
  NSRecursiveLock *v14;
  NSRecursiveLock *writeLock;
  PPSQLDatabaseHandlePool *v16;
  PPSQLDatabaseHandlePool *handlePool;
  uint64_t v18;
  PPSQLDatabaseHandlePool *v19;
  NSMutableArray *availableReadOnlyHandles;
  NSCondition *v21;
  NSCondition *handlePoolCond;
  PPSQLDatabase *v23;
  const char *v24;
  objc_super v26;
  uint8_t buf[16];

  v4 = a4;
  v7 = a3;
  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    pp_default_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase: cannot instantiate PPSQLDatabase before Class C unlock.", buf, 2u);
    }
    goto LABEL_17;
  }
  v26.receiver = self;
  v26.super_class = (Class)PPSQLDatabase;
  v9 = -[PPSQLDatabase init](&v26, sel_init);
  self = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_path, a3);
    if (-[PPSQLDatabase isInMemory](self, "isInMemory"))
    {
      NSTemporaryDirectory();
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      parentDirectory = self->_parentDirectory;
      self->_parentDirectory = v10;
    }
    else
    {
      v12 = (void *)MEMORY[0x1C3BD6630]();
      -[NSString stringByDeletingLastPathComponent](self->_path, "stringByDeletingLastPathComponent");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_autoreleasePoolPop(v12);
      parentDirectory = self->_parentDirectory;
      self->_parentDirectory = v13;
    }

    v14 = (NSRecursiveLock *)objc_opt_new();
    writeLock = self->_writeLock;
    self->_writeLock = v14;

    v16 = (PPSQLDatabaseHandlePool *)objc_opt_new();
    handlePool = self->_handlePool;
    self->_handlePool = v16;

    v18 = objc_opt_new();
    v19 = self->_handlePool;
    availableReadOnlyHandles = v19->availableReadOnlyHandles;
    v19->availableReadOnlyHandles = (NSMutableArray *)v18;

    v21 = (NSCondition *)objc_opt_new();
    handlePoolCond = self->_handlePoolCond;
    self->_handlePoolCond = v21;

    if (-[PPSQLDatabase _isCorruptionMarkerPresent](self, "_isCorruptionMarkerPresent"))
      -[PPSQLDatabase _handleCorruption](self, "_handleCorruption");
    if (v4)
    {
      if (-[PPSQLDatabase _prepareDatabaseHandleForMigration](self, "_prepareDatabaseHandleForMigration"))
      {
        if (-[PPSQLDatabase migrateToVersion:](self, "migrateToVersion:", *MEMORY[0x1E0D817B8]))
          goto LABEL_13;
        pp_default_log_handle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
LABEL_17:

          v23 = 0;
          goto LABEL_18;
        }
        *(_WORD *)buf = 0;
        v24 = "PPSQLDatabase: migrations failed";
      }
      else
      {
        pp_default_log_handle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_17;
        *(_WORD *)buf = 0;
        v24 = "PPSQLDatabase: can't migrate right now because db can't be opened";
      }
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, v24, buf, 2u);
      goto LABEL_17;
    }
  }
LABEL_13:
  self = self;
  v23 = self;
LABEL_18:

  return v23;
}

- (id)_openFreshHandleForClient:(unsigned __int8)a3
{
  int v3;
  void *v5;
  NSString *path;
  void *v7;
  void *v8;
  NSObject *v9;
  NSString *v10;
  void (**v11)(_QWORD);
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id location;
  char v23;
  _BYTE buf[12];
  __int16 v25;
  int v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v5 = (void *)MEMORY[0x1E0D81620];
  path = self->_path;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "initializeDatabase:withContentProtection:newDatabaseCreated:errorHandler:", path, 3, &v23, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "prepAndRunNonDataQueries:onError:", &unk_1E7E5B338, &__block_literal_global_11463);
    if (v23)
    {
      pp_default_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_path;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        v25 = 1024;
        v26 = v3;
        _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase: creating new database at %@ for client %d", buf, 0x12u);
      }

    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, v8);
    location = 0;
    objc_initWeak(&location, self);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __43__PPSQLDatabase__openFreshHandleForClient___block_invoke_33;
    v19 = &unk_1E7E195C8;
    objc_copyWeak(&v20, (id *)buf);
    objc_copyWeak(&v21, &location);
    v11 = (void (**)(_QWORD))_Block_copy(&v16);
    +[PPSettings sharedInstance](PPSettings, "sharedInstance", v16, v17, v18, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerQueryPlanLoggingChangeHandler:", v11);

    v11[2](v11);
    v13 = v8;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    pp_default_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle", buf, 2u);
    }

  }
  return v8;
}

- (void)_enableQueryLoggingForHandle:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setFormatOptions:", 51);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("explainQueryPlan-%@-pid_%d-handle_%p.log"), v7, objc_msgSend(v8, "processIdentifier"), v3);

  v10 = (void *)MEMORY[0x1C3BD6630]();
  +[PPPaths logDirectory](PPPaths, "logDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  LODWORD(v11) = objc_msgSend(v3, "enableQueryPlanLoggingWithPath:", v12);
  pp_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((_DWORD)v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase: generating EXPLAIN QUERY PLAN log at \"%@\", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v12;
    _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to generate EXPLAIN QUERY PLAN log at \"%@\", buf, 0xCu);
  }

}

- (void)_disableQueryLoggingForHandle:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "disableQueryPlanLogging");
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase: disable EXPLAIN QUERY PLAN log for handle %p", (uint8_t *)&v5, 0xCu);
  }

}

- (BOOL)writeTransactionWithClient:(unsigned __int8)a3 timeoutInSeconds:(double)a4 block:(id)a5
{
  uint64_t v6;
  id v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (a4 < 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPSQLDatabase.m"), 385, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeoutInSeconds >= 0"));

  }
  v10 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v10);
  v12 = -[NSRecursiveLock lockBeforeDate:](self->_writeLock, "lockBeforeDate:", v11);
  if (v12)
  {
    -[PPSQLDatabase writeTransactionWithClient:block:](self, "writeTransactionWithClient:block:", v6, v9);
    -[NSRecursiveLock unlock](self->_writeLock, "unlock");
  }
  else
  {
    pp_default_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v17 = v6;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_INFO, "PPSQLDatabase: write transaction for client %d timed out.", buf, 8u);
    }

  }
  return v12;
}

- (BOOL)isInMemory
{
  return -[NSString containsString:](self->_path, "containsString:", CFSTR("mode=memory"));
}

- (id)parentDirectory
{
  return self->_parentDirectory;
}

- (id)stats
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void (**v19)(void *, void *);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PPSQLDatabase *v25;
  id obj;
  _QWORD aBlock[4];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[PPSQLDatabase handleWithClient:](self, "handleWithClient:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "userVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("version"));

  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("rowCounts"));

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v25 = self;
  -[PPSQLDatabase _allTables](self, "_allTables");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v3, "numberOfRowsInTable:", v11));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rowCounts"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v11);

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("remoteRecordCounts"));

  v16 = (void *)MEMORY[0x1C3BD6630]();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __22__PPSQLDatabase_stats__block_invoke;
  aBlock[3] = &unk_1E7E19640;
  v17 = v3;
  v28 = v17;
  v18 = v4;
  v29 = v18;
  v19 = (void (**)(void *, void *))_Block_copy(aBlock);
  +[PPSQLDatabase tableNameForTable:](PPSQLDatabase, "tableNameForTable:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2](v19, v20);

  +[PPSQLDatabase tableNameForTable:](PPSQLDatabase, "tableNameForTable:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2](v19, v21);

  objc_autoreleasePoolPop(v16);
  -[PPSQLDatabase sourceStats:](v25, "sourceStats:", -1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "toDictionary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, CFSTR("sources"));

  return v18;
}

- (id)sourceStats:(unint64_t)a3 forTableWithName:(id)a4 txnWitness:(id)a5
{
  __int16 v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  __CFString *v11;
  PPSourceStats *v12;
  uint64_t v13;
  __CFString *v14;
  void (**v15)(void *, const __CFString *, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  PPSourceStats *v38;
  _QWORD v40[5];
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD aBlock[4];
  __CFString *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double *v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  double *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  uint64_t v86;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasTableNamed:", CFSTR("sources"));

  if (v10)
  {
    if (v7)
      v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" INNER JOIN %@ ON (sources.id = %@.source_id)"), v7, v7);
    else
      v11 = &stru_1E7E221D0;
    v83 = 0;
    v84 = &v83;
    v85 = 0x2020000000;
    v86 = 0;
    v79 = 0;
    v80 = &v79;
    v81 = 0x2020000000;
    v82 = 0;
    v75 = 0;
    v76 = &v75;
    v77 = 0x2020000000;
    v78 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 0;
    v67 = 0;
    v68 = (double *)&v67;
    v69 = 0x2020000000;
    v70 = 0;
    v64 = (double *)&v63;
    v65 = 0x2020000000;
    v66 = 0xBFF0000000000000;
    v59 = 0;
    v60 = (double *)&v59;
    v61 = 0x2020000000;
    v62 = 0x7FEFFFFFFFFFFFFFLL;
    v63 = 0;
    v55 = 0;
    v56 = (double *)&v55;
    v57 = 0x2020000000;
    v58 = 0x7FEFFFFFFFFFFFFFLL;
    v51 = 0;
    v52 = &v51;
    v53 = 0x2020000000;
    v54 = 0;
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke;
    aBlock[3] = &unk_1E7E19668;
    v14 = v11;
    v50 = v14;
    v15 = (void (**)(void *, const __CFString *, _QWORD))_Block_copy(aBlock);
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v8, "db");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, CFSTR("ref_count"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v13;
      v48[1] = 3221225472;
      v48[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_2;
      v48[3] = &unk_1E7E1BB80;
      v48[4] = &v83;
      objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", v17, 0, v48, 0);

    }
    if ((v6 & 2) != 0)
    {
      objc_msgSend(v8, "db");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, CFSTR("ref_count"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = v13;
      v47[1] = 3221225472;
      v47[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_3;
      v47[3] = &unk_1E7E1BB80;
      v47[4] = &v79;
      objc_msgSend(v18, "prepAndRunQuery:onPrep:onRow:onError:", v19, 0, v47, 0);

    }
    if ((v6 & 0x10) != 0)
    {
      objc_msgSend(v8, "db");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, CFSTR("seconds_from_1970"), 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v13;
      v46[1] = 3221225472;
      v46[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_4;
      v46[3] = &unk_1E7E1BB80;
      v46[4] = &v59;
      objc_msgSend(v20, "prepAndRunQuery:onPrep:onRow:onError:", v21, 0, v46, 0);

    }
    if ((v6 & 0x20) != 0)
    {
      objc_msgSend(v8, "db");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, CFSTR("seconds_from_1970"), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v13;
      v45[1] = 3221225472;
      v45[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_5;
      v45[3] = &unk_1E7E1BB80;
      v45[4] = &v55;
      objc_msgSend(v22, "prepAndRunQuery:onPrep:onRow:onError:", v23, 0, v45, 0);

    }
    if ((v6 & 0x40) != 0)
    {
      objc_msgSend(v8, "db");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT COUNT(DISTINCT bundle_id) AS bundle_id_count FROM sources%@"), v14);
      v44[0] = v13;
      v44[1] = 3221225472;
      v44[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_6;
      v44[3] = &unk_1E7E1BB80;
      v44[4] = &v75;
      objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", v25, 0, v44, 0);

    }
    if ((v6 & 0x80) != 0)
    {
      objc_msgSend(v8, "db");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT COUNT(*) AS doc_id_count FROM (SELECT DISTINCT bundle_id, doc_id FROM sources%@)"), v14);
      v43[0] = v13;
      v43[1] = 3221225472;
      v43[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_7;
      v43[3] = &unk_1E7E1BB80;
      v43[4] = &v71;
      objc_msgSend(v26, "prepAndRunQuery:onPrep:onRow:onError:", v27, 0, v43, 0);

    }
    if ((v6 & 0x100) != 0 && v7)
    {
      objc_msgSend(v8, "db");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT COUNT(DISTINCT source_id) AS record_count FROM %@"), v7);
      v42[0] = v13;
      v42[1] = 3221225472;
      v42[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_8;
      v42[3] = &unk_1E7E1BB80;
      v42[4] = &v51;
      objc_msgSend(v28, "prepAndRunQuery:onPrep:onRow:onError:", v29, 0, v42, 0);

    }
    if ((v6 & 4) != 0)
    {
      if (v7)
      {
        v30 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(CFSTR("SELECT AVG(ref_count) FROM sources"), "stringByAppendingString:", v14);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v30);
      }
      else
      {
        v31 = CFSTR("SELECT AVG(ref_count) FROM sources");
      }
      objc_msgSend(v8, "db");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = v13;
      v41[1] = 3221225472;
      v41[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_9;
      v41[3] = &unk_1E7E1BB80;
      v41[4] = &v67;
      objc_msgSend(v32, "prepAndRunQuery:onPrep:onRow:onError:", v31, 0, v41, 0);

    }
    if ((v6 & 8) != 0)
    {
      objc_msgSend(v8, "db");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v13;
      v40[1] = 3221225472;
      v40[2] = __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_10;
      v40[3] = &unk_1E7E1BB80;
      v40[4] = &v63;
      objc_msgSend(v33, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT ref_count FROM sources ORDER BY ref_count LIMIT 1 OFFSET (SELECT COUNT(*) FROM sources) / 2"), 0, v40, 0);

    }
    if (v60[3] == 1.79769313e308)
    {
      v35 = 0;
    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0C99D68]);
      v35 = (void *)objc_msgSend(v34, "initWithTimeIntervalSince1970:", v60[3]);
    }
    if (v56[3] == 1.79769313e308)
    {
      v37 = 0;
    }
    else
    {
      v36 = objc_alloc(MEMORY[0x1E0C99D68]);
      v37 = (void *)objc_msgSend(v36, "initWithTimeIntervalSince1970:", v56[3]);
    }
    v38 = [PPSourceStats alloc];
    v12 = -[PPSourceStats initWithMinRefCount:maxRefCount:avgRefCount:medianRefCount:earliestDate:latestDate:uniqueBundleIdCount:uniqueDocIdCount:recordCount:](v38, "initWithMinRefCount:maxRefCount:avgRefCount:medianRefCount:earliestDate:latestDate:uniqueBundleIdCount:uniqueDocIdCount:recordCount:", v84[3], v80[3], v35, v37, v76[3], v72[3], v68[3], v64[3], v52[3]);

    _Block_object_dispose(&v51, 8);
    _Block_object_dispose(&v55, 8);
    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v67, 8);
    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(&v83, 8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)sourceStats:(unint64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11353;
  v10 = __Block_byref_object_dispose__11354;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__PPSQLDatabase_sourceStats___block_invoke;
  v5[3] = &unk_1E7E19690;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  -[PPSQLDatabase readTransactionWithClient:block:](self, "readTransactionWithClient:block:", 8, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)checkWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__11353;
  v26 = __Block_byref_object_dispose__11354;
  v27 = 0;
  v5 = (void *)objc_opt_new();
  -[PPSQLDatabase handleWithClient:](self, "handleWithClient:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("integrity_check"));

  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __32__PPSQLDatabase_checkWithError___block_invoke;
  v20[3] = &unk_1E7E1F120;
  v9 = v5;
  v21 = v9;
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __32__PPSQLDatabase_checkWithError___block_invoke_2;
  v19[3] = &unk_1E7E196B8;
  v19[4] = &v22;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("pragma integrity_check"), 0, v20, v19);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("foreign_key_check"));

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __32__PPSQLDatabase_checkWithError___block_invoke_3;
  v17[3] = &unk_1E7E1F120;
  v11 = v9;
  v18 = v11;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __32__PPSQLDatabase_checkWithError___block_invoke_4;
  v16[3] = &unk_1E7E196B8;
  v16[4] = &v22;
  objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("pragma foreign_key_check"), 0, v17, v16);
  if (a3)
  {
    v12 = (void *)v23[5];
    if (v12)
      *a3 = objc_retainAutorelease(v12);
  }
  v13 = v18;
  v14 = v11;

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (id)_allTables
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = (void *)objc_opt_new();
  -[PPSQLDatabase handleWithClient:](self, "handleWithClient:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__PPSQLDatabase__allTables__block_invoke;
  v7[3] = &unk_1E7E1F120;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT name FROM sqlite_master WHERE type = 'table'"), 0, v7, &__block_literal_global_121_11350);

  return v5;
}

- (BOOL)optimizeDatabaseWithShouldContinueBlock:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t (**v7)(_QWORD);
  void (**v8)(_QWORD);
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v16;
  _QWORD v17[4];
  __CFString *v18;
  _QWORD v19[4];
  id v20;
  __CFString *v21;
  _QWORD aBlock[5];
  id v23;
  id v24;
  uint8_t buf[4];
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PPSQLDatabase isInMemory](self, "isInMemory"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v6 = (void *)objc_opt_new();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke;
    aBlock[3] = &unk_1E7E19700;
    aBlock[4] = self;
    v7 = (uint64_t (**)(_QWORD))v4;
    v24 = v7;
    v16 = v6;
    v23 = v16;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_autoreleasePoolPop((void *)MEMORY[0x1C3BD6630]());
    if (v7[2](v7))
    {
      do
      {
        v8[2](v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
          break;
        pp_default_log_handle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 67109120;
          v26 = v11;
          _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_INFO, "Optimizing database with read-only handle %u", buf, 8u);
        }

        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke_126;
        v19[3] = &unk_1E7E1FCE8;
        v12 = v9;
        v20 = v12;
        v21 = CFSTR("PRAGMA optimize(0xFFF6)");
        objc_msgSend(v12, "writeTransaction:", v19);

        -[PPSQLDatabase _releaseReadOnlyHandle:client:](self, "_releaseReadOnlyHandle:client:", v12, 0);
      }
      while ((v7[2](v7) & 1) != 0);
    }
    do
    {
      v5 = v7[2](v7);
      if (!v5)
        break;
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_INFO, "Optimizing database with write handle", buf, 2u);
      }

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke_127;
      v17[3] = &unk_1E7E1EEB0;
      v18 = CFSTR("PRAGMA optimize(0xFFF6)");
      v14 = -[PPSQLDatabase writeTransactionWithClient:timeoutInSeconds:block:](self, "writeTransactionWithClient:timeoutInSeconds:block:", 0, v17, 3.0);

    }
    while (!v14);

  }
  return v5;
}

- (BOOL)vacuumDatabaseWithShouldContinueBlock:(id)a3
{
  unsigned int (**v4)(_QWORD);
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD v10[4];
  unsigned int (**v11)(_QWORD);
  uint64_t *v12;
  uint8_t buf[16];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = (unsigned int (**)(_QWORD))a3;
  if (-[PPSQLDatabase isInMemory](self, "isInMemory"))
  {
    v5 = 1;
  }
  else
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v6 = MEMORY[0x1E0C809B0];
    while (!*((_BYTE *)v15 + 24) && v4[2](v4))
    {
      pp_default_log_handle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_INFO, "Vacuuming database with write handle", buf, 2u);
      }

      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __55__PPSQLDatabase_vacuumDatabaseWithShouldContinueBlock___block_invoke;
      v10[3] = &unk_1E7E19728;
      v11 = v4;
      v12 = &v14;
      v8 = -[PPSQLDatabase writeTransactionWithClient:timeoutInSeconds:block:](self, "writeTransactionWithClient:timeoutInSeconds:block:", 0, v10, 3.0);

      if (v8)
      {
        v5 = *((_BYTE *)v15 + 24) == 0;
        goto LABEL_11;
      }
    }
    v5 = 0;
LABEL_11:
    _Block_object_dispose(&v14, 8);
  }

  return v5;
}

- (BOOL)_isCorruptionMarkerPresent
{
  void *v4;
  void *v5;
  char v6;

  if (-[PPSQLDatabase isInMemory](self, "isInMemory"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D81620], "corruptionMarkerPathForPath:", self->_path);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, 0);

  return v6;
}

- (BOOL)_removeCorruptionMarker
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[PPSQLDatabase isInMemory](self, "isInMemory"))
    return 1;
  objc_msgSend(MEMORY[0x1E0D81620], "corruptionMarkerPathForPath:", self->_path);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v3 = objc_msgSend(v5, "removeItemAtPath:error:", v4, &v9);
  v6 = v9;

  if ((v3 & 1) == 0)
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v6;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "Failed to remove corruption marker at %@: %@", buf, 0x16u);
    }

  }
  return v3;
}

- (BOOL)_handleCorruption
{
  BOOL v3;
  NSObject *v4;
  PPSQLDatabaseHandlePool *handlePool;
  _PASSqliteDatabase *readWriteHandle;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  if (-[PPSQLDatabase isInMemory](self, "isInMemory"))
  {
    return 1;
  }
  else
  {
    -[NSCondition lock](self->_handlePoolCond, "lock");
    pp_default_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, "PPSQLDatabase is waiting to clean up a corrupted database", buf, 2u);
    }

    -[_PASSqliteDatabase closePermanently](self->_handlePool->readWriteHandle, "closePermanently");
    handlePool = self->_handlePool;
    readWriteHandle = handlePool->readWriteHandle;
    handlePool->readWriteHandle = 0;

    while (-[NSMutableArray count](self->_handlePool->availableReadOnlyHandles, "count") != self->_handlePool->totalReadOnlyHandles)
      -[NSCondition wait](self->_handlePoolCond, "wait");
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPSQLDatabase is cleaning up corrupted database", v9, 2u);
    }

    -[NSMutableArray enumerateObjectsUsingBlock:](self->_handlePool->availableReadOnlyHandles, "enumerateObjectsUsingBlock:", &__block_literal_global_131);
    -[NSMutableArray removeAllObjects](self->_handlePool->availableReadOnlyHandles, "removeAllObjects");
    self->_handlePool->totalReadOnlyHandles = 0;
    objc_msgSend(MEMORY[0x1E0D81620], "truncateDatabaseAtPath:", self->_path);
    v3 = -[PPSQLDatabase _removeCorruptionMarker](self, "_removeCorruptionMarker");
    -[NSCondition unlock](self->_handlePoolCond, "unlock");
  }
  return v3;
}

- (BOOL)migrateToVersion:(unsigned int)a3
{
  uint64_t v3;
  unsigned int v5;
  NSObject *v6;
  NSObject *v7;
  int migrationCount;
  id v9;
  BOOL v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  PPSQLDatabase *v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = ++self->_migrationCount;
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 < 4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPSQLDatabase migrating db", buf, 2u);
    }

    v9 = objc_alloc(MEMORY[0x1E0D81578]);
    v17 = self;
    v10 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "initWithMigrationObjects:", v11);

    v12 = -[NSObject migrateDatabasesToVersion:](v7, "migrateDatabasesToVersion:", v3);
    switch(v12)
    {
      case 0:
        pp_default_log_handle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        *(_WORD *)buf = 0;
        v15 = "PPSQLDatabase could not perform migrations (device locked?), try again later";
        break;
      case 1:
        goto LABEL_15;
      case 2:
      case 4:
      case 5:
      case 6:
        pp_default_log_handle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109120;
          v19 = v12;
          _os_log_fault_impl(&dword_1C392E000, v13, OS_LOG_TYPE_FAULT, "PPSQLDatabase got an unexpected and unrecoverable migration result of %u. Database is considered corrupt and will be cleaned up accordingly.", buf, 8u);
        }

        -[PPSQLDatabase _handleCorruption](self, "_handleCorruption");
        v10 = -[PPSQLDatabase migrateToVersion:](self, "migrateToVersion:", v3);
        v7 = 0;
        goto LABEL_15;
      case 3:
        pp_default_log_handle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
        *(_WORD *)buf = 0;
        v15 = "PPSQLDatabase has a future schema version, cannot use database";
        break;
      default:
        goto LABEL_14;
    }
    _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, v15, buf, 2u);
LABEL_13:

  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    migrationCount = self->_migrationCount;
    *(_DWORD *)buf = 67109120;
    v19 = migrationCount;
    _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPSQLDatabase not migrating due to excessive migration attempts (%u)", buf, 8u);
  }
LABEL_14:
  v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)unmigrate
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D81578]);
  v7[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithMigrationObjects:", v4);

  LOBYTE(v4) = objc_msgSend(v5, "unmigrateDatabases") == 1;
  return (char)v4;
}

- (unint64_t)maxSchemaVersion
{
  void *v2;
  unint64_t v3;

  -[PPSQLDatabase migrations](self, "migrations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)_prepareDatabaseHandleForMigration
{
  void *v2;
  BOOL v3;

  -[PPSQLDatabase _nullableHandleWithClient:](self, "_nullableHandleWithClient:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)databaseHandle
{
  return -[PPSQLDatabase handleWithClient:](self, "handleWithClient:", 0);
}

- (unsigned)migration_ConvertLocationDescriptionsToLowercase
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  __CFString *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;

  -[PPSQLDatabase databaseHandle](self, "databaseHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRowsInTable:", CFSTR("loc_records"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke;
  v14[3] = &unk_1E7E19790;
  v15 = v6;
  v16 = a2;
  v14[4] = self;
  v8 = v6;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT id, uuid, hex(uuid) AS uuid_hex, lc_description FROM loc_records"), 0, v14, &__block_literal_global_146_11305);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_149;
  v11[3] = &unk_1E7E197F8;
  v12 = v4;
  v13 = CFSTR("UPDATE loc_records SET lc_description = :lcDescription WHERE id = :id");
  v9 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  return 4;
}

- (id)migrations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[6];
  _QWORD v18[3];
  const __CFString *v19;
  _QWORD v20[5];
  _QWORD v21[20];
  _QWORD v22[2];
  _QWORD v23[12];
  _QWORD v24[9];
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[11];
  _QWORD v28[37];
  _QWORD v29[39];

  v29[37] = *MEMORY[0x1E0C80C00];
  v28[0] = &unk_1E7E59438;
  v27[0] = CFSTR("CREATE TABLE sources(   id INTEGER PRIMARY KEY AUTOINCREMENT,     ref_count INTEGER NOT NULL,     bundle_id TEXT NOT NULL,     group_id TEXT,     doc_id TEXT NOT NULL,     seconds_from_1970 REAL NOT NULL,     sha256 BLOB UNIQUE NOT NULL)");
  v27[1] = CFSTR("CREATE INDEX ix_sources_ref_count ON sources (ref_count)");
  v27[2] = CFSTR("CREATE INDEX ix_sources_bundle_id ON sources (bundle_id)");
  v27[3] = CFSTR("CREATE INDEX ix_sources_bundle_id_group_id ON sources (bundle_id, group_id)");
  v27[4] = CFSTR("CREATE INDEX ix_sources_bundle_id_group_id_doc_id ON sources (bundle_id, group_id, doc_id)");
  v27[5] = CFSTR("CREATE INDEX ix_sources_seconds_from_1970 ON sources (seconds_from_1970)");
  v27[6] = CFSTR("CREATE TABLE ne_records(   id INTEGER PRIMARY KEY AUTOINCREMENT,     name TEXT NOT NULL,     lc_name TEXT NOT NULL,     category INTEGER NOT NULL,     language TEXT NOT NULL,     algorithm INTEGER NOT NULL,     initial_score REAL NOT NULL,     decay_rate REAL NOT NULL,     extraction_os_build TEXT,     extraction_asset_version INTEGER,     source_id INTEGER NOT NULL REFERENCES sources (id),     is_remote INTEGER NOT NULL,     dk_event_id BLOB)");
  v27[7] = CFSTR("CREATE INDEX ne_ix_records_lc_name ON ne_records (lc_name)");
  v27[8] = CFSTR("CREATE INDEX ne_ix_records_category ON ne_records (category)");
  v27[9] = CFSTR("CREATE INDEX ne_ix_records_source_id ON ne_records (source_id)");
  v27[10] = CFSTR("CREATE INDEX ne_ix_records_dk_event_id ON ne_records (dk_event_id)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v15;
  v28[1] = &unk_1E7E59468;
  v26[0] = CFSTR("ALTER TABLE ne_records ADD COLUMN is_sync_eligible INTEGER NOT NULL DEFAULT 0");
  v26[1] = CFSTR("CREATE TABLE kv_blobs(   id INTEGER PRIMARY KEY AUTOINCREMENT,     key TEXT UNIQUE NOT NULL,     value BLOB NOT NULL)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v14;
  v29[2] = &unk_1E7E5B350;
  v28[2] = &unk_1E7E59480;
  v28[3] = &unk_1E7E59498;
  v25[0] = CFSTR("CREATE TABLE tp_records(   id INTEGER PRIMARY KEY AUTOINCREMENT,     qid TEXT NOT NULL,     algorithm INTEGER NOT NULL,     initial_score REAL NOT NULL,     decay_rate REAL NOT NULL,     sentiment_score REAL NOT NULL,     extraction_os_build TEXT,     extraction_asset_version INTEGER,     source_id INTEGER NOT NULL REFERENCES sources (id),     is_remote INTEGER NOT NULL,     is_sync_eligible INTEGER NOT NULL,     dk_event_id BLOB)");
  v25[1] = CFSTR("CREATE INDEX tp_ix_records_qid ON tp_records (qid)");
  v25[2] = CFSTR("CREATE INDEX tp_ix_records_source_id ON tp_records (source_id)");
  v25[3] = CFSTR("CREATE INDEX tp_ix_records_dk_event_id ON tp_records (dk_event_id)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v13;
  v29[4] = &unk_1E7E5B368;
  v28[4] = &unk_1E7E594B0;
  v28[5] = &unk_1E7E594C8;
  v29[5] = &unk_1E7E5B380;
  v28[6] = &unk_1E7E594E0;
  v24[0] = CFSTR("CREATE TABLE loc_records(   id INTEGER PRIMARY KEY AUTOINCREMENT,     clp_location BLOB,     cll_latitude_degrees REAL,     cll_longitude_degrees REAL,     clp_name TEXT,     clp_thoroughfare TEXT,     clp_subThoroughfare TEXT,     clp_locality TEXT,     clp_subLocality TEXT,     clp_administrativeArea TEXT,     clp_subAdministrativeArea TEXT,     clp_postalCode TEXT,     clp_ISOcountryCode TEXT,     clp_country TEXT,     clp_inlandWater TEXT,     clp_ocean TEXT,     uuid BLOB NOT NULL,     category INTEGER NOT NULL,     algorithm INTEGER NOT NULL,     initial_score REAL NOT NULL,     decay_rate REAL NOT NULL,     sentiment_score REAL NOT NULL,     extraction_os_build TEXT,     extraction_asset_version INTEGER,     source_id INTEGER NOT NULL REFERENCES sources (id),     is_remote INTEGER NOT NULL,     is_sync_eligible INTEGER NOT NULL,     dk_event_id BLOB)");
  v24[1] = CFSTR("CREATE INDEX ix_loc_records_source_id ON loc_records (source_id)");
  v24[2] = CFSTR("CREATE INDEX ix_loc_records_dk_event_id ON loc_records (dk_event_id)");
  v24[3] = CFSTR("CREATE INDEX ix_loc_records_cll_latitude ON loc_records (cll_latitude_degrees)");
  v24[4] = CFSTR("CREATE INDEX ix_loc_records_cll_longitude ON loc_records (cll_longitude_degrees)");
  v24[5] = CFSTR("CREATE TABLE loc_records_clp_areasOfInterest(   id INTEGER PRIMARY KEY AUTOINCREMENT,     loc_id INTEGER NOT NULL REFERENCES loc_records (id),     name TEXT NOT NULL)");
  v24[6] = CFSTR("CREATE INDEX ix_loc_records_clp_areasOfInterest_loc_id ON loc_records_clp_areasOfInterest (loc_id)");
  v24[7] = CFSTR("CREATE TABLE loc_records_contextual_ne(   id INTEGER PRIMARY KEY AUTOINCREMENT,     loc_id INTEGER NOT NULL REFERENCES loc_records (id),     name TEXT NOT NULL)");
  v24[8] = CFSTR("CREATE INDEX ix_loc_records_contextual_ne_loc_id ON loc_records_contextual_ne (loc_id)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v12;
  v29[7] = &unk_1E7E5B398;
  v28[7] = &unk_1E7E594F8;
  v28[8] = &unk_1E7E59510;
  v29[8] = &unk_1E7E5B3B0;
  v29[9] = &unk_1E7E5B3C8;
  v28[9] = &unk_1E7E59528;
  v28[10] = &unk_1E7E59540;
  v29[10] = &unk_1E7E5B3E0;
  v29[11] = &unk_1E7E5B3F8;
  v28[11] = &unk_1E7E59558;
  v28[12] = &unk_1E7E59570;
  v23[0] = CFSTR("CREATE TEMPORARY TABLE first_party_sources AS SELECT DISTINCT id AS source_id FROM sources WHERE bundle_id IN ('com.apple.mail',   'com.apple.mobilemail',                     'com.apple.iChat',  'com.apple.MobileSMS',                     'com.apple.Photos', 'com.apple.mobileslideshow',                     'com.apple.Notes',  'com.apple.mobilenotes',                     'com.apple.iCal',   'com.apple.mobilecal',                     'com.apple.camera', 'com.apple.reminders') ");
  v23[1] = CFSTR("CREATE TEMPORARY TABLE invalid_ne_records AS SELECT ne.id, ne.source_id FROM ne_records AS ne JOIN first_party_sources USING (source_id) WHERE is_remote = 1");
  v23[2] = CFSTR("CREATE TEMPORARY TABLE invalid_tp_records AS SELECT tp.id, tp.source_id FROM tp_records AS tp JOIN first_party_sources USING (source_id) WHERE is_remote = 1 ");
  v23[3] = CFSTR("CREATE TEMPORARY TABLE invalid_ref_counts AS SELECT source_id, count(source_id) AS drop_count FROM (SELECT source_id FROM invalid_ne_records       UNION ALL       SELECT source_id FROM invalid_tp_records) GROUP BY source_id");
  v23[4] = CFSTR("UPDATE sources    SET ref_count = (SELECT ref_count - drop_count                     FROM invalid_ref_counts AS ifc                     WHERE sources.id = ifc.source_id) WHERE EXISTS (SELECT *               FROM invalid_ref_counts AS ifc               WHERE sources.id = ifc.source_id)");
  v23[5] = CFSTR("DELETE FROM ne_records WHERE id IN (SELECT id FROM invalid_ne_records)");
  v23[6] = CFSTR("DELETE FROM tp_records WHERE id IN (SELECT id FROM invalid_tp_records)");
  v23[7] = CFSTR("DELETE FROM sources WHERE ref_count <= 0");
  v23[8] = CFSTR("DROP TABLE invalid_ref_counts");
  v23[9] = CFSTR("DROP TABLE invalid_tp_records");
  v23[10] = CFSTR("DROP TABLE invalid_ne_records");
  v23[11] = CFSTR("DROP TABLE first_party_sources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29[12] = v2;
  v28[13] = &unk_1E7E59588;
  v22[0] = CFSTR("CREATE TABLE fb_pending_records (id INTEGER PRIMARY KEY AUTOINCREMENT, seconds_from_1970 REAL NOT NULL, store_type INTEGER NOT NULL, client_bundleid TEXT NOT NULL, client_identifier TEXT NOT NULL, item_string TEXT NOT NULL, feedback_type INTEGER NOT NULL, mapping_id TEXT)");
  v22[1] = CFSTR("CREATE INDEX ix_fb_pending_records_store_type ON fb_pending_records (store_type)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v29[13] = v3;
  v29[14] = &unk_1E7E5B410;
  v28[14] = &unk_1E7E595A0;
  v28[15] = &unk_1E7E595B8;
  v29[15] = &unk_1E7E5B428;
  v28[16] = &unk_1E7E595D0;
  v21[0] = CFSTR("CREATE TABLE new_loc_records(    id INTEGER PRIMARY KEY AUTOINCREMENT,     clp_location BLOB,     cll_latitude_degrees REAL,     cll_longitude_degrees REAL,     clp_name TEXT,     clp_thoroughfare TEXT,     clp_subThoroughfare TEXT,     clp_locality TEXT,     clp_subLocality TEXT,     clp_administrativeArea TEXT,     clp_subAdministrativeArea TEXT,     clp_postalCode TEXT,     clp_ISOcountryCode TEXT,     clp_country TEXT,     clp_inlandWater TEXT,     clp_ocean TEXT,     uuid BLOB NOT NULL,     category INTEGER NOT NULL,     algorithm INTEGER NOT NULL,     initial_score REAL NOT NULL,     decay_rate REAL NOT NULL,     sentiment_score REAL NOT NULL,     extraction_os_build TEXT,     extraction_asset_version INTEGER,     source_id INTEGER NOT NULL REFERENCES sources (id),     is_remote INTEGER NOT NULL,     is_sync_eligible INTEGER NOT NULL,     dk_event_id BLOB,     lc_description TEXT NOT NULL)");
  v21[1] = CFSTR("INSERT INTO new_loc_records SELECT *, COALESCE(clp_name,                    clp_subThoroughfare || ' ' || clp_thoroughfare,                    clp_thoroughfare,                    clp_locality,                    clp_administrativeArea,                    hex(uuid)) AS lc_description FROM loc_records");
  v21[2] = CFSTR("CREATE TABLE new_loc_records_clp_areasOfInterest(   id INTEGER PRIMARY KEY AUTOINCREMENT,     loc_id INTEGER NOT NULL REFERENCES new_loc_records (id),     name TEXT NOT NULL)");
  v21[3] = CFSTR("INSERT INTO new_loc_records_clp_areasOfInterest SELECT * FROM loc_records_clp_areasOfInterest");
  v21[4] = CFSTR("DROP TABLE loc_records_clp_areasOfInterest");
  v21[5] = CFSTR("ALTER TABLE new_loc_records_clp_areasOfInterest RENAME TO loc_records_clp_areasOfInterest");
  v21[6] = CFSTR("CREATE INDEX ix_loc_records_clp_areasOfInterest_loc_id ON loc_records_clp_areasOfInterest (loc_id)");
  v21[7] = CFSTR("CREATE TABLE new_loc_records_contextual_ne(   id INTEGER PRIMARY KEY AUTOINCREMENT,     loc_id INTEGER NOT NULL REFERENCES new_loc_records (id),     name TEXT NOT NULL)");
  v21[8] = CFSTR("INSERT INTO new_loc_records_contextual_ne SELECT * FROM loc_records_contextual_ne");
  v21[9] = CFSTR("DROP TABLE loc_records_contextual_ne");
  v21[10] = CFSTR("ALTER TABLE new_loc_records_contextual_ne RENAME TO loc_records_contextual_ne");
  v21[11] = CFSTR("CREATE INDEX ix_loc_records_contextual_ne_loc_id ON loc_records_contextual_ne (loc_id)");
  v21[12] = CFSTR("DROP TABLE loc_records");
  v21[13] = CFSTR("ALTER TABLE new_loc_records RENAME TO loc_records");
  v21[14] = CFSTR("migration_ConvertLocationDescriptionsToLowercase");
  v21[15] = CFSTR("CREATE INDEX ix_loc_records_source_id ON loc_records (source_id)");
  v21[16] = CFSTR("CREATE INDEX ix_loc_records_dk_event_id ON loc_records (dk_event_id)");
  v21[17] = CFSTR("CREATE INDEX ix_loc_records_cll_latitude ON loc_records (cll_latitude_degrees)");
  v21[18] = CFSTR("CREATE INDEX ix_loc_records_cll_longitude ON loc_records (cll_longitude_degrees)");
  v21[19] = CFSTR("CREATE INDEX ix_loc_records_lc_description ON loc_records (lc_description)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29[16] = v4;
  v28[17] = &unk_1E7E595E8;
  v20[0] = CFSTR("CREATE TABLE cn_handles(   id INTEGER PRIMARY KEY AUTOINCREMENT,     value TEXT NOT NULL)");
  v20[1] = CFSTR("CREATE UNIQUE INDEX ix_cn_handles_value ON cn_handles (value)");
  v20[2] = CFSTR("CREATE TABLE cn_handles_sources(   cn_handle_id INTEGER NOT NULL REFERENCES cn_handles (id),     source_id INTEGER NOT NULL REFERENCES sources (id))");
  v20[3] = CFSTR("CREATE INDEX ix_cn_handles_sources_cn_handle_id ON cn_handles_sources (cn_handle_id)");
  v20[4] = CFSTR("CREATE INDEX ix_cn_handles_sources_source_id ON cn_handles_sources (source_id)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[17] = v5;
  v29[18] = &unk_1E7E5B440;
  v28[18] = &unk_1E7E59600;
  v28[19] = &unk_1E7E59618;
  v19 = CFSTR("CREATE TABLE cn_history_tokens(   client_identifier TEXT PRIMARY KEY,     token BLOB)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[19] = v6;
  v28[20] = &unk_1E7E59630;
  v18[0] = CFSTR("CREATE TABLE ft_records(    id INTEGER PRIMARY KEY AUTOINCREMENT,     name TEXT NOT NULL,     group_id TEXT,     bundle_id TEXT NOT NULL,     category INTEGER NOT NULL,     seconds_from_1970 REAL NOT NULL,     state INTEGER NOT NULL,     value TEXT) ");
  v18[1] = CFSTR("CREATE INDEX ix_ft_record_bundle_group_name ON ft_records (bundle_id, group_id, name)");
  v18[2] = CFSTR("CREATE INDEX ix_ft_record_date ON ft_records (seconds_from_1970)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[20] = v7;
  v28[21] = &unk_1E7E59648;
  v17[0] = CFSTR("CREATE TABLE tp_records_fb_pseudocounts(    id INTEGER PRIMARY KEY AUTOINCREMENT,     item_string TEXT NOT NULL,     feedback_type INTEGER NOT NULL,     last_update_seconds_from_1970 REAL NOT NULL,     pseudocount REAL NOT NULL DEFAULT 1.0,     UNIQUE(item_string, feedback_type))");
  v17[1] = CFSTR("CREATE TABLE ne_records_fb_pseudocounts(    id INTEGER PRIMARY KEY AUTOINCREMENT,     item_string TEXT NOT NULL,     feedback_type INTEGER NOT NULL,     last_update_seconds_from_1970 REAL NOT NULL,     pseudocount REAL NOT NULL DEFAULT 1.0,     UNIQUE(item_string, feedback_type))");
  v17[2] = CFSTR("CREATE TABLE loc_records_fb_pseudocounts(    id INTEGER PRIMARY KEY AUTOINCREMENT,     item_string TEXT NOT NULL,     feedback_type INTEGER NOT NULL,     last_update_seconds_from_1970 REAL NOT NULL,     pseudocount REAL NOT NULL DEFAULT 1.0,     UNIQUE(item_string, feedback_type))");
  v17[3] = CFSTR("CREATE INDEX ix_tp_records_fb_pseudocounts_last_update_seconds_from_1970 ON tp_records_fb_pseudocounts (last_update_seconds_from_1970)");
  v17[4] = CFSTR("CREATE INDEX ix_ne_records_fb_pseudocounts_last_update_seconds_from_1970 ON ne_records_fb_pseudocounts (last_update_seconds_from_1970)");
  v17[5] = CFSTR("CREATE INDEX ix_loc_records_fb_pseudocounts_last_update_seconds_from_1970 ON loc_records_fb_pseudocounts (last_update_seconds_from_1970)");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[21] = v8;
  v29[22] = &unk_1E7E5B458;
  v28[22] = &unk_1E7E59660;
  v28[23] = &unk_1E7E59678;
  v29[23] = &unk_1E7E5B470;
  v29[24] = &unk_1E7E5B488;
  v28[24] = &unk_1E7E59690;
  v28[25] = &unk_1E7E596A8;
  v29[25] = &unk_1E7E5B4A0;
  v29[26] = &unk_1E7E5B4B8;
  v28[26] = &unk_1E7E596C0;
  v28[27] = &unk_1E7E596D8;
  v16[0] = CFSTR("UPDATE loc_records SET lc_description = COALESCE(clp_name || ' ' || clp_subThoroughfare || ' ' || clp_thoroughfare,          clp_name || ' ' || clp_thoroughfare,          clp_name,          clp_subThoroughfare || ' ' || clp_thoroughfare,          clp_thoroughfare,          clp_locality,          clp_administrativeArea,          hex(uuid))");
  v16[1] = CFSTR("migration_ConvertLocationDescriptionsToLowercase");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[27] = v9;
  v29[28] = &unk_1E7E5B4D0;
  v28[28] = &unk_1E7E596F0;
  v28[29] = &unk_1E7E59708;
  v29[29] = &unk_1E7E5B4E8;
  v29[30] = &unk_1E7E5B500;
  v28[30] = &unk_1E7E59720;
  v28[31] = &unk_1E7E59738;
  v29[31] = &unk_1E7E5B518;
  v29[32] = &unk_1E7E5B530;
  v28[32] = &unk_1E7E59750;
  v28[33] = &unk_1E7E59768;
  v29[33] = &unk_1E7E5B548;
  v29[34] = &unk_1E7E5B560;
  v28[34] = &unk_1E7E59780;
  v28[35] = &unk_1E7E59798;
  v28[36] = &unk_1E7E597B0;
  v29[35] = &unk_1E7E5B578;
  v29[36] = &unk_1E7E5B590;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 37);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3)
    *a3 = 0;
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentDirectory, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_handlePoolCond, 0);
  objc_storeStrong((id *)&self->_handlePool, 0);
  objc_storeStrong((id *)&self->_writeLock, 0);
}

uint64_t __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 *v14;
  void *v16;

  v3 = a2;
  objc_msgSend(v3, "getInt64AsNSNumberForColumnAlias:", "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "uuid_hex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumnAlias:", "lc_description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PPSQLDatabase.m"), 878, CFSTR("unexpected nil hex(uuid) during migration_ConvertLocationDescriptionsToLowercase"));

  }
  if (objc_msgSend(v6, "isEqualToString:", v5))
  {
    objc_msgSend(v3, "getNSDataForColumnAlias:", "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v9 = objc_retainAutorelease(v7);
    v10 = (void *)objc_msgSend(v8, "initWithUUIDBytes:", objc_msgSend(v9, "bytes"));
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11;
  }
  v12 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v4, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  v14 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v14;
}

void __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_149(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_2_150;
  v7[3] = &unk_1E7E1F040;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", v4, v7, 0, &__block_literal_global_154);

}

void __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_2_150(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "first");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":id", objc_msgSend(v5, "longLongValue"));

  objc_msgSend(*(id *)(a1 + 32), "second");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNSString:", ":lcDescription", v6);

}

uint64_t __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  pp_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "Error updating location record during Location table migration: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E0D81780];
}

uint64_t __65__PPSQLDatabase_migration_ConvertLocationDescriptionsToLowercase__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  pp_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "Error reading location record during Location table migration: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E0D81780];
}

uint64_t __34__PPSQLDatabase__handleCorruption__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "closePermanently");
}

void __55__PPSQLDatabase_vacuumDatabaseWithShouldContinueBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  v5 = objc_msgSend(v3, "vacuumWithShouldContinueBlock:error:", v4, &v8);
  v6 = v8;

  if ((v5 & 1) == 0)
  {
    pp_default_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_1C392E000, v7, OS_LOG_TYPE_ERROR, "PPSQLDatabase: unable to vacuum database: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

id __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t i;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lock");
  while ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "count");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (v2 >= *(_QWORD *)(v3 + 24))
      break;
    for (i = 0; objc_msgSend(*(id *)(v3 + 16), "count") > i; ++i)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16), "objectAtIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v5) & 1) == 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16), "removeObjectAtIndex:", i);
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
        goto LABEL_11;
      }

      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    }
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
                                                                               + 24))
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", 3.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "waitUntilDate:", v6);

    }
  }
  v5 = 0;
LABEL_11:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "unlock");
  return v5;
}

uint64_t __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke_126(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 40), 0, 0, 0);
}

void __57__PPSQLDatabase_optimizeDatabaseWithShouldContinueBlock___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "db");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", *(_QWORD *)(a1 + 32), 0, 0, 0);

}

uint64_t __27__PPSQLDatabase__allTables__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

uint64_t __27__PPSQLDatabase__allTables__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  pp_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "PPSQLDatabase: _allTables error: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

uint64_t __32__PPSQLDatabase_checkWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned __int8 *v5;

  objc_msgSend(a2, "getNSStringForColumn:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("integrity_check"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v3);

  }
  v5 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v5;
}

uint64_t __32__PPSQLDatabase_checkWithError___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return *MEMORY[0x1E0D81788];
}

uint64_t __32__PPSQLDatabase_checkWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
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
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumn:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getInt64AsNSNumberForColumn:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getNSStringForColumn:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getInt64AsNSNumberForColumn:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = CFSTR("referencesTable");
  v8 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[0] = v8;
  v15[1] = CFSTR("rowid");
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[1] = v9;
  v15[2] = CFSTR("referredTable");
  v10 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[2] = v10;
  v15[3] = CFSTR("constraintIndex");
  v11 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (v6)
      goto LABEL_11;
  }
  else
  {

    if (v6)
    {
LABEL_11:
      if (v5)
        goto LABEL_12;
LABEL_16:

      if (v4)
        goto LABEL_13;
LABEL_17:

      goto LABEL_13;
    }
  }

  if (!v5)
    goto LABEL_16;
LABEL_12:
  if (!v4)
    goto LABEL_17;
LABEL_13:
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("foreign_key_check"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v12);

  return *MEMORY[0x1E0D81780];
}

uint64_t __32__PPSQLDatabase_checkWithError___block_invoke_4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return *MEMORY[0x1E0D81788];
}

void __29__PPSQLDatabase_sourceStats___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "sourceStats:forTableWithName:txnWitness:", *(_QWORD *)(a1 + 48), 0, a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

id __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;

  v5 = a2;
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8 = CFSTR("ASC");
  if (a3)
    v8 = CFSTR("DESC");
  v9 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("SELECT %@ FROM sources%@ ORDER BY %@ %@ LIMIT 1"), v5, *(_QWORD *)(a1 + 32), v5, v8);
  objc_autoreleasePoolPop(v6);

  return v9;
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumn:", 0);
  return *MEMORY[0x1E0D81788];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "getDoubleForColumn:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E0D81788];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "getDoubleForColumn:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E0D81788];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_6(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "bundle_id_count");
  return *MEMORY[0x1E0D81788];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_7(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "doc_id_count");
  return *MEMORY[0x1E0D81788];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_8(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnAlias:", "record_count");
  return *MEMORY[0x1E0D81788];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "getDoubleForColumn:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E0D81788];
}

uint64_t __57__PPSQLDatabase_sourceStats_forTableWithName_txnWitness___block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v3;

  objc_msgSend(a2, "getDoubleForColumn:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v3;
  return *MEMORY[0x1E0D81788];
}

void __22__PPSQLDatabase_stats__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SELECT count(*) AS remote_count FROM %@ WHERE is_remote=1"), v3);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __22__PPSQLDatabase_stats__block_invoke_2;
  v11[3] = &unk_1E7E195F0;
  v12 = *(id *)(a1 + 40);
  v13 = v3;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __22__PPSQLDatabase_stats__block_invoke_3;
  v8[3] = &unk_1E7E19618;
  v9 = v13;
  v10 = *(id *)(a1 + 40);
  v7 = v13;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", v5, 0, v11, v8);

}

uint64_t __22__PPSQLDatabase_stats__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "getIntegerForColumnAlias:", "remote_count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("remoteRecordCounts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  return *MEMORY[0x1E0D81780];
}

uint64_t __22__PPSQLDatabase_stats__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_default_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_fault_impl(&dword_1C392E000, v4, OS_LOG_TYPE_FAULT, "PPSQLDatabase stats failed querying remote record count in table %@: %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("remoteRecordCounts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E7E59450, *(_QWORD *)(a1 + 32));

  return *MEMORY[0x1E0D81780];
}

void __43__PPSQLDatabase__openFreshHandleForClient___block_invoke_33(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v2 && WeakRetained)
  {
    +[PPSettings sharedInstance](PPSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "queryPlanLoggingEnabled");

    if (v4)
      objc_msgSend(v2, "_enableQueryLoggingForHandle:", WeakRetained);
    else
      objc_msgSend(v2, "_disableQueryLoggingForHandle:", WeakRetained);
  }

}

uint64_t __43__PPSQLDatabase__openFreshHandleForClient___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  pp_default_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_1C392E000, v3, OS_LOG_TYPE_ERROR, "Failed to enable foreign keys: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

+ (PPSQLDatabase)sharedInstance
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v8[16];

  pthread_mutex_lock(&sharedInstance_lock);
  if (!sharedInstance_instance)
  {
    v3 = objc_msgSend(objc_alloc((Class)a1), "_initInStandardParentDirectoryWithPerformMigrations:", 1);
    v4 = (void *)sharedInstance_instance;
    sharedInstance_instance = v3;

    if (!sharedInstance_instance)
    {
      pp_default_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPSQLDatabase sharedInstance did not initialize, will try again later. Device may be Class C locked.", v8, 2u);
      }

    }
  }
  v6 = (id)sharedInstance_instance;
  pthread_mutex_unlock(&sharedInstance_lock);
  return (PPSQLDatabase *)v6;
}

+ (id)nonMigratingToolsInstance
{
  void *v3;
  void *v4;

  +[PPPaths topDirectory](PPPaths, "topDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nonMigratingToolsInstanceWithParentDirectory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)nonMigratingToolsInstanceWithParentDirectory:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParentDirectory:performMigrations:", v4, 0);

  return v5;
}

+ (void)dropViewWithName:(id)a3 txnWitness:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a4, "db");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP VIEW %@"), v5);

  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v6, 0, 0, 0);
}

+ (void)dropTableWithName:(id)a3 txnWitness:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a4, "db");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TABLE %@"), v5);

  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v6, 0, 0, 0);
}

+ (id)tableNameForTable:(unsigned __int8)a3
{
  unsigned int v3;
  id result;
  void *v7;

  v3 = a3;
  if (a3 < 3u)
    return off_1E7E19860[a3];
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPSQLDatabase.m"), 1295, CFSTR("Unrecognized table specifier %u"), v3);

  return result;
}

+ (id)createTempViewContainingRowsFromQuery:(id)a3 descriptiveTableName:(id)a4 txnWitness:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (objc_class *)MEMORY[0x1E0CB3940];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [v7 alloc];
  objc_msgSend(MEMORY[0x1E0D70D00], "hexUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("temp.%@_%@"), v9, v12);

  objc_msgSend(v8, "db");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE TEMP VIEW %@ AS %@"), v13, v10);
  objc_msgSend(v14, "prepAndRunQuery:onPrep:onRow:onError:", v15, 0, 0, 0);

  return v13;
}

+ (id)createTempTableContainingRowsFromQuery:(id)a3 descriptiveTableName:(id)a4 txnWitness:(id)a5 bind:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E0CB3940];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = [v10 alloc];
  objc_msgSend(MEMORY[0x1E0D70D00], "hexUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("temp.%@_%@"), v12, v15);

  objc_msgSend(v11, "db");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE TABLE %@ AS %@"), v16, v13);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __93__PPSQLDatabase_createTempTableContainingRowsFromQuery_descriptiveTableName_txnWitness_bind___block_invoke;
  v21[3] = &unk_1E7E19820;
  v22 = v9;
  v19 = v9;
  objc_msgSend(v17, "prepAndRunQuery:onPrep:onRow:onError:", v18, v21, 0, 0);

  return v16;
}

uint64_t __93__PPSQLDatabase_createTempTableContainingRowsFromQuery_descriptiveTableName_txnWitness_bind___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
