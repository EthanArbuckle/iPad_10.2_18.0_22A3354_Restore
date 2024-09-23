@implementation PUConnection

- (PUConnection)initWithDelegate:(id)a3
{
  id v4;
  PUConnection *v5;
  PUConnection *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *serverConnectionQueue;
  dispatch_queue_t v9;
  OS_dispatch_queue *delegateQueue;
  PUConnectionUnlockClient *v11;
  PUConnectionUnlockClient *unlockClient;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUConnection;
  v5 = -[PUConnection init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = dispatch_queue_create(-[PUConnection queueNameWithSuffix:](v5, "queueNameWithSuffix:", CFSTR("connection")), 0);
    serverConnectionQueue = v6->_serverConnectionQueue;
    v6->_serverConnectionQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_create(-[PUConnection queueNameWithSuffix:](v6, "queueNameWithSuffix:", CFSTR("delegate")), 0);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v6->_delegate, v4);
    v11 = -[PUConnectionUnlockClient initWithConnection:]([PUConnectionUnlockClient alloc], "initWithConnection:", v6);
    unlockClient = v6->_unlockClient;
    v6->_unlockClient = v11;

  }
  return v6;
}

- (PUConnection)init
{
  return -[PUConnection initWithDelegate:](self, "initWithDelegate:", 0);
}

- (const)queueNameWithSuffix:(id)a3
{
  void *v3;
  id v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  const char *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_serverConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PUConnection;
  -[PUConnection dealloc](&v3, sel_dealloc);
}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1)
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_0);
  return (id)serverInterface___serverInterface;
}

void __31__PUConnection_serverInterface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v0 = (void *)MEMORY[0x24BDD1990];
  v1 = &unk_254F02528;
  objc_msgSend(v0, "interfaceWithProtocol:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)serverInterface___serverInterface;
  serverInterface___serverInterface = v2;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)serverInterface___serverInterface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_queryRemoteDeviceState_, 0, 1);

}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1)
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_94);
  return (id)clientInterface___clientInterface;
}

void __31__PUConnection_clientInterface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v0 = (void *)MEMORY[0x24BDD1990];
  v1 = &unk_254F01EF8;
  objc_msgSend(v0, "interfaceWithProtocol:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)clientInterface___clientInterface;
  clientInterface___clientInterface = v2;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)clientInterface___clientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_remoteDeviceDidCompleteRemoteAction_remoteDeviceState_error_, 1, 0);
  objc_msgSend((id)clientInterface___clientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_didGetRemoteDeviceState_error_, 0, 0);

}

- (id)serverConnection
{
  NSObject *serverConnectionQueue;
  _QWORD block[5];

  serverConnectionQueue = self->_serverConnectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__PUConnection_serverConnection__block_invoke;
  block[3] = &unk_24D800C58;
  block[4] = self;
  dispatch_sync(serverConnectionQueue, block);
  return self->_serverConnection;
}

void __32__PUConnection_serverConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.paired-unlock"), 4096);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 8);
    *(_QWORD *)(v3 + 8) = v2;

    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend((id)objc_opt_class(), "serverInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRemoteObjectInterface:", v6);

    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend((id)objc_opt_class(), "clientInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v8);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setExportedObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInterruptionHandler:", &__block_literal_global_113);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v10 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __32__PUConnection_serverConnection__block_invoke_3;
    v15[3] = &unk_24D800C08;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v9, "setInvalidationHandler:", v15);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "resume");
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __32__PUConnection_serverConnection__block_invoke_4;
    v13[3] = &unk_24D800C30;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "checkIn");

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __32__PUConnection_serverConnection__block_invoke_2()
{
  NSLog(CFSTR("Unlock manager connection interrupted"));
}

void __32__PUConnection_serverConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  NSLog(CFSTR("Unlock manager connection INVALIDATED"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setServerConnection:", 0);

}

void __32__PUConnection_serverConnection__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  NSLog(CFSTR("PairedUnlock connection failed to check in, error = %@!"), a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setServerConnection:", 0);

}

- (void)setServerConnection:(id)a3
{
  id v4;
  NSObject *serverConnectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  serverConnectionQueue = self->_serverConnectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__PUConnection_setServerConnection___block_invoke;
  v7[3] = &unk_24D800C80;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(serverConnectionQueue, v7);

}

void __36__PUConnection_setServerConnection___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(a1 + 40));
}

- (void)pairForUnlockWithPasscode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUConnection serverConnection](self, "serverConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pairForUnlockWithPasscode:", v4);

}

- (void)unpairForUnlock
{
  void *v2;
  id v3;

  -[PUConnection serverConnection](self, "serverConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unpairForUnlock");

}

- (void)enableOnlyRemoteUnlockWithPasscode:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUConnection serverConnection](self, "serverConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enableOnlyRemoteUnlockWithPasscode:", v4);

}

- (void)disableOnlyRemoteUnlock
{
  void *v2;
  id v3;

  -[PUConnection serverConnection](self, "serverConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableOnlyRemoteUnlock");

}

- (void)requestRemoteDeviceRemoteAction:(int64_t)a3 type:(int64_t)a4
{
  void *v6;
  id v7;

  -[PUConnection serverConnection](self, "serverConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestRemoteDeviceRemoteAction:type:", a3, a4);

}

- (void)requestRemoteDeviceUnlockNotification
{
  void *v2;
  id v3;

  -[PUConnection serverConnection](self, "serverConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestRemoteDeviceUnlockNotification");

}

- (void)requestRemoteDeviceRemoveLockout:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PUConnection_requestRemoteDeviceRemoveLockout___block_invoke;
  block[3] = &unk_24D800CA8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__PUConnection_requestRemoteDeviceRemoveLockout___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v3 = objc_loadWeakRetained(&to);
  objc_msgSend(v3, "setRemoteDeviceRemoveLockoutHandler:", v2);

  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "serverConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestRemoteDeviceRemoveLockout");

  objc_destroyWeak(&to);
}

- (void)requestDeviceSetWristDetectionDisabled:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *delegateQueue;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  BOOL v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pu_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_21773E000, v7, OS_LOG_TYPE_INFO, "connection requestDeviceSetWristDetectionDisabled: %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__PUConnection_requestDeviceSetWristDetectionDisabled_completion___block_invoke;
  block[3] = &unk_24D800CD0;
  objc_copyWeak(&v13, (id *)buf);
  v14 = v4;
  v12 = v6;
  v10 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __66__PUConnection_requestDeviceSetWristDetectionDisabled_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestDeviceSetWristDetectionDisabled:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&to);
}

- (void)getRemoteDeviceState:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37__PUConnection_getRemoteDeviceState___block_invoke;
  v6[3] = &unk_24D800CF8;
  v7 = v4;
  v5 = v4;
  -[PUConnection queryRemoteDeviceState:](self, "queryRemoteDeviceState:", v6);

}

void __37__PUConnection_getRemoteDeviceState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    v9 = a3;
    v5 = a2;
    v6 = objc_msgSend(v5, "hasPasscodeSet");
    v7 = objc_msgSend(v5, "isPasscodeLocked");
    v8 = objc_msgSend(v5, "isUnlockOnly");

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v3 + 16))(v3, v6, v7, v8, v9);
  }
}

- (void)queryRemoteDeviceState:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUConnection serverConnection](self, "serverConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryRemoteDeviceState:", v4);

}

- (id)delegateIfRespondsToSelector:(SEL)a3
{
  void *v3;

  -[PUConnection delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    v3 = 0;
  }
  return v3;
}

- (void)didPairForUnlock:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__PUConnection_didPairForUnlock_error___block_invoke;
  block[3] = &unk_24D800D20;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__PUConnection_didPairForUnlock_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 48));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "delegateIfRespondsToSelector:", sel_unlockConnection_didPairForUnlock_error_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "unlockConnection:didPairForUnlock:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&to);
}

- (void)didUnpairForUnlock:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__PUConnection_didUnpairForUnlock_error___block_invoke;
  block[3] = &unk_24D800D20;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __41__PUConnection_didUnpairForUnlock_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 48));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "delegateIfRespondsToSelector:", sel_unlockConnection_didUnpairForUnlock_error_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "unlockConnection:didUnpairForUnlock:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&to);
}

- (void)didEnableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__PUConnection_didEnableOnlyRemoteUnlock_error___block_invoke;
  block[3] = &unk_24D800D20;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __48__PUConnection_didEnableOnlyRemoteUnlock_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 48));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "delegateIfRespondsToSelector:", sel_unlockConnection_didEnableOnlyRemoteUnlock_error_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "unlockConnection:didEnableOnlyRemoteUnlock:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&to);
}

- (void)didDisableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PUConnection_didDisableOnlyRemoteUnlock_error___block_invoke;
  block[3] = &unk_24D800D20;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__PUConnection_didDisableOnlyRemoteUnlock_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 48));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "delegateIfRespondsToSelector:", sel_unlockConnection_didDisableOnlyRemoteUnlock_error_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "unlockConnection:didDisableOnlyRemoteUnlock:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&to);
}

- (void)remoteDeviceDidCompleteRemoteAction:(BOOL)a3 remoteDeviceState:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *delegateQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__PUConnection_remoteDeviceDidCompleteRemoteAction_remoteDeviceState_error___block_invoke;
  v13[3] = &unk_24D800D48;
  objc_copyWeak(&v16, &location);
  v17 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(delegateQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__PUConnection_remoteDeviceDidCompleteRemoteAction_remoteDeviceState_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 56));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "delegateIfRespondsToSelector:", sel_unlockConnection_remoteDeviceDidCompleteRemoteAction_remoteDeviceState_error_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "unlockConnection:remoteDeviceDidCompleteRemoteAction:remoteDeviceState:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_destroyWeak(&to);
}

- (void)remoteDeviceDidUnlock
{
  NSObject *delegateQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__PUConnection_remoteDeviceDidUnlock__block_invoke;
  block[3] = &unk_24D800D70;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_async(delegateQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__PUConnection_remoteDeviceDidUnlock__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "delegateIfRespondsToSelector:", sel_unlockConnectionRemoteDeviceDidUnlock_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "unlockConnectionRemoteDeviceDidUnlock:", *(_QWORD *)(a1 + 32));

  objc_destroyWeak(&to);
}

- (void)didGetRemoteDeviceState:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *delegateQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PUConnection *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__PUConnection_didGetRemoteDeviceState_error___block_invoke;
  block[3] = &unk_24D800D98;
  objc_copyWeak(&v15, &location);
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __46__PUConnection_didGetRemoteDeviceState_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 56));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "delegateIfRespondsToSelector:", sel_unlockConnection_remoteDeviceDidNotifyState_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(_QWORD *)(a1 + 32) && v3)
    objc_msgSend(v3, "unlockConnection:remoteDeviceDidNotifyState:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_destroyWeak(&to);
}

- (void)remoteDeviceDidRemoveLockout:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__PUConnection_remoteDeviceDidRemoveLockout_error___block_invoke;
  v9[3] = &unk_24D800DC0;
  objc_copyWeak(&v11, &location);
  v12 = a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(delegateQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __51__PUConnection_remoteDeviceDidRemoveLockout_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 40));
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "remoteDeviceRemoveLockoutHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_loadWeakRetained(&to);
    objc_msgSend(v4, "remoteDeviceRemoveLockoutHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

    v6 = objc_loadWeakRetained(&to);
    objc_msgSend(v6, "setRemoteDeviceRemoveLockoutHandler:", 0);

  }
  objc_destroyWeak(&to);
}

- (PUConnectionDelegate)delegate
{
  return (PUConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)remoteDeviceRemoveLockoutHandler
{
  return self->_remoteDeviceRemoveLockoutHandler;
}

- (void)setRemoteDeviceRemoveLockoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteDeviceRemoveLockoutHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unlockClient, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_serverConnectionQueue, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end
