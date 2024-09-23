@implementation RPLegacySession

- (RPLegacySession)init
{
  RPLegacySession *v2;
  RPLegacySession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPLegacySession;
  v2 = -[RPLegacySession init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[RPLegacySession _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)RPLegacySession;
  -[RPLegacySession dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  id errorHandler;
  id interruptionHandler;
  id invalidationHandler;
  id promptForPINHandler;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

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
  v7[2] = __42__RPLegacySession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __42__RPLegacySession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  NSString *serviceType;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  int v11;
  void (**errorHandler)(id, void *);
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a3;
  if (gLogCategory_RPLegacySupport <= 30
    && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_invalidateCalled && !self->_activateCalled)
  {
    serviceType = self->_serviceType;
    if (serviceType)
    {
      self->_activateCalled = 1;
      if (-[NSString isEqual:](serviceType, "isEqual:", CFSTR("RPLegacyServiceTypeMobileDevice")))
      {
        -[RPDevice mobileDevice](self->_peerDevice, "mobileDevice");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        if (!v5)
        {
          -[RPDevice pairedPeer](self->_peerDevice, "pairedPeer");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "info");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("udid"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
            goto LABEL_11;
          v5 = objc_alloc_init(MEMORY[0x1E0D1B3A8]);
          objc_msgSend(v5, "setUdid:", v10);
          -[RPDevice setMobileDevice:](self->_peerDevice, "setMobileDevice:", v5);

          if (!v5)
            goto LABEL_12;
        }
        self->_mdEnabled = 1;
        v6 = v5;
LABEL_11:

LABEL_12:
        -[RPLegacySession _run](self, "_run");
        v7 = 0;
LABEL_23:
        v8 = v13;
        goto LABEL_24;
      }
    }
  }
  RPErrorF();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (v7)
  {
    if (gLogCategory_RPLegacySupport <= 60)
    {
      if (gLogCategory_RPLegacySupport != -1 || (v11 = _LogCategory_Initialize(), v8 = v13, v11))
      {
        LogPrintF();
        v8 = v13;
      }
    }
    errorHandler = (void (**)(id, void *))self->_errorHandler;
    if (errorHandler)
    {
      errorHandler[2](errorHandler, v7);
      goto LABEL_23;
    }
  }
LABEL_24:
  if (v8)
    v13[2](v13, v7);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__RPLegacySession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__RPLegacySession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  self->_invalidateCalled = 1;
  -[CUMobileDeviceSession invalidate](self->_mdSession, "invalidate");
  -[RPLegacySession _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPLegacySupport <= 60
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_mdSession)
    {
      invalidationHandler = (void (**)(void))self->_invalidationHandler;
      if (invalidationHandler)
        invalidationHandler[2]();
      -[RPLegacySession _cleanup](self, "_cleanup");
      self->_invalidateDone = 1;
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_run
{
  int v3;
  int v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    if (!self->_mdEnabled
      || (v3 = -[RPLegacySession _runMobileDeviceStart](self, "_runMobileDeviceStart"), v3 == 4)
      || v3 == 2)
    {
      if ((self->_securityFlags & 2) != 0
        || (v4 = -[RPLegacySession _runPairVerify](self, "_runPairVerify"), v4 == 4)
        || v4 == 2)
      {
        if (gLogCategory_RPLegacySupport <= 30
          && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_messagingReady = 1;
        -[RPLegacySession _sendQueuedMessages](self, "_sendQueuedMessages");
      }
    }
  }
}

- (int)_runMobileDeviceStart
{
  int mdState;
  CUMobileDeviceSession *v5;
  CUMobileDeviceSession *mdSession;
  void *v7;
  _QWORD v9[5];

  mdState = self->_mdState;
  if (mdState != 4 && mdState != 2)
  {
    if (mdState)
    {
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_mdState = 1;
      v5 = (CUMobileDeviceSession *)objc_alloc_init(MEMORY[0x1E0D1B3B8]);
      mdSession = self->_mdSession;
      self->_mdSession = v5;

      -[CUMobileDeviceSession setDispatchQueue:](self->_mdSession, "setDispatchQueue:", self->_dispatchQueue);
      -[RPDevice mobileDevice](self->_peerDevice, "mobileDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUMobileDeviceSession setPeerDevice:](self->_mdSession, "setPeerDevice:", v7);

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __40__RPLegacySession__runMobileDeviceStart__block_invoke;
      v9[3] = &unk_1E5F4EC60;
      v9[4] = self;
      -[CUMobileDeviceSession setInvalidationHandler:](self->_mdSession, "setInvalidationHandler:", v9);
      -[CUMobileDeviceSession setPromptForPINHandler:](self->_mdSession, "setPromptForPINHandler:", self->_promptForPINHandler);
      -[CUMobileDeviceSession activate](self->_mdSession, "activate");
      self->_mdState = 4;
    }
  }
  return self->_mdState;
}

_BYTE *__40__RPLegacySession__runMobileDeviceStart__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _BYTE *result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_BYTE **)(a1 + 32);
  if (result[9])
    return (_BYTE *)objc_msgSend(result, "_invalidated");
  return result;
}

- (int)_runPairVerify
{
  int pairVerifyState;
  uint64_t v5;
  _QWORD v7[5];

  pairVerifyState = self->_pairVerifyState;
  if (pairVerifyState != 4 && pairVerifyState != 2)
  {
    if (pairVerifyState)
    {
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_RPLegacySupport <= 30
        && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v5 = MEMORY[0x1E0C809B0];
      self->_pairVerifyState = 1;
      v7[0] = v5;
      v7[1] = 3221225472;
      v7[2] = __33__RPLegacySession__runPairVerify__block_invoke;
      v7[3] = &unk_1E5F4ECD0;
      v7[4] = self;
      -[RPLegacySession pairVerifyWithFlags:completion:](self, "pairVerifyWithFlags:completion:", 8, v7);
    }
  }
  return self->_pairVerifyState;
}

void __33__RPLegacySession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (!v3)
  {
    if (gLogCategory_RPLegacySupport <= 30
      && (gLogCategory_RPLegacySupport != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = 4;
    objc_msgSend(*(id *)(a1 + 32), "_run");
    goto LABEL_13;
  }
  v4 = v3;
  if (gLogCategory_RPLegacySupport <= 30)
  {
    if (gLogCategory_RPLegacySupport != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
    {
      LogPrintF();
      v4 = v7;
    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = 3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
LABEL_13:
    v4 = v7;
  }

}

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__RPLegacySession_pairSetupWithFlags_completion___block_invoke;
  block[3] = &unk_1E5F4EE38;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __49__RPLegacySession_pairSetupWithFlags_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupWithFlags:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  CUMobileDeviceSession *mdSession;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (self->_mdEnabled && (mdSession = self->_mdSession) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__RPLegacySession__pairSetupWithFlags_completion___block_invoke;
    v10[3] = &unk_1E5F4F3E8;
    v10[4] = self;
    v11 = v6;
    -[CUMobileDeviceSession pairSetupWithFlags:completion:](mdSession, "pairSetupWithFlags:completion:", v4, v10);

  }
  else
  {
    RPErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v9);

  }
}

uint64_t __50__RPLegacySession__pairSetupWithFlags_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)pairSetupTryPIN:(id)a3
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
  v7[2] = __35__RPLegacySession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __35__RPLegacySession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)_pairSetupTryPIN:(id)a3
{
  if (self->_mdEnabled)
    -[CUMobileDeviceSession pairSetupTryPIN:](self->_mdSession, "pairSetupTryPIN:", a3);
}

- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__RPLegacySession_pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_1E5F4EE38;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __50__RPLegacySession_pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifyWithFlags:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  CUMobileDeviceSession *mdSession;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  if (self->_mdEnabled && (mdSession = self->_mdSession) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __51__RPLegacySession__pairVerifyWithFlags_completion___block_invoke;
    v10[3] = &unk_1E5F4F3E8;
    v10[4] = self;
    v11 = v6;
    -[CUMobileDeviceSession pairVerifyWithFlags:completion:](mdSession, "pairVerifyWithFlags:completion:", v4, v10);

  }
  else
  {
    RPErrorF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v9);

  }
}

uint64_t __51__RPLegacySession__pairVerifyWithFlags_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)unpairWithCompletion:(id)a3
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
  v7[2] = __40__RPLegacySession_unpairWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __40__RPLegacySession_unpairWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unpairWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_unpairWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  CUMobileDeviceSession *mdSession;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD))v4;
  if (self->_mdEnabled && (mdSession = self->_mdSession) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__RPLegacySession__unpairWithCompletion___block_invoke;
    v8[3] = &unk_1E5F4ED20;
    v9 = v4;
    -[CUMobileDeviceSession unpairWithCompletion:](mdSession, "unpairWithCompletion:", v8);

  }
  else
  {
    RPErrorF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v5)[2](v5, v7);

  }
}

uint64_t __41__RPLegacySession__unpairWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dispatchQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  RPLegacySession *v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__RPLegacySession_sendRequestID_options_request_responseHandler___block_invoke;
  block[3] = &unk_1E5F50920;
  v20 = v12;
  v21 = v11;
  v23 = self;
  v24 = v13;
  v22 = v10;
  v15 = v13;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  dispatch_async(dispatchQueue, block);

}

void __65__RPLegacySession_sendRequestID_options_request_responseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  RPLegacySessionMessage *v6;

  v6 = objc_alloc_init(RPLegacySessionMessage);
  -[RPLegacySessionMessage setMessage:](v6, "setMessage:", *(_QWORD *)(a1 + 32));
  -[RPLegacySessionMessage setOptions:](v6, "setOptions:", *(_QWORD *)(a1 + 40));
  -[RPLegacySessionMessage setRequestID:](v6, "setRequestID:", *(_QWORD *)(a1 + 48));
  -[RPLegacySessionMessage setResponseHandler:](v6, "setResponseHandler:", *(_QWORD *)(a1 + 64));
  v2 = *(void **)(*(_QWORD *)(a1 + 56) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = *(_QWORD *)(a1 + 56);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 56) + 16);
  }
  objc_msgSend(v2, "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 56), "_sendQueuedMessages");

}

- (void)_sendQueuedMessages
{
  uint64_t v3;
  void *v4;

  if (self->_messagingReady)
  {
    -[NSMutableArray firstObject](self->_messageSendQueue, "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      do
      {
        -[NSMutableArray removeObjectAtIndex:](self->_messageSendQueue, "removeObjectAtIndex:", 0);
        -[RPLegacySession _sendMessage:](self, "_sendMessage:", v4);

        -[NSMutableArray firstObject](self->_messageSendQueue, "firstObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      while (v4);
    }
  }
}

- (void)requestSystemInfoWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__RPLegacySession_requestSystemInfoWithCompletion___block_invoke;
  v6[3] = &unk_1E5F4F6F8;
  v7 = v4;
  v5 = v4;
  -[RPLegacySession sendRequestID:options:request:responseHandler:](self, "sendRequestID:options:request:responseHandler:", CFSTR("_systemInfo"), &unk_1E5F6A650, MEMORY[0x1E0C9AA70], v6);

}

uint64_t __51__RPLegacySession_requestSystemInfoWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (RPDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (unsigned)securityFlags
{
  return self->_securityFlags;
}

- (void)setSecurityFlags:(unsigned int)a3
{
  self->_securityFlags = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_mdSession, 0);
  objc_storeStrong((id *)&self->_messageSendQueue, 0);
}

@end
