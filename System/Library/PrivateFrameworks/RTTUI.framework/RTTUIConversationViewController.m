@implementation RTTUIConversationViewController

+ (id)viewControllerForCall:(id)a3
{
  id v3;
  RTTUIConversationViewController *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(RTTUIConversationViewController);
  +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConversationController:", v4);

  -[RTTUIConversationViewController setCall:](v4, "setCall:", v3);
  return v4;
}

+ (id)viewControllerForConversation:(id)a3
{
  id v3;
  RTTUIConversationViewController *v4;
  void *v5;
  uint64_t v6;
  TUCall *call;

  v3 = a3;
  v4 = objc_alloc_init(RTTUIConversationViewController);
  -[RTTUIConversationViewController setConversation:](v4, "setConversation:", v3);
  +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addConversationController:", v4);

  if (_AXSInUnitTestMode())
  {
    objc_msgSend(v3, "call");
    v6 = objc_claimAutoreleasedReturnValue();
    call = v4->_call;
    v4->_call = (TUCall *)v6;

  }
  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RTTUIConversationViewController)init
{
  RTTUIConversationViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  AXDispatchTimer *realTimeTimeout;
  uint64_t v11;
  AXDispatchTimer *muteStatusTimeout;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *serviceUpdates;
  id v18;
  _QWORD handler[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)RTTUIConversationViewController;
  v2 = -[RTTUIConversationViewController init](&v24, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_callDidConnect_, *MEMORY[0x24BEB4AB8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_callDidConnect_, *MEMORY[0x24BEB4B28], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_callDidConnect_, *MEMORY[0x24BEB4AE0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_updateCallHold_, *MEMORY[0x24BEB4B00], 0);

    v7 = objc_alloc(MEMORY[0x24BDFE490]);
    v8 = (void *)MEMORY[0x24BDAC9B8];
    v9 = objc_msgSend(v7, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    realTimeTimeout = v2->_realTimeTimeout;
    v2->_realTimeTimeout = (AXDispatchTimer *)v9;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_realTimeTimeout, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDFE490]), "initWithTargetSerialQueue:", v8);
    muteStatusTimeout = v2->_muteStatusTimeout;
    v2->_muteStatusTimeout = (AXDispatchTimer *)v11;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_muteStatusTimeout, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __39__RTTUIConversationViewController_init__block_invoke;
    v21[3] = &unk_24D657AC8;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v13, "registerUpdateBlock:forRetrieveSelector:withListener:", v21, sel_ttyShouldBeRealtime, v2);

    v15 = objc_opt_new();
    serviceUpdates = v2->_serviceUpdates;
    v2->_serviceUpdates = (NSMutableArray *)v15;

    handler[0] = v14;
    handler[1] = 3221225472;
    handler[2] = __39__RTTUIConversationViewController_init__block_invoke_2;
    handler[3] = &unk_24D657AF0;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch("com.apple.springboard.passcodeLockedOrBlocked", &v2->_lockStateNotifyToken, MEMORY[0x24BDAC9B8], handler);

    objc_copyWeak(&v18, &location);
    AXPerformBlockOnMainThreadAfterDelay();
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __39__RTTUIConversationViewController_init__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateGAButton");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setTextViewUtterance:", &stru_24D658230);

}

void __39__RTTUIConversationViewController_init__block_invoke_2(uint64_t a1, int token)
{
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  uint64_t state64;
  uint8_t buf[4];
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  state64 = 0;
  notify_get_state(token, &state64);
  v3 = state64;
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v3 != 0;
    _os_log_impl(&dword_216E9C000, v4, OS_LOG_TYPE_INFO, "Device lock state changed: %d", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateDeviceLockStatus:", v3 != 0);

}

void __39__RTTUIConversationViewController_init__block_invoke_212(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  uint64_t v5;
  int out_token;
  uint8_t buf[4];
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  out_token = 0;
  notify_register_check("com.apple.springboard.passcodeLockedOrBlocked", &out_token);
  v5 = 0;
  notify_get_state(out_token, &v5);
  v2 = v5;
  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v8 = v2 != 0;
    _os_log_impl(&dword_216E9C000, v3, OS_LOG_TYPE_INFO, "Initial device lock state: %d", buf, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateDeviceLockStatus:", v2 != 0);

}

- (id)inputTextView
{
  return self->_textView;
}

- (void)setCall:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSDictionary *asciiSubstitutions;
  NSMutableCharacterSet *v10;
  NSMutableCharacterSet *unsupportedCharacterSet;
  NSMutableCharacterSet *v12;
  NSMutableCharacterSet *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  RTTUIConversationViewController *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!self->_conversation)
  {
    AXLogRTT();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = self;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_216E9C000, v6, OS_LOG_TYPE_INFO, "%@: No initial conversation, requesting conversation: %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, self);
    v7 = (void *)MEMORY[0x24BE7CB50];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __43__RTTUIConversationViewController_setCall___block_invoke;
    v15[3] = &unk_24D657B40;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v7, "conversationWithCall:withCallback:", v5, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  objc_storeStrong((id *)&self->_call, a3);
  v8 = objc_msgSend(v5, "supportsTTYWithVoice");
  asciiSubstitutions = self->_asciiSubstitutions;
  if (v8)
  {
    self->_asciiSubstitutions = (NSDictionary *)&unk_24D65DAF0;

    objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithCharactersInString:", CFSTR("\n"));
    v10 = (NSMutableCharacterSet *)objc_claimAutoreleasedReturnValue();
    unsupportedCharacterSet = self->_unsupportedCharacterSet;
    self->_unsupportedCharacterSet = v10;

  }
  else
  {
    self->_asciiSubstitutions = (NSDictionary *)&unk_24D65DB18;

    objc_msgSend(MEMORY[0x24BDD1690], "characterSetWithRange:", 32, 95);
    v12 = (NSMutableCharacterSet *)objc_claimAutoreleasedReturnValue();
    v13 = self->_unsupportedCharacterSet;
    self->_unsupportedCharacterSet = v12;

    -[NSMutableCharacterSet invert](self->_unsupportedCharacterSet, "invert");
  }
  -[RTTUIConversationViewController updateBarButtons](self, "updateBarButtons");
  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setShouldSuppressIncomingNotification:", -[RTTUIConversationViewController isCurrentCallConnected](self, "isCurrentCallConnected"));

}

void __43__RTTUIConversationViewController_setCall___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  AXPerformBlockOnMainThreadAfterDelay();

  objc_destroyWeak(&v5);
}

void __43__RTTUIConversationViewController_setCall___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  id WeakRetained;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setConversation:", v2);

  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reloadData");

  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_216E9C000, v7, OS_LOG_TYPE_INFO, "Received conversation: %@", (uint8_t *)&v13, 0xCu);
  }

  v9 = objc_loadWeakRetained(v3);
  objc_msgSend(v9, "rttConversationAvailabilityCallback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_loadWeakRetained(v3);
    objc_msgSend(v11, "rttConversationAvailabilityCallback");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, *(_QWORD *)(a1 + 32));

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldSuppressIncomingNotification:", 0);

  -[RTTUIConversationViewController setLookupController:](self, "setLookupController:", 0);
  -[BSInvalidatable invalidate](self->_sleepTimerDisabledAssertion, "invalidate");
  notify_cancel(self->_lockStateNotifyToken);
  v4.receiver = self;
  v4.super_class = (Class)RTTUIConversationViewController;
  -[RTTUIConversationViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RTTUIConversationViewController;
  -[RTTUIConversationViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[RTTUIConversationViewController setupTableView](self, "setupTableView");
  -[RTTUIConversationViewController callDidConnect:](self, "callDidConnect:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  RTTUIConversationViewController *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "RTT view controller will appear: %@", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)RTTUIConversationViewController;
  -[RTTUIConversationViewController viewWillAppear:](&v14, sel_viewWillAppear_, v3);
  if (-[RTTUIConversationViewController isCurrentCallConnected](self, "isCurrentCallConnected"))
  {
    -[RTTUIConversationViewController call](self, "call");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "status");

    if (v7 != 1)
    {
LABEL_14:
      objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShouldSuppressIncomingNotification:", 1);

      return;
    }
    if (!-[RTTUIConversationViewController isIncomingScreeningCall](self, "isIncomingScreeningCall"))
    {
      -[RTTUITextView becomeFirstResponder](self->_textView, "becomeFirstResponder");
      -[RTTUITextView updateTTYBar](self->_textView, "updateTTYBar");
    }
    -[RTTUIConversationViewController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "utterances");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTUIConversationViewController call](self, "call");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v11)
      && objc_msgSend(v10, "isMe")
      && (objc_msgSend(v10, "isComplete") & 1) == 0)
    {
      v12 = objc_msgSend(v10, "hasTimedOut");

      if ((v12 & 1) != 0)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v10, "text");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTUIConversationViewController setTextViewUtterance:](self, "setTextViewUtterance:", v11);
    }

    goto LABEL_13;
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  RTTUIConversationViewController *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = self;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "RTT view controller will disappear: %@", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)RTTUIConversationViewController;
  -[RTTUIConversationViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  -[RTTUITextView overrideTTYPredictionsHidden:](self->_textView, "overrideTTYPredictionsHidden:", 1);
  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldSuppressIncomingNotification:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BSInvalidatable *sleepTimerDisabledAssertion;
  BSInvalidatable *v10;
  objc_super v11;
  uint8_t buf[4];
  RTTUIConversationViewController *v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "RTT view controller disappeared: %@", buf, 0xCu);
  }

  v11.receiver = self;
  v11.super_class = (Class)RTTUIConversationViewController;
  -[RTTUIConversationViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, v3);
  if (soft_AXProcessIsInCallService())
  {
    objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIConversationViewController call](self, "call");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setViewControllerIsVisible:withCallID:", 0, v8);

  }
  sleepTimerDisabledAssertion = self->_sleepTimerDisabledAssertion;
  if (sleepTimerDisabledAssertion)
  {
    -[BSInvalidatable invalidate](sleepTimerDisabledAssertion, "invalidate");
    v10 = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = 0;

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *sleepTimerDisabledAssertion;
  objc_super v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  __int128 buf;
  Class (*v20)(uint64_t);
  void *v21;
  uint64_t *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "RTT view controller appeared: %@", (uint8_t *)&buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)RTTUIConversationViewController;
  -[RTTUIConversationViewController viewDidAppear:](&v14, sel_viewDidAppear_, v3);
  if (soft_AXProcessIsInCallService())
  {
    objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIConversationViewController call](self, "call");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "callUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setViewControllerIsVisible:withCallID:", 1, v8);

  }
  if (!self->_sleepTimerDisabledAssertion)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2050000000;
    v9 = (void *)getAXUserEventTimerClass_softClass;
    v18 = getAXUserEventTimerClass_softClass;
    if (!getAXUserEventTimerClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v20 = __getAXUserEventTimerClass_block_invoke;
      v21 = &unk_24D657DD0;
      v22 = &v15;
      __getAXUserEventTimerClass_block_invoke((uint64_t)&buf);
      v9 = (void *)v16[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v15, 8);
    objc_msgSend(v10, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "acquireAssertionToDisableIdleTimerWithReason:", CFSTR("RealTimeText"));
    v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    sleepTimerDisabledAssertion = self->_sleepTimerDisabledAssertion;
    self->_sleepTimerDisabledAssertion = v12;

  }
  -[RTTUIConversationViewController updateBarButtons](self, "updateBarButtons");
}

- (void)updateDeviceLockStatus:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[16];

  v3 = a3;
  if (-[RTTUIConversationViewController isIncomingScreeningCall](self, "isIncomingScreeningCall") && v3)
  {
    AXLogRTT();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "Springboard locked", buf, 2u);
    }

    -[RTTUIConversationViewController addServiceCellWithUpdate:options:](self, "addServiceCellWithUpdate:options:", *MEMORY[0x24BE7CBA0], 0);
  }
  else
  {
    -[RTTUIConversationViewController removeServiceCellWithUpdate:](self, "removeServiceCellWithUpdate:", *MEMORY[0x24BE7CBA0]);
  }
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDF6F90];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__RTTUIConversationViewController_updateDeviceLockStatus___block_invoke;
  v9[3] = &unk_24D6579F8;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performWithoutAnimation:", v9);

}

void __58__RTTUIConversationViewController_updateDeviceLockStatus___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSections:withRowAnimation:", *(_QWORD *)(a1 + 40), 100);

}

- (void)updateCallDowngradeStatus
{
  NSObject *v3;
  void *v4;
  int v5;
  uint8_t v6[16];

  if (-[RTTUIConversationViewController currentCallIsDowngraded](self, "currentCallIsDowngraded"))
  {
    AXLogRTT();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_216E9C000, v3, OS_LOG_TYPE_INFO, "Call downgraded", v6, 2u);
    }

    -[RTTUIConversationViewController addServiceCellWithUpdate:options:](self, "addServiceCellWithUpdate:options:", *MEMORY[0x24BE7CB88], 0);
    -[RTTUIConversationViewController call](self, "call");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUplinkMuted");

    if (v5)
      -[RTTUIConversationViewController toggleMute:](self, "toggleMute:", 0);
  }
  else
  {
    -[RTTUIConversationViewController removeServiceCellWithUpdate:](self, "removeServiceCellWithUpdate:", *MEMORY[0x24BE7CB88]);
  }
  -[RTTUIConversationViewController updateInputEnabled](self, "updateInputEnabled");
}

- (void)callDidConnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  _QWORD v23[7];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__0;
  v40 = __Block_byref_object_dispose__0;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  v29 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __50__RTTUIConversationViewController_callDidConnect___block_invoke;
  v23[3] = &unk_24D657B68;
  v23[4] = &v36;
  v23[5] = &v30;
  v23[6] = &v24;
  objc_msgSend(MEMORY[0x24BE7CB70], "performCallCenterTask:", v23);
  AXLogRTT();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[RTTUIConversationViewController call](self, "call");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v43 = v6;
    _os_log_impl(&dword_216E9C000, v5, OS_LOG_TYPE_INFO, "Call did connect %@", buf, 0xCu);

  }
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)v37[5];
    *(_DWORD *)buf = 138412290;
    v43 = v8;
    _os_log_impl(&dword_216E9C000, v7, OS_LOG_TYPE_INFO, "Current call list %@", buf, 0xCu);
  }

  -[RTTUIConversationViewController call](self, "call");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "status");

  if (-[RTTUIConversationViewController isCurrentCallConnected](self, "isCurrentCallConnected"))
  {
    if (objc_msgSend((id)v31[5], "count") || objc_msgSend((id)v25[5], "count"))
    {
      -[RTTUIConversationViewController navigationController](self, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);
    }
    else
    {
      -[RTTUIConversationViewController updateCallDowngradeStatus](self, "updateCallDowngradeStatus");
      if (-[RTTUIConversationViewController currentCallIsDowngraded](self, "currentCallIsDowngraded"))
        goto LABEL_14;
      +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTUIConversationViewController call](self, "call");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "callUUID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "registerForCallUpdates:", v17);

      -[RTTUIConversationViewController updateTableViewSizeAnimated:](self, "updateTableViewSizeAnimated:", 0);
      -[RTTUIConversationViewController navigationController](self, "navigationController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "navigationBar");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (soft_AXProcessIsInCallService())
      {
        objc_msgSend(v11, "setBarStyle:", 1);
        objc_msgSend(v11, "setBackgroundImage:forBarMetrics:", 0, 0);
      }
      -[RTTUIConversationViewController call](self, "call");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "supportsTTYWithVoice") & 1) != 0)
      {
        -[RTTUIConversationViewController call](self, "call");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "ttyType") == 0;

        if (!v21)
          -[RTTUIConversationViewController updateBarButtons](self, "updateBarButtons");
      }
      else
      {

      }
      BKSHIDServicesRequestProximityDetectionMode();
      -[RTTUIConversationViewController updateCallHold:](self, "updateCallHold:", 0);
      objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setShouldSuppressIncomingNotification:", 1);

    }
  }
  else if ((v10 - 5) <= 1)
  {
    -[RTTUITextView overrideTTYPredictionsHidden:](self->_textView, "overrideTTYPredictionsHidden:", 1);
    -[RTTUIConversationViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "popViewControllerAnimated:", 1);

    if (soft_AXProcessIsRTTNotificationContentExtension())
      -[RTTUIConversationViewController showCallEnded](self, "showCallEnded");
  }
LABEL_14:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

}

void __50__RTTUIConversationViewController_callDidConnect___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedCallCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentCalls");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[4] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedCallCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callsWithStatus:", 4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedCallCenter");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "callsWithStatus:", 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1[6] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

- (void)updateCallHold:(id)a3
{
  _BOOL4 v4;
  _BOOL4 v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  TUCall *call;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  RTTUIConversationViewController *v14;
  uint64_t v15;
  uint64_t v16;
  TUCall *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint8_t buf[4];
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  TUCall *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = -[RTTUIConversationViewController isCurrentCallReceivingOnHold](self, "isCurrentCallReceivingOnHold", a3);
  v5 = -[RTTUIConversationViewController isCurrentCallSendingOnHold](self, "isCurrentCallSendingOnHold");
  v6 = -[TUCall isConnected](self->_call, "isConnected");
  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      call = self->_call;
      *(_DWORD *)buf = 67109634;
      v25 = v4;
      v26 = 1024;
      v27 = v5;
      v28 = 2112;
      v29 = call;
      _os_log_impl(&dword_216E9C000, v8, OS_LOG_TYPE_DEFAULT, "Call hold status: %d | %d, %@", buf, 0x18u);
    }

    if (v5)
    {
      v10 = *MEMORY[0x24BE7CB98];
      v11 = *MEMORY[0x24BE7CBB0];
      v22 = *MEMORY[0x24BE7CB80];
      -[RTTUIConversationViewController contactDisplayString](self, "contactDisplayString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self;
      v15 = v10;
      v16 = v11;
    }
    else
    {
      v18 = *MEMORY[0x24BE7CBB0];
      if (!v4)
      {
        -[RTTUIConversationViewController removeServiceCellWithUpdate:](self, "removeServiceCellWithUpdate:", *MEMORY[0x24BE7CBB0]);
        -[RTTUIConversationViewController removeServiceCellWithUpdate:](self, "removeServiceCellWithUpdate:", *MEMORY[0x24BE7CB98]);
        goto LABEL_13;
      }
      v19 = *MEMORY[0x24BE7CB98];
      -[RTTUIConversationViewController contactDisplayString](self, "contactDisplayString", *MEMORY[0x24BE7CB80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self;
      v15 = v18;
      v16 = v19;
    }
    -[RTTUIConversationViewController replaceServiceCellWithOldUpdate:withNewUpdate:options:](v14, "replaceServiceCellWithOldUpdate:withNewUpdate:options:", v15, v16, v13);

LABEL_13:
    -[RTTUIConversationViewController _updateBarButtonState](self, "_updateBarButtonState");
    -[RTTUIConversationViewController updateInputEnabled](self, "updateInputEnabled");
    return;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v17 = self->_call;
    *(_DWORD *)buf = 67109634;
    v25 = v4;
    v26 = 1024;
    v27 = v5;
    v28 = 2112;
    v29 = v17;
    _os_log_impl(&dword_216E9C000, v8, OS_LOG_TYPE_INFO, "Call not connected, not showing hold status: (hold: %d | %d): %@", buf, 0x18u);
  }

}

- (void)showCallEnded
{
  NSObject *v3;
  uint8_t v4[16];

  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_216E9C000, v3, OS_LOG_TYPE_INFO, "Showing call ended service message", v4, 2u);
  }

  -[RTTUIConversationViewController addServiceCellWithUpdate:options:](self, "addServiceCellWithUpdate:options:", *MEMORY[0x24BE7CB90], 0);
  -[RTTUIConversationViewController updateInputEnabled](self, "updateInputEnabled");
}

- (BOOL)showTextViewForCurrentCall
{
  void *v3;
  _BOOL4 v4;

  -[RTTUIConversationViewController call](self, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isConnected"))
    v4 = !-[RTTUIConversationViewController isIncomingScreeningCall](self, "isIncomingScreeningCall");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)isIncomingScreeningCall
{
  void *v3;
  void *v4;
  char v5;

  -[RTTUIConversationViewController call](self, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isScreening"))
  {
    -[RTTUIConversationViewController call](self, "call");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isIncoming");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateBarButtonState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[RTTUIConversationViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__RTTUIConversationViewController__updateBarButtonState__block_invoke;
  v7[3] = &unk_24D657B90;
  v7[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __56__RTTUIConversationViewController__updateBarButtonState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("BarButtonMuteIdentifier"));

  if (v5)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isCurrentCallSendingOnHold");
    objc_msgSend(*(id *)(a1 + 32), "call");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isUplinkMuted") | v6;

    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v18 = 67109376;
      v19 = v8;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_216E9C000, v9, OS_LOG_TYPE_INFO, "Setting mute button state for muted %d held %d", (uint8_t *)&v18, 0xEu);
    }

    objc_msgSend(v3, "customView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelected:", v8);
    objc_msgSend(v10, "setEnabled:", v6 ^ 1u);
LABEL_9:
    ttyLocString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityValue:", v17);

    goto LABEL_10;
  }
  objc_msgSend(v3, "accessibilityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("BarButtonHoldIdentifier"));

  if (v12)
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "isCurrentCallSendingOnHold");
    v14 = objc_msgSend(*(id *)(a1 + 32), "isCurrentCallReceivingOnHold") & (v13 ^ 1);
    AXLogRTT();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v14 ^ 1u;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v18 = 67109376;
      v19 = v13;
      v20 = 1024;
      v21 = v14 ^ 1;
      _os_log_impl(&dword_216E9C000, v15, OS_LOG_TYPE_INFO, "Setting hold button state for held %d enabled %d", (uint8_t *)&v18, 0xEu);
    }

    objc_msgSend(v3, "customView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSelected:", v13);
    objc_msgSend(v10, "setEnabled:", v16);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)updateBarButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  _DWORD v58[2];
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  -[RTTUIConversationViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    -[RTTUIConversationViewController call](self, "call");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_shareCallInfo_);
      objc_msgSend(v8, "addObject:", v10);

    }
    -[RTTUIConversationViewController call](self, "call");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "supportsTTYWithVoice");

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("mic.slash.fill"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_imageThatSuppressesAccessibilityHairlineThickening");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      ttyImageNamed(CFSTR("ttyMuteCircle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "systemFillColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "imageWithTintColor:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_imageThatSuppressesAccessibilityHairlineThickening");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      ttyImageNamed(CFSTR("ttyMuteCircle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageWithTintColor:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "_imageThatSuppressesAccessibilityHairlineThickening");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addTarget:action:forControlEvents:", self, sel_toggleMute_, 64);
      objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithTintColor:renderingMode:", v24, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setImage:forState:", v25, 0);

      objc_msgSend(MEMORY[0x24BDF6950], "systemBlackColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageWithTintColor:renderingMode:", v26, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setImage:forState:", v27, 4);

      objc_msgSend(v23, "setBackgroundImage:forState:", v18, 0);
      objc_msgSend(v23, "setBackgroundImage:forState:", v22, 4);
      objc_msgSend(v23, "sizeToFit");
      v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v23);
      objc_msgSend(v28, "setAccessibilityIdentifier:", CFSTR("BarButtonMuteIdentifier"));
      objc_msgSend(v8, "addObject:", v28);

    }
    objc_msgSend(MEMORY[0x24BE7CB70], "sharedUtilityProvider");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIConversationViewController call](self, "call");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "contextForCall:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "rttCallHoldEnabled");

    v34 = objc_msgSend(MEMORY[0x24BE7CB70], "isRTTCallHoldSupportedForContext:", v31);
    v35 = v34;
    if ((v33 & v12) == 1 && v34)
    {
      objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("pause.fill"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_imageThatSuppressesAccessibilityHairlineThickening");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      ttyImageNamed(CFSTR("ttyMuteCircle"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "systemFillColor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "imageWithTintColor:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_imageThatSuppressesAccessibilityHairlineThickening");
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      ttyImageNamed(CFSTR("ttyMuteCircle"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "imageWithTintColor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "_imageThatSuppressesAccessibilityHairlineThickening");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addTarget:action:forControlEvents:", self, sel_toggleHold_, 64);
      objc_msgSend(MEMORY[0x24BDF6950], "systemBlackColor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "imageWithTintColor:renderingMode:", v47, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setImage:forState:", v48, 4);

      objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "imageWithTintColor:renderingMode:", v49, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setImage:forState:", v50, 0);

      objc_msgSend(v46, "setBackgroundImage:forState:", v41, 0);
      objc_msgSend(v46, "setBackgroundImage:forState:", v45, 4);
      objc_msgSend(v46, "sizeToFit");
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
      objc_msgSend(v51, "setWidth:", 24.0);
      objc_msgSend(v8, "addObject:", v51);
      v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v46);
      objc_msgSend(v52, "setAccessibilityIdentifier:", CFSTR("BarButtonHoldIdentifier"));
      -[RTTUIConversationViewController call](self, "call");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setEnabled:", objc_msgSend(v53, "isEmergency") ^ 1);

      objc_msgSend(v8, "addObject:", v52);
    }
    else
    {
      AXLogRTT();
      v54 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v58[0] = 67109632;
        v58[1] = v33;
        v59 = 1024;
        v60 = v12;
        v61 = 1024;
        v62 = v35;
        _os_log_impl(&dword_216E9C000, v54, OS_LOG_TYPE_INFO, "Disabled RTT Hold Feature: %d %d %d", (uint8_t *)v58, 0x14u);
      }

    }
    -[RTTUIConversationViewController navigationController](self, "navigationController");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "navigationBar");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "topItem");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setRightBarButtonItems:", v8);

  }
  -[RTTUIConversationViewController _updateBarButtonState](self, "_updateBarButtonState");
}

- (void)toggleMute:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__RTTUIConversationViewController_toggleMute___block_invoke;
  v3[3] = &unk_24D657A60;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BE7CB70], "performCallCenterTask:", v3);
}

void __46__RTTUIConversationViewController_toggleMute___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id *v13;
  void *v14;
  void *v15;
  void **v16;
  void *v17;
  id *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id buf;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "call");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUplinkMuted");

  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v3 ^ 1;
    _os_log_impl(&dword_216E9C000, v4, OS_LOG_TYPE_INFO, "Toggling TTY mute: New value: %d", (uint8_t *)&buf, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "call");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isTTY"))
  {
    objc_msgSend(*(id *)(a1 + 32), "call");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsTTYWithVoice");

    v8 = v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  AXLogRTT();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_216E9C000, v9, OS_LOG_TYPE_INFO, "Will toggle downlink mute: %d", (uint8_t *)&buf, 8u);
  }

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "call");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "callUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSystemOutputAudioMuted:withCallID:", v3 ^ 1u, v12);

  }
  v14 = *(void **)(a1 + 32);
  v13 = (id *)(a1 + 32);
  objc_msgSend(v14, "call");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUplinkMuted:", v3 ^ 1u);

  objc_msgSend(*v13, "_updateBarButtonState");
  if (v3)
    v16 = (void **)MEMORY[0x24BE7CBC0];
  else
    v16 = (void **)MEMORY[0x24BE7CBA8];
  v17 = *v16;
  if (v3)
    v18 = (id *)MEMORY[0x24BE7CBA8];
  else
    v18 = (id *)MEMORY[0x24BE7CBC0];
  v19 = v17;
  v20 = *v18;
  objc_msgSend(*v13, "replaceServiceCellWithOldUpdate:withNewUpdate:options:", v20, v19, 0);
  objc_initWeak(&buf, *v13);
  v21 = (void *)*((_QWORD *)*v13 + 126);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__RTTUIConversationViewController_toggleMute___block_invoke_291;
  v23[3] = &unk_24D657B18;
  objc_copyWeak(&v25, &buf);
  v22 = v19;
  v24 = v22;
  objc_msgSend(v21, "afterDelay:processBlock:", v23, 2.0);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&buf);

}

void __46__RTTUIConversationViewController_toggleMute___block_invoke_291(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "removeServiceCellWithUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)toggleHold:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __46__RTTUIConversationViewController_toggleHold___block_invoke;
  v3[3] = &unk_24D657A60;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BE7CB70], "performCallCenterTask:", v3);
}

uint64_t __46__RTTUIConversationViewController_toggleHold___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isCurrentCallSendingOnHold");
  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v2 ^ 1;
    _os_log_impl(&dword_216E9C000, v3, OS_LOG_TYPE_INFO, "Setting RTT call on hold -> %d", (uint8_t *)v7, 8u);
  }

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedCallCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "call");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v4, "unholdCall:", v5);
  else
    objc_msgSend(v4, "holdCall:", v5);

  objc_msgSend(*(id *)(a1 + 32), "logCallHold:", v2 ^ 1u);
  objc_msgSend(*(id *)(a1 + 32), "updateCallHold:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_updateBarButtonState");
  return objc_msgSend(*(id *)(a1 + 32), "updateInputEnabled");
}

- (void)logCallHold:(BOOL)a3
{
  NSObject *v4;
  _QWORD block[4];
  BOOL v6;

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__RTTUIConversationViewController_logCallHold___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v6 = a3;
  dispatch_async(v4, block);

}

void __47__RTTUIConversationViewController_logCallHold___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  AXLogAggregate();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 32);
    *(_DWORD *)buf = 67109120;
    v9 = v3;
    _os_log_impl(&dword_216E9C000, v2, OS_LOG_TYPE_INFO, "RTT call placed upstream hold: %d", buf, 8u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 32), CFSTR("callHeld"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (id)contactDisplayString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  -[RTTUIConversationViewController call](self, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x24BDBACC0];
    v6 = (void *)MEMORY[0x24BDBACA0];
    -[RTTUIConversationViewController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "otherContactPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactForPhoneNumber:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromContact:style:", v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v10;
  }
  if (!objc_msgSend(v4, "length"))
  {
    -[RTTUIConversationViewController conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "otherContactPath");
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v12;
  }
  return v4;
}

- (BOOL)isCurrentCallConnected
{
  void *v2;
  int v3;

  -[RTTUIConversationViewController call](self, "call");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  return (v3 - 1) < 2;
}

- (BOOL)isCurrentCallOnHold
{
  return -[RTTUIConversationViewController isCurrentCallReceivingOnHold](self, "isCurrentCallReceivingOnHold")
      || -[RTTUIConversationViewController isCurrentCallSendingOnHold](self, "isCurrentCallSendingOnHold");
}

- (BOOL)isCurrentCallReceivingOnHold
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;

  -[RTTUIConversationViewController call](self, "call");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXTTYIsTextHeldForRTTCall();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    AXLogRTT();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[RTTUIConversationViewController isCurrentCallReceivingOnHold].cold.1(v7);

    v6 = 0;
  }

  return v6;
}

- (BOOL)isCurrentCallSendingOnHold
{
  void *v2;
  char v3;

  -[RTTUIConversationViewController call](self, "call");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnHold");

  return v3;
}

- (BOOL)currentCallIsDowngraded
{
  void *v2;
  BOOL v3;

  -[RTTUIConversationViewController call](self, "call");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ttyType") == 0;

  return v3;
}

- (void)updateInputEnabled
{
  void *v3;
  int v4;
  void *v5;
  _BOOL4 v6;
  UIButton *gaButton;
  uint64_t v8;

  -[RTTUIConversationViewController call](self, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "status");

  if (-[RTTUIConversationViewController currentCallIsDowngraded](self, "currentCallIsDowngraded")
    || -[RTTUIConversationViewController isCurrentCallOnHold](self, "isCurrentCallOnHold")
    || (v4 - 5) < 2
    || -[RTTUIConversationViewController isIncomingScreeningCall](self, "isIncomingScreeningCall"))
  {
    -[RTTUIConversationViewController call](self, "call");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v5);

    if (v6)
    {
      -[RTTUITextView setEditable:](self->_textView, "setEditable:", 0);
      -[RTTUITextView resignFirstResponder](self->_textView, "resignFirstResponder");
      return;
    }
    gaButton = self->_gaButton;
    v8 = 0;
  }
  else
  {
    -[RTTUITextView setEditable:](self->_textView, "setEditable:", 1);
    gaButton = self->_gaButton;
    v8 = 1;
  }
  -[UIButton setEnabled:](gaButton, "setEnabled:", v8);
}

- (void)addServiceCellWithUpdate:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  AXPerformBlockOnMainThread();

}

uint64_t __68__RTTUIConversationViewController_addServiceCellWithUpdate_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addServiceCellWithUpdate:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_addServiceCellWithUpdate:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _AXAssertIsMainThread();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7CB60]), "initWithServiceUpdateType:options:", v6, v7);

  if ((-[NSMutableArray containsObject:](self->_serviceUpdates, "containsObject:", v8) & 1) == 0)
  {
    v9 = -[NSMutableArray count](self->_serviceUpdates, "count");
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_216E9C000, v11, OS_LOG_TYPE_INFO, "Add service cell %@ %@", (uint8_t *)&v13, 0x16u);
    }

    -[NSMutableArray addObject:](self->_serviceUpdates, "addObject:", v8);
    if (v10)
    {
      -[RTTUIConversationViewController _updateTableViewRowAtIndexPath:action:animation:](self, "_updateTableViewRowAtIndexPath:action:animation:", v10, 1, 4);
      -[RTTUIConversationViewController tableView](self, "tableView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scrollToRowAtIndexPath:atScrollPosition:animated:", v10, 3, 1);

    }
  }

}

- (void)removeServiceCellWithUpdate:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AXPerformBlockOnMainThread();

}

uint64_t __63__RTTUIConversationViewController_removeServiceCellWithUpdate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeServiceCellWithUpdate:", *(_QWORD *)(a1 + 40));
}

- (void)_removeServiceCellWithUpdate:(id)a3
{
  id v4;
  NSMutableArray *serviceUpdates;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _AXAssertIsMainThread();
  serviceUpdates = self->_serviceUpdates;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__RTTUIConversationViewController__removeServiceCellWithUpdate___block_invoke;
  v11[3] = &unk_24D657C00;
  v6 = v4;
  v12 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](serviceUpdates, "indexOfObjectPassingTest:", v11);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v7, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_216E9C000, v10, OS_LOG_TYPE_INFO, "Remove service cell %@ %@", buf, 0x16u);
    }

    -[NSMutableArray removeObjectAtIndex:](self->_serviceUpdates, "removeObjectAtIndex:", v8);
    if (v9)
      -[RTTUIConversationViewController _updateTableViewRowAtIndexPath:action:animation:](self, "_updateTableViewRowAtIndexPath:action:animation:", v9, 2, 4);

  }
}

BOOL __64__RTTUIConversationViewController__removeServiceCellWithUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "serviceUpdateType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (void)replaceServiceCellWithOldUpdate:(id)a3 withNewUpdate:(id)a4 options:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v11 = a4;
  v12 = a5;
  v8 = v12;
  v9 = v11;
  v10 = v7;
  AXPerformBlockOnMainThread();

}

uint64_t __89__RTTUIConversationViewController_replaceServiceCellWithOldUpdate_withNewUpdate_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_replaceServiceCellWithOldUpdate:withNewUpdate:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_replaceServiceCellWithOldUpdate:(id)a3 withNewUpdate:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *serviceUpdates;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _AXAssertIsMainThread();
  serviceUpdates = self->_serviceUpdates;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __90__RTTUIConversationViewController__replaceServiceCellWithOldUpdate_withNewUpdate_options___block_invoke;
  v17[3] = &unk_24D657C00;
  v12 = v8;
  v18 = v12;
  v13 = -[NSMutableArray indexOfObjectPassingTest:](serviceUpdates, "indexOfObjectPassingTest:", v17);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7CB60]), "initWithServiceUpdateType:options:", v9, v10);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL
    || (-[NSMutableArray containsObject:](self->_serviceUpdates, "containsObject:", v14) & 1) != 0)
  {
    -[RTTUIConversationViewController _addServiceCellWithUpdate:options:](self, "_addServiceCellWithUpdate:options:", v9, v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v13, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogRTT();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v12;
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v9;
      _os_log_impl(&dword_216E9C000, v16, OS_LOG_TYPE_INFO, "Replace service cell %@ %@ with %@", buf, 0x20u);
    }

    -[NSMutableArray setObject:atIndexedSubscript:](self->_serviceUpdates, "setObject:atIndexedSubscript:", v14, v13);
    -[RTTUIConversationViewController _updateTableViewRowAtIndexPath:action:animation:](self, "_updateTableViewRowAtIndexPath:action:animation:", v15, 0, 0);

  }
}

BOOL __90__RTTUIConversationViewController__replaceServiceCellWithOldUpdate_withNewUpdate_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "serviceUpdateType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)addTranscriptionText:(id)a3 isNew:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  int v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[RTTUIConversationViewController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "utterances");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[RTTUIConversationViewController conversation](self, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v4)
    v12 = (id)objc_msgSend(v10, "addTranscriptionFromOtherContactPath:", v6);
  else
    v13 = (id)objc_msgSend(v10, "updateTranscriptionFromOtherContactPath:", v6);

  -[RTTUIConversationViewController conversation](self, "conversation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "utterances");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  v17 = objc_alloc(MEMORY[0x24BE7CB60]);
  v18 = (void *)objc_msgSend(v17, "initWithServiceUpdateType:options:", *MEMORY[0x24BE7CBA0], 0);
  v19 = -[NSMutableArray containsObject:](self->_serviceUpdates, "containsObject:", v18);
  AXLogRTT();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
  if (v19)
  {
    if (v21)
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_216E9C000, v20, OS_LOG_TYPE_INFO, "Not adding transcription text to table view because screen is locked", (uint8_t *)&v24, 2u);
    }

    v22 = 0;
  }
  else
  {
    if (v21)
    {
      v24 = 138412802;
      v25 = v6;
      v26 = 1024;
      v27 = v9;
      v28 = 1024;
      v29 = v16;
      _os_log_impl(&dword_216E9C000, v20, OS_LOG_TYPE_INFO, "Adding transcription: %@ (old count: %d, new count: %d)", (uint8_t *)&v24, 0x18u);
    }

    -[RTTUIConversationViewController _updateTableViewUtteranceOldCount:newCount:](self, "_updateTableViewUtteranceOldCount:newCount:", v9, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)addUtterance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTUIConversationViewController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "utterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[RTTUIConversationViewController conversation](self, "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addUtterance:", v4);

  -[RTTUIConversationViewController conversation](self, "conversation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "utterances");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = objc_alloc(MEMORY[0x24BE7CB60]);
  v13 = (void *)objc_msgSend(v12, "initWithServiceUpdateType:options:", *MEMORY[0x24BE7CBA0], 0);
  v14 = -[NSMutableArray containsObject:](self->_serviceUpdates, "containsObject:", v13);
  AXLogRTT();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_216E9C000, v15, OS_LOG_TYPE_INFO, "Not adding utterance because screen is locked", (uint8_t *)&v19, 2u);
    }

    v17 = 0;
  }
  else
  {
    if (v16)
    {
      v19 = 138412802;
      v20 = v4;
      v21 = 1024;
      v22 = v7;
      v23 = 1024;
      v24 = v11;
      _os_log_impl(&dword_216E9C000, v15, OS_LOG_TYPE_INFO, "Adding utterance: %@ (old count: %d, new count: %d)", (uint8_t *)&v19, 0x18u);
    }

    -[RTTUIConversationViewController _updateTableViewUtteranceOldCount:newCount:](self, "_updateTableViewUtteranceOldCount:newCount:", v7, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)_updateTableViewUtteranceOldCount:(unint64_t)a3 newCount:(unint64_t)a4
{
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  int v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= a4)
  {
    if (a3 > a4)
    {
      do
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", --a3, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v10);

      }
      while (a3 > a4);
      a3 = a4;
    }
    -[RTTUIConversationViewController _updateTableViewRowsAtIndexPaths:action:animation:](self, "_updateTableViewRowsAtIndexPaths:action:animation:", v7, 2, 4);
    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = (unint64_t)v7;
      _os_log_impl(&dword_216E9C000, v9, OS_LOG_TYPE_INFO, "Deleting rows: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  else
  {
    do
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", a3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      ++a3;
    }
    while (a4 != a3);
    -[RTTUIConversationViewController _updateTableViewRowsAtIndexPaths:action:animation:](self, "_updateTableViewRowsAtIndexPaths:action:animation:", v7, 1, 4);
    AXLogRTT();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v24 = 138412290;
      v25 = (unint64_t)v7;
      _os_log_impl(&dword_216E9C000, v9, OS_LOG_TYPE_INFO, "Inserting rows: %@", (uint8_t *)&v24, 0xCu);
    }
    a3 = a4;
  }

  if (a4)
    v11 = a4 - 1;
  else
    v11 = 0;
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogRTT();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v24 = 134218754;
    v25 = v11;
    v26 = 2048;
    v27 = a3;
    v28 = 2048;
    v29 = a4;
    v30 = 2112;
    v31 = v12;
    _os_log_impl(&dword_216E9C000, v13, OS_LOG_TYPE_INFO, "Trying to update utterance and cell: %lld (old count, %lld, new count %lld) path: %@", (uint8_t *)&v24, 0x2Au);
  }

  if ((v11 & 0x8000000000000000) == 0)
  {
    -[RTTUIConversationViewController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cellForRowAtIndexPath:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTUIConversationViewController conversation](self, "conversation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "utterances");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateUtterance:", v18);

    -[RTTUIConversationViewController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "numberOfRowsInSection:", 0);

    AXLogRTT();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412802;
      v25 = (unint64_t)v15;
      v26 = 2112;
      v27 = (unint64_t)v12;
      v28 = 2112;
      v29 = (unint64_t)v22;
      _os_log_impl(&dword_216E9C000, v21, OS_LOG_TYPE_INFO, "Updated cell: %@, index path: %@, number of rows: %@", (uint8_t *)&v24, 0x20u);

    }
    if (objc_msgSend(v12, "row") < v20 && !v15)
      -[RTTUIConversationViewController _scrollToIndexPathIfNecessary:animated:](self, "_scrollToIndexPathIfNecessary:animated:", v12, 1);

  }
  return v12;
}

- (void)updateUtterance:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[RTTUIConversationViewController utteranceCellAtIndexPath:](self, "utteranceCellAtIndexPath:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateUtterance:", v6);

  -[RTTUIConversationViewController utteranceCellDidUpdateContent:](self, "utteranceCellDidUpdateContent:", v7);
}

- (id)textViewUtterance
{
  return (id)-[RTTUITextView text](self->_textView, "text");
}

- (void)setTextViewUtterance:(id)a3
{
  -[RTTUITextView setText:](self->_textView, "setText:", a3);
  -[RTTUIConversationViewController updateTableViewSizeAnimated:](self, "updateTableViewSizeAnimated:", 1);
}

- (id)utteranceCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTUIConversationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[RTTUIConversationViewController utteranceCellAtIndexPath:].cold.1();
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_216E9C000, v9, OS_LOG_TYPE_INFO, "No utterance cell found at index path: %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)serviceUpdateCellAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTUIConversationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
  }
  else
  {
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[RTTUIConversationViewController serviceUpdateCellAtIndexPath:].cold.1();
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_216E9C000, v9, OS_LOG_TYPE_INFO, "No service update cell found at index path: %@", (uint8_t *)&v11, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)cannedResponses
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cannedResponses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)currentContactPath
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE7CB70], "sharedUtilityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIConversationViewController call](self, "call");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactPathForCall:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_validRectangle:(CGRect)a3
{
  BOOL result;

  result = 0;
  if (fabs(a3.origin.x) != INFINITY && fabs(a3.origin.y) != INFINITY)
    return !CGRectIsInfinite(a3);
  return result;
}

- (void)updateVoiceOverAnnouncement:(id)a3
{
  id v4;
  AXDispatchTimer *voAnnouncementTimer;
  id v6;
  AXDispatchTimer *v7;
  AXDispatchTimer *v8;
  NSMutableString *v9;
  NSMutableString *voAnnouncementBuffer;
  void *v11;
  uint64_t v12;
  AXDispatchTimer *v13;
  _QWORD v14[5];

  v4 = a3;
  voAnnouncementTimer = self->_voAnnouncementTimer;
  if (!voAnnouncementTimer)
  {
    v6 = objc_alloc(MEMORY[0x24BDFE490]);
    v7 = (AXDispatchTimer *)objc_msgSend(v6, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    v8 = self->_voAnnouncementTimer;
    self->_voAnnouncementTimer = v7;

    v9 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
    voAnnouncementBuffer = self->_voAnnouncementBuffer;
    self->_voAnnouncementBuffer = v9;

    voAnnouncementTimer = self->_voAnnouncementTimer;
  }
  -[AXDispatchTimer cancel](voAnnouncementTimer, "cancel");
  if (objc_msgSend(v4, "length") && objc_msgSend(v4, "characterAtIndex:", 0) == 8)
  {
    if (-[NSMutableString length](self->_voAnnouncementBuffer, "length"))
      -[NSMutableString deleteCharactersInRange:](self->_voAnnouncementBuffer, "deleteCharactersInRange:", -[NSMutableString length](self->_voAnnouncementBuffer, "length") - 1, 1);
  }
  else
  {
    -[NSMutableString appendString:](self->_voAnnouncementBuffer, "appendString:", v4);
  }
  -[NSMutableString trimmedString](self->_voAnnouncementBuffer, "trimmedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    v13 = self->_voAnnouncementTimer;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__RTTUIConversationViewController_updateVoiceOverAnnouncement___block_invoke;
    v14[3] = &unk_24D657A60;
    v14[4] = self;
    -[AXDispatchTimer afterDelay:processBlock:](v13, "afterDelay:processBlock:", v14, 4.0);
  }

}

void __63__RTTUIConversationViewController_updateVoiceOverAnnouncement___block_invoke(uint64_t a1)
{
  id argument;

  objc_msgSend(MEMORY[0x24BDFEA60], "stringWithString:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
  argument = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(argument, "setAttribute:forKey:", &unk_24D65DB40, *MEMORY[0x24BDFEAD8]);
  objc_msgSend(argument, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFECA0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], argument);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "setString:", &stru_24D658230);

}

- (void)_scrollToIndexPathIfNecessary:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  _BOOL8 v50;
  int v51;
  _BYTE v52[10];
  _WORD v53[9];
  CGRect v54;
  NSRect v55;
  CGRect v56;

  v4 = a4;
  *(_QWORD *)&v53[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[RTTUIConversationViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIConversationViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rectForRowAtIndexPath:", v6);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[RTTUIConversationViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertRect:fromView:", v17, v10, v12, v14, v16);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[RTTUIConversationViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUITextView bounds](self->_textView, "bounds");
  objc_msgSend(v26, "convertRect:fromView:", self->_textView);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v54.origin.x = v19;
  v54.origin.y = v21;
  v54.size.width = v23;
  v54.size.height = v25;
  v56.origin.x = v28;
  v56.origin.y = v30;
  v56.size.width = v32;
  v56.size.height = v34;
  v35 = CGRectIntersectsRect(v54, v56);
  -[RTTUIConversationViewController tableView](self, "tableView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "indexPathsForVisibleRows");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "containsObject:", v6) ^ 1;

  if ((v38 & 1) != 0 || v35)
  {
    v39 = objc_msgSend(v6, "section");
    -[RTTUIConversationViewController tableView](self, "tableView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v39 >= objc_msgSend(v40, "numberOfSections"))
    {

    }
    else
    {
      v41 = objc_msgSend(v6, "row");
      -[RTTUIConversationViewController tableView](self, "tableView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "numberOfRowsInSection:", objc_msgSend(v6, "section"));

      if (v41 < v43)
      {
        AXLogRTT();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          -[RTTUIConversationViewController tableView](self, "tableView");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "rectForRowAtIndexPath:", v6);
          NSStringFromRect(v55);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 138412546;
          *(_QWORD *)v52 = v6;
          *(_WORD *)&v52[8] = 2112;
          *(_QWORD *)v53 = v46;
          _os_log_impl(&dword_216E9C000, v44, OS_LOG_TYPE_INFO, "Scrolling to row: %@ - %@", (uint8_t *)&v51, 0x16u);

        }
        AXLogRTT();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          v51 = 67109632;
          *(_DWORD *)v52 = v35;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = v38;
          v53[0] = 1024;
          *(_DWORD *)&v53[1] = v21 > v30;
          _os_log_debug_impl(&dword_216E9C000, v47, OS_LOG_TYPE_DEBUG, "Scroll row options: %d, %d, %d", (uint8_t *)&v51, 0x14u);
        }

        -[RTTUIConversationViewController tableView](self, "tableView");
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v48;
        v50 = v21 > v30 && v4;
        -[NSObject scrollToRowAtIndexPath:atScrollPosition:animated:](v48, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 3, v50);
LABEL_16:

        goto LABEL_17;
      }
    }
    AXLogRTT();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      v51 = 138412802;
      *(_QWORD *)v52 = v6;
      *(_WORD *)&v52[8] = 1024;
      *(_DWORD *)v53 = objc_msgSend(v6, "section");
      v53[2] = 1024;
      *(_DWORD *)&v53[3] = objc_msgSend(v6, "row");
      _os_log_impl(&dword_216E9C000, v49, OS_LOG_TYPE_INFO, "Not scrolling to path[%@], because tableview doesn't have any sections[%d] or rows[%d]", (uint8_t *)&v51, 0x18u);
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)deviceDidReceiveString:(id)a3 forUtterance:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  AXLogRTT();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_216E9C000, v8, OS_LOG_TYPE_INFO, "TTY receive |%@|=%@", buf, 0x16u);
  }

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke;
  v15[3] = &unk_24D657C50;
  v15[4] = self;
  v12 = v7;
  v13 = v6;
  v14 = (void *)MEMORY[0x219A04408](v15);
  v9 = v14;
  v10 = v6;
  v11 = v7;
  AXPerformBlockOnMainThread();

}

void __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v3 = a2;
  v2 = v3;
  AXPerformBlockAsynchronouslyOnMainThread();

}

void __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke_2(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 40);
  HCPerformSafeBlock();

}

uint64_t __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollToIndexPathIfNecessary:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

void __71__RTTUIConversationViewController_deviceDidReceiveString_forUtterance___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  double v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void *v25;
  NSObject *v26;
  double v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint8_t buf[4];
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  void *v58;
  uint64_t v59;
  CGRect v60;
  CGRect v61;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "utterances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  +[RTTUIUtteranceCell heightForUtterance:andWidth:](RTTUIUtteranceCell, "heightForUtterance:andWidth:", v4, CGRectGetWidth(v60));
  v7 = v6;

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "utterances");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastUtteranceForMe:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "lastConversationRowPathForUtterance:", v12);
  v13 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "text");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = *(void **)(a1 + 40);
    objc_msgSend(v12, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingString:", *(_QWORD *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = objc_msgSend(v16, "isEqualToString:", v18);

    if ((_DWORD)v16)
    {
      objc_msgSend(v12, "updateText:", *(_QWORD *)(a1 + 40));
      AXLogRTT();
      *(double *)&v19 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      v20 = *(double *)(a1 + 40);
      objc_msgSend(v12, "text");
      *(double *)&v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412802;
      v54 = v20;
      v55 = 2112;
      v56 = *(double *)&v21;
      v57 = 2112;
      v58 = v12;
      v22 = "total utterance: %@, utterance text: %@, updated: %@";
      v23 = v19;
      v24 = 32;
      goto LABEL_11;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendStringFromOtherContactPath:", *(_QWORD *)(a1 + 48));
  *(double *)&v19 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

  AXLogRTT();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = *(double *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v54 = v27;
    v55 = 2112;
    v56 = *(double *)&v19;
    _os_log_impl(&dword_216E9C000, v26, OS_LOG_TYPE_INFO, "Append utterance: %@ -> %@", buf, 0x16u);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    -[NSObject text](v19, "text");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if ((v29 & 1) == 0)
    {
      -[NSObject updateText:](v19, "updateText:", *(_QWORD *)(a1 + 40));
      AXLogRTT();
      *(double *)&v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_12:

        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      v54 = *(double *)&v19;
      v22 = "updated utterance: %@";
      v23 = v21;
      v24 = 12;
LABEL_11:
      _os_log_impl(&dword_216E9C000, v23, OS_LOG_TYPE_INFO, v22, buf, v24);
      goto LABEL_12;
    }
  }
LABEL_13:

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "utterances");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  v33 = objc_alloc(MEMORY[0x24BE7CB60]);
  v34 = (void *)objc_msgSend(v33, "initWithServiceUpdateType:options:", *MEMORY[0x24BE7CBA0], 0);
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "containsObject:", v34))
  {
    objc_msgSend(*(id *)(a1 + 32), "updateVoiceOverAnnouncement:", *(_QWORD *)(a1 + 48));
    if (v32 <= v10)
    {
      if (v32 >= v10)
      {
        if (!v10)
          goto LABEL_35;
        objc_msgSend(*(id *)(a1 + 32), "utteranceCellAtIndexPath:", *(_QWORD *)&v13);
        *(double *)&v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(*(id *)(a1 + 32), "tableView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "bounds");
        +[RTTUIUtteranceCell heightForUtterance:andWidth:](RTTUIUtteranceCell, "heightForUtterance:andWidth:", v12, CGRectGetWidth(v61));
        v42 = v41;

        -[NSObject updateUtterance:](v36, "updateUtterance:", v12);
        if (v42 != v7)
        {
          AXLogRTT();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v54 = v7;
            v55 = 2048;
            v56 = v42;
            _os_log_impl(&dword_216E9C000, v43, OS_LOG_TYPE_INFO, "Updating utterance cell height from %f to %f", buf, 0x16u);
          }

          if (v13 != 0.0)
            objc_msgSend(*(id *)(a1 + 32), "_updateTableViewRowAtIndexPath:action:animation:", *(_QWORD *)&v13, 0, 0);
        }
        if (*(double *)&v36 != 0.0)
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_updateTableViewRowAtIndexPath:action:animation:", *(_QWORD *)&v13, 2, 1);
        if (v32)
        {
          v38 = *(_QWORD *)(a1 + 56);
          objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v32 - 1, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, uint64_t))(v38 + 16))(v38, v39, 1);

        }
        AXLogRTT();
        *(double *)&v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = v13;
          _os_log_impl(&dword_216E9C000, v36, OS_LOG_TYPE_INFO, "Deleting row: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v32 - 1, 0);
      *(double *)&v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      objc_msgSend(*(id *)(a1 + 32), "_updateTableViewRowAtIndexPath:action:animation:", v36, 1, 2);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      AXLogRTT();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v54 = *(double *)&v36;
        _os_log_impl(&dword_216E9C000, v37, OS_LOG_TYPE_INFO, "Inserting row: %@", buf, 0xCu);
      }

    }
LABEL_35:
    if (objc_msgSend(v12, "isComplete"))
    {
      objc_msgSend(*(id *)(a1 + 32), "call");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "ttyType") != 2)
      {
LABEL_39:

        goto LABEL_40;
      }
      objc_msgSend(*(id *)(a1 + 32), "conversation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "utteranceCountForMe:", 1);

      if (!v46)
      {
        v47 = (void *)MEMORY[0x24BDD17C8];
        ttyLocString();
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "call");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "handle");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "value");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "stringWithFormat:", v48, v51);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "sendNewUtteranceString:controller:", v44, *(_QWORD *)(a1 + 32));

        goto LABEL_39;
      }
    }
LABEL_40:
    objc_msgSend(*(id *)(a1 + 32), "updateTableViewSizeAnimated:", 0);
    goto LABEL_41;
  }
  AXLogRTT();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216E9C000, v35, OS_LOG_TYPE_INFO, "Not adding received string for utterance to table view because screen is locked", buf, 2u);
  }

LABEL_41:
}

- (void)gaButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  AXLogRTT();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[RTTUIConversationViewController textViewUtterance](self, "textViewUtterance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_216E9C000, v4, OS_LOG_TYPE_INFO, "GA button pressed: %@", (uint8_t *)&v11, 0xCu);

  }
  -[RTTUIConversationViewController textViewUtterance](self, "textViewUtterance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BE7CB68], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "ttyShouldBeRealtime");

    if ((v8 & 1) == 0)
    {
      +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTUIConversationViewController textViewUtterance](self, "textViewUtterance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sendNewUtteranceString:controller:", v10, self);

      -[RTTUIConversationViewController setTextViewUtterance:](self, "setTextViewUtterance:", &stru_24D658230);
      -[RTTUIConversationViewController setCurrentUtterance:](self, "setCurrentUtterance:", 0);
      -[RTTUIConversationViewController updateTableViewSizeAnimated:](self, "updateTableViewSizeAnimated:", 1);
    }
  }
  else
  {

  }
}

- (id)lastConversationRowPathForUtterance:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (void *)MEMORY[0x24BDD15D8];
  v5 = a3;
  -[RTTUIConversationViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "utterances");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5);

  objc_msgSend(v4, "indexPathForRow:inSection:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)realtimeTextDidChange
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  double Height;
  void *v23;
  void *v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  AXDispatchTimer *realTimeTimeout;
  _QWORD v34[5];
  uint8_t buf[4];
  _BYTE v36[24];
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v37 = *MEMORY[0x24BDAC8D0];
  -[RTTUIConversationViewController currentUtterance](self, "currentUtterance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIConversationViewController lastConversationRowPathForUtterance:](self, "lastConversationRowPathForUtterance:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "realtimeTextDidChange:forUtterance:lastRowPath:", self, v3, v4);

  AXLogRTT();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v36 = v6;
    *(_WORD *)&v36[4] = 2112;
    *(_QWORD *)&v36[6] = v3;
    *(_WORD *)&v36[14] = 2112;
    *(_QWORD *)&v36[16] = v4;
    _os_log_impl(&dword_216E9C000, v7, OS_LOG_TYPE_INFO, "Real time text changed: %d, utterance: %@, path: %@", buf, 0x1Cu);
  }

  if (v6)
  {
    AXLogRTT();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = objc_msgSend(v3, "hasTimedOut");
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v36 = v3;
      *(_WORD *)&v36[8] = 1024;
      *(_DWORD *)&v36[10] = v9;
      _os_log_impl(&dword_216E9C000, v8, OS_LOG_TYPE_INFO, "Realtime text changed. Last utterance: %@, timeout: %d", buf, 0x12u);
    }

    if (objc_msgSend(v3, "isMe") && (objc_msgSend(v3, "hasTimedOut") & 1) == 0)
    {
      -[RTTUIConversationViewController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cellForRowAtIndexPath:", v4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "updateUtterance:", v3);
      objc_msgSend(v21, "bounds");
      Height = CGRectGetHeight(v38);
      objc_msgSend(v21, "utterance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTTUIConversationViewController tableView](self, "tableView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      +[RTTUIUtteranceCell heightForUtterance:andWidth:](RTTUIUtteranceCell, "heightForUtterance:andWidth:", v23, CGRectGetWidth(v39));
      v26 = v25;

      if (Height != v26)
        -[RTTUIConversationViewController utteranceCellDidUpdateContent:](self, "utteranceCellDidUpdateContent:", v21);
      AXLogRTT();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v36 = v21;
        *(_WORD *)&v36[8] = 2112;
        *(_QWORD *)&v36[10] = v3;
        _os_log_impl(&dword_216E9C000, v27, OS_LOG_TYPE_INFO, "Updating utterance since it's still me: %@ %@", buf, 0x16u);
      }

      objc_msgSend(v3, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "length");

      if (!v29)
      {
        -[RTTUIConversationViewController conversation](self, "conversation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "utterances");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "removeObject:", v3);

        -[RTTUIConversationViewController setCurrentUtterance:](self, "setCurrentUtterance:", 0);
        if (v4 && objc_msgSend(v4, "row") != 0x7FFFFFFFFFFFFFFFLL)
          -[RTTUIConversationViewController _updateTableViewRowAtIndexPath:action:animation:](self, "_updateTableViewRowAtIndexPath:action:animation:", v4, 2, 1);
        AXLogRTT();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v36 = v3;
          _os_log_impl(&dword_216E9C000, v32, OS_LOG_TYPE_INFO, "Deleting utterance since text length was empty: %@", buf, 0xCu);
        }

      }
    }
    else
    {
      -[RTTUIConversationViewController textViewUtterance](self, "textViewUtterance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        AXLogRTT();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          -[RTTUIConversationViewController textViewUtterance](self, "textViewUtterance");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v36 = v13;
          *(_WORD *)&v36[8] = 2112;
          *(_QWORD *)&v36[10] = self;
          _os_log_impl(&dword_216E9C000, v12, OS_LOG_TYPE_INFO, "Sending updated utterance: %@, from %@", buf, 0x16u);

        }
        +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTTUIConversationViewController textViewUtterance](self, "textViewUtterance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sendNewUtteranceString:controller:", v15, self);

        -[RTTUIConversationViewController conversation](self, "conversation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastUtteranceForMe:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTTUIConversationViewController setCurrentUtterance:](self, "setCurrentUtterance:", v17);

        AXLogRTT();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          -[RTTUIConversationViewController currentUtterance](self, "currentUtterance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v36 = v19;
          _os_log_impl(&dword_216E9C000, v18, OS_LOG_TYPE_INFO, "Updating current utterance to last utterance from me: %@", buf, 0xCu);

        }
        -[RTTUIConversationViewController updateTableViewSizeAnimated:](self, "updateTableViewSizeAnimated:", 1);
      }
    }
  }
  realTimeTimeout = self->_realTimeTimeout;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __56__RTTUIConversationViewController_realtimeTextDidChange__block_invoke;
  v34[3] = &unk_24D657A60;
  v34[4] = self;
  -[AXDispatchTimer afterDelay:processBlock:](realTimeTimeout, "afterDelay:processBlock:", v34, 3.0);

}

uint64_t __56__RTTUIConversationViewController_realtimeTextDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRealtimeTimeout");
}

- (void)_processRealtimeTimeout
{
  id v3;

  -[RTTUIConversationViewController currentUtterance](self, "currentUtterance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasTimedOut"))
  {
    -[RTTUIConversationViewController setCurrentUtterance:](self, "setCurrentUtterance:", 0);
    -[RTTUIConversationViewController setTextViewUtterance:](self, "setTextViewUtterance:", &stru_24D658230);
  }

}

- (void)updateGAButton
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  BOOL v7;
  UIButton *v8;
  UIButton *gaButton;
  void *v10;
  void *v11;
  UIButton *v12;
  void *v13;
  void *v14;

  if (!self->_gaButton)
  {
    -[RTTUIConversationViewController call](self, "call");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v6);

    if (!v7)
    {
      v8 = (UIButton *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6880]), "initWithFrame:", 0.0, 0.0, 40.0, 35.0);
      gaButton = self->_gaButton;
      self->_gaButton = v8;

      ttyImageNamed(CFSTR("TTYSend"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((soft_AXProcessIsRTTNotificationContentExtension() & 1) != 0)
        objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      else
        objc_msgSend(MEMORY[0x24BDF6950], "systemWhiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageWithTintColor:", v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIButton setImage:forState:](self->_gaButton, "setImage:forState:", v5, 0);
      -[UIButton addTarget:action:forControlEvents:](self->_gaButton, "addTarget:action:forControlEvents:", self, sel_gaButtonPressed_, 64);
      v12 = self->_gaButton;
      ttyLocString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setAccessibilityLabel:](v12, "setAccessibilityLabel:", v13);

      -[RTTUIConversationViewController view](self, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", self->_gaButton);

      goto LABEL_11;
    }
    if (!self->_gaButton)
      goto LABEL_12;
  }
  -[RTTUIConversationViewController call](self, "call");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v3);

  if (v4)
  {
    -[UIButton removeFromSuperview](self->_gaButton, "removeFromSuperview");
    v5 = self->_gaButton;
    self->_gaButton = 0;
LABEL_11:

  }
LABEL_12:
  -[RTTUIConversationViewController updateInputEnabled](self, "updateInputEnabled");
}

- (void)updateTableViewSizeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double MinY;
  unsigned int (*v15)(void);
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  _Unwind_Exception *v54;
  _QWORD v55[9];
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  void *v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v3 = a3;
  -[RTTUIConversationViewController updateGAButton](self, "updateGAButton");
  objc_msgSend(MEMORY[0x24BDF6B60], "activeKeyboardSceneDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleFrameInView:", 0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v61.origin.x = v7;
  v61.origin.y = v9;
  v61.size.width = v11;
  v61.size.height = v13;
  MinY = CGRectGetMinY(v61);
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v15 = (unsigned int (*)(void))getAXUIKeyboardIsOnScreenSymbolLoc_ptr;
  v60 = getAXUIKeyboardIsOnScreenSymbolLoc_ptr;
  v16 = MEMORY[0x24BDAC760];
  if (!getAXUIKeyboardIsOnScreenSymbolLoc_ptr)
  {
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __getAXUIKeyboardIsOnScreenSymbolLoc_block_invoke;
    v56[3] = &unk_24D657DD0;
    v56[4] = &v57;
    __getAXUIKeyboardIsOnScreenSymbolLoc_block_invoke((uint64_t)v56);
    v15 = (unsigned int (*)(void))v58[3];
  }
  _Block_object_dispose(&v57, 8);
  if (!v15)
  {
    v54 = (_Unwind_Exception *)-[RTTUIConversationControllerCoordinator registerForCallUpdates:].cold.1();
    _Block_object_dispose(&v57, 8);
    _Unwind_Resume(v54);
  }
  if (!v15() || v13 == 0.0 || (-[RTTUITextView isFirstResponder](self->_textView, "isFirstResponder") & 1) == 0)
  {
    -[RTTUIConversationViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18;
    -[RTTUIConversationViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "window");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "safeAreaInsets");
    MinY = v19 - v22;

  }
  -[RTTUITextView frame](self->_textView, "frame");
  v24 = v23;
  v26 = v25;
  if ((objc_msgSend(MEMORY[0x24BE4BD98], "deviceHasHomeButton") & 1) == 0
    && objc_msgSend(MEMORY[0x24BE4BD98], "deviceIsPhone"))
  {
    -[RTTUIConversationViewController view](self, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "window");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "windowScene");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "statusBarManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "statusBarFrame");
    CGRectGetHeight(v62);

  }
  +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bubbleInsetForMe:", 1);
  v33 = v32;
  v35 = v34;

  v36 = (void *)MEMORY[0x24BE7CB78];
  -[RTTUIConversationViewController currentContactPath](self, "currentContactPath");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIConversationViewController textViewUtterance](self, "textViewUtterance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "utteranceWithContactPath:andText:", v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIConversationViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "bounds");
  +[RTTUIUtteranceCell heightForUtterance:andWidth:](RTTUIUtteranceCell, "heightForUtterance:andWidth:", v39, CGRectGetWidth(v63) + 20.0);
  v42 = v35 + v33 + v41;

  if (soft_AXProcessIsRTTNotificationContentExtension())
  {
    -[RTTUIConversationViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "bounds");
    v45 = v44 - v42 + -5.0;

    -[RTTUIConversationViewController view](self, "view");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bounds");
    v26 = v47 + -5.0;

  }
  else
  {
    -[RTTUITextView ttyBarHeight](self->_textView, "ttyBarHeight");
    v45 = MinY - (v42 + v48 + 5.0);
  }
  v55[0] = v16;
  v55[1] = 3221225472;
  v55[2] = __63__RTTUIConversationViewController_updateTableViewSizeAnimated___block_invoke;
  v55[3] = &unk_24D657CA0;
  v55[4] = self;
  v55[5] = v24;
  *(double *)&v55[6] = v45;
  *(double *)&v55[7] = v26;
  *(double *)&v55[8] = v42;
  v49 = MEMORY[0x219A04408](v55);
  v50 = (void *)v49;
  if (v3)
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v49, 0.2);
  else
    (*(void (**)(uint64_t))(v49 + 16))(v49);
  -[RTTUIConversationViewController tableView](self, "tableView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "numberOfRowsInSection:", 0);

  if (v52)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v52 - 1, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIConversationViewController _scrollToIndexPathIfNecessary:animated:](self, "_scrollToIndexPathIfNecessary:animated:", v53, v3);

  }
}

uint64_t __63__RTTUIConversationViewController_updateTableViewSizeAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MaxY;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double MinY;
  void *v33;
  int v34;
  void *v35;
  CGRect v37;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 976);
  v4 = (void *)MEMORY[0x24BDF6870];
  objc_msgSend(*(id *)(v2 + 968), "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "bezierPathWithRoundedRect:cornerRadius:", v6 + 15.0, v7 + 2.0, v8 + -30.0, v9 + -4.0, 20.0);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "setPath:", objc_msgSend(v10, "CGPath"));

  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 968);
  objc_msgSend(v11, "beginningOfDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "caretRectForPosition:", v12);
  v14 = v13;

  v15 = v14 + v14;
  v37.origin.x = *(CGFloat *)(a1 + 40);
  v37.origin.y = *(CGFloat *)(a1 + 48);
  v37.size.width = *(CGFloat *)(a1 + 56);
  v16 = *(double *)(a1 + 64);
  v37.size.height = v16;
  MaxY = CGRectGetMaxY(v37);
  if (v15 <= v16)
  {
    v19 = MaxY + -40.0;
    v18 = *(double *)(a1 + 64);
  }
  else
  {
    v18 = *(double *)(a1 + 64);
    v19 = MaxY + v18 * -0.5 + -17.5;
  }
  v20 = *(_QWORD *)(a1 + 40);
  v21 = *(_QWORD *)(a1 + 48);
  v22 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setFrame:", CGRectGetWidth(*(CGRect *)(&v18 - 3)) + -55.0, v19, 40.0, 35.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setHidden:", 0);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  MinY = v31;

  objc_msgSend(*(id *)(a1 + 32), "call");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isConnected");

  if (v34)
    MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setFrame:", v26, v28, v30, MinY);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "showTextViewForCurrentCall") ^ 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "setHidden:", objc_msgSend(*(id *)(a1 + 32), "showTextViewForCurrentCall") ^ 1);
}

- (void)setupTableView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int IsRTTNotificationContentExtension;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  RTTUITextView *v16;
  void *v17;
  RTTUITextView *v18;
  RTTUITextView *textView;
  void *v20;
  int v21;
  RTTUITextView *v22;
  void *v23;
  RTTUITextView *v24;
  void *v25;
  void *v26;
  RTTUITextView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  RTTUITextView *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  CAShapeLayer *v40;
  CAShapeLayer *bubbleLayer;
  CAShapeLayer *v42;
  void *v43;
  CAShapeLayer *v44;
  void *v45;
  CAShapeLayer *v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  CGRect v51;
  CGRect v52;

  objc_msgSend(MEMORY[0x24BE7CB58], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldSuppressIncomingNotification:", -[RTTUIConversationViewController isCurrentCallConnected](self, "isCurrentCallConnected"));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_updateViewForKeyboard_, *MEMORY[0x24BDF7B80], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_updateViewForKeyboard_, *MEMORY[0x24BDF7B78], 0);

  -[RTTUIConversationViewController contactDisplayString](self, "contactDisplayString");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  -[RTTUIConversationViewController setTitle:](self, "setTitle:");
  v6 = objc_alloc(MEMORY[0x24BDF6E58]);
  -[RTTUIConversationViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = (void *)objc_msgSend(v6, "initWithFrame:");

  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setDataSource:", self);
  objc_msgSend(v8, "setSeparatorStyle:", 0);
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("AXRTTConversationCellIdentifier"));
  IsRTTNotificationContentExtension = soft_AXProcessIsRTTNotificationContentExtension();
  if (!-[RTTUIConversationViewController isCurrentCallConnected](self, "isCurrentCallConnected")
    || IsRTTNotificationContentExtension)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.001);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v11);

  }
  objc_msgSend(v8, "setContentInset:", 15.0, 0.0, 0.0, 0.0);
  objc_msgSend(v8, "setCanCancelContentTouches:", 1);
  -[RTTUIConversationViewController setTableView:](self, "setTableView:", v8);
  -[RTTUIConversationViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v8);

  -[UITableView reloadData](self->_tableView, "reloadData");
  v13 = objc_alloc(MEMORY[0x24BDD1458]);
  ttyLocString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithString:", v14);

  v16 = [RTTUITextView alloc];
  -[RTTUIConversationViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bounds");
  v18 = -[RTTUITextView initWithFrame:textContainer:](v16, "initWithFrame:textContainer:", 0);
  textView = self->_textView;
  self->_textView = v18;

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUITextView setFont:](self->_textView, "setFont:", v20);

  v21 = soft_AXProcessIsRTTNotificationContentExtension();
  v22 = self->_textView;
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUITextView setBackgroundColor:](v22, "setBackgroundColor:", v23);

    v24 = self->_textView;
    objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUITextView setTextColor:](v24, "setTextColor:", v25);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUITextView setTextColor:](v22, "setTextColor:", v26);

    v27 = self->_textView;
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUITextView setBackgroundColor:](v27, "setBackgroundColor:", v25);
  }

  -[RTTUITextView setDelegate:](self->_textView, "setDelegate:", self);
  -[RTTUIConversationViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "addSubview:", self->_textView);

  -[RTTUITextView textContainer](self->_textView, "textContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setLineBreakMode:", 0);

  -[RTTUITextView textContainer](self->_textView, "textContainer");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMaximumNumberOfLines:", 0);

  -[RTTUITextView setDataDetectorTypes:](self->_textView, "setDataDetectorTypes:", -1);
  -[RTTUITextView setEditable:](self->_textView, "setEditable:", 1);
  -[RTTUITextView setSelectable:](self->_textView, "setSelectable:", 1);
  -[RTTUIConversationViewController call](self, "call");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v30) = +[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v31);

  if ((_DWORD)v30)
    -[RTTUITextView setInlinePredictionType:](self->_textView, "setInlinePredictionType:", 1);
  -[RTTUITextView setScrollEnabled:](self->_textView, "setScrollEnabled:", 0);
  -[RTTUITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", 11.0, 24.0, 0.0, 50.0);
  -[RTTUITextView setAttributedPlaceholder:](self->_textView, "setAttributedPlaceholder:", v15);
  v32 = self->_textView;
  -[RTTUIConversationViewController call](self, "call");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUITextView setKeyboardType:](v32, "setKeyboardType:", objc_msgSend(v33, "supportsTTYWithVoice") ^ 1);

  -[RTTUITextView setAutoresizingMask:](self->_textView, "setAutoresizingMask:", 2);
  v34 = objc_alloc_init(MEMORY[0x24BDE5758]);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFillColor:", objc_msgSend(v35, "cgColor"));

  v36 = (void *)MEMORY[0x24BDF6870];
  -[RTTUITextView layer](self->_textView, "layer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  objc_msgSend(v36, "bezierPathWithRect:");
  v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v34, "setPath:", objc_msgSend(v38, "CGPath"));

  -[RTTUITextView layer](self->_textView, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "insertSublayer:atIndex:", v34, 0);

  v40 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x24BDE5758]);
  bubbleLayer = self->_bubbleLayer;
  self->_bubbleLayer = v40;

  v42 = self->_bubbleLayer;
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setFillColor:](v42, "setFillColor:", objc_msgSend(v43, "cgColor"));

  v44 = self->_bubbleLayer;
  objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setStrokeColor:](v44, "setStrokeColor:", objc_msgSend(v45, "cgColor"));

  v46 = self->_bubbleLayer;
  v47 = (void *)MEMORY[0x24BDF6870];
  -[RTTUITextView layer](self->_textView, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "bounds");
  v52 = CGRectInset(v51, 5.0, 5.0);
  objc_msgSend(v47, "bezierPathWithRoundedRect:cornerRadius:", v52.origin.x, v52.origin.y, v52.size.width, v52.size.height, 15.0);
  v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[CAShapeLayer setPath:](v46, "setPath:", objc_msgSend(v49, "CGPath"));

  objc_msgSend(v34, "addSublayer:", self->_bubbleLayer);
  -[RTTUIConversationViewController updateViewForKeyboard:](self, "updateViewForKeyboard:", 0);

}

- (void)shareCallInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[RTTUIUtilities sharedUtilityProvider](RTTUIUtilities, "sharedUtilityProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIConversationViewController conversation](self, "conversation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transcriptStringForConversation:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranscript:", v8);

  v9 = objc_alloc(MEMORY[0x24BDF67E0]);
  v13[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithActivityItems:applicationActivities:", v10, 0);

  objc_msgSend(v11, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSourceView:", v4);

  -[RTTUIConversationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

- (void)updateViewForKeyboard:(id)a3
{
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __57__RTTUIConversationViewController_updateViewForKeyboard___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateTableViewSizeAnimated:", 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (a4 == 3)
  {
    -[RTTUIConversationViewController cannedResponses](self, "cannedResponses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "count");

  }
  else if (a4 == 1)
  {
    v9 = -[NSMutableArray count](self->_serviceUpdates, "count");
  }
  else if (a4)
  {
    v9 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BE7CB60]);
    v8 = (void *)objc_msgSend(v7, "initWithServiceUpdateType:options:", *MEMORY[0x24BE7CBA0], 0);
    v9 = 0;
    if ((-[NSMutableArray containsObject:](self->_serviceUpdates, "containsObject:", v8) & 1) == 0)
    {
      -[RTTUIConversationViewController conversation](self, "conversation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "utterances");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "count");

    }
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  double v10;
  RTTUIResponseCell *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v5 = a4;
  -[RTTUIConversationViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "utterances");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTUIConversationViewController cannedResponses](self, "cannedResponses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "row");
  v10 = 20.0;
  switch(objc_msgSend(v5, "section"))
  {
    case 0:
      if (v9 < objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "objectAtIndex:", v9);
        v11 = (RTTUIResponseCell *)objc_claimAutoreleasedReturnValue();
        -[RTTUIConversationViewController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bounds");
        +[RTTUIUtteranceCell heightForUtterance:andWidth:](RTTUIUtteranceCell, "heightForUtterance:andWidth:", v11, CGRectGetWidth(v23));
        v10 = v13;

        goto LABEL_10;
      }
      break;
    case 1:
      -[NSMutableArray objectAtIndex:](self->_serviceUpdates, "objectAtIndex:", objc_msgSend(v5, "row"));
      v11 = (RTTUIResponseCell *)objc_claimAutoreleasedReturnValue();
      -[RTTUIConversationViewController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      +[RTTUIServiceUpdateCell heightForWidth:delegate:serviceUpdate:](RTTUIServiceUpdateCell, "heightForWidth:delegate:serviceUpdate:", self, v11, CGRectGetWidth(v25));
      v10 = v21;

      goto LABEL_10;
    case 2:
      v10 = 50.0;
      break;
    case 3:
      if (v9 < objc_msgSend(v8, "count"))
      {
        v11 = objc_alloc_init(RTTUIResponseCell);
        -[RTTUIResponseCell textLabel](v11, "textLabel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectAtIndex:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setText:", v15);

        -[RTTUIResponseCell textLabel](v11, "textLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTTUIConversationViewController tableView](self, "tableView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "bounds");
        objc_msgSend(v16, "textRectForBounds:limitedToNumberOfLines:", 0, 0.0, 0.0, CGRectGetWidth(v24), 3.40282347e38);
        v19 = v18;

        if (v19 + 25.0 >= 35.0)
          v10 = v19 + 25.0;
        else
          v10 = 35.0;
LABEL_10:

      }
      break;
    default:
      break;
  }

  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  RTTUIResponseCell *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  RTTUITextView *textView;
  void *v22;
  AXDispatchTimer *realTimeTimeout;
  NSObject *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD v47[5];
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "row");
  v9 = objc_msgSend(v7, "section");
  if (v9 == 3)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("AXRTTUIResponseCellIdentifier"));
    v10 = (RTTUIResponseCell *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      v10 = -[RTTUIResponseCell initWithStyle:reuseIdentifier:]([RTTUIResponseCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("AXRTTUIResponseCellIdentifier"));
    -[RTTUIConversationViewController cannedResponses](self, "cannedResponses");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v8 >= v27)
    {
      v29 = 0;
    }
    else
    {
      -[RTTUIConversationViewController cannedResponses](self, "cannedResponses");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectAtIndex:", v8);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[RTTUIResponseCell textLabel](v10, "textLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v29);

    if (-[RTTUIConversationViewController isCurrentCallOnHold](self, "isCurrentCallOnHold"))
      v31 = 0;
    else
      v31 = -[RTTUIConversationViewController currentCallIsDowngraded](self, "currentCallIsDowngraded") ^ 1;
    -[RTTUIResponseCell setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", v31);
    goto LABEL_23;
  }
  if (v9 == 1)
  {
    -[NSMutableArray objectAtIndex:](self->_serviceUpdates, "objectAtIndex:", objc_msgSend(v7, "row"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RTTUIServiceUpdateCell initWithStyle:reuseIdentifier:serviceUpdate:]([RTTUIServiceUpdateCell alloc], "initWithStyle:reuseIdentifier:serviceUpdate:", 0, CFSTR("AXRTTUIServiceCellIdentifier"), v29);
    -[RTTUIResponseCell setDelegate:](v10, "setDelegate:", self);
LABEL_23:

    goto LABEL_35;
  }
  if (v9)
  {
LABEL_36:
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("EmptyCell"), v7);
    v10 = (RTTUIResponseCell *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("AXRTTConversationCellIdentifier"), v7);
  v10 = (RTTUIResponseCell *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    v10 = -[RTTUIUtteranceCell initWithStyle:reuseIdentifier:]([RTTUIUtteranceCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("AXRTTConversationCellIdentifier"));
  -[RTTUIConversationViewController conversation](self, "conversation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "utterances");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", v8);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTTUIResponseCell setUtterance:](v10, "setUtterance:", v43);
  -[RTTUIResponseCell setDelegate:](v10, "setDelegate:", self);
  -[RTTUIConversationViewController call](self, "call");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v13))
    goto LABEL_26;
  +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "inProgressRealTimeUtterance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contactPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "contactPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqualToString:", v16))
  {
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "inProgressRealTimeIndexPath");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v40, "isEqual:", v7))
  {

    goto LABEL_25;
  }
  +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "inProgressRealTimeUtterance");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "text");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v37, "isEqualToString:", v17);

  if ((v36 & 1) == 0)
  {
    +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "inProgressRealTimeUtterance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "updateText:", v20);

    textView = self->_textView;
    objc_msgSend(v43, "text");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUITextView setText:](textView, "setText:", v22);

    -[RTTUIConversationViewController setCurrentUtterance:](self, "setCurrentUtterance:", v43);
    realTimeTimeout = self->_realTimeTimeout;
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __67__RTTUIConversationViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v47[3] = &unk_24D657A60;
    v47[4] = self;
    -[AXDispatchTimer afterDelay:processBlock:](realTimeTimeout, "afterDelay:processBlock:", v47, 3.0);
    AXLogRTT();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      -[RTTUIConversationViewController currentUtterance](self, "currentUtterance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v25;
      _os_log_impl(&dword_216E9C000, v24, OS_LOG_TYPE_INFO, "this cell is not using the right utterance because we have one in flight, swapping with current utterance: %@", buf, 0xCu);

    }
  }
LABEL_27:
  -[RTTUIConversationViewController conversation](self, "conversation");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "utterances");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "count") - 1 != v8)
  {

    goto LABEL_31;
  }
  v34 = objc_msgSend(v43, "isMe");

  if (v34)
  {
    -[RTTUIConversationViewController call](self, "call");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIResponseCell setEditingUtterance:](v10, "setEditingUtterance:", objc_msgSend(v32, "isConnected"));
LABEL_31:

  }
  objc_initWeak((id *)buf, self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __67__RTTUIConversationViewController_tableView_cellForRowAtIndexPath___block_invoke_338;
    v44[3] = &unk_24D657CC8;
    v45 = v43;
    objc_copyWeak(&v46, (id *)buf);
    -[RTTUIResponseCell _setAccessibilityIsRealtimeElementBlock:](v10, "_setAccessibilityIsRealtimeElementBlock:", v44);
    objc_destroyWeak(&v46);

  }
  objc_destroyWeak((id *)buf);

LABEL_35:
  if (!v10)
    goto LABEL_36;
LABEL_37:

  return v10;
}

uint64_t __67__RTTUIConversationViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRealtimeTimeout");
}

uint64_t __67__RTTUIConversationViewController_tableView_cellForRowAtIndexPath___block_invoke_338(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(*(id *)(a1 + 32), "isMe") & 1) != 0)
    return 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "conversation", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "utterances");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v11, "isMe"))
        {
          v2 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v11);
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v2 = 0;
LABEL_13:

  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = objc_msgSend(v5, "row");
  v7 = objc_msgSend(v5, "section");

  if (v7 == 3)
  {
    -[RTTUIConversationViewController cannedResponses](self, "cannedResponses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 < objc_msgSend(v8, "count"))
    {
      objc_msgSend(v8, "objectAtIndex:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingString:", CFSTR(" "));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      +[RTTUIConversationControllerCoordinator sharedInstance](RTTUIConversationControllerCoordinator, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendNewUtteranceString:controller:", v10, self);

      AXPerformBlockAsynchronouslyOnMainThread();
    }

  }
}

void __69__RTTUIConversationViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfRowsInSection:", 0);

  if (v3 >= 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v3 - 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scrollToRowAtIndexPath:atScrollPosition:animated:", v4, 3, 1);

  }
}

- (void)_updateTableViewRowAtIndexPath:(id)a3 action:(int64_t)a4 animation:(int64_t)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v11 = a3;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = a3;
    objc_msgSend(v8, "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[RTTUIConversationViewController _updateTableViewRowsAtIndexPaths:action:animation:](self, "_updateTableViewRowsAtIndexPaths:action:animation:", v10, a4, a5, v11, v12);
  }
}

- (void)_updateTableViewRowsAtIndexPaths:(id)a3 action:(int64_t)a4 animation:(int64_t)a5
{
  id v8;
  uint64_t *v9;
  id *v10;
  void (*v11)(uint64_t);
  void (**v12)(_QWORD);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  if (a4 == 2)
  {
    v9 = &v13;
    v10 = (id *)&v14;
    v13 = MEMORY[0x24BDAC760];
    v11 = __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke_3;
  }
  else if (a4 == 1)
  {
    v9 = &v15;
    v10 = (id *)&v16;
    v15 = MEMORY[0x24BDAC760];
    v11 = __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke_2;
  }
  else
  {
    if (a4)
    {
      v12 = 0;
      goto LABEL_9;
    }
    v9 = &v17;
    v10 = (id *)&v18;
    v17 = MEMORY[0x24BDAC760];
    v11 = __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke;
  }
  v9[1] = 3221225472;
  v9[2] = (uint64_t)v11;
  v9[3] = (uint64_t)&unk_24D657CF0;
  objc_copyWeak(v10, &location);
  v9[4] = (uint64_t)v8;
  v9[6] = a5;
  v12 = (void (**)(_QWORD))MEMORY[0x219A04408](v9);

  objc_destroyWeak(v10);
LABEL_9:
  v12[2](v12);
  objc_destroyWeak(&location);

}

void __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

void __85__RTTUIConversationViewController__updateTableViewRowsAtIndexPaths_action_animation___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteRowsAtIndexPaths:withRowAnimation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

- (void)utteranceCellDidUpdateContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[RTTUIConversationViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCell:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[RTTUIConversationViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__RTTUIConversationViewController_utteranceCellDidUpdateContent___block_invoke;
    v8[3] = &unk_24D6579F8;
    v8[4] = self;
    v9 = v7;
    objc_msgSend(v6, "performBatchUpdates:completion:", v8, 0);

  }
}

uint64_t __65__RTTUIConversationViewController_utteranceCellDidUpdateContent___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateTableViewRowAtIndexPath:action:animation:", *(_QWORD *)(a1 + 40), 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_scrollToIndexPathIfNecessary:animated:", *(_QWORD *)(a1 + 40), 1);
}

- (void)textViewDidChangeSelection:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[RTTUIConversationViewController call](self, "call");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v4))
    goto LABEL_4;
  objc_msgSend(v7, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    -[RTTUIConversationViewController currentUtterance](self, "currentUtterance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resetTimeout");
LABEL_4:

  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSUInteger v31;
  void *v32;
  NSUInteger v33;
  const __CFString *v34;
  const __CFString *transform;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  length = a4.length;
  location = a4.location;
  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  -[RTTUIConversationViewController call](self, "call");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v11))
    goto LABEL_4;
  objc_msgSend(v9, "text");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "length"))
  {

LABEL_4:
    goto LABEL_5;
  }
  v24 = objc_msgSend(v10, "length");

  if (v24)
  {
LABEL_5:
    if (self->_unsupportedCharacterSet)
    {
      v33 = location;
      v13 = objc_msgSend(v10, "length");
      v14 = (void *)objc_msgSend(v10, "mutableCopy");
      if (v13)
      {
        v31 = length;
        v32 = v9;
        v15 = 0;
        v16 = 0;
        v17 = 0;
        transform = (const __CFString *)*MEMORY[0x24BDBD670];
        v34 = (const __CFString *)*MEMORY[0x24BDBD660];
        do
        {
          v18 = objc_msgSend(v10, "characterAtIndex:", v15);
          if (-[NSMutableCharacterSet characterIsMember:](self->_unsupportedCharacterSet, "characterIsMember:", v18))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKey:](self->_asciiSubstitutions, "objectForKey:", v19);
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (!v20)
            {
              v20 = (__CFString *)objc_msgSend(v19, "mutableCopy");
              CFStringTransform(v20, 0, transform, 0);
              CFStringTransform(v20, 0, v34, 0);
              if ((-[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("?")) & 1) != 0
                || -[__CFString isEqualToString:](v20, "isEqualToString:", v19))
              {
                -[__CFString setString:](v20, "setString:", CFSTR(" "));
              }
            }
            v17 = 1;
            objc_msgSend(v14, "replaceCharactersInRange:withString:", v16 + v15, 1, v20);
            v16 = v16 + -[__CFString length](v20, "length") - 1;

          }
          ++v15;
        }
        while (v13 != v15);
        if ((v17 & 1) != 0)
        {
          v9 = v32;
          objc_msgSend(v32, "text");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "stringByReplacingCharactersInRange:withString:", v33, v31, v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v32, "setText:", v22);
          -[RTTUIConversationViewController textViewDidChange:](self, "textViewDidChange:", v32);

          v23 = 0;
        }
        else
        {
          v23 = 1;
          v9 = v32;
        }
      }
      else
      {
        v23 = 1;
      }

    }
    else
    {
      v23 = 1;
    }
    goto LABEL_25;
  }
  -[RTTUIConversationViewController conversation](self, "conversation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastUtteranceForMe:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "resetTimeout");
  objc_msgSend(v26, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTTUIConversationViewController setTextViewUtterance:](self, "setTextViewUtterance:", v27);

  -[RTTUIConversationViewController setCurrentUtterance:](self, "setCurrentUtterance:", v26);
  AXLogRTT();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v26, "text");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v29;
    _os_log_impl(&dword_216E9C000, v28, OS_LOG_TYPE_INFO, "Should text view change: %@", buf, 0xCu);

  }
  -[RTTUIConversationViewController realtimeTextDidChange](self, "realtimeTextDidChange");

  v23 = 0;
LABEL_25:

  return v23;
}

- (void)textViewDidChange:(id)a3
{
  id v4;
  AXDispatchTimer *ttyPredictionsTimer;
  id v6;
  AXDispatchTimer *v7;
  AXDispatchTimer *v8;
  AXDispatchTimer *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  dispatch_time_t v13;
  _QWORD v14[5];
  id v15;
  id location;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RTTUIConversationViewController updateTableViewSizeAnimated:](self, "updateTableViewSizeAnimated:", 1);
  -[RTTUITextView setShowTTYPredictions:](self->_textView, "setShowTTYPredictions:", 0);
  ttyPredictionsTimer = self->_ttyPredictionsTimer;
  if (!ttyPredictionsTimer)
  {
    v6 = objc_alloc(MEMORY[0x24BDFE490]);
    v7 = (AXDispatchTimer *)objc_msgSend(v6, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    v8 = self->_ttyPredictionsTimer;
    self->_ttyPredictionsTimer = v7;

    ttyPredictionsTimer = self->_ttyPredictionsTimer;
  }
  -[AXDispatchTimer cancel](ttyPredictionsTimer, "cancel");
  objc_initWeak(&location, self);
  v9 = self->_ttyPredictionsTimer;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __53__RTTUIConversationViewController_textViewDidChange___block_invoke;
  v14[3] = &unk_24D657D18;
  v14[4] = self;
  objc_copyWeak(&v15, &location);
  -[AXDispatchTimer afterDelay:processBlock:](v9, "afterDelay:processBlock:", v14, 1.75);
  -[RTTUIConversationViewController call](self, "call");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[RTTUIUtilities ttyShouldBeRealtimeForCall:](RTTUIUtilities, "ttyShouldBeRealtimeForCall:", v10);

  if (v11)
  {
    AXLogRTT();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_216E9C000, v12, OS_LOG_TYPE_INFO, "Text view did change: %@", buf, 0xCu);
    }

    -[RTTUIConversationViewController realtimeTextDidChange](self, "realtimeTextDidChange");
  }
  v13 = dispatch_time(0, 100000000);
  dispatch_after(v13, MEMORY[0x24BDAC9B8], &__block_literal_global_0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __53__RTTUIConversationViewController_textViewDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "setShowTTYPredictions:", 1);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "updateTableViewSizeAnimated:", 0);

}

void __53__RTTUIConversationViewController_textViewDidChange___block_invoke_352()
{
  UIAccessibilityPostNotification(0x421u, 0);
}

- (BOOL)utteranceIsSelected
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[RTTUITextView selectedRange](self->_textView, "selectedRange");
  if (v3)
  {
    *((_BYTE *)v10 + 24) = 1;
  }
  else if ((-[RTTUITextView isEditing](self->_textView, "isEditing") & 1) == 0)
  {
    -[RTTUIConversationViewController tableView](self, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleCells");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __54__RTTUIConversationViewController_utteranceIsSelected__block_invoke;
    v8[3] = &unk_24D657D80;
    v8[4] = &v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  }
  v6 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __54__RTTUIConversationViewController_utteranceIsSelected__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v11;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v11;
    objc_msgSend(v8, "selectedTextRange");
    if (v9)
    {
      objc_msgSend(v8, "selectedTextRange");
      if (v10)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        *a4 = 1;
      }
    }

    v7 = v11;
  }

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  BOOL v5;
  void *v6;
  objc_super v8;

  if (sel__define_ == a3)
  {
    objc_msgSend(MEMORY[0x24BDF6B48], "sharedInputModeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_msgSend(v6, "deviceStateIsLocked") & 1) == 0
      && -[RTTUIConversationViewController utteranceIsSelected](self, "utteranceIsSelected");

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)RTTUIConversationViewController;
    return -[RTTUIConversationViewController canPerformAction:withSender:](&v8, sel_canPerformAction_withSender_);
  }
  return v5;
}

- (void)_define:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;

  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__0;
  v31 = __Block_byref_object_dispose__0;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3010000000;
  v25 = 0;
  v26 = 0;
  v24 = &unk_216EB9895;
  v25 = -[RTTUITextView selectedRange](self->_textView, "selectedRange");
  v26 = v5;
  if (v22[5])
  {
    -[RTTUITextView text](self->_textView, "text");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v28[5];
    v28[5] = v6;

    v8 = -[RTTUITextView selectedRange](self->_textView, "selectedRange");
    v9 = v22;
    v22[4] = v8;
    v9[5] = v10;
  }
  else
  {
    -[RTTUIConversationViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "visibleCells");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __43__RTTUIConversationViewController__define___block_invoke;
    v20[3] = &unk_24D657DA8;
    v20[4] = &v27;
    v20[5] = &v21;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v20);

  }
  if (objc_msgSend((id)v28[5], "length"))
  {
    -[RTTUIConversationViewController setLookupController:](self, "setLookupController:", 0);
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v13 = (void *)getDDParsecCollectionViewControllerClass_softClass;
    v37 = getDDParsecCollectionViewControllerClass_softClass;
    if (!getDDParsecCollectionViewControllerClass_softClass)
    {
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __getDDParsecCollectionViewControllerClass_block_invoke;
      v33[3] = &unk_24D657DD0;
      v33[4] = &v34;
      __getDDParsecCollectionViewControllerClass_block_invoke((uint64_t)v33);
      v13 = (void *)v35[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v34, 8);
    v15 = [v14 alloc];
    v16 = (void *)objc_msgSend(v15, "initWithString:range:", v28[5], v22[4], v22[5]);
    -[RTTUIConversationViewController setLookupController:](self, "setLookupController:", v16);

    -[RTTUIConversationViewController lookupController](self, "lookupController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setModalPresentationStyle:", 6);

    -[RTTUIConversationViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTTUIConversationViewController lookupController](self, "lookupController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentModalViewController:withTransition:", v19, 0);

  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void __43__RTTUIConversationViewController__define___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = v18;
    v9 = objc_msgSend(v8, "selectedTextRange");
    if (v10)
    {
      v11 = v9;
      v12 = v10;
      objc_msgSend(v8, "utterance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "text");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      *(_QWORD *)(v17 + 32) = v11;
      *(_QWORD *)(v17 + 40) = v12;
      *a4 = 1;
    }

    v7 = v18;
  }

}

- (RTTConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (id)rttConversationAvailabilityCallback
{
  return self->_rttConversationAvailabilityCallback;
}

- (void)setRttConversationAvailabilityCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1088);
}

- (DDParsecCollectionViewController)lookupController
{
  return self->_lookupController;
}

- (void)setLookupController:(id)a3
{
  objc_storeStrong((id *)&self->_lookupController, a3);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (RTTUtterance)currentUtterance
{
  return self->_currentUtterance;
}

- (void)setCurrentUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_currentUtterance, a3);
}

- (TUCall)call
{
  return self->_call;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_call, 0);
  objc_storeStrong((id *)&self->_currentUtterance, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_lookupController, 0);
  objc_storeStrong(&self->_rttConversationAvailabilityCallback, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_textInputQuickCoalescer, 0);
  objc_storeStrong((id *)&self->_sleepTimerDisabledAssertion, 0);
  objc_storeStrong((id *)&self->_serviceUpdates, 0);
  objc_storeStrong((id *)&self->_voAnnouncementBuffer, 0);
  objc_storeStrong((id *)&self->_voAnnouncementTimer, 0);
  objc_storeStrong((id *)&self->_asciiSubstitutions, 0);
  objc_storeStrong((id *)&self->_unsupportedCharacterSet, 0);
  objc_storeStrong((id *)&self->_muteStatusTimeout, 0);
  objc_storeStrong((id *)&self->_realTimeTimeout, 0);
  objc_storeStrong((id *)&self->_ttyPredictionsTimer, 0);
  objc_storeStrong((id *)&self->_gaButton, 0);
  objc_storeStrong((id *)&self->_bubbleLayer, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

- (void)isCurrentCallReceivingOnHold
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216E9C000, log, OS_LOG_TYPE_ERROR, "Call hold status string missing", v1, 2u);
}

- (void)utteranceCellAtIndexPath:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_1(&dword_216E9C000, v2, v3, "Wrong cell type found at index path: %@. Expected update cell, got %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)serviceUpdateCellAtIndexPath:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)OUTLINED_FUNCTION_3();
  v1 = OUTLINED_FUNCTION_0(v0);
  OUTLINED_FUNCTION_1(&dword_216E9C000, v2, v3, "Wrong cell type found at index path: %@. Expected service cell, got %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
