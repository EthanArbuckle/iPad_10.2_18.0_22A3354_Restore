@implementation WGWidgetPersistentStateController

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1990];
  v6 = a4;
  objc_msgSend(v5, "interfaceWithProtocol:", &unk_254F1D0B0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v7);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F2DFD0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v8);

  objc_msgSend(v6, "setInterruptionHandler:", &__block_literal_global_7);
  objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_40);
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "resume");

  return 1;
}

void __83__WGWidgetPersistentStateController___setHasContent_forWidgetWithBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSXPCConnectionHasEntitlement() & 1) != 0)
  {

  }
  else
  {
    v3 = NCXPCConnectionIsFromContainingAppOrWidgetWithIdentifier(*(void **)(a1 + 32), *(void **)(a1 + 40));

    if ((v3 & 1) == 0)
      goto LABEL_7;
  }
  v4 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_2172E1000, v4, OS_LOG_TYPE_DEFAULT, "Will set hasContent: %d for %{public}@", buf, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 48), "_setHasContent:forWidgetWithIdentifier:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
LABEL_7:
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__WGWidgetPersistentStateController___setHasContent_forWidgetWithBundleIdentifier___block_invoke_42;
  v9[3] = &unk_24D7322D8;
  v7 = *(void **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "__didReceiveHasContentRequest");

}

- (BOOL)_setHasContent:(BOOL)a3 forWidgetWithIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  BOOL v10;

  v4 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "length")
    || -[WGWidgetPersistentStateController doesWidgetWithIdentifierHaveContent:](self, "doesWidgetWithIdentifierHaveContent:", v6) == v4)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetPersistentStateController _setValue:forKey:forWidgetWithIdentifier:containingBundleID:](self, "_setValue:forKey:forWidgetWithIdentifier:containingBundleID:", v7, CFSTR("SBWidgetViewControllerHasContentKey"), v6, v8);

    WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryController);
    objc_msgSend(WeakRetained, "setHasContent:forWidgetWithIdentifier:", v4, v6);

    v10 = 1;
  }

  return v10;
}

- (BOOL)doesWidgetWithIdentifierHaveContent:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[WGWidgetPersistentStateController _valueForKey:forWidgetWithIdentifier:](self, "_valueForKey:forWidgetWithIdentifier:", CFSTR("SBWidgetViewControllerHasContentKey"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (id)_valueForKey:(id)a3 forWidgetWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length") || !objc_msgSend(v7, "length"))
  {
    v8 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetPersistentStateController _valueForKey:forWidgetWithIdentifier:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  if (objc_msgSend(v6, "length") && objc_msgSend(v7, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_widgetIdentifiersToCachedState, "objectForKey:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGWidgetPersistentStateController _updateCachedStateForWidgetWithIdentifier:containingBundleID:](self, "_updateCachedStateForWidgetWithIdentifier:containingBundleID:", v7, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v16, "objectForKey:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)__setHasContent:(BOOL)a3 forWidgetWithBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  WGWidgetPersistentStateController *v13;
  BOOL v14;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __83__WGWidgetPersistentStateController___setHasContent_forWidgetWithBundleIdentifier___block_invoke;
  v10[3] = &unk_24D732300;
  v11 = v7;
  v12 = v6;
  v14 = a3;
  v13 = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

- (WGWidgetPersistentStateController)initWithDiscoveryController:(id)a3
{
  id v4;
  WGWidgetPersistentStateController *v5;
  WGWidgetPersistentStateController *v6;
  id v7;
  uint64_t v8;
  NSXPCListener *listener;
  uint64_t Serial;
  OS_dispatch_queue *keybagQueue;
  uint64_t v12;
  OS_dispatch_queue *diskWriteQueue;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WGWidgetPersistentStateController;
  v5 = -[WGWidgetPersistentStateController init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_discoveryController, v4);
    v7 = objc_alloc(MEMORY[0x24BDD1998]);
    v8 = objc_msgSend(v7, "initWithMachServiceName:", *MEMORY[0x24BDE27D8]);
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v8;

    -[NSXPCListener setDelegate:](v6->_listener, "setDelegate:", v6);
    -[NSXPCListener resume](v6->_listener, "resume");
    if (MKBDeviceUnlockedSinceBoot())
    {
      v6->_canCacheState = 1;
    }
    else
    {
      Serial = BSDispatchQueueCreateSerial();
      keybagQueue = v6->_keybagQueue;
      v6->_keybagQueue = (OS_dispatch_queue *)Serial;

      objc_initWeak(&location, v6);
      objc_copyWeak(&v15, &location);
      v6->_keybagEvent = (_MKBEvent *)MKBEventsRegister();
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    v12 = BSDispatchQueueCreateSerial();
    diskWriteQueue = v6->_diskWriteQueue;
    v6->_diskWriteQueue = (OS_dispatch_queue *)v12;

  }
  return v6;
}

void __65__WGWidgetPersistentStateController_initWithDiscoveryController___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  _QWORD block[4];
  id v5[5];

  if (!a2)
  {
    v5[3] = v2;
    v5[4] = v3;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__WGWidgetPersistentStateController_initWithDiscoveryController___block_invoke_2;
    block[3] = &unk_24D7316E8;
    objc_copyWeak(v5, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(v5);
  }
}

void __65__WGWidgetPersistentStateController_initWithDiscoveryController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (*((_QWORD *)WeakRetained + 5))
  {
    MKBEventsUnregister();
    WeakRetained = v3;
    v3[5] = 0;
  }
  *((_BYTE *)WeakRetained + 32) = 1;
  v2 = objc_loadWeakRetained((id *)WeakRetained + 2);
  objc_msgSend(v2, "invalidateVisibleIdentifiers");

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  if (self->_keybagEvent)
    MKBEventsUnregister();
  v3.receiver = self;
  v3.super_class = (Class)WGWidgetPersistentStateController;
  -[WGWidgetPersistentStateController dealloc](&v3, sel_dealloc);
}

- (id)_persistentStateForWidgetWithIdentifier:(id)a3 containingBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *diskWriteQueue;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (objc_msgSend(v6, "length"))
  {
    v9 = (void *)MEMORY[0x24BDBCED8];
    WGPersistedStateURLForWidgetWithBundleIdentifier(v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithContentsOfURL:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v11;
    if (!v11)
    {
      v12 = v6;
      v13 = v7;
      if (objc_msgSend(v12, "length"))
      {
        WGContainingBundleCachePathForWidgetWithContainingBundleIdentifier((uint64_t)v13, CFSTR("State"), 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingPathComponent:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "stringByAppendingPathExtension:", CFSTR("plist"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "length"))
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithContentsOfURL:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v8 = (id)v18;
        objc_msgSend(v17, "URLByDeletingLastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        diskWriteQueue = self->_diskWriteQueue;
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __104__WGWidgetPersistentStateController__persistentStateForWidgetWithIdentifier_containingBundleIdentifier___block_invoke;
        v25[3] = &unk_24D731670;
        v26 = v20;
        v27 = v19;
        v22 = v19;
        v23 = v20;
        dispatch_async(diskWriteQueue, v25);

      }
      else
      {
        v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      }

    }
  }

  return v8;
}

uint64_t __104__WGWidgetPersistentStateController__persistentStateForWidgetWithIdentifier_containingBundleIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
}

- (id)_updateCachedStateForWidgetWithIdentifier:(id)a3 containingBundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *widgetIdentifiersToCachedState;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(v6, "length"))
  {
    v8 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetPersistentStateController _updateCachedStateForWidgetWithIdentifier:containingBundleID:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  if (objc_msgSend(v6, "length"))
  {
    if (!self->_widgetIdentifiersToCachedState && self->_canCacheState)
    {
      v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      widgetIdentifiersToCachedState = self->_widgetIdentifiersToCachedState;
      self->_widgetIdentifiersToCachedState = v16;

    }
    -[WGWidgetPersistentStateController _persistentStateForWidgetWithIdentifier:containingBundleIdentifier:](self, "_persistentStateForWidgetWithIdentifier:containingBundleIdentifier:", v6, v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      -[NSMutableDictionary setObject:forKey:](self->_widgetIdentifiersToCachedState, "setObject:forKey:", v18, v6);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_synchronizePersistentStateForWidgetWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *diskWriteQueue;
  _QWORD v16[4];
  id v17;
  id v18;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    v5 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
      -[WGWidgetPersistentStateController _updateCachedStateForWidgetWithIdentifier:containingBundleID:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableDictionary objectForKey:](self->_widgetIdentifiersToCachedState, "objectForKey:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      diskWriteQueue = self->_diskWriteQueue;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __88__WGWidgetPersistentStateController__synchronizePersistentStateForWidgetWithIdentifier___block_invoke;
      v16[3] = &unk_24D731670;
      v17 = v13;
      v18 = v4;
      dispatch_async(diskWriteQueue, v16);

    }
  }

}

void __88__WGWidgetPersistentStateController__synchronizePersistentStateForWidgetWithIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  WGPersistedStateURLForWidgetWithBundleIdentifier(*(void **)(a1 + 40), 1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "writeToURL:atomically:", v2, 1);

}

- (void)_setValue:(id)a3 forKey:(id)a4 forWidgetWithIdentifier:(id)a5 containingBundleID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 || !objc_msgSend(v11, "length") || !objc_msgSend(v12, "length"))
  {
    v14 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_ERROR))
    {
      -[WGWidgetPersistentStateController _setValue:forKey:forWidgetWithIdentifier:containingBundleID:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);
      if (!v10)
        goto LABEL_11;
    }
    else if (!v10)
    {
      goto LABEL_11;
    }
  }
  if (objc_msgSend(v11, "length"))
  {
    if (objc_msgSend(v12, "length"))
    {
      -[NSMutableDictionary objectForKey:](self->_widgetIdentifiersToCachedState, "objectForKey:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22
        || (-[WGWidgetPersistentStateController _updateCachedStateForWidgetWithIdentifier:containingBundleID:](self, "_updateCachedStateForWidgetWithIdentifier:containingBundleID:", v12, v13), (v22 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v22, "setObject:forKey:", v10, v11);
        -[WGWidgetPersistentStateController _synchronizePersistentStateForWidgetWithIdentifier:](self, "_synchronizePersistentStateForWidgetWithIdentifier:", v12);

      }
    }
  }
LABEL_11:

}

- (int64_t)largestAvailableDisplayModeForWidgetWithIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[WGWidgetPersistentStateController _valueForKey:forWidgetWithIdentifier:](self, "_valueForKey:forWidgetWithIdentifier:", CFSTR("WGWidgetViewControllerLargestAvailableDisplayMode"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)setLargestAvailableDisplayMode:(int64_t)a3 forWidgetWithIdentifier:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (objc_msgSend(v6, "length")
    && -[WGWidgetPersistentStateController largestAvailableDisplayModeForWidgetWithIdentifier:](self, "largestAvailableDisplayModeForWidgetWithIdentifier:", v6) != a3)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WGContainingBundleIdentifierForWidgetWithBundleIdentifier(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WGWidgetPersistentStateController _setValue:forKey:forWidgetWithIdentifier:containingBundleID:](self, "_setValue:forKey:forWidgetWithIdentifier:containingBundleID:", v8, CFSTR("WGWidgetViewControllerLargestAvailableDisplayMode"), v6, v9);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
    __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_39()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
    __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_39_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __83__WGWidgetPersistentStateController___setHasContent_forWidgetWithBundleIdentifier___block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_2172E1000, v4, OS_LOG_TYPE_DEFAULT, "Encountered error attempting to reply to content availability request for widget with bundle ID \"%{public}@\": %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }

}

- (void)__requestRefreshAfterDate:(id)a3 forWidgetWithBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  id WeakRetained;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.")))
  {
    objc_msgSend(v8, "_xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSXPCConnectionHasEntitlement())
    {

    }
    else
    {
      v10 = NCXPCConnectionIsFromContainingAppOrWidgetWithIdentifier(v8, v7);

      if (!v10)
        goto LABEL_11;
    }
    v11 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543618;
      v16 = v7;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_2172E1000, v11, OS_LOG_TYPE_DEFAULT, "Will request refresh for %{public}@ after %{public}@", (uint8_t *)&v15, 0x16u);
    }
    if (v6)
    {
      v12 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_discoveryController);
    objc_msgSend(WeakRetained, "requestRefreshForWidget:afterDate:", v7, v13);

  }
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskWriteQueue, 0);
  objc_storeStrong((id *)&self->_keybagQueue, 0);
  objc_storeStrong((id *)&self->_widgetIdentifiersToCachedState, 0);
  objc_destroyWeak((id *)&self->_discoveryController);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_updateCachedStateForWidgetWithIdentifier:(uint64_t)a3 containingBundleID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2172E1000, a1, a3, "Invalid parameter not satisfying: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setValue:(uint64_t)a3 forKey:(uint64_t)a4 forWidgetWithIdentifier:(uint64_t)a5 containingBundleID:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2172E1000, a1, a3, "Invalid parameter not satisfying: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_valueForKey:(uint64_t)a3 forWidgetWithIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_2172E1000, a1, a3, "Invalid parameter not satisfying: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_2172E1000, a1, a3, "WGWidgetController (host-side) connection interrupted", a5, a6, a7, a8, 0);
}

void __72__WGWidgetPersistentStateController_listener_shouldAcceptNewConnection___block_invoke_39_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_2172E1000, a1, a3, "WGWidgetController (host-side) connection invalidated", a5, a6, a7, a8, 0);
}

@end
