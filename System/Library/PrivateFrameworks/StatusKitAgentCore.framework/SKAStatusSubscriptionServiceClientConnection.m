@implementation SKAStatusSubscriptionServiceClientConnection

- (SKAStatusSubscriptionServiceClientConnection)initWithXPCConnection:(id)a3 queue:(id)a4 daemonProtocolDelegate:(id)a5 connectionLifecycleDelegate:(id)a6
{
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  SKAStatusSubscriptionServiceClientConnection *v15;
  SKAStatusSubscriptionServiceClientConnection *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id from;
  id location;
  objc_super v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  dispatch_assert_queue_V2(v12);
  v32.receiver = self;
  v32.super_class = (Class)SKAStatusSubscriptionServiceClientConnection;
  v15 = -[SKAStatusSubscriptionServiceClientConnection init](&v32, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak((id *)&v15->_connectionLifecycleDelegate, v14);
    objc_storeStrong((id *)&v16->_xpcConnection, a3);
    objc_msgSend(MEMORY[0x24BEB10A8], "daemonXPCInterface");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setExportedInterface:", v17);

    objc_msgSend(v11, "setExportedObject:", v13);
    objc_msgSend(MEMORY[0x24BEB10A8], "daemonDelegateXPCInterface");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRemoteObjectInterface:", v18);

    objc_msgSend(v11, "_setQueue:", v12);
    objc_initWeak(&location, v11);
    objc_initWeak(&from, v16);
    v19 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __127__SKAStatusSubscriptionServiceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke;
    v27[3] = &unk_24D976438;
    objc_copyWeak(&v28, &from);
    objc_copyWeak(&v29, &location);
    objc_msgSend(v11, "setInterruptionHandler:", v27);
    v21 = v19;
    v22 = 3221225472;
    v23 = __127__SKAStatusSubscriptionServiceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke_2;
    v24 = &unk_24D976438;
    objc_copyWeak(&v25, &from);
    objc_copyWeak(&v26, &location);
    objc_msgSend(v11, "setInvalidationHandler:", &v21);
    objc_msgSend(v11, "resume", v21, v22, v23, v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __127__SKAStatusSubscriptionServiceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SKAStatusSubscriptionServiceClientConnection logger](SKAStatusSubscriptionServiceClientConnection, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = 134217984;
    v7 = (int)objc_msgSend(v4, "processIdentifier");
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld interrupted", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(WeakRetained, "connectionLifecycleDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscriptionServiceClientConnectionWasInterrupted:", WeakRetained);

}

void __127__SKAStatusSubscriptionServiceClientConnection_initWithXPCConnection_queue_daemonProtocolDelegate_connectionLifecycleDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[SKAStatusSubscriptionServiceClientConnection logger](SKAStatusSubscriptionServiceClientConnection, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = 134217984;
    v7 = (int)objc_msgSend(v4, "processIdentifier");
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "XPC connection to PID %ld invalidated", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(WeakRetained, "connectionLifecycleDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscriptionServiceClientConnectionWasInvalidated:", WeakRetained);

}

- (id)asynchronousRemoteDaemonDelegateWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SKAStatusSubscriptionServiceClientConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __97__SKAStatusSubscriptionServiceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke;
  v9[3] = &unk_24D976460;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __97__SKAStatusSubscriptionServiceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  +[SKAStatusSubscriptionServiceClientConnection logger](SKAStatusSubscriptionServiceClientConnection, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __95__SKAStatusPublishingServiceClientConnection_asynchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)synchronousRemoteDaemonDelegateWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[SKAStatusSubscriptionServiceClientConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __96__SKAStatusSubscriptionServiceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke;
  v9[3] = &unk_24D976460;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __96__SKAStatusSubscriptionServiceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  +[SKAStatusSubscriptionServiceClientConnection logger](SKAStatusSubscriptionServiceClientConnection, "logger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __94__SKAStatusPublishingServiceClientConnection_synchronousRemoteDaemonDelegateWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  SKAStatusSubscriptionServiceClientConnection *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  +[SKAStatusSubscriptionServiceClientConnection logger](SKAStatusSubscriptionServiceClientConnection, "logger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_2188DF000, v3, OS_LOG_TYPE_DEFAULT, "Deallocing {pointer: %p}", buf, 0xCu);
  }

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SKAStatusSubscriptionServiceClientConnection;
  -[SKAStatusSubscriptionServiceClientConnection dealloc](&v4, sel_dealloc);
}

+ (BOOL)clientIsEntitledForAtLeastOneSubscriptionServiceType:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v7;

  v3 = a3;
  objc_msgSend(v3, "sk_stringArrayValueForEntitlement:", CFSTR("com.apple.StatusKit.subscribe.types"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count")
    || (objc_msgSend(v3, "sk_BOOLeanValueForEntitlement:", CFSTR("com.apple.StatusKit.subscribe.allTypes")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[SKAStatusSubscriptionServiceClientConnection logger](SKAStatusSubscriptionServiceClientConnection, "logger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[SKAStatusPublishingServiceClientConnection clientIsEntitledForAtLeastOnePublishingServiceType:].cold.1(v7);

    v5 = 0;
  }

  return v5;
}

- (BOOL)clientIsEntitledForAtLeastOneSubscriptionServiceType
{
  return +[SKAStatusSubscriptionServiceClientConnection clientIsEntitledForAtLeastOneSubscriptionServiceType:](SKAStatusSubscriptionServiceClientConnection, "clientIsEntitledForAtLeastOneSubscriptionServiceType:", self->_xpcConnection);
}

- (BOOL)clientIsEntitledForSubscriptionWithStatusTypeIdentifier:(id)a3
{
  return +[SKAStatusSubscriptionServiceClientConnection _connection:isEntitledForSubscriptionWithStatusTypeIdentifier:](SKAStatusSubscriptionServiceClientConnection, "_connection:isEntitledForSubscriptionWithStatusTypeIdentifier:", self->_xpcConnection, a3);
}

+ (BOOL)_connection:(id)a3 isEntitledForSubscriptionWithStatusTypeIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length")
    && (objc_msgSend(v5, "sk_stringArrayValueForEntitlement:", CFSTR("com.apple.StatusKit.subscribe.types")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "containsObject:", v6),
        v7,
        (v8 & 1) != 0)
    || objc_msgSend(v6, "length")
    && (objc_msgSend(v5, "sk_BOOLeanValueForEntitlement:", CFSTR("com.apple.StatusKit.subscribe.allTypes")) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    +[SKAStatusSubscriptionServiceClientConnection logger](SKAStatusSubscriptionServiceClientConnection, "logger");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SKAStatusSubscriptionServiceClientConnection _connection:isEntitledForSubscriptionWithStatusTypeIdentifier:].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ PID=%ld>"), v5, -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)processIdentifier
{
  return -[NSXPCConnection processIdentifier](self->_xpcConnection, "processIdentifier");
}

+ (id)logger
{
  if (logger_onceToken_24 != -1)
    dispatch_once(&logger_onceToken_24, &__block_literal_global_24);
  return (id)logger__logger_24;
}

void __54__SKAStatusSubscriptionServiceClientConnection_logger__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.StatusKit", "SKAStatusSubscriptionServiceClientConnection");
  v1 = (void *)logger__logger_24;
  logger__logger_24 = (uint64_t)v0;

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (SKAStatusSubscriptionServiceClientConnectionLifecycleDelegate)connectionLifecycleDelegate
{
  return (SKAStatusSubscriptionServiceClientConnectionLifecycleDelegate *)objc_loadWeakRetained((id *)&self->_connectionLifecycleDelegate);
}

- (void)setConnectionLifecycleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_connectionLifecycleDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connectionLifecycleDelegate);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

+ (void)_connection:(uint64_t)a3 isEntitledForSubscriptionWithStatusTypeIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2188DF000, a2, a3, "Client is not entitled to subscription information for status of type %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
