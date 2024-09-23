@implementation PLIndicatorFileCoordinator

- (PLIndicatorFileCoordinator)initWithPathManager:(id)a3
{
  id v5;
  PLIndicatorFileCoordinator *v6;
  PLIndicatorFileCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLIndicatorFileCoordinator;
  v6 = -[PLIndicatorFileCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pathManager, a3);
    *(_QWORD *)&v7->_activityIndicatorFid = 0xFFFFFFFFLL;
  }

  return v7;
}

- (PLIndicatorFileCoordinator)initWithResourceHoldingDirectoryPath:(id)a3
{
  id v5;
  PLIndicatorFileCoordinator *v6;
  PLIndicatorFileCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLIndicatorFileCoordinator;
  v6 = -[PLIndicatorFileCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_QWORD *)&v6->_activityIndicatorFid = 0xFFFFFFFFLL;
    objc_storeStrong((id *)&v6->_resourceHoldingDirectoryPath, a3);
  }

  return v7;
}

- (void)dealloc
{
  int activityIndicatorFid;
  objc_super v4;

  activityIndicatorFid = self->_activityIndicatorFid;
  if (activityIndicatorFid != -1)
  {
    close(activityIndicatorFid);
    self->_activityIndicatorFid = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PLIndicatorFileCoordinator;
  -[PLIndicatorFileCoordinator dealloc](&v4, sel_dealloc);
}

- (void)_setActivityIndicatorWithPath:(id)a3 flag:(BOOL)a4 crashRecovery:(id)a5
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  PLSafeRunWithUnfairLock();

}

- (void)setTakingPhotoIsBusy:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLIndicatorFileCoordinator.m"), 129, CFSTR("only called by processes that is not assetsd"));

  }
  objc_msgSend(MEMORY[0x1E0D73138], "takingPhotoIndicatorFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PLIndicatorFileCoordinator_setTakingPhotoIsBusy___block_invoke;
  v10[3] = &unk_1E3677AA0;
  v11 = v7;
  v8 = v7;
  -[PLIndicatorFileCoordinator _setActivityIndicatorWithPath:flag:crashRecovery:](self, "_setActivityIndicatorWithPath:flag:crashRecovery:", v6, v3, v10);

}

- (void)setCreatingAssetIsBusy:(BOOL)a3
{
  _BOOL8 v3;
  NSString *resourceHoldingDirectoryPath;
  uint64_t v6;
  id v7;

  v3 = a3;
  resourceHoldingDirectoryPath = self->_resourceHoldingDirectoryPath;
  if (resourceHoldingDirectoryPath)
  {
    -[NSString stringByAppendingPathComponent:](resourceHoldingDirectoryPath, "stringByAppendingPathComponent:", CFSTR("creatingasset"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[PLIndicatorFileCoordinator _setActivityIndicatorWithPath:flag:crashRecovery:](self, "_setActivityIndicatorWithPath:flag:crashRecovery:", v6, v3, &__block_literal_global_36629);

}

- (void)setImageWriter:(id)a3 isBusy:(BOOL)a4 crashRecoverySupport:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLIndicatorFileCoordinator.m"), 152, CFSTR("only called by assetsd"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLIndicatorFileCoordinator.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("imageWriter"));

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  -[PLPhotoLibraryPathManager privateDirectoryWithSubType:](self->_pathManager, "privateDirectoryWithSubType:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__PLIndicatorFileCoordinator_setImageWriter_isBusy_crashRecoverySupport___block_invoke;
  v16[3] = &unk_1E3677C18;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  -[PLIndicatorFileCoordinator _setActivityIndicatorWithPath:flag:crashRecovery:](self, "_setActivityIndicatorWithPath:flag:crashRecovery:", v11, v6, v16);

}

- (BOOL)needsRecoveryAfterCrashOptionallyRemoveAllIndicatorFiles:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  int v16;
  int v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  _BYTE v26[128];
  _QWORD v27[5];

  v3 = a3;
  v27[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73138], "takingVideoIndicatorFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v5;
  objc_msgSend(MEMORY[0x1E0D73138], "takingPhotoIndicatorFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v6;
  -[PLPhotoLibraryPathManager privateDirectoryWithSubType:](self->_pathManager, "privateDirectoryWithSubType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v9);
        v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i));
        v16 = open((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 36);
        if ((v16 & 0x80000000) == 0)
        {
          v17 = v16;
          PLAssetImportGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v15;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Photo library needs recovery after crash because of indicator file %@", buf, 0xCu);
          }

          if (!v3)
          {
            close(v17);
            v12 = 1;
            goto LABEL_16;
          }
          unlink((const char *)objc_msgSend(objc_retainAutorelease(v15), "fileSystemRepresentation"));
          close(v17);
          v12 = 1;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_16:

  return v12 & 1;
}

- (BOOL)isEnableICloudPhotos
{
  void *v2;
  char v3;

  -[PLPhotoLibraryPathManager enableICloudPhotosFilePath](self->_pathManager, "enableICloudPhotosFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (BOOL)isDisableICloudPhotos
{
  void *v2;
  char v3;

  -[PLPhotoLibraryPathManager disableICloudPhotosFilePath](self->_pathManager, "disableICloudPhotosFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (BOOL)isICloudPhotosPaused
{
  void *v2;
  char v3;

  -[PLPhotoLibraryPathManager pauseICloudPhotosFilePath](self->_pathManager, "pauseICloudPhotosFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (void)deleteCPLDownloadFinishedMarkerFilePath
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager cplDownloadFinishedMarkerFilePath](self->_pathManager, "cplDownloadFinishedMarkerFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
    PLMakeIndicatorFileExistAtPath();

}

- (void)writeDisableICloudPhotosMarker
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[PLPhotoLibraryPathManager disableICloudPhotosFilePath](self->_pathManager, "disableICloudPhotosFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath();
  if (-[PLIndicatorFileCoordinator isEnableICloudPhotos](self, "isEnableICloudPhotos"))
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Removing stale enable marker as we are disabling iCPL", v6, 2u);
    }

    -[PLPhotoLibraryPathManager enableICloudPhotosFilePath](self->_pathManager, "enableICloudPhotosFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLMakeIndicatorFileExistAtPath();

  }
}

- (void)writeEnableICloudPhotosMarker
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[PLPhotoLibraryPathManager enableICloudPhotosFilePath](self->_pathManager, "enableICloudPhotosFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath();
  if (-[PLIndicatorFileCoordinator isDisableICloudPhotos](self, "isDisableICloudPhotos"))
  {
    PLBackendGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Found disable marker when enabling iCPL", v5, 2u);
    }

  }
  -[PLIndicatorFileCoordinator deleteCPLDownloadFinishedMarkerFilePath](self, "deleteCPLDownloadFinishedMarkerFilePath");

}

- (void)updateICloudPhotosMarkerForEnable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  if (-[PLIndicatorFileCoordinator isForceSoftResetSync](self, "isForceSoftResetSync"))
  {
    -[PLPhotoLibraryPathManager forceSoftResetSyncPath](self->_pathManager, "forceSoftResetSyncPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLMakeIndicatorFileExistAtPath();

  }
  if (-[PLIndicatorFileCoordinator isEnableICloudPhotos](self, "isEnableICloudPhotos"))
  {
    -[PLPhotoLibraryPathManager enableICloudPhotosFilePath](self->_pathManager, "enableICloudPhotosFilePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PLMakeIndicatorFileExistAtPath();

  }
  if (-[PLIndicatorFileCoordinator isDisableICloudPhotos](self, "isDisableICloudPhotos"))
  {
    -[PLPhotoLibraryPathManager disableICloudPhotosFilePath](self->_pathManager, "disableICloudPhotosFilePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PLMakeIndicatorFileExistAtPath();

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager cplEnableMarkerFilePath](self->_pathManager, "cplEnableMarkerFilePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);
  v11 = v10;
  if (v3)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) != 0)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v25 = v9;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "%@ already exist", buf, 0xCu);
      }
      goto LABEL_25;
    }
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "writing %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    -[NSObject setDateFormat:](v16, "setDateFormat:", CFSTR("yyyy-MM-dd HH.mm.ss.SSS"));
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLocale:](v16, "setLocale:", v17);

    -[NSObject stringFromDate:](v16, "stringFromDate:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v19 = objc_msgSend(v18, "writeToFile:atomically:encoding:error:", v9, 1, 4, &v23);
    v20 = v23;

    if ((v19 & 1) == 0)
    {
      PLBackendGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v9;
        v26 = 2112;
        v27 = v20;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "failed to write %@: %@", buf, 0x16u);
      }

    }
LABEL_24:

LABEL_25:
    goto LABEL_26;
  }
  if (v10)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "removing %@", buf, 0xCu);
    }

    v22 = 0;
    v15 = objc_msgSend(v8, "removeItemAtPath:error:", v9, &v22);
    v12 = v22;
    if ((v15 & 1) != 0)
      goto LABEL_25;
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "failed to remove %@: %@", buf, 0x16u);
    }
    goto LABEL_24;
  }
LABEL_26:

}

- (BOOL)clearPauseMarkerForReason:(signed __int16)a3
{
  int v3;
  void *v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryPathManager pauseICloudPhotosFilePath](self->_pathManager, "pauseICloudPhotosFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "fileExistsAtPath:", v5))
  {
    if (v3 == 3 || !-[PLIndicatorFileCoordinator isUserPause](self, "isUserPause"))
    {
      v11 = 0;
      objc_msgSend(v6, "removeItemAtPath:error:", v5, &v11);
      v8 = v11;
      v7 = v8 == 0;
      if (v8)
      {
        PLBackendGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v8;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to remove pauseMarker file %@", buf, 0xCu);
        }

      }
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)_canSetPauseMarkerWithUnpauseTime:(id)a3 onPauseData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(a4, "objectForKey:", CFSTR("unpauseTime"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "compare:", v5) == -1;
    else
      v8 = 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_createPauseMarkerForReason:(signed __int16)a3 withUnpauseTime:(id)a4 withPath:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString **v14;
  id v15;

  v6 = a3;
  v15 = a4;
  v8 = a5;
  -[PLIndicatorFileCoordinator _pauseDataOnPath:](self, "_pauseDataOnPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "mutableCopy");

  if (v10)
  {
    if (!-[PLIndicatorFileCoordinator _canSetPauseMarkerWithUnpauseTime:onPauseData:](self, "_canSetPauseMarkerWithUnpauseTime:onPauseData:", v15, v10))goto LABEL_8;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  objc_msgSend(v10, "setObject:forKey:", v15, CFSTR("unpauseTime"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("reason"));

  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 100, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeToFile:options:error:", v8, 1073741825, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v14 = &PhotoLibraryUserPauseNotification;
  if ((_DWORD)v6 != 3)
    v14 = &PhotoLibraryPauseNotification;
  CFNotificationCenterPostNotification(DarwinNotifyCenter, *v14, 0, 0, 0);

LABEL_8:
}

- (void)createPauseMarkerWithUnpauseTime:(id)a3 reason:(signed __int16)a4
{
  uint64_t v4;
  PLPhotoLibraryPathManager *pathManager;
  id v7;
  id v8;

  v4 = a4;
  pathManager = self->_pathManager;
  v7 = a3;
  -[PLPhotoLibraryPathManager pauseICloudPhotosFilePath](pathManager, "pauseICloudPhotosFilePath");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLIndicatorFileCoordinator _createPauseMarkerForReason:withUnpauseTime:withPath:](self, "_createPauseMarkerForReason:withUnpauseTime:withPath:", v4, v7, v8);

}

- (id)_pauseDataOnPath:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", a3);
}

- (id)unpauseTime
{
  void *v3;
  void *v4;
  void *v5;

  if (-[PLIndicatorFileCoordinator isICloudPhotosPaused](self, "isICloudPhotosPaused"))
  {
    -[PLPhotoLibraryPathManager pauseICloudPhotosFilePath](self->_pathManager, "pauseICloudPhotosFilePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLIndicatorFileCoordinator _pauseDataOnPath:](self, "_pauseDataOnPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("unpauseTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (signed)currentPauseReason
{
  void *v3;
  void *v4;
  void *v5;
  signed __int16 v6;

  if (!-[PLIndicatorFileCoordinator isICloudPhotosPaused](self, "isICloudPhotosPaused"))
    return 0;
  -[PLPhotoLibraryPathManager pauseICloudPhotosFilePath](self->_pathManager, "pauseICloudPhotosFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLIndicatorFileCoordinator _pauseDataOnPath:](self, "_pauseDataOnPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("reason"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  return v6;
}

- (BOOL)isUserPause
{
  return -[PLIndicatorFileCoordinator currentPauseReason](self, "currentPauseReason") == 3;
}

- (BOOL)isForceSoftResetSync
{
  void *v2;
  char v3;

  -[PLPhotoLibraryPathManager forceSoftResetSyncPath](self->_pathManager, "forceSoftResetSyncPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (void)forceSoftResetSync
{
  id v2;

  -[PLPhotoLibraryPathManager forceSoftResetSyncPath](self->_pathManager, "forceSoftResetSyncPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath();

}

- (BOOL)isWipeCPLOnOpen
{
  void *v2;
  char v3;

  -[PLPhotoLibraryPathManager wipeCPLOnOpenPath](self->_pathManager, "wipeCPLOnOpenPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (void)setWipeCPLOnOpen
{
  id v2;

  -[PLPhotoLibraryPathManager wipeCPLOnOpenPath](self->_pathManager, "wipeCPLOnOpenPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath();

}

- (void)clearWipeCPLOnOpen
{
  id v2;

  -[PLPhotoLibraryPathManager wipeCPLOnOpenPath](self->_pathManager, "wipeCPLOnOpenPath");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath();

}

- (id)_readPListWithFilename:(id)a3
{
  PLPhotoLibraryPathManager *pathManager;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  pathManager = self->_pathManager;
  v4 = a3;
  -[PLPhotoLibraryPathManager cplDataDirectoryCreateIfNeeded:](pathManager, "cplDataDirectoryCreateIfNeeded:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v6);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }

  return v7;
}

- (void)_writeDict:(id)a3 withFilename:(id)a4
{
  PLPhotoLibraryPathManager *pathManager;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  pathManager = self->_pathManager;
  v6 = a4;
  v7 = a3;
  -[PLPhotoLibraryPathManager cplDataDirectoryCreateIfNeeded:](pathManager, "cplDataDirectoryCreateIfNeeded:", 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v11, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "writeToURL:atomically:", v10, 1);
}

- (BOOL)hasItemToDownload
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v9;

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLIndicatorFileCoordinator.m"), 445, CFSTR("Must be run in assetsd"));

  }
  -[PLIndicatorFileCoordinator _readPListWithFilename:](self, "_readPListWithFilename:", CFSTR("DownloadCounts.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CountKeyImages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "unsignedIntegerValue"))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CountKeyVideos"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "unsignedIntegerValue") != 0;

  }
  return v6;
}

- (void)getDownloadPhotoCount:(unint64_t *)a3 downloadVideoCount:(unint64_t *)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLIndicatorFileCoordinator.m"), 454, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("downloadPhotoCount"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLIndicatorFileCoordinator.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("downloadVideoCount"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  -[PLIndicatorFileCoordinator _readPListWithFilename:](self, "_readPListWithFilename:", CFSTR("DownloadCounts.plist"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CountKeyImages"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("CountKeyVideos"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = objc_msgSend(v9, "unsignedIntegerValue");

}

- (void)setDownloadCountsForImages:(unint64_t)a3 videos:(unint64_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLIndicatorFileCoordinator.m"), 464, CFSTR("Must be run in assetsd"));

  }
  v12[0] = CFSTR("CountKeyImages");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = CFSTR("CountKeyVideos");
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLIndicatorFileCoordinator _writeDict:withFilename:](self, "_writeDict:withFilename:", v10, CFSTR("DownloadCounts.plist"));
}

- (void)setStreamsLibraryUpdatingExpired:(BOOL)a3
{
  id v3;

  -[PLPhotoLibraryPathManager privateCacheDirectoryWithSubType:](self->_pathManager, "privateCacheDirectoryWithSubType:", 9);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath();

}

- (BOOL)isStreamsLibraryUpdatingExpired
{
  void *v2;
  char v3;

  -[PLPhotoLibraryPathManager privateCacheDirectoryWithSubType:](self->_pathManager, "privateCacheDirectoryWithSubType:", 9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (id)_rebuildingPersonsIndicatorFilePath
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self->_pathManager, "photoDirectoryWithType:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("rebuildingpersons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setIsRebuildingPersons:(BOOL)a3
{
  id v3;

  -[PLIndicatorFileCoordinator _rebuildingPersonsIndicatorFilePath](self, "_rebuildingPersonsIndicatorFilePath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath();

}

- (BOOL)isRebuildingPersons
{
  void *v2;
  char v3;

  -[PLIndicatorFileCoordinator _rebuildingPersonsIndicatorFilePath](self, "_rebuildingPersonsIndicatorFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (id)_rebuildingSocialGroupsIndicatorFilePath
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self->_pathManager, "photoDirectoryWithType:", 6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("rebuildingsocialgroups"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setIsRebuildingSocialGroups:(BOOL)a3
{
  id v3;

  -[PLIndicatorFileCoordinator _rebuildingSocialGroupsIndicatorFilePath](self, "_rebuildingSocialGroupsIndicatorFilePath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  PLMakeIndicatorFileExistAtPath();

}

- (BOOL)isRebuildingSocialGroups
{
  void *v2;
  char v3;

  -[PLIndicatorFileCoordinator _rebuildingSocialGroupsIndicatorFilePath](self, "_rebuildingSocialGroupsIndicatorFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = PLDoesIndicatorFileExistAtPath();

  return v3;
}

- (void)logCloudServiceEnableEvent:(BOOL)a3 serviceName:(id)a4 reason:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  _BOOL4 v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v6 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[PLPhotoLibraryPathManager cloudServiceEnableLogFileURL](self->_pathManager, "cloudServiceEnableLogFileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v10, 0, &v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v28;
  if (!v11)
  {
    if (!PLIsErrorFileNotFound())
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        v30 = v6;
        v31 = 2114;
        v32 = v8;
        v33 = 2112;
        v34 = v10;
        v35 = 2112;
        v36 = (uint64_t)v12;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Couldn't read enable event log, enabled: %d, type: %{public}@ path: %@, error: %@", buf, 0x26u);
      }
      v15 = 0;
      v21 = 0;
      goto LABEL_28;
    }
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v15)
      goto LABEL_29;
LABEL_17:
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v19, CFSTR("enabled"));

    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v8, CFSTR("type"));
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v9, CFSTR("reason"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v20, CFSTR("timestamp"));

    objc_msgSend(v15, "addObject:", v18);
    v26 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v15, 200, 0, &v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v26;

    if (v21)
    {
      v25 = v22;
      v23 = objc_msgSend(v21, "writeToURL:options:error:", v10, 0, &v25);
      v12 = v25;

      if ((v23 & 1) != 0)
      {
LABEL_28:

        v11 = v21;
        goto LABEL_29;
      }
      PLBackendGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        v30 = v6;
        v31 = 2114;
        v32 = v8;
        v33 = 2112;
        v34 = v10;
        v35 = 2112;
        v36 = (uint64_t)v12;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Couldn't write enable event log, enabled: %d, type: %{public}@ path: %@, error: %@", buf, 0x26u);
      }
      v22 = v12;
    }
    else
    {
      PLBackendGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        v30 = v6;
        v31 = 2114;
        v32 = v8;
        v33 = 2112;
        v34 = v10;
        v35 = 2112;
        v36 = (uint64_t)v22;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Couldn't encode enable event log, enabled: %d, type: %{public}@ path: %@, error: %@", buf, 0x26u);
      }
    }

    v12 = v22;
    goto LABEL_28;
  }
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v11, 0, 0, &v27);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v27;

  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NSObject mutableCopy](v13, "mutableCopy");

      goto LABEL_14;
    }
    PLBackendGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_opt_class();
      *(_DWORD *)buf = 67109890;
      v30 = v6;
      v31 = 2114;
      v32 = v8;
      v33 = 2112;
      v34 = v10;
      v35 = 2114;
      v36 = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Couldn't decode enable event log, enabled: %d, type: %{public}@ path: %@, error: unexpected type: %{public}@", buf, 0x26u);
    }

  }
  else
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      v30 = v6;
      v31 = 2114;
      v32 = v8;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = (uint64_t)v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Couldn't decode enable event log, enabled: %d, type: %{public}@ path: %@, error: %@", buf, 0x26u);
    }
  }

  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
LABEL_14:
  if ((unint64_t)objc_msgSend(v15, "count") >= 0x64)
    objc_msgSend(v15, "removeObjectsInRange:", 0, 50);
  v12 = v14;
  if (v15)
    goto LABEL_17;
LABEL_29:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceHoldingDirectoryPath, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
}

uint64_t __73__PLIndicatorFileCoordinator_setImageWriter_isBusy_crashRecoverySupport___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  PLAssetImportGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Initiating crash recovery if needed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "recoverFromCrashIfNeededWithImageWriter:", *(_QWORD *)(a1 + 40));
}

void __51__PLIndicatorFileCoordinator_setTakingPhotoIsBusy___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  PLAssetImportGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_ERROR, "Sending crash recovery request to assetsd", v5, 2u);
  }

  +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:](PLPhotoLibraryBundleController, "sharedAssetsdClientForPhotoLibraryURL:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoverFromCrashIfNeeded");

}

void __79__PLIndicatorFileCoordinator__setActivityIndicatorWithPath_flag_crashRecovery___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  const char *v5;
  int v6;
  int v7;
  void *v8;
  char *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int *v13;
  char *v14;
  int v15;
  uint64_t v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  char value;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (!*(_BYTE *)(a1 + 56))
  {
    if ((v2 & 0x80000000) == 0)
    {
      unlink((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"));
      close(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16));
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = -1;
      return;
    }
    PLAssetImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v10 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    v5 = "%@ activity indicator already cleared";
    goto LABEL_13;
  }
  if ((v2 & 0x80000000) == 0)
  {
    PLAssetImportGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
LABEL_14:

      return;
    }
    v4 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    v5 = "%@ activity indicator already set";
LABEL_13:
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, v5, buf, 0xCu);
    goto LABEL_14;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"), 2721, 438);
  if ((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) & 0x80000000) == 0)
  {
    value = -1;
    v6 = setxattr((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), "com.apple.runningboard.can-suspend-locked", &value, 1uLL, 0, 0);
    if ((v6 & 0x80000000) == 0)
      return;
    v7 = v6;
    PLBackendGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D73208], "redactedDescriptionForPath:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = strerror(v7);
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2082;
      v26 = v9;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Failed to set extended attributes on path: %@ with error: %{public}s", buf, 0x16u);

    }
    goto LABEL_14;
  }
  PLAssetImportGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = *(void **)(a1 + 40);
    v13 = __error();
    v14 = strerror(*v13);
    v15 = *__error();
    *(_DWORD *)buf = 138412802;
    v24 = v12;
    v25 = 2080;
    v26 = v14;
    v27 = 1024;
    v28 = v15;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "%@ activity indicator couldn't be set: %s (%d). Recovering...", buf, 0x1Cu);
  }

  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
    (*(void (**)(void))(v16 + 16))();
  if ((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) & 0x80000000) != 0)
  {
    v17 = 1;
    do
    {
      PLAssetImportGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      if (v17 >= 121)
      {
        if (v19)
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v24) = 120;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to create activity indicator file after %d attempts.  Giving up.", buf, 8u);
        }

        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Too many failed attempts to create activity indicator file"), 0);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v21);
      }
      if (v19)
      {
        v20 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v24 = v20;
        v25 = 1024;
        LODWORD(v26) = v17;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Will retry creating activity indicator after delay %@ [%d]", buf, 0x12u);
        ++v17;
      }

      sleep(1u);
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = open((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"), 2721, 438);
    }
    while ((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) & 0x80000000) != 0);
  }
}

+ (void)setSystemLibraryAvailableIndicatorState:(BOOL)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "privateCacheDirectoryWithSubType:", 8);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  PLMakeIndicatorFileExistAtPath();
}

+ (BOOL)systemLibraryAvailableIndicatorState
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryPathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateCacheDirectoryWithSubType:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = PLDoesIndicatorFileExistAtPath();
  return (char)v2;
}

@end
