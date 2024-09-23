@implementation SPContextMonitor

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPContextMonitor)initWithCoder:(id)a3
{
  id v4;
  SPContextMonitor *v5;
  SPContextMonitor *v6;

  v4 = a3;
  v5 = -[SPContextMonitor init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_contextChangeFlags = 0;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t contextChangeFlags;

  contextChangeFlags = self->_contextChangeFlags;
  if ((_DWORD)contextChangeFlags)
    objc_msgSend(a3, "encodeInt64:forKey:", contextChangeFlags, CFSTR("cmcf"));
}

- (SPContextMonitor)init
{
  SPContextMonitor *v2;
  unsigned int v3;
  unsigned int v4;
  SPContextMonitor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPContextMonitor;
  v2 = -[SPContextMonitor init](&v7, sel_init);
  if (v2)
  {
    if (SPXPCGetNextClientID_sOnce != -1)
      dispatch_once(&SPXPCGetNextClientID_sOnce, &__block_literal_global);
    do
    {
      v3 = __ldaxr((unsigned int *)&SPXPCGetNextClientID_sNext);
      v4 = v3 + 1;
    }
    while (__stlxr(v4, (unsigned int *)&SPXPCGetNextClientID_sNext));
    v2->_clientID = v4;
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v5 = v2;
  }

  return v2;
}

- (void)setContextChangeFlags:(unsigned int)a3
{
  SPContextMonitor *v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  unsigned int v7;

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __42__SPContextMonitor_setContextChangeFlags___block_invoke;
    v6[3] = &unk_2516DEBF8;
    v6[4] = v4;
    v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_contextChangeFlags = a3;
  }
  objc_sync_exit(v4);

}

void __42__SPContextMonitor_setContextChangeFlags___block_invoke(uint64_t a1)
{
  id v2;

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contextMonitorUpdate:", *(_QWORD *)(a1 + 32));

}

- (id)description
{
  NSAppendPrintF();
  return 0;
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
  v7[2] = __43__SPContextMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_2516DEC20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __43__SPContextMonitor_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    NSErrorF();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SPContextMonitor <= 90
      && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

  }
  else
  {
    *(_BYTE *)(v2 + 8) = 1;
    v3 = MEMORY[0x249543D68](*(_QWORD *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_msgSend(*(id *)(a1 + 32), "_activate:", 0);
  }
}

- (void)_activate:(BOOL)a3
{
  void (**v5)(_QWORD, _QWORD);
  id activateCompletion;
  NSXPCConnection *xpcCnx;
  uint64_t v8;
  void *v9;
  uint64_t clientID;
  id v11;
  _QWORD v12[5];
  BOOL v13;
  _QWORD v14[5];
  BOOL v15;

  if (!self->_invalidateCalled)
  {
    if (a3)
    {
      if (gLogCategory_SPContextMonitor > 30
        || gLogCategory_SPContextMonitor == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_19;
      }
    }
    else if (gLogCategory_SPContextMonitor > 30
           || gLogCategory_SPContextMonitor == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_19;
    }
    clientID = self->_clientID;
    LogPrintF();
LABEL_19:
    -[SPContextMonitor _ensureXPCStarted](self, "_ensureXPCStarted", clientID);
    xpcCnx = self->_xpcCnx;
    v8 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __30__SPContextMonitor__activate___block_invoke;
    v14[3] = &unk_2516DEC48;
    v15 = a3;
    v14[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __30__SPContextMonitor__activate___block_invoke_2;
    v12[3] = &unk_2516DEC48;
    v12[4] = self;
    v13 = a3;
    objc_msgSend(v9, "contextMonitorActivate:completion:", self, v12);

    return;
  }
  NSErrorF();
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SPContextMonitor <= 90
    && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x249543D68](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v5)
    ((void (**)(_QWORD, id))v5)[2](v5, v11);

}

void __30__SPContextMonitor__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_SPContextMonitor <= 30)
    {
      if (gLogCategory_SPContextMonitor != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
        v6 = v3;
LABEL_8:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_SPContextMonitor <= 90)
  {
    if (gLogCategory_SPContextMonitor != -1 || (v5 = _LogCategory_Initialize(), v3 = v7, v5))
    {
      v6 = v3;
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v6);

}

void __30__SPContextMonitor__activate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  void (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (v3)
  {
    v4 = v3;
    if (gLogCategory_SPContextMonitor <= 90)
    {
      if (gLogCategory_SPContextMonitor != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
      {
        v9 = v4;
        LogPrintF();
        v4 = v10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v9);
    goto LABEL_20;
  }
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_SPContextMonitor > 30
      || gLogCategory_SPContextMonitor == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
  }
  else if (gLogCategory_SPContextMonitor > 30
         || gLogCategory_SPContextMonitor == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_17;
  }
  LogPrintF();
LABEL_17:
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x249543D68](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = 0;

  if (v6)
    v6[2](v6, 0);

LABEL_20:
}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.SensingPredictXPCService"));
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257515D00);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __37__SPContextMonitor__ensureXPCStarted__block_invoke;
    v9[3] = &unk_2516DEC70;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __37__SPContextMonitor__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_2516DEC70;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257515D60);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
}

uint64_t __37__SPContextMonitor__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __37__SPContextMonitor__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void *v3;
  id activateCompletion;
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SPContextMonitor <= 50
    && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSErrorF();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPContextMonitor _reportError:](self, "_reportError:", v3);

  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__SPContextMonitor_invalidate__block_invoke;
  block[3] = &unk_2516DEC70;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __30__SPContextMonitor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25)
      && gLogCategory_SPContextMonitor <= 30
      && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    if (v4)
    {
      objc_msgSend(v4, "invalidate");
      v3 = *(_QWORD *)(a1 + 32);
    }
    v8 = (void (**)(id, void *))MEMORY[0x249543D68](*(_QWORD *)(v3 + 16));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    if (v8)
    {
      NSErrorF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v7);

    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidated");

  }
}

- (void)contextMonitorContextChanged:(id)a3
{
  void (**contextChangeHandler)(id, id);
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  contextChangeHandler = (void (**)(id, id))self->_contextChangeHandler;
  if (contextChangeHandler)
  {
    contextChangeHandler[2](contextChangeHandler, v5);
  }
  else if (gLogCategory_SPContextMonitor <= 30
         && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)contextSignalUpdated:(id)a3 fusedState:(unsigned int)a4
{
  uint64_t v4;
  void (**contextSignalUpdatedHandler)(id, _QWORD, id);
  id v7;

  v4 = *(_QWORD *)&a4;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  contextSignalUpdatedHandler = (void (**)(id, _QWORD, id))self->_contextSignalUpdatedHandler;
  if (contextSignalUpdatedHandler)
  {
    contextSignalUpdatedHandler[2](contextSignalUpdatedHandler, v4, v7);
  }
  else if (gLogCategory_SPContextMonitor <= 30
         && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_invalidated
{
  id activateCompletion;
  void *v4;
  void (**v5)(_QWORD);
  id invalidationHandler;
  NSXPCConnection *xpcCnx;
  void (**v8)(id, void *);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SPContextMonitor <= 50
      && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v8 = (void (**)(id, void *))MEMORY[0x249543D68](self->_activateCompletion, a2);
      activateCompletion = self->_activateCompletion;
      self->_activateCompletion = 0;

      if (v8)
      {
        NSErrorF();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v4);

      }
      v5 = (void (**)(_QWORD))MEMORY[0x249543D68](self->_invalidationHandler);
      invalidationHandler = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      if (v5)
        v5[2](v5);
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_SPContextMonitor <= 10
        && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
  }
}

- (BOOL)isSystemContext
{
  if (isSystemContext_once != -1)
    dispatch_once(&isSystemContext_once, &__block_literal_global_36);
  return isSystemContext_result;
}

void __35__SPContextMonitor_isSystemContext__block_invoke()
{
  vproc_swap_string();
  isSystemContext_result = 0;
}

- (void)_reportError:(id)a3
{
  void (**v4)(_QWORD, _QWORD);
  id activateCompletion;
  id v6;

  v6 = a3;
  if (gLogCategory_SPContextMonitor <= 90
    && (gLogCategory_SPContextMonitor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x249543D68](self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v4)
    ((void (**)(_QWORD, id))v4)[2](v4, v6);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)contextChangeHandler
{
  return self->_contextChangeHandler;
}

- (void)setContextChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)contextSignalUpdatedHandler
{
  return self->_contextSignalUpdatedHandler;
}

- (void)setContextSignalUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unsigned)contextChangeFlags
{
  return self->_contextChangeFlags;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contextSignalUpdatedHandler, 0);
  objc_storeStrong(&self->_contextChangeHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
