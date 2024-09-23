@implementation VSSpeechXPCHandler

- (VSSpeechXPCHandler)initWithConnection:(id)a3
{
  id v4;
  VSSpeechXPCHandler *v5;
  VSSpeechXPCHandler *v6;
  uint64_t v7;
  VSHHManagementClient *hubManagementClient;
  uint64_t v9;
  VSHMHomeManager *homeManager;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VSSpeechXPCHandler;
  v5 = -[VSSpeechXPCHandler init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connection, v4);
    +[VSHHManagementClient sharedInstance](VSHHManagementClient, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    hubManagementClient = v6->_hubManagementClient;
    v6->_hubManagementClient = (VSHHManagementClient *)v7;

    +[VSHMHomeManager sharedInstance](VSHMHomeManager, "sharedInstance");
    v9 = objc_claimAutoreleasedReturnValue();
    homeManager = v6->_homeManager;
    v6->_homeManager = (VSHMHomeManager *)v9;

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "invalidate");

  if (self->_synthesizerTransaction)
  {
    +[VSPrewarmService sharedService](VSPrewarmService, "sharedService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveSessionCount:", objc_msgSend(v4, "activeSessionCount") - 1);

  }
  v5.receiver = self;
  v5.super_class = (Class)VSSpeechXPCHandler;
  -[VSSpeechXPCHandler dealloc](&v5, sel_dealloc);
}

- (BOOL)isSpeaking
{
  void *v3;
  void *v4;
  VSSpeechXPCHandler *v5;

  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (VSSpeechXPCHandler *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == self;

  return (char)self;
}

- (void)invalidate
{
  NSObject *v3;
  uint8_t v4[16];

  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate VSSpeechXPCHandler, cancelling all related tasks", v4, 2u);
  }

  +[VSSpeechTaskQueue cancelTasksWithDelegate:](VSSpeechTaskQueue, "cancelTasksWithDelegate:", self);
}

- (void)performLanguageFallBackIfNeededWithRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BEC0E08], "availableLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BEC0E08];
    objc_msgSend(v3, "languageCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fallbackLanguageForLanguage:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    VSGetLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "languageCode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ is not TTS language, fallback to %{public}@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v3, "setLanguageCode:", v9);

  }
}

- (void)preprocessRequestBeforeSynthesis:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  float v25;
  float v26;
  NSObject *v27;
  double v28;
  void *v29;
  float v30;
  float v31;
  NSObject *v32;
  double v33;
  void *v34;
  float v35;
  float v36;
  NSObject *v37;
  double v38;
  void *v39;
  id WeakRetained;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  BOOL v46;
  NSObject *v47;
  void *v48;
  int v49;
  NSObject *v50;
  void *v51;
  int v52;
  double v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSSpeechXPCHandler performLanguageFallBackIfNeededWithRequest:](self, "performLanguageFallBackIfNeededWithRequest:", v4);
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v4, "setText:", &stru_24DD8EF88);
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vs_insertContextInfo:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "vs_substituteAudioWithLocalPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "languageCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vs_textifyEmojiWithLanguage:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "precomposedStringWithCanonicalMapping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "whisper") & 1) != 0)
  {

  }
  else
  {
    v14 = objc_msgSend(v4, "shouldWhisper");

    if ((v14 & 1) == 0)
      goto LABEL_7;
  }
  objc_msgSend(CFSTR("\x1B\\mrk=emo=whisper\\"), "stringByAppendingString:", v12);
  v15 = objc_claimAutoreleasedReturnValue();

  v12 = (void *)v15;
LABEL_7:
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "useSSMLInput");

  if (v17)
  {
    objc_msgSend(v12, "vs_convertToSSML");
    v18 = objc_claimAutoreleasedReturnValue();

    VSGetLogDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "logUtterance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138412290;
      v53 = *(double *)&v20;
      _os_log_impl(&dword_21AA84000, v19, OS_LOG_TYPE_DEFAULT, "Use SSML input: %@", (uint8_t *)&v52, 0xCu);

    }
    v12 = (void *)v18;
  }
  objc_msgSend(v4, "setUtterance:", v12);
  VSGetLogDefault();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(v4, "requestCreatedTimestamp");
    objc_msgSend(v4, "logUtterance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 134218242;
    v53 = *(double *)&v22;
    v54 = 2112;
    v55 = v23;
    _os_log_impl(&dword_21AA84000, v21, OS_LOG_TYPE_INFO, "Utterance to synthesize for request %llu: '%@'", (uint8_t *)&v52, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "defaultVolume");
  v26 = v25;

  if (v26 != 0.0)
  {
    VSGetLogDefault();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v26;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v52 = 134217984;
      v53 = v28;
      _os_log_impl(&dword_21AA84000, v27, OS_LOG_TYPE_DEFAULT, "Overwriting volume with internal default: %.3f", (uint8_t *)&v52, 0xCu);
    }

    objc_msgSend(v4, "setVolume:", v28);
  }
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "defaultRate");
  v31 = v30;

  if (v31 != 0.0)
  {
    VSGetLogDefault();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v31;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v52 = 134217984;
      v53 = v33;
      _os_log_impl(&dword_21AA84000, v32, OS_LOG_TYPE_DEFAULT, "Overwriting rate with internal default: %.3f", (uint8_t *)&v52, 0xCu);
    }

    objc_msgSend(v4, "setRate:", v33);
  }
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "defaultPitch");
  v36 = v35;

  if (v36 != 0.0)
  {
    VSGetLogDefault();
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = v36;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v52 = 134217984;
      v53 = v38;
      _os_log_impl(&dword_21AA84000, v37, OS_LOG_TYPE_DEFAULT, "Overwriting pitch with internal default: %.3f", (uint8_t *)&v52, 0xCu);
    }

    objc_msgSend(v4, "setPitch:", v38);
  }
  objc_msgSend(v4, "outputPath");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.voiced.can-dump-audio"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v41, "BOOLValue") & 1) == 0)
    {
      VSGetLogDefault();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        LOWORD(v52) = 0;
        _os_log_impl(&dword_21AA84000, v42, OS_LOG_TYPE_INFO, "Process is not entitled for dumping audio. Ignore outputPath", (uint8_t *)&v52, 2u);
      }

      objc_msgSend(v4, "setOutputPath:", 0);
    }

  }
  objc_msgSend(v4, "siriRequestId");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    objc_msgSend(v4, "clientBundleIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = +[VSSpeechXPCHandler isSiriClientBundleIdentifier:](VSSpeechXPCHandler, "isSiriClientBundleIdentifier:", v45);

    if (!v46)
    {
      VSGetLogDefault();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v4, "clientBundleIdentifier");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543362;
        v53 = *(double *)&v51;
        _os_log_fault_impl(&dword_21AA84000, v47, OS_LOG_TYPE_FAULT, "Unexpected client '%{public}@' sets Siri request ID.", (uint8_t *)&v52, 0xCu);

      }
      objc_msgSend(v4, "setSiriRequestId:", 0);
    }
  }
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "disableDeviceRacing");

  if (v49)
  {
    VSGetLogDefault();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v52) = 0;
      _os_log_impl(&dword_21AA84000, v50, OS_LOG_TYPE_DEFAULT, "Overriding disableDeviceRacing with internal default", (uint8_t *)&v52, 2u);
    }

    objc_msgSend(v4, "setDisableDeviceRacing:", 1);
  }

}

- (void)updateWithConnectionIdentifier:(id)a3 keepActive:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSObject *v8;
  OS_os_transaction *synthesizerTransaction;
  NSObject *v10;
  OS_os_transaction *v11;
  uint64_t v12;
  NSObject *v13;
  OS_os_transaction *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  VSGetLogDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v16 = 138543618;
    v17 = v7;
    v18 = 1024;
    v19 = v4;
    _os_log_impl(&dword_21AA84000, v8, OS_LOG_TYPE_INFO, "Update with connection identifier: %{public}@, keepActive:%{BOOL}d", (uint8_t *)&v16, 0x12u);
  }

  objc_storeStrong((id *)&self->_connectionIdentifier, a3);
  synthesizerTransaction = self->_synthesizerTransaction;
  if (v4)
  {
    if (!synthesizerTransaction)
    {
      VSGetLogDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v16 = 138412290;
        v17 = v7;
        _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_INFO, "Keep active session for '%@'", (uint8_t *)&v16, 0xCu);
      }

      objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      v11 = (OS_os_transaction *)os_transaction_create();
      v12 = 1;
LABEL_12:
      v14 = self->_synthesizerTransaction;
      self->_synthesizerTransaction = v11;

      +[VSPrewarmService sharedService](VSPrewarmService, "sharedService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActiveSessionCount:", objc_msgSend(v15, "activeSessionCount") + v12);

    }
  }
  else if (synthesizerTransaction)
  {
    VSGetLogDefault();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v7;
      _os_log_impl(&dword_21AA84000, v13, OS_LOG_TYPE_INFO, "Remove active session for '%@'", (uint8_t *)&v16, 0xCu);
    }

    v11 = 0;
    v12 = -1;
    goto LABEL_12;
  }

}

- (void)prewarmIfNeededWithRequest:(id)a3 reply:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    VSGetLogDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412546;
      v14 = v9;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_DEFAULT, "Find on-going task: %@, ignoring prewarm request: %@", (uint8_t *)&v13, 0x16u);
    }

    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 407, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v11);

    }
  }
  else
  {
    -[VSSpeechXPCHandler performLanguageFallBackIfNeededWithRequest:](self, "performLanguageFallBackIfNeededWithRequest:", v6);
    +[VSPrewarmService sharedService](VSPrewarmService, "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "prewarmWithRequest:", v6);

    if (v7)
      v7[2](v7, 0);
  }

}

- (void)queryPhaticCapabilityWithRequest:(id)a3 reply:(id)a4
{
  void (**v6)(id, uint64_t);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a4;
  if (v6)
  {
    v17 = v6;
    v7 = a3;
    -[VSSpeechXPCHandler performLanguageFallBackIfNeededWithRequest:](self, "performLanguageFallBackIfNeededWithRequest:", v7);
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "languageCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "voiceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "voiceType");
    v12 = objc_msgSend(v7, "gender");
    v13 = objc_msgSend(v7, "footprint");

    objc_msgSend(v8, "selectVoiceForLang:name:type:gender:footprint:", v9, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BEC0DE8];
      objc_msgSend(v14, "voicePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, objc_msgSend(v15, "hasPhaticResponses:", v16));

    }
    else
    {
      v17[2](v17, 0);
    }

    v6 = v17;
  }

}

- (void)estimateDurationWithRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  VSDurationEstimationTask *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[VSSpeechXPCHandler preprocessRequestBeforeSynthesis:](self, "preprocessRequestBeforeSynthesis:", v6);
    v8 = -[VSDurationEstimationTask initWithRequest:]([VSDurationEstimationTask alloc], "initWithRequest:", v6);
    objc_initWeak(&location, v8);
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = __Block_byref_object_copy_;
    v21[4] = __Block_byref_object_dispose_;
    v22 = (id)os_transaction_create();
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __56__VSSpeechXPCHandler_estimateDurationWithRequest_reply___block_invoke;
    v17 = &unk_24DD8E358;
    objc_copyWeak(&v20, &location);
    v18 = v7;
    v19 = v21;
    -[VSDurationEstimationTask setCompletionBlock:](v8, "setCompletionBlock:", &v14);
    +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue", v14, v15, v16, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "accessoryID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSSpeechTaskQueue parallelQueueWithIdentifier:](VSSpeechTaskQueue, "parallelQueueWithIdentifier:", v12);
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    objc_msgSend(v9, "addTask:", v8);

    objc_destroyWeak(&v20);
    _Block_object_dispose(v21, 8);

    objc_destroyWeak(&location);
  }

}

- (void)startSpeechRequest:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  VSSiriInstrumentation *v8;
  VSSiriInstrumentation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  VSSiriInlineTTSStreamTask *v22;
  void *v23;
  VSSiriInlineTTSStreamTask *v24;
  VSSpeechServerTask *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  VSSpeechServerTask *v29;
  void *v30;
  uint64_t v31;
  VSSpeechSpeakTask *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  id v44;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[VSSpeechXPCHandler preprocessRequestBeforeSynthesis:](self, "preprocessRequestBeforeSynthesis:", v6);
  objc_msgSend(v6, "siriRequestId");
  v8 = (VSSiriInstrumentation *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [VSSiriInstrumentation alloc];
    objc_msgSend(v6, "siriRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[VSSiriInstrumentation initWithSiriRequestId:](v9, "initWithSiriRequestId:", v10);

    objc_msgSend(v6, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSiriInstrumentation instrumentRequestReceivedWithText:requestedVoiceType:requestedVoiceFootprint:isPrivate:](v8, "instrumentRequestReceivedWithText:requestedVoiceType:requestedVoiceFootprint:isPrivate:", v11, objc_msgSend(v6, "voiceType"), objc_msgSend(v6, "footprint"), objc_msgSend(v6, "canUseServerTTS") ^ 1);

  }
  objc_msgSend(MEMORY[0x24BEC0DC8], "defaultInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLastTTSRequestDate:", v13);

  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "disableInlineStreamTTS");

  if (v15)
  {
    VSGetLogDefault();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_DEFAULT, "Server Inline Streaming TTS is disabled in internal settings", (uint8_t *)&buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x24BEC0DF0], "standardInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "disableServerTTS");

  if (v18)
  {
    VSGetLogDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21AA84000, v19, OS_LOG_TYPE_DEFAULT, "Server TTS is disabled in internal settings", (uint8_t *)&buf, 2u);
    }

  }
  +[VSInlineStreamService sharedService](VSInlineStreamService, "sharedService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "popInlineStreamRequestForSpeakRequest:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (((v15 | v18) & 1) != 0 || !v21)
  {
    if (+[VSServerTTSClient shouldUseServerTTSForRequest:](VSServerTTSClient, "shouldUseServerTTSForRequest:", v6))
    {
      v29 = -[VSSpeechServerTask initWithRequest:shouldSpeak:]([VSSpeechServerTask alloc], "initWithRequest:shouldSpeak:", v6, 1);
      -[VSSpeechServerTask setDelegate:](v29, "setDelegate:", self);
      v25 = v29;
      VSGetLogDefault();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[VSSpeechServerTask instrumentMetrics](v25, "instrumentMetrics");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "requestCreatedTimestamp");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_21AA84000, v26, OS_LOG_TYPE_DEFAULT, "Created server speak task %llu", (uint8_t *)&buf, 0xCu);

      }
    }
    else
    {
      v32 = -[VSSpeechSpeakTask initWithRequest:]([VSSpeechSpeakTask alloc], "initWithRequest:", v6);
      -[VSSpeechSpeakTask setDelegate:](v32, "setDelegate:", self);
      v25 = v32;
      VSGetLogDefault();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[VSSpeechServerTask instrumentMetrics](v25, "instrumentMetrics");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "requestCreatedTimestamp");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v34;
        _os_log_impl(&dword_21AA84000, v26, OS_LOG_TYPE_DEFAULT, "Created speak task %llu", (uint8_t *)&buf, 0xCu);

      }
    }
  }
  else
  {
    v22 = [VSSiriInlineTTSStreamTask alloc];
    objc_msgSend(v21, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[VSSiriInlineTTSStreamTask initWithRequest:withStreamID:](v22, "initWithRequest:withStreamID:", v6, v23);

    -[VSSiriInlineTTSStreamTask setDelegate:](v24, "setDelegate:", self);
    v25 = v24;
    VSGetLogDefault();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechServerTask instrumentMetrics](v25, "instrumentMetrics");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "requestCreatedTimestamp");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v28;
      _os_log_impl(&dword_21AA84000, v26, OS_LOG_TYPE_DEFAULT, "Created stream speak task %llu", (uint8_t *)&buf, 0xCu);

    }
  }

  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
    -[VSSpeechServerTask setSiriInstrumentation:](v25, "setSiriInstrumentation:", v8);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  v50 = (id)os_transaction_create();
  v40 = MEMORY[0x24BDAC760];
  v41 = 3221225472;
  v42 = __47__VSSpeechXPCHandler_startSpeechRequest_reply___block_invoke;
  v43 = &unk_24DD8E308;
  p_buf = &buf;
  v35 = v7;
  v44 = v35;
  -[VSSpeechServerTask setCompletionBlock:](v25, "setCompletionBlock:", &v40);
  objc_msgSend(v6, "accessoryID", v40, v41, v42, v43);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v6, "accessoryID");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSSpeechTaskQueue parallelQueueWithIdentifier:](VSSpeechTaskQueue, "parallelQueueWithIdentifier:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addTask:", v25);

  }
  else
  {
    +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addTask:", v25);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)startPresynthesizedAudioRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  VSSiriInstrumentation *v9;
  VSSiriInstrumentation *v10;
  void *v11;
  void *v12;
  VSSpeechPresynthesizedTask *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "siriRequestId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "clientBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[VSSpeechXPCHandler isSiriClientBundleIdentifier:](VSSpeechXPCHandler, "isSiriClientBundleIdentifier:", v6);

    if (!v7)
    {
      VSGetLogDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v4, "clientBundleIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v21;
        _os_log_fault_impl(&dword_21AA84000, v8, OS_LOG_TYPE_FAULT, "Unexpected client '%{public}@' sets Siri request ID.", (uint8_t *)&buf, 0xCu);

      }
      objc_msgSend(v4, "setSiriRequestId:", 0);
    }
  }
  objc_msgSend(v4, "siriRequestId");
  v9 = (VSSiriInstrumentation *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [VSSiriInstrumentation alloc];
    objc_msgSend(v4, "siriRequestId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[VSSiriInstrumentation initWithSiriRequestId:](v10, "initWithSiriRequestId:", v11);

    objc_msgSend(v4, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSiriInstrumentation instrumentRequestReceivedWithText:requestedVoiceType:requestedVoiceFootprint:isPrivate:](v9, "instrumentRequestReceivedWithText:requestedVoiceType:requestedVoiceFootprint:isPrivate:", v12, 0, 0, 0);

  }
  v13 = -[VSSpeechPresynthesizedTask initWithRequest:]([VSSpeechPresynthesizedTask alloc], "initWithRequest:", v4);
  -[VSSpeechPresynthesizedTask setDelegate:](v13, "setDelegate:", self);
  VSGetLogDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[VSSpeechPresynthesizedTask instrumentMetrics](v13, "instrumentMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "requestCreatedTimestamp");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v16;
    _os_log_impl(&dword_21AA84000, v14, OS_LOG_TYPE_DEFAULT, "Created presynthesized task %llu", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = (id)os_transaction_create();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __54__VSSpeechXPCHandler_startPresynthesizedAudioRequest___block_invoke;
  v22[3] = &unk_24DD8E330;
  v22[4] = &buf;
  -[VSSpeechPresynthesizedTask setCompletionBlock:](v13, "setCompletionBlock:", v22);
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    -[VSSpeechPresynthesizedTask setSiriInstrumentation:](v13, "setSiriInstrumentation:", v9);
  objc_msgSend(v4, "accessoryID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "accessoryID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSSpeechTaskQueue parallelQueueWithIdentifier:](VSSpeechTaskQueue, "parallelQueueWithIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addTask:", v13);

  }
  else
  {
    +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addTask:", v13);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)cachePresynthesizedAudioRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    +[VSInlineStreamService sharedService](VSInlineStreamService, "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addInlineStreamRequest:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC0D78], "audioDataFromPresynthesisRequest:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "duration");
    if (v7 == 0.0)
    {
      VSGetLogDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134217984;
        v14 = objc_msgSend(v3, "requestCreatedTimestamp");
        _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_DEFAULT, "Cache #PresynthesizedRequest %llu skipped: no audio", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      +[VSCachingService standardService](VSCachingService, "standardService");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "enqueueShortTermCacheWithHash:audio:timingInfo:voiceKey:voiceResourceKey:completion:", v9, v6, 0, CFSTR("unknown:unknown:PresynthesizedAudio"), CFSTR("unknown:PresynthesizedAudio:unknown"), 0);

      VSGetLogDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(v3, "requestCreatedTimestamp");
        objc_msgSend(v3, "logText");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 134218242;
        v14 = v11;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_21AA84000, v10, OS_LOG_TYPE_DEFAULT, "Cache #PresynthesizedRequest %llu with text: %@", (uint8_t *)&v13, 0x16u);

      }
    }

  }
}

- (void)stopPresynthesizedAudioRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "accessoryID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "accessoryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSSpeechTaskQueue parallelQueueWithIdentifier:](VSSpeechTaskQueue, "parallelQueueWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "taskWithCreatedTimeStamp:", objc_msgSend(v3, "requestCreatedTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "cancelTask:", v8);
  }
  else
  {
    VSGetLogDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v3, "requestCreatedTimestamp");
      _os_log_impl(&dword_21AA84000, v9, OS_LOG_TYPE_DEFAULT, "Ignore stopPresynthesizedAudioRequest. Cannot find task with associated request %llu.", (uint8_t *)&v10, 0xCu);
    }

  }
}

- (void)startSynthesisRequest:(id)a3
{
  id v4;
  VSSpeechServerTask *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t v19[4];
  uint64_t v20;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[VSSpeechXPCHandler preprocessRequestBeforeSynthesis:](self, "preprocessRequestBeforeSynthesis:", v4);
  if (+[VSServerTTSClient shouldUseServerTTSForRequest:](VSServerTTSClient, "shouldUseServerTTSForRequest:", v4))
  {
    v5 = -[VSSpeechServerTask initWithRequest:shouldSpeak:]([VSSpeechServerTask alloc], "initWithRequest:shouldSpeak:", v4, 0);
    -[VSSpeechServerTask setDelegate:](v5, "setDelegate:", self);
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechServerTask instrumentMetrics](v5, "instrumentMetrics");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v7, "requestCreatedTimestamp");
      _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_DEFAULT, "Created server synthesis task %llu", (uint8_t *)&buf, 0xCu);

    }
  }
  else
  {
    v5 = -[VSSpeechSynthesisTask initWithRequest:]([VSSpeechSynthesisTask alloc], "initWithRequest:", v4);
    -[VSSpeechServerTask setDelegate:](v5, "setDelegate:", self);
    VSGetLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechServerTask instrumentMetrics](v5, "instrumentMetrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "requestCreatedTimestamp");
      _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_DEFAULT, "Created synthesis task %llu", (uint8_t *)&buf, 0xCu);

    }
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy_;
  v24 = __Block_byref_object_dispose_;
  v25 = (id)os_transaction_create();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __44__VSSpeechXPCHandler_startSynthesisRequest___block_invoke;
  v18[3] = &unk_24DD8E330;
  v18[4] = &buf;
  -[VSSpeechServerTask setCompletionBlock:](v5, "setCompletionBlock:", v18);
  +[VSInlineStreamService sharedService](VSInlineStreamService, "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasInlineStreamRequestForSpeakRequest:", v4);

  if (v10)
  {
    VSGetLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[VSSpeechServerTask instrumentMetrics](v5, "instrumentMetrics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "requestCreatedTimestamp");
      *(_DWORD *)v19 = 134217984;
      v20 = v13;
      _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_DEFAULT, "Found matched inline streaming request, cancel synthesis task %llu", v19, 0xCu);

    }
    -[VSSpeechServerTask cancel](v5, "cancel");
  }
  else
  {
    objc_msgSend(v4, "accessoryID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "accessoryID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "UUIDString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[VSSpeechTaskQueue parallelQueueWithIdentifier:](VSSpeechTaskQueue, "parallelQueueWithIdentifier:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addTask:", v5);

    }
    else
    {
      +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addTask:", v5);
    }

  }
  _Block_object_dispose(&buf, 8);

}

- (void)pauseSpeechRequest:(id)a3 atMark:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint8_t v13[16];

  v4 = a3;
  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "accessoryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSSpeechTaskQueue parallelQueueWithIdentifier:](VSSpeechTaskQueue, "parallelQueueWithIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  objc_msgSend(v5, "currentTask");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "createdTimestampWithTask:", v10);

  if (v4 && objc_msgSend(v4, "requestCreatedTimestamp") != v11)
  {
    VSGetLogDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_21AA84000, v12, OS_LOG_TYPE_DEFAULT, "Ignore pauseSpeechRequest. Current request is different than requested request.", v13, 2u);
    }

  }
  else
  {
    objc_msgSend(v5, "suspendCurrentTask");
  }

}

- (void)continueSpeechRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  uint8_t v12[16];

  v3 = a3;
  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "accessoryID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSSpeechTaskQueue parallelQueueWithIdentifier:](VSSpeechTaskQueue, "parallelQueueWithIdentifier:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  objc_msgSend(v4, "currentTask");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "createdTimestampWithTask:", v9);

  if (v3 && objc_msgSend(v3, "requestCreatedTimestamp") != v10)
  {
    VSGetLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_DEFAULT, "Ignore continueSpeechRequest. Current request is different than requested request.", v12, 2u);
    }

  }
  else
  {
    objc_msgSend(v4, "resumeCurrentTask");
  }

}

- (void)stopSpeechRequest:(id)a3 atMark:(int64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "accessoryID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSSpeechTaskQueue parallelQueueWithIdentifier:](VSSpeechTaskQueue, "parallelQueueWithIdentifier:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  objc_msgSend(v5, "taskWithCreatedTimeStamp:", objc_msgSend(v4, "requestCreatedTimestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "cancelTask:", v10);
  }
  else
  {
    VSGetLogDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v4, "requestCreatedTimestamp");
      _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_DEFAULT, "Ignore stopSpeechRequest. Cannot find task with associated request %llu.", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (void)getSpeechIsActiveReply:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v6 = (void (**)(id, uint64_t))a3;
  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_25510DB08))
    v5 = objc_msgSend(v4, "isSpeaking");
  else
    v5 = 0;
  if (v6)
    v6[2](v6, v5);

}

- (void)getSpeechIsActiveForConnectionReply:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  VSSpeechXPCHandler *v7;
  _BOOL8 v8;
  void (**v9)(id, _BOOL8);

  v9 = (void (**)(id, _BOOL8))a3;
  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentTask");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocol:", &unk_25510DB08))
  {
    v6 = v5;
    if (objc_msgSend(v6, "isSpeaking"))
    {
      objc_msgSend(v6, "delegate");
      v7 = (VSSpeechXPCHandler *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == self;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  if (v9)
    v9[2](v9, v8);

}

- (void)startPhonemesRequest:(id)a3 phonemeSystem:(int64_t)a4 reply:(id)a5
{
  id v8;
  id v9;
  VSTextToPhonemesTask *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  __int128 *p_buf;
  id v20;
  id location;
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  -[VSSpeechXPCHandler preprocessRequestBeforeSynthesis:](self, "preprocessRequestBeforeSynthesis:", v8);
  v10 = -[VSSpeechSpeakTask initWithRequest:]([VSTextToPhonemesTask alloc], "initWithRequest:", v8);
  -[VSSpeechSpeakTask setDelegate:](v10, "setDelegate:", self);
  -[VSTextToPhonemesTask setReply:](v10, "setReply:", v9);
  VSGetLogDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v8, "requestCreatedTimestamp");
    _os_log_impl(&dword_21AA84000, v11, OS_LOG_TYPE_DEFAULT, "Created phonemes task %llu", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = (id)os_transaction_create();
  objc_initWeak(&location, v10);
  -[VSTextToPhonemesTask setPhonemeSystem:](v10, "setPhonemeSystem:", a4);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __63__VSSpeechXPCHandler_startPhonemesRequest_phonemeSystem_reply___block_invoke;
  v17 = &unk_24DD8E358;
  p_buf = &buf;
  objc_copyWeak(&v20, &location);
  v12 = v9;
  v18 = v12;
  -[VSTextToPhonemesTask setCompletionBlock:](v10, "setCompletionBlock:", &v14);
  +[VSSpeechTaskQueue mainDeviceQueue](VSSpeechTaskQueue, "mainDeviceQueue", v14, v15, v16, v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTask:", v10);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

- (OS_dispatch_queue)audioPowerUpdateQueue
{
  OS_dispatch_queue *audioPowerUpdateQueue;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *v6;

  audioPowerUpdateQueue = self->_audioPowerUpdateQueue;
  if (!audioPowerUpdateQueue)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("VSAudioPowerUpdateQueue", v4);
    v6 = self->_audioPowerUpdateQueue;
    self->_audioPowerUpdateQueue = v5;

    audioPowerUpdateQueue = self->_audioPowerUpdateQueue;
  }
  return audioPowerUpdateQueue;
}

- (AFAudioPowerUpdater)audioPowerUpdater
{
  AFAudioPowerUpdater *audioPowerUpdater;
  void *v4;
  id v5;
  void *v6;
  AFAudioPowerUpdater *v7;
  AFAudioPowerUpdater *v8;

  audioPowerUpdater = self->_audioPowerUpdater;
  if (!audioPowerUpdater)
  {
    +[VSSpeechAudioPowerService sharedServices](VSSpeechAudioPowerService, "sharedServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BE090F8]);
    -[VSSpeechXPCHandler audioPowerUpdateQueue](self, "audioPowerUpdateQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (AFAudioPowerUpdater *)objc_msgSend(v5, "initWithProvider:queue:frequency:delegate:", v4, v6, 1, 0);
    v8 = self->_audioPowerUpdater;
    self->_audioPowerUpdater = v7;

    audioPowerUpdater = self->_audioPowerUpdater;
  }
  return audioPowerUpdater;
}

- (void)beginAudioPowerUpdateWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[VSSpeechXPCHandler beginAudioPowerUpdateWithReply:]";
    _os_log_impl(&dword_21AA84000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v4)
  {
    -[VSSpeechXPCHandler audioPowerUpdater](self, "audioPowerUpdater");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __53__VSSpeechXPCHandler_beginAudioPowerUpdateWithReply___block_invoke;
    v8[3] = &unk_24DD8E380;
    v9 = v4;
    objc_msgSend(v6, "createNewXPCWrapperWithCompletion:", v8);

    -[VSSpeechXPCHandler audioPowerUpdater](self, "audioPowerUpdater");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "beginUpdate");

  }
}

- (void)endAudioPowerUpdate
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[VSSpeechXPCHandler endAudioPowerUpdate]";
    _os_log_impl(&dword_21AA84000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[VSSpeechXPCHandler audioPowerUpdater](self, "audioPowerUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endUpdate");

  -[VSSpeechXPCHandler setAudioPowerUpdater:](self, "setAudioPowerUpdater:", 0);
}

- (void)getVoiceNamesForLanguage:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "installedAssetsForType:voicename:language:gender:footprint:", 0, 0, v5, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "voiceData", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

    v6[2](v6, v7);
  }

}

- (void)getFootprintsForVoiceName:(id)a3 languageCode:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    objc_msgSend(v10, "installedAssetsForType:voicename:language:gender:footprint:", 0, v7, v8, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "voiceData");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "numberWithLong:", objc_msgSend(v19, "footprint"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v20);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v15);
    }

    v9[2](v9, v12);
    v7 = v21;
  }

}

- (id)_delegate
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)speechRequestDidStart:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "speechRequestDidStart:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)speechRequestDidPause:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "speechRequestDidPause:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)speechRequestDidContinue:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "speechRequestDidContinue:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)speechRequest:(id)a3 didStartWithMark:(int64_t)a4 forRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v9;
  void *v10;
  id v11;

  length = a5.length;
  location = a5.location;
  v11 = a3;
  v9 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "speechRequest:didStartWithMark:forRange:", v11, a4, location, length);

  objc_autoreleasePoolPop(v9);
}

- (void)speechRequest:(id)a3 didStopWithSuccess:(BOOL)a4 phonemesSpoken:(id)a5 error:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v14 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "speechRequest:didStopWithSuccess:phonemesSpoken:error:", v14, v8, v10, v11);

  objc_autoreleasePoolPop(v12);
}

- (void)speechRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "speechRequest:didReceiveTimingInfo:", v7, v6);

}

- (void)speechRequest:(id)a3 didReportInstrumentMetrics:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "speechRequest:didReportInstrumentMetrics:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)synthesisRequest:(id)a3 didReceiveTimingInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synthesisRequest:didReceiveTimingInfo:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)synthesisRequest:(id)a3 didGenerateAudioChunk:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synthesisRequest:didGenerateAudioChunk:", v9, v6);

  objc_autoreleasePoolPop(v7);
}

- (void)synthesisRequest:(id)a3 didFinishWithInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synthesisRequest:didFinishWithInstrumentMetrics:error:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)audioRequestDidStart:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "audioRequestDidStart:", v6);

  objc_autoreleasePoolPop(v4);
}

- (void)audioRequest:(id)a3 didReportInstrumentMetrics:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "audioRequest:didReportInstrumentMetrics:error:", v12, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)audioRequest:(id)a3 didStopAtEnd:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v11 = a3;
  v8 = a5;
  v9 = (void *)MEMORY[0x220750BF4]();
  -[VSSpeechXPCHandler _delegate](self, "_delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "audioRequest:didStopAtEnd:error:", v11, v6, v8);

  objc_autoreleasePoolPop(v9);
}

- (void)cleanUnusedAssets:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *);

  v6 = (void (**)(id, void *))a3;
  -[VSHHManagementClient cleanUnknownAccessoriesPreferences](self->_hubManagementClient, "cleanUnknownAccessoriesPreferences");
  if ((objc_msgSend(MEMORY[0x24BEC0D80], "useSiriTTSServiceV2") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cleanUnusedAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v6)
    v6[2](v6, v4);

}

- (void)getLocalVoicesForLanguage:(id)a3 reply:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "installedAssetsForType:voicename:language:gender:footprint:", 0, 0, v5, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "voiceData", (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    v6[2](v6, v7, 0);
  }

}

- (void)getLocalVoiceResourcesReply:(id)a3
{
  void *v3;
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;

  if (a3)
  {
    v3 = (void *)MEMORY[0x24BEC0DA0];
    v4 = (void (**)(id, id, _QWORD))a3;
    objc_msgSend(v3, "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installedVoiceResources");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v6, 0);
  }
}

- (void)setSubscribedVoiceAssets:(id)a3 withClientID:(id)a4 forAccessoryID:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  VSDownloadService *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  void *v46;
  id v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
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
  uint8_t buf[4];
  id v66;
  __int16 v67;
  NSObject *v68;
  __int16 v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v52 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && !-[VSHHManagementClient isExistingAccessoryId:](self->_hubManagementClient, "isExistingAccessoryId:", v9))
  {
    VSGetLogDefault();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v66 = v8;
      v67 = 2112;
      v68 = v9;
      _os_log_error_impl(&dword_21AA84000, v41, OS_LOG_TYPE_ERROR, "ignored client '%{public}@' setting auto-download for a non-existing accessoryId '%@'", buf, 0x16u);
    }
  }
  else
  {
    v43 = v9;
    -[NSObject UUIDString](v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &stru_24DD8EF88;
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    objc_msgSend(MEMORY[0x24BEC0DC8], "defaultInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v13;
    v45 = v8;
    objc_msgSend(v14, "subscribedVoicesForClientID:accessoryID:", v8, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v15;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
    if (v16)
    {
      v17 = v16;
      v50 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v62 != v50)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "voice");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v20 = v52;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v58;
            while (2)
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v58 != v23)
                  objc_enumerationMutation(v20);
                objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "dictionaryRepresentation");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "dictionaryRepresentation");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v25, "isEqualToDictionary:", v26);

                if ((v27 & 1) != 0)
                {

                  goto LABEL_20;
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
              if (v22)
                continue;
              break;
            }
          }

          objc_msgSend(v46, "addObject:", v19);
LABEL_20:

        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v73, 16);
      }
      while (v17);
    }

    objc_msgSend(MEMORY[0x24BEC0DC8], "defaultInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSubscribedVoices:forClientID:accessoryID:", v52, v45, v44);

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v47 = v52;
    v29 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
    if (v29)
    {
      v30 = v29;
      v49 = *(_QWORD *)v54;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v54 != v49)
            objc_enumerationMutation(v47);
          v32 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * k);
          v33 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v32, "languages");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "name");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEC0E20], "typeStringFromType:", objc_msgSend(v32, "type"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BEC0E20], "footprintStringFromFootprint:", objc_msgSend(v32, "footprint"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringWithFormat:", CFSTR("%@:%@:%@:%@"), v35, v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v39);

        }
        v30 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v53, v71, 16);
      }
      while (v30);
    }

    VSGetLogDefault();
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = v44;
    v8 = v45;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v66 = v45;
      v67 = 2112;
      v68 = v44;
      v69 = 2114;
      v70 = v51;
      _os_log_impl(&dword_21AA84000, v40, OS_LOG_TYPE_DEFAULT, "client '%{public}@' and accessory '%@' set auto download voice assets:%{public}@", buf, 0x20u);
    }

    v42 = -[VSDownloadService initWithType:]([VSDownloadService alloc], "initWithType:", 2);
    -[VSDownloadService cancelDownloadForAssets:](v42, "cancelDownloadForAssets:", v46);
    -[VSDownloadService updateVoicesAndVoiceResources](v42, "updateVoicesAndVoiceResources");

    v9 = v43;
  }

}

- (void)getSubscribedVoiceAssetsWithClientID:(id)a3 forAccessoryID:(id)a4 reply:(id)a5
{
  void *v7;
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  void *v14;
  id v15;

  if (a5)
  {
    v7 = (void *)MEMORY[0x24BEC0DC8];
    v8 = (void (**)(id, void *))a5;
    v9 = a4;
    v10 = a3;
    objc_msgSend(v7, "defaultInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;
    else
      v13 = &stru_24DD8EF88;
    objc_msgSend(v11, "subscribedVoicesForClientID:accessoryID:", v10, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "valueForKey:", CFSTR("voice"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v14);

  }
}

- (void)getAllVoiceSubscriptionsWithReply:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, void *);
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v28 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x24BEC0DC8], "defaultInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscribedVoicesForClientID:accessoryID:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v38;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(obj);
        v32 = v6;
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "voiceAssetsForSubscription:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v34;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v34 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v14), "voiceData");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "voice");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "name");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "length");

              if (v18)
              {
                objc_msgSend(v7, "voice");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "name");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setName:", v20);

              }
              objc_msgSend(v7, "voice");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "type");

              if (v22)
              {
                objc_msgSend(v7, "voice");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setType:", objc_msgSend(v23, "type"));

              }
              v24 = objc_alloc(MEMORY[0x24BEC0E38]);
              objc_msgSend(v7, "clientID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "accessoryID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = (void *)objc_msgSend(v24, "initWithClient:accessory:voice:", v25, v26, v15);

              objc_msgSend(v5, "addObject:", v27);
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v12);
        }

        v6 = v32 + 1;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v31);
  }

  v28[2](v28, v5);
}

- (void)triggerCellularDownloadedVoiceAssets:(id)a3 withClientID:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  VSGetLogDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v5;
    _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_DEFAULT, "Preparing cellular download for %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelDownloads:completion:", triggerCellularDownloadedVoiceAssets_withClientID__previousDownloads, 0);

  objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancelDownloads:completion:", v5, 0);

  objc_storeStrong((id *)&triggerCellularDownloadedVoiceAssets_withClientID__previousDownloads, a3);
  objc_msgSend(MEMORY[0x24BEC0DA0], "downloadOptionsWithBattery:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsCellularAccess:", 1);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        VSGetLogDefault();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v15;
          _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_DEFAULT, "Start cellular download for %@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "downloadVoiceAsset:options:progressUpdateHandler:", v15, v9, 0);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

}

- (void)getVoiceResourceForLanguage:(id)a3 reply:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "selectVoiceResourceAssetForLanguage:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
    v5[2](v5, v7);

  }
}

- (void)getVoiceInfoForLanguageCode:(id)a3 name:(id)a4 footprint:(int64_t)a5 gender:(int64_t)a6 type:(int64_t)a7 reply:(id)a8
{
  char *v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  char *v40;
  void *v41;
  uint64_t v42;
  const __CFString *v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v13 = (char *)a3;
  v14 = a4;
  v15 = (void (**)(id, _QWORD, void *))a8;
  VSGetLogDefault();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v13;
    v46 = 2112;
    v47 = v14;
    v48 = 2112;
    v49 = v17;
    _os_log_impl(&dword_21AA84000, v16, OS_LOG_TYPE_INFO, "Begin getVoiceInfoForLanguageCode: %{public}@, %@, %@", buf, 0x20u);

  }
  if (v15)
  {
    if (!v13)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v42 = *MEMORY[0x24BDD0FC8];
      v43 = CFSTR("Missing languageCode");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("VoiceServicesErrorDomain"), 100, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15[2](v15, 0, v22);
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x24BEC0DA0], "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectVoiceForLang:name:type:gender:footprint:", v13, v14, a7, a6, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "voiceData");
    v20 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject footprint](v20, "footprint") == 1)
    {

    }
    else
    {
      if (!v14)
      {
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v19, "voiceData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "name");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v14, "isEqual:", v24);

      if ((v25 & 1) != 0)
      {
LABEL_15:
        VSGetLogDefault();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v19, "voiceData");
          v40 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v45 = v40;
          _os_log_impl(&dword_21AA84000, v39, OS_LOG_TYPE_INFO, "End getVoiceInfoForLanguageCode: %@", buf, 0xCu);

        }
        objc_msgSend(v19, "voiceData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v15)[2](v15, v22, 0);
        goto LABEL_18;
      }
    }
    objc_msgSend(v19, "voiceData");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setGender:", a6);

    objc_msgSend(v19, "voiceData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setName:", v14);

    objc_msgSend(v19, "voiceData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFootprint:", 1);

    objc_msgSend(v19, "voiceData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setType:", 1);

    objc_msgSend(v19, "voiceData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setContentVersion:", &unk_24DD9BCA8);

    objc_msgSend(v19, "voiceData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "languages");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "firstObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "isEqualToString:", v13);

    if ((v34 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEC0E08], "fallbackLanguageForLanguage:", v13);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v41, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "voiceData");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setLanguages:", v36);

    }
    VSGetLogDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "voiceData");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v45 = "-[VSSpeechXPCHandler getVoiceInfoForLanguageCode:name:footprint:gender:type:reply:]";
      v46 = 2112;
      v47 = v38;
      _os_log_impl(&dword_21AA84000, v20, OS_LOG_TYPE_INFO, "%s override voice info for server TTS platform, %@", buf, 0x16u);

    }
    goto LABEL_14;
  }
LABEL_19:

}

- (void)forwardStreamObject:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "streamId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  VSGetLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "streamId");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v3;
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_21AA84000, v6, OS_LOG_TYPE_INFO, "Enqueue stream object %@, streamId: %@", (uint8_t *)&v9, 0x16u);

    }
    +[VSInlineStreamService sharedService](VSInlineStreamService, "sharedService");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "streamId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject enqueueStreamId:withObject:](v6, "enqueueStreamId:withObject:", v8, v3);

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_error_impl(&dword_21AA84000, v6, OS_LOG_TYPE_ERROR, "Ignore stream object with nil stream ID: %@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)invokeDaemon:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = (void (**)(id, _QWORD))a3;
  VSGetLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21AA84000, v4, OS_LOG_TYPE_DEFAULT, "Received invokeDaemon, I'm listening", v6, 2u);
  }

  if (v3)
  {
    v5 = getpid();
    v3[2](v3, v5);
  }

}

- (void)killDaemon
{
  NSObject *v2;
  uint8_t v3[16];

  VSGetLogDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21AA84000, v2, OS_LOG_TYPE_DEFAULT, "Received killDaemon, shutting down", v3, 2u);
  }

  exit(0);
}

- (NSString)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (void)setConnectionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_connectionIdentifier, a3);
}

- (VSHHManagementClient)hubManagementClient
{
  return self->_hubManagementClient;
}

- (void)setHubManagementClient:(id)a3
{
  objc_storeStrong((id *)&self->_hubManagementClient, a3);
}

- (VSHMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (void)setAudioPowerUpdateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_audioPowerUpdateQueue, a3);
}

- (void)setAudioPowerUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_audioPowerUpdater, a3);
}

- (OS_os_transaction)synthesizerTransaction
{
  return self->_synthesizerTransaction;
}

- (void)setSynthesizerTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_synthesizerTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesizerTransaction, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdateQueue, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_hubManagementClient, 0);
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
  objc_destroyWeak((id *)&self->_connection);
}

uint64_t __53__VSSpeechXPCHandler_beginAudioPowerUpdateWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__VSSpeechXPCHandler_startPhonemesRequest_phonemeSystem_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "phonemes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);

}

void __44__VSSpeechXPCHandler_startSynthesisRequest___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __54__VSSpeechXPCHandler_startPresynthesizedAudioRequest___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

uint64_t __47__VSSpeechXPCHandler_startSpeechRequest_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __56__VSSpeechXPCHandler_estimateDurationWithRequest_reply___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "estimatedDuration");
  v4 = v3;
  objc_msgSend(WeakRetained, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, double))(v2 + 16))(v2, v5, v4);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

+ (BOOL)isSiriClientBundleIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isSiriClientBundleIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isSiriClientBundleIdentifier__onceToken, &__block_literal_global_673);
  v5 = objc_msgSend((id)isSiriClientBundleIdentifier__siriClientBundleIdentifiers, "containsObject:", v4);

  return v5;
}

void __51__VSSpeechXPCHandler_isSiriClientBundleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DD9BC78);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isSiriClientBundleIdentifier__siriClientBundleIdentifiers;
  isSiriClientBundleIdentifier__siriClientBundleIdentifiers = v0;

}

@end
