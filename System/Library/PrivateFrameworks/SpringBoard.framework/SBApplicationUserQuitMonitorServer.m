@implementation SBApplicationUserQuitMonitorServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v10;
  void *v11;
  NSObject *queue;
  id v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogAppQuitMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke;
  v16[3] = &unk_1E8EA1060;
  v16[4] = self;
  objc_msgSend(v6, "configureConnection:", v16);
  clientAuthenticator = self->_clientAuthenticator;
  objc_msgSend(v6, "remoteProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(clientAuthenticator) = -[FBServiceClientAuthenticator authenticateAuditToken:](clientAuthenticator, "authenticateAuditToken:", v11);

  if ((_DWORD)clientAuthenticator)
  {
    queue = self->_queue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke_9;
    block[3] = &unk_1E8E9E820;
    block[4] = self;
    v13 = v6;
    v15 = v13;
    dispatch_async(queue, block);
    objc_msgSend(v13, "activate");

  }
  else
  {
    objc_msgSend(v6, "invalidate");
  }

}

void __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0DAADD8];
  v4 = a2;
  objc_msgSend(v3, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(MEMORY[0x1E0DAADD8], "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v6);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E8EABE80;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v7);
  objc_msgSend(v4, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

uint64_t __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke_9(uint64_t a1)
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

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAppQuitMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Adding Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v4);

}

- (SBApplicationUserQuitMonitorServer)init
{
  SBApplicationUserQuitMonitorServer *v2;
  uint64_t v3;
  NSMutableArray *connections;
  uint64_t v5;
  FBServiceClientAuthenticator *clientAuthenticator;
  uint64_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  id *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBApplicationUserQuitMonitorServer;
  v2 = -[SBApplicationUserQuitMonitorServer init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.monitorAppSwitcherUserQuit"));
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v5;

    v7 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (void *)MEMORY[0x1E0D23030];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__SBApplicationUserQuitMonitorServer_init__block_invoke;
    v14[3] = &unk_1E8E9EFA0;
    v10 = v2;
    v15 = v10;
    objc_msgSend(v9, "listenerWithConfigurator:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v10[2];
    v10[2] = (id)v11;

    objc_msgSend(v10[2], "activate");
  }
  return v2;
}

void __42__SBApplicationUserQuitMonitorServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAADD8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)userClosedLastSceneOfApplicationWithBundleID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__SBApplicationUserQuitMonitorServer_userClosedLastSceneOfApplicationWithBundleID___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __83__SBApplicationUserQuitMonitorServer_userClosedLastSceneOfApplicationWithBundleID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "remoteTarget", (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "userClosedLastSceneOfApplicationWithBundleID:", *(_QWORD *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __80__SBApplicationUserQuitMonitorServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogAppQuitMonitor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

- (void)_queue_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAppQuitMonitor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Removing Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
}

@end
