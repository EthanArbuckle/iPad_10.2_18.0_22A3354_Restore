@implementation SHSheetUIServiceClient

- (SHSheetUIServiceClient)initWithSessionIdentifier:(id)a3
{
  id v4;
  SHSheetUIServiceClient *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHSheetUIServiceClient;
  v5 = -[SHSheetUIServiceClient init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    -[SHSheetUIServiceClient _setupNewConnection](v5, "_setupNewConnection");
  }

  return v5;
}

- (void)_setupNewConnection
{
  void *v3;
  BSServiceConnection *v4;
  BSServiceConnection *connection;
  BSServiceConnection *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;

  if (_setupNewConnection_onceToken != -1)
    dispatch_once(&_setupNewConnection_onceToken, &__block_literal_global_27);
  objc_msgSend(MEMORY[0x1E0D23018], "endpointForMachName:service:instance:", CFSTR("com.apple.sharinguiservice.services"), CFSTR("com.apple.sharinguiservice.sharesheet-service"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D23010], "connectionWithEndpoint:", v3);
    v4 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
    connection = self->_connection;
    self->_connection = v4;

    location = 0;
    objc_initWeak(&location, self);
    v6 = self->_connection;
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_2;
    v10 = &unk_1E4002F90;
    objc_copyWeak(&v11, &location);
    -[BSServiceConnection configureConnection:](v6, "configureConnection:", &v7);
    -[SHSheetUIServiceClient _activateConnection](self, "_activateConnection", v7, v8, v9, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D22FE8], "interfaceWithIdentifier:", CFSTR("com.apple.sharinguiservice.sharesheet-service"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D22FF8], "protocolForProtocol:", &unk_1EE576E48);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServer:", v0);

  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)_setupNewConnection___interface;
  _setupNewConnection___interface = v1;

}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", _setupNewConnection___interface);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_3;
  v10[3] = &unk_1E4002F68;
  objc_copyWeak(&v11, (id *)(a1 + 32));
  objc_msgSend(v3, "setActivationHandler:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_4;
  v8[3] = &unk_1E4002F68;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_5;
  v6[3] = &unk_1E4002F68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);

}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didActivateConnection");

}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reconnect");

}

void __45__SHSheetUIServiceClient__setupNewConnection__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didInvalidateConnection");

}

- (id)sessionServer
{
  void *v2;
  void *v3;

  -[SHSheetUIServiceClient connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isConnected
{
  return -[SHSheetUIServiceClient state](self, "state") == 2;
}

- (void)connect
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Connect UI Service", buf, 2u);
  }

  if (-[SHSheetUIServiceClient isConnected](self, "isConnected"))
  {
    -[SHSheetUIServiceClient sessionServer](self, "sessionServer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetUIServiceClient sessionIdentifier](self, "sessionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "connectWithSessionIdentifier:", v5);

  }
  else
  {
    share_sheet_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19E419000, v6, OS_LOG_TYPE_DEFAULT, "Current connection is not activated yet.", v7, 2u);
    }

    -[SHSheetUIServiceClient setPendingRequest:](self, "setPendingRequest:", -[SHSheetUIServiceClient pendingRequest](self, "pendingRequest") | 1);
  }
}

- (void)updateWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  share_sheet_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19E419000, v5, OS_LOG_TYPE_DEFAULT, "Request UI Service update", buf, 2u);
  }

  -[SHSheetUIServiceClient setCurrentContext:](self, "setCurrentContext:", v4);
  if (-[SHSheetUIServiceClient isConnected](self, "isConnected"))
  {
    -[SHSheetUIServiceClient sessionServer](self, "sessionServer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateWithContext:", v4);

  }
  else
  {
    share_sheet_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_19E419000, v7, OS_LOG_TYPE_DEFAULT, "Current connection is not activated yet.", v8, 2u);
    }

    -[SHSheetUIServiceClient setPendingRequest:](self, "setPendingRequest:", -[SHSheetUIServiceClient pendingRequest](self, "pendingRequest") | 2);
  }

}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate UI Service connection", v5, 2u);
  }

  -[SHSheetUIServiceClient connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (void)_activateConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetUIServiceClient connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Activate UI Service connection:%@", (uint8_t *)&v6, 0xCu);

  }
  if (-[SHSheetUIServiceClient state](self, "state") != 1)
  {
    -[SHSheetUIServiceClient setState:](self, "setState:", 1);
    -[SHSheetUIServiceClient connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activate");

  }
}

- (void)_reconnect
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetUIServiceClient connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "Reconnect UI Service connection:%@", (uint8_t *)&v5, 0xCu);

  }
  -[SHSheetUIServiceClient setPendingRequest:](self, "setPendingRequest:", -[SHSheetUIServiceClient pendingRequest](self, "pendingRequest") | 1);
  -[SHSheetUIServiceClient setPendingRequest:](self, "setPendingRequest:", -[SHSheetUIServiceClient pendingRequest](self, "pendingRequest") | 2);
  -[SHSheetUIServiceClient _activateConnection](self, "_activateConnection");
}

- (void)_didActivateConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetUIServiceClient connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "UI Service Connection was activated:%@", (uint8_t *)&v6, 0xCu);

  }
  -[SHSheetUIServiceClient setState:](self, "setState:", 2);
  if ((-[SHSheetUIServiceClient pendingRequest](self, "pendingRequest") & 1) != 0)
    -[SHSheetUIServiceClient connect](self, "connect");
  if ((-[SHSheetUIServiceClient pendingRequest](self, "pendingRequest") & 2) != 0)
  {
    -[SHSheetUIServiceClient currentContext](self, "currentContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SHSheetUIServiceClient updateWithContext:](self, "updateWithContext:", v5);

  }
  -[SHSheetUIServiceClient setPendingRequest:](self, "setPendingRequest:", 0);
}

- (void)_didInvalidateConnection
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  share_sheet_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[SHSheetUIServiceClient connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_19E419000, v3, OS_LOG_TYPE_DEFAULT, "UI Service Connection was invalidated:%@", (uint8_t *)&v5, 0xCu);

  }
  -[SHSheetUIServiceClient setState:](self, "setState:", 0);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (SHSheetContentPresenter)presenter
{
  return (SHSheetContentPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(int64_t)a3
{
  self->_pendingRequest = a3;
}

- (SHSheetUIServiceClientContext)currentContext
{
  return self->_currentContext;
}

- (void)setCurrentContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContext, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
