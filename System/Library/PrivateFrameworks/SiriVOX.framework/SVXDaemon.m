@implementation SVXDaemon

- (SVXDaemon)init
{
  SVXPlatformDependenciesTracker *v3;
  SVXDaemonRunningObserver *v4;
  SVXRemoraVirtualDeviceManager *v5;
  SVXVirtualDeviceManager *v6;
  SVXSiriActivationListenerDelegate *v7;
  SVXHomeHubManagerObserver *v8;
  SVXRebootExecutor *v9;
  SVXClientServiceServerConnectionFactory *v10;
  SVXDaemon *v12;
  SVXQueuePerformer *v13;
  void *v14;
  void *v15;

  v13 = -[SVXQueuePerformer initWithIdentifier:qosClass:relativePriority:options:]([SVXQueuePerformer alloc], "initWithIdentifier:qosClass:relativePriority:options:", CFSTR("com.apple.SiriVOXService.client-service"), 33, 0, 2);
  +[SVXQueuePerformer sharedMainQueuePerformer](SVXQueuePerformer, "sharedMainQueuePerformer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.SiriVOXService.client"));
  v3 = objc_alloc_init(SVXPlatformDependenciesTracker);
  v4 = objc_alloc_init(SVXDaemonRunningObserver);
  v5 = -[SVXRemoraVirtualDeviceManager initWithRunningObserver:]([SVXRemoraVirtualDeviceManager alloc], "initWithRunningObserver:", v4);
  v6 = -[SVXVirtualDeviceManager initWithRemoraVirtualDeviceManager:]([SVXVirtualDeviceManager alloc], "initWithRemoraVirtualDeviceManager:", v5);
  v7 = -[SVXSiriActivationListenerDelegate initWithVirtualDeviceManager:]([SVXSiriActivationListenerDelegate alloc], "initWithVirtualDeviceManager:", v6);
  v8 = -[SVXHomeHubManagerObserver initWithRemoraVirtualDeviceManager:platformDependenciesTracker:]([SVXHomeHubManagerObserver alloc], "initWithRemoraVirtualDeviceManager:platformDependenciesTracker:", v5, v3);
  v9 = objc_alloc_init(SVXRebootExecutor);
  v10 = objc_alloc_init(SVXClientServiceServerConnectionFactory);
  v12 = -[SVXDaemon initWithClientServiceQueuePerformer:mainQueuePerformer:clientServiceListener:platformDependenciesTracker:virtualDeviceManager:runningObserver:siriActivationListenerDelegate:remoraVirtualDeviceManager:homeHubManagerObserver:rebootExecutor:connectionFactory:](self, "initWithClientServiceQueuePerformer:mainQueuePerformer:clientServiceListener:platformDependenciesTracker:virtualDeviceManager:runningObserver:siriActivationListenerDelegate:remoraVirtualDeviceManager:homeHubManagerObserver:rebootExecutor:connectionFactory:", v13, v15, v14, v3, v6, v4, v7, v5, v8, v9, v10);

  return v12;
}

- (SVXDaemon)initWithClientServiceQueuePerformer:(id)a3 mainQueuePerformer:(id)a4 clientServiceListener:(id)a5 platformDependenciesTracker:(id)a6 virtualDeviceManager:(id)a7 runningObserver:(id)a8 siriActivationListenerDelegate:(id)a9 remoraVirtualDeviceManager:(id)a10 homeHubManagerObserver:(id)a11 rebootExecutor:(id)a12 connectionFactory:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SVXDaemon *v23;
  SVXDaemon *v24;
  NSXPCListener *clientServiceListener;
  void *v26;
  id v29;
  id v30;
  id v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v39 = a3;
  v38 = a4;
  v29 = a5;
  v37 = a5;
  v30 = a6;
  v36 = a6;
  v31 = a7;
  v35 = a7;
  v32 = a8;
  v34 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v40.receiver = self;
  v40.super_class = (Class)SVXDaemon;
  v23 = -[SVXDaemon init](&v40, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_clientServiceQueuePerformer, a3);
    objc_storeStrong((id *)&v24->_mainQueuePerformer, a4);
    objc_storeStrong((id *)&v24->_clientServiceListener, v29);
    -[NSXPCListener setDelegate:](v24->_clientServiceListener, "setDelegate:", v24);
    clientServiceListener = v24->_clientServiceListener;
    -[SVXQueuePerformer queue](v24->_clientServiceQueuePerformer, "queue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCListener _setQueue:](clientServiceListener, "_setQueue:", v26);

    objc_storeStrong((id *)&v24->_platformDependenciesTracker, v30);
    objc_storeStrong((id *)&v24->_virtualDeviceManager, v31);
    objc_storeStrong((id *)&v24->_runningObserver, v32);
    objc_storeStrong((id *)&v24->_siriActivationListenerDelegate, a9);
    objc_storeStrong((id *)&v24->_remoraVirtualDeviceManager, a10);
    objc_storeStrong((id *)&v24->_homeHubManagerObserver, a11);
    objc_storeStrong((id *)&v24->_rebootExecutor, a12);
    objc_storeStrong((id *)&v24->_connectionFactory, a13);
  }

  return v24;
}

- (void)startWithPlatformDependencies:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  SVXQueuePerformer *mainQueuePerformer;
  id v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x24BDD1760];
    v7 = v5;
    objc_msgSend(v6, "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "processIdentifier");
    AFBuildVersion();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v18 = "-[SVXDaemon startWithPlatformDependencies:]";
    v19 = 2112;
    v20 = v9;
    v21 = 1024;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s Starting SiriVOX service in %@ (pid=%d) on %@...", buf, 0x26u);

  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __43__SVXDaemon_startWithPlatformDependencies___block_invoke;
  v15[3] = &unk_24D24F018;
  v15[4] = self;
  v16 = v4;
  v14 = v4;
  -[SVXQueuePerformer performBlock:withOptions:](mainQueuePerformer, "performBlock:withOptions:", v15, 2);

}

- (void)stop
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  SVXQueuePerformer *mainQueuePerformer;
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x24BDD1760];
    v5 = v3;
    objc_msgSend(v4, "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processIdentifier");
    AFBuildVersion();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v14 = "-[SVXDaemon stop]";
    v15 = 2112;
    v16 = v7;
    v17 = 1024;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s Stopping SiriVOX service in %@ (pid=%d) on %@...", buf, 0x26u);

  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __17__SVXDaemon_stop__block_invoke;
  v12[3] = &unk_24D24EFF0;
  v12[4] = self;
  -[SVXQueuePerformer performBlock:withOptions:](mainQueuePerformer, "performBlock:withOptions:", v12, 2);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (NSXPCListener *)a3;
  v7 = a4;
  if (self->_clientServiceListener == v6)
  {
    v9 = -[SVXDaemon handleClientServiceXPCConnection:](self, "handleClientServiceXPCConnection:", v7);
  }
  else
  {
    v8 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[SVXDaemon listener:shouldAcceptNewConnection:]";
      _os_log_error_impl(&dword_214934000, v8, OS_LOG_TYPE_ERROR, "%s Ignored because the XPC listener is unexpected.", (uint8_t *)&v11, 0xCu);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)handleClientServiceXPCConnection:(id)a3
{
  uint64_t (*v4)(uint64_t, uint64_t);
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  SVXQueuePerformer *clientServiceQueuePerformer;
  BOOL v13;
  NSObject *v14;
  const char *v15;
  _QWORD v17[6];
  uint8_t v18[4];
  const char *v19;
  __int16 v20;
  uint64_t v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (*)(uint64_t, uint64_t))a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[SVXDaemon handleClientServiceXPCConnection:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = CFSTR("com.apple.SiriVOXService.client");
    *(_WORD *)&buf[22] = 2112;
    v23 = v4;
    _os_log_impl(&dword_214934000, v6, OS_LOG_TYPE_INFO, "%s Checking entitlement %@ on %@...", buf, 0x20u);
  }
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.SiriVOXService.client"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
LABEL_13:
      v13 = 0;
      goto LABEL_14;
    }
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SVXDaemon handleClientServiceXPCConnection:]";
    v15 = "%s Entitlement value of SVXMachServiceEntitlements.clientService is expected to be an NSNumber.";
LABEL_16:
    _os_log_error_impl(&dword_214934000, v14, OS_LOG_TYPE_ERROR, v15, buf, 0xCu);
    goto LABEL_13;
  }
  if ((objc_msgSend(v7, "BOOLValue") & 1) == 0)
  {
    v14 = *v5;
    if (!os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[SVXDaemon handleClientServiceXPCConnection:]";
    v15 = "%s Entitlement value of SVXMachServiceEntitlements.clientService is expected to be true.";
    goto LABEL_16;
  }
  -[SVXQueuePerformer queue](self->_clientServiceQueuePerformer, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setQueue:", v8);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__11850;
  v24 = __Block_byref_object_dispose__11851;
  -[SVXClientServiceServerConnectionFactory createWithXPCConnection:performer:delegate:](self->_connectionFactory, "createWithXPCConnection:performer:delegate:", v4, self->_clientServiceQueuePerformer, self);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v9 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v18 = 136315394;
    v19 = "-[SVXDaemon handleClientServiceXPCConnection:]";
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Connected to %@.", v18, 0x16u);
    v9 = *v5;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v11 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
    *(_DWORD *)v18 = 136315394;
    v19 = "-[SVXDaemon handleClientServiceXPCConnection:]";
    v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_214934000, v9, OS_LOG_TYPE_INFO, "%s Checking instance info on %@...", v18, 0x16u);
  }
  clientServiceQueuePerformer = self->_clientServiceQueuePerformer;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke;
  v17[3] = &unk_24D24E8D0;
  v17[4] = self;
  v17[5] = buf;
  -[SVXQueuePerformer performBlock:withOptions:](clientServiceQueuePerformer, "performBlock:withOptions:", v17, 0);
  objc_msgSend(v4, "resume");
  _Block_object_dispose(buf, 8);

  v13 = 1;
LABEL_14:

  return v13;
}

- (void)clientServiceServerConnectionDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  SVXQueuePerformer *mainQueuePerformer;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SVXDaemon clientServiceServerConnectionDidInvalidate:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s connection = %@", buf, 0x16u);
  }
  mainQueuePerformer = self->_mainQueuePerformer;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__SVXDaemon_clientServiceServerConnectionDidInvalidate___block_invoke;
  v8[3] = &unk_24D24F018;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[SVXQueuePerformer performBlock:](mainQueuePerformer, "performBlock:", v8);

}

- (void)_enumerateVirtualDevicesUsingBlock:(id)a3
{
  SVXVirtualDeviceManager *virtualDeviceManager;
  id v5;
  id v6;

  if (a3)
  {
    virtualDeviceManager = self->_virtualDeviceManager;
    v5 = a3;
    -[SVXVirtualDeviceManager hostVirtualDevice](virtualDeviceManager, "hostVirtualDevice");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id))a3 + 2))(v5, v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionFactory, 0);
  objc_storeStrong((id *)&self->_rebootExecutor, 0);
  objc_storeStrong((id *)&self->_homeHubManagerObserver, 0);
  objc_storeStrong((id *)&self->_remoraVirtualDeviceManager, 0);
  objc_storeStrong((id *)&self->_siriActivationListenerDelegate, 0);
  objc_storeStrong((id *)&self->_runningObserver, 0);
  objc_storeStrong((id *)&self->_virtualDeviceManager, 0);
  objc_storeStrong((id *)&self->_platformDependenciesTracker, 0);
  objc_storeStrong((id *)&self->_clientServiceListener, 0);
  objc_storeStrong((id *)&self->_mainQueuePerformer, 0);
  objc_storeStrong((id *)&self->_clientServiceQueuePerformer, 0);
}

void __56__SVXDaemon_clientServiceServerConnectionDidInvalidate___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__SVXDaemon_clientServiceServerConnectionDidInvalidate___block_invoke_2;
  v2[3] = &unk_24D24E8F8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_enumerateVirtualDevicesUsingBlock:", v2);

}

void __56__SVXDaemon_clientServiceServerConnectionDidInvalidate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "clientServiceServer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConnection:", *(_QWORD *)(a1 + 32));

}

uint64_t __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(v1 + 8) + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_2;
  v5[3] = &unk_24D24E8A8;
  v5[4] = v2;
  v5[5] = v1;
  return objc_msgSend(v3, "getInstanceInfoWithCompletion:", v5);
}

void __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315650;
      v17 = "-[SVXDaemon handleClientServiceXPCConnection:]_block_invoke_2";
      v18 = 2112;
      v19 = v5;
      v20 = 2112;
      v21 = v3;
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Instance info on %@ is %@.", buf, 0x20u);
    }
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_14;
    v13[3] = &unk_24D24E880;
    v13[4] = v6;
    v8 = v3;
    v9 = *(_QWORD *)(a1 + 40);
    v14 = v8;
    v15 = v9;
    objc_msgSend(v7, "performBlock:", v13);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 136315394;
      v17 = "-[SVXDaemon handleClientServiceXPCConnection:]_block_invoke";
      v18 = 2112;
      v19 = v12;
      _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s Instance info on %@ is unavailable. Disconnect now.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "invalidate");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;

  }
}

uint64_t __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_14(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_2_15;
  v4[3] = &unk_24D24E858;
  v4[4] = a1[6];
  return objc_msgSend(v2, "getVirtualDeviceForInstanceInfo:completion:", v1, v4);
}

void __46__SVXDaemon_handleClientServiceXPCConnection___block_invoke_2_15(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v10 = 136315650;
      v11 = "-[SVXDaemon handleClientServiceXPCConnection:]_block_invoke_2";
      v12 = 2112;
      v13 = v5;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_214934000, v4, OS_LOG_TYPE_INFO, "%s Virtual device for %@ is %@.", (uint8_t *)&v10, 0x20u);
    }
    objc_msgSend(v3, "clientServiceServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addConnection:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v10 = 136315394;
      v11 = "-[SVXDaemon handleClientServiceXPCConnection:]_block_invoke";
      v12 = 2112;
      v13 = v9;
      _os_log_error_impl(&dword_214934000, v4, OS_LOG_TYPE_ERROR, "%s Virtual device for %@ is unavailable. Disconnect now.", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "invalidate");
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

}

void __17__SVXDaemon_stop__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isRunning"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setIsRunning:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "stop");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "suspend");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "hostVirtualDevice");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stop");

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPlatformDependencies:", 0);
  }
  v3 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v4 = (void *)MEMORY[0x24BDD1760];
    v5 = v3;
    objc_msgSend(v4, "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "processIdentifier");
    AFBuildVersion();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315906;
    v12 = "-[SVXDaemon stop]_block_invoke";
    v13 = 2112;
    v14 = v7;
    v15 = 1024;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_214934000, v5, OS_LOG_TYPE_INFO, "%s Stopped SiriVOX service in %@ (pid=%d) on %@.", (uint8_t *)&v11, 0x26u);

  }
}

void __43__SVXDaemon_startWithPlatformDependencies___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isRunning") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setIsRunning:", 1);
    v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setPlatformDependencies:", v2);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "hostVirtualDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "platformDependencies");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startWithPlatformDependencies:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "start");
  }
  v5 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x24BDD1760];
    v7 = v5;
    objc_msgSend(v6, "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "processIdentifier");
    AFBuildVersion();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[SVXDaemon startWithPlatformDependencies:]_block_invoke";
    v15 = 2112;
    v16 = v9;
    v17 = 1024;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_INFO, "%s Started SiriVOX service in %@ (pid=%d) on %@.", (uint8_t *)&v13, 0x26u);

  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    AFLogInitIfNeeded();
}

@end
