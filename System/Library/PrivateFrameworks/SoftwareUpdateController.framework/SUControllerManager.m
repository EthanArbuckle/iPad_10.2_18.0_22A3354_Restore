@implementation SUControllerManager

- (SUControllerManager)initWithDelegate:(id)a3
{
  return -[SUControllerManager initWithExclusiveControl:communalUponDisconnect:withDelegate:](self, "initWithExclusiveControl:communalUponDisconnect:withDelegate:", 0, 0, a3);
}

- (SUControllerManager)initWithExclusiveControl:(BOOL)a3 communalUponDisconnect:(BOOL)a4 withDelegate:(id)a5
{
  id v8;
  SUControllerManager *v9;
  SUControllerManager *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *serverQueue;
  dispatch_queue_t v13;
  OS_dispatch_queue *delegateQueue;
  const char *v15;
  NSObject *v16;
  uint64_t v17;
  int *v18;
  const char *v19;
  int *v20;
  NSObject *v21;
  int *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  int *v29;
  _QWORD handler[4];
  int *v31;
  objc_super v32;

  v8 = a5;
  v32.receiver = self;
  v32.super_class = (Class)SUControllerManager;
  v9 = -[SUControllerManager init](&v32, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = dispatch_queue_create("com.apple.SUControllerManager.server", 0);
    serverQueue = v10->_serverQueue;
    v10->_serverQueue = (OS_dispatch_queue *)v11;

    v13 = dispatch_queue_create("com.apple.SUControllerManager.delegate", 0);
    delegateQueue = v10->_delegateQueue;
    v10->_delegateQueue = (OS_dispatch_queue *)v13;

    v10->_exclusiveControl = a3;
    v10->_communalUponDisconnect = a4;
    *(_WORD *)&v10->_disconnected = 257;
    v15 = (const char *)objc_msgSend(CFSTR("com.apple.SoftwareUpdateController.Daemon.Launched"), "UTF8String");
    v16 = v10->_serverQueue;
    v17 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __84__SUControllerManager_initWithExclusiveControl_communalUponDisconnect_withDelegate___block_invoke;
    handler[3] = &unk_2518D08C0;
    v18 = v10;
    v31 = v18;
    notify_register_dispatch(v15, &v10->_notifyDaemonStartedToken, v16, handler);
    v19 = (const char *)objc_msgSend(CFSTR("com.apple.SoftwareUpdateController.State.change"), "UTF8String");
    v20 = v18 + 3;
    v21 = v10->_serverQueue;
    v25 = v17;
    v26 = 3221225472;
    v27 = __84__SUControllerManager_initWithExclusiveControl_communalUponDisconnect_withDelegate___block_invoke_2;
    v28 = &unk_2518D08C0;
    v22 = v18;
    v29 = v22;
    notify_register_dispatch(v19, v20, v21, &v25);
    v23 = (id)objc_msgSend(v22, "_serverConnection", v25, v26, v27, v28);

  }
  return v10;
}

uint64_t __84__SUControllerManager_initWithExclusiveControl_communalUponDisconnect_withDelegate___block_invoke(uint64_t a1)
{
  void *v2;

  +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAtLevel:label:format:", 1, "-[SUControllerManager initWithExclusiveControl:communalUponDisconnect:withDelegate:]_block_invoke", CFSTR("SUCManager - received notification that sucontrollerd is launched"));

  return objc_msgSend(*(id *)(a1 + 32), "_daemonLaunched");
}

uint64_t __84__SUControllerManager_initWithExclusiveControl_communalUponDisconnect_withDelegate___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStateReport");
}

- (void)dealloc
{
  NSObject *v3;
  OS_dispatch_queue *serverQueue;
  OS_dispatch_queue *delegateQueue;
  objc_super v6;
  _QWORD block[5];

  -[SUControllerManager serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SUControllerManager_dealloc__block_invoke;
  block[3] = &unk_2518D08E8;
  block[4] = self;
  dispatch_sync(v3, block);

  objc_storeWeak((id *)&self->_delegate, 0);
  serverQueue = self->_serverQueue;
  self->_serverQueue = 0;

  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = 0;

  notify_cancel(self->_notifyStateReportToken);
  notify_cancel(self->_notifyDaemonStartedToken);
  v6.receiver = self;
  v6.super_class = (Class)SUControllerManager;
  -[SUControllerManager dealloc](&v6, sel_dealloc);
}

void __30__SUControllerManager_dealloc__block_invoke(uint64_t a1)
{
  _xpc_connection_s *v1;

  v1 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 32);
  if (v1)
    xpc_connection_cancel(v1);
}

- (void)cancelCurrentConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[SUControllerManager serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__SUControllerManager_cancelCurrentConnection__block_invoke;
  block[3] = &unk_2518D08E8;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __46__SUControllerManager_cancelCurrentConnection__block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  uint64_t v3;
  void *v4;

  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    xpc_connection_cancel(v2);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[SUControllerManager serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SUControllerManager_setDelegate___block_invoke;
  block[3] = &unk_2518D0910;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

id __35__SUControllerManager_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
}

- (SUControllerManagerDelegate)delegate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[SUControllerManager serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__SUControllerManager_delegate__block_invoke;
  v6[3] = &unk_2518D0938;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUControllerManagerDelegate *)v4;
}

void __31__SUControllerManager_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)_connectToServer
{
  NSObject *v3;
  void *v4;
  OS_xpc_object *mach_service;
  OS_xpc_object *serverXPCConnection;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  void *v9;
  const char *v10;
  void *v11;
  uint64_t handler;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id location;

  -[SUControllerManager serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUControllerManager serverXPCConnection](self, "serverXPCConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    mach_service = xpc_connection_create_mach_service(SUControllerMachServiceName, 0, 2uLL);
    serverXPCConnection = self->_serverXPCConnection;
    self->_serverXPCConnection = mach_service;

    objc_initWeak(&location, self);
    -[SUControllerManager serverXPCConnection](self, "serverXPCConnection");
    v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    handler = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __39__SUControllerManager__connectToServer__block_invoke;
    v15 = &unk_2518D0960;
    objc_copyWeak(&v16, &location);
    xpc_connection_set_event_handler(v7, &handler);

    -[SUControllerManager serverXPCConnection](self, "serverXPCConnection");
    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    xpc_connection_resume(v8);

    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = getprogname();
    -[SUControllerManager serverXPCConnection](self, "serverXPCConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logAtLevel:label:format:", 1, "-[SUControllerManager _connectToServer]", CFSTR("SUCManager[CONNECTING] resumed server connection, sending add client message for client name %s, connection: %@"), v10, v11, handler, v13, v14, v15);

    -[SUControllerManager _addClient](self, "_addClient");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __39__SUControllerManager__connectToServer__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleXPCEvent:", v6);
  }
  else
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logAtLevel:label:format:", 0, "-[SUControllerManager _connectToServer]_block_invoke", CFSTR("SUCManager[GONE] XPC event when no strong self"));

  }
}

- (id)_serverConnection
{
  NSObject *v3;
  _QWORD block[5];

  -[SUControllerManager serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__SUControllerManager__serverConnection__block_invoke;
  block[3] = &unk_2518D08E8;
  block[4] = self;
  dispatch_sync(v3, block);

  return -[SUControllerManager serverXPCConnection](self, "serverXPCConnection");
}

uint64_t __40__SUControllerManager__serverConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectToServer");
}

- (void)_handleXPCEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SUControllerManager *v9;

  v4 = a3;
  -[SUControllerManager serverQueue](self, "serverQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SUControllerManager__handleXPCEvent___block_invoke;
  v7[3] = &unk_2518D0910;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__SUControllerManager__handleXPCEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const char *string;
  void *v15;
  id v16;

  v2 = MEMORY[0x249580634](*(_QWORD *)(a1 + 32));
  if (v2 == MEMORY[0x24BDACFB8])
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_stateName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logAtLevel:label:format:", 0, "-[SUControllerManager _handleXPCEvent:]_block_invoke", CFSTR("%@ XPC error on server connection: %s"), v11, xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x24BDACF40]));

    v12 = *(_QWORD *)(a1 + 32);
    if (v12 == MEMORY[0x24BDACF30])
    {
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logAtLevel:label:format:", 0, "-[SUControllerManager _handleXPCEvent:]_block_invoke", CFSTR("sucontrollerd disconnected"));

      objc_msgSend(*(id *)(a1 + 40), "setDisconnected:", 1);
      objc_msgSend(*(id *)(a1 + 40), "setServerXPCConnection:", 0);
      v12 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(a1 + 40), "_indicateConnectionError:", v12);
  }
  else
  {
    v3 = v2;
    v4 = *(void **)(a1 + 32);
    if (v3 == MEMORY[0x24BDACFA0])
    {
      string = xpc_dictionary_get_string(v4, SUControllerMessageTypeKey);
      if (!strcmp(string, SUControllerMessageTypeClientHasBeenAdded))
      {
        +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
        v16 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_stateName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logAtLevel:label:format:", 1, "-[SUControllerManager _handleXPCEvent:]_block_invoke", CFSTR("%@ XPC connection has been added"), v15);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "_indicateMessageReceived:messageType:", *(_QWORD *)(a1 + 32), string);
      }
    }
    else
    {
      v5 = MEMORY[0x249580580](v4);
      if (v5)
      {
        v6 = (void *)v5;
        +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_stateName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "serverXPCConnection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logAtLevel:label:format:", 0, "-[SUControllerManager _handleXPCEvent:]_block_invoke", CFSTR("%@ unexpected message %s on connection %p"), v8, v6, v9);

        free(v6);
      }
    }
  }
}

- (void)_handleStateReport
{
  id v2;

  +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logAtLevel:label:format:", 1, "-[SUControllerManager _handleStateReport]", CFSTR("sucontrollerd state changed"));

}

- (void)_daemonLaunched
{
  NSObject *v3;
  void *v4;
  void *v5;

  -[SUControllerManager serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SUControllerManager disconnected](self, "disconnected"))
  {
    if (-[SUControllerManager initializing](self, "initializing"))
    {
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "logAtLevel:label:format:", 1, "-[SUControllerManager _daemonLaunched]", CFSTR("sucontrollerd is launched - initial launch after boot"));

      -[SUControllerManager setInitializing:](self, "setInitializing:", 0);
    }
    else
    {
      -[SUControllerManager _indicateConnectionRegained](self, "_indicateConnectionRegained");
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "logAtLevel:label:format:", 1, "-[SUControllerManager _daemonLaunched]", CFSTR("sucontrollerd is relaunched.  Connecting %s to get deletegate callback again."), getprogname());

      -[SUControllerManager _connectToServer](self, "_connectToServer");
    }
    -[SUControllerManager setDisconnected:](self, "setDisconnected:", 0);
  }
}

- (void)_addClient
{
  NSObject *v3;
  void *v4;
  xpc_object_t v5;
  const char *v6;
  _xpc_connection_s *v7;
  id v8;

  -[SUControllerManager serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s"), getprogname());
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUControllerMessageTypeKey, SUControllerMessageTypeAddClient);
  v6 = SUControllerMessageClientNameKey;
  v8 = objc_retainAutorelease(v4);
  xpc_dictionary_set_string(v5, v6, (const char *)objc_msgSend(v8, "UTF8String"));
  xpc_dictionary_set_BOOL(v5, SUControllerMessageExclusiveControlKey, -[SUControllerManager exclusiveControl](self, "exclusiveControl"));
  xpc_dictionary_set_BOOL(v5, SUControllerMessageCommunalUponDisconnectKey, -[SUControllerManager communalUponDisconnect](self, "communalUponDisconnect"));
  -[SUControllerManager serverXPCConnection](self, "serverXPCConnection");
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v7, v5);

}

- (id)_stateName
{
  NSObject *v3;

  -[SUControllerManager serverQueue](self, "serverQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[SUControllerManager disconnected](self, "disconnected"))
    return CFSTR("SUCManager[DISCONNECTED]");
  else
    return CFSTR("SUCManager[CONNECTED]");
}

- (void)_indicateConnectionError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SUControllerManager delegateQueue](self, "delegateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__SUControllerManager__indicateConnectionError___block_invoke;
  v7[3] = &unk_2518D0910;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __48__SUControllerManager__indicateConnectionError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forwardConnectionError:", *(_QWORD *)(a1 + 40));
}

- (void)_indicateConnectionRegained
{
  NSObject *v3;
  _QWORD block[5];

  -[SUControllerManager delegateQueue](self, "delegateQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__SUControllerManager__indicateConnectionRegained__block_invoke;
  block[3] = &unk_2518D08E8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __50__SUControllerManager__indicateConnectionRegained__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_forwardConnectionRegained");
}

- (void)_indicateMessageReceived:(id)a3 messageType:(const char *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  const char *v11;

  v6 = a3;
  -[SUControllerManager delegateQueue](self, "delegateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__SUControllerManager__indicateMessageReceived_messageType___block_invoke;
  block[3] = &unk_2518D0988;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __60__SUControllerManager__indicateMessageReceived_messageType___block_invoke(uint64_t a1)
{
  const char *v2;
  int v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *(const char **)(a1 + 48);
  if (!strcmp(v2, SUControllerMessageTypeDownloadProgress))
  {
    objc_msgSend(*(id *)(a1 + 32), "_forwardDownloadProgress:", *(_QWORD *)(a1 + 40));
  }
  else if (!strcmp(v2, SUControllerMessageTypeScanResult))
  {
    objc_msgSend(*(id *)(a1 + 32), "_forwardScanResult:", *(_QWORD *)(a1 + 40));
  }
  else if (!strcmp(v2, SUControllerMessageTypeScanPostponed))
  {
    objc_msgSend(*(id *)(a1 + 32), "_forwardScanPostponed:", *(_QWORD *)(a1 + 40));
  }
  else if (!strcmp(v2, SUControllerMessageTypeApplyProgress))
  {
    objc_msgSend(*(id *)(a1 + 32), "_forwardApplyProgress:", *(_QWORD *)(a1 + 40));
  }
  else if (!strcmp(v2, SUControllerMessageTypeInstallResult))
  {
    objc_msgSend(*(id *)(a1 + 32), "_forwardInstallResult:", *(_QWORD *)(a1 + 40));
  }
  else if (!strcmp(v2, SUControllerMessageTypeAutoScanPerformed))
  {
    objc_msgSend(*(id *)(a1 + 32), "_forwardAutoScanPerformed:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (!strcmp(v2, SUControllerMessageTypeInstallationCanProceed))
    {
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logAtLevel:label:format:", 0, "-[SUControllerManager _indicateMessageReceived:messageType:]_block_invoke", CFSTR("[DELEGATE] deprecated message type %s - not reporting whether installation can proceed"), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v3 = strcmp(v2, SUControllerMessageTypeInstallationWillProceed);
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 48);
      v6 = v4;
      if (v3)
        objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerManager _indicateMessageReceived:messageType:]_block_invoke", CFSTR("unhandled message type %s - not reported to client"), v5);
      else
        objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerManager _indicateMessageReceived:messageType:]_block_invoke", CFSTR("[DELEGATE] deprecated message type %s - not reporting whether installation will proceed"), v5);
    }

  }
}

- (void)_forwardConnectionError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[SUControllerManager delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 == (id)MEMORY[0x24BDACF30])
    v9 = 34;
  else
    v9 = 35;
  SUControllerError(CFSTR("SUControllerError"), v9, 0, CFSTR("server connection error %@"), v5, v6, v7, v8, (uint64_t)v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "manager:connectionError:", self, v10);
  }
  else
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logAtLevel:label:format:", 1, "-[SUControllerManager _forwardConnectionError:]", CFSTR("[DELEGATE] delegate does not respond to connectionError - not reporting connection error: %@"), v10);

  }
}

- (void)_forwardConnectionRegained
{
  void *v3;
  id v4;

  -[SUControllerManager delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "connectionRegained:", self);
  }
  else
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logAtLevel:label:format:", 1, "-[SUControllerManager _forwardConnectionRegained]", CFSTR("[DELEGATE] delegate does not respond to connectionRegained - not reporting connection regained"));

  }
}

- (void)_forwardScanResult:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = SUControllerMessageTypeScanForUpdates;
  v5 = SUControllerMessageDescriptorKey;
  v6 = a3;
  v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = SUControllerMessageTypeScanForUpdates;
  v9 = SUControllerMessageErrorKey;
  v10 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v8, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUControllerManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "manager:scanRequestDidLocateUpdate:error:", self, v14, v11);
  }
  else
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logAtLevel:label:format:", 1, "-[SUControllerManager _forwardScanResult:]", CFSTR("[DELEGATE] delegate does not respond to scanRequestDidLocateUpdate - not reporting scan result"));

  }
}

- (void)_forwardScanPostponed:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = SUControllerMessageTypeScanPostponed;
  v5 = SUControllerMessageDescriptorKey;
  v6 = a3;
  v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = SUControllerMessageTypeScanPostponed;
  v9 = SUControllerMessageErrorKey;
  v10 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v8, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUControllerManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "manager:scanRequestPostponed:error:", self, v14, v11);
  }
  else
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logAtLevel:label:format:", 1, "-[SUControllerManager _forwardScanPostponed:]", CFSTR("[DELEGATE] delegate does not respond to scanRequestPostponed - not reporting scan postponed"));

  }
}

- (void)_forwardDownloadProgress:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;

  v4 = SUControllerMessageTypeDownloadProgress;
  v5 = SUControllerMessageDownloadKey;
  v6 = a3;
  v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  v8 = SUControllerMessageTypeDownloadProgress;
  v9 = SUControllerMessageErrorKey;
  v10 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v8, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUControllerManager delegate](self, "delegate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11)
  {
    objc_msgSend(v28, "progress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isDone");

    if (v18)
    {
      if (!v13)
        goto LABEL_15;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v28, "descriptor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "willProceedWithInstallation");
        objc_msgSend(v28, "descriptor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isAwaitingAdmissionControlForInstallation");
        v23 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v28, "descriptor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "denialReasons");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v25, "code"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "manager:didFinishDownload:willProceedWithInstallation:waitingForAdmissionControl:denialReasons:", self, v28, v20, v22, v26);

      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v13, "manager:didFinishDownload:", self, v28);
            goto LABEL_15;
          }
          +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          v16 = CFSTR("[DELEGATE] delegate does not respond to didFinishDownload - not reporting download-and-prepare done");
          goto LABEL_14;
        }
        objc_msgSend(v28, "descriptor");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v19, "willProceedWithInstallation");
        objc_msgSend(v28, "descriptor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "manager:didFinishDownload:willProceedWithInstallation:waitingForAdmissionControl:", self, v28, v27, objc_msgSend(v21, "isAwaitingAdmissionControlForInstallation"));
      }

      goto LABEL_15;
    }
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "manager:didChangeProgressOnDownload:", self, v28);
      goto LABEL_15;
    }
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("[DELEGATE] delegate does not respond to didChangeProgressOnDownload - not reporting download-and-prepare progress");
LABEL_14:
    objc_msgSend(v14, "logAtLevel:label:format:", 1, "-[SUControllerManager _forwardDownloadProgress:]", v16);

    goto LABEL_15;
  }
  if (!v12 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("[DELEGATE] delegate does not respond to didFailDownload - not reporting download-and-prepare failure");
    goto LABEL_14;
  }
  objc_msgSend(v13, "manager:didFailDownload:withError:", self, v28, v11);
LABEL_15:

}

- (void)_forwardApplyProgress:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;

  v4 = SUControllerMessageTypeApplyProgress;
  v5 = SUControllerMessageApplyKey;
  v6 = a3;
  v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[SUControllerManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isDone");

  if ((v10 & 1) == 0)
  {
    if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "descriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "progress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "manager:didChangeProgressOnApply:progress:", self, v11, v12);

    }
    else
    {
      +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logAtLevel:label:format:", 1, "-[SUControllerManager _forwardApplyProgress:]", CFSTR("[DELEGATE] delegate does not respond to didChangeProgressOnApply - not reporting apply progress"));
    }

  }
}

- (void)_forwardInstallResult:(id)a3
{
  char *v4;
  char *v5;
  id v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;

  v4 = SUControllerMessageTypeInstallResult;
  v5 = SUControllerMessageDescriptorKey;
  v6 = a3;
  v7 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v4, v6, v5, v7);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v8 = SUControllerMessageTypeInstallResult;
  v9 = SUControllerMessageErrorKey;
  v10 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v8, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUControllerManager delegate](self, "delegate");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (!v11)
  {
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "manager:didFinishInstallation:", self, v17);
      goto LABEL_11;
    }
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("[DELEGATE] delegate does not respond to didFinishInstallation - not reporting install success");
LABEL_10:
    objc_msgSend(v14, "logAtLevel:label:format:", 1, "-[SUControllerManager _forwardInstallResult:]", v16);

    goto LABEL_11;
  }
  if (!v12 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("[DELEGATE] delegate does not respond to didFailInstallation - not reporting install failure");
    goto LABEL_10;
  }
  objc_msgSend(v13, "manager:didFailInstallation:withError:", self, v17, v11);
LABEL_11:

}

- (void)_forwardAutoScanPerformed:(id)a3
{
  void *v4;
  id v5;

  -[SUControllerManager delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "autoScanPerformed:", self);
  }
  else
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logAtLevel:label:format:", 1, "-[SUControllerManager _forwardAutoScanPerformed:]", CFSTR("[DELEGATE] delegate does not respond to autoScanPerformed - not reporting auto scan performed"));

  }
}

- (void)managerStatus:(id)a3
{
  id v4;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  id v7;
  _QWORD handler[4];
  id v9;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUControllerMessageTypeKey, SUControllerMessageTypeQueryManagerStatus);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __37__SUControllerManager_managerStatus___block_invoke;
  handler[3] = &unk_2518D09B0;
  v9 = v4;
  v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);

}

void __37__SUControllerManager_managerStatus___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void *v23;
  const char *string;
  xpc_object_t xdict;

  xdict = a2;
  v3 = MEMORY[0x249580634]();
  if (v3 == MEMORY[0x24BDACFB8])
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logAtLevel:label:format:", 0, "-[SUControllerManager managerStatus:]_block_invoke", CFSTR("Got XPC error querying manager status"));

    v9 = *(_QWORD *)(a1 + 32);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
    v10 = CFSTR("Error from XPC: %s");
  }
  else
  {
    if (v3 == MEMORY[0x24BDACFA0])
    {
      v13 = SUControllerMessageTypeQueryManagerStatus;
      v14 = SUControllerMessageDescriptorKey;
      v15 = objc_opt_class();
      SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v13, xdict, v14, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = SUControllerMessageTypeQueryManagerStatus;
      v17 = SUControllerMessageStatusKey;
      v18 = objc_opt_class();
      SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v16, xdict, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = SUControllerMessageTypeQueryManagerStatus;
      v21 = SUControllerMessageErrorKey;
      v22 = objc_opt_class();
      SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v20, xdict, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_7;
    }
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerManager managerStatus:]_block_invoke", CFSTR("unexpected XPC type querying manager status"));

    v9 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("Unexpected XPC type");
  }
  SUControllerError(CFSTR("SUControllerError"), 2, 0, v10, v5, v6, v7, v8, (uint64_t)string);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v12);
LABEL_7:

}

- (void)managerState:(id)a3
{
  id v4;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  id v7;
  _QWORD handler[4];
  id v9;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUControllerMessageTypeKey, SUControllerMessageTypeQueryManagerState);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __36__SUControllerManager_managerState___block_invoke;
  handler[3] = &unk_2518D09B0;
  v9 = v4;
  v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);

}

void __36__SUControllerManager_managerState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  const char *string;
  xpc_object_t xdict;

  xdict = a2;
  v3 = MEMORY[0x249580634]();
  if (v3 == MEMORY[0x24BDACFB8])
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logAtLevel:label:format:", 0, "-[SUControllerManager managerState:]_block_invoke", CFSTR("Got XPC error querying manager state"));

    v9 = *(_QWORD *)(a1 + 32);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
    v10 = CFSTR("Error from XPC: %s");
  }
  else
  {
    if (v3 == MEMORY[0x24BDACFA0])
    {
      v13 = SUControllerMessageTypeQueryManagerState;
      v14 = SUControllerMessageDescriptorKey;
      v15 = objc_opt_class();
      SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v13, xdict, v14, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_get_int64(xdict, SUControllerMessageManagerStateKey);
      v16 = SUControllerMessageTypeQueryManagerState;
      v17 = SUControllerMessageErrorKey;
      v18 = objc_opt_class();
      SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v16, xdict, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_7;
    }
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerManager managerState:]_block_invoke", CFSTR("unexpected XPC type querying manager state"));

    v9 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("Unexpected XPC type");
  }
  SUControllerError(CFSTR("SUControllerError"), 2, 0, v10, v5, v6, v7, v8, (uint64_t)string);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v12);
LABEL_7:

}

- (void)managerConfig:(id)a3
{
  id v4;
  xpc_object_t v5;
  _xpc_connection_s *v6;
  id v7;
  _QWORD handler[4];
  id v9;

  v4 = a3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, SUControllerMessageTypeKey, SUControllerMessageTypeQueryManagerConfig);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __37__SUControllerManager_managerConfig___block_invoke;
  handler[3] = &unk_2518D09B0;
  v9 = v4;
  v7 = v4;
  xpc_connection_send_message_with_reply(v6, v5, 0, handler);

}

void __37__SUControllerManager_managerConfig___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  const char *string;
  xpc_object_t xdict;

  xdict = a2;
  v3 = MEMORY[0x249580634]();
  if (v3 == MEMORY[0x24BDACFB8])
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logAtLevel:label:format:", 0, "-[SUControllerManager managerConfig:]_block_invoke", CFSTR("Got XPC error querying manager config"));

    v9 = *(_QWORD *)(a1 + 32);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
    v10 = CFSTR("Error from XPC: %s");
  }
  else
  {
    if (v3 == MEMORY[0x24BDACFA0])
    {
      v13 = SUControllerMessageTypeQueryManagerConfig;
      v14 = SUControllerMessageManagerConfigKey;
      v15 = objc_opt_class();
      SUControllerIPCDecodeObjectForKey((uint64_t)v13, xdict, v14, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = SUControllerMessageTypeQueryManagerConfig;
      v17 = SUControllerMessageErrorKey;
      v18 = objc_opt_class();
      SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v16, xdict, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_7;
    }
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerManager managerConfig:]_block_invoke", CFSTR("unexpected XPC type querying manager config"));

    v9 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("Unexpected XPC type");
  }
  SUControllerError(CFSTR("SUControllerError"), 2, 0, v10, v5, v6, v7, v8, (uint64_t)string);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v12);
LABEL_7:

}

- (void)modifyConfig:(id)a3 modifying:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  _xpc_connection_s *v11;
  id v12;
  _QWORD handler[4];
  id v14;

  v8 = a5;
  v9 = a3;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, SUControllerMessageTypeKey, SUControllerMessageTypeModifyManagerConfig);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeModifyManagerConfig, v10, SUControllerMessageManagerConfigKey, v9);

  xpc_dictionary_set_int64(v10, SUControllerMessageManagerConfigChangeMaskKey, a4);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __57__SUControllerManager_modifyConfig_modifying_completion___block_invoke;
  handler[3] = &unk_2518D09B0;
  v14 = v8;
  v12 = v8;
  xpc_connection_send_message_with_reply(v11, v10, 0, handler);

}

void __57__SUControllerManager_modifyConfig_modifying_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  const char *string;
  xpc_object_t xdict;

  xdict = a2;
  v3 = MEMORY[0x249580634]();
  if (v3 == MEMORY[0x24BDACFB8])
  {
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logAtLevel:label:format:", 0, "-[SUControllerManager modifyConfig:modifying:completion:]_block_invoke", CFSTR("Got XPC error modifying manager config"));

    v9 = *(_QWORD *)(a1 + 32);
    string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
    v10 = CFSTR("Error from XPC: %s");
  }
  else
  {
    if (v3 == MEMORY[0x24BDACFA0])
    {
      v13 = SUControllerMessageTypeModifyManagerConfig;
      v14 = SUControllerMessageManagerConfigKey;
      v15 = objc_opt_class();
      SUControllerIPCDecodeObjectForKey((uint64_t)v13, xdict, v14, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = SUControllerMessageTypeModifyManagerConfig;
      v17 = SUControllerMessageErrorKey;
      v18 = objc_opt_class();
      SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v16, xdict, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      goto LABEL_7;
    }
    +[SUControllerLogger sharedLogger](SUControllerLogger, "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logAtLevel:label:format:", 0, "-[SUControllerManager modifyConfig:modifying:completion:]_block_invoke", CFSTR("unexpected XPC type modifying manager config"));

    v9 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("Unexpected XPC type");
  }
  SUControllerError(CFSTR("SUControllerError"), 2, 0, v10, v5, v6, v7, v8, (uint64_t)string);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v12);
LABEL_7:

}

- (void)scanForUpdates
{
  _xpc_connection_s *v3;
  xpc_object_t message;

  message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUControllerMessageTypeKey, SUControllerMessageTypeScanForUpdates);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v3, message);

}

- (void)scanForUpdates:(id)a3
{
  xpc_object_t v4;
  _xpc_connection_s *v5;
  id v6;

  v6 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, SUControllerMessageTypeKey, SUControllerMessageTypeScanForUpdates);
  if (v6)
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeScanForUpdates, v4, SUControllerMessageScanOptionsKey, v6);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v5, v4);

}

- (void)startDownload:(id)a3
{
  xpc_object_t v4;
  _xpc_connection_s *v5;
  id v6;

  v6 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, SUControllerMessageTypeKey, SUControllerMessageTypeStartDownload);
  if (v6)
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeStartDownload, v4, SUControllerMessageDescriptorKey, v6);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v5, v4);

}

- (void)installUpdate:(id)a3
{
  xpc_object_t v4;
  _xpc_connection_s *v5;
  id v6;

  v6 = a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, SUControllerMessageTypeKey, SUControllerMessageTypeInstallUpdate);
  if (v6)
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeInstallUpdate, v4, SUControllerMessageDescriptorKey, v6);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v5, v4);

}

- (void)userDidAcceptTermsAndConditionsForUpdate:(id)a3
{
  xpc_object_t v4;
  _xpc_connection_s *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setUserDidAcceptTermsAndConditions:", 1);
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, SUControllerMessageTypeKey, SUControllerMessageTypeUserDidAcceptTermsAndConditions);
  if (v6)
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUserDidAcceptTermsAndConditions, v4, SUControllerMessageDescriptorKey, v6);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v5, v4);

}

- (void)updateAcceptingTermsAndConditions
{
  -[SUControllerManager updateAcceptingTermsAndConditions:usingPassword:](self, "updateAcceptingTermsAndConditions:usingPassword:", 0, 0);
}

- (void)updateAcceptingTermsAndConditions:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  xpc_object_t message;

  v4 = a3;
  message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUControllerMessageTypeKey, SUControllerMessageTypeUpdateAcceptingTermsAndConditions);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUpdateAcceptingTermsAndConditions, message, SUControllerMessageSSOTokenKey, v4);

  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v5, message);

}

- (void)updateAcceptingTermsAndConditions:(id)a3 usingPassword:(id)a4
{
  id v6;
  id v7;
  _xpc_connection_s *v8;
  xpc_object_t message;

  v6 = a4;
  v7 = a3;
  message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUControllerMessageTypeKey, SUControllerMessageTypeUpdateAcceptingTermsAndConditions);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUpdateAcceptingTermsAndConditions, message, SUControllerMessageAccountNameKey, v7);

  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUpdateAcceptingTermsAndConditions, message, SUControllerMessagePasswordKey, v6);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, message);

}

- (void)purgeUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  xpc_object_t v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  id v11;
  _QWORD handler[4];
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, SUControllerMessageTypeKey, SUControllerMessageTypePurgeUpdate);
  if (v6)
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypePurgeUpdate, v8, SUControllerMessageDescriptorKey, v6);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __46__SUControllerManager_purgeUpdate_completion___block_invoke;
  handler[3] = &unk_2518D09B0;
  v13 = v7;
  v11 = v7;
  xpc_connection_send_message_with_reply(v9, v8, v10, handler);

}

void __46__SUControllerManager_purgeUpdate_completion___block_invoke(uint64_t a1, void *a2)
{
  char *v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = SUControllerMessageTypePurgeUpdate;
  v4 = SUControllerMessageErrorKey;
  v5 = a2;
  v6 = objc_opt_class();
  SUControllerIPCDecodeOptionalObjectForKey((uint64_t)v3, v5, v4, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (void)performMigration
{
  _xpc_connection_s *v3;
  xpc_object_t message;

  message = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(message, SUControllerMessageTypeKey, SUControllerMessageTypePerformMigration);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v3, message);

}

- (void)useSSOTokenToPersonalize:(id)a3 withSSOToken:(id)a4
{
  id v6;
  xpc_object_t v7;
  _xpc_connection_s *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, SUControllerMessageTypeKey, SUControllerMessageTypeUseSSOTokenToPersonalize);
  if (v9)
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseSSOTokenToPersonalize, v7, SUControllerMessageDescriptorKey, v9);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseSSOTokenToPersonalize, v7, SUControllerMessageSSOTokenKey, v6);
  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v8, v7);

}

- (void)useCredentialsToPersonalize:(id)a3 withAccountName:(id)a4 andPassword:(id)a5
{
  id v8;
  id v9;
  xpc_object_t v10;
  _xpc_connection_s *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, SUControllerMessageTypeKey, SUControllerMessageTypeUseCredentialsToPersonalize);
  if (v12)
    SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseCredentialsToPersonalize, v10, SUControllerMessageDescriptorKey, v12);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseCredentialsToPersonalize, v10, SUControllerMessageAccountNameKey, v8);
  SUControllerIPCEncodeObject((uint64_t)SUControllerMessageTypeUseCredentialsToPersonalize, v10, SUControllerMessagePasswordKey, v9);

  -[SUControllerManager _serverConnection](self, "_serverConnection");
  v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v11, v10);

}

- (OS_xpc_object)serverXPCConnection
{
  return self->_serverXPCConnection;
}

- (void)setServerXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverXPCConnection, a3);
}

- (OS_dispatch_queue)serverQueue
{
  return self->_serverQueue;
}

- (void)setServerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serverQueue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (int)notifyStateReportToken
{
  return self->_notifyStateReportToken;
}

- (void)setNotifyStateReportToken:(int)a3
{
  self->_notifyStateReportToken = a3;
}

- (int)notifyDaemonStartedToken
{
  return self->_notifyDaemonStartedToken;
}

- (void)setNotifyDaemonStartedToken:(int)a3
{
  self->_notifyDaemonStartedToken = a3;
}

- (BOOL)exclusiveControl
{
  return self->_exclusiveControl;
}

- (void)setExclusiveControl:(BOOL)a3
{
  self->_exclusiveControl = a3;
}

- (BOOL)communalUponDisconnect
{
  return self->_communalUponDisconnect;
}

- (void)setCommunalUponDisconnect:(BOOL)a3
{
  self->_communalUponDisconnect = a3;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)setDisconnected:(BOOL)a3
{
  self->_disconnected = a3;
}

- (BOOL)initializing
{
  return self->_initializing;
}

- (void)setInitializing:(BOOL)a3
{
  self->_initializing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_serverQueue, 0);
  objc_storeStrong((id *)&self->_serverXPCConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
