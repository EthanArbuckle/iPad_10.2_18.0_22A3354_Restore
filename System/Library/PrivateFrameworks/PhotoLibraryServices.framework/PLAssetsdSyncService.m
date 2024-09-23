@implementation PLAssetsdSyncService

- (PLAssetsdSyncService)initWithLibraryServicesManager:(id)a3
{
  id v4;
  PLAssetsdSyncService *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *isolationQueue;
  dispatch_group_t v8;
  OS_dispatch_group *updateGroup;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdSyncService;
  v5 = -[PLAbstractLibraryServicesManagerService initWithLibraryServicesManager:](&v11, sel_initWithLibraryServicesManager_, v4);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.private.photos.service.sync", 0);
    isolationQueue = v5->_isolationQueue;
    v5->_isolationQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_group_create();
    updateGroup = v5->_updateGroup;
    v5->_updateGroup = (OS_dispatch_group *)v8;

    objc_storeWeak((id *)&v5->_libraryServicesManager, v4);
  }

  return v5;
}

- (void)updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  const char *Name;
  __int128 v14;
  char v15;
  __int128 v16;
  SEL sel[2];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v5 = a5;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16 = 0u;
  *(_OWORD *)sel = 0u;
  v14 = 0u;
  v10 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v14) = v10;
  if (v10)
  {
    *((_QWORD *)&v14 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: updateRestoredAssetWithUUID:paths:fixAddedDate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  -[PLAssetsdSyncService _updateRestoredAssetWithUUID:paths:fixAddedDate:](self, "_updateRestoredAssetWithUUID:paths:fixAddedDate:", v8, v9, v5, (_QWORD)v14);
  if (v15)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  if ((_QWORD)v16)
  {
    PLRequestGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v12, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)finalizeOTARestoreRecreatingAlbums:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSObject *v6;
  NSObject *v7;
  const char *Name;
  __int128 v9;
  char v10;
  __int128 v11;
  SEL sel[2];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  *(_OWORD *)sel = 0u;
  v9 = 0u;
  v5 = objc_msgSend(MEMORY[0x1E0D73338], "enabled", 0);
  LOBYTE(v9) = v5;
  if (v5)
  {
    *((_QWORD *)&v9 + 1) = _os_activity_create(&dword_199541000, "PLXPC Service: finalizeOTARestoreRecreatingAlbums:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  -[PLAssetsdSyncService _finalizeOTARestoreEndedAndRecreateAlbums:](self, "_finalizeOTARestoreEndedAndRecreateAlbums:", v3, (_QWORD)v9);
  if (v10)
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  if ((_QWORD)v11)
  {
    PLRequestGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }

  }
}

- (void)_finalizeOTARestoreEndedAndRecreateAlbums:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  uint8_t buf[4];
  const __CFString *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (v3)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "_finalizeOTARestoreEndedAndRecreateAlbums: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLAssetsdSyncService _finalizeOTARestoreEndedAndRecreateAlbums:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7;
  pl_dispatch_group_async();

}

- (void)_updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLAssetsdSyncService _updateRestoredAssetWithUUID:paths:fixAddedDate:]");
  v11 = v6;
  v12 = v7;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  v9 = v7;
  v10 = v6;
  pl_dispatch_group_async();
  pl_dispatch_group_notify();

}

- (void)_updatePendingCountForMissingAsset:(id)a3 inLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(v5, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathToAssetsToAlbumsMapping");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v12 = "Error: Did not find the assets to albums mapping file.";
LABEL_10:
    v13 = v11;
    v14 = 2;
    goto LABEL_11;
  }
  if (!objc_msgSend(v9, "count"))
  {
    PLMigrationGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v12 = "Error: The assests to albums mappings is empty.";
    goto LABEL_10;
  }
  objc_msgSend(v9, "objectForKey:", v27);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_13;
  PLMigrationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v27;
    v12 = "Error: did not find the list of albums asset %@ is associated with";
    v13 = v11;
    v14 = 12;
LABEL_11:
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
  }
LABEL_12:

  v10 = 0;
LABEL_13:
  if (objc_msgSend(v10, "count"))
  {
    v25 = v10;
    v26 = v9;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v5, "albumWithUuid:", v20, v25, v26);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            objc_msgSend(v21, "reducePendingItemsCountBy:", 1);
          }
          else
          {
            PLMigrationGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v33 = v20;
              v34 = 2112;
              v35 = v27;
              _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Error: Failed  to find the album %@, which asset %@ supposedly belongs to", buf, 0x16u);
            }

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v17);
    }

    v10 = v25;
    v9 = v26;
  }
  objc_msgSend(v5, "otaRestoreProgressAlbum", v25, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "reducePendingItemsCountBy:", 1);

}

- (void)_linkPathsAside:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  __int128 v16;
  id obj;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412546;
    v16 = v6;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("aside"), v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v11;
        v14 = objc_msgSend(v4, "linkItemAtPath:toPath:error:", v12, v13, &v18);
        v8 = v18;

        if ((v14 & 1) == 0)
        {
          PLMigrationGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v16;
            v24 = v12;
            v25 = 2112;
            v26 = v8;
            _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Error: could not link path %@ aside, error: %@", buf, 0x16u);
          }

        }
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);

  }
}

- (void)_recoverAsideFiles:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v6 = 138412546;
    v17 = v6;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("aside"), v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v11;
        v14 = objc_msgSend(v4, "moveItemAtPath:toPath:error:", v13, v12, &v19);
        v8 = v19;

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v12, "stringByAppendingPathExtension:", CFSTR("aside"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "removeItemAtPath:error:", v15, 0);

          PLMigrationGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v17;
            v25 = v12;
            v26 = 2112;
            v27 = v8;
            _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Error: could not move from aside to path %@, error: %@", buf, 0x16u);
          }

        }
        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);

  }
}

- (void)_cleanupAlbumMetadataAsideFilesAfterRestore
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v24 = v6;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0C99A90];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99A90]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v7;
    objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v9, 0, &__block_literal_global_50392);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
          v25 = 0;
          v17 = objc_msgSend(v16, "getResourceValue:forKey:error:", &v25, v8, 0);
          v18 = v25;
          v19 = v18;
          if (v17 && objc_msgSend(v18, "length"))
          {
            objc_msgSend(v16, "pathExtension");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20 && objc_msgSend(v20, "isEqualToString:", CFSTR("aside")))
              objc_msgSend(v3, "removeItemAtURL:error:", v16, 0);

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v13);
    }

    v22 = v23;
    v6 = v24;
  }
  else
  {
    PLMigrationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "_cleanupAlbumMetadataAsideFilesAfterRestore: albumsMetadataPath is nil, returning", buf, 2u);
    }
  }

}

- (id)_fileRestoreExclusionPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoDirectoryWithType:", 9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(v3, "photoDirectoryWithType:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "addObject:", v6);

  return v4;
}

- (id)_readRestoreAlbumMetadataForAlbum:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PLPersistedAlbumMetadata *v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stringByAppendingPathExtension:", CFSTR("albummetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("aside"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E98];
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:isDirectory:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v12, "fileExistsAtPath:", v13);

  if ((v9 & 1) != 0)
  {
    v14 = -[PLPersistedAlbumMetadata initWithPersistedDataAtURL:]([PLPersistedAlbumMetadata alloc], "initWithPersistedDataAtURL:", v11);
  }
  else
  {
    PLMigrationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138412290;
      v18 = v11;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Restore album metadata file %@ doesn't exist!!!!", (uint8_t *)&v17, 0xCu);
    }

    v14 = 0;
  }

  return v14;
}

- (void)_addAsset:(id)a3 toAlbumsForUUID:(id)a4 inLibrary:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  PLAssetsdSyncService *v61;
  uint64_t v62;
  id v63;
  id obj;
  id v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  int v73;
  uint8_t buf[4];
  id v75;
  __int16 v76;
  void *v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v65 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C99E08];
  v61 = self;
  -[PLAbstractLibraryServicesManagerService libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathToAssetsToAlbumsMapping");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithContentsOfFile:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v17 = "Error: Did not find the assets to albums mapping file.";
LABEL_10:
    v18 = v16;
    v19 = 2;
    goto LABEL_11;
  }
  if (!objc_msgSend(v14, "count"))
  {
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_WORD *)buf = 0;
    v17 = "Error: The assests to albums mappings is empty.";
    goto LABEL_10;
  }
  objc_msgSend(v14, "objectForKey:", v65);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v75 = v65;
      v17 = "Error: did not find the list of albums asset %@ is associated with";
      v18 = v16;
      v19 = 12;
LABEL_11:
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    }
LABEL_12:

    v15 = 0;
  }
  objc_msgSend(v8, "pathForOriginalFile");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByDeletingLastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  +[PLModelMigrator shouldImportAssetsFromDCIMSubDirectoryAtURL:assetsKind:](PLModelMigrator, "shouldImportAssetsFromDCIMSubDirectoryAtURL:assetsKind:", v22, &v73);
  if (v73 == 1)
  {
    objc_msgSend(v9, "allImportedPhotosAlbumCreateIfNeeded:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      goto LABEL_16;
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __60__PLAssetsdSyncService__addAsset_toAlbumsForUUID_inLibrary___block_invoke;
    v71[3] = &unk_1E3677AA0;
    v24 = v9;
    v72 = v24;
    objc_msgSend(v24, "performTransactionAndWait:", v71);
    objc_msgSend(v24, "allImportedPhotosAlbumCreateIfNeeded:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
LABEL_16:
      objc_msgSend(v23, "mutableAssets");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v8);

    }
  }
  if (+[PLAvalanche shouldOnlyShowAvalanchePicks](PLAvalanche, "shouldOnlyShowAvalanchePicks")
    && objc_msgSend(v8, "isPartOfBurst")
    && (objc_msgSend(v8, "avalanchePickTypeIsVisible") & 1) == 0)
  {
    objc_msgSend(v8, "setVisibilityState:", 2);

    v15 = 0;
  }
  if (objc_msgSend(v15, "count"))
  {
    v55 = v22;
    v56 = v21;
    v57 = v15;
    v58 = v14;
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v15;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v68;
      v63 = v8;
      v59 = *(_QWORD *)v68;
      v60 = v9;
      do
      {
        v29 = 0;
        v62 = v27;
        do
        {
          if (*(_QWORD *)v68 != v28)
            objc_enumerationMutation(obj);
          v30 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v29);
          objc_msgSend(v9, "albumWithUuid:", v30, v55, v56, v57, v58);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v31;
          if (v31)
          {
            if (objc_msgSend(v31, "kindValue") == 1000)
            {
              objc_msgSend(v32, "mutableAssets");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "count");

              objc_msgSend(v32, "mutableAssets");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, v34, 1024, &__block_literal_global_62_50381);

              if (v36 == 0x7FFFFFFFFFFFFFFFLL)
                v37 = v34;
              else
                v37 = v36;
              objc_msgSend(v32, "mutableAssets");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "insertObject:atIndex:", v8, v37);

              objc_msgSend(v32, "reducePendingItemsCountBy:", 1);
            }
            else
            {
              -[PLAssetsdSyncService _readRestoreAlbumMetadataForAlbum:](v61, "_readRestoreAlbumMetadataForAlbum:", v30);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "assetUUIDs");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "count");

              objc_msgSend(v32, "mutableAssets");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v44 = objc_msgSend(v43, "count");

              if (v42)
              {
                v45 = 0;
                v46 = 1;
                while (1)
                {
                  if (v45 == v44)
                  {
                    v45 = v44;
                    goto LABEL_46;
                  }
                  objc_msgSend(v66, "assetUUIDs");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectAtIndex:", v46 - 1);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v32, "mutableAssets");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v49, "objectAtIndex:", v45);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "uuid");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v48, "isEqual:", v65))
                    break;
                  v52 = objc_msgSend(v48, "isEqual:", v51);

                  if (v46 < v42)
                  {
                    v45 += v52;
                    ++v46;
                    if (v45 <= v44)
                      continue;
                  }
                  goto LABEL_48;
                }

LABEL_46:
                v8 = v63;
              }
              else
              {
                v45 = v44;
              }
              objc_msgSend(v32, "mutableAssets");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "insertObject:atIndex:", v8, v45);

              objc_msgSend(v32, "reducePendingItemsCountBy:", 1);
LABEL_48:

              v27 = v62;
              v8 = v63;
              v28 = v59;
              v9 = v60;
            }
          }
          else
          {
            PLMigrationGetLog();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v8, "uuid");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v75 = v30;
              v76 = 2112;
              v77 = v40;
              _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Error: Failed  to find the album %@, which asset %@ supposedly belongs to", buf, 0x16u);

            }
          }

          ++v29;
        }
        while (v29 != v27);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v78, 16);
      }
      while (v27);
    }

    v15 = v57;
    v14 = v58;
    v22 = v55;
    v21 = v56;
  }
  objc_msgSend(v9, "otaRestoreProgressAlbum", v55, v56, v57, v58);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "reducePendingItemsCountBy:", 1);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_libraryTransaction, 0);
  objc_storeStrong((id *)&self->_updateGroup, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

id __60__PLAssetsdSyncService__addAsset_toAlbumsForUUID_inLibrary___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "allImportedPhotosAlbumCreateIfNeeded:", 1);
}

uint64_t __60__PLAssetsdSyncService__addAsset_toAlbumsForUUID_inLibrary___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateCreated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __67__PLAssetsdSyncService__cleanupAlbumMetadataAsideFilesAfterRestore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLMigrationGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate '%@': %@", (uint8_t *)&v9, 0x16u);

  }
  return 1;
}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;
  os_activity_scope_state_s state;

  v2 = _os_activity_create(&dword_199541000, "Executing isolation queue block", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  v3 = *(_QWORD **)(a1 + 32);
  if (!v3[4])
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLAssetsdSyncService _updateRestoredAssetWithUUID:paths:fixAddedDate:]_block_invoke");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v4;

    v3 = *(_QWORD **)(a1 + 32);
  }
  v7 = (void *)objc_msgSend(v3, "newShortLivedLibraryWithName:", "-[PLAssetsdSyncService _updateRestoredAssetWithUUID:paths:fixAddedDate:]_block_invoke");
  v8 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_2;
  v13[3] = &unk_1E366BA58;
  v14 = v8;
  v10 = v7;
  v15 = v10;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v16 = v11;
  v17 = v12;
  v18 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v10, "withDispatchGroup:performTransaction:", v9, v13);
  objc_msgSend(*(id *)(a1 + 56), "stillAlive");

  os_activity_scope_leave(&state);
}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  os_activity_scope_state_s v5;

  v2 = _os_activity_create(&dword_199541000, "dispatch_group_notify block invoke", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v2, &v5);
  if (!dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 24), 0))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    if (v4)
    {
      *(_QWORD *)(v3 + 32) = 0;

    }
  }
  os_activity_scope_leave(&v5);

}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_2(id *a1)
{
  id *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  int v20;
  NSObject *v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t i;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id v50;
  id v51;
  void *v52;
  NSObject *v53;
  id v54;
  NSObject *v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  const __CFString *v62;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  int v69;
  uint64_t j;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  _BOOL4 v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t k;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t m;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  id v108;
  void *v110;
  uint64_t v111;
  void *v112;
  id v113;
  uint64_t v114;
  id obj;
  NSObject *obja;
  void *v117;
  uint64_t v118;
  id v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  uint8_t v146[128];
  uint8_t buf[4];
  uint64_t v148;
  __int16 v149;
  _BYTE v150[18];
  _BYTE v151[128];
  uint64_t v152;

  v1 = a1;
  v152 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "length"))
  {
    +[PLManagedAsset assetWithUUID:inLibrary:](PLManagedAsset, "assetWithUUID:inLibrary:", v1[4], v1[5]);
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(v1[5], "libraryServicesManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "modelMigrator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceRestoreMigrationSupport");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isRestoreFromBackupSourceMegaBackup");

      if ((_DWORD)v7)
      {
        objc_msgSend(v3, "objectIDsForRelationshipNamed:", CFSTR("master"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
        {
          PLMigrationGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            v11 = v1[4];
            *(_DWORD *)buf = 138543362;
            v148 = (uint64_t)v11;
            _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: Mega-backup: Asset with UUID %{public}@ has a CloudMaster, skipping", buf, 0xCu);
          }

          objc_msgSend(v3, "setComplete:", 1);
          objc_msgSend(v3, "filePathsWithoutThumbs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(v13, "addObjectsFromArray:", v1[6]);
          objc_msgSend(v1[7], "libraryServicesManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "modelMigrator");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "allObjects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "applyDataProtectionToPhotosPaths:fromKeyClass:toKeyClass:", v16, 4, 3);

          v17 = 0;
          goto LABEL_110;
        }
      }
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v1[4];
        v23 = v1[6];
        *(_DWORD *)buf = 138543874;
        v148 = (uint64_t)v22;
        v149 = 1024;
        *(_DWORD *)v150 = v7;
        *(_WORD *)&v150[4] = 2112;
        *(_QWORD *)&v150[6] = v23;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: Restoring asset with UUID %{public}@, isMegaBackup: %d, restored paths: %@", buf, 0x1Cu);
      }

      objc_msgSend(v3, "persistedFileSystemAttributesFileURL");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!+[PLManagedAsset hasRequiredExtendedAttributesForMainFileURL:](PLManagedAsset, "hasRequiredExtendedAttributesForMainFileURL:", v24))
      {
        PLMigrationGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v148 = v24;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "updateRestoredAsset: ERROR - missing required extended attributes for file at URL: %@", buf, 0xCu);
        }

      }
      v117 = (void *)v24;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "sidecars");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "count") + 1;
      v29 = objc_msgSend(v1[6], "count");

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28 <= v29)
      {
        objc_msgSend(v3, "setComplete:", 1);
        objc_msgSend(v1[7], "libraryServicesManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "modelMigrator");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "postProcessFixesAfterOTARestoreForCompleteAsset:fixAddedDate:isMegaBackup:", v3, *((unsigned __int8 *)v1 + 64), v7);

        objc_msgSend(v3, "filePathsWithoutThumbs");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)objc_msgSend(v40, "mutableCopy");

        objc_msgSend(v41, "addObjectsFromArray:", v1[6]);
        objc_msgSend(v1[7], "libraryServicesManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "modelMigrator");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "allObjects");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "applyDataProtectionToPhotosPaths:fromKeyClass:toKeyClass:", v44, 4, 3);

        objc_msgSend(v1[7], "_addAsset:toAlbumsForUUID:inLibrary:", v3, v1[4], v1[5]);
        +[PLChangeNotificationCenter forceFetchingAlbumReload](PLChangeNotificationCenter, "forceFetchingAlbumReload");
        v17 = 0;
        v45 = v117;
      }
      else
      {
        v106 = v3;
        objc_msgSend(v3, "filePathsWithoutThumbs");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v139 = 0u;
        v140 = 0u;
        v141 = 0u;
        v142 = 0u;
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v140;
          v35 = 1;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v140 != v34)
                objc_enumerationMutation(v31);
              v37 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * i);
              if (objc_msgSend(v26, "fileExistsAtPath:", v37))
              {
                v35 &= objc_msgSend(v37, "rangeOfString:options:", CFSTR(".XMP"), 1) != 0x7FFFFFFFFFFFFFFFLL;
                objc_msgSend(v30, "addObject:", v37);
              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v139, v151, 16);
          }
          while (v33);
        }
        else
        {
          v35 = 1;
        }

        v46 = (void *)MEMORY[0x1E0C99E20];
        v3 = v106;
        objc_msgSend(v106, "filePathsWithoutThumbs");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setWithSet:", v47);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v1 = a1;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a1[6]);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "minusSet:", v48);

        PLMigrationGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          v50 = a1[4];
          v51 = a1[6];
          *(_DWORD *)buf = 138412546;
          v148 = (uint64_t)v50;
          v149 = 2112;
          *(_QWORD *)v150 = v51;
          _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "updateRestoredAsset: Missing some expected paths for asset %@: %@", buf, 0x16u);
        }

        v45 = v117;
        if ((v35 & 1) != 0)
        {
          +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[UpdateRestoredAsset] No image information can be recovered (every file is XMP.)  Deleting."));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          PLMigrationGetLog();
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = a1[4];
            *(_DWORD *)buf = 138412290;
            v148 = (uint64_t)v54;
            _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: will expunge asset %@", buf, 0xCu);
          }

          objc_msgSend(v106, "deleteWithReason:", v52);
          objc_msgSend(a1[7], "_updatePendingCountForMissingAsset:inLibrary:", a1[4], a1[5]);

          v17 = 0;
        }
        else
        {
          objc_msgSend(a1[7], "_linkPathsAside:", v30);
          PLMigrationGetLog();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = a1[4];
            v57 = a1[6];
            *(_DWORD *)buf = 138412546;
            v148 = (uint64_t)v56;
            v149 = 2112;
            *(_QWORD *)v150 = v57;
            _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: attempting to reimport asset %@ with incomplete restore paths %@", buf, 0x16u);
          }

          PLMigrationGetLog();
          v58 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            v59 = a1[4];
            *(_DWORD *)buf = 138412290;
            v148 = (uint64_t)v59;
            _os_log_impl(&dword_199541000, v58, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: deleting existing asset data from db only asset %@", buf, 0xCu);
          }

          objc_msgSend(v106, "deleteFromDatabaseOnly");
          objc_msgSend(a1[7], "_recoverAsideFiles:", v30);
          v17 = v30;
        }
      }

      v20 = 0;
      goto LABEL_41;
    }
  }
  v18 = objc_msgSend(v1[6], "count");
  v17 = 0;
  v3 = 0;
  v19 = 0;
  v20 = 1;
  if (!v18)
  {
LABEL_41:
    v60 = objc_msgSend(v17, "count");
    v19 = v17;
    if (!v60)
      goto LABEL_105;
  }
  v104 = v19;
  PLMigrationGetLog();
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    v62 = CFSTR("Reimporting partially restored");
    v63 = v1[4];
    v64 = v1[6];
    if (v20)
      v62 = CFSTR("Failed to fetch");
    *(_DWORD *)buf = 138412802;
    v148 = (uint64_t)v62;
    v149 = 2112;
    *(_QWORD *)v150 = v63;
    *(_WORD *)&v150[8] = 2112;
    *(_QWORD *)&v150[10] = v64;
    _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_DEFAULT, "updateRestoredAsset: %@ asset with UUID %@, will attempt import with restored paths: %@", buf, 0x20u);
  }

  objc_msgSend(v1[7], "_fileRestoreExclusionPaths");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v65 = v1[6];
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v135, v146, 16);
  if (!v66)
  {

    goto LABEL_72;
  }
  v67 = v66;
  v118 = *(_QWORD *)v136;
  v68 = 1;
  v69 = 1;
  obj = v65;
  do
  {
    for (j = 0; j != v67; ++j)
    {
      if (*(_QWORD *)v136 != v118)
        objc_enumerationMutation(obj);
      v71 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * j);
      v134 = 0;
      objc_msgSend(MEMORY[0x1E0D73208], "realPathForPath:error:", v71, &v134, v104);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = v134;
      if (v72)
      {
        objc_msgSend(v72, "pathExtension");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "caseInsensitiveCompare:", CFSTR("XMP")) == 0;

        v69 &= v75;
        if ((v68 & 1) == 0)
        {
          v68 = 0;
          goto LABEL_67;
        }
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v76 = v110;
        v77 = -[NSObject countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v130, v145, 16);
        if (v77)
        {
          v78 = v77;
          v79 = *(_QWORD *)v131;
          while (2)
          {
            for (k = 0; k != v78; ++k)
            {
              if (*(_QWORD *)v131 != v79)
                objc_enumerationMutation(v76);
              if ((objc_msgSend(MEMORY[0x1E0D73208], "filePath:hasPrefix:", v72, *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * k)) & 1) != 0)
              {
                v68 = 1;
                goto LABEL_66;
              }
            }
            v78 = -[NSObject countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v130, v145, 16);
            if (v78)
              continue;
            break;
          }
        }
        v68 = 0;
      }
      else
      {
        PLMigrationGetLog();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v148 = (uint64_t)v71;
          v149 = 2112;
          *(_QWORD *)v150 = v73;
          _os_log_impl(&dword_199541000, v76, OS_LOG_TYPE_ERROR, "Couldn't resolve realpath for path: %@, error: %@", buf, 0x16u);
        }
      }
LABEL_66:

LABEL_67:
    }
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v146, 16);
  }
  while (v67);

  v1 = a1;
  if (((v69 | v68) & 1) == 0)
  {
    v17 = a1[6];
    v81 = v104;
    goto LABEL_104;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v104);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = 0u;
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v108 = v1[6];
  v82 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
  if (v82)
  {
    v83 = v82;
    v111 = *(_QWORD *)v127;
    do
    {
      v84 = 0;
      v107 = v83;
      do
      {
        if (*(_QWORD *)v127 != v111)
          objc_enumerationMutation(v108);
        v85 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v84);
        v125 = 0;
        objc_msgSend(MEMORY[0x1E0D73208], "realPathForPath:error:", v85, &v125);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = v125;
        v88 = v87;
        if (v86)
        {
          v113 = v87;
          v114 = v84;
          objc_msgSend(v86, "pathExtension");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = objc_msgSend(v89, "caseInsensitiveCompare:", CFSTR("XMP"));

          objc_msgSend(a1[5], "pathManager");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "photoDirectoryWithType:", 4);
          obja = objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1[5], "pathManager");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "photoDirectoryWithType:", 28);
          v93 = objc_claimAutoreleasedReturnValue();

          v112 = (void *)v93;
          if (!v90
            && ((objc_msgSend(MEMORY[0x1E0D73208], "filePath:hasPrefix:", v86, obja) & 1) != 0
             || objc_msgSend(MEMORY[0x1E0D73208], "filePath:hasPrefix:", v86, v93)))
          {
            PLMigrationGetLog();
            v101 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v148 = (uint64_t)v86;
              _os_log_impl(&dword_199541000, v101, OS_LOG_TYPE_DEFAULT, "Deleting XMP restore file at path: %@", buf, 0xCu);
            }

            objc_msgSend(v81, "removeItemAtPath:error:", v86, 0);
          }
          else
          {
            v123 = 0u;
            v124 = 0u;
            v121 = 0u;
            v122 = 0u;
            v94 = v110;
            v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v121, v143, 16);
            if (v95)
            {
              v96 = v95;
              v97 = *(_QWORD *)v122;
              do
              {
                for (m = 0; m != v96; ++m)
                {
                  if (*(_QWORD *)v122 != v97)
                    objc_enumerationMutation(v94);
                  if (objc_msgSend(MEMORY[0x1E0D73208], "filePath:hasPrefix:", v86, *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * m)))
                  {
                    PLBackendGetLog();
                    v99 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v148 = (uint64_t)v86;
                      _os_log_impl(&dword_199541000, v99, OS_LOG_TYPE_DEFAULT, "Deleting excluded restore file at path: %@", buf, 0xCu);
                    }

                    objc_msgSend(v81, "removeItemAtPath:error:", v86, 0);
                  }
                }
                v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v121, v143, 16);
              }
              while (v96);
            }

            v83 = v107;
          }
          v88 = v113;
          v84 = v114;

          v100 = obja;
        }
        else
        {
          PLMigrationGetLog();
          v100 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v148 = (uint64_t)v85;
            v149 = 2112;
            *(_QWORD *)v150 = v88;
            _os_log_impl(&dword_199541000, v100, OS_LOG_TYPE_ERROR, "Couldn't resolve realpath for path: %@, error: %@", buf, 0x16u);
          }
        }

        ++v84;
      }
      while (v84 != v83);
      v83 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
    }
    while (v83);
  }

  v1 = a1;
  if (objc_msgSend(a1[4], "length"))
    objc_msgSend(a1[7], "_updatePendingCountForMissingAsset:inLibrary:", a1[4], a1[5]);
  v17 = 0;
LABEL_104:

LABEL_105:
  if (objc_msgSend(v17, "count"))
  {
    v119 = v1[5];
    v17 = v17;
    v120 = v1[4];
    pl_dispatch_group_async();

  }
  else
  {
    PLMigrationGetLog();
    v102 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
    {
      v103 = v1[4];
      *(_DWORD *)buf = 138543362;
      v148 = (uint64_t)v103;
      _os_log_impl(&dword_199541000, v102, OS_LOG_TYPE_ERROR, "Failed to restore asset %{public}@. No valid paths to import", buf, 0xCu);
    }

  }
LABEL_110:

}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_44(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_2_45;
  v6[3] = &unk_1E366BA30;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v11 = *(_BYTE *)(a1 + 64);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "performFileSystemAssetImporterWorkWithLibrary:block:", v4, v6);

}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_2_45(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  char v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_3;
  v9[3] = &unk_1E3671710;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  v12 = v3;
  v15 = *(_BYTE *)(a1 + 64);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 32);
  v8 = v3;
  objc_msgSend(v4, "withDispatchGroup:performTransaction:", v5, v9);

}

void __72__PLAssetsdSyncService__updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modelMigrator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applyDataProtectionToPhotosPaths:fromKeyClass:toKeyClass:", *(_QWORD *)(a1 + 32), 4, 3);

  objc_msgSend(*(id *)(a1 + 48), "addAssetWithURLs:assetPayload:forceInsert:forceUpdate:fixAddedDate:", v3, 0, 1, 0, *(unsigned __int8 *)(a1 + 72));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(a1 + 40);
  if (v12)
  {
    objc_msgSend(v13, "_addAsset:toAlbumsForUUID:inLibrary:", v12, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v18 = 0;
    v14 = +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v12, 1, 0, &v18);
    v15 = v18;
    if (!v14)
    {
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v24 = v17;
        v25 = 2112;
        v26 = v15;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to build modern resources for asset uuid: %@, reason: %@", buf, 0x16u);

      }
    }

  }
  else
  {
    objc_msgSend(v13, "_updatePendingCountForMissingAsset:inLibrary:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

  objc_autoreleasePoolPop(v2);
}

void __66__PLAssetsdSyncService__finalizeOTARestoreEndedAndRecreateAlbums___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  char v13;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = _os_activity_create(&dword_199541000, "Executing isolation queue block", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 48))
  {
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_BYTE *)(a1 + 48))
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      *(_DWORD *)buf = 138543362;
      v16 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring redundant call to _finalizeOTARestoreEndedAndRecreateAlbums: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    *(_BYTE *)(v3 + 48) = 1;
    v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "newShortLivedLibraryWithName:", "-[PLAssetsdSyncService _finalizeOTARestoreEndedAndRecreateAlbums:]_block_invoke");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__PLAssetsdSyncService__finalizeOTARestoreEndedAndRecreateAlbums___block_invoke_2;
    v10[3] = &unk_1E3675C80;
    v4 = v6;
    v11 = v4;
    v13 = *(_BYTE *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    -[NSObject withDispatchGroup:performTransaction:](v4, "withDispatchGroup:performTransaction:", v7, v10);
    objc_msgSend(*(id *)(a1 + 32), "_cleanupAlbumMetadataAsideFilesAfterRestore");
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelMigrator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applyDataProtectionToAllPhotosFilesOnce");

  }
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  os_activity_scope_leave(&state);

}

uint64_t __66__PLAssetsdSyncService__finalizeOTARestoreEndedAndRecreateAlbums___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cleanupIncompleteAssetsAfterOTARestore");
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "recreateAlbumsAndPersonsFromMetadata");
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

@end
