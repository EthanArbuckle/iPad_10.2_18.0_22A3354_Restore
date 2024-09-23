@implementation TRIStorageManagement

- (BOOL)prepareTrialStorage
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;
  _BOOL4 v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  char v23;
  unsigned int v24;
  uint8_t v25[4];
  int v26;
  uint8_t buf[8];
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = (void *)os_transaction_create();
  v24 = objc_msgSend(MEMORY[0x1E0DC0B78], "legacySchemaVersion");
  v23 = 0;
  v4 = 0;
  if (-[TRIStorageManagement _readSchemaVersion:fileExists:](self, "_readSchemaVersion:fileExists:", &v24, &v23))
  {
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v24;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "TRIStorageManagement on-disk schema version is %u.", buf, 8u);
    }

    v6 = v24;
    if (v6 == objc_msgSend(MEMORY[0x1E0DC0B78], "currentSchemaVersion"))
    {
LABEL_5:
      v4 = 1;
      goto LABEL_26;
    }
    v7 = v24;
    v8 = objc_msgSend(MEMORY[0x1E0DC0B78], "resetStorageRequestSchemaVersion");
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v7 == v8)
    {
      if (!v10)
        goto LABEL_12;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v24;
      v11 = "TRIStorageManagement schema version %u indicates an explicit request for storage reset; will attempt to clear user data.";
      v12 = v9;
      v13 = 8;
    }
    else
    {
      if (!v10)
        goto LABEL_12;
      v14 = v24;
      v15 = objc_msgSend(MEMORY[0x1E0DC0B78], "currentSchemaVersion");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v14;
      v28 = 1024;
      v29 = v15;
      v11 = "TRIStorageManagement schema version has changed (%u --> %u); will attempt to clear user data.";
      v12 = v9;
      v13 = 14;
    }
    _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_12:

    *(_QWORD *)buf = 0;
    if (!-[TRIStorageManagement _readDeviceIdWithSchemaVersion:intoData:](self, "_readDeviceIdWithSchemaVersion:intoData:", v24, buf))goto LABEL_25;
    if (v23)
      -[TRIStorageManagement _eliminateAllMAAssets](self, "_eliminateAllMAAssets");
    v16 = -[TRIStorageManagement _clearStorage](self, "_clearStorage");
    v17 = v16;
    v18 = *(id *)buf;
    if (*(_QWORD *)buf)
    {
      if (v16)
      {
        v19 = objc_msgSend(MEMORY[0x1E0DC0B78], "currentSchemaVersion");
        v18 = *(id *)buf;
      }
      else
      {
        v19 = v24;
      }
      -[TRIStorageManagement _writeDeviceIdWithData:schemaVersion:](self, "_writeDeviceIdWithData:schemaVersion:", v18, v19);
    }
    if (!v17
      || (-[TRIStorageManagement _notifyNamespaceUpdated](self, "_notifyNamespaceUpdated"),
          !-[TRIStorageManagement _writeSchemaVersion:](self, "_writeSchemaVersion:", objc_msgSend(MEMORY[0x1E0DC0B78], "currentSchemaVersion"))))
    {
LABEL_25:

      v4 = 0;
      goto LABEL_26;
    }
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(MEMORY[0x1E0DC0B78], "currentSchemaVersion");
      *(_DWORD *)v25 = 67109120;
      v26 = v21;
      _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "TRIStorageManagement user data cleared successfully; schema version is now %u.",
        v25,
        8u);
    }

    goto LABEL_5;
  }
LABEL_26:

  return v4;
}

- (BOOL)requestTrialStorageResetOnNextLaunch
{
  return -[TRIStorageManagement _writeSchemaVersion:](self, "_writeSchemaVersion:", objc_msgSend(MEMORY[0x1E0DC0B78], "resetStorageRequestSchemaVersion"));
}

- (BOOL)_readSchemaVersion:(unsigned int *)a3 fileExists:(BOOL *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIStorageManagement.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("version"));

  }
  v6 = (void *)MEMORY[0x1D8232A5C](self, a2);
  v7 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(MEMORY[0x1E0DC0B78], "schemaVersionFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithContentsOfFile:options:error:", v8, 1, &v33);
  v10 = v33;

  if (v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
    *a4 = 1;
    if (v11)
    {
      v32 = -1;
      if (!objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toI64:", v11, 10, &v32)
        || (v12 = v32, v32 < 0)
        || v32 >= 0x100000000)
      {
        TRILogCategory_Server();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0DC0B78], "schemaVersionFile");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(MEMORY[0x1E0DC0B78], "legacySchemaVersion");
          *(_DWORD *)buf = 138543874;
          v35 = v11;
          v36 = 2114;
          v37 = v27;
          v38 = 1024;
          v39 = v28;
          _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Could not parse string \"%{public}@\" from schema version file \"%{public}@\" as an unsigned int; treating as version %u.",
            buf,
            0x1Cu);

        }
        v12 = objc_msgSend(MEMORY[0x1E0DC0B78], "legacySchemaVersion");
      }
      *a3 = v12;
    }
    else
    {
      TRILogCategory_Server();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0DC0B78], "schemaVersionFile");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(MEMORY[0x1E0DC0B78], "legacySchemaVersion");
        *(_DWORD *)buf = 138543618;
        v35 = v25;
        v36 = 1024;
        LODWORD(v37) = v26;
        _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Schema version file \"%{public}@\" contains non-UTF-8 content; treating as version %u.",
          buf,
          0x12u);

      }
      *a3 = objc_msgSend(MEMORY[0x1E0DC0B78], "legacySchemaVersion");
    }

LABEL_18:
    v17 = 1;
    goto LABEL_26;
  }
  objc_msgSend(v10, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v18 = objc_msgSend(v10, "code");

    if (v18 == 260)
    {
      *a4 = 0;
      TRILogCategory_Server();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0DC0B78], "schemaVersionFile");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(MEMORY[0x1E0DC0B78], "legacySchemaVersion");
        *(_DWORD *)buf = 138543618;
        v35 = v20;
        v36 = 1024;
        LODWORD(v37) = v21;
        _os_log_impl(&dword_1D207F000, v19, OS_LOG_TYPE_DEFAULT, "Schema version file \"%{public}@\" is not present; treating as version %u.",
          buf,
          0x12u);

      }
      *a3 = objc_msgSend(MEMORY[0x1E0DC0B78], "legacySchemaVersion");
      goto LABEL_18;
    }
  }
  else
  {

  }
  TRILogCategory_Server();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0DC0B78], "schemaVersionFile");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v24;
    v36 = 2114;
    v37 = v10;
    _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Schema version file \"%{public}@\" is unreadable: %{public}@", buf, 0x16u);

  }
  v17 = 0;
LABEL_26:

  objc_autoreleasePoolPop(v6);
  return v17;
}

- (BOOL)_writeSchemaVersion:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v3 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1D8232A5C]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u\n"), v3);
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIStorageManagement.m"), 153, CFSTR("Failed to generate UTF-8 representation of schemaVersion"));

  }
  objc_msgSend(MEMORY[0x1E0DC0B78], "schemaVersionFile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0DC0B78], "schemaVersionFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v13 = objc_msgSend(v8, "writeToFile:options:error:", v12, 268435457, &v19);
  v14 = v19;

  if ((v13 & 1) == 0)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0DC0B78], "schemaVersionFile");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v17;
      v22 = 2114;
      v23 = v14;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to write schema version file \"%{public}@\": %{public}@", buf, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v6);
  return v13;
}

- (void)_eliminateAllMAAssets
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  +[TRIMobileAssetUtil allTrialAssetTypes](TRIMobileAssetUtil, "allTrialAssetTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to eliminate all MA assets that exist on the device", v4, 2u);
  }

  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_28);
}

void __45__TRIStorageManagement__eliminateAllMAAssets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  id v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D4E060], "eliminateAllForAssetTypeSync:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 138543618;
      v6 = v2;
      v7 = 2114;
      v8 = v3;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Failed to eliminate asset type %{public}@ : %{public}@", (uint8_t *)&v5, 0x16u);
    }

  }
}

- (BOOL)_clearStorage
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D207F000, v3, OS_LOG_TYPE_DEBUG, "attempting to delete Trial data dirs from containers", buf, 2u);
  }

  if (!-[TRIStorageManagement _clearContainerStorage](self, "_clearContainerStorage"))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "failed to delete Trial data dirs from all containers", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trialRootDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v8 = objc_msgSend(v5, "triForceRemoveItemAtPath:error:", v7, &v18);
  v9 = v18;

  if ((v8 & 1) != 0)
    goto LABEL_8;
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v13 = objc_msgSend(v9, "code");

    if (v13 == 4)
    {
LABEL_8:
      v10 = 1;
      goto LABEL_15;
    }
  }
  else
  {

  }
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trialRootDir");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v17;
    v21 = 2114;
    v22 = v9;
    _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to remove Trial data directory \"%{public}@\": %{public}@", buf, 0x16u);

  }
  v10 = 0;
LABEL_15:

  return v10;
}

- (BOOL)_runNamespaceDatabaseBlock:(id)a3
{
  uint64_t (**v4)(id, TRINamespaceDatabase *);
  void *v5;
  TRIDatabase *v6;
  TRINamespaceDatabase *v7;
  char v8;
  NSObject *v9;
  uint8_t v11[16];

  v4 = (uint64_t (**)(id, TRINamespaceDatabase *))a3;
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TRIDatabase initWithPaths:storageManagement:]([TRIDatabase alloc], "initWithPaths:storageManagement:", v5, self);
  if (v6)
  {
    v7 = -[TRINamespaceDatabase initWithDatabase:]([TRINamespaceDatabase alloc], "initWithDatabase:", v6);
    v8 = v4[2](v4, v7);
    -[TRIDatabase closePermanently](v6, "closePermanently");

  }
  else
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "failed to open database.  Cannot delete container Trial data directories", v11, 2u);
    }

    v8 = 0;
  }

  return v8;
}

- (BOOL)_clearContainerStorage
{
  void *v3;
  id v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v25;
  BOOL v26;
  NSObject *obj;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  NSObject *v37;
  __int16 v38;
  NSObject *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __46__TRIStorageManagement__clearContainerStorage__block_invoke;
  v34[3] = &unk_1E9335C78;
  v4 = v3;
  v35 = v4;
  v5 = -[TRIStorageManagement _runNamespaceDatabaseBlock:](self, "_runNamespaceDatabaseBlock:", v34);
  if (objc_msgSend(v4, "count"))
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v4;
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v6)
    {
      v7 = v6;
      v26 = v5;
      v25 = v4;
      v8 = *(_QWORD *)v31;
      v9 = (void *)*MEMORY[0x1E0CB28A8];
      while (1)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v28, "pathsForContainer:asClientProcess:", v11, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            v15 = v9;
            objc_msgSend(v13, "trialRootDir");
            v16 = objc_claimAutoreleasedReturnValue();
            TRILogCategory_Server();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v37 = v16;
              _os_log_debug_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEBUG, "removing container Trial data directory \"%{public}@\", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = 0;
            v19 = objc_msgSend(v18, "triForceRemoveItemAtPath:error:", v16, &v29);
            v20 = v29;

            if ((v19 & 1) != 0)
            {
              v9 = v15;
            }
            else
            {
              -[NSObject domain](v20, "domain");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v9 = v15;
              if (v21 != v15)
              {

LABEL_17:
                TRILogCategory_Server();
                v23 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v37 = v16;
                  v38 = 2114;
                  v39 = v20;
                  _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, "Failed to remove container Trial data directory \"%{public}@\": %{public}@", buf, 0x16u);
                }

                v26 = 0;
                goto LABEL_20;
              }
              v22 = -[NSObject code](v20, "code");

              if (v22 != 4)
                goto LABEL_17;
            }
          }
          else
          {
            TRILogCategory_Server();
            v16 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              goto LABEL_21;
            objc_msgSend(v11, "identifier");
            v20 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v37 = v20;
            _os_log_impl(&dword_1D207F000, v16, OS_LOG_TYPE_DEFAULT, "not clearing Trial data from missing app container: %{public}@", buf, 0xCu);
          }
LABEL_20:

LABEL_21:
          objc_autoreleasePoolPop(v12);
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
        if (!v7)
        {
          v4 = v25;
          v5 = v26;
          break;
        }
      }
    }
  }
  else
  {
    TRILogCategory_Server();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1D207F000, obj, OS_LOG_TYPE_DEBUG, "no container Trial data directories to delete", buf, 2u);
    }
  }

  return v5;
}

uint64_t __46__TRIStorageManagement__clearContainerStorage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__TRIStorageManagement__clearContainerStorage__block_invoke_2;
  v5[3] = &unk_1E93304D0;
  v6 = *(id *)(a1 + 32);
  v3 = objc_msgSend(a2, "enumerateDynamicNamespaceRecordsWithBlock:", v5);

  return v3;
}

void __46__TRIStorageManagement__clearContainerStorage__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "appContainer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (BOOL)_readDeviceIdWithSchemaVersion:(unsigned int)a3 intoData:(id *)a4
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIStorageManagement.m"), 267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B78]), "initWithSchemaVersion:", v5);
  v7 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(v6, "deviceIdentifierFile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v9 = (void *)objc_msgSend(v7, "initWithContentsOfFile:options:error:", v8, 0, &v21);
  v10 = v21;

  if (v9)
  {
    v11 = v9;
    v12 = *a4;
    *a4 = v11;
LABEL_5:
    v13 = 1;
    goto LABEL_13;
  }
  objc_msgSend(v10, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 == (void *)*MEMORY[0x1E0CB28A8])
  {
    v16 = objc_msgSend(v10, "code");

    if (v16 == 260)
    {
      v12 = *a4;
      *a4 = 0;
      goto LABEL_5;
    }
  }
  else
  {

  }
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v10;
    _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to read subject identifier prior to storage clear: %{public}@", buf, 0xCu);
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)_writeDeviceIdWithData:(id)a3 schemaVersion:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIStorageManagement.m"), 292, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC0B78]), "initWithSchemaVersion:", v4);
  objc_msgSend(v8, "deviceIdentifierFile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, 0);

  objc_msgSend(v8, "deviceIdentifierFile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v13 = objc_msgSend(v7, "writeToFile:options:error:", v12, 1, &v18);
  v14 = v18;

  if ((v13 & 1) == 0)
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v14;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to restore subject identifier after storage clear: %{public}@", buf, 0xCu);
    }

  }
  return v13;
}

- (void)_notifyNamespaceUpdated
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  TRILogCategory_Server();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_debug_impl(&dword_1D207F000, v2, OS_LOG_TYPE_DEBUG, "Starting notification of namespaces after schema version update", v7, 2u);
  }

  v3 = (void *)MEMORY[0x1E0DC0AD8];
  objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "namespaceDescriptorsDefaultDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptorsForDirectory:filterBlock:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_213_0);
}

void __47__TRIStorageManagement__notifyNamespaceUpdated__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x1E0DC0B20];
  objc_msgSend(a2, "namespaceName");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyUpdateForNamespaceName:", v3);

}

@end
