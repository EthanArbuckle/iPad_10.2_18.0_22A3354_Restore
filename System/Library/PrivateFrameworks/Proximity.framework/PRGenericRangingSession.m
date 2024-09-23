@implementation PRGenericRangingSession

- (PRGenericRangingSession)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  PRGenericRangingSession *v9;
  os_log_t v10;
  OS_os_log *logger;
  dispatch_queue_t v12;
  OS_dispatch_queue *sessionQueue;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRGenericRangingSession.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

  }
  v16.receiver = self;
  v16.super_class = (Class)PRGenericRangingSession;
  v9 = -[PRRangingDevice init](&v16, sel_init);
  if (v9)
  {
    v10 = os_log_create("com.apple.nearbyd", "client");
    logger = v9->_logger;
    v9->_logger = (OS_os_log *)v10;

    objc_storeWeak((id *)&v9->_delegate, v7);
    if (v8)
      v12 = (dispatch_queue_t)v8;
    else
      v12 = dispatch_queue_create("com.apple.nearbyd.daemonSession", 0);
    sessionQueue = v9->_sessionQueue;
    v9->_sessionQueue = (OS_dispatch_queue *)v12;

    -[PRGenericRangingSession connectToDaemon](v9, "connectToDaemon");
  }

  return v9;
}

- (void)invalidate
{
  NSXPCConnection *connection;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
}

- (void)connectToDaemon
{
  NSXPCConnection *v3;
  NSXPCConnection *connection;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  PRRangingClientExportedObject *v8;
  NSXPCConnection *v9;
  void *v10;
  NSXPCConnection *v11;
  uint64_t v12;
  NSXPCConnection *v13;
  void *v14;
  void *v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nearbyd.xpc.ranging"), 4096);
  connection = self->_connection;
  self->_connection = v3;

  v5 = self->_connection;
  PRMakeRangingClientXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

  v7 = self->_connection;
  v8 = -[PRRangingClientExportedObject initWithRangingClient:]([PRRangingClientExportedObject alloc], "initWithRangingClient:", self);
  -[NSXPCConnection setExportedObject:](v7, "setExportedObject:", v8);

  v9 = self->_connection;
  PRMakeRangingServerXPCInterface();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", v10);

  -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_sessionQueue);
  objc_initWeak(&location, self);
  v11 = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __42__PRGenericRangingSession_connectToDaemon__block_invoke;
  v19[3] = &unk_1E3D04588;
  objc_copyWeak(&v20, &location);
  -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v19);
  v13 = self->_connection;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __42__PRGenericRangingSession_connectToDaemon__block_invoke_2;
  v17[3] = &unk_1E3D04588;
  objc_copyWeak(&v18, &location);
  -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v17);
  -[NSXPCConnection resume](self->_connection, "resume");
  -[PRGenericRangingSession remoteObject](self, "remoteObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PRGenericRangingSession;
  -[PRRangingDevice clientInfo](&v16, sel_clientInfo);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connectWithClientInfo:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __42__PRGenericRangingSession_connectToDaemon__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleInterruption");

}

void __42__PRGenericRangingSession_connectToDaemon__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleInvalidation");

}

- (void)handleInterruption
{
  NSObject *logger;
  NSXPCConnection *connection;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("Daemon InterruptionHandle"), a2);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v5 = logger;
    -[NSXPCConnection debugDescription](connection, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19BF46000, v5, OS_LOG_TYPE_DEFAULT, "connection was interrupted: %@", buf, 0xCu);

  }
  -[PRGenericRangingSession remoteObject](self, "remoteObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)PRGenericRangingSession;
  -[PRRangingDevice clientInfo](&v9, sel_clientInfo);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectWithClientInfo:", v8);

}

- (void)handleInvalidation
{
  NSObject *logger;
  NSXPCConnection *connection;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("Daemon InvalidationHandler"), a2);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    v5 = logger;
    -[NSXPCConnection debugDescription](connection, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19BF46000, v5, OS_LOG_TYPE_DEFAULT, "connection was invalidated: %@", (uint8_t *)&v7, 0xCu);

  }
}

- (id)remoteObject
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PRGenericRangingSession_remoteObject__block_invoke;
  v4[3] = &unk_1E3D045B0;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __39__PRGenericRangingSession_remoteObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  NSLog(CFSTR("remoteObjectProxyWithErrorHandler error %@"), v3);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19BF46000, v4, OS_LOG_TYPE_DEFAULT, "Error getting remote object proxy %@", buf, 0xCu);
  }

}

- (id)synchronousRemoteObject
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PRGenericRangingSession_synchronousRemoteObject__block_invoke;
  v4[3] = &unk_1E3D045B0;
  v4[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__PRGenericRangingSession_synchronousRemoteObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  NSLog(CFSTR("synchronousRemoteObjectProxyWithErrorHandler error %@"), v3);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19BF46000, v4, OS_LOG_TYPE_DEFAULT, "Error getting synchronous remote object proxy %@", buf, 0xCu);
  }

}

- (void)didFailWithError:(id)a3
{
  PRGenericRangingSessionDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didFailWithError:", v4);

}

- (void)didReceiveNewSolutions:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "didReceiveNewSolutions:", v5);

}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id WeakRetained;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "remoteDevice:didChangeState:", v7, a4);

}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "rangingRequestDidUpdateStatus:", a3);

}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "rangingServiceDidUpdateState:cause:", a3, a4);

}

- (void)configureForP2PRanging:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[PRGenericRangingSession remoteObject](self, "remoteObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__PRGenericRangingSession_configureForP2PRanging_options___block_invoke;
  v9[3] = &unk_1E3D04538;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "configureForP2PRanging:options:reply:", v6, v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __58__PRGenericRangingSession_configureForP2PRanging_options___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  id v8;
  id v9;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v9 = v5;
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      v8 = objc_loadWeakRetained(WeakRetained + 5);
      objc_msgSend(v8, "didFailWithError:", v9);

    }
    v5 = v9;
  }

}

- (BOOL)startP2PRanging:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[PRGenericRangingSession synchronousRemoteObject](self, "synchronousRemoteObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__PRGenericRangingSession_startP2PRanging_error___block_invoke;
  v10[3] = &unk_1E3D04750;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v7, "startP2PRanging:reply:", v6, v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __49__PRGenericRangingSession_startP2PRanging_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (BOOL)stopP2PRanging:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  -[PRGenericRangingSession synchronousRemoteObject](self, "synchronousRemoteObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__PRGenericRangingSession_stopP2PRanging_error___block_invoke;
  v10[3] = &unk_1E3D04750;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v7, "stopP2PRanging:reply:", v6, v10);

  if (a4)
    *a4 = objc_retainAutorelease((id)v12[5]);
  v8 = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __48__PRGenericRangingSession_stopP2PRanging_error___block_invoke(uint64_t a1, char a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;

}

- (PRGenericRangingSessionDelegate)delegate
{
  return (PRGenericRangingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
