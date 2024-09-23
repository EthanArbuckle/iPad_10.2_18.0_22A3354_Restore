@implementation SWContainerViewController

- (SWContainerViewController)initWithWebContentViewController:(id)a3 actionProvider:(id)a4 interactionProvider:(id)a5 errorProvider:(id)a6 configurationManager:(id)a7 presentationManager:(id)a8 scaleManager:(id)a9 snapshotManager:(id)a10 preferredSizeManager:(id)a11
{
  SWContainerViewController *v18;
  SWContainerViewController *v19;
  SWDeveloperSettings *v20;
  SWDeveloperSettings *developerSettings;
  UICoordinateSpace *keyboardCoordinateSpace;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CGPoint v28;
  CGSize v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  objc_super v39;

  v38 = a3;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v33 = a8;
  v32 = a9;
  v31 = a10;
  v30 = a11;
  v39.receiver = self;
  v39.super_class = (Class)SWContainerViewController;
  v18 = -[SWContainerViewController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, 0, 0);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_webContentViewController, a3);
    objc_storeStrong((id *)&v19->_actionProvider, a4);
    objc_storeStrong((id *)&v19->_interactionProvider, a5);
    objc_storeStrong((id *)&v19->_errorProvider, a6);
    objc_storeStrong((id *)&v19->_configurationManager, a7);
    objc_storeStrong((id *)&v19->_presentationManager, a8);
    v20 = -[SWDeveloperSettings initWithAllowRemoteInspection:]([SWDeveloperSettings alloc], "initWithAllowRemoteInspection:", NFInternalBuild());
    developerSettings = v19->_developerSettings;
    v19->_developerSettings = v20;

    objc_storeStrong((id *)&v19->_scaleManager, a9);
    objc_storeStrong((id *)&v19->_snapshotManager, a10);
    objc_storeStrong((id *)&v19->_preferredSizeManager, a11);
    v28 = (CGPoint)*MEMORY[0x24BDBF090];
    v29 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    v19->_keyboardFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    v19->_keyboardFrame.size = v29;
    keyboardCoordinateSpace = v19->_keyboardCoordinateSpace;
    v19->_keyboardCoordinateSpace = 0;

    v19->_inputAccessoryViewFrame.origin = v28;
    v19->_inputAccessoryViewFrame.size = v29;
    v19->_isKeyboardVisible = 0;
    v19->_networkStatus = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v19, sel_handleKeyboardShow_, *MEMORY[0x24BDF7A00], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v19, sel_handleKeyboardChange_, *MEMORY[0x24BDF79F0], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v19, sel_handleKeyboardHide_, *MEMORY[0x24BDF7B78], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v19, sel_reachabilityChanged_, *MEMORY[0x24BE6CFA0], 0);

    -[SWContainerViewController updateReachability](v19, "updateReachability");
  }

  return v19;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SWContainerViewController;
  -[SWContainerViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[SWContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerViewController addChildViewController:](self, "addChildViewController:", v5);

  -[SWContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v8);

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didMoveToParentViewController:", self);

  objc_initWeak(&location, self);
  -[SWContainerViewController interactionProvider](self, "interactionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __40__SWContainerViewController_viewDidLoad__block_invoke;
  v11[3] = &unk_24DA0C280;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "onChange:", v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __40__SWContainerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_loadWeakRetained(v2);
  v6 = objc_msgSend(v3, "type");

  objc_msgSend(v4, "setUserInteractionEnabled:", objc_msgSend(v5, "allowUserInteractionForInteractionType:", v6));
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SWContainerViewController;
  -[SWContainerViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SWContainerViewController;
  -[SWContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SWContainerViewController setIsTransitioning:](self, "setIsTransitioning:", 1);
  -[SWContainerViewController updateConfiguration](self, "updateConfiguration");
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__SWContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24DA0C2A8;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __80__SWContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setIsTransitioning:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "updateConfiguration");

}

- (void)prewarm
{
  id v2;

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prewarm");

}

- (void)webViewSetNeedsLayout
{
  id v2;

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "webViewSetNeedsLayout");

}

- (NSURL)loadedURL
{
  void *v2;
  void *v3;

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void)loadURL:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadURL:", v4);

}

- (void)loadURL:(id)a3 cachePolicy:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loadURL:cachePolicy:", v6, a4);

}

- (void)loadHTMLString:(id)a3 baseURL:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "loadHTMLString:baseURL:", v7, v6);

}

- (void)loadLocalDatastore:(id)a3 forceUpdate:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadLocalDatastore:forceUpdate:completion:", v9, v5, v8);

}

- (void)setDeveloperSettings:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;

  objc_storeStrong((id *)&self->_developerSettings, a3);
  v5 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowRemoteInspection");

  objc_msgSend(v7, "setAllowsRemoteInspection:", v6);
}

- (SWScriptsManager)scriptsManager
{
  void *v2;
  void *v3;

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scriptsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SWScriptsManager *)v3;
}

- (BOOL)allowUserInteractionForInteractionType:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

- (void)setInputAccessoryView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputAccessoryView:", v4);

}

- (id)inputAccessoryView
{
  void *v2;
  void *v3;

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTextInputTraits:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTextInputTraits:", v4);

}

- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShortcutsBarWithLeadingGroups:trailingGroups:", v7, v6);

}

- (void)setConfiguration:(id)a3
{
  SWContainerConfiguration *v4;
  SWContainerConfiguration *configuration;

  v4 = (SWContainerConfiguration *)objc_msgSend(a3, "copy");
  configuration = self->_configuration;
  self->_configuration = v4;

  -[SWContainerViewController updateConfiguration](self, "updateConfiguration");
}

- (void)updateConfiguration
{
  void *v3;
  void *v4;
  SWKeyboardConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  SWKeyboardConfiguration *v24;
  void *v25;
  id v26;

  -[SWContainerViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SWConfiguration configurationWithContainerConfiguration:](SWConfiguration, "configurationWithContainerConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = [SWKeyboardConfiguration alloc];
  -[SWContainerViewController convertedKeyboardFrame](self, "convertedKeyboardFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SWContainerViewController convertedInputAccessoryViewFrame](self, "convertedInputAccessoryViewFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = objc_msgSend(MEMORY[0x24BDF6B38], "isSplit");
  v23 = objc_msgSend(MEMORY[0x24BDF6B38], "isFloating");
  v24 = -[SWKeyboardConfiguration initWithKeyboardFrame:inputAccessoryViewFrame:isKeyboardSplit:isKeyboardFloating:isHardwareKeyboard:isKeyboardVisible:](v5, "initWithKeyboardFrame:inputAccessoryViewFrame:isKeyboardSplit:isKeyboardFloating:isHardwareKeyboard:isKeyboardVisible:", v22, v23, objc_msgSend(MEMORY[0x24BDF6B18], "isInHardwareKeyboardMode"), -[SWContainerViewController isKeyboardVisible](self, "isKeyboardVisible"), v7, v9, v11, v13, v15, v17, v19, v21);
  objc_msgSend(v26, "setKeyboardConfiguration:", v24);
  objc_msgSend(v26, "setNetworkStatus:", -[SWContainerViewController networkStatus](self, "networkStatus"));
  objc_msgSend(v26, "setIsTransitioning:", -[SWContainerViewController isTransitioning](self, "isTransitioning"));
  -[SWContainerViewController configurationManager](self, "configurationManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setConfiguration:", v26);

}

- (void)setFocusShouldStartInputSession:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFocusShouldStartInputSession:", v3);

}

- (BOOL)focusShouldStartInputSession
{
  void *v2;
  char v3;

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "focusShouldStartInputSession");

  return v3;
}

- (SWMessageHandlerManager)messageHandlerManager
{
  void *v2;
  void *v3;

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messageHandlerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SWMessageHandlerManager *)v3;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)handleKeyboardChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  id v29;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "objectForKey:", *MEMORY[0x24BDF7A20]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v4, "object");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "coordinateSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SWContainerViewController setKeyboardFrame:](self, "setKeyboardFrame:", v7, v9, v11, v13);
  -[SWContainerViewController setKeyboardCoordinateSpace:](self, "setKeyboardCoordinateSpace:", v15);
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "inputAccessoryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17
    && (objc_msgSend(v17, "superview"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    objc_msgSend(v17, "coordinateSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[SWContainerViewController keyboardCoordinateSpace](self, "keyboardCoordinateSpace");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertRect:toCoordinateSpace:", v28, v21, v23, v25, v27);
    -[SWContainerViewController setInputAccessoryViewFrame:](self, "setInputAccessoryViewFrame:");

  }
  else
  {
    -[SWContainerViewController setInputAccessoryViewFrame:](self, "setInputAccessoryViewFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  -[SWContainerViewController updateConfiguration](self, "updateConfiguration");

}

- (CGRect)convertedKeyboardFrame
{
  uint64_t v3;
  void *v4;
  _BOOL4 IsEmpty;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  -[SWContainerViewController keyboardCoordinateSpace](self, "keyboardCoordinateSpace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[SWContainerViewController keyboardFrame](self, "keyboardFrame"),
        IsEmpty = CGRectIsEmpty(v20),
        v4,
        !IsEmpty))
  {
    -[SWContainerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWContainerViewController keyboardCoordinateSpace](self, "keyboardCoordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWContainerViewController keyboardFrame](self, "keyboardFrame");
    objc_msgSend(v11, "convertRect:toCoordinateSpace:", v10);
    v6 = v12;
    v7 = v13;
    v8 = v14;
    v9 = v15;

  }
  else
  {
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v16 = v6;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)convertedInputAccessoryViewFrame
{
  uint64_t v3;
  void *v4;
  _BOOL4 IsEmpty;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect result;

  -[SWContainerViewController keyboardCoordinateSpace](self, "keyboardCoordinateSpace");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[SWContainerViewController inputAccessoryViewFrame](self, "inputAccessoryViewFrame"),
        IsEmpty = CGRectIsEmpty(v20),
        v4,
        !IsEmpty))
  {
    -[SWContainerViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWContainerViewController keyboardCoordinateSpace](self, "keyboardCoordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWContainerViewController inputAccessoryViewFrame](self, "inputAccessoryViewFrame");
    objc_msgSend(v11, "convertRect:toCoordinateSpace:", v10);
    v6 = v12;
    v7 = v13;
    v8 = v14;
    v9 = v15;

  }
  else
  {
    v6 = *MEMORY[0x24BDBF090];
    v7 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v8 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v9 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v16 = v6;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)handleKeyboardShow:(id)a3
{
  -[SWContainerViewController setIsKeyboardVisible:](self, "setIsKeyboardVisible:", 1);
  -[SWContainerViewController updateConfiguration](self, "updateConfiguration");
}

- (void)handleKeyboardHide:(id)a3
{
  -[SWContainerViewController setIsKeyboardVisible:](self, "setIsKeyboardVisible:", 0);
  -[SWContainerViewController updateConfiguration](self, "updateConfiguration");
}

- (void)removeMenusForIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeMenusForIdentifiers:", v4);

}

- (void)updateReachability
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6CF78], "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SWContainerViewController setNetworkStatus:](self, "setNetworkStatus:", objc_msgSend(v3, "currentReachabilityStatus"));

}

- (void)reachabilityChanged:(id)a3
{
  -[SWContainerViewController updateReachability](self, "updateReachability", a3);
  -[SWContainerViewController updateConfiguration](self, "updateConfiguration");
}

- (void)addContentRuleList:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SWContainerViewController webContentViewController](self, "webContentViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentRuleManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addContentRuleList:identifier:", v7, v6);

}

- (SWContainerConfiguration)configuration
{
  return self->_configuration;
}

- (SWActionProvider)actionProvider
{
  return self->_actionProvider;
}

- (SWInteractionProvider)interactionProvider
{
  return self->_interactionProvider;
}

- (SWErrorProvider)errorProvider
{
  return self->_errorProvider;
}

- (SWConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (SWPresentationManager)presentationManager
{
  return self->_presentationManager;
}

- (SWDeveloperSettings)developerSettings
{
  return self->_developerSettings;
}

- (SWScaleManager)scaleManager
{
  return self->_scaleManager;
}

- (SWSnapshotManager)snapshotManager
{
  return self->_snapshotManager;
}

- (SWPreferredSizeManager)preferredSizeManager
{
  return self->_preferredSizeManager;
}

- (SWViewController)webContentViewController
{
  return self->_webContentViewController;
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (UICoordinateSpace)keyboardCoordinateSpace
{
  return self->_keyboardCoordinateSpace;
}

- (void)setKeyboardCoordinateSpace:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardCoordinateSpace, a3);
}

- (BOOL)isKeyboardVisible
{
  return self->_isKeyboardVisible;
}

- (void)setIsKeyboardVisible:(BOOL)a3
{
  self->_isKeyboardVisible = a3;
}

- (CGRect)inputAccessoryViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inputAccessoryViewFrame.origin.x;
  y = self->_inputAccessoryViewFrame.origin.y;
  width = self->_inputAccessoryViewFrame.size.width;
  height = self->_inputAccessoryViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInputAccessoryViewFrame:(CGRect)a3
{
  self->_inputAccessoryViewFrame = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (int64_t)networkStatus
{
  return self->_networkStatus;
}

- (void)setNetworkStatus:(int64_t)a3
{
  self->_networkStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardCoordinateSpace, 0);
  objc_storeStrong((id *)&self->_webContentViewController, 0);
  objc_storeStrong((id *)&self->_preferredSizeManager, 0);
  objc_storeStrong((id *)&self->_snapshotManager, 0);
  objc_storeStrong((id *)&self->_scaleManager, 0);
  objc_storeStrong((id *)&self->_developerSettings, 0);
  objc_storeStrong((id *)&self->_presentationManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_errorProvider, 0);
  objc_storeStrong((id *)&self->_interactionProvider, 0);
  objc_storeStrong((id *)&self->_actionProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
