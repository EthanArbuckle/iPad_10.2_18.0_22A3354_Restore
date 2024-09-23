@implementation _PBFPosterExtensionDataStoreSQLiteDatabaseImpl

- (_PBFPosterExtensionDataStoreSQLiteDatabaseImpl)initWithURL:(id)a3 options:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v10;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v11;
  uint64_t v12;
  BSAtomicFlag *invalidationFlag;
  NSObject *v14;
  PBFSQLiteDatabaseConnection *v15;
  id v16;
  PBFSQLiteDatabaseConnection *connection;
  PBFSQLiteDatabaseConnection *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  PBFSQLiteDatabaseConnection *v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v30;
  NSObject *v31;
  uint64_t v32;
  NSCache *providerForPosterUUIDCache;
  id *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  objc_super v42;
  uint8_t buf[4];
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  _BYTE v48[14];
  __int16 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v6 = *(_QWORD *)&a4;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v42.receiver = self;
  v42.super_class = (Class)_PBFPosterExtensionDataStoreSQLiteDatabaseImpl;
  v10 = -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl init](&v42, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_33:
    v30 = v11;
    goto LABEL_34;
  }
  v10->_sqliteFlags = v6;
  objc_storeStrong((id *)&v10->_databaseURL, a3);
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D016B8]), "initWithFlag:", 0);
  invalidationFlag = v11->_invalidationFlag;
  v11->_invalidationFlag = (BSAtomicFlag *)v12;

  PBFLogSQLite();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v44 = v11;
    v45 = 2114;
    v46 = v9;
    v47 = 1024;
    *(_DWORD *)v48 = v6;
    _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "[%p] opening database at %{public}@ w/ flags %d", buf, 0x1Cu);
  }

  v41 = 0;
  v15 = -[PBFSQLiteDatabaseConnection initWithFileURL:options:dataProtectionClass:error:]([PBFSQLiteDatabaseConnection alloc], "initWithFileURL:options:dataProtectionClass:error:", v9, v6, 1, &v41);
  v16 = v41;
  connection = v11->_connection;
  v11->_connection = v15;

  v18 = v11->_connection;
  if (v18 && !v16)
  {
    v35 = a5;
    PBFLogSQLite();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBFSQLiteDatabaseConnection setLoggingCategory:](v18, "setLoggingCategory:", v19);

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v20 = objc_msgSend(&unk_1E8741AF0, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v38;
LABEL_8:
      v23 = 0;
      while (1)
      {
        if (*(_QWORD *)v38 != v22)
          objc_enumerationMutation(&unk_1E8741AF0);
        v24 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v23);
        v25 = v11->_connection;
        v36 = 0;
        v26 = -[PBFSQLiteDatabaseConnection executeQuery:error:](v25, "executeQuery:error:", v24, &v36, v35);
        v27 = v36;
        v16 = v27;
        if (!v26)
          break;

        if (v21 == ++v23)
        {
          v21 = objc_msgSend(&unk_1E8741AF0, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
          if (v21)
            goto LABEL_8;
          goto LABEL_30;
        }
      }
      PBFLogSQLite();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134219010;
        v44 = v11;
        v45 = 2114;
        v46 = v24;
        v47 = 2114;
        *(_QWORD *)v48 = v9;
        *(_WORD *)&v48[8] = 1024;
        *(_DWORD *)&v48[10] = v6;
        v49 = 2114;
        v50 = v16;
        _os_log_error_impl(&dword_1CB9FA000, v29, OS_LOG_TYPE_ERROR, "[%p] failed to run pragma '%{public}@' on database at %{public}@ w/ flags %d: %{public}@", buf, 0x30u);
      }

      if (v16)
      {
        if (v35)
          *v35 = objc_retainAutorelease(v16);
        PBFLogSQLite();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl initWithURL:options:error:].cold.1();
        goto LABEL_29;
      }
    }
LABEL_30:
    PBFLogSQLite();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v44 = v11;
      _os_log_impl(&dword_1CB9FA000, v31, OS_LOG_TYPE_DEFAULT, "[%p] successful init", buf, 0xCu);
    }

    v32 = objc_opt_new();
    providerForPosterUUIDCache = v11->_providerForPosterUUIDCache;
    v11->_providerForPosterUUIDCache = (NSCache *)v32;

    -[NSCache setCountLimit:](v11->_providerForPosterUUIDCache, "setCountLimit:", 10);
    goto LABEL_33;
  }
  if (!v16)
  {
    _PBFPosterExtensionDataStoreSQLiteDatabaseError(2, 0, 0, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a5 && v16)
    *a5 = objc_retainAutorelease(v16);
  PBFLogSQLite();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218754;
    v44 = v11;
    v45 = 2114;
    v46 = v9;
    v47 = 1024;
    *(_DWORD *)v48 = v6;
    *(_WORD *)&v48[4] = 2114;
    *(_QWORD *)&v48[6] = v16;
    _os_log_error_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_ERROR, "[%p] failed open database at %{public}@ w/ flags %d: %{public}@", buf, 0x26u);
  }
LABEL_29:

  v30 = 0;
LABEL_34:

  return v30;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PBFLogSQLite();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1CB9FA000, v3, OS_LOG_TYPE_DEFAULT, "[%p] dealloc", buf, 0xCu);
  }

  -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl invalidate](self, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)_PBFPosterExtensionDataStoreSQLiteDatabaseImpl;
  -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl dealloc](&v4, sel_dealloc);
}

- (unint64_t)version
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl dataStoreMetadataWithError:](self, "dataStoreMetadataWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("version"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)setup
{
  void *v4;
  void *v5;
  NSObject *v6;
  PBFSQLiteDatabaseConnection *connection;
  BOOL v8;
  id v9;
  uint64_t v10;
  PBFSQLiteDatabaseConnection *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  uint64_t v25;
  PBFSQLiteDatabaseConnection *v26;
  NSObject *v27;
  NSObject *v28;
  NSURL *databaseURL;
  id v30;
  NSURL *v31;
  int sqliteFlags;
  void *v33;
  NSObject *v34;
  NSURL *v35;
  int v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  uint8_t buf[4];
  _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  _BYTE v52[18];
  _BYTE v53[128];
  _QWORD v54[5];

  v54[2] = *MEMORY[0x1E0C80C00];
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl dataStoreMetadataWithError:](self, "dataStoreMetadataWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PBFLogSQLite();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v48 = self;
    _os_log_impl(&dword_1CB9FA000, v6, OS_LOG_TYPE_DEFAULT, "[%p] setup", buf, 0xCu);
  }

  v37 = v5;
  if ((self->_sqliteFlags & 1) != 0)
  {
    PBFLogSQLite();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v48 = self;
      _os_log_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_DEFAULT, "[%p] setup bail; is readonly", buf, 0xCu);
    }
    v9 = 0;
    goto LABEL_19;
  }
  connection = self->_connection;
  v46 = 0;
  v8 = -[PBFSQLiteDatabaseConnection executeQuery:error:](connection, "executeQuery:error:", CFSTR("BEGIN TRANSACTION;"),
         &v46);
  v9 = v46;
  if (!v8)
  {
    PBFLogSQLite();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl setup].cold.3();
    goto LABEL_19;
  }
  if (v5)
  {
    v10 = objc_msgSend(v5, "integerValue");
    if (v10 > 1)
      goto LABEL_9;
  }
  else
  {
    v10 = -1;
  }
  do
  {
    PBFLogSQLite();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v48 = self;
      v49 = 2048;
      v50 = v10;
      _os_log_impl(&dword_1CB9FA000, v14, OS_LOG_TYPE_DEFAULT, "[%p] setup update database to version %lu", buf, 0x16u);
    }

    if (v10 < 0)
    {
      v18 = &unk_1E8741B08;
    }
    else if (v10 == 1)
    {
      v54[0] = CFSTR("UPDATE posterMetadata SET value = \"2\" WHERE key = \"version\";");
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("INSERT INTO posterMetadata(key, value) VALUES(\"deviceClass\", \"%d\");"),
        objc_msgSend(v16, "deviceClass"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }
    if (objc_msgSend(v18, "count"))
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v19 = v18;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v43;
        v23 = v9;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v43 != v22)
              objc_enumerationMutation(v19);
            v25 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
            v26 = self->_connection;
            v41 = 0;
            -[PBFSQLiteDatabaseConnection executeQuery:error:](v26, "executeQuery:error:", v25, &v41);
            v9 = v41;

            PBFLogSQLite();
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = v27;
            if (v9)
            {
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                databaseURL = self->_databaseURL;
                *(_DWORD *)buf = 134218754;
                v48 = self;
                v49 = 2114;
                v50 = v25;
                v51 = 2114;
                *(_QWORD *)v52 = databaseURL;
                *(_WORD *)&v52[8] = 2114;
                *(_QWORD *)&v52[10] = v9;
                _os_log_error_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_ERROR, "[%p] failed to execute setup query '%{public}@' on database at %{public}@: %{public}@", buf, 0x2Au);
              }

              goto LABEL_45;
            }
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              v48 = self;
              v49 = 2114;
              v50 = v25;
              _os_log_impl(&dword_1CB9FA000, v28, OS_LOG_TYPE_DEFAULT, "[%p] success setup query '%{public}@'", buf, 0x16u);
            }

            v23 = 0;
          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
          v23 = 0;
          if (v21)
            continue;
          break;
        }
        v9 = 0;
      }
    }
    else
    {
      PBFLogSQLite();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v48 = self;
        v49 = 2048;
        v50 = v10;
        _os_log_impl(&dword_1CB9FA000, v19, OS_LOG_TYPE_DEFAULT, "[%p] skip setup for version %lu", buf, 0x16u);
      }
    }
LABEL_45:

    ++v10;
  }
  while (v10 != 2);
LABEL_9:
  v11 = self->_connection;
  if (!v9)
  {
    v40 = 0;
    -[PBFSQLiteDatabaseConnection executeQuery:error:](v11, "executeQuery:error:", CFSTR("COMMIT TRANSACTION;"), &v40);
    v30 = v40;
    if (v30)
    {
      v9 = v30;
      PBFLogSQLite();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v31 = self->_databaseURL;
        sqliteFlags = self->_sqliteFlags;
        *(_DWORD *)buf = 134218754;
        v48 = self;
        v49 = 2114;
        v50 = (uint64_t)v31;
        v51 = 1024;
        *(_DWORD *)v52 = sqliteFlags;
        *(_WORD *)&v52[4] = 2114;
        *(_QWORD *)&v52[6] = v9;
        _os_log_error_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_ERROR, "[%p] failed to commit transaction on database at %{public}@ w/ flags %d: %{public}@", buf, 0x26u);
      }
      goto LABEL_19;
    }
    goto LABEL_50;
  }
  v39 = 0;
  -[PBFSQLiteDatabaseConnection executeQuery:error:](v11, "executeQuery:error:", CFSTR("ROLLBACK TRANSACTION;"), &v39);
  v12 = v39;

  if (!v12)
  {
LABEL_50:
    if (v10 == 2)
    {
      v38 = 0;
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl dataStoreMetadataWithError:](self, "dataStoreMetadataWithError:", &v38);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v38;
      objc_msgSend(v33, "objectForKey:", CFSTR("version"));
      v13 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject integerValue](v13, "integerValue") != 2 && !v9)
      {
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, CFSTR("Database migration failed; final version not equal to expected version"),
          0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        PBFLogSQLite();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl setup].cold.1();

      }
    }
    else
    {
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, CFSTR("Database migration failed."), 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      PBFLogSQLite();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl setup].cold.1();
    }
    goto LABEL_19;
  }
  PBFLogSQLite();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v35 = self->_databaseURL;
    v36 = self->_sqliteFlags;
    *(_DWORD *)buf = 134218754;
    v48 = self;
    v49 = 2114;
    v50 = (uint64_t)v35;
    v51 = 1024;
    *(_DWORD *)v52 = v36;
    *(_WORD *)&v52[4] = 2114;
    *(_QWORD *)&v52[6] = v12;
    _os_log_error_impl(&dword_1CB9FA000, v13, OS_LOG_TYPE_ERROR, "[%p] failed to rollback transaction on database at %{public}@ w/ flags %d: %{public}@", buf, 0x26u);
  }
  v9 = v12;
LABEL_19:

  return v9;
}

- (BOOL)validateDatabaseWithError:(id *)a3
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  PBFSQLiteDatabaseConnection *connection;
  id v12;
  NSObject *v13;
  void *v14;
  PBFSQLiteDatabaseConnection *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  id v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[3];
  _QWORD v45[5];

  v45[3] = *MEMORY[0x1E0C80C00];
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl dataStoreMetadataWithError:](self, "dataStoreMetadataWithError:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("version"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v7 = objc_msgSend(v34, "integerValue");
      if (v7 > 2)
      {
        v5 = 1;
LABEL_41:

        return v5;
      }
      v8 = v7;
      v9 = 0;
      while (v8 == 1)
      {
        v10 = (void *)objc_opt_new();
        connection = self->_connection;
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __76___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_validateDatabaseWithError___block_invoke;
        v38[3] = &unk_1E86F3DF0;
        v12 = v10;
        v39 = v12;
        v37 = 0;
        -[PBFSQLiteDatabaseConnection executeQuery:resultRowHandler:error:](connection, "executeQuery:resultRowHandler:error:", CFSTR("SELECT tbl_name from sqlite_master WHERE type = 'table' AND tbl_name NOT LIKE 'sqlite_%'"), v38, &v37);
        v13 = v37;

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("poster"), CFSTR("posterMetadata"), CFSTR("posterAttributes"), CFSTR("posterRoles"), CFSTR("posterRoleMembership"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqual:", v12) & 1) == 0)
        {
          v44[0] = CFSTR("version");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v45[0] = v33;
          v44[1] = CFSTR("expectingTableNames");
          objc_msgSend(v14, "allObjects");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = (void *)v22;
          v24 = MEMORY[0x1E0C9AA60];
          if (v22)
            v25 = v22;
          else
            v25 = MEMORY[0x1E0C9AA60];
          v45[1] = v25;
          v44[2] = CFSTR("tableNames");
          objc_msgSend(v12, "allObjects");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v26;
          if (v26)
            v28 = v26;
          else
            v28 = v24;
          v45[2] = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 3);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          _PBFPosterExtensionDataStoreSQLiteDatabaseError(5, 0, 0, v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (a3)
            *a3 = objc_retainAutorelease(v30);
          PBFLogSQLite();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl validateDatabaseWithError:].cold.2();

          goto LABEL_39;
        }

        v9 = v13;
        v8 = 2;
      }
      if (v8 == 2)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v41 = __Block_byref_object_copy__10;
        v42 = __Block_byref_object_dispose__10;
        v43 = 0;
        v15 = self->_connection;
        v35 = 0;
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __76___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_validateDatabaseWithError___block_invoke_210;
        v36[3] = &unk_1E86F65A0;
        v36[4] = buf;
        -[PBFSQLiteDatabaseConnection executeQuery:resultRowHandler:error:](v15, "executeQuery:resultRowHandler:error:", CFSTR("SELECT value FROM posterMetadata WHERE key = 'version';"),
          v36,
          &v35);
        v16 = v35;
        v17 = v16;
        if (v16)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v16);
          PBFLogSQLite();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl validateDatabaseWithError:].cold.3();

        }
        v5 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "integerValue") > 0;
        _Block_object_dispose(buf, 8);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Version check failed for version %ld"), v8);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        _PBFPosterExtensionDataStoreSQLiteDatabaseError(5, 0, v19, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (a3)
          *a3 = objc_retainAutorelease(v20);
        PBFLogSQLite();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v8;
          *(_WORD *)&buf[22] = 2114;
          v41 = (uint64_t (*)(uint64_t, uint64_t))v20;
          _os_log_error_impl(&dword_1CB9FA000, v21, OS_LOG_TYPE_ERROR, "[%p] failed validateDatabaseWithError for version %lu with error: %{public}@", buf, 0x20u);
        }

        v5 = 0;
      }
      v13 = v9;
    }
    else
    {
      PBFLogSQLite();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl validateDatabaseWithError:].cold.1((uint64_t)self, v13);
LABEL_39:
      v5 = 0;
    }

    goto LABEL_41;
  }
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
  v5 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (BOOL)performChanges:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *);
  BOOL v7;
  PBFSQLiteDatabaseConnection *connection;
  BOOL v9;
  id v10;
  int v11;
  PBFSQLiteDatabaseConnection *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  id v20;
  id v21;
  id v22;

  v6 = (uint64_t (**)(id, _PBFPosterExtensionDataStoreSQLiteDatabaseImpl *))a3;
  if (!-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    connection = self->_connection;
    v22 = 0;
    v9 = -[PBFSQLiteDatabaseConnection executeQuery:error:](connection, "executeQuery:error:", CFSTR("BEGIN TRANSACTION;"),
           &v22);
    v10 = v22;
    if (v9)
    {
      v11 = v6[2](v6, self);
      v12 = self->_connection;
      if (v11)
      {
        v21 = 0;
        v7 = -[PBFSQLiteDatabaseConnection executeQuery:error:](v12, "executeQuery:error:", CFSTR("COMMIT TRANSACTION;"),
               &v21);
        v13 = v21;
        if (!v7)
        {
          PBFLogSQLite();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl performChanges:error:].cold.1();

          if (a4)
            *a4 = objc_retainAutorelease(v13);
        }

        goto LABEL_24;
      }
      v20 = 0;
      v16 = -[PBFSQLiteDatabaseConnection executeQuery:error:](v12, "executeQuery:error:", CFSTR("ROLLBACK TRANSACTION;"),
              &v20);
      v17 = v20;
      if (!v16)
      {
        PBFLogSQLite();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl performChanges:error:].cold.1();

        if (a4)
          *a4 = objc_retainAutorelease(v17);
      }

    }
    else
    {
      PBFLogSQLite();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl performChanges:error:].cold.3();

      if (a4)
      {
        v7 = 0;
        *a4 = objc_retainAutorelease(v10);
LABEL_24:

        goto LABEL_25;
      }
    }
    v7 = 0;
    goto LABEL_24;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
LABEL_25:

  return v7;
}

- (id)dataStoreMetadataWithError:(id *)a3
{
  void *v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__10;
    v13 = __Block_byref_object_dispose__10;
    v14 = 0;
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT key, value FROM posterMetadata;"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_dataStoreMetadataWithError___block_invoke;
    v8[3] = &unk_1E86F65A0;
    v8[4] = &v9;
    objc_msgSend(v6, "executeWithBindings:resultRowHandler:error:", 0, v8, a3);
    v7 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
    return v7;
  }
}

- (id)roleIdentifiersWithError:(id *)a3
{
  void *v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__10;
    v13 = __Block_byref_object_dispose__10;
    v14 = 0;
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT roleIdentifier FROM posterRoles;"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_roleIdentifiersWithError___block_invoke;
    v8[3] = &unk_1E86F65A0;
    v8[4] = &v9;
    objc_msgSend(v6, "executeWithBindings:resultRowHandler:error:", 0, v8, a3);
    v7 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
    return v7;
  }
}

- (id)extensionIdentifiersForRole:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__10;
    v16 = __Block_byref_object_dispose__10;
    v17 = 0;
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT DISTINCT(providerId) as providerId FROM poster WHERE UUID IN (SELECT posterUUID FROM posterRoleMembership WHERE roleId = :roleIdentifier);"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR(":roleIdentifier");
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __84___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_extensionIdentifiersForRole_error___block_invoke;
    v11[3] = &unk_1E86F65A0;
    v11[4] = &v12;
    objc_msgSend(v8, "executeWithBindings:resultRowHandler:error:", v9, v11, a4);

    v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  return v7;
}

- (id)attributeIdentifiersForPoster:(id)a3 roleId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__10;
    v20 = __Block_byref_object_dispose__10;
    v21 = 0;
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT DISTINCT(attributeIdentifier) as attributeIdentifier FROM posterAttributes WHERE posterUUID = :posterUUID AND roleId = :roleIdentifier AND attributeIdentifier != 'SELECTED'"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v9;
    v22[0] = CFSTR(":roleIdentifier");
    v22[1] = CFSTR(":posterUUID");
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __93___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributeIdentifiersForPoster_roleId_error___block_invoke;
    v15[3] = &unk_1E86F65A0;
    v15[4] = &v16;
    objc_msgSend(v11, "executeWithBindings:resultRowHandler:error:", v13, v15, a5);

    v10 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

  }
  return v10;
}

- (id)posterUUIDsForExtensionIdentifier:(id)a3 role:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__10;
    v19 = __Block_byref_object_dispose__10;
    v20 = 0;
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT UUID FROM poster WHERE providerId = :extensionIdentifier AND UUID IN (SELECT posterUUID FROM posterRoleMembership WHERE roleId = :roleIdentifier);"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = CFSTR(":extensionIdentifier");
    v21[1] = CFSTR(":roleIdentifier");
    v22[0] = v8;
    v22[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __95___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_posterUUIDsForExtensionIdentifier_role_error___block_invoke;
    v14[3] = &unk_1E86F65A0;
    v14[4] = &v15;
    objc_msgSend(v11, "executeWithBindings:resultRowHandler:error:", v12, v14, a5);

    v10 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

  }
  return v10;
}

- (id)extensionIdentifierForPosterUUID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__10;
    v20 = __Block_byref_object_dispose__10;
    -[NSCache objectForKey:](self->_providerForPosterUUIDCache, "objectForKey:", v6);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v8 = (void *)v17[5];
    if (v8)
    {
      v7 = v8;
    }
    else
    {
      -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT providerID from poster WHERE UUID = :posterUUID;"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = CFSTR(":posterUUID");
      objc_msgSend(v6, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __89___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_extensionIdentifierForPosterUUID_error___block_invoke;
      v15[3] = &unk_1E86F65A0;
      v15[4] = &v16;
      objc_msgSend(v9, "executeWithBindings:resultRowHandler:error:", v11, v15, a4);

      v12 = v17[5];
      if (v12)
      {
        -[NSCache setObject:forKey:](self->_providerForPosterUUIDCache, "setObject:forKey:", v12, v6);
        v13 = (void *)v17[5];
      }
      else
      {
        v13 = 0;
      }
      v7 = v13;

    }
    _Block_object_dispose(&v16, 8);

  }
  return v7;
}

- (id)sortedPosterUUIDsForRole:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl sortedPosterUUIDsForRole:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA5448);
    }
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__10;
    v17 = __Block_byref_object_dispose__10;
    v18 = 0;
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT posterUUID FROM posterRoleMembership WHERE roleId = :roleIdentifier ORDER BY roleSortKey;"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = CFSTR(":roleIdentifier");
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_sortedPosterUUIDsForRole_error___block_invoke;
    v12[3] = &unk_1E86F65A0;
    v12[4] = &v13;
    objc_msgSend(v8, "executeWithBindings:resultRowHandler:error:", v9, v12, a4);

    v7 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  return v7;
}

- (id)roleDisplayNamesForIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_6;
  }
  if (!objc_msgSend(v6, "count"))
  {
LABEL_6:
    v8 = (id)MEMORY[0x1E0C9AA70];
    goto LABEL_7;
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__10;
  v15 = __Block_byref_object_dispose__10;
  v16 = 0;
  -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT roleIdentifier, displayName FROM posterMetadata;"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_roleDisplayNamesForIdentifiers_error___block_invoke;
  v10[3] = &unk_1E86F65A0;
  v10[4] = &v11;
  objc_msgSend(v7, "executeWithBindings:resultRowHandler:error:", 0, v10, a4);
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
LABEL_7:

  return v8;
}

- (BOOL)checkIfPosterUUIDs:(id)a3 belongToRole:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  int v24;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  const __CFString *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_16:
    v10 = 0;
    goto LABEL_20;
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleId"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl checkIfPosterUUIDs:belongToRole:error:].cold.1();
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAA5A48);
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUIDs"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl checkIfPosterUUIDs:belongToRole:error:].cold.2();
    objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1CBAA5AACLL);
  }
  if (!objc_msgSend(v8, "count"))
    goto LABEL_16;
  v11 = (void *)objc_opt_new();
  v12 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __88___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_checkIfPosterUUIDs_belongToRole_error___block_invoke;
  v35[3] = &unk_1E86F65C8;
  v13 = v11;
  v36 = v13;
  objc_msgSend(v8, "bs_each:", v35);
  v14 = (void *)objc_opt_new();
  -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT posterUUID FROM posterRoleMembership WHERE roleId = :roleId;"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = CFSTR(":roleId");
  v39[0] = v9;
  v10 = 1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v12;
  v33[1] = 3221225472;
  v33[2] = __88___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_checkIfPosterUUIDs_belongToRole_error___block_invoke_2;
  v33[3] = &unk_1E86F3DF0;
  v17 = v14;
  v34 = v17;
  objc_msgSend(v15, "executeWithBindings:resultRowHandler:error:", v16, v33, a5);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = v19;
    v28 = v13;
    v21 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v17, "containsObject:", v23);

        if (!v24)
        {
          v10 = 0;
          goto LABEL_18;
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v20)
        continue;
      break;
    }
    v10 = 1;
LABEL_18:
    v13 = v28;
  }

LABEL_20:
  return v10;
}

- (id)selectedPosterUUIDForRole:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl selectedPosterUUIDForRole:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA5D88);
    }
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__10;
    v18 = __Block_byref_object_dispose__10;
    v19 = 0;
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT posterUUID FROM posterAttributes WHERE (roleId = :roleIdentifier AND attributeIdentifier = :attributeIdentifier AND attributePayload = :attributePayload) LIMIT 1;"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = CFSTR(":roleIdentifier");
    v20[1] = CFSTR(":attributeIdentifier");
    v21[0] = v6;
    v21[1] = CFSTR("SELECTED");
    v20[2] = CFSTR(":attributePayload");
    v21[2] = &unk_1E8741BD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __82___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_selectedPosterUUIDForRole_error___block_invoke;
    v13[3] = &unk_1E86F65A0;
    v13[4] = &v14;
    objc_msgSend(v8, "executeWithBindings:resultRowHandler:error:", v9, v13, a4);

    if (objc_msgSend((id)v15[5], "length"))
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v7 = (void *)objc_msgSend(v10, "initWithUUIDString:", v15[5]);
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v14, 8);
  }

  return v7;
}

- (id)attributeForPoster:(id)a3 roleId:(id)a4 attributeId:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributeForPoster:roleId:attributeId:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA605CLL);
    }
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributeForPoster:roleId:attributeId:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA60C0);
    }
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("attributeIdentifier"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributeForPoster:roleId:attributeId:error:].cold.3();
      objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6124);
    }
    v28[0] = CFSTR(":posterUUID");
    objc_msgSend(v10, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v14;
    v29[1] = v11;
    v28[1] = CFSTR(":roleIdentifier");
    v28[2] = CFSTR(":attributeIdentifier");
    v29[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("SELECT attributePayload FROM posterAttributes WHERE (roleId = :roleIdentifier AND attributeIdentifier = :attributeIdentifier AND posterUUID = :posterUUID) LIMIT 1;"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__10;
    v26 = __Block_byref_object_dispose__10;
    v27 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __94___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributeForPoster_roleId_attributeId_error___block_invoke;
    v21[3] = &unk_1E86F65A0;
    v21[4] = &v22;
    objc_msgSend(v16, "executeWithBindings:resultRowHandler:error:", v15, v21, a6);
    v13 = (id)v23[5];
    _Block_object_dispose(&v22, 8);

  }
  return v13;
}

- (id)attributesForPoster:(id)a3 roleId:(id)a4 attributeIdentifiers:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
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
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributesForPoster:roleId:attributeIdentifiers:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6464);
    }
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributesForPoster:roleId:attributeIdentifiers:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA64C8);
    }
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("attributeIdentifiers"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl attributesForPoster:roleId:attributeIdentifiers:error:].cold.3();
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA652CLL);
    }
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__10;
    v32 = __Block_byref_object_dispose__10;
    v33 = 0;
    objc_msgSend(v12, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sortedArrayUsingSelector:", sel_compare_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_map:", &__block_literal_global_29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR(","));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("SELECT attributeIdentifier, attributePayload FROM posterAttributes WHERE (roleId = :roleIdentifier AND posterUUID = :posterUUID AND attributeIdentifier IN (%@)"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = CFSTR(":posterUUID");
    objc_msgSend(v10, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR(":roleIdentifier");
    v35[0] = v20;
    v35[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __104___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_attributesForPoster_roleId_attributeIdentifiers_error___block_invoke_2;
    v27[3] = &unk_1E86F65A0;
    v27[4] = &v28;
    objc_msgSend(v22, "executeWithBindings:resultRowHandler:error:", v21, v27, a6);
    v13 = (void *)objc_msgSend((id)v29[5], "copy");

    _Block_object_dispose(&v28, 8);
  }

  return v13;
}

- (BOOL)addRole:(id)a3 displayName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl addRole:displayName:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6814);
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("displayName"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl addRole:displayName:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6878);
    }
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("INSERT INTO posterRoles VALUES(:roleIdentifier, :displayName);"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = CFSTR(":roleIdentifier");
    v16[1] = CFSTR(":displayName");
    v17[0] = v8;
    v17[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "executeWithBindings:resultRowHandler:error:", v12, 0, a5);

  }
  return v10;
}

- (BOOL)removeRole:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl removeRole:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA69FCLL);
    }
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("DELETE FROM posterRoles WHERE roleIdentifier = :roleIdentifier;"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = CFSTR(":roleIdentifier");
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "executeWithBindings:resultRowHandler:error:", v9, 0, a4);

  }
  return v7;
}

- (BOOL)addPosterUUID:(id)a3 provider:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl addPosterUUID:provider:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6BC0);
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("provider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl addPosterUUID:provider:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6C24);
    }
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("INSERT INTO poster (UUID, providerId) VALUES(:posterUUID, :provider);"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR(":posterUUID");
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR(":provider");
    v18[0] = v12;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "executeWithBindings:resultRowHandler:error:", v13, 0, a5);

  }
  return v10;
}

- (BOOL)removePosterUUID:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl removePosterUUID:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6DC0);
    }
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("DELETE FROM poster WHERE UUID = :posterUUID;"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = CFSTR(":posterUUID");
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "executeWithBindings:resultRowHandler:error:", v10, 0, a4);

  }
  return v7;
}

- (BOOL)assignPosterUUID:(id)a3 toRole:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl assignPosterUUID:toRole:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6F90);
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl assignPosterUUID:toRole:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA6FF4);
    }
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("INSERT INTO posterRoleMembership VALUES(:posterUUID, :roleIdentifier1, IFNULL((SELECT MAX(roleSortKey) + 1 FROM posterRoleMembership WHERE roleId = :roleIdentifier2), 1));"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR(":posterUUID");
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    v18[1] = v9;
    v17[1] = CFSTR(":roleIdentifier1");
    v17[2] = CFSTR(":roleIdentifier2");
    v18[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "executeWithBindings:resultRowHandler:error:", v13, 0, a5);

  }
  return v10;
}

- (BOOL)unassignPosterUUID:(id)a3 fromRole:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl unassignPosterUUID:fromRole:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA71B8);
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl unassignPosterUUID:fromRole:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA721CLL);
    }
    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("DELETE FROM posterRoleMembership WHERE roleId = :roleIdentifier AND posterUUID = :posterUUID;"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = CFSTR(":posterUUID");
    objc_msgSend(v8, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR(":roleIdentifier");
    v18[0] = v12;
    v18[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "executeWithBindings:resultRowHandler:error:", v13, 0, a5);

  }
  return v10;
}

- (BOOL)mutateSortOrder:(id)a3 roleId:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  void *v34;
  id *v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  const __CFString *v60;
  const __CFString *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v8 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v9 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v34 = v8;
    v35 = a5;
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl sortedPosterUUIDsForRole:error:](self, "sortedPosterUUIDsForRole:error:", v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = v36;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v55;
LABEL_6:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v15);
        if ((objc_msgSend(v11, "containsObject:", v16) & 1) == 0)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          if (v13)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      if (!v35)
      {
        v9 = 0;
        goto LABEL_41;
      }
      v60 = CFSTR("missingUUID");
      objc_msgSend(v16, "UUIDString");
      v30 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v30;
      v31 = CFSTR("(null)");
      if (v30)
        v31 = (const __CFString *)v30;
      v61 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      _PBFPosterExtensionDataStoreSQLiteDatabaseError(1, 0, CFSTR("newSortOrder contained UUIDs that the database did not, suggesting an out-of-order commit sequence"), v32);
      *v35 = (id)objc_claimAutoreleasedReturnValue();

      v9 = 0;
    }
    else
    {
LABEL_12:

      v12 = (id)objc_msgSend(v12, "mutableCopy");
      v17 = (void *)objc_opt_new();
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v18 = v11;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v51 != v20)
              objc_enumerationMutation(v18);
            v22 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            if ((objc_msgSend(v12, "containsObject:", v22) & 1) == 0)
              objc_msgSend(v17, "addObject:", v22);
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v19);
      }

      if (objc_msgSend(v17, "count"))
      {
        objc_msgSend(v17, "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "sortedArrayUsingComparator:", &__block_literal_global_314);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v25 = v24;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
        if (v26)
        {
          v27 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v47 != v27)
                objc_enumerationMutation(v25);
              objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * j));
            }
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
          }
          while (v26);
        }

      }
      v40 = 0;
      v41 = &v40;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__10;
      v44 = __Block_byref_object_dispose__10;
      v45 = 0;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __79___PBFPosterExtensionDataStoreSQLiteDatabaseImpl_mutateSortOrder_roleId_error___block_invoke_2;
      v37[3] = &unk_1E86F6670;
      v37[4] = self;
      v38 = v34;
      v39 = &v40;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v37);
      v29 = (void *)v41[5];
      v9 = v29 == 0;
      if (v35 && v29)
        *v35 = objc_retainAutorelease(v29);

      _Block_object_dispose(&v40, 8);
    }

LABEL_41:
    v8 = v34;
  }

  return v9;
}

- (BOOL)mutateDataStoreMetadataForKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v8;
  __CFString *v9;
  char v10;
  PBFSQLiteDatabaseConnection *connection;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("key"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl mutateDataStoreMetadataForKey:value:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA7A58);
    }
    connection = self->_connection;
    if (v9)
      v12 = CFSTR("INSERT INTO posterMetadata VALUES(:key1, :value1) ON CONFLICT(key) DO UPDATE SET value=:value2 WHERE key=:key2;");
    else
      v12 = CFSTR("DELETE FROM posterMetadata WHERE key = :key1;");
    if (v9)
      v13 = v9;
    else
      v13 = &stru_1E86FC5B8;
    -[PBFSQLiteDatabaseConnection prepareStatement:](connection, "prepareStatement:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = CFSTR(":key1");
    v18[1] = CFSTR(":key2");
    v19[0] = v8;
    v19[1] = v8;
    v18[2] = CFSTR(":value1");
    v18[3] = CFSTR(":value2");
    v19[2] = v13;
    v19[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v14, "executeWithBindings:resultRowHandler:error:", v15, 0, a5);

  }
  return v10;
}

- (BOOL)markPosterUUIDAsSelected:(id)a3 roleId:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl markPosterUUIDAsSelected:roleId:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA7C50);
    }
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl markPosterUUIDAsSelected:roleId:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA7CB4);
    }
    v17[0] = CFSTR(":posterUUID");
    objc_msgSend(v8, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = v9;
    v17[1] = CFSTR(":roleIdentifier1");
    v17[2] = CFSTR(":roleIdentifier2");
    v18[2] = v9;
    v18[3] = CFSTR("SELECTED");
    v17[3] = CFSTR(":attributeIdentifier1");
    v17[4] = CFSTR(":attributeIdentifier2");
    v17[5] = CFSTR(":attributePayload");
    v18[4] = CFSTR("SELECTED");
    v18[5] = &unk_1E8741BD8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", CFSTR("            DELETE FROM posterAttributes WHERE (roleId = :roleIdentifier1 AND attributeIdentifier = :attributeIdentifier1);                INSERT INTO posterAttributes VALUES(:posterUUID, :roleIdentifier2, :attributeIdentifier2, :attributePayload);"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "executeWithBindings:resultRowHandler:error:", v12, 0, a5);

  }
  return v10;
}

- (BOOL)mutateAttributeForPoster:(id)a3 roleId:(id)a4 attributeId:(id)a5 attributePayload:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];
  _QWORD v28[8];

  v28[7] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (-[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"))
  {
    if (a7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "pbf_generalErrorWithCode:userInfo:", 3, 0);
      v16 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("posterUUID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl mutateAttributeForPoster:roleId:attributeId:attributePayload:error:].cold.1();
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA7F2CLL);
    }
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("roleIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl mutateAttributeForPoster:roleId:attributeId:attributePayload:error:].cold.2();
      objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA7F90);
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("attributeIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl mutateAttributeForPoster:roleId:attributeId:attributePayload:error:].cold.3();
      objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1CBAA7FF4);
    }
    v27[0] = CFSTR(":posterUUID1");
    objc_msgSend(v12, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    v28[1] = v13;
    v27[1] = CFSTR(":roleIdentifier1");
    v27[2] = CFSTR(":attributeIdentifier1");
    v28[2] = v14;
    v27[3] = CFSTR(":posterUUID2");
    objc_msgSend(v12, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[3] = v18;
    v28[4] = v13;
    v27[4] = CFSTR(":roleIdentifier2");
    v27[5] = CFSTR(":attributeIdentifier2");
    v28[5] = v14;
    v27[6] = CFSTR(":attributePayload");
    v19 = v15;
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "data");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28[6] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v21 = CFSTR("DELETE FROM posterAttributes WHERE (roleId = :roleIdentifier1 AND attributeIdentifier = :attributeIdentifier1 AND posterUUID = :posterUUID1); INSERT INTO posterAttributes VALUES(:posterUUID2, :roleIdentifier2, :attributeIdentifier2, :attributePayload);");
    }
    else
    {

      v21 = CFSTR("DELETE FROM posterAttributes WHERE (roleId = :roleIdentifier1 AND attributeIdentifier = :attributeIdentifier1 AND posterUUID = :posterUUID1);");
    }

    -[PBFSQLiteDatabaseConnection prepareStatement:](self->_connection, "prepareStatement:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v22, "executeWithBindings:resultRowHandler:error:", v20, 0, a7);

  }
  return v16;
}

- (void)cancel
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  _os_log_fault_impl(&dword_1CB9FA000, v0, OS_LOG_TYPE_FAULT, "[%p] wal checkpoint failed: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)invalidate
{
  if (-[BSAtomicFlag setFlag:](self->_invalidationFlag, "setFlag:", 1))
  {
    -[_PBFPosterExtensionDataStoreSQLiteDatabaseImpl cancel](self, "cancel");
    -[PBFSQLiteDatabaseConnection invalidate](self->_connection, "invalidate");
  }
}

- (NSURL)URL
{
  return self->_URL;
}

- (PBFSQLiteDatabaseConnection)connection
{
  return self->_connection;
}

- (BOOL)checkpointWALOnInvalidate
{
  return self->_checkpointWALOnInvalidate;
}

- (void)setCheckpointWALOnInvalidate:(BOOL)a3
{
  self->_checkpointWALOnInvalidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_providerForPosterUUIDCache, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
}

- (void)initWithURL:options:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%p] failed to init with error: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)setup
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%p] setup bail; cannot begin transaction: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)validateDatabaseWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218242;
  v3 = a1;
  v4 = 2114;
  v5 = CFSTR("version string was nil");
  _os_log_error_impl(&dword_1CB9FA000, a2, OS_LOG_TYPE_ERROR, "[%p] failed validateDatabaseWithError with error: %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_7();
}

- (void)validateDatabaseWithError:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14_0(&dword_1CB9FA000, v0, v1, "[%p] failed validateDatabaseWithError for version %lu with error: %{public}@");
}

- (void)validateDatabaseWithError:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14_0(&dword_1CB9FA000, v0, v1, "[%p] failed validateDatabaseWithError for version %lu with error: %{public}@");
}

- (void)performChanges:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%p] failed to commit transaction: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)performChanges:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_6_0(&dword_1CB9FA000, v0, v1, "[%p] failed to begin transaction: %{public}@");
  OUTLINED_FUNCTION_7();
}

- (void)sortedPosterUUIDsForRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)checkIfPosterUUIDs:belongToRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)checkIfPosterUUIDs:belongToRole:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)selectedPosterUUIDForRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributeForPoster:roleId:attributeId:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributeForPoster:roleId:attributeId:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributeForPoster:roleId:attributeId:error:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributesForPoster:roleId:attributeIdentifiers:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributesForPoster:roleId:attributeIdentifiers:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)attributesForPoster:roleId:attributeIdentifiers:error:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_16();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_14();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addRole:displayName:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addRole:displayName:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)removeRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addPosterUUID:provider:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addPosterUUID:provider:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)removePosterUUID:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)assignPosterUUID:toRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)assignPosterUUID:toRole:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)unassignPosterUUID:fromRole:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)unassignPosterUUID:fromRole:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)mutateDataStoreMetadataForKey:value:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)markPosterUUIDAsSelected:roleId:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)markPosterUUIDAsSelected:roleId:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)mutateAttributeForPoster:roleId:attributeId:attributePayload:error:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)mutateAttributeForPoster:roleId:attributeId:attributePayload:error:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)mutateAttributeForPoster:roleId:attributeId:attributePayload:error:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1CB9FA000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
