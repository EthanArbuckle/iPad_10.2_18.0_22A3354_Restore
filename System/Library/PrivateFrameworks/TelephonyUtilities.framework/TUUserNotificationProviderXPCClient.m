@implementation TUUserNotificationProviderXPCClient

+ (TUUserNotificationsProviderXPCServer)asynchronousServer
{
  return (TUUserNotificationsProviderXPCServer *)objc_loadWeakRetained(&sAsynchronousServer_0);
}

+ (void)setAsynchronousServer:(id)a3
{
  objc_storeWeak(&sAsynchronousServer_0, a3);
}

+ (TUUserNotificationsProviderXPCServer)synchronousServer
{
  return (TUUserNotificationsProviderXPCServer *)objc_loadWeakRetained(&sSynchronousServer_0);
}

+ (void)setSynchronousServer:(id)a3
{
  objc_storeWeak(&sSynchronousServer_0, a3);
}

- (TUUserNotificationProviderXPCClient)init
{
  TUUserNotificationProviderXPCClient *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUUserNotificationProviderXPCClient;
  v2 = -[TUUserNotificationProviderXPCClient init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.telephonyutilities.usernotificationproviderxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TUUserNotificationProviderXPCClient;
  -[TUUserNotificationProviderXPCClient dealloc](&v3, sel_dealloc);
}

- (void)momentCapturedForStreamToken:(int64_t)a3 requesterID:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v19 = a3;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "momentCapturedForStreamToken: %ld requesterID: %@", buf, 0x16u);
  }

  -[TUUserNotificationProviderXPCClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke;
  v14[3] = &unk_1E38A1A48;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  v12 = v9;
  v13 = v8;
  dispatch_async(v11, v14);

}

void __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "serverWithErrorHandler:", &__block_literal_global_4);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "momentCapturedForStreamToken:requesterID:reply:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke_2_cold_1((uint64_t)v2, v3);

}

- (NSXPCConnection)xpcConnection
{
  NSObject *v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  -[TUUserNotificationProviderXPCClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.telephonyutilities.callservicesdaemon.usernotificationprovider"), 0);
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    +[TUUserNotificationProviderXPCClient userNotificationProviderServerXPCInterface](TUUserNotificationProviderXPCClient, "userNotificationProviderServerXPCInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke;
    v12[3] = &unk_1E38A13D0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v12);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_7;
    v10[3] = &unk_1E38A13D0;
    objc_copyWeak(&v11, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v10);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_2;
    block[3] = &unk_1E38A1360;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

void __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "user notification provider xpc connection invalidated (client side)", v5, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

}

void __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, &__block_literal_global_9);

    WeakRetained = v3;
  }

}

void __52__TUUserNotificationProviderXPCClient_xpcConnection__block_invoke_2_8()
{
  NSObject *v0;
  uint8_t v1[16];

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19A50D000, v0, OS_LOG_TYPE_DEFAULT, "user notification provider XPC connection interrupted (client side)", v1, 2u);
  }

}

- (id)serverWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[TUUserNotificationProviderXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  WeakRetained = objc_loadWeakRetained(&sAsynchronousServer_0);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[TUUserNotificationProviderXPCClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)synchronousServerWithErrorHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[TUUserNotificationProviderXPCClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  WeakRetained = objc_loadWeakRetained(&sSynchronousServer_0);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
  }
  else
  {
    -[TUUserNotificationProviderXPCClient xpcConnection](self, "xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (NSXPCInterface)userNotificationProviderServerXPCInterface
{
  if (userNotificationProviderServerXPCInterface_onceToken != -1)
    dispatch_once(&userNotificationProviderServerXPCInterface_onceToken, &__block_literal_global_10);
  return (NSXPCInterface *)(id)userNotificationProviderServerXPCInterface_userNotificationProviderServerXPCInterface;
}

void __81__TUUserNotificationProviderXPCClient_userNotificationProviderServerXPCInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3B0BE0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)userNotificationProviderServerXPCInterface_userNotificationProviderServerXPCInterface;
  userNotificationProviderServerXPCInterface_userNotificationProviderServerXPCInterface = v0;

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __86__TUUserNotificationProviderXPCClient_momentCapturedForStreamToken_requesterID_reply___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Error registering moments captured stream token: %@", (uint8_t *)&v2, 0xCu);
}

@end
