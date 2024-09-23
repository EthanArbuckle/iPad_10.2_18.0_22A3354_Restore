@implementation TRIAssetStoreDatabase

- (TRIAssetStoreDatabase)initWithPaths:(id)a3 storageManagement:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  TRIAssetStoreDatabase *v12;
  void *v14;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreDatabase.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paths"));

  }
  v9 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v7, "assetStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("assets.db"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  v12 = -[TRIAssetStoreDatabase initWithPaths:databasePath:storageManagement:performMigrations:](self, "initWithPaths:databasePath:storageManagement:performMigrations:", v7, v11, v8, 1);

  return v12;
}

- (TRIAssetStoreDatabase)initWithPaths:(id)a3 assetStorePath:(id)a4 storageManagement:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  TRIAssetStoreDatabase *v14;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreDatabase.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paths"));

  }
  v12 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("assets.db"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v12);
  v14 = -[TRIAssetStoreDatabase initWithPaths:databasePath:storageManagement:performMigrations:](self, "initWithPaths:databasePath:storageManagement:performMigrations:", v9, v13, v11, 1);

  return v14;
}

- (id)initInMemoryAndPerformMigrations:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TRIAssetStoreDatabase *v10;
  void *v12;

  v3 = a3;
  v6 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(CFSTR("assets.db"), "stringByAppendingPathExtension:", CFSTR("testing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreDatabase.m"), 75, CFSTR("Error adding extension on %@"), CFSTR("assets.db"));

  }
  objc_msgSend(MEMORY[0x1E0D81620], "randomlyNamedInMemoryPathWithBaseName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_opt_new();
  v10 = -[TRIAssetStoreDatabase initWithPaths:databasePath:storageManagement:performMigrations:](self, "initWithPaths:databasePath:storageManagement:performMigrations:", 0, v8, v9, v3);

  return v10;
}

- (TRIAssetStoreDatabase)initWithPaths:(id)a3 databasePath:(id)a4 storageManagement:(id)a5 performMigrations:(BOOL)a6
{
  _BOOL4 v6;
  id v12;
  id v13;
  TRIAssetStoreDatabase *v14;
  TRIAssetStoreDatabase *v15;
  id *p_databasePath;
  NSObject *v17;
  void *v18;
  char v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSString *databasePath;
  TRISqliteErrorHandler *v25;
  uint64_t v26;
  _PASSqliteDatabase *db;
  uint64_t v28;
  _PASSqliteDatabase *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  NSUserDefaults *defaults;
  uint64_t v34;
  _PASKVOHandler *kvoHandler;
  _PASKVOHandler *v36;
  NSUserDefaults *v37;
  TRIAssetStoreDatabase *v38;
  NSObject *v39;
  NSObject *v40;
  _PASSqliteDatabase *v41;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  _QWORD v50[5];
  id v51;
  objc_super v52;
  uint8_t v53[4];
  uint64_t v54;
  __int128 buf;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v6 = a6;
  v60 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v12 = a4;
  v13 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreDatabase.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databasePath"));

  }
  v52.receiver = self;
  v52.super_class = (Class)TRIAssetStoreDatabase;
  v14 = -[TRIAssetStoreDatabase init](&v52, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_24;
  objc_storeStrong((id *)&v14->_paths, a3);
  objc_storeStrong((id *)&v15->_storageManagement, a5);
  p_databasePath = (id *)&v15->_databasePath;
  objc_storeStrong((id *)&v15->_databasePath, a4);
  if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", v15->_databasePath) & 1) == 0
    && objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Device has never been unlocked prior to db initialization.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_35;
  }
  if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", *p_databasePath) & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "fileExistsAtPath:", *p_databasePath),
        v18,
        (v19 & 1) == 0))
  {
    if ((objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", *p_databasePath) & 1) == 0)
    {
      objc_msgSend(*p_databasePath, "stringByDeletingLastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, 0);

    }
    v20 = 1;
  }
  else
  {
    v20 = 0;
  }
  v23 = (void *)MEMORY[0x1E0D81620];
  databasePath = v15->_databasePath;
  v25 = -[TRISqliteErrorHandler initWithStorageManagement:]([TRISqliteErrorHandler alloc], "initWithStorageManagement:", v15->_storageManagement);
  v51 = 0;
  objc_msgSend(v23, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", databasePath, 3, v25, &v51);
  v26 = objc_claimAutoreleasedReturnValue();
  v46 = v51;
  db = v15->_db;
  v15->_db = (_PASSqliteDatabase *)v26;

  if (!v15->_db)
  {
    TRILogCategory_Server();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v46;
      _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_34;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__54;
  v58 = __Block_byref_object_dispose__54;
  v59 = 0;
  v28 = MEMORY[0x1E0C809B0];
  v29 = v15->_db;
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __88__TRIAssetStoreDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke;
  v50[3] = &unk_1E932F8A0;
  v50[4] = &buf;
  if ((-[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](v29, "prepAndRunNonDataQueries:onError:", &unk_1E93638E8, v50) & 1) == 0)
  {
    TRILogCategory_Server();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v44 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v53 = 138543362;
      v54 = v44;
      _os_log_error_impl(&dword_1D207F000, v40, OS_LOG_TYPE_ERROR, "Failed to run initial database pragmas: %{public}@", v53, 0xCu);
    }

    -[_PASSqliteDatabase closePermanently](v15->_db, "closePermanently");
    v41 = v15->_db;
    v15->_db = 0;

    if (v20 && (objc_msgSend(MEMORY[0x1E0D81620], "isInMemoryPath:", *p_databasePath) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0D81620], "truncateDatabaseAtPath:", *p_databasePath);
    _Block_object_dispose(&buf, 8);

LABEL_34:
LABEL_35:
    v38 = 0;
    goto LABEL_36;
  }
  _Block_object_dispose(&buf, 8);

  if (v20)
  {
    TRILogCategory_Server();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = *p_databasePath;
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v31;
      _os_log_impl(&dword_1D207F000, v30, OS_LOG_TYPE_DEFAULT, "Created new database: %{public}@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v32 = objc_claimAutoreleasedReturnValue();
  defaults = v15->_defaults;
  v15->_defaults = (NSUserDefaults *)v32;

  v34 = objc_opt_new();
  kvoHandler = v15->_kvoHandler;
  v15->_kvoHandler = (_PASKVOHandler *)v34;

  atomic_store(0, (unsigned __int8 *)&v15->_isQueryPlanLoggingEnabled);
  objc_initWeak((id *)&buf, v15);
  v36 = v15->_kvoHandler;
  v37 = v15->_defaults;
  v48[0] = v28;
  v48[1] = 3221225472;
  v48[2] = __88__TRIAssetStoreDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_43;
  v48[3] = &unk_1E9336558;
  objc_copyWeak(&v49, (id *)&buf);
  -[_PASKVOHandler reactAfterChangesToKeyPath:ofObject:usingBlock:](v36, "reactAfterChangesToKeyPath:ofObject:usingBlock:", CFSTR("queryPlanLoggingEnabled"), v37, v48);
  -[TRIAssetStoreDatabase _updateQueryPlanLogging](v15, "_updateQueryPlanLogging");
  if (v6 && !-[TRIAssetStoreDatabase migrateToVersion:](v15, "migrateToVersion:", *MEMORY[0x1E0D817B8]))
  {
    TRILogCategory_Server();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v53 = 0;
      _os_log_error_impl(&dword_1D207F000, v43, OS_LOG_TYPE_ERROR, "TRIAssetStoreDatabase: migrations failed", v53, 2u);
    }

    objc_destroyWeak(&v49);
    objc_destroyWeak((id *)&buf);

    goto LABEL_35;
  }
  objc_destroyWeak(&v49);
  objc_destroyWeak((id *)&buf);

LABEL_24:
  v38 = v15;
LABEL_36:

  return v38;
}

uint64_t __88__TRIAssetStoreDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return *MEMORY[0x1E0D81788];
}

void __88__TRIAssetStoreDatabase_initWithPaths_databasePath_storageManagement_performMigrations___block_invoke_43(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateQueryPlanLogging");

}

- (BOOL)vacuum
{
  return -[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](self->_db, "prepAndRunNonDataQueries:onError:", &unk_1E9363900, &__block_literal_global_31);
}

uint64_t __31__TRIAssetStoreDatabase_vacuum__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1D207F000, v3, OS_LOG_TYPE_ERROR, "TRIAssetStoreDatabase incremental vacuum failed: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E0D81788];
}

- (BOOL)dropTableWithName:(id)a3 transaction:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreDatabase.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreDatabase.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DROP TABLE %@;"), v7);
  objc_msgSend(v9, "db");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "prepAndRunQuery:onPrep:onRow:onError:", v10, 0, 0, 0);

  return v12;
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
    -[TRIAssetStoreDatabase _enableQueryPlanLogging](self, "_enableQueryPlanLogging");
  else
    -[TRIAssetStoreDatabase _disableQueryPlanLogging](self, "_disableQueryPlanLogging");

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
    v12 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("assets-explainQueryPlan-%@-pid_%d-handle_%p.log"), v10, objc_msgSend(v11, "processIdentifier"), self->_db);

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
        _os_log_impl(&dword_1D207F000, v15, OS_LOG_TYPE_DEFAULT, "TRIAssetStoreDatabase: generating EXPLAIN QUERY PLAN log at \"%{public}@\", buf, 0xCu);
      }

      atomic_store(1u, (unsigned __int8 *)&self->_isQueryPlanLoggingEnabled);
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v13;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "TRIAssetStoreDatabase: unable to generate EXPLAIN QUERY PLAN log at \"%{public}@\", buf, 0xCu);
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
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "TRIAssetStoreDatabase: disable EXPLAIN QUERY PLAN log for handle %p", (uint8_t *)&v7, 0xCu);
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
  TRIStorageManagementProtocol *storageManagement;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  uint8_t buf[4];
  int v20;
  _QWORD v21[2];

  v3 = *(_QWORD *)&a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "TRIAssetStoreDatabase now performing migration.", buf, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0D81578]);
  v21[0] = self;
  v8 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithMigrationObjects:", v9);

  v11 = objc_msgSend(v10, "migrateDatabasesToVersion:", v3);
  switch((int)v11)
  {
    case 0:
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v16 = "TRIAssetStoreDatabase could not perform migrations (device locked?), try again later.";
      goto LABEL_21;
    case 1:
      goto LABEL_19;
    case 2:
    case 4:
    case 5:
    case 6:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v20 = v11;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "TRIAssetStoreDatabase got an unexpected and unrecoverable migration result of %u. Database is considered corrupt and Trial storage will be reset on next launch.", buf, 8u);
      }

      storageManagement = self->_storageManagement;
      if (storageManagement)
      {
        if (-[TRIStorageManagementProtocol requestTrialStorageResetOnNextLaunch](storageManagement, "requestTrialStorageResetOnNextLaunch"))
        {
          TRILogCategory_Server();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "TRIAssetStoreDatabase issuing triald exit request.", buf, 2u);
          }

          xpc_transaction_exit_clean();
        }
      }
      else
      {
        TRILogCategory_Server();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v16 = "TRIAssetStoreDatabase is corrupt but no path for recovery due to nil _storageManagement.";
LABEL_21:
          _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
        }
LABEL_17:

      }
LABEL_18:
      v8 = 0;
LABEL_19:

      return v8;
    case 3:
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v16 = "TRIAssetStoreDatabase has a future schema version, cannot use database. (DID YOU DOWNGRADE YOUR OS WITHOUT A"
            "N ERASE-INSTALL??? THAT IS NOT SUPPORTED!!!)";
      goto LABEL_21;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreDatabase.m"), 278, CFSTR("Unhandled migration result: %u"), v11);

      goto LABEL_18;
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
  _QWORD v5[3];
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR(" CREATE TABLE maAutoAssets(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     type TEXT NOT NULL,     specifier TEXT NOT NULL,     version TEXT NOT NULL,     UNIQUE (type, specifier, version));");
  v5[1] = CFSTR(" CREATE TABLE maAutoAssetPathRefs(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     maAutoAssets_rowid INTEGER NOT NULL,     path TEXT NOT NULL,     UNIQUE (maAutoAssets_rowid, path),     FOREIGN KEY (maAutoAssets_rowid) REFERENCES maAutoAssets (rowid));");
  v5[2] = CFSTR(" CREATE INDEX ix_maAutoAssetPathRefs_maAutoAssets_rowid ON maAutoAssetPathRefs (maAutoAssets_rowid);");
  v6 = &unk_1E9363FD8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)queriesToSkipFromEmptyToVersion:(unsigned int *)a3
{
  if (a3)
    *a3 = 0;
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)addReferenceToAutoAssetId:(id)a3 forLifetimeOfPath:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  TRIAssetStoreDatabase *v15;
  id v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v7 = a3;
  v8 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke;
  v13[3] = &unk_1E93365C8;
  v17 = &v19;
  v9 = v7;
  v18 = a2;
  v14 = v9;
  v15 = self;
  v10 = v8;
  v16 = v10;
  v11 = (void *)MEMORY[0x1D8232C48](v13);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v11);
  LOBYTE(self) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

void __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  char v9;
  id v10;
  sqlite3_int64 insert_rowid;
  void *v12;
  char v13;
  uint64_t v14;
  char v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;

  v3 = a2;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0x8000000000000000;
  objc_msgSend(v3, "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_2;
  v23[3] = &unk_1E932F1F0;
  v24 = *(id *)(a1 + 32);
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_3;
  v22[3] = &unk_1E9332A70;
  v22[4] = &v25;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT rowid FROM     maAutoAssets WHERE         type = :type     AND specifier = :specifier     AND version = :version LIMIT 1;"),
                                                                 v23,
                                                                 v22,
                                                                 0);

  if (v26[3] == 0x8000000000000000)
  {
    objc_msgSend(v3, "db");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    v20[1] = 3221225472;
    v20[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_4;
    v20[3] = &unk_1E932F1F0;
    v21 = *(id *)(a1 + 32);
    v7 = objc_msgSend(v6, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO     maAutoAssets (type, specifier, version)     VALUES (:type, :specifier, :version);"),
           v20,
           0,
           0);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v8 + 24))
      v9 = v7;
    else
      v9 = 0;
    *(_BYTE *)(v8 + 24) = v9;

    objc_msgSend(v3, "db");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    insert_rowid = sqlite3_last_insert_rowid((sqlite3 *)objc_msgSend(v10, "handle"));
    v26[3] = insert_rowid;

    if (v26[3] == 0x8000000000000000)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("TRIAssetStoreDatabase.m"), 367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rowId != INT64_MIN"));

    }
  }
  objc_msgSend(v3, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_5;
  v17[3] = &unk_1E93365A0;
  v19 = &v25;
  v18 = *(id *)(a1 + 48);
  v13 = objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT OR IGNORE INTO     maAutoAssetPathRefs (maAutoAssets_rowid, path)     VALUES (:rowid, :path);"),
          v17,
          0,
          0);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v14 + 24))
    v15 = v13;
  else
    v15 = 0;
  *(_BYTE *)(v14 + 24) = v15;

  _Block_object_dispose(&v25, 8);
}

void __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":type", v5);

  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":specifier", v6);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":version", v7);

}

uint64_t __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "getInt64ForColumnName:table:", "rowid", 0);
  return *MEMORY[0x1E0D81788];
}

void __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":type", v5);

  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":specifier", v6);

  objc_msgSend(*(id *)(a1 + 32), "version");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":version", v7);

}

void __69__TRIAssetStoreDatabase_addReferenceToAutoAssetId_forLifetimeOfPath___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toInt64:", ":rowid", v3);
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":path", *(_QWORD *)(a1 + 32));

}

- (BOOL)enumerateAllAutoAssetReferencesWithBlock:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD *, void *);
  void *v12;
  TRIAssetStoreDatabase *v13;
  id v14;
  uint64_t *v15;
  SEL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v5 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke;
  v12 = &unk_1E93365F0;
  v16 = a2;
  v13 = self;
  v6 = v5;
  v14 = v6;
  v15 = &v17;
  v7 = (void *)MEMORY[0x1D8232C48](&v9);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v7, v9, v10, v11, v12, v13);
  LOBYTE(self) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

void __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke_2;
  v8[3] = &unk_1E93305E8;
  v4 = a1[4];
  v5 = (void *)a1[5];
  v10 = a1[7];
  v8[4] = v4;
  v6 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = v5;
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke_3;
  v7[3] = &unk_1E932F8A0;
  v7[4] = a1[6];
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT     assets.type AS type, assets.specifier AS specifier, assets.version AS version, paths.path as path     FROM maAutoAssets AS assets INNER JOIN maAutoAssetPathRefs as paths     ON assets.rowid = paths.maAutoAssets_rowid"), 0, v8, v7);

}

uint64_t __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned __int8 *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnAlias:", "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIAssetStoreDatabase.m"), 399, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnAlias:\"type\"]"));

  }
  objc_msgSend(v3, "getNSStringForColumnAlias:", "specifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIAssetStoreDatabase.m"), 400, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnAlias:\"specifier\"]"));

  }
  objc_msgSend(v3, "getNSStringForColumnAlias:", "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIAssetStoreDatabase.m"), 401, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnAlias:\"version\"]"));

  }
  objc_msgSend(v3, "getNSStringForColumnAlias:", "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIAssetStoreDatabase.m"), 402, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnAlias:\"path\"]"));

  }
  v8 = a1[5];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AB0]), "initWithType:specifier:version:", v4, v5, v6);
  (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v7);

  v10 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v10;
}

uint64_t __66__TRIAssetStoreDatabase_enumerateAllAutoAssetReferencesWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TRILogCategory_Server();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Enumeration failed with error:%@", (uint8_t *)&v7, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;

  return *MEMORY[0x1E0D81788];
}

- (void)enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock:(id)a3
{
  void (**v5)(id, _QWORD);
  TRIPaths *paths;
  TRIPaths *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[7];
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  TRIPaths *v37;
  uint8_t v38[128];
  uint8_t v39[4];
  void *v40;
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__54;
  v36 = __Block_byref_object_dispose__54;
  paths = self->_paths;
  if (paths)
  {
    v7 = paths;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v7 = (TRIPaths *)objc_claimAutoreleasedReturnValue();
  }
  v37 = v7;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v33[5], "treatmentsDir");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v8, "subpathsOfDirectoryAtPath:error:", v9, &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v31;
  objc_msgSend(v10, "_pas_filteredArrayWithTest:", &__block_literal_global_111_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v24 = v11;
    v13 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_114;
    v30[3] = &unk_1E9336638;
    v30[4] = &v32;
    objc_msgSend(v12, "_pas_mappedArrayWithTransform:", v30);
    v14 = objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v42 = __Block_byref_object_copy__54;
    v43 = __Block_byref_object_dispose__54;
    v44 = (id)objc_opt_new();
    v29[0] = v13;
    v29[1] = 3221225472;
    v29[2] = __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_2;
    v29[3] = &unk_1E9336660;
    v29[5] = buf;
    v29[6] = a2;
    v29[4] = self;
    v15 = (void *)MEMORY[0x1D8232C48](v29);
    objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v15);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minusSet:", v17);

    if (objc_msgSend(v16, "count"))
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v39 = 138543362;
        v40 = v16;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Found missing MA ref db entries: %{public}@", v39, 0xCu);
      }

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v19 = v16;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v19);
            v5[2](v5, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          }
          v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
        }
        while (v20);
        v11 = v24;
      }
    }
    else
    {
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "Did not find any missing MA ref db entries", v39, 2u);
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)v33[5], "treatmentsDir");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v11;
      _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Unable to find subpaths of treatments dir %{public}@: %{public}@", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v32, 8);
}

uint64_t __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsString:", CFSTR("maRefs/"));
}

id __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_114(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  objc_msgSend(v2, "treatmentsDir");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  objc_msgSend(a2, "db");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_3;
  v4[3] = &unk_1E9332B10;
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 32);
  objc_msgSend(v3, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT rowid, maAutoAssets_rowid, path FROM maAutoAssetPathRefs;"),
    0,
    v4,
    0);

}

uint64_t __98__TRIAssetStoreDatabase_enumerateOnDiskMAReferencesWithoutCorrespondingDatabaseEntriesUsingBlock___block_invoke_3(_QWORD *a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;
  void *v6;

  objc_msgSend(a2, "getNSStringForColumnName:table:", "path", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("TRIAssetStoreDatabase.m"), 445, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnName:\"path\" table:nil]"));

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

- (void)enumerateAssetIdsWithoutLiveReferencesUsingBlock:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke;
  v8[3] = &unk_1E93366D8;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D8232C48](v8);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v7);

}

void __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  _QWORD v26[5];
  id v27;
  id v28;
  __int128 v29;
  _QWORD v30[5];
  id v31;
  id v32;
  uint64_t v33;
  _BYTE __buf[16];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  arc4random_buf(__buf, 0x10uLL);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __buf, 16, 0);
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "triHexlify");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("temp_rowIdsToRemove_%@"), v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("CREATE TEMP TABLE %@ (rowid INTEGER PRIMARY KEY);"),
                 v7);
  objc_msgSend(v3, "db");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepAndRunQuery:onPrep:onRow:onError:", v8, 0, 0, 0);

  objc_msgSend(v3, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_2;
  v30[3] = &unk_1E9336688;
  v12 = *(_QWORD *)(a1 + 32);
  v33 = *(_QWORD *)(a1 + 48);
  v30[4] = v12;
  v13 = v3;
  v31 = v13;
  v14 = v7;
  v32 = v14;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT rowid, maAutoAssets_rowid, path FROM maAutoAssetPathRefs;"),
    0,
    v30,
    0);

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DELETE FROM     maAutoAssetPathRefs WHERE     rowid IN (SELECT rowid FROM %@);"),
                  v14);
  objc_msgSend(v13, "db");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "prepAndRunQuery:onPrep:onRow:onError:", v15, 0, 0, 0);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("DELETE FROM %@;"), v14);
  objc_msgSend(v13, "db");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "prepAndRunQuery:onPrep:onRow:onError:", v17, 0, 0, 0);

  objc_msgSend(v13, "db");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_4;
  v26[3] = &unk_1E93366B0;
  v26[4] = *(_QWORD *)(a1 + 32);
  v25 = *(_OWORD *)(a1 + 40);
  v20 = (id)v25;
  v29 = v25;
  v27 = v13;
  v28 = v14;
  v21 = v14;
  v22 = v13;
  objc_msgSend(v19, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT rowid AS r, type, specifier, version FROM     maAutoAssets WHERE     NOT EXISTS(        SELECT * FROM             maAutoAssetPathRefs         WHERE             maAutoAssets_rowid = r    );"),
    0,
    v26,
    0);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DELETE FROM     maAutoAssets WHERE     rowid IN (SELECT rowid FROM %@);"),
                  v21);
  objc_msgSend(v22, "db");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "prepAndRunQuery:onPrep:onRow:onError:", v23, 0, 0, 0);

  objc_msgSend(*(id *)(a1 + 32), "dropTableWithName:transaction:", v21, v22);
}

uint64_t __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  objc_msgSend(v3, "getNSStringForColumnName:table:", "path", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreDatabase.m"), 489, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnName:\"path\" table:nil]"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "db");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("INSERT INTO %@ (rowid) VALUES (:rowid);"),
                   *(_QWORD *)(a1 + 48));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_3;
    v12[3] = &unk_1E932F1F0;
    v13 = v3;
    objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v8, v12, 0, 0);

  }
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v9;
}

void __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":rowid", objc_msgSend(v2, "getInt64ForColumnName:table:", "rowid", 0));

}

uint64_t __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0DC0AB0]);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "type", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("TRIAssetStoreDatabase.m"), 531, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnName:\"type\" table:nil]"));

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "specifier", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("TRIAssetStoreDatabase.m"), 532, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnName:\"specifier\" table:nil]"));

  }
  objc_msgSend(v3, "getNSStringForColumnName:table:", "version", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("TRIAssetStoreDatabase.m"), 533, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[stmt getNSStringForColumnName:\"version\" table:nil]"));

  }
  v8 = (void *)objc_msgSend(v4, "initWithType:specifier:version:", v5, v6, v7);

  (*(void (**)(void))(a1[7] + 16))();
  v9 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v9;
}

void __74__TRIAssetStoreDatabase_enumerateAssetIdsWithoutLiveReferencesUsingBlock___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "bindNamedParam:toInt64:", ":rowid", objc_msgSend(v2, "getInt64ForColumnName:table:", "rowid", 0));

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
