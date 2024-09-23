@implementation SFRemoteAutoFillService

- (SFRemoteAutoFillService)init
{
  SFRemoteAutoFillService *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFRemoteAutoFillService;
  v2 = -[SFRemoteAutoFillService init](&v6, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  SFRemoteAutoFillService *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFRemoteAutoFillService *)FatalErrorF();
    -[SFRemoteAutoFillService description](v3, v4);
  }
  else
  {
    -[SFRemoteAutoFillService _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFRemoteAutoFillService;
    -[SFRemoteAutoFillService dealloc](&v5, sel_dealloc);
  }
}

- (id)description
{
  id v3;
  const __CFString *v4;
  const char *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("SFRemoteAutoFillService"));
  if (self->_activateCalled)
  {
    v4 = CFSTR(", activated");
  }
  else
  {
    if (!self->_invalidateCalled)
      goto LABEL_6;
    v4 = CFSTR(", invalidated");
  }
  objc_msgSend(v3, "appendString:", v4);
LABEL_6:
  if (self->_receivedUsername)
    objc_msgSend(v3, "appendString:", CFSTR(", username"));
  if (self->_receivedPassword)
    objc_msgSend(v3, "appendString:", CFSTR(", password"));
  if (self->_service)
    v5 = "active";
  else
    v5 = "inactive";
  objc_msgSend(v3, "appendFormat:", CFSTR(", service: %s"), v5);
  return v3;
}

- (void)_cleanup
{
  id activateCompletion;
  id discoveredDevicesChanged;
  id errorHandler;
  id receivedCredentialsHandler;
  NSString *receivedPassword;
  NSString *receivedUsername;
  NSData *systemBTAddress;
  NSURL *urlForVisualScanning;
  NSMutableDictionary *devices;

  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  discoveredDevicesChanged = self->_discoveredDevicesChanged;
  self->_discoveredDevicesChanged = 0;

  self->_discoveryState = 0;
  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  receivedCredentialsHandler = self->_receivedCredentialsHandler;
  self->_receivedCredentialsHandler = 0;

  receivedPassword = self->_receivedPassword;
  self->_receivedPassword = 0;

  receivedUsername = self->_receivedUsername;
  self->_receivedUsername = 0;

  self->_requestingAutoFill = 0;
  self->_serviceState = 0;
  systemBTAddress = self->_systemBTAddress;
  self->_systemBTAddress = 0;

  self->_systemMonitorState = 0;
  urlForVisualScanning = self->_urlForVisualScanning;
  self->_urlForVisualScanning = 0;

  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  devices = self->_devices;
  self->_devices = 0;

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
  v7[2] = __50__SFRemoteAutoFillService_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __50__SFRemoteAutoFillService_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id activateCompletion;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CFPrefs_GetInt64() || self->_unitTesting)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_activateCalled = 1;
    v5 = _Block_copy(v4);
    activateCompletion = self->_activateCompletion;
    self->_activateCompletion = v5;

    -[SFRemoteAutoFillService _systemMonitorStart](self, "_systemMonitorStart");
    -[SFRemoteAutoFillService _serviceStart](self, "_serviceStart");
    -[SFRemoteAutoFillService _discoveryStart](self, "_discoveryStart");
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillService <= 50
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB2F90];
      v14 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("?");
      if (v9)
        v11 = (const __CFString *)v9;
      v15[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, -6735, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v4 + 2))(v4, v13);

    }
  }

}

- (void)_activated
{
  int discoveryState;
  BOOL v4;
  int serviceState;
  BOOL v6;
  int systemMonitorState;
  void (**activateCompletion)(id, _QWORD);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  discoveryState = self->_discoveryState;
  v4 = discoveryState == 4 || discoveryState == 2;
  if (!v4 || !self->_discovery)
  {
    if (gLogCategory_SFRemoteAutoFillService > 30
      || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_26;
  }
  serviceState = self->_serviceState;
  v6 = serviceState == 4 || serviceState == 2;
  if (!v6 || !self->_service)
  {
    if (gLogCategory_SFRemoteAutoFillService > 30
      || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_26;
  }
  systemMonitorState = self->_systemMonitorState;
  if (systemMonitorState != 2 && systemMonitorState != 4)
  {
    if (gLogCategory_SFRemoteAutoFillService > 30
      || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_26:
    LogPrintF();
    return;
  }
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  activateCompletion = (void (**)(id, _QWORD))self->_activateCompletion;
  if (activateCompletion)
  {
    activateCompletion[2](activateCompletion, 0);
    activateCompletion = (void (**)(id, _QWORD))self->_activateCompletion;
  }
  self->_activateCompletion = 0;

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFRemoteAutoFillService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFRemoteAutoFillService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48)
    && gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "invalidate");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "invalidate");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 112);
  *(_QWORD *)(v8 + 112) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)startRequestingAutoFill
{
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void (**errorHandler)(id, void *);
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = -[SFRemoteAutoFillService _readyForAutoFillRequest](self, "_readyForAutoFillRequest");
  if (v3)
  {
    v4 = v3;
    if (gLogCategory_SFRemoteAutoFillService <= 60
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = *MEMORY[0x1E0CB2F90];
      v14 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("?");
      if (v7)
        v9 = (const __CFString *)v7;
      v15[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v4, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    errorHandler = (void (**)(id, void *))self->_errorHandler;
    if (errorHandler)
    {
      NSErrorWithOSStatusF();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      errorHandler[2](errorHandler, v12);

    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillService <= 50
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFService setNeedsSetup:](self->_service, "setNeedsSetup:", 1);
    self->_requestingAutoFill = 1;
  }
}

- (void)stopRequestingAutoFill
{
  uint64_t v3;
  id v4;

  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFSession peer](self->_session, "peer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SFService sendToPeer:flags:object:](self->_service, "sendToPeer:flags:object:", v4, 0, &unk_1E4891188, v4);
    }
    else
    {
      -[SFService sendToPeer:flags:object:](self->_service, "sendToPeer:flags:object:", v4, 0, &unk_1E4891188, v3);
    }
  }
  -[SFService setNeedsSetup:](self->_service, "setNeedsSetup:", 0);
  self->_requestingAutoFill = 0;

}

- (id)urlForVisualScanning
{
  -[SFRemoteAutoFillService updateURLForVisualScanning](self, "updateURLForVisualScanning");
  return self->_urlForVisualScanning;
}

- (void)updateURLForVisualScanning
{
  NSString *fixedPIN;
  NSData *systemBTAddress;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSURL *v13;
  NSURL *v14;
  NSURL *v15;
  NSURL *v16;
  char v17;
  NSURL *urlForVisualScanning;
  NSObject *dispatchQueue;
  void *v20;
  _QWORD block[5];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  fixedPIN = self->_fixedPIN;
  if (!fixedPIN || !-[NSString length](fixedPIN, "length"))
    goto LABEL_12;
  systemBTAddress = self->_systemBTAddress;
  if (!systemBTAddress)
  {
    if (self->_unitTesting)
      goto LABEL_7;
LABEL_12:
    urlForVisualScanning = self->_urlForVisualScanning;
    self->_urlForVisualScanning = 0;

    return;
  }
  if (!self->_unitTesting)
  {
    SFHexStringForData(systemBTAddress);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "symbolCharacterSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
LABEL_7:
  v7 = CFSTR("a1b2c3d4e5f6");
LABEL_8:
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", CFSTR("https://autofill.apple.com/"));
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("bt"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("pin"), self->_fixedPIN);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryItems:", v11);

  objc_msgSend(v8, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = self->_urlForVisualScanning;
  v14 = v12;
  v15 = v13;
  if (v14 != v15)
  {
    v16 = v15;
    if ((v14 == 0) != (v15 != 0))
    {
      v17 = -[NSURL isEqual:](v14, "isEqual:", v15);

      if ((v17 & 1) != 0)
        goto LABEL_20;
    }
    else
    {

    }
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      -[NSURL absoluteString](v14, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_storeStrong((id *)&self->_urlForVisualScanning, v12);
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SFRemoteAutoFillService_updateURLForVisualScanning__block_invoke;
    block[3] = &unk_1E482DF78;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
    goto LABEL_20;
  }

LABEL_20:
}

uint64_t __53__SFRemoteAutoFillService_updateURLForVisualScanning__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v1 + 264);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v1 + 128));
  return result;
}

- (unint64_t)discoveredDevices
{
  unint64_t result;

  result = (unint64_t)self->_devices;
  if (result)
    return objc_msgSend((id)result, "count");
  return result;
}

- (void)setBundleID:(id)a3
{
  id v5;
  SFRemoteAutoFillService *v6;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v5 = a3;
  if (-[SFService needsSetup](self->_service, "needsSetup"))
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_errorHandler)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__SFRemoteAutoFillService_setBundleID___block_invoke;
      block[3] = &unk_1E482DF78;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_bundleID, a3);
    objc_sync_exit(v6);

  }
}

void __39__SFRemoteAutoFillService_setBundleID___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  NSErrorWithOSStatusF();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)setFixedPIN:(id)a3
{
  SFRemoteAutoFillService *v5;
  SFService *service;
  id v7;

  v7 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_storeStrong((id *)&v5->_fixedPIN, a3);
  service = v5->_service;
  if (service)
    -[SFService setFixedPIN:](service, "setFixedPIN:", v5->_fixedPIN);
  -[SFRemoteAutoFillService updateURLForVisualScanning](v5, "updateURLForVisualScanning");
  objc_sync_exit(v5);

}

- (void)setShowPINHandlerEx:(id)a3
{
  SFRemoteAutoFillService *v4;
  void *v5;
  id showPINHandlerEx;
  SFService *service;
  id aBlock;

  aBlock = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = _Block_copy(aBlock);
  showPINHandlerEx = v4->_showPINHandlerEx;
  v4->_showPINHandlerEx = v5;

  service = v4->_service;
  if (service)
    -[SFService setShowPINHandlerEx:](service, "setShowPINHandlerEx:", v4->_showPINHandlerEx);
  objc_sync_exit(v4);

}

- (void)setUrlString:(id)a3
{
  id v5;
  SFRemoteAutoFillService *v6;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v5 = a3;
  if (-[SFService needsSetup](self->_service, "needsSetup"))
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_errorHandler)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__SFRemoteAutoFillService_setUrlString___block_invoke;
      block[3] = &unk_1E482DF78;
      block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
  else
  {
    v6 = self;
    objc_sync_enter(v6);
    objc_storeStrong((id *)&v6->_urlString, a3);
    objc_sync_exit(v6);

  }
}

void __40__SFRemoteAutoFillService_setUrlString___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  NSErrorWithOSStatusF();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_completedWithError:(id)a3
{
  id v4;
  int v5;
  void (**errorHandler)(id, id);
  void (**receivedCredentialsHandler)(id, NSString *, NSString *, _QWORD);
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60)
    {
      if (gLogCategory_SFRemoteAutoFillService != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
      {
        LogPrintF();
        v4 = v8;
      }
    }
    errorHandler = (void (**)(id, id))self->_errorHandler;
    if (errorHandler)
    {
      errorHandler[2](errorHandler, v4);
      v4 = v8;
    }
  }
  receivedCredentialsHandler = (void (**)(id, NSString *, NSString *, _QWORD))self->_receivedCredentialsHandler;
  if (receivedCredentialsHandler)
  {
    ((void (**)(id, NSString *, NSString *, id))receivedCredentialsHandler)[2](receivedCredentialsHandler, self->_receivedUsername, self->_receivedPassword, v8);
    v4 = v8;
  }

}

- (int)_readyForAutoFillRequest
{
  int discoveryState;
  BOOL v3;
  int serviceState;

  if (!self->_activateCalled)
    return -6709;
  if (!self->_invalidateCalled)
  {
    discoveryState = self->_discoveryState;
    v3 = discoveryState == 4 || discoveryState == 2;
    if (v3 && self->_discovery)
    {
      serviceState = self->_serviceState;
      if ((serviceState == 4 || serviceState == 2) && self->_service)
        return 0;
      if (gLogCategory_SFRemoteAutoFillService > 60
        || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
      {
        return -6745;
      }
    }
    else if (gLogCategory_SFRemoteAutoFillService > 60
           || gLogCategory_SFRemoteAutoFillService == -1 && !_LogCategory_Initialize())
    {
      return -6745;
    }
    LogPrintF();
    return -6745;
  }
  return -6724;
}

- (void)_discoveryStart
{
  SFDeviceDiscovery *v3;
  SFDeviceDiscovery *discovery;
  uint64_t v5;
  SFDeviceDiscovery *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  if (!self->_discovery)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_discoveryState = 1;
    v3 = objc_alloc_init(SFDeviceDiscovery);
    discovery = self->_discovery;
    self->_discovery = v3;

    -[SFDeviceDiscovery setChangeFlags:](self->_discovery, "setChangeFlags:", 13);
    -[SFDeviceDiscovery setDiscoveryFlags:](self->_discovery, "setDiscoveryFlags:", 8208);
    -[SFDeviceDiscovery setDispatchQueue:](self->_discovery, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceDiscovery setFastScanMode:](self->_discovery, "setFastScanMode:", 1);
    -[SFDeviceDiscovery setPurpose:](self->_discovery, "setPurpose:", CFSTR("SFRemoteAutoFillService"));
    -[SFDeviceDiscovery setRssiThreshold:](self->_discovery, "setRssiThreshold:", -60);
    -[SFDeviceDiscovery setScanRate:](self->_discovery, "setScanRate:", 40);
    v5 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke;
    v11[3] = &unk_1E482F938;
    v11[4] = self;
    -[SFDeviceDiscovery setDeviceFoundHandler:](self->_discovery, "setDeviceFoundHandler:", v11);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke_2;
    v10[3] = &unk_1E482F938;
    v10[4] = self;
    -[SFDeviceDiscovery setDeviceLostHandler:](self->_discovery, "setDeviceLostHandler:", v10);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke_3;
    v9[3] = &unk_1E482F960;
    v9[4] = self;
    -[SFDeviceDiscovery setDeviceChangedHandler:](self->_discovery, "setDeviceChangedHandler:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke_4;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[SFDeviceDiscovery setInterruptionHandler:](self->_discovery, "setInterruptionHandler:", v8);
    -[SFDeviceDiscovery setInvalidationHandler:](self->_discovery, "setInvalidationHandler:", &__block_literal_global_15);
    v6 = self->_discovery;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __42__SFRemoteAutoFillService__discoveryStart__block_invoke_6;
    v7[3] = &unk_1E482DFF0;
    v7[4] = self;
    -[SFDeviceDiscovery activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }
}

uint64_t __42__SFRemoteAutoFillService__discoveryStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoveryFound:", a2);
}

uint64_t __42__SFRemoteAutoFillService__discoveryStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoveryLost:", a2);
}

uint64_t __42__SFRemoteAutoFillService__discoveryStart__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_discoveryChanged:", a2);
}

void __42__SFRemoteAutoFillService__discoveryStart__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;

  if (gLogCategory_SFRemoteAutoFillService <= 60
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_completedWithError:", v3);

}

void __42__SFRemoteAutoFillService__discoveryStart__block_invoke_5()
{
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __42__SFRemoteAutoFillService__discoveryStart__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!v7)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 4;
    goto LABEL_16;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 136))
  {
    if (gLogCategory_SFRemoteAutoFillService <= 50
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 2;
LABEL_16:
    *(_DWORD *)(v3 + 32) = v4;
    objc_msgSend(*(id *)(a1 + 32), "_activated");
    goto LABEL_19;
  }
  if (gLogCategory_SFRemoteAutoFillService <= 60
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 3;
  v5 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_completedWithError:", v6);

LABEL_19:
}

- (void)_discoveryFound:(id)a3
{
  void *v4;
  BOOL v5;
  NSMutableDictionary *devices;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void (**discoveredDevicesChanged)(id, uint64_t);
  id v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_discovery)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5 && objc_msgSend(v11, "deviceActionType") == 22)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 10
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      v10 = v11;
      LogPrintF();
    }
    devices = self->_devices;
    if (!devices)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = self->_devices;
      self->_devices = v7;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v11, v4, v10);
    discoveredDevicesChanged = (void (**)(id, uint64_t))self->_discoveredDevicesChanged;
    if (discoveredDevicesChanged)
      discoveredDevicesChanged[2](discoveredDevicesChanged, -[NSMutableDictionary count](self->_devices, "count"));
  }

}

- (void)_discoveryLost:(id)a3
{
  void *v4;
  void (**discoveredDevicesChanged)(id, uint64_t);
  id v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4 && self->_discovery && objc_msgSend(v7, "deviceActionType") == 22)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 10
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      v6 = v7;
      LogPrintF();
    }
    -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v4, v6);
    discoveredDevicesChanged = (void (**)(id, uint64_t))self->_discoveredDevicesChanged;
    if (discoveredDevicesChanged)
      discoveredDevicesChanged[2](discoveredDevicesChanged, -[NSMutableDictionary count](self->_devices, "count"));
  }

}

- (void)_discoveryChanged:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4 && self->_discovery && objc_msgSend(v5, "deviceActionType") == 22)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_devices, "setObject:forKeyedSubscript:", v5, v4);

}

- (void)_serviceStart
{
  SFService *v3;
  SFService *service;
  uint64_t v5;
  SFService *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  if (!self->_service)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_serviceState = 1;
    v3 = objc_alloc_init(SFService);
    service = self->_service;
    self->_service = v3;

    -[SFService setAdvertiseRate:](self->_service, "setAdvertiseRate:", 50);
    -[SFService setDeviceActionType:](self->_service, "setDeviceActionType:", 19);
    -[SFService setDispatchQueue:](self->_service, "setDispatchQueue:", self->_dispatchQueue);
    -[SFService setFixedPIN:](self->_service, "setFixedPIN:", self->_fixedPIN);
    -[SFService setIdentifier:](self->_service, "setIdentifier:", CFSTR("com.apple.sharing.RemoteAutoFill"));
    -[SFService setLabel:](self->_service, "setLabel:", CFSTR("SFRemoteAutoFillService"));
    -[SFService setNeedsSetup:](self->_service, "setNeedsSetup:", 0);
    -[SFService setPinType:](self->_service, "setPinType:", 1);
    -[SFService setSessionFlags:](self->_service, "setSessionFlags:", 20);
    v5 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke;
    v12[3] = &unk_1E482DF78;
    v12[4] = self;
    -[SFService setHidePINHandler:](self->_service, "setHidePINHandler:", v12);
    -[SFService setInvalidationHandler:](self->_service, "setInvalidationHandler:", &__block_literal_global_161);
    if (self->_showPINHandlerEx)
      -[SFService setShowPINHandlerEx:](self->_service, "setShowPINHandlerEx:");
    v11[0] = v5;
    v11[1] = 3221225472;
    v11[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_3;
    v11[3] = &unk_1E482DF78;
    v11[4] = self;
    -[SFService setInterruptionHandler:](self->_service, "setInterruptionHandler:", v11);
    -[SFService setPeerDisconnectedHandler:](self->_service, "setPeerDisconnectedHandler:", &__block_literal_global_165);
    -[SFService setReceivedObjectHandler:](self->_service, "setReceivedObjectHandler:", &__block_literal_global_168);
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_6;
    v10[3] = &unk_1E482FA08;
    v10[4] = self;
    -[SFService setReceivedRequestHandler:](self->_service, "setReceivedRequestHandler:", v10);
    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_7;
    v9[3] = &unk_1E482FA30;
    v9[4] = self;
    -[SFService setSessionStartedHandler:](self->_service, "setSessionStartedHandler:", v9);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_8;
    v8[3] = &unk_1E482FA58;
    v8[4] = self;
    -[SFService setSessionEndedHandler:](self->_service, "setSessionEndedHandler:", v8);
    -[SFService setSessionSecuredHandler:](self->_service, "setSessionSecuredHandler:", &__block_literal_global_174);
    v6 = self->_service;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __40__SFRemoteAutoFillService__serviceStart__block_invoke_10;
    v7[3] = &unk_1E482DFF0;
    v7[4] = self;
    -[SFService activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }
}

uint64_t __40__SFRemoteAutoFillService__serviceStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serviceHidePIN");
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_2()
{
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_completedWithError:", v2);

}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a4;
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __40__SFRemoteAutoFillService__serviceStart__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serviceHandleReceivedRequest:handler:", a4, a5);
}

uint64_t __40__SFRemoteAutoFillService__serviceStart__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serviceSessionStarted:", a2);
}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v8, "peer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    LogPrintF();

  }
  objc_msgSend(*(id *)(a1 + 32), "_serviceSessionEnded:withError:", v8, v5, v6, v7);

}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFRemoteAutoFillService <= 30)
  {
    v6 = v2;
    if (gLogCategory_SFRemoteAutoFillService != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      objc_msgSend(v3, "peer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v6;
    }
  }

}

void __40__SFRemoteAutoFillService__serviceStart__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (!v7)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 4;
    goto LABEL_16;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 136))
  {
    if (gLogCategory_SFRemoteAutoFillService <= 50
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 2;
LABEL_16:
    *(_DWORD *)(v3 + 88) = v4;
    objc_msgSend(*(id *)(a1 + 32), "_activated");
    goto LABEL_19;
  }
  if (gLogCategory_SFRemoteAutoFillService <= 90
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = 3;
  v5 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_completedWithError:", v6);

LABEL_19:
}

- (void)_serviceHandleReceivedContextRequest:(id)a3 handler:(id)a4
{
  void (**v6)(id, uint64_t, void *, void *);
  id v7;
  void *v8;
  NSData *appIconData;
  NSArray *associatedDomains;
  NSString *bundleID;
  NSString *localizedAppName;
  NSString *unlocalizedAppName;
  NSString *urlString;
  void *v15;
  id v16;

  v16 = a3;
  v6 = (void (**)(id, uint64_t, void *, void *))a4;
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = v7;
  appIconData = self->_appIconData;
  if (appIconData)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", appIconData, CFSTR("aid"));
  associatedDomains = self->_associatedDomains;
  if (associatedDomains)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", associatedDomains, CFSTR("ass"));
  bundleID = self->_bundleID;
  if (bundleID)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", bundleID, CFSTR("bid"));
  localizedAppName = self->_localizedAppName;
  if (localizedAppName)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", localizedAppName, CFSTR("lan"));
  unlocalizedAppName = self->_unlocalizedAppName;
  if (unlocalizedAppName)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", unlocalizedAppName, CFSTR("uan"));
  urlString = self->_urlString;
  if (urlString)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", urlString, CFSTR("url"));
  if (self->_bundleID || self->_urlString)
  {
    v15 = 0;
  }
  else
  {
    NSErrorWithOSStatusF();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6[2](v6, 1, v15, v8);

}

- (void)_serviceHandleReceivedCredentialRequest:(id)a3 handler:(id)a4
{
  void (**v6)(id, uint64_t, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = (void (**)(id, uint64_t, void *, _QWORD))a4;
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      IsAppleInternalBuild();
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_receivedUsername, v7);
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      IsAppleInternalBuild();
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_receivedPassword, v8);
  }
  if (self->_receivedUsername || self->_receivedPassword)
  {
    v9 = 0;
  }
  else
  {
    NSErrorWithOSStatusF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6[2](v6, 1, v9, MEMORY[0x1E0C9AA70]);
  -[SFRemoteAutoFillService _completedWithError:](self, "_completedWithError:", v9);

}

- (void)_serviceHandleReceivedRequest:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 Int64Ranged;
  const char *v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFRemoteAutoFillService <= 50
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 5u)
      v9 = "?";
    else
      v9 = off_1E482FA98[(char)Int64Ranged];
    v18 = v9;
    LogPrintF();
  }
  if (Int64Ranged == 3)
  {
    -[SFRemoteAutoFillService _serviceHandleReceivedCredentialRequest:handler:](self, "_serviceHandleReceivedCredentialRequest:handler:", v6, v7);
  }
  else if (Int64Ranged == 1)
  {
    -[SFRemoteAutoFillService _serviceHandleReceivedContextRequest:handler:](self, "_serviceHandleReceivedContextRequest:handler:", v6, v7);
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      if (Int64Ranged > 5u)
        v10 = "?";
      else
        v10 = off_1E482FAC8[(char)Int64Ranged];
      v18 = v10;
      v19 = Int64Ranged;
      LogPrintF();
    }
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2F90];
    v20 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("?");
    if (v13)
      v15 = (const __CFString *)v13;
    v21[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1, v18, v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -6735, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *, _QWORD))v7 + 2))(v7, 0, v17, 0);

  }
}

- (void)_serviceHidePIN
{
  void (**hidePINHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  hidePINHandler = (void (**)(void))self->_hidePINHandler;
  if (hidePINHandler)
  {
    hidePINHandler[2]();
  }
  else if (gLogCategory_SFRemoteAutoFillService <= 60
         && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_serviceSessionEnded:(id)a3 withError:(id)a4
{
  id v6;
  SFSession *v7;
  int v8;
  void (**sessionEndedHandler)(id, void *);
  void *v10;
  SFSession *session;
  void *v12;
  SFSession *v13;

  v13 = (SFSession *)a3;
  v6 = a4;
  v7 = v13;
  if (self->_session == v13)
  {
    if (v13)
    {
      if (gLogCategory_SFRemoteAutoFillService <= 30)
      {
        if (gLogCategory_SFRemoteAutoFillService != -1 || (v8 = _LogCategory_Initialize(), v7 = v13, v8))
        {
          -[SFSession peer](v7, "peer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
      }
    }
    sessionEndedHandler = (void (**)(id, void *))self->_sessionEndedHandler;
    if (sessionEndedHandler)
    {
      -[SFSession peer](v13, "peer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      sessionEndedHandler[2](sessionEndedHandler, v10);

    }
    session = self->_session;
    self->_session = 0;

    if (self->_requestingAutoFill)
      -[SFService setNeedsSetup:](self->_service, "setNeedsSetup:", 1);
  }

}

- (void)_serviceSessionStarted:(id)a3
{
  id v5;
  void *v6;
  SFSession **p_session;
  void *v8;
  int v9;
  void (**sessionStartedHandler)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = v5;
  p_session = &self->_session;
  if (self->_session)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 60)
    {
      v14 = v5;
      if (gLogCategory_SFRemoteAutoFillService != -1 || (v9 = _LogCategory_Initialize(), v6 = v14, v9))
      {
        objc_msgSend(v6, "peer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFSession peer](*p_session, "peer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

LABEL_15:
        v6 = v14;
      }
    }
  }
  else
  {
    v14 = v5;
    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v14, "peer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_storeStrong((id *)&self->_session, a3);
    sessionStartedHandler = (void (**)(id, void *))self->_sessionStartedHandler;
    if (sessionStartedHandler)
    {
      objc_msgSend(v14, "peer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      sessionStartedHandler[2](sessionStartedHandler, v11);

    }
    v6 = v14;
    if (self->_requestingAutoFill)
    {
      -[SFService setNeedsSetup:](self->_service, "setNeedsSetup:", 0);
      goto LABEL_15;
    }
  }

}

- (void)_systemMonitorStart
{
  CUSystemMonitor *v3;
  CUSystemMonitor *systemMonitor;
  uint64_t v5;
  CUSystemMonitor *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (!self->_systemMonitor)
  {
    self->_systemMonitorState = 1;
    v3 = (CUSystemMonitor *)objc_alloc_init(MEMORY[0x1E0D1B458]);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v3;

    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[CUSystemMonitor setBluetoothAddressChangedHandler:](self->_systemMonitor, "setBluetoothAddressChangedHandler:", v8);
    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    -[CUSystemMonitor setInvalidationHandler:](self->_systemMonitor, "setInvalidationHandler:", &__block_literal_global_212);
    v6 = self->_systemMonitor;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke_3;
    v7[3] = &unk_1E482DF78;
    v7[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }
}

uint64_t __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bluetoothAddressChanged");
}

void __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke_2()
{
  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __46__SFRemoteAutoFillService__systemMonitorStart__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;

  if (gLogCategory_SFRemoteAutoFillService <= 30
    && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120) = 4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "bluetoothAddressData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 104);
  *(_QWORD *)(v3 + 104) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  if (v5)
  {
    if (gLogCategory_SFRemoteAutoFillService <= 10)
    {
      if (gLogCategory_SFRemoteAutoFillService == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_15;
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      }
      v7 = v5;
      goto LABEL_11;
    }
  }
  else if (gLogCategory_SFRemoteAutoFillService <= 60
         && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
  {
LABEL_11:
    LogPrintF();
  }
LABEL_15:
  objc_msgSend(*(id *)(a1 + 32), "updateURLForVisualScanning", v7);
  return objc_msgSend(*(id *)(a1 + 32), "_activated");
}

- (void)_bluetoothAddressChanged
{
  CUSystemMonitor *systemMonitor;
  NSData *v4;
  NSData *systemBTAddress;

  systemMonitor = self->_systemMonitor;
  if (systemMonitor)
  {
    -[CUSystemMonitor bluetoothAddressData](systemMonitor, "bluetoothAddressData");
    v4 = (NSData *)objc_claimAutoreleasedReturnValue();
    systemBTAddress = self->_systemBTAddress;
    self->_systemBTAddress = v4;

    if (gLogCategory_SFRemoteAutoFillService <= 30
      && (gLogCategory_SFRemoteAutoFillService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFRemoteAutoFillService updateURLForVisualScanning](self, "updateURLForVisualScanning");
  }
}

- (BOOL)needsSetup
{
  SFService *service;

  service = self->_service;
  if (service)
    LOBYTE(service) = -[SFService needsSetup](service, "needsSetup");
  return (char)service;
}

- (NSData)appIconData
{
  return self->_appIconData;
}

- (void)setAppIconData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)unlocalizedAppName
{
  return self->_unlocalizedAppName;
}

- (void)setUnlocalizedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)urlString
{
  return self->_urlString;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)receivedCredentialsHandler
{
  return self->_receivedCredentialsHandler;
}

- (void)setReceivedCredentialsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)sessionStartedHandler
{
  return self->_sessionStartedHandler;
}

- (void)setSessionStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (id)discoveredDevicesChanged
{
  return self->_discoveredDevicesChanged;
}

- (void)setDiscoveredDevicesChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (id)urlForVisualScanningChanged
{
  return self->_urlForVisualScanningChanged;
}

- (void)setUrlForVisualScanningChanged:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)unitTesting
{
  return self->_unitTesting;
}

- (void)setUnitTesting:(BOOL)a3
{
  self->_unitTesting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_urlForVisualScanningChanged, 0);
  objc_storeStrong(&self->_discoveredDevicesChanged, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartedHandler, 0);
  objc_storeStrong(&self->_receivedCredentialsHandler, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_unlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_appIconData, 0);
  objc_storeStrong((id *)&self->_urlForVisualScanning, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_systemBTAddress, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_receivedUsername, 0);
  objc_storeStrong((id *)&self->_receivedPassword, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_discovery, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
