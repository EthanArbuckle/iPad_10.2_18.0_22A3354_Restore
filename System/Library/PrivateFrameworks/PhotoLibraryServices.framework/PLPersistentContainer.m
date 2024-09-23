@implementation PLPersistentContainer

id __43__PLPersistentContainer_managedObjectModel__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)sSharedModel;
  if (!sSharedModel)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "newManagedObjectModel");
    v4 = (void *)sSharedModel;
    sSharedModel = v3;

    v2 = (void *)sSharedModel;
  }
  return v2;
}

+ (id)newManagedObjectModel
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  objc_msgSend(a1, "managedObjectModelURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "managedObjectModel url is nil", buf, 2u);
    }
    goto LABEL_9;
  }
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B98]), "initWithContentsOfURL:", v2);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D73208], "logDiagnosticInfoForURL:", v2);
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "managedObjectModel is nil", v9, 2u);
    }

    v5 = 0;
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v4 = v3;
  objc_msgSend(v3, "_setIsEditable:", 0);
  v5 = v4;
  v6 = v5;
LABEL_10:

  return v6;
}

+ (NSURL)managedObjectModelURL
{
  pl_dispatch_once();
  return (NSURL *)(id)managedObjectModelURL_url;
}

id __57__PLPersistentContainer_sharedPersistentStoreCoordinator__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (!v3)
  {
    if (*(_BYTE *)(v2 + 32))
    {
      v3 = 0;
    }
    else
    {
      v4 = objc_msgSend((id)v2, "newSharedPersistentStoreCoordinator");
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v4;

      v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
  }
  return v3;
}

- (id)newSharedPersistentStoreCoordinator
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSURL *v9;
  BOOL v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSURL *libraryURL;
  NSObject *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  NSURL *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  PLPhotoLibraryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "newSharedPersistentStoreCoordinator", ", buf, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0C97C00]);
  objc_msgSend((id)objc_opt_class(), "managedObjectModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSURL *)objc_msgSend(v7, "initWithManagedObjectModel:", v8);

  if (-[PLPersistentContainer shouldUseXPCPhotoLibraryStore](self, "shouldUseXPCPhotoLibraryStore"))
  {
    v19 = 0;
    v10 = -[PLPersistentContainer _configureXPCPersistentStoreCoordinator:error:](self, "_configureXPCPersistentStoreCoordinator:error:", v9, &v19);
    v11 = v19;
  }
  else
  {
    v18 = 0;
    v10 = -[PLPersistentContainer _configurePersistentStoreCoordinator:overrideCurrentModelVersionInStore:error:](self, "_configurePersistentStoreCoordinator:overrideCurrentModelVersionInStore:error:", v9, 0, &v18);
    v11 = v18;
  }
  v12 = v11;
  if (!v10)
  {
    PLMigrationGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      libraryURL = self->_libraryURL;
      *(_DWORD *)buf = 138412546;
      v21 = libraryURL;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to configure PSC for library %@: %@", buf, 0x16u);
    }

    v9 = 0;
  }
  v15 = v6;
  v16 = v15;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 134217984;
    v21 = v9;
    _os_signpost_emit_with_name_impl(&dword_199541000, v16, OS_SIGNPOST_INTERVAL_END, v4, "newSharedPersistentStoreCoordinator", "instance: %p", buf, 0xCu);
  }

  return v9;
}

+ (NSManagedObjectModel)managedObjectModel
{
  PLResultWithUnfairLock();
  return (NSManagedObjectModel *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldUseXPCPhotoLibraryStore
{
  PLPersistentContainer *v2;
  void *v3;
  void *v4;
  _OWORD v6[2];

  v2 = self;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithLibraryURL:", self->_libraryURL);
  objc_msgSend(v3, "photosDatabasePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v6, 0, sizeof(v6));
  LOBYTE(v2) = -[PLXPCPhotoLibraryStorePolicy shouldUseXPCStoreForDatabasePath:auditToken:](v2->_xpcStorePolicy, "shouldUseXPCStoreForDatabasePath:auditToken:", v4, v6);

  return (char)v2;
}

- (BOOL)_configurePersistentStoreCoordinator:(id)a3 overrideCurrentModelVersionInStore:(BOOL)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  int v20;
  BOOL v21;
  NSObject *v22;
  int v23;
  char v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  __CFString *v28;
  int v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v41;
  id v42;
  id *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithLibraryURL:", self->_libraryURL);
  v10 = (void *)objc_opt_class();
  v47 = 0;
  v48 = 0;
  objc_msgSend(v9, "photosDatabasePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_getPersistentStoreURL:options:forDatabasePath:enableOrderKeyNotifications:", &v48, &v47, v11, 1);
  v12 = v48;
  v13 = v47;

  PLMigrationGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v54 = v12;
    v55 = 2112;
    v56 = v13;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "Adding persistent store for URL: %@ with options: %@", buf, 0x16u);
  }

  v15 = *MEMORY[0x1E0C979E8];
  v46 = 0;
  objc_msgSend(v8, "addPersistentStoreWithType:configuration:URL:options:error:", v15, 0, v12, v13, &v46);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v46;
  if (v16)
  {
    v43 = a5;
    objc_msgSend(v8, "metadataForPersistentStore:", v16);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKey:", CFSTR("PLModelVersion"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");
    v20 = +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion");
    if (v18)
      v21 = 0;
    else
      v21 = a4;
    if (v21 || v19 == v20)
    {
      self->_didConfigurePersistentStore = 1;
      v39 = v16;
    }
    else
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion");
        *(_DWORD *)buf = 138412546;
        v54 = v18;
        v55 = 1024;
        LODWORD(v56) = v23;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Incompatible version of Photos.sqlite store %@ != required version %d", buf, 0x12u);
      }

      v45 = 0;
      v24 = objc_msgSend(v8, "removePersistentStore:error:", v16, &v45);
      v25 = v45;
      if ((v24 & 1) == 0)
      {
        PLMigrationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v25;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Failed to remove incompatible Photos.sqlite store %@", buf, 0xCu);
        }

      }
      if (v43)
      {
        v42 = v25;
        objc_msgSend(v18, "description");
        v27 = objc_claimAutoreleasedReturnValue();
        if (v27)
          v28 = (__CFString *)v27;
        else
          v28 = CFSTR("None");
        v29 = objc_msgSend(v18, "intValue");
        v30 = +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion");
        v41 = (void *)MEMORY[0x1E0CB35C8];
        v31 = *MEMORY[0x1E0D74498];
        if (v29 >= v30)
        {
          v49[1] = CFSTR("CurrentVersion");
          v50[0] = v28;
          v49[0] = CFSTR("StoreVersion");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v50[1] = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v41;
          v35 = v31;
          v36 = 46006;
        }
        else
        {
          v51[1] = CFSTR("CurrentVersion");
          v52[0] = v28;
          v51[0] = CFSTR("StoreVersion");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v52[1] = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v41;
          v35 = v31;
          v36 = 46007;
        }
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, v36, v33);
        *v43 = (id)objc_claimAutoreleasedReturnValue();

        v39 = 0;
        v16 = v42;
      }
      else
      {
        v39 = 0;
        v16 = v25;
      }
    }

  }
  else
  {
    PLMigrationGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      PLFilteredDescriptionForAddPersistentStoreError(v17);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v54 = v13;
      v55 = 2112;
      v56 = v38;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Failed to add Photos.sqlite store with options %@: %@", buf, 0x16u);

    }
    v39 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v17);
  }

  return v39 != 0;
}

+ (void)_getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5 enableOrderKeyNotifications:(BOOL)a6
{
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  NSObject *v25;
  char v26;
  int v27;
  NSObject *v28;
  const __CFString *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  __CFString *v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  void *v51;
  NSObject *v52;
  char v53;
  uint8_t buf[4];
  NSObject *v55;
  __int16 v56;
  const __CFString *v57;
  _QWORD v58[12];
  _QWORD v59[3];
  _QWORD v60[6];

  v47 = a6;
  v60[3] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("WAL"), CFSTR("journal_mode"));
  objc_msgSend(MEMORY[0x1E0D73208], "proxyLockFilePathForDatabasePath:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("lock_proxy_file"));
  v48 = (void *)v8;
  v52 = v6;
  if ((PLIsAssetsd() & 1) == 0)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("wal_autocheckpoint"));
  v59[0] = *MEMORY[0x1E0C978F8];
  +[PLAssetAnalysisState entityName](PLAssetAnalysisState, "entityName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v46;
  +[PLMediaAnalysisAssetAttributes entityName](PLMediaAnalysisAssetAttributes, "entityName");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v45;
  +[PLPhotoAnalysisAssetAttributes entityName](PLPhotoAnalysisAssetAttributes, "entityName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v44;
  +[PLComputedAssetAttributes entityName](PLComputedAssetAttributes, "entityName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v58[3] = v43;
  +[PLSceneClassification entityName](PLSceneClassification, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58[4] = v9;
  +[PLDetectedFaceGroup entityName](PLDetectedFaceGroup, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[5] = v10;
  +[PLSceneprint entityName](PLSceneprint, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58[6] = v11;
  +[PLDetectedFaceprint entityName](PLDetectedFaceprint, "entityName");
  v51 = v7;
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58[7] = v12;
  +[PLCharacterRecognitionAttributes entityName](PLCharacterRecognitionAttributes, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v58[8] = v13;
  +[PLVisualSearchAttributes entityName](PLVisualSearchAttributes, "entityName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v58[9] = v14;
  +[PLGlobalKeyValue entityName](PLGlobalKeyValue, "entityName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58[10] = v15;
  +[PLBackgroundJobWorkItem entityName](PLBackgroundJobWorkItem, "entityName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v58[11] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0C97908];
  v60[0] = v17;
  v60[1] = MEMORY[0x1E0C9AAB0];
  v19 = *MEMORY[0x1E0C978E8];
  v59[1] = v18;
  v59[2] = v19;
  v60[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v51, *MEMORY[0x1E0C979E0]);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E375D0E0, *MEMORY[0x1E0C979D8]);
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0C97900]);
  v22 = +[PLPersistentContainer shouldTrackIndexUse](PLPersistentContainer, "shouldTrackIndexUse");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0C97988]);

  objc_msgSend(v21, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CB2AC0], *MEMORY[0x1E0C97940]);
  if ((objc_msgSend(MEMORY[0x1E0D732C8], "processCanWriteSandboxForPath:", v52) & 1) == 0)
  {
    if (!PLIsAssetsd())
    {
      v26 = 0;
      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v52, 0))
    {
      PLBackendGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v52;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Possibly fatal error: sandbox denied assetsd write-access for %@, but it exists", buf, 0xCu);
      }
    }
    else
    {
      v53 = 0;
      -[NSObject stringByDeletingLastPathComponent](v52, "stringByDeletingLastPathComponent");
      v25 = objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v24, "fileExistsAtPath:isDirectory:", v25, &v53);
      if (!v27 || !v53)
      {
        PLBackendGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = CFSTR("does not exist");
          if (v27)
            v29 = CFSTR("not a directory");
          *(_DWORD *)buf = 138412546;
          v55 = v25;
          v56 = 2112;
          v57 = v29;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Possibly fatal error: parent directory %@ is %@", buf, 0x16u);
        }

      }
    }

    PLBackendGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v52;
      _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "Assuming write-access for %@ after sandbox denied write access", buf, 0xCu);
    }

  }
  v26 = 1;
LABEL_22:
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v52);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v26 & 1) == 0)
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97998]);
    objc_msgSend(v31, "absoluteString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByAppendingString:", CFSTR("?readonly_shm=1"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v33);
    v34 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v34;
  }
  if (v47 && PLIsAssetsd())
    objc_msgSend(v21, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97960]);
  if (PLIsAssetsd())
  {
    v35 = (void *)MEMORY[0x1E0CB37E8];
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "numberWithInteger:", objc_msgSend(v36, "maxConcurrency"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v37, *MEMORY[0x1E0C97910]);

    v38 = v48;
  }
  else
  {
    v38 = v48;
    if (PLIsMobileSlideShow())
      objc_msgSend(v21, "setObject:forKeyedSubscript:", &unk_1E375D0F8, *MEMORY[0x1E0C97910]);
  }
  PLBackendGetLog();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    v40 = CFSTR("NO");
    if (v22)
      v40 = CFSTR("YES");
    v41 = v40;
    objc_msgSend(MEMORY[0x1E0D73208], "redactedDescriptionForFileURL:", v31);
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v55 = v41;
    v56 = 2114;
    v57 = v42;
    _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Using NSPersistentStoreTrackIndexUseOptionKey = %{public}@ for store at %{public}@", buf, 0x16u);

  }
  if (a3)
    *a3 = objc_retainAutorelease(v31);
  if (a4)
    *a4 = objc_retainAutorelease(v21);

}

+ (BOOL)shouldTrackIndexUse
{
  void *v2;
  void *v3;
  char v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("com.apple.photos.TrackIndexUse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = MEMORY[0x19AEC04BC]();
  v5 = v4;

  return v5;
}

- (NSPersistentStoreCoordinator)sharedPersistentStoreCoordinator
{
  PLResultWithUnfairLock();
  return (NSPersistentStoreCoordinator *)(id)objc_claimAutoreleasedReturnValue();
}

- (PLPersistentContainer)initWithLibraryURL:(id)a3 lazyAssetsdClient:(id)a4
{
  id v6;
  id v7;
  PLPersistentContainer *v8;
  uint64_t v9;
  NSURL *libraryURL;
  PLXPCPhotoLibraryStorePolicySandbox *v11;
  PLXPCPhotoLibraryStorePolicy *xpcStorePolicy;
  NSObject *v13;
  uint64_t v14;
  PLPersistentContainer *v15;
  objc_super v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  PLPersistentContainer *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PLPersistentContainer;
  v8 = -[PLPersistentContainer init](&v17, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    libraryURL = v8->_libraryURL;
    v8->_libraryURL = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_lazyAssetdClient, a4);
    v11 = objc_alloc_init(PLXPCPhotoLibraryStorePolicySandbox);
    xpcStorePolicy = v8->_xpcStorePolicy;
    v8->_xpcStorePolicy = (PLXPCPhotoLibraryStorePolicy *)v11;

    v8->_sharedPersistentStoreCoordinatorLock._os_unfair_lock_opaque = 0;
    PLPhotosObjectLifecycleGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      v19 = v14;
      v20 = 2048;
      v21 = v8;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryURL:%@", buf, 0x20u);
    }

    v15 = v8;
  }

  return v8;
}

void __46__PLPersistentContainer_managedObjectModelURL__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("photos"), CFSTR("momd"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)managedObjectModelURL_url;
  managedObjectModelURL_url = v3;

  if (!managedObjectModelURL_url)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PLPersistentContainer.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  PLPersistentContainer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLPersistentContainer;
  -[PLPersistentContainer dealloc](&v4, sel_dealloc);
}

- (id)newPersistentStoreCoordinatorForMigration:(id *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc(MEMORY[0x1E0C97C00]);
  objc_msgSend((id)objc_opt_class(), "managedObjectModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithManagedObjectModel:", v6);

  if (!-[PLPersistentContainer _configurePersistentStoreCoordinator:overrideCurrentModelVersionInStore:error:](self, "_configurePersistentStoreCoordinator:overrideCurrentModelVersionInStore:error:", v7, 1, a3))
  {

    return 0;
  }
  return v7;
}

- (void)removeSharedPersistentStoreCoordinator
{
  NSObject *v3;
  uint8_t buf[4];
  uint64_t v5;
  __int16 v6;
  PLPersistentContainer *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    v8 = 2080;
    v9 = "-[PLPersistentContainer removeSharedPersistentStoreCoordinator]";
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p %s", buf, 0x20u);
  }

  PLRunWithUnfairLock();
}

- (int64_t)configureSharedPersistentStoreCoordinatorAndMigrateOrRebuildIfNecessaryWithModelMigrator:(id)a3 migrationPolicy:(unsigned int)a4 error:(id *)a5
{
  id v6;
  int64_t v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__286;
  v13 = __Block_byref_object_dispose__287;
  v14 = 0;
  v6 = a3;
  PLRunWithUnfairLock();
  if (a5)
    *a5 = objc_retainAutorelease((id)v10[5]);
  v7 = v16[3];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v7;
}

- (void)_setTestDidConfigureXPCStore:(BOOL)a3
{
  self->_didConfigureXPCStore = a3;
}

- (BOOL)_configureXPCPersistentStoreCoordinator:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  PLXPCPhotoLibraryStoreEndpointFactory *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", self->_libraryURL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to XPCPhotoLibraryStore %@", buf, 0xCu);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithLibraryURL:", self->_libraryURL);
  -[PLLazyObject objectValue](self->_lazyAssetdClient, "objectValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PLXPCPhotoLibraryStoreEndpointFactory initWithAssetsdClient:]([PLXPCPhotoLibraryStoreEndpointFactory alloc], "initWithAssetsdClient:", v10);
  v12 = *MEMORY[0x1E0C97A68];
  v31[0] = *MEMORY[0x1E0C97A58];
  v31[1] = v12;
  v32[0] = v11;
  v32[1] = MEMORY[0x1E0C9AAB0];
  v31[2] = *MEMORY[0x1E0C97900];
  v32[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v9, "photosDatabasePath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileURLWithPath:isDirectory:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLMigrationGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v16;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Adding XPC store at URL: %@ with options: %@", buf, 0x16u);
  }

  v18 = *MEMORY[0x1E0C97A70];
  v24 = 0;
  objc_msgSend(v6, "addPersistentStoreWithType:configuration:URL:options:error:", v18, 0, v16, v13, &v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v24;
  if (v19)
  {
    *(_WORD *)&self->_didConfigurePersistentStore = 257;
  }
  else
  {
    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      PLFilteredDescriptionForAddPersistentStoreError(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v26 = v16;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v22;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to connect to XPC PhotoLibraryStore %@ with options %@: %@", buf, 0x20u);

    }
    if (a4)
      *a4 = objc_retainAutorelease(v20);
  }

  return v19 != 0;
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (PLXPCPhotoLibraryStorePolicy)xpcStorePolicy
{
  return (PLXPCPhotoLibraryStorePolicy *)objc_getProperty(self, a2, 48, 1);
}

- (void)setXpcStorePolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)didConfigurePersistentStore
{
  return self->_didConfigurePersistentStore;
}

- (BOOL)didConfigureXPCStore
{
  return self->_didConfigureXPCStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcStorePolicy, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_sharedPersistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_lazyAssetdClient, 0);
}

void __136__PLPersistentContainer_configureSharedPersistentStoreCoordinatorAndMigrateOrRebuildIfNecessaryWithModelMigrator_migrationPolicy_error___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C97C00]);
    objc_msgSend((id)objc_opt_class(), "managedObjectModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (id)objc_msgSend(v3, "initWithManagedObjectModel:", v4);

    v5 = (void *)objc_opt_class();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(unsigned int *)(a1 + 64);
    v15 = 0;
    v8 = objc_msgSend(v5, "_migrateOrRebuildDatabaseWithSharedPersistentStoreCoordinator:modelMigrator:migrationPolicy:error:", v2, v6, v7, &v15);
    v9 = v15;
    v10 = v15;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v9);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == 4)
    {
      PLMigrationGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to configure PSC for library %@", buf, 0xCu);
      }
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = v2;
      v11 = *(NSObject **)(v13 + 24);
      *(_QWORD *)(v13 + 24) = v14;
    }

  }
}

void __63__PLPersistentContainer_removeSharedPersistentStoreCoordinator__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  _BYTE v29[18];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

    objc_msgSend(v2, "persistentStores");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 1)
    {
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(v5, "count");
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v29 = v7;
        *(_WORD *)&v29[4] = 2112;
        *(_QWORD *)&v29[6] = v8;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Unexpected stores count %d in shared PSC for library %@", buf, 0x12u);
      }

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v25;
      *(_QWORD *)&v11 = 138412546;
      v22 = v11;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14);
          v23 = 0;
          v16 = objc_msgSend(v2, "removePersistentStore:error:", v15, &v23, v22);
          v17 = v23;
          if ((v16 & 1) == 0)
          {
            PLMigrationGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
              *(_DWORD *)buf = v22;
              *(_QWORD *)v29 = v15;
              *(_WORD *)&v29[8] = 2112;
              *(_QWORD *)&v29[10] = v19;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to remove store %@ PSC for library %@", buf, 0x16u);
            }

          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v12);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
    PLMigrationGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v29 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Removed persistent store coordinator %@", buf, 0xCu);
    }

  }
}

+ (void)unsafeRemoveManagedObjectModel
{
  PLRunWithUnfairLock();
}

+ (void)getConfigurationForDatabasePath:(id)a3 withBlock:(id)a4
{
  void (**v6)(id, id, id);
  id v7;
  id v8;
  id v9;
  id v10;

  v9 = 0;
  v10 = 0;
  v6 = (void (**)(id, id, id))a4;
  objc_msgSend(a1, "_getPersistentStoreURL:options:forDatabasePath:enableOrderKeyNotifications:", &v10, &v9, a3, 0);
  v7 = v10;
  v8 = v9;
  v6[2](v6, v7, v8);

}

+ (BOOL)_destroyPhotosDatabaseWithPath:(id)a3 backupToPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v34;
  id v35;
  id v36;
  char v37;
  void *context;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  context = (void *)MEMORY[0x19AEC1554]();
  v45 = 0;
  v46 = 0;
  objc_msgSend(a1, "_getPersistentStoreURL:options:forDatabasePath:enableOrderKeyNotifications:", &v46, &v45, v6, 0);
  v8 = v46;
  v9 = v45;
  v10 = objc_alloc_init(MEMORY[0x1E0C97C00]);
  v11 = (id)*MEMORY[0x1E0C979E8];
  v39 = v7;
  if (v7)
  {
    v36 = v6;
    v43 = 0;
    v44 = 0;
    objc_msgSend(a1, "_getPersistentStoreURL:options:forDatabasePath:enableOrderKeyNotifications:", &v44, &v43, v7, 0);
    v12 = v44;
    v13 = v43;
    v14 = (void *)objc_msgSend(v9, "copy");
    v42 = 0;
    v15 = objc_msgSend(v10, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v12, v13, v8, v14, v11, &v42);
    v16 = v42;
    PLMigrationGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    v37 = v15;
    if (v15)
    {
      if (v18)
      {
        objc_msgSend(v8, "path");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v19 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v48 = v34;
        v49 = 2112;
        v50 = v19;
        v20 = (void *)v19;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Moved old store aside from \"%@\" to \"%@\", buf, 0x16u);

      }
    }
    else if (v18)
    {
      objc_msgSend(v8, "path");
      v35 = v9;
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v48 = v21;
      v49 = 2112;
      v50 = (uint64_t)v22;
      v51 = 2112;
      v52 = v16;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Could not move store at \"%@\" to \"%@\": %@", buf, 0x20u);

      v9 = v35;
    }

    v6 = v36;
  }
  else
  {
    v16 = 0;
    v37 = 1;
  }
  v23 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97948]);
  v41 = v16;
  v24 = objc_msgSend(v10, "_destroyPersistentStoreAtURL:withType:options:error:", v8, v11, v23, &v41);
  v25 = v41;

  if ((v24 & 1) != 0)
  {
    v26 = 1;
    v27 = v25;
  }
  else
  {
    PLMigrationGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v29;
      v49 = 2112;
      v50 = (uint64_t)v25;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Failed to destroy store located at \"%@\". Attempting again with unlink option. Error: %@", buf, 0x16u);

    }
    objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97990]);
    v40 = v25;
    v30 = objc_msgSend(v10, "_destroyPersistentStoreAtURL:withType:options:error:", v8, v11, v23, &v40);
    v27 = v40;

    if ((v30 & 1) != 0)
    {
      v26 = 1;
    }
    else
    {
      PLMigrationGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "path");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v48 = v32;
        v49 = 2112;
        v50 = (uint64_t)v27;
        _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_ERROR, "Could not destroy store \"%@\". Error: %@", buf, 0x16u);

      }
      v26 = 0;
    }
  }

  objc_autoreleasePoolPop(context);
  return v37 & v26;
}

+ (void)removePhotosDatabaseWithPathManager:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __CFString *v13;
  int v14;
  id v15;
  char *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  __CFString *v26;
  NSObject *v27;
  int *v28;
  char *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  char *v46;
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v30 = a1;
  v49 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  objc_msgSend(v33, "photosDatabasePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-wal"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v31 = (void *)v4;
  v32 = v3;
  v47[0] = v3;
  v47[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v7)
  {
    v8 = v7;
    v34 = 0;
    v35 = 0;
    v9 = *(_QWORD *)v40;
    v10 = *MEMORY[0x1E0C99998];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v12, 0, v30))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v37 = 0;
          v38 = 0;
          v14 = -[__CFString getResourceValue:forKey:error:](v13, "getResourceValue:forKey:error:", &v38, v10, &v37);
          v15 = v38;
          v16 = (char *)v37;
          if (v14)
            v17 = v15 == 0;
          else
            v17 = 1;
          if (v17)
          {
            PLMigrationGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v44 = v13;
              v45 = 2112;
              v46 = v16;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Couldn't get file size for %@. Error: %@", buf, 0x16u);
            }

            v34 = 1;
          }
          else
          {
            v35 += objc_msgSend(v15, "unsignedLongLongValue");
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v8);
  }
  else
  {
    v34 = 0;
    v35 = 0;
  }

  v19 = (void *)MEMORY[0x1E0D731D8];
  objc_msgSend(v33, "libraryURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = objc_msgSend(v19, "diskSpaceAvailableForPath:", v21) <= 2 * v35 + 0x40000000;

  v22 = v34 | v19;
  PLMigrationGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = CFSTR("Moving aside");
    if ((v22 & 1) != 0)
      v24 = CFSTR("Destroying");
    *(_DWORD *)buf = 138412290;
    v44 = v24;
    _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "%@ photos database", buf, 0xCu);
  }

  if ((v22 & 1) != 0)
  {
    objc_msgSend(v30, "_destroyPhotosDatabaseWithPath:backupToPath:", v32, 0);
  }
  else
  {
    objc_msgSend(v33, "photosAsideDatabasePath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_destroyPhotosDatabaseWithPath:backupToPath:", v32, v25);
    if (v25)
    {
      v36 = 66049;
      v26 = objc_retainAutorelease(v25);
      if (fsctl((const char *)-[__CFString fileSystemRepresentation](v26, "fileSystemRepresentation"), 0xC0084A44uLL, &v36, 0) == -1&& *__error() != 45)
      {
        PLMigrationGetLog();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = __error();
          v29 = strerror(*v28);
          *(_DWORD *)buf = 138412546;
          v44 = v26;
          v45 = 2080;
          v46 = v29;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "error marking %@ purgeable: %s", buf, 0x16u);
        }

      }
    }
  }

}

+ (int64_t)_openAndMigrateStoreWithURL:(id)a3 options:(id)a4 coordinator:(id)a5 modelMigrator:(id)a6 migrationPolicy:(unsigned int)a7 error:(id *)a8
{
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  BOOL v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  NSObject *v71;
  void *v72;
  char v73;
  id v74;
  int64_t v75;
  id v77;
  NSObject *v78;
  double v79;
  double v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  id v88;
  unsigned int v89;
  uint64_t v90;
  int v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id v98;
  id v99;
  char v100;
  id v101;
  id v102;
  uint64_t v103;
  void *v104;
  _QWORD v105[2];
  _QWORD v106[2];
  uint8_t buf[4];
  id v108;
  __int16 v109;
  _BYTE v110[18];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[3];
  _QWORD v116[5];

  v116[3] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v97 = a4;
  v98 = a5;
  v14 = a6;
  v93 = +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion");
  PLMigrationGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v108 = v13;
    v109 = 2112;
    *(_QWORD *)v110 = v97;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "Adding persistent store for URL: %@ with options: %@", buf, 0x16u);
  }

  objc_msgSend(v14, "analyticsEventManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0C979E8];
  v102 = 0;
  objc_msgSend(v98, "addPersistentStoreWithType:configuration:URL:options:error:", v17, 0, v13, v97, &v102);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = v102;
  if (v18)
  {
    objc_msgSend(v98, "metadataForPersistentStore:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", CFSTR("PLModelVersion"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    goto LABEL_30;
  }
  v89 = a7;
  if (objc_msgSend(v96, "code") == 134100)
  {
    objc_msgSend(v96, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

    if (v23)
    {
      v101 = 0;
      objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:options:error:", v17, v13, v97, &v101);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v101;
      if (v19)
      {
        objc_msgSend(v19, "objectForKey:", CFSTR("PLModelVersion"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "intValue");
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v24 == v93)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            PLFilteredDescriptionForAddPersistentStoreError(v96);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v108 = v20;
            v109 = 1024;
            *(_DWORD *)v110 = v93;
            *(_WORD *)&v110[4] = 2114;
            *(_QWORD *)&v110[6] = v27;
            _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Store schema incompatibility, but model version matches %{public}@ to %d. This is an internal only failure caused by reusing the same model version number on different trains.  Add store error: %{public}@", buf, 0x1Cu);

          }
          PLMigrationGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v98, "managedObjectModel");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLModelMigrator schemaIncompatibilityDetailsForStoreMetadata:model:](PLModelMigrator, "schemaIncompatibilityDetailsForStoreMetadata:model:", v19, v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v108 = v30;
            _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Incompatibility details: %@", buf, 0xCu);

          }
          if (!a8)
          {
            a7 = v89;
            v43 = v88;
            goto LABEL_29;
          }
          v86 = (void *)MEMORY[0x1E0CB35C8];
          v85 = *MEMORY[0x1E0D74498];
          v113[0] = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store schema incompatibility, but store model version %d matches current model version. A system reboot is recommended to clear this error."), objc_msgSend(v20, "intValue"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v114[0] = v31;
          v113[1] = *MEMORY[0x1E0CB2AA0];
          objc_msgSend(v13, "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v114[1] = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "errorWithDomain:code:userInfo:", v85, 46009, v33);
          *a8 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            PLFilteredDescriptionForAddPersistentStoreError(v96);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v108 = v20;
            v109 = 1024;
            *(_DWORD *)v110 = v93;
            *(_WORD *)&v110[4] = 2114;
            *(_QWORD *)&v110[6] = v48;
            _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Store schema incompatibility, requires migration from version %{public}@ to %d. Add store error: %{public}@", buf, 0x1Cu);

          }
          v31 = v26;
        }
        a7 = v89;
        v43 = v88;
      }
      else
      {
        PLMigrationGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = v88;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          PLFilteredDescriptionForAddPersistentStoreError(v96);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v108 = v88;
          v109 = 2114;
          *(_QWORD *)v110 = v44;
          _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "Store schema incompatibility and metadata read failure (%{public}@). Add store error: %{public}@", buf, 0x16u);

        }
        if (!a8)
        {
          v20 = 0;
          a7 = v89;
          goto LABEL_29;
        }
        v45 = (void *)MEMORY[0x1E0CB35C8];
        v87 = *MEMORY[0x1E0D74498];
        v46 = *MEMORY[0x1E0CB3388];
        v115[0] = *MEMORY[0x1E0CB2938];
        v115[1] = v46;
        v116[0] = CFSTR("Store schema incompatibility and metadata read failure");
        v116[1] = v88;
        v115[2] = *MEMORY[0x1E0CB2AA0];
        objc_msgSend(v13, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v116[2] = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 3);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "errorWithDomain:code:userInfo:", v87, 46009, v47);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

        v20 = 0;
        a7 = v89;
      }

LABEL_29:
      v21 = 1;
      goto LABEL_30;
    }
  }
  PLMigrationGetLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    PLFilteredDescriptionForAddPersistentStoreError(v96);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v108 = v13;
    v109 = 2114;
    *(_QWORD *)v110 = v35;
    _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Unexpected error opening %@: %{public}@", buf, 0x16u);

  }
  if (a8)
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    v37 = *MEMORY[0x1E0D74498];
    v38 = *MEMORY[0x1E0CB3388];
    v111[0] = *MEMORY[0x1E0CB2938];
    v111[1] = v38;
    v112[0] = CFSTR("Unexpected open error");
    v112[1] = v96;
    v111[2] = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(v13, "path");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v112[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 3);
    v40 = a8;
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 46009, v41);
    *v40 = (id)objc_claimAutoreleasedReturnValue();

    a8 = v40;
  }
  v21 = 0;
  v20 = 0;
  v19 = 0;
  a7 = v89;
LABEL_30:
  pl_dispatch_once();
  if (v20)
    v49 = v19 == 0;
  else
    v49 = 1;
  if (v49)
  {
    PLMigrationGetLog();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v18, "URL");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "path");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v108 = v18;
      v109 = 2112;
      *(_QWORD *)v110 = v52;
      *(_WORD *)&v110[8] = 2112;
      *(_QWORD *)&v110[10] = v19;
      _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_DEFAULT, "Store %p (%@) has no version, requires rebuild %@", buf, 0x20u);

    }
    if (a8)
    {
      if (!*a8)
      {
        v94 = (void *)MEMORY[0x1E0CB35C8];
        v90 = *MEMORY[0x1E0D74498];
        v53 = *MEMORY[0x1E0CB2938];
        v106[0] = CFSTR("Store has no version");
        v54 = *MEMORY[0x1E0CB2AA0];
        v105[0] = v53;
        v105[1] = v54;
        objc_msgSend(v13, "path");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v106[1] = v55;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
        v56 = v19;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "errorWithDomain:code:userInfo:", v90, 46009, v57);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

        v19 = v56;
      }
      v58 = *MEMORY[0x1E0D737A8];
      objc_msgSend(v16, "setPayloadValue:forKey:onEventWithName:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D737E8], *MEMORY[0x1E0D737A8]);
      v59 = *a8;
      v60 = *MEMORY[0x1E0D737B0];
      v61 = v16;
      v62 = v58;
    }
    else
    {
      v60 = *MEMORY[0x1E0D737E8];
      v62 = *MEMORY[0x1E0D737A8];
      v59 = (id)MEMORY[0x1E0C9AAA0];
      v61 = v16;
    }
    goto LABEL_49;
  }
  v63 = objc_msgSend(v20, "intValue");
  if (v63 != v93)
  {
    if ((a7 & 1) == 0)
    {
      if (a8)
      {
        v65 = (void *)MEMORY[0x1E0CB35C8];
        v66 = *MEMORY[0x1E0D74498];
        v103 = *MEMORY[0x1E0CB2AA0];
        objc_msgSend(v13, "path");
        v95 = v19;
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "errorWithDomain:code:userInfo:", v66, 46007, v68);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

        v19 = v95;
      }
      goto LABEL_50;
    }
    objc_msgSend(v16, "startRecordingTimedEventToken");
    v80 = v79;
    LODWORD(v84) = a7;
    v75 = objc_msgSend(v14, "attemptLightweightMigrationFromVersion:onStore:withMetadata:orStoreURL:options:coordinator:migrationPolicy:error:", v20, v18, v19, v13, v97, v98, v84, a8);
    v81 = *MEMORY[0x1E0D737A8];
    objc_msgSend(v16, "stopRecordingTimedEventWithToken:forKey:onEventWithName:", *MEMORY[0x1E0D737C0], *MEMORY[0x1E0D737A8], v80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v75 == 2);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPayloadValue:forKey:onEventWithName:", v82, *MEMORY[0x1E0D737E8], v81);

    if (a8)
      objc_msgSend(v16, "setPayloadValue:forKey:onEventWithName:", *a8, *MEMORY[0x1E0D737B0], v81);
    goto LABEL_70;
  }
  if (!v21)
  {
    objc_msgSend(v16, "removeEventWithName:", *MEMORY[0x1E0D737A8]);
    v100 = 0;
    if ((objc_msgSend(v14, "postProcessThumbnailsOnlyIfVersionMismatchOrMissing:coordinator:", &v100, v98) & 1) == 0)
    {
      v77 = v14;
      PLMigrationGetLog();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v78, OS_LOG_TYPE_ERROR, "Thumbnail processing failed, requires rebuild", buf, 2u);
      }
      v75 = 4;
      goto LABEL_69;
    }
    if (v100)
    {
      v77 = v14;
      PLMigrationGetLog();
      v78 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v78, OS_LOG_TYPE_DEFAULT, "Thumbnail processing succeeded", buf, 2u);
      }
      v75 = 0;
LABEL_69:

      v14 = v77;
      goto LABEL_70;
    }
    v75 = 0;
LABEL_70:
    if (v75 != 4)
      goto LABEL_58;
    goto LABEL_50;
  }
  v64 = *MEMORY[0x1E0D737A8];
  objc_msgSend(v16, "setPayloadValue:forKey:onEventWithName:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D737E8], *MEMORY[0x1E0D737A8]);
  if (a8)
  {
    v59 = *a8;
    v60 = *MEMORY[0x1E0D737B0];
    v61 = v16;
    v62 = v64;
LABEL_49:
    objc_msgSend(v61, "setPayloadValue:forKey:onEventWithName:", v59, v60, v62);
  }
LABEL_50:
  v69 = v19;
  v70 = v14;
  PLMigrationGetLog();
  v71 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "path");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v108 = v72;
    _os_log_impl(&dword_199541000, v71, OS_LOG_TYPE_ERROR, "Failed to open store %@, requires rebuild", buf, 0xCu);

  }
  if (v18)
  {
    v99 = 0;
    v73 = objc_msgSend(v98, "removePersistentStore:error:", v18, &v99);
    v74 = v99;
    v14 = v70;
    if ((v73 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentContainer.m"), 517, CFSTR("Unable to remove store: %@"), v74);

    }
    v75 = 4;
  }
  else
  {
    v75 = 4;
    v14 = v70;
  }
  v19 = v69;
LABEL_58:

  return v75;
}

+ (int64_t)_migrateOrRebuildDatabaseWithSharedPersistentStoreCoordinator:(id)a3 modelMigrator:(id)a4 migrationPolicy:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int64_t v25;
  __CFString *v26;
  void *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  NSObject *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v62;
  __CFString *v63;
  const char *v64;
  void *v65;
  void *v66;
  int v67;
  id v68;
  id v69;
  id *v70;
  void *v71;
  void *v72;
  void *v73;
  __CFString *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  uint8_t buf[4];
  const __CFString *v80;
  __int16 v81;
  __CFString *v82;
  uint64_t v83;

  v7 = *(_QWORD *)&a5;
  v83 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPersistentContainer.m"), 530, CFSTR("Must only be called by assetsd"));

  }
  v13 = objc_msgSend(v12, "checkForceRebuildIndicatorFile");
  v70 = a6;
  if (v13 == 1)
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Found force rebuild indicator file, will not attempt lightweight migration", buf, 2u);
    }

    objc_msgSend(v12, "pathManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "recordRebuildReason");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v73 = 0;
  }
  v77 = 0;
  v78 = 0;
  objc_msgSend(v12, "pathManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "photosDatabasePath");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_getPersistentStoreURL:options:forDatabasePath:enableOrderKeyNotifications:", &v78, &v77, v17, 1);
  v18 = v78;
  v19 = v77;

  v20 = 0;
  v72 = v18;
  if (v13 == 1)
  {
LABEL_9:
    v69 = v19;
    objc_msgSend(v73, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "promptUserIfNeededForRebuildReason:migrationError:", v22, v20) == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46016, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v70)
        *v70 = objc_retainAutorelease(v23);

      v25 = 4;
      goto LABEL_66;
    }
    v75 = 0;
    v30 = objc_msgSend(v12, "createNewDatabaseWithMigrationType:forceRebuildReason:coordinator:error:", 1, v22, v11, &v75);
    v31 = (__CFString *)v75;
    v32 = v31;
    v68 = v11;
    if (v30 == 4)
    {
      v33 = v31;
    }
    else
    {
      v34 = *MEMORY[0x1E0C979E8];
      v74 = v31;
      objc_msgSend(v11, "addPersistentStoreWithType:configuration:URL:options:error:", v34, 0, v18, v19, &v74);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v74;

      if (v35)
      {
        v67 = 1;
        v25 = 1;
        goto LABEL_36;
      }
      PLMigrationGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v33;
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Store open/configuration failed after attempted rebuild: %@", buf, 0xCu);
      }

    }
    PLMigrationGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = CFSTR("migration failure");
      if (v13)
        v38 = CFSTR("forced");
      *(_DWORD *)buf = 138543362;
      v80 = v38;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "Store migrateOrRebuild failed after attempted rebuild: %{public}@", buf, 0xCu);
    }

    if (v70)
    {
      v33 = objc_retainAutorelease(v33);
      v67 = 0;
      *v70 = v33;
    }
    else
    {
      v67 = 0;
    }
    v25 = 4;
LABEL_36:
    objc_msgSend(v12, "analyticsEventManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *MEMORY[0x1E0D73800];
    objc_msgSend(v39, "setPayloadValue:forKey:onEventWithName:", CFSTR("failed open rebuild"), *MEMORY[0x1E0D73838], *MEMORY[0x1E0D73800]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 != 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v39;
    objc_msgSend(v39, "setPayloadValue:forKey:onEventWithName:", v41, *MEMORY[0x1E0D73810], v40);

    v42 = (void *)MEMORY[0x1E0D73280];
    objc_msgSend(v12, "pathManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "libraryURL");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v42, "wellKnownPhotoLibraryIdentifierForURL:", v44);

    if (v20)
      v46 = PLIsErrorEqualToCode() ^ 1;
    else
      v46 = 0;
    v11 = v68;
    if (v13)
    {
      v47 = objc_msgSend(v22, "intValue");
      v48 = 1;
      if ((unint64_t)v47 <= 0x11 && ((1 << v47) & 0x20404) != 0)
        v48 = v46;
      if (!v48)
      {
LABEL_58:

        v19 = v69;
        if (!v67)
          goto LABEL_66;
LABEL_59:
        objc_msgSend(v12, "pathManager");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "removeSqliteErrorIndicatorFile");

        goto LABEL_66;
      }
    }
    else if (!v46)
    {
      goto LABEL_58;
    }
    if (v45 != 3)
    {
      PLMigrationGetLog();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_DEFAULT, "Triggering tap to radar for rebuild", buf, 2u);
      }

      v50 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(v50, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSSZZZZZ"));
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setLocale:", v51);

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "stringFromDate:", v52);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = (void *)MEMORY[0x1E0CB3940];
      if (v13)
      {
        PLRebuildReasonToShortString(objc_msgSend(v22, "integerValue"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringWithFormat:", CFSTR("TTR: Photo Library Rebuild for reason %@"), v54);
      }
      else
      {
        -[__CFString code](v20, "code");
        NSStringFromPLErrorCode();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "stringWithFormat:", CFSTR("TTR: Photo Library Rebuild due to migration error %@"), v54);
      }
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v45)
      {
        objc_msgSend(v12, "pathManager");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "isSystemPhotoLibraryPathManager");

      }
      PLStringFromWellKnownPhotoLibraryIdentifier();
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("Library identifier: %@\n\nPhoto library was rebuilt at %@\n"), v57, v66);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = v58;
      if (v13)
        objc_msgSend(v58, "appendFormat:", CFSTR("Last force rebuild date and reason: %@"), v73);
      else
        objc_msgSend(v58, "appendFormat:", CFSTR("Migration error: %@"), v20);
      +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Photo Library Rebuild Detected"), CFSTR("Your photo library has experienced an unexpected state, please file a Radar against Photos to diagnose the issue"), v55, v59);

      v11 = v68;
    }
    goto LABEL_58;
  }
  v76 = 0;
  v25 = objc_msgSend(a1, "_openAndMigrateStoreWithURL:options:coordinator:modelMigrator:migrationPolicy:error:", v18, v19, v11, v12, v7, &v76);
  v26 = (__CFString *)v76;
  v20 = v26;
  if (v25 != 4)
    goto LABEL_59;
  -[__CFString domain](v26, "domain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0D74498]);

  v18 = v72;
  if (!v28)
    goto LABEL_62;
  if (-[__CFString code](v20, "code") == 46007)
    goto LABEL_63;
  if (-[__CFString code](v20, "code") == 46009)
  {
    if (PLIsErrorSQLiteDiskFull())
    {
      PLMigrationGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v80 = v20;
        _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Disk full error, do not attempt rebuild, error: %@", buf, 0xCu);
      }

      goto LABEL_63;
    }
    goto LABEL_62;
  }
  if ((v7 & 4) == 0)
  {
    MEMORY[0x19AEC04BC]();
    goto LABEL_62;
  }
  if (-[__CFString code](v20, "code") == 46008 || -[__CFString code](v20, "code") == 46013)
  {
    PLMigrationGetLog();
    v62 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
LABEL_72:

      goto LABEL_9;
    }
    -[__CFString code](v20, "code");
    NSStringFromPLErrorCode();
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v80 = v63;
    v81 = 2112;
    v82 = v20;
    v64 = "Will attempt rebuild after lightweight migration failed with %{public}@ error %@";
LABEL_71:
    _os_log_impl(&dword_199541000, v62, OS_LOG_TYPE_ERROR, v64, buf, 0x16u);

    goto LABEL_72;
  }
  if (MEMORY[0x19AEC04BC]() && -[__CFString code](v20, "code") == 46006)
  {
    PLMigrationGetLog();
    v62 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      goto LABEL_72;
    -[__CFString code](v20, "code");
    NSStringFromPLErrorCode();
    v63 = (__CFString *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v80 = v63;
    v81 = 2112;
    v82 = v20;
    v64 = "(INTERNALONLY) Will attempt rebuild after lightweight migration failed due to model inversion (%{public}@) %@";
    goto LABEL_71;
  }
LABEL_62:
  if ((v7 & 2) != 0)
    goto LABEL_9;
LABEL_63:
  if (v70)
  {
    v20 = objc_retainAutorelease(v20);
    *v70 = v20;
  }
  v25 = 4;
LABEL_66:

  return v25;
}

+ (void)getPersistentStoreURL:(id *)a3 options:(id *)a4 forDatabasePath:(id)a5
{
  objc_msgSend(a1, "_getPersistentStoreURL:options:forDatabasePath:enableOrderKeyNotifications:", a3, a4, a5, 0);
}

+ (int)librarySchemaVersionWithPathManager:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__286;
  v23 = __Block_byref_object_dispose__287;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__286;
  v17 = __Block_byref_object_dispose__287;
  v18 = 0;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "photosDatabasePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PLPersistentContainer_librarySchemaVersionWithPathManager_error___block_invoke;
  v12[3] = &unk_1E365FB50;
  v12[4] = &v13;
  v12[5] = &v19;
  objc_msgSend(v6, "getConfigurationForDatabasePath:withBlock:", v7, v12);

  v8 = (void *)v14[5];
  if (!v8)
  {
    if (a4)
    {
      *a4 = objc_retainAutorelease((id)v20[5]);
      v8 = (void *)v14[5];
    }
    else
    {
      v8 = 0;
    }
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("PLModelVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v10;
}

+ (BOOL)currentModelVersionMatchesLibrarySchemaVersionWithPathManager:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v5 = objc_msgSend(a1, "librarySchemaVersionWithPathManager:error:", a3, &v22);
  v6 = v22;
  v7 = v6;
  if (!(_DWORD)v5)
  {
    if (a4)
    {
      v9 = 0;
      *a4 = objc_retainAutorelease(v6);
      goto LABEL_13;
    }
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  v8 = +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion");
  if ((_DWORD)v5 != (_DWORD)v8)
  {
    if ((int)v5 <= (int)v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Your library needs reconfiguration.\n\nPlease install the latest app version via Xcode (copy to device), or installing a root.\n\nYou can also go to Settings › Photos › Repair Photos Library.\n\n(Library schema %d needs upgrade to %d.)"), v5, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0D74498];
      v23 = *MEMORY[0x1E0CB2938];
      v24 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v17;
      v15 = v18;
      v16 = 46007;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Your library needs reconfiguration. This usually happens if you install an older OS build on top of a newer one.\n\nPlease install the latest app version via Xcode (copy to device), or install a newer root.\n\nYou can also go to Settings › Photos › Repair Photos Library. Doing this will require reprocessing your photos which might take a while.\n\n(Schema inversion: library (%d) newer than runtime (%d).)"), v5, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D74498];
      v25 = *MEMORY[0x1E0CB2938];
      v26[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v11;
      v15 = v12;
      v16 = 46006;
    }
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a4)
      *a4 = objc_retainAutorelease(v19);

    goto LABEL_12;
  }
  v9 = 1;
LABEL_13:

  return v9;
}

void __67__PLPersistentContainer_librarySchemaVersionWithPathManager_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[3];
  _QWORD v22[3];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *MEMORY[0x1E0C979E8];
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0C97C00], "metadataForPersistentStoreOfType:URL:options:error:", v6, v5, a3, &v20);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v20;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Store metadata read failure: %@", buf, 0xCu);
    }

    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D74498];
    v14 = *MEMORY[0x1E0CB3388];
    v21[0] = *MEMORY[0x1E0CB2938];
    v21[1] = v14;
    v22[0] = CFSTR("Store metadata read failure");
    v22[1] = v8;
    v21[2] = *MEMORY[0x1E0CB2AA0];
    objc_msgSend(v5, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 46009, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

void __55__PLPersistentContainer_unsafeRemoveManagedObjectModel__block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  PLMigrationGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_199541000, v0, OS_LOG_TYPE_ERROR, "Removing shared managedObjectModel", v2, 2u);
  }

  v1 = (void *)sSharedModel;
  sSharedModel = 0;

}

@end
