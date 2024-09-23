@implementation RPHIDSession

- (RPHIDSession)init
{
  RPHIDSession *v2;
  RPHIDSession *v3;
  RPHIDSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPHIDSession;
  v2 = -[RPHIDSession init](&v6, sel_init);
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
  v9[2] = __39__RPHIDSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E5F4ED70;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

void __39__RPHIDSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (gLogCategory_RPHIDSession <= 30 && (gLogCategory_RPHIDSession != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }
  else
  {
    RPErrorF();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v2;
    if (gLogCategory_RPHIDSession <= 90)
    {
      if (gLogCategory_RPHIDSession != -1 || (v4 = _LogCategory_Initialize(), v2 = v6, v4))
      {
        LogPrintF();
        v2 = v6;
      }
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
      v2 = v6;
    }

  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__RPHIDSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __26__RPHIDSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (gLogCategory_RPHIDSession <= 30 && (gLogCategory_RPHIDSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

- (void)hidCommand:(int)a3 destinationID:(id)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  RPMessageable *messenger;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v6 = *(_QWORD *)&a3;
  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  messenger = self->_messenger;
  v17 = CFSTR("_hidC");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a4;
  objc_msgSend(v10, "numberWithInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__RPHIDSession_hidCommand_destinationID_completion___block_invoke;
  v15[3] = &unk_1E5F4F6F8;
  v16 = v8;
  v14 = v8;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_hidC"), v13, v11, 0, v15);

}

uint64_t __52__RPHIDSession_hidCommand_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

- (void)hidCommand:(int)a3 buttonState:(int)a4 destinationID:(id)a5 completion:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  RPMessageable *messenger;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v21[2] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  messenger = self->_messenger;
  v20[0] = CFSTR("_hBtS");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a5;
  objc_msgSend(v12, "numberWithInt:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("_hidC");
  v21[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __64__RPHIDSession_hidCommand_buttonState_destinationID_completion___block_invoke;
  v18[3] = &unk_1E5F4F6F8;
  v19 = v10;
  v17 = v10;
  -[RPMessageable sendRequestID:request:destinationID:options:responseHandler:](messenger, "sendRequestID:request:destinationID:options:responseHandler:", CFSTR("_hidC"), v16, v13, 0, v18);

}

uint64_t __64__RPHIDSession_hidCommand_buttonState_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  return result;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
  objc_storeStrong((id *)&self->_messenger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
