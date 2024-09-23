@implementation SKSetupServer

- (SKSetupServer)init
{
  SKSetupServer *v2;
  SKSetupServer *v3;
  SKSetupServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKSetupServer;
  v2 = -[SKSetupBase initWithLogCategory:](&v6, sel_initWithLogCategory_, &gLogCategory_SKSetupServer);
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
  v7[2] = __40__SKSetupServer_activateWithCompletion___block_invoke;
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
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t aBlock;
  uint64_t v12;
  uint64_t (*v13)(_QWORD *);
  void *v14;
  SKSetupServer *v15;
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
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __41__SKSetupServer__activateWithCompletion___block_invoke;
  v14 = &unk_24D22AC78;
  v17 = &v18;
  v15 = self;
  v5 = v4;
  v16 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&aBlock);
  if (self->super._activateCalled || self->super._invalidateCalled)
  {
    NSErrorF_safe();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v19[5];
    v19[5] = v8;

  }
  else
  {
    self->super._activateCalled = 1;
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUDescriptionWithLevel();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    -[SKSetupServer _prepareSteps](self, "_prepareSteps", v10, aBlock, v12, v13, v14, v15);
    -[SKSetupServer _update](self, "_update");
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }
  v6[2](v6);

  _Block_object_dispose(&v18, 8);
}

- (void)_invalidate
{
  objc_super v3;

  -[SKSetupServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
  -[SKSetupServer _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
  -[SKSetupServer _nanPublisherEnsureStopped](self, "_nanPublisherEnsureStopped");
  -[SKSetupServer _wifiKeepAliveEnsureStopped](self, "_wifiKeepAliveEnsureStopped");
  v3.receiver = self;
  v3.super_class = (Class)SKSetupServer;
  -[SKSetupBase _invalidate](&v3, sel__invalidate);
}

- (void)_invalidated
{
  id authCompletionHandler;
  id authShowPasswordHandler;
  id authHidePasswordHandler;
  void (**v6)(void *, void *);
  id overallCompletionHandler;
  void *v8;
  void (**v9)(_QWORD);
  id invalidationHandler;
  objc_super v11;

  if (self->super._invalidateCalled)
  {
    authCompletionHandler = self->_authCompletionHandler;
    self->_authCompletionHandler = 0;

    authShowPasswordHandler = self->_authShowPasswordHandler;
    self->_authShowPasswordHandler = 0;

    authHidePasswordHandler = self->_authHidePasswordHandler;
    self->_authHidePasswordHandler = 0;

    v6 = (void (**)(void *, void *))_Block_copy(self->_overallCompletionHandler);
    overallCompletionHandler = self->_overallCompletionHandler;
    self->_overallCompletionHandler = 0;

    if (v6)
    {
      NSErrorF_safe();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v8);

    }
    v9 = (void (**)(_QWORD))_Block_copy(self->_invalidationHandler);
    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    if (v9)
      v9[2](v9);
    v11.receiver = self;
    v11.super_class = (Class)SKSetupServer;
    -[SKSetupBase _invalidated](&v11, sel__invalidated);

  }
}

- (void)reset
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__SKSetupServer_reset__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_update
{
  if (!self->super._invalidateCalled)
  {
    if ((self->super._controlFlags & 1) != 0)
      -[SKSetupServer _bleServerEnsureStopped](self, "_bleServerEnsureStopped");
    else
      -[SKSetupServer _bleServerEnsureStarted](self, "_bleServerEnsureStarted");
    if (-[SKSetupServer _bleAdvertiserShouldRun](self, "_bleAdvertiserShouldRun"))
      -[SKSetupServer _bleAdvertiserEnsureStarted](self, "_bleAdvertiserEnsureStarted");
    else
      -[SKSetupServer _bleAdvertiserEnsureStopped](self, "_bleAdvertiserEnsureStopped");
    if ((self->super._controlFlags & 2) != 0)
      -[SKSetupServer _nanPublisherEnsureStarted](self, "_nanPublisherEnsureStarted");
    else
      -[SKSetupServer _nanPublisherEnsureStopped](self, "_nanPublisherEnsureStopped");
  }
}

- (void)_prepareSteps
{
  -[SKSetupBase _invalidateSteps](self, "_invalidateSteps");
  if ((self->super._setupType | 4) == 5)
    -[SKSetupServer _prepareStepsOSRecovery](self, "_prepareStepsOSRecovery");
}

- (void)_prepareStepsOSRecovery
{
  SKStepBasicConfigServer *v3;
  void *v4;
  uint64_t v5;
  SKStepWiFiSetupServerLegacy *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  -[SKSetupServer _wifiKeepAliveEnsureStarted](self, "_wifiKeepAliveEnsureStarted");
  v3 = objc_alloc_init(SKStepBasicConfigServer);
  -[SKStepBasicConfigServer setDispatchQueue:](v3, "setDispatchQueue:", self->super._dispatchQueue);
  -[SKStepBasicConfigServer setSkMessaging:](v3, "setSkMessaging:", self);
  -[SKSetupServer serverConfig](self, "serverConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKStepBasicConfigServer setServerConfig:](v3, "setServerConfig:", v4);

  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__SKSetupServer__prepareStepsOSRecovery__block_invoke;
  v8[3] = &unk_24D22A9C8;
  v8[4] = self;
  -[SKStepBasicConfigServer setSkCompletionHandler:](v3, "setSkCompletionHandler:", v8);
  -[SKSetupBase _addStep:](self, "_addStep:", v3);
  -[SKStepBasicConfigServer activate](v3, "activate");

  if (!self->_skipWifi)
  {
    v6 = objc_alloc_init(SKStepWiFiSetupServerLegacy);
    -[SKStepWiFiSetupServerLegacy setDispatchQueue:](v6, "setDispatchQueue:", self->super._dispatchQueue);
    -[SKStepWiFiSetupServerLegacy setSkMessaging:](v6, "setSkMessaging:", self);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __40__SKSetupServer__prepareStepsOSRecovery__block_invoke_2;
    v7[3] = &unk_24D22A9C8;
    v7[4] = self;
    -[SKStepWiFiSetupServerLegacy setSkCompletionHandler:](v6, "setSkCompletionHandler:", v7);
    -[SKSetupBase _addStep:](self, "_addStep:", v6);
    -[SKStepWiFiSetupServerLegacy activate](v6, "activate");

  }
}

- (BOOL)_bleAdvertiserShouldRun
{
  int v3;

  if (self->_completed || (self->super._controlFlags & 1) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
    if (v3)
      LOBYTE(v3) = self->super._skCnx == 0;
  }
  return v3;
}

- (void)_bleAdvertiserEnsureStarted
{
  uint64_t v3;
  uint64_t v4;
  unsigned int bleAdvertisePSM;
  CBAdvertiser *bleAdvertiser;
  int v7;
  int v8;
  CBAdvertiser *v9;
  CBAdvertiser *v10;
  id v11;
  int setupType;
  void *v13;
  uint64_t v14;
  int v15;
  int var0;
  uint64_t v17;
  uint64_t v18;
  CBAdvertiser *v19;
  _QWORD v20[4];
  CBAdvertiser *v21;
  SKSetupServer *v22;

  v3 = -[CBServer bleListeningPSM](self->_bleServer, "bleListeningPSM");
  if ((_DWORD)v3)
  {
    v4 = v3;
    bleAdvertisePSM = self->_bleAdvertisePSM;
    if ((_DWORD)v3 == bleAdvertisePSM || (bleAdvertiser = self->_bleAdvertiser) == 0)
    {
LABEL_9:
      self->_bleAdvertisePSM = v4;
      v10 = self->_bleAdvertiser;
      if (v10)
      {
LABEL_27:

        return;
      }
      v11 = objc_alloc_init(MEMORY[0x24BDBB218]);
      objc_storeStrong((id *)&self->_bleAdvertiser, v11);
      objc_msgSend(v11, "setDispatchQueue:", self->super._dispatchQueue);
      objc_msgSend(v11, "setNearbyActionFlags:", !self->_skipWifi << 6);
      setupType = self->super._setupType;
      switch(setupType)
      {
        case 1:
          v13 = v11;
          v14 = 37;
          break;
        case 5:
          v13 = v11;
          v14 = 85;
          break;
        case 2:
          v13 = v11;
          v14 = 39;
          break;
        default:
          var0 = self->super._ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          goto LABEL_17;
      }
      objc_msgSend(v13, "setNearbyActionType:", v14);
LABEL_17:
      if (self->super._authTagOverride)
      {
        objc_msgSend(v11, "setNearbyActionFlags:", objc_msgSend(v11, "nearbyActionFlags") | 0x80);
        objc_msgSend(v11, "setNearbyActionAuthTagData:", self->super._authTagOverride);
      }
      v15 = self->super._ucat->var0;
      if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __44__SKSetupServer__bleAdvertiserEnsureStarted__block_invoke;
      v20[3] = &unk_24D22B140;
      v10 = (CBAdvertiser *)v11;
      v21 = v10;
      v22 = self;
      -[CBAdvertiser activateWithCompletion:](v10, "activateWithCompletion:", v20);

      goto LABEL_27;
    }
    v7 = self->super._ucat->var0;
    if (v7 <= 30)
    {
      if (v7 == -1)
      {
        v8 = _LogCategory_Initialize();
        bleAdvertiser = self->_bleAdvertiser;
        if (!v8)
          goto LABEL_8;
        bleAdvertisePSM = self->_bleAdvertisePSM;
      }
      v18 = v4;
      v19 = bleAdvertiser;
      v17 = bleAdvertisePSM;
      LogPrintF();
      bleAdvertiser = self->_bleAdvertiser;
    }
LABEL_8:
    -[CBAdvertiser invalidate](bleAdvertiser, "invalidate", v17, v18, v19);
    v9 = self->_bleAdvertiser;
    self->_bleAdvertiser = 0;

    goto LABEL_9;
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

  self->_bleAdvertisePSM = 0;
}

- (void)_bleServerEnsureStarted
{
  CBServer **p_bleServer;
  id v4;
  uint64_t v5;
  int var0;
  _QWORD v7[6];
  _QWORD v8[6];

  p_bleServer = &self->_bleServer;
  if (!self->_bleServer)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBB298]);
    objc_storeStrong((id *)p_bleServer, v4);
    objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v4, "setBleListenPSM:", 130);
    v5 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __40__SKSetupServer__bleServerEnsureStarted__block_invoke;
    v8[3] = &unk_24D22A798;
    v8[4] = v4;
    v8[5] = self;
    objc_msgSend(v4, "setAcceptHandler:", v8);
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __40__SKSetupServer__bleServerEnsureStarted__block_invoke_2;
    v7[3] = &unk_24D22B140;
    v7[4] = v4;
    v7[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v7);

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

- (void)_nanPublisherEnsureStarted
{
  CUNANPublisher **p_nanPublisher;
  id v4;
  uint64_t v5;
  int var0;
  _QWORD v7[6];
  _QWORD v8[6];

  p_nanPublisher = &self->_nanPublisher;
  if (!self->_nanPublisher)
  {
    v4 = objc_alloc_init(MEMORY[0x24BE297E8]);
    objc_storeStrong((id *)p_nanPublisher, v4);
    objc_msgSend(v4, "setControlFlags:", 1);
    objc_msgSend(v4, "setDispatchQueue:", self->super._dispatchQueue);
    objc_msgSend(v4, "setServiceType:", CFSTR("com.apple.setup"));
    v5 = MEMORY[0x24BDAC760];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke;
    v8[3] = &unk_24D229AD0;
    v8[4] = v4;
    v8[5] = self;
    objc_msgSend(v4, "setReceiveHandler:", v8);
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke_2;
    v7[3] = &unk_24D22B140;
    v7[4] = v4;
    v7[5] = self;
    objc_msgSend(v4, "activateWithCompletion:", v7);

  }
}

- (void)_nanPublisherEnsureStopped
{
  int var0;
  CUNANPublisher *nanPublisher;

  if (self->_nanPublisher)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  -[CUNANPublisher invalidate](self->_nanPublisher, "invalidate");
  nanPublisher = self->_nanPublisher;
  self->_nanPublisher = 0;

}

- (void)_wifiKeepAliveEnsureStarted
{
  int var0;

  if (!self->_wifiManager)
  {
    self->_wifiManager = (__WiFiManagerClient *)WiFiManagerClientCreate();
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)_wifiKeepAliveEnsureStopped
{
  int var0;
  CWFInterface *wifiKeepAliveInterface;
  CWFActivity *wifiKeepAliveActivity;
  __WiFiManagerClient *wifiManager;

  if (self->_wifiKeepAliveInterface)
  {
    var0 = self->super._ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  -[CWFInterface invalidate](self->_wifiKeepAliveInterface, "invalidate");
  wifiKeepAliveInterface = self->_wifiKeepAliveInterface;
  self->_wifiKeepAliveInterface = 0;

  wifiKeepAliveActivity = self->_wifiKeepAliveActivity;
  self->_wifiKeepAliveActivity = 0;

  wifiManager = self->_wifiManager;
  if (wifiManager)
  {
    CFRelease(wifiManager);
    self->_wifiManager = 0;
  }
}

- (void)_handleAcceptBLEConnection:(id)a3
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
    -[SKSetupServer _handleAcceptCommon:](self, "_handleAcceptCommon:", v5);
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

- (void)_handleAcceptNANData:(id)a3 endpoint:(id)a4
{
  id v6;
  id v7;
  SKConnection *v8;
  SKConnection *v9;
  void *v10;
  NSString *v11;
  CUNANPublisher *v12;
  NSString *v13;
  NSString *v14;
  int v15;
  NSString *v16;
  NSString *nanEndpointID;
  int var0;
  _QWORD v19[4];
  SKConnection *v20;
  SKSetupServer *v21;
  CUNANPublisher *v22;
  id v23;

  v6 = a3;
  v7 = a4;
  v8 = self->super._skCnx;
  if (!v8)
  {
    v9 = objc_alloc_init(SKConnection);
    objc_storeStrong((id *)&self->super._skCnx, v9);
    objc_msgSend(v7, "identifier");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    nanEndpointID = self->_nanEndpointID;
    self->_nanEndpointID = v16;

    v12 = self->_nanPublisher;
    if (v12)
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke;
      v19[3] = &unk_24D229AF8;
      v20 = v9;
      v21 = self;
      v22 = v12;
      v23 = v7;
      -[SKConnection setSendDataHandler:](v20, "setSendDataHandler:", v19);

    }
    -[SKSetupServer _handleAcceptCommon:](self, "_handleAcceptCommon:", v9);
    goto LABEL_10;
  }
  v9 = v8;
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_nanEndpointID;
  v12 = v10;
  v13 = v11;
  if (v12 == (CUNANPublisher *)v13)
  {

    goto LABEL_10;
  }
  v14 = v13;
  if ((v12 == 0) != (v13 != 0))
  {
    v15 = -[CUNANPublisher isEqual:](v12, "isEqual:", v13);

    if (!v15)
      goto LABEL_13;
LABEL_10:
    -[SKConnection receivedData:](v9, "receivedData:", v6);
    goto LABEL_11;
  }

LABEL_13:
  var0 = self->super._ucat->var0;
  if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_11:

}

- (void)_handleAcceptCommon:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int var0;
  id v13;
  _QWORD v14[4];
  id v15;
  SKSetupServer *v16;
  _QWORD v17[4];
  id v18;
  SKSetupServer *v19;
  _QWORD v20[4];
  id v21;
  SKSetupServer *v22;
  _QWORD v23[4];
  id v24;
  SKSetupServer *v25;
  _QWORD v26[5];
  _QWORD v27[4];
  id v28;
  SKSetupServer *v29;
  _QWORD v30[4];
  id v31;
  SKSetupServer *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];

  v5 = a3;
  objc_storeStrong((id *)&self->super._skCnx, a3);
  objc_msgSend(v5, "setConditionalPersistent:", -[SKSetupBase conditionalPersistent](self, "conditionalPersistent"));
  objc_msgSend(v5, "setDispatchQueue:", self->super._dispatchQueue);
  objc_msgSend(v5, "setPassword:", self->super._password);
  objc_msgSend(v5, "setPersistentPairing:", -[SKSetupBase persistentPairing](self, "persistentPairing"));
  v6 = MEMORY[0x24BDAC760];
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke;
  v35[3] = &unk_24D22A9C8;
  v35[4] = self;
  objc_msgSend(v5, "setAuthCompletionHandler:", v35);
  v34[0] = v6;
  v34[1] = 3221225472;
  v34[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_2;
  v34[3] = &unk_24D22AA18;
  v34[4] = self;
  objc_msgSend(v5, "setAuthPromptHandler:", v34);
  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_3;
  v33[3] = &unk_24D22AA40;
  v33[4] = self;
  objc_msgSend(v5, "setAuthShowPasswordHandler:", v33);
  objc_msgSend(v5, "setAuthHidePasswordHandler:", self->_authHidePasswordHandler);
  v30[0] = v6;
  v30[1] = 3221225472;
  v30[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_4;
  v30[3] = &unk_24D22B140;
  v7 = v5;
  v31 = v7;
  v32 = self;
  objc_msgSend(v7, "setErrorHandler:", v30);
  v27[0] = v6;
  v27[1] = 3221225472;
  v27[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_5;
  v27[3] = &unk_24D22AFC8;
  v8 = v7;
  v28 = v8;
  v29 = self;
  objc_msgSend(v8, "setInvalidationHandler:", v27);
  v26[0] = v6;
  v26[1] = 3221225472;
  v26[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_6;
  v26[3] = &unk_24D22AA68;
  v26[4] = self;
  objc_msgSend(v8, "setPairSetupConfigHandler:", v26);
  v23[0] = v6;
  v23[1] = 3221225472;
  v23[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_7;
  v23[3] = &unk_24D22AA90;
  v9 = v8;
  v24 = v9;
  v25 = self;
  objc_msgSend(v9, "setReceivedEventHandler:", v23);
  v20[0] = v6;
  v20[1] = 3221225472;
  v20[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_8;
  v20[3] = &unk_24D22B118;
  v10 = v9;
  v21 = v10;
  v22 = self;
  objc_msgSend(v10, "setReceivedRequestHandler:", v20);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_9;
  v17[3] = &unk_24D22AFC8;
  v11 = v10;
  v18 = v11;
  v19 = self;
  objc_msgSend(v11, "setStateChangedHandler:", v17);
  var0 = self->super._ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __37__SKSetupServer__handleAcceptCommon___block_invoke_10;
  v14[3] = &unk_24D22B140;
  v15 = v11;
  v16 = self;
  v13 = v11;
  objc_msgSend(v13, "activateWithCompletion:", v14);

}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (id)authHidePasswordHandler
{
  return self->_authHidePasswordHandler;
}

- (void)setAuthHidePasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (id)authShowPasswordHandler
{
  return self->_authShowPasswordHandler;
}

- (void)setAuthShowPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (id)overallCompletionHandler
{
  return self->_overallCompletionHandler;
}

- (void)setOverallCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSDictionary)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (BOOL)skipWifi
{
  return self->_skipWifi;
}

- (void)setSkipWifi:(BOOL)a3
{
  self->_skipWifi = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_storeStrong(&self->_overallCompletionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_authShowPasswordHandler, 0);
  objc_storeStrong(&self->_authHidePasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_wifiKeepAliveInterface, 0);
  objc_storeStrong((id *)&self->_wifiKeepAliveActivity, 0);
  objc_storeStrong((id *)&self->_nanPublisher, 0);
  objc_storeStrong((id *)&self->_nanEndpointID, 0);
  objc_storeStrong((id *)&self->_bleServer, 0);
  objc_storeStrong((id *)&self->_bleAdvertiser, 0);
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke(uint64_t a1, void *a2)
{
  SKEvent *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 140, v6);
  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", v3);
  v4 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 288));
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v6);

}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  SKAuthenticationRequestEvent *v5;

  v5 = -[SKAuthenticationRequestEvent initWithPasswordType:pairingFlags:throttleSeconds:]([SKAuthenticationRequestEvent alloc], "initWithPasswordType:pairingFlags:throttleSeconds:", a2, a3, a4);
  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", v5);

}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  SKAuthenticationPresentEvent *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = -[SKAuthenticationPresentEvent initWithPasswordType:password:]([SKAuthenticationPresentEvent alloc], "initWithPasswordType:password:", a2, v8);
  objc_msgSend(*(id *)(a1 + 32), "_reportEvent:", v5);
  v6 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 304));
  v7 = v6;
  if (v6)
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, a2, v8);

}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_4(uint64_t a1, void *a2)
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

    objc_msgSend(*(id *)(a1 + 40), "_update");
    v3 = v9;
  }

}

uint64_t __37__SKSetupServer__handleAcceptCommon___block_invoke_5(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 120))
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 40), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    v5 = *(void **)(v1 + 120);
    *(_QWORD *)(v1 + 120) = 0;

    v6 = *(_QWORD *)(v2 + 40);
    v7 = *(void **)(v6 + 240);
    *(_QWORD *)(v6 + 240) = 0;

    objc_msgSend(*(id *)(v2 + 40), "_connectionEnded:", *(_QWORD *)(v2 + 32));
    objc_msgSend(*(id *)(v2 + 40), "_reportEventType:", 41);
    return objc_msgSend(*(id *)(v2 + 40), "_update");
  }
  return result;
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_6(uint64_t a1, void *a2)
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

_QWORD *__37__SKSetupServer__handleAcceptCommon___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v5 == result[15])
    return (_QWORD *)objc_msgSend(result, "_receivedEventID:event:options:", a2, a3, a4);
  return result;
}

_QWORD *__37__SKSetupServer__handleAcceptCommon___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v6 == result[15])
    return (_QWORD *)objc_msgSend(result, "_receivedRequestID:request:options:responseHandler:", a2, a3, a4, a5);
  return result;
}

_QWORD *__37__SKSetupServer__handleAcceptCommon___block_invoke_9(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v2 == result[15])
    return (_QWORD *)objc_msgSend(result, "_update");
  return result;
}

void __37__SKSetupServer__handleAcceptCommon___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _DWORD **v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v14 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v4 + 120))
  {
    v8 = **(_DWORD **)(v4 + 144);
    if (v3)
    {
      if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v13);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v10 + 120);
      *(_QWORD *)(v10 + 120) = 0;

    }
    else
    {
      if (v8 <= 30)
      {
        if (v8 != -1 || (v12 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 40), v12))
        {
          LogPrintF();
          v4 = *(_QWORD *)(a1 + 40);
        }
      }
      objc_msgSend((id)v4, "_reportEventType:", 40);
    }
    objc_msgSend(*(id *)(a1 + 40), "_update");
  }
  else
  {
    NSErrorF_safe();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_DWORD ***)(a1 + 40);
    v7 = *v6[18];
    if (v7 <= 90)
    {
      if (v7 != -1 || (v9 = _LogCategory_Initialize(), v6 = *(_DWORD ***)(a1 + 40), v9))
      {
        CUPrintNSError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v6 = *(_DWORD ***)(a1 + 40);
      }
    }
    objc_msgSend(v6, "_update", v13);

  }
}

void __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  v3 = a2;
  v4 = a1[5];
  if (a1[4] == *(_QWORD *)(v4 + 120))
  {
    v5 = (void *)a1[6];
    if (v5 == *(void **)(v4 + 248))
    {
      v6 = a1[7];
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke_2;
      v7[3] = &unk_24D22A9C8;
      v7[4] = v4;
      objc_msgSend(v5, "sendMessageData:endpoint:completionHandler:", v3, v6, v7);
    }
  }

}

void __47__SKSetupServer__handleAcceptNANData_endpoint___block_invoke_2(uint64_t a1, void *a2)
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

_QWORD *__43__SKSetupServer__nanPublisherEnsureStarted__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v4 == result[31])
    return (_QWORD *)objc_msgSend(result, "_handleAcceptNANData:endpoint:", a2, a3);
  return result;
}

void __43__SKSetupServer__nanPublisherEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SKEvent *v10;
  int v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v5 + 248))
  {
    v6 = **(_DWORD **)(v5 + 144);
    if (v3)
    {
      v13 = v3;
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v12);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 248);
      *(_QWORD *)(v7 + 248) = 0;

      v9 = *(void **)(a1 + 40);
      v10 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 42, v13);
      objc_msgSend(v9, "_reportEvent:", v10);

      goto LABEL_11;
    }
    if (v6 <= 30)
    {
      v13 = 0;
      if (v6 != -1 || (v11 = _LogCategory_Initialize(), v4 = 0, v11))
      {
        LogPrintF();
LABEL_11:
        v4 = v13;
      }
    }
  }

}

void __40__SKSetupServer__bleServerEnsureStarted__block_invoke(uint64_t a1, void *a2, void *a3)
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
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v6 + 224))
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
    objc_msgSend((id)v6, "_handleAcceptBLEConnection:", v9, v11);
    objc_msgSend(*(id *)(a1 + 40), "_update");
    v5[2](v5, 0);
    goto LABEL_9;
  }
  NSErrorF_safe();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v5)[2](v5, v7);

LABEL_9:
}

void __40__SKSetupServer__bleServerEnsureStarted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SKEvent *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4 == *(void **)(v5 + 224))
  {
    v6 = **(_DWORD **)(v5 + 144);
    v14 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v12);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 224);
      *(_QWORD *)(v7 + 224) = 0;

      v9 = *(void **)(a1 + 40);
      v10 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 42, v14);
      objc_msgSend(v9, "_reportEvent:", v10);

      goto LABEL_13;
    }
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        v13 = objc_msgSend(v4, "bleListeningPSM");
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 40), "_update", v13);
LABEL_13:
        v3 = v14;
        goto LABEL_14;
      }
      v11 = _LogCategory_Initialize();
      v5 = *(_QWORD *)(a1 + 40);
      if (v11)
      {
        v4 = *(void **)(a1 + 32);
        goto LABEL_8;
      }
    }
    objc_msgSend((id)v5, "_update", v12);
    goto LABEL_13;
  }
LABEL_14:

}

void __44__SKSetupServer__bleAdvertiserEnsureStarted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SKEvent *v10;
  int v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v5 == *(_QWORD *)(v4 + 216))
  {
    v6 = **(_DWORD **)(v4 + 144);
    v14 = v3;
    if (v3)
    {
      if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      objc_msgSend(*(id *)(a1 + 32), "invalidate", v12);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 216);
      *(_QWORD *)(v7 + 216) = 0;

      v9 = *(void **)(a1 + 40);
      v10 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 42, v14);
      objc_msgSend(v9, "_reportEvent:", v10);

      goto LABEL_13;
    }
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
LABEL_8:
        v13 = v5;
        LogPrintF();
        objc_msgSend(*(id *)(a1 + 40), "_update", v13);
LABEL_13:
        v3 = v14;
        goto LABEL_14;
      }
      v11 = _LogCategory_Initialize();
      v4 = *(_QWORD *)(a1 + 40);
      if (v11)
      {
        v5 = *(_QWORD *)(a1 + 32);
        goto LABEL_8;
      }
    }
    objc_msgSend((id)v4, "_update", v12);
    goto LABEL_13;
  }
LABEL_14:

}

uint64_t __40__SKSetupServer__prepareStepsOSRecovery__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (!a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (*(_BYTE *)(v2 + 280))
      *(_BYTE *)(v2 + 232) = 1;
  }
  return result;
}

void __40__SKSetupServer__prepareStepsOSRecovery__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  SKEvent *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = -[SKEvent initWithEventType:error:]([SKEvent alloc], "initWithEventType:error:", 20, v4);

  objc_msgSend(v3, "_reportEvent:", v5);
  if (!v4)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 232) = 1;
}

uint64_t __22__SKSetupServer_reset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 144);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v2 + 232) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __41__SKSetupServer__activateWithCompletion___block_invoke(_QWORD *a1)
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

uint64_t __40__SKSetupServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
