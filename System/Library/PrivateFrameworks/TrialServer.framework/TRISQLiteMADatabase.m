@implementation TRISQLiteMADatabase

- (TRISQLiteMADatabase)initWithParentDir:(id)a3
{
  id v6;
  TRISQLiteMADatabase *v7;
  TRISQLiteMADatabase *v8;
  id *p_parentDir;
  uint64_t v10;
  NSString *assetDir;
  NSObject *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _PASSqliteDatabase *db;
  _PASSqliteDatabase *v22;
  NSObject *v23;
  TRISQLiteMADatabase *v24;
  NSObject *v25;
  NSObject *v26;
  _PASSqliteDatabase *v27;
  NSObject *v28;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  objc_super v34;
  uint8_t v35[4];
  uint64_t v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteMADatabase.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentDir"));

  }
  v34.receiver = self;
  v34.super_class = (Class)TRISQLiteMADatabase;
  v7 = -[TRISQLiteMADatabase init](&v34, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_18;
  p_parentDir = (id *)&v7->_parentDir;
  objc_storeStrong((id *)&v7->_parentDir, a3);
  objc_msgSend(*p_parentDir, "stringByAppendingPathComponent:", CFSTR("assets"));
  v10 = objc_claimAutoreleasedReturnValue();
  assetDir = v8->_assetDir;
  v8->_assetDir = (NSString *)v10;

  if (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked"))
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Device has never been unlocked prior to db initialization.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_31;
  }
  objc_msgSend(*p_parentDir, "stringByAppendingPathComponent:", CFSTR("TRISQLiteMADatabase.db"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:", v13);

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", *p_parentDir, 1, 0, 0);

  }
  v17 = (void *)MEMORY[0x1E0D81620];
  v18 = (void *)objc_opt_new();
  v33 = 0;
  objc_msgSend(v17, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", v13, 3, v18, &v33);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v33;
  db = v8->_db;
  v8->_db = (_PASSqliteDatabase *)v19;

  v22 = v8->_db;
  if (!v22)
  {
    TRILogCategory_Server();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v20;
      _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Failed to instantiate new database handle: %{public}@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_30;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__24;
  v40 = __Block_byref_object_dispose__24;
  v41 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __41__TRISQLiteMADatabase_initWithParentDir___block_invoke;
  v32[3] = &unk_1E932F8A0;
  v32[4] = &buf;
  if ((-[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](v22, "prepAndRunNonDataQueries:onError:", &unk_1E9363840, v32) & 1) == 0)
  {
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v30 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v35 = 138543362;
      v36 = v30;
      _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Failed to run initial database pragmas: %{public}@", v35, 0xCu);
    }

    -[_PASSqliteDatabase closePermanently](v8->_db, "closePermanently");
    v27 = v8->_db;
    v8->_db = 0;

    if ((v15 & 1) == 0)
      objc_msgSend(MEMORY[0x1E0D81620], "truncateDatabaseAtPath:", v13);
    _Block_object_dispose(&buf, 8);

    goto LABEL_30;
  }
  _Block_object_dispose(&buf, 8);

  if ((v15 & 1) == 0)
  {
    TRILogCategory_Server();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEFAULT, "Created new database: %{public}@", (uint8_t *)&buf, 0xCu);
    }

  }
  if (!-[TRISQLiteMADatabase migrateToVersion:](v8, "migrateToVersion:", *MEMORY[0x1E0D817B8]))
  {
    TRILogCategory_Server();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "TRISQLiteMADatabase: migrations failed", (uint8_t *)&buf, 2u);
    }

LABEL_30:
LABEL_31:
    v24 = 0;
    goto LABEL_32;
  }

LABEL_18:
  v24 = v8;
LABEL_32:

  return v24;
}

uint64_t __41__TRISQLiteMADatabase_initWithParentDir___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return *MEMORY[0x1E0D81788];
}

- (BOOL)vacuum
{
  return -[_PASSqliteDatabase prepAndRunNonDataQueries:onError:](self->_db, "prepAndRunNonDataQueries:onError:", &unk_1E9363858, &__block_literal_global_15);
}

uint64_t __29__TRISQLiteMADatabase_vacuum__block_invoke(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1D207F000, v3, OS_LOG_TYPE_ERROR, "TRISQLiteMADatabase incremental vacuum failed: %{public}@", (uint8_t *)&v5, 0xCu);
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteMADatabase.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteMADatabase.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("transaction"));

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
  -[_PASSqliteDatabase closePermanently](self->_db, "closePermanently");
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
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint8_t buf[4];
  int v18;
  _QWORD v19[2];

  v3 = *(_QWORD *)&a3;
  v19[1] = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "TRISQLiteMADatabase now performing migration.", buf, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0D81578]);
  v19[0] = self;
  v8 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithMigrationObjects:", v9);

  v11 = objc_msgSend(v10, "migrateDatabasesToVersion:", v3);
  switch((int)v11)
  {
    case 0:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v13 = "TRISQLiteMADatabase could not perform migrations (device locked?), try again later.";
      goto LABEL_11;
    case 1:
      goto LABEL_14;
    case 2:
    case 4:
    case 5:
    case 6:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_DWORD *)buf = 67109120;
      v18 = v11;
      v13 = "TRISQLiteMADatabase got an unexpected and unrecoverable migration result of %u. Database is considered corru"
            "pt and Trial storage will be reset on next launch.";
      v14 = v12;
      v15 = 8;
      break;
    case 3:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v13 = "TRISQLiteMADatabase has a future schema version, cannot use database. (DID YOU DOWNGRADE YOUR OS WITHOUT AN "
            "ERASE-INSTALL??? THAT IS NOT SUPPORTED!!!)";
LABEL_11:
      v14 = v12;
      v15 = 2;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRISQLiteMADatabase.m"), 163, CFSTR("Unhandled migration result: %u"), v11);
      goto LABEL_13;
  }
  _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
LABEL_13:

  v8 = 0;
LABEL_14:

  return v8;
}

- (id)databaseHandle
{
  return self->_db;
}

- (id)migrations
{
  void *v2;
  void *v3;
  _QWORD v5[2];
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR(" CREATE TABLE Assets(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     originalContentPath TEXT NOT NULL,     assetPath TEXT,     type TEXT NOT NULL,     specifier TEXT NOT NULL,     version TEXT NOT NULL,     downloaded INTEGER NOT NULL,     assetSize INTEGER NOT NULL,     UNIQUE (type, specifier, version));");
  v5[1] = CFSTR(" CREATE TABLE Locks(    rowid INTEGER PRIMARY KEY AUTOINCREMENT,     type TEXT NOT NULL,     specifier TEXT NOT NULL,     version TEXT NOT NULL,     reason TEXT NOT NULL);");
  v6 = &unk_1E9363E40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
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

- (id)_predicateForAssetSelector:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "assetVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR(" AND version=:version");
  if (!v6)
    v7 = &stru_1E9336E60;
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("type=:type AND specifier=:specifier%@"), v7);

  return v8;
}

- (void)addAutoAssetWithId:(id)a3 atPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __49__TRISQLiteMADatabase_addAutoAssetWithId_atPath___block_invoke;
  v14 = &unk_1E9333150;
  v15 = v7;
  v16 = v6;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x1D8232C48](&v11);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v10, v11, v12, v13, v14);

}

void __49__TRISQLiteMADatabase_addAutoAssetWithId_atPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesOfItemAtPath:error:", *(_QWORD *)(a1 + 32), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileSize");

  objc_msgSend(v4, "db");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__TRISQLiteMADatabase_addAutoAssetWithId_atPath___block_invoke_2;
  v9[3] = &unk_1E932F9F8;
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = v7;
  objc_msgSend(v8, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO     Assets (originalContentPath, type, specifier, version, downloaded, assetSize)     VALUES (:originalContentPath, :type, :specifier, :version, 0, :assetSize);"),
    v9,
    0,
    0);

}

void __49__TRISQLiteMADatabase_addAutoAssetWithId_atPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":originalContentPath", v3);
  objc_msgSend(*(id *)(a1 + 40), "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":type", v5);

  objc_msgSend(*(id *)(a1 + 40), "specifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":specifier", v6);

  objc_msgSend(*(id *)(a1 + 40), "version");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toNonnullNSString:", ":version", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bindNamedParam:toInt64AsNSNumber:", ":assetSize", v8);

}

- (void)endAllPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__TRISQLiteMADatabase_endAllPreviousLocksOfReasonSync_forAssetSelector___block_invoke;
  v11[3] = &unk_1E9333178;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x1D8232C48](v11);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v10);

}

void __72__TRISQLiteMADatabase_endAllPreviousLocksOfReasonSync_forAssetSelector___block_invoke(id *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(a1[4], "_predicateForAssetSelector:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithFormat:", CFSTR(" DELETE FROM     Locks     WHERE reason=:reason AND %@;"), v6);

  objc_msgSend(v4, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__TRISQLiteMADatabase_endAllPreviousLocksOfReasonSync_forAssetSelector___block_invoke_2;
  v9[3] = &unk_1E932FCA8;
  v10 = a1[6];
  v11 = a1[5];
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v8, v9, 0, 0);

}

void __72__TRISQLiteMADatabase_endAllPreviousLocksOfReasonSync_forAssetSelector___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":reason", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 40), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 40), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

- (void)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  TRISQLiteMADatabase *v12;
  id v13;

  v5 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __71__TRISQLiteMADatabase_endAllPreviousLocksOfSelectorSync_forClientName___block_invoke;
  v11 = &unk_1E9333150;
  v12 = self;
  v13 = v5;
  v6 = v5;
  v7 = (void *)MEMORY[0x1D8232C48](&v8);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v7, v8, v9, v10, v11, v12);

}

void __71__TRISQLiteMADatabase_endAllPreviousLocksOfSelectorSync_forClientName___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "_predicateForAssetSelector:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithFormat:", CFSTR(" DELETE FROM     Locks     WHERE %@;"), v6);

  objc_msgSend(v4, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__TRISQLiteMADatabase_endAllPreviousLocksOfSelectorSync_forClientName___block_invoke_2;
  v9[3] = &unk_1E932F1F0;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v8, v9, 0, 0);

}

void __71__TRISQLiteMADatabase_endAllPreviousLocksOfSelectorSync_forClientName___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

- (void)eliminateAllForSelector:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  TRISQLiteMADatabase *v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke;
  v13 = &unk_1E9333150;
  v14 = self;
  v8 = v6;
  v15 = v8;
  v9 = (void *)MEMORY[0x1D8232C48](&v10);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v9, v10, v11, v12, v13, v14);
  if (v7)
    v7[2](v7, v8, 0);

}

void __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "_predicateForAssetSelector:", v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" DELETE FROM     Locks     WHERE %@;"),
                 v13);
  objc_msgSend(v5, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_2;
  v18[3] = &unk_1E932F1F0;
  v19 = *(id *)(a1 + 40);
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v6, v18, 0, 0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" UPDATE Assets SET downloaded=0     WHERE %@;"),
                 v13);
  objc_msgSend(v5, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_3;
  v16[3] = &unk_1E932F1F0;
  v17 = *(id *)(a1 + 40);
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v9, v16, 0, 0);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" SELECT * FROM Assets     WHERE %@"), v13);
  objc_msgSend(v5, "db");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_4;
  v14[3] = &unk_1E932F1F0;
  v15 = *(id *)(a1 + 40);
  objc_msgSend(v12, "prepAndRunQuery:onPrep:onRow:onError:", v11, v14, &__block_literal_global_258, 0);

}

void __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

void __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

void __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

uint64_t __58__TRISQLiteMADatabase_eliminateAllForSelector_completion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "getNSStringForColumnName:table:", "assetPath", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v8);
    v5 = v8;

    if ((v4 & 1) == 0)
    {
      TRILogCategory_Server();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v10 = v2;
        v11 = 2112;
        v12 = v5;
        _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Failed to remove mocked MA asset at path %@: %@", buf, 0x16u);
      }

    }
  }

  return *MEMORY[0x1E0D81780];
}

- (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, id, _QWORD);
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  TRISQLiteMADatabase *v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, id, _QWORD))a4;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke;
  v13 = &unk_1E9333150;
  v14 = self;
  v8 = v6;
  v15 = v8;
  v9 = (void *)MEMORY[0x1D8232C48](&v10);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v9, v10, v11, v12, v13, v14);
  if (v7)
    v7[2](v7, v8, 0);

}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 32), "_predicateForAssetSelector:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" SELECT * FROM     Assets     WHERE downloaded=1 AND %@;"),
                 v5);
  objc_msgSend(v3, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2;
  v29[3] = &unk_1E932F1F0;
  v30 = *(id *)(a1 + 40);
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_3;
  v27[3] = &unk_1E93331E0;
  v9 = v4;
  v28 = v9;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v6, v29, v27, 0);

  objc_msgSend(v3, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  v25[1] = 3221225472;
  v25[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_4;
  v25[3] = &unk_1E93331E0;
  v11 = v9;
  v26 = v11;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM     Locks"), 0, v25, 0);

  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_5;
  v23[3] = &unk_1E9333228;
  v12 = v3;
  v24 = v12;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D8232C48](v23);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        v13[2](v13, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v16);
  }

}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

uint64_t __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;

  v3 = a2;
  objc_msgSend(v3, "nonnullNSStringForColumnName:table:", "type", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nonnullNSStringForColumnName:table:", "specifier", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nonnullNSStringForColumnName:table:", "version", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AB0]), "initWithType:specifier:version:", v4, v5, v6);
  objc_msgSend(v7, "addObject:", v8);

  v9 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v9;
}

uint64_t __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 *v9;

  v3 = a2;
  objc_msgSend(v3, "nonnullNSStringForColumnName:table:", "type", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nonnullNSStringForColumnName:table:", "specifier", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nonnullNSStringForColumnName:table:", "version", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0AB0]), "initWithType:specifier:version:", v4, v5, v6);
  objc_msgSend(v7, "removeObject:", v8);

  v9 = (unsigned __int8 *)MEMORY[0x1E0D81780];
  return *v9;
}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "db");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_6;
  v11[3] = &unk_1E932F1F0;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v4, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" UPDATE Assets SET downloaded=0     WHERE type=:type AND specifier=:specifier AND version=:version;"),
    v11,
    0,
    0);

  objc_msgSend(*(id *)(a1 + 32), "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_7;
  v9[3] = &unk_1E932F1F0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" SELECT * FROM Assets     WHERE type=:type AND specifier=:specifier AND version=:version;"),
    v9,
    &__block_literal_global_273,
    0);

}

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_6(uint64_t a1, void *a2)
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

void __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_7(uint64_t a1, void *a2)
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

uint64_t __74__TRISQLiteMADatabase_eliminatePromotedNeverLockedForSelector_completion___block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "nonnullNSStringForColumnName:table:", "assetPath", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v4 = objc_msgSend(v3, "removeItemAtPath:error:", v2, &v8);
  v5 = v8;

  if ((v4 & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v10 = v2;
      v11 = 2112;
      v12 = v5;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Failed to remove mocked MA asset at path %@: %@", buf, 0x16u);
    }

  }
  return *MEMORY[0x1E0D81780];
}

- (id)lockContentSync:(id)a3 forAssetSelector:(id)a4 withUsagePolicy:(id)a5 withTimeout:(int64_t)a6 lockedAssetSelector:(id *)a7 newerInProgress:(id *)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  TRISQLiteMADatabase *v27;
  id v28;
  id v29;
  __int128 *p_buf;
  SEL v31;
  int64_t v32;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend(v15, "assetVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__24;
    v36 = __Block_byref_object_dispose__24;
    v37 = 0;
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke;
    v26 = &unk_1E9333300;
    v27 = self;
    v28 = v15;
    v31 = a2;
    v29 = v14;
    p_buf = &buf;
    v32 = a6;
    v18 = (void *)MEMORY[0x1D8232C48](&v23);
    objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v18, v23, v24, v25, v26, v27);
    if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
    {
      v19 = objc_alloc(MEMORY[0x1E0C99E98]);
      v20 = (void *)objc_msgSend(v19, "initWithString:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    }
    else
    {
      v20 = 0;
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v15;
      _os_log_impl(&dword_1D207F000, v21, OS_LOG_TYPE_DEFAULT, "lockContentSync called with incomplete asset selector (missing asset version): %@", (uint8_t *)&buf, 0xCu);
    }

    v20 = 0;
  }

  return v20;
}

void __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[7];
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_predicateForAssetSelector:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_2;
  v42[3] = &unk_1E9333250;
  v7 = *(id *)(a1 + 40);
  v46 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 32);
  v43 = v7;
  v44 = v8;
  v45 = *(id *)(a1 + 48);
  objc_msgSend(v5, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR(" INSERT INTO     Locks (type, specifier, version, reason)     VALUES (:type, :specifier, :version, :reason);"),
    v42,
    0,
    &__block_literal_global_281_0);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" SELECT * FROM Assets     WHERE %@;"),
                 v4);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__24;
  v36 = __Block_byref_object_dispose__24;
  v37 = 0;
  objc_msgSend(v3, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_4;
  v30[3] = &unk_1E932F1F0;
  v31 = *(id *)(a1 + 40);
  v29[0] = v6;
  v29[1] = 3221225472;
  v29[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_5;
  v29[3] = &unk_1E9333298;
  v29[4] = *(_QWORD *)(a1 + 56);
  v29[5] = &v32;
  v29[6] = &v38;
  objc_msgSend(v10, "prepAndRunQuery:onPrep:onRow:onError:", v9, v30, v29, &__block_literal_global_286);

  if (!*((_BYTE *)v39 + 24) && *(_QWORD *)(a1 + 72))
  {
    NSTemporaryDirectory();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_opt_new();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v33[5]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "triIdempotentCreateDirectoryOrFaultWithPath:", v14);
      objc_msgSend(v21, "writeToFile:atomically:", v20, 1);
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v14);
      v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" UPDATE Assets SET downloaded=1, assetPath=:assetPath     WHERE %@;"),
                          v4);
      objc_msgSend(v3, "db");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v6;
      v26[1] = 3221225472;
      v26[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_291;
      v26[3] = &unk_1E932FCA8;
      v27 = v14;
      v28 = *(id *)(a1 + 40);
      v25[0] = v6;
      v25[1] = 3221225472;
      v25[2] = __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_2_293;
      v25[3] = &unk_1E9332A70;
      v25[4] = *(_QWORD *)(a1 + 56);
      objc_msgSend(v23, "prepAndRunQuery:onPrep:onRow:onError:", v22, v26, v25, &__block_literal_global_295);

    }
    else
    {
      TRILogCategory_Server();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v33[5];
        *(_DWORD *)buf = 138412290;
        v48 = v24;
        _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "Error reading asset contents from %@", buf, 0xCu);
      }
    }

    goto LABEL_13;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (!*(_QWORD *)(v11 + 40))
  {
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  if ((v13 & 1) == 0)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v11 + 40);
LABEL_9:
    *(_QWORD *)(v11 + 40) = 0;
LABEL_13:

  }
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
}

void __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("TRISQLiteMADatabase.m"), 490, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetSelector.assetVersion"));

  }
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v5);

  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":reason", *(_QWORD *)(a1 + 48));
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_3()
{
  return *MEMORY[0x1E0D81780];
}

void __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_5(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "getInt64ForColumnName:table:", "downloaded", 0);
  objc_msgSend(v3, "getNSStringForColumnName:table:", "assetPath", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(v3, "getNSStringForColumnName:table:", "originalContentPath", 0);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v4 && *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v11, "fileExistsAtPath:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40));

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }
  return *MEMORY[0x1E0D81780];
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_6()
{
  return *MEMORY[0x1E0D81780];
}

void __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_291(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":assetPath", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 40), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 40), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_2_293(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "getNSStringForColumnName:table:", "assetPath", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *MEMORY[0x1E0D81780];
}

uint64_t __126__TRISQLiteMADatabase_lockContentSync_forAssetSelector_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error___block_invoke_3_294()
{
  return *MEMORY[0x1E0D81780];
}

- (id)locksForSelector:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__TRISQLiteMADatabase_locksForSelector___block_invoke;
  v11[3] = &unk_1E9333178;
  v11[4] = self;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  v8 = (void *)MEMORY[0x1D8232C48](v11);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v8);
  v9 = v6;

  return v9;
}

void __40__TRISQLiteMADatabase_locksForSelector___block_invoke(id *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(a1[4], "_predicateForAssetSelector:", a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM Locks     WHERE %@;"), v6);

  objc_msgSend(v4, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__TRISQLiteMADatabase_locksForSelector___block_invoke_2;
  v12[3] = &unk_1E932F1F0;
  v13 = a1[5];
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __40__TRISQLiteMADatabase_locksForSelector___block_invoke_3;
  v10[3] = &unk_1E93331E0;
  v11 = a1[6];
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v9, v12, v10, 0);

}

void __40__TRISQLiteMADatabase_locksForSelector___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

uint64_t __40__TRISQLiteMADatabase_locksForSelector___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getNSStringForColumnName:table:", "reason", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", &unk_1E9363E40, v3);
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

- (unint64_t)assetSizeForSelector:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke;
  v9[3] = &unk_1E9333328;
  v9[4] = self;
  v5 = v4;
  v10 = v5;
  v11 = &v12;
  v6 = (void *)MEMORY[0x1D8232C48](v9);
  objc_msgSend(MEMORY[0x1E0D81630], "writeTransactionWithHandle:block:", self->_db, v6);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "_predicateForAssetSelector:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "initWithFormat:", CFSTR(" SELECT * FROM Assets     WHERE %@;"), v6);

  objc_msgSend(v4, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke_2;
  v11[3] = &unk_1E932F1F0;
  v12 = *(id *)(a1 + 40);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke_3;
  v10[3] = &unk_1E9332A70;
  v10[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v7, "prepAndRunQuery:onPrep:onRow:onError:", v9, v11, v10, 0);

}

void __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assetType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":type", v3);

  objc_msgSend(*(id *)(a1 + 32), "assetSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":specifier", v4);

  objc_msgSend(*(id *)(a1 + 32), "assetVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bindNamedParam:toNonnullNSString:", ":version", v6);

  }
}

uint64_t __44__TRISQLiteMADatabase_assetSizeForSelector___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 *v4;

  objc_msgSend(a2, "getInt64AsNSNumberForColumnName:table:", "assetSize", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "unsignedLongLongValue");
  v4 = (unsigned __int8 *)MEMORY[0x1E0D81780];

  return *v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_assetDir, 0);
  objc_storeStrong((id *)&self->_parentDir, 0);
}

@end
