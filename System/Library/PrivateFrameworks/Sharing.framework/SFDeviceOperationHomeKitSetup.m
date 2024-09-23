@implementation SFDeviceOperationHomeKitSetup

- (SFDeviceOperationHomeKitSetup)init
{
  SFDeviceOperationHomeKitSetup *v2;
  SFDeviceOperationHomeKitSetup *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceOperationHomeKitSetup;
  v2 = -[SFDeviceOperationHomeKitSetup init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_timeoutInSeconds = 300.0;
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
  block[2] = __41__SFDeviceOperationHomeKitSetup_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFDeviceOperationHomeKitSetup_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SFDeviceOperationHomeKitSetup_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __43__SFDeviceOperationHomeKitSetup_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_completeWithError:", v2);

}

- (void)_cleanup
{
  id completionHandler;
  id pauseHandler;
  id promptForHomeHandler;
  id promptForRoomHandler;
  id promptToInstallHomeAppHandler;
  TRSession *trSession;
  OS_dispatch_source *timeoutTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  TROperationQueue *trOperationQueue;
  HMHomeManager *homeKitHomeManager;
  HMAccessoryBrowser *homeKitBrowser;
  HMAccessory *homeKitAccessory;
  HMHome *homeKitSelectedHome;
  HMRoom *homeKitSelectedRoom;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  pauseHandler = self->_pauseHandler;
  self->_pauseHandler = 0;

  promptForHomeHandler = self->_promptForHomeHandler;
  self->_promptForHomeHandler = 0;

  promptForRoomHandler = self->_promptForRoomHandler;
  self->_promptForRoomHandler = 0;

  promptToInstallHomeAppHandler = self->_promptToInstallHomeAppHandler;
  self->_promptToInstallHomeAppHandler = 0;

  trSession = self->_trSession;
  self->_trSession = 0;

  self->_active = 0;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[TROperationQueue invalidate](self->_trOperationQueue, "invalidate");
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  homeKitHomeManager = self->_homeKitHomeManager;
  self->_homeKitHomeManager = 0;

  -[HMAccessoryBrowser stopSearchingForNewAccessories](self->_homeKitBrowser, "stopSearchingForNewAccessories");
  homeKitBrowser = self->_homeKitBrowser;
  self->_homeKitBrowser = 0;

  -[HMDeviceSetupOperation cancel](self->_homeKitDeviceSetupOperation, "cancel");
  -[HMDeviceSetupOperation setCompletionBlock:](self->_homeKitDeviceSetupOperation, "setCompletionBlock:", 0);
  homeKitAccessory = self->_homeKitAccessory;
  self->_homeKitAccessory = 0;

  homeKitSelectedHome = self->_homeKitSelectedHome;
  self->_homeKitSelectedHome = 0;

  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  self->_homeKitSelectedRoom = 0;

}

- (void)_removeAccessoryIfNeeded
{
  if (self->_homeKitAddedAccessory)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HMHome removeAccessory:completionHandler:](self->_homeKitSelectedHome, "removeAccessory:completionHandler:", self->_homeKitAccessory, &__block_literal_global_44);
  }
}

void __57__SFDeviceOperationHomeKitSetup__removeAccessoryIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  int v5;
  void *v6;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90)
    {
      v6 = v2;
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
LABEL_7:
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    v6 = 0;
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = 0;
    if (v5)
      goto LABEL_7;
  }

}

- (void)_completeWithError:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  int v8;
  double metricNonUserSeconds;
  void (**completionHandler)(id, id);
  int v11;
  double v12;
  double metricUserSeconds;
  id v14;

  v4 = a3;
  v14 = v4;
  if (self->_homeKitHomeManager && self->_isCLIMode && self->_hdsutilHKToken)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HMHomeManager _endActiveAssertion:](self->_homeKitHomeManager, "_endActiveAssertion:", self->_hdsutilHKToken);
    v4 = v14;
  }
  if (!self->_active)
    goto LABEL_27;
  if (!v4)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    v6 = v5;
    if (gLogCategory_SFDeviceOperationHomeKitSetup >= 31)
    {
      self->_metricNonUserSeconds = v5 + self->_metricNonUserSeconds;
      self->_state = 4;
      goto LABEL_27;
    }
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize())
    {
      v12 = v6;
      LogPrintF();
    }
    v8 = gLogCategory_SFDeviceOperationHomeKitSetup;
    metricNonUserSeconds = v6 + self->_metricNonUserSeconds;
    self->_metricNonUserSeconds = metricNonUserSeconds;
    self->_state = 4;
    if (v8 > 30)
      goto LABEL_27;
    if (v8 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_27;
      metricNonUserSeconds = self->_metricNonUserSeconds;
    }
    v12 = metricNonUserSeconds;
    metricUserSeconds = self->_metricUserSeconds;
LABEL_26:
    LogPrintF();
    goto LABEL_27;
  }
  self->_state = 3;
  -[SFDeviceOperationHomeKitSetup _removeAccessoryIfNeeded](self, "_removeAccessoryIfNeeded");
  if (objc_msgSend(v14, "code") != -6723)
  {
    v7 = *(double *)&v14;
    if (gLogCategory_SFDeviceOperationHomeKitSetup > 60)
      goto LABEL_27;
    if (gLogCategory_SFDeviceOperationHomeKitSetup == -1)
    {
      v11 = _LogCategory_Initialize();
      v7 = *(double *)&v14;
      if (!v11)
        goto LABEL_27;
    }
    v12 = v7;
    goto LABEL_26;
  }
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_26;
  }
LABEL_27:
  completionHandler = (void (**)(id, id))self->_completionHandler;
  if (completionHandler)
    completionHandler[2](completionHandler, v14);
  -[SFDeviceOperationHomeKitSetup _cleanup](self, "_cleanup", *(_QWORD *)&v12, *(_QWORD *)&metricUserSeconds);

}

- (void)homeAppInstallChoice:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__SFDeviceOperationHomeKitSetup_homeAppInstallChoice___block_invoke;
  v4[3] = &unk_1E482E4B8;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __54__SFDeviceOperationHomeKitSetup_homeAppInstallChoice___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 72) = 1;
    if (*(_BYTE *)(v1 + 40))
      objc_msgSend(*(id *)(v1 + 32), "_restoreHomeApp");
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (id)homeKitAccessory
{
  return self->_homeKitAccessory;
}

- (void)resume
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceOperationHomeKitSetup_resume__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFDeviceOperationHomeKitSetup_resume__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup >= 31)
    {
      *(_BYTE *)(v1 + 9) = 0;
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize())
        LogPrintF();
      v3 = gLogCategory_SFDeviceOperationHomeKitSetup;
      *(_BYTE *)(*(_QWORD *)(v2 + 32) + 9) = 0;
      if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    *(_QWORD *)(*(_QWORD *)(v2 + 32) + 16) = mach_absolute_time();
    objc_msgSend(*(id *)(v2 + 32), "_startTimeout:", *(double *)(*(_QWORD *)(v2 + 32) + 384));
    return objc_msgSend(*(id *)(v2 + 32), "_run");
  }
  return result;
}

- (void)selectHome:(id)a3
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
  v7[2] = __44__SFDeviceOperationHomeKitSetup_selectHome___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __44__SFDeviceOperationHomeKitSetup_selectHome___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(double *)(*(_QWORD *)(a1 + 32) + 248) = v2 + *(double *)(*(_QWORD *)(a1 + 32) + 248);
    if ((objc_msgSend(*(id *)(a1 + 32), "_isOwnerOfHome:", *(_QWORD *)(a1 + 40)) & 1) != 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 40));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = mach_absolute_time();
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 32), "_startTimeout:", *(double *)(*(_QWORD *)(a1 + 32) + 384));
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    else
    {
      NSErrorWithOSStatusF();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "userInfo");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v3, "mutableCopy");
      v5 = v4;
      if (v4)
        v6 = v4;
      else
        v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = v6;

      objc_msgSend(*(id *)(a1 + 40), "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("SFErrorKeyHomeName"));

      objc_msgSend(*(id *)(a1 + 40), "owner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("SFErrorKeyHomeOwnerAccount"));

      v11 = objc_alloc(MEMORY[0x1E0CB35C8]);
      objc_msgSend(v14, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, objc_msgSend(v14, "code"), v7);

      objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v13);
    }
  }
}

- (void)reselectHome
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__SFDeviceOperationHomeKitSetup_reselectHome__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __45__SFDeviceOperationHomeKitSetup_reselectHome__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 96) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)selectRoom:(id)a3
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
  v7[2] = __44__SFDeviceOperationHomeKitSetup_selectRoom___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __44__SFDeviceOperationHomeKitSetup_selectRoom___block_invoke(uint64_t result)
{
  uint64_t v1;
  double v2;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(double *)(*(_QWORD *)(v1 + 32) + 248) = v2 + *(double *)(*(_QWORD *)(v1 + 32) + 248);
    *(_QWORD *)(*(_QWORD *)(v1 + 32) + 16) = mach_absolute_time();
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(_QWORD *)(v1 + 32) + 216), *(id *)(v1 + 40));
    objc_msgSend(*(id *)(v1 + 32), "_startTimeout:", *(double *)(*(_QWORD *)(v1 + 32) + 384));
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)_startTimeout:(double)a3
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  _QWORD v11[6];

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v6 = timeoutTimer;
    dispatch_source_cancel(v6);
    v7 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v9 = self->_timeoutTimer;
  self->_timeoutTimer = v8;

  v10 = self->_timeoutTimer;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__SFDeviceOperationHomeKitSetup__startTimeout___block_invoke;
  v11[3] = &unk_1E482E018;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  dispatch_source_set_event_handler(v10, v11);
  SFDispatchTimerSet(self->_timeoutTimer, a3, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
}

void __47__SFDeviceOperationHomeKitSetup__startTimeout___block_invoke(uint64_t a1)
{
  unsigned int v2;
  const char *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) - 10;
  if (v2 > 0x24)
    v3 = "HomeKitSetupUnknownState?";
  else
    v3 = off_1E4832750[v2];
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v4)
  {
    v5 = v4;
    dispatch_source_cancel(v5);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

  }
  v8 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_completeWithError:", v9, v3);

}

- (void)_run
{
  uint64_t v3;
  uint64_t v4;
  int state;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void (**promptToInstallHomeAppHandler)(id);
  HMHome *v11;
  HMHome *homeKitSelectedHome;
  HMHome *v13;
  id v14;
  _BOOL4 v15;
  id v16;
  int v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  OS_dispatch_source *timeoutTimer;
  NSObject *v28;
  OS_dispatch_source *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CB2F90];
  v4 = *MEMORY[0x1E0CB2D50];
  state = self->_state;
  while (2)
  {
    switch(state)
    {
      case 0:
        self->_state = 10;
        -[SFDeviceOperationHomeKitSetup _runInit](self, "_runInit");
        goto LABEL_121;
      case 10:
        if (self->_homeKitHomeManagerReady)
        {
          v6 = 11;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 11:
        v6 = 12;
        goto LABEL_120;
      case 12:
        if (-[HMHomeManager dataSyncState](self->_homeKitHomeManager, "dataSyncState") == 5)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          SFMetricsLog(CFSTR("com.apple.sharing.HomeResetRequired"), MEMORY[0x1E0C9AA70]);
          v19 = (void *)MEMORY[0x1E0CB35C8];
          v38 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v20;
          v22 = CFSTR("?");
          if (v20)
            v22 = (const __CFString *)v20;
          v39[0] = v22;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1, v34);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 301024;
          v25 = v19;
          v26 = v3;
LABEL_158:
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v24, v23);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v33);

          goto LABEL_121;
        }
        if (-[HMHomeManager dataSyncState](self->_homeKitHomeManager, "dataSyncState") == 2)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          SFMetricsLog(CFSTR("com.apple.sharing.HomeKitKeychainNotEnabled"), MEMORY[0x1E0C9AA70]);
          v30 = (void *)MEMORY[0x1E0CB35C8];
          v36 = v4;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
          v31 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v31;
          v32 = CFSTR("?");
          if (v31)
            v32 = (const __CFString *)v31;
          v37 = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, v34);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v30;
          v26 = v3;
          v24 = 301011;
          goto LABEL_158;
        }
        if (-[HMHomeManager isDataSyncInProgress](self->_homeKitHomeManager, "isDataSyncInProgress"))
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            v34 = -[HMHomeManager dataSyncState](self->_homeKitHomeManager, "dataSyncState", v34);
            goto LABEL_153;
          }
        }
        else if (-[HMHomeManager status](self->_homeKitHomeManager, "status"))
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            v34 = -[HMHomeManager status](self->_homeKitHomeManager, "status", v34);
            goto LABEL_153;
          }
        }
        else
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v6 = 13;
LABEL_120:
          self->_state = v6;
        }
LABEL_121:
        v18 = self->_state == state;
        state = self->_state;
        if (!v18)
          continue;
        return;
      case 13:
        if (self->_keyExchangeOnly)
          goto LABEL_38;
        v6 = 14;
        goto LABEL_120;
      case 14:
        if (!self->_promptToInstallHomeAppHandler)
          goto LABEL_17;
        objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", CFSTR("com.apple.Home"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appState");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isInstalled");

        if ((v9 & 1) != 0)
          goto LABEL_17;
        self->_state = 15;
        promptToInstallHomeAppHandler = (void (**)(id))self->_promptToInstallHomeAppHandler;
        goto LABEL_140;
      case 15:
        if (self->_homeAppInstallUserDidChoose)
        {
LABEL_17:
          v6 = 16;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 16:
        -[SFDeviceOperationHomeKitSetup _runHomeKitAutoSelectHome:](self, "_runHomeKitAutoSelectHome:", 0);
        v11 = (HMHome *)objc_claimAutoreleasedReturnValue();
        homeKitSelectedHome = self->_homeKitSelectedHome;
        self->_homeKitSelectedHome = v11;

        if (!self->_homeKitSelectedHome)
          goto LABEL_121;
        goto LABEL_25;
      case 17:
        if (self->_homeKitSelectedHome)
          goto LABEL_25;
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 18:
        if (self->_homeKitSelectedHome)
        {
LABEL_25:
          v6 = 19;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 19:
        -[SFDeviceOperationHomeKitSetup _updateHomeStats](self, "_updateHomeStats");
        self->_state = 20;
        -[SFDeviceOperationHomeKitSetup _runHomeKitSelectRoom](self, "_runHomeKitSelectRoom");
        goto LABEL_121;
      case 20:
        if (self->_reselectHome)
        {
          self->_reselectHome = 0;
          v13 = self->_homeKitSelectedHome;
          self->_homeKitSelectedHome = 0;

          self->_state = 17;
          v14 = -[SFDeviceOperationHomeKitSetup _runHomeKitAutoSelectHome:](self, "_runHomeKitAutoSelectHome:", 1);
          goto LABEL_121;
        }
        if (self->_homeKitSelectedRoom || self->_homeKitSelectedRoomName)
        {
          v6 = 21;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 21:
        if (!self->_pauseAfterUserInput || !self->_pauseHandler)
          goto LABEL_38;
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        timeoutTimer = self->_timeoutTimer;
        if (timeoutTimer)
        {
          v28 = timeoutTimer;
          dispatch_source_cancel(v28);
          v29 = self->_timeoutTimer;
          self->_timeoutTimer = 0;

        }
        self->_paused = 1;
        self->_state = 22;
        promptToInstallHomeAppHandler = (void (**)(id))self->_pauseHandler;
LABEL_140:
        promptToInstallHomeAppHandler[2](promptToInstallHomeAppHandler);
        goto LABEL_121;
      case 22:
        if (!self->_paused)
        {
LABEL_38:
          v6 = 23;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 23:
        self->_state = 24;
        -[SFDeviceOperationHomeKitSetup _runHomeKitDeviceSetup](self, "_runHomeKitDeviceSetup");
        goto LABEL_121;
      case 24:
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 25:
        if (self->_keyExchangeOnly)
          goto LABEL_119;
        -[SFDeviceOperationHomeKitSetup _runHomeKitAddAccessory](self, "_runHomeKitAddAccessory");
        goto LABEL_121;
      case 26:
        if (self->_homeKitAddedAccessory)
        {
          v6 = 27;
          goto LABEL_120;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
LABEL_153:
          LogPrintF();
        }
        goto LABEL_121;
      case 27:
        -[SFDeviceOperationHomeKitSetup _runHomeKitSetupRoom:](self, "_runHomeKitSetupRoom:", 0);
        goto LABEL_121;
      case 28:
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 29:
        -[SFDeviceOperationHomeKitSetup _runHomeKitAssignRoom](self, "_runHomeKitAssignRoom");
        goto LABEL_121;
      case 30:
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_153;
        }
        goto LABEL_121;
      case 31:
        if (self->_stereoRole)
        {
          v6 = 34;
        }
        else if (self->_tvAudioInput)
        {
LABEL_102:
          v6 = 37;
        }
        else if (self->_appDataSelf)
        {
          v6 = 32;
        }
        else
        {
LABEL_59:
          v6 = 40;
        }
        goto LABEL_120;
      case 32:
        self->_state = 33;
        -[SFDeviceOperationHomeKitSetup _runHomeKitAddAppData](self, "_runHomeKitAddAppData");
        goto LABEL_121;
      case 33:
        if (self->_homeKitAddedAppData)
          goto LABEL_59;
        goto LABEL_121;
      case 34:
        v35 = 0;
        v15 = -[SFDeviceOperationHomeKitSetup _runHomeKitConfigureStereoPairAndReturnError:](self, "_runHomeKitConfigureStereoPairAndReturnError:", &v35);
        v16 = v35;
        if (v16)
        {
          -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v16);
        }
        else
        {
          if (v15)
            v17 = 35;
          else
            v17 = 36;
          self->_state = v17;
        }

        goto LABEL_121;
      case 35:
        if (!self->_configuredStereoPair)
          goto LABEL_121;
        v6 = 36;
        goto LABEL_120;
      case 36:
        goto LABEL_102;
      case 37:
        if (!self->_tvAudioInput)
          goto LABEL_67;
        -[SFDeviceOperationHomeKitSetup _runHomeKitUpdateAppleTVAudioDestination](self, "_runHomeKitUpdateAppleTVAudioDestination");
        v6 = 38;
        goto LABEL_120;
      case 38:
        if (!self->_configuredTVAudio)
          goto LABEL_121;
LABEL_67:
        v6 = 39;
        goto LABEL_120;
      case 39:
        goto LABEL_59;
      case 40:
        self->_state = 41;
        -[SFDeviceOperationHomeKitSetup _runPersonalRequestsStart](self, "_runPersonalRequestsStart");
        goto LABEL_121;
      case 41:
        if (!self->_personalRequestsDone)
          goto LABEL_121;
        v6 = 42;
        goto LABEL_120;
      case 42:
        self->_state = 43;
        -[SFDeviceOperationHomeKitSetup _runUpdateUserListeningHistoryStart](self, "_runUpdateUserListeningHistoryStart");
        goto LABEL_121;
      case 43:
        if (!self->_userListeningHistoryDone)
          goto LABEL_121;
        if (self->_psgHomePods && self->_psgStereoPairs)
          v6 = 44;
        else
LABEL_119:
          v6 = 46;
        goto LABEL_120;
      case 44:
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_119;
      case 45:
        if (!self->_createUpdatePSGDone)
          goto LABEL_121;
        goto LABEL_119;
      case 46:
        -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", 0);
        goto LABEL_121;
      default:
        goto LABEL_121;
    }
  }
}

- (void)_runInit
{
  TROperationQueue *v3;
  TROperationQueue *trOperationQueue;
  void *v5;
  void *v6;
  HMHomeManager *v7;
  HMHomeManager *homeKitHomeManager;
  NSObject *v9;
  NSObject *hdsutilHKToken;
  HMHomeManager *v11;

  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_startTicks = mach_absolute_time();
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFDeviceOperationHomeKitSetup _startTimeout:](self, "_startTimeout:", self->_timeoutInSeconds);
  v3 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_0[0]());
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = v3;

  if (self->_isCLIMode)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[objc_class defaultConfiguration](getHMMutableHomeManagerConfigurationClass(), "defaultConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setAdaptive:", 1);
    v7 = (HMHomeManager *)objc_msgSend(objc_alloc((Class)getHMHomeManagerClass_0[0]()), "initWithConfiguration:", v6);
    homeKitHomeManager = self->_homeKitHomeManager;
    self->_homeKitHomeManager = v7;

    -[HMHomeManager _beginActiveAssertionWithReason:](self->_homeKitHomeManager, "_beginActiveAssertionWithReason:", CFSTR("tvsetuputil Started"));
    v9 = objc_claimAutoreleasedReturnValue();
    hdsutilHKToken = self->_hdsutilHKToken;
    self->_hdsutilHKToken = v9;

  }
  else
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = (HMHomeManager *)objc_alloc_init((Class)getHMHomeManagerClass_0[0]());
    v5 = self->_homeKitHomeManager;
    self->_homeKitHomeManager = v11;
  }

  -[HMHomeManager setDelegate:](self->_homeKitHomeManager, "setDelegate:", self);
}

- (void)_runHomeKitDeviceSetup
{
  HMAccessoryBrowser *v3;
  HMAccessoryBrowser *homeKitBrowser;
  TRSession *v5;
  NSUUID *sessionID;
  id v7;
  HMDeviceSetupOperation *v8;
  HMDeviceSetupOperation *homeKitDeviceSetupOperation;
  void *v10;
  HMDeviceSetupOperation *v11;
  HMDeviceSetupOperation *v12;
  uint64_t v13;
  NSUUID *v14;
  _QWORD v15[5];

  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_keyExchangeOnly)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = (HMAccessoryBrowser *)objc_alloc_init((Class)getHMAccessoryBrowserClass[0]());
    homeKitBrowser = self->_homeKitBrowser;
    self->_homeKitBrowser = v3;

    -[HMAccessoryBrowser setDelegate:](self->_homeKitBrowser, "setDelegate:", self);
    -[HMAccessoryBrowser startSearchingForNewAccessories](self->_homeKitBrowser, "startSearchingForNewAccessories");
  }
  v5 = self->_trSession;
  if (!v5)
  {
    NSErrorWithOSStatusF();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v10);

    goto LABEL_30;
  }
  sessionID = self->_sessionID;
  v7 = objc_alloc((Class)getHMDeviceSetupOperationClass[0]());
  if (sessionID)
  {
    v8 = (HMDeviceSetupOperation *)objc_msgSend(v7, "initWithSession:sessionIdentifier:", v5, self->_sessionID);
    homeKitDeviceSetupOperation = self->_homeKitDeviceSetupOperation;
    self->_homeKitDeviceSetupOperation = v8;

    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      v14 = self->_sessionID;
LABEL_19:
      LogPrintF();
    }
  }
  else
  {
    v11 = (HMDeviceSetupOperation *)objc_msgSend(v7, "initWithSession:", v5);
    v12 = self->_homeKitDeviceSetupOperation;
    self->_homeKitDeviceSetupOperation = v11;

    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_19;
    }
  }
  if (self->_userInteractive)
    v13 = 33;
  else
    v13 = 9;
  -[HMDeviceSetupOperation setQualityOfService:](self->_homeKitDeviceSetupOperation, "setQualityOfService:", v13, v14);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __55__SFDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke;
  v15[3] = &unk_1E482DF78;
  v15[4] = self;
  -[HMDeviceSetupOperation setCompletionBlock:](self->_homeKitDeviceSetupOperation, "setCompletionBlock:", v15);
  -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", self->_homeKitDeviceSetupOperation);
  self->_startTicksForHomeKitSteps = mach_absolute_time();
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_30:

}

void __55__SFDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 192);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SFDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke_2;
  block[3] = &unk_1E482DF78;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __55__SFDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;

  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = v2;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 8))
  {
    objc_msgSend(*(id *)(v3 + 80), "accessory");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v4;

    v7 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v7 + 88))
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
          || (v8 = _LogCategory_Initialize(), v7 = *(_QWORD *)(a1 + 32), v8))
        {
          LogPrintF();
          v7 = *(_QWORD *)(a1 + 32);
        }
      }
      *(_DWORD *)(v7 + 32) = 25;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    else
    {
      NSErrorWithOSStatusF();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v7, "_completeWithError:", v9);

    }
  }
}

- (id)_runHomeKitAutoSelectHome:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  __objc2_meth_list **p_class_meths;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v17;
  int v18;
  OS_dispatch_source *timeoutTimer;
  NSObject *v20;
  OS_dispatch_source *v21;
  double v22;
  double v23;
  int v24;
  int v25;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[HMHomeManager homes](self->_homeKitHomeManager, "homes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!a3)
  {
    if (!objc_msgSend(v5, "count"))
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFDeviceOperationHomeKitSetup _runHomeKitAddHome](self, "_runHomeKitAddHome");
LABEL_52:
      v7 = 0;
      goto LABEL_53;
    }
    if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && -[SFDeviceOperationHomeKitSetup _isOwnerOfHome:](self, "_isOwnerOfHome:", v7))
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_53;
      }

    }
  }
  p_class_meths = &OBJC_PROTOCOL___SFAccessibilityInterface.class_meths;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    v27 = objc_msgSend(v6, "count");
    LogPrintF();
  }
  if (self->_promptForHomeHandler)
  {
    -[HMHomeManager currentHome](self->_homeKitHomeManager, "currentHome");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
      {
        v13 = 0;
        v14 = *(_QWORD *)v30;
LABEL_21:
        v15 = 0;
        v28 = v13 + v12;
        while (1)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v15), "uniqueIdentifier", v27);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqual:", v10);

          if ((v17 & 1) != 0)
            break;
          if (v12 == ++v15)
          {
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            v13 = v28;
            if (v12)
              goto LABEL_21;
            break;
          }
        }
        p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SFAccessibilityInterface + 32);
      }

    }
    v18 = *((_DWORD *)p_class_meths + 292);
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v20 = timeoutTimer;
      dispatch_source_cancel(v20);
      v21 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    mach_absolute_time();
    UpTicksToSecondsF();
    v23 = v22;
    v24 = *((_DWORD *)p_class_meths + 292);
    if (v24 <= 30 && (v24 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_metricNonUserSeconds = v23 + self->_metricNonUserSeconds;
    self->_startTicks = mach_absolute_time();
    v25 = *((_DWORD *)p_class_meths + 292);
    if (v25 <= 30 && (v25 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_state = 17;
    (*((void (**)(void))self->_promptForHomeHandler + 2))();

    goto LABEL_52;
  }
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v6, "firstObject", v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_53:

  return v7;
}

- (void)_runHomeKitAddHome
{
  HMHomeManager *homeKitHomeManager;
  void *v4;
  _QWORD v5[5];

  self->_state = 18;
  homeKitHomeManager = self->_homeKitHomeManager;
  SFLocalizedStringForKey(CFSTR("MY_HOME"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SFDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke;
  v5[3] = &unk_1E48325E0;
  v5[4] = self;
  -[HMHomeManager addHomeWithName:completionHandler:](homeKitHomeManager, "addHomeWithName:completionHandler:", v4, v5);

}

void __51__SFDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 192);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SFDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke_2;
  block[3] = &unk_1E482EBA0;
  block[4] = v7;
  v12 = v6;
  v13 = v5;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void __51__SFDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke_2(uint64_t a1)
{
  _BYTE *v1;
  id v3;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1[8])
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "_completeWithError:");
    }
    else if (*(_QWORD *)(a1 + 48))
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *(id *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    else
    {
      NSErrorWithOSStatusF();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "_completeWithError:", v3);

    }
  }
}

- (void)_runHomeKitSelectRoom
{
  HMHome *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  OS_dispatch_source *timeoutTimer;
  NSObject *v19;
  OS_dispatch_source *v20;
  double v21;
  double v22;
  uint64_t v23;
  SFDeviceOperationHomeKitSetup *v24;
  int v25;
  SFDeviceOperationHomeKitSetup *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  HMHome *homeKitSelectedHome;
  HMHomeManager *homeKitHomeManager;
  dispatch_time_t v34;
  HMHome *v35;
  void *v36;
  uint64_t v37;
  void (**promptForRoomHandlerDetailed)(id, void *, id, void *, void *);
  void *v39;
  HMRoom *v40;
  HMRoom *homeKitSelectedRoom;
  void *v42;
  int v43;
  int v44;
  double v45;
  id v46;
  id v47;
  void *v48;
  uint64_t v49;
  void *v50;
  HMHome *v51;
  void *v52;
  id v53;
  id obj;
  uint64_t v55;
  void *v56;
  SFDeviceOperationHomeKitSetup *v57;
  id v58;
  _QWORD v59[5];
  id v60;
  NSObject *v61;
  uint64_t *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[5];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = self->_homeKitSelectedHome;
  v51 = v3;
  v57 = self;
  if (*(_OWORD *)&self->_promptForRoomHandler == 0)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HMHome roomForEntireHome](v3, "roomForEntireHome");
    v40 = (HMRoom *)objc_claimAutoreleasedReturnValue();
    homeKitSelectedRoom = self->_homeKitSelectedRoom;
    self->_homeKitSelectedRoom = v40;

    if (!self->_homeKitSelectedRoom)
    {
      NSErrorWithOSStatusF();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceOperationHomeKitSetup _completeWithError:](v57, "_completeWithError:", v42);

    }
  }
  else
  {
    v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    -[HMHome rooms](v3, "rooms");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v79 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * i), "name");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8 && (objc_msgSend(v58, "containsObject:", v8) & 1) == 0)
            objc_msgSend(v58, "addObject:", v8);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
      }
      while (v5);
    }

    objc_msgSend(v58, "sortUsingSelector:");
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v9 = objc_msgSend(&unk_1E48917E0, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    if (v9)
    {
      v52 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v75;
      do
      {
        v12 = 0;
        v55 = v10;
        v13 = 10 - v10;
        do
        {
          if (*(_QWORD *)v75 != v11)
            objc_enumerationMutation(&unk_1E48917E0);
          SFLocalizedStringForKey(*(const __CFString **)(*((_QWORD *)&v74 + 1) + 8 * v12));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[SFDeviceOperationHomeKitSetup _normalizedString:](v57, "_normalizedString:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v73[0] = MEMORY[0x1E0C809B0];
            v73[1] = 3221225472;
            v73[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke;
            v73[3] = &unk_1E4832608;
            v73[4] = v15;
            if (objc_msgSend(v58, "indexOfObjectPassingTest:", v73) == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v53, "addObject:", v14);
              if (v13 == v12)
              {
                v16 = v14;

                v52 = v16;
              }
            }

          }
          ++v12;
        }
        while (v9 != v12);
        v17 = objc_msgSend(&unk_1E48917E0, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
        v10 = v55 + v9;
        v9 = v17;
      }
      while (v17);
    }
    else
    {
      v52 = 0;
    }
    -[SFDeviceOperationHomeKitSetup _removeSimilarRoomNames:home:](v57, "_removeSimilarRoomNames:home:", v53, v51);
    objc_msgSend(v53, "sortUsingSelector:", sel_localizedStandardCompare_);
    objc_msgSend(v58, "arrayByAddingObjectsFromArray:", v53);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    timeoutTimer = v57->_timeoutTimer;
    if (timeoutTimer)
    {
      v19 = timeoutTimer;
      dispatch_source_cancel(v19);
      v20 = v57->_timeoutTimer;
      v57->_timeoutTimer = 0;

    }
    mach_absolute_time();
    UpTicksToSecondsF();
    v22 = v21;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      v45 = v22;
      LogPrintF();
    }
    v57->_metricNonUserSeconds = v22 + v57->_metricNonUserSeconds;
    v23 = mach_absolute_time();
    v24 = v57;
    v57->_startTicks = v23;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v25 = _LogCategory_Initialize(), v24 = v57, v25))
      {
        LogPrintF();
        v24 = v57;
      }
    }
    if (v24->_promptForRoomHandler
      && v24->_promptForRoomHandlerDetailed
      && gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v49 = objc_msgSend(v58, "count", *(_QWORD *)&v45);
    v26 = v57;
    if (v57->_promptForRoomHandlerDetailed)
    {
      v27 = dispatch_group_create();
      v56 = (void *)objc_opt_new();
      v67 = 0;
      v68 = &v67;
      v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__10;
      v71 = __Block_byref_object_dispose__10;
      v72 = 0;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      obj = v53;
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v64;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v64 != v29)
              objc_enumerationMutation(obj);
            v31 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * j);
            dispatch_group_enter(v27);
            homeKitHomeManager = v57->_homeKitHomeManager;
            homeKitSelectedHome = v57->_homeKitSelectedHome;
            v59[0] = MEMORY[0x1E0C809B0];
            v59[1] = 3221225472;
            v59[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke_201;
            v59[3] = &unk_1E4832630;
            v59[4] = v31;
            v62 = &v67;
            v60 = v56;
            v61 = v27;
            -[HMHomeManager checkName:inHome:withValidationOptions:completionHandler:](homeKitHomeManager, "checkName:inHome:withValidationOptions:completionHandler:", v31, homeKitSelectedHome, 4, v59);

          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v82, 16);
        }
        while (v28);
      }

      v34 = dispatch_time(0, 30000000000);
      dispatch_group_wait(v27, v34);
      if (objc_msgSend(v58, "count") || objc_msgSend(v56, "count") || !v68[5])
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
        v35 = v51;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v49)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            v46 = v52;
            LogPrintF();
          }
          if (v52)
            objc_msgSend(v56, "indexOfObject:");
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v46);
          v37 = objc_claimAutoreleasedReturnValue();

          v36 = (void *)v37;
          v35 = v51;
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          v47 = obj;
          v48 = v36;
          v46 = v58;
          LogPrintF();
        }
        promptForRoomHandlerDetailed = (void (**)(id, void *, id, void *, void *))v57->_promptForRoomHandlerDetailed;
        -[HMHome name](v35, "name", v46, v47, v48);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        promptForRoomHandlerDetailed[2](promptForRoomHandlerDetailed, v39, v58, v56, v36);

      }
      else
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        -[SFDeviceOperationHomeKitSetup _completeWithError:](v57, "_completeWithError:", v68[5]);
      }
      _Block_object_dispose(&v67, 8);

    }
    else
    {
      if (!v49)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v43 = _LogCategory_Initialize(), v26 = v57, v43))
          {
            LogPrintF();
            v26 = v57;
          }
        }
        if (v52)
        {
          objc_msgSend(v50, "indexOfObject:");
          v26 = v57;
        }
      }
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v44 = _LogCategory_Initialize(), v26 = v57, v44))
        {
          LogPrintF();
          v26 = v57;
        }
      }
      (*((void (**)(id, void *))v26->_promptForRoomHandler + 2))(v26->_promptForRoomHandler, v50);
    }

  }
}

BOOL __54__SFDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  v5 = objc_msgSend(a2, "caseInsensitiveCompare:", *(_QWORD *)(a1 + 32));
  if (!v5)
    *a4 = 1;
  return v5 == 0;
}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke_201(uint64_t a1, int a2, void *a3, void *a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v10 = a3;
  v7 = a4;
  if (v10 | v7)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v7)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
  }
  else if (a2)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      v9 = *(_QWORD *)(a1 + 32);
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32), v9);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", *(_QWORD *)(a1 + 32), v8);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)_runHomeKitAddAccessory
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  HMAccessory *v12;
  void *v13;
  HMAccessory *v14;
  HMAccessory *homeKitAccessory;
  HMHome *homeKitSelectedHome;
  HMAccessory *v17;
  uint64_t v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  self->_state = 26;
  -[HMAccessory uniqueIdentifier](self->_homeKitAccessory, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMHome accessories](self->_homeKitSelectedHome, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
      objc_msgSend(v9, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", v3);

      if ((v11 & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_14;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitAccessory = self->_homeKitAccessory;
    self->_homeKitAccessory = v12;
    v14 = v12;

    self->_homeKitAddedAccessory = 1;
  }
  else
  {
LABEL_9:

LABEL_14:
    self->_startTicksForHomeKitSteps = mach_absolute_time();
    -[SFDeviceOperationHomeKitSetup pairedPeer](self, "pairedPeer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (HMAccessory *)objc_claimAutoreleasedReturnValue();

    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HMAccessory setPeerIdentifier:](self->_homeKitAccessory, "setPeerIdentifier:", v14, v14);
      }
      else
      {
        -[HMAccessory setPeerIdentifier:](self->_homeKitAccessory, "setPeerIdentifier:", v14, v18);
      }
    }
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedHome = self->_homeKitSelectedHome;
    v17 = self->_homeKitAccessory;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __56__SFDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke;
    v19[3] = &unk_1E482DFF0;
    v19[4] = self;
    -[HMHome addAccessory:completionHandler:](homeKitSelectedHome, "addAccessory:completionHandler:", v17, v19);
  }

}

void __56__SFDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SFDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke_2;
  v7[3] = &unk_1E482D3A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __56__SFDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  mach_absolute_time();
  result = UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) = v3;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 264);
      result = LogPrintF();
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "stopSearchingForNewAccessories", v6);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = 0;

    if (*(_QWORD *)(a1 + 40))
    {
      return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:");
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 156) = 1;
      objc_msgSend(*(id *)(a1 + 32), "_updateAccount");
      return objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
  return result;
}

- (void)_runHomeKitSetupRoom:(BOOL)a3
{
  HMRoom *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSString *v14;
  HMRoom *homeKitSelectedRoom;
  void *v16;
  HMHome *homeKitSelectedHome;
  NSString *homeKitSelectedRoomName;
  _QWORD v19[5];
  BOOL v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = self->_homeKitSelectedRoom;
  if (v5)
  {
LABEL_2:
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedRoom = self->_homeKitSelectedRoom;
    self->_homeKitSelectedRoom = v5;
    v14 = v5;

    self->_state = 29;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[HMHome rooms](self->_homeKitSelectedHome, "rooms");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", self->_homeKitSelectedRoomName);

        if ((v13 & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v8)
            goto LABEL_7;
          goto LABEL_13;
        }
      }
      v5 = v11;

      if (v5)
        goto LABEL_2;
    }
    else
    {
LABEL_13:

    }
    v14 = self->_homeKitSelectedRoomName;
    if (v14)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
        LogPrintF();
      }
      self->_state = 28;
      homeKitSelectedHome = self->_homeKitSelectedHome;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke;
      v19[3] = &unk_1E4832680;
      v19[4] = self;
      v20 = a3;
      -[HMHome addRoomWithName:completionHandler:](homeKitSelectedHome, "addRoomWithName:completionHandler:", v14, v19, homeKitSelectedRoomName);
    }
    else
    {
      NSErrorWithOSStatusF();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v16);

    }
  }

}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  char v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 192);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_2;
  v11[3] = &unk_1E4832658;
  v11[4] = v7;
  v12 = v6;
  v13 = v5;
  v14 = *(_BYTE *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    v3 = *(void **)(a1 + 40);
    if (v3 || (v5 = *(void **)(a1 + 48)) == 0)
    {
      if (objc_msgSend(v3, "code") == 1 && !*(_BYTE *)(a1 + 56))
      {
        v6 = dispatch_time(0, 2000000000);
        v7 = *(void **)(a1 + 40);
        v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 192);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_3;
        block[3] = &unk_1E482D3A0;
        v9 = v7;
        v10 = *(_QWORD *)(a1 + 32);
        v13 = v9;
        v14 = v10;
        dispatch_after(v6, v8, block);

      }
      else
      {
        v4 = *(void **)(a1 + 32);
        if (*(_QWORD *)(a1 + 40))
        {
          objc_msgSend(*(id *)(a1 + 32), "_completeWithError:");
        }
        else
        {
          NSErrorWithOSStatusF();
          v11 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "_completeWithError:", v11);

        }
      }
    }
    else
    {
      objc_storeStrong((id *)(v1 + 104), v5);
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 29;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
}

uint64_t __54__SFDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_3(uint64_t a1)
{
  uint64_t v3;

  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    v3 = *(_QWORD *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_runHomeKitSetupRoom:", 1, v3);
  return objc_msgSend(*(id *)(a1 + 40), "_run");
}

- (void)_runHomeKitAssignRoom
{
  HMHome *homeKitSelectedHome;
  HMAccessory *homeKitAccessory;
  HMRoom *homeKitSelectedRoom;
  void *v6;
  _QWORD v7[5];

  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    -[HMRoom name](self->_homeKitSelectedRoom, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  self->_state = 30;
  self->_startTicksForHomeKitSteps = mach_absolute_time();
  homeKitSelectedHome = self->_homeKitSelectedHome;
  homeKitAccessory = self->_homeKitAccessory;
  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke;
  v7[3] = &unk_1E482DFF0;
  v7[4] = self;
  -[HMHome assignAccessory:toRoom:completionHandler:](homeKitSelectedHome, "assignAccessory:toRoom:completionHandler:", homeKitAccessory, homeKitSelectedRoom, v7);
}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke_2;
  v7[3] = &unk_1E482D3A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

_BYTE *__54__SFDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BYTE *result;

  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 272) = v2;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(_BYTE **)(a1 + 32);
  if (result[8])
  {
    if (*(_QWORD *)(a1 + 40))
    {
      return (_BYTE *)objc_msgSend(result, "_completeWithError:");
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 31;
      return (_BYTE *)objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
  return result;
}

- (void)_runHomeKitAddAppData
{
  HMAccessory *homeKitAccessory;
  void *v4;
  uint64_t v5;
  NSDictionary *appDataSelf;
  id v7;
  HMAccessory *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  homeKitAccessory = self->_homeKitAccessory;
  if (homeKitAccessory)
  {
    -[HMAccessory applicationData](homeKitAccessory, "applicationData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    appDataSelf = self->_appDataSelf;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke;
    v11[3] = &unk_1E48326A8;
    v12 = v4;
    v7 = v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](appDataSelf, "enumerateKeysAndObjectsUsingBlock:", v11);
    v8 = self->_homeKitAccessory;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_2;
    v10[3] = &unk_1E482DFF0;
    v10[4] = self;
    -[HMAccessory updateApplicationData:completionHandler:](v8, "updateApplicationData:completionHandler:", v7, v10);

  }
  else
  {
    NSErrorWithOSStatusF();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v9);

  }
}

uint64_t __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_3;
  v7[3] = &unk_1E482D3A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __54__SFDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 40);
    if (v2)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
          || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(v1 + 40), v3))
        {
          LogPrintF();
          v2 = *(_QWORD *)(v1 + 40);
        }
      }
      return objc_msgSend(*(id *)(v1 + 32), "_completeWithError:", v2);
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(v1 + 32) + 112) = 1;
      return objc_msgSend(*(id *)(v1 + 32), "_run");
    }
  }
  return result;
}

- (BOOL)_runHomeKitConfigureStereoPairAndReturnError:(id *)a3
{
  HMAccessory *v5;
  uint64_t v6;
  HMAccessory *homeKitAccessory;
  void *v8;
  HMHome *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  int stereoRole;
  Class v15;
  BOOL v16;
  uint64_t v18;
  int v19;
  Class v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v5 = self->_stereoCounterpart;
  if (!v5 || (self->_stereoRole & 0xFFFFFFFE) != 2)
    goto LABEL_19;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_homeKitAccessory)
  {
    if (a3)
      goto LABEL_18;
    goto LABEL_19;
  }
  v6 = getHMMediaSystemBuilderClass[0]();
  homeKitAccessory = self->_homeKitAccessory;
  v36[0] = v5;
  v36[1] = homeKitAccessory;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend((id)v6, "isStereoPairingSupportedForAccessories:", v8);

  if ((v6 & 1) == 0)
  {
    if (a3)
    {
LABEL_18:
      NSErrorWithOSStatusF();
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_19:
    v16 = 0;
    goto LABEL_20;
  }
  v9 = self->_homeKitSelectedHome;
  if (v9)
  {
    v10 = self->_homeKitSelectedRoomName;
    if (v10)
    {
      v11 = (void *)objc_msgSend(objc_alloc((Class)getHMMediaSystemBuilderClass[0]()), "initWithHome:", v9);
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "setName:", v10);
        -[HMAccessory mediaProfile](self->_homeKitAccessory, "mediaProfile");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          stereoRole = self->_stereoRole;
          v15 = (Class)getHMMediaSystemRoleClass[0]();
          if (stereoRole == 2)
            -[objc_class leftRole](v15, "leftRole");
          else
            -[objc_class rightRole](v15, "rightRole");
          v18 = objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(objc_alloc((Class)getHMMediaSystemComponentClass[0]()), "initWithMediaProfile:role:", v13, v18);
          v32 = (void *)v18;
          if (v31)
          {
            -[HMAccessory mediaProfile](v5, "mediaProfile");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (v30)
            {
              v19 = self->_stereoRole;
              v20 = (Class)getHMMediaSystemRoleClass[0]();
              if (v19 == 2)
                -[objc_class rightRole](v20, "rightRole");
              else
                -[objc_class leftRole](v20, "leftRole");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = (void *)objc_msgSend(objc_alloc((Class)getHMMediaSystemComponentClass[0]()), "initWithMediaProfile:role:", v30, v29);
              v16 = v21 != 0;
              if (v21)
              {
                if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
                {
                  if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
                    || (v25 = v21, v26 = _LogCategory_Initialize(), v21 = v25, v26))
                  {
                    v22 = v21;
                    LogPrintF();
                    v21 = v22;
                  }
                }
                v23 = (void *)v31;
                v35[0] = v31;
                v35[1] = v21;
                v27 = v21;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setComponents:", v28);

                v33[0] = MEMORY[0x1E0C809B0];
                v33[1] = 3221225472;
                v33[2] = __78__SFDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke;
                v33[3] = &unk_1E48326D0;
                v33[4] = self;
                v34 = v12;
                objc_msgSend(v34, "commitWithCompletionHandler:", v33);

                v21 = v27;
              }
              else
              {
                v23 = (void *)v31;
                if (a3)
                {
                  NSErrorWithOSStatusF();
                  v24 = (id)objc_claimAutoreleasedReturnValue();
                  v21 = 0;
                  *a3 = v24;
                }
              }

            }
            else
            {
              if (a3)
              {
                NSErrorWithOSStatusF();
                v16 = 0;
                *a3 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v16 = 0;
              }
              v23 = (void *)v31;
            }

          }
          else
          {
            if (a3)
            {
              NSErrorWithOSStatusF();
              v16 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v16 = 0;
            }
            v23 = 0;
          }

        }
        else if (a3)
        {
          NSErrorWithOSStatusF();
          v16 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }

      }
      else if (a3)
      {
        NSErrorWithOSStatusF();
        v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }

    }
    else if (a3)
    {
      NSErrorWithOSStatusF();
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else if (a3)
  {
    NSErrorWithOSStatusF();
    v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

LABEL_20:
  return v16;
}

void __78__SFDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v7 + 8))
  {
    v8 = *(NSObject **)(v7 + 192);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __78__SFDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke_2;
    v11[3] = &unk_1E482E7D8;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v12 = v9;
    v13 = v10;
    v14 = v6;
    v15 = *(id *)(a1 + 40);
    dispatch_async(v8, v11);

  }
}

void __78__SFDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
        || (v5 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 32), v5))
      {
        LogPrintF();
        v2 = *(_QWORD *)(a1 + 32);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_completeWithError:", v2);
    return;
  }
  v3 = *(void **)(a1 + 48);
  if (v3)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_15;
        v3 = *(void **)(a1 + 48);
      }
      objc_msgSend(v3, "uniqueIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
LABEL_15:
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 113) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 120), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_run");
    return;
  }
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = *(void **)(a1 + 40);
  NSErrorWithOSStatusF();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_completeWithError:", v8);

}

- (void)_runHomeKitUpdateAppleTVAudioDestination
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  self->_odeonStartTicks = mach_absolute_time();
  -[HMAccessory audioDestinationController](self->_tvAudioInput, "audioDestinationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 120;
    if (!self->_configuredStereoPair)
      v4 = 88;
    v5 = *(id *)((char *)&self->super.isa + v4);
    if (v5)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __73__SFDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke;
      v7[3] = &unk_1E482E2F8;
      v7[4] = self;
      v8 = v3;
      objc_msgSend(v8, "updateDestination:options:completionHandler:", v5, 2, v7);

    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 115
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      NSErrorWithOSStatusF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v6);

    }
  }
  else
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 115
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v5);
  }

}

void __73__SFDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392) = v4;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v5 + 8))
  {
    v6 = *(NSObject **)(v5 + 192);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__SFDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke_2;
    block[3] = &unk_1E482EBA0;
    block[4] = v5;
    v8 = v3;
    v9 = *(id *)(a1 + 40);
    dispatch_async(v6, block);

  }
}

uint64_t __73__SFDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v6;

  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392) = v2;
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
        || (v4 = _LogCategory_Initialize(), v3 = *(_QWORD *)(a1 + 40), v4))
      {
        LogPrintF();
        v3 = *(_QWORD *)(a1 + 40);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v3);
  }
  else
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "_run");
  }
}

- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v13, "keyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqual:", v6);

        if ((v15 & 1) != 0)
        {
          v20 = v13;
          goto LABEL_19;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v10)
        continue;
      break;
    }
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "groups", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
LABEL_11:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v18)
        objc_enumerationMutation(v8);
      -[SFDeviceOperationHomeKitSetup _homeKitFindSettingsWithKeyPath:group:](self, "_homeKitFindSettingsWithKeyPath:group:", v6, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (v20)
        break;
      if (v17 == ++v19)
      {
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v17)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_19:
    v21 = v20;
  }
  else
  {
LABEL_17:
    v21 = 0;
  }

  return v21;
}

- (void)_runUpdateUserListeningHistoryStart
{
  HMAccessory *v3;
  HMHome *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];

  v3 = self->_homeKitAccessory;
  if (v3)
  {
    v4 = self->_homeKitSelectedHome;
    -[HMHome owner](self->_homeKitSelectedHome, "owner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[HMHome owner](v4, "owner");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "userSettingsForHome:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "settings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "rootGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceOperationHomeKitSetup _homeKitFindSettingsWithKeyPath:group:](self, "_homeKitFindSettingsWithKeyPath:group:", CFSTR("root.siri.identifyVoice"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10
        && (objc_msgSend(v10, "value"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "BOOLValue"),
            v11,
            (v12 & 1) != 0))
      {
        objc_msgSend(v5, "userListeningHistoryUpdateControlForHome:", v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        if (v14)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          objc_msgSend(v14, "addAccessory:", v3);
          v16 = mach_absolute_time();
          v17 = MEMORY[0x1E0C809B0];
          self->_startTicksForHomeKitSteps = v16;
          v18[0] = v17;
          v18[1] = 3221225472;
          v18[2] = __68__SFDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke;
          v18[3] = &unk_1E482DFF0;
          v18[4] = self;
          objc_msgSend(v5, "updateUserListeningHistoryUpdateControl:forHome:completionHandler:", v14, v4, v18);
        }
        else
        {
          NSErrorWithOSStatusF();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v15);

        }
      }
      else
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 50
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_userListeningHistoryDone = 1;
      }

    }
    else
    {
      NSErrorWithOSStatusF();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v8);
    }

  }
  else
  {
    NSErrorWithOSStatusF();
    v4 = (HMHome *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v4);
  }

}

void __68__SFDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SFDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke_2;
  v7[3] = &unk_1E482D3A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __68__SFDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int v5;

  mach_absolute_time();
  result = UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = v3;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
          || (v5 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 40), v5))
        {
          LogPrintF();
          v4 = *(_QWORD *)(a1 + 40);
        }
      }
      return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v4);
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 129) = 1;
      return objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
  return result;
}

- (void)_runPersonalRequestsStart
{
  HMHome *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  HMHome *v25;
  id obj;
  HMAccessory *v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (self->_personalRequestsEnabled)
  {
    v27 = self->_homeKitAccessory;
    if (v27)
    {
      v3 = self->_homeKitSelectedHome;
      -[HMHome owner](self->_homeKitSelectedHome, "owner");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "assistantAccessControlForHome:", v3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v6, "mutableCopy");
        if (v7)
        {
          if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          objc_msgSend(v7, "setEnabled:", 1);
          if (_os_feature_enabled_impl())
          {
            v22 = v7;
            v23 = v6;
            v24 = v5;
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v25 = v3;
            -[HMHome accessories](v3, "accessories");
            obj = (id)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v12; ++i)
                {
                  if (*(_QWORD *)v30 != v13)
                    objc_enumerationMutation(obj);
                  v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                  objc_msgSend(v15, "category");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "categoryType");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  getHMAccessoryCategoryTypeHomePod_0[0]();
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
                  {
                    objc_msgSend(v15, "uniqueIdentifier");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    -[HMAccessory uniqueIdentifier](v27, "uniqueIdentifier");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    v21 = objc_msgSend(v19, "isEqual:", v20);

                    if (!v21)
                    {

                      v5 = v24;
                      v3 = v25;
                      v7 = v22;
                      v6 = v23;
                      goto LABEL_34;
                    }
                  }
                  else
                  {

                  }
                }
                v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              }
              while (v12);
            }

            if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
              && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            v7 = v22;
            objc_msgSend(v22, "setAllowUnauthenticatedRequests:", 1);
            v5 = v24;
            v3 = v25;
            v6 = v23;
          }
LABEL_34:
          self->_startTicksForHomeKitSteps = mach_absolute_time();
          objc_msgSend(v7, "addAccessory:", v27);
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __58__SFDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke;
          v28[3] = &unk_1E482DFF0;
          v28[4] = self;
          objc_msgSend(v5, "updateAssistantAccessControl:forHome:completionHandler:", v7, v3, v28);
        }
        else
        {
          NSErrorWithOSStatusF();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v10);

        }
      }
      else
      {
        NSErrorWithOSStatusF();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v9);

      }
    }
    else
    {
      NSErrorWithOSStatusF();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceOperationHomeKitSetup _completeWithError:](self, "_completeWithError:", v8);

    }
  }
  else
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_personalRequestsDone = 1;
  }
}

void __58__SFDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 192);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__SFDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke_2;
  v7[3] = &unk_1E482D3A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __58__SFDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  int v5;

  mach_absolute_time();
  result = UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = v3;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_SFDeviceOperationHomeKitSetup != -1
          || (v5 = _LogCategory_Initialize(), v4 = *(_QWORD *)(a1 + 40), v5))
        {
          LogPrintF();
          v4 = *(_QWORD *)(a1 + 40);
        }
      }
      return objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v4);
    }
    else
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 1;
      return objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }
  return result;
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
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
  v7[2] = __67__SFDeviceOperationHomeKitSetup_homeManagerDidUpdateDataSyncState___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __67__SFDeviceOperationHomeKitSetup_homeManagerDidUpdateDataSyncState___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(v1 + 40), "dataSyncState");
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SFDeviceOperationHomeKitSetup_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __59__SFDeviceOperationHomeKitSetup_homeManagerDidUpdateHomes___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 157) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];

  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SFDeviceOperationHomeKitSetup_homeManager_didUpdateStatus___block_invoke;
  v5[3] = &unk_1E482E018;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __61__SFDeviceOperationHomeKitSetup_homeManager_didUpdateStatus___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 8))
  {
    v1 = result;
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (id)findStereoCounterpartsWithSupportedVersions:(unint64_t)a3
{
  HMRoom *v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  HMRoom *v9;
  uint64_t v10;
  HMRoom *i;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  char v42;
  uint64_t v43;
  void *v45;
  void *v46;
  uint64_t v47;
  HMRoom *v48;
  id v49;
  unint64_t v50;
  void *v51;
  SFDeviceOperationHomeKitSetup *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = self->_homeKitSelectedRoom;
  v50 = a3;
  if (v5)
    goto LABEL_2;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[HMHome rooms](self->_homeKitSelectedHome, "rooms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (HMRoom *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  if (!v9)
    goto LABEL_83;
  v10 = *(_QWORD *)v58;
  do
  {
    for (i = 0; i != v9; i = (HMRoom *)((char *)i + 1))
    {
      if (*(_QWORD *)v58 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", self->_homeKitSelectedRoomName);

      if ((v14 & 1) != 0)
      {
        v9 = v12;

        v5 = v9;
        a3 = v50;
        if (!v9)
          return v9;
LABEL_2:
        v6 = self->_iTunesAccountID;
        if (v6)
        {
          v7 = v6;
          SFNormalizeEmailAddress(v6, 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v51 = 0;
        }
        v52 = self;
        v48 = v5;
        v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        -[HMRoom accessories](v5, "accessories");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
        if (!v16)
        {
LABEL_82:

          v9 = (HMRoom *)objc_msgSend(v49, "copy");
          v8 = v48;
          goto LABEL_83;
        }
        v17 = v16;
        v18 = *(_QWORD *)v54;
        while (2)
        {
          v19 = 0;
LABEL_17:
          if (*(_QWORD *)v54 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v19);
          objc_msgSend(v20, "category", v45, v47);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "categoryType");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          getHMAccessoryCategoryTypeHomePod_0[0]();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqual:", v23);

          if (!v24)
            goto LABEL_22;
          -[SFDeviceOperationHomeKitSetup _mediaSystemForAccessory:](v52, "_mediaSystemForAccessory:", v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            goto LABEL_21;
          if ((objc_msgSend(v20, "supportedStereoPairVersions") & a3) != 0)
          {
            if ((objc_msgSend((Class)getHMMediaSystemBuilderClass[0](), "supportsMediaSystem:", v20) & 1) != 0)
            {
              objc_msgSend(v20, "remoteLoginHandler");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "loggedInAccount");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "username");
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v20, "remoteLoginHandler");
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29)
              {
                if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  objc_msgSend(v20, "remoteLoginHandler");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF();

                }
              }
              else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                     && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              objc_msgSend(v20, "remoteLoginHandler", v45);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "loggedInAccount");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  objc_msgSend(v20, "remoteLoginHandler");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "loggedInAccount");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF();

                }
              }
              else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                     && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              objc_msgSend(v20, "remoteLoginHandler", v46);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "loggedInAccount");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "username");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  objc_msgSend(v20, "remoteLoginHandler");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "loggedInAccount");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "username");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  LogPrintF();

                }
              }
              else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                     && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              if (v28)
              {
                SFNormalizeEmailAddress(v28, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v38 = 0;
              }
              v39 = v38;
              v40 = v51;
              v41 = v40;
              if (v39 == v40)
              {

              }
              else
              {
                if ((v51 != 0) == (v39 == 0))
                {

                  goto LABEL_76;
                }
                v42 = objc_msgSend(v39, "isEqual:", v40);

                if ((v42 & 1) == 0)
                {
LABEL_76:
                  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                  {
                    v45 = v41;
                    v47 = (uint64_t)v39;
                    LogPrintF();
                  }
LABEL_80:

                  a3 = v50;
LABEL_21:

LABEL_22:
                  if (v17 == ++v19)
                  {
                    v43 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v53, v61, 16);
                    v17 = v43;
                    if (!v43)
                      goto LABEL_82;
                    continue;
                  }
                  goto LABEL_17;
                }
              }
              objc_msgSend(v49, "addObject:", v20, v45);
              goto LABEL_80;
            }
            if (gLogCategory_SFDeviceOperationHomeKitSetup > 30
              || gLogCategory_SFDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_21;
            }
          }
          else
          {
            if (gLogCategory_SFDeviceOperationHomeKitSetup > 30
              || gLogCategory_SFDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
            {
              goto LABEL_21;
            }
            v45 = (void *)a3;
            v47 = objc_msgSend(v20, "supportedStereoPairVersions");
          }
          break;
        }
        LogPrintF();
        goto LABEL_21;
      }
    }
    v9 = (HMRoom *)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
  }
  while (v9);
LABEL_83:

  return v9;
}

- (id)findTVs
{
  HMRoom *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  HMRoom *v26;
  void *v27;
  HMRoom *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = self->_homeKitSelectedRoom;
  if (v3)
  {
LABEL_2:
    v28 = v3;
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    -[HMRoom accessories](v3, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v31;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v31 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v8);
          objc_msgSend(v9, "category", v27);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "categoryType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          getHMAccessoryCategoryTypeAppleTV[0]();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v13)
          {
            objc_msgSend(v9, "audioDestinationController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v14)
            {
              objc_msgSend(v9, "audioDestinationController");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "destination");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  v27 = v9;
                  LogPrintF();
                }
              }
              else
              {
                objc_msgSend(v29, "addObject:", v9);
              }

            }
            else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
                   && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              v27 = v9;
              LogPrintF();
            }
          }
          ++v8;
        }
        while (v6 != v8);
        v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        v6 = v17;
      }
      while (v17);
    }

    v18 = (void *)objc_msgSend(v29, "copy");
    v19 = v28;
    goto LABEL_25;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HMHome rooms](self->_homeKitSelectedHome, "rooms");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (!v18)
  {
LABEL_25:

    return v18;
  }
  v21 = *(_QWORD *)v35;
LABEL_28:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v35 != v21)
      objc_enumerationMutation(v19);
    v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v22);
    objc_msgSend(v23, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqual:", self->_homeKitSelectedRoomName);

    if ((v25 & 1) != 0)
      break;
    if (v18 == (void *)++v22)
    {
      v18 = (void *)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v18)
        goto LABEL_28;
      goto LABEL_25;
    }
  }
  v26 = v23;

  v3 = v26;
  if (v26)
    goto LABEL_2;
  return 0;
}

- (BOOL)_isOwnerOfHome:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "homeAccessControlForUser:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isOwner");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_mediaSystemForAccessory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v5, "mediaSystems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v23)
  {
    v7 = *(_QWORD *)v30;
    v21 = v5;
    v22 = v3;
    v24 = v6;
    v20 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v30 != v7)
          objc_enumerationMutation(v6);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v9, "components");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v26;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v26 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "mediaProfile");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "accessory");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "uniqueIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v17, "isEqual:", v4) & 1) != 0)
              {
                v18 = v9;

                v5 = v21;
                v3 = v22;
                v6 = v24;
                goto LABEL_19;
              }

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            if (v12)
              continue;
            break;
          }
        }

        v6 = v24;
        v7 = v20;
      }
      v18 = 0;
      v5 = v21;
      v3 = v22;
      v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v23);
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)_normalizedString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[ ]+"), CFSTR(" "), 1024, 0, objc_msgSend(v3, "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_removeSimilarRoomNames:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  const char *v50;
  void *v51;
  id v52;
  unint64_t v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v54 = a4;
  objc_msgSend(v54, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_msgSend(v6, "count");
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v51 = v8;
      v52 = v6;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "caseInsensitiveCompare:", v8))
        {
          v53 = v10;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          objc_msgSend(v54, "actionSets");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v68;
LABEL_7:
            v18 = 0;
            while (1)
            {
              if (*(_QWORD *)v68 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v18);
              objc_msgSend(v19, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                if (!objc_msgSend(v13, "caseInsensitiveCompare:", v21))
                  break;
              }

              if (v16 == ++v18)
              {
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
                if (v16)
                  goto LABEL_7;
                goto LABEL_14;
              }
            }
            objc_msgSend(v19, "name");
            v22 = (id)objc_claimAutoreleasedReturnValue();

            if (!v22)
              goto LABEL_18;
            v23 = "ActionSet";
          }
          else
          {
LABEL_14:

LABEL_18:
            v65 = 0u;
            v66 = 0u;
            v63 = 0u;
            v64 = 0u;
            objc_msgSend(v54, "serviceGroups");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v64;
LABEL_20:
              v28 = 0;
              while (1)
              {
                if (*(_QWORD *)v64 != v27)
                  objc_enumerationMutation(v24);
                v29 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v28);
                objc_msgSend(v29, "name");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();

                if (v31)
                {
                  if (!objc_msgSend(v13, "caseInsensitiveCompare:", v31))
                    break;
                }

                if (v26 == ++v28)
                {
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
                  if (v26)
                    goto LABEL_20;
                  goto LABEL_27;
                }
              }
              objc_msgSend(v29, "name");
              v22 = (id)objc_claimAutoreleasedReturnValue();

              if (!v22)
                goto LABEL_30;
              v23 = "ServiceGroup";
            }
            else
            {
LABEL_27:

LABEL_30:
              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              objc_msgSend(v54, "triggers");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
              if (v33)
              {
                v34 = v33;
                v35 = *(_QWORD *)v60;
LABEL_32:
                v36 = 0;
                while (1)
                {
                  if (*(_QWORD *)v60 != v35)
                    objc_enumerationMutation(v32);
                  v37 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v36);
                  objc_msgSend(v37, "name");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v39)
                  {
                    if (!objc_msgSend(v13, "caseInsensitiveCompare:", v39))
                      break;
                  }

                  if (v34 == ++v36)
                  {
                    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
                    if (v34)
                      goto LABEL_32;
                    goto LABEL_39;
                  }
                }
                objc_msgSend(v37, "name");
                v22 = (id)objc_claimAutoreleasedReturnValue();

                if (!v22)
                  goto LABEL_42;
                v23 = "Trigger";
              }
              else
              {
LABEL_39:

LABEL_42:
                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                objc_msgSend(v54, "zones");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
                if (!v41)
                {
LABEL_51:

LABEL_62:
                  ++v11;
                  v8 = v51;
                  v6 = v52;
                  v10 = v53;
                  goto LABEL_60;
                }
                v42 = v41;
                v43 = *(_QWORD *)v56;
LABEL_44:
                v44 = 0;
                while (1)
                {
                  if (*(_QWORD *)v56 != v43)
                    objc_enumerationMutation(v40);
                  v45 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v44);
                  objc_msgSend(v45, "name");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SFDeviceOperationHomeKitSetup _normalizedString:](self, "_normalizedString:", v46);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v47)
                  {
                    if (!objc_msgSend(v13, "caseInsensitiveCompare:", v47))
                      break;
                  }

                  if (v42 == ++v44)
                  {
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
                    if (v42)
                      goto LABEL_44;
                    goto LABEL_51;
                  }
                }
                objc_msgSend(v45, "name");
                v22 = (id)objc_claimAutoreleasedReturnValue();

                if (!v22)
                  goto LABEL_62;
                v23 = "Zone";
              }
            }
          }
          v8 = v51;
          v6 = v52;
          v10 = v53;
        }
        else
        {
          v22 = v8;
          v23 = "Home";
        }
        if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          v49 = v22;
          v50 = v23;
          v48 = v13;
          LogPrintF();
        }
        objc_msgSend(v6, "removeObjectAtIndex:", v11, v48, v49, v50);
        --v10;

LABEL_60:
      }
      while (v11 < v10);
    }
  }

}

- (void)_restoreHomeApp
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = (void *)objc_msgSend(objc_alloc((Class)getASDSystemAppRequestClass[0]()), "initWithBundleID:", CFSTR("com.apple.Home"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__SFDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke;
  v5[3] = &unk_1E482E2F8;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "startWithErrorHandler:", v5);

}

void __48__SFDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 192);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SFDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke_2;
  v7[3] = &unk_1E482D3A0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __48__SFDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90
      && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
         && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(*(id *)(a1 + 40), "bundleID");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

- (void)_updateHomeStats
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMHome accessories](self->_homeKitSelectedHome, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "category");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "categoryType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        getHMAccessoryCategoryTypeHomePod_0[0]();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (v11)
        {
          self->_hasHomePod = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    if (self->_hasHomePod)
      v12 = "yes";
    else
      v12 = "no";
    v15 = v12;
    LogPrintF();
  }
  -[HMHome users](self->_homeKitSelectedHome, "users", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  self->_hasMultipleUsers = v14 != 0;
  if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateAccount
{
  void *v3;
  ACAccount *v4;
  void *v5;
  _QWORD v6[4];
  ACAccount *v7;
  id v8;

  -[HMAccessory remoteLoginHandler](self->_homeKitAccessory, "remoteLoginHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = self->_iTunesAccount;
    if (v4)
    {
      if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        -[ACAccount username](v4, "username");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __47__SFDeviceOperationHomeKitSetup__updateAccount__block_invoke;
      v6[3] = &unk_1E482E2F8;
      v7 = v4;
      v8 = v3;
      objc_msgSend(v8, "updateLoggedInAccount:completionHandler:", v7, v6);

    }
    else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30
           && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90
         && (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __47__SFDeviceOperationHomeKitSetup__updateAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (gLogCategory_SFDeviceOperationHomeKitSetup <= 90)
    {
      v10 = v3;
      if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v7 = _LogCategory_Initialize(), v4 = v10, v7))
      {
        objc_msgSend(*(id *)(a1 + 32), "username");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
LABEL_8:

        v4 = v10;
      }
    }
  }
  else if (gLogCategory_SFDeviceOperationHomeKitSetup <= 30)
  {
    v10 = 0;
    if (gLogCategory_SFDeviceOperationHomeKitSetup != -1 || (v8 = _LogCategory_Initialize(), v4 = 0, v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "username");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "loggedInAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "username");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      goto LABEL_8;
    }
  }

}

- (NSDictionary)appDataSelf
{
  return self->_appDataSelf;
}

- (void)setAppDataSelf:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (HMAccessory)tvAudioInput
{
  return self->_tvAudioInput;
}

- (void)setTvAudioInput:(id)a3
{
  objc_storeStrong((id *)&self->_tvAudioInput, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)userInteractive
{
  return self->_userInteractive;
}

- (void)setUserInteractive:(BOOL)a3
{
  self->_userInteractive = a3;
}

- (BOOL)hasHomePod
{
  return self->_hasHomePod;
}

- (BOOL)hasMultipleUsers
{
  return self->_hasMultipleUsers;
}

- (BOOL)homeKitAddedAccessory
{
  return self->_homeKitAddedAccessory;
}

- (HMHomeManager)homeKitHomeManager
{
  return self->_homeKitHomeManager;
}

- (BOOL)homeKitHomeManagerReady
{
  return self->_homeKitHomeManagerReady;
}

- (HMHome)homeKitSelectedHome
{
  return self->_homeKitSelectedHome;
}

- (NSString)homeKitSelectedRoomName
{
  return self->_homeKitSelectedRoomName;
}

- (NSString)iTunesAccountID
{
  return self->_iTunesAccountID;
}

- (void)setITunesAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setITunesAccount:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesAccount, a3);
}

- (BOOL)keyExchangeOnly
{
  return self->_keyExchangeOnly;
}

- (void)setKeyExchangeOnly:(BOOL)a3
{
  self->_keyExchangeOnly = a3;
}

- (double)metricNonUserSeconds
{
  return self->_metricNonUserSeconds;
}

- (double)metricUserSeconds
{
  return self->_metricUserSeconds;
}

- (double)setupDeviceNonUserSeconds
{
  return self->_setupDeviceNonUserSeconds;
}

- (double)addDeviceNonUserSeconds
{
  return self->_addDeviceNonUserSeconds;
}

- (double)assignRoomNonUserSeconds
{
  return self->_assignRoomNonUserSeconds;
}

- (double)personalRequestsNonUserSeconds
{
  return self->_personalRequestsNonUserSeconds;
}

- (double)ulhNonUserSeconds
{
  return self->_ulhNonUserSeconds;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
  objc_storeStrong((id *)&self->_pairedPeer, a3);
}

- (BOOL)pauseAfterUserInput
{
  return self->_pauseAfterUserInput;
}

- (void)setPauseAfterUserInput:(BOOL)a3
{
  self->_pauseAfterUserInput = a3;
}

- (id)pauseHandler
{
  return self->_pauseHandler;
}

- (void)setPauseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)personalRequestsEnabled
{
  return self->_personalRequestsEnabled;
}

- (void)setPersonalRequestsEnabled:(BOOL)a3
{
  self->_personalRequestsEnabled = a3;
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (id)promptForRoomHandler
{
  return self->_promptForRoomHandler;
}

- (void)setPromptForRoomHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (id)promptForRoomHandlerDetailed
{
  return self->_promptForRoomHandlerDetailed;
}

- (void)setPromptForRoomHandlerDetailed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (id)promptToInstallHomeAppHandler
{
  return self->_promptToInstallHomeAppHandler;
}

- (void)setPromptToInstallHomeAppHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (HMAccessory)stereoCounterpart
{
  return self->_stereoCounterpart;
}

- (void)setStereoCounterpart:(id)a3
{
  objc_storeStrong((id *)&self->_stereoCounterpart, a3);
}

- (NSArray)psgHomePods
{
  return self->_psgHomePods;
}

- (void)setPsgHomePods:(id)a3
{
  objc_storeStrong((id *)&self->_psgHomePods, a3);
}

- (NSArray)psgStereoPairs
{
  return self->_psgStereoPairs;
}

- (void)setPsgStereoPairs:(id)a3
{
  objc_storeStrong((id *)&self->_psgStereoPairs, a3);
}

- (HMMediaGroup)existingMediaGroup
{
  return self->_existingMediaGroup;
}

- (void)setExistingMediaGroup:(id)a3
{
  objc_storeStrong((id *)&self->_existingMediaGroup, a3);
}

- (int)stereoRole
{
  return self->_stereoRole;
}

- (void)setStereoRole:(int)a3
{
  self->_stereoRole = a3;
}

- (TRSession)trSession
{
  return self->_trSession;
}

- (void)setTrSession:(id)a3
{
  objc_storeStrong((id *)&self->_trSession, a3);
}

- (double)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(double)a3
{
  self->_timeoutInSeconds = a3;
}

- (double)odeonSeconds
{
  return self->_odeonSeconds;
}

- (void)setOdeonSeconds:(double)a3
{
  self->_odeonSeconds = a3;
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_sessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_existingMediaGroup, 0);
  objc_storeStrong((id *)&self->_psgStereoPairs, 0);
  objc_storeStrong((id *)&self->_psgHomePods, 0);
  objc_storeStrong((id *)&self->_stereoCounterpart, 0);
  objc_storeStrong(&self->_promptToInstallHomeAppHandler, 0);
  objc_storeStrong(&self->_promptForRoomHandlerDetailed, 0);
  objc_storeStrong(&self->_promptForRoomHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_pauseHandler, 0);
  objc_storeStrong((id *)&self->_pairedPeer, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_iTunesAccountID, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoomName, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedHome, 0);
  objc_storeStrong((id *)&self->_homeKitHomeManager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tvAudioInput, 0);
  objc_storeStrong((id *)&self->_appDataSelf, 0);
  objc_storeStrong((id *)&self->_hdsutilHKToken, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystem, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoom, 0);
  objc_storeStrong((id *)&self->_homeKitAccessory, 0);
  objc_storeStrong((id *)&self->_homeKitDeviceSetupOperation, 0);
  objc_storeStrong((id *)&self->_homeKitBrowser, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end
