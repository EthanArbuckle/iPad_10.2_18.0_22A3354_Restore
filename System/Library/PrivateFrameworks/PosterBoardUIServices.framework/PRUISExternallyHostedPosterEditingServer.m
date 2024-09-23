@implementation PRUISExternallyHostedPosterEditingServer

- (PRUISExternallyHostedPosterEditingServer)init
{
  PRUISExternallyHostedPosterEditingServer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  PRUISExternallyHostedPosterEditingServer *v6;
  uint64_t v7;
  BSServiceConnectionListener *connectionListener;
  uint64_t v9;
  NSMutableArray *connections;
  uint64_t v11;
  NSMapTable *connectionsByEditingRequest;
  _QWORD v14[4];
  PRUISExternallyHostedPosterEditingServer *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PRUISExternallyHostedPosterEditingServer;
  v2 = -[PRUISExternallyHostedPosterEditingServer init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.posterboardui.externalEditing.Server.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (void *)MEMORY[0x24BE38038];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__PRUISExternallyHostedPosterEditingServer_init__block_invoke;
    v14[3] = &unk_251535DE0;
    v6 = v2;
    v15 = v6;
    objc_msgSend(v5, "listenerWithConfigurator:", v14);
    v7 = objc_claimAutoreleasedReturnValue();
    connectionListener = v6->_connectionListener;
    v6->_connectionListener = (BSServiceConnectionListener *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    connections = v6->_connections;
    v6->_connections = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x24BDD1650], "weakToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    connectionsByEditingRequest = v6->_connectionsByEditingRequest;
    v6->_connectionsByEditingRequest = (NSMapTable *)v11;

  }
  return v2;
}

void __48__PRUISExternallyHostedPosterEditingServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDomain:", CFSTR("com.apple.posterboardui"));
  PRUISExternallyHostedPosterEditingServiceInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *queue;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  _QWORD v18[5];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceClass");

  if (v8 != 2)
  {
    PRUISLogRemoteEditing();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[PRUISExternallyHostedPosterEditingServer listener:didReceiveConnection:withContext:].cold.1((uint64_t)v6, v15);
    goto LABEL_10;
  }
  v9 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke;
  v18[3] = &unk_251535E30;
  v18[4] = self;
  objc_msgSend(v6, "configureConnection:", v18);
  objc_msgSend(v6, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.posterboardui.externalEditing"));

  if (!v11)
  {
    PRUISLogRemoteEditing();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_2445ED000, v15, OS_LOG_TYPE_DEFAULT, "PRUISExternallyHostedPosterEditingServer rejected connection: %{public}@", buf, 0xCu);
    }
LABEL_10:

    objc_msgSend(v6, "invalidate");
    goto LABEL_11;
  }
  queue = self->_queue;
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke_7;
  block[3] = &unk_251534BE0;
  block[4] = self;
  v13 = v6;
  v17 = v13;
  dispatch_async(queue, block);
  PRUISLogRemoteEditing();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = v13;
    _os_log_impl(&dword_2445ED000, v14, OS_LOG_TYPE_DEFAULT, "PRUISExternallyHostedPosterEditingServer received connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(v13, "activate");
LABEL_11:

}

void __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = a2;
  PRUISDefaultServiceQuality();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  PRUISExternallyHostedPosterEditingServiceInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_251535E08;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

}

void __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  PRUISLogRemoteEditing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_2445ED000, v4, OS_LOG_TYPE_DEFAULT, "PRUISExternallyHostedPosterEditingServer received connection invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __86__PRUISExternallyHostedPosterEditingServer_listener_didReceiveConnection_withContext___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PRUISLogRemoteEditing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "Adding Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v4);

}

- (void)_queue_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PRUISLogRemoteEditing();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_2445ED000, v5, OS_LOG_TYPE_DEFAULT, "Removing Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", v4);

}

- (void)_queue_associateConnection:(id)a3 toEditingRequest:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  -[NSMapTable setObject:forKey:](self->_connectionsByEditingRequest, "setObject:forKey:", v8, v7);

}

- (void)_queue_disassociateConnection:(id)a3 fromEditingRequest:(id)a4
{
  NSObject *queue;
  id v6;

  queue = self->_queue;
  v6 = a4;
  dispatch_assert_queue_V2(queue);
  -[NSMapTable removeObjectForKey:](self->_connectionsByEditingRequest, "removeObjectForKey:", v6);

}

- (void)activate
{
  NSObject *v4;
  void *v5;
  BSServiceConnectionListener *connectionListener;
  int v7;
  void *v8;
  __int16 v9;
  BSServiceConnectionListener *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
  PRUISLogRemoteEditing();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    connectionListener = self->_connectionListener;
    v7 = 138543618;
    v8 = v5;
    v9 = 2114;
    v10 = connectionListener;
    _os_log_impl(&dword_2445ED000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ - listener: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

- (void)beginEditingWithEntryPointWrapper:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id WeakRetained;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  PRUISLogRemoteEditing();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryPoint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_2445ED000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@): %{public}@", buf, 0x20u);

  }
  -[NSMapTable objectForKey:](self->_connectionsByEditingRequest, "objectForKey:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BE38028], "currentContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISExternallyHostedPosterEditingServer _queue_associateConnection:toEditingRequest:](self, "_queue_associateConnection:toEditingRequest:", v15, v9);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v20 = v9;
  v21 = v8;
  v16 = WeakRetained;
  v17 = v9;
  v18 = v8;
  BSDispatchMain();

}

void __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke_2;
  v4[3] = &unk_251535070;
  v3 = (void *)a1[7];
  v4[4] = a1[6];
  v5 = v3;
  objc_msgSend(v1, "beginExternalPosterEditingSessionWithEditingRequest:completion:", v2, v4);

}

void __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke_3;
  block[3] = &unk_251534E88;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __89__PRUISExternallyHostedPosterEditingServer_beginEditingWithEntryPointWrapper_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendRequestDismissalActionWithEntryPointWrapper:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  PRUISLogRemoteEditing();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryPoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v17 = v7;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    _os_log_impl(&dword_2445ED000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@): %{public}@", buf, 0x20u);

  }
  -[NSMapTable objectForKey:](self->_connectionsByEditingRequest, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BE38028], "currentContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRUISExternallyHostedPosterEditingServer _queue_associateConnection:toEditingRequest:](self, "_queue_associateConnection:toEditingRequest:", v11, v5);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = v5;
  v12 = WeakRetained;
  v13 = v5;
  BSDispatchMain();

}

uint64_t __92__PRUISExternallyHostedPosterEditingServer_sendRequestDismissalActionWithEntryPointWrapper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendRequestDismissalActionWithEditingRequest:", *(_QWORD *)(a1 + 40));
}

- (void)sessionWithEditingRequest:(id)a3 willEndEditingWithResponse:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  PRUISLogRemoteEditing();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_2445ED000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@) response: %{public}@", (uint8_t *)&v14, 0x20u);

  }
  -[NSMapTable objectForKey:](self->_connectionsByEditingRequest, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "willEndEditingWithResponse:", v8);

}

- (void)sessionWithEditingRequest:(id)a3 didEndEditingWithResponse:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  PRUISLogRemoteEditing();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "requestUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543874;
    v15 = v10;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_2445ED000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (%{public}@) response: %{public}@", (uint8_t *)&v14, 0x20u);

  }
  -[NSMapTable objectForKey:](self->_connectionsByEditingRequest, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "remoteTarget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "didEndEditingWithResponse:", v8);

}

- (PRUISExternallyHostedPosterEditingServerDelegate)delegate
{
  return (PRUISExternallyHostedPosterEditingServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connectionsByEditingRequest, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2445ED000, a2, OS_LOG_TYPE_DEBUG, "PRUISExternallyHostedPosterEditingServer rejecting connections on non-iPads: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
