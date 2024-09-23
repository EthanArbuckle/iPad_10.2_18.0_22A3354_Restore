@implementation PLAssetsdCrashRecoverySupport

- (PLAssetsdCrashRecoverySupport)initWithPathManager:(id)a3
{
  id v6;
  PLAssetsdCrashRecoverySupport *v7;
  PLAssetsdCrashRecoverySupport *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  if ((PLIsAssetsd() & 1) != 0)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCrashRecoverySupport.m"), 32, CFSTR("Must only be used in assetsd"));

    if (v6)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCrashRecoverySupport.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

LABEL_3:
  v12.receiver = self;
  v12.super_class = (Class)PLAssetsdCrashRecoverySupport;
  v7 = -[PLAssetsdCrashRecoverySupport init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pathManager, a3);
    v8->_recoveryIndicatorCheckLock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)recoverFromCrashIfNeededWithImageWriter:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCrashRecoverySupport.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageWriter"));

  }
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdCrashRecoverySupport.m"), 44, CFSTR("recoverFromCrashIfNeededWithImageWriter can only be called from assetsd"));

  }
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openBundleAtLibraryURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "indicatorFileCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73148], "incomingDirectoryPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__23121;
  v38 = __Block_byref_object_dispose__23122;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__23121;
  v32 = __Block_byref_object_dispose__23122;
  v33 = 0;
  PLAssetImportGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v49 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] checking for crash recovery files", buf, 0xCu);

  }
  v13 = v9;
  v14 = v10;
  PLSafeRunWithUnfairLock();
  if (*((_BYTE *)v45 + 24))
  {
    if (*((_BYTE *)v41 + 24))
    {
      PLAssetImportGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v29[5];
        *(_DWORD *)buf = 138543618;
        v49 = v16;
        v50 = 2114;
        v51 = v17;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing delayed recovery job requested at %{public}@", buf, 0x16u);

      }
      dispatch_time(0, 2000000000);
      +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sharedUtilityQueue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v5;
      pl_dispatch_after();

    }
    else
    {
      PLAssetImportGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v29[5];
        *(_DWORD *)buf = 138543618;
        v49 = v23;
        v50 = 2114;
        v51 = v24;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] enqueing recovery job requested at %{public}@", buf, 0x16u);

      }
      -[PLAssetsdCrashRecoverySupport _enqeueRecoveryJob:date:toImageWriter:](self, "_enqeueRecoveryJob:date:toImageWriter:", v35[5], v29[5], v5);
    }
  }
  else
  {
    PLAssetImportGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] no indicator or incoming files found", buf, 0xCu);

    }
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

}

- (BOOL)isSafeToRecoverAfterCrash
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  int v11;
  int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73138], "takingVideoIndicatorFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v2;
  objc_msgSend(MEMORY[0x1E0D73138], "takingPhotoIndicatorFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation", (_QWORD)v15), 36);
        v12 = v11;
        if (v11 < 0)
        {
          if (v11 == -1 && *__error() == 35)
          {
            v13 = 0;
            goto LABEL_14;
          }
        }
        else
        {
          flock(v11, 8);
          close(v12);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_14:

  return v13;
}

- (void)_enqeueRecoveryJob:(id)a3 date:(id)a4 toImageWriter:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    PLAssetImportGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v12;
      v34 = 1024;
      LODWORD(v35) = objc_msgSend(v8, "count");
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] passed %d incoming files", (uint8_t *)&v32, 0x12u);

    }
    v13 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73148], "incomingDirectoryPath");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v11, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PLAssetImportGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138543618;
      v33 = v16;
      v34 = 1024;
      LODWORD(v35) = objc_msgSend(v13, "count");
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] found %d incoming files", (uint8_t *)&v32, 0x12u);

    }
  }

  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0D74DE0];
    objc_msgSend(v17, "setObject:forKey:", *MEMORY[0x1E0D74DE0], *MEMORY[0x1E0D74DB8]);
    objc_msgSend(v17, "setObject:forKey:", v13, CFSTR("CrashRecoveryFilenamesKey"));
    objc_msgSend(v17, "setObject:forKey:", v9, CFSTR("CrashRecoveryJobCreationDateKey"));
    PLAssetImportGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v20 = v9;
      v21 = a2;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412802;
      v33 = v22;
      v34 = 2112;
      v35 = v18;
      v36 = 2112;
      v37 = v13;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "[%@] enqueing existing files recovery job %@ (%@)", (uint8_t *)&v32, 0x20u);

      a2 = v21;
      v9 = v20;
    }

    objc_msgSend(v10, "enqueueJob:", v17);
  }
  objc_msgSend(MEMORY[0x1E0D73148], "incomingDirectoryPathForPhotoStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v23, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "count"))
  {
    v26 = v9;
    v27 = a2;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0D74DE0];
    objc_msgSend(v28, "setObject:forKey:", *MEMORY[0x1E0D74DE0], *MEMORY[0x1E0D74DB8]);
    objc_msgSend(v28, "setObject:forKey:", v25, CFSTR("CrashRecoveryPhotoStreamFilenamesKey"));
    PLAssetImportGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412802;
      v33 = v31;
      v34 = 2112;
      v35 = v29;
      v36 = 2112;
      v37 = v25;
      _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEFAULT, "[%@] enqueing photostream recovery job %@ (%@)", (uint8_t *)&v32, 0x20u);

    }
    objc_msgSend(v10, "enqueueJob:", v28);

    v9 = v26;
  }

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recoveryJobCreationDate);
  objc_storeStrong((id *)&self->_pathManager, 0);
}

void __73__PLAssetsdCrashRecoverySupport_recoverFromCrashIfNeededWithImageWriter___block_invoke(uint64_t a1)
{
  BOOL v2;
  char v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;

  v2 = 1;
  v3 = objc_msgSend(*(id *)(a1 + 32), "needsRecoveryAfterCrashOptionallyRemoveAllIndicatorFiles:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", *(_QWORD *)(a1 + 48), 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if ((v3 & 1) == 0)
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v2;
  v8 = v3 ^ 1;
  if (WeakRetained)
    v8 = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v8;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    objc_storeWeak((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  }

}

uint64_t __73__PLAssetsdCrashRecoverySupport_recoverFromCrashIfNeededWithImageWriter___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqeueRecoveryJob:date:toImageWriter:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
}

@end
