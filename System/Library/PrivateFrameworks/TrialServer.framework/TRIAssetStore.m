@implementation TRIAssetStore

- (TRIAssetStore)initWithPaths:(id)a3 extractor:(id)a4 patcher:(id)a5
{
  return -[TRIAssetStore initWithPaths:extractor:patcher:monitoredActivity:](self, "initWithPaths:extractor:patcher:monitoredActivity:", a3, a4, a5, 0);
}

- (BOOL)_acquireLockfileAndRunBlock:(id)a3
{
  void (**v4)(id, uint8_t *);
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  int v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int *v20;
  char *v21;
  int v22;
  int *v23;
  char *v24;
  int v25;
  int *v26;
  char *v27;
  int v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint8_t *))a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIPaths assetStoreUsingGlobal:](self->_paths, "assetStoreUsingGlobal:", self->_useGlobalPaths);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v29);
  v9 = v29;

  if ((v8 & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v9;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to create AssetStore: %{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("lock"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 514, 432);
  v13 = v12;
  if (v12 < 0)
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v23 = __error();
      v24 = strerror(*v23);
      v25 = *__error();
      *(_DWORD *)buf = 138543874;
      v31 = v11;
      v32 = 2080;
      v33 = v24;
      v34 = 1024;
      v35 = v25;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failed to open lockfile %{public}@: %s (%d)", buf, 0x1Cu);
    }

    v15 = 0;
  }
  else
  {
    if (flock(v12, 2))
    {
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v20 = __error();
        v21 = strerror(*v20);
        v22 = *__error();
        *(_DWORD *)buf = 138543874;
        v31 = v11;
        v32 = 2080;
        v33 = v21;
        v34 = 1024;
        v35 = v22;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to acquire lockfile %{public}@: %s (%d)", buf, 0x1Cu);
      }

      v15 = 0;
    }
    else
    {
      v17 = (void *)MEMORY[0x1D8232A5C]();
      *(_DWORD *)buf = v13;
      v4[2](v4, buf);
      objc_autoreleasePoolPop(v17);
      if (flock(v13, 8))
      {
        TRILogCategory_Server();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v26 = __error();
          v27 = strerror(*v26);
          v28 = *__error();
          *(_DWORD *)buf = 138543874;
          v31 = v11;
          v32 = 2080;
          v33 = v27;
          v34 = 1024;
          v35 = v28;
          _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to unlock lockfile %{public}@: %s (%d)", buf, 0x1Cu);
        }

      }
      v15 = 1;
    }
    close(v13);
  }

  objc_autoreleasePoolPop(v5);
  return v15 & 1;
}

- (id)_requireAssetStoreTempDir
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  int *v12;
  char *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  char *v18;
  stat v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[TRIPaths assetStoreUsingGlobal:](self->_paths, "assetStoreUsingGlobal:", self->_useGlobalPaths);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("tmp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v14);
  v6 = v14;

  if ((v5 & 1) == 0)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v19.st_dev = 138543618;
      *(_QWORD *)&v19.st_mode = v3;
      WORD2(v19.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&v19.st_ino + 6) = (__darwin_ino64_t)v6;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", (uint8_t *)&v19, 0x16u);
    }

  }
  memset(&v19, 0, sizeof(v19));
  v8 = objc_retainAutorelease(v3);
  if (stat((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v19))
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2080;
      v18 = v13;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Could not stat temporary directory %{public}@: %s", buf, 0x16u);
    }

  }
  else
  {
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation");
    chmod(v10, v19.st_mode | 0x92);
  }

  return v8;
}

- (TRIAssetStore)initWithPaths:(id)a3
{
  return -[TRIAssetStore initWithPaths:monitoredActivity:](self, "initWithPaths:monitoredActivity:", a3, 0);
}

- (TRIAssetStore)initWithGlobalPaths:(id)a3
{
  TRIAssetStore *result;

  result = -[TRIAssetStore initWithPaths:](self, "initWithPaths:", a3);
  result->_useGlobalPaths = 1;
  return result;
}

- (TRIAssetStore)initWithPaths:(id)a3 monitoredActivity:(id)a4
{
  id v6;
  id v7;
  TRIRemoteAssetExtractor *v8;
  TRIRemoteAssetPatcher *v9;
  TRIAssetStore *v10;

  v6 = a4;
  v7 = a3;
  v8 = -[TRIRemoteAssetExtractor initWithMonitoredActivity:]([TRIRemoteAssetExtractor alloc], "initWithMonitoredActivity:", v6);
  v9 = -[TRIRemoteAssetPatcher initWithMonitoredActivity:]([TRIRemoteAssetPatcher alloc], "initWithMonitoredActivity:", v6);
  v10 = -[TRIAssetStore initWithPaths:extractor:patcher:monitoredActivity:](self, "initWithPaths:extractor:patcher:monitoredActivity:", v7, v8, v9, v6);

  return v10;
}

- (TRIAssetStore)initWithPaths:(id)a3 extractor:(id)a4 patcher:(id)a5 monitoredActivity:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  TRIAssetStore *v16;
  TRIAssetStore *v17;
  uint64_t v18;
  TRIStorageManagementProtocol *storageManagement;
  TRIAssetStoreOperator *v20;
  TRIAssetStoreOperations *assetOperator;
  void *v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 141, CFSTR("XPC activity monitoring is available only for TRIRemoteAssetExtractor"));

    }
  }
  v24.receiver = self;
  v24.super_class = (Class)TRIAssetStore;
  v16 = -[TRIAssetStore init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_paths, a3);
    objc_storeStrong((id *)&v17->_extractor, a4);
    objc_storeStrong((id *)&v17->_patcher, a5);
    objc_storeStrong((id *)&v17->_monitoredActivity, a6);
    v18 = objc_opt_new();
    storageManagement = v17->_storageManagement;
    v17->_storageManagement = (TRIStorageManagementProtocol *)v18;

    v17->_useGlobalPaths = 0;
    v20 = -[TRIAssetStoreOperator initWithPaths:storageManagement:assetStore:]([TRIAssetStoreOperator alloc], "initWithPaths:storageManagement:assetStore:", v12, v17->_storageManagement, v17);
    assetOperator = v17->_assetOperator;
    v17->_assetOperator = (TRIAssetStoreOperations *)v20;

  }
  return v17;
}

- (BOOL)saveAssetWithIdentifier:(id)a3 assetData:(id)a4 type:(unsigned __int8)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  TRICKAssetMetadata *v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[TRIAssetStore _requireAssetStoreTempDir](self, "_requireAssetStoreTempDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = objc_opt_new();
  objc_msgSend((id)v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("temp-asset-%@"), v13);
  objc_msgSend(v10, "stringByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  LOBYTE(v12) = objc_msgSend(v9, "writeToFile:options:error:", v15, 0, &v23);
  v16 = v23;
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[TRICKAssetMetadata initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:]([TRICKAssetMetadata alloc], "initWithType:namespaceNameForEncryptionKey:treatmentIndex:downloadSize:compressionMode:", v5, 0, 0, objc_msgSend(v9, "length"), 0);
    v19 = -[TRIAssetStore saveAssetWithIdentifier:assetURL:metadata:error:](self, "saveAssetWithIdentifier:assetURL:metadata:error:", v8, v17, v18, 0) == 1;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "triForceRemoveItemAtPath:error:", v15, 0);

  }
  else
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Failed to write NSData asset to temp file: %{public}@", buf, 0xCu);
    }

    v19 = 0;
  }

  return v19;
}

- ($A5A652246548B43F8BC05201A1C72A70)saveAssetWithIdentifier:(id)a3 assetURL:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  $A5A652246548B43F8BC05201A1C72A70 v19;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  _BYTE *v29;
  SEL v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  const char *v34;
  char v35;
  _BYTE buf[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetURL"));

    if (v13)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  if (!v12)
    goto LABEL_10;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadata"));

LABEL_4:
  TRILogCategory_Server();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[TRIPaths assetStore](self->_paths, "assetStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Save asset %{public}@ to asset store: %{public}@", buf, 0x16u);

  }
  v31 = 0;
  v32 = &v31;
  v33 = 0x2810000000;
  v34 = "";
  v35 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__26;
  v38 = __Block_byref_object_dispose__26;
  v39 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__TRIAssetStore_saveAssetWithIdentifier_assetURL_metadata_error___block_invoke;
  v24[3] = &unk_1E9333618;
  v24[4] = self;
  v16 = v11;
  v25 = v16;
  v28 = &v31;
  v17 = v13;
  v26 = v17;
  v18 = v12;
  v29 = buf;
  v30 = a2;
  v27 = v18;
  -[TRIAssetStore _acquireLockfileAndRunBlock:](self, "_acquireLockfileAndRunBlock:", v24);
  if (a6)
    *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  v19.var0 = *((_BYTE *)v32 + 32);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v31, 8);

  return v19;
}

void __65__TRIAssetStore_saveAssetWithIdentifier_assetURL_metadata_error___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  xpc_activity_t *v9;
  NSObject *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  char v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  id v51;
  id v52;
  id v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasAssetWithIdentifier:type:", *(_QWORD *)(a1 + 40), 0))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Warning: treating asset save as a no-op because asset is already present.", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = 1;
    return;
  }
  objc_msgSend(*(id *)(a1 + 48), "namespaceNameForEncryptionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 56), "path");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      v7 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStore.m"), 286, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetURL.path"));

    v7 = 0;
LABEL_52:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStore.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetFilename"));

    v13 = 0;
LABEL_14:
    v14 = (void *)os_transaction_create();
    v15 = objc_msgSend(*(id *)(a1 + 48), "type");
    if (v15 == 1)
    {
      v18 = *(void **)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 40);
      v20 = *(_QWORD *)(a1 + 48);
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      obj = *(id *)(v21 + 40);
      v16 = objc_msgSend(v18, "_saveDirectoryAssetWithIdentifier:assetFilename:metadata:flockWitness:error:", v19, v13, v20, a2, &obj);
      objc_storeStrong((id *)(v21 + 40), obj);
    }
    else
    {
      if (v15)
      {
LABEL_25:
        if (v7)
          objc_msgSend(*(id *)(a1 + 32), "_forceRemoveItemAtPath:", v7);

        return;
      }
      v16 = objc_msgSend(*(id *)(a1 + 32), "_saveFileAssetWithIdentifier:assetFilename:flockWitness:", *(_QWORD *)(a1 + 40), v13, a2);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = v16;
    goto LABEL_25;
  }
  objc_msgSend(*(id *)(a1 + 32), "_createTempDir");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 56), "lastPathComponent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      TRILogCategory_Server();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v42 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v55 = v42;
        _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "assetURL for encrypted asset %{public}@ has nil lastPathComponent", buf, 0xCu);
      }
      v11 = 0;
      goto LABEL_49;
    }
    v9 = *(xpc_activity_t **)(a1 + 32);
    if (v9[4])
    {
      if (xpc_activity_should_defer(v9[4]))
      {
        TRILogCategory_Server();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v11 = 2;
          _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Deferral requested before start of asset decryption.", buf, 2u);
        }
        else
        {
          v11 = 2;
        }
LABEL_49:

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = v11;
        goto LABEL_50;
      }
      v9 = *(xpc_activity_t **)(a1 + 32);
    }
    -[xpc_activity_t _requireAssetStoreTempDir](v9, "_requireAssetStoreTempDir");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x1E0CB3940]);
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("encrypted-asset-%@"), v25);
    objc_msgSend(v22, "stringByAppendingPathComponent:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStore.m"), 255, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetURL.path"));

    }
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v53 = *(id *)(v30 + 40);
    v31 = objc_msgSend(v28, "copyItemAtPath:toPath:error:", v29, v27, &v53);
    objc_storeStrong((id *)(v30 + 40), v53);

    if ((v31 & 1) != 0)
    {
      objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("decrypted"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStore.m"), 266, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[assetFileName stringByAppendingPathExtension:@\"decrypted\"]"));

      }
      objc_msgSend(v7, "stringByAppendingPathComponent:", v32);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v27);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "namespaceNameForEncryptionKey");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v52 = *(id *)(v35 + 40);
      v36 = +[TRIRemoteAssetDecrypter decryptAssetWithURL:destinationFilename:namespaceName:error:](TRIRemoteAssetDecrypter, "decryptAssetWithURL:destinationFilename:namespaceName:error:", v33, v13, v34, &v52);
      objc_storeStrong((id *)(v35 + 40), v52);

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      LOBYTE(v35) = objc_msgSend(v37, "removeItemAtPath:error:", v27, &v51);
      v38 = v51;

      if ((v35 & 1) == 0)
      {
        TRILogCategory_Server();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v55 = v38;
          _os_log_error_impl(&dword_1D207F000, v39, OS_LOG_TYPE_ERROR, "Failed to remove copy of encrypted asset: %{public}@", buf, 0xCu);
        }

      }
      if (v36)
      {

        if (v13)
          goto LABEL_14;
        goto LABEL_52;
      }
      TRILogCategory_Server();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v44 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "namespaceNameForEncryptionKey");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v44;
        v56 = 2114;
        v57 = v45;
        _os_log_error_impl(&dword_1D207F000, v41, OS_LOG_TYPE_ERROR, "Unable to decrypt asset with identifier: %{public}@, namespace name: %{public}@", buf, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = 0;

    }
    else
    {
      TRILogCategory_Server();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v43 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        *(_DWORD *)buf = 138543362;
        v55 = v43;
        _os_log_error_impl(&dword_1D207F000, v40, OS_LOG_TYPE_ERROR, "Failed to relocate encrypted asset file: %{public}@", buf, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = 0;
    }

LABEL_50:
    return;
  }
  TRILogCategory_Server();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Unable to create temp directory", buf, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32) = 0;
}

- (BOOL)saveAssetWithIdentifier:(id)a3 builtFromAssetWithIdentifier:(id)a4 patchFilename:(id)a5 metadata:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  id *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __99__TRIAssetStore_saveAssetWithIdentifier_builtFromAssetWithIdentifier_patchFilename_metadata_error___block_invoke;
  v21[3] = &unk_1E9333640;
  v21[4] = self;
  v16 = v12;
  v22 = v16;
  v26 = &v28;
  v17 = v13;
  v23 = v17;
  v18 = v14;
  v24 = v18;
  v19 = v15;
  v25 = v19;
  v27 = a7;
  -[TRIAssetStore _acquireLockfileAndRunBlock:](self, "_acquireLockfileAndRunBlock:", v21);
  LOBYTE(self) = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v28, 8);
  return (char)self;
}

void __99__TRIAssetStore_saveAssetWithIdentifier_builtFromAssetWithIdentifier_patchFilename_metadata_error___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  id v40;
  id v41;
  char v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasAssetWithIdentifier:type:", *(_QWORD *)(a1 + 40), 0))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D207F000, v4, OS_LOG_TYPE_DEFAULT, "Warning: treating asset save as a no-op because asset is already present.", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    v42 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "hasAssetWithIdentifier:type:", *(_QWORD *)(a1 + 48), &v42))
      v5 = v42 == 1;
    else
      v5 = 0;
    if (v5)
    {
      v37 = os_transaction_create();
      objc_msgSend(*(id *)(a1 + 32), "pathForAssetContentWithIdentifier:", *(_QWORD *)(a1 + 48));
      v38 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_requireAssetStoreTempDir");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_alloc(MEMORY[0x1E0CB3940]);
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("partial-asset-%@"), v10);
      objc_msgSend(v7, "stringByAppendingPathComponent:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("content"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      LOBYTE(v11) = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v41);
      v15 = v41;

      if ((v11 & 1) != 0)
      {

        objc_msgSend(*(id *)(a1 + 32), "_requireAssetStoreTempDir");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc(MEMORY[0x1E0CB3940]);
        v18 = objc_opt_new();
        objc_msgSend((id)v18, "UUIDString");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("patch-%@"), v19);
        objc_msgSend(v16, "stringByAppendingPathComponent:", v20);
        v15 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_QWORD *)(a1 + 56);
        v40 = 0;
        LOBYTE(v18) = objc_msgSend(v21, "copyItemAtPath:toPath:error:", v22, v15, &v40);
        v23 = v40;

        if ((v18 & 1) != 0)
        {

          obj = 0;
          v24 = (void *)v38;
          v25 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "applyPatchWithFilename:toSrcDir:writingToEmptyDestDir:postPatchCompression:error:", v15, v38, v13, objc_msgSend(*(id *)(a1 + 64), "compressionMode"), &obj);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "removeItemAtPath:error:", v15, 0);

          if (v25 == 1)
          {

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "saveAssetWithIdentifier:sourcePath:flockWitness:removeSourceOnFailure:", *(_QWORD *)(a1 + 40), v12, a2, 1);
          }
          else
          {
            if (!v25)
            {
              TRILogCategory_Server();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v35 = *(void **)(a1 + 40);
                v36 = *(_QWORD *)(a1 + 48);
                *(_DWORD *)buf = 138543874;
                v44 = v35;
                v45 = 2114;
                v46 = v36;
                v47 = 2114;
                v48 = obj;
                _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Failed to construct asset %{public}@ by patching asset %{public}@: %{public}@", buf, 0x20u);
              }

            }
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "removeItemAtPath:error:", v12, 0);

            v29 = *(id **)(a1 + 80);
            if (v29)
              objc_storeStrong(v29, obj);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;

          }
          v31 = (void *)v37;
        }
        else
        {
          TRILogCategory_Server();
          v32 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v37;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v44 = v23;
            _os_log_error_impl(&dword_1D207F000, v32, OS_LOG_TYPE_ERROR, "Failed to relocate patch file: %{public}@", buf, 0xCu);
          }

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
          v24 = (void *)v38;
        }
      }
      else
      {
        TRILogCategory_Server();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v44 = v15;
          _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "Failed to create dest asset directory: %{public}@", buf, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
        v31 = (void *)v37;
        v24 = (void *)v38;
      }

    }
    else
    {
      TRILogCategory_Server();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v33 = *(void **)(a1 + 40);
        v34 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v44 = v33;
        v45 = 2114;
        v46 = v34;
        _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Can't create asset %{public}@ from patch because source asset %{public}@ is not present.", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
    }
  }
}

- (BOOL)_saveFileAssetWithIdentifier:(id)a3 assetFilename:(id)a4 flockWitness:(TRIFlockWitness_ *)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  -[TRIAssetStore _createTempDir](self, "_createTempDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_5;
  if (!-[TRIAssetStore _saveFileAssetWithIdentifier:assetFilename:workingTempDirectory:flockWitness:](self, "_saveFileAssetWithIdentifier:assetFilename:workingTempDirectory:flockWitness:", v8, v9, v10, a5))
  {
    -[TRIAssetStore _forceRemoveItemAtPath:](self, "_forceRemoveItemAtPath:", v10);
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v11 = 1;
LABEL_6:

  return v11;
}

- (BOOL)_saveFileAssetWithIdentifier:(id)a3 assetFilename:(id)a4 workingTempDirectory:(id)a5 flockWitness:(TRIFlockWitness_ *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  char *v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  char v20;
  id v22;
  int *v23;
  char *v24;
  int v25;
  const char *v26;
  int *v27;
  char *v28;
  int v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a4;
  objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("content"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v15 = objc_msgSend(v14, "triSafeCopyItemAtPath:toPath:error:", v12, v13, &v30);

  v16 = (char *)v30;
  if ((v15 & 1) == 0)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v13;
      v33 = 2114;
      v34 = v16;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Failed to copy asset file to temporary file %{public}@: %{public}@", buf, 0x16u);
    }

    goto LABEL_8;
  }

  v17 = objc_retainAutorelease(v13);
  if (chmod((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 0x180u))
  {
    TRILogCategory_Server();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v27 = __error();
    v28 = strerror(*v27);
    v29 = *__error();
    *(_DWORD *)buf = 138543874;
    v32 = v17;
    v33 = 2080;
    v34 = v28;
    v35 = 1024;
    v36 = v29;
    v26 = "Failed to set permissions on file-asset file %{public}@: %s (%d)";
LABEL_16:
    _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, v26, buf, 0x1Cu);
    goto LABEL_4;
  }
  if (!objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v17))
    goto LABEL_8;
  v22 = objc_retainAutorelease(v17);
  if (!chmod((const char *)objc_msgSend(v22, "fileSystemRepresentation"), 0x124u))
  {
    v20 = -[TRIAssetStoreOperations saveAssetWithIdentifier:sourcePath:flockWitness:removeSourceOnFailure:](self->_assetOperator, "saveAssetWithIdentifier:sourcePath:flockWitness:removeSourceOnFailure:", v10, v11, a6, 1);
    goto LABEL_9;
  }
  TRILogCategory_Server();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    v23 = __error();
    v24 = strerror(*v23);
    v25 = *__error();
    *(_DWORD *)buf = 138543874;
    v32 = v22;
    v33 = 2080;
    v34 = v24;
    v35 = 1024;
    v36 = v25;
    v26 = "Failed to set file permissions on temporary file %{public}@: %s (%d)";
    goto LABEL_16;
  }
LABEL_4:

LABEL_8:
  v20 = 0;
LABEL_9:

  return v20;
}

- ($A5A652246548B43F8BC05201A1C72A70)_saveDirectoryAssetWithIdentifier:(id)a3 assetFilename:(id)a4 metadata:(id)a5 flockWitness:(TRIFlockWitness_ *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  $A5A652246548B43F8BC05201A1C72A70 v19;
  TRIAssetExtracting *extractor;
  id v21;
  id v22;
  int *v24;
  char *v25;
  int v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  -[TRIAssetStore _createTempDir](self, "_createTempDir");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("content"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (mkdir((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 0x1F8u))
    {
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v24 = __error();
        v25 = strerror(*v24);
        v26 = *__error();
        *(_DWORD *)buf = 138543874;
        v29 = v17;
        v30 = 2080;
        v31 = v25;
        v32 = 1024;
        v33 = v26;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to create directory for dir-asset toplevel %{public}@: %s (%d)", buf, 0x1Cu);
      }

    }
    else if (objc_msgSend(MEMORY[0x1E0CB3620], "triRemoveFileProtectionIfPresentForPath:", v17))
    {
      extractor = self->_extractor;
      v27 = 0;
      v19.var0 = -[TRIAssetExtracting extractArchiveFromFile:withArchiveName:toEmptyDirectory:postExtractionCompression:error:](extractor, "extractArchiveFromFile:withArchiveName:toEmptyDirectory:postExtractionCompression:error:", v13, v12, v17, objc_msgSend(v14, "compressionMode"), &v27);
      v21 = v27;
      v22 = v21;
      if (v19.var0 == 1)
      {
        v19.var0 = -[TRIAssetStoreOperations saveAssetWithIdentifier:sourcePath:flockWitness:removeSourceOnFailure:](self->_assetOperator, "saveAssetWithIdentifier:sourcePath:flockWitness:removeSourceOnFailure:", v12, v16, a6, 1);
LABEL_12:

        goto LABEL_13;
      }
      if (a7)
      {
        v22 = objc_retainAutorelease(v21);
        *a7 = v22;
      }
LABEL_11:
      -[TRIAssetStore _forceRemoveItemAtPath:](self, "_forceRemoveItemAtPath:", v16);
      goto LABEL_12;
    }
    v19.var0 = 0;
    v22 = 0;
    goto LABEL_11;
  }
  v19.var0 = 0;
LABEL_13:

  return v19;
}

- (BOOL)removeAssetWithIdentifier:(id)a3
{
  return -[TRIAssetStoreOperations removeAssetWithIdentifier:](self->_assetOperator, "removeAssetWithIdentifier:", a3);
}

- (BOOL)linkAssetWithIdentifier:(id)a3 toPath:(id)a4
{
  return -[TRIAssetStore linkAssetWithIdentifier:toCurrentPath:futurePath:](self, "linkAssetWithIdentifier:toCurrentPath:futurePath:", a3, a4, a4);
}

- (BOOL)linkAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5
{
  id v9;
  id v10;
  id v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  BOOL v15;
  NSObject *v16;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  _BYTE *v25;
  _BYTE buf[24];
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 554, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentPath"));

    if (v11)
      goto LABEL_4;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 553, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  if (!v10)
    goto LABEL_18;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 555, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("futurePath"));

LABEL_4:
  if (!objc_msgSend(v10, "length"))
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TRIAssetStore linkAssetWithIdentifier:toCurrentPath:futurePath:]";
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "%s has empty path arg: currentPath", buf, 0xCu);
    }

    goto LABEL_15;
  }
  v12 = objc_msgSend(v11, "length") == 0;
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TRIAssetStore linkAssetWithIdentifier:toCurrentPath:futurePath:]";
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: futurePath", buf, 0xCu);
    }

LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_1D207F000, v14, OS_LOG_TYPE_DEFAULT, "Link asset: %{public}@ --> %{public}@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v27 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__TRIAssetStore_linkAssetWithIdentifier_toCurrentPath_futurePath___block_invoke;
  v21[3] = &unk_1E9333668;
  v21[4] = self;
  v22 = v9;
  v23 = v11;
  v25 = buf;
  v24 = v10;
  -[TRIAssetStore _acquireLockfileAndRunBlock:](self, "_acquireLockfileAndRunBlock:", v21);
  v15 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
LABEL_16:

  return v15;
}

void __66__TRIAssetStore_linkAssetWithIdentifier_toCurrentPath_futurePath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = (void *)os_transaction_create();
  v9 = 0;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasAssetWithIdentifier:type:", *(_QWORD *)(a1 + 40), &v9) & 1) != 0)
  {
    if (v9 == 1)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "_linkDirectoryAssetWithIdentifier:toCurrentPath:futurePath:flockWitness:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
    }
    else
    {
      if (v9)
        goto LABEL_10;
      v5 = objc_msgSend(*(id *)(a1 + 32), "_linkFileAssetWithIdentifier:toCurrentPath:futurePath:flockWitness:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), a2);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v5;
LABEL_10:
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "_clearUnrefAgeForAssetWithIdentifier:", *(_QWORD *)(a1 + 40));
    goto LABEL_12;
  }
  TRILogCategory_Server();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Asset store has no asset with identifier: %{public}@. Tried to link to %{public}@", buf, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
LABEL_12:

}

- (BOOL)_linkFileAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5 flockWitness:(TRIFlockWitness_ *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  const char *v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  int *v24;
  char *v25;
  int v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  char *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[TRIAssetStore _requireAssetStoreTempDir](self, "_requireAssetStoreTempDir");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIAssetStore pathForAssetContentWithIdentifier:](self, "pathForAssetContentWithIdentifier:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingPathComponent:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_retainAutorelease(v14);
  v19 = (const char *)objc_msgSend(v18, "fileSystemRepresentation");
  v20 = objc_retainAutorelease(v17);
  if (link(v19, (const char *)objc_msgSend(v20, "fileSystemRepresentation")))
  {
    TRILogCategory_Server();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v24 = __error();
      v25 = strerror(*v24);
      v26 = *__error();
      v27 = 138544130;
      v28 = v18;
      v29 = 2114;
      v30 = v20;
      v31 = 2080;
      v32 = v25;
      v33 = 1024;
      v34 = v26;
      _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Failed to link file asset %{public}@ --> %{public}@: %s (%d)", (uint8_t *)&v27, 0x26u);
    }

    goto LABEL_9;
  }
  if (!-[TRIAssetStoreOperations addSymlinkFromAssetWithIdentifier:toPath:flockWitness:](self->_assetOperator, "addSymlinkFromAssetWithIdentifier:toPath:flockWitness:", v10, v12, a6)|| !-[TRIAssetStore _overwriteRenameAsAtomicallyAsPossibleWithSrc:dest:](self, "_overwriteRenameAsAtomicallyAsPossibleWithSrc:dest:", v20, v11))
  {
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation"));
LABEL_9:
    v22 = 0;
    goto LABEL_10;
  }
  v22 = 1;
LABEL_10:

  return v22;
}

- (BOOL)_linkDirectoryAssetWithIdentifier:(id)a3 toCurrentPath:(id)a4 futurePath:(id)a5 flockWitness:(TRIFlockWitness_ *)a6
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t (**v13)(_QWORD);
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int v26;
  char v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  char *v33;
  NSObject *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  const char *v40;
  char *v41;
  char *v42;
  NSObject *v43;
  int *v44;
  char *v45;
  int v46;
  int *v47;
  char *v48;
  int v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  char v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v59;
  uint64_t v60;
  int *v61;
  char *v62;
  int v63;
  void *v64;
  void *v65;
  uint64_t v68;
  void *v69;
  void *context;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  TRIAssetStore *v77;
  uint64_t v78;
  char *v79;
  id v80;
  id v81;
  char *v82;
  id v83;
  id v84;
  _QWORD v85[5];
  id v86;
  _QWORD v87[6];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint8_t buf[4];
  id v95;
  __int16 v96;
  char *v97;
  __int16 v98;
  char *v99;
  __int16 v100;
  int v101;
  _QWORD v102[2];
  _BYTE v103[24];
  uint64_t (*v104)(uint64_t, uint64_t);
  void (*v105)(uint64_t);
  id v106;
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v76 = a3;
  v71 = a4;
  v72 = a5;
  v77 = self;
  -[TRIAssetStore _requireAssetStoreTempDir](self, "_requireAssetStoreTempDir");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[TRIAssetStore pathForAssetContentWithIdentifier:](self, "pathForAssetContentWithIdentifier:", v76);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0;
  v89 = &v88;
  v90 = 0x3032000000;
  v9 = (uint64_t)__Block_byref_object_dispose__26;
  v91 = __Block_byref_object_copy__26;
  v92 = __Block_byref_object_dispose__26;
  v10 = objc_opt_new();
  objc_msgSend((id)v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "stringByAppendingPathComponent:", v11);
  v93 = (id)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v87[0] = MEMORY[0x1E0C809B0];
  v87[1] = 3221225472;
  v87[2] = __89__TRIAssetStore__linkDirectoryAssetWithIdentifier_toCurrentPath_futurePath_flockWitness___block_invoke;
  v87[3] = &unk_1E9333690;
  v87[4] = self;
  v87[5] = &v88;
  v13 = (uint64_t (**)(_QWORD))MEMORY[0x1D8232C48](v87);
  context = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v89[5];
  v86 = 0;
  LOBYTE(v10) = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v86);
  v79 = (char *)v86;
  v74 = v14;
  if ((v10 & 1) == 0)
  {
    TRILogCategory_Server();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      v59 = v89[5];
      *(_DWORD *)v103 = 138543618;
      *(_QWORD *)&v103[4] = v59;
      *(_WORD *)&v103[12] = 2114;
      *(_QWORD *)&v103[14] = v79;
      _os_log_error_impl(&dword_1D207F000, v53, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@ for dir-asset: %{public}@", v103, 0x16u);
    }

    LOBYTE(v9) = 0;
    v26 = 1;
    goto LABEL_60;
  }
  *(_QWORD *)v103 = 0;
  *(_QWORD *)&v103[8] = v103;
  *(_QWORD *)&v103[16] = 0x3032000000;
  v104 = __Block_byref_object_copy__26;
  v105 = __Block_byref_object_dispose__26;
  v106 = 0;
  v69 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v73, 1);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0C99A18];
  v78 = *MEMORY[0x1E0C999D0];
  v102[0] = *MEMORY[0x1E0C999D0];
  v102[1] = v17;
  v68 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v12;
  v85[1] = 3221225472;
  v85[2] = __89__TRIAssetStore__linkDirectoryAssetWithIdentifier_toCurrentPath_futurePath_flockWitness___block_invoke_239;
  v85[3] = &unk_1E93336B8;
  v85[4] = v103;
  objc_msgSend(v16, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v69, v18, 24, v85);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    TRILogCategory_Server();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v95 = v73;
      _os_log_error_impl(&dword_1D207F000, v56, OS_LOG_TYPE_ERROR, "Failed to enumerate dir-asset for linking: %{public}@", buf, 0xCu);
    }

    v55 = v13[2](v13);
LABEL_58:
    LOBYTE(v9) = v55;
    v26 = 1;
    goto LABEL_59;
  }
  do
  {
    v20 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v19, "nextObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (objc_msgSend(v19, "isEnumeratingDirectoryPostOrder"))
      {
        v22 = (void *)v89[5];
        objc_msgSend(v21, "relativePath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v77, CFSTR("TRIAssetStore.m"), 685, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("childURL.relativePath"));

        }
        objc_msgSend(v22, "stringByAppendingPathComponent:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_retainAutorelease(v24);
        if (chmod((const char *)objc_msgSend(v25, "fileSystemRepresentation"), 0x16Du))
        {
          TRILogCategory_Server();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
          {
            v44 = __error();
            v45 = strerror(*v44);
            v46 = *__error();
            *(_DWORD *)buf = 138543874;
            v95 = v25;
            v96 = 2080;
            v97 = v45;
            v98 = 1024;
            LODWORD(v99) = v46;
            _os_log_error_impl(&dword_1D207F000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "Failed to set permissions on %{public}@: %s (%d)", buf, 0x1Cu);
          }

          LOBYTE(v9) = v13[2](v13);
          v26 = 1;
        }
        else
        {
          v26 = 2;
        }
        goto LABEL_43;
      }
      v83 = 0;
      v84 = 0;
      v27 = objc_msgSend(v21, "getResourceValue:forKey:error:", &v84, v78, &v83);
      v25 = v84;
      v28 = v83;
      if ((v27 & 1) != 0)
      {
        if (objc_msgSend(v25, "BOOLValue"))
        {
          v29 = (void *)v89[5];
          objc_msgSend(v21, "relativePath");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v77, CFSTR("TRIAssetStore.m"), 712, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("childURL.relativePath"));

          }
          objc_msgSend(v29, "stringByAppendingPathComponent:", v30);
          v31 = (id)objc_claimAutoreleasedReturnValue();

          v82 = v79;
          v32 = objc_msgSend(v74, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v31, 1, 0, &v82);
          v33 = v82;

          if ((v32 & 1) != 0)
          {
            v26 = 2;
          }
          else
          {
            TRILogCategory_Server();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v95 = v31;
              v96 = 2114;
              v97 = v33;
              _os_log_error_impl(&dword_1D207F000, v43, OS_LOG_TYPE_ERROR, "Failed to create subdirectory %{public}@ for dir-asset: %{public}@", buf, 0x16u);
            }

            LOBYTE(v9) = v13[2](v13);
            v26 = 1;
          }
LABEL_41:

          v79 = v33;
          goto LABEL_42;
        }

        v80 = 0;
        v81 = 0;
        v35 = objc_msgSend(v21, "getResourceValue:forKey:error:", &v81, v68, &v80);
        v25 = v81;
        v28 = v80;
        if ((v35 & 1) != 0)
        {
          if (objc_msgSend(v25, "BOOLValue"))
          {
            objc_msgSend(v21, "path");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v36)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v77, CFSTR("TRIAssetStore.m"), 741, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("childURL.path"));

            }
            v37 = (void *)v89[5];
            objc_msgSend(v21, "relativePath");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v38)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, v77, CFSTR("TRIAssetStore.m"), 743, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("childURL.relativePath"));

            }
            objc_msgSend(v37, "stringByAppendingPathComponent:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v31 = objc_retainAutorelease(v36);
            v40 = (const char *)objc_msgSend(v31, "fileSystemRepresentation");
            v41 = objc_retainAutorelease(v39);
            if (link(v40, (const char *)objc_msgSend(v41, "fileSystemRepresentation")))
            {
              TRILogCategory_Server();
              v9 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
              {
                v47 = __error();
                v48 = strerror(*v47);
                v49 = *__error();
                *(_DWORD *)buf = 138544130;
                v95 = v31;
                v96 = 2114;
                v97 = v41;
                v98 = 2080;
                v99 = v48;
                v100 = 1024;
                v101 = v49;
                _os_log_error_impl(&dword_1D207F000, (os_log_t)v9, OS_LOG_TYPE_ERROR, "Failed to link %{public}@ --> %{public}@ for dir-asset: %s (%d)", buf, 0x26u);
              }

              LOBYTE(v9) = v13[2](v13);
              v42 = v41;
              v26 = 1;
            }
            else
            {
              v42 = v41;
              v26 = 2;
            }

            v33 = v79;
            goto LABEL_41;
          }
          v26 = 0;
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
        TRILogCategory_Server();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v95 = v28;
          _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "Failed to determine regular file status: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        TRILogCategory_Server();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v95 = v28;
          _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, "Failed to determine directory status: %{public}@", buf, 0xCu);
        }
      }

      LOBYTE(v9) = v13[2](v13);
      v26 = 1;
      goto LABEL_42;
    }
    v26 = 3;
LABEL_44:

    objc_autoreleasePoolPop(v20);
  }
  while (!v26 || v26 == 2);
  if (v26 == 3)
  {
    if (*(_QWORD *)(*(_QWORD *)&v103[8] + 40))
    {
      TRILogCategory_Server();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        v64 = *(void **)(*(_QWORD *)&v103[8] + 40);
        *(_DWORD *)buf = 138543362;
        v95 = v64;
        _os_log_error_impl(&dword_1D207F000, v54, OS_LOG_TYPE_ERROR, "Failed to enumerate directory during asset linking: %{public}@", buf, 0xCu);
      }

      v55 = v13[2](v13);
      goto LABEL_58;
    }
    v26 = 0;
  }
LABEL_59:

  _Block_object_dispose(v103, 8);
LABEL_60:

  objc_autoreleasePoolPop(context);
  if (!v26)
  {
    if (chmod((const char *)objc_msgSend(objc_retainAutorelease((id)v89[5]), "fileSystemRepresentation"), 0x16Du))
    {
      TRILogCategory_Server();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        v60 = v89[5];
        v61 = __error();
        v62 = strerror(*v61);
        v63 = *__error();
        *(_DWORD *)v103 = 138543874;
        *(_QWORD *)&v103[4] = v60;
        *(_WORD *)&v103[12] = 2080;
        *(_QWORD *)&v103[14] = v62;
        *(_WORD *)&v103[22] = 1024;
        LODWORD(v104) = v63;
        _os_log_error_impl(&dword_1D207F000, v57, OS_LOG_TYPE_ERROR, "Failed to set permissions on %{public}@: %s (%d)", v103, 0x1Cu);
      }

LABEL_68:
      LOBYTE(v9) = v13[2](v13);
    }
    else
    {
      if (!-[TRIAssetStoreOperations addSymlinkFromAssetWithIdentifier:toPath:flockWitness:](v77->_assetOperator, "addSymlinkFromAssetWithIdentifier:toPath:flockWitness:", v76, v72, a6)|| !-[TRIAssetStore _overwriteRenameAsAtomicallyAsPossibleWithSrc:dest:](v77, "_overwriteRenameAsAtomicallyAsPossibleWithSrc:dest:", v89[5], v71))
      {
        goto LABEL_68;
      }
      LOBYTE(v9) = 1;
    }
  }

  _Block_object_dispose(&v88, 8);
  return v9 & 1;
}

uint64_t __89__TRIAssetStore__linkDirectoryAssetWithIdentifier_toCurrentPath_futurePath_flockWitness___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_forceRemoveItemAtPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return 0;
}

uint64_t __89__TRIAssetStore__linkDirectoryAssetWithIdentifier_toCurrentPath_futurePath_flockWitness___block_invoke_239(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

- (BOOL)referenceMAAutoAssetWithId:(id)a3 isFileFactor:(BOOL)a4 usingCurrentPath:(id)a5 futurePath:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

  if (v14)
    +[TRIReferenceManagedDir saveFromGarbageCollectionItemWithPath:](TRIReferenceManagedDir, "saveFromGarbageCollectionItemWithPath:", v12);
  -[TRIAssetStoreOperations referenceMAAutoAssetWithId:futurePath:currentPath:isFileFactor:](self->_assetOperator, "referenceMAAutoAssetWithId:futurePath:currentPath:isFileFactor:", v10, v12, v11, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15 != 0;

  return v16;
}

- (unint64_t)removableAssetsSizeOlderThanNumScans:(unsigned int)a3 ignoreRecentlyCreatedAssets:(BOOL)a4 includedCacheDeletableAssetIds:(id)a5 deleteableAssetIds:(id *)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  NSObject *v11;
  void *v12;
  unint64_t v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v10 = a5;
  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[TRIPaths assetStore](self->_paths, "assetStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v16 = v8;
    v17 = 2114;
    v18 = v12;
    _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Starting dry run garbage collection with age threshold %u for asset store: %{public}@", buf, 0x12u);

  }
  -[TRIAssetStoreOperations collectGarbageOlderThanNumScans:deletedAssetSize:ignoreRecentlyCreatedAssets:dryRun:includedCacheDeletableAssetIds:deletedAssetIds:](self->_assetOperator, "collectGarbageOlderThanNumScans:deletedAssetSize:ignoreRecentlyCreatedAssets:dryRun:includedCacheDeletableAssetIds:deletedAssetIds:", v8, &v14, v7, 1, v10, a6);

  return v14;
}

- (unint64_t)removableAssetsSizeOlderThanNumScans:(unsigned int)a3 includedCacheDeletableAssetIds:(id)a4
{
  return -[TRIAssetStore removableAssetsSizeOlderThanNumScans:ignoreRecentlyCreatedAssets:includedCacheDeletableAssetIds:deleteableAssetIds:](self, "removableAssetsSizeOlderThanNumScans:ignoreRecentlyCreatedAssets:includedCacheDeletableAssetIds:deleteableAssetIds:", *(_QWORD *)&a3, 1, a4, 0);
}

- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4
{
  return -[TRIAssetStore collectGarbageOlderThanNumScans:ignoreRecentlyCreatedAssets:deletedAssetSize:deletedAssetIds:](self, "collectGarbageOlderThanNumScans:ignoreRecentlyCreatedAssets:deletedAssetSize:deletedAssetIds:", *(_QWORD *)&a3, 1, a4, 0);
}

- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 ignoreRecentlyCreatedAssets:(BOOL)a4 deletedAssetSize:(unint64_t *)a5 deletedAssetIds:(id *)a6
{
  _BOOL8 v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[TRIPaths assetStore](self->_paths, "assetStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = 67109378;
    v14[1] = v9;
    v15 = 2114;
    v16 = v12;
    _os_log_impl(&dword_1D207F000, v11, OS_LOG_TYPE_DEFAULT, "Collecting garbage with age threshold %u for asset store: %{public}@", (uint8_t *)v14, 0x12u);

  }
  return -[TRIAssetStoreOperations collectGarbageOlderThanNumScans:deletedAssetSize:ignoreRecentlyCreatedAssets:dryRun:includedCacheDeletableAssetIds:deletedAssetIds:](self->_assetOperator, "collectGarbageOlderThanNumScans:deletedAssetSize:ignoreRecentlyCreatedAssets:dryRun:includedCacheDeletableAssetIds:deletedAssetIds:", v9, a5, v8, 0, 0, a6);
}

- (BOOL)isValidTargetForSymlink:(id)a3 assetIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  BOOL v11;
  BOOL v12;
  char v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0;
  -[TRIAssetStore pathForAssetContentWithIdentifier:](self, "pathForAssetContentWithIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v7, &v14);

  if ((v9 & 1) == 0)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Missing content %{public}@ while checking symlink", buf, 0xCu);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "triTargetPathForSymlink:", v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
LABEL_7:
    v12 = 0;
    goto LABEL_10;
  }
  if (v14)
    v11 = -[TRIAssetStore _isDirectoryAtPath:matchingAssetContentAtPath:](self, "_isDirectoryAtPath:matchingAssetContentAtPath:", v10, v7);
  else
    v11 = -[TRIAssetStore _isFileAtPath:matchingAssetContentAtPath:](self, "_isFileAtPath:matchingAssetContentAtPath:", v10, v7);
  v12 = v11;
LABEL_10:

  return v12;
}

- (BOOL)_isFileAtPath:(id)a3 matchingAssetContentAtPath:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  BOOL v9;
  int *v11;
  char *v12;
  dev_t v13;
  stat v14;
  stat v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  memset(&v14, 0, sizeof(v14));
  v6 = objc_retainAutorelease(a4);
  if (stat((const char *)objc_msgSend(v6, "fileSystemRepresentation", 0), &v14))
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = __error();
      v12 = strerror(*v11);
      v13 = *__error();
      v15.st_dev = 138543874;
      *(_QWORD *)&v15.st_mode = v6;
      WORD2(v15.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v15.st_ino + 6) = (__darwin_ino64_t)v12;
      HIWORD(v15.st_gid) = 1024;
      v15.st_rdev = v13;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Unexpected failure to stat() asset content %{public}@: %s (%d)", (uint8_t *)&v15, 0x1Cu);
    }

    v8 = 0;
  }
  else
  {
    memset(&v15, 0, sizeof(v15));
    if (stat((const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), &v15))
      v9 = 0;
    else
      v9 = v14.st_ino == v15.st_ino;
    v8 = v9;
  }

  return v8;
}

- (BOOL)_isDirectoryAtPath:(id)a3 matchingAssetContentAtPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;

  v5 = a3;
  v6 = a4;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v5, &v33);
  v9 = v33;

  v10 = 0;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "enumeratorAtPath:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v12, "nextObject");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v30 = v6;
      v16 = *MEMORY[0x1E0CB2B18];
      v31 = (void *)*MEMORY[0x1E0CB2B28];
      while (1)
      {
        objc_msgSend(v5, "stringByAppendingPathComponent:", v15, v30);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "attributesOfItemAtPath:error:", v17, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v18)
        {
          v10 = 0;
          goto LABEL_16;
        }
        v19 = v5;
        objc_msgSend(v12, "fileAttributes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21 != v22)
        {
          v10 = 0;
          v5 = v19;
          goto LABEL_16;
        }
        objc_msgSend(v12, "fileAttributes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 == v31)
          break;
        v5 = v19;

        objc_autoreleasePoolPop(v13);
        v13 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v12, "nextObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v10 = 1;
          goto LABEL_17;
        }
      }
      objc_msgSend(v12, "fileAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *MEMORY[0x1E0CB2AF8];
      objc_msgSend(v25, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF8]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v27, "isEqual:", v28);

      v5 = v19;
LABEL_16:

LABEL_17:
      v6 = v30;
    }
    else
    {
      v10 = 1;
    }
    objc_autoreleasePoolPop(v13);

  }
  return v10;
}

- (BOOL)hasAssetWithIdentifier:(id)a3 type:(unsigned __int8 *)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 996, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  }
  -[TRIAssetStore pathForAssetDirWithIdentifier:](self, "pathForAssetDirWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("content"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v9;
    _os_log_debug_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEBUG, "Checking for asset in path %@", buf, 0xCu);
  }

  buf[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v9, buf);

  if (a4 && v12)
    *a4 = buf[0];

  return v12;
}

- (void)enumerateSavedAssetsUsingBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  SEL v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 1014, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__TRIAssetStore_enumerateSavedAssetsUsingBlock___block_invoke;
  v8[3] = &unk_1E93336E0;
  v9 = v5;
  v10 = a2;
  v8[4] = self;
  v7 = v5;
  -[TRIAssetStore enumerateAssetDirsUsingBlock:](self, "enumerateAssetDirsUsingBlock:", v8);

}

void __48__TRIAssetStore_enumerateSavedAssetsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStore.m"), 1019, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", CFSTR("refs"), v16);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, 0, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v6, "nextObject");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = 0;
    do
    {
      objc_msgSend(v9, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("link-"));

      if (v12)
      {
        objc_msgSend(v9, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStore.m"), 1036, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("symlinkPath"));

        }
        v10 += objc_msgSend(*(id *)(a1 + 32), "isValidTargetForSymlink:assetIdentifier:", v13, v3);

      }
      objc_autoreleasePoolPop(v7);
      v7 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v6, "nextObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v9);
  }
  objc_autoreleasePoolPop(v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)fixFileProtectionForAssetStoreFiles
{
  -[TRIAssetStoreOperations fixFileProtectionForAssetStoreFiles](self->_assetOperator, "fixFileProtectionForAssetStoreFiles");
}

+ (id)shortHashForAssetIdentifier:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  char v11;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIAssetStore.m"), 1057, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("utf8Identifier"));

  }
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "bytes");
  objc_msgSend(v6, "length");
  v11 = _PASMurmur3_x86_32();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", &v11, 1, 0);
  objc_msgSend(v7, "triHexlify");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)setCreationDate:(id)a3 forAssetIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TRIAssetStore pathForAssetDirWithIdentifier:](self, "pathForAssetDirWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CB2A88];
  v21[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v11 = objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v9, v8, &v15);
  v12 = v15;

  if ((v11 & 1) == 0)
  {
    TRILogCategory_Server();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v12;
      _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Failed to backdate %{public}@; %{public}@",
        buf,
        0x16u);
    }

  }
  return v11;
}

- (id)pathForAssetDirWithIdentifier:(id)a3
{
  void *v3;
  TRIPaths *paths;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  paths = self->_paths;
  v5 = a3;
  -[TRIPaths assetStore](paths, "assetStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = CFSTR("assets");
  objc_msgSend((id)objc_opt_class(), "shortHashForAssetIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  v11[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pathForAssetContentWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIAssetStore pathForAssetDirWithIdentifier:](self, "pathForAssetDirWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("content"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)pathForRefsToAssetWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  -[TRIAssetStore pathForAssetDirWithIdentifier:](self, "pathForAssetDirWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("refs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)_createTempDir
{
  char *v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  const char *v10;
  id v11;
  char *v12;
  char *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int *v19;
  char *v20;
  int v21;
  int *v22;
  char *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[TRIAssetStore _requireAssetStoreTempDir](self, "_requireAssetStoreTempDir");
  v4 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v6 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v28);
  v7 = v28;

  if ((v6 & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v30 = v4;
      v31 = 2114;
      v32 = v7;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@: %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("partial-asset-XXXXXX"));
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 1112, CFSTR("Unexpected UTF-8 conversion failure: %@"), v9);

  }
  v11 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", v10, strlen(v10) + 1));
  v12 = (char *)objc_msgSend(v11, "mutableBytes");
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v13 = v12;
  if (mkdtemp(v12))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v13);
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStore.m"), 1123, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

    }
    v15 = objc_retainAutorelease(v14);
    if (!chmod((const char *)-[NSObject fileSystemRepresentation](v15, "fileSystemRepresentation"), 0x1F8u))
    {
      v15 = v15;
      v17 = v15;
      goto LABEL_19;
    }
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = __error();
      v20 = strerror(*v19);
      v21 = *__error();
      *(_DWORD *)buf = 136315394;
      v30 = v20;
      v31 = 1024;
      LODWORD(v32) = v21;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failed to adjust permissions on temp dir: %s (%d)", buf, 0x12u);
    }

    -[TRIAssetStore _forceRemoveItemAtPath:](self, "_forceRemoveItemAtPath:", v15);
  }
  else
  {
    TRILogCategory_Server();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = __error();
      v23 = strerror(*v22);
      v24 = *__error();
      *(_DWORD *)buf = 136315394;
      v30 = v23;
      v31 = 1024;
      LODWORD(v32) = v24;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to create temp dir: %s (%d)", buf, 0x12u);
    }
  }
  v17 = 0;
LABEL_19:

  return v17;
}

- (void)enumerateAssetDirsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *context;
  unsigned __int8 v20;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  context = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E98];
  -[TRIPaths assetStore](self->_paths, "assetStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:relativeToURL:", CFSTR("assets"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v9, 0, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v10, "nextObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    while (1)
    {
      objc_msgSend(v5, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, 0, 1, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v14, "nextObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
        break;
LABEL_7:
      objc_autoreleasePoolPop(v15);

      objc_autoreleasePoolPop(v11);
      v11 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v10, "nextObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_10;
    }
    v17 = (void *)v16;
    while (1)
    {
      v20 = 0;
      v18 = (void *)MEMORY[0x1D8232A5C]();
      v4[2](v4, v17, &v20);
      objc_autoreleasePoolPop(v18);
      LODWORD(v18) = v20;

      objc_autoreleasePoolPop(v15);
      if ((_DWORD)v18)
        break;
      v15 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v14, "nextObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        goto LABEL_7;
    }

  }
LABEL_10:
  objc_autoreleasePoolPop(v11);

  objc_autoreleasePoolPop(context);
}

- (BOOL)_forceRemoveItemAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v6 = objc_msgSend(v5, "triForceRemoveItemAtPath:error:", v4, &v10);

  v7 = v10;
  if ((v6 & 1) == 0)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to force-remove: %{public}@", buf, 0xCu);
    }

  }
  return v6;
}

- (BOOL)_overwriteRenameAsAtomicallyAsPossibleWithSrc:(id)a3 dest:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  BOOL v10;
  id v11;
  int v12;
  int v13;
  __int16 *v14;
  id v15;
  const std::__fs::filesystem::path *v16;
  id v17;
  const std::__fs::filesystem::path *v18;
  std::error_code *v19;
  int v20;
  int *v22;
  char *v23;
  dev_t v24;
  NSObject *v25;
  int *v26;
  char *v27;
  int v28;
  __int16 v29;
  stat v30;
  stat v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(&v31, 0, sizeof(v31));
  v8 = objc_retainAutorelease(v6);
  if (stat((const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v31))
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v22 = __error();
      v23 = strerror(*v22);
      v24 = *__error();
      v30.st_dev = 138543874;
      *(_QWORD *)&v30.st_mode = v8;
      WORD2(v30.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v30.st_ino + 6) = (__darwin_ino64_t)v23;
      HIWORD(v30.st_gid) = 1024;
      v30.st_rdev = v24;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Failed to stat %{public}@: %s (%d)", (uint8_t *)&v30, 0x1Cu);
    }

    goto LABEL_5;
  }
  v29 = v31.st_mode & 0x1FF;
  memset(&v30, 0, sizeof(v30));
  v11 = objc_retainAutorelease(v7);
  v12 = stat((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &v30);
  v13 = v12;
  if ((v31.st_mode & 0xF000) == 0x4000)
  {
    chmod((const char *)objc_msgSend(objc_retainAutorelease(v8), "fileSystemRepresentation"), 0x1F8u);
    v14 = &v29;
    if (!v13)
    {
LABEL_10:
      if ((v30.st_mode & 0xF000) == 0x4000)
        chmod((const char *)objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation"), 0x1F8u);
    }
  }
  else
  {
    v14 = 0;
    if (!v12)
      goto LABEL_10;
  }
  v15 = objc_retainAutorelease(v8);
  v16 = (const std::__fs::filesystem::path *)objc_msgSend(v15, "fileSystemRepresentation");
  v17 = objc_retainAutorelease(v11);
  v18 = (const std::__fs::filesystem::path *)objc_msgSend(v17, "fileSystemRepresentation");
  rename(v16, v18, v19);
  if (!v20)
  {
    -[TRIAssetStore _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v17, v14);
    v10 = 1;
    goto LABEL_19;
  }
  if (*__error() == 17 || *__error() == 66 || *__error() == 21 || *__error() == 20)
  {
    v10 = -[TRIAssetStore _nonAtomicOverwriteWithSrc:dest:finalPermissionBits:](self, "_nonAtomicOverwriteWithSrc:dest:finalPermissionBits:", v15, v17, v14);
    goto LABEL_19;
  }
  TRILogCategory_Server();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = __error();
    v27 = strerror(*v26);
    v28 = *__error();
    v31.st_dev = 138544130;
    *(_QWORD *)&v31.st_mode = v15;
    WORD2(v31.st_ino) = 2114;
    *(__darwin_ino64_t *)((char *)&v31.st_ino + 6) = (__darwin_ino64_t)v17;
    HIWORD(v31.st_gid) = 2080;
    *(_QWORD *)&v31.st_rdev = v27;
    LOWORD(v31.st_atimespec.tv_sec) = 1024;
    *(_DWORD *)((char *)&v31.st_atimespec.tv_sec + 2) = v28;
    _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Failed to rename() %{public}@ --> %{public}@: %s (%d)", (uint8_t *)&v31, 0x26u);
  }

  -[TRIAssetStore _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v15, v14);
LABEL_5:
  v10 = 0;
LABEL_19:

  return v10;
}

- (void)_fixupPermissionsOnPath:(id)a3 permissionBits:(const unsigned __int16 *)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  int *v9;
  char *v10;
  int v11;
  int v12;
  id v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = objc_retainAutorelease(v5);
    if (chmod((const char *)objc_msgSend(v7, "fileSystemRepresentation"), *a4))
    {
      TRILogCategory_Server();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = __error();
        v10 = strerror(*v9);
        v11 = *__error();
        v12 = 138543874;
        v13 = v7;
        v14 = 2080;
        v15 = v10;
        v16 = 1024;
        v17 = v11;
        _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to restore permission bits on %{public}@: %s (%d)", (uint8_t *)&v12, 0x1Cu);
      }

    }
  }

}

- (BOOL)_nonAtomicOverwriteWithSrc:(id)a3 dest:(id)a4 finalPermissionBits:(const unsigned __int16 *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  const std::__fs::filesystem::path *v15;
  id v16;
  const std::__fs::filesystem::path *v17;
  std::error_code *v18;
  int v19;
  NSObject *v20;
  int *v21;
  char *v22;
  int v23;
  const char *v24;
  id v25;
  const std::__fs::filesystem::path *v26;
  id v27;
  const std::__fs::filesystem::path *v28;
  std::error_code *v29;
  int v30;
  const std::__fs::filesystem::path *v31;
  id v32;
  const std::__fs::filesystem::path *v33;
  std::error_code *v34;
  BOOL v35;
  int *v37;
  char *v38;
  int v39;
  int v40;
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  char *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[TRIAssetStore _requireAssetStoreTempDir](self, "_requireAssetStoreTempDir");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v9);
  v15 = (const std::__fs::filesystem::path *)objc_msgSend(v14, "fileSystemRepresentation");
  v16 = objc_retainAutorelease(v13);
  v17 = (const std::__fs::filesystem::path *)objc_msgSend(v16, "fileSystemRepresentation");
  rename(v15, v17, v18);
  if (v19)
  {
    -[TRIAssetStore _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v8, a5);
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = __error();
      v22 = strerror(*v21);
      v23 = *__error();
      v40 = 138544130;
      v41 = v14;
      v42 = 2114;
      v43 = v16;
      v44 = 2080;
      v45 = v22;
      v46 = 1024;
      v47 = v23;
      v24 = "Failed rename() to relocate before overwrite %{public}@ -> %{public}@: %s (%d)";
LABEL_10:
      _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v40, 0x26u);
    }
  }
  else
  {
    v25 = objc_retainAutorelease(v8);
    v26 = (const std::__fs::filesystem::path *)objc_msgSend(v25, "fileSystemRepresentation");
    v27 = objc_retainAutorelease(v14);
    v28 = (const std::__fs::filesystem::path *)objc_msgSend(v27, "fileSystemRepresentation");
    rename(v26, v28, v29);
    if (!v30)
    {
      -[TRIAssetStore _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v27, a5);
      -[TRIAssetStore _forceRemoveItemAtPath:](self, "_forceRemoveItemAtPath:", v16);
      v35 = 1;
      goto LABEL_7;
    }
    v31 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation");
    v32 = objc_retainAutorelease(v27);
    v33 = (const std::__fs::filesystem::path *)objc_msgSend(v32, "fileSystemRepresentation");
    rename(v31, v33, v34);
    -[TRIAssetStore _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v25, a5);
    TRILogCategory_Server();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v37 = __error();
      v38 = strerror(*v37);
      v39 = *__error();
      v40 = 138544130;
      v41 = v25;
      v42 = 2114;
      v43 = v32;
      v44 = 2080;
      v45 = v38;
      v46 = 1024;
      v47 = v39;
      v24 = "Failed to rename() even after relocating destination: %{public}@ --> %{public}@: %s (%d)";
      goto LABEL_10;
    }
  }

  v35 = 0;
LABEL_7:

  return v35;
}

- (BOOL)_clearUnrefAgeForAssetWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  int *v9;
  char *v10;
  int v11;
  int v12;
  char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[TRIAssetStore pathForAssetDirWithIdentifier:](self, "pathForAssetDirWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("unref-age"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  if (unlink((const char *)objc_msgSend(v5, "fileSystemRepresentation")) && *__error() != 2)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      v11 = *__error();
      v12 = 136315394;
      v13 = v10;
      v14 = 1024;
      v15 = v11;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Failed to unlink() unref-age: %s (%d)", (uint8_t *)&v12, 0x12u);
    }

    v6 = 0;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (TRIAssetStoreOperations)assetOperator
{
  return self->_assetOperator;
}

- (void)setAssetOperator:(id)a3
{
  objc_storeStrong((id *)&self->_assetOperator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetOperator, 0);
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_monitoredActivity, 0);
  objc_storeStrong((id *)&self->_patcher, 0);
  objc_storeStrong((id *)&self->_extractor, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
