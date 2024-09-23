@implementation SFDeviceSetupTVLatencyService

- (SFDeviceSetupTVLatencyService)init
{
  SFDeviceSetupTVLatencyService *v2;
  SFDeviceSetupTVLatencyService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  SFDeviceSetupTVLatencyService *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFDeviceSetupTVLatencyService;
  v2 = -[SFDeviceSetupTVLatencyService init](&v8, sel_init);
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
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SFDeviceSetupTVLatencyService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFDeviceSetupTVLatencyService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
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
  block[2] = __43__SFDeviceSetupTVLatencyService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SFDeviceSetupTVLatencyService_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 10))
  {
    v1 = result;
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
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
    -[SFDeviceSetupTVLatencyService _handleSessionEnded:](self, "_handleSessionEnded:", self->_sfSession);
    -[SFService invalidate](self->_sfService, "invalidate");
    sfService = self->_sfService;
    self->_sfService = 0;

    -[SFDeviceSetupTVLatencyService _reportProgress:info:](self, "_reportProgress:info:", 20, 0);
    progressHandler = self->_progressHandler;
    self->_progressHandler = 0;

    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
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
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
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
      v11 = &__block_literal_global_55;
    if (v18)
      v12 = (id)objc_msgSend(v18, "mutableCopy");
    else
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("sa"));

    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      if (v6 > 0xA)
        v15 = "?";
      else
        v15 = off_1E4833778[(int)v6];
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
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  -[SFService setAdvertiseRate:](self->_sfService, "setAdvertiseRate:", 50);
  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 25);
  -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setIdentifier:](self->_sfService, "setIdentifier:", CFSTR("com.apple.sharing.AppleTVSetup"));
  -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("TVLatency"));
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  -[SFService setPinType:](self->_sfService, "setPinType:", 1);
  -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 33);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke;
  v9[3] = &unk_1E482FA30;
  v9[4] = self;
  -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke_2;
  v8[3] = &unk_1E482FA58;
  v8[4] = self;
  -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v8);
  v6 = self->_sfService;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke_3;
  v7[3] = &unk_1E482DFF0;
  v7[4] = self;
  -[SFService activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

uint64_t __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStarted:", a2);
}

uint64_t __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEnded:", a2);
}

void __48__SFDeviceSetupTVLatencyService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 90
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      v6 = v3;
      LogPrintF();
    }
    v4 = *(void **)(a1 + 32);
    v7 = CFSTR("eo");
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_reportProgress:info:", 30, v5);

  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession *sfSession;
  uint64_t v7;
  SFSession *v8;
  SFSession *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 60)
    {
      if (gLogCategory_SFDeviceSetupTVLatencyService == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_7;
        sfSession = self->_sfSession;
      }
      -[SFSession peer](sfSession, "peer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "peer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 0);
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0);
    v7 = MEMORY[0x1E0C809B0];
    v8 = self->_sfSession;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__SFDeviceSetupTVLatencyService__handleSessionStarted___block_invoke;
    v14[3] = &unk_1E482E2D0;
    v14[4] = self;
    -[SFSession registerRequestID:options:handler:](v8, "registerRequestID:options:handler:", CFSTR("_tvlS"), &unk_1E48914F8, v14);
    v9 = self->_sfSession;
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __55__SFDeviceSetupTVLatencyService__handleSessionStarted___block_invoke_2;
    v13[3] = &unk_1E482E2D0;
    v13[4] = self;
    -[SFSession registerRequestID:options:handler:](v9, "registerRequestID:options:handler:", CFSTR("_finish"), &unk_1E4891520, v13);
    -[SFDeviceSetupTVLatencyService _reportProgress:info:](self, "_reportProgress:info:", 31, 0);
  }
LABEL_7:

}

uint64_t __55__SFDeviceSetupTVLatencyService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTVLatencyRequest:responseHandler:");
}

uint64_t __55__SFDeviceSetupTVLatencyService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  TVLAudioLatencyEstimator *tvLatencyEstimator;
  SFSession *v6;
  void *v7;
  SFSession *v8;

  sfSession = (SFSession *)a3;
  if (self->_sfSession != sfSession)
    goto LABEL_2;
  v8 = sfSession;
  if (sfSession && gLogCategory_SFDeviceSetupTVLatencyService <= 30)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService == -1)
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
  -[SFDeviceSetupTVLatencyService _reportProgress:info:](self, "_reportProgress:info:", 32, 0, v7);
  -[TVLAudioLatencyEstimator invalidate](self->_tvLatencyEstimator, "invalidate");
  tvLatencyEstimator = self->_tvLatencyEstimator;
  self->_tvLatencyEstimator = 0;

  v6 = self->_sfSession;
  self->_sfSession = 0;

  if (!self->_finished)
  {
    -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 25);
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  }
  sfSession = v8;
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFDeviceSetupTVLatencyService _invalidate](self, "_invalidate");
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
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_tvLatencyEstimator)
    goto LABEL_15;
  -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = (void *)objc_msgSend(objc_alloc((Class)getTVLAudioLatencyEstimatorClass_1[0]()), "initWithMessageSession:", v9);
    objc_storeStrong((id *)&self->_tvLatencyEstimator, v11);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__SFDeviceSetupTVLatencyService__handleTVLatencyRequest_responseHandler___block_invoke;
    v13[3] = &unk_1E482E370;
    v13[4] = self;
    v14 = v11;
    v12 = v11;
    objc_msgSend(v12, "setProgressEventHandler:", v13);
    objc_msgSend(v12, "activate");
    -[SFDeviceSetupTVLatencyService _reportProgress:info:](self, "_reportProgress:info:", 260, v6);

LABEL_15:
    if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
      && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, MEMORY[0x1E0C9AA70]);
    goto LABEL_20;
  }
  NSErrorWithOSStatusF();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 90
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v10, 0, 0);

LABEL_20:
}

void __73__SFDeviceSetupTVLatencyService__handleTVLatencyRequest_responseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  v11[2] = __73__SFDeviceSetupTVLatencyService__handleTVLatencyRequest_responseHandler___block_invoke_2;
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

uint64_t __73__SFDeviceSetupTVLatencyService__handleTVLatencyRequest_responseHandler___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 32))
    return objc_msgSend(*(id *)(result + 40), "_handleTVLatencyProgressEvent:info:", *(_QWORD *)(result + 56), *(_QWORD *)(result + 48));
  return result;
}

- (void)_handleTVLatencyProgressEvent:(unint64_t)a3 info:(id)a4
{
  id v6;
  int v7;
  SFDeviceSetupTVLatencyService *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a4;
  v12 = v6;
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30)
  {
    if (gLogCategory_SFDeviceSetupTVLatencyService != -1 || (v7 = _LogCategory_Initialize(), v6 = v12, v7))
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
      v9 = 270;
      goto LABEL_12;
    case 1uLL:
      v8 = self;
      v9 = 277;
      goto LABEL_12;
    case 2uLL:
      v8 = self;
      v9 = 274;
      goto LABEL_12;
    case 3uLL:
      if (!self->_eventFinalDelivered)
      {
        -[SFDeviceSetupTVLatencyService _reportProgress:info:](self, "_reportProgress:info:", 272, v12);
        v6 = v12;
        self->_eventFinalDelivered = 1;
      }
      break;
    case 4uLL:
      v8 = self;
      v9 = 276;
LABEL_12:
      -[SFDeviceSetupTVLatencyService _reportProgress:info:](v8, "_reportProgress:info:", v9, v12, v10, v11);
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
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_eventFinalDelivered)
  {
    -[SFDeviceSetupTVLatencyService _reportProgress:info:](self, "_reportProgress:info:", 272, MEMORY[0x1E0C9AA70]);
    self->_eventFinalDelivered = 1;
  }
  if (gLogCategory_SFDeviceSetupTVLatencyService <= 30
    && (gLogCategory_SFDeviceSetupTVLatencyService != -1 || _LogCategory_Initialize()))
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
  objc_storeStrong((id *)&self->_tvLatencyEstimator, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
}

@end
