@implementation UIOServer

+ (UIOServer)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__UIOServer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_1214 != -1)
    dispatch_once(&_MergedGlobals_1214, block);
  return (UIOServer *)(id)qword_1ECD80290;
}

void __27__UIOServer_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)qword_1ECD80290;
  qword_1ECD80290 = (uint64_t)v0;

}

+ (id)_identifierForSceneType:(int64_t)a3 spaceIdentifier:(id)a4
{
  const __CFString *v4;

  v4 = CFSTR("Unknown");
  if (a3 == 1)
    v4 = CFSTR("Overlay");
  if (a3 == 2)
    v4 = CFSTR("Subterranean");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v4, a4);
}

+ (id)displayDelegateIdentifierForScene:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "systemShellHostingEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemShellHostingSpaceIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    UIOLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2050;
      v15 = v4;
      _os_log_impl(&dword_185066000, v7, OS_LOG_TYPE_DEFAULT, "Could not find a systemShellHostingSpaceIdentifier for scene: <%{public}@: %{public}p>", (uint8_t *)&v12, 0x16u);

    }
    v6 = CFSTR("Unspecified");
  }
  objc_msgSend(a1, "_identifierForSceneType:spaceIdentifier:", objc_msgSend((id)objc_opt_class(), "_UIO_sceneType"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIOServer)init
{
  UIOServer *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serviceQueue;
  NSMutableSet *v6;
  NSMutableSet *connections;
  uint64_t v8;
  NSMapTable *displayDelegateTable;
  NSMutableDictionary *v10;
  NSMutableDictionary *awaitingDisplayDelegateRequests;
  NSObject *v12;
  void *v13;
  UIOServer *v14;
  uint64_t v15;
  BSServiceConnectionListener *connectionListener;
  void *v18;
  _QWORD v19[4];
  UIOServer *v20;
  uint8_t buf[16];
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)UIOServer;
  v3 = -[UIOServer init](&v22, sel_init);
  if (v3)
  {
    if ((_UIApplicationProcessIsOverlayUI() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("UIOServer.m"), 87, CFSTR("Fatal error: a UIOServer instance was initialized outside of OverlayUI"));

    }
    v4 = dispatch_queue_create("com.apple.UIKit.OverlayUI.service_queue", 0);
    serviceQueue = v3->_serviceQueue;
    v3->_serviceQueue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connections = v3->_connections;
    v3->_connections = v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    displayDelegateTable = v3->_displayDelegateTable;
    v3->_displayDelegateTable = (NSMapTable *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    awaitingDisplayDelegateRequests = v3->_awaitingDisplayDelegateRequests;
    v3->_awaitingDisplayDelegateRequests = v10;

    UIOLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_185066000, v12, OS_LOG_TYPE_DEBUG, "Starting uioverlayd service connection listener…", buf, 2u);
    }

    v13 = (void *)MEMORY[0x1E0D23030];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __17__UIOServer_init__block_invoke;
    v19[3] = &unk_1E16E0820;
    v14 = v3;
    v20 = v14;
    objc_msgSend(v13, "listenerWithConfigurator:", v19);
    v15 = objc_claimAutoreleasedReturnValue();
    connectionListener = v14->_connectionListener;
    v14->_connectionListener = (BSServiceConnectionListener *)v15;

  }
  return v3;
}

void __17__UIOServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", 0x1E1750BA0);
  +[_UIOverlayServiceInterfaceSpecification identifier](_UIOverlayServiceInterfaceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *serviceQueue;
  id v8;
  _QWORD block[4];
  id v10;
  UIOServer *v11;

  v6 = a4;
  serviceQueue = self->_serviceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke;
  block[3] = &unk_1E16B1B50;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_sync(serviceQueue, block);
  objc_msgSend(v8, "activate");

}

void __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  +[_UIOServiceConnection connectionWithBSServiceConnection:toServer:](_UIOServiceConnection, "connectionWithBSServiceConnection:toServer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E16E0870;
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v7 = v2;
  v8 = v3;
  v5 = v2;
  objc_msgSend(v4, "configureConnection:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", v5);

}

void __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(v3, "setTargetQueue:", MEMORY[0x1E0C80D38]);
  +[_UIOverlayServiceInterfaceSpecification serviceQuality](_UIOverlayServiceInterfaceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[_UIOverlayServiceInterfaceSpecification interface](_UIOverlayServiceInterfaceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v8[3] = &unk_1E16E0848;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  objc_msgSend(v3, "setInvalidationHandler:", v8);

}

void __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  _QWORD block[4];
  id v9;

  v2 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_4;
  block[3] = &unk_1E16B1B28;
  v9 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v4 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(NSObject **)(v3 + 16);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_5;
  v6[3] = &unk_1E16B1B50;
  v6[4] = v3;
  v7 = v4;
  dispatch_async(v5, v6);

}

uint64_t __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "serviceConnectionDidInvalidate");
}

uint64_t __55__UIOServer_listener_didReceiveConnection_withContext___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)activate
{
  if (!self->_activated)
  {
    self->_activated = 1;
    -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
  }
}

- (void)invalidate
{
  if (self->_activated)
  {
    -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
    self->_activated = 0;
  }
}

- (void)registerDisplayDelegate:(id)a3 forIdentifier:(id)a4
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v9 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIOServer.m"), 151, CFSTR("Call must be made on main thread"));

  }
  -[NSMapTable setObject:forKey:](self->_displayDelegateTable, "setObject:forKey:", v9, v7);
  -[UIOServer _fulfillAwaitingDisplayDelegate:forIdentifier:](self, "_fulfillAwaitingDisplayDelegate:forIdentifier:", v9, v7);

}

- (void)unregisterDisplayDelegateForIdentifier:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIOServer.m"), 158, CFSTR("Call must be made on main thread"));

  }
  -[NSMapTable removeObjectForKey:](self->_displayDelegateTable, "removeObjectForKey:", v6);

}

- (id)displayDelegateForIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIOServer.m"), 164, CFSTR("Call must be made on main thread"));

  }
  -[NSMapTable objectForKey:](self->_displayDelegateTable, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)displayDelegateForAction:(id)a3
{
  return -[UIOServer displayDelegateForAction:sceneType:](self, "displayDelegateForAction:sceneType:", a3, 1);
}

- (id)displayDelegateForAction:(id)a3 sceneType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "originContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "spaceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "_identifierForSceneType:spaceIdentifier:", a4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIOServer displayDelegateForIdentifier:](self, "displayDelegateForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)awaitDisplayDelegateForAction:(id)a3 sceneType:(int64_t)a4 timeout:(double)a5 completion:(id)a6
{
  id v11;
  void (**v12)(id, void *);
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void (**)(id, void *))a6;
  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIOServer.m"), 182, CFSTR("Call must be made on main thread"));

  }
  -[UIOServer displayDelegateForAction:sceneType:](self, "displayDelegateForAction:sceneType:", v11, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    UIOLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_185066000, v14, OS_LOG_TYPE_DEBUG, "awaitDisplayDelegateForAction: returning existing display delegate", (uint8_t *)location, 2u);
    }

    v12[2](v12, v13);
  }
  else
  {
    v15 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v11, "originContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "spaceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "_identifierForSceneType:spaceIdentifier:", a4, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIOLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v18;
      _os_log_debug_impl(&dword_185066000, v19, OS_LOG_TYPE_DEBUG, "awaitDisplayDelegateForAction: waiting for display delegate to become available for identifier %{public}@", (uint8_t *)location, 0xCu);
    }

    -[NSMutableDictionary objectForKey:](self->_awaitingDisplayDelegateRequests, "objectForKey:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = _Block_copy(v15);
      objc_msgSend(v20, "addObject:", v21);

    }
    else
    {
      v22 = (void *)MEMORY[0x1E0C99DE8];
      v23 = _Block_copy(v15);
      objc_msgSend(v22, "arrayWithObject:", v23);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKey:](self->_awaitingDisplayDelegateRequests, "setObject:forKey:", v20, v18);
    }
    objc_initWeak(location, self);
    v24 = (void *)MEMORY[0x1E0C99E88];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __72__UIOServer_awaitDisplayDelegateForAction_sceneType_timeout_completion___block_invoke;
    v29[3] = &unk_1E16E0898;
    objc_copyWeak(&v32, location);
    v25 = v18;
    v30 = v25;
    v26 = v15;
    v31 = v26;
    v27 = (id)objc_msgSend(v24, "scheduledTimerWithTimeInterval:repeats:block:", 0, v29, a5);

    objc_destroyWeak(&v32);
    objc_destroyWeak(location);

  }
}

void __72__UIOServer_awaitDisplayDelegateForAction_sceneType_timeout_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  __int16 v9[8];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[6], "objectForKey:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _Block_copy(*(const void **)(a1 + 40));
    v6 = objc_msgSend(v4, "containsObject:", v5);

    if (v6)
    {
      UIOLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v9[0] = 0;
        _os_log_debug_impl(&dword_185066000, v7, OS_LOG_TYPE_DEBUG, "awaitDisplayDelegateForAction: timed out waiting for display delegate", (uint8_t *)v9, 2u);
      }

      v8 = _Block_copy(*(const void **)(a1 + 40));
      objc_msgSend(v4, "removeObject:", v8);

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
}

- (void)_fulfillAwaitingDisplayDelegate:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  UIOLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v7;
    _os_log_debug_impl(&dword_185066000, v8, OS_LOG_TYPE_DEBUG, "Fulfilling awaiting display delegates for identifier %{public}@", buf, 0xCu);
  }

  -[NSMutableDictionary objectForKey:](self->_awaitingDisplayDelegateRequests, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }
  objc_msgSend(v9, "removeAllObjects");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awaitingDisplayDelegateRequests, 0);
  objc_storeStrong((id *)&self->_displayDelegateTable, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
}

@end
