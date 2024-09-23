@implementation PLPhotoLibraryBundle

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)sqliteErrorIndicatorFileExists
{
  os_unfair_lock_s *p_sqliteErrorIndicatorLock;
  NSNumber *sqliteErrorIndicatorFileExists;
  uint64_t v5;
  void *v6;
  NSNumber *v7;
  NSNumber *v8;

  p_sqliteErrorIndicatorLock = &self->_sqliteErrorIndicatorLock;
  os_unfair_lock_lock(&self->_sqliteErrorIndicatorLock);
  sqliteErrorIndicatorFileExists = self->_sqliteErrorIndicatorFileExists;
  if (sqliteErrorIndicatorFileExists)
  {
    LOBYTE(v5) = -[NSNumber BOOLValue](sqliteErrorIndicatorFileExists, "BOOLValue");
  }
  else
  {
    -[PLPhotoLibraryBundle pathManager](self, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "sqliteErrorIndicatorFileExists");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sqliteErrorIndicatorFileExists;
    self->_sqliteErrorIndicatorFileExists = v7;

  }
  os_unfair_lock_unlock(p_sqliteErrorIndicatorLock);
  return v5;
}

- (PLChangeHandlingContainer)changeHandlingContainer
{
  return (PLChangeHandlingContainer *)-[PLLazyObject objectValue](self->_lazyChangeHandlingContainer, "objectValue");
}

- (PLPersistentContainer)persistentContainer
{
  return (PLPersistentContainer *)-[PLLazyObject objectValue](self->_lazyPersistentContainer, "objectValue");
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)objc_getProperty(self, a2, 184, 1);
}

- (BOOL)registerPLPhotoLibrary:(id)a3
{
  id v4;
  uint64_t v5;
  PLAtomicObject *atomicPhotoLibraries;
  BOOL v7;
  NSObject *v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  PLPhotoLibraryBundle *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  PLPhotoLibraryBundle *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__PLPhotoLibraryBundle_Internal__registerPLPhotoLibrary___block_invoke;
  v16 = &unk_1E3677C68;
  v17 = self;
  v18 = &v19;
  PLRunWithUnfairLock();
  if (*((_BYTE *)v20 + 24))
  {
    atomicPhotoLibraries = self->_atomicPhotoLibraries;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __57__PLPhotoLibraryBundle_Internal__registerPLPhotoLibrary___block_invoke_195;
    v10[3] = &unk_1E3670A38;
    v11 = v4;
    v12 = &v19;
    -[PLAtomicObject atomicallyPerformBlockAndWait:](atomicPhotoLibraries, "atomicallyPerformBlockAndWait:", v10);
    v7 = *((_BYTE *)v20 + 24) != 0;
    v8 = v11;
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Unable to register PLPhotoLibrary with bundle %@", buf, 0xCu);
    }
    v7 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v7;
}

- (BOOL)isSystemPhotoLibrary
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[PLPhotoLibraryBundle libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isSystemPhotoLibrary");
  else
    v5 = objc_msgSend(MEMORY[0x1E0D73288], "isSystemPhotoLibraryURL:", self->_libraryURL);
  v6 = v5;

  return v6;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return (PLLibraryServicesManager *)-[PLLazyObject objectValue](self->_lazyLibraryServicesManager, "objectValue");
}

uint64_t __57__PLPhotoLibraryBundle_Internal__registerPLPhotoLibrary___block_invoke(uint64_t result)
{
  if (!*(_QWORD *)(*(_QWORD *)(result + 32) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

PLPersistentContainer *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_4(uint64_t a1)
{
  _QWORD *WeakRetained;
  PLPersistentContainer *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v3 = -[PLPersistentContainer initWithLibraryURL:lazyAssetsdClient:]([PLPersistentContainer alloc], "initWithLibraryURL:lazyAssetsdClient:", *(_QWORD *)(a1 + 32), WeakRetained[8]);
  else
    v3 = 0;

  return v3;
}

void __38__PLPhotoLibraryBundle_shutdownReason__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newChangeHandlingContainer");
  else
    v3 = 0;

  return v3;
}

- (id)newChangeHandlingContainer
{
  NSObject *v3;
  PLChangeHandlingContainer *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  if (MEMORY[0x19AEC0720](self, a2) && PLIsAssetsdProxyService())
  {
    PLLibraryBundleGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_ERROR, "Disabling change handling container for unit test proxy service", buf, 2u);
    }
    v4 = 0;
  }
  else
  {
    v3 = -[PLPhotoLibraryBundle newChangePublisher](self, "newChangePublisher");
    -[PLPhotoLibraryBundle libraryServicesManager](self, "libraryServicesManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryBundle persistentContainer](self, "persistentContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sharedPersistentStoreCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v4 = -[PLChangeHandlingContainer initWithLibraryBundle:changePublisher:libraryServicesManager:persistentStoreCoordinator:]([PLChangeHandlingContainer alloc], "initWithLibraryBundle:changePublisher:libraryServicesManager:persistentStoreCoordinator:", self, v3, v5, v7);
      -[PLChangeHandlingContainer start](v4, "start");
    }
    else
    {
      PLLibraryBundleGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Unable to create PLLibraryBundleLogInfo because PSC is nil", v10, 2u);
      }

      v4 = 0;
    }

  }
  return v4;
}

- (PLAssetsdClient)assetsdClient
{
  return (PLAssetsdClient *)-[PLLazyObject objectValue](self->_lazyAssetsdClient, "objectValue");
}

- (id)makeChangeHandlingNotificationObserverWithLowPriorityThrottleInterval:(double)a3
{
  PLChangeHandlingNotificationObserver *v5;
  void *v6;
  PLChangeHandlingNotificationObserver *v7;

  v5 = [PLChangeHandlingNotificationObserver alloc];
  -[PLLazyObject objectValue](self->_lazyChangeHandlingObserverTargetNotifyWorkloop, "objectValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLChangeHandlingNotificationObserver initWithLowPriorityThrottleInterval:targetWorkloop:](v5, "initWithLowPriorityThrottleInterval:targetWorkloop:", v6, a3);

  return v7;
}

- (PLPhotoLibraryBundle)initWithLibraryURL:(id)a3 bundleController:(id)a4
{
  id v6;
  PLPhotoLibraryBundle *v7;
  PLPhotoLibraryBundle *v8;
  uint64_t v9;
  NSURL *libraryURL;
  id v11;
  void *v12;
  uint64_t v13;
  PLAtomicObject *atomicPhotoLibraries;
  uint64_t v15;
  PLPhotoLibraryPathManager *pathManager;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  PLLazyObject *lazyIndicatorFileCoordinator;
  id v22;
  id v23;
  uint64_t v24;
  PLLazyObject *lazyChangeHandlingContainer;
  id v26;
  id v27;
  uint64_t v28;
  PLLazyObject *lazyAssetsdClient;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  PLLazyObject *lazyPersistentContainer;
  id v35;
  id v36;
  uint64_t v37;
  PLLazyObject *lazyLibraryServicesManager;
  id v39;
  id v40;
  uint64_t v41;
  PLLazyObject *lazyVariationCache;
  id v43;
  id v44;
  uint64_t v45;
  PLLazyObject *lazyPersonInfoManager;
  id v47;
  id v48;
  uint64_t v49;
  PLLazyObject *lazyEmailAddressManager;
  id v51;
  id v52;
  uint64_t v53;
  PLLazyObject *lazyBoundAssetsdServicesTable;
  id v55;
  id v56;
  uint64_t v57;
  PLLazyObject *lazyPhotoAnalysisServiceClient;
  id v59;
  id v60;
  uint64_t v61;
  PLLazyObject *lazyConstraintsDirector;
  id v63;
  id v64;
  uint64_t v65;
  PLLazyObject *lazyTimeZoneLookup;
  id v67;
  id v68;
  uint64_t v69;
  PLLazyObject *lazyFetchRecorder;
  id v71;
  id v72;
  uint64_t v73;
  PLLazyObject *lazyGraphCache;
  id v75;
  id v76;
  uint64_t v77;
  PLLazyObject *lazyChangeHandlingObserverTargetNotifyWorkloop;
  id v79;
  id v80;
  PLPhotoLibraryBundle *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  int v85;
  id v86;
  PLFileSystemVolumeUnmountMonitor *v87;
  PLFileSystemVolumeUnmountMonitor *volumeUnmountMonitor;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  uint64_t v95;
  PLPhotoLibraryBundle *v96;
  id obj;
  id v99;
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  _QWORD v105[4];
  id v106;
  _QWORD v107[4];
  id v108;
  _QWORD v109[4];
  id v110;
  _QWORD v111[4];
  id v112;
  _QWORD v113[4];
  id v114;
  _QWORD v115[4];
  id v116;
  _QWORD v117[4];
  id v118;
  _QWORD v119[4];
  id v120;
  _QWORD v121[4];
  id v122;
  _QWORD v123[4];
  id v124;
  id v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[4];
  id v129;
  _QWORD v130[4];
  id v131;
  objc_super v132;
  _BYTE location[12];
  __int16 v134;
  PLPhotoLibraryBundle *v135;
  __int16 v136;
  id v137;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  obj = a4;
  v132.receiver = self;
  v132.super_class = (Class)PLPhotoLibraryBundle;
  v7 = -[PLPhotoLibraryBundle init](&v132, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_19;
  v7->_lock._os_unfair_lock_opaque = 0;
  v9 = objc_msgSend(v6, "copy");
  libraryURL = v8->_libraryURL;
  v8->_libraryURL = (NSURL *)v9;

  v11 = objc_alloc(MEMORY[0x1E0D73180]);
  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "initWithObject:", v12);
  atomicPhotoLibraries = v8->_atomicPhotoLibraries;
  v8->_atomicPhotoLibraries = (PLAtomicObject *)v13;

  objc_storeWeak((id *)&v8->_bundleController, obj);
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithLibraryURL:", v6);
  pathManager = v8->_pathManager;
  v8->_pathManager = (PLPhotoLibraryPathManager *)v15;

  v17 = objc_initWeak((id *)location, v8);
  v18 = objc_alloc(MEMORY[0x1E0D73248]);
  v19 = MEMORY[0x1E0C809B0];
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke;
  v130[3] = &unk_1E36759D8;
  objc_copyWeak(&v131, (id *)location);
  v20 = objc_msgSend(v18, "initWithBlock:", v130);
  objc_destroyWeak(&v131);
  objc_destroyWeak((id *)location);
  lazyIndicatorFileCoordinator = v8->_lazyIndicatorFileCoordinator;
  v8->_lazyIndicatorFileCoordinator = (PLLazyObject *)v20;

  v22 = objc_initWeak((id *)location, v8);
  v23 = objc_alloc(MEMORY[0x1E0D73248]);
  v128[0] = v19;
  v128[1] = 3221225472;
  v128[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_2;
  v128[3] = &unk_1E36759D8;
  objc_copyWeak(&v129, (id *)location);
  v24 = objc_msgSend(v23, "initWithRetriableBlock:", v128);
  objc_destroyWeak(&v129);
  objc_destroyWeak((id *)location);
  lazyChangeHandlingContainer = v8->_lazyChangeHandlingContainer;
  v8->_lazyChangeHandlingContainer = (PLLazyObject *)v24;

  v26 = objc_initWeak((id *)location, v8);
  v27 = objc_alloc(MEMORY[0x1E0D73248]);
  v126[0] = v19;
  v126[1] = 3221225472;
  v126[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_3;
  v126[3] = &unk_1E36759D8;
  objc_copyWeak(&v127, (id *)location);
  v28 = objc_msgSend(v27, "initWithBlock:", v126);
  objc_destroyWeak(&v127);
  objc_destroyWeak((id *)location);
  lazyAssetsdClient = v8->_lazyAssetsdClient;
  v8->_lazyAssetsdClient = (PLLazyObject *)v28;

  v30 = objc_initWeak((id *)location, v8);
  v31 = objc_alloc(MEMORY[0x1E0D73248]);
  v123[0] = v19;
  v123[1] = 3221225472;
  v123[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_4;
  v123[3] = &unk_1E3670E50;
  objc_copyWeak(&v125, (id *)location);
  v32 = v6;
  v124 = v32;
  v33 = objc_msgSend(v31, "initWithBlock:", v123);

  objc_destroyWeak(&v125);
  objc_destroyWeak((id *)location);
  lazyPersistentContainer = v8->_lazyPersistentContainer;
  v8->_lazyPersistentContainer = (PLLazyObject *)v33;

  v35 = objc_initWeak((id *)location, v8);
  v36 = objc_alloc(MEMORY[0x1E0D73248]);
  v121[0] = v19;
  v121[1] = 3221225472;
  v121[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_5;
  v121[3] = &unk_1E36759D8;
  objc_copyWeak(&v122, (id *)location);
  v37 = objc_msgSend(v36, "initWithBlock:", v121);
  objc_destroyWeak(&v122);
  objc_destroyWeak((id *)location);
  lazyLibraryServicesManager = v8->_lazyLibraryServicesManager;
  v8->_lazyLibraryServicesManager = (PLLazyObject *)v37;

  v39 = objc_initWeak((id *)location, v8);
  v40 = objc_alloc(MEMORY[0x1E0D73248]);
  v119[0] = v19;
  v119[1] = 3221225472;
  v119[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_6;
  v119[3] = &unk_1E36759D8;
  objc_copyWeak(&v120, (id *)location);
  v41 = objc_msgSend(v40, "initWithBlock:", v119);
  objc_destroyWeak(&v120);
  objc_destroyWeak((id *)location);
  lazyVariationCache = v8->_lazyVariationCache;
  v8->_lazyVariationCache = (PLLazyObject *)v41;

  v43 = objc_initWeak((id *)location, v8);
  v44 = objc_alloc(MEMORY[0x1E0D73248]);
  v117[0] = v19;
  v117[1] = 3221225472;
  v117[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_7;
  v117[3] = &unk_1E36759D8;
  objc_copyWeak(&v118, (id *)location);
  v45 = objc_msgSend(v44, "initWithBlock:", v117);
  objc_destroyWeak(&v118);
  objc_destroyWeak((id *)location);
  lazyPersonInfoManager = v8->_lazyPersonInfoManager;
  v8->_lazyPersonInfoManager = (PLLazyObject *)v45;

  v47 = objc_initWeak((id *)location, v8);
  v48 = objc_alloc(MEMORY[0x1E0D73248]);
  v115[0] = v19;
  v115[1] = 3221225472;
  v115[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_8;
  v115[3] = &unk_1E36759D8;
  objc_copyWeak(&v116, (id *)location);
  v49 = objc_msgSend(v48, "initWithBlock:", v115);
  objc_destroyWeak(&v116);
  objc_destroyWeak((id *)location);
  lazyEmailAddressManager = v8->_lazyEmailAddressManager;
  v8->_lazyEmailAddressManager = (PLLazyObject *)v49;

  v51 = objc_initWeak((id *)location, v8);
  v52 = objc_alloc(MEMORY[0x1E0D73248]);
  v113[0] = v19;
  v113[1] = 3221225472;
  v113[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_9;
  v113[3] = &unk_1E36759D8;
  objc_copyWeak(&v114, (id *)location);
  v53 = objc_msgSend(v52, "initWithBlock:", v113);
  objc_destroyWeak(&v114);
  objc_destroyWeak((id *)location);
  lazyBoundAssetsdServicesTable = v8->_lazyBoundAssetsdServicesTable;
  v8->_lazyBoundAssetsdServicesTable = (PLLazyObject *)v53;

  v55 = objc_initWeak((id *)location, v8);
  v56 = objc_alloc(MEMORY[0x1E0D73248]);
  v111[0] = v19;
  v111[1] = 3221225472;
  v111[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_10;
  v111[3] = &unk_1E36759D8;
  objc_copyWeak(&v112, (id *)location);
  v57 = objc_msgSend(v56, "initWithBlock:", v111);
  objc_destroyWeak(&v112);
  objc_destroyWeak((id *)location);
  lazyPhotoAnalysisServiceClient = v8->_lazyPhotoAnalysisServiceClient;
  v8->_lazyPhotoAnalysisServiceClient = (PLLazyObject *)v57;

  v59 = objc_initWeak((id *)location, v8);
  v60 = objc_alloc(MEMORY[0x1E0D73248]);
  v109[0] = v19;
  v109[1] = 3221225472;
  v109[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_11;
  v109[3] = &unk_1E36759D8;
  objc_copyWeak(&v110, (id *)location);
  v61 = objc_msgSend(v60, "initWithBlock:", v109);
  objc_destroyWeak(&v110);
  objc_destroyWeak((id *)location);
  lazyConstraintsDirector = v8->_lazyConstraintsDirector;
  v8->_lazyConstraintsDirector = (PLLazyObject *)v61;

  v63 = objc_initWeak((id *)location, v8);
  v64 = objc_alloc(MEMORY[0x1E0D73248]);
  v107[0] = v19;
  v107[1] = 3221225472;
  v107[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_12;
  v107[3] = &unk_1E36759D8;
  objc_copyWeak(&v108, (id *)location);
  v65 = objc_msgSend(v64, "initWithBlock:", v107);
  objc_destroyWeak(&v108);
  objc_destroyWeak((id *)location);
  lazyTimeZoneLookup = v8->_lazyTimeZoneLookup;
  v8->_lazyTimeZoneLookup = (PLLazyObject *)v65;

  v8->_sqliteErrorIndicatorLock._os_unfair_lock_opaque = 0;
  v67 = objc_initWeak((id *)location, v8);

  v68 = objc_alloc(MEMORY[0x1E0D73248]);
  v105[0] = v19;
  v105[1] = 3221225472;
  v105[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_13;
  v105[3] = &unk_1E36759D8;
  objc_copyWeak(&v106, (id *)location);
  v69 = objc_msgSend(v68, "initWithBlock:", v105);
  objc_destroyWeak(&v106);
  objc_destroyWeak((id *)location);
  lazyFetchRecorder = v8->_lazyFetchRecorder;
  v8->_lazyFetchRecorder = (PLLazyObject *)v69;

  v71 = objc_initWeak((id *)location, v8);
  v72 = objc_alloc(MEMORY[0x1E0D73248]);
  v103[0] = v19;
  v103[1] = 3221225472;
  v103[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_14;
  v103[3] = &unk_1E36759D8;
  objc_copyWeak(&v104, (id *)location);
  v73 = objc_msgSend(v72, "initWithBlock:", v103);
  objc_destroyWeak(&v104);
  objc_destroyWeak((id *)location);
  lazyGraphCache = v8->_lazyGraphCache;
  v8->_lazyGraphCache = (PLLazyObject *)v73;

  v75 = objc_initWeak((id *)location, v8);
  v76 = objc_alloc(MEMORY[0x1E0D73248]);
  v101[0] = v19;
  v101[1] = 3221225472;
  v101[2] = __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_15;
  v101[3] = &unk_1E36759D8;
  objc_copyWeak(&v102, (id *)location);
  v77 = objc_msgSend(v76, "initWithBlock:", v101);
  objc_destroyWeak(&v102);
  objc_destroyWeak((id *)location);
  lazyChangeHandlingObserverTargetNotifyWorkloop = v8->_lazyChangeHandlingObserverTargetNotifyWorkloop;
  v8->_lazyChangeHandlingObserverTargetNotifyWorkloop = (PLLazyObject *)v77;

  v79 = v32;
  v80 = v79;
  if (v8->_volumeUnmountMonitor)
  {
    v81 = 0;
    v82 = 0;
    v83 = v79;
    goto LABEL_16;
  }
  v81 = 0;
  v82 = 0;
  v84 = *MEMORY[0x1E0C99D08];
  v83 = v79;
  while (1)
  {

    v99 = 0;
    v100 = 0;
    v85 = objc_msgSend(v83, "getResourceValue:forKey:error:", &v100, v84, &v99);
    v86 = v100;

    v82 = v86;
    v81 = (PLPhotoLibraryBundle *)v99;
    if (!v85)
      break;
    v87 = -[PLFileSystemVolumeUnmountMonitor initWithVolumeURL:]([PLFileSystemVolumeUnmountMonitor alloc], "initWithVolumeURL:", v82);
    volumeUnmountMonitor = v8->_volumeUnmountMonitor;
    v8->_volumeUnmountMonitor = v87;

    -[PLFileSystemVolumeUnmountMonitor addVolumeUnmountObserver:](v8->_volumeUnmountMonitor, "addVolumeUnmountObserver:", v8);
LABEL_9:
    if (v8->_volumeUnmountMonitor)
      goto LABEL_16;
  }
  objc_msgSend(v83, "path");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "length");

  objc_msgSend(v83, "URLByDeletingLastPathComponent");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v91, "path");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v90) = v90 == objc_msgSend(v92, "length");

  if ((v90 & 1) == 0)
  {
    v83 = v91;
    goto LABEL_9;
  }
  if (!v8->_volumeUnmountMonitor)
  {
    PLLibraryBundleGetLog();
    v93 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v80;
      v134 = 2112;
      v135 = v81;
      _os_log_impl(&dword_199541000, v93, OS_LOG_TYPE_ERROR, "Error getting volume URL for library URL %@: %@", location, 0x16u);
    }

  }
  v83 = v91;
LABEL_16:
  PLPhotosObjectLifecycleGetLog();
  v94 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
  {
    v95 = objc_opt_class();
    *(_DWORD *)location = 138412802;
    *(_QWORD *)&location[4] = v95;
    v134 = 2048;
    v135 = v8;
    v136 = 2112;
    v137 = v80;
    _os_log_impl(&dword_199541000, v94, OS_LOG_TYPE_DEBUG, "%@ %p initWithLibraryURL: %@", location, 0x20u);
  }

  v96 = v8;
LABEL_19:

  return v8;
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newLibraryServicesManager");
  else
    v3 = 0;

  return v3;
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newAssetsdClient");
  else
    v3 = 0;

  return v3;
}

- (void)beginObservingChanges
{
  id v2;

  -[PLPhotoLibraryBundle changeHandlingContainer](self, "changeHandlingContainer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginObservingChanges");

}

- (id)boundAssetsdServicesTable
{
  return (id)-[PLLazyObject objectValue](self->_lazyBoundAssetsdServicesTable, "objectValue");
}

- (NSError)shutdownReason
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
  v7 = __Block_byref_object_copy__73314;
  v8 = __Block_byref_object_dispose__73315;
  v9 = 0;
  PLRunWithUnfairLock();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return (NSError *)v2;
}

PLGraphCache *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_14(uint64_t a1)
{
  id WeakRetained;
  PLGraphCache *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = objc_alloc_init(PLGraphCache);
  else
    v2 = 0;

  return v2;
}

- (id)_newTimeZoneLookup
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D752E8]);
  objc_msgSend(MEMORY[0x1E0D75140], "setDefaultTimeZoneLookup:", v2);
  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  uint64_t v4;
  NSURL *libraryURL;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  PLPhotoLibraryBundle *v10;
  __int16 v11;
  NSURL *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    libraryURL = self->_libraryURL;
    *(_DWORD *)buf = 138412802;
    v8 = v4;
    v9 = 2048;
    v10 = self;
    v11 = 2112;
    v12 = libraryURL;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc %@", buf, 0x20u);
  }

  v6.receiver = self;
  v6.super_class = (Class)PLPhotoLibraryBundle;
  -[PLPhotoLibraryBundle dealloc](&v6, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> %@"), objc_opt_class(), self, self->_libraryURL);
}

- (BOOL)isShuttingDown
{
  void *v2;
  BOOL v3;

  -[PLPhotoLibraryBundle shutdownReason](self, "shutdownReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)connectionType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PLLazyObject currentObjectValueWithoutForcingEvaluation](self->_lazyPersistentContainer, "currentObjectValueWithoutForcingEvaluation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if ((objc_msgSend(v2, "didConfigureXPCStore") & 1) != 0)
    {
      v4 = 1;
    }
    else if (objc_msgSend(v3, "didConfigurePersistentStore"))
    {
      v4 = 2;
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (PLPhotoKitVariationCache)variationCache
{
  return (PLPhotoKitVariationCache *)-[PLLazyObject objectValue](self->_lazyVariationCache, "objectValue");
}

- (PLPersonInfoManager)personInfoManager
{
  return (PLPersonInfoManager *)-[PLLazyObject objectValue](self->_lazyPersonInfoManager, "objectValue");
}

- (PLEmailAddressManager)emailAddressManager
{
  return (PLEmailAddressManager *)-[PLLazyObject objectValue](self->_lazyEmailAddressManager, "objectValue");
}

- (PLIndicatorFileCoordinator)indicatorFileCoordinator
{
  return (PLIndicatorFileCoordinator *)-[PLLazyObject objectValue](self->_lazyIndicatorFileCoordinator, "objectValue");
}

- (PFTimeZoneLookup)timeZoneLookup
{
  return (PFTimeZoneLookup *)-[PLLazyObject objectValue](self->_lazyTimeZoneLookup, "objectValue");
}

- (PLClientSandboxExtensionCache)clientSandboxExtensionCache
{
  return 0;
}

- (void)initializeChangeHandling
{
  -[PLPhotoLibraryBundle changeHandlingContainer](self, "changeHandlingContainer");

}

- (void)distributeChangesSinceLastCheckpoint
{
  void *v2;
  id v3;

  -[PLLazyObject currentObjectValueWithoutForcingEvaluation](self->_lazyChangeHandlingContainer, "currentObjectValueWithoutForcingEvaluation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "distributeChangesSinceLastCheckpoint");
    v2 = v3;
  }

}

- (void)endObservingChanges
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[PLLazyObject currentObjectValueWithoutForcingEvaluation](self->_lazyChangeHandlingContainer, "currentObjectValueWithoutForcingEvaluation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "endObservingChanges");
  }
  else
  {
    PLChangeHandlingGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "API misuse: endObservingChanges called when changeHandlingContainer is nil (never initialized or already invalidated).", v5, 2u);
    }

  }
}

- (PLFetchRecorder)fetchRecorder
{
  return (PLFetchRecorder *)-[PLLazyObject objectValue](self->_lazyFetchRecorder, "objectValue");
}

- (PLGraphCache)graphCache
{
  return (PLGraphCache *)-[PLLazyObject objectValue](self->_lazyGraphCache, "objectValue");
}

- (void)_invalidatePhotoAnalysisServiceClient
{
  -[PLLazyObject invalidate](self->_lazyPhotoAnalysisServiceClient, "invalidate");
}

- (void)_invalidateChangeHandlingContainer
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyChangeHandlingContainer, "invalidateWithHandler:", &__block_literal_global_73306);
}

- (void)_invalidatePersistentContainer
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyPersistentContainer, "invalidateWithHandler:", &__block_literal_global_45);
}

- (void)_invalidateGraphCache
{
  -[PLLazyObject invalidate](self->_lazyGraphCache, "invalidate");
}

- (void)close
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  PLPhotoLibraryBundle *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138413058;
    v9 = v4;
    v10 = 2048;
    v11 = self;
    v12 = 2080;
    v13 = "-[PLPhotoLibraryBundle close]";
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p %s %@", (uint8_t *)&v8, 0x2Au);

  }
  PLLibraryBundleGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryBundle libraryURL](self, "libraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = (uint64_t)v7;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Closing %@", (uint8_t *)&v8, 0xCu);

  }
  -[PLPhotoLibraryBundle _invalidatePhotoAnalysisServiceClient](self, "_invalidatePhotoAnalysisServiceClient");
  -[PLPhotoLibraryBundle _invalidateChangeHandlingContainer](self, "_invalidateChangeHandlingContainer");
  -[PLPhotoLibraryBundle _invalidatePersistentContainer](self, "_invalidatePersistentContainer");
  -[PLPhotoLibraryBundle _invalidateClientSandboxExtensionCache](self, "_invalidateClientSandboxExtensionCache");
  -[PLPhotoLibraryBundle _invalidateGraphCache](self, "_invalidateGraphCache");
}

- (void)shutdownWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  PLAtomicObject *atomicPhotoLibraries;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  PLPhotoLibraryBundle *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosObjectLifecycleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138413058;
    v11 = objc_opt_class();
    v12 = 2048;
    v13 = self;
    v14 = 2080;
    v15 = "-[PLPhotoLibraryBundle shutdownWithReason:]";
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@ %p %s %@", buf, 0x2Au);
  }

  atomicPhotoLibraries = self->_atomicPhotoLibraries;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PLPhotoLibraryBundle_shutdownWithReason___block_invoke;
  v8[3] = &unk_1E3670A10;
  v9 = v4;
  v7 = v4;
  -[PLAtomicObject invalidateWithHandler:](atomicPhotoLibraries, "invalidateWithHandler:", v8);
  -[PLPhotoLibraryBundle close](self, "close");

}

- (id)transferAssets:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0D74498];
  v9 = a6;
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 46309, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a6 + 2))(v9, v10);

  return 0;
}

- (id)transferPersons:(id)a3 toBundle:(id)a4 options:(id)a5 completion:(id)a6
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = *MEMORY[0x1E0D74498];
  v9 = a6;
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 46309, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a6 + 2))(v9, v10);

  return 0;
}

- (PLPhotoAnalysisServiceClient)photoAnalysisServiceClient
{
  return (PLPhotoAnalysisServiceClient *)-[PLLazyObject objectValue](self->_lazyPhotoAnalysisServiceClient, "objectValue");
}

- (PLConstraintsDirector)constraintsDirector
{
  return (PLConstraintsDirector *)-[PLLazyObject objectValue](self->_lazyConstraintsDirector, "objectValue");
}

- (void)volumeWillUnmount:(id)a3
{
  id v4;
  NSObject *v5;
  NSURL *libraryURL;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  PLPhotoLibraryBundle *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLPhotosObjectLifecycleGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v13 = objc_opt_class();
    v14 = 2048;
    v15 = self;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "%@ %p volumeWillUnmount:%@", buf, 0x20u);
  }

  libraryURL = self->_libraryURL;
  if (libraryURL)
  {
    v10 = *MEMORY[0x1E0CB3308];
    v11 = libraryURL;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[PLPhotoLibraryBundle bundleController](self, "bundleController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46012, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shutdownBundle:reason:", self, v9);

}

- (id)newAssetsdClient
{
  PLPhotoLibraryBundle *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)newChangePublisher
{
  PLPhotoLibraryBundle *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)newLibraryServicesManager
{
  PLPhotoLibraryBundle *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (id)newBoundAssetsdServicesTable
{
  PLPhotoLibraryBundle *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (NSArray)boundAssetsdServices
{
  PLPhotoLibraryBundle *v2;
  id v3;

  v2 = self;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (BOOL)bindAssetsdService:(id)a3 error:(id *)a4
{
  id v5;
  PLPhotoLibraryBundle *v6;
  id v7;

  v5 = a3;
  v6 = self;
  PLAbstractMethodException();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)unbindAssetsdService:(id)a3
{
  id v4;
  PLPhotoLibraryBundle *v5;
  id v6;

  v4 = a3;
  v5 = self;
  PLAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (void)setCloudPhotoLibraryEnabled:(BOOL)a3
{
  PLPhotoLibraryBundle *v3;
  id v4;

  v3 = self;
  PLAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)setSharedAlbumEnabled:(BOOL)a3
{
  PLPhotoLibraryBundle *v3;
  id v4;

  v3 = self;
  PLAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)setPhotoStreamEnabled:(BOOL)a3
{
  PLPhotoLibraryBundle *v3;
  id v4;

  v3 = self;
  PLAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)setCloudPhotoLibraryEnabledSync:(BOOL)a3
{
  PLPhotoLibraryBundle *v3;
  id v4;

  v3 = self;
  PLAbstractMethodException();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (BOOL)calculateTotalSizeWithResult:(id)a3
{
  id v4;
  PLPhotoLibraryBundle *v5;
  id v6;

  v4 = a3;
  v5 = self;
  PLAbstractMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (PLPhotoLibraryBundleController)bundleController
{
  return (PLPhotoLibraryBundleController *)objc_loadWeakRetained((id *)&self->_bundleController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bundleController);
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_volumeUnmountMonitor, 0);
  objc_storeStrong((id *)&self->_sqliteErrorIndicatorFileExists, 0);
  objc_storeStrong((id *)&self->_lazyGraphCache, 0);
  objc_storeStrong((id *)&self->_lazyFetchRecorder, 0);
  objc_storeStrong((id *)&self->_lazyChangeHandlingObserverTargetNotifyWorkloop, 0);
  objc_storeStrong((id *)&self->_lazyTimeZoneLookup, 0);
  objc_storeStrong((id *)&self->_lazyConstraintsDirector, 0);
  objc_storeStrong((id *)&self->_lazyPhotoAnalysisServiceClient, 0);
  objc_storeStrong((id *)&self->_lazyBoundAssetsdServicesTable, 0);
  objc_storeStrong((id *)&self->_lazyEmailAddressManager, 0);
  objc_storeStrong((id *)&self->_lazyPersonInfoManager, 0);
  objc_storeStrong((id *)&self->_lazyVariationCache, 0);
  objc_storeStrong((id *)&self->_lazyLibraryServicesManager, 0);
  objc_storeStrong((id *)&self->_lazyAssetsdClient, 0);
  objc_storeStrong((id *)&self->_lazyChangeHandlingContainer, 0);
  objc_storeStrong((id *)&self->_lazyIndicatorFileCoordinator, 0);
  objc_storeStrong((id *)&self->_lazyPersistentContainer, 0);
  objc_storeStrong((id *)&self->_atomicPhotoLibraries, 0);
  objc_storeStrong((id *)&self->_shutdownReason, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

void __43__PLPhotoLibraryBundle_shutdownWithReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a2, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateWithReason:", *(_QWORD *)(a1 + 32));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

uint64_t __54__PLPhotoLibraryBundle__invalidatePersistentContainer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeSharedPersistentStoreCoordinator");
}

uint64_t __58__PLPhotoLibraryBundle__invalidateChangeHandlingContainer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stop");
}

PLIndicatorFileCoordinator *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  PLIndicatorFileCoordinator *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLIndicatorFileCoordinator initWithPathManager:]([PLIndicatorFileCoordinator alloc], "initWithPathManager:", WeakRetained[23]);
  else
    v2 = 0;

  return v2;
}

PLPhotoKitVariationCache *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_6(uint64_t a1)
{
  _QWORD *WeakRetained;
  PLPhotoKitVariationCache *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLPhotoKitVariationCache initWithPathManager:]([PLPhotoKitVariationCache alloc], "initWithPathManager:", WeakRetained[23]);
  else
    v2 = 0;

  return v2;
}

PLPersonInfoManager *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_7(uint64_t a1)
{
  _QWORD *WeakRetained;
  PLPersonInfoManager *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLPersonInfoManager initWithPathManager:lazyAssetsdClient:]([PLPersonInfoManager alloc], "initWithPathManager:lazyAssetsdClient:", WeakRetained[23], WeakRetained[8]);
  else
    v2 = 0;

  return v2;
}

PLEmailAddressManager *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_8(uint64_t a1)
{
  _QWORD *WeakRetained;
  PLEmailAddressManager *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLEmailAddressManager initWithPathManager:lazyAssetsdClient:]([PLEmailAddressManager alloc], "initWithPathManager:lazyAssetsdClient:", WeakRetained[23], WeakRetained[8]);
  else
    v2 = 0;

  return v2;
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_9(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newBoundAssetsdServicesTable");
  else
    v3 = 0;

  return v3;
}

PLPhotoAnalysisServiceClient *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_10(uint64_t a1)
{
  _QWORD *WeakRetained;
  PLPhotoAnalysisServiceClient *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLPhotoAnalysisServiceClient initWithLibraryURL:]([PLPhotoAnalysisServiceClient alloc], "initWithLibraryURL:", WeakRetained[1]);
  else
    v2 = 0;

  return v2;
}

PLConstraintsDirector *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_11(uint64_t a1)
{
  _QWORD *WeakRetained;
  PLConstraintsDirector *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = -[PLConstraintsDirector initWithPhotoLibraryURL:]([PLConstraintsDirector alloc], "initWithPhotoLibraryURL:", WeakRetained[1]);
  else
    v2 = 0;

  return v2;
}

id __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_12(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "_newTimeZoneLookup");
  else
    v3 = 0;

  return v3;
}

PLFetchRecorder *__60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  PLFetchRecorder *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = objc_alloc_init(PLFetchRecorder);
  else
    v2 = 0;

  return v2;
}

dispatch_workloop_t __60__PLPhotoLibraryBundle_initWithLibraryURL_bundleController___block_invoke_15(uint64_t a1)
{
  id WeakRetained;
  dispatch_workloop_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = dispatch_workloop_create("com.apple.photos.perBundleSharedChangeHandlingNotificationObserverWorkloop");
  else
    v2 = 0;

  return v2;
}

uint64_t __57__PLPhotoLibraryBundle_Internal__registerPLPhotoLibrary___block_invoke_195(uint64_t result, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "addObject:", *(_QWORD *)(result + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
  return result;
}

@end
