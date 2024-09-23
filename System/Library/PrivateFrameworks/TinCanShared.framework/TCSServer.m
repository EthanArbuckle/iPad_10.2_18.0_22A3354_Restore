@implementation TCSServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id from;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BA16E8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v8);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254BA1968);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v9);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v10 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __48__TCSServer_listener_shouldAcceptNewConnection___block_invoke;
  v14[3] = &unk_24CFC2800;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  objc_msgSend(v7, "setInvalidationHandler:", v14);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __48__TCSServer_listener_shouldAcceptNewConnection___block_invoke_64;
  v12[3] = &unk_24CFC2448;
  objc_copyWeak(&v13, &from);
  objc_msgSend(v7, "setInterruptionHandler:", v12);
  -[TCSServer _addConnection:](self, "_addConnection:", v7);
  objc_msgSend(v7, "resume");
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __48__TCSServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3)
  {
    _TCSInitializeLogging();
    v4 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_21342E000, v4, OS_LOG_TYPE_DEFAULT, "TCSServer connection invalidation handler called for %@", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(WeakRetained, "_removeConnection:", v3);
  }

}

void __48__TCSServer_listener_shouldAcceptNewConnection___block_invoke_64(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TCSInitializeLogging();
    v2 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_21342E000, v2, OS_LOG_TYPE_DEFAULT, "TCSServer connection interruption handler called for %@", (uint8_t *)&v3, 0xCu);
    }
    objc_msgSend(WeakRetained, "invalidate");
  }

}

- (TCSServer)init
{
  TCSServer *v2;
  TCSServer *v3;
  uint64_t v4;
  NSMutableArray *connections;
  uint64_t v6;
  NSXPCListener *listener;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TCSServer;
  v2 = -[TCSServer init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_connectionsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    connections = v3->_connections;
    v3->_connections = (NSMutableArray *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.tincan.server"));
    listener = v3->_listener;
    v3->_listener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v3->_listener, "setDelegate:", v3);
    -[NSXPCListener resume](v3->_listener, "resume");
  }
  return v3;
}

- (BOOL)hasValidConnection
{
  os_unfair_lock_s *p_connectionsLock;
  uint64_t v4;

  p_connectionsLock = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);
  v4 = -[NSMutableArray count](self->_connections, "count");
  os_unfair_lock_unlock(p_connectionsLock);
  return v4 != 0;
}

- (void)callStatusChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__TCSServer_callStatusChanged___block_invoke;
  v6[3] = &unk_24CFC2828;
  v7 = v4;
  v5 = v4;
  -[TCSServer _enumerateConnectionsWithBlock:](self, "_enumerateConnectionsWithBlock:", v6);

}

void __31__TCSServer_callStatusChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callStatusChanged:", *(_QWORD *)(a1 + 32));

}

- (void)callConnected:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__TCSServer_callConnected___block_invoke;
  v6[3] = &unk_24CFC2828;
  v7 = v4;
  v5 = v4;
  -[TCSServer _enumerateConnectionsWithBlock:](self, "_enumerateConnectionsWithBlock:", v6);

}

void __27__TCSServer_callConnected___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callConnected:", *(_QWORD *)(a1 + 32));

}

- (void)remoteUplinkMuteChanged:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__TCSServer_remoteUplinkMuteChanged___block_invoke;
  v6[3] = &unk_24CFC2828;
  v7 = v4;
  v5 = v4;
  -[TCSServer _enumerateConnectionsWithBlock:](self, "_enumerateConnectionsWithBlock:", v6);

}

void __37__TCSServer_remoteUplinkMuteChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "remoteObjectProxy");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteUplinkMuteChanged:", *(_QWORD *)(a1 + 32));

}

- (void)sessionViewControllerViewDidAppear
{
  id v2;

  -[TCSServer delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionViewControllerViewDidAppear");

}

- (void)getCall:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TCSServer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getCall:", v4);

}

- (void)disconnectCall:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TCSServer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "disconnectCall:", v4);

}

- (void)queryIsTinCannable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TCSServer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryIsTinCannable:", v4);

}

- (void)completeInvitationFlowForContact:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TCSServer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completeInvitationFlowForContact:", v4);

}

- (void)setUplinkMuted:(BOOL)a3 for:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = a5;
  v9 = a4;
  -[TCSServer delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUplinkMuted:for:completion:", v6, v9, v8);

}

- (void)getLogEntryForCallWithUniqueProxyIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[TCSServer delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getLogEntryForCallWithUniqueProxyIdentifier:completion:", v7, v6);

}

- (void)_addConnection:(id)a3
{
  os_unfair_lock_s *p_connectionsLock;
  id v5;

  p_connectionsLock = &self->_connectionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_connectionsLock);
  -[NSMutableArray addObject:](self->_connections, "addObject:", v5);

  os_unfair_lock_unlock(p_connectionsLock);
}

- (void)_enumerateConnectionsWithBlock:(id)a3
{
  id v4;
  os_unfair_lock_s *p_connectionsLock;
  NSMutableArray *connections;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  p_connectionsLock = &self->_connectionsLock;
  os_unfair_lock_lock(&self->_connectionsLock);
  connections = self->_connections;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__TCSServer__enumerateConnectionsWithBlock___block_invoke;
  v8[3] = &unk_24CFC2850;
  v9 = v4;
  v7 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](connections, "enumerateObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_connectionsLock);

}

uint64_t __44__TCSServer__enumerateConnectionsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removeConnection:(id)a3
{
  os_unfair_lock_s *p_connectionsLock;
  id v5;

  p_connectionsLock = &self->_connectionsLock;
  v5 = a3;
  os_unfair_lock_lock(p_connectionsLock);
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", v5);

  -[NSMutableArray count](self->_connections, "count");
  os_unfair_lock_unlock(p_connectionsLock);
}

- (TCSServerXPC)delegate
{
  return (TCSServerXPC *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
