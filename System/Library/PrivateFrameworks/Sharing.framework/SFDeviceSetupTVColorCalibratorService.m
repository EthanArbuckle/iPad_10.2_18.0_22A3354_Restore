@implementation SFDeviceSetupTVColorCalibratorService

- (SFDeviceSetupTVColorCalibratorService)init
{
  SFDeviceSetupTVColorCalibratorService *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  SFDeviceSetupTVColorCalibratorService *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupTVColorCalibratorService;
  v2 = -[SFDeviceSetupTVColorCalibratorService init](&v7, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceSetupTVColorCalibratorService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__SFDeviceSetupTVColorCalibratorService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_sfServiceStart");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SFDeviceSetupTVColorCalibratorService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __51__SFDeviceSetupTVColorCalibratorService_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 10))
  {
    v1 = result;
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 10) = 1;
    return objc_msgSend(*(id *)(v1 + 32), "_invalidate");
  }
  return result;
}

- (void)_invalidate
{
  SFService *sfService;
  id progressHandler;

  if (!self->_invalidateDone)
  {
    self->_invalidateDone = 1;
    -[SFDeviceSetupTVColorCalibratorService _handleSessionEnded:](self, "_handleSessionEnded:", self->_sfSession);
    -[SFService invalidate](self->_sfService, "invalidate");
    sfService = self->_sfService;
    self->_sfService = 0;

    -[SFDeviceSetupTVColorCalibratorService _reportProgress:info:](self, "_reportProgress:info:", 20, 0);
    progressHandler = self->_progressHandler;
    self->_progressHandler = 0;

    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)_reportProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = _Block_copy(self->_progressHandler);
  v7 = v6;
  if (v6)
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, v4, v8);

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
  const char *v15;
  const char *v16;
  void *v17;
  id v18;

  v6 = *(_QWORD *)&a3;
  v18 = a4;
  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v8;
  if (self->_sfSession)
  {
    v10 = _Block_copy(v8);
    if (v10)
      v11 = v10;
    else
      v11 = &__block_literal_global_24;
    if (v18)
      v12 = (id)objc_msgSend(v18, "mutableCopy");
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("sa"));

    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
    {
      if (v6 > 0xA)
        v15 = "?";
      else
        v15 = off_1E4830880[(int)v6];
      v16 = v15;
      v17 = v13;
      LogPrintF();
    }
    -[SFSession sendRequestID:options:request:responseHandler:](self->_sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_sa"), 0, v13, v11, v16, v17);

    goto LABEL_19;
  }
  if (v8)
  {
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, _QWORD))v9)[2](v9, v11, 0, 0);
LABEL_19:

  }
}

- (void)_sfServiceStart
{
  SFService *v3;
  SFService *sfService;
  uint64_t v5;
  SFService *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  -[SFService setAdvertiseRate:](self->_sfService, "setAdvertiseRate:", 50);
  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 30);
  -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setIdentifier:](self->_sfService, "setIdentifier:", CFSTR("com.apple.sharing.AppleTVSetup"));
  -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("TVColorCalibration"));
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  -[SFService setPinType:](self->_sfService, "setPinType:", 1);
  -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 33);
  location = 0;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SFDeviceSetupTVColorCalibratorService__sfServiceStart__block_invoke;
  v11[3] = &unk_1E482F550;
  objc_copyWeak(&v12, &location);
  -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v11);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __56__SFDeviceSetupTVColorCalibratorService__sfServiceStart__block_invoke_2;
  v9[3] = &unk_1E482F578;
  objc_copyWeak(&v10, &location);
  -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v9);
  v6 = self->_sfService;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __56__SFDeviceSetupTVColorCalibratorService__sfServiceStart__block_invoke_3;
  v7[3] = &unk_1E482E280;
  objc_copyWeak(&v8, &location);
  -[SFService activateWithCompletion:](v6, "activateWithCompletion:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __56__SFDeviceSetupTVColorCalibratorService__sfServiceStart__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSessionStarted:", v3);

}

void __56__SFDeviceSetupTVColorCalibratorService__sfServiceStart__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleSessionEnded:", v3);

}

void __56__SFDeviceSetupTVColorCalibratorService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 90
      && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = CFSTR("eo");
    v7[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_reportProgress:info:", 30, v5);

  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession *sfSession;
  SFSession **p_sfSession;
  SFSession *v8;
  uint64_t v9;
  SFSession *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  v5 = a3;
  p_sfSession = &self->_sfSession;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 60)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorService == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_7;
        sfSession = *p_sfSession;
      }
      -[SFSession peer](sfSession, "peer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "peer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 0);
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0);
    location = 0;
    objc_initWeak(&location, self);
    v8 = self->_sfSession;
    v9 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__SFDeviceSetupTVColorCalibratorService__handleSessionStarted___block_invoke;
    v16[3] = &unk_1E4830860;
    objc_copyWeak(&v17, &location);
    -[SFSession registerRequestID:options:handler:](v8, "registerRequestID:options:handler:", CFSTR("_tvlS"), &unk_1E48911B0, v16);
    v10 = *p_sfSession;
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __63__SFDeviceSetupTVColorCalibratorService__handleSessionStarted___block_invoke_2;
    v14[3] = &unk_1E4830860;
    objc_copyWeak(&v15, &location);
    -[SFSession registerRequestID:options:handler:](v10, "registerRequestID:options:handler:", CFSTR("_finish"), &unk_1E48911D8, v14);
    -[SFDeviceSetupTVColorCalibratorService _reportProgress:info:](self, "_reportProgress:info:", 31, 0);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
LABEL_7:

}

void __63__SFDeviceSetupTVColorCalibratorService__handleSessionStarted___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleTVLatencyRequest:responseHandler:", v7, v6);

}

void __63__SFDeviceSetupTVColorCalibratorService__handleSessionStarted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handleFinishRequest:responseHandler:", v7, v6);

}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  TVLDisplayColorCalibrator *tvColorCalibrator;
  SFSession *v6;
  void *v7;
  SFSession *v8;

  sfSession = (SFSession *)a3;
  if (self->_sfSession != sfSession)
    goto LABEL_2;
  v8 = sfSession;
  if (sfSession && gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30)
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_8;
      sfSession = self->_sfSession;
    }
    -[SFSession peer](sfSession, "peer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_8:
  -[SFDeviceSetupTVColorCalibratorService _reportProgress:info:](self, "_reportProgress:info:", 32, 0, v7);
  -[TVLDisplayColorCalibrator invalidate](self->_tvColorCalibrator, "invalidate");
  tvColorCalibrator = self->_tvColorCalibrator;
  self->_tvColorCalibrator = 0;

  v6 = self->_sfSession;
  self->_sfSession = 0;

  if (!self->_finished)
  {
    -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 30);
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  }
  sfSession = v8;
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFDeviceSetupTVColorCalibratorService _invalidate](self, "_invalidate");
    sfSession = v8;
  }
LABEL_2:

}

- (void)_handleTVLatencyRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_tvColorCalibrator)
    goto LABEL_15;
  -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)getTVLDisplayColorCalibratorClass_0[0]()), "initWithMessageSession:", v9);
    objc_storeStrong((id *)&self->_tvColorCalibrator, v11);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __81__SFDeviceSetupTVColorCalibratorService__handleTVLatencyRequest_responseHandler___block_invoke;
    v13[3] = &unk_1E482E370;
    v13[4] = self;
    v14 = v11;
    v12 = v11;
    objc_msgSend(v12, "setProgressEventHandler:", v13);
    objc_msgSend(v12, "activate");
    -[SFDeviceSetupTVColorCalibratorService _reportProgress:info:](self, "_reportProgress:info:", 278, v6);

LABEL_15:
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, MEMORY[0x1E0C9AA70]);
    goto LABEL_20;
  }
  NSErrorWithOSStatusF();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 90
    && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v10, 0, 0);

LABEL_20:
}

void __81__SFDeviceSetupTVColorCalibratorService__handleTVLatencyRequest_responseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__SFDeviceSetupTVColorCalibratorService__handleTVLatencyRequest_responseHandler___block_invoke_2;
  v11[3] = &unk_1E482E348;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v14 = v5;
  v15 = a2;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __81__SFDeviceSetupTVColorCalibratorService__handleTVLatencyRequest_responseHandler___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 32))
    return objc_msgSend(*(id *)(result + 40), "_handleTVColorCalibratorProgressEvent:info:", *(_QWORD *)(result + 56), *(_QWORD *)(result + 48));
  return result;
}

- (void)_handleTVColorCalibratorProgressEvent:(unint64_t)a3 info:(id)a4
{
  id v6;
  int v7;
  SFDeviceSetupTVColorCalibratorService *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a4;
  v12 = v6;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30)
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || (v7 = _LogCategory_Initialize(), v6 = v12, v7))
    {
      v10 = a3;
      v11 = v6;
      LogPrintF();
      v6 = v12;
    }
  }
  switch(a3)
  {
    case 0uLL:
      v8 = self;
      v9 = 278;
      goto LABEL_12;
    case 1uLL:
      v8 = self;
      v9 = 279;
      goto LABEL_12;
    case 2uLL:
      v8 = self;
      v9 = 280;
      goto LABEL_12;
    case 3uLL:
      if (!self->_eventFinalDelivered)
      {
        -[SFDeviceSetupTVColorCalibratorService _reportProgress:info:](self, "_reportProgress:info:", 282, v12);
        v6 = v12;
        self->_eventFinalDelivered = 1;
      }
      break;
    case 4uLL:
      v8 = self;
      v9 = 281;
LABEL_12:
      -[SFDeviceSetupTVColorCalibratorService _reportProgress:info:](v8, "_reportProgress:info:", v9, v12, v10, v11);
      v6 = v12;
      break;
    default:
      break;
  }

}

- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_eventFinalDelivered)
  {
    -[SFDeviceSetupTVColorCalibratorService _reportProgress:info:](self, "_reportProgress:info:", 282, MEMORY[0x1E0C9AA70]);
    self->_eventFinalDelivered = 1;
  }
  if (gLogCategory_SFDeviceSetupTVColorCalibratorService <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, MEMORY[0x1E0C9AA70]);
  self->_finished = 1;

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_tvColorCalibrator, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
}

@end
