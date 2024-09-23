@implementation PDSDaemon

- (PDSDaemon)initWithConfiguration:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PDSDaemon *v10;
  uint64_t v11;
  PDSConfiguration *configuration;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemon.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));

  }
  objc_msgSend(v5, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemon.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.queue"));

  }
  objc_msgSend(v5, "workloop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemon.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.workloop"));

  }
  objc_msgSend(v5, "daemonRootDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemon.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.daemonRootDirectory"));

  }
  objc_msgSend(v5, "pushHandlerPort");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PDSDaemon.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration.pushHandlerPort"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PDSDaemon;
  v10 = -[PDSDaemon init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v5, "copy");
    configuration = v10->_configuration;
    v10->_configuration = (PDSConfiguration *)v11;

  }
  return v10;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[PDSDaemon configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __18__PDSDaemon_start__block_invoke;
  block[3] = &unk_24D4A6EE8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __18__PDSDaemon_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  PDSCDCacheContainer *v14;
  void *v15;
  void *v16;
  PDSCDCacheContainer *v17;
  PDSUserTracker *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  PDSRequestQueue *v24;
  void *v25;
  PDSRequestQueue *v26;
  void *v27;
  void *v28;
  void *v29;
  PDSCoordinator *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PDSCoordinator *v36;
  void *v37;
  PDSXPCServer *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  PDSXPCServer *v46;
  void *v47;
  dispatch_queue_t v48;
  PDSDaemonRemoteVendor *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  _BYTE buf[12];
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6E508], "setDisableXPC:", 1);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workloop");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = dispatch_queue_create_with_target_V2("com.apple.pds.idsd.queue", v2, v4);

  v48 = v5;
  v49 = -[PDSDaemonRemoteVendor initWithQueue:daemonListenerVendor:]([PDSDaemonRemoteVendor alloc], "initWithQueue:daemonListenerVendor:", v5, *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE6E4F8], "registerGlobalVendor:");
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workloop");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  createPDSServerBag(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBag:", v8);

  objc_msgSend(*(id *)(a1 + 32), "bag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startBagLoad");

  pds_defaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = PDSCurrentServerEnvironment();
    PDSStringForServerEnvironment(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    v63 = 2112;
    v64 = v13;
    _os_log_impl(&dword_215E64000, v10, OS_LOG_TYPE_DEFAULT, "Starting PDSAgent [Environment %@] [Configuration %@]", buf, 0x16u);

  }
  v14 = [PDSCDCacheContainer alloc];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "daemonRootDirectory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PDSCDCacheContainer initWithContainingPath:](v14, "initWithContainingPath:", v16);
  objc_msgSend(*(id *)(a1 + 32), "setCacheContainer:", v17);

  v18 = objc_alloc_init(PDSUserTracker);
  objc_msgSend(*(id *)(a1 + 32), "setUserTracker:", v18);

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "queue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v21 = MEMORY[0x24BDAC760];
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __18__PDSDaemon_start__block_invoke_53;
  v60[3] = &unk_24D4A7000;
  v51 = v20;
  v61 = v51;
  v53 = (void *)MEMORY[0x2199F31C4](v60);
  v22 = objc_alloc(MEMORY[0x24BE30358]);
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v22, "initWithIDSServerBag:", v23);

  v24 = [PDSRequestQueue alloc];
  objc_msgSend(*(id *)(a1 + 32), "userTracker");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v21;
  v58[1] = 3221225472;
  v58[2] = __18__PDSDaemon_start__block_invoke_2;
  v58[3] = &unk_24D4A7028;
  objc_copyWeak(&v59, (id *)buf);
  v26 = -[PDSRequestQueue initWithMessageDelivery:userTracker:queue:pushTokenBlock:entryStoreBlock:](v24, "initWithMessageDelivery:userTracker:queue:pushTokenBlock:entryStoreBlock:", v52, v25, v51, v53, v58);
  objc_msgSend(*(id *)(a1 + 32), "setRequestQueue:", v26);

  v27 = (void *)MEMORY[0x24BE4FE48];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pushHandlerPort");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sharedInstanceWithPortName:", v29);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = [PDSCoordinator alloc];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "queue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bag");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requestQueue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v21;
  v56[1] = 3221225472;
  v56[2] = __18__PDSDaemon_start__block_invoke_3;
  v56[3] = &unk_24D4A7050;
  objc_copyWeak(&v57, (id *)buf);
  v54[0] = v21;
  v54[1] = 3221225472;
  v54[2] = __18__PDSDaemon_start__block_invoke_4;
  v54[3] = &unk_24D4A7028;
  objc_copyWeak(&v55, (id *)buf);
  objc_msgSend(MEMORY[0x24BE508D0], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[PDSCoordinator initWithQueue:serverBag:requestQueue:kvStoreBlock:entryStoreBlock:pushTokenBlock:systemMonitor:pushHandler:](v30, "initWithQueue:serverBag:requestQueue:kvStoreBlock:entryStoreBlock:pushTokenBlock:systemMonitor:pushHandler:", v32, v33, v34, v56, v54, v53, v35, v50);
  objc_msgSend(*(id *)(a1 + 32), "setCoordinator:", v36);

  objc_msgSend(*(id *)(a1 + 32), "coordinator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "registerIfNeeded");

  v38 = [PDSXPCServer alloc];
  objc_msgSend(MEMORY[0x24BE6E508], "defaultListenerVendor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E508], "defaultInterfaceVendor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = *(void **)(a1 + 32);
  objc_msgSend(v41, "configuration");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "queue");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "workloop");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = -[PDSXPCServer initWithServiceName:listenerVendor:interfaceVendor:daemonListenerVendor:queue:workloop:](v38, "initWithServiceName:listenerVendor:interfaceVendor:daemonListenerVendor:queue:workloop:", *MEMORY[0x24BE6E530], v39, v40, v41, v43, v45);
  objc_msgSend(*(id *)(a1 + 32), "setXPCServer:", v46);

  objc_msgSend(*(id *)(a1 + 32), "XPCServer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "resume");

  objc_msgSend(*(id *)(a1 + 32), "_setupSysdiagnoseDump");
  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v59);
  objc_destroyWeak((id *)buf);

}

id __18__PDSDaemon_start__block_invoke_53(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BE08738];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithEnvironmentName:namedDelegatePort:queue:", v4, *MEMORY[0x24BE08708], *(_QWORD *)(a1 + 32));

  objc_msgSend(v6, "publicToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __18__PDSDaemon_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_entryStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __18__PDSDaemon_start__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_underlyingStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __18__PDSDaemon_start__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_entryStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)remoteListenerForClientIDs:(id)a3
{
  id v4;
  void *v5;
  PDSDaemonListener *v6;
  void *v7;
  PDSDaemonListener *v8;

  v4 = a3;
  -[PDSDaemon _entryStore](self, "_entryStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [PDSDaemonListener alloc];
    -[PDSDaemon userTracker](self, "userTracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PDSDaemonListener initWithClientIDs:entryStore:userTracker:](v6, "initWithClientIDs:entryStore:userTracker:", v4, v5, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)remoteListenerForAllClientIDs
{
  void *v3;
  PDSDaemonListener *v4;
  void *v5;
  PDSDaemonListener *v6;

  -[PDSDaemon _entryStore](self, "_entryStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [PDSDaemonListener alloc];
    -[PDSDaemon userTracker](self, "userTracker");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PDSDaemonListener initWithEntryStore:userTracker:](v4, "initWithEntryStore:userTracker:", v3, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)remoteInternalListener
{
  PDSInternalDaemonListener *v3;
  void *v4;
  PDSInternalDaemonListener *v5;

  v3 = [PDSInternalDaemonListener alloc];
  -[PDSDaemon _underlyingStorage](self, "_underlyingStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PDSInternalDaemonListener initWithKVStore:](v3, "initWithKVStore:", v4);

  return v5;
}

- (id)_underlyingStorage
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  -[PDSDaemon underlyingStorage](self, "underlyingStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PDSDaemon cacheContainer](self, "cacheContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    objc_msgSend(v4, "loadWithError:", &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;

    if (!v3)
    {
      pds_defaultLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[PDSDaemon _underlyingStorage].cold.1((uint64_t)v5, v6);

    }
  }
  return v3;
}

- (id)_entryStore
{
  PDSEntryStore *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[PDSDaemon entryStore](self, "entryStore");
  v3 = (PDSEntryStore *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PDSDaemon _underlyingStorage](self, "_underlyingStorage");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v3 = -[PDSEntryStore initWithCache:]([PDSEntryStore alloc], "initWithCache:", v4);
      -[PDSDaemon setEntryStore:](self, "setEntryStore:", v3);
      -[PDSDaemon coordinator](self, "coordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PDSEntryStore setDelegate:](v3, "setDelegate:", v6);

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (void)_setupSysdiagnoseDump
{
  void *v2;
  void *v3;

  -[PDSDaemon configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMLogRegisterStateToSysdiagnoseBlock();

}

id __34__PDSDaemon__setupSysdiagnoseDump__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_entryStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend(v2, "appendString:", CFSTR("Users:\n"));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v1, "users");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(v2, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }

    objc_msgSend(v2, "appendString:", CFSTR("Entries:\n"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v1, "entries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v2, "appendFormat:", CFSTR("\t%@\n"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v10);
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (PDSConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (PDSXPCServer)XPCServer
{
  return self->_XPCServer;
}

- (void)setXPCServer:(id)a3
{
  objc_storeStrong((id *)&self->_XPCServer, a3);
}

- (PDSCDCacheContainer)cacheContainer
{
  return self->_cacheContainer;
}

- (void)setCacheContainer:(id)a3
{
  objc_storeStrong((id *)&self->_cacheContainer, a3);
}

- (IDSServerBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (PDSEntryStore)entryStore
{
  return (PDSEntryStore *)objc_loadWeakRetained((id *)&self->_entryStore);
}

- (void)setEntryStore:(id)a3
{
  objc_storeWeak((id *)&self->_entryStore, a3);
}

- (PDSCDCache)underlyingStorage
{
  return (PDSCDCache *)objc_loadWeakRetained((id *)&self->_underlyingStorage);
}

- (void)setUnderlyingStorage:(id)a3
{
  objc_storeWeak((id *)&self->_underlyingStorage, a3);
}

- (PDSUserTracker)userTracker
{
  return self->_userTracker;
}

- (void)setUserTracker:(id)a3
{
  objc_storeStrong((id *)&self->_userTracker, a3);
}

- (PDSCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_coordinator, a3);
}

- (PDSRequestQueue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_userTracker, 0);
  objc_destroyWeak((id *)&self->_underlyingStorage);
  objc_destroyWeak((id *)&self->_entryStore);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_cacheContainer, 0);
  objc_storeStrong((id *)&self->_XPCServer, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)_underlyingStorage
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215E64000, a2, OS_LOG_TYPE_ERROR, "Failed loading cache {error: %@}", (uint8_t *)&v2, 0xCu);
}

@end
