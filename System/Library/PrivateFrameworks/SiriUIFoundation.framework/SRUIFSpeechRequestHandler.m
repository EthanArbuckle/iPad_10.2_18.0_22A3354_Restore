@implementation SRUIFSpeechRequestHandler

- (SRUIFSpeechRequestHandler)initWithDelegate:(id)a3
{
  id v4;
  SRUIFSpeechRequestHandler *v5;
  SRUIFSpeechRequestHandler *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SRUIFSpeechRequestHandler;
  v5 = -[SRUIFSpeechRequestHandler init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)startSpeechRequestWithSpeechRequestOptions:(id)a3 instrumentationTurn:(id)a4 isInitialBringUp:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  os_log_t *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD);
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (**continuePendingRequest)(void);
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  int v36;
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v7 = a5;
  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  -[SRUIFSpeechRequestHandler _currentSpeechRequestGroup](self, "_currentSpeechRequestGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[SRUIFSpeechRequestHandler delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "connectionForSpeechRequestHandler:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (os_log_t *)MEMORY[0x24BE08FB0];
    v17 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v18 = v17;
      objc_msgSend(v11, "turnIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 136315394;
      v37 = "-[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBringUp:completion:]";
      v38 = 2112;
      v39 = v19;
      _os_log_impl(&dword_219F26000, v18, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Setting turn identifier for speech request %@", (uint8_t *)&v36, 0x16u);

    }
    objc_msgSend(v11, "turnIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTurnIdentifier:", v20);

    if ((objc_msgSend(v15, "isRecording") & 1) == 0)
    {
      objc_msgSend(v15, "startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:", v10);
      v21 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      continuePendingRequest = (void (**)(void))self->_continuePendingRequest;
      if (continuePendingRequest)
        continuePendingRequest[2]();
      self->_sendContextBeforeContinuingSpeechRequest = 0;
      if (v15)
      {
        v31 = *v16;
        if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
        {
          v36 = 136315394;
          v37 = "-[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBrin"
                "gUp:completion:]";
          v38 = 1024;
          LODWORD(v39) = v7;
          _os_log_impl(&dword_219F26000, v31, OS_LOG_TYPE_DEFAULT, "%s Captured pending speech request dispatch block. Is Initial Bring up %{BOOL}d", (uint8_t *)&v36, 0x12u);
        }
        v32 = (void *)MEMORY[0x220736DE0](v21);
        v33 = self->_continuePendingRequest;
        self->_continuePendingRequest = v32;

        self->_sendContextBeforeContinuingSpeechRequest = !v7;
        if (v12)
          v12[2](v12, 0);
      }
      else
      {
        if (v21)
          v21[2](v21);
        v34 = self->_continuePendingRequest;
        self->_continuePendingRequest = 0;

        if (v12)
        {
          objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("No AFConnection."), 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *))v12)[2](v12, v35);

        }
      }
      goto LABEL_17;
    }
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("AFConnection is already recording."), 0);
      v21 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void (**)(_QWORD)))v12)[2](v12, v21);
LABEL_17:

    }
LABEL_18:

    goto LABEL_19;
  }
  v22 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
  {
    -[SRUIFSpeechRequestHandler startSpeechRequestWithSpeechRequestOptions:instrumentationTurn:isInitialBringUp:completion:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    if (!v12)
      goto LABEL_19;
    goto LABEL_9;
  }
  if (v12)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BE091D8], "errorWithCode:description:underlyingError:", 2510, CFSTR("No speech request dispatch group."), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v12)[2](v12, v15);
    goto LABEL_18;
  }
LABEL_19:

}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[SRUIFSpeechRequestHandler _currentSpeechRequestGroup](self, "_currentSpeechRequestGroup");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    dispatch_group_enter(v8);
  objc_initWeak(&location, self);
  -[SRUIFSpeechRequestHandler delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __78__SRUIFSpeechRequestHandler_startSpeechRequestWithSpeechFileAtURL_completion___block_invoke;
  v14[3] = &unk_24DC1A7E8;
  objc_copyWeak(&v18, &location);
  v11 = v9;
  v15 = v11;
  v12 = v6;
  v16 = v12;
  v13 = v7;
  v17 = v13;
  objc_msgSend(v10, "sendContextForSpeechRequestContinuationWithCompletion:", v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __78__SRUIFSpeechRequestHandler_startSpeechRequestWithSpeechFileAtURL_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  v10 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "_currentSpeechRequestGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v10;
    if (v4 == v5)
    {
      objc_msgSend(v10, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "connectionForSpeechRequestHandler:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startSpeechRequestWithSpeechFileAtURL:", *(_QWORD *)(a1 + 40));

      v3 = v10;
      v8 = *(_QWORD *)(a1 + 48);
      if (v8)
      {
        (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
        v3 = v10;
      }
    }
  }
  v9 = *(NSObject **)(a1 + 32);
  if (v9)
  {
    dispatch_group_leave(v9);
    v3 = v10;
  }

}

- (void)speechRecordingWillBegin
{
  NSObject *v3;
  _BOOL4 sendContextBeforeContinuingSpeechRequest;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    sendContextBeforeContinuingSpeechRequest = self->_sendContextBeforeContinuingSpeechRequest;
    *(_DWORD *)buf = 136315394;
    v9 = "-[SRUIFSpeechRequestHandler speechRecordingWillBegin]";
    v10 = 1024;
    v11 = sendContextBeforeContinuingSpeechRequest;
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s Should send context before speech request continuation: %{BOOL}d", buf, 0x12u);
  }
  if (self->_sendContextBeforeContinuingSpeechRequest)
  {
    objc_initWeak((id *)buf, self);
    -[SRUIFSpeechRequestHandler delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __53__SRUIFSpeechRequestHandler_speechRecordingWillBegin__block_invoke;
    v6[3] = &unk_24DC1A810;
    objc_copyWeak(&v7, (id *)buf);
    objc_msgSend(v5, "sendContextForSpeechRequestContinuationWithCompletion:", v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    -[SRUIFSpeechRequestHandler _continuePendingSpeechRequest](self, "_continuePendingSpeechRequest");
  }
}

void __53__SRUIFSpeechRequestHandler_speechRecordingWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_continuePendingSpeechRequest");

}

- (void)speechRecordingDidFail
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SRUIFSpeechRequestHandler speechRecordingDidFail]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[SRUIFSpeechRequestHandler _continuePendingSpeechRequest](self, "_continuePendingSpeechRequest");
}

- (void)_continuePendingSpeechRequest
{
  void *v3;
  id continuePendingRequest;
  NSObject *v5;
  void *v6;
  void (**v7)(void);
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    continuePendingRequest = self->_continuePendingRequest;
    v5 = v3;
    v6 = (void *)MEMORY[0x220736DE0](continuePendingRequest);
    v9 = 136315394;
    v10 = "-[SRUIFSpeechRequestHandler _continuePendingSpeechRequest]";
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v9, 0x16u);

  }
  v7 = (void (**)(void))self->_continuePendingRequest;
  if (v7)
  {
    v7[2]();
    v8 = self->_continuePendingRequest;
    self->_continuePendingRequest = 0;

    self->_sendContextBeforeContinuingSpeechRequest = 0;
  }
}

- (id)prepareForNewSpeechRequest
{
  NSObject *v3;
  OS_dispatch_group *v4;
  OS_dispatch_group *currentSpeechRequestGroup;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[SRUIFSpeechRequestHandler prepareForNewSpeechRequest]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  v4 = (OS_dispatch_group *)dispatch_group_create();
  currentSpeechRequestGroup = self->_currentSpeechRequestGroup;
  self->_currentSpeechRequestGroup = v4;

  return self->_currentSpeechRequestGroup;
}

- (id)currentSpeechRequestDispatchGroup
{
  return self->_currentSpeechRequestGroup;
}

- (void)stopSpeechRequestWithOptions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SRUIFSpeechRequestHandler stopSpeechRequestWithOptions:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__SRUIFSpeechRequestHandler_stopSpeechRequestWithOptions___block_invoke;
  v7[3] = &unk_24DC1A838;
  objc_copyWeak(&v9, (id *)buf);
  v6 = v4;
  v8 = v6;
  -[SRUIFSpeechRequestHandler _performOnCurrentSpeechDipatchGroup:](self, "_performOnCurrentSpeechDipatchGroup:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __58__SRUIFSpeechRequestHandler_stopSpeechRequestWithOptions___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "connectionForSpeechRequestHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSpeechWithOptions:", *(_QWORD *)(a1 + 32));

}

- (void)stopSpeechRequest
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[SRUIFSpeechRequestHandler stopSpeechRequest]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[SRUIFSpeechRequestHandler delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "connectionForSpeechRequestHandler:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSpeech");

}

- (void)updateSpeechRequestOptions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SRUIFSpeechRequestHandler updateSpeechRequestOptions:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__SRUIFSpeechRequestHandler_updateSpeechRequestOptions___block_invoke;
  v7[3] = &unk_24DC1A838;
  objc_copyWeak(&v9, (id *)buf);
  v6 = v4;
  v8 = v6;
  -[SRUIFSpeechRequestHandler _performOnCurrentSpeechDipatchGroup:](self, "_performOnCurrentSpeechDipatchGroup:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __56__SRUIFSpeechRequestHandler_updateSpeechRequestOptions___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "connectionForSpeechRequestHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateSpeechOptions:", *(_QWORD *)(a1 + 32));

}

- (void)_performOnCurrentSpeechDipatchGroup:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  dispatch_group_t v15;
  id v16;
  id v17;
  id location;

  v4 = a3;
  -[SRUIFSpeechRequestHandler _currentSpeechRequestGroup](self, "_currentSpeechRequestGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __65__SRUIFSpeechRequestHandler__performOnCurrentSpeechDipatchGroup___block_invoke;
    v14[3] = &unk_24DC1A860;
    objc_copyWeak(&v17, &location);
    v15 = v5;
    v16 = v4;
    dispatch_group_notify(v15, MEMORY[0x24BDAC9B8], v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[SRUIFSpeechRequestHandler _performOnCurrentSpeechDipatchGroup:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  }

}

void __65__SRUIFSpeechRequestHandler__performOnCurrentSpeechDipatchGroup___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(void **)(a1 + 32);
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_currentSpeechRequestGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v5;
    if (v3 == v4)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      WeakRetained = v5;
    }
  }

}

- (void)cancelSpeechRequest
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[SRUIFSpeechRequestHandler cancelSpeechRequest]";
    _os_log_impl(&dword_219F26000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  -[SRUIFSpeechRequestHandler delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "speechRequestHandlerWillCancelSpeechRequest:", self);

  -[SRUIFSpeechRequestHandler delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionForSpeechRequestHandler:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SRUIFSpeechRequestHandler delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "speechRequestHandlerShouldRollBackRequestForSpeechCancellation:", self);

  if (v9)
  {
    v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = "-[SRUIFSpeechRequestHandler cancelSpeechRequest]";
      _os_log_impl(&dword_219F26000, v10, OS_LOG_TYPE_DEFAULT, "%s Delegate specified a rollback is necessary", (uint8_t *)&v12, 0xCu);
    }
    objc_msgSend(v7, "rollbackRequest");
  }
  objc_msgSend(v7, "cancelRequest");
  -[SRUIFSpeechRequestHandler delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "speechRequestHandlerDidCancelSpeechRequest:", self);

}

- (void)discardCurrentSpeechGroup
{
  NSObject *v3;
  OS_dispatch_group *v4;
  NSMutableSet *speechRequestGroupGraveyard;
  NSMutableSet *v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  OS_dispatch_group *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[SRUIFSpeechRequestHandler discardCurrentSpeechGroup]";
    _os_log_impl(&dword_219F26000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v4 = self->_currentSpeechRequestGroup;
  if (v4)
  {
    speechRequestGroupGraveyard = self->_speechRequestGroupGraveyard;
    if (!speechRequestGroupGraveyard)
    {
      v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v7 = self->_speechRequestGroupGraveyard;
      self->_speechRequestGroupGraveyard = v6;

      speechRequestGroupGraveyard = self->_speechRequestGroupGraveyard;
    }
    if ((-[NSMutableSet containsObject:](speechRequestGroupGraveyard, "containsObject:", v4) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_speechRequestGroupGraveyard, "addObject:", v4);
      objc_initWeak((id *)buf, self);
      v8 = MEMORY[0x24BDAC760];
      v9 = 3221225472;
      v10 = __54__SRUIFSpeechRequestHandler_discardCurrentSpeechGroup__block_invoke;
      v11 = &unk_24DC1A838;
      objc_copyWeak(&v13, (id *)buf);
      v12 = v4;
      dispatch_group_notify((dispatch_group_t)v12, MEMORY[0x24BDAC9B8], &v8);

      objc_destroyWeak(&v13);
      objc_destroyWeak((id *)buf);
    }
    -[SRUIFSpeechRequestHandler _continuePendingSpeechRequest](self, "_continuePendingSpeechRequest", v8, v9, v10, v11);
    -[SRUIFSpeechRequestHandler _setCurrentSpeechRequestGroup:](self, "_setCurrentSpeechRequestGroup:", 0);
  }

}

void __54__SRUIFSpeechRequestHandler_discardCurrentSpeechGroup__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)nonSpeechRequestWillBegin
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  -[SRUIFSpeechRequestHandler delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionForSpeechRequestHandler:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isRecording"))
  {
    v5 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[SRUIFSpeechRequestHandler nonSpeechRequestWillBegin]";
      _os_log_impl(&dword_219F26000, v5, OS_LOG_TYPE_DEFAULT, "%s Request will begin while recording is ongoing. Cancelling speech request", (uint8_t *)&v6, 0xCu);
    }
    -[SRUIFSpeechRequestHandler cancelSpeechRequest](self, "cancelSpeechRequest");
  }

}

- (OS_dispatch_group)_currentSpeechRequestGroup
{
  return self->_currentSpeechRequestGroup;
}

- (void)_setCurrentSpeechRequestGroup:(id)a3
{
  objc_storeStrong((id *)&self->_currentSpeechRequestGroup, a3);
}

- (SRUIFSpeechRequestHandlerDelegate)delegate
{
  return (SRUIFSpeechRequestHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSpeechRequestGroup, 0);
  objc_storeStrong((id *)&self->_speechRequestGroupGraveyard, 0);
  objc_storeStrong(&self->_continuePendingRequest, 0);
}

- (void)startSpeechRequestWithSpeechRequestOptions:(uint64_t)a3 instrumentationTurn:(uint64_t)a4 isInitialBringUp:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s couldn't find a speech request dispatch group", a5, a6, a7, a8, 2u);
}

- (void)_performOnCurrentSpeechDipatchGroup:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_219F26000, a1, a3, "%s Speech Request Dispatch Group nil.", a5, a6, a7, a8, 2u);
}

@end
