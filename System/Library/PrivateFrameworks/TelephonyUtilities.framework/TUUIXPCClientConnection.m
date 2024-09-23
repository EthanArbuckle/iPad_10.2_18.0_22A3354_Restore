@implementation TUUIXPCClientConnection

- (TUUIXPCClientConnection)initWithListenerEndpoint:(id)a3 callCenter:(id)a4
{
  id v6;
  id v7;
  TUUIXPCClientConnection *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TUUIXPCClientConnection;
  v8 = -[TUUIXPCClientConnection init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v6);
    connection = v8->_connection;
    v8->_connection = (NSXPCConnection *)v9;

    v11 = dispatch_queue_create("com.apple.telephonyutilities.tuuixpcclient", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeWeak((id *)&v8->_callCenter, v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "hostInterface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8->_connection, "setRemoteObjectInterface:", v13);

    objc_msgSend(MEMORY[0x1E0CB3B50], "clientInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v8->_connection, "setExportedInterface:", v14);

    -[NSXPCConnection setExportedObject:](v8->_connection, "setExportedObject:", v8);
    objc_initWeak(&location, v8);
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke;
    v19[3] = &unk_1E38A13D0;
    objc_copyWeak(&v20, &location);
    -[NSXPCConnection setInvalidationHandler:](v8->_connection, "setInvalidationHandler:", v19);
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_69;
    v17[3] = &unk_1E38A13D0;
    objc_copyWeak(&v18, &location);
    -[NSXPCConnection setInterruptionHandler:](v8->_connection, "setInterruptionHandler:", v17);
    -[NSXPCConnection resume](v8->_connection, "resume");
    -[TUUIXPCClientConnection ping](v8, "ping");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)ping
{
  id v2;

  -[TUUIXPCClientConnection hostWithErrorHandler:](self, "hostWithErrorHandler:", &__block_literal_global_74);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ping");

}

- (id)hostWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUUIXPCClientConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

void __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_2;
    block[3] = &unk_1E38A1360;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for TUUIXPCClientConnection %@", (uint8_t *)&v4, 0xCu);
  }

}

void __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_69(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_2_70;
    block[3] = &unk_1E38A1360;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __63__TUUIXPCClientConnection_initWithListenerEndpoint_callCenter___block_invoke_2_70(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for TUUIXPCClientConnection: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUUIXPCClientConnection;
  -[TUUIXPCClientConnection dealloc](&v3, sel_dealloc);
}

- (id)host
{
  void *v2;
  void *v3;

  -[TUUIXPCClientConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __31__TUUIXPCClientConnection_ping__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error while pinging host: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)shouldHostHandleMRCommand:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  int v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  TUDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v17 = v4;
    _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "shouldHostHandleMRCommand: %u", buf, 8u);
  }

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __64__TUUIXPCClientConnection_shouldHostHandleMRCommand_completion___block_invoke;
  v13 = &unk_1E38A22E8;
  v15 = v4;
  v14 = v6;
  v8 = v6;
  -[TUUIXPCClientConnection hostWithErrorHandler:](self, "hostWithErrorHandler:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "shouldHostHandleMRCommand:completion:", v4, v8, v10, v11, v12, v13);

}

void __64__TUUIXPCClientConnection_shouldHostHandleMRCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error while asking host to handle media remote command: %u error: %@", (uint8_t *)v6, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)shouldHostHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  int v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v20 = v6;
    v21 = 2112;
    v22 = v8;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "shouldHostHandleMRCommand1: %u sourceIdentifier: %@", buf, 0x12u);
  }

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __81__TUUIXPCClientConnection_shouldHostHandleMRCommand_sourceIdentifier_completion___block_invoke;
  v16 = &unk_1E38A22E8;
  v18 = v6;
  v17 = v9;
  v11 = v9;
  -[TUUIXPCClientConnection hostWithErrorHandler:](self, "hostWithErrorHandler:", &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shouldHostHandleMRCommand:sourceIdentifier:completion:", v6, v8, v11, v13, v14, v15, v16);

}

void __81__TUUIXPCClientConnection_shouldHostHandleMRCommand_sourceIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v6[0] = 67109378;
    v6[1] = v5;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error while asking host to handle media remote command: %u error: %@", (uint8_t *)v6, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)handleRedialCommandWhileScreening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "handleRedialCommandWhileScreening: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__TUUIXPCClientConnection_handleRedialCommandWhileScreening___block_invoke;
  v8[3] = &unk_1E38A2310;
  v9 = v4;
  v6 = v4;
  -[TUUIXPCClientConnection hostWithErrorHandler:](self, "hostWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleRedialCommandWhileScreening:", v6);

}

void __61__TUUIXPCClientConnection_handleRedialCommandWhileScreening___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error while asking host to handle redial request: %@ error: %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)fetchInCallUIState:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[TUUIXPCClientConnection fetchInCallUIState:]";
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%s: ", buf, 0xCu);
  }

  -[TUUIXPCClientConnection callCenter](self, "callCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__TUUIXPCClientConnection_fetchInCallUIState___block_invoke;
  v9[3] = &unk_1E38A1838;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __46__TUUIXPCClientConnection_fetchInCallUIState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  TUUIContext *v7;
  id v8;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "callCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_allCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "hostWithErrorHandler:", &__block_literal_global_77);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchInCallUIState:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "No calls on the system so early returning since ICS shouldn't show any UI", buf, 2u);
    }

    v6 = *(_QWORD *)(a1 + 40);
    v7 = -[TUUIContext initWithState:]([TUUIContext alloc], "initWithState:", 0);
    (*(void (**)(uint64_t, TUUIContext *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
}

void __46__TUUIXPCClientConnection_fetchInCallUIState___block_invoke_76(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "Error while asking host for UI state: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)fetchRemoteControlStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[TUUIXPCClientConnection fetchRemoteControlStatus:]";
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "%s: ", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__TUUIXPCClientConnection_fetchRemoteControlStatus___block_invoke;
  v8[3] = &unk_1E38A1448;
  v9 = v4;
  v6 = v4;
  -[TUUIXPCClientConnection hostWithErrorHandler:](self, "hostWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRemoteControlStatus:", v6);

}

void __52__TUUIXPCClientConnection_fetchRemoteControlStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  TUDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19A50D000, v4, OS_LOG_TYPE_DEFAULT, "Error while asking host for UI state, InCallService isn't running: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (TUCallCenter)callCenter
{
  return (TUCallCenter *)objc_loadWeakRetained((id *)&self->_callCenter);
}

- (void)setCallCenter:(id)a3
{
  objc_storeWeak((id *)&self->_callCenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_callCenter);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
