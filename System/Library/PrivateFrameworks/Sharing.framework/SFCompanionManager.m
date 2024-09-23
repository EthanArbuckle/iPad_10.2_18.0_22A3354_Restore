@implementation SFCompanionManager

+ (id)serviceManager
{
  if (serviceManager_onceToken != -1)
    dispatch_once(&serviceManager_onceToken, &__block_literal_global_19);
  return (id)serviceManager_serviceManager;
}

void __36__SFCompanionManager_serviceManager__block_invoke()
{
  SFCompanionManager *v0;
  void *v1;

  v0 = objc_alloc_init(SFCompanionManager);
  v1 = (void *)serviceManager_serviceManager;
  serviceManager_serviceManager = (uint64_t)v0;

}

- (SFCompanionManager)init
{
  SFCompanionManager *v2;
  SFCompanionManager *v3;
  SFCompanionServiceManagerProtocol *managerProxy;
  NSMutableDictionary *v5;
  NSMutableDictionary *services;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  NSMutableDictionary *v10;
  NSMutableDictionary *streamHandlers;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFCompanionManager;
  v2 = -[SFCompanionManager init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    managerProxy = v2->_managerProxy;
    v2->_managerProxy = 0;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    services = v3->_services;
    v3->_services = v5;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    streamHandlers = v3->_streamHandlers;
    v3->_streamHandlers = v10;

    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerObserver:", v3);

    -[SFCompanionManager retrieveManagerProxy](v3, "retrieveManagerProxy");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  -[SFCompanionManager signalSemaphore](self, "signalSemaphore");
  v4.receiver = self;
  v4.super_class = (Class)SFCompanionManager;
  -[SFCompanionManager dealloc](&v4, sel_dealloc);
}

- (id)serviceForIdentifier:(id)a3
{
  id v4;
  void *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD block[5];

  v4 = a3;
  -[SFCompanionManager serviceIdentifierQueue](self, "serviceIdentifierQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = dispatch_queue_create("com.apple.sharing.service-identifier-queue", 0);
    -[SFCompanionManager setServiceIdentifierQueue:](self, "setServiceIdentifierQueue:", v6);

  }
  -[SFCompanionManager serviceIdentifierQueue](self, "serviceIdentifierQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SFCompanionManager_serviceForIdentifier___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_sync(v7, block);

  -[SFCompanionManager services](self, "services");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "deviceID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    streams_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SFCompanionManager serviceForIdentifier:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
  return v9;
}

void __43__SFCompanionManager_serviceForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  dispatch_semaphore_t v4;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint8_t v13[16];
  uint8_t buf[16];

  +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isInvalid"))
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managerProxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      streams_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Waiting for manager proxy", buf, 2u);
      }

      v4 = dispatch_semaphore_create(0);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 72);
      *(_QWORD *)(v5 + 72) = v4;

      v7 = dispatch_time(0, 4000000000);
      dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 72), v7);
      v8 = *(id *)(a1 + 32);
      objc_sync_enter(v8);
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 72);
      *(_QWORD *)(v9 + 72) = 0;

      objc_sync_exit(v8);
      streams_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Finished Wait", v13, 2u);
      }

    }
  }
}

- (id)streamDataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SFCompanionManager serviceForIdentifier:](self, "serviceForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "messageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)retrieveManagerProxy
{
  NSObject *v2;
  void *v4;
  NSString *identifier;
  uint8_t v6[8];
  _QWORD v7[5];

  if (self->_managerProxy)
  {
    streams_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_DEFAULT, "Trying to retrieve manager proxy when one already exists", v6, 2u);
    }

  }
  else
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    identifier = self->_identifier;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__SFCompanionManager_retrieveManagerProxy__block_invoke;
    v7[3] = &unk_1E482FF10;
    v7[4] = self;
    objc_msgSend(v4, "serviceManagerProxyForIdentifier:client:withCompletionHandler:", identifier, self, v7);

  }
}

void __42__SFCompanionManager_retrieveManagerProxy__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v11 && v12 && v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "setManagerProxy:", v11);
    objc_msgSend(*(id *)(a1 + 32), "setDeviceName:", v12);
    objc_msgSend(*(id *)(a1 + 32), "setDeviceID:", v13);
    objc_msgSend(*(id *)(a1 + 32), "setDeviceIP:", v14);
    v16 = *(id *)(a1 + 32);
    objc_sync_enter(v16);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "allValues");
    v22 = v15;
    v23 = v11;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v17);
          v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v21, "setDeviceName:", v12, v22, v23, (_QWORD)v24);
          objc_msgSend(v21, "setDeviceID:", v13);
          objc_msgSend(v21, "setIpAddress:", v14);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enableService:", v21);
        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
      }
      while (v18);
    }

    v15 = v22;
    v11 = v23;

    objc_sync_exit(v16);
  }
  else
  {
    streams_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413314;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v32 = 2112;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      v36 = 2112;
      v37 = v15;
      _os_log_error_impl(&dword_1A2830000, v16, OS_LOG_TYPE_ERROR, "Error retrieving proxy object. Returned values (proxy = %@, deviceName = %@, deviceID = %@, deviceIP = %@, error = %@)", buf, 0x34u);
    }
  }

  objc_msgSend(*(id *)(a1 + 32), "signalSemaphore");
}

- (void)signalSemaphore
{
  SFCompanionManager *v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = self;
  objc_sync_enter(v2);
  if (v2->_managerSemaphore)
  {
    streams_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A2830000, v3, OS_LOG_TYPE_DEFAULT, "Signaling the semaphore", v4, 2u);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)v2->_managerSemaphore);
  }
  objc_sync_exit(v2);

}

- (void)streamToService:(id)a3 withFileHandle:(id)a4 acceptReply:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSMutableDictionary *streamHandlers;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  if (v9)
  {
    streamHandlers = self->_streamHandlers;
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](streamHandlers, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __65__SFCompanionManager_streamToService_withFileHandle_acceptReply___block_invoke;
      v29[3] = &unk_1E482FF38;
      v31 = &v32;
      v30 = v13;
      -[SFCompanionManager streamsFromFileHandle:withCompletionHandler:](self, "streamsFromFileHandle:withCompletionHandler:", v9, v29);
      v14 = v30;
    }
    else
    {
      streams_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SFCompanionManager streamToService:withFileHandle:acceptReply:].cold.2(v14, v22, v23, v24, v25, v26, v27, v28);
    }

  }
  else
  {
    streams_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SFCompanionManager streamToService:withFileHandle:acceptReply:].cold.1(v13, v15, v16, v17, v18, v19, v20, v21);
  }

  v10[2](v10, *((unsigned __int8 *)v33 + 24));
  _Block_object_dispose(&v32, 8);

}

uint64_t __65__SFCompanionManager_streamToService_withFileHandle_acceptReply___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a2)
  {
    if (a3)
    {
      v3 = result;
      result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

- (void)xpcManagerConnectionInterrupted
{
  SFCompanionServiceManagerProtocol *managerProxy;
  NSObject *v4;
  uint8_t v5[16];

  managerProxy = self->_managerProxy;
  self->_managerProxy = 0;

  streams_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A2830000, v4, OS_LOG_TYPE_DEFAULT, "XPC Manager connection interrupted", v5, 2u);
  }

  -[SFCompanionManager retrieveManagerProxy](self, "retrieveManagerProxy");
}

- (void)xpcManagerDidInvalidate:(id)a3
{
  SFCompanionServiceManagerProtocol *managerProxy;

  managerProxy = self->_managerProxy;
  self->_managerProxy = 0;

  -[SFCompanionManager signalSemaphore](self, "signalSemaphore");
}

- (void)getStreamsForData:(id)a3 withStreamHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0;
  v15[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, v15, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v9)
  {
    streams_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SFCompanionManager getStreamsForData:withStreamHandler:].cold.1((uint64_t)v9, v15, v10);

    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v9);
  }
  else
  {
    +[SFCompanionXPCManager sharedManager](SFCompanionXPCManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__SFCompanionManager_getStreamsForData_withStreamHandler___block_invoke;
    v12[3] = &unk_1E482FF88;
    v12[4] = self;
    v13 = v7;
    objc_msgSend(v11, "streamsForMessage:withCompletionHandler:", v8, v12);

  }
}

void __58__SFCompanionManager_getStreamsForData_withStreamHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__SFCompanionManager_getStreamsForData_withStreamHandler___block_invoke_2;
    v9[3] = &unk_1E482FF60;
    v8 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "streamsFromFileHandle:withCompletionHandler:", v5, v9);

  }
  else if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __58__SFCompanionManager_getStreamsForData_withStreamHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)supportStreamsWithIdentifier:(id)a3 withStreamHandler:(id)a4
{
  id v6;
  id v7;
  SFCompanionManager *v8;
  SFCompanionService *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *streamHandlers;
  void *v17;
  SFCompanionServiceManagerProtocol *managerProxy;
  NSObject *v19;
  uint8_t v20[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  v9 = -[SFCompanionService initWithServiceName:]([SFCompanionService alloc], "initWithServiceName:", v6);
  -[SFCompanionService setManagerID:](v9, "setManagerID:", v8->_identifier);
  -[SFCompanionManager deviceName](v8, "deviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService setDeviceName:](v9, "setDeviceName:", v10);

  -[SFCompanionManager deviceID](v8, "deviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService setDeviceID:](v9, "setDeviceID:", v11);

  -[SFCompanionManager deviceIP](v8, "deviceIP");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService setIpAddress:](v9, "setIpAddress:", v12);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v8->_services, "setObject:forKeyedSubscript:", v9, v6);
  if (v7)
  {
    streams_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2830000, v13, OS_LOG_TYPE_DEFAULT, "Storing stream handler", buf, 2u);
    }

    v14 = (void *)objc_msgSend(v7, "copy");
    v15 = _Block_copy(v14);
    streamHandlers = v8->_streamHandlers;
    -[SFCompanionService identifier](v9, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](streamHandlers, "setObject:forKeyedSubscript:", v15, v17);

  }
  managerProxy = v8->_managerProxy;
  if (managerProxy)
  {
    -[SFCompanionServiceManagerProtocol enableService:](managerProxy, "enableService:", v9);
  }
  else
  {
    streams_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1A2830000, v19, OS_LOG_TYPE_DEFAULT, "Service enabled before manager proxy retrieved", v20, 2u);
    }

  }
  objc_sync_exit(v8);

}

- (void)disableStreamSupportForIdentifier:(id)a3
{
  id v4;
  SFCompanionManager *v5;
  void *v6;
  void *v7;
  void *v8;
  SFCompanionServiceManagerProtocol *managerProxy;
  NSMutableDictionary *streamHandlers;
  NSObject *v11;
  uint8_t v12[16];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_services, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "identifier"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    managerProxy = v5->_managerProxy;
    if (managerProxy)
      -[SFCompanionServiceManagerProtocol disableService:](managerProxy, "disableService:", v7);
    -[NSMutableDictionary removeObjectForKey:](v5->_services, "removeObjectForKey:", v4);
    streamHandlers = v5->_streamHandlers;
    objc_msgSend(v7, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](streamHandlers, "removeObjectForKey:", v11);
  }
  else
  {
    streams_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A2830000, v11, OS_LOG_TYPE_DEFAULT, "Trying to disable service that has never been enabled", v12, 2u);
    }
  }

  objc_sync_exit(v5);
}

- (void)streamsFromFileHandle:(id)a3 withCompletionHandler:(id)a4
{
  void (**v5)(id, CFReadStreamRef, CFWriteStreamRef);
  id v6;
  CFSocketNativeHandle v7;
  const __CFString *v8;
  const void *v9;
  CFWriteStreamRef stream;
  CFReadStreamRef readStream;

  stream = 0;
  readStream = 0;
  v5 = (void (**)(id, CFReadStreamRef, CFWriteStreamRef))a4;
  v6 = a3;
  v7 = dup(objc_msgSend(v6, "fileDescriptor"));
  CFStreamCreatePairWithSocket(0, v7, &readStream, &stream);
  v8 = (const __CFString *)*MEMORY[0x1E0C9B2E8];
  v9 = (const void *)*MEMORY[0x1E0C9AE50];
  CFReadStreamSetProperty(readStream, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2E8], (CFTypeRef)*MEMORY[0x1E0C9AE50]);
  CFWriteStreamSetProperty(stream, v8, v9);
  objc_msgSend(v6, "closeFile");

  v5[2](v5, readStream, stream);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (SFCompanionServiceManagerProtocol)managerProxy
{
  return (SFCompanionServiceManagerProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManagerProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)deviceIP
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceIP:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSMutableDictionary)services
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setServices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)streamHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setStreamHandlers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)serviceIdentifierQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setServiceIdentifierQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (OS_dispatch_semaphore)managerSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setManagerSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managerSemaphore, 0);
  objc_storeStrong((id *)&self->_serviceIdentifierQueue, 0);
  objc_storeStrong((id *)&self->_streamHandlers, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIP, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_managerProxy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)serviceForIdentifier:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "Could not retrieve stream info from daemon", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)streamDataForIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "Caught exception getting endpoint data %@", (uint8_t *)&v2, 0xCu);
}

- (void)streamToService:(uint64_t)a3 withFileHandle:(uint64_t)a4 acceptReply:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "Received callback without streams", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)streamToService:(uint64_t)a3 withFileHandle:(uint64_t)a4 acceptReply:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A2830000, a1, a3, "No stored stream handler", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)getStreamsForData:(os_log_t)log withStreamHandler:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  _os_log_error_impl(&dword_1A2830000, log, OS_LOG_TYPE_ERROR, "Deserialization error = %@, format = %ld", (uint8_t *)&v4, 0x16u);
}

@end
