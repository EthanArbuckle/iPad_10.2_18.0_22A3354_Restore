@implementation SOSManager

- (int64_t)currentSOSInitiationState
{
  return self->_sosInitiationState;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SOSManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, block);
  return (id)sharedInstance_sSOSManager;
}

+ (BOOL)deviceSupportsSOS
{
  char v2;
  void *v3;
  void *v4;

  v2 = MGGetBoolAnswer();
  +[SOSUtilities _userSOSDefaults](SOSUtilities, "_userSOSDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SOSDeviceSupportedKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v2 = objc_msgSend(v4, "BOOLValue");

  return v2;
}

+ (void)triggerSOS
{
  NSObject *v3;
  uint8_t v4[16];

  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1AF51CC2E, v4, 2u);
  }

  objc_msgSend(a1, "triggerSOSWithCompletion:", 0);
}

+ (void)triggerSOSWithCompletion:(id)a3
{
  objc_msgSend(a1, "triggerSOSWithUUID:completion:", 0, a3);
}

+ (void)triggerSOSWithUUID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "triggerSOSWithUUID:triggerMechanism:completion:", v7, +[SOSUtilities currentSOSTriggerMechanism](SOSUtilities, "currentSOSTriggerMechanism"), v6);

}

+ (void)triggerSOSWithUUID:(id)a3 triggerMechanism:(int64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  SEL v18;
  int64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  sos_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_1AF4DC000, v11, OS_LOG_TYPE_DEFAULT, "SOSManager, triggerSOSWithUUID uuid: %@", buf, 0xCu);
  }

  if (objc_msgSend(a1, "shouldTriggerSOS"))
  {
    v12 = MEMORY[0x1E0C809B0];
    if (v10)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke;
      v20[3] = &unk_1E5F76D48;
      v21 = v10;
      v13 = (void *)MEMORY[0x1B5DF84EC](v20);

    }
    else
    {
      v13 = &__block_literal_global_12;
    }
    block[0] = v12;
    block[1] = 3221225472;
    block[2] = __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_4;
    block[3] = &unk_1E5F76F48;
    v17 = v13;
    v18 = a2;
    v16 = v9;
    v19 = a4;
    v14 = v13;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[4];
  id v3;
  uint64_t v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_2;
  v2[3] = &unk_1E5F76148;
  v4 = a2;
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40) == 0);
}

void __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  +[SOSManager sharedInstance](SOSManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5;
  v7[3] = &unk_1E5F76F20;
  v6 = *(_OWORD *)(a1 + 40);
  v4 = (id)v6;
  v8 = v6;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerSOSWithUUID:triggerMechanism:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

void __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

+ (BOOL)shouldTriggerSOS
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (+[SOSEntitlement currentProcessHasEntitlement:](SOSEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.sos.trigger")))
  {
    if ((objc_msgSend(a1, "deviceSupportsSOS") & 1) != 0)
      return 1;
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SOSManager shouldTriggerSOS].cold.1(v4, v12, v13, v14, v15, v16, v17, v18);
  }
  else
  {
    sos_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[SOSManager shouldTriggerSOS].cold.2(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  return 0;
}

+ (void)notifySOSTriggerMechanismChanged
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SOSTriggerMechanismChangedNotification"), 0, 0, 1u);
}

- (SOSManager)init
{
  SOSManager *v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *initialStateSemaphore;
  const char *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  SOSManager *v11;
  uint64_t v12;
  NSMapTable *observerToQueue;
  SOSManager *v14;
  uint64_t v16;
  uint64_t v17;
  intptr_t (*v18)(uint64_t);
  void *v19;
  SOSManager *v20;
  _QWORD handler[4];
  id v22;
  id buf[2];
  objc_super v24;

  if (+[SOSEntitlement currentProcessHasEntitlement:](SOSEntitlement, "currentProcessHasEntitlement:", CFSTR("com.apple.sos.trigger")))
  {
    v24.receiver = self;
    v24.super_class = (Class)SOSManager;
    v3 = -[SOSManager init](&v24, sel_init);
    if (v3)
    {
      sos_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, "initializing SOSManager", (uint8_t *)buf, 2u);
      }

      v5 = dispatch_semaphore_create(0);
      initialStateSemaphore = v3->_initialStateSemaphore;
      v3->_initialStateSemaphore = (OS_dispatch_semaphore *)v5;

      objc_initWeak(buf, v3);
      v7 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
      v8 = MEMORY[0x1E0C80D38];
      v9 = MEMORY[0x1E0C80D38];
      v10 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __18__SOSManager_init__block_invoke;
      handler[3] = &unk_1E5F76CA8;
      objc_copyWeak(&v22, buf);
      notify_register_dispatch(v7, &v3->_connectionRequestNotificationToken, v8, handler);

      v16 = v10;
      v17 = 3221225472;
      v18 = __18__SOSManager_init__block_invoke_249;
      v19 = &unk_1E5F75E48;
      v11 = v3;
      v20 = v11;
      -[SOSManager _resetStateWithCompletion:](v11, "_resetStateWithCompletion:", &v16);
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable", v16, v17, v18, v19);
      v12 = objc_claimAutoreleasedReturnValue();
      observerToQueue = v11->_observerToQueue;
      v11->_observerToQueue = (NSMapTable *)v12;

      objc_destroyWeak(&v22);
      objc_destroyWeak(buf);
    }
    self = v3;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __18__SOSManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = SOSD_CONNECTION_REQUEST_NOTIFICATION_NAME;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by requesting current state", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetStateWithCompletion:", &__block_literal_global_247_0);

}

void __18__SOSManager_init__block_invoke_246()
{
  NSObject *v0;
  uint8_t v1[16];

  sos_default_log();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1AF4DC000, v0, OS_LOG_TYPE_DEFAULT, "Received current SOS state", v1, 2u);
  }

}

intptr_t __18__SOSManager_init__block_invoke_249(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "Received initial SOS state", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_connectionRequestNotificationToken);
  v3.receiver = self;
  v3.super_class = (Class)SOSManager;
  -[SOSManager dealloc](&v3, sel_dealloc);
}

void __28__SOSManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sSOSManager;
  sharedInstance_sSOSManager = (uint64_t)v1;

}

- (BOOL)longPressTriggersEmergencySOS
{
  return +[SOSUtilities longPressTriggersEmergencySOS](SOSUtilities, "longPressTriggersEmergencySOS");
}

- (void)setLongPressTriggersEmergencySOS:(BOOL)a3
{
  +[SOSUtilities setLongPressTriggersEmergencySOS:](SOSUtilities, "setLongPressTriggersEmergencySOS:", a3);
}

- (BOOL)isAutomaticCallCountdownEnabled
{
  return +[SOSUtilities isAutomaticCallCountdownEnabled](SOSUtilities, "isAutomaticCallCountdownEnabled");
}

- (void)setAutomaticCallCountdownEnabled:(BOOL)a3
{
  +[SOSUtilities setAutomaticCallCountdownEnabled:](SOSUtilities, "setAutomaticCallCountdownEnabled:", a3);
}

- (BOOL)isAllowedToMessageSOSContacts
{
  return +[SOSUtilities isAllowedToMessageSOSContacts](SOSUtilities, "isAllowedToMessageSOSContacts");
}

- (void)setAllowedToMessageSOSContacts:(BOOL)a3
{
  +[SOSUtilities setAllowedToMessageSOSContacts:](SOSUtilities, "setAllowedToMessageSOSContacts:", a3);
}

- (void)setConnection:(id)a3
{
  NSXPCConnection *v5;
  NSXPCConnection **p_connection;
  NSXPCConnection *connection;
  NSXPCConnection *v8;

  v8 = (NSXPCConnection *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  connection = self->_connection;
  p_connection = &self->_connection;
  v5 = connection;
  if (connection != v8)
  {
    if (v5)
    {
      -[NSXPCConnection invalidate](v5, "invalidate");
      -[NSXPCConnection setInvalidationHandler:](*p_connection, "setInvalidationHandler:", 0);
      -[NSXPCConnection setInterruptionHandler:](*p_connection, "setInterruptionHandler:", 0);
    }
    objc_storeStrong((id *)p_connection, a3);
  }

}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.sos"), 4096);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    SOSServerInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_connection;
    SOSClientInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8, "setExportedInterface:", v9);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v10 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __24__SOSManager_connection__block_invoke;
    v14[3] = &unk_1E5F76638;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v14);
    v12[0] = v10;
    v12[1] = 3221225472;
    v12[2] = __24__SOSManager_connection__block_invoke_255;
    v12[3] = &unk_1E5F76638;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_connection, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __24__SOSManager_connection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOS server connection interrupted", v3, 2u);
  }

  objc_msgSend(WeakRetained, "updateClientCurrentSOSInteractiveState:", 0);
}

void __24__SOSManager_connection__block_invoke_255(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  uint8_t buf[16];

  sos_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v2, OS_LOG_TYPE_DEFAULT, "SOS server connection invalidated", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__SOSManager_connection__block_invoke_256;
  block[3] = &unk_1E5F76638;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v4);
}

void __24__SOSManager_connection__block_invoke_256(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setConnection:", 0);

}

- (void)willStartSendingLocationUpdate
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1AF51CC2E, buf, 2u);
  }

  -[SOSManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__SOSManager_willStartSendingLocationUpdate__block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a2;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willStartSendingLocationUpdate");

}

void __44__SOSManager_willStartSendingLocationUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();

}

- (void)startSendingLocationUpdateWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v5 = a3;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1AF51CC2E, buf, 2u);
  }

  -[SOSManager connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __55__SOSManager_startSendingLocationUpdateWithCompletion___block_invoke;
  v13 = &unk_1E5F76F20;
  v14 = v5;
  v15 = a2;
  v8 = v5;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startSendingLocationUpdateWithCompletion:", v8, v10, v11, v12, v13);

}

void __55__SOSManager_startSendingLocationUpdateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

- (void)startSendingLocationUpdateForReason:(int64_t)a3 withCompletion:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  SEL v17;
  uint8_t buf[16];

  v7 = a4;
  sos_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v8, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1AF51CC2E, buf, 2u);
  }

  -[SOSManager connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __65__SOSManager_startSendingLocationUpdateForReason_withCompletion___block_invoke;
  v15 = &unk_1E5F76F20;
  v16 = v7;
  v17 = a2;
  v10 = v7;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", &v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startSendingLocationUpdateForReason:WithCompletion:", a3, v10, v12, v13, v14, v15);

}

void __65__SOSManager_startSendingLocationUpdateForReason_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, 0, 0);

}

- (void)stopSendingLocationUpdate
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v4, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1AF51CC2E, buf, 2u);
  }

  -[SOSManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__SOSManager_stopSendingLocationUpdate__block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a2;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopSendingLocationUpdate");

}

void __39__SOSManager_stopSendingLocationUpdate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();

}

- (void)mostRecentLocationSentWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v5 = a3;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1AF51CC2E, buf, 2u);
  }

  -[SOSManager connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __51__SOSManager_mostRecentLocationSentWithCompletion___block_invoke;
  v13 = &unk_1E5F76F20;
  v14 = v5;
  v15 = a2;
  v8 = v5;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mostRecentLocationSentWithCompletion:", v8, v10, v11, v12, v13);

}

void __51__SOSManager_mostRecentLocationSentWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

- (BOOL)isSendingLocationUpdate
{
  NSObject *v3;
  uint8_t v5[16];

  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_1AF51CC2E, v5, 2u);
  }

  -[SOSManager _waitForInitialState](self, "_waitForInitialState");
  return self->_sendingLocationUpdate;
}

- (void)setCurrentSOSInitiationState:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  self->_sosInitiationState = a3;
  -[SOSManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__SOSManager_setCurrentSOSInitiationState___block_invoke;
  v7[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v7[4] = a2;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateCurrentSOSInitiationState:", a3);

}

void __43__SOSManager_setCurrentSOSInitiationState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();

}

- (void)setCurrentSOSInteractiveState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  self->_sosInteractiveState = a3;
  -[SOSManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SOSManager_setCurrentSOSInteractiveState___block_invoke;
  v8[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v8[4] = a2;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateCurrentSOSInteractiveState:", a3);

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDidTriggerSOSToday:", 1);

  }
}

void __44__SOSManager_setCurrentSOSInteractiveState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();

}

- (int64_t)currentSOSInteractiveState
{
  return self->_sosInteractiveState;
}

- (void)setCurrentSOSButtonPressState:(id)a3
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  objc_storeStrong((id *)&self->_sosButtonPressState, a3);
  v6 = a3;
  -[SOSManager connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__SOSManager_setCurrentSOSButtonPressState___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a2;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateCurrentSOSButtonPressState:", v6);

}

void __44__SOSManager_setCurrentSOSButtonPressState___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();

}

- (SOSButtonPressState)currentSOSButtonPressState
{
  return self->_sosButtonPressState;
}

- (void)addObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SOSManager_addObserver_queue___block_invoke;
  block[3] = &unk_1E5F76FB0;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __32__SOSManager_addObserver_queue___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observerToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD block[5];
  id v7;

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SOSManager_removeObserver___block_invoke;
  block[3] = &unk_1E5F76A08;
  block[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __29__SOSManager_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observerToQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)dismissSOSWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  SEL v15;
  uint8_t buf[16];

  v5 = a3;
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOSManager attempting to dismiss SOS", buf, 2u);
  }

  -[SOSManager connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __39__SOSManager_dismissSOSWithCompletion___block_invoke;
  v13 = &unk_1E5F76F20;
  v14 = v5;
  v15 = a2;
  v8 = v5;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissSOSWithCompletion:", v8, v10, v11, v12, v13);

}

void __39__SOSManager_dismissSOSWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

- (void)didDismissSOSBeforeSOSCall:(int64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1AF4DC000, v6, OS_LOG_TYPE_DEFAULT, "SOS was dismissed before SOS call ended with sosDismissalType: %ld", buf, 0xCu);
  }

  -[SOSManager connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__SOSManager_didDismissSOSBeforeSOSCall___block_invoke;
  v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v9[4] = a2;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didDismissSOSBeforeSOSCall:", a3);

}

void __41__SOSManager_didDismissSOSBeforeSOSCall___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1();

}

- (void)setSendingLocationUpdate:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (self->_sendingLocationUpdate != a3)
  {
    v3 = a3;
    self->_sendingLocationUpdate = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("SOSSendingLocationUpdateValueKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SOSSendingLocationUpdateChangedNotification"), self, v7);

  }
}

- (void)updateClientCurrentSOSInitiationState:(int64_t)a3
{
  NSObject *v5;
  int64_t sosInitiationState;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id obj;
  _QWORD block[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  int64_t v22;
  __int16 v23;
  int64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sosInitiationState = self->_sosInitiationState;
    *(_DWORD *)buf = 134218240;
    v22 = sosInitiationState;
    v23 = 2048;
    v24 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSManager updating initiation state from %lu to %lu", buf, 0x16u);
  }

  if (self->_sosInitiationState != a3)
  {
    self->_sosInitiationState = a3;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[SOSManager observerToQueue](self, "observerToQueue");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          -[SOSManager observerToQueue](self, "observerToQueue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", v11);
          v13 = objc_claimAutoreleasedReturnValue();

          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __52__SOSManager_updateClientCurrentSOSInitiationState___block_invoke;
          block[3] = &unk_1E5F76C80;
          block[4] = v11;
          block[5] = a3;
          dispatch_async(v13, block);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
}

uint64_t __52__SOSManager_updateClientCurrentSOSInitiationState___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didUpdateCurrentSOSInitiationState:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)updateClientCurrentSOSInteractiveState:(int64_t)a3
{
  NSObject *v5;
  int64_t sosInteractiveState;
  void *v7;
  int v8;
  int64_t v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sosInteractiveState = self->_sosInteractiveState;
    v8 = 134218240;
    v9 = sosInteractiveState;
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSManager updating interactive state from %lu to %lu", (uint8_t *)&v8, 0x16u);
  }

  if (self->_sosInteractiveState != a3)
  {
    self->_sosInteractiveState = a3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("SOSInteractiveStateChangedNotification"), self, 0);

  }
}

- (void)updateClientCurrentSOSButtonPressState:(id)a3
{
  SOSButtonPressState *v4;
  NSObject *v5;
  SOSButtonPressState *sosButtonPressState;
  SOSButtonPressState *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (SOSButtonPressState *)a3;
  sos_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AF4DC000, v5, OS_LOG_TYPE_DEFAULT, "SOSManager updating button press state", v9, 2u);
  }

  sosButtonPressState = self->_sosButtonPressState;
  self->_sosButtonPressState = v4;
  v7 = v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("SOSButtonPressStateChangedNotification"), self, 0);
}

- (void)dismissClientSOSWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__SOSManager_dismissClientSOSWithCompletion___block_invoke;
  v6[3] = &unk_1E5F761B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __45__SOSManager_dismissClientSOSWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("SOSDismissSOSNotification"), *(_QWORD *)(a1 + 32), 0);

  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "currentSOSInitiationState") == 0);
}

- (void)didDismissClientSOSBeforeSOSCall:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id obj;
  _QWORD block[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SOSManager observerToQueue](self, "observerToQueue");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[SOSManager observerToQueue](self, "observerToQueue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v9);
        v11 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __47__SOSManager_didDismissClientSOSBeforeSOSCall___block_invoke;
        block[3] = &unk_1E5F76C80;
        block[4] = v9;
        block[5] = a3;
        dispatch_async(v11, block);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

uint64_t __47__SOSManager_didDismissClientSOSBeforeSOSCall___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "didDismissSOSBeforeSOSCall:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)didUpdateSOSStatus:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  sos_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF4DC000, v3, OS_LOG_TYPE_DEFAULT, "SOSManager,callback from SOSEngine that sos status did update", v4, 2u);
  }

}

- (void)_waitForInitialState
{
  NSObject *initialStateSemaphore;
  dispatch_time_t v4;

  initialStateSemaphore = self->_initialStateSemaphore;
  v4 = dispatch_time(0, 1000000000);
  dispatch_semaphore_wait(initialStateSemaphore, v4);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_initialStateSemaphore);
}

- (void)_resetStateWithCompletion:(id)a3
{
  void (**v5)(_QWORD);
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD v12[4];
  id v13;
  SEL v14;
  uint64_t state64;

  v5 = (void (**)(_QWORD))a3;
  state64 = 0;
  notify_get_state(self->_connectionRequestNotificationToken, &state64);
  if (state64)
  {
    -[SOSManager connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__SOSManager__resetStateWithCompletion___block_invoke;
    v12[3] = &unk_1E5F76F20;
    v14 = a2;
    v8 = v5;
    v13 = v8;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __40__SOSManager__resetStateWithCompletion___block_invoke_266;
    v10[3] = &unk_1E5F76FD8;
    v10[4] = self;
    v11 = v8;
    objc_msgSend(v9, "syncState:", v10);

  }
  else
  {
    v5[2](v5);
  }

}

void __40__SOSManager__resetStateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  sos_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __40__SOSManager__resetStateWithCompletion___block_invoke_266(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v9;
  id v10;
  uint64_t result;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  objc_msgSend(v9, "setSendingLocationUpdate:", a2);
  objc_msgSend(*(id *)(a1 + 32), "updateClientCurrentSOSInitiationState:", a3);
  objc_msgSend(*(id *)(a1 + 32), "updateClientCurrentSOSInteractiveState:", a4);
  objc_msgSend(*(id *)(a1 + 32), "updateClientCurrentSOSButtonPressState:", v10);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int)connectionRequestNotificationToken
{
  return self->_connectionRequestNotificationToken;
}

- (void)setConnectionRequestNotificationToken:(int)a3
{
  self->_connectionRequestNotificationToken = a3;
}

- (NSMapTable)observerToQueue
{
  return self->_observerToQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_initialStateSemaphore, 0);
  objc_storeStrong((id *)&self->_sosButtonPressState, 0);
}

void __61__SOSManager_triggerSOSWithUUID_triggerMechanism_completion___block_invoke_5_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_2();
  v1 = (const char *)OUTLINED_FUNCTION_5_0(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1AF4DC000, v3, v4, "%@ failed due to connection error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_3();
}

+ (void)shouldTriggerSOS
{
  OUTLINED_FUNCTION_6(&dword_1AF4DC000, a1, a3, "Current process doesn't have SOS entitlement", a5, a6, a7, a8, 0);
}

void __44__SOSManager_willStartSendingLocationUpdate__block_invoke_cold_1()
{
  uint64_t v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_3_2();
  v1 = (const char *)OUTLINED_FUNCTION_4_1(v0);
  NSStringFromSelector(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_1_1(&dword_1AF4DC000, v3, v4, "%@ failed due to connection error %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_3();
}

@end
