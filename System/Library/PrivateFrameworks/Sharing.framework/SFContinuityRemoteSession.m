@implementation SFContinuityRemoteSession

- (SFContinuityRemoteSession)init
{
  SFContinuityRemoteSession *v2;
  SFContinuityRemoteSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFContinuityRemoteSession;
  v2 = -[SFContinuityRemoteSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)dealloc
{
  SFContinuityRemoteSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFContinuityRemoteSession *)FatalErrorF();
    -[SFContinuityRemoteSession _cleanup](v3, v4);
  }
  else
  {
    -[SFContinuityRemoteSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFContinuityRemoteSession;
    -[SFContinuityRemoteSession dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  id activateHandler;
  id interruptionHandler;
  id invalidationHandler;

  activateHandler = self->_activateHandler;
  self->_activateHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

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
  v7[2] = __52__SFContinuityRemoteSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __52__SFContinuityRemoteSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  if (gLogCategory_SFContinuityRemoteSession <= 30
    && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFContinuityRemoteSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFContinuityRemoteSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24)
    && gLogCategory_SFContinuityRemoteSession <= 30
    && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  *(_QWORD *)(v2 + 48) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[2];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2F90];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = CFSTR("?");
    if (v8)
      v10 = (const __CFString *)v8;
    v16[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, -6723, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v12);

    v4 = *(_QWORD **)(a1 + 32);
  }
  v13 = v4[10];
  if (v13)
  {
    (*(void (**)(_QWORD))(v13 + 16))(v4[10]);
    v4 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v4, "_cleanup");
}

- (void)_run
{
  SFSession *sfSession;
  uint64_t v4;
  _QWORD v5[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_started)
  {
    if (gLogCategory_SFContinuityRemoteSession <= 30
      && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_started = 1;
  }
  sfSession = self->_sfSession;
  if (!sfSession)
  {
    -[SFContinuityRemoteSession _sfSessionStart](self, "_sfSessionStart");
    return;
  }
  if (!self->_sfSessionActivated)
  {
    if (gLogCategory_SFContinuityRemoteSession <= 30
      && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_21;
    }
    return;
  }
  if (!self->_pairVerifyRunning)
  {
    if (!self->_pairVerifyDone)
    {
      v4 = MEMORY[0x1E0C809B0];
      self->_pairVerifyRunning = 1;
      v5[0] = v4;
      v5[1] = 3221225472;
      v5[2] = __33__SFContinuityRemoteSession__run__block_invoke;
      v5[3] = &unk_1E482DFF0;
      v5[4] = self;
      -[SFSession pairVerifyWithFlags:completion:](sfSession, "pairVerifyWithFlags:completion:", 8, v5);
      return;
    }
LABEL_16:
    -[SFContinuityRemoteSession _sendQueuedMesssages](self, "_sendQueuedMesssages");
    return;
  }
  if (self->_pairVerifyDone)
    goto LABEL_16;
  if (gLogCategory_SFContinuityRemoteSession <= 30
    && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
  {
LABEL_21:
    LogPrintF();
  }
}

void __33__SFContinuityRemoteSession__run__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 41) = 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  v7 = v3;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    v3 = v7;
  }
  if (!v3)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_run");
    v3 = v7;
  }

}

- (void)_sfSessionStart
{
  SFSession *v3;
  SFSession *sfSession;
  SFSession *v5;
  _QWORD v6[5];

  if (gLogCategory_SFContinuityRemoteSession <= 30
    && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFSession invalidate](self->_sfSession, "invalidate");
  v3 = objc_alloc_init(SFSession);
  sfSession = self->_sfSession;
  self->_sfSession = v3;

  -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
  -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
  -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.ContinuityRemote"));
  -[SFSession setReceivedObjectHandler:](self->_sfSession, "setReceivedObjectHandler:", &__block_literal_global_38);
  v5 = self->_sfSession;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__SFContinuityRemoteSession__sfSessionStart__block_invoke_2;
  v6[3] = &unk_1E482DFF0;
  v6[4] = self;
  -[SFSession activateWithCompletion:](v5, "activateWithCompletion:", v6);
}

void __44__SFContinuityRemoteSession__sfSessionStart__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_SFContinuityRemoteSession <= 30)
  {
    v6 = v3;
    if (gLogCategory_SFContinuityRemoteSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      objc_msgSend(v4, "count");
      LogPrintF();
      v4 = v6;
    }
  }

}

void __44__SFContinuityRemoteSession__sfSessionStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v6 = 0;
    if (gLogCategory_SFContinuityRemoteSession <= 30
      && (gLogCategory_SFContinuityRemoteSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_run");
    goto LABEL_12;
  }
  if (gLogCategory_SFContinuityRemoteSession <= 90)
  {
    v6 = v3;
    if (gLogCategory_SFContinuityRemoteSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
LABEL_12:
      v4 = v6;
    }
  }

}

- (void)sendCommand:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__SFContinuityRemoteSession_sendCommand___block_invoke;
  v4[3] = &unk_1E4830D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __41__SFContinuityRemoteSession_sendCommand___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCommand:options:", *(unsigned int *)(a1 + 40), 0);
}

- (void)sendCommand:(int)a3 options:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFContinuityRemoteSession_sendCommand_options___block_invoke;
  block[3] = &unk_1E4832158;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __49__SFContinuityRemoteSession_sendCommand_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendCommand:options:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_sendCommand:(int)a3 options:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSMutableArray *messageQueue;
  NSMutableArray *v9;
  NSMutableArray *v10;
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = (id)objc_msgSend(a4, "mutableCopy");
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, CFSTR("c"));

  messageQueue = self->_messageQueue;
  if (!messageQueue)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = self->_messageQueue;
    self->_messageQueue = v9;

    messageQueue = self->_messageQueue;
  }
  -[NSMutableArray addObject:](messageQueue, "addObject:", v11);
  -[SFContinuityRemoteSession _sendQueuedMesssages](self, "_sendQueuedMesssages");

}

- (void)_sendQueuedMesssages
{
  uint64_t v3;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_sfSessionActivated)
  {
    -[NSMutableArray firstObject](self->_messageQueue, "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      do
      {
        -[NSMutableArray removeObjectAtIndex:](self->_messageQueue, "removeObjectAtIndex:", 0);
        -[SFSession sendWithFlags:object:](self->_sfSession, "sendWithFlags:object:", 1, v4);

        -[NSMutableArray firstObject](self->_messageQueue, "firstObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while (v4);
    }
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

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_messageQueue, 0);
  objc_storeStrong(&self->_activateHandler, 0);
}

@end
