@implementation SFDeviceRepairService

- (SFDeviceRepairService)init
{
  SFDeviceRepairService *v2;
  SFDeviceRepairService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  SFDeviceRepairService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFDeviceRepairService;
  v2 = -[SFDeviceRepairService init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)activate
{
  uint64_t v3;
  NSObject *dispatchQueue;
  OS_dispatch_source *v5;
  OS_dispatch_source *repairMetricsTimer;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFDeviceRepairService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  if (!self->_repairMetricsTimer)
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    repairMetricsTimer = self->_repairMetricsTimer;
    self->_repairMetricsTimer = v5;

    v7 = self->_repairMetricsTimer;
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __33__SFDeviceRepairService_activate__block_invoke_2;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    dispatch_source_set_event_handler(v7, v8);
    SFDispatchTimerSet(self->_repairMetricsTimer, 86400.0, 86400.0, -5.0);
    dispatch_resume((dispatch_object_t)self->_repairMetricsTimer);
  }
}

uint64_t __33__SFDeviceRepairService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = CFPrefs_GetInt64() != 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_sfServiceStart");
}

uint64_t __33__SFDeviceRepairService_activate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_repairMetricsDailyPush");
}

- (void)setProblemFlags:(unint64_t)a3
{
  uint64_t v5;

  if (-[SFDeviceRepairService _lastProblemRecorded](self, "_lastProblemRecorded") != a3)
  {
    -[SFDeviceRepairService _repairMetricsNewProblemFlags:](self, "_repairMetricsNewProblemFlags:", a3);
    -[SFDeviceRepairService _recordNewProblem:](self, "_recordNewProblem:", a3);
  }
  self->_problemFlags = a3;
  if (a3)
    v5 = 10;
  else
    v5 = 0;
  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", v5);
  -[SFService setProblemFlags:](self->_sfService, "setProblemFlags:", a3);
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", a3 != 0);
}

- (void)invalidate
{
  -[SFDeviceRepairService invalidateWithFlags:](self, "invalidateWithFlags:", 0);
}

- (void)invalidateWithFlags:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  unsigned int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__SFDeviceRepairService_invalidateWithFlags___block_invoke;
  v4[3] = &unk_1E4830D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __45__SFDeviceRepairService_invalidateWithFlags___block_invoke(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 9))
  {
    v1 = result;
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      v3 = *(unsigned int *)(v1 + 40);
      v4 = &unk_1A2AF831A;
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 9) = 1;
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 12) = *(_DWORD *)(v1 + 40);
    v2 = *(_QWORD **)(v1 + 32);
    if ((*(_BYTE *)(v1 + 40) & 1) != 0 && v2[3])
    {
      if (gLogCategory_SFDeviceRepairService <= 30
        && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "setNeedsSetup:", 0, v3, v4);
      result = objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "deviceActionType");
      if ((_DWORD)result)
        return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "setDeviceActionType:", 0);
    }
    else
    {
      return objc_msgSend(v2, "_invalidate");
    }
  }
  return result;
}

- (void)_invalidate
{
  SFService *sfService;
  void (**progressHandler)(id, uint64_t, _QWORD);
  id v5;

  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    -[SFDeviceRepairService _handleSessionEnded:](self, "_handleSessionEnded:", self->_sfSession);
    -[SFService invalidate](self->_sfService, "invalidate");
    sfService = self->_sfService;
    self->_sfService = 0;

    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
    {
      progressHandler[2](progressHandler, 20, 0);
      v5 = self->_progressHandler;
    }
    else
    {
      v5 = 0;
    }
    self->_progressHandler = 0;

    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_sfServiceStart
{
  SFService *v3;
  SFService *sfService;
  uint64_t v5;
  uint64_t v6;
  SFService *v7;
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setIdentifier:](self->_sfService, "setIdentifier:", CFSTR("com.apple.sharing.Repair"));
  -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("TTF"));
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", self->_problemFlags != 0);
  if (self->_problemFlags)
    v5 = 10;
  else
    v5 = 0;
  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", v5);
  -[SFService setOverrideScreenOff:](self->_sfService, "setOverrideScreenOff:", 1);
  -[SFService setPairSetupDisabled:](self->_sfService, "setPairSetupDisabled:", 1);
  -[SFService setProblemFlags:](self->_sfService, "setProblemFlags:", self->_problemFlags);
  -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 33);
  -[SFService setOverrideScreenOff:](self->_sfService, "setOverrideScreenOff:", 1);
  -[SFService setTouchRemoteEnabled:](self->_sfService, "setTouchRemoteEnabled:", 1);
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__SFDeviceRepairService__sfServiceStart__block_invoke;
  v10[3] = &unk_1E482FA30;
  v10[4] = self;
  -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v10);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __40__SFDeviceRepairService__sfServiceStart__block_invoke_2;
  v9[3] = &unk_1E482FA58;
  v9[4] = self;
  -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v9);
  v7 = self->_sfService;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __40__SFDeviceRepairService__sfServiceStart__block_invoke_3;
  v8[3] = &unk_1E482DFF0;
  v8[4] = self;
  -[SFService activateWithCompletion:](v7, "activateWithCompletion:", v8);
}

uint64_t __40__SFDeviceRepairService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStarted:", a2);
}

uint64_t __40__SFDeviceRepairService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEnded:", a2);
}

void __40__SFDeviceRepairService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFDeviceRepairService <= 90
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160);
    if (v4)
    {
      v6 = CFSTR("eo");
      v7[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, 30, v5);

    }
  }

}

- (void)_repairMetricsDailyPush
{
  __CFString *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  unint64_t problemFlags;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  problemFlags = self->_problemFlags;
  NSAppendPrintF();
  v3 = (__CFString *)0;
  v16[0] = CFSTR("rawflags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_problemFlags, problemFlags, &unk_1A2AF832B);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("problemFlags");
  v17[0] = v4;
  v5 = &stru_1E483B8E8;
  if (v3)
    v5 = v3;
  v17[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  -[SFDeviceRepairService _whenLastProblemWasRecorded](self, "_whenLastProblemWasRecorded");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = self->_problemFlags;
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v8);
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v13 = CFSTR("timeInBad");
    else
      v13 = CFSTR("timeInGood");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v13);

  }
  v14 = (void *)objc_msgSend(v7, "copy");
  SFMetricsLog(CFSTR("com.apple.sharing.ServiceProblemFlagsDaily"), v14);

}

- (void)_repairMetricsNewProblemFlags:(unint64_t)a3
{
  unint64_t v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  __CFString *v28;
  _QWORD v29[6];
  _QWORD v30[8];

  v30[6] = *MEMORY[0x1E0C80C00];
  v5 = -[SFDeviceRepairService _lastProblemRecorded](self, "_lastProblemRecorded");
  NSAppendPrintF();
  v6 = (const __CFString *)0;
  NSAppendPrintF();
  v7 = (const __CFString *)0;
  NSAppendPrintF();
  v8 = (__CFString *)0;
  v29[0] = CFSTR("flags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3, v5, &unk_1A2AF832B);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v28 = (__CFString *)v6;
  if (v6)
    v11 = v6;
  else
    v11 = &stru_1E483B8E8;
  v30[0] = v9;
  v30[1] = v11;
  v29[1] = CFSTR("problemFlags");
  v29[2] = CFSTR("prevFlags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_problemFlags);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v27 = (__CFString *)v7;
  if (v7)
    v14 = v7;
  else
    v14 = &stru_1E483B8E8;
  v30[2] = v12;
  v30[3] = v14;
  v29[3] = CFSTR("prevFlagsStr");
  v29[4] = CFSTR("lastProblem");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v29[5] = CFSTR("lastProblemStr");
  if (v8)
    v17 = v8;
  else
    v17 = &stru_1E483B8E8;
  v30[4] = v15;
  v30[5] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  -[SFDeviceRepairService _whenLastProblemWasRecorded](self, "_whenLastProblemWasRecorded");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (a3 && !v5)
    {
      v21 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", v20);
      objc_msgSend(v21, "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("timeInGood");
LABEL_17:
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, v24);

      goto LABEL_18;
    }
    if (!a3 && v5)
    {
      v25 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", v20);
      objc_msgSend(v25, "numberWithDouble:");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("timeInBad");
      goto LABEL_17;
    }
  }
LABEL_18:
  v26 = (void *)objc_msgSend(v19, "copy");
  SFMetricsLog(CFSTR("com.apple.sharing.ServiceProblemFlags"), v26);

}

- (void)_recordNewProblem:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("lastProblemTimeIntervalSince1970"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("lastProblemFlags"));

}

- (unint64_t)_lastProblemRecorded
{
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastProblemFlags"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (id)_whenLastProblemWasRecorded
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("lastProblemTimeIntervalSince1970"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession **p_sfSession;
  void *v7;
  uint64_t v8;
  unint64_t problemFlags;
  __WiFiManagerClient *v10;
  uint64_t v11;
  SFSession *sfSession;
  SFDeviceOperationHandlerWiFiSetup *v13;
  SFDeviceOperationHandlerWiFiSetup *wifiSetupHandler;
  SFDeviceOperationHandlerCNJSetup *v15;
  SFDeviceOperationHandlerCNJSetup *captiveNetworkHandler;
  SFSession *v17;
  HMDeviceSetupOperationHandler *v18;
  HMDeviceSetupOperationHandler *homeKitSetupHandler;
  HMDeviceSetupOperationHandler *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];

  v5 = a3;
  p_sfSession = &self->_sfSession;
  if (!self->_sfSession)
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    v8 = mach_absolute_time();
    problemFlags = self->_problemFlags;
    self->_startTicks = v8;
    self->_startProblemFlags = problemFlags;
    objc_storeStrong((id *)&self->_sfSession, a3);
    v10 = (__WiFiManagerClient *)WiFiManagerClientCreate();
    self->_wifiManager = v10;
    if (v10)
    {
      WiFiManagerClientDisable();
    }
    else if (gLogCategory_SFDeviceRepairService <= 60
           && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = MEMORY[0x1E0C809B0];
    sfSession = self->_sfSession;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __47__SFDeviceRepairService__handleSessionStarted___block_invoke;
    v24[3] = &unk_1E482E2D0;
    v24[4] = self;
    -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("_getprob"), 0, v24, v21);
    v13 = objc_alloc_init(SFDeviceOperationHandlerWiFiSetup);
    wifiSetupHandler = self->_wifiSetupHandler;
    self->_wifiSetupHandler = v13;

    -[SFDeviceOperationHandlerWiFiSetup setDispatchQueue:](self->_wifiSetupHandler, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceOperationHandlerWiFiSetup setSfSession:](self->_wifiSetupHandler, "setSfSession:", v5);
    -[SFDeviceOperationHandlerWiFiSetup activate](self->_wifiSetupHandler, "activate");
    if (SFDeviceClassCodeGet() == 4)
    {
      v15 = objc_alloc_init(SFDeviceOperationHandlerCNJSetup);
      captiveNetworkHandler = self->_captiveNetworkHandler;
      self->_captiveNetworkHandler = v15;

      -[SFDeviceOperationHandlerCNJSetup setDispatchQueue:](self->_captiveNetworkHandler, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHandlerCNJSetup setSfSession:](self->_captiveNetworkHandler, "setSfSession:", v5);
      -[SFDeviceOperationHandlerCNJSetup activate](self->_captiveNetworkHandler, "activate");
    }
    v17 = self->_sfSession;
    v23[0] = v11;
    v23[1] = 3221225472;
    v23[2] = __47__SFDeviceRepairService__handleSessionStarted___block_invoke_2;
    v23[3] = &unk_1E482E2D0;
    v23[4] = self;
    -[SFSession registerRequestID:options:handler:](v17, "registerRequestID:options:handler:", CFSTR("_finish"), 0, v23);
    v18 = (HMDeviceSetupOperationHandler *)objc_alloc_init((Class)getHMDeviceSetupOperationHandlerClass_0[0]());
    homeKitSetupHandler = self->_homeKitSetupHandler;
    self->_homeKitSetupHandler = v18;

    v20 = self->_homeKitSetupHandler;
    -[SFSession trSession](self->_sfSession, "trSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDeviceSetupOperationHandler registerMessageHandlersForSession:](v20, "registerMessageHandlersForSession:", v7);
    goto LABEL_20;
  }
  if (gLogCategory_SFDeviceRepairService <= 60
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v5, "peer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSession peer](*p_sfSession, "peer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

LABEL_20:
  }

}

uint64_t __47__SFDeviceRepairService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleGetProblemsRequest:responseHandler:");
}

uint64_t __47__SFDeviceRepairService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishRequest:responseHandler:");
}

- (void)_registerCDPAndTouchRemoteIfNecessary
{
  SFDeviceOperationHandlerCDPSetup *v3;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  SFTouchRemoteAccountServicesHandlerConfiguration *v5;
  void *v6;
  SFTouchRemoteAccountServicesHandler *v7;
  SFTouchRemoteAccountServicesHandler *touchRemoteHandler;
  SFTouchRemoteAccountServicesHandler *v9;
  void *v10;
  id v11;
  id v12;

  if (!-[SFDeviceRepairService _shouldRunAppleIDSetup](self, "_shouldRunAppleIDSetup"))
  {
    if (self->_prefCDPEnabled)
    {
      v3 = objc_alloc_init(SFDeviceOperationHandlerCDPSetup);
      cdpSetupHandler = self->_cdpSetupHandler;
      self->_cdpSetupHandler = v3;

      -[SFDeviceOperationHandlerCDPSetup setDispatchQueue:](self->_cdpSetupHandler, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHandlerCDPSetup setFailIfCDPNotEnabled:](self->_cdpSetupHandler, "setFailIfCDPNotEnabled:", 1);
      -[SFDeviceOperationHandlerCDPSetup setSfSession:](self->_cdpSetupHandler, "setSfSession:", self->_sfSession);
      -[SFDeviceOperationHandlerCDPSetup activate](self->_cdpSetupHandler, "activate");
    }
    v5 = objc_alloc_init(SFTouchRemoteAccountServicesHandlerConfiguration);
    -[SFTouchRemoteAccountServicesHandlerConfiguration setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E48917F8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFTouchRemoteAccountServicesHandlerConfiguration setSupportedTRAccountServices:](v5, "setSupportedTRAccountServices:", v6);

    -[SFTouchRemoteAccountServicesHandlerConfiguration setIsPrimaryAppleAccount:](v5, "setIsPrimaryAppleAccount:", 1);
    -[SFTouchRemoteAccountServicesHandlerConfiguration setShouldActivateStoreAccount:](v5, "setShouldActivateStoreAccount:", SFDeviceClassCodeGet() == 4);
    -[SFTouchRemoteAccountServicesHandlerConfiguration setShouldSuppressStoreSignInDialogs:](v5, "setShouldSuppressStoreSignInDialogs:", 1);
    -[SFTouchRemoteAccountServicesHandlerConfiguration setShouldIgnoreStoreAccountConversion:](v5, "setShouldIgnoreStoreAccountConversion:", 1);
    v7 = -[SFTouchRemoteAccountServicesHandler initWithConfiguration:]([SFTouchRemoteAccountServicesHandler alloc], "initWithConfiguration:", v5);
    touchRemoteHandler = self->_touchRemoteHandler;
    self->_touchRemoteHandler = v7;

    v9 = self->_touchRemoteHandler;
    -[SFSession trSession](self->_sfSession, "trSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    LOBYTE(v9) = -[SFTouchRemoteAccountServicesHandler activateWithSession:error:](v9, "activateWithSession:error:", v10, &v12);
    v11 = v12;

    if ((v9 & 1) == 0
      && gLogCategory_SFDeviceRepairService <= 90
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (BOOL)_localDeviceSupportsAppleIDSetup
{
  int v2;

  v2 = _os_feature_enabled_impl();
  if (v2)
    LOBYTE(v2) = SFDeviceClassCodeGet() == 6;
  return v2;
}

- (BOOL)_shouldRunAppleIDSetup
{
  unint64_t v2;

  v2 = (self->_peerFeatureFlags >> 15) & 1;
  return -[SFDeviceRepairService _localDeviceSupportsAppleIDSetup](self, "_localDeviceSupportsAppleIDSetup") & v2;
}

- (void)_registerAppleIDSetupIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[SFDeviceRepairService _shouldRunAppleIDSetup](self, "_shouldRunAppleIDSetup"))
    return;
  if (!self->_altDSID)
  {
    if (gLogCategory_SFDeviceRepairService > 90
      || gLogCategory_SFDeviceRepairService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
LABEL_12:
    LogPrintF();
    return;
  }
  -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (gLogCategory_SFDeviceRepairService > 90
      || gLogCategory_SFDeviceRepairService == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_12;
  }
  v6 = objc_alloc_init((Class)getAISRepairControllerClass[0]());
  v4 = (void *)objc_msgSend(objc_alloc((Class)getAISRepairContextClass[0]()), "initWithAltDSID:", self->_altDSID);
  -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessageSessionTemplate:", v5);

  objc_msgSend(v4, "setRemoteRole:", 4);
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v6, "repairWithContext:completionHandler:", v4, &__block_literal_global_46);

}

void __57__SFDeviceRepairService__registerAppleIDSetupIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (v4)
  {
    if (gLogCategory_SFDeviceRepairService <= 90
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceRepairService <= 30
         && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }

}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  SFSession *v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  HMDeviceSetupOperationHandler *homeKitSetupHandler;
  SFDeviceOperationHandlerWiFiSetup *wifiSetupHandler;
  SFDeviceOperationHandlerCNJSetup *captiveNetworkHandler;
  SFTouchRemoteAccountServicesHandler *touchRemoteHandler;
  SFSession *v22;
  void *v23;
  unint64_t startProblemFlags;
  _QWORD v25[5];
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  sfSession = (SFSession *)a3;
  v5 = sfSession;
  if (self->_sfSession != sfSession)
    goto LABEL_23;
  if (sfSession && gLogCategory_SFDeviceRepairService <= 30)
  {
    if (gLogCategory_SFDeviceRepairService == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_7;
      sfSession = self->_sfSession;
    }
    -[SFSession peer](sfSession, "peer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_7:
  NSAppendPrintF();
  v6 = (__CFString *)0;
  startProblemFlags = self->_startProblemFlags;
  NSAppendPrintF();
  v7 = (__CFString *)0;
  v25[0] = CFSTR("flags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_problemFlags, startProblemFlags, &unk_1A2AF832B);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6)
    v10 = v6;
  else
    v10 = &stru_1E483B8E8;
  v26[0] = v8;
  v26[1] = v10;
  v25[1] = CFSTR("problemFlags");
  v25[2] = CFSTR("startFlags");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_startProblemFlags);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v7)
    v13 = v7;
  else
    v13 = &stru_1E483B8E8;
  v26[2] = v11;
  v26[3] = v13;
  v25[3] = CFSTR("startFlagsStr");
  v25[4] = CFSTR("totalMs");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  mach_absolute_time();
  objc_msgSend(v14, "numberWithUnsignedLongLong:", UpTicksToMilliseconds());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[4] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.RepairPerformed"), v16);

  -[SFSession deregisterRequestID:](self->_sfSession, "deregisterRequestID:", CFSTR("_getprob"));
  -[SFDeviceOperationHandlerCDPSetup invalidate](self->_cdpSetupHandler, "invalidate");
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0;

  -[SFDeviceOperationHandlerWiFiSetup invalidate](self->_wifiSetupHandler, "invalidate");
  wifiSetupHandler = self->_wifiSetupHandler;
  self->_wifiSetupHandler = 0;

  -[SFDeviceOperationHandlerCNJSetup invalidate](self->_captiveNetworkHandler, "invalidate");
  captiveNetworkHandler = self->_captiveNetworkHandler;
  self->_captiveNetworkHandler = 0;

  if (self->_wifiManager)
  {
    WiFiManagerClientEnable();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
  }
  -[SFTouchRemoteAccountServicesHandler invalidate](self->_touchRemoteHandler, "invalidate");
  touchRemoteHandler = self->_touchRemoteHandler;
  self->_touchRemoteHandler = 0;

  v22 = self->_sfSession;
  self->_sfSession = 0;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFDeviceRepairService _invalidate](self, "_invalidate");
  }

LABEL_23:
}

- (void)_handleGetProblemsRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t problemFlags;
  uint64_t v10;
  AKAccountManager *v11;
  AKAccountManager *akAccountManager;
  ACAccountStore *accountStore;
  ACAccountStore *v14;
  ACAccountStore *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    v28 = v6;
    LogPrintF();
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ff"), v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    self->_peerFeatureFlags = objc_msgSend(v8, "unsignedLongLongValue");
  -[SFDeviceRepairService _registerAppleIDSetupIfNecessary](self, "_registerAppleIDSetupIfNecessary");
  -[SFDeviceRepairService _registerCDPAndTouchRemoteIfNecessary](self, "_registerCDPAndTouchRemoteIfNecessary");
  problemFlags = self->_problemFlags;
  if (CNUserInteractionIsRequired())
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    problemFlags |= 0x200000uLL;
  }
  if (-[SFDeviceRepairService _localDeviceSupportsAppleIDSetup](self, "_localDeviceSupportsAppleIDSetup"))
    v10 = 40960;
  else
    v10 = 0x2000;
  if (!self->_akAccountManager)
  {
    objc_msgSend((Class)getAKAccountManagerClass[0](), "sharedInstance");
    v11 = (AKAccountManager *)objc_claimAutoreleasedReturnValue();
    akAccountManager = self->_akAccountManager;
    self->_akAccountManager = v11;

  }
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    objc_msgSend((Class)getACAccountStoreClass_3[0](), "defaultStore");
    v14 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    v15 = self->_accountStore;
    self->_accountStore = v14;

    accountStore = self->_accountStore;
  }
  -[ACAccountStore aa_primaryAppleAccount](accountStore, "aa_primaryAppleAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "aa_altDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAccountManager authKitAccountWithAltDSID:](self->_akAccountManager, "authKitAccountWithAltDSID:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAccountManager continuationTokenForAccount:](self->_akAccountManager, "continuationTokenForAccount:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = SFDeviceClassCodeGet() != 4 && SFDeviceClassCodeGet() != 6;
  v29 = v6;
  if (!v20 && !v19)
  {
    if (gLogCategory_SFDeviceRepairService <= 30
      && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    problemFlags |= 2uLL;
  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", problemFlags);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("dpf"));

  objc_msgSend(v21, "setObject:forKeyedSubscript:", CFSTR("1945.10.6"), CFSTR("shv"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("ff"));

  v24 = (void *)WiFiCopyCurrentNetworkInfoEx();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("wifiSSID"));
  softLinkIDSCopyLocalDeviceUniqueID[0]();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("idsID"));
  v27 = (void *)GestaltCopyAnswer();
  if (v27)
  {
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, CFSTR("osBuild"));
  }
  else
  {
    if (gLogCategory_SFDeviceRepairService > 60)
      goto LABEL_43;
    if (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize())
      LogPrintF();
  }
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_43:
  (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v21);

}

- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceRepairService <= 30
    && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, MEMORY[0x1E0C9AA70]);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SFDeviceRepairService__handleFinishRequest_responseHandler___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

uint64_t __62__SFDeviceRepairService__handleFinishRequest_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 9))
  {
    v1 = result;
    if (SFDeviceClassCodeGet() == 4)
    {
      if (gLogCategory_SFDeviceRepairService <= 30
        && (gLogCategory_SFDeviceRepairService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v2 = (void *)objc_msgSend(objc_alloc((Class)getFLFollowUpControllerClass[0]()), "initWithClientIdentifier:", 0);
      objc_msgSend(v2, "clearPendingFollowUpItems:", 0);

    }
    result = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 160);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 96, 0);
  }
  return result;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_touchRemoteHandler, 0);
  objc_storeStrong((id *)&self->_akAccountManager, 0);
  objc_storeStrong((id *)&self->_repairMetricsTimer, 0);
  objc_storeStrong((id *)&self->_captiveNetworkHandler, 0);
  objc_storeStrong((id *)&self->_wifiSetupHandler, 0);
  objc_storeStrong((id *)&self->_homeKitSetupHandler, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
}

@end
