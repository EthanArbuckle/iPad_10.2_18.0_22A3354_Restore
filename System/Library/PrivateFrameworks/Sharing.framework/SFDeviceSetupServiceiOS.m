@implementation SFDeviceSetupServiceiOS

- (SFDeviceSetupServiceiOS)init
{
  SFDeviceSetupServiceiOS *v2;
  SFDeviceSetupServiceiOS *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupServiceiOS;
  v2 = -[SFDeviceSetupServiceiOS init](&v7, sel_init);
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

- (void)dealloc
{
  SFDeviceSetupServiceiOS *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceSetupServiceiOS *)FatalErrorF();
    -[SFDeviceSetupServiceiOS _cleanup](v3, v4);
  }
  else
  {
    -[SFDeviceSetupServiceiOS _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupServiceiOS;
    -[SFDeviceSetupServiceiOS dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  id completionHandler;
  id showPINHandler;
  id showPINHandlerEx;
  id hidePINHandler;
  id progressHandlerEx;
  id receivedObjectHandler;

  completionHandler = self->_completionHandler;
  self->_completionHandler = 0;

  showPINHandler = self->_showPINHandler;
  self->_showPINHandler = 0;

  showPINHandlerEx = self->_showPINHandlerEx;
  self->_showPINHandlerEx = 0;

  hidePINHandler = self->_hidePINHandler;
  self->_hidePINHandler = 0;

  progressHandlerEx = self->_progressHandlerEx;
  self->_progressHandlerEx = 0;

  receivedObjectHandler = self->_receivedObjectHandler;
  self->_receivedObjectHandler = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceSetupServiceiOS_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceSetupServiceiOS_activate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  SFClient *v3;
  uint64_t v4;
  void *v5;

  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = CFPrefs_GetInt64() != 0;
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[4])
  {
    v3 = objc_alloc_init(SFClient);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "preventExitForLocaleReason:", CFSTR("iOSSetup"));
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_run");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceSetupServiceiOS_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceSetupServiceiOS_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 10)
    && gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 80))
  {
    objc_msgSend((id)v2, "_handleSessionEnded:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 32), "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidate");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_invalidated
{
  void (**completionHandler)(id, _QWORD);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFDeviceSetupServiceiOSCore <= 60
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_sfService)
    {
      completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
      if (completionHandler)
        completionHandler[2](completionHandler, 0);
      -[SFDeviceSetupServiceiOS _cleanup](self, "_cleanup");
      self->_invalidateDone = 1;
      if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_completed:(int)a3
{
  uint64_t v3;
  void (**completionHandler)(id, void *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;
  _QWORD v20[2];

  v3 = *(_QWORD *)&a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    v16 = v3;
    LogPrintF();
  }
  completionHandler = (void (**)(id, void *))self->_completionHandler;
  if (completionHandler)
  {
    if ((_DWORD)v3)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = *MEMORY[0x1E0CB2F90];
      v19 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = CFSTR("?");
      if (v8)
        v10 = (const __CFString *)v8;
      v20[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, v16);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, (int)v3, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, v12);

    }
    else
    {
      completionHandler[2](self->_completionHandler, 0);
    }
    v13 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3, v16, CFSTR("_cat"), CFSTR("_op"), CFSTR("error"), CFSTR("iOSSetup"), CFSTR("Done"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SFDashboardLogJSON(v15);

  -[SFDeviceSetupServiceiOS _cleanup](self, "_cleanup");
}

- (void)_run
{
  int v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = -[SFDeviceSetupServiceiOS _runResumeIfNeeded](self, "_runResumeIfNeeded");
  if (v3 == 4 || v3 == 2)
  {
    if (self->_sfService)
    {
      if (!self->_sfServiceActivated
        && gLogCategory_SFDeviceSetupServiceiOSCore <= 30
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      -[SFDeviceSetupServiceiOS _sfServiceStart](self, "_sfServiceStart");
    }
  }
}

- (int)_runResumeIfNeeded
{
  int result;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  result = self->_resumeState;
  if (!result)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D1B380]);
    objc_msgSend(v4, "setAccessGroup:", CFSTR("com.apple.Sharing"));
    objc_msgSend(v4, "setAccessibleType:", 7);
    objc_msgSend(v4, "setIdentifier:", CFSTR("SetupResumeKey"));
    objc_msgSend(v4, "setSyncType:", 1);
    objc_msgSend(v4, "setType:", CFSTR("SetupResumeKey"));
    v5 = objc_alloc_init(MEMORY[0x1E0D1B388]);
    v18 = 0;
    v6 = (void *)objc_msgSend(v5, "copyItemMatchingItem:flags:error:", v4, 1, &v18);
    v7 = v18;
    v8 = v7;
    if (v6)
    {
      v17 = v7;
      v9 = objc_msgSend(v5, "removeItemMatchingItem:error:", v6, &v17);
      v10 = v17;

      if ((v9 & 1) == 0
        && gLogCategory_SFDeviceSetupServiceiOSCore <= 90
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        v16 = v10;
        LogPrintF();
      }
      objc_msgSend(v6, "secrets", v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryGetCFDataOfLength();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v6, "secrets");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        CFStringGetTypeID();
        CFDictionaryGetTypedValue();
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_storeStrong((id *)&self->_resumeAuthTag, v13);
          objc_storeStrong((id *)&self->_resumePassword, v15);
          self->_resumeState = 4;
          if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
            && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v11 = 0;
        }
        else
        {
          if (gLogCategory_SFDeviceSetupServiceiOSCore <= 90
            && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          self->_resumeState = 2;
          v11 = 1;
        }

      }
      else
      {
        if (gLogCategory_SFDeviceSetupServiceiOSCore <= 90
          && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_resumeState = 2;
        v11 = 1;
      }

      v8 = v10;
    }
    else
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_resumeState = 2;
      v11 = 1;
    }

    if (v11)
      return 2;
    else
      return self->_resumeState;
  }
  return result;
}

- (void)_sfServiceStart
{
  SFService *v3;
  SFService *sfService;
  uint64_t v5;
  SFService *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  if (self->_advertiseFast)
    -[SFService setAdvertiseRate:](self->_sfService, "setAdvertiseRate:", 50);
  -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setIdentifier:](self->_sfService, "setIdentifier:", CFSTR("com.apple.sharing.iOSSetup"));
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 9);
  -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 1);
  if (self->_resumeAuthTag)
  {
    -[SFService setAuthTagOverride:](self->_sfService, "setAuthTagOverride:");
    -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", -[SFService sessionFlags](self->_sfService, "sessionFlags") | 0x80);
  }
  -[SFService setInterruptionHandler:](self->_sfService, "setInterruptionHandler:", &__block_literal_global_50);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_2;
  v14[3] = &unk_1E482DF78;
  v14[4] = self;
  -[SFService setInvalidationHandler:](self->_sfService, "setInvalidationHandler:", v14);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_3;
  v13[3] = &unk_1E482DFF0;
  v13[4] = self;
  -[SFService setPairSetupCompletionHandler:](self->_sfService, "setPairSetupCompletionHandler:", v13);
  -[SFService setPeerDisconnectedHandler:](self->_sfService, "setPeerDisconnectedHandler:", &__block_literal_global_131);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_5;
  v12[3] = &unk_1E4832FC8;
  v12[4] = self;
  -[SFService setShowPINHandlerEx:](self->_sfService, "setShowPINHandlerEx:", v12);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_6;
  v11[3] = &unk_1E4832FF0;
  v11[4] = self;
  -[SFService setReceivedObjectHandler:](self->_sfService, "setReceivedObjectHandler:", v11);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_7;
  v10[3] = &unk_1E482FA30;
  v10[4] = self;
  -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_8;
  v9[3] = &unk_1E482FA58;
  v9[4] = self;
  -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_9;
  v8[3] = &unk_1E482FA30;
  v8[4] = self;
  -[SFService setSessionSecuredHandler:](self->_sfService, "setSessionSecuredHandler:", v8);
  v6 = self->_sfService;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_10;
  v7[3] = &unk_1E482DFF0;
  v7[4] = self;
  -[SFService activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke()
{
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v7 = v3;
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
      {
        LogPrintF();
        v4 = v7;
      }
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
    if (v6)
    {
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v4);
      v4 = v7;
    }
  }

}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v5 = a2;
  v4 = a3;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v6 = _LogCategory_Initialize(), v5 = v10, v6))
    {
      IsAppleInternalBuild();
      LogPrintF();
      v5 = v10;
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 120);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v10);
LABEL_9:
    v5 = v10;
    goto LABEL_10;
  }
  v9 = *(_QWORD *)(v7 + 128);
  if (v9)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);
    goto LABEL_9;
  }
LABEL_10:

}

uint64_t __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedObject:flags:", a4, a3);
}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_7(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v8, "peer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  v3 = *(_QWORD **)(a1 + 32);
  if (!v3[2])
  {
    objc_msgSend(v8, "peer");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v4;

    v3 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v3, "_handleSessionStarted:", v8, v7);

}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_8(uint64_t a1, void *a2, void *a3)
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
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v12, "peer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v5;
    LogPrintF();

  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v12, "peer", v10, v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v6, "isEqual:", v7);

  if ((_DWORD)v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 16);
    *(_QWORD *)(v8 + 16) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "_handleSessionEnded:", v12);

}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      objc_msgSend(v3, "peer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleSessionSecured:", v3, v5);

}

void __42__SFDeviceSetupServiceiOS__sfServiceStart__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 90
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_completed:", NSErrorToOSStatus());
  }
  else
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }

}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  unsigned int Int64Ranged;
  void (**v8)(id, uint64_t, _QWORD);
  void (**v9)(id, id);
  void (**receivedObjectHandler)(id, id);
  void (**progressHandlerEx)(id, uint64_t, id);
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    v13 = &unk_1A2AF8A14;
    v14 = objc_msgSend(v6, "count");
    v12 = v4;
    LogPrintF();
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged <= 4)
  {
    if (Int64Ranged != 1)
    {
      if (Int64Ranged == 3)
      {
        if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
          && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        receivedObjectHandler = (void (**)(id, id))self->_receivedObjectHandler;
        if (receivedObjectHandler)
          receivedObjectHandler[2](receivedObjectHandler, v6);
        progressHandlerEx = (void (**)(id, uint64_t, id))self->_progressHandlerEx;
        if (progressHandlerEx)
          progressHandlerEx[2](progressHandlerEx, 40, v6);
        -[SFService sendToPeer:flags:object:](self->_sfService, "sendToPeer:flags:object:", self->_peer, v4, &unk_1E4891340, v12, v13, v14);
        goto LABEL_30;
      }
      goto LABEL_21;
    }
    if ((v4 & 1) != 0)
    {
      -[SFDeviceSetupServiceiOS _handleConfigRequestReceived:](self, "_handleConfigRequestReceived:", v6);
      if (CFDictionaryGetInt64())
      {
        v8 = (void (**)(id, uint64_t, _QWORD))self->_progressHandlerEx;
        if (v8)
          v8[2](v8, 96, 0);
      }
      goto LABEL_30;
    }
    if (gLogCategory_SFDeviceSetupServiceiOSCore > 50
      || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
LABEL_23:
    LogPrintF();
    goto LABEL_30;
  }
  if (Int64Ranged != 5)
  {
    if (Int64Ranged == 12)
    {
      -[SFDeviceSetupServiceiOS _handleAppEventReceived:](self, "_handleAppEventReceived:", v6);
      goto LABEL_30;
    }
LABEL_21:
    if (gLogCategory_SFDeviceSetupServiceiOSCore > 50
      || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
    goto LABEL_23;
  }
  if ((v4 & 1) == 0)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore > 50
      || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_30;
    }
    goto LABEL_23;
  }
  v9 = (void (**)(id, id))self->_receivedObjectHandler;
  if (v9)
    v9[2](v9, v6);
LABEL_30:

}

- (void)sendObject:(id)a3
{
  id v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (self->_sfService)
  {
    if (self->_peer)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
      {
        if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v5 = _LogCategory_Initialize(), v4 = v10, v5))
        {
          v9 = objc_msgSend(v4, "count");
          LogPrintF();
          v4 = v10;
        }
      }
      v6 = (void *)objc_msgSend(v4, "mutableCopy", v9);
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E48909B8, CFSTR("op"));
      -[SFService sendToPeer:flags:object:](self->_sfService, "sendToPeer:flags:object:", self->_peer, 1, v6);

      goto LABEL_8;
    }
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || (v8 = _LogCategory_Initialize(), v4 = v10, v8))
      {
LABEL_15:
        LogPrintF();
LABEL_8:
        v4 = v10;
      }
    }
  }
  else if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore != -1)
      goto LABEL_15;
    v7 = _LogCategory_Initialize();
    v4 = v10;
    if (v7)
      goto LABEL_15;
  }

}

- (void)sendSetupAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v6 = *(_QWORD *)&a3;
  v15 = a4;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (self->_sfSession)
  {
    v10 = _Block_copy(v8);
    if (v10)
      v11 = v10;
    else
      v11 = &__block_literal_global_164;
    if (v15)
      v12 = (id)objc_msgSend(v15, "mutableCopy");
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("sa"));

    -[SFSession sendRequestID:options:request:responseHandler:](self->_sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_sa"), &unk_1E4891368, v13, v11);
    goto LABEL_11;
  }
  if (v8)
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, _QWORD))v9)[2](v9, v11, 0, 0);
LABEL_11:

  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession **p_sfSession;
  void *v7;
  const __CFString *resumePassword;
  int v9;
  SFSession *v10;
  void *v11;
  SFSession *sfSession;
  void (**progressHandlerEx)(id, uint64_t, void *);
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSession peer](*p_sfSession, "peer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    goto LABEL_36;
  }
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v5, "peer");
    v15 = objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_storeStrong((id *)&self->_sfSession, a3);
  resumePassword = (const __CFString *)self->_resumePassword;
  if (resumePassword)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore != -1
        || (v9 = _LogCategory_Initialize(), resumePassword = (const __CFString *)self->_resumePassword, v9))
      {
        v15 = (uint64_t)resumePassword;
        LogPrintF();
        resumePassword = (const __CFString *)self->_resumePassword;
      }
    }
    v10 = *p_sfSession;
  }
  else
  {
    if (-[SFSession sharingSourceVersion](*p_sfSession, "sharingSourceVersion") < 0x89A260)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50
        && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        v15 = -[SFSession sharingSourceVersion](*p_sfSession, "sharingSourceVersion", v15);
        LogPrintF();
      }
      goto LABEL_27;
    }
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 50
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = *p_sfSession;
    resumePassword = CFSTR("public");
  }
  -[SFSession setFixedPIN:](v10, "setFixedPIN:", resumePassword, v15);
LABEL_27:
  objc_msgSend(v5, "messageSessionTemplate", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    sfSession = self->_sfSession;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__SFDeviceSetupServiceiOS__handleSessionStarted___block_invoke;
    v17[3] = &unk_1E482E2D0;
    v17[4] = self;
    -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("_sa"), &unk_1E4891390, v17);
    progressHandlerEx = (void (**)(id, uint64_t, void *))self->_progressHandlerEx;
    if (progressHandlerEx)
    {
      v18 = CFSTR("mst");
      v19[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandlerEx[2](progressHandlerEx, 31, v14);

    }
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0);
  }
  else if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60
         && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

LABEL_36:
}

uint64_t __49__SFDeviceSetupServiceiOS__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetupActionRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSData *resumeAuthTag;
  NSString *resumePassword;
  SFSession *v9;
  void *v10;
  SFSession *v11;

  sfSession = (SFSession *)a3;
  if (self->_sfSession == sfSession)
  {
    v11 = sfSession;
    if (sfSession && gLogCategory_SFDeviceSetupServiceiOSCore <= 30)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore != -1)
      {
LABEL_5:
        -[SFSession peer](sfSession, "peer");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        goto LABEL_7;
      }
      if (_LogCategory_Initialize())
      {
        sfSession = self->_sfSession;
        goto LABEL_5;
      }
    }
LABEL_7:
    v5 = _Block_copy(self->_progressHandlerEx);
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))v5;
    if (self->_suspendPending)
    {
      self->_suspendPending = 0;
      if (v5)
      {
        (*((void (**)(void *, uint64_t, _QWORD))v5 + 2))(v5, 98, 0);
LABEL_11:
        v6[2](v6, 32, 0);
      }
    }
    else if (v5)
    {
      goto LABEL_11;
    }
    resumeAuthTag = self->_resumeAuthTag;
    self->_resumeAuthTag = 0;

    resumePassword = self->_resumePassword;
    self->_resumePassword = 0;

    v9 = self->_sfSession;
    self->_sfSession = 0;

    -[SFService setAuthTagOverride:](self->_sfService, "setAuthTagOverride:", 0);
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);

    sfSession = v11;
  }

}

- (void)_handleSessionSecured:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**progressHandlerEx)(id, uint64_t, void *);
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFSession fixedPIN](self->_sfSession, "fixedPIN");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFSession setFixedPIN:](self->_sfSession, "setFixedPIN:", 0);
  }
  else
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (self->_progressHandlerEx)
    {
      objc_msgSend(v4, "messageSessionTemplate");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      if (v6)
      {
        progressHandlerEx = (void (**)(id, uint64_t, void *))self->_progressHandlerEx;
        v10 = CFSTR("mst");
        v11[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        progressHandlerEx[2](progressHandlerEx, 33, v9);

      }
      else if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60
             && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
  }

}

- (void)_handleConfigRequestReceived:(id)a3
{
  objc_class *v4;
  id v5;
  RPFileTransferSession *fileTransferSessionTemplate;
  RPFileTransferSession *v7;
  RPFileTransferSession *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v14 = objc_alloc_init(v4);
  fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
  if (!fileTransferSessionTemplate)
  {
    v7 = (RPFileTransferSession *)objc_alloc_init(MEMORY[0x1E0D83928]);
    v8 = self->_fileTransferSessionTemplate;
    self->_fileTransferSessionTemplate = v7;

    -[RPFileTransferSession setFlags:](self->_fileTransferSessionTemplate, "setFlags:", 291);
    -[RPFileTransferSession prepareTemplateAndReturnError:](self->_fileTransferSessionTemplate, "prepareTemplateAndReturnError:", 0);
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[RPFileTransferSession setPeerPublicKey:](self->_fileTransferSessionTemplate, "setPeerPublicKey:", v9);

  -[RPFileTransferSession selfPublicKey](self->_fileTransferSessionTemplate, "selfPublicKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("ftPK"));

  -[RPFileTransferSession targetID](self->_fileTransferSessionTemplate, "targetID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("ftTID"));

  if (!fileTransferSessionTemplate)
  {
    v12 = _Block_copy(self->_progressHandlerEx);
    v13 = v12;
    if (v12)
      (*((void (**)(void *, uint64_t, _QWORD))v12 + 2))(v12, 420, 0);

  }
  -[SFDeviceSetupServiceiOS sendObject:](self, "sendObject:", v14);

}

- (void)_handleAppEventReceived:(id)a3
{
  void (**receivedObjectHandler)(id, id);
  void *v5;
  id v6;

  v6 = a3;
  CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  receivedObjectHandler = (void (**)(id, id))self->_receivedObjectHandler;
  v5 = v6;
  if (receivedObjectHandler)
  {
    receivedObjectHandler[2](receivedObjectHandler, v6);
    v5 = v6;
  }

}

- (void)_handleSetupActionRequest:(id)a3 responseHandler:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  uint64_t Int64Ranged;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  char *v14;

  v14 = (char *)a3;
  v6 = (objc_class *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 30
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0xA)
      v10 = "?";
    else
      v10 = off_1E4833010[(int)Int64Ranged];
    v12 = (uint64_t)v10;
    v13 = v14;
    LogPrintF();
  }
  if ((_DWORD)Int64Ranged == 7)
  {
    -[SFDeviceSetupServiceiOS _handleSetupActionResume](self, "_handleSetupActionResume");
  }
  else if ((_DWORD)Int64Ranged == 6)
  {
    -[SFDeviceSetupServiceiOS _handleSetupActionSuspend](self, "_handleSetupActionSuspend");
  }
  else
  {
    if (gLogCategory_SFDeviceSetupServiceiOSCore <= 60
      && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
    {
      if (Int64Ranged > 0xA)
        v11 = "?";
      else
        v11 = off_1E4833068[(int)Int64Ranged];
      v12 = Int64Ranged;
      v13 = v11;
      LogPrintF();
    }
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E48909D0, CFSTR("er"), v12, v13);
  }
  (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);

}

- (void)_handleSetupActionSuspend
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[2];
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("ResumeAuthTag"), 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("ResumePassword"), 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "bytes");
    objc_msgSend(v6, "length");
    DataToHexCStringEx();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v8 = objc_alloc_init(MEMORY[0x1E0D1B380]);
    objc_msgSend(v8, "setAccessGroup:", CFSTR("com.apple.Sharing"));
    objc_msgSend(v8, "setAccessibleType:", 7);
    objc_msgSend(v8, "setIdentifier:", CFSTR("SetupResumeKey"));
    objc_msgSend(v8, "setInvisible:", 1);
    v13[0] = CFSTR("ResumeAuthTag");
    v13[1] = CFSTR("ResumePassword");
    v14[0] = v3;
    v14[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSecrets:", v9);

    objc_msgSend(v8, "setSyncType:", 1);
    objc_msgSend(v8, "setType:", CFSTR("SetupResumeKey"));
    v10 = objc_alloc_init(MEMORY[0x1E0D1B388]);
    v12 = 0;
    objc_msgSend(v10, "addOrUpdateOrReAddItem:logCategory:logLabel:error:", v8, &gLogCategory_SFDeviceSetupServiceiOSCore, CFSTR("ResumeKey"), &v12);
    v11 = v12;
    if (v11)
    {
      if (gLogCategory_SFDeviceSetupServiceiOSCore > 90
        || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_12;
      }
    }
    else if (gLogCategory_SFDeviceSetupServiceiOSCore > 30
           || gLogCategory_SFDeviceSetupServiceiOSCore == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_12;
    }
    LogPrintF();
LABEL_12:
    self->_suspendPending = 1;

    goto LABEL_13;
  }
  if (gLogCategory_SFDeviceSetupServiceiOSCore <= 90
    && (gLogCategory_SFDeviceSetupServiceiOSCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_13:

}

- (void)_handleSetupActionResume
{
  void *v2;
  id v3;

  v2 = _Block_copy(self->_progressHandlerEx);
  if (v2)
  {
    v3 = v2;
    (*((void (**)(void *, uint64_t, _QWORD))v2 + 2))(v2, 97, 0);
    v2 = v3;
  }

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (RPFileTransferSession)fileTransferSessionTemplate
{
  return self->_fileTransferSessionTemplate;
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setShowPINHandlerEx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)progressHandlerEx
{
  return self->_progressHandlerEx;
}

- (void)setProgressHandlerEx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)receivedObjectHandler
{
  return self->_receivedObjectHandler;
}

- (void)setReceivedObjectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receivedObjectHandler, 0);
  objc_storeStrong(&self->_progressHandlerEx, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong((id *)&self->_resumePassword, 0);
  objc_storeStrong((id *)&self->_resumeAuthTag, 0);
  objc_storeStrong((id *)&self->_preventExitForLocaleClient, 0);
  objc_storeStrong((id *)&self->_peer, 0);
}

@end
