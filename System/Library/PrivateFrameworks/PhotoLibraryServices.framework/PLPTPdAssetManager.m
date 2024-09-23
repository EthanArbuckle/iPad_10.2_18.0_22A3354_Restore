@implementation PLPTPdAssetManager

- (void)cameraWatcherDidChangeState:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint8_t buf[8];
  uint8_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v5 = -[PFCameraViewfinderSessionWatcher isCameraRunning](self->_cameraWatcher, "isCameraRunning");
  PLPTPGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Camera view finder change to running. Canceling inflight request.", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v10 = buf;
    v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__21969;
    v13 = __Block_byref_object_dispose__21970;
    v14 = 0;
    v8 = MEMORY[0x1E0C809B0];
    PLRunWithUnfairLock();
    objc_msgSend(*((id *)v10 + 5), "invalidateWithHandler:", &__block_literal_global_22076, v8, 3221225472, __50__PLPTPdAssetManager_cameraWatcherDidChangeState___block_invoke, &unk_1E3677C68, self, buf);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Camera view finder change to NOT running.", buf, 2u);
    }

    -[PLPTPdAssetManager _requestFinalizationOfNextAsset](self, "_requestFinalizationOfNextAsset");
  }

}

void __50__PLPTPdAssetManager_cameraWatcherDidChangeState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  *(_QWORD *)(v2 + 96) = 0;

}

- (PLPTPdAssetManager)init
{
  PLPTPdAssetManager *v2;
  id v3;
  uint64_t v4;
  PLPTPdFormatConversionManager *formatConversionManager;
  void *v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  dispatch_queue_t v8;
  OS_dispatch_queue *availableAssetsQueue;
  dispatch_group_t v10;
  OS_dispatch_group *analyticsAsyncDataGroup;
  uint64_t v12;
  NSMutableArray *finalizationRequestLock_assetsRequiringFinalization;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  uint64_t v17;
  PFCameraViewfinderSessionWatcher *cameraWatcher;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PLPTPdAssetManager;
  v2 = -[PLPTPdAssetManager init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    -[PLPTPdAssetManager setFileManager:](v2, "setFileManager:", v3);

    v4 = objc_opt_new();
    formatConversionManager = v2->_formatConversionManager;
    v2->_formatConversionManager = (PLPTPdFormatConversionManager *)v4;

    objc_msgSend(MEMORY[0x1E0D75128], "legacyCapabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPTPdAssetManager setPeerMediaCapabilities:](v2, "setPeerMediaCapabilities:", v6);

    v2->_libraryStatus = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)PLPTPdHandleGlobalPhotoLibraryAvailableNotification, (CFStringRef)PLGlobalPhotoLibraryAvailableNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (MKBDeviceUnlockedSinceBoot() != 1)
      -[PLPTPdAssetManager _registerForFirstUnlockNotification](v2, "_registerForFirstUnlockNotification");
    v8 = dispatch_queue_create("com.apple.PLPTPDAvailableAssetsQueue", 0);
    availableAssetsQueue = v2->availableAssetsQueue;
    v2->availableAssetsQueue = (OS_dispatch_queue *)v8;

    v2->_analyticsDataLock._os_unfair_lock_opaque = 0;
    v10 = dispatch_group_create();
    analyticsAsyncDataGroup = v2->_analyticsAsyncDataGroup;
    v2->_analyticsAsyncDataGroup = (OS_dispatch_group *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    finalizationRequestLock_assetsRequiringFinalization = v2->_finalizationRequestLock_assetsRequiringFinalization;
    v2->_finalizationRequestLock_assetsRequiringFinalization = (NSMutableArray *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INITIATED, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = dispatch_queue_create("com.apple.photos.plptpdassetmanager.finalizationrequestqueue", v15);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D750E0]), "initWithDispatchQueue:delegate:", v16, v2);
    cameraWatcher = v2->_cameraWatcher;
    v2->_cameraWatcher = (PFCameraViewfinderSessionWatcher *)v17;

    v2->_finalizationRequestLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)initForUnitTestSupportWithPhotoLibrary:(id)a3
{
  id v5;
  PLPTPdAssetManager *v6;
  PLPTPdAssetManager *v7;
  void *v8;

  v5 = a3;
  v6 = -[PLPTPdAssetManager init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v7->_libraryStatus = 2;
    -[PLPhotoLibrary managedObjectContext](v7->_photoLibrary, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPtpNotificationDelegate:", v7);

  }
  return v7;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[PLPTPdFormatConversionManager invalidate](self->_formatConversionManager, "invalidate");
  -[PLPhotoLibrary managedObjectContext](self->_photoLibrary, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPtpNotificationDelegate:", 0);

  +[PLManagedAsset ptpResetEventAndFilenameMapping](PLManagedAsset, "ptpResetEventAndFilenameMapping");
  v5.receiver = self;
  v5.super_class = (Class)PLPTPdAssetManager;
  -[PLPTPdAssetManager dealloc](&v5, sel_dealloc);
}

- (void)_registerForFirstUnlockNotification
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  int v6;
  NSObject *v7;
  uint8_t buf[16];
  _QWORD v9[6];
  _QWORD v10[3];
  int v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PLPTPdAssetManager__registerForFirstUnlockNotification__block_invoke;
  v9[3] = &unk_1E3677C68;
  v9[4] = self;
  v9[5] = v10;
  v2 = (void *)MEMORY[0x19AEC174C](v9, a2);
  PLPTPGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Registering for first unlock", buf, 2u);
  }

  v4 = MEMORY[0x1E0C80D38];
  v5 = v2;
  v6 = pl_notify_register_dispatch();

  if (v6)
  {
    PLPTPGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Unable to wait for first unlock", buf, 2u);
    }

  }
  _Block_object_dispose(v10, 8);
}

- (void)handlePhotoLibraryAvailableNotification
{
  NSObject *v3;
  unsigned int libraryStatus;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  PLPTPGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Photo library availability changed", buf, 2u);
  }

  if (self->_delegate)
  {
    libraryStatus = self->_libraryStatus;
    -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      PLPTPGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_INFO, "Photo library is now available", v7, 2u);
      }

      if (libraryStatus <= 1 && (objc_opt_respondsToSelector() & 1) != 0)
        -[PhotoLibraryPTPDelegate libraryDidBecomeAvailable](self->_delegate, "libraryDidBecomeAvailable");
    }
  }
}

- (PLPhotoLibrary)photoLibrary
{
  void *v3;
  PLPhotoLibraryOptions *v4;
  PLPhotoLibrary *v5;
  id v6;
  PLPhotoLibrary *photoLibrary;
  PLPhotoLibrary *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!self->_photoLibrary)
  {
    if (+[PLIndicatorFileCoordinator systemLibraryAvailableIndicatorState](PLIndicatorFileCoordinator, "systemLibraryAvailableIndicatorState"))
    {
      if (MKBDeviceUnlockedSinceBoot() == 1)
      {
        objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = objc_alloc_init(PLPhotoLibraryOptions);
        -[PLPhotoLibraryOptions setAutomaticallyMergesContext:](v4, "setAutomaticallyMergesContext:", 1);
        -[PLPhotoLibraryOptions setAutomaticallyPinToFirstFetch:](v4, "setAutomaticallyPinToFirstFetch:", 0);
        v16 = 0;
        v5 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLPTPdAssetManager photoLibrary]", v3, v4, &v16);
        v6 = v16;
        photoLibrary = self->_photoLibrary;
        self->_photoLibrary = v5;

        v8 = self->_photoLibrary;
        if (!v8)
        {
          PLPTPGetLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v18 = "-[PLPTPdAssetManager photoLibrary]";
            v19 = 2112;
            v20 = v3;
            v21 = 2112;
            v22 = v6;
            _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to load photo library %s from %@ error: %@", buf, 0x20u);
          }

          v8 = self->_photoLibrary;
        }
        self->_libraryStatus = 2;
        -[PLPhotoLibrary managedObjectContext](v8, "managedObjectContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPtpNotificationDelegate:", self);
        -[PLPhotoLibrary libraryBundle](self->_photoLibrary, "libraryBundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "beginObservingChanges");

        PLPTPGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_INFO, "Photo library available", buf, 2u);
        }

      }
      else
      {
        if ((photoLibrary_logNotAvailable & 1) == 0)
        {
          PLPTPGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Photo library is not available because device has not yet been unlocked", buf, 2u);
          }

          photoLibrary_logNotAvailable = 1;
        }
        self->_libraryStatus = 1;
      }
    }
    else
    {
      self->_libraryStatus = 1;
      PLPTPGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Photo library is not yet available", buf, 2u);
      }

    }
  }
  return self->_photoLibrary;
}

- (void)setPeerMediaCapabilities:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPTPGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Set peer media capabilities: %@", buf, 0xCu);
  }

  -[PLPTPdFormatConversionManager setPeerMediaCapabilities:](self->_formatConversionManager, "setPeerMediaCapabilities:", v4);
  v6 = v4;
  PLRunWithUnfairLock();

}

- (PFMediaCapabilities)peerMediaCapabilities
{
  return -[PLPTPdFormatConversionManager peerMediaCapabilities](self->_formatConversionManager, "peerMediaCapabilities");
}

- (void)setHostCharacteristics:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99E08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPTPHostCharacteristicsKeyMake"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D754E0]);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPTPHostCharacteristicsKeyOS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D754B8]);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPTPHostCharacteristicsKeyOSVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D75500]);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLPTPHostCharacteristicsKeyTransport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D754D8]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("YES"), *MEMORY[0x1E0D75490]);
  v10 = v5;
  PLRunWithUnfairLock();

}

- (void)managedObjectContext:(id)a3 libraryChangedWithInsertedAssetIDs:(id)a4 deletedAssetIDs:(id)a5 changedAssetIDs:(id)a6 adjustedAssetIDs:(id)a7
{
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  int v48;
  int v49;
  const __CFString *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  uint64_t v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  PhotoLibraryPTPDelegate *delegate;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  PLPTPdAssetManager *v82;
  void *v83;
  id obj;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(uint64_t);
  void *v109;
  PLPTPdAssetManager *v110;
  uint64_t *v111;
  uint64_t v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  id v117;
  _BYTE buf[24];
  const __CFString *v119;
  void (*v120)(uint64_t);
  id v121;
  _BYTE v122[128];
  _BYTE v123[128];
  void *v124;
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v80 = a4;
  v81 = a5;
  v79 = a6;
  v78 = a7;
  v112 = 0;
  v113 = &v112;
  v114 = 0x3032000000;
  v115 = __Block_byref_object_copy__21969;
  v116 = __Block_byref_object_dispose__21970;
  v117 = 0;
  v106 = MEMORY[0x1E0C809B0];
  v107 = 3221225472;
  v108 = __127__PLPTPdAssetManager_managedObjectContext_libraryChangedWithInsertedAssetIDs_deletedAssetIDs_changedAssetIDs_adjustedAssetIDs___block_invoke;
  v109 = &unk_1E3677C68;
  v110 = self;
  v111 = &v112;
  v82 = self;
  pl_dispatch_sync();
  if (v113[5])
  {
    PLPTPGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v80, "valueForKey:", CFSTR("pl_shortURI"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Inserted IDs: %@", buf, 0xCu);

    }
    PLPTPGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v81, "valueForKey:", CFSTR("pl_shortURI"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Deleted IDs: %@", buf, 0xCu);

    }
    PLPTPGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v79, "valueForKey:", CFSTR("pl_shortURI"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Changed IDs: %@", buf, 0xCu);

    }
    PLPTPGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v78, "valueForKey:", CFSTR("pl_shortURI"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "CHANGE NOTIFICATION: Adjusted IDs: %@", buf, 0xCu);

    }
    +[PLManagedObject entityInManagedObjectContext:](PLManagedAsset, "entityInManagedObjectContext:", v77);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0x1E0C99000uLL;
    if (objc_msgSend(v80, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v80);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "minusSet:", v113[5]);
      objc_msgSend(v21, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "pl_fetchObjectsWithIDs:rootEntity:", v22, v76);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      PLPTPGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v23, "valueForKey:", CFSTR("objectID"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v80;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEBUG, "New assets to insert: %@ (%@)", buf, 0x16u);

      }
    }
    else
    {
      v23 = 0;
    }
    if (objc_msgSend(v79, "count"))
    {
      objc_msgSend(v77, "pl_fetchObjectsWithIDs:rootEntity:", v79, v76);
      v85 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v85 = 0;
    }
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    obj = v23;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v125, 16);
    if (v26)
    {
      v83 = 0;
      v27 = *(_QWORD *)v103;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v103 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
          objc_msgSend(v29, "pathForOriginalFile");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            if (objc_msgSend(v29, "deferredProcessingNeeded") == 1
              || objc_msgSend(v29, "deferredProcessingNeeded") == 2)
            {
              PLPTPGetLog();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v29, "objectID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "pl_shortURI");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "filename");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v29, "savedAssetType");
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)&buf[4] = v33;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v34;
                *(_WORD *)&buf[22] = 2048;
                v119 = (const __CFString *)v35;
                _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEBUG, "Requires camera pipeline deferred processing: (asset: %@, filename: %@, savedAssetType: %ld)", buf, 0x20u);

                v20 = 0x1E0C99000;
              }

              objc_msgSend(v29, "objectID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = v36;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v124, 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[PLPTPdAssetManager addAssetsNeedingFinalization:](v82, "addAssetsNeedingFinalization:", v37);

            }
            else
            {
              if (!v83)
              {
                objc_msgSend(*(id *)(v20 + 3616), "setWithCapacity:", objc_msgSend(v80, "count"));
                v83 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v29, "objectID");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v83, "addObject:", v36);
            }

          }
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v125, 16);
      }
      while (v26);
    }
    else
    {
      v83 = 0;
    }

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v86 = v85;
    v38 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v98, v123, 16);
    v39 = 0;
    if (v38)
    {
      v40 = *(_QWORD *)v99;
      do
      {
        v87 = v38;
        for (j = 0; j != v87; ++j)
        {
          if (*(_QWORD *)v99 != v40)
            objc_enumerationMutation(v86);
          v42 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
          objc_msgSend(v42, "objectID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          PLPTPGetLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v42, "objectID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "pl_shortURI");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v42, "isTrashed"))
              v47 = CFSTR("Y");
            else
              v47 = CFSTR("N");
            v48 = objc_msgSend((id)v113[5], "containsObject:", v43);
            v49 = objc_msgSend(v42, "deferredProcessingNeeded");
            *(_DWORD *)buf = 138413058;
            v50 = CFSTR("N");
            if (v48)
              v50 = CFSTR("Y");
            *(_QWORD *)&buf[4] = v46;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v47;
            *(_WORD *)&buf[22] = 2112;
            v119 = v50;
            LOWORD(v120) = 1024;
            *(_DWORD *)((char *)&v120 + 2) = v49;
            _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEBUG, "Processing changed asset (%@), isTrashed: %@, vended: %@, deferred processing: %u", buf, 0x26u);

            v20 = 0x1E0C99000uLL;
          }

          if ((objc_msgSend(v42, "isInTrash") & 1) != 0
            || (objc_msgSend((id)v113[5], "containsObject:", v43) & 1) != 0
            || objc_msgSend(v42, "deferredProcessingNeeded") == 1
            || objc_msgSend(v42, "deferredProcessingNeeded") == 2)
          {
            if (objc_msgSend(v42, "isInTrash")
              && objc_msgSend((id)v113[5], "containsObject:", v43))
            {
              PLPTPGetLog();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v42, "uuid");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "pl_shortURI");
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v52;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v53;
                _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_DEBUG, "Deleting changed asset: %@ (%@)", buf, 0x16u);

              }
              if (!v39)
              {
                objc_msgSend(*(id *)(v20 + 3616), "setWithCapacity:", objc_msgSend(v81, "count") + objc_msgSend(v86, "count"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v39, "addObject:", v43);
            }
            else
            {
              PLPTPGetLog();
              v54 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v42, "uuid");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "pl_shortURI");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v55;
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v56;
                _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_DEBUG, "Ignoring changed asset: %@ (%@)", buf, 0x16u);

              }
            }
          }
          else
          {
            PLPTPGetLog();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v42, "uuid");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "pl_shortURI");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v58;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v59;
              _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_DEBUG, "Inserting changed asset: %@ (%@)", buf, 0x16u);

            }
            v60 = v83;
            if (!v83)
            {
              objc_msgSend(*(id *)(v20 + 3616), "setWithCapacity:", objc_msgSend(v79, "count") + objc_msgSend(v80, "count"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v83 = v60;
            objc_msgSend(v60, "addObject:", v43);
          }

        }
        v38 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v98, v123, 16);
      }
      while (v38);
    }

    v96 = 0u;
    v97 = 0u;
    v95 = 0u;
    v94 = 0u;
    v61 = v81;
    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v94, v122, 16);
    if (v62)
    {
      v63 = *(_QWORD *)v95;
      do
      {
        for (k = 0; k != v62; ++k)
        {
          if (*(_QWORD *)v95 != v63)
            objc_enumerationMutation(v61);
          v65 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * k);
          if (!v39)
          {
            objc_msgSend(*(id *)(v20 + 3616), "setWithCapacity:", objc_msgSend(v61, "count"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
          }
          if (objc_msgSend((id)v113[5], "containsObject:", v65))
            objc_msgSend(v39, "addObject:", v65);
        }
        v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v94, v122, 16);
      }
      while (v62);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v119 = (const __CFString *)__Block_byref_object_copy__21969;
    v120 = __Block_byref_object_dispose__21970;
    v121 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy__21969;
    v92 = __Block_byref_object_dispose__21970;
    v93 = 0;
    v66 = v83;
    v67 = v39;
    pl_dispatch_sync();
    v68 = objc_msgSend((id)v89[5], "count");
    v69 = objc_msgSend(v67, "count");
    if (v69 + v68 + objc_msgSend(v78, "count"))
    {
      v70 = objc_msgSend(v78, "count");
      v71 = v78;
      if (!v70)
        v71 = 0;
      v72 = v71;
      delegate = v82->_delegate;
      v74 = v89[5];
      objc_msgSend(v67, "allObjects");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[PhotoLibraryPTPDelegate addedPhotoKeys:deletedPhotoKeys:changedPhotoKeys:changePendingPhotoKeys:](delegate, "addedPhotoKeys:deletedPhotoKeys:changedPhotoKeys:changePendingPhotoKeys:", v74, v75, v72, 0);

    }
    _Block_object_dispose(&v88, 8);

    _Block_object_dispose(buf, 8);
  }
  _Block_object_dispose(&v112, 8);

}

- (PhotoLibraryPTPDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  PFCameraViewfinderSessionWatcher *v5;
  NSObject *v6;
  NSObject *v7;
  PFCameraViewfinderSessionWatcher *cameraWatcher;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  PFCameraViewfinderSessionWatcher *v14;
  PFCameraViewfinderSessionWatcher *v15;
  int v16;
  PFCameraViewfinderSessionWatcher *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (PFCameraViewfinderSessionWatcher *)a3;
  PLPTPGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "setDelegate: %@", (uint8_t *)&v16, 0xCu);
  }

  objc_storeStrong((id *)&self->_delegate, a3);
  if (self->_delegate)
  {
    PLPTPGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      cameraWatcher = self->_cameraWatcher;
      v16 = 134217984;
      v17 = cameraWatcher;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Starting camera viewfinder watching (%p)", (uint8_t *)&v16, 0xCu);
    }

    -[PFCameraViewfinderSessionWatcher startWatching](self->_cameraWatcher, "startWatching");
    -[PLPTPdAssetManager _startAnalyticsCollection](self, "_startAnalyticsCollection");
  }
  else
  {
    -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "libraryBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetsdClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "notificationClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "asyncNotifyEndOfInterestForUnrenderedCinematicVideoItems");

    -[PLPTPdAssetManager _stopAnalyticsCollectionAndReport](self, "_stopAnalyticsCollectionAndReport");
    PLPTPGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = self->_cameraWatcher;
      v16 = 134217984;
      v17 = v14;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "Stopping camera viewfinder watching (%p)", (uint8_t *)&v16, 0xCu);
    }

    -[PFCameraViewfinderSessionWatcher stopWatching](self->_cameraWatcher, "stopWatching");
    v15 = self->_cameraWatcher;
    self->_cameraWatcher = 0;

  }
}

- (void)ptpEnumerateAllAssetsUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  PLPTPdAssetManager *v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke;
  v16 = &unk_1E3677AA0;
  v17 = self;
  pl_dispatch_sync();
  -[PLPTPdAssetManager _ensureDeferredRenderingIsComplete](self, "_ensureDeferredRenderingIsComplete");
  -[PLPTPdAssetManager _ptpAssetEnumeratorAllAssets](self, "_ptpAssetEnumeratorAllAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke_2;
  v10[3] = &unk_1E3666530;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12 = v4;
  v8 = v4;
  objc_msgSend(v6, "enumerateAssetsUsingBlock:", v10);
  v9 = v7;
  pl_dispatch_sync();

}

- (void)_ensureDeferredRenderingIsComplete
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PLPTPdAssetManager__ensureDeferredRenderingIsComplete__block_invoke;
  v4[3] = &unk_1E3677AA0;
  v5 = v2;
  v3 = v2;
  objc_msgSend(v3, "performBlock:", v4);

}

- (id)ptpThumbnailForAssetHandle:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  double height;
  double width;
  id v10;
  NSObject *v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  height = a4.height;
  width = a4.width;
  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPdAssetManager.m"), 474, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assetHandle isKindOfClass:[PLPTPAssetHandle class]]"));

  }
  PLPTPGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Requesting thumbnail for asset handle: %@", buf, 0xCu);
  }

  if (objc_msgSend(v10, "type") == 5)
    goto LABEL_8;
  if (!objc_msgSend(v10, "type"))
  {
    if (objc_msgSend(v10, "hasSiblingAssetWithAssetHandleType:", 5)
      && (objc_msgSend(v10, "hasSiblingAssetWithAssetHandleType:", 4) & 1) == 0)
    {
      objc_msgSend(v10, "assetID");
      v12 = objc_claimAutoreleasedReturnValue();
      *(float *)&v20 = a5;
      -[PLPTPdAssetManager _ptpThumbnailForOriginalVideoWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForOriginalVideoWithAssetID:size:compressionQuality:", v12, width, height, v20);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "assetID");
      v12 = objc_claimAutoreleasedReturnValue();
      *(float *)&v17 = a5;
      -[PLPTPdAssetManager _ptpThumbnailForOriginalWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForOriginalWithAssetID:size:compressionQuality:", v12, width, height, v17);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "type") == 4)
  {
LABEL_8:
    objc_msgSend(v10, "assetID");
    v12 = objc_claimAutoreleasedReturnValue();
    *(float *)&v13 = a5;
    -[PLPTPdAssetManager _ptpThumbnailForFullSizeRenderWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForFullSizeRenderWithAssetID:size:compressionQuality:", v12, width, height, v13);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v15 = (void *)v14;
    goto LABEL_10;
  }
  if (objc_msgSend(v10, "type") == 6)
  {
    objc_msgSend(v10, "assetID");
    v12 = objc_claimAutoreleasedReturnValue();
    *(float *)&v18 = a5;
    -[PLPTPdAssetManager _ptpThumbnailForSpatialOverCaptureImageWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForSpatialOverCaptureImageWithAssetID:size:compressionQuality:", v12, width, height, v18);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "type") == 7)
  {
    objc_msgSend(v10, "assetID");
    v12 = objc_claimAutoreleasedReturnValue();
    *(float *)&v19 = a5;
    -[PLPTPdAssetManager _ptpThumbnailForSpatialOverCaptureVideoWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForSpatialOverCaptureVideoWithAssetID:size:compressionQuality:", v12, width, height, v19);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v10, "type") == 10)
  {
    objc_msgSend(v10, "assetID");
    v12 = objc_claimAutoreleasedReturnValue();
    *(float *)&v21 = a5;
    -[PLPTPdAssetManager _ptpThumbnailForPenultimateImageWithAssetID:size:compressionQuality:](self, "_ptpThumbnailForPenultimateImageWithAssetID:size:compressionQuality:", v12, width, height, v21);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  PLPTPGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v10;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "No thumbnail for asset handle: %@", buf, 0xCu);
  }
  v15 = 0;
LABEL_10:

  return v15;
}

- (id)ptpAssetReaderForAssetHandle:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v12;
  _QWORD v13[4];
  id v14;
  PLPTPdAssetManager *v15;
  __int128 *p_buf;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  PLPTPdAssetManager *v21;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPdAssetManager.m"), 507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assetHandle isKindOfClass:[PLPTPAssetHandle class]]"));

  }
  PLPTPGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Requesting asset reader for asset handle: %@", (uint8_t *)&buf, 0xCu);
  }

  v7 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke;
  v20 = &unk_1E3677AA0;
  v21 = self;
  PLRunWithUnfairLock();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__21969;
  v25 = __Block_byref_object_dispose__21970;
  v26 = 0;
  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_2;
  v13[3] = &unk_1E3676EA0;
  v9 = v5;
  v14 = v9;
  v15 = self;
  p_buf = &buf;
  objc_msgSend(v8, "performBlockAndWait:", v13);

  v10 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (id)adjustmentFilePathForAsset:(id)a3 requiresTemporaryFileCleanup:(BOOL *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  uint64_t v20;

  v5 = a3;
  objc_msgSend(v5, "pathForAdjustmentFile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x1E0D750B0], "adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:predictedSize:", v7, 0))
  {
    v19 = 0;
    if (!a4)
      goto LABEL_8;
LABEL_7:
    *a4 = v19;
    goto LABEL_8;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@-%@-reassembled-data-%@"), v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingPathComponent:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fileURLWithPath:isDirectory:", v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(MEMORY[0x1E0D750B0], "writeReassembleAdjustmentsPropertyListAtURL:toURL:error:", v7, v17, 0);
  v19 = v18;
  v20 = 0;
  if (v18)
  {
    objc_msgSend(v17, "path");
    v20 = objc_claimAutoreleasedReturnValue();
  }

  v6 = (void *)v20;
  if (a4)
    goto LABEL_7;
LABEL_8:

  return v6;
}

- (id)assetReaderForFormatConvertedPTPAsset:(id)a3 ofManagedAsset:(id)a4 path:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  PLPTPGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, v8);

  PLPTPGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v19 = 138412290;
    v20 = v9;
    _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PTP transcode", "PTP format converted asset reader for %@", (uint8_t *)&v19, 0xCu);
  }

  -[PLPTPdFormatConversionManager assetReaderForFormatConvertedPTPAsset:ofManagedAsset:path:](self->_formatConversionManager, "assetReaderForFormatConvertedPTPAsset:ofManagedAsset:path:", v8, v10, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  PLPTPGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v12, "PTP transcode", ", (uint8_t *)&v19, 2u);
  }

  return v15;
}

- (id)ptpImagePropertiesForAssetHandle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  PLPTPdAssetManager *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PLPTPdAssetManager_ptpImagePropertiesForAssetHandle___block_invoke;
  v8[3] = &unk_1E36693D8;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[PLPTPdAssetManager _performResultBlockAndWait:](self, "_performResultBlockAndWait:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)cplStorageState
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudPhotoLibraryEnabled");

  if (!v4)
    return 0;
  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCPLSettings settingsWithLibraryBundle:](PLCPLSettings, "settingsWithLibraryBundle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isKeepOriginalsEnabled"))
    v8 = 2;
  else
    v8 = 1;

  return v8;
}

- (BOOL)ptpCanDeleteFiles
{
  void *v2;
  char v3;

  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudPhotoLibraryEnabled") ^ 1;

  return v3;
}

- (BOOL)ptpDeletePhotoForAssetHandle:(id)a3
{
  __CFString *v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  char v13;
  void *v15;
  _QWORD v16[4];
  __CFString *v17;
  PLPTPdAssetManager *v18;
  uint8_t buf[4];
  __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPdAssetManager.m"), 685, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[assetHandle isKindOfClass:[PLPTPAssetHandle class]]"));

  }
  PLPTPGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Deleting asset for asset handle: %@", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__PLPTPdAssetManager_ptpDeletePhotoForAssetHandle___block_invoke;
  v16[3] = &unk_1E3666580;
  v17 = v5;
  v18 = self;
  v7 = v5;
  -[PLPTPdAssetManager _performResultTransactionAndWait:](self, "_performResultTransactionAndWait:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLPTPGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = objc_msgSend(v8, "BOOLValue");
    v11 = CFSTR("NO");
    if (v10)
      v11 = CFSTR("YES");
    v12 = v11;
    *(_DWORD *)buf = 138412290;
    v20 = v12;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "ptpDeletePhotoForAssetHandle is returning: %@", buf, 0xCu);

  }
  v13 = objc_msgSend(v8, "BOOLValue");

  return v13;
}

- (void)_expungeAsset:(id)a3 withReason:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLPTPGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "Expunging asset: %@, reason: %@", buf, 0x16u);
  }

  +[PLAssetTransactionReason transactionReason:](PLAssetTransactionReason, "transactionReason:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deleteWithReason:", v8);
  v10 = v9;
  pl_dispatch_sync();

}

- (void)ptpEnumerateAssetsWithPrimaryKeys:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *, uint8_t *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, uint8_t *))a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
      v14 = (void *)MEMORY[0x19AEC1554]();
      -[PLPTPdAssetManager _ptpAssetsForAssetWithID:](self, "_ptpAssetsForAssetWithID:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      PLPTPGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v17 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 134218242;
        v24 = v17;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEBUG, "ptpd is asking for info for %ld primary keys: %@", buf, 0x16u);
      }

      buf[0] = 0;
      v7[2](v7, v15, buf);
      v18 = buf[0];

      objc_autoreleasePoolPop(v14);
      if (v18)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_ptpAssetsForAssetWithID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  PLPTPdAssetManager *v10;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PLPTPdAssetManager__ptpAssetsForAssetWithID___block_invoke;
  v8[3] = &unk_1E36693D8;
  v9 = v4;
  v10 = self;
  v5 = v4;
  -[PLPTPdAssetManager _performResultBlockAndWait:](self, "_performResultBlockAndWait:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)libraryIsAvailable
{
  void *v2;
  BOOL v3;

  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_allAssetObjectIDs
{
  return -[PLPTPdAssetManager fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:](self, "fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:", 0);
}

- (id)_ptpAssetEnumeratorAllAssets
{
  void *v3;
  void *v4;
  void *v5;

  -[PLPTPdAssetManager _allAssetObjectIDs](self, "_allAssetObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPTPdAssetManager managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPTPdAssetEnumerator enumeratorForAssetManager:assetObjectIDs:managedObjectContext:conversionSupport:](PLPTPdAssetEnumerator, "enumeratorForAssetManager:assetObjectIDs:managedObjectContext:conversionSupport:", self, v3, v4, self->_formatConversionManager);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addAssetsNeedingFinalization:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  PLRunWithUnfairLock();
  -[PLPTPdAssetManager _requestFinalizationOfNextAsset](self, "_requestFinalizationOfNextAsset");

}

- (void)_requestFinalizationOfNextAsset
{
  NSObject *v3;
  uint64_t v4;
  uint8_t buf[8];
  uint8_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (-[PFCameraViewfinderSessionWatcher isCameraRunning](self->_cameraWatcher, "isCameraRunning"))
  {
    PLPTPGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "Camera view finder is running, skipping finalization requests", buf, 2u);
    }

  }
  else
  {
    *(_QWORD *)buf = 0;
    v6 = buf;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__21969;
    v9 = __Block_byref_object_dispose__21970;
    v10 = 0;
    v4 = MEMORY[0x1E0C809B0];
    PLRunWithUnfairLock();
    objc_msgSend(*((id *)v6 + 5), "objectValue", v4, 3221225472, __53__PLPTPdAssetManager__requestFinalizationOfNextAsset__block_invoke, &unk_1E3677C68, self, buf);

    _Block_object_dispose(buf, 8);
  }
}

- (id)_sendFinalizationRequestForAssetObjectID:(id)a3 moc:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  PLPTPdAssetManager *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPdAssetManager.m"), 868, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetObjectID"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPTPdAssetManager.m"), 869, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moc"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__21969;
  v25 = __Block_byref_object_dispose__21970;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __67__PLPTPdAssetManager__sendFinalizationRequestForAssetObjectID_moc___block_invoke;
  v16[3] = &unk_1E3676EC8;
  v10 = v7;
  v17 = v10;
  v11 = v9;
  v19 = self;
  v20 = &v21;
  v18 = v11;
  objc_msgSend(v11, "performBlockAndWait:", v16);
  v12 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v12;
}

- (void)_handleMakeResourceReplyForAssetUUID:(id)a3 assetObjectID:(id)a4 moc:(id)a5 success:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  void *v21;
  __CFString *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  __CFString *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v8 = a6;
  v39 = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  PLPTPGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  v18 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    if (v17)
    {
      objc_msgSend(v13, "pl_shortURI");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v12;
      v33 = 2114;
      v34 = v19;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Finalization successful for asset: %{public}@ (%{public}@)", buf, 0x16u);

    }
    v28[0] = v18;
    v28[1] = 3221225472;
    v28[2] = __91__PLPTPdAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke;
    v28[3] = &unk_1E3677530;
    v28[4] = self;
    v29 = v14;
    v30 = v13;
    objc_msgSend(v29, "performBlock:", v28);

  }
  else
  {
    if (v17)
    {
      if (objc_msgSend(v15, "code") == 3072)
        v20 = CFSTR("was canceled");
      else
        v20 = CFSTR("failed");
      objc_msgSend(v13, "pl_shortURI");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v32 = v20;
      v33 = 2114;
      v34 = v12;
      v35 = 2112;
      v36 = v21;
      v37 = 2112;
      v38 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Finalization %@ for asset: %{public}@ (%@) [%@]", buf, 0x2Au);

    }
  }
  v25 = v15;
  v26 = v13;
  v27 = v12;
  v22 = v12;
  v23 = v13;
  v24 = v15;
  PLRunWithUnfairLock();
  -[PLPTPdAssetManager _requestFinalizationOfNextAsset](self, "_requestFinalizationOfNextAsset");

}

- (CGSize)_validateSize:(CGSize)result
{
  if (result.height < 120.0)
    result.height = 120.0;
  if (result.width < 160.0)
    result.width = 160.0;
  return result;
}

- (CGSize)masterThumbSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "masterThumbnailFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)requestedSize:(CGSize)a3 fitsInSourceSize:(CGSize)a4
{
  double width;

  if (a3.width < a3.height)
    a3.width = a3.height;
  if (a4.width >= a4.height)
    width = a4.width;
  else
    width = a4.height;
  return a3.width <= width;
}

- (id)_ptpThumbnailForOriginalWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  NSObject *v10;
  void *v11;
  __uint64_t v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  __int128 *p_buf;
  CGFloat v19;
  CGFloat v20;
  __uint64_t v21;
  float v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  height = a4.height;
  width = a4.width;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[PLPTPdAssetManager _ptpThumbnailForOriginalWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__21969;
  v26 = __Block_byref_object_dispose__21970;
  v27 = 0;
  v11 = (void *)MEMORY[0x19AEC1554]();
  v12 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__PLPTPdAssetManager__ptpThumbnailForOriginalWithAssetID_size_compressionQuality___block_invoke;
  v16[3] = &unk_1E3666610;
  v16[4] = self;
  v13 = v9;
  v19 = width;
  v20 = height;
  v17 = v13;
  p_buf = &buf;
  v22 = a5;
  v21 = v12;
  -[PLPTPdAssetManager _performBlockAndWait:](self, "_performBlockAndWait:", v16);

  objc_autoreleasePoolPop(v11);
  v14 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v14;
}

- (id)embeddedThumbnailDataForAsset:(id)a3 requestedSize:(CGSize)a4 shouldScale:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  id v9;
  NSObject *v10;
  unsigned int v11;
  uint64_t v12;
  const __CFData *v13;
  CGImageSourceRef v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  char *v22;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];

  v5 = a5;
  height = a4.height;
  width = a4.width;
  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v24 = 136315138;
    v25 = "-[PLPTPdAssetManager embeddedThumbnailDataForAsset:requestedSize:shouldScale:]";
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v24, 0xCu);
  }

  v11 = objc_msgSend(v9, "embeddedThumbnailLength");
  v12 = (int)v11;
  if (v11 > 0x80000)
  {
    if (v5)
    {
      objc_msgSend(v9, "embeddedThumbnailData");
      v13 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      v14 = CGImageSourceCreateWithData(v13, 0);

      if (v14)
      {
        v30 = *MEMORY[0x1E0CBC778];
        if (width >= height)
          v15 = width;
        else
          v15 = height;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPTPdAssetManager _dataForThumbnailImageSource:options:originalOrientation:](self, "_dataForThumbnailImageSource:options:originalOrientation:", v14, v17, (int)objc_msgSend(v9, "originalOrientation"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        CFRelease(v14);
        goto LABEL_18;
      }
    }
    else
    {
      PLPTPGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "uuid");
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        v24 = 138412802;
        v25 = v22;
        v26 = 2048;
        v27 = v12;
        v28 = 2048;
        v29 = 0x80000;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_INFO, "Not using embeddedThumbnailData for asset %@ because the thumbnail size (%lu) exceeds the maximum allowed size (%lu)", (uint8_t *)&v24, 0x20u);

      }
    }
LABEL_17:
    v18 = 0;
    goto LABEL_18;
  }
  if (!v11)
    goto LABEL_17;
  objc_msgSend(v9, "embeddedThumbnailData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PLPTPGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v9, "uuid");
    v20 = (char *)objc_claimAutoreleasedReturnValue();
    v24 = 138412802;
    v25 = v20;
    v26 = 2048;
    v27 = (uint64_t)v18;
    v28 = 2048;
    v29 = v12;
    _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Using embeddedThumbnailData for asset %@: %p %lu", (uint8_t *)&v24, 0x20u);

  }
LABEL_18:

  return v18;
}

- (id)_ptpThumbnailForFullSizeRenderWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  NSObject *v10;
  __uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  CGFloat v17;
  CGFloat v18;
  __uint64_t v19;
  float v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  height = a4.height;
  width = a4.width;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[PLPTPdAssetManager _ptpThumbnailForFullSizeRenderWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v11 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__PLPTPdAssetManager__ptpThumbnailForFullSizeRenderWithAssetID_size_compressionQuality___block_invoke;
  v15[3] = &unk_1E3666638;
  v15[4] = self;
  v16 = v9;
  v17 = width;
  v18 = height;
  v20 = a5;
  v19 = v11;
  v12 = v9;
  -[PLPTPdAssetManager _performResultBlockAndWait:](self, "_performResultBlockAndWait:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_ptpThumbnailForSpatialOverCaptureImageWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  NSObject *v10;
  __uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  CGFloat v17;
  CGFloat v18;
  __uint64_t v19;
  float v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  height = a4.height;
  width = a4.width;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[PLPTPdAssetManager _ptpThumbnailForSpatialOverCaptureImageWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v11 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __97__PLPTPdAssetManager__ptpThumbnailForSpatialOverCaptureImageWithAssetID_size_compressionQuality___block_invoke;
  v15[3] = &unk_1E3666638;
  v15[4] = self;
  v16 = v9;
  v17 = width;
  v18 = height;
  v20 = a5;
  v19 = v11;
  v12 = v9;
  -[PLPTPdAssetManager _performResultBlockAndWait:](self, "_performResultBlockAndWait:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_ptpThumbnailForSpatialOverCaptureVideoWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  NSObject *v9;
  __uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  CGFloat v16;
  CGFloat v17;
  __uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  height = a4.height;
  width = a4.width;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  PLPTPGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PLPTPdAssetManager _ptpThumbnailForSpatialOverCaptureVideoWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__PLPTPdAssetManager__ptpThumbnailForSpatialOverCaptureVideoWithAssetID_size_compressionQuality___block_invoke;
  v14[3] = &unk_1E3666660;
  v14[4] = self;
  v15 = v8;
  v16 = width;
  v17 = height;
  v18 = v10;
  v11 = v8;
  -[PLPTPdAssetManager _performResultBlockAndWait:](self, "_performResultBlockAndWait:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_ptpThumbnailForOriginalVideoWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height;
  CGFloat width;
  id v8;
  NSObject *v9;
  __uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  CGFloat v16;
  CGFloat v17;
  __uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  height = a4.height;
  width = a4.width;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  PLPTPGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PLPTPdAssetManager _ptpThumbnailForOriginalVideoWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v10 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__PLPTPdAssetManager__ptpThumbnailForOriginalVideoWithAssetID_size_compressionQuality___block_invoke;
  v14[3] = &unk_1E3666660;
  v14[4] = self;
  v15 = v8;
  v16 = width;
  v17 = height;
  v18 = v10;
  v11 = v8;
  -[PLPTPdAssetManager _performResultBlockAndWait:](self, "_performResultBlockAndWait:", v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_ptpThumbnailForPenultimateImageWithAssetID:(id)a3 size:(CGSize)a4 compressionQuality:(float)a5
{
  CGFloat height;
  CGFloat width;
  id v9;
  NSObject *v10;
  __uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[5];
  id v16;
  CGFloat v17;
  CGFloat v18;
  __uint64_t v19;
  float v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  height = a4.height;
  width = a4.width;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[PLPTPdAssetManager _ptpThumbnailForPenultimateImageWithAssetID:size:compressionQuality:]";
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v11 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__PLPTPdAssetManager__ptpThumbnailForPenultimateImageWithAssetID_size_compressionQuality___block_invoke;
  v15[3] = &unk_1E3666638;
  v15[4] = self;
  v16 = v9;
  v17 = width;
  v18 = height;
  v20 = a5;
  v19 = v11;
  v12 = v9;
  -[PLPTPdAssetManager _performResultBlockAndWait:](self, "_performResultBlockAndWait:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_inverseAffineTransformForExifOrientation:(int64_t)a3 width:(double)a4 height:(double)a5 completion:(id)a6
{
  switch(a3)
  {
    case 2:
    case 3:
      break;
    case 4:
      a4 = 0.0;
      break;
    case 5:
    case 6:
      a4 = a5;
      break;
    case 7:
    case 8:
      a4 = 0.0;
      break;
    default:
      a4 = *(double *)(MEMORY[0x1E0C9BAA8] + 32);
      break;
  }
  (*((void (**)(__n128, __n128))a6 + 2))(*(__n128 *)&a4, *(__n128 *)&a5);
}

- (id)dataForThumbnailFileAtPath:(id)a3 rotatedToOrientation:(int64_t)a4 size:(CGSize)a5 compressionQuality:(float)a6
{
  double height;
  double width;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  uint64_t v16;
  const void *v17;
  void *v18;
  double v19;
  void *v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  int v31;
  uint64_t v32;
  uint64_t v33;

  height = a5.height;
  width = a5.width;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  PLPTPGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_make_with_pointer(v11, v10);

  PLPTPGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v31 = 138412290;
    v32 = (uint64_t)v10;
    _os_signpost_emit_with_name_impl(&dword_199541000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PTP generate thumbnail data from path", "Path %@", (uint8_t *)&v31, 0xCu);
  }

  v16 = CGImageSourceCreateWithFile();
  if (v16)
  {
    v17 = (const void *)v16;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (width >= height)
      v19 = width;
    else
      v19 = height;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CBC778]);

    if (a4 != 1)
    {
      v21 = 6;
      if (a4 != 8)
        v21 = a4;
      if (a4 == 6)
        v22 = 8;
      else
        v22 = v21;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CBD0C0]);

    }
    -[PLPTPdAssetManager _dataForThumbnailImageSource:options:originalOrientation:](self, "_dataForThumbnailImageSource:options:originalOrientation:", v17, v18, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v17);

    PLPTPGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v15 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v25))
    {
      v27 = objc_msgSend(v24, "length");
      v31 = 134217984;
      v32 = v27;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v12, "PTP generate thumbnail data from path", "Data length: %lu", (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
    PLPTPGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v31 = 138477827;
      v32 = (uint64_t)v10;
      _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Unable to create image source for thumbnail at path %{private}@", (uint8_t *)&v31, 0xCu);
    }

    PLPTPGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    v26 = v29;
    if (v15 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      LOWORD(v31) = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_END, v12, "PTP generate thumbnail from path", "Failed", (uint8_t *)&v31, 2u);
    }
    v24 = 0;
  }

  return v24;
}

- (id)_dataForThumbnailImageSource:(CGImageSource *)a3 options:(id)a4 originalOrientation:(int64_t)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  __CFData *v14;
  void *v15;
  __CFString *v16;
  CGImageDestination *v17;
  uint64_t v18;
  size_t PrimaryImageIndex;
  CGImageSourceRef v20;
  CGImageSource *v21;
  __CFData *v22;
  __CFString *v23;
  CGImageDestination *v24;
  void *v25;
  const __CFDictionary *v26;
  CGImageSource *v27;
  uint64_t v29;
  uint64_t v31;
  void *v32;
  _BYTE buf[12];
  __int16 v34;
  CGImageSource *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  int64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PLPTPGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[PLPTPdAssetManager _dataForThumbnailImageSource:options:originalOrientation:]";
    v34 = 2048;
    v35 = a3;
    v36 = 2112;
    v37 = v7;
    v38 = 2048;
    v39 = a5;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "[%s] imageSource: %p, inOptions: %@, originalOrientation: %lu", buf, 0x2Au);
  }

  v9 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD0C0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  v12 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBD288]);
  if (v11)
    v13 = v12;
  else
    v13 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CBD190]);
  if (a3)
  {
    v14 = (__CFData *)objc_opt_new();
    v15 = (void *)*MEMORY[0x1E0CEC530];
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = CGImageDestinationCreateWithData(v14, v16, 1uLL, 0);

    if (v17)
    {
      v18 = v11;
      PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(a3);
      CGImageDestinationAddImageFromSource(v17, a3, PrimaryImageIndex, (CFDictionaryRef)v9);
      CGImageDestinationFinalize(v17);
      a3 = v14;
      -[PLPTPdAssetManager _logData:withPrefix:scaledOrientation:originalOrientation:](self, "_logData:withPrefix:scaledOrientation:originalOrientation:", a3, CFSTR("SCALED-ROTATED DATA:"), v11, a5);
      CFRelease(v17);
      if (!a3)
        goto LABEL_19;
      v20 = CGImageSourceCreateWithData(a3, 0);
      if (!v20)
        goto LABEL_19;
      v21 = v20;
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v22 = (__CFData *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v24 = CGImageDestinationCreateWithData(v22, v23, 1uLL, 0);

      if (v24)
      {
        v29 = v18;
        v31 = *MEMORY[0x1E0CBC7A8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
        v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0;
        if (CGImageDestinationCopyImageSource(v24, v21, v26, (CFErrorRef *)buf))
        {
          v27 = v22;

          -[PLPTPdAssetManager _logData:withPrefix:scaledOrientation:originalOrientation:](self, "_logData:withPrefix:scaledOrientation:originalOrientation:", v27, CFSTR("FINAL DATA:"), v29, a5);
          a3 = v27;
        }
        CFRelease(v24);

      }
      CFRelease(v21);
    }
    else
    {
      PLPTPGetLog();
      v22 = (__CFData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Unable to create image destination for thumbnail", buf, 2u);
      }
      a3 = 0;
    }

LABEL_19:
  }

  return a3;
}

- (id)_generateThumbnailForAsset:(id)a3 fromOriginalImagePath:(id)a4 size:(CGSize)a5 compressionQuality:(float)a6
{
  double height;
  double width;
  id v11;
  id v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  const __CFData *v36;
  NSObject *v37;
  char *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  const char *v43;
  const __CFDictionary *v47;
  CGImageSourceRef v48;
  uint64_t v49;
  double v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  void *v56;
  uint64_t v57;
  void *v58;
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  height = a5.height;
  width = a5.width;
  v63 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  PLPTPGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v60 = "-[PLPTPdAssetManager _generateThumbnailForAsset:fromOriginalImagePath:size:compressionQuality:]";
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  -[PLPTPdAssetManager _validateSize:](self, "_validateSize:", width, height);
  v15 = v14;
  v17 = v16;
  -[PLPTPdAssetManager masterThumbSize](self, "masterThumbSize");
  v20 = -[PLPTPdAssetManager requestedSize:fitsInSourceSize:](self, "requestedSize:fitsInSourceSize:", v15, v17, v18, v19);
  PLGetSourceTypeHintFromFilename(v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  PLPTPGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v60 = (const char *)v12;
    v61 = 2112;
    v62 = v21;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "Thumbnail path: %@, sourceTypeHint: %@", buf, 0x16u);
  }

  PLPTPGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_signpost_id_make_with_pointer(v23, v12);

  PLPTPGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
  {
    *(_DWORD *)buf = 138412546;
    v60 = (const char *)v12;
    v61 = 2114;
    v62 = v21;
    _os_signpost_emit_with_name_impl(&dword_199541000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PTP generate thumbnail from original", "Path %@ source hint %{public}@", buf, 0x16u);
  }

  if (objc_msgSend(v11, "isVideo") && (objc_msgSend(v11, "isCloudPhotoLibraryAsset") & 1) == 0)
  {
    if (v20)
      v39 = 3039;
    else
      v39 = 9998;
    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v39);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = +[PLImageLoadingUtilities newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:](PLImageLoadingUtilities, "newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:", v11, -[NSObject formatID](v37, "formatID"), 0, 0, 0);
    PLPTPGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v38;
      _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEBUG, "Thumbnail image [1]: %@", buf, 0xCu);
    }

    v36 = 0;
    goto LABEL_31;
  }
  if (!objc_msgSend(v11, "isVideo"))
  {
    if (v21
      && (objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v21),
          v30 = (void *)objc_claimAutoreleasedReturnValue(),
          v31 = objc_msgSend(v30, "isEqual:", *MEMORY[0x1E0CEC580]),
          v30,
          v31))
    {
      if (objc_msgSend(v11, "isCloudPhotoLibraryAsset"))
      {
        objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v20)
          objc_msgSend(v32, "indexSheetUnbakedFormat");
        else
          objc_msgSend(v32, "fullScreenFormatForCurrentDevice");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v56, "formatID");

      }
      else if (v20)
      {
        v34 = 3039;
      }
      else
      {
        v34 = 9998;
      }
    }
    else
    {
      v34 = 3039;
    }
    if (v15 >= v17)
      v35 = v15;
    else
      v35 = v17;
    -[PLPTPdAssetManager _createJPEGThumbnailImageDataFromFileWithPath:sourceTypeHint:formatID:shouldTransform:maxPixelSize:](self, "_createJPEGThumbnailImageDataFromFileWithPath:sourceTypeHint:formatID:shouldTransform:maxPixelSize:", v12, v21, v34, 0, (unint64_t)v35);
    v36 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    PLPTPGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = (const char *)v36;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEBUG, "Thumbnail data [4]: %@", buf, 0xCu);
    }
    v38 = 0;
LABEL_31:
    v27 = v12;
    goto LABEL_40;
  }
  objc_msgSend(v11, "pathForMediumThumbnailFile");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73218], "defaultFormatChooser");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v20)
    objc_msgSend(v28, "indexSheetUnbakedFormat");
  else
    objc_msgSend(v28, "fullScreenFormatForCurrentDevice");
  v37 = objc_claimAutoreleasedReturnValue();

  +[PLPhotoLibrary fileReservationForFileAtPath:exclusive:](PLPhotoLibrary, "fileReservationForFileAtPath:exclusive:", v27, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    v38 = (char *)PLCreateImageFromFileWithFormat(v27, 1u, v21, -[NSObject formatID](v37, "formatID"), 0, 0, 0);
    PLPTPGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v38;
      v43 = "Thumbnail image [3]: %@";
LABEL_38:
      _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEBUG, v43, buf, 0xCu);
    }
  }
  else
  {
    v38 = +[PLImageLoadingUtilities newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:](PLImageLoadingUtilities, "newSynchronousImageForAsset:withFormat:allowPlaceholder:outImageProperties:outDeliveredPlaceholder:", v11, -[NSObject formatID](v37, "formatID"), 0, 0, 0);
    PLPTPGetLog();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v38;
      v43 = "Thumbnail image [2]: %@";
      goto LABEL_38;
    }
  }

  v36 = 0;
LABEL_40:

  if (height == 120.0 && width == 160.0 || a6 < 0.0 || a6 > 1.0)
    a6 = 0.75;
  if (v21)
  {
    v57 = *MEMORY[0x1E0CBD2A8];
    v58 = v21;
    v47 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  }
  else
  {
    v47 = 0;
  }
  v48 = CGImageSourceCreateWithData(v36, v47);
  v49 = DCIM_CGImageRefFromPLImage();
  *(float *)&v50 = a6;
  -[PLPTPdAssetManager _dataByJPEGCompressingCGImage:orSource:toLengthLimit:initialCompressionQuality:size:orientation:](self, "_dataByJPEGCompressingCGImage:orSource:toLengthLimit:initialCompressionQuality:size:orientation:", v49, v48, 0x10000, 0, v50, width, height);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    CFRelease(v48);
  PLPTPGetLog();
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    v54 = objc_msgSend(v51, "length");
    *(_DWORD *)buf = 134217984;
    v60 = (const char *)v54;
    _os_signpost_emit_with_name_impl(&dword_199541000, v53, OS_SIGNPOST_INTERVAL_END, v24, "PTP generate thumbnail from original", "Output data length %lu", buf, 0xCu);
  }

  return v51;
}

- (id)_createJPEGThumbnailImageDataFromFileWithPath:(id)a3 sourceTypeHint:(id)a4 formatID:(unsigned __int16)a5 shouldTransform:(BOOL)a6 maxPixelSize:(unint64_t)a7
{
  _BOOL8 v8;
  uint64_t v9;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  NSObject *v22;
  __CFData *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  CGImageSourceRef v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  __CFString *v33;
  CGImageDestination *v34;
  size_t PrimaryImageIndex;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  NSObject *v39;
  CGImageSource *isrc;
  void *v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;
  _QWORD v46[2];

  v8 = a6;
  v9 = a5;
  v46[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = (void *)MEMORY[0x19AEC1554]();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D752F0], "typeWithIdentifier:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v15 = (void *)MEMORY[0x1E0D752F0];
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "typeForURL:error:", v16, 0);
      v14 = objc_claimAutoreleasedReturnValue();

    }
    if (!-[NSObject conformsToType:](v14, "conformsToType:", *MEMORY[0x1E0CEC520]))
    {
      PLPTPGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        -[NSObject identifier](v14, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v25;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Cannot generate a thumbnail usingImageIO for a non-image type (%{public}@)", buf, 0xCu);

      }
      v23 = 0;
      goto LABEL_35;
    }
    objc_msgSend(MEMORY[0x1E0D73238], "formatWithID:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isThumbnail");
    -[NSObject identifier](v14, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = +[PLManagedAsset isPrimaryImageFormatForUTI:](PLManagedAsset, "isPrimaryImageFormatForUTI:", v19);

    v21 = objc_alloc(MEMORY[0x1E0C99D50]);
    if (!v20 || (v18 & 1) != 0)
      v22 = objc_msgSend(v21, "initWithContentsOfFile:options:error:", v11, 1, 0);
    else
      v22 = objc_msgSend(v21, "initWithContentsOfFile:", v11);
    v24 = v22;
    if (v22)
    {
      if (!a7)
      {
        a7 = PLMaxPixelSizeForFormatAndData(v17, v22);
        if (!a7)
        {
          PLPTPGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            goto LABEL_29;
          *(_WORD *)buf = 0;
          v36 = "No max pixel size specified";
          v37 = v32;
          v38 = 2;
          goto LABEL_28;
        }
      }
      v45 = *MEMORY[0x1E0CBD2A8];
      -[NSObject identifier](v14, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = v26;
      v27 = CGImageSourceCreateWithData((CFDataRef)v24, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1));

      if (v27)
      {
        isrc = v27;
        v42 = v17;
        v28 = objc_alloc(MEMORY[0x1E0C99E08]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *MEMORY[0x1E0CBC778];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v28, "initWithObjectsAndKeys:", v29, v30, v31, *MEMORY[0x1E0CBD190], 0);

        if ((-[NSObject conformsToType:](v14, "conformsToType:", *MEMORY[0x1E0CEC5B8]) & 1) == 0)
          -[NSObject setObject:forKeyedSubscript:](v32, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CBD180]);
        objc_msgSend(MEMORY[0x1E0C99DF0], "data");
        v23 = (__CFData *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v34 = CGImageDestinationCreateWithData(v23, v33, 1uLL, 0);

        if (v34)
        {
          PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(isrc);
          CGImageDestinationAddImageFromSource(v34, isrc, PrimaryImageIndex, (CFDictionaryRef)v32);
          CGImageDestinationFinalize(v34);
          CFRelease(v34);
          v17 = v42;
        }
        else
        {
          PLPTPGetLog();
          v39 = objc_claimAutoreleasedReturnValue();
          v17 = v42;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v11;
            _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Fail to get image dest for path '%@'", buf, 0xCu);
          }

        }
        CFRelease(isrc);
        goto LABEL_34;
      }
      PLPTPGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v11;
        v36 = "Fail to get image source for path '%@'";
        goto LABEL_27;
      }
    }
    else
    {
      PLPTPGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v11;
        v36 = "Failed to load file data for path '%@'";
LABEL_27:
        v37 = v32;
        v38 = 12;
LABEL_28:
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);
      }
    }
LABEL_29:
    v23 = 0;
LABEL_34:

LABEL_35:
    goto LABEL_36;
  }
  PLPTPGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Cannot generate a thumbnail with nil path", buf, 2u);
  }
  v23 = 0;
LABEL_36:

  objc_autoreleasePoolPop(v13);
  return v23;
}

- (id)_dataByJPEGCompressingCGImage:(CGImage *)a3 orSource:(CGImageSource *)a4 toLengthLimit:(int64_t)a5 initialCompressionQuality:(float)a6 size:(CGSize)a7 orientation:(int64_t)a8
{
  double height;
  double width;
  NSObject *v14;
  void *v15;
  double v16;
  unint64_t v17;
  __CFString *v18;
  CGImageDestination *v19;
  void *v20;
  void *v21;
  double v22;
  unint64_t v23;
  int64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  size_t PrimaryImageIndex;
  NSObject *v30;
  uint64_t v31;
  float v32;
  CGImageSourceRef isrc;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int64_t v44;
  _QWORD v45[2];
  _QWORD v46[4];

  height = a7.height;
  width = a7.width;
  isrc = a4;
  v46[2] = *MEMORY[0x1E0C80C00];
  PLPTPGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v40 = "-[PLPTPdAssetManager _dataByJPEGCompressingCGImage:orSource:toLengthLimit:initialCompressionQuality:size:orientation:]";
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  if ((unint64_t)a3 | (unint64_t)isrc)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)*MEMORY[0x1E0CEC530];
    v37 = *MEMORY[0x1E0CBC778];
    if (width >= height)
      v16 = width;
    else
      v16 = height;
    v36 = *MEMORY[0x1E0CBC780];
    v35 = *MEMORY[0x1E0CBCFF0];
    v17 = 0x1E0CB3000uLL;
    do
    {
      objc_msgSend(v15, "setLength:", 0, isrc);
      objc_msgSend(v38, "identifier");
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = CGImageDestinationCreateWithData((CFMutableDataRef)v15, v18, 1uLL, 0);

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0C99E08];
        v45[0] = v37;
        objc_msgSend(*(id *)(v17 + 2024), "numberWithDouble:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v36;
        v46[0] = v21;
        *(float *)&v22 = a6;
        objc_msgSend(*(id *)(v17 + 2024), "numberWithFloat:", v22);
        v23 = v17;
        v24 = a8;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v46[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dictionaryWithDictionary:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        a8 = v24;
        v17 = v23;

        if (a8)
        {
          objc_msgSend(*(id *)(v23 + 2024), "numberWithInteger:", a8);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, v35);

        }
        CGImageDestinationSetProperties(v19, (CFDictionaryRef)v27);
        if (a3)
        {
          CGImageDestinationAddImage(v19, a3, (CFDictionaryRef)v27);
        }
        else
        {
          PrimaryImageIndex = CGImageSourceGetPrimaryImageIndex(isrc);
          v17 = v23;
          CGImageDestinationAddImageFromSource(v19, isrc, PrimaryImageIndex, (CFDictionaryRef)v27);
        }
        CGImageDestinationFinalize(v19);
        CFRelease(v19);

      }
      PLPTPGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v31 = objc_msgSend(v15, "length");
        *(_DWORD *)buf = 134218496;
        v40 = (const char *)v15;
        v41 = 2048;
        v42 = v31;
        v43 = 2048;
        v44 = a5;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_DEBUG, "Thumbnail: %p, size: %lu, limit: %lu", buf, 0x20u);
      }

      if (objc_msgSend(v15, "length") > (unint64_t)a5)
      {
        v32 = a6 / (float)((float)(unint64_t)objc_msgSend(v15, "length") / (float)a5);
        if ((float)(a6 - v32) < 0.25)
          v32 = a6 + -0.25;
        if (v32 >= 0.0)
          a6 = v32;
        else
          a6 = 0.0;
      }
    }
    while (objc_msgSend(v15, "length") > (unint64_t)a5 && a6 >= 0.0 && width == 160.0 && height == 120.0);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (void)beginSignpostForThumbnailGenerationForAsset:(id)a3 inputResourceTypeLabel:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  PLPTPGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_make_with_pointer(v7, v5);

  PLPTPGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    objc_msgSend(v5, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v11;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PTP Thumbnail request", "Resource type %{public}@ Asset UUID %{public}@", (uint8_t *)&v12, 0x16u);

  }
}

- (void)endSignpostForThumbnailGenerationForAsset:(id)a3
{
  id v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a3;
  PLPTPGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_make_with_pointer(v4, v3);

  PLPTPGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_END, v5, "PTP Thumbnail request", ", v8, 2u);
  }

}

- (void)_startAnalyticsCollection
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLPTPdAssetManager *v9;
  _QWORD *v10;
  _QWORD v11[4];
  id v12;
  PLPTPdAssetManager *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  PLPTPdAssetManager *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__21969;
  v21[4] = __Block_byref_object_dispose__21970;
  v22 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke;
  v18 = &unk_1E3677C68;
  v19 = self;
  v20 = v21;
  PLRunWithUnfairLock();
  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_group_enter((dispatch_group_t)self->_analyticsAsyncDataGroup);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_2;
  v11[3] = &unk_1E3676EA0;
  v5 = v4;
  v12 = v5;
  v13 = self;
  v14 = v21;
  objc_msgSend(v5, "performBlock:withPriority:", v11, 0);
  dispatch_group_enter((dispatch_group_t)self->_analyticsAsyncDataGroup);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_163;
  v7[3] = &unk_1E3676EA0;
  v6 = v5;
  v8 = v6;
  v9 = self;
  v10 = v21;
  objc_msgSend(v6, "performBlock:withPriority:", v7, 0);

  _Block_object_dispose(v21, 8);
}

- (void)_stopAnalyticsCollectionAndReport
{
  NSObject *analyticsAsyncDataGroup;
  NSObject *v4;
  _QWORD block[5];
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__21969;
  v6[4] = __Block_byref_object_dispose__21970;
  -[PLPTPdAssetManager popAnalyticsData](self, "popAnalyticsData");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  analyticsAsyncDataGroup = self->_analyticsAsyncDataGroup;
  dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__PLPTPdAssetManager__stopAnalyticsCollectionAndReport__block_invoke;
  block[3] = &unk_1E3677580;
  block[4] = v6;
  dispatch_group_notify(analyticsAsyncDataGroup, v4, block);

  _Block_object_dispose(v6, 8);
}

- (id)popAnalyticsData
{
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__21969;
  v8 = __Block_byref_object_dispose__21970;
  v9 = 0;
  PLRunWithUnfairLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

- (void)_performBlockAndWait:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PLPTPdAssetManager__performBlockAndWait___block_invoke;
  v8[3] = &unk_1E3676CD8;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v7, "performBlockAndWait:", v8);

}

- (id)_performResultBlockAndWait:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__21969;
  v15 = __Block_byref_object_dispose__21970;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__PLPTPdAssetManager__performResultBlockAndWait___block_invoke;
  v8[3] = &unk_1E36714A8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[PLPTPdAssetManager _performBlockAndWait:](self, "_performBlockAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_performTransactionAndWait:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__PLPTPdAssetManager__performTransactionAndWait___block_invoke;
  v9[3] = &unk_1E3675C58;
  v10 = v6;
  v11 = v4;
  v7 = v6;
  v8 = v4;
  objc_msgSend(v7, "performBlockAndWait:", v9);

}

- (id)_performResultTransactionAndWait:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__21969;
  v15 = __Block_byref_object_dispose__21970;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PLPTPdAssetManager__performResultTransactionAndWait___block_invoke;
  v8[3] = &unk_1E36714A8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[PLPTPdAssetManager _performTransactionAndWait:](self, "_performTransactionAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (PLManagedObjectContext)managedObjectContext
{
  void *v2;
  void *v3;

  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLManagedObjectContext *)v3;
}

- (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PLPTPdAssetManager photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLPTPFetches fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:inLibrary:](PLPTPFetches, "fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:inLibrary:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (NSFileManager)fileManager
{
  return self->fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->fileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fileManager, 0);
  objc_storeStrong((id *)&self->_cameraWatcher, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_requestInflight, 0);
  objc_storeStrong((id *)&self->_finalizationRequestLock_assetsRequiringFinalization, 0);
  objc_storeStrong((id *)&self->_analyticsAsyncDataGroup, 0);
  objc_storeStrong((id *)&self->_analyticsData, 0);
  objc_storeStrong((id *)&self->availableAssetsQueue, 0);
  objc_storeStrong((id *)&self->_ptpDeletedAssets, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_availableAssetIDs, 0);
  objc_storeStrong((id *)&self->_formatConversionManager, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __55__PLPTPdAssetManager__performResultTransactionAndWait___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__PLPTPdAssetManager__performTransactionAndWait___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v2 = (void *)MEMORY[0x19AEC1554]();
    v3 = *(void **)(a1 + 32);
    v9 = 0;
    v4 = objc_msgSend(v3, "save:", &v9);
    v5 = v9;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to save context %@: %@"), *(_QWORD *)(a1 + 32), v5);
      v6 = objc_claimAutoreleasedReturnValue();
      PLPTPGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v6;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Save failed with error %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v6, 0);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v8);
    }

    objc_autoreleasePoolPop(v2);
  }
}

void __49__PLPTPdAssetManager__performResultBlockAndWait___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__PLPTPdAssetManager__performBlockAndWait___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x19AEC1554]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __38__PLPTPdAssetManager_popAnalyticsData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTimeDisconnected:", (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

}

uint64_t __55__PLPTPdAssetManager__stopAnalyticsCollectionAndReport__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "report");
}

void __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke(uint64_t a1)
{
  PLPTPAnalyticsData *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(PLPTPAnalyticsData);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setTimeConnected:", (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setCplState:", objc_msgSend(*(id *)(a1 + 32), "cplStorageState"));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

void __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "countForFetchRequest:error:", v4, &v9);
  v7 = v9;

  if (v6)
  {
    PLRunWithUnfairLock();
  }
  else if (v7)
  {
    PLPTPGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Error fetching count of library assets: %@", buf, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 80));

}

void __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_163(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %d"), CFSTR("deferredProcessingNeeded"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v4, &v10);
  v8 = v10;

  if (v7)
  {
    PLRunWithUnfairLock();
  }
  else if (v8)
  {
    PLPTPGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error fetching count for assets with pending deferred processing: %@", buf, 0xCu);
    }

  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 40) + 80));

}

uint64_t __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_2_166(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setDeferredRenderCount:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__PLPTPdAssetManager__startAnalyticsCollection__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setLibraryAssetCount:", *(_QWORD *)(a1 + 40));
}

id __90__PLPTPdAssetManager__ptpThumbnailForPenultimateImageWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  double v7;
  void *v8;
  NSObject *v9;
  double v10;
  int v12;
  double v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginSignpostForThumbnailGenerationForAsset:inputResourceTypeLabel:", v3, CFSTR("penultimate"));
    objc_msgSend(v3, "pathForPenultimateFullsizeRenderImageFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(v3, "originalOrientation");
    LODWORD(v7) = *(_DWORD *)(a1 + 72);
    objc_msgSend(v5, "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v4, v6, *(double *)(a1 + 48), *(double *)(a1 + 56), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endSignpostForThumbnailGenerationForAsset:", v3);

  }
  else
  {
    v8 = 0;
  }
  PLPTPGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(_QWORD *)(a1 + 64)) / 1000000000.0;
    v12 = 134218499;
    v13 = v10;
    v14 = 2113;
    v15 = 0;
    v16 = 2048;
    v17 = objc_msgSend(v8, "length");
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Generated thumbnail (adjustment base) in %.3fs, name: %{private}@, size: %ld", (uint8_t *)&v12, 0x20u);
  }

  return v8;
}

id __87__PLPTPdAssetManager__ptpThumbnailForOriginalVideoWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  id v15;
  id v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginSignpostForThumbnailGenerationForAsset:inputResourceTypeLabel:", v3, CFSTR("spatial-over-capture"));
    objc_msgSend(v3, "pathForOriginalFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 0;
    v7 = objc_msgSend(v5, "generatePosterFrameExportForVideoURL:outputData:maximumSize:error:", v6, &v16, &v15, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v8 = v16;
    v9 = v15;

    if ((v7 & 1) == 0)
    {
      PLPTPGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = *(double *)&v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Unable to generate video thumbnail (original video): %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "endSignpostForThumbnailGenerationForAsset:", v3);

  }
  else
  {
    v8 = 0;
  }
  PLPTPGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(_QWORD *)(a1 + 64)) / 1000000000.0;
    v13 = objc_msgSend(v8, "length");
    *(_DWORD *)buf = 134218499;
    v18 = v12;
    v19 = 2113;
    v20 = 0;
    v21 = 2048;
    v22 = v13;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Generated thumbnail (original video) in %.3fs, name: %{private}@, size: %ld", buf, 0x20u);
  }

  return v8;
}

id __97__PLPTPdAssetManager__ptpThumbnailForSpatialOverCaptureVideoWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  uint64_t v13;
  id v15;
  id v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginSignpostForThumbnailGenerationForAsset:inputResourceTypeLabel:", v3, CFSTR("spatial-over-capture"));
    objc_msgSend(v3, "pathForSpatialOverCaptureContentFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 0;
    v7 = objc_msgSend(v5, "generatePosterFrameExportForVideoURL:outputData:maximumSize:error:", v6, &v16, &v15, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v8 = v16;
    v9 = v15;

    if ((v7 & 1) == 0)
    {
      PLPTPGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = *(double *)&v9;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Unable to generate video thumbnail (spatial over capture video): %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "endSignpostForThumbnailGenerationForAsset:", v3);

  }
  else
  {
    v8 = 0;
  }
  PLPTPGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(_QWORD *)(a1 + 64)) / 1000000000.0;
    v13 = objc_msgSend(v8, "length");
    *(_DWORD *)buf = 134218499;
    v18 = v12;
    v19 = 2113;
    v20 = 0;
    v21 = 2048;
    v22 = v13;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "Generated thumbnail (spatial over capture video) in %.3fs, name: %{private}@, size: %ld", buf, 0x20u);
  }

  return v8;
}

id __97__PLPTPdAssetManager__ptpThumbnailForSpatialOverCaptureImageWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  NSObject *v7;
  double v8;
  int v10;
  double v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginSignpostForThumbnailGenerationForAsset:inputResourceTypeLabel:", v3, CFSTR("spatial-over-capture"));
    objc_msgSend(v3, "pathForSpatialOverCaptureContentFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = *(_DWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v4, 1, *(double *)(a1 + 48), *(double *)(a1 + 56), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endSignpostForThumbnailGenerationForAsset:", v3);

  }
  else
  {
    v6 = 0;
  }
  PLPTPGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(_QWORD *)(a1 + 64)) / 1000000000.0;
    v10 = 134218499;
    v11 = v8;
    v12 = 2113;
    v13 = 0;
    v14 = 2048;
    v15 = objc_msgSend(v6, "length");
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Generated thumbnail (spatial over capture image) in %.3fs, name: %{private}@, size: %ld", (uint8_t *)&v10, 0x20u);
  }

  return v6;
}

id __88__PLPTPdAssetManager__ptpThumbnailForFullSizeRenderWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  double v16;
  NSObject *v17;
  double v18;
  int v20;
  double v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v12 = 0;
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 32), "beginSignpostForThumbnailGenerationForAsset:inputResourceTypeLabel:", v3, CFSTR("fullsize-render"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "masterThumbSize");
  if (!objc_msgSend(v4, "requestedSize:fitsInSourceSize:", *(double *)(a1 + 48), *(double *)(a1 + 56), v5, v6))
  {
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v2, "thumbnailManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "thumbnailJPEGPathForPhoto:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_9;
  }
  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(v3, "originalOrientation");
  LODWORD(v11) = *(_DWORD *)(a1 + 72);
  objc_msgSend(v9, "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v8, v10, *(double *)(a1 + 48), *(double *)(a1 + 56), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_9:
    objc_msgSend(v3, "pathForFullsizeImageFile");
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      v15 = objc_msgSend(v3, "originalOrientation");
      LODWORD(v16) = *(_DWORD *)(a1 + 72);
      objc_msgSend(v14, "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v13, v15, *(double *)(a1 + 48), *(double *)(a1 + 56), v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)v13;
    }
    else
    {
      v8 = 0;
      v12 = 0;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "endSignpostForThumbnailGenerationForAsset:", v3);

LABEL_13:
  PLPTPGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(_QWORD *)(a1 + 64)) / 1000000000.0;
    v20 = 134218499;
    v21 = v18;
    v22 = 2113;
    v23 = 0;
    v24 = 2048;
    v25 = objc_msgSend(v12, "length");
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Generated thumbnail (adjusted) in %.3fs, name: %{private}@, size: %ld", (uint8_t *)&v20, 0x20u);
  }

  return v12;
}

void __82__PLPTPdAssetManager__ptpThumbnailForOriginalWithAssetID_size_compressionQuality___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  char v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CGImageSource *v25;
  const __CFDictionary *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  float v32;
  double v33;
  uint64_t v34;
  void *v35;
  float v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  CGFloat v49;
  void *v50;
  float v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  int v56;
  double v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  NSObject *v65;
  uint32_t v66;
  void *v67;
  void *v68;
  double v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  double v74;
  void *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  NSObject *v89;
  void *v90;
  uint64_t v91;
  const void *v92;
  BOOL v93;
  uint8_t buf[4];
  double v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  NSObject *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[2];
  NSSize v104;
  NSSize v105;
  NSSize v106;
  NSSize v107;
  NSSize v108;

  v103[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginSignpostForThumbnailGenerationForAsset:inputResourceTypeLabel:", v3, CFSTR("original"));
    objc_msgSend(*(id *)(a1 + 32), "_validateSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    v5 = v4;
    v7 = v6;
    PLPTPGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSize(*(NSSize *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v104.width = v5;
      v104.height = v7;
      NSStringFromSize(v104);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v95 = *(double *)&v9;
      v96 = 2112;
      v97 = (uint64_t)v10;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "requested size: %@, valid size: %@", buf, 0x16u);

    }
    v11 = v7 == 120.0 && v5 == 160.0;
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "embeddedThumbnailDataForAsset:requestedSize:shouldScale:", v3, objc_msgSend(v3, "hasAdjustments"), 160.0, 120.0);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        PLPTPGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v3, "originalFilename");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v95 = *(double *)&v16;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "No data from embedded thumb for %@", buf, 0xCu);

        }
      }
    }
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      goto LABEL_61;
    v17 = objc_msgSend(v3, "hasAdjustments");
    PLPTPGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);
    if ((v17 & 1) != 0)
    {
      if (v19)
      {
        objc_msgSend(v3, "originalFilename");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v95 = *(double *)&v20;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "asset '%@' IS adjusted", buf, 0xCu);

      }
      objc_msgSend(v3, "pathForNonAdjustedLargeThumbnailFile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0CBD288];
      v102 = *MEMORY[0x1E0CBD288];
      v23 = MEMORY[0x1E0C9AAB0];
      v103[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, &v102, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (CGImageSource *)CGImageSourceCreateWithFile();

      if (!v25)
      {

        goto LABEL_40;
      }
      v100 = v22;
      v101 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
      v26 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v27 = CGImageSourceCopyPropertiesAtIndex(v25, 0, v26);

      if (!v27)
      {
        PLPTPGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v95 = *(double *)&v21;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "No props for path %@", buf, 0xCu);
        }

      }
      v93 = v11;
      v29 = *(void **)(a1 + 32);
      v30 = *MEMORY[0x1E0CBD048];
      -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD048], v25);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "floatValue");
      v33 = v32;
      v34 = *MEMORY[0x1E0CBD040];
      -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", *MEMORY[0x1E0CBD040]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      LODWORD(v29) = objc_msgSend(v29, "requestedSize:fitsInSourceSize:", v5, v7, v33, v36);

      if ((_DWORD)v29)
      {
        v37 = v21;
        PLPTPGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v95 = *(double *)&v37;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEBUG, "Thumbnail file path from asset: %@", buf, 0xCu);
        }
      }
      else
      {
        PLPTPGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v107.width = v5;
          v107.height = v7;
          NSStringFromSize(v107);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v30);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "floatValue");
          v49 = v48;
          -[NSObject objectForKeyedSubscript:](v27, "objectForKeyedSubscript:", v34);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "floatValue");
          v108.height = v51;
          v108.width = v49;
          NSStringFromSize(v108);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v95 = *(double *)&v46;
          v96 = 2112;
          v97 = (uint64_t)v52;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEBUG, "valid size %@ does not fit in source size %@", buf, 0x16u);

        }
        v37 = 0;
      }
      LOBYTE(v11) = v93;

      CFRelease(v92);
    }
    else
    {
      if (v19)
      {
        objc_msgSend(v3, "originalFilename");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v95 = *(double *)&v39;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "asset '%@' is NOT adjusted", buf, 0xCu);

      }
      v40 = *(void **)(a1 + 32);
      objc_msgSend(v40, "masterThumbSize");
      if (!objc_msgSend(v40, "requestedSize:fitsInSourceSize:", v5, v7, v41, v42))
        goto LABEL_40;
      PLPTPGetLog();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        v105.width = v5;
        v105.height = v7;
        NSStringFromSize(v105);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "masterThumbSize");
        NSStringFromSize(v106);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v95 = *(double *)&v44;
        v96 = 2112;
        v97 = (uint64_t)v45;
        _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEBUG, "validSize (%@) fits in masterThumbSize (%@)", buf, 0x16u);

      }
      objc_msgSend(v2, "thumbnailManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "thumbnailJPEGPathForPhoto:", v3);
      v37 = objc_claimAutoreleasedReturnValue();
      PLPTPGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v95 = *(double *)&v37;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "Thumbnail file path from thumbnail manager: %@", buf, 0xCu);
      }
    }

    if (v37)
    {
      objc_msgSend(*(id *)(a1 + 32), "fileManager");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "fileExistsAtPath:", v37);

      if (v54)
      {
        v55 = *(void **)(a1 + 32);
        v56 = objc_msgSend(v3, "originalOrientation");
        LODWORD(v57) = *(_DWORD *)(a1 + 80);
        objc_msgSend(v55, "dataForThumbnailFileAtPath:rotatedToOrientation:size:compressionQuality:", v37, v56, *(double *)(a1 + 56), *(double *)(a1 + 64), v57);
        v58 = objc_claimAutoreleasedReturnValue();
        v59 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v60 = *(void **)(v59 + 40);
        *(_QWORD *)(v59 + 40) = v58;

        PLPTPGetLog();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v62 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v63 = objc_msgSend(v62, "length");
          *(_DWORD *)buf = 134218498;
          v95 = *(double *)&v62;
          v96 = 2048;
          v97 = v63;
          v98 = 2112;
          v99 = v37;
          v64 = "Thumbnail file data [1]: %p, %lu, %@";
          v65 = v61;
          v66 = 32;
LABEL_44:
          _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_DEBUG, v64, buf, v66);
        }
      }
      else
      {
        PLPTPGetLog();
        v61 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v95 = *(double *)&v37;
          v65 = v61;
          v66 = 12;
          goto LABEL_44;
        }
      }

LABEL_46:
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        v67 = *(void **)(a1 + 32);
        objc_msgSend(v3, "pathForOriginalFile");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v69) = *(_DWORD *)(a1 + 80);
        objc_msgSend(v67, "_generateThumbnailForAsset:fromOriginalImagePath:size:compressionQuality:", v3, v68, *(double *)(a1 + 56), *(double *)(a1 + 64), v69);
        v70 = objc_claimAutoreleasedReturnValue();
        v71 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v72 = *(void **)(v71 + 40);
        *(_QWORD *)(v71 + 40) = v70;

        PLPTPGetLog();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          v74 = (double)(clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) - *(_QWORD *)(a1 + 72)) / 1000000000.0;
          objc_msgSend(v3, "pathForOriginalFile");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "lastPathComponent");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v77 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          *(_DWORD *)buf = 134218498;
          v95 = v74;
          v96 = 2112;
          v97 = (uint64_t)v76;
          v98 = 2048;
          v99 = v77;
          _os_log_impl(&dword_199541000, v73, OS_LOG_TYPE_DEBUG, "Generated thumbnail (original) in %.3fs, name: %@, size: %ld", buf, 0x20u);

        }
        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
          objc_msgSend(v3, "fileURLForThumbnailFile");
          v78 = objc_claimAutoreleasedReturnValue();
          if (v78)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v78);
            v79 = objc_claimAutoreleasedReturnValue();
            v80 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v81 = *(void **)(v80 + 40);
            *(_QWORD *)(v80 + 40) = v79;

            PLPTPGetLog();
            v82 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            {
              v83 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
              v84 = objc_msgSend(v83, "length");
              *(_DWORD *)buf = 134218498;
              v95 = *(double *)&v83;
              v96 = 2048;
              v97 = v84;
              v98 = 2112;
              v99 = v78;
              _os_log_impl(&dword_199541000, v82, OS_LOG_TYPE_DEBUG, "Thumbnail file data from [2]: %p, %lu, %@", buf, 0x20u);
            }

          }
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
            v85 = 1;
          else
            v85 = v11;
          if ((v85 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "embeddedThumbnailDataForAsset:requestedSize:shouldScale:", v3, objc_msgSend(v3, "hasAdjustments"), v5, v7);
            v86 = objc_claimAutoreleasedReturnValue();
            v87 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v88 = *(void **)(v87 + 40);
            *(_QWORD *)(v87 + 40) = v86;

            PLPTPGetLog();
            v89 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
            {
              v90 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
              v91 = objc_msgSend(v90, "length");
              *(_DWORD *)buf = 134218240;
              v95 = *(double *)&v90;
              v96 = 2048;
              v97 = v91;
              _os_log_impl(&dword_199541000, v89, OS_LOG_TYPE_DEBUG, "Using embeddedThumbnailData fallback: %p %lu", buf, 0x16u);
            }

          }
        }
      }
LABEL_61:
      objc_msgSend(*(id *)(a1 + 32), "endSignpostForThumbnailGenerationForAsset:", v3);
      goto LABEL_62;
    }
LABEL_40:
    PLPTPGetLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEBUG, "Still don't have a thumbnailFilePath", buf, 2u);
    }
    goto LABEL_46;
  }
LABEL_62:

}

uint64_t __50__PLPTPdAssetManager_cameraWatcherDidChangeState___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

void __91__PLPTPdAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = a1[6];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "managedObjectContext:libraryChangedWithInsertedAssetIDs:deletedAssetIDs:changedAssetIDs:adjustedAssetIDs:", v2, 0, 0, v3, 0);

}

void __91__PLPTPdAssetManager__handleMakeResourceReplyForAssetUUID_assetObjectID_moc_success_error___block_invoke_140(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "code") == 3072)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "insertObject:atIndex:", *(_QWORD *)(a1 + 48), 0);
    PLPTPGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v3 = *(_QWORD *)(a1 + 56);
      v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "count");
      v7 = 138412546;
      v8 = v3;
      v9 = 2048;
      v10 = v4;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Re-enqueued finalization for asset (uuid: %@, pending: %lu) because it was canceled", (uint8_t *)&v7, 0x16u);
    }

  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = 0;

}

void __67__PLPTPdAssetManager__sendFinalizationRequestForAssetObjectID_moc___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  PLResourceXPCMakeAvailableRequest *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  PLResourceXPCMakeAvailableRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset assetWithObjectID:inManagedObjectContext:](PLManagedAsset, "assetWithObjectID:inManagedObjectContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLPTPGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "pl_shortURI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v3;
    v24 = 2114;
    v25 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Requesting finalization of asset: %{public}@ (%{public}@)", buf, 0x16u);

  }
  v6 = [PLResourceXPCMakeAvailableRequest alloc];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ptp-%@"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "primaryStoreOriginalResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLResourceXPCMakeAvailableRequest initWithTaskIdentifier:assetObjectID:resource:](v6, "initWithTaskIdentifier:assetObjectID:resource:", v7, v8, v9);

  objc_msgSend(MEMORY[0x1E0D73280], "systemLibraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLPhotoLibraryBundleController sharedAssetsdClientForPhotoLibraryURL:](PLPhotoLibraryBundleController, "sharedAssetsdClientForPhotoLibraryURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "resourceAvailabilityClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__PLPTPdAssetManager__sendFinalizationRequestForAssetObjectID_moc___block_invoke_134;
  v18[3] = &unk_1E36665A8;
  v18[4] = *(_QWORD *)(a1 + 48);
  v19 = v3;
  v20 = *(id *)(a1 + 32);
  v21 = *(id *)(a1 + 40);
  v14 = v3;
  objc_msgSend(v13, "sendMakeResourceAvailableRequest:reply:", v10, v18);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

uint64_t __67__PLPTPdAssetManager__sendFinalizationRequestForAssetObjectID_moc___block_invoke_134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleMakeResourceReplyForAssetUUID:assetObjectID:moc:success:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, a6);
}

void __53__PLPTPdAssetManager__requestFinalizationOfNextAsset__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  PLPTPGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "count");
    *(_DWORD *)buf = 134217984;
    v18 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Camera view finder is NOT running, sending finalization requests (pending:%lu)", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_initWeak((id *)buf, v5);

    v7 = objc_alloc(MEMORY[0x1E0D73248]);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __53__PLPTPdAssetManager__requestFinalizationOfNextAsset__block_invoke_125;
    v14 = &unk_1E3670E50;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v4;
    v8 = objc_msgSend(v7, "initWithBlock:", &v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "removeObjectAtIndex:", 0, v11, v12, v13, v14);
  }

}

id __53__PLPTPdAssetManager__requestFinalizationOfNextAsset__block_invoke_125(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendFinalizationRequestForAssetObjectID:moc:", v4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __51__PLPTPdAssetManager_addAssetsNeedingFinalization___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLPTPGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEBUG, "Adding %lu assets to pending finalization queue.", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "addObjectsFromArray:", *(_QWORD *)(a1 + 32));
}

id __47__PLPTPdAssetManager__ptpAssetsForAssetWithID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pictureTransferProtocolAssetsWithConversionSupport:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __47__PLPTPdAssetManager__expungeAsset_withReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mutableCopy");
  objc_msgSend(v9, "removeObject:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", v9);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v6;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));

}

id __51__PLPTPdAssetManager_ptpDeletePhotoForAssetHandle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLPTPGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138412290;
    v32 = (uint64_t)v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Asset for handle: %@", (uint8_t *)&v31, 0xCu);

  }
  if (!v4)
  {
    PLPTPGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v31 = 138412290;
      v32 = v14;
      v15 = "Unable to find asset for asset handle: %@";
LABEL_15:
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v31, 0xCu);
    }
LABEL_16:

    v19 = (void *)MEMORY[0x1E0C9AAA0];
    goto LABEL_40;
  }
  objc_msgSend(*(id *)(a1 + 32), "sidecarID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "additionalAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "ptpTrashedState");

    switch(objc_msgSend(*(id *)(a1 + 32), "type"))
    {
      case 0:
        v17 |= 1uLL;
        goto LABEL_29;
      case 1:
        v17 |= 2uLL;
        goto LABEL_29;
      case 2:
        v17 |= 0x10000uLL;
        goto LABEL_29;
      case 3:
        PLPTPGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = *(_QWORD *)(a1 + 32);
          v31 = 138412290;
          v32 = v21;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Got a sidecar handle but found no sidecar file: %@", (uint8_t *)&v31, 0xCu);
        }

        v12 = 0;
        goto LABEL_30;
      case 4:
        v17 |= 4uLL;
        goto LABEL_29;
      case 5:
        v17 |= 8uLL;
        goto LABEL_29;
      case 6:
      case 7:
        v17 |= 0x10uLL;
        goto LABEL_29;
      case 8:
        v17 |= 0x20uLL;
        goto LABEL_29;
      case 9:
        v17 |= 0x40uLL;
        goto LABEL_29;
      case 10:
        v17 |= 0x80uLL;
        goto LABEL_29;
      case 11:
        v17 |= 0x100uLL;
        goto LABEL_29;
      default:
LABEL_29:
        v12 = 1;
LABEL_30:
        objc_msgSend(v4, "additionalAttributes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setPtpTrashedState:", v17);

        PLPTPGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v31 = 134217984;
          v32 = v17;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Updated asset trashed state: 0x%llx", (uint8_t *)&v31, 0xCu);
        }
        break;
    }
    goto LABEL_32;
  }
  objc_msgSend(*(id *)(a1 + 32), "sidecarID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sidecarWithResourceObjectID:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PLPTPGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      v31 = 138412290;
      v32 = v18;
      v15 = "Unable to find sidecar for asset handle: %@";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  -[NSObject setPtpTrashedState:](v9, "setPtpTrashedState:", 1);
  PLPTPGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = -[NSObject ptpTrashedState](v9, "ptpTrashedState");
    v31 = 134217984;
    v32 = v11;
    _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Updated sidecar trashed state: 0x%llx", (uint8_t *)&v31, 0xCu);
  }

  v12 = 1;
LABEL_32:

  v23 = +[PLPTPUtilities shouldExpungeAsset:](PLPTPUtilities, "shouldExpungeAsset:", v4);
  PLPTPGetLog();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "uuid");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 32);
      v31 = 138412546;
      v32 = (uint64_t)v26;
      v33 = 2112;
      v34 = v27;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_INFO, "Expunge asset %@ for handle: %@", (uint8_t *)&v31, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "_expungeAsset:withReason:", v4, CFSTR("PTP client deleted the asset"));
  }
  else
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "uuid");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 32);
      v31 = 138412546;
      v32 = (uint64_t)v28;
      v33 = 2112;
      v34 = v29;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEBUG, "Not expunging asset %@ for handle: %@", (uint8_t *)&v31, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v19;
}

id __55__PLPTPdAssetManager_ptpImagePropertiesForAssetHandle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "assetID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "imageProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDownloadedCount:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "downloadedCount") + 1);
}

void __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int v29;
  PLPTPAssetReader *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  unsigned __int8 v35;
  _QWORD v36[4];
  id v37;
  NSObject *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "assetID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLPTPGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v4, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v41 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Asset for reader: %@", buf, 0xCu);

  }
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "sidecarID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sidecarWithResourceObjectID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pictureTransferProtocolAssetsWithConversionSupport:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_102;
    v36[3] = &unk_1E3666558;
    v10 = v8;
    v37 = v10;
    v11 = v7;
    v38 = v11;
    v39 = *(id *)(a1 + 32);
    objc_msgSend(v9, "_pl_firstObjectPassingTest:", v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    if (v10)
    {
      +[PLPTPUtilities pathForSidecar:onAsset:](PLPTPUtilities, "pathForSidecar:onAsset:", v10, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(*(id *)(a1 + 32), "requiresConversion");
      PLPTPGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v16;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "Sidecar for reader: %@", buf, 0xCu);

      }
    }
    else
    {
      switch(objc_msgSend(*(id *)(a1 + 32), "type"))
      {
        case 0:
          objc_msgSend(v4, "pathForOriginalFile");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        case 1:
          objc_msgSend(*(id *)(a1 + 40), "adjustmentFilePathForAsset:requiresTemporaryFileCleanup:", v4, &v35);
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        case 2:
          objc_msgSend(v4, "pathForAdjustmentSecondaryDataFile");
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        case 3:
          PLPTPGetLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = *(void **)(a1 + 32);
            *(_DWORD *)buf = 138412290;
            v41 = v21;
            _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Got a sidecar handle but found no sidecar file: %@", buf, 0xCu);
          }

          goto LABEL_18;
        case 4:
          objc_msgSend(v4, "pathForFullsizeRenderImageFile");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        case 5:
          objc_msgSend(v4, "pathForFullsizeRenderVideoFile");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        case 6:
        case 7:
          objc_msgSend(v4, "pathForSpatialOverCaptureContentFile");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        case 8:
          objc_msgSend(v4, "pathForVideoComplementSpatialOverCaptureContentFile");
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_22:
          v13 = (void *)v18;
          v14 = objc_msgSend(*(id *)(a1 + 32), "requiresConversion");
          break;
        case 9:
          objc_msgSend(v4, "pathForOriginalAdjustmentFile");
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        case 10:
          objc_msgSend(v4, "pathForPenultimateFullsizeRenderImageFile");
          v19 = objc_claimAutoreleasedReturnValue();
          goto LABEL_26;
        case 11:
          objc_msgSend(v4, "pathForPenultimateFullsizeRenderVideoFile");
          v19 = objc_claimAutoreleasedReturnValue();
LABEL_26:
          v13 = (void *)v19;
          v14 = 0;
          break;
        default:
LABEL_18:
          v14 = 0;
          v13 = 0;
          break;
      }
    }
    PLPTPGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = CFSTR("NO");
      if (v14)
        v23 = CFSTR("YES");
      v24 = v23;
      *(_DWORD *)buf = 138412546;
      v41 = v13;
      v42 = 2112;
      v43 = v24;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "Asset reader path: %@, requiresConversion: %@", buf, 0x16u);

    }
    if (v13)
    {
      if (MEMORY[0x19AEC0FFC]()
        && objc_msgSend(*(id *)(a1 + 32), "type") != 1
        && objc_msgSend(*(id *)(a1 + 32), "type") != 2
        && objc_msgSend(*(id *)(a1 + 32), "type") != 9)
      {
        objc_msgSend(v4, "location");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          plslogGreenTea();
        if (PLIsForegroundApplication())
          cpllogGreenTeaTransmittingPhotosOrVideos();
      }
      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 40), "assetReaderForFormatConvertedPTPAsset:ofManagedAsset:path:", v12, v4, v13);
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v28 = *(void **)(v27 + 40);
        *(_QWORD *)(v27 + 40) = v26;

        v34 = v4;
        PLRunWithUnfairLock();

      }
      else
      {
        v29 = v35;
        v30 = [PLPTPAssetReader alloc];
        if (v29)
          v31 = -[PLPTPAssetReader initWithTemporaryFileDeletedOnDeallocPath:](v30, "initWithTemporaryFileDeletedOnDeallocPath:", v13);
        else
          v31 = -[PLPTPAssetReader initWithPath:](v30, "initWithPath:", v13);
        v32 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v33 = *(void **)(v32 + 40);
        *(_QWORD *)(v32 + 40) = v31;

      }
    }

  }
  else
  {
    PLPTPGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v41 = v17;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to find asset for asset handle: %@", buf, 0xCu);
    }
  }

}

uint64_t __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_102(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "assetHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "sidecarID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v8 = objc_msgSend(v4, "type");
    v7 = v8 == objc_msgSend(*(id *)(a1 + 48), "type");
  }

  return v7;
}

uint64_t __51__PLPTPdAssetManager_ptpAssetReaderForAssetHandle___block_invoke_109(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "incrementConversionCountForAssetType:", objc_msgSend(*(id *)(a1 + 40), "kind"));
}

void __56__PLPTPdAssetManager__ensureDeferredRenderingIsComplete__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d AND %K = %d"), CFSTR("depthType"), 2, CFSTR("deferredProcessingNeeded"), 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetsdClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "notificationClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asyncNotifyStartOfInterestForUnrenderedCinematicVideoItems");

  }
  if (v8)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Fecth for cinematic video queued for processing failed: %@", buf, 0xCu);
    }

  }
}

void __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

void __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "valueForKeyPath:", CFSTR("assetHandle.assetID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v4);
  PLPTPGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = 136315394;
    v7 = "-[PLPTPdAssetManager ptpEnumerateAllAssetsUsingBlock:]_block_invoke_2";
    v8 = 2048;
    v9 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%s: Adding %lu assets to PTP", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__PLPTPdAssetManager_ptpEnumerateAllAssetsUsingBlock___block_invoke_85(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

void __127__PLPTPdAssetManager_managedObjectContext_libraryChangedWithInsertedAssetIDs_deletedAssetIDs_changedAssetIDs_adjustedAssetIDs___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __127__PLPTPdAssetManager_managedObjectContext_libraryChangedWithInsertedAssetIDs_deletedAssetIDs_changedAssetIDs_adjustedAssetIDs___block_invoke_80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:", *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "mutableCopy");
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    if (!v8)
    {
      v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "mutableCopy");
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    objc_msgSend(v8, "minusSet:", *(_QWORD *)(a1 + 48));
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(v13 + 24);
    *(_QWORD *)(v13 + 24) = v12;

  }
}

uint64_t __45__PLPTPdAssetManager_setHostCharacteristics___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "updateWithPlatformInformation:", *(_QWORD *)(a1 + 40));
}

void __47__PLPTPdAssetManager_setPeerMediaCapabilities___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 40), "platformInformation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateWithPlatformInformation:", v2);

}

uint64_t __57__PLPTPdAssetManager__registerForFirstUnlockNotification__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MKBDeviceUnlockedSinceBoot();
  if ((_DWORD)result == 1)
  {
    notify_cancel(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "handlePhotoLibraryAvailableNotification");
  }
  return result;
}

uint64_t __57__PLPTPdAssetManager__registerForFirstUnlockNotification__block_invoke_59(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

@end
