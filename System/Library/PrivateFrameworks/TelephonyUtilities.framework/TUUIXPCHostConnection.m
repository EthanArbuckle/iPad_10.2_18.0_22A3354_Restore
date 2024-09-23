@implementation TUUIXPCHostConnection

- (TUUIXPCHostConnection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUUIXPCHostConnection.m"), 56, CFSTR("%s is unavailable. Use a designated initializer instead"), "-[TUUIXPCHostConnection init]");

  return 0;
}

- (TUUIXPCHostConnection)initWithConnection:(id)a3 hostDelegate:(id)a4 connectionDelegate:(id)a5 queue:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TUUIXPCHostConnection *v15;
  TUUIXPCHostConnection *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)TUUIXPCHostConnection;
  v15 = -[TUUIXPCHostConnection init](&v31, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_queue, a6);
    objc_storeStrong((id *)&v16->_connection, a3);
    -[TUUIXPCHostConnection connection](v16, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setExportedObject:", v16);

    objc_msgSend(MEMORY[0x1E0CB3B50], "hostConnectionInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUUIXPCHostConnection connection](v16, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setExportedInterface:", v18);

    objc_msgSend(MEMORY[0x1E0CB3B50], "remoteObjectInterface");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUUIXPCHostConnection connection](v16, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setRemoteObjectInterface:", v20);

    -[TUUIXPCHostConnection setHostDelegate:](v16, "setHostDelegate:", v12);
    -[TUUIXPCHostConnection setConnectionDelegate:](v16, "setConnectionDelegate:", v13);
    objc_initWeak(&location, v16);
    v22 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke;
    v28[3] = &unk_1E38A13D0;
    objc_copyWeak(&v29, &location);
    -[TUUIXPCHostConnection connection](v16, "connection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setInvalidationHandler:", v28);

    v26[0] = v22;
    v26[1] = 3221225472;
    v26[2] = __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_74;
    v26[3] = &unk_1E38A13D0;
    objc_copyWeak(&v27, &location);
    -[TUUIXPCHostConnection connection](v16, "connection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setInterruptionHandler:", v26);

    -[NSXPCConnection resume](v16->_connection, "resume");
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke(uint64_t a1)
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
    block[2] = __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_2;
    block[3] = &unk_1E38A1360;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_2(uint64_t a1)
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
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for TUUIXPCHostConnection: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionInvalidated:", *(_QWORD *)(a1 + 32));

}

void __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_74(uint64_t a1)
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
    block[2] = __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_2_75;
    block[3] = &unk_1E38A1360;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __82__TUUIXPCHostConnection_initWithConnection_hostDelegate_connectionDelegate_queue___block_invoke_2_75(uint64_t a1)
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
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for call TUUIXPCHostConnection: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TUUIXPCHostConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)TUUIXPCHostConnection;
  -[TUUIXPCHostConnection dealloc](&v4, sel_dealloc);
}

- (id)remoteObjectProxy
{
  void *v2;
  void *v3;

  -[TUUIXPCHostConnection connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)shouldHostHandleMRCommand:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  -[TUUIXPCHostConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__TUUIXPCHostConnection_shouldHostHandleMRCommand_completion___block_invoke;
  block[3] = &unk_1E38A17E8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __62__TUUIXPCHostConnection_shouldHostHandleMRCommand_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to handle MRcommand", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "hostDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shouldHandleMRCommand:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)shouldHostHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a4;
  v9 = a5;
  -[TUUIXPCHostConnection queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__TUUIXPCHostConnection_shouldHostHandleMRCommand_sourceIdentifier_completion___block_invoke;
  v13[3] = &unk_1E38A1810;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __79__TUUIXPCHostConnection_shouldHostHandleMRCommand_sourceIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to handle MRcommand", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "hostDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shouldHandleMRCommand:sourceIdentifier:completion:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)handleRedialCommandWhileScreening:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUUIXPCHostConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__TUUIXPCHostConnection_handleRedialCommandWhileScreening___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__TUUIXPCHostConnection_handleRedialCommandWhileScreening___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to redial while screening", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "hostDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleRedialCommandWhileScreening:", *(_QWORD *)(a1 + 40));

}

- (void)fetchInCallUIState:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUUIXPCHostConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__TUUIXPCHostConnection_fetchInCallUIState___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__TUUIXPCHostConnection_fetchInCallUIState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to fetch UI state", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "hostDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchInCallUIState:", *(_QWORD *)(a1 + 40));

}

- (void)fetchRemoteControlStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUUIXPCHostConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__TUUIXPCHostConnection_fetchRemoteControlStatus___block_invoke;
  v7[3] = &unk_1E38A1838;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __50__TUUIXPCHostConnection_fetchRemoteControlStatus___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to fetch remote control status", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "hostDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRemoteControlStatus:", *(_QWORD *)(a1 + 40));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (TUUIXPCHostConnectionDelegate)connectionDelegate
{
  return (TUUIXPCHostConnectionDelegate *)objc_loadWeakRetained((id *)&self->_connectionDelegate);
}

- (void)setConnectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_connectionDelegate, a3);
}

- (TUUIXPCHostDelegate)hostDelegate
{
  return (TUUIXPCHostDelegate *)objc_loadWeakRetained((id *)&self->_hostDelegate);
}

- (void)setHostDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_hostDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostDelegate);
  objc_destroyWeak((id *)&self->_connectionDelegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
