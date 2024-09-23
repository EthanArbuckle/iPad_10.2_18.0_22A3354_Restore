@implementation PCMediaTransferObserver

- (PCMediaTransferObserver)init
{
  PCMediaTransferObserver *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  PCMediaTransferObserver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PCMediaTransferObserver;
  v2 = -[PCMediaTransferObserver init](&v7, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ucat = (LogCategory *)LogCategoryCreateEx();
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  id transferBeganHandler;
  id transferEndedHandler;
  id invalidationHandler;
  objc_super v7;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  transferBeganHandler = self->_transferBeganHandler;
  self->_transferBeganHandler = 0;

  transferEndedHandler = self->_transferEndedHandler;
  self->_transferEndedHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)PCMediaTransferObserver;
  -[PCMediaTransferObserver dealloc](&v7, sel_dealloc);
}

- (void)_xpcEnsureStarted
{
  void *v3;
  void *v4;
  id v5;
  NSXPCConnection *v6;
  uint64_t v7;
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE16B8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE1828);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", PCXPCLaunchingServiceName, 0);
    -[NSXPCConnection _setQueue:](v6, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v3);
    -[NSXPCConnection setExportedObject:](v6, "setExportedObject:", self);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__PCMediaTransferObserver__xpcEnsureStarted__block_invoke;
    v11[3] = &unk_24CCF6518;
    v11[4] = self;
    -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v11);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __44__PCMediaTransferObserver__xpcEnsureStarted__block_invoke_2;
    v10[3] = &unk_24CCF6518;
    v10[4] = self;
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v10);
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v4);
    -[NSXPCConnection resume](v6, "resume");
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v6;
    v9 = v6;

  }
}

uint64_t __44__PCMediaTransferObserver__xpcEnsureStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

void __44__PCMediaTransferObserver__xpcEnsureStarted__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_invalidateWithError:", v2);

}

- (void)_xpcEnsureStopped
{
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v4;

  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection invalidate](xpcCnx, "invalidate");
    v4 = self->_xpcCnx;
    self->_xpcCnx = 0;

  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__PCMediaTransferObserver_activateWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __50__PCMediaTransferObserver_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(id, void *);
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, void *);
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    v3 = (void (**)(id, void *))MEMORY[0x212BE7198](*(_QWORD *)(a1 + 40));
    if (v3)
    {
      v12 = v3;
      NSErrorWithOSStatusF();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, v4);

      v3 = v12;
    }

  }
  else
  {
    *(_BYTE *)(v2 + 8) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_xpcEnsureStarted");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = **(_DWORD **)(v5 + 16);
    if (v6 <= 30)
    {
      if (v6 != -1 || (v7 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 32), v7))
      {
        LogPrintF();
        v5 = *(_QWORD *)(a1 + 32);
      }
    }
    v8 = *(void **)(v5 + 24);
    v9 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __50__PCMediaTransferObserver_activateWithCompletion___block_invoke_2;
    v15[3] = &unk_24CCF6788;
    v15[4] = v5;
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v9;
    v13[1] = 3221225472;
    v13[2] = __50__PCMediaTransferObserver_activateWithCompletion___block_invoke_3;
    v13[3] = &unk_24CCF6638;
    v11 = *(_QWORD *)(a1 + 32);
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v10, "mediaTransferObserver:activateWithCompletion:", v11, v13);

  }
}

void __50__PCMediaTransferObserver_activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[2];
  v10 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      v9 = v3;
      LogPrintF();
      v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    v6 = _LogCategory_Initialize();
    v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      v3 = v10;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v9);
  v7 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 40));
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);

}

void __50__PCMediaTransferObserver_activateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PCMediaTransferObserver %p"), self);
}

- (void)_interrupted
{
  id v3;

  NSErrorWithOSStatusF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PCMediaTransferObserver _invalidateWithError:](self, "_invalidateWithError:", v3);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__PCMediaTransferObserver_invalidate__block_invoke;
  block[3] = &unk_24CCF6518;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__PCMediaTransferObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:", 0);
}

- (void)_invalidateWithError:(id)a3
{
  id v4;
  int var0;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  if (!self->_invalidated)
  {
    v8 = v4;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    self->_invalidated = 1;
    -[PCMediaTransferObserver _xpcEnsureStopped](self, "_xpcEnsureStopped");
    v6 = MEMORY[0x212BE7198](self->_invalidationHandler);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);

    v4 = v8;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCMediaTransferObserver)initWithCoder:(id)a3
{
  PCMediaTransferObserver *v3;
  PCMediaTransferObserver *v4;
  PCMediaTransferObserver *v5;

  v3 = -[PCMediaTransferObserver init](self, "init", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)transferBeganWithContext:(id)a3
{
  int var0;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v5 = MEMORY[0x212BE7198](self->_transferBeganHandler);
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

}

- (void)transferEnded
{
  int var0;
  void (**v4)(void);
  void (**v5)(void);

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v4 = (void (**)(void))MEMORY[0x212BE7198](self->_transferEndedHandler);
  if (v4)
  {
    v5 = v4;
    v4[2]();
    v4 = v5;
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)transferBeganHandler
{
  return self->_transferBeganHandler;
}

- (void)setTransferBeganHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)transferEndedHandler
{
  return self->_transferEndedHandler;
}

- (void)setTransferEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferEndedHandler, 0);
  objc_storeStrong(&self->_transferBeganHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
