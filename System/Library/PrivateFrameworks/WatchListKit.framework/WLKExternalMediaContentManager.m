@implementation WLKExternalMediaContentManager

+ (id)sharedManager
{
  if (sharedManager___once != -1)
    dispatch_once(&sharedManager___once, &__block_literal_global_50);
  return (id)sharedManager___sharedManager;
}

void __47__WLKExternalMediaContentManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WLKExternalMediaContentManager _init]([WLKExternalMediaContentManager alloc], "_init");
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

- (WLKExternalMediaContentManager)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKExternalMediaContentManagerInitException"), CFSTR("-init is not supported. Use +sharedManager."));

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKExternalMediaContentManager;
  return -[WLKExternalMediaContentManager init](&v3, sel_init);
}

- (void)deletePlaybackActivityWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "mainBundle");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKExternalMediaContentManager _deletePlaybackActivityWithIdentifier:bundleID:](self, "_deletePlaybackActivityWithIdentifier:bundleID:", v5, v6);

}

- (void)_deletePlaybackActivityWithIdentifier:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[WLKExternalMediaContentManager _proxy](self, "_proxy");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deletePlaybackActivityWithIdentifier:bundleID:", v7, v6);

}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10C778);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v8 = self->_connection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF10C7D8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_110);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __45__WLKExternalMediaContentManager__connection__block_invoke_2;
    v15 = &unk_1E68A7FC0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __45__WLKExternalMediaContentManager__connection__block_invoke()
{
  NSLog(CFSTR("Connection interrupted."));
}

void __45__WLKExternalMediaContentManager__connection__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  NSLog(CFSTR("Connection invalidated."));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v4 = WeakRetained;

    WeakRetained = v4;
  }

}

- (id)_proxy
{
  void *v2;
  void *v3;

  -[WLKExternalMediaContentManager _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_116);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __40__WLKExternalMediaContentManager__proxy__block_invoke(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("Error: Unable to communicate with the remote object proxy (%@)"), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
