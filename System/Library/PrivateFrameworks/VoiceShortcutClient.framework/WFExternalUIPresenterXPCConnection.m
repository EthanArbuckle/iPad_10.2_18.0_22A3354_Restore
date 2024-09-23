@implementation WFExternalUIPresenterXPCConnection

- (WFExternalUIPresenterXPCConnection)initWithEndpoint:(id)a3
{
  id v5;
  WFExternalUIPresenterXPCConnection *v6;
  WFExternalUIPresenterXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *xpcConnection;
  void *v10;
  WFExternalUIPresenterXPCConnection *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WFExternalUIPresenterXPCConnection;
  v6 = -[WFExternalUIPresenterXPCConnection init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
    xpcConnection = v7->_xpcConnection;
    v7->_xpcConnection = (NSXPCConnection *)v8;

    WFExternalUIPresenterXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v7->_xpcConnection, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection setInterruptionHandler:](v7->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_91);
    -[NSXPCConnection setInvalidationHandler:](v7->_xpcConnection, "setInvalidationHandler:", &__block_literal_global_92_8833);
    v11 = v7;
  }

  return v7;
}

- (void)resumeConnectionIfNecessary
{
  void *v3;

  if (!-[WFExternalUIPresenterXPCConnection connected](self, "connected"))
  {
    -[WFExternalUIPresenterXPCConnection xpcConnection](self, "xpcConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resume");

    -[WFExternalUIPresenterXPCConnection setConnected:](self, "setConnected:", 1);
  }
}

- (id)presenterWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[WFExternalUIPresenterXPCConnection resumeConnectionIfNecessary](self, "resumeConnectionIfNecessary");
  -[WFExternalUIPresenterXPCConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__WFExternalUIPresenterXPCConnection_presenterWithErrorHandler___block_invoke;
  v9[3] = &unk_1E5FC88A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

void __64__WFExternalUIPresenterXPCConnection_presenterWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    getWFVoiceShortcutClientLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "localizedDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 136315394;
      v8 = "-[WFExternalUIPresenterXPCConnection presenterWithErrorHandler:]_block_invoke";
      v9 = 2112;
      v10 = v5;
      _os_log_impl(&dword_1AF681000, v4, OS_LOG_TYPE_ERROR, "%s Siri XPC connection error: %@", (uint8_t *)&v7, 0x16u);

    }
    v6 = *(_QWORD *)(a1 + 32);
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }

}

@end
