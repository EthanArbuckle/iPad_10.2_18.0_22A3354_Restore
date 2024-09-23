@implementation VGVirtualGarageService

- (void)virtualGarageGetListOfUnpairedVehiclesWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VGVirtualGarageService virtualGarageGetListOfUnpairedVehiclesWithReply:]";
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__VGVirtualGarageService_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke;
  v8[3] = &unk_24C2FB5A0;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __39__VGVirtualGarageService_sharedService__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_253DA4268;
  qword_253DA4268 = v0;

}

- (VGVirtualGarageService)init
{
  VGVirtualGarageService *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *callbackQueue;
  uint64_t v8;
  NSHashTable *clients;
  uint64_t v10;
  geo_isolater *clientsIsolater;
  uint64_t v12;
  GEOObserverHashTable *observers;
  id v14;
  const char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *connectionQueue;
  void *v19;
  OS_dispatch_queue *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)VGVirtualGarageService;
  v2 = -[VGVirtualGarageService init](&v23, sel_init);
  if (v2)
  {
    v3 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.maps.virtualgarage.callbacks.%@.%p"), objc_opt_class(), v2));
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 1);
    clients = v2->_clients;
    v2->_clients = (NSHashTable *)v8;

    v10 = geo_isolater_create_with_format();
    clientsIsolater = v2->_clientsIsolater;
    v2->_clientsIsolater = (geo_isolater *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BE3CFA0]), "initWithProtocol:queue:", &unk_2545FD5E0, v2->_callbackQueue, v2);
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v12;

    v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("com.apple.maps.virtualgarage.service.%@.%p"), objc_opt_class(), v2));
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v17;

    if (!+[VGVirtualGarageService canUseVirtualGarageXPCService](VGVirtualGarageService, "canUseVirtualGarageXPCService"))
    {
      +[VGVirtualGarageServer sharedServer](VGVirtualGarageServer, "sharedServer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObserver:", v2);

      v20 = v2->_connectionQueue;
      +[VGVirtualGarageServer sharedServer](VGVirtualGarageServer, "sharedServer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObserverQueue:", v20);

    }
  }
  return v2;
}

+ (id)sharedService
{
  if (_MergedGlobals_6 != -1)
    dispatch_once(&_MergedGlobals_6, &__block_literal_global_56);
  return (id)qword_253DA4268;
}

- (void)virtualGarageGetGarageWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VGVirtualGarageService virtualGarageGetGarageWithReply:]";
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__VGVirtualGarageService_virtualGarageGetGarageWithReply___block_invoke;
  v8[3] = &unk_24C2FB5A0;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)registerObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "Registering observer: %@", (uint8_t *)&v6, 0xCu);
  }

  -[GEOObserverHashTable registerObserver:](self->_observers, "registerObserver:", v4);
}

- (void)_openConnection
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id buf[2];

  VGGetVirtualGarageLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "VGVirtualGarageService opening connection", (uint8_t *)buf, 2u);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.maps.virtualgarage.server"), 0);
  connection = self->_connection;
  self->_connection = v4;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FBEE0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_virtualGarageGetListOfUnpairedVehiclesWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_virtualGarageGetListOfUnpairedVehiclesWithReply_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply_, 1, 1);

  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FD5E0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_virtualGarageDidUpdate_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_virtualGarage_didUpdateUnpairedVehicles_, 0, 0);

  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_virtualGarage_didUpdateUnpairedVehicles_, 1, 0);

  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v14);
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
  -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_connectionQueue);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_9);
  objc_initWeak(buf, self);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __41__VGVirtualGarageService__openConnection__block_invoke_55;
  v20[3] = &unk_24C2FB268;
  objc_copyWeak(&v21, buf);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v20);
  -[NSXPCConnection resume](self->_connection, "resume");
  objc_destroyWeak(&v21);
  objc_destroyWeak(buf);

}

- (void)openForClient:(id)a3
{
  id v4;
  char IsEnabled_EVRouting;
  char IsEnabled_Alberta;
  NSObject *v7;
  uint64_t v8;
  NSObject *connectionQueue;
  _QWORD block[4];
  id v11;
  id location[6];
  id v13;
  _BYTE *v14;
  _BYTE buf[24];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    VGGetAssertLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      *(_QWORD *)&buf[4] = "-[VGVirtualGarageService openForClient:]";
      *(_WORD *)&buf[12] = 2082;
      *(_QWORD *)&buf[14] = "client == nil";
      *(_WORD *)&buf[22] = 2082;
      v16 = "Can't call openForClient: with a nil client";
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", buf, 0x20u);
    }
    goto LABEL_7;
  }
  if (+[VGVirtualGarageService canUseVirtualGarageXPCService](VGVirtualGarageService, "canUseVirtualGarageXPCService"))
  {
    IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
    IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
    if ((IsEnabled_EVRouting & 1) == 0 && (IsEnabled_Alberta & 1) == 0)
    {
      VGGetVirtualGarageLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "Tried to openForClient:, but virtual garage isn't enabled", buf, 2u);
      }
LABEL_7:

      goto LABEL_14;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v16 = 0;
    v8 = MEMORY[0x24BDAC760];
    location[1] = (id)MEMORY[0x24BDAC760];
    location[2] = (id)3221225472;
    location[3] = __40__VGVirtualGarageService_openForClient___block_invoke;
    location[4] = &unk_24C2FBBA8;
    location[5] = self;
    v13 = v4;
    v14 = buf;
    geo_isolate_sync_data();
    if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 24))
    {
      objc_initWeak(location, self);
      connectionQueue = self->_connectionQueue;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __40__VGVirtualGarageService_openForClient___block_invoke_16;
      block[3] = &unk_24C2FB268;
      objc_copyWeak(&v11, location);
      dispatch_sync(connectionQueue, block);
      objc_destroyWeak(&v11);
      objc_destroyWeak(location);
    }

    _Block_object_dispose(buf, 8);
  }
LABEL_14:

}

void __58__VGVirtualGarageService_virtualGarageGetGarageWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__VGVirtualGarageService_virtualGarageGetGarageWithReply___block_invoke_2;
  v4[3] = &unk_24C2FBC18;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "virtualGarageGetGarageWithReply:", *(_QWORD *)(a1 + 32));

}

- (id)messageTargetWithErrorReply:(id)a3
{
  id v4;
  char IsEnabled_EVRouting;
  char IsEnabled_Alberta;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[8];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
  if ((IsEnabled_EVRouting & 1) != 0 || (IsEnabled_Alberta & 1) != 0)
  {
    if (+[VGVirtualGarageService canUseVirtualGarageXPCService](VGVirtualGarageService, "canUseVirtualGarageXPCService"))
    {
      -[VGVirtualGarageService connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __54__VGVirtualGarageService_messageTargetWithErrorReply___block_invoke;
      v15[3] = &unk_24C2FBC18;
      v16 = v4;
      objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[VGVirtualGarageServer sharedServer](VGVirtualGarageServer, "sharedServer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "VirtualGarage isn't enabled, service isn't able to call to server.", buf, 2u);
    }

    if (v4)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      GEOErrorDomain();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *MEMORY[0x24BDD0FC8];
      v19[0] = CFSTR("VirtualGarage isn't enabled, service isn't able to call to server.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, void *))v4 + 2))(v4, v11);
    }
    v12 = 0;
  }

  return v12;
}

+ (BOOL)canUseVirtualGarageXPCService
{
  return 1;
}

- (NSXPCConnection)connection
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (!connection)
  {
    -[VGVirtualGarageService _openConnection](self, "_openConnection");
    connection = self->_connection;
  }
  return connection;
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[VGVirtualGarageService virtualGarageDidUpdate:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v4, "selectedVehicle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VGVirtualGarageService _clearActiveVehicleIdentifierIfNeeded:](self, "_clearActiveVehicleIdentifierIfNeeded:", v7);

  -[GEOObserverHashTable virtualGarageDidUpdate:](self->_observers, "virtualGarageDidUpdate:", v4);
}

- (void)_clearActiveVehicleIdentifierIfNeeded:(id)a3
{
  id v4;
  VGVirtualGarageService *v5;
  unint64_t v6;
  char v7;
  unint64_t v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[VGVirtualGarageService activeVehicleIdentifier](v5, "activeVehicleIdentifier");
  v6 = (unint64_t)(id)objc_claimAutoreleasedReturnValue();
  v8 = (unint64_t)v4;
  if (v8 | v6)
  {
    v7 = objc_msgSend((id)v6, "isEqual:", v8);

    if ((v7 & 1) == 0)
      -[VGVirtualGarageService setActiveVehicleIdentifier:](v5, "setActiveVehicleIdentifier:", 0);
  }

  objc_sync_exit(v5);
}

- (NSString)activeVehicleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

void __40__VGVirtualGarageService_openForClient___block_invoke(_QWORD *a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1[4] + 8), "containsObject:", a1[5]);
  VGGetVirtualGarageLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v5 = a1[5];
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_FAULT, "Tried to open connection twice for client: %@.", (uint8_t *)&v7, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = a1[5];
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_INFO, "Will openForClient: %@", (uint8_t *)&v7, 0xCu);
    }

    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 8), "count");
    objc_msgSend(*(id *)(a1[4] + 8), "addObject:", a1[5]);
  }
}

void __40__VGVirtualGarageService_openForClient___block_invoke_16(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_openConnection");

}

- (void)closeForClient:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int IsEnabled_EVRouting;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  id v17;
  _BYTE v18[24];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    if (+[VGVirtualGarageService canUseVirtualGarageXPCService](VGVirtualGarageService, "canUseVirtualGarageXPCService"))
    {
      *(_QWORD *)v18 = 0;
      *(_QWORD *)&v18[8] = v18;
      *(_QWORD *)&v18[16] = 0x2020000000;
      v19 = 0;
      v12 = 0;
      v13 = &v12;
      v14 = 0x2020000000;
      v15 = 0;
      v10 = MEMORY[0x24BDAC760];
      v5 = v4;
      v11 = v5;
      geo_isolate_sync_data();
      v6 = v13[3];
      if (*(_QWORD *)(*(_QWORD *)&v18[8] + 24) == v6)
      {
        IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
        if (((IsEnabled_EVRouting | MapsFeature_IsEnabled_Alberta()) & 1) != 0)
        {
          VGGetVirtualGarageLog();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v17 = v5;
            _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "Tried to closeForClient: (%@) that wasn't in _clients and VG was enabled. Check if the feature flag changed during run time. If it hasn't, there is probably in issue in your open/close logic.", buf, 0xCu);
          }

        }
      }
      else if (!v6)
      {
        -[VGVirtualGarageService _closeConnection](self, "_closeConnection", v10, 3221225472, __41__VGVirtualGarageService_closeForClient___block_invoke, &unk_24C2FBBD0, v5, self, v18, &v12);
      }

      _Block_object_dispose(&v12, 8);
      _Block_object_dispose(v18, 8);
    }
  }
  else
  {
    VGGetAssertLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v18 = 136446722;
      *(_QWORD *)&v18[4] = "-[VGVirtualGarageService closeForClient:]";
      *(_WORD *)&v18[12] = 2082;
      *(_QWORD *)&v18[14] = "client == nil";
      *(_WORD *)&v18[22] = 2082;
      v19 = "Can't call closeForClient: with a nil client";
      _os_log_impl(&dword_20A329000, v9, OS_LOG_TYPE_ERROR, "%{public}s forbids: %{public}s. %{public}s", v18, 0x20u);
    }

  }
}

uint64_t __41__VGVirtualGarageService_closeForClient___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VGGetVirtualGarageLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = a1[4];
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_20A329000, v2, OS_LOG_TYPE_INFO, "Will closeForClient: %@", (uint8_t *)&v5, 0xCu);
  }

  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[5] + 8), "count");
  objc_msgSend(*(id *)(a1[5] + 8), "removeObject:", a1[4]);
  result = objc_msgSend(*(id *)(a1[5] + 8), "count");
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = result;
  return result;
}

void __41__VGVirtualGarageService__openConnection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  VGGetVirtualGarageLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20A329000, v0, OS_LOG_TYPE_ERROR, "Server connection interrupted", v1, 2u);
  }

}

void __41__VGVirtualGarageService__openConnection__block_invoke_55(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  VGGetVirtualGarageLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20A329000, v2, OS_LOG_TYPE_ERROR, "Server connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_closeConnection");

}

- (void)_closeConnection
{
  NSObject *connectionQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  connectionQueue = self->_connectionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__VGVirtualGarageService__closeConnection__block_invoke;
  v4[3] = &unk_24C2FB268;
  objc_copyWeak(&v5, &location);
  dispatch_async(connectionQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__VGVirtualGarageService__closeConnection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (!WeakRetained)
  {
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[VGVirtualGarageService _closeConnection]_block_invoke";
      v7 = 1024;
      v8 = 192;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
    }
    goto LABEL_8;
  }
  if (WeakRetained[7])
  {
    VGGetVirtualGarageLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "VGVirtualGarageService closing connection", (uint8_t *)&v5, 2u);
    }

    objc_msgSend(v2[7], "invalidate");
    v4 = v2[7];
    v2[7] = 0;
LABEL_8:

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "Unregistering observer: %@", (uint8_t *)&v6, 0xCu);
  }

  -[GEOObserverHashTable unregisterObserver:](self->_observers, "unregisterObserver:", v4);
}

void __54__VGVirtualGarageService_messageTargetWithErrorReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VGGetVirtualGarageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v6, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)virtualGarageAddVehicle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[VGVirtualGarageService virtualGarageAddVehicle:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__VGVirtualGarageService_virtualGarageAddVehicle___block_invoke;
  v8[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __50__VGVirtualGarageService_virtualGarageAddVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageAddVehicle:", *(_QWORD *)(a1 + 32));

}

- (void)virtualGarageRemoveVehicle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[VGVirtualGarageService virtualGarageRemoveVehicle:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__VGVirtualGarageService_virtualGarageRemoveVehicle___block_invoke;
  v8[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __53__VGVirtualGarageService_virtualGarageRemoveVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageRemoveVehicle:", *(_QWORD *)(a1 + 32));

}

uint64_t __58__VGVirtualGarageService_virtualGarageGetGarageWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)virtualGarageSelectVehicle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[VGVirtualGarageService virtualGarageSelectVehicle:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__VGVirtualGarageService_virtualGarageSelectVehicle___block_invoke;
  v8[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __53__VGVirtualGarageService_virtualGarageSelectVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageSelectVehicle:", *(_QWORD *)(a1 + 32));

}

- (void)virtualGarageOnboardVehicle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[VGVirtualGarageService virtualGarageOnboardVehicle:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__VGVirtualGarageService_virtualGarageOnboardVehicle___block_invoke;
  v8[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __54__VGVirtualGarageService_virtualGarageOnboardVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageOnboardVehicle:", *(_QWORD *)(a1 + 32));

}

- (void)virtualGarageSaveVehicle:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *connectionQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[VGVirtualGarageService virtualGarageSaveVehicle:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__VGVirtualGarageService_virtualGarageSaveVehicle___block_invoke;
  v8[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v10, (id *)buf);
  v9 = v4;
  v7 = v4;
  dispatch_async(connectionQueue, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __51__VGVirtualGarageService_virtualGarageSaveVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageSaveVehicle:", *(_QWORD *)(a1 + 32));

}

- (void)virtualGarageSetShouldUsePreferredNetworks:(BOOL)a3 forVehicle:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  __CFString *v8;
  __CFString *v9;
  NSObject *connectionQueue;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  BOOL v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  VGGetVirtualGarageLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    v9 = v8;
    *(_DWORD *)buf = 136315650;
    v17 = "-[VGVirtualGarageService virtualGarageSetShouldUsePreferredNetworks:forVehicle:]";
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_20A329000, v7, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__VGVirtualGarageService_virtualGarageSetShouldUsePreferredNetworks_forVehicle___block_invoke;
  block[3] = &unk_24C2FBC40;
  objc_copyWeak(&v14, (id *)buf);
  v15 = v4;
  v13 = v6;
  v11 = v6;
  dispatch_async(connectionQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __80__VGVirtualGarageService_virtualGarageSetShouldUsePreferredNetworks_forVehicle___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageSetShouldUsePreferredNetworks:forVehicle:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)virtualGarageStartContinuousUpdatesIfNeeded
{
  NSObject *v3;
  NSObject *connectionQueue;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  VGGetVirtualGarageLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[VGVirtualGarageService virtualGarageStartContinuousUpdatesIfNeeded]";
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__VGVirtualGarageService_virtualGarageStartContinuousUpdatesIfNeeded__block_invoke;
  block[3] = &unk_24C2FB268;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(connectionQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __69__VGVirtualGarageService_virtualGarageStartContinuousUpdatesIfNeeded__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "virtualGarageStartContinuousUpdatesIfNeeded");

}

- (void)virtualGarageEndContinuousUpdates
{
  NSObject *v3;
  NSObject *connectionQueue;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  VGGetVirtualGarageLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[VGVirtualGarageService virtualGarageEndContinuousUpdates]";
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__VGVirtualGarageService_virtualGarageEndContinuousUpdates__block_invoke;
  block[3] = &unk_24C2FB268;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(connectionQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __59__VGVirtualGarageService_virtualGarageEndContinuousUpdates__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "virtualGarageEndContinuousUpdates");

}

- (void)virtualGarageSetAssumesFullCharge:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];

  VGGetVirtualGarageLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "virtualGarageSetAssumesFullCharge: is only supported on macOS", v4, 2u);
  }

}

- (void)virtualGarageForceFetchAllVehicles
{
  NSObject *v3;
  NSObject *connectionQueue;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  VGGetVirtualGarageLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[VGVirtualGarageService virtualGarageForceFetchAllVehicles]";
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__VGVirtualGarageService_virtualGarageForceFetchAllVehicles__block_invoke;
  block[3] = &unk_24C2FB268;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(connectionQueue, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __60__VGVirtualGarageService_virtualGarageForceFetchAllVehicles__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "virtualGarageForceFetchAllVehicles");

}

void __74__VGVirtualGarageService_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__VGVirtualGarageService_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke_2;
  v4[3] = &unk_24C2FBC18;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "virtualGarageGetListOfUnpairedVehiclesWithReply:", *(_QWORD *)(a1 + 32));

}

uint64_t __74__VGVirtualGarageService_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)virtualGarageGetLatestStateOfVehicleWithIdentifier:(id)a3 syncAcrossDevices:(BOOL)a4 withReply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *connectionQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  VGGetVirtualGarageLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[VGVirtualGarageService virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:]";
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_20A329000, v10, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  connectionQueue = self->_connectionQueue;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __105__VGVirtualGarageService_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke;
  v14[3] = &unk_24C2FBC68;
  objc_copyWeak(&v17, (id *)buf);
  v15 = v8;
  v16 = v9;
  v18 = a4;
  v12 = v8;
  v13 = v9;
  dispatch_async(connectionQueue, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __105__VGVirtualGarageService_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __105__VGVirtualGarageService_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_2;
  v4[3] = &unk_24C2FBC18;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(WeakRetained, "messageTargetWithErrorReply:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

uint64_t __105__VGVirtualGarageService_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  __CFString *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  VGVirtualGarageService *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  VGGetVirtualGarageLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "count"))
      {
        v29 = v8;
        v30 = self;
        v31 = v6;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, buf, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v33;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v33 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
              if (v17)
              {
                v18 = (void *)MEMORY[0x24BDD17C8];
                v19 = v17;
                objc_msgSend(v18, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v19);
                v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v20 = CFSTR("<nil>");
              }
              objc_msgSend(v11, "addObject:", v20);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, buf, 16);
          }
          while (v14);
        }

        objc_msgSend(v12, "componentsJoinedByString:", CFSTR(", "));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (void *)MEMORY[0x24BDD17C8];
        v23 = v12;
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ [%@]"), v24, v21);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

        self = v30;
        v6 = v31;
        v8 = v29;
      }
      else
      {
        v26 = (void *)MEMORY[0x24BDD17C8];
        v27 = v10;
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@ (empty)"), v28);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v25 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 136315650;
    v37 = "-[VGVirtualGarageService virtualGarage:didUpdateUnpairedVehicles:]";
    v38 = 2112;
    v39 = v6;
    v40 = 2112;
    v41 = v25;
    _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "%s %@, %@", buf, 0x20u);

  }
  -[GEOObserverHashTable virtualGarage:didUpdateUnpairedVehicles:](self->_observers, "virtualGarage:didUpdateUnpairedVehicles:", v6, v7);

}

- (void)setActiveVehicleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeVehicleIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_clientsIsolater, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
