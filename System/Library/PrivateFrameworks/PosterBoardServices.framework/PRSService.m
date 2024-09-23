@implementation PRSService

- (PRSService)init
{
  PRSService *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  BSServiceConnectionClient *serviceConnection;
  BSServiceConnectionClient *v11;
  NSObject *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PRSService;
  v2 = -[PRSService init](&v19, sel_init);
  if (v2)
  {
    PRSServiceInterface();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", CFSTR("com.apple.posterboardservices.services"), v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      serviceConnection = v2->_serviceConnection;
      v2->_serviceConnection = (BSServiceConnectionClient *)v9;

      objc_initWeak(&location, v2);
      v11 = v2->_serviceConnection;
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __18__PRSService_init__block_invoke;
      v14[3] = &unk_1E4D42F60;
      v15 = v3;
      v16 = v8;
      objc_copyWeak(&v17, &location);
      -[BSServiceConnectionClient configureConnection:](v11, "configureConnection:", v14);
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }
    else
    {
      PRSLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[PRSService init].cold.1();

    }
  }
  return v2;
}

void __18__PRSService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "setInterface:", *(_QWORD *)(a1 + 32));
  PRSDefaultServiceQuality();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __18__PRSService_init__block_invoke_2;
  v9[3] = &unk_1E4D42F10;
  v10 = *(id *)(a1 + 40);
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __18__PRSService_init__block_invoke_27;
  v6[3] = &unk_1E4D42F38;
  v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 48));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&v11);
}

void __18__PRSService_init__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PRSLogObserver();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 138543618;
    v6 = v3;
    v7 = 2048;
    v8 = WeakRetained;
    _os_log_impl(&dword_1A4996000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p interrupted", (uint8_t *)&v5, 0x16u);

  }
}

void __18__PRSService_init__block_invoke_27(uint64_t a1)
{
  NSObject *v2;

  PRSLogObserver();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __18__PRSService_init__block_invoke_27_cold_1(a1, v2);

}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnectionClient invalidate](self->_serviceConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PRSService;
  -[PRSService dealloc](&v3, sel_dealloc);
}

- (id)serviceNotificationCenterWithError:(id *)a3
{
  if (serviceNotificationCenterWithError__onceToken != -1)
    dispatch_once(&serviceNotificationCenterWithError__onceToken, &__block_literal_global_33);
  return (id)serviceNotificationCenterWithError____notificationCenter;
}

void __49__PRSService_serviceNotificationCenterWithError___block_invoke()
{
  id v0;
  void *v1;
  PRSWallpaperObserverConfiguration *v2;
  void *v3;
  PRSWallpaperObserver *v4;
  void *v5;
  PRSWallpaperLocationStateObserver *v6;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37D0]);
  v1 = (void *)serviceNotificationCenterWithError____notificationCenter;
  serviceNotificationCenterWithError____notificationCenter = (uint64_t)v0;

  v6 = objc_alloc_init(PRSWallpaperLocationStateObserver);
  -[PRSWallpaperLocationStateObserver setHandler:](v6, "setHandler:", &__block_literal_global_37);
  -[PRSWallpaperLocationStateObserver setLocations:](v6, "setLocations:", 12);
  v2 = objc_alloc_init(PRSWallpaperObserverConfiguration);
  -[PRSWallpaperObserverConfiguration setLocationStateObserver:](v2, "setLocationStateObserver:", v6);
  dispatch_get_global_queue(25, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSWallpaperObserverConfiguration setQueue:](v2, "setQueue:", v3);

  v4 = -[PRSWallpaperObserver initWithExplanation:]([PRSWallpaperObserver alloc], "initWithExplanation:", CFSTR("PRSService-serviceNotificationCenter"));
  v5 = (void *)serviceNotificationCenterWithError____observer;
  serviceNotificationCenterWithError____observer = (uint64_t)v4;

  objc_msgSend((id)serviceNotificationCenterWithError____observer, "activateWithConfiguration:", v2);
}

void __49__PRSService_serviceNotificationCenterWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "activeLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PRSServiceToSelectedPosterConfigurationUserInfoKey"));

  objc_msgSend(v2, "activeHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("PRSServiceHomeScreenAssociatedPosterConfigurationUserInfoKey"));

  objc_msgSend((id)serviceNotificationCenterWithError____notificationCenter, "postNotificationName:object:userInfo:", CFSTR("PRSServiceDidUpdateActivePosterConfigurationNotification"), 0, v3);
  PRSLogObserver();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v3;
    _os_log_impl(&dword_1A4996000, v6, OS_LOG_TYPE_DEFAULT, "posting PRSServiceDidUpdateActivePosterConfigurationNotification with userInfo=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  v7 = (void *)objc_opt_new();
  objc_msgSend(v2, "activeLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("PRSServiceUpdatedPosterConfigurationUserInfoKey"));

  objc_msgSend(v2, "activeLock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeHome");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    objc_msgSend(v2, "activeHome");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("PRSServiceHomeScreenAssociatedPosterConfigurationUserInfoKey"));

  }
  objc_msgSend((id)serviceNotificationCenterWithError____notificationCenter, "postNotificationName:object:userInfo:", CFSTR("PRSServiceDidUpdateAssociatedHomeScreenPosterConfigurationNotification"), 0, v7);
  PRSLogObserver();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1A4996000, v12, OS_LOG_TYPE_DEFAULT, "posting PRSServiceDidUpdateAssociatedHomeScreenPosterConfigurationNotification with userInfo=%{public}@", (uint8_t *)&v13, 0xCu);
  }

}

- (void)deleteDataStoreWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  PRSService *v11;
  id v12;
  SEL v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v14 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__PRSService_deleteDataStoreWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42FF0;
    v13 = a2;
    v10 = v6;
    v11 = self;
    v12 = v5;
    objc_msgSend(v10, "invalidateDataStoreWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }

}

void __44__PRSService_deleteDataStoreWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;

  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "terminate");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2;
  v6[3] = &unk_1E4D42FC8;
  v3 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v5 = *(_OWORD *)(a1 + 48);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v3, "deleteDataStoreWithCompletion:", v6);

}

void __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)resetRole:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 157, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35__PRSService_resetRole_completion___block_invoke;
    v12[3] = &unk_1E4D42FC8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "resetRole:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __35__PRSService_resetRole_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteSnapshots:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v4 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__PRSService_deleteSnapshots_completion___block_invoke;
    v12[3] = &unk_1E4D42FC8;
    v14 = a2;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v8, "deleteSnapshots:completion:", v10, v12);

  }
  else if (v7)
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }

}

void __41__PRSService_deleteSnapshots_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __66__PRSService_notifyPosterBoardOfApplicationUpdatesWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42FC8;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "notifyPosterBoardOfApplicationUpdatesWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }

}

void __66__PRSService_notifyPosterBoardOfApplicationUpdatesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v3)
    v5 = v3;
  else
    v5 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)deleteTransientDataWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__PRSService_deleteTransientDataWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42FC8;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "deleteTransientDataWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }

}

void __48__PRSService_deleteTransientDataWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v3)
    v5 = v3;
  else
    v5 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)fetchExtensionIdentifiersWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__PRSService_fetchExtensionIdentifiersWithCompletion___block_invoke;
    v9[3] = &unk_1E4D43018;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "fetchExtensionIdentifiersWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v7);
  }

}

void __54__PRSService_fetchExtensionIdentifiersWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__PRSService_fetchPosterDescriptorsForExtension_completion___block_invoke;
    v12[3] = &unk_1E4D43040;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "fetchPosterDescriptorsForExtension:completion:", v7, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v10);
  }

}

void __60__PRSService_fetchPosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
}

- (void)fetchStaticPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__PRSService_fetchStaticPosterDescriptorsForExtension_completion___block_invoke;
    v12[3] = &unk_1E4D43040;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "fetchStaticPosterDescriptorsForExtension:completion:", v7, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v10);
  }

}

void __66__PRSService_fetchStaticPosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
}

- (void)refreshPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  -[PRSService _refreshPosterDescriptorsForExtension:sessionInfo:completion:](self, "_refreshPosterDescriptorsForExtension:sessionInfo:completion:", a3, 0, a4);
}

- (void)_refreshPosterDescriptorsForExtension:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v18 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v12)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__PRSService__refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke;
    v15[3] = &unk_1E4D43040;
    v17 = a2;
    v15[4] = self;
    v16 = v11;
    objc_msgSend(v12, "refreshPosterDescriptorsForExtension:sessionInfo:completion:", v9, v10, v15);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v13);
  }

}

void __75__PRSService__refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }
  else
  {
    objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v8 + 16))(v8, v9, 0);

  }
}

- (void)deletePosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  id v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 304, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providerIdentifier"));

LABEL_3:
  v16 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (v9)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__PRSService_deletePosterDescriptorsForExtension_completion___block_invoke;
    v13[3] = &unk_1E4D42FC8;
    v15 = a2;
    v13[4] = self;
    v14 = v8;
    objc_msgSend(v9, "deletePosterDescriptorsForExtension:completion:", v7, v13);

  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __61__PRSService_deletePosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchRuntimeAssertionState:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__PRSService_fetchRuntimeAssertionState___block_invoke;
    v9[3] = &unk_1E4D43068;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "fetchRuntimeAssertionState:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v7);
  }

}

void __41__PRSService_fetchRuntimeAssertionState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)triggerMessedUpDataProtectionWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__PRSService_triggerMessedUpDataProtectionWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42FC8;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "triggerMessedUpDataProtectionWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }

}

void __58__PRSService_triggerMessedUpDataProtectionWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchChargerIdentifierRelationshipsWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__PRSService_fetchChargerIdentifierRelationshipsWithCompletion___block_invoke;
    v9[3] = &unk_1E4D43090;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "fetchChargerIdentifierRelationshipsWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v7);
  }

}

void __64__PRSService_fetchChargerIdentifierRelationshipsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  __CFString *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  SEL v21;
  id v22;

  v11 = a3;
  v12 = a4;
  v13 = (__CFString *)a5;
  v14 = a6;
  if (v14)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("providerIdentifier"));

LABEL_3:
  if (!v13)
    v13 = CFSTR("PRPosterRoleLockScreen");
  v22 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  if (v15)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __104__PRSService_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke;
    v19[3] = &unk_1E4D429C8;
    v21 = a2;
    v19[4] = self;
    v20 = v14;
    objc_msgSend(v15, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:", v11, v12, v13, v19);

  }
  else if (v14)
  {
    (*((void (**)(id, _QWORD, id))v14 + 2))(v14, 0, v16);
  }

}

void __104__PRSService_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v5)
    v8 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v5);
  else
    v8 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 completion:(id)a5
{
  -[PRSService createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:](self, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:", a3, a4, 0, a5);
}

- (void)refreshPosterConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v13, "_path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serverIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "posterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRSService refreshPosterConfigurationMatchingUUID:sessionInfo:completion:](self, "refreshPosterConfigurationMatchingUUID:sessionInfo:completion:", v10, 0, v7);
}

- (void)refreshPosterConfiguration:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 400, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v16, "_path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "serverIdentity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "posterUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRSService refreshPosterConfigurationMatchingUUID:sessionInfo:completion:](self, "refreshPosterConfigurationMatchingUUID:sessionInfo:completion:", v13, v9, v10);
}

- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 407, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 408, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterUUID"));

LABEL_3:
  v19 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (v12)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__PRSService_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke;
    v16[3] = &unk_1E4D429C8;
    v18 = a2;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v12, "refreshPosterConfigurationMatchingUUID:sessionInfo:completion:", v9, v10, v16);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v13);
  }

}

void __76__PRSService_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v5)
    v8 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v5);
  else
    v8 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterUUID"));

  }
  v9 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "notePosterConfigurationUnderlyingModelDidChange:", v5);

}

- (void)associateConfigurationMatchingUUID:(id)a3 focusModeActivityUUID:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 434, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 435, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurationUUID"));

LABEL_3:
  v19 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (v12)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__PRSService_associateConfigurationMatchingUUID_focusModeActivityUUID_completion___block_invoke;
    v16[3] = &unk_1E4D42FC8;
    v18 = a2;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v12, "associateConfigurationMatchingUUID:focusModeActivityUUID:completion:", v9, v10, v16);

  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }

}

void __82__PRSService_associateConfigurationMatchingUUID_focusModeActivityUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchPosterConfigurations:(id)a3
{
  -[PRSService fetchPosterConfigurationsForRole:completion:](self, "fetchPosterConfigurationsForRole:completion:", 0, a3);
}

- (void)fetchPosterConfigurationsForExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  SEL v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 454, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterExtensionIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__PRSService_fetchPosterConfigurationsForExtension_completion___block_invoke;
    v14[3] = &unk_1E4D43040;
    v16 = a2;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v10, "fetchPosterConfigurationsForExtension:completion:", v7, v14);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v11);
  }

}

void __63__PRSService_fetchPosterConfigurationsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_22_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);
}

- (void)fetchPosterSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  PRSPosterSnapshotRequest *v11;
  PRSPosterSnapshotRequest *v12;
  PRSPosterSnapshotRequest *v13;
  PRSPosterSnapshotRequest *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  void (**v20)(_QWORD, _QWORD, _QWORD);
  SEL v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 470, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 471, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v10 = objc_opt_class();
  v11 = (PRSPosterSnapshotRequest *)v7;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  if (v13)
  {
    v14 = -[PRSPosterSnapshotRequest initWithFocusPosterRequest:]([PRSPosterSnapshotRequest alloc], "initWithFocusPosterRequest:", v13);

    v11 = v14;
  }
  v22 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  if (v15)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__PRSService_fetchPosterSnapshotsWithRequest_completion___block_invoke;
    v19[3] = &unk_1E4D430B8;
    v21 = a2;
    v19[4] = self;
    v20 = v9;
    objc_msgSend(v15, "fetchPosterSnapshotsWithRequest:completion:", v11, v19);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v16);
  }

}

void __57__PRSService_fetchPosterSnapshotsWithRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchPosterFocusSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PRSPosterSnapshotRequest *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PRSPosterSnapshotRequest initWithFocusPosterRequest:]([PRSPosterSnapshotRequest alloc], "initWithFocusPosterRequest:", v7);

  -[PRSService fetchPosterSnapshotsWithRequest:completion:](self, "fetchPosterSnapshotsWithRequest:completion:", v8, v6);
}

- (void)deletePosterConfigurationsMatchingUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD);
  SEL v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 496, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("UUID"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__PRSService_deletePosterConfigurationsMatchingUUID_completion___block_invoke;
    v14[3] = &unk_1E4D42FC8;
    v16 = a2;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v10, "deletePosterConfigurationsMatchingUUID:completion:", v7, v14);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, id))v9)[2](v9, v11);
  }

}

void __64__PRSService_deletePosterConfigurationsMatchingUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)exportPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  SEL v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 512, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurationUUID"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __63__PRSService_exportPosterConfigurationMatchingUUID_completion___block_invoke;
    v14[3] = &unk_1E4D430E0;
    v16 = a2;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v10, "exportPosterConfigurationMatchingUUID:completion:", v7, v14);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v11);
  }

}

void __63__PRSService_exportPosterConfigurationMatchingUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  SEL v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 527, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("archiveData"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 528, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__PRSService_importPosterConfigurationFromArchiveData_completion___block_invoke;
    v14[3] = &unk_1E4D429C8;
    v16 = a2;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v10, "importPosterConfigurationFromArchiveData:completion:", v7, v14);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v11);
  }

}

void __66__PRSService_importPosterConfigurationFromArchiveData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "posterUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v10, v5);

}

- (void)importPosterConfigurationFromArchivedData:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD, _QWORD);
  SEL v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 542, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("archiveData"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__PRSService_importPosterConfigurationFromArchivedData_completion___block_invoke;
    v14[3] = &unk_1E4D429C8;
    v16 = a2;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v10, "importPosterConfigurationFromArchiveData:completion:", v7, v14);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v11);
  }

}

void __67__PRSService_importPosterConfigurationFromArchivedData_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = a2;
  v6 = a3;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v6)
    v8 = 0;
  else
    v8 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  SEL v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v10;
  NSClassFromString(CFSTR("NSArray"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C4BA0);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSArrayClass]"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C4C04);
  }

  v13 = v9;
  NSClassFromString(CFSTR("NSUUID"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C4C68);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:NSUUIDClass]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfigurationMatchingUUID:updates:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C4CCCLL);
  }

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 560, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v24 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;
  if (v14)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __71__PRSService_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke;
    v21[3] = &unk_1E4D43108;
    v23 = a2;
    v21[4] = self;
    v22 = v11;
    objc_msgSend(v14, "updatePosterConfigurationMatchingUUID:updates:completion:", v13, v12, v21);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v15);
  }

}

void __71__PRSService_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PRSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v11 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v12 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v7);
    (*(void (**)(uint64_t, id, id, id))(v11 + 16))(v11, v12, v8, v9);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id, id))(v11 + 16))(v11, 0, v8, v9);
  }

}

- (void)updatePosterConfiguration:(id)a3 update:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  SEL v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v10;
  NSClassFromString(CFSTR("PRSPosterUpdate"));
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfiguration:update:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C5030);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterUpdateClass]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfiguration:update:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C5094);
  }

  v13 = v9;
  NSClassFromString(CFSTR("PRSPosterConfiguration"));
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfiguration:update:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C50F8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PRSPosterConfigurationClass]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfiguration:update:completion:].cold.2();
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C515CLL);
  }

  objc_msgSend(v13, "_path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isServerPosterPath");

  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[[configuration _path] isServerPosterPath]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService updatePosterConfiguration:update:completion:].cold.3();
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C51C0);
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 577, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v28 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v28;
  if (v16)
  {
    v29[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__PRSService_updatePosterConfiguration_update_completion___block_invoke;
    v25[3] = &unk_1E4D43108;
    v27 = a2;
    v25[4] = self;
    v26 = v11;
    objc_msgSend(v16, "updatePosterConfiguration:updates:completion:", v13, v18, v25);

  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v11 + 2))(v11, 0, 0, v17);
  }

}

void __58__PRSService_updatePosterConfiguration_update_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PRSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v11 = *(_QWORD *)(a1 + 40);
  if (v7)
    v12 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v7);
  else
    v12 = 0;
  objc_msgSend(v8, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, id))(v11 + 16))(v11, v12, v13, v9);

  if (v7)
}

- (void)refreshSnapshotForPosterConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  v8 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

    v8 = 0;
  }
  objc_msgSend(v8, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serverIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRSService refreshSnapshotForPosterConfigurationMatchingUUID:completion:](self, "refreshSnapshotForPosterConfigurationMatchingUUID:completion:", v11, v7);
}

- (void)refreshSnapshotForPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 597, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__PRSService_refreshSnapshotForPosterConfigurationMatchingUUID_completion___block_invoke;
    v12[3] = &unk_1E4D42FC8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "refreshSnapshotForPosterConfigurationMatchUUID:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __75__PRSService_refreshSnapshotForPosterConfigurationMatchingUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)ingestSnapshotCollection:(id)a3 forPosterConfiguration:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  void (**v21)(_QWORD, _QWORD);
  SEL v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD, _QWORD))v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 612, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotCollection"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 613, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  objc_msgSend(v10, "_path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "serverIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "posterUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v23;
  if (v16)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__PRSService_ingestSnapshotCollection_forPosterConfiguration_completion___block_invoke;
    v20[3] = &unk_1E4D42FC8;
    v22 = a2;
    v20[4] = self;
    v21 = v12;
    objc_msgSend(v16, "ingestSnapshotCollection:forPosterConfigurationUUID:completion:", v9, v15, v20);

  }
  else if (v12)
  {
    ((void (**)(_QWORD, id))v12)[2](v12, v17);
  }

}

void __73__PRSService_ingestSnapshotCollection_forPosterConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchContentObstructionBoundsForActivePosterWithOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  SEL v13;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 633, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__PRSService_fetchContentObstructionBoundsForActivePosterWithOrientation_completionHandler___block_invoke;
  v10[3] = &unk_1E4D43158;
  v12 = a3;
  v13 = a2;
  v10[4] = self;
  v11 = v7;
  v8 = v7;
  -[PRSService fetchActivePosterConfiguration:](self, "fetchActivePosterConfiguration:", v10);

}

void __92__PRSService_fetchContentObstructionBoundsForActivePosterWithOrientation_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v8 = (void *)a1[4];
    v17 = 0;
    objc_msgSend(v8, "_serviceInterfaceWithError:", &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v9)
    {
      objc_msgSend(v5, "lockScreenPosterConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __92__PRSService_fetchContentObstructionBoundsForActivePosterWithOrientation_completionHandler___block_invoke_2;
      v14[3] = &unk_1E4D43130;
      v12 = a1[4];
      v13 = (void *)a1[5];
      v16 = a1[7];
      v14[4] = v12;
      v15 = v13;
      objc_msgSend(v9, "fetchContentObstructionBoundsForPosterConfiguration:orientation:completion:", v10, v11, v14);

    }
    else
    {
      (*(void (**)(void))(a1[5] + 16))();
    }

  }
}

void __92__PRSService_fetchContentObstructionBoundsForActivePosterWithOrientation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchContentObstructionBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  id v17;

  v9 = a3;
  v10 = a5;
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__PRSService_fetchContentObstructionBoundsForPosterConfiguration_orientation_completionHandler___block_invoke;
    v14[3] = &unk_1E4D43130;
    v16 = a2;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v11, "fetchContentObstructionBoundsForPosterConfiguration:orientation:completion:", v9, v13, v14);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, MEMORY[0x1E0C9AA60], v12);
  }

}

void __96__PRSService_fetchContentObstructionBoundsForPosterConfiguration_orientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchMaximalContentCutoutBoundsForOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 667, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __78__PRSService_fetchMaximalContentCutoutBoundsForOrientation_completionHandler___block_invoke;
    v12[3] = &unk_1E4D43180;
    v14 = a2;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v8, "fetchMaximalContentCutoutBoundsForOrientation:completion:", v10, v12);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v9);
  }

}

void __78__PRSService_fetchMaximalContentCutoutBoundsForOrientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchContentCutoutBoundsForActivePosterWithOrientation:(int64_t)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;
  SEL v13;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 681, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__PRSService_fetchContentCutoutBoundsForActivePosterWithOrientation_completionHandler___block_invoke;
  v10[3] = &unk_1E4D43158;
  v12 = a3;
  v13 = a2;
  v10[4] = self;
  v11 = v7;
  v8 = v7;
  -[PRSService fetchActivePosterConfiguration:](self, "fetchActivePosterConfiguration:", v10);

}

void __87__PRSService_fetchContentCutoutBoundsForActivePosterWithOrientation_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  id v17;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    v8 = (void *)a1[4];
    v17 = 0;
    objc_msgSend(v8, "_serviceInterfaceWithError:", &v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v9)
    {
      objc_msgSend(v5, "lockScreenPosterConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __87__PRSService_fetchContentCutoutBoundsForActivePosterWithOrientation_completionHandler___block_invoke_2;
      v14[3] = &unk_1E4D43180;
      v12 = a1[4];
      v13 = (void *)a1[5];
      v16 = a1[7];
      v14[4] = v12;
      v15 = v13;
      objc_msgSend(v9, "fetchContentCutoutBoundsForPosterConfiguration:orientation:completion:", v10, v11, v14);

    }
    else
    {
      (*(void (**)(void))(a1[5] + 16))();
    }

  }
}

void __87__PRSService_fetchContentCutoutBoundsForActivePosterWithOrientation_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchContentCutoutBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  id v17;

  v9 = a3;
  v10 = a5;
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __91__PRSService_fetchContentCutoutBoundsForPosterConfiguration_orientation_completionHandler___block_invoke;
    v14[3] = &unk_1E4D43180;
    v16 = a2;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v11, "fetchContentCutoutBoundsForPosterConfiguration:orientation:completion:", v9, v13, v14);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
  }

}

void __91__PRSService_fetchContentCutoutBoundsForPosterConfiguration_orientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchObscurableBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  id v17;

  v9 = a3;
  v10 = a5;
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __88__PRSService_fetchObscurableBoundsForPosterConfiguration_orientation_completionHandler___block_invoke;
    v14[3] = &unk_1E4D43180;
    v16 = a2;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v11, "fetchObscurableBoundsForPosterConfiguration:orientation:completion:", v9, v13, v14);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
  }

}

void __88__PRSService_fetchObscurableBoundsForPosterConfiguration_orientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a3 orientation:(int64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  id v17;

  v9 = a3;
  v10 = a5;
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v17;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __94__PRSService_fetchLimitedOcclusionBoundsForPosterConfiguration_orientation_completionHandler___block_invoke;
    v14[3] = &unk_1E4D43180;
    v16 = a2;
    v14[4] = self;
    v15 = v10;
    objc_msgSend(v11, "fetchLimitedOcclusionBoundsForPosterConfiguration:orientation:completion:", v9, v13, v14);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v12);
  }

}

void __94__PRSService_fetchLimitedOcclusionBoundsForPosterConfiguration_orientation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchPosterConfigurationsForRole:(id)a3 completion:(id)a4
{
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = (__CFString *)a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 745, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (!v7)
    v7 = CFSTR("PRPosterRoleLockScreen");
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__PRSService_fetchPosterConfigurationsForRole_completion___block_invoke;
    v12[3] = &unk_1E4D43040;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "fetchPosterConfigurationsForRole:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v10);
  }

}

void __58__PRSService_fetchPosterConfigurationsForRole_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "bs_mapNoNulls:", &__block_literal_global_22_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v5);
}

- (void)fetchSelectedPosterForRole:(id)a3 completion:(id)a4
{
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = (__CFString *)a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 764, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (!v7)
    v7 = CFSTR("PRPosterRoleLockScreen");
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__PRSService_fetchSelectedPosterForRole_completion___block_invoke;
    v12[3] = &unk_1E4D429C8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "fetchSelectedPosterForRole:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v10);
  }

}

void __52__PRSService_fetchSelectedPosterForRole_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = a3;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    v9 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v5);
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v6);
  }

}

- (void)fetchActivePosterForRole:(id)a3 completion:(id)a4
{
  __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = (__CFString *)a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 783, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (!v7)
    v7 = CFSTR("PRPosterRoleLockScreen");
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PRSService_fetchActivePosterForRole_completion___block_invoke;
    v12[3] = &unk_1E4D431A8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "fetchActivePosterForRole:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v10);
  }

}

void __50__PRSService_fetchActivePosterForRole_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  PRSActivePosterConfiguration *v11;
  id v12;
  id v13;
  PRSActivePosterConfiguration *v14;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  PRSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v8)
  {
    v11 = [PRSActivePosterConfiguration alloc];
    v12 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v8);
    if (v7)
      v13 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v7);
    else
      v13 = 0;
    v14 = -[PRSActivePosterConfiguration initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:](v11, "initWithLockScreenPosterConfiguration:homeScreenPosterConfiguration:", v12, v13);
    if (v7)

  }
  else
  {
    v14 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)fetchActivePosterForRole:(id)a3 error:(id *)a4
{
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (__CFString *)a3;
  if (v6)
    v7 = v6;
  else
    v7 = CFSTR("PRPosterRoleLockScreen");
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "fetchActivePosterForRole:error:", v7, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)updateSelectedForRoleIdentifier:(id)a3 newlySelectedConfiguration:(id)a4 completion:(id)a5
{
  __CFString *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  SEL v19;
  id v20;

  v9 = (__CFString *)a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 817, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(v10, "serverUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 820, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterUUID"));

  }
  if (!v9)
    v9 = CFSTR("PRPosterRoleLockScreen");
  v20 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  if (v13)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __84__PRSService_updateSelectedForRoleIdentifier_newlySelectedConfiguration_completion___block_invoke;
    v17[3] = &unk_1E4D42FC8;
    v19 = a2;
    v17[4] = self;
    v18 = v11;
    objc_msgSend(v13, "updateToSelectedPosterMatchingUUID:role:completion:", v12, v9, v17);

  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v14);
  }

}

void __84__PRSService_updateSelectedForRoleIdentifier_newlySelectedConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchSelectedConfiguration:(id)a3
{
  if (a3)
    -[PRSService fetchSelectedPosterForRole:completion:](self, "fetchSelectedPosterForRole:completion:", 0, a3);
}

- (void)fetchActiveConfiguration:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__PRSService_fetchActiveConfiguration___block_invoke;
    v6[3] = &unk_1E4D431D0;
    v7 = v4;
    -[PRSService fetchActivePosterForRole:completion:](self, "fetchActivePosterForRole:completion:", 0, v6);

  }
}

void __39__PRSService_fetchActiveConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "lockScreenPosterConfiguration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)fetchActivePosterConfiguration:(id)a3
{
  -[PRSService fetchActivePosterForRole:completion:](self, "fetchActivePosterForRole:completion:", 0, a3);
}

- (void)updateToSelectedConfiguration:(id)a3 completion:(id)a4
{
  -[PRSService updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:](self, "updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:", 0, a3, a4);
}

- (void)updateToSelectedConfiguration:(id)a3 role:(id)a4 completion:(id)a5
{
  -[PRSService updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:](self, "updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:", a4, a3, a5);
}

- (void)updateToSelectedConfigurationMatchingUUID:(id)a3 role:(id)a4 completion:(id)a5
{
  id v9;
  __CFString *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  id v19;

  v9 = a3;
  v10 = (__CFString *)a4;
  v11 = a5;
  if (v11)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 869, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 870, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("posterUUID"));

LABEL_3:
  if (!v10)
    v10 = CFSTR("PRPosterRoleLockScreen");
  v19 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (v12)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __72__PRSService_updateToSelectedConfigurationMatchingUUID_role_completion___block_invoke;
    v16[3] = &unk_1E4D42FC8;
    v18 = a2;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v12, "updateToSelectedPosterMatchingUUID:role:completion:", v9, v10, v16);

  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }

}

void __72__PRSService_updateToSelectedConfigurationMatchingUUID_role_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)updateToSelectedConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  -[PRSService updateToSelectedConfigurationMatchingUUID:role:completion:](self, "updateToSelectedConfigurationMatchingUUID:role:completion:", a3, CFSTR("PRPosterRoleLockScreen"), a4);
}

- (void)fetchFocusUUIDForConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  id v19;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "_path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("PFServerPosterPath"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService fetchFocusUUIDForConfiguration:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C7380);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:PFServerPosterPathClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[PRSService fetchFocusUUIDForConfiguration:completion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1A49C73E4);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 897, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v19 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (v10)
  {
    objc_msgSend(v7, "_path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__PRSService_fetchFocusUUIDForConfiguration_completion___block_invoke;
    v16[3] = &unk_1E4D431F8;
    v18 = a2;
    v16[4] = self;
    v17 = v8;
    objc_msgSend(v10, "fetchFocusUUIDForConfiguration:completion:", v12, v16);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v11);
  }

}

void __56__PRSService_fetchFocusUUIDForConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)removeAllFocusConfigurationsMatchingFocusUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 912, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PRSService_removeAllFocusConfigurationsMatchingFocusUUID_completion___block_invoke;
    v12[3] = &unk_1E4D42FC8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "removeAllFocusConfigurationsMatchingFocusUUID:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __71__PRSService_removeAllFocusConfigurationsMatchingFocusUUID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)pushToProactiveWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 930, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__PRSService_pushToProactiveWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42FC8;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "pushToProactiveWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }

}

void __44__PRSService_pushToProactiveWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)pushPosterGalleryUpdate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD);
  SEL v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 949, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("faceGalleryConfiguration"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 950, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PRSService_pushPosterGalleryUpdate_completion___block_invoke;
    v14[3] = &unk_1E4D42FC8;
    v16 = a2;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v10, "pushPosterGalleryUpdate:completion:", v7, v14);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, id))v9)[2](v9, v11);
  }

}

void __49__PRSService_pushPosterGalleryUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchGallery:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 969, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __27__PRSService_fetchGallery___block_invoke;
    v9[3] = &unk_1E4D43220;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "fetchGallery:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v5 + 2))(v5, 0, 0, v7);
  }

}

void __27__PRSService_fetchGallery___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  PRSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)retrieveGallery:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 991, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__PRSService_retrieveGallery___block_invoke;
    v9[3] = &unk_1E4D43220;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "retrieveGallery:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, _QWORD, id))v5 + 2))(v5, 0, 0, v7);
  }

}

void __30__PRSService_retrieveGallery___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;

  v7 = a4;
  v8 = a3;
  v9 = a2;
  PRSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)gatherDataFreshnessState:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1011, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__PRSService_gatherDataFreshnessState___block_invoke;
    v9[3] = &unk_1E4D43068;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "gatherDataFreshnessState:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v7);
  }

}

void __39__PRSService_gatherDataFreshnessState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1025, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v18 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v12)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __104__PRSService_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke;
    v15[3] = &unk_1E4D42FC8;
    v17 = a2;
    v15[4] = self;
    v16 = v11;
    objc_msgSend(v12, "refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:", v9, v10, v15);

  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }

}

void __104__PRSService_refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier_extensionIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)notifyFocusModeDidChange:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1040, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__PRSService_notifyFocusModeDidChange_completion___block_invoke;
    v12[3] = &unk_1E4D42FC8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "notifyFocusModeDidChange:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __50__PRSService_notifyFocusModeDidChange_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)notifyAvailableFocusModesDidChange:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  SEL v13;
  id v14;

  v7 = a3;
  v8 = a4;
  v14 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__PRSService_notifyAvailableFocusModesDidChange_completion___block_invoke;
    v11[3] = &unk_1E4D42FC8;
    v13 = a2;
    v11[4] = self;
    v12 = v8;
    objc_msgSend(v9, "notifyAvailableFocusModesDidChange:completion:", v7, v11);

  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __60__PRSService_notifyAvailableFocusModesDidChange_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)notifyActiveChargerIdentifierDidUpdate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1067, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__PRSService_notifyActiveChargerIdentifierDidUpdate_completion___block_invoke;
    v12[3] = &unk_1E4D42FC8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "notifyActiveChargerIdentifierDidUpdate:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __64__PRSService_notifyActiveChargerIdentifierDidUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)prewarmWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1081, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __36__PRSService_prewarmWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42FC8;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "prewarmWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }

}

void __36__PRSService_prewarmWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)overnightUpdateWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1095, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__PRSService_overnightUpdateWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42FC8;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "overnightUpdateWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, id))v5 + 2))(v5, v7);
  }

}

void __44__PRSService_overnightUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1109, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __74__PRSService_fetchAssociatedHomeScreenPosterConfigurationUUID_completion___block_invoke;
    v12[3] = &unk_1E4D429C8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "fetchAssociatedHomeScreenPosterConfigurationUUID:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v10);
  }

}

void __74__PRSService_fetchAssociatedHomeScreenPosterConfigurationUUID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = a3;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v6)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      v10 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v5);
      (*(void (**)(uint64_t, id, _QWORD))(v9 + 16))(v9, v10, 0);

      goto LABEL_8;
    }
    v8 = *(void (**)(void))(v9 + 16);
  }
  v8();
LABEL_8:

}

- (void)runMigration:(BOOL)a3 completion:(id)a4
{
  -[PRSService runMigration:migrationDescriptor:completion:](self, "runMigration:migrationDescriptor:completion:", a3, 0, a4);
}

- (void)runMigration:(BOOL)a3 migrationDescriptor:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  id v18;

  v6 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v18 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__PRSService_runMigration_migrationDescriptor_completion___block_invoke;
    v15[3] = &unk_1E4D42FC8;
    v17 = a2;
    v15[4] = self;
    v16 = v10;
    objc_msgSend(v11, "runMigration:migrationDescriptor:completion:", v13, v9, v15);

  }
  else if (v10)
  {
    (*((void (**)(id, id))v10 + 2))(v10, v12);
  }

}

void __58__PRSService_runMigration_migrationDescriptor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)clearMigrationFlags:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __34__PRSService_clearMigrationFlags___block_invoke;
    v9[3] = &unk_1E4D43248;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "clearMigrationFlags:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v7);
  }

}

void __34__PRSService_clearMigrationFlags___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_msgSend(v6, "BOOLValue");

  (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v9, v5);
}

- (void)createAndSelectLegacyPosterConfigurationIfNeededWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  __CFString *v7;
  __CFString *v8;
  id v9;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke;
  v6[3] = &unk_1E4D432C0;
  v6[4] = self;
  v7 = CFSTR("com.apple.PaperBoard.LegacyPoster");
  v8 = CFSTR("LegacyPoster");
  v9 = v4;
  v5 = v4;
  -[PRSService fetchPosterConfigurationsForExtension:completion:](self, "fetchPosterConfigurationsForExtension:completion:", CFSTR("com.apple.PaperBoard.LegacyPoster"), v6);

}

void __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    v9 = objc_msgSend(v5, "count");
    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v5, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_124;
      v20[3] = &unk_1E4D42AC8;
      v21 = *(id *)(a1 + 56);
      objc_msgSend(v10, "_selectConfigurationAndRefreshSnapshot:completion:", v11, v20);

      v12 = v21;
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_2;
      v16[3] = &unk_1E4D43298;
      v17 = v7;
      v15 = *(id *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 32);
      v19 = v15;
      objc_msgSend(v10, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:", v13, v14, CFSTR("PRPosterRoleLockScreen"), v16);

      v12 = v17;
    }

  }
  else
  {
    PRSLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v5 = a2;
  if (a3)
  {
    PRSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_2_cold_1(a1, v6, v7, v8, v9, v10, v11, v12);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_126;
    v14[3] = &unk_1E4D43270;
    v13 = *(void **)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v15 = v5;
    objc_msgSend(v13, "_selectConfigurationAndRefreshSnapshot:completion:", v15, v14);

  }
}

uint64_t __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_126(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, BOOL, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) != 0, a2, a3);
}

- (void)_selectConfigurationAndRefreshSnapshot:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  if (v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke;
    v10[3] = &unk_1E4D432E8;
    v12 = v7;
    v10[4] = self;
    v11 = v6;
    -[PRSService updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:](self, "updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:", CFSTR("PRPosterRoleLockScreen"), v11, v10);

  }
  else
  {
    PRSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[PRSService _selectConfigurationAndRefreshSnapshot:completion:].cold.1(v9);

    v8[2](v8, 0, 0);
  }

}

void __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (v3)
  {
    PRSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_129;
    v7[3] = &unk_1E4D42978;
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "refreshSnapshotForPosterConfiguration:completion:", v6, v7);

  }
}

void __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    PRSLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_129_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchArchivedDataStoreNamesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v12 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (v6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__PRSService_fetchArchivedDataStoreNamesWithCompletion___block_invoke;
    v9[3] = &unk_1E4D42930;
    v11 = a2;
    v9[4] = self;
    v10 = v5;
    objc_msgSend(v6, "fetchArchivedDataStoreNamesWithCompletion:", v9);

  }
  else if (v5)
  {
    (*((void (**)(id, _QWORD, id))v5 + 2))(v5, 0, v7);
  }

}

void __56__PRSService_fetchArchivedDataStoreNamesWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)stashCurrentDataStoreWithName:(id)a3 options:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1239, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[stashName length] > 0"));

  }
  v19 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v19;
  if (v12)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__PRSService_stashCurrentDataStoreWithName_options_completion___block_invoke;
    v16[3] = &unk_1E4D42FC8;
    v18 = a2;
    v16[4] = self;
    v17 = v11;
    objc_msgSend(v12, "stashCurrentDataStoreWithName:options:completion:", v9, v10, v16);

  }
  else if (v11)
  {
    (*((void (**)(id, id))v11 + 2))(v11, v13);
  }

}

void __63__PRSService_stashCurrentDataStoreWithName_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)restoreArchivedDataStoreNamed:(id)a3 backupExistingDataStore:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  id v18;

  v6 = a4;
  v9 = a3;
  v10 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v18 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __79__PRSService_restoreArchivedDataStoreNamed_backupExistingDataStore_completion___block_invoke;
    v15[3] = &unk_1E4D42FC8;
    v17 = a2;
    v15[4] = self;
    v16 = v10;
    objc_msgSend(v11, "restoreArchivedDataStoreNamed:backupExistingDataStore:completion:", v9, v13, v15);

  }
  else if (v10)
  {
    (*((void (**)(id, id))v10 + 2))(v10, v12);
  }

}

void __79__PRSService_restoreArchivedDataStoreNamed_backupExistingDataStore_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)deleteArchivedDataStoreNamed:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1267, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PRSService_deleteArchivedDataStoreNamed_completion___block_invoke;
    v12[3] = &unk_1E4D42FC8;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "deleteArchivedDataStoreNamed:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, id))v8 + 2))(v8, v10);
  }

}

void __54__PRSService_deleteArchivedDataStoreNamed_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)exportArchivedDataStoreNamed:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  SEL v14;
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v15 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __54__PRSService_exportArchivedDataStoreNamed_completion___block_invoke;
    v12[3] = &unk_1E4D430E0;
    v14 = a2;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v9, "exportArchivedDataStoreNamed:completion:", v7, v12);

  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v10);
  }

}

void __54__PRSService_exportArchivedDataStoreNamed_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  v6 = a2;
  PRSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)exportCurrentDataStoreToURL:(id)a3 options:(id)a4 sandboxToken:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v20;
  if (v14)
  {
    v19 = 0;
    objc_msgSend(v14, "exportCurrentDataStoreToURL:options:sandboxToken:error:", v11, v12, v13, &v19);
    v16 = v19;

    PRSLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PRSService exportCurrentDataStoreToURL:options:sandboxToken:error:].cold.1(a2);

    v15 = v16;
  }
  v18 = objc_retainAutorelease(v15);
  *a6 = v18;

}

- (void)ignoreExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD);
  SEL v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extension"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __41__PRSService_ignoreExtension_completion___block_invoke;
    v14[3] = &unk_1E4D42FC8;
    v16 = a2;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v10, "ignoreExtension:completion:", v7, v14);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, id))v9)[2](v9, v11);
  }

}

void __41__PRSService_ignoreExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v3)
    v5 = v3;
  else
    v5 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (void)unignoreExtension:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  void (**v15)(_QWORD, _QWORD);
  SEL v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1325, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("extension"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRSService.m"), 1326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_3:
  v17 = 0;
  -[PRSService _serviceInterfaceWithError:](self, "_serviceInterfaceWithError:", &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  if (v10)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__PRSService_unignoreExtension_completion___block_invoke;
    v14[3] = &unk_1E4D42FC8;
    v16 = a2;
    v14[4] = self;
    v15 = v9;
    objc_msgSend(v10, "unignoreExtension:completion:", v7, v14);

  }
  else if (v9)
  {
    ((void (**)(_QWORD, id))v9)[2](v9, v11);
  }

}

void __43__PRSService_unignoreExtension_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;

  v3 = a2;
  PRSLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1();

  if (v3)
    v5 = v3;
  else
    v5 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5);

}

- (id)_serviceInterfaceWithError:(id *)a3
{
  BSServiceConnectionClient **p_serviceConnection;
  BSServiceConnectionClient *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  p_serviceConnection = &self->_serviceConnection;
  -[BSServiceConnectionClient activate](self->_serviceConnection, "activate");
  v6 = *p_serviceConnection;
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("BasicAngelIPC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionClient remoteTargetWithLaunchingAssertionAttributes:](v6, "remoteTargetWithLaunchingAssertionAttributes:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    PRSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PRSService _serviceInterfaceWithError:].cold.1((uint64_t)self, (uint64_t)p_serviceConnection, v10);

    if (a3)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v13, 1, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

- (void)init
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_8(&dword_1A4996000, v1, (uint64_t)v1, "%{public}@:%p failed to lookup endpoint", v2);
  OUTLINED_FUNCTION_4_0();
}

void __18__PRSService_init__block_invoke_27_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = 138543618;
  v7 = v3;
  v8 = 2048;
  v9 = WeakRetained;
  OUTLINED_FUNCTION_8(&dword_1A4996000, a2, v5, "<%{public}@:%p remotely invalidated", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

void __44__PRSService_deleteDataStoreWithCompletion___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_2();
  v2 = (const char *)OUTLINED_FUNCTION_5_1(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_1A4996000, v3, v4, "received reply to %{public}@ on %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)updatePosterConfigurationMatchingUUID:updates:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePosterConfigurationMatchingUUID:updates:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePosterConfiguration:update:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePosterConfiguration:update:completion:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)updatePosterConfiguration:update:completion:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)fetchFocusUUIDForConfiguration:completion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_1A4996000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

void __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_11_0(&dword_1A4996000, v0, v1, "Failed to fetch poster configuration with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __77__PRSService_createAndSelectLegacyPosterConfigurationIfNeededWithCompletion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11_0(&dword_1A4996000, a2, a3, "Failed to create poster configuration with error: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_selectConfigurationAndRefreshSnapshot:(os_log_t)log completion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4996000, log, OS_LOG_TYPE_ERROR, "No configuration is provided, returning...", v1, 2u);
}

void __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_11_0(&dword_1A4996000, v0, v1, "Failed to update to selected configuration with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __64__PRSService__selectConfigurationAndRefreshSnapshot_completion___block_invoke_129_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_11_0(&dword_1A4996000, v0, v1, "Failed to refresh snapshot for poster configuration with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)exportCurrentDataStoreToURL:(const char *)a1 options:sandboxToken:error:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_4(&dword_1A4996000, v2, v3, "received reply to %{public}@ on %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)_serviceInterfaceWithError:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_8(&dword_1A4996000, a3, v6, "%{public}@ failed to create proxy for connection: %{public}@", v7);

  OUTLINED_FUNCTION_2();
}

@end
