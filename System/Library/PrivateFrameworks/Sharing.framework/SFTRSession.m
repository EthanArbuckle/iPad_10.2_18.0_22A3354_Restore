@implementation SFTRSession

- (SFTRSession)init
{
  SFTRSession *v2;
  SFTRSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFTRSession;
  v2 = -[SFTRSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_connected = 1;
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)dealloc
{
  SFTRSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFTRSession *)FatalErrorF();
    -[SFTRSession _cleanup](v3, v4);
  }
  else
  {
    -[SFTRSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFTRSession;
    -[SFTRSession dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  TRAnisetteDataHandler *anisetteDataHandler;
  id disconnectHandler;
  NSMutableDictionary *handlerMap;
  id sendEventImpHandler;
  id sendRequestImpHandler;

  anisetteDataHandler = self->_anisetteDataHandler;
  self->_anisetteDataHandler = 0;

  disconnectHandler = self->_disconnectHandler;
  self->_disconnectHandler = 0;

  -[NSMutableDictionary removeAllObjects](self->_handlerMap, "removeAllObjects");
  handlerMap = self->_handlerMap;
  self->_handlerMap = 0;

  sendEventImpHandler = self->_sendEventImpHandler;
  self->_sendEventImpHandler = 0;

  sendRequestImpHandler = self->_sendRequestImpHandler;
  self->_sendRequestImpHandler = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SFTRSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __23__SFTRSession_activate__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = objc_alloc_init((Class)getTRAnisetteDataHandlerClass[0]());
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = (void *)v5[2];
  objc_msgSend(v5, "trSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForAnisetteDataRequestsFromSession:", v7);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SFTRSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__SFTRSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24)
    && gLogCategory_SFTRSession <= 30
    && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)handleEvent:(id)a3 flags:(unsigned int)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[4];
  id v10;
  SFTRSession *v11;
  unsigned int v12;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFTRSession_handleEvent_flags___block_invoke;
  block[3] = &unk_1E4832158;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __33__SFTRSession_handleEvent_flags___block_invoke(uint64_t a1)
{
  uint64_t v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  id v11;

  if ((*(_BYTE *)(a1 + 48) & 1) == 0)
  {
    if (gLogCategory_SFTRSession > 90 || gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize())
      goto LABEL_26;
LABEL_16:
    LogPrintF();
LABEL_26:
    v11 = 0;
LABEL_27:
    v7 = 0;
    v5 = 0;
    goto LABEL_10;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (gLogCategory_SFTRSession > 90 || gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize())
      goto LABEL_26;
    goto LABEL_16;
  }
  v11 = (id)v2;
  getTREventMessageClass[0]();
  v3 = (objc_class *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "_decodeTRMessageData:kindOfClass:", v11, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (gLogCategory_SFTRSession <= 90 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      NSStringFromClass(v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    goto LABEL_27;
  }
  v5 = (void *)v4;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void (**)(_QWORD, _QWORD))v8;
    if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v11, "length");
      LogPrintF();
    }
    ((void (**)(_QWORD, void *))v9)[2](v9, v5);

  }
  else if (gLogCategory_SFTRSession <= 90
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_10:

}

- (void)handleRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SFTRSession *v15;
  id v16;
  unsigned int v17;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __51__SFTRSession_handleRequest_flags_responseHandler___block_invoke;
  v13[3] = &unk_1E4831C00;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

void __51__SFTRSession_handleRequest_flags_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  objc_class *v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  if ((*(_BYTE *)(a1 + 56) & 1) == 0)
  {
    if (gLogCategory_SFTRSession > 90 || gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize())
      goto LABEL_26;
LABEL_16:
    LogPrintF();
LABEL_26:
    v3 = 0;
LABEL_27:
    v8 = 0;
    v6 = 0;
    goto LABEL_10;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (gLogCategory_SFTRSession > 90 || gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize())
      goto LABEL_26;
    goto LABEL_16;
  }
  v3 = (void *)v2;
  getTRRequestMessageClass[0]();
  v4 = (objc_class *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "_decodeTRMessageData:kindOfClass:", v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (gLogCategory_SFTRSession <= 90 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      NSStringFromClass(v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    goto LABEL_27;
  }
  v6 = (void *)v5;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
    if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v3, "length");
      LogPrintF();
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__SFTRSession_handleRequest_flags_responseHandler___block_invoke_2;
    v12[3] = &unk_1E4834720;
    v8 = v8;
    v13 = v8;
    v14 = *(id *)(a1 + 48);
    ((void (**)(_QWORD, void *, _QWORD *))v10)[2](v10, v6, v12);

  }
  else if (gLogCategory_SFTRSession <= 90
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_10:

}

void __51__SFTRSession_handleRequest_flags_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 && v6)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
    {
      v26 = CFSTR("trMsg");
      v27 = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "length");
        LogPrintF();

      }
      v5 = 0;
      goto LABEL_19;
    }
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0CB2F90];
    v28 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = CFSTR("?");
    if (v19)
      v21 = (const __CFString *)v19;
    v29 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, -6712, v22);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (gLogCategory_SFTRSession <= 90 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
      LogPrintF();
LABEL_16:
    v10 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if (gLogCategory_SFTRSession <= 60 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    v23 = *(_QWORD *)(a1 + 32);
    v25 = v5;
    LogPrintF();
  }
  if (!v5)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0CB2F90];
    v30 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v14 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v14;
    v15 = CFSTR("?");
    if (v14)
      v15 = (const __CFString *)v14;
    v31[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1, v23, v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, -6700, v16);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v10 = 0;
LABEL_20:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)sendEvent:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SFTRSession *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __25__SFTRSession_sendEvent___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __25__SFTRSession_sendEvent___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(a1 + 32), 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      v9 = v3;
      v10 = objc_msgSend(v4, "length");
      LogPrintF();
    }
    v11[0] = CFSTR("op");
    v11[1] = CFSTR("trMsg");
    v12[0] = &unk_1E4890CA0;
    v12[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2, v9, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(v6 + 72);
    if (v7)
    {
      (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))(v7, v5, 1);
    }
    else
    {
      v8 = *(void **)(v6 + 56);
      if (v8)
      {
        objc_msgSend(v8, "sendWithFlags:object:", 1, v5);
      }
      else if (gLogCategory_SFTRSession <= 90
             && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }

  }
  else if (gLogCategory_SFTRSession <= 90
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)sendRequest:(id)a3 withResponseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SFTRSession *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SFTRSession_sendRequest_withResponseHandler___block_invoke;
  block[3] = &unk_1E482D2B8;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __47__SFTRSession_sendRequest_withResponseHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD aBlock[5];
  id v22;
  uint64_t v23;
  const __CFString *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a1[4], 1, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v25[0] = CFSTR("op");
    v25[1] = CFSTR("trMsg");
    v26[0] = &unk_1E4890CB8;
    v26[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__SFTRSession_sendRequest_withResponseHandler___block_invoke_115;
    aBlock[3] = &unk_1E4834748;
    v5 = (void *)a1[6];
    aBlock[4] = a1[5];
    v22 = v5;
    v6 = _Block_copy(aBlock);
    if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v3, "length");
      LogPrintF();

    }
    v8 = a1[5];
    v9 = *(_QWORD *)(v8 + 80);
    if (v9)
    {
      (*(void (**)(uint64_t, void *, uint64_t, void *))(v9 + 16))(v9, v4, 1, v6);
    }
    else
    {
      v10 = *(void **)(v8 + 56);
      if (v10)
      {
        objc_msgSend(v10, "sendRequestWithFlags:object:responseHandler:", 1, v4, v6);
      }
      else
      {
        if (gLogCategory_SFTRSession <= 90
          && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v11 = a1[6];
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = *MEMORY[0x1E0CB2F90];
        v23 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = CFSTR("?");
        if (v14)
          v16 = (const __CFString *)v14;
        v24 = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1, v19, v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, -6753, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v18, 0);

      }
    }

  }
  else if (gLogCategory_SFTRSession <= 90
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __47__SFTRSession_sendRequest_withResponseHandler___block_invoke_115(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  v22 = a3;
  v7 = a4;
  v8 = v22;
  v9 = v7;
  if (v22)
  {
    if (gLogCategory_SFTRSession <= 60)
    {
      if (gLogCategory_SFTRSession != -1 || (v19 = _LogCategory_Initialize(), v8 = v22, v19))
      {
        LogPrintF();
        v8 = v22;
      }
    }
    goto LABEL_24;
  }
  if ((a2 & 1) == 0)
  {
    NSErrorWithOSStatusF();
    v16 = objc_claimAutoreleasedReturnValue();
    v8 = (id)v16;
    if (gLogCategory_SFTRSession <= 90)
    {
      v24 = (id)v16;
      if (gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize())
        goto LABEL_29;
LABEL_19:
      LogPrintF();
LABEL_29:
      v11 = 0;
LABEL_30:
      v14 = 0;
      v8 = v24;
      goto LABEL_10;
    }
LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    NSErrorWithOSStatusF();
    v17 = objc_claimAutoreleasedReturnValue();
    v8 = (id)v17;
    if (gLogCategory_SFTRSession <= 90)
    {
      v24 = (id)v17;
      if (gLogCategory_SFTRSession == -1 && !_LogCategory_Initialize())
        goto LABEL_29;
      goto LABEL_19;
    }
    goto LABEL_24;
  }
  v11 = (void *)v10;
  getTRResponseMessageClass[0]();
  v12 = (objc_class *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "_decodeTRMessageData:kindOfClass:", v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    NSErrorWithOSStatusF();
    v18 = objc_claimAutoreleasedReturnValue();
    v8 = (id)v18;
    if (gLogCategory_SFTRSession <= 90)
    {
      v24 = (id)v18;
      if (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize())
      {
        NSStringFromClass(v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      goto LABEL_30;
    }
LABEL_25:
    v14 = 0;
    goto LABEL_10;
  }
  v14 = (void *)v13;
  if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "length");
    LogPrintF();

  }
  v8 = 0;
LABEL_10:
  v23 = v8;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v8);

}

- (void)setEventHandler:(id)a3 forEventClass:(Class)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SFTRSession_setEventHandler_forEventClass___block_invoke;
  block[3] = &unk_1E4834770;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __45__SFTRSession_setEventHandler_forEventClass___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    NSStringFromClass(*(Class *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

  }
  v8 = (id)objc_msgSend(*(id *)(a1 + 40), "copy", v7);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  NSStringFromClass(*(Class *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)setRequestHandler:(id)a3 forRequestClass:(Class)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  Class v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFTRSession_setRequestHandler_forRequestClass___block_invoke;
  block[3] = &unk_1E4834770;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __49__SFTRSession_setRequestHandler_forRequestClass___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (gLogCategory_SFTRSession <= 30 && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    NSStringFromClass(*(Class *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = v2;

  }
  v8 = (id)objc_msgSend(*(id *)(a1 + 40), "copy", v7);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  NSStringFromClass(*(Class *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, v6);

}

- (id)_decodeTRMessageData:(id)a3 kindOfClass:(Class)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v14;
  _QWORD v15[7];

  v15[6] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = [v5 alloc];
  v15[0] = a4;
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  v15[3] = objc_opt_class();
  v15[4] = objc_opt_class();
  v15[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (v10)
  {
    v12 = v10;
  }
  else if (gLogCategory_SFTRSession <= 90
         && (gLogCategory_SFTRSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v10;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (SFSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)sendEventImpHandler
{
  return self->_sendEventImpHandler;
}

- (void)setSendEventImpHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)sendRequestImpHandler
{
  return self->_sendRequestImpHandler;
}

- (void)setSendRequestImpHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendRequestImpHandler, 0);
  objc_storeStrong(&self->_sendEventImpHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_anisetteDataHandler, 0);
}

@end
