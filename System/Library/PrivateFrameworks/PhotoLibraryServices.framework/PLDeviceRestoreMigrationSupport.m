@implementation PLDeviceRestoreMigrationSupport

- (id)_newShortLivedLibrarySupportingLibraryOpenWithName:(const char *)a3
{
  PLPhotoLibraryOptions *v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  PLPhotoLibraryOptions *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(PLPhotoLibraryOptions);
  -[PLPhotoLibraryOptions setRequiredState:](v5, "setRequiredState:", -[PLLibraryServicesManager state](self->_libraryServicesManager, "state"));
  -[PLPhotoLibraryOptions setRefreshesAfterSave:](v5, "setRefreshesAfterSave:", 0);
  -[PLLibraryServicesManager libraryBundle](self->_libraryServicesManager, "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v7 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromBundle:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromBundle:options:error:", a3, v6, v5, &v16);
  v8 = v16;

  if (!v7)
  {
    v10 = v8;
    v11 = v5;
    PLLibraryServicesGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[PLPhotoLibraryOptions requiredState](v11, "requiredState");
      PLStringFromLibraryServicesState();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLLibraryServicesManager libraryBundle](self->_libraryServicesManager, "libraryBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446978;
      v18 = "-[PLDeviceRestoreMigrationSupport _newShortLivedLibrarySupportingLibraryOpenWithName:]";
      v19 = 2114;
      v20 = v13;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to load photo library %{public}s in state %{public}@ with url %@, %@", buf, 0x2Au);

    }
    __break(1u);
  }

  return v7;
}

- (PLDeviceRestoreMigrationSupport)initWithLibraryServicesManager:(id)a3
{
  id v5;
  PLDeviceRestoreMigrationSupport *v6;
  PLDeviceRestoreMigrationSupport *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLDeviceRestoreMigrationSupport;
  v6 = -[PLDeviceRestoreMigrationSupport init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryServicesManager, a3);
    *(_QWORD *)&v7->_userDataDisposition = 0;
    v7->_prerequisitesCompleteBlockLock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (BOOL)prepareDatabaseForOTARestoreIfNecessaryWithMigrationType:(int64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[8];
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  PLDeviceRestoreMigrationSupport *v21;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager modelMigrator](self->_libraryServicesManager, "modelMigrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postProcessingToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "needsToPrepareForBackgroundRestore");
  PLMigrationGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Found OTA post-processing token, will prepare for OTA background restore", (uint8_t *)&buf, 2u);
    }

    v8 = -[PLDeviceRestoreMigrationSupport _newShortLivedLibrarySupportingLibraryOpenWithName:](self, "_newShortLivedLibrarySupportingLibraryOpenWithName:", "-[PLDeviceRestoreMigrationSupport prepareDatabaseForOTARestoreIfNecessaryWithMigrationType:]");
    -[PLLibraryServicesManager modelMigrator](self->_libraryServicesManager, "modelMigrator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dontImportFileSystemDataIntoDatabaseWithPhotoLibrary:", v8);

    if ((unint64_t)a3 <= 4 && ((1 << a3) & 0x15) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v24 = 0x2020000000;
      v25 = 0;
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __92__PLDeviceRestoreMigrationSupport_prepareDatabaseForOTARestoreIfNecessaryWithMigrationType___block_invoke;
      v19 = &unk_1E3676EA0;
      v20 = v6;
      v21 = self;
      p_buf = &buf;
      pl_dispatch_once();
      if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        PLMigrationGetLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Already prepared database for OTA background restore, invalid token state returned YES from needsToPrepareForBackgroundRestore", v15, 2u);
        }

      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      PLMigrationGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        PLStringFromMigrationType(a3, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Writing OTA post-processing complete token, should prepare database for OTA restore with migration type %{public}@ returned NO (expected after creating new database)", (uint8_t *)&buf, 0xCu);

      }
      objc_msgSend(v6, "writeBackgroundRestorePostProcessingCompleteAndArchiveTokens");
    }
  }
  else if (v9)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "No OTA post-processing token found, no need to prepare for background restore", (uint8_t *)&buf, 2u);
  }

  return v7;
}

- (void)_prepareDatabaseForOTAAssetsPhase
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDeviceRestoreMigrationSupport.m"), 150, CFSTR("%@ can only be called from assetsd"), v21);

  }
  PLMigrationGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Starting _prepareDatabaseForOTAAssetsPhase", buf, 2u);
  }

  -[PLLibraryServicesManager modelMigrator](self->_libraryServicesManager, "modelMigrator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLLibraryServicesManager persistentStoreCoordinator](self->_libraryServicesManager, "persistentStoreCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContextForMigrationWithName:persistentStoreCoordinator:concurrencyType:", "-[PLDeviceRestoreMigrationSupport _prepareDatabaseForOTAAssetsPhase]", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __68__PLDeviceRestoreMigrationSupport__prepareDatabaseForOTAAssetsPhase__block_invoke;
  v26[3] = &unk_1E3677530;
  v26[4] = self;
  v9 = v7;
  v27 = v9;
  v10 = v8;
  v28 = v10;
  objc_msgSend(v9, "performBlockAndWait:", v26);
  -[PLLibraryServicesManager pathManager](self->_libraryServicesManager, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 100, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pathToAssetsToAlbumsMapping");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v14 = objc_msgSend(v12, "writeToFile:options:error:", v13, 1073741825, &v25);
  v15 = v25;

  if ((v14 & 1) == 0)
  {
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to write assetsToAlbums mapping %@", buf, 0xCu);
    }

  }
  -[PLDeviceRestoreMigrationSupport deletePhotoStreamData](self, "deletePhotoStreamData");
  PLMigrationGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Performing reset face analysis to force reanalysis of faceprint data after restore from iCloud", buf, 2u);
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __68__PLDeviceRestoreMigrationSupport__prepareDatabaseForOTAAssetsPhase__block_invoke_26;
  v22[3] = &unk_1E3677C18;
  v23 = v11;
  v24 = v9;
  v18 = v9;
  v19 = v11;
  objc_msgSend(v18, "performBlockAndWait:", v22);

}

- (void)deletePhotoStreamData
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", *MEMORY[0x1E0D74DF0], *MEMORY[0x1E0D74DB8]);
  -[PLLibraryServicesManager imageWriter](self->_libraryServicesManager, "imageWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enqueueJob:", v4);

}

- (void)_setAlbumPendingItemCountsWithContext:(id)a3 shouldSave:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PLGenericAlbum allAlbumsInManagedObjectContext:](PLManagedAlbum, "allAlbumsInManagedObjectContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "kindValue");
        if (v12 != 2 && v12 != 1000 && v12 != 12)
          continue;
        objc_msgSend(v11, "assets");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        objc_msgSend(v11, "setPendingItemsCount:", v15);
        objc_msgSend(v11, "setPendingItemsType:", 4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }
  if (v4)
  {
    if (objc_msgSend(v5, "hasChanges"))
    {
      v19 = 0;
      v16 = objc_msgSend(v5, "save:", &v19);
      v17 = v19;
      if ((v16 & 1) == 0)
      {
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v17;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "failed to save album pending counts: %@", buf, 0xCu);
        }

        objc_msgSend(v5, "rollback");
      }
    }
    else
    {
      v17 = 0;
    }

  }
}

- (void)_batchDeleteAllAssetsExcludedFromOTARestoreWithContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D73310];
  v4 = a3;
  objc_msgSend(v3, "predicateForIncludeMask:useIndex:", objc_msgSend(v3, "maskForAssetsExcludedFromOTARestore"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setPredicate:", v5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v8);
  objc_msgSend(v9, "setResultType:", 2);
  v15 = 0;
  objc_msgSend(v4, "executeRequest:error:", v9, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v15;
  PLMigrationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "result");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Deleted %{public}@ assets excluded from OTA backup/restore (iTunes synced, iCloud shared, etc)", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v11;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "batch delete of assets excluded from OTA restore failed, %@", buf, 0xCu);
  }

}

- (void)_setAssetsToOTARestoreAsIncompleteWithContext:(id)a3 populateAlbumMappings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  BOOL v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("complete != 0"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);
  v36[0] = CFSTR("albums");
  v36[1] = CFSTR("mediaAnalysisAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v12);

  objc_msgSend(v10, "setFetchBatchSize:", 100);
  v33 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v10, &v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v33;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      -[PLLibraryServicesManager modelMigrator](self->_libraryServicesManager, "modelMigrator");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "generatePathToAssetUUIDRecoveryMapping");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLLibraryServicesManager modelMigrator](self->_libraryServicesManager, "modelMigrator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "archiveAssetUUIDForPathPlist:", v17);

    }
    v19 = -[PLDeviceRestoreMigrationSupport isRestoreFromBackupSourceMegaBackup](self, "isRestoreFromBackupSourceMegaBackup");
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __103__PLDeviceRestoreMigrationSupport__setAssetsToOTARestoreAsIncompleteWithContext_populateAlbumMappings___block_invoke;
    v28[3] = &unk_1E3670B28;
    v29 = v15;
    v32 = v19;
    v30 = v6;
    v31 = v7;
    v20 = v15;
    objc_msgSend(v30, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v13, v28);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PLMigrationGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v35 = (uint64_t)v21;
        v24 = "set assets to OTA restore as incomplete failed: %@";
        v25 = v23;
        v26 = OS_LOG_TYPE_ERROR;
LABEL_11:
        _os_log_impl(&dword_199541000, v25, v26, v24, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134217984;
      v35 = v27;
      v24 = "Fix %lu cloudMaster nil original filename";
      v25 = v23;
      v26 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_11;
    }

    goto LABEL_13;
  }
  PLBackendGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v35 = (uint64_t)v14;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to get all assets to OTA restore: %@", buf, 0xCu);
  }
LABEL_13:

}

- (void)_linkAsideAlbumMetadata
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E98];
  -[PLLibraryServicesManager modelMigrator](self->_libraryServicesManager, "modelMigrator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "privateDirectoryWithSubType:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, 0);

  if ((_DWORD)v5)
  {
    v9 = *MEMORY[0x1E0C99A90];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *MEMORY[0x1E0C99A90]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v6;
    objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v10, 0, &__block_literal_global_73694);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = v11;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        v16 = 0;
        v31 = v14;
        do
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v16);
          v32 = 0;
          v18 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v32, v9, 0);
          v19 = v32;
          v20 = v19;
          if (v18 && objc_msgSend(v19, "length"))
          {
            v21 = v15;
            v22 = v9;
            v23 = v12;
            objc_msgSend(v17, "URLByAppendingPathExtension:", CFSTR("aside"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "path");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v7;
            v27 = objc_msgSend(v7, "fileExistsAtPath:", v25);

            if ((v27 & 1) == 0)
              objc_msgSend(v26, "linkItemAtURL:toURL:error:", v17, v24, 0);

            v7 = v26;
            v12 = v23;
            v9 = v22;
            v15 = v21;
            v14 = v31;
          }

          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v14);
    }

    v6 = v30;
  }
  else
  {
    PLMigrationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "path");
      v28 = v7;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v29;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "No albums metadata found at path '%{public}@'", buf, 0xCu);

      v7 = v28;
    }
  }

}

- (id)_dataMigrationInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager pathManager](self->_libraryServicesManager, "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoDirectoryWithType:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", *MEMORY[0x1E0D73DF0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v5, "dictionaryWithContentsOfURL:error:", v6, &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;

  if (!v7)
  {
    PLMigrationGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Unable to read info dictionary: %{public}@: %{public}@", buf, 0x16u);
    }

  }
  return v7;
}

- (BOOL)isOTARestoreInProgress
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE buf[24];
  void *v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v4 = (void *)getMBManagerClass_softClass_73673;
  v27 = getMBManagerClass_softClass_73673;
  if (!getMBManagerClass_softClass_73673)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getMBManagerClass_block_invoke_73674;
    v29 = &unk_1E3677580;
    v30 = &v24;
    __getMBManagerClass_block_invoke_73674((uint64_t)buf);
    v4 = (void *)v25[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v24, 8);
  v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "restoreState", v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "state") - 4 < 3;
    if (!objc_msgSend(v8, "state")
      && !-[PLDeviceRestoreMigrationSupport isRestoreFromBackupSourceCloud](self, "isRestoreFromBackupSourceCloud"))
    {
      PLMigrationGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Data migrator indicates that we are not restoring from iCloud: RESTORE FINISHED", buf, 2u);
      }

      -[PLDeviceRestoreMigrationSupport _dataMigrationInfo](self, "_dataMigrationInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLDataMigrationDidRestoreFromCloudBackupKey"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLDataMigrationBuildVersionKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
        if (v14)
        {
          if (!v17)
          {
            if (v19)
            {
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLDataMigrationBuildVersionKey"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v22;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v23;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Not starting up after an iCloud Restore, datamigrator info dictionary was from a different build %{public}@ than the current build %{public}@ so assuming the mobile backup restore state kMBStateIdle means there is no OTA restore in progress nor pending.", buf, 0x16u);

            }
            goto LABEL_19;
          }
          if (v19)
          {
            *(_WORD *)buf = 0;
            v20 = "Starting up after an iCloud Restore.  Assuming the mobile backup restore state kMBStateIdle means the "
                  "restore is complete.";
LABEL_18:
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, v20, buf, 2u);
          }
        }
        else if (v19)
        {
          *(_WORD *)buf = 0;
          v20 = "Not starting up after an iCloud Restore, datamigrator info dictionary indicates this wasn't an iCloud re"
                "store so the mobile backup restore state kMBStateIdle means there is no OTA restore in progress nor pending.";
          goto LABEL_18;
        }
      }
      else
      {
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v20 = "Not starting up after an iCloud Restore, but no datamigrator info dictionary found.  Assuming the mobile"
                " backup restore state kMBStateIdle means there is no OTA restore in progress nor pending.";
          goto LABEL_18;
        }
      }
LABEL_19:

      v9 = 1;
    }
  }
  else
  {
    v9 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return !v9;
}

- (BOOL)_userDataDispositionMatchesDisposition:(unsigned int)a3
{
  PLRunWithUnfairLock();
  return (a3 & ~self->_userDataDisposition) == 0;
}

- (BOOL)isRestoreFromBackup
{
  return -[PLDeviceRestoreMigrationSupport _userDataDispositionMatchesDisposition:](self, "_userDataDispositionMatchesDisposition:", 4);
}

- (BOOL)isRestoreFromBackupSourceCloud
{
  return -[PLDeviceRestoreMigrationSupport _userDataDispositionMatchesDisposition:](self, "_userDataDispositionMatchesDisposition:", 16);
}

- (BOOL)isRestoreFromBackupSourceMegaBackup
{
  _BOOL4 v3;

  v3 = -[PLDeviceRestoreMigrationSupport isRestoreFromBackupSourceCloud](self, "isRestoreFromBackupSourceCloud");
  if (v3)
    LOBYTE(v3) = -[PLDeviceRestoreMigrationSupport _userDataDispositionMatchesDisposition:](self, "_userDataDispositionMatchesDisposition:", 128);
  return v3;
}

- (BOOL)isRestoreFromBackupSourceiTunes
{
  return -[PLDeviceRestoreMigrationSupport _userDataDispositionMatchesDisposition:](self, "_userDataDispositionMatchesDisposition:", 32);
}

- (BOOL)isRestoreFromBackupSourceDeviceToDevice
{
  return -[PLDeviceRestoreMigrationSupport _userDataDispositionMatchesDisposition:](self, "_userDataDispositionMatchesDisposition:", 64);
}

- (BOOL)isRestoreFromBackupSourceDifferentDevice
{
  return -[PLDeviceRestoreMigrationSupport _userDataDispositionMatchesDisposition:](self, "_userDataDispositionMatchesDisposition:", 8);
}

- (BOOL)isEraseWithoutRestore
{
  return -[PLDeviceRestoreMigrationSupport _userDataDispositionMatchesDisposition:](self, "_userDataDispositionMatchesDisposition:", 1);
}

- (BOOL)isUpgradeWithoutRestore
{
  return -[PLDeviceRestoreMigrationSupport _userDataDispositionMatchesDisposition:](self, "_userDataDispositionMatchesDisposition:", 2);
}

- (id)restoreTypeDescription
{
  const __CFString *v3;
  __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (-[PLDeviceRestoreMigrationSupport isRestoreFromBackupSourceDifferentDevice](self, "isRestoreFromBackupSourceDifferentDevice"))
  {
    v3 = CFSTR(" from different device");
  }
  else
  {
    v3 = CFSTR(" from this device");
  }
  if (-[PLDeviceRestoreMigrationSupport isRestoreFromBackupSourceCloud](self, "isRestoreFromBackupSourceCloud"))
  {
    objc_msgSend(CFSTR("iCloud"), "stringByAppendingString:", v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("unknown");
  }
  if (-[PLDeviceRestoreMigrationSupport isRestoreFromBackupSourceMegaBackup](self, "isRestoreFromBackupSourceMegaBackup"))
  {
    objc_msgSend(CFSTR("MegaBackup"), "stringByAppendingString:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  if (-[PLDeviceRestoreMigrationSupport isRestoreFromBackupSourceDeviceToDevice](self, "isRestoreFromBackupSourceDeviceToDevice"))
  {
    objc_msgSend(CFSTR("DeviceToDevice"), "stringByAppendingString:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v6;
  }
  if (-[PLDeviceRestoreMigrationSupport isRestoreFromBackupSourceiTunes](self, "isRestoreFromBackupSourceiTunes"))
  {
    objc_msgSend(CFSTR("iTunes"), "stringByAppendingString:", v3);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v7;
  }
  if (-[PLDeviceRestoreMigrationSupport isEraseWithoutRestore](self, "isEraseWithoutRestore"))
  {

    v4 = CFSTR("erase without restore");
  }
  if (-[PLDeviceRestoreMigrationSupport isUpgradeWithoutRestore](self, "isUpgradeWithoutRestore"))
  {

    v4 = CFSTR("upgrade without restore");
  }
  return v4;
}

- (BOOL)hasCompletedDataMigratorPrerequisitesForTrackingRestoreFromCloud
{
  void *v3;
  int v4;
  NSObject *v5;
  char v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager pathManager](self->_libraryServicesManager, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeviceRestoreSupported");

  if (!v4)
    return 1;
  if (-[PLDeviceRestoreMigrationSupport hasDataMigratorPluginRequestedLibraryMigration](self, "hasDataMigratorPluginRequestedLibraryMigration"))
  {
    PLMigrationGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = CFSTR("com.apple.MobileSlideShow");
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Data migrator plugin %{public}@ is in progress and has requested library migration, not waiting for plugin to complete to avoid deadlock", (uint8_t *)&v8, 0xCu);
    }

    return 1;
  }
  PLDMIsMigrationNeeded();
  return v7 ^ 1;
}

- (void)waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud
{
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[12];
  uint8_t v13[4];
  const __CFString *v14;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PLLibraryServicesManager pathManager](self->_libraryServicesManager, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isDeviceRestoreSupported");

  if (!v5)
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "not waiting for data migrator plugin: device does not support restore from iCloud.", (uint8_t *)&buf, 2u);
    }
    goto LABEL_7;
  }
  if (self->_didWaitForPrerequisites)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLDeviceRestoreMigrationSupport.m"), 511, CFSTR("Already waited for prerequisites"));

  }
  self->_didWaitForPrerequisites = 1;
  if (-[PLDeviceRestoreMigrationSupport hasDataMigratorPluginRequestedLibraryMigration](self, "hasDataMigratorPluginRequestedLibraryMigration"))
  {
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("com.apple.MobileSlideShow");
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "data migrator plugin %{public}@ is in progress and has requested library migration, not waiting for plugin to complete to avoid deadlock", (uint8_t *)&buf, 0xCu);
    }
LABEL_7:

    return;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__73628;
  v18 = __Block_byref_object_dispose__73629;
  v19 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[6] = MEMORY[0x1E0C809B0];
  v12[7] = 3221225472;
  v12[8] = __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke;
  v12[9] = &unk_1E3677C68;
  v12[10] = self;
  v12[11] = &buf;
  PLRunWithUnfairLock();
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke_74;
  v12[3] = &unk_1E3674C18;
  v12[4] = self;
  v12[5] = CFSTR("com.apple.MobileSlideShow");
  dispatch_async(v8, v12);

  PLMigrationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v13 = 138543362;
    v14 = CFSTR("com.apple.MobileSlideShow");
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "waiting to verify migrator plugin %{public}@ is complete or to request library migration", v13, 0xCu);
  }

  dispatch_block_wait(*(dispatch_block_t *)(*((_QWORD *)&buf + 1) + 40), 0xFFFFFFFFFFFFFFFFLL);
  PLMigrationGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "done waiting for data migrator prerequisites", v13, 2u);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)setDataMigratorPluginHasRequestedLibraryMigration:(BOOL)a3
{
  NSObject *v3;
  uint8_t buf[16];

  self->_dataMigratorPluginHasRequestedLibraryMigration = a3;
  if (a3)
  {
    PLMigrationGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "data migrator plugin has requested library migration", buf, 2u);
    }

    PLRunWithUnfairLock();
  }
}

- (BOOL)hasDataMigratorPluginRequestedLibraryMigration
{
  return self->_dataMigratorPluginHasRequestedLibraryMigration;
}

- (id)prerequisitesCompleteBlock
{
  return self->_prerequisitesCompleteBlock;
}

- (void)setPrerequisitesCompleteBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prerequisitesCompleteBlock, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

void __85__PLDeviceRestoreMigrationSupport_setDataMigratorPluginHasRequestedLibraryMigration___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void (**v4)(void);
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "prerequisitesCompleteBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v5 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 24);
    PLMigrationGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v11 = 0;
        v8 = "data migration prerequisites already marked complete [before plugin requested migration]";
        v9 = (uint8_t *)&v11;
LABEL_10:
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else if (v7)
    {
      v10 = 0;
      v8 = "data migration prerequisites marked complete before waiting";
      v9 = (uint8_t *)&v10;
      goto LABEL_10;
    }

    return;
  }
  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "data migration prerequisites are complete [plugin requested migration]", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "prerequisitesCompleteBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

  objc_msgSend(*(id *)(a1 + 32), "setPrerequisitesCompleteBlock:", 0);
}

void __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_block_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "prerequisitesCompleteBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v3 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_73_73645);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(a1 + 32), "setPrerequisitesCompleteBlock:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

uint64_t __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke_74(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v10;
  void *v11;
  __int128 buf;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "perform data migrator plugin if necessary: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v13 = 0x2020000000;
  v5 = getDMPerformMigrationReturningAfterPluginSymbolLoc_ptr;
  v14 = getDMPerformMigrationReturningAfterPluginSymbolLoc_ptr;
  if (!getDMPerformMigrationReturningAfterPluginSymbolLoc_ptr)
  {
    v6 = DataMigrationLibrary_73634();
    v5 = dlsym(v6, "DMPerformMigrationReturningAfterPlugin");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v5;
    getDMPerformMigrationReturningAfterPluginSymbolLoc_ptr = v5;
  }
  _Block_object_dispose(&buf, 8);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PLDMPerformMigrationReturningAfterPlugin(CFStringRef)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PLDeviceRestoreMigrationSupport.m"), 47, CFSTR("%s"), dlerror());

    __break(1u);
  }
  ((void (*)(uint64_t))v5)(v4);
  PLMigrationGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "data migrator plugin %{public}@ is complete", (uint8_t *)&buf, 0xCu);
  }

  return PLRunWithUnfairLock();
}

void __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke_75(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _BOOL4 v4;
  void (**v5)(void);
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "prerequisitesCompleteBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "data migration prerequisites are complete [plugin complete]", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "prerequisitesCompleteBlock");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    objc_msgSend(*(id *)(a1 + 32), "setPrerequisitesCompleteBlock:", 0);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "data migration prerequisites already marked complete [before plugin complete]", v6, 2u);
    }

  }
}

void __94__PLDeviceRestoreMigrationSupport_waitForDataMigratorPrerequisitesForTrackingRestoreFromCloud__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  PLMigrationGetLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_199541000, v0, OS_LOG_TYPE_DEBUG, "running data migration prequisites complete block", v1, 2u);
  }

}

void __74__PLDeviceRestoreMigrationSupport__userDataDispositionMatchesDisposition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v2 = getDMGetUserDataDispositionSymbolLoc_ptr;
    v9 = getDMGetUserDataDispositionSymbolLoc_ptr;
    if (!getDMGetUserDataDispositionSymbolLoc_ptr)
    {
      v3 = DataMigrationLibrary_73634();
      v2 = dlsym(v3, "DMGetUserDataDisposition");
      v7[3] = (uint64_t)v2;
      getDMGetUserDataDispositionSymbolLoc_ptr = v2;
    }
    _Block_object_dispose(&v6, 8);
    if (v2)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = ((uint64_t (*)(void))v2)();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DMUserDataDisposition PLDMGetUserDataDisposition(void)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PLDeviceRestoreMigrationSupport.m"), 45, CFSTR("%s"), dlerror());

      __break(1u);
    }
  }
}

uint64_t __58__PLDeviceRestoreMigrationSupport__linkAsideAlbumMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
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
    v9 = 138543618;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Unable to enumerate '%{public}@': %@", (uint8_t *)&v9, 0x16u);

  }
  return 1;
}

void __103__PLDeviceRestoreMigrationSupport__setAssetsToOTARestoreAsIncompleteWithContext_populateAlbumMappings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "mainFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (v6 = *(void **)(a1 + 32),
        objc_msgSend(v4, "path"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v6) = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0),
        v7,
        (v6 & 1) == 0))
  {
    objc_msgSend(v3, "setComplete:", 0);
    if (!*(_BYTE *)(a1 + 56))
      objc_msgSend(v3, "setEffectiveThumbnailIndex:", 0x7FFFFFFFFFFFFFFFLL);
    if (objc_msgSend(v3, "kind") == 1)
    {
      objc_msgSend(v3, "mediaAnalysisAttributes");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(v3, "isVideoKeyFrameSet");

        if (v10)
        {
          v11 = *(void **)(a1 + 40);
          objc_msgSend(v3, "mediaAnalysisAttributes");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "deleteObject:", v12);

          objc_msgSend(v3, "resetVideoKeyFrameTime");
        }
      }
    }
    objc_msgSend(v3, "albums");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "uuid", (_QWORD)v23);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v20);

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v17);
      }

      v21 = *(void **)(a1 + 48);
      objc_msgSend(v3, "uuid");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v14, v22);

    }
  }

}

uint64_t __68__PLDeviceRestoreMigrationSupport__prepareDatabaseForOTAAssetsPhase__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_batchDeleteAllAssetsExcludedFromOTARestoreWithContext:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setAlbumPendingItemCountsWithContext:shouldSave:", *(_QWORD *)(a1 + 40), 1);
  return objc_msgSend(*(id *)(a1 + 32), "_setAssetsToOTARestoreAsIncompleteWithContext:populateAlbumMappings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

BOOL __68__PLDeviceRestoreMigrationSupport__prepareDatabaseForOTAAssetsPhase__block_invoke_26(uint64_t a1)
{
  return +[PLModelMigrator performFaceAnalysisResetWithResetLevel:pathManager:context:](PLModelMigrator, "performFaceAnalysisResetWithResetLevel:pathManager:context:", 2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __92__PLDeviceRestoreMigrationSupport_prepareDatabaseForOTARestoreIfNecessaryWithMigrationType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t result;
  uint8_t v5[16];
  uint8_t buf[16];

  PLMigrationGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Preparing database for OTA background restore, (foreground restore complete)", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "writeBackgroundRestorePostProcessingInProgressToken");
  objc_msgSend(*(id *)(a1 + 40), "_linkAsideAlbumMetadata");
  objc_msgSend(*(id *)(a1 + 40), "_prepareDatabaseForOTAAssetsPhase");
  PLMigrationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "Done preparing database for OTA background restore (writing post-processing complete token)", v5, 2u);
  }

  result = objc_msgSend(*(id *)(a1 + 32), "writeBackgroundRestorePostProcessingCompleteAndArchiveTokens");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

@end
