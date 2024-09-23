@implementation SKSetupCaptiveNetworkJoinServer

- (SKSetupCaptiveNetworkJoinServer)init
{
  SKSetupCaptiveNetworkJoinServer *v2;
  SKSetupCaptiveNetworkJoinServer *v3;
  SKSetupCaptiveNetworkJoinServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupCaptiveNetworkJoinServer);
  v3 = v2;
  if (v2)
  {
    v2->super._setupType = 2;
    v4 = v2;
  }

  return v3;
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  uint64_t mode;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  void *v14;
  const __CFString *v15;

  if ((a3 & 0x8000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CUAppendF();
    v4 = 0;

  }
  mode = self->_mode;
  if (mode > 2)
    v6 = CFSTR("?");
  else
    v6 = off_24D229D98[mode];
  v15 = v6;
  CUAppendF();
  v7 = (__CFString *)v4;

  -[SKSetupBase pskData](self, "pskData", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "length");
    CUAppendF();
    v10 = v7;

    v7 = v10;
  }

  v11 = &stru_24D22B2A0;
  if (v7)
    v11 = v7;
  v12 = v11;

  return v12;
}

- (void)_activate
{
  uint64_t v3;
  objc_super v4;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  v3 = MEMORY[0x24BDAC760];
  v11[4] = self;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke;
  v12[3] = &unk_24D229BA8;
  v12[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_2;
  v11[3] = &unk_24D22A9C8;
  -[SKSetupBase registerRequestID:options:requestHandler:completionHandler:](self, "registerRequestID:options:requestHandler:completionHandler:", CFSTR("_awSt"), 0, v12, v11);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_3;
  v10[3] = &unk_24D229BA8;
  v10[4] = self;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_4;
  v9[3] = &unk_24D22A9C8;
  v9[4] = self;
  -[SKSetupBase registerRequestID:options:requestHandler:completionHandler:](self, "registerRequestID:options:requestHandler:completionHandler:", CFSTR("_cnPb"), 0, v10, v9);
  v7[4] = self;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_5;
  v8[3] = &unk_24D229BA8;
  v8[4] = self;
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_6;
  v7[3] = &unk_24D22A9C8;
  -[SKSetupBase registerRequestID:options:requestHandler:completionHandler:](self, "registerRequestID:options:requestHandler:completionHandler:", CFSTR("_ntRl"), 0, v8, v7);
  v5[4] = self;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_7;
  v6[3] = &unk_24D229BA8;
  v6[4] = self;
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_8;
  v5[3] = &unk_24D22A9C8;
  -[SKSetupBase registerRequestID:options:requestHandler:completionHandler:](self, "registerRequestID:options:requestHandler:completionHandler:", CFSTR("_cnLg"), 0, v6, v5);
  v4.receiver = self;
  v4.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
  -[SKSetupBase _activate](&v4, sel__activate);
}

- (void)_invalidate
{
  objc_super v3;

  -[SKSetupCaptiveNetworkJoinServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  -[SKSetupCaptiveNetworkJoinServer _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
  -[SKSetupCaptiveNetworkJoinServer _captiveNetworkProbeEnsureStopped](self, "_captiveNetworkProbeEnsureStopped");
  -[SKSetupCaptiveNetworkJoinServer _cfuEnsuredStopped](self, "_cfuEnsuredStopped");
  -[SKSetupCaptiveNetworkJoinServer _networkRelayDeviceEnsureStopped](self, "_networkRelayDeviceEnsureStopped");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_invalidated
{
  objc_super v2;

  if (!self->_cfuController)
  {
    v2.receiver = self;
    v2.super_class = (Class)SKSetupCaptiveNetworkJoinServer;
    -[SKSetupBase _invalidated](&v2, sel__invalidated);
  }
}

- (void)_run
{
  int mode;
  int var0;

  if (!self->super._invalidateCalled)
  {
    mode = self->_mode;
    if (mode == 2)
    {
      -[SKSetupCaptiveNetworkJoinServer _runUserRequest](self, "_runUserRequest");
    }
    else if (mode == 1)
    {
      -[SKSetupCaptiveNetworkJoinServer _runDetected](self, "_runDetected");
    }
    else if (mode)
    {
      var0 = self->super._ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    else
    {
      -[SKSetupCaptiveNetworkJoinServer _runDefault](self, "_runDefault");
    }
  }
}

- (void)_runDefault
{
  if (self->super._sendDataHandler)
    -[SKSetupCaptiveNetworkJoinServer _oobEnsureStarted](self, "_oobEnsureStarted");
  else
    -[SKSetupCaptiveNetworkJoinServer _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
  if (-[SKSetupCaptiveNetworkJoinServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun"))
    -[SKSetupCaptiveNetworkJoinServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
  else
    -[SKSetupCaptiveNetworkJoinServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
}

- (BOOL)_bleAdvertiserShouldRun
{
  int v3;

  v3 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
  if (v3)
    LOBYTE(v3) = -[SKConnection state](self->super._skCnx, "state") != 1 && GestaltGetDeviceClass() != 7;
  return v3;
}

- (void)_bleAdvertiserEnsureStarted
{
  CBAdvertiser **p_bleAdvertiser;
  id v4;
  int var0;
  id v6;
  _QWORD v7[6];

  p_bleAdvertiser = &self->_bleAdvertiser;
  if (!self->_bleAdvertiser)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB218]);
    objc_storeStrong((id *)p_bleAdvertiser, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v4, "setNearbyActionFlags:", 64);
    objc_msgSend(v4, "setNearbyActionType:", 39);
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v6 = v4;
      LogPrintF();
    }
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__SKSetupCaptiveNetworkJoinServer__bleAdvertiserEnsureStarted__block_invoke;
    v7[3] = &unk_24D22B140;
    v7[4] = v4;
    v7[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v7, v6);

  }
}

- (void)_bleAdvertiserEnsureStopped
{
  CBAdvertiser *bleAdvertiser;
  int var0;
  int v5;
  CBAdvertiser *v6;
  CBAdvertiser *v7;

  bleAdvertiser = self->_bleAdvertiser;
  if (bleAdvertiser)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (v5 = _LogCategory_Initialize(), bleAdvertiser = self->_bleAdvertiser, v5))
      {
        v7 = bleAdvertiser;
        LogPrintF();
        bleAdvertiser = self->_bleAdvertiser;
      }
    }
  }
  -[CBAdvertiser invalidate](bleAdvertiser, "invalidate", v7);
  v6 = self->_bleAdvertiser;
  self->_bleAdvertiser = 0;

}

- (void)_bleServerEnsureStarted
{
  CBServer **p_bleServer;
  id v4;
  uint64_t v5;
  int var0;
  id v7;
  _QWORD v8[6];
  _QWORD v9[6];

  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB298]);
    objc_storeStrong((id *)p_bleServer, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v4, "setBleListenPSM:", 130);
    v5 = MEMORY[0x24BDAC760];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke;
    v9[3] = &unk_24D22A798;
    v9[4] = v4;
    v9[5] = self;
    objc_msgSend(v4, "setAcceptHandler:", v9);
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v7 = v4;
      LogPrintF();
    }
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke_2;
    v8[3] = &unk_24D22B140;
    v8[4] = v4;
    v8[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v8, v7);

  }
}

- (void)_bleServerEnsureStopped
{
  int var0;
  CBServer *bleServer;

  if (self->_bleServer)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  -[CBServer invalidate](self->_bleServer, "invalidate");
  bleServer = self->_bleServer;
  self->_bleServer = 0;

}

- (void)_bleServerAcceptConnecton:(id)a3
{
  SKConnection *v4;
  SKConnection *v5;
  int var0;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v4 = self->super._skCnx;
  if (!v4)
  {
    v5 = objc_alloc_init(SKConnection);
    -[SKConnection setBleConnection:](v5, "setBleConnection:", v11);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", v5, 0, 0, &__block_literal_global_131);
    goto LABEL_8;
  }
  v5 = v4;
  var0 = self->super._ucat->var0;
  if (var0 > 90)
    goto LABEL_7;
  v7 = v11;
  if (var0 == -1)
  {
    if (_LogCategory_Initialize())
    {
      v7 = v11;
      goto LABEL_4;
    }
LABEL_7:
    objc_msgSend(v11, "invalidate", v8, v10);
    goto LABEL_8;
  }
LABEL_4:
  v9 = v7;
  LogPrintF();
  objc_msgSend(v11, "invalidate", v9, v5);
LABEL_8:

}

- (void)_connectionEnded:(id)a3
{
  -[SKSetupCaptiveNetworkJoinServer _captiveNetworkProbeEnsureStopped](self, "_captiveNetworkProbeEnsureStopped", a3);
  -[SKSetupCaptiveNetworkJoinServer _networkRelayDeviceEnsureStopped](self, "_networkRelayDeviceEnsureStopped");
}

- (void)_captiveNetworkLoginRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  int var0;
  SKCaptiveContext *v8;
  SKCaptiveContext *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v8 = objc_alloc_init(SKCaptiveContext);
  -[SKCaptiveContext setResponseHandler:](v8, "setResponseHandler:", v6);
  -[SKCaptiveContext setServer:](v8, "setServer:", self);
  v9 = v8;
  if (!MEMORY[0x2199D6CF4](_captiveNetworkLoginCallback, v9))
  {
    v10 = self->super._ucat->var0;
    if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();

    NSErrorF_safe();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *, void *))v6 + 2))(v6, 0, 0, v11, &__block_literal_global_66);

  }
}

- (void)_captiveNetworkLoginInfo:(id)a3 cookie:(unsigned int)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  int var0;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD aBlock[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__119;
  v29 = __Block_byref_object_dispose__120;
  v30 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__SKSetupCaptiveNetworkJoinServer__captiveNetworkLoginInfo_cookie_responseHandler___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v24 = &v25;
  aBlock[4] = self;
  v10 = v9;
  v23 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  if (v8)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          self->_captiveNetworkCookie = a4;
          objc_storeStrong((id *)&self->_captiveNetworkInterfaceName, v15);
          self->_captiveNetworkWebSheetActive = 1;
          v31[0] = CFSTR("_cnSS");
          v31[1] = CFSTR("_cnUR");
          v32[0] = v14;
          v32[1] = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, _QWORD, _QWORD, void *))v10 + 2))(v10, v16, 0, 0, &__block_literal_global_80);
        }
        else
        {
          NSErrorF_safe();
          v20 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v26[5];
          v26[5] = v20;
        }

      }
      else
      {
        NSErrorF_safe();
        v19 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v26[5];
        v26[5] = v19;
      }

    }
    else
    {
      NSErrorF_safe();
      v18 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v26[5];
      v26[5] = v18;
    }

  }
  else
  {
    NSErrorF_safe();
    v17 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v26[5];
    v26[5] = v17;
  }

  v11[2](v11);
  _Block_object_dispose(&v25, 8);

}

- (void)_captiveNetworkProbeEnsureStopped
{
  int var0;

  if (self->_captiveNetworkWebSheetActive)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    CNWebsheetNotifyComplete();
    self->_captiveNetworkWebSheetActive = 0;
  }
}

- (void)_captiveNetworkProbeRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  int var0;
  NSString *v11;
  SKCaptiveContext *v12;
  SKCaptiveContext *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD aBlock[5];
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__119;
  v28 = __Block_byref_object_dispose__120;
  v29 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeRequest_responseHandler___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v23 = &v24;
  aBlock[4] = self;
  v8 = v7;
  v22 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (self->_captiveNetworkWebSheetActive)
  {
    v11 = self->_captiveNetworkInterfaceName;
    if (v11)
    {
      v12 = objc_alloc_init(SKCaptiveContext);
      -[SKCaptiveContext setResponseHandler:](v12, "setResponseHandler:", v8);
      -[SKCaptiveContext setServer:](v12, "setServer:", self);
      v13 = v12;
      if (!CNProberCreate())
      {

        NSErrorF_safe();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v25[5];
        v25[5] = v14;

      }
    }
    else
    {
      NSErrorF_safe();
      v19 = objc_claimAutoreleasedReturnValue();
      v13 = (SKCaptiveContext *)v25[5];
      v25[5] = v19;
    }

  }
  else
  {
    if (self->_captiveNetworkWebSheetCompleted)
      v16 = 0;
    else
      v16 = 4294960551;
    v17 = self->super._ucat->var0;
    if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
    {
      CUPrintErrorCode();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v30 = CFSTR("_cnPR");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v16, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, NSString *, _QWORD, _QWORD, void *))v8 + 2))(v8, v11, 0, 0, &__block_literal_global_89);
  }

  v9[2](v9);
  _Block_object_dispose(&v24, 8);

}

- (void)_captiveNetworkProbeResult:(int)a3 responseHandler:(id)a4
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  int v8;
  int var0;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  int v15;
  const __CFString *v16;
  _QWORD v17[2];

  v4 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = 4294896138;
  v7 = a4;
  if (!(_DWORD)v4)
  {
    v8 = CNWebsheetNotifyComplete();
    self->_captiveNetworkWebSheetActive = 0;
    if (v8)
      v6 = 0;
    else
      v6 = 4294896139;
    self->_captiveNetworkWebSheetCompleted = 1;
  }
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    v12 = v4;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v16 = CFSTR("_cnPR");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6, v12, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeResult_responseHandler___block_invoke;
  v14[3] = &unk_24D22A338;
  v15 = v6;
  v14[4] = self;
  (*((void (**)(id, void *, _QWORD, _QWORD, _QWORD *))v7 + 2))(v7, v11, 0, 0, v14);

}

- (void)_cfuEnsuredStarted
{
  FLFollowUpController **p_cfuController;
  int var0;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  p_cfuController = &self->_cfuController;
  if (!self->_cfuController)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v5 = (void *)objc_msgSend(objc_alloc(getFLFollowUpControllerClass()), "initWithClientIdentifier:", CFSTR("com.apple.SetupKit"));
    objc_storeStrong((id *)p_cfuController, v5);
    v6 = objc_alloc_init((Class)getFLFollowUpItemClass[0]());
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "setUniqueIdentifier:", CFSTR("com.apple.SetupKit.followup.captive-portal"));
      getFLGroupIdentifierDevice[0]();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGroupIdentifier:", v8);

      SKLocalizedString(CFSTR("CNJ_CFU_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTitle:", v9);

      v10 = objc_alloc_init(getFLFollowUpActionClass());
      if (v10)
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("prefs:root=Network&cfuAction=launchCaptive&activate=true"));
        objc_msgSend(v10, "setUrl:", v11);

        v14[0] = v10;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setActions:", v12);

        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStarted__block_invoke;
        v13[3] = &unk_24D229C90;
        v13[4] = self;
        objc_msgSend(v5, "postFollowUpItem:completion:", v7, v13);
      }

    }
  }
}

- (void)_cfuEnsuredStopped
{
  FLFollowUpController *cfuController;
  FLFollowUpController *v4;
  int var0;
  FLFollowUpController *v6;
  _QWORD v7[5];

  if (self->_mode == 1 && GestaltGetDeviceClass() != 7)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    cfuController = self->_cfuController;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStopped__block_invoke;
    v7[3] = &unk_24D229C90;
    v7[4] = cfuController;
    v4 = cfuController;
    -[FLFollowUpController clearPendingFollowUpItemsWithUniqueIdentifiers:completion:](v4, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", &unk_24D233628, v7);

  }
  if (self->_cfuController)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  v6 = self->_cfuController;
  self->_cfuController = 0;

}

- (void)_networkRelayDeviceEnsureStopped
{
  NRDeviceIdentifier *v3;
  BOOL v4;
  int var0;
  NRDeviceIdentifier *nrDeviceIdentifier;
  NRDeviceManager *nrDeviceManager;
  NRDeviceMonitor *nrDeviceMonitor;
  int v9;
  CUBonjourAdvertiser *awdlAdvertiser;
  uint64_t v11;
  void *v12;
  NRDeviceManager *v13;

  v13 = self->_nrDeviceManager;
  v3 = self->_nrDeviceIdentifier;
  if (v13)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (!v4)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      -[NRDeviceIdentifier nrDeviceIdentifier](v3, "nrDeviceIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[NRDeviceManager unregisterDevice:](v13, "unregisterDevice:", v3, v12);
    }
    else
    {
      -[NRDeviceManager unregisterDevice:](v13, "unregisterDevice:", v3, v11);
    }
  }
  nrDeviceIdentifier = self->_nrDeviceIdentifier;
  self->_nrDeviceIdentifier = 0;

  nrDeviceManager = self->_nrDeviceManager;
  self->_nrDeviceManager = 0;

  nrDeviceMonitor = self->_nrDeviceMonitor;
  self->_nrDeviceMonitor = 0;

  if (self->_awdlAdvertiser)
  {
    v9 = self->super._ucat->var0;
    if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  -[CUBonjourAdvertiser invalidate](self->_awdlAdvertiser, "invalidate");
  awdlAdvertiser = self->_awdlAdvertiser;
  self->_awdlAdvertiser = 0;

}

- (void)_networkRelayAWDLStartRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  int var0;
  void *v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  _QWORD aBlock[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__119;
  v24 = __Block_byref_object_dispose__120;
  v25 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__SKSetupCaptiveNetworkJoinServer__networkRelayAWDLStartRequest_responseHandler___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v19 = &v20;
  aBlock[4] = self;
  v8 = v7;
  v18 = v8;
  v9 = (void (**)(_QWORD))_Block_copy(aBlock);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BE29790]);
    objc_storeStrong((id *)&self->_awdlAdvertiser, v12);
    objc_msgSend(v12, "setAdvertiseFlags:", 2048);
    objc_msgSend(v12, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v12, "setDomain:", CFSTR("local."));
    objc_msgSend(v12, "setInterfaceName:", CFSTR("awdl0"));
    objc_msgSend(v12, "setName:", v11);
    objc_msgSend(v12, "setPort:", 1234);
    objc_msgSend(v12, "setServiceType:", CFSTR("_setupkit._tcp"));
    v26 = CFSTR("rpBA");
    v27[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTxtDictionary:", v13);

    v14 = self->super._ucat->var0;
    if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
    {
      v16 = v11;
      LogPrintF();
    }
    objc_msgSend(v12, "activate", v16);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v8 + 2))(v8, MEMORY[0x24BDBD1B8], 0, 0, &__block_literal_global_124);
  }
  else
  {
    NSErrorF_safe();
    v15 = objc_claimAutoreleasedReturnValue();
    v12 = (id)v21[5];
    v21[5] = v15;
  }

  v9[2](v9);
  _Block_object_dispose(&v20, 8);

}

- (void)_networkRelaySetupRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  int var0;
  uint64_t v9;
  NRDeviceManager *v10;
  NRDeviceIdentifier **p_nrDeviceIdentifier;
  NRDeviceIdentifier *v12;
  int v13;
  NRDeviceIdentifier *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  SKConnection *skCnx;
  id *v20;
  id v21;
  NRDeviceMonitor *v22;
  int v23;
  OS_dispatch_queue *dispatchQueue;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void (**v39)(_QWORD);
  void *v40;
  id v41;
  id v42;
  _QWORD v43[5];
  id obj[4];
  int v45;
  uint64_t v46;
  _QWORD v47[3];
  int v48;
  _QWORD aBlock[5];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  id *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  const __CFString *v58;
  void *v59;
  _BYTE v60[32];
  char v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v42 = a3;
  v6 = a4;
  v52 = 0;
  v53 = (id *)&v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__119;
  v56 = __Block_byref_object_dispose__120;
  v57 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke;
  aBlock[3] = &unk_24D22AC78;
  v51 = &v52;
  aBlock[4] = self;
  v7 = v6;
  v50 = v7;
  v39 = (void (**)(_QWORD))_Block_copy(aBlock);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  CFStringGetTypeID();
  v9 = objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String");
  if (!v9)
  {
    NSErrorF_safe();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKSetupBase _completeWithError:](self, "_completeWithError:", v26);

    goto LABEL_35;
  }
  memset(v47, 0, sizeof(v47));
  v48 = 0;
  v46 = 0;
  if (StringToSockAddr() || (memset(&obj[1], 0, 24), v45 = 0, CUGetInterfaceAddresses()))
  {
    NSErrorF_safe();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v53[5];
    v53[5] = (id)v27;

    goto LABEL_35;
  }
  if (SockAddrToString())
  {
    NSErrorF_safe();
    v29 = objc_claimAutoreleasedReturnValue();
    v41 = v53[5];
    v53[5] = (id)v29;

    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v61);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = self->_nrDeviceManager;
  if (v10)
    goto LABEL_12;
  v10 = (NRDeviceManager *)objc_msgSend(MEMORY[0x24BE6B6C0], "copySharedDeviceManager");
  if (v10)
  {
    objc_storeStrong((id *)&self->_nrDeviceManager, v10);
LABEL_12:
    p_nrDeviceIdentifier = &self->_nrDeviceIdentifier;
    v12 = self->_nrDeviceIdentifier;
    if (v12)
    {
      v13 = self->super._ucat->var0;
      if (v13 < 31 && (v13 != -1 || _LogCategory_Initialize()))
      {
        -[NRDeviceIdentifier nrDeviceIdentifier](v12, "nrDeviceIdentifier", v36);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      -[NRDeviceManager unregisterDevice:](v10, "unregisterDevice:", v12, v36);
      v14 = *p_nrDeviceIdentifier;
      *p_nrDeviceIdentifier = 0;

    }
    v15 = (void *)objc_msgSend(MEMORY[0x24BE6B6B8], "newEphemeralDeviceIdentifier");
    if (v15)
    {
      objc_storeStrong((id *)&self->_nrDeviceIdentifier, v15);
      v16 = objc_alloc_init(MEMORY[0x24BE6B6E0]);
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v47, v46);
      objc_msgSend(v16, "setAwdlAddressData:", v17);

      if (-[NSData length](self->super._pskData, "length"))
      {
        -[NSData bytes](self->super._pskData, "bytes");
        -[NSData length](self->super._pskData, "length");
        CryptoHKDF();
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v60, 32, v60);
      }
      else
      {
        skCnx = self->super._skCnx;
        v20 = v53 + 5;
        obj[0] = v53[5];
        -[SKConnection deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:error:](skCnx, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:error:", "NetworkRelaySalt", 16, "NetworkRelayInfo", 16, 32, obj);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v20, obj[0]);
      }
      if (v18)
      {
        objc_msgSend(v16, "setOutOfBandKey:", v18);
        v21 = objc_alloc_init(MEMORY[0x24BE6B6D8]);
        objc_msgSend(v21, "setAllowedLinkTypes:", &unk_24D233640);
        objc_msgSend(v21, "setAllowedLinkSubtypes:", &unk_24D233658);
        objc_msgSend(v21, "setProxyCapability:", 1);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "setProxyProviderRequiresWiFi:", 1);
        v22 = self->_nrDeviceMonitor;
        if (!v22)
        {
          v22 = (NRDeviceMonitor *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B6C8]), "initWithDeviceIdentifier:delegate:queue:", v15, self, self->super._dispatchQueue);
          objc_storeStrong((id *)&self->_nrDeviceMonitor, v22);
        }
        v23 = self->super._ucat->var0;
        if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
        {
          v37 = v40;
          v38 = v9;
          v36 = v15;
          LogPrintF();
        }
        dispatchQueue = self->super._dispatchQueue;
        v43[0] = MEMORY[0x24BDAC760];
        v43[1] = 3221225472;
        v43[2] = __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke_157;
        v43[3] = &unk_24D22A9C8;
        v43[4] = self;
        -[NRDeviceManager registerDevice:properties:operationalproperties:queue:completionBlock:](v10, "registerDevice:properties:operationalproperties:queue:completionBlock:", v15, v16, v21, dispatchQueue, v43, v36, v37, v38);
        v58 = CFSTR("_ip");
        v59 = v40;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, _QWORD, _QWORD, void *))v7 + 2))(v7, v25, 0, 0, &__block_literal_global_160);

      }
      else
      {
        v31 = v53;
        v32 = v53[5];
        if (v32)
        {
          v33 = v32;
          v21 = v31[5];
          v31[5] = v33;
        }
        else
        {
          NSErrorF_safe();
          v35 = objc_claimAutoreleasedReturnValue();
          v21 = v53[5];
          v53[5] = (id)v35;
        }
      }

    }
    else
    {
      NSErrorF_safe();
      v30 = objc_claimAutoreleasedReturnValue();
      v16 = v53[5];
      v53[5] = (id)v30;
    }

    goto LABEL_34;
  }
  NSErrorF_safe();
  v34 = objc_claimAutoreleasedReturnValue();
  v10 = (NRDeviceManager *)v53[5];
  v53[5] = (id)v34;
LABEL_34:

LABEL_35:
  v39[2](v39);

  _Block_object_dispose(&v52, 8);
}

- (void)deviceIsConnectedDidChange:(id)a3 isConnected:(BOOL)a4
{
  void *v5;
  int var0;
  void *StringFromNRLinkType;
  void *StringFromNRLinkSubtype;
  id v9;

  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  objc_msgSend(v9, "proxyServiceInterfaceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v9, "linkType");
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    objc_msgSend(v9, "linkSubtype");
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();

  }
}

- (void)deviceLinkTypeDidChange:(id)a3 linkType:(unsigned __int8)a4 linkSubtype:(unsigned __int8)a5
{
  int var0;
  void *StringFromNRLinkSubtype;
  id StringFromNRLinkType;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    StringFromNRLinkType = (id)createStringFromNRLinkType();
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    LogPrintF();

  }
}

- (void)deviceProxyServiceInterfaceNameDidChange:(id)a3 interfaceName:(id)a4
{
  int var0;
  void *v6;
  void *StringFromNRLinkType;
  void *StringFromNRLinkSubtype;
  void *v9;
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  var0 = self->super._ucat->var0;
  if (var0 <= 30)
  {
    v6 = v10;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_5;
      v6 = v10;
    }
    objc_msgSend(v6, "isConnected");
    objc_msgSend(v10, "linkType");
    StringFromNRLinkType = (void *)createStringFromNRLinkType();
    objc_msgSend(v10, "linkSubtype");
    StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
    objc_msgSend(v10, "proxyServiceInterfaceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_5:

}

- (void)_oobEnsureStarted
{
  SKConnection *v3;

  if (!self->super._skCnx)
  {
    v3 = objc_alloc_init(SKConnection);
    -[SKConnection setSendDataHandler:](v3, "setSendDataHandler:", self->super._sendDataHandler);
    -[SKSetupBase _connectionStartWithSKConnection:clientMode:completeOnFailure:completion:](self, "_connectionStartWithSKConnection:clientMode:completeOnFailure:completion:", v3, 0, 0, &__block_literal_global_164);

  }
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nrDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_nrDeviceManager, 0);
  objc_storeStrong((id *)&self->_nrDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_awdlAdvertiser, 0);
  objc_storeStrong((id *)&self->_cfuController, 0);
  objc_storeStrong((id *)&self->_captiveNetworkInterfaceName, 0);
  objc_storeStrong((id *)&self->_bleServer, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

uint64_t __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke(_QWORD *a1)
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

void __77__SKSetupCaptiveNetworkJoinServer__networkRelaySetupRequest_responseHandler___block_invoke_157(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = **(_DWORD **)(v4 + 144);
  v8 = v3;
  if (v5 <= 30)
  {
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 32), v6))
    {
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = *(_QWORD *)(a1 + 32);
    }
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v4 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_run");

}

uint64_t __81__SKSetupCaptiveNetworkJoinServer__networkRelayAWDLStartRequest_responseHandler___block_invoke(_QWORD *a1)
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

void __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStopped__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30
    && ((v7 = v3, gLogCategory_SKSetupCaptiveNetworkJoinServer != -1) || (v5 = _LogCategory_Initialize(), v4 = v7, v5)))
  {
    CUPrintNSError();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  else
  {

  }
}

void __53__SKSetupCaptiveNetworkJoinServer__cfuEnsuredStarted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = v4;
  v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
  if (v6 <= 30)
  {
    v9 = v4;
    if (v6 != -1 || (v7 = _LogCategory_Initialize(), v5 = v9, v7))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v5 = v9;
    }
  }

}

uint64_t __78__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeResult_responseHandler___block_invoke(uint64_t result)
{
  if (!*(_DWORD *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_reportEventType:", 202);
  return result;
}

uint64_t __79__SKSetupCaptiveNetworkJoinServer__captiveNetworkProbeRequest_responseHandler___block_invoke(_QWORD *a1)
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

uint64_t __83__SKSetupCaptiveNetworkJoinServer__captiveNetworkLoginInfo_cookie_responseHandler___block_invoke(_QWORD *a1)
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

void __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, _QWORD);
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  int v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v6 + 216))
  {
    v8 = **(_DWORD **)(v6 + 144);
    v9 = v12;
    if (v8 <= 30)
    {
      if (v8 == -1)
      {
        v10 = _LogCategory_Initialize();
        v6 = *(_QWORD *)(a1 + 40);
        if (!v10)
        {
          v9 = v12;
          goto LABEL_8;
        }
        v9 = v12;
      }
      v11 = v9;
      LogPrintF();
      v9 = v12;
      v6 = *(_QWORD *)(a1 + 40);
    }
LABEL_8:
    objc_msgSend((id)v6, "_bleServerAcceptConnecton:", v9, v11);
    objc_msgSend(*(id *)(a1 + 40), "_run");
    v5[2](v5, 0);
    goto LABEL_9;
  }
  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

void __58__SKSetupCaptiveNetworkJoinServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v5 == *(_QWORD *)(v4 + 216))
  {
    v6 = **(_DWORD **)(v4 + 144);
    v12 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v10);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 216);
      *(_QWORD *)(v7 + 216) = 0;

      goto LABEL_13;
    }
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        v11 = v5;
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 40), "_run", v11);
LABEL_13:
        v3 = v12;
        goto LABEL_14;
      }
      v9 = _LogCategory_Initialize();
      v4 = *(_QWORD *)(a1 + 40);
      if (v9)
      {
        v5 = *(_QWORD *)(a1 + 32);
        goto LABEL_8;
      }
    }
    objc_msgSend((id)v4, "_run", v10);
    goto LABEL_13;
  }
LABEL_14:

}

void __62__SKSetupCaptiveNetworkJoinServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
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
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 208))
  {
    v9 = v3;
    if (v3)
    {
      v5 = **(_DWORD **)(v4 + 144);
      if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v8);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 208);
      *(_QWORD *)(v6 + 208) = 0;

    }
    else
    {
      objc_msgSend((id)v4, "_run");
    }
    v3 = v9;
  }

}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkRelayAWDLStartRequest:responseHandler:", a3, a5);
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_completeWithError:", a2);
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_captiveNetworkProbeRequest:responseHandler:", a3, a5);
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_completeWithError:", a2);
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_networkRelaySetupRequest:responseHandler:", a3, a5);
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_6(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_completeWithError:", a2);
  return result;
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_captiveNetworkLoginRequest:responseHandler:", a3, a5);
}

uint64_t __44__SKSetupCaptiveNetworkJoinServer__activate__block_invoke_8(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_completeWithError:", a2);
  return result;
}

+ (void)resetWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(getFLFollowUpControllerClass()), "initWithClientIdentifier:", CFSTR("com.apple.SetupKit"));
  if (v4)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __62__SKSetupCaptiveNetworkJoinServer_resetWithCompletionHandler___block_invoke;
    v6[3] = &unk_24D229B80;
    v8 = v3;
    v7 = v4;
    objc_msgSend(v7, "clearPendingFollowUpItemsWithUniqueIdentifiers:completion:", &unk_24D233610, v6);

  }
  else
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 90
      && (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    if (v3)
    {
      NSErrorF_safe();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v3 + 2))(v3, v5);

    }
  }

}

void __62__SKSetupCaptiveNetworkJoinServer_resetWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (gLogCategory_SKSetupCaptiveNetworkJoinServer <= 30)
  {
    if (gLogCategory_SKSetupCaptiveNetworkJoinServer != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      v4 = v8;
    }
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);
    v4 = v8;
  }

}

@end
