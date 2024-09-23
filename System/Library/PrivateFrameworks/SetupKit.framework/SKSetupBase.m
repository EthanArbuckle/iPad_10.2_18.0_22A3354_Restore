@implementation SKSetupBase

- (SKSetupBase)initWithLogCategory:(LogCategory *)a3
{
  SKSetupBase *v4;
  SKSetupBase *v5;
  SKSetupBase *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKSetupBase;
  v4 = -[SKSetupBase init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v5->_ucat = a3;
    v5->_ucatBase = a3;
    v6 = v5;
  }

  return v5;
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
  v4.super_class = (Class)SKSetupBase;
  -[SKSetupBase dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)-[SKSetupBase descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  id v5;
  NSData *pskData;
  NSData *v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v13;
  void *v14;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v4 = 0;

  }
  CUPrintFlags32();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CUAppendF();
  v5 = v4;

  pskData = self->_pskData;
  if (pskData)
  {
    v7 = pskData;
    -[NSData length](v7, "length", v14);
    CUAppendF();
    v8 = v5;

    v5 = v8;
  }
  CUAppendF();
  v9 = (__CFString *)v5;

  v10 = &stru_24D22B2A0;
  if (v9)
    v10 = v9;
  v11 = v10;

  return v11;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)setPasswordType:(int)a3
{
  int passwordType;
  NSObject *dispatchQueue;
  _QWORD v5[5];
  int v6;

  passwordType = self->_passwordType;
  self->_passwordType = a3;
  if (passwordType != a3 && self->_activateCalled)
  {
    dispatchQueue = self->_dispatchQueue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __31__SKSetupBase_setPasswordType___block_invoke;
    v5[3] = &unk_24D22A4C0;
    v5[4] = self;
    v6 = a3;
    dispatch_async(dispatchQueue, v5);
  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__SKSetupBase_activate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__SKSetupBase_invalidate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  NSMutableDictionary *registeredEvents;
  NSMutableDictionary *registeredRequests;
  SKConnection *skCnx;

  -[SKSetupBase _invalidateSteps](self, "_invalidateSteps");
  registeredEvents = self->_registeredEvents;
  self->_registeredEvents = 0;

  registeredRequests = self->_registeredRequests;
  self->_registeredRequests = 0;

  -[SKConnection invalidate](self->_skCnx, "invalidate");
  skCnx = self->_skCnx;
  self->_skCnx = 0;

  -[SKSetupBase _tearDownMessageSession](self, "_tearDownMessageSession");
  -[SKSetupBase _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  id eventHandler;
  id passwordTypeChangedHandler;
  id sendDataHandler;
  int var0;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    -[SKSetupBase _reportEventType:](self, "_reportEventType:", 30);
    eventHandler = self->_eventHandler;
    self->_eventHandler = 0;

    passwordTypeChangedHandler = self->_passwordTypeChangedHandler;
    self->_passwordTypeChangedHandler = 0;

    sendDataHandler = self->_sendDataHandler;
    self->_sendDataHandler = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_completeWithError:(id)a3
{
  id v4;
  int var0;
  int v6;
  SKEvent *v7;
  void *v8;
  id v9;

  v4 = a3;
  var0 = self->_ucat->var0;
  v9 = v4;
  if (v4)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v6 = 3;
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v6 = 4;
  }
  self->_runState = v6;
  v7 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 20, v9);
  -[SKSetupBase _reportEvent:](self, "_reportEvent:", v7);

}

- (void)postEvent:(id)a3
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
  v7[2] = __25__SKSetupBase_postEvent___block_invoke;
  v7[3] = &unk_24D22AFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)postEventType:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__SKSetupBase_postEventType___block_invoke;
  v4[3] = &unk_24D22A4C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_postEvent:(id)a3
{
  id v4;
  int var0;
  int v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  id v11;
  id v12;

  v4 = a3;
  var0 = self->_ucat->var0;
  v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v12, v6))
    {
      v11 = v4;
      LogPrintF();
      v4 = v12;
    }
  }
  if (objc_msgSend(v4, "eventType", v11) == 130)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v12;
      objc_msgSend(v7, "password");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[SKConnection tryPassword:](self->_skCnx, "tryPassword:", v8);
      }
      else
      {
        v10 = self->_ucat->var0;
        if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
          LogPrintF();
      }

    }
    else
    {
      v9 = self->_ucat->var0;
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        objc_opt_class();
        LogPrintF();
      }
    }
  }

}

- (void)reportEvent:(id)a3
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
  v7[2] = __27__SKSetupBase_reportEvent___block_invoke;
  v7[3] = &unk_24D22AFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_reportEvent:(id)a3
{
  int var0;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v5 = _Block_copy(self->_eventHandler);
  v6 = v5;
  if (v5)
    (*((void (**)(void *, id))v5 + 2))(v5, v7);

}

- (void)reportEventType:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__SKSetupBase_reportEventType___block_invoke;
  v4[3] = &unk_24D22A4C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_reportEventType:(int)a3
{
  SKEvent *v4;

  v4 = -[SKEvent initWithEventType:]([SKEvent alloc], "initWithEventType:", *(_QWORD *)&a3);
  -[SKSetupBase _reportEvent:](self, "_reportEvent:", v4);

}

- (void)receivedData:(id)a3
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
  v7[2] = __28__SKSetupBase_receivedData___block_invoke;
  v7[3] = &unk_24D22AFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_connectionStartWithSKConnection:(id)a3 clientMode:(BOOL)a4 completeOnFailure:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(_QWORD);
  SKConnection *v15;
  SKConnection *v16;
  SKDevice *v17;
  SKDevice *v18;
  int var0;
  uint64_t v20;
  void *v21;
  _QWORD v22[6];
  id v23;
  BOOL v24;
  _QWORD v25[6];
  _QWORD v26[6];
  _QWORD v27[6];
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD aBlock[5];
  id v35;
  uint64_t *v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__950;
  v42 = __Block_byref_object_dispose__951;
  v43 = 0;
  v12 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke;
  aBlock[3] = &unk_24D22A4E8;
  v36 = &v38;
  aBlock[4] = self;
  v13 = v11;
  v35 = v13;
  v37 = a5;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[SKConnection invalidate](self->_skCnx, "invalidate");
  if (v10)
    v15 = (SKConnection *)v10;
  else
    v15 = objc_alloc_init(SKConnection);
  v16 = v15;
  objc_storeStrong((id *)&self->_skCnx, v15);
  -[SKConnection setBluetoothUseCase:](v16, "setBluetoothUseCase:", self->_bluetoothUseCase);
  -[SKConnection setClientMode:](v16, "setClientMode:", v8);
  -[SKConnection setConditionalPersistent:](v16, "setConditionalPersistent:", self->_conditionalPersistent);
  -[SKConnection setDispatchQueue:](v16, "setDispatchQueue:", self->_dispatchQueue);
  -[SKConnection setPassword:](v16, "setPassword:", self->_password);
  -[SKConnection setPasswordType:](v16, "setPasswordType:", self->_passwordType);
  -[SKConnection setPersistentPairing:](v16, "setPersistentPairing:", self->_persistentPairing);
  -[SKConnection setPskData:](v16, "setPskData:", self->_pskData);
  -[SKConnection setReversePairing:](v16, "setReversePairing:", self->_reversePairing);
  -[SKConnection setSendDataHandler:](v16, "setSendDataHandler:", self->_sendDataHandler);
  if (v8 && !self->_sendDataHandler)
  {
    v17 = self->_peerDevice;
    if (!v17)
    {
      NSErrorF_safe();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v39[5];
      v39[5] = v20;

      goto LABEL_13;
    }
    v18 = v17;
    -[SKConnection setBlePeerDevice:](v16, "setBlePeerDevice:", v17);

  }
  v33[0] = v12;
  v33[1] = 3221225472;
  v33[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_2;
  v33[3] = &unk_24D22A9C8;
  v33[4] = self;
  -[SKConnection setAuthCompletionHandler:](v16, "setAuthCompletionHandler:", v33);
  v32[0] = v12;
  v32[1] = 3221225472;
  v32[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_3;
  v32[3] = &unk_24D22AA18;
  v32[4] = self;
  -[SKConnection setAuthPromptHandler:](v16, "setAuthPromptHandler:", v32);
  v31[0] = v12;
  v31[1] = 3221225472;
  v31[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_4;
  v31[3] = &unk_24D22AA40;
  v31[4] = self;
  -[SKConnection setAuthShowPasswordHandler:](v16, "setAuthShowPasswordHandler:", v31);
  v30[0] = v12;
  v30[1] = 3221225472;
  v30[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_5;
  v30[3] = &unk_24D22B140;
  v30[4] = v16;
  v30[5] = self;
  -[SKConnection setErrorHandler:](v16, "setErrorHandler:", v30);
  v29[0] = v12;
  v29[1] = 3221225472;
  v29[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_6;
  v29[3] = &unk_24D22AFC8;
  v29[4] = self;
  v29[5] = v16;
  -[SKConnection setInvalidationHandler:](v16, "setInvalidationHandler:", v29);
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_7;
  v28[3] = &unk_24D22AA68;
  v28[4] = self;
  -[SKConnection setPairSetupConfigHandler:](v16, "setPairSetupConfigHandler:", v28);
  v27[0] = v12;
  v27[1] = 3221225472;
  v27[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_8;
  v27[3] = &unk_24D22AA90;
  v27[4] = v16;
  v27[5] = self;
  -[SKConnection setReceivedEventHandler:](v16, "setReceivedEventHandler:", v27);
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_9;
  v26[3] = &unk_24D22B118;
  v26[4] = v16;
  v26[5] = self;
  -[SKConnection setReceivedRequestHandler:](v16, "setReceivedRequestHandler:", v26);
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_10;
  v25[3] = &unk_24D22AFC8;
  v25[4] = v16;
  v25[5] = self;
  -[SKConnection setStateChangedHandler:](v16, "setStateChangedHandler:", v25);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_11;
  v22[3] = &unk_24D22A510;
  v22[4] = v16;
  v22[5] = self;
  v23 = v13;
  v24 = a5;
  -[SKConnection activateWithCompletion:](v16, "activateWithCompletion:", v22);

LABEL_13:
  v14[2](v14);

  _Block_object_dispose(&v38, 8);
}

- (void)_pairSetupConfig:(id)a3
{
  uint64_t Int64Ranged;
  void (**passwordTypeChangedHandler)(id, uint64_t);

  Int64Ranged = CFDictionaryGetInt64Ranged();
  passwordTypeChangedHandler = (void (**)(id, uint64_t))self->_passwordTypeChangedHandler;
  if (passwordTypeChangedHandler)
    passwordTypeChangedHandler[2](passwordTypeChangedHandler, Int64Ranged);
}

- (void)_receivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredEvents, "objectForKeyedSubscript:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handler");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v11)
    ((void (**)(_QWORD, id, id, id))v11)[2](v11, v12, v8, v9);

}

- (void)registerEventID:(id)a3 options:(id)a4 eventHandler:(id)a5 completionHandler:(id)a6
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
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__SKSetupBase_registerEventID_options_eventHandler_completionHandler___block_invoke;
  block[3] = &unk_24D22A538;
  block[4] = self;
  v20 = v10;
  v22 = v13;
  v23 = v12;
  v21 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v10;
  dispatch_async(dispatchQueue, block);

}

- (void)deregisterEventID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__SKSetupBase_deregisterEventID_completionHandler___block_invoke;
  block[3] = &unk_24D22B040;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)sendEventID:(id)a3 eventMessage:(id)a4 options:(id)a5 completionHandler:(id)a6
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
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__SKSetupBase_sendEventID_eventMessage_options_completionHandler___block_invoke;
  block[3] = &unk_24D22A560;
  block[4] = self;
  v20 = v10;
  v22 = v12;
  v23 = v13;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(dispatchQueue, block);

}

- (void)_receivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredRequests, "objectForKeyedSubscript:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handler");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
  {
    (*(void (**)(uint64_t, id, id, id, id))(v14 + 16))(v14, v17, v10, v11, v12);
  }
  else
  {
    NSErrorF_safe();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *, void *))v12 + 2))(v12, 0, 0, v16, &__block_literal_global_942);

  }
}

- (void)registerRequestID:(id)a3 options:(id)a4 requestHandler:(id)a5 completionHandler:(id)a6
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
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__SKSetupBase_registerRequestID_options_requestHandler_completionHandler___block_invoke;
  block[3] = &unk_24D22A538;
  block[4] = self;
  v20 = v10;
  v22 = v13;
  v23 = v12;
  v21 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  v18 = v10;
  dispatch_async(dispatchQueue, block);

}

- (void)deregisterRequestID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SKSetupBase_deregisterRequestID_completionHandler___block_invoke;
  block[3] = &unk_24D22B040;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)sendRequestID:(id)a3 requestMessage:(id)a4 options:(id)a5 responseHandler:(id)a6
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
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SKSetupBase_sendRequestID_requestMessage_options_responseHandler___block_invoke;
  block[3] = &unk_24D22A560;
  block[4] = self;
  v20 = v10;
  v22 = v12;
  v23 = v13;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v13;
  v18 = v10;
  dispatch_async(dispatchQueue, block);

}

- (CUMessageSession)messageSessionTemplate
{
  CUMessageSession *messageSessionTemplate;

  messageSessionTemplate = self->_messageSessionTemplate;
  if (!messageSessionTemplate)
  {
    -[SKSetupBase _setupMessageSession](self, "_setupMessageSession");
    messageSessionTemplate = self->_messageSessionTemplate;
  }
  return messageSessionTemplate;
}

- (void)_setupMessageSession
{
  int var0;
  CUMessageSessionServer *v4;
  CUMessageSessionServer *messageSessionServer;
  uint64_t v6;
  CUMessageSession *v7;
  CUMessageSession *messageSessionTemplate;
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  if (!self->_messageSessionServer)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = (CUMessageSessionServer *)objc_alloc_init(MEMORY[0x24BE297D8]);
    messageSessionServer = self->_messageSessionServer;
    self->_messageSessionServer = v4;

    -[CUMessageSessionServer setDispatchQueue:](self->_messageSessionServer, "setDispatchQueue:", self->_dispatchQueue);
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke;
    v12[3] = &unk_24D22A618;
    v12[4] = self;
    -[CUMessageSessionServer setRegisterRequestHandler:](self->_messageSessionServer, "setRegisterRequestHandler:", v12);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __35__SKSetupBase__setupMessageSession__block_invoke_6;
    v11[3] = &unk_24D22A660;
    v11[4] = self;
    -[CUMessageSessionServer setDeregisterRequestHandler:](self->_messageSessionServer, "setDeregisterRequestHandler:", v11);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __35__SKSetupBase__setupMessageSession__block_invoke_8;
    v10[3] = &unk_24D22A6B0;
    v10[4] = self;
    -[CUMessageSessionServer setSendRequestHandler:](self->_messageSessionServer, "setSendRequestHandler:", v10);
    -[CUMessageSessionServer activate](self->_messageSessionServer, "activate");
    -[CUMessageSessionServer templateSession](self->_messageSessionServer, "templateSession");
    v7 = (CUMessageSession *)objc_claimAutoreleasedReturnValue();
    messageSessionTemplate = self->_messageSessionTemplate;
    self->_messageSessionTemplate = v7;

    if (!self->_messageSessionTemplate)
    {
      v9 = self->_ucat->var0;
      if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
}

- (void)_tearDownMessageSession
{
  CUMessageSession *messageSessionTemplate;
  CUMessageSessionServer *messageSessionServer;

  -[CUMessageSession invalidate](self->_messageSessionTemplate, "invalidate");
  messageSessionTemplate = self->_messageSessionTemplate;
  self->_messageSessionTemplate = 0;

  -[CUMessageSessionServer invalidate](self->_messageSessionServer, "invalidate");
  messageSessionServer = self->_messageSessionServer;
  self->_messageSessionServer = 0;

}

- (void)addStep:(id)a3
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
  v7[2] = __23__SKSetupBase_addStep___block_invoke;
  v7[3] = &unk_24D22AFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_addStep:(id)a3
{
  id v4;
  int var0;
  int v6;
  void *v7;
  NSMutableArray *stepArray;
  NSMutableArray *v9;
  NSMutableArray *v10;
  id v11;
  id v12;

  v4 = a3;
  var0 = self->_ucat->var0;
  v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v12, v6))
    {
      v11 = v4;
      LogPrintF();
      v4 = v12;
    }
  }
  objc_msgSend(v4, "skSetupObject", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v12, "setSkSetupObject:", self);
  stepArray = self->_stepArray;
  if (!stepArray)
  {
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = self->_stepArray;
    self->_stepArray = v9;

    stepArray = self->_stepArray;
  }
  -[NSMutableArray addObject:](stepArray, "addObject:", v12);

}

- (void)_completedStep:(id)a3 error:(id)a4
{
  id v6;
  int v7;
  id v8;
  int var0;
  SKStepable *stepCurrent;
  SKStepable *v11;
  void *v12;
  SKStepable *v13;

  v13 = (SKStepable *)a3;
  v6 = a4;
  if (self->_stepCurrent == v13)
  {
    v8 = v6;
    var0 = self->_ucat->var0;
    if (v8)
    {
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v13;
        LogPrintF();

      }
    }
    else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v11 = v13;
      LogPrintF();
    }
    -[SKStepable invalidate](v13, "invalidate", v11, v12);
    stepCurrent = self->_stepCurrent;
    self->_stepCurrent = 0;

    if (v8)
      -[SKSetupBase _completeWithError:](self, "_completeWithError:", v8);
    else
      -[SKSetupBase _run](self, "_run");
    goto LABEL_20;
  }
  v7 = self->_ucat->var0;
  if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_20:

  }
}

- (void)_invalidateSteps
{
  SKStepable *stepCurrent;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableArray *stepArray;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SKStepable setSkCompletionHandler:](self->_stepCurrent, "setSkCompletionHandler:", 0);
  -[SKStepable invalidate](self->_stepCurrent, "invalidate");
  stepCurrent = self->_stepCurrent;
  self->_stepCurrent = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_stepArray;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v9, "setSkCompletionHandler:", 0, (_QWORD)v11);
        objc_msgSend(v9, "invalidate");
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_stepArray, "removeAllObjects");
  stepArray = self->_stepArray;
  self->_stepArray = 0;

}

- (BOOL)_runSteps
{
  SKStepable **p_stepCurrent;
  BOOL v3;
  void *v4;

  p_stepCurrent = &self->_stepCurrent;
  if (self->_stepCurrent)
    return 0;
  -[NSMutableArray popFirstObject](self->_stepArray, "popFirstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;
  if (v4)
  {
    objc_storeStrong((id *)p_stepCurrent, v4);
    objc_msgSend(v4, "activate");
  }

  return v3;
}

- (NSString)label
{
  return self->_label;
}

- (NSData)authTagOverride
{
  return self->_authTagOverride;
}

- (void)setAuthTagOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unsigned)bluetoothUseCase
{
  return self->_bluetoothUseCase;
}

- (void)setBluetoothUseCase:(unsigned int)a3
{
  self->_bluetoothUseCase = a3;
}

- (BOOL)conditionalPersistent
{
  return self->_conditionalPersistent;
}

- (void)setConditionalPersistent:(BOOL)a3
{
  self->_conditionalPersistent = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)passwordType
{
  return self->_passwordType;
}

- (id)passwordTypeChangedHandler
{
  return self->_passwordTypeChangedHandler;
}

- (void)setPasswordTypeChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (SKDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (BOOL)persistentPairing
{
  return self->_persistentPairing;
}

- (void)setPersistentPairing:(BOOL)a3
{
  self->_persistentPairing = a3;
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)reversePairing
{
  return self->_reversePairing;
}

- (void)setReversePairing:(BOOL)a3
{
  self->_reversePairing = a3;
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setSendDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int)setupType
{
  return self->_setupType;
}

- (void)setSetupType:(int)a3
{
  self->_setupType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_passwordTypeChangedHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_messageSessionTemplate, 0);
  objc_storeStrong((id *)&self->_messageSessionServer, 0);
  objc_storeStrong((id *)&self->_stepCurrent, 0);
  objc_storeStrong((id *)&self->_stepArray, 0);
  objc_storeStrong((id *)&self->_skCnx, 0);
  objc_storeStrong(&self->_sendDataHandler, 0);
  objc_storeStrong((id *)&self->_registeredRequests, 0);
  objc_storeStrong((id *)&self->_registeredEvents, 0);
  objc_storeStrong((id *)&self->_pskData, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_authTagOverride, 0);
}

uint64_t __23__SKSetupBase_addStep___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addStep:", *(_QWORD *)(a1 + 40));
}

void __35__SKSetupBase__setupMessageSession__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  v10 = *(_QWORD **)(a1 + 32);
  if (v10[20])
  {
    v11 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __35__SKSetupBase__setupMessageSession__block_invoke_2;
    v14[3] = &unk_24D22A5F0;
    v15 = v8;
    v12[0] = v11;
    v12[1] = 3221225472;
    v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke_5;
    v12[3] = &unk_24D22B140;
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v7;
    objc_msgSend(v10, "registerRequestID:options:requestHandler:completionHandler:", v13, a3, v14, v12);

  }
}

_QWORD *__35__SKSetupBase__setupMessageSession__block_invoke_6(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[20])
    return (_QWORD *)objc_msgSend(result, "deregisterRequestID:completionHandler:", a2, &__block_literal_global_63);
  return result;
}

void __35__SKSetupBase__setupMessageSession__block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;

  v9 = a5;
  v10 = v9;
  v11 = *(_QWORD **)(a1 + 32);
  if (v11[20])
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke_9;
    v12[3] = &unk_24D22A688;
    v13 = v9;
    objc_msgSend(v11, "sendRequestID:requestMessage:options:responseHandler:", a2, a4, a3, v12);

  }
}

void __35__SKSetupBase__setupMessageSession__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v7 = a2;
  v6 = NSErrorToOSStatus();
  (*(void (**)(uint64_t, uint64_t, id, id))(v4 + 16))(v4, v6, v5, v7);

}

void __35__SKSetupBase__setupMessageSession__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, _QWORD *);
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a5;
  v9 = *(_QWORD *)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __35__SKSetupBase__setupMessageSession__block_invoke_3;
  v12[3] = &unk_24D22A5C8;
  v13 = v8;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v9 + 16);
  v11 = v8;
  v10(v9, a4, a3, v12);

}

void __35__SKSetupBase__setupMessageSession__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
    if (v5 <= 90)
    {
      v8 = v3;
      if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
      {
        CUPrintNSError();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v4 = v8;
      }
    }
  }

}

void __35__SKSetupBase__setupMessageSession__block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void (*v11)(uint64_t, id);
  id v12;

  v5 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD1100];
    v8 = a2;
    v9 = a4;
    v10 = a3;
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v5 + 16))(v5, v9, v10);

  }
  else
  {
    v11 = *(void (**)(uint64_t, id))(v5 + 16);
    v10 = a4;
    v12 = a3;
    v11(v5, v10);
  }

}

void __68__SKSetupBase_sendRequestID_requestMessage_options_responseHandler___block_invoke(_QWORD *a1)
{
  id v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(id *)(a1[4] + 120);
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sendRequestID:request:options:responseHandler:", a1[5], a1[6], a1[7], a1[8]);
  }
  else
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = a1[8];
    NSErrorF_safe();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, v5);

  }
}

uint64_t __53__SKSetupBase_deregisterRequestID_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v6;

  v2 = a1[4];
  v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = a1[4], v4))
    {
      v6 = a1[5];
      LogPrintF();
      v2 = a1[4];
    }
  }
  objc_msgSend(*(id *)(v2 + 88), "setObject:forKeyedSubscript:", 0, a1[5], v6);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __74__SKSetupBase_registerRequestID_options_requestHandler_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  SKRequestRegistration *v10;

  objc_msgSend(*(id *)(a1[4] + 88), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = **(_DWORD **)(a1[4] + 144);
  if (v2)
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = a1[7];
    NSErrorF_safe();
    v10 = (SKRequestRegistration *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, SKRequestRegistration *))(v4 + 16))(v4, v10);
  }
  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
    {
      v9 = a1[5];
      LogPrintF();
    }
    v10 = objc_alloc_init(SKRequestRegistration);
    -[SKRequestRegistration setHandler:](v10, "setHandler:", a1[8]);
    -[SKRequestRegistration setOptions:](v10, "setOptions:", a1[6]);
    -[SKRequestRegistration setRequestID:](v10, "setRequestID:", a1[5]);
    v5 = *(void **)(a1[4] + 88);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v7 = a1[4];
      v8 = *(void **)(v7 + 88);
      *(_QWORD *)(v7 + 88) = v6;

      v5 = *(void **)(a1[4] + 88);
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, a1[5], v9);
    (*(void (**)(_QWORD, _QWORD))(a1[7] + 16))(a1[7], 0);
  }

}

void __66__SKSetupBase_sendEventID_eventMessage_options_completionHandler___block_invoke(_QWORD *a1)
{
  id v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(id *)(a1[4] + 120);
  v6 = v2;
  if (v2)
  {
    objc_msgSend(v2, "sendEventID:event:options:completion:", a1[5], a1[6], a1[7], a1[8]);
  }
  else
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = a1[8];
    NSErrorF_safe();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

uint64_t __51__SKSetupBase_deregisterEventID_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t v6;

  v2 = a1[4];
  v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = a1[4], v4))
    {
      v6 = a1[5];
      LogPrintF();
      v2 = a1[4];
    }
  }
  objc_msgSend(*(id *)(v2 + 80), "setObject:forKeyedSubscript:", 0, a1[5], v6);
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __70__SKSetupBase_registerEventID_options_eventHandler_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  SKEventRegistration *v10;

  objc_msgSend(*(id *)(a1[4] + 80), "objectForKeyedSubscript:", a1[5]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = **(_DWORD **)(a1[4] + 144);
  if (v2)
  {
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = a1[7];
    NSErrorF_safe();
    v10 = (SKEventRegistration *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, SKEventRegistration *))(v4 + 16))(v4, v10);
  }
  else
  {
    if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
    {
      v9 = a1[5];
      LogPrintF();
    }
    v10 = objc_alloc_init(SKEventRegistration);
    -[SKEventRegistration setEventID:](v10, "setEventID:", a1[5]);
    -[SKEventRegistration setHandler:](v10, "setHandler:", a1[8]);
    -[SKEventRegistration setOptions:](v10, "setOptions:", a1[6]);
    v5 = *(void **)(a1[4] + 80);
    if (!v5)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v7 = a1[4];
      v8 = *(void **)(v7 + 80);
      *(_QWORD *)(v7 + 80) = v6;

      v5 = *(void **)(a1[4] + 80);
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, a1[5], v9);
    (*(void (**)(_QWORD, _QWORD))(a1[7] + 16))(a1[7], 0);
  }

}

uint64_t __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    if (*(_BYTE *)(a1 + 56))
      return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SKEvent *v4;

  v3 = a2;
  v4 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 140, v3);

  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", v4);
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  SKAuthenticationRequestEvent *v5;

  v5 = -[SKAuthenticationRequestEvent initWithPasswordType:pairingFlags:throttleSeconds:]([SKAuthenticationRequestEvent alloc], "initWithPasswordType:pairingFlags:throttleSeconds:", a2, a3, a4);
  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", v5);

}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  SKAuthenticationPresentEvent *v6;

  v5 = a3;
  v6 = -[SKAuthenticationPresentEvent initWithPasswordType:password:]([SKAuthenticationPresentEvent alloc], "initWithPasswordType:password:", a2, v5);

  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", v6);
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 120))
  {
    v9 = v3;
    v5 = **(_DWORD **)(v4 + 144);
    if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(void **)(v6 + 120);
    *(_QWORD *)(v6 + 120) = 0;

    objc_msgSend(*(id *)(a1 + 40), "_run");
    v3 = v9;
  }

}

int *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  int *result;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(int **)(v2 + 144);
  if (*result <= 30)
  {
    if (*result != -1 || (result = (int *)_LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), (_DWORD)result))
    {
      result = (int *)LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v4 = *(void **)(a1 + 40);
  if (v4 == *(void **)(v2 + 120))
  {
    *(_QWORD *)(v2 + 120) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_connectionEnded:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_reportEventType:", 41);
    return (int *)objc_msgSend(*(id *)(a1 + 32), "_run");
  }
  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[18];
  v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_DWORD ***)(a1 + 32), v6))
    {
      CUPrintNSObjectOneLine();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v8;
      v4 = *(_DWORD ***)(a1 + 32);
    }
    else
    {
      v3 = v8;
    }
  }
  objc_msgSend(v4, "_pairSetupConfig:", v3, v7);

}

_QWORD *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v5 == result[15])
    return (_QWORD *)objc_msgSend(result, "_receivedEventID:event:options:", a2, a3, a4);
  return result;
}

_QWORD *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v6 == result[15])
    return (_QWORD *)objc_msgSend(result, "_receivedRequestID:request:options:responseHandler:", a2, a3, a4, a5);
  return result;
}

_QWORD *__88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_10(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[15])
    return (_QWORD *)objc_msgSend(result, "_run");
  return result;
}

void __88__SKSetupBase__connectionStartWithSKConnection_clientMode_completeOnFailure_completion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v13 = v3;
  if (v4 == *(void **)(v5 + 120))
  {
    v8 = **(_DWORD **)(v5 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v11);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(void **)(v9 + 120);
      *(_QWORD *)(v9 + 120) = 0;

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      if (*(_BYTE *)(a1 + 56))
        objc_msgSend(*(id *)(a1 + 40), "_completeWithError:", v13);
      goto LABEL_19;
    }
    if (v8 <= 30)
    {
      if (v8 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_18;
        v4 = *(void **)(a1 + 32);
      }
      v11 = v4;
      LogPrintF();
    }
LABEL_18:
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_reportEventType:", 40);
LABEL_19:
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    goto LABEL_20;
  }
  NSErrorF_safe();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 144);
  if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_run");

LABEL_20:
}

uint64_t __28__SKSetupBase_receivedData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "receivedData:", *(_QWORD *)(a1 + 40));
}

uint64_t __31__SKSetupBase_reportEventType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportEventType:", *(unsigned int *)(a1 + 40));
}

uint64_t __27__SKSetupBase_reportEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", *(_QWORD *)(a1 + 40));
}

void __29__SKSetupBase_postEventType___block_invoke(uint64_t a1)
{
  void *v1;
  SKEvent *v2;

  v1 = *(void **)(a1 + 32);
  v2 = -[SKEvent initWithEventType:]([SKEvent alloc], "initWithEventType:", *(unsigned int *)(a1 + 40));
  objc_msgSend(v1, "_postEvent:", v2);

}

uint64_t __25__SKSetupBase_postEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_postEvent:", *(_QWORD *)(a1 + 40));
}

uint64_t __25__SKSetupBase_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 40))
  {
    v2 = result;
    *(_BYTE *)(v1 + 40) = 1;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[18];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    return objc_msgSend(v3, "_invalidate");
  }
  return result;
}

int *__23__SKSetupBase_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int *result;
  int v4;
  int v5;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  result = *(int **)(v2 + 144);
  v4 = *result;
  if (*(_BYTE *)(v2 + 40))
  {
    if (v4 <= 90)
    {
      if (v4 != -1)
        return (int *)LogPrintF();
      result = (int *)_LogCategory_Initialize();
      if ((_DWORD)result)
        return (int *)LogPrintF();
    }
  }
  else
  {
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v5))
      {
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    return (int *)objc_msgSend((id)v2, "_activate");
  }
  return result;
}

uint64_t __31__SKSetupBase_setPasswordType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "updatePasswordType:", *(unsigned int *)(a1 + 40));
}

@end
