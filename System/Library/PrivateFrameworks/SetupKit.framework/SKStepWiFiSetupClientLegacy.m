@implementation SKStepWiFiSetupClientLegacy

- (SKStepWiFiSetupClientLegacy)init
{
  SKStepWiFiSetupClientLegacy *v2;
  SKStepWiFiSetupClientLegacy *v3;
  SKStepWiFiSetupClientLegacy *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKStepWiFiSetupClientLegacy;
  v2 = -[SKStepWiFiSetupClientLegacy init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v3->_ucat = (LogCategory *)&gLogCategory_SKStepWiFiSetupClientLegacy;
    v4 = v3;
  }

  return v3;
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
  v4.super_class = (Class)SKStepWiFiSetupClientLegacy;
  -[SKStepWiFiSetupClientLegacy dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v2;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v2;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  LogCategoryReplaceF();

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__SKStepWiFiSetupClientLegacy_activate__block_invoke;
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
  block[2] = __41__SKStepWiFiSetupClientLegacy_invalidate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateCore
{
  CUBonjourBrowser *bonjourBrowser;
  OS_dispatch_source *bonjourTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  CUReachabilityMonitor *internetReachabilityMonitor;
  OS_dispatch_source *timeoutTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  CWFInterface *wifiInterface;

  -[CUBonjourBrowser invalidate](self->_bonjourBrowser, "invalidate");
  bonjourBrowser = self->_bonjourBrowser;
  self->_bonjourBrowser = 0;

  bonjourTimer = self->_bonjourTimer;
  if (bonjourTimer)
  {
    v5 = bonjourTimer;
    dispatch_source_cancel(v5);
    v6 = self->_bonjourTimer;
    self->_bonjourTimer = 0;

  }
  -[CUReachabilityMonitor invalidate](self->_internetReachabilityMonitor, "invalidate");
  internetReachabilityMonitor = self->_internetReachabilityMonitor;
  self->_internetReachabilityMonitor = 0;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v9 = timeoutTimer;
    dispatch_source_cancel(v9);
    v10 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[CWFInterface invalidate](self->_wifiInterface, "invalidate");
  wifiInterface = self->_wifiInterface;
  self->_wifiInterface = 0;

}

- (void)_invalidated
{
  id skCompletionHandler;
  void *v4;
  int var0;
  void (**v6)(id, void *);

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v6 = (void (**)(id, void *))_Block_copy(self->_skCompletionHandler);
    skCompletionHandler = self->_skCompletionHandler;
    self->_skCompletionHandler = 0;

    if (v6)
    {
      NSErrorF_safe();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v4);

    }
    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();

  }
}

- (void)_completeWithError:(id)a3
{
  int v4;
  double v5;
  double v6;
  int var0;
  void (**v8)(void *, id);
  id skCompletionHandler;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  if (v12)
    v4 = 3;
  else
    v4 = 4;
  self->_runState = v4;
  mach_absolute_time();
  UpTicksToSecondsF();
  v6 = v5;
  self->_metricTotalSeconds = v5;
  var0 = self->_ucat->var0;
  if (v12)
  {
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      LogPrintF();

    }
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v10 = v6;
    LogPrintF();
  }
  -[SKStepWiFiSetupClientLegacy _invalidateCore](self, "_invalidateCore", *(_QWORD *)&v10, v11);
  v8 = (void (**)(void *, id))_Block_copy(self->_skCompletionHandler);
  skCompletionHandler = self->_skCompletionHandler;
  self->_skCompletionHandler = 0;

  if (v8)
    v8[2](v8, v12);

}

- (void)_run
{
  unint64_t runState;
  int v4;
  SKStepWiFiSetupClientLegacy *v5;
  NSError *stepError;
  NSError *v7;
  NSError *v8;
  unint64_t v9;
  int var0;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          runState = self->_runState;
          switch((int)runState)
          {
            case 0:
              self->_runState = 10;
              if (-[SKStepWiFiSetupClientLegacy _runInit](self, "_runInit"))
              {
                v4 = self->_runState + 1;
                goto LABEL_20;
              }
              break;
            case 11:
              self->_runState = 12;
              -[SKStepWiFiSetupClientLegacy _runInternetReachabilityStart](self, "_runInternetReachabilityStart");
              break;
            case 12:
              if (self->_stepError)
                goto LABEL_12;
              if (self->_stepDone)
              {
                v4 = 13;
                goto LABEL_20;
              }
              break;
            case 13:
              self->_runState = 14;
              -[SKStepWiFiSetupClientLegacy _runWiFiSetupStart](self, "_runWiFiSetupStart");
              break;
            case 14:
              if (self->_stepError)
              {
LABEL_12:
                self->_runState = 16;
              }
              else if (self->_stepDone)
              {
                v4 = 15;
LABEL_20:
                self->_runState = v4;
              }
              break;
            case 15:
              v5 = self;
              stepError = 0;
              goto LABEL_17;
            case 16:
              stepError = self->_stepError;
              if (!stepError)
              {
                NSErrorF_safe();
                v7 = (NSError *)objc_claimAutoreleasedReturnValue();
                v8 = self->_stepError;
                self->_stepError = v7;

                stepError = self->_stepError;
              }
              v5 = self;
LABEL_17:
              -[SKStepWiFiSetupClientLegacy _completeWithError:](v5, "_completeWithError:", stepError, v13, v14);
              break;
            default:
              break;
          }
          v9 = self->_runState;
          if (v9 == runState)
            return;
          var0 = self->_ucat->var0;
        }
        while (var0 > 30);
        if (var0 == -1)
          break;
LABEL_24:
        if (runState < 0x11 && ((0x1F8FFuLL >> runState) & 1) != 0)
        {
          v11 = off_24D22AE10[runState];
        }
        else if ((int)runState <= 9)
        {
          v11 = "?";
        }
        else
        {
          v11 = "User";
        }
        if (v9 < 0x11 && ((0x1F8FFuLL >> v9) & 1) != 0)
        {
          v12 = off_24D22AE10[v9];
        }
        else if ((int)v9 <= 9)
        {
          v12 = "?";
        }
        else
        {
          v12 = "User";
        }
        v13 = v11;
        v14 = v12;
        LogPrintF();
      }
      if (_LogCategory_Initialize())
      {
        v9 = self->_runState;
        goto LABEL_24;
      }
    }
  }
}

- (BOOL)_runInit
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  _QWORD v7[6];

  self->_startTicks = mach_absolute_time();
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v3;
  v5 = v3;

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SKStepWiFiSetupClientLegacy__runInit__block_invoke;
  v7[3] = &unk_24D22AFC8;
  v7[4] = v5;
  v7[5] = self;
  dispatch_source_set_event_handler(v5, v7);
  CUDispatchTimerSet();
  dispatch_activate((dispatch_object_t)self->_timeoutTimer);

  return 1;
}

- (void)_runInternetReachabilityStart
{
  int var0;
  NSError *stepError;
  CUReachabilityMonitor *v5;
  CUReachabilityMonitor *internetReachabilityMonitor;
  CUReachabilityMonitor *v7;
  NSError *v8;
  _QWORD v9[6];

  var0 = self->_ucat->var0;
  if (self->_internetReachabilityEnabled)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_stepDone = 0;
    stepError = self->_stepError;
    self->_stepError = 0;

    -[CUReachabilityMonitor invalidate](self->_internetReachabilityMonitor, "invalidate");
    v5 = (CUReachabilityMonitor *)objc_alloc_init(MEMORY[0x24BE29818]);
    internetReachabilityMonitor = self->_internetReachabilityMonitor;
    self->_internetReachabilityMonitor = v5;
    v7 = v5;

    -[CUReachabilityMonitor setDispatchQueue:](v7, "setDispatchQueue:", self->_dispatchQueue);
    -[CUReachabilityMonitor setTimeout:](v7, "setTimeout:", 20.0);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__SKStepWiFiSetupClientLegacy__runInternetReachabilityStart__block_invoke;
    v9[3] = &unk_24D22B140;
    v9[4] = v7;
    v9[5] = self;
    -[CUReachabilityMonitor setCompletionHandler:](v7, "setCompletionHandler:", v9);
    -[CUReachabilityMonitor activate](v7, "activate");

  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_stepDone = 1;
    v8 = self->_stepError;
    self->_stepError = 0;

  }
}

- (void)_runWiFiSetupStart
{
  NSError *stepError;
  CWFInterface *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  CUMessaging *v13;
  int var0;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void (**v26)(_QWORD);
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD aBlock[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  const __CFString *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__2186;
  v35 = __Block_byref_object_dispose__2187;
  v36 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke;
  aBlock[3] = &unk_24D22ADC0;
  aBlock[4] = self;
  aBlock[5] = &v31;
  v26 = (void (**)(_QWORD))_Block_copy(aBlock);
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = self->_wifiInterface;
  if (!v4)
  {
    v4 = (CWFInterface *)objc_alloc_init(MEMORY[0x24BE29F18]);
    objc_storeStrong((id *)&self->_wifiInterface, v4);
    -[CWFInterface activate](v4, "activate");
  }
  -[CWFInterface currentKnownNetworkProfile](v4, "currentKnownNetworkProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CWFInterface channel](v4, "channel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "channel");

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, CFSTR("_wiCh"));

    }
    objc_msgSend(v5, "SSID");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
    {
      v29 = 0;
      MEMORY[0x2199D6DE4](v9, &v29);
      v11 = v29;
      if (v11)
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v11, CFSTR("_wiPW"));
      objc_msgSend(v5, "networkName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v27, "setObject:forKeyedSubscript:", v12, CFSTR("_wiSS"));
        v13 = self->_skMessaging;
        if (v13)
        {
          var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSObject();
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            v17 = "yes";
            if (!v11)
              v17 = "no";
            v24 = v7;
            v25 = v17;
            v23 = v15;
            LogPrintF();

          }
          v37 = CFSTR("timeoutSeconds");
          v38[0] = &unk_24D2337F0;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1, v23, v24, v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke_40;
          v28[3] = &unk_24D22ADF0;
          v28[4] = self;
          -[CUMessaging sendRequestID:requestMessage:options:responseHandler:](v13, "sendRequestID:requestMessage:options:responseHandler:", CFSTR("_wiSU"), v27, v18, v28);
        }
        else
        {
          NSErrorF_safe();
          v22 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v32[5];
          v32[5] = v22;
        }

      }
      else
      {
        NSErrorF_safe();
        v21 = objc_claimAutoreleasedReturnValue();
        v13 = (CUMessaging *)v32[5];
        v32[5] = v21;
      }

    }
    else
    {
      NSErrorF_safe();
      v20 = objc_claimAutoreleasedReturnValue();
      v11 = (id)v32[5];
      v32[5] = v20;
    }

  }
  else
  {
    NSErrorF_safe();
    v19 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v32[5];
    v32[5] = v19;
  }

  v26[2](v26);
  _Block_object_dispose(&v31, 8);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (void)setSkCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_skMessaging, a3);
}

- (SKSetupBase)skSetupObject
{
  return (SKSetupBase *)objc_loadWeakRetained((id *)&self->_skSetupObject);
}

- (void)setSkSetupObject:(id)a3
{
  objc_storeWeak((id *)&self->_skSetupObject, a3);
}

- (double)metricTotalSeconds
{
  return self->_metricTotalSeconds;
}

- (double)metricWiFiSetupSeconds
{
  return self->_metricWiFiSetupSeconds;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiInterface, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_internetReachabilityMonitor, 0);
  objc_storeStrong((id *)&self->_bonjourTimer, 0);
  objc_storeStrong((id *)&self->_bonjourTestID, 0);
  objc_storeStrong((id *)&self->_bonjourBrowser, 0);
}

void __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(v2 + 8) + 40))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = **(_DWORD **)(v3 + 96);
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(a1 + 32), v2 = *(_QWORD *)(a1 + 40), v5))
      {
        CUPrintNSError();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v3 = *(_QWORD *)(a1 + 32);
        v2 = *(_QWORD *)(a1 + 40);
      }
    }
    objc_storeStrong((id *)(v3 + 80), *(id *)(*(_QWORD *)(v2 + 8) + 40));
  }
}

void __49__SKStepWiFiSetupClientLegacy__runWiFiSetupStart__block_invoke_40(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 48))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = v7;
    v8 = v14;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = **(_DWORD **)(v9 + 96);
    if (!v8 || v6)
    {
      if (v10 <= 90 && (v10 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      v12 = v6;
      if (!v6)
      {
        NSErrorF_safe();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), v12);
      if (!v6)

    }
    else
    {
      if (v10 <= 30)
      {
        if (v10 != -1 || (v11 = _LogCategory_Initialize(), v9 = *(_QWORD *)(a1 + 32), v11))
        {
          v13 = *(void **)(v9 + 160);
          LogPrintF();
          v9 = *(_QWORD *)(a1 + 32);
        }
      }
      *(_BYTE *)(v9 + 72) = 1;
    }
    objc_msgSend(*(id *)(a1 + 32), "_run", v13);

  }
}

void __60__SKStepWiFiSetupClientLegacy__runInternetReachabilityStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v4 == *(void **)(v5 + 40))
  {
    *(_QWORD *)(v5 + 40) = 0;
    v12 = v3;

    if (v12)
    {
      NSErrorNestedF();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 80);
      *(_QWORD *)(v7 + 80) = v6;

      v9 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 96);
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
    else
    {
      v10 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 96);
      if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 72) = 1;
    objc_msgSend(*(id *)(a1 + 40), "_run", v11);
    v3 = v12;
  }

}

uint64_t __39__SKStepWiFiSetupClientLegacy__runInit__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(a1 + 40);
  if (v3 == *(_QWORD *)(result + 88))
  {
    v4 = **(_DWORD **)(result + 96);
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), result = *(_QWORD *)(a1 + 40), v5))
      {
        LogPrintF();
        result = *(_QWORD *)(a1 + 40);
      }
    }
    if (!*(_QWORD *)(result + 80))
    {
      NSErrorF_safe();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      v8 = *(void **)(v7 + 80);
      *(_QWORD *)(v7 + 80) = v6;

      result = *(_QWORD *)(a1 + 40);
    }
    return objc_msgSend((id)result, "_run");
  }
  return result;
}

uint64_t __41__SKStepWiFiSetupClientLegacy_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 48))
  {
    v2 = result;
    *(_BYTE *)(v1 + 48) = 1;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[12];
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v5))
      {
        LogPrintF();
        v3 = *(_DWORD ***)(v2 + 32);
      }
    }
    objc_msgSend(v3, "_invalidateCore");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

uint64_t __39__SKStepWiFiSetupClientLegacy_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = **(_DWORD **)(v2 + 96);
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  *(_BYTE *)(v2 + 32) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

@end
