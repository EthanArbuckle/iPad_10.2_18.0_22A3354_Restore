@implementation SBSwitcherDemoCommandsServer

- (SBSwitcherDemoCommandsServer)initWithRecentAppLayouts:(id)a3 demoFilteringController:(id)a4
{
  id v7;
  id v8;
  SBSwitcherDemoCommandsServer *v9;
  SBSwitcherDemoCommandsServer *v10;
  uint64_t v11;
  SBAppSwitcherSettings *switcherSettings;
  uint64_t v13;
  NSMutableArray *connections;
  uint64_t v15;
  FBServiceClientAuthenticator *clientAuthenticator;
  uint64_t v17;
  OS_dispatch_queue *queue;
  void *v19;
  id *v20;
  uint64_t v21;
  id v22;
  _QWORD v24[4];
  id *v25;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SBSwitcherDemoCommandsServer;
  v9 = -[SBSwitcherDemoCommandsServer init](&v26, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_demoFilteringController, a4);
    objc_storeStrong((id *)&v10->_recents, a3);
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v11 = objc_claimAutoreleasedReturnValue();
    switcherSettings = v10->_switcherSettings;
    v10->_switcherSettings = (SBAppSwitcherSettings *)v11;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    connections = v10->_connections;
    v10->_connections = (NSMutableArray *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.switcherDemoCommands"));
    clientAuthenticator = v10->_clientAuthenticator;
    v10->_clientAuthenticator = (FBServiceClientAuthenticator *)v15;

    v17 = BSDispatchQueueCreateWithQualityOfService();
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v17;

    v19 = (void *)MEMORY[0x1E0D23030];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __81__SBSwitcherDemoCommandsServer_initWithRecentAppLayouts_demoFilteringController___block_invoke;
    v24[3] = &unk_1E8E9EFA0;
    v20 = v10;
    v25 = v20;
    objc_msgSend(v19, "listenerWithConfigurator:", v24);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v20[3];
    v20[3] = (id)v21;

    objc_msgSend(v20[3], "activate");
  }

  return v10;
}

void __81__SBSwitcherDemoCommandsServer_initWithRecentAppLayouts_demoFilteringController___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAFE8], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (BOOL)loadStashedSwitcherModelFromPath:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  SBSwitcherDemoCommandsServer *v12;
  dispatch_semaphore_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SBSwitcherDemoCommandsServer_loadStashedSwitcherModelFromPath___block_invoke;
  v10[3] = &unk_1E8EAD968;
  v11 = v4;
  v12 = self;
  v13 = v5;
  v14 = &v15;
  v6 = v5;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

intptr_t __65__SBSwitcherDemoCommandsServer_loadStashedSwitcherModelFromPath___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "_loadStashedModelAtPath:", *(_QWORD *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)stashSwitcherModelToPath:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  SBSwitcherDemoCommandsServer *v12;
  dispatch_semaphore_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__SBSwitcherDemoCommandsServer_stashSwitcherModelToPath___block_invoke;
  v10[3] = &unk_1E8EAD968;
  v11 = v4;
  v12 = self;
  v13 = v5;
  v14 = &v15;
  v6 = v5;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

intptr_t __57__SBSwitcherDemoCommandsServer_stashSwitcherModelToPath___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "_stashModelToPath:", *(_QWORD *)(a1 + 32));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)setShouldDisableSwitcherModelUpdates:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  dispatch_semaphore_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__SBSwitcherDemoCommandsServer_setShouldDisableSwitcherModelUpdates___block_invoke;
  v10[3] = &unk_1E8EB79B0;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v13 = &v14;
  v6 = v5;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

intptr_t __69__SBSwitcherDemoCommandsServer_setShouldDisableSwitcherModelUpdates___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setShouldDisableSwitcherModelUpdatesForDemo:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)updateHiddenApplicationBundleIDs:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  char v8;
  _QWORD v10[5];
  id v11;
  dispatch_semaphore_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__SBSwitcherDemoCommandsServer_updateHiddenApplicationBundleIDs___block_invoke;
  v10[3] = &unk_1E8EB79B0;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v13 = &v14;
  v6 = v5;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v10);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

intptr_t __65__SBSwitcherDemoCommandsServer_updateHiddenApplicationBundleIDs___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setHiddenApplicationBundleIDs:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

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
  SBLogCommon();
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
  v16[2] = __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke;
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
    block[2] = __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke_10;
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

void __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0DAAFE8];
  v4 = a2;
  objc_msgSend(v3, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceQuality:", v5);

  objc_msgSend(MEMORY[0x1E0DAAFE8], "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterface:", v6);

  objc_msgSend(v4, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_1E8EABE80;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setInvalidationHandler:", v7);
  objc_msgSend(v4, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

}

void __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __74__SBSwitcherDemoCommandsServer_listener_didReceiveConnection_withContext___block_invoke_10(uint64_t a1)
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
  SBLogCommon();
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

- (void)_queue_removeConnection:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
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
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_demoFilteringController, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
}

@end
