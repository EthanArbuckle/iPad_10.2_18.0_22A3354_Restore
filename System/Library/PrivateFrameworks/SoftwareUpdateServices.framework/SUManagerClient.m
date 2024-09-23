@implementation SUManagerClient

- (SUManagerClient)init
{
  return -[SUManagerClient initWithDelegate:](self, "initWithDelegate:", 0);
}

- (SUManagerClient)initWithDelegate:(id)a3
{
  return -[SUManagerClient initWithDelegate:clientType:](self, "initWithDelegate:clientType:", a3, 0);
}

- (SUManagerClient)initWithDelegate:(id)a3 andQueue:(id)a4
{
  return -[SUManagerClient initWithDelegate:queue:clientType:](self, "initWithDelegate:queue:clientType:", a3, a4, 0);
}

- (SUManagerClient)initWithDelegate:(id)a3 clientType:(int)a4
{
  return -[SUManagerClient initWithDelegate:queue:clientType:](self, "initWithDelegate:queue:clientType:", a3, 0, *(_QWORD *)&a4);
}

- (SUManagerClient)initWithDelegate:(id)a3 queue:(id)a4 clientType:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  SUManagerClient *v10;
  SUManagerClient *v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *installOperationIDsToOperationHandler;
  NSMutableSet *v15;
  NSMutableSet *installationConstraintObservers;
  void *v17;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v20;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SUManagerClient;
  v10 = -[SUManagerClient init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    -[SUManagerClient setDelegate:](v10, "setDelegate:", v8);
    if (v9)
      v12 = v9;
    else
      v12 = (id)MEMORY[0x24BDAC9B8];
    -[SUManagerClient setQueue:](v11, "setQueue:", v12);
    -[SUManagerClient setClientType:](v11, "setClientType:", v5);
    -[SUManagerClient connectToServerIfNecessary](v11, "connectToServerIfNecessary");
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    installOperationIDsToOperationHandler = v11->_installOperationIDsToOperationHandler;
    v11->_installOperationIDsToOperationHandler = v13;

    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    installationConstraintObservers = v11->_installationConstraintObservers;
    v11->_installationConstraintObservers = v15;

    +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:", v11);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)__softwareUpdateDaemonStarted, CFSTR("SUDaemonStartedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
  }

  return v11;
}

- (void)invalidate
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SUDaemonStartedNotification"), 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[SUManagerClient _invalidateConnection](self, "_invalidateConnection");
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SUDaemonStartedNotification"), 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[SUManagerClient _invalidateConnection](self, "_invalidateConnection");
  v5.receiver = self;
  v5.super_class = (Class)SUManagerClient;
  -[SUManagerClient dealloc](&v5, sel_dealloc);
}

- (void)_setClientType
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t clientType;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _QWORD v19[5];

  SUStringFromClientType(self->_clientType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("Client <%p>: setType: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)self);

  v10 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__SUManagerClient__setClientType__block_invoke;
  v19[3] = &unk_24CE3CA78;
  v19[4] = self;
  v11 = (void *)MEMORY[0x212BF6094](v19);
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __33__SUManagerClient__setClientType__block_invoke_2;
  v18[3] = &unk_24CE3CA78;
  v18[4] = self;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteInterfaceWithErrorHandler:connectIfNecessary:", v18, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  clientType = self->_clientType;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __33__SUManagerClient__setClientType__block_invoke_3;
  v16[3] = &unk_24CE3C6B0;
  v17 = v11;
  v14 = v11;
  objc_msgSend(v12, "setClientType:withResult:", clientType, v16);

}

void __33__SUManagerClient__setClientType__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = v12;
  if (v12)
  {
    SULogDebug(CFSTR("Client <%p>: unable to set client type on connection: %@"), v4, v5, v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
    v11 = v12;
  }

}

void __33__SUManagerClient__setClientType__block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient _setClientType]_block_invoke_2");
    objc_msgSend(v14, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v11 = v14;
      goto LABEL_9;
    }
    if (objc_msgSend(v14, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v13 = objc_msgSend(v14, "code");

    v11 = v14;
    if (v13 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __33__SUManagerClient__setClientType__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setClientType:(int)a3
{
  SUManagerClient *obj;

  if (self->_clientType != a3)
  {
    self->_clientType = a3;
    obj = self;
    objc_sync_enter(obj);
    if (obj->_connected)
      -[SUManagerClient _setClientType](obj, "_setClientType");
    else
      -[SUManagerClient connectToServerIfNecessary](obj, "connectToServerIfNecessary");
    objc_sync_exit(obj);

  }
}

- (void)isScanning:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __30__SUManagerClient_isScanning___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __30__SUManagerClient_isScanning___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "isScanning:", v17);

}

void __30__SUManagerClient_isScanning___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isScanning:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __30__SUManagerClient_isScanning___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)scanForUpdates:(id)a3 withScanResults:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __50__SUManagerClient_scanForUpdates_withScanResults___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __50__SUManagerClient_scanForUpdates_withScanResults___block_invoke_2;
  v20[3] = &unk_24CE3D458;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "scanForUpdates:withResult:", v7, v20);

}

void __50__SUManagerClient_scanForUpdates_withScanResults___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient scanForUpdates:withScanResults:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __50__SUManagerClient_scanForUpdates_withScanResults___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)scanForUpdates:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __45__SUManagerClient_scanForUpdates_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __45__SUManagerClient_scanForUpdates_withResult___block_invoke_2;
  v20[3] = &unk_24CE3D458;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "scanForUpdates:withResult:", v7, v20);

}

void __45__SUManagerClient_scanForUpdates_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient scanForUpdates:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __45__SUManagerClient_scanForUpdates_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    objc_msgSend(v9, "latestUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

  }
}

- (void)autoScanAndDownloadIfAvailable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __50__SUManagerClient_autoScanAndDownloadIfAvailable___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __50__SUManagerClient_autoScanAndDownloadIfAvailable___block_invoke_2;
  v17[3] = &unk_24CE3D458;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "autoScanAndDownloadIfAvailable:", v17);

}

void __50__SUManagerClient_autoScanAndDownloadIfAvailable___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient autoScanAndDownloadIfAvailable:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __50__SUManagerClient_autoScanAndDownloadIfAvailable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)autoScanAndDownloadNow:(BOOL)a3 IfAvailable:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v6 = a4;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __54__SUManagerClient_autoScanAndDownloadNow_IfAvailable___block_invoke;
  v21[3] = &unk_24CE3D430;
  v21[4] = self;
  v16 = v6;
  v22 = v16;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __54__SUManagerClient_autoScanAndDownloadNow_IfAvailable___block_invoke_2;
  v19[3] = &unk_24CE3D458;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "autoScanAndDownloadNow:ifAvailable:", v4, v19);

}

void __54__SUManagerClient_autoScanAndDownloadNow_IfAvailable___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient autoScanAndDownloadNow:IfAvailable:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __54__SUManagerClient_autoScanAndDownloadNow_IfAvailable___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)descriptors:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __31__SUManagerClient_descriptors___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __31__SUManagerClient_descriptors___block_invoke_2;
  v17[3] = &unk_24CE3D458;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "descriptors:", v17);

}

void __31__SUManagerClient_descriptors___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient descriptors:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __31__SUManagerClient_descriptors___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v9;
    if (v5)
      v8 = 0;
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }

}

- (void)descriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __30__SUManagerClient_descriptor___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __30__SUManagerClient_descriptor___block_invoke_2;
  v17[3] = &unk_24CE3D480;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "descriptor:", v17);

}

void __30__SUManagerClient_descriptor___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient descriptor:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __30__SUManagerClient_descriptor___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v9;
    if (v5)
      v8 = 0;
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }

}

- (unint64_t)totalPurgeableSpace
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  return +[SUUtility totalPurgeableSpace:](SUUtility, "totalPurgeableSpace:", self->_scanDescriptor);
}

- (void)isClearingSpaceForDownload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __46__SUManagerClient_isClearingSpaceForDownload___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __46__SUManagerClient_isClearingSpaceForDownload___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "isClearingSpaceForDownload:", v17);

}

void __46__SUManagerClient_isClearingSpaceForDownload___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isClearingSpaceForDownload:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __46__SUManagerClient_isClearingSpaceForDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (id)getDocumentationDataForInstalledUpdateType:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_QWORD *)&a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);

  return +[SUUtility documentationDataForInstalledUpdateType:error:](SUUtility, "documentationDataForInstalledUpdateType:error:", v5, a4);
}

- (void)isDownloading:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__SUManagerClient_isDownloading___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __33__SUManagerClient_isDownloading___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "isDownloading:", v17);

}

void __33__SUManagerClient_isDownloading___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isDownloading:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __33__SUManagerClient_isDownloading___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)startDownload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__SUManagerClient_startDownload___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __33__SUManagerClient_startDownload___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "startDownload:", v17);

}

void __33__SUManagerClient_startDownload___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient startDownload:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __33__SUManagerClient_startDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __55__SUManagerClient_startDownloadWithOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __55__SUManagerClient_startDownloadWithOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "startDownloadWithOptions:withResult:", v7, v20);

}

void __55__SUManagerClient_startDownloadWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient startDownloadWithOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __55__SUManagerClient_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__SUManagerClient_startDownloadWithMetadata_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __56__SUManagerClient_startDownloadWithMetadata_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "startDownloadWithMetadata:withResult:", v7, v20);

}

void __56__SUManagerClient_startDownloadWithMetadata_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient startDownloadWithMetadata:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __56__SUManagerClient_startDownloadWithMetadata_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__SUManagerClient_cancelDownloadWithOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __56__SUManagerClient_cancelDownloadWithOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "cancelDownloadWithOptions:withResult:", v7, v20);

}

void __56__SUManagerClient_cancelDownloadWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient cancelDownloadWithOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __56__SUManagerClient_cancelDownloadWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)cancelDownload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __34__SUManagerClient_cancelDownload___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __34__SUManagerClient_cancelDownload___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "cancelDownloadWithOptions:withResult:", 0, v17);

}

void __34__SUManagerClient_cancelDownload___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient cancelDownload:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __34__SUManagerClient_cancelDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)pauseDownload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__SUManagerClient_pauseDownload___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __33__SUManagerClient_pauseDownload___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "pauseDownload:", v17);

}

void __33__SUManagerClient_pauseDownload___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient pauseDownload:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __33__SUManagerClient_pauseDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)resumeDownload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __34__SUManagerClient_resumeDownload___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __34__SUManagerClient_resumeDownload___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "resumeDownload:", v17);

}

void __34__SUManagerClient_resumeDownload___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient resumeDownload:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __34__SUManagerClient_resumeDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __52__SUManagerClient_updateDownloadOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __52__SUManagerClient_updateDownloadOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "updateDownloadOptions:withResult:", v7, v20);

}

void __52__SUManagerClient_updateDownloadOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient updateDownloadOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __52__SUManagerClient_updateDownloadOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __53__SUManagerClient_updateDownloadMetadata_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __53__SUManagerClient_updateDownloadMetadata_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "updateDownloadMetadata:withResult:", v7, v20);

}

void __53__SUManagerClient_updateDownloadMetadata_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient updateDownloadMetadata:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __53__SUManagerClient_updateDownloadMetadata_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __55__SUManagerClient_purgeDownloadWithOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __55__SUManagerClient_purgeDownloadWithOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "purgeDownloadWithOptions:withResult:", v7, v20);

}

void __55__SUManagerClient_purgeDownloadWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient purgeDownloadWithOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __55__SUManagerClient_purgeDownloadWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)purgeDownload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__SUManagerClient_purgeDownload___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __33__SUManagerClient_purgeDownload___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "purgeDownloadWithOptions:withResult:", 0, v17);

}

void __33__SUManagerClient_purgeDownload___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient purgeDownload:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __33__SUManagerClient_purgeDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)download:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __28__SUManagerClient_download___block_invoke;
  v14[3] = &unk_24CE3D4A8;
  v15 = v4;
  v13 = v4;
  -[SUManagerClient downloadAndInstallState:](self, "downloadAndInstallState:", v14);

}

uint64_t __28__SUManagerClient_download___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)downloadAndInstallState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __43__SUManagerClient_downloadAndInstallState___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __43__SUManagerClient_downloadAndInstallState___block_invoke_2;
  v17[3] = &unk_24CE3D4D0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "downloadAndInstallState:", v17);

}

void __43__SUManagerClient_downloadAndInstallState___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, (uint64_t)v14, v7, v8, v9, (uint64_t)"-[SUManagerClient downloadAndInstallState:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, 0, 0, v14);
    v10 = v14;
  }

}

void __43__SUManagerClient_downloadAndInstallState___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    if (v11)
    {
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, id))(v13 + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, v11);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_getExistingAutoInstallOperationFromModel:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, id, void *, _QWORD))(v13 + 16))(v13, v15, v9, v14, 0);

    }
  }

}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);

  v19 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __88__SUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
  v25[3] = &unk_24CE3D430;
  v25[4] = self;
  v20 = v8;
  v26 = v20;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __88__SUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2;
  v23[3] = &unk_24CE3D4F8;
  v23[4] = self;
  v24 = v20;
  v22 = v20;
  objc_msgSend(v21, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", v10, v9, v23);

}

void __88__SUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, (uint64_t)v14, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v13 + 16))(v13, 0, 0);
    v10 = v14;
  }

}

void __88__SUManagerClient_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v9 = a5;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v11 + 16))(v11, a2, a3, v12, v9);

}

- (void)areUpdatesDownloadableWithOptions:(id)a3 alternateUpdateOptions:(id)a4 preferredUpdateDownloadable:(BOOL *)a5 alternateUpdateDownloadable:(BOOL *)a6 preferredUpdateError:(id *)a7 alternateUpdateError:(id *)a8
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v26[8];
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v12 = a3;
  v13 = a4;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v14);

  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__15;
  v38 = __Block_byref_object_dispose__15;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__15;
  v32 = __Block_byref_object_dispose__15;
  v22 = MEMORY[0x24BDAC760];
  v33 = 0;
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __174__SUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke;
  v27[3] = &unk_24CE3CA78;
  v27[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v27, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v22;
  v26[1] = 3221225472;
  v26[2] = __174__SUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke_2;
  v26[3] = &unk_24CE3D520;
  v26[4] = &v44;
  v26[5] = &v40;
  v26[6] = &v34;
  v26[7] = &v28;
  objc_msgSend(v23, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", v12, v13, v26);

  if (a5)
    *a5 = *((_BYTE *)v45 + 24);
  if (a6)
    *a6 = *((_BYTE *)v41 + 24);
  if (a7)
    *a7 = objc_retainAutorelease((id)v35[5]);
  if (a8)
    *a8 = objc_retainAutorelease((id)v29[5]);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

}

void __174__SUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient areUpdatesDownloadableWithOptions:alternateUpdateOptions:preferredUpdateDownloadable:alternateUpdateDownloadable:preferredUpdateError:alternateUpdateError:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __174__SUManagerClient_areUpdatesDownloadableWithOptions_alternateUpdateOptions_preferredUpdateDownloadable_alternateUpdateDownloadable_preferredUpdateError_alternateUpdateError___block_invoke_2(_QWORD *a1, char a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v9 = a4;
  v10 = a5;
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;
  v15 = v9;

  v13 = *(_QWORD *)(a1[7] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;

}

- (BOOL)writeKeepAliveFile
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __37__SUManagerClient_writeKeepAliveFile__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __37__SUManagerClient_writeKeepAliveFile__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "writeKeepAliveFile:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __37__SUManagerClient_writeKeepAliveFile__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient writeKeepAliveFile]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __37__SUManagerClient_writeKeepAliveFile__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)deviceHasSufficientSpaceForDownloads:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__SUManagerClient_deviceHasSufficientSpaceForDownloads___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __56__SUManagerClient_deviceHasSufficientSpaceForDownloads___block_invoke_2;
  v17[3] = &unk_24CE3D4F8;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "deviceHasSufficientSpaceForDownloads:", v17);

}

void __56__SUManagerClient_deviceHasSufficientSpaceForDownloads___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, (uint64_t)v14, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient deviceHasSufficientSpaceForDownloads:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v13 + 16))(v13, 0, 0);
    v10 = v14;
  }

}

void __56__SUManagerClient_deviceHasSufficientSpaceForDownloads___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  v9 = a5;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v11 + 16))(v11, a2, a3, v12, v9);

}

- (void)deviceHasSufficientSpaceForDownload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55__SUManagerClient_deviceHasSufficientSpaceForDownload___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __55__SUManagerClient_deviceHasSufficientSpaceForDownload___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "deviceHasSufficientSpaceForDownload:", v17);

}

void __55__SUManagerClient_deviceHasSufficientSpaceForDownload___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient deviceHasSufficientSpaceForDownload:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __55__SUManagerClient_deviceHasSufficientSpaceForDownload___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __64__SUManagerClient_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __64__SUManagerClient_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_2;
  v17[3] = &unk_24CE3D548;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "extraSpaceNeededForDownloadWithoutAppPurging:", v17);

}

void __64__SUManagerClient_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient extraSpaceNeededForDownloadWithoutAppPurging:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __64__SUManagerClient_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (BOOL)scheduleUpdate:(id)a3
{
  return -[SUManagerClient scheduleUpdate:withError:](self, "scheduleUpdate:withError:", a3, 0);
}

- (BOOL)scheduleUpdate:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v15 = MEMORY[0x24BDAC760];
  v26 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __44__SUManagerClient_scheduleUpdate_withError___block_invoke;
  v20[3] = &unk_24CE3CA78;
  v20[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __44__SUManagerClient_scheduleUpdate_withError___block_invoke_2;
  v19[3] = &unk_24CE3D570;
  v19[4] = &v27;
  v19[5] = &v21;
  objc_msgSend(v16, "handleDDMDeclaration:withResult:", v6, v19);

  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v17 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __44__SUManagerClient_scheduleUpdate_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient scheduleUpdate:withError:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __44__SUManagerClient_scheduleUpdate_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)getDDMStatusWithKeys:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __51__SUManagerClient_getDDMStatusWithKeys_completion___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __51__SUManagerClient_getDDMStatusWithKeys_completion___block_invoke_2;
  v20[3] = &unk_24CE3D598;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "getDDMStatusWithKeys:completion:", v7, v20);

}

void __51__SUManagerClient_getDDMStatusWithKeys_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient getDDMStatusWithKeys:completion:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __51__SUManagerClient_getDDMStatusWithKeys_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v8 = a2;
  objc_msgSend(v5, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)cancelUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v13 = MEMORY[0x24BDAC760];
  v21 = 0;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __32__SUManagerClient_cancelUpdate___block_invoke;
  v17[3] = &unk_24CE3CA78;
  v17[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __32__SUManagerClient_cancelUpdate___block_invoke_2;
  v16[3] = &unk_24CE3C660;
  v16[4] = &v18;
  objc_msgSend(v14, "cancelDDMDeclaration:withResult:", v4, v16);

  LOBYTE(v14) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v14;
}

void __32__SUManagerClient_cancelUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient cancelUpdate:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __32__SUManagerClient_cancelUpdate___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)cancelUpdateForKey:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v15 = MEMORY[0x24BDAC760];
  v26 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __48__SUManagerClient_cancelUpdateForKey_withError___block_invoke;
  v20[3] = &unk_24CE3CA78;
  v20[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __48__SUManagerClient_cancelUpdateForKey_withError___block_invoke_2;
  v19[3] = &unk_24CE3D570;
  v19[4] = &v27;
  v19[5] = &v21;
  objc_msgSend(v16, "cancelDDMDeclarationForKey:completion:", v6, v19);

  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v17 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __48__SUManagerClient_cancelUpdateForKey_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient cancelUpdateForKey:withError:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __48__SUManagerClient_cancelUpdateForKey_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (void)handleDDMDeclaration:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  SULogDebug(CFSTR("Client <%p>: [DDM] Sending declaration: %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)self);
  v23 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __51__SUManagerClient_handleDDMDeclaration_withResult___block_invoke;
  v29[3] = &unk_24CE3D430;
  v29[4] = self;
  v24 = v6;
  v30 = v24;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v27[1] = 3221225472;
  v27[2] = __51__SUManagerClient_handleDDMDeclaration_withResult___block_invoke_2;
  v27[3] = &unk_24CE3BC68;
  v27[4] = self;
  v28 = v24;
  v26 = v24;
  objc_msgSend(v25, "handleDDMDeclaration:withResult:", v7, v27);

}

void __51__SUManagerClient_handleDDMDeclaration_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient handleDDMDeclaration:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __51__SUManagerClient_handleDDMDeclaration_withResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!a3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)getDDMDeclarationWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__SUManagerClient_getDDMDeclarationWithHandler___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __48__SUManagerClient_getDDMDeclarationWithHandler___block_invoke_2;
  v17[3] = &unk_24CE3D5C0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "getDDMDeclarationWithHandler:", v17);

}

void __48__SUManagerClient_getDDMDeclarationWithHandler___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient getDDMDeclarationWithHandler:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __48__SUManagerClient_getDDMDeclarationWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v15 = a2;
  objc_msgSend(v5, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  SULogDebug(CFSTR("Client <%p>: [DDM] Got reply with declaration: %@ error: %@"), v8, v9, v10, v11, v12, v13, v14, *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)getDDMUpdateDescriptor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v11 = MEMORY[0x24BDAC760];
  v22 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __41__SUManagerClient_getDDMUpdateDescriptor__block_invoke;
  v16[3] = &unk_24CE3CA78;
  v16[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __41__SUManagerClient_getDDMUpdateDescriptor__block_invoke_2;
  v15[3] = &unk_24CE3D5E8;
  v15[4] = self;
  v15[5] = &v17;
  objc_msgSend(v12, "getDDMUpdateDescriptorWithHandler:", v15);

  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __41__SUManagerClient_getDDMUpdateDescriptor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient getDDMUpdateDescriptor]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __41__SUManagerClient_getDDMUpdateDescriptor__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  SULogDebug(CFSTR("Client <%p>: [DDM] Got reply with descriptor: %@ error: %@"), v3, v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v12;

}

- (id)declarationsWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15;
  v29 = __Block_byref_object_dispose__15;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v13 = MEMORY[0x24BDAC760];
  v24 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __41__SUManagerClient_declarationsWithError___block_invoke;
  v18[3] = &unk_24CE3CA78;
  v18[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __41__SUManagerClient_declarationsWithError___block_invoke_2;
  v17[3] = &unk_24CE3D610;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v14, "getAllDeclarationsWithHandler:", v17);

  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v15 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __41__SUManagerClient_declarationsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient declarationsWithError:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __41__SUManagerClient_declarationsWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)setGlobalSettings:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v15 = MEMORY[0x24BDAC760];
  v26 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __47__SUManagerClient_setGlobalSettings_withError___block_invoke;
  v20[3] = &unk_24CE3CA78;
  v20[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __47__SUManagerClient_setGlobalSettings_withError___block_invoke_2;
  v19[3] = &unk_24CE3D570;
  v19[4] = &v27;
  v19[5] = &v21;
  objc_msgSend(v16, "setDDMGlobalSettings:completion:", v6, v19);

  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v17 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __47__SUManagerClient_setGlobalSettings_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient setGlobalSettings:withError:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __47__SUManagerClient_setGlobalSettings_withError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (id)globalSettingsDeclarationWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15;
  v29 = __Block_byref_object_dispose__15;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v13 = MEMORY[0x24BDAC760];
  v24 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__SUManagerClient_globalSettingsDeclarationWithError___block_invoke;
  v18[3] = &unk_24CE3CA78;
  v18[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __54__SUManagerClient_globalSettingsDeclarationWithError___block_invoke_2;
  v17[3] = &unk_24CE3D638;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v14, "getDDMGlobalSettingsWithHandler:", v17);

  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v15 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __54__SUManagerClient_globalSettingsDeclarationWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient globalSettingsDeclarationWithError:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __54__SUManagerClient_globalSettingsDeclarationWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (BOOL)shouldDisableAutoDownloadIOSUpdatesToggle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__SUManagerClient_shouldDisableAutoDownloadIOSUpdatesToggle__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __60__SUManagerClient_shouldDisableAutoDownloadIOSUpdatesToggle__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __60__SUManagerClient_shouldDisableAutoDownloadIOSUpdatesToggle__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient shouldDisableAutoDownloadIOSUpdatesToggle]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __60__SUManagerClient_shouldDisableAutoDownloadIOSUpdatesToggle__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
    SULogError(CFSTR("%s: failed with error %@"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUManagerClient shouldDisableAutoDownloadIOSUpdatesToggle]_block_invoke_2");
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)shouldDisableAutoInstallIOSUpdatesToggle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__SUManagerClient_shouldDisableAutoInstallIOSUpdatesToggle__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __59__SUManagerClient_shouldDisableAutoInstallIOSUpdatesToggle__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __59__SUManagerClient_shouldDisableAutoInstallIOSUpdatesToggle__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient shouldDisableAutoInstallIOSUpdatesToggle]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __59__SUManagerClient_shouldDisableAutoInstallIOSUpdatesToggle__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
    SULogError(CFSTR("%s: failed with error %@"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUManagerClient shouldDisableAutoInstallIOSUpdatesToggle]_block_invoke_2");
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)shouldDisableAutoInstallRSRToggle
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __52__SUManagerClient_shouldDisableAutoInstallRSRToggle__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __52__SUManagerClient_shouldDisableAutoInstallRSRToggle__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "getShouldDisableAutoInstallRSRToggleWithHandler:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __52__SUManagerClient_shouldDisableAutoInstallRSRToggle__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient shouldDisableAutoInstallRSRToggle]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __52__SUManagerClient_shouldDisableAutoInstallRSRToggle__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
    SULogError(CFSTR("%s: failed with error %@"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)"-[SUManagerClient shouldDisableAutoInstallRSRToggle]_block_invoke_2");
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (void)currentAutoInstallOperationForecast:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55__SUManagerClient_currentAutoInstallOperationForecast___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __55__SUManagerClient_currentAutoInstallOperationForecast___block_invoke_2;
  v17[3] = &unk_24CE3D660;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "currentAutoInstallOperationForecast:", v17);

}

void __55__SUManagerClient_currentAutoInstallOperationForecast___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient currentAutoInstallOperationForecast:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __55__SUManagerClient_currentAutoInstallOperationForecast___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  v6 = a4;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__SUManagerClient_currentAutoInstallOperation_withResult___block_invoke;
  v21[3] = &unk_24CE3D430;
  v21[4] = self;
  v16 = v6;
  v22 = v16;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __58__SUManagerClient_currentAutoInstallOperation_withResult___block_invoke_2;
  v19[3] = &unk_24CE3D688;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "currentAutoInstallOperation:withResult:", v4, v19);

}

void __58__SUManagerClient_currentAutoInstallOperation_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient currentAutoInstallOperation:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __58__SUManagerClient_currentAutoInstallOperation_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = 0;
    if (v9 && !v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "_getExistingAutoInstallOperationFromModel:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
    }
    (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v5);

  }
}

- (void)currentPasscodePolicy:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __41__SUManagerClient_currentPasscodePolicy___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __41__SUManagerClient_currentPasscodePolicy___block_invoke_2;
  v17[3] = &unk_24CE3D6B0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "currentPasscodePolicy:", v17);

}

void __41__SUManagerClient_currentPasscodePolicy___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient currentPasscodePolicy:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __41__SUManagerClient_currentPasscodePolicy___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (void)isAutoUpdateEnabled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __39__SUManagerClient_isAutoUpdateEnabled___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __39__SUManagerClient_isAutoUpdateEnabled___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "isAutoUpdateEnabled:", v17);

}

void __39__SUManagerClient_isAutoUpdateEnabled___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isAutoUpdateEnabled:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __39__SUManagerClient_isAutoUpdateEnabled___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (void)isAutoUpdateScheduled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __41__SUManagerClient_isAutoUpdateScheduled___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __41__SUManagerClient_isAutoUpdateScheduled___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "isAutoUpdateScheduled:", v17);

}

void __41__SUManagerClient_isAutoUpdateScheduled___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isAutoUpdateScheduled:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __41__SUManagerClient_isAutoUpdateScheduled___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (BOOL)isAutoUpdateScheduled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __40__SUManagerClient_isAutoUpdateScheduled__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __40__SUManagerClient_isAutoUpdateScheduled__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "isAutoUpdateScheduled:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __40__SUManagerClient_isAutoUpdateScheduled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isAutoUpdateScheduled]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __40__SUManagerClient_isAutoUpdateScheduled__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)presentAutoUpdateBanner:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __43__SUManagerClient_presentAutoUpdateBanner___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __43__SUManagerClient_presentAutoUpdateBanner___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "presentAutoUpdateBanner:", v17);

}

void __43__SUManagerClient_presentAutoUpdateBanner___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient presentAutoUpdateBanner:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __43__SUManagerClient_presentAutoUpdateBanner___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (id)_getExistingAutoInstallOperationFromModel:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *installOperationIDsToOperationHandler;
  void *v7;
  void *v8;
  SUAutoInstallOperation *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
    objc_msgSend(v4, "id");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](installOperationIDsToOperationHandler, "objectForKey:", v8);
    v9 = (SUAutoInstallOperation *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = -[SUAutoInstallOperation initWithAutoInstallOperationModel:client:]([SUAutoInstallOperation alloc], "initWithAutoInstallOperationModel:client:", v5, self);
      -[SUManagerClient _registerAutoInstallOperationClientHandler:](self, "_registerAutoInstallOperationClientHandler:", v9);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)observeInstallationConstraintChangesForDownload:(id)a3 observer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableSet *v17;
  uint64_t v18;
  uint64_t v19;
  SUInstallationConstraintObserver *v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  SUInstallationConstraintObserver *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  SUManagerClient *v45;
  id v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v47 = v6;
  objc_msgSend(v6, "progress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v16, "isDone");

  if (!(_DWORD)v6)
    goto LABEL_18;
  v46 = v7;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v17 = self->_installationConstraintObservers;
  v18 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
  if (v18)
  {
    v19 = v18;
    v45 = self;
    v20 = 0;
    v21 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v51 != v21)
          objc_enumerationMutation(v17);
        v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v23, "download");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "descriptor");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "descriptor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "isEqual:", v26);

        if (v27)
        {
          v28 = v23;

          v20 = v28;
        }
      }
      v19 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    }
    while (v19);

    self = v45;
    v7 = v46;
    if (v20)
      goto LABEL_16;
  }
  else
  {

  }
  v20 = -[SUInstallationConstraintObserver initWithDownload:]([SUInstallationConstraintObserver alloc], "initWithDownload:", v47);
  -[SUComposedInstallationConstraintMonitor setDelegate:](v20, "setDelegate:", self);
  if (!v20)
  {
    SULogDebug(CFSTR("Created installation constraint observer: %@: observers: %@"), v29, v30, v31, v32, v33, v34, v35, 0);
LABEL_18:
    v43 = 0;
    goto LABEL_19;
  }
  -[NSMutableSet addObject:](self->_installationConstraintObservers, "addObject:", v20);
  SULogDebug(CFSTR("Created installation constraint observer: %@: observers: %@"), v36, v37, v38, v39, v40, v41, v42, (uint64_t)v20);
LABEL_16:
  v48[0] = MEMORY[0x24BDAC760];
  v48[1] = 3221225472;
  v48[2] = __76__SUManagerClient_observeInstallationConstraintChangesForDownload_observer___block_invoke;
  v48[3] = &unk_24CE3D700;
  v48[4] = self;
  v49 = v7;
  -[SUInstallationConstraintObserver registerObserverBlock:](v20, "registerObserverBlock:", v48);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v43;
}

void __76__SUManagerClient_observeInstallationConstraintChangesForDownload_observer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v7 = a4;
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__SUManagerClient_observeInstallationConstraintChangesForDownload_observer___block_invoke_2;
  v11[3] = &unk_24CE3D6D8;
  v14 = a2;
  v15 = a3;
  v12 = v7;
  v13 = v8;
  v10 = v7;
  dispatch_async(v9, v11);

}

uint64_t __76__SUManagerClient_observeInstallationConstraintChangesForDownload_observer___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

- (void)registerCSInstallPredicatesOnDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  -[SUManagerClient _remoteInterface](self, "_remoteInterface");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "registerCSInstallPredicatesOnDate:", v4);

}

- (void)isUpdateReadyForInstallation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __48__SUManagerClient_isUpdateReadyForInstallation___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __48__SUManagerClient_isUpdateReadyForInstallation___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "isUpdateReadyForInstallation:", v17);

}

void __48__SUManagerClient_isUpdateReadyForInstallation___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isUpdateReadyForInstallation:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __48__SUManagerClient_isUpdateReadyForInstallation___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __70__SUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __70__SUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "isUpdateReadyForInstallationWithOptions:withResult:", v7, v20);

}

void __70__SUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isUpdateReadyForInstallationWithOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __70__SUManagerClient_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __62__SUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __62__SUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "installUpdateWithInstallOptions:withResult:", v7, v20);

}

void __62__SUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient installUpdateWithInstallOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __62__SUManagerClient_installUpdateWithInstallOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __55__SUManagerClient_installUpdateWithOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __55__SUManagerClient_installUpdateWithOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3BC68;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "installUpdateWithOptions:withResult:", v7, v20);

}

void __55__SUManagerClient_installUpdateWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient installUpdateWithOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __55__SUManagerClient_installUpdateWithOptions_withResult___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)installUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__SUManagerClient_installUpdate___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __33__SUManagerClient_installUpdate___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "installUpdate:", v17);

}

void __33__SUManagerClient_installUpdate___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient installUpdate:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __33__SUManagerClient_installUpdate___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)userAskedToDeferInstall
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__SUManagerClient_userAskedToDeferInstall__block_invoke;
  v12[3] = &unk_24CE3CA78;
  v12[4] = self;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteInterfaceWithErrorHandler:connectIfNecessary:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userAskedToDeferInstall");

}

void __42__SUManagerClient_userAskedToDeferInstall__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient userAskedToDeferInstall]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __58__SUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __58__SUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3D728;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "eligibleRollbackWithOptions:withResult:", v7, v20);

}

void __58__SUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient eligibleRollbackWithOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __58__SUManagerClient_eligibleRollbackWithOptions_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__SUManagerClient_rollbackUpdateWithOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __56__SUManagerClient_rollbackUpdateWithOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3D750;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "rollbackUpdateWithOptions:withResult:", v7, v20);

}

void __56__SUManagerClient_rollbackUpdateWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, (uint64_t)v14, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient rollbackUpdateWithOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, 0, v14);
    v10 = v14;
  }

}

void __56__SUManagerClient_rollbackUpdateWithOptions_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, a2, v10, v7);

}

- (void)previousRollbackWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a4;
  v7 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  v16 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __58__SUManagerClient_previousRollbackWithOptions_withResult___block_invoke;
  v22[3] = &unk_24CE3D430;
  v22[4] = self;
  v17 = v6;
  v23 = v17;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v20[1] = 3221225472;
  v20[2] = __58__SUManagerClient_previousRollbackWithOptions_withResult___block_invoke_2;
  v20[3] = &unk_24CE3D728;
  v20[4] = self;
  v21 = v17;
  v19 = v17;
  objc_msgSend(v18, "previousRollback:withResult:", v7, v20);

}

void __58__SUManagerClient_previousRollbackWithOptions_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient previousRollbackWithOptions:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __58__SUManagerClient_previousRollbackWithOptions_withResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)isRollingBack:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __33__SUManagerClient_isRollingBack___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __33__SUManagerClient_isRollingBack___block_invoke_2;
  v17[3] = &unk_24CE3D750;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "isRollingBack:", v17);

}

void __33__SUManagerClient_isRollingBack___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, (uint64_t)v14, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isRollingBack:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v13 + 16))(v13, 0, 0, v14);
    v10 = v14;
  }

}

void __33__SUManagerClient_isRollingBack___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id, id))(v9 + 16))(v9, a2, v10, v7);

}

- (void)scheduleRollbackRebootForLater:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __50__SUManagerClient_scheduleRollbackRebootForLater___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __50__SUManagerClient_scheduleRollbackRebootForLater___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "scheduleRollbackRebootForLater:", v17);

}

void __50__SUManagerClient_scheduleRollbackRebootForLater___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient scheduleRollbackRebootForLater:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __50__SUManagerClient_scheduleRollbackRebootForLater___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (BOOL)isSplatOnlyUpdateInstalled
{
  return +[SUUtility isSplatOnlyUpdateInstalled](SUUtility, "isSplatOnlyUpdateInstalled");
}

- (BOOL)setLastRollbackDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  _QWORD v17[7];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v13 = MEMORY[0x24BDAC760];
  v22 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __45__SUManagerClient_setLastRollbackDescriptor___block_invoke;
  v18[3] = &unk_24CE3CA78;
  v18[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __45__SUManagerClient_setLastRollbackDescriptor___block_invoke_2;
  v17[3] = &unk_24CE3D778;
  v17[4] = self;
  v17[5] = &v19;
  v17[6] = &v23;
  objc_msgSend(v14, "setLastRollbackDescriptor:withResult:", v4, v17);

  if (*((_BYTE *)v20 + 24))
    v15 = 0;
  else
    v15 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

void __45__SUManagerClient_setLastRollbackDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient setLastRollbackDescriptor:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __45__SUManagerClient_setLastRollbackDescriptor___block_invoke_2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    SULogDebug(CFSTR("Client <%p>: unable to set rollback descriptor in state file: %@"), a2, a3, a4, a5, a6, a7, a8, a1[4]);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  }
}

- (BOOL)securityResponseRollbackSuggested:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  _QWORD v19[6];
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__15;
  v15 = MEMORY[0x24BDAC760];
  v26 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __59__SUManagerClient_securityResponseRollbackSuggested_error___block_invoke;
  v20[3] = &unk_24CE3CA78;
  v20[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __59__SUManagerClient_securityResponseRollbackSuggested_error___block_invoke_2;
  v19[3] = &unk_24CE3D570;
  v19[4] = &v27;
  v19[5] = &v21;
  objc_msgSend(v16, "securityResponseRollbackSuggested:withResult:", v6, v19);

  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v17 = *((_BYTE *)v28 + 24);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v17;
}

void __59__SUManagerClient_securityResponseRollbackSuggested_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient securityResponseRollbackSuggested:error:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __59__SUManagerClient_securityResponseRollbackSuggested_error___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)createInstallationKeybagWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  _QWORD v17[7];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v13 = MEMORY[0x24BDAC760];
  v22 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__SUManagerClient_createInstallationKeybagWithOptions___block_invoke;
  v18[3] = &unk_24CE3CA78;
  v18[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __55__SUManagerClient_createInstallationKeybagWithOptions___block_invoke_2;
  v17[3] = &unk_24CE3D778;
  v17[4] = self;
  v17[5] = &v19;
  v17[6] = &v23;
  objc_msgSend(v14, "createInstallationKeybag:withResult:", v4, v17);

  if (*((_BYTE *)v20 + 24))
    v15 = 0;
  else
    v15 = *((_BYTE *)v24 + 24) != 0;
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v15;
}

void __55__SUManagerClient_createInstallationKeybagWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient createInstallationKeybagWithOptions:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __55__SUManagerClient_createInstallationKeybagWithOptions___block_invoke_2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3)
  {
    SULogDebug(CFSTR("Client <%p>: unable to create installation keybag: %@"), a2, a3, a4, a5, a6, a7, a8, a1[4]);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
  }
}

- (BOOL)createInstallationKeybag:(id)a3
{
  return -[SUManagerClient createInstallationKeybag:forUnattendedInstall:](self, "createInstallationKeybag:forUnattendedInstall:", a3, 0);
}

- (BOOL)createInstallationKeybag:(id)a3 forUnattendedInstall:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SUKeybagOptions *v7;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(SUKeybagOptions);
  -[SUKeybagOptions setPasscode:](v7, "setPasscode:", v6);

  -[SUKeybagOptions setKeybagType:](v7, "setKeybagType:", v4);
  LOBYTE(v4) = -[SUManagerClient createInstallationKeybagWithOptions:](self, "createInstallationKeybagWithOptions:", v7);

  return v4;
}

- (BOOL)isInstallationKeybagRequired
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 1;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__SUManagerClient_isInstallationKeybagRequired__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __47__SUManagerClient_isInstallationKeybagRequired__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "isInstallationKeybagRequired:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __47__SUManagerClient_isInstallationKeybagRequired__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isInstallationKeybagRequired]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __47__SUManagerClient_isInstallationKeybagRequired__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isInstallationKeybagRequiredForDescriptor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v13 = MEMORY[0x24BDAC760];
  v21 = 1;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __61__SUManagerClient_isInstallationKeybagRequiredForDescriptor___block_invoke;
  v17[3] = &unk_24CE3CA78;
  v17[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  v16[1] = 3221225472;
  v16[2] = __61__SUManagerClient_isInstallationKeybagRequiredForDescriptor___block_invoke_2;
  v16[3] = &unk_24CE3C660;
  v16[4] = &v18;
  objc_msgSend(v14, "isInstallationKeybagRequiredForDescriptor:result:", v4, v16);

  LOBYTE(v14) = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v14;
}

void __61__SUManagerClient_isInstallationKeybagRequiredForDescriptor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isInstallationKeybagRequiredForDescriptor:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __61__SUManagerClient_isInstallationKeybagRequiredForDescriptor___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)destroyInstallationKeybag
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__SUManagerClient_destroyInstallationKeybag__block_invoke;
  v12[3] = &unk_24CE3CA78;
  v12[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "destroyInstallationKeybag");

}

void __44__SUManagerClient_destroyInstallationKeybag__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient destroyInstallationKeybag]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (void)slaVersion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __30__SUManagerClient_slaVersion___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __30__SUManagerClient_slaVersion___block_invoke_2;
  v17[3] = &unk_24CE3D548;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "slaVersion:", v17);

}

void __30__SUManagerClient_slaVersion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient slaVersion:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __30__SUManagerClient_slaVersion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);

}

- (void)setMandatorySoftwareUpdateDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__SUManagerClient_setMandatorySoftwareUpdateDictionary___block_invoke;
  v14[3] = &unk_24CE3CA78;
  v14[4] = self;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMandatorySoftwareUpdateDictionary:", v4);

}

void __56__SUManagerClient_setMandatorySoftwareUpdateDictionary___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient setMandatorySoftwareUpdateDictionary:]_block_invoke");
    objc_msgSend(v14, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v11 = v14;
      goto LABEL_9;
    }
    if (objc_msgSend(v14, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v13 = objc_msgSend(v14, "code");

    v11 = v14;
    if (v13 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (void)getMandatorySoftwareUpdateDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __56__SUManagerClient_getMandatorySoftwareUpdateDictionary___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __56__SUManagerClient_getMandatorySoftwareUpdateDictionary___block_invoke_2;
  v17[3] = &unk_24CE3D7A0;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "getMandatorySoftwareUpdateDictionary:", v17);

}

void __56__SUManagerClient_getMandatorySoftwareUpdateDictionary___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient getMandatorySoftwareUpdateDictionary:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

uint64_t __56__SUManagerClient_getMandatorySoftwareUpdateDictionary___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)getMandatorySoftwareUpdateDictionaryWithError:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15;
  v29 = __Block_byref_object_dispose__15;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v13 = MEMORY[0x24BDAC760];
  v24 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __65__SUManagerClient_getMandatorySoftwareUpdateDictionaryWithError___block_invoke;
  v18[3] = &unk_24CE3CA78;
  v18[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __65__SUManagerClient_getMandatorySoftwareUpdateDictionaryWithError___block_invoke_2;
  v17[3] = &unk_24CE3D7C8;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v14, "getMandatorySoftwareUpdateDictionary:", v17);

  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v15 = (id)v26[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __65__SUManagerClient_getMandatorySoftwareUpdateDictionaryWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient getMandatorySoftwareUpdateDictionaryWithError:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __65__SUManagerClient_getMandatorySoftwareUpdateDictionaryWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v3 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__SUManagerClient_enableAutomaticUpdateV2___block_invoke;
  v14[3] = &unk_24CE3CA78;
  v14[4] = self;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enableAutomaticUpdateV2:", v3);

}

void __43__SUManagerClient_enableAutomaticUpdateV2___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient enableAutomaticUpdateV2:]_block_invoke");
    objc_msgSend(v14, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v11 = v14;
      goto LABEL_9;
    }
    if (objc_msgSend(v14, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v13 = objc_msgSend(v14, "code");

    v11 = v14;
    if (v13 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (BOOL)isAutomaticUpdateV2Enabled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __45__SUManagerClient_isAutomaticUpdateV2Enabled__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __45__SUManagerClient_isAutomaticUpdateV2Enabled__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "isAutomaticUpdateV2Enabled:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __45__SUManagerClient_isAutomaticUpdateV2Enabled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isAutomaticUpdateV2Enabled]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __45__SUManagerClient_isAutomaticUpdateV2Enabled__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v3 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __43__SUManagerClient_enableAutomaticDownload___block_invoke;
  v14[3] = &unk_24CE3CA78;
  v14[4] = self;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enableAutomaticDownload:", v3);

}

void __43__SUManagerClient_enableAutomaticDownload___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient enableAutomaticDownload:]_block_invoke");
    objc_msgSend(v14, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v11 = v14;
      goto LABEL_9;
    }
    if (objc_msgSend(v14, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v13 = objc_msgSend(v14, "code");

    v11 = v14;
    if (v13 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (BOOL)isAutomaticDownloadEnabled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __45__SUManagerClient_isAutomaticDownloadEnabled__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __45__SUManagerClient_isAutomaticDownloadEnabled__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "isAutomaticDownloadEnabled:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __45__SUManagerClient_isAutomaticDownloadEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isAutomaticDownloadEnabled]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __45__SUManagerClient_isAutomaticDownloadEnabled__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAnyClientInUserInteraction
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __47__SUManagerClient_isAnyClientInUserInteraction__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __47__SUManagerClient_isAnyClientInUserInteraction__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "isAnyClientInUserInteraction:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __47__SUManagerClient_isAnyClientInUserInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isAnyClientInUserInteraction]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __47__SUManagerClient_isAnyClientInUserInteraction__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)isSoftwareUpdateInProgress:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  if (v4)
  {
    v13 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __46__SUManagerClient_isSoftwareUpdateInProgress___block_invoke;
    v18[3] = &unk_24CE3D430;
    v18[4] = self;
    v14 = v4;
    v19 = v14;
    -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    v16[1] = 3221225472;
    v16[2] = __46__SUManagerClient_isSoftwareUpdateInProgress___block_invoke_2;
    v16[3] = &unk_24CE3BC68;
    v16[4] = self;
    v17 = v14;
    objc_msgSend(v15, "isSoftwareUpdateInProgress:", v16);

  }
}

void __46__SUManagerClient_isSoftwareUpdateInProgress___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isSoftwareUpdateInProgress:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __46__SUManagerClient_isSoftwareUpdateInProgress___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v15 = a3;
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v14 = CFSTR("NO");
  if (a2)
    v14 = CFSTR("YES");
  SULogInfo(CFSTR("isSoftwareUpdateInProgress: %@, error: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)softwareUpdatePathRestriction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__SUManagerClient_softwareUpdatePathRestriction___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __49__SUManagerClient_softwareUpdatePathRestriction___block_invoke_2;
  v17[3] = &unk_24CE3D6B0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "softwareUpdatePathRestriction:", v17);

}

void __49__SUManagerClient_softwareUpdatePathRestriction___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient softwareUpdatePathRestriction:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __49__SUManagerClient_softwareUpdatePathRestriction___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (void)isDelayingUpdates:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __37__SUManagerClient_isDelayingUpdates___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __37__SUManagerClient_isDelayingUpdates___block_invoke_2;
  v17[3] = &unk_24CE3BC68;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "isDelayingUpdates:", v17);

}

void __37__SUManagerClient_isDelayingUpdates___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient isDelayingUpdates:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __37__SUManagerClient_isDelayingUpdates___block_invoke_2(uint64_t a1, unsigned int a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    if (v8)
      v7 = 0;
    else
      v7 = a2;
    (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v6, v7);
  }

}

- (void)delayEndDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __32__SUManagerClient_delayEndDate___block_invoke;
  v19[3] = &unk_24CE3D430;
  v19[4] = self;
  v14 = v4;
  v20 = v14;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __32__SUManagerClient_delayEndDate___block_invoke_2;
  v17[3] = &unk_24CE3D7F0;
  v17[4] = self;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "delayEndDate:", v17);

}

void __32__SUManagerClient_delayEndDate___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient delayEndDate:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __32__SUManagerClient_delayEndDate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v9;
    if (v5)
      v8 = 0;
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v5);
  }

}

- (BOOL)isSplatOnlyUpdateRollbackAllowed:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  _QWORD v17[6];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__15;
  v23 = __Block_byref_object_dispose__15;
  v13 = MEMORY[0x24BDAC760];
  v24 = 0;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52__SUManagerClient_isSplatOnlyUpdateRollbackAllowed___block_invoke;
  v18[3] = &unk_24CE3CA78;
  v18[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __52__SUManagerClient_isSplatOnlyUpdateRollbackAllowed___block_invoke_2;
  v17[3] = &unk_24CE3D570;
  v17[4] = &v25;
  v17[5] = &v19;
  objc_msgSend(v14, "splatRollbackAllowed:", v17);

  if (a3)
    *a3 = objc_retainAutorelease((id)v20[5]);
  v15 = *((_BYTE *)v26 + 24);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __52__SUManagerClient_isSplatOnlyUpdateRollbackAllowed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isSplatOnlyUpdateRollbackAllowed:]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __52__SUManagerClient_isSplatOnlyUpdateRollbackAllowed___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)isSplatOnlyUpdateRollbackSuggested
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = MEMORY[0x24BDAC760];
  v19 = 0;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__SUManagerClient_isSplatOnlyUpdateRollbackSuggested__block_invoke;
  v15[3] = &unk_24CE3CA78;
  v15[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __53__SUManagerClient_isSplatOnlyUpdateRollbackSuggested__block_invoke_2;
  v14[3] = &unk_24CE3C660;
  v14[4] = &v16;
  objc_msgSend(v12, "isSplatOnlyUpdateRollbackSuggested:", v14);

  LOBYTE(v12) = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return (char)v12;
}

void __53__SUManagerClient_isSplatOnlyUpdateRollbackSuggested__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient isSplatOnlyUpdateRollbackSuggested]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

uint64_t __53__SUManagerClient_isSplatOnlyUpdateRollbackSuggested__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

+ (BOOL)_isMultiUserAppleId
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isMultiUser"))
  {
    objc_msgSend(v2, "currentUser");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userType") == 1;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)_shouldDisallowAvailabilityNotifications
{
  void *v3;
  char v4;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reload");
  v4 = objc_msgSend(v3, "disableAvailabilityAlerts");
  LOBYTE(a1) = objc_msgSend(a1, "_isMultiUserAppleId") | v4;

  return (char)a1;
}

- (void)_registerAutoInstallOperationClientHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *installOperationIDsToOperationHandler;
  id v14;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  objc_msgSend(v4, "uniqueIdentifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](installOperationIDsToOperationHandler, "setValue:forKey:", v4, v14);

}

- (void)_unregisterAutoInstallOperationClientHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *installOperationIDsToOperationHandler;
  id v14;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  objc_msgSend(v4, "uniqueIdentifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setValue:forKey:](installOperationIDsToOperationHandler, "setValue:forKey:", v4, v14);

}

- (void)_consentAutoInstallOperation:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  if (v6)
  {
    v16 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __59__SUManagerClient__consentAutoInstallOperation_withResult___block_invoke;
    v22[3] = &unk_24CE3D430;
    v22[4] = self;
    v17 = v7;
    v23 = v17;
    -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "id");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __59__SUManagerClient__consentAutoInstallOperation_withResult___block_invoke_2;
    v20[3] = &unk_24CE3BC68;
    v20[4] = self;
    v21 = v17;
    objc_msgSend(v18, "consentToAutoInstallOperation:withResult:", v19, v20);

  }
}

void __59__SUManagerClient__consentAutoInstallOperation_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient _consentAutoInstallOperation:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __59__SUManagerClient__consentAutoInstallOperation_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (void)_cancelAutoInstallOperation:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  if (v6)
  {
    v16 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __58__SUManagerClient__cancelAutoInstallOperation_withResult___block_invoke;
    v22[3] = &unk_24CE3D430;
    v22[4] = self;
    v17 = v7;
    v23 = v17;
    -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "id");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __58__SUManagerClient__cancelAutoInstallOperation_withResult___block_invoke_2;
    v20[3] = &unk_24CE3BC68;
    v20[4] = self;
    v21 = v17;
    objc_msgSend(v18, "cancelAutoInstallOperation:withResult:", v19, v20);

  }
}

void __58__SUManagerClient__cancelAutoInstallOperation_withResult___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, (uint64_t)v14, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerClient _cancelAutoInstallOperation:withResult:]_block_invoke");
    objc_msgSend(v14, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      if (objc_msgSend(v14, "code") == 4097)
      {

      }
      else
      {
        v12 = objc_msgSend(v14, "code");

        v10 = v14;
        if (v12 != 4099)
          goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
    }
    else
    {

    }
    v10 = v14;
  }
LABEL_9:
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v14);
    v10 = v14;
  }

}

void __58__SUManagerClient__cancelAutoInstallOperation_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

- (void)installServerConfiguration
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__SUManagerClient_installServerConfiguration__block_invoke;
  v12[3] = &unk_24CE3CA78;
  v12[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "installServerConfiguration");

}

void __45__SUManagerClient_installServerConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient installServerConfiguration]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (void)setExclusiveControl:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v3 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__SUManagerClient_setExclusiveControl___block_invoke;
  v14[3] = &unk_24CE3CA78;
  v14[4] = self;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExclusiveControl:", v3);

}

void __39__SUManagerClient_setExclusiveControl___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient setExclusiveControl:]_block_invoke");
    objc_msgSend(v14, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v11 = v14;
      goto LABEL_9;
    }
    if (objc_msgSend(v14, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v13 = objc_msgSend(v14, "code");

    v11 = v14;
    if (v13 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (void)recordSUAnalyticsEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  -[SUManagerClient _remoteInterface](self, "_remoteInterface");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordSUAnalyticsEvent:", v4);

}

- (void)submitSUAnalyticsEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  -[SUManagerClient _remoteInterface](self, "_remoteInterface");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitSUAnalyticsEvent:", v4);

}

- (void)submitAllSUAnalyticsEvents
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  -[SUManagerClient _remoteInterface](self, "_remoteInterface");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "submitAllSUAnalyticsEvents");

}

- (void)submitSUAnalyticsEventsWithName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  -[SUManagerClient _remoteInterface](self, "_remoteInterface");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitSUAnalyticsEventsWithName:", v4);

}

- (void)networkMonitorDetectOverrides
{
  id v2;

  -[SUManagerClient _remoteInterface](self, "_remoteInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "networkMonitorDetectOverrides");

}

- (void)installationConstraintObserverDidRemoveAllObserverBlocks:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SUManagerClient.m"), 1516, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__SUManagerClient_installationConstraintObserverDidRemoveAllObserverBlocks___block_invoke;
  block[3] = &unk_24CE3B610;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

void __76__SUManagerClient_installationConstraintObserverDidRemoveAllObserverBlocks___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "_invalidateConstraintObserver:withError:", *(_QWORD *)(a1 + 40), 0);
  SULogInfo(CFSTR("installationConstraintObserverDidRemoveAllObserverBlocks: %@: observers: %@"), v2, v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 40));
}

- (void)preferences:(id)a3 didChangePreference:(id)a4 toValue:(id)a5
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__SUManagerClient_preferences_didChangePreference_toValue___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __59__SUManagerClient_preferences_didChangePreference_toValue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  char v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      objc_msgSend(v6, "automaticUpdateV2EnabledDidChange:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)_invalidateAllInstallationConstraintObserversForDownload
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  const __CFString *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SUManagerClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableSet allObjects](self->_installationConstraintObservers, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x24BDD0FD8];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x24BDD1540];
        v18 = v7;
        v19 = CFSTR("Download changed");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 56, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUManagerClient _invalidateConstraintObserver:withError:](self, "_invalidateConstraintObserver:withError:", v9, v12);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

}

- (void)_invalidateConstraintObserver:(id)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v8 = a4;
  v6 = a3;
  -[SUManagerClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (v8)
    objc_msgSend(v6, "invalidateWithError:", v8);
  else
    objc_msgSend(v6, "invalidate");
  -[NSMutableSet removeObject:](self->_installationConstraintObservers, "removeObject:", v6);

}

- (id)_bundleIdentifier
{
  if (_bundleIdentifier_pred != -1)
    dispatch_once(&_bundleIdentifier_pred, &__block_literal_global_15);
  return (id)_bundleIdentifier___identifier;
}

void __36__SUManagerClient__bundleIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_bundleIdentifier___identifier;
  _bundleIdentifier___identifier = v0;

}

- (id)_remoteInterface
{
  SUManagerClient *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[SUManagerClient connectToServerIfNecessary](v2, "connectToServerIfNecessary");
  -[NSXPCConnection remoteObjectProxy](v2->_serverConnection, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  return -[SUManagerClient _remoteInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteInterfaceWithErrorHandler:connectIfNecessary:", a3, 1);
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3 connectIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SUManagerClient *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (v4)
    -[SUManagerClient connectToServerIfNecessary](v7, "connectToServerIfNecessary");
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v7->_serverConnection, "remoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  return v8;
}

- (id)_remoteSynchronousInterfaceWithErrorHandler:(id)a3 connectIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SUManagerClient *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (v4)
    -[SUManagerClient connectToServerIfNecessary](v7, "connectToServerIfNecessary");
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](v7->_serverConnection, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  return v8;
}

- (void)_invalidateConnection
{
  NSXPCConnection *serverConnection;
  NSXPCConnection *v3;
  SUManagerClient *obj;

  obj = self;
  objc_sync_enter(obj);
  serverConnection = obj->_serverConnection;
  if (serverConnection)
  {
    -[NSXPCConnection invalidate](serverConnection, "invalidate");
    -[NSXPCConnection setInvalidationHandler:](obj->_serverConnection, "setInvalidationHandler:", 0);
    -[NSXPCConnection setInterruptionHandler:](obj->_serverConnection, "setInterruptionHandler:", 0);
    v3 = obj->_serverConnection;
    obj->_serverConnection = 0;

    obj->_connected = 0;
  }
  objc_sync_exit(obj);

}

- (void)connectToServerIfNecessary
{
  SUManagerClient *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSXPCConnection *serverConnection;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSXPCConnection *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSXPCConnection *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id location;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connected)
  {
    SULogDebug(CFSTR("Client <%p>: establishing connection to softwareupdateservicesd."), v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);
    -[SUManagerClient _invalidateConnection](v2, "_invalidateConnection");
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.softwareupdateservicesd"), 4096);
    serverConnection = v2->_serverConnection;
    v2->_serverConnection = (NSXPCConnection *)v10;

    -[NSXPCConnection _setQueue:](v2->_serverConnection, "_setQueue:", v2->_queue);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B64658);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_getAllDeclarationsWithHandler_, 0, 1);

    -[NSXPCConnection setRemoteObjectInterface:](v2->_serverConnection, "setRemoteObjectInterface:", v12);
    v16 = v2->_serverConnection;
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B6B8B0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v16, "setExportedInterface:", v17);

    -[NSXPCConnection setExportedObject:](v2->_serverConnection, "setExportedObject:", v2);
    objc_initWeak(&location, v2);
    v18 = MEMORY[0x24BDAC760];
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __45__SUManagerClient_connectToServerIfNecessary__block_invoke;
    v32[3] = &unk_24CE3D838;
    objc_copyWeak(&v33, &location);
    v19 = (void *)MEMORY[0x212BF6094](v32);
    -[NSXPCConnection setInvalidationHandler:](v2->_serverConnection, "setInvalidationHandler:", v19);
    v20 = v2->_serverConnection;
    v29[0] = v18;
    v29[1] = 3221225472;
    v29[2] = __45__SUManagerClient_connectToServerIfNecessary__block_invoke_2;
    v29[3] = &unk_24CE3D860;
    objc_copyWeak(&v31, &location);
    v21 = v19;
    v30 = v21;
    -[NSXPCConnection setInterruptionHandler:](v20, "setInterruptionHandler:", v29);
    -[NSXPCConnection activate](v2->_serverConnection, "activate");
    -[SUManagerClient _setClientType](v2, "_setClientType");
    *(_WORD *)&v2->_connected = 1;
    SULogDebug(CFSTR("Client <%p>: connection established to softwareupdateservicesd."), v22, v23, v24, v25, v26, v27, v28, (uint64_t)v2);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);

  }
  objc_sync_exit(v2);

}

void __45__SUManagerClient_connectToServerIfNecessary__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;

  v9 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v19 = objc_loadWeakRetained(v9);
    objc_msgSend(v19, "queue");
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v18);

    objc_msgSend(v19, "noteConnectionDropped");
  }
  else
  {
    SULogDebug(CFSTR("weakSelf is gone..."), v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

uint64_t __45__SUManagerClient_connectToServerIfNecessary__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  SULogDebug(CFSTR("Client <%p>: softwareupdateservicesd exit detected."), v3, v4, v5, v6, v7, v8, v9, (uint64_t)WeakRetained);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)noteConnectionDropped
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SUDescriptor *installDescriptor;
  void *v10;
  SUManagerClient *obj;

  SULogDebug(CFSTR("Client <%p>: disconnected from softwareupdateservicesd."), (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self);
  if (self->_installing)
  {
    installDescriptor = self->_installDescriptor;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 37, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagerClient installDidFail:withError:](self, "installDidFail:withError:", installDescriptor, v10);

  }
  obj = self;
  objc_sync_enter(obj);
  obj->_connected = 0;
  objc_sync_exit(obj);

}

- (void)noteServerExiting
{
  self->_serverIsExiting = 1;
}

- (void)scanRequestDidStartForOptions:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:scanRequestDidStartForOptions:", self, v10);

    }
  }

}

- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  char v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  -[SUManagerClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "client:scanRequestDidFinishForOptions:results:error:", self, v16, v8, v9);

    }
  }

}

- (void)scanDidCompleteForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  char v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  -[SUManagerClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "client:scanRequestDidFinishForOptions:results:error:", self, v16, v8, v9);

    }
  }

}

- (void)scanRequestDidFinishForOptions:(id)a3 update:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  char v14;
  id v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  -[SUManagerClient queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v12 = WeakRetained;
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = objc_opt_respondsToSelector();

    if ((v14 & 1) != 0)
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "client:scanRequestDidFinishForOptions:update:error:", self, v16, v8, v9);

    }
  }

}

- (void)scanDidCompleteWithNewUpdateAvailable:(id)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SUManagerClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "client:scanDidCompleteWithNewUpdateAvailable:error:", self, v13, v6);

    }
  }

}

- (void)automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SUManagerClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "client:automaticDownloadDidFailToStartForNewUpdateAvailable:withError:", self, v13, v6);

    }
  }

}

- (void)downloadDidStart:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUManagerClient _invalidateAllInstallationConstraintObserversForDownload](self, "_invalidateAllInstallationConstraintObserversForDownload");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:downloadDidStart:", self, v10);

    }
  }

}

- (void)downloadProgressDidChange:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:downloadProgressDidChange:", self, v10);

    }
  }

}

- (void)downloadDidFail:(id)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SUManagerClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerClient _invalidateAllInstallationConstraintObserversForDownload](self, "_invalidateAllInstallationConstraintObserversForDownload");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "client:downloadDidFail:withError:", self, v13, v6);

    }
  }

}

- (void)downloadDidFinish:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUManagerClient _invalidateAllInstallationConstraintObserversForDownload](self, "_invalidateAllInstallationConstraintObserversForDownload");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:downloadDidFinish:", self, v10);

    }
  }

}

- (void)downloadDidFinish:(id)a3 withInstallPolicy:(id)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  id v9;
  char v10;
  id v11;
  id v12;
  char v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[SUManagerClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUManagerClient _invalidateAllInstallationConstraintObserversForDownload](self, "_invalidateAllInstallationConstraintObserversForDownload");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    v12 = v11;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v11, "client:downloadDidFinish:withInstallPolicy:", self, v14, v6);
LABEL_6:

      goto LABEL_7;
    }
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "client:downloadDidFinish:", self, v14);
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (void)downloadWasInvalidatedForNewUpdatesAvailable:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  void *v14;
  id v15;

  v15 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUManagerClient _invalidateAllInstallationConstraintObserversForDownload](self, "_invalidateAllInstallationConstraintObserversForDownload");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:downloadWasInvalidatedForNewUpdatesAvailable:", self, v15);
LABEL_7:

      goto LABEL_8;
    }
  }
  v10 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v10)
  {
    v11 = v10;
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "preferredDescriptor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "client:downloadWasInvalidatedForNewUpdateAvailable:", self, v14);

      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)downloadWasInvalidatedForNewUpdateAvailable:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUManagerClient _invalidateAllInstallationConstraintObserversForDownload](self, "_invalidateAllInstallationConstraintObserversForDownload");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:downloadWasInvalidatedForNewUpdateAvailable:", self, v10);

    }
  }

}

- (void)clearingSpaceForDownload:(id)a3 clearing:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[SUManagerClient queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "client:clearingSpaceForDownload:clearingSpace:", self, v12, v4);

    }
  }

}

- (void)userWantsToDeferInstall
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  -[SUManagerClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "userWantsToDeferInstall:", self);

    }
  }
}

- (void)installWantsToStart:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SUManagerClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "client:installWantsToStart:completion:", self, v13, v6);

    }
  }

}

- (void)installDidStart:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  self->_installing = 1;
  -[SUManagerClient setInstallDescriptor:](self, "setInstallDescriptor:", v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:installDidStart:", self, v10);

    }
  }

}

- (void)installDidFail:(id)a3 withError:(id)a4
{
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[SUManagerClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  self->_installing = 0;
  -[SUManagerClient setInstallDescriptor:](self, "setInstallDescriptor:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "client:installDidFail:withError:", self, v13, v6);

    }
  }

}

- (void)installDidFinish:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  self->_installing = 0;
  -[SUManagerClient setInstallDescriptor:](self, "setInstallDescriptor:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:installDidFinish:", self, v10);

    }
  }

}

- (void)installPolicyDidChange:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:installPolicyDidChange:", self, v10);

    }
  }

}

- (void)deviceBootedAfterSplatUpdate
{
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;

  -[SUManagerClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "deviceBootedAfterSplatOnlyUpdate:", self);

    }
  }
}

- (void)managedInstallationRequested:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  id v14;
  char v15;
  id v16;
  id v17;

  v17 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v13 = WeakRetained;
    v14 = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "client:managedInstallationRequested:", self, v17);

    }
  }

}

- (void)handleUIForDDMDeclaration:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "client:handleUIForDDMDeclaration:", self, v9);

    }
  }

}

- (void)handleUIForDDMGlobalSettings:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "client:handleUIForDDMGlobalSettings:", self, v9);

    }
  }

}

- (void)rollbackReadyToStart:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v14, "client:rollbackReadyToStart:options:completion:", self, v15, v8, v9);

    }
  }

}

- (void)rollbackDidStart:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "client:rollbackDidStart:", self, v9);

    }
  }

}

- (void)rollbackDidFail:(id)a3 withError:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v11, "client:rollbackDidFail:withError:", self, v12, v6);

    }
  }

}

- (void)rollbackDidFinish:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "client:rollbackDidFinish:", self, v9);

    }
  }

}

- (void)rollbackReadyForReboot:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      v8 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v8, "client:scheduledRollbackReadyForReboot:", self, v9);

    }
  }

}

- (void)deviceBootedAfterRollback:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "deviceBootedAfterSplatOnlyRollback:rollbackDescriptor:", self, v10);

    }
  }

}

- (void)rollbackSuggested:(id)a3 info:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  id v16;
  char v17;
  id v18;
  id v19;

  v19 = a3;
  v6 = a4;
  SULogInfo(CFSTR("rollbackSuggested with info: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v15 = WeakRetained;
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "client:rollbackSuggested:info:", self, v19, v6);

    }
  }

}

- (void)installTonightScheduled:(BOOL)a3 operationID:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  id v11;

  v4 = a3;
  v11 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "client:installTonightScheduled:operationID:", self, v4, v11);

    }
  }

}

- (void)autoInstallOperationWasCancelled:(id)a3
{
  NSMutableDictionary *installOperationIDsToOperationHandler;
  void *v5;
  id v6;

  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  objc_msgSend(a3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](installOperationIDsToOperationHandler, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "_noteAutoInstallOperationWasCancelled");
    -[SUManagerClient _unregisterAutoInstallOperationClientHandler:](self, "_unregisterAutoInstallOperationClientHandler:", v6);
  }

}

- (void)autoInstallOperationDidExpire:(id)a3 withError:(id)a4
{
  NSMutableDictionary *installOperationIDsToOperationHandler;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  objc_msgSend(a3, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](installOperationIDsToOperationHandler, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "_noteAutoInstallOperationDidExpireWithError:", v9);
    -[SUManagerClient _unregisterAutoInstallOperationClientHandler:](self, "_unregisterAutoInstallOperationClientHandler:", v8);
  }

}

- (void)autoInstallOperationDidConsent:(id)a3
{
  NSMutableDictionary *installOperationIDsToOperationHandler;
  void *v4;
  void *v5;
  id v6;

  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](installOperationIDsToOperationHandler, "objectForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(v6, "_noteAutoInstallOperationDidConsent");
    v5 = v6;
  }

}

- (void)autoInstallOperationIsReadyToInstall:(id)a3 withResult:(id)a4
{
  NSMutableDictionary *installOperationIDsToOperationHandler;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  objc_msgSend(a3, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](installOperationIDsToOperationHandler, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "_noteAutoInstallOperationIsReadyToInstall:", v9);

}

- (void)autoInstallOperationPasscodePolicyChanged:(id)a3 passcodePolicyType:(unint64_t)a4
{
  NSMutableDictionary *installOperationIDsToOperationHandler;
  void *v6;
  void *v7;
  id v8;

  installOperationIDsToOperationHandler = self->_installOperationIDsToOperationHandler;
  objc_msgSend(a3, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](installOperationIDsToOperationHandler, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(v8, "_noteAutoInstallOperationPasscodePolicyChanged:", a4);
    v7 = v8;
  }

}

- (void)presentingRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;
  void *v7;
  id v8;
  char v9;
  id v10;
  id v11;

  v4 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      v10 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v10, "client:presentingRecommendedUpdate:shouldPresent:", self, v11, v4);

    }
  }

}

- (void)inUserInteraction:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  -[SUManagerClient queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      v9 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "client:inUserInteraction:", self, v10);

    }
  }

}

- (void)resetState
{
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __29__SUManagerClient_resetState__block_invoke;
  v3[3] = &unk_24CE3CA78;
  v3[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetState");

}

void __29__SUManagerClient_resetState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient resetState]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (id)rvGetCurrentNeRDInfo
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__15;
  v21 = __Block_byref_object_dispose__15;
  v11 = MEMORY[0x24BDAC760];
  v22 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __39__SUManagerClient_rvGetCurrentNeRDInfo__block_invoke;
  v16[3] = &unk_24CE3CA78;
  v16[4] = self;
  -[SUManagerClient _remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:](self, "_remoteSynchronousInterfaceWithErrorHandler:connectIfNecessary:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __39__SUManagerClient_rvGetCurrentNeRDInfo__block_invoke_2;
  v15[3] = &unk_24CE3D888;
  v15[4] = &v17;
  objc_msgSend(v12, "rvGetCurrentNeRDInfoWithReply:", v15);

  v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __39__SUManagerClient_rvGetCurrentNeRDInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v13 = v3;
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient rvGetCurrentNeRDInfo]_block_invoke");
    objc_msgSend(v13, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v3 = v13;
      goto LABEL_9;
    }
    if (objc_msgSend(v13, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v12 = objc_msgSend(v13, "code");

    v3 = v13;
    if (v12 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

void __39__SUManagerClient_rvGetCurrentNeRDInfo__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  if (a3)
    SULogError(CFSTR("Error while calling rvGetCurrentNeRDInfo: %@"), v6, v7, v8, v9, v10, v11, v12, a3);
  else
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (void)rvTriggerNeRDUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  -[SUManagerClient _bundleIdentifier](self, "_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("Client \"%@\" called %s"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __39__SUManagerClient_rvTriggerNeRDUpdate___block_invoke;
  v14[3] = &unk_24CE3CA78;
  v14[4] = self;
  -[SUManagerClient _remoteInterfaceWithErrorHandler:](self, "_remoteInterfaceWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rvTriggerNeRDUpdate:", v4);

}

void __39__SUManagerClient_rvTriggerNeRDUpdate___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v11 = v14;
  if (v14)
  {
    SULogDebug(CFSTR("%s failed - connection interrupted: %@ error: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerClient rvTriggerNeRDUpdate:]_block_invoke");
    objc_msgSend(v14, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {

LABEL_8:
      v11 = v14;
      goto LABEL_9;
    }
    if (objc_msgSend(v14, "code") == 4097)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "_invalidateConnection");
      goto LABEL_8;
    }
    v13 = objc_msgSend(v14, "code");

    v11 = v14;
    if (v13 == 4099)
      goto LABEL_7;
  }
LABEL_9:

}

- (SUManagerClientDelegate)delegate
{
  return (SUManagerClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int)clientType
{
  return self->_clientType;
}

- (SUDescriptor)installDescriptor
{
  return self->_installDescriptor;
}

- (void)setInstallDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_installDescriptor, a3);
}

- (SUDescriptor)scanDescriptor
{
  return self->_scanDescriptor;
}

- (void)setScanDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_scanDescriptor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_installationConstraintObservers, 0);
  objc_storeStrong((id *)&self->_installOperationIDsToOperationHandler, 0);
  objc_storeStrong((id *)&self->_scanDescriptor, 0);
  objc_storeStrong((id *)&self->_installDescriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end
