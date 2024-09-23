@implementation SBFocusModesHomeScreenSettingsServer

- (SBFocusModesHomeScreenSettingsServer)init
{
  SBFocusModesHomeScreenSettingsServer *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *authenticator;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  uint64_t v7;
  NSMutableArray *connections;
  void *v9;
  SBFocusModesHomeScreenSettingsServer *v10;
  uint64_t v11;
  BSServiceConnectionListener *listener;
  _QWORD v14[4];
  SBFocusModesHomeScreenSettingsServer *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBFocusModesHomeScreenSettingsServer;
  v2 = -[SBFocusModesHomeScreenSettingsServer init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.focus-modes-home-screen-settings"));
    authenticator = v2->_authenticator;
    v2->_authenticator = (FBServiceClientAuthenticator *)v3;

    v5 = dispatch_queue_create("com.apple.SpringBoard.SBSFocusModesHomeScreenSettingsService.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSMutableArray *)v7;

    v9 = (void *)MEMORY[0x1E0D23030];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__SBFocusModesHomeScreenSettingsServer_init__block_invoke;
    v14[3] = &unk_1E8E9EFA0;
    v10 = v2;
    v15 = v10;
    objc_msgSend(v9, "listenerWithConfigurator:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    listener = v10->_listener;
    v10->_listener = (BSServiceConnectionListener *)v11;

  }
  return v2;
}

void __44__SBFocusModesHomeScreenSettingsServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAE60], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_listener, "activate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  SBFocusModesHomeScreenSettingsServer *v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogFocusModes();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  -[SBFocusModesHomeScreenSettingsServer authenticator](self, "authenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "authenticateAuditToken:", v10))
  {
    -[SBFocusModesHomeScreenSettingsServer queue](self, "queue");
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke;
    v17 = &unk_1E8E9E820;
    v12 = v6;
    v18 = v12;
    v19 = self;
    dispatch_sync(v11, &v14);
    objc_msgSend(v12, "activate", v14, v15, v16, v17);

  }
  else
  {
    SBLogFocusModes();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SBHomeScreenConfigurationServer listener:didReceiveConnection:withContext:].cold.1((uint64_t)v6, v13);

    objc_msgSend(v6, "invalidate");
  }

}

void __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E8EA1060;
  v2 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "configureConnection:", v6);
  SBLogFocusModes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Adding Connection: %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 32));

}

void __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAE60], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAAE60], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v10 = &unk_1E8EA1010;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v7);
  objc_msgSend(*(id *)(a1 + 32), "queue", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __82__SBFocusModesHomeScreenSettingsServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogFocusModes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v3);

  }
}

- (void)homeScreenSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[SBFocusModesHomeScreenSettingsServer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "settingsServer:homeScreenSnapshotsWithRequest:completion:", self, v9, v6);

}

- (void)homeScreenSnapshotsForSuggestedPagesWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[SBFocusModesHomeScreenSettingsServer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "settingsServer:homeScreenSnapshotsForSuggestedPagesWithRequest:completion:", self, v9, v6);

}

- (void)updateFocusModeHomeScreenSettingsWithRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBFocusModesHomeScreenSettingsServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "settingsServer:updateFocusModeHomeScreenSettingsWithRequest:", self, v6);

}

- (void)addSuggestedHomeScreenPageWithRequest:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBFocusModesHomeScreenSettingsServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "settingsServer:addSuggestedHomeScreenPageWithRequest:", self, v6);

}

- (SBFocusModesHomeScreenSettingsServerDelegate)delegate
{
  return (SBFocusModesHomeScreenSettingsServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (FBServiceClientAuthenticator)authenticator
{
  return self->_authenticator;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
