@implementation PRBTRangingSession

- (PRBTRangingSession)initWithDelegate:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PRBTRangingSession *v10;
  os_log_t v11;
  OS_os_log *logger;
  void *v14;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTRangingSession.mm"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PRBTRangingSession.mm"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PRBTRangingSession;
  v10 = -[PRRangingDevice init](&v16, sel_init);
  if (v10)
  {
    v11 = os_log_create("com.apple.nearbyd", "client");
    logger = v10->_logger;
    v10->_logger = (OS_os_log *)v11;

    objc_storeWeak((id *)&v10->_delegate, v7);
    objc_storeStrong((id *)&v10->_sessionQueue, a4);
    -[PRBTRangingSession connectToDaemon](v10, "connectToDaemon");
  }

  return v10;
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
  PRBTRangingClientExportedObject *v8;
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

  NSLog(CFSTR("connectToDaemon"), a2);
  v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nearbyd.xpc.BTRanging"), 4096);
  connection = self->_connection;
  self->_connection = v3;

  v5 = self->_connection;
  PRMakeBTRangingClientXPCInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](v5, "setExportedInterface:", v6);

  v7 = self->_connection;
  v8 = -[PRBTRangingClientExportedObject initWithRangingClient:]([PRBTRangingClientExportedObject alloc], "initWithRangingClient:", self);
  -[NSXPCConnection setExportedObject:](v7, "setExportedObject:", v8);

  v9 = self->_connection;
  PRMakeBTRangingServerXPCInterface();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", v10);

  -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", self->_sessionQueue);
  objc_initWeak(&location, self);
  v11 = self->_connection;
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __37__PRBTRangingSession_connectToDaemon__block_invoke;
  v19[3] = &unk_1E3D04690;
  objc_copyWeak(&v20, &location);
  -[NSXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v19);
  v13 = self->_connection;
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __37__PRBTRangingSession_connectToDaemon__block_invoke_2;
  v17[3] = &unk_1E3D04690;
  objc_copyWeak(&v18, &location);
  -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v17);
  -[NSXPCConnection resume](self->_connection, "resume");
  -[PRBTRangingSession remoteObject](self, "remoteObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PRBTRangingSession;
  -[PRRangingDevice clientInfo](&v16, sel_clientInfo);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "connectWithClientInfo:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __37__PRBTRangingSession_connectToDaemon__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleInterruption");

}

void __37__PRBTRangingSession_connectToDaemon__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleInvalidation");

}

- (void)handleInterruption
{
  OS_os_log *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  objc_super v10;
  uint64_t v11;
  const __CFString *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("Daemon InterruptionHandle"), a2);
  v3 = self->_logger;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NSXPCConnection debugDescription](self->_connection, "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_19BF46000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "connection was interrupted: %@", buf, 0xCu);

  }
  -[PRBTRangingSession remoteObject](self, "remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)PRBTRangingSession;
  -[PRRangingDevice clientInfo](&v10, sel_clientInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectWithClientInfo:", v6);

  v11 = *MEMORY[0x1E0CB2D50];
  v12 = CFSTR("Generic companion ranging error.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PRErrorWithCodeAndUserInfo(301, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "didFailWithError:", v8);

}

- (void)handleInvalidation
{
  OS_os_log *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("Daemon InvalidationHandler"), a2);
  v3 = self->_logger;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
  {
    -[NSXPCConnection debugDescription](self->_connection, "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19BF46000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "connection was invalidated: %@", (uint8_t *)&v5, 0xCu);

  }
}

- (id)remoteObject
{
  NSXPCConnection *connection;
  _QWORD v4[5];

  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__PRBTRangingSession_remoteObject__block_invoke;
  v4[3] = &unk_1E3D04DF0;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __34__PRBTRangingSession_remoteObject__block_invoke(uint64_t a1, void *a2)
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
  v4[2] = __45__PRBTRangingSession_synchronousRemoteObject__block_invoke;
  v4[3] = &unk_1E3D04DF0;
  v4[4] = self;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](connection, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __45__PRBTRangingSession_synchronousRemoteObject__block_invoke(uint64_t a1, void *a2)
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
  PRBTRangingSessionDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didFailWithError:", v4);

}

- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5
{
  PRBTRangingSessionDelegate **p_delegate;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didFetchTxPower:fromDevice:withError:", v10, v9, v8);

}

- (void)didConnectDevice:(id)a3 error:(id)a4
{
  PRBTRangingSessionDelegate **p_delegate;
  id v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didConnectDevice:error:", v7, v6);

}

- (void)didStartRangingOnDevice:(id)a3 withError:(id)a4
{
  PRBTRangingSessionDelegate **p_delegate;
  id v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didStartRangingOnDevice:withError:", v7, v6);

}

- (void)didStopOwnerRangingOnDevice:(id)a3 withError:(id)a4
{
  PRBTRangingSessionDelegate **p_delegate;
  id v6;
  id v7;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didStopOwnerRangingOnDevice:withError:", v7, v6);

}

- (void)didReceiveNewBTRSSI:(id)a3
{
  PRBTRangingSessionDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didReceiveNewBTRSSI:", v4);

}

- (void)fetchTxPower:(id)a3 isUT:(id)a4
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
  -[PRBTRangingSession remoteObject](self, "remoteObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__PRBTRangingSession_fetchTxPower_isUT___block_invoke;
  v9[3] = &unk_1E3D04D58;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "fetchTxPower:isUT:reply:", v6, v7, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __40__PRBTRangingSession_fetchTxPower_isUT___block_invoke(uint64_t a1, char a2, void *a3)
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

- (void)startUTRanging:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PRBTRangingSession remoteObject](self, "remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__PRBTRangingSession_startUTRanging___block_invoke;
  v6[3] = &unk_1E3D04D58;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "startUTRanging:reply:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __37__PRBTRangingSession_startUTRanging___block_invoke(uint64_t a1, char a2, void *a3)
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

- (void)stopUTRanging:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PRBTRangingSession remoteObject](self, "remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PRBTRangingSession_stopUTRanging___block_invoke;
  v6[3] = &unk_1E3D04D58;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "stopUTRanging:reply:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __36__PRBTRangingSession_stopUTRanging___block_invoke(uint64_t a1, char a2, void *a3)
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

- (void)startOwnerRanging:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PRBTRangingSession remoteObject](self, "remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PRBTRangingSession_startOwnerRanging___block_invoke;
  v6[3] = &unk_1E3D04D58;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "startOwnerRanging:reply:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __40__PRBTRangingSession_startOwnerRanging___block_invoke(uint64_t a1, char a2, void *a3)
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

- (void)stopOwnerRanging:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[PRBTRangingSession remoteObject](self, "remoteObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__PRBTRangingSession_stopOwnerRanging___block_invoke;
  v6[3] = &unk_1E3D04D58;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "stopOwnerRanging:reply:", v4, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __39__PRBTRangingSession_stopOwnerRanging___block_invoke(uint64_t a1, char a2, void *a3)
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

- (PRBTRangingSessionDelegate)delegate
{
  return (PRBTRangingSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
