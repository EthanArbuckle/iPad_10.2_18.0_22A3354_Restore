@implementation SFShareAudioSessionClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFShareAudioSessionClient)init
{
  SFShareAudioSessionClient *v2;
  SFShareAudioSessionClient *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  SFShareAudioSessionClient *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFShareAudioSessionClient;
  v2 = -[SFShareAudioSessionClient init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (SFShareAudioSessionClient)initWithCoder:(id)a3
{
  SFShareAudioSessionClient *v3;
  SFShareAudioSessionClient *v4;
  uint64_t v5;
  OS_dispatch_queue *dispatchQueue;
  SFShareAudioSessionClient *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFShareAudioSessionClient;
  v3 = -[SFShareAudioSessionClient init](&v9, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    SFMainQueue(v3);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = v4;
  }

  return v4;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFShareAudioSessionClient_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFShareAudioSessionClient_activate__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    return objc_msgSend(*(id *)(result + 32), "_activate:", 0);
  }
  return result;
}

- (void)_activate:(BOOL)a3
{
  uint64_t v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  _QWORD v8[4];
  BOOL v9;
  _QWORD v10[4];
  BOOL v11;

  if (a3)
  {
    if (gLogCategory_SFShareAudioSessionClient <= 30
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFShareAudioSessionClient <= 30
         && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[SFShareAudioSessionClient _ensureXPCStarted](self, "_ensureXPCStarted");
  v5 = MEMORY[0x1E0C809B0];
  xpcCnx = self->_xpcCnx;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__SFShareAudioSessionClient__activate___block_invoke;
  v10[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __39__SFShareAudioSessionClient__activate___block_invoke_2;
  v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
  v9 = a3;
  objc_msgSend(v7, "shareAudioSessionActivate:completion:", self, v8);

}

void __39__SFShareAudioSessionClient__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  if (*(_BYTE *)(a1 + 32))
  {
    if (gLogCategory_SFShareAudioSessionClient <= 90)
    {
      if (gLogCategory_SFShareAudioSessionClient != -1 || (v7 = v3, v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        v6 = v3;
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_SFShareAudioSessionClient <= 90)
  {
    if (gLogCategory_SFShareAudioSessionClient != -1)
      goto LABEL_7;
    v8 = v3;
    v5 = _LogCategory_Initialize();
    v3 = v8;
    if (v5)
      goto LABEL_7;
  }

}

void __39__SFShareAudioSessionClient__activate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 32))
    {
      if (gLogCategory_SFShareAudioSessionClient <= 90)
      {
        v9 = v3;
        if (gLogCategory_SFShareAudioSessionClient != -1 || (v5 = _LogCategory_Initialize(), v4 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          v4 = v9;
        }
      }
    }
    else if (gLogCategory_SFShareAudioSessionClient <= 90)
    {
      v9 = v3;
      if (gLogCategory_SFShareAudioSessionClient != -1)
        goto LABEL_15;
      v7 = _LogCategory_Initialize();
      v4 = v9;
      if (v7)
        goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 32))
  {
    if (gLogCategory_SFShareAudioSessionClient <= 30)
    {
      v9 = 0;
      if (gLogCategory_SFShareAudioSessionClient != -1)
        goto LABEL_15;
      v6 = _LogCategory_Initialize();
      v4 = 0;
      if (v6)
        goto LABEL_15;
    }
  }
  else if (gLogCategory_SFShareAudioSessionClient <= 30)
  {
    v9 = 0;
    if (gLogCategory_SFShareAudioSessionClient != -1)
      goto LABEL_15;
    v8 = _LogCategory_Initialize();
    v4 = 0;
    if (v8)
      goto LABEL_15;
  }

}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[6];

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B55E0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = (void *)objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    objc_msgSend(v17, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_shareAudioProgressEvent_info_, 1, 0);
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v17);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__SFShareAudioSessionClient__ensureXPCStarted__block_invoke;
    v19[3] = &unk_1E482DF78;
    v19[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v19);
    v18[0] = v15;
    v18[1] = 3221225472;
    v18[2] = __46__SFShareAudioSessionClient__ensureXPCStarted__block_invoke_2;
    v18[3] = &unk_1E482DF78;
    v18[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v18);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DC168);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v16);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFShareAudioSessionClient <= 30
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

uint64_t __46__SFShareAudioSessionClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __46__SFShareAudioSessionClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  void *v3;
  void *v4;

  if (gLogCategory_SFShareAudioSessionClient <= 50
    && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = _Block_copy(self->_progressHandler);
  v4 = v3;
  if (v3)
    (*((void (**)(void *, uint64_t, _QWORD))v3 + 2))(v3, 30, 0);

  if (self->_activateCalled)
    -[SFShareAudioSessionClient _activate:](self, "_activate:", 1);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFShareAudioSessionClient_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFShareAudioSessionClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_SFShareAudioSessionClient <= 30
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 16), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void *v3;
  void *v4;
  id progressHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFShareAudioSessionClient <= 50
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v3 = _Block_copy(self->_progressHandler);
      v4 = v3;
      if (v3)
        (*((void (**)(void *, uint64_t, _QWORD))v3 + 2))(v3, 20, 0);

      progressHandler = self->_progressHandler;
      self->_progressHandler = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_SFShareAudioSessionClient <= 10
        && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)userConfirmed
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SFShareAudioSessionClient_userConfirmed__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __42__SFShareAudioSessionClient_userConfirmed__block_invoke(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (gLogCategory_SFShareAudioSessionClient <= 30
      && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "shareAudioUserConfirmed");

  }
  else if (gLogCategory_SFShareAudioSessionClient <= 90
         && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)shareAudioProgressEvent:(int)a3 info:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFShareAudioSessionClient <= 30
    && (gLogCategory_SFShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = _Block_copy(self->_progressHandler);
  v7 = v6;
  if (v6)
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, v4, v8);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
