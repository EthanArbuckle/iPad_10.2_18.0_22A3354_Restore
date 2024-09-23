@implementation ICQDaemonOfferConditions

+ (id)currentConditions
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCurrentConditions");
}

- (ICQDaemonOfferConditions)initWithCurrentConditions
{
  ICQDaemonOfferConditions *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICQDaemonOfferConditions;
  v2 = -[ICQDaemonOfferConditions init](&v6, sel_init);
  if (v2)
  {
    -[ICQDaemonOfferConditions setDeviceStorageAlmostFull:](v2, "setDeviceStorageAlmostFull:", objc_msgSend((id)objc_opt_class(), "isDeviceStorageAlmostFull"));
    -[ICQDaemonOfferConditions setPhotosCloudEnabled:](v2, "setPhotosCloudEnabled:", objc_msgSend((id)objc_opt_class(), "isPhotosCloudEnabled"));
    if (-[ICQDaemonOfferConditions isPhotosCloudEnabled](v2, "isPhotosCloudEnabled"))
      v3 = objc_msgSend((id)objc_opt_class(), "isPhotosOptimizeEnabled");
    else
      v3 = 0;
    -[ICQDaemonOfferConditions setPhotosOptimizeEnabled:](v2, "setPhotosOptimizeEnabled:", v3);
    if (-[ICQDaemonOfferConditions isPhotosCloudEnabled](v2, "isPhotosCloudEnabled"))
    {
      -[ICQDaemonOfferConditions setPhotosLibrarySize:](v2, "setPhotosLibrarySize:", 0);
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "photosLibrarySize");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQDaemonOfferConditions setPhotosLibrarySize:](v2, "setPhotosLibrarySize:", v4);

    }
    -[ICQDaemonOfferConditions setBackupRestoreComplete:](v2, "setBackupRestoreComplete:", objc_msgSend((id)objc_opt_class(), "backupRestoreComplete"));
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setDeviceStorageAlmostFull:", -[ICQDaemonOfferConditions isDeviceStorageAlmostFull](self, "isDeviceStorageAlmostFull"));
  objc_msgSend(v4, "setPhotosCloudEnabled:", -[ICQDaemonOfferConditions isPhotosCloudEnabled](self, "isPhotosCloudEnabled"));
  objc_msgSend(v4, "setPhotosOptimizeEnabled:", -[ICQDaemonOfferConditions isPhotosOptimizeEnabled](self, "isPhotosOptimizeEnabled"));
  -[ICQDaemonOfferConditions photosLibrarySize](self, "photosLibrarySize");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhotosLibrarySize:", v5);

  objc_msgSend(v4, "setBackupRestoreComplete:", -[ICQDaemonOfferConditions isBackupRestoreComplete](self, "isBackupRestoreComplete"));
  return v4;
}

+ (BOOL)isDeviceStorageAlmostFull
{
  BOOL v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isSimulatedDeviceStorageAlmostFull") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73318]), "initWithPath:", CFSTR("/private/var"));
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "availableSpace");
      _ICQGetLogSystem();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 134349056;
        v17 = v5;
        _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "Found %{public}llu bytes of free space", (uint8_t *)&v16, 0xCu);
      }

      v7 = CacheDeleteCopyPurgeableSpaceWithInfo();
      -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        _ICQGetLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_ERROR"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412290;
          v17 = (unint64_t)v10;
          _os_log_impl(&dword_1CDEBD000, v9, OS_LOG_TYPE_DEFAULT, "Failed to get purgable space from Cache Delete: %@", (uint8_t *)&v16, 0xCu);

        }
      }
      else
      {
        -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedLongLongValue");

        _ICQGetLogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 134349056;
          v17 = v12;
          _os_log_impl(&dword_1CDEBD000, v13, OS_LOG_TYPE_DEFAULT, "Found %{public}llu bytes of purgeable space", (uint8_t *)&v16, 0xCu);
        }

        v5 += v12;
      }
      if (v5 >= objc_msgSend(v4, "lowDiskThreshold"))
      {
        v2 = v5 < 2 * objc_msgSend(v4, "nearLowDiskThreshold");
        goto LABEL_21;
      }
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1CDEBD000, v14, OS_LOG_TYPE_DEFAULT, "user volume is eating into the reserve -- too low for offers", (uint8_t *)&v16, 2u);
      }

    }
    else
    {
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1CDEBD000, v7, OS_LOG_TYPE_DEFAULT, "Unable to get user volume status", (uint8_t *)&v16, 2u);
      }
    }
    v2 = 0;
LABEL_21:

    return v2;
  }
  return 1;
}

+ (BOOL)isPhotosCloudEnabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getPLIsCPLDataclassEnabledSymbolLoc_ptr;
  v10 = getPLIsCPLDataclassEnabledSymbolLoc_ptr;
  if (!getPLIsCPLDataclassEnabledSymbolLoc_ptr)
  {
    v3 = (void *)PhotoLibraryServicesLibrary();
    v2 = dlsym(v3, "PLIsCPLDataclassEnabled");
    v8[3] = (uint64_t)v2;
    getPLIsCPLDataclassEnabledSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v6 = (_Unwind_Exception *)+[ICQDaemonOfferConditions isPhotosCloudEnabled].cold.1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return ((uint64_t (*)(uint64_t))v2)(v4);
}

+ (BOOL)hasPhotosCloudEverBeenEnabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  _Unwind_Exception *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr;
  v10 = getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr;
  if (!getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr)
  {
    v3 = (void *)PhotoLibraryServicesLibrary();
    v2 = dlsym(v3, "PLCPLHasBeenEnabledForCurrentAccount");
    v8[3] = (uint64_t)v2;
    getPLCPLHasBeenEnabledForCurrentAccountSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v6 = (_Unwind_Exception *)+[ICQDaemonOfferConditions isPhotosCloudEnabled].cold.1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  return ((uint64_t (*)(uint64_t))v2)(v4);
}

+ (BOOL)isPhotosOptimizeEnabled
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _Unwind_Exception *v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v2 = objc_msgSend(a1, "isPhotosCloudEnabled");
  if (v2)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v3 = getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr;
    v11 = getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr;
    if (!getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr)
    {
      v4 = (void *)PhotoLibraryServicesLibrary();
      v3 = dlsym(v4, "PLCloudPhotoLibraryKeepOriginalsIsEnabled");
      v9[3] = (uint64_t)v3;
      getPLCloudPhotoLibraryKeepOriginalsIsEnabledSymbolLoc_ptr = v3;
    }
    _Block_object_dispose(&v8, 8);
    if (!v3)
    {
      v6 = (_Unwind_Exception *)+[ICQDaemonOfferConditions isPhotosCloudEnabled].cold.1();
      _Block_object_dispose(&v8, 8);
      _Unwind_Resume(v6);
    }
    LOBYTE(v2) = ((uint64_t (*)(uint64_t))v3)(v5) ^ 1;
  }
  return v2;
}

+ (NSNumber)photosLibrarySize
{
  void *v2;
  void *v3;
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v10[4];
  id v11;
  NSObject *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simulatedPhotosLibrarySize");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v3 = (void *)v15[5];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v5 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__ICQDaemonOfferConditions_photosLibrarySize__block_invoke;
    v10[3] = &unk_1E8B39C78;
    v7 = v6;
    v11 = v7;
    v13 = &v14;
    v8 = v5;
    v12 = v8;
    +[_ICQHelperFunctions getPhotosLibrarySizeWithCompletion:](_ICQHelperFunctions, "getPhotosLibrarySizeWithCompletion:", v10);
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    v4 = (id)v15[5];

  }
  _Block_object_dispose(&v14, 8);

  return (NSNumber *)v4;
}

void __45__ICQDaemonOfferConditions_photosLibrarySize__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v5 = v4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "photosLibrarySize took %@ seconds", (uint8_t *)&v11, 0xCu);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;
  v10 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (NSNumber)photosLibraryUploadSize
{
  void *v3;
  void *v4;
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "simulatedPhotosLibrarySize");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  v4 = (void *)v16[5];
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v6 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__ICQDaemonOfferConditions_photosLibraryUploadSize__block_invoke;
    v11[3] = &unk_1E8B39C78;
    v8 = v7;
    v12 = v8;
    v14 = &v15;
    v9 = v6;
    v13 = v9;
    objc_msgSend(a1, "getPhotosLibraryUploadSizeWithCompletion:", v11);
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v5 = (id)v16[5];

  }
  _Block_object_dispose(&v15, 8);

  return (NSNumber *)v5;
}

void __51__ICQDaemonOfferConditions_photosLibraryUploadSize__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceNow");
  v5 = v4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_1CDEBD000, v6, OS_LOG_TYPE_DEFAULT, "photosLibraryUploadSize took %@ seconds", (uint8_t *)&v11, 0xCu);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;
  v10 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (NSNumber)photosVideosCount
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 buf;
  Class (*v19)(uint64_t);
  void *v20;
  uint64_t *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v3 = (void *)getPLPhotoLibraryClass_softClass;
  v17 = getPLPhotoLibraryClass_softClass;
  if (!getPLPhotoLibraryClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v19 = __getPLPhotoLibraryClass_block_invoke;
    v20 = &unk_1E8B384E8;
    v21 = &v14;
    __getPLPhotoLibraryClass_block_invoke((uint64_t)&buf);
    v3 = (void *)v15[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v4, "sharedPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPhotoCount:videoCount:", &v13, &v12);

  objc_msgSend(v2, "timeIntervalSinceNow");
  v7 = v6;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1CDEBD000, v8, OS_LOG_TYPE_DEFAULT, "photosVideosCount took %@ seconds", (uint8_t *)&buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 + v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v10;
}

+ (void)getPhotosLibraryUploadSizeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v5 = (void *)getPLGatekeeperClientClass_softClass;
  v17 = getPLGatekeeperClientClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getPLGatekeeperClientClass_softClass)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __getPLGatekeeperClientClass_block_invoke;
    v13[3] = &unk_1E8B384E8;
    v13[4] = &v14;
    __getPLGatekeeperClientClass_block_invoke((uint64_t)v13);
    v5 = (void *)v15[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v7, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __69__ICQDaemonOfferConditions_getPhotosLibraryUploadSizeWithCompletion___block_invoke;
  v10[3] = &unk_1E8B39CA0;
  v11 = v4;
  v12 = a1;
  v9 = v4;
  objc_msgSend(v8, "getLibrarySizesFromDB:handler:", 1, v10);

}

void __69__ICQDaemonOfferConditions_getPhotosLibraryUploadSizeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  v5 = objc_msgSend(v3, "isPhotosCloudEnabled");
  v6 = 32;
  if (v5)
    v6 = 16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)backupRestoreComplete
{
  return +[_ICQHelperFunctions userDefaultsBoolValueForKey:](_ICQHelperFunctions, "userDefaultsBoolValueForKey:", CFSTR("backupRestoreComplete"));
}

+ (BOOL)isSimulatedDeviceStorageAlmostFull
{
  void *v2;
  char v3;

  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSimulatedDeviceStorageAlmostFull");

  return v3;
}

+ (void)setSimulatedDeviceStorageAlmostFull:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[ICQDaemonOfferManager sharedDaemonOfferManager](ICQDaemonOfferManager, "sharedDaemonOfferManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSimulatedDeviceStorageAlmostFull:", v3);

}

+ (BOOL)isCachedCloudQuotaAlmostFullOrFull
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  id v14;

  +[ICQDaemonPersisted persistedObject](ICQDaemonOfferStubs, "persistedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQDaemonPersisted persistedObject](ICQDaemonOffer, "persistedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_cachedQuotaAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cachedQuotaAvailable");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
    v7 = v4;
  else
    v7 = (void *)v5;
  v8 = v7;
  if (v4)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    objc_msgSend(v2, "retrievalDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "retrievalDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "compare:", v11);

    if (v12 == -1)
    {
      v14 = v6;

      v8 = v14;
      goto LABEL_12;
    }
  }
  if (v8)
  {
LABEL_12:
    v13 = (unint64_t)objc_msgSend(v8, "longLongValue") < 0x1DCD6500;

    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)isDeviceStorageAlmostFull
{
  return self->_deviceStorageAlmostFull;
}

- (void)setDeviceStorageAlmostFull:(BOOL)a3
{
  self->_deviceStorageAlmostFull = a3;
}

- (BOOL)isPhotosCloudEnabled
{
  return self->_photosCloudEnabled;
}

- (void)setPhotosCloudEnabled:(BOOL)a3
{
  self->_photosCloudEnabled = a3;
}

- (BOOL)isPhotosOptimizeEnabled
{
  return self->_photosOptimizeEnabled;
}

- (void)setPhotosOptimizeEnabled:(BOOL)a3
{
  self->_photosOptimizeEnabled = a3;
}

- (NSNumber)photosLibrarySize
{
  return self->_photosLibrarySize;
}

- (void)setPhotosLibrarySize:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)isBackupRestoreComplete
{
  return self->_backupRestoreComplete;
}

- (void)setBackupRestoreComplete:(BOOL)a3
{
  self->_backupRestoreComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosLibrarySize, 0);
}

+ (uint64_t)isPhotosCloudEnabled
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getPLPhotoLibraryClass_block_invoke_cold_1(v0);
}

@end
