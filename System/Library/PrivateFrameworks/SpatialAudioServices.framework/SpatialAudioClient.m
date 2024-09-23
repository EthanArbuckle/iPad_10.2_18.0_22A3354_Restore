@implementation SpatialAudioClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SpatialAudioClient)initWithCoder:(id)a3
{
  SpatialAudioClient *v3;
  SpatialAudioClient *v4;
  SpatialAudioClient *v5;

  v3 = -[SpatialAudioClient init](self, "init", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (SpatialAudioClient)init
{
  SpatialAudioClient *v2;
  SpatialAudioClient *v3;
  SpatialAudioClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SpatialAudioClient;
  v2 = -[SpatialAudioClient init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (void)fetchSpatialSoundProfileRecordWithCompletion:(id)a3
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
  v7[2] = __67__SpatialAudioClient_fetchSpatialSoundProfileRecordWithCompletion___block_invoke;
  v7[3] = &unk_2518F7858;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __67__SpatialAudioClient_fetchSpatialSoundProfileRecordWithCompletion___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy_;
  v9[4] = __Block_byref_object_dispose_;
  v10 = 0;
  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __67__SpatialAudioClient_fetchSpatialSoundProfileRecordWithCompletion___block_invoke_1;
  v6 = &unk_2518F7830;
  v8 = v9;
  v7 = *(id *)(a1 + 40);
  v2 = (void (**)(_QWORD))MEMORY[0x249583AA8](&v3);
  objc_msgSend(*(id *)(a1 + 32), "_fetchSpatialSoundProfileRecordWithCompletion:", *(_QWORD *)(a1 + 40), v3, v4, v5, v6);
  v2[2](v2);

  _Block_object_dispose(v9, 8);
}

uint64_t __67__SpatialAudioClient_fetchSpatialSoundProfileRecordWithCompletion___block_invoke_1(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
  {
    v1 = result;
    if (gLogCategory_SpatialAudioClient <= 90
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 32) + 16))();
  }
  return result;
}

- (void)_fetchSpatialSoundProfileRecordWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSXPCConnection *xpcCnx;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SpatialAudioClient <= 90
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SpatialAudioClient <= 30
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SpatialAudioClient _ensureXPCStarted](self, "_ensureXPCStarted");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      xpcCnx = self->_xpcCnx;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __68__SpatialAudioClient__fetchSpatialSoundProfileRecordWithCompletion___block_invoke;
      v9[3] = &unk_2518F7880;
      v7 = v4;
      v10 = v7;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchSpatialSoundProfileRecordForClient:WithCompletion:", self, v7);

      goto LABEL_14;
    }
  }
  if (v4)
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v5);
LABEL_14:

}

void __68__SpatialAudioClient__fetchSpatialSoundProfileRecordWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_SpatialAudioClient <= 90)
  {
    if (gLogCategory_SpatialAudioClient != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      LogPrintF();
      v3 = v6;
    }
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v5 + 16))(v5, 0, v6);
    v3 = v6;
  }

}

- (id)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.SpatialAudioXPCService"));
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2576C8BB0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__SpatialAudioClient__ensureXPCStarted__block_invoke;
    v10[3] = &unk_2518F78A8;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __39__SpatialAudioClient__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_2518F78A8;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2576C8C10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
  return 0;
}

uint64_t __39__SpatialAudioClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __39__SpatialAudioClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SpatialAudioClient <= 50
    && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
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
  block[2] = __32__SpatialAudioClient_invalidate__block_invoke;
  block[3] = &unk_2518F78A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__SpatialAudioClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id *v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    *(_BYTE *)(v1 + 8) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 9)
      && gLogCategory_SpatialAudioClient <= 30
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(id **)(v2 + 32);
    if (v3[2])
    {
      objc_msgSend(v3[2], "invalidate");
      v3 = *(id **)(v2 + 32);
    }
    return objc_msgSend(v3, "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  id invalidationHandler;
  id interruptionHandler;
  NSXPCConnection *xpcCnx;
  void (**v6)(_QWORD);

  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SpatialAudioClient <= 50
      && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v6 = (void (**)(_QWORD))MEMORY[0x249583AA8](self->_invalidationHandler, a2);
      invalidationHandler = self->_invalidationHandler;
      self->_invalidationHandler = 0;

      if (v6)
        v6[2](v6);
      interruptionHandler = self->_interruptionHandler;
      self->_interruptionHandler = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_SpatialAudioClient <= 10
        && (gLogCategory_SpatialAudioClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
  }
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
