@implementation SURedeemCameraViewController

+ (BOOL)cameraSupported
{
  return +[SUCodeRedeemerController cameraSupported](SUCodeRedeemerController, "cameraSupported");
}

- (void)performAction:(int64_t)a3 withObject:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  int64_t v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__SURedeemCameraViewController_performAction_withObject___block_invoke;
  block[3] = &unk_24DE7B7B8;
  v9 = v6;
  v10 = a3;
  block[4] = self;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __57__SURedeemCameraViewController_performAction_withObject___block_invoke(uint64_t result)
{
  switch(*(_QWORD *)(result + 48))
  {
    case 0:
      result = objc_msgSend(*(id *)(result + 32), "dismissViewControllerAnimated:completion:", 1, 0);
      break;
    case 2:
      result = objc_msgSend(*(id *)(result + 32), "_pauseCamera");
      break;
    case 3:
      result = objc_msgSend(*(id *)(result + 32), "_resumeCamera");
      break;
    case 4:
      result = objc_msgSend(*(id *)(result + 32), "_recognitionError");
      break;
    case 5:
      result = objc_msgSend(*(id *)(result + 32), "_recognitionSuccess");
      break;
    case 6:
      result = objc_msgSend(*(id *)(result + 32), "_setBackButtonTitle:", *(_QWORD *)(result + 40));
      break;
    default:
      return result;
  }
  return result;
}

- (void)setIgnoreDefaultKeyboardNotifications:(BOOL)a3
{
  self->_ignoreDefaultKeyboardNotifications = a3;
  -[SURedeemCameraViewController _setupNotifications](self, "_setupNotifications");
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  -[SURedeemCameraViewController _updateState](self, "_updateState");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SURedeemCameraViewController;
  -[SURedeemCameraViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[SURedeemCameraViewController _setup](self, "_setup");
  -[SURedeemCameraViewController setState:](self, "setState:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SURedeemCameraViewController;
  -[SURedeemCameraViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SURedeemCameraViewController _startCameraController](self, "_startCameraController");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SURedeemCameraViewController;
  -[SURedeemCameraViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SURedeemCameraViewController _stopCameraController](self, "_stopCameraController");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SURedeemCameraViewController;
  -[SURedeemCameraViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[SURedeemCameraViewController cameraController](self, "cameraController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURedeemCameraViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[SURedeemCameraViewController activityIndicator](self, "activityIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURedeemCameraViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "center");
  v9 = v8;
  -[SURedeemCameraViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  -[SURedeemCameraViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaInsets");
  objc_msgSend(v6, "setCenter:", v9, v12 - v14 + -44.0 + -64.0);

  -[SURedeemCameraViewController _layoutCodeTextField](self, "_layoutCodeTextField");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SURedeemCameraViewController;
  -[SURedeemCameraViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[SURedeemCameraViewController setKeyboardHeight:](self, "setKeyboardHeight:", 0.0);
  -[SURedeemCameraViewController _dismissKeyboard](self, "_dismissKeyboard");
}

- (void)loadView
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDF6F90]);
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[SURedeemCameraViewController setView:](self, "setView:", v4);
}

- (void)_setup
{
  -[SURedeemCameraViewController _setupCameraController](self, "_setupCameraController");
  -[SURedeemCameraViewController _setupCodeTextField](self, "_setupCodeTextField");
  -[SURedeemCameraViewController _setupNavigationItem](self, "_setupNavigationItem");
  -[SURedeemCameraViewController _setupNotifications](self, "_setupNotifications");
  -[SURedeemCameraViewController _setupOverlayView](self, "_setupOverlayView");
  -[SURedeemCameraViewController _setupActivityIndicator](self, "_setupActivityIndicator");
}

- (void)_setupActivityIndicator
{
  UIActivityIndicatorView *v3;
  void *v4;
  UIActivityIndicatorView *activityIndicator;

  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 0);
  -[UIActivityIndicatorView setAlpha:](v3, "setAlpha:", 0.0);
  -[UIActivityIndicatorView setHidden:](v3, "setHidden:", 1);
  -[SURedeemCameraViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

  activityIndicator = self->_activityIndicator;
  self->_activityIndicator = v3;

}

- (void)_setupCameraController
{
  SUCodeRedeemerController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (objc_msgSend((id)objc_opt_class(), "cameraSupported"))
  {
    v3 = objc_alloc_init(SUCodeRedeemerController);
    -[SURedeemCameraViewController setCameraController:](self, "setCameraController:", v3);

    -[SURedeemCameraViewController cameraController](self, "cameraController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "willMoveToParentViewController:", self);

    -[SURedeemCameraViewController cameraController](self, "cameraController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURedeemCameraViewController addChildViewController:](self, "addChildViewController:", v5);

    -[SURedeemCameraViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURedeemCameraViewController cameraController](self, "cameraController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v8);

    -[SURedeemCameraViewController cameraController](self, "cameraController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "didMoveToParentViewController:", self);

  }
}

- (void)_setupCodeTextField
{
  SURedeemCodeTextField *v3;
  void *v4;
  void *v5;
  void *v6;
  SURedeemCodeTextField *codeTextField;

  v3 = -[SURedeemCodeTextField initWithHeight:]([SURedeemCodeTextField alloc], "initWithHeight:", 44.0);
  -[SURedeemCodeTextField setDelegate:](v3, "setDelegate:", self);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ENTER_CODE_MANUALLY"), &stru_24DE83F60, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURedeemCodeTextField setPlaceholder:](v3, "setPlaceholder:", v5);

  -[SURedeemCameraViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v3);

  codeTextField = self->_codeTextField;
  self->_codeTextField = v3;

}

- (void)_setupNavigationItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  -[SURedeemCameraViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SCAN_CARD"), &stru_24DE83F60, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v5);

  -[SURedeemCameraViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonAction);
  objc_msgSend(v6, "setLeftBarButtonItem:", v7);

  v8 = objc_alloc(MEMORY[0x24BDF6860]);
  v9 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("CameraFlip.png"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithImage:style:target:action:", v11, 0, self, sel__toggleCameraButtonAction);
  -[SURedeemCameraViewController setToggleCameraBarButton:](self, "setToggleCameraBarButton:", v12);

  v13 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("REDEEM"), &stru_24DE83F60, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithTitle:style:target:action:", v14, 0, self, sel__redeemButtonAction);
  -[SURedeemCameraViewController setRedeemBarButton:](self, "setRedeemBarButton:", v15);

}

- (void)_setupNotifications
{
  void *v3;
  uint64_t v4;
  __CFString **v5;
  _QWORD *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1
    && -[SURedeemCameraViewController ignoreDefaultKeyboardNotifications](self, "ignoreDefaultKeyboardNotifications"))
  {
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__layoutCodeTextFieldWithNotification_, CFSTR("SUKeyboardDidChangeNotification"), 0);
    v5 = SUKeyboardWillChangeNotification;
  }
  else
  {
    v6 = (_QWORD *)MEMORY[0x24BDF7B80];
    if (v4 == 1)
      v6 = (_QWORD *)MEMORY[0x24BDF7A00];
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__layoutCodeTextFieldWithNotification_, *v6, 0);
    v5 = (__CFString **)MEMORY[0x24BDF7B78];
  }
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__layoutCodeTextFieldWithNotification_, *v5, 0);

}

- (void)_setupOverlayView
{
  UIView *v3;
  void *v4;
  UIView *overlayView;
  void *v6;
  void *v7;
  id v8;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  -[UIView setAlpha:](v3, "setAlpha:", 0.0);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  -[UIView setHidden:](v3, "setHidden:", 1);
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__overlayTapAction);
  -[UIView addGestureRecognizer:](v3, "addGestureRecognizer:", v8);
  overlayView = self->_overlayView;
  self->_overlayView = v3;

  -[SURedeemCameraViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURedeemCameraViewController overlayView](self, "overlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v7);

}

- (void)_cancelButtonAction
{
  -[SURedeemCameraViewController _dismissKeyboard](self, "_dismissKeyboard");
  -[SURedeemCameraViewController setState:](self, "setState:", 0);
  -[SURedeemCameraViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_redeemButtonAction
{
  void *v3;
  id v4;

  -[SURedeemCameraViewController _dismissKeyboard](self, "_dismissKeyboard");
  -[SURedeemCameraViewController codeTextField](self, "codeTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[SURedeemCameraViewController _detectedCode:](self, "_detectedCode:", v4);
}

- (void)_setBackButtonTitle:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x24BDF6860];
  v5 = a3;
  v7 = (id)objc_msgSend([v4 alloc], "initWithTitle:style:target:action:", v5, 0, self, sel__cancelButtonAction);

  -[SURedeemCameraViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLeftBarButtonItem:", v7);

}

- (void)_toggleCameraButtonAction
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[SURedeemCameraViewController toggleCameraBarButton](self, "toggleCameraBarButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEnabled:", 0);

  objc_initWeak(&location, self);
  -[SURedeemCameraViewController cameraController](self, "cameraController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__SURedeemCameraViewController__toggleCameraButtonAction__block_invoke;
  v5[3] = &unk_24DE7B5C8;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "toggleCameraWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __57__SURedeemCameraViewController__toggleCameraButtonAction__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "toggleCameraBarButton");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setEnabled:", 1);

}

- (void)_overlayTapAction
{
  void *v3;

  if (-[SURedeemCameraViewController state](self, "state") != 2)
  {
    -[SURedeemCameraViewController codeTextField](self, "codeTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", 0);

    -[SURedeemCameraViewController _dismissKeyboard](self, "_dismissKeyboard");
  }
}

- (void)_pauseCamera
{
  -[SURedeemCameraViewController setState:](self, "setState:", 2);
}

- (void)_recognitionError
{
  id v2;

  -[SURedeemCameraViewController cameraController](self, "cameraController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognitionError");

}

- (void)_recognitionSuccess
{
  id v2;

  -[SURedeemCameraViewController cameraController](self, "cameraController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recognitionSuccess");

}

- (void)_resumeCamera
{
  -[SURedeemCameraViewController setState:](self, "setState:", 0);
}

- (void)_startActivityIndicator
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  -[SURedeemCameraViewController activityIndicator](self, "activityIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startAnimating");

  -[SURedeemCameraViewController activityIndicator](self, "activityIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 0);

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__SURedeemCameraViewController__startActivityIndicator__block_invoke;
  v5[3] = &unk_24DE7B230;
  v5[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v5, 0.5);
}

void __55__SURedeemCameraViewController__startActivityIndicator__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_stopAcitivityIndicator
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__SURedeemCameraViewController__stopAcitivityIndicator__block_invoke;
  v3[3] = &unk_24DE7B230;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__SURedeemCameraViewController__stopAcitivityIndicator__block_invoke_2;
  v2[3] = &unk_24DE7C1A8;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v3, v2, 0.5);
}

void __55__SURedeemCameraViewController__stopAcitivityIndicator__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __55__SURedeemCameraViewController__stopAcitivityIndicator__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);

  objc_msgSend(*(id *)(a1 + 32), "activityIndicator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimating");

}

- (void)_startCameraController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!-[SURedeemCameraViewController state](self, "state"))
  {
    -[SURedeemCameraViewController cameraController](self, "cameraController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      -[SURedeemCameraViewController cameraController](self, "cameraController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDelegate:", self);

      -[SURedeemCameraViewController cameraController](self, "cameraController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startSession");

    }
  }
}

- (void)_stopCameraController
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SURedeemCameraViewController cameraController](self, "cameraController");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[SURedeemCameraViewController cameraController](self, "cameraController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[SURedeemCameraViewController cameraController](self, "cameraController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", 0);

      -[SURedeemCameraViewController cameraController](self, "cameraController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancel");

    }
  }
}

- (void)_hideOverlay
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__SURedeemCameraViewController__hideOverlay__block_invoke;
  v3[3] = &unk_24DE7B230;
  v3[4] = self;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __44__SURedeemCameraViewController__hideOverlay__block_invoke_2;
  v2[3] = &unk_24DE7C1A8;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v3, v2, 0.5);
}

void __44__SURedeemCameraViewController__hideOverlay__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void __44__SURedeemCameraViewController__hideOverlay__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)_showOverlay
{
  void *v3;
  _QWORD v4[5];

  -[SURedeemCameraViewController overlayView](self, "overlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SURedeemCameraViewController__showOverlay__block_invoke;
  v4[3] = &unk_24DE7B230;
  v4[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 0.5);
}

void __44__SURedeemCameraViewController__showOverlay__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.4);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  -[SURedeemCameraViewController setState:](self, "setState:", 1);
  return 1;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  if (-[SURedeemCameraViewController state](self, "state", a3) == 1)
    -[SURedeemCameraViewController setState:](self, "setState:", 0);
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[SURedeemCameraViewController _redeemButtonAction](self, "_redeemButtonAction", a3);
  return 1;
}

- (void)codeRedeemerControllerDidEndWithCode:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  SURedeemCameraViewController *v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__SURedeemCameraViewController_codeRedeemerControllerDidEndWithCode_error___block_invoke;
  block[3] = &unk_24DE7B118;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __75__SURedeemCameraViewController_codeRedeemerControllerDidEndWithCode_error___block_invoke(uint64_t a1)
{
  void *v3;

  if (*(_QWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_presentCameraErrorAlert");
    return objc_msgSend(*(id *)(a1 + 48), "_recognitionError");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "codeTextField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setText:", *(_QWORD *)(a1 + 40));

    return objc_msgSend(*(id *)(a1 + 48), "_detectedCode:", *(_QWORD *)(a1 + 40));
  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SURedeemCameraViewController;
  -[SURedeemCameraViewController dealloc](&v4, sel_dealloc);
}

- (void)_detectedCode:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[SURedeemCameraViewController codeHandler](self, "codeHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SURedeemCameraViewController codeHandler](self, "codeHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (void)_dismissKeyboard
{
  id v2;

  -[SURedeemCameraViewController view](self, "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endEditing:", 1);

}

- (void)_layoutCodeTextField
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id v14;

  -[SURedeemCameraViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (-[SURedeemCameraViewController state](self, "state") == 1)
  {
    v8 = 44.0;
  }
  else
  {
    -[SURedeemCameraViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeAreaInsets");
    v8 = v10 + 44.0;

  }
  -[SURedeemCameraViewController codeTextField](self, "codeTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURedeemCameraViewController keyboardHeight](self, "keyboardHeight");
  objc_msgSend(v11, "setFrame:", 0.0, v7 - v12 - v8, v5, v8);

  -[SURedeemCameraViewController overlayView](self, "overlayView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[SURedeemCameraViewController keyboardHeight](self, "keyboardHeight");
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, v5, v7 - v13 - v8);

}

- (void)_layoutCodeTextFieldWithNotification:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  float v29;
  double v30;
  _QWORD v31[5];

  v4 = a3;
  v5 = 0.0;
  if (-[SURedeemCameraViewController state](self, "state") == 1)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDF7A20]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v5 = v14;

    if (!-[SURedeemCameraViewController ignoreDefaultKeyboardNotifications](self, "ignoreDefaultKeyboardNotifications"))
    {
      -[SURedeemCameraViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SURedeemCameraViewController view](self, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "window");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "convertRect:fromView:", v17, v9, v11, v13, v5);
      v11 = v18;
      v5 = v19;

    }
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "userInterfaceIdiom");

    if (v21 == 1)
    {
      -[SURedeemCameraViewController view](self, "view");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bounds");
      v5 = v23 - v11;

    }
  }
  -[SURedeemCameraViewController setKeyboardHeight:](self, "setKeyboardHeight:", fmax(v5, 0.0));
  objc_msgSend(v4, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "valueForKey:", *MEMORY[0x24BDF79B8]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (int)objc_msgSend(v25, "intValue");

  objc_msgSend(v4, "userInfo");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "valueForKey:", *MEMORY[0x24BDF79C0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  v30 = v29;

  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __69__SURedeemCameraViewController__layoutCodeTextFieldWithNotification___block_invoke;
  v31[3] = &unk_24DE7B230;
  v31[4] = self;
  objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", v26, v31, 0, v30, 0.0);

}

uint64_t __69__SURedeemCameraViewController__layoutCodeTextFieldWithNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutCodeTextField");
}

- (void)_presentCameraErrorAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  -[SURedeemCameraViewController _pauseCamera](self, "_pauseCamera");
  v3 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("REDEEM_CAMERA_ERROR_TITLE"), &stru_24DE83F60, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REDEEM_CAMERA_ERROR_MESSAGE"), &stru_24DE83F60, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v9 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24DE83F60, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __56__SURedeemCameraViewController__presentCameraErrorAlert__block_invoke;
  v16 = &unk_24DE7C1D0;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addAction:", v12, v13, v14, v15, v16);
  -[SURedeemCameraViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

void __56__SURedeemCameraViewController__presentCameraErrorAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resumeCamera");

}

- (void)_updateState
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!-[SURedeemCameraViewController state](self, "state"))
  {
    -[SURedeemCameraViewController _stopAcitivityIndicator](self, "_stopAcitivityIndicator");
    -[SURedeemCameraViewController _dismissKeyboard](self, "_dismissKeyboard");
    -[SURedeemCameraViewController _startCameraController](self, "_startCameraController");
    -[SURedeemCameraViewController _hideOverlay](self, "_hideOverlay");
    -[SURedeemCameraViewController codeTextField](self, "codeTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v5 = v4;
    v6 = 1;
    goto LABEL_8;
  }
  if (-[SURedeemCameraViewController state](self, "state") == 2)
  {
    -[SURedeemCameraViewController _startActivityIndicator](self, "_startActivityIndicator");
    -[SURedeemCameraViewController _stopCameraController](self, "_stopCameraController");
    -[SURedeemCameraViewController _showOverlay](self, "_showOverlay");
    -[SURedeemCameraViewController _dismissKeyboard](self, "_dismissKeyboard");
    -[SURedeemCameraViewController overlayView](self, "overlayView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);

    -[SURedeemCameraViewController codeTextField](self, "codeTextField");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 0;
LABEL_8:
    objc_msgSend(v4, "setUserInteractionEnabled:", v6);

    goto LABEL_9;
  }
  if (-[SURedeemCameraViewController state](self, "state") == 1)
  {
    -[SURedeemCameraViewController _stopAcitivityIndicator](self, "_stopAcitivityIndicator");
    -[SURedeemCameraViewController _stopCameraController](self, "_stopCameraController");
    -[SURedeemCameraViewController _showOverlay](self, "_showOverlay");
    -[SURedeemCameraViewController overlayView](self, "overlayView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_9:
  -[SURedeemCameraViewController _updateNavigationItemAnimated](self, "_updateNavigationItemAnimated");
}

- (void)_updateNavigationItemAnimated
{
  uint64_t v3;
  void *v4;
  id v5;

  if (!-[SURedeemCameraViewController state](self, "state"))
  {
    -[SURedeemCameraViewController navigationItem](self, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SURedeemCameraViewController toggleCameraBarButton](self, "toggleCameraBarButton");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v4 = (void *)v3;
    objc_msgSend(v5, "setRightBarButtonItem:", v3);

    goto LABEL_8;
  }
  if (-[SURedeemCameraViewController state](self, "state") != 2)
  {
    if (-[SURedeemCameraViewController state](self, "state") != 1)
      return;
    -[SURedeemCameraViewController navigationItem](self, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SURedeemCameraViewController redeemBarButton](self, "redeemBarButton");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  -[SURedeemCameraViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItem:", 0);
LABEL_8:

}

- (BOOL)ignoreDefaultKeyboardNotifications
{
  return self->_ignoreDefaultKeyboardNotifications;
}

- (id)codeHandler
{
  return self->_codeHandler;
}

- (void)setCodeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (SUCodeRedeemerController)cameraController
{
  return self->_cameraController;
}

- (void)setCameraController:(id)a3
{
  objc_storeStrong((id *)&self->_cameraController, a3);
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (void)setKeyboardHeight:(double)a3
{
  self->_keyboardHeight = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_activityIndicator, a3);
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (UIBarButtonItem)redeemBarButton
{
  return self->_redeemBarButton;
}

- (void)setRedeemBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_redeemBarButton, a3);
}

- (SURedeemCodeTextField)codeTextField
{
  return self->_codeTextField;
}

- (void)setCodeTextField:(id)a3
{
  objc_storeStrong((id *)&self->_codeTextField, a3);
}

- (UIBarButtonItem)toggleCameraBarButton
{
  return self->_toggleCameraBarButton;
}

- (void)setToggleCameraBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_toggleCameraBarButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleCameraBarButton, 0);
  objc_storeStrong((id *)&self->_codeTextField, 0);
  objc_storeStrong((id *)&self->_redeemBarButton, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_cameraController, 0);
  objc_storeStrong(&self->_codeHandler, 0);
}

@end
