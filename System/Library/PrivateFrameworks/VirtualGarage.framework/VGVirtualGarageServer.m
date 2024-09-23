@implementation VGVirtualGarageServer

void __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FD5E0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setRemoteObjectInterface:", v4);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545FBEE0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExportedInterface:", v5);

    objc_msgSend(WeakRetained, "garage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExportedObject:", v6);

    objc_msgSend(*(id *)(a1 + 32), "setInterruptionHandler:", &__block_literal_global_42_0);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_43;
    v7[3] = &unk_24C2FBAB8;
    objc_copyWeak(&v8, v2);
    objc_copyWeak(&v9, &location);
    objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", v7);
    objc_msgSend(WeakRetained[8], "addObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "resume");
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

- (VGVirtualGarage)garage
{
  VGVirtualGarage *garage;
  VGVirtualGarage *v4;
  VGVirtualGarage *v5;

  garage = self->_garage;
  if (!garage)
  {
    v4 = -[VGVirtualGarage initWithGaragePersister:]([VGVirtualGarage alloc], "initWithGaragePersister:", self->_persister);
    v5 = self->_garage;
    self->_garage = v4;

    -[VGVirtualGarage setDelegate:](self->_garage, "setDelegate:", self);
    garage = self->_garage;
  }
  return garage;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  char IsEnabled_EVRouting;
  int IsEnabled_Alberta;
  NSObject *isolationQueue;
  BOOL v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  _BYTE location[12];
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.maps.virtualgarage.vehicles"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
  {
    VGGetVirtualGarageLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      VGProcessNameForPID(objc_msgSend(v5, "processIdentifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v13;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_20A329000, v12, OS_LOG_TYPE_FAULT, "Unauthorized access from: %@ to VG XPC service from connection: %@", location, 0x16u);

    }
    goto LABEL_8;
  }
  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  IsEnabled_Alberta = MapsFeature_IsEnabled_Alberta();
  if ((IsEnabled_EVRouting & 1) == 0 && !IsEnabled_Alberta)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_initWeak((id *)location, self);
  isolationQueue = self->_isolationQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke;
  v15[3] = &unk_24C2FB3C8;
  objc_copyWeak(&v17, (id *)location);
  v16 = v5;
  dispatch_async(isolationQueue, v15);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)location);
  v11 = 1;
LABEL_9:

  return v11;
}

- (VGVirtualGarageServer)init
{
  VGVirtualGarageServer *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *isolationQueue;
  uint64_t v8;
  NSMutableArray *activeConnections;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VGVirtualGarageServer;
  v2 = -[VGVirtualGarageServer init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.maps.virtualgarage.server.%@.%p"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    activeConnections = v2->_activeConnections;
    v2->_activeConnections = (NSMutableArray *)v8;

    -[VGVirtualGarageServer _setupVirtualGarageHostingIfNeeded](v2, "_setupVirtualGarageHostingIfNeeded");
  }
  return v2;
}

- (NSXPCListener)listener
{
  NSXPCListener *listener;
  NSXPCListener *v4;
  NSXPCListener *v5;

  listener = self->_listener;
  if (!listener)
  {
    v4 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.maps.virtualgarage.server"));
    v5 = self->_listener;
    self->_listener = v4;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    listener = self->_listener;
  }
  return listener;
}

+ (id)sharedServer
{
  if (_MergedGlobals_5 != -1)
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_8);
  return (id)qword_253DA4258;
}

void __37__VGVirtualGarageServer_sharedServer__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_253DA4258;
  qword_253DA4258 = v0;

}

- (void)dealloc
{
  objc_super v3;

  GEOConfigRemoveDelegateListenerForAllKeys();
  v3.receiver = self;
  v3.super_class = (Class)VGVirtualGarageServer;
  -[VGVirtualGarageServer dealloc](&v3, sel_dealloc);
}

+ (BOOL)canUseVirtualGarageXPCService
{
  return 1;
}

- (void)startWithPersister:(id)a3
{
  id v5;
  NSObject *isolationQueue;
  _QWORD v7[4];
  id v8;
  id location;

  v5 = a3;
  objc_storeStrong((id *)&self->_persister, a3);
  if (+[VGVirtualGarageServer canUseVirtualGarageXPCService](VGVirtualGarageServer, "canUseVirtualGarageXPCService"))
  {
    objc_initWeak(&location, self);
    isolationQueue = self->_isolationQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__VGVirtualGarageServer_startWithPersister___block_invoke;
    v7[3] = &unk_24C2FB268;
    objc_copyWeak(&v8, &location);
    dispatch_async(isolationQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __44__VGVirtualGarageServer_startWithPersister___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  char *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VGGetVirtualGarageLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(WeakRetained, "listener");
      v4 = (char *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "Started listening for connections: %@", (uint8_t *)&v5, 0xCu);

    }
    objc_msgSend(WeakRetained, "listener");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject resume](v3, "resume");
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v5 = 136315394;
    v6 = "-[VGVirtualGarageServer startWithPersister:]_block_invoke";
    v7 = 1024;
    v8 = 102;
    _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
  }

}

- (void)stop
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__VGVirtualGarageServer_stop__block_invoke;
  v4[3] = &unk_24C2FB268;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __29__VGVirtualGarageServer_stop__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  VGGetVirtualGarageLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_INFO, "Stopped virtualGarageServer", (uint8_t *)&v5, 2u);
    }

    objc_msgSend(WeakRetained, "_cleanUp");
    objc_msgSend(WeakRetained, "listener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    objc_msgSend(WeakRetained, "setListener:", 0);
  }
  else
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[VGVirtualGarageServer stop]_block_invoke";
      v7 = 1024;
      v8 = 113;
      _os_log_impl(&dword_20A329000, v3, OS_LOG_TYPE_ERROR, "strongSelf went away in %s line %d", (uint8_t *)&v5, 0x12u);
    }

  }
}

- (void)_cleanUp
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VGVirtualGarage *garage;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_activeConnections;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate", (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_activeConnections, "removeAllObjects");
  garage = self->_garage;
  self->_garage = 0;

}

- (void)setHostsVirtualGarage:(BOOL)a3
{
  if (self->_hostsVirtualGarage != a3)
  {
    self->_hostsVirtualGarage = a3;
    if (!a3)
      -[VGVirtualGarageServer _cleanUp](self, "_cleanUp");
  }
}

- (void)_setupVirtualGarageHostingIfNeeded
{
  NSObject *isolationQueue;
  _QWORD v4[4];
  id v5;
  id location;

  _GEOConfigAddDelegateListenerForKey();
  _GEOConfigAddDelegateListenerForKey();
  objc_initWeak(&location, self);
  isolationQueue = self->_isolationQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__VGVirtualGarageServer__setupVirtualGarageHostingIfNeeded__block_invoke;
  v4[3] = &unk_24C2FB268;
  objc_copyWeak(&v5, &location);
  dispatch_async(isolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __59__VGVirtualGarageServer__setupVirtualGarageHostingIfNeeded__block_invoke(uint64_t a1)
{
  int IsEnabled_EVRouting;
  uint64_t v3;
  id WeakRetained;

  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
  v3 = IsEnabled_EVRouting | MapsFeature_IsEnabled_Alberta();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHostsVirtualGarage:", v3);

}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  BOOL v4;
  BOOL v5;
  int IsEnabled_EVRouting;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3.var0 == *MEMORY[0x24BE3CB50] && a3.var1 == *(void **)(MEMORY[0x24BE3CB50] + 8);
  if (v4 || (a3.var0 == *MEMORY[0x24BE3CB48] ? (v5 = a3.var1 == *(void **)(MEMORY[0x24BE3CB48] + 8)) : (v5 = 0), v5))
  {
    IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting();
    v7 = IsEnabled_EVRouting | MapsFeature_IsEnabled_Alberta();
    VGGetVirtualGarageLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = CFSTR("NO");
      if ((_DWORD)v7)
        v9 = CFSTR("YES");
      v10 = v9;
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_INFO, "VGServer: GEOConfigs changed. VirtualGarageIsEnabled: %@", (uint8_t *)&v11, 0xCu);

    }
    -[VGVirtualGarageServer setHostsVirtualGarage:](self, "setHostsVirtualGarage:", v7);
  }
}

void __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  VGGetVirtualGarageLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20A329000, v0, OS_LOG_TYPE_ERROR, "Service connection interrupted", v1, 2u);
  }

}

void __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_43(uint64_t a1)
{
  NSObject *v2;
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  VGGetVirtualGarageLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20A329000, v2, OS_LOG_TYPE_INFO, "Service connection invalidated", buf, 2u);
  }

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_44;
    v7[3] = &unk_24C2FBAB8;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    objc_copyWeak(&v9, (id *)(a1 + 40));
    dispatch_async(v5, v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v8);
  }
  else
  {
    VGGetVirtualGarageLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[VGVirtualGarageServer listener:shouldAcceptNewConnection:]_block_invoke";
      v12 = 1024;
      v13 = 203;
      _os_log_impl(&dword_20A329000, v6, OS_LOG_TYPE_ERROR, "strongSelf2 went away in %s line %d", buf, 0x12u);
    }

  }
}

void __60__VGVirtualGarageServer_listener_shouldAcceptNewConnection___block_invoke_44(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      v4 = v3;
      objc_msgSend(WeakRetained, "activeConnections");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", v4);

      objc_msgSend(WeakRetained, "activeConnections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (!v7)
        objc_msgSend(WeakRetained, "_cleanUp");
    }
    else
    {
      VGGetVirtualGarageLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315394;
        v10 = "-[VGVirtualGarageServer listener:shouldAcceptNewConnection:]_block_invoke";
        v11 = 1024;
        v12 = 206;
        _os_log_impl(&dword_20A329000, v8, OS_LOG_TYPE_ERROR, "strongConnection went away in %s line %d", (uint8_t *)&v9, 0x12u);
      }

      v4 = 0;
    }
  }
  else
  {
    VGGetVirtualGarageLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[VGVirtualGarageServer listener:shouldAcceptNewConnection:]_block_invoke";
      v11 = 1024;
      v12 = 205;
      _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "strongSelf3 went away in %s line %d", (uint8_t *)&v9, 0x12u);
    }
  }

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id *v8;
  id v9;
  id *v10;
  NSObject *isolationQueue;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[VGVirtualGarageServer virtualGarageDidUpdate:]";
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  -[VGVirtualGarageServer observer](self, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[VGVirtualGarageServer observerQueue](self, "observerQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke;
    block[3] = &unk_24C2FB3C8;
    v8 = &v18;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v4;
    v9 = v4;
    dispatch_async(v7, block);

    v10 = &v17;
  }
  else
  {
    isolationQueue = self->_isolationQueue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke_2;
    v13[3] = &unk_24C2FB3C8;
    v8 = &v15;
    objc_copyWeak(&v15, (id *)buf);
    v10 = &v14;
    v14 = v4;
    v12 = v4;
    dispatch_async(isolationQueue, v13);
  }

  objc_destroyWeak(v8);
  objc_destroyWeak((id *)buf);
}

void __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageDidUpdate:", *(_QWORD *)(a1 + 32));

}

void __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = WeakRetained[8];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      v8 = MEMORY[0x24BDAC760];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v12[0] = v8;
          v12[1] = 3221225472;
          v12[2] = __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke_3;
          v12[3] = &unk_24C2FBAE0;
          v13 = *(id *)(a1 + 32);
          objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "virtualGarageDidUpdate:", *(_QWORD *)(a1 + 32));

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
}

void __48__VGVirtualGarageServer_virtualGarageDidUpdate___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VGGetVirtualGarageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[VGVirtualGarageServer virtualGarageDidUpdate:]_block_invoke_3";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "%s %@ %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  __CFString *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id *v27;
  id v28;
  id v29;
  id *v30;
  id *v31;
  NSObject *isolationQueue;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD block[4];
  id v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  const char *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  __CFString *v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v37 = a4;
  VGGetVirtualGarageLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v37;
    v7 = v6;
    if (v6)
    {
      if (objc_msgSend(v6, "count"))
      {
        v35 = v7;
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v9 = v7;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v48 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              if (v13)
              {
                v14 = (void *)MEMORY[0x24BDD17C8];
                v15 = v13;
                objc_msgSend(v14, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v15);
                v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v16 = CFSTR("<nil>");
              }
              objc_msgSend(v8, "addObject:", v16);

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v47, buf, 16);
          }
          while (v10);
        }

        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x24BDD17C8];
        v19 = v9;
        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ [%@]"), v20, v17);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v7 = v35;
      }
      else
      {
        v22 = (void *)MEMORY[0x24BDD17C8];
        v23 = v7;
        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@<%p>"), objc_opt_class(), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "stringWithFormat:", CFSTR("%@ (empty)"), v24);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v21 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 136315650;
    v52 = "-[VGVirtualGarageServer virtualGarage:didUpdateUnpairedVehicles:]";
    v53 = 2112;
    v54 = v36;
    v55 = 2112;
    v56 = v21;
    _os_log_impl(&dword_20A329000, v5, OS_LOG_TYPE_INFO, "%s %@, %@", buf, 0x20u);

  }
  objc_initWeak((id *)buf, self);
  -[VGVirtualGarageServer observer](self, "observer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[VGVirtualGarageServer observerQueue](self, "observerQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke;
    block[3] = &unk_24C2FB378;
    v27 = &v46;
    objc_copyWeak(&v46, (id *)buf);
    v44 = v36;
    v45 = v37;
    v28 = v37;
    v29 = v36;
    dispatch_async(v26, block);

    v30 = &v44;
    v31 = &v45;
  }
  else
  {
    isolationQueue = self->_isolationQueue;
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke_2;
    v39[3] = &unk_24C2FB378;
    v27 = &v42;
    objc_copyWeak(&v42, (id *)buf);
    v30 = &v40;
    v31 = &v41;
    v40 = v36;
    v41 = v37;
    v33 = v37;
    v34 = v36;
    dispatch_async(isolationQueue, v39);
  }

  objc_destroyWeak(v27);
  objc_destroyWeak((id *)buf);
}

void __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "observer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarage:didUpdateUnpairedVehicles:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = WeakRetained[8];
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      v8 = MEMORY[0x24BDAC760];
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
          v12[0] = v8;
          v12[1] = 3221225472;
          v12[2] = __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke_3;
          v12[3] = &unk_24C2FBAE0;
          v13 = *(id *)(a1 + 32);
          objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "virtualGarage:didUpdateUnpairedVehicles:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

          ++v9;
        }
        while (v6 != v9);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
}

void __65__VGVirtualGarageServer_virtualGarage_didUpdateUnpairedVehicles___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VGGetVirtualGarageLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[VGVirtualGarageServer virtualGarage:didUpdateUnpairedVehicles:]_block_invoke_3";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_20A329000, v4, OS_LOG_TYPE_ERROR, "%s %@ %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)virtualGarageAddVehicle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGVirtualGarageServer garage](self, "garage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualGarageAddVehicle:", v4);

}

- (void)virtualGarageRemoveVehicle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGVirtualGarageServer garage](self, "garage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualGarageRemoveVehicle:", v4);

}

- (void)virtualGarageSaveVehicle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGVirtualGarageServer garage](self, "garage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualGarageSaveVehicle:", v4);

}

- (void)virtualGarageSelectVehicle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGVirtualGarageServer garage](self, "garage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualGarageSelectVehicle:", v4);

}

- (void)virtualGarageOnboardVehicle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VGVirtualGarageServer garage](self, "garage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualGarageOnboardVehicle:", v4);

}

- (void)virtualGarageSetShouldUsePreferredNetworks:(BOOL)a3 forVehicle:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[VGVirtualGarageServer garage](self, "garage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "virtualGarageSetShouldUsePreferredNetworks:forVehicle:", v4, v6);

}

- (void)virtualGarageStartContinuousUpdatesIfNeeded
{
  id v2;

  -[VGVirtualGarageServer garage](self, "garage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageStartContinuousUpdatesIfNeeded");

}

- (void)virtualGarageEndContinuousUpdates
{
  id v2;

  -[VGVirtualGarageServer garage](self, "garage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageEndContinuousUpdates");

}

- (void)virtualGarageSetAssumesFullCharge:(BOOL)a3
{
  -[VGVirtualGarage setShouldAssumeFullCharge:](self->_garage, "setShouldAssumeFullCharge:", a3);
}

- (void)virtualGarageForceFetchAllVehicles
{
  id v2;

  -[VGVirtualGarageServer garage](self, "garage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "virtualGarageForceFetchAllVehicles");

}

- (void)virtualGarageGetGarageWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VGVirtualGarageServer garage](self, "garage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__VGVirtualGarageServer_virtualGarageGetGarageWithReply___block_invoke;
  v7[3] = &unk_24C2FBB30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "virtualGarageGetGarageWithReply:", v7);

}

void __57__VGVirtualGarageServer_virtualGarageGetGarageWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "observerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__VGVirtualGarageServer_virtualGarageGetGarageWithReply___block_invoke_2;
  block[3] = &unk_24C2FBB08;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __57__VGVirtualGarageServer_virtualGarageGetGarageWithReply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)virtualGarageGetListOfUnpairedVehiclesWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VGVirtualGarageServer garage](self, "garage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__VGVirtualGarageServer_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke;
  v7[3] = &unk_24C2FBB58;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "virtualGarageGetListOfUnpairedVehiclesWithReply:", v7);

}

void __73__VGVirtualGarageServer_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "observerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__VGVirtualGarageServer_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke_2;
  block[3] = &unk_24C2FBB08;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __73__VGVirtualGarageServer_virtualGarageGetListOfUnpairedVehiclesWithReply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)virtualGarageGetLatestStateOfVehicleWithIdentifier:(id)a3 syncAcrossDevices:(BOOL)a4 withReply:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[VGVirtualGarageServer garage](self, "garage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __104__VGVirtualGarageServer_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke;
  v12[3] = &unk_24C2FBB80;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:", v9, v5, v12);

}

void __104__VGVirtualGarageServer_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "observerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__VGVirtualGarageServer_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_2;
  block[3] = &unk_24C2FBB08;
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __104__VGVirtualGarageServer_virtualGarageGetLatestStateOfVehicleWithIdentifier_syncAcrossDevices_withReply___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (VGVirtualGarageObserver)observer
{
  return (VGVirtualGarageObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observerQueue, a3);
}

- (BOOL)hostsVirtualGarage
{
  return self->_hostsVirtualGarage;
}

- (void)setGarage:(id)a3
{
  objc_storeStrong((id *)&self->_garage, a3);
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableArray)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
  objc_storeStrong((id *)&self->_activeConnections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_garage, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_persister, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
