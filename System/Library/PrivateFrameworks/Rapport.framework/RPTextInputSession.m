@implementation RPTextInputSession

- (RPTextInputSession)init
{
  RPTextInputSession *v2;
  RPTextInputSession *v3;
  RPTextInputSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPTextInputSession;
  v2 = -[RPTextInputSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[RPMessageable dispatchQueue](self->_messenger, "dispatchQueue");
  v5 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  dispatchQueue = v5;
  if (!v5)
    dispatchQueue = self->_dispatchQueue;
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__RPTextInputSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __45__RPTextInputSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  RPMessageable *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  RPMessageable *messenger;
  RPMessageable *v10;
  RPMessageable *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_messenger;
  if (v5)
  {
    if (gLogCategory_RPTextInputSession <= 30
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v17 = CFSTR("statusFlags");
    v18[0] = &unk_1E5F6A5B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    messenger = self->_messenger;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke;
    v16[3] = &unk_1E5F50968;
    v16[4] = self;
    -[RPMessageable registerEventID:options:handler:](messenger, "registerEventID:options:handler:", CFSTR("_tiStarted"), v7, v16);
    v10 = self->_messenger;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_2;
    v15[3] = &unk_1E5F50968;
    v15[4] = self;
    -[RPMessageable registerEventID:options:handler:](v10, "registerEventID:options:handler:", CFSTR("_tiStopped"), v7, v15);
    v11 = self->_messenger;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_3;
    v14[3] = &unk_1E5F50968;
    v14[4] = self;
    -[RPMessageable registerEventID:options:handler:](v11, "registerEventID:options:handler:", CFSTR("_tiC"), v7, v14);
    self->_started = 1;
    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __46__RPTextInputSession__activateWithCompletion___block_invoke_4;
    v12[3] = &unk_1E5F50620;
    v12[4] = self;
    v13 = v4;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](v5, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_tiStart"), MEMORY[0x1E0C9AA70], CFSTR("rapport:rdid:DirectPeer"), 0, v12);

  }
  else
  {
    RPErrorF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
      (*((void (**)(id, void *))v4 + 2))(v4, v6);

  }
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTextInputStarted:", a2);
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTextInputStopped:", a2);
}

uint64_t __46__RPTextInputSession__activateWithCompletion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTextInputChange:started:", a2, 0);
}

void __46__RPTextInputSession__activateWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
LABEL_13:
      (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    if (gLogCategory_RPTextInputSession <= 30
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_handleTextInputChange:started:", v10, 1);
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      goto LABEL_13;
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__RPTextInputSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPTextInputSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  RPMessageable *messenger;
  RTIInputSystemSourceSession *rtiSession;
  id rtiUpdatedHandler;

  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", CFSTR("_tiStarted"));
  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", CFSTR("_tiStopped"));
  -[RPMessageable deregisterEventID:](self->_messenger, "deregisterEventID:", CFSTR("_tiC"));
  if (self->_started)
  {
    self->_started = 0;
    -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](self->_messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_tiStop"), MEMORY[0x1E0C9AA70], CFSTR("rapport:rdid:DirectPeer"), 0, &__block_literal_global_17);
  }
  messenger = self->_messenger;
  self->_messenger = 0;

  -[RTIInputSystemSourceSession setPayloadDelegate:](self->_rtiSession, "setPayloadDelegate:", 0);
  rtiSession = self->_rtiSession;
  self->_rtiSession = 0;

  rtiUpdatedHandler = self->_rtiUpdatedHandler;
  self->_rtiUpdatedHandler = 0;

}

void __33__RPTextInputSession__invalidate__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (gLogCategory_RPTextInputSession <= 90
      && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPTextInputSession <= 30
         && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

}

- (void)_handleTextInputStarted:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    v5 = objc_msgSend(v4, "length");
    LogPrintF();
  }
  -[RPTextInputSession _handleTextInputChange:started:](self, "_handleTextInputChange:started:", v6, 1, v5);

}

- (void)_handleTextInputStopped:(id)a3
{
  void *v4;
  RTIInputSystemSourceSession *rtiSession;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (gLogCategory_RPTextInputSession <= 30
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_rtiSession)
  {
    objc_msgSend((Class)getRTIDataPayloadClass[0](), "payloadWithData:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIInputSystemSourceSession handleTextActionPayload:](self->_rtiSession, "handleTextActionPayload:", v4);
    -[RTIInputSystemSourceSession setPayloadDelegate:](self->_rtiSession, "setPayloadDelegate:", 0);
    rtiSession = self->_rtiSession;
    self->_rtiSession = 0;

    v6 = MEMORY[0x1AF45BE48](self->_rtiUpdatedHandler);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t))(v6 + 16))(v6);

  }
}

- (void)_handleTextInputChange:(id)a3 started:(BOOL)a4
{
  void *v6;
  unsigned int Int64Ranged;
  void *v8;
  RTIInputSystemSourceSession *rtiSession;
  RTIInputSystemSourceSession *v10;
  RTIInputSystemSourceSession *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    objc_msgSend((Class)getRTIDataPayloadClass[0](), "payloadWithData:version:", v6, Int64Ranged);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (!a4
        && gLogCategory_RPTextInputSession <= 20
        && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
      {
        v14 = objc_msgSend(v6, "length");
        LogPrintF();
      }
      rtiSession = self->_rtiSession;
      if (!rtiSession)
      {
        v10 = (RTIInputSystemSourceSession *)objc_alloc_init((Class)getRTIInputSystemSourceSessionClass[0]());
        v11 = self->_rtiSession;
        self->_rtiSession = v10;

        -[RTIInputSystemSourceSession setPayloadDelegate:](self->_rtiSession, "setPayloadDelegate:", self);
        v12 = MEMORY[0x1AF45BE48](self->_rtiUpdatedHandler);
        v13 = (void *)v12;
        if (v12)
          (*(void (**)(uint64_t))(v12 + 16))(v12);

        rtiSession = self->_rtiSession;
      }
      -[RTIInputSystemSourceSession handleTextActionPayload:](rtiSession, "handleTextActionPayload:", v8, v14);
    }
    else if (gLogCategory_RPTextInputSession <= 60
           && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)handleTextActionPayload:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RPTextInputSession *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__RPTextInputSession_handleTextActionPayload___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __46__RPTextInputSession_handleTextActionPayload___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "version"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("_tiV"));

  }
  if (v2)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v2, CFSTR("_tiD"));
  if (gLogCategory_RPTextInputSession <= 10
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    v5 = objc_msgSend(v2, "length");
    LogPrintF();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "sendEventID:event:destinationID:options:completion:", CFSTR("_tiC"), v6, CFSTR("rapport:rdid:DirectPeer"), 0, &__block_literal_global_42, v5);

}

void __46__RPTextInputSession_handleTextActionPayload___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;

  v2 = a2;
  v3 = v2;
  if (v2
    && gLogCategory_RPTextInputSession <= 90
    && ((v5 = v2, gLogCategory_RPTextInputSession != -1) || (v4 = _LogCategory_Initialize(), v3 = v5, v4)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)performDocumentRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (gLogCategory_RPTextInputSession <= 90
    && (gLogCategory_RPTextInputSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (RTIInputSystemSourceSession)rtiSession
{
  return self->_rtiSession;
}

- (id)rtiUpdatedHandler
{
  return self->_rtiUpdatedHandler;
}

- (void)setRtiUpdatedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rtiUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_rtiSession, 0);
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
