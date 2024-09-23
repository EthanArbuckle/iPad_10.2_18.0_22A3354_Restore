@implementation XCTTargetSession

- (XCTTargetSession)initWithServiceName:(id)a3 registrationHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  XCTTargetSession *v10;

  v6 = a4;
  v7 = a3;
  XCTSharedDaemonConnectionProvider();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeNewDaemonConnectionWithServiceName:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[XCTTargetSession initWithDaemonConnection:registrationHandler:](self, "initWithDaemonConnection:registrationHandler:", v9, v6);
  return v10;
}

- (XCTTargetSession)initWithDaemonConnection:(id)a3 registrationHandler:(id)a4
{
  NSXPCConnection *v7;
  id v8;
  XCTTargetSession *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSXPCConnection *daemonConnection;
  NSXPCConnection *v14;
  uint64_t v15;
  id registrationHandler;
  void *v18;
  objc_super v19;

  v7 = (NSXPCConnection *)a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XCTTargetSession.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemonConnection != nil"));

  }
  v19.receiver = self;
  v19.super_class = (Class)XCTTargetSession;
  v9 = -[XCTTargetSession init](&v19, sel_init);
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("com.apple.dt.xctest.targetsession", v10);
  queue = v9->_queue;
  v9->_queue = (OS_dispatch_queue *)v11;

  daemonConnection = v9->_daemonConnection;
  v9->_daemonConnection = v7;
  v14 = v7;

  v15 = MEMORY[0x20BD0A668](v8);
  registrationHandler = v9->_registrationHandler;
  v9->_registrationHandler = (id)v15;

  return v9;
}

- (void)connect
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__XCTTargetSession_connect__block_invoke;
  block[3] = &unk_24C0A9E98;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __27__XCTTargetSession_connect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_on_queue_connect");
}

- (void)registerForBootstrap
{
  void (**v3)(void);

  if (!-[XCTTargetSession targetIsRegistering](self, "targetIsRegistering"))
  {
    -[XCTTargetSession setTargetIsRegistering:](self, "setTargetIsRegistering:", 1);
    -[XCTTargetSession registrationHandler](self, "registrationHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)_on_queue_connect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[XCTTargetSession daemonConnection](self, "daemonConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exportedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25453F5B8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[XCTTargetSession daemonConnection](self, "daemonConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRemoteObjectInterface:", v5);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25453E878);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[XCTTargetSession daemonConnection](self, "daemonConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExportedInterface:", v7);

    -[XCTTargetSession daemonConnection](self, "daemonConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExportedObject:", self);

    objc_initWeak(&location, self);
    v10 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __37__XCTTargetSession__on_queue_connect__block_invoke;
    v18[3] = &unk_24C0A9EC0;
    objc_copyWeak(&v19, &location);
    -[XCTTargetSession daemonConnection](self, "daemonConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setInterruptionHandler:", v18);

    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __37__XCTTargetSession__on_queue_connect__block_invoke_202;
    v16[3] = &unk_24C0A9EC0;
    objc_copyWeak(&v17, &location);
    -[XCTTargetSession daemonConnection](self, "daemonConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInvalidationHandler:", v16);

    -[XCTTargetSession daemonConnection](self, "daemonConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resume");

    -[XCTTargetSession daemonConnection](self, "daemonConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_205);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "_XCT_registerTarget");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __37__XCTTargetSession__on_queue_connect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  XCTTBDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __37__XCTTargetSession__on_queue_connect__block_invoke_cold_1(v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "registerForBootstrap");

}

void __37__XCTTargetSession__on_queue_connect__block_invoke_202(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  XCTTBDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2084C6000, v2, OS_LOG_TYPE_DEFAULT, "Connection to test daemon invalidated.", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "registerForBootstrap");

}

void __37__XCTTargetSession__on_queue_connect__block_invoke_203(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  XCTTBDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __37__XCTTargetSession__on_queue_connect__block_invoke_203_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (BOOL)_on_queue_loadAutomationSupportLibraryFromPath:(id)a3 error:(id *)a4
{
  __CFString *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint8_t buf[4];
  __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[XCTTargetSession connectionHandler](self, "connectionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (!v6)
    {
      XCTTBDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2084C6000, v9, OS_LOG_TYPE_DEFAULT, "Using default automation support library path", buf, 2u);
      }

      v6 = CFSTR("/Developer/Library/PrivateFrameworks/XCTAutomationSupport.framework");
    }
    XCTTBDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_2084C6000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to load %@.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "loadAndReturnError:", a4))
      {
        if (objc_msgSend(v12, "principalClass"))
        {
          if ((objc_msgSend((id)objc_msgSend(v12, "principalClass"), "instancesRespondToSelector:", sel_acceptNewConnection_) & 1) != 0)
          {
            objc_msgSend(v12, "principalClass");
            v13 = (void *)objc_opt_new();
            -[XCTTargetSession setConnectionHandler:](self, "setConnectionHandler:", v13);

            -[XCTTargetSession connectionHandler](self, "connectionHandler");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_opt_respondsToSelector();

            if ((v15 & 1) != 0)
            {
              -[XCTTargetSession connectionHandler](self, "connectionHandler");
              v16 = objc_claimAutoreleasedReturnValue();
              -[NSObject setInternalEntitlementChecker:](v16, "setInternalEntitlementChecker:", self);
            }
            else
            {
              XCTTBDefaultLog();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2084C6000, v16, OS_LOG_TYPE_DEFAULT, "Not setting internal entitlement checker, connection handler does not support it.", buf, 2u);
              }
            }

            v8 = 1;
            goto LABEL_24;
          }
          if (a4)
          {
            v20 = (void *)MEMORY[0x24BDD1540];
            v22 = objc_msgSend(v12, "principalClass");
            v18 = CFSTR("Bundle principal class '%@' does not conform to the XCTConnectionAccepting protocol.");
            v17 = v20;
            v19 = 3;
            goto LABEL_21;
          }
        }
        else if (a4)
        {
          v17 = (void *)MEMORY[0x24BDD1540];
          v18 = CFSTR("Bundle does not specify a principal class.");
          v19 = 2;
LABEL_21:
          objc_msgSend(v17, "_xct_error:description:", v19, v18, v22);
          goto LABEL_22;
        }
      }
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "_xct_error:description:", 1, CFSTR("No bundle at path %@"), v6);
LABEL_22:
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      goto LABEL_25;
    }
    v8 = 0;
    goto LABEL_24;
  }
  v8 = 1;
LABEL_25:

  return v8;
}

- (void)_on_queue_startListeningForClientConnections
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[XCTTargetSession connectionHandler](self, "connectionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XCTTargetSession.m"), 159, CFSTR("Connection handler must be loaded from the automation support library before listening for connections."));

  }
  if (!self->_clientListener)
  {
    XCTTBDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2084C6000, v5, OS_LOG_TYPE_DEFAULT, "Setting up target listener.", v8, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[XCTTargetSession setClientListener:](self, "setClientListener:", v6);

    -[NSXPCListener setDelegate:](self->_clientListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_clientListener, "resume");
  }
}

- (id)_on_queue_getListenerEndpoint
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[XCTTargetSession _on_queue_startListeningForClientConnections](self, "_on_queue_startListeningForClientConnections");
  return -[NSXPCListener endpoint](self->_clientListener, "endpoint");
}

- (void)_XCT_requestEndpointWithAutomationSupportLibraryPath:(id)a3 protocolVersion:(unint64_t)a4 reply:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v7 = a3;
  v8 = a5;
  XCTTBDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2084C6000, v9, OS_LOG_TYPE_DEFAULT, "Received request for endpoint.", buf, 2u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__XCTTargetSession__XCT_requestEndpointWithAutomationSupportLibraryPath_protocolVersion_reply___block_invoke;
  block[3] = &unk_24C0A9F28;
  block[4] = self;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_sync(queue, block);

}

void __95__XCTTargetSession__XCT_requestEndpointWithAutomationSupportLibraryPath_protocolVersion_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[8];
  id v16;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v16 = 0;
  v4 = objc_msgSend(v2, "_on_queue_loadAutomationSupportLibraryFromPath:error:", v3, &v16);
  v5 = v16;
  XCTTBDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_2084C6000, v7, OS_LOG_TYPE_DEFAULT, "Sending anonymous endpoint.", v15, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_on_queue_getListenerEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __95__XCTTargetSession__XCT_requestEndpointWithAutomationSupportLibraryPath_protocolVersion_reply___block_invoke_cold_1((uint64_t)v5, v7, v9, v10, v11, v12, v13, v14);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (BOOL)isInternallyEntitledConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  BOOL v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[16];
  __int128 v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v18 = 0u;
  v19 = 0u;
  if (v4)
    objc_msgSend(v4, "auditToken");
  -[XCTTargetSession daemonConnection](self, "daemonConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_221);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  XCTTBDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    *(_DWORD *)&buf[4] = v18;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = DWORD1(v18);
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v21) = DWORD2(v18);
    WORD2(v21) = 1024;
    *(_DWORD *)((char *)&v21 + 6) = HIDWORD(v18);
    WORD5(v21) = 1024;
    HIDWORD(v21) = v19;
    v22 = 1024;
    v23 = DWORD1(v19);
    v24 = 1024;
    v25 = DWORD2(v19);
    v26 = 1024;
    v27 = HIDWORD(v19);
    _os_log_impl(&dword_2084C6000, v8, OS_LOG_TYPE_DEFAULT, "Sending sync request to check entitlement for token %u %u %u %u %u %u %u %u", buf, 0x32u);
  }

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __51__XCTTargetSession_isInternallyEntitledConnection___block_invoke_222;
  v13[3] = &unk_24C0A9F70;
  v13[4] = &v14;
  *(_OWORD *)buf = v18;
  v21 = v19;
  objc_msgSend(v7, "_XCT_checkInternalEntitlementForAuditToken:completion:", buf, v13);
  XCTTBDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *((unsigned __int8 *)v15 + 24);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v10;
    _os_log_impl(&dword_2084C6000, v9, OS_LOG_TYPE_DEFAULT, "Returning %d for has internal entitlement.", buf, 8u);
  }

  v11 = *((_BYTE *)v15 + 24) != 0;
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __51__XCTTargetSession_isInternallyEntitledConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  XCTTBDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __37__XCTTargetSession__on_queue_connect__block_invoke_203_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __51__XCTTargetSession_isInternallyEntitledConnection___block_invoke_222(uint64_t a1, char a2)
{
  NSObject *v4;
  uint8_t v5[16];

  XCTTBDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2084C6000, v4, OS_LOG_TYPE_DEFAULT, "Got response to entitlement check", v5, 2u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  char v10;
  void *v12;
  uint8_t v13[16];

  v6 = a4;
  -[XCTTargetSession connectionHandler](self, "connectionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("XCTTargetSession.m"), 215, CFSTR("Connection handler object must be loaded before any incoming connections."));

  }
  XCTTBDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_2084C6000, v8, OS_LOG_TYPE_DEFAULT, "Received client to target connection.", v13, 2u);
  }

  -[XCTTargetSession connectionHandler](self, "connectionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "acceptNewConnection:", v6);

  return v10;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSXPCConnection)daemonConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDaemonConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCListener)clientListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 32, 1);
}

- (void)setClientListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (XCTConnectionAccepting)connectionHandler
{
  return (XCTConnectionAccepting *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConnectionHandler:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)registrationHandler
{
  return objc_getProperty(self, a2, 48, 1);
}

- (BOOL)targetIsRegistering
{
  return self->_targetIsRegistering;
}

- (void)setTargetIsRegistering:(BOOL)a3
{
  self->_targetIsRegistering = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_registrationHandler, 0);
  objc_storeStrong((id *)&self->_connectionHandler, 0);
  objc_storeStrong((id *)&self->_clientListener, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __37__XCTTargetSession__on_queue_connect__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2084C6000, log, OS_LOG_TYPE_ERROR, "Connection to test daemon interrupted.", v1, 2u);
}

void __37__XCTTargetSession__on_queue_connect__block_invoke_203_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2084C6000, a2, a3, "Error from xctestd proxy: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __95__XCTTargetSession__XCT_requestEndpointWithAutomationSupportLibraryPath_protocolVersion_reply___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2084C6000, a2, a3, "Error loading automation support library: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
