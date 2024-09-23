@implementation WLDaemonConnection

- (WLDaemonConnection)init
{
  WLDaemonConnection *v2;
  NSLock *v3;
  NSLock *daemonLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLDaemonConnection;
  v2 = -[WLDaemonConnection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    daemonLock = v2->_daemonLock;
    v2->_daemonLock = v3;

  }
  return v2;
}

- (id)daemonConnection
{
  NSXPCConnection *daemonConn;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  NSXPCConnection *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  -[NSLock lock](self->_daemonLock, "lock");
  daemonConn = self->_daemonConn;
  if (!daemonConn)
  {
    objc_initWeak(&location, self);
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.matd"), 0);
    v5 = self->_daemonConn;
    self->_daemonConn = v4;

    v6 = self->_daemonConn;
    WLDaemonExportedInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    v8 = self->_daemonConn;
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __38__WLDaemonConnection_daemonConnection__block_invoke;
    v15[3] = &unk_24EFCA8A8;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v8, "setInvalidationHandler:", v15);
    v10 = self->_daemonConn;
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __38__WLDaemonConnection_daemonConnection__block_invoke_2;
    v13[3] = &unk_24EFCA8A8;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInterruptionHandler:](v10, "setInterruptionHandler:", v13);
    -[NSXPCConnection resume](self->_daemonConn, "resume");
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    daemonConn = self->_daemonConn;
  }
  v11 = daemonConn;
  -[NSLock unlock](self->_daemonLock, "unlock");
  return v11;
}

void __38__WLDaemonConnection_daemonConnection__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "lock");
    v2 = v3[2];
    v3[2] = 0;

    objc_msgSend(v3[1], "unlock");
    WeakRetained = v3;
  }

}

void __38__WLDaemonConnection_daemonConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;
  id v8;
  void (**v9)(void);
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  _WLLog(v1, 0, CFSTR("WLDaemonConnection XPC connection interrupted for weak instance %@"), v2, v3, v4, v5, v6, (uint64_t)WeakRetained);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[1], "lock");
    v8 = WeakRetained[2];
    WeakRetained[2] = 0;

    objc_msgSend(WeakRetained[1], "unlock");
    v7 = WeakRetained;
    v9 = (void (**)(void))WeakRetained[3];
    if (v9)
    {
      v9[2]();
      v7 = WeakRetained;
    }
  }

}

- (id)daemonWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WLDaemonConnection daemonConnection](self, "daemonConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidateDaemonConnection
{
  id v2;

  -[WLDaemonConnection daemonConnection](self, "daemonConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_daemonConn, 0);
  objc_storeStrong((id *)&self->_daemonLock, 0);
}

@end
