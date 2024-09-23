@implementation SBSystemNotesPresentationRequestServer

- (SBSystemNotesPresentationRequestServer)init
{
  SBSystemNotesPresentationRequestServer *v2;
  uint64_t v3;
  FBServiceClientAuthenticator *clientAuthenticator;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  void *v7;
  SBSystemNotesPresentationRequestServer *v8;
  uint64_t v9;
  BSServiceConnectionListener *connectionListener;
  _QWORD v12[4];
  SBSystemNotesPresentationRequestServer *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBSystemNotesPresentationRequestServer;
  v2 = -[SBSystemNotesPresentationRequestServer init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:", CFSTR("com.apple.springboard.systemNotesPresentation"));
    clientAuthenticator = v2->_clientAuthenticator;
    v2->_clientAuthenticator = (FBServiceClientAuthenticator *)v3;

    v5 = dispatch_queue_create("com.apple.SpringBoard.SBSSystemNotesPresentationRequestServer.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (void *)MEMORY[0x1E0D23030];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__SBSystemNotesPresentationRequestServer_init__block_invoke;
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

void __46__SBSystemNotesPresentationRequestServer_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(MEMORY[0x1E0DAB030], "identifier");
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
  char v8;
  id v9;
  FBServiceClientAuthenticator *clientAuthenticator;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *queue;
  id v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  SBSystemNotesPresentationRequestServer *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogAppQuitMonitor();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Received Connection: %{public}@", buf, 0xCu);
  }

  v26 = 0;
  v8 = SBIsSystemNotesEnabled(&v26);
  v9 = v26;
  if ((v8 & 1) != 0)
  {
    clientAuthenticator = self->_clientAuthenticator;
    objc_msgSend(v6, "remoteProcess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "auditToken");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v13 = -[FBServiceClientAuthenticator authenticateAuditToken:error:](clientAuthenticator, "authenticateAuditToken:error:", v12, &v25);
    v14 = v25;

    if ((v13 & 1) != 0)
    {
      queue = self->_queue;
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke;
      v22 = &unk_1E8E9E820;
      v23 = self;
      v16 = v6;
      v24 = v16;
      dispatch_sync(queue, &v19);
      objc_msgSend(v16, "activate", v19, v20, v21, v22, v23);

    }
    else
    {
      SBLogSystemNotes();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SBSystemNotesPresentationRequestServer listener:didReceiveConnection:withContext:].cold.1((uint64_t)v14, (uint64_t)v6, v18);

      objc_msgSend(v6, "invalidate");
    }
    v9 = v14;
  }
  else
  {
    SBLogSystemNotes();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[SBSystemNotesPresentationRequestServer listener:didReceiveConnection:withContext:].cold.2((uint64_t)v9, v17);

    objc_msgSend(v6, "invalidate");
  }

}

void __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "server:targetForNewClientConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, *(id *)(a1 + 32));
  v4 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E8EACDF8;
  v5 = v3;
  v7 = v5;
  objc_copyWeak(&v9, &location);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "configureConnection:", v6);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0DAB030], "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x1E0DAB030], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_3;
  v6[3] = &unk_1E8EA1010;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  objc_destroyWeak(&v7);

}

void __84__SBSystemNotesPresentationRequestServer_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *WeakRetained;
  id *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogSystemNotes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Received Connection Invalidation: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v7, "server:connectionDidInvalidate:", v6, v3);

  }
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (SBSystemNotesPresentationRequestServerDelegate)delegate
{
  return (SBSystemNotesPresentationRequestServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_clientAuthenticator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(uint64_t)a2 withContext:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Connection did not pass entitlement validation: %{public}@\n %{public}@", (uint8_t *)&v3, 0x16u);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Service unavailable. Invalidating connection. Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
