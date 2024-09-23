@implementation PLAssetsdServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  PLXPCMessageLogger *connectionLogger;
  PLXPCMessageLogger *v9;
  PLXPCMessageLogger *v10;
  void *v11;
  PLAssetsdService *v12;
  uint64_t v13;
  PLAssetsdService *v14;
  PLAssetsdService *v15;
  _QWORD v17[4];
  PLAssetsdService *v18;
  id v19;
  _QWORD v20[4];
  PLAssetsdService *v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  +[PLFileDescriptorFuse checkFileDescriptorFuse](PLFileDescriptorFuse, "checkFileDescriptorFuse");
  if (objc_msgSend(MEMORY[0x1E0D73338], "enabled"))
  {
    connectionLogger = self->_connectionLogger;
    if (!connectionLogger)
    {
      v9 = (PLXPCMessageLogger *)objc_alloc_init(MEMORY[0x1E0D73338]);
      v10 = self->_connectionLogger;
      self->_connectionLogger = v9;

      connectionLogger = self->_connectionLogger;
    }
    objc_msgSend(v7, "setDelegate:", connectionLogger);
  }
  objc_msgSend(v7, "setExportedInterface:", self->_assetsdInterface);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D650);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v11);

  v12 = -[PLAssetsdService initWithConnection:libraryBundleController:daemonServices:]([PLAssetsdService alloc], "initWithConnection:libraryBundleController:daemonServices:", v7, self->_libraryBundleController, self->_daemonServices);
  objc_msgSend(v7, "setExportedObject:", v12);
  -[PLAssetsdServer addService:](self, "addService:", v12);
  objc_initWeak(&location, self);
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __54__PLAssetsdServer_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_1E3677B80;
  objc_copyWeak(&v22, &location);
  v14 = v12;
  v21 = v14;
  objc_msgSend(v7, "setInterruptionHandler:", v20);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __54__PLAssetsdServer_listener_shouldAcceptNewConnection___block_invoke_2;
  v17[3] = &unk_1E3677B80;
  objc_copyWeak(&v19, &location);
  v15 = v14;
  v18 = v15;
  objc_msgSend(v7, "setInvalidationHandler:", v17);
  objc_msgSend(v7, "resume");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return 1;
}

- (void)addService:(id)a3
{
  os_unfair_lock_s *p_servicesLock;
  id v5;

  p_servicesLock = &self->_servicesLock;
  v5 = a3;
  os_unfair_lock_lock(p_servicesLock);
  -[NSMutableSet addObject:](self->_services, "addObject:", v5);

  os_unfair_lock_unlock(p_servicesLock);
}

- (PLAssetsdServer)initWithDaemonServices:(id)a3
{
  id v6;
  PLAssetsdServer *v7;
  PLAssetsdServer *v8;
  id v9;
  uint64_t v10;
  NSXPCListener *listener;
  uint64_t v12;
  NSXPCInterface *assetsdInterface;
  NSMutableSet *v14;
  NSMutableSet *services;
  PLBackgroundJobService *v16;
  PLBackgroundJobService *backgroundJobService;
  PLCacheDeleteRegistration *v18;
  PLCacheDeleteRegistration *cacheDeleteRegistration;
  uint64_t v20;
  PLPhotoLibraryBundleController *libraryBundleController;
  PLDistributedNotificationHandler *v22;
  PLDistributedNotificationHandler *distributedNotificationHandler;
  PLTCCObserver *v24;
  PLTCCObserver *tccObserver;
  uint64_t v26;
  PFStateCaptureHandler *stateHandler;
  NSObject *v28;
  uint64_t v29;
  void *v31;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  PLAssetsdServer *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLAssetsdServer.m"), 65, CFSTR("PLAssetsdServer must only be initialized on assetsd"));

  }
  v32.receiver = self;
  v32.super_class = (Class)PLAssetsdServer;
  v7 = -[PLAssetsdServer init](&v32, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_daemonServices, a3);
    v9 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v10 = objc_msgSend(v9, "initWithMachServiceName:", *MEMORY[0x1E0D73480]);
    listener = v8->_listener;
    v8->_listener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v8->_listener, "setDelegate:", v8);
    objc_msgSend(MEMORY[0x1E0D73170], "assetsdInterface");
    v12 = objc_claimAutoreleasedReturnValue();
    assetsdInterface = v8->_assetsdInterface;
    v8->_assetsdInterface = (NSXPCInterface *)v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    services = v8->_services;
    v8->_services = v14;

    v16 = objc_alloc_init(PLBackgroundJobService);
    backgroundJobService = v8->_backgroundJobService;
    v8->_backgroundJobService = v16;

    v18 = objc_alloc_init(PLCacheDeleteRegistration);
    cacheDeleteRegistration = v8->_cacheDeleteRegistration;
    v8->_cacheDeleteRegistration = v18;

    +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
    v20 = objc_claimAutoreleasedReturnValue();
    libraryBundleController = v8->_libraryBundleController;
    v8->_libraryBundleController = (PLPhotoLibraryBundleController *)v20;

    -[PLPhotoLibraryBundleController setBackgroundJobService:](v8->_libraryBundleController, "setBackgroundJobService:", v8->_backgroundJobService);
    -[PLPhotoLibraryBundleController setCacheDeleteRegistration:](v8->_libraryBundleController, "setCacheDeleteRegistration:", v8->_cacheDeleteRegistration);
    v22 = -[PLDistributedNotificationHandler initWithLibraryBundleController:]([PLDistributedNotificationHandler alloc], "initWithLibraryBundleController:", v8->_libraryBundleController);
    distributedNotificationHandler = v8->_distributedNotificationHandler;
    v8->_distributedNotificationHandler = v22;

    if (PLPlatformLimitedLibrarySupported())
    {
      v24 = -[PLTCCObserver initWithLibraryBundleController:]([PLTCCObserver alloc], "initWithLibraryBundleController:", v8->_libraryBundleController);
      tccObserver = v8->_tccObserver;
      v8->_tccObserver = v24;

    }
    v8->_servicesLock._os_unfair_lock_opaque = 0;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0D71088]), "initWithProvider:", v8);
    stateHandler = v8->_stateHandler;
    v8->_stateHandler = (PFStateCaptureHandler *)v26;

  }
  PLPhotosObjectLifecycleGetLog();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v29 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v34 = v29;
    v35 = 2048;
    v36 = v8;
    _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_DEBUG, "%@ %p init", buf, 0x16u);
  }

  return v8;
}

- (void)start
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  PLAssetsdServer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[PLAssetsdServer _checkInWithLaunchd](self, "_checkInWithLaunchd");
  -[NSXPCListener resume](self->_listener, "resume");
  -[PLPhotoLibraryDaemonService start](self->_syndicationSpotlightReceiver, "start");
  -[PLPhotoLibraryDaemonService start](self->_syndicationPreferencesListener, "start");
  -[PLPhotoLibraryDaemonService start](self->_searchSpotlightReceiver, "start");
  -[PLAssetsdServer _startObservingSystemLibraryChanges](self, "_startObservingSystemLibraryChanges");
  +[PLSpotlightDonationManager handleUniversalSearchPhotoLibraryEligibilityChangeWithDetectedPathChange:](PLSpotlightDonationManager, "handleUniversalSearchPhotoLibraryEligibilityChangeWithDetectedPathChange:", 0);
  v3 = +[PLPhotoLibraryForceExitObserver sharedInstance](PLPhotoLibraryForceExitObserver, "sharedInstance");
  PLPhotosObjectLifecycleGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_DEBUG, "%@ %p start", (uint8_t *)&v5, 0x16u);
  }

}

- (void)_checkInWithLaunchd
{
  +[PLCacheDeleteRegistration registerDefaultHandlers](PLCacheDeleteRegistration, "registerDefaultHandlers");
  -[PLDistributedNotificationHandler registerForNotifications](self->_distributedNotificationHandler, "registerForNotifications");
  -[PLTCCObserver registerAsTCCObserver](self->_tccObserver, "registerAsTCCObserver");
  +[PLAnalysisCoordinator registerSearchFastPassTaskWithBundleController:](PLAnalysisCoordinator, "registerSearchFastPassTaskWithBundleController:", self->_libraryBundleController);
}

- (void)logStatus
{
  NSObject *v3;
  uint8_t v4[16];

  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "services:", v4, 2u);
  }

  os_unfair_lock_lock(&self->_servicesLock);
  -[NSMutableSet enumerateObjectsUsingBlock:](self->_services, "enumerateObjectsUsingBlock:", &__block_literal_global_100444);
  os_unfair_lock_unlock(&self->_servicesLock);
}

- (id)stateCaptureDictionary
{
  void *v3;
  os_unfair_lock_s *p_servicesLock;
  NSMutableSet *services;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_servicesLock = &self->_servicesLock;
  os_unfair_lock_lock(&self->_servicesLock);
  services = self->_services;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __41__PLAssetsdServer_stateCaptureDictionary__block_invoke;
  v12 = &unk_1E3677B58;
  v13 = v3;
  v6 = v3;
  -[NSMutableSet enumerateObjectsUsingBlock:](services, "enumerateObjectsUsingBlock:", &v9);
  os_unfair_lock_unlock(p_servicesLock);
  v14 = CFSTR("services");
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)removeService:(id)a3
{
  os_unfair_lock_s *p_servicesLock;
  id v5;

  p_servicesLock = &self->_servicesLock;
  v5 = a3;
  os_unfair_lock_lock(p_servicesLock);
  -[NSMutableSet removeObject:](self->_services, "removeObject:", v5);

  os_unfair_lock_unlock(p_servicesLock);
}

- (void)_collectCacheMetricsDataFromService:(id)a3
{
  os_unfair_lock_s *p_servicesLock;
  id v4;

  p_servicesLock = &self->_servicesLock;
  v4 = a3;
  os_unfair_lock_lock(p_servicesLock);
  objc_msgSend(v4, "collectCacheMetrics");

  os_unfair_lock_unlock(p_servicesLock);
}

- (void)handleInterruption:(id)a3
{
  id v4;

  v4 = a3;
  -[PLAssetsdServer _collectCacheMetricsDataFromService:](self, "_collectCacheMetricsDataFromService:", v4);
  objc_msgSend(v4, "handleInterruption");
  -[PLAssetsdServer removeService:](self, "removeService:", v4);

}

- (void)handleInvalidation:(id)a3
{
  id v4;

  v4 = a3;
  -[PLAssetsdServer _collectCacheMetricsDataFromService:](self, "_collectCacheMetricsDataFromService:", v4);
  objc_msgSend(v4, "handleInvalidation");
  -[PLAssetsdServer removeService:](self, "removeService:", v4);

}

- (void)_startObservingSystemLibraryChanges
{
  const char *v3;
  NSObject *v4;
  int out_token;

  out_token = 0;
  v3 = (const char *)*MEMORY[0x1E0D74888];
  dispatch_get_global_queue(9, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = notify_register_dispatch(v3, &out_token, v4, &__block_literal_global_73_100425);

  if (!(_DWORD)v3)
    -[PLAssetsdServer setSystemLibraryChangeToken:](self, "setSystemLibraryChangeToken:", out_token);
}

- (void)stopObservingSystemLibraryChanges
{
  int v3;

  v3 = -[PLAssetsdServer systemLibraryChangeToken](self, "systemLibraryChangeToken");
  if (v3)
  {
    notify_cancel(v3);
    -[PLAssetsdServer setSystemLibraryChangeToken:](self, "setSystemLibraryChangeToken:", 0);
  }
}

- (PLPhotoLibraryDaemonService)syndicationSpotlightReceiver
{
  return self->_syndicationSpotlightReceiver;
}

- (void)setSyndicationSpotlightReceiver:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationSpotlightReceiver, a3);
}

- (PLPhotoLibraryDaemonService)syndicationPreferencesListener
{
  return self->_syndicationPreferencesListener;
}

- (void)setSyndicationPreferencesListener:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationPreferencesListener, a3);
}

- (PLPhotoLibraryDaemonService)searchSpotlightReceiver
{
  return self->_searchSpotlightReceiver;
}

- (void)setSearchSpotlightReceiver:(id)a3
{
  objc_storeStrong((id *)&self->_searchSpotlightReceiver, a3);
}

- (int)systemLibraryChangeToken
{
  return self->_systemLibraryChangeToken;
}

- (void)setSystemLibraryChangeToken:(int)a3
{
  self->_systemLibraryChangeToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSpotlightReceiver, 0);
  objc_storeStrong((id *)&self->_syndicationPreferencesListener, 0);
  objc_storeStrong((id *)&self->_syndicationSpotlightReceiver, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_cacheDeleteRegistration, 0);
  objc_storeStrong((id *)&self->_assetsdInterface, 0);
  objc_storeStrong((id *)&self->_tccObserver, 0);
  objc_storeStrong((id *)&self->_distributedNotificationHandler, 0);
  objc_storeStrong((id *)&self->_backgroundJobService, 0);
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_connectionLogger, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_daemonServices, 0);
}

uint64_t __54__PLAssetsdServer__startObservingSystemLibraryChanges__block_invoke()
{
  return +[PLSpotlightDonationManager handleUniversalSearchPhotoLibraryEligibilityChangeWithDetectedPathChange:](PLSpotlightDonationManager, "handleUniversalSearchPhotoLibraryEligibilityChangeWithDetectedPathChange:", 1);
}

void __54__PLAssetsdServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleInterruption:", *(_QWORD *)(a1 + 32));

}

void __54__PLAssetsdServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleInvalidation:", *(_QWORD *)(a1 + 32));

}

void __41__PLAssetsdServer_stateCaptureDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stateDescription");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __28__PLAssetsdServer_logStatus__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  PLBackendGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEFAULT, "  %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

@end
