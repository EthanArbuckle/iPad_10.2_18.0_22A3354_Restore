@implementation SFDeviceOperationHandlerWiFiSetup

- (SFDeviceOperationHandlerWiFiSetup)init
{
  SFDeviceOperationHandlerWiFiSetup *v2;
  SFDeviceOperationHandlerWiFiSetup *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v6;
  NSMutableArray *wiFiRetryMetrics;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFDeviceOperationHandlerWiFiSetup;
  v2 = -[SFDeviceOperationHandlerWiFiSetup init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    wiFiRetryMetrics = v3->_wiFiRetryMetrics;
    v3->_wiFiRetryMetrics = (NSMutableArray *)v6;

  }
  return v3;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SFDeviceOperationHandlerWiFiSetup_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __45__SFDeviceOperationHandlerWiFiSetup_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  uint64_t Int64;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  SFSession *sfSession;
  SFSession *v8;
  SFSession *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  int v13;

  if (self->_sfSession)
  {
    v13 = 0;
    self->_reachabilityEnabled = CFPrefs_GetInt64() != 0;
    Int64 = CFPrefs_GetInt64();
    if (v13)
      v4 = 0;
    else
      v4 = Int64 == 0;
    v5 = !v4;
    self->_ensureIP4Configured = v5;
    v6 = MEMORY[0x1E0C809B0];
    sfSession = self->_sfSession;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke;
    v12[3] = &unk_1E482E2D0;
    v12[4] = self;
    -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("_bjtS"), 0, v12);
    v8 = self->_sfSession;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke_2;
    v11[3] = &unk_1E482E2D0;
    v11[4] = self;
    -[SFSession registerRequestID:options:handler:](v8, "registerRequestID:options:handler:", CFSTR("_bjtD"), 0, v11);
    v9 = self->_sfSession;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke_3;
    v10[3] = &unk_1E482E2D0;
    v10[4] = self;
    -[SFSession registerRequestID:options:handler:](v9, "registerRequestID:options:handler:", CFSTR("_ws"), 0, v10);
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
         && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestBonjourTestStart:responseHandler:");
}

uint64_t __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequestBonjourTestDone:responseHandler:");
}

uint64_t __46__SFDeviceOperationHandlerWiFiSetup__activate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleWiFiSetupRequest:responseHandler:");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SFDeviceOperationHandlerWiFiSetup_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __47__SFDeviceOperationHandlerWiFiSetup_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 56);
  if (v3)
  {
    NSErrorWithOSStatusF();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v3 + 16))(v3, v4, 0, 0);

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 8), "invalidate");
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = 0;

  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v9)
  {
    v10 = v9;
    dispatch_source_cancel(v10);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = 0;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 24);
  *(_QWORD *)(v13 + 24) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "invalidate");
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 48);
  *(_QWORD *)(v15 + 48) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "deregisterRequestID:", CFSTR("_ws"));
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 256);
  *(_QWORD *)(v17 + 256) = 0;

}

- (void)_completeError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *wiFiRetryMetrics;
  id responseHandler;
  id v13;
  const char *v14;
  id v15;

  v15 = a3;
  if (v15)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup > 60
      || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_11;
    }
    v14 = WiFiSetupStateToString(self->_state);
    v13 = v15;
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup > 30
         || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_11;
  }
  LogPrintF();
LABEL_11:
  self->_state = 0;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_wiFiRetryMetrics, CFSTR("wifiRM"));
  if (objc_msgSend(v15, "code"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("wifiEC"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("wifiEC"));
  }
  objc_msgSend(v15, "domain", v13, v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v15, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("wifiED"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("wifiED"));
  }

  objc_msgSend(v15, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v15, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("wifiEL"));

  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("wifiEL"));
  }

  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize())
      LogPrintF();
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v10 = (NSMutableArray *)objc_opt_new();
  wiFiRetryMetrics = self->_wiFiRetryMetrics;
  self->_wiFiRetryMetrics = v10;

  if (self->_responseHandler)
  {
    if (self->_isRetrySetup)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup > 30
        || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_39;
      }
    }
    else if (gLogCategory_SFDeviceOperationWiFiSetup > 30
           || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_39;
    }
    LogPrintF();
LABEL_39:
    (*((void (**)(id))self->_responseHandler + 2))(self->_responseHandler);
    responseHandler = self->_responseHandler;
    self->_responseHandler = 0;

  }
}

- (void)_handleRequestBonjourTestStart:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CUBonjourAdvertiser *v9;
  CUBonjourAdvertiser *bonjourAdvertiser;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate");
    v9 = (CUBonjourAdvertiser *)objc_alloc_init(MEMORY[0x1E0D1B340]);
    bonjourAdvertiser = self->_bonjourAdvertiser;
    self->_bonjourAdvertiser = v9;

    -[CUBonjourAdvertiser setDispatchQueue:](self->_bonjourAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBonjourAdvertiser setDomain:](self->_bonjourAdvertiser, "setDomain:", CFSTR("local."));
    -[CUBonjourAdvertiser setLabel:](self->_bonjourAdvertiser, "setLabel:", CFSTR("SFDeviceOperationWiFi"));
    -[CUBonjourAdvertiser setName:](self->_bonjourAdvertiser, "setName:", v8);
    -[CUBonjourAdvertiser setPort:](self->_bonjourAdvertiser, "setPort:", 9);
    -[CUBonjourAdvertiser setServiceType:](self->_bonjourAdvertiser, "setServiceType:", CFSTR("_bonjourtest._tcp"));
    v13 = CFSTR("rpBA");
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUBonjourAdvertiser setTxtDictionary:](self->_bonjourAdvertiser, "setTxtDictionary:", v11);

    -[CUBonjourAdvertiser activate](self->_bonjourAdvertiser, "activate");
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, MEMORY[0x1E0C9AA70]);
  }
  else
  {
    NSErrorWithOSStatusF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 90
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v12, 0, 0);

  }
}

- (void)_handleRequestBonjourTestDone:(id)a3 responseHandler:(id)a4
{
  id v6;
  CUBonjourAdvertiser *bonjourAdvertiser;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    v8 = v9;
    LogPrintF();
  }
  -[CUBonjourAdvertiser invalidate](self->_bonjourAdvertiser, "invalidate", v8);
  bonjourAdvertiser = self->_bonjourAdvertiser;
  self->_bonjourAdvertiser = 0;

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, MEMORY[0x1E0C9AA70]);
}

- (void)_handleWiFiSetupRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id wifiEAPConfig;
  void *v10;
  id wifiEAPTrustExceptions;
  NSString *v12;
  NSString *wifiPassword;
  NSData *v14;
  NSData *wifiPSK;
  NSString *v16;
  NSString *wifiSSID;
  void *v18;
  id responseHandler;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_state)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2F90];
    v27 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    v25 = CFSTR("?");
    if (v23)
      v25 = (const __CFString *)v23;
    v28[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, -6721, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    self->_wifiChannel = CFDictionaryGetInt64Ranged();
    self->_wifiDirected = CFDictionaryGetInt64() != 0;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wifiEAPConfig"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    wifiEAPConfig = self->_wifiEAPConfig;
    self->_wifiEAPConfig = v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("wifiEAPTE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    wifiEAPTrustExceptions = self->_wifiEAPTrustExceptions;
    self->_wifiEAPTrustExceptions = v10;

    self->_wifiHomeNetwork = CFDictionaryGetInt64() != 0;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    wifiPassword = self->_wifiPassword;
    self->_wifiPassword = v12;

    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = (NSData *)objc_claimAutoreleasedReturnValue();
    wifiPSK = self->_wifiPSK;
    self->_wifiPSK = v14;

    self->_wifiSkipReachbility = CFDictionaryGetInt64() != 0;
    self->_repairFlags = CFDictionaryGetInt64Ranged();
    self->_setupFlags = CFDictionaryGetInt64Ranged();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    wifiSSID = self->_wifiSSID;
    self->_wifiSSID = v16;

    if (self->_wifiSSID)
    {
      self->_wiFiJoinLimit = CFDictionaryGetInt64Ranged();
      self->_wiFiScanLimit = CFDictionaryGetInt64Ranged();
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_isRetrySetup = CFDictionaryGetInt64() != 0;
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30)
      {
        if (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize())
          LogPrintF();
        if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
          && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      v18 = _Block_copy(v7);
      responseHandler = self->_responseHandler;
      self->_responseHandler = v18;

      -[SFDeviceOperationHandlerWiFiSetup _run](self, "_run");
      v20 = 0;
      goto LABEL_16;
    }
    NSErrorWithOSStatusF();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v7 && v20)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v20, 0, 0);
  }
LABEL_16:

}

- (void)_run
{
  const char *v3;
  uint64_t v4;
  int state;
  const char *v6;
  const char *v7;
  NSError *stepError;
  NSError *v9;
  NSError *v10;
  SFDeviceOperationHandlerWiFiSetup *v11;
  dispatch_time_t v12;
  NSObject *dispatchQueue;
  _QWORD *v14;
  unint64_t currentWiFiScanChannelCount;
  int v16;
  unint64_t currentWiFiJoinChannelCount;
  unint64_t currentWiFiScanNoChannelCount;
  unint64_t currentWiFiJoinNoChannelCount;
  int v20;
  const char *v21;
  const char *v22;
  _QWORD block[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[6];

  v3 = "-[SFDeviceOperationHandlerWiFiSetup _run]";
  v4 = MEMORY[0x1E0C809B0];
  while (2)
  {
    if (!self->_invalidateCalled)
    {
      state = self->_state;
      switch(state)
      {
        case 0:
          if (self->_responseHandler)
          {
            if (self->_wifiChannel >= 1)
              goto LABEL_20;
            goto LABEL_32;
          }
          goto LABEL_63;
        case 3:
          stepError = self->_stepError;
          if (!stepError)
          {
            NSErrorWithOSStatusF();
            v9 = (NSError *)objc_claimAutoreleasedReturnValue();
            v10 = self->_stepError;
            self->_stepError = v9;

            stepError = self->_stepError;
          }
          v11 = self;
          goto LABEL_14;
        case 4:
          v11 = self;
          stepError = 0;
LABEL_14:
          -[SFDeviceOperationHandlerWiFiSetup _completeError:](v11, "_completeError:", stepError, v21, v22);
          goto LABEL_63;
        case 11:
          v12 = dispatch_time(0, 2000000000);
          dispatchQueue = self->_dispatchQueue;
          v26[0] = v4;
          v26[1] = 3221225472;
          v26[2] = __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke;
          v26[3] = &unk_1E482DF78;
          v26[4] = self;
          v14 = v26;
          goto LABEL_34;
        case 12:
          if (self->_scanResult)
            goto LABEL_26;
          if (self->_stepDone)
          {
            currentWiFiScanChannelCount = self->_currentWiFiScanChannelCount;
            if (currentWiFiScanChannelCount >= self->_wiFiScanLimit)
              goto LABEL_32;
            self->_currentWiFiScanChannelCount = currentWiFiScanChannelCount + 1;
LABEL_20:
            v16 = 11;
            goto LABEL_62;
          }
          if (gLogCategory_SFDeviceOperationWiFiSetup > 30)
            goto LABEL_63;
          if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
          {
            v20 = 12;
            goto LABEL_73;
          }
          goto LABEL_75;
        case 13:
          v12 = dispatch_time(0, 2000000000);
          dispatchQueue = self->_dispatchQueue;
          v25[0] = v4;
          v25[1] = 3221225472;
          v25[2] = __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_2;
          v25[3] = &unk_1E482DF78;
          v25[4] = self;
          v14 = v25;
          goto LABEL_34;
        case 14:
          if (!self->_stepDone)
          {
            if (gLogCategory_SFDeviceOperationWiFiSetup > 30)
              goto LABEL_63;
            if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
            {
              v20 = 14;
              goto LABEL_73;
            }
            goto LABEL_75;
          }
          if (!self->_stepError)
            goto LABEL_48;
          currentWiFiJoinChannelCount = self->_currentWiFiJoinChannelCount;
          if (currentWiFiJoinChannelCount < self->_wiFiJoinLimit)
          {
            self->_currentWiFiJoinChannelCount = currentWiFiJoinChannelCount + 1;
LABEL_26:
            v16 = 13;
            goto LABEL_62;
          }
          goto LABEL_32;
        case 15:
          v12 = dispatch_time(0, 2000000000);
          dispatchQueue = self->_dispatchQueue;
          v24[0] = v4;
          v24[1] = 3221225472;
          v24[2] = __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_3;
          v24[3] = &unk_1E482DF78;
          v24[4] = self;
          v14 = v24;
          goto LABEL_34;
        case 16:
          if (self->_scanResult)
            goto LABEL_39;
          if (self->_stepDone)
          {
            currentWiFiScanNoChannelCount = self->_currentWiFiScanNoChannelCount;
            if (currentWiFiScanNoChannelCount >= self->_wiFiScanLimit)
              goto LABEL_47;
            self->_currentWiFiScanNoChannelCount = currentWiFiScanNoChannelCount + 1;
LABEL_32:
            v16 = 15;
            goto LABEL_62;
          }
          if (gLogCategory_SFDeviceOperationWiFiSetup > 30)
            goto LABEL_63;
          if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
          {
            v20 = 16;
            goto LABEL_73;
          }
          goto LABEL_75;
        case 17:
          v12 = dispatch_time(0, 2000000000);
          dispatchQueue = self->_dispatchQueue;
          block[0] = v4;
          block[1] = 3221225472;
          block[2] = __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_4;
          block[3] = &unk_1E482DF78;
          block[4] = self;
          v14 = block;
LABEL_34:
          dispatch_after(v12, dispatchQueue, v14);
          goto LABEL_63;
        case 18:
          if (self->_stepDone)
          {
            if (self->_stepError)
            {
              currentWiFiJoinNoChannelCount = self->_currentWiFiJoinNoChannelCount;
              if (currentWiFiJoinNoChannelCount >= self->_wiFiJoinLimit)
                goto LABEL_47;
              self->_currentWiFiJoinNoChannelCount = currentWiFiJoinNoChannelCount + 1;
LABEL_39:
              v16 = 17;
            }
            else
            {
LABEL_48:
              v16 = 19;
            }
            goto LABEL_62;
          }
          if (gLogCategory_SFDeviceOperationWiFiSetup > 30)
            goto LABEL_63;
          if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
          {
            v20 = 18;
            goto LABEL_73;
          }
          goto LABEL_75;
        case 19:
          self->_state = 20;
          -[SFDeviceOperationHandlerWiFiSetup _runIP4AvailableStart](self, "_runIP4AvailableStart");
          goto LABEL_63;
        case 20:
          if (self->_stepDone)
          {
            if (self->_stepError)
              goto LABEL_47;
            v16 = 21;
            goto LABEL_62;
          }
          if (gLogCategory_SFDeviceOperationWiFiSetup > 30)
            goto LABEL_63;
          if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
          {
            v20 = 20;
            goto LABEL_73;
          }
          goto LABEL_75;
        case 21:
          self->_state = 22;
          -[SFDeviceOperationHandlerWiFiSetup _runReachabilityStart](self, "_runReachabilityStart");
          goto LABEL_63;
        case 22:
          if (self->_stepDone)
          {
            if (self->_stepError)
            {
LABEL_47:
              self->_state = 3;
            }
            else
            {
              v16 = 4;
LABEL_62:
              self->_state = v16;
            }
          }
          else
          {
            if (gLogCategory_SFDeviceOperationWiFiSetup > 30)
              goto LABEL_63;
            if (gLogCategory_SFDeviceOperationWiFiSetup == -1)
            {
LABEL_75:
              if (!_LogCategory_Initialize())
                goto LABEL_63;
              v20 = self->_state;
            }
            else
            {
              v20 = 22;
            }
LABEL_73:
            v21 = WiFiSetupStateToString(v20);
LABEL_74:
            LogPrintF();
          }
LABEL_63:
          if (self->_state == state)
            return;
          continue;
        default:
          if (gLogCategory_SFDeviceOperationWiFiSetup > 90)
            goto LABEL_63;
          v6 = v3;
          v7 = (const char *)self->_state;
          if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
            goto LABEL_9;
          v3 = v6;
          if (!_LogCategory_Initialize())
            goto LABEL_63;
          v7 = (const char *)self->_state;
LABEL_9:
          v21 = v7;
          v22 = WiFiSetupStateToString((int)v7);
          v3 = v6;
          goto LABEL_74;
      }
    }
    break;
  }
}

uint64_t __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 12;
  return objc_msgSend(*(id *)(a1 + 32), "_runScanStart:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 100));
}

uint64_t __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_2(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 14;
  return objc_msgSend(*(id *)(a1 + 32), "_runJoinStart:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 100));
}

uint64_t __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_3(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 16;
  return objc_msgSend(*(id *)(a1 + 32), "_runScanStart:", 0);
}

uint64_t __41__SFDeviceOperationHandlerWiFiSetup__run__block_invoke_4(uint64_t a1)
{
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 18;
  return objc_msgSend(*(id *)(a1 + 32), "_runJoinStart:", 0);
}

- (void)_runScanStart:(int)a3
{
  uint64_t v3;
  NSError *stepError;
  NSDictionary *scanResult;
  id v7;
  void *v8;
  NSString *wifiSSID;
  NSError *v10;
  NSError *v11;
  NSError *v12;
  void *v13;

  v3 = *(_QWORD *)&a3;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  scanResult = self->_scanResult;
  self->_scanResult = 0;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((int)v3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("channel"));

  }
  wifiSSID = self->_wifiSSID;
  if (!wifiSSID
    || (objc_msgSend(v7, "setObject:forKeyedSubscript:", wifiSSID, CFSTR("ssid")),
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E4890910, CFSTR("scanDwellTime")),
        self->_scanStartTicks = mach_absolute_time(),
        WiFiScan_b()))
  {
    NSErrorWithOSStatusF();
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_stepDone = 1;
      v11 = self->_stepError;
      self->_stepError = v10;
      v12 = v10;

      mach_absolute_time();
      UpTicksToSecondsF();
      -[SFDeviceOperationHandlerWiFiSetup createWiFiRetryMetricEvent:duration:channel:isScan:](self, "createWiFiRetryMetricEvent:duration:channel:isScan:", v12, v3, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceOperationHandlerWiFiSetup addRetryMetric:](self, "addRetryMetric:", v13);

      -[SFDeviceOperationHandlerWiFiSetup _run](self, "_run");
    }
  }

}

void __51__SFDeviceOperationHandlerWiFiSetup__runScanStart___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  _BYTE *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 248));
  v6 = *(_BYTE **)(a1 + 32);
  if (!v6[16])
  {
    if (a2)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB2F90];
      v9 = a2;
      v15 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("?");
      if (v10)
        v12 = (const __CFString *)v10;
      v16[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v9, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_runScanResults:error:channel:", a3, v14, *(unsigned int *)(a1 + 40));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_runScanResults:error:channel:", a3, 0, *(unsigned int *)(a1 + 40));
    }
  }
}

- (void)_runScanResults:(id)a3 error:(id)a4 channel:(int)a5
{
  uint64_t v5;
  NSError *v8;
  double v9;
  double v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  NSDictionary *v14;
  void *scanResult;
  NSError *stepError;
  uint64_t v17;
  NSError *v18;
  id v19;

  v5 = *(_QWORD *)&a5;
  v19 = a3;
  v8 = (NSError *)a4;
  mach_absolute_time();
  UpTicksToSecondsF();
  v10 = v9;
  objc_msgSend(v19, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v8 || (isKindOfClass & 1) == 0)
  {
    if (!v8)
    {
      NSErrorWithOSStatusF();
      v8 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      v17 = v5;
      v18 = v8;
      LogPrintF();
    }
    -[SFDeviceOperationHandlerWiFiSetup createWiFiRetryMetricEvent:duration:channel:isScan:](self, "createWiFiRetryMetricEvent:duration:channel:isScan:", v8, v5, 1, v10, v17, v18);
    scanResult = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationHandlerWiFiSetup addRetryMetric:](self, "addRetryMetric:", scanResult);
  }
  else
  {
    -[SFDeviceOperationHandlerWiFiSetup createWiFiRetryMetricEvent:duration:channel:isScan:](self, "createWiFiRetryMetricEvent:duration:channel:isScan:", 0, v5, 1, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationHandlerWiFiSetup addRetryMetric:](self, "addRetryMetric:", v13);

    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v19, "count");
      LogPrintF();
    }
    v14 = v11;
    v8 = 0;
    scanResult = self->_scanResult;
    self->_scanResult = v14;
  }

  self->_stepDone = 1;
  stepError = self->_stepError;
  self->_stepError = v8;

  -[SFDeviceOperationHandlerWiFiSetup _run](self, "_run");
}

- (void)_runJoinStart:(int)a3
{
  uint64_t v3;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  NSError *stepError;
  void *v11;
  void *v12;
  id wifiEAPConfig;
  id wifiEAPTrustExceptions;
  void *v15;
  id v16;
  void *v17;
  NSString *wifiSSID;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  uint64_t repairFlags;
  void *v26;

  v3 = *(_QWORD *)&a3;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    v5 = "yes";
    if (self->_wifiEAPConfig)
      v6 = "yes";
    else
      v6 = "no";
    if (self->_wifiEAPTrustExceptions)
      v7 = "yes";
    else
      v7 = "no";
    if (self->_wifiPassword)
      v8 = "yes";
    else
      v8 = "no";
    if (self->_wifiPSK)
      v9 = "yes";
    else
      v9 = "no";
    if (!self->_wifiHomeNetwork)
      v5 = "no";
    repairFlags = self->_repairFlags;
    v26 = &unk_1A2AF82CD;
    v23 = v9;
    v24 = v5;
    v21 = v7;
    v22 = v8;
    v19 = v3;
    v20 = v6;
    wifiSSID = self->_wifiSSID;
    LogPrintF();
  }
  stepError = self->_stepError;
  self->_stepDone = 0;
  self->_stepError = 0;

  if (self->_scanResult)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_scanResult);
    v12 = v11;
    if (self->_wifiDirected)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("directed"));
    wifiEAPConfig = self->_wifiEAPConfig;
    if (wifiEAPConfig)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", wifiEAPConfig, CFSTR("eapConfig"));
    wifiEAPTrustExceptions = self->_wifiEAPTrustExceptions;
    if (wifiEAPTrustExceptions)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", wifiEAPTrustExceptions, CFSTR("eapTrustExceptions"));
    if ((self->_repairFlags & 1) != 0)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("forceFix"));
    if (self->_wifiHomeNetwork)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("homeNetwork"));
    if (self->_wifiPassword || self->_wifiPSK)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", wifiSSID, v19, v20, v21, v22, v23, v24, repairFlags, v26);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("persistent"), wifiSSID, v19);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1E4890910, CFSTR("scanDwellTime"));
    self->_joinStartTicks = mach_absolute_time();
    if (WiFiJoinNetwork_b())
    {
      NSErrorWithOSStatusF();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
          && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_stepDone = 1;
        objc_storeStrong((id *)&self->_stepError, v15);
        mach_absolute_time();
        UpTicksToSecondsF();
        -[SFDeviceOperationHandlerWiFiSetup createWiFiRetryMetricEvent:duration:channel:isScan:](self, "createWiFiRetryMetricEvent:duration:channel:isScan:", v15, v3, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceOperationHandlerWiFiSetup addRetryMetric:](self, "addRetryMetric:", v17);

        -[SFDeviceOperationHandlerWiFiSetup _run](self, "_run");
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v16 = (id)NSErrorWithOSStatusF();
    v15 = 0;
    v12 = 0;
  }

}

uint64_t __51__SFDeviceOperationHandlerWiFiSetup__runJoinStart___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  void *v11;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 248));
  mach_absolute_time();
  result = UpTicksToSecondsF();
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
    return result;
  v6 = v5;
  if (a2)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 60
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
         && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_8;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) = 1;
  NSErrorWithOSStatusF();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 80);
  *(_QWORD *)(v8 + 80) = v7;

  v10 = *(_QWORD **)(a1 + 32);
  objc_msgSend(v10, "createWiFiRetryMetricEvent:duration:channel:isScan:", v10[10], *(unsigned int *)(a1 + 40), 0, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addRetryMetric:", v11);

  if (!a2)
    objc_msgSend(*(id *)(a1 + 32), "_cleanupOldWiFiNetworks");
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)_runIP4AvailableStart
{
  NSError *stepError;
  uint64_t v4;
  void *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *ip4Timeout;
  CUNetInterfaceMonitor *v8;
  CUNetInterfaceMonitor *interfaceMonitor;
  id v10;
  CUNetInterfaceMonitor *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[5];

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  if (self->_ensureIP4Configured)
  {
    v4 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke;
    aBlock[3] = &unk_1E482DF78;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    ip4Timeout = self->_ip4Timeout;
    self->_ip4Timeout = v6;

    dispatch_source_set_event_handler((dispatch_source_t)self->_ip4Timeout, v5);
    SFDispatchTimerSet(self->_ip4Timeout, 10.0, -1.0, 0.0);
    dispatch_activate((dispatch_object_t)self->_ip4Timeout);
    -[CUNetInterfaceMonitor invalidate](self->_interfaceMonitor, "invalidate");
    v8 = (CUNetInterfaceMonitor *)objc_alloc_init(MEMORY[0x1E0D1B3D0]);
    interfaceMonitor = self->_interfaceMonitor;
    self->_interfaceMonitor = v8;

    -[CUNetInterfaceMonitor setDispatchQueue:](self->_interfaceMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v15[0] = v4;
    v15[1] = 3221225472;
    v15[2] = __58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke_2;
    v15[3] = &unk_1E482DFC8;
    v15[4] = self;
    v10 = v5;
    v16 = v10;
    -[CUNetInterfaceMonitor setPrimaryIPChangedHandler:](self->_interfaceMonitor, "setPrimaryIPChangedHandler:", v15);
    v11 = self->_interfaceMonitor;
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke_3;
    v13[3] = &unk_1E482DFC8;
    v13[4] = self;
    v14 = v10;
    v12 = v10;
    -[CUNetInterfaceMonitor activateWithCompletion:](v11, "activateWithCompletion:", v13);

  }
  else
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_stepDone = 1;
  }
}

uint64_t __58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

_QWORD *__58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke_2(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (!*(_BYTE *)(v1 + 16) && !*(_BYTE *)(v1 + 40))
  {
    result = *(_QWORD **)(v1 + 24);
    if (result)
      result = (_QWORD *)objc_msgSend(result, "primaryIPv4Addr");
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
        return (_QWORD *)LogPrintF();
      result = (_QWORD *)_LogCategory_Initialize();
      if ((_DWORD)result)
        return (_QWORD *)LogPrintF();
    }
  }
  return result;
}

void *__58__SFDeviceOperationHandlerWiFiSetup__runIP4AvailableStart__block_invoke_3(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (result)
    result = (void *)objc_msgSend(result, "primaryIPv4Addr");
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup != -1)
      return (void *)LogPrintF();
    result = (void *)_LogCategory_Initialize();
    if ((_DWORD)result)
      return (void *)LogPrintF();
  }
  return result;
}

- (void)_runReachabilityStart
{
  NSError *v3;
  NSError *stepError;
  CUReachabilityMonitor *v5;
  CUReachabilityMonitor *reachabilityMonitor;
  _QWORD v7[5];

  if (self->_reachabilityEnabled)
  {
    if (!self->_wifiSkipReachbility)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_stepDone = 0;
      stepError = self->_stepError;
      self->_stepError = 0;

      -[CUReachabilityMonitor invalidate](self->_reachabilityMonitor, "invalidate");
      v5 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x1E0D1B420]);
      reachabilityMonitor = self->_reachabilityMonitor;
      self->_reachabilityMonitor = v5;

      -[CUReachabilityMonitor setDispatchQueue:](self->_reachabilityMonitor, "setDispatchQueue:", self->_dispatchQueue);
      -[CUReachabilityMonitor setTimeout:](self->_reachabilityMonitor, "setTimeout:", 60.0);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __58__SFDeviceOperationHandlerWiFiSetup__runReachabilityStart__block_invoke;
      v7[3] = &unk_1E482DFF0;
      v7[4] = self;
      -[CUReachabilityMonitor setCompletionHandler:](self->_reachabilityMonitor, "setCompletionHandler:", v7);
      -[CUReachabilityMonitor activate](self->_reachabilityMonitor, "activate");
      return;
    }
    goto LABEL_7;
  }
  if (self->_wifiSkipReachbility)
  {
LABEL_7:
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!self->_reachabilityEnabled
    && gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_stepDone = 1;
  v3 = self->_stepError;
  self->_stepError = 0;

}

void __58__SFDeviceOperationHandlerWiFiSetup__runReachabilityStart__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 248));
  v3 = v10;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
    goto LABEL_18;
  if (v10)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup > 60
      || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup > 30
         || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_12;
  }
  LogPrintF();
LABEL_12:
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 76) = 1;
  if (v10)
  {
    if (objc_msgSend(v10, "code") == -6748)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "sharingSourceVersion");
    NSErrorWithOSStatusF();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 80);
    *(_QWORD *)(v7 + 80) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v9 + 80);
    *(_QWORD *)(v9 + 80) = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "_run");
  v3 = v10;
LABEL_18:

}

- (void)_cleanupOldWiFiNetworks
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0D1BA50]);
  objc_msgSend(v3, "activate");
  objc_msgSend(v3, "currentKnownNetworkProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v3, "knownNetworkProfilesWithProperties:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v10, "isEqual:", v4, v16, v17) & 1) == 0)
        {
          objc_msgSend(v10, "networkName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", self->_wifiSSID);

          if ((v12 & 1) == 0)
          {
            if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
              && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v10, "networkName");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF();

            }
            v18 = 0;
            v13 = objc_msgSend(v3, "removeKnownNetworkProfile:reason:error:", v10, 1, &v18, v16);
            v14 = v18;
            if ((v13 & 1) == 0
              && gLogCategory_SFDeviceOperationWiFiSetup <= 90
              && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v10, "networkName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              CUPrintNSError();
              v16 = v15;
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              LogPrintF();

            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "invalidate");
}

- (id)createWiFiRetryMetricEvent:(id)a3 duration:(double)a4 channel:(int)a5 isScan:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v6 = a6;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("wifiDN"));

  if (objc_msgSend(v10, "code"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("wifiEC"));

  }
  else
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, CFSTR("wifiEC"));
  }
  objc_msgSend(v10, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v10, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, CFSTR("wifiED"));

  }
  else
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("wifiED"));
  }

  objc_msgSend(v10, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v10, "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, CFSTR("wifiEL"));

  }
  else
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Unknown"), CFSTR("wifiEL"));
  }

  v18 = 200;
  if (v6)
    v18 = 208;
  v19 = 184;
  if (v6)
  {
    v19 = 192;
    v20 = 168;
  }
  else
  {
    v20 = 176;
  }
  v21 = 3;
  if (v6)
    v21 = 1;
  v22 = 2;
  if (v6)
    v22 = 0;
  if (a5)
  {
    v18 = v19;
    v23 = v22;
  }
  else
  {
    v23 = v21;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(Class *)((char *)&self->super.isa + v18));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("wifiAT"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(Class *)((char *)&self->super.isa + v20));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("wifiLT"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10 == 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("wifiSUCC"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, CFSTR("wifiRT"));

  v28 = (void *)objc_msgSend(v11, "copy");
  return v28;
}

- (void)addRetryMetric:(id)a3
{
  id v4;
  NSMutableArray *wiFiRetryMetrics;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  wiFiRetryMetrics = self->_wiFiRetryMetrics;
  v8 = v4;
  if (!wiFiRetryMetrics)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_wiFiRetryMetrics;
    self->_wiFiRetryMetrics = v6;

    v4 = v8;
    wiFiRetryMetrics = self->_wiFiRetryMetrics;
  }
  -[NSMutableArray addObject:](wiFiRetryMetrics, "addObject:", v4);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wiFiRetryMetrics, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_wifiPSK, 0);
  objc_storeStrong((id *)&self->_wifiPassword, 0);
  objc_storeStrong(&self->_wifiEAPTrustExceptions, 0);
  objc_storeStrong(&self->_wifiEAPConfig, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_ip4Timeout, 0);
  objc_storeStrong((id *)&self->_interfaceMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourAdvertiser, 0);
}

@end
