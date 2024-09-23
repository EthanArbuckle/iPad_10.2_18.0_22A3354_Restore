@implementation SFDeviceOperationCDPSetup

- (SFDeviceOperationCDPSetup)init
{
  SFDeviceOperationCDPSetup *v2;
  SFDeviceOperationCDPSetup *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceOperationCDPSetup;
  v2 = -[SFDeviceOperationCDPSetup init](&v7, sel_init);
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
  block[2] = __37__SFDeviceOperationCDPSetup_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceOperationCDPSetup_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  OS_dispatch_source *v3;
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  id v6;
  _QWORD handler[5];

  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_startTicks = mach_absolute_time();
  if (self->_sfSession)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v3;

    v5 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __38__SFDeviceOperationCDPSetup__activate__block_invoke;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    SFDispatchTimerSet(self->_timeoutTimer, 180.0, -1.0, -10.0);
    dispatch_activate((dispatch_object_t)self->_timeoutTimer);
    -[SFDeviceOperationCDPSetup _run](self, "_run");
  }
  else
  {
    NSErrorWithOSStatusF();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SFDeviceOperationCDPSetup _complete:](self, "_complete:", v6);

  }
}

void __38__SFDeviceOperationCDPSetup__activate__block_invoke(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[36])
  {
    NSErrorWithOSStatusF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_complete:", v2);

  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceOperationCDPSetup_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __39__SFDeviceOperationCDPSetup_invalidate__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) = 1;
  v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_complete:", v2);

}

- (void)_complete:(id)a3
{
  void (**v4)(void *, id);
  id completionHandler;
  double metricSeconds;
  CDPStateController *cdpController;
  CDPContext *cdpContext;
  OS_dispatch_source *timeoutTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  double v12;
  id v13;

  v13 = a3;
  v4 = (void (**)(void *, id))_Block_copy(self->_completionHandler);
  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  if (v4)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_metricSeconds = metricSeconds;
    if (!v13)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup > 30)
        goto LABEL_13;
      if (gLogCategory_SFDeviceOperationCDPSetup == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_13;
        metricSeconds = self->_metricSeconds;
      }
      v12 = metricSeconds;
      goto LABEL_9;
    }
    if (gLogCategory_SFDeviceOperationCDPSetup <= 60
      && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
    {
      v12 = *(double *)&v13;
LABEL_9:
      LogPrintF();
    }
  }
LABEL_13:
  -[CDPStateController invalidate](self->_cdpController, "invalidate", *(_QWORD *)&v12);
  cdpController = self->_cdpController;
  self->_cdpController = 0;

  cdpContext = self->_cdpContext;
  self->_cdpContext = 0;

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  if (v4)
    v4[2](v4, v13);

}

- (void)_run
{
  int v3;
  int v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    if (self->_completionHandler)
    {
      v3 = -[SFDeviceOperationCDPSetup _runCDPApprovalServerStart](self, "_runCDPApprovalServerStart");
      if (v3 == 4 || v3 == 2)
      {
        if (self->_skipSetupRequest
          || (v4 = -[SFDeviceOperationCDPSetup _runCDPSetupRequest](self, "_runCDPSetupRequest"), v4 == 4)
          || v4 == 2)
        {
          -[SFDeviceOperationCDPSetup _complete:](self, "_complete:", 0);
        }
      }
    }
  }
}

- (int)_runCDPApprovalServerStart
{
  int cdpApprovalServerState;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CDPContext *v9;
  CDPContext *cdpContext;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CDPStateController *v15;
  CDPStateController *cdpController;
  id v17;
  void *v18;
  CDPStateController *v19;
  _QWORD v21[5];

  cdpApprovalServerState = self->_cdpApprovalServerState;
  if (cdpApprovalServerState != 4 && cdpApprovalServerState != 2)
  {
    if (cdpApprovalServerState)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_cdpApprovalServerState = 1;
      -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        objc_msgSend((Class)getACAccountStoreClass_2[0](), "defaultStore");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "aa_primaryAppleAccount");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (CDPContext *)objc_alloc_init((Class)getCDPContextClass[0]());
        cdpContext = self->_cdpContext;
        self->_cdpContext = v9;

        objc_msgSend(v8, "username");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPContext setAppleID:](self->_cdpContext, "setAppleID:", v11);

        v12 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v8, "aa_personID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "numberWithLongLong:", objc_msgSend(v13, "longLongValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CDPContext setDsid:](self->_cdpContext, "setDsid:", v14);

        -[CDPContext setSharingChannel:](self->_cdpContext, "setSharingChannel:", v6);
        -[CDPContext set_skipEscrowFetches:](self->_cdpContext, "set_skipEscrowFetches:", self->_skipEscrowFetches);
        v15 = (CDPStateController *)objc_msgSend(objc_alloc((Class)getCDPStateControllerClass[0]()), "initWithContext:", self->_cdpContext);
        cdpController = self->_cdpController;
        self->_cdpController = v15;

        v17 = self->_presentingViewController;
        if (v17)
        {
          v18 = (void *)objc_msgSend(objc_alloc((Class)getCDPUIControllerClass[0]()), "initWithPresentingViewController:", v17);
          objc_msgSend(v18, "setDelegate:", self);
          objc_msgSend(v18, "setForceInlinePresentation:", 1);
          -[CDPStateController setUiProvider:](self->_cdpController, "setUiProvider:", v18);

        }
        v19 = self->_cdpController;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __55__SFDeviceOperationCDPSetup__runCDPApprovalServerStart__block_invoke;
        v21[3] = &unk_1E482F150;
        v21[4] = self;
        -[CDPStateController startCircleApplicationApprovalServer:](v19, "startCircleApplicationApprovalServer:", v21);

      }
      else
      {
        self->_cdpApprovalServerState = 3;
        NSErrorWithOSStatusF();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceOperationCDPSetup _complete:](self, "_complete:", v6);
      }

    }
  }
  return self->_cdpApprovalServerState;
}

void __55__SFDeviceOperationCDPSetup__runCDPApprovalServerStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__SFDeviceOperationCDPSetup__runCDPApprovalServerStart__block_invoke_2;
  block[3] = &unk_1E4832528;
  v11 = a2;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __55__SFDeviceOperationCDPSetup__runCDPApprovalServerStart__block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 36))
  {
    v1 = result;
    if (gLogCategory_SFDeviceOperationCDPSetup <= 30
      && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(v1 + 32) + 8) = 4;
    return objc_msgSend(*(id *)(v1 + 32), "_run");
  }
  return result;
}

- (int)_runCDPSetupRequest
{
  int cdpSetupRequestState;
  void *v5;
  void *v6;
  SFSession *sfSession;
  _QWORD v9[5];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  cdpSetupRequestState = self->_cdpSetupRequestState;
  if (cdpSetupRequestState != 4 && cdpSetupRequestState != 2)
  {
    if (cdpSetupRequestState)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v10 = CFSTR("cdpRepair");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isRepair);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      sfSession = self->_sfSession;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __48__SFDeviceOperationCDPSetup__runCDPSetupRequest__block_invoke;
      v9[3] = &unk_1E482E320;
      v9[4] = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_cdpSetup"), 0, v6, v9);

    }
  }
  return self->_cdpSetupRequestState;
}

void __48__SFDeviceOperationCDPSetup__runCDPSetupRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  id v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 36))
  {
    v9 = v12;
    if (v12)
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 90)
      {
        if (gLogCategory_SFDeviceOperationCDPSetup != -1 || (v10 = _LogCategory_Initialize(), v9 = v12, v10))
        {
          v11 = v9;
          LogPrintF();
          v9 = v12;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "_complete:", v9, v11);
    }
    else
    {
      if (gLogCategory_SFDeviceOperationCDPSetup <= 30
        && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
      {
        v11 = 0;
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v11);
    }
  }

}

- (void)uiController:(id)a3 didPresentRootViewController:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (gLogCategory_SFDeviceOperationCDPSetup <= 30
    && (gLogCategory_SFDeviceOperationCDPSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (double)metricSeconds
{
  return self->_metricSeconds;
}

- (id)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong(&self->_presentingViewController, a3);
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
}

- (BOOL)skipSetupRequest
{
  return self->_skipSetupRequest;
}

- (void)setSkipSetupRequest:(BOOL)a3
{
  self->_skipSetupRequest = a3;
}

- (BOOL)skipEscrowFetches
{
  return self->_skipEscrowFetches;
}

- (void)setSkipEscrowFetches:(BOOL)a3
{
  self->_skipEscrowFetches = a3;
}

- (BOOL)isRepair
{
  return self->_isRepair;
}

- (void)setIsRepair:(BOOL)a3
{
  self->_isRepair = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong(&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_cdpController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
}

@end
