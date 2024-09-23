@implementation SFProxCardSessionServer

- (SFProxCardSessionServer)init
{
  SFProxCardSessionServer *v2;
  SFProxCardSessionServer *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  SFProxCardSessionServer *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFProxCardSessionServer;
  v2 = -[SFProxCardSessionServer init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_ucat = (LogCategory *)&gLogCategory_SFProxCardSessionServer;
    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SFProxCardSessionServer;
  -[SFProxCardSessionServer dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SFProxCardSessionServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __50__SFProxCardSessionServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[2];
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  return objc_msgSend(v2, "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  NSXPCListenerEndpoint *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSXPCConnection *v9;
  NSXPCConnection *xpcCnx;
  void *v11;
  void *v12;
  int var0;
  void *v14;
  NSXPCConnection *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[6];
  _QWORD aBlock[5];
  _QWORD v22[5];
  id v23;

  v4 = a3;
  v5 = self->_xpcEndpoint;
  if (v5)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__12;
    v22[4] = __Block_byref_object_dispose__12;
    v23 = 0;
    v6 = _Block_copy(v4);
    v7 = MEMORY[0x1E0C809B0];
    v23 = v6;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke;
    aBlock[3] = &unk_1E482F300;
    aBlock[4] = v22;
    v8 = _Block_copy(aBlock);
    v9 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v5);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v9;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBC28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v11);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B9FF0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v12);

    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_2;
    v20[3] = &unk_1E482E0F0;
    v20[4] = self;
    v20[5] = v8;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v20);
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_3;
    v19[3] = &unk_1E482E0F0;
    v19[4] = self;
    v19[5] = v8;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v19);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v15 = self->_xpcCnx;
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_4;
    v18[3] = &unk_1E482FB00;
    v18[4] = self;
    v18[5] = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v15, "remoteObjectProxyWithErrorHandler:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_5;
    v17[3] = &unk_1E482FB00;
    v17[4] = self;
    v17[5] = v8;
    objc_msgSend(v16, "xpcCheckinWithCompletion:", v17);

    _Block_object_dispose(v22, 8);
  }
  else
  {
    SFErrorF();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v14);
    -[SFProxCardSessionServer _reportError:](self, "_reportError:", v14);

  }
}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  _BYTE *v2;
  id v3;

  SFErrorF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[9] && !v2[8])
    objc_msgSend(v2, "_reportError:", v3);

}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  SFErrorF();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 9) && !*(_BYTE *)(v2 + 8))
  {
    objc_msgSend((id)v2, "_reportError:", v4);
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_4(uint64_t a1)
{
  id v2;

  SFNestedErrorF();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v2);

}

void __51__SFProxCardSessionServer__activateWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    SFNestedErrorF();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3);

  }
  else
  {
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFProxCardSessionServer_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFProxCardSessionServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 16);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 32), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 32);
      }
    }
    *(_BYTE *)(v1 + 9) = 1;
    return objc_msgSend(*(id *)(v2 + 32), "_invalidate");
  }
  return result;
}

- (void)_invalidate
{
  SFProxCardXPCServerInterface *delegate;

  delegate = self->_delegate;
  self->_delegate = 0;

  -[NSXPCConnection invalidate](self->_xpcCnx, "invalidate");
  -[SFProxCardSessionServer _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void *v3;
  void *v4;
  id errorHandler;
  id invalidationHandler;
  int var0;

  if (!self->_invalidateDone && self->_invalidateCalled && !self->_xpcCnx)
  {
    v3 = _Block_copy(self->_invalidationHandler);
    v4 = v3;
    if (v3)
      (*((void (**)(void *))v3 + 2))(v3);

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_reportError:(id)a3
{
  int var0;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  var0 = self->_ucat->var0;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v5 = _Block_copy(self->_errorHandler);
  v6 = v5;
  if (v5)
    (*((void (**)(void *, id))v5 + 2))(v5, v7);

}

- (void)performAction:(int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  NSXPCConnection *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int var0;
  const char *v12;
  void *v13;
  int v14;
  void *v15;
  const char *v16;
  _QWORD v17[6];
  int v18;
  _QWORD v19[6];
  int v20;
  _QWORD aBlock[5];
  _QWORD v22[5];
  id v23;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = self->_xpcCnx;
  if (v7)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__12;
    v22[4] = __Block_byref_object_dispose__12;
    v23 = 0;
    v8 = _Block_copy(v6);
    v9 = MEMORY[0x1E0C809B0];
    v23 = v8;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__SFProxCardSessionServer_performAction_completion___block_invoke;
    aBlock[3] = &unk_1E482F300;
    aBlock[4] = v22;
    v10 = _Block_copy(aBlock);
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      if (v4 > 3)
        v12 = "?";
      else
        v12 = off_1E4832FA0[(int)v4];
      v16 = v12;
      LogPrintF();
    }
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __52__SFProxCardSessionServer_performAction_completion___block_invoke_2;
    v19[3] = &unk_1E4832F80;
    v20 = v4;
    v19[4] = self;
    v19[5] = v10;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", v19, v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __52__SFProxCardSessionServer_performAction_completion___block_invoke_3;
    v17[3] = &unk_1E4832F80;
    v18 = v4;
    v17[4] = self;
    v17[5] = v10;
    objc_msgSend(v15, "xpcPerformAction:completion:", v4, v17);

    _Block_object_dispose(v22, 8);
  }
  else
  {
    SFErrorF();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_ucat->var0;
    if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    (*((void (**)(id, void *))v6 + 2))(v6, v13);

  }
}

void __52__SFProxCardSessionServer_performAction_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

void __52__SFProxCardSessionServer_performAction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = v3;
  if (v4 <= 90)
  {
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = v6, v5))
    {
      LogPrintF();
      v3 = v6;
    }
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);

}

void __52__SFProxCardSessionServer_performAction_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = **(_DWORD **)(v4 + 16);
  v7 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), v6))
    {
      LogPrintF();
      v3 = v7;
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v3 = v7;
    }
  }
  *(_BYTE *)(v4 + 8) = 1;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3);

}

- (SFProxCardXPCServerInterface)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)label
{
  return self->_label;
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
