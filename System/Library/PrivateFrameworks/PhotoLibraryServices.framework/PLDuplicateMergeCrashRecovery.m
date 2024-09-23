@implementation PLDuplicateMergeCrashRecovery

- (PLDuplicateMergeCrashRecovery)initWithLibraryServicesManager:(id)a3
{
  void *v4;
  void *v5;
  PLDuplicateMergeCrashRecovery *v6;

  objc_msgSend(a3, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newShortLivedLibraryWithName:", "-[PLDuplicateMergeCrashRecovery initWithLibraryServicesManager:]");

  if (v5)
  {
    v6 = -[PLDuplicateMergeCrashRecovery initWithPhotoLibrary:](self, "initWithPhotoLibrary:", v5);
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (PLDuplicateMergeCrashRecovery)initWithPhotoLibrary:(id)a3
{
  id v6;
  PLDuplicateMergeCrashRecovery *v7;
  PLDuplicateMergeCrashRecovery *v8;
  uint64_t v9;
  PLPhotoLibraryPathManager *pathManager;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDuplicateMergeCrashRecovery.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("library"));

  }
  v13.receiver = self;
  v13.super_class = (Class)PLDuplicateMergeCrashRecovery;
  v7 = -[PLDuplicateMergeCrashRecovery init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_library, a3);
    objc_msgSend(v6, "pathManager");
    v9 = objc_claimAutoreleasedReturnValue();
    pathManager = v8->_pathManager;
    v8->_pathManager = (PLPhotoLibraryPathManager *)v9;

  }
  return v8;
}

- (id)_crashRecoveryMarkerFileURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self->_pathManager, "photoDirectoryWithType:createIfNeeded:error:", 5, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("duplicateMergeMarkerFile.txt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_readCrashRecoveryUUIDContainerMarkerFile
{
  void *v2;
  void *v3;

  -[PLDuplicateMergeCrashRecovery _readCrashRecoveryUUIDListMarkerFile](self, "_readCrashRecoveryUUIDListMarkerFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_readCrashRecoveryUUIDListMarkerFile
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PLDuplicateMergeCrashRecovery _crashRecoveryMarkerFileURL](self, "_crashRecoveryMarkerFileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithContentsOfURL:encoding:error:", v2, 4, &v7);
  v4 = v7;
  if (!v3 && (PLIsErrorFileNotFound() & 1) == 0)
  {
    PLDuplicateDetectionGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to read the crash recovery marker file: %@", buf, 0xCu);
    }

  }
  if (!objc_msgSend(v3, "length"))
  {

    v3 = 0;
  }

  return v3;
}

- (BOOL)writeCrashRecoveryMarkerFileForTargetAssetUUID:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  id v19;
  const char *v20;
  id v21;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    -[PLDuplicateMergeCrashRecovery _crashRecoveryMarkerFileURL](self, "_crashRecoveryMarkerFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

    if (v10)
    {
      v24 = 0;
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingURL:error:", v7, &v24);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v24;
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR(","), v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dataUsingEncoding:", 4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject seekToEndOfFile](v11, "seekToEndOfFile");
        -[NSObject writeData:](v11, "writeData:", v14);
        -[NSObject closeFile](v11, "closeFile");
        PLDuplicateDetectionGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v6;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "Duplicate Merge: Successfully updated crash recovery marker file for asset UUID %{public}@", buf, 0xCu);
        }

LABEL_11:
        v19 = v12;
        v16 = 1;
LABEL_20:

        goto LABEL_21;
      }
      PLDuplicateDetectionGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = v6;
        v27 = 2112;
        v28 = v12;
        v20 = "Duplicate Merge: Failed to update crash recovery marker file for asset UUID %{public}@: %@";
        goto LABEL_16;
      }
    }
    else
    {
      v23 = 0;
      v17 = objc_msgSend(v6, "writeToURL:atomically:encoding:error:", v7, 1, 4, &v23);
      v12 = v23;
      PLDuplicateDetectionGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v11 = v18;
      if (v17)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v6;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Duplicate Merge: Successfully created crash recovery marker file for asset UUID %{public}@", buf, 0xCu);
        }
        goto LABEL_11;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = v6;
        v27 = 2112;
        v28 = v12;
        v20 = "Duplicate Merge: Failed to create crash recovery marker file for asset UUID %{public}@: %@";
LABEL_16:
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
      }
    }

    v21 = v12;
    v19 = v21;
    if (a4)
    {
      v19 = objc_retainAutorelease(v21);
      v16 = 0;
      *a4 = v19;
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_20;
  }
  v16 = 1;
LABEL_21:

  return v16;
}

- (BOOL)removeCrashRecoveryMarkerFileWithError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  id v7;
  BOOL v8;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PLDuplicateMergeCrashRecovery _crashRecoveryMarkerFileURL](self, "_crashRecoveryMarkerFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v11);
  v7 = v11;

  if ((v6 & 1) != 0 || (PLIsErrorFileNotFound() & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to remove crash recovery marker file: %@", buf, 0xCu);
    }

    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v7);
  }

  return v8;
}

- (void)performCrashRecoveryIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLPhotoLibrary *library;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  -[PLDuplicateMergeCrashRecovery _readCrashRecoveryUUIDContainerMarkerFile](self, "_readCrashRecoveryUUIDContainerMarkerFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("uuid"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v7);

    v13[0] = CFSTR("master");
    v13[1] = CFSTR("modernResources");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v8);

    library = self->_library;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__PLDuplicateMergeCrashRecovery_performCrashRecoveryIfNeeded__block_invoke;
    v11[3] = &unk_1E3677C18;
    v11[4] = self;
    v12 = v6;
    v10 = v6;
    -[PLPhotoLibrary performTransactionAndWait:](library, "performTransactionAndWait:", v11);

  }
  -[PLDuplicateMergeCrashRecovery removeCrashRecoveryMarkerFileWithError:](self, "removeCrashRecoveryMarkerFileWithError:", 0);

}

- (int64_t)_requestRecoveryActionForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  int64_t v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "master");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "mainFileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "master");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scopedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0;
    LODWORD(v6) = objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", &v23);
    v9 = v23;
    if ((_DWORD)v6)
    {
      objc_msgSend(MEMORY[0x1E0D11398], "defaultFingerprintSchemeForUnknownRecord");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v9;
      objc_msgSend(v10, "fingerPrintForFileAtURL:error:", v5, &v22);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v22;

      if (v11)
      {
        v13 = objc_msgSend(v8, "isEqualToString:", v11) ^ 1;
      }
      else
      {
        PLDuplicateDetectionGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v3, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v20;
          v26 = 2112;
          v27 = v12;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to generate fingerprint for asset %{public}@. Error: %@", buf, 0x16u);

        }
        v11 = 0;
        v13 = 0;
      }
    }
    else
    {
      v14 = PLIsErrorFileNotFound();
      PLDuplicateDetectionGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v11 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v16;
          v26 = 2112;
          v27 = v9;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "Duplicate Merge: No master resource found for asset %{public}@. Error: %@", buf, 0x16u);

        }
        objc_msgSend(v3, "masterResourceForCPLType:", 1);
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSObject fingerprint](v11, "fingerprint");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          if (objc_msgSend(v8, "isEqualToString:", v17))
            v13 = 0;
          else
            v13 = 2;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v3, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v18;
          v26 = 2112;
          v27 = v9;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Duplicate Merge: Failed to check if the resource is available on disk for asset %{public}@. Error: %@", buf, 0x16u);

        }
        v13 = 0;
      }
      v12 = v9;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_recoveryMasterRecordCleanupForAsset:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "master");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    PLDuplicateDetectionGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "scopedIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v7;
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Deleting master %{public}@ so a new master is created for asset %{public}@", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(v4, "setMaster:", 0);
    +[PLCloudMaster deleteMasterIfNecessary:inLibrary:](PLCloudMaster, "deleteMasterIfNecessary:inLibrary:", v5, self->_library);
  }
  PLDuplicateDetectionGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Marking asset %{public}@ as not pushed to get it re-pushed to CPL", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "setCloudLocalState:", 0);

}

- (void)_recoveryMasterResourceRecordCleanupForAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "masterResourceForCPLType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cplFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(v3, "master");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scopedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "fingerprint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v6, "length") && objc_msgSend(v7, "length"))
      objc_msgSend(v4, "setFingerprint:", v6);
    goto LABEL_7;
  }
  PLDuplicateDetectionGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Duplicate Merge: Unexpected original resource on disk for asset %{public}@.", (uint8_t *)&v10, 0xCu);
LABEL_7:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

void __61__PLDuplicateMergeCrashRecovery_performCrashRecoveryIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v24 = 0;
  objc_msgSend(v2, "executeFetchRequest:error:", v3, &v24);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v24;

  if (v4)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    if (v7)
    {
      v8 = v7;
      v18 = v5;
      v19 = v4;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          PLDuplicateDetectionGetLog();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "uuid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v26 = v13;
            _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Crash recovery marker file found for asset UUID %{public}@", buf, 0xCu);

          }
          v14 = objc_msgSend(*(id *)(a1 + 32), "_requestRecoveryActionForAsset:", v11);
          PLDuplicateDetectionGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v11, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            PLStringFromPLDuplicateMergeCrashRecoveryActionShort(v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v26 = v16;
            v27 = 2114;
            v28 = v17;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Duplicate Merge: Crash recovery action for asset %{public}@: %{public}@", buf, 0x16u);

          }
          if (v14 == 2)
          {
            objc_msgSend(*(id *)(a1 + 32), "_recoveryMasterResourceRecordCleanupForAsset:", v11);
          }
          else if (v14 == 1)
          {
            objc_msgSend(*(id *)(a1 + 32), "_recoveryMasterRecordCleanupForAsset:", v11);
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
      }
      while (v8);
      v5 = v18;
      v4 = v19;
    }
  }
  else
  {
    PLDuplicateDetectionGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Duplicate Merge: Crash recovery marker file exists but we're unable to fetch associated assets. Error: %@", buf, 0xCu);
    }
  }

}

@end
