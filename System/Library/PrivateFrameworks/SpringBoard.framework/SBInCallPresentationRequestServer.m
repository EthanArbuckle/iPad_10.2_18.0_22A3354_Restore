@implementation SBInCallPresentationRequestServer

- (SBInCallPresentationRequestServer)init
{
  SBInCallPresentationRequestServer *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *clientAuthenticator;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  void *v7;
  SBInCallPresentationRequestServer *v8;
  uint64_t v9;
  BSServiceConnectionListener *connectionListener;
  _QWORD v12[4];
  SBInCallPresentationRequestServer *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBInCallPresentationRequestServer;
  v2 = -[SBInCallPresentationRequestServer init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.inCallPresentation"));
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    v5 = dispatch_queue_create("com.apple.SpringBoard.SBSInCallPresentationRequestServer.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E0D23030];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__SBInCallPresentationRequestServer_init__block_invoke;
    v12[3] = &unk_1E8E9EFA0;
    v8 = v2;
    v13 = v8;
    objc_msgSend(v7, "listenerWithConfigurator:", v12);
    v9 = objc_claimAutoreleasedReturnValue();
    connectionListener = v8->_connectionListener;
    v8->_connectionListener = (BSServiceConnectionListener *)v9;

  }
  return v2;
}

void __41__SBInCallPresentationRequestServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAAED0], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v9;
  void *v10;
  NSObject *queue;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  SBInCallPresentationRequestServer *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogInCallPresentation();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  clientAuthenticator = self->_clientAuthenticator;
  objc_msgSend(v6, "remoteProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auditToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(clientAuthenticator) = -[FBServiceClientAuthenticator authenticateAuditToken:](clientAuthenticator, "authenticateAuditToken:", v10);

  if ((_DWORD)clientAuthenticator)
  {
    queue = self->_queue;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke;
    v18 = &unk_1E8E9E820;
    v12 = v6;
    v19 = v12;
    v20 = self;
    dispatch_sync(queue, &v15);
    objc_msgSend(v12, "activate", v15, v16, v17, v18);

  }
  else
  {
    SBLogInCallPresentation();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SBInCallPresentationRequestServer listener:didReceiveConnection:withContext:].cold.1((uint64_t)v6, v13, v14);

    objc_msgSend(v6, "invalidate");
  }

}

void __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  _SBInCallPresentationRequestServerTarget *v2;
  void *v3;
  _SBInCallPresentationRequestServerTarget *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  _SBInCallPresentationRequestServerTarget *v16;
  uint64_t v17;
  id v18;
  id v19;
  id from;
  id location;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = -[_SBInCallPresentationRequestServerTarget initWithConnection:proxyInterface:]([_SBInCallPresentationRequestServerTarget alloc], "initWithConnection:proxyInterface:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, v2);
  objc_initWeak(&from, *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v15 = &unk_1E8EA3D00;
  v4 = v2;
  v16 = v4;
  objc_copyWeak(&v18, &from);
  objc_copyWeak(&v19, &location);
  v17 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "configureConnection:", &v12);
  SBLogInCallPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v23 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Adding Connection: %{public}@", buf, 0xCu);
  }

  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  if (!v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v9 = objc_msgSend(v8, "initWithCapacity:", 1, v12, v13, v14, v15, v16);
    v10 = *(_QWORD *)(a1 + 40);
    v11 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = v9;

    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  }
  objc_msgSend(v7, "addObject:", v4, v12, v13, v14, v15);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v18);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAAED0], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAAED0], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v9 = &unk_1E8EA3CD8;
  objc_copyWeak(&v10, (id *)(a1 + 48));
  objc_copyWeak(&v11, (id *)(a1 + 56));
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), v6, v7, v8, v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);

}

void __79__SBInCallPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogInCallPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 138543362;
    v11 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = v6;
  if (WeakRetained && v6)
  {
    objc_msgSend(WeakRetained[1], "removeObject:", v6);
    v8 = objc_loadWeakRetained(WeakRetained + 5);
    objc_msgSend(v7, "clientIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inCallPresentationRequestServer:clientWithIdentifierDidInvalidate:", WeakRetained, v9);

  }
}

- (void)presentWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  +[_SBInCallPresentationRequestServerTarget currentTarget](_SBInCallPresentationRequestServerTarget, "currentTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogInCallPresentation();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Received presentation request with config: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "clientIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "inCallPresentationRequestServer:clientWithIdentifier:requestsPresentationWithConfiguration:completion:", self, v12, v6, v7);

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBInCallPresentationRequestServer presentWithConfiguration:completion:].cold.1(v6, v10);

    if (v7)
      v7[2](v7, 0);
  }

}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (SBInCallPresentationRequestServerDelegate)delegate
{
  return (SBInCallPresentationRequestServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_storeStrong((id *)&self->_targets, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, a3, "Connection did not pass entitlement validation: %{public}@", (uint8_t *)&v3);
}

- (void)presentWithConfiguration:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sceneBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, a2, v4, "Received presentation request for scene bundle identifier: %{public}@, but no target was found.", (uint8_t *)&v5);

}

@end
