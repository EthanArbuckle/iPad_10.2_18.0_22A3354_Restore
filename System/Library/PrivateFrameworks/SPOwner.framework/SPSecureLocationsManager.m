@implementation SPSecureLocationsManager

- (SPSecureLocationsManager)init
{
  SPSecureLocationsManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  SPRetryCount *v6;
  SPRetryCount *stewieRetryCount;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  FMXPCServiceDescription *serviceDescription;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD aBlock[4];
  id v23;
  id location;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SPSecureLocationsManager;
  v2 = -[SPSecureLocationsManager init](&v25, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.findmy.SPSecureLocationsManagerQueue", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_alloc_init(SPRetryCount);
    stewieRetryCount = v2->_stewieRetryCount;
    v2->_stewieRetryCount = v6;

    objc_initWeak(&location, v2);
    v8 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__SPSecureLocationsManager_init__block_invoke;
    aBlock[3] = &unk_1E5E16690;
    objc_copyWeak(&v23, &location);
    v9 = _Block_copy(aBlock);
    v17 = v8;
    v18 = 3221225472;
    v19 = __32__SPSecureLocationsManager_init__block_invoke_2;
    v20 = &unk_1E5E16690;
    objc_copyWeak(&v21, &location);
    v10 = _Block_copy(&v17);
    v11 = objc_alloc(MEMORY[0x1E0D20238]);
    +[SPSecureLocationsManager exportedInterface](SPSecureLocationsManager, "exportedInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SPSecureLocationsManager remoteInterface](SPSecureLocationsManager, "remoteInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithMachServiceName:options:exportedObject:exportedInterface:remoteObjectInterface:interruptionHandler:invalidationHandler:", CFSTR("com.apple.icloud.searchpartyd.securelocations"), 0, v2, v12, v13, v9, v10, v17, v18, v19, v20);
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v14;

    -[SPSecureLocationsManager setLastUpdatedStewieState:](v2, "setLastUpdatedStewieState:", 0);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setLastUpdatedStewieState:(int64_t)a3
{
  self->_lastUpdatedStewieState = a3;
}

+ (id)remoteInterface
{
  if (remoteInterface_onceToken_3 != -1)
    dispatch_once(&remoteInterface_onceToken_3, &__block_literal_global_174);
  return (id)remoteInterface_remoteInterface;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken_3 != -1)
    dispatch_once(&exportedInterface_onceToken_3, &__block_literal_global_5);
  return (id)exportedInterface_interface_3;
}

- (SPSecureLocationsXPCProtocol)proxy
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SPSecureLocationsManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SPSecureLocationsManager session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0D20240]);
    -[SPSecureLocationsManager serviceDescription](self, "serviceDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithServiceDescription:", v6);
    -[SPSecureLocationsManager setSession:](self, "setSession:", v7);

    LogCategory_SecureLocations();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[SPSecureLocationsManager serviceDescription](self, "serviceDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "machService");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);

    }
    -[SPSecureLocationsManager session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

  }
  -[SPSecureLocationsManager session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "proxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (SPSecureLocationsXPCProtocol *)v13;
}

- (FMXPCSession)session
{
  return self->_session;
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

void __75__SPSecureLocationsManager_startMonitoringStewieStateWithBlock_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setStewieUpdateBlock:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedStewieState:", 0);
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startMonitoringStewieStateWithCompletion:", *(_QWORD *)(a1 + 48));

}

- (void)setStewieUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)stewieUpdateBlock
{
  return self->_stewieUpdateBlock;
}

- (int64_t)lastUpdatedStewieState
{
  return self->_lastUpdatedStewieState;
}

void __54__SPSecureLocationsManager_stewieServiceStateChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v6[6];
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("stewie:");
    v9 = 2048;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager %@ serviceStateChanged %ld", buf, 0x16u);
  }

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SPSecureLocationsManager_stewieServiceStateChanged___block_invoke_219;
  v6[3] = &unk_1E5E16CB8;
  v5 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = v5;
  dispatch_async(v4, v6);

}

- (void)startMonitoringStewieStateWithBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_feature_enabled_impl();
  LogCategory_SecureLocations();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v16 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v9, OS_LOG_TYPE_DEFAULT, "Framework API: %@ startMonitoringState", buf, 0xCu);
    }

    if (v6)
    {
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 3221225472;
      activity_block[2] = __75__SPSecureLocationsManager_startMonitoringStewieStateWithBlock_completion___block_invoke;
      activity_block[3] = &unk_1E5E16DA8;
      activity_block[4] = self;
      v13 = v6;
      v14 = v7;
      _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.startMonitoringLiteLocationState", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v16 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v9, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.findmy.SPSecureLocations.StewieErrorDomain"), 3, 0);
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
    if (v6)
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 7);

  }
}

- (void)stewieServiceStateChanged:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__SPSecureLocationsManager_stewieServiceStateChanged___block_invoke;
  v3[3] = &unk_1E5E16CB8;
  v3[4] = self;
  v3[5] = a3;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.liteLocationServiceStateChanged", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

void __75__SPSecureLocationsManager_startMonitoringStewieStateWithBlock_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SPSecureLocationsManager_startMonitoringStewieStateWithBlock_completion___block_invoke_2;
  block[3] = &unk_1E5E16DA8;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __45__SPSecureLocationsManager_exportedInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE19608);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)exportedInterface_interface_3;
  exportedInterface_interface_3 = v0;

  v2 = (void *)exportedInterface_interface_3;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4, v6, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_receivedUpdatedLocations_, 0, 0);

}

void __43__SPSecureLocationsManager_remoteInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE279D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)remoteInterface_remoteInterface;
  remoteInterface_remoteInterface = v0;

  v2 = (void *)remoteInterface_remoteInterface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_subscribeAndFetchLocationForIds_context_completion_, 0, 1);

  v6 = (void *)remoteInterface_remoteInterface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_latestLocationFromCacheForId_completion_, 0, 1);

  v10 = (void *)remoteInterface_remoteInterface;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12, v14, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_updateLocationCacheWith_completion_, 0, 0);

}

void __32__SPSecureLocationsManager_init__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "interruptionHandler:", v3);

}

void __32__SPSecureLocationsManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "invalidationHandler:", v3);

}

- (void)interruptionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_SecureLocations();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager interruptionHandler %@", buf, 0xCu);
  }

  -[SPSecureLocationsManager stewieUpdateBlock](self, "stewieUpdateBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak((id *)buf, self);
    -[SPRetryCount decayWaitInterval](self->_stewieRetryCount, "decayWaitInterval");
    v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __48__SPSecureLocationsManager_interruptionHandler___block_invoke;
    v12 = &unk_1E5E16C70;
    objc_copyWeak(&v14, (id *)buf);
    v13 = v4;
    dispatch_after(v8, MEMORY[0x1E0C80D38], &v9);
    -[SPRetryCount increment](self->_stewieRetryCount, "increment", v9, v10, v11, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }

}

void __48__SPSecureLocationsManager_interruptionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stewieUpdateBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_SecureLocations();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v10 = CFSTR("stewie:");
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager: %@ - Will Re-subscribe liteloc due to interruption %@", buf, 0x16u);
    }

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__SPSecureLocationsManager_interruptionHandler___block_invoke_123;
    v8[3] = &unk_1E5E164B8;
    v8[4] = WeakRetained;
    objc_msgSend(WeakRetained, "startMonitoringStewieStateWithBlock:completion:", v3, v8);
  }
  else
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v10 = CFSTR("stewie:");
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager: %@ - not re-subscribing. %@", buf, 0x16u);
    }

  }
}

void __48__SPSecureLocationsManager_interruptionHandler___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_SecureLocations();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__SPSecureLocationsManager_interruptionHandler___block_invoke_123_cold_1((uint64_t)v3, v5);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager: %@ - Did re-subscribed litloc update", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "stewieRetryCount");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject reset](v5, "reset");
  }

}

- (void)invalidationHandler:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  LogCategory_SecureLocations();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager invalidationHandler %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)receivedUpdatedLocations:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[4];
  id v7;
  SPSecureLocationsManager *v8;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __53__SPSecureLocationsManager_receivedUpdatedLocations___block_invoke;
  activity_block[3] = &unk_1E5E16818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.receivedUpdatedLocations", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __53__SPSecureLocationsManager_receivedUpdatedLocations___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "receivedUpdatedLocations %lu", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SPSecureLocationsManager_receivedUpdatedLocations___block_invoke_218;
  block[3] = &unk_1E5E16818;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);

}

void __53__SPSecureLocationsManager_receivedUpdatedLocations___block_invoke_218(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void (**v4)(id, _QWORD);
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "locationUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "locationUpdates");
    v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40));

  }
  else
  {
    LogCategory_SecureLocations();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager - received updated locations but no registered block", buf, 2u);
    }

  }
}

void __54__SPSecureLocationsManager_stewieServiceStateChanged___block_invoke_219(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stewieUpdateBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    if (v3 == objc_msgSend(*(id *)(a1 + 32), "lastUpdatedStewieState"))
    {
      LogCategory_SecureLocations();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v8 = 138412546;
        v9 = CFSTR("stewie:");
        v10 = 2048;
        v11 = v5;
        _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager %@  not notifying client since state is same as last %ld", (uint8_t *)&v8, 0x16u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "stewieUpdateBlock");
      v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7[2](v7, *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedStewieState:", *(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    LogCategory_SecureLocations();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager %@ received updated state but no registered client block", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)clearLocationsForFailedSubscriptions:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[4];
  id v7;
  SPSecureLocationsManager *v8;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __65__SPSecureLocationsManager_clearLocationsForFailedSubscriptions___block_invoke;
  activity_block[3] = &unk_1E5E16818;
  v7 = v4;
  v8 = self;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.clearLocationsForFailedSubscriptions", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __65__SPSecureLocationsManager_clearLocationsForFailedSubscriptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    *(_DWORD *)buf = 134217984;
    v10 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "clearLocationsForFailedSubscriptions %lu", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__SPSecureLocationsManager_clearLocationsForFailedSubscriptions___block_invoke_220;
  block[3] = &unk_1E5E16818;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);

}

void __65__SPSecureLocationsManager_clearLocationsForFailedSubscriptions___block_invoke_220(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void (**v4)(id, _QWORD);
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "clearCacheUpdates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "clearCacheUpdates");
    v4 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 40));

  }
  else
  {
    LogCategory_SecureLocations();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AEA79000, v3, OS_LOG_TYPE_DEFAULT, "SPSecureLocationsManager - received updated cache state and attempted to clear locations but no registered block", buf, 2u);
    }

  }
}

- (void)setLocationUpdateBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __51__SPSecureLocationsManager_setLocationUpdateBlock___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.setLocationUpdateBlock", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __51__SPSecureLocationsManager_setLocationUpdateBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "setLocationUpdateBlock called", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SPSecureLocationsManager_setLocationUpdateBlock___block_invoke_221;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

uint64_t __51__SPSecureLocationsManager_setLocationUpdateBlock___block_invoke_221(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLocationUpdates:", *(_QWORD *)(a1 + 40));
}

- (void)startMonitoringFailedSubscriptions:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPSecureLocationsManager_startMonitoringFailedSubscriptions___block_invoke;
  activity_block[3] = &unk_1E5E16720;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.startMonitoringForFailedSubscriptions", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPSecureLocationsManager_startMonitoringFailedSubscriptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[16];

  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "startMonitoringForFailedSubscriptions called", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SPSecureLocationsManager_startMonitoringFailedSubscriptions___block_invoke_222;
  v5[3] = &unk_1E5E16720;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

uint64_t __63__SPSecureLocationsManager_startMonitoringFailedSubscriptions___block_invoke_222(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setClearCacheUpdates:", *(_QWORD *)(a1 + 40));
}

- (void)subscribeAndFetchLocationForIds:(id)a3 clientApp:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  SPSecureLocationsManager *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __81__SPSecureLocationsManager_subscribeAndFetchLocationForIds_clientApp_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D08;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v18 = v10;
  v11 = v10;
  v12 = v8;
  v13 = v9;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.subscribeAndFetch", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __81__SPSecureLocationsManager_subscribeAndFetchLocationForIds_clientApp_completion___block_invoke(uint64_t a1)
{
  SPSecureLocationsSubscriptionContext *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = objc_alloc_init(SPSecureLocationsSubscriptionContext);
  -[SPSecureLocationsSubscriptionContext setClientApp:](v2, "setClientApp:", *(_QWORD *)(a1 + 32));
  -[SPSecureLocationsSubscriptionContext setSubscriptionMode:](v2, "setSubscriptionMode:", 0);
  -[SPSecureLocationsSubscriptionContext setFetchMode:](v2, "setFetchMode:", 1);
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__SPSecureLocationsManager_subscribeAndFetchLocationForIds_clientApp_completion___block_invoke_2;
  v5[3] = &unk_1E5E16CE0;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "subscribeAndFetchLocationForIds:context:completion:", v4, v2, v5);

}

void __81__SPSecureLocationsManager_subscribeAndFetchLocationForIds_clientApp_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "locations");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)subscribeAndFetchLocationForIds:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  id v16;
  SPSecureLocationsManager *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __79__SPSecureLocationsManager_subscribeAndFetchLocationForIds_context_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D08;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.subscribeAndFetchWithContext", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __79__SPSecureLocationsManager_subscribeAndFetchLocationForIds_context_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "subscribeAndFetchLocationForIds %@ context %@", buf, 0x16u);
  }

  objc_msgSend(a1[6], "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__SPSecureLocationsManager_subscribeAndFetchLocationForIds_context_completion___block_invoke_224;
  v6[3] = &unk_1E5E16D08;
  v6[4] = a1[6];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[7];
  dispatch_async(v5, v6);

}

void __79__SPSecureLocationsManager_subscribeAndFetchLocationForIds_context_completion___block_invoke_224(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subscribeAndFetchLocationForIds:context:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)unsubscribeForId:(id)a3 clientApp:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  SPSecureLocationsSubscriptionContext *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(SPSecureLocationsSubscriptionContext);
  -[SPSecureLocationsSubscriptionContext setClientApp:](v11, "setClientApp:", v9);

  -[SPSecureLocationsSubscriptionContext setSubscriptionMode:](v11, "setSubscriptionMode:", 0);
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPSecureLocationsManager unsubscribeForIds:context:completion:](self, "unsubscribeForIds:context:completion:", v12, v11, v8);
}

- (void)unsubscribeForIds:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD activity_block[4];
  id v15;
  id v16;
  SPSecureLocationsManager *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D08;
  v15 = v8;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.unsubscribeWithContext", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "UnsubscribeForIds %@ with context %@", buf, 0x16u);
  }

  objc_msgSend(a1[6], "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_225;
  v6[3] = &unk_1E5E16D08;
  v6[4] = a1[6];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[7];
  dispatch_async(v5, v6);

}

void __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_225(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_2;
  v5[3] = &unk_1E5E16D30;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v2, "unsubscribeForIds:context:completion:", v6, v4, v5);

}

void __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  LogCategory_SecureLocations();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_2_cold_1((uint64_t)a1, (uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "UnsubscribeForIds %@ with context %@ completed successfully", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)latestLocationFromCacheForId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPSecureLocationsManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __68__SPSecureLocationsManager_latestLocationFromCacheForId_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.latestKnownLocationFromCache", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __68__SPSecureLocationsManager_latestLocationFromCacheForId_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "latestLocationFromCache %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SPSecureLocationsManager_latestLocationFromCacheForId_completion___block_invoke_226;
  block[3] = &unk_1E5E16770;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

void __68__SPSecureLocationsManager_latestLocationFromCacheForId_completion___block_invoke_226(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "latestLocationFromCacheForId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)updateLocationCacheWith:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  SPSecureLocationsManager *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPSecureLocationsManager_updateLocationCacheWith_completion___block_invoke;
  activity_block[3] = &unk_1E5E16D58;
  v12 = self;
  v13 = v7;
  v11 = v6;
  v8 = v7;
  v9 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.updateLatestLocationCacheWith", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPSecureLocationsManager_updateLocationCacheWith_completion___block_invoke(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134217984;
    v11 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "updateLatestLocationCacheWith %lu", buf, 0xCu);
  }

  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[5], "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__SPSecureLocationsManager_updateLocationCacheWith_completion___block_invoke_227;
    block[3] = &unk_1E5E16770;
    v6 = *((int8x16_t *)a1 + 2);
    v5 = (id)v6.i64[0];
    v8 = vextq_s8(v6, v6, 8uLL);
    v9 = a1[6];
    dispatch_async(v4, block);

  }
  else
  {
    (*((void (**)(void))a1[6] + 2))();
  }
}

void __63__SPSecureLocationsManager_updateLocationCacheWith_completion___block_invoke_227(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLocationCacheWith:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)publishLocation:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  void (**v9)(id, _QWORD);
  id v10;
  _QWORD activity_block[4];
  id v12;
  SPSecureLocationsManager *v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  LogCategory_SecureLocations();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "publishLocation ", buf, 2u);
  }

  v7[2](v7, 0);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __55__SPSecureLocationsManager_publishLocation_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.subscribeAndFetch", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __55__SPSecureLocationsManager_publishLocation_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  int8x16_t v6;
  _QWORD block[4];
  int8x16_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LogCategory_SecureLocations();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1AEA79000, v2, OS_LOG_TYPE_DEFAULT, "publishLocation %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SPSecureLocationsManager_publishLocation_completion___block_invoke_228;
  block[3] = &unk_1E5E16770;
  v6 = *(int8x16_t *)(a1 + 32);
  v5 = (id)v6.i64[0];
  v8 = vextq_s8(v6, v6, 8uLL);
  v9 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

void __55__SPSecureLocationsManager_publishLocation_completion___block_invoke_228(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishLocation:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)receivedLocationPayload:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  LogCategory_SecureLocations();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "Received location payload", buf, 2u);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPSecureLocationsManager_receivedLocationPayload_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.receivedLocationPayload", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPSecureLocationsManager_receivedLocationPayload_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SPSecureLocationsManager_receivedLocationPayload_completion___block_invoke_2;
  block[3] = &unk_1E5E16770;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __63__SPSecureLocationsManager_receivedLocationPayload_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receivedLocationPayload:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)receivedLocationCommand:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD activity_block[5];
  id v12;
  id v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  LogCategory_SecureLocations();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "Received location command", buf, 2u);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__SPSecureLocationsManager_receivedLocationCommand_completion___block_invoke;
  activity_block[3] = &unk_1E5E16770;
  activity_block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.receivedLocationCommand", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __63__SPSecureLocationsManager_receivedLocationCommand_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SPSecureLocationsManager_receivedLocationCommand_completion___block_invoke_2;
  block[3] = &unk_1E5E16770;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);

}

void __63__SPSecureLocationsManager_receivedLocationCommand_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "receivedLocationCommand:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)shouldStartLocationMonitorWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  LogCategory_SecureLocations();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AEA79000, v5, OS_LOG_TYPE_DEFAULT, "Received location command", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SPSecureLocationsManager_shouldStartLocationMonitorWithCompletion___block_invoke;
  v7[3] = &unk_1E5E16720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.hasLocationSubscribers", OS_ACTIVITY_FLAG_DEFAULT, v7);

}

void __69__SPSecureLocationsManager_shouldStartLocationMonitorWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__SPSecureLocationsManager_shouldStartLocationMonitorWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __69__SPSecureLocationsManager_shouldStartLocationMonitorWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shouldStartLocationMonitorWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)publishCurrentLocationToStewieWithReason:(int64_t)a3 completion:(id)a4
{
  id v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  _QWORD activity_block[5];
  id v12;
  int64_t v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = _os_feature_enabled_impl();
  LogCategory_SecureLocations();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((v7 & 1) != 0)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      v15 = CFSTR("stewie:");
      v16 = 2048;
      v17 = a3;
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "Framework API: %@ publishCurrentLocationWithReason %ld", buf, 0x16u);
    }

    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __80__SPSecureLocationsManager_publishCurrentLocationToStewieWithReason_completion___block_invoke;
    activity_block[3] = &unk_1E5E16D80;
    activity_block[4] = self;
    v13 = a3;
    v12 = v6;
    _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.publishCurrentLiteLocationWithReason", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      v15 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v8, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.findmy.SPSecureLocations.StewieErrorDomain"), 3, 0);
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v10);

  }
}

void __80__SPSecureLocationsManager_publishCurrentLocationToStewieWithReason_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SPSecureLocationsManager_publishCurrentLocationToStewieWithReason_completion___block_invoke_2;
  block[3] = &unk_1E5E16D80;
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v6 = v4;
  dispatch_async(v2, block);

}

void __80__SPSecureLocationsManager_publishCurrentLocationToStewieWithReason_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "publishCurrentLocationToStewieWithReason:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)stopMonitoringStewieStateWithCompletion:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_feature_enabled_impl();
  LogCategory_SecureLocations();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "Framework API: %@ stopMonitoringState", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__SPSecureLocationsManager_stopMonitoringStewieStateWithCompletion___block_invoke;
    v9[3] = &unk_1E5E16720;
    v9[4] = self;
    v10 = v4;
    _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.stopMonitoringLiteLocationState", OS_ACTIVITY_FLAG_DEFAULT, v9);

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.findmy.SPSecureLocations.StewieErrorDomain"), 3, 0);
    (*((void (**)(id, void *))v4 + 2))(v4, v8);

  }
}

void __68__SPSecureLocationsManager_stopMonitoringStewieStateWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__SPSecureLocationsManager_stopMonitoringStewieStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __68__SPSecureLocationsManager_stopMonitoringStewieStateWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setStewieUpdateBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopMonitoringStewieStateWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)currentStewieStateWithCompletion:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_feature_enabled_impl();
  LogCategory_SecureLocations();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "Framework API: %@ currentStateWithCompletion", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SPSecureLocationsManager_currentStewieStateWithCompletion___block_invoke;
    v9[3] = &unk_1E5E16720;
    v9[4] = self;
    v10 = v4;
    _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager", OS_ACTIVITY_FLAG_DEFAULT, v9);

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.findmy.SPSecureLocations.StewieErrorDomain"), 3, 0);
    (*((void (**)(id, uint64_t, void *))v4 + 2))(v4, 7, v8);

  }
}

void __61__SPSecureLocationsManager_currentStewieStateWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SPSecureLocationsManager_currentStewieStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __61__SPSecureLocationsManager_currentStewieStateWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentStewieStateWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)stewiePublishStateWithCompletion:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_feature_enabled_impl();
  LogCategory_SecureLocations();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "Framework API: %@ publishStateWithCompletion ", buf, 0xCu);
    }

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__SPSecureLocationsManager_stewiePublishStateWithCompletion___block_invoke;
    v9[3] = &unk_1E5E16720;
    v9[4] = self;
    v10 = v4;
    _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.liteLocationPublishState", OS_ACTIVITY_FLAG_DEFAULT, v9);

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v6, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.findmy.SPSecureLocations.StewieErrorDomain"), 3, 0);
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v8);

  }
}

void __61__SPSecureLocationsManager_stewiePublishStateWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SPSecureLocationsManager_stewiePublishStateWithCompletion___block_invoke_2;
  v4[3] = &unk_1E5E16720;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_async(v2, v4);

}

void __61__SPSecureLocationsManager_stewiePublishStateWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stewiePublishStateWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)triggerStewieProactiveNotification
{
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  _QWORD activity_block[5];
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = _os_feature_enabled_impl();
  LogCategory_SecureLocations();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) != 0)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v8 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "Framework API: %@ triggerStewieProactiveNotification ", buf, 0xCu);
    }

    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __62__SPSecureLocationsManager_triggerStewieProactiveNotification__block_invoke;
    activity_block[3] = &unk_1E5E16668;
    activity_block[4] = self;
    _os_activity_initiate(&dword_1AEA79000, "SPSecureLocationsManager.triggerStewieProactiveNotification", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v8 = CFSTR("stewie:");
      _os_log_impl(&dword_1AEA79000, v4, OS_LOG_TYPE_DEFAULT, "%@ feature disabled", buf, 0xCu);
    }

  }
}

void __62__SPSecureLocationsManager_triggerStewieProactiveNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SPSecureLocationsManager_triggerStewieProactiveNotification__block_invoke_2;
  block[3] = &unk_1E5E16668;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void __62__SPSecureLocationsManager_triggerStewieProactiveNotification__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "triggerStewieProactiveNotification");

}

- (void)shareCurrentKeyWithId:(id)a3 idsHandles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SPSecureLocationsManager queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__SPSecureLocationsManager_shareCurrentKeyWithId_idsHandles_completion___block_invoke;
  v15[3] = &unk_1E5E16D08;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __72__SPSecureLocationsManager_shareCurrentKeyWithId_idsHandles_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareCurrentKeyWithId:idsHandles:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)shareCurrentKeyWithId:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SPSecureLocationsManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SPSecureLocationsManager_shareCurrentKeyWithId_completion___block_invoke;
  block[3] = &unk_1E5E16770;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __61__SPSecureLocationsManager_shareCurrentKeyWithId_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareCurrentKeyWithId:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)performKeyRollWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SPSecureLocationsManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SPSecureLocationsManager_performKeyRollWithCompletion___block_invoke;
  v7[3] = &unk_1E5E16720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__SPSecureLocationsManager_performKeyRollWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performKeyRollWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)isLocationPublishingDeviceWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SPSecureLocationsManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SPSecureLocationsManager_isLocationPublishingDeviceWithCompletion___block_invoke;
  v7[3] = &unk_1E5E16720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __69__SPSecureLocationsManager_isLocationPublishingDeviceWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isLocationPublishingDeviceWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)fetchConfigFromServerWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SPSecureLocationsManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SPSecureLocationsManager_fetchConfigFromServerWithCompletion___block_invoke;
  v7[3] = &unk_1E5E16720;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__SPSecureLocationsManager_fetchConfigFromServerWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchConfigFromServerWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)simulateFeatureDisabled:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  -[SPSecureLocationsManager queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SPSecureLocationsManager_simulateFeatureDisabled_completion___block_invoke;
  block[3] = &unk_1E5E16DD0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __63__SPSecureLocationsManager_simulateFeatureDisabled_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "proxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "simulateFeatureDisabled:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setServiceDescription:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescription, a3);
}

- (void)setProxy:(id)a3
{
  objc_storeStrong((id *)&self->_proxy, a3);
}

- (id)locationUpdates
{
  return self->_locationUpdates;
}

- (void)setLocationUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)clearCacheUpdates
{
  return self->_clearCacheUpdates;
}

- (void)setClearCacheUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (SPRetryCount)stewieRetryCount
{
  return self->_stewieRetryCount;
}

- (void)setStewieRetryCount:(id)a3
{
  objc_storeStrong((id *)&self->_stewieRetryCount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stewieRetryCount, 0);
  objc_storeStrong(&self->_stewieUpdateBlock, 0);
  objc_storeStrong(&self->_clearCacheUpdates, 0);
  objc_storeStrong(&self->_locationUpdates, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__SPSecureLocationsManager_interruptionHandler___block_invoke_123_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = CFSTR("stewie:");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1AEA79000, a2, OS_LOG_TYPE_ERROR, "SPSecureLocationsManager: %@ - Error re-subscribing litloc update %@", (uint8_t *)&v2, 0x16u);
}

void __65__SPSecureLocationsManager_unsubscribeForIds_context_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_1AEA79000, log, OS_LOG_TYPE_ERROR, "UnsubscribeForIds %@ with context %@ failed with error %@", (uint8_t *)&v5, 0x20u);
}

@end
