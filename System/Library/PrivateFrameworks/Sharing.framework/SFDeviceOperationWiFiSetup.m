@implementation SFDeviceOperationWiFiSetup

- (SFDeviceOperationWiFiSetup)init
{
  SFDeviceOperationWiFiSetup *v2;
  SFDeviceOperationWiFiSetup *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceOperationWiFiSetup;
  v2 = -[SFDeviceOperationWiFiSetup init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

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
  block[2] = __38__SFDeviceOperationWiFiSetup_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__SFDeviceOperationWiFiSetup_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  uint64_t Int64;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  CUReachabilityMonitor *v11;
  CUReachabilityMonitor *reachabilityMonitor;
  _QWORD v13[5];
  unsigned int v14;

  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_startTicks = mach_absolute_time();
  v14 = 0;
  self->_reachabilityEnabled = CFPrefs_GetInt64() != 0;
  Int64 = CFPrefs_GetInt64();
  if (v14)
    v4 = 1;
  else
    v4 = Int64 == 0;
  v5 = !v4;
  self->_forceFailScanWiFi = v5;
  v6 = CFPrefs_GetInt64();
  if (v14)
    v7 = 1;
  else
    v7 = v6 == 0;
  v8 = !v7;
  self->_forceFailJoinWiFi = v8;
  v9 = (void *)WiFiCopyCurrentNetworkInfoEx();
  if (!v9)
  {
    NSErrorWithOSStatusF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationWiFiSetup _complete:](self, "_complete:", v10, v14);

    goto LABEL_37;
  }
  if (self->_reachabilityEnabled)
  {
    if (!self->_skipLocalReachability)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v11 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x1E0D1B420]);
      reachabilityMonitor = self->_reachabilityMonitor;
      self->_reachabilityMonitor = v11;

      -[CUReachabilityMonitor setDispatchQueue:](self->_reachabilityMonitor, "setDispatchQueue:", self->_dispatchQueue);
      -[CUReachabilityMonitor setTimeout:](self->_reachabilityMonitor, "setTimeout:", 60.0);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __39__SFDeviceOperationWiFiSetup__activate__block_invoke;
      v13[3] = &unk_1E482DFF0;
      v13[4] = self;
      -[CUReachabilityMonitor setCompletionHandler:](self->_reachabilityMonitor, "setCompletionHandler:", v13);
      -[CUReachabilityMonitor activate](self->_reachabilityMonitor, "activate");
      goto LABEL_37;
    }
    goto LABEL_25;
  }
  if (self->_skipLocalReachability)
  {
LABEL_25:
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
  -[SFDeviceOperationWiFiSetup _activate2](self, "_activate2");
LABEL_37:

}

void __39__SFDeviceOperationWiFiSetup__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 32))
  {
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;
    v7 = v3;

    if (v7)
    {
      NSErrorNestedF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_complete:", v6);

    }
    else
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "_activate2");
    }
    v3 = v7;
  }

}

- (void)_activate2
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t Int64Ranged;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t Int64;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  const char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SFSession *sfSession;
  uint64_t v27;
  OS_dispatch_source *v28;
  OS_dispatch_source *timeoutTimer;
  NSObject *v30;
  void *v31;
  void *v32;
  unint64_t retryScansCount;
  uint64_t v34;
  unint64_t retryJoinsCount;
  const char *v36;
  const char *v37;
  const char *v38;
  _QWORD handler[5];
  _QWORD v40[5];
  unsigned int v41;

  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v41 = 0;
  -[SFDeviceOperationWiFiSetup createRequestFromWiFiConfig](self, "createRequestFromWiFiConfig");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = (void *)WiFiCopyCurrentNetworkInfoEx();
    if (v5)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        NSErrorWithOSStatusF();
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = 0;
        goto LABEL_75;
      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("wifiSSID"));
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("password"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        || (objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("open")),
            (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

LABEL_14:
        Int64Ranged = CFDictionaryGetInt64Ranged();
        if ((int)Int64Ranged >= 1)
        {
          if (self->_forceFailScanWiFi)
            v9 = 100;
          else
            v9 = Int64Ranged;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("wifiCh"));

        }
        if (CFDictionaryGetInt64())
          objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("wifiDirected"));
        if (CFDictionaryGetInt64())
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eapConfig"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("wifiEAPConfig"));
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("eapTrustExceptions"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("wifiEAPTE"));

          }
        }
        Int64 = CFDictionaryGetInt64();
        if (Int64)
          objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("wifiHN"));
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
        {
          if (self->_forceFailJoinWiFi)
            v16 = &stru_1E483B8E8;
          else
            v16 = (const __CFString *)v14;
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("wifiPW"));
          v17 = "no";
          v18 = v15;
        }
        else
        {
          CFDataGetTypeID();
          CFDictionaryGetTypedValue();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("wifiPSK"));
            v17 = "yes";
          }
          else
          {
            v17 = "no";
          }
        }
        if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
          && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
        {
          v20 = "yes";
          if (v15)
            v21 = "yes";
          else
            v21 = "no";
          if (!Int64)
            v20 = "no";
          retryScansCount = (unint64_t)v6;
          retryJoinsCount = Int64Ranged;
          v37 = v17;
          v38 = v20;
          v36 = v21;
          LogPrintF();
        }

        goto LABEL_55;
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enterprise"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_14;
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 90
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v34 = v41;
      NSErrorWithOSStatusF();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
        && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v34 = v41;
      NSErrorWithOSStatusF();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 0;
      v4 = 0;
    }
    -[SFDeviceOperationWiFiSetup _complete:](self, "_complete:", v32, v34);

    v31 = 0;
    v18 = 0;
    goto LABEL_67;
  }
  v4 = (id)v3;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v18 = 0;
  v6 = 0;
LABEL_55:
  if (self->_repairFlags)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("rpFl"));

  }
  if (self->_setupFlags)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("suFl"));

  }
  if (self->_skipReachability)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("wifiSR"));
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    retryScansCount = self->_retryScansCount;
    retryJoinsCount = self->_retryJoinsCount;
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_retryJoinsCount, retryScansCount, retryJoinsCount, v36, v37, v38);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("wifiJC"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_retryScansCount);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("wifiRC"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("wifiRS"));
  sfSession = self->_sfSession;
  if (sfSession)
  {
    v27 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __40__SFDeviceOperationWiFiSetup__activate2__block_invoke;
    v40[3] = &unk_1E482E320;
    v40[4] = self;
    -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_ws"), 0, v4, v40);
    v28 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v28;

    v30 = self->_timeoutTimer;
    handler[0] = v27;
    handler[1] = 3221225472;
    handler[2] = __40__SFDeviceOperationWiFiSetup__activate2__block_invoke_2;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v30, handler);
    SFDispatchTimerSet(self->_timeoutTimer, 60.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
    v31 = 0;
    goto LABEL_67;
  }
  NSErrorWithOSStatusF();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_75:
  if (v31)
    -[SFDeviceOperationWiFiSetup _complete:](self, "_complete:", v31);
LABEL_67:

}

_BYTE *__40__SFDeviceOperationWiFiSetup__activate2__block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[32])
    return (_BYTE *)objc_msgSend(result, "_setupResponse:inResponse:", a2);
  return result;
}

void __40__SFDeviceOperationWiFiSetup__activate2__block_invoke_2(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[32])
  {
    NSErrorWithOSStatusF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_complete:", v2);

  }
}

- (id)createRequestFromWiFiConfig
{
  void *v3;
  void *v4;
  void *v5;
  id preferredWiFiConfiguration;
  __CFString *v7;
  __CFString *v8;
  id v9;
  const __CFString *v10;

  CFStringGetTypeID();
  v3 = (void *)CFPrefs_CopyTypedValue();
  CFStringGetTypeID();
  v4 = (void *)CFPrefs_CopyTypedValue();
  v5 = (void *)objc_opt_new();
  if (v3 && v4)
  {
    preferredWiFiConfiguration = v3;
    v7 = v4;
  }
  else
  {
    preferredWiFiConfiguration = self->_preferredWiFiConfiguration;
    if (!preferredWiFiConfiguration)
    {
      v8 = 0;
      goto LABEL_14;
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    preferredWiFiConfiguration = (id)objc_claimAutoreleasedReturnValue();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  v9 = 0;
  if (!preferredWiFiConfiguration || !v7)
    goto LABEL_25;
  if (!objc_msgSend(preferredWiFiConfiguration, "length"))
  {
LABEL_14:
    v9 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", preferredWiFiConfiguration, CFSTR("wifiSSID"));
  if (-[__CFString length](v8, "length"))
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_forceFailJoinWiFi)
      v10 = &stru_1E483B8E8;
    else
      v10 = v8;
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("wifiPW"));
  }
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9 = v5;
LABEL_25:

  return v9;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__SFDeviceOperationWiFiSetup_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __40__SFDeviceOperationWiFiSetup_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_complete:", v7);

}

- (void)_bonjourTestStart
{
  void *v3;
  CUBonjourBrowser *v4;
  CUBonjourBrowser *bonjourBrowser;
  uint64_t v6;
  void *v7;
  SFSession *sfSession;
  OS_dispatch_source *v9;
  OS_dispatch_source *bonjourTimer;
  NSObject *v11;
  _QWORD handler[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  int v16;
  __int16 v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v16 = 0;
  RandomBytes();
  NSStringWithMACAddress();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_bonjourTestID, v3);
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_bonjourTestState = 1;
  self->_startBonjourTestTicks = mach_absolute_time();
  -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
  v4 = (CUBonjourBrowser *)objc_alloc_init(MEMORY[0x1E0D1B348]);
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = v4;

  -[CUBonjourBrowser setChangeFlags:](self->_bonjourBrowser, "setChangeFlags:", 0xFFFFFFFFLL);
  -[CUBonjourBrowser setDispatchQueue:](self->_bonjourBrowser, "setDispatchQueue:", self->_dispatchQueue);
  -[CUBonjourBrowser setDomain:](self->_bonjourBrowser, "setDomain:", CFSTR("local."));
  -[CUBonjourBrowser setLabel:](self->_bonjourBrowser, "setLabel:", CFSTR("SFDeviceOperationWiFi"));
  -[CUBonjourBrowser setServiceType:](self->_bonjourBrowser, "setServiceType:", CFSTR("_bonjourtest._tcp"));
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke;
  v15[3] = &unk_1E4832880;
  v15[4] = self;
  -[CUBonjourBrowser setDeviceFoundHandler:](self->_bonjourBrowser, "setDeviceFoundHandler:", v15);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_2;
  v14[3] = &unk_1E48328A8;
  v14[4] = self;
  -[CUBonjourBrowser setDeviceChangedHandler:](self->_bonjourBrowser, "setDeviceChangedHandler:", v14);
  -[CUBonjourBrowser activate](self->_bonjourBrowser, "activate");
  v18 = CFSTR("bjtID");
  v19[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  sfSession = self->_sfSession;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_3;
  v13[3] = &unk_1E482E320;
  v13[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_bjtS"), 0, v7, v13);
  v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  bonjourTimer = self->_bonjourTimer;
  self->_bonjourTimer = v9;

  v11 = self->_bonjourTimer;
  handler[0] = v6;
  handler[1] = 3221225472;
  handler[2] = __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_4;
  handler[3] = &unk_1E482DF78;
  handler[4] = self;
  dispatch_source_set_event_handler(v11, handler);
  SFDispatchTimerSet(self->_bonjourTimer, 16.0, -1.0, 1.0);
  dispatch_resume((dispatch_object_t)self->_bonjourTimer);

}

_QWORD *__47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[1])
    return (_QWORD *)objc_msgSend(result, "_bonjourTestFoundDevice:", a2);
  return result;
}

_QWORD *__47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[1])
    return (_QWORD *)objc_msgSend(result, "_bonjourTestFoundDevice:", a2);
  return result;
}

void __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32)
    && gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

uint64_t __47__SFDeviceOperationWiFiSetup__bonjourTestStart__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_bonjourTestTimeout");
}

- (void)_bonjourTestFoundDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  OS_dispatch_source *bonjourTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  CUBonjourBrowser *bonjourBrowser;
  SFSession *sfSession;
  id v12;
  _QWORD v13[5];

  v4 = a3;
  objc_msgSend(v4, "txtDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rpBA"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", self->_bonjourTestID) & 1) != 0)
  {
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      v12 = v4;
      LogPrintF();
    }
    self->_bonjourTestState = 4;
    bonjourTimer = self->_bonjourTimer;
    if (bonjourTimer)
    {
      v8 = bonjourTimer;
      dispatch_source_cancel(v8);
      v9 = self->_bonjourTimer;
      self->_bonjourTimer = 0;

    }
    -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate", v12);
    bonjourBrowser = self->_bonjourBrowser;
    self->_bonjourBrowser = 0;

    sfSession = self->_sfSession;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__SFDeviceOperationWiFiSetup__bonjourTestFoundDevice___block_invoke;
    v13[3] = &unk_1E482E320;
    v13[4] = self;
    -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_bjtD"), 0, MEMORY[0x1E0C9AA70], v13);
  }
  else if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
         && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __54__SFDeviceOperationWiFiSetup__bonjourTestFoundDevice___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v6 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = v7;
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_complete:", 0, v9, v6, v12);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_complete:", 0, v8, v10, v11);
    }
  }

}

- (void)_bonjourTestTimeout
{
  double v3;

  if (!self->_invalidateCalled)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricBonjourTestSeconds = v3;
    if (gLogCategory_SFDeviceOperationWiFiSetup <= 90
      && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_bonjourTestState = 3;
    -[SFDeviceOperationWiFiSetup _complete:](self, "_complete:", 0);
  }
}

- (void)_complete:(id)a3
{
  id v4;
  OS_dispatch_source *bonjourTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *timeoutTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  double v11;
  id completionHandler;
  id v13;

  v4 = a3;
  bonjourTimer = self->_bonjourTimer;
  v13 = v4;
  if (bonjourTimer)
  {
    v6 = bonjourTimer;
    dispatch_source_cancel(v6);
    v7 = self->_bonjourTimer;
    self->_bonjourTimer = 0;

    v4 = v13;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    v10 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

    v4 = v13;
  }
  if (self->_completionHandler)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricTotalSeconds = v11;
    if (v13)
    {
      if (gLogCategory_SFDeviceOperationWiFiSetup > 60
        || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_16;
      }
    }
    else if (gLogCategory_SFDeviceOperationWiFiSetup > 30
           || gLogCategory_SFDeviceOperationWiFiSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_16;
    }
    LogPrintF();
LABEL_16:
    (*((void (**)(id, id))self->_completionHandler + 2))(self->_completionHandler, v13);
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    v4 = v13;
  }

}

- (void)_setupResponse:(id)a3 inResponse:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;
  int Int64Ranged;
  void *v11;
  void *v12;
  NSArray *v13;
  double metricWiFiSetupSeconds;

  v6 = a3;
  v7 = a4;
  mach_absolute_time();
  UpTicksToSecondsF();
  self->_metricWiFiSetupSeconds = v8;
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    metricWiFiSetupSeconds = *(double *)&v7;
    LogPrintF();
  }
  if (v6)
  {
    v9 = v6;
LABEL_13:
    -[SFDeviceOperationWiFiSetup _complete:](self, "_complete:", v9, *(_QWORD *)&metricWiFiSetupSeconds);

    goto LABEL_14;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (Int64Ranged)
  {
    objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
    NSErrorF();
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  self->_wiFiRetryMetrics = v13;

  if (v9)
    goto LABEL_13;
  if ((self->_setupFlags & 1) == 0)
  {
    v9 = 0;
    goto LABEL_13;
  }
  if (gLogCategory_SFDeviceOperationWiFiSetup <= 30
    && (gLogCategory_SFDeviceOperationWiFiSetup != -1 || _LogCategory_Initialize()))
  {
    metricWiFiSetupSeconds = self->_metricWiFiSetupSeconds;
    LogPrintF();
  }
  -[SFDeviceOperationWiFiSetup _bonjourTestStart](self, "_bonjourTestStart", *(_QWORD *)&metricWiFiSetupSeconds);
LABEL_14:

}

- (int)bonjourTestState
{
  return self->_bonjourTestState;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (double)metricBonjourTestSeconds
{
  return self->_metricBonjourTestSeconds;
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (double)metricWiFiSetupSeconds
{
  return self->_metricWiFiSetupSeconds;
}

- (unsigned)repairFlags
{
  return self->_repairFlags;
}

- (void)setRepairFlags:(unsigned int)a3
{
  self->_repairFlags = a3;
}

- (unsigned)setupFlags
{
  return self->_setupFlags;
}

- (void)setSetupFlags:(unsigned int)a3
{
  self->_setupFlags = a3;
}

- (BOOL)skipReachability
{
  return self->_skipReachability;
}

- (void)setSkipReachability:(BOOL)a3
{
  self->_skipReachability = a3;
}

- (BOOL)skipLocalReachability
{
  return self->_skipLocalReachability;
}

- (void)setSkipLocalReachability:(BOOL)a3
{
  self->_skipLocalReachability = a3;
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (unint64_t)retryJoinsCount
{
  return self->_retryJoinsCount;
}

- (void)setRetryJoinsCount:(unint64_t)a3
{
  self->_retryJoinsCount = a3;
}

- (unint64_t)retryScansCount
{
  return self->_retryScansCount;
}

- (void)setRetryScansCount:(unint64_t)a3
{
  self->_retryScansCount = a3;
}

- (NSDictionary)preferredWiFiConfiguration
{
  return self->_preferredWiFiConfiguration;
}

- (void)setPreferredWiFiConfiguration:(id)a3
{
  self->_preferredWiFiConfiguration = (NSDictionary *)a3;
}

- (NSArray)wiFiRetryMetrics
{
  return self->_wiFiRetryMetrics;
}

- (void)setWiFiRetryMetrics:(id)a3
{
  self->_wiFiRetryMetrics = (NSArray *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_reachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourTimer, 0);
  objc_storeStrong((id *)&self->_bonjourTestID, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
}

@end
