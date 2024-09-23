@implementation TRIDatabase

- (_PASDBTransactionCompletion_)readTransactionWithFailableBlock:(id)a3
{
  id v5;
  _PASDBTransactionCompletion_ v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6.var0 = objc_msgSend(MEMORY[0x1E0D81630], "readTransactionWithHandle:failableBlock:", self->_db, v5);

  return v6;
}

- (id)generalErrorHandlerWithOutError:(id *)a3
{
  return 0;
}

- (TRIDatabase)initWithPaths:(id)a3 storageManagement:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  TRIDatabase *v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paths"));

  }
  v9 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v7, "databaseDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("triald.db"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v12 = -[TRIDatabase initWithPaths:databasePath:storageManagement:performMigrations:](self, "initWithPaths:databasePath:storageManagement:performMigrations:", v7, v11, v8, 1);

  return v12;
}

- (id)initInMemoryAndPerformMigrations:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TRIDatabase *v10;
  void *v12;

  v3 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(CFSTR("triald.db"), "stringByAppendingPathExtension:", CFSTR("testing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 63, CFSTR("Error adding extension on %@"), CFSTR("triald.db"));

  }
  objc_msgSend(MEMORY[0x1E0D81620], "randomlyNamedInMemoryPathWithBaseName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = -[TRIDatabase initWithPaths:databasePath:storageManagement:performMigrations:](self, "initWithPaths:databasePath:storageManagement:performMigrations:", 0, v8, v9, v3);

  return v10;
}

- (TRIDatabase)initWithPaths:(id)a3 databasePath:(id)a4 storageManagement:(id)a5 performMigrations:(BOOL)a6
{
  _BOOL4 v6;
  id v12;
  id v13;
  void *v14;
  TRIDatabase *v15;
  TRIDatabase *v16;
  id *p_databasePath;
  NSObject *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *databasePath;
  TRISqliteErrorHandler *v25;
  uint64_t v26;
  _PASSqliteDatabase *db;
  _PASSqliteDatabase *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _PASSqliteDatabase *v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  NSUserDefaults *defaults;
  uint64_t v39;
  _PASKVOHandler *kvoHandler;
  _PASKVOHandler *v41;
  NSUserDefaults *v42;
  TRIDatabase *v43;
  NSObject *v44;
  _PASSqliteDatabase *v45;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  int v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  _QWORD v58[6];
  id v59;
  objc_super v60;
  uint8_t v61[4];
  uint64_t v62;
  __int128 buf;
  uint64_t v64;
  uint64_t (*v65)(uint64_t, uint64_t);
  void (*v66)(uint64_t);
  id v67;
  __int128 v68;
  uint64_t v69;
  char v70;
  uint64_t v71;

  v6 = a6;
  v71 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v12 = a4;
  v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databasePath"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storageManagement"));

LABEL_3:
  v60.receiver = self;
  v60.super_class = (Class)TRIDatabase;
  v15 = -[TRIDatabase init](&v60, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_paths, a3);
    objc_storeStrong((id *)&v16->_storageManagement, a5);
    p_databasePath = (id *)&v16->_databasePath;
    objc_storeStrong((id *)&v16->_databasePath, a4);
    if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", v16->_databasePath) & 1) == 0
      && objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1D207F000, v18, OS_LOG_TYPE_DEFAULT, "Device has never been unlocked prior to db initialization.", (uint8_t *)&buf, 2u);
      }

      goto LABEL_39;
    }
    if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", *p_databasePath) & 1) != 0
      || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v19 = (void *)objc_claimAutoreleasedReturnValue(),
          v20 = objc_msgSend(v19, "fileExistsAtPath:", *p_databasePath),
          v19,
          (v20 & 1) == 0))
    {
      if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", *p_databasePath) & 1) == 0)
      {
        objc_msgSend(*p_databasePath, "stringByDeletingLastPathComponent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, 0);

      }
      v52 = 1;
    }
    else
    {
      v52 = 0;
    }
    v23 = (void *)MEMORY[0x1E0D81620];
    databasePath = v16->_databasePath;
    v25 = -[TRISqliteErrorHandler initWithStorageManagement:]([TRISqliteErrorHandler alloc], "initWithStorageManagement:", v16->_storageManagement);
    v59 = 0;
    objc_msgSend(v23, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", databasePath, 3, v25, &v59);
    v26 = objc_claimAutoreleasedReturnValue();
    v53 = v59;
    db = v16->_db;
    v16->_db = (_PASSqliteDatabase *)v26;

    if (!v16->_db)
    {
      TRILogCategory_Server();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v53;
        _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_38;
    }
    *(_QWORD *)&v68 = 0;
    *((_QWORD *)&v68 + 1) = &v68;
    v69 = 0x2020000000;
    v70 = 0;
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__57;
    v66 = __Block_byref_object_dispose__57;
    v67 = 0;
    v28 = v16->_db;
    v29 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke;
    v58[3] = &unk_1E93369C0;
    v58[4] = &v68;
    v58[5] = &buf;
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](v28, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("CREATE TABLE IF NOT EXISTS integrityCheck (inconsequential STRING)"), 0, 0, v58);
    if (*(_BYTE *)(*((_QWORD *)&v68 + 1) + 24))
    {
      TRILogCategory_Server();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v48 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v61 = 138412290;
        v62 = v48;
        _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "Encountered corrupt db (%@), attempting to reinitialize", v61, 0xCu);
      }

      v31 = (void *)MEMORY[0x1E0D81620];
      -[_PASSqliteDatabase filename](v16->_db, "filename");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "truncateDatabaseAtPath:", v32);

      -[_PASSqliteDatabase closePermanently](v16->_db, "closePermanently");
      -[TRIStorageManagementProtocol requestTrialStorageResetOnNextLaunch](v16->_storageManagement, "requestTrialStorageResetOnNextLaunch");
      _Block_object_dispose(&buf, 8);

      _Block_object_dispose(&v68, 8);
LABEL_38:

LABEL_39:
      v43 = 0;
      goto LABEL_40;
    }
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v68, 8);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v64 = 0x3032000000;
    v65 = __Block_byref_object_copy__57;
    v66 = __Block_byref_object_dispose__57;
    v67 = 0;
    v34 = v16->_db;
    v57[0] = v29;
    v57[1] = 3221225472;
    v57[2] = __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_37;
    v57[3] = &unk_1E932F8A0;
    v57[4] = &buf;
    if ((-[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](v34, "prepAndRunNonDataQueries:onError:", &unk_1E9363930, v57) & 1) == 0)
    {
      TRILogCategory_Server();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v49 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        LODWORD(v68) = 138543362;
        *(_QWORD *)((char *)&v68 + 4) = v49;
        _os_log_error_impl(&dword_1D207F000, v44, OS_LOG_TYPE_ERROR, "Failed to run initial database pragmas: %{public}@", (uint8_t *)&v68, 0xCu);
      }

      -[_PASSqliteDatabase closePermanently](v16->_db, "closePermanently");
      v45 = v16->_db;
      v16->_db = 0;

      if (v52 && (objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", *p_databasePath) & 1) == 0)
        objc_msgSend(MEMORY[0x1E0D81620], "truncateDatabaseAtPath:", *p_databasePath);
      _Block_object_dispose(&buf, 8);

      goto LABEL_38;
    }
    _Block_object_dispose(&buf, 8);

    if (v52)
    {
      TRILogCategory_Server();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = *p_databasePath;
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v36;
        _os_log_impl(&dword_1D207F000, v35, OS_LOG_TYPE_DEFAULT, "Created new database: %{public}@", (uint8_t *)&buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v37 = objc_claimAutoreleasedReturnValue();
    defaults = v16->_defaults;
    v16->_defaults = (NSUserDefaults *)v37;

    v39 = objc_opt_new();
    kvoHandler = v16->_kvoHandler;
    v16->_kvoHandler = (_PASKVOHandler *)v39;

    atomic_store(0, (unsigned __int8 *)&v16->_isQueryPlanLoggingEnabled);
    objc_initWeak((id *)&buf, v16);
    v41 = v16->_kvoHandler;
    v42 = v16->_defaults;
    v55[0] = v29;
    v55[1] = 3221225472;
    v55[2] = __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_40;
    v55[3] = &unk_1E9336558;
    objc_copyWeak(&v56, (id *)&buf);
    -[_PASKVOHandler reactAfterChangesToKeyPath:ofObject:usingBlock:](v41, "reactAfterChangesToKeyPath:ofObject:usingBlock:", CFSTR("queryPlanLoggingEnabled"), v42, v55);
    -[TRIDatabase _updateQueryPlanLogging](v16, "_updateQueryPlanLogging");
    if (v6 && !-[TRIDatabase migrateToVersion:](v16, "migrateToVersion:", *MEMORY[0x1E0D817B8]))
    {
      TRILogCategory_Server();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v68) = 0;
        _os_log_error_impl(&dword_1D207F000, v47, OS_LOG_TYPE_ERROR, "TRIDatabase: migrations failed", (uint8_t *)&v68, 2u);
      }

      objc_destroyWeak(&v56);
      objc_destroyWeak((id *)&buf);

      goto LABEL_39;
    }
    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)&buf);

  }
  v43 = v16;
LABEL_40:

  return v43;
}

uint64_t __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  return *MEMORY[0x1E0D81788];
}

uint64_t __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_37(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return *MEMORY[0x1E0D81788];
}

void __78__TRIDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_40(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateQueryPlanLogging");

}

- (_PASDBTransactionCompletion_)writeTransactionWithFailableBlock:(id)a3
{
  id v5;
  _PASDBTransactionCompletion_ v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v6.var0 = objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:failableBlock:", self->_db, v5);

  return v6;
}

- (BOOL)vacuum
{
  return -[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](self->_db, "prepAndRunNonDataQueries:onError:", &unk_1E9363948, &__block_literal_global_34);
}

uint64_t __21__TRIDatabase_vacuum__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v2;
    _os_log_error_impl(&dword_1D207F000, v3, OS_LOG_TYPE_ERROR, "TRIDatabase incremental vacuum failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

- (id)createTempTableContainingRowsFromQuery:(id)a3 bind:(id)a4 namePrefix:(id)a5 transaction:(id)a6
{
  id v11;
  id v12;
  __CFString *v13;
  id v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  _BYTE __buf[16];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  v14 = a6;
  v15 = v14;
  if (v11)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

LABEL_3:
  v16 = -[__CFString length](v13, "length");
  v17 = CFSTR("temp");
  if (v16)
    v17 = v13;
  v18 = v17;

  arc4random_buf(__buf, 0x10uLL);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __buf, 16, 0);
  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v19, "triHexlify");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@_%@"), v18, v21);

  objc_msgSend(v15, "db");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE TEMP TABLE %@ AS %@;"),
                  v22,
                  v11);
  -[TRIDatabase generalErrorHandlerWithOutError:](self, "generalErrorHandlerWithOutError:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = objc_msgSend(v23, "prepAndRunQuery:onPrep:onRow:onError:", v24, v12, 0, v25);

  if ((_DWORD)v21)
    v26 = v22;
  else
    v26 = 0;
  v27 = v26;

  return v27;
}

- (BOOL)dropTableWithName:(id)a3 transaction:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 242, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TABLE %@;"), v7);
  objc_msgSend(v9, "db");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIDatabase generalErrorHandlerWithOutError:](self, "generalErrorHandlerWithOutError:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", v10, 0, 0, v12);

  return v13;
}

- (void)closePermanently
{
  _PASKVOHandler *kvoHandler;

  -[_PASSqliteDatabase closePermanently](self->_db, "closePermanently");
  kvoHandler = self->_kvoHandler;
  self->_kvoHandler = 0;

}

- (void)_updateQueryPlanLogging
{
  id v3;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("queryPlanLoggingEnabled"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v3, "BOOLValue"))
    -[TRIDatabase _enableQueryPlanLogging](self, "_enableQueryPlanLogging");
  else
    -[TRIDatabase _disableQueryPlanLogging](self, "_disableQueryPlanLogging");

}

- (void)_enableQueryPlanLogging
{
  void *v3;
  TRIPaths *paths;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D8232A5C](self, a2);
  paths = self->_paths;
  if (paths)
  {
    -[TRIPaths logDir](paths, "logDir");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setFormatOptions:", 51);
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v7, "stringFromDate:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("explainQueryPlan-%@-pid_%d-handle_%p.log"), v10, objc_msgSend(v11, "processIdentifier"), self->_db);

    -[NSObject stringByAppendingPathComponent:](v5, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = -[_PASSqliteDatabase enableQueryPlanLoggingWithPath:](self->_db, "enableQueryPlanLoggingWithPath:", v13);
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((_DWORD)v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v13;
        _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "TRIDatabase: generating EXPLAIN QUERY PLAN log at \"%{public}@\", buf, 0xCu);
      }

      atomic_store(1u, (unsigned __int8 *)&self->_isQueryPlanLoggingEnabled);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v13;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "TRIDatabase: unable to generate EXPLAIN QUERY PLAN log at \"%{public}@\", buf, 0xCu);
      }

    }
  }
  else
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Can't enable query plan logging, TRIPaths not available", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void)_disableQueryPlanLogging
{
  BOOL *p_isQueryPlanLoggingEnabled;
  unsigned __int8 v4;
  NSObject *v5;
  _PASSqliteDatabase *db;
  int v7;
  _PASSqliteDatabase *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[_PASSqliteDatabase disableQueryPlanLogging](self->_db, "disableQueryPlanLogging");
  p_isQueryPlanLoggingEnabled = &self->_isQueryPlanLoggingEnabled;
  do
    v4 = __ldaxr((unsigned __int8 *)p_isQueryPlanLoggingEnabled);
  while (__stlxr(0, (unsigned __int8 *)p_isQueryPlanLoggingEnabled));
  if ((v4 & 1) != 0)
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      db = self->_db;
      v7 = 134217984;
      v8 = db;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "TRIDatabase: disable EXPLAIN QUERY PLAN log for handle %p", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (BOOL)migrateToVersion:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint8_t buf[4];
  int v19;
  _QWORD v20[2];

  v3 = *(_QWORD *)&a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "TRIDatabase now performing migration.", buf, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0D81578]);
  v20[0] = self;
  v8 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithMigrationObjects:", v9);

  v11 = objc_msgSend(v10, "migrateDatabasesToVersion:", v3);
  switch((int)v11)
  {
    case 0:
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_WORD *)buf = 0;
      v16 = "TRIDatabase could not perform migrations (device locked?), try again later.";
      goto LABEL_18;
    case 1:
      goto LABEL_16;
    case 2:
    case 4:
    case 5:
    case 6:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v19 = v11;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "TRIDatabase got an unexpected and unrecoverable migration result of %u. Database is considered corrupt and Trial storage will be reset on next launch.", buf, 8u);
      }

      if (-[TRIStorageManagementProtocol requestTrialStorageResetOnNextLaunch](self->_storageManagement, "requestTrialStorageResetOnNextLaunch"))
      {
        TRILogCategory_Server();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_DEFAULT, "TRIDatabase issuing triald exit request.", buf, 2u);
        }

        xpc_transaction_exit_clean();
      }
      goto LABEL_15;
    case 3:
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "TRIDatabase has a future schema version, cannot use database. (DID YOU DOWNGRADE YOUR OS WITHOUT AN ERASE-"
              "INSTALL??? THAT IS NOT SUPPORTED!!!)";
LABEL_18:
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      }
LABEL_14:

      goto LABEL_15;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIDatabase.m"), 333, CFSTR("Unhandled migration result: %u"), v11);

LABEL_15:
      v8 = 0;
LABEL_16:

      return v8;
  }
}

- (id)databaseHandle
{
  return self->_db;
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
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[3];
  const __CFString *v29;
  const __CFString *v30;
  _QWORD v31[3];
  _QWORD v32[2];
  _QWORD v33[2];
  const __CFString *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  const __CFString *v37;
  const __CFString *v38;
  _QWORD v39[2];
  const __CFString *v40;
  _QWORD v41[3];
  const __CFString *v42;
  _QWORD v43[4];
  const __CFString *v44;
  _QWORD v45[10];
  _QWORD v46[22];
  _QWORD v47[24];

  v47[22] = *MEMORY[0x1E0C80C00];
  v46[0] = &unk_1E9364080;
  v45[0] = CFSTR(" CREATE TABLE experiments(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     experimentId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     type INTEGER NOT NULL,     status INTEGER NOT NULL,     startSecondsFromEpoch REAL,     endSecondsFromEpoch REAL,     treatmentId TEXT,     artifact BLOB NOT NULL,     UNIQUE (experimentId, deploymentId),     CHECK (startSecondsFromEpoch IS NULL         OR endSecondsFromEpoch IS NULL         OR startSecondsFromEpoch < endSecondsFromEpoch));");
  v45[1] = CFSTR(" CREATE TABLE namespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     experiments_rowid INTEGER NOT NULL,     name TEXT NOT NULL,     compatibilityVersion INTEGER NOT NULL,     treatmentPath TEXT,     UNIQUE (experiments_rowid, name),     FOREIGN KEY (experiments_rowid) REFERENCES experiments (rowid));");
  v45[2] = CFSTR(" CREATE TABLE dynamicNamespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     name TEXT NOT NULL,     teamId TEXT NOT NULL,     appContainerId TEXT NOT NULL,     appContainerType INTEGER NOT NULL,     cloudKitContainerId INTEGER NOT NULL,     compatibilityVersion INTEGER NOT NULL,     defaultsFileURL TEXT,     hasFetched INTEGER NOT NULL DEFAULT 0,     UNIQUE (name));");
  v45[3] = CFSTR(" CREATE INDEX     ix_dynamicNamespaces_teamId_cloudKitContainerId ON     dynamicNamespaces (teamId, cloudKitContainerId);");
  v45[4] = CFSTR(" CREATE TABLE kvstore(    key TEXT PRIMARY KEY,     bytes BLOB NOT NULL) WITHOUT ROWID;");
  v45[5] = CFSTR(" CREATE TABLE tasks(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     taskType INTEGER NOT NULL,     serializedTask BLOB NOT NULL,     startSecondsFromEpoch REAL,     hash INTEGER NOT NULL);");
  v45[6] = CFSTR(" CREATE INDEX ix_tasks_hash ON tasks (hash);");
  v45[7] = CFSTR(" CREATE TABLE taskTags(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     taskId INTEGER NOT NULL,     tag TEXT NOT NULL,     UNIQUE (taskId, tag),     FOREIGN KEY (taskId) REFERENCES tasks (rowid));");
  v45[8] = CFSTR(" CREATE INDEX ix_taskTags_tag ON taskTags (tag);");
  v45[9] = CFSTR(" CREATE TABLE taskDependencies(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     taskId INTEGER NOT NULL,     dependentTaskId INTEGER NOT NULL,     UNIQUE (taskId, dependentTaskId),     FOREIGN KEY (taskId) REFERENCES tasks (rowid),     FOREIGN KEY (dependentTaskId) REFERENCES tasks (rowid));");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v24;
  v46[1] = &unk_1E9364098;
  v44 = CFSTR(" CREATE TABLE contentReferences(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     contentId TEXT NOT NULL,     refCount INTEGER NOT NULL,     UNIQUE (contentId));");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v23;
  v46[2] = &unk_1E93640B0;
  v43[0] = CFSTR(" ALTER TABLE experiments ADD COLUMN     deploymentEnvironment INTEGER NOT NULL DEFAULT 0;");
  v43[1] = CFSTR(" CREATE TABLE experimentHistory(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     eventSecondsFromEpoch REAL NOT NULL,     eventType INTEGER NOT NULL,     deploymentEnvironment INTEGER NOT NULL,     experimentId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     treatmentId TEXT NOT NULL);");
  v43[2] = CFSTR(" CREATE TABLE experimentHistoryNamespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     experimentHistory_rowid INTEGER NOT NULL,     name TEXT NOT NULL,     compatibilityVersion INTEGER NOT NULL,     UNIQUE (experimentHistory_rowid, name),     FOREIGN KEY (experimentHistory_rowid) REFERENCES experimentHistory (rowid));");
  v43[3] = CFSTR(" CREATE INDEX ix_experimentHistory_eventSecondsFromEpoch ON experimentHistory(eventSecondsFromEpoch);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47[2] = v22;
  v46[3] = &unk_1E93640C8;
  v42 = CFSTR(" CREATE TABLE activationEvents(    experimentId TEXT NOT NULL,     treatmentId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     osBuild TEXT NOT NULL,     languageCode TEXT NOT NULL,     regionCode TEXT NOT NULL,     UNIQUE (experimentId, treatmentId, deploymentId));");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[3] = v21;
  v46[4] = &unk_1E93640E0;
  v41[0] = CFSTR(" CREATE TABLE rolloutsV2(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     rolloutId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     status INTEGER NOT NULL,     isShadow INTEGER NOT NULL,     activeFactorPackSetId TEXT,     targetedFactorPackSetId TEXT,     artifact BLOB NOT NULL,     UNIQUE (rolloutId, deploymentId));");
  v41[1] = CFSTR(" CREATE TABLE rolloutV2Namespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     rolloutsV2_rowid INTEGER NOT NULL,     name TEXT NOT NULL,     UNIQUE (rolloutsV2_rowid, name),     FOREIGN KEY (rolloutsV2_rowid) REFERENCES rolloutsV2 (rowid));");
  v41[2] = CFSTR(" CREATE INDEX ix_rolloutV2Namespaces_name ON rolloutV2Namespaces(name);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v47[4] = v20;
  v46[5] = &unk_1E93640F8;
  v40 = CFSTR(" CREATE TABLE mlRuntimeEvaluationStatusHistory(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     evaluationId TEXT NOT NULL,     eventSecondsFromEpoch REAL NOT NULL,     serializedMLRuntimeEvaluation BLOB NOT NULL,     serializedEvaluationStatus BLOB NOT NULL,     UNIQUE(evaluationId));");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[5] = v19;
  v46[6] = &unk_1E9364110;
  v39[0] = CFSTR(" CREATE INDEX ix_rolloutsV2_activeFactorPackSetId ON rolloutsV2(activeFactorPackSetId);");
  v39[1] = CFSTR(" CREATE INDEX ix_rolloutsV2_targetedFactorPackSetId ON rolloutsV2(targetedFactorPackSetId);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v47[6] = v18;
  v46[7] = &unk_1E9364128;
  v38 = CFSTR(" ALTER TABLE experiments ADD COLUMN     isShadow INTEGER NOT NULL DEFAULT 0;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[7] = v17;
  v46[8] = &unk_1E9364140;
  v37 = CFSTR(" ALTER TABLE rolloutsV2 ADD COLUMN     rampId TEXT;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47[8] = v16;
  v46[9] = &unk_1E9364158;
  v36[0] = CFSTR(" ALTER TABLE rolloutsV2 ADD COLUMN     activeTargetingRuleIndex INTEGER;");
  v36[1] = CFSTR(" ALTER TABLE rolloutsV2 ADD COLUMN     targetedTargetingRuleIndex INTEGER;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v47[9] = v15;
  v46[10] = &unk_1E9364170;
  v35[0] = CFSTR(" ALTER TABLE rolloutsV2 ADD COLUMN     respectRefCount INTEGER NOT NULL DEFAULT 1;");
  v35[1] = CFSTR(" UPDATE rolloutsV2 SET respectRefCount = 0;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v47[10] = v14;
  v46[11] = &unk_1E9364188;
  v34 = CFSTR(" ALTER TABLE experiments ADD COLUMN     isManuallyTargeted INTEGER NOT NULL DEFAULT 0;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v47[11] = v13;
  v46[12] = &unk_1E93641A0;
  v33[0] = CFSTR(" ALTER TABLE tasks ADD COLUMN     capabilities INTEGER NOT NULL DEFAULT 0;");
  v33[1] = CFSTR("migration_addTaskCapability");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v47[12] = v2;
  v46[13] = &unk_1E93641B8;
  v32[0] = CFSTR(" ALTER TABLE activationEvents ADD COLUMN     carrierBundleId TEXT NOT NULL DEFAULT '';");
  v32[1] = CFSTR(" ALTER TABLE activationEvents ADD COLUMN     carrierCountryCode TEXT NOT NULL DEFAULT '';");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v47[13] = v3;
  v46[14] = &unk_1E93641D0;
  v31[0] = CFSTR(" ALTER TABLE activationEvents ADD COLUMN     diagnosticsUsageEnabled INTEGER NOT NULL DEFAULT 0;");
  v31[1] = CFSTR(" ALTER TABLE activationEvents ADD COLUMN     hasAne INTEGER NOT NULL DEFAULT 0;");
  v31[2] = CFSTR(" ALTER TABLE activationEvents ADD COLUMN     aneVersion TEXT NOT NULL DEFAULT '';");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47[14] = v4;
  v46[15] = &unk_1E93641E8;
  v30 = CFSTR(" CREATE TABLE backgroundMlTasks(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     backgroundMlTaskId TEXT NOT NULL,     deploymentId INTEGER NOT NULL,     pluginId TEXT NOT NULL,     status INTEGER NOT NULL,     endSecondsFromEpoch REAL,     artifact BLOB,     UNIQUE (backgroundMlTaskId, deploymentId));");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[15] = v5;
  v46[16] = &unk_1E9364200;
  v29 = CFSTR(" CREATE TABLE backgroundMlTaskHistory(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     eventSecondsFromEpoch REAL NOT NULL,     eventType INTEGER NOT NULL,     backgroundMlTaskId TEXT NOT NULL,     deploymentId INTEGER NOT NULL);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[16] = v6;
  v47[17] = &unk_1E9363960;
  v46[17] = &unk_1E9364218;
  v46[18] = &unk_1E9364230;
  v28[0] = CFSTR(" CREATE TABLE rolloutHistory(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     eventLogTime REAL NOT NULL,     eventType INTEGER NOT NULL,     rolloutId TEXT NOT NULL,     deploymentId INTEGER,     rampId TEXT,     factorPackSetId TEXT);");
  v28[1] = CFSTR(" CREATE TABLE rolloutHistoryNamespaces(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     rolloutHistory_rowid INTEGER NOT NULL,     name TEXT NOT NULL,     UNIQUE (rolloutHistory_rowid, name),     FOREIGN KEY (rolloutHistory_rowid) REFERENCES rolloutHistory (rowid));");
  v28[2] = CFSTR(" CREATE INDEX ix_rolloutHistory_eventSecondsFromEpoch ON rolloutHistory(eventLogTime);");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v47[18] = v7;
  v46[19] = &unk_1E9364248;
  v27 = CFSTR(" ALTER TABLE backgroundMlTaskHistory ADD COLUMN     factorPackSetId TEXT;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47[19] = v8;
  v46[20] = &unk_1E9364260;
  v26 = CFSTR(" ALTER TABLE experiments ADD COLUMN     factorPackSetId TEXT;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v47[20] = v9;
  v46[21] = &unk_1E9364278;
  v25 = CFSTR(" ALTER TABLE experimentHistory ADD COLUMN     errorOrDeactivationReason TEXT;");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v47[21] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unsigned)migration_addTaskCapability
{
  NSObject *v4;
  id v5;
  _PASSqliteDatabase *db;
  uint64_t v7;
  id v8;
  _QWORD v10[5];
  __CFString *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  uint8_t buf[16];

  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "TRIDatabase calling migration_addTaskCapability", buf, 2u);
  }

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  db = self->_db;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__TRIDatabase_migration_addTaskCapability__block_invoke;
  v12[3] = &unk_1E932F420;
  v13 = v5;
  v14 = a2;
  v12[4] = self;
  v8 = v5;
  -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM tasks;"),
    0,
    v12,
    0);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __42__TRIDatabase_migration_addTaskCapability__block_invoke_204;
  v10[3] = &unk_1E9336A08;
  v10[4] = self;
  v11 = CFSTR(" UPDATE tasks  SET capabilities = :capabilities  WHERE rowid = :rowid ");
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  return 4;
}

uint64_t __42__TRIDatabase_migration_addTaskCapability__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v18;
  void *v19;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "getInt64AsNSNumberForColumnName:table:", "rowid", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIDatabase.m"), 614, CFSTR("read NULL rowid from PRIMARY KEY column"));

  }
  v5 = objc_msgSend(v3, "getInt64ForColumnName:table:", "taskType", 0);
  objc_msgSend(v3, "getNSDataForColumnName:table:", "serializedTask", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIDatabase.m"), 617, CFSTR("read NULL serializedTask from NOT NULL column"));

  }
  +[TRITaskSupport sharedInstance](TRITaskSupport, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "taskClassForTaskType:", v5);

  if (v8)
  {
    objc_msgSend(v8, "parseFromData:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "requiredCapabilities");
      v12 = (void *)a1[5];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v13, v4);

    }
    else
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20[0]) = 0;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failure deserializing task", (uint8_t *)v20, 2u);
      }

    }
    v15 = *MEMORY[0x1E0D81780];

  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v20[0] = 67109120;
      v20[1] = v5;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failure deserializing task of unsupported type %d", (uint8_t *)v20, 8u);
    }

    v15 = *MEMORY[0x1E0D81780];
  }

  return v15;
}

void __42__TRIDatabase_migration_addTaskCapability__block_invoke_204(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__TRIDatabase_migration_addTaskCapability__block_invoke_2;
  v11[3] = &unk_1E932FCA8;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", v7, v11, 0, 0);

}

void __42__TRIDatabase_migration_addTaskCapability__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowid", objc_msgSend(v3, "longLongValue"));
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":capabilities", objc_msgSend(*(id *)(a1 + 40), "unsignedLongLongValue"));

}

- (unsigned)migration_conditionallyRemoveBMLTFactorPackInfo
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "TRIDatabase calling migration_condtionallyRemoveBMLTFactorPackInfo", buf, 2u);
  }

  if ((-[_PASSqliteDatabase hasColumnOnTable:named:](self->_db, "hasColumnOnTable:named:", CFSTR("backgroundMlTasks"), CFSTR("activeFactorPackSetId")) & 1) == 0)
  {
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" ALTER TABLE backgroundMlTasks ADD COLUMN     activeFactorPackSetId TEXT;"),
      0,
      0,
      0);
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Adding activeFactorPackSetId column to backgroundMlTasks", v12, 2u);
    }

  }
  if ((-[_PASSqliteDatabase hasColumnOnTable:named:](self->_db, "hasColumnOnTable:named:", CFSTR("backgroundMlTasks"), CFSTR("activeTargetingRuleIndex")) & 1) == 0)
  {
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" ALTER TABLE backgroundMlTasks ADD COLUMN     activeTargetingRuleIndex INTEGER;"),
      0,
      0,
      0);
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "Adding activeTargetingRuleIndex column to backgroundMlTasks", v11, 2u);
    }

  }
  if ((-[_PASSqliteDatabase hasColumnOnTable:named:](self->_db, "hasColumnOnTable:named:", CFSTR("backgroundMlTasks"), CFSTR("targetedFactorPackSetId")) & 1) == 0)
  {
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" ALTER TABLE backgroundMlTasks ADD COLUMN     targetedFactorPackSetId TEXT;"),
      0,
      0,
      0);
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Adding targetedFactorPackSetId column to backgroundMlTasks", v10, 2u);
    }

  }
  if ((-[_PASSqliteDatabase hasColumnOnTable:named:](self->_db, "hasColumnOnTable:named:", CFSTR("backgroundMlTasks"), CFSTR("targetedTargetingRuleIndex")) & 1) == 0)
  {
    -[_PASSqliteDatabase prepAndRunQuery:onPrep:onRow:onError:](self->_db, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" ALTER TABLE backgroundMlTasks ADD COLUMN     targetedTargetingRuleIndex INTEGER;"),
      0,
      0,
      0);
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Adding targetedTargetingRuleIndex column to backgroundMlTasks", v9, 2u);
    }

  }
  return 4;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3)
    *a3 = 0;
  return (id)MEMORY[0x1E0C9AA60];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kvoHandler, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
