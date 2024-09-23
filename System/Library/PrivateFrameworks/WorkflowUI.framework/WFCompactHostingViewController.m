@implementation WFCompactHostingViewController

- (WFCompactHostingViewController)initWithScreenLocked:(BOOL)a3 delegate:(id)a4
{
  id v6;
  WFCompactHostingViewController *v7;
  WFCompactHostingViewController *v8;
  uint64_t v9;
  WFCompactUnlockService *unlockService;
  id v11;
  _BOOL4 v12;
  double v13;
  uint64_t v14;
  WFDebouncer *singleStepShortcutCompletionDialogDebouncer;
  void *v16;
  void *v17;
  WFCompactHostingViewController *v18;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WFCompactHostingViewController;
  v7 = -[WFCompactHostingViewController init](&v20, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_screenIsLocked = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = objc_opt_new();
    unlockService = v8->_unlockService;
    v8->_unlockService = (WFCompactUnlockService *)v9;

    v8->_allowedInterfaceOrientations = 30;
    v11 = objc_alloc(MEMORY[0x24BEC3C60]);
    v12 = WFIsRunningOniPad();
    v13 = 0.1;
    if (v12)
      v13 = 0.2;
    v14 = objc_msgSend(v11, "initWithDelay:maximumDelay:queue:", MEMORY[0x24BDAC9B8], v13, 0.8);
    singleStepShortcutCompletionDialogDebouncer = v8->_singleStepShortcutCompletionDialogDebouncer;
    v8->_singleStepShortcutCompletionDialogDebouncer = (WFDebouncer *)v14;

    -[WFCompactHostingViewController singleStepShortcutCompletionDialogDebouncer](v8, "singleStepShortcutCompletionDialogDebouncer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addTarget:action:", v8, sel_handlePendingRequest);

    -[WFCompactHostingViewController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 6);
    -[WFCompactHostingViewController setModalTransitionStyle:](v8, "setModalTransitionStyle:", 2);
    objc_msgSend(MEMORY[0x24BEC2EF8], "beginObservingKeyboardNotifications");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel_keyboardWillChange, *MEMORY[0x24BEC2F58], 0);

    v18 = v8;
  }

  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC2F58], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFCompactHostingViewController;
  -[WFCompactHostingViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFCompactHostingViewController;
  -[WFCompactHostingViewController loadView](&v11, sel_loadView);
  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(v3, "setAlpha:", 0.0);
  -[WFCompactHostingViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.200000003);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v3, "setAutoresizingMask:", 18);
  -[WFCompactHostingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v3);

  -[WFCompactHostingViewController setDimmingView:](self, "setDimmingView:", v3);
  objc_msgSend(MEMORY[0x24BE64060], "materialViewWithRecipe:options:initialWeighting:", 6, 0, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);
  -[WFCompactHostingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  objc_msgSend(v7, "setFrame:");

  objc_msgSend(v7, "setAutoresizingMask:", 18);
  -[WFCompactHostingViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v7);

  -[WFCompactHostingViewController setMaterialView:](self, "setMaterialView:", v7);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_handleTapGesture_);
  objc_msgSend(v7, "addGestureRecognizer:", v10);

}

- (void)handleTapGesture:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  if (objc_msgSend(a3, "state") == 3)
  {
    -[WFCompactHostingViewController materialView](self, "materialView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "weighting");
    v6 = v5;

    if (v6 < 1.0
      || -[WFCompactHostingViewController screenIsLocked](self, "screenIsLocked")
      && (objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isVisible"),
          v7,
          (v8 & 1) == 0))
    {
      -[WFCompactHostingViewController cancelAndDismiss](self, "cancelAndDismiss");
    }
    else
    {
      -[WFCompactHostingViewController view](self, "view");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "endEditing:", 1);

    }
  }
}

- (void)cancelAndDismiss
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!-[WFCompactHostingViewController preparingToPresentDialog](self, "preparingToPresentDialog"))
  {
    -[WFCompactHostingViewController progress](self, "progress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      getWFDialogLogObject();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "-[WFCompactHostingViewController cancelAndDismiss]";
        _os_log_impl(&dword_22007E000, v4, OS_LOG_TYPE_DEFAULT, "%s Cancelling NSProgress", buf, 0xCu);
      }

      -[WFCompactHostingViewController progress](self, "progress");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cancel");

    }
    else
    {
      -[WFCompactHostingViewController requestCompletionHandler](self, "requestCompletionHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      getWFDialogLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v15 = "-[WFCompactHostingViewController cancelAndDismiss]";
          _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_DEFAULT, "%s Cancelling request", buf, 0xCu);
        }

        -[WFCompactHostingViewController requestCompletionHandler](self, "requestCompletionHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFCompactHostingViewController setRequestCompletionHandler:](self, "setRequestCompletionHandler:", 0);
        -[WFCompactHostingViewController setHandlingRequest:](self, "setHandlingRequest:", 0);
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __50__WFCompactHostingViewController_cancelAndDismiss__block_invoke;
        v12[3] = &unk_24E6047E0;
        v13 = v9;
        v10 = v9;
        -[WFCompactHostingViewController dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:](self, "dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:", 1, v12);

      }
      else
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v15 = "-[WFCompactHostingViewController cancelAndDismiss]";
          _os_log_impl(&dword_22007E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to cancel; no NSProgress or request to cancel",
            buf,
            0xCu);
        }

        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __50__WFCompactHostingViewController_cancelAndDismiss__block_invoke_128;
        v11[3] = &unk_24E604D88;
        v11[4] = self;
        -[WFCompactHostingViewController dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:](self, "dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:", 1, v11);
      }
    }
  }
}

- (void)keyboardWillChange
{
  -[WFCompactHostingViewController updateChromeVisibilityWithCompletionHandler:](self, "updateChromeVisibilityWithCompletionHandler:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFCompactHostingViewController;
  -[WFCompactHostingViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  if (!-[WFCompactHostingViewController hasViewAppeared](self, "hasViewAppeared"))
  {
    -[WFCompactHostingViewController setHasViewAppeared:](self, "setHasViewAppeared:", 1);
    -[WFCompactHostingViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_rootSheetPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setShouldScaleDownBehindDescendantSheets:", 0);

    -[WFCompactHostingViewController presentChromeIfPossible](self, "presentChromeIfPossible");
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFCompactHostingViewController;
  -[WFCompactHostingViewController viewWillLayoutSubviews](&v6, sel_viewWillLayoutSubviews);
  -[WFCompactHostingViewController pendingRequest](self, "pendingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[WFCompactHostingViewController singleStepShortcutCompletionDialogDebouncer](self, "singleStepShortcutCompletionDialogDebouncer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "poke");

  }
}

- (void)preparePersistentChromeWithContext:(id)a3 attribution:(id)a4
{
  id v8;
  id v9;
  WFWorkflowRunningContext *runningContext;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCompactHostingViewController.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runningContext"));

  }
  runningContext = self->_runningContext;
  if (runningContext && self->_progressSubscriber)
    -[WFWorkflowRunningContext removeProgressSubscriber:](runningContext, "removeProgressSubscriber:");
  objc_storeStrong((id *)&self->_runningContext, a3);
  objc_storeStrong((id *)&self->_runningAttribution, a4);
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__WFCompactHostingViewController_preparePersistentChromeWithContext_attribution___block_invoke;
  aBlock[3] = &unk_24E604808;
  objc_copyWeak(&v15, &location);
  v11 = _Block_copy(aBlock);
  objc_msgSend(v8, "addProgressSubscriberUsingPublishingHandler:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactHostingViewController setProgressSubscriber:](self, "setProgressSubscriber:", v12);

  -[WFCompactHostingViewController presentChromeIfPossible](self, "presentChromeIfPossible");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)presentChromeIfPossible
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  if (-[WFCompactHostingViewController hasViewAppeared](self, "hasViewAppeared"))
  {
    -[WFCompactHostingViewController pendingRequest](self, "pendingRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[WFCompactHostingViewController pendingRequest](self, "pendingRequest");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[WFCompactHostingViewController singleStepShortcutCompletionDialogDebouncer](self, "singleStepShortcutCompletionDialogDebouncer");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "poke");

      }
      else
      {
        -[WFCompactHostingViewController handlePendingRequest](self, "handlePendingRequest");
      }
    }
    else
    {
      -[WFCompactHostingViewController runningContext](self, "runningContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[WFCompactHostingViewController updateChromeVisibilityWithCompletionHandler:](self, "updateChromeVisibilityWithCompletionHandler:", 0);
        -[WFCompactHostingViewController scheduleStatusViewToAppear](self, "scheduleStatusViewToAppear");
      }
    }
  }
}

- (void)setProgress:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_progress, a3);
  v5 = a3;
  -[WFCompactHostingViewController statusViewController](self, "statusViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProgress:", v5);

}

- (void)updateChromeVisibilityWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  double v15;
  int v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  _QWORD v23[5];
  char v24;
  char v25;

  v4 = (void (**)(_QWORD))a3;
  if (-[WFCompactHostingViewController handlingRequest](self, "handlingRequest"))
  {
    v5 = 1;
  }
  else
  {
    -[WFCompactHostingViewController runningContext](self, "runningContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  if (-[WFCompactHostingViewController screenIsLocked](self, "screenIsLocked"))
  {
    v7 = 0;
  }
  else
  {
    -[WFCompactHostingViewController presentedViewController](self, "presentedViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    objc_msgSend(v10, "viewIfLoaded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = objc_msgSend(v11, "wf_containsFirstResponder");
    objc_msgSend(MEMORY[0x24BEC2EF8], "sharedKeyboard");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isVisible") & v10;

    v7 = v5 & (v13 ^ 1);
    v5 = v13;
  }
  -[WFCompactHostingViewController materialView](self, "materialView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "weighting");
  v16 = v15 <= 0.0;

  -[WFCompactHostingViewController dimmingView](self, "dimmingView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "alpha");
  v19 = v18;

  if (v5 == v16 || ((v7 ^ (v19 <= 0.0)) & 1) == 0)
  {
    v20 = (void *)MEMORY[0x24BEBDB00];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __78__WFCompactHostingViewController_updateChromeVisibilityWithCompletionHandler___block_invoke;
    v23[3] = &unk_24E604830;
    v23[4] = self;
    v24 = v7;
    v25 = v5;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __78__WFCompactHostingViewController_updateChromeVisibilityWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_24E604858;
    v22 = v4;
    objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 4, v23, v21, 0.300000012, 0.100000001);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

- (void)presentStatusViewController
{
  void *v3;
  NSObject *v4;
  WFCompactStatusViewController *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[WFCompactHostingViewController runningContext](self, "runningContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFCompactHostingViewController clearStatusViewTimer](self, "clearStatusViewTimer");
    getWFDialogLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[WFCompactHostingViewController presentStatusViewController]";
      _os_log_impl(&dword_22007E000, v4, OS_LOG_TYPE_DEFAULT, "%s Presenting status view", (uint8_t *)&v8, 0xCu);
    }

    -[WFCompactHostingViewController statusViewController](self, "statusViewController");
    v5 = (WFCompactStatusViewController *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v5 = objc_alloc_init(WFCompactStatusViewController);
      -[WFCompactHostingViewController progress](self, "progress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCompactStatusViewController setProgress:](v5, "setProgress:", v6);

      -[WFCompactHostingViewController runningAttribution](self, "runningAttribution");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFCompactStatusViewController setAttribution:](v5, "setAttribution:", v7);

      -[WFCompactHostingViewController setStatusViewController:](self, "setStatusViewController:", v5);
    }
    -[WFCompactHostingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)scheduleStatusViewToAppear
{
  void *v3;
  id v4;

  -[WFCompactHostingViewController runningContext](self, "runningContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_presentStatusViewController, 0, 0, 0.5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[WFCompactHostingViewController setStatusViewTimer:](self, "setStatusViewTimer:", v4);

  }
}

- (void)clearStatusViewTimer
{
  void *v3;

  -[WFCompactHostingViewController statusViewTimer](self, "statusViewTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[WFCompactHostingViewController setStatusViewTimer:](self, "setStatusViewTimer:", 0);
}

- (void)setTouchPassthrough:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a3;
  -[WFCompactHostingViewController dimmingView](self, "dimmingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "setHidden:", 1);

    -[WFCompactHostingViewController materialView](self, "materialView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "setHidden:", 0);

    -[WFCompactHostingViewController materialView](self, "materialView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v8 = 0;
  }
  objc_msgSend(v7, "setHidden:", v8);

}

- (void)handleRequest:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCompactHostingViewController.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFCompactHostingViewController.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

LABEL_3:
  getWFDialogLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[WFCompactHostingViewController handleRequest:completionHandler:]";
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_22007E000, v10, OS_LOG_TYPE_DEFAULT, "%s Received request: %{public}@", buf, 0x16u);
  }

  -[WFCompactHostingViewController setPendingRequest:](self, "setPendingRequest:", v7);
  v11 = (void *)objc_msgSend(v9, "copy");
  -[WFCompactHostingViewController setRequestCompletionHandler:](self, "setRequestCompletionHandler:", v11);

  -[WFCompactHostingViewController presentChromeIfPossible](self, "presentChromeIfPossible");
}

- (void)handlePendingRequest
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  WFCompactHostingViewController *v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFCompactHostingViewController clearStatusViewTimer](self, "clearStatusViewTimer");
  -[WFCompactHostingViewController pendingRequest](self, "pendingRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCompactHostingViewController setHandlingRequest:](self, "setHandlingRequest:", 1);
  -[WFCompactHostingViewController setPendingRequest:](self, "setPendingRequest:", 0);
  -[WFCompactHostingViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = 0;
LABEL_8:
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke;
    v13 = &unk_24E604E80;
    v14 = v3;
    v15 = self;
    v8 = (void (**)(_QWORD))_Block_copy(&v10);
    -[WFCompactHostingViewController presentedViewController](self, "presentedViewController", v10, v11, v12, v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[WFCompactHostingViewController dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:](self, "dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:", 1, v8);
    }
    else
    {
      -[WFCompactHostingViewController updateChromeVisibilityWithCompletionHandler:](self, "updateChromeVisibilityWithCompletionHandler:", 0);
      v8[2](v8);
    }

    goto LABEL_12;
  }
  v5 = objc_msgSend(v4, "canHandleFollowUpRequest:", v3);
  getWFDialogLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFCompactHostingViewController handlePendingRequest]";
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_DEFAULT, "%s Currently presented platter could not handle the follow up, dismissing: %@", buf, 0x16u);
    }

    goto LABEL_8;
  }
  if (v7)
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFCompactHostingViewController handlePendingRequest]";
    _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_DEFAULT, "%s Currently presented platter can handle follow up request", buf, 0xCu);
  }

  objc_msgSend(v4, "handleFollowUpRequest:", v3);
LABEL_12:

}

- (void)dialogViewController:(id)a3 didFinishWithResponse:(id)a4 waitForFollowUpRequest:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  id v18;
  WFCompactHostingViewController *v19;
  id v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__WFCompactHostingViewController_dialogViewController_didFinishWithResponse_waitForFollowUpRequest___block_invoke;
  aBlock[3] = &unk_24E604ED0;
  v11 = v8;
  v18 = v11;
  v19 = self;
  v12 = v9;
  v20 = v12;
  v13 = _Block_copy(aBlock);
  v14 = v13;
  if (v5)
  {
    (*((void (**)(void *))v13 + 2))(v13);
  }
  else
  {
    -[WFCompactHostingViewController setHandlingRequest:](self, "setHandlingRequest:", 0);
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __100__WFCompactHostingViewController_dialogViewController_didFinishWithResponse_waitForFollowUpRequest___block_invoke_2;
    v15[3] = &unk_24E6048A8;
    v15[4] = self;
    v16 = v14;
    -[WFCompactHostingViewController dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:](self, "dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:", 1, v15);

  }
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__WFCompactHostingViewController_dismissPresentedContentWithCompletionHandler___block_invoke;
  aBlock[3] = &unk_24E6048A8;
  aBlock[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[WFCompactHostingViewController setHandlingRequest:](self, "setHandlingRequest:", 0);
  -[WFCompactHostingViewController setPreparingToPresentDialog:](self, "setPreparingToPresentDialog:", 0);
  -[WFCompactHostingViewController setAllowedInterfaceOrientations:](self, "setAllowedInterfaceOrientations:", 30);
  -[WFCompactHostingViewController presentedViewController](self, "presentedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || (-[WFCompactHostingViewController statusViewController](self, "statusViewController"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8 == v9))
  {
    v7[2](v7);
  }
  else
  {
    -[WFCompactHostingViewController clearStatusViewTimer](self, "clearStatusViewTimer");
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __79__WFCompactHostingViewController_dismissPresentedContentWithCompletionHandler___block_invoke_2;
    v10[3] = &unk_24E6048A8;
    v10[4] = self;
    v11 = v7;
    -[WFCompactHostingViewController dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:](self, "dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:", 1, v10);

  }
}

- (void)dismissPlatterViewControllerIfNecessaryAnimated:(BOOL)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  char isKindOfClass;
  _QWORD block[5];
  void (**v10)(_QWORD);
  BOOL v11;

  v6 = (void (**)(_QWORD))a4;
  -[WFCompactHostingViewController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __100__WFCompactHostingViewController_dismissPlatterViewControllerIfNecessaryAnimated_completionHandler___block_invoke;
    block[3] = &unk_24E6048D0;
    block[4] = self;
    v11 = a3;
    v10 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (void)dismissPlatterViewControllerAndUpdateChromeAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[4];
  NSObject *v17;

  v4 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v8 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke;
  v16[3] = &unk_24E604D88;
  v9 = v7;
  v17 = v9;
  -[WFCompactHostingViewController dismissPlatterViewControllerIfNecessaryAnimated:completionHandler:](self, "dismissPlatterViewControllerIfNecessaryAnimated:completionHandler:", v4, v16);
  dispatch_group_enter(v9);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke_2;
  v14[3] = &unk_24E604D88;
  v15 = v9;
  v10 = v9;
  -[WFCompactHostingViewController updateChromeVisibilityWithCompletionHandler:](self, "updateChromeVisibilityWithCompletionHandler:", v14);
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke_3;
  block[3] = &unk_24E6047E0;
  v13 = v6;
  v11 = v6;
  dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], block);

}

- (void)dismissPersistentChromeWithSuccess:(BOOL)a3 customAttribution:(id)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  WFCompactStatusViewController *v18;
  WFCompactStatusViewController *v19;
  void *v20;
  void *v21;
  dispatch_time_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[5];
  id v26;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[WFCompactHostingViewController clearStatusViewTimer](self, "clearStatusViewTimer");
  v10 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__WFCompactHostingViewController_dismissPersistentChromeWithSuccess_customAttribution_completionHandler___block_invoke;
  aBlock[3] = &unk_24E6048A8;
  aBlock[4] = self;
  v11 = v9;
  v26 = v11;
  v12 = _Block_copy(aBlock);
  v13 = v12;
  if (v6)
  {
    -[WFCompactHostingViewController presentedViewController](self, "presentedViewController");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_4;
    v15 = (void *)v14;
    -[WFCompactHostingViewController presentedViewController](self, "presentedViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFCompactHostingViewController statusViewController](self, "statusViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16 == v17)
    {
      -[WFCompactHostingViewController statusViewController](self, "statusViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "transitionToCompleted:animated:", 1, 1);

      v22 = dispatch_time(0, 750000000);
      dispatch_after(v22, MEMORY[0x24BDAC9B8], v13);
    }
    else
    {
LABEL_4:
      v18 = objc_alloc_init(WFCompactStatusViewController);
      v19 = v18;
      if (v8)
      {
        -[WFCompactStatusViewController setAttribution:](v18, "setAttribution:", v8);
      }
      else
      {
        -[WFCompactHostingViewController runningAttribution](self, "runningAttribution");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFCompactStatusViewController setAttribution:](v19, "setAttribution:", v20);

      }
      -[WFCompactStatusViewController transitionToCompleted:animated:](v19, "transitionToCompleted:animated:", 1, 1);
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __105__WFCompactHostingViewController_dismissPersistentChromeWithSuccess_customAttribution_completionHandler___block_invoke_2;
      v23[3] = &unk_24E6047E0;
      v24 = v13;
      -[WFCompactHostingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v19, 1, v23);

    }
  }
  else
  {
    (*((void (**)(void *))v12 + 2))(v12);
  }

}

- (id)presentationAnchorForActionUserInterface:(id)a3
{
  void *v3;
  void *v4;

  -[WFCompactHostingViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)actionUserInterface:(id)a3 showViewControllerInPlatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  WFCompactPlatterViewController *v11;

  v6 = a4;
  v7 = a3;
  v11 = objc_alloc_init(WFCompactPlatterViewController);
  -[WFCompactPlatterViewController platterView](v11, "platterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attribution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAttribution:", v9);
  -[WFCompactPlatterViewController platterView](v11, "platterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applyMaterialViewStyling");

  -[WFCompactPlatterViewController setContentViewController:](v11, "setContentViewController:", v6);
  -[WFCompactHostingViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)actionUserInterface:(id)a3 setSupportedInterfaceOrientations:(unint64_t)a4
{
  -[WFCompactHostingViewController setAllowedInterfaceOrientations:](self, "setAllowedInterfaceOrientations:", a4);
}

- (void)dismissPlatterForActionUserInterface:(id)a3 completionHandler:(id)a4
{
  -[WFCompactHostingViewController dismissPlatterViewControllerIfNecessaryAnimated:completionHandler:](self, "dismissPlatterViewControllerIfNecessaryAnimated:completionHandler:", 1, a4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (WFActionUserInterfaceListener)actionInterfaceListener
{
  return self->_actionInterfaceListener;
}

- (void)setActionInterfaceListener:(id)a3
{
  objc_storeStrong((id *)&self->_actionInterfaceListener, a3);
}

- (WFCompactHostingViewControllerDelegate)delegate
{
  return (WFCompactHostingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)screenIsLocked
{
  return self->_screenIsLocked;
}

- (WFWorkflowRunningContext)runningContext
{
  return self->_runningContext;
}

- (void)setRunningContext:(id)a3
{
  objc_storeStrong((id *)&self->_runningContext, a3);
}

- (WFDialogAttribution)runningAttribution
{
  return self->_runningAttribution;
}

- (void)setRunningAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_runningAttribution, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (id)progressSubscriber
{
  return self->_progressSubscriber;
}

- (void)setProgressSubscriber:(id)a3
{
  objc_storeStrong(&self->_progressSubscriber, a3);
}

- (BOOL)hasViewAppeared
{
  return self->_hasViewAppeared;
}

- (void)setHasViewAppeared:(BOOL)a3
{
  self->_hasViewAppeared = a3;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
  objc_storeStrong((id *)&self->_dimmingView, a3);
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (WFCompactStatusViewController)statusViewController
{
  return self->_statusViewController;
}

- (void)setStatusViewController:(id)a3
{
  objc_storeStrong((id *)&self->_statusViewController, a3);
}

- (NSTimer)statusViewTimer
{
  return self->_statusViewTimer;
}

- (void)setStatusViewTimer:(id)a3
{
  objc_storeStrong((id *)&self->_statusViewTimer, a3);
}

- (unint64_t)allowedInterfaceOrientations
{
  return self->_allowedInterfaceOrientations;
}

- (void)setAllowedInterfaceOrientations:(unint64_t)a3
{
  self->_allowedInterfaceOrientations = a3;
}

- (WFDialogRequest)pendingRequest
{
  return self->_pendingRequest;
}

- (void)setPendingRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingRequest, a3);
}

- (BOOL)handlingRequest
{
  return self->_handlingRequest;
}

- (void)setHandlingRequest:(BOOL)a3
{
  self->_handlingRequest = a3;
}

- (BOOL)preparingToPresentDialog
{
  return self->_preparingToPresentDialog;
}

- (void)setPreparingToPresentDialog:(BOOL)a3
{
  self->_preparingToPresentDialog = a3;
}

- (id)requestCompletionHandler
{
  return self->_requestCompletionHandler;
}

- (void)setRequestCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (WFCompactUnlockService)unlockService
{
  return self->_unlockService;
}

- (WFDebouncer)singleStepShortcutCompletionDialogDebouncer
{
  return self->_singleStepShortcutCompletionDialogDebouncer;
}

- (void)setSingleStepShortcutCompletionDialogDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_singleStepShortcutCompletionDialogDebouncer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleStepShortcutCompletionDialogDebouncer, 0);
  objc_storeStrong((id *)&self->_unlockService, 0);
  objc_storeStrong(&self->_requestCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
  objc_storeStrong((id *)&self->_statusViewTimer, 0);
  objc_storeStrong((id *)&self->_statusViewController, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong(&self->_progressSubscriber, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_runningAttribution, 0);
  objc_storeStrong((id *)&self->_runningContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionInterfaceListener, 0);
}

uint64_t __105__WFCompactHostingViewController_dismissPersistentChromeWithSuccess_customAttribution_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setRunningContext:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRunningAttribution:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "dismissPlatterViewControllerAndUpdateChromeAnimated:completionHandler:", 1, *(_QWORD *)(a1 + 40));
}

void __105__WFCompactHostingViewController_dismissPersistentChromeWithSuccess_customAttribution_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, 500000000);
  dispatch_after(v2, MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

void __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __104__WFCompactHostingViewController_dismissPlatterViewControllerAndUpdateChromeAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __100__WFCompactHostingViewController_dismissPlatterViewControllerIfNecessaryAnimated_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __79__WFCompactHostingViewController_dismissPresentedContentWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setActionInterfaceListener:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__WFCompactHostingViewController_dismissPresentedContentWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "scheduleStatusViewToAppear");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __100__WFCompactHostingViewController_dialogViewController_didFinishWithResponse_waitForFollowUpRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "setTouchPassthrough:", 0);
  objc_msgSend(*(id *)(a1 + 40), "requestCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "requestCompletionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "setRequestCompletionHandler:", 0);
  }
}

uint64_t __100__WFCompactHostingViewController_dialogViewController_didFinishWithResponse_waitForFollowUpRequest___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "scheduleStatusViewToAppear");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__WFCompactHostingViewController_handlePendingRequest__block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int8x16_t v23;
  _QWORD v24[5];
  _QWORD v25[4];
  int8x16_t v26;
  _QWORD v27[5];
  id v28;
  _QWORD block[5];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "setTouchPassthrough:", 1);
    v2 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "wf_dialogViewControllerClass")), "initWithRequest:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 40));
    if (WFIsRunningOniPad())
    {
      v3 = dispatch_time(0, 600000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_2;
      block[3] = &unk_24E604E80;
      block[4] = *(_QWORD *)(a1 + 40);
      v30 = v2;
      dispatch_after(v3, MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v2, 1, 0);
    }

  }
  else if (objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_2556404C0))
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "wf_dialogViewControllerClass")), "initWithRequest:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "setPreparingToPresentDialog:", 1);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_3;
    v27[3] = &unk_24E604E80;
    v27[4] = *(_QWORD *)(a1 + 40);
    v28 = v4;
    v5 = v4;
    objc_msgSend(v5, "prepareForPresentationWithCompletionHandler:", v27);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "unlockService");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_4;
      v25[3] = &unk_24E604880;
      v23 = *(int8x16_t *)(a1 + 32);
      v7 = (id)v23.i64[0];
      v26 = vextq_s8(v23, v23, 8uLL);
      objc_msgSend(v6, "requestUnlockIfNeeded:", v25);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "setTouchPassthrough:", 1);
        objc_msgSend(*(id *)(a1 + 40), "requestCompletionHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(*(id *)(a1 + 40), "view");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bounds");
          +[WFCompactPlatterPresentationController preferredSizeForPresentingInContainerViewOfSize:](WFCompactPlatterPresentationController, "preferredSizeForPresentingInContainerViewOfSize:", v10, v11);
          v13 = v12;

          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_alloc(MEMORY[0x24BE601B8]);
          objc_msgSend(*(id *)(a1 + 40), "traitCollection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithSize:locale:traitCollection:", v14, v16, v13, 1.79769313e308);

          objc_msgSend(*(id *)(a1 + 40), "requestCompletionHandler");
          v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3E70]), "initWithEnvironment:", v17);
          ((void (**)(_QWORD, void *))v18)[2](v18, v19);

          objc_msgSend(*(id *)(a1 + 40), "setRequestCompletionHandler:", 0);
        }
        objc_msgSend(*(id *)(a1 + 40), "setTouchPassthrough:", 0);
        objc_msgSend(*(id *)(a1 + 40), "setHandlingRequest:", 0);
      }
      else
      {
        getWFDialogLogObject();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          v32 = "-[WFCompactHostingViewController handlePendingRequest]_block_invoke";
          v33 = 2114;
          v34 = v21;
          _os_log_impl(&dword_22007E000, v20, OS_LOG_TYPE_ERROR, "%s Could not find a view class to handle the dialog request: %{public}@", buf, 0x16u);
        }

        objc_msgSend(*(id *)(a1 + 40), "setHandlingRequest:", 0);
        v22 = *(void **)(a1 + 40);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_205;
        v24[3] = &unk_24E604D88;
        v24[4] = v22;
        objc_msgSend(v22, "updateChromeVisibilityWithCompletionHandler:", v24);
      }
    }
  }
}

uint64_t __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPreparingToPresentDialog:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_4(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  id v21;

  if ((a2 & 1) != 0)
  {
    v21 = *(id *)(a1 + 40);
    WFUserInterfaceFromViewController();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x24BEC5140]);
    v5 = *MEMORY[0x24BE19950];
    objc_msgSend(v21, "actionClassName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "classNamesByType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "attribution");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithUserInterfaceType:actionClassName:classNamesByType:attribution:", v5, v6, v7, v8);

    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "actionInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v10);

    objc_msgSend(*(id *)(a1 + 32), "setActionInterfaceListener:", v9);
    objc_msgSend(*(id *)(a1 + 32), "requestCompletionHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestCompletionHandler");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x24BEC4070]);
      objc_msgSend(v9, "endpoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "userInterfaceType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v14, "initWithListenerEndpoint:userInterfaceType:", v15, v16);
      ((void (**)(_QWORD, void *))v13)[2](v13, v17);

      objc_msgSend(*(id *)(a1 + 32), "setRequestCompletionHandler:", 0);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "requestCompletionHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestCompletionHandler");
      v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1468]), "initWithCancelled:", 1);
      ((void (**)(_QWORD, void *))v19)[2](v19, v20);

      objc_msgSend(*(id *)(a1 + 32), "setRequestCompletionHandler:", 0);
    }
  }
}

uint64_t __54__WFCompactHostingViewController_handlePendingRequest__block_invoke_205(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "requestCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestCompletionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC1468]), "initWithCancelled:", 1);
    ((void (**)(_QWORD, void *))v3)[2](v3, v4);

    objc_msgSend(*(id *)(a1 + 32), "setRequestCompletionHandler:", 0);
  }
  return objc_msgSend(*(id *)(a1 + 32), "scheduleStatusViewToAppear");
}

void __78__WFCompactHostingViewController_updateChromeVisibilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
    v2 = 1.0;
  else
    v2 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "dimmingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  if (*(_BYTE *)(a1 + 41))
    v4 = 1.0;
  else
    v4 = 0.0;
  objc_msgSend(*(id *)(a1 + 32), "materialView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWeighting:", v4);

}

uint64_t __78__WFCompactHostingViewController_updateChromeVisibilityWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id __81__WFCompactHostingViewController_preparePersistentChromeWithContext_attribution___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  _QWORD aBlock[4];
  id v10;

  v3 = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__WFCompactHostingViewController_preparePersistentChromeWithContext_attribution___block_invoke_2;
  aBlock[3] = &unk_24E604D60;
  v4 = (id *)(a1 + 32);
  objc_copyWeak(&v10, (id *)(a1 + 32));
  v5 = _Block_copy(aBlock);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "setProgress:", v3);
  v7 = _Block_copy(v5);

  objc_destroyWeak(&v10);
  return v7;
}

void __81__WFCompactHostingViewController_preparePersistentChromeWithContext_attribution___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setProgress:", 0);

}

void __50__WFCompactHostingViewController_cancelAndDismiss__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC1468]), "initWithCancelled:", 1);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __50__WFCompactHostingViewController_cancelAndDismiss__block_invoke_128(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      getWFDialogLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = "-[WFCompactHostingViewController cancelAndDismiss]_block_invoke";
        _os_log_impl(&dword_22007E000, v6, OS_LOG_TYPE_DEFAULT, "%s Requesting daemon to cleanup the view service", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hostingViewControllerDidRequestExit:", *(_QWORD *)(a1 + 32));

    }
  }
}

@end
