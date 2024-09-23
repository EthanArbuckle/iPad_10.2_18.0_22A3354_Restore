@implementation UNCNotificationSystemServiceListener

- (UNCNotificationSystemServiceListener)initWithDelegate:(id)a3
{
  id v4;
  UNCNotificationSystemServiceListener *v5;
  UNCNotificationSystemServiceListener *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  uint64_t v10;
  NSMutableArray *queue_connections;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCNotificationSystemServiceListener;
  v5 = -[UNCNotificationSystemServiceListener init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.usernotifications.UNCNotificationSystemServiceListener", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    queue_connections = v6->_queue_connections;
    v6->_queue_connections = (NSMutableArray *)v10;

  }
  return v6;
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UNCNotificationSystemServiceListener_dealloc__block_invoke;
  block[3] = &unk_251AE02A0;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)UNCNotificationSystemServiceListener;
  -[UNCNotificationSystemServiceListener dealloc](&v4, sel_dealloc);
}

uint64_t __47__UNCNotificationSystemServiceListener_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
}

- (void)activate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BSServiceConnectionListener *v7;
  BSServiceConnectionListener *queue_listener;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  UNCNotificationSystemServiceListener *v20;

  +[UNCNotificationSystemService domain](UNCNotificationSystemService, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UNCNotificationSystemService serviceInterface](UNCNotificationSystemService, "serviceInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSServiceConnectionListener invalidate](self->_queue_listener, "invalidate");
  v5 = (void *)MEMORY[0x24BE0FA28];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__UNCNotificationSystemServiceListener_activate__block_invoke;
  v17[3] = &unk_251AE08B8;
  v16 = v3;
  v18 = v16;
  v6 = v4;
  v19 = v6;
  v20 = self;
  objc_msgSend(v5, "listenerWithConfigurator:", v17);
  v7 = (BSServiceConnectionListener *)objc_claimAutoreleasedReturnValue();
  queue_listener = self->_queue_listener;
  self->_queue_listener = v7;

  -[BSServiceConnectionListener activate](self->_queue_listener, "activate");
  objc_msgSend(MEMORY[0x24BE0FA40], "bootstrapConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainForIdentifier:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "optionForKey:", CFSTR("isAutomatic"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  if ((v14 & 1) == 0)
    v15 = (id)objc_msgSend(MEMORY[0x24BE0FA40], "activateManualDomain:", v16);

}

void __48__UNCNotificationSystemServiceListener_activate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setDomain:", v3);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 48));
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  UNCNotificationSystemServiceListener *v11;

  v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __82__UNCNotificationSystemServiceListener_listener_didReceiveConnection_withContext___block_invoke;
  v9[3] = &unk_251AE01A0;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, v9);

}

void __82__UNCNotificationSystemServiceListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  UNCNotificationSystemServiceConnection *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  UNCNotificationSystemServiceConnection *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "remoteToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasEntitlement:", CFSTR("com.apple.private.usernotifications.systemservice")) & 1) != 0)
  {
    v3 = [UNCNotificationSystemServiceConnection alloc];
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    v7 = -[UNCNotificationSystemServiceConnection initWithConnection:connectionDelegate:delegate:](v3, "initWithConnection:connectionDelegate:delegate:", v4, v5, WeakRetained);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "addObject:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
    v8 = (void *)*MEMORY[0x24BDF8998];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8998], OS_LOG_TYPE_ERROR))
      __82__UNCNotificationSystemServiceListener_listener_didReceiveConnection_withContext___block_invoke_cold_1(v8, v2);
  }

}

- (void)systemServiceConnectionDidInvalidate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__UNCNotificationSystemServiceListener_systemServiceConnectionDidInvalidate___block_invoke;
  v7[3] = &unk_251AE01A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __77__UNCNotificationSystemServiceListener_systemServiceConnectionDidInvalidate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectIdenticalTo:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_connections, 0);
  objc_storeStrong((id *)&self->_queue_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __82__UNCNotificationSystemServiceListener_listener_didReceiveConnection_withContext___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = (id)objc_opt_class();
  v5 = v9;
  _os_log_error_impl(&dword_2499A5000, v3, OS_LOG_TYPE_ERROR, "Entitlement is missing. %{public}@ could not connect to %{public}@.", (uint8_t *)&v6, 0x16u);

}

@end
