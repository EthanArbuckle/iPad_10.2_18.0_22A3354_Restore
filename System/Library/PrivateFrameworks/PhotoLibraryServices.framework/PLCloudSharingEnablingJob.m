@implementation PLCloudSharingEnablingJob

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLCloudSharingEnablingJob;
  v4 = a3;
  -[PLDaemonJob encodeToXPCObject:](&v5, sel_encodeToXPCObject_, v4);
  xpc_dictionary_set_BOOL(v4, "enableSharing", -[PLCloudSharingEnablingJob enableSharing](self, "enableSharing", v5.receiver, v5.super_class));

}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  id v7;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLCloudSharingEnablingJob;
  v7 = -[PLCloudSharingJob initFromXPCObject:libraryServicesManager:](&v9, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  if (v7)
    objc_msgSend(v7, "setEnableSharing:", xpc_dictionary_get_BOOL(v6, "enableSharing"));

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLCloudSharingEnablingJob;
  -[PLDaemonJob description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" enableSharing %d"), -[PLCloudSharingEnablingJob enableSharing](self, "enableSharing"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)daemonOperation
{
  return 2;
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 1;
}

- (void)runDaemonSide
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudSharingEnablingJob runDaemonSide]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "lowPriorityOperationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__PLCloudSharingEnablingJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E3677C18;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "addOperationWithBlock:", v6);

}

- (BOOL)enableSharing
{
  return *(&self->super._shouldPrioritize + 1);
}

- (void)setEnableSharing:(BOOL)a3
{
  *(&self->super._shouldPrioritize + 1) = a3;
}

void __42__PLCloudSharingEnablingJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  objc_super v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  NSObject *v30;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x19AEC1554]();
  PLPhotoSharingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "enableSharing");
    *(_DWORD *)buf = 67109120;
    LODWORD(v28) = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudSharingEnabledJob runDaemonSide %d", buf, 8u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "enableSharing"))
  {
    +[PLPhotoSharingHelper clearCachedAccountState](PLPhotoSharingHelper, "clearCachedAccountState");
    objc_msgSend(*(id *)(a1 + 32), "transientPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "pathManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("personID"));
      v8 = objc_claimAutoreleasedReturnValue();

      +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v12, "pathManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "photoDirectoryWithType:", 22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fileURLWithPath:isDirectory:", v14, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0;
        LOBYTE(v12) = objc_msgSend(v15, "getResourceValue:forKey:error:", &v26, *MEMORY[0x1E0C99968], 0);
        v23 = v26;
        v16 = 0;
        if ((v12 & 1) == 0)
        {
          v25 = 0;
          v17 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v25);
          v16 = v25;
          if ((v17 & 1) == 0)
          {
            PLPhotoSharingGetLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v15, "path");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v28 = v19;
              v29 = 2112;
              v30 = v16;
              _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "ERROR: Unable to create directory \"%@\": %@", buf, 0x16u);

            }
          }
        }
        objc_msgSend(v10, "removeItemAtPath:error:", v8, 0);
        objc_msgSend(v9, "dataUsingEncoding:", 4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "writeToFile:options:error:", v8, 1073741825, 0) & 1) == 0)
        {
          PLPhotoSharingGetLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v28 = v9;
            v29 = 2112;
            v30 = v8;
            v31 = 2112;
            v32 = v16;
            _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "ERROR: Unable to write personID %@ to file %@: %@", buf, 0x20u);
          }

        }
      }
      +[PLPhotoSharingHelper updateSharedAlbumsCachedServerConfigurationLimits](PLPhotoSharingHelper, "updateSharedAlbumsCachedServerConfigurationLimits");
      PLPhotoSharingGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "will perform initial poll", buf, 2u);
      }

      +[PLPhotoSharingHelper pollForAlbumListUpdates](PLPhotoSharingHelper, "pollForAlbumListUpdates");
    }
    else
    {
      PLPhotoSharingGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "PLCloudSharingEnablingJob unable to create PLPhotoLibrary instance. Enabling failed.", buf, 2u);
      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudSharingEnablingJob disableCloudSharingWithLibraryServicesManager:](PLCloudSharingEnablingJob, "disableCloudSharingWithLibraryServicesManager:", v6);
  }

  v24.receiver = *(id *)(a1 + 32);
  v24.super_class = (Class)PLCloudSharingEnablingJob;
  objc_msgSendSuper2(&v24, sel_runDaemonSide);
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");
  objc_autoreleasePoolPop(v2);
}

+ (void)enableCloudSharing:(BOOL)a3 withPathManager:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  PLPhotoSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("Disabling");
    if (v4)
      v8 = CFSTR("Enabling");
    v11 = 138412290;
    v12 = v8;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "%@ shared album", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(a1, "deleteAllRecoveryEventsWithPathManager:", v6);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setEnableSharing:", v4);
  objc_msgSend(v9, "runAndWaitForMessageToBeSent");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0, 0, 1u);

}

+ (void)disableCloudSharingWithLibraryServicesManager:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  PLCloudFeedEntriesManager *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PLPhotoSharingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Telling mstreamd to forget sharing data", buf, 2u);
  }

  +[PLPhotoSharingHelper forgetSharingPersonID:](PLPhotoSharingHelper, "forgetSharingPersonID:", 0);
  objc_msgSend(v3, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoDirectoryWithType:additionalPathComponents:", 22, CFSTR("recentlyUsedGUIDS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLPhotoSharingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Removing recently used GUIDs from %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v9 = objc_msgSend(v8, "removeItemAtPath:error:", v6, &v31);
  v10 = v31;

  if ((v9 & 1) == 0)
  {
    PLPhotoSharingGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v33 = v6;
      v34 = 2112;
      v35 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
    }

    v10 = 0;
  }
  objc_msgSend(v5, "photoDirectoryWithType:", 23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {
    PLPhotoSharingGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v12;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Removing cloud sharing metadata %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v10;
    v15 = objc_msgSend(v14, "removeItemAtPath:error:", v12, &v30);
    v16 = v30;

    if ((v15 & 1) != 0)
    {
      v10 = v16;
    }
    else
    {
      PLPhotoSharingGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v12;
        v34 = 2112;
        v35 = v16;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
      }

      v10 = 0;
    }
  }
  PLPhotoSharingGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Removing persisted person info", buf, 2u);
  }

  objc_msgSend(v3, "libraryBundle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "personInfoManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removePersistedInfo");

  objc_msgSend(v3, "databaseContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "newShortLivedLibraryWithName:", "+[PLCloudSharingEnablingJob disableCloudSharingWithLibraryServicesManager:]");

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__PLCloudSharingEnablingJob_disableCloudSharingWithLibraryServicesManager___block_invoke;
  v28[3] = &unk_1E3677AA0;
  v23 = v22;
  v29 = v23;
  objc_msgSend(v23, "performTransactionAndWait:", v28);
  PLPhotoSharingGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Discarding all notifications", buf, 2u);
  }

  +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "discardAllNotifications");

  PLPhotoSharingGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_DEFAULT, "Rebuilding cloud feed entries", buf, 2u);
  }

  v27 = -[PLCloudFeedEntriesManager initWithPhotoLibrary:]([PLCloudFeedEntriesManager alloc], "initWithPhotoLibrary:", v23);
  -[PLCloudFeedEntriesManager rebuildAllEntries:](v27, "rebuildAllEntries:", 0);

}

+ (void)deleteAllLocalSharedAlbumsInLibrary:(id)a3 keepPendingAlbums:(BOOL)a4 withReason:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  BOOL v27;
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLCloudSharingEnablingJob.m"), 176, CFSTR("deleteAllLocalSharedAlbumsInLibrary only valid in assetsd!"));

  }
  +[PLCloudSharedAlbum allCloudSharedAlbumsInLibrary:](PLCloudSharedAlbum, "allCloudSharedAlbumsInLibrary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    PLPhotoSharingGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "PLCloudSharingEnablingJob will delete all %lu shared albums", buf, 0xCu);
    }

    +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __94__PLCloudSharingEnablingJob_deleteAllLocalSharedAlbumsInLibrary_keepPendingAlbums_withReason___block_invoke;
    v25 = &unk_1E3673500;
    v27 = a4;
    v26 = v11;
    v13 = v11;
    objc_msgSend(v12, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v9, &v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      PLPhotoSharingGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = (uint64_t)v14;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "PLCloudSharingEnablingJob failed to delete shared albums: %@", buf, 0xCu);
      }

    }
  }
  +[PLManagedAsset allCloudSharedAssetsInLibrary:](PLManagedAsset, "allCloudSharedAssetsInLibrary:", v8, v22, v23, v24, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    PLPhotoSharingGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 134217984;
      v29 = v18;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "PLCloudSharingEnablingJob will delete all %lu orphaned shared assets", buf, 0xCu);
    }

    objc_msgSend(v8, "managedObjectContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "deleteObjectsWithIncrementalSave:", v16);

  }
}

void __94__PLCloudSharingEnablingJob_deleteAllLocalSharedAlbumsInLibrary_keepPendingAlbums_withReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!*(_BYTE *)(a1 + 40) || objc_msgSend(v3, "cloudRelationshipStateLocalValue") != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "noteDidDeleteSharedAlbum:", v3);
    objc_msgSend(v3, "delete");
  }

}

void __75__PLCloudSharingEnablingJob_disableCloudSharingWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  PLPhotoSharingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "PLCloudSharingEnablingJob deleting all shared albums and assets while disabling", v4, 2u);
  }

  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", CFSTR("[PLCloudSharingEnablingJob]Deleting all shared albums and assets while disabling"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudSharingEnablingJob deleteAllLocalSharedAlbumsInLibrary:keepPendingAlbums:withReason:](PLCloudSharingEnablingJob, "deleteAllLocalSharedAlbumsInLibrary:keepPendingAlbums:withReason:", *(_QWORD *)(a1 + 32), 0, v3);

}

@end
