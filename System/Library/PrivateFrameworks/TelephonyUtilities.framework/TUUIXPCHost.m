@implementation TUUIXPCHost

- (TUUIXPCHost)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUUIXPCHost.m"), 38, CFSTR("%s is not available. Use a designated initializer instead."), "-[TUUIXPCHost init]");

  return 0;
}

- (TUUIXPCHost)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;
  id v7;
  TUUIXPCHost *v8;
  TUUIXPCHost *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUUIXPCHost;
  v8 = -[TUUIXPCHost init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_delegateQueue, a4);
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUUIXPCHost setXpcListener:](v9, "setXpcListener:", v10);

    -[TUUIXPCHost xpcListener](v9, "xpcListener");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v9);

    -[TUUIXPCHost xpcListener](v9, "xpcListener");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resume");

  }
  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  BOOL v15;
  TUUIXPCHostConnection *v17;
  void *v18;
  void *v19;
  TUUIXPCHostConnection *v20;
  NSObject *v21;
  _QWORD v22[5];
  TUUIXPCHostConnection *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Asked to accept new connection from %@", buf, 0xCu);
  }

  objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.telephonyutilities.callservicesd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v25 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            if ((objc_msgSend(v13, "isEqual:", CFSTR("modify-calls")) & 1) != 0
              || (objc_msgSend(v13, "isEqual:", CFSTR("access-ui-data-source")) & 1) != 0)
            {

              v17 = [TUUIXPCHostConnection alloc];
              -[TUUIXPCHost delegate](self, "delegate");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[TUUIXPCHost queue](self, "queue");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = -[TUUIXPCHostConnection initWithConnection:hostDelegate:connectionDelegate:queue:](v17, "initWithConnection:hostDelegate:connectionDelegate:queue:", v5, v18, self, v19);

              -[TUUIXPCHost queue](self, "queue");
              v21 = objc_claimAutoreleasedReturnValue();
              v22[0] = MEMORY[0x1E0C809B0];
              v22[1] = 3221225472;
              v22[2] = __50__TUUIXPCHost_listener_shouldAcceptNewConnection___block_invoke;
              v22[3] = &unk_1E38A1388;
              v22[4] = self;
              v23 = v20;
              v14 = v20;
              dispatch_async(v21, v22);

              v15 = 1;
              goto LABEL_18;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v10)
            continue;
          break;
        }
      }

    }
  }
  TUDefaultLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_19A50D000, v14, OS_LOG_TYPE_DEFAULT, "[WARN] New connection is missing entitlement to access UIXPC so declining the connection %@", buf, 0xCu);
  }
  v15 = 0;
LABEL_18:

  return v15;
}

void __50__TUUIXPCHost_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  TUDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19A50D000, v3, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)TUUIXPCHost;
  -[TUUIXPCHost dealloc](&v4, sel_dealloc);
}

- (void)connectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;

  v4 = a3;
  -[TUUIXPCHost queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[TUUIXPCHost connections](self, "connections");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (id)endpoint
{
  void *v2;
  void *v3;

  -[TUUIXPCHost xpcListener](self, "xpcListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (TUUIXPCHostDelegate)delegate
{
  return (TUUIXPCHostDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
  objc_storeStrong((id *)&self->_xpcListener, a3);
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
