@implementation SOSEngine

- (SOSEngine)init
{
  SOSEngine *v3;

  if (+[SOSEntitlement currentProcessHasEntitlement:](SOSEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.sos.trigger")))
  {
    self = -[SOSEngine initWithoutEntitlement](self, "initWithoutEntitlement");
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (SOSEngine)initWithoutEntitlement
{
  SOSEngine *v2;
  NSObject *v3;
  uint64_t v4;
  NSMutableArray *clientConnections;
  id v6;
  uint64_t v7;
  SOSContactsManager *contactsManager;
  uint64_t v9;
  SOSPersistentTimerLocationManager *sosPersistentTimerLocationManager;
  uint64_t v11;
  SOSStatusManager *sosStatusManager;
  void *v13;
  uint64_t v14;
  SOSCoordinator *sosCoordinator;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  SOSCoreAnalyticsReporting *coreAnalyticsReporter;
  NSObject *v20;
  uint8_t v22[8];
  _QWORD block[4];
  id v24;
  id buf[2];
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SOSEngine;
  v2 = -[SOSEngine init](&v26, sel_init);
  if (v2)
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSEngine, init", (uint8_t *)buf, 2u);
    }

    v4 = objc_opt_new();
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableArray *)v4;

    v6 = (id)objc_msgSend(getSAServerClass(), "sharedInstance");
    v7 = objc_opt_new();
    contactsManager = v2->_contactsManager;
    v2->_contactsManager = (SOSContactsManager *)v7;

    +[SOSPersistentTimerLocationManager sharedInstance](SOSPersistentTimerLocationManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    sosPersistentTimerLocationManager = v2->_sosPersistentTimerLocationManager;
    v2->_sosPersistentTimerLocationManager = (SOSPersistentTimerLocationManager *)v9;

    -[SOSPersistentTimerLocationManager setDelegate:](v2->_sosPersistentTimerLocationManager, "setDelegate:", v2);
    +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    sosStatusManager = v2->_sosStatusManager;
    v2->_sosStatusManager = (SOSStatusManager *)v11;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_SOSSendingLocationUpdateChanged_, CFSTR("SOSSendingLocationUpdateChangedNotification"), 0);

    +[SOSCoordinator sharedInstance](SOSCoordinator, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    sosCoordinator = v2->_sosCoordinator;
    v2->_sosCoordinator = (SOSCoordinator *)v14;

    -[SOSCoordinator addObserver:](v2->_sosCoordinator, "addObserver:", v2->_sosStatusManager);
    v16 = MEMORY[0x1E0C80D38];
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel__tuCallCenterStatusChanged_, *MEMORY[0x1E0DBD4A0], 0);

    objc_initWeak(buf, v2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __35__SOSEngine_initWithoutEntitlement__block_invoke_2;
    block[3] = &unk_1E5F76638;
    objc_copyWeak(&v24, buf);
    dispatch_async(v16, block);

    +[SOSCoreAnalyticsReporter sharedInstance](SOSCoreAnalyticsReporter, "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    coreAnalyticsReporter = v2->_coreAnalyticsReporter;
    v2->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v18;

    sos_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1AF4DC000, v20, OS_LOG_TYPE_DEFAULT, "SOSEngine, finished init", v22, 2u);
    }

    objc_destroyWeak(&v24);
    objc_destroyWeak(buf);
  }
  return v2;
}

void __35__SOSEngine_initWithoutEntitlement__block_invoke()
{
  id v0;

  +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "checkSOSStatusOnLaunch");

}

void __35__SOSEngine_initWithoutEntitlement__block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__SOSEngine_initWithoutEntitlement__block_invoke_3;
  v3[3] = &unk_1E5F76638;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  objc_msgSend(v2, "registerWithCompletionHandler:", v3);

  objc_destroyWeak(&v4);
}

void __35__SOSEngine_initWithoutEntitlement__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_checkEmergencyCallStatus");
  objc_msgSend(WeakRetained, "_checkSOSCallStatus");

}

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SOSSendingLocationUpdateStopTimeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "compare:", v4) == 1;

    sos_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "Stopping location updates based on timeToStopSending: %@", buf, 0xCu);
      }

      -[SOSEngine stopSendingLocationUpdate](self, "stopSendingLocationUpdate");
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "Starting location updates based on timeToStopSending: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __18__SOSEngine_start__block_invoke;
      v9[3] = &unk_1E5F76660;
      objc_copyWeak(&v10, (id *)buf);
      -[SOSEngine startSendingLocationUpdateWithCompletion:](self, "startSendingLocationUpdateWithCompletion:", v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __18__SOSEngine_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)WeakRetained[3];
    WeakRetained[3] = v1;

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SOSCoordinator removeObserver:](self->_sosCoordinator, "removeObserver:", self->_sosStatusManager);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SOSEngine;
  -[SOSEngine dealloc](&v4, sel_dealloc);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SOSEngine_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sSOSEngine;
}

void __27__SOSEngine_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sSOSEngine;
  sharedInstance_sSOSEngine = (uint64_t)v1;

}

- (id)contactsManager
{
  return self->_contactsManager;
}

- (void)setSosStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_sosStatusManager, a3);
}

- (NSXPCListenerDelegate)sosStatusManager
{
  return (NSXPCListenerDelegate *)self->_sosStatusManager;
}

- (void)_tuCallCenterStatusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DBD4A0]);

    sos_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SOSEngine, received TUCallCenterCallStatusChangedNotification notification", v10, 2u);
      }

      -[SOSEngine _checkEmergencyCallStatus](self, "_checkEmergencyCallStatus");
      -[SOSEngine _checkSOSCallStatus](self, "_checkSOSCallStatus");
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SOSEngine _tuCallCenterStatusChanged:].cold.1(v5, v9);

    }
  }

}

- (void)_checkEmergencyCallStatus
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCalls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callsOnDefaultPairedDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v6;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v13
          && objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "isEmergency", (_QWORD)v14))
        {
          v10 = v13;
          goto LABEL_12;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_12:

  -[SOSEngine _onEmergencyCallStatusChanged:](self, "_onEmergencyCallStatusChanged:", v10);
}

- (void)_onEmergencyCallStatusChanged:(id)a3
{
  self->_isEmergencyCallOngoing = a3 != 0;
}

- (void)_checkSOSCallStatus
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentCalls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithArray:", v4);

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callsOnDefaultPairedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v5;
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v12 && objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "isSOS", (_QWORD)v14))
        {
          v9 = v12;
          goto LABEL_12;
        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_12:

  +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleSOSCallStatusChange:", v9);

}

- (void)SOSSendingLocationUpdateChanged:(id)a3
{
  id v4;
  _BOOL8 v5;
  NSMutableArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SOSEngine isSendingLocationUpdate](self, "isSendingLocationUpdate");
  v6 = self->_clientConnections;
  objc_sync_enter(v6);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SOSEngine clientConnections](self, "clientConnections", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_225_0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setSendingLocationUpdate:", v5);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_sync_exit(v6);
}

void __45__SOSEngine_SOSSendingLocationUpdateChanged___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__SOSEngine_SOSSendingLocationUpdateChanged___block_invoke_cold_1();

}

- (void)updateCurrentSOSInitiationState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SOSEngine clientConnections](self, "clientConnections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v19 = a3;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to update current sos initiation state to %ld for connections: %@", buf, 0x16u);

  }
  self->_currentSOSInitiationState = a3;
  if (!a3)
    -[SOSPersistentTimerLocationManager stopRequestingLocationUpdates](self->_sosPersistentTimerLocationManager, "stopRequestingLocationUpdates");
  v7 = self->_clientConnections;
  objc_sync_enter(v7);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SOSEngine clientConnections](self, "clientConnections", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_226);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateClientCurrentSOSInitiationState:", a3);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

void __45__SOSEngine_updateCurrentSOSInitiationState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__SOSEngine_updateCurrentSOSInitiationState___block_invoke_cold_1();

}

- (void)updateCurrentSOSInteractiveState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SOSEngine clientConnections](self, "clientConnections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v19 = a3;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to update current sos interactive state to %ld for connections: %@", buf, 0x16u);

  }
  self->_currentSOSInteractiveState = a3;
  v7 = self->_clientConnections;
  objc_sync_enter(v7);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SOSEngine clientConnections](self, "clientConnections", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_227);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "updateClientCurrentSOSInteractiveState:", a3);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

void __46__SOSEngine_updateCurrentSOSInteractiveState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __46__SOSEngine_updateCurrentSOSInteractiveState___block_invoke_cold_1();

}

- (void)updateCurrentSOSButtonPressState:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[SOSEngine clientConnections](self, "clientConnections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v5;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSEngine,attempting to update current sos button press state to %@ for connections: %@", buf, 0x16u);

  }
  objc_storeStrong((id *)&self->_currentSOSButtonPressState, a3);
  v8 = self->_clientConnections;
  objc_sync_enter(v8);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SOSEngine clientConnections](self, "clientConnections", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_228);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "updateClientCurrentSOSButtonPressState:", v5);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_sync_exit(v8);
}

void __46__SOSEngine_updateCurrentSOSButtonPressState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __46__SOSEngine_updateCurrentSOSButtonPressState___block_invoke_cold_1();

}

- (void)dismissSOSWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  NSMutableArray *obj;
  _QWORD v16[4];
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[3];
  char v28;
  _QWORD v29[4];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  obj = self->_clientConnections;
  objc_sync_enter(obj);
  -[SOSEngine clientConnections](self, "clientConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SOSEngine clientConnections](self, "clientConnections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
        v21[0] = v10;
        v21[1] = 3221225472;
        v21[2] = __38__SOSEngine_dismissSOSWithCompletion___block_invoke;
        v21[3] = &unk_1E5F76708;
        v13 = v4;
        v22 = v13;
        objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __38__SOSEngine_dismissSOSWithCompletion___block_invoke_229;
        v16[3] = &unk_1E5F76758;
        v18 = v29;
        v19 = v27;
        v20 = v6;
        v17 = v13;
        objc_msgSend(v14, "dismissClientSOSWithCompletion:", v16);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v8);
  }

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  objc_sync_exit(obj);

}

void __38__SOSEngine_dismissSOSWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__SOSEngine_dismissSOSWithCompletion___block_invoke_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

void __38__SOSEngine_dismissSOSWithCompletion___block_invoke_229(uint64_t a1, char a2)
{
  uint64_t v2;
  id v3;
  __int128 v4;
  _QWORD block[4];
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SOSEngine_dismissSOSWithCompletion___block_invoke_2;
  block[3] = &unk_1E5F76730;
  v9 = a2;
  v2 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = v2;
  v4 = *(_OWORD *)(a1 + 32);
  v3 = (id)v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __38__SOSEngine_dismissSOSWithCompletion___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24);
  if (*(_BYTE *)(result + 64))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 1;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == *(_QWORD *)(result + 56))
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(result + 32) + 16))(*(_QWORD *)(result + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24));
  return result;
}

- (void)didDismissSOSBeforeSOSCall:(int64_t)a3
{
  NSMutableArray *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = self->_clientConnections;
  objc_sync_enter(v5);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SOSEngine clientConnections](self, "clientConnections", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_231);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "didDismissClientSOSBeforeSOSCall:", a3);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

void __40__SOSEngine_didDismissSOSBeforeSOSCall___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __40__SOSEngine_didDismissSOSBeforeSOSCall___block_invoke_cold_1();

}

- (void)broadcastUpdatedSOSStatus:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSEngine, broadcasting SOSStatus: %@", buf, 0xCu);

  }
  v7 = self->_clientConnections;
  objc_sync_enter(v7);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SOSEngine clientConnections](self, "clientConnections", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "remoteObjectProxyWithErrorHandler:", &__block_literal_global_232);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "didUpdateSOSStatus:", v4);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_sync_exit(v7);
}

void __39__SOSEngine_broadcastUpdatedSOSStatus___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __39__SOSEngine_broadcastUpdatedSOSStatus___block_invoke_cold_1();

}

- (void)notifySafetyKitWithSOSStatus:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "resolution") == 4)
  {
    objc_msgSend(getSAServerClass(), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startMonitoringLocation");

  }
  if (objc_msgSend(v3, "trigger") == 7)
  {
    v5 = objc_msgSend(v3, "resolution");
    if (v5)
    {
      v6 = v5 == 4;
      sos_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315394;
        v13 = "-[SOSEngine notifySafetyKitWithSOSStatus:]";
        v14 = 2112;
        v15 = v3;
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "%s - Notifying clients most recent kappa event, %@", (uint8_t *)&v12, 0x16u);
      }

      objc_msgSend(getSAServerClass(), "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeOfDetection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeOfResolution");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "notifyCrashDetectedAt:resolvedAt:resolvedWithResponse:completion:", v9, v10, v6, &__block_literal_global_234);

      objc_msgSend(getSAServerClass(), "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stopMonitoringLocation");

    }
  }

}

- (void)sosPersistentTimerLocationManagerTimerFired:(id)a3 location:(id)a4
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  CLLocation *lastLocationSent;
  double v24;
  BOOL v26;
  int v27;
  NSObject *v28;
  CLLocation *v29;
  void *v30;
  void *v31;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSDate *v33;
  NSDate *timeLastMessageSent;
  void *v35;
  char *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  int v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  _BYTE v46[10];
  __int16 v47;
  CLLocation *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = -[SOSEngine locationIsValidToSend:](self, "locationIsValidToSend:", v5);
  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v41 = 136315650;
    v42 = "-[SOSEngine sosPersistentTimerLocationManagerTimerFired:location:]";
    v43 = 1024;
    v44 = v6;
    v45 = 2112;
    *(_QWORD *)v46 = v5;
    _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "%s - isLocationValid: %d location: %@", (uint8_t *)&v41, 0x1Cu);
  }

  if (!v6)
  {

    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!self->_timeLastMessageSent)
    goto LABEL_32;
  objc_msgSend(v8, "objectForKey:", CFSTR("locationUpdateTimerIntervalSeconds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "doubleValue");
    v13 = v12;
  }
  else
  {
    v13 = 900.0;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("locationUpdateMinimumDistanceMeters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v17 = v16;
  }
  else
  {
    v17 = 402.336;
  }
  if (v13 <= 60.0)
    v18 = 0.0;
  else
    v18 = 10.0;
  -[NSDate timeIntervalSinceNow](self->_timeLastMessageSent, "timeIntervalSinceNow");
  v19 = 0;
  v21 = -v20;
  v22 = v13 - v18;
  lastLocationSent = self->_lastLocationSent;
  if (v5 && lastLocationSent)
  {
    objc_msgSend(v5, "distanceFromLocation:");
    v19 = v24 > v17;
    if (v22 <= v21 && v24 > v17)
    {
      v19 = 1;
      v27 = 1;
      goto LABEL_29;
    }
    lastLocationSent = self->_lastLocationSent;
  }
  if (v5)
    v26 = lastLocationSent == 0;
  else
    v26 = 0;
  v27 = v26;
LABEL_29:
  sos_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_lastLocationSent;
    v41 = 136316418;
    v42 = "-[SOSEngine sosPersistentTimerLocationManagerTimerFired:location:]";
    v43 = 1024;
    v44 = v27;
    v45 = 1024;
    *(_DWORD *)v46 = v22 <= v21;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v19;
    v47 = 2112;
    v48 = v29;
    v49 = 2112;
    v50 = v5;
    _os_log_impl(&dword_1AF4DC000, v28, OS_LOG_TYPE_DEFAULT, "%s - okToSend: %d timeIntervalOk: %d distanceIntervalOk: %d _lastLocationSent: %@ location: %@", (uint8_t *)&v41, 0x32u);
  }

  if (v27)
  {
LABEL_32:
    v30 = (void *)objc_opt_class();
    -[SOSContactsManager phoneNumbersToMessage](self->_contactsManager, "phoneNumbersToMessage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_sendMessageToRecipients:withLocation:isFirstMessage:medicalIDName:Reason:", v31, v5, self->_timeLastMessageSent == 0, self->_medicalIDName, self->_notifyContactsReason);

    objc_storeStrong((id *)&self->_lastLocationSent, v5);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSMostRecentLocationSentChangedNotification"), 0, 0, 1u);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
    timeLastMessageSent = self->_timeLastMessageSent;
    self->_timeLastMessageSent = v33;

  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKey:", CFSTR("SOSSendingLocationUpdateStopTimeKey"));
  v36 = (char *)objc_claimAutoreleasedReturnValue();

  if (v36
    && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v38 = objc_msgSend(v37, "compare:", v36),
        v37,
        v38 == 1))
  {
    sos_default_log();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 138412290;
      v42 = v36;
      _os_log_impl(&dword_1AF4DC000, v39, OS_LOG_TYPE_DEFAULT, "Stopping timer based on timeToStopSending: %@", (uint8_t *)&v41, 0xCu);
    }

    -[SOSEngine stopSendingLocationUpdate](self, "stopSendingLocationUpdate");
  }
  else
  {
    sos_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = 138412290;
      v42 = v36;
      _os_log_impl(&dword_1AF4DC000, v40, OS_LOG_TYPE_DEFAULT, "Not yet reached timeToStopSending: %@", (uint8_t *)&v41, 0xCu);
    }

  }
}

+ (void)_sendMessageToRecipients:(id)a3 withLocation:(id)a4 isFirstMessage:(BOOL)a5 medicalIDName:(id)a6 Reason:(int64_t)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v8 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a4;
  v14 = a3;
  sos_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "+[SOSEngine _sendMessageToRecipients:withLocation:isFirstMessage:medicalIDName:Reason:]";
    _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  sos_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v16, OS_LOG_TYPE_DEFAULT, "Try sending SMS...", buf, 2u);
  }

  objc_msgSend(a1, "_sosMessageForLocation:isFirstMessage:medicalIDName:reason:recipientReason:", v13, v8, v12, a7, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_sosMessageForLocation:isFirstMessage:medicalIDName:reason:recipientReason:", v13, v8, v12, a7, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = &unk_1E5F82EB0;
  v24 = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__SOSEngine__sendMessageToRecipients_withLocation_isFirstMessage_medicalIDName_Reason___block_invoke_242;
  v20[3] = &unk_1E5F76148;
  v21 = &__block_literal_global_239;
  v22 = a1;
  objc_msgSend(a1, "_sendMessage:location:recipients:recipientReasonMessages:useStandalone:critical:failureBlock:", v17, v13, v14, v19, 0, v8, v20);

}

void __87__SOSEngine__sendMessageToRecipients_withLocation_isFirstMessage_medicalIDName_Reason___block_invoke_242(uint64_t a1)
{
  NSObject *v2;

  if (objc_msgSend(*(id *)(a1 + 40), "_isBasebandDevice"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    sos_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __87__SOSEngine__sendMessageToRecipients_withLocation_isFirstMessage_medicalIDName_Reason___block_invoke_242_cold_1(v2);

  }
}

+ (void)_sendMessage:(id)a3 location:(id)a4 recipients:(id)a5 recipientReasonMessages:(id)a6 useStandalone:(BOOL)a7 critical:(BOOL)a8 failureBlock:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;
  uint8_t buf[4];
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a9;
  v19 = a4;
  sos_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "+[SOSEngine _sendMessage:location:recipients:recipientReasonMessages:useStandalone:critical:failureBlock:]";
    _os_log_impl(&dword_1AF4DC000, v20, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __106__SOSEngine__sendMessage_location_recipients_recipientReasonMessages_useStandalone_critical_failureBlock___block_invoke;
  v25[3] = &unk_1E5F76820;
  v26 = v16;
  v27 = v15;
  v29 = v18;
  v30 = a1;
  v31 = a7;
  v32 = a8;
  v28 = v17;
  v21 = v18;
  v22 = v17;
  v23 = v15;
  v24 = v16;
  objc_msgSend(a1, "shiftedLocationWithLocation:completion:", v19, v25);

}

void __106__SOSEngine__sendMessage_location_recipients_recipientReasonMessages_useStandalone_critical_failureBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  +[SOSRecipient handlesFromRecipients:](SOSRecipient, "handlesFromRecipients:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getCKSOSMessageClass_softClass;
  v14 = getCKSOSMessageClass_softClass;
  if (!getCKSOSMessageClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getCKSOSMessageClass_block_invoke;
    v10[3] = &unk_1E5F75CA8;
    v10[4] = &v11;
    __getCKSOSMessageClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithMessage:recipients:", *(_QWORD *)(a1 + 40), v4);
  +[SOSRecipient reasonsDictionaryFromRecipients:](SOSRecipient, "reasonsDictionaryFromRecipients:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRecipientReasons:", v8);

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "setRecipientReasonMessages:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 64), "GPSCoordinatesURLForLocation:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocationURL:", v9);

  objc_msgSend(v7, "setUseStandalone:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v7, "setIsCritical:", *(unsigned __int8 *)(a1 + 73));
  objc_msgSend(*(id *)(a1 + 64), "_sendCKMessage:failureBlock:", v7, *(_QWORD *)(a1 + 56));

}

+ (void)_sendCKMessage:(id)a3 failureBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 buf;
  Class (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v5, "copy");
  v8 = MEMORY[0x1E0C809B0];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __41__SOSEngine__sendCKMessage_failureBlock___block_invoke;
  v18 = &unk_1E5F761B8;
  v9 = v7;
  v19 = v9;
  v10 = v6;
  v20 = v10;
  objc_msgSend(v5, "setFailureBlock:", &v15);
  sos_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "Asking CKSOSUtilities to send message: %@", (uint8_t *)&buf, 0xCu);
  }

  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v12 = (void *)getCKSOSUtilitiesClass_softClass;
  v24 = getCKSOSUtilitiesClass_softClass;
  if (!getCKSOSUtilitiesClass_softClass)
  {
    *(_QWORD *)&buf = v8;
    *((_QWORD *)&buf + 1) = 3221225472;
    v26 = __getCKSOSUtilitiesClass_block_invoke;
    v27 = &unk_1E5F75CA8;
    v28 = &v21;
    __getCKSOSUtilitiesClass_block_invoke((uint64_t)&buf);
    v12 = (void *)v22[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v21, 8);
  objc_msgSend(v13, "sharedUtilities", v15, v16, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sendMessage:", v5);

}

uint64_t __41__SOSEngine__sendCKMessage_failureBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to send %@", (uint8_t *)&v5, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (id)locationShifter
{
  if (locationShifter_onceToken != -1)
    dispatch_once(&locationShifter_onceToken, &__block_literal_global_247);
  return (id)locationShifter_sLocationShifter;
}

void __28__SOSEngine_locationShifter__block_invoke()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)get_MKLocationShifterClass_softClass;
  v8 = get_MKLocationShifterClass_softClass;
  if (!get_MKLocationShifterClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __get_MKLocationShifterClass_block_invoke;
    v4[3] = &unk_1E5F75CA8;
    v4[4] = &v5;
    __get_MKLocationShifterClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  v2 = objc_alloc_init(v1);
  v3 = (void *)locationShifter_sLocationShifter;
  locationShifter_sLocationShifter = (uint64_t)v2;

}

+ (void)shiftedLocationWithLocation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_5;
  objc_msgSend(a1, "locationShifter");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  v9 = (void *)v8;
  objc_msgSend(a1, "locationShifter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "isLocationShiftRequiredForLocation:", v6);

  if (v11)
  {
    dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke;
    block[3] = &unk_1E5F768E0;
    v15 = v7;
    v16 = a1;
    v14 = v6;
    dispatch_async(v12, block);

  }
  else
  {
LABEL_5:
    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }

}

void __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  dispatch_time_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  NSObject *v16;
  id v17;
  uint8_t buf[16];
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[3];
  char v23;

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v2 = dispatch_semaphore_create(0);
  v3 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_2;
  v19[3] = &unk_1E5F76890;
  v21 = v22;
  v20 = *(id *)(a1 + 40);
  v4 = (void *)MEMORY[0x1B5DF84EC](v19);
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOS location shift started", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "locationShifter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_248;
  v14[3] = &unk_1E5F768B8;
  v15 = v7;
  v8 = v4;
  v17 = v8;
  v9 = v2;
  v16 = v9;
  v10 = MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C80D38];
  objc_msgSend(v6, "shiftLocation:withCompletionHandler:callbackQueue:", v15, v14, v10);

  v12 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v9, v12))
  {
    sos_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v13, OS_LOG_TYPE_DEFAULT, "SOS location shift timed out.", buf, 2u);
    }

    (*((void (**)(id, _QWORD))v8 + 2))(v8, *(_QWORD *)(a1 + 32));
  }

  _Block_object_dispose(v22, 8);
}

void __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  __int128 v6;
  _QWORD block[4];
  id v8;
  __int128 v9;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_3;
  block[3] = &unk_1E5F76868;
  v6 = *(_OWORD *)(a1 + 32);
  v4 = (id)v6;
  v9 = v6;
  v8 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

_QWORD *__52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_3(_QWORD *result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result[6] + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD))(result[5] + 16))(result[5], result[4]);
  }
  return result;
}

void __52__SOSEngine_shiftedLocationWithLocation_completion___block_invoke_248(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOS location shift completed. Shifted from %@ to %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (BOOL)_isBasebandDevice
{
  return 0;
}

- (BOOL)notificationEnabledAndContactsExist
{
  return -[SOSContactsManager hasValidContactsToMessage](self->_contactsManager, "hasValidContactsToMessage");
}

- (void)willStartSendingLocationUpdate
{
  NSObject *v3;
  NSDate *timeLastMessageSent;
  CLLocation *lastLocationSent;
  NSObject *v6;
  const char *v7;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)&v9[4] = "-[SOSEngine willStartSendingLocationUpdate]";
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", v9, 0xCu);
  }

  if (!-[SOSEngine isSendingLocationUpdate](self, "isSendingLocationUpdate"))
  {
    timeLastMessageSent = self->_timeLastMessageSent;
    self->_timeLastMessageSent = 0;

    lastLocationSent = self->_lastLocationSent;
    self->_lastLocationSent = 0;

    -[SOSContactsManager refreshCurrentEmergencyContacts](self->_contactsManager, "refreshCurrentEmergencyContacts");
  }
  if (!-[SOSEngine notificationEnabledAndContactsExist](self, "notificationEnabledAndContactsExist"))
  {
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      v7 = "no emergency contacts to notify";
      goto LABEL_11;
    }
LABEL_12:

    goto LABEL_14;
  }
  if (-[SOSPersistentTimerLocationManager isRequestingLocation](self->_sosPersistentTimerLocationManager, "isRequestingLocation"))
  {
    sos_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      v7 = "Skipping request for warmUpLocationRequest since we are already requesting location";
LABEL_11:
      _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, v7, v9, 2u);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  -[SOSPersistentTimerLocationManager warmUpLocationRequest](self->_sosPersistentTimerLocationManager, "warmUpLocationRequest");
LABEL_14:
  if (+[SOSUtilities mostRecentlyUsedSOSTriggerMechanism](SOSUtilities, "mostRecentlyUsedSOSTriggerMechanism", *(_QWORD *)v9) == 7)
  {
    objc_msgSend(getSAServerClass(), "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startMonitoringLocation");

  }
}

- (void)startSendingLocationUpdateForReason:(int64_t)a3 WithCompletion:(id)a4
{
  id v5;

  self->_notifyContactsReason = a3;
  v5 = a4;
  -[SOSEngine notifyEmergencyReasonToSafetyBuddy](self, "notifyEmergencyReasonToSafetyBuddy");
  -[SOSEngine startSendingLocationUpdateWithCompletion:](self, "startSendingLocationUpdateWithCompletion:", v5);

}

- (void)notifyEmergencyReasonToSafetyBuddy
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];

  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.SOS"));
  objc_msgSend(v4, "valueForKey:", CFSTR("SimulateSOSNotifyEmergencyContacts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[SOSUtilities _isInternalDevice](SOSUtilities, "_isInternalDevice"))
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
  {
    if (v3)
    {
      switch(objc_msgSend(v3, "trigger"))
      {
        case 0:
          sos_default_log();
          v7 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            goto LABEL_31;
          *(_WORD *)v15 = 0;
          v8 = "#notifySB notifyEmergencyReasonToSafetyBuddy for unknown reason";
          goto LABEL_30;
        case 5:
          sos_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Newton", v15, 2u);
          }

          v10 = SOSEventNotificationNewton;
          break;
        case 6:
          sos_default_log();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Cinnamon", v15, 2u);
          }

          v10 = (const char *)SOSEventNotificationCinnamon;
          break;
        case 7:
          sos_default_log();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1AF4DC000, v13, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Kappa", v15, 2u);
          }

          v10 = SOSEventNotificationKappa;
          break;
        case 8:
          sos_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1AF4DC000, v14, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Mandrake", v15, 2u);
          }

          v10 = (const char *)SOSEventNotificationMandrake;
          break;
        case 9:
          sos_default_log();
          v7 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            goto LABEL_31;
          *(_WORD *)v15 = 0;
          v8 = "#notifySB notifyEmergencyReasonToSafetyBuddy for unknown reason";
          goto LABEL_30;
        default:
          sos_default_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v15 = 0;
            _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Trigger", v15, 2u);
          }

          v10 = SOSEventNotificationTrigger;
          break;
      }
      notify_post(v10);
    }
    else
    {
      sos_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        v8 = "#notifySB notifyEmergencyReasonToSafetyBuddy invalid SOSStatus";
LABEL_30:
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, v8, v15, 2u);
      }
LABEL_31:

    }
  }
  else
  {
    -[SOSEngine notifyEmergencyReasonToSafetyBuddyForInternalDevices](self, "notifyEmergencyReasonToSafetyBuddyForInternalDevices");
  }

}

- (void)notifyEmergencyReasonToSafetyBuddyForInternalDevices
{
  NSObject *v3;
  int64_t notifyContactsReason;
  NSObject *v5;
  char **v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  if (+[SOSUtilities _isInternalDevice](SOSUtilities, "_isInternalDevice"))
  {
    sos_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "#notifySB Allowing notify contact reason to notify Safety Monitor since internal device", buf, 2u);
    }

    notifyContactsReason = self->_notifyContactsReason;
    if (notifyContactsReason == 2)
    {
      sos_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Kappa", v7, 2u);
      }
      v6 = &SOSEventNotificationKappa;
    }
    else if (notifyContactsReason == 1)
    {
      sos_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Newton", v8, 2u);
      }
      v6 = &SOSEventNotificationNewton;
    }
    else
    {
      if (notifyContactsReason)
        return;
      sos_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "#notifySB notifyEmergencyReasonToSafetyBuddy for SOS Trigger", v9, 2u);
      }
      v6 = &SOSEventNotificationTrigger;
    }

    notify_post(*v6);
  }
}

- (void)startSendingLocationUpdateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SOSEngine startSendingLocationUpdateWithCompletion:]";
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SOSEngine_startSendingLocationUpdateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F761B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __54__SOSEngine_startSendingLocationUpdateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t result;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = 0;

  if (objc_msgSend(*(id *)(a1 + 32), "notificationEnabledAndContactsExist"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("locationUpdateTimerIntervalSeconds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      objc_msgSend(v7, "doubleValue");
    else
      v9 = 900.0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fireAndStartTimertWithTimeInterval:", v9 / 3.0);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("SOSSendingLocationUpdateStopTimeKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("stopSendingTimerIntervalSeconds"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "doubleValue");
        v15 = v14;
      }
      else
      {
        v15 = 86400.0;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateByAddingTimeInterval:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v17, CFSTR("SOSSendingLocationUpdateStopTimeKey"));

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = CFSTR("SOSSendingLocationUpdateValueKey");
    v23[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("SOSSendingLocationUpdateChangedNotification"), 0, v20);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

- (void)stopSendingLocationUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[SOSEngine stopSendingLocationUpdate]";
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[SOSPersistentTimerLocationManager invalidateTimer](self->_sosPersistentTimerLocationManager, "invalidateTimer");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", CFSTR("SOSSendingLocationUpdateStopTimeKey"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("SOSSendingLocationUpdateValueKey");
  v8 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SOSSendingLocationUpdateChangedNotification"), 0, v6);

}

- (BOOL)isSendingLocationUpdate
{
  return -[SOSPersistentTimerLocationManager isValid](self->_sosPersistentTimerLocationManager, "isValid");
}

- (void)mostRecentLocationSentWithCompletion:(id)a3
{
  id v4;
  void *v5;
  CLLocation *lastLocationSent;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  lastLocationSent = self->_lastLocationSent;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__SOSEngine_mostRecentLocationSentWithCompletion___block_invoke;
  v8[3] = &unk_1E5F76908;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "shiftedLocationWithLocation:completion:", lastLocationSent, v8);

}

uint64_t __50__SOSEngine_mostRecentLocationSentWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)syncState:(id)a3
{
  id v5;

  v5 = a3;
  (*((void (**)(id, BOOL, int64_t, int64_t, SOSButtonPressState *))a3 + 2))(v5, -[SOSEngine isSendingLocationUpdate](self, "isSendingLocationUpdate"), self->_currentSOSInitiationState, self->_currentSOSInteractiveState, self->_currentSOSButtonPressState);

}

+ (id)meContact
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *MEMORY[0x1E0C967E0];
  v11[0] = *MEMORY[0x1E0C967D8];
  v11[1] = v4;
  v5 = *MEMORY[0x1E0C967E8];
  v11[2] = *MEMORY[0x1E0C967D0];
  v11[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SOSEngine contactStore](SOSEngine, "contactStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_ios_meContactWithKeysToFetch:error:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)fullNameForContact:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)firstNameForContact:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", a3, 1000);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_sosMessageForLocation:(id)a3 isFirstMessage:(BOOL)a4 medicalIDName:(id)a5 reason:(int64_t)a6 recipientReason:(unint64_t)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v10 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  objc_msgSend(a1, "meContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fullNameForContact:", v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "firstNameForContact:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "length") || !objc_msgSend(v16, "length"))
  {
    sos_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v13;
      _os_log_impl(&dword_1AF4DC000, v17, OS_LOG_TYPE_DEFAULT, "Failed to get meContact's name, using medicalID's name: %@", (uint8_t *)&v21, 0xCu);
    }

    v18 = v13;
    v15 = v18;

    v16 = v15;
  }
  objc_msgSend(a1, "_sosMessageForLocation:isFirstMessage:myFullName:myFirstName:reason:recipientReason:", v12, v10, v15, v16, a6, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_sosMessageForLocation:(id)a3 isFirstMessage:(BOOL)a4 myFullName:(id)a5 myFirstName:(id)a6 reason:(int64_t)a7 recipientReason:(unint64_t)a8
{
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  __CFString *v50;
  const __CFString *v51;
  __CFString *v52;
  __CFString *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  _QWORD v59[2];
  _QWORD v60[3];

  v60[2] = *MEMORY[0x1E0C80C00];
  v12 = (__CFString *)a5;
  v13 = (__CFString *)a6;
  if (-[__CFString length](v12, "length") && !-[__CFString length](v13, "length"))
  {
    v14 = v12;

    v13 = v14;
  }
  v15 = CFSTR("_NO_NAME");
  if (-[__CFString length](v12, "length") && -[__CFString length](v13, "length"))
    v15 = CFSTR("_HAS_NAME");
  v16 = v15;
  v17 = CFSTR("_HAS_LOCATION");
  if (a7 == 2)
  {
    if (!a3)
      v17 = CFSTR("_NO_LOCATION");
    v21 = v17;
    v51 = CFSTR("EMERGENCY_TYPE_KAPPA_TRIGGER");
    if (a4)
    {
      v20 = CFSTR("KAPPA");
      v22 = CFSTR("_PHONE");
      goto LABEL_24;
    }
  }
  else
  {
    v18 = CFSTR("EMERGENCY_TYPE_SOS_TRIGGER");
    v19 = CFSTR("EMERGENCY");
    if (a7)
      v19 = 0;
    else
      v18 = CFSTR("EMERGENCY_TYPE_SOS_TRIGGER");
    if (a7 == 1)
      v18 = CFSTR("EMERGENCY_TYPE_NEWTON_TRIGGER");
    v51 = v18;
    if (a7 == 1)
      v20 = CFSTR("NEWTON");
    else
      v20 = v19;
    if (!a3)
      v17 = CFSTR("_NO_LOCATION");
    v21 = v17;
    if (a4)
    {
      v22 = &stru_1E5F76FF8;
LABEL_24:
      v52 = v21;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_TEXT_MESSAGE%@%@%@"), v20, v16, v21, v22);
      goto LABEL_26;
    }
  }
  v52 = v21;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EMERGENCY_TEXT_MESSAGE_SUBSEQUENT%@%@"), v16, v21, v47, v48);
LABEL_26:
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = CFSTR("_EMERGENCYCONTACT");
  if (a8 == 2)
    v24 = CFSTR("_CHECKIN");
  v54 = v16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("EMERGENCY_TEXT_MESSAGE_RECIPIENT%@%@"), v24, v16);
  v25 = objc_claimAutoreleasedReturnValue();
  if (v12)
    v26 = v12;
  else
    v26 = &stru_1E5F76FF8;
  v27 = v26;

  if (v13)
    v28 = v13;
  else
    v28 = &stru_1E5F76FF8;
  v29 = v28;

  v30 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "localizedStringForKey:value:table:", v23, &stru_1E5F76FF8, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v27;
  v60[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithPositionalSpecifiersFormat:arguments:", v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v25;
  objc_msgSend(v36, "localizedStringForKey:value:table:", v25, &stru_1E5F76FF8, 0);
  v37 = (void *)v23;
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v27;
  v59[0] = v27;
  v59[1] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringWithPositionalSpecifiersFormat:arguments:", v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedStringForKey:value:table:", v51, &stru_1E5F76FF8, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "stringWithFormat:", CFSTR("%@%@ %@"), v43, v34, v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  sos_default_log();
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v56 = v37;
    v57 = 2112;
    v58 = v44;
    _os_log_impl(&dword_1AF4DC000, v45, OS_LOG_TYPE_DEFAULT, "textMessageKey: %@ sosMessage: %@", buf, 0x16u);
  }

  return v44;
}

+ (id)GPSCoordinatesURLForLocation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "coordinate");
    v7 = v6;
    objc_msgSend(v4, "coordinate");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("https://maps.apple.com/?ll=%.5f,%.5f"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_PIN_LABEL"), &stru_1E5F76FF8, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAddingPercentEncodingWithAllowedCharacters:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("&q=%@"), v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingString:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v15;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)additionalTextForCallbackNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "meContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fullNameForContact:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "firstNameForContact:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "additionalTextForCallbackNumber:fullName:firstName:", v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)additionalTextForCallbackNumber:(id)a3 fullName:(id)a4 firstName:(id)a5
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v6 = a3;
  v7 = a5;
  v8 = objc_msgSend(v7, "length");
  if (objc_msgSend(v6, "length"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v8)
    {
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_TEXT_CALLBACK_NUMBER_ADDITION_NO_NAME"), &stru_1E5F76FF8, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v12, v6, v15);
      goto LABEL_8;
    }
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_TEXT_CALLBACK_NUMBER_ADDITION_HAS_NAME"), &stru_1E5F76FF8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v6;
  }
  else
  {
    if (!v8)
    {
      v13 = 0;
      goto LABEL_9;
    }
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_TEXT_CALLBACK_NO_NUMBER_ADDITION_HAS_NAME"), &stru_1E5F76FF8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "stringWithFormat:", v12, v7, v15);
LABEL_8:
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

- (BOOL)locationIsValidToSend:(id)a3
{
  id v3;
  NSObject *v4;
  double v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  BOOL v9;
  double v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  int v16;
  NSObject *v18;
  double v19;
  NSObject *v20;
  const char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  _WORD v26[17];

  *(_QWORD *)&v26[13] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315394;
    v24 = "-[SOSEngine locationIsValidToSend:]";
    v25 = 2112;
    *(_QWORD *)v26 = v3;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "%s - location: %@", (uint8_t *)&v23, 0x16u);
  }

  if (v3)
  {
    objc_msgSend(v3, "horizontalAccuracy");
    if (v5 >= 0.0)
    {
      objc_msgSend(v3, "horizontalAccuracy");
      if (v10 <= 165.0)
      {
        v15 = objc_msgSend(v3, "integrity");
        v16 = v15;
        if (v15 == *MEMORY[0x1E0C9E510] || v15 == *MEMORY[0x1E0C9E508])
        {
          objc_msgSend(v3, "timestamp");
          v18 = objc_claimAutoreleasedReturnValue();
          v6 = v18;
          if (v18 && (-[NSObject timeIntervalSinceNow](v18, "timeIntervalSinceNow"), v19 < -180.0))
          {
            sos_default_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v23 = 138412290;
              v24 = (const char *)v6;
              _os_log_impl(&dword_1AF4DC000, v20, OS_LOG_TYPE_DEFAULT, "Rejecting location - timestamp too old: %@", (uint8_t *)&v23, 0xCu);
            }
            v9 = 0;
          }
          else
          {
            sos_default_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v3, "horizontalAccuracy");
              v23 = 134218498;
              v24 = v22;
              v25 = 1024;
              *(_DWORD *)v26 = v16;
              v26[2] = 2112;
              *(_QWORD *)&v26[3] = v6;
              _os_log_impl(&dword_1AF4DC000, v20, OS_LOG_TYPE_DEFAULT, "Keeping location - horizontalAccuracy:%f locationIntegrity:%d timestamp:%@", (uint8_t *)&v23, 0x1Cu);
            }
            v9 = 1;
          }

          goto LABEL_14;
        }
        sos_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          LODWORD(v24) = v16;
          v8 = "Rejecting location - locationIntegrity: %d";
          v12 = v6;
          v13 = 8;
          goto LABEL_12;
        }
      }
      else
      {
        sos_default_log();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v3, "horizontalAccuracy");
          v23 = 134217984;
          v24 = v11;
          v8 = "Rejecting location - horizontalAccuracy > 165.0: %f";
          goto LABEL_11;
        }
      }
    }
    else
    {
      sos_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "horizontalAccuracy");
        v23 = 134217984;
        v24 = v7;
        v8 = "Rejecting location - horizontalAccuracy < 0.0: %f";
LABEL_11:
        v12 = v6;
        v13 = 12;
LABEL_12:
        _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v23, v13);
      }
    }
    v9 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (void)retriggerSOSWithUUID:(id)a3 trigger:(int64_t)a4
{
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_isEmergencyCallOngoing)
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "SOSEngine,retrigger blocked by ongoing emergency call", (uint8_t *)&v10, 2u);
    }

    +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateSOSFlowState:", 10);
  }
  else
  {
    +[SOSEngine getUrlForTrigger:](SOSEngine, "getUrlForTrigger:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateSOSFlowState:", 14);

      sos_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1AF4DC000, v7, OS_LOG_TYPE_DEFAULT, "SOSEngine,opening retrigger URL,%@", (uint8_t *)&v10, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "openURL:configuration:completionHandler:", v5, 0, &__block_literal_global_312);
    }
    else
    {
      sos_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SOSEngine,no URL to launch for retrigger", (uint8_t *)&v10, 2u);
      }

      +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateSOSFlowState:", 0);
    }

  }
}

void __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke_cold_1();

    +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateSOSFlowState:](v5, "updateSOSFlowState:", 0);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS triggered successfully", v6, 2u);
  }

}

- (void)handoffFallbackWithUUID:(id)a3 trigger:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && -[NSObject shouldRejectNewSOSTriggers](v7, "shouldRejectNewSOSTriggers"))
  {
    sos_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v8;
      v10 = "SOSEngine,handoff fallback blocked by existing SOS flow: %@";
      v11 = v9;
      v12 = 12;
LABEL_8:
      _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v16, v12);
    }
  }
  else if (self->_isEmergencyCallOngoing)
  {
    sos_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v10 = "SOSEngine,handoff fallback blocked by ongoing emergency call";
      v11 = v9;
      v12 = 2;
      goto LABEL_8;
    }
  }
  else
  {
    +[SOSEngine getUrlForTrigger:](SOSEngine, "getUrlForTrigger:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sosTriggeredWithUUID:trigger:source:", v6, a4, 0);

      sos_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138412290;
        v17 = v9;
        _os_log_impl(&dword_1AF4DC000, v14, OS_LOG_TYPE_DEFAULT, "SOSEngine,opening handoff fallback URL,%@", (uint8_t *)&v16, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject openURL:configuration:completionHandler:](v15, "openURL:configuration:completionHandler:", v9, 0, &__block_literal_global_313);
    }
    else
    {
      sos_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1AF4DC000, v15, OS_LOG_TYPE_DEFAULT, "SOSEngine,no URL to launch for handoff fallback", (uint8_t *)&v16, 2u);
      }
    }

  }
}

void __45__SOSEngine_handoffFallbackWithUUID_trigger___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke_cold_1();

    +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateSOSFlowState:](v5, "updateSOSFlowState:", 0);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS triggered successfully", v6, 2u);
  }

}

- (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5
{
  -[SOSEngine triggerSOSWithUUID:triggerMechanism:source:completion:](self, "triggerSOSWithUUID:triggerMechanism:source:completion:", a3, a4, 0, a5);
}

- (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 source:(int64_t)a5 completion:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t);
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _QWORD v30[4];
  void (**v31)(id, uint64_t);
  uint8_t buf[4];
  id v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void (**)(id, uint64_t))a6;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  sos_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v33 = v10;
    v34 = 1024;
    v35 = a4;
    _os_log_impl(&dword_1AF4DC000, v12, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS triggered,uuid,%@,mechanism,%d", buf, 0x12u);
  }

  +[SOSUtilities currentDeviceSOSStatus](SOSUtilities, "currentDeviceSOSStatus");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOSUtilities pairedDeviceSOSStatus](SOSUtilities, "pairedDeviceSOSStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && (objc_msgSend(v13, "shouldRejectNewSOSTriggers") & 1) != 0
    || v14 && objc_msgSend(v14, "shouldRejectNewSOSTriggers"))
  {
    if (v11)
      v11[2](v11, 2);
    -[SOSEngine coreAnalyticsReporter](self, "coreAnalyticsReporter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "reportSOSRejectedWithTrigger:currentTriggerMechanism:", a4, objc_msgSend(v13, "trigger"));
LABEL_12:

    goto LABEL_41;
  }
  if (self->_isEmergencyCallOngoing)
  {
    if (v11)
      v11[2](v11, 6);
    goto LABEL_41;
  }
  if (!-[SOSEngine isTriggerEnabled:](self, "isTriggerEnabled:", a4))
  {
    sos_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = a4;
      _os_log_impl(&dword_1AF4DC000, v22, OS_LOG_TYPE_DEFAULT, "SOSEngine,trigger (%d) not enabled", buf, 8u);
    }

    if (v11)
      v11[2](v11, 4);
    +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sosTriggerDisabledWithUUID:trigger:", v10, a4);
    goto LABEL_12;
  }
  +[SOSCoordinator sharedInstance](SOSCoordinator, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldHandoffToPairedDevice:", a4);

  if (v17)
  {
    +[SOSCoordinator sharedInstance](SOSCoordinator, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "tryPushToPairedDeviceWithUUID:triggerMechanism:", v10, a4);

    if (v19)
    {
      sos_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AF4DC000, v20, OS_LOG_TYPE_DEFAULT, "SOSEngine,successfully completed SOS handoff to paired device", buf, 2u);
      }

      +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sosTriggerPushedToPairedDeviceWithUUID:trigger:", v10, a4);

      if (v11)
        v11[2](v11, 5);
      goto LABEL_41;
    }
  }
  else
  {
    sos_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v23, OS_LOG_TYPE_DEFAULT, "SOSEngine,handoff SOS trigger to paired device unsupported", buf, 2u);
    }

  }
  +[SOSEngine getUrlForTrigger:](SOSEngine, "getUrlForTrigger:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "sosTriggeredWithUUID:trigger:source:", v10, a4, a5);

    sos_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v24;
      _os_log_impl(&dword_1AF4DC000, v26, OS_LOG_TYPE_DEFAULT, "SOSEngine,opening URL,%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __67__SOSEngine_triggerSOSWithUUID_triggerMechanism_source_completion___block_invoke;
    v30[3] = &unk_1E5F76970;
    v31 = v11;
    objc_msgSend(v27, "openURL:configuration:completionHandler:", v24, 0, v30);

    -[SOSEngine coreAnalyticsReporter](self, "coreAnalyticsReporter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "reportSOSTriggered:", a4);

  }
  else
  {
    sos_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AF4DC000, v29, OS_LOG_TYPE_DEFAULT, "SOSEngine,no URL to launch", buf, 2u);
    }

    if (v11)
      v11[2](v11, 1);
  }

LABEL_41:
}

void __67__SOSEngine_triggerSOSWithUUID_triggerMechanism_source_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  uint8_t v13[16];

  v5 = a2;
  v6 = a3;
  sos_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke_cold_1();

    +[SOSStatusManager sharedInstance](SOSStatusManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateSOSFlowState:", 0);

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
      v11();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS triggered successfully", v13, 2u);
    }

    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }
  }

}

- (BOOL)isTriggerEnabled:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((unint64_t)a3 > 9)
  {
    sos_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SOSEngine isTriggerEnabled:].cold.1(a3, v5, v6, v7, v8, v9, v10, v11);

    return 0;
  }
  else if (((1 << a3) & 0x35F) != 0)
  {
    return 1;
  }
  else if (a3 == 5)
  {
    return +[SOSUtilities newtonTriggersEmergencySOS](SOSUtilities, "newtonTriggersEmergencySOS");
  }
  else
  {
    return +[SOSUtilities kappaTriggersEmergencySOS](SOSUtilities, "kappaTriggersEmergencySOS");
  }
}

+ (id)getUrlForTrigger:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0CB3998]);
  objc_msgSend(v4, "setScheme:", CFSTR("telSOS"));
  +[SOSEngine mapTriggerToActivationReason:](SOSEngine, "mapTriggerToActivationReason:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("reason"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQueryItems:", v7);

  objc_msgSend(v4, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)mapTriggerToActivationReason:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((unint64_t)a3 < 8 && ((0x8Fu >> a3) & 1) != 0)
    return off_1E5F76A70[a3];
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    +[SOSEngine mapTriggerToActivationReason:].cold.1(a3, v4, v5, v6, v7, v8, v9, v10);

  return CFSTR("SOSRemoteAlertActivationReasonActivatingForSOSWithVolumeLockHold");
}

- (void)contactStoreDidChange
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SOSFriendsChangedNotification"), 0);

}

+ (void)preloadContactStoreIfNecessary
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SOSEngine_preloadContactStoreIfNecessary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (preloadContactStoreIfNecessary_once_1 != -1)
    dispatch_once(&preloadContactStoreIfNecessary_once_1, block);
}

void __43__SOSEngine_preloadContactStoreIfNecessary__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;
  _QWORD block[5];

  v2 = dispatch_queue_create("com.apple.sos.contactStoreQueue", 0);
  v3 = (void *)__contactStoreQueue_1;
  __contactStoreQueue_1 = (uint64_t)v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SOSEngine_preloadContactStoreIfNecessary__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)__contactStoreQueue_1, block);
}

void __43__SOSEngine_preloadContactStoreIfNecessary__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "authorizedToUseContactStore"))
  {
    objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 1);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)__contactStore_1;
    __contactStore_1 = v1;

  }
}

+ (id)contactStore
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  objc_msgSend(a1, "preloadContactStoreIfNecessary");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SOSEngine_contactStore__block_invoke;
  block[3] = &unk_1E5F75CA8;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)__contactStoreQueue_1, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __25__SOSEngine_contactStore__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)__contactStore_1);
}

+ (BOOL)authorizedToUseContactStore
{
  if (authorizedToUseContactStore_onceToken_1 != -1)
    dispatch_once(&authorizedToUseContactStore_onceToken_1, &__block_literal_global_329);
  return authorizedToUseContactStore_contactStoreAuthorized_1;
}

void __40__SOSEngine_authorizedToUseContactStore__block_invoke()
{
  uint64_t v0;

  v0 = objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
  authorizedToUseContactStore_contactStoreAuthorized_1 = v0 == 3;
  if (v0 != 3)
    NSLog(CFSTR("Not authorized to access contact store (authorization status: %ld)"), v0);
}

- (void)fetchMedicalIDName
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6780]), "initWithIdentifier:", CFSTR("com.apple.sos"));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__SOSEngine_fetchMedicalIDName__block_invoke;
  v3[3] = &unk_1E5F769B8;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "fetchMedicalIDDataWithCompletion:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __31__SOSEngine_fetchMedicalIDName__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *WeakRetained;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v3 = (void *)CUTWeakLinkClass();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (objc_msgSend(v9, "hasAnyData")
      && (objc_msgSend(v3, "sharedInstance"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "lostModeIsActive"),
          v5,
          (v6 & 1) == 0))
    {
      objc_msgSend(v9, "name");
      v8 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)WeakRetained[5];
      WeakRetained[5] = v8;
    }
    else
    {
      v7 = (void *)WeakRetained[5];
      WeakRetained[5] = 0;
    }

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  _BYTE v14[18];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.sos.trigger"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke;
    v11[3] = &unk_1E5F76A08;
    v11[4] = self;
    v12 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  else
  {
    sos_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v14 = v5;
      *(_WORD *)&v14[8] = 2112;
      *(_QWORD *)&v14[10] = CFSTR("com.apple.sos.trigger");
      _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] SOSEngine,New connection %@ missing entitlement: %@", buf, 0x16u);
    }

  }
  sos_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v14 = v7;
    *(_WORD *)&v14[4] = 2112;
    *(_QWORD *)&v14[6] = v5;
    _os_log_impl(&dword_1AF4DC000, v9, OS_LOG_TYPE_DEFAULT, "SOSEngine,shouldAcceptNewConnection: %d for connection: %@", buf, 0x12u);
  }

  return v7;
}

void __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id from;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "clientConnections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 40));

  objc_sync_exit(v2);
  SOSClientInterface();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setRemoteObjectInterface:", v4);

  SOSServerInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setExportedInterface:", v5);

  objc_msgSend(*(id *)(a1 + 40), "setExportedObject:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 40));
  objc_initWeak(&from, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke_2;
  v10[3] = &unk_1E5F76638;
  objc_copyWeak(&v11, &location);
  objc_msgSend(*(id *)(a1 + 40), "setInterruptionHandler:", v10);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke_338;
  v7[3] = &unk_1E5F769E0;
  objc_copyWeak(&v8, &from);
  objc_copyWeak(&v9, &location);
  objc_msgSend(*(id *)(a1 + 40), "setInvalidationHandler:", v7);
  objc_msgSend(*(id *)(a1 + 40), "resume");
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  id to;
  uint8_t buf[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS client connection interrupted", buf, 2u);
  }

  objc_copyWeak(&to, (id *)(a1 + 32));
  v3 = objc_loadWeakRetained(&to);
  objc_msgSend(v3, "invalidate");

  objc_destroyWeak(&to);
}

void __48__SOSEngine_listener_shouldAcceptNewConnection___block_invoke_338(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t v9[8];
  id to;
  uint8_t buf[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOSEngine,SOS client connection invalidated", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_copyWeak(&to, (id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(&to);

    if (v4)
    {
      objc_msgSend(WeakRetained, "clientConnections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_sync_enter(v5);
      objc_msgSend(WeakRetained, "clientConnections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_loadWeakRetained(&to);
      objc_msgSend(v6, "removeObject:", v7);

      objc_sync_exit(v5);
      objc_msgSend(WeakRetained, "updateCurrentSOSInteractiveState:", 0);
    }
  }
  sos_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, "SOSEngine,completed invalidationHandler cleanup", v9, 2u);
  }

  objc_destroyWeak(&to);
}

- (SOSFlowManagerCoexProtocol)sosFlowManager
{
  return (SOSFlowManagerCoexProtocol *)objc_loadWeakRetained((id *)&self->_sosFlowManager);
}

- (void)setSosFlowManager:(id)a3
{
  objc_storeWeak((id *)&self->_sosFlowManager, a3);
}

- (FKFriendsManager)friendsManager
{
  return self->_friendsManager;
}

- (void)setFriendsManager:(id)a3
{
  objc_storeStrong((id *)&self->_friendsManager, a3);
}

- (_MKLocationShifter)locationShifter
{
  return self->_locationShifter;
}

- (void)setLocationShifter:(id)a3
{
  objc_storeStrong((id *)&self->_locationShifter, a3);
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnections, a3);
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, a3);
}

- (CLLocation)lastLocationSent
{
  return self->_lastLocationSent;
}

- (SOSPersistentTimerLocationManager)sosPersistentTimerLocationManager
{
  return self->_sosPersistentTimerLocationManager;
}

- (int64_t)currentSOSFlowState
{
  return self->_currentSOSFlowState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationSent, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_friendsManager, 0);
  objc_destroyWeak((id *)&self->_sosFlowManager);
  objc_storeStrong((id *)&self->_sosCoordinator, 0);
  objc_storeStrong((id *)&self->_currentSOSButtonPressState, 0);
  objc_storeStrong((id *)&self->_sosStatusManager, 0);
  objc_storeStrong((id *)&self->_medicalIDName, 0);
  objc_storeStrong((id *)&self->_contactsManager, 0);
  objc_storeStrong((id *)&self->_timeLastMessageSent, 0);
  objc_storeStrong((id *)&self->_timeToStopSendingMessages, 0);
  objc_storeStrong((id *)&self->_sosPersistentTimerLocationManager, 0);
}

- (void)_tuCallCenterStatusChanged:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  id v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1AF4DC000, a2, OS_LOG_TYPE_ERROR, "SOSEngine, unexpected call event notification %s", v4, 0xCu);

}

void __45__SOSEngine_SOSSendingLocationUpdateChanged___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "Could not send client a location update change due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __45__SOSEngine_updateCurrentSOSInitiationState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "Could not send client a current initiation state due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__SOSEngine_updateCurrentSOSInteractiveState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "Could not send client a current interactive state due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __46__SOSEngine_updateCurrentSOSButtonPressState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "SOSEngine,could not send client a current button press state due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __38__SOSEngine_dismissSOSWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "Could not dismiss client due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __40__SOSEngine_didDismissSOSBeforeSOSCall___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "Could not dismiss client before SOS call due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __39__SOSEngine_broadcastUpdatedSOSStatus___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "Could not send client a status update due to connection error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__SOSEngine__sendMessageToRecipients_withLocation_isFirstMessage_medicalIDName_Reason___block_invoke_242_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AF4DC000, log, OS_LOG_TYPE_ERROR, "Failed to send SOS message over relay and this is not a baseband device.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

void __42__SOSEngine_retriggerSOSWithUUID_trigger___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1AF4DC000, v0, v1, "SOSEngine,failed to launch SOS with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)isTriggerEnabled:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1AF4DC000, a2, a3, "SOSEngine,isTriggerEnabled,unrecognized SOSTriggerMechanism %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

+ (void)mapTriggerToActivationReason:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_1AF4DC000, a2, a3, "SOSEngine,trying to get activation reason for unhandled SOSTriggerMechanism,%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
