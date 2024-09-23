@implementation URTAlertService

- (URTAlertService)initWithDomain:(id)a3
{
  id v5;
  URTAlertService *v6;
  URTAlertService *v7;
  uint64_t v8;
  NSMutableArray *connections;
  URTAlertServiceDelegateProxy *v10;
  URTAlertServiceDelegateProxy *delegateProxy;
  void *v12;
  uint64_t v13;
  OS_dispatch_queue *connectionQueue;
  void *v15;
  id v16;
  URTAlertService *v17;
  uint64_t v18;
  BSServiceConnectionListener *listener;
  NSObject *v20;
  BSServiceConnectionListener *v21;
  uint64_t v22;
  BSInvalidatable *domainActivationToken;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  id v29;
  URTAlertService *v30;
  objc_super v31;
  uint8_t buf[4];
  BSServiceConnectionListener *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)URTAlertService;
  v6 = -[URTAlertService init](&v31, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_domain, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
    connections = v7->_connections;
    v7->_connections = (NSMutableArray *)v8;

    v10 = -[URTAlertServiceDelegateProxy initWithService:]([URTAlertServiceDelegateProxy alloc], "initWithService:", v7);
    delegateProxy = v7->_delegateProxy;
    v7->_delegateProxy = v10;

    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = BSDispatchQueueCreate();
    connectionQueue = v7->_connectionQueue;
    v7->_connectionQueue = (OS_dispatch_queue *)v13;

    v15 = (void *)MEMORY[0x24BE0FA28];
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __34__URTAlertService_initWithDomain___block_invoke;
    v28 = &unk_24DC7AFC8;
    v16 = v5;
    v29 = v16;
    v17 = v7;
    v30 = v17;
    objc_msgSend(v15, "listenerWithConfigurator:", &v25);
    v18 = objc_claimAutoreleasedReturnValue();
    listener = v17->_listener;
    v17->_listener = (BSServiceConnectionListener *)v18;

    URTLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = v17->_listener;
      *(_DWORD *)buf = 138412290;
      v33 = v21;
      _os_log_impl(&dword_21A1D3000, v20, OS_LOG_TYPE_INFO, "Activating listener! %@", buf, 0xCu);
    }

    -[BSServiceConnectionListener activate](v17->_listener, "activate", v25, v26, v27, v28);
    objc_msgSend(MEMORY[0x24BE0FA40], "activateManualDomain:", v16);
    v22 = objc_claimAutoreleasedReturnValue();
    domainActivationToken = v17->_domainActivationToken;
    v17->_domainActivationToken = (BSInvalidatable *)v22;

  }
  return v7;
}

void __34__URTAlertService_initWithDomain___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setDomain:", v3);
  +[URTAlertServiceSpecification identifier](URTAlertServiceSpecification, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 40));
}

- (void)invalidate
{
  void *v3;
  id v4;

  -[URTAlertService domainActivationToken](self, "domainActivationToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[URTAlertService listener](self, "listener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  _QWORD v21[5];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  URTLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "instance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_21A1D3000, v7, OS_LOG_TYPE_INFO, "Received connection! %@, reason: %@", buf, 0x16u);

  }
  objc_msgSend(v6, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[URTAlertServiceSpecification entitlementName](URTAlertServiceSpecification, "entitlementName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForEntitlement:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[URTAlertService domain](self, "domain"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v11, "containsObject:", v12),
        v12,
        (v13 & 1) != 0))
  {
    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke;
    v21[3] = &unk_24DC7B018;
    v21[4] = self;
    objc_msgSend(v6, "configureConnection:", v21);
    URTLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_21A1D3000, v15, OS_LOG_TYPE_INFO, "Activating connection... %@", buf, 0xCu);
    }

    -[URTAlertService connectionQueue](self, "connectionQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = v14;
    block[1] = 3221225472;
    block[2] = __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke_86;
    block[3] = &unk_24DC7B040;
    block[4] = self;
    v17 = v6;
    v20 = v17;
    dispatch_async(v16, block);

    objc_msgSend(v17, "activate");
  }
  else
  {
    URTLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[URTAlertService listener:didReceiveConnection:withContext:].cold.1(v6, self, v18);

    objc_msgSend(v6, "invalidate");
  }

}

void __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v3 = a2;
  +[URTAlertServiceSpecification serviceQuality](URTAlertServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[URTAlertServiceSpecification interface](URTAlertServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(*(id *)(a1 + 32), "delegateProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterfaceTarget:", v6);

  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke_2;
  v11 = &unk_24DC7AFF0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v8);
  objc_msgSend(*(id *)(a1 + 32), "connectionQueue", v8, v9, v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  URTLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_21A1D3000, v4, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionQueue_removeConnection:", v3);

}

uint64_t __61__URTAlertService_listener_didReceiveConnection_withContext___block_invoke_86(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4;
  void *v5;
  URTAlertConnection *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[URTAlertService connectionQueue](self, "connectionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  v6 = -[URTAlertConnection initWithConnection:]([URTAlertConnection alloc], "initWithConnection:", v4);
  -[URTAlertService connections](self, "connections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  URTLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[URTAlertService connections](self, "connections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v4;
    v12 = 2048;
    v13 = objc_msgSend(v9, "count");
    _os_log_impl(&dword_21A1D3000, v8, OS_LOG_TYPE_INFO, "Added connection %@, connection count: %ld", (uint8_t *)&v10, 0x16u);

  }
}

- (id)_connectionQueue_alertConnectionForConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[URTAlertService connectionQueue](self, "connectionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[URTAlertService connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__URTAlertService__connectionQueue_alertConnectionForConnection___block_invoke;
  v10[3] = &unk_24DC7B068;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "bs_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __65__URTAlertService__connectionQueue_alertConnectionForConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_connectionQueue_presentAlert:(id)a3 preferringPresentationStyle:(int64_t)a4 forConnection:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  URTAlertService *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id from;
  id location[2];

  v7 = a3;
  v8 = a5;
  -[URTAlertService connectionQueue](self, "connectionQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[URTAlertService _connectionQueue_alertConnectionForConnection:](self, "_connectionQueue_alertConnectionForConnection:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "setAlert:", v7);
  objc_initWeak(location, self);
  objc_initWeak(&from, v7);
  objc_msgSend(v7, "defaultAction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    objc_msgSend(v7, "defaultAction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "title");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v13;
    v34[1] = 3221225472;
    v34[2] = __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke;
    v34[3] = &unk_24DC7B0D0;
    objc_copyWeak(&v35, location);
    objc_copyWeak(&v36, &from);
    +[URTAlertAction actionWithTitle:handler:](URTAlertAction, "actionWithTitle:handler:", v15, v34);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultAction:", v16);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&v35);
    v13 = MEMORY[0x24BDAC760];
  }
  objc_msgSend(v7, "otherAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v7, "otherAction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = self;
    v31[0] = v13;
    v31[1] = 3221225472;
    v31[2] = __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_2;
    v31[3] = &unk_24DC7B0D0;
    objc_copyWeak(&v32, location);
    objc_copyWeak(&v33, &from);
    +[URTAlertAction actionWithTitle:handler:](URTAlertAction, "actionWithTitle:handler:", v19, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOtherAction:", v20);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v32);
  }
  objc_msgSend(v7, "cancelAction", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v7, "cancelAction");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v13;
    v28[1] = 3221225472;
    v28[2] = __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_2_96;
    v28[3] = &unk_24DC7B0D0;
    objc_copyWeak(&v29, location);
    objc_copyWeak(&v30, &from);
    +[URTAlertAction actionWithTitle:handler:](URTAlertAction, "actionWithTitle:handler:", v23, v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCancelAction:", v24);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
  }
  -[URTAlertService delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v25, "alertService:wantsPresentationForAlert:preferredPresentationStyle:", self, v7, a4);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);

}

void __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  URTLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21A1D3000, v4, OS_LOG_TYPE_DEFAULT, "Alert: default action \"%@\" tapped", (uint8_t *)&v8, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performClientActionForAlert:clientAction:", v7, &__block_literal_global_1);

}

uint64_t __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_91(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleDefaultAction");
}

void __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  URTLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21A1D3000, v4, OS_LOG_TYPE_DEFAULT, "Alert: other action \"%@\" tapped", (uint8_t *)&v8, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performClientActionForAlert:clientAction:", v7, &__block_literal_global_95);

}

uint64_t __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_94(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleOtherAction");
}

void __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_2_96(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  URTLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21A1D3000, v4, OS_LOG_TYPE_DEFAULT, "Alert: cancel action \"%@\" tapped", (uint8_t *)&v8, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_performClientActionForAlert:clientAction:", v7, &__block_literal_global_98);

}

uint64_t __91__URTAlertService__connectionQueue_presentAlert_preferringPresentationStyle_forConnection___block_invoke_97(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleCancelAction");
}

- (void)_performClientActionForAlert:(id)a3 clientAction:(id)a4
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
  -[URTAlertService connectionQueue](self, "connectionQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__URTAlertService__performClientActionForAlert_clientAction___block_invoke;
  block[3] = &unk_24DC7B138;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __61__URTAlertService__performClientActionForAlert_clientAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__URTAlertService__performClientActionForAlert_clientAction___block_invoke_2;
  v10[3] = &unk_24DC7B068;
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v2, "bs_firstObjectPassingTest:", v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 48);
    if (v4)
    {
      objc_msgSend(v3, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "remoteTarget");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

    }
    v8 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_connectionQueue_dismissAlert:forConnection:", v7, v9);

  }
}

uint64_t __61__URTAlertService__performClientActionForAlert_clientAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "alert");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_connectionQueue_dismissAlert:(id)a3 forConnection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[URTAlertService connectionQueue](self, "connectionQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[URTAlertService delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "alertService:wantsDismissalForAlert:", self, v11);
  -[URTAlertService _connectionQueue_alertConnectionForConnection:](self, "_connectionQueue_alertConnectionForConnection:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "setAlert:", 0);

}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[URTAlertService connectionQueue](self, "connectionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  -[URTAlertService _connectionQueue_alertConnectionForConnection:](self, "_connectionQueue_alertConnectionForConnection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "alert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      URTLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_21A1D3000, v9, OS_LOG_TYPE_INFO, "Dismissing alert due to client disconnection", (uint8_t *)&v15, 2u);
      }

      -[URTAlertService delegateProxy](self, "delegateProxy");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dismissAlert:", v8);

    }
    -[URTAlertService connections](self, "connections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v7);

    URTLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[URTAlertService connections](self, "connections");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");
      v15 = 138412546;
      v16 = v4;
      v17 = 2048;
      v18 = v14;
      _os_log_impl(&dword_21A1D3000, v12, OS_LOG_TYPE_INFO, "Removed connection %@, connection count: %ld", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (URTAlertServiceDelegate)delegate
{
  return (URTAlertServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)domain
{
  return self->_domain;
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (BSInvalidatable)domainActivationToken
{
  return self->_domainActivationToken;
}

- (void)setDomainActivationToken:(id)a3
{
  objc_storeStrong((id *)&self->_domainActivationToken, a3);
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (URTAlertServiceDelegateProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_domainActivationToken, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(void *)a1 didReceiveConnection:(void *)a2 withContext:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "remoteProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[URTAlertServiceSpecification entitlementName](URTAlertServiceSpecification, "entitlementName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_21A1D3000, a3, OS_LOG_TYPE_ERROR, "Process %@ does not have an array for the alert entitlement %@ that contains the destination %@", (uint8_t *)&v8, 0x20u);

}

@end
