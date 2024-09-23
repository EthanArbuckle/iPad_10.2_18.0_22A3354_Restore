@implementation SFSiriClient

- (SFSiriClient)init
{
  SFSiriClient *v2;
  SFSiriClient *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSiriClient;
  v2 = -[SFSiriClient init](&v7, sel_init);
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
  block[2] = __24__SFSiriClient_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __24__SFSiriClient_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  SVXClientServiceManager *siriServiceManager;
  SVXClientServiceManager *v4;
  SVXClientServiceManager *v5;
  id v6;

  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (self->_siriDialogHandler)
  {
    siriServiceManager = self->_siriServiceManager;
    if (!siriServiceManager)
    {
      v4 = (SVXClientServiceManager *)objc_alloc_init((Class)getSVXClientServiceManagerClass[0]());
      v5 = self->_siriServiceManager;
      self->_siriServiceManager = v4;

      siriServiceManager = self->_siriServiceManager;
    }
    -[SVXClientServiceManager sessionService](siriServiceManager, "sessionService");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDelegate:", self);

  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SFSiriClient_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SFSiriClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)invalidateWithFlags:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  unsigned int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__SFSiriClient_invalidateWithFlags___block_invoke;
  v4[3] = &unk_1E4830D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __36__SFSiriClient_invalidateWithFlags___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    *(_DWORD *)(v2 + 12) = *(_DWORD *)(a1 + 40);
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend((id)v2, "_invalidate");
}

- (void)_invalidate
{
  OS_dispatch_source *currentTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  id v6;
  id siriDialogHandler;
  void *v8;
  SVXClientServiceManager *siriServiceManager;
  void (**invalidationHandler)(void);
  id v11;
  SFSiriRequest *currentRequest;
  VSSpeechSynthesizer *speechSynthesizer;
  char v14;
  id v15;
  id v16;

  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_invalidateCalled = 1;
  currentTimer = self->_currentTimer;
  if (currentTimer)
  {
    v4 = currentTimer;
    dispatch_source_cancel(v4);
    v5 = self->_currentTimer;
    self->_currentTimer = 0;

    NSErrorWithOSStatusF();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", self->_currentRequest, v6);
LABEL_7:
    -[SFSiriClient _completeAllRequestsWithError:](self, "_completeAllRequestsWithError:", v6);
LABEL_8:

    goto LABEL_9;
  }
  if (!-[SFSiriRequest synthesizing](self->_currentRequest, "synthesizing"))
  {
    currentRequest = self->_currentRequest;
    if ((self->_invalidateFlags & 0x20) == 0)
    {
      if (currentRequest)
      {
        if (gLogCategory_SFSiriClient <= 30
          && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        speechSynthesizer = self->_speechSynthesizer;
        v16 = 0;
        v14 = -[VSSpeechSynthesizer stopSpeakingAtNextBoundary:synchronously:error:](speechSynthesizer, "stopSpeakingAtNextBoundary:synchronously:error:", 1, 0, &v16);
        v6 = v16;
        if ((v14 & 1) == 0
          && gLogCategory_SFSiriClient <= 60
          && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
        {
          v15 = v6;
          LogPrintF();
        }
        goto LABEL_8;
      }
      goto LABEL_23;
    }
    if (!currentRequest)
    {
LABEL_23:
      NSErrorWithOSStatusF();
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
LABEL_9:
  -[SFSiriClient _deviceSetupEnd](self, "_deviceSetupEnd", v15);
  siriDialogHandler = self->_siriDialogHandler;
  self->_siriDialogHandler = 0;

  -[SVXClientServiceManager sessionService](self->_siriServiceManager, "sessionService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", 0);

  siriServiceManager = self->_siriServiceManager;
  self->_siriServiceManager = 0;

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    v11 = self->_invalidationHandler;
  }
  else
  {
    v11 = 0;
  }
  self->_invalidationHandler = 0;

}

- (void)preWarmDeviceSetupWelcomePhaseWithCompletion:(id)a3
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
  v7[2] = __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    v2 = objc_alloc_init((Class)getSVXClientServiceManagerClass[0]());
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = v2;

  }
  v5 = objc_alloc((Class)getSVXSystemEventClass[0]());
  v6 = (void *)objc_msgSend(v5, "initWithType:timestamp:", 1, mach_absolute_time());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "activationService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke_2;
  v9[3] = &unk_1E482E0F0;
  v8 = *(id *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v7, "prewarmForSystemEvent:completion:", v6, v9);

}

void __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke_3;
    block[3] = &unk_1E482DCC0;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __61__SFSiriClient_preWarmDeviceSetupWelcomePhaseWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)speakDeviceSetupWelcomePhaseWithCompletion:(id)a3
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
  v7[2] = __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    v2 = objc_alloc_init((Class)getSVXClientServiceManagerClass[0]());
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 88);
    *(_QWORD *)(v3 + 88) = v2;

  }
  v5 = objc_alloc((Class)getSVXSystemEventClass[0]());
  v6 = (void *)objc_msgSend(v5, "initWithType:timestamp:", 1, mach_absolute_time());
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "activationService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke_2;
  v9[3] = &unk_1E482FB00;
  v8 = *(id *)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v7, "activateWithSystemEvent:userInfo:completion:", v6, 0, v9);

}

void __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;

  v3 = a2;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke_3;
    block[3] = &unk_1E482E0F0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

uint64_t __59__SFSiriClient_speakDeviceSetupWelcomePhaseWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)speakPasscode:(id)a3 instructions:(id)a4 languageCode:(id)a5 voiceName:(id)a6 flags:(unsigned int)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *dispatchQueue;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  unsigned int v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SFSiriClient_speakPasscode_instructions_languageCode_voiceName_flags_completion___block_invoke;
  block[3] = &unk_1E48345B8;
  block[4] = self;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v31 = a7;
  v29 = v17;
  v30 = v18;
  v20 = v18;
  v21 = v17;
  v22 = v16;
  v23 = v15;
  v24 = v14;
  dispatch_async(dispatchQueue, block);

}

uint64_t __83__SFSiriClient_speakPasscode_instructions_languageCode_voiceName_flags_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speakPasscode:instructions:languageCode:voiceName:flags:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 72));
}

- (void)_speakPasscode:(id)a3 instructions:(id)a4 languageCode:(id)a5 voiceName:(id)a6 flags:(unsigned int)a7 completion:(id)a8
{
  id v13;
  id v14;
  int v15;
  const __CFString *v16;
  VSSpeechSynthesizer *v17;
  VSSpeechSynthesizer *speechSynthesizer;
  VSSpeechSynthesizer *v19;
  char v20;
  __CFString *v21;
  NSString *v22;
  NSString *v23;
  NSString *languageCode;
  NSString *v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableArray *v28;
  NSMutableArray *requests;
  __objc2_class **p_superclass;
  id v31;
  SFSiriRequest *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  __objc2_class **v39;
  id v40;
  void *v41;
  SFSiriRequest *v42;
  SFSiriRequest *v43;
  double v44;
  void *v45;
  const __CFString *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  NSString *v51;
  void *v52;
  id v53;
  __CFString *v54;
  uint64_t v55;
  id v56;
  id v57;

  v55 = *(_QWORD *)&a7;
  v54 = (__CFString *)a3;
  v13 = a4;
  v14 = a5;
  v53 = a6;
  v56 = a8;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    v15 = IsAppleInternalBuild();
    v16 = CFSTR("*");
    if (v15)
      v16 = v54;
    v49 = v55;
    v50 = &unk_1A2AF9288;
    v47 = v13;
    v48 = v14;
    v46 = v16;
    LogPrintF();
  }
  if (!self->_speechSynthesizer)
  {
    v17 = (VSSpeechSynthesizer *)objc_alloc_init((Class)getVSSpeechSynthesizerClass[0]());
    speechSynthesizer = self->_speechSynthesizer;
    self->_speechSynthesizer = v17;

    -[VSSpeechSynthesizer setDelegate:](self->_speechSynthesizer, "setDelegate:", self);
  }
  if ((v55 & 0x10) == 0 && self->_currentRequest)
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v19 = self->_speechSynthesizer;
    v57 = 0;
    v20 = -[VSSpeechSynthesizer stopSpeakingAtNextBoundary:synchronously:error:](v19, "stopSpeakingAtNextBoundary:synchronously:error:", 1, 0, &v57, v46, v47, v48, v49, v50);
    v21 = (__CFString *)v57;
    if ((v20 & 1) == 0
      && gLogCategory_SFSiriClient <= 60
      && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      v46 = v21;
      LogPrintF();
    }

  }
  v22 = (NSString *)v14;
  v51 = v22;
  if (!v22)
  {
    v22 = self->_languageCode;
    if (!v22)
    {
      softLinkVSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences[0]();
      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      languageCode = self->_languageCode;
      self->_languageCode = v23;

      v25 = self->_languageCode;
      if (!v25)
      {
        self->_languageCode = (NSString *)CFSTR("en-US");

        v25 = self->_languageCode;
      }
      v22 = v25;
    }
  }
  v26 = 1;
  if ((v55 & 0x80) == 0)
    v26 = 2;
  if ((~(_DWORD)v55 & 0xC0) != 0)
    v27 = v26;
  else
    v27 = 3;
  if (!self->_requests)
  {
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requests = self->_requests;
    self->_requests = v28;

  }
  p_superclass = &OBJC_METACLASS____TtC7Sharing30AskToAirDropReceiverController.superclass;
  if (v13)
  {
    v31 = objc_alloc_init((Class)getVSSpeechRequestClass[0]());
    objc_msgSend(v31, "setLanguageCode:", v22);
    objc_msgSend(v31, "setGender:", v27);
    objc_msgSend(v31, "setText:", v13);
    objc_msgSend(v31, "setContextInfo:", MEMORY[0x1E0C9AA70]);
    objc_msgSend(v31, "setVoiceName:", v53);
    v32 = objc_alloc_init(SFSiriRequest);
    -[SFSiriRequest setFlags:](v32, "setFlags:", v55);
    -[SFSiriRequest setOwner:](v32, "setOwner:", self);
    -[SFSiriRequest setSpeechCompletion:](v32, "setSpeechCompletion:", v56);
    -[SFSiriRequest setSpeechSynthesisRequest:](v32, "setSpeechSynthesisRequest:", v31);
    v33 = (void *)objc_msgSend(v31, "copy");
    -[SFSiriRequest setSpeechUtteranceRequest:](v32, "setSpeechUtteranceRequest:", v33);

    -[NSMutableArray addObject:](self->_requests, "addObject:", v32);
  }
  v52 = v13;
  v34 = -[__CFString length](v54, "length", v46);
  if (v34)
  {
    v35 = v34;
    v36 = 0;
    if (v13)
      v37 = 0.5;
    else
      v37 = 0.0;
    v38 = v34 - 1;
    do
    {
      v39 = p_superclass;
      v40 = objc_alloc_init(((Class (__cdecl *)())p_superclass[168])());
      objc_msgSend(v40, "setLanguageCode:", v22);
      objc_msgSend(v40, "setGender:", v27);
      -[__CFString substringWithRange:](v54, "substringWithRange:", v36, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setText:", v41);

      objc_msgSend(v40, "setContextInfo:", MEMORY[0x1E0C9AA70]);
      objc_msgSend(v40, "setVoiceName:", v53);
      v42 = objc_alloc_init(SFSiriRequest);
      v43 = v42;
      if (v36)
        v44 = 0.2;
      else
        v44 = v37;
      -[SFSiriRequest setDelaySecs:](v42, "setDelaySecs:", v44);
      -[SFSiriRequest setFlags:](v43, "setFlags:", v55);
      -[SFSiriRequest setOwner:](v43, "setOwner:", self);
      -[SFSiriRequest setSpeechSynthesisRequest:](v43, "setSpeechSynthesisRequest:", v40);
      v45 = (void *)objc_msgSend(v40, "copy");
      -[SFSiriRequest setSpeechUtteranceRequest:](v43, "setSpeechUtteranceRequest:", v45);

      if (v56 && v38 == v36)
        -[SFSiriRequest setSpeechCompletion:](v43, "setSpeechCompletion:", v56);
      -[NSMutableArray addObject:](self->_requests, "addObject:", v43);

      ++v36;
      p_superclass = v39;
    }
    while (v35 != v36);
  }
  -[SFSiriClient _processQueuedRequests](self, "_processQueuedRequests");

}

- (void)speakText:(id)a3 completion:(id)a4
{
  -[SFSiriClient speakText:rate:completion:](self, "speakText:rate:completion:", a3, a4, 1.0);
}

- (void)speakText:(id)a3 rate:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  double v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__SFSiriClient_speakText_rate_completion___block_invoke;
  v13[3] = &unk_1E48345E0;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __42__SFSiriClient_speakText_rate_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speakText:languageCode:flags:rate:delay:startHandler:completion:", *(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), 0.0);
}

- (void)speakText:(id)a3 languageCode:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__SFSiriClient_speakText_languageCode_completion___block_invoke;
  v15[3] = &unk_1E482E508;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __50__SFSiriClient_speakText_languageCode_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speakText:languageCode:flags:rate:delay:startHandler:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, *(_QWORD *)(a1 + 56), 1.0, 0.0);
}

- (void)speakText:(id)a3 flags:(unsigned int)a4 rate:(double)a5 delay:(double)a6 startHandler:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *dispatchQueue;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  double v25;
  double v26;
  unsigned int v27;

  v14 = a3;
  v15 = a7;
  v16 = a8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__SFSiriClient_speakText_flags_rate_delay_startHandler_completion___block_invoke;
  block[3] = &unk_1E4834608;
  block[4] = self;
  v22 = v14;
  v27 = a4;
  v25 = a5;
  v26 = a6;
  v23 = v15;
  v24 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  dispatch_async(dispatchQueue, block);

}

uint64_t __67__SFSiriClient_speakText_flags_rate_delay_startHandler_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speakText:languageCode:flags:rate:delay:startHandler:completion:", *(_QWORD *)(a1 + 40), 0, *(unsigned int *)(a1 + 80), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)_speakText:(id)a3 languageCode:(id)a4 flags:(unsigned int)a5 rate:(double)a6 delay:(double)a7 startHandler:(id)a8 completion:(id)a9
{
  uint64_t v13;
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  int v20;
  const __CFString *v21;
  VSSpeechSynthesizer *v22;
  VSSpeechSynthesizer *speechSynthesizer;
  VSSpeechSynthesizer *v24;
  char v25;
  __CFString *v26;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  NSString *languageCode;
  NSString *v31;
  id v32;
  SFSiriRequest *v33;
  void *v34;
  NSMutableArray *requests;
  NSMutableArray *v36;
  NSMutableArray *v37;
  const __CFString *v38;
  id v39;
  double v40;
  double v41;
  id v42;

  v13 = *(_QWORD *)&a5;
  v16 = (__CFString *)a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    v20 = IsAppleInternalBuild();
    v21 = CFSTR("*");
    if (v20)
      v21 = v16;
    v40 = a6;
    v41 = a7;
    v38 = v21;
    v39 = v17;
    LogPrintF();
  }
  if (self->_speechSynthesizer)
  {
    if ((v13 & 0x10) != 0)
      goto LABEL_22;
  }
  else
  {
    v22 = (VSSpeechSynthesizer *)objc_alloc_init((Class)getVSSpeechSynthesizerClass[0]());
    speechSynthesizer = self->_speechSynthesizer;
    self->_speechSynthesizer = v22;

    -[VSSpeechSynthesizer setDelegate:](self->_speechSynthesizer, "setDelegate:", self);
    if ((v13 & 0x10) != 0)
      goto LABEL_22;
  }
  if (self->_currentRequest)
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v24 = self->_speechSynthesizer;
    v42 = 0;
    v25 = -[VSSpeechSynthesizer stopSpeakingAtNextBoundary:synchronously:error:](v24, "stopSpeakingAtNextBoundary:synchronously:error:", 1, 0, &v42, v38, v39, *(_QWORD *)&v40, *(_QWORD *)&v41);
    v26 = (__CFString *)v42;
    if ((v25 & 1) == 0
      && gLogCategory_SFSiriClient <= 60
      && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      v38 = v26;
      LogPrintF();
    }

  }
LABEL_22:
  v27 = (NSString *)v17;
  v28 = v27;
  if (!v27)
  {
    v28 = self->_languageCode;
    if (!v28)
    {
      softLinkVSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences[0]();
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      languageCode = self->_languageCode;
      self->_languageCode = v29;

      v31 = self->_languageCode;
      if (!v31)
      {
        self->_languageCode = (NSString *)CFSTR("en-US");

        v31 = self->_languageCode;
      }
      v28 = v31;
    }
  }
  v32 = objc_alloc_init((Class)getVSSpeechRequestClass[0]());
  objc_msgSend(v32, "setLanguageCode:", v28);
  objc_msgSend(v32, "setRate:", a6);
  objc_msgSend(v32, "setText:", v16);
  objc_msgSend(v32, "setContextInfo:", MEMORY[0x1E0C9AA70]);
  v33 = objc_alloc_init(SFSiriRequest);
  -[SFSiriRequest setDelaySecs:](v33, "setDelaySecs:", a7);
  -[SFSiriRequest setFlags:](v33, "setFlags:", v13);
  -[SFSiriRequest setOwner:](v33, "setOwner:", self);
  -[SFSiriRequest setSpeechCompletion:](v33, "setSpeechCompletion:", v19);
  -[SFSiriRequest setSpeechSynthesisRequest:](v33, "setSpeechSynthesisRequest:", v32);
  v34 = (void *)objc_msgSend(v32, "copy");
  -[SFSiriRequest setSpeechUtteranceRequest:](v33, "setSpeechUtteranceRequest:", v34);

  -[SFSiriRequest setSpeechStartHandler:](v33, "setSpeechStartHandler:", v18);
  requests = self->_requests;
  if (!requests)
  {
    v36 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = self->_requests;
    self->_requests = v36;

    requests = self->_requests;
  }
  -[NSMutableArray addObject:](requests, "addObject:", v33, v38);
  -[SFSiriClient _processQueuedRequests](self, "_processQueuedRequests");

}

- (void)stopSpeaking
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SFSiriClient_stopSpeaking__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__SFSiriClient_stopSpeaking__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v5 = 0;
    v3 = objc_msgSend(v2, "stopSpeakingAtNextBoundary:synchronously:error:", 1, 0, &v5);
    v4 = v5;
    if ((v3 & 1) == 0
      && gLogCategory_SFSiriClient <= 60
      && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_processQueuedRequests
{
  __CFString *v2;
  id *p_currentRequest;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  p_currentRequest = (id *)&self->_currentRequest;
  do
  {
    if (*p_currentRequest)
      break;
    -[NSMutableArray firstObject](self->_requests, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!v5)
      break;
    v6 = (void *)v5;
    -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0);
    objc_msgSend(v6, "speechSynthesisRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "speechUtteranceRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      v9 = IsAppleInternalBuild();
      if (v9)
      {
        objc_msgSend(v7, "text");
        v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v10 = v2;
      }
      else
      {
        v10 = CFSTR("*");
      }
      objc_msgSend(v7, "rate", v16, v18);
      v12 = v11;
      objc_msgSend(v6, "delaySecs");
      v18 = v12;
      v19 = v13;
      v16 = v10;
      LogPrintF();
      if (v9)

    }
    objc_msgSend(v6, "setStartTicks:", mach_absolute_time());
    objc_msgSend(v6, "delaySecs");
    if (v14 <= 0.0)
    {
      -[VSSpeechSynthesizer startSpeakingRequest:](self->_speechSynthesizer, "startSpeakingRequest:", v8);
    }
    else
    {
      objc_msgSend(v6, "setSynthesizing:", 1);
      -[VSSpeechSynthesizer startSynthesizingRequest:](self->_speechSynthesizer, "startSynthesizingRequest:", v7);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (gLogCategory_SFSiriClient > 60 || gLogCategory_SFSiriClient == -1 && !_LogCategory_Initialize())
        goto LABEL_25;
      if (!IsAppleInternalBuild())
      {
        v16 = CFSTR("*");
        v18 = v15;
        LogPrintF();
LABEL_25:
        -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v6, v15, v16, v18, v19);
        goto LABEL_26;
      }
      objc_msgSend(v7, "text");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v6, v15, v17, v15, v19);
    }
    else
    {
      objc_storeStrong(p_currentRequest, v6);
    }
LABEL_26:

  }
  while (v15);
}

- (void)_completeAllRequestsWithError:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_requests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSMutableArray removeAllObjects](self->_requests, "removeAllObjects");
}

- (void)_completeRequest:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  SFSiriRequest *v11;

  v11 = (SFSiriRequest *)a3;
  v6 = a4;
  if (self->_currentRequest == v11)
  {
    self->_currentRequest = 0;

  }
  -[SFSiriRequest speechStartHandler](v11, "speechStartHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SFSiriRequest speechStartHandler](v11, "speechStartHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v6);

    -[SFSiriRequest setSpeechStartHandler:](v11, "setSpeechStartHandler:", 0);
  }
  -[SFSiriRequest speechCompletion](v11, "speechCompletion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SFSiriRequest speechCompletion](v11, "speechCompletion");
    v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v10)[2](v10, v6);

    -[SFSiriRequest setSpeechCompletion:](v11, "setSpeechCompletion:", 0);
  }

}

- (void)startDelayedRequest:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "speechUtteranceRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SFSiriClient > 30 || gLogCategory_SFSiriClient == -1 && !_LogCategory_Initialize())
  {
    if (v4)
      goto LABEL_8;
LABEL_13:
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    NSErrorWithOSStatusF();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  if (IsAppleInternalBuild())
  {
    objc_msgSend(v4, "text");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

    if (v4)
      goto LABEL_8;
    goto LABEL_13;
  }
  v6 = CFSTR("*");
  LogPrintF();
  if (!v4)
    goto LABEL_13;
LABEL_8:
  -[VSSpeechSynthesizer startSpeakingRequest:](self->_speechSynthesizer, "startSpeakingRequest:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v7, v5, v5);
      goto LABEL_21;
    }
LABEL_20:
    -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v7, v5, v6);
  }
LABEL_21:

}

- (void)deviceSetupBegin:(unint64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SFSiriClient_deviceSetupBegin___block_invoke;
  v4[3] = &unk_1E482E018;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __33__SFSiriClient_deviceSetupBegin___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[7])
  {
    v3 = (*(_QWORD *)(a1 + 40) >> 3) & 1;
    v4 = objc_alloc((Class)getSVXDeviceSetupContextClass[0]());
    v5 = objc_msgSend(v4, "initWithTimestamp:presentsAlternativeFlowWhenStoreAccountIsUnavailable:", mach_absolute_time(), v3);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (!v2[8])
  {
    v8 = objc_alloc_init((Class)getSVXClientServiceManagerClass[0]());
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 64);
    *(_QWORD *)(v9 + 64) = v8;

    v2 = *(_QWORD **)(a1 + 32);
  }
  if (!v2[9])
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = &unk_1A2AF92DE;
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "deviceService", v14, v15);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 72);
    *(_QWORD *)(v12 + 72) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "beginSetupWithContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  }
}

- (void)deviceSetupEnd
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SFSiriClient_deviceSetupEnd__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__SFSiriClient_deviceSetupEnd__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceSetupEnd");
}

- (void)_deviceSetupEnd
{
  SVXClientDeviceServicing *siriDeviceSetupService;
  SVXDeviceSetupContext *siriDeviceSetupContext;
  SVXClientServiceManager *siriDeviceSetupManager;

  if (self->_siriDeviceSetupService
    && gLogCategory_SFSiriClient <= 30
    && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SVXClientDeviceServicing endSetup](self->_siriDeviceSetupService, "endSetup");
  siriDeviceSetupService = self->_siriDeviceSetupService;
  self->_siriDeviceSetupService = 0;

  siriDeviceSetupContext = self->_siriDeviceSetupContext;
  self->_siriDeviceSetupContext = 0;

  siriDeviceSetupManager = self->_siriDeviceSetupManager;
  self->_siriDeviceSetupManager = 0;

}

- (void)deviceSetupPrepareGreeting:(id)a3
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
  v7[2] = __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[9] && v2[7] && v2[8])
  {
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(v4 + 72);
    v7 = *(_QWORD *)(v4 + 56);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke_2;
    v9[3] = &unk_1E4834630;
    v9[4] = v4;
    v10 = v5;
    objc_msgSend(v6, "prepareForSetupWithContext:completion:", v7, v9);

  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    NSErrorWithOSStatusF();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v8);

  }
}

void __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 96);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke_3;
  v12[3] = &unk_1E482E508;
  v12[4] = v7;
  v13 = v5;
  v14 = v6;
  v15 = v8;
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, v12);

}

uint64_t __43__SFSiriClient_deviceSetupPrepareGreeting___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceSetupPrepareGreetingFlow:error:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_deviceSetupPrepareGreetingFlow:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  SFSiriDeviceSetupGreetingDetails *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (!v8 || v9)
  {
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v9)
    {
      ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v9);
    }
    else
    {
      NSErrorWithOSStatusF();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v12);

    }
  }
  else
  {
    v22 = v10;
    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v21 = objc_alloc_init(SFSiriDeviceSetupGreetingDetails);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v8;
    objc_msgSend(v8, "scenes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v17);
          if (objc_msgSend(v18, "sceneID", v20) == 5)
          {
            if (gLogCategory_SFSiriClient <= 30
              && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            objc_storeStrong((id *)&self->_deviceSetupSceneOutro, v18);
          }
          else if (gLogCategory_SFSiriClient <= 30
                 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
          {
            v20 = objc_msgSend(v18, "sceneID");
            LogPrintF();
          }
          ++v17;
        }
        while (v15 != v17);
        v19 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v15 = v19;
      }
      while (v19);
    }

    v11 = (void (**)(_QWORD, _QWORD, _QWORD))v22;
    (*((void (**)(id, SFSiriDeviceSetupGreetingDetails *, _QWORD))v22 + 2))(v22, v21, 0);

    v9 = 0;
    v8 = v23;
  }

}

- (void)deviceSetupPlayGreetingID:(int)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SFSiriClient_deviceSetupPlayGreetingID_completion___block_invoke;
  block[3] = &unk_1E4831C28;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __53__SFSiriClient_deviceSetupPlayGreetingID_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deviceSetupPlayGreetingID:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_deviceSetupPlayGreetingID:(int)a3 completion:(id)a4
{
  id v6;
  SVXDeviceSetupFlowScene *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  int v16;

  v6 = a4;
  if (self->_siriDeviceSetupService && self->_siriDeviceSetupContext && self->_siriDeviceSetupManager && a3 == 5)
  {
    v7 = self->_deviceSetupSceneOutro;
    if (v7)
      goto LABEL_8;
    v8 = objc_alloc_init((Class)getSVXDeviceSetupFlowSceneBuilderClass[0]());
    objc_msgSend(v8, "setSceneID:", 5);
    objc_msgSend(v8, "build");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v7 = (SVXDeviceSetupFlowScene *)v9;

LABEL_8:
      if (gLogCategory_SFSiriClient <= 30
        && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v11 = objc_alloc((Class)getSVXSystemEventClass[0]());
      v12 = (void *)objc_msgSend(v11, "initWithType:timestamp:alarm:deviceSetupFlowScene:", 7, mach_absolute_time(), 0, v7);
      -[SVXClientServiceManager activationService](self->_siriDeviceSetupManager, "activationService");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __54__SFSiriClient__deviceSetupPlayGreetingID_completion___block_invoke;
      v14[3] = &unk_1E4834658;
      v16 = 5;
      v14[4] = self;
      v15 = v6;
      objc_msgSend(v13, "activateWithSystemEvent:userInfo:completion:", v12, 0, v14);

      goto LABEL_18;
    }
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
      LogPrintF();

  }
  NSErrorWithOSStatusF();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (v6)
    (*((void (**)(id, void *))v6 + 2))(v6, v10);

LABEL_18:
}

void __54__SFSiriClient__deviceSetupPlayGreetingID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFSiriClient <= 90 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (gLogCategory_SFSiriClient <= 30
         && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SFSiriClient__deviceSetupPlayGreetingID_completion___block_invoke_2;
    block[3] = &unk_1E482E0F0;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

uint64_t __54__SFSiriClient__deviceSetupPlayGreetingID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)speechSynthesizer:(id)a3 didStartSpeakingRequest:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    if (IsAppleInternalBuild())
    {
      objc_msgSend(v5, "text");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    else
    {
      LogPrintF();
    }
  }

}

- (void)speechSynthesizer:(id)a3 withRequest:(id)a4 didReceiveTimingInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__SFSiriClient_speechSynthesizer_withRequest_didReceiveTimingInfo___block_invoke;
  v15[3] = &unk_1E482E7D8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

uint64_t __67__SFSiriClient_speechSynthesizer_withRequest_didReceiveTimingInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "speechSynthesizer:withRequest:didReceiveTimingInfo2:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)speechSynthesizer:(id)a3 withRequest:(id)a4 didReceiveTimingInfo2:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  SFSiriWordTimingInfo *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  __CFString *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  __CFString *v34;
  id v35;
  id v36;
  void *v37;
  id obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
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
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[31];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  -[SFSiriRequest speechStartHandler](self->_currentRequest, "speechStartHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SFSiriRequest setSpeechStartHandler:](self->_currentRequest, "setSpeechStartHandler:", 0);
    v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v35 = v8;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v82, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v46 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v16 = objc_alloc_init(SFSiriWordTimingInfo);
          objc_msgSend(v15, "startTime");
          -[SFSiriWordTimingInfo setTimeOffset:](v16, "setTimeOffset:");
          v17 = objc_msgSend(v15, "textRange");
          -[SFSiriWordTimingInfo setTextRange:](v16, "setTextRange:", v17, v18);
          objc_msgSend(v39, "addObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v82, 16);
      }
      while (v12);
    }

    ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v39, 0);
    v36 = v7;
    objc_msgSend(v7, "text");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v37, "length");
    v80 = 0u;
    memset(v81, 0, sizeof(v81));
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v67 = 0u;
    v66 = 0u;
    v65 = 0u;
    v64 = 0u;
    v63 = 0u;
    v62 = 0u;
    v61 = 0u;
    v60 = 0u;
    v59 = 0u;
    v58 = 0u;
    v57 = 0u;
    v56 = 0u;
    v55 = 0u;
    v54 = 0u;
    v53 = 0u;
    v52 = 0u;
    v51 = 0u;
    v44 = &v50;
    v50 = 0;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v10;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v41 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          v26 = objc_msgSend(v24, "textRange", v31, v32, v33, v34);
          v27 = v25;
          v28 = v19 >= v26 && v19 - v26 >= v25;
          v29 = CFSTR("?");
          if (v28)
          {
            objc_msgSend(v37, "substringWithRange:", v26, v25);
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v24, "startTime");
          v34 = v29;
          v33 = v30;
          v31 = v26;
          v32 = v27;
          SNPrintF_Add();

        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16, v26, v27, v33, v29);
      }
      while (v21);
    }

    if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(obj, "count");
      LogPrintF();
    }

    v8 = v35;
    v7 = v36;
  }
  else if (gLogCategory_SFSiriClient <= 30
         && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v8, "count");
    LogPrintF();
  }

}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 phonemesSpoken:(id)a6 withError:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *dispatchQueue;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v11 = a3;
  v12 = a4;
  v13 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__SFSiriClient_speechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke;
  block[3] = &unk_1E4834680;
  block[4] = self;
  v19 = v11;
  v22 = a5;
  v20 = v12;
  v21 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  dispatch_async(dispatchQueue, block);

}

uint64_t __97__SFSiriClient_speechSynthesizer_didFinishSpeakingRequest_successfully_phonemesSpoken_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "speechSynthesizer:didFinishSpeakingRequest:successfully:withError2:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (void)speechSynthesizer:(id)a3 didFinishSpeakingRequest:(id)a4 successfully:(BOOL)a5 withError2:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD, _QWORD);
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  SFSiriRequest *currentRequest;
  void *v24;
  const __CFString *v25;
  const char *v26;
  id v27;
  id v28;

  v7 = a5;
  v28 = a3;
  v10 = a4;
  v11 = a6;
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    if (IsAppleInternalBuild())
    {
      objc_msgSend(v10, "text");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = "no";
      if (v7)
        v14 = "yes";
      v26 = v14;
      v27 = v11;
      v25 = (const __CFString *)v12;
      LogPrintF();

    }
    else
    {
      v15 = "no";
      if (v7)
        v15 = "yes";
      v26 = v15;
      v27 = v11;
      v25 = CFSTR("*");
      LogPrintF();
    }
  }
  -[SFSiriRequest speechUtteranceRequest](self->_currentRequest, "speechUtteranceRequest", v25, v26, v27);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (v16 != v10
    && gLogCategory_SFSiriClient <= 60
    && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFSiriRequest speechStartHandler](self->_currentRequest, "speechStartHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[SFSiriRequest speechStartHandler](self->_currentRequest, "speechStartHandler");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void (**)(_QWORD, _QWORD, _QWORD))v18;
    if (v11)
    {
      (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v11);
    }
    else
    {
      NSErrorWithOSStatusF();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v19)[2](v19, 0, v20);

    }
    -[SFSiriRequest setSpeechStartHandler:](self->_currentRequest, "setSpeechStartHandler:", 0);
  }
  -[SFSiriRequest speechCompletion](self->_currentRequest, "speechCompletion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[SFSiriRequest speechCompletion](self->_currentRequest, "speechCompletion");
    v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v22)[2](v22, v11);

    -[SFSiriRequest setSpeechCompletion:](self->_currentRequest, "setSpeechCompletion:", 0);
  }
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

  if (self->_invalidateCalled)
  {
    NSErrorWithOSStatusF();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSiriClient _completeAllRequestsWithError:](self, "_completeAllRequestsWithError:", v24);

  }
  else
  {
    -[SFSiriClient _processQueuedRequests](self, "_processQueuedRequests");
  }

}

- (void)speechSynthesizer:(id)a3 didFinishSynthesisRequest:(id)a4 withInstrumentMetrics:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dispatchQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SFSiriClient_speechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error___block_invoke;
  block[3] = &unk_1E4831078;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(dispatchQueue, block);

}

uint64_t __88__SFSiriClient_speechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "speechSynthesizer:didFinishSynthesisRequest:withInstrumentMetrics:error2:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)speechSynthesizer:(id)a3 didFinishSynthesisRequest:(id)a4 withInstrumentMetrics:(id)a5 error2:(id)a6
{
  id v9;
  id v10;
  double v11;
  SFSiriRequest *v12;
  int v13;
  __CFString *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  OS_dispatch_source *currentTimer;
  NSObject *v21;
  OS_dispatch_source *v22;
  OS_dispatch_source *v23;
  OS_dispatch_source *v24;
  NSObject *v25;
  __CFString *v26;
  double v27;
  _QWORD handler[5];
  SFSiriRequest *v29;

  v9 = a4;
  v10 = a5;
  v11 = COERCE_DOUBLE(a6);
  v12 = self->_currentRequest;
  -[SFSiriRequest setSynthesizing:](v12, "setSynthesizing:", 0);
  if (v11 == 0.0 && self->_invalidateCalled)
  {
    NSErrorWithOSStatusF();
    v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  }
  if (v11 != 0.0)
  {
    if (gLogCategory_SFSiriClient > 90 || gLogCategory_SFSiriClient == -1 && !_LogCategory_Initialize())
    {
      if (!v12)
        goto LABEL_17;
      goto LABEL_16;
    }
    if (IsAppleInternalBuild())
    {
      objc_msgSend(v9, "text");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v27 = v11;
      LogPrintF();

      if (!v12)
        goto LABEL_17;
    }
    else
    {
      v26 = CFSTR("*");
      v27 = v11;
      LogPrintF();
      if (!v12)
      {
LABEL_17:
        if (self->_invalidateCalled)
          -[SFSiriClient _completeAllRequestsWithError:](self, "_completeAllRequestsWithError:", *(_QWORD *)&v11);
        goto LABEL_32;
      }
    }
LABEL_16:
    -[SFSiriClient _completeRequest:error:](self, "_completeRequest:error:", v12, *(_QWORD *)&v11, v26, *(_QWORD *)&v27);
    goto LABEL_17;
  }
  if (gLogCategory_SFSiriClient <= 30 && (gLogCategory_SFSiriClient != -1 || _LogCategory_Initialize()))
  {
    v13 = IsAppleInternalBuild();
    if (v13)
    {
      objc_msgSend(v9, "text");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("*");
    }
    objc_msgSend(v10, "timeToSpeakLatency");
    v27 = v15 * 1000.0;
    v26 = v14;
    LogPrintF();
    if (v13)

  }
  -[SFSiriRequest delaySecs](v12, "delaySecs", v26, *(_QWORD *)&v27);
  if (v16 > 0.0)
  {
    -[SFSiriRequest delaySecs](v12, "delaySecs");
    v18 = v17;
    mach_absolute_time();
    -[SFSiriRequest startTicks](v12, "startTicks");
    UpTicksToSecondsF();
    if (v18 - v19 <= 0.0)
    {
      -[SFSiriClient startDelayedRequest:](self, "startDelayedRequest:", v12);
    }
    else
    {
      currentTimer = self->_currentTimer;
      if (currentTimer)
      {
        v21 = currentTimer;
        dispatch_source_cancel(v21);
        v22 = self->_currentTimer;
        self->_currentTimer = 0;

      }
      v23 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v24 = self->_currentTimer;
      self->_currentTimer = v23;

      v25 = self->_currentTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __89__SFSiriClient_speechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error2___block_invoke;
      handler[3] = &unk_1E482D3A0;
      handler[4] = self;
      v29 = v12;
      dispatch_source_set_event_handler(v25, handler);
      CUDispatchTimerSet();
      dispatch_activate((dispatch_object_t)self->_currentTimer);

    }
  }
LABEL_32:

}

uint64_t __89__SFSiriClient_speechSynthesizer_didFinishSynthesisRequest_withInstrumentMetrics_error2___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "startDelayedRequest:", *(_QWORD *)(a1 + 40));
}

- (void)sessionService:(id)a3 didChangeStateFrom:(int64_t)a4 to:(int64_t)a5
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if (gLogCategory_SFSiriClient <= 30)
  {
    v8 = v5;
    if (gLogCategory_SFSiriClient != -1 || (v7 = _LogCategory_Initialize(), v6 = v8, v7))
    {
      LogPrintF();
      v6 = v8;
    }
  }

}

- (void)sessionService:(id)a3 willPresentFeedbackWithDialogIdentifier:(id)a4
{
  id v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SFSiriClient *v10;

  v5 = a4;
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__SFSiriClient_sessionService_willPresentFeedbackWithDialogIdentifier___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(dispatchQueue, v8);

}

uint64_t __71__SFSiriClient_sessionService_willPresentFeedbackWithDialogIdentifier___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  if (gLogCategory_SFSiriClient <= 30)
  {
    if (gLogCategory_SFSiriClient != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  v2 = *(_QWORD *)(v1 + 40);
  if (!*(_BYTE *)(v2 + 8))
  {
    result = *(_QWORD *)(v2 + 112);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v1 + 32));
  }
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)siriDialogHandler
{
  return self->_siriDialogHandler;
}

- (void)setSiriDialogHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_siriDialogHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_siriServiceManager, 0);
  objc_storeStrong((id *)&self->_deviceSetupSceneOutro, 0);
  objc_storeStrong((id *)&self->_siriDeviceSetupService, 0);
  objc_storeStrong((id *)&self->_siriDeviceSetupManager, 0);
  objc_storeStrong((id *)&self->_siriDeviceSetupContext, 0);
  objc_storeStrong((id *)&self->_speechSynthesizer, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_currentTimer, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
}

@end
