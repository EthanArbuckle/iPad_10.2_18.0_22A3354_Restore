@implementation SUManagerServer

+ (id)sharedInstance
{
  if (sharedInstance_pred_0 != -1)
    dispatch_once(&sharedInstance_pred_0, &__block_literal_global_6);
  return (id)sharedInstance___instance_1;
}

void __33__SUManagerServer_sharedInstance__block_invoke()
{
  SUManagerServer *v0;
  void *v1;

  v0 = objc_alloc_init(SUManagerServer);
  v1 = (void *)sharedInstance___instance_1;
  sharedInstance___instance_1 = (uint64_t)v0;

}

- (SUManagerServer)init
{
  SUManagerServer *v2;
  NSMutableArray *v3;
  NSMutableArray *clients;
  dispatch_queue_t v5;
  OS_dispatch_queue *clientQueue;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUManagerServer;
  v2 = -[SUManagerServer init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    clients = v2->_clients;
    v2->_clients = v3;

    v5 = dispatch_queue_create("com.apple.softwareupdateservicesd.clientQueue", 0);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v5;

    +[SUState currentState](SUState, "currentState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_underExclusiveControl = objc_msgSend(v7, "underExclusiveControl");

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__clientMessagabilityDidChange_, CFSTR("SUClientMessagabilityChangedNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel__clientForegroundnessDidChange_, CFSTR("SUClientForegroundnessChangedNotification"), 0);

  }
  return v2;
}

- (id)manager
{
  SUManagerInterface *manager;
  SUManagerInterface *v4;
  SUManagerInterface *v5;

  manager = self->_manager;
  if (!manager)
  {
    +[SUManagerInterfaceFactory sharedInstance](SUManagerInterfaceFactory, "sharedInstance");
    v4 = (SUManagerInterface *)objc_claimAutoreleasedReturnValue();
    v5 = self->_manager;
    self->_manager = v4;

    -[SUManagerInterface setDelegate:](self->_manager, "setDelegate:", self);
    -[SUManagerInterface addObserver:](self->_manager, "addObserver:", self);
    manager = self->_manager;
  }
  return manager;
}

- (id)autoInstallManager
{
  SUAutoInstallManager *autoInstallManager;
  SUAutoInstallManager *v4;
  void *v5;
  SUAutoInstallManager *v6;
  SUAutoInstallManager *v7;

  autoInstallManager = self->_autoInstallManager;
  if (!autoInstallManager)
  {
    v4 = [SUAutoInstallManager alloc];
    -[SUManagerServer manager](self, "manager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUAutoInstallManager initWithManager:](v4, "initWithManager:", v5);
    v7 = self->_autoInstallManager;
    self->_autoInstallManager = v6;

    -[SUAutoInstallManager setDelegate:](self->_autoInstallManager, "setDelegate:", self);
    autoInstallManager = self->_autoInstallManager;
  }
  return autoInstallManager;
}

- (id)coreAnalyticsManager
{
  return +[SUAnalyticsManager sharedManager](SUAnalyticsManager, "sharedManager");
}

- (id)ddmManager
{
  SUDDMManager *ddmManager;
  SUDDMManager *v4;
  SUDDMManager *v5;

  ddmManager = self->_ddmManager;
  if (!ddmManager)
  {
    v4 = -[SUDDMManager initWithDelegate:]([SUDDMManager alloc], "initWithDelegate:", self);
    v5 = self->_ddmManager;
    self->_ddmManager = v4;

    ddmManager = self->_ddmManager;
  }
  return ddmManager;
}

- (void)dealloc
{
  void *v3;
  OS_dispatch_queue *clientQueue;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  clientQueue = self->_clientQueue;
  self->_clientQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)SUManagerServer;
  -[SUManagerServer dealloc](&v5, sel_dealloc);
}

- (void)runOnClients:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)runOnClientsUntilStop:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, char *))a3;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
      if (v14)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)handleClientRequest:(const char *)a3 client:(id)a4 withRequestCallBack:(id)a5 withErrorCallBack:(id)a6
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(void);

  v15 = (void (**)(void))a5;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("client %@ called %s"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

  v15[2]();
}

- (void)isScanning:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SUManagerServer_isScanning___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __30__SUManagerServer_isScanning___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SUManagerServer_isScanning___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __30__SUManagerServer_isScanning___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isScanning:]_block_invoke", v3, v7, v5);

}

uint64_t __30__SUManagerServer_isScanning___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isScanning");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, 0);
  return result;
}

uint64_t __30__SUManagerServer_isScanning___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)scanForUpdates:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __45__SUManagerServer_scanForUpdates_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __45__SUManagerServer_scanForUpdates_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SUManagerServer_scanForUpdates_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __45__SUManagerServer_scanForUpdates_withResult___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer scanForUpdates:withResult:]_block_invoke", v8, v7, v5);

}

void __45__SUManagerServer_scanForUpdates_withResult___block_invoke_2(id *a1)
{
  void (**v2)(id, _QWORD, id);
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (objc_msgSend(a1[4], "mdmCommandConflictsWithDDM:", a1[5]))
  {
    v2 = (void (**)(id, _QWORD, id))a1[7];
    objc_msgSend(a1[4], "_mdmCommandConflictsWithDDMError");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v2[2](v2, 0, v9);

  }
  else
  {
    objc_msgSend(a1[5], "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(a1[6], "clientName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(a1[5], "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "setClientName:", v6);

      }
    }
    objc_msgSend(a1[4], "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __45__SUManagerServer_scanForUpdates_withResult___block_invoke_3;
    v10[3] = &unk_24CE3C190;
    v8 = a1[6];
    v11 = a1[7];
    objc_msgSend(v7, "scanForUpdates:complete:", v8, v10);

  }
}

uint64_t __45__SUManagerServer_scanForUpdates_withResult___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __45__SUManagerServer_scanForUpdates_withResult___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)autoScanAndDownloadIfAvailable:(id)a3
{
  -[SUManagerServer autoScanAndDownloadNow:ifAvailable:](self, "autoScanAndDownloadNow:ifAvailable:", 1, a3);
}

- (void)autoScanAndDownloadNow:(BOOL)a3 ifAvailable:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke;
  v11[3] = &unk_24CE3C208;
  v11[4] = self;
  v12 = v7;
  v14 = a3;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

}

void __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_2;
  v7[3] = &unk_24CE3C1E0;
  v7[4] = v2;
  v9 = *(_BYTE *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer autoScanAndDownloadNow:ifAvailable:]_block_invoke", v3, v7, v5);

}

void __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_3;
  v4[3] = &unk_24CE3C190;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "autoScanAndDownloadIfAvailable:downloadNow:withResult:", 0, v3, v4);

}

uint64_t __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __54__SUManagerServer_autoScanAndDownloadNow_ifAvailable___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)descriptors:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SUManagerServer_descriptors___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __31__SUManagerServer_descriptors___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__SUManagerServer_descriptors___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __31__SUManagerServer_descriptors___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer descriptors:]_block_invoke", v3, v7, v5);

}

void __31__SUManagerServer_descriptors___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SUScanResults *v7;
  SUScanResults *v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLastScannedDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alternateLastScannedDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SUScanResults initWithPreferredDescriptor:alternateDescriptor:]([SUScanResults alloc], "initWithPreferredDescriptor:alternateDescriptor:", v11, v6);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
  {
    if (v7)
    {
      (*(void (**)(uint64_t, SUScanResults *, _QWORD))(v9 + 16))(v9, v7, 0);
    }
    else
    {
      +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    }
  }

}

uint64_t __31__SUManagerServer_descriptors___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)descriptor:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SUManagerServer_descriptor___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __30__SUManagerServer_descriptor___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SUManagerServer_descriptor___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __30__SUManagerServer_descriptor___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer descriptor:]_block_invoke", v3, v7, v5);

}

void __30__SUManagerServer_descriptor___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLastScannedDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    if (v6)
    {
      (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v6, 0);
    }
    else
    {
      +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, 0, v5);

    }
  }

}

uint64_t __30__SUManagerServer_descriptor___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isClearingSpaceForDownload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUManagerServer_isClearingSpaceForDownload___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __46__SUManagerServer_isClearingSpaceForDownload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SUManagerServer_isClearingSpaceForDownload___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __46__SUManagerServer_isClearingSpaceForDownload___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isClearingSpaceForDownload:]_block_invoke", v3, v7, v5);

}

uint64_t __46__SUManagerServer_isClearingSpaceForDownload___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClearingSpace");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, 0);
  return result;
}

uint64_t __46__SUManagerServer_isClearingSpaceForDownload___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isDownloading:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUManagerServer_isDownloading___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __33__SUManagerServer_isDownloading___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUManagerServer_isDownloading___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __33__SUManagerServer_isDownloading___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isDownloading:]_block_invoke", v3, v7, v5);

}

uint64_t __33__SUManagerServer_isDownloading___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDownloading");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, 0);
  return result;
}

uint64_t __33__SUManagerServer_isDownloading___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)startDownload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUManagerServer_startDownload___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __33__SUManagerServer_startDownload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUManagerServer_startDownload___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __33__SUManagerServer_startDownload___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer startDownload:]_block_invoke", v8, v7, v5);

}

void __33__SUManagerServer_startDownload___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDownload:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __33__SUManagerServer_startDownload___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)startDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer startDownloadWithOptions:withResult:]_block_invoke", v8, v7, v5);

}

void __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 48), "clientName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setClientName:", v6);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDownloadWithOptions:withResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __55__SUManagerServer_startDownloadWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)startDownloadWithMetadata:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer startDownloadWithMetadata:withResult:]_block_invoke", v8, v7, v5);

}

void __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDownloadWithMetadata:withResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __56__SUManagerServer_startDownloadWithMetadata_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)cancelDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer cancelDownloadWithOptions:withResult:]_block_invoke", v8, v7, v5);

}

void __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelDownloadWithOptions:withResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __56__SUManagerServer_cancelDownloadWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)purgeDownloadWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer purgeDownloadWithOptions:withResult:]_block_invoke", v8, v7, v5);

}

void __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "purgeDownloadWithOptions:withResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __55__SUManagerServer_purgeDownloadWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)pauseDownload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUManagerServer_pauseDownload___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __33__SUManagerServer_pauseDownload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUManagerServer_pauseDownload___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __33__SUManagerServer_pauseDownload___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer pauseDownload:]_block_invoke", v8, v7, v5);

}

void __33__SUManagerServer_pauseDownload___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseDownload:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __33__SUManagerServer_pauseDownload___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)resumeDownload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__SUManagerServer_resumeDownload___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __34__SUManagerServer_resumeDownload___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__SUManagerServer_resumeDownload___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __34__SUManagerServer_resumeDownload___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer resumeDownload:]_block_invoke", v8, v7, v5);

}

void __34__SUManagerServer_resumeDownload___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resumeDownload:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __34__SUManagerServer_resumeDownload___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)updateDownloadMetadata:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer updateDownloadMetadata:withResult:]_block_invoke", v8, v7, v5);

}

void __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateDownloadMetadata:withResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __53__SUManagerServer_updateDownloadMetadata_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)updateDownloadOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer updateDownloadOptions:withResult:]_block_invoke", v8, v7, v5);

}

void __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 48), "clientName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setClientName:", v6);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateDownloadOptions:withResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __52__SUManagerServer_updateDownloadOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)downloadAndInstallState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_downloadAndInstallState___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __43__SUManagerServer_downloadAndInstallState___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SUManagerServer_downloadAndInstallState___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v4;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __43__SUManagerServer_downloadAndInstallState___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer downloadAndInstallState:]_block_invoke", v8, v7, v5);

}

void __43__SUManagerServer_downloadAndInstallState___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v2 + 16))(v2, 0, 0, 0, v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "download");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "installPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "autoInstallManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentAutoInstallOperationCreatingIfNecessary:error:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
      (*(void (**)(uint64_t, id, void *, void *, _QWORD))(v8 + 16))(v8, v9, v5, v7, 0);

  }
}

uint64_t __43__SUManagerServer_downloadAndInstallState___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, 0, a2);
  return result;
}

- (void)updatesDownloadableWithOptions:(id)a3 alternateDownloadOptions:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke;
  block[3] = &unk_24CE3C230;
  block[4] = self;
  v18 = v11;
  v20 = v9;
  v21 = v10;
  v19 = v8;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  v16 = v11;
  dispatch_async(v12, block);

}

void __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2;
  v7[3] = &unk_24CE3C230;
  v7[4] = v4;
  v8 = v3;
  v11 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 64);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:]_block_invoke", v8, v7, v5);

}

void __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(*(id *)(a1 + 48), "clientName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setClientName:", v5);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updatesDownloadableWithOptions:alternateDownloadOptions:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }

}

uint64_t __88__SUManagerServer_updatesDownloadableWithOptions_alternateDownloadOptions_replyHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(result + 16))(result, 0, 0, a2, a2);
  return result;
}

- (void)deviceHasSufficientSpaceForDownloads:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer deviceHasSufficientSpaceForDownloads:]_block_invoke", v3, v7, v5);

}

void __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_3;
  v2[3] = &unk_24CE3C258;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "deviceHasSufficientSpaceForDownloadsIncludeAppPurging:replyHandler:", 1, v2);

}

void __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const __CFString *v19;
  uint64_t v20;
  id v21;

  v21 = a6;
  v18 = a7;
  if ((_DWORD)a2)
    v19 = &stru_24CE3EA48;
  else
    v19 = CFSTR(" not");
  SULogInfo(CFSTR("device does%@ have enough space for preferred update download, and does%@ have enough space for alternate update download"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v19);
  v20 = *(_QWORD *)(a1 + 32);
  if (v20)
    (*(void (**)(uint64_t, uint64_t, uint64_t, id, id))(v20 + 16))(v20, a2, a3, v21, v18);

}

uint64_t __56__SUManagerServer_deviceHasSufficientSpaceForDownloads___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(result + 16))(result, 0, 0, a2, a2);
  return result;
}

- (void)deviceHasSufficientSpaceForDownload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer deviceHasSufficientSpaceForDownload:]_block_invoke", v3, v7, v5);

}

void __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_3;
  v2[3] = &unk_24CE3C280;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "deviceHasSufficientSpaceForDownloadIncludeAppPurging:replyHandler:", 1, v2);

}

void __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  id v16;

  v6 = a4;
  v14 = CFSTR(" not");
  if ((_DWORD)a2)
    v14 = &stru_24CE3EA48;
  v16 = v6;
  SULogInfo(CFSTR("device does%@ have enough space for download"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v14);
  v15 = *(_QWORD *)(a1 + 32);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, id))(v15 + 16))(v15, a2, v16);

}

uint64_t __55__SUManagerServer_deviceHasSufficientSpaceForDownload___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)extraSpaceNeededForDownloadWithoutAppPurging:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer extraSpaceNeededForDownloadWithoutAppPurging:]_block_invoke", v3, v7, v5);

}

void __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_3;
  v2[3] = &unk_24CE3C280;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "deviceHasSufficientSpaceForDownloadIncludeAppPurging:replyHandler:", 0, v2);

}

uint64_t __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  return result;
}

uint64_t __64__SUManagerServer_extraSpaceNeededForDownloadWithoutAppPurging___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isSoftwareUpdateInProgress:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v11 = a3;
  if (v11)
  {
    -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke;
    block[3] = &unk_24CE3B6B0;
    block[4] = self;
    v16 = v12;
    v17 = v11;
    v14 = v12;
    dispatch_async(v13, block);

  }
  else
  {
    SULogError(CFSTR("%s: No reply handler provided"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerServer isSoftwareUpdateInProgress:]");
  }

}

void __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isSoftwareUpdateInProgress:]_block_invoke", v3, v7, v5);

}

uint64_t __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "download");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __46__SUManagerServer_isSoftwareUpdateInProgress___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDDMStatusWithKeys:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Getting DDM status"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getDDMStatusWithKeys:completion:]");

  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke;
  block[3] = &unk_24CE3C2A8;
  block[4] = self;
  v22 = v15;
  v23 = v6;
  v24 = v7;
  v17 = v7;
  v18 = v6;
  v19 = v15;
  dispatch_async(v16, block);

}

void __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getDDMStatusWithKeys:completion:]_block_invoke", v3, v7, v5);

}

uint64_t __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getDDMStatusWithKeys:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __51__SUManagerServer_getDDMStatusWithKeys_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)_getDDMStatusWithKeys:(id)a3 withResult:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**v39)(id, void *, _QWORD);
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v39 = (void (**)(id, void *, _QWORD))a4;
  -[SUManagerServer ddmManager](self, "ddmManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeDDMDeclarationEnfrocedSU");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerServer manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDownloading");

  -[SUManagerServer manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "download");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "progress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isDone");

  -[SUManagerServer manager](self, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isInstalling");

  -[SUManagerServer manager](self, "manager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "download");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "descriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  v20 = CFSTR("none");
  if (v8)
    v20 = CFSTR("downloading");
  if (v12)
    v20 = CFSTR("prepared");
  if (v14)
    v21 = CFSTR("installing");
  else
    v21 = v20;
  objc_msgSend(v18, "setSafeObject:forKey:", v21, *MEMORY[0x24BEAE8A0]);
  objc_msgSend(v17, "productVersion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isSplatOnly"))
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v17, "productVersionExtra");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("%@ %@"), v22, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v22 = (void *)v25;
  }
  if (!v22)
  {
    objc_msgSend(v6, "versionString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v26 = *MEMORY[0x24BEAE8A8];
  objc_msgSend(v19, "setSafeObject:forKey:", v22, *MEMORY[0x24BEAE8A8]);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "productBuildVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSafeObject:forKey:", v28, *MEMORY[0x24BEAE960]);

  objc_msgSend(v17, "productVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSafeObject:forKey:", v29, *MEMORY[0x24BEAE988]);

  objc_msgSend(v6, "enforcedInstallDate");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "description");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *MEMORY[0x24BEAE8B0];
  objc_msgSend(v27, "setSafeObject:forKey:", v31, *MEMORY[0x24BEAE8B0]);

  objc_msgSend(v19, "setSafeObject:forKey:", v27, v26);
  objc_msgSend(v6, "enforcedInstallDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "description");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSafeObject:forKey:", v34, v32);

  +[SUState currentState](SUState, "currentState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "ddmPersistedError");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    v40 = *MEMORY[0x24BEAE968];
    v41[0] = &unk_24CE6E040;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "setSafeObject:forKey:", v36, *MEMORY[0x24BEAE890]);
  -[SUManagerServer _installReasons](self, "_installReasons");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v37, *MEMORY[0x24BEAE898]);

  v38 = (void *)objc_msgSend(v19, "copy");
  v39[2](v39, v38, 0);

}

- (id)_installReasons
{
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
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUManagerServer manager](self, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "installPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerServer manager](self, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "download");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloadOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerServer manager](self, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v9, "isInstalling");

  if ((_DWORD)v7)
  {
    objc_msgSend(v5, "clientName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v5;
LABEL_9:
      objc_msgSend(v11, "clientName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUManagerServer installReasonForClientName:](self, "installReasonForClientName:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
        objc_msgSend(v3, "addObject:", v16);

      goto LABEL_12;
    }
  }
  if (objc_msgSend(v8, "isAutoDownload"))
  {
    -[SUManagerServer autoInstallManager](self, "autoInstallManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAutoUpdateEnabled");

    if (v13)
      objc_msgSend(v3, "addObject:", CFSTR("auto-update"));
  }
  objc_msgSend(v8, "clientName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v11 = v8;
    goto LABEL_9;
  }
LABEL_12:
  -[SUManagerServer manager](self, "manager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isInstallTonight");

  if (v18)
    objc_msgSend(v3, "addObject:", CFSTR("install-tonight"));
  -[SUManagerServer ddmManager](self, "ddmManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "activeDDMDeclarationEnfrocedSU");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v3, "addObject:", CFSTR("declaration"));
  v24 = *MEMORY[0x24BEAE970];
  objc_msgSend(v3, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)installReasonForClientName:(id)a3
{
  id v4;
  const __CFString *v5;
  void *v7;
  char v8;
  void *v9;
  int v10;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) != 0)
  {
    v5 = CFSTR("system-settings");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SoftwareUpdateServicesUI.iOSPlugin")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.susuiservice.SUSUInstallAlertCFUserNotificationUIExtension")) & 1) != 0|| (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SoftwareUpdateServices.SUSFollowUpExtension")) & 1) != 0)
  {
    v5 = CFSTR("notification");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.purplebuddy")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.SetupAssistant")) & 1) != 0
         || (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.migrationpluginwrapper")) & 1) != 0)
  {
    v5 = CFSTR("setup-assistant");
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("dmd")) & 1) != 0)
  {
    v5 = CFSTR("mdm");
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.softwareupdateservicesd")))
  {
    -[SUManagerServer autoInstallManager](self, "autoInstallManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isAutoUpdateEnabled");

    if ((v8 & 1) != 0)
    {
      v5 = CFSTR("auto-update");
    }
    else
    {
      -[SUManagerServer manager](self, "manager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isInstallTonight");

      if (v10)
        v5 = CFSTR("install-tonight");
      else
        v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

- (BOOL)mdmCommandConflictsWithDDM:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("dmd"));
  if (v5)
  {
    -[SUManagerServer ddmManager](self, "ddmManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeDDMDeclarationEnfrocedSU");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MDM command conflicts with DDM"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer mdmCommandConflictsWithDDM:]");
  }

  return v5;
}

- (id)_mdmCommandConflictsWithDDMError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v10[0] = CFSTR("Rejecting MDM command for updates because an existing declaration is in place");
  v3 = *MEMORY[0x24BDD0FC8];
  v9[0] = *MEMORY[0x24BDD0BA0];
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServices.framework"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SU_MDM_CONFLICTS_WITH_DDM_ERROR"), &stru_24CE3EA48, CFSTR("SoftwareUpdateServices"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("com.apple.softwareupdateservices.errors"), 103, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)cancelDDMDeclaration:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "declarationKey");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUManagerServer cancelDDMDeclarationForKey:completion:](self, "cancelDDMDeclarationForKey:completion:", v7, v6);

}

- (void)cancelDDMDeclarationForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("in SUManagerServer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer cancelDDMDeclarationForKey:completion:]");

  if (v7)
    v15 = v7;
  else
    v15 = &__block_literal_global_277;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_2;
  block[3] = &unk_24CE3C2A8;
  block[4] = self;
  v23 = v16;
  v24 = v6;
  v25 = v15;
  v18 = v15;
  v19 = v6;
  v20 = v16;
  dispatch_async(v17, block);

}

void __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_3;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer cancelDDMDeclarationForKey:completion:]_block_invoke_2", v3, v7, v5);

}

void __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = 0;
  objc_msgSend(v2, "cancelDDMDeclarationForKey:outError:", v3, &v5);
  v4 = v5;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __57__SUManagerServer_cancelDDMDeclarationForKey_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleDDMDeclaration:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD block[5];
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("in SUManagerServer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer handleDDMDeclaration:withResult:]");

  if (v7)
    v15 = v7;
  else
    v15 = &__block_literal_global_278;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_2;
  block[3] = &unk_24CE3C2A8;
  block[4] = self;
  v23 = v16;
  v24 = v6;
  v25 = v15;
  v18 = v15;
  v19 = v6;
  v20 = v16;
  dispatch_async(v17, block);

}

void __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_3;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer handleDDMDeclaration:withResult:]_block_invoke_2", v3, v7, v5);

}

uint64_t __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "handleDDMDeclaration:outError:", v3, &v6);
  v4 = v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return notify_post((const char *)objc_msgSend((id)*MEMORY[0x24BEAE8C8], "UTF8String"));
}

uint64_t __51__SUManagerServer_handleDDMDeclaration_withResult___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDDMDeclarationWithHandler:(id)a3
{
  id v4;
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
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("in SUManagerServer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer getDDMDeclarationWithHandler:]");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No handler given"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUManagerServer getDDMDeclarationWithHandler:]");

    v4 = &__block_literal_global_282;
  }
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_2;
  block[3] = &unk_24CE3B688;
  block[4] = self;
  v24 = v4;
  v20 = v4;
  dispatch_async(v19, block);

}

void __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_clientForCurrentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_3;
  v7[3] = &unk_24CE3B688;
  v4 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v8, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getDDMDeclarationWithHandler:]_block_invoke_2", v2, v7, v5);

}

void __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeDDMDeclarationEnfrocedSU");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v3 = 0;
  }
  else
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 102);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Reporting active declaration to client: %@"), v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerServer getDDMDeclarationWithHandler:]_block_invoke_3");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __48__SUManagerServer_getDDMDeclarationWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getDDMUpdateDescriptorWithHandler:(id)a3
{
  id v4;
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
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD block[5];
  id v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("in SUManagerServer"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfo(CFSTR("[DDM] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer getDDMUpdateDescriptorWithHandler:]");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No handler given"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v12, v13, v14, v15, v16, v17, v18, (uint64_t)"-[SUManagerServer getDDMUpdateDescriptorWithHandler:]");

    v4 = &__block_literal_global_286_0;
  }
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_2;
  block[3] = &unk_24CE3B688;
  block[4] = self;
  v24 = v4;
  v20 = v4;
  dispatch_async(v19, block);

}

void __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_clientForCurrentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_3;
  v7[3] = &unk_24CE3B688;
  v4 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_5;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v8, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getDDMUpdateDescriptorWithHandler:]_block_invoke_2", v2, v7, v5);

}

void __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
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
  _QWORD v13[4];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_4;
    v13[3] = &unk_24CE3C390;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v2, "getDescriptorWithCallback:", v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get a valid ddm manager..."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)"-[SUManagerServer getDDMUpdateDescriptorWithHandler:]_block_invoke_3");

    v10 = *(_QWORD *)(a1 + 40);
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", -1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v10 + 16))(v10, 0, v11);

  }
}

uint64_t __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __53__SUManagerServer_getDDMUpdateDescriptorWithHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAllDeclarationsWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke;
    v6[3] = &unk_24CE3B688;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_clientForCurrentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v4 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v4;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v8, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getAllDeclarationsWithHandler:]_block_invoke", v2, v7, v5);

}

void __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
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
  void *v19;
  void *v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v2;
  if (v2)
  {
    objc_msgSend(v2, "allDeclarations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("declarations = %@"), v3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)"-[SUManagerServer getAllDeclarationsWithHandler:]_block_invoke_2");

    (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to get a valid ddm manager..."));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("[DDM] %s: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)"-[SUManagerServer getAllDeclarationsWithHandler:]_block_invoke_2");

    v18 = *(_QWORD *)(a1 + 40);
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", -1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v3);
  }

}

uint64_t __49__SUManagerServer_getAllDeclarationsWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setDDMGlobalSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke;
  v13[3] = &unk_24CE3C2A8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer setDDMGlobalSettings:completion:]_block_invoke", v3, v7, v5);

}

void __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
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

  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v15 = 0;
  v4 = objc_msgSend(v2, "setDDMGlobalSettings:outError:", v3, &v15);
  v5 = v15;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("setDDMGlobalSettings - result = %d, error = %@"), v4, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUManagerServer setDDMGlobalSettings:completion:]_block_invoke_2");

  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
    (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, v4, v5);

}

uint64_t __51__SUManagerServer_setDDMGlobalSettings_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)getDDMGlobalSettingsWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke;
    block[3] = &unk_24CE3B6B0;
    block[4] = self;
    v16 = v5;
    v17 = v4;
    v7 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No reply handler provided"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    SULogError(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getDDMGlobalSettingsWithHandler:]");
  }

}

void __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getDDMGlobalSettingsWithHandler:]_block_invoke", v3, v7, v5);

}

void __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v2, "getDDMGlobalSettingsWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("getDDMGlobalSettingsWithHandler - globalSettings = %@, error = %@"), v3, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SULogDebug(CFSTR("[DDM] %s: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer getDDMGlobalSettingsWithHandler:]_block_invoke_2");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __51__SUManagerServer_getDDMGlobalSettingsWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke;
    block[3] = &unk_24CE3B6B0;
    block[4] = self;
    v16 = v5;
    v17 = v4;
    v7 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No reply handler provided"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    SULogError(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:]");
  }

}

void __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke_2;
  v8[3] = &unk_24CE3BD58;
  v5 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke_3;
  v6[3] = &unk_24CE3C168;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getShouldDisableAutoInstallIOSUpdatesToggleWithHandler:]_block_invoke", v4, v8, v6);

}

void __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL, _QWORD))(v1 + 16))(v1, objc_msgSend(v2, "alwaysEnableAutoInstallOSUpdates") != 2, 0);

}

uint64_t __74__SUManagerServer_getShouldDisableAutoInstallIOSUpdatesToggleWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke;
    block[3] = &unk_24CE3B6B0;
    block[4] = self;
    v16 = v5;
    v17 = v4;
    v7 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No reply handler provided"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    SULogError(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:]");
  }

}

void __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke_2;
  v8[3] = &unk_24CE3BD58;
  v5 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke_3;
  v6[3] = &unk_24CE3C168;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler:]_block_invoke", v4, v8, v6);

}

void __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL, _QWORD))(v1 + 16))(v1, objc_msgSend(v2, "alwaysEnableAutoDownload") != 2, 0);

}

uint64_t __75__SUManagerServer_getShouldDisableAutoDownloadIOSUpdatesToggleWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getShouldDisableAutoInstallRSRToggleWithHandler:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD block[5];
  id v16;
  id v17;

  v4 = a3;
  if (v4)
  {
    -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke;
    block[3] = &unk_24CE3B6B0;
    block[4] = self;
    v16 = v5;
    v17 = v4;
    v7 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No reply handler provided"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    SULogError(CFSTR("[DDM] %s: %@"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer getShouldDisableAutoInstallRSRToggleWithHandler:]");
  }

}

void __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke_2;
  v8[3] = &unk_24CE3BD58;
  v5 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke_3;
  v6[3] = &unk_24CE3C168;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getShouldDisableAutoInstallRSRToggleWithHandler:]_block_invoke", v4, v8, v6);

}

void __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL, _QWORD))(v1 + 16))(v1, objc_msgSend(v2, "alwaysEnableAutoInstallRapidSecurityResponse") != 2, 0);

}

uint64_t __67__SUManagerServer_getShouldDisableAutoInstallRSRToggleWithHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)deviceHasSufficientSpaceForDownloadsIncludeAppPurging:(BOOL)a3 replyHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;

  v4 = a3;
  v6 = a4;
  -[SUManagerServer manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredLastScannedDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__SUManagerServer_deviceHasSufficientSpaceForDownloadsIncludeAppPurging_replyHandler___block_invoke;
  v11[3] = &unk_24CE3C3E0;
  v13 = v4;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[SUManagerServer deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:replyHandler:](self, "deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:replyHandler:", v4, v9, v11);

}

void __86__SUManagerServer_deviceHasSufficientSpaceForDownloadsIncludeAppPurging_replyHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  char v21;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alternateLastScannedDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(unsigned __int8 *)(a1 + 48);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __86__SUManagerServer_deviceHasSufficientSpaceForDownloadsIncludeAppPurging_replyHandler___block_invoke_2;
  v17[3] = &unk_24CE3C3B8;
  v13 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v19 = v8;
  v20 = v14;
  v21 = a2;
  v18 = v7;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v13, "deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:replyHandler:", v12, v11, v17);

}

uint64_t __86__SUManagerServer_deviceHasSufficientSpaceForDownloadsIncludeAppPurging_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), a2, *(_QWORD *)(a1 + 32), a3, *(_QWORD *)(a1 + 40), a4);
  return result;
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 replyHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v6 = a4;
  -[SUManagerServer manager](self, "manager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "download");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUManagerServer manager](self, "manager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v10, "download");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "descriptor");
  }
  else
  {
    objc_msgSend(v10, "preferredLastScannedDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v11);
  }
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[SUManagerServer deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:replyHandler:](self, "deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:replyHandler:", v4, v12, v6);
}

- (void)deviceHasSufficientSpaceForDownloadIncludeAppPurging:(BOOL)a3 descriptor:(id)a4 replyHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[SUManagerServer manager](self, "manager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceHasSufficientSpaceForDownloadIncludeAppPurging:descriptor:replyHandler:", v6, v9, v8);

}

- (void)isInstallationKeybagRequired:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUManagerServer_isInstallationKeybagRequired___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __48__SUManagerServer_isInstallationKeybagRequired___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SUManagerServer_isInstallationKeybagRequired___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __48__SUManagerServer_isInstallationKeybagRequired___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isInstallationKeybagRequired:]_block_invoke", v3, v7, v5);

}

uint64_t __48__SUManagerServer_isInstallationKeybagRequired___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t result;

  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "download");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "installationKeybagStateForDescriptor:", v5);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL, _QWORD))(result + 16))(result, v6 == 1, 0);
  return result;
}

uint64_t __48__SUManagerServer_isInstallationKeybagRequired___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isInstallationKeybagRequiredForDescriptor:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke;
  v13[3] = &unk_24CE3C2A8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke_2;
  v9[3] = &unk_24CE3B6B0;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 56);
  v7[0] = v2;
  v7[1] = 3221225472;
  v7[2] = __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke_3;
  v7[3] = &unk_24CE3C168;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isInstallationKeybagRequiredForDescriptor:result:]_block_invoke", v4, v9, v7);

}

void __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    v8 = v2;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "manager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "download");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "descriptor");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  +[SUKeybagInterface sharedInstance](SUKeybagInterface, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "installationKeybagStateForDescriptor:", v8);

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, BOOL, _QWORD))(v7 + 16))(v7, v6 == 1, 0);

}

uint64_t __68__SUManagerServer_isInstallationKeybagRequiredForDescriptor_result___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isUpdateReadyForInstallation:(id)a3
{
  -[SUManagerServer isUpdateReadyForInstallationWithOptions:withResult:](self, "isUpdateReadyForInstallationWithOptions:withResult:", 0, a3);
}

- (void)isUpdateReadyForInstallationWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C2A8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_4;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isUpdateReadyForInstallationWithOptions:withResult:]_block_invoke", v3, v7, v5);

}

void __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_3;
  v4[3] = &unk_24CE3C408;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "isUpdateReadyForInstallationWithOptions:withResult:", v3, v4);

}

uint64_t __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

uint64_t __70__SUManagerServer_isUpdateReadyForInstallationWithOptions_withResult___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)installUpdate:(id)a3
{
  -[SUManagerServer installUpdateWithOptions:withResult:](self, "installUpdateWithOptions:withResult:", 0, a3);
}

- (void)installUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer installUpdateWithOptions:withResult:]_block_invoke", v8, v7, v5);

}

void __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  SUInstallOptions *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    v2 = objc_alloc_init(SUInstallOptions);
    v3 = *(void **)(a1 + 48);
    if (v3)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
            if (v9)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (objc_msgSend(v9, "isEqualToString:", CFSTR("SUInstallOptionDarkBoot")))
                {
                  -[SUInstallOptions setDarkBoot:](v2, "setDarkBoot:", 1);
                }
                else if (objc_msgSend(v9, "isEqualToString:", CFSTR("SUInstallOptionRequireUpdate")))
                {
                  -[SUInstallOptions setRequired:](v2, "setRequired:", 1);
                }
              }
            }
            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v6);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUInstallOptions setClientName:](v2, "setClientName:", v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "installUpdateWithInstallOptions:withResult:", v2, *(_QWORD *)(a1 + 56));

  }
}

uint64_t __55__SUManagerServer_installUpdateWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)installUpdateWithInstallOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer installUpdateWithInstallOptions:withResult:]_block_invoke", v8, v7, v5);

}

void __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "_mdmCommandConflictsWithDDMError");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v2 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClientName:", v3);

    objc_msgSend(*(id *)(a1 + 32), "manager");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "installUpdateWithInstallOptions:withResult:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }

}

uint64_t __62__SUManagerServer_installUpdateWithInstallOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)userAskedToDeferInstall
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__SUManagerServer_userAskedToDeferInstall__block_invoke;
  v6[3] = &unk_24CE3B610;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __42__SUManagerServer_userAskedToDeferInstall__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SUManagerServer_userAskedToDeferInstall__block_invoke_2;
  v4[3] = &unk_24CE3B5C0;
  v4[4] = v2;
  return objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer userAskedToDeferInstall]_block_invoke", v1, v4, 0);
}

void __42__SUManagerServer_userAskedToDeferInstall__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUManagerServer_userAskedToDeferInstall__block_invoke_3;
  block[3] = &unk_24CE3B5C0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __42__SUManagerServer_userAskedToDeferInstall__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runOnClients:", &__block_literal_global_302);
}

void __42__SUManagerServer_userAskedToDeferInstall__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isMessagable"))
  {
    objc_msgSend(v3, "proxy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "userWantsToDeferInstall");

  }
}

- (void)slaVersion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SUManagerServer_slaVersion___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __30__SUManagerServer_slaVersion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__SUManagerServer_slaVersion___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __30__SUManagerServer_slaVersion___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer slaVersion:]_block_invoke", v3, v7, v5);

}

void __30__SUManagerServer_slaVersion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "slaVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    +[SUUtility errorWithCode:originalError:](SUUtility, "errorWithCode:originalError:", 50, 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v4;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v6);

}

uint64_t __30__SUManagerServer_slaVersion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)softwareUpdatePathRestriction:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke_2;
  v8[3] = &unk_24CE3BD58;
  v5 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke_3;
  v6[3] = &unk_24CE3C168;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer softwareUpdatePathRestriction:]_block_invoke", v4, v8, v6);

}

uint64_t __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "manager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "softwareUpdatePathRestriction");

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __49__SUManagerServer_softwareUpdatePathRestriction___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isDelayingUpdates:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SUManagerServer_isDelayingUpdates___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __37__SUManagerServer_isDelayingUpdates___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__SUManagerServer_isDelayingUpdates___block_invoke_2;
  v8[3] = &unk_24CE3BD58;
  v5 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __37__SUManagerServer_isDelayingUpdates___block_invoke_3;
  v6[3] = &unk_24CE3C168;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isDelayingUpdates:]_block_invoke", v4, v8, v6);

}

uint64_t __37__SUManagerServer_isDelayingUpdates___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "manager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "isDelayingUpdates");

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __37__SUManagerServer_isDelayingUpdates___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)delayEndDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SUManagerServer_delayEndDate___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __32__SUManagerServer_delayEndDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__SUManagerServer_delayEndDate___block_invoke_2;
  v7[3] = &unk_24CE3C470;
  v8 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __32__SUManagerServer_delayEndDate___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer delayEndDate:]_block_invoke", v4, v7, v5);

}

void __32__SUManagerServer_delayEndDate___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 61);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

uint64_t __32__SUManagerServer_delayEndDate___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)splatRollbackAllowed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUManagerServer_splatRollbackAllowed___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __40__SUManagerServer_splatRollbackAllowed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__SUManagerServer_splatRollbackAllowed___block_invoke_2;
  v8[3] = &unk_24CE3BD58;
  v5 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __40__SUManagerServer_splatRollbackAllowed___block_invoke_3;
  v6[3] = &unk_24CE3C168;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer splatRollbackAllowed:]_block_invoke", v4, v8, v6);

}

void __40__SUManagerServer_splatRollbackAllowed___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    objc_msgSend(v2, "splatRollbackAllowed:", &v4);
    v3 = v4;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __40__SUManagerServer_splatRollbackAllowed___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isSplatOnlyUpdateRollbackSuggested:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke_2;
  v8[3] = &unk_24CE3BD58;
  v5 = *(id *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke_3;
  v6[3] = &unk_24CE3C168;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isSplatOnlyUpdateRollbackSuggested:]_block_invoke", v4, v8, v6);

}

uint64_t __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "manager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "isSplatOnlyUpdateRollbackSuggested");

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __54__SUManagerServer_isSplatOnlyUpdateRollbackSuggested___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)setMandatorySoftwareUpdateDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUManagerServer_setMandatorySoftwareUpdateDictionary___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __56__SUManagerServer_setMandatorySoftwareUpdateDictionary___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[5];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __56__SUManagerServer_setMandatorySoftwareUpdateDictionary___block_invoke_2;
  v3[3] = &unk_24CE3B610;
  v3[4] = v1;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer setMandatorySoftwareUpdateDictionary:]_block_invoke", v2, v3, 0);

}

void __56__SUManagerServer_setMandatorySoftwareUpdateDictionary___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setMandatoryUpdateDictionary:", *(_QWORD *)(a1 + 40));

}

- (void)getMandatorySoftwareUpdateDictionary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer getMandatorySoftwareUpdateDictionary:]_block_invoke", v3, v7, v5);

}

void __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mandatoryUpdateDictionary");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v3 = 0;
  }
  else
  {
    +[SUUtility errorWithCode:](SUUtility, "errorWithCode:", 62);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v5, v3);

}

uint64_t __56__SUManagerServer_getMandatorySoftwareUpdateDictionary___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)currentAutoInstallOperationForecast:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer currentAutoInstallOperationForecast:]_block_invoke", v3, v7, v5);

}

void __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "autoInstallManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = 0;
  objc_msgSend(v2, "copyAutoInstallOperationForecast:error:", &v7, &v6);
  v3 = v7;
  v4 = v6;

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v3, v4);

}

uint64_t __55__SUManagerServer_currentAutoInstallOperationForecast___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)currentAutoInstallOperation:(BOOL)a3 withResult:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  BOOL v14;

  v6 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke;
  v11[3] = &unk_24CE3C208;
  v11[4] = self;
  v12 = v7;
  v14 = a3;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, v11);

}

void __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  char v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1E0;
  v7[4] = v2;
  v9 = *(_BYTE *)(a1 + 56);
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer currentAutoInstallOperation:withResult:]_block_invoke", v3, v7, v5);

}

void __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "autoInstallManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 48);
  v7 = 0;
  objc_msgSend(v2, "currentAutoInstallOperationCreatingIfNecessary:error:", v3, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v7;

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v4, v5);

}

uint64_t __58__SUManagerServer_currentAutoInstallOperation_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)cancelAutoInstallOperation:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer cancelAutoInstallOperation:withResult:]_block_invoke", v8, v7, v5);

}

void __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_mdmCommandConflictsWithDDMError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    objc_msgSend(v3, "autoInstallManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelAutoInstallOperation:", *(_QWORD *)(a1 + 48));

    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
  }
}

uint64_t __57__SUManagerServer_cancelAutoInstallOperation_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)consentToAutoInstallOperation:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke;
  v13[3] = &unk_24CE3C1B8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v7;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v2 = MEMORY[0x24BDAC760];
  v4 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke_2;
  v7[3] = &unk_24CE3C1B8;
  v7[4] = v4;
  v8 = v3;
  v10 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v4, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer consentToAutoInstallOperation:withResult:]_block_invoke", v8, v7, v5);

}

void __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "mdmCommandConflictsWithDDM:", *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_mdmCommandConflictsWithDDMError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    objc_msgSend(v3, "autoInstallManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "consentToAutoInstallOperation:", *(_QWORD *)(a1 + 48));

    v5 = *(_QWORD *)(a1 + 56);
    if (v5)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 1, 0);
  }
}

uint64_t __60__SUManagerServer_consentToAutoInstallOperation_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)currentPasscodePolicy:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SUManagerServer_currentPasscodePolicy___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __41__SUManagerServer_currentPasscodePolicy___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SUManagerServer_currentPasscodePolicy___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __41__SUManagerServer_currentPasscodePolicy___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer currentPasscodePolicy:]_block_invoke", v3, v7, v5);

}

uint64_t __41__SUManagerServer_currentPasscodePolicy___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "autoInstallManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "passcodePolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentPolicyType");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v4, 0);
  return result;
}

uint64_t __41__SUManagerServer_currentPasscodePolicy___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isAutoUpdateEnabled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUManagerServer_isAutoUpdateEnabled___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __39__SUManagerServer_isAutoUpdateEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUManagerServer_isAutoUpdateEnabled___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __39__SUManagerServer_isAutoUpdateEnabled___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isAutoUpdateEnabled:]_block_invoke", v3, v7, v5);

}

uint64_t __39__SUManagerServer_isAutoUpdateEnabled___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "autoInstallManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutoUpdateEnabled");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, 0);
  return result;
}

uint64_t __39__SUManagerServer_isAutoUpdateEnabled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isAutoUpdateScheduled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__SUManagerServer_isAutoUpdateScheduled___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __41__SUManagerServer_isAutoUpdateScheduled___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SUManagerServer_isAutoUpdateScheduled___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __41__SUManagerServer_isAutoUpdateScheduled___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isAutoUpdateScheduled:]_block_invoke", v3, v7, v5);

}

uint64_t __41__SUManagerServer_isAutoUpdateScheduled___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInstallTonightScheduled");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, 0);
  return result;
}

uint64_t __41__SUManagerServer_isAutoUpdateScheduled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke;
  block[3] = &unk_24CE3C498;
  block[4] = self;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  char v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke_2;
  v4[3] = &unk_24CE3BB60;
  v5 = *(_BYTE *)(a1 + 48);
  v4[4] = v2;
  return objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer enableAutomaticUpdateV2:]_block_invoke", v1, v4, 0);
}

void __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  char v12;

  SULogDebug(CFSTR("AutomaticUpdateV2 enabled : %d"), a2, a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(a1 + 40));
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enableAutomaticUpdateV2:", *(unsigned __int8 *)(a1 + 40));

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke_3;
  block[3] = &unk_24CE3BB60;
  v12 = *(_BYTE *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v10, block);

}

void __43__SUManagerServer_enableAutomaticUpdateV2___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  if (*(_BYTE *)(a1 + 40))
  {
    v1 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v13 = 0;
    objc_msgSend(v1, "currentAutoInstallOperationCreatingIfNecessary:error:", 1, &v13);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v13;
    v11 = v3;
    if (v2)
    {
      SULogInfo(CFSTR("Scheduled auto install operation: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v2);
    }
    else if (v3)
    {
      SULogInfo(CFSTR("Error scheduling auto install operation: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
    }

  }
  else
  {
    +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cancelAllAutoInstallTasks");

  }
}

- (void)isAutomaticUpdateV2Enabled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke_2;
  v7[3] = &unk_24CE3C470;
  v8 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isAutomaticUpdateV2Enabled:]_block_invoke", v4, v7, v5);

}

uint64_t __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutomaticUpdateV2Enabled");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, 0);
  return result;
}

uint64_t __46__SUManagerServer_isAutomaticUpdateV2Enabled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_enableAutomaticDownload___block_invoke;
  block[3] = &unk_24CE3C498;
  block[4] = self;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __43__SUManagerServer_enableAutomaticDownload___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  char v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SUManagerServer_enableAutomaticDownload___block_invoke_2;
  v4[3] = &unk_24CE3BB60;
  v5 = *(_BYTE *)(a1 + 48);
  v4[4] = v2;
  return objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer enableAutomaticDownload:]_block_invoke", v1, v4, 0);
}

void __43__SUManagerServer_enableAutomaticDownload___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  char v13;

  if (*(_BYTE *)(a1 + 40))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  SULogDebug(CFSTR("Setting automatic download enabled : %@"), a2, a3, a4, a5, a6, a7, a8, (uint64_t)v9);
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "enableAutomaticDownload:", *(unsigned __int8 *)(a1 + 40));

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_enableAutomaticDownload___block_invoke_3;
  block[3] = &unk_24CE3BB60;
  v13 = *(_BYTE *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v11, block);

}

void __43__SUManagerServer_enableAutomaticDownload___block_invoke_3(uint64_t a1)
{
  id v1;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "autoScanAndDownloadIfAvailable:", 0);
  }
  else
  {
    +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "cancelAllAutodownloadTasks");

  }
}

- (void)isAutomaticDownloadEnabled:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility fastWorkQueue](SUUtility, "fastWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke_2;
  v7[3] = &unk_24CE3C470;
  v8 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isAutomaticDownloadEnabled:]_block_invoke", v4, v7, v5);

}

uint64_t __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAutomaticDownloadEnabled");

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, 0);
  return result;
}

uint64_t __46__SUManagerServer_isAutomaticDownloadEnabled___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)registerCSInstallPredicatesOnDate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUManagerServer_registerCSInstallPredicatesOnDate___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __53__SUManagerServer_registerCSInstallPredicatesOnDate___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__SUManagerServer_registerCSInstallPredicatesOnDate___block_invoke_2;
  v3[3] = &unk_24CE3B5C0;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer registerCSInstallPredicatesOnDate:]_block_invoke", v2, v3, 0);

}

void __53__SUManagerServer_registerCSInstallPredicatesOnDate___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelInstallAlertRegistration");

  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleInstallAlertRegistration:", *(_QWORD *)(a1 + 32));

}

- (void)presentAutoUpdateBanner:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_presentAutoUpdateBanner___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __43__SUManagerServer_presentAutoUpdateBanner___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__SUManagerServer_presentAutoUpdateBanner___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __43__SUManagerServer_presentAutoUpdateBanner___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer presentAutoUpdateBanner:]_block_invoke", v3, v7, v5);

}

void __43__SUManagerServer_presentAutoUpdateBanner___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentAutoUpdateBanner:", *(_QWORD *)(a1 + 40));

}

uint64_t __43__SUManagerServer_presentAutoUpdateBanner___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)eligibleRollbackWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C2A8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer eligibleRollbackWithOptions:withResult:]_block_invoke", v3, v7, v5);

}

void __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eligibleRollbackWithOptions:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:](SUManagerEngine, "rollbackDescriptorForSUCoreRollbackDescriptor:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v3, 0);

}

uint64_t __58__SUManagerServer_eligibleRollbackWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)rollbackUpdateWithOptions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke;
  v13[3] = &unk_24CE3C2A8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer rollbackUpdateWithOptions:withResult:]_block_invoke", v3, v7, v5);

}

void __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rollbackUpdateWithOptions:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __56__SUManagerServer_rollbackUpdateWithOptions_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

- (void)previousRollback:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__SUManagerServer_previousRollback_withResult___block_invoke;
  v13[3] = &unk_24CE3C2A8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __47__SUManagerServer_previousRollback_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__SUManagerServer_previousRollback_withResult___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __47__SUManagerServer_previousRollback_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer previousRollback:withResult:]_block_invoke", v3, v7, v5);

}

void __47__SUManagerServer_previousRollback_withResult___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousRollbackWithOptions:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:](SUManagerEngine, "rollbackDescriptorForSUCoreRollbackDescriptor:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v3, 0);

}

uint64_t __47__SUManagerServer_previousRollback_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)isRollingBack:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__SUManagerServer_isRollingBack___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __33__SUManagerServer_isRollingBack___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUManagerServer_isRollingBack___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __33__SUManagerServer_isRollingBack___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer isRollingBack:]_block_invoke", v3, v7, v5);

}

void __33__SUManagerServer_isRollingBack___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRollingBack");

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eligibleRollbackWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:](SUManagerEngine, "rollbackDescriptorForSUCoreRollbackDescriptor:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v8 = (id)v6;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v7 + 16))(v7, v3, v8, 0);

}

uint64_t __33__SUManagerServer_isRollingBack___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(result + 16))(result, 0, 0, a2);
  return result;
}

- (void)scheduleRollbackRebootForLater:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke_2;
  v7[3] = &unk_24CE3C470;
  v8 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer scheduleRollbackRebootForLater:]_block_invoke", v4, v7, v5);

}

uint64_t __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUAutoInstallManager rollbackRebootLaterTime](SUAutoInstallManager, "rollbackRebootLaterTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleRollbackReboot:", v3);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __50__SUManagerServer_scheduleRollbackRebootForLater___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)setLastRollbackDescriptor:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke;
  v13[3] = &unk_24CE3C2A8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke_2;
  v7[3] = &unk_24CE3B688;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer setLastRollbackDescriptor:withResult:]_block_invoke", v4, v7, v5);

}

uint64_t __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  uint64_t result;

  SULogInfo(CFSTR("Settings SULastRollbackDescriptor: %@"), a2, a3, a4, a5, a6, a7, a8, *(_QWORD *)(a1 + 32));
  +[SUState currentState](SUState, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLastRollbackDescriptor:", *(_QWORD *)(a1 + 32));

  +[SUState currentState](SUState, "currentState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "save");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 1, 0);
  return result;
}

uint64_t __56__SUManagerServer_setLastRollbackDescriptor_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)securityResponseRollbackSuggested:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke;
  v13[3] = &unk_24CE3C2A8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v7;
  v11 = v6;
  v12 = v8;
  dispatch_async(v9, v13);

}

void __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer securityResponseRollbackSuggested:withResult:]_block_invoke", v3, v7, v5);

}

void __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "securityResponseRollbackSuggested:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __64__SUManagerServer_securityResponseRollbackSuggested_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)createInstallationKeybag:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  SULogInfo(CFSTR("%s was called by a client"), v8, v9, v10, v11, v12, v13, v14, (uint64_t)"-[SUManagerServer createInstallationKeybag:withResult:]");
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke;
  block[3] = &unk_24CE3C2A8;
  block[4] = self;
  v21 = v15;
  v22 = v6;
  v23 = v7;
  v17 = v7;
  v18 = v6;
  v19 = v15;
  dispatch_async(v16, block);

}

void __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke_2;
  v7[3] = &unk_24CE3B6B0;
  v7[4] = v2;
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer createInstallationKeybag:withResult:]_block_invoke", v3, v7, v5);

}

void __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createInstallationKeybag:withResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __55__SUManagerServer_createInstallationKeybag_withResult___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)destroyInstallationKeybag
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__SUManagerServer_destroyInstallationKeybag__block_invoke;
  v6[3] = &unk_24CE3B610;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __44__SUManagerServer_destroyInstallationKeybag__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SUManagerServer_destroyInstallationKeybag__block_invoke_2;
  v4[3] = &unk_24CE3B5C0;
  v4[4] = v2;
  return objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer destroyInstallationKeybag]_block_invoke", v1, v4, 0);
}

void __44__SUManagerServer_destroyInstallationKeybag__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "destroyInstallationKeybag");

}

- (void)installServerConfiguration
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__SUManagerServer_installServerConfiguration__block_invoke;
  v6[3] = &unk_24CE3B610;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __45__SUManagerServer_installServerConfiguration__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer installServerConfiguration]_block_invoke", *(_QWORD *)(a1 + 40), &__block_literal_global_321, 0);
}

void __45__SUManagerServer_installServerConfiguration__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BEAE7E8], "sharedServerSettings");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "installServerSettings");

}

- (void)setExclusiveControl:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SUManagerServer_setExclusiveControl___block_invoke;
  block[3] = &unk_24CE3C498;
  block[4] = self;
  v9 = v5;
  v10 = a3;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __39__SUManagerServer_setExclusiveControl___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];
  char v5;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__SUManagerServer_setExclusiveControl___block_invoke_2;
  v4[3] = &unk_24CE3BB60;
  v5 = *(_BYTE *)(a1 + 48);
  v4[4] = v2;
  return objc_msgSend(v2, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer setExclusiveControl:]_block_invoke", v1, v4, 0);
}

uint64_t __39__SUManagerServer_setExclusiveControl___block_invoke_2(uint64_t a1)
{
  int v1;
  void *v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = *(void **)(a1 + 32);
  if (v1)
    return objc_msgSend(v2, "goUnderExclusiveControl");
  else
    return objc_msgSend(v2, "exitExclusiveControl");
}

- (void)writeKeepAliveFile:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUManagerServer_writeKeepAliveFile___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __38__SUManagerServer_writeKeepAliveFile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  v2 = MEMORY[0x24BDAC760];
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__SUManagerServer_writeKeepAliveFile___block_invoke_2;
  v7[3] = &unk_24CE3C470;
  v8 = *(id *)(a1 + 48);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __38__SUManagerServer_writeKeepAliveFile___block_invoke_3;
  v5[3] = &unk_24CE3C168;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer writeKeepAliveFile:]_block_invoke", v4, v7, v5);

}

uint64_t __38__SUManagerServer_writeKeepAliveFile___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t result;

  v2 = +[SUUtility writeKeepAliveFile](SUUtility, "writeKeepAliveFile");
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _BOOL8, _QWORD))(result + 16))(result, v2, 0);
  return result;
}

uint64_t __38__SUManagerServer_writeKeepAliveFile___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

- (void)recordSUAnalyticsEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SUManagerServer *v9;

  v4 = a3;
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_recordSUAnalyticsEvent___block_invoke;
  v7[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__SUManagerServer_recordSUAnalyticsEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  SULogAnalytics();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v2, CFSTR("Saving event %@\n"), v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "coreAnalyticsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEvent:", *(_QWORD *)(a1 + 32));

}

- (void)submitSUAnalyticsEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SUManagerServer *v9;

  v4 = a3;
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_submitSUAnalyticsEvent___block_invoke;
  v7[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __42__SUManagerServer_submitSUAnalyticsEvent___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  SULogAnalytics();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v2, CFSTR("Saving event %@\n"), v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "coreAnalyticsManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEvent:", *(_QWORD *)(a1 + 32));

  SULogAnalytics();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v10, CFSTR("Submitting event %@\n"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

  objc_msgSend(*(id *)(a1 + 40), "coreAnalyticsManager");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "submitEvent:", *(_QWORD *)(a1 + 32));

}

- (void)submitAllSUAnalyticsEvents
{
  NSObject *v3;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUManagerServer_submitAllSUAnalyticsEvents__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __45__SUManagerServer_submitAllSUAnalyticsEvents__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  SULogAnalytics();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v2, CFSTR("Submitting all CoreAnalytics events\n"), v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "coreAnalyticsManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitAllEvents");

}

- (void)submitSUAnalyticsEventsWithName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SUManagerServer *v9;

  v4 = a3;
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SUManagerServer_submitSUAnalyticsEventsWithName___block_invoke;
  v7[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __51__SUManagerServer_submitSUAnalyticsEventsWithName___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  SULogAnalytics();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v2, CFSTR("Submitting all CoreAnalytics events matching name %@\n"), v3, v4, v5, v6, v7, v8, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "coreAnalyticsManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "submitEventsWithName:", *(_QWORD *)(a1 + 32));

}

- (void)rvGetCurrentNeRDInfoWithReply:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__SUManagerServer_rvGetCurrentNeRDInfoWithReply___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, block);

}

void __49__SUManagerServer_rvGetCurrentNeRDInfoWithReply___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__SUManagerServer_rvGetCurrentNeRDInfoWithReply___block_invoke_2;
  v3[3] = &unk_24CE3C470;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke", v2, v3, 0);

}

void __49__SUManagerServer_rvGetCurrentNeRDInfoWithReply___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;

  RVGetNeRDInfo();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(MEMORY[0x24BE80CD8], "predicateMatchingBundleIdentifier:", CFSTR("com.apple.NRD.UpdateBrainService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(MEMORY[0x24BE80C78], "handleForPredicate:error:", v4, &v47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v47;
  if (!v5)
  {
    SULogError(CFSTR("%s [RV] Couldn't detect a running NeRD brain. Error: %@"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke_2");
    v43 = CFSTR("No running brain");
LABEL_7:
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("NeRDBrainBuild"));
    goto LABEL_10;
  }
  objc_msgSend(v5, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    SULogError(CFSTR("%s [RV] Couldn't identify the path to the running brain: %@"), v16, v17, v18, v19, v20, v21, v22, (uint64_t)"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke_2");
    v43 = CFSTR("Unknown");
    goto LABEL_7;
  }
  objc_msgSend(v5, "bundle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "path");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("version.plist"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v25);
  v34 = v26;
  if (v26)
  {
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("%s [RV] Loaded version.plist of running brain. Running brain version is: %@"), v35, v36, v37, v38, v39, v40, v41, (uint64_t)"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke_2");

    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("ProductBuildVersion"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("NeRDBrainBuild"));

  }
  else
  {
    SULogError(CFSTR("%s [RV] Failed to load version.plist of the running brain from: %@"), v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[SUManagerServer rvGetCurrentNeRDInfoWithReply:]_block_invoke_2");
  }

LABEL_10:
  v44 = (void *)objc_msgSend(v3, "copy");

  v45 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)rvTriggerNeRDUpdate:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUManagerServer_rvTriggerNeRDUpdate___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __39__SUManagerServer_rvTriggerNeRDUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleClientRequest:client:withRequestCallBack:withErrorCallBack:", "-[SUManagerServer rvTriggerNeRDUpdate:]_block_invoke", *(_QWORD *)(a1 + 40), &__block_literal_global_353, 0);
}

uint64_t __39__SUManagerServer_rvTriggerNeRDUpdate___block_invoke_2()
{
  return RVTriggerNeRDUpdate();
}

- (void)_sendLatestStatusForClient:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[SUManagerServer manager](self, "manager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "download");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "proxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "downloadProgressDidChange:", v5);

  }
}

- (void)_clientMessagabilityDidChange:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUManagerServer *v9;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SUManagerServer__clientMessagabilityDidChange___block_invoke;
  v7[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __49__SUManagerServer__clientMessagabilityDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v5 = v2;
    v4 = objc_msgSend(v2, "isMessagable");
    v3 = v5;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "_sendLatestStatusForClient:", v5);
      v3 = v5;
    }
  }

}

- (void)_evaluateForegroundness
{
  NSObject *clientQueue;
  _QWORD v3[6];
  _QWORD v4[3];
  char v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v5 = 0;
  clientQueue = self->_clientQueue;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__SUManagerServer__evaluateForegroundness__block_invoke;
  v3[3] = &unk_24CE3B700;
  v3[4] = self;
  v3[5] = v4;
  dispatch_async(clientQueue, v3);
  _Block_object_dispose(v4, 8);
}

void __42__SUManagerServer__evaluateForegroundness__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  __int128 v6;
  _QWORD v7[5];

  v2 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer__evaluateForegroundness__block_invoke_2;
  v7[3] = &unk_24CE3C500;
  v3 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "runOnClientsUntilStop:", v7);
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __42__SUManagerServer__evaluateForegroundness__block_invoke_3;
  block[3] = &unk_24CE3B700;
  v6 = *(_OWORD *)(a1 + 32);
  dispatch_async(v4, block);

}

uint64_t __42__SUManagerServer__evaluateForegroundness__block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "isForeground");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __42__SUManagerServer__evaluateForegroundness__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setForeground:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));

}

- (void)_clientForegroundnessDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUManagerServer__clientForegroundnessDidChange___block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __50__SUManagerServer__clientForegroundnessDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__evaluateForegroundness, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__evaluateForegroundness, 0, 0.2);
}

- (id)clients
{
  return (id)-[NSMutableArray copy](self->_clients, "copy");
}

- (void)goUnderExclusiveControl
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BEAEA48], "sharedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBootedOSSecureInternal");

  if (v4)
  {
    SULogInfo(CFSTR("%s going under exclusive control"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer goUnderExclusiveControl]");
    -[SUManagerServer setUnderExclusiveControl:](self, "setUnderExclusiveControl:", 1);
    +[SUState currentState](SUState, "currentState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setUnderExclusiveControl:", 1);

    +[SUState currentState](SUState, "currentState");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "save");

  }
  else
  {
    SULogInfo(CFSTR("%s tried to go under exclusive control while in non internal build"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)"-[SUManagerServer goUnderExclusiveControl]");
  }
}

- (void)exitExclusiveControl
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  id v10;

  SULogInfo(CFSTR("%s exiting exclusive control"), (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)"-[SUManagerServer exitExclusiveControl]");
  -[SUManagerServer setUnderExclusiveControl:](self, "setUnderExclusiveControl:", 0);
  +[SUState currentState](SUState, "currentState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUnderExclusiveControl:", 0);

  +[SUState currentState](SUState, "currentState");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "save");

}

- (void)addClient:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__SUManagerServer_addClient___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

uint64_t __29__SUManagerServer_addClient___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  SULogInfo(CFSTR("Added client: %@, count: %lu"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);

  return objc_msgSend(*(id *)(a1 + 32), "_sendLatestStatusForClient:", *(_QWORD *)(a1 + 40));
}

- (void)removeClient:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "invalidate");
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__SUManagerServer_removeClient___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

uint64_t __32__SUManagerServer_removeClient___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  SULogInfo(CFSTR("Removed client: %@, count: %lu"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)v2);

  return objc_msgSend(*(id *)(a1 + 32), "_evaluateForegroundness");
}

- (void)setClientType:(int)a3 withResult:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void (**v8)(id, BOOL, _QWORD);

  v4 = *(_QWORD *)&a3;
  v8 = (void (**)(id, BOOL, _QWORD))a4;
  -[SUManagerServer _clientForCurrentConnection](self, "_clientForCurrentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "setType:", v4);
  v8[2](v8, v7 != 0, 0);

}

- (void)scanRequestDidStartForOptions:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__SUManagerServer_scanRequestDidStartForOptions___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __49__SUManagerServer_scanRequestDidStartForOptions___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __49__SUManagerServer_scanRequestDidStartForOptions___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __49__SUManagerServer_scanRequestDidStartForOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isMessagable"))
  {
    objc_msgSend(v8, "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 32), "clientName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(v8, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setClientName:", v6);

      }
    }
    objc_msgSend(v8, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scanRequestDidStartForOptions:", *(_QWORD *)(a1 + 32));

  }
}

- (void)scanRequestDidFinishForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *clientQueue;
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
  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__SUManagerServer_scanRequestDidFinishForOptions_results_error___block_invoke;
  v15[3] = &unk_24CE3C578;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(clientQueue, v15);

}

void __64__SUManagerServer_scanRequestDidFinishForOptions_results_error___block_invoke(id *a1)
{
  id v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__SUManagerServer_scanRequestDidFinishForOptions_results_error___block_invoke_2;
  v4[3] = &unk_24CE3C550;
  v2 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  objc_msgSend(v2, "runOnClients:", v4);
  objc_msgSend(a1[4], "ddmManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scanRequestDidFinishForOptions:results:error:", a1[5], a1[6], a1[7]);

}

void __64__SUManagerServer_scanRequestDidFinishForOptions_results_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isMessagable"))
  {
    objc_msgSend(v8, "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 32), "clientName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(v8, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setClientName:", v6);

      }
    }
    objc_msgSend(v8, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scanRequestDidFinishForOptions:results:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)scanDidCompleteForOptions:(id)a3 results:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *clientQueue;
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
  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__SUManagerServer_scanDidCompleteForOptions_results_error___block_invoke;
  v15[3] = &unk_24CE3C578;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(clientQueue, v15);

}

void __59__SUManagerServer_scanDidCompleteForOptions_results_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__SUManagerServer_scanDidCompleteForOptions_results_error___block_invoke_2;
  v3[3] = &unk_24CE3C550;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __59__SUManagerServer_scanDidCompleteForOptions_results_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(a1 + 32), "clientName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v8, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setClientName:", v6);

    }
  }
  objc_msgSend(v8, "proxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scanDidCompleteForOptions:results:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)scanRequestDidFinishForOptions:(id)a3 update:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *clientQueue;
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
  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__SUManagerServer_scanRequestDidFinishForOptions_update_error___block_invoke;
  v15[3] = &unk_24CE3C578;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(clientQueue, v15);

}

void __63__SUManagerServer_scanRequestDidFinishForOptions_update_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__SUManagerServer_scanRequestDidFinishForOptions_update_error___block_invoke_2;
  v3[3] = &unk_24CE3C550;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __63__SUManagerServer_scanRequestDidFinishForOptions_update_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isMessagable"))
  {
    objc_msgSend(v8, "identifier");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(*(id *)(a1 + 32), "clientName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        objc_msgSend(v8, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setClientName:", v6);

      }
    }
    objc_msgSend(v8, "proxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scanRequestDidFinishForOptions:update:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

- (void)scanDidCompleteWithNewUpdateAvailable:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__SUManagerServer_scanDidCompleteWithNewUpdateAvailable_error___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(clientQueue, block);

}

void __63__SUManagerServer_scanDidCompleteWithNewUpdateAvailable_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__SUManagerServer_scanDidCompleteWithNewUpdateAvailable_error___block_invoke_2;
  v3[3] = &unk_24CE3C5A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __63__SUManagerServer_scanDidCompleteWithNewUpdateAvailable_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isMessagable"))
  {
    objc_msgSend(v4, "proxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scanDidCompleteWithNewUpdateAvailable:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)automaticDownloadDidFailToStartForNewUpdateAvailable:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__SUManagerServer_automaticDownloadDidFailToStartForNewUpdateAvailable_withError___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(clientQueue, block);

}

void __82__SUManagerServer_automaticDownloadDidFailToStartForNewUpdateAvailable_withError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __82__SUManagerServer_automaticDownloadDidFailToStartForNewUpdateAvailable_withError___block_invoke_2;
  v3[3] = &unk_24CE3C5A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __82__SUManagerServer_automaticDownloadDidFailToStartForNewUpdateAvailable_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "automaticDownloadDidFailToStartForNewUpdateAvailable:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)downloadDidStart:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__SUManagerServer_downloadDidStart___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __36__SUManagerServer_downloadDidStart___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__SUManagerServer_downloadDidStart___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __36__SUManagerServer_downloadDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "downloadDidStart:", *(_QWORD *)(a1 + 32));
}

- (void)downloadProgressDidChange:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SUManagerServer_downloadProgressDidChange___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __45__SUManagerServer_downloadProgressDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __45__SUManagerServer_downloadProgressDidChange___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __45__SUManagerServer_downloadProgressDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isMessagable"))
  {
    objc_msgSend(v4, "proxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "downloadProgressDidChange:", *(_QWORD *)(a1 + 32));

  }
}

- (void)downloadDidFail:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUManagerServer_downloadDidFail_withError___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(clientQueue, block);

}

void __45__SUManagerServer_downloadDidFail_withError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__SUManagerServer_downloadDidFail_withError___block_invoke_2;
  v3[3] = &unk_24CE3C5A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __45__SUManagerServer_downloadDidFail_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "downloadDidFail:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)downloadDidFinish:(id)a3 withInstallPolicy:(id)a4
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
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];
  id v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke_2;
  block[3] = &unk_24CE3BB38;
  block[4] = v2;
  v6 = v3;
  v7 = *(id *)(a1 + 48);
  dispatch_async(v4, block);

}

void __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke_2(id *a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a1[4], "ddmManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloadDidFinish:withInstallPolicy:", a1[5], a1[6]);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke_3;
  v4[3] = &unk_24CE3C5A0;
  v3 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  objc_msgSend(v3, "runOnClients:", v4);

}

void __55__SUManagerServer_downloadDidFinish_withInstallPolicy___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "downloadDidFinish:withInstallPolicy:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)downloadWasInvalidatedForNewUpdatesAvailable:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SUManagerServer *v9;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__SUManagerServer_downloadWasInvalidatedForNewUpdatesAvailable___block_invoke;
  v7[3] = &unk_24CE3B610;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __64__SUManagerServer_downloadWasInvalidatedForNewUpdatesAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  SUScanResults *v6;
  void *v7;
  SUScanResults *v8;
  _QWORD v9[4];
  SUScanResults *v10;

  objc_msgSend(*(id *)(a1 + 32), "preferredDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "alternateDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUManagerEngine SUDescriptorFromCoreDescriptor:](SUManagerEngine, "SUDescriptorFromCoreDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SUScanResults initWithPreferredDescriptor:alternateDescriptor:]([SUScanResults alloc], "initWithPreferredDescriptor:alternateDescriptor:", v3, v5);
  v7 = *(void **)(a1 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__SUManagerServer_downloadWasInvalidatedForNewUpdatesAvailable___block_invoke_2;
  v9[3] = &unk_24CE3C528;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "runOnClients:", v9);

}

void __64__SUManagerServer_downloadWasInvalidatedForNewUpdatesAvailable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "downloadWasInvalidatedForNewUpdatesAvailable:", *(_QWORD *)(a1 + 32));
}

- (void)downloadWasInvalidatedForNewUpdateAvailable:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__SUManagerServer_downloadWasInvalidatedForNewUpdateAvailable___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __63__SUManagerServer_downloadWasInvalidatedForNewUpdateAvailable___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __63__SUManagerServer_downloadWasInvalidatedForNewUpdateAvailable___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __63__SUManagerServer_downloadWasInvalidatedForNewUpdateAvailable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "downloadWasInvalidatedForNewUpdateAvailable:", *(_QWORD *)(a1 + 32));
}

- (void)clearingSpaceForDownload:(id)a3 clearing:(BOOL)a4
{
  id v6;
  NSObject *clientQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUManagerServer_clearingSpaceForDownload_clearing___block_invoke;
  block[3] = &unk_24CE3C498;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(clientQueue, block);

}

void __53__SUManagerServer_clearingSpaceForDownload_clearing___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__SUManagerServer_clearingSpaceForDownload_clearing___block_invoke_2;
  v3[3] = &unk_24CE3C5C8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __53__SUManagerServer_clearingSpaceForDownload_clearing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "clearingSpaceForDownload:clearing:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)installWantsToStart:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUManagerServer_installWantsToStart_completion___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(clientQueue, block);

}

void __50__SUManagerServer_installWantsToStart_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__SUManagerServer_installWantsToStart_completion___block_invoke_2;
  v3[3] = &unk_24CE3C5F0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __50__SUManagerServer_installWantsToStart_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "installWantsToStart:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)installDidStart:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__SUManagerServer_installDidStart___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __35__SUManagerServer_installDidStart___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __35__SUManagerServer_installDidStart___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __35__SUManagerServer_installDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "installDidStart:", *(_QWORD *)(a1 + 32));
}

- (void)installDidFail:(id)a3 withError:(id)a4
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
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUManagerServer_installDidFail_withError___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __44__SUManagerServer_installDidFail_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "noteInstallDidFail:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SUManagerServer_installDidFail_withError___block_invoke_2;
  block[3] = &unk_24CE3BB38;
  block[4] = v2;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  dispatch_async(v3, block);

}

void __44__SUManagerServer_installDidFail_withError___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SUManagerServer_installDidFail_withError___block_invoke_3;
  v3[3] = &unk_24CE3C5A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __44__SUManagerServer_installDidFail_withError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(MEMORY[0x24BDD1540], "buildCheckedError:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "installDidFail:withError:", *(_QWORD *)(a1 + 40), v5);
}

- (void)installDidFinish:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__SUManagerServer_installDidFinish___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __36__SUManagerServer_installDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  +[SUUtility writeKeepAliveFile](SUUtility, "writeKeepAliveFile");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "noteInstallDidFinish:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(NSObject **)(v2 + 56);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__SUManagerServer_installDidFinish___block_invoke_2;
  v5[3] = &unk_24CE3B610;
  v5[4] = v2;
  v6 = v3;
  dispatch_async(v4, v5);

}

void __36__SUManagerServer_installDidFinish___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__SUManagerServer_installDidFinish___block_invoke_3;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __36__SUManagerServer_installDidFinish___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "installDidFinish:", *(_QWORD *)(a1 + 32));
}

- (void)installPolicyDidChange:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_installPolicyDidChange___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __42__SUManagerServer_installPolicyDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__SUManagerServer_installPolicyDidChange___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __42__SUManagerServer_installPolicyDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "installPolicyDidChange:", *(_QWORD *)(a1 + 32));
}

- (void)managedInstallationRequested:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SUManagerServer_managedInstallationRequested___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __48__SUManagerServer_managedInstallationRequested___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __48__SUManagerServer_managedInstallationRequested___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __48__SUManagerServer_managedInstallationRequested___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "managedInstallationRequested:", *(_QWORD *)(a1 + 32));
}

- (void)sendDDMDeclarationToUI:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_sendDDMDeclarationToUI___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __42__SUManagerServer_sendDDMDeclarationToUI___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__SUManagerServer_sendDDMDeclarationToUI___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __42__SUManagerServer_sendDDMDeclarationToUI___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "handleUIForDDMDeclaration:", *(_QWORD *)(a1 + 32));
}

- (void)sendDDMGlobalSettingsToUI:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__SUManagerServer_sendDDMGlobalSettingsToUI___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __45__SUManagerServer_sendDDMGlobalSettingsToUI___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __45__SUManagerServer_sendDDMGlobalSettingsToUI___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __45__SUManagerServer_sendDDMGlobalSettingsToUI___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "handleUIForDDMGlobalSettings:", *(_QWORD *)(a1 + 32));
}

- (void)newOSDetected:(id)a3 deleteKeepAlive:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v8 = a4;
  SULogInfo(CFSTR("%s: %@, deleteKeepAlive: %@"), (uint64_t)a2, (uint64_t)a3, a4, v4, v5, v6, v7, (uint64_t)"-[SUManagerServer newOSDetected:deleteKeepAlive:]");
  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "cancelInstallAlertRegistration");
  else
    objc_msgSend(v9, "cancelInstallAlertRegistrationButKeepAlive");

}

- (void)splatUpdateDetected
{
  NSObject *clientQueue;
  _QWORD block[5];

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__SUManagerServer_splatUpdateDetected__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

uint64_t __38__SUManagerServer_splatUpdateDetected__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "runOnClients:", &__block_literal_global_371);
}

void __38__SUManagerServer_splatUpdateDetected__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  objc_msgSend(v2, "wakeupIfNecessary");
  objc_msgSend(v2, "proxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "deviceBootedAfterSplatUpdate");
}

- (void)splatRollbackDetected:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SUManagerServer_splatRollbackDetected___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __41__SUManagerServer_splatRollbackDetected___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __41__SUManagerServer_splatRollbackDetected___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __41__SUManagerServer_splatRollbackDetected___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "deviceBootedAfterRollback:", *(_QWORD *)(a1 + 32));
}

- (void)installTonightScheduled:(BOOL)a3
{
  NSObject *clientQueue;
  _QWORD v4[5];
  BOOL v5;

  clientQueue = self->_clientQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__SUManagerServer_installTonightScheduled___block_invoke;
  v4[3] = &unk_24CE3BB60;
  v4[4] = self;
  v5 = a3;
  dispatch_async(clientQueue, v4);
}

uint64_t __43__SUManagerServer_installTonightScheduled___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __43__SUManagerServer_installTonightScheduled___block_invoke_2;
  v3[3] = &unk_24CE3C5C8;
  v3[4] = v1;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "runOnClients:", v3);
}

void __43__SUManagerServer_installTonightScheduled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "operationModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "proxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "installTonightScheduled:operationID:", *(unsigned __int8 *)(a1 + 40), v6);
}

- (void)rollbackReadyToStart:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *clientQueue;
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
  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __59__SUManagerServer_rollbackReadyToStart_options_completion___block_invoke;
  v15[3] = &unk_24CE3C2A8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(clientQueue, v15);

}

void __59__SUManagerServer_rollbackReadyToStart_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __59__SUManagerServer_rollbackReadyToStart_options_completion___block_invoke_2;
  v3[3] = &unk_24CE3C638;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __59__SUManagerServer_rollbackReadyToStart_options_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:](SUManagerEngine, "rollbackDescriptorForSUCoreRollbackDescriptor:", a1[4]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rollbackReadyToStart:options:completion:", v5, a1[5], a1[6]);
}

- (void)rollbackDidStart:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__SUManagerServer_rollbackDidStart___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __36__SUManagerServer_rollbackDidStart___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __36__SUManagerServer_rollbackDidStart___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __36__SUManagerServer_rollbackDidStart___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:](SUManagerEngine, "rollbackDescriptorForSUCoreRollbackDescriptor:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rollbackDidStart:", v5);
}

- (void)rollbackDidFail:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUManagerServer_rollbackDidFail_withError___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(clientQueue, block);

}

void __45__SUManagerServer_rollbackDidFail_withError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __45__SUManagerServer_rollbackDidFail_withError___block_invoke_2;
  v3[3] = &unk_24CE3C5A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __45__SUManagerServer_rollbackDidFail_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:](SUManagerEngine, "rollbackDescriptorForSUCoreRollbackDescriptor:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rollbackDidFail:withError:", v5, *(_QWORD *)(a1 + 40));
}

- (void)rollbackSucceeded:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __37__SUManagerServer_rollbackSucceeded___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __37__SUManagerServer_rollbackSucceeded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 56);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__SUManagerServer_rollbackSucceeded___block_invoke_2;
  v4[3] = &unk_24CE3B610;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __37__SUManagerServer_rollbackSucceeded___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __37__SUManagerServer_rollbackSucceeded___block_invoke_3;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __37__SUManagerServer_rollbackSucceeded___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:](SUManagerEngine, "rollbackDescriptorForSUCoreRollbackDescriptor:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rollbackDidFinish:", v5);
}

- (void)rollbackReadyForReboot:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__SUManagerServer_rollbackReadyForReboot___block_invoke;
  v7[3] = &unk_24CE3B610;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __42__SUManagerServer_rollbackReadyForReboot___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __42__SUManagerServer_rollbackReadyForReboot___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __42__SUManagerServer_rollbackReadyForReboot___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  +[SUManagerEngine rollbackDescriptorForSUCoreRollbackDescriptor:](SUManagerEngine, "rollbackDescriptorForSUCoreRollbackDescriptor:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rollbackReadyForReboot:", v5);
}

- (void)presentingRecommendedUpdate:(id)a3 shouldPresent:(BOOL)a4
{
  id v6;
  NSObject *clientQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__SUManagerServer_presentingRecommendedUpdate_shouldPresent___block_invoke;
  block[3] = &unk_24CE3C498;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(clientQueue, block);

}

void __61__SUManagerServer_presentingRecommendedUpdate_shouldPresent___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __61__SUManagerServer_presentingRecommendedUpdate_shouldPresent___block_invoke_2;
  v3[3] = &unk_24CE3C5C8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __61__SUManagerServer_presentingRecommendedUpdate_shouldPresent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "presentingRecommendedUpdate:shouldPresent:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)rollbackSuggested:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *clientQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__SUManagerServer_rollbackSuggested_info___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(clientQueue, block);

}

void __42__SUManagerServer_rollbackSuggested_info___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__SUManagerServer_rollbackSuggested_info___block_invoke_2;
  v3[3] = &unk_24CE3C5A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __42__SUManagerServer_rollbackSuggested_info___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rollbackSuggested:info:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)networkMonitorDetectOverrides
{
  NSObject *clientQueue;
  _QWORD block[5];

  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__SUManagerServer_networkMonitorDetectOverrides__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(clientQueue, block);
}

void __48__SUManagerServer_networkMonitorDetectOverrides__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "manager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "networkMonitorDetectOverrides");

}

- (void)isAnyClientInUserInteraction:(id)a3
{
  id v4;
  NSObject *clientQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  clientQueue = self->_clientQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke;
  v7[3] = &unk_24CE3B688;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(clientQueue, v7);

}

void __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke_2;
  v4[3] = &unk_24CE3C688;
  v4[4] = &v5;
  objc_msgSend(v2, "runOnClients:", v4);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v3 + 16))(v3, *((unsigned __int8 *)v6 + 24), 0);
  _Block_object_dispose(&v5, 8);
}

void __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke_3;
  v5[3] = &unk_24CE3C660;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "inUserInteraction:", v5);

}

uint64_t __48__SUManagerServer_isAnyClientInUserInteraction___block_invoke_3(uint64_t result, int a2)
{
  if (a2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)downloadWasInvalidated:(id)a3
{
  id v3;

  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelInstallAlertRegistration");

}

- (void)autoInstallManager:(id)a3 operationWasConsented:(id)a4
{
  id v5;
  NSObject *clientQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  clientQueue = self->_clientQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__SUManagerServer_autoInstallManager_operationWasConsented___block_invoke;
  v8[3] = &unk_24CE3B610;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(clientQueue, v8);

}

void __60__SUManagerServer_autoInstallManager_operationWasConsented___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __60__SUManagerServer_autoInstallManager_operationWasConsented___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __60__SUManagerServer_autoInstallManager_operationWasConsented___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autoInstallOperationDidConsent:", v4);

}

- (void)autoInstallManager:(id)a3 didCancelOperation:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *clientQueue;
  id v14;
  uint64_t v15[5];
  id v16;

  v5 = a4;
  SULogBadging();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SULogInfoForSubsystem(v6, CFSTR("Auto install operation cancelled..Dismissing AutoUpdateBanner"), v7, v8, v9, v10, v11, v12, v15[0]);

  clientQueue = self->_clientQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = (uint64_t)__57__SUManagerServer_autoInstallManager_didCancelOperation___block_invoke;
  v15[3] = (uint64_t)&unk_24CE3B610;
  v15[4] = (uint64_t)self;
  v16 = v5;
  v14 = v5;
  dispatch_async(clientQueue, v15);

}

void __57__SUManagerServer_autoInstallManager_didCancelOperation___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__SUManagerServer_autoInstallManager_didCancelOperation___block_invoke_2;
  v2[3] = &unk_24CE3C528;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "runOnClients:", v2);

}

void __57__SUManagerServer_autoInstallManager_didCancelOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autoInstallOperationWasCancelled:", v4);

}

- (void)autoInstallManager:(id)a3 didExpireOperation:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  NSObject *clientQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__SUManagerServer_autoInstallManager_didExpireOperation_withError___block_invoke;
  block[3] = &unk_24CE3BB38;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(clientQueue, block);

}

void __67__SUManagerServer_autoInstallManager_didExpireOperation_withError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __67__SUManagerServer_autoInstallManager_didExpireOperation_withError___block_invoke_2;
  v3[3] = &unk_24CE3C5A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __67__SUManagerServer_autoInstallManager_didExpireOperation_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autoInstallOperationDidExpire:withError:", v4, *(_QWORD *)(a1 + 40));

}

- (void)autoInstallManager:(id)a3 isReadyToInstall:(id)a4 withResult:(id)a5
{
  id v7;
  id v8;
  NSObject *clientQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke;
  block[3] = &unk_24CE3B6B0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(clientQueue, block);

}

void __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_2;
  v3[3] = &unk_24CE3C5F0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "runOnClients:", v3);

}

void __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_3;
  v6[3] = &unk_24CE3C6B0;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v4, "autoInstallOperationIsReadyToInstall:withResult:", v5, v6);

}

void __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_4;
  block[3] = &unk_24CE3BC40;
  v7 = *(id *)(a1 + 32);
  v12 = a2;
  v10 = v5;
  v11 = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __66__SUManagerServer_autoInstallManager_isReadyToInstall_withResult___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)autoInstallManager:(id)a3 passcodePolicyChanged:(unint64_t)a4 forOperation:(id)a5
{
  id v7;
  NSObject *clientQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v7 = a5;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__SUManagerServer_autoInstallManager_passcodePolicyChanged_forOperation___block_invoke;
  block[3] = &unk_24CE3B660;
  block[4] = self;
  v11 = v7;
  v12 = a4;
  v9 = v7;
  dispatch_async(clientQueue, block);

}

void __73__SUManagerServer_autoInstallManager_passcodePolicyChanged_forOperation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __73__SUManagerServer_autoInstallManager_passcodePolicyChanged_forOperation___block_invoke_2;
  v5[3] = &unk_24CE3C6D8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "runOnClients:", v5);

}

void __73__SUManagerServer_autoInstallManager_passcodePolicyChanged_forOperation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "wakeupIfNecessary");
  objc_msgSend(v3, "proxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "autoInstallOperationPasscodePolicyChanged:passcodePolicyType:", v4, *(_QWORD *)(a1 + 40));

}

- (void)resetState
{
  NSObject *v2;

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_374);

}

void __29__SUManagerServer_resetState__block_invoke()
{
  void *v0;
  id v1;

  +[SUState currentState](SUState, "currentState");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "resetAllHistory");

  +[SUState currentState](SUState, "currentState");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "save");

}

- (BOOL)underExclusiveControl
{
  return self->_underExclusiveControl;
}

- (void)setUnderExclusiveControl:(BOOL)a3
{
  self->_underExclusiveControl = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_ddmManager, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_autoInstallManager, 0);
}

- (id)connectionQueue
{
  return (id)__connectionQueue;
}

- (void)serverInitAndResumeWork
{
  NSObject *v3;
  _QWORD block[5];

  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUManagerServer_Daemon__serverInitAndResumeWork__block_invoke;
  block[3] = &unk_24CE3B5C0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __50__SUManagerServer_Daemon__serverInitAndResumeWork__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  SULogDebug(CFSTR("Notifying observers of start"), a2, a3, a4, a5, a6, a7, a8, v14);
  objc_msgSend(*(id *)(a1 + 32), "_notifyServerStart");
  +[SUPluginLoader loadPlugin:](SUPluginLoader, "loadPlugin:", CFSTR("/System/Library/PrivateFrameworks/SoftwareUpdateServicesUI.framework/Plugins/SoftwareUpdateServicesUIPlugin.servicebundle"));
  objc_msgSend(*(id *)(a1 + 32), "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resumeOrResetIfNecessary");

  objc_msgSend(*(id *)(a1 + 32), "autoInstallManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resumeOrResetStateIfNecessary");

  objc_msgSend(*(id *)(a1 + 32), "ddmManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resumeOrResetStateIfNecessary");

  +[SUScheduler sharedInstance](SUScheduler, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheduleStartupTasksIfNecessary");

  +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setKeepAliveClearable:", 1);

  +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clearKeepAliveIfNecessary:", 0);

}

- (void)runUntilIdleExit
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  dispatch_queue_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  dispatch_time_t v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  _QWORD block[4];
  id v32;

  v3 = (void *)MEMORY[0x212BF5ECC](self, a2);
  +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeepAliveClearable:", 0);
  SULogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);

  if (v6)
  {
    v14 = objc_msgSend(v4, "isKeepAliveEnabled");
    v22 = CFSTR("DISABLED");
    if (v14)
      v22 = CFSTR("ENABLED");
    SULogInfo(CFSTR("Starting the server: keepAlive = %@"), v15, v16, v17, v18, v19, v20, v21, (uint64_t)v22);
  }
  else
  {
    SULogInfo(CFSTR("Starting the server."), v7, v8, v9, v10, v11, v12, v13, v30);
  }
  objc_msgSend(MEMORY[0x24BDD1998], "enableTransactions");
  v23 = dispatch_queue_create("com.apple.softwareupdateservices.connectionQueue", 0);
  v24 = (void *)__connectionQueue;
  __connectionQueue = (uint64_t)v23;

  v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.softwareupdateservicesd"));
  v26 = (void *)__listener;
  __listener = v25;

  objc_msgSend((id)__listener, "setDelegate:", self);
  objc_msgSend((id)__listener, "_setQueue:", __connectionQueue);
  objc_msgSend((id)__listener, "resume");
  objc_msgSend(v4, "beginTransaction:", CFSTR("SUMinimumLaunchTransaction"));
  v27 = dispatch_time(0, 10000000000);
  +[SUUtility mainWorkQueue](SUUtility, "mainWorkQueue");
  v28 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__SUManagerServer_Daemon__runUntilIdleExit__block_invoke;
  block[3] = &unk_24CE3B5C0;
  v32 = v4;
  v29 = v4;
  dispatch_after(v27, v28, block);

  -[SUManagerServer serverInitAndResumeWork](self, "serverInitAndResumeWork");
  -[SUManagerServer _run](self, "_run");
  objc_msgSend(v29, "clearKeepAliveIfNecessary:", 1);

  objc_autoreleasePoolPop(v3);
}

uint64_t __43__SUManagerServer_Daemon__runUntilIdleExit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endTransaction:", CFSTR("SUMinimumLaunchTransaction"));
}

- (void)_run
{
  const __CFString *v2;
  void *v3;
  CFRunLoopRunResult v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  while (1)
  {
    v3 = (void *)MEMORY[0x212BF5ECC](self, a2);
    v4 = CFRunLoopRunInMode(v2, 15.0, 0);
    if (v4 != kCFRunLoopRunTimedOut)
      break;
    +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copyTransactions");

    if (v6 && objc_msgSend(v6, "count"))
    {
      SULogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

      if (v8)
        SULogDebug(CFSTR("Software update daemon continuing to run - transactions: %@"), v9, v10, v11, v12, v13, v14, v15, (uint64_t)v6);
      else
        SULogInfo(CFSTR("Software update daemon continuing to run - busy."), v9, v10, v11, v12, v13, v14, v15, v16);
    }

LABEL_11:
    objc_autoreleasePoolPop(v3);
  }
  if ((v4 - 1) >= 2)
    goto LABEL_11;
  objc_autoreleasePoolPop(v3);
}

- (id)_clientForCurrentConnection
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  SUManagerServerClient *v9;
  SUManagerServerClient *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  SUManagerServer *v30;
  SUManagerServerClient *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;

  v5 = a4;
  if (-[SUManagerServer underExclusiveControl](self, "underExclusiveControl")
    && (objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.softwareupdateservices.client.allowed")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "BOOLValue"),
        v6,
        (v7 & 1) == 0))
  {
    v35 = 0u;
    v36 = 0u;
    if (v5)
      objc_msgSend(v5, "auditToken");
    v34 = 0;
    v32 = v35;
    v33 = v36;
    CPCopyBundleIdentifierAndTeamFromAuditToken();
    SULogInfo(CFSTR("connection refused for unentitled client %@"), v18, v19, v20, v21, v22, v23, v24, 0);
    v17 = 0;
  }
  else
  {
    +[SUTransactionManager sharedInstance](SUTransactionManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginTransaction:", CFSTR("SUAddClientTransaction"));
    objc_msgSend(v5, "_setQueue:", __connectionQueue);
    v9 = -[SUManagerServerClient initWithConnection:]([SUManagerServerClient alloc], "initWithConnection:", v5);
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __62__SUManagerServer_Daemon__listener_shouldAcceptNewConnection___block_invoke;
    v29 = &unk_24CE3B610;
    v30 = self;
    v31 = v9;
    v10 = v9;
    v11 = (void *)MEMORY[0x212BF6094](&v26);
    objc_msgSend(v5, "setInterruptionHandler:", v11);
    objc_msgSend(v5, "setInvalidationHandler:", v11);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B6B8B0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v12);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B64658);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0, v26, v27, v28, v29, v30);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 1;
    objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_getAllDeclarationsWithHandler_, 0, 1);

    objc_msgSend(v5, "setExportedInterface:", v13);
    objc_msgSend(v5, "setExportedObject:", self);
    objc_msgSend(v5, "setUserInfo:", v10);
    objc_msgSend(v5, "resume");
    -[SUManagerServer addClient:](self, "addClient:", v10);
    objc_msgSend(v8, "endTransaction:", CFSTR("SUAddClientTransaction"));

  }
  return v17;
}

uint64_t __62__SUManagerServer_Daemon__listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeClient:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyServerStart
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("SUDaemonStartedNotification"), 0, 0, 1u);
}

@end
