@implementation TRIAssetStoreOperator

- (TRIAssetStoreOperator)initWithPaths:(id)a3 storageManagement:(id)a4 assetStore:(id)a5
{
  id v9;
  id v10;
  id v11;
  TRIAssetStoreOperator *v12;
  TRIAssetStoreOperator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TRIAssetStoreOperator;
  v12 = -[TRIAssetStoreOperator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_paths, a3);
    objc_storeStrong((id *)&v13->_storageManagement, a4);
    objc_storeWeak((id *)&v13->_store, v11);
    objc_msgSend(v11, "setAssetOperator:", v13);
  }

  return v13;
}

- (BOOL)saveAssetWithIdentifier:(id)a3 sourcePath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 removeSourceOnFailure:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  BOOL v10;
  void *v11;

  v6 = a6;
  v9 = a4;
  v10 = -[TRIAssetStoreOperator _moveDirectoryAssetFromDirectory:toLocationForAssetIdentifier:](self, "_moveDirectoryAssetFromDirectory:toLocationForAssetIdentifier:", v9, a3);
  if (!v10 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "triForceRemoveItemAtPath:error:", v9, 0);

  }
  return v10;
}

- (BOOL)_moveDirectoryAssetFromDirectory:(id)a3 toLocationForAssetIdentifier:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  char v29;
  void *v30;
  NSObject *v31;
  int *v32;
  int v33;
  NSObject *v34;
  const char *v35;
  uint32_t v36;
  NSObject *v37;
  const char *v38;
  int *v39;
  char *v40;
  dev_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  char v47;
  id v48;
  NSObject *v49;
  int *v51;
  char *v52;
  dev_t v53;
  char *v54;
  void *v55;
  uint64_t v56;
  TRIAssetStoreOperator *v58;
  void *v59;
  id v60;
  id v61;
  os_log_t oslog;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  char v75;
  uint8_t buf[4];
  _BYTE v77[18];
  __int16 v78;
  int v79;
  stat v80;
  _QWORD v81[5];

  v81[2] = *MEMORY[0x1E0C80C00];
  v61 = a3;
  v6 = a4;
  v58 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v8 = WeakRetained;
  v59 = v6;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pathForAssetDirWithIdentifier:", v6);
    oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "stringByAppendingPathComponent:", CFSTR("content"));
    v60 = (id)objc_claimAutoreleasedReturnValue();
    v75 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v60, &v75);

    if ((v10 & 1) == 0)
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v80.st_dev = 138543618;
        *(_QWORD *)&v80.st_mode = v59;
        WORD2(v80.st_ino) = 2114;
        *(__darwin_ino64_t *)((char *)&v80.st_ino + 6) = (__darwin_ino64_t)v60;
        _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Unable to save asset %{public}@. Can't find source at %{public}@", (uint8_t *)&v80, 0x16u);
      }

    }
    if (v75)
    {
      v12 = objc_retainAutorelease(v60);
      if (chmod((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 0x168u))
      {
        TRILogCategory_Server();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v51 = __error();
          v52 = strerror(*v51);
          v53 = *__error();
          v80.st_dev = 138543874;
          *(_QWORD *)&v80.st_mode = v12;
          WORD2(v80.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v80.st_ino + 6) = (__darwin_ino64_t)v52;
          HIWORD(v80.st_gid) = 1024;
          v80.st_rdev = v53;
          _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Failed to set permissions on dir-asset toplevel directory %{public}@: %s (%d)", (uint8_t *)&v80, 0x1Cu);
        }

LABEL_57:
        v14 = 0;
LABEL_63:

        goto LABEL_64;
      }
      v69 = 0;
      v70 = &v69;
      v71 = 0x3032000000;
      v72 = __Block_byref_object_copy__43;
      v73 = __Block_byref_object_dispose__43;
      v74 = 0;
      v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v12, 1);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x1E0C99A18];
      v56 = *MEMORY[0x1E0C999D0];
      v81[0] = *MEMORY[0x1E0C999D0];
      v81[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __87__TRIAssetStoreOperator__moveDirectoryAssetFromDirectory_toLocationForAssetIdentifier___block_invoke;
      v68[3] = &unk_1E93336B8;
      v68[4] = &v69;
      objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v55, v17, 0, v68);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        while (1)
        {
          v19 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v18, "nextObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (!v20)
          {
            v28 = 3;
            goto LABEL_29;
          }
          v66 = 0;
          v67 = 0;
          v22 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v67, v16, &v66);
          v23 = v67;
          v24 = v66;
          if ((v22 & 1) != 0)
          {
            if (objc_msgSend(v23, "BOOLValue"))
            {
              objc_msgSend(v21, "path");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v25)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v58, CFSTR("TRIAssetStoreOperator.m"), 140, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("childURL.path"));

              }
              v26 = objc_retainAutorelease(v25);
              if (!chmod((const char *)-[NSObject fileSystemRepresentation](v26, "fileSystemRepresentation"), 0x124u))
              {
LABEL_43:
                v28 = 2;
                goto LABEL_27;
              }
              TRILogCategory_Server();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                v39 = __error();
                v40 = strerror(*v39);
                v41 = *__error();
                v80.st_dev = 138543874;
                *(_QWORD *)&v80.st_mode = v26;
                WORD2(v80.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&v80.st_ino + 6) = (__darwin_ino64_t)v40;
                HIWORD(v80.st_gid) = 1024;
                v80.st_rdev = v41;
                _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Failed to set permissions on dir-asset file %{public}@: %s (%d)", (uint8_t *)&v80, 0x1Cu);
              }
              goto LABEL_23;
            }

            v64 = 0;
            v65 = 0;
            v29 = objc_msgSend(v21, "getResourceValue:forKey:error:", &v65, v56, &v64);
            v23 = v65;
            v24 = v64;
            if ((v29 & 1) != 0)
            {
              if (!objc_msgSend(v23, "BOOLValue"))
              {
                v28 = 0;
                goto LABEL_28;
              }
              objc_msgSend(v21, "path");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v30)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v58, CFSTR("TRIAssetStoreOperator.m"), 167, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("childURL.path"));

              }
              memset(&v80, 0, sizeof(v80));
              v26 = objc_retainAutorelease(v30);
              if (!lstat((const char *)-[NSObject fileSystemRepresentation](v26, "fileSystemRepresentation"), &v80)
                && (~v80.st_mode & 0x140) != 0)
              {
                TRILogCategory_Server();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v77 = v80.st_mode;
                  *(_WORD *)&v77[4] = 2114;
                  *(_QWORD *)&v77[6] = v61;
                  v34 = v27;
                  v35 = "Candidate asset subdirectory was constructed with bad permission bits 0%o: %{public}@";
                  v36 = 18;
LABEL_50:
                  _os_log_error_impl(&dword_1D207F000, v34, OS_LOG_TYPE_ERROR, v35, buf, v36);
                }
              }
              else
              {
                v31 = objc_retainAutorelease(v26);
                if (!chmod((const char *)-[NSObject fileSystemRepresentation](v31, "fileSystemRepresentation"), 0x168u))
                  goto LABEL_43;
                TRILogCategory_Server();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  v32 = __error();
                  v54 = strerror(*v32);
                  v33 = *__error();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)v77 = v31;
                  *(_WORD *)&v77[8] = 2080;
                  *(_QWORD *)&v77[10] = v54;
                  v78 = 1024;
                  v79 = v33;
                  v34 = v27;
                  v35 = "Failed to set permissions on dir-asset subdirectory %{public}@: %s (%d)";
                  v36 = 28;
                  goto LABEL_50;
                }
              }
LABEL_23:

              goto LABEL_26;
            }
            TRILogCategory_Server();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v80.st_dev = 138543362;
              *(_QWORD *)&v80.st_mode = v24;
              v37 = v26;
              v38 = "Failed to get directory attribute: %{public}@";
LABEL_46:
              _os_log_error_impl(&dword_1D207F000, v37, OS_LOG_TYPE_ERROR, v38, (uint8_t *)&v80, 0xCu);
            }
          }
          else
          {
            TRILogCategory_Server();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              v80.st_dev = 138543362;
              *(_QWORD *)&v80.st_mode = v24;
              v37 = v26;
              v38 = "Failed to get regular file attribute: %{public}@";
              goto LABEL_46;
            }
          }
LABEL_26:
          v28 = 1;
LABEL_27:

LABEL_28:
LABEL_29:

          objc_autoreleasePoolPop(v19);
          if (v28 && v28 != 2)
          {
            if (v28 == 3)
              v28 = v70[5] != 0;
            goto LABEL_56;
          }
        }
      }
      TRILogCategory_Server();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v80.st_dev = 138543362;
        *(_QWORD *)&v80.st_mode = v12;
        _os_log_error_impl(&dword_1D207F000, v44, OS_LOG_TYPE_ERROR, "Failed to enumerate dir-asset toplevel directory: %{public}@", (uint8_t *)&v80, 0xCu);
      }

      v28 = 1;
LABEL_56:

      _Block_object_dispose(&v69, 8);
      if (v28)
        goto LABEL_57;
    }
    -[NSObject stringByDeletingLastPathComponent](oslog, "stringByDeletingLastPathComponent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    v47 = objc_msgSend(v46, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v45, 1, 0, &v63);
    v48 = v63;

    if ((v47 & 1) == 0)
    {
      TRILogCategory_Server();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v80.st_dev = 138543362;
        *(_QWORD *)&v80.st_mode = v48;
        _os_log_error_impl(&dword_1D207F000, v49, OS_LOG_TYPE_ERROR, "Failed to create parent directory for asset: %{public}@", (uint8_t *)&v80, 0xCu);
      }

    }
    v14 = -[TRIAssetStoreOperator _overwriteRenameAsAtomicallyAsPossibleWithSrc:dest:](v58, "_overwriteRenameAsAtomicallyAsPossibleWithSrc:dest:", v61, oslog);
    goto LABEL_63;
  }
  TRILogCategory_Server();
  oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v80.st_dev) = 0;
    _os_log_error_impl(&dword_1D207F000, oslog, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", (uint8_t *)&v80, 2u);
  }
  v14 = 0;
LABEL_64:

  return v14;
}

uint64_t __87__TRIAssetStoreOperator__moveDirectoryAssetFromDirectory_toLocationForAssetIdentifier___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

- (BOOL)removeAssetWithIdentifier:(id)a3
{
  id v5;
  id v6;
  BOOL v7;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreOperator.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  }
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__TRIAssetStoreOperator_removeAssetWithIdentifier___block_invoke;
  v10[3] = &unk_1E9335730;
  v12 = &v13;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  if (-[TRIAssetStoreOperator _acquireLockfileAndRunBlock:](self, "_acquireLockfileAndRunBlock:", v10))
    v7 = *((_BYTE *)v14 + 24) != 0;
  else
    v7 = 0;

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __51__TRIAssetStoreOperator_removeAssetWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_removeAssetWithIdentifier:flockWitness:deletedAssetSize:dryRun:", *(_QWORD *)(a1 + 40), a2, 0, 0);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

+ (unint64_t)_fileSizeInBytesForPath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileSize");

  objc_msgSend(v4, "enumeratorAtPath:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v7, "nextObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), v3, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attributesOfItemAtPath:error:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fileSize");

      v6 += v13;
      objc_autoreleasePoolPop(v8);
      v8 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v7, "nextObject");
      v14 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v14;
    }
    while (v14);
  }
  objc_autoreleasePoolPop(v8);

  return v6;
}

- (BOOL)_removeAssetWithIdentifier:(id)a3 flockWitness:(TRIFlockWitness_ *)a4 deletedAssetSize:(unint64_t *)a5 dryRun:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id WeakRetained;
  NSObject *v11;
  NSObject *v12;
  const __CFString *v13;
  unint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v6 = a6;
  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  TRILogCategory_Server();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!WeakRetained)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = &stru_1E9336E60;
    if (v6)
      v13 = CFSTR("(dry-run) ");
    *(_DWORD *)buf = 138543618;
    v24 = v13;
    v25 = 2114;
    v26 = v9;
    _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Removing asset: %{public}@", buf, 0x16u);
  }

  if (a5)
    *a5 = 0;
  if (objc_msgSend(WeakRetained, "hasAssetWithIdentifier:type:", v9, 0))
  {
    objc_msgSend(WeakRetained, "pathForAssetDirWithIdentifier:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend((id)objc_opt_class(), "_fileSizeInBytesForPath:", v12);
    if (v6)
    {
      if (!a5)
        goto LABEL_20;
      goto LABEL_19;
    }
    v22 = (void *)os_transaction_create();
    -[TRIAssetStoreOperator _requireAssetStoreTempDir](self, "_requireAssetStoreTempDir");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[TRIAssetStoreOperator _overwriteRenameAsAtomicallyAsPossibleWithSrc:dest:](self, "_overwriteRenameAsAtomicallyAsPossibleWithSrc:dest:", v12, v19))
    {
      v20 = -[TRIAssetStoreOperator _forceRemoveItemAtPath:](self, "_forceRemoveItemAtPath:", v19);

      v15 = 1;
      if (!a5 || !v20)
        goto LABEL_21;
LABEL_19:
      *a5 = v14;
LABEL_20:
      v15 = 1;
      goto LABEL_21;
    }

LABEL_14:
    v15 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v15 = 1;
LABEL_22:

  return v15;
}

- (BOOL)addSymlinkFromAssetWithIdentifier:(id)a3 toPath:(id)a4 flockWitness:(TRIFlockWitness_ *)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  id v23;
  int v24;
  BOOL v25;
  NSObject *v26;
  int *v28;
  char *v29;
  int v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pathForRefsToAssetWithIdentifier:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v31);
    v14 = v31;

    if ((v13 & 1) == 0)
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v33 = v14;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to create directory: %{public}@", buf, 0xCu);
      }

    }
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("link-%@"), v18);
    -[NSObject stringByAppendingPathComponent:](v11, "stringByAppendingPathComponent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_retainAutorelease(v8);
    v22 = (const char *)objc_msgSend(v21, "fileSystemRepresentation");
    v23 = objc_retainAutorelease(v20);
    v24 = symlink(v22, (const char *)objc_msgSend(v23, "fileSystemRepresentation"));
    v25 = v24 == 0;
    if (v24)
    {
      TRILogCategory_Server();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v28 = __error();
        v29 = strerror(*v28);
        v30 = *__error();
        *(_DWORD *)buf = 138544130;
        v33 = v23;
        v34 = 2114;
        v35 = v21;
        v36 = 2080;
        v37 = v29;
        v38 = 1024;
        v39 = v30;
        _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Failed to create symlink %{public}@ --> %{public}@: %s (%d)", buf, 0x26u);
      }

    }
  }
  else
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }
    v25 = 0;
  }

  return v25;
}

- (id)referenceMAAutoAssetWithId:(id)a3 futurePath:(id)a4 currentPath:(id)a5 isFileFactor:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  SEL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__43;
  v30 = __Block_byref_object_dispose__43;
  v31 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke;
  v19[3] = &unk_1E9335798;
  v19[4] = self;
  v14 = v11;
  v20 = v14;
  v15 = v12;
  v25 = a6;
  v21 = v15;
  v24 = a2;
  v16 = v13;
  v22 = v16;
  v23 = &v26;
  -[TRIAssetStoreOperator _acquireLockfileAndRunBlock:](self, "_acquireLockfileAndRunBlock:", v19);
  v17 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke(uint64_t a1)
{
  TRIAssetStoreDatabase *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  char v40;
  id v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  void *v49;
  BOOL v50;
  uint64_t v51;
  void *v52;
  void *v53;
  NSObject *log;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *oslog;
  id v60;
  id v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id obj;
  id location;
  uint8_t v67[4];
  id v68;
  __int16 v69;
  void *v70;
  uint64_t v71;
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v2 = -[TRIAssetStoreDatabase initWithPaths:storageManagement:]([TRIAssetStoreDatabase alloc], "initWithPaths:storageManagement:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  if (v2)
  {
    location = 0;
    v57 = (void *)objc_opt_new();
    objc_msgSend(v57, "createAutoAssetWithId:decryptionKey:error:", *(_QWORD *)(a1 + 40), 0, &location);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      TRILogCategory_Server();
      oslog = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        v34 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v34;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = location;
        _os_log_error_impl(&dword_1D207F000, oslog, OS_LOG_TYPE_ERROR, "Failed to instantiate MAAutoAsset %{public}@: %{public}@", buf, 0x16u);
      }
      goto LABEL_57;
    }
    v4 = location;
    location = 0;

    obj = location;
    objc_msgSend(v3, "currentLocksSync:", &obj);
    oslog = objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&location, obj);
    TRILogCategory_Server();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = oslog;
      _os_log_impl(&dword_1D207F000, v5, OS_LOG_TYPE_DEFAULT, "MAAutoAssetStatus lock usage: %{public}@", buf, 0xCu);
    }

    -[NSObject objectForKeyedSubscript:](oslog, "objectForKeyedSubscript:", CFSTR("persistently required by Trial"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if (oslog && objc_msgSend(v53, "intValue"))
    {
      TRILogCategory_Server();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      v7 = objc_msgSend(v53, "longValue");
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v3;
      v8 = "MAAutoAsset already persistently locked %ld time(s), creating new lock anyway: %{public}@";
      v9 = v6;
      v10 = 22;
    }
    else
    {
      TRILogCategory_Server();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v3;
      v8 = "MAAutoAsset was not persistently locked, creating new lock: %{public}@";
      v9 = v6;
      v10 = 12;
    }
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_12:

    v58 = (void *)objc_opt_new();
    objc_msgSend(v58, "setLockAcrossTermination:", 1);
    objc_msgSend(v58, "setLockAcrossReboot:", 1);
    objc_msgSend(v58, "setLockInhibitsEmergencyRemoval:", 1);
    v11 = location;
    location = 0;

    v64 = location;
    objc_msgSend(v3, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:", CFSTR("persistently required by Trial"), v58, 0, 0, 0, &v64);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&location, v64);
    if (!v56)
    {
      TRILogCategory_Server();
      log = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v3;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = location;
        _os_log_error_impl(&dword_1D207F000, log, OS_LOG_TYPE_ERROR, "Could not create persistent lock for MAAutoAsset %{public}@: %{public}@", buf, 0x16u);
      }
      goto LABEL_56;
    }
    objc_msgSend(v3, "assetSelector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v57, "endAllPreviousLocksOfReasonSync:forClientName:forAssetSelector:", CFSTR("transiently required by Trial"), *MEMORY[0x1E0DC0E50], v12);

    v14 = objc_alloc(MEMORY[0x1E0D4E078]);
    objc_msgSend(v3, "assetSelector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetSelector");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetSpecifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    log = objc_msgSend(v14, "initForAssetType:withAssetSpecifier:", v16, v18);

    objc_msgSend(v57, "eliminatePromotedNeverLockedForSelector:completion:", log, &__block_literal_global_25);
    if (!-[TRIAssetStoreDatabase addReferenceToAutoAssetId:forLifetimeOfPath:](v2, "addReferenceToAutoAssetId:forLifetimeOfPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
    {
      TRILogCategory_Server();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v35 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v35;
        _os_log_error_impl(&dword_1D207F000, v55, OS_LOG_TYPE_ERROR, "Unable to add TRIAssetStoreDatabase reference for auto asset: %{public}@", buf, 0xCu);
      }
      goto LABEL_55;
    }
    if (*(_BYTE *)(a1 + 80))
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v73 = __Block_byref_object_copy__43;
      v74 = __Block_byref_object_dispose__43;
      v75 = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *MEMORY[0x1E0C99A18];
      v71 = *MEMORY[0x1E0C99A18];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_221;
      v63[3] = &unk_1E93336B8;
      v63[4] = buf;
      objc_msgSend(v19, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v56, v21, 1, v63);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v55 = 0;
        while (1)
        {
          v23 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v22, "nextObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v24;
          if (!v24)
          {
            TRILogCategory_Server();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v56, "path");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v67 = 138543618;
              v68 = v32;
              v69 = 2114;
              v70 = v3;
              _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Factor level of File-type points to MAAutoAsset content directory \"%{public}@\" with no regular files: %{public}@", v67, 0x16u);

            }
            v31 = 3;
            goto LABEL_30;
          }
          v61 = 0;
          v62 = 0;
          v26 = objc_msgSend(v24, "getResourceValue:forKey:error:", &v62, v20, &v61);
          v27 = v62;
          v28 = v61;
          if (v26)
          {
            if (!-[NSObject BOOLValue](v27, "BOOLValue"))
            {
              v31 = 2;
              goto LABEL_29;
            }
            objc_msgSend(v25, "path");
            v29 = objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v30 = v55;
              v55 = v29;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 431, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("firstRegularFileURL.path"));

              v30 = v55;
              v55 = 0;
            }
          }
          else
          {
            TRILogCategory_Server();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v67 = 138543362;
              v68 = v28;
              _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "Failed to determine regular file status: %{public}@", v67, 0xCu);
            }
          }

          v31 = 3;
LABEL_29:

LABEL_30:
          objc_autoreleasePoolPop(v23);
          if (v31 == 3)
            goto LABEL_43;
        }
      }
      TRILogCategory_Server();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v52 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v67 = 138543362;
        v68 = v52;
        _os_log_error_impl(&dword_1D207F000, v36, OS_LOG_TYPE_ERROR, "Unable to enumerate URL: %{public}@", v67, 0xCu);
      }

      v55 = 0;
LABEL_43:

      _Block_object_dispose(buf, 8);
    }
    else
    {
      objc_msgSend(v56, "path");
      v55 = objc_claimAutoreleasedReturnValue();
    }
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@\n"), v55);
    objc_msgSend(v37, "dataUsingEncoding:", 4);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = *(_QWORD *)(a1 + 56);
    v60 = 0;
    v40 = objc_msgSend(v38, "writeToFile:options:error:", v39, 0x10000000, &v60);
    v41 = v60;
    v42 = v41;
    if ((v40 & 1) != 0)
      goto LABEL_45;
    objc_msgSend(v41, "domain");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      v50 = objc_msgSend(v42, "code") == 516;

      if (v50)
      {
LABEL_45:
        TRILogCategory_Server();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          v44 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v55;
          _os_log_impl(&dword_1D207F000, v43, OS_LOG_TYPE_DEFAULT, "Created maRefs file at %{public}@ referencing MA asset at %{public}@", buf, 0x16u);
        }

        v45 = *(void **)(a1 + 56);
        v46 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v47 = v45;
        v48 = *(NSObject **)(v46 + 40);
        *(_QWORD *)(v46 + 40) = v47;
LABEL_54:

LABEL_55:
LABEL_56:

LABEL_57:
        goto LABEL_58;
      }
    }
    else
    {

    }
    TRILogCategory_Server();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v51 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v51;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v42;
      _os_log_error_impl(&dword_1D207F000, v48, OS_LOG_TYPE_ERROR, "Failed to create file for MAAutoAsset reference at %@: %{public}@. ", buf, 0x16u);
    }
    goto LABEL_54;
  }
LABEL_58:

}

void __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v5;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Failed to eliminate pre-SU-staged MAAutoAsset %{public}@: %{public}@ ", (uint8_t *)&v7, 0x16u);
    }

  }
}

uint64_t __88__TRIAssetStoreOperator_referenceMAAutoAssetWithId_futurePath_currentPath_isFileFactor___block_invoke_221(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 1;
}

- (BOOL)collectGarbageOlderThanNumScans:(unsigned int)a3 deletedAssetSize:(unint64_t *)a4 ignoreRecentlyCreatedAssets:(BOOL)a5 dryRun:(BOOL)a6 includedCacheDeletableAssetIds:(id)a7 deletedAssetIds:(id *)a8
{
  id v14;
  id v15;
  char v16;
  _QWORD v18[5];
  id v19;
  uint64_t *v20;
  unint64_t *v21;
  id *v22;
  unsigned int v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v14 = a7;
  if (a4)
    *a4 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke;
  v18[3] = &unk_1E93357E0;
  v20 = &v26;
  v21 = a4;
  v18[4] = self;
  v23 = a3;
  v24 = a5;
  v25 = a6;
  v15 = v14;
  v19 = v15;
  v22 = a8;
  -[TRIAssetStoreOperator _acquireLockfileAndRunBlock:](self, "_acquireLockfileAndRunBlock:", v18);
  v16 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v26, 8);
  return v16;
}

void __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v10;
  char v11;
  NSObject *v12;
  void *v13;
  TRIAssetStoreDatabase *v14;
  TRIAssetStoreDatabase *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  char v19;
  int v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_removeDeadSymlinksWithFlockWitness:numRemoved:", a2, &v20);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v5 + 24))
    v6 = v4;
  else
    v6 = 0;
  *(_BYTE *)(v5 + 24) = v6;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assetStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 1024;
    v24 = v20;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Garbage collection for asset store %{public}@ removed %u dead symlinks.", buf, 0x12u);

  }
  v20 = 0;
  v9 = objc_msgSend(*(id *)(a1 + 32), "_removeUnreferencedAssetsWithFlockWitness:olderThanAge:numRemoved:deletedAssetsSize:ignoreRecentlyCreatedAssets:dryRun:includedCacheDeletableAssetIds:deletedAssetIds:", a2, *(unsigned int *)(a1 + 72), &v20, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 76), *(unsigned __int8 *)(a1 + 77), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v10 + 24))
    v11 = v9;
  else
    v11 = 0;
  *(_BYTE *)(v10 + 24) = v11;
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assetStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v13;
    v23 = 1024;
    v24 = v20;
    _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Garbage collection for asset store %{public}@ removed %u assets.", buf, 0x12u);

  }
  v14 = -[TRIAssetStoreDatabase initWithPaths:storageManagement:]([TRIAssetStoreDatabase alloc], "initWithPaths:storageManagement:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v15 = v14;
  if (v14)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_226;
    v18[3] = &__block_descriptor_41_e34_v32__0__TRIFullMAAssetId_8_B16_B24l;
    v18[4] = *(_QWORD *)(a1 + 56);
    v19 = *(_BYTE *)(a1 + 77);
    -[TRIAssetStoreDatabase enumerateAssetIdsWithoutLiveReferencesUsingBlock:](v14, "enumerateAssetIdsWithoutLiveReferencesUsingBlock:", v18);
    if (!*(_BYTE *)(a1 + 77))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_requireAssetStoreTempDir");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeItemAtPath:error:", v17, 0);

    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_226(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  _QWORD v15[4];
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "createAutoAssetWithId:decryptionKey:error:", v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v7, "currentAssetSizeOnDiskUsingStatus:", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (objc_msgSend(v8, "longLongValue") < 1)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v5;
      v20 = 2114;
      v21 = v9;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Failed to get MA asset size for %{public}@ garbage collection: %{public}@", buf, 0x16u);
    }

  }
  else if (*(_QWORD *)(a1 + 32))
  {
    **(_QWORD **)(a1 + 32) += objc_msgSend(v8, "longLongValue");
  }
  v11 = *(unsigned __int8 *)(a1 + 40);
  TRILogCategory_Server();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v19 = v5;
      _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "(Dry-run) Removing MAAutoAsset: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v19 = v7;
      _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Removing MAAutoAsset: %{public}@", buf, 0xCu);
    }

    *a3 = 1;
    objc_msgSend(v7, "assetSelector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_227;
    v15[3] = &unk_1E9331240;
    v16 = v7;
    objc_msgSend(v6, "eliminateAllForSelector:completion:", v14, v15);

    v12 = v16;
  }

}

void __156__TRIAssetStoreOperator_collectGarbageOlderThanNumScans_deletedAssetSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke_227(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TRILogCategory_Server();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v4;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Failed to eliminate MAAutoAsset %{public}@: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1D207F000, v6, OS_LOG_TYPE_DEFAULT, "Eliminated MAAutoAsset: %{public}@", (uint8_t *)&v9, 0xCu);
  }

}

- (BOOL)_incrementUnrefAgeForAssetWithIdentifier:(id)a3 newValue:(unsigned int *)a4 dryRun:(BOOL)a5
{
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  unsigned int v21;
  BOOL v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  char v30;
  NSObject *v31;
  NSObject *v33;
  void *v34;
  SEL v35;
  id v36;
  unint64_t v37;
  id v38;
  uint8_t buf[4];
  NSObject *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pathForAssetDirWithIdentifier:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("unref-age"));
    v13 = objc_claimAutoreleasedReturnValue();

    v38 = 0;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v13, 0, &v38);
    v15 = v38;
    v16 = v15;
    if (v14)
    {
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v14, 4);
      if (v17)
      {
        v18 = v17;
        v35 = a2;
        v19 = v16;
        v37 = -1;
        if (!objc_msgSend(MEMORY[0x1E0DC0AD0], "convertFromString:usingBase:toI64:", v17, 10, &v37)
          || (v20 = v37, HIDWORD(v37)))
        {
          TRILogCategory_Server();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v40 = v18;
            _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Failed to decode unref-age content: \"%{public}@\", buf, 0xCu);
          }

          v22 = 0;
LABEL_32:
          v16 = v19;
          goto LABEL_36;
        }

        v21 = v20 + 1;
        if (v20 == -1)
          v21 = -1;
        v16 = v19;
LABEL_22:
        *a4 = v21;
        if (a5)
        {
          v22 = 1;
LABEL_37:

          goto LABEL_38;
        }
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u\n"), *a4);
        -[NSObject dataUsingEncoding:](v18, "dataUsingEncoding:", 4);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v33 = v16;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v35, self, CFSTR("TRIAssetStoreOperator.m"), 616, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

          v16 = v33;
        }

        v36 = 0;
        v30 = objc_msgSend(v29, "writeToFile:options:error:", v13, 0x10000000, &v36);
        v19 = v36;
        if ((v30 & 1) == 0)
        {
          TRILogCategory_Server();
          v31 = objc_claimAutoreleasedReturnValue();
          v16 = v19;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v40 = v19;
            _os_log_error_impl(&dword_1D207F000, v31, OS_LOG_TYPE_ERROR, "Failed to update content of unref-age: %{public}@", buf, 0xCu);
          }

          v22 = 0;
          v14 = v29;
          goto LABEL_36;
        }
        v22 = 1;
        v14 = v29;
        goto LABEL_32;
      }
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to read non-UTF-8 unref-age.", buf, 2u);
      }
    }
    else
    {
      -[NSObject domain](v15, "domain");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23 == (void *)*MEMORY[0x1E0CB28A8])
      {
        v35 = a2;
        v26 = v16;
        v27 = -[NSObject code](v16, "code");

        v28 = v27 == 260;
        v16 = v26;
        if (v28)
        {
          v21 = 1;
          goto LABEL_22;
        }
      }
      else
      {

      }
      TRILogCategory_Server();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v40 = v16;
        _os_log_error_impl(&dword_1D207F000, v18, OS_LOG_TYPE_ERROR, "Failed to read content of unref-age: %{public}@", buf, 0xCu);
      }
      v14 = 0;
    }
    v22 = 0;
LABEL_36:

    goto LABEL_37;
  }
  TRILogCategory_Server();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
  }
  v22 = 0;
LABEL_38:

  return v22;
}

- (BOOL)_clearUnrefAgeForAssetWithIdentifier:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  int *v13;
  char *v14;
  int v15;
  int v16;
  char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", (uint8_t *)&v16, 2u);
    }
    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "pathForAssetDirWithIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("unref-age"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v8);
  if (unlink((const char *)-[NSObject fileSystemRepresentation](v9, "fileSystemRepresentation")) && *__error() != 2)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = __error();
      v14 = strerror(*v13);
      v15 = *__error();
      v16 = 136315394;
      v17 = v14;
      v18 = 1024;
      v19 = v15;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Failed to unlink() unref-age: %s (%d)", (uint8_t *)&v16, 0x12u);
    }

LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (id)_collectDeadSymlinks
{
  void *v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  uint8_t *v12;
  SEL v13;
  _QWORD v14[3];
  char v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = (void *)MEMORY[0x1D8232A5C]();
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  if (WeakRetained)
  {
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__43;
    v20 = __Block_byref_object_dispose__43;
    v21 = (id)objc_opt_new();
    if (*((_QWORD *)v17 + 5))
    {
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2020000000;
      v15 = 0;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __45__TRIAssetStoreOperator__collectDeadSymlinks__block_invoke;
      v9[3] = &unk_1E9335808;
      v13 = a2;
      v9[4] = self;
      v11 = v14;
      v10 = WeakRetained;
      v12 = buf;
      objc_msgSend(v10, "enumerateAssetDirsUsingBlock:", v9);
      v6 = *((id *)v17 + 5);

      _Block_object_dispose(v14, 8);
    }
    else
    {
      v6 = 0;
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }

    v6 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v6;
}

void __45__TRIAssetStoreOperator__collectDeadSymlinks__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 673, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", CFSTR("refs"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 677, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("refsURL.path"));

  }
  if ((objc_msgSend(v8, "fileExistsAtPath:", v9) & 1) != 0)
  {

    goto LABEL_13;
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "_hardLinkCountForAssetWithIdentifier:", v6);

  if (v10 >= 2)
  {
    v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543362;
        v28 = v6;
LABEL_26:
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Asset %{public}@ has other hard link references but no refs folder", buf, 0xCu);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138543362;
      v28 = v6;
      goto LABEL_26;
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v15, "nextObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    do
    {
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("link-"));

      if (v20)
      {
        objc_msgSend(v18, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v21)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 696, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("symlinkPath"));

        }
        if ((objc_msgSend(*(id *)(a1 + 40), "isValidTargetForSymlink:assetIdentifier:", v21, v6) & 1) == 0
          && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addString:", v21) & 1) == 0)
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v24 = *(void **)(v23 + 40);
          *(_QWORD *)(v23 + 40) = 0;

          *a3 = 1;
          break;
        }

      }
      objc_autoreleasePoolPop(v16);
      v16 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v15, "nextObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v18);
  }
  objc_autoreleasePoolPop(v16);

}

- (unsigned)_hardLinkCountForAssetWithIdentifier:(id)a3
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  unsigned __int16 v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  char v16;
  uint8_t buf[16];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreOperator.m"), 714, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "pathForAssetContentWithIdentifier:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, &v16);

    v11 = 0;
    if (v10)
    {
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "triArbitraryFileInDirWithPath:", v8);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = v8;
      }
      v13 = v12;
      if (v12)
        v11 = -[TRIAssetStoreOperator _hardLinkCountForFileWithPath:](self, "_hardLinkCountForFileWithPath:", v12);
      else
        v11 = 0;

    }
  }
  else
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

- (unsigned)_hardLinkCountForFileWithPath:(id)a3
{
  id v3;
  NSObject *v4;
  nlink_t st_nlink;
  int *v7;
  char *v8;
  int v9;
  stat v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(&v10, 0, sizeof(v10));
  v3 = objc_retainAutorelease(a3);
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v10))
  {
    TRILogCategory_Server();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = __error();
      v8 = strerror(*v7);
      v9 = *__error();
      *(_DWORD *)buf = 138543874;
      v12 = v3;
      v13 = 2080;
      v14 = v8;
      v15 = 1024;
      v16 = v9;
      _os_log_error_impl(&dword_1D207F000, v4, OS_LOG_TYPE_ERROR, "Failed to stat file at path %{public}@ to find hard link count: %s (%d)", buf, 0x1Cu);
    }

    st_nlink = 0;
  }
  else
  {
    st_nlink = v10.st_nlink;
  }

  return st_nlink;
}

- (BOOL)_removeDeadSymlinksWithFlockWitness:(TRIFlockWitness_ *)a3 numRemoved:(unsigned int *)a4
{
  void *v6;
  BOOL v7;

  -[TRIAssetStoreOperator _collectDeadSymlinks](self, "_collectDeadSymlinks", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[TRIAssetStoreOperator _removePaths:numRemoved:](self, "_removePaths:numRemoved:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (id)_collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds:(id)a3 ignoreRecentlyCreatedAssets:(BOOL)a4
{
  id v7;
  void *v8;
  id WeakRetained;
  id v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint8_t *v15;
  SEL v16;
  BOOL v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v8 = (void *)MEMORY[0x1D8232A5C]();
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  if (WeakRetained)
  {
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__43;
    v22 = __Block_byref_object_dispose__43;
    v23 = (id)objc_opt_new();
    if (*((_QWORD *)v19 + 5))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __121__TRIAssetStoreOperator__collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds_ignoreRecentlyCreatedAssets___block_invoke;
      v13[3] = &unk_1E9335830;
      v16 = a2;
      v13[4] = self;
      v17 = a4;
      v14 = v7;
      v15 = buf;
      objc_msgSend(WeakRetained, "enumerateAssetDirsUsingBlock:", v13);
      v10 = *((id *)v19 + 5);

    }
    else
    {
      v10 = 0;
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }

    v10 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v10;
}

void __121__TRIAssetStoreOperator__collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds_ignoreRecentlyCreatedAssets___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "lastPathComponent");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 782, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  }
  v34 = v4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", CFSTR("refs"), v4);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)v5;
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  while (1)
  {
    v9 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v7, "nextObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      break;
    v11 = v10;
    if (!*(_QWORD *)(a1 + 40))
    {

      objc_autoreleasePoolPop(v9);
      v20 = v33;
      v19 = v34;
      goto LABEL_26;
    }
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 802, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("refPath"));

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "triTargetPathForSymlink:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v35);
      v14 = v7;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "containsObject:", v13);
      v17 = v16 ^ 1;

      v7 = v14;
    }
    else
    {
      v17 = 0;
      v16 = 1;
    }
    v8 |= v17;

    objc_autoreleasePoolPop(v9);
    if ((v16 & 1) == 0)
      goto LABEL_14;
  }
  objc_autoreleasePoolPop(v9);
LABEL_14:
  v20 = v33;
  v19 = v34;
  if ((v8 & 1) != 0)
    goto LABEL_26;
  if (!*(_BYTE *)(a1 + 64))
    goto LABEL_23;
  v21 = *(void **)(a1 + 32);
  objc_msgSend(v34, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = v7;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 818, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("assetIdentifierURL.path"));

    v7 = v30;
  }
  objc_msgSend(v21, "_creationDateForAsset:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23 || (objc_msgSend(v23, "timeIntervalSinceNow"), fabs(v24) >= 600.0))
  {
    TRILogCategory_Server();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v37 = v34;
      v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_INFO, "Including asset directory %{public}@ for GC (created %@)", buf, 0x16u);
    }

LABEL_23:
    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addString:", v35) & 1) == 0)
    {
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = 0;

      *a3 = 1;
    }
    goto LABEL_26;
  }
  TRILogCategory_Server();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v37 = v34;
    v38 = 2112;
    v39 = v23;
    _os_log_impl(&dword_1D207F000, v28, OS_LOG_TYPE_INFO, "Not including asset directory %{public}@ for GC because it's too new (created %@)", buf, 0x16u);
  }

LABEL_26:
}

- (id)_creationDateForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;

  if (!v5)
  {
    TRILogCategory_Server();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v14 = v3;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Couldn't read file attributes for %{public}@: %{public}@", buf, 0x16u);
    }
    goto LABEL_9;
  }
  objc_msgSend(v5, "fileCreationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v5;
      v15 = 2114;
      v16 = v3;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Couldn't get creation date from file attributes %@ for %{public}@", buf, 0x16u);
    }

    v8 = 0;
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v8 = v7;
  v9 = v8;
LABEL_10:

  return v9;
}

- (BOOL)_removeUnreferencedAssetsWithFlockWitness:(TRIFlockWitness_ *)a3 olderThanAge:(unsigned int)a4 numRemoved:(unsigned int *)a5 deletedAssetsSize:(unint64_t *)a6 ignoreRecentlyCreatedAssets:(BOOL)a7 dryRun:(BOOL)a8 includedCacheDeletableAssetIds:(id)a9 deletedAssetIds:(id *)a10
{
  _BOOL8 v11;
  id v17;
  void *v18;
  void *v19;
  BOOL v20;
  _QWORD v22[10];
  unsigned int v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v11 = a7;
  v17 = a9;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  -[TRIAssetStoreOperator _collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds:ignoreRecentlyCreatedAssets:](self, "_collectUnreferencedAssetsIncludingLinkTargetsForReferencedAssetIds:ignoreRecentlyCreatedAssets:", v17, v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 1;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __191__TRIAssetStoreOperator__removeUnreferencedAssetsWithFlockWitness_olderThanAge_numRemoved_deletedAssetsSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke;
    v22[3] = &unk_1E9335858;
    v22[4] = self;
    v22[5] = &v25;
    v24 = a8;
    v23 = a4;
    v22[6] = a3;
    v22[7] = a5;
    v22[8] = a6;
    v22[9] = a10;
    if (objc_msgSend(v18, "enumerateStringsWithBlock:", v22))
      v20 = *((_BYTE *)v26 + 24) != 0;
    else
      v20 = 0;
    _Block_object_dispose(&v25, 8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __191__TRIAssetStoreOperator__removeUnreferencedAssetsWithFlockWitness_olderThanAge_numRemoved_deletedAssetsSize_ignoreRecentlyCreatedAssets_dryRun_includedCacheDeletableAssetIds_deletedAssetIds___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  _DWORD *v4;
  _QWORD *v5;
  id *v6;
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  id *v12;
  int v13;
  _BYTE buf[12];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  TRIValidateAssetId();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    goto LABEL_14;
  v13 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "_incrementUnrefAgeForAssetWithIdentifier:newValue:dryRun:", v2, &v13, *(unsigned __int8 *)(a1 + 84)))
  {
    v3 = v13;
  }
  else
  {
    v3 = -1;
    v13 = -1;
  }
  if (v3 > *(_DWORD *)(a1 + 80))
  {
    *(_QWORD *)buf = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "_removeAssetWithIdentifier:flockWitness:deletedAssetSize:dryRun:", v2, *(_QWORD *)(a1 + 48), buf, *(unsigned __int8 *)(a1 + 84)))
    {
      v4 = *(_DWORD **)(a1 + 56);
      if (v4)
        ++*v4;
      v5 = *(_QWORD **)(a1 + 64);
      if (v5)
        *v5 += *(_QWORD *)buf;
      v6 = *(id **)(a1 + 72);
      if (v6)
      {
        if (*v6)
        {
          v7 = *v6;
          v8 = *v6;
          *v6 = v7;
        }
        else
        {
          v11 = objc_opt_new();
          v12 = *(id **)(a1 + 72);
          v8 = *v12;
          *v12 = (id)v11;
        }

        objc_msgSend(**(id **)(a1 + 72), "addObject:", v2);
      }
      goto LABEL_20;
    }
LABEL_14:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_20;
  }
  TRILogCategory_Server();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_DWORD *)(a1 + 80) + 1;
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v2;
    v15 = 1024;
    v16 = v13;
    v17 = 1024;
    v18 = v10;
    _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "Asset %{public}@ has been unreferenced for %u sequential scans, has not yet reached threshold of %u.", buf, 0x18u);
  }

LABEL_20:
}

- (BOOL)_removePaths:(id)a3 numRemoved:(unsigned int *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  v6 = v5;
  if (a4)
    *a4 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__TRIAssetStoreOperator__removePaths_numRemoved___block_invoke;
  v9[3] = &unk_1E9335398;
  v9[4] = &v10;
  v9[5] = a4;
  if (objc_msgSend(v5, "enumerateStringsWithBlock:", v9))
    v7 = *((_BYTE *)v11 + 24) != 0;
  else
    v7 = 0;
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __49__TRIAssetStoreOperator__removePaths_numRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _DWORD *v6;
  int *v7;
  char *v8;
  int v9;
  int v10;
  id v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_retainAutorelease(v3);
    if (unlink((const char *)objc_msgSend(v4, "fileSystemRepresentation")))
    {
      TRILogCategory_Server();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = __error();
        v8 = strerror(*v7);
        v9 = *__error();
        v10 = 138543874;
        v11 = v4;
        v12 = 2080;
        v13 = v8;
        v14 = 1024;
        v15 = v9;
        _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Failed to unlink %{public}@: %s (%d)", (uint8_t *)&v10, 0x1Cu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
    else
    {
      v6 = *(_DWORD **)(a1 + 40);
      if (v6)
        ++*v6;
    }
  }

}

- (BOOL)migrateToGlobalAssetStoreFromLocalAssetStore:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__TRIAssetStoreOperator_migrateToGlobalAssetStoreFromLocalAssetStore___block_invoke;
  v7[3] = &unk_1E9335730;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[TRIAssetStoreOperator _acquireLockfileInAssetStorePath:andRunBlock:](self, "_acquireLockfileInAssetStorePath:andRunBlock:", v5, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __70__TRIAssetStoreOperator_migrateToGlobalAssetStoreFromLocalAssetStore___block_invoke(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = objc_msgSend(*(id *)(a1 + 32), "_migrateAssetsDatabaseWithLocalAssetStorePath:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v5 + 24))
    v6 = v4;
  else
    v6 = 0;
  *(_BYTE *)(v5 + 24) = v6;
  v7 = objc_msgSend(*(id *)(a1 + 32), "_migrateAssetContentsWithLocalAssetStorePath:flockWitness:", *(_QWORD *)(a1 + 40), a2);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = v7;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Successfully migrated assets to the global asset store", v11, 2u);
    }

  }
}

- (BOOL)_migrateAssetsDatabaseWithLocalAssetStorePath:(id)a3
{
  id v4;
  TRIAssetStoreDatabase *v5;
  TRIAssetStoreDatabase *v6;
  TRIAssetStoreDatabase *v7;
  _QWORD v9[4];
  TRIAssetStoreDatabase *v10;

  v4 = a3;
  v5 = -[TRIAssetStoreDatabase initWithPaths:assetStorePath:storageManagement:]([TRIAssetStoreDatabase alloc], "initWithPaths:assetStorePath:storageManagement:", self->_paths, v4, 0);

  v6 = -[TRIAssetStoreDatabase initWithPaths:storageManagement:]([TRIAssetStoreDatabase alloc], "initWithPaths:storageManagement:", self->_paths, self->_storageManagement);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__TRIAssetStoreOperator__migrateAssetsDatabaseWithLocalAssetStorePath___block_invoke;
  v9[3] = &unk_1E9335880;
  v10 = v6;
  v7 = v6;
  LOBYTE(v4) = -[TRIAssetStoreDatabase enumerateAllAutoAssetReferencesWithBlock:](v5, "enumerateAllAutoAssetReferencesWithBlock:", v9);
  -[TRIAssetStoreDatabase closePermanently](v5, "closePermanently");
  -[TRIAssetStoreDatabase closePermanently](v7, "closePermanently");

  return (char)v4;
}

uint64_t __71__TRIAssetStoreOperator__migrateAssetsDatabaseWithLocalAssetStorePath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addReferenceToAutoAssetId:forLifetimeOfPath:", a2, a3);
}

- (BOOL)_migrateAssetContentsWithLocalAssetStorePath:(id)a3 flockWitness:(TRIFlockWitness_ *)a4
{
  void *v5;
  void *v6;
  char v7;
  TRIAssetStore *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  TRIAssetStore *v18;
  char v19;
  char v20;
  int v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  NSObject *v29;
  void *v30;
  int v31;
  int v32;
  NSObject *v33;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  NSObject *v41;
  id v42;
  TRIAssetStore *v43;
  TRIAssetStoreOperator *v44;
  uint64_t *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 1;
  -[TRIPaths assetStore](self->_paths, "assetStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("assets"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "stringByAppendingPathComponent:", CFSTR("assets"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v39);

  if ((v7 & 1) != 0)
  {
    v8 = -[TRIAssetStore initWithGlobalPaths:]([TRIAssetStore alloc], "initWithGlobalPaths:", self->_paths);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, 0, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    do
    {
      v12 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v11, "nextObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v14, "path");
          v16 = objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(MEMORY[0x1E0DC0A98], "arrayFromDirectory:", v16);
            v17 = objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              v40[0] = MEMORY[0x1E0C809B0];
              v40[1] = 3221225472;
              v40[2] = __83__TRIAssetStoreOperator__migrateAssetContentsWithLocalAssetStorePath_flockWitness___block_invoke;
              v40[3] = &unk_1E93358A8;
              v41 = v39;
              v42 = v15;
              v18 = v8;
              v44 = self;
              v45 = &v48;
              v43 = v18;
              v19 = -[NSObject enumerateStringsWithBlock:](v17, "enumerateStringsWithBlock:", v40);
              if (*((_BYTE *)v49 + 24))
                v20 = v19;
              else
                v20 = 0;
              *((_BYTE *)v49 + 24) = v20;

              v21 = 0;
              v22 = v41;
            }
            else
            {
              TRILogCategory_Server();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v53 = v15;
                _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Couldn't locate asset folders for short hash: %@", buf, 0xCu);
              }
              v21 = 3;
            }

          }
          else
          {
            TRILogCategory_Server();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v53 = v14;
              _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Local asset url and hash is non-nil but the path is nil: %{public}@", buf, 0xCu);
            }
            v21 = 3;
          }

        }
        else
        {
          TRILogCategory_Server();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "path");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v53 = v23;
            _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Invalid short hash found in local asset store url: %{public}@", buf, 0xCu);

          }
          v21 = 3;
        }

      }
      else
      {
        v21 = 2;
      }

      objc_autoreleasePoolPop(v12);
    }
    while (v21 != 2);
    v32 = *((unsigned __int8 *)v49 + 24);

  }
  else
  {
    TRILogCategory_Server();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v39;
      _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_INFO, "No global assets folder exists at %@. Copying the entirety of the local assets folder.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringByDeletingLastPathComponent");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v27 = objc_msgSend(v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 1, 0, &v47);
    v28 = v47;

    if ((v27 & 1) == 0)
    {
      TRILogCategory_Server();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v28, "localizedDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v53 = v39;
        v54 = 2112;
        v55 = v35;
        _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Failed to create global assets folder: %{public}@ with error:%@", buf, 0x16u);

      }
      *((_BYTE *)v49 + 24) = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v28;
    v31 = objc_msgSend(v30, "moveItemAtPath:toPath:error:", v38, v39, &v46);
    v8 = (TRIAssetStore *)v46;

    if (v31)
    {
      v32 = *((unsigned __int8 *)v49 + 24);
    }
    else
    {
      TRILogCategory_Server();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        -[TRIAssetStore localizedDescription](v8, "localizedDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v38;
        v54 = 2114;
        v55 = v39;
        v56 = 2112;
        v57 = v36;
        _os_log_error_impl(&dword_1D207F000, v33, OS_LOG_TYPE_ERROR, "Failed to move local assets folder to the global assets folder: %{public}@ to %{public}@ with error:%@", buf, 0x20u);

      }
      v32 = 0;
      *((_BYTE *)v49 + 24) = 0;
    }
  }

  _Block_object_dispose(&v48, 8);
  return v32 != 0;
}

void __83__TRIAssetStoreOperator__migrateAssetContentsWithLocalAssetStorePath_flockWitness___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  char v12;
  uint64_t v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  NSObject *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  -[NSObject lastPathComponent](v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TRIValidateAssetId();
  v5 = objc_claimAutoreleasedReturnValue();

  if (v5 && -[NSObject length](v5, "length"))
  {
    v6 = (void *)MEMORY[0x1D8232A5C]();
    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@/%@/"), *(_QWORD *)(a1 + 40), v5);
    objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v6);
    LODWORD(v8) = objc_msgSend(*(id *)(a1 + 48), "hasAssetWithIdentifier:type:", v5, 0);
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        v23 = v5;
        _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Asset already present in the global asset store. Updating references - AssetId: %{public}@", buf, 0xCu);
      }

      v12 = objc_msgSend(*(id *)(a1 + 56), "_relinkLocalAssetToGlobalAssetStore:withAssetId:localAssetDir:", *(_QWORD *)(a1 + 48), v5, v3);
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      if (*(_BYTE *)(v13 + 24))
        v14 = v12;
      else
        v14 = 0;
      *(_BYTE *)(v13 + 24) = v14;
    }
    else
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543362;
        v23 = v5;
        _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "Asset not present in the global asset store. Migrating asset to the global store - AssetId: %{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByDeletingLastPathComponent](v9, "stringByDeletingLastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v17 = objc_msgSend(v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v21);
      v18 = v21;

      if ((v17 & 1) == 0)
      {
        TRILogCategory_Server();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v18, "localizedDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v23 = v9;
          v24 = 2112;
          v25 = v20;
          _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Failed to create asset directory in global asset store: %{public}@ with error:%@", buf, 0x16u);

        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      }
      if ((objc_msgSend(MEMORY[0x1E0CB3620], "triForceRenameWithSourcePath:destPath:", v3, v9) & 1) == 0)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;

    }
  }
  else
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v3;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Invalid asset Id in local asset store: %{public}@", buf, 0xCu);
    }
  }

}

- (BOOL)_relinkLocalAssetToGlobalAssetStore:(id)a3 withAssetId:(id)a4 localAssetDir:(id)a5
{
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  const __CFString *v24;
  SEL v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v9 = a4;
  v29 = a5;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", CFSTR("refs"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 1;
  v27 = (void *)v10;
  objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v10, 0, 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v13, "nextObject");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v26 = a2;
    v12 = 1;
    do
    {
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "hasPrefix:", CFSTR("link-"));

      if (v18)
      {
        objc_msgSend(v16, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", v26, self, CFSTR("TRIAssetStoreOperator.m"), 1112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("symlinkPath"));

        }
        objc_msgSend(MEMORY[0x1E0CB3620], "triTargetPathForSymlink:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20 || (objc_msgSend(v30, "linkAssetWithIdentifier:toPath:", v9, v20) & 1) == 0)
        {
          TRILogCategory_Server();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v20;
            _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Failed to link from the global asset store to local treatment asset: %{public}@", buf, 0xCu);
          }

          v12 = 0;
        }

      }
      objc_autoreleasePoolPop(v14);
      v14 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v13, "nextObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v16);
  }
  objc_autoreleasePoolPop(v14);
  TRILogCategory_Server();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = CFSTR("failed");
    if ((v12 & 1) != 0)
      v24 = CFSTR("completed successfully");
    *(_DWORD *)buf = 138543618;
    v32 = v9;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_INFO, "Re-linking references to asset id %{public}@ to the global directory %@.", buf, 0x16u);
  }

  return v12 & 1;
}

- (BOOL)_acquireLockfileAndRunBlock:(id)a3
{
  TRIAssetStoreOperator *v3;
  TRIPaths *paths;
  id v5;
  void *v6;

  v3 = self;
  paths = self->_paths;
  v5 = a3;
  -[TRIPaths assetStore](paths, "assetStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[TRIAssetStoreOperator _acquireLockfileInAssetStorePath:andRunBlock:](v3, "_acquireLockfileInAssetStorePath:andRunBlock:", v6, v5);

  return (char)v3;
}

- (BOOL)_acquireLockfileInAssetStorePath:(id)a3 andRunBlock:(id)a4
{
  id v5;
  void (**v6)(id, uint8_t *);
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  int v14;
  NSObject *v15;
  char v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  int *v21;
  char *v22;
  int v23;
  int *v24;
  char *v25;
  int v26;
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
  v5 = a3;
  v6 = (void (**)(id, uint8_t *))a4;
  v7 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v30);
  v10 = v30;

  if ((v9 & 1) == 0)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v10;
      _os_log_error_impl(&dword_1D207F000, v11, OS_LOG_TYPE_ERROR, "Failed to create AssetStore: %{public}@", buf, 0xCu);
    }

  }
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("lock"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = open((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 514, 432);
  v14 = v13;
  if (v13 < 0)
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v24 = __error();
      v25 = strerror(*v24);
      v26 = *__error();
      *(_DWORD *)buf = 138543874;
      v32 = v12;
      v33 = 2080;
      v34 = v25;
      v35 = 1024;
      v36 = v26;
      _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Failed to open lockfile %{public}@: %s (%d)", buf, 0x1Cu);
    }

    v16 = 0;
  }
  else
  {
    if (flock(v13, 2))
    {
      TRILogCategory_Server();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v21 = __error();
        v22 = strerror(*v21);
        v23 = *__error();
        *(_DWORD *)buf = 138543874;
        v32 = v12;
        v33 = 2080;
        v34 = v22;
        v35 = 1024;
        v36 = v23;
        _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Failed to acquire lockfile %{public}@: %s (%d)", buf, 0x1Cu);
      }

      v16 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1D8232A5C]();
      *(_DWORD *)buf = v14;
      v6[2](v6, buf);
      objc_autoreleasePoolPop(v18);
      if (flock(v14, 8))
      {
        TRILogCategory_Server();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v27 = __error();
          v28 = strerror(*v27);
          v29 = *__error();
          *(_DWORD *)buf = 138543874;
          v32 = v12;
          v33 = 2080;
          v34 = v28;
          v35 = 1024;
          v36 = v29;
          _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "Failed to unlock lockfile %{public}@: %s (%d)", buf, 0x1Cu);
        }

      }
      v16 = 1;
    }
    close(v14);
  }

  objc_autoreleasePoolPop(v7);
  return v16 & 1;
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
  -[TRIPaths assetStore](self->_paths, "assetStore");
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

- (BOOL)_fixFileProtectionForFileURL:(id)a3
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  uint32_t v15;
  id v16;
  id v17;
  int *v18;
  char *v19;
  int v20;
  void *v22;
  void *v23;
  const char *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  stat v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27 = 0;
  v6 = *MEMORY[0x1E0C999D0];
  v26 = 0;
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v27, v6, &v26);
  v8 = v27;
  v9 = v26;
  if (!v7)
  {
    TRILogCategory_Server();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v34.st_dev = 138543618;
      *(_QWORD *)&v34.st_mode = v5;
      WORD2(v34.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&v34.st_ino + 6) = (__darwin_ino64_t)v9;
      v12 = "Failed to determine if url %{public}@ is a directory: %{public}@";
      v13 = (uint8_t *)&v34;
      v14 = v11;
      v15 = 22;
LABEL_12:
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, v12, v13, v15);
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    memset(&v34, 0, sizeof(v34));
    v16 = objc_retainAutorelease(v5);
    if (stat((const char *)objc_msgSend(v16, "fileSystemRepresentation"), &v34))
    {
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v16;
        v12 = "Could not stat: %{public}@";
        v13 = buf;
        v14 = v11;
        v15 = 12;
        goto LABEL_12;
      }
    }
    else
    {
      v17 = objc_retainAutorelease(v16);
      if (!chmod((const char *)objc_msgSend(v17, "fileSystemRepresentation"), 0x1F8u))
      {
        v22 = (void *)MEMORY[0x1E0CB3620];
        objc_msgSend(v17, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIAssetStoreOperator.m"), 1230, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("fileURL.path"));

        }
        objc_msgSend(v22, "triRemoveFileProtectionIfPresentForPath:", v23);

        v24 = (const char *)objc_msgSend(objc_retainAutorelease(v17), "fileSystemRepresentation");
        chmod(v24, v34.st_mode & 0x124);
        goto LABEL_3;
      }
      TRILogCategory_Server();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = __error();
        v19 = strerror(*v18);
        v20 = *__error();
        *(_DWORD *)buf = 138543874;
        v29 = v17;
        v30 = 2080;
        v31 = v19;
        v32 = 1024;
        v33 = v20;
        v12 = "Failed to adjust permissions on temp dir: %{public}@ %s (%d)";
        v13 = buf;
        v14 = v11;
        v15 = 28;
        goto LABEL_12;
      }
    }
    goto LABEL_13;
  }
LABEL_3:
  v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)fixFileProtectionForAssetStoreFiles
{
  id WeakRetained;
  void *v5;
  BOOL v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  TRIAssetStoreOperator *v11;
  uint8_t *v12;
  SEL v13;
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    *(_QWORD *)buf = 0;
    v15 = buf;
    v16 = 0x2020000000;
    v17 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke;
    v9[3] = &unk_1E9335370;
    v10 = WeakRetained;
    v11 = self;
    v12 = buf;
    v13 = a2;
    -[TRIAssetStoreOperator _acquireLockfileAndRunBlock:](self, "_acquireLockfileAndRunBlock:", v9);
    v6 = v15[24] != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Asset store unexpectedly released from asset store operator.", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

uint64_t __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_2;
  v3[3] = &unk_1E93358D0;
  v5 = *(_QWORD *)(a1 + 56);
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumerateAssetDirsUsingBlock:", v3);
}

void __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  char v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  char v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 1257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIdentifier"));

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:relativeToURL:", CFSTR("content"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("TRIAssetStoreOperator.m"), 1261, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("contentURL.path"));

  }
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, &v24);

  if ((v8 & 1) != 0)
  {
    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = *MEMORY[0x1E0C999D0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_3;
      v23[3] = &unk_1E93336B8;
      v23[4] = *(_QWORD *)(a1 + 40);
      objc_msgSend(v9, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v10, 0, v23);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1D8232A5C]();
      objc_msgSend(v11, "nextObject");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = (void *)v13;
        do
        {
          v15 = objc_msgSend(*(id *)(a1 + 32), "_fixFileProtectionForFileURL:", v14);
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          if (*(_BYTE *)(v16 + 24))
            v17 = v15;
          else
            v17 = 0;
          *(_BYTE *)(v16 + 24) = v17;

          objc_autoreleasePoolPop(v12);
          v12 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v11, "nextObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        while (v14);
      }
      objc_autoreleasePoolPop(v12);

    }
    else
    {
      v18 = objc_msgSend(*(id *)(a1 + 32), "_fixFileProtectionForFileURL:", v5);
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v19 + 24))
        v20 = v18;
      else
        v20 = 0;
      *(_BYTE *)(v19 + 24) = v20;
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

uint64_t __60__TRIAssetStoreOperator_fixFileProtectionForAssetStoreFiles__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Encountered error while enumerating over assets to fix file protection for %{public}@: %@", (uint8_t *)&v9, 0x16u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return 1;
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
    -[TRIAssetStoreOperator _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v17, v14);
    v10 = 1;
    goto LABEL_19;
  }
  if (*__error() == 17 || *__error() == 66 || *__error() == 21 || *__error() == 20)
  {
    v10 = -[TRIAssetStoreOperator _nonAtomicOverwriteWithSrc:dest:finalPermissionBits:](self, "_nonAtomicOverwriteWithSrc:dest:finalPermissionBits:", v15, v17, v14);
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

  -[TRIAssetStoreOperator _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v15, v14);
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
  -[TRIAssetStoreOperator _requireAssetStoreTempDir](self, "_requireAssetStoreTempDir");
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
    -[TRIAssetStoreOperator _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v8, a5);
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
      -[TRIAssetStoreOperator _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v27, a5);
      -[TRIAssetStoreOperator _forceRemoveItemAtPath:](self, "_forceRemoveItemAtPath:", v16);
      v35 = 1;
      goto LABEL_7;
    }
    v31 = (const std::__fs::filesystem::path *)objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation");
    v32 = objc_retainAutorelease(v27);
    v33 = (const std::__fs::filesystem::path *)objc_msgSend(v32, "fileSystemRepresentation");
    rename(v31, v33, v34);
    -[TRIAssetStoreOperator _fixupPermissionsOnPath:permissionBits:](self, "_fixupPermissionsOnPath:permissionBits:", v25, a5);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_storageManagement, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
