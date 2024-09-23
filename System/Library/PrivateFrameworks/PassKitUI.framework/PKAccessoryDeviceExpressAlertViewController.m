@implementation PKAccessoryDeviceExpressAlertViewController

- (PKAccessoryDeviceExpressAlertViewController)init
{
  char *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  v2 = -[PKAccessoryDeviceExpressAlertViewController init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)*((_QWORD *)v2 + 132);
    *((_QWORD *)v2 + 132) = v3;

    objc_msgSend(v2, "_registerForExpressTransactionNotifications:", 1);
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginAllowingBacklightRamping:", v2);

    v2[1032] = 1;
    v2[1064] = 0;
    *((_QWORD *)v2 + 134) = 0;
    v2[1080] = 0;
    v2[1048] = 0;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66818]), "initWithDelegate:", v2);
    v7 = (void *)*((_QWORD *)v2 + 138);
    *((_QWORD *)v2 + 138) = v6;

    v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v2 + 1112) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v2 + 1128) = v8;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__paymentDidReceiveSuccessfulTransactionNotification_, *MEMORY[0x1E0D6AD00], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__contactlessInterfaceSessionDidAuthorize_, *MEMORY[0x1E0D69C28], 0);
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__contactlessInterfaceSessionFinishTransaction_, *MEMORY[0x1E0D69C38], 0);

  }
  return (PKAccessoryDeviceExpressAlertViewController *)v2;
}

- (void)dealloc
{
  void *v3;
  CLInUseAssertion *passbookForegroundAssertion;
  CLInUseAssertion *v5;
  CLInUseAssertion *v6;
  dispatch_time_t v7;
  CLInUseAssertion *v8;
  objc_super v9;
  _QWORD block[4];
  CLInUseAssertion *v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PKAccessoryDeviceExpressAlertViewController _registerForExpressTransactionNotifications:](self, "_registerForExpressTransactionNotifications:", 0);
  passbookForegroundAssertion = self->_passbookForegroundAssertion;
  if (passbookForegroundAssertion)
  {
    v5 = passbookForegroundAssertion;
    v6 = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = 0;

    v7 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D6A4D0] * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__PKAccessoryDeviceExpressAlertViewController_dealloc__block_invoke;
    block[3] = &unk_1E3E612E8;
    v11 = v5;
    v8 = v5;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
  -[PKAccessoryDeviceExpressAlertViewController _invalidate](self, "_invalidate");
  v9.receiver = self;
  v9.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[SBUIRemoteAlertServiceViewController dealloc](&v9, sel_dealloc);
}

uint64_t __54__PKAccessoryDeviceExpressAlertViewController_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[PKAccessoryDeviceExpressAlertViewController loadView](&v4, sel_loadView);
  -[PKAccessoryDeviceExpressAlertViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 0);

}

- (void)viewWillLayoutSubviews
{
  PKAccessoryDeviceView *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[PKAccessoryDeviceExpressAlertViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  v3 = self->_accessoryDeviceView;
  -[PKAccessoryDeviceExpressAlertViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PKAccessoryDeviceView setFrame:](v3, "setFrame:");

  -[PKAccessoryDeviceView layoutIfNeeded](v3, "layoutIfNeeded");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  CLInUseAssertion *v7;
  CLInUseAssertion *passbookForegroundAssertion;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[PKAccessoryDeviceExpressAlertViewController viewWillAppear:](&v16, sel_viewWillAppear_);
  if (!self->_passbookForegroundAssertion)
  {
    v5 = (void *)MEMORY[0x1E0C9E3A8];
    PKPassKitCoreBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (CLInUseAssertion *)objc_msgSend(v5, "newAssertionForBundle:withReason:", v6, CFSTR("Passbook displaying UI for field"));
    passbookForegroundAssertion = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = v7;

  }
  if (self->_notificationSuppressionAssertion)
  {
    if (!v3)
      return;
  }
  else
  {
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0D66B80];
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke;
    v13 = &unk_1E3E6F340;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v9, "acquireAssertionOfType:withReason:completion:", 4, CFSTR("Contactless Interface"), &v10);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    if (!v3)
      return;
  }
  -[PKAccessoryDeviceExpressAlertViewController _appearIfNecessary](self, "_appearIfNecessary", v10, v11, v12, v13);
}

void __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke_2;
  block[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  uint64_t v5;
  NSObject *v6;
  id *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Error acquiring notification suppression assertion: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "invalidate");
    }
    else
    {
      v7 = WeakRetained + 128;
      objc_msgSend(WeakRetained[128], "setInvalidationHandler:", 0);
      objc_msgSend(*v7, "invalidate");
      objc_storeStrong(v4 + 128, *(id *)(a1 + 32));
      v8 = *(void **)(a1 + 32);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke_3;
      v9[3] = &unk_1E3E61310;
      objc_copyWeak(&v10, v2);
      objc_msgSend(v8, "setInvalidationHandler:", v9);
      objc_destroyWeak(&v10);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }

}

void __62__PKAccessoryDeviceExpressAlertViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[128];
    WeakRetained[128] = 0;
    v4 = WeakRetained;

    WeakRetained = v4;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[PKAccessoryDeviceExpressAlertViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKAccessoryDeviceExpressAlertViewController _appearIfNecessary](self, "_appearIfNecessary");
  self->_processHomeButtonEvents = 1;
}

- (void)_appearIfNecessary
{
  if (!self->_appeared)
  {
    self->_appeared = 1;
    -[PKAccessoryDeviceView changeToState:](self->_accessoryDeviceView, "changeToState:", self->_accessoryDeviceViewState);
    self->_presentedOnView = 1;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  CLInUseAssertion *passbookForegroundAssertion;
  CLInUseAssertion *v5;
  CLInUseAssertion *v6;
  dispatch_time_t v7;
  CLInUseAssertion *v8;
  _QWORD block[4];
  CLInUseAssertion *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[PKAccessoryDeviceExpressAlertViewController viewDidDisappear:](&v11, sel_viewDidDisappear_, a3);
  passbookForegroundAssertion = self->_passbookForegroundAssertion;
  if (passbookForegroundAssertion)
  {
    v5 = passbookForegroundAssertion;
    v6 = self->_passbookForegroundAssertion;
    self->_passbookForegroundAssertion = 0;

    v7 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D6A4D0] * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PKAccessoryDeviceExpressAlertViewController_viewDidDisappear___block_invoke;
    block[3] = &unk_1E3E612E8;
    v10 = v5;
    v8 = v5;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);

  }
  -[PKAccessoryDeviceExpressAlertViewController _invalidate](self, "_invalidate");
}

uint64_t __64__PKAccessoryDeviceExpressAlertViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)didInvalidateForRemoteAlert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[SBUIRemoteAlertServiceViewController didInvalidateForRemoteAlert](&v3, sel_didInvalidateForRemoteAlert);
  -[PKAccessoryDeviceExpressAlertViewController _invalidate](self, "_invalidate");
  -[PKAccessoryDeviceExpressAlertViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSString *v12;
  NSString *passUniqueIdentifier;
  PKFieldProperties *fieldProperties;
  PKFieldProperties *v15;
  PKFieldProperties *v16;
  void *v17;
  NSArray *v18;
  NSArray *fieldPassUniqueIdentifiers;
  NSString *v20;
  NSUInteger v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSString *v26;
  void *v27;
  PKAccessoryDevice *v28;
  PKAccessoryDevice *accessoryDevice;
  void *v30;
  void *v31;
  PKAccessoryDeviceView *v32;
  PKAccessoryDeviceView *accessoryDeviceView;
  NSArray *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  PKAccessoryDevice *v46;
  PKAccessoryDevice *v47;
  PKAccessoryDeviceView *v48;
  PKAccessoryDeviceView *v49;
  void *v50;
  void *v51;
  id v52;
  void (**v53)(void);
  void *v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void (**v63)(void);
  id v64;
  uint8_t buf[4];
  NSArray *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v53 = (void (**)(void))a4;
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController: configuring with context.", buf, 2u);
  }

  -[PKAccessoryDeviceExpressAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  self->_deviceUILocked = PKDeviceUILocked() != 0;
  objc_msgSend(v55, "setWallpaperStyle:withDuration:", 1, 0.0);
  objc_msgSend(v55, "setLaunchingInterfaceOrientation:", 1);
  objc_msgSend(v55, "setAllowsSiri:", 0);
  objc_msgSend(v55, "setDesiredHardwareButtonEvents:", 16);
  objc_msgSend(v55, "setSwipeDismissalStyle:", 1);
  objc_msgSend(v55, "setDismissalAnimationStyle:", 1);
  if (self->_deviceUILocked)
    objc_msgSend(v55, "setDesiredAutoLockDuration:", 30.0);
  objc_msgSend(v52, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0D6ABD0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  self->_presentationSource = objc_msgSend(v8, "integerValue");

  objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0D6AB68]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_backlightActive = objc_msgSend(v9, "BOOLValue");

  v10 = *MEMORY[0x1E0D6ABD8];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6ABD8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSString *)objc_msgSend(v11, "copy");
  passUniqueIdentifier = self->_passUniqueIdentifier;
  self->_passUniqueIdentifier = v12;

  fieldProperties = self->_fieldProperties;
  self->_fieldProperties = 0;

  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D6AB80]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v54, 0);
    v15 = (PKFieldProperties *)objc_claimAutoreleasedReturnValue();
    v16 = self->_fieldProperties;
    self->_fieldProperties = v15;

  }
  if (self->_fieldProperties)
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6AB78]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (NSArray *)objc_msgSend(v17, "copy");
    fieldPassUniqueIdentifiers = self->_fieldPassUniqueIdentifiers;
    self->_fieldPassUniqueIdentifiers = v18;
  }
  else
  {
    objc_msgSend(v7, "objectForKey:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (NSString *)objc_msgSend(v17, "copy");
    fieldPassUniqueIdentifiers = (NSArray *)self->_passUniqueIdentifier;
    self->_passUniqueIdentifier = v20;
  }

  v21 = -[NSArray count](self->_fieldPassUniqueIdentifiers, "count");
  -[UIViewController pkui_frontMostViewController](self, "pkui_frontMostViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "view");
  v23 = objc_claimAutoreleasedReturnValue();

  v24 = *MEMORY[0x1E0D6AB48];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6AB48]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0D6AB50];
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D6AB50]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = self->_passUniqueIdentifier;
  if (v26)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v66 = (NSArray *)v26;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController: Single pass with PassuniqueID is %@", buf, 0xCu);
    }

    v27 = (void *)v23;
    v28 = (PKAccessoryDevice *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66810]), "initWithDictionary:endpointUUID:", v51, v50);
    accessoryDevice = self->_accessoryDevice;
    self->_accessoryDevice = v28;

    objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "passWithUniqueID:", self->_passUniqueIdentifier);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = -[PKAccessoryDeviceView initWithPass:accessory:cutoutFrame:parentView:]([PKAccessoryDeviceView alloc], "initWithPass:accessory:cutoutFrame:parentView:", v31, self->_accessoryDevice, v23, self->_windowedAccessoryCutoutFrameInScreen.origin.x, self->_windowedAccessoryCutoutFrameInScreen.origin.y, self->_windowedAccessoryCutoutFrameInScreen.size.width, self->_windowedAccessoryCutoutFrameInScreen.size.height);
    accessoryDeviceView = self->_accessoryDeviceView;
    self->_accessoryDeviceView = v32;

    -[PKAccessoryDeviceView setDelegate:](self->_accessoryDeviceView, "setDelegate:", self);
    -[PKAccessoryDeviceView changeToState:](self->_accessoryDeviceView, "changeToState:", self->_accessoryDeviceViewState);

LABEL_22:
    if (v53)
      v53[2]();
    -[PKAccessoryDeviceExpressAlertViewController _dismissIfRestricted](self, "_dismissIfRestricted", v50);
    goto LABEL_25;
  }
  v34 = self->_fieldPassUniqueIdentifiers;
  v35 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v34 || !v21)
  {
    v27 = (void *)v23;
    if (v35)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController: No passuniqueIdentifiers OR fieldpassuniqueidentiers - error", buf, 2u);
    }

    v43 = objc_alloc(MEMORY[0x1E0D66810]);
    objc_msgSend(v7, "objectForKey:", v24);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v25);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (PKAccessoryDevice *)objc_msgSend(v43, "initWithDictionary:endpointUUID:", v44, v45);
    v47 = self->_accessoryDevice;
    self->_accessoryDevice = v46;

    self->_accessoryDeviceViewState = 3;
    v48 = -[PKAccessoryDeviceView initWithState:accessory:cutoutFrame:parentView:]([PKAccessoryDeviceView alloc], "initWithState:accessory:cutoutFrame:parentView:", self->_accessoryDeviceViewState, self->_accessoryDevice, v23, self->_windowedAccessoryCutoutFrameInScreen.origin.x, self->_windowedAccessoryCutoutFrameInScreen.origin.y, self->_windowedAccessoryCutoutFrameInScreen.size.width, self->_windowedAccessoryCutoutFrameInScreen.size.height);
    v49 = self->_accessoryDeviceView;
    self->_accessoryDeviceView = v48;

    -[PKAccessoryDeviceView setDelegate:](self->_accessoryDeviceView, "setDelegate:", self);
    goto LABEL_22;
  }
  v27 = (void *)v23;
  if (v35)
  {
    *(_DWORD *)buf = 138412290;
    v66 = v34;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController Multi Pass Case: Field IDs are %@", buf, 0xCu);
  }

  -[NSArray firstObject](self->_fieldPassUniqueIdentifiers, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D66F08], "sharedInstance");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "passWithUniqueID:", v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_alloc_init(MEMORY[0x1E0D66DB8]);
  objc_initWeak((id *)buf, self);
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __79__PKAccessoryDeviceExpressAlertViewController_configureWithContext_completion___block_invoke;
  v56[3] = &unk_1E3E71988;
  objc_copyWeak(&v64, (id *)buf);
  v40 = v39;
  v57 = v40;
  v41 = v36;
  v58 = v41;
  v59 = v51;
  v60 = v50;
  v42 = v38;
  v61 = v42;
  v62 = v27;
  v63 = v53;
  objc_msgSend(v40, "reloadGroupsWithCompletion:", v56);

  objc_destroyWeak(&v64);
  objc_destroyWeak((id *)buf);

LABEL_25:
}

void __79__PKAccessoryDeviceExpressAlertViewController_configureWithContext_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  PKAccessoryDeviceView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "groupAtIndex:", objc_msgSend(*(id *)(a1 + 32), "groupIndexForPassUniqueID:", *(_QWORD *)(a1 + 40)));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "passCount");
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v4;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "PKAccessoryDeviceExpressAlertViewController: Passgroup has a count of %lu", (uint8_t *)&v13, 0xCu);
    }

    *((_BYTE *)WeakRetained + 1064) = v4 > 1;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D66810]), "initWithDictionary:endpointUUID:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v7 = (void *)*((_QWORD *)WeakRetained + 137);
    *((_QWORD *)WeakRetained + 137) = v6;

    v8 = -[PKAccessoryDeviceView initWithPass:accessory:cutoutFrame:parentView:]([PKAccessoryDeviceView alloc], "initWithPass:accessory:cutoutFrame:parentView:", *(_QWORD *)(a1 + 64), *((_QWORD *)WeakRetained + 137), *(_QWORD *)(a1 + 72), *((double *)WeakRetained + 139), *((double *)WeakRetained + 140), *((double *)WeakRetained + 141), *((double *)WeakRetained + 142));
    v9 = (void *)*((_QWORD *)WeakRetained + 136);
    *((_QWORD *)WeakRetained + 136) = v8;

    objc_msgSend(*((id *)WeakRetained + 136), "setDelegate:", WeakRetained);
    if (*((_BYTE *)WeakRetained + 1064))
    {
      objc_msgSend(*(id *)(a1 + 64), "provisioningCredentialHash");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        *((_QWORD *)WeakRetained + 134) = 2;
    }
    objc_msgSend(*((id *)WeakRetained + 136), "changeToState:", *((_QWORD *)WeakRetained + 134));
    v11 = *(_QWORD *)(a1 + 80);
    if (v11)
      (*(void (**)(void))(v11 + 16))();
    objc_msgSend(WeakRetained, "_dismissIfRestricted");
    if (*((_BYTE *)WeakRetained + 1064))
    {
      objc_msgSend(*(id *)(a1 + 64), "provisioningCredentialHash");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(WeakRetained, "_dismiss");
    }

  }
}

- (void)_invalidate
{
  PKAssertion *notificationSuppressionAssertion;
  void *v4;
  void *v5;
  id staticGlyphResources;
  BSInvalidatable *lockButtonObserver;
  BSInvalidatable *v8;
  SBSAssertion *lockButtonAssertion;
  SBSAssertion *v10;
  void *v11;
  id v12;

  -[PKAssertion invalidate](self->_notificationSuppressionAssertion, "invalidate");
  notificationSuppressionAssertion = self->_notificationSuppressionAssertion;
  self->_notificationSuppressionAssertion = 0;

  -[PKAccessoryDeviceExpressAlertViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", 0);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pkui_resetSharedRootAuthenticationContext");

  staticGlyphResources = self->_staticGlyphResources;
  self->_staticGlyphResources = 0;

  lockButtonObserver = self->_lockButtonObserver;
  if (lockButtonObserver)
  {
    -[BSInvalidatable invalidate](lockButtonObserver, "invalidate");
    v8 = self->_lockButtonObserver;
    self->_lockButtonObserver = 0;

  }
  lockButtonAssertion = self->_lockButtonAssertion;
  if (lockButtonAssertion)
  {
    -[SBSAssertion invalidate](lockButtonAssertion, "invalidate");
    v10 = self->_lockButtonAssertion;
    self->_lockButtonAssertion = 0;

  }
  if (self->_brightnessRampingAllowed)
  {
    +[PKBacklightController sharedInstance](PKBacklightController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endAllowingBacklightRamping:", self);

  }
  -[PKAccessoryDeviceExpressAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

}

- (void)_dismissIfRestricted
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  -[PKAccessoryDeviceExpressAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "lostModeIsActive");

    if (v5)
    {
      PKLogFacilityTypeGetObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing Payment Interface due to Lost Mode", v7, 2u);
      }

      -[PKAccessoryDeviceExpressAlertViewController _dismiss](self, "_dismiss");
    }
  }

}

- (void)_dismissImmediately:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  PKAccessoryDeviceView *accessoryDeviceView;
  id *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  id location;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = *MEMORY[0x1E0DC4878];
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke;
  v15[3] = &unk_1E3E62060;
  v15[4] = &v16;
  v7 = objc_msgSend(v5, "beginBackgroundTaskWithExpirationHandler:", v15);
  v17[3] = v7;

  objc_initWeak(&location, self);
  accessoryDeviceView = self->_accessoryDeviceView;
  if (v3)
  {
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke_2;
    v12[3] = &unk_1E3E719B0;
    v9 = &v13;
    objc_copyWeak(&v13, &location);
    v12[4] = &v16;
    -[PKAccessoryDeviceView dismissViewImmediatelyWithCompletion:](accessoryDeviceView, "dismissViewImmediatelyWithCompletion:", v12);
  }
  else
  {
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke_3;
    v10[3] = &unk_1E3E719B0;
    v9 = &v11;
    objc_copyWeak(&v11, &location);
    v10[4] = &v16;
    -[PKAccessoryDeviceView dismissViewWithCompletion:](accessoryDeviceView, "dismissViewWithCompletion:", v10);
  }
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);
}

void __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;

  v1 = *MEMORY[0x1E0DC4878];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_invalidate");
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);
    WeakRetained = v4;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    WeakRetained = v4;
  }

}

void __67__PKAccessoryDeviceExpressAlertViewController__dismissImmediately___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_invalidate");
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, 0);
    WeakRetained = v4;
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    WeakRetained = v4;
  }

}

- (void)_dismiss
{
  -[PKAccessoryDeviceExpressAlertViewController _dismissImmediately:](self, "_dismissImmediately:", 0);
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_processHomeButtonEvents)
  {
    -[PKAccessoryDeviceExpressAlertViewController _dismiss](self, "_dismiss");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sendResponseWithUnHandledEvents:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "events"));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }

}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  uint8_t v14[16];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  if (-[PKAccessoryDevice isMock](self->_accessoryDevice, "isMock")
    && os_variant_has_internal_ui())
  {
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Overriding window because using mock device", v14, 2u);
    }

    -[PKAccessoryDeviceExpressAlertViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;

    width = v13 + -100.0;
    x = 50.0;
    y = 150.0;
    height = 100.0;
    goto LABEL_7;
  }
  if (v8)
  {
LABEL_7:
    self->_windowedAccessoryCutoutFrameInScreen.origin.x = x;
    self->_windowedAccessoryCutoutFrameInScreen.origin.y = y;
    self->_windowedAccessoryCutoutFrameInScreen.size.width = width;
    self->_windowedAccessoryCutoutFrameInScreen.size.height = height;
    -[PKAccessoryDeviceView setCutoutFrame:](self->_accessoryDeviceView, "setCutoutFrame:", x, y, width, height);
    return;
  }
  -[PKAccessoryDeviceExpressAlertViewController didDetachSleeveAccessory](self, "didDetachSleeveAccessory");
}

- (void)_paymentDidReceiveSuccessfulTransactionNotification:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PKAccessoryDeviceExpressAlertViewController__paymentDidReceiveSuccessfulTransactionNotification___block_invoke;
  block[3] = &unk_1E3E612E8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __99__PKAccessoryDeviceExpressAlertViewController__paymentDidReceiveSuccessfulTransactionNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "_paymentDidReceiveSuccessfulTransactionNotification USERINFO %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_contactlessInterfaceSessionDidAuthorize:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__PKAccessoryDeviceExpressAlertViewController__contactlessInterfaceSessionDidAuthorize___block_invoke;
  block[3] = &unk_1E3E612E8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __88__PKAccessoryDeviceExpressAlertViewController__contactlessInterfaceSessionDidAuthorize___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "_contactlessInterfaceSessionDidAuthorize USERINFO %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_contactlessInterfaceSessionFinishTransaction:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PKAccessoryDeviceExpressAlertViewController__contactlessInterfaceSessionFinishTransaction___block_invoke;
  block[3] = &unk_1E3E612E8;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __93__PKAccessoryDeviceExpressAlertViewController__contactlessInterfaceSessionFinishTransaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_19D178000, v2, OS_LOG_TYPE_DEFAULT, "_contactlessInterfaceSessionFinishTransaction USERINFO %@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)_expressNotificationNames
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D69E20];
  v6[0] = *MEMORY[0x1E0D69E18];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0D69E08];
  v6[2] = *MEMORY[0x1E0D69E00];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0D69DF8];
  v6[4] = *MEMORY[0x1E0D69E10];
  v6[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_registerObserverForNotificationName:(id)a3 center:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredExpressObservers, "objectForKeyedSubscript:", v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v11, 0, 0, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_registeredExpressObservers, "setObject:forKeyedSubscript:", v10, v11);
  }

}

- (void)_registerForExpressTransactionNotifications:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD aBlock[4];
  id v26;
  id location;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__PKAccessoryDeviceExpressAlertViewController__registerForExpressTransactionNotifications___block_invoke;
    aBlock[3] = &unk_1E3E719D8;
    objc_copyWeak(&v26, &location);
    v6 = _Block_copy(aBlock);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[PKAccessoryDeviceExpressAlertViewController _expressNotificationNames](self, "_expressNotificationNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v7);
          -[PKAccessoryDeviceExpressAlertViewController _registerObserverForNotificationName:center:handler:](self, "_registerObserverForNotificationName:center:handler:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), v5, v6);
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v8);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PKAccessoryDeviceExpressAlertViewController _expressNotificationNames](self, "_expressNotificationNames", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_registeredExpressObservers, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_msgSend(v5, "removeObserver:", v16);
            -[NSMutableDictionary removeObjectForKey:](self->_registeredExpressObservers, "removeObjectForKey:", v15);
          }

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
      }
      while (v12);
    }

  }
}

void __91__PKAccessoryDeviceExpressAlertViewController__registerForExpressTransactionNotifications___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__PKAccessoryDeviceExpressAlertViewController__registerForExpressTransactionNotifications___block_invoke_2;
  v5[3] = &unk_1E3E61B68;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __91__PKAccessoryDeviceExpressAlertViewController__registerForExpressTransactionNotifications___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleExpressNotification:", *(_QWORD *)(a1 + 32));

}

- (void)_changeStateIfNecessaryTo:(int64_t)a3
{
  if (self->_accessoryDeviceViewState != a3)
  {
    self->_accessoryDeviceViewState = a3;
    -[PKAccessoryDeviceView changeToState:](self->_accessoryDeviceView, "changeToState:");
    if (a3 == 3)
    {
      AudioServicesPlaySystemSound(0x573u);
    }
    else if ((unint64_t)(a3 - 1) <= 1)
    {
      AudioServicesPlaySystemSound(0x572u);
    }
  }
}

- (void)_handleExpressNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  PKAccessoryDeviceExpressAlertViewController *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  int v35;
  NSObject *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  _BYTE v45[24];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0D69E18];
  v6 = v4;
  v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_7;
  }
  v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_11;
  }
  v9 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v9)
  {
LABEL_7:
    PKLogFacilityTypeGetObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_19D178000, v10, OS_LOG_TYPE_DEFAULT, "Express Transaction has started (No Error)", v45, 2u);
    }

    v11 = self;
    v12 = 0;
    goto LABEL_41;
  }
LABEL_11:
  v13 = (void *)*MEMORY[0x1E0D69E20];
  v14 = v6;
  v15 = v13;
  if (v14 == v15)
  {

    goto LABEL_17;
  }
  v16 = v15;
  if (!v6 || !v15)
  {

    goto LABEL_22;
  }
  v17 = objc_msgSend(v14, "isEqualToString:", v15);

  if (v17)
  {
LABEL_17:
    PKLogFacilityTypeGetObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_19D178000, v18, OS_LOG_TYPE_DEFAULT, "Express Transaction has timed out (No Error) per contract as documented in rdar://36255593 ([Emet] Mercury new express mode transaction events) will show check mark", v45, 2u);
    }

LABEL_20:
    v11 = self;
    v12 = 1;
LABEL_41:
    -[PKAccessoryDeviceExpressAlertViewController _changeStateIfNecessaryTo:](v11, "_changeStateIfNecessaryTo:", v12, *(_QWORD *)v45);
    goto LABEL_42;
  }
LABEL_22:
  v19 = (void *)*MEMORY[0x1E0D69E08];
  v20 = v14;
  v21 = v19;
  if (v20 == v21)
  {

    goto LABEL_28;
  }
  v22 = v21;
  if (!v6 || !v21)
  {

    goto LABEL_31;
  }
  v23 = objc_msgSend(v20, "isEqualToString:", v21);

  if (v23)
  {
LABEL_28:
    PKLogFacilityTypeGetObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      v25 = "Express Transaction has ended in failure (Error)";
LABEL_39:
      _os_log_impl(&dword_19D178000, v24, OS_LOG_TYPE_DEFAULT, v25, v45, 2u);
    }
LABEL_40:

    v11 = self;
    v12 = 3;
    goto LABEL_41;
  }
LABEL_31:
  v26 = (void *)*MEMORY[0x1E0D69E10];
  v27 = v20;
  v28 = v26;
  if (v27 == v28)
  {

    goto LABEL_37;
  }
  v29 = v28;
  if (!v6 || !v28)
  {

    goto LABEL_44;
  }
  v30 = objc_msgSend(v27, "isEqualToString:", v28);

  if (v30)
  {
LABEL_37:
    PKLogFacilityTypeGetObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      v25 = "Express Transaction has ended due to being incompatible (Error)";
      goto LABEL_39;
    }
    goto LABEL_40;
  }
LABEL_44:
  v31 = (void *)*MEMORY[0x1E0D69E00];
  v32 = v27;
  v33 = v31;
  if (v32 == v33)
  {

    goto LABEL_50;
  }
  v34 = v33;
  if (!v6 || !v33)
  {

    goto LABEL_60;
  }
  v35 = objc_msgSend(v32, "isEqualToString:", v33);

  if (v35)
  {
LABEL_50:
    PKLogFacilityTypeGetObject();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_19D178000, v36, OS_LOG_TYPE_DEFAULT, "Express Transaction has ended without incident (No Error)", v45, 2u);
    }

    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_hasMultiple)
        v37 = CFSTR("True");
      else
        v37 = CFSTR("False");
      *(_DWORD *)v45 = 138412290;
      *(_QWORD *)&v45[4] = v37;
      _os_log_impl(&dword_19D178000, v36, OS_LOG_TYPE_DEFAULT, "_handleExpressNotification: _hasMultiple is %@", v45, 0xCu);
    }

    if (self->_hasMultiple)
    {
      v11 = self;
      v12 = 2;
      goto LABEL_41;
    }
    goto LABEL_20;
  }
LABEL_60:
  v38 = (void *)*MEMORY[0x1E0D69DF8];
  v39 = v32;
  v40 = v38;
  if (v39 == v40)
  {

LABEL_66:
    PKLogFacilityTypeGetObject();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      PKAccessoryDeviceViewStateToString(self->_accessoryDeviceViewState);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v45 = 138412290;
      *(_QWORD *)&v45[4] = v44;
      _os_log_impl(&dword_19D178000, v43, OS_LOG_TYPE_DEFAULT, "Express Transaction has exited (No Error) while the state is %@", v45, 0xCu);

    }
    if (self->_accessoryDeviceViewState)
      -[PKAccessoryDeviceExpressAlertViewController _dismiss](self, "_dismiss");
    goto LABEL_42;
  }
  v41 = v40;
  if (!v6 || !v40)
  {

    goto LABEL_42;
  }
  v42 = objc_msgSend(v39, "isEqualToString:", v40);

  if (v42)
    goto LABEL_66;
LABEL_42:

}

- (void)accessoryDeviceDidChangeStateTo:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_accessoryDeviceViewState != a3)
  {
    PKLogFacilityTypeGetObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      PKAccessoryDeviceViewStateToString(a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PKAccessoryDeviceViewStateToString(self->_accessoryDeviceViewState);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "accessoryDeviceDidChangeStateTo %@ and existing state is %@", (uint8_t *)&v8, 0x16u);

    }
    if (a3 == 3)
    {
      self->_accessoryDeviceViewState = 3;
      AudioServicesPlaySystemSound(0x573u);
      -[PKAccessoryDeviceExpressAlertViewController _dismiss](self, "_dismiss");
    }
  }
}

- (void)accessoryDeviceDidReachHardTimeout
{
  NSObject *v3;
  uint8_t v4[16];

  PKLogFacilityTypeGetObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19D178000, v3, OS_LOG_TYPE_DEFAULT, "accessoryDeviceDidReachHardTimeout Hard time out reached dismissing viewcontroller immediately", v4, 2u);
  }

  -[PKAccessoryDeviceExpressAlertViewController _changeStateIfNecessaryTo:](self, "_changeStateIfNecessaryTo:", 3);
  -[PKAccessoryDeviceExpressAlertViewController _dismiss](self, "_dismiss");
}

- (void)didAttachSleeveAccessory:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_accessoryDevice, a3);
  PKLogFacilityTypeGetObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "/Library/Caches/com.apple.xbs/Sources/Wallet_PassKitUI/Framework/PKAccessoryDeviceExpressAlertViewController.m";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "%s - didAttachSleeveAccessory getting called with %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)didDetachSleeveAccessory
{
  PKAccessoryDevice *v3;
  PKAccessoryDevice *accessoryDevice;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  PKAccessoryDevice *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = self->_accessoryDevice;
  accessoryDevice = self->_accessoryDevice;
  self->_accessoryDevice = 0;

  -[PKAccessoryDeviceExpressAlertViewController _dismissImmediately:](self, "_dismissImmediately:", 1);
  PKLogFacilityTypeGetObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "/Library/Caches/com.apple.xbs/Sources/Wallet_PassKitUI/Framework/PKAccessoryDeviceExpressAlertViewController.m";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_19D178000, v5, OS_LOG_TYPE_DEFAULT, "%s - didDetachSleeveAccessory getting called (and removing %@)", (uint8_t *)&v6, 0x16u);
  }

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  v6.receiver = self;
  v6.super_class = (Class)PKAccessoryDeviceExpressAlertViewController;
  -[PKAccessoryDeviceExpressAlertViewController sizeForChildContentContainer:withParentContainerSize:](&v6, sel_sizeForChildContentContainer_withParentContainerSize_, a3, a4.width, a4.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)childViewControllerForStatusBarHidden
{
  return 0;
}

- (id)childViewControllerForStatusBarStyle
{
  return 0;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldPassUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_accessoryDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_accessoryDevice, 0);
  objc_storeStrong((id *)&self->_accessoryDeviceView, 0);
  objc_storeStrong((id *)&self->_registeredExpressObservers, 0);
  objc_storeStrong((id *)&self->_passbookForegroundAssertion, 0);
  objc_storeStrong((id *)&self->_notificationSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonAssertion, 0);
  objc_storeStrong((id *)&self->_lockButtonObserver, 0);
  objc_storeStrong(&self->_staticGlyphResources, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

@end
