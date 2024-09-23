@implementation SKSetupClient

- (SKSetupClient)init
{
  SKSetupClient *v2;
  SKSetupClient *v3;
  SKSetupClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupClient;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupClient);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__SKSetupClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_24D22A928;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  int var0;
  uint64_t setupType;
  const char *v9;
  void *v10;
  SKDevice *peerDevice;
  _BOOL4 v12;
  const char *v13;
  SKStepWiFiPreflight *v14;
  id *v15;
  BOOL v16;
  unsigned int controlFlags;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  SKDevice *v22;
  const char *v23;
  id obj;
  _QWORD aBlock[5];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v4 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__1536;
  v32 = __Block_byref_object_dispose__1537;
  v33 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SKSetupClient__activateWithCompletion___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v27 = &v28;
  aBlock[4] = self;
  v5 = v4;
  v26 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self->super._activateCalled || self->super._invalidateCalled)
  {
    NSErrorF_safe();
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v14 = (SKStepWiFiPreflight *)v29[5];
    v29[5] = v19;
    goto LABEL_25;
  }
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    setupType = self->super._setupType;
    if (setupType > 5)
      v9 = "?";
    else
      v9 = off_24D22AAB0[setupType];
    CUPrintFlags32();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    peerDevice = self->super._peerDevice;
    v12 = -[SKSetupBase reversePairing](self, "reversePairing");
    v13 = "no";
    if (v12)
      v13 = "yes";
    v22 = peerDevice;
    v23 = v13;
    v20 = v9;
    v21 = v10;
    LogPrintF();

  }
  self->super._activateCalled = 1;
  if (self->super._setupType == 1)
  {
    v14 = objc_alloc_init(SKStepWiFiPreflight);
    -[SKStepWiFiPreflight setPreventAppleWiFi:](v14, "setPreventAppleWiFi:", 0);
    v15 = (id *)(v29 + 5);
    obj = (id)v29[5];
    v16 = -[SKStepWiFiPreflight checkWiFiAndReturnError:](v14, "checkWiFiAndReturnError:", &obj);
    objc_storeStrong(v15, obj);
    if (!v16)
    {
      (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
      -[SKSetupClient _completeWithError:](self, "_completeWithError:", v29[5]);
      v18 = (void *)v29[5];
      v29[5] = 0;

LABEL_25:
      goto LABEL_26;
    }

  }
  -[SKSetupClient _prepareSteps](self, "_prepareSteps", v20, v21, v22, v23);
  if (!self->super._sendDataHandler)
  {
    controlFlags = self->super._controlFlags;
    if ((controlFlags & 2) != 0)
    {
      -[SKSetupClient _activateNANWithCompletion:](self, "_activateNANWithCompletion:", v5);
      goto LABEL_26;
    }
    if ((controlFlags & 1) == 0)
    {
      -[SKSetupClient _activateBLEWithCompletion:](self, "_activateBLEWithCompletion:", v5);
      goto LABEL_26;
    }
    NSErrorF_safe();
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  -[SKSetupClient _activateOOBWithCompletion:](self, "_activateOOBWithCompletion:", v5);
LABEL_26:
  v6[2](v6);

  _Block_object_dispose(&v28, 8);
}

- (void)_activateBLEWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  SKConnection *v8;
  SKDevice *v9;
  int var0;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];
  id v14;
  _QWORD aBlock[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__1536;
  v22 = __Block_byref_object_dispose__1537;
  v23 = 0;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__SKSetupClient__activateBLEWithCompletion___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v17 = &v18;
  aBlock[4] = self;
  v6 = v4;
  v16 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8 = objc_alloc_init(SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v8);
  v9 = self->super._peerDevice;
  if (v9)
  {
    -[SKConnection setBlePeerDevice:](v8, "setBlePeerDevice:", v9);
    -[SKSetupClient _setupConnectionCommon:](self, "_setupConnectionCommon:", v8);
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __44__SKSetupClient__activateBLEWithCompletion___block_invoke_2;
    v13[3] = &unk_24D22A950;
    v13[4] = v8;
    v13[5] = self;
    v14 = v6;
    -[SKConnection activateWithCompletion:](v8, "activateWithCompletion:", v13);

  }
  else
  {
    NSErrorF_safe();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v19[5];
    v19[5] = v11;

  }
  v7[2](v7);

  _Block_object_dispose(&v18, 8);
}

- (void)_activateNANWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  SKConnection *v8;
  void *v9;
  id v10;
  void *v11;
  id activateCompletion;
  uint64_t v13;
  _QWORD v14[6];
  _QWORD v15[6];
  _QWORD v16[8];
  _QWORD v17[6];
  _QWORD aBlock[5];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__1536;
  v25 = __Block_byref_object_dispose__1537;
  v26 = 0;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v20 = &v21;
  aBlock[4] = self;
  v6 = v4;
  v19 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8 = objc_alloc_init(SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v8);
  -[SKConnection setClientMode:](v8, "setClientMode:", 1);
  -[SKConnection setPassword:](v8, "setPassword:", self->super._password);
  -[SKDevice identifier](self->super._peerDevice, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BE297F0]);
    objc_storeStrong((id *)&self->_nanSubscriber, v10);
    objc_msgSend(v10, "setControlFlags:", 1);
    objc_msgSend(v10, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v10, "setServiceType:", CFSTR("com.apple.setup"));
    v11 = _Block_copy(v6);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = v11;

    v17[0] = v5;
    v17[1] = 3221225472;
    v17[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_2;
    v17[3] = &unk_24D22A978;
    v17[4] = v9;
    v17[5] = self;
    objc_msgSend(v10, "setEndpointFoundHandler:", v17);
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_3;
    v16[3] = &unk_24D22A9A0;
    v16[4] = v10;
    v16[5] = self;
    v16[6] = v9;
    v16[7] = v8;
    objc_msgSend(v10, "setReceiveHandler:", v16);
    v15[0] = v5;
    v15[1] = 3221225472;
    v15[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_4;
    v15[3] = &unk_24D22A9F0;
    v15[4] = v10;
    v15[5] = self;
    -[SKConnection setSendDataHandler:](v8, "setSendDataHandler:", v15);
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_6;
    v14[3] = &unk_24D22B140;
    v14[4] = v10;
    v14[5] = self;
    objc_msgSend(v10, "activateWithCompletion:", v14);
  }
  else
  {
    NSErrorF_safe();
    v13 = objc_claimAutoreleasedReturnValue();
    v10 = (id)v22[5];
    v22[5] = v13;
  }

  v7[2](v7);
  _Block_object_dispose(&v21, 8);

}

- (void)_activateNANContinueWithError:(id)a3
{
  id v4;
  SKConnection *v5;
  id activateCompletion;
  int var0;
  SKConnection *v8;
  _QWORD v9[6];

  v4 = a3;
  if (v4)
  {
    v5 = (SKConnection *)_Block_copy(self->_activateCompletion);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = 0;

    if (v5)
      ((void (*)(SKConnection *, id))v5->_authThrottleDeadlineTicks)(v5, v4);
  }
  else
  {
    v5 = self->super._skCnx;
    if (v5)
    {
      -[SKSetupClient _setupConnectionCommon:](self, "_setupConnectionCommon:", v5);
      var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v8 = v5;
        LogPrintF();
      }
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __47__SKSetupClient__activateNANContinueWithError___block_invoke;
      v9[3] = &unk_24D22B140;
      v9[4] = v5;
      v9[5] = self;
      -[SKConnection activateWithCompletion:](v5, "activateWithCompletion:", v9, v8);
    }
  }

}

- (void)_activateOOBWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  SKConnection *v8;
  int var0;
  id v10;
  _QWORD v11[6];
  id v12;
  _QWORD aBlock[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__1536;
  v16[4] = __Block_byref_object_dispose__1537;
  v17 = 0;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__SKSetupClient__activateOOBWithCompletion___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v15 = v16;
  aBlock[4] = self;
  v6 = v4;
  v14 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8 = objc_alloc_init(SKConnection);
  objc_storeStrong((id *)&self->super._skCnx, v8);
  -[SKConnection setSendDataHandler:](v8, "setSendDataHandler:", self->super._sendDataHandler);
  -[SKSetupClient _setupConnectionCommon:](self, "_setupConnectionCommon:", v8);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __44__SKSetupClient__activateOOBWithCompletion___block_invoke_2;
  v11[3] = &unk_24D22A950;
  v11[4] = v8;
  v11[5] = self;
  v10 = v6;
  v12 = v10;
  -[SKConnection activateWithCompletion:](v8, "activateWithCompletion:", v11);

  v7[2](v7);
  _Block_object_dispose(v16, 8);

}

- (void)_setupConnectionCommon:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  SKSetupClient *v13;
  _QWORD v14[4];
  id v15;
  SKSetupClient *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  id v19;
  SKSetupClient *v20;
  _QWORD v21[4];
  id v22;
  SKSetupClient *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  v4 = a3;
  objc_msgSend(v4, "setClientMode:", 1);
  objc_msgSend(v4, "setConditionalPersistent:", -[SKSetupBase conditionalPersistent](self, "conditionalPersistent"));
  objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
  objc_msgSend(v4, "setPassword:", self->super._password);
  objc_msgSend(v4, "setPersistentPairing:", -[SKSetupBase persistentPairing](self, "persistentPairing"));
  objc_msgSend(v4, "setReversePairing:", -[SKSetupBase reversePairing](self, "reversePairing"));
  v5 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke;
  v26[3] = &unk_24D22A9C8;
  v26[4] = self;
  objc_msgSend(v4, "setAuthCompletionHandler:", v26);
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_2;
  v25[3] = &unk_24D22AA18;
  v25[4] = self;
  objc_msgSend(v4, "setAuthPromptHandler:", v25);
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_3;
  v24[3] = &unk_24D22AA40;
  v24[4] = self;
  objc_msgSend(v4, "setAuthShowPasswordHandler:", v24);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_4;
  v21[3] = &unk_24D22B140;
  v6 = v4;
  v22 = v6;
  v23 = self;
  objc_msgSend(v6, "setErrorHandler:", v21);
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_5;
  v18[3] = &unk_24D22AFC8;
  v7 = v6;
  v19 = v7;
  v20 = self;
  objc_msgSend(v7, "setInvalidationHandler:", v18);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_6;
  v17[3] = &unk_24D22AA68;
  v17[4] = self;
  objc_msgSend(v7, "setPairSetupConfigHandler:", v17);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_7;
  v14[3] = &unk_24D22AA90;
  v8 = v7;
  v15 = v8;
  v16 = self;
  objc_msgSend(v8, "setReceivedEventHandler:", v14);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_8;
  v11[3] = &unk_24D22B118;
  v12 = v8;
  v13 = self;
  v9 = v8;
  objc_msgSend(v9, "setReceivedRequestHandler:", v11);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __40__SKSetupClient__setupConnectionCommon___block_invoke_9;
  v10[3] = &unk_24D22B0F0;
  v10[4] = self;
  objc_msgSend(v9, "setStateChangedHandler:", v10);

}

- (void)_invalidate
{
  CUNANSubscriber *nanSubscriber;
  void (**v4)(void *, void *);
  id activateCompletion;
  void *v6;
  objc_super v7;

  -[CUNANSubscriber invalidate](self->_nanSubscriber, "invalidate");
  nanSubscriber = self->_nanSubscriber;
  self->_nanSubscriber = 0;

  v4 = (void (**)(void *, void *))_Block_copy(self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v4)
  {
    NSErrorF_safe();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)SKSetupClient;
  -[SKSetupBase _invalidate](&v7, sel__invalidate);

}

- (void)_invalidated
{
  id authCompletionHandler;
  id authPromptHandler;
  void (**v5)(void *, void *);
  id overallCompletionHandler;
  void *v7;
  void (**v8)(_QWORD);
  id invalidationHandler;
  objc_super v10;

  if (self->super._invalidateCalled)
  {
    authCompletionHandler = self->_authCompletionHandler;
    self->_authCompletionHandler = 0;

    authPromptHandler = self->_authPromptHandler;
    self->_authPromptHandler = 0;

    v5 = (void (**)(void *, void *))_Block_copy(self->_overallCompletionHandler);
    overallCompletionHandler = self->_overallCompletionHandler;
    self->_overallCompletionHandler = 0;

    if (v5)
    {
      NSErrorF_safe();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v7);

    }
    v8 = (void (**)(_QWORD))_Block_copy(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v8)
      v8[2](v8);
    v10.receiver = self;
    v10.super_class = (Class)SKSetupClient;
    -[SKSetupBase _invalidated](&v10, sel__invalidated);

  }
}

- (void)_completeWithError:(id)a3
{
  id v4;
  int var0;
  int v6;
  void (**v7)(void *, id);
  id activateCompletion;
  SKEvent *v9;
  void (**v10)(void *, id);
  id overallCompletionHandler;
  void *v12;
  id v13;

  v4 = a3;
  var0 = self->super._ucat->var0;
  v13 = v4;
  if (v4)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
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
  self->super._runState = v6;
  v7 = (void (**)(void *, id))_Block_copy(self->_activateCompletion);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  if (v7)
    v7[2](v7, v13);
  v9 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 20, v13);
  -[SKSetupBase _reportEvent:](self, "_reportEvent:", v9);

  v10 = (void (**)(void *, id))_Block_copy(self->_overallCompletionHandler);
  overallCompletionHandler = self->_overallCompletionHandler;
  self->_overallCompletionHandler = 0;

  if (v10)
    v10[2](v10, v13);

}

- (void)_invalidateSteps
{
  SKStepable *stepCurrent;
  objc_super v4;

  -[SKStepable setSkCompletionHandler:](self->super._stepCurrent, "setSkCompletionHandler:", 0);
  -[SKStepable invalidate](self->super._stepCurrent, "invalidate");
  stepCurrent = self->super._stepCurrent;
  self->super._stepCurrent = 0;

  v4.receiver = self;
  v4.super_class = (Class)SKSetupClient;
  -[SKSetupBase _invalidateSteps](&v4, sel__invalidateSteps);
}

- (void)_prepareSteps
{
  if (self->super._setupType == 1)
    -[SKSetupClient _prepareStepsOSRecovery](self, "_prepareStepsOSRecovery");
}

- (void)_prepareStepsOSRecovery
{
  SKStepBasicConfigClient *v3;
  void *v4;
  uint64_t v5;
  SKStepWiFiSetupClientLegacy *v6;
  _QWORD v7[6];
  _QWORD v8[6];

  v3 = objc_alloc_init(SKStepBasicConfigClient);
  -[SKSetupClient clientConfig](self, "clientConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStepBasicConfigClient setClientConfig:](v3, "setClientConfig:", v4);

  -[SKStepBasicConfigClient setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigClient setSkMessaging:](v3, "setSkMessaging:", self);
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__SKSetupClient__prepareStepsOSRecovery__block_invoke;
  v8[3] = &unk_24D22B140;
  v8[4] = self;
  v8[5] = v3;
  -[SKStepBasicConfigClient setSkCompletionHandler:](v3, "setSkCompletionHandler:", v8);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);

  if (!self->_skipWifi)
  {
    v6 = objc_alloc_init(SKStepWiFiSetupClientLegacy);
    -[SKStepWiFiSetupClientLegacy setDispatchQueue:](v6, "setDispatchQueue:", self->super._dispatchQueue);
    -[SKStepWiFiSetupClientLegacy setSkMessaging:](v6, "setSkMessaging:", self);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __40__SKSetupClient__prepareStepsOSRecovery__block_invoke_2;
    v7[3] = &unk_24D22B140;
    v7[4] = self;
    v7[5] = v6;
    -[SKStepWiFiSetupClientLegacy setSkCompletionHandler:](v6, "setSkCompletionHandler:", v7);
    -[SKSetupBase _addStep:](self, "_addStep:", v6);

  }
}

- (void)tryPassword:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->super._dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__SKSetupClient_tryPassword___block_invoke;
  v7[3] = &unk_24D22AFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_run
{
  int runState;
  int v4;
  int v5;
  _BOOL4 v6;
  int var0;

  if (!self->super._invalidateCalled)
  {
    while (1)
    {
      runState = self->super._runState;
      if (runState > 11)
      {
        if (runState == 12)
        {
          v6 = -[SKSetupBase _runSteps](self, "_runSteps");
          v5 = self->super._runState;
          if (!v6)
            goto LABEL_15;
LABEL_13:
          ++v5;
LABEL_14:
          self->super._runState = v5;
          goto LABEL_15;
        }
        if (runState != 13)
          return;
        -[SKSetupClient _completeWithError:](self, "_completeWithError:", 0);
        v5 = self->super._runState;
      }
      else
      {
        if (!runState)
        {
          v5 = 11;
          goto LABEL_14;
        }
        if (runState != 11)
          return;
        v4 = -[SKConnection state](self->super._skCnx, "state");
        v5 = self->super._runState;
        if (v4 == 1)
          goto LABEL_13;
      }
LABEL_15:
      if (v5 == runState)
        return;
      var0 = self->super._ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)authPromptHandler
{
  return self->_authPromptHandler;
}

- (void)setAuthPromptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSDictionary)clientConfig
{
  return self->_clientConfig;
}

- (void)setClientConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)skipWifi
{
  return self->_skipWifi;
}

- (void)setSkipWifi:(BOOL)a3
{
  self->_skipWifi = a3;
}

- (id)overallCompletionHandler
{
  return self->_overallCompletionHandler;
}

- (void)setOverallCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_overallCompletionHandler, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_authPromptHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_nanSubscriber, 0);
  objc_storeStrong((id *)&self->_nanEndpoint, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

void __29__SKSetupClient_tryPassword___block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  int v4;
  int v5;
  id v6;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v3 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
  v6 = v2;
  if (v2)
  {
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = v6, v4))
      {
        LogPrintF();
        v2 = v6;
      }
    }
    objc_msgSend(v2, "tryPassword:", *(_QWORD *)(a1 + 40));
    goto LABEL_7;
  }
  if (v3 <= 90)
  {
    if (v3 != -1 || (v5 = _LogCategory_Initialize(), v2 = 0, v5))
    {
      LogPrintF();
LABEL_7:
      v2 = v6;
    }
  }

}

void __40__SKSetupClient__prepareStepsOSRecovery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  SKEventBasicConfigUpdated *v6;
  void *v7;
  SKEventBasicConfigUpdated *v8;
  const char *v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v11 = v3;
  if (v3)
  {
    v5 = *v4[18];
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
    {
      v9 = "-[SKSetupClient _prepareStepsOSRecovery]_block_invoke";
      v10 = v11;
      LogPrintF();
    }
  }
  else
  {
    v6 = [SKEventBasicConfigUpdated alloc];
    objc_msgSend(*(id *)(a1 + 40), "outServerConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKEventBasicConfigUpdated initWithBasicConfig:](v6, "initWithBasicConfig:", v7);
    objc_msgSend(v4, "_reportEvent:", v8);

  }
  objc_msgSend(*(id *)(a1 + 32), "_completedStep:error:", *(_QWORD *)(a1 + 40), 0, v9, v10);

}

uint64_t __40__SKSetupClient__prepareStepsOSRecovery__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completedStep:error:", *(_QWORD *)(a1 + 40), a2);
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke(uint64_t a1, void *a2)
{
  SKEvent *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 140, v6);
  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", v3);
  v4 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 240));
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v6);

}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  SKAuthenticationRequestEvent *v10;

  v10 = -[SKAuthenticationRequestEvent initWithPasswordType:pairingFlags:throttleSeconds:]([SKAuthenticationRequestEvent alloc], "initWithPasswordType:pairingFlags:throttleSeconds:", a2, a3, a4);
  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:");
  v8 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 248));
  v9 = v8;
  if (v8)
    (*((void (**)(void *, uint64_t, uint64_t, uint64_t))v8 + 2))(v8, a2, a3, a4);

}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  SKAuthenticationPresentEvent *v6;

  v5 = a3;
  v6 = -[SKAuthenticationPresentEvent initWithPasswordType:password:]([SKAuthenticationPresentEvent alloc], "initWithPasswordType:password:", a2, v5);

  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", v6);
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_4(uint64_t a1, void *a2)
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

    v3 = v9;
  }

}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  int v3;
  int v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 120))
  {
    v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(a1 + 40), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(a1 + 40);
      }
    }
    v5 = *(void **)(v1 + 120);
    *(_QWORD *)(v1 + 120) = 0;

  }
}

void __40__SKSetupClient__setupConnectionCommon___block_invoke_6(uint64_t a1, void *a2)
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

_QWORD *__40__SKSetupClient__setupConnectionCommon___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v5 == result[15])
    return (_QWORD *)objc_msgSend(result, "_receivedEventID:event:options:", a2, a3, a4);
  return result;
}

_QWORD *__40__SKSetupClient__setupConnectionCommon___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v6 == result[15])
    return (_QWORD *)objc_msgSend(result, "_receivedRequestID:request:options:responseHandler:", a2, a3, a4, a5);
  return result;
}

uint64_t __40__SKSetupClient__setupConnectionCommon___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

uint64_t __44__SKSetupClient__activateOOBWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

void __44__SKSetupClient__activateOOBWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v12 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 120))
  {
    v7 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 120);
      *(_QWORD *)(v8 + 120) = 0;

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 40), "_run");
    }
  }
  else
  {
    NSErrorF_safe();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 144);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));

  }
}

void __47__SKSetupClient__activateNANContinueWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  void (**v10)(void *, _QWORD);
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v22 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 120))
  {
    v8 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v20);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(v13 + 120);
      *(_QWORD *)(v13 + 120) = 0;

      v5 = (void (**)(_QWORD, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 40) + 208));
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(void **)(v15 + 208);
      *(_QWORD *)(v15 + 208) = 0;

      if (v5)
        ((void (**)(_QWORD, id))v5)[2](v5, v22);
    }
    else
    {
      if (v8 <= 30)
      {
        if (v8 != -1 || (v17 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 40), v17))
        {
          LogPrintF();
          v4 = *(_QWORD *)(a1 + 40);
        }
      }
      v5 = (void (**)(_QWORD, _QWORD))_Block_copy(*(const void **)(v4 + 208));
      v18 = *(_QWORD *)(a1 + 40);
      v19 = *(void **)(v18 + 208);
      *(_QWORD *)(v18 + 208) = 0;

      if (v5)
        v5[2](v5, 0);
      objc_msgSend(*(id *)(a1 + 40), "_run");
    }
  }
  else
  {
    NSErrorF_safe();
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = **(_DWORD **)(v6 + 144);
    if (v7 <= 90)
    {
      if (v7 != -1 || (v9 = _LogCategory_Initialize(), v6 = *(_QWORD *)(a1 + 40), v9))
      {
        CUPrintNSError();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v6 = *(_QWORD *)(a1 + 40);
      }
    }
    v10 = (void (**)(void *, _QWORD))_Block_copy(*(const void **)(v6 + 208));
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 208);
    *(_QWORD *)(v11 + 208) = 0;

    if (v10)
      v10[2](v10, v5);

  }
}

uint64_t __44__SKSetupClient__activateNANWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  _DWORD **v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = v7;
    if ((v6 == 0) == (v7 != 0))
    {

LABEL_10:
      v12 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 144);
      if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      goto LABEL_15;
    }
    v9 = objc_msgSend(v6, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_10;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 216), a2);
  v10 = *(_DWORD ***)(a1 + 40);
  v11 = *v10[18];
  if (v11 <= 30 && (v11 != -1 || (v13 = _LogCategory_Initialize(), v10 = *(_DWORD ***)(a1 + 40), v13)))
  {
    LogPrintF();
    objc_msgSend(*(id *)(a1 + 40), "_activateNANContinueWithError:", 0, v6);
  }
  else
  {
    objc_msgSend(v10, "_activateNANContinueWithError:", 0, v14);
  }
LABEL_15:

}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  int v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 224))
    goto LABEL_13;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v9 = v7;
  v10 = v8;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  v11 = v10;
  if ((v9 == 0) != (v10 != 0))
  {
    v12 = objc_msgSend(v9, "isEqual:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    objc_msgSend(*(id *)(a1 + 56), "receivedData:", v15);
    goto LABEL_13;
  }

LABEL_9:
  v13 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 144);
  if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v6, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_13:

}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v5 == *(void **)(v4 + 224))
  {
    v6 = *(void **)(v4 + 216);
    if (v6)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __44__SKSetupClient__activateNANWithCompletion___block_invoke_5;
      v8[3] = &unk_24D22A9C8;
      v8[4] = v4;
      v7 = v6;
      objc_msgSend(v5, "sendMessageData:endpoint:completionHandler:", v3, v7, v8);

    }
  }

}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 224))
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
      v7 = *(void **)(v6 + 224);
      *(_QWORD *)(v6 + 224) = 0;

      objc_msgSend(*(id *)(a1 + 40), "_activateNANContinueWithError:", v9);
      v3 = v9;
    }
  }

}

void __44__SKSetupClient__activateNANWithCompletion___block_invoke_5(uint64_t a1, void *a2)
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

uint64_t __44__SKSetupClient__activateBLEWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

void __44__SKSetupClient__activateBLEWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v12 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 120))
  {
    v7 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v7 <= 90 && (v7 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 120);
      *(_QWORD *)(v8 + 120) = 0;

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      objc_msgSend(*(id *)(a1 + 40), "_run");
    }
  }
  else
  {
    NSErrorF_safe();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 144);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48));

  }
}

uint64_t __41__SKSetupClient__activateWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

uint64_t __40__SKSetupClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
