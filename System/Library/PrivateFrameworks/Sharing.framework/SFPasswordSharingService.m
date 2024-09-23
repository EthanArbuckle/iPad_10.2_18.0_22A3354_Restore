@implementation SFPasswordSharingService

+ (unsigned)passwordSharingAvailability
{
  dispatch_queue_t v2;
  dispatch_semaphore_t v3;
  SFClient *v4;
  NSObject *v5;
  dispatch_time_t v6;
  unsigned int v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v2 = dispatch_queue_create("com.apple.Sharing.wpsClientQueue", 0);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v3 = dispatch_semaphore_create(0);
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v4 = objc_alloc_init(SFClient);
  -[SFClient setDispatchQueue:](v4, "setDispatchQueue:", v2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__SFPasswordSharingService_passwordSharingAvailability__block_invoke;
  v9[3] = &unk_1E4833950;
  v11 = &v17;
  v12 = &v13;
  v5 = v3;
  v10 = v5;
  -[SFClient wifiPasswordSharingAvailabilityWithCompletion:](v4, "wifiPasswordSharingAvailabilityWithCompletion:", v9);
  v6 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v5, v6);
  -[SFClient invalidate](v4, "invalidate");
  if (*((_BYTE *)v14 + 24))
  {
    if (gLogCategory_SFPasswordSharingService <= 60
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 1;
    *((_DWORD *)v18 + 6) = 1;
  }
  else
  {
    v7 = *((_DWORD *)v18 + 6);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __55__SFPasswordSharingService_passwordSharingAvailability__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  v6 = v5;
  if (v5
    && gLogCategory_SFPasswordSharingService <= 60
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (SFPasswordSharingService)init
{
  SFPasswordSharingService *v2;
  SFPasswordSharingService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFPasswordSharingService;
  v2 = -[SFPasswordSharingService init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_shareTime = -1.0;
  }
  return v3;
}

- (void)dealloc
{
  SFPasswordSharingService *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFPasswordSharingService *)FatalErrorF();
    -[SFPasswordSharingService _cleanup](v3, v4);
  }
  else
  {
    -[SFPasswordSharingService _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFPasswordSharingService;
    -[SFPasswordSharingService dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  SFPasswordSharingInfo *promptedInfo;

  promptedInfo = self->_promptedInfo;
  self->_promptedInfo = 0;

  self->_serviceState = 0;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SFPasswordSharingService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__SFPasswordSharingService_activate__block_invoke(uint64_t a1)
{
  uint64_t Int64;
  uint64_t result;
  BOOL v4;

  Int64 = CFPrefs_GetInt64();
  result = objc_msgSend(*(id *)(a1 + 32), "disabledViaConfig");
  if (Int64)
    v4 = (_DWORD)result == 0;
  else
    v4 = 0;
  if (v4)
  {
    if (gLogCategory_SFPasswordSharingService <= 30
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "_run");
  }
  else if (gLogCategory_SFPasswordSharingService <= 50)
  {
    if (gLogCategory_SFPasswordSharingService != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SFPasswordSharingService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__SFPasswordSharingService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t)(*(double *)(v2 + 64) * 1000.0);
  v17[0] = CFSTR("_cat");
  v17[1] = CFSTR("_op");
  v18[0] = CFSTR("PasswordSharing");
  v18[1] = CFSTR("ServiceInvalidate");
  v17[2] = CFSTR("serviceState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(v2 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v4;
  v17[3] = CFSTR("durationMS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SFDashboardLogJSON(v6);

  v15[0] = CFSTR("serviceState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = CFSTR("durationMS");
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.PasswordSharingServiceInvalidate"), v9);

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9)
    && gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 16);
  *(_QWORD *)(v10 + 16) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
    -[SFPasswordSharingService _runServiceStart](self, "_runServiceStart");
}

- (int)_runServiceStart
{
  int result;
  SFService *v4;
  SFService *service;
  uint64_t v6;
  SFService *v7;
  int v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  result = self->_serviceState;
  if (!result)
  {
    if (gLogCategory_SFPasswordSharingService <= 30
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_serviceState = 1;
    -[SFService invalidate](self->_service, "invalidate");
    v4 = objc_alloc_init(SFService);
    service = self->_service;
    self->_service = v4;

    -[SFService setAdvertiseRate:](self->_service, "setAdvertiseRate:", 50);
    -[SFService setDeviceActionType:](self->_service, "setDeviceActionType:", 8);
    -[SFService setDispatchQueue:](self->_service, "setDispatchQueue:", self->_dispatchQueue);
    -[SFService setFixedPIN:](self->_service, "setFixedPIN:", CFSTR("9zfCcnJgD*sK&h7h7Xa1z*IU^2U%zKTg"));
    -[SFService setIdentifier:](self->_service, "setIdentifier:", CFSTR("com.apple.sharing.PasswordSharing"));
    -[SFService setLabel:](self->_service, "setLabel:", CFSTR("SFPasswordSharingService"));
    -[SFService setNeedsSetup:](self->_service, "setNeedsSetup:", 1);
    -[SFService setRequestSSID:](self->_service, "setRequestSSID:", self->_networkName);
    -[SFService setSessionFlags:](self->_service, "setSessionFlags:", 20);
    -[SFService setInterruptionHandler:](self->_service, "setInterruptionHandler:", &__block_literal_global_60);
    -[SFService setInvalidationHandler:](self->_service, "setInvalidationHandler:", &__block_literal_global_121);
    -[SFService setPeerDisconnectedHandler:](self->_service, "setPeerDisconnectedHandler:", &__block_literal_global_124_1);
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_4;
    v13[3] = &unk_1E4832FF0;
    v13[4] = self;
    -[SFService setReceivedObjectHandler:](self->_service, "setReceivedObjectHandler:", v13);
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_5;
    v12[3] = &unk_1E482FA30;
    v12[4] = self;
    -[SFService setSessionStartedHandler:](self->_service, "setSessionStartedHandler:", v12);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_6;
    v11[3] = &unk_1E482FA58;
    v11[4] = self;
    -[SFService setSessionEndedHandler:](self->_service, "setSessionEndedHandler:", v11);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_7;
    v10[3] = &unk_1E482FA30;
    v10[4] = self;
    -[SFService setSessionSecuredHandler:](self->_service, "setSessionSecuredHandler:", v10);
    v7 = self->_service;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __44__SFPasswordSharingService__runServiceStart__block_invoke_8;
    v9[3] = &unk_1E482DFF0;
    v9[4] = self;
    -[SFService activateWithCompletion:](v7, "activateWithCompletion:", v9);
    result = self->_serviceState;
  }
  if (result == 4)
    return 4;
  if (gLogCategory_SFPasswordSharingService <= 30)
  {
    if (gLogCategory_SFPasswordSharingService != -1
      || (v8 = _LogCategory_Initialize(), result = self->_serviceState, v8))
    {
      LogPrintF();
      return self->_serviceState;
    }
  }
  return result;
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke()
{
  if (gLogCategory_SFPasswordSharingService <= 50
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_2()
{
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (gLogCategory_SFPasswordSharingService <= 50
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __44__SFPasswordSharingService__runServiceStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedObject:flags:", a4, a3);
}

uint64_t __44__SFPasswordSharingService__runServiceStart__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStarted:", a2);
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v12, "peer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    LogPrintF();

  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(v12, "peer", v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = 0;

  }
}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = a2;
  v4 = v3;
  if (gLogCategory_SFPasswordSharingService <= 30)
  {
    v10 = v3;
    if (gLogCategory_SFPasswordSharingService != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
    {
      objc_msgSend(v4, "peer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v10;
    }
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v11 = v4;
    objc_msgSend(v4, "peer");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 24);
    *(_QWORD *)(v7 + 24) = v6;

    v4 = v11;
  }

}

void __44__SFPasswordSharingService__runServiceStart__block_invoke_8(uint64_t a1, void *a2)
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
    if (gLogCategory_SFPasswordSharingService <= 30
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 4;
    objc_msgSend(*(id *)(a1 + 32), "_run");
    goto LABEL_12;
  }
  if (gLogCategory_SFPasswordSharingService <= 90)
  {
    v6 = v3;
    if (gLogCategory_SFPasswordSharingService != -1 || (v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
LABEL_12:
      v4 = v6;
    }
  }

}

- (void)_handleReceivedPassword:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  SFPasswordSharingInfo *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_SFPasswordSharingService <= 50
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_shareClock);
    v14 = v6;
    LogPrintF();

  }
  -[NSDate timeIntervalSinceNow](self->_shareClock, "timeIntervalSinceNow", v14);
  v8 = v7;
  -[NSDate timeIntervalSinceNow](self->_shareClock, "timeIntervalSinceNow");
  if (v8 < 0.0)
    v9 = -v9;
  self->_shareTime = v9;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSDictionaryGetNSNumber();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && v11)
  {
    v13 = objc_alloc_init(SFPasswordSharingInfo);
    -[SFPasswordSharingInfo setChannel:](v13, "setChannel:", v12);
    -[SFPasswordSharingInfo setNetworkName:](v13, "setNetworkName:", v10);
    -[SFPasswordSharingInfo setPsk:](v13, "setPsk:", v11);
    -[SFPasswordSharingService _sendPasswordReceived](self, "_sendPasswordReceived");
    -[SFPasswordSharingService _passInfoToDelegate:](self, "_passInfoToDelegate:", v13);

  }
  else
  {
    if (gLogCategory_SFPasswordSharingService <= 90
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFPasswordSharingService _sendPasswordDeclinedWithError:](self, "_sendPasswordDeclinedWithError:", 4294960554);
  }

}

- (void)_handleSessionStarted:(id)a3
{
  NSDate *v4;
  NSDate *shareClock;
  NSUUID *v6;
  NSUUID *peer;
  void *v8;
  id v9;

  v9 = a3;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v9, "peer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date", v8);
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  shareClock = self->_shareClock;
  self->_shareClock = v4;

  if (!self->_peer)
  {
    objc_msgSend(v9, "peer");
    v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    peer = self->_peer;
    self->_peer = v6;

  }
}

- (void)_handleUserNotificationResponse:(int)a3
{
  SFPasswordSharingInfo *promptedInfo;
  SFUserAlert *notification;

  if (a3 == 2)
  {
    -[SFPasswordSharingService _sendPasswordDeclinedWithError:](self, "_sendPasswordDeclinedWithError:", 4294960573);
  }
  else if (a3 == 1)
  {
    -[SFPasswordSharingService _passInfoToDelegate:](self, "_passInfoToDelegate:", self->_promptedInfo);
    promptedInfo = self->_promptedInfo;
    self->_promptedInfo = 0;

  }
  -[SFUserAlert invalidate](self->_notification, "invalidate");
  notification = self->_notification;
  self->_notification = 0;

}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  id v5;
  char Int64Ranged;

  v5 = a3;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFPasswordSharingService <= 50
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Int64Ranged == 5)
  {
    -[SFPasswordSharingService _handleReceivedPassword:](self, "_handleReceivedPassword:", v5);
  }
  else if (gLogCategory_SFPasswordSharingService <= 60
         && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_sendPasswordReceived
{
  if (!self->_service)
  {
    if (gLogCategory_SFPasswordSharingService > 60
      || gLogCategory_SFPasswordSharingService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_13:
    LogPrintF();
    return;
  }
  if (!self->_peer)
  {
    if (gLogCategory_SFPasswordSharingService > 60
      || gLogCategory_SFPasswordSharingService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_13;
  }
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService sendToPeer:flags:object:](self->_service, "sendToPeer:flags:object:", self->_peer, 1, &unk_1E4891598);
}

- (void)_sendPasswordDeclinedWithError:(int)a3
{
  uint64_t v4;
  SFService *service;
  NSUUID *peer;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if (!self->_service)
  {
    if (gLogCategory_SFPasswordSharingService > 60
      || gLogCategory_SFPasswordSharingService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_14:
    LogPrintF();
    return;
  }
  if (!self->_peer)
  {
    if (gLogCategory_SFPasswordSharingService > 60
      || gLogCategory_SFPasswordSharingService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_14;
  }
  v4 = *(_QWORD *)&a3;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    v9 = v4;
    LogPrintF();
  }
  service = self->_service;
  peer = self->_peer;
  v11[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4, v9, CFSTR("re"), CFSTR("er"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = CFSTR("op");
  v11[1] = v7;
  v11[2] = &unk_1E4890AF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFService sendToPeer:flags:object:](service, "sendToPeer:flags:object:", peer, 1, v8);

}

- (void)_passInfoToDelegate:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if (gLogCategory_SFPasswordSharingService <= 30
      && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(WeakRetained, "service:receivedNetworkInfo:", self, v5);
  }

}

- (void)_promptUserWithInfo:(id)a3 message:(id)a4
{
  SFPasswordSharingInfo *v6;
  id v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  SFUserAlert *v11;
  SFUserAlert *notification;
  void *v13;
  void *v14;
  void *v15;
  SFPasswordSharingInfo *promptedInfo;
  SFPasswordSharingInfo *v17;
  _QWORD v18[5];

  v6 = (SFPasswordSharingInfo *)a3;
  v7 = a4;
  v8 = SFIsGreenTeaDevice();
  v9 = CFSTR("PASSWORD_ACCEPT_PROMPT_TITLE");
  if (v8)
    v9 = CFSTR("PASSWORD_ACCEPT_PROMPT_TITLE_WLAN");
  v10 = v9;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFUserAlert invalidate](self->_notification, "invalidate");
  v11 = objc_alloc_init(SFUserAlert);
  notification = self->_notification;
  self->_notification = v11;

  SFLocalizedStringForKey(CFSTR("PASSWORD_ACCEPT_PROMPT_OTHER_BUTTON"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUserAlert setAlternateButtonTitle:](self->_notification, "setAlternateButtonTitle:", v13);

  SFLocalizedStringForKey(CFSTR("PASSWORD_ACCEPT_PROMPT_DEFAULT_BUTTON"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUserAlert setDefaultButtonTitle:](self->_notification, "setDefaultButtonTitle:", v14);

  -[SFUserAlert setDispatchQueue:](self->_notification, "setDispatchQueue:", self->_dispatchQueue);
  -[SFUserAlert setMessage:](self->_notification, "setMessage:", v7);

  SFLocalizedStringForKey(v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUserAlert setTitle:](self->_notification, "setTitle:", v15);

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__SFPasswordSharingService__promptUserWithInfo_message___block_invoke;
  v18[3] = &unk_1E482FB48;
  v18[4] = self;
  -[SFUserAlert setResponseHandler:](self->_notification, "setResponseHandler:", v18);
  promptedInfo = self->_promptedInfo;
  self->_promptedInfo = v6;
  v17 = v6;

  -[SFUserAlert present](self->_notification, "present");
}

uint64_t __56__SFPasswordSharingService__promptUserWithInfo_message___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUserNotificationResponse:", a2);
}

- (BOOL)disabledViaConfig
{
  void *v2;
  char v3;

  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasswordProximityAutoFillRequestingAllowed");

  if ((v3 & 1) == 0
    && gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v3 ^ 1;
}

- (id)messageForDisplayName:(id)a3 deviceName:(id)a4 info:(id)a5
{
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    if (SFIsGreenTeaDevice())
      v10 = CFSTR("PASSWORD_ACCEPT_PROMPT_MESSAGE_WLAN");
    else
      v10 = CFSTR("PASSWORD_ACCEPT_PROMPT_MESSAGE");
    v11 = (void *)MEMORY[0x1E0CB3940];
    SFLocalizedStringForKey(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "networkName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v7, v13);
  }
  else
  {
    v14 = SFIsGreenTeaDevice();
    v15 = (void *)MEMORY[0x1E0CB3940];
    if (v8)
    {
      if (v14)
        v16 = CFSTR("PASSWORD_ACCEPT_PROMPT_MESSAGE_DEVICE_WLAN");
      else
        v16 = CFSTR("PASSWORD_ACCEPT_PROMPT_MESSAGE_DEVICE");
      SFLocalizedStringForKey(v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "networkName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v12, v8, v13);
    }
    else
    {
      if (v14)
        v17 = CFSTR("PASSWORD_ACCEPT_PROMPT_MESSAGE_GENERIC_WLAN");
      else
        v17 = CFSTR("PASSWORD_ACCEPT_PROMPT_MESSAGE_GENERIC");
      SFLocalizedStringForKey(v17);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "networkName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v12, v13, v20);
    }
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)__activateCalled
{
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_activateCalled;
}

- (BOOL)__invalidateCalled
{
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_invalidateCalled;
}

- (void)__testReceivedObject:(id)a3 withFlags:(unsigned int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (gLogCategory_SFPasswordSharingService <= 30
    && (gLogCategory_SFPasswordSharingService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFPasswordSharingService _receivedObject:flags:](self, "_receivedObject:flags:", v6, v4);

}

- (SFPasswordSharingServiceDelegate)delegate
{
  return (SFPasswordSharingServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_shareClock, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_promptedInfo, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
