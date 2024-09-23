@implementation SiriPresentationPineBoardMainScreenViewController

- (SiriPresentationPineBoardMainScreenViewController)initWithIdentifier:(int64_t)a3 hostedPresentationFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  SiriPresentationPineBoardMainScreenViewController *v8;
  SiriPresentationPineBoardMainScreenViewController *v9;
  objc_super v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SiriPresentationPineBoardMainScreenViewController;
  v8 = -[SiriPresentationViewController initWithIdentifier:hostedPresentationFrame:](&v11, sel_initWithIdentifier_hostedPresentationFrame_, a3);
  v9 = v8;
  if (v8)
  {
    -[SiriPresentationPineBoardMainScreenViewController _prewarmFlamesWithPresentationFrame:](v8, "_prewarmFlamesWithPresentationFrame:", x, y, width, height);
    v9->_shouldRequestDictation = 0;
    v9->_didRequestDictationStart = 0;
    v9->_shouldListenForSceneActivation = 0;
  }
  return v9;
}

- (void)_prewarmSiriVideoFlowDelegatePlugin
{
  NSObject *v3;
  AFClientLite *clientLite;
  AFClientLite *v5;
  AFClientLite *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SiriPresentationPineBoardMainScreenViewController _prewarmSiriVideoFlowDelegatePlugin]";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s #activation  _prewarmSiriVideoFlowDelegatePlugin", (uint8_t *)&v10, 0xCu);
  }
  clientLite = self->_clientLite;
  self->_clientLite = 0;

  v5 = (AFClientLite *)objc_alloc_init(MEMORY[0x24BE09130]);
  v6 = self->_clientLite;
  self->_clientLite = v5;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE813C0]), "initWithBundleIdentifier:", CFSTR("com.apple.siri.VideoFlowDelegatePlugin"));
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAceId:", v9);

  -[AFClientLite handleCommand:commandHandler:completion:](self->_clientLite, "handleCommand:commandHandler:completion:", v7, 0, &__block_literal_global_0);
}

void __88__SiriPresentationPineBoardMainScreenViewController__prewarmSiriVideoFlowDelegatePlugin__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  if (v4 || !a2)
  {
    if (v6)
    {
      v10 = 136315394;
      v11 = "-[SiriPresentationPineBoardMainScreenViewController _prewarmSiriVideoFlowDelegatePlugin]_block_invoke";
      v12 = 2112;
      v13 = v4;
      v7 = "%s #activation _prewarmSiriVideoFlowDelegatePlugin failed with error: %@";
      v8 = v5;
      v9 = 22;
      goto LABEL_7;
    }
  }
  else if (v6)
  {
    v10 = 136315138;
    v11 = "-[SiriPresentationPineBoardMainScreenViewController _prewarmSiriVideoFlowDelegatePlugin]_block_invoke";
    v7 = "%s #activation _prewarmSiriVideoFlowDelegatePlugin successful";
    v8 = v5;
    v9 = 12;
LABEL_7:
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
  }

}

- (void)_prewarmFlamesWithPresentationFrame:(CGRect)a3
{
  SiriUIInvokeOnMainQueue();
}

uint64_t __89__SiriPresentationPineBoardMainScreenViewController__prewarmFlamesWithPresentationFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prewarmMetalLayers");
}

- (BOOL)_shouldShowSetupViewController
{
  return 0;
}

- (void)siriViewController:(id)a3 didChangePresentationPeekMode:(unint64_t)a4
{
  void *v6;
  int v7;
  id v8;

  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_254E17240);

  if (v7)
  {
    -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "siriPresentation:didChangePresentationPeekMode:", self, a4);

  }
}

- (void)siriViewController:(id)a3 didChangePresentationVisualState:(unint64_t)a4
{
  id v6;

  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "siriPresentation:didChangePresentationVisualState:", self, a4);

}

- (id)siriViewController:(id)a3 willStartRequestWithOptions:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  os_log_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  OS_dispatch_group *requestDictationFromSiriGroup;
  OS_dispatch_group *v29;
  OS_dispatch_group *v30;
  os_log_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  _QWORD v41[4];
  id v42;
  id v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    v46 = 2112;
    v47 = (uint64_t)v7;
    _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  v10 = v7;
  objc_msgSend(v10, "setUseAutomaticEndpointing:", 0);
  objc_msgSend(v10, "setUseStreamingDictation:", 1);
  objc_msgSend(v10, "requestInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "afui_isRemoteHeadsetActivation") & 1) != 0)
  {

  }
  else
  {
    v12 = objc_msgSend(v10, "afui_isTVFollowUpHearstActivation");

    if ((v12 & 1) == 0)
      goto LABEL_9;
  }
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #tv Automatic endpointing for hearst request and server command in multi-turn", buf, 0xCu);
  }
  objc_msgSend(v10, "setUseAutomaticEndpointing:", 1);
LABEL_9:
  objc_msgSend(v10, "setReleaseAudioSessionOnRecordingCompletion:", 1);
  -[SiriPresentationViewController _updateRequestOptionsWithTestingInput:](self, "_updateRequestOptionsWithTestingInput:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "activationDeviceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)MEMORY[0x24BDD17F0];
    v18 = v16;
    objc_msgSend(v17, "currentThread");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "qualityOfService");
    *(_DWORD *)buf = 136315394;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    v46 = 2048;
    v47 = v20;
    _os_log_impl(&dword_215D55000, v18, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  v21 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    _os_log_impl(&dword_215D55000, v21, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", buf, 0xCu);
  }
  v22 = objc_msgSend(v14, "inputType");
  v23 = (objc_msgSend(v14, "isShortButtonPressAction") & 1) == 0
     && objc_msgSend(v14, "requestSource") != 35
     && objc_msgSend(v14, "requestSource") != 23
     && objc_msgSend(v15, "length") != 0;
  self->_shouldRequestDictation = v22 == v23;
  os_unfair_lock_unlock(&self->_dictationInProgressLock);
  v24 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    _os_log_impl(&dword_215D55000, v24, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", buf, 0xCu);
  }
  v25 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v26 = v25;
    NSStringFromBOOL();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
    v46 = 2112;
    v47 = (uint64_t)v27;
    _os_log_impl(&dword_215D55000, v26, OS_LOG_TYPE_DEFAULT, "%s #activation Should start Dictation - %@", buf, 0x16u);

  }
  if (self->_shouldRequestDictation)
  {
    requestDictationFromSiriGroup = self->_requestDictationFromSiriGroup;
    self->_requestDictationFromSiriGroup = 0;

    v29 = (OS_dispatch_group *)dispatch_group_create();
    v30 = self->_requestDictationFromSiriGroup;
    self->_requestDictationFromSiriGroup = v29;

    if (objc_msgSend(v14, "isInitialBringUp"))
    {
      dispatch_group_enter((dispatch_group_t)self->_requestDictationFromSiriGroup);
      v31 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)MEMORY[0x24BDD17F0];
        v33 = v31;
        objc_msgSend(v32, "currentThread");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "qualityOfService");
        *(_DWORD *)buf = 136315394;
        v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
        v46 = 2048;
        v47 = v35;
        _os_log_impl(&dword_215D55000, v33, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", buf, 0x16u);

      }
      os_unfair_lock_lock(&self->_dictationInProgressLock);
      v36 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
        _os_log_impl(&dword_215D55000, v36, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", buf, 0xCu);
      }
      self->_shouldListenForSceneActivation = 1;
      os_unfair_lock_unlock(&self->_dictationInProgressLock);
      v37 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
        _os_log_impl(&dword_215D55000, v37, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", buf, 0xCu);
      }
    }
    dispatch_group_enter((dispatch_group_t)self->_requestDictationFromSiriGroup);
    objc_initWeak((id *)buf, self);
    v38 = self->_requestDictationFromSiriGroup;
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __100__SiriPresentationPineBoardMainScreenViewController_siriViewController_willStartRequestWithOptions___block_invoke;
    v41[3] = &unk_24D47A5A8;
    objc_copyWeak(&v43, (id *)buf);
    v42 = v15;
    dispatch_group_notify(v38, MEMORY[0x24BDAC9B8], v41);

    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v39 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]";
      _os_log_impl(&dword_215D55000, v39, OS_LOG_TYPE_DEFAULT, "%s #activation sending command to warm up VideoFlowDelegatePlugin", buf, 0xCu);
    }
    -[SiriPresentationPineBoardMainScreenViewController _prewarmSiriVideoFlowDelegatePlugin](self, "_prewarmSiriVideoFlowDelegatePlugin");
  }

  return v14;
}

void __100__SiriPresentationPineBoardMainScreenViewController_siriViewController_willStartRequestWithOptions___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (os_log_t *)MEMORY[0x24BE08FB0];
    v4 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x24BDD17F0];
      v6 = v4;
      objc_msgSend(v5, "currentThread");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]_block_invoke";
      v13 = 2048;
      v14 = objc_msgSend(v7, "qualityOfService");
      _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v11, 0x16u);

    }
    os_unfair_lock_lock(WeakRetained + 352);
    v8 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]_block_invoke";
      _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_dictationInProgressLock successfully locked", (uint8_t *)&v11, 0xCu);
    }
    if (BYTE2(WeakRetained[353]._os_unfair_lock_opaque))
    {
      -[os_unfair_lock_s _forwardHIDButtonEventWithUsagePage:usage:type:senderID:](WeakRetained, "_forwardHIDButtonEventWithUsagePage:usage:type:senderID:", 12, 4, 0, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
      LOBYTE(WeakRetained[353]._os_unfair_lock_opaque) = 1;
      BYTE2(WeakRetained[353]._os_unfair_lock_opaque) = 0;
      v9 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315138;
        v12 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]_block_invoke";
        _os_log_impl(&dword_215D55000, v9, OS_LOG_TYPE_DEFAULT, "%s #activation Forwarded Dictation Start Event to BackBoard", (uint8_t *)&v11, 0xCu);
      }
    }
    os_unfair_lock_unlock(WeakRetained + 352);
    v10 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:willStartRequestWithOptions:]_block_invoke";
      _os_log_impl(&dword_215D55000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy strongSelf->_dictationInProgressLock unlocked", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void)siriViewController:(id)a3 didReceiveButtonUpWithRequestOptions:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 didRequestDictationStart;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  OS_dispatch_group *requestDictationFromSiriGroup;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BE08FB0];
  v9 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)MEMORY[0x24BDD17F0];
    v11 = v9;
    objc_msgSend(v10, "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315394;
    v20 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:didReceiveButtonUpWithRequestOptions:]";
    v21 = 2048;
    v22 = objc_msgSend(v12, "qualityOfService");
    _os_log_impl(&dword_215D55000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v19, 0x16u);

  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  v13 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:didReceiveButtonUpWithRequestOptions:]";
    _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", (uint8_t *)&v19, 0xCu);
  }
  didRequestDictationStart = self->_didRequestDictationStart;
  self->_shouldRequestDictation = 0;
  self->_didRequestDictationStart = 0;
  os_unfair_lock_unlock(&self->_dictationInProgressLock);
  v15 = *v8;
  if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:didReceiveButtonUpWithRequestOptions:]";
    _os_log_impl(&dword_215D55000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", (uint8_t *)&v19, 0xCu);
  }
  if (didRequestDictationStart)
  {
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315138;
      v20 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:didReceiveButtonUpWithRequestOptions:]";
      _os_log_impl(&dword_215D55000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation Forwarding Dictation stop event to BackBoard", (uint8_t *)&v19, 0xCu);
    }
    objc_msgSend(v7, "activationDeviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriPresentationPineBoardMainScreenViewController _forwardHIDButtonEventWithUsagePage:usage:type:senderID:](self, "_forwardHIDButtonEventWithUsagePage:usage:type:senderID:", 12, 4, 1, objc_msgSend(v17, "longLongValue"));

  }
  requestDictationFromSiriGroup = self->_requestDictationFromSiriGroup;
  self->_requestDictationFromSiriGroup = 0;

}

- (void)siriViewControllerDidPresentKeyboard:(id)a3
{
  id v4;
  os_log_t *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 shouldRequestDictation;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x24BE08FB0];
  v6 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)MEMORY[0x24BDD17F0];
    v8 = v6;
    objc_msgSend(v7, "currentThread");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidPresentKeyboard:]";
    v16 = 2048;
    v17 = objc_msgSend(v9, "qualityOfService");
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v14, 0x16u);

  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  v10 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidPresentKeyboard:]";
    _os_log_impl(&dword_215D55000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", (uint8_t *)&v14, 0xCu);
  }
  if (self->_requestDictationFromSiriGroup)
    shouldRequestDictation = self->_shouldRequestDictation;
  else
    shouldRequestDictation = 0;
  os_unfair_lock_unlock(&self->_dictationInProgressLock);
  v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidPresentKeyboard:]";
    _os_log_impl(&dword_215D55000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", (uint8_t *)&v14, 0xCu);
  }
  if (shouldRequestDictation)
  {
    v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 136315138;
      v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidPresentKeyboard:]";
      _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation Keyboard Ready to Start Dictation", (uint8_t *)&v14, 0xCu);
    }
    dispatch_group_leave((dispatch_group_t)self->_requestDictationFromSiriGroup);
  }

}

- (void)siriViewController:(id)a3 sceneDidActivateWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "siriPresentation:sceneDidActivateWithIdentifier:", self, v5);
  v7 = (os_log_t *)MEMORY[0x24BE08FB0];
  v8 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x24BDD17F0];
    v10 = v8;
    objc_msgSend(v9, "currentThread");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315394;
    v17 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:sceneDidActivateWithIdentifier:]";
    v18 = 2048;
    v19 = objc_msgSend(v11, "qualityOfService");
    _os_log_impl(&dword_215D55000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v16, 0x16u);

  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:sceneDidActivateWithIdentifier:]";
    _os_log_impl(&dword_215D55000, v12, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", (uint8_t *)&v16, 0xCu);
  }
  if (self->_requestDictationFromSiriGroup && self->_shouldRequestDictation && self->_shouldListenForSceneActivation)
  {
    self->_shouldListenForSceneActivation = 0;
    v13 = 1;
  }
  else
  {
    v13 = 0;
  }
  os_unfair_lock_unlock(&self->_dictationInProgressLock);
  v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:sceneDidActivateWithIdentifier:]";
    _os_log_impl(&dword_215D55000, v14, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock unlocked", (uint8_t *)&v16, 0xCu);
  }
  if (v13)
  {
    v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[SiriPresentationPineBoardMainScreenViewController siriViewController:sceneDidActivateWithIdentifier:]";
      _os_log_impl(&dword_215D55000, v15, OS_LOG_TYPE_DEFAULT, "%s #activation Scene Activated & ready to start dictation", (uint8_t *)&v16, 0xCu);
    }
    dispatch_group_leave((dispatch_group_t)self->_requestDictationFromSiriGroup);
  }

}

- (void)siriViewControllerDidDeactivateScene:(id)a3
{
  id v4;

  -[SiriPresentationViewController siriPresentationControllerDelegate](self, "siriPresentationControllerDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "siriPresentationDidDeactivateScene:", self);

}

- (void)siriViewControllerDidChangeToListeningMode:(id)a3
{
  double v4;
  double v5;
  double v6;
  os_log_t *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SiriPresentationPineBoardMainScreenViewController _buttonDownTimestamp](self, "_buttonDownTimestamp", a3);
  if (v4 > 0.0)
  {
    CFAbsoluteTimeGetCurrent();
    SiriSystemUpTimeFromCFAbsoluteCurrentTime();
    v6 = v5 - self->_buttonDownTimestamp;
    v7 = (os_log_t *)MEMORY[0x24BE08FB0];
    v8 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)MEMORY[0x24BDD16E0];
      v10 = v8;
      objc_msgSend(v9, "numberWithDouble:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidChangeToListeningMode:]";
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_215D55000, v10, OS_LOG_TYPE_DEFAULT, "%s #activation Launch time (button.down - listening): %@", (uint8_t *)&v14, 0x16u);

    }
    -[SiriPresentationPineBoardMainScreenViewController _thresholdForTriggeringABCInLaunch](self, "_thresholdForTriggeringABCInLaunch");
    if (v6 >= v12)
    {
      v13 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136315138;
        v15 = "-[SiriPresentationPineBoardMainScreenViewController siriViewControllerDidChangeToListeningMode:]";
        _os_log_impl(&dword_215D55000, v13, OS_LOG_TYPE_DEFAULT, "%s #activation Triggering ABC for launch time >= 2.5 seconds", (uint8_t *)&v14, 0xCu);
      }
      -[SiriPresentationViewController _logSignatureWithType:subType:context:](self, "_logSignatureWithType:subType:context:", CFSTR("tvos_launch_performance"), CFSTR("tvos_long_launch_time"), 0);
    }
  }
}

- (double)_thresholdForTriggeringABCInLaunch
{
  return 2.5;
}

- (void)setNextVoiceRecognitionAudioInputPaths:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id obj;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SiriPresentationPineBoardMainScreenViewController setNextVoiceRecognitionAudioInputPaths:]";
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  -[SiriPresentationViewController _clearAllTestingInputs](self, "_clearAllTestingInputs");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = MEMORY[0x24BDAC760];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc(MEMORY[0x24BE90808]);
        v16[0] = v9;
        v16[1] = 3221225472;
        v16[2] = __92__SiriPresentationPineBoardMainScreenViewController_setNextVoiceRecognitionAudioInputPaths___block_invoke;
        v16[3] = &unk_24D47A5D0;
        v17 = v11;
        v13 = v11;
        v14 = (void *)objc_msgSend(v12, "initWithBuilder:", v16);
        -[SiriPresentationViewController _enqueueTestInput:](self, "_enqueueTestInput:", v14);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

}

void __92__SiriPresentationPineBoardMainScreenViewController_setNextVoiceRecognitionAudioInputPaths___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setType:", 2);
  objc_msgSend(v3, "setRecordedSpeechURL:", *(_QWORD *)(a1 + 32));

}

- (void)setNextAssistantRecognitionStrings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[SiriPresentationPineBoardMainScreenViewController setNextAssistantRecognitionStrings:]";
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_215D55000, v5, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  -[SiriPresentationViewController _clearAllTestingInputs](self, "_clearAllTestingInputs");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x24BE90808]);
        v15[0] = v10;
        v15[1] = 3221225472;
        v15[2] = __88__SiriPresentationPineBoardMainScreenViewController_setNextAssistantRecognitionStrings___block_invoke;
        v15[3] = &unk_24D47A5D0;
        v15[4] = v12;
        v14 = (void *)objc_msgSend(v13, "initWithBuilder:", v15);
        -[SiriPresentationViewController _enqueueTestInput:](self, "_enqueueTestInput:", v14);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

void __88__SiriPresentationPineBoardMainScreenViewController_setNextAssistantRecognitionStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setType:", 1);
  objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 32));

}

- (void)_forwardHIDButtonEventWithUsagePage:(unsigned int)a3 usage:(unsigned int)a4 type:(int64_t)a5 senderID:(unint64_t)a6
{
  const void *KeyboardEvent;
  id v8;

  objc_msgSend(MEMORY[0x24BE0B690], "keyboardFocusEnvironment");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a5 <= 1)
  {
    mach_absolute_time();
    KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
    IOHIDEventSetSenderID();
    BKSHIDEventSendToResolvedProcessForDeferringEnvironment();
    CFRelease(KeyboardEvent);
  }

}

- (BOOL)_getValueForShouldRequestDictation
{
  os_log_t *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (os_log_t *)MEMORY[0x24BE08FB0];
  v4 = (void *)*MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)MEMORY[0x24BDD17F0];
    v6 = v4;
    objc_msgSend(v5, "currentThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[SiriPresentationPineBoardMainScreenViewController _getValueForShouldRequestDictation]";
    v12 = 2048;
    v13 = objc_msgSend(v7, "qualityOfService");
    _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock about to lock with qos: %zd", (uint8_t *)&v10, 0x16u);

  }
  os_unfair_lock_lock(&self->_dictationInProgressLock);
  v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SiriPresentationPineBoardMainScreenViewController _getValueForShouldRequestDictation]";
    _os_log_impl(&dword_215D55000, v8, OS_LOG_TYPE_DEFAULT, "%s #activation #locks #noisy _dictationInProgressLock successfully locked", (uint8_t *)&v10, 0xCu);
  }
  return self->_shouldRequestDictation;
}

- (double)_buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void)_setButtonDownTimestamp:(double)a3
{
  self->_buttonDownTimestamp = a3;
}

- (AFClientLite)clientLite
{
  return self->_clientLite;
}

- (void)setClientLite:(id)a3
{
  objc_storeStrong((id *)&self->_clientLite, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientLite, 0);
  objc_storeStrong((id *)&self->_requestDictationFromSiriGroup, 0);
}

@end
