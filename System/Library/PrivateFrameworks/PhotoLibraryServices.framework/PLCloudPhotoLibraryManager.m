@implementation PLCloudPhotoLibraryManager

- (PLCloudPhotoLibraryManager)initWithLibraryServicesManager:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_queue_t v13;
  void *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v30;
  _QWORD v31[4];
  id v32;
  _QWORD block[4];
  id v34;
  uint8_t buf[16];
  objc_super v36;

  v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PLCloudPhotoLibraryManager;
  v6 = -[PLCloudPhotoLibraryManager init](&v36, sel_init);
  if (v6)
  {
    if ((PLIsAssetsd() & 1) == 0 && (PLIsInternalTool() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PLCloudPhotoLibraryManager.m"), 358, CFSTR("only assetsd"));

    }
    objc_storeWeak((id *)v6 + 58, v5);
    if (!*MEMORY[0x1E0D115D0])
    {
      v7 = *((_QWORD *)v6 + 12);
      if (v7 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v7 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Initialize PLCPLLibraryManager", buf, 2u);
      }

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_fallback_qos();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v6 + 7);
    *((_QWORD *)v6 + 7) = v11;

    v13 = dispatch_queue_create("upload-download-count-update", 0);
    v14 = (void *)*((_QWORD *)v6 + 25);
    *((_QWORD *)v6 + 25) = v13;

    PLCloudCopyDefaultSerialQueueAttributes();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("com.apple.plcplstatus", v15);
    v17 = (void *)*((_QWORD *)v6 + 33);
    *((_QWORD *)v6 + 33) = v16;

    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v19 = (void *)*((_QWORD *)v6 + 36);
    *((_QWORD *)v6 + 36) = v18;

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = (void *)*((_QWORD *)v6 + 39);
    *((_QWORD *)v6 + 39) = v20;

    *((_DWORD *)v6 + 87) = 0;
    *((_QWORD *)v6 + 40) = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_queue_create_with_fallback_qos();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)*((_QWORD *)v6 + 50);
    *((_QWORD *)v6 + 50) = v23;

    *((_BYTE *)v6 + 344) = 0;
    *((_QWORD *)v6 + 55) = 0;
    objc_msgSend(v6, "_initCPLLibraryMode");
    objc_msgSend(v6, "_initDeviceLibraryConfiguration");
    objc_msgSend(v6, "_initRecoveryManager");
    v25 = *((_QWORD *)v6 + 7);
    v26 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke;
    block[3] = &unk_1E3677AA0;
    v27 = v6;
    v34 = v27;
    dispatch_async(v25, block);
    objc_msgSend(v5, "cplReadiness");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    v31[1] = 3221225472;
    v31[2] = __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_2;
    v31[3] = &unk_1E3677AA0;
    v32 = v27;
    objc_msgSend(v28, "performOnceLibraryIsReadyForCPLManager:", v31);

  }
  return (PLCloudPhotoLibraryManager *)v6;
}

- (void)invalidate
{
  _BYTE *v3;
  int64_t libraryMode;
  NSObject *v5;
  NSObject *v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "invalidate PLCloudPhotoLibraryManager, will invalidate resourceManager, cacheDeleteSupport, recoveryManager, and uploadDownloadCountCoalescer.", buf, 2u);
    }

  }
  -[PLCloudPhotoLibraryManager invalidateResourceManager](self, "invalidateResourceManager");
  -[PLCloudPhotoLibraryManager invalidateCacheDeleteSupport](self, "invalidateCacheDeleteSupport");
  -[PLCloudPhotoLibraryManager invalidateRecoveryManager](self, "invalidateRecoveryManager");
  -[PLCloudPhotoLibraryManager invalidateUploadDownloadCountCoalescer](self, "invalidateUploadDownloadCountCoalescer");
  if (!*v3)
  {
    v7 = self->_libraryMode;
    if (v7 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager invalidation complete", v10, 2u);
    }

  }
}

- (void)invalidateResourceManager
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyResourceManager, "invalidateWithHandler:", &__block_literal_global_60);
}

- (void)invalidateCacheDeleteSupport
{
  -[PLLazyObject invalidateWithHandler:](self->_lazyCacheDeleteSupport, "invalidateWithHandler:", &__block_literal_global_62);
}

- (void)invalidateRecoveryManager
{
  -[PLLazyObject invalidate](self->_lazyRecoveryManager, "invalidate");
}

- (void)invalidateUploadDownloadCountCoalescer
{
  PFCoalescer *uploadDownloadCountCoalescer;

  -[PFCoalescer resetAndShutDown](self->_uploadDownloadCountCoalescer, "resetAndShutDown");
  uploadDownloadCountCoalescer = self->_uploadDownloadCountCoalescer;
  self->_uploadDownloadCountCoalescer = 0;

}

- (id)cplLibrary
{
  PLResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setCPLLibrary:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLRunWithUnfairLock();

}

- (int64_t)sizeOfResourcesToUploadByCPL:(id *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "state") == 2)
  {
    v6 = objc_msgSend(v5, "sizeOfResourcesToUpload");
  }
  else
  {
    if (a3)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0D11268];
      v11 = *MEMORY[0x1E0CB2D50];
      v12[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 2, v9);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    v6 = -1;
  }

  return v6;
}

- (void)enableiCPLWithCompletionHandler:(id)a3
{
  id v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Enabling iCPL", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager enableiCPLWithCompletionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PLCloudPhotoLibraryManager_enableiCPLWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E3675C58;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v8, v10);

}

- (PLPhotoLibraryPathManager)pathManager
{
  void *v2;
  void *v3;

  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLPhotoLibraryPathManager *)v3;
}

- (void)_initCacheDeleteSupport
{
  NSObject *v3;
  const __CFString *v4;
  id WeakRetained;
  id v6;
  id v7;
  id v8;
  PLLazyObject *v9;
  PLLazyObject *lazyCacheDeleteSupport;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_lazyCacheDeleteSupport)
      v4 = CFSTR("non-null");
    else
      v4 = CFSTR("null");
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager initializing lazy cacheDeleteSupport, was %{public}@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  v6 = objc_initWeak((id *)buf, self);

  v7 = objc_alloc(MEMORY[0x1E0D73248]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PLCloudPhotoLibraryManager__initCacheDeleteSupport__block_invoke;
  v11[3] = &unk_1E3670E50;
  objc_copyWeak(&v13, (id *)buf);
  v8 = WeakRetained;
  v12 = v8;
  v9 = (PLLazyObject *)objc_msgSend(v7, "initWithBlock:", v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
  lazyCacheDeleteSupport = self->_lazyCacheDeleteSupport;
  self->_lazyCacheDeleteSupport = v9;

}

- (id)cacheDeleteSupport
{
  PLLazyObject *lazyCacheDeleteSupport;
  void *v4;
  NSObject *v5;
  void *v8;
  uint8_t buf[16];

  lazyCacheDeleteSupport = self->_lazyCacheDeleteSupport;
  if (!lazyCacheDeleteSupport)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPhotoLibraryManager.m"), 517, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_lazyCacheDeleteSupport != nil"));

    lazyCacheDeleteSupport = self->_lazyCacheDeleteSupport;
  }
  -[PLLazyObject objectValue](lazyCacheDeleteSupport, "objectValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PLPhotosObjectLifecycleGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager requesting cacheDeleteSupport after it has been invalidated", buf, 2u);
    }

  }
  return v4;
}

- (void)_resetCacheDeleteSupport
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  PLCloudPhotoLibraryManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412546;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@ %p _resetCacheDeleteSupport", (uint8_t *)&v4, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager invalidateCacheDeleteSupport](self, "invalidateCacheDeleteSupport");
  -[PLCloudPhotoLibraryManager _initCacheDeleteSupport](self, "_initCacheDeleteSupport");
}

- (void)_initResourceManager
{
  NSObject *v3;
  const __CFString *v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  PLLazyObject *v10;
  PLLazyObject *lazyResourceManager;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_lazyResourceManager)
      v4 = CFSTR("non-null");
    else
      v4 = CFSTR("null");
    *(_DWORD *)buf = 138543362;
    v15 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager initializing lazy resourceManager, was %{public}@", buf, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (PLPlatformCloudPhotosPrefetchSupported())
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Setting up resource manager", buf, 2u);
      }

    }
    v8 = objc_initWeak((id *)buf, self);

    v9 = objc_alloc(MEMORY[0x1E0D73248]);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PLCloudPhotoLibraryManager__initResourceManager__block_invoke;
    v12[3] = &unk_1E36759D8;
    objc_copyWeak(&v13, (id *)buf);
    v10 = (PLLazyObject *)objc_msgSend(v9, "initWithBlock:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    lazyResourceManager = self->_lazyResourceManager;
    self->_lazyResourceManager = v10;

  }
}

- (id)resourceManager
{
  return (id)-[PLLazyObject objectValue](self->_lazyResourceManager, "objectValue");
}

- (void)_resetResourceManager
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  PLCloudPhotoLibraryManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412546;
    v5 = objc_opt_class();
    v6 = 2048;
    v7 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "%@ %p _resetResourceManager", (uint8_t *)&v4, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager invalidateResourceManager](self, "invalidateResourceManager");
  -[PLCloudPhotoLibraryManager _initResourceManager](self, "_initResourceManager");
}

- (void)_initRecoveryManager
{
  NSObject *v3;
  const __CFString *v4;
  id v5;
  id v6;
  PLLazyObject *v7;
  PLLazyObject *lazyRecoveryManager;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_lazyRecoveryManager)
      v4 = CFSTR("non-null");
    else
      v4 = CFSTR("null");
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager initializing lazy recoveryManager, was %{public}@", buf, 0xCu);
  }

  v5 = objc_initWeak((id *)buf, self);
  v6 = objc_alloc(MEMORY[0x1E0D73248]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__PLCloudPhotoLibraryManager__initRecoveryManager__block_invoke;
  v9[3] = &unk_1E36759D8;
  objc_copyWeak(&v10, (id *)buf);
  v7 = (PLLazyObject *)objc_msgSend(v6, "initWithBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
  lazyRecoveryManager = self->_lazyRecoveryManager;
  self->_lazyRecoveryManager = v7;

}

- (void)_initCPLLibraryMode
{
  PLLibraryServicesManager **p_libraryServicesManager;
  id WeakRetained;
  char v5;
  int64_t v6;
  id v7;
  char v8;
  id v9;
  int v10;

  p_libraryServicesManager = &self->_libraryServicesManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  v5 = objc_msgSend(WeakRetained, "isSystemPhotoLibrary");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_libraryServicesManager);
    v8 = objc_msgSend(v7, "isSyndicationPhotoLibrary");

    if ((v8 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v9 = objc_loadWeakRetained((id *)p_libraryServicesManager);
      v10 = objc_msgSend(v9, "isAppPhotoLibrary");

      if (!v10)
        return;
      v6 = 2;
    }
  }
  self->_libraryMode = v6;
}

- (BOOL)_libraryModeSupportsEnableiCPL
{
  unint64_t libraryMode;

  libraryMode = self->_libraryMode;
  return (libraryMode & 1) == 0 && libraryMode < 3;
}

- (void)_initDeviceLibraryConfiguration
{
  CFIndex v3;
  id v4;
  void *v5;
  int64_t libraryMode;
  NSObject *v7;
  NSObject *v8;
  unint64_t deviceLibraryConfiguration;
  __CFString *v10;
  __CFString *v11;
  id v12;
  uint8_t buf[4];
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_libraryMode)
  {
    v3 = 0;
    self->_deviceLibraryConfiguration = 0;
LABEL_3:
    self->_pendingDeviceLibraryConfiguration = v3;
    return;
  }
  v12 = 0;
  v3 = PLGetCPLDeviceLibraryConfiguration(&v12);
  v4 = v12;
  self->_deviceLibraryConfiguration = v3;
  if (!v4)
    goto LABEL_3;
  v5 = v4;
  if (objc_msgSend(v4, "integerValue") == self->_deviceLibraryConfiguration)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        deviceLibraryConfiguration = self->_deviceLibraryConfiguration;
        if (deviceLibraryConfiguration > 2)
          v10 = CFSTR("unknown");
        else
          v10 = off_1E366BE48[deviceLibraryConfiguration];
        v11 = v10;
        *(_DWORD *)buf = 138412290;
        v14 = v11;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Clearing pending device-library configuration on init because it is the same as the current configuration: %@", buf, 0xCu);

      }
    }
    PLSetPendingCPLDeviceLibraryConfiguration(0);
  }
  self->_pendingDeviceLibraryConfiguration = objc_msgSend(v5, "integerValue");

}

- (BOOL)_shouldResetICloudBackupExclusionPaths
{
  void *v3;
  id WeakRetained;
  unint64_t v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isDeviceRestoreSupported") && self->_libraryMode == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    v5 = ((unint64_t)objc_msgSend(WeakRetained, "createOptions") >> 5) & 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_updateBackupExclusionPathsAfterRemoveCPLDirectory
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUBF");

  if (v4)
  {
    if (-[PLCloudPhotoLibraryManager _shouldResetICloudBackupExclusionPaths](self, "_shouldResetICloudBackupExclusionPaths"))
    {
      v5 = 2;
    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v5 = 0;
  }
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateBackupExclusionPathsForBackupType:", v5);

}

- (id)recoveryManager
{
  return (id)-[PLLazyObject objectValue](self->_lazyRecoveryManager, "objectValue");
}

- (BOOL)_hasItemToDownload
{
  void *v2;
  void *v3;
  void *v4;

  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorFileCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v4, "hasItemToDownload");
  return (char)v2;
}

- (void)_enableiCPL
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  int64_t v12;
  NSObject *v13;
  int64_t libraryMode;
  NSObject *v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PLCloudPhotoLibraryUploadTracker *v24;
  PLCloudPhotoLibraryUploadTracker *uploadTracker;
  PLCloudBatchUploader *v26;
  id WeakRetained;
  PLCloudBatchUploader *v28;
  PLCloudBatchUploader *uploader;
  int v30;
  int v31;
  int v32;
  int64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  int v37;
  int64_t v38;
  NSObject *v39;
  NSObject *v40;
  const __CFString *v41;
  int64_t v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  PLCloudPersistentHistoryChangeTracker *v49;
  void *v50;
  void *v51;
  PLCloudPersistentHistoryChangeTracker *v52;
  PLCloudPersistentHistoryChangeTracker *syncChangeTracker;
  int64_t v54;
  NSObject *v55;
  NSObject *v56;
  __CFString *v57;
  void *v58;
  BOOL v59;
  char v60;
  int64_t v61;
  NSObject *v62;
  NSObject *v63;
  __CFNotificationCenter *DarwinNotifyCenter;
  int64_t v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  OS_dispatch_queue *uploadDownloadCountQueue;
  PFCoalescer *v70;
  PFCoalescer *uploadDownloadCountCoalescer;
  uint64_t v72;
  void *v73;
  void *v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[4];
  void (**v78)(_QWORD);
  uint64_t *v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint8_t buf[4];
  const __CFString *v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _enableiCPL]");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_libraryMode)
  {
    v4 = (void *)MEMORY[0x1E0D73280];
    -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isSystemPhotoLibraryURL:", v6);

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPhotoLibraryManager.m"), 629, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[PLPhotoLibraryPathManager isSystemPhotoLibraryURL:self.pathManager.libraryURL]"));

    }
  }
  v7 = (void (**)(_QWORD))dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_85);
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__11541;
  v84 = __Block_byref_object_dispose__11542;
  v85 = 0;
  if (-[PLCloudPhotoLibraryManager _libraryModeSupportsEnableiCPL](self, "_libraryModeSupportsEnableiCPL"))
  {
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __41__PLCloudPhotoLibraryManager__enableiCPL__block_invoke_86;
    v77[3] = &unk_1E366DE38;
    v79 = &v80;
    v78 = v7;
    objc_msgSend(v8, "enableMainScopeWithCompletionHandler:", v77);

  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41022, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v81[5];
    v81[5] = v9;

    v7[2](v7);
  }
  dispatch_block_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v11 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!v81[5])
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v18 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Updating iCPL markers", buf, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "libraryBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "indicatorFileCoordinator");
    v16 = objc_claimAutoreleasedReturnValue();

    -[NSObject updateICloudPhotosMarkerForEnable:](v16, "updateICloudPhotosMarkerForEnable:", 1);
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "databaseContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager _enableiCPL]");

    self->_icplEnabled = 1;
    v24 = objc_alloc_init(PLCloudPhotoLibraryUploadTracker);
    uploadTracker = self->_uploadTracker;
    self->_uploadTracker = v24;

    v26 = [PLCloudBatchUploader alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    v28 = -[PLCloudBatchUploader initWithLibraryServicesManager:](v26, "initWithLibraryServicesManager:", WeakRetained);
    uploader = self->_uploader;
    self->_uploader = v28;

    v30 = objc_msgSend(MEMORY[0x1E0D11440], "cplShouldGenerateDerivatives");
    v31 = v30;
    if (*v11)
      v32 = 0;
    else
      v32 = v30;
    if (v32 == 1)
    {
      v33 = self->_libraryMode;
      if (v33 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v34 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v33 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v34 = objc_claimAutoreleasedReturnValue();
      }
      v35 = v34;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_DEFAULT, "CPLShouldGenerateDerivatives is set to YES", buf, 2u);
      }

    }
    -[PLCloudBatchUploader setShouldGenerateDerivatives:](self->_uploader, "setShouldGenerateDerivatives:", v31 ^ 1u);
    objc_msgSend(v23, "globalValues");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "hasCloudInitialUploadCompleted");

    if (!*v11)
    {
      v38 = self->_libraryMode;
      if (v38 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v39 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v38 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v39 = objc_claimAutoreleasedReturnValue();
      }
      v40 = v39;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        v41 = CFSTR("YES");
        if (v37)
          v41 = CFSTR("NO");
        *(_DWORD *)buf = 138543362;
        v87 = v41;
        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "Setting initial upload to: %{public}@", buf, 0xCu);
      }

    }
    -[PLCloudBatchUploader setInitialUpload:](self->_uploader, "setInitialUpload:", v37 ^ 1u);
    if (!*v11)
    {
      v42 = self->_libraryMode;
      if (v42 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v43 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v42 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v43 = objc_claimAutoreleasedReturnValue();
      }
      v44 = v43;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "Setting up cloud change tracker", buf, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "libraryBundle");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "persistentContainer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sharedPersistentStoreCoordinator");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = [PLCloudPersistentHistoryChangeTracker alloc];
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "libraryBundle");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[PLCloudPersistentHistoryChangeTracker initWithPersistentStoreCoordinator:libraryBundle:](v49, "initWithPersistentStoreCoordinator:libraryBundle:", v48, v51);
    syncChangeTracker = self->_syncChangeTracker;
    self->_syncChangeTracker = v52;

    -[PLCloudPersistentHistoryChangeTracker setDelegate:](self->_syncChangeTracker, "setDelegate:", self);
    if (!*v11)
    {
      v54 = self->_libraryMode;
      if (v54 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v55 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v54 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v55 = objc_claimAutoreleasedReturnValue();
      }
      v56 = v55;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        -[PLCloudPersistentHistoryChangeTracker name](self->_syncChangeTracker, "name");
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v87 = v57;
        _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_DEFAULT, "Cloud change tracker: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v23, "managedObjectContext");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = -[PLCloudPhotoLibraryManager _connectToCloudChangeTrackerWithContext:](self, "_connectToCloudChangeTrackerWithContext:", v58);

    if (*v11)
      v60 = 1;
    else
      v60 = v59;
    if ((v60 & 1) == 0)
    {
      v61 = self->_libraryMode;
      if (v61 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v62 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v61 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v62 = objc_claimAutoreleasedReturnValue();
      }
      v63 = v62;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v63, OS_LOG_TYPE_ERROR, "Failed to connect to change tracker", buf, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager _startLibraryScopeRulesChangeTrackerInQueue](self, "_startLibraryScopeRulesChangeTrackerInQueue");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_photosPreferencesChanged, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0, (CFNotificationSuspensionBehavior)1028);
    -[PLCloudPhotoLibraryManager _updatePendingResetSyncDate](self, "_updatePendingResetSyncDate");
    if (!-[PLCloudPhotoLibraryManager isReadyForAnalysis](self, "isReadyForAnalysis")
      && -[PLCloudPhotoLibraryManager currentResetSyncType](self, "currentResetSyncType") != 1)
    {
      -[PLCloudPhotoLibraryManager _disableOpportunisticTasks](self, "_disableOpportunisticTasks");
    }
    if (!*v11)
    {
      v65 = self->_libraryMode;
      if (v65 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v66 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v65 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v66 = objc_claimAutoreleasedReturnValue();
      }
      v67 = v66;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v67, OS_LOG_TYPE_DEFAULT, "Resetting counts", buf, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager _setToDownloadCountsForImages:videos:](self, "_setToDownloadCountsForImages:videos:", 0, 0);
    self->_boundForUploadingVideos = -1;
    self->_boundForUploadingOtherItems = -1;
    self->_boundForUploadingPhotos = -1;
    objc_initWeak((id *)buf, self);
    v68 = (void *)MEMORY[0x1E0D71080];
    uploadDownloadCountQueue = self->_uploadDownloadCountQueue;
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __41__PLCloudPhotoLibraryManager__enableiCPL__block_invoke_101;
    v75[3] = &unk_1E3662A10;
    v75[4] = self;
    objc_copyWeak(&v76, (id *)buf);
    objc_msgSend(v68, "setCoalescerWithLabel:queue:action:", CFSTR("com.apple.photos.uploaddownloadcount"), uploadDownloadCountQueue, v75);
    v70 = (PFCoalescer *)objc_claimAutoreleasedReturnValue();
    uploadDownloadCountCoalescer = self->_uploadDownloadCountCoalescer;
    self->_uploadDownloadCountCoalescer = v70;

    LODWORD(v68) = -[NSObject isICloudPhotosPaused](v16, "isICloudPhotosPaused");
    self->_pauseReason = -[NSObject currentPauseReason](v16, "currentPauseReason");
    if ((_DWORD)v68)
    {
      if (-[PLCloudPhotoLibraryManager _setupTimerForUnpause](self, "_setupTimerForUnpause"))
        v72 = 8;
      else
        v72 = 3;
    }
    else
    {
      v72 = 3;
    }
    -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", v72);
    -[PLCloudPhotoLibraryManager _initializeMasterAndSizeCalculationinLibrary:](self, "_initializeMasterAndSizeCalculationinLibrary:", v23);
    -[PLCloudPhotoLibraryManager _updateTransferCountsInLibrary:](self, "_updateTransferCountsInLibrary:", v23);
    -[PLCloudPhotoLibraryManager _checkForPushedMastersInLibrary:](self, "_checkForPushedMastersInLibrary:", v23);
    -[PLCloudPhotoLibraryManager _runOneTimeMigrationStepsIfNecessaryInLibrary:](self, "_runOneTimeMigrationStepsIfNecessaryInLibrary:", v23);
    objc_destroyWeak(&v76);
    objc_destroyWeak((id *)buf);

    goto LABEL_105;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v12 = self->_libraryMode;
    if (v12 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v17 = (const __CFString *)v81[5];
      *(_DWORD *)buf = 138412290;
      v87 = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to enable main scope: %@", buf, 0xCu);
    }
LABEL_105:

  }
  objc_msgSend(v74, "stillAlive");
  _Block_object_dispose(&v80, 8);

}

- (void)_openCPLLibrary
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _BYTE *v7;
  int64_t libraryMode;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  NSObject *v15;
  int64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  id v25;
  int64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  int64_t v31;
  uint64_t v32;
  id v33;
  id WeakRetained;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  PLFakeCPLLibraryManager *v42;
  PLFakeCPLLibraryManager *v43;
  int64_t v44;
  NSObject *v45;
  id v46;
  NSObject *v47;
  id v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v54;
  void *v55;
  void *v56;
  int64_t v57;
  NSObject *v58;
  int64_t v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  int64_t v66;
  void *v67;
  int64_t v68;
  NSObject *v69;
  void *v70;
  int64_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager _resetCacheDeleteSupport](self, "_resetCacheDeleteSupport");
  -[PLCloudPhotoLibraryManager _resetResourceManager](self, "_resetResourceManager");
  -[PLCloudPhotoLibraryManager _resetDidCallBlocksWaitingForLibraryOpen](self, "_resetDidCallBlocksWaitingForLibraryOpen");
  self->_isHandlingStatusChangesNotification = 0;
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indicatorFileCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "isWipeCPLOnOpen");
  v7 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (v6)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Wipe CPL on open marker detected, attempting to remove CPL directory", buf, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeCPLDataDirectory");

    -[PLCloudPhotoLibraryManager _updateBackupExclusionPathsAfterRemoveCPLDirectory](self, "_updateBackupExclusionPathsAfterRemoveCPLDirectory");
    objc_msgSend(v5, "clearWipeCPLOnOpen");
  }
  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cachedPrimaryAppleAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (!*v7)
    {
      v16 = self->_libraryMode;
      if (v16 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v16 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v28 = v17;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "No Apple Account, resetting CPL library", buf, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager _resetCPLLibrary](self, "_resetCPLLibrary");
    -[PLCloudPhotoLibraryManager _callBlocksWaitingForLibraryOpen](self, "_callBlocksWaitingForLibraryOpen");
    self->_state = 0;
    goto LABEL_120;
  }
  if (!*v7)
  {
    v14 = self->_libraryMode;
    if (v14 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v18 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Creating CPL Library", buf, 2u);
    }

  }
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    goto LABEL_96;
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cplDataDirectoryCreateIfNeeded:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("storage"));
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0;
  v24 = objc_msgSend(v23, "createDirectoryIfNeededAtPath:error:", v22, &v83);
  v25 = v83;

  if ((v24 & 1) == 0 && !*v7)
  {
    v26 = self->_libraryMode;
    if (v26 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v26 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v29 = v27;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v85 = v22;
      v86 = 2112;
      v87 = v25;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_ERROR, "Unable to create directory %@: %@", buf, 0x16u);
    }

  }
  v76 = v25;
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v21, 1);
  v78 = v21;
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v22, 1);
  v31 = self->_libraryMode;
  v77 = (void *)v22;
  if (v31 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    objc_msgSend(WeakRetained, "libraryURL");
    v35 = v30;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 1;
    +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v36, 1, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "containerIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    CPLLibraryIdentifierForApp();
    v33 = (id)objc_claimAutoreleasedReturnValue();

    v30 = v35;
  }
  else if (v31 == 1)
  {
    v33 = (id)*MEMORY[0x1E0D11288];
    v32 = 4;
  }
  else if (v31)
  {
    v33 = 0;
    v32 = 0;
  }
  else
  {
    if (PLCloudPhotoLibraryMultiLibarySyncingEnabled_onceToken != -1)
      dispatch_once(&PLCloudPhotoLibraryMultiLibarySyncingEnabled_onceToken, &__block_literal_global_291);
    if (PLCloudPhotoLibraryMultiLibarySyncingEnabled_multiLibrarySyncingEnabled)
      v32 = 1033;
    else
      v32 = 1037;
    v33 = (id)*MEMORY[0x1E0D11290];
  }
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = PLCloudPhotoLibraryLocalModeEnabled(v40);

  if (v41)
  {
    v42 = [PLFakeCPLLibraryManager alloc];
    v43 = -[PLFakeCPLLibraryManager initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:options:](v42, "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:options:", v30, v79, v79, *MEMORY[0x1E0D11290], v32);
    if (*v7)
      goto LABEL_73;
    v44 = self->_libraryMode;
    if (v44 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v45 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v44 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v45 = objc_claimAutoreleasedReturnValue();
    }
    v47 = v45;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v85 = (uint64_t)v52;
      _os_log_impl(&dword_199541000, v47, OS_LOG_TYPE_DEFAULT, "Warning: CPLLocalMode enabled, about to connect to fake library manager instead: %@", buf, 0xCu);

    }
  }
  else
  {
    if (!v33)
    {
      v43 = 0;
      goto LABEL_73;
    }
    v46 = objc_alloc(MEMORY[0x1E0D113A0]);
    v47 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
    -[NSObject mainScopeIdentifier](v47, "mainScopeIdentifier");
    v48 = v33;
    v49 = v30;
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (PLFakeCPLLibraryManager *)objc_msgSend(v46, "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:", v49, v79, v79, v48, v50, v32);

    v30 = v49;
    v33 = v48;
  }

LABEL_73:
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_localModeEnabledChanged, CFSTR("com.apple.mobileslideshow.cpl.localmodeenabledchanged"), 0, (CFNotificationSuspensionBehavior)1028);
  if (v43)
  {
    -[PLCloudPhotoLibraryManager setCPLLibrary:](self, "setCPLLibrary:", v43);
    -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setDelegate:", self);

    -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setResourceProgressDelegate:", self);

    -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setRecordComputeStateDelegate:", self);

    if (!*v7)
    {
      v57 = self->_libraryMode;
      if (v57 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v58 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v57 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v58 = objc_claimAutoreleasedReturnValue();
      }
      v61 = v58;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
        v63 = v30;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v85 = (uint64_t)v62;
        v86 = 2112;
        v87 = v64;
        _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_DEFAULT, "Created cplLibrary (%p) %@", buf, 0x16u);

        v30 = v63;
      }

    }
  }
  else
  {
    if (!*v7)
    {
      v59 = self->_libraryMode;
      if (v59 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v60 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v59 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v60 = objc_claimAutoreleasedReturnValue();
      }
      v65 = v60;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v66 = self->_libraryMode;
        *(_DWORD *)buf = 134217984;
        v85 = v66;
        _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_ERROR, "Error initializing cloud photo library instance - no library identifier found for library mode: %ld", buf, 0xCu);
      }

    }
    -[PLCloudPhotoLibraryManager _callBlocksWaitingForLibraryOpen](self, "_callBlocksWaitingForLibraryOpen");
    self->_state = 0;
  }

  if (v43)
  {
LABEL_96:
    -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v67, "state") == 2)
    {
      if (!*v7)
      {
        v68 = self->_libraryMode;
        if (v68 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v69 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v68 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v69 = objc_claimAutoreleasedReturnValue();
        }
        v73 = v69;
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v85 = (uint64_t)v67;
          v86 = 2112;
          v87 = v67;
          _os_log_impl(&dword_199541000, v73, OS_LOG_TYPE_DEFAULT, "CPLLibrary is already open: (%p) %@", buf, 0x16u);
        }

      }
      -[PLCloudPhotoLibraryManager _callBlocksWaitingForLibraryOpen](self, "_callBlocksWaitingForLibraryOpen");
      -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", 2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _openCPLLibrary]");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (!*v7)
      {
        v71 = self->_libraryMode;
        if (v71 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v72 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v71 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v72 = objc_claimAutoreleasedReturnValue();
        }
        v74 = v72;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v85 = (uint64_t)v67;
          v86 = 2112;
          v87 = v67;
          _os_log_impl(&dword_199541000, v74, OS_LOG_TYPE_DEFAULT, "Opening cplLibrary: (%p) %@", buf, 0x16u);
        }

      }
      v80[0] = MEMORY[0x1E0C809B0];
      v80[1] = 3221225472;
      v80[2] = __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke;
      v80[3] = &unk_1E3662A38;
      v80[4] = self;
      v81 = v70;
      v82 = v67;
      v75 = v70;
      objc_msgSend(v82, "openWithCompletionHandler:", v80);

    }
  }
LABEL_120:

}

- (void)_initializeMasterAndSizeCalculationinLibrary:(id)a3
{
  PLCloudPhotoLibraryUploadTracker *uploadTracker;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v7;
  _QWORD v8[4];
  id v9;
  PLCloudPhotoLibraryManager *v10;

  v7 = a3;
  uploadTracker = self->_uploadTracker;
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryUploadTracker setupFromCPLManager:](uploadTracker, "setupFromCPLManager:", v5);

  if (!self->_initializedMaster)
  {
    if (-[PLCloudBatchUploader initialUpload](self->_uploader, "initialUpload"))
      +[PLManagedAsset createMastersInLibrary:](PLManagedAsset, "createMastersInLibrary:", v7);
    -[PLCloudPhotoLibraryUploadTracker setupFromLibrary:isInitialUpload:](self->_uploadTracker, "setupFromLibrary:isInitialUpload:", v7, -[PLCloudBatchUploader initialUpload](self->_uploader, "initialUpload"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, 0, 0);
    self->_initializedMaster = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__PLCloudPhotoLibraryManager__initializeMasterAndSizeCalculationinLibrary___block_invoke;
    v8[3] = &unk_1E3677C18;
    v9 = v7;
    v10 = self;
    objc_msgSend(v9, "performBlockAndWait:", v8);

  }
}

- (void)_runOneTimeMigrationStepsWithoutiCPLIfNecessary
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  int64_t libraryMode;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "runOnceFlagIsSet:", 8))
  {
    -[PLCloudPhotoLibraryManager cacheDeleteSupport](self, "cacheDeleteSupport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "clearPurgeableFlagsForAllResources");

    if (v6)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (libraryMode == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v8 = objc_claimAutoreleasedReturnValue();
        }
        v11 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Successfully cleared all purgeable resources", buf, 2u);
        }

      }
      objc_msgSend(v4, "clearRunOnceFlag:error:", 8, 0);
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v9 = self->_libraryMode;
      if (v9 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v12 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to clear all purgeable resources", v13, 2u);
      }

    }
  }

}

- (void)_runOneTimeMigrationStepsIfNecessaryInLibrary:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  PLCloudPhotoLibraryManager *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "runOnceFlagIsSet:", 2);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke;
    v20[3] = &unk_1E3677AA0;
    v21 = v6;
    -[PLCloudPhotoLibraryManager _reportOptimizeSettingChangeWithCompletionHandler:](self, "_reportOptimizeSettingChangeWithCompletionHandler:", v20);

  }
  if (objc_msgSend(v6, "runOnceFlagIsSet:", 1))
  {
    v9 = self->_handlePrefetchModeChangeGeneration + 1;
    self->_handlePrefetchModeChangeGeneration = v9;
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke_2;
    v17[3] = &unk_1E3677C40;
    v19 = v9;
    v17[4] = self;
    v18 = v6;
    -[PLCloudPhotoLibraryManager _handleOptimizeSettingChangeInLibrary:withCompletionHandler:](self, "_handleOptimizeSettingChangeInLibrary:withCompletionHandler:", v4, v17);

  }
  if (objc_msgSend(v6, "runOnceFlagIsSet:", 16))
  {
    -[PLCloudPhotoLibraryManager _repushVideoAssetsMetadata](self, "_repushVideoAssetsMetadata");
    objc_msgSend(v6, "clearRunOnceFlag:error:", 16, 0);
  }
  if (objc_msgSend(v6, "runOnceFlagIsSet:", 32))
  {
    -[PLCloudPhotoLibraryManager _repushMasterWithMissingMediaMetadata](self, "_repushMasterWithMissingMediaMetadata");
    objc_msgSend(v6, "clearRunOnceFlag:error:", 32, 0);
  }
  if (objc_msgSend(v6, "runOnceFlagIsSet:", 4))
  {
    +[PLInternalResource predicateForAvailableResources](PLInternalResource, "predicateForAvailableResources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v12 = 3221225472;
    v13 = __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke_3;
    v14 = &unk_1E3677C18;
    v15 = self;
    v16 = v6;
    -[PLCloudPhotoLibraryManager markPurgeableResourcesMatchingPredicate:urgency:inLibrary:completionHandler:](self, "markPurgeableResourcesMatchingPredicate:urgency:inLibrary:completionHandler:", v10, 0, v4, &v11);

  }
  if (objc_msgSend(v6, "runOnceFlagIsSet:", 64, v11, v12, v13, v14, v15))
  {
    -[PLCloudPhotoLibraryManager _repushAssetsWithImportedByBundleIdentifier](self, "_repushAssetsWithImportedByBundleIdentifier");
    objc_msgSend(v6, "clearRunOnceFlag:error:", 64, 0);
  }
  -[PLCloudPhotoLibraryManager _createDeletionRecordsIfNecessary](self, "_createDeletionRecordsIfNecessary");

}

- (void)_createDeletionRecordsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v4, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 3, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;

  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("recordstodelete.plist"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "fileExistsAtPath:", v7))
    -[PLCloudBatchUploader uploadDeletedRecordsFromPlist:](self->_uploader, "uploadDeletedRecordsFromPlist:", v7);

}

- (void)_migrateFromChangeHubToCoreDataIfNecessary
{
  int64_t libraryMode;
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[16];

  if (self->_hasAttemptedMigration)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v3 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v3 = objc_claimAutoreleasedReturnValue();
      }
      v4 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Already attempted persistent history migration so skipping it", v5, 2u);
      }

    }
  }
  else
  {
    self->_hasAttemptedMigration = 1;
    +[PLCloudPersistentHistoryMigrator migrateToPersistentHistoryIfNecessaryWithMigratorContext:](PLCloudPersistentHistoryMigrator, "migrateToPersistentHistoryIfNecessaryWithMigratorContext:");
  }
}

- (void)beginsSignificantWorkWithResourcesSize:(unint64_t)a3
{
  void *v5;
  int64_t libraryMode;
  NSObject *v7;
  NSObject *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (PLIsEDUMode() & 1) == 0 && a3 >> 22 >= 0x19 && !self->_significantWork)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 134217984;
        v10 = a3 >> 20;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Starting significant work with %lluMB of resources", (uint8_t *)&v9, 0xCu);
      }

    }
    self->_significantWork = 1;
    objc_msgSend(v5, "noteClientIsBeginningSignificantWork");
  }

}

- (void)endsSignificantWork
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int64_t libraryMode;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PLCloudPhotoLibraryManager cplStatus](self, "cplStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialSyncDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && self->_significantWork
    && (-[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "sizeOfResourcesToUpload"),
        v6,
        !v7)
    && v4)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Ending significant work", (uint8_t *)&v14, 2u);
      }

    }
    self->_significantWork = 0;
    objc_msgSend(v5, "noteClientIsEndingSignificantWork");
  }
  else if (self->_significantWork && !*MEMORY[0x1E0D115D0])
  {
    v10 = self->_libraryMode;
    if (v10 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218240;
      v15 = objc_msgSend(v5, "sizeOfResourcesToUpload");
      v16 = 1024;
      v17 = v4 == 0;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Keeping the significant work mode, sizeOfResourcesToUpload = %llu, inInitialSync = %d", (uint8_t *)&v14, 0x12u);
    }

  }
}

- (void)cplHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager cplHasBackgroundDownloadOperationsWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__PLCloudPhotoLibraryManager_cplHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v5, v7);

}

- (void)_resetCPLLibrary
{
  void *v3;
  void *v4;
  void *v5;

  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setResourceProgressDelegate:", 0);

    -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[PLCloudPhotoLibraryManager setCPLLibrary:](self, "setCPLLibrary:", 0);
    -[PLCloudPhotoLibraryManager setCPLStatus:](self, "setCPLStatus:", 0);
    -[PLCloudPhotoLibraryManager setCPLConfiguration:](self, "setCPLConfiguration:", 0);
  }
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  objc_super v5;

  -[PLCloudPersistentHistoryChangeTracker disconnect](self->_syncChangeTracker, "disconnect");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.mobileslideshow.PreferenceChanged"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, CFSTR("com.apple.mobileslideshow.cpl.localmodeenabledchanged"), 0);
  v5.receiver = self;
  v5.super_class = (Class)PLCloudPhotoLibraryManager;
  -[PLCloudPhotoLibraryManager dealloc](&v5, sel_dealloc);
}

- (void)_doUnpause
{
  void *v3;
  void *v4;
  void *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  int64_t libraryMode;
  NSObject *v8;
  NSObject *v9;
  int v10;
  int pauseReason;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indicatorFileCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "clearPauseMarkerForReason:", self->_pauseReason))
  {
    -[PLCloudPhotoLibraryManager _stopUnpauseTimer](self, "_stopUnpauseTimer");
    self->_pauseReason = 0;
    -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", 6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.paused"), 0, 0, 1u);
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(v5, "currentPauseReason");
      pauseReason = self->_pauseReason;
      v12[0] = 67109376;
      v12[1] = v10;
      v13 = 1024;
      v14 = pauseReason;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring unpause request, currentPause reason %d, unpause reason %d", (uint8_t *)v12, 0xEu);
    }

  }
}

- (void)setPause:(BOOL)a3 reason:(signed __int16)a4
{
  void *v7;
  _QWORD v8[5];
  signed __int16 v9;
  BOOL v10;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager setPause:reason:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__PLCloudPhotoLibraryManager_setPause_reason___block_invoke;
  v8[3] = &unk_1E3662A60;
  v9 = a4;
  v8[4] = self;
  v10 = a3;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v7, v8);

}

- (void)_unpause
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _unpause]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__PLCloudPhotoLibraryManager__unpause__block_invoke;
  v4[3] = &unk_1E3677AA0;
  v4[4] = self;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v3, v4);

}

- (void)_doPause
{
  __CFNotificationCenter *DarwinNotifyCenter;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager _setupTimerForUnpause](self, "_setupTimerForUnpause");
  -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", 8);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.paused"), 0, 0, 1u);
}

- (void)_pause
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _pause]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__PLCloudPhotoLibraryManager__pause__block_invoke;
  v4[3] = &unk_1E3677AA0;
  v4[4] = self;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v3, v4);

}

- (void)disableiCPLWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager disableiCPLWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E3676290;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v7, v8);

}

- (void)disableiCPLSyncWillBecomeNonSyncablePhotoLibrary
{
  -[PLCloudPhotoLibraryManager _disableiCPLSyncWithResetMode:](self, "_disableiCPLSyncWithResetMode:", 2);
}

- (void)disableiCPLSyncForLibraryDeletion
{
  -[PLCloudPhotoLibraryManager _disableiCPLSyncWithResetMode:](self, "_disableiCPLSyncWithResetMode:", 0);
}

- (void)_disableiCPLSyncWithResetMode:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  int64_t libraryMode;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  dispatch_block_t v17;
  _QWORD v18[6];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _disableiCPLSyncWithResetMode:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "libraryBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indicatorFileCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "writeDisableICloudPhotosMarker");
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setICPLEnabled:error:", 0, 0);

  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__PLCloudPhotoLibraryManager__disableiCPLSyncWithResetMode___block_invoke;
  v19[3] = &unk_1E3677AA0;
  v19[4] = self;
  -[PLCloudPhotoLibraryManager _runSyncOnIsolationQueueWithBlock:](self, "_runSyncOnIsolationQueueWithBlock:", v19);
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "libraryURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v16;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Waiting for CPL to open for iCPL disable before library deletion: %@", buf, 0xCu);

    }
  }
  v17 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_133);
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v5, v17);
  dispatch_block_wait(v17, 0xFFFFFFFFFFFFFFFFLL);
  -[PLCloudPhotoLibraryManager _resetDidCallBlocksWaitingForLibraryOpen](self, "_resetDidCallBlocksWaitingForLibraryOpen");
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __60__PLCloudPhotoLibraryManager__disableiCPLSyncWithResetMode___block_invoke_2;
  v18[3] = &unk_1E3674C18;
  v18[4] = self;
  v18[5] = a3;
  -[PLCloudPhotoLibraryManager _runSyncOnIsolationQueueWithBlock:](self, "_runSyncOnIsolationQueueWithBlock:", v18);

}

- (void)_disableiCPLWillBecomeNonSyncablePhotoLibrary:(BOOL)a3 resetMode:(int64_t)a4
{
  _BOOL4 v5;
  void *v7;
  unint64_t deviceLibraryConfiguration;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  unint64_t pendingDeviceLibraryConfiguration;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  _BYTE *v17;
  int64_t libraryMode;
  NSObject *v19;
  NSObject *v20;
  const __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  id WeakRetained;
  void *v25;
  int v26;
  int64_t v27;
  NSObject *v28;
  int64_t v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  id foregroundMonitorIdentifier;
  void *v35;
  id cameraMonitorIdentifier;
  int64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  int64_t v42;
  NSObject *v43;
  NSObject *v44;
  PLCloudPersistentHistoryChangeTracker *syncChangeTracker;
  int64_t v46;
  NSObject *v47;
  NSObject *v48;
  PLCloudBatchUploader *uploader;
  int64_t v50;
  NSObject *v51;
  NSObject *v52;
  PLCloudBatchDownloader *downloader;
  int64_t v54;
  NSObject *v55;
  NSObject *v56;
  PLCloudTaskManager *taskManager;
  PLCloudInMemoryTaskManager *inMemoryTaskManager;
  int64_t v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  int64_t v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  void *v67;
  const char *v68;
  void *v69;
  unint64_t v70;
  __CFString *v71;
  __CFString *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  int64_t v80;
  NSObject *v81;
  NSObject *v82;
  PLCloudPhotoLibraryUploadTracker *uploadTracker;
  int64_t v84;
  NSObject *v85;
  NSObject *v86;
  unint64_t v87;
  int64_t v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int64_t v97;
  NSObject *v98;
  NSObject *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  int64_t v105;
  NSObject *v106;
  NSObject *v107;
  dispatch_block_t v108;
  void *v109;
  id v110;
  int v111;
  int64_t v112;
  NSObject *v113;
  NSObject *v114;
  uint64_t v115;
  int64_t v116;
  NSObject *v117;
  NSObject *v118;
  void *v119;
  int64_t v120;
  NSObject *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  int64_t v126;
  NSObject *v127;
  NSObject *v128;
  unint64_t v129;
  __CFString *v130;
  __CFString *v131;
  unint64_t v132;
  __CFString *v133;
  __CFString *v134;
  int64_t v135;
  NSObject *v136;
  NSObject *v137;
  NSObject *v138;
  int64_t v139;
  NSObject *v140;
  NSObject *v141;
  __CFString *v142;
  void *v143;
  void *v144;
  _QWORD v145[4];
  id v146;
  _BYTE *v147;
  _QWORD v148[4];
  id v149;
  uint8_t v150[4];
  uint64_t v151;
  _BYTE buf[24];
  uint64_t (*v153)(uint64_t, uint64_t);
  void (*v154)(uint64_t);
  id v155;
  uint64_t v156;

  v5 = a3;
  v156 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (a4 == 3)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    deviceLibraryConfiguration = self->_deviceLibraryConfiguration;
    if (deviceLibraryConfiguration > 2)
      v9 = CFSTR("unknown");
    else
      v9 = off_1E366BE48[deviceLibraryConfiguration];
    v11 = v9;
    pendingDeviceLibraryConfiguration = self->_pendingDeviceLibraryConfiguration;
    if (pendingDeviceLibraryConfiguration > 2)
      v13 = CFSTR("unknown");
    else
      v13 = off_1E366BE48[pendingDeviceLibraryConfiguration];
    v14 = v13;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("device-library configuration changing from %@ to %@"), v11, v14);
    v142 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    self->_pendingDeviceLibraryConfiguration = 0;
    self->_deviceLibraryConfiguration = 0;
    PLSetCPLDeviceLibraryConfiguration(0);
    -[PLCloudPhotoLibraryManager _callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:](self, "_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:", 0);
    v10 = CFSTR("will become non-Syncable");
    if (!v5)
      v10 = 0;
    v142 = v10;
  }
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "libraryBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "indicatorFileCoordinator");
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v144, "logCloudServiceEnableEvent:serviceName:reason:", 0, CFSTR("CPL"), v142);
  v17 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (v142)
        v21 = v142;
      else
        v21 = CFSTR("account setting changed");
      if ((unint64_t)a4 > 3)
        v22 = CFSTR("unknown");
      else
        v22 = off_1E3667F18[a4];
      v23 = v22;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v23;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Disabling iCPL reason %@, reset mode: %{public}@", buf, 0x16u);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v143 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v143, "setRunOnceFlag:error:", 8, 0);
  -[PLCloudPhotoLibraryManager cacheDeleteSupport](self, "cacheDeleteSupport");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "clearPurgeableFlagsForAllResources");

  if (v26)
  {
    if (!*v17)
    {
      v27 = self->_libraryMode;
      if (v27 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v28 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v27 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v28 = objc_claimAutoreleasedReturnValue();
      }
      v31 = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Successfully cleared all purgeable resources", buf, 2u);
      }

    }
    objc_msgSend(v143, "clearRunOnceFlag:error:", 8, 0);
  }
  else if (!*v17)
  {
    v29 = self->_libraryMode;
    if (v29 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v30 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v29 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v30 = objc_claimAutoreleasedReturnValue();
    }
    v32 = v30;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Failed to clear all purgeable resources", buf, 2u);
    }

  }
  -[PLCloudPhotoLibraryManager _resetCacheDeleteSupport](self, "_resetCacheDeleteSupport");
  if (self->_foregroundMonitorIdentifier)
  {
    +[PLForegroundMonitor sharedInstance](PLForegroundMonitor, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stopMonitoring:", self->_foregroundMonitorIdentifier);

    foregroundMonitorIdentifier = self->_foregroundMonitorIdentifier;
    self->_foregroundMonitorIdentifier = 0;

  }
  if (self->_cameraMonitorIdentifier)
  {
    +[PLForegroundMonitor sharedInstance](PLForegroundMonitor, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "stopMonitoring:", self->_cameraMonitorIdentifier);

    cameraMonitorIdentifier = self->_cameraMonitorIdentifier;
    self->_cameraMonitorIdentifier = 0;

  }
  if (!*v17)
  {
    v37 = self->_libraryMode;
    if (v37 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v38 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v37 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v38 = objc_claimAutoreleasedReturnValue();
    }
    v39 = v38;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Disconnecting CPL delegates", buf, 2u);
    }

  }
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setResourceProgressDelegate:", 0);

  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDelegate:", 0);

  if (!*v17)
  {
    v42 = self->_libraryMode;
    if (v42 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v43 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v42 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v43 = objc_claimAutoreleasedReturnValue();
    }
    v44 = v43;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "Disconnecting and clearing cloud change tracker", buf, 2u);
    }

  }
  -[PLCloudPersistentHistoryChangeTracker disconnect](self->_syncChangeTracker, "disconnect");
  syncChangeTracker = self->_syncChangeTracker;
  self->_syncChangeTracker = 0;

  -[PLCloudPhotoLibraryManager stopLibraryScopeRulesChangeTracker](self, "stopLibraryScopeRulesChangeTracker");
  if (!*v17)
  {
    v46 = self->_libraryMode;
    if (v46 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v47 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v46 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v47 = objc_claimAutoreleasedReturnValue();
    }
    v48 = v47;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_DEFAULT, "Clearing upload array", buf, 2u);
    }

  }
  -[PLCloudBatchUploader clearUploadArray](self->_uploader, "clearUploadArray");
  uploader = self->_uploader;
  self->_uploader = 0;

  if (!*v17)
  {
    v50 = self->_libraryMode;
    if (v50 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v51 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v50 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v51 = objc_claimAutoreleasedReturnValue();
    }
    v52 = v51;
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_DEFAULT, "Clearing batch downloader", buf, 2u);
    }

  }
  downloader = self->_downloader;
  self->_downloader = 0;

  if (!*v17)
  {
    v54 = self->_libraryMode;
    if (v54 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v55 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v54 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v55 = objc_claimAutoreleasedReturnValue();
    }
    v56 = v55;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_DEFAULT, "Resetting task manager", buf, 2u);
    }

  }
  -[PLCloudTaskManager reset](self->_taskManager, "reset");
  taskManager = self->_taskManager;
  self->_taskManager = 0;

  -[PLCloudInMemoryTaskManager reset](self->_inMemoryTaskManager, "reset");
  inMemoryTaskManager = self->_inMemoryTaskManager;
  self->_inMemoryTaskManager = 0;

  if (!*v17)
  {
    v59 = self->_libraryMode;
    if (v59 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v60 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v59 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v60 = objc_claimAutoreleasedReturnValue();
    }
    v61 = v60;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_DEFAULT, "Stopping resource manager", buf, 2u);
    }

  }
  -[PLCloudPhotoLibraryManager resourceManager](self, "resourceManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "stop");

  -[PLCloudPhotoLibraryManager _resetResourceManager](self, "_resetResourceManager");
  if (!*v17)
  {
    v63 = self->_libraryMode;
    if (v63 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v64 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v63 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v64 = objc_claimAutoreleasedReturnValue();
    }
    v65 = v64;
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v65, OS_LOG_TYPE_DEFAULT, "Deleting CPL Plist", buf, 2u);
    }

  }
  v66 = (void *)MEMORY[0x1E0D73190];
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "deleteCPLPlistWithPathManager:", v67);

  v68 = "-[PLCloudPhotoLibraryManager _disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:]";
  if (a4 == 3)
  {
    v69 = (void *)MEMORY[0x1E0CB3940];
    v70 = self->_pendingDeviceLibraryConfiguration;
    if (v70 > 2)
      v71 = CFSTR("unknown");
    else
      v71 = off_1E366BE48[v70];
    v72 = v71;
    objc_msgSend(v69, "stringWithFormat:", CFSTR("%s - %@"), "-[PLCloudPhotoLibraryManager _disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:]", v72);
    v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v68 = (const char *)objc_msgSend(v73, "UTF8String");

  }
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "databaseContext");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v75, "newShortLivedCplLibraryWithNameSuffix:", v68);

  objc_msgSend(v76, "managedObjectContext");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "setLocalOnlyDelete:", 1);

  v78 = MEMORY[0x1E0C809B0];
  v148[0] = MEMORY[0x1E0C809B0];
  v148[1] = 3221225472;
  v148[2] = __86__PLCloudPhotoLibraryManager__disableiCPLWillBecomeNonSyncablePhotoLibrary_resetMode___block_invoke;
  v148[3] = &unk_1E3677AA0;
  v79 = v76;
  v149 = v79;
  objc_msgSend(v79, "performTransactionAndWait:", v148);
  if (!*v17)
  {
    v80 = self->_libraryMode;
    if (v80 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v81 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v80 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v81 = objc_claimAutoreleasedReturnValue();
    }
    v82 = v81;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v82, OS_LOG_TYPE_DEFAULT, "Resetting upload tracker", buf, 2u);
    }

  }
  -[PLCloudPhotoLibraryUploadTracker reset](self->_uploadTracker, "reset");
  uploadTracker = self->_uploadTracker;
  self->_uploadTracker = 0;

  if (!*v17)
  {
    v84 = self->_libraryMode;
    if (v84 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v85 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v84 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v85 = objc_claimAutoreleasedReturnValue();
    }
    v86 = v85;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v86, OS_LOG_TYPE_DEFAULT, "Resetting flags", buf, 2u);
    }

  }
  v87 = 9;
  if (!v5)
    v87 = 0;
  self->_state = v87;
  self->_initializedMaster = 0;
  self->_pauseRequest = 0;
  self->_pauseReason = 0;
  self->_pushingAllChanges = 0;
  *(_DWORD *)&self->_icplEnabled = 0;
  self->_hasSettledInitialBatch = 0;
  -[NSMutableArray removeAllObjects](self->_pushAllChangesCompletionHandlers, "removeAllObjects");
  if (!*v17)
  {
    v88 = self->_libraryMode;
    if (v88 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v89 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v88 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v89 = objc_claimAutoreleasedReturnValue();
    }
    v90 = v89;
    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v90, OS_LOG_TYPE_DEFAULT, "Deactivating local library for iCPL", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0D731D0], "defaultDeviceConfiguration");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "isTV");

  -[PLCloudPhotoLibraryManager _enableOpportunisticTasks](self, "_enableOpportunisticTasks");
  v93 = (void *)MEMORY[0x1E0D73158];
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "libraryURL");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "appPrivateDataForLibraryURL:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v96, "saveCachedIsReadyForAnalysis:", 0);
  if (-[PLCloudPhotoLibraryManager _shouldResetICloudBackupExclusionPaths](self, "_shouldResetICloudBackupExclusionPaths"))
  {
    if (!*v17)
    {
      v97 = self->_libraryMode;
      if (v97 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v98 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v97 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v98 = objc_claimAutoreleasedReturnValue();
      }
      v99 = v98;
      if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
      {
        -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "libraryURL");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v101;
        _os_log_impl(&dword_199541000, v99, OS_LOG_TYPE_DEFAULT, "Setting iCPL-disabled exclusion flags on App Library because iCPL was disabled: %@", buf, 0xCu);

      }
    }
    -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v102, "resetBackupExclusionPathsForBackupType:", 2);

  }
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  PLResetSyncStatusWithLibrary(v79, v103, a4, self->_pendingDeviceLibraryConfiguration, v92);

  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    if (!*v17)
    {
      v105 = self->_libraryMode;
      if (v105 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v106 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v105 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v106 = objc_claimAutoreleasedReturnValue();
      }
      v107 = v106;
      if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v107, OS_LOG_TYPE_DEFAULT, "Deactivating CPL library", buf, 2u);
      }

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v153 = __Block_byref_object_copy__11541;
    v154 = __Block_byref_object_dispose__11542;
    v155 = 0;
    v108 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_147);
    -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v145[0] = v78;
    v145[1] = 3221225472;
    v145[2] = __86__PLCloudPhotoLibraryManager__disableiCPLWillBecomeNonSyncablePhotoLibrary_resetMode___block_invoke_2;
    v145[3] = &unk_1E366DE38;
    v147 = buf;
    v110 = v108;
    v146 = v110;
    objc_msgSend(v109, "deactivateWithCompletionHandler:", v145);

    dispatch_block_wait(v110, 0xFFFFFFFFFFFFFFFFLL);
    v111 = *v17;
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && !*v17)
    {
      v112 = self->_libraryMode;
      if (v112 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v113 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v112 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v113 = objc_claimAutoreleasedReturnValue();
      }
      v114 = v113;
      if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      {
        v115 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v150 = 138412290;
        v151 = v115;
        _os_log_impl(&dword_199541000, v114, OS_LOG_TYPE_ERROR, "Unable to deactivate CPL: %@", v150, 0xCu);
      }

      v111 = *v17;
    }
    if (!v111)
    {
      v116 = self->_libraryMode;
      if (v116 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v117 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v116 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v117 = objc_claimAutoreleasedReturnValue();
      }
      v118 = v117;
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v150 = 0;
        _os_log_impl(&dword_199541000, v118, OS_LOG_TYPE_DEFAULT, "Clearing CPLLibrary", v150, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager setCPLLibrary:](self, "setCPLLibrary:", 0);
    -[PLCloudPhotoLibraryManager setCPLStatus:](self, "setCPLStatus:", 0);
    -[PLCloudPhotoLibraryManager setCPLConfiguration:](self, "setCPLConfiguration:", 0);

    _Block_object_dispose(buf, 8);
  }
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "removeCPLDataDirectory");

  -[PLCloudPhotoLibraryManager _updateBackupExclusionPathsAfterRemoveCPLDirectory](self, "_updateBackupExclusionPathsAfterRemoveCPLDirectory");
  if (a4 == 3)
  {
    if (!*v17)
    {
      v120 = self->_libraryMode;
      if (v120 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v121 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v120 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v121 = objc_claimAutoreleasedReturnValue();
      }
      v128 = v121;
      if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
      {
        v129 = self->_deviceLibraryConfiguration;
        if (v129 > 2)
          v130 = CFSTR("unknown");
        else
          v130 = off_1E366BE48[v129];
        v131 = v130;
        v132 = self->_pendingDeviceLibraryConfiguration;
        if (v132 > 2)
          v133 = CFSTR("unknown");
        else
          v133 = off_1E366BE48[v132];
        v134 = v133;
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v131;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v134;
        _os_log_impl(&dword_199541000, v128, OS_LOG_TYPE_DEFAULT, "Finished changing device-library configuration from %@ to %@", buf, 0x16u);

      }
    }
    PLSetCPLDeviceLibraryConfiguration(self->_pendingDeviceLibraryConfiguration);
    -[PLCloudPhotoLibraryManager setDeviceLibraryConfiguration:](self, "setDeviceLibraryConfiguration:", self->_pendingDeviceLibraryConfiguration);
    -[PLCloudPhotoLibraryManager _callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:](self, "_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:", 0);
    if (!*v17)
    {
      v135 = self->_libraryMode;
      if (v135 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v136 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v135 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v136 = objc_claimAutoreleasedReturnValue();
      }
      v137 = v136;
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v137, OS_LOG_TYPE_DEFAULT, "Transitioning back to after configuration change", buf, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", 1);
  }
  else
  {
    -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "removePartialVideoDirectory");

    if (self->_libraryMode == 2)
    {
      self->_state = 9;
      -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "cplSettings");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "setAppLibrary:error:", 0, 0);

      -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "didBecomeNonSyncablePhotoLibrary");

    }
    if (!*v17)
    {
      v126 = self->_libraryMode;
      if (v126 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v127 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v126 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v127 = objc_claimAutoreleasedReturnValue();
      }
      v138 = v127;
      if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v138, OS_LOG_TYPE_DEFAULT, "Updating iCPL marker", buf, 2u);
      }

    }
    objc_msgSend(v144, "deleteCPLDownloadFinishedMarkerFilePath");
    objc_msgSend(v144, "updateICloudPhotosMarkerForEnable:", 0);
    if (!*v17)
    {
      v139 = self->_libraryMode;
      if (v139 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v140 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v139 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v140 = objc_claimAutoreleasedReturnValue();
      }
      v141 = v140;
      if (os_log_type_enabled(v140, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v141, OS_LOG_TYPE_DEFAULT, "iCPL is disabled", buf, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager _handleStateTransistionAfterDisableiCPL](self, "_handleStateTransistionAfterDisableiCPL");
  }

}

- (void)_handleStateTransistionAfterDisableiCPL
{
  int64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t libraryMode;
  NSObject *v10;
  int64_t v11;
  NSObject *v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_state != 9)
  {
    +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedPrimaryAppleAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isCPLSyncablePhotoLibrary");

      if (v8)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          libraryMode = self->_libraryMode;
          if (libraryMode == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v10 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (libraryMode == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v10 = objc_claimAutoreleasedReturnValue();
          }
          v19 = v10;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v22) = 0;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Library is still syncable, transitioning back to open", (uint8_t *)&v22, 2u);
          }

        }
        -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", 1);
        goto LABEL_46;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        v13 = self->_libraryMode;
        if (v13 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v13 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v18 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "libraryURL");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 138412290;
          v23 = v21;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "%@ is no longer syncable, keep CPL OFF", (uint8_t *)&v22, 0xCu);

        }
LABEL_44:

      }
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v11 = self->_libraryMode;
      if (v11 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v18 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "No Apple Account, keep CPL OFF", (uint8_t *)&v22, 2u);
      }
      goto LABEL_44;
    }
    -[PLCloudPhotoLibraryManager _callBlocksWaitingForLibraryOpen](self, "_callBlocksWaitingForLibraryOpen");
LABEL_46:

    return;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v3 = self->_libraryMode;
    if (v3 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v15 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "libraryURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = v17;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "%@ disabled after becoming non-syncable, keep CPL OFF", (uint8_t *)&v22, 0xCu);

    }
  }
  -[PLCloudPhotoLibraryManager _callBlocksWaitingForLibraryOpen](self, "_callBlocksWaitingForLibraryOpen");
}

- (void)_runSyncOnIsolationQueueWithBlock:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  pl_dispatch_sync();

}

- (void)_runAsyncOnIsolationQueueWithTransaction:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v7 = a3;
  v8 = a4;
  v5 = v7;
  v6 = v8;
  pl_dispatch_async();

}

- (void)_runAsyncOnIsolationQueueWithTransaction:(id)a3 afterDelay:(double)a4 block:(id)a5
{
  id v8;
  id v9;
  int64_t libraryMode;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    if (a4 > 30.0 && *MEMORY[0x1E0D115D0] == 0)
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v19 = a4;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "warning: Cloud Photo Library scheduling work in %f seconds with open transaction", buf, 0xCu);
      }

    }
  }
  dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v16 = v8;
  v17 = v9;
  v14 = v8;
  v15 = v9;
  pl_dispatch_after();

}

- (void)_runOnLibraryOpenWithTransaction:(id)a3 block:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6 = (void (**)(_QWORD))a4;
  v7 = v5;
  PLRunWithUnfairLock();
  if (*((_BYTE *)v9 + 24))
    v6[2](v6);

  _Block_object_dispose(&v8, 8);
}

- (void)_callBlocksWaitingForLibraryOpen
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  PLCloudPhotoLibraryManager *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11541;
  v20 = __Block_byref_object_dispose__11542;
  v21 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __62__PLCloudPhotoLibraryManager__callBlocksWaitingForLibraryOpen__block_invoke;
  v13 = &unk_1E3677C68;
  v14 = self;
  v15 = &v16;
  PLRunWithUnfairLock();
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v2 = (id)v17[5];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v22, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v22, 16);
    }
    while (v3);
  }

  _Block_object_dispose(&v16, 8);
}

- (void)_resetDidCallBlocksWaitingForLibraryOpen
{
  PLRunWithUnfairLock();
}

- (BOOL)_canExternallyTransitionToNewLibraryStateIgnoringPause:(BOOL)a3
{
  unint64_t state;
  BOOL v7;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (self->_stateChangePending)
    return 0;
  state = self->_state;
  v7 = state == 8 && a3;
  return state == 6 || v7;
}

- (void)_transitionToState:(unint64_t)a3
{
  unint64_t state;
  int64_t libraryMode;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  _BYTE *v10;
  int64_t v11;
  NSObject *v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  state = self->_state;
  if (state == 9)
  {
    if (*MEMORY[0x1E0D115D0])
      return;
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v15 = v7;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", self->_state);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138412546;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v18 = "Not transitioning state from %@ to %@ because library was deactivated";
LABEL_30:
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v29, 0x16u);

LABEL_31:
    return;
  }
  if (a3 == 1 && state)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v8 = self->_libraryMode;
      if (v8 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v19 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", self->_state);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v20;
        v31 = 2112;
        v32 = v21;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Not transitioning state from %@ to %@, can only transition to open from uninitialized", (uint8_t *)&v29, 0x16u);

      }
    }
  }
  else
  {
    v10 = (_BYTE *)MEMORY[0x1E0D115D0];
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 && state == 1)
    {
      if (*MEMORY[0x1E0D115D0])
        return;
      v11 = self->_libraryMode;
      if (v11 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v15 = v12;
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", self->_state);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138412546;
      v30 = v16;
      v31 = 2112;
      v32 = v17;
      v18 = "Not transitioning state from %@ to %@ because library is opening";
      goto LABEL_30;
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      v13 = self->_libraryMode;
      if (v13 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v13 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v22 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", self->_state);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 138412546;
        v30 = v23;
        v31 = 2112;
        v32 = v24;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Transition state from %@ to %@", (uint8_t *)&v29, 0x16u);

      }
      state = self->_state;
    }
    self->_stateChangePending = 1;
    if (state
      && (-[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary"),
          (v25 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

      if (a3 == 2)
        a3 = 6;
    }
    else if (a3 != 1)
    {
      if (!*v10)
      {
        v26 = self->_libraryMode;
        if (v26 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v27 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v26 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v27 = objc_claimAutoreleasedReturnValue();
        }
        v28 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Forcing transition to open CPL", (uint8_t *)&v29, 2u);
        }

      }
      a3 = 1;
    }
    self->_state = a3;
    -[PLCloudPhotoLibraryManager _processNextTransaction](self, "_processNextTransaction");
  }
}

- (void)_stopUnpauseTimer
{
  NSObject *unpauseDispatchTimer;
  OS_dispatch_source *v4;

  unpauseDispatchTimer = self->_unpauseDispatchTimer;
  if (unpauseDispatchTimer)
  {
    dispatch_source_cancel(unpauseDispatchTimer);
    v4 = self->_unpauseDispatchTimer;
    self->_unpauseDispatchTimer = 0;

  }
}

- (id)_calculateUnpauseTimeForPauseTime:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_pauseReason == 3)
  {
    v3 = (void *)MEMORY[0x1E0C99D48];
    v4 = a3;
    objc_msgSend(v3, "currentCalendar");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startOfDayForDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 32, 3, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = a3;
    objc_msgSend(v5, "dateByAddingTimeInterval:", 1800.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_constructUnpauseTimerFrom:(id)a3 to:(id)a4
{
  NSObject *isolationQueue;
  id v7;
  id v8;
  double v9;
  double v10;
  int64_t libraryMode;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  OS_dispatch_source *unpauseDispatchTimer;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  isolationQueue = self->_isolationQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(isolationQueue);
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = v10;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Will unpaused in %f seconds", buf, 0xCu);
    }

  }
  -[PLCloudPhotoLibraryManager _stopUnpauseTimer](self, "_stopUnpauseTimer");
  v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_isolationQueue);
  pl_dispatch_source_set_event_handler();
  v14 = dispatch_walltime(0, 1000000000 * (unint64_t)v10);
  dispatch_source_set_timer(v17, v14, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  unpauseDispatchTimer = self->_unpauseDispatchTimer;
  self->_unpauseDispatchTimer = (OS_dispatch_source *)v17;
  v16 = v17;

  dispatch_resume((dispatch_object_t)self->_unpauseDispatchTimer);
}

- (BOOL)_setupTimerForUnpause
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "libraryBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indicatorFileCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unpauseTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:", v6);
  if (v8 == -1)
    -[PLCloudPhotoLibraryManager _constructUnpauseTimerFrom:to:](self, "_constructUnpauseTimerFrom:to:", v7, v6);
  else
    objc_msgSend(v5, "clearPauseMarkerForReason:", 3);
  v9 = v8 == -1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8 == -1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("cloudPhotosPaused"), v10, CFSTR("com.apple.mobileslideshow"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.mobileslideshow"));
  return v9;
}

- (void)_updatePendingResetSyncDate
{
  int64_t pendingResetSyncType;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int64_t v21;
  int64_t v22;
  int64_t libraryMode;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v29;
  int v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  pendingResetSyncType = self->_pendingResetSyncType;
  if (!pendingResetSyncType || self->_hasSettledInitialBatch)
  {
    self->_pendingResetSyncType = 0;
    -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cplDataDirectoryCreateIfNeeded:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PLCloudPhotoLibraryLocalModeEnabled(v6);

    if (v7)
    {
      v8 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fakeCPLStatusBaseURLWithBaseURL:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v11 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v11;
    }
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("resetevents.plist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

    if (!v14)
    {
LABEL_23:
      v22 = self->_pendingResetSyncType;
      if (pendingResetSyncType)
      {
        if (!v22)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            libraryMode = self->_libraryMode;
            if (libraryMode == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v24 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (libraryMode == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v24 = objc_claimAutoreleasedReturnValue();
            }
            v25 = v24;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = 138412290;
              v31 = v26;
              _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Finished reset sync at %@, triggering prefetching/pruning", (uint8_t *)&v30, 0xCu);

            }
          }
          -[PLCloudPhotoLibraryManager resourceManager](self, "resourceManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "startAutomaticPrefetchAndPruneWithTimeout:", 0);

          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.ResetSyncStateChanged"), 0, 0, 1u);
          v22 = self->_pendingResetSyncType;
        }
        if (!v22 || pendingResetSyncType == v22)
          goto LABEL_41;
      }
      else if (!v22)
      {
        goto LABEL_41;
      }
      v29 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v29, CFSTR("com.apple.mobileslideshow.ResetSyncStateChanged"), 0, 0, 1u);
LABEL_41:

      return;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16
      || (objc_msgSend(v16, "objectForKey:", CFSTR("pending")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "BOOLValue"),
          v18,
          !v19))
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v17, "objectForKey:", CFSTR("type"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("soft")) & 1) != 0)
    {
      v21 = 1;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("hard")) & 1) != 0)
    {
      v21 = 2;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("recover")) & 1) != 0)
    {
      v21 = 3;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("anchor")) & 1) != 0)
    {
      v21 = 4;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("globalAnchor")) & 1) != 0)
    {
      v21 = 5;
    }
    else
    {
      if (!objc_msgSend(v20, "isEqualToString:", CFSTR("wipe")))
      {
LABEL_21:

        goto LABEL_22;
      }
      v21 = 6;
    }
    self->_pendingResetSyncType = v21;
    goto LABEL_21;
  }
}

- (void)reportMiscInformation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager reportMiscInformation:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PLCloudPhotoLibraryManager_reportMiscInformation___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v5, v7);

}

- (void)_reportOptimizeSettingChangeWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  id WeakRetained;
  void *v6;
  uint64_t v7;
  int64_t libraryMode;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "prefetchMode");

  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("Optimize");
      if (v7 == 1)
        v11 = CFSTR("Keep Originals");
      v15 = 138412290;
      v16 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Reporting optimized setting %@ to feedback", (uint8_t *)&v15, 0xCu);
    }

  }
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7 == 1)
    v14 = CFSTR("false");
  else
    v14 = CFSTR("true");
  objc_msgSend(v12, "reportSetting:hasBeenSetToValue:", *MEMORY[0x1E0D11298], v14);

  if (v4)
    v4[2](v4);

}

- (BOOL)setPrefetchMode:(int64_t)a3 error:(id *)a4
{
  id WeakRetained;
  void *v8;
  BOOL v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "prefetchMode") == a3)
    goto LABEL_5;
  if (!objc_msgSend(v8, "setRunOnceFlag:error:", 1, a4))
  {
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v8, "setPrefetchMode:error:", a3, a4) & 1) == 0)
  {
    objc_msgSend(v8, "clearRunOnceFlag:error:", 1, 0);
    goto LABEL_7;
  }
  -[PLCloudPhotoLibraryManager _handleOptimizeSettingChange](self, "_handleOptimizeSettingChange");
LABEL_5:
  v9 = 1;
LABEL_8:

  return v9;
}

- (void)_handleOptimizeSettingChange
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _handleOptimizeSettingChange]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRunOnceFlag:error:", 2, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke;
  v8[3] = &unk_1E3677530;
  v8[4] = self;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  v7 = v5;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v6, v8);

}

- (void)_handleOptimizeSettingChangeInLibrary:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[8];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isKeepOriginalsEnabled");

  PLResourceCachingGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Switching mode to download and keep originals, updating purgeable flags", buf, 2u);
    }

    +[PLInternalResource predicateForPurgeableOriginalResources](PLInternalResource, "predicateForPurgeableOriginalResources");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("fileID != %lld"), -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0CB3528];
    v29[0] = v13;
    v29[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __90__PLCloudPhotoLibraryManager__handleOptimizeSettingChangeInLibrary_withCompletionHandler___block_invoke;
    v25[3] = &unk_1E3675C58;
    v18 = &v26;
    v25[4] = self;
    v26 = v6;
    v19 = v6;
    -[PLCloudPhotoLibraryManager clearPurgeableResourcesMatchingPredicate:inLibrary:completionHandler:](self, "clearPurgeableResourcesMatchingPredicate:inLibrary:completionHandler:", v17, v7, v25);
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Switching mode to optimize, updating purgeable flags", buf, 2u);
    }

    +[PLInternalResource predicateForAvailableResources](PLInternalResource, "predicateForAvailableResources");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("fileID == %lld"), -1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0CB3528];
    v28[0] = v13;
    v28[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __90__PLCloudPhotoLibraryManager__handleOptimizeSettingChangeInLibrary_withCompletionHandler___block_invoke_175;
    v23[3] = &unk_1E3675C58;
    v18 = &v24;
    v23[4] = self;
    v24 = v6;
    v22 = v6;
    -[PLCloudPhotoLibraryManager markPurgeableResourcesMatchingPredicate:urgency:inLibrary:completionHandler:](self, "markPurgeableResourcesMatchingPredicate:urgency:inLibrary:completionHandler:", v17, 0, v7, v23);
  }

}

- (void)_repushVideoAssetsMetadata
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PLCloudPhotoLibraryManager__repushVideoAssetsMetadata__block_invoke;
  v5[3] = &unk_1E3664588;
  v5[4] = self;
  objc_msgSend(v4, "performTransactionSync:withName:", v5, "-[PLCloudPhotoLibraryManager _repushVideoAssetsMetadata]");

}

- (void)_repushMasterWithMissingMediaMetadata
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__PLCloudPhotoLibraryManager__repushMasterWithMissingMediaMetadata__block_invoke;
  v5[3] = &unk_1E3664588;
  v5[4] = self;
  objc_msgSend(v4, "performTransactionSync:withName:", v5, "-[PLCloudPhotoLibraryManager _repushMasterWithMissingMediaMetadata]");

}

- (void)_repushAssetsWithImportedByBundleIdentifier
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__PLCloudPhotoLibraryManager__repushAssetsWithImportedByBundleIdentifier__block_invoke;
  v5[3] = &unk_1E3664588;
  v5[4] = self;
  objc_msgSend(v4, "performTransactionSync:withName:", v5, "-[PLCloudPhotoLibraryManager _repushAssetsWithImportedByBundleIdentifier]");

}

- (void)clearPurgeableResourcesMatchingPredicate:(id)a3 inLibrary:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  _QWORD v17[4];
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "capabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCentralizedCacheDeleteCapable");

  if (v13)
  {
    v14 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke;
    v17[3] = &unk_1E3677C18;
    v18 = v8;
    v19 = v9;
    v15[0] = v14;
    v15[1] = 3221225472;
    v15[2] = __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke_206;
    v15[3] = &unk_1E3676CD8;
    v16 = v10;
    objc_msgSend(v19, "performTransaction:completionHandler:", v17, v15);

  }
  else if (v10)
  {
    v10[2](v10);
  }

}

- (void)markPurgeableResourcesMatchingPredicate:(id)a3 urgency:(int64_t)a4 inLibrary:(id)a5 completionHandler:(id)a6
{
  -[PLCloudPhotoLibraryManager markPurgeableResourcesMatchingPredicate:urgency:checkIfSafe:inLibrary:completionHandler:](self, "markPurgeableResourcesMatchingPredicate:urgency:checkIfSafe:inLibrary:completionHandler:", a3, a4, 1, a5, a6);
}

- (void)markPurgeableResourcesMatchingPredicate:(id)a3 urgency:(int64_t)a4 checkIfSafe:(BOOL)a5 inLibrary:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  void (**v24)(_QWORD);
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v9 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = (void (**)(_QWORD))a7;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager markPurgeableResourcesMatchingPredicate:urgency:checkIfSafe:inLibrary:completionHandler:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__11541;
  v40 = __Block_byref_object_dispose__11542;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__11541;
  v34 = __Block_byref_object_dispose__11542;
  v35 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __118__PLCloudPhotoLibraryManager_markPurgeableResourcesMatchingPredicate_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke;
  v25[3] = &unk_1E3676348;
  v17 = v12;
  v26 = v17;
  v18 = v13;
  v27 = v18;
  v28 = &v30;
  v29 = &v36;
  objc_msgSend(v18, "performBlockAndWait:", v25);
  v19 = v37[5];
  if (v19)
  {
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __118__PLCloudPhotoLibraryManager_markPurgeableResourcesMatchingPredicate_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke_207;
    v22[3] = &unk_1E3675C58;
    v24 = v14;
    v23 = v15;
    -[PLCloudPhotoLibraryManager _markPurgeableNextBatchOfResources:urgency:checkIfSafe:inLibrary:completionHandler:](self, "_markPurgeableNextBatchOfResources:urgency:checkIfSafe:inLibrary:completionHandler:", v19, a4, v9, v18, v22);

  }
  else
  {
    PLResourceCachingGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = v31[5];
      *(_DWORD *)buf = 138412290;
      v43 = v21;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch available resources to mark purgeable: %@", buf, 0xCu);
    }

    if (v14)
      v14[2](v14);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

}

- (void)_markPurgeableNextBatchOfResources:(id)a3 urgency:(int64_t)a4 checkIfSafe:(BOOL)a5 inLibrary:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  PLCloudPhotoLibraryManager *v20;
  id v21;
  id v22;
  int64_t v23;
  BOOL v24;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__PLCloudPhotoLibraryManager__markPurgeableNextBatchOfResources_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke;
  v18[3] = &unk_1E3664628;
  v19 = v12;
  v20 = self;
  v24 = a5;
  v22 = v14;
  v23 = a4;
  v21 = v13;
  v15 = v13;
  v16 = v14;
  v17 = v12;
  objc_msgSend(v15, "performBlockAndWait:", v18);

}

- (void)_checkAndMarkPurgeableResources:(id)a3 checkIfSafe:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 urgency:(int64_t)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  void (**v28)(_QWORD);
  int64_t v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  PLCloudPhotoLibraryManager *v34;
  int64_t v35;

  v9 = a5;
  v12 = a3;
  v13 = (void (**)(_QWORD))a7;
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 || !objc_msgSend(v12, "count"))
  {
    if (v14 && objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "anyObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "photoLibrary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v20 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_3;
      v30[3] = &unk_1E3667D70;
      v21 = v19;
      v31 = v21;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v30);
      objc_msgSend(v21, "allKeys");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v20;
      v25[1] = 3221225472;
      v25[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_211;
      v25[3] = &unk_1E3662B00;
      v25[4] = self;
      v26 = v18;
      v27 = v21;
      v28 = v13;
      v29 = a6;
      v23 = v21;
      v24 = v18;
      objc_msgSend(v14, "checkResourcesAreSafeToPrune:checkServerIfNecessary:completionHandler:", v22, v9, v25);

    }
    else
    {
      v13[2](v13);
    }
  }
  else
  {
    objc_msgSend(v12, "anyObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke;
    v32[3] = &unk_1E3677C40;
    v33 = v12;
    v34 = self;
    v35 = a6;
    objc_msgSend(v16, "performTransactionAndWait:", v32);
    v13[2](v13);

  }
}

- (void)_processNextTransaction
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _processNextTransaction]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__PLCloudPhotoLibraryManager__processNextTransaction__block_invoke;
  v5[3] = &unk_1E3677C18;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v4, v5);

}

- (void)_checkIfSharedLibraryDedupeIsDisabled
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PLCloudPhotoLibraryManager__checkIfSharedLibraryDedupeIsDisabled__block_invoke;
  block[3] = &unk_1E3677AA0;
  block[4] = self;
  if (_checkIfSharedLibraryDedupeIsDisabled_onceToken != -1)
    dispatch_once(&_checkIfSharedLibraryDedupeIsDisabled_onceToken, block);
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "isCloudPhotoLibraryEnabled");
  }
  else
  {
    -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "libraryURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v7);

  }
  return v5;
}

- (BOOL)_disableiCPLAfterZoneWipedInCloudIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t libraryMode;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudPhotoLibraryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cplStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "iCloudLibraryHasBeenWiped") && self->_libraryMode == 2)
  {
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setICloudPhotosEnabledInternal:", 0);

    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
        objc_msgSend(WeakRetained, "mainScopeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543362;
        v15 = v12;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Disabling sync, because zone has been wiped for library with main scope identifier: %{public}@", (uint8_t *)&v14, 0xCu);

      }
    }
    -[PLCloudPhotoLibraryManager _disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:](self, "_disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:", 0, 2);
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_checkEnableState
{
  _BYTE *v3;
  int64_t libraryMode;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  NSObject *v12;
  int64_t v13;
  NSObject *v14;
  int64_t v15;
  NSObject *v16;
  NSObject *v17;
  id WeakRetained;
  void *v19;
  PLCloudPhotoLibraryManager *v20;
  uint64_t v21;
  int64_t v22;
  NSObject *v23;
  NSObject *v24;
  unint64_t deviceLibraryConfiguration;
  __CFString *v26;
  __CFString *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v3 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Checking enable state, clearing cached primaryAppleAccount", (uint8_t *)&v35, 2u);
    }

  }
  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearCachedProperties");

  if (!-[PLCloudPhotoLibraryManager _disableiCPLAfterZoneWipedInCloudIfNecessary](self, "_disableiCPLAfterZoneWipedInCloudIfNecessary"))
  {
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "indicatorFileCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isDisableICloudPhotos"))
    {
      if (!*v3)
      {
        v11 = self->_libraryMode;
        if (v11 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v11 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
        }
        v17 = v12;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "CloudPhotos was switched OFF, will reset and stop Cloud Photo Library", (uint8_t *)&v35, 2u);
        }

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      objc_msgSend(WeakRetained, "cplSettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setICPLEnabled:error:", 0, 0);

      v20 = self;
      v21 = 2;
LABEL_53:
      -[PLCloudPhotoLibraryManager _disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:](v20, "_disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:", 0, v21);
      goto LABEL_66;
    }
    if (self->_pendingDeviceLibraryConfiguration != self->_deviceLibraryConfiguration)
    {
      if (!*v3)
      {
        v15 = self->_libraryMode;
        if (v15 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v24 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          deviceLibraryConfiguration = self->_deviceLibraryConfiguration;
          if (deviceLibraryConfiguration > 2)
            v26 = CFSTR("unknown");
          else
            v26 = off_1E366BE48[deviceLibraryConfiguration];
          v27 = v26;
          v35 = 138412290;
          v36 = v27;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Handle device-library configuration change on check enable to %@", (uint8_t *)&v35, 0xCu);

        }
      }
      v20 = self;
      v21 = 3;
      goto LABEL_53;
    }
    if (!-[PLCloudPhotoLibraryManager isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled")
      && !objc_msgSend(v10, "isEnableICloudPhotos"))
    {
      -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", 6);
LABEL_66:

      return;
    }
    if (objc_msgSend(v10, "isEnableICloudPhotos"))
    {
      if (!*v3)
      {
        v13 = self->_libraryMode;
        if (v13 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v13 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v28 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v35) = 0;
          _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "CloudPhotos was switched ON, enabling iCPL after opening CPL", (uint8_t *)&v35, 2u);
        }

      }
      -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "databaseContext");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "newShortLivedLibraryForHistoryPersistenceReadingWithName:", "CPL library: Global Values");

      -[NSObject globalValues](v31, "globalValues");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setLastInitialDuplicateDetectorProcessingCompletedToken:", 0);

      v33 = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
      objc_msgSend(v33, "cplSettings");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setICPLEnabled:error:", 1, 0);

    }
    else
    {
      if (*v3)
      {
LABEL_65:
        -[PLCloudPhotoLibraryManager _enableiCPL](self, "_enableiCPL");
        goto LABEL_66;
      }
      v22 = self->_libraryMode;
      if (v22 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v23 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v22 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v23 = objc_claimAutoreleasedReturnValue();
      }
      v31 = v23;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v35) = 0;
        _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Enabling iCPL after opening CPL", (uint8_t *)&v35, 2u);
      }
    }

    goto LABEL_65;
  }
}

- (void)_setupPLCPLPlistInLibrary:(id)a3
{
  id v4;
  _BYTE *v5;
  int64_t libraryMode;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int64_t v26;
  NSObject *v27;
  int64_t v28;
  NSObject *v29;
  int64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  _BOOL4 v35;
  NSObject *v36;
  id WeakRetained;
  void *v38;
  int64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint8_t v44[16];
  uint8_t v45[16];
  uint8_t v46[16];
  uint8_t v47[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Setting up PLCPLPlist", buf, 2u);
    }

  }
  v9 = (void *)MEMORY[0x1E0D73190];
  v10 = *MEMORY[0x1E0D734E8];
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readCPLPlistObjectWithKey:pathManager:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  self->_wasRebuild = 0;
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "persistentContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sharedPersistentStoreCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "persistentStores");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0C97A08]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v21 = objc_msgSend(v12, "isEqualToString:", v20);
    self->_wasRebuild = v21 ^ 1;
    if ((v21 & 1) != 0)
    {
      -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "libraryBundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "indicatorFileCoordinator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "isForceSoftResetSync");
      if (v25)
      {
        if (!*v5)
        {
          v26 = self->_libraryMode;
          if (v26 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v27 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v26 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v27 = objc_claimAutoreleasedReturnValue();
          }
          v36 = v27;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v46 = 0;
            _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Force soft reset sync filemarker detected, will reset and upload Cloud Photo Library", v46, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd detected a reset sync marker"));
        -[PLCloudPhotoLibraryManager _doResetSync:inLibrary:](self, "_doResetSync:inLibrary:", 1, v4);
      }

    }
    else
    {
      if (!*v5)
      {
        v30 = self->_libraryMode;
        if (v30 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v31 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v30 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v31 = objc_claimAutoreleasedReturnValue();
        }
        v33 = v31;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v47 = 0;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Rebuild was detected, will reset and upload Cloud Photo Library", v47, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd detected a Photo Library rebuild"));
      -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = +[PLRebuildJournalManager isEnabledWithPathManager:error:](PLRebuildJournalManager, "isEnabledWithPathManager:error:", v34, 0);

      if (v35)
      {
        v25 = 1;
        -[PLCloudPhotoLibraryManager _doResetSync:inLibrary:](self, "_doResetSync:inLibrary:", 1, v4);
      }
      else
      {
        -[PLCloudPhotoLibraryManager _doResetSync:inLibrary:](self, "_doResetSync:inLibrary:", 2, v4);
        v25 = 1;
      }
    }
  }
  else
  {
    if (!*v5)
    {
      v28 = self->_libraryMode;
      if (v28 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v28 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v32 = v29;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Force soft reset sync due to missing previous store UUID", v45, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("missing previous store UUID"));
    v25 = 1;
    -[PLCloudPhotoLibraryManager _doResetSync:inLibrary:](self, "_doResetSync:inLibrary:", 1, v4);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cplSettings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && objc_msgSend(v38, "runOnceFlagIsSet:", 4))
  {
    if (!*v5)
    {
      v39 = self->_libraryMode;
      if (v39 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v40 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v39 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v40 = objc_claimAutoreleasedReturnValue();
      }
      v41 = v40;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEFAULT, "Clearing shouldMarkPurgeableResourcesOnce due to reset sync", v44, 2u);
      }

    }
    objc_msgSend(v38, "setRunOnceFlag:error:", 4, 0);
  }
  if ((objc_msgSend(v20, "isEqualToString:", v12) & 1) == 0)
  {
    v42 = (void *)MEMORY[0x1E0D73190];
    -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "saveCPLPlistObject:forKey:pathManager:", v20, v10, v43);

  }
}

- (void)_callPushAllChangesCompletionHandlersIfNecessary
{
  int64_t libraryMode;
  NSObject *v4;
  NSObject *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_pushingAllChanges)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Requested to push all changes: complete, calling completion handlers", buf, 2u);
      }

    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_pushAllChangesCompletionHandlers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

    -[NSMutableArray removeAllObjects](self->_pushAllChangesCompletionHandlers, "removeAllObjects", (_QWORD)v11);
    self->_pushingAllChanges = 0;
  }
}

- (void)_saveLastKnownCloudChangeTrackerTokenToDiskWithContext:(id)a3
{
  id v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "saveLastKnownCloudChangeTrackerTokenToDisk", v8, 2u);
    }

  }
  -[PLCloudPersistentHistoryChangeTracker saveLastKnownChangeTrackerTokenToDiskWithContext:](self->_syncChangeTracker, "saveLastKnownChangeTrackerTokenToDiskWithContext:", v4);

}

- (BOOL)_connectToCloudChangeTrackerWithContext:(id)a3
{
  return -[PLCloudPersistentHistoryChangeTracker connectWithContext:](self->_syncChangeTracker, "connectWithContext:", a3);
}

- (id)readCloudTrackerToken
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  PLGlobalValues *v6;
  void *v7;
  PLGlobalValues *v8;

  if (self->_wasRebuild)
  {
    v2 = 0;
  }
  else
  {
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "databaseContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "newShortLivedLibraryForHistoryPersistenceReadingWithName:", "-[PLCloudPhotoLibraryManager readCloudTrackerToken]");

    v6 = [PLGlobalValues alloc];
    objc_msgSend(v5, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PLGlobalValues initWithManagedObjectContext:](v6, "initWithManagedObjectContext:", v7);

    -[PLGlobalValues cloudTrackerLastKnownToken](v8, "cloudTrackerLastKnownToken");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)saveCloudTrackerToken:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  PLGlobalValues *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v5);

  -[PLGlobalValues setCloudTrackerLastKnownToken:](v7, "setCloudTrackerLastKnownToken:", v6);
}

- (void)cloudChangeTrackerDidReceiveChangesWithTransaction:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __81__PLCloudPhotoLibraryManager_cloudChangeTrackerDidReceiveChangesWithTransaction___block_invoke;
  v3[3] = &unk_1E3677AA0;
  v3[4] = self;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", a3, v3);
}

- (id)readRulesTrackerToken
{
  void *v2;
  void *v3;
  void *v4;
  PLGlobalValues *v5;
  void *v6;
  PLGlobalValues *v7;
  void *v8;

  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newShortLivedLibraryForHistoryPersistenceReadingWithName:", "-[PLCloudPhotoLibraryManager readRulesTrackerToken]");

  v5 = [PLGlobalValues alloc];
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLGlobalValues initWithManagedObjectContext:](v5, "initWithManagedObjectContext:", v6);

  -[PLGlobalValues libraryScopeRulesTrackerLastKnownToken](v7, "libraryScopeRulesTrackerLastKnownToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)saveRulesTrackerToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PLGlobalValues *v7;
  void *v8;
  PLGlobalValues *v9;
  id v10;

  v4 = a3;
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "newShortLivedLibraryForHistoryPersistenceReadingWithName:", "-[PLCloudPhotoLibraryManager saveRulesTrackerToken:]");

  v7 = [PLGlobalValues alloc];
  objc_msgSend(v10, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLGlobalValues initWithManagedObjectContext:](v7, "initWithManagedObjectContext:", v8);

  -[PLGlobalValues setLibraryScopeRulesTrackerLastKnownToken:](v9, "setLibraryScopeRulesTrackerLastKnownToken:", v4);
}

- (void)sync
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager sync]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__PLCloudPhotoLibraryManager_sync__block_invoke;
  v4[3] = &unk_1E3677AA0;
  v4[4] = self;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v3, v4);

}

- (void)cancelResourceTransferTaskWithIdentifier:(id)a3 completion:(id)a4
{
  -[PLCloudTaskManager cancelTaskWithTaskIdentifier:completion:](self->_taskManager, "cancelTaskWithTaskIdentifier:completion:", a3, a4);
}

- (BOOL)isResourceTransferTaskAliveWithTaskWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[PLCloudTaskManager getPendingTaskForTaskIdentifier:](self->_taskManager, "getPendingTaskForTaskIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)fetchAdjustmentDataForAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PLCloudPhotoLibraryManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager fetchAdjustmentDataForAsset:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke;
  v11[3] = &unk_1E3676290;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v8, v11);

}

- (void)fetchResourcesForAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PLCloudPhotoLibraryManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager fetchResourcesForAsset:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke;
  v11[3] = &unk_1E3676290;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v8, v11);

}

- (void)getStreamingURLForAsset:(id)a3 resourceType:(unint64_t)a4 intent:(unint64_t)a5 hints:(id)a6 timeRange:(id *)a7 clientBundleID:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  __int128 v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  PLCloudPhotoLibraryManager *v28;
  id v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;

  v15 = a3;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager getStreamingURLForAsset:resourceType:intent:hints:timeRange:clientBundleID:completionHandler:]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = 3221225472;
  v20 = *(_OWORD *)&a7->var0.var3;
  v33 = *(_OWORD *)&a7->var0.var0;
  v34 = v20;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[2] = __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke;
  v25[3] = &unk_1E3662BA0;
  v26 = v16;
  v27 = v15;
  v31 = a4;
  v32 = a5;
  v35 = *(_OWORD *)&a7->var1.var1;
  v28 = self;
  v29 = v17;
  v30 = v18;
  v21 = v18;
  v22 = v17;
  v23 = v15;
  v24 = v16;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v19, v25);

}

- (id)_identifierForResource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "itemScopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "descriptionWithNoScopeIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "resourceType");

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_%lu"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)downloadResource:(id)a3 highPriority:(BOOL)a4 clientBundleID:(id)a5 proposedTaskIdentifier:(id)a6 taskDidBeginHandler:(id)a7 progressBlock:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v13;
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v13 = a4;
  v16 = (objc_class *)MEMORY[0x1E0D11458];
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  v23 = (id)objc_msgSend([v16 alloc], "initWithHighPriority:", v13);
  -[PLCloudPhotoLibraryManager downloadResource:options:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:](self, "downloadResource:options:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", v22, v23, v21, v20, v19, v18, v17);

}

- (void)downloadResource:(id)a3 options:(id)a4 clientBundleID:(id)a5 proposedTaskIdentifier:(id)a6 taskDidBeginHandler:(id)a7 progressBlock:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  PLCloudPhotoLibraryManager *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = objc_msgSend(v15, "resourceType");
  if (v21)
    v23 = v21;
  else
    v23 = &__block_literal_global_240;
  if (!v19)
    v19 = &__block_literal_global_242;
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager downloadResource:options:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __145__PLCloudPhotoLibraryManager_downloadResource_options_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_progressBlock_completionHandler___block_invoke_3;
    v27[3] = &unk_1E3662C30;
    v28 = v16;
    v29 = self;
    v30 = v15;
    v34 = v19;
    v37 = v22;
    v31 = v18;
    v35 = v20;
    v36 = v23;
    v32 = v17;
    v33 = v24;
    v25 = v24;
    -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v25, v27);

  }
  else
  {
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, uint64_t, void *))v19 + 2))(v19, 0, v22, v26);

  }
}

- (id)_assetResourceForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 isPhoto:(BOOL *)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v9 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__11541;
  v24 = __Block_byref_object_dispose__11542;
  v25 = 0;
  objc_msgSend(v9, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__PLCloudPhotoLibraryManager__assetResourceForAsset_resourceType_masterResourceOnly_isPhoto___block_invoke;
  v14[3] = &unk_1E3662C58;
  v16 = &v26;
  v11 = v9;
  v19 = a5;
  v15 = v11;
  v17 = &v20;
  v18 = a4;
  objc_msgSend(v10, "performBlockAndWait:", v14);

  if (a6)
    *a6 = *((_BYTE *)v27 + 24);
  v12 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v12;
}

- (void)downloadAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 highPriority:(BOOL)a6 clientBundleID:(id)a7 proposedTaskIdentifier:(id)a8 taskDidBeginHandler:(id)a9 progressBlock:(id)a10 completionHandler:(id)a11
{
  _BOOL8 v13;
  _BOOL8 v14;
  id v17;
  id v18;
  id v19;
  void (**v20)(id, _QWORD, unint64_t, void *);
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int64_t libraryMode;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;

  v13 = a6;
  v14 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a7;
  v19 = a8;
  v20 = (void (**)(id, _QWORD, unint64_t, void *))a9;
  v21 = a10;
  v22 = a11;
  if (!v20)
    v20 = (void (**)(id, _QWORD, unint64_t, void *))&__block_literal_global_248;
  v33 = 0;
  -[PLCloudPhotoLibraryManager _assetResourceForAsset:resourceType:masterResourceOnly:isPhoto:](self, "_assetResourceForAsset:resourceType:masterResourceOnly:isPhoto:", v17, a4, v14, &v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[PLCloudPhotoLibraryManager downloadResource:highPriority:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:](self, "downloadResource:highPriority:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:progressBlock:completionHandler:", v23, v13, v18, v19, v20, v21, v22);
  }
  else
  {
    if (v33)
      v24 = 3;
    else
      v24 = 4;
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allAssetCPLResources");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allMasterCPLResources");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v28 = v27;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "master");
        v30 = v25;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        v35 = v30;
        v36 = 2112;
        v37 = v17;
        v38 = 2112;
        v39 = v32;
        v40 = 2112;
        v41 = v29;
        v42 = 2112;
        v43 = v31;
        v44 = 2048;
        v45 = a4;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "%@. Asset: %@ %@, Master: %@ %@, resourceType: %lu", buf, 0x3Eu);

        v25 = v30;
      }

    }
    v20[2](v20, 0, a4, v25);

  }
}

- (void)downloadResourceInMemoryForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 clientBundleID:(id)a6 proposedTaskIdentifier:(id)a7 taskDidBeginHandler:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  if (a3)
  {
    if (a9)
    {
      v12 = a5;
      v16 = a9;
      v17 = a8;
      v18 = a7;
      v19 = a6;
      -[PLCloudPhotoLibraryManager _assetResourceForAsset:resourceType:masterResourceOnly:isPhoto:](self, "_assetResourceForAsset:resourceType:masterResourceOnly:isPhoto:", a3, a4, v12, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      -[PLCloudPhotoLibraryManager downloadResourceInMemory:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:completionHandler:](self, "downloadResourceInMemory:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:completionHandler:", v20, v19, v18, v17, v16);

    }
  }
}

- (void)downloadResourceInMemory:(id)a3 clientBundleID:(id)a4 proposedTaskIdentifier:(id)a5 taskDidBeginHandler:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = v16;
  if (v12 && v16)
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager downloadResourceInMemory:clientBundleID:proposedTaskIdentifier:taskDidBeginHandler:completionHandler:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __131__PLCloudPhotoLibraryManager_downloadResourceInMemory_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_completionHandler___block_invoke;
    v20[3] = &unk_1E3662CA8;
    v20[4] = self;
    v21 = v12;
    v25 = v15;
    v22 = v14;
    v26 = v17;
    v23 = v13;
    v24 = v18;
    v19 = v18;
    -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v19, v20);

  }
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager deleteResources:checkServerIfNecessary:completionHandler:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PLCloudPhotoLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke;
  v13[3] = &unk_1E36755F8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v10, v13);

}

- (void)_doResetSync:(int64_t)a3 inLibrary:(id)a4
{
  id v6;
  _BYTE *v7;
  int64_t libraryMode;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  NSObject *v16;
  NSObject *v17;
  int64_t v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  void *v31;
  PLCloudPhotoLibraryManager *v32;
  uint8_t buf[4];
  int64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (a3 != 2)
    self->_initializedMaster = 1;
  v7 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v34 = a3;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Re-push local library to the cloud due to starting reset sync of type: %ld", buf, 0xCu);
    }

  }
  v11 = MEMORY[0x1E0C809B0];
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __53__PLCloudPhotoLibraryManager__doResetSync_inLibrary___block_invoke;
  v31 = &unk_1E3677AA0;
  v32 = self;
  PLRunWithUnfairLock();
  -[PLCloudPhotoLibraryUploadTracker reset](self->_uploadTracker, "reset");
  -[PLCloudBatchUploader setInitialUpload:](self->_uploader, "setInitialUpload:", 1);
  self->_pullOnIdle = 1;
  v12 = (void *)MEMORY[0x1E0D73190];
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v12, "CPLPlistFileExistsWithPathManager:", v13);

  if ((_DWORD)v12)
    self->_pendingResetSyncType = a3;
  -[PLCloudPhotoLibraryManager resourceManager](self, "resourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stop");

  if (a3 == 2 && self->_syncChangeTracker)
  {
    if (*v7)
      goto LABEL_38;
    v15 = self->_libraryMode;
    if (v15 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v15 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Tried to hard reset while we had an existing hub connection.  This could cause data loss so ignoring.  PLEASE REPORT THIS!", buf, 2u);
    }

  }
  else
  {
    PLResetSyncStatusWithLibrary(v6, 0, a3 == 2, 0, 0);
  }
  if (!*v7)
  {
    v18 = self->_libraryMode;
    if (v18 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v18 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v20 = v19;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Clearing cloud version and last initial upload date from PLGlobalValues...", buf, 2u);
    }

  }
LABEL_38:
  objc_msgSend(v6, "globalValues");
  v23 = v11;
  v24 = 3221225472;
  v25 = __53__PLCloudPhotoLibraryManager__doResetSync_inLibrary___block_invoke_253;
  v26 = &unk_1E3677AA0;
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v27;
  objc_msgSend(v6, "performTransactionAndWait:", &v23);
  -[PLCloudPersistentHistoryChangeTracker forceTokenToCurrent](self->_syncChangeTracker, "forceTokenToCurrent", v23, v24, v25, v26);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.ResetSyncStateChanged"), 0, 0, 1u);

}

- (void)startAssetRecoveryWithTransaction:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[PLCloudPhotoLibraryManager isCloudPhotoLibraryEnabled](self, "isCloudPhotoLibraryEnabled"))
  {
    -[PLCloudPhotoLibraryManager recoveryManager](self, "recoveryManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startRecoveryUsingCloudPhotoLibraryManager:transaction:shouldIdentifyInconsistentAssets:", self, v5, 1);

  }
}

- (void)startLibraryScopeRulesChangeTracker
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__PLCloudPhotoLibraryManager_startLibraryScopeRulesChangeTracker__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", 0, v2);
}

- (void)_startLibraryScopeRulesChangeTrackerInQueue
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PLCloudPhotoLibraryManager *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!self->_libraryMode)
  {
    if (PLIsSharedLibrarySuggestionsEnabled())
    {
      -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "databaseContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "newShortLivedLibraryForHistoryPersistenceReadingWithName:", "PLLibraryScopeChangeTracker persistence history tracker");

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __73__PLCloudPhotoLibraryManager__startLibraryScopeRulesChangeTrackerInQueue__block_invoke;
      v7[3] = &unk_1E3677C18;
      v8 = v5;
      v9 = self;
      v6 = v5;
      objc_msgSend(v6, "performBlockAndWait:", v7);

    }
  }
}

- (void)removeAllChangeHubKeys
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D73190];
  v3 = *MEMORY[0x1E0D734E0];
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveCPLPlistObject:forKey:pathManager:", 0, v3, v4);

}

- (id)readLocalVersion
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_opt_class();
  v3 = (void *)MEMORY[0x1E0D73190];
  v4 = *MEMORY[0x1E0D734E0];
  -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readCPLPlistObjectWithKey:pathManager:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (void)resetSyncDueToMigrationMarker
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("Change Hub migration marker found"));
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager resetSyncDueToMigrationMarker]");

  -[PLCloudPhotoLibraryManager _doResetSync:inLibrary:](self, "_doResetSync:inLibrary:", 1, v5);
}

- (void)stopLibraryScopeRulesChangeTracker
{
  int64_t libraryMode;
  NSObject *v4;
  NSObject *v5;
  PLLibraryScopeChangeTracker *rulesChangeTracker;
  uint8_t v7[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Disconnecting and clearing rules change tracker", v7, 2u);
    }

  }
  -[PLLibraryScopeChangeTracker stop](self->_rulesChangeTracker, "stop");
  rulesChangeTracker = self->_rulesChangeTracker;
  self->_rulesChangeTracker = 0;

}

- (void)photosPreferencesChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__PLCloudPhotoLibraryManager_photosPreferencesChanged__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", 0, v2);
}

- (void)_processRulesEvaluationIfNeeded
{
  PLLibraryScopeChangeTracker *rulesChangeTracker;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  PLCloudPhotoLibraryManager *v14;
  id v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  rulesChangeTracker = self->_rulesChangeTracker;
  if (rulesChangeTracker)
  {
    -[PLLibraryScopeChangeTracker fetchObjectsNeedingEvaluation](rulesChangeTracker, "fetchObjectsNeedingEvaluation");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetObjectIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "detectedFaceObjectIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
    {
      -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "databaseContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "newShortLivedLibraryWithName:", "-[PLCloudPhotoLibraryManager _processRulesEvaluationIfNeeded]");

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __61__PLCloudPhotoLibraryManager__processRulesEvaluationIfNeeded__block_invoke;
      v11[3] = &unk_1E3677998;
      v12 = v8;
      v13 = v4;
      v14 = self;
      v15 = v5;
      v9 = v8;
      objc_msgSend(v9, "performTransactionAndWait:", v11);

    }
    -[PLLibraryScopeChangeTracker updateLastKnownTokenToResult:](self->_rulesChangeTracker, "updateLastKnownTokenToResult:", v10);

  }
}

- (void)_fetchNewEventsFromCloudChangeTrackerInLibrary:(id)a3
{
  id v4;
  _BYTE *v5;
  int64_t libraryMode;
  NSObject *v7;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  int64_t v11;
  NSObject *v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int64_t v19;
  NSObject *v20;
  int64_t v21;
  NSObject *v22;
  int64_t v23;
  NSObject *v24;
  int64_t v25;
  NSObject *v26;
  NSObject *v27;
  int64_t v28;
  NSObject *v29;
  int64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  PLCloudPhotoLibraryManager *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  int64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  int v47;
  void *v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEBUG, "Fetching new events from cloud change tracker", (uint8_t *)&v47, 2u);
    }

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (-[PLCloudPhotoLibraryManager isConnectedToCloudChangeTracker](self, "isConnectedToCloudChangeTracker"))
  {
    if (-[PLCloudBatchUploader initialUpload](self->_uploader, "initialUpload"))
    {
      if (!*v5)
      {
        v9 = self->_libraryMode;
        if (v9 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v9 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v16 = v10;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Is initial upload so uploading full library", (uint8_t *)&v47, 2u);
        }

      }
      -[PLCloudPhotoLibraryManager _uploadFullPhotoLibraryToCloud:](self, "_uploadFullPhotoLibraryToCloud:", v4);
      goto LABEL_106;
    }
    if (!*v5)
    {
      v13 = self->_libraryMode;
      if (v13 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v13 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v17 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v47) = 0;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEBUG, "Fetching events from cloud change tracker", (uint8_t *)&v47, 2u);
      }

    }
    -[PLCloudPhotoLibraryManager _fetchEventsFromCloudChangeTrackerInLibrary:](self, "_fetchEventsFromCloudChangeTrackerInLibrary:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "resultType") == 4)
    {
      if (!*v5)
      {
        v19 = self->_libraryMode;
        if (v19 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v19 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v20 = objc_claimAutoreleasedReturnValue();
        }
        v27 = v20;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEBUG, "No history when fetching events", (uint8_t *)&v47, 2u);
        }

      }
      if (-[PLCloudPersistentHistoryChangeTracker hasChangeTrackerToken](self->_syncChangeTracker, "hasChangeTrackerToken"))
      {
        if (!*v5)
        {
          v28 = self->_libraryMode;
          if (v28 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v29 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v28 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v29 = objc_claimAutoreleasedReturnValue();
          }
          v36 = v29;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v47) = 0;
            _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_DEFAULT, "Cloud change tracker has no history but an existing token so doing a reset sync", (uint8_t *)&v47, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd changeStore has no history"));
        -[PLCloudPhotoLibraryManager _doResetSync:inLibrary:](self, "_doResetSync:inLibrary:", 1, v4);
        -[PLCloudPersistentHistoryChangeTracker clearToken](self->_syncChangeTracker, "clearToken");
      }
      else
      {
        if (!*v5)
        {
          v30 = self->_libraryMode;
          if (v30 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v31 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v30 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v31 = objc_claimAutoreleasedReturnValue();
          }
          v37 = v31;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v47) = 0;
            _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "Cloud change tracker has no history and no existing token so uploading full library", (uint8_t *)&v47, 2u);
          }

        }
        -[PLCloudPhotoLibraryManager _uploadFullPhotoLibraryToCloud:](self, "_uploadFullPhotoLibraryToCloud:", v4);
      }
      goto LABEL_105;
    }
    if (objc_msgSend(v18, "resultType") == 3)
    {
      if (!*v5)
      {
        v21 = self->_libraryMode;
        if (v21 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v21 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
        }
        v32 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v47) = 0;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Change token is unexpectedly up-to-date", (uint8_t *)&v47, 2u);
        }

      }
      objc_msgSend(v4, "managedObjectContext");
      v33 = objc_claimAutoreleasedReturnValue();
      -[PLCloudPhotoLibraryManager _saveLastKnownCloudChangeTrackerTokenToDiskWithContext:](self, "_saveLastKnownCloudChangeTrackerTokenToDiskWithContext:", v33);
LABEL_90:

      goto LABEL_91;
    }
    if (objc_msgSend(v18, "resultType") == 5)
    {
      if (!*v5)
      {
        v23 = self->_libraryMode;
        if (v23 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v24 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v23 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v24 = objc_claimAutoreleasedReturnValue();
        }
        v33 = v24;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v18, "currentTokenDescription");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLCloudPersistentHistoryChangeTracker lastKnownTokenDescription](self->_syncChangeTracker, "lastKnownTokenDescription");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 138543618;
          v48 = v38;
          v49 = 2114;
          v50 = (uint64_t)v39;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "We're not up to date, be there were no new events. Current token: %{public}@, we have %{public}@", (uint8_t *)&v47, 0x16u);

        }
        goto LABEL_90;
      }
    }
    else
    {
      if (!*v5)
      {
        v25 = self->_libraryMode;
        if (v25 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v26 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v25 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v26 = objc_claimAutoreleasedReturnValue();
        }
        v40 = v26;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          -[PLCloudPersistentHistoryChangeTracker lastKnownTokenDescription](self->_syncChangeTracker, "lastKnownTokenDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v18, "resultType");
          v47 = 138543618;
          v48 = v41;
          v49 = 2048;
          v50 = v42;
          _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "fetched history from assetd since: %{public}@, resultType: %zd", (uint8_t *)&v47, 0x16u);

        }
      }
      if (objc_msgSend(v18, "resultType") != 1)
      {
        if (objc_msgSend(v18, "resultType") != 2)
        {
          -[PLCloudPhotoLibraryManager _uploadToCloudForEventsResult:inLibrary:](self, "_uploadToCloudForEventsResult:inLibrary:", v18, v4);
          goto LABEL_105;
        }
        if (!*v5)
        {
          v43 = self->_libraryMode;
          if (v43 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v44 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v43 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v44 = objc_claimAutoreleasedReturnValue();
          }
          v45 = v44;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            -[PLCloudPersistentHistoryChangeTracker lastKnownTokenDescription](self->_syncChangeTracker, "lastKnownTokenDescription");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = 138543362;
            v48 = v46;
            _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_DEFAULT, "assetsd doesn't have change history for what we need. We're now going to re-push our current local library to the cloud, last token = %{public}@", (uint8_t *)&v47, 0xCu);

          }
        }
        objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd can't find its change history"));
        -[PLCloudPhotoLibraryManager _doResetSync:inLibrary:](self, "_doResetSync:inLibrary:", 1, v4);
        v34 = self;
        v35 = 3;
LABEL_92:
        -[PLCloudPhotoLibraryManager _transitionToState:](v34, "_transitionToState:", v35);
LABEL_105:

        goto LABEL_106;
      }
    }
LABEL_91:
    v34 = self;
    v35 = 6;
    goto LABEL_92;
  }
  if (!*v5)
  {
    v11 = self->_libraryMode;
    if (v11 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v15 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Skip fetching new events when iCPL is not enabled", (uint8_t *)&v47, 2u);
    }

  }
  -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", 6);
LABEL_106:

}

- (id)_fetchEventsFromCloudChangeTrackerInLibrary:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
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
  v14 = __Block_byref_object_copy__11541;
  v15 = __Block_byref_object_dispose__11542;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__PLCloudPhotoLibraryManager__fetchEventsFromCloudChangeTrackerInLibrary___block_invoke;
  v8[3] = &unk_1E3676EA0;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (BOOL)isConnectedToCloudChangeTracker
{
  return -[PLCloudPersistentHistoryChangeTracker isConnected](self->_syncChangeTracker, "isConnected");
}

- (void)_fixMasterStatusIn:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(v6, "copy");
    -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__PLCloudPhotoLibraryManager__fixMasterStatusIn_inLibrary___block_invoke;
    v10[3] = &unk_1E3662CD0;
    v10[4] = self;
    v11 = v7;
    objc_msgSend(v9, "getStatusForRecordsWithScopedIdentifiers:completionHandler:", v8, v10);

  }
}

- (void)_checkForPushedMastersInLibrary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLCloudPhotoLibraryManager *v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__PLCloudPhotoLibraryManager__checkForPushedMastersInLibrary___block_invoke;
  v8[3] = &unk_1E3677530;
  v9 = v5;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v6, "performTransaction:", v8);

}

- (void)_uploadFullPhotoLibraryToCloud:(id)a3
{
  id v4;
  int64_t libraryMode;
  NSObject *v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager _migrateFromChangeHubToCoreDataIfNecessary](self, "_migrateFromChangeHubToCoreDataIfNecessary");
  -[PLCloudBatchUploader uploadFullPhotoLibraryToCloud:](self->_uploader, "uploadFullPhotoLibraryToCloud:", v4);
  if (-[PLCloudBatchUploader hasBatchesToUpload](self->_uploader, "hasBatchesToUpload"))
  {
    if (*MEMORY[0x1E0D115D0])
    {
      v11 = 4;
      goto LABEL_24;
    }
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v10 = -[PLCloudBatchUploader numberOfBatchesToUpload](self->_uploader, "numberOfBatchesToUpload");
      v13[0] = 67109120;
      v13[1] = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Uploading full library (%d batches) to cloud", (uint8_t *)v13, 8u);
    }
    v11 = 4;
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v7 = self->_libraryMode;
      if (v7 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v7 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v12 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Finished initial upload", (uint8_t *)v13, 2u);
      }

    }
    -[PLCloudBatchUploader setInitialUpload:](self->_uploader, "setInitialUpload:", 0);
    objc_msgSend(v4, "globalValues");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setCloudInitialUploadCompleted:](v9, "setCloudInitialUploadCompleted:", 1);
    v11 = 6;
  }

LABEL_24:
  -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", v11);

}

- (void)_uploadToCloudForEventsResult:(id)a3 inLibrary:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  SEL v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__PLCloudPhotoLibraryManager__uploadToCloudForEventsResult_inLibrary___block_invoke;
  v11[3] = &unk_1E3674F30;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v14 = a2;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v11);

}

- (void)updateTransferCountsWithInsertedPhotoCount:(unint64_t)a3 insertedVideoCount:(unint64_t)a4 inLibrary:(id)a5
{
  id v6;

  if (a4 | a3)
  {
    v6 = a5;
    PLRunWithUnfairLock();
    -[PLCloudPhotoLibraryManager _updateTransferCountsInLibrary:](self, "_updateTransferCountsInLibrary:", v6);

  }
}

- (void)_processUploadBatchInLibrary:(id)a3
{
  -[PLCloudPhotoLibraryManager _processUploadBatchWithStartupFailureCount:inLibrary:](self, "_processUploadBatchWithStartupFailureCount:inLibrary:", 0, a3);
}

- (void)_handleFinalizeSessionError:(id)a3 commitError:(id)a4 uploadBatchContainer:(id)a5 needResetSync:(BOOL)a6 forTransaction:(id)a7 inLibrary:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int64_t libraryMode;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v20 = objc_claimAutoreleasedReturnValue();
    }
    v21 = v20;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v14;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEBUG, "finalizeError: %@", buf, 0xCu);
    }

  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke;
  v27[3] = &unk_1E3671800;
  v27[4] = self;
  v28 = v15;
  v29 = v14;
  v30 = v16;
  v33 = a6;
  v31 = v18;
  v32 = v17;
  v22 = v17;
  v23 = v18;
  v24 = v16;
  v25 = v14;
  v26 = v15;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v22, v27);

}

- (void)_finishUploadWithNoBatchesToUploadInLibrary:(id)a3
{
  id v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11[16];

  v4 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "No batches to upload", v11, 2u);
    }

  }
  objc_msgSend(v4, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager _saveLastKnownCloudChangeTrackerTokenToDiskWithContext:](self, "_saveLastKnownCloudChangeTrackerTokenToDiskWithContext:", v8);

  -[PLCloudBatchUploader processMomentSharesNeedingForceSyncInLibrary:](self->_uploader, "processMomentSharesNeedingForceSyncInLibrary:", v4);
  if (-[PLCloudBatchUploader initialUpload](self->_uploader, "initialUpload"))
  {
    v9 = 3;
    v10 = 90;
  }
  else
  {
    v10 = 90;
    if (self->_pushOnIdle)
    {
      v9 = 3;
    }
    else
    {
      v10 = 91;
      v9 = 5;
    }
  }
  *((_BYTE *)&self->super.isa + v10) = 0;
  -[PLCloudPhotoLibraryManager _transitionToState:](self, "_transitionToState:", v9);

}

- (void)_processUploadBatchWithStartupFailureCount:(unint64_t)a3 inLibrary:(id)a4
{
  id v6;
  int64_t libraryMode;
  NSObject *v8;
  NSObject *v9;
  int v10;
  unint64_t v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  int64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  unint64_t v27;
  _QWORD v28[5];
  id v29;
  id v30;
  NSObject *v31;
  os_signpost_id_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  PLCloudPhotoLibraryManager *v38;
  uint8_t buf[4];
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v10 = -[PLCloudBatchUploader numberOfBatchesToUpload](self->_uploader, "numberOfBatchesToUpload");
      *(_DWORD *)buf = 67109120;
      LODWORD(v40) = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Processing %d upload batches", buf, 8u);
    }

  }
  if (-[PLCloudBatchUploader hasBatchesToUpload](self->_uploader, "hasBatchesToUpload"))
  {
    v27 = a3;
    v11 = -[PLCloudPhotoLibraryUploadTracker totalSizeOfUnpushedOriginals](self->_uploadTracker, "totalSizeOfUnpushedOriginals");
    PLCPLGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);
    v14 = v12;
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_DWORD *)buf = 134217984;
      v40 = v11;
      _os_signpost_emit_with_name_impl(&dword_199541000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "Upload", "total size of unpushed originals: %llu", buf, 0xCu);
    }

    v16 = MEMORY[0x1E0C809B0];
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke;
    v37 = &unk_1E3677AA0;
    v38 = self;
    PLRunWithUnfairLock();
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _processUploadBatchWithStartupFailureCount:inLibrary:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "postRunningProgress");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isCancelled");

    if (v20)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v21 = self->_libraryMode;
        if (v21 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v21 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
        }
        v25 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
        }

      }
      v26 = v15;
      v23 = v26;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v13, "Upload", "Shutting Down", buf, 2u);
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "_lastKnownCloudVersionInLibrary:", v6);
      v23 = objc_claimAutoreleasedReturnValue();
      -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v16;
      v28[1] = 3221225472;
      v28[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_292;
      v28[3] = &unk_1E3662E30;
      v28[4] = self;
      v29 = v17;
      v30 = v6;
      v31 = v15;
      v32 = v13;
      v33 = v27;
      objc_msgSend(v24, "beginPushChangeSessionWithKnownLibraryVersion:completionHandler:", v23, v28);

    }
  }
  else
  {
    -[PLCloudPhotoLibraryManager _finishUploadWithNoBatchesToUploadInLibrary:](self, "_finishUploadWithNoBatchesToUploadInLibrary:", v6);
  }

}

- (void)startAutomaticPrefetchOrPrune
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__PLCloudPhotoLibraryManager_startAutomaticPrefetchOrPrune__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", 0, v2);
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager getSystemBudgetsWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PLCloudPhotoLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v7);

}

- (BOOL)overrideSystemBudgetsForSyncSession:(BOOL)a3 pauseReason:(id)a4 forSystemBudgets:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  char v9;
  _QWORD v11[7];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v8 = a4;
  PLSAggregateDictionaryAddValueForScalarKey((uint64_t)CFSTR("com.apple.mobileslideshow.overrideBudgetCount"), 1);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__PLCloudPhotoLibraryManager_overrideSystemBudgetsForSyncSession_pauseReason_forSystemBudgets___block_invoke;
  v11[3] = &unk_1E3663618;
  v12 = v6;
  v11[5] = &v13;
  v11[6] = a5;
  v11[4] = self;
  -[PLCloudPhotoLibraryManager _runSyncOnIsolationQueueWithBlock:](self, "_runSyncOnIsolationQueueWithBlock:", v11);
  if (v6)
    -[PLCloudPhotoLibraryManager sendBudgetOverrideAnalytics:pauseReason:](self, "sendBudgetOverrideAnalytics:pauseReason:", *((unsigned __int8 *)v14 + 24), v8);
  v9 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v9;
}

- (void)sendBudgetOverrideAnalytics:(BOOL)a3 pauseReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[6];
  _QWORD v21[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v4 = a3;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__PLCloudPhotoLibraryManager_sendBudgetOverrideAnalytics_pauseReason___block_invoke;
  v21[3] = &unk_1E3673340;
  v21[4] = self;
  v21[5] = &v38;
  v21[6] = &v34;
  v21[7] = &v30;
  -[PLCloudPhotoLibraryManager _runSyncOnIsolationQueueWithBlock:](self, "_runSyncOnIsolationQueueWithBlock:", v21);
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "cloudPhotoLibraryManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __70__PLCloudPhotoLibraryManager_sendBudgetOverrideAnalytics_pauseReason___block_invoke_2;
  v20[3] = &unk_1E3662E58;
  v20[4] = &v26;
  v20[5] = &v22;
  objc_msgSend(v9, "getLibraryScopeStatusCountsForScopeWithIdentifier:completionHandler:", CFSTR("PrimarySync"), v20);

  if (v31[3])
  {
    v10 = v6;
    v11 = objc_alloc_init(MEMORY[0x1E0D731C0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D73B30];
    objc_msgSend(v11, "setPayloadValue:forKey:onEventWithName:", v12, *MEMORY[0x1E0D73B68], *MEMORY[0x1E0D73B30]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v39[3]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPayloadValue:forKey:onEventWithName:", v14, *MEMORY[0x1E0D73B50], v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35[3]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPayloadValue:forKey:onEventWithName:", v15, *MEMORY[0x1E0D73B58], v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31[3]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPayloadValue:forKey:onEventWithName:", v16, *MEMORY[0x1E0D73B48], v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27[3]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPayloadValue:forKey:onEventWithName:", v17, *MEMORY[0x1E0D73B40], v13);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23[3]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPayloadValue:forKey:onEventWithName:", v18, *MEMORY[0x1E0D73B38], v13);

    objc_msgSend(v11, "setPayloadValue:forKey:onEventWithName:", v10, *MEMORY[0x1E0D73B60], v13);
    PLBackendGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v43 = v11;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "SystemBudgets overriden metrics: %{public}@", buf, 0xCu);
    }

    objc_msgSend(v11, "publishEventWithName:", v13);
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

}

- (void)_downloadFromCloudInLibrary:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_signpost_id_t v21;
  uint8_t buf[16];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  PLCPLGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Download", "_downloadFromCloud", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _downloadFromCloudInLibrary:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_lastKnownCloudVersionInLibrary:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke;
  v16[3] = &unk_1E3662EA8;
  v16[4] = self;
  v17 = v9;
  v18 = v10;
  v19 = v4;
  v20 = v8;
  v21 = v6;
  v12 = v8;
  v13 = v4;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v11, "beginPullChangeSessionWithKnownLibraryVersion:completionHandler:", v14, v16);

}

- (void)_processDownloadBatchWithSession:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int64_t libraryMode;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  NSObject *v24;
  id v25;
  os_signpost_id_t v26;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  PLCPLGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "BatchDownload", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _processDownloadBatchWithSession:inLibrary:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postRunningProgress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isCancelled");

  if (v15)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v17 = objc_claimAutoreleasedReturnValue();
      }
      v18 = v17;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
      }

    }
    v19 = v11;
    v20 = v19;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v9, "BatchDownload", "Shutting Down", buf, 2u);
    }

  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke;
    v21[3] = &unk_1E3662F20;
    v21[4] = self;
    v22 = v12;
    v23 = v7;
    v24 = v11;
    v26 = v9;
    v25 = v6;
    objc_msgSend(v25, "getChangeBatchWithCompletionHandler:", v21);

  }
}

- (void)_markResourceObjectIDsAsPurgeable:(id)a3 urgency:(int64_t)a4 inLibrary:(id)a5
{
  id v8;
  id v9;
  int64_t libraryMode;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  PLCloudPhotoLibraryManager *v19;
  int64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v22 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Marking %lu resources as purgeable", buf, 0xCu);
    }

  }
  objc_msgSend(v9, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__PLCloudPhotoLibraryManager__markResourceObjectIDsAsPurgeable_urgency_inLibrary___block_invoke;
  v16[3] = &unk_1E3674F30;
  v17 = v8;
  v18 = v13;
  v19 = self;
  v20 = a4;
  v14 = v13;
  v15 = v8;
  objc_msgSend(v9, "performBlock:", v16);

}

- (void)libraryManagerStatusDidChange:(id)a3
{
  id v4;

  -[PLCloudPhotoLibraryManager cplStatus](self, "cplStatus", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager statusDidChange:](self, "statusDidChange:", v4);

}

- (void)libraryManagerDidChangeConfiguration:(id)a3
{
  id v4;

  -[PLCloudPhotoLibraryManager cplConfiguration](self, "cplConfiguration", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager configurationDidChange:](self, "configurationDidChange:", v4);

}

- (void)libraryManagerHasChangesToPull:(id)a3
{
  id v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", self->_state);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Notified for changes to pull, assetsd state is currently in %@", (uint8_t *)&v13, 0xCu);

    }
  }
  if ((PLIsAssetsd() & 1) != 0)
  {
    -[PLCloudPhotoLibraryManager sync](self, "sync");
  }
  else
  {
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "libraryBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetsdClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudInternalClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "syncCloudPhotoLibrary");

  }
}

- (void)libraryManagerHasStatusChanges:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int64_t libraryMode;
  NSObject *v8;
  uint8_t v9[8];
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  if (PLIsAssetsd())
  {
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager libraryManagerHasStatusChanges:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__PLCloudPhotoLibraryManager_libraryManagerHasStatusChanges___block_invoke;
    v10[3] = &unk_1E3677530;
    v10[4] = self;
    v11 = v4;
    v12 = v5;
    v6 = v5;
    -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v6, v10);

LABEL_12:
    goto LABEL_13;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Notified for record status change, but PLCloudPhotoLibrary is not running in assetsd", v9, 2u);
    }
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_getStatusChanges:(id)a3 transaction:(id)a4 notificationGeneration:(unint64_t)a5 inLibrary:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke;
  v16[3] = &unk_1E3662F88;
  v16[4] = self;
  v17 = v11;
  v19 = v10;
  v20 = a5;
  v18 = v12;
  v13 = v10;
  v14 = v12;
  v15 = v11;
  objc_msgSend(v13, "getChangedStatusesWithCompletionHandler:", v16);

}

- (void)libraryManager:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  int64_t libraryMode;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  Class v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[PLCloudPhotoLibraryManager _debugNameForState:](self, "_debugNameForState:", self->_state);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v11;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Requested to tentatively provide %@. assetsd state is currently in %@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager libraryManager:provideLocalResource:recordClass:completionHandler:]");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__PLCloudPhotoLibraryManager_libraryManager_provideLocalResource_recordClass_completionHandler___block_invoke;
  v20[3] = &unk_1E3662FD8;
  v20[4] = self;
  v21 = v11;
  v22 = v12;
  v23 = a5;
  v18 = v11;
  v19 = v12;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v17, v20);

}

- (void)libraryManager:(id)a3 pushAllChangesWithCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager libraryManager:pushAllChangesWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__PLCloudPhotoLibraryManager_libraryManager_pushAllChangesWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E3675C58;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v6, v8);

}

- (void)workerCoordinatorDidFinishAllSubmittedJobsOnBundle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager workerCoordinatorDidFinishAllSubmittedJobsOnBundle:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__PLCloudPhotoLibraryManager_workerCoordinatorDidFinishAllSubmittedJobsOnBundle___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v7);

}

- (void)sizeOfResourcesToUploadDidChangeForLibraryManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager sizeOfResourcesToUploadDidChangeForLibraryManager:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PLCloudPhotoLibraryManager_sizeOfResourcesToUploadDidChangeForLibraryManager___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v7);

}

- (void)libraryManager:(id)a3 downloadDidProgress:(float)a4 forResourceTransferTask:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  int64_t libraryMode;
  NSObject *v14;
  NSObject *v15;
  int v16;
  double v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(v7, "resource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager _identifierForResource:](self, "_identifierForResource:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isForeground");

  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v16 = 134218242;
      v17 = a4;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "downloadDidProgress %f forResourceTransferTask: %@", (uint8_t *)&v16, 0x16u);
    }

  }
  *(float *)&v12 = a4;
  -[PLCloudTaskManager reportProgress:forResourceIdentifier:highPriority:](self->_taskManager, "reportProgress:forResourceIdentifier:highPriority:", v9, v11, v12);

}

- (void)libraryManager:(id)a3 downloadDidStartForResourceTransferTask:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  int64_t libraryMode;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "resource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager _identifierForResource:](self, "_identifierForResource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isForeground");

  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEBUG, "downloadDidStartForResourceTransferTask: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  LODWORD(v10) = 0;
  -[PLCloudTaskManager reportProgress:forResourceIdentifier:highPriority:](self->_taskManager, "reportProgress:forResourceIdentifier:highPriority:", v7, v9, v10);

}

- (void)libraryManager:(id)a3 downloadDidFinishForResourceTransferTask:(id)a4 finalResource:(id)a5 withError:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  _BYTE *v14;
  int64_t libraryMode;
  NSObject *v16;
  NSObject *v17;
  int64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void (**v30)(_QWORD);
  void *v31;
  void *v32;
  void *v33;
  int64_t v34;
  NSObject *v35;
  void *v36;
  unsigned int v37;
  int64_t v38;
  NSObject *v39;
  NSObject *v40;
  char v41;
  int64_t v42;
  NSObject *v43;
  uint64_t v44;
  int64_t v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint32_t v52;
  NSObject *v53;
  unsigned int v54;
  char v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  void (**v60)(_QWORD);
  _QWORD v61[5];
  id v62;
  id v63;
  NSObject *v64;
  uint64_t v65;
  char v66;
  uint8_t buf[4];
  NSObject *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v68 = v11;
      v69 = 2112;
      v70 = v13;
      _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "downloadDidFinishForResourceTransferTask: %@, with error: %@", buf, 0x16u);
    }

  }
  if (!objc_msgSend(v13, "isCPLError") || objc_msgSend(v13, "code") != 10)
  {
    -[NSObject taskIdentifier](v11, "taskIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hash");

    kdebug_trace();
    v58 = v10;
    v56 = v12;
    if (v12)
    {
      v22 = v12;
    }
    else
    {
      -[NSObject resource](v11, "resource");
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v22;
    -[NSObject options](v11, "options");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isForeground");

    -[NSObject options](v11, "options");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v26, "hasValidTimeRange");

    -[PLCloudPhotoLibraryManager _identifierForResource:](self, "_identifierForResource:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __110__PLCloudPhotoLibraryManager_libraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke;
    v61[3] = &unk_1E36703C8;
    v65 = v21;
    v61[4] = self;
    v57 = v27;
    v62 = v57;
    v66 = v25;
    v28 = v13;
    v63 = v28;
    v29 = v23;
    v64 = v29;
    v30 = (void (**)(_QWORD))MEMORY[0x19AEC174C](v61);
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "databaseContext");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager libraryManager:downloadDidFinishForResourceTransferTask:finalResource:withError:]");

    if (v28)
    {
      v12 = v56;
      if (!*MEMORY[0x1E0D115D0])
      {
        v34 = self->_libraryMode;
        if (v34 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v35 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v34 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v35 = objc_claimAutoreleasedReturnValue();
        }
        v40 = v35;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v68 = v29;
          v69 = 2112;
          v70 = v28;
          _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "Failed to download resource %@. Error: %@", buf, 0x16u);
        }

      }
      if (objc_msgSend(v28, "code") == 27)
        v41 = v55;
      else
        v41 = 1;
      if ((v41 & 1) == 0)
        -[PLCloudPhotoLibraryManager _updateLocalStaleResourceWithCPLResource:inLibrary:](self, "_updateLocalStaleResourceWithCPLResource:inLibrary:", v29, v33);
      goto LABEL_44;
    }
    -[NSObject options](v11, "options");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isHighPriority");

    if (v29)
    {
      v54 = v37;
      v12 = v56;
      if ((v55 & 1) == 0)
      {
        v44 = MEMORY[0x1E0C809B0];
        if (!*MEMORY[0x1E0D115D0])
        {
          v45 = self->_libraryMode;
          if (v45 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v46 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v45 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v46 = objc_claimAutoreleasedReturnValue();
          }
          v53 = v46;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v68 = v29;
            v69 = 1024;
            LODWORD(v70) = v54;
            _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_DEBUG, "Update local state of resource %@, highPriority: %d", buf, 0x12u);
          }

        }
        v59[0] = v44;
        v59[1] = 3221225472;
        v59[2] = __110__PLCloudPhotoLibraryManager_libraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_381;
        v59[3] = &unk_1E3676CD8;
        v60 = v30;
        -[PLCloudPhotoLibraryManager _updateWithCPLResource:isHighPriority:inLibrary:completionHandler:](self, "_updateWithCPLResource:isHighPriority:inLibrary:completionHandler:", v29, v54, v33, v59);

        goto LABEL_76;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        v38 = self->_libraryMode;
        if (v38 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v39 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v38 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v39 = objc_claimAutoreleasedReturnValue();
        }
        v48 = v39;
        if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          goto LABEL_68;
        *(_DWORD *)buf = 138412546;
        v68 = v29;
        v69 = 1024;
        LODWORD(v70) = v54;
        v49 = "Skip updating local state of time ranged video resource %@, highPriority: %d";
        v50 = v48;
        v51 = OS_LOG_TYPE_DEBUG;
        v52 = 18;
LABEL_67:
        _os_log_impl(&dword_199541000, v50, v51, v49, buf, v52);
LABEL_68:

      }
    }
    else
    {
      v12 = v56;
      if (!*MEMORY[0x1E0D115D0])
      {
        v42 = self->_libraryMode;
        if (v42 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v43 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v42 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v43 = objc_claimAutoreleasedReturnValue();
        }
        v48 = v43;
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          goto LABEL_68;
        *(_DWORD *)buf = 138412290;
        v68 = v11;
        v49 = "resource transfer task %@ finished for unknown asset";
        v50 = v48;
        v51 = OS_LOG_TYPE_ERROR;
        v52 = 12;
        goto LABEL_67;
      }
    }
LABEL_44:
    v30[2](v30);
LABEL_76:

    v10 = v58;
LABEL_77:

    goto LABEL_78;
  }
  if (!*v14)
  {
    v18 = self->_libraryMode;
    if (v18 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v18 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v29 = v19;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[NSObject resource](v11, "resource");
      v47 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v68 = v47;
      _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEBUG, "resource %@ will be downloaded in background, skip reporting its completion", buf, 0xCu);

    }
    goto LABEL_77;
  }
LABEL_78:

}

- (void)libraryManager:(id)a3 backgroundDownloadDidFinishForResource:(id)a4
{
  id v6;
  id v7;
  int64_t libraryMode;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  PLCloudPhotoLibraryManager *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "Finished low priority download for resource: %@", buf, 0xCu);
    }

  }
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager libraryManager:backgroundDownloadDidFinishForResource:]");

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __84__PLCloudPhotoLibraryManager_libraryManager_backgroundDownloadDidFinishForResource___block_invoke;
  v16[3] = &unk_1E3677530;
  v17 = v7;
  v18 = v13;
  v19 = self;
  v14 = v13;
  v15 = v7;
  objc_msgSend(v14, "performBlock:", v16);

}

- (void)libraryManager:(id)a3 backgroundDownloadDidFailForResource:(id)a4
{
  id v6;
  id v7;
  int64_t libraryMode;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "backgroundDownloadDidFailForResource: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D11268], 26, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudPhotoLibraryManager _identifierForResource:](self, "_identifierForResource:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLCloudTaskManager reportCompletionForResourceIdentifier:highPriority:withError:](self->_taskManager, "reportCompletionForResourceIdentifier:highPriority:withError:", v12, 0, v11);

}

- (void)libraryManager:(id)a3 uploadDidStartForResourceTransferTask:(id)a4
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, 0, 0);
}

- (void)libraryManager:(id)a3 uploadDidFinishForResourceTransferTask:(id)a4 withError:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a5;
  objc_msgSend(a4, "resource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager libraryManager:uploadDidFinishForResourceTransferTask:withError:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke;
  v12[3] = &unk_1E3677530;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v9, v12);

}

- (void)libraryManager:(id)a3 uploadDidProgress:(float)a4 forResourceTransferTask:(id)a5
{
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PLCloudPhotoLibraryManager *v12;
  float v13;

  objc_msgSend(a5, "resource", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager libraryManager:uploadDidProgress:forResourceTransferTask:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PLCloudPhotoLibraryManager_libraryManager_uploadDidProgress_forResourceTransferTask___block_invoke;
  v10[3] = &unk_1E3663020;
  v11 = v7;
  v12 = self;
  v13 = a4;
  v9 = v7;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v8, v10);

}

- (void)libraryManager:(id)a3 inMemoryDownloadDidFinishForResourceTransferTask:(id)a4 data:(id)a5 withError:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a5;
  v10 = a6;
  objc_msgSend(a4, "resource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager libraryManager:inMemoryDownloadDidFinishForResourceTransferTask:data:withError:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __109__PLCloudPhotoLibraryManager_libraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke;
  v16[3] = &unk_1E3677998;
  v16[4] = self;
  v17 = v11;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v12, v16);

}

- (void)libraryManager:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager libraryManager:providePayloadForComputeStates:inFolderWithURL:completionHandler:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", objc_msgSend(v9, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke;
  v24[3] = &unk_1E366C620;
  v24[4] = self;
  v25 = v9;
  v26 = v14;
  v27 = v16;
  v28 = v10;
  v29 = v13;
  v30 = v15;
  v31 = v11;
  v17 = v11;
  v18 = v15;
  v19 = v13;
  v20 = v10;
  v21 = v16;
  v22 = v14;
  v23 = v9;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v12, v24);

}

- (BOOL)_isAssetsdNotReadyToAnswer
{
  return (self->_state < 8) & (0x83u >> self->_state);
}

- (void)_linkFileFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  _BYTE *v11;
  id v12;
  int64_t libraryMode;
  NSObject *v14;
  NSObject *v15;
  int64_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  int64_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);
  v11 = (_BYTE *)MEMORY[0x1E0D115D0];
  if ((v10 & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v9;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEBUG, "Creating destination path = %@", buf, 0xCu);
      }

    }
    v24 = 0;
    objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v24);
    v12 = v24;
  }
  if (!*v11)
  {
    v16 = self->_libraryMode;
    if (v16 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Linking old thumb in %@ to new location in %@", buf, 0x16u);
    }

  }
  v23 = v12;
  objc_msgSend(v8, "linkItemAtPath:toPath:error:", v6, v7, &v23);
  v19 = v23;

  if (v19 && !*v11)
  {
    v20 = self->_libraryMode;
    if (v20 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v20 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v26 = v6;
      v27 = 2112;
      v28 = v7;
      _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Unable to link file from '%@' to '%@'", buf, 0x16u);
    }

  }
}

- (CGSize)_targetSizeForInputSize:(CGSize)a3 maxPixelSize:(unint64_t)a4
{
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  CGSize result;

  v4 = 1.0;
  if (a3.height * a3.width > (double)a4)
    v4 = sqrt((double)a4 / (a3.height * a3.width));
  v5 = a3.width * v4;
  v6 = roundf(v5);
  v7 = a3.height * v4;
  v8 = roundf(v7);
  result.height = v8;
  result.width = v6;
  return result;
}

- (void)_updateLocalStaleResourceWithCPLResource:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke;
  v10[3] = &unk_1E3677530;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v8, "performBlock:", v10);

}

- (void)_updateWithCPLResource:(id)a3 isHighPriority:(BOOL)a4 inLibrary:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  PLCloudPhotoLibraryManager *v16;
  id v17;
  BOOL v18;

  v10 = a3;
  v11 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__PLCloudPhotoLibraryManager__updateWithCPLResource_isHighPriority_inLibrary_completionHandler___block_invoke;
  v14[3] = &unk_1E36752E0;
  v15 = v10;
  v16 = self;
  v17 = v11;
  v18 = a4;
  v12 = v11;
  v13 = v10;
  objc_msgSend(v12, "performTransaction:completionHandler:", v14, a6);

}

- (signed)_placeHolderKindFromCPLResourceType:(unint64_t)a3
{
  unint64_t v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3 - 1;
  if (a3 - 1 < 0x1C && ((0x9C3C07Fu >> v4) & 1) != 0)
    return word_199B9B490[v4];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Unsupported media resource type %@ to download", (uint8_t *)&v11, 0xCu);

    }
  }
  return 0;
}

- (void)_updateThumbnailDataForAsset:(id)a3 withImageFileURL:(id)a4
{
  id v6;
  id v7;
  const __CFData *v8;
  uint64_t v9;
  NSObject *v10;
  const __CFDictionary *v11;
  int64_t v12;
  NSObject *v13;
  CGImageSourceRef v14;
  CGImageSource *v15;
  const __CFDictionary *v16;
  CFDictionaryRef v17;
  int64_t libraryMode;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 1, 0);
  v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (-[__CFData length](v8, "length"))
  {
    objc_msgSend(v6, "uniformTypeIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v22 = *MEMORY[0x1E0CBD2A8];
      v23 = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v14 = CGImageSourceCreateWithData(v8, v11);
    if (v14)
    {
      v15 = v14;
      v20 = *MEMORY[0x1E0CBD140];
      v21 = *MEMORY[0x1E0C9AE50];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      v17 = CGImageSourceCopyPropertiesAtIndex(v15, 0, v16);
      objc_msgSend(v6, "setThumbnailDataFromImageProperties:", v17);
      CFRelease(v15);

    }
    else
    {
      if (*MEMORY[0x1E0D115D0])
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      libraryMode = self->_libraryMode;
      if (libraryMode == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (libraryMode == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v16 = (const __CFDictionary *)v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v7;
        _os_log_impl(&dword_199541000, (os_log_t)v16, OS_LOG_TYPE_ERROR, "Unable to create image source for '%@'.", buf, 0xCu);
      }
    }

    goto LABEL_26;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v12 = self->_libraryMode;
    if (v12 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v7;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Unable to read imageData from file '%@'.", buf, 0xCu);
    }
    goto LABEL_27;
  }
LABEL_28:

}

- (void)_updateAsset:(id)a3 withImageFileURL:(id)a4
{
  id v6;
  id v7;
  const __CFData *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const __CFDictionary *v13;
  int64_t v14;
  NSObject *v15;
  CGImageSourceRef v16;
  CGImageSourceRef v17;
  int64_t libraryMode;
  NSObject *v19;
  int64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 1, 0);
  v8 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  if (-[__CFData length](v8, "length"))
  {
    v9 = (void *)MEMORY[0x1E0D752F0];
    objc_msgSend(v7, "pathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "typeWithFilenameExtension:conformingToType:", v10, *MEMORY[0x1E0CEC520]);
    v11 = objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v29 = *MEMORY[0x1E0CBD2A8];
      -[NSObject identifier](v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = 0;
    }
    v16 = CGImageSourceCreateWithData(v8, v13);
    if (v16)
    {
      v17 = v16;
      objc_msgSend(v6, "generateAndUpdateThumbnailsWithPreviewImage:thumbnailImage:fromImageSource:imageData:forceSRGBConversion:", 0, 0, v16, v8, 0);
      if (!*MEMORY[0x1E0D115D0])
      {
        libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (libraryMode == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
        }
        v22 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v25 = 138412546;
          v26 = v6;
          v27 = 2112;
          v28 = v7;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEBUG, "Generated new thumbnail for asset %@ with %@", (uint8_t *)&v25, 0x16u);
        }

      }
      CFRelease(v17);
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v20 = self->_libraryMode;
      if (v20 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v20 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v23 = v21;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v7, "path");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138412290;
        v26 = v24;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Unable to create image source for '%@'.", (uint8_t *)&v25, 0xCu);

      }
    }

LABEL_37:
    goto LABEL_38;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v14 = self->_libraryMode;
    if (v14 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v11 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v25 = 138412290;
      v26 = v7;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Unable to read imageData from file '%@'.", (uint8_t *)&v25, 0xCu);
    }
    goto LABEL_37;
  }
LABEL_38:

}

- (void)_cameraChangedStateToForeground:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _cameraChangedStateToForeground:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__PLCloudPhotoLibraryManager__cameraChangedStateToForeground___block_invoke;
  v6[3] = &unk_1E36762F8;
  v6[4] = self;
  v7 = a3;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v6);

}

- (void)_appWithBundleIdentifier:(id)a3 changedStateToForeground:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  BOOL v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _appWithBundleIdentifier:changedStateToForeground:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__PLCloudPhotoLibraryManager__appWithBundleIdentifier_changedStateToForeground___block_invoke;
  v9[3] = &unk_1E3675C80;
  v11 = a4;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v7, v9);

}

- (BOOL)_isPausedForDownloadRequestHighPriority:(BOOL)a3
{
  return !a3 && self->_state == 8;
}

- (void)getCPLStateForDebug:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PLCloudPhotoLibraryManager_getCPLStateForDebug_completionHandler___block_invoke;
  v8[3] = &unk_1E3673368;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", 0, v8);

}

- (id)cplStatus
{
  PLCloudPhotoLibraryManager *v2;
  CPLStatus *v3;
  BOOL v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_unsafe_cplStatus;
  objc_sync_exit(v2);

  if (v3)
    v4 = 0;
  else
    v4 = *MEMORY[0x1E0D115D0] == 0;
  if (v4)
  {
    libraryMode = v2->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager cplStatus is nil", v9, 2u);
    }

  }
  return v3;
}

- (void)setCPLStatus:(id)a3
{
  CPLStatus *v4;
  PLCloudPhotoLibraryManager *v5;
  int64_t libraryMode;
  NSObject *v7;
  NSObject *v8;
  CPLStatus *unsafe_cplStatus;
  int v10;
  CPLStatus *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (CPLStatus *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = v5->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = v4;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager setting cplStatus to %p", (uint8_t *)&v10, 0xCu);
    }

  }
  unsafe_cplStatus = v5->_unsafe_cplStatus;
  v5->_unsafe_cplStatus = v4;

  objc_sync_exit(v5);
}

- (id)cplConfiguration
{
  PLCloudPhotoLibraryManager *v2;
  CPLConfiguration *v3;
  BOOL v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_cplConfiguration;
  objc_sync_exit(v2);

  if (v3)
    v4 = 0;
  else
    v4 = *MEMORY[0x1E0D115D0] == 0;
  if (v4)
  {
    libraryMode = v2->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager cplConfiguration is nil", v9, 2u);
    }

  }
  return v3;
}

- (void)setCPLConfiguration:(id)a3
{
  CPLConfiguration *v4;
  PLCloudPhotoLibraryManager *v5;
  int64_t libraryMode;
  NSObject *v7;
  NSObject *v8;
  CPLConfiguration *cplConfiguration;
  int v10;
  CPLConfiguration *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (CPLConfiguration *)a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = v5->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = v4;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "PLCloudPhotoLibraryManager setting cplConfiguration to %p", (uint8_t *)&v10, 0xCu);
    }

  }
  cplConfiguration = v5->_cplConfiguration;
  v5->_cplConfiguration = v4;

  objc_sync_exit(v5);
}

- (void)cplConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PLCloudPhotoLibraryManager_cplConfigurationWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E3675C58;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", 0, v6);

}

- (BOOL)isReadyForAnalysis
{
  PLCloudPhotoLibraryManager *v2;
  BOOL unsafe_readyForAnalysis;

  v2 = self;
  objc_sync_enter(v2);
  unsafe_readyForAnalysis = v2->_unsafe_readyForAnalysis;
  objc_sync_exit(v2);

  return unsafe_readyForAnalysis;
}

- (void)_setReadyForAnalysisWithCPLStatus:(id)a3
{
  PLCloudPhotoLibraryManager *v4;
  char v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (char)v6;
  if (v6)
  {
    if ((objc_msgSend(v6, "hasFinishedInitialDownload") & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(v6, "isExceedingQuota");
  }
  v4->_unsafe_readyForAnalysis = v5;
  objc_sync_exit(v4);

  if (v4->_unsafe_readyForAnalysis)
    -[PLCloudPhotoLibraryManager _enableOpportunisticTasks](v4, "_enableOpportunisticTasks");

}

- (void)_enableOpportunisticTasks
{
  void *v3;
  void *v4;
  void *v5;
  int64_t libraryMode;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  if (self->_opportunisticTasksWasDisabled)
  {
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "databaseContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager _enableOpportunisticTasks]");

    if (v5)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (libraryMode == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v7 = objc_claimAutoreleasedReturnValue();
        }
        v10 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Enabling opportunistic tasks after CPL initial sync", buf, 2u);
        }

      }
      objc_msgSend(v5, "enableOpportunisticTasks");
      self->_opportunisticTasksWasDisabled = 0;
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v8 = self->_libraryMode;
      if (v8 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v11 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to enable opportunistic tasks. Unable to access photolibrary", v12, 2u);
      }

    }
  }
}

- (void)_disableOpportunisticTasks
{
  void *v3;
  void *v4;
  void *v5;
  int64_t libraryMode;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  if (!self->_opportunisticTasksWasDisabled)
  {
    -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "databaseContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager _disableOpportunisticTasks]");

    if (v5)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (libraryMode == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v7 = objc_claimAutoreleasedReturnValue();
        }
        v8 = v7;
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Disabling opportunistic tasks before CPL initial sync", v9, 2u);
        }

      }
      objc_msgSend(v5, "disableOpportunisticTasks");
      self->_opportunisticTasksWasDisabled = 1;
    }

  }
}

- (void)clearPrefetchState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__PLCloudPhotoLibraryManager_clearPrefetchState__block_invoke;
  v2[3] = &unk_1E3677AA0;
  v2[4] = self;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", 0, v2);
}

- (void)_updateTransferCountsInLibrary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _updateTransferCountsInLibrary:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PLCloudPhotoLibraryManager__updateTransferCountsInLibrary___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v7);

}

- (void)_notifyCPLStatus:(id)a3 didChange:(BOOL)a4 andCPLConfiguration:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id WeakRetained;
  void *v12;
  int v13;
  BOOL v14;
  int64_t v15;
  NSObject *v16;
  int64_t libraryMode;
  NSObject *v18;
  NSObject *v19;
  int64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  objc_msgSend(v8, "initialSyncDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_libraryServicesManager);
  objc_msgSend(WeakRetained, "computeCacheManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v12, "notifyCPLConfiguration:", v9);
  v13 = objc_msgSend(v8, "hasFinishedInitialDownload");
  v14 = v13;
  if (self->_hasCompletedInitialDownload || !v13)
  {
    if (objc_msgSend(v8, "isExceedingQuota") && v12)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        libraryMode = self->_libraryMode;
        if (libraryMode == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (libraryMode == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
        }
        v22 = v18;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Notifying compute cache to restore because library is over quota", (uint8_t *)&v27, 2u);
        }

      }
      objc_msgSend(v12, "notifyReadyToRestoreWithInitialSyncDate:", v10);
    }
  }
  else
  {
    if (v12)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v15 = self->_libraryMode;
        if (v15 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v19 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Notifying compute cache to restore because initial sync date was initially set", (uint8_t *)&v27, 2u);
        }

      }
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v12, "notifyReadyToRestoreWithInitialSyncDate:", v10);
    }
    if (v6
      && -[PLCloudPhotoLibraryManager _shouldResetICloudBackupExclusionPaths](self, "_shouldResetICloudBackupExclusionPaths"))
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v20 = self->_libraryMode;
        if (v20 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v20 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v23 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "libraryURL");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 138412290;
          v28 = v25;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Setting iCPL-enabled exclusion flags on App Library because initial sync date was initially set: %@", (uint8_t *)&v27, 0xCu);

        }
      }
      -[PLCloudPhotoLibraryManager pathManager](self, "pathManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "resetBackupExclusionPathsForBackupType:", 3);

    }
  }
  self->_hasCompletedInitialDownload = v14;

}

- (unint64_t)_inq_numberOfOtherItemsToUploadInLibrary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  int64_t libraryMode;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t boundForUploadingOtherItems;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfOtherItemsToUpload");

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = v15[3];
      *(_DWORD *)buf = 67109376;
      v19 = v11;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "_inq_numberOfOtherItemsToUpload assetsdCount: %d, cplCount: %d", buf, 0xEu);
    }

  }
  if (v15[3] + v6 >= self->_boundForUploadingOtherItems)
    boundForUploadingOtherItems = self->_boundForUploadingOtherItems;
  else
    boundForUploadingOtherItems = v15[3] + v6;

  _Block_object_dispose(&v14, 8);
  return boundForUploadingOtherItems;
}

- (unint64_t)_inq_numberOfPhotosToUploadInLibrary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  int64_t libraryMode;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t boundForUploadingPhotos;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfImagesToUpload");

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = v15[3];
      *(_DWORD *)buf = 67109376;
      v19 = v11;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "_inq_numberOfPhotosToUpload assetsdCount: %d, cplCount: %d", buf, 0xEu);
    }

  }
  if (v15[3] + v6 >= self->_boundForUploadingPhotos)
    boundForUploadingPhotos = self->_boundForUploadingPhotos;
  else
    boundForUploadingPhotos = v15[3] + v6;

  _Block_object_dispose(&v14, 8);
  return boundForUploadingPhotos;
}

- (unint64_t)_inq_numberOfVideosToUploadInLibrary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  int64_t libraryMode;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t boundForUploadingVideos;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  -[PLCloudPhotoLibraryManager cplLibrary](self, "cplLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfVideosToUpload");

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v7 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = v15[3];
      *(_DWORD *)buf = 67109376;
      v19 = v11;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEBUG, "_inq_numberOfVideosToUpload assetsdCount: %d, cplCount: %d", buf, 0xEu);
    }

  }
  if (v15[3] + v6 >= self->_boundForUploadingVideos)
    boundForUploadingVideos = self->_boundForUploadingVideos;
  else
    boundForUploadingVideos = v15[3] + v6;

  _Block_object_dispose(&v14, 8);
  return boundForUploadingVideos;
}

- (unint64_t)_inq_numberOfPhotosToDownloadInLibrary:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int64_t libraryMode;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v5 = -[PLCloudPhotoLibraryManager _inq_numberOfPhotosToUploadInLibrary:](self, "_inq_numberOfPhotosToUploadInLibrary:", v4);
  -[PLCloudPhotoLibraryManager cplStatus](self, "cplStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudAssetCountPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = v19[3];
      *(_DWORD *)buf = 67109632;
      v23 = v10;
      v24 = 1024;
      v25 = v15;
      v26 = 1024;
      v27 = v5;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "_inq_numberOfPhotosToDownload serverPhotoCount: %d, localCount: %d, uploadCount: %d", buf, 0x14u);
    }

  }
  v16 = v19[3];

  _Block_object_dispose(&v18, 8);
  return (v10 - (v5 + v16)) & ~((uint64_t)(v10 - (v5 + v16)) >> 63);
}

- (unint64_t)_inq_numberOfVideosToDownloadInLibrary:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int64_t libraryMode;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v5 = -[PLCloudPhotoLibraryManager _inq_numberOfVideosToUploadInLibrary:](self, "_inq_numberOfVideosToUploadInLibrary:", v4);
  -[PLCloudPhotoLibraryManager cplStatus](self, "cplStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudAssetCountPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v15 = v19[3];
      *(_DWORD *)buf = 67109632;
      v23 = v10;
      v24 = 1024;
      v25 = v15;
      v26 = 1024;
      v27 = v5;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEBUG, "_inq_numberOfVideosToDownload serverCount: %d, localCount: %d, uploadCount: %d", buf, 0x14u);
    }

  }
  v16 = v19[3];

  _Block_object_dispose(&v18, 8);
  return (v10 - (v5 + v16)) & ~((uint64_t)(v10 - (v5 + v16)) >> 63);
}

- (unint64_t)_inq_numberOfOtherItemsToDownloadInLibrary:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;
  int64_t libraryMode;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v5 = -[PLCloudPhotoLibraryManager _inq_numberOfOtherItemsToUploadInLibrary:](self, "_inq_numberOfOtherItemsToUploadInLibrary:", v4);
  -[PLCloudPhotoLibraryManager cplStatus](self, "cplStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudAssetCountPerType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke;
  v21[3] = &unk_1E36630B8;
  v21[4] = &v22;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v21);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v8 = v4;
  PLRunWithUnfairLock();
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = v23[3];
      v13 = v18[3];
      *(_DWORD *)buf = 67109632;
      v27 = v12;
      v28 = 1024;
      v29 = v13;
      v30 = 1024;
      v31 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "_inq_numberOfOtherItemsToDownload serverCount: %d, localCount: %d, uploadCount: %d", buf, 0x14u);
    }

  }
  v14 = v23[3];
  v15 = v18[3];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v22, 8);

  return (v14 - (v5 + v15)) & ~((uint64_t)(v14 - (v5 + v15)) >> 63);
}

- (unint64_t)totalNumberOfUnpushedMasters
{
  return -[PLCloudPhotoLibraryUploadTracker totalNumberOfUnpushedMasters](self->_uploadTracker, "totalNumberOfUnpushedMasters");
}

- (unint64_t)totalNumberOfUploadedMasters
{
  return -[PLCloudPhotoLibraryUploadTracker totalNumberOfUploadedMasters](self->_uploadTracker, "totalNumberOfUploadedMasters");
}

- (unint64_t)totalSizeOfUnpushedOriginals
{
  return -[PLCloudPhotoLibraryUploadTracker totalSizeOfUnpushedOriginals](self->_uploadTracker, "totalSizeOfUnpushedOriginals");
}

- (unint64_t)totalUploadedOriginalSize
{
  return -[PLCloudPhotoLibraryUploadTracker totalUploadedOriginalSize](self->_uploadTracker, "totalUploadedOriginalSize");
}

- (unint64_t)totalNumberOfDeferredAssets
{
  return -[PLCloudPhotoLibraryUploadTracker totalNumberOfDeferredAssets](self->_uploadTracker, "totalNumberOfDeferredAssets");
}

- ($3CC19D079FD0B010EE84973AA846B91B)currentTransferProgress
{
  $3CC19D079FD0B010EE84973AA846B91B *result;

  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = ($3CC19D079FD0B010EE84973AA846B91B *)self->_uploadTracker;
  if (result)
    return ($3CC19D079FD0B010EE84973AA846B91B *)-[$3CC19D079FD0B010EE84973AA846B91B currentTransferProgress](result, "currentTransferProgress");
  return result;
}

- (int64_t)currentResetSyncType
{
  return self->_pendingResetSyncType;
}

- (void)endUserSessionWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLCloudBatchUploader setShouldGenerateDerivatives:](self->_uploader, "setShouldGenerateDerivatives:", 0);
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager endUserSessionWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PLCloudPhotoLibraryManager_endUserSessionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v7);

}

- (void)_startWorkInProgressTimer
{
  _BYTE *v3;
  int64_t libraryMode;
  NSObject *v5;
  NSObject *v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  OS_dispatch_source *workInProgressTimer;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[16];

  v3 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Camera still has work, assetsd is idle", buf, 2u);
    }

  }
  if (!self->_workInProgressTimer)
  {
    if (!*v3)
    {
      v7 = self->_libraryMode;
      if (v7 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v7 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Setting up work in progress timer", buf, 2u);
      }

    }
    v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_isolationQueue);
    pl_dispatch_source_set_event_handler();
    v10 = dispatch_time(0, 2000000000);
    dispatch_source_set_timer(v13, v10, 0x77359400uLL, 0);
    workInProgressTimer = self->_workInProgressTimer;
    self->_workInProgressTimer = (OS_dispatch_source *)v13;
    v12 = v13;

    dispatch_resume((dispatch_object_t)self->_workInProgressTimer);
  }
}

- (void)_stopWorkInProgressTimer
{
  NSObject *workInProgressTimer;
  OS_dispatch_source *v4;

  workInProgressTimer = self->_workInProgressTimer;
  if (workInProgressTimer)
  {
    dispatch_source_cancel(workInProgressTimer);
    v4 = self->_workInProgressTimer;
    self->_workInProgressTimer = 0;

  }
}

- (void)_checkForWorkInProgress
{
  _BYTE *v3;
  int64_t libraryMode;
  NSObject *v5;
  NSObject *v6;
  int64_t v7;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "checking workInProgress", buf, 2u);
    }

  }
  if (-[PLCloudPhotoLibraryManager _hasIncomingWorkFileMarker](self, "_hasIncomingWorkFileMarker"))
  {
    if (!*v3)
    {
      v7 = self->_libraryMode;
      if (v7 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v7 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v11 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Camera work is not yet finished, retrying later", v18, 2u);
      }

    }
  }
  else
  {
    if (!*v3)
    {
      v9 = self->_libraryMode;
      if (v9 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v12 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Camera work is finished, try to log out", v20, 2u);
      }

    }
    if (self->_state == 6)
    {
      if (!*v3)
      {
        v13 = self->_libraryMode;
        if (v13 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v13 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v15 = v14;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "assetd is idle, try to log out", v19, 2u);
        }

      }
      -[PLCloudPhotoLibraryManager _idleStateTransitionOneTimeAction](self, "_idleStateTransitionOneTimeAction");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        (*(void (**)(uint64_t))(v16 + 16))(v16);

    }
    -[PLCloudPhotoLibraryManager _stopWorkInProgressTimer](self, "_stopWorkInProgressTimer");
  }
}

- (BOOL)_hasAvalancheIncomingWork
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D73148], "incomingDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtPath:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = *MEMORY[0x1E0D74A58];
  while (1)
  {
    objc_msgSend(v4, "nextObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      break;
    objc_msgSend(v7, "pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    v5 = v7;
    v10 = v7;
    if (v9)
      goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v7 != 0;
}

- (BOOL)_hasIncomingWorkFileMarker
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73138], "takingPhotoIndicatorFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73138], "takingVideoIndicatorFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73138], "nebuladkeepalivepath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v3, "fileExistsAtPath:", v4) & 1) != 0
    || (objc_msgSend(v3, "fileExistsAtPath:", v5) & 1) != 0
    || (objc_msgSend(v3, "fileExistsAtPath:", v6) & 1) != 0
    || -[PLCloudPhotoLibraryManager _hasAvalancheIncomingWork](self, "_hasAvalancheIncomingWork");

  return v7;
}

- (void)_setToDownloadCountsForImages:(unint64_t)a3 videos:(unint64_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *serialQueue;
  id v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  unint64_t v19;
  unint64_t v20;

  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLCloudPhotoLibraryManager.m"), 5192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsAssetsd()"));

  }
  -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indicatorFileCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _setToDownloadCountsForImages:videos:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PLCloudPhotoLibraryManager__setToDownloadCountsForImages_videos___block_invoke;
  block[3] = &unk_1E36753D0;
  v19 = a3;
  v20 = a4;
  v17 = v10;
  v18 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(serialQueue, block);

}

- (void)statusDidChange:(id)a3
{
  id v4;
  int64_t libraryMode;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    libraryMode = self->_libraryMode;
    if (libraryMode == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (libraryMode == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "statusDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v14 = "-[PLCloudPhotoLibraryManager statusDidChange:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager statusDidChange:]");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__PLCloudPhotoLibraryManager_statusDidChange___block_invoke;
  v11[3] = &unk_1E3677C18;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v9, v11);

}

- (void)configurationDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager configurationDidChange:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PLCloudPhotoLibraryManager_configurationDidChange___block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v7);

}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager activateScopeWithIdentifier:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PLCloudPhotoLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager deactivateScopeWithIdentifier:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__PLCloudPhotoLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)startExitFromLibraryScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;

  v10 = a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager startExitFromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __115__PLCloudPhotoLibraryManager_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v16[3] = &unk_1E366DEB0;
  v16[4] = self;
  v17 = v10;
  v20 = a4;
  v21 = a5;
  v18 = v12;
  v19 = v11;
  v13 = v12;
  v14 = v10;
  v15 = v11;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v13, v16);

}

- (void)removeParticipantsWithParticipantUUIDs:(id)a3 fromLibraryScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke;
  v20[3] = &unk_1E3663130;
  v20[4] = self;
  v21 = v12;
  v24 = v14;
  v25 = a5;
  v26 = a6;
  v22 = v13;
  v23 = v15;
  v16 = v15;
  v17 = v13;
  v18 = v12;
  v19 = v14;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v16, v20);

}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager sharedLibraryRampCheckWithCompletionHandler:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PLCloudPhotoLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3675C58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v5, v7);

}

- (void)publishLibraryScopeWithCPLShare:(id)a3 title:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager publishLibraryScopeWithCPLShare:title:completionHandler:]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__PLCloudPhotoLibraryManager_publishLibraryScopeWithCPLShare_title_completionHandler___block_invoke;
  v16[3] = &unk_1E3676240;
  v19 = v11;
  v20 = v10;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v12 = v11;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v12, v16);

}

- (void)updateLibraryScopeWithCPLScopeChange:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager updateLibraryScopeWithCPLScopeChange:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__PLCloudPhotoLibraryManager_updateLibraryScopeWithCPLScopeChange_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)refreshLibraryScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager refreshLibraryScopeWithIdentifier:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__PLCloudPhotoLibraryManager_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)getLibraryScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager getLibraryScopeStatusCountsForScopeWithIdentifier:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __98__PLCloudPhotoLibraryManager_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)_getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  unint64_t v18;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager _getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __116__PLCloudPhotoLibraryManager__getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke;
  v14[3] = &unk_1E3674F58;
  v14[4] = self;
  v15 = v8;
  v17 = v9;
  v18 = a4;
  v16 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v11, v14);

}

- (void)_finishedUnsharingPendingAssetsSharedToScopeWithTransaction:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __96__PLCloudPhotoLibraryManager__finishedUnsharingPendingAssetsSharedToScopeWithTransaction_error___block_invoke;
  v8[3] = &unk_1E3677C18;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", a3, v8);

}

- (void)_unshareBatchOfPendingAssetsSharedToScopeWithTransaction:(id)a3
{
  id v4;
  NSString *v5;
  id v6;
  NSString *v7;
  _QWORD v8[5];
  NSString *v9;
  id v10;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v5 = self->_scopeIdentifierToUnsharePendingAssetsFrom;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke;
  v8[3] = &unk_1E3663180;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[PLCloudPhotoLibraryManager _getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:](self, "_getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:", v7, 100, v8);

}

- (void)startUnsharingPendingAssetsSharedToScopeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager startUnsharingPendingAssetsSharedToScopeWithIdentifier:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__PLCloudPhotoLibraryManager_startUnsharingPendingAssetsSharedToScopeWithIdentifier___block_invoke;
  v8[3] = &unk_1E3677530;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v6, v8);

}

- (void)_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *deviceLibraryConfigurationChangeCompletionHandlers;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_isolationQueue);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_deviceLibraryConfigurationChangeCompletionHandlers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  deviceLibraryConfigurationChangeCompletionHandlers = self->_deviceLibraryConfigurationChangeCompletionHandlers;
  self->_deviceLibraryConfigurationChangeCompletionHandlers = 0;

}

- (void)requestDeviceLibraryConfigurationChange:(int64_t)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  int64_t v17;
  _QWORD v18[5];
  id v19;
  int64_t v20;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager requestDeviceLibraryConfigurationChange:completionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke;
  v18[3] = &unk_1E3677C40;
  v18[4] = self;
  v9 = v7;
  v19 = v9;
  v20 = a3;
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_430;
  v13[3] = &unk_1E36631D0;
  v16 = (id)MEMORY[0x19AEC174C](v18);
  v17 = a3;
  v13[4] = self;
  v14 = v9;
  v15 = v6;
  v10 = v16;
  v11 = v9;
  v12 = v6;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v11, v13);

}

- (void)performTransactionOnLibraryScopeSynchronizationQueue:(id)a3
{
  dispatch_sync((dispatch_queue_t)self->_libraryScopeSynchronizationQueue, a3);
}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 onDemand:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager fetchComputeStatesForRecordsWithScopedIdentifiers:onDemand:completionHandler:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __107__PLCloudPhotoLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_onDemand_completionHandler___block_invoke;
  v13[3] = &unk_1E36755F8;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  -[PLCloudPhotoLibraryManager _runAsyncOnIsolationQueueWithTransaction:block:](self, "_runAsyncOnIsolationQueueWithTransaction:block:", v10, v13);

}

- (void)publishCPLScopeChange:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager publishCPLScopeChange:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PLCloudPhotoLibraryManager_publishCPLScopeChange_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v6;
  v11 = v7;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)fetchShareFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager fetchShareFromShareURL:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PLCloudPhotoLibraryManager_fetchShareFromShareURL_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)acceptCPLShare:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager acceptCPLShare:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__PLCloudPhotoLibraryManager_acceptCPLShare_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)boostPriorityForMomentShareWithScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager boostPriorityForMomentShareWithScopeIdentifier:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__PLCloudPhotoLibraryManager_boostPriorityForMomentShareWithScopeIdentifier_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)forceSyncMomentSharesWithScopeIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager forceSyncMomentSharesWithScopeIdentifiers:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PLCloudPhotoLibraryManager_forceSyncMomentSharesWithScopeIdentifiers___block_invoke;
  v8[3] = &unk_1E3677530;
  v8[4] = self;
  v9 = v4;
  v10 = v5;
  v6 = v5;
  v7 = v4;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v6, v8);

}

- (void)queryUserIdentitiesWithParticipants:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager queryUserIdentitiesWithParticipants:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__PLCloudPhotoLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)resolveLocalIdentifiersForCloudIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager resolveLocalIdentifiersForCloudIdentifiers:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__PLCloudPhotoLibraryManager_resolveLocalIdentifiersForCloudIdentifiers_completionHandler___block_invoke;
  v12[3] = &unk_1E3671878;
  v12[4] = self;
  v13 = v6;
  v14 = v8;
  v15 = v7;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v9, v12);

}

- (void)getCloudScopedIdentifiersForLocalIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager getCloudScopedIdentifiersForLocalIdentifiers:completionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__PLCloudPhotoLibraryManager_getCloudScopedIdentifiersForLocalIdentifiers_completionHandler___block_invoke;
  v11[3] = &unk_1E3676290;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[PLCloudPhotoLibraryManager _runOnLibraryOpenWithTransaction:block:](self, "_runOnLibraryOpenWithTransaction:block:", v8, v11);

}

- (id)_convertToIdentifierMapFromCPLScopeIdentifierMap:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (!v15)
          objc_msgSend(v4, "setObject:forKey:", v13, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_debugNameForState:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;

  switch(a3)
  {
    case 0uLL:
      v3 = CFSTR("Uninitialized");
      break;
    case 1uLL:
      v3 = CFSTR("Opening");
      break;
    case 2uLL:
      v3 = CFSTR("Opened");
      break;
    case 3uLL:
      v3 = CFSTR("Fetching");
      break;
    case 4uLL:
      v3 = CFSTR("Uploading");
      break;
    case 5uLL:
      v3 = CFSTR("Downloading");
      break;
    case 6uLL:
      v3 = CFSTR("Idle");
      break;
    case 7uLL:
      v3 = CFSTR("ForceResetSync");
      break;
    case 8uLL:
      -[PLCloudPhotoLibraryManager libraryServicesManager](self, "libraryServicesManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "libraryBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "indicatorFileCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Paused (%d)"), (int)objc_msgSend(v6, "currentPauseReason"));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 9uLL:
      v3 = CFSTR("Deactivated");
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)_inMemoryTrackerStateForDebug
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLCloudPhotoLibraryUploadTracker currentStateForDebug](self->_uploadTracker, "currentStateForDebug");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (v2)
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("\n"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("\n\t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("In-memory tracker: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("In-memory tracker: %@"), CFSTR("not initialized"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (int64_t)deviceLibraryConfiguration
{
  return self->_deviceLibraryConfiguration;
}

- (void)setDeviceLibraryConfiguration:(int64_t)a3
{
  self->_deviceLibraryConfiguration = a3;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return (PLLibraryServicesManager *)objc_loadWeakRetained((id *)&self->_libraryServicesManager);
}

- (id)_idleStateTransitionOneTimeAction
{
  return self->__idleStateTransitionOneTimeAction;
}

- (void)_setIdleStateTransitionOneTimeAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__idleStateTransitionOneTimeAction, 0);
  objc_destroyWeak((id *)&self->_libraryServicesManager);
  objc_storeStrong((id *)&self->_scopeIdentifierToUnsharePendingAssetsFrom, 0);
  objc_storeStrong((id *)&self->_deviceLibraryConfigurationChangeCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_libraryScopeSynchronizationQueue, 0);
  objc_storeStrong((id *)&self->_numberOfOtherItemsDownloaded, 0);
  objc_storeStrong((id *)&self->_numberOfVideosDownloaded, 0);
  objc_storeStrong((id *)&self->_numberOfPhotosDownloaded, 0);
  objc_storeStrong((id *)&self->_numberOfOtherItemsToPush, 0);
  objc_storeStrong((id *)&self->_numberOfVideosToPush, 0);
  objc_storeStrong((id *)&self->_numberOfPhotosToPush, 0);
  objc_storeStrong((id *)&self->_blocksWaitingForLibraryOpen, 0);
  objc_storeStrong((id *)&self->_backgroundJobWorkerCoordinator, 0);
  objc_storeStrong((id *)&self->_pushAllChangesCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_lazyCacheDeleteSupport, 0);
  objc_storeStrong((id *)&self->_switchHandler, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_uploadTracker, 0);
  objc_storeStrong((id *)&self->_inMemoryTaskManager, 0);
  objc_storeStrong((id *)&self->_workInProgressTimer, 0);
  objc_storeStrong((id *)&self->_uploadDownloadCountQueue, 0);
  objc_storeStrong((id *)&self->_uploadDownloadCountCoalescer, 0);
  objc_storeStrong((id *)&self->_userUnpauseDispatchTimer, 0);
  objc_storeStrong((id *)&self->_unpauseDispatchTimer, 0);
  objc_storeStrong((id *)&self->_lazyRecoveryManager, 0);
  objc_storeStrong((id *)&self->_lazyResourceManager, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_cplConfiguration, 0);
  objc_storeStrong((id *)&self->_unsafe_cplStatus, 0);
  objc_storeStrong((id *)&self->_unsafe_cplLibrary, 0);
  objc_storeStrong(&self->_cameraMonitorIdentifier, 0);
  objc_storeStrong(&self->_foregroundMonitorIdentifier, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_rulesChangeTracker, 0);
  objc_storeStrong((id *)&self->_syncChangeTracker, 0);
  objc_storeStrong((id *)&self->_downloader, 0);
  objc_storeStrong((id *)&self->_uploader, 0);
}

void __93__PLCloudPhotoLibraryManager_getCloudScopedIdentifiersForLocalIdentifiers_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 58);
    objc_msgSend(WeakRetained, "mainScopeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = a1[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          objc_msgSend(v3, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __93__PLCloudPhotoLibraryManager_getCloudScopedIdentifiersForLocalIdentifiers_completionHandler___block_invoke_2;
    v14[3] = &unk_1E3663248;
    v12 = a1[6];
    v15 = v3;
    v16 = v12;
    v14[4] = a1[4];
    v13 = v3;
    objc_msgSend(v2, "getCloudScopedIdentifiersForLocalScopedIdentifiers:completionHandler:", v13, v14);

    goto LABEL_12;
  }
  if (a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41022, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
LABEL_12:

  }
}

void __93__PLCloudPhotoLibraryManager_getCloudScopedIdentifiersForLocalIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    if (v7)
    {
      (*(void (**)(_QWORD, _QWORD, id))(v7 + 16))(*(_QWORD *)(a1 + 48), 0, v6);
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v9 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v11 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v13 = 138543618;
        v14 = v12;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to get cloud scoped identifiers from local identifiers %{public}@. Error: %@", (uint8_t *)&v13, 0x16u);
      }

    }
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "_convertToIdentifierMapFromCPLScopeIdentifierMap:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
}

void __91__PLCloudPhotoLibraryManager_resolveLocalIdentifiersForCloudIdentifiers_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[5], "count"));
    WeakRetained = objc_loadWeakRetained((id *)a1[4] + 58);
    objc_msgSend(WeakRetained, "mainScopeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = a1[5];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v5, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
          objc_msgSend(v3, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__PLCloudPhotoLibraryManager_resolveLocalIdentifiersForCloudIdentifiers_completionHandler___block_invoke_2;
    v14[3] = &unk_1E3663248;
    v12 = a1[7];
    v13 = a1[4];
    v16 = v12;
    v14[4] = v13;
    v15 = a1[6];
    objc_msgSend(v2, "resolveLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:", v3, v14);

    goto LABEL_12;
  }
  if (a1[7])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 41022, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[7] + 2))();
LABEL_12:

  }
}

void __91__PLCloudPhotoLibraryManager_resolveLocalIdentifiersForCloudIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  if (v5)
  {
    if (v6)
      (*(void (**)(_QWORD, _QWORD, id))(v6 + 16))(*(_QWORD *)(a1 + 48), 0, v5);
  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_convertToIdentifierMapFromCPLScopeIdentifierMap:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");

}

void __84__PLCloudPhotoLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __84__PLCloudPhotoLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke_2;
    v6[3] = &unk_1E3663158;
    v8 = *(id *)(a1 + 56);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v2, "queryUserDetailsForShareParticipants:completionHandler:", v3, v6);

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D11268], 2, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

    }
  }

}

uint64_t __84__PLCloudPhotoLibraryManager_queryUserIdentitiesWithParticipants_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __72__PLCloudPhotoLibraryManager_forceSyncMomentSharesWithScopeIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v15 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Forcing sync for %@", buf, 0xCu);
      }

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__PLCloudPhotoLibraryManager_forceSyncMomentSharesWithScopeIdentifiers___block_invoke_439;
    v12[3] = &unk_1E3663220;
    v9 = *(_QWORD *)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v2, "forceSynchronizingScopeWithIdentifiers:completionHandler:", v9, v12);

  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v5 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to force sync for %@: No CPL library", buf, 0xCu);
    }

  }
}

void __72__PLCloudPhotoLibraryManager_forceSyncMomentSharesWithScopeIdentifiers___block_invoke_439(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*MEMORY[0x1E0D115D0])
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Force sync task %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "stillAlive");

}

void __95__PLCloudPhotoLibraryManager_boostPriorityForMomentShareWithScopeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v24 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Boosting priority for %@", buf, 0xCu);
      }

    }
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __95__PLCloudPhotoLibraryManager_boostPriorityForMomentShareWithScopeIdentifier_completionHandler___block_invoke_438;
    v17[3] = &unk_1E3677858;
    v9 = *(void **)(a1 + 40);
    v17[4] = *(_QWORD *)(a1 + 32);
    v18 = v9;
    v20 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 48);
    objc_msgSend(v2, "boostPriorityForScopeWithIdentifier:completionHandler:", v18, v17);

  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v5 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to boost priority for %@: No CPL library", buf, 0xCu);
      }

    }
    v12 = *(_QWORD *)(a1 + 56);
    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D11268];
      v21 = *MEMORY[0x1E0CB2D50];
      v22 = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 2, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v16);

    }
  }

}

void __95__PLCloudPhotoLibraryManager_boostPriorityForMomentShareWithScopeIdentifier_completionHandler___block_invoke_438(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_22;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v5;
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v9 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v15 = 138412290;
    *(_QWORD *)&v15[4] = v9;
    v10 = "Failed to boost priority for %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_20;
  }
  if (*MEMORY[0x1E0D115D0])
    goto LABEL_22;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
  if (v6 == 2)
  {
    __CPLAppLibraryOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6 == 1)
      __CPLSyndicationOSLogDomain();
    else
      __CPLSystemLibraryOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v15 = 138412290;
    *(_QWORD *)&v15[4] = v13;
    v10 = "Boosted priority for %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_DEFAULT;
LABEL_20:
    _os_log_impl(&dword_199541000, v11, v12, v10, v15, 0xCu);
  }
LABEL_21:

LABEL_22:
  v14 = *(_QWORD *)(a1 + 56);
  if (v14)
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v3);
  objc_msgSend(*(id *)(a1 + 48), "stillAlive", *(_OWORD *)v15);

}

void __63__PLCloudPhotoLibraryManager_acceptCPLShare_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__PLCloudPhotoLibraryManager_acceptCPLShare_completionHandler___block_invoke_2;
    v9[3] = &unk_1E3674E40;
    v11 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v2, "acceptSharedScope:completionHandler:", v3, v9);

    v4 = v11;
LABEL_5:

    goto LABEL_6;
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D11268];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("CPL hasn't been setup yet");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 2, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v8);

    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __63__PLCloudPhotoLibraryManager_acceptCPLShare_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __71__PLCloudPhotoLibraryManager_fetchShareFromShareURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__PLCloudPhotoLibraryManager_fetchShareFromShareURL_completionHandler___block_invoke_2;
    v9[3] = &unk_1E36631F8;
    v11 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v2, "fetchSharedScopeFromShareURL:completionHandler:", v3, v9);

    v4 = v11;
LABEL_5:

    goto LABEL_6;
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D11268];
    v12 = *MEMORY[0x1E0CB2D50];
    v13[0] = CFSTR("CPL hasn't been setup yet");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 2, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v8);

    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __71__PLCloudPhotoLibraryManager_fetchShareFromShareURL_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __70__PLCloudPhotoLibraryManager_publishCPLScopeChange_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __70__PLCloudPhotoLibraryManager_publishCPLScopeChange_completionHandler___block_invoke_2;
      v14[3] = &unk_1E36631F8;
      v16 = *(id *)(a1 + 56);
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v2, "createScope:completionHandler:", v3, v14);

      v4 = v16;
LABEL_9:

      goto LABEL_10;
    }
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D11268];
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = v12;
      v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D11268];
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = 2;
LABEL_8:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v13);

      goto LABEL_9;
    }
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 48), "stillAlive");

}

uint64_t __70__PLCloudPhotoLibraryManager_publishCPLScopeChange_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __107__PLCloudPhotoLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_onDemand_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "databaseContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager fetchComputeStatesForRecordsWithScopedIdentifiers:onDemand:completionHandler:]_block_invoke");

    if (+[PLManagedAsset isComputeSyncEnabledForDirection:library:](PLManagedAsset, "isComputeSyncEnabledForDirection:library:", 1, v5))
    {
      v6 = objc_alloc_init(MEMORY[0x1E0D11420]);
      v7 = *(unsigned __int8 *)(a1 + 56);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __107__PLCloudPhotoLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_onDemand_completionHandler___block_invoke_2;
      v12[3] = &unk_1E3676880;
      v8 = *(_QWORD *)(a1 + 40);
      v13 = *(id *)(a1 + 48);
      objc_msgSend(v2, "fetchComputeStatesForRecordsWithScopedIdentifiers:validator:onDemand:completionHandler:", v8, v6, v7, v12);

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
      +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 18, CFSTR("CCSS download feature disabled"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v6);
    }

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

uint64_t __107__PLCloudPhotoLibraryManager_fetchComputeStatesForRecordsWithScopedIdentifiers_onDemand_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_2;
  v6[3] = &unk_1E3674F30;
  v7 = v2;
  v8 = v4;
  v10 = *(_QWORD *)(a1 + 48);
  v9 = v3;
  v5 = v2;
  objc_msgSend(v4, "_runAsyncOnIsolationQueueWithTransaction:block:", v9, v6);

}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_430(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString **v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[12])
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (!v3)
      return;
    v4 = v2[57];
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0D74498];
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = CFSTR("Cannot change library configuration on non-SPL");
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = (const __CFString **)v24;
    v9 = &v23;
    goto LABEL_4;
  }
  v12 = objc_msgSend(v2, "isCloudPhotoLibraryEnabled");
  v4 = *(_QWORD *)(a1 + 64);
  if ((v12 & 1) != 0)
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (v4 == *(_QWORD *)(v13 + 456))
    {
      v3 = *(_QWORD *)(a1 + 48);
      if (v3)
      {
        v5 = (void *)MEMORY[0x1E0CB35C8];
        v6 = *MEMORY[0x1E0D74498];
        v21 = *MEMORY[0x1E0CB2938];
        v22 = CFSTR("Cannot change device-libary configuration to the current configuration");
        v7 = (void *)MEMORY[0x1E0C99D80];
        v8 = &v22;
        v9 = &v21;
LABEL_4:
        objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 41032, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v3 + 16))(v3, 0, v4, v11);

      }
    }
    else
    {
      if (!*(_QWORD *)(v13 + 416))
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(v16 + 416);
        *(_QWORD *)(v16 + 416) = v15;

        v18 = *(_QWORD **)(a1 + 32);
        if (v18[51] == v18[57])
          objc_msgSend(v18, "_runOnLibraryOpenWithTransaction:block:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
      }
      if (*(_QWORD *)(a1 + 48))
      {
        v19 = *(void **)(*(_QWORD *)(a1 + 32) + 416);
        v20 = (id)MEMORY[0x19AEC174C]();
        objc_msgSend(v19, "addObject:");

      }
    }
  }
  else
  {
    PLSetCPLDeviceLibraryConfiguration(*(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "setDeviceLibraryConfiguration:", *(_QWORD *)(a1 + 64));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 408) = *(_QWORD *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456), 0);
  }
}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unint64_t v11;
  __CFString *v12;
  __CFString *v13;
  unint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  if (v2)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(a1[5] + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1[5] + 456);
        if (v11 > 2)
          v12 = CFSTR("unknown");
        else
          v12 = off_1E366BE48[v11];
        v13 = v12;
        v14 = a1[7];
        if (v14 > 2)
          v15 = CFSTR("unknown");
        else
          v15 = off_1E366BE48[v14];
        v16 = v15;
        *(_DWORD *)buf = 138412546;
        v24 = v13;
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Starting force-backup in preparation for device-library configuration change from %@ to %@", buf, 0x16u);

      }
      v2 = (void *)a1[4];
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_426;
    v20[3] = &unk_1E36631A8;
    v17 = (void *)a1[6];
    v20[4] = a1[5];
    v18 = v17;
    v19 = a1[7];
    v21 = v18;
    v22 = v19;
    objc_msgSend(v2, "forceBackupWithCompletionHandler:", v20);

  }
  else
  {
    v5 = (void *)a1[5];
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0D11268];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("CPL hasn't been setup yet");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 2, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:", v9);

  }
}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_426(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_2_427;
  v7[3] = &unk_1E3677C40;
  v8 = v3;
  v9 = v4;
  v10 = a1[6];
  v6 = v3;
  objc_msgSend(v4, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v7);

}

void __88__PLCloudPhotoLibraryManager_requestDeviceLibraryConfigurationChange_completionHandler___block_invoke_2_427(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  __CFString *v19;
  __CFString *v20;
  unint64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  __CFString *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:");
  }
  else
  {
    objc_msgSend(v2, "libraryServicesManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryBundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indicatorFileCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isDisableICloudPhotos") & 1) != 0)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        if (v7 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v7 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v8 = objc_claimAutoreleasedReturnValue();
        }
        v11 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "iCPL requested to disable, unable to change device-library configuration", buf, 2u);
        }

      }
      v12 = *(void **)(a1 + 40);
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D74498];
      v25 = *MEMORY[0x1E0CB2938];
      v26 = CFSTR("Cannot change device-library, iCPL was disabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 41032, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_callDeviceLibraryConfigurationChangeRequestCompletionHandlersWithError:", v16);

    }
    else
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        if (v9 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v9 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v17 = v10;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 456);
          if (v18 > 2)
            v19 = CFSTR("unknown");
          else
            v19 = off_1E366BE48[v18];
          v20 = v19;
          v21 = *(_QWORD *)(a1 + 48);
          if (v21 > 2)
            v22 = CFSTR("unknown");
          else
            v22 = off_1E366BE48[v21];
          v23 = v22;
          *(_DWORD *)buf = 138412546;
          v28 = v20;
          v29 = 2112;
          v30 = v23;
          _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Changing device-library configuration from %@ to %@", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PLSetPendingCPLDeviceLibraryConfiguration(v24);

      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 408) = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "_disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:", 0, 3);
    }

  }
}

void __85__PLCloudPhotoLibraryManager_startUnsharingPendingAssetsSharedToScopeWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 424))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(v2 + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Already un-sharing assets pending push to scope: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v5 = *(_QWORD *)(v2 + 96);
      if (v5 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v9 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 40);
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Start un-sharing assets pending push to scope: %@", (uint8_t *)&v11, 0xCu);
      }

      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v2 + 424), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_unshareBatchOfPendingAssetsSharedToScopeWithTransaction:", *(_QWORD *)(a1 + 48));
  }
}

void __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v8 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 48);
    v15 = v6;
LABEL_6:
    objc_msgSend(v8, "_finishedUnsharingPendingAssetsSharedToScopeWithTransaction:error:", v14, v15);
    goto LABEL_7;
  }
  v7 = objc_msgSend(v5, "count");
  v8 = *(void **)(a1 + 32);
  if (!v7)
  {
    v14 = *(_QWORD *)(a1 + 48);
    v15 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v8, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "newShortLivedLibraryWithName:", "-[PLCloudPhotoLibraryManager _unshareBatchOfPendingAssetsSharedToScopeWithTransaction:]_block_invoke");

  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_2;
  v18[3] = &unk_1E3670C40;
  v19 = v5;
  v20 = *(id *)(a1 + 40);
  v21 = v11;
  v22 = *(_QWORD *)(a1 + 32);
  v23 = *(id *)(a1 + 48);
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_424;
  v16[3] = &unk_1E3677C18;
  v16[4] = *(_QWORD *)(a1 + 32);
  v17 = *(id *)(a1 + 48);
  v13 = v11;
  objc_msgSend(v13, "performTransaction:completionHandler:", v18, v16);

LABEL_7:
}

void __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  char v29;
  int v30;
  int v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  int v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 100);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "record");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "scopedIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND noindex:(%K) = %@"), CFSTR("cloudAssetGUID"), v2, CFSTR("libraryScope.scopeIdentifier"), *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setPredicate:", v11);
  objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v15, "executeFetchRequest:error:", v14, &v40);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v40;

  if (v16)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 96);
      if (v18 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v18 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v20 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 40);
        v22 = objc_msgSend(v16, "count");
        *(_DWORD *)buf = 138412546;
        v47 = v21;
        v48 = 1024;
        v49 = v22;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Unsharing pending assets shared to scope: %@, batch count: %d", buf, 0x12u);
      }

    }
    v33 = v17;
    v34 = v16;
    v35 = v14;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v23 = v16;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v28, "removeLibraryScopeAndContributors");
          v29 = objc_msgSend(v28, "libraryScopeShareState");
          v30 = (v29 & 1) - 1;
          if ((v29 & 2) != 0)
            v30 = 1;
          if ((v29 & 4) != 0)
            v30 = 2;
          if ((v29 & 8) != 0)
            v30 = 3;
          if ((v29 & 0x10) != 0)
            v31 = 4;
          else
            v31 = v30;
          objc_msgSend(v28, "setLibraryScopeShareState:", 0);
          PLLibraryScopeAssetSetSuggestedByClientType(v31, v28);
          PLLibraryScopeAssetSetUserManuallyRejectedState(1, v28);
          v32 = v28;
          objc_msgSend(v32, "setLibraryScopeShareState:", objc_msgSend(v32, "libraryScopeShareState") & 0xFFFFFFFFFF7FFFFFLL);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v25);
    }

    v14 = v35;
    v17 = v33;
    v16 = v34;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "_finishedUnsharingPendingAssetsSharedToScopeWithTransaction:error:", *(_QWORD *)(a1 + 64), v17);
  }

}

uint64_t __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_424(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_2_425;
  v4[3] = &unk_1E3677AA0;
  v4[4] = v2;
  return objc_msgSend(v2, "_runAsyncOnIsolationQueueWithTransaction:block:", v1, v4);
}

uint64_t __87__PLCloudPhotoLibraryManager__unshareBatchOfPendingAssetsSharedToScopeWithTransaction___block_invoke_2_425(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  result = objc_msgSend(*(id *)(a1 + 32), "_canExternallyTransitionToNewLibraryStateIgnoringPause:", 0);
  if ((_DWORD)result)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Going to fetch new events from change hub from UNSHARE PENDING ASSETS", v6, 2u);
      }

    }
    return objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 90) = 1;
  }
  return result;
}

void __96__PLCloudPhotoLibraryManager__finishedUnsharingPendingAssetsSharedToScopeWithTransaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 424);
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Finished un-sharing assets pending push to scope: %@, error: %@", (uint8_t *)&v9, 0x16u);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 424);
  *(_QWORD *)(v7 + 424) = 0;

}

void __116__PLCloudPhotoLibraryManager__getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (!v9)
      goto LABEL_11;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D11268];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("CPL hasn't been setup yet");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v10;
    v14 = v11;
    v15 = 2;
LABEL_10:
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v18);

    goto LABEL_11;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 56);
    if (!v9)
      goto LABEL_11;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0D11268];
    v29 = *MEMORY[0x1E0CB2D50];
    v30 = CFSTR("iCloud Photo Library is not enabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v16;
    v14 = v17;
    v15 = 33;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "cplStatus");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(*(id *)(a1 + 32), "cplStatus"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isExceedingSharedLibraryQuota"),
        v5,
        v4,
        (v6 & 1) == 0))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v19 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v19 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v22 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_DEFAULT, "Not exceeding shared library quota, not fetching pending record statuses for scope identifier: %@", buf, 0xCu);
      }

    }
    v23 = *(_QWORD *)(a1 + 56);
    if (v23)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v23 + 16))(v23, 0, 0);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __116__PLCloudPhotoLibraryManager__getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_417;
    v24[3] = &unk_1E3663158;
    v8 = *(_QWORD *)(a1 + 64);
    v26 = *(id *)(a1 + 56);
    v25 = *(id *)(a1 + 48);
    objc_msgSend(v2, "getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:", v7, v8, v24);

  }
LABEL_11:

}

uint64_t __116__PLCloudPhotoLibraryManager__getStatusForPendingRecordsSharedToScopeWithIdentifier_maximumCount_completionHandler___block_invoke_417(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __98__PLCloudPhotoLibraryManager_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __98__PLCloudPhotoLibraryManager_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_2;
      v17 = &unk_1E36688D8;
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v2, "getScopeStatusCountsForScopeWithIdentifier:completionHandler:", v3, &v14);
      objc_msgSend(*(id *)(a1 + 48), "stillAlive", v14, v15, v16, v17);
      v4 = v18;
LABEL_9:

      goto LABEL_10;
    }
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D11268];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = v12;
      v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D11268];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = 2;
LABEL_8:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v13);

      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __98__PLCloudPhotoLibraryManager_getLibraryScopeStatusCountsForScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__PLCloudPhotoLibraryManager_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __82__PLCloudPhotoLibraryManager_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke_2;
      v17 = &unk_1E36688B0;
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v2, "refreshScopeWithIdentifier:completionHandler:", v3, &v14);
      objc_msgSend(*(id *)(a1 + 48), "stillAlive", v14, v15, v16, v17);
      v4 = v18;
LABEL_9:

      goto LABEL_10;
    }
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D11268];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = v12;
      v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D11268];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = 2;
LABEL_8:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v13);

      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __82__PLCloudPhotoLibraryManager_refreshLibraryScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __85__PLCloudPhotoLibraryManager_updateLibraryScopeWithCPLScopeChange_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __85__PLCloudPhotoLibraryManager_updateLibraryScopeWithCPLScopeChange_completionHandler___block_invoke_2;
      v17 = &unk_1E36688B0;
      v18 = *(id *)(a1 + 56);
      objc_msgSend(v2, "updateShareForScope:completionHandler:", v3, &v14);
      objc_msgSend(*(id *)(a1 + 48), "stillAlive", v14, v15, v16, v17);
      v4 = v18;
LABEL_9:

      goto LABEL_10;
    }
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D11268];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = v12;
      v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D11268];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = 2;
LABEL_8:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v13);

      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __85__PLCloudPhotoLibraryManager_updateLibraryScopeWithCPLScopeChange_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __86__PLCloudPhotoLibraryManager_publishLibraryScopeWithCPLShare_title_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(_QWORD *)(a1 + 48);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __86__PLCloudPhotoLibraryManager_publishLibraryScopeWithCPLShare_title_completionHandler___block_invoke_2;
      v18 = &unk_1E36688B0;
      v19 = *(id *)(a1 + 64);
      objc_msgSend(v2, "createOwnedLibraryShareScopeWithShare:title:completionHandler:", v3, v4, &v15);
      objc_msgSend(*(id *)(a1 + 56), "stillAlive", v15, v16, v17, v18);
      v5 = v19;
LABEL_9:

      goto LABEL_10;
    }
    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0D11268];
      v20 = *MEMORY[0x1E0CB2D50];
      v21 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v12;
      v10 = v13;
      v11 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0D11268];
      v22 = *MEMORY[0x1E0CB2D50];
      v23[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      v11 = 2;
LABEL_8:
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v14);

      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __86__PLCloudPhotoLibraryManager_publishLibraryScopeWithCPLShare_title_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__PLCloudPhotoLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __74__PLCloudPhotoLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2;
      v13[3] = &unk_1E36768D0;
      v14 = *(id *)(a1 + 40);
      objc_msgSend(v2, "sharedLibraryRampCheckWithCompletionHandler:", v13);
      v3 = v14;
LABEL_9:

      goto LABEL_10;
    }
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0D11268];
      v15 = *MEMORY[0x1E0CB2D50];
      v16 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v10;
      v8 = v11;
      v9 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = *MEMORY[0x1E0D11268];
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      v8 = v6;
      v9 = 2;
LABEL_8:
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v12);

      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __74__PLCloudPhotoLibraryManager_sharedLibraryRampCheckWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int128 v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v7 = *(_QWORD *)(a1 + 64);
    if (!v7)
      goto LABEL_9;
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D11268];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("CPL hasn't been setup yet");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    v12 = v9;
    v13 = 2;
LABEL_8:
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v13, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v16);

    goto LABEL_9;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) == 0)
  {
    v7 = *(_QWORD *)(a1 + 64);
    if (!v7)
      goto LABEL_9;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D11268];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = CFSTR("iCloud Photo Library is not enabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v14;
    v12 = v15;
    v13 = 33;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager removeParticipantsWithParticipantUUIDs:fromLibraryScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]_block_invoke");

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
  v17[3] = &unk_1E3663108;
  v18 = *(id *)(a1 + 40);
  v19 = v5;
  v20 = v2;
  v21 = *(id *)(a1 + 48);
  v24 = *(_OWORD *)(a1 + 72);
  v23 = *(id *)(a1 + 64);
  v22 = *(id *)(a1 + 56);
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v17);

LABEL_9:
}

void __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[PLShareParticipant participantsWithUUIDs:inPhotoLibrary:](PLShareParticipant, "participantsWithUUIDs:inPhotoLibrary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        +[PLShareParticipant participantWithPLShareParticipant:](PLShareParticipant, "participantWithPLShareParticipant:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v13 = *(_QWORD *)(a1 + 80);
  v12 = *(_QWORD *)(a1 + 88);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3;
  v14[3] = &unk_1E36630E0;
  v16 = *(id *)(a1 + 72);
  v15 = *(id *)(a1 + 64);
  objc_msgSend(v10, "removeParticipants:fromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", v3, v11, v13, v12, v14);

}

uint64_t __145__PLCloudPhotoLibraryManager_removeParticipantsWithParticipantUUIDs_fromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __115__PLCloudPhotoLibraryManager_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 64);
      v4 = *(_QWORD *)(a1 + 72);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __115__PLCloudPhotoLibraryManager_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2;
      v16[3] = &unk_1E36630E0;
      v18 = *(id *)(a1 + 56);
      v17 = *(id *)(a1 + 48);
      objc_msgSend(v2, "startExitFromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:", v3, v5, v4, v16);

      v6 = v18;
LABEL_9:

      goto LABEL_10;
    }
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D11268];
      v19 = *MEMORY[0x1E0CB2D50];
      v20 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v13;
      v11 = v14;
      v12 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0D11268];
      v21 = *MEMORY[0x1E0CB2D50];
      v22[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v8;
      v11 = v9;
      v12 = 2;
LABEL_8:
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v15);

      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __115__PLCloudPhotoLibraryManager_startExitFromLibraryScopeWithIdentifier_retentionPolicy_exitSource_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __78__PLCloudPhotoLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __78__PLCloudPhotoLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2;
      v14[3] = &unk_1E3674E40;
      v16 = *(id *)(a1 + 56);
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v2, "deactivateScopeWithIdentifier:completionHandler:", v3, v14);

      v4 = v16;
LABEL_9:

      goto LABEL_10;
    }
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D11268];
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = v12;
      v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D11268];
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = 2;
LABEL_8:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v13);

      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __78__PLCloudPhotoLibraryManager_deactivateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __76__PLCloudPhotoLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __76__PLCloudPhotoLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2;
      v14[3] = &unk_1E3674E40;
      v16 = *(id *)(a1 + 56);
      v15 = *(id *)(a1 + 48);
      objc_msgSend(v2, "activateScopeWithIdentifier:completionHandler:", v3, v14);

      v4 = v16;
LABEL_9:

      goto LABEL_10;
    }
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0D11268];
      v17 = *MEMORY[0x1E0CB2D50];
      v18 = CFSTR("iCloud Photo Library is not enabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = v12;
      v10 = 33;
      goto LABEL_8;
    }
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0D11268];
      v19 = *MEMORY[0x1E0CB2D50];
      v20[0] = CFSTR("CPL hasn't been setup yet");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = 2;
LABEL_8:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v13);

      goto LABEL_9;
    }
  }
LABEL_10:

}

uint64_t __76__PLCloudPhotoLibraryManager_activateScopeWithIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __53__PLCloudPhotoLibraryManager_configurationDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleCPLConfigurationChange");

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(WeakRetained, "computeCacheManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyCPLConfiguration:", *(_QWORD *)(a1 + 40));

}

void __46__PLCloudPhotoLibraryManager_statusDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id WeakRetained;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  id v39;
  void *v40;
  char v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  int v51;
  _QWORD v52[5];
  id v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_disableiCPLAfterZoneWipedInCloudIfNecessary") & 1) != 0)
    return;
  objc_msgSend(*(id *)(a1 + 32), "_setReadyForAnalysisWithCPLStatus:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_notifyCPLStatus:didChange:andCPLConfiguration:", *(_QWORD *)(a1 + 40), 1, 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 280), "currentObjectValueWithoutForcingEvaluation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (v2)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v8 = v5;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v9 = "cacheDeleteSupport is non-null";
LABEL_21:
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
LABEL_22:

    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v6 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_WORD *)buf = 0;
    v9 = "cacheDeleteSupport is null";
    goto LABEL_21;
  }
  objc_msgSend(v2, "exitDeleteTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "exitDeleteTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 == v11)
  {
    if (!*v3)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v14 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v14 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v23 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v55 = v10;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "exitDeleteTime (%@) is unchanged", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "resourceManager");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleCPLStatusChange");
  }
  else
  {
    if (!*v3)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v12 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v12 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v16 = v13;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v55 = v10;
        v56 = 2112;
        v57 = v11;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "Updating exitDeleteTime for CacheDelete from %@ to %@", buf, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_resetCacheDeleteSupport");
    objc_msgSend(*(id *)(a1 + 32), "_resetResourceManager");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 464));
    objc_msgSend(WeakRetained, "cplSettings");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (!v11)
      {
        if (!*v3)
        {
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          if (v19 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v19 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v20 = objc_claimAutoreleasedReturnValue();
          }
          v31 = v20;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "Leaving exit mode, marking purgeable flags for all resources", buf, 2u);
          }

        }
        +[PLInternalResource predicateForAvailableResources](PLInternalResource, "predicateForAvailableResources");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "databaseContext");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v34, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager statusDidChange:]_block_invoke");

        objc_msgSend(v18, "setRunOnceFlag:error:", 4, 0);
        v36 = *(void **)(a1 + 32);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __46__PLCloudPhotoLibraryManager_statusDidChange___block_invoke_2;
        v52[3] = &unk_1E3677C18;
        v52[4] = v36;
        v18 = v18;
        v53 = v18;
        objc_msgSend(v36, "markPurgeableResourcesMatchingPredicate:urgency:inLibrary:completionHandler:", v32, 0, v35, v52);

      }
    }
    else
    {
      if (!*v3)
      {
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v21 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v21 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v22 = objc_claimAutoreleasedReturnValue();
        }
        v24 = v22;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Entering exit mode, clearing purgeable flags for all resources", buf, 2u);
        }

      }
      objc_msgSend(v18, "setRunOnceFlag:error:", 8, 0);
      objc_msgSend(*(id *)(a1 + 32), "cacheDeleteSupport");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "clearPurgeableFlagsForAllResources");

      if (v26)
      {
        if (!*v3)
        {
          v27 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          if (v27 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v28 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v27 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v28 = objc_claimAutoreleasedReturnValue();
          }
          v37 = v28;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_DEFAULT, "Successfully cleared all purgeable resources", buf, 2u);
          }

        }
        objc_msgSend(v18, "clearRunOnceFlag:error:", 8, 0);
      }
      else if (!*v3)
      {
        v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v29 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v30 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v29 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v30 = objc_claimAutoreleasedReturnValue();
        }
        v38 = v30;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Failed to clear all purgeable resources", buf, 2u);
        }

      }
      v39 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 464));
      objc_msgSend(v39, "cplSettings");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isKeepOriginalsEnabled");

      if ((v41 & 1) == 0)
      {
        if (!*v3)
        {
          v42 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          if (v42 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v43 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v42 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v43 = objc_claimAutoreleasedReturnValue();
          }
          v44 = v43;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEFAULT, "Entering exit mode, automatically switch to download & keep original mode", buf, 2u);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "setPrefetchMode:error:", 1, 0);
      }
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "initialSyncDate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "databaseContext");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager statusDidChange:]_block_invoke");

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 448))
  {
    objc_msgSend(v45, "timeIntervalSinceNow");
    if (fabs(v49) <= 60.0)
    {
      objc_msgSend(v48, "libraryServicesManager");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v50, "isSystemPhotoLibrary");

      if (v51)
      {
        objc_msgSend(v48, "reportLibrarySizeToDAS");
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 448) = 1;
      }
    }
  }

}

uint64_t __46__PLCloudPhotoLibraryManager_statusDidChange___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[16];

  if (!*MEMORY[0x1E0D115D0])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Successfully marked all purgeable resources", v6, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 40), "clearRunOnceFlag:error:", 4, 0);
}

uint64_t __67__PLCloudPhotoLibraryManager__setToDownloadCountsForImages_videos___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(*(id *)(a1 + 32), "setDownloadCountsForImages:videos:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.transfercountchange"), 0, 0, 0);
  return objc_msgSend(*(id *)(a1 + 40), "stillAlive");
}

_QWORD *__55__PLCloudPhotoLibraryManager__startWorkInProgressTimer__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[29] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "_checkForWorkInProgress");
  return result;
}

uint64_t __66__PLCloudPhotoLibraryManager_endUserSessionWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[10];
  if (v3 == 8)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v6 = v2[12];
      if (v6 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v6 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v12 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Detected endUserSession, assetsd is paused, will unpause", (uint8_t *)&v15, 2u);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "_setIdleStateTransitionOneTimeAction:", *(_QWORD *)(a1 + 40));
    *(_WORD *)(*(_QWORD *)(a1 + 32) + 132) = 3;
    return objc_msgSend(*(id *)(a1 + 32), "_unpause");
  }
  else if (v3 == 6)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = v2[12];
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Detected endUserSession, assetsd is idle", (uint8_t *)&v15, 2u);
      }

      v2 = *(_QWORD **)(a1 + 32);
    }
    if (objc_msgSend(v2, "_hasIncomingWorkFileMarker"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_setIdleStateTransitionOneTimeAction:", *(_QWORD *)(a1 + 40));
      return objc_msgSend(*(id *)(a1 + 32), "_startWorkInProgressTimer");
    }
    else
    {
      return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v8 = v2[12];
      if (v8 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Detected endUserSession, assetsd is not yet idle, assetsd state: %@", (uint8_t *)&v15, 0xCu);

      }
      v2 = *(_QWORD **)(a1 + 32);
    }
    return objc_msgSend(v2, "_setIdleStateTransitionOneTimeAction:", *(_QWORD *)(a1 + 40));
  }
}

void __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend((id)*MEMORY[0x1E0CEC568], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v6))
  {

  }
  else
  {
    objc_msgSend((id)*MEMORY[0x1E0CEC520], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqualToString:", v7);

    if ((v8 & 1) == 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v5, "unsignedIntegerValue");
  }

}

void __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke_2(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 392), "unsignedIntegerValue");
  v2 = (_QWORD *)a1[4];
  if (!v2[49])
  {
    objc_msgSend(v2, "cplStatus");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastSuccessfulSyncDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke_3;
    v10[3] = &unk_1E3676EA0;
    v4 = (void *)a1[5];
    v13 = a1[6];
    v11 = v4;
    v12 = v3;
    v5 = v3;
    objc_msgSend(v11, "performBlockAndWait:", v10);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    v8 = *(void **)(v7 + 392);
    *(_QWORD *)(v7 + 392) = v6;

  }
}

uint64_t __73__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToDownloadInLibrary___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "numberOfCPLSupportedAssetsOfKind:includingTrashedSinceDate:", 2, *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "numberOfCPLSupportedAssetsOfKind:includingTrashedSinceDate:", 3, *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += result;
  return result;
}

void __69__PLCloudPhotoLibraryManager__inq_numberOfVideosToDownloadInLibrary___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 384), "unsignedIntegerValue");
  v2 = (_QWORD *)a1[4];
  if (!v2[48])
  {
    objc_msgSend(v2, "cplStatus");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastSuccessfulSyncDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PLCloudPhotoLibraryManager__inq_numberOfVideosToDownloadInLibrary___block_invoke_2;
    v10[3] = &unk_1E3676EA0;
    v4 = (void *)a1[5];
    v13 = a1[6];
    v11 = v4;
    v12 = v3;
    v5 = v3;
    objc_msgSend(v11, "performBlockAndWait:", v10);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    v8 = *(void **)(v7 + 384);
    *(_QWORD *)(v7 + 384) = v6;

  }
}

uint64_t __69__PLCloudPhotoLibraryManager__inq_numberOfVideosToDownloadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfCPLSupportedAssetsOfKind:includingTrashedSinceDate:", 1, *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __69__PLCloudPhotoLibraryManager__inq_numberOfPhotosToDownloadInLibrary___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 376), "unsignedIntegerValue");
  v2 = (_QWORD *)a1[4];
  if (!v2[47])
  {
    objc_msgSend(v2, "cplStatus");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastSuccessfulSyncDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__PLCloudPhotoLibraryManager__inq_numberOfPhotosToDownloadInLibrary___block_invoke_2;
    v10[3] = &unk_1E3676EA0;
    v4 = (void *)a1[5];
    v13 = a1[6];
    v11 = v4;
    v12 = v3;
    v5 = v3;
    objc_msgSend(v11, "performBlockAndWait:", v10);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = a1[4];
    v8 = *(void **)(v7 + 376);
    *(_QWORD *)(v7 + 376) = v6;

  }
}

uint64_t __69__PLCloudPhotoLibraryManager__inq_numberOfPhotosToDownloadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfCPLSupportedAssetsOfKind:includingTrashedSinceDate:", 0, *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __67__PLCloudPhotoLibraryManager__inq_numberOfVideosToUploadInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6[2];

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "unsignedIntegerValue");
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 360))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PLCloudPhotoLibraryManager__inq_numberOfVideosToUploadInLibrary___block_invoke_2;
    v5[3] = &unk_1E3677C68;
    *(_OWORD *)v6 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v6[0], "performBlockAndWait:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 360);
    *(_QWORD *)(v3 + 360) = v2;

  }
}

uint64_t __67__PLCloudPhotoLibraryManager__inq_numberOfVideosToUploadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfUnpushedAssetsOfKind:", 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __67__PLCloudPhotoLibraryManager__inq_numberOfPhotosToUploadInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6[2];

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "unsignedIntegerValue");
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 352))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__PLCloudPhotoLibraryManager__inq_numberOfPhotosToUploadInLibrary___block_invoke_2;
    v5[3] = &unk_1E3677C68;
    *(_OWORD *)v6 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v6[0], "performBlockAndWait:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 352);
    *(_QWORD *)(v3 + 352) = v2;

  }
}

uint64_t __67__PLCloudPhotoLibraryManager__inq_numberOfPhotosToUploadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfUnpushedAssetsOfKind:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __71__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToUploadInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6[2];

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "unsignedIntegerValue");
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 368))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __71__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToUploadInLibrary___block_invoke_2;
    v5[3] = &unk_1E3677C68;
    *(_OWORD *)v6 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v6[0], "performBlockAndWait:", v5);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 368);
    *(_QWORD *)(v3 + 368) = v2;

  }
}

uint64_t __71__PLCloudPhotoLibraryManager__inq_numberOfOtherItemsToUploadInLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "numberOfUnpushedAssetsOfKind:", 2);
  result = objc_msgSend(*(id *)(a1 + 32), "numberOfUnpushedAssetsOfKind:", 3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

void __61__PLCloudPhotoLibraryManager__updateTransferCountsInLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_inq_numberOfPhotosToDownloadInLibrary:", *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 32), "_inq_numberOfVideosToDownloadInLibrary:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_setToDownloadCountsForImages:videos:", v2, v3);
  if (!*MEMORY[0x1E0D115D0])
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7[0] = 67109376;
      v7[1] = v2;
      v8 = 1024;
      v9 = v3;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "updateTransferCounts, download i: %d v: %d", (uint8_t *)v7, 0xEu);
    }

  }
}

void __48__PLCloudPhotoLibraryManager_clearPrefetchState__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearPrefetchState");

}

void __68__PLCloudPhotoLibraryManager_cplConfigurationWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "cplConfiguration");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __68__PLCloudPhotoLibraryManager_getCPLStateForDebug_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_inMemoryTrackerStateForDebug");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusForDebug:", *(unsigned __int8 *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v3, v4, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__PLCloudPhotoLibraryManager__appWithBundleIdentifier_changedStateToForeground___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  int v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[8])
  {
    if (v2[12])
    {
      v3 = *(unsigned __int8 *)(a1 + 48);
      objc_msgSend(v2, "cplLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4;
      if (v3)
      {
        v5 = 0;
LABEL_15:
        objc_msgSend(v4, "noteClientIsInForegroundQuietly:", v5);
LABEL_18:

        return;
      }
      goto LABEL_17;
    }
    if (kCPLMaximumOutgoingResourcesSize_block_invoke_onceToken != -1)
      dispatch_once(&kCPLMaximumOutgoingResourcesSize_block_invoke_onceToken, &__block_literal_global_398);
    if (objc_msgSend((id)kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLNotification, "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      v6 = *(unsigned __int8 *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
        objc_msgSend(v7, "noteClientIsInForegroundQuietly:", 0);
      else
        objc_msgSend(v7, "noteClientIsInBackground");

    }
    if (objc_msgSend((id)kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLQuietNotification, "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      v9 = *(unsigned __int8 *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v4;
      if (v9)
      {
        v5 = 1;
        goto LABEL_15;
      }
LABEL_17:
      objc_msgSend(v4, "noteClientIsInBackground");
      goto LABEL_18;
    }
  }
}

void __80__PLCloudPhotoLibraryManager__appWithBundleIdentifier_changedStateToForeground___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.mobileslideshow"), CFSTR("com.apple.mobileslideshow.photospicker"), CFSTR("com.apple.mobileslideshow.photo-picker"), 0);
  v1 = (void *)kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLNotification;
  kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLNotification = v0;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.MobileSMS"), 0);
  v3 = (void *)kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLQuietNotification;
  kCPLMaximumOutgoingResourcesSize_block_invoke_bundleIdentifiersForCPLQuietNotification = v2;

}

_QWORD *__62__PLCloudPhotoLibraryManager__cameraChangedStateToForeground___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[9])
    return (_QWORD *)objc_msgSend(result, "setPause:reason:", *(unsigned __int8 *)(a1 + 40), 1);
  return result;
}

void __96__PLCloudPhotoLibraryManager__updateWithCPLResource_isHighPriority_inLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  _BYTE *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id v46;
  NSObject *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  _BOOL4 v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  PLValidatedExternalResource *v87;
  void *v88;
  NSObject *v89;
  PLValidatedExternalResource *v90;
  uint64_t v91;
  NSObject *v92;
  NSObject *v93;
  uint64_t v94;
  NSObject *v95;
  void *v96;
  char v97;
  NSObject *v98;
  uint64_t v99;
  NSObject *v100;
  uint64_t v101;
  char v102;
  NSObject *v103;
  char v104;
  NSObject *v105;
  void *v106;
  NSObject *v107;
  uint64_t v108;
  NSObject *v109;
  char v110;
  uint64_t v111;
  NSObject *v112;
  NSObject *v113;
  NSObject *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  NSObject *v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  void *v122;
  void *v123;
  uint64_t v124;
  NSObject *v125;
  NSObject *v126;
  char v127;
  uint64_t v128;
  NSObject *v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  void *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _BYTE *v137;
  uint64_t v138;
  NSObject *v139;
  uint64_t v140;
  NSObject *v141;
  NSObject *v142;
  NSObject *v143;
  void *v144;
  uint64_t v145;
  NSObject *v146;
  uint64_t v147;
  int v148;
  BOOL v149;
  uint64_t v150;
  NSObject *v151;
  NSObject *v152;
  NSObject *v153;
  uint64_t v154;
  NSObject *v155;
  unsigned int v156;
  uint64_t v157;
  NSObject *v158;
  NSObject *v159;
  uint64_t v160;
  NSObject *v161;
  NSObject *v162;
  NSObject *v163;
  char v164;
  uint64_t v165;
  NSObject *v166;
  NSObject *v167;
  NSObject *v168;
  NSObject *v169;
  NSObject *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  char v179;
  id v180;
  int v181;
  uint64_t v182;
  NSObject *v183;
  uint64_t v184;
  NSObject *v185;
  NSObject *v186;
  NSObject *v187;
  void *v188;
  NSObject *v189;
  NSObject *v190;
  char v191;
  id v192;
  uint64_t v193;
  NSObject *v194;
  NSObject *v195;
  NSObject *v196;
  void *v197;
  NSObject *v198;
  NSObject *v199;
  NSObject *v200;
  char v201;
  NSObject *v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  void *v206;
  id v207;
  int v208;
  id v209;
  NSObject *v210;
  uint64_t v211;
  uint64_t v212;
  int v213;
  NSObject *v214;
  void *v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  id v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  id v224;
  id v225;
  id v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  id v231;
  id v232;
  id v233;
  id v234;
  id v235;
  uint8_t v236[128];
  uint8_t buf[4];
  NSObject *v238;
  __int16 v239;
  _BYTE v240[10];
  NSObject *v241;
  __int16 v242;
  NSObject *v243;
  uint64_t v244;
  uint64_t v245;
  _BYTE v246[128];
  uint64_t v247;

  v1 = a1;
  v247 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSObject path](v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(v1 + 32), "itemScopedIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v7, *(_QWORD *)(v1 + 48), 1);
      v8 = objc_claimAutoreleasedReturnValue();
      v217 = v1;
      v218 = objc_msgSend(*(id *)(v1 + 32), "resourceType");
      v210 = v3;
      v200 = v8;
      if (v8)
      {
        v9 = (_BYTE *)MEMORY[0x1E0D115D0];
        if (!*MEMORY[0x1E0D115D0])
        {
          v10 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
          if (v10 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v11 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v10 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v11 = objc_claimAutoreleasedReturnValue();
          }
          v18 = v11;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v19 = *(_QWORD *)(v217 + 32);
            *(_DWORD *)buf = 138412546;
            v238 = v8;
            v239 = 2112;
            *(_QWORD *)v240 = v19;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "Updating owningAsset %@ with resource %@", buf, 0x16u);
          }

        }
        v20 = objc_msgSend(*(id *)(v217 + 40), "_placeHolderKindFromCPLResourceType:", v218);
        v21 = -[NSObject cloudPlaceholderKind](v8, "cloudPlaceholderKind");
        if (v218 == 18 || v218 == 24)
        {
          if (!*v9)
          {
            v22 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
            if (v22 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v23 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v22 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v23 = objc_claimAutoreleasedReturnValue();
            }
            v28 = v23;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v29 = -[NSObject cloudPlaceholderKind](v8, "cloudPlaceholderKind");
              *(_DWORD *)buf = 67109120;
              LODWORD(v238) = v29;
              _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "Not changing the cloud placeholder kind (%d), since we are only downloading the video complement", buf, 8u);
            }

          }
        }
        else if (v21 && v21 < (int)v20)
        {
          if (!*v9)
          {
            v24 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
            if (v24 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v25 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v24 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v25 = objc_claimAutoreleasedReturnValue();
            }
            v132 = v25;
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              LODWORD(v238) = v20;
              _os_log_impl(&dword_199541000, v132, OS_LOG_TYPE_DEBUG, "Setting cloud placeholder kind to %d", buf, 8u);
            }

            v8 = v200;
          }
          -[NSObject setCloudPlaceholderKind:](v8, "setCloudPlaceholderKind:", v20);
        }
        objc_msgSend(*(id *)(v217 + 48), "thumbnailManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSObject isCloudPlaceholder](v8, "isCloudPlaceholder"))
        {
          objc_msgSend(v30, "thumbnailJPEGPathForPhoto:", v8);
          v31 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v31 = 0;
        }
        -[NSObject thumbnailIdentifier](v8, "thumbnailIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v216 = v30;
        objc_msgSend(v30, "beginThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = -[NSObject hasMasterThumb](v8, "hasMasterThumb") ^ 1;
        if ((v34 & 1) != 0 || v218 == 5)
        {
          if (!*v9)
          {
            v37 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
            if (v37 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v38 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v37 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v38 = objc_claimAutoreleasedReturnValue();
            }
            v43 = v38;
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              v238 = v200;
              v239 = 1024;
              *(_DWORD *)v240 = v34;
              *(_WORD *)&v240[4] = 1024;
              *(_DWORD *)&v240[6] = v218 == 5;
              _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEBUG, "Generating new thumbnails for asset %@ (missingThumbnail %d, isPlaceholderThumbnail %d)", buf, 0x18u);
            }

          }
          v8 = v200;
          objc_msgSend(*(id *)(v217 + 40), "_updateAsset:withImageFileURL:", v200, v210);
        }
        else
        {
          v8 = v200;
          if (!*v9)
          {
            v35 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
            if (v35 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v36 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v35 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v36 = objc_claimAutoreleasedReturnValue();
            }
            v39 = v36;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              -[NSObject cloudAssetGUID](v200, "cloudAssetGUID");
              v40 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v238 = v40;
              _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEBUG, "Skipping thumbnail generation for asset with cloudAssetGUID %@", buf, 0xCu);

              v8 = v200;
            }

          }
          if (v31
            && (-[NSObject isCloudPlaceholder](v8, "isCloudPlaceholder") & 1) == 0
            && -[NSObject isVideo](v8, "isVideo")
            && objc_msgSend(v4, "fileExistsAtPath:", v31)
            && -[NSObject isVideo](v8, "isVideo"))
          {
            v41 = *(void **)(v217 + 40);
            -[NSObject pathForVideoPreviewFile](v8, "pathForVideoPreviewFile");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "_linkFileFrom:to:", v31, v42);

            v8 = v200;
          }
        }
        -[NSObject thumbnailIdentifier](v8, "thumbnailIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "endThumbnailSafePropertyUpdatesOnAssetThumbnailIdentifier:withToken:", v44, v33);

        if (v218 == 5)
          goto LABEL_236;
        if (v218 == 27)
        {
          v235 = 0;
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v210, 0, &v235);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v235;
          if (v45)
          {
            -[NSObject additionalAttributes](v200, "additionalAttributes");
            v47 = v7;
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "setMediaMetadataData:", v45);

            v7 = v47;
            +[PLManagedAsset processAdjustedMediaMetadataForAsset:](PLManagedAsset, "processAdjustedMediaMetadataForAsset:", v200);
          }
          else if (!*v9)
          {
            v55 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
            v56 = v7;
            if (v55 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v57 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v55 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v57 = objc_claimAutoreleasedReturnValue();
            }
            v126 = v57;
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v238 = v210;
              v239 = 2112;
              *(_QWORD *)v240 = v46;
              _os_log_impl(&dword_199541000, v126, OS_LOG_TYPE_ERROR, "Unable to read metadata file at url: %@, error: %@", buf, 0x16u);
            }

            v7 = v56;
          }

LABEL_236:
          v234 = 0;
          v127 = objc_msgSend(v4, "removeItemAtURL:error:", v210, &v234);
          v50 = v234;
          if ((v127 & 1) != 0 || *v9)
            goto LABEL_252;
          v128 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
          if (v128 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v129 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v128 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v129 = objc_claimAutoreleasedReturnValue();
          }
          v125 = v129;
          if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
          {
            v130 = *(NSObject **)(v217 + 32);
            *(_DWORD *)buf = 138412546;
            v238 = v130;
            v239 = 2112;
            *(_QWORD *)v240 = v50;
            _os_log_impl(&dword_199541000, v125, OS_LOG_TYPE_ERROR, "Unable to remove cloud resource %@: %@", buf, 0x16u);
          }
LABEL_251:

LABEL_252:
          v8 = v200;
LABEL_253:

          v3 = v210;
          goto LABEL_254;
        }
        -[NSObject assetResourceForCPLType:](v8, "assetResourceForCPLType:");
        v49 = objc_claimAutoreleasedReturnValue();
        if (!v49)
        {
          if (*v9)
          {
            v50 = 0;
            goto LABEL_253;
          }
          v58 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
          if (v58 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v59 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v58 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v59 = objc_claimAutoreleasedReturnValue();
          }
          v125 = v59;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", v218);
            v131 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v238 = v131;
            v239 = 2112;
            *(_QWORD *)v240 = v7;
            _os_log_impl(&dword_199541000, v125, OS_LOG_TYPE_DEFAULT, "Didn't find resource type: %@ in asset: %@ we tried to mark as available", buf, 0x16u);

          }
          v50 = 0;
          goto LABEL_251;
        }
        v50 = (id)v49;
        if (_os_feature_enabled_impl())
        {
          v199 = v7;
          objc_msgSend(*(id *)(v217 + 48), "pathManager");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = +[PLLockedResourceTransferRecovery isStaleResourceURL:asset:resource:pathManager:](PLLockedResourceTransferRecovery, "isStaleResourceURL:asset:resource:pathManager:", v210, v200, v50, v51);

          if (v52)
          {
            if (!*v9)
            {
              v53 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
              if (v53 == 2)
              {
                __CPLAppLibraryOSLogDomain();
                v54 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (v53 == 1)
                  __CPLSyndicationOSLogDomain();
                else
                  __CPLSystemLibraryOSLogDomain();
                v54 = objc_claimAutoreleasedReturnValue();
              }
              v169 = v54;
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject uuid](v200, "uuid");
                v170 = objc_claimAutoreleasedReturnValue();
                -[NSObject path](v210, "path");
                v171 = v2;
                v172 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v238 = v170;
                v239 = 2112;
                *(_QWORD *)v240 = v172;
                _os_log_impl(&dword_199541000, v169, OS_LOG_TYPE_DEFAULT, "Detected asset resource download for asset %{public}@ to stale bundle scope location: '%@'", buf, 0x16u);

                v2 = v171;
              }

            }
            v206 = v4;
            v173 = v2;
            v174 = -[NSObject bundleScope](v200, "bundleScope");
            objc_msgSend(*(id *)(v217 + 48), "pathManager");
            v175 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLLockedResourceTransferRecovery destinationURLForResource:asset:bundleScope:pathManager:](PLLockedResourceTransferRecovery, "destinationURLForResource:asset:bundleScope:pathManager:", v50, v200, v174, v175);
            v125 = objc_claimAutoreleasedReturnValue();

            v176 = (void *)MEMORY[0x1E0D73208];
            objc_msgSend(*(id *)(v217 + 48), "pathManager");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "capabilities");
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            v233 = 0;
            v179 = objc_msgSend(v176, "secureMoveItemAtURL:toURL:capabilities:error:", v210, v125, v178, &v233);
            v180 = v233;

            v181 = *v9;
            if ((v179 & 1) == 0)
            {
              if (!*v9)
              {
                v184 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
                if (v184 == 2)
                {
                  __CPLAppLibraryOSLogDomain();
                  v185 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v184 == 1)
                    __CPLSyndicationOSLogDomain();
                  else
                    __CPLSystemLibraryOSLogDomain();
                  v185 = objc_claimAutoreleasedReturnValue();
                }
                v189 = v185;
                if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
                {
                  v190 = *(NSObject **)(v217 + 32);
                  *(_DWORD *)buf = 138412546;
                  v238 = v190;
                  v239 = 2112;
                  *(_QWORD *)v240 = v180;
                  _os_log_impl(&dword_199541000, v189, OS_LOG_TYPE_ERROR, "Unable to move stale cloud resource %@: %@", buf, 0x16u);
                }

              }
              v232 = 0;
              v191 = objc_msgSend(v206, "removeItemAtURL:error:", v210, &v232);
              v192 = v232;
              if ((v191 & 1) == 0 && !*v9)
              {
                v193 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
                if (v193 == 2)
                {
                  __CPLAppLibraryOSLogDomain();
                  v194 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v193 == 1)
                    __CPLSyndicationOSLogDomain();
                  else
                    __CPLSystemLibraryOSLogDomain();
                  v194 = objc_claimAutoreleasedReturnValue();
                }
                v195 = v194;
                if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
                {
                  v196 = *(NSObject **)(v217 + 32);
                  *(_DWORD *)buf = 138412546;
                  v238 = v196;
                  v239 = 2112;
                  *(_QWORD *)v240 = v192;
                  _os_log_impl(&dword_199541000, v195, OS_LOG_TYPE_ERROR, "Unable to remove cloud resource %@: %@", buf, 0x16u);
                }

              }
              v2 = v173;
              v4 = v206;
              v7 = v199;
              goto LABEL_251;
            }
            v2 = v173;
            v120 = v217;
            if (!v181)
            {
              v182 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
              if (v182 == 2)
              {
                __CPLAppLibraryOSLogDomain();
                v183 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (v182 == 1)
                  __CPLSyndicationOSLogDomain();
                else
                  __CPLSystemLibraryOSLogDomain();
                v183 = objc_claimAutoreleasedReturnValue();
              }
              v186 = v183;
              if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject uuid](v200, "uuid");
                v187 = objc_claimAutoreleasedReturnValue();
                -[NSObject path](v125, "path");
                v188 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v238 = v187;
                v239 = 2112;
                *(_QWORD *)v240 = v188;
                _os_log_impl(&dword_199541000, v186, OS_LOG_TYPE_DEFAULT, "Successfully moved stale bundle scope download for asset %{public}@ to new path: '%@'", buf, 0x16u);

              }
              v2 = v173;
            }

            v210 = v125;
            v4 = v206;
            v7 = v199;
            goto LABEL_224;
          }
          v7 = v199;
        }
        v120 = v217;
LABEL_224:
        v121 = v7;
        -[NSObject path](v210, "path");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "markAsLocallyAvailableWithFilePath:", v122);

        if (*(_BYTE *)(v120 + 56))
        {
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setCloudLastOnDemandDownloadDate:", v123);

          v124 = *(unsigned __int8 *)(v120 + 56);
        }
        else
        {
          v124 = 0;
        }
        objc_msgSend(*(id *)(v120 + 40), "cacheDeleteSupport");
        v125 = objc_claimAutoreleasedReturnValue();
        -[NSObject markResourceAsPurgeable:withUrgency:](v125, "markResourceAsPurgeable:withUrgency:", v50, v124);
        v7 = v121;
        goto LABEL_251;
      }
      +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v7, 1, *(_QWORD *)(v1 + 48));
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v216)
      {
        if (*MEMORY[0x1E0D115D0])
        {

          goto LABEL_256;
        }
        v26 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
        if (v26 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v27 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v26 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v27 = objc_claimAutoreleasedReturnValue();
        }
        v31 = v27;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v119 = *(_QWORD *)(v1 + 32);
          *(_DWORD *)buf = 138412546;
          v238 = v7;
          v239 = 2112;
          *(_QWORD *)v240 = v119;
          _os_log_impl(&dword_199541000, v31, OS_LOG_TYPE_DEFAULT, "can't find the master with identifier %@ for resource %@", buf, 0x16u);
        }
        v216 = 0;
        goto LABEL_254;
      }
      v197 = v2;
      v198 = v7;
      v205 = v4;
      if (v218 == 10)
      {
        v231 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 0, &v231);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v16 = v231;
        if (v15)
        {
          objc_msgSend(v216, "mediaMetadata");
          v17 = objc_claimAutoreleasedReturnValue();
          -[NSObject setValue:forKey:](v17, "setValue:forKey:", v15, CFSTR("data"));
        }
        else
        {
          if (*MEMORY[0x1E0D115D0])
          {
            v15 = 0;
LABEL_270:
            v201 = 0;
LABEL_271:

            v213 = 0;
LABEL_272:
            v222 = 0u;
            v223 = 0u;
            v220 = 0u;
            v221 = 0u;
            objc_msgSend(v216, "assets");
            v133 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v220, v236, 16);
            if (!v134)
            {
LABEL_346:

              if ((v201 & 1) == 0 && v218 != 10 && v218 != 5)
              {
                v2 = v197;
                v7 = v198;
                v4 = v205;
                v8 = 0;
                goto LABEL_255;
              }
              v219 = 0;
              v4 = v205;
              v164 = objc_msgSend(v205, "removeItemAtURL:error:", v3, &v219);
              v31 = v219;
              v2 = v197;
              v7 = v198;
              v8 = 0;
              if ((v164 & 1) == 0 && !*MEMORY[0x1E0D115D0])
              {
                v165 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
                if (v165 == 2)
                {
                  __CPLAppLibraryOSLogDomain();
                  v166 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v165 == 1)
                    __CPLSyndicationOSLogDomain();
                  else
                    __CPLSystemLibraryOSLogDomain();
                  v166 = objc_claimAutoreleasedReturnValue();
                }
                v167 = v166;
                if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
                {
                  v168 = *(NSObject **)(v1 + 32);
                  *(_DWORD *)buf = 138412546;
                  v238 = v168;
                  v239 = 2112;
                  *(_QWORD *)v240 = v31;
                  _os_log_impl(&dword_199541000, v167, OS_LOG_TYPE_ERROR, "Unable to remove cloud resource %@: %@", buf, 0x16u);
                }

              }
LABEL_254:

LABEL_255:
LABEL_256:

LABEL_257:
              goto LABEL_258;
            }
            v135 = v134;
            v136 = *(_QWORD *)v221;
            v137 = (_BYTE *)MEMORY[0x1E0D115D0];
LABEL_274:
            v138 = 0;
            while (1)
            {
              if (*(_QWORD *)v221 != v136)
                objc_enumerationMutation(v133);
              v139 = *(NSObject **)(*((_QWORD *)&v220 + 1) + 8 * v138);
              if (!v139)
                goto LABEL_344;
              if (!*v137)
              {
                v140 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
                if (v140 == 2)
                {
                  __CPLAppLibraryOSLogDomain();
                  v141 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v140 == 1)
                    __CPLSyndicationOSLogDomain();
                  else
                    __CPLSystemLibraryOSLogDomain();
                  v141 = objc_claimAutoreleasedReturnValue();
                }
                v142 = v141;
                if (os_log_type_enabled(v141, OS_LOG_TYPE_DEBUG))
                {
                  -[NSObject uuid](v139, "uuid");
                  v143 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v238 = v143;
                  v239 = 2112;
                  *(_QWORD *)v240 = v216;
                  _os_log_impl(&dword_199541000, v142, OS_LOG_TYPE_DEBUG, "Asset %@ mapped to master %@ during duplicate copy", buf, 0x16u);

                  v1 = v217;
                }

              }
              -[NSObject assetResourceForCPLType:](v139, "assetResourceForCPLType:", v218);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              if (v144)
                break;
              v147 = objc_msgSend(*(id *)(v1 + 40), "_placeHolderKindFromCPLResourceType:", v218);
              v148 = -[NSObject cloudPlaceholderKind](v139, "cloudPlaceholderKind");
              if (v148)
                v149 = v148 < (int)v147;
              else
                v149 = 0;
              if (v149)
              {
                if (!*v137)
                {
                  v150 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
                  if (v150 == 2)
                  {
                    __CPLAppLibraryOSLogDomain();
                    v151 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    if (v150 == 1)
                      __CPLSyndicationOSLogDomain();
                    else
                      __CPLSystemLibraryOSLogDomain();
                    v151 = objc_claimAutoreleasedReturnValue();
                  }
                  v155 = v151;
                  if (os_log_type_enabled(v151, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v238) = v147;
                    _os_log_impl(&dword_199541000, v155, OS_LOG_TYPE_DEBUG, "Setting cloud placeholder kind to %d during duplicate copy", buf, 8u);
                  }

                  v3 = v210;
                }
                -[NSObject setCloudPlaceholderKind:](v139, "setCloudPlaceholderKind:", v147);
              }
              v156 = ((_DWORD)v147 != 5) & ~-[NSObject hasMasterThumb](v139, "hasMasterThumb");
              if ((v213 | v156) == 1)
              {
                if (!*v137)
                {
                  v157 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
                  if (v157 == 2)
                  {
                    __CPLAppLibraryOSLogDomain();
                    v158 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    if (v157 == 1)
                      __CPLSyndicationOSLogDomain();
                    else
                      __CPLSystemLibraryOSLogDomain();
                    v158 = objc_claimAutoreleasedReturnValue();
                  }
                  v159 = v158;
                  if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412802;
                    v238 = v139;
                    v239 = 1024;
                    *(_DWORD *)v240 = v156;
                    *(_WORD *)&v240[4] = 1024;
                    *(_DWORD *)&v240[6] = v213;
                    _os_log_impl(&dword_199541000, v159, OS_LOG_TYPE_DEBUG, "Generating new thumbnails for asset %@ during duplicate copy (missingThumbnail %d, isThumbnail %d)", buf, 0x18u);
                  }

                }
                objc_msgSend(*(id *)(v217 + 40), "_updateAsset:withImageFileURL:", v139, v3);
              }
              if (v218 == 1)
              {
                v1 = v217;
                if (!*v137)
                {
                  v160 = *(_QWORD *)(*(_QWORD *)(v217 + 40) + 96);
                  if (v160 == 2)
                  {
                    __CPLAppLibraryOSLogDomain();
                    v161 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    if (v160 == 1)
                      __CPLSyndicationOSLogDomain();
                    else
                      __CPLSystemLibraryOSLogDomain();
                    v161 = objc_claimAutoreleasedReturnValue();
                  }
                  v162 = v161;
                  if (os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
                  {
                    -[NSObject uuid](v139, "uuid");
                    v163 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v238 = v163;
                    _os_log_impl(&dword_199541000, v162, OS_LOG_TYPE_DEBUG, "Persisting metadata for %@ during duplicate copy", buf, 0xCu);

                    v1 = v217;
                  }

                }
                -[NSObject persistMetadataToFilesystem](v139, "persistMetadataToFilesystem");
                goto LABEL_343;
              }
              v1 = v217;
              if (v218 != 2)
                goto LABEL_309;
              objc_msgSend(*(id *)(v217 + 40), "_updateThumbnailDataForAsset:withImageFileURL:", v139, v3);
LABEL_343:

LABEL_344:
              if (v135 == ++v138)
              {
                v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v220, v236, 16);
                if (!v135)
                  goto LABEL_346;
                goto LABEL_274;
              }
            }
            if (!*v137)
            {
              v145 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
              if (v145 == 2)
              {
                __CPLAppLibraryOSLogDomain();
                v146 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (v145 == 1)
                  __CPLSyndicationOSLogDomain();
                else
                  __CPLSystemLibraryOSLogDomain();
                v146 = objc_claimAutoreleasedReturnValue();
              }
              v152 = v146;
              if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
              {
                -[NSObject uuid](v139, "uuid");
                v153 = objc_claimAutoreleasedReturnValue();
                v154 = *(_QWORD *)(v217 + 32);
                *(_DWORD *)buf = 138412546;
                v238 = v153;
                v239 = 2112;
                *(_QWORD *)v240 = v154;
                _os_log_impl(&dword_199541000, v152, OS_LOG_TYPE_DEFAULT, "Skipping update duplicate asset %@ with master resource %@", buf, 0x16u);

                v1 = v217;
              }

            }
LABEL_309:
            if (v218 == 10)
              +[PLManagedAsset processMediaMetadataForAsset:withCloudMaster:](PLManagedAsset, "processMediaMetadataForAsset:withCloudMaster:", v139, v216);
            goto LABEL_343;
          }
          v117 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
          if (v117 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v118 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v117 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v118 = objc_claimAutoreleasedReturnValue();
          }
          v17 = v118;
          if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v238 = v3;
            v239 = 2112;
            *(_QWORD *)v240 = v16;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to read metadata file at url: %@, error: %@", buf, 0x16u);
          }
        }

        goto LABEL_270;
      }
      if (v218 == 5)
      {
        v201 = 0;
        v213 = 1;
        goto LABEL_272;
      }
      objc_msgSend(*(id *)(v1 + 40), "pathManager");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = objc_msgSend(v60, "isUBF");

      objc_msgSend(v216, "rm_cloudResourcesForResourceType:", v218);
      v227 = 0u;
      v228 = 0u;
      v229 = 0u;
      v230 = 0u;
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v212 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v227, v246, 16);
      if (!v212)
      {
        v201 = 0;
        goto LABEL_229;
      }
      v201 = 0;
      v211 = *(_QWORD *)v228;
      v203 = *MEMORY[0x1E0CB2AC0];
      v204 = *MEMORY[0x1E0CB2AD8];
      v207 = v15;
LABEL_109:
      v61 = 0;
      while (1)
      {
        if (*(_QWORD *)v228 != v211)
          objc_enumerationMutation(v15);
        v62 = *(NSObject **)(*((_QWORD *)&v227 + 1) + 8 * v61);
        -[NSObject path](v3, "path");
        v63 = objc_claimAutoreleasedReturnValue();
        -[NSObject cplFileURL](v62, "cplFileURL");
        v215 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v215, "path");
        v64 = objc_claimAutoreleasedReturnValue();
        v65 = (void *)v64;
        if (v63)
        {
          if (v64)
            break;
        }
        if (!*MEMORY[0x1E0D115D0])
        {
          v71 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
          if (v71 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v72 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v71 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v72 = objc_claimAutoreleasedReturnValue();
          }
          v73 = v72;
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            v74 = *(NSObject **)(v1 + 32);
            *(_DWORD *)buf = 138412546;
            v238 = v74;
            v239 = 2112;
            *(_QWORD *)v240 = v62;
            _os_log_impl(&dword_199541000, v73, OS_LOG_TYPE_ERROR, "Missing file path, downloaded resource %@ local resource %@", buf, 0x16u);
          }
          goto LABEL_208;
        }
LABEL_209:

        if (v212 == ++v61)
        {
          v212 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v227, v246, 16);
          if (!v212)
          {
LABEL_229:
            v16 = v15;
            goto LABEL_271;
          }
          goto LABEL_109;
        }
      }
      if (_os_feature_enabled_impl())
      {
        -[NSObject asset](v62, "asset");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 48), "pathManager");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = +[PLLockedResourceTransferRecovery isStaleResourceURL:asset:resource:pathManager:](PLLockedResourceTransferRecovery, "isStaleResourceURL:asset:resource:pathManager:", v3, v66, v62, v67);

        if (v68)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            v69 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
            if (v69 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v70 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v69 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v70 = objc_claimAutoreleasedReturnValue();
            }
            v75 = v70;
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(0, "uuid");
              v76 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v238 = v76;
              v239 = 2112;
              *(_QWORD *)v240 = v63;
              _os_log_impl(&dword_199541000, v75, OS_LOG_TYPE_DEFAULT, "Detected master resource download for asset %{public}@ to stale bundle scope location: '%@'", buf, 0x16u);

            }
          }
          v201 = 1;
        }
      }
      v214 = v63;
      if ((v208 & 1) != 0)
      {
        objc_msgSend(v216, "originalFilenameForResourceType:filePath:", -[NSObject cplType](v62, "cplType"), v65);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject uniformTypeIdentifier](v62, "uniformTypeIdentifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "identifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = objc_alloc(MEMORY[0x1E0D73278]);
        -[NSObject asset](v62, "asset");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "uuid");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend(0, "bundleScope");
        v84 = -[NSObject resourceType](v62, "resourceType");
        v85 = -[NSObject recipeID](v62, "recipeID");
        v86 = v84;
        v63 = v214;
        v87 = (PLValidatedExternalResource *)objc_msgSend(v80, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v82, v83, v79, 0, v86, v85, v77);

        if ((-[NSObject isEqualToString:](v214, "isEqualToString:", v65) & 1) != 0)
        {
          v1 = v217;
          objc_msgSend(*(id *)(v217 + 40), "pathManager");
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "setExtendedAttributesWithIdentifier:andURL:", v87, v215);

          v63 = v214;
          v3 = v210;
          v4 = v205;
LABEL_202:

          if (objc_msgSend(v4, "fileExistsAtPath:", v65))
          {
            -[NSObject markAsLocallyAvailableWithFilePath:](v62, "markAsLocallyAvailableWithFilePath:", v65);
            v15 = v207;
            if (*(_BYTE *)(v1 + 56))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v115 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setCloudLastOnDemandDownloadDate:](v62, "setCloudLastOnDemandDownloadDate:", v115);

              v63 = v214;
              v116 = *(unsigned __int8 *)(v1 + 56);
            }
            else
            {
              v116 = 0;
            }
            objc_msgSend(*(id *)(v1 + 40), "cacheDeleteSupport");
            v73 = objc_claimAutoreleasedReturnValue();
            -[NSObject markResourceAsPurgeable:withUrgency:](v73, "markResourceAsPurgeable:withUrgency:", v62, v116);
LABEL_208:

            goto LABEL_209;
          }
          v15 = v207;
          goto LABEL_209;
        }
        v90 = 0;
        v3 = v210;
        v4 = v205;
        v1 = v217;
        goto LABEL_147;
      }
      v89 = v62;
      if (-[NSObject resourceType](v89, "resourceType") == 4
        && !-[NSObject version](v89, "version"))
      {
        v110 = -[NSObject recipeID](v89, "recipeID");

        if ((v110 & 1) == 0)
        {
          v90 = objc_alloc_init(PLValidatedExternalResource);
          -[PLValidatedExternalResource setResourceType:](v90, "setResourceType:", 4);
          -[PLValidatedExternalResource setFileURL:](v90, "setFileURL:", v215);
          goto LABEL_143;
        }
      }
      else
      {

      }
      v90 = 0;
LABEL_143:
      if ((-[NSObject isEqualToString:](v63, "isEqualToString:", v65) & 1) != 0)
      {
        -[PLValidatedExternalResource persistResourceTypeToFileURL](v90, "persistResourceTypeToFileURL");
        v87 = v90;
        goto LABEL_202;
      }
      v87 = 0;
LABEL_147:
      if (!*MEMORY[0x1E0D115D0])
      {
        v91 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
        if (v91 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v92 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v91 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v92 = objc_claimAutoreleasedReturnValue();
        }
        v93 = v92;
        if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v238 = v63;
          v239 = 2112;
          *(_QWORD *)v240 = v65;
          _os_log_impl(&dword_199541000, v93, OS_LOG_TYPE_DEBUG, "Resource is downloaded to %@ during duplicate copy, copying to %@", buf, 0x16u);
        }

      }
      v244 = v204;
      v245 = v203;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v245, &v244, 1);
      v94 = objc_claimAutoreleasedReturnValue();
      v95 = v63;
      v96 = (void *)v94;
      v226 = 0;
      v97 = objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v94, v95, &v226);
      v209 = v226;

      if ((v97 & 1) == 0)
      {
        PLPhotoSharingGetLog();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v238 = v214;
          v239 = 2112;
          *(_QWORD *)v240 = v209;
          _os_log_impl(&dword_199541000, v98, OS_LOG_TYPE_ERROR, "Unable to assign data protection to \"%@\" during duplicate copy: %@", buf, 0x16u);
        }

      }
      if ((objc_msgSend(v4, "fileExistsAtPath:", v65) & 1) != 0)
      {
        v63 = v214;
        if (*MEMORY[0x1E0D115D0])
        {
LABEL_201:

          goto LABEL_202;
        }
        v99 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
        if (v99 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v100 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v99 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v100 = objc_claimAutoreleasedReturnValue();
        }
        v103 = v100;
        if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", objc_msgSend(*(id *)(v1 + 32), "resourceType"));
          v113 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v238 = v113;
          v239 = 2112;
          *(_QWORD *)v240 = v65;
          *(_WORD *)&v240[8] = 2112;
          v241 = v62;
          _os_log_impl(&dword_199541000, v103, OS_LOG_TYPE_DEBUG, "File exist at path %@ during duplicate copy on master for type %@, will not overwrite, localResource: %@", buf, 0x20u);

          v63 = v214;
        }
LABEL_200:

        goto LABEL_201;
      }
      objc_msgSend(v65, "stringByDeletingLastPathComponent");
      v101 = objc_claimAutoreleasedReturnValue();
      v225 = 0;
      v202 = v101;
      v102 = objc_msgSend(v4, "createDirectoryIfNeededAtPath:error:");
      v103 = v225;
      if ((v102 & 1) != 0)
      {
        v224 = 0;
        v104 = objc_msgSend(v4, "copyItemAtPath:toPath:error:", v214, v65, &v224);
        v105 = v224;
        if ((v104 & 1) != 0)
        {
          if (v208)
          {
            objc_msgSend(*(id *)(v1 + 40), "pathManager");
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "setExtendedAttributesWithIdentifier:andURL:", v87, v215);

          }
          else
          {
            -[PLValidatedExternalResource persistResourceTypeToFileURL](v90, "persistResourceTypeToFileURL");
          }
        }
        else if (!*MEMORY[0x1E0D115D0])
        {
          v111 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
          if (v111 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v114 = objc_claimAutoreleasedReturnValue();
            v112 = v214;
          }
          else
          {
            v112 = v214;
            if (v111 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v114 = objc_claimAutoreleasedReturnValue();
          }
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138413058;
            v238 = v112;
            v239 = 2112;
            *(_QWORD *)v240 = v65;
            *(_WORD *)&v240[8] = 2112;
            v241 = v105;
            v242 = 2112;
            v243 = v62;
            _os_log_impl(&dword_199541000, v114, OS_LOG_TYPE_ERROR, "Failed to copy from %@ to %@ during duplicate copy on master. Error: %@, localResource: %@", buf, 0x2Au);
          }

        }
        v107 = v202;
      }
      else
      {
        v107 = v202;
        if (*MEMORY[0x1E0D115D0])
        {
LABEL_199:

          v63 = v214;
          v4 = v205;
          goto LABEL_200;
        }
        v108 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
        if (v108 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v109 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v108 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v109 = objc_claimAutoreleasedReturnValue();
        }
        v105 = v109;
        if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v238 = v202;
          v239 = 2112;
          *(_QWORD *)v240 = v103;
          *(_WORD *)&v240[8] = 2112;
          v241 = v62;
          _os_log_impl(&dword_199541000, v105, OS_LOG_TYPE_ERROR, "Failed to create directory %@ during duplicate copy on master. Error: %@, localResource: %@", buf, 0x20u);
        }
      }

      v3 = v210;
      goto LABEL_199;
    }
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v12 = *(_QWORD *)(*(_QWORD *)(v1 + 40) + 96);
    if (v12 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(NSObject **)(v1 + 32);
      *(_DWORD *)buf = 138412546;
      v238 = v14;
      v239 = 2112;
      *(_QWORD *)v240 = v3;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "downloaded resource file not found for resource %@ at %@", buf, 0x16u);
    }
    goto LABEL_257;
  }
LABEL_258:

}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke(id *a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    v3 = *((_QWORD *)a1[4] + 12);
    if (v3 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = a1[5];
      *(_DWORD *)buf = 138412290;
      v36 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Updating local stale resource for %@", buf, 0xCu);
    }

  }
  objc_msgSend(a1[5], "itemScopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a1[5], "resourceType");
  +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v7, a1[6], 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1[4], "cplLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_388;
    v28[3] = &unk_1E3663048;
    v11 = a1[6];
    v12 = a1[4];
    v29 = v11;
    v30 = v12;
    v31 = v7;
    v32 = a1[5];
    v33 = v9;
    v34 = v8;
    objc_msgSend(v10, "getCloudCacheForRecordWithScopedIdentifier:completionHandler:", v31, v28);

    v13 = v29;
  }
  else
  {
    +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v7, 1, a1[6]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(a1[4], "cplLibrary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_389;
      v20[3] = &unk_1E3663070;
      v15 = a1[6];
      v16 = a1[4];
      v21 = v15;
      v22 = v16;
      v23 = v7;
      v24 = a1[5];
      v26 = 0;
      v27 = v8;
      v25 = v13;
      objc_msgSend(v14, "getCloudCacheForRecordWithScopedIdentifier:completionHandler:", v23, v20);

      v17 = v21;
    }
    else
    {
      if (*v2)
      {
        v13 = 0;
        goto LABEL_25;
      }
      v18 = *((_QWORD *)a1[4] + 12);
      if (v18 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v18 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v17 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "Unable to find local asset/master with itemScopedIdentifier %@", buf, 0xCu);
      }
    }

  }
LABEL_25:

}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_388(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_2;
  v13[3] = &unk_1E3664C38;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v14 = v6;
  v15 = v7;
  v16 = *(id *)(a1 + 48);
  v17 = v5;
  v18 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v19 = v9;
  v20 = v10;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v8, "performTransaction:", v13);

}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_389(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_2_390;
  v14[3] = &unk_1E3662E80;
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v15 = v6;
  v16 = v7;
  v17 = *(id *)(a1 + 48);
  v18 = v5;
  v19 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v11 = *(void **)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 80);
  v20 = v9;
  v22 = v10;
  v21 = v11;
  v12 = v5;
  v13 = v6;
  objc_msgSend(v8, "performTransaction:", v14);

}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_2_390(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _BYTE *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (*MEMORY[0x1E0D115D0])
      return;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v16 = *(void **)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v41 = v16;
      v42 = 2112;
      v43 = v17;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to get cloud cache for master record %@: %@", buf, 0x16u);
    }
  }
  else
  {
    v4 = *(id *)(a1 + 56);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[NSObject resources](v4, "resources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v35;
LABEL_9:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        v11 = objc_msgSend(0, "resourceType");
        if (v11 == objc_msgSend(*(id *)(a1 + 64), "resourceType"))
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
          if (v7)
            goto LABEL_9;
          goto LABEL_15;
        }
      }
      v12 = v10;

      if (!v12)
        goto LABEL_53;
      v13 = (_BYTE *)MEMORY[0x1E0D115D0];
      if (!*MEMORY[0x1E0D115D0])
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        if (v14 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v14 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v15 = objc_claimAutoreleasedReturnValue();
        }
        v18 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v12;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Updating local stale master resource with %@", buf, 0xCu);
        }

      }
      v29 = v4;
      objc_msgSend(*(id *)(a1 + 72), "rm_cloudResourcesForResourceType:", *(_QWORD *)(a1 + 88));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (v24 && (objc_msgSend(v24, "isLocallyAvailable") & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 80), "storedResourceForCPLResource:asset:adjusted:", v12, *(_QWORD *)(a1 + 80), 0);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (!*v13)
              {
                v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
                if (v26 == 2)
                {
                  __CPLAppLibraryOSLogDomain();
                  v27 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v26 == 1)
                    __CPLSyndicationOSLogDomain();
                  else
                    __CPLSystemLibraryOSLogDomain();
                  v27 = objc_claimAutoreleasedReturnValue();
                }
                v28 = v27;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v41 = v25;
                  _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "Updated local stale master resource to %@", buf, 0xCu);
                }

              }
            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v21);
      }

      v4 = v29;
    }
    else
    {
LABEL_15:
      v12 = v5;
    }

  }
LABEL_53:

}

void __81__PLCloudPhotoLibraryManager__updateLocalStaleResourceWithCPLResource_inLibrary___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if (*MEMORY[0x1E0D115D0])
      return;
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v15 = *(void **)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v30 = v15;
      v31 = 2112;
      v32 = v16;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Failed to get cloud cache for asset record %@: %@", buf, 0x16u);
    }
  }
  else
  {
    v4 = *(id *)(a1 + 56);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[NSObject resources](v4, "resources", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "resourceType");
          if (v11 == objc_msgSend(*(id *)(a1 + 64), "resourceType"))
          {
            v12 = (_BYTE *)MEMORY[0x1E0D115D0];
            if (!*MEMORY[0x1E0D115D0])
            {
              v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
              if (v13 == 2)
              {
                __CPLAppLibraryOSLogDomain();
                v14 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                if (v13 == 1)
                  __CPLSyndicationOSLogDomain();
                else
                  __CPLSystemLibraryOSLogDomain();
                v14 = objc_claimAutoreleasedReturnValue();
              }
              v17 = v14;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v30 = v10;
                _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Updating local stale asset resource with %@", buf, 0xCu);
              }

            }
            objc_msgSend(*(id *)(a1 + 72), "assetResourceForCPLType:", *(_QWORD *)(a1 + 80));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = v18;
            if (v18 && (objc_msgSend(v18, "isLocallyAvailable") & 1) == 0)
            {
              objc_msgSend(*(id *)(a1 + 72), "storedResourceForCPLResource:asset:adjusted:", v10, *(_QWORD *)(a1 + 72), 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (!*v12)
              {
                v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
                if (v21 == 2)
                {
                  __CPLAppLibraryOSLogDomain();
                  v22 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v21 == 1)
                    __CPLSyndicationOSLogDomain();
                  else
                    __CPLSystemLibraryOSLogDomain();
                  v22 = objc_claimAutoreleasedReturnValue();
                }
                v23 = v22;
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v30 = v20;
                  _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Updated local stale asset resource to %@", buf, 0xCu);
                }

              }
            }

            goto LABEL_44;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_44:

  }
}

void __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  objc_msgSend(a1[4], "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager libraryManager:providePayloadForComputeStates:inFolderWithURL:completionHandler:]_block_invoke");

  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2;
  v15[3] = &unk_1E36775C0;
  v16 = a1[5];
  v17 = a1[6];
  v6 = a1[7];
  v7 = a1[4];
  v18 = v6;
  v19 = v7;
  v20 = a1[8];
  v21 = v4;
  v22 = a1[9];
  v23 = a1[10];
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_387;
  v9[3] = &unk_1E3676D00;
  v9[4] = a1[4];
  v10 = a1[9];
  v11 = a1[5];
  v12 = a1[10];
  v13 = a1[7];
  v14 = a1[11];
  v8 = v4;
  objc_msgSend(v8, "performTransaction:completionHandler:", v15, v9);

}

void __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "isCancelled"))
        {
          v13 = *(void **)(a1 + 48);
          objc_msgSend(v8, "itemScopedIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v14);

          if (!*MEMORY[0x1E0D115D0])
          {
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 96);
            if (v15 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v16 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v15 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v16 = objc_claimAutoreleasedReturnValue();
            }
            v17 = v16;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v18 = 0;
              _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_ERROR, "[CCSS] providePayloadForComputeStates: Cancelled!", v18, 2u);
            }

          }
          goto LABEL_23;
        }
        +[PLManagedAsset generateFullComputeStateRecordForRecord:payloadHelper:destinationDirectoryURL:inPhotoLibrary:](PLManagedAsset, "generateFullComputeStateRecordForRecord:payloadHelper:destinationDirectoryURL:inPhotoLibrary:", v8, v2, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(*(id *)(a1 + 80), "addObject:", v9);
          v10 = *(void **)(a1 + 88);
          v11 = v9;
        }
        else
        {
          v10 = *(void **)(a1 + 48);
          v11 = v8;
        }
        objc_msgSend(v11, "itemScopedIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v12);

        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_23:

}

uint64_t __110__PLCloudPhotoLibraryManager_libraryManager_providePayloadForComputeStates_inFolderWithURL_completionHandler___block_invoke_387(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v3 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "count");
      v7 = objc_msgSend(*(id *)(a1 + 48), "count");
      v19 = 134218240;
      v20 = v6;
      v21 = 2048;
      v22 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[CCSS] providePayloadForComputeStates: Returning %tu generated compute states payloads for %tu received", (uint8_t *)&v19, 0x16u);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
    v8 = *v2 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v9 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 56);
      v19 = 138412290;
      v20 = v12;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "[CCSS] providePayloadForComputeStates: Payloads generated for: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
    v13 = *v2 == 0;
  else
    v13 = 0;
  if (v13)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v14 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 64);
      v19 = 138412290;
      v20 = v17;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "[CCSS] providePayloadForComputeStates: Payload generation skipped for: %@", (uint8_t *)&v19, 0xCu);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

uint64_t __109__PLCloudPhotoLibraryManager_libraryManager_inMemoryDownloadDidFinishForResourceTransferTask_data_withError___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 248), "reportCompletionForResource:withData:error:", a1[5], a1[6], a1[7]);
}

void __87__PLCloudPhotoLibraryManager_libraryManager_uploadDidProgress_forResourceTransferTask___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (objc_msgSend(MEMORY[0x1E0D11440], "resourceTypeTrackedForUpload:", objc_msgSend(*(id *)(a1 + 32), "resourceType")))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 256);
    objc_msgSend(*(id *)(a1 + 32), "itemScopedIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_DWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileSize");
    v7 = objc_msgSend(*(id *)(a1 + 32), "resourceType");
    LODWORD(v8) = v4;
    objc_msgSend(v2, "updateForMasterResourceUploadWithScopedIdentifier:progress:fileSize:type:", v3, v6, v7, v8);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, 0, 0);
}

void __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke(uint64_t a1)
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
  id v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager libraryManager:uploadDidFinishForResourceTransferTask:withError:]_block_invoke");

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
    objc_msgSend(*(id *)(a1 + 48), "itemScopedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uploadFinishedForMasterResourceWithScopedIdentifier:fileSize:type:withError:", v6, 0, 0, 1);

    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke_384;
    v17 = &unk_1E3677C18;
    v18 = *(id *)(a1 + 48);
    v19 = v4;
    objc_msgSend(v19, "performBlock:", &v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "itemScopedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D11440], "resourceTypeTrackedForUpload:", objc_msgSend(*(id *)(a1 + 48), "resourceType")))
    {
      objc_msgSend(*(id *)(a1 + 48), "identity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "fileSize");

      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 256);
      objc_msgSend(*(id *)(a1 + 48), "itemScopedIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uploadFinishedForMasterResourceWithScopedIdentifier:fileSize:type:withError:", v11, v9, objc_msgSend(*(id *)(a1 + 48), "resourceType"), 0);

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke_2;
    v20[3] = &unk_1E3677998;
    v21 = *(id *)(a1 + 48);
    v22 = v4;
    v23 = v7;
    v24 = *(_QWORD *)(a1 + 32);
    v12 = v7;
    objc_msgSend(v22, "performTransactionAndWait:", v20);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "resetIfNeededWithLibrary:isInitialUpload:", v4, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "initialUpload", v14, v15, v16, v17));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, 0, 0);

}

void __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke_2(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[PLManagedAsset rm_cplResourceWasUploaded:photoLibrary:](PLManagedAsset, "rm_cplResourceWasUploaded:photoLibrary:", a1[4], a1[5]);
  +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", a1[6], 0, a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "allOriginalsAreUploaded"))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = *(_QWORD *)(a1[7] + 96);
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "scopedIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 1024;
        v13 = objc_msgSend(v3, "cloudLocalState");
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "uploadDidFinishForResourceTransferTask: setting master %@ (%d) to uploaded", (uint8_t *)&v10, 0x12u);

      }
    }
    objc_msgSend(v3, "setCloudLocalState:", 3);
    v8 = *(void **)(a1[7] + 256);
    objc_msgSend(v3, "scopedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uploadFinishedForMasterRecordWithScopedIdentifier:didUpdateStatus:", v9, 0);

  }
}

void __94__PLCloudPhotoLibraryManager_libraryManager_uploadDidFinishForResourceTransferTask_withError___block_invoke_384(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "itemScopedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v2, *(_QWORD *)(a1 + 40), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "isPlaceholderAsset");
    v3 = v5;
    if (v4)
    {
      objc_msgSend(v5, "setDestinationAssetCopyStateOnSourceAsset:", 0xFFFFFFFFLL);
      v3 = v5;
    }
  }

}

void __84__PLCloudPhotoLibraryManager_libraryManager_backgroundDownloadDidFinishForResource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemScopedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v2, *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "rm_cplResourceForResourceType:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v2, 1, *(_QWORD *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      objc_msgSend(v17, "assets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "anyObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "rm_cplMasterResourceForResourceType:", objc_msgSend(*(id *)(a1 + 32), "resourceType"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }

    if (v4)
    {
LABEL_3:
      objc_msgSend(v4, "identity");
      v5 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identity");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject fingerPrint](v5, "fingerPrint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fingerPrint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
      {
        -[NSObject fileUTI](v5, "fileUTI");
        v30 = v2;
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fileUTI");
        v10 = v4;
        v11 = v3;
        v12 = v6;
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v9, "isEqualToString:", v13);

        v6 = v12;
        v3 = v11;
        v4 = v10;

        v2 = v30;
        if (v14)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
            if (v15 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v16 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v15 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v16 = objc_claimAutoreleasedReturnValue();
            }
            v28 = v16;
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            {
              v29 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138412290;
              v32 = v29;
              _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "O-----> Rerequesting bg download for resource: %@", buf, 0xCu);
            }

          }
          objc_msgSend(*(id *)(a1 + 48), "cplLibrary");
          v25 = objc_claimAutoreleasedReturnValue();
          -[NSObject beginDownloadForResource:clientBundleID:highPriority:completionHandler:](v25, "beginDownloadForResource:clientBundleID:highPriority:completionHandler:", v10, CFSTR("com.apple.mobileslideshow"), 0, &__block_literal_global_383);
          goto LABEL_39;
        }
      }
      else
      {

      }
      if (*MEMORY[0x1E0D115D0])
      {
LABEL_40:

LABEL_41:
        goto LABEL_42;
      }
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
      if (v21 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v21 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v25 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v26 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v32 = v26;
        v33 = 2112;
        v34 = v4;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Fingerprint of background download resource: %@ didn't match local resource: %@", buf, 0x16u);
      }
LABEL_39:

      goto LABEL_40;
    }
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
    if (v23 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v23 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v5 = v24;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v32 = v27;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to find local resource for background downloaded resource %@", buf, 0xCu);
    }
    goto LABEL_41;
  }
LABEL_42:

}

void __110__PLCloudPhotoLibraryManager_libraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "reportCompletionForResourceIdentifier:highPriority:withError:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48));
  if (!*(_QWORD *)(a1 + 48) && objc_msgSend(*(id *)(a1 + 56), "resourceType") == 1)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.originaldownloaded"), 0, 0, 0);
  }
  if (*(_BYTE *)(a1 + 72))
  {
    v3 = *(_QWORD *)(a1 + 64);
    PLCPLSignpostsTelemetryGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      v6 = objc_msgSend(*(id *)(a1 + 56), "resourceType");
      objc_msgSend(*(id *)(a1 + 56), "identity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "fileSize");
      objc_msgSend(*(id *)(a1 + 56), "itemScopedIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134349570;
      v11 = v6;
      v12 = 2050;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_signpost_emit_with_name_impl(&dword_199541000, v5, OS_SIGNPOST_INTERVAL_END, v3, "OnDemandDownload", " enableTelemetry=YES type=%{signpost.telemetry:number1,public}lu size=%{signpost.telemetry:number2,public}lu identifier=%@", (uint8_t *)&v10, 0x20u);

    }
  }
}

uint64_t __110__PLCloudPhotoLibraryManager_libraryManager_downloadDidFinishForResourceTransferTask_finalResource_withError___block_invoke_381(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__PLCloudPhotoLibraryManager_sizeOfResourcesToUploadDidChangeForLibraryManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager sizeOfResourcesToUploadDidChangeForLibraryManager:]_block_invoke");

  if (!objc_msgSend(*(id *)(a1 + 40), "sizeOfOriginalResourcesToUpload")
    && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "totalSizeOfUnpushedOriginals"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "reset");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "setupFromLibrary:isInitialUpload:", v5, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "initialUpload"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, 0, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateTransferCountsInLibrary:", v5);

}

void __81__PLCloudPhotoLibraryManager_workerCoordinatorDidFinishAllSubmittedJobsOnBundle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  _BYTE *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint8_t v21[16];
  uint8_t v22[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 464));
  objc_msgSend(WeakRetained, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "isCloudPhotoLibraryEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 40), "pendingJobsForBundle:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker](PLBackgroundJobCriteria, "criteriaForUrgentResourceWorker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsObject:", v5);

    v7 = (_BYTE *)MEMORY[0x1E0D115D0];
    if (v6)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v8 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v8 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v9 = objc_claimAutoreleasedReturnValue();
        }
        v12 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Requested to push all changes: jobs still pending, re-submitting bundle for processing...", buf, 2u);
        }

      }
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 296);
      +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker](PLBackgroundJobCriteria, "criteriaForUrgentResourceWorker");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "submitBundleForProcessing:withCriteria:", v3, v14);

    }
    else
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v10 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v10 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v15 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Requested to push all changes: pushing all changes to CPL...", v22, 2u);
        }

      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 1;
      v16 = objc_msgSend(*(id *)(a1 + 32), "_canExternallyTransitionToNewLibraryStateIgnoringPause:", 1);
      v17 = *(_QWORD *)(a1 + 32);
      if (v16)
      {
        if (*(_QWORD *)(v17 + 80) == 8)
        {
          *(_DWORD *)(v17 + 128) = 1;
          v17 = *(_QWORD *)(a1 + 32);
        }
        if (!*v7)
        {
          v18 = *(_QWORD *)(v17 + 96);
          if (v18 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v19 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v18 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v19 = objc_claimAutoreleasedReturnValue();
          }
          v20 = v19;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v21 = 0;
            _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEBUG, "Going to fetch new events from change hub from PUSHALLCHANGES", v21, 2u);
          }

          v17 = *(_QWORD *)(a1 + 32);
        }
        objc_msgSend((id)v17, "_transitionToState:", 3);
      }
      else
      {
        *(_BYTE *)(v17 + 90) = 1;
      }
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_callPushAllChangesCompletionHandlersIfNecessary");
  }

}

void __81__PLCloudPhotoLibraryManager_libraryManager_pushAllChangesWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  PLBackgroundJobWorkerCoordinator *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[37])
  {
    v3 = -[PLBackgroundJobWorkerCoordinator initWithWorkerCoordinatorWorkerMode:statusCenter:]([PLBackgroundJobWorkerCoordinator alloc], "initWithWorkerCoordinatorWorkerMode:statusCenter:", 1, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 296);
    *(_QWORD *)(v4 + 296) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "setDelegate:");
    v2 = *(_QWORD **)(a1 + 32);
  }
  v6 = objc_msgSend(v2, "isCloudPhotoLibraryEnabled");
  v7 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v7)
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 288);
      v9 = (void *)MEMORY[0x19AEC174C]();
      objc_msgSend(v8, "addObject:", v9);

    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 288), "count") == 1)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v10 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v10 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Requested to push all changes: submitting bundle for processing...", v18, 2u);
        }

      }
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 296);
      WeakRetained = objc_loadWeakRetained((id *)(v13 + 464));
      objc_msgSend(WeakRetained, "libraryBundle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLBackgroundJobCriteria criteriaForUrgentResourceWorker](PLBackgroundJobCriteria, "criteriaForUrgentResourceWorker");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "submitBundleForProcessing:withCriteria:", v16, v17);

    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
  }
}

void __96__PLCloudPhotoLibraryManager_libraryManager_provideLocalResource_recordClass_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  if (objc_msgSend(*(id *)(a1 + 32), "_isAssetsdNotReadyToAnswer"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "databaseContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager libraryManager:provideLocalResource:recordClass:completionHandler:]_block_invoke");

    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__11541;
    v26 = __Block_byref_object_dispose__11542;
    v27 = 0;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __96__PLCloudPhotoLibraryManager_libraryManager_provideLocalResource_recordClass_completionHandler___block_invoke_2;
    v17 = &unk_1E3662FB0;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    v18 = v5;
    v21 = v6;
    v7 = v4;
    v19 = v7;
    v20 = &v22;
    objc_msgSend(v7, "performBlockAndWait:", &v14);
    if (v23[5])
    {
      objc_msgSend(*(id *)(a1 + 40), "identity", v14, v15, v16, v17, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fileURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11
        || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v23[5], v11, 0),
            v12,
            (v13 & 1) == 0))
      {
        objc_msgSend(v10, "setFileURL:", v23[5]);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
    else
    {
      (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, 1, v8, v9);
    }

    _Block_object_dispose(&v22, 8);
  }
}

void __96__PLCloudPhotoLibraryManager_libraryManager_provideLocalResource_recordClass_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "resourceType");
  objc_msgSend(*(id *)(a1 + 32), "itemScopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 == objc_opt_class())
  {
    +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v3, *(_QWORD *)(a1 + 40), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetResourceForCPLType:", v2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isLocallyAvailable"))
    {
      objc_msgSend(v7, "fileURL");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
LABEL_16:

    goto LABEL_17;
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 == objc_opt_class())
  {
    +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v3, 1, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rm_cloudResourcesForResourceType:", v2);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v12, "isLocallyAvailable", (_QWORD)v19))
          {
            objc_msgSend(v12, "fileURL");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v18 = *(void **)(v17 + 40);
            *(_QWORD *)(v17 + 40) = v16;

            goto LABEL_15;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

}

void __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_2;
  v14[3] = &unk_1E3664C38;
  v15 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v16 = v9;
  v17 = v10;
  v11 = *(void **)(a1 + 56);
  v21 = *(_QWORD *)(a1 + 64);
  v18 = v11;
  v19 = *(id *)(a1 + 40);
  v20 = v6;
  v12 = v6;
  v13 = v5;
  objc_msgSend(v7, "_runAsyncOnIsolationQueueWithTransaction:block:", v8, v14);

}

void __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_3;
    v26[3] = &unk_1E36713B8;
    v2 = *(void **)(a1 + 40);
    v26[4] = *(_QWORD *)(a1 + 48);
    v3 = *(id *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 80);
    v27 = v3;
    v31 = v4;
    v28 = *(id *)(a1 + 40);
    v29 = *(id *)(a1 + 56);
    v30 = *(id *)(a1 + 64);
    objc_msgSend(v2, "performTransactionAndWait:", v26);

  }
  else
  {
    v5 = (unsigned __int8 *)MEMORY[0x1E0D115D0];
    v6 = *MEMORY[0x1E0D115D0];
    if (*(_QWORD *)(a1 + 72))
      v7 = v6 == 0;
    else
      v7 = 0;
    if (v7)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
      if (v8 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(void **)(a1 + 72);
        v12 = *(_QWORD *)(a1 + 80);
        *(_DWORD *)buf = 138412546;
        v33 = v11;
        v34 = 2048;
        v35 = v12;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Error getting statuses %@, notification generation (%lu)", buf, 0x16u);
      }

      v6 = *v5;
    }
    v13 = *(_QWORD *)(a1 + 80);
    v14 = *(_QWORD **)(a1 + 48);
    v15 = v14[42];
    if (v13 == v15)
    {
      if (!v6)
      {
        v16 = v14[12];
        if (v16 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v17 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v16 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v17 = objc_claimAutoreleasedReturnValue();
        }
        v20 = v17;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 48), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(_QWORD *)(a1 + 80);
          *(_DWORD *)buf = 138412546;
          v33 = v21;
          v34 = 2048;
          v35 = v22;
          _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Finished handling record status change notification, state is currently %@, notification generation (%lu)", buf, 0x16u);

        }
        v14 = *(_QWORD **)(a1 + 48);
        v13 = v14[42];
      }
      v14[42] = v13 + 1;
      *(_BYTE *)(*(_QWORD *)(a1 + 48) + 328) = 0;
    }
    else
    {
      if (!v6)
      {
        v18 = v14[12];
        if (v18 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v18 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
        }
        v23 = v19;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 48), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 336);
          *(_DWORD *)buf = 138412546;
          v33 = v24;
          v34 = 2048;
          v35 = v25;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEFAULT, "Notified for record status changes (pending notifications), state is currently %@, notification generation (%lu)", buf, 0x16u);

        }
        v14 = *(_QWORD **)(a1 + 48);
        v15 = v14[42];
      }
      objc_msgSend(v14, "_getStatusChanges:transaction:notificationGeneration:inLibrary:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v15, *(_QWORD *)(a1 + 40));
    }
  }
}

void __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  os_log_type_t v25;
  const char *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  id v72;
  unsigned int v73;
  id obj;
  _QWORD v75[4];
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _BYTE v102[128];
  uint8_t v103[128];
  uint8_t buf[4];
  uint64_t v105;
  __int16 v106;
  void *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(*(id *)(a1 + 40), "count");
      v6 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 134218240;
      v105 = v5;
      v106 = 2048;
      v107 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Handling %lu record status changes, notification generation (%lu)", buf, 0x16u);
    }

  }
  v71 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v70 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = (void *)MEMORY[0x1E0D731D8];
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "libraryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v7, "freeSpaceBelowDesiredSpaceThresholdForPath:", v10);

  v99 = 0;
  v72 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v11 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v96;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v96 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        objc_msgSend(v16, "record");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isQuarantined"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "quarantineRecord:uploadTracker:inLibrary:", v17, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256), *(_QWORD *)(a1 + 48));
        }
        else if ((objc_msgSend(v16, "isUploaded") & v73 & 1) != 0
               || objc_msgSend(v16, "isConfirmed"))
        {
          objc_msgSend(v17, "scopedIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v71, "addObject:", v18);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "uploadFinishedForMasterRecordWithScopedIdentifier:didUpdateStatus:", v18, &v99);
              if (!*MEMORY[0x1E0D115D0])
              {
                v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
                if (v19 == 2)
                {
                  __CPLAppLibraryOSLogDomain();
                  v20 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v19 == 1)
                    __CPLSyndicationOSLogDomain();
                  else
                    __CPLSystemLibraryOSLogDomain();
                  v20 = objc_claimAutoreleasedReturnValue();
                }
                v23 = v20;
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v105 = (uint64_t)v18;
                  v24 = v23;
                  v25 = OS_LOG_TYPE_DEBUG;
                  v26 = "Marking master record as uploaded in tracker: %@";
LABEL_42:
                  _os_log_impl(&dword_199541000, v24, v25, v26, buf, 0xCu);
                }
                goto LABEL_43;
              }
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v70, "addObject:", v18);
            }
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
            if (v21 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v22 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v21 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v22 = objc_claimAutoreleasedReturnValue();
            }
            v23 = v22;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v105 = (uint64_t)v17;
              v24 = v23;
              v25 = OS_LOG_TYPE_ERROR;
              v26 = "Missing scopedIdentifier for %@";
              goto LABEL_42;
            }
LABEL_43:

          }
        }
        if (objc_msgSend(v16, "isUploaded"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v17, "scopedIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v27, "isInAMomentShare"))
            {
              +[PLManagedAsset assetWithScopedIdentifier:inLibrary:prefetchResources:](PLManagedAsset, "assetWithScopedIdentifier:inLibrary:prefetchResources:", v27, *(_QWORD *)(a1 + 48), 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "momentShare");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "status");
              if (v28
                && v29
                && v30 == 1
                && ((objc_msgSend(v28, "isPlaceholderAsset") & 1) != 0
                 || objc_msgSend(v28, "isMomentSharedAsset")))
              {
                if (objc_msgSend(v28, "isPlaceholderAsset"))
                  objc_msgSend(v28, "fixupPlaceholderAssetWithSavedAssetType:", objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForMomentSharedAsset"));
                objc_msgSend(v72, "addObject:", v29);
              }

            }
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    }
    while (v13);
  }

  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v72;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v92;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v92 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
        objc_msgSend(v35, "computeUploadedAssetCountsUsingAssetRelationship");
        if (!*MEMORY[0x1E0D115D0])
        {
          v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          if (v36 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v37 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v36 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v37 = objc_claimAutoreleasedReturnValue();
          }
          v38 = v37;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v35, "scopeIdentifier");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "uuid");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v105 = (uint64_t)v39;
            v106 = 2114;
            v107 = v40;
            _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "Recomputed uploaded asset counts on MomentShare %{public}@ %{public}@ after receiving record status changes", buf, 0x16u);

          }
        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
    }
    while (v32);
  }

  if (v99)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, 0, 0);
  }
  v42 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v70, "allObjects");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset assetsByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:](PLManagedAsset, "assetsByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:", v43, 0, *(_QWORD *)(a1 + 48));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  objc_msgSend(v44, "allValues");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v88;
    do
    {
      for (k = 0; k != v47; ++k)
      {
        if (*(_QWORD *)v88 != v48)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * k), "allAssetCPLResources");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "unionSet:", v50);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
    }
    while (v47);
  }

  v86 = 0u;
  v84 = 0u;
  v85 = 0u;
  v83 = 0u;
  v51 = v71;
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v84;
    do
    {
      for (m = 0; m != v53; ++m)
      {
        if (*(_QWORD *)v84 != v54)
          objc_enumerationMutation(v51);
        +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * m), 1, *(_QWORD *)(a1 + 48));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "allMasterResources");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "unionSet:", v57);

      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
    }
    while (v53);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K > %d"), CFSTR("localAvailability"), 0xFFFFFFFFLL);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "filterUsingPredicate:", v58);

  if (objc_msgSend(v42, "count") && !*MEMORY[0x1E0D115D0])
  {
    v59 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v59 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v60 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v59 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v60 = objc_claimAutoreleasedReturnValue();
    }
    v61 = v60;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v42, "valueForKey:", CFSTR("objectID"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = *(void **)(a1 + 72);
      *(_DWORD *)buf = 138412546;
      v105 = (uint64_t)v62;
      v106 = 2048;
      v107 = v63;
      _os_log_impl(&dword_199541000, v61, OS_LOG_TYPE_DEFAULT, "Checking and marking purgeable resources %@, notification generation (%lu)", buf, 0x16u);

    }
  }
  v64 = *(void **)(a1 + 32);
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_372;
  v75[3] = &unk_1E3664C38;
  v76 = v51;
  v77 = *(id *)(a1 + 48);
  v78 = *(id *)(a1 + 56);
  v65 = *(id *)(a1 + 40);
  v66 = *(_QWORD *)(a1 + 32);
  v79 = v65;
  v80 = v66;
  v67 = *(id *)(a1 + 64);
  v68 = *(_QWORD *)(a1 + 72);
  v81 = v67;
  v82 = v68;
  v69 = v51;
  objc_msgSend(v64, "_checkAndMarkPurgeableResources:checkIfSafe:checkServerIfNecessary:urgency:completionHandler:", v42, 1, v73, 1, v75);

}

uint64_t __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_372(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_2_373;
    v7 = &unk_1E3677C18;
    v2 = *(void **)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v2, "performTransactionAndWait:", &v4);

  }
  objc_msgSend(*(id *)(a1 + 48), "acknowledgeChangedStatuses:", *(_QWORD *)(a1 + 56), v4, v5, v6, v7);
  return objc_msgSend(*(id *)(a1 + 64), "_getStatusChanges:transaction:notificationGeneration:inLibrary:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 40));
}

void __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_2_373(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCloudMaster cloudMastersByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:](PLCloudMaster, "cloudMastersByScopedIdentifiers:relationshipKeyPathsForPrefetching:inLibrary:", v2, 0, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_376);
}

uint64_t __93__PLCloudPhotoLibraryManager__getStatusChanges_transaction_notificationGeneration_inLibrary___block_invoke_3_374(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setCloudLocalState:", 3);
}

void __61__PLCloudPhotoLibraryManager_libraryManagerHasStatusChanges___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 328))
  {
    ++*(_QWORD *)(v2 + 336);
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(v2 + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
        v11 = 138412546;
        v12 = v6;
        v13 = 2048;
        v14 = v7;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Notified for record status changes, state is currently %@, notification generation (%lu)", (uint8_t *)&v11, 0x16u);

      }
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v2, "libraryServicesManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "databaseContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager libraryManagerHasStatusChanges:]_block_invoke");

    objc_msgSend(*(id *)(a1 + 32), "_getStatusChanges:transaction:notificationGeneration:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336), v10);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 328) = 1;

  }
}

void __82__PLCloudPhotoLibraryManager__markResourceObjectIDsAsPurgeable_urgency_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[6];
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0x65)
    objc_msgSend(v4, "setFetchBatchSize:", 100);
  v6 = *(void **)(a1 + 40);
  v27 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v27;
  v9 = objc_msgSend(v7, "count");
  v10 = objc_msgSend(*(id *)(a1 + 32), "count");
  v11 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (v9 != v10 && *MEMORY[0x1E0D115D0] == 0)
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
    if (v13 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v13 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v7, "count");
      v17 = objc_msgSend(*(id *)(a1 + 32), "count");
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218498;
      v29 = v16;
      v30 = 2048;
      v31 = v17;
      v32 = 2112;
      v33 = v18;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Only found %lu resources from %lu resourceIDs: %@", buf, 0x20u);
    }

  }
  if (v7)
  {
    v19 = objc_msgSend(v7, "count");
    v20 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __82__PLCloudPhotoLibraryManager__markResourceObjectIDsAsPurgeable_urgency_inLibrary___block_invoke_362;
    v26[3] = &unk_1E3674C18;
    v22 = *(_QWORD *)(a1 + 56);
    v26[4] = *(_QWORD *)(a1 + 48);
    v26[5] = v19;
    objc_msgSend(v20, "_checkAndMarkPurgeableResources:checkIfSafe:checkServerIfNecessary:urgency:completionHandler:", v21, 1, 0, v22, v26);

  }
  else if (!*v11)
  {
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
    if (v23 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v23 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = (uint64_t)v8;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Failed to fetch confirmed resources %@", buf, 0xCu);
    }

  }
}

void __82__PLCloudPhotoLibraryManager__markResourceObjectIDsAsPurgeable_urgency_inLibrary___block_invoke_362(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Successfully checked and marked %lu purgeable resources", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2;
  v14[3] = &unk_1E3662E80;
  v15 = v5;
  v16 = v7;
  v17 = v6;
  v18 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v11 = *(void **)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v19 = v9;
  v22 = v10;
  v20 = v11;
  v21 = *(id *)(a1 + 40);
  v12 = v6;
  v13 = v5;
  objc_msgSend(v7, "_runAsyncOnIsolationQueueWithTransaction:block:", v8, v14);

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  os_signpost_id_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  id v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  os_signpost_id_t v58;
  NSObject *v59;
  NSObject *v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  _QWORD v66[5];
  id v67;
  id v68;
  id v69;
  uint64_t v70;
  _QWORD v71[5];
  id v72;
  NSObject *v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  char v78;
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(_QWORD *);
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint8_t buf[4];
  uint64_t v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*(_QWORD *)(a1 + 32))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v18 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v91 = v19;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Pulled change batch: %@", buf, 0xCu);
      }

    }
    if (*(_QWORD *)(a1 + 48))
    {
      v20 = *(_QWORD *)(a1 + 40);
      v21 = *(void **)(v20 + 8);
      objc_msgSend(*(id *)(v20 + 16), "deletedRecordsFromBatch:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "recordDeletions:", v22);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "handleIncomingBatch:", *(_QWORD *)(a1 + 48));
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = -[NSObject hasResourceChanges](v23, "hasResourceChanges");
      v25 = -[NSObject numberOfPhotos](v23, "numberOfPhotos");
      v26 = -[NSObject numberOfVideos](v23, "numberOfVideos");
      if (v25 | v26)
      {
        v27 = *(_QWORD *)(a1 + 40);
        v83 = MEMORY[0x1E0C809B0];
        v84 = 3221225472;
        v85 = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_339;
        v86 = &unk_1E3677C90;
        v87 = v27;
        v88 = v25;
        v89 = v26;
        PLRunWithUnfairLock();
        objc_msgSend(*(id *)(a1 + 40), "_updateTransferCountsInLibrary:", *(_QWORD *)(a1 + 56));
      }
      -[NSObject cmmUUIDsToNotify](v23, "cmmUUIDsToNotify");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {
        v29 = *(void **)(a1 + 56);
        v79[0] = MEMORY[0x1E0C809B0];
        v79[1] = 3221225472;
        v79[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_340;
        v79[3] = &unk_1E3677530;
        v30 = v28;
        v31 = *(_QWORD *)(a1 + 40);
        v80 = v30;
        v81 = v31;
        v82 = *(id *)(a1 + 56);
        objc_msgSend(v29, "performBlock:withPriority:", v79, 0);

      }
      if (-[NSObject needsWidgetTimelineReload](v23, "needsWidgetTimelineReload"))
        _processDownloadBatchWithSession_inLibrary__sessionNeedsWidgetTimelineReload = 1;
      objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "postRunningProgress");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isCancelled");

      if (v34)
      {
        if (!*v2)
        {
          v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
          if (v35 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v36 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v35 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v36 = objc_claimAutoreleasedReturnValue();
          }
          v55 = v36;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
          }

        }
        v56 = *(id *)(a1 + 64);
        v57 = v56;
        v58 = *(_QWORD *)(a1 + 88);
        if (v58 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_199541000, v57, OS_SIGNPOST_INTERVAL_END, v58, "BatchDownload", "Shutting Down", buf, 2u);
        }

      }
      else
      {
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_343;
        v71[3] = &unk_1E3662EF8;
        v39 = *(_QWORD *)(a1 + 48);
        v71[4] = *(_QWORD *)(a1 + 40);
        v40 = *(void **)(a1 + 72);
        v72 = *(id *)(a1 + 80);
        v73 = v23;
        v74 = *(id *)(a1 + 56);
        v78 = v24;
        v41 = *(id *)(a1 + 64);
        v42 = *(_QWORD *)(a1 + 88);
        v75 = v41;
        v77 = v42;
        v76 = *(id *)(a1 + 72);
        objc_msgSend(v40, "acknowledgeChangeBatch:withCompletionHandler:", v39, v71);

      }
      goto LABEL_80;
    }
    if (!*v2)
    {
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v37 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v38 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v37 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v38 = objc_claimAutoreleasedReturnValue();
      }
      v46 = v38;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEFAULT, "No more pull batches available, finalizing pull session", buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_setToDownloadCountsForImages:videos:", 0, 0);
    objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "postRunningProgress");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "isCancelled");

    if (v49)
    {
      if (!*v2)
      {
        v50 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        if (v50 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v51 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v50 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v51 = objc_claimAutoreleasedReturnValue();
        }
        v59 = v51;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v59, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
        }

      }
      v60 = *(id *)(a1 + 64);
      v23 = v60;
      v45 = *(_QWORD *)(a1 + 88);
      if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v60))
        goto LABEL_80;
      *(_WORD *)buf = 0;
      goto LABEL_57;
    }
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_350;
    v66[3] = &unk_1E3662DE0;
    v66[4] = *(_QWORD *)(a1 + 40);
    v52 = *(void **)(a1 + 72);
    v67 = *(id *)(a1 + 80);
    v68 = *(id *)(a1 + 56);
    v53 = *(id *)(a1 + 64);
    v54 = *(_QWORD *)(a1 + 88);
    v69 = v53;
    v70 = v54;
    objc_msgSend(v52, "finalizeWithCompletionHandler:", v66);

    v17 = v67;
LABEL_24:

    return;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    if (v3 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v91 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Received error while pulling changes: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postRunningProgress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCancelled");

  if (!v11)
  {
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3221225472;
    v61[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_354;
    v61[3] = &unk_1E3662DE0;
    v61[4] = *(_QWORD *)(a1 + 40);
    v14 = *(void **)(a1 + 72);
    v62 = *(id *)(a1 + 80);
    v63 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 88);
    v64 = v15;
    v65 = v16;
    objc_msgSend(v14, "finalizeWithCompletionHandler:", v61);

    v17 = v62;
    goto LABEL_24;
  }
  if (!*v2)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    if (v12 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v12 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v43 = v13;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
    }

  }
  v44 = *(id *)(a1 + 64);
  v23 = v44;
  v45 = *(_QWORD *)(a1 + 88);
  if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44))
    goto LABEL_80;
  *(_WORD *)buf = 0;
LABEL_57:
  _os_signpost_emit_with_name_impl(&dword_199541000, v23, OS_SIGNPOST_INTERVAL_END, v45, "BatchDownload", "Shutting Down", buf, 2u);
LABEL_80:

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_339(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[5] + objc_msgSend(*(id *)(a1[4] + 376), "unsignedIntegerValue"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(void **)(v3 + 376);
  *(_QWORD *)(v3 + 376) = v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6] + objc_msgSend(*(id *)(a1[4] + 384), "unsignedIntegerValue"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a1[4];
  v7 = *(void **)(v6 + 384);
  *(_QWORD *)(v6 + 384) = v5;

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_340(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_3;
  v2[3] = &unk_1E36701C0;
  v1 = *(void **)(a1 + 32);
  v2[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_343(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  char v24;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_344;
  v14[3] = &unk_1E3662ED0;
  v15 = v5;
  v16 = v7;
  v17 = v6;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v24 = *(_BYTE *)(a1 + 88);
  v9 = *(id *)(a1 + 64);
  v11 = *(void **)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 80);
  v20 = v9;
  v23 = v10;
  v21 = v11;
  v22 = *(id *)(a1 + 40);
  v12 = v6;
  v13 = v5;
  objc_msgSend(v7, "_runAsyncOnIsolationQueueWithTransaction:block:", v8, v14);

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_350(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_351;
  v9[3] = &unk_1E36710D8;
  v9[4] = v4;
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v12 = v6;
  v13 = v7;
  v8 = v3;
  objc_msgSend(v4, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v9);

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_354(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_355;
  v9[3] = &unk_1E36710D8;
  v10 = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v13 = v6;
  v14 = v7;
  v8 = v3;
  objc_msgSend(v4, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v9);

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_355(uint64_t a1)
{
  BOOL v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    v2 = *MEMORY[0x1E0D115D0] == 0;
  else
    v2 = 0;
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    if (v3 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Error finalizing session: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:", *(_QWORD *)(a1 + 48))|| *(_QWORD *)(a1 + 32)&& +[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:"))
  {
    objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd detected an error when finalizing a pull session during pull"));
    v7 = 7;
  }
  else
  {
    v7 = 6;
  }
  objc_msgSend(*(id *)(a1 + 40), "_transitionToState:", v7);
  v8 = *(id *)(a1 + 56);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    v11 = *(_QWORD *)(a1 + 48);
    v12 = 138412290;
    v13 = v11;
    _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v10, "BatchDownload", "Error while pulling changes: %@", (uint8_t *)&v12, 0xCu);
  }

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_351(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (_processDownloadBatchWithSession_inLibrary__sessionNeedsWidgetTimelineReload == 1)
  {
    _processDownloadBatchWithSession_inLibrary__sessionNeedsWidgetTimelineReload = 0;
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating widget timeline due to changes in batch download session", (uint8_t *)&v15, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "photoAnalysisClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadForYouWidgetTimelineWithReply:", 0);

  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:", *(_QWORD *)(a1 + 48)))
  {
    if (!*v2)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v7 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v7 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 48);
        v15 = 138412290;
        v16 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Error while finalizing ack change batch: %@", (uint8_t *)&v15, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd detected an error while finalizing a pull session"));
    v9 = 7;
  }
  else
  {
    v9 = 6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", v9);
  v12 = *(id *)(a1 + 56);
  v13 = v12;
  v14 = *(_QWORD *)(a1 + 64);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_END, v14, "BatchDownload", ", (uint8_t *)&v15, 2u);
  }

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_344(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  PLGlobalValues *v20;
  void *v21;
  PLGlobalValues *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  os_signpost_id_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (*(_QWORD *)(a1 + 32))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v36 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Received error while acknowledging change batch: %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postRunningProgress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCancelled");

    if (!v11)
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_345;
      v30[3] = &unk_1E3662DE0;
      v30[4] = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(a1 + 80);
      v31 = *(id *)(a1 + 88);
      v32 = *(id *)(a1 + 32);
      v15 = *(id *)(a1 + 72);
      v16 = *(_QWORD *)(a1 + 96);
      v33 = v15;
      v34 = v16;
      objc_msgSend(v14, "finalizeWithCompletionHandler:", v30);

      return;
    }
    if (!*v2)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v12 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v12 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v27 = v13;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
      }

    }
    v28 = *(id *)(a1 + 72);
    v19 = v28;
    v29 = *(_QWORD *)(a1 + 96);
    if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v19, OS_SIGNPOST_INTERVAL_END, v29, "BatchDownload", "Shutting Down", buf, 2u);
    }
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v17 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v36 = v18;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Change batch acknowledged, new version: %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 56), "confirmedResourceIDs");
    v19 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v19, "count"))
      objc_msgSend(*(id *)(a1 + 40), "_markResourceObjectIDsAsPurgeable:urgency:inLibrary:", v19, 1, *(_QWORD *)(a1 + 64));
    if (*(_QWORD *)(a1 + 48))
    {
      v20 = [PLGlobalValues alloc];
      objc_msgSend(*(id *)(a1 + 64), "managedObjectContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[PLGlobalValues initWithManagedObjectContext:](v20, "initWithManagedObjectContext:", v21);

      -[PLGlobalValues setCloudTrackerLastKnownCloudVersion:](v22, "setCloudTrackerLastKnownCloudVersion:", *(_QWORD *)(a1 + 48));
    }
    if (*(_BYTE *)(a1 + 104))
    {
      objc_msgSend(*(id *)(a1 + 40), "resourceManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startAutomaticPrefetchAndPruneWithTimeout:", 0);

    }
    v24 = *(id *)(a1 + 72);
    v25 = v24;
    v26 = *(_QWORD *)(a1 + 96);
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v25, OS_SIGNPOST_INTERVAL_END, v26, "BatchDownload", ", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_processDownloadBatchWithSession:inLibrary:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64));
  }

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_345(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_346;
  v9[3] = &unk_1E36710D8;
  v10 = v3;
  v11 = v4;
  v12 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v13 = v6;
  v14 = v7;
  v8 = v3;
  objc_msgSend(v4, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v9);

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_2_346(uint64_t a1)
{
  BOOL v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
    v2 = *MEMORY[0x1E0D115D0] == 0;
  else
    v2 = 0;
  if (v2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    if (v3 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Error finalizing session: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:", *(_QWORD *)(a1 + 48))|| *(_QWORD *)(a1 + 32)&& +[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:"))
  {
    objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd detected an error while acknowledging change batch"));
    v7 = 7;
  }
  else
  {
    v7 = 6;
  }
  objc_msgSend(*(id *)(a1 + 40), "_transitionToState:", v7);
  v8 = *(id *)(a1 + 56);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 64);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v10, "BatchDownload", ", (uint8_t *)&v11, 2u);
  }

}

void __73__PLCloudPhotoLibraryManager__processDownloadBatchWithSession_inLibrary___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v5 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v5 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Sending notification CMM %@ has finished uploading.", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLShare shareWithUUID:includeTrashed:inManagedObjectContext:](PLMomentShare, "shareWithUUID:includeTrashed:inManagedObjectContext:", v3, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[PLNotificationManager sharedManager](PLNotificationManager, "sharedManager");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject noteUserAssetsAreReadyForMomentShare:](v10, "noteUserAssetsAreReadyForMomentShare:", v9);
LABEL_22:

    goto LABEL_23;
  }
  if (!*v4)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v11 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v11 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v12;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to find CMM with UUID %@ to post notification", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_22;
  }
LABEL_23:

}

void __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke_2;
  v13[3] = &unk_1E3662E80;
  v14 = v6;
  v15 = v7;
  v16 = *(id *)(a1 + 48);
  v17 = v5;
  v18 = *(id *)(a1 + 56);
  v19 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v20 = v9;
  v21 = v10;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v7, "_runAsyncOnIsolationQueueWithTransaction:block:", v8, v13);

}

void __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  _BOOL4 v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 72);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke_335;
    v13[3] = &unk_1E3677C18;
    v13[4] = v3;
    v14 = v2;
    objc_msgSend(v3, "_runAsyncOnIsolationQueueWithTransaction:block:", v4, v13);

  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v16 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Pull session started with last known version: %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_processDownloadBatchWithSession:inLibrary:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  v9 = *(id *)(a1 + 80);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 88);
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    v12 = *(_QWORD *)(a1 + 32) == 0;
    *(_DWORD *)buf = 67109120;
    LODWORD(v16) = v12;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_END, v11, "Download", "_downloadFromCloud success: %d", buf, 8u);
  }

}

uint64_t __58__PLCloudPhotoLibraryManager__downloadFromCloudInLibrary___block_invoke_335(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Error beginning pull session: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd detected an error beginning pull session"));
    v6 = 7;
  }
  else
  {
    v6 = 6;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", v6);
}

void __70__PLCloudPhotoLibraryManager_sendBudgetOverrideAnalytics_pauseReason___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "numberOfImagesToUpload");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "numberOfVideosToUpload");
    v2 = v3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
  }

}

void __70__PLCloudPhotoLibraryManager_sendBudgetOverrideAnalytics_pauseReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "countOfUnsharingRecords");
  v4 = objc_msgSend(v3, "countOfSharingRecords");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
}

void __95__PLCloudPhotoLibraryManager_overrideSystemBudgetsForSyncSession_pauseReason_forSystemBudgets___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "setShouldOverride:forSystemBudgets:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
    v2 = v3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __68__PLCloudPhotoLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__PLCloudPhotoLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E3676880;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v2, "getSystemBudgetsWithCompletionHandler:", v5);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

  }
}

uint64_t __68__PLCloudPhotoLibraryManager_getSystemBudgetsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__PLCloudPhotoLibraryManager_startAutomaticPrefetchOrPrune__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAutomaticPrefetchAndPruneWithTimeout:", 1);

  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCacheDeletePurgeableAmount");

}

void __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(v3, "numberOfImagesToUpload") + v2;

  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) = objc_msgSend(v5, "numberOfVideosToUpload") + v4;

}

void __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_292(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!*MEMORY[0x1E0D115D0])
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v7 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "beginPushError: %@", buf, 0xCu);
    }

  }
  v11 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_293;
  v14[3] = &unk_1E3662E08;
  v14[4] = v11;
  v15 = v6;
  v16 = v5;
  v17 = v10;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v20 = *(_OWORD *)(a1 + 64);
  v12 = v5;
  v13 = v6;
  objc_msgSend(v11, "_runAsyncOnIsolationQueueWithTransaction:block:", v17, v14);

}

void __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_293(uint64_t a1)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  const char *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  uint32_t v34;
  NSObject *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  os_signpost_id_t v45;
  uint64_t v46;
  _QWORD v47[5];
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD v52[5];
  id v53;
  unint64_t v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  uint8_t buf[4];
  _BYTE v67[10];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hasBatchesToUpload"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      v3 = (_BYTE *)MEMORY[0x1E0D115D0];
      if (!*MEMORY[0x1E0D115D0])
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v4 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v5 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v4 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v5 = objc_claimAutoreleasedReturnValue();
        }
        v21 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v22 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v67 = v22;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Got a push error: %@", buf, 0xCu);
        }

        v2 = *(_QWORD *)(a1 + 40);
      }
      if (+[PLCloudPhotoLibraryManager needResetSyncErrorType:](PLCloudPhotoLibraryManager, "needResetSyncErrorType:", v2))
      {
        v23 = *(_QWORD *)(a1 + 56);
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_319;
        v55[3] = &unk_1E3677C18;
        v24 = *(void **)(a1 + 40);
        v56 = *(id *)(a1 + 32);
        v57 = v24;
        objc_msgSend(v56, "_runAsyncOnIsolationQueueWithTransaction:block:", v23, v55);
        v25 = v57;
      }
      else
      {
        if (!*v3)
        {
          v26 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          if (v26 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v27 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v26 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v27 = objc_claimAutoreleasedReturnValue();
          }
          v35 = v27;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v36 = *(_QWORD *)(a1 + 88);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)v67 = 5;
            *(_WORD *)&v67[4] = 1024;
            *(_DWORD *)&v67[6] = v36;
            _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "Waiting %d seconds then retrying upload after error beginning push, startupFaiureCount: %d", buf, 0xEu);
          }

        }
        v37 = *(_QWORD *)(a1 + 88);
        if (v37 > 0x18)
        {
          if (!*v3)
          {
            v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
            if (v40 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v41 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v40 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v41 = objc_claimAutoreleasedReturnValue();
            }
            v42 = v41;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v43 = *(_QWORD *)(a1 + 88);
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v67 = v43;
              _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_ERROR, "Reached max startupFailureCount: %d, transitioning to library error state", buf, 8u);
            }

          }
          objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 0);
          goto LABEL_55;
        }
        v38 = *(void **)(a1 + 32);
        v52[0] = MEMORY[0x1E0C809B0];
        v52[1] = 3221225472;
        v52[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_322;
        v52[3] = &unk_1E3677C40;
        v52[4] = v38;
        v54 = v37;
        v39 = *(_QWORD *)(a1 + 56);
        v53 = *(id *)(a1 + 64);
        objc_msgSend(v38, "_runAsyncOnIsolationQueueWithTransaction:afterDelay:block:", v39, v52, 5.0);
        v25 = v53;
      }

LABEL_55:
      v44 = *(id *)(a1 + 72);
      v20 = v44;
      v45 = *(_QWORD *)(a1 + 80);
      if (v45 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v44))
        goto LABEL_59;
      v46 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v67 = v46;
      v31 = "Error during beginPushChangeSession: %@";
      v32 = v20;
      v33 = v45;
      v34 = 12;
      goto LABEL_58;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "pop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "batch");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_2;
    v58[3] = &unk_1E3662DB8;
    v58[4] = *(_QWORD *)(a1 + 32);
    v59 = v15;
    v16 = *(void **)(a1 + 48);
    v60 = *(id *)(a1 + 56);
    v61 = *(id *)(a1 + 64);
    v17 = *(id *)(a1 + 72);
    v18 = *(_QWORD *)(a1 + 80);
    v62 = v17;
    v65 = v18;
    v63 = *(id *)(a1 + 48);
    v64 = v14;
    v19 = v14;
    v20 = v15;
    objc_msgSend(v16, "commitChangeBatch:completionHandler:", v20, v58);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postRunningProgress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isCancelled");

    if (!v8)
    {
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_323;
      v47[3] = &unk_1E3662DE0;
      v47[4] = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(a1 + 48);
      v48 = *(id *)(a1 + 56);
      v49 = *(id *)(a1 + 64);
      v12 = *(id *)(a1 + 72);
      v13 = *(_QWORD *)(a1 + 80);
      v50 = v12;
      v51 = v13;
      objc_msgSend(v11, "finalizeWithCompletionHandler:", v47);

      return;
    }
    if (!*MEMORY[0x1E0D115D0])
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v9 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
      }
      v28 = v10;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
      }

    }
    v29 = *(id *)(a1 + 72);
    v20 = v29;
    v30 = *(_QWORD *)(a1 + 80);
    if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      v31 = "Shutting Down";
      v32 = v20;
      v33 = v30;
      v34 = 2;
LABEL_58:
      _os_signpost_emit_with_name_impl(&dword_199541000, v32, OS_SIGNPOST_INTERVAL_END, v33, "Upload", v31, buf, v34);
    }
  }
LABEL_59:

}

void __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  _BYTE *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 *v60;
  uint64_t v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  __int128 *p_buf;
  uint8_t v74[4];
  id v75;
  __int128 buf;
  uint64_t v77;
  char v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v48 = a2;
  v47 = a3;
  v7 = a4;
  v8 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v9 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v48;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEBUG, "commitError: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v77 = 0x2020000000;
  v78 = 0;
  v13 = MEMORY[0x1E0C809B0];
  if (v48)
  {
    if (!*v8)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v14 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v14 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v15 = objc_claimAutoreleasedReturnValue();
      }
      v16 = v15;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v74 = 138412290;
        v75 = v48;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Got a commit error: %@", v74, 0xCu);
      }

      if (!*v8)
      {
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v17 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v17 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v74 = 138412290;
          v75 = v47;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Tasks: %@", v74, 0xCu);
        }

      }
    }
    v38 = v7;
    v62[0] = v13;
    v62[1] = 3221225472;
    v62[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_294;
    v62[3] = &unk_1E3662D40;
    v20 = v42;
    v63 = v20;
    v21 = v45;
    v64 = v21;
    v22 = v44;
    v65 = v22;
    v23 = v46;
    v66 = v23;
    v24 = v43;
    v67 = v24;
    v25 = v41;
    v68 = v25;
    v26 = v40;
    v69 = v26;
    v27 = v39;
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(a1 + 40);
    v70 = v27;
    v71 = v28;
    v72 = v29;
    p_buf = &buf;
    objc_msgSend(v47, "enumerateScopedTasksWithBlock:", v62);
    objc_msgSend(v12, "setObject:forKey:", v23, CFSTR("regenerateDerivativeError"));
    objc_msgSend(v12, "setObject:forKey:", v22, CFSTR("needMasterError"));
    objc_msgSend(v12, "setObject:forKey:", v21, CFSTR("needFullChangeError"));
    objc_msgSend(v12, "setObject:forKey:", v24, CFSTR("repushAlbumError"));
    objc_msgSend(v12, "setObject:forKey:", v20, CFSTR("quarantinedRecordError"));
    objc_msgSend(v12, "setObject:forKey:", v25, CFSTR("invalidScopeError"));
    objc_msgSend(v12, "setObject:forKey:", v26, CFSTR("invalidResourceCopySourceError"));
    objc_msgSend(v12, "setObject:forKey:", v27, CFSTR("invalidExpungeableResourceTypes"));

    v7 = v38;
    v13 = MEMORY[0x1E0C809B0];

  }
  v30 = *(void **)(a1 + 32);
  v31 = *(_QWORD *)(a1 + 48);
  v49[0] = v13;
  v49[1] = 3221225472;
  v49[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_315;
  v49[3] = &unk_1E3662D90;
  v32 = v48;
  v33 = *(_QWORD *)(a1 + 32);
  v50 = v32;
  v51 = v33;
  v34 = v7;
  v52 = v34;
  v53 = *(id *)(a1 + 40);
  v54 = *(id *)(a1 + 56);
  v60 = &buf;
  v35 = v12;
  v55 = v35;
  v36 = *(id *)(a1 + 64);
  v37 = *(_QWORD *)(a1 + 88);
  v56 = v36;
  v61 = v37;
  v57 = *(id *)(a1 + 72);
  v58 = *(id *)(a1 + 80);
  v59 = *(id *)(a1 + 48);
  objc_msgSend(v30, "_runAsyncOnIsolationQueueWithTransaction:block:", v31, v49);

  _Block_object_dispose(&buf, 8);
}

uint64_t __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_319(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Error beginning push session: %@, need to force a reset sync", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clearUploadArray");
  objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd detected an error beginning push session"));
  return objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 7);
}

uint64_t __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_322(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processUploadBatchWithStartupFailureCount:inLibrary:", *(_QWORD *)(a1 + 48) + 1, *(_QWORD *)(a1 + 40));
}

void __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_323(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "_handleFinalizeSessionError:commitError:uploadBatchContainer:needResetSync:forTransaction:inLibrary:", a2, 0, 0, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = *(id *)(a1 + 56);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 64);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Upload", "No batch to upload", v6, 2u);
  }

}

void __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_294(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  switch(a2)
  {
    case 0:
    case 1:
      v6 = (void *)a1[4];
      goto LABEL_10;
    case 2:
      v6 = (void *)a1[5];
      goto LABEL_10;
    case 3:
      v6 = (void *)a1[7];
      goto LABEL_10;
    case 4:
      v6 = (void *)a1[6];
      goto LABEL_10;
    case 5:
      v6 = (void *)a1[8];
      goto LABEL_10;
    case 6:
      v6 = (void *)a1[9];
      goto LABEL_10;
    case 7:
      v6 = (void *)a1[10];
      goto LABEL_10;
    case 8:
      v6 = (void *)a1[11];
LABEL_10:
      objc_msgSend(v6, "addObject:", v5);
      break;
    case 9:
      if (!*MEMORY[0x1E0D115D0])
      {
        v7 = *(_QWORD *)(a1[12] + 96);
        if (v7 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v8 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v7 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v8 = objc_claimAutoreleasedReturnValue();
        }
        v9 = v8;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v10 = a1[13];
          *(_DWORD *)buf = 138412802;
          v14 = v10;
          v15 = 2112;
          v16 = v5;
          v17 = 1024;
          v18 = 9;
          _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Received unknown taskType on commit, forcing a resetSync, upload batch: %@, record: %@, type: %d", buf, 0x1Cu);
        }

      }
      v11 = (void *)MEMORY[0x1E0D11438];
      objc_msgSend(MEMORY[0x1E0D11408], "descriptionForTaskType:", 9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "registerLikelyResetReason:", CFSTR("assetsd rejected pushed change for an unsupported reason: %@"), v12);

      *(_BYTE *)(*(_QWORD *)(a1[14] + 8) + 24) = 1;
      break;
    default:
      break;
  }

}

void __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_315(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _BYTE *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  PLGlobalValues *v15;
  void *v16;
  PLGlobalValues *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t v36;
  int8x16_t v37;
  _QWORD v38[4];
  int8x16_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        if (v3 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v4 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v3 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v4 = objc_claimAutoreleasedReturnValue();
        }
        v18 = v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          v19 = *(_QWORD *)(a1 + 56);
          v20 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v47 = v19;
          v48 = 2112;
          v49 = v20;
          _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Received error while upload batch: %@: Error: %@", buf, 0x16u);
        }

        v2 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "tryToFixCommitError:inUploadBatch:forRecords:uploadTracker:inLibrary:", v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 256), *(_QWORD *)(a1 + 64));
    }
  }
  else
  {
    v5 = (_BYTE *)MEMORY[0x1E0D115D0];
    if (!*MEMORY[0x1E0D115D0])
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v6 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v6 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v47 = v9;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Change batch committed, new version: %@, finalizing push session", buf, 0xCu);
      }

      if (!*v5)
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        if (v10 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v10 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v11 = objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 56), "records");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 134217984;
          v47 = v14;
          _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "uploaded %lu records", buf, 0xCu);

        }
      }
    }
    if (*(_QWORD *)(a1 + 48))
    {
      v15 = [PLGlobalValues alloc];
      objc_msgSend(*(id *)(a1 + 64), "managedObjectContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[PLGlobalValues initWithManagedObjectContext:](v15, "initWithManagedObjectContext:", v16);

      -[PLGlobalValues setCloudTrackerLastKnownCloudVersion:](v17, "setCloudTrackerLastKnownCloudVersion:", *(_QWORD *)(a1 + 48));
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postRunningProgress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isCancelled");

  if (v23)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v24 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v24 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v33 = v25;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager is shutting down, bailing out", buf, 2u);
      }

    }
    v34 = *(id *)(a1 + 80);
    v35 = v34;
    v36 = *(_QWORD *)(a1 + 120);
    if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v35, OS_SIGNPOST_INTERVAL_END, v36, "Upload", "Shutting Down", buf, 2u);
    }

  }
  else
  {
    v26 = *(void **)(a1 + 88);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_316;
    v38[3] = &unk_1E3662D68;
    v37 = *(int8x16_t *)(a1 + 32);
    v27 = (id)v37.i64[0];
    v39 = vextq_s8(v37, v37, 8uLL);
    v28 = *(id *)(a1 + 96);
    v30 = *(void **)(a1 + 104);
    v29 = *(_QWORD *)(a1 + 112);
    v40 = v28;
    v44 = v29;
    v41 = v30;
    v42 = *(id *)(a1 + 64);
    v31 = *(id *)(a1 + 80);
    v32 = *(_QWORD *)(a1 + 120);
    v43 = v31;
    v45 = v32;
    objc_msgSend(v26, "finalizeWithCompletionHandler:", v38);

  }
}

void __83__PLCloudPhotoLibraryManager__processUploadBatchWithStartupFailureCount_inLibrary___block_invoke_316(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "_handleFinalizeSessionError:commitError:uploadBatchContainer:needResetSync:forTransaction:inLibrary:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v3 = *(id *)(a1 + 72);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 88);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v4, OS_SIGNPOST_INTERVAL_END, v5, "Upload", "Finalize upload session", v6, 2u);
  }

}

void __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(_QWORD *);
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t buf[4];
  uint64_t v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "processCommitError:andFinalizeError:forUploadBatchContainer:withUploadTracker:inLibrary:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256), *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("resetSyncNeeded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_msgSend(v3, "BOOLValue") & 1) != 0 || *(_BYTE *)(a1 + 80) != 0;

  objc_msgSend(v2, "objectForKey:", CFSTR("hadError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v2, "objectForKey:", CFSTR("hadPermanentError"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  v9 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v9 + 93))
  {
    if (v4)
    {
LABEL_6:
      v10 = *(_QWORD *)(a1 + 32);
      if (!*MEMORY[0x1E0D115D0])
      {
        v11 = *(_QWORD *)(v10 + 96);
        if (v11 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v11 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
        }
        v38 = v12;
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_ERROR, "Need to perform a reset sync", buf, 2u);
        }

        v10 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend(*(id *)(v10 + 8), "clearUploadArray");
      objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", CFSTR("assetsd detected an error while processing batch"));
      objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 7);
      goto LABEL_60;
    }
  }
  else
  {
    *(_BYTE *)(v9 + 93) = 1;
    if (v4)
      goto LABEL_6;
  }
  v13 = MEMORY[0x1E0C809B0];
  if ((v6 ^ 1 | v8) == 1)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("pushedPhotoCount"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntegerValue");

    objc_msgSend(v2, "objectForKey:", CFSTR("pushedVideoCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    v18 = *(_QWORD *)(a1 + 32);
    v57 = v13;
    v58 = 3221225472;
    v59 = __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_2;
    v60 = &unk_1E3677C90;
    v61 = v18;
    v62 = v15;
    v63 = v17;
    PLRunWithUnfairLock();
    objc_msgSend(*(id *)(a1 + 32), "_updateTransferCountsInLibrary:", *(_QWORD *)(a1 + 64));
    if (v8)
    {
      objc_msgSend(v2, "objectForKey:", CFSTR("changedTotalSizeOfUnpushedOriginal"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");

      if (v20)
        objc_msgSend(*(id *)(a1 + 64), "performBlock:", &__block_literal_global_286);
    }
    +[PLMomentShare momentSharesReferencedInUploadBatchContainer:inPhotoLibrary:](PLMomentShare, "momentSharesReferencedInUploadBatchContainer:inPhotoLibrary:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "recordMomentSharesNeedingForceSync:inLibrary:", v21, *(_QWORD *)(a1 + 64));
    if (+[PLManagedAsset isComputeSyncEnabledForDirection:library:](PLManagedAsset, "isComputeSyncEnabledForDirection:library:", 0, *(_QWORD *)(a1 + 64)))
    {
      objc_msgSend(*(id *)(a1 + 56), "computeSyncRelevantAssetsInBatch");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 56), "computeSyncRelevantAssetsInBatch");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "allObjects");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLManagedAsset createSparseComputeStateRecordsForAssets:inPhotoLibrary:](PLManagedAsset, "createSparseComputeStateRecordsForAssets:inPhotoLibrary:", v25, *(_QWORD *)(a1 + 64));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "count"))
        {
          v47 = v25;
          v48 = v21;
          v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v53 = 0u;
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v46 = v26;
          v28 = v26;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v54;
            do
            {
              for (i = 0; i != v30; ++i)
              {
                if (*(_QWORD *)v54 != v31)
                  objc_enumerationMutation(v28);
                v33 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
                objc_msgSend(v33, "itemScopedIdentifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "setObject:forKeyedSubscript:", v33, v34);

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
            }
            while (v30);
          }

          objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v47;
          if (!*MEMORY[0x1E0D115D0])
          {
            v36 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
            if (v36 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v37 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v36 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v37 = objc_claimAutoreleasedReturnValue();
            }
            v39 = v37;
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              v40 = objc_msgSend(v28, "count");
              *(_DWORD *)buf = 134218242;
              v65 = v40;
              v66 = 2112;
              v67 = v28;
              _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "[CCSS] Attaching %lu sparse compute state records to cpl library %@", buf, 0x16u);
            }

          }
          v13 = MEMORY[0x1E0C809B0];
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_288;
          v51[3] = &unk_1E366B140;
          v51[4] = *(_QWORD *)(a1 + 32);
          v52 = v28;
          objc_msgSend(v35, "attachComputeStates:completionHandler:", v52, v51);

          v21 = v48;
          v26 = v46;
        }

      }
    }

  }
  if (v6)
  {
    v41 = *(_QWORD **)(a1 + 32);
    if (!*MEMORY[0x1E0D115D0])
    {
      v42 = v41[12];
      if (v42 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v43 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v42 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v43 = objc_claimAutoreleasedReturnValue();
      }
      v44 = v43;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v65) = 5;
        _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_ERROR, "Waiting %d seconds then retrying upload after error processing batch", buf, 8u);
      }

      v41 = *(_QWORD **)(a1 + 32);
    }
    v49[0] = v13;
    v49[1] = 3221225472;
    v49[2] = __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_289;
    v49[3] = &unk_1E3677C18;
    v49[4] = v41;
    v45 = *(_QWORD *)(a1 + 72);
    v50 = *(id *)(a1 + 64);
    objc_msgSend(v41, "_runAsyncOnIsolationQueueWithTransaction:afterDelay:block:", v45, v49, 5.0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_processUploadBatchInLibrary:", *(_QWORD *)(a1 + 64));
  }
LABEL_60:

}

void __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  if ((unint64_t)objc_msgSend(*(id *)(a1[4] + 352), "integerValue") >= a1[5])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1[4] + 352), "integerValue") - a1[5]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = a1[4];
    v3 = *(void **)(v5 + 352);
    *(_QWORD *)(v5 + 352) = v4;
  }
  else
  {
    v2 = a1[4];
    v3 = *(void **)(v2 + 352);
    *(_QWORD *)(v2 + 352) = &unk_1E375D920;
  }

  if ((unint64_t)objc_msgSend(*(id *)(a1[4] + 360), "integerValue") >= a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1[4] + 360), "integerValue") - a1[6]);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = a1[4];
    v7 = *(void **)(v9 + 360);
    *(_QWORD *)(v9 + 360) = v8;
  }
  else
  {
    v6 = a1[4];
    v7 = *(void **)(v6 + 360);
    *(_QWORD *)(v6 + 360) = &unk_1E375D920;
  }

}

void __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_288(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v8 = v5;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      v9 = objc_msgSend(*(id *)(a1 + 40), "count");
      v10 = *(_QWORD *)(a1 + 40);
      v16 = 134218498;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      v20 = 2112;
      v21 = v10;
      v11 = "[CCSS] Failed to attach %lu sparse compute state records to cpl library: %@ %@";
      v12 = v8;
      v13 = OS_LOG_TYPE_ERROR;
      v14 = 32;
LABEL_20:
      _os_log_impl(&dword_199541000, v12, v13, v11, (uint8_t *)&v16, v14);
LABEL_21:

    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v6 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v15 = objc_msgSend(*(id *)(a1 + 40), "count");
    v16 = 134217984;
    v17 = v15;
    v11 = "[CCSS] Successfully attached %lu sparse compute state records to cpl library";
    v12 = v8;
    v13 = OS_LOG_TYPE_DEFAULT;
    v14 = 12;
    goto LABEL_20;
  }

}

uint64_t __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_289(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processUploadBatchInLibrary:", *(_QWORD *)(a1 + 40));
}

void __130__PLCloudPhotoLibraryManager__handleFinalizeSessionError_commitError_uploadBatchContainer_needResetSync_forTransaction_inLibrary___block_invoke_285()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobileslideshow.cpl.currenttransferprogresschange"), 0, 0, 0);
}

void __102__PLCloudPhotoLibraryManager_updateTransferCountsWithInsertedPhotoCount_insertedVideoCount_inLibrary___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[5] + objc_msgSend(*(id *)(a1[4] + 352), "unsignedIntegerValue"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = *(void **)(v3 + 352);
  *(_QWORD *)(v3 + 352) = v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6] + objc_msgSend(*(id *)(a1[4] + 360), "unsignedIntegerValue"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = a1[4];
  v7 = *(void **)(v6 + 360);
  *(_QWORD *)(v6 + 360) = v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[5] + objc_msgSend(*(id *)(a1[4] + 376), "unsignedIntegerValue"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = a1[4];
  v10 = *(void **)(v9 + 376);
  *(_QWORD *)(v9 + 376) = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6] + objc_msgSend(*(id *)(a1[4] + 384), "unsignedIntegerValue"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = a1[4];
  v13 = *(void **)(v12 + 384);
  *(_QWORD *)(v12 + 384) = v11;

}

void __70__PLCloudPhotoLibraryManager__uploadToCloudForEventsResult_inLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 56));
  v2 = *(void **)(a1 + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PLCloudPhotoLibraryManager.m"), 3045, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventsResult != nil"));

    v2 = *(void **)(a1 + 40);
  }
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PLCloudPhotoLibraryManager__uploadToCloudForEventsResult_inLibrary___block_invoke_2;
  v12[3] = &unk_1E3662CF8;
  v12[4] = *(_QWORD *)(a1 + 32);
  v14 = &v25;
  v15 = &v21;
  v13 = *(id *)(a1 + 48);
  v16 = &v17;
  objc_msgSend(v2, "enumerateLocalEventsWithBlock:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateLastKnownTokenToResult:", *(_QWORD *)(a1 + 40));
  if (*((_BYTE *)v18 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "resourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startAutomaticPrefetchAndPruneWithTimeout:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "updateTransferCountsWithInsertedPhotoCount:insertedVideoCount:inLibrary:", v26[3], v22[3], *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hasBatchesToUpload") & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v5 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "lastKnownTokenDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "didn't upload, no batch, updating change traker token on disk to %@", buf, 0xCu);

      }
    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_saveLastKnownCloudChangeTrackerTokenToDiskWithContext:", v10);

    v4 = 6;
  }
  objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", v4);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void __70__PLCloudPhotoLibraryManager__uploadToCloudForEventsResult_inLibrary___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*MEMORY[0x1E0D115D0])
  {
    v4 = *(_QWORD *)(a1[4] + 96);
    if (v4 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "local event for upload = %@", (uint8_t *)&v7, 0xCu);
    }

  }
  LOBYTE(v7) = 0;
  objc_msgSend(*(id *)(a1[4] + 8), "handleUploadBatchesFromLocalEvent:outInsertedPhotoCount:outInsertedVideoCount:shouldTriggerPrefetch:withUploadTracker:inLibrary:", v3, *(_QWORD *)(a1[6] + 8) + 24, *(_QWORD *)(a1[7] + 8) + 24, &v7, *(_QWORD *)(a1[4] + 256), a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) |= v7;

}

void __62__PLCloudPhotoLibraryManager__checkForPushedMastersInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLCloudMaster entityName](PLCloudMaster, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudMasterGUID != nil AND cloudLocalState == %d"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  v6 = *(void **)(a1 + 32);
  v25 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v25);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v25;
  v9 = v8;
  if (v7)
  {
    v19 = v8;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 50);
    v10 = objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v7;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "scopedIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v10, "addObject:", v16);

          if (__ROR8__(0x8F5C28F5C28F5C29 * -[NSObject count](v10, "count"), 1) <= 0x51EB851EB851EB8uLL)
          {
            objc_msgSend(*(id *)(a1 + 40), "_fixMasterStatusIn:inLibrary:", v10, *(_QWORD *)(a1 + 48));
            -[NSObject removeAllObjects](v10, "removeAllObjects");
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      }
      while (v13);
    }

    if (-[NSObject count](v10, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_fixMasterStatusIn:inLibrary:", v10, *(_QWORD *)(a1 + 48));
      -[NSObject removeAllObjects](v10, "removeAllObjects");
    }
    v7 = v20;
    v9 = v19;
LABEL_23:

    goto LABEL_24;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    if (v17 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v10 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Fetch for pushed master failed, error:%@", buf, 0xCu);
    }
    goto LABEL_23;
  }
LABEL_24:

}

void __59__PLCloudPhotoLibraryManager__fixMasterStatusIn_inLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v7 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v7 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v12 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "getStatusForRecords for pushed master failed, error:%@", buf, 0xCu);
      }
      goto LABEL_13;
    }
  }
  else if (objc_msgSend(v5, "count"))
  {
    v9 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__PLCloudPhotoLibraryManager__fixMasterStatusIn_inLibrary___block_invoke_264;
    v13[3] = &unk_1E3677530;
    v14 = v5;
    v10 = *(id *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = v11;
    objc_msgSend(v9, "performTransaction:", v13);

    v12 = v14;
LABEL_13:

  }
}

void __59__PLCloudPhotoLibraryManager__fixMasterStatusIn_inLibrary___block_invoke_264(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  int v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v19;
    v7 = (_BYTE *)MEMORY[0x1E0D115D0];
    *(_QWORD *)&v4 = 67109120;
    v17 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, v17, (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isUploaded");

        if (v11)
        {
          +[PLCloudMaster cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:](PLCloudMaster, "cloudMasterWithScopedIdentifier:prefetchResources:inLibrary:", v9, 0, *(_QWORD *)(a1 + 40));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!*v7)
          {
            v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
            if (v13 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v14 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v13 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v14 = objc_claimAutoreleasedReturnValue();
            }
            v15 = v14;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v16 = objc_msgSend(v12, "cloudLocalState");
              *(_DWORD *)buf = v17;
              v23 = v16;
              _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "_fixMasterStatusIn: setting master (%d) to uploaded", buf, 8u);
            }

          }
          objc_msgSend(v12, "setCloudLocalState:", 3);

        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

}

void __74__PLCloudPhotoLibraryManager__fetchEventsFromCloudChangeTrackerInLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchAllEventsInContext:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __61__PLCloudPhotoLibraryManager__processRulesEvaluationIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  PLLibraryScopeRuleManager *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[PLLibraryScopeRuleManager initWithLibraryScope:]([PLLibraryScopeRuleManager alloc], "initWithLibraryScope:", v3);
  v5 = objc_msgSend(*(id *)(a1 + 40), "count");
  v6 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (v5)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
      if (v7 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v7 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(*(id *)(a1 + 40), "count");
        v15 = 134217984;
        v16 = v10;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Rules change tracker: %lu assets need evaluation, sending to library scope rule manager", (uint8_t *)&v15, 0xCu);
      }

    }
    -[PLLibraryScopeRuleManager evaluateAssetObjectIDs:withResultEnumerationBlock:](v4, "evaluateAssetObjectIDs:withResultEnumerationBlock:", *(_QWORD *)(a1 + 40), 0);
  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    if (!*v6)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96);
      if (v11 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(*(id *)(a1 + 40), "count");
        v15 = 134217984;
        v16 = v14;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Rules change tracker: %lu faces need evaluation, sending to library scope rule manager", (uint8_t *)&v15, 0xCu);
      }

    }
    -[PLLibraryScopeRuleManager evaluateFaceObjectIDs:withResultEnumerationBlock:](v4, "evaluateFaceObjectIDs:withResultEnumerationBlock:", *(_QWORD *)(a1 + 56), 0);
  }

}

_QWORD *__54__PLCloudPhotoLibraryManager_photosPreferencesChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  _QWORD *result;
  uint64_t v7;
  uint8_t v8[16];

  if (!*MEMORY[0x1E0D115D0])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Photos preferences changed", v8, 2u);
    }

  }
  v5 = PLIsSharedLibrarySuggestionsEnabled();
  result = *(_QWORD **)(a1 + 32);
  v7 = result[5];
  if (v5)
  {
    if (!v7)
      return (_QWORD *)objc_msgSend(result, "_startLibraryScopeRulesChangeTrackerInQueue");
  }
  else if (v7)
  {
    return (_QWORD *)objc_msgSend(result, "stopLibraryScopeRulesChangeTracker");
  }
  return result;
}

void __73__PLCloudPhotoLibraryManager__startLibraryScopeRulesChangeTrackerInQueue__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _BYTE *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  PLLibraryScopeChangeTracker *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLLibraryScope activeLibraryScopeInManagedObjectContext:](PLLibraryScope, "activeLibraryScopeInManagedObjectContext:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "shouldEnableRulesChangeTracker"))
  {
    v4 = (_BYTE *)MEMORY[0x1E0D115D0];
    if (!*MEMORY[0x1E0D115D0])
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Setting up rules change tracker", buf, 2u);
      }

    }
    v8 = [PLLibraryScopeChangeTracker alloc];
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PLLibraryScopeChangeTracker initWithManagedObjectContext:](v8, "initWithManagedObjectContext:", v9);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "start") & 1) == 0 && !*v4)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v13 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v13 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to connect to rules change tracker", v16, 2u);
      }

    }
  }

}

uint64_t __65__PLCloudPhotoLibraryManager_startLibraryScopeRulesChangeTracker__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startLibraryScopeRulesChangeTrackerInQueue");
}

void __53__PLCloudPhotoLibraryManager__doResetSync_inLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 352);
  *(_QWORD *)(v2 + 352) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 360);
  *(_QWORD *)(v4 + 360) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 368);
  *(_QWORD *)(v6 + 368) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 376);
  *(_QWORD *)(v8 + 376) = 0;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 384);
  *(_QWORD *)(v10 + 384) = 0;

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 392);
  *(_QWORD *)(v12 + 392) = 0;

}

uint64_t __53__PLCloudPhotoLibraryManager__doResetSync_inLibrary___block_invoke_253(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCloudTrackerLastKnownCloudVersion:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCloudInitialUploadCompleted:", 0);
}

void __87__PLCloudPhotoLibraryManager_deleteResources_checkServerIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "deleteResources:checkServerIfNecessary:completionHandler:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", v13, 2u);
      }

    }
    v7 = (void *)MEMORY[0x1E0D11370];
    v10 = a1 + 40;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(v10 + 8);
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "unsafeResources:withError:resourceStorage:", v8, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v12);

  }
}

void __131__PLCloudPhotoLibraryManager_downloadResourceInMemory_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_isPausedForDownloadRequestHighPriority:", 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("iCloud Photo Library is paused, unable to download in-memory resource %@"), *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 1, v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v3;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

    }
    (*(void (**)(_QWORD, _QWORD, uint64_t, id))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), 0, objc_msgSend(*(id *)(a1 + 40), "resourceType"), v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v2 = (void *)v6;
      v7 = *(void **)(a1 + 48);
      if (v7)
      {
        v3 = v7;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDString");
        v3 = (id)objc_claimAutoreleasedReturnValue();

      }
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "addClientHandlerAndCreateTaskIfNecessaryForResource:taskIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 80)) & 1) != 0)
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          if (v12 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v13 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v12 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v13 = objc_claimAutoreleasedReturnValue();
          }
          v19 = v13;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v20 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v31 = v20;
            v32 = 2112;
            v33 = v3;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "Going to download in-memory CPLResource %@ with taskIdentifier %@", buf, 0x16u);
          }

        }
        v21 = *(_QWORD *)(a1 + 56);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __131__PLCloudPhotoLibraryManager_downloadResourceInMemory_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_completionHandler___block_invoke_251;
        v25[3] = &unk_1E3662C80;
        v22 = *(void **)(a1 + 40);
        v25[4] = *(_QWORD *)(a1 + 32);
        v26 = v22;
        v29 = *(id *)(a1 + 72);
        v3 = v3;
        v27 = v3;
        v28 = *(id *)(a1 + 64);
        objc_msgSend(v2, "beginInMemoryDownloadOfResource:clientBundleID:completionHandler:", v26, v21, v25);

      }
      else if (!*MEMORY[0x1E0D115D0])
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v14 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v14 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v15 = objc_claimAutoreleasedReturnValue();
        }
        v23 = v15;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v24 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v31 = v24;
          v32 = 2112;
          v33 = v3;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_DEBUG, "Resource download for in-memory CPLResource %@ is inflight with taskIdentifier %@", buf, 0x16u);
        }

      }
    }
    else
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v8 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v9 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v8 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v9 = objc_claimAutoreleasedReturnValue();
        }
        v16 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", buf, 2u);
        }

      }
      v17 = *(_QWORD *)(a1 + 72);
      v18 = objc_msgSend(*(id *)(a1 + 40), "resourceType");
      +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 15);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v17 + 16))(v17, 0, v18, v3);
      v2 = 0;
    }
  }

}

void __131__PLCloudPhotoLibraryManager_downloadResourceInMemory_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_completionHandler___block_invoke_251(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 2);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "reportCompletionForResource:withData:error:", *(_QWORD *)(a1 + 40), 0, v6);
    if (!*MEMORY[0x1E0D115D0])
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v7 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v7 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = 138412290;
        v13 = v11;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to start download in-memory for resource %@", (uint8_t *)&v12, 0xCu);
      }

    }
    goto LABEL_21;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 248), "setTransferTask:forResource:", v3, *(_QWORD *)(a1 + 40));
  (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "resourceType"), 0);
  if (!*MEMORY[0x1E0D115D0])
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Began download in-memory resource %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_21:

  }
  objc_msgSend(*(id *)(a1 + 56), "stillAlive");

}

void __93__PLCloudPhotoLibraryManager__assetResourceForAsset_resourceType_masterResourceOnly_isPhoto___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isPhoto");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v2, "rm_cplMasterResourceForResourceType:", v3);
  else
    objc_msgSend(v2, "rm_cplResourceForResourceType:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __145__PLCloudPhotoLibraryManager_downloadResource_options_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_progressBlock_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  char v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isForeground");
  if (objc_msgSend(*(id *)(a1 + 40), "_isPausedForDownloadRequestHighPriority:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("iCloud Photo Library is paused, unable to download resource %@"), *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCloudPhotoLibraryError createErrorWithType:withDebugMessage:](PLCloudPhotoLibraryError, "createErrorWithType:withDebugMessage:", 1, v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!*MEMORY[0x1E0D115D0])
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v5 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v11 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v4;
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "cplLibrary");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v3 = (void *)v7;
      v8 = *(void **)(a1 + 56);
      if (v8)
      {
        v4 = v8;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v4 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(*(id *)(a1 + 40), "_identifierForResource:", *(_QWORD *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "addProgressBlock:completionHandler:forResourceIdentifier:highPriority:withTaskIdentifier:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), v13, v2, v4))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
        if (!*MEMORY[0x1E0D115D0])
        {
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
          if (v14 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v15 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v14 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v15 = objc_claimAutoreleasedReturnValue();
          }
          v24 = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v25 = *(void **)(a1 + 48);
            v26 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543874;
            v44 = v25;
            v45 = 2114;
            v46 = v4;
            v47 = 2114;
            v48[0] = v26;
            _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Download is inflight for resource %{public}@ with taskIdentifier %{public}@, options: %{public}@", buf, 0x20u);
          }

        }
      }
      else
      {
        if ((_DWORD)v2)
        {
          v16 = objc_msgSend(v4, "hash");
          PLCPLSignpostsTelemetryGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_199541000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "OnDemandDownload", ", buf, 2u);
          }

        }
        if (!*MEMORY[0x1E0D115D0])
        {
          v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
          if (v19 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v19 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v20 = objc_claimAutoreleasedReturnValue();
          }
          v27 = v20;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v28 = *(void **)(a1 + 48);
            v29 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138544130;
            v44 = v28;
            v45 = 2114;
            v46 = v4;
            v47 = 1024;
            LODWORD(v48[0]) = v2;
            WORD2(v48[0]) = 2114;
            *(_QWORD *)((char *)v48 + 6) = v29;
            _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_DEFAULT, "Going to start download for resource %{public}@ with taskIdentifier %{public}@, highPriority %d, %{public}@", buf, 0x26u);
          }

        }
        v30 = *(_QWORD *)(a1 + 64);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __145__PLCloudPhotoLibraryManager_downloadResource_options_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_progressBlock_completionHandler___block_invoke_246;
        v35[3] = &unk_1E3662C08;
        v31 = *(_QWORD *)(a1 + 32);
        v32 = *(_QWORD *)(a1 + 48);
        v35[4] = *(_QWORD *)(a1 + 40);
        v36 = v4;
        v37 = *(id *)(a1 + 48);
        v38 = v13;
        v42 = v2;
        v33 = *(id *)(a1 + 80);
        v34 = *(_QWORD *)(a1 + 104);
        v40 = v33;
        v41 = v34;
        v39 = *(id *)(a1 + 72);
        objc_msgSend(v3, "beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:completionHandler:", v32, v30, v31, v36, v35);

      }
    }
    else
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        if (v9 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v9 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v10 = objc_claimAutoreleasedReturnValue();
        }
        v21 = v10;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", buf, 2u);
        }

      }
      v22 = *(_QWORD *)(a1 + 80);
      v23 = *(_QWORD *)(a1 + 104);
      +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 15);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, uint64_t, id))(v22 + 16))(v22, 0, v23, v4);
      v3 = 0;
    }
  }

}

void __145__PLCloudPhotoLibraryManager_downloadResource_options_clientBundleID_proposedTaskIdentifier_taskDidBeginHandler_progressBlock_completionHandler___block_invoke_246(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setPendingTaskWithTransferTask:withTaskIdentifier:", v3, *(_QWORD *)(a1 + 40));
    if (*MEMORY[0x1E0D115D0])
    {
      v6 = 0;
      goto LABEL_22;
    }
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v4 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v12 = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEBUG, "Start download for resource %@ with task: %@", (uint8_t *)&v12, 0x16u);
    }
    v6 = 0;
    goto LABEL_21;
  }
  +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "reportCompletionForResourceIdentifier:highPriority:withError:", *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 88), v6);
  if (!*MEMORY[0x1E0D115D0])
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v7 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to start download for resource %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_21:

  }
LABEL_22:
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(*(id *)(a1 + 64), "stillAlive");

}

void __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v2 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E3662B78;
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v9 = v4;
  v10 = v5;
  v15 = *(_OWORD *)(a1 + 72);
  v11 = *(id *)(a1 + 32);
  v12 = v2;
  v6 = *(_OWORD *)(a1 + 104);
  v16 = *(_OWORD *)(a1 + 88);
  v17 = v6;
  v18 = *(_OWORD *)(a1 + 120);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v7 = v2;
  objc_msgSend(v3, "performBlock:withPriority:", v8, 1);

}

void __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  _BYTE buf[32];
  _BYTE v29[20];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "rm_cplResourceForResourceType:", *(_QWORD *)(a1 + 80));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
    if (v4 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v4 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "cloudAssetGUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 80);
      v9 = *(_QWORD *)(a1 + 88);
      v10 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v2;
      *(_WORD *)v29 = 2048;
      *(_QWORD *)&v29[2] = v9;
      *(_WORD *)&v29[10] = 2112;
      *(_QWORD *)&v29[12] = v10;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Going to get streaming URL for asset %@ type %lu CPLResource %@ intent %lu hints %@", buf, 0x34u);

    }
  }
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "cplLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      v13 = *(_QWORD *)(a1 + 88);
      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(_QWORD *)(a1 + 64);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_234;
      v26[3] = &unk_1E3662B50;
      v26[4] = *(_QWORD *)(a1 + 40);
      v27 = *(id *)(a1 + 72);
      v16 = *(_OWORD *)(a1 + 112);
      *(_OWORD *)buf = *(_OWORD *)(a1 + 96);
      *(_OWORD *)&buf[16] = v16;
      *(_OWORD *)v29 = *(_OWORD *)(a1 + 128);
      objc_msgSend(v12, "getStreamingURLOrMediaMakerDataForResource:intent:hints:timeRange:clientBundleID:completionHandler:", v2, v13, v14, buf, v15, v26);

    }
    else
    {
      if (!*v3)
      {
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
        if (v20 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v20 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v23 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled, unable to fetch publicURL", buf, 2u);
        }

      }
      v24 = *(_QWORD *)(a1 + 72);
      +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v24 + 16))(v24, 0, 0, 0, 0, v25);

      v12 = 0;
    }
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isPhoto"))
      v17 = 3;
    else
      v17 = 4;
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*v3)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96);
      if (v18 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v18 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v19 = objc_claimAutoreleasedReturnValue();
      }
      v22 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v12;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void __123__PLCloudPhotoLibraryManager_getStreamingURLForAsset_resourceType_intent_hints_timeRange_clientBundleID_completionHandler___block_invoke_234(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!*MEMORY[0x1E0D115D0])
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v16 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v16 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138413058;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v15;
      _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "Got streaming URL %@/media item maker data %@, expiration %@, error %@", (uint8_t *)&v19, 0x2Au);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke_2;
  v5[3] = &unk_1E3676290;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performBlock:", v5);

}

void __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void (**v7)(id, _QWORD, void *);
  __int16 v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a1[4], "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1[5], "scopedIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke_3;
    v9[3] = &unk_1E3662B28;
    v10 = a1[6];
    objc_msgSend(v2, "getCloudCacheForRecordWithScopedIdentifier:completionHandler:", v3, v9);

  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = *((_QWORD *)a1[4] + 12);
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 0;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", (uint8_t *)&v8, 2u);
      }

    }
    v7 = (void (**)(id, _QWORD, void *))a1[6];
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v3);
  }

}

void __71__PLCloudPhotoLibraryManager_fetchResourcesForAsset_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, a3);
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v6 = *(_QWORD *)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v8, "resources");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

    }
    else
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 0, 0);
    }
  }

}

void __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  int8x16_t v4;
  _QWORD v5[4];
  int8x16_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke_2;
  v5[3] = &unk_1E3676290;
  v4 = *(int8x16_t *)(a1 + 32);
  v3 = (id)v4.i64[0];
  v6 = vextq_s8(v4, v4, 8uLL);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "performBlock:", v5);

}

void __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void (**v7)(id, _QWORD, void *);
  __int16 v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a1[4], "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1[5], "scopedIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke_3;
    v9[3] = &unk_1E3662B28;
    v10 = a1[6];
    objc_msgSend(v2, "getCloudCacheForRecordWithScopedIdentifier:completionHandler:", v3, v9);

  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = *((_QWORD *)a1[4] + 12);
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v6 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v8 = 0;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "CPL Library is not yet enabled", (uint8_t *)&v8, 2u);
      }

    }
    v7 = (void (**)(id, _QWORD, void *))a1[6];
    +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 15);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v3);
  }

}

void __76__PLCloudPhotoLibraryManager_fetchAdjustmentDataForAsset_completionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void);
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_6:
    v5();
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    goto LABEL_6;
  }
  objc_msgSend(v7, "adjustments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

LABEL_7:
}

void __34__PLCloudPhotoLibraryManager_sync__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "_canExternallyTransitionToNewLibraryStateIgnoringPause:", 0))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v2 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v3 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v2 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v3 = objc_claimAutoreleasedReturnValue();
      }
      v6 = v3;
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEBUG, "Going to pull changes from CPL", (uint8_t *)&v9, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 5);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 91) = 1;
    if (!*MEMORY[0x1E0D115D0])
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v4 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v4 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v5 = objc_claimAutoreleasedReturnValue();
      }
      v7 = v5;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v8;
        _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEBUG, "Deferring sync because state is %@", (uint8_t *)&v9, 0xCu);

      }
    }
  }
}

uint64_t __81__PLCloudPhotoLibraryManager_cloudChangeTrackerDidReceiveChangesWithTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  result = objc_msgSend(*(id *)(a1 + 32), "_canExternallyTransitionToNewLibraryStateIgnoringPause:", 0);
  if ((_DWORD)result)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEBUG, "Going to fetch new events from change hub from NOTIFICATION", v6, 2u);
      }

    }
    return objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 3);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 90) = 1;
  }
  return result;
}

void __67__PLCloudPhotoLibraryManager__checkIfSharedLibraryDedupeIsDisabled__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "newShortLivedLibraryForHistoryPersistenceReadingWithName:", "-[PLCloudPhotoLibraryManager _checkIfSharedLibraryDedupeIsDisabled]_block_invoke");

  v4 = v7;
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__PLCloudPhotoLibraryManager__checkIfSharedLibraryDedupeIsDisabled__block_invoke_2;
    v8[3] = &unk_1E3677C18;
    v5 = v7;
    v6 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    objc_msgSend(v5, "performBlockAndWait:", v8);

    v4 = v7;
  }

}

void __67__PLCloudPhotoLibraryManager__checkIfSharedLibraryDedupeIsDisabled__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cplConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[PLDuplicateProcessor updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:](PLDuplicateProcessor, "updateSharedLibraryIsEnabledFeatureVersionIfNeededWithPhotoLibrary:cplConfiguration:", v1, v2);

}

void __53__PLCloudPhotoLibraryManager__processNextTransaction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BYTE *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  _BYTE *v37;
  NSObject *v38;
  int v39;
  NSObject *v40;
  NSObject *v41;
  int v42;
  NSObject *v43;
  int v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  _QWORD *v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 92) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  switch(*(_QWORD *)(v2 + 80))
  {
    case 0:
    case 2:
    case 9:
      if (!*MEMORY[0x1E0D115D0])
      {
        v3 = *(_QWORD *)(v2 + 96);
        if (v3 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v4 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v3 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v4 = objc_claimAutoreleasedReturnValue();
        }
        v22 = (uint64_t)v4;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v58 = v23;
          _os_log_impl(&dword_199541000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "Unsupported state for processing: %@", buf, 0xCu);

        }
        goto LABEL_36;
      }
      return;
    case 1:
      objc_msgSend((id)v2, "_openCPLLibrary");
      return;
    case 3:
      objc_msgSend((id)v2, "libraryServicesManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "databaseContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (id)objc_msgSend(v6, "newShortLivedLibraryWithName:", "CPL library: _processNextTransaction.FetchNewEventsFromChangeHub");

      v7 = v52;
      if (v52)
      {
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __53__PLCloudPhotoLibraryManager__processNextTransaction__block_invoke_2;
        v54[3] = &unk_1E3677C18;
        v8 = v52;
        v9 = *(_QWORD *)(a1 + 32);
        v55 = v8;
        v56 = v9;
        objc_msgSend(v8, "performBlockAndWait:", v54);

        v7 = v52;
      }
      goto LABEL_14;
    case 4:
      objc_msgSend((id)v2, "libraryServicesManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "databaseContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (id)objc_msgSend(v11, "newShortLivedCplLibraryWithNameSuffix:", "_processNextTransaction.UploadingBatch");

      objc_msgSend(*(id *)(a1 + 32), "_processUploadBatchInLibrary:", v53);
      goto LABEL_13;
    case 5:
      objc_msgSend((id)v2, "libraryServicesManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "databaseContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (id)objc_msgSend(v13, "newShortLivedCplLibraryWithNameSuffix:", "_processNextTransaction.DownloadingBatch");

      objc_msgSend(*(id *)(a1 + 32), "_downloadFromCloudInLibrary:", v53);
LABEL_13:
      v7 = v53;
LABEL_14:

      return;
    case 6:
      v14 = (_BYTE *)MEMORY[0x1E0D115D0];
      if (!*MEMORY[0x1E0D115D0])
      {
        v15 = *(_QWORD *)(v2 + 96);
        if (v15 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v24 = v16;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Cloud photo manager now idle", buf, 2u);
        }

      }
      +[PLFileDescriptorFuse checkFileDescriptorFuse](PLFileDescriptorFuse, "checkFileDescriptorFuse");
      v25 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)(v25 + 128) == 1)
      {
        if (*(_BYTE *)(v25 + 304) && *(_BYTE *)(v25 + 90))
        {
          if (!*v14)
          {
            v26 = *(_QWORD *)(v25 + 96);
            if (v26 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v27 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v26 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v27 = objc_claimAutoreleasedReturnValue();
            }
            v43 = v27;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              v44 = *(__int16 *)(*(_QWORD *)(a1 + 32) + 132);
              *(_DWORD *)buf = 67109120;
              LODWORD(v58) = v44;
              _os_log_impl(&dword_199541000, v43, OS_LOG_TYPE_DEBUG, "Pause (%d) request detected, but pushing all changes, will pause when push is complete", buf, 8u);
            }

            v25 = *(_QWORD *)(a1 + 32);
          }
          *(_BYTE *)(v25 + 90) = 0;
          goto LABEL_95;
        }
        objc_msgSend((id)v25, "_callPushAllChangesCompletionHandlersIfNecessary");
        if (!*v14)
        {
          v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          if (v30 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v31 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v30 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v31 = objc_claimAutoreleasedReturnValue();
          }
          v41 = v31;
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v42 = *(__int16 *)(*(_QWORD *)(a1 + 32) + 132);
            *(_DWORD *)buf = 67109120;
            LODWORD(v58) = v42;
            _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEBUG, "Pause (%d) request detected, will now pause", buf, 8u);
          }

        }
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 128) = 0;
        objc_msgSend(*(id *)(a1 + 32), "_doPause");
      }
      else if (*(_BYTE *)(v25 + 88))
      {
        *(_BYTE *)(v25 + 88) = 0;
        if (!*v14)
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
          if (v28 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v29 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v28 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v29 = objc_claimAutoreleasedReturnValue();
          }
          v40 = v29;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "Checking enable state at idle", buf, 2u);
          }

        }
        objc_msgSend(*(id *)(a1 + 32), "_checkEnableState");
      }
      else
      {
        v36 = objc_msgSend(*(id *)(v25 + 8), "initialUpload");
        v37 = *(_BYTE **)(a1 + 32);
        if ((v36 & 1) != 0 || v37[90])
        {
          v37[90] = 0;
LABEL_95:
          v45 = *(void **)(a1 + 32);
          v46 = 3;
LABEL_96:
          objc_msgSend(v45, "_transitionToState:", v46);
          goto LABEL_97;
        }
        if (v37[91])
        {
          v37[91] = 0;
          v45 = *(void **)(a1 + 32);
          v46 = 5;
          goto LABEL_96;
        }
        v37[93] = 1;
        PFSharedFigDecodeSessionDiscardCachedBuffers();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "update");
        objc_msgSend(*(id *)(a1 + 32), "_processRulesEvaluationIfNeeded");
        objc_msgSend(*(id *)(a1 + 32), "_updatePendingResetSyncDate");
        objc_msgSend(*(id *)(a1 + 32), "_callPushAllChangesCompletionHandlersIfNecessary");
        v51 = *(_QWORD **)(a1 + 32);
        if (v51[53])
        {
          objc_msgSend(v51, "_unshareBatchOfPendingAssetsSharedToScopeWithTransaction:", *(_QWORD *)(a1 + 40));
          v51 = *(_QWORD **)(a1 + 32);
        }
        objc_msgSend(v51, "_checkIfSharedLibraryDedupeIsDisabled");
      }
LABEL_97:
      if (PLIsEDUMode())
      {
        v47 = *(_QWORD **)(a1 + 32);
        if (!v47[12])
        {
          objc_msgSend(v47, "_idleStateTransitionOneTimeAction");
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            if (objc_msgSend(*(id *)(a1 + 32), "_hasIncomingWorkFileMarker"))
            {
              objc_msgSend(*(id *)(a1 + 32), "_startWorkInProgressTimer");
            }
            else
            {
              if (!*v14)
              {
                v48 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
                if (v48 == 2)
                {
                  __CPLAppLibraryOSLogDomain();
                  v49 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  if (v48 == 1)
                    __CPLSyndicationOSLogDomain();
                  else
                    __CPLSystemLibraryOSLogDomain();
                  v49 = objc_claimAutoreleasedReturnValue();
                }
                v50 = v49;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_DEFAULT, "Will run idleStateTransitionOneTimeAction", buf, 2u);
                }

              }
              objc_msgSend(*(id *)(a1 + 32), "_setIdleStateTransitionOneTimeAction:", 0);
              (*(void (**)(uint64_t))(v22 + 16))(v22);
            }
          }
LABEL_36:

        }
      }
      return;
    case 7:
      if (!*MEMORY[0x1E0D115D0])
      {
        v17 = *(_QWORD *)(v2 + 96);
        if (v17 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v17 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v18 = objc_claimAutoreleasedReturnValue();
        }
        v32 = v18;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEFAULT, "Doing soft reset sync", buf, 2u);
        }

        v2 = *(_QWORD *)(a1 + 32);
      }
      objc_msgSend((id)v2, "libraryServicesManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "databaseContext");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v34, "newShortLivedCplLibraryWithNameSuffix:", "_processNextTransaction.ForceResetSync");

      objc_msgSend(*(id *)(a1 + 32), "_doResetSync:inLibrary:", 1, v35);
      objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 3);

      return;
    case 8:
      v19 = *(_DWORD *)(v2 + 128);
      if (v19)
      {
        if (v19 == 2)
        {
          *(_DWORD *)(v2 + 128) = 0;
          if (!*MEMORY[0x1E0D115D0])
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
            if (v20 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v21 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v20 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v21 = objc_claimAutoreleasedReturnValue();
            }
            v38 = v21;
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              v39 = *(__int16 *)(*(_QWORD *)(a1 + 32) + 132);
              *(_DWORD *)buf = 67109120;
              LODWORD(v58) = v39;
              _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEBUG, "Unpause (%d) request detected, will now unpause", buf, 8u);
            }

          }
          objc_msgSend(*(id *)(a1 + 32), "_doUnpause");
        }
        else
        {
          *(_DWORD *)(v2 + 128) = 0;
        }
      }
      return;
    default:
      return;
  }
}

uint64_t __53__PLCloudPhotoLibraryManager__processNextTransaction__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setChangeSource:", 1);

  return objc_msgSend(*(id *)(a1 + 40), "_fetchNewEventsFromCloudChangeTrackerInLibrary:", *(_QWORD *)(a1 + 32));
}

uint64_t __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_2;
  v4[3] = &unk_1E3662A88;
  v1 = (void *)a1[4];
  v2 = a1[6];
  v4[4] = a1[5];
  v4[5] = v2;
  return objc_msgSend(v1, "enumerateObjectsUsingBlock:", v4);
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "cplResourceIncludeFile:createDirectoryIfNeeded:", 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v4);
  }
  else
  {
    PLResourceCachingGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "Failed to get CPLResource for %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_2_212;
  v12[3] = &unk_1E3662AD8;
  v12[4] = v7;
  v17 = *(id *)(a1 + 56);
  v13 = *(id *)(a1 + 40);
  v14 = v5;
  v15 = v6;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 64);
  v16 = v8;
  v18 = v9;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v7, "_runAsyncOnIsolationQueueWithTransaction:block:", 0, v12);

}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_2_212(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 89))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_3_213;
    v5[3] = &unk_1E36710D8;
    v2 = *(void **)(a1 + 40);
    v6 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    v3 = *(id *)(a1 + 64);
    v4 = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v9 = v4;
    v10 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v2, "performTransactionAndWait:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_3_213(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  PLResourceCachingGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v15 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "%lu resources safe to purge", buf, 0xCu);
  }

  PLResourceCachingGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v15 = v5;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Unsafe resources to purge: %@", buf, 0xCu);
  }

  v6 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_214;
  v10[3] = &unk_1E3662AB0;
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v11 = v7;
  v12 = v8;
  v13 = v9;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_214(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "cacheDeleteSupport");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markResourceAsPurgeable:withUrgency:", v4, *(_QWORD *)(a1 + 48));

  }
}

void __123__PLCloudPhotoLibraryManager__checkAndMarkPurgeableResources_checkIfSafe_checkServerIfNecessary_urgency_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "cacheDeleteSupport");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "markResourceAsPurgeable:withUrgency:", v4, *(_QWORD *)(a1 + 40));

  }
}

void __113__PLCloudPhotoLibraryManager__markPurgeableNextBatchOfResources_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = 100;
  do
  {
    objc_msgSend(*(id *)(a1 + 32), "nextObject");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
      break;
    v5 = (void *)v4;
    objc_msgSend(v2, "addObject:", v4);

    --v3;
  }
  while (v3);
  if (objc_msgSend(v2, "count"))
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(unsigned __int8 *)(a1 + 72);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __113__PLCloudPhotoLibraryManager__markPurgeableNextBatchOfResources_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke_2;
    v11[3] = &unk_1E3664628;
    v11[4] = v6;
    v8 = *(_QWORD *)(a1 + 64);
    v14 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 64);
    v12 = v9;
    v15 = v10;
    v16 = *(_BYTE *)(a1 + 72);
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v6, "_checkAndMarkPurgeableResources:checkIfSafe:checkServerIfNecessary:urgency:completionHandler:", v2, v7, 1, v8, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __113__PLCloudPhotoLibraryManager__markPurgeableNextBatchOfResources_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 89))
    return objc_msgSend(*(id *)(a1 + 32), "_markPurgeableNextBatchOfResources:urgency:checkIfSafe:inLibrary:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __118__PLCloudPhotoLibraryManager_markPurgeableResourcesMatchingPredicate_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setFetchBatchSize:", 100);
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);

  if (v7)
  {
    objc_msgSend(v7, "objectEnumerator");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

uint64_t __118__PLCloudPhotoLibraryManager_markPurgeableResourcesMatchingPredicate_urgency_checkIfSafe_inLibrary_completionHandler___block_invoke_207(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

void __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  uint8_t v17[4];
  void *v18;
  __int128 buf;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[PLInternalResource entityName](PLInternalResource, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (v6)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v20 = 0x2020000000;
    v21 = 0;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke_2;
    v15[3] = &unk_1E3672098;
    v15[4] = &buf;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v6, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      PLResourceCachingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v17 = 138412290;
        v18 = v8;
        v10 = "Failed to enumerate resources to clear purgeable flag: %@";
        v11 = v9;
        v12 = OS_LOG_TYPE_ERROR;
LABEL_10:
        _os_log_impl(&dword_199541000, v11, v12, v10, v17, 0xCu);
      }
    }
    else
    {
      PLResourceCachingGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(void **)(*((_QWORD *)&buf + 1) + 24);
        *(_DWORD *)v17 = 134217984;
        v18 = v14;
        v10 = "Cleared purgeable flags for %ld original resources";
        v11 = v9;
        v12 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_10;
      }
    }

    _Block_object_dispose(&buf, 8);
    goto LABEL_12;
  }
  PLResourceCachingGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch resources to clear purgeable flag: %@", (uint8_t *)&buf, 0xCu);
  }

  v8 = v7;
LABEL_12:

}

uint64_t __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke_206(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

BOOL __99__PLCloudPhotoLibraryManager_clearPurgeableResourcesMatchingPredicate_inLibrary_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = +[PLCacheDeleteSupport clearPurgeableFlagForResource:](PLCacheDeleteSupport, "clearPurgeableFlagForResource:", a2);
  if (result)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __73__PLCloudPhotoLibraryManager__repushAssetsWithImportedByBundleIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint8_t v31[4];
  void *v32;
  _BYTE buf[24];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  objc_msgSend(v28, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("additionalAttributes.importedByBundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudLocalState == %d OR cloudLocalState == %d"), 1, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateForSupportedAssetTypesForUpload](PLManagedAsset, "predicateForSupportedAssetTypesForUpload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);
  objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(v10, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v11);

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  v30 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v6, &v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v30;
  if (v12)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v34 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __73__PLCloudPhotoLibraryManager__repushAssetsWithImportedByBundleIdentifier__block_invoke_2;
    v29[3] = &unk_1E3665110;
    v29[4] = buf;
    objc_msgSend(v3, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v15 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v21 = v16;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        *(_DWORD *)v31 = 138543362;
        v32 = v14;
        v22 = "_repushAssetsWithImportedByBundleIdentifier: save failed with error: %{public}@";
        v23 = v21;
        v24 = OS_LOG_TYPE_ERROR;
LABEL_32:
        _os_log_impl(&dword_199541000, v23, v24, v22, v31, 0xCu);
LABEL_33:

      }
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v19 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v19 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      v27 = *(void **)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v31 = 134349056;
      v32 = v27;
      v22 = "_repushAssetsWithImportedByBundleIdentifier: set importedByBundleIdentifier on %{public}lu masters";
      v23 = v21;
      v24 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
    _Block_object_dispose(buf, 8);
    goto LABEL_35;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v17 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v25 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "predicate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "_repushAssetsWithImportedByBundleIdentifier: fetch failed with predicate %{public}@, error: %{public}@", buf, 0x16u);

    }
  }
  v14 = v13;
LABEL_35:

}

void __73__PLCloudPhotoLibraryManager__repushAssetsWithImportedByBundleIdentifier__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "master");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "importedByBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setImportedByBundleIdentifier:", v4);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

}

void __67__PLCloudPhotoLibraryManager__repushMasterWithMissingMediaMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[7];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint8_t v36[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE buf[24];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL && %K == NULL"), CFSTR("master"), CFSTR("master.mediaMetadata.data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateForSupportedAssetTypesForUpload](PLManagedAsset, "predicateForSupportedAssetTypesForUpload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);
  objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v11);

  objc_msgSend(v7, "setFetchBatchSize:", 100);
  v35 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v7, &v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v35;
  if (v12)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v41 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x2020000000;
    v34 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __67__PLCloudPhotoLibraryManager__repushMasterWithMissingMediaMetadata__block_invoke_2;
    v30[3] = &unk_1E3665890;
    v30[4] = *(_QWORD *)(a1 + 32);
    v30[5] = buf;
    v30[6] = &v31;
    objc_msgSend(v4, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, v30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v15 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v21 = v16;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        *(_DWORD *)v36 = 138543362;
        v37 = v14;
        v22 = "_repushMasterWithMissingMediaMetadata: save failed with error: %{public}@";
        v23 = v21;
        v24 = OS_LOG_TYPE_ERROR;
        v25 = 12;
LABEL_32:
        _os_log_impl(&dword_199541000, v23, v24, v22, v36, v25);
LABEL_33:

      }
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v19 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v19 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      v28 = *(void **)(*(_QWORD *)&buf[8] + 24);
      v29 = v32[3];
      *(_DWORD *)v36 = 134349312;
      v37 = v28;
      v38 = 2050;
      v39 = v29;
      v22 = "_repushMasterWithMissingMediaMetadata: set media metadata on %{public}lu (img) %{public}lu (vid) masters";
      v23 = v21;
      v24 = OS_LOG_TYPE_DEFAULT;
      v25 = 22;
      goto LABEL_32;
    }
    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(buf, 8);
    goto LABEL_35;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v17 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v26 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "predicate");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: fetch failed with predicate %{public}@, error: %{public}@", buf, 0x16u);

    }
  }
  v14 = v13;
LABEL_35:

}

void __67__PLCloudPhotoLibraryManager__repushMasterWithMissingMediaMetadata__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  const __CFData *v10;
  NSObject *v11;
  void *v12;
  CGImageSource *v13;
  CGImageSource *v14;
  CFDictionaryRef v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "masterResourceForCPLType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isLocallyAvailable");

  if (v5)
  {
    objc_msgSend(v3, "master");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (objc_msgSend(v3, "isPhoto"))
      {
        v8 = objc_alloc(MEMORY[0x1E0C99D50]);
        objc_msgSend(v7, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = 0;
        v10 = (const __CFData *)objc_msgSend(v8, "initWithContentsOfFile:options:error:", v9, 1, &v61);
        v11 = v61;

        if (!v10)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            v35 = *(_QWORD *)(a1[4] + 96);
            if (v35 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v36 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v35 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v36 = objc_claimAutoreleasedReturnValue();
            }
            v48 = v36;
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v63 = v11;
              _os_log_impl(&dword_199541000, v48, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata (img) Reading Error: %{public}@", buf, 0xCu);
            }

          }
          goto LABEL_95;
        }
        v12 = (void *)MEMORY[0x19AEC1554]();
        v13 = CGImageSourceCreateWithData(v10, 0);
        if (!v13)
        {
          if (*MEMORY[0x1E0D115D0])
          {
LABEL_94:
            objc_autoreleasePoolPop(v12);
            goto LABEL_95;
          }
          v38 = *(_QWORD *)(a1[4] + 96);
          if (v38 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v39 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v38 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v39 = objc_claimAutoreleasedReturnValue();
          }
          v49 = v39;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v3, "uuid");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v63 = v50;
            _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: failed to create CGImage for extracting media metadata %{public}@", buf, 0xCu);

          }
LABEL_93:

          goto LABEL_94;
        }
        v14 = v13;
        v58 = v12;
        v15 = CGImageSourceCopyPropertiesAtIndex(v13, 0, 0);
        v16 = (void *)MEMORY[0x1E0CB38B0];
        v57 = v15;
        +[PLPropertyListFilter filterPropertyList:](PLPropertyListFilter, "filterPropertyList:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        objc_msgSend(v16, "dataWithPropertyList:format:options:error:", v17, 200, 0, &v60);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v60;

        if (v18)
        {
          v20 = objc_msgSend(v18, "length");
          if (v20 <= objc_msgSend(MEMORY[0x1E0D11410], "maxInlineDataSize"))
          {
            ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
            objc_msgSend(v6, "mediaMetadata");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setValue:forKey:", v18, CFSTR("data"));

            objc_msgSend(v6, "setMediaMetadataType:", CFSTR("CGImageProperties"));
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            v21 = *(_QWORD *)(a1[4] + 96);
            if (v21 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v22 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v21 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v22 = objc_claimAutoreleasedReturnValue();
            }
            v53 = v22;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v3, "uuid");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v63 = v54;
              _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: media metadata (img) for %{public}@ is too large, skipping", buf, 0xCu);

            }
LABEL_91:

          }
        }
        else if (!*MEMORY[0x1E0D115D0])
        {
          v42 = *(_QWORD *)(a1[4] + 96);
          if (v42 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v43 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v42 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v43 = objc_claimAutoreleasedReturnValue();
          }
          v53 = v43;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v63 = v19;
            _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata (img) Serialization Error: %{public}@", buf, 0xCu);
          }
          goto LABEL_91;
        }
        CFRelease(v14);

        v49 = v57;
        v12 = v58;
        goto LABEL_93;
      }
      if (objc_msgSend(v3, "isVideo"))
      {
        objc_msgSend(MEMORY[0x1E0C8B3C0], "URLAssetWithURL:options:", v7, 0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          if (!*MEMORY[0x1E0D115D0])
          {
            v40 = *(_QWORD *)(a1[4] + 96);
            if (v40 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v41 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v40 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v41 = objc_claimAutoreleasedReturnValue();
            }
            v51 = v41;
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v3, "uuid");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v63 = v52;
              _os_log_impl(&dword_199541000, v51, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: failed to create AVAsset for extracting media metadata %{public}@", buf, 0xCu);

            }
          }
          v11 = 0;
          goto LABEL_96;
        }
        v11 = v25;
        v26 = (void *)MEMORY[0x19AEC1554]();
        -[NSObject propertyListForProxy](v11, "propertyListForProxy");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v27, 200, 0, &v59);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v59;
        if (v28)
        {
          v30 = objc_msgSend(v28, "length");
          if (v30 <= objc_msgSend(MEMORY[0x1E0D11410], "maxInlineDataSize"))
          {
            ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
            objc_msgSend(v6, "mediaMetadata");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setValue:forKey:", v28, CFSTR("data"));

            objc_msgSend(v6, "setMediaMetadataType:", CFSTR("AVAssetProxy"));
          }
          else if (!*MEMORY[0x1E0D115D0])
          {
            v31 = *(_QWORD *)(a1[4] + 96);
            if (v31 == 2)
            {
              __CPLAppLibraryOSLogDomain();
              v32 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              if (v31 == 1)
                __CPLSyndicationOSLogDomain();
              else
                __CPLSystemLibraryOSLogDomain();
              v32 = objc_claimAutoreleasedReturnValue();
            }
            v55 = v32;
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v3, "uuid");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v63 = v56;
              _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata: media metadata (vid) for %{public}@ is too large, skipping", buf, 0xCu);

            }
LABEL_107:

          }
        }
        else if (!*MEMORY[0x1E0D115D0])
        {
          v45 = *(_QWORD *)(a1[4] + 96);
          if (v45 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v46 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v45 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v46 = objc_claimAutoreleasedReturnValue();
          }
          v55 = v46;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v63 = v29;
            _os_log_impl(&dword_199541000, v55, OS_LOG_TYPE_ERROR, "_repushMasterWithMissingMediaMetadata (vid) Serialization Error: %{public}@", buf, 0xCu);
          }
          goto LABEL_107;
        }

        objc_autoreleasePoolPop(v26);
        goto LABEL_96;
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        v33 = *(_QWORD *)(a1[4] + 96);
        if (v33 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v34 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v33 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v34 = objc_claimAutoreleasedReturnValue();
        }
        v11 = v34;
        if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          goto LABEL_96;
        objc_msgSend(v3, "uuid");
        v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v63 = v10;
        v37 = "_repushMasterWithMissingMediaMetadata: unknown asset type %{public}@";
        goto LABEL_60;
      }
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v23 = *(_QWORD *)(a1[4] + 96);
      if (v23 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v24 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v23 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v24 = objc_claimAutoreleasedReturnValue();
      }
      v11 = v24;
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        goto LABEL_96;
      objc_msgSend(v3, "uuid");
      v10 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v63 = v10;
      v37 = "_repushMasterWithMissingMediaMetadata: nil file url %{public}@";
LABEL_60:
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, v37, buf, 0xCu);
LABEL_95:

LABEL_96:
    }

  }
}

void __56__PLCloudPhotoLibraryManager__repushVideoAssetsMetadata__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  _QWORD v29[6];
  id v30;
  uint8_t v31[4];
  void *v32;
  _BYTE buf[24];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  objc_msgSend(v28, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudLocalState == %d OR cloudLocalState == %d"), 1, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedAsset predicateForSupportedAssetTypesForUpload](PLManagedAsset, "predicateForSupportedAssetTypesForUpload");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);
  objc_msgSend(v10, "addObject:", v9);
  objc_msgSend(v10, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v11);

  objc_msgSend(v6, "setFetchBatchSize:", 100);
  v30 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v6, &v30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v30;
  if (v12)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v34 = 0;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __56__PLCloudPhotoLibraryManager__repushVideoAssetsMetadata__block_invoke_2;
    v29[3] = &unk_1E366FD70;
    v29[4] = *(_QWORD *)(a1 + 32);
    v29[5] = buf;
    objc_msgSend(v3, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v15 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v15 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v21 = v16;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          goto LABEL_33;
        *(_DWORD *)v31 = 138543362;
        v32 = v14;
        v22 = "_repushVideoAssetsMetadata: save failed with error: %{public}@";
        v23 = v21;
        v24 = OS_LOG_TYPE_ERROR;
LABEL_32:
        _os_log_impl(&dword_199541000, v23, v24, v22, v31, 0xCu);
LABEL_33:

      }
    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v19 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v19 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v21 = v20;
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      v27 = *(void **)(*(_QWORD *)&buf[8] + 24);
      *(_DWORD *)v31 = 134349056;
      v32 = v27;
      v22 = "_repushVideoAssetsMetadata: set videoFrameRate and codecName on %{public}lu masters";
      v23 = v21;
      v24 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_32;
    }
    _Block_object_dispose(buf, 8);
    goto LABEL_35;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v17 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v25 = v18;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "predicate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "_repushVideoAssetsMetadata: fetch failed with predicate %{public}@, error: %{public}@", buf, 0x16u);

    }
  }
  v14 = v13;
LABEL_35:

}

void __56__PLCloudPhotoLibraryManager__repushVideoAssetsMetadata__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  NSObject *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "master");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mediaMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C8AF90], "assetProxyWithPropertyList:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setVideoInfoOnMasterFromAVAsset:", v9);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
    else
    {
      if (*MEMORY[0x1E0D115D0])
      {
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v12 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v12 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
      }
      v9 = v13;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "scopedIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v17;
        v21 = 2114;
        v22 = v8;
        _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "_repushVideoAssetsMetadata: unable to serialize videoProperties for %{public}@: %{public}@", buf, 0x16u);

      }
    }

    goto LABEL_23;
  }
  if (!*MEMORY[0x1E0D115D0])
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v10 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "scopedIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v15;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "_repushVideoAssetsMetadata: unable to find mediaPropertiesData for %{public}@", buf, 0xCu);

    }
    goto LABEL_24;
  }
LABEL_25:

}

uint64_t __90__PLCloudPhotoLibraryManager__handleOptimizeSettingChangeInLibrary_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleOptimizeModeChange");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __90__PLCloudPhotoLibraryManager__handleOptimizeSettingChangeInLibrary_withCompletionHandler___block_invoke_175(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "resourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleOptimizeModeChange");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[89])
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_2;
    v5[3] = &unk_1E3677530;
    v3 = *(id *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v6 = v3;
    v7 = v4;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v1, "_reportOptimizeSettingChangeWithCompletionHandler:", v5);

  }
}

void __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  objc_msgSend(*(id *)(a1 + 32), "clearRunOnceFlag:error:", 2, 0);
  objc_msgSend(*(id *)(a1 + 40), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager _handleOptimizeSettingChange]_block_invoke_2");

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v5 + 440) + 1;
  *(_QWORD *)(v5 + 440) = v6;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_3;
  v8[3] = &unk_1E3674F30;
  v7 = *(void **)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v10 = v7;
  v12 = v6;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "_handleOptimizeSettingChangeInLibrary:withCompletionHandler:", v4, v8);

}

void __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_3(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  uint64_t v6;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_4;
  v4[3] = &unk_1E3677C40;
  v3 = (void *)a1[6];
  v6 = a1[7];
  v4[4] = v1;
  v5 = v3;
  objc_msgSend(v1, "_runAsyncOnIsolationQueueWithTransaction:block:", v2, v4);

}

uint64_t __58__PLCloudPhotoLibraryManager__handleOptimizeSettingChange__block_invoke_4(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == *(_QWORD *)(*(_QWORD *)(result + 32) + 440))
    return objc_msgSend(*(id *)(result + 40), "clearRunOnceFlag:error:", 1, 0);
  return result;
}

void __52__PLCloudPhotoLibraryManager_reportMiscInformation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!*MEMORY[0x1E0D115D0])
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v2 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v3 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEFAULT, "Reporting info %@", (uint8_t *)&v7, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reportMiscInformation:", *(_QWORD *)(a1 + 40));

}

_QWORD *__60__PLCloudPhotoLibraryManager__constructUnpauseTimerFrom_to___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD **)(a1 + 32);
  if (result[20] == *(_QWORD *)(a1 + 40))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = result[12];
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(__int16 *)(*(_QWORD *)(a1 + 32) + 132);
        v7[0] = 67109120;
        v7[1] = v6;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Unpause (%d) timer triggered, will unpause Cloud Photo Library", (uint8_t *)v7, 8u);
      }

      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "setPause:reason:", 0, *(__int16 *)(a1 + 48));
  }
  return result;
}

uint64_t __70__PLCloudPhotoLibraryManager__resetDidCallBlocksWaitingForLibraryOpen__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 305) = 0;
  return result;
}

uint64_t __62__PLCloudPhotoLibraryManager__callBlocksWaitingForLibraryOpen__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 305) = 1;
  return result;
}

void __69__PLCloudPhotoLibraryManager__runOnLibraryOpenWithTransaction_block___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  id v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 305);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __69__PLCloudPhotoLibraryManager__runOnLibraryOpenWithTransaction_block___block_invoke_2;
    v7 = &unk_1E3675C58;
    v9 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 40);
    v3 = (void *)MEMORY[0x19AEC174C](&v4);
    objc_msgSend(v2, "addObject:", v3, v4, v5, v6, v7);

  }
}

uint64_t __69__PLCloudPhotoLibraryManager__runOnLibraryOpenWithTransaction_block___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __88__PLCloudPhotoLibraryManager__runAsyncOnIsolationQueueWithTransaction_afterDelay_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __77__PLCloudPhotoLibraryManager__runAsyncOnIsolationQueueWithTransaction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "stillAlive");
}

uint64_t __64__PLCloudPhotoLibraryManager__runSyncOnIsolationQueueWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __86__PLCloudPhotoLibraryManager__disableiCPLWillBecomeNonSyncablePhotoLibrary_resetMode___block_invoke(uint64_t a1)
{
  PLGlobalValues *v2;
  void *v3;
  PLGlobalValues *v4;

  v2 = [PLGlobalValues alloc];
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLGlobalValues initWithManagedObjectContext:](v2, "initWithManagedObjectContext:", v3);

  -[PLGlobalValues setCloudTrackerLastKnownCloudVersion:](v4, "setCloudTrackerLastKnownCloudVersion:", 0);
  -[PLGlobalValues setCloudTrackerLastKnownToken:](v4, "setCloudTrackerLastKnownToken:", 0);
  -[PLGlobalValues setLibraryScopeRulesTrackerLastKnownToken:](v4, "setLibraryScopeRulesTrackerLastKnownToken:", 0);
  -[PLGlobalValues setCloudInitialUploadCompleted:](v4, "setCloudInitialUploadCompleted:", 0);

}

void __86__PLCloudPhotoLibraryManager__disableiCPLWillBecomeNonSyncablePhotoLibrary_resetMode___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

_QWORD *__60__PLCloudPhotoLibraryManager__disableiCPLSyncWithResetMode___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = *(_QWORD **)(a1 + 32);
  if (!result[10])
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = result[12];
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "pathManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "libraryURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Opening CPL for iCPL disable before library deletion: %@", (uint8_t *)&v8, 0xCu);

      }
      result = *(_QWORD **)(a1 + 32);
    }
    return (_QWORD *)objc_msgSend(result, "_transitionToState:", 1);
  }
  return result;
}

uint64_t __60__PLCloudPhotoLibraryManager__disableiCPLSyncWithResetMode___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:", 1, *(_QWORD *)(a1 + 40));
}

void __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[10] == 9)
  {
    if (*MEMORY[0x1E0D115D0])
      return;
    v3 = v2[12];
    if (v3 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v7 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Not disabling, CPL already deactivated", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v2, "libraryServicesManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indicatorFileCoordinator");
    v7 = objc_claimAutoreleasedReturnValue();

    if ((-[NSObject isDisableICloudPhotos](v7, "isDisableICloudPhotos") & 1) != 0)
    {
      v8 = *(_QWORD **)(a1 + 32);
      if (!v8[10])
      {
        if (!*MEMORY[0x1E0D115D0])
        {
          v9 = v8[12];
          if (v9 == 2)
          {
            __CPLAppLibraryOSLogDomain();
            v10 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v9 == 1)
              __CPLSyndicationOSLogDomain();
            else
              __CPLSystemLibraryOSLogDomain();
            v10 = objc_claimAutoreleasedReturnValue();
          }
          v17 = v10;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(*(id *)(a1 + 32), "pathManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "libraryURL");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v30 = v19;
            _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Opening CPL for iCPL disable: %@", buf, 0xCu);

          }
          v8 = *(_QWORD **)(a1 + 32);
        }
        objc_msgSend(v8, "_transitionToState:", 1);
        v8 = *(_QWORD **)(a1 + 32);
      }
      if (!*MEMORY[0x1E0D115D0])
      {
        v20 = v8[12];
        if (v20 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v21 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v20 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v21 = objc_claimAutoreleasedReturnValue();
        }
        v22 = v21;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "pathManager");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "libraryURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v30 = v24;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "Waiting for CPL to open for iCPL disable: %@", buf, 0xCu);

        }
        v8 = *(_QWORD **)(a1 + 32);
      }
      v25 = *(void **)(a1 + 40);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke_131;
      v26[3] = &unk_1E3676290;
      v26[4] = v8;
      v27 = v25;
      v28 = *(id *)(a1 + 48);
      objc_msgSend(v8, "_runOnLibraryOpenWithTransaction:block:", v27, v26);

    }
    else if (!*MEMORY[0x1E0D115D0])
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v11 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "pathManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "libraryURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v30 = v15;
        v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Not disabling, CPL disable marker missing for library %@, state: %{public}@", buf, 0x16u);

      }
    }
  }

}

void __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke_131(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_resetDidCallBlocksWaitingForLibraryOpen");
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E3675C58;
  v4[4] = v2;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_runAsyncOnIsolationQueueWithTransaction:block:", v3, v4);

}

uint64_t __63__PLCloudPhotoLibraryManager_disableiCPLWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:", 0, 2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __36__PLCloudPhotoLibraryManager__pause__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_calculateUnpauseTimeForPauseTime:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indicatorFileCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "createPauseMarkerWithUnpauseTime:reason:", v3, *(__int16 *)(*(_QWORD *)(a1 + 32) + 132));
  v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (objc_msgSend(*(id *)(a1 + 32), "_canExternallyTransitionToNewLibraryStateIgnoringPause:", 1))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v8 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(__int16 *)(v11 + 132);
        objc_msgSend((id)v11, "_debugNameForState:", *(_QWORD *)(v11 + 80));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = 67109378;
        v14[1] = v12;
        v15 = 2112;
        v16 = v13;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Going to pause (%d) Cloud Photo Library from %@", (uint8_t *)v14, 0x12u);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_doPause");
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 128) = 1;
  }
  objc_sync_exit(v7);

}

void __38__PLCloudPhotoLibraryManager__unpause__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 80) == 8)
  {
    if (objc_msgSend((id)v3, "_canExternallyTransitionToNewLibraryStateIgnoringPause:", 1))
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
        if (v4 == 2)
        {
          __CPLAppLibraryOSLogDomain();
          v5 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v4 == 1)
            __CPLSyndicationOSLogDomain();
          else
            __CPLSystemLibraryOSLogDomain();
          v5 = objc_claimAutoreleasedReturnValue();
        }
        v8 = v5;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(__int16 *)(*(_QWORD *)(a1 + 32) + 132);
          v14[0] = 67109120;
          v14[1] = v9;
          _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Going to unpause (%d) Cloud Photo Library", (uint8_t *)v14, 8u);
        }

      }
      objc_msgSend(*(id *)(a1 + 32), "_doUnpause");
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 128) = 2;
    }
  }
  else if (*(_DWORD *)(v3 + 128) == 1)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v6 = *(_QWORD *)(v3 + 96);
      if (v6 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v6 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v10 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_DEFAULT, "Going to cancel previous pause request for Cloud Photo Library", (uint8_t *)v14, 2u);
      }

      v3 = *(_QWORD *)(a1 + 32);
    }
    *(_DWORD *)(v3 + 128) = 0;
    *(_WORD *)(*(_QWORD *)(a1 + 32) + 132) = 0;
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "libraryBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "indicatorFileCoordinator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "clearPauseMarkerForReason:", 3);
  }
  objc_sync_exit(v2);

}

_WORD *__46__PLCloudPhotoLibraryManager_setPause_reason___block_invoke(uint64_t a1)
{
  int v2;
  _WORD *result;

  v2 = *(unsigned __int16 *)(a1 + 40);
  result = *(_WORD **)(a1 + 32);
  if (v2 == 3 || result[66] != 3)
  {
    if (*(_BYTE *)(a1 + 42))
    {
      if (result[66] != 3)
      {
        result[66] = v2;
        result = *(_WORD **)(a1 + 32);
      }
      return (_WORD *)objc_msgSend(result, "_pause");
    }
    else
    {
      return (_WORD *)objc_msgSend(result, "_unpause");
    }
  }
  return result;
}

void __86__PLCloudPhotoLibraryManager_cplHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "cplLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __86__PLCloudPhotoLibraryManager_cplHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_2;
    v5[3] = &unk_1E36768D0;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v2, "checkHasBackgroundDownloadOperationsWithCompletionHandler:", v5);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      +[PLCloudPhotoLibraryError createErrorWithType:](PLCloudPhotoLibraryError, "createErrorWithType:", 5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v4);

    }
  }

}

uint64_t __86__PLCloudPhotoLibraryManager_cplHasBackgroundDownloadOperationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearRunOnceFlag:error:", 2, 0);
}

uint64_t __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 48) == *(_QWORD *)(*(_QWORD *)(result + 32) + 440))
    return objc_msgSend(*(id *)(result + 40), "clearRunOnceFlag:error:", 1, 0);
  return result;
}

uint64_t __76__PLCloudPhotoLibraryManager__runOneTimeMigrationStepsIfNecessaryInLibrary___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removePartialVideoDirectory");

  return objc_msgSend(*(id *)(a1 + 40), "clearRunOnceFlag:error:", 4, 0);
}

void __75__PLCloudPhotoLibraryManager__initializeMasterAndSizeCalculationinLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "librarySizesFromDBForLibraryKindMask:", 32);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cplLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEstimatedInitialSizeForLocalLibrary:", objc_msgSend(v5, "unsignedIntegerValue"));

  v7 = 0;
  v8 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "getPhotoCount:videoCount:excludeTrashed:excludeInvisible:excludeCloudShared:", &v8, &v7, 0, 0, 1))
  {
    objc_msgSend(*(id *)(a1 + 40), "cplLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEstimatedInitialAssetCountForLocalLibrary:", v7 + v8);

  }
}

void __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_2;
  v7[3] = &unk_1E3677530;
  v7[4] = v4;
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v4, "_runAsyncOnIsolationQueueWithTransaction:block:", v5, v7);

}

void __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  PLCloudBatchDownloader *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  PLCloudTaskManager *v43;
  uint64_t v44;
  void *v45;
  PLCloudInMemoryTaskManager *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  _QWORD v70[5];
  _QWORD v71[5];
  uint8_t buf[4];
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v2 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v3 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v3 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 134218498;
      v73 = v6;
      v74 = 2112;
      v75 = v6;
      v76 = 2112;
      v77 = v7;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Opened cplLibrary (%p) %@ %@", buf, 0x20u);
    }

  }
  v8 = objc_msgSend(*(id *)(a1 + 40), "state");
  if (v8 == 3 || v8 == 0)
  {
    if (!*v2)
    {
      v10 = v8;
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v11 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v15 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0D113A0], "stateDescriptionForState:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v73 = v16;
        v74 = 2112;
        v75 = v16;
        v76 = 2114;
        v77 = v17;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Opened cplLibrary was already closed by iCPL disable, disregarding: (%p) %@ %{public}@", buf, 0x20u);

      }
    }
  }
  else if (*(_QWORD *)(a1 + 48)
         || (objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager"),
             v18 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v18, "databaseContext"),
             v19 = (void *)objc_claimAutoreleasedReturnValue(),
             v20 = (void *)objc_msgSend(v19, "newShortLivedCplLibraryWithNameSuffix:", "-[PLCloudPhotoLibraryManager _openCPLLibrary]_block_invoke"), v19, v18, !v20))
  {
    if (!*v2)
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v13 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v13 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v23 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v24 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v73 = v24;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Error opening cloud photo library: %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_callBlocksWaitingForLibraryOpen");
    objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 0);
  }
  else
  {
    if (!*v2)
    {
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v21 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v21 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v25 = v22;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_DEFAULT, "Setting up CPLStatus for CacheDelete support", buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "syncStatus");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCPLStatus:", v26);
    v27 = *(void **)(a1 + 32);
    objc_msgSend(v27, "cplLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "configuration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCPLConfiguration:", v29);

    objc_msgSend(*(id *)(a1 + 32), "_setupPLCPLPlistInLibrary:", v20);
    objc_msgSend(*(id *)(a1 + 32), "_setReadyForAnalysisWithCPLStatus:", v26);
    v30 = *(void **)(a1 + 32);
    objc_msgSend(v30, "cplConfiguration");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_notifyCPLStatus:didChange:andCPLConfiguration:", v26, 0, v31);

    if (!*v2)
    {
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v32 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v33 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v32 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v33 = objc_claimAutoreleasedReturnValue();
      }
      v34 = v33;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_DEFAULT, "Creating batch downloader", buf, 2u);
      }

    }
    v35 = [PLCloudBatchDownloader alloc];
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[PLCloudBatchDownloader initWithLibraryServicesManager:manager:](v35, "initWithLibraryServicesManager:manager:", v36, *(_QWORD *)(a1 + 32));
    v38 = *(_QWORD *)(a1 + 32);
    v39 = *(void **)(v38 + 16);
    *(_QWORD *)(v38 + 16) = v37;

    if (!*v2)
    {
      v40 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v40 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v41 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v40 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v41 = objc_claimAutoreleasedReturnValue();
      }
      v42 = v41;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "Setting up task manager", buf, 2u);
      }

    }
    v43 = objc_alloc_init(PLCloudTaskManager);
    v44 = *(_QWORD *)(a1 + 32);
    v45 = *(void **)(v44 + 136);
    *(_QWORD *)(v44 + 136) = v43;

    v46 = objc_alloc_init(PLCloudInMemoryTaskManager);
    v47 = *(_QWORD *)(a1 + 32);
    v48 = *(void **)(v47 + 248);
    *(_QWORD *)(v47 + 248) = v46;

    objc_msgSend(*(id *)(a1 + 32), "cacheDeleteSupport");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = *v2;
    if (v49 && !*v2)
    {
      v51 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v51 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v52 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v51 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v52 = objc_claimAutoreleasedReturnValue();
      }
      v53 = v52;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v53, OS_LOG_TYPE_DEFAULT, "CacheDelete support is initialized", buf, 2u);
      }

      v50 = *v2;
    }
    if (!v50)
    {
      v54 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v54 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v55 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v54 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v55 = objc_claimAutoreleasedReturnValue();
      }
      v56 = v55;
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v56, OS_LOG_TYPE_DEFAULT, "Setting up foreground monitor", buf, 2u);
      }

    }
    v57 = MEMORY[0x1E0C809B0];
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96))
    {
      +[PLForegroundMonitor bundleIdentifiersToMonitorForSystemLibrary](PLForegroundMonitor, "bundleIdentifiersToMonitorForSystemLibrary");
      v58 = objc_claimAutoreleasedReturnValue();
      if (v58)
      {
        v59 = (void *)v58;
        +[PLForegroundMonitor sharedInstance](PLForegroundMonitor, "sharedInstance");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = v57;
        v71[1] = 3221225472;
        v71[2] = __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_115;
        v71[3] = &unk_1E3663AC0;
        v71[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v60, "startMonitoringBundleIdentifiers:block:", v59, v71);
        v61 = objc_claimAutoreleasedReturnValue();
        v62 = *(_QWORD *)(a1 + 32);
        v63 = *(void **)(v62 + 64);
        *(_QWORD *)(v62 + 64) = v61;

      }
    }
    +[PLForegroundMonitor sharedInstance](PLForegroundMonitor, "sharedInstance");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    PLCameraBundleIdentifiers();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v57;
    v70[1] = 3221225472;
    v70[2] = __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_2_117;
    v70[3] = &unk_1E3663AC0;
    v70[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v64, "startMonitoringBundleIdentifiers:block:", v65, v70);
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = *(_QWORD *)(a1 + 32);
    v68 = *(void **)(v67 + 72);
    *(_QWORD *)(v67 + 72) = v66;

    objc_msgSend(*(id *)(a1 + 32), "resourceManager");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "startAutomaticPrefetchAndPruneWithTimeout:", 1);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 91) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 89) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_runOneTimeMigrationStepsWithoutiCPLIfNecessary");
    objc_msgSend(*(id *)(a1 + 32), "_callBlocksWaitingForLibraryOpen");
    objc_msgSend(*(id *)(a1 + 32), "_transitionToState:", 2);

  }
}

uint64_t __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_115(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appWithBundleIdentifier:changedStateToForeground:", a2, a3);
}

uint64_t __45__PLCloudPhotoLibraryManager__openCPLLibrary__block_invoke_2_117(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cameraChangedStateToForeground:");
}

void __41__PLCloudPhotoLibraryManager__enableiCPL__block_invoke_86(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __41__PLCloudPhotoLibraryManager__enableiCPL__block_invoke_101(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id *v12;
  id WeakRetained;
  int v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "databaseContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newShortLivedLibraryWithName:", "com.apple.photos.uploaddownloadcount.coalescer");

  v8 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
    if (v9 == 2)
    {
      __CPLAppLibraryOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 == 1)
        __CPLSyndicationOSLogDomain();
      else
        __CPLSystemLibraryOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Revalidate unpushed/pushed asset count on idle", buf, 2u);
    }

  }
  v12 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v14 = objc_msgSend(WeakRetained, "_hasItemToDownload");

  if (v14)
  {
    if (!*v8)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v15 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v15 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Recalculate updateTransferCounts", v20, 2u);
      }

    }
    v18 = objc_loadWeakRetained(v12);
    objc_msgSend(v18, "_updateTransferCountsInLibrary:", v7);

  }
  v19 = objc_loadWeakRetained(v12);

  if (v19)
    objc_msgSend(v4, "delayNextInvocationByTimeInterval:", 60.0);

}

PLManagedAssetRecoveryManager *__50__PLCloudPhotoLibraryManager__initRecoveryManager__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PLManagedAssetRecoveryManager *v2;
  void *v3;
  PLManagedAssetRecoveryManager *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PLManagedAssetRecoveryManager alloc];
    objc_msgSend(WeakRetained, "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PLManagedAssetRecoveryManager initWithLibraryServicesManager:](v2, "initWithLibraryServicesManager:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

PLCloudResourceManager *__50__PLCloudPhotoLibraryManager__initResourceManager__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PLCloudResourceManager *v2;
  void *v3;
  PLCloudResourceManager *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [PLCloudResourceManager alloc];
    objc_msgSend(WeakRetained, "libraryServicesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PLCloudResourceManager initWithCPLManager:libraryServicesManager:](v2, "initWithCPLManager:libraryServicesManager:", WeakRetained, v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

PLCacheDeleteSupport *__53__PLCloudPhotoLibraryManager__initCacheDeleteSupport__block_invoke(uint64_t a1)
{
  id WeakRetained;
  PLCacheDeleteSupport *v3;
  uint64_t v4;
  void *v5;
  PLCacheDeleteSupport *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [PLCacheDeleteSupport alloc];
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "cplStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PLCacheDeleteSupport initWithLibraryServicesManager:cplStatus:](v3, "initWithLibraryServicesManager:cplStatus:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __62__PLCloudPhotoLibraryManager_enableiCPLWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorFileCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "logCloudServiceEnableEvent:serviceName:reason:", 1, CFSTR("CPL"), 0);
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 89))
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v6 = *(_QWORD *)(v5 + 96);
      if (v6 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v6 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v12 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "iCPL already enabled, skip enabling again", (uint8_t *)&v18, 2u);
      }

    }
  }
  else if (*(_QWORD *)(v5 + 80) == 6)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v8 = *(_QWORD *)(v5 + 96);
      if (v8 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v9;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Checking enable state while idle", (uint8_t *)&v18, 2u);
      }

      v5 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v5, "_checkEnableState");
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v10 = *(_QWORD *)(v5 + 96);
      if (v10 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v10 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v11 = objc_claimAutoreleasedReturnValue();
      }
      v14 = v11;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "_debugNameForState:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v15;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Currently in state %@, will check enable state while idle", (uint8_t *)&v18, 0xCu);

      }
      v5 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v5 + 88) = 1;
    v16 = *(_QWORD **)(a1 + 32);
    if (!v16[10])
      objc_msgSend(v16, "_transitionToState:", 1);
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(void))(v17 + 16))();

}

void __44__PLCloudPhotoLibraryManager_setCPLLibrary___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

id __40__PLCloudPhotoLibraryManager_cplLibrary__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 104);
}

uint64_t __58__PLCloudPhotoLibraryManager_invalidateCacheDeleteSupport__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __55__PLCloudPhotoLibraryManager_invalidateResourceManager__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidate");
}

uint64_t __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_initCacheDeleteSupport");
  return objc_msgSend(*(id *)(a1 + 32), "_initResourceManager");
}

void __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  _QWORD *v6;
  NSObject *v7;
  void *v8;
  PLCloudPhotoLibraryUserSwitchHandler *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  _QWORD *v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80) != 9)
    *(_QWORD *)(v2 + 80) = 0;
  +[PLAccountStore pl_sharedAccountStore](PLAccountStore, "pl_sharedAccountStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedPrimaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = PLIsEDUMode();
    v6 = *(_QWORD **)(a1 + 32);
    if (v5 && !v6[12])
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLSystemLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "appleID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v22 = v8;
          _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "EDU Mode: Registering user switch stakeholder for user: %@", buf, 0xCu);

        }
      }
      v9 = objc_alloc_init(PLCloudPhotoLibraryUserSwitchHandler);
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 272);
      *(_QWORD *)(v10 + 272) = v9;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "setSessionHandler:");
      v6 = *(_QWORD **)(a1 + 32);
    }
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_56;
    v19[3] = &unk_1E3677AA0;
    v20 = v6;
    objc_msgSend(v20, "_runSyncOnIsolationQueueWithBlock:", v19);
    v12 = v20;
  }
  else
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v13 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v13 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
      }
      v15 = v14;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "No Apple Account, skip opening cloud photo library at init time", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D73348], "transaction:", "-[PLCloudPhotoLibraryManager initWithLibraryServicesManager:]_block_invoke");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v16 = *(void **)(a1 + 32);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_2_58;
    v17[3] = &unk_1E3677AA0;
    v18 = v16;
    objc_msgSend(v18, "_runAsyncOnIsolationQueueWithTransaction:block:", v12, v17);

  }
}

uint64_t __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_56(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 80))
  {
    v2 = result;
    if (!*MEMORY[0x1E0D115D0])
    {
      v3 = *(_QWORD *)(v1 + 96);
      if (v3 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v3 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v4;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Opening CPL library after ready for CPL", v6, 2u);
      }

      v1 = *(_QWORD *)(v2 + 32);
    }
    *(_QWORD *)(v1 + 80) = 1;
    return objc_msgSend(*(id *)(v2 + 32), "_openCPLLibrary");
  }
  return result;
}

void __61__PLCloudPhotoLibraryManager_initWithLibraryServicesManager___block_invoke_2_58(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "libraryBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indicatorFileCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isDisableICloudPhotos"))
  {
    v5 = (_BYTE *)MEMORY[0x1E0D115D0];
    if (!*MEMORY[0x1E0D115D0])
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v6 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v6 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v8 = v7;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "Found disable marker, will reset and stop Cloud Photo Library", buf, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setICloudPhotosEnabledInternal:", 0);

    objc_msgSend(*(id *)(a1 + 32), "cacheDeleteSupport");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && !*v5)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
      if (v11 == 2)
      {
        __CPLAppLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v11 == 1)
          __CPLSyndicationOSLogDomain();
        else
          __CPLSystemLibraryOSLogDomain();
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "No user account, but cacheDeleteSupport is now available", v14, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_disableiCPLWillBecomeNonSyncablePhotoLibrary:resetMode:", 0, 2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_callBlocksWaitingForLibraryOpen");
  }

}

+ (id)descriptionForResourceType:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D11440], "descriptionForResourceType:", a3);
}

+ (id)_lastKnownCloudVersionInLibrary:(id)a3
{
  id v3;
  PLGlobalValues *v4;
  void *v5;
  PLGlobalValues *v6;
  void *v7;

  v3 = a3;
  v4 = [PLGlobalValues alloc];
  objc_msgSend(v3, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PLGlobalValues initWithManagedObjectContext:](v4, "initWithManagedObjectContext:", v5);
  -[PLGlobalValues cloudTrackerLastKnownCloudVersion](v6, "cloudTrackerLastKnownCloudVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)needResetSyncErrorType:(id)a3
{
  id v3;
  char v4;
  const __CFString *v5;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isCPLErrorWithCode:", 1) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isCPLErrorWithCode:", 20) & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "isCPLErrorWithCode:", 21);
  }
  if ((objc_msgSend(v3, "isCPLErrorWithCode:", 1) & 1) != 0)
  {
    v5 = CFSTR("Library version mismatch");
LABEL_11:
    objc_msgSend(MEMORY[0x1E0D11438], "registerLikelyResetReason:", v5);
    goto LABEL_12;
  }
  if ((objc_msgSend(v3, "isCPLErrorWithCode:", 20) & 1) != 0)
  {
    v5 = CFSTR("Client cache is invalid");
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "isCPLErrorWithCode:", 21))
  {
    v5 = CFSTR("Cloud cache is invalid");
    goto LABEL_11;
  }
LABEL_12:

  return v4;
}

@end
